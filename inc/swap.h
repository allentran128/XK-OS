#pragma once

#define SWAP_PAGES 8192
#define BLOCKS_PER_PAGE (PGSIZE / BSIZE)
#define SWAP_THRESHOLD 8

// Swap Region - hard coded from block 2 to block 2 + 65536
// Array of 8192 pages * 4096 KB/page
// Accessing correct entry convention
// pages[PGSIZE*index]
//
//struct swap_region {
//  char pages[8192*4096];
//};

// Swap Info
struct swap_entry_info {
  // Backup core_map_entry
  uint64_t va;
  int pid;
  uint8_t ref_count;
};

// Swap Region Manangement
// Access the swap info for specific swap entry
// Accessing convention
// swap_entry_info[index]
struct swap_man {
 struct swap_entry_info map[SWAP_PAGES]; // One to One mapping in swap_region
 struct spinlock lock; // coarse grain locking
};

void swapinit();
void incr_swap_entry_ref(uint64_t);
void decr_swap_entry_ref(uint64_t);
void swap_evict_if_needed();
void swap_restore_page(struct proc*, uint64_t);
void swap_timer();
