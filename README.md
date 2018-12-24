# XK-OS
UW CSE 451 Operating Systems Project

## Description
All of our labs are based on the Experimental Kernel (i.e., xk). xk is a new experimental operating system kernel for teaching the principles and practice of operating systems. 
xk's baseline code is a complete, bootable operating system.

## Development
### Lab 1
Implement system calls: open, read, write, close, dup and pipe.

### Lab 2
Implement Multiprocessing with locks, and additional system calls: exec, fork, wait and exit.

### Lab 3
Implement sbrk to adjust the size of the user-level heap.
Implement memory-mapped I/O for processes that map the same file. This memory region acts as shared memory between the porocesses.
Therefore locks and atomic read-write instructions were used to ensure mutual exclusion and data race freedom.
Implement copy-on-write fork to reduce the cost of fork by allowing multiple processes to share the same physical memory, while still behaving as if the memory was copied.

### Lab 4
Implemented a LRU page eviction policy and a swap region on disk.
