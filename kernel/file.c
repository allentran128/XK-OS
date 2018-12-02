//
// File descriptors
//

#include <mmu.h>
#include <cdefs.h>
#include <defs.h>
#include <param.h>
#include <fs.h>
#include <spinlock.h>
#include <sleeplock.h>
#include <file.h>
#include <proc.h>
#include <stat.h>
#include <fcntl.h>
#include <memlayout.h>
#include <buf.h>

struct devsw devsw[NDEV];

struct {
  struct spinlock lock;
  struct file_desc files[NFILE];
} global_files;

extern struct superblock sb;

static short CV_PIPE_DATA_AVAILABLE = 0x1;

// All processes use 2G (top end of stack) to store mem-mapped file contents.
static char* const MAPPED_FILE_VADDR = (char*) SZ_2G;

//
// Internal helpers for kernel file library:
//

static inline bool is_pipe(struct open_file* this_file)
{
  return this_file->type == FILE_PIPE;
}

/**
 * Returns the next available index on the open file table for the given
 * procedure.
 */
static inline size_t next_free_table_index(const struct proc* proc)
{
  // loop over each open_file to find an empty one
  for (size_t i = 0; i < NOFILE; i++) {
    if (proc->open_files[i].type == FILE_UNUSED) {
      return i;
    }
  }

  // open_file table is full
  return -1;
}

/**
 * Locates an available global file table entry, marks it as used,
 * and returns it.
 *
 * Expects global_files.lock to have been acquired.
 */
static struct file_desc* alloc_file_desc()
{
  for (size_t i = 0; i < NFILE; i++) {
    if (global_files.files[i].refcount == 0) {
      global_files.files[i].refcount = 1;
      return &global_files.files[i];
    }
  }

  return NULL;
}

#define MODE_RW (O_WRONLY | O_RDWR)

static bool writable(const short mode)
{
  short rwbits = mode & MODE_RW;
  // (Each of the O_RDONLY, O_WRONLY and O_RDWR flags are mutually exclusive.)
  return rwbits == O_WRONLY || rwbits == O_RDWR;
}

static bool readable(const short mode)
{
  short rwbits = mode & MODE_RW;
  return rwbits == O_RDONLY || rwbits == O_RDWR;
}

static void pipe_dup(struct open_file* this_file)
{
  acquire(&this_file->pipe->lock);

  if (this_file->mode == O_RDONLY) {
    // incr read ref
    this_file->pipe->r_refcount++;
  } else if (this_file->mode == O_WRONLY) {
    // incr writing ref
    this_file->pipe->w_refcount++;
  }

  release(&this_file->pipe->lock);
}

static int
pipe_read(struct open_file* this_file, char* read_buf, int num_bytes)
{
  struct pipe* pipe = this_file->pipe;
  acquire(&pipe->lock);

  if (this_file->mode != O_RDONLY || pipe->r_refcount <= 0) {
    // does not have permission to read
    release(&pipe->lock);
    return -1;
  }

  while (pipe->r_offset == pipe->w_offset) {
    if (pipe->w_refcount == 0) {
      // Everything has been read, there are no writers, and there's no way for
      // another writer to join.
      release(&pipe->lock);
      return 0;
    }

    sleep(&CV_PIPE_DATA_AVAILABLE, &pipe->lock);
  }

  int read_bytes = num_bytes;

  if (pipe->r_offset + num_bytes > pipe->w_offset) {
    // read up to what you have
    read_bytes = pipe->w_offset - pipe->r_offset;
  }

  // perform read
  for (int i = 0; i < read_bytes; i++) {
    read_buf[i] = pipe->buf[pipe->r_offset + i];
  }

  // seek r_offset
  pipe->r_offset += read_bytes;

  release(&pipe->lock);
  return read_bytes;
}

static int
pipe_write(struct open_file* this_file, char* write_buf, int num_bytes)
{
  struct pipe* pipe = this_file->pipe;
  acquire(&pipe->lock);

  if (this_file->mode != O_WRONLY || pipe->w_refcount <= 0) {
    release(&pipe->lock);
    return -1;
  }

  if (pipe->w_offset >= PIPE_BUF_MAX) {
    // cannot write anymore
    release(&pipe->lock);
    return -1;
  }

  int written_bytes = num_bytes;

  if (pipe->w_offset + num_bytes >= PIPE_BUF_MAX) {
    // write what you can
    written_bytes = PIPE_BUF_MAX - pipe->w_offset;
  }

  // perform write
  for (int i = 0; i < written_bytes; i++) {
    pipe->buf[pipe->w_offset + i] = write_buf[i];
  }

  // seek w_offset
  pipe->w_offset += written_bytes;

  wakeup(&CV_PIPE_DATA_AVAILABLE);
  release(&pipe->lock);
  return written_bytes;
}

static void
pipe_close(struct open_file* this_file)
{
  acquire(&this_file->pipe->lock);

  if (this_file->mode == O_RDONLY) {
    // decr read ref
    this_file->pipe->r_refcount--;
    // no need to signal writers
  } else if (this_file->mode == O_WRONLY) {
    // decr writing ref
    this_file->pipe->w_refcount--;
    // signal readers
    wakeup(&CV_PIPE_DATA_AVAILABLE);
  }

  bool can_free = this_file->pipe->r_refcount == 0
   && this_file->pipe->w_refcount == 0;

  release(&this_file->pipe->lock);

  if (can_free) {
    kfree((char*) this_file->pipe);
  }
}

//
// "Public" kernel interface functions below.
//

/**
 * Initialize the global open file description table.
 */
void gftinit(void)
{
  initlock(&global_files.lock, "gft_lock");
}

// Needs lock in helper
int
kernel_sys_dup(int fd)
{
  struct proc* this_proc = myproc();
  struct open_file* this_file = &(this_proc->open_files[fd]);

  // get a new fd
  int idx = next_free_table_index(this_proc);
  if (idx == -1) {
    // no more space to open new fd
    return -1;
  }

  // copy over fields
  struct open_file* dup_file = &this_proc->open_files[idx];
  dup_file->type = this_file->type;
  dup_file->mode = this_file->mode;

  if (dup_file->type == FILE_INODE) {
    // They share the pointer in the global file table.
    dup_file->file_desc = this_file->file_desc;

    acquire(&global_files.lock);
    dup_file->file_desc->refcount++;
    release(&global_files.lock);
  } else if (dup_file->type == FILE_PIPE) {
    pipe_dup(this_file);
    dup_file->pipe = this_file->pipe;
  } else {
    assert(false);
  }

  return idx;
}

// Needs lock in helper
int
kernel_sys_read(int fd, char* read_buf, int num_bytes)
{
  struct proc* this_proc = myproc();
  struct open_file* this_file = &this_proc->open_files[fd];

  if (is_pipe(this_file)) {
    return pipe_read(this_file, read_buf, num_bytes);
  } else {
    // inode version

    if (!readable(this_file->mode)) {
      return -1;
    }

    acquiresleep(&this_file->file_desc->inode->lock);

    int read_bytes = readi(this_file->file_desc->inode,
     read_buf, this_file->file_desc->curr_offset, num_bytes);

    if (read_bytes == -1) {
      return -1;
    }

    this_file->file_desc->curr_offset += read_bytes;
    releasesleep(&this_file->file_desc->inode->lock);

    return read_bytes;
  }
}

// Needs lock in helper
int
kernel_sys_write(int fd, char* write_buf, int num_bytes)
{
  struct proc* this_proc = myproc();
  struct open_file* this_file = &this_proc->open_files[fd];

  if (is_pipe(this_file)) {
    return pipe_write(this_file, write_buf, num_bytes);
  } else {
    // inode version

    if (!writable(this_file->mode)) {
      return -1;
    }

    acquiresleep(&this_file->file_desc->inode->lock);

    int written_bytes = writei(this_file->file_desc->inode,
     write_buf, this_file->file_desc->curr_offset, num_bytes);

    if (written_bytes == -1) {
      return -1;
    }

    this_file->file_desc->curr_offset += written_bytes;
    releasesleep(&this_file->file_desc->inode->lock);

    return written_bytes;
  }
}

// Needs lock in helper
int kernel_sys_close(int fd)
{
  struct proc* this_proc = myproc();
  struct open_file* this_file = &this_proc->open_files[fd];

  if (is_pipe(this_file)) {
    pipe_close(this_file);
  } else {
    // A file.

    if (this_proc->mapinfo.mapped_file != NULL && this_proc->mapinfo.fd == fd) {
      // This process has the file mapped. Unmap it first.
      kernel_munmap(fd);
    }

    acquire(&global_files.lock);
    if (--this_file->file_desc->refcount == 0) {
      // Refcount of 0 effectively releases the GFT entry; one less entry
      // holding a pointer to the inode.
      iput(this_file->file_desc->inode);
    }
    release(&global_files.lock);
  }

  // Invalidating type will allow reuse of this file descriptor.
  this_file->type = FILE_UNUSED;
  return 0;
}

// TODO: support creating new files
// when passed in mode=O_CREATE
int kernel_sys_open(char* path, int mode)
{
  struct proc* this_proc = myproc();

  // with this information we can construct a open_file
  int idx = next_free_table_index(this_proc);

  if (idx == -1) {
    return idx;
  }

  struct inode* filei;

  if (mode & O_CREATE) {
    struct dinode din;
    din.type = T_FILE;
    din.nlink = 1;
    din.size = 0;
    for(int i = 0; i < 4; i++) {
      din.data[i].startblkno = 0;
      din.data[i].nblocks = 0;
    }
    // write dinode to inode file
    struct dirent de;
    de.inum = touch_inode(&din);
    strncpy(de.name, path, DIRSIZ);

    // get block no for root.data[0]
    struct buf* buf = bread(ROOTDEV, sb.inodestart);
    struct dinode* rootino = (struct dinode*) (buf->data + sizeof(struct dinode));
    size_t rootblkno = rootino->data[0].startblkno;
    brelse(buf);

    // append de to root [WORKING]
    begin_trans();
    buf = bread(ROOTDEV, rootblkno);
    memmove(buf->data + (de.inum * sizeof(struct dirent)), &de, sizeof(struct dirent));
    log_write(buf);
    brelse(buf);
    commit_trans();

    // open file via inode layer
    char newpath[DIRSIZ];

    newpath[0] = '/';
    strncpy(newpath+1, path, DIRSIZ - 1);


    filei = namei(newpath);

    if (filei == NULL) {
      return -1;
    }

    iload(filei);
  } else {
    // open file via inode layer
    filei = namei(path);

    if (filei == NULL) {
      return -1;
    }

    iload(filei);
  }

  // populating the proc's file table
  acquire(&global_files.lock);

  struct file_desc* file_desc = alloc_file_desc();

  if (file_desc == NULL) {
    // No more space in global file table.
    release(&global_files.lock);
    return -1;
  }

  file_desc->inode = filei;
  file_desc->curr_offset = 0;

  release(&global_files.lock);

  // set fields of file
  struct open_file* opened_file_slot = &this_proc->open_files[idx];
  opened_file_slot->type = FILE_INODE;
  opened_file_slot->mode = (mode & ~O_CREATE);
  opened_file_slot->file_desc = file_desc;


  // we return the idx (newly opened file descriptor)
  return idx;
}

int kernel_sys_pipe(int* pipe_fd)
{
  struct proc* this_proc = myproc();

  // Need to acquire 2 free fds
  int read_idx = next_free_table_index(this_proc);
  struct open_file* read_file;
  if (read_idx != -1) {
    // init read fd
    read_file = &this_proc->open_files[read_idx];
    read_file->type = FILE_PIPE;
    read_file->mode = O_RDONLY;
  } else {
    return -1;
  }

  int write_idx = next_free_table_index(this_proc);
  struct open_file* write_file;
  if (write_idx != -1) {
    write_file = &this_proc->open_files[write_idx];
    write_file->type = FILE_PIPE;
    write_file->mode = O_WRONLY;
  } else {
    read_file->type = FILE_UNUSED;
    return -1;
  }

  // init pipe
  struct pipe* shared_pipe = (struct pipe*) kalloc();
  if (shared_pipe != NULL) {
    initlock(&shared_pipe->lock, "pipe lock");
    shared_pipe->w_offset = 0;
    shared_pipe->r_offset = 0;
    shared_pipe->w_refcount = 1;
    shared_pipe->r_refcount = 1;

    read_file->pipe = shared_pipe;
    write_file->pipe = shared_pipe;
    pipe_fd[0] = read_idx;
    pipe_fd[1] = write_idx;
    return 0;
  } else {
    // kalloc failed
    read_file->type = FILE_UNUSED;
    write_file->type = FILE_UNUSED;
    return -1;
  }
}

/**
 * Given a source open file table, duplicates every entry into the destination
 * open file table. Ref counts are incremented as appropriate.
 */
void kernel_duplicate_open_files(
 struct open_file source_table[], struct open_file dest_table[])
{
  for (int i = 0; i < NOFILE; ++i) {
    struct open_file* source = &source_table[i];
    struct open_file* dest = &dest_table[i];

    // Copy verbatim the record contents and increment any necessary reference
    // counts.
    *dest = *source;

    if (dest->type == FILE_INODE) {
      acquire(&global_files.lock);
      dest->file_desc->refcount++;
      release(&global_files.lock);
    } else if (dest->type == FILE_PIPE) {
      pipe_dup(dest);
    }
  }
}

int kernel_mmap(int fd)
{
  struct proc* proc = myproc();

  if (proc->mapinfo.mapped_file != NULL) {
    // Already has a mapped file.
    return -1;
  }

  struct open_file* file = &proc->open_files[fd];

  if (file->type != FILE_INODE) {
    // Not open, or not a regular file.
    return -1;
  }

  struct inode* inode = file->file_desc->inode;
  struct proc* mapping_proc;
  struct mapped_file* existing_mapped_file =
   find_mapped_file(inode->inum, &mapping_proc);
  struct mapped_file* mapped_file;

  if (existing_mapped_file == NULL) {
    // Establish initial mapping of this file.
    mapped_file = (struct mapped_file*) kalloc();
    mapped_file->inode = inode;
    mapped_file->refcount = 1;
    initlock(&mapped_file->lock, "mapped_file");

    if (inode->size > 0) {
      mapped_file->pages = (inode->size / PGSIZE) + 1;

      // Allocate the mappings and physical pages, and then we can simply read
      // into MAPPED_FILE_VADDR since it has the illusion of being contiguous.

      if (allocuvm(proc->pml4, MAPPED_FILE_VADDR, 0, inode->size, proc->pid) < 0) {
        kfree((char*) mapped_file);
        return -1;
      }

      if (readi(inode, MAPPED_FILE_VADDR, 0, inode->size) != inode->size) {
        kfree((char*) mapped_file);
        return -1;
      }
    } else {
      // Unlikely, but possible.
      mapped_file->pages = 0;
    }
  } else {
    // Share existing open file mapping.
    mapped_file = mapping_proc->mapinfo.mapped_file;
    kernel_duplicate_mapped_file(mapping_proc, proc);
  }

  proc->mapinfo.mapped_file = mapped_file;
  proc->mapinfo.fd = fd;

  return inode->size;
}

int kernel_munmap(int fd)
{
  struct proc* proc = myproc();

  if (proc->mapinfo.mapped_file == NULL || proc->mapinfo.fd != fd) {
    return -1;
  }

  struct mapped_file* mapped_file = proc->mapinfo.mapped_file;

  acquire(&mapped_file->lock);
  bool should_cleanup = (0 == --mapped_file->refcount);
  release(&mapped_file->lock);

  if (should_cleanup) {
    // Unmap the memory for this process AND free phys mem.
    deallocuvm(proc->pml4, MAPPED_FILE_VADDR,
     mapped_file->inode->size, 0, proc->pid);

    kfree((char*) mapped_file);
  } else {
    // Just unmap the memory for this process.
    unmapuvm(proc->pml4, MAPPED_FILE_VADDR,
     mapped_file->inode->size, 0, proc->pid);
  }

  proc->mapinfo.mapped_file = NULL;
  return 0;
}
