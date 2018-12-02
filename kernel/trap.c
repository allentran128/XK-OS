#include <cdefs.h>
#include <defs.h>
#include <param.h>
#include <memlayout.h>
#include <mmu.h>
#include <proc.h>
#include <x86_64.h>
#include <trap.h>
#include <spinlock.h>
#include <swap.h>

// Interrupt descriptor table (shared by all CPUs).
struct gate_desc idt[256];
extern void* vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

int num_page_faults = 0;

static const uint8_t STACK_REDZONE = 128;

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    set_gate_desc(&idt[i], 0, SEG_KCODE<<3, vectors[i], KERNEL_PL);
  set_gate_desc(&idt[TRAP_SYSCALL], 1, SEG_KCODE<<3, vectors[TRAP_SYSCALL], USER_PL);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt((void *)idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trap_frame *tf)
{
  if(tf->trapno == TRAP_SYSCALL){
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }

  uint64_t addr;

  switch(tf->trapno){
  case TRAP_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);

      swap_timer();
    }
    lapiceoi();
    break;
  case TRAP_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case TRAP_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case TRAP_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case TRAP_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case TRAP_IRQ0 + 7:
  case TRAP_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpunum(), tf->cs, tf->rip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    addr = rcr2();

    if (tf->trapno == TRAP_PF) {
      // Page Fault Cases
      num_page_faults += 1;

      struct proc* proc = myproc();

      if (proc == 0 || (tf->cs&3) == 0) {
        // In kernel, it must be our mistake.
        cprintf("unexpected trap %d err %d from cpu %d rip %lx (cr2=0x%x)\n",
                tf->trapno, tf->err, cpunum(), tf->rip, addr);
        panic("trap");
      }

      if (tf->err == 4) {
        // Not present because it's swapped. Swap it in, possibly evicting
        // another page first.
        swap_restore_page(proc, addr);
        return;
      }

      pte_t* pte = walkpml4(proc->pml4, (void*) addr, 0);

      if (pte != 0 && *pte & PTE_RO) {
        // CASE: Marked read-only during a CoW fork.
        copy_writable_page(proc, addr, pte);
        return;
      }

      if (tf->rsp - STACK_REDZONE <= addr && addr < SZ_2G) {
        // CASE: Need to expand stack
        // A valid stack reference is between 2G and rsp less the x86 "red zone."
        growstack();
        return;
      }
    }

    // Assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "rip 0x%lx addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno, tf->err, cpunum(), tf->rip,
            addr);
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING && tf->trapno == TRAP_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
