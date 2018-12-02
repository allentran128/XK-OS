#pragma once
#include <cdefs.h>
#include <file.h>

struct buf;
struct context;
struct extent;
struct inode;
struct proc;
struct rtcdate;
struct spinlock;
struct sleeplock;
struct stat;
struct superblock;
struct mem_region;
struct open_file;
struct trap_frame;
struct dinode;

extern int npages;
extern int pages_in_use;
extern int pages_in_swap;
extern int free_pages;
extern int num_page_faults;
extern int num_disk_reads;

extern int crashn_enable;
extern int crashn;

#define assert(x)		\
	do { if (!(x)) panic("assertion failed"); } while (0)

// bio.c
void            binit(void);
struct buf*     bread(uint, uint);
void            brelse(struct buf*);
void            bwrite(struct buf*);

size_t alloc_extent(size_t);

// console.c
void            consoleinit(void);
void            cprintf(char*, ...);
void            consoleintr(int(*)(void));
noreturn void   panic(char*);

// exec.c
int             exec(char*, char**);


// fs.c
void            readsb(int dev, struct superblock *sb);
int             dirlink(struct inode*, char*, uint);
struct inode*   dirlookup(struct inode*, char*, uint*);
struct inode*   idup(struct inode*);
void            iinit(int dev);
int             init_console_inode(int major, int minor);
void            iload(struct inode*);
void            iput(struct inode*);
void            iupdate(struct inode*);
int             namecmp(const char*, const char*);
struct inode*   namei(char*);
struct inode*   nameiparent(char*, char*);
int             readi(struct inode*, char*, uint, uint);
void            stati(struct inode*, struct stat*);
int             writei(struct inode*, char*, uint, uint);
uint		touch_inode(struct dinode*);

// ide.c
void            ideinit(void);
void            ideintr(void);
void            iderw(struct buf*);

// ioapic.c
void            ioapicenable(int irq, int cpu);
extern uchar    ioapicid;
void            ioapicinit(void);

// kalloc.c
struct core_map_entry*	pa2page(uint64_t pa);
struct core_map_entry* core_map_entry_get(size_t);
void			      detect_memory(void);
char*           kalloc(void);
void            kfree(char*);
void            mem_init(void*);
void            add_phy_mem_map(int, uint64_t, uint64_t);
void   	        remove_phy_mem_map(int, uint64_t, uint64_t);

void core_map_ref_increment(struct core_map_entry*);
void core_map_ref_decrement(struct core_map_entry*);

void acquire_entry_lock();
void release_entry_lock();

// kbd.c
void            kbdintr(void);

// lapic.c
void            cmostime(struct rtcdate *r);
int             cpunum(void);
extern volatile uint*    lapic;
void            lapiceoi(void);
void            lapicinit(void);
void            lapicstartap(uchar, uint);
void            microdelay(int);


// mp.c
extern int      ismp;
void            mpinit(void);

// picirq.c
void            picenable(int);
void            picinit(void);


//PAGEBREAK: 16
// proc.c
void            exit(void);
int             fork(void);
int             growproc(int);
int             kill(int);
void            pinit(void);
void            procdump(void);
noreturn void   scheduler(void);
void            sched(void);
void            sleep(void*, struct spinlock*);
void            userinit(void);
int             wait(void);
void            wakeup(void*);
void            yield(void);
struct mapped_file* find_mapped_file(uint, struct proc**);
void kernel_duplicate_mapped_file(struct proc*, struct proc*);
struct proc* get_proc(int);
struct proc* get_proc_by_ordinal(size_t);
void            reboot(void);


// swtch.S
void            swtch(struct context**, struct context*);

// spinlock.c
void            acquire(struct spinlock*);
void            getcallerpcs(void*, uint64_t*);
int             holding(struct spinlock*);
void            initlock(struct spinlock*, char*);
void            release(struct spinlock*);
void            pushcli(void);
void            popcli(void);

// sleeplock.c
void            acquiresleep(struct sleeplock*);
void            releasesleep(struct sleeplock*);
int             holdingsleep(struct sleeplock*);
void            initsleeplock(struct sleeplock*, char*);

// string.c
int             memcmp(const void*, const void*, uint);
void*           memmove(void*, const void*, uint);
void*           memset(void*, int, uint);
char*           safestrcpy(char*, const char*, int);
int             strlen(const char*);
int             strncmp(const char*, const char*, uint);
char*           strncpy(char*, const char*, int);

// syscall.c
int             argint(int, int*);
int             argint64(int, int64_t*);
int             argptr(int, char**, int);
int             argstr(int, char**);
int             fetchint(uint64_t, int*);
int             fetchint64(uint64_t, int64_t*);
int             fetchstr(uint64_t, char**);
void            syscall(void);


// trap.c
void            idtinit(void);
extern uint     ticks;
void            tvinit(void);
extern struct spinlock tickslock;

// uart.c
void            uartinit(void);
void            uartintr(void);
void            uartputc(int);

// vm.c
void            seginit(void);
void            kvmalloc(void);
pml4e_t*        setupkvm(void);
pte_t*          walkpml4(pml4e_t*, const void*, int);
char*           uva2ka(pml4e_t*, char*);
int             allocuvm(pml4e_t*, char*, uint64_t, uint64_t, int);
int             deallocuvm(pml4e_t*, char*, uint64_t, uint64_t, int);
int             unmapuvm(pml4e_t*, char*, uint64_t, uint64_t, int);
void            freevm(pml4e_t*, int);
void            inituvm(pml4e_t*, char*, int, int);
int             loaduvm(pml4e_t*, char*, struct inode*, uint, uint);
pml4e_t*        copyuvm(pml4e_t *pml4, struct mem_region*, int);
pml4e_t*        copyuvm_shallow(pml4e_t *pml4, struct mem_region*, int);
void            switchuvm(struct proc*);
void            switchkvm(void);
int             copyout(pml4e_t*, uint64_t, void*, uint);
void            initustack(pml4e_t *, struct mem_region*, int);
int             mappages(pml4e_t *, uint64_t, int, uint64_t, int, int);

void            growstack();
void            copy_writable_page(struct proc*, uint64_t, pte_t*);

// number of elements in fixed-size array
#define NELEM(x) (sizeof(x)/sizeof((x)[0]))


// journal.c
void begin_trans();
void log_write(struct buf*);
void commit_trans();
void recover_trans();
void journal_init();
