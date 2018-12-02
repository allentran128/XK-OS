#include <cdefs.h>
#include <defs.h>
#include <param.h>
#include <memlayout.h>
#include <mmu.h>
#include <x86_64.h>
#include <proc.h>
#include <spinlock.h>
#include <trap.h>
#include <fs.h>
#include <file.h>
#include <buf.h>

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

size_t extent_size = 0;
extern struct superblock sb;

void calc_extent_size()
{
  size_t bitmap_blocks = sb.inodestart - sb.bmapstart;
  extent_size = 0;

  for (int i = 0; i < bitmap_blocks; i++) {
    struct buf* buf = bread(ROOTDEV, sb.bmapstart + i);

    for (int j = 0; j < BSIZE; j++) { // for each byte
      for (int k = 0; k < 8; k++) { // for each bit
        if ((0x1 << (7 - k)) & buf->data[j]) {
          extent_size++;
        } else {
          brelse(buf);
          return;
        }
      }
    }
    brelse(buf);
  }
}


void reboot(void)
{
    uint8_t good = 0x02;
    while (good & 0x02)
        good = inb(0x64);
    outb(0x64, 0xFE);
loop:
    asm volatile ("hlt");
    goto loop;
}

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

static char* const MAPPED_FILE_VADDR = (char*) SZ_2G;

/**
 * Searches active processes for an instance of the given inode number.
 * Returns the mapped file info, or NULL if no process has mapped that file.
 * Also optionally returns process holding it via output param.
 *
 * Acquires ptable lock.
 */
struct mapped_file* find_mapped_file(uint inum, struct proc** pproc)
{
  struct mapped_file* mapped_file = NULL;
  acquire(&ptable.lock);

  for (int i = 0; i < NPROC; i++) {
    struct proc* proc = &ptable.proc[i];
    if (proc->state != UNUSED
     && proc->mapinfo.mapped_file != NULL
     && proc->mapinfo.mapped_file->inode->inum == inum) {
      mapped_file = proc->mapinfo.mapped_file;

      if (pproc != NULL) {
        *pproc = proc;
      }

      break;
    }
  }

  release(&ptable.lock);
  return mapped_file;
}

/**
 * Duplicates the current mapped file from the given source proc to the given
 * dest proc.
 */
void kernel_duplicate_mapped_file(struct proc* source, struct proc* dest)
{
  if (source->mapinfo.mapped_file == NULL) {
    // This won't work.
    return;
  }

  struct mapped_file* mapped_file = source->mapinfo.mapped_file;

  acquire(&mapped_file->lock);
  ++mapped_file->refcount;
  release(&mapped_file->lock);

  // Use source proc to calculate physical address, then map each physical
  // page into the dest proc.
  for (int i = 0; i < mapped_file->pages; ++i) {
    char* v_offset = (char*) MAPPED_FILE_VADDR + (i * PGSIZE);
    char* phys = uva2ka(source->pml4, v_offset);

    if (mappages(dest->pml4, PGNUM(v_offset), 1,
          PGNUM(V2P(phys)), PTE_W | PTE_U, dest->pid) == -1) {
      panic("mappages failure");
    }
  }
}

struct proc* get_proc(int pid)
{
  for (struct proc* p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    if (p->pid == pid) {
      return p;
    }
  }

  return NULL;
}

struct proc* get_proc_by_ordinal(size_t i)
{
  return &ptable.proc[i];
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trap_frame*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 8;
  *(uint64_t*)sp = (uint64_t)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->rip = (uint64_t)forkret;

  // Initialize open file table.
  memset(p->open_files, 0, sizeof *p->open_files);
  p->mapinfo.mapped_file = NULL;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_out_initcode_start[], _binary_out_initcode_size[];

  p = allocproc();

  initproc = p;
  if((p->pml4 = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pml4, _binary_out_initcode_start, (int64_t)_binary_out_initcode_size, p->pid);
  p->mem_regions[CODE].start = 0;
  p->mem_regions[CODE].size = PGROUNDUP((int64_t)_binary_out_initcode_size);
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ss = (SEG_UDATA << 3) | DPL_USER;
  p->tf->rflags = FLAGS_IF;
  p->tf->rip = 0;  // beginning of initcode.S
  p->tf->rsp = PGROUNDUP((uint64_t)_binary_out_initcode_size) + 2 * PGSIZE;
  p->mem_regions[USTACK].start = (char*)PGROUNDUP((uint64_t)_binary_out_initcode_size) + PGSIZE;
  p->mem_regions[USTACK].size = PGSIZE;

  safestrcpy(p->name, "initcode", sizeof(p->name));

  // // this assignment to p->state lets other cores
  // // run this process. the acquire forces the above
  // // writes to be visible, and the lock is also needed
  // // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  struct proc* child = allocproc();

  if (child == 0) {
    return -1;
  }

  acquire_entry_lock();

  struct proc* parent = myproc();
  child->parent = parent;

  // Dupe memory regions & VM.
  memmove(child->mem_regions, parent->mem_regions, sizeof(child->mem_regions));

  child->pml4 = copyuvm(parent->pml4, parent->mem_regions, child->pid);

  release_entry_lock();

  if (child->pml4 == 0) {
    // Error copying VM. Place child back into unallocated state.
    kfree(child->kstack);
    acquire(&ptable.lock);
    child->state = UNUSED;
    release(&ptable.lock);
    return -1;
  }

  // Copy trap frame from parent, but overwrite the child's return value to be
  // zero.
  *child->tf = *parent->tf;
  child->tf->rax = 0;
  kernel_duplicate_open_files(parent->open_files, child->open_files);

  if (parent->mapinfo.mapped_file != NULL) {
    // Have the child share the parent's mapped file.
    kernel_duplicate_mapped_file(parent, child);
    child->mapinfo = parent->mapinfo;
  }

  safestrcpy(child->name, parent->name, sizeof(child->name));

  acquire(&ptable.lock);
  child->state = RUNNABLE;
  release(&ptable.lock);

  return child->pid;
}

// Assumes ptable lock is held
void
clean_open_files(struct open_file files[])
{
  for (int i = 0; i < NOFILE; i++) {
    if (files[i].type != FILE_UNUSED) {
      kernel_sys_close(i);
    }
  }
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc* this_proc = myproc();
  clean_open_files(this_proc->open_files);

  if (this_proc->mapinfo.mapped_file != NULL) {
    kernel_munmap(this_proc->mapinfo.fd);
    this_proc->mapinfo.mapped_file = NULL;
  }

  acquire(&ptable.lock);

  this_proc->state = ZOMBIE;
  // Might be exiting due to being killed. Flip that back off.
  this_proc->killed = 0;

  struct proc* this_parent = this_proc->parent;
  if (this_parent->state == UNUSED || this_parent->state == ZOMBIE) {
    this_proc->parent = initproc;
  }

  wakeup1(this_proc->parent);
  sched();

  release(&ptable.lock);
}

// Assumes ptable lock is held
static bool
has_active_children(struct proc* this_proc)
{
  for (int i = 1; i < NPROC; i++) {
    if (ptable.proc[i].parent == this_proc
     && ptable.proc[i].state != UNUSED) {
      return true;
    }
  }
  return false;
}

// Assumes ptable lock is held
static struct proc*
first_zombie_child(struct proc* this_proc)
{
  for (int i = 1; i < NPROC; i++) {
    if (ptable.proc[i].parent == this_proc
        && ptable.proc[i].state == ZOMBIE) {
      return &ptable.proc[i];
    }
  }
  return NULL;
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc* this_proc = myproc();
  acquire(&ptable.lock);

  if (!has_active_children(this_proc)) {
    release(&ptable.lock);
    return -1;
  }

  struct proc* zombie_child;

  while ((zombie_child = first_zombie_child(this_proc)) == NULL) {
    // (We're using the parent proc as a condition variable.)
    sleep(this_proc, &ptable.lock);
  }

  // cleanup zombie's kernel stack
  kfree(zombie_child->kstack);
  zombie_child->kstack = NULL;

  // and dealloc vm.
  int zombie_pid = zombie_child->pid;
  freevm(zombie_child->pml4, zombie_pid);

  // set proc table to unused
  zombie_child->state = UNUSED;

  release(&ptable.lock);
  return zombie_pid;
}


//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;

  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      mycpu()->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      swtch(&mycpu()->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      mycpu()->proc = 0;
    }
    release(&ptable.lock);

  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1) {
    cprintf("pid : %d\n", myproc()->pid);
    cprintf("ncli : %d\n", mycpu()->ncli);
    cprintf("intena : %d\n", mycpu()->intena);

    panic("sched locks");
  }
  if(myproc()->state == RUNNING)
    panic("sched running");
  if(readeflags()&FLAGS_IF)
    panic("sched interruptible");

  intena = mycpu()->intena;
  swtch(&myproc()->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}


// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}


// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);

    if (extent_size == 0) {
      calc_extent_size();
    }
    recover_trans(); // Recover any failed journaled FS transaction.
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(myproc() == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  myproc()->chan = chan;
  myproc()->state = SLEEPING;
  sched();

  // Tidy up.
  myproc()->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    = "unused",
  [EMBRYO]    = "embryo",
  [SLEEPING]  = "sleep ",
  [RUNNABLE]  = "runble",
  [RUNNING]   = "run   ",
  [ZOMBIE]    = "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint64_t pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state != 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint64_t*)p->context->rbp, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }

    // Print file table:
    cprintf("\n\nOpen file table:\n");

    for (int descriptor = 0; descriptor < NOFILE; descriptor++) {
      struct open_file* file = &p->open_files[descriptor];

      if (file->type == FILE_UNUSED) {
        cprintf("   %d: (unused)\n", descriptor);
      } else if (file->type == FILE_INODE) {
        struct inode* inode = file->file_desc->inode;
        cprintf("   %d: {dev=%d inum=%d ref=%d flags=%d type=%d} offset=%d mode=0x%x\n",
         descriptor, inode->dev, inode->inum, inode->ref, inode->flags, inode->type,
         file->file_desc->curr_offset, file->mode);
      } else if (file->type == FILE_PIPE) {
        struct pipe* pipe = file->pipe;
        cprintf("   %d: PIPE={w_off=%d r_off=%d w_refcount=%d r_refcount=%d} mode=0x%x\n",
         descriptor, pipe->w_offset, pipe->r_offset, pipe->w_refcount, pipe->r_refcount,
         file->mode);
      }
    }

    cprintf("\n");
  }
}

struct proc *
findproc(int pid) {
  struct proc *p;
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if (p->pid == pid)
      return p;
  }
  return 0;
}

