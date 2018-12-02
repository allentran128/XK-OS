#pragma once

#define EXTENTS_PER_INODE 4

// represents a contiguous block on disk of data
struct extent {
  uint startblkno;  // start block number
  uint nblocks;     // n blocks following the start block
};
