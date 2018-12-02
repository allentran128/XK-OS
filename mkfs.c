#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <assert.h>
#include <fcntl.h>
#include <string.h>

typedef unsigned long  ulong;
typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;

#define stat xk_stat  // avoid clash with host struct stat
#include <inc/fs.h>
#include <inc/stat.h>
#include <inc/param.h>

#define SWSIZE (8192 * 4096) // Size of swap, in bytes.

#ifndef static_assert
#define static_assert(a, b) do { switch (0) case 0: case (a): ; } while (0)
#endif

#define IPB (BSIZE / sizeof(struct dinode))
#define CONSOLE 1

// Disk layout:
// [ boot block | sb block | swap | free bit map | inode file start | data blocks ]

int nbitmap = FSSIZE/(BSIZE*8) + 1; // Number of blocks that represent pages
int nmeta;    // Number of meta blocks (boot, sb, nlog, inode, bitmap)
int nblocks;  // Number of data blocks

int fsfd;
struct superblock sb;
char zeroes[BSIZE];
uint freeinode;
uint freeblock;


void balloc(int);
void wsect(uint, void*);
void winode(uint, struct dinode*);
void rinode(uint inum, struct dinode *ip);
void rsect(uint sec, void *buf);
uint ialloc(ushort type);
void iallocblocks(uint inum, int start, int numblks);
void iappend(uint inum, void *p, int n);

// convert to intel byte order
ushort
xshort(ushort x)
{
  ushort y;
  uchar *a = (uchar*)&y;
  a[0] = x;
  a[1] = x >> 8;
  return y;
}

uint
xint(uint x)
{
  uint y;
  uchar *a = (uchar*)&y;
  a[0] = x;
  a[1] = x >> 8;
  a[2] = x >> 16;
  a[3] = x >> 24;
  return y;
}

int
main(int argc, char *argv[])
{
  int i, cc, fd;
  uint inodefileino, inodefileblkn;
  uint rootino, rootdir_size, rootdir_blocks;
  uint inum, off;
  uint inum_count;
  struct dirent de;
  char buf[BSIZE];
  struct dinode din;
  struct dinode *root;

  static_assert(sizeof(int) == 4, "Integers must be 4 bytes!");

  if(argc < 2){
    fprintf(stderr, "Usage: mkfs fs.img files...\n");
    exit(1);
  }

  assert((BSIZE % sizeof(struct dinode)) == 0);
  assert((BSIZE % sizeof(struct dirent)) == 0);

  fsfd = open(argv[1], O_RDWR|O_CREAT|O_TRUNC, 0666);
  if(fsfd < 0){
    perror(argv[1]);
    exit(1);
  }

  // 1 fs block = 1 disk sector
  nmeta = 2 + nbitmap + (SWSIZE/BSIZE) + LOGSIZE;
  nblocks = FSSIZE - nmeta;

  sb.size = xint(FSSIZE);
  sb.nblocks = xint(nblocks);
  sb.swapstart = xint(2);
  sb.logstart = xint(2 + (SWSIZE/BSIZE));
  sb.bmapstart = xint(2 + (SWSIZE/BSIZE) + LOGSIZE); // 3 + swapsize in blocks
  sb.inodestart = xint(2 + (SWSIZE/BSIZE) + LOGSIZE + nbitmap); // 2 + swap size + bitmap size

  printf("nmeta %d (boot, super, bitmap blocks %u) blocks %d total %d\n",
       nmeta, nbitmap, nblocks, FSSIZE);
  freeblock = nmeta;     // the first free block that we can allocate
  for(i = 0; i < FSSIZE; i++)
    wsect(i, zeroes);

  inum_count = argc + 1; // argc - 2 files + 1 inode file + 1 root dir + console
  printf("inum_count %d\n", inum_count);

  inodefileino = ialloc(T_FILE);
  assert(inodefileino == INODEFILEINO);

  // setup inode file data area
  rinode(inodefileino, &din);
  din.data[0].startblkno = sb.inodestart;
  inodefileblkn = inum_count/IPB;
  if (inodefileblkn == 0 || (inum_count * sizeof(struct dinode) % BSIZE))
    inodefileblkn++;
  din.data[0].nblocks = xint(inodefileblkn);
  din.size = xint(inum_count * sizeof(struct dinode));
  winode(inodefileino, &din);

  // these blocks are no longer free
  freeblock += inodefileblkn;

  // now add the root directory
  rootino = ialloc(T_DIR);
  assert(rootino == ROOTINO);

  // argc - 2 directory entries + 2 for '.' and '..'
  rootdir_size = (argc * sizeof(struct dirent));
  rootdir_blocks = rootdir_size / BSIZE + 1;
  if (rootdir_size % BSIZE)
    rootdir_blocks += 1;
  iallocblocks(rootino, freeblock, rootdir_blocks);
  freeblock += rootdir_blocks;
  sb.extentstart = freeblock;

  // write sb to disk
  memset(buf, 0, sizeof(buf));
  memmove(buf, &sb, sizeof(sb));
  wsect(1, buf);

  // appending "." to root
  bzero(&de, sizeof(de));
  de.inum = xshort(rootino);
  strcpy(de.name, ".");
  iappend(rootino, &de, sizeof(de));

  // appending ".." to root
  bzero(&de, sizeof(de));
  de.inum = xshort(rootino);
  strcpy(de.name, "..");
  iappend(rootino, &de, sizeof(de));

  inum = ialloc(T_DEV);
  rinode(inum, &din);
  din.major = xshort(CONSOLE);
  din.minor = xshort(CONSOLE);
  winode(inum, &din);

  bzero(&de, sizeof(de));
  de.inum = xshort(inum);
  strncpy(de.name, "console", DIRSIZ);
  iappend(rootino, &de, sizeof(de));

  // adding rest of the files
  for(i = 2; i < argc; i++){
    char *name = argv[i];

    assert (!strncmp(name, "out/user/", 9));
    name += 9;

    assert(index(name, '/') == 0);

    if((fd = open(argv[i], 0)) < 0){
      perror(argv[i]);
      exit(1);
    }

    // Skip leading _ in name when writing to file system.
    // The binaries are named _rm, _cat, etc. to keep the
    // build operating system from trying to execute them
    // in place of system binaries like rm and cat.
    if(name[0] == '_')
      ++name;

    inum = ialloc(T_FILE);

    bzero(&de, sizeof(de));
    de.inum = xshort(inum);
    strncpy(de.name, name, DIRSIZ);
    iappend(rootino, &de, sizeof(de));

    rinode(inum, &din);
    din.data[0].startblkno = xint(freeblock);
    winode(inum, &din);

    while((cc = read(fd, buf, sizeof(buf))) > 0)
      iappend(inum, buf, cc);

    rinode(inum, &din);
    din.data[0].nblocks = xint(xint(din.size) / BSIZE + (xint(din.size) % BSIZE == 0 ? 0 : 1));
    freeblock += xint(din.data[0].nblocks);
    winode(inum, &din);

		printf("inum: %d name: %s size %d start: %d nblocks: %d\n",
        inum, name, xint(din.size), xint(din.data[0].startblkno), xint(din.data[0].nblocks));
    close(fd);
  }

  // fix size of root inode dir
  rinode(rootino, &din);
  off = xint(din.size);
  off = ((off/BSIZE) + 1) * BSIZE;
  din.size = xint(off);
  winode(rootino, &din);

  rinode(inum, &din);
  printf("inum: %d size %d start: %d nblocks: %d\n",
      inum, xint(din.size), xint(din.data[0].startblkno), xint(din.data[0].nblocks));

  balloc(freeblock);
  sb.freeinode = freeinode;

  exit(0);
}

void
wsect(uint sec, void *buf)
{
  if(lseek(fsfd, sec * BSIZE, 0) != sec * BSIZE){
    perror("lseek");
    exit(1);
  }
  if(write(fsfd, buf, BSIZE) != BSIZE){
    perror("write");
    exit(1);
  }
}

void
winode(uint inum, struct dinode *ip)
{
  char buf[BSIZE];
  uint bn;
  struct dinode *dip;

  bn = xint(sb.inodestart) + (INODEOFF(inum) / BSIZE);
  rsect(bn, buf);
  dip = ((struct dinode*)buf) + (inum % IPB);
  *dip = *ip;
  wsect(bn, buf);
}

void
rinode(uint inum, struct dinode *ip)
{
  char buf[BSIZE];
  uint off, bn;
  struct dinode *dip;

  bn = xint(sb.inodestart) + (INODEOFF(inum) / BSIZE);
  rsect(bn, buf);
  dip = ((struct dinode*)buf) + (inum % IPB);
  *ip = *dip;
}

void
rsect(uint sec, void *buf)
{
  if(lseek(fsfd, sec * BSIZE, 0) != sec * BSIZE){
    perror("lseek");
    exit(1);
  }
  if(read(fsfd, buf, BSIZE) != BSIZE){
    perror("read");
    exit(1);
  }
}

// Needed to create new files?
uint
ialloc(ushort type)
{
  uint inum = freeinode++;
  struct dinode din;

  bzero(&din, sizeof(din));
  din.type = xshort(type);
  din.nlink = xshort(1);
  din.size = xint(0);
  winode(inum, &din);
  return inum;
}

#define min(a, b) ((a) < (b) ? (a) : (b))

void
balloc(int used)
{
  uchar buf[BSIZE];
  int nbuf = 0;
  int i;
  int remaining = used; // # blocks

  printf("balloc: first %d blocks have been allocated\n", used);

  while (remaining > 0) {
    bzero(buf, BSIZE);
    for(i = 0; i < min(remaining, BSIZE*8); i++){
      buf[i/8] |= (0x1 << (i%8));
    }
    printf("balloc: write bitmap block at sector %d\n", sb.bmapstart + nbuf);
    wsect(sb.bmapstart + nbuf, buf);
    nbuf ++;
    remaining -= BSIZE * 8;
  }
}

void
iallocblocks(uint inum, int start, int numblks) {
  struct dinode din;
  rinode(inum, &din);
  din.data[0].startblkno = xint(start);
  din.data[0].nblocks = xint(numblks);
  winode(inum, &din);
}

void
iappend(uint inum, void *xp, int n)
{
  char *p = (char*)xp;
  uint fbn, off, n1;
  struct dinode din;
  char buf[BSIZE];

  rinode(inum, &din);
  // reads root's dinode in
  off = xint(din.size);
  // uses the size of din to find next place to write into data[0[
  printf("append inum %d at off %d sz %d\n", inum, off, n);
  while(n > 0){
    fbn = off / BSIZE;
    // fbn is the block offset
    n1 = min(n, (fbn + 1) * BSIZE - off);
    // n1 determines amount to write
    // case n -> within curr block
    // other case, up until end of block
    rsect(xint(din.data[0].startblkno) + fbn, buf);
    // reads correct block offset of din (root)
    bcopy(p, buf + off - (fbn * BSIZE), n1);
    // src, dst, size
    // appending from p to root's "end of file"
    wsect(xint(din.data[0].startblkno) + fbn, buf);
    // writing changes back to disk
    n -= n1;
    off += n1;
    p += n1;
  }
  din.size = xint(off);
  winode(inum, &din);
}