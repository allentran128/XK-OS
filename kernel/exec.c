#include <cdefs.h>
#include <param.h>
#include <memlayout.h>
#include <mmu.h>
#include <proc.h>
#include <defs.h>
#include <x86_64.h>
#include <elf.h>
#include <trap.h>

int load_program_from_disk(pml4e_t *pml4, char *path, uint64_t *rip) {
  struct inode *ip;
  struct proghdr ph;
  int off;
  uint64_t sz;
  struct elfhdr elf;
  int i;

  if((ip = namei(path)) == 0){
    return 0;
  }

  iload(ip);

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto elf_failure;
  if(elf.magic != ELF_MAGIC)
    goto elf_failure;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto elf_failure;
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto elf_failure;
    if(ph.vaddr + ph.memsz < ph.vaddr)
      goto elf_failure;


    if((sz = allocuvm(pml4, 0, sz, ph.vaddr + ph.memsz, myproc()->pid)) == -1)
     goto elf_failure;
    if(ph.vaddr % PGSIZE != 0)
      goto elf_failure;


    if(loaduvm(pml4, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
     goto elf_failure;
  }
  iput(ip);
  *rip = elf.entry;
  return sz;
elf_failure:
  if(ip){
    iput(ip);
  }
  return 0;
}

int
exec(char *path, char **argv)
{
  pml4e_t* pml4 = setupkvm();

  if (pml4 == 0) {
    return -1;
  }

  uint64_t rip;
  int sz = load_program_from_disk(pml4, path, &rip);

  if (sz == 0) {
    freevm(pml4, 0);
    return -1;
  }

  struct proc* proc = myproc();
  proc->mem_regions[CODE].start = 0;
  proc->mem_regions[CODE].size = sz;

  void* heap_start = (void*) (long) PGROUNDUP(sz);
  proc->mem_regions[HEAP].start = heap_start;
  proc->mem_regions[HEAP].size = 0;

  initustack(pml4, &proc->mem_regions[USTACK], proc->pid);

  char* stack_addr =
    proc->mem_regions[USTACK].size + proc->mem_regions[USTACK].start;

  // Alloc local space for NULL terminator, arg array, argv pointer, and
  // dummy return addr. We'll copy it into the real user stack later.
  uint64_t user_stack[MAXARG + 3];
  int i;

  for (i = 0; argv[i] != NULL; ++i) {
    if (i >= MAXARG) {
      return -1;
    }

    char* arg = argv[i];
    int len = strlen(arg) + 1; // account for NULL terminator.
    int len_aligned = WORDROUNDUP(len);
    stack_addr -= len_aligned;

    if (copyout(pml4, (uint64_t) stack_addr, arg, len) == -1) {
      return -1;
    }

    user_stack[2 + i] = (uint64_t) stack_addr;
  }

  uint64_t argc = i;
  // Calculate virtual address of argv.
  uint64_t argv_addr = (uint64_t) (stack_addr - (argc + 1) * 8);

  user_stack[0] = 0xcafebabe; // dummy return ptr
  user_stack[1] = argv_addr;
  user_stack[2 + argc] = 0UL; // Terminate argv.

  // Now copy our temp user_stack into the actual usermode stack.
  int copylen = (3 + argc) * 8;
  stack_addr -= copylen;

  if (copyout(pml4, (uint64_t) stack_addr, user_stack, copylen) == -1) {
    return -1;
  }

  struct trap_frame* tf = proc->tf;
  tf->rdi = argc;
  tf->rsi = argv_addr;

  tf->rbp = tf->rsp = (uint64_t) stack_addr;
  tf->rip = rip;

  pml4e_t* oldpml4 = proc->pml4;
  proc->pml4 = pml4;
  switchuvm(proc);
  freevm(oldpml4, proc->pid);
  return 0;
}
