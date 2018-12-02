#pragma once

#include <sleeplock.h>
#include <extent.h>

// in-memory copy of an inode
struct inode {
  uint dev;           // Device number
  uint inum;          // Inode number
  int ref;            // Reference count (Number of global file table entries holding the inode)
  struct sleeplock lock;
  int flags;          // I_VALID

  short type;         // copy of disk inode
  short major;
  short minor;
  short nlink;
  uint size;
  struct extent data[EXTENTS_PER_INODE];
};

#define I_VALID 0x2

#define CONSOLE 1

#define PIPE_BUF_MAX 2048

typedef int16_t PipeBufOffsetType;

// table mapping major device number to
// device functions
struct devsw {
  int (*read)(struct inode*, char*, int);
  int (*write)(struct inode*, char*, int);
};

enum file_type {
  FILE_UNUSED = 0, // since we init openfiletable with memset 0
  FILE_INODE,
  FILE_PIPE
};

/**
 * This is the struct that lives in the global "file description table". This
 * is the home for things that should be shared by files cloned by dup() or
 * fork(), such as the current offset.
 */
struct file_desc {
  struct inode* inode;
  int curr_offset;
  unsigned short refcount; // # of process-level OFT entries referencing this struct.
};

struct open_file {
  union {
    struct file_desc* file_desc;
    struct pipe* pipe;
  };

  short mode;
  int8_t type; // used to discriminate the union above.
} __packed;

struct pipe {
  char buf[PIPE_BUF_MAX];
  struct spinlock lock;
  PipeBufOffsetType w_offset;
  PipeBufOffsetType r_offset;
  uint8_t w_refcount;
  uint8_t r_refcount;
};

struct mapped_file {
  struct inode* inode;
  struct spinlock lock;
  uint32_t pages;
  uint8_t refcount;
};

extern struct devsw devsw[];

void gftinit(void);

int kernel_sys_dup(int original_fd);
int kernel_sys_read(int fd, char* read_buf, int num_bytes);
int kernel_sys_write(int fd, char* write_buf, int num_bytes);
int kernel_sys_close(int fd);
int kernel_sys_open(char* path, int mode);
int kernel_sys_pipe(int* pipe_fd);
int kernel_mmap(int fd);
int kernel_munmap(int fd);
void kernel_duplicate_open_files(struct open_file[], struct open_file[]);

//PAGEBREAK!
// Blank page.
