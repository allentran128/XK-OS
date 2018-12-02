#include <mmu.h>
#include <trap.h>
#include <proc.h>
#include <defs.h>
#include <memlayout.h>

int sbrk(int size)
{
  struct proc* proc = myproc();
  struct mem_region* heap = &proc->mem_regions[HEAP];
  struct mem_region* stack = &proc->mem_regions[USTACK];
  int old_extent = (int) (uint64_t) heap->start + heap->size;

  if (size == 0) {
    // Nothing.
  } else if (size < 0) {
    // Shrink Case
    heap->size = deallocuvm(proc->pml4, heap->start,
      heap->size, heap->size + size, proc->pid);
  } else {
    // Grow Case
    if (heap->start + heap->size + size < stack->start) {
      int newsize = allocuvm(proc->pml4, heap->start,
        heap->size, heap->size + size, proc->pid);

      if (newsize == -1) {
        return -1;
      }

      heap->size = newsize;
    } else {
      // growing into Stack region
      return -1;
    }
  }

  return old_extent;
}
