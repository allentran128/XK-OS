
out/user/_sysinfo:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <fs.h>
#include <sysinfo.h>

int
main(int argc, char *argv[])
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 30          	sub    $0x30,%rsp
   8:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   c:	89 7d f8             	mov    %edi,-0x8(%rbp)
   f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    struct sys_info info;
    sysinfo(&info);
  13:	48 89 c7             	mov    %rax,%rdi
  16:	e8 6d 0b 00 00       	callq  b88 <sysinfo>
  1b:	bf 01 00 00 00       	mov    $0x1,%edi
  20:	48 be fb 0e 00 00 00 	movabs $0xefb,%rsi
  27:	00 00 00 

    printf(1, "pages_in_use = %d\n", info.pages_in_use);
  2a:	8b 55 d8             	mov    -0x28(%rbp),%edx
  2d:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  30:	b0 00                	mov    $0x0,%al
  32:	e8 79 00 00 00       	callq  b0 <printf>
  37:	bf 01 00 00 00       	mov    $0x1,%edi
  3c:	48 be 0e 0f 00 00 00 	movabs $0xf0e,%rsi
  43:	00 00 00 
    printf(1, "pages_in_swap = %d\n", info.pages_in_swap);
  46:	8b 55 dc             	mov    -0x24(%rbp),%edx
  49:	b0 00                	mov    $0x0,%al
  4b:	e8 60 00 00 00       	callq  b0 <printf>
  50:	bf 01 00 00 00       	mov    $0x1,%edi
  55:	48 be 22 0f 00 00 00 	movabs $0xf22,%rsi
  5c:	00 00 00 
    printf(1, "free_pages = %d\n", info.free_pages);
  5f:	8b 55 e0             	mov    -0x20(%rbp),%edx
  62:	b0 00                	mov    $0x0,%al
  64:	e8 47 00 00 00       	callq  b0 <printf>
  69:	bf 01 00 00 00       	mov    $0x1,%edi
  6e:	48 be 33 0f 00 00 00 	movabs $0xf33,%rsi
  75:	00 00 00 
    printf(1, "num_page_faults = %d\n", info.num_page_faults);
  78:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  7b:	b0 00                	mov    $0x0,%al
  7d:	e8 2e 00 00 00       	callq  b0 <printf>
  82:	bf 01 00 00 00       	mov    $0x1,%edi
  87:	48 be 49 0f 00 00 00 	movabs $0xf49,%rsi
  8e:	00 00 00 
    printf(1, "num_disk_reads = %d\n", info.num_disk_reads);
  91:	8b 55 e8             	mov    -0x18(%rbp),%edx
  94:	b0 00                	mov    $0x0,%al
  96:	e8 15 00 00 00       	callq  b0 <printf>

    exit();
  9b:	e8 48 0a 00 00       	callq  ae8 <exit>
  a0:	89 45 d0             	mov    %eax,-0x30(%rbp)
  a3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  aa:	00 00 00 
  ad:	0f 1f 00             	nopl   (%rax)

00000000000000b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
  b0:	55                   	push   %rbp
  b1:	48 89 e5             	mov    %rsp,%rbp
  b4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  bb:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  bf:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  c3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
  c7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  cb:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  d6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
  da:	48 89 51 10          	mov    %rdx,0x10(%rcx)
  de:	48 8d 55 10          	lea    0x10(%rbp),%rdx
  e2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  e6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
  ed:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
  f3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
  fa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
 101:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 105:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 109:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 10d:	0f 84 f0 03 00 00    	je     503 <printf+0x453>
    c = fmt[i] & 0xff;
 113:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 117:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 11b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
 11f:	81 e2 ff 00 00 00    	and    $0xff,%edx
 125:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
 128:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
 12c:	0f 85 32 00 00 00    	jne    164 <printf+0xb4>
      if(c == '%'){
 132:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 136:	0f 85 13 00 00 00    	jne    14f <printf+0x9f>
        state = '%';
 13c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 143:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 14a:	e9 10 00 00 00       	jmpq   15f <printf+0xaf>
        putc(fd, c);
 14f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 152:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 155:	88 c1                	mov    %al,%cl
 157:	0f be f1             	movsbl %cl,%esi
 15a:	e8 b1 03 00 00       	callq  510 <putc>
      }
    } else if(state == '%'){
 15f:	e9 8c 03 00 00       	jmpq   4f0 <printf+0x440>
 164:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 168:	0f 85 7d 03 00 00    	jne    4eb <printf+0x43b>
      if(c == 'l') {
 16e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 172:	0f 85 0c 00 00 00    	jne    184 <printf+0xd4>
        lflag = 1;
 178:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 17f:	e9 71 03 00 00       	jmpq   4f5 <printf+0x445>
      } else if(c == 'd'){
 184:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 188:	0f 85 0e 01 00 00    	jne    29c <printf+0x1ec>
        if (lflag == 1)
 18e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 192:	0f 85 79 00 00 00    	jne    211 <printf+0x161>
 198:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 19c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 19f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 1a2:	83 f9 28             	cmp    $0x28,%ecx
 1a5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 1a9:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 1ac:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 1af:	0f 87 1f 00 00 00    	ja     1d4 <printf+0x124>
 1b5:	8b 45 80             	mov    -0x80(%rbp),%eax
 1b8:	48 63 c8             	movslq %eax,%rcx
 1bb:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 1bf:	48 03 4a 10          	add    0x10(%rdx),%rcx
 1c3:	83 c0 08             	add    $0x8,%eax
 1c6:	89 02                	mov    %eax,(%rdx)
 1c8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 1cf:	e9 1a 00 00 00       	jmpq   1ee <printf+0x13e>
 1d4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 1d8:	48 8b 48 08          	mov    0x8(%rax),%rcx
 1dc:	48 89 ca             	mov    %rcx,%rdx
 1df:	48 83 c1 08          	add    $0x8,%rcx
 1e3:	48 89 48 08          	mov    %rcx,0x8(%rax)
 1e7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 1ee:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 1f5:	ba 0a 00 00 00       	mov    $0xa,%edx
 1fa:	b9 01 00 00 00       	mov    $0x1,%ecx
 1ff:	48 8b 00             	mov    (%rax),%rax
 202:	89 c6                	mov    %eax,%esi
 204:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 207:	e8 34 03 00 00       	callq  540 <printint64>
 20c:	e9 86 00 00 00       	jmpq   297 <printf+0x1e7>
 211:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 215:	8b 7d fc             	mov    -0x4(%rbp),%edi
 218:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 21b:	83 f9 28             	cmp    $0x28,%ecx
 21e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 225:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 22b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 231:	0f 87 25 00 00 00    	ja     25c <printf+0x1ac>
 237:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 23d:	48 63 c8             	movslq %eax,%rcx
 240:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 247:	48 03 4a 10          	add    0x10(%rdx),%rcx
 24b:	83 c0 08             	add    $0x8,%eax
 24e:	89 02                	mov    %eax,(%rdx)
 250:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 257:	e9 1d 00 00 00       	jmpq   279 <printf+0x1c9>
 25c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 263:	48 8b 48 08          	mov    0x8(%rax),%rcx
 267:	48 89 ca             	mov    %rcx,%rdx
 26a:	48 83 c1 08          	add    $0x8,%rcx
 26e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 272:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 279:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 280:	ba 0a 00 00 00       	mov    $0xa,%edx
 285:	b9 01 00 00 00       	mov    $0x1,%ecx
 28a:	8b 30                	mov    (%rax),%esi
 28c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 292:	e8 a9 03 00 00       	callq  640 <printint>
      } else if(c == 'x' || c == 'p'){
 297:	e9 43 02 00 00       	jmpq   4df <printf+0x42f>
 29c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 2a0:	0f 84 0a 00 00 00    	je     2b0 <printf+0x200>
 2a6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 2aa:	0f 85 1d 01 00 00    	jne    3cd <printf+0x31d>
        if (lflag == 1)
 2b0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 2b4:	0f 85 8b 00 00 00    	jne    345 <printf+0x295>
 2ba:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 2be:	8b 7d fc             	mov    -0x4(%rbp),%edi
 2c1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 2c4:	83 f9 28             	cmp    $0x28,%ecx
 2c7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 2ce:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 2d4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 2da:	0f 87 25 00 00 00    	ja     305 <printf+0x255>
 2e0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 2e6:	48 63 c8             	movslq %eax,%rcx
 2e9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 2f0:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2f4:	83 c0 08             	add    $0x8,%eax
 2f7:	89 02                	mov    %eax,(%rdx)
 2f9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 300:	e9 1d 00 00 00       	jmpq   322 <printf+0x272>
 305:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 30c:	48 8b 48 08          	mov    0x8(%rax),%rcx
 310:	48 89 ca             	mov    %rcx,%rdx
 313:	48 83 c1 08          	add    $0x8,%rcx
 317:	48 89 48 08          	mov    %rcx,0x8(%rax)
 31b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 322:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 329:	ba 10 00 00 00       	mov    $0x10,%edx
 32e:	31 c9                	xor    %ecx,%ecx
 330:	48 8b 00             	mov    (%rax),%rax
 333:	89 c6                	mov    %eax,%esi
 335:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 33b:	e8 00 02 00 00       	callq  540 <printint64>
 340:	e9 83 00 00 00       	jmpq   3c8 <printf+0x318>
 345:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 349:	8b 7d fc             	mov    -0x4(%rbp),%edi
 34c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 34f:	83 f9 28             	cmp    $0x28,%ecx
 352:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 359:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 35f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 365:	0f 87 25 00 00 00    	ja     390 <printf+0x2e0>
 36b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 371:	48 63 c8             	movslq %eax,%rcx
 374:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 37b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 37f:	83 c0 08             	add    $0x8,%eax
 382:	89 02                	mov    %eax,(%rdx)
 384:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 38b:	e9 1d 00 00 00       	jmpq   3ad <printf+0x2fd>
 390:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 397:	48 8b 48 08          	mov    0x8(%rax),%rcx
 39b:	48 89 ca             	mov    %rcx,%rdx
 39e:	48 83 c1 08          	add    $0x8,%rcx
 3a2:	48 89 48 08          	mov    %rcx,0x8(%rax)
 3a6:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 3ad:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 3b4:	ba 10 00 00 00       	mov    $0x10,%edx
 3b9:	31 c9                	xor    %ecx,%ecx
 3bb:	8b 30                	mov    (%rax),%esi
 3bd:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 3c3:	e8 78 02 00 00       	callq  640 <printint>
      } else if(c == 's'){
 3c8:	e9 0d 01 00 00       	jmpq   4da <printf+0x42a>
 3cd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 3d1:	0f 85 bc 00 00 00    	jne    493 <printf+0x3e3>
 3d7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 3db:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3de:	83 f9 28             	cmp    $0x28,%ecx
 3e1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 3e8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 3ee:	0f 87 25 00 00 00    	ja     419 <printf+0x369>
 3f4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 3fa:	48 63 c8             	movslq %eax,%rcx
 3fd:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 404:	48 03 4a 10          	add    0x10(%rdx),%rcx
 408:	83 c0 08             	add    $0x8,%eax
 40b:	89 02                	mov    %eax,(%rdx)
 40d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 414:	e9 1d 00 00 00       	jmpq   436 <printf+0x386>
 419:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 420:	48 8b 48 08          	mov    0x8(%rax),%rcx
 424:	48 89 ca             	mov    %rcx,%rdx
 427:	48 83 c1 08          	add    $0x8,%rcx
 42b:	48 89 48 08          	mov    %rcx,0x8(%rax)
 42f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 436:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 43d:	48 8b 00             	mov    (%rax),%rax
 440:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 444:	48 83 f8 00          	cmp    $0x0,%rax
 448:	0f 85 0e 00 00 00    	jne    45c <printf+0x3ac>
 44e:	48 b8 5e 0f 00 00 00 	movabs $0xf5e,%rax
 455:	00 00 00 
          s = "(null)";
 458:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 45c:	e9 00 00 00 00       	jmpq   461 <printf+0x3b1>
 461:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 465:	80 38 00             	cmpb   $0x0,(%rax)
 468:	0f 84 20 00 00 00    	je     48e <printf+0x3de>
          putc(fd, *s);
 46e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 471:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 475:	0f be 30             	movsbl (%rax),%esi
 478:	e8 93 00 00 00       	callq  510 <putc>
        for(; *s; s++)
 47d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 481:	48 83 c0 01          	add    $0x1,%rax
 485:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 489:	e9 d3 ff ff ff       	jmpq   461 <printf+0x3b1>
      } else if(c == '%'){
 48e:	e9 42 00 00 00       	jmpq   4d5 <printf+0x425>
 493:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 497:	0f 85 15 00 00 00    	jne    4b2 <printf+0x402>
        putc(fd, c);
 49d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4a0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 4a3:	88 c1                	mov    %al,%cl
 4a5:	0f be f1             	movsbl %cl,%esi
 4a8:	e8 63 00 00 00       	callq  510 <putc>
      } else {
 4ad:	e9 1e 00 00 00       	jmpq   4d0 <printf+0x420>
 4b2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4b7:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4ba:	e8 51 00 00 00       	callq  510 <putc>
        putc(fd, c);
 4bf:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4c2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 4c5:	40 88 f0             	mov    %sil,%al
 4c8:	0f be f0             	movsbl %al,%esi
 4cb:	e8 40 00 00 00       	callq  510 <putc>
 4d0:	e9 00 00 00 00       	jmpq   4d5 <printf+0x425>
 4d5:	e9 00 00 00 00       	jmpq   4da <printf+0x42a>
 4da:	e9 00 00 00 00       	jmpq   4df <printf+0x42f>
 4df:	e9 00 00 00 00       	jmpq   4e4 <printf+0x434>
      }
      state = 0;
 4e4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 4eb:	e9 00 00 00 00       	jmpq   4f0 <printf+0x440>
    }
  }
 4f0:	e9 00 00 00 00       	jmpq   4f5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 4f5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 4f8:	83 c0 01             	add    $0x1,%eax
 4fb:	89 45 e0             	mov    %eax,-0x20(%rbp)
 4fe:	e9 fe fb ff ff       	jmpq   101 <printf+0x51>

  va_end(valist);
}
 503:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 50a:	5d                   	pop    %rbp
 50b:	c3                   	retq   
 50c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000510 <putc>:
{
 510:	55                   	push   %rbp
 511:	48 89 e5             	mov    %rsp,%rbp
 514:	48 83 ec 10          	sub    $0x10,%rsp
 518:	40 88 f0             	mov    %sil,%al
 51b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 51f:	ba 01 00 00 00       	mov    $0x1,%edx
 524:	89 7d fc             	mov    %edi,-0x4(%rbp)
 527:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 52a:	8b 7d fc             	mov    -0x4(%rbp),%edi
 52d:	e8 d6 05 00 00       	callq  b08 <write>
}
 532:	89 45 f4             	mov    %eax,-0xc(%rbp)
 535:	48 83 c4 10          	add    $0x10,%rsp
 539:	5d                   	pop    %rbp
 53a:	c3                   	retq   
 53b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000540 <printint64>:
{
 540:	55                   	push   %rbp
 541:	48 89 e5             	mov    %rsp,%rbp
 544:	48 83 ec 50          	sub    $0x50,%rsp
 548:	89 7d fc             	mov    %edi,-0x4(%rbp)
 54b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 54e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 551:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 554:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 558:	0f 84 30 00 00 00    	je     58e <printint64+0x4e>
 55e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 562:	0f 9c c0             	setl   %al
 565:	88 c1                	mov    %al,%cl
 567:	80 e1 01             	and    $0x1,%cl
 56a:	0f b6 d1             	movzbl %cl,%edx
 56d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 570:	a8 01                	test   $0x1,%al
 572:	0f 85 05 00 00 00    	jne    57d <printint64+0x3d>
 578:	e9 11 00 00 00       	jmpq   58e <printint64+0x4e>
 57d:	31 c0                	xor    %eax,%eax
    x = -xx;
 57f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 582:	48 63 c8             	movslq %eax,%rcx
 585:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 589:	e9 08 00 00 00       	jmpq   596 <printint64+0x56>
    x = xx;
 58e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 592:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 596:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 59d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 5a1:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 5a5:	31 d2                	xor    %edx,%edx
 5a7:	48 f7 f1             	div    %rcx
 5aa:	40 8a 34 15 80 11 00 	mov    0x1180(,%rdx,1),%sil
 5b1:	00 
 5b2:	8b 7d cc             	mov    -0x34(%rbp),%edi
 5b5:	41 89 f8             	mov    %edi,%r8d
 5b8:	41 83 c0 01          	add    $0x1,%r8d
 5bc:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 5c0:	48 63 cf             	movslq %edi,%rcx
 5c3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 5c8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 5cc:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 5d0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 5d4:	48 89 c8             	mov    %rcx,%rax
 5d7:	31 d2                	xor    %edx,%edx
 5d9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 5dd:	48 f7 f1             	div    %rcx
 5e0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 5e4:	48 83 f8 00          	cmp    $0x0,%rax
 5e8:	0f 85 af ff ff ff    	jne    59d <printint64+0x5d>
  if(sgn)
 5ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 5f2:	0f 84 13 00 00 00    	je     60b <printint64+0xcb>
    buf[i++] = '-';
 5f8:	8b 45 cc             	mov    -0x34(%rbp),%eax
 5fb:	89 c1                	mov    %eax,%ecx
 5fd:	83 c1 01             	add    $0x1,%ecx
 600:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 603:	48 63 d0             	movslq %eax,%rdx
 606:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 60b:	e9 00 00 00 00       	jmpq   610 <printint64+0xd0>
 610:	8b 45 cc             	mov    -0x34(%rbp),%eax
 613:	83 c0 ff             	add    $0xffffffff,%eax
 616:	89 45 cc             	mov    %eax,-0x34(%rbp)
 619:	83 f8 00             	cmp    $0x0,%eax
 61c:	0f 8c 16 00 00 00    	jl     638 <printint64+0xf8>
    putc(fd, buf[i]);
 622:	8b 7d fc             	mov    -0x4(%rbp),%edi
 625:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 629:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 62e:	e8 dd fe ff ff       	callq  510 <putc>
  while(--i >= 0)
 633:	e9 d8 ff ff ff       	jmpq   610 <printint64+0xd0>
}
 638:	48 83 c4 50          	add    $0x50,%rsp
 63c:	5d                   	pop    %rbp
 63d:	c3                   	retq   
 63e:	66 90                	xchg   %ax,%ax

0000000000000640 <printint>:
{
 640:	55                   	push   %rbp
 641:	48 89 e5             	mov    %rsp,%rbp
 644:	48 83 ec 30          	sub    $0x30,%rsp
 648:	89 7d fc             	mov    %edi,-0x4(%rbp)
 64b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 64e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 651:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 654:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 65b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 65f:	0f 84 1e 00 00 00    	je     683 <printint+0x43>
 665:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 669:	0f 8d 14 00 00 00    	jge    683 <printint+0x43>
 66f:	31 c0                	xor    %eax,%eax
    neg = 1;
 671:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 678:	2b 45 f8             	sub    -0x8(%rbp),%eax
 67b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 67e:	e9 06 00 00 00       	jmpq   689 <printint+0x49>
    x = xx;
 683:	8b 45 f8             	mov    -0x8(%rbp),%eax
 686:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 689:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 690:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 693:	31 d2                	xor    %edx,%edx
 695:	f7 75 f4             	divl   -0xc(%rbp)
 698:	89 d2                	mov    %edx,%edx
 69a:	89 d1                	mov    %edx,%ecx
 69c:	40 8a 34 0d a0 11 00 	mov    0x11a0(,%rcx,1),%sil
 6a3:	00 
 6a4:	8b 55 dc             	mov    -0x24(%rbp),%edx
 6a7:	89 d7                	mov    %edx,%edi
 6a9:	83 c7 01             	add    $0x1,%edi
 6ac:	89 7d dc             	mov    %edi,-0x24(%rbp)
 6af:	48 63 ca             	movslq %edx,%rcx
 6b2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 6b7:	8b 45 f4             	mov    -0xc(%rbp),%eax
 6ba:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 6bd:	89 45 d0             	mov    %eax,-0x30(%rbp)
 6c0:	89 c8                	mov    %ecx,%eax
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 6c7:	f7 f1                	div    %ecx
 6c9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 6cc:	83 f8 00             	cmp    $0x0,%eax
 6cf:	0f 85 bb ff ff ff    	jne    690 <printint+0x50>
  if(neg)
 6d5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 6d9:	0f 84 13 00 00 00    	je     6f2 <printint+0xb2>
    buf[i++] = '-';
 6df:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6e2:	89 c1                	mov    %eax,%ecx
 6e4:	83 c1 01             	add    $0x1,%ecx
 6e7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 6ea:	48 63 d0             	movslq %eax,%rdx
 6ed:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 6f2:	e9 00 00 00 00       	jmpq   6f7 <printint+0xb7>
 6f7:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6fa:	83 c0 ff             	add    $0xffffffff,%eax
 6fd:	89 45 dc             	mov    %eax,-0x24(%rbp)
 700:	83 f8 00             	cmp    $0x0,%eax
 703:	0f 8c 16 00 00 00    	jl     71f <printint+0xdf>
    putc(fd, buf[i]);
 709:	8b 7d fc             	mov    -0x4(%rbp),%edi
 70c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 710:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 715:	e8 f6 fd ff ff       	callq  510 <putc>
  while(--i >= 0)
 71a:	e9 d8 ff ff ff       	jmpq   6f7 <printint+0xb7>
}
 71f:	48 83 c4 30          	add    $0x30,%rsp
 723:	5d                   	pop    %rbp
 724:	c3                   	retq   
 725:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 72c:	00 00 00 
 72f:	90                   	nop

0000000000000730 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 730:	55                   	push   %rbp
 731:	48 89 e5             	mov    %rsp,%rbp
 734:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 738:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 73c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 740:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 748:	48 89 c1             	mov    %rax,%rcx
 74b:	48 83 c1 01          	add    $0x1,%rcx
 74f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 753:	8a 10                	mov    (%rax),%dl
 755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 759:	48 89 c1             	mov    %rax,%rcx
 75c:	48 83 c1 01          	add    $0x1,%rcx
 760:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 764:	88 10                	mov    %dl,(%rax)
 766:	0f be f2             	movsbl %dl,%esi
 769:	83 fe 00             	cmp    $0x0,%esi
 76c:	0f 84 05 00 00 00    	je     777 <strcpy+0x47>
 772:	e9 cd ff ff ff       	jmpq   744 <strcpy+0x14>
    ;
  return os;
 777:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 77b:	5d                   	pop    %rbp
 77c:	c3                   	retq   
 77d:	0f 1f 00             	nopl   (%rax)

0000000000000780 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 780:	55                   	push   %rbp
 781:	48 89 e5             	mov    %rsp,%rbp
 784:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 788:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 78c:	31 c0                	xor    %eax,%eax
 78e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 790:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 794:	0f be 02             	movsbl (%rdx),%eax
 797:	83 f8 00             	cmp    $0x0,%eax
 79a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 79d:	0f 84 18 00 00 00    	je     7bb <strcmp+0x3b>
 7a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7a7:	0f be 08             	movsbl (%rax),%ecx
 7aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7ae:	0f be 10             	movsbl (%rax),%edx
 7b1:	39 d1                	cmp    %edx,%ecx
 7b3:	40 0f 94 c6          	sete   %sil
 7b7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 7bb:	8a 45 ef             	mov    -0x11(%rbp),%al
 7be:	a8 01                	test   $0x1,%al
 7c0:	0f 85 05 00 00 00    	jne    7cb <strcmp+0x4b>
 7c6:	e9 1d 00 00 00       	jmpq   7e8 <strcmp+0x68>
    p++, q++;
 7cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7cf:	48 83 c0 01          	add    $0x1,%rax
 7d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 7d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7db:	48 83 c0 01          	add    $0x1,%rax
 7df:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 7e3:	e9 a4 ff ff ff       	jmpq   78c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 7e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7ec:	0f b6 08             	movzbl (%rax),%ecx
 7ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7f3:	0f b6 10             	movzbl (%rax),%edx
 7f6:	29 d1                	sub    %edx,%ecx
 7f8:	89 c8                	mov    %ecx,%eax
 7fa:	5d                   	pop    %rbp
 7fb:	c3                   	retq   
 7fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000800 <strlen>:
}

uint
strlen(char *s)
{
 800:	55                   	push   %rbp
 801:	48 89 e5             	mov    %rsp,%rbp
 804:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 808:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 80f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 813:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 817:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 81b:	0f 84 13 00 00 00    	je     834 <strlen+0x34>
 821:	e9 00 00 00 00       	jmpq   826 <strlen+0x26>
 826:	8b 45 f4             	mov    -0xc(%rbp),%eax
 829:	83 c0 01             	add    $0x1,%eax
 82c:	89 45 f4             	mov    %eax,-0xc(%rbp)
 82f:	e9 db ff ff ff       	jmpq   80f <strlen+0xf>
    ;
  return n;
 834:	8b 45 f4             	mov    -0xc(%rbp),%eax
 837:	5d                   	pop    %rbp
 838:	c3                   	retq   
 839:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000840 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 840:	55                   	push   %rbp
 841:	48 89 e5             	mov    %rsp,%rbp
 844:	48 83 ec 10          	sub    $0x10,%rsp
 848:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 84c:	89 75 f4             	mov    %esi,-0xc(%rbp)
 84f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 852:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 856:	8b 75 f4             	mov    -0xc(%rbp),%esi
 859:	8b 55 f0             	mov    -0x10(%rbp),%edx
 85c:	e8 0f 00 00 00       	callq  870 <stosb>
  return dst;
 861:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 865:	48 83 c4 10          	add    $0x10,%rsp
 869:	5d                   	pop    %rbp
 86a:	c3                   	retq   
 86b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000870 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 870:	55                   	push   %rbp
 871:	48 89 e5             	mov    %rsp,%rbp
 874:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 878:	89 75 f4             	mov    %esi,-0xc(%rbp)
 87b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 87e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 882:	8b 55 f0             	mov    -0x10(%rbp),%edx
 885:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 888:	89 d1                	mov    %edx,%ecx
 88a:	fc                   	cld    
 88b:	f3 aa                	rep stos %al,%es:(%rdi)
 88d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 891:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 894:	5d                   	pop    %rbp
 895:	c3                   	retq   
 896:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 89d:	00 00 00 

00000000000008a0 <strchr>:
}

char*
strchr(const char *s, char c)
{
 8a0:	55                   	push   %rbp
 8a1:	48 89 e5             	mov    %rsp,%rbp
 8a4:	40 88 f0             	mov    %sil,%al
 8a7:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 8ab:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 8ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8b2:	80 38 00             	cmpb   $0x0,(%rax)
 8b5:	0f 84 36 00 00 00    	je     8f1 <strchr+0x51>
    if(*s == c)
 8bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8bf:	0f be 08             	movsbl (%rax),%ecx
 8c2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 8c6:	39 d1                	cmp    %edx,%ecx
 8c8:	0f 85 0d 00 00 00    	jne    8db <strchr+0x3b>
      return (char*)s;
 8ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 8d6:	e9 1e 00 00 00       	jmpq   8f9 <strchr+0x59>
    if(*s == c)
 8db:	e9 00 00 00 00       	jmpq   8e0 <strchr+0x40>
  for(; *s; s++)
 8e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8e4:	48 83 c0 01          	add    $0x1,%rax
 8e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 8ec:	e9 bd ff ff ff       	jmpq   8ae <strchr+0xe>
  return 0;
 8f1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 8f8:	00 
}
 8f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8fd:	5d                   	pop    %rbp
 8fe:	c3                   	retq   
 8ff:	90                   	nop

0000000000000900 <gets>:

char*
gets(char *buf, int max)
{
 900:	55                   	push   %rbp
 901:	48 89 e5             	mov    %rsp,%rbp
 904:	48 83 ec 20          	sub    $0x20,%rsp
 908:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 90c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 90f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 916:	8b 45 f0             	mov    -0x10(%rbp),%eax
 919:	83 c0 01             	add    $0x1,%eax
 91c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 91f:	0f 8d 5e 00 00 00    	jge    983 <gets+0x83>
 925:	31 ff                	xor    %edi,%edi
 927:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 92b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 930:	e8 cb 01 00 00       	callq  b00 <read>
 935:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 938:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 93c:	0f 8d 05 00 00 00    	jge    947 <gets+0x47>
      break;
 942:	e9 3c 00 00 00       	jmpq   983 <gets+0x83>
    buf[i++] = c;
 947:	8a 45 eb             	mov    -0x15(%rbp),%al
 94a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 94e:	8b 55 f0             	mov    -0x10(%rbp),%edx
 951:	89 d6                	mov    %edx,%esi
 953:	83 c6 01             	add    $0x1,%esi
 956:	89 75 f0             	mov    %esi,-0x10(%rbp)
 959:	48 63 fa             	movslq %edx,%rdi
 95c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 95f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 963:	83 fa 0a             	cmp    $0xa,%edx
 966:	0f 84 0d 00 00 00    	je     979 <gets+0x79>
 96c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 970:	83 f8 0d             	cmp    $0xd,%eax
 973:	0f 85 05 00 00 00    	jne    97e <gets+0x7e>
      break;
 979:	e9 05 00 00 00       	jmpq   983 <gets+0x83>
  for(i=0; i+1 < max; ){
 97e:	e9 93 ff ff ff       	jmpq   916 <gets+0x16>
  }
  buf[i] = '\0';
 983:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 987:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 98b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 98f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 993:	48 83 c4 20          	add    $0x20,%rsp
 997:	5d                   	pop    %rbp
 998:	c3                   	retq   
 999:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000009a0 <stat>:
}

int
stat(char *n, struct stat *st)
{
 9a0:	55                   	push   %rbp
 9a1:	48 89 e5             	mov    %rsp,%rbp
 9a4:	48 83 ec 30          	sub    $0x30,%rsp
 9a8:	31 c0                	xor    %eax,%eax
 9aa:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 9ae:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 9b2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 9b6:	89 c6                	mov    %eax,%esi
 9b8:	e8 6b 01 00 00       	callq  b28 <open>
 9bd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 9c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 9c4:	0f 8d 0c 00 00 00    	jge    9d6 <stat+0x36>
    return -1;
 9ca:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 9d1:	e9 20 00 00 00       	jmpq   9f6 <stat+0x56>
  r = fstat(fd, st);
 9d6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9d9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 9dd:	e8 5e 01 00 00       	callq  b40 <fstat>
 9e2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 9e5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9e8:	e8 23 01 00 00       	callq  b10 <close>
  return r;
 9ed:	8b 7d e0             	mov    -0x20(%rbp),%edi
 9f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
 9f3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 9f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 9f9:	48 83 c4 30          	add    $0x30,%rsp
 9fd:	5d                   	pop    %rbp
 9fe:	c3                   	retq   
 9ff:	90                   	nop

0000000000000a00 <atoi>:

int
atoi(const char *s)
{
 a00:	55                   	push   %rbp
 a01:	48 89 e5             	mov    %rsp,%rbp
 a04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 a08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 a0f:	31 c0                	xor    %eax,%eax
 a11:	88 c1                	mov    %al,%cl
 a13:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 a18:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 a1c:	0f be 32             	movsbl (%rdx),%esi
 a1f:	39 f0                	cmp    %esi,%eax
 a21:	88 4d f3             	mov    %cl,-0xd(%rbp)
 a24:	0f 8f 10 00 00 00    	jg     a3a <atoi+0x3a>
 a2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a2e:	0f be 08             	movsbl (%rax),%ecx
 a31:	83 f9 39             	cmp    $0x39,%ecx
 a34:	0f 9e c2             	setle  %dl
 a37:	88 55 f3             	mov    %dl,-0xd(%rbp)
 a3a:	8a 45 f3             	mov    -0xd(%rbp),%al
 a3d:	a8 01                	test   $0x1,%al
 a3f:	0f 85 05 00 00 00    	jne    a4a <atoi+0x4a>
 a45:	e9 23 00 00 00       	jmpq   a6d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 a4a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 a4e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a52:	48 89 ca             	mov    %rcx,%rdx
 a55:	48 83 c2 01          	add    $0x1,%rdx
 a59:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 a5d:	0f be 31             	movsbl (%rcx),%esi
 a60:	01 f0                	add    %esi,%eax
 a62:	83 e8 30             	sub    $0x30,%eax
 a65:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 a68:	e9 a2 ff ff ff       	jmpq   a0f <atoi+0xf>
  return n;
 a6d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 a70:	5d                   	pop    %rbp
 a71:	c3                   	retq   
 a72:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 a79:	1f 84 00 00 00 00 00 

0000000000000a80 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 a80:	55                   	push   %rbp
 a81:	48 89 e5             	mov    %rsp,%rbp
 a84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 a88:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 a8c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 a8f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 a93:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 a97:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 a9b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 a9f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 aa2:	89 c1                	mov    %eax,%ecx
 aa4:	83 c1 ff             	add    $0xffffffff,%ecx
 aa7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 aaa:	83 f8 00             	cmp    $0x0,%eax
 aad:	0f 8e 27 00 00 00    	jle    ada <memmove+0x5a>
    *dst++ = *src++;
 ab3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 ab7:	48 89 c1             	mov    %rax,%rcx
 aba:	48 83 c1 01          	add    $0x1,%rcx
 abe:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 ac2:	8a 10                	mov    (%rax),%dl
 ac4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ac8:	48 89 c1             	mov    %rax,%rcx
 acb:	48 83 c1 01          	add    $0x1,%rcx
 acf:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 ad3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 ad5:	e9 c5 ff ff ff       	jmpq   a9f <memmove+0x1f>
  return vdst;
 ada:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ade:	5d                   	pop    %rbp
 adf:	c3                   	retq   

0000000000000ae0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 ae0:	b8 01 00 00 00       	mov    $0x1,%eax
 ae5:	cd 40                	int    $0x40
 ae7:	c3                   	retq   

0000000000000ae8 <exit>:
SYSCALL(exit)
 ae8:	b8 02 00 00 00       	mov    $0x2,%eax
 aed:	cd 40                	int    $0x40
 aef:	c3                   	retq   

0000000000000af0 <wait>:
SYSCALL(wait)
 af0:	b8 03 00 00 00       	mov    $0x3,%eax
 af5:	cd 40                	int    $0x40
 af7:	c3                   	retq   

0000000000000af8 <pipe>:
SYSCALL(pipe)
 af8:	b8 04 00 00 00       	mov    $0x4,%eax
 afd:	cd 40                	int    $0x40
 aff:	c3                   	retq   

0000000000000b00 <read>:
SYSCALL(read)
 b00:	b8 05 00 00 00       	mov    $0x5,%eax
 b05:	cd 40                	int    $0x40
 b07:	c3                   	retq   

0000000000000b08 <write>:
SYSCALL(write)
 b08:	b8 10 00 00 00       	mov    $0x10,%eax
 b0d:	cd 40                	int    $0x40
 b0f:	c3                   	retq   

0000000000000b10 <close>:
SYSCALL(close)
 b10:	b8 15 00 00 00       	mov    $0x15,%eax
 b15:	cd 40                	int    $0x40
 b17:	c3                   	retq   

0000000000000b18 <kill>:
SYSCALL(kill)
 b18:	b8 06 00 00 00       	mov    $0x6,%eax
 b1d:	cd 40                	int    $0x40
 b1f:	c3                   	retq   

0000000000000b20 <exec>:
SYSCALL(exec)
 b20:	b8 07 00 00 00       	mov    $0x7,%eax
 b25:	cd 40                	int    $0x40
 b27:	c3                   	retq   

0000000000000b28 <open>:
SYSCALL(open)
 b28:	b8 0f 00 00 00       	mov    $0xf,%eax
 b2d:	cd 40                	int    $0x40
 b2f:	c3                   	retq   

0000000000000b30 <mknod>:
SYSCALL(mknod)
 b30:	b8 11 00 00 00       	mov    $0x11,%eax
 b35:	cd 40                	int    $0x40
 b37:	c3                   	retq   

0000000000000b38 <unlink>:
SYSCALL(unlink)
 b38:	b8 12 00 00 00       	mov    $0x12,%eax
 b3d:	cd 40                	int    $0x40
 b3f:	c3                   	retq   

0000000000000b40 <fstat>:
SYSCALL(fstat)
 b40:	b8 08 00 00 00       	mov    $0x8,%eax
 b45:	cd 40                	int    $0x40
 b47:	c3                   	retq   

0000000000000b48 <link>:
SYSCALL(link)
 b48:	b8 13 00 00 00       	mov    $0x13,%eax
 b4d:	cd 40                	int    $0x40
 b4f:	c3                   	retq   

0000000000000b50 <mkdir>:
SYSCALL(mkdir)
 b50:	b8 14 00 00 00       	mov    $0x14,%eax
 b55:	cd 40                	int    $0x40
 b57:	c3                   	retq   

0000000000000b58 <chdir>:
SYSCALL(chdir)
 b58:	b8 09 00 00 00       	mov    $0x9,%eax
 b5d:	cd 40                	int    $0x40
 b5f:	c3                   	retq   

0000000000000b60 <dup>:
SYSCALL(dup)
 b60:	b8 0a 00 00 00       	mov    $0xa,%eax
 b65:	cd 40                	int    $0x40
 b67:	c3                   	retq   

0000000000000b68 <getpid>:
SYSCALL(getpid)
 b68:	b8 0b 00 00 00       	mov    $0xb,%eax
 b6d:	cd 40                	int    $0x40
 b6f:	c3                   	retq   

0000000000000b70 <sbrk>:
SYSCALL(sbrk)
 b70:	b8 0c 00 00 00       	mov    $0xc,%eax
 b75:	cd 40                	int    $0x40
 b77:	c3                   	retq   

0000000000000b78 <sleep>:
SYSCALL(sleep)
 b78:	b8 0d 00 00 00       	mov    $0xd,%eax
 b7d:	cd 40                	int    $0x40
 b7f:	c3                   	retq   

0000000000000b80 <uptime>:
SYSCALL(uptime)
 b80:	b8 0e 00 00 00       	mov    $0xe,%eax
 b85:	cd 40                	int    $0x40
 b87:	c3                   	retq   

0000000000000b88 <sysinfo>:
SYSCALL(sysinfo)
 b88:	b8 16 00 00 00       	mov    $0x16,%eax
 b8d:	cd 40                	int    $0x40
 b8f:	c3                   	retq   

0000000000000b90 <mmap>:
SYSCALL(mmap)
 b90:	b8 17 00 00 00       	mov    $0x17,%eax
 b95:	cd 40                	int    $0x40
 b97:	c3                   	retq   

0000000000000b98 <munmap>:
SYSCALL(munmap)
 b98:	b8 18 00 00 00       	mov    $0x18,%eax
 b9d:	cd 40                	int    $0x40
 b9f:	c3                   	retq   

0000000000000ba0 <crashn>:
SYSCALL(crashn)
 ba0:	b8 19 00 00 00       	mov    $0x19,%eax
 ba5:	cd 40                	int    $0x40
 ba7:	c3                   	retq   
 ba8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 baf:	00 

0000000000000bb0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 bb0:	55                   	push   %rbp
 bb1:	48 89 e5             	mov    %rsp,%rbp
 bb4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 bb8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 bbc:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 bc0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bc4:	48 8b 3c 25 b8 11 00 	mov    0x11b8,%rdi
 bcb:	00 
 bcc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 bd0:	31 c0                	xor    %eax,%eax
 bd2:	88 c1                	mov    %al,%cl
 bd4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 bd8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 bdc:	88 4d e7             	mov    %cl,-0x19(%rbp)
 bdf:	0f 86 11 00 00 00    	jbe    bf6 <free+0x46>
 be5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 be9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bed:	48 3b 01             	cmp    (%rcx),%rax
 bf0:	0f 92 c2             	setb   %dl
 bf3:	88 55 e7             	mov    %dl,-0x19(%rbp)
 bf6:	8a 45 e7             	mov    -0x19(%rbp),%al
 bf9:	34 ff                	xor    $0xff,%al
 bfb:	a8 01                	test   $0x1,%al
 bfd:	0f 85 05 00 00 00    	jne    c08 <free+0x58>
 c03:	e9 4a 00 00 00       	jmpq   c52 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c0c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c10:	48 3b 01             	cmp    (%rcx),%rax
 c13:	0f 82 24 00 00 00    	jb     c3d <free+0x8d>
 c19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c1d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 c21:	0f 87 11 00 00 00    	ja     c38 <free+0x88>
 c27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c2b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c2f:	48 3b 01             	cmp    (%rcx),%rax
 c32:	0f 83 05 00 00 00    	jae    c3d <free+0x8d>
      break;
 c38:	e9 15 00 00 00       	jmpq   c52 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c3d:	e9 00 00 00 00       	jmpq   c42 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c46:	48 8b 00             	mov    (%rax),%rax
 c49:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 c4d:	e9 7e ff ff ff       	jmpq   bd0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 c52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c56:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c5a:	8b 51 08             	mov    0x8(%rcx),%edx
 c5d:	89 d1                	mov    %edx,%ecx
 c5f:	48 c1 e1 04          	shl    $0x4,%rcx
 c63:	48 01 c8             	add    %rcx,%rax
 c66:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c6a:	48 3b 01             	cmp    (%rcx),%rax
 c6d:	0f 85 2a 00 00 00    	jne    c9d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 c73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c77:	48 8b 00             	mov    (%rax),%rax
 c7a:	8b 48 08             	mov    0x8(%rax),%ecx
 c7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c81:	03 48 08             	add    0x8(%rax),%ecx
 c84:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 c87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c8b:	48 8b 00             	mov    (%rax),%rax
 c8e:	48 8b 00             	mov    (%rax),%rax
 c91:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c95:	48 89 02             	mov    %rax,(%rdx)
  } else
 c98:	e9 0e 00 00 00       	jmpq   cab <free+0xfb>
    bp->s.ptr = p->s.ptr;
 c9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ca1:	48 8b 00             	mov    (%rax),%rax
 ca4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 ca8:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 cab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 caf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cb3:	8b 51 08             	mov    0x8(%rcx),%edx
 cb6:	89 d1                	mov    %edx,%ecx
 cb8:	48 c1 e1 04          	shl    $0x4,%rcx
 cbc:	48 01 c8             	add    %rcx,%rax
 cbf:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 cc3:	0f 85 24 00 00 00    	jne    ced <free+0x13d>
    p->s.size += bp->s.size;
 cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 ccd:	8b 48 08             	mov    0x8(%rax),%ecx
 cd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cd4:	03 48 08             	add    0x8(%rax),%ecx
 cd7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 cda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cde:	48 8b 00             	mov    (%rax),%rax
 ce1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 ce5:	48 89 02             	mov    %rax,(%rdx)
  } else
 ce8:	e9 0b 00 00 00       	jmpq   cf8 <free+0x148>
    p->s.ptr = bp;
 ced:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cf1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cf5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 cf8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cfc:	48 89 04 25 b8 11 00 	mov    %rax,0x11b8
 d03:	00 
}
 d04:	5d                   	pop    %rbp
 d05:	c3                   	retq   
 d06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 d0d:	00 00 00 

0000000000000d10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d10:	55                   	push   %rbp
 d11:	48 89 e5             	mov    %rsp,%rbp
 d14:	48 83 ec 30          	sub    $0x30,%rsp
 d18:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d1b:	8b 7d f4             	mov    -0xc(%rbp),%edi
 d1e:	89 f8                	mov    %edi,%eax
 d20:	48 83 c0 10          	add    $0x10,%rax
 d24:	48 83 e8 01          	sub    $0x1,%rax
 d28:	48 c1 e8 04          	shr    $0x4,%rax
 d2c:	48 83 c0 01          	add    $0x1,%rax
 d30:	89 c7                	mov    %eax,%edi
 d32:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 d35:	48 8b 04 25 b8 11 00 	mov    0x11b8,%rax
 d3c:	00 
 d3d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d41:	48 83 f8 00          	cmp    $0x0,%rax
 d45:	0f 85 29 00 00 00    	jne    d74 <malloc+0x64>
 d4b:	48 b8 c0 11 00 00 00 	movabs $0x11c0,%rax
 d52:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 d55:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d59:	48 89 04 25 b8 11 00 	mov    %rax,0x11b8
 d60:	00 
 d61:	48 89 04 25 c0 11 00 	mov    %rax,0x11c0
 d68:	00 
    base.s.size = 0;
 d69:	c7 04 25 c8 11 00 00 	movl   $0x0,0x11c8
 d70:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 d78:	48 8b 00             	mov    (%rax),%rax
 d7b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 d7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d83:	8b 48 08             	mov    0x8(%rax),%ecx
 d86:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d89:	0f 82 73 00 00 00    	jb     e02 <malloc+0xf2>
      if(p->s.size == nunits)
 d8f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d93:	8b 48 08             	mov    0x8(%rax),%ecx
 d96:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d99:	0f 85 13 00 00 00    	jne    db2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 d9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 da3:	48 8b 00             	mov    (%rax),%rax
 da6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 daa:	48 89 01             	mov    %rax,(%rcx)
 dad:	e9 33 00 00 00       	jmpq   de5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 db2:	8b 45 dc             	mov    -0x24(%rbp),%eax
 db5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 db9:	8b 51 08             	mov    0x8(%rcx),%edx
 dbc:	29 c2                	sub    %eax,%edx
 dbe:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 dc1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 dc5:	8b 41 08             	mov    0x8(%rcx),%eax
 dc8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 dcc:	89 c0                	mov    %eax,%eax
 dce:	89 c6                	mov    %eax,%esi
 dd0:	48 c1 e6 04          	shl    $0x4,%rsi
 dd4:	48 01 f1             	add    %rsi,%rcx
 dd7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 ddb:	8b 45 dc             	mov    -0x24(%rbp),%eax
 dde:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 de2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 de5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 de9:	48 89 04 25 b8 11 00 	mov    %rax,0x11b8
 df0:	00 
      return (void*)(p + 1);
 df1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 df5:	48 83 c0 10          	add    $0x10,%rax
 df9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 dfd:	e9 57 00 00 00       	jmpq   e59 <malloc+0x149>
    }
    if(p == freep)
 e02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e06:	48 3b 04 25 b8 11 00 	cmp    0x11b8,%rax
 e0d:	00 
 e0e:	0f 85 28 00 00 00    	jne    e3c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 e14:	8b 7d dc             	mov    -0x24(%rbp),%edi
 e17:	e8 54 00 00 00       	callq  e70 <morecore>
 e1c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 e20:	48 83 f8 00          	cmp    $0x0,%rax
 e24:	0f 85 0d 00 00 00    	jne    e37 <malloc+0x127>
        return 0;
 e2a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e31:	00 
 e32:	e9 22 00 00 00       	jmpq   e59 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 e37:	e9 00 00 00 00       	jmpq   e3c <malloc+0x12c>
  }
 e3c:	e9 00 00 00 00       	jmpq   e41 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e45:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e4d:	48 8b 00             	mov    (%rax),%rax
 e50:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 e54:	e9 26 ff ff ff       	jmpq   d7f <malloc+0x6f>
 e59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 e5d:	48 83 c4 30          	add    $0x30,%rsp
 e61:	5d                   	pop    %rbp
 e62:	c3                   	retq   
 e63:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 e6a:	84 00 00 00 00 00 

0000000000000e70 <morecore>:
{
 e70:	55                   	push   %rbp
 e71:	48 89 e5             	mov    %rsp,%rbp
 e74:	48 83 ec 20          	sub    $0x20,%rsp
 e78:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 e7b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 e82:	0f 83 07 00 00 00    	jae    e8f <morecore+0x1f>
    nu = 4096;
 e88:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 e8f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 e92:	89 c1                	mov    %eax,%ecx
 e94:	48 c1 e1 04          	shl    $0x4,%rcx
 e98:	89 c8                	mov    %ecx,%eax
 e9a:	89 c7                	mov    %eax,%edi
 e9c:	e8 cf fc ff ff       	callq  b70 <sbrk>
 ea1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 ea8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 eac:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 eb0:	0f 85 0d 00 00 00    	jne    ec3 <morecore+0x53>
    return 0;
 eb6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 ebd:	00 
 ebe:	e9 2e 00 00 00       	jmpq   ef1 <morecore+0x81>
  hp = (Header*)p;
 ec3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ec7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 ecb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 ece:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ed2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 ed5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ed9:	48 83 c0 10          	add    $0x10,%rax
 edd:	48 89 c7             	mov    %rax,%rdi
 ee0:	e8 cb fc ff ff       	callq  bb0 <free>
  return freep;
 ee5:	48 8b 04 25 b8 11 00 	mov    0x11b8,%rax
 eec:	00 
 eed:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 ef1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ef5:	48 83 c4 20          	add    $0x20,%rsp
 ef9:	5d                   	pop    %rbp
 efa:	c3                   	retq   
