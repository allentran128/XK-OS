//
// File-system system calls.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//

#include <cdefs.h>
#include <defs.h>
#include <param.h>
#include <stat.h>
#include <mmu.h>
#include <proc.h>
#include <fs.h>
#include <spinlock.h>
#include <sleeplock.h>
#include <file.h>
#include <fcntl.h>

static inline bool bounds_check(int fd)
{
  return fd < 0 || fd >= NOFILE;
}

static inline bool in_use(struct open_file* this_file)
{
  return this_file->type != FILE_UNUSED;
}

int
sys_dup(void)
{
  int original_fd;

  if (argint(0, &original_fd) < 0) {
    return -1;
  }

  if (bounds_check(original_fd)) {
    return -1;
  }

  struct proc* this_proc = myproc();
  struct open_file* this_file = &(this_proc->open_files[original_fd]);

  if (in_use(this_file)) {
    return kernel_sys_dup(original_fd);
  } else {
    // error, fd is not valid for dup
    return -1;
  }
}

int
sys_read(void)
{
  int fd;
  int num_bytes;
  char* read_buf;

  if (argint(0, &fd) < 0
        || argint(2, &num_bytes) < 0
        || argptr(1, &read_buf, num_bytes) < 0) {
    return -1;
  }

  if (bounds_check(fd)) {
    return -1;
  }

  struct proc* this_proc = myproc();
  struct open_file* this_file = &(this_proc->open_files[fd]);

  if (in_use(this_file)) {
    return kernel_sys_read(fd, read_buf, num_bytes);
  } else {
    return -1;
  }
}

int
sys_write(void)
{
  // you have to change the code in this function.
  // Currently it supports printing one character to screen
  int fd;
  int num_bytes;
  char * write_buf;

  if (argint(0, &fd) < 0
      || argint(2, &num_bytes) < 0
      || argptr(1, &write_buf, num_bytes) < 0) {
    return -1;
  }

  if (bounds_check(fd)) {
      return -1;
  }

  struct proc* this_proc = myproc();
  struct open_file* this_file = &(this_proc->open_files[fd]);

  if(in_use(this_file)) {
    return kernel_sys_write(fd, write_buf, num_bytes);
  } else {
    return -1;
  }
}

int
sys_close(void)
{
  int fd;

  if (argint(0, &fd) < 0) {
    return -1;
  }

  if (bounds_check(fd)) {
      return -1;
  }

  struct proc* this_proc = myproc();
  struct open_file* this_file = &(this_proc->open_files[fd]);

  if (in_use(this_file)) {
    return kernel_sys_close(fd);
  } else {
    return -1;
  }
}

int
sys_fstat(void)
{
  int fd;
  struct stat *st;

  if (argint(0, &fd) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0) {
    return -1;
  }

  if (fd >= NOFILE) {
    return -1;
  }

  // TODO: Move innards to file.c

  struct proc* proc = myproc();
  struct open_file *f = &proc->open_files[fd];

  if (f->type == FILE_UNUSED) {
    return -1;
  } else if (f->type == FILE_INODE) {
    struct inode* inode = f->file_desc->inode;
    iload(inode);
    stati(inode, st);
    return 0;
  }

  return -1;
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
  return -1;
}


//PAGEBREAK!
int
sys_unlink(void)
{
  return -1;
}


int
sys_open(void)
{
  char* path;
  int mode;

  if (argstr(0, &path) < 0 || argint(1, &mode) < 0)
  {
    return -1;
  }

  return kernel_sys_open(path, mode);
}

int
sys_mkdir(void)
{
  return -1;
}

int
sys_mknod(void)
{
  return -1;
}

int
sys_chdir(void)
{
  return -1;
}

int
sys_exec(void)
{
  char* path;
  char* args;

  if (argstr(0, &path) < 0
      || argptr(1, &args, 8) < 0) {
    return -1;
  }

  return exec(path, (char**)args);
}

int
sys_pipe(void)
{
  int * pipe_fd;

  if (argptr(0, (char **) &pipe_fd, 2 * sizeof(int)) < 0)
  {
    return -1;
  }

  return kernel_sys_pipe(pipe_fd);
}

int
sys_mmap(void)
{
  int fd;

  if (argint(0, &fd) < 0) {
    return -1;
  }

  if (fd < 0 || fd >= NOFILE) {
    return -1;
  }

  return kernel_mmap(fd);
}

int
sys_munmap(void)
{
  int fd;

  if (argint(0, &fd) < 0) {
    return -1;
  }

  if (fd < 0 || fd >= NOFILE) {
    return -1;
  }

  return kernel_munmap(fd);
}
