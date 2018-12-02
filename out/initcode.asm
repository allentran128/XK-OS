
out/initcode.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <start>:
   0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   7:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
   e:	48 c7 c0 07 00 00 00 	mov    $0x7,%rax
  15:	cd 40                	int    $0x40

0000000000000017 <exit>:
  17:	48 c7 c0 02 00 00 00 	mov    $0x2,%rax
  1e:	cd 40                	int    $0x40
  20:	eb f5                	jmp    17 <exit>

0000000000000022 <init>:
  22:	2f                   	(bad)  
  23:	69 6e 69 74 00 00 0f 	imul   $0xf000074,0x69(%rsi),%ebp
  2a:	1f                   	(bad)  
	...

000000000000002c <argv>:
	...
