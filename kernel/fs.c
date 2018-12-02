// File system implementation.  Five layers:
//   + Blocks: allocator for raw disk blocks.
//   + Files: inode allocator, reading, writing, metadata.
//   + Directories: inode with special contents (list of other inodes!)
//   + Names: paths like /usr/rtm/xk/fs.c for convenient naming.
//
// This file contains the low-level file system manipulation
// routines.  The (higher-level) system call implementations
// are in sysfile.c.

#include <cdefs.h>
#include <defs.h>
#include <param.h>
#include <stat.h>
#include <mmu.h>
#include <proc.h>
#include <spinlock.h>
#include <sleeplock.h>
#include <fs.h>
#include <buf.h>
#include <file.h>

// there should be one superblock per disk device, but we run with
// only one device
struct superblock sb;

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
}


// Inodes.
//
// An inode describes a single unnamed file.
// The inode disk structure holds metadata: the file's type,
// its size, the number of links referring to it, and the
// range of blocks holding the file's content.
//
// The inodes themselves are contained in a file known as the
// inodefile. This allows the number of inodes to grow dynamically
// appending to the end of the inode file. The inodefile has an
// inum of 1 and starts at sb.startinode.
//
// The kernel keeps a cache of in-use inodes in memory
// to provide a place for synchronizing access
// to inodes used by multiple processes. The cached
// inodes include book-keeping information that is
// not stored on disk: ip->ref and ip->flags.
//
// Since there is no writing to the file system there is no need
// for the callers to worry about coherence between the disk
// and the in memory copy, although that will become important
// if writing to the disk is introduced.
//
// Clients use iload() to populate an inode with valid information
// from the disk. idup() can be used to add an in memory reference
// to and inode. iput() will decrement the in memory reference count
// and will free the inode if there are no more references to it,
// freeing up space in the cache for the inode to be used again.

static void init_inodefile(int dev);

struct {
  struct spinlock lock;
  struct inode inode[NINODE];
  struct inode inodefile;
} icache;

void
iinit(int dev)
{
  int i = 0;

  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  initsleeplock(&icache.inodefile.lock, "inodefile");

  readsb(dev, &sb);
  cprintf("sb: size %d nblocks %d bmap start %d inodestart %d extentstart: %d\n",
     sb.size, sb.nblocks, sb.bmapstart, sb.inodestart, sb.extentstart);

  init_inodefile(dev);
}

// Find the inode file on the disk and load it into memory
// should only be called once, but is idempotent.
static void
init_inodefile(int dev) {
  struct buf *b;
  struct dinode di;

  acquiresleep(&icache.inodefile.lock);
  b = bread(dev, sb.inodestart);
  memmove(&di, b->data, sizeof(struct dinode));

  icache.inodefile.inum = INODEFILEINO;
  icache.inodefile.dev = dev;
  icache.inodefile.type = di.type;
  icache.inodefile.major = di.major;
  icache.inodefile.minor = di.minor;
  icache.inodefile.nlink = di.nlink;
  icache.inodefile.size = di.size;

  memmove(icache.inodefile.data, di.data, sizeof(di.data));

  brelse(b);
  releasesleep(&icache.inodefile.lock);
}


//PAGEBREAK!
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not read
// the inode from from disk.
static struct inode*
iget(uint dev, uint inum)
{
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}

static void
read_dinode(uint inum, struct dinode* dip)
{
  acquiresleep(&icache.inodefile.lock);
  readi(&icache.inodefile, (char *)dip, INODEOFF(inum), sizeof(*dip));
  releasesleep(&icache.inodefile.lock);
}

uint
touch_inode(struct dinode* dinode)
{
  acquiresleep(&icache.inodefile.lock);

  struct dinode inodefileino;
  readi(&icache.inodefile, (char*) &inodefileino, INODEOFF(0), sizeof(struct dinode));

  // load in correct block (root) to append to
  uint off = inodefileino.size;
  uint inum = off / sizeof(struct dinode);

  //int j = 0;
  //while (off >= inodefileino.data[j].nblocks * BSIZE) {
  //  off -= inodefileino.data[j].nblocks * BSIZE;
  //  j++;
  //  cprintf("new offset = %d into block no %d with space = %d\n", off, j, inodefileino.data[j].nblocks * BSIZE);
  //  if (inodefileino.data[j].nblocks == 0) {
  //    cprintf("alloc 2 blocks to inode file\n");
  //    inodefileino.data[j].startblkno = alloc_extent(2);
  //    inodefileino.data[j].nblocks = 2;
  //  }
  //}

  //int inode_data_blkn = inodefileino.data[j].startblkno + (off / BSIZE);
  //off = off % BSIZE;

  // update size via buffer

  begin_trans();
  struct buf* buf = bread(ROOTDEV, sb.inodestart);
  struct dinode* inodefile = (struct dinode*) buf->data;
  size_t inodeblkno = inodefile->data[0].startblkno + (off / BSIZE);


  if (inodefile->size != inodefileino.size)
    panic("not the same inode file!");
  inodefile->size += sizeof(struct dinode);
  //inodefileino.size += sizeof(struct dinode);
  icache.inodefile.size = inodefile->size;
  log_write(buf);
  brelse(buf);

  // edit inodefile
  // manual write to inodefile
  buf = bread(ROOTDEV, inodeblkno);
  struct dinode* placeholder = (struct dinode*)(buf->data + (off % BSIZE));
  memmove(placeholder, dinode, sizeof(struct dinode));
  log_write(buf);
  brelse(buf);
  commit_trans();

  releasesleep(&icache.inodefile.lock);
  return inum;
}

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
  ip->ref++;
  release(&icache.lock);
  return ip;
}

// Reads the inode from disk if necessary.
void
iload(struct inode *ip)
{
  struct dinode dip;

  if(ip == 0 || ip->ref < 1)
    panic("iload");

  if(!(ip->flags & I_VALID)){
    read_dinode(ip->inum, &dip);
    ip->type = dip.type;
    ip->major = dip.major;
    ip->minor = dip.minor;
    ip->nlink = dip.nlink;
    ip->size = dip.size;
    memmove(ip->data, dip.data, sizeof(dip.data));
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("iload: no type");
  }
}

// Drop a reference to an in-memory inode.
// If that was the last reference, the inode cache entry can
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    ip->type = 0;
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
  st->dev = ip->dev;
  st->ino = ip->inum;
  st->type = ip->type;
  st->nlink = ip->nlink;
  st->size = ip->size;
}

/* Take the contiguous block index blockno and look up the corresponding on-disk block.
 * Allocate new extents w/ 4 blocks apiece as needed.
 */
uint lookup_block(struct inode* ip, uint blockno)
{
  uint alloced_blocks = 0;
  int i;
  uint remain = blockno;

  for (i = 0; i < EXTENTS_PER_INODE; i++) {
    if (ip->data[i].nblocks != 0) {
      if (remain < ip->data[i].nblocks) {
        return ip->data[i].startblkno + remain;
      } else {
        remain -= ip->data[i].nblocks;
      }

      alloced_blocks += ip->data[i].nblocks;
    } else {
      break;
    }
  }

  while (alloced_blocks < blockno + 1) {
    if (i >= EXTENTS_PER_INODE) {
      panic("welp, allocing extent beyond capacity.");
    }

    uint start = alloc_extent(4);
    ip->data[i].startblkno = start;
    ip->data[i].nblocks = 4;
    alloced_blocks += 4;

    if (blockno < alloced_blocks) {
      return start + remain;
    }

    remain -= 4;
    i++;
  }

  assert(false);
}

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, lookup_block(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }

  return n;
}

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  uint tot, m;
  struct buf* buf;

  if(off > ip->size || off + n < off)
    return -1;

  begin_trans();

  for (tot=0; tot<n; tot+=m, off+=m, src+=m){
    buf = bread(ip->dev, lookup_block(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(buf->data + off%BSIZE, src, m);
    log_write(buf);
    brelse(buf);
 }

  // update inode's size field
  buf = bread(ROOTDEV, sb.inodestart);
  struct dinode* inodefile = (struct dinode*) buf->data;
  size_t blkno = inodefile->data[0].startblkno + ((ip->inum * sizeof(struct dinode)) / BSIZE);
  brelse(buf);

  buf = bread(ROOTDEV, blkno);
  struct dinode* file = (struct dinode*) (buf->data + ((ip->inum * sizeof(struct dinode)) % BSIZE));
  file->size += n;
  ip->size += n;
  for (int i = 0; i < 4; i++) {
    file->data[i].startblkno = ip->data[i].startblkno;
    file->data[i].nblocks = ip->data[i].nblocks;
  }
  log_write(buf);
  brelse(buf);
  commit_trans();
  return n;
}

//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
}

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
      // entry matches path element
      if(poff)
        *poff = off;
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
}


//PAGEBREAK!
// Paths

// Copy the next path element from path into name.
// Return a pointer to the element following the copied one.
// The returned path has no leading slashes,
// so the caller can check *path=='\0' to see if the name is the last one.
// If no name to remove, return 0.
//
// Examples:
//   skipelem("a/bb/c", name) = "bb/c", setting name = "a"
//   skipelem("///a//bb", name) = "bb", setting name = "a"
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
    path++;
  return path;
}

// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(namei("/"));

  while((path = skipelem(path, name)) != 0){
    iload(ip);
    if(ip->type != T_DIR){
      iput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iput(ip);
      return 0;
    }
    iput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}

struct inode*
namei(char *path)
{
  char name[DIRSIZ];
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
}
