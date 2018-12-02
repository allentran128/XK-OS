#include <defs.h>
#include <fs.h>
#include <mmu.h>
#include <spinlock.h>
#include <proc.h>
#include <memlayout.h>
#include <buf.h>
#include <limits.h>
#include <swap.h>

const short SWAP_TIMER_STRIDE = 128;

struct swap_man sm;
size_t clock_hand;

void swapinit()
{
  clock_hand = 0;
  initlock(&sm.lock, "swap lock");
}

// Assumes holding the lock
int
fetch_free_index()
{
  for (int i = 0; i < SWAP_PAGES; i++) {
    if (sm.map[i].ref_count == 0) {
      return i;
    }
  }
  return -1;
}

void
incr_swap_entry_ref(uint64_t idx)
{
  // Check if valid idx
  if (idx >= 8192) {
    panic("invalid index into swap manager");
  }

  acquire(&sm.lock);

  sm.map[idx].ref_count++;

  release(&sm.lock);
}

void
decr_swap_entry_ref(uint64_t idx)
{
  // Check if valid idx
  if (idx >= 8192) {
    panic("invalid index into swap manager");
  }

  acquire(&sm.lock);

  if (sm.map[idx].ref_count == 0) {
    panic("decreasing refcount on 0-refcount swapman struct.");
  }

  if (--sm.map[idx].ref_count == 0) {
    pages_in_swap--;
  }

  release(&sm.lock);
}

void
swap_out(struct core_map_entry* coremapentry, struct proc* proc)
{
  acquire(&sm.lock);

  int next = fetch_free_index();

  if (next == -1) {
    panic("no free swap entry");
  }

  // copy over the coremap into the backup
  sm.map[next].va = coremapentry->va;
  sm.map[next].pid = coremapentry->pid;
  sm.map[next].ref_count = coremapentry->ref_count;

  pages_in_swap++;

  release(&sm.lock);

  // Invalidate PTE before moving on
  // update PTE to !PTE_P and PTE_Swap
  // set PPN = index into sm
  uint64_t ppn = next;
  ppn = ppn << PT_SHIFT;

  // Write to disk
  char* ka = uva2ka(proc->pml4, (char*) coremapentry->va);

  for (int i = 0; i < BLOCKS_PER_PAGE; i++) {
    struct buf* buf = bread(ROOTDEV, 2 + next * BLOCKS_PER_PAGE + i);
    memmove(buf->data, (void*)(ka + (i * BSIZE)), BSIZE);
    bwrite(buf);
    brelse(buf);
  }

  // For any processes having this page mapped, turn off present bit and set
  // swapped bit.

  for (size_t i = 0; i < NPROC; ++i) {
    struct proc* mapping_proc = get_proc_by_ordinal(i);

    if (mapping_proc->state != UNUSED) {
      pte_t* pte = walkpml4(mapping_proc->pml4, (char*) coremapentry->va, 0);

      if (pte != NULL) {
        *pte = PTE(ppn, (PTE_FLAGS(*pte) & ~PTE_P) | PTE_S);
      }
    }
  }

  acquire_entry_lock();
  kfree(ka);
  switchuvm(myproc());
  release_entry_lock();
}

void
swap_in(pte_t* pte)
{
  // Find an open page in PA
  uint64_t new_va = (uint64_t) kalloc();
  if (new_va == 0) {
    panic("swap_in: not enough memory");
  }

  int index = PTE_ADDR(*pte) >> PT_SHIFT;

  for (int i = 0; i < BLOCKS_PER_PAGE; i++) {
    struct buf* buf = bread(ROOTDEV, 2 + index * BLOCKS_PER_PAGE + i);
    memmove((void*)(new_va + (i * BSIZE)), buf->data, BSIZE);
    brelse(buf);
  }

  acquire(&sm.lock);

  // validity check
  if (sm.map[index].ref_count == 0) {
    panic("swapping in invalid swap entry");
  }

  struct core_map_entry* coremapentry = pa2page(V2P((void*) new_va));
  coremapentry->va = sm.map[index].va;
  coremapentry->pid = sm.map[index].pid;
  coremapentry->ref_count = sm.map[index].ref_count;
  sm.map[index].ref_count = 0;
  pages_in_swap--;

  // For any processes mapping this address, update the PPN to the new PA we
  // assigned, and chang PTE bits to PTE_P and ~PTE_Swap.
  uint64_t flags = (*pte & (PTE_W | PTE_RO)) | PTE_U | PTE_P;

  for (size_t i = 0; i < NPROC; ++i) {
    struct proc* proc = get_proc_by_ordinal(i);

    if (proc->state != UNUSED) {
      pte_t* pte = walkpml4(proc->pml4, (char*) coremapentry->va, 0);

      if (pte != NULL) {
        *pte = PTE(PTE_ADDR(V2P(new_va)), flags);
      }
    }
  }
  switchuvm(myproc());
  release(&sm.lock);
}

struct core_map_entry* swap_choose_eviction()
{
  acquire_entry_lock();

  // To approximate LRU, choose the core map entry w/ lowest refbits.

  struct core_map_entry* best = NULL;

  for (size_t j = 1; j < npages; j++) {
    struct core_map_entry* core = core_map_entry_get(j);

    if (core->pid != -1 && core->ref_count > 0) {
      if (best == NULL || core->refbits < best->refbits) {
        best = core;

        if (best->refbits == 0) {
          // We won't do better than this.
          break;
        }
      }
    }
  }

  release_entry_lock();
  return best;
}

void swap_evict_if_needed()
{
  while (free_pages < SWAP_THRESHOLD) {
    struct core_map_entry* entry = swap_choose_eviction();
    swap_out(entry, get_proc(entry->pid));
  }
}

// Brings a page back from the swap region.
void swap_restore_page(struct proc* proc, uint64_t uva)
{
  pte_t* pte = walkpml4(proc->pml4, (char*)uva, 0);
  swap_in(pte);
}

// Called by the interrupt timer to evaluate a portion of the core map for
// having been accessed. For each core map entry, we keep an access history of
// many bits. When we need to evict a page, we choose the one with the lowest
// refbits.
void swap_timer()
{
  acquire_entry_lock();

  for (size_t j = 0; j < SWAP_TIMER_STRIDE; j++) {
    if (++clock_hand >= npages) {
      clock_hand = 0;
    }

    struct core_map_entry* core = core_map_entry_get(clock_hand);

    if (core->pid != -1 && core->ref_count > 0) {
      uint8_t mapping_processes = core->ref_count;
      bool accessed = false;

      for (size_t i = 0; i < NPROC; ++i) {
        struct proc* proc = get_proc_by_ordinal(i);

        if (proc->state != UNUSED) {
          pte_t* entry = walkpml4(proc->pml4, (char*) core->va, 0);

          if (entry != NULL) {
            accessed |= (*entry & (PTE_A | PTE_P));
            *entry &= ~PTE_A;

            if (--mapping_processes == 0) {
              // No other mapping processes, so we can stop searching.
              break;
            }
          }
        }
      }

      // Shift everything to the right by one, and set the MSB if one of the
      // processes mapping the page has accessed it.
      core->refbits = (core->refbits >> 1)
       | (!!accessed << (sizeof(RefBitsType) * CHAR_BIT - 1));
    }
  }

  release_entry_lock();
}
