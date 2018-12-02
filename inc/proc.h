#pragma once
#include <segment.h>
#include <param.h>
#include <defs.h>

// Per-CPU state
struct cpu {
  uchar apicid;                // Local APIC ID
  struct context *scheduler;   // swtch() here to enter scheduler
  struct tss ts;               // Used by x86 to find stack for interrupt
  struct segdesc gdt[NSEGS];   // x86 global descriptor table
  volatile uint started;       // Has the CPU started?
  int ncli;                    // Depth of pushcli nesting.
  int intena;                  // Were interrupts enabled before pushcli?

  struct cpu *cpu;
  struct proc *proc;
};

extern struct cpu cpus[NCPU];
extern int ncpu;

// Per-CPU variables, holding pointers to the
// current cpu and to the current process.
// The asm suffix tells gcc to use "%gs:0" to refer to cpu
// and "%gs:4" to refer to proc.  seginit sets up the
// %gs segment register so that %gs refers to the memory
// holding those two variables in the local cpu's struct cpu.
// This is similar to how thread-local variables are implemented
// in thread libraries such as Linux pthreads.

// static inline struct cpu *
static struct cpu *
mycpu(void)
{
  // uint64_t val;
  // __asm volatile("movq %%gs:0, %0" : "=r" (val));
  // if (val != 0xffffffff8019a780) {
  //   while (1) {}
  // }
  // return (struct cpu *)val;

  // struct cpu* c = &cpus[cpunum()];
  // return c;

  // single-core for now
  return &cpus[0];
}

static inline struct proc *
myproc(void)
{
  // uint64_t val;
  // __asm volatile("movq %%gs:8, %0" : "=r" (val));
  // return (struct proc *)val;
  return mycpu()->proc;
}

//PAGEBREAK: 17
// Saved registers for kernel context switches.
// Don't need to save all the segment registers (%cs, etc),
// because they are constant across kernel contexts.
// Don't need to save %eax, %ecx, %edx, because the
// x86 convention is that the caller has saved them.
// Contexts are stored at the bottom of the stack they
// describe; the stack pointer is the address of the context.
// The layout of the context matches the layout of the stack in swtch.S
// at the "Switch stacks" comment. Switch doesn't save eip explicitly,
// but it is on the stack and allocproc() manipulates it.
struct context {
  uint64_t r15;
  uint64_t r14;
  uint64_t r13;
  uint64_t r12;
  uint64_t r11;
  uint64_t rbx;
  uint64_t rbp;
  uint64_t rip;
};

enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

struct mem_region {
  char *start;
  uint64_t size;
};

enum mem_region_enum { CODE, HEAP, USTACK};

// Per-process state
struct proc {
  pml4e_t* pml4;               // Page table
  struct mem_region mem_regions[3];      // Memeory regions
  struct open_file open_files[NOFILE]; // Open file table.

  struct {
    struct mapped_file* mapped_file;
    int fd;
  } mapinfo;                   // holds info about a currently mapped file.

  char* kstack;                // Kernel stack
  enum procstate state;        // Process state
  int pid;                     // Process ID
  struct proc *parent;         // Parent process
  struct trap_frame *tf;       // Trap frame for current syscall
  struct context *context;     // swtch() here to run process
  void *chan;                  // If non-zero, sleeping on chan
  int killed;                  // If non-zero, have been killed
  char name[16];               // Process name (debugging)
};

// Process memory is laid out contiguously, low addresses first:
//   text
//   original data and bss
//   expandable heap
//   fixed-size stack
