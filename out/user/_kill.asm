
out/user/_kill:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <stat.h>
#include <user.h>

int
main(int argc, char **argv)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	89 7d f8             	mov    %edi,-0x8(%rbp)
   b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int i;

  if(argc < 2){
   f:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
  13:	0f 8d 1e 00 00 00    	jge    37 <main+0x37>
  19:	bf 02 00 00 00       	mov    $0x2,%edi
  1e:	48 be cb 0e 00 00 00 	movabs $0xecb,%rsi
  25:	00 00 00 
    printf(2, "usage: kill pid...\n");
  28:	b0 00                	mov    $0x0,%al
  2a:	e8 51 00 00 00       	callq  80 <printf>
    exit();
  2f:	e8 84 0a 00 00       	callq  ab8 <exit>
  34:	89 45 e8             	mov    %eax,-0x18(%rbp)
  }
  for(i=1; i<argc; i++)
  37:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  3e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  41:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  44:	0f 8d 29 00 00 00    	jge    73 <main+0x73>
    kill(atoi(argv[i]));
  4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4e:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
  52:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
  56:	e8 75 09 00 00       	callq  9d0 <atoi>
  5b:	89 c7                	mov    %eax,%edi
  5d:	e8 86 0a 00 00       	callq  ae8 <kill>
  62:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  for(i=1; i<argc; i++)
  65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  68:	83 c0 01             	add    $0x1,%eax
  6b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  6e:	e9 cb ff ff ff       	jmpq   3e <main+0x3e>
  exit();
  73:	e8 40 0a 00 00       	callq  ab8 <exit>
  78:	89 45 e0             	mov    %eax,-0x20(%rbp)
  7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000080 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
  80:	55                   	push   %rbp
  81:	48 89 e5             	mov    %rsp,%rbp
  84:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  93:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
  97:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  9b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  9f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  a2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  a6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
  aa:	48 89 51 10          	mov    %rdx,0x10(%rcx)
  ae:	48 8d 55 10          	lea    0x10(%rbp),%rdx
  b2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  b6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
  bd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
  c3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
  ca:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  d5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  d9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
  dd:	0f 84 f0 03 00 00    	je     4d3 <printf+0x453>
    c = fmt[i] & 0xff;
  e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  e7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  eb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
  ef:	81 e2 ff 00 00 00    	and    $0xff,%edx
  f5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
  f8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  fc:	0f 85 32 00 00 00    	jne    134 <printf+0xb4>
      if(c == '%'){
 102:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 106:	0f 85 13 00 00 00    	jne    11f <printf+0x9f>
        state = '%';
 10c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 113:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 11a:	e9 10 00 00 00       	jmpq   12f <printf+0xaf>
        putc(fd, c);
 11f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 122:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 125:	88 c1                	mov    %al,%cl
 127:	0f be f1             	movsbl %cl,%esi
 12a:	e8 b1 03 00 00       	callq  4e0 <putc>
      }
    } else if(state == '%'){
 12f:	e9 8c 03 00 00       	jmpq   4c0 <printf+0x440>
 134:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 138:	0f 85 7d 03 00 00    	jne    4bb <printf+0x43b>
      if(c == 'l') {
 13e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 142:	0f 85 0c 00 00 00    	jne    154 <printf+0xd4>
        lflag = 1;
 148:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 14f:	e9 71 03 00 00       	jmpq   4c5 <printf+0x445>
      } else if(c == 'd'){
 154:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 158:	0f 85 0e 01 00 00    	jne    26c <printf+0x1ec>
        if (lflag == 1)
 15e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 162:	0f 85 79 00 00 00    	jne    1e1 <printf+0x161>
 168:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 16c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 16f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 172:	83 f9 28             	cmp    $0x28,%ecx
 175:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 179:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 17c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 17f:	0f 87 1f 00 00 00    	ja     1a4 <printf+0x124>
 185:	8b 45 80             	mov    -0x80(%rbp),%eax
 188:	48 63 c8             	movslq %eax,%rcx
 18b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 18f:	48 03 4a 10          	add    0x10(%rdx),%rcx
 193:	83 c0 08             	add    $0x8,%eax
 196:	89 02                	mov    %eax,(%rdx)
 198:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 19f:	e9 1a 00 00 00       	jmpq   1be <printf+0x13e>
 1a4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 1a8:	48 8b 48 08          	mov    0x8(%rax),%rcx
 1ac:	48 89 ca             	mov    %rcx,%rdx
 1af:	48 83 c1 08          	add    $0x8,%rcx
 1b3:	48 89 48 08          	mov    %rcx,0x8(%rax)
 1b7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 1be:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 1c5:	ba 0a 00 00 00       	mov    $0xa,%edx
 1ca:	b9 01 00 00 00       	mov    $0x1,%ecx
 1cf:	48 8b 00             	mov    (%rax),%rax
 1d2:	89 c6                	mov    %eax,%esi
 1d4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 1d7:	e8 34 03 00 00       	callq  510 <printint64>
 1dc:	e9 86 00 00 00       	jmpq   267 <printf+0x1e7>
 1e1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 1e5:	8b 7d fc             	mov    -0x4(%rbp),%edi
 1e8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 1eb:	83 f9 28             	cmp    $0x28,%ecx
 1ee:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 1f5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 1fb:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 201:	0f 87 25 00 00 00    	ja     22c <printf+0x1ac>
 207:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 20d:	48 63 c8             	movslq %eax,%rcx
 210:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 217:	48 03 4a 10          	add    0x10(%rdx),%rcx
 21b:	83 c0 08             	add    $0x8,%eax
 21e:	89 02                	mov    %eax,(%rdx)
 220:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 227:	e9 1d 00 00 00       	jmpq   249 <printf+0x1c9>
 22c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 233:	48 8b 48 08          	mov    0x8(%rax),%rcx
 237:	48 89 ca             	mov    %rcx,%rdx
 23a:	48 83 c1 08          	add    $0x8,%rcx
 23e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 242:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 249:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 250:	ba 0a 00 00 00       	mov    $0xa,%edx
 255:	b9 01 00 00 00       	mov    $0x1,%ecx
 25a:	8b 30                	mov    (%rax),%esi
 25c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 262:	e8 a9 03 00 00       	callq  610 <printint>
      } else if(c == 'x' || c == 'p'){
 267:	e9 43 02 00 00       	jmpq   4af <printf+0x42f>
 26c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 270:	0f 84 0a 00 00 00    	je     280 <printf+0x200>
 276:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 27a:	0f 85 1d 01 00 00    	jne    39d <printf+0x31d>
        if (lflag == 1)
 280:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 284:	0f 85 8b 00 00 00    	jne    315 <printf+0x295>
 28a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 28e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 291:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 294:	83 f9 28             	cmp    $0x28,%ecx
 297:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 29e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 2a4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 2aa:	0f 87 25 00 00 00    	ja     2d5 <printf+0x255>
 2b0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 2b6:	48 63 c8             	movslq %eax,%rcx
 2b9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 2c0:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2c4:	83 c0 08             	add    $0x8,%eax
 2c7:	89 02                	mov    %eax,(%rdx)
 2c9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 2d0:	e9 1d 00 00 00       	jmpq   2f2 <printf+0x272>
 2d5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 2dc:	48 8b 48 08          	mov    0x8(%rax),%rcx
 2e0:	48 89 ca             	mov    %rcx,%rdx
 2e3:	48 83 c1 08          	add    $0x8,%rcx
 2e7:	48 89 48 08          	mov    %rcx,0x8(%rax)
 2eb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 2f2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 2f9:	ba 10 00 00 00       	mov    $0x10,%edx
 2fe:	31 c9                	xor    %ecx,%ecx
 300:	48 8b 00             	mov    (%rax),%rax
 303:	89 c6                	mov    %eax,%esi
 305:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 30b:	e8 00 02 00 00       	callq  510 <printint64>
 310:	e9 83 00 00 00       	jmpq   398 <printf+0x318>
 315:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 319:	8b 7d fc             	mov    -0x4(%rbp),%edi
 31c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 31f:	83 f9 28             	cmp    $0x28,%ecx
 322:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 329:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 32f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 335:	0f 87 25 00 00 00    	ja     360 <printf+0x2e0>
 33b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 341:	48 63 c8             	movslq %eax,%rcx
 344:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 34b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 34f:	83 c0 08             	add    $0x8,%eax
 352:	89 02                	mov    %eax,(%rdx)
 354:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 35b:	e9 1d 00 00 00       	jmpq   37d <printf+0x2fd>
 360:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 367:	48 8b 48 08          	mov    0x8(%rax),%rcx
 36b:	48 89 ca             	mov    %rcx,%rdx
 36e:	48 83 c1 08          	add    $0x8,%rcx
 372:	48 89 48 08          	mov    %rcx,0x8(%rax)
 376:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 37d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 384:	ba 10 00 00 00       	mov    $0x10,%edx
 389:	31 c9                	xor    %ecx,%ecx
 38b:	8b 30                	mov    (%rax),%esi
 38d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 393:	e8 78 02 00 00       	callq  610 <printint>
      } else if(c == 's'){
 398:	e9 0d 01 00 00       	jmpq   4aa <printf+0x42a>
 39d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 3a1:	0f 85 bc 00 00 00    	jne    463 <printf+0x3e3>
 3a7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 3ab:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3ae:	83 f9 28             	cmp    $0x28,%ecx
 3b1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 3b8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 3be:	0f 87 25 00 00 00    	ja     3e9 <printf+0x369>
 3c4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 3ca:	48 63 c8             	movslq %eax,%rcx
 3cd:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 3d4:	48 03 4a 10          	add    0x10(%rdx),%rcx
 3d8:	83 c0 08             	add    $0x8,%eax
 3db:	89 02                	mov    %eax,(%rdx)
 3dd:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 3e4:	e9 1d 00 00 00       	jmpq   406 <printf+0x386>
 3e9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 3f0:	48 8b 48 08          	mov    0x8(%rax),%rcx
 3f4:	48 89 ca             	mov    %rcx,%rdx
 3f7:	48 83 c1 08          	add    $0x8,%rcx
 3fb:	48 89 48 08          	mov    %rcx,0x8(%rax)
 3ff:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 406:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 40d:	48 8b 00             	mov    (%rax),%rax
 410:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 414:	48 83 f8 00          	cmp    $0x0,%rax
 418:	0f 85 0e 00 00 00    	jne    42c <printf+0x3ac>
 41e:	48 b8 df 0e 00 00 00 	movabs $0xedf,%rax
 425:	00 00 00 
          s = "(null)";
 428:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 42c:	e9 00 00 00 00       	jmpq   431 <printf+0x3b1>
 431:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 435:	80 38 00             	cmpb   $0x0,(%rax)
 438:	0f 84 20 00 00 00    	je     45e <printf+0x3de>
          putc(fd, *s);
 43e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 441:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 445:	0f be 30             	movsbl (%rax),%esi
 448:	e8 93 00 00 00       	callq  4e0 <putc>
        for(; *s; s++)
 44d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 451:	48 83 c0 01          	add    $0x1,%rax
 455:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 459:	e9 d3 ff ff ff       	jmpq   431 <printf+0x3b1>
      } else if(c == '%'){
 45e:	e9 42 00 00 00       	jmpq   4a5 <printf+0x425>
 463:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 467:	0f 85 15 00 00 00    	jne    482 <printf+0x402>
        putc(fd, c);
 46d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 470:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 473:	88 c1                	mov    %al,%cl
 475:	0f be f1             	movsbl %cl,%esi
 478:	e8 63 00 00 00       	callq  4e0 <putc>
      } else {
 47d:	e9 1e 00 00 00       	jmpq   4a0 <printf+0x420>
 482:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 487:	8b 7d fc             	mov    -0x4(%rbp),%edi
 48a:	e8 51 00 00 00       	callq  4e0 <putc>
        putc(fd, c);
 48f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 492:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 495:	40 88 f0             	mov    %sil,%al
 498:	0f be f0             	movsbl %al,%esi
 49b:	e8 40 00 00 00       	callq  4e0 <putc>
 4a0:	e9 00 00 00 00       	jmpq   4a5 <printf+0x425>
 4a5:	e9 00 00 00 00       	jmpq   4aa <printf+0x42a>
 4aa:	e9 00 00 00 00       	jmpq   4af <printf+0x42f>
 4af:	e9 00 00 00 00       	jmpq   4b4 <printf+0x434>
      }
      state = 0;
 4b4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 4bb:	e9 00 00 00 00       	jmpq   4c0 <printf+0x440>
    }
  }
 4c0:	e9 00 00 00 00       	jmpq   4c5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 4c5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 4c8:	83 c0 01             	add    $0x1,%eax
 4cb:	89 45 e0             	mov    %eax,-0x20(%rbp)
 4ce:	e9 fe fb ff ff       	jmpq   d1 <printf+0x51>

  va_end(valist);
}
 4d3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 4da:	5d                   	pop    %rbp
 4db:	c3                   	retq   
 4dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000004e0 <putc>:
{
 4e0:	55                   	push   %rbp
 4e1:	48 89 e5             	mov    %rsp,%rbp
 4e4:	48 83 ec 10          	sub    $0x10,%rsp
 4e8:	40 88 f0             	mov    %sil,%al
 4eb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 4ef:	ba 01 00 00 00       	mov    $0x1,%edx
 4f4:	89 7d fc             	mov    %edi,-0x4(%rbp)
 4f7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 4fa:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4fd:	e8 d6 05 00 00       	callq  ad8 <write>
}
 502:	89 45 f4             	mov    %eax,-0xc(%rbp)
 505:	48 83 c4 10          	add    $0x10,%rsp
 509:	5d                   	pop    %rbp
 50a:	c3                   	retq   
 50b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000510 <printint64>:
{
 510:	55                   	push   %rbp
 511:	48 89 e5             	mov    %rsp,%rbp
 514:	48 83 ec 50          	sub    $0x50,%rsp
 518:	89 7d fc             	mov    %edi,-0x4(%rbp)
 51b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 51e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 521:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 524:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 528:	0f 84 30 00 00 00    	je     55e <printint64+0x4e>
 52e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 532:	0f 9c c0             	setl   %al
 535:	88 c1                	mov    %al,%cl
 537:	80 e1 01             	and    $0x1,%cl
 53a:	0f b6 d1             	movzbl %cl,%edx
 53d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 540:	a8 01                	test   $0x1,%al
 542:	0f 85 05 00 00 00    	jne    54d <printint64+0x3d>
 548:	e9 11 00 00 00       	jmpq   55e <printint64+0x4e>
 54d:	31 c0                	xor    %eax,%eax
    x = -xx;
 54f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 552:	48 63 c8             	movslq %eax,%rcx
 555:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 559:	e9 08 00 00 00       	jmpq   566 <printint64+0x56>
    x = xx;
 55e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 562:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 566:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 56d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 571:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 575:	31 d2                	xor    %edx,%edx
 577:	48 f7 f1             	div    %rcx
 57a:	40 8a 34 15 00 11 00 	mov    0x1100(,%rdx,1),%sil
 581:	00 
 582:	8b 7d cc             	mov    -0x34(%rbp),%edi
 585:	41 89 f8             	mov    %edi,%r8d
 588:	41 83 c0 01          	add    $0x1,%r8d
 58c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 590:	48 63 cf             	movslq %edi,%rcx
 593:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 598:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 59c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 5a0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 5a4:	48 89 c8             	mov    %rcx,%rax
 5a7:	31 d2                	xor    %edx,%edx
 5a9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 5ad:	48 f7 f1             	div    %rcx
 5b0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 5b4:	48 83 f8 00          	cmp    $0x0,%rax
 5b8:	0f 85 af ff ff ff    	jne    56d <printint64+0x5d>
  if(sgn)
 5be:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 5c2:	0f 84 13 00 00 00    	je     5db <printint64+0xcb>
    buf[i++] = '-';
 5c8:	8b 45 cc             	mov    -0x34(%rbp),%eax
 5cb:	89 c1                	mov    %eax,%ecx
 5cd:	83 c1 01             	add    $0x1,%ecx
 5d0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 5d3:	48 63 d0             	movslq %eax,%rdx
 5d6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 5db:	e9 00 00 00 00       	jmpq   5e0 <printint64+0xd0>
 5e0:	8b 45 cc             	mov    -0x34(%rbp),%eax
 5e3:	83 c0 ff             	add    $0xffffffff,%eax
 5e6:	89 45 cc             	mov    %eax,-0x34(%rbp)
 5e9:	83 f8 00             	cmp    $0x0,%eax
 5ec:	0f 8c 16 00 00 00    	jl     608 <printint64+0xf8>
    putc(fd, buf[i]);
 5f2:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5f5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 5f9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 5fe:	e8 dd fe ff ff       	callq  4e0 <putc>
  while(--i >= 0)
 603:	e9 d8 ff ff ff       	jmpq   5e0 <printint64+0xd0>
}
 608:	48 83 c4 50          	add    $0x50,%rsp
 60c:	5d                   	pop    %rbp
 60d:	c3                   	retq   
 60e:	66 90                	xchg   %ax,%ax

0000000000000610 <printint>:
{
 610:	55                   	push   %rbp
 611:	48 89 e5             	mov    %rsp,%rbp
 614:	48 83 ec 30          	sub    $0x30,%rsp
 618:	89 7d fc             	mov    %edi,-0x4(%rbp)
 61b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 61e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 621:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 624:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 62b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 62f:	0f 84 1e 00 00 00    	je     653 <printint+0x43>
 635:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 639:	0f 8d 14 00 00 00    	jge    653 <printint+0x43>
 63f:	31 c0                	xor    %eax,%eax
    neg = 1;
 641:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 648:	2b 45 f8             	sub    -0x8(%rbp),%eax
 64b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 64e:	e9 06 00 00 00       	jmpq   659 <printint+0x49>
    x = xx;
 653:	8b 45 f8             	mov    -0x8(%rbp),%eax
 656:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 659:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 660:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 663:	31 d2                	xor    %edx,%edx
 665:	f7 75 f4             	divl   -0xc(%rbp)
 668:	89 d2                	mov    %edx,%edx
 66a:	89 d1                	mov    %edx,%ecx
 66c:	40 8a 34 0d 20 11 00 	mov    0x1120(,%rcx,1),%sil
 673:	00 
 674:	8b 55 dc             	mov    -0x24(%rbp),%edx
 677:	89 d7                	mov    %edx,%edi
 679:	83 c7 01             	add    $0x1,%edi
 67c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 67f:	48 63 ca             	movslq %edx,%rcx
 682:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 687:	8b 45 f4             	mov    -0xc(%rbp),%eax
 68a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 68d:	89 45 d0             	mov    %eax,-0x30(%rbp)
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 697:	f7 f1                	div    %ecx
 699:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 69c:	83 f8 00             	cmp    $0x0,%eax
 69f:	0f 85 bb ff ff ff    	jne    660 <printint+0x50>
  if(neg)
 6a5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 6a9:	0f 84 13 00 00 00    	je     6c2 <printint+0xb2>
    buf[i++] = '-';
 6af:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6b2:	89 c1                	mov    %eax,%ecx
 6b4:	83 c1 01             	add    $0x1,%ecx
 6b7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 6ba:	48 63 d0             	movslq %eax,%rdx
 6bd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 6c2:	e9 00 00 00 00       	jmpq   6c7 <printint+0xb7>
 6c7:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6ca:	83 c0 ff             	add    $0xffffffff,%eax
 6cd:	89 45 dc             	mov    %eax,-0x24(%rbp)
 6d0:	83 f8 00             	cmp    $0x0,%eax
 6d3:	0f 8c 16 00 00 00    	jl     6ef <printint+0xdf>
    putc(fd, buf[i]);
 6d9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 6dc:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 6e0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 6e5:	e8 f6 fd ff ff       	callq  4e0 <putc>
  while(--i >= 0)
 6ea:	e9 d8 ff ff ff       	jmpq   6c7 <printint+0xb7>
}
 6ef:	48 83 c4 30          	add    $0x30,%rsp
 6f3:	5d                   	pop    %rbp
 6f4:	c3                   	retq   
 6f5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6fc:	00 00 00 
 6ff:	90                   	nop

0000000000000700 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 700:	55                   	push   %rbp
 701:	48 89 e5             	mov    %rsp,%rbp
 704:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 708:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 70c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 710:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 714:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 718:	48 89 c1             	mov    %rax,%rcx
 71b:	48 83 c1 01          	add    $0x1,%rcx
 71f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 723:	8a 10                	mov    (%rax),%dl
 725:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 729:	48 89 c1             	mov    %rax,%rcx
 72c:	48 83 c1 01          	add    $0x1,%rcx
 730:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 734:	88 10                	mov    %dl,(%rax)
 736:	0f be f2             	movsbl %dl,%esi
 739:	83 fe 00             	cmp    $0x0,%esi
 73c:	0f 84 05 00 00 00    	je     747 <strcpy+0x47>
 742:	e9 cd ff ff ff       	jmpq   714 <strcpy+0x14>
    ;
  return os;
 747:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 74b:	5d                   	pop    %rbp
 74c:	c3                   	retq   
 74d:	0f 1f 00             	nopl   (%rax)

0000000000000750 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 750:	55                   	push   %rbp
 751:	48 89 e5             	mov    %rsp,%rbp
 754:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 758:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 75c:	31 c0                	xor    %eax,%eax
 75e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 760:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 764:	0f be 02             	movsbl (%rdx),%eax
 767:	83 f8 00             	cmp    $0x0,%eax
 76a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 76d:	0f 84 18 00 00 00    	je     78b <strcmp+0x3b>
 773:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 777:	0f be 08             	movsbl (%rax),%ecx
 77a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 77e:	0f be 10             	movsbl (%rax),%edx
 781:	39 d1                	cmp    %edx,%ecx
 783:	40 0f 94 c6          	sete   %sil
 787:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 78b:	8a 45 ef             	mov    -0x11(%rbp),%al
 78e:	a8 01                	test   $0x1,%al
 790:	0f 85 05 00 00 00    	jne    79b <strcmp+0x4b>
 796:	e9 1d 00 00 00       	jmpq   7b8 <strcmp+0x68>
    p++, q++;
 79b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 79f:	48 83 c0 01          	add    $0x1,%rax
 7a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 7a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7ab:	48 83 c0 01          	add    $0x1,%rax
 7af:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 7b3:	e9 a4 ff ff ff       	jmpq   75c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 7b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7bc:	0f b6 08             	movzbl (%rax),%ecx
 7bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7c3:	0f b6 10             	movzbl (%rax),%edx
 7c6:	29 d1                	sub    %edx,%ecx
 7c8:	89 c8                	mov    %ecx,%eax
 7ca:	5d                   	pop    %rbp
 7cb:	c3                   	retq   
 7cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000007d0 <strlen>:
}

uint
strlen(char *s)
{
 7d0:	55                   	push   %rbp
 7d1:	48 89 e5             	mov    %rsp,%rbp
 7d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 7d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 7df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7e3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 7e7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 7eb:	0f 84 13 00 00 00    	je     804 <strlen+0x34>
 7f1:	e9 00 00 00 00       	jmpq   7f6 <strlen+0x26>
 7f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
 7f9:	83 c0 01             	add    $0x1,%eax
 7fc:	89 45 f4             	mov    %eax,-0xc(%rbp)
 7ff:	e9 db ff ff ff       	jmpq   7df <strlen+0xf>
    ;
  return n;
 804:	8b 45 f4             	mov    -0xc(%rbp),%eax
 807:	5d                   	pop    %rbp
 808:	c3                   	retq   
 809:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000810 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 810:	55                   	push   %rbp
 811:	48 89 e5             	mov    %rsp,%rbp
 814:	48 83 ec 10          	sub    $0x10,%rsp
 818:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 81c:	89 75 f4             	mov    %esi,-0xc(%rbp)
 81f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 822:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 826:	8b 75 f4             	mov    -0xc(%rbp),%esi
 829:	8b 55 f0             	mov    -0x10(%rbp),%edx
 82c:	e8 0f 00 00 00       	callq  840 <stosb>
  return dst;
 831:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 835:	48 83 c4 10          	add    $0x10,%rsp
 839:	5d                   	pop    %rbp
 83a:	c3                   	retq   
 83b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000840 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 840:	55                   	push   %rbp
 841:	48 89 e5             	mov    %rsp,%rbp
 844:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 848:	89 75 f4             	mov    %esi,-0xc(%rbp)
 84b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 84e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 852:	8b 55 f0             	mov    -0x10(%rbp),%edx
 855:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 858:	89 d1                	mov    %edx,%ecx
 85a:	fc                   	cld    
 85b:	f3 aa                	rep stos %al,%es:(%rdi)
 85d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 861:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 864:	5d                   	pop    %rbp
 865:	c3                   	retq   
 866:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 86d:	00 00 00 

0000000000000870 <strchr>:
}

char*
strchr(const char *s, char c)
{
 870:	55                   	push   %rbp
 871:	48 89 e5             	mov    %rsp,%rbp
 874:	40 88 f0             	mov    %sil,%al
 877:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 87b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 87e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 882:	80 38 00             	cmpb   $0x0,(%rax)
 885:	0f 84 36 00 00 00    	je     8c1 <strchr+0x51>
    if(*s == c)
 88b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 88f:	0f be 08             	movsbl (%rax),%ecx
 892:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 896:	39 d1                	cmp    %edx,%ecx
 898:	0f 85 0d 00 00 00    	jne    8ab <strchr+0x3b>
      return (char*)s;
 89e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 8a6:	e9 1e 00 00 00       	jmpq   8c9 <strchr+0x59>
    if(*s == c)
 8ab:	e9 00 00 00 00       	jmpq   8b0 <strchr+0x40>
  for(; *s; s++)
 8b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8b4:	48 83 c0 01          	add    $0x1,%rax
 8b8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 8bc:	e9 bd ff ff ff       	jmpq   87e <strchr+0xe>
  return 0;
 8c1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 8c8:	00 
}
 8c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8cd:	5d                   	pop    %rbp
 8ce:	c3                   	retq   
 8cf:	90                   	nop

00000000000008d0 <gets>:

char*
gets(char *buf, int max)
{
 8d0:	55                   	push   %rbp
 8d1:	48 89 e5             	mov    %rsp,%rbp
 8d4:	48 83 ec 20          	sub    $0x20,%rsp
 8d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 8dc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 8df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 8e6:	8b 45 f0             	mov    -0x10(%rbp),%eax
 8e9:	83 c0 01             	add    $0x1,%eax
 8ec:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 8ef:	0f 8d 5e 00 00 00    	jge    953 <gets+0x83>
 8f5:	31 ff                	xor    %edi,%edi
 8f7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 8fb:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 900:	e8 cb 01 00 00       	callq  ad0 <read>
 905:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 908:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 90c:	0f 8d 05 00 00 00    	jge    917 <gets+0x47>
      break;
 912:	e9 3c 00 00 00       	jmpq   953 <gets+0x83>
    buf[i++] = c;
 917:	8a 45 eb             	mov    -0x15(%rbp),%al
 91a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 91e:	8b 55 f0             	mov    -0x10(%rbp),%edx
 921:	89 d6                	mov    %edx,%esi
 923:	83 c6 01             	add    $0x1,%esi
 926:	89 75 f0             	mov    %esi,-0x10(%rbp)
 929:	48 63 fa             	movslq %edx,%rdi
 92c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 92f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 933:	83 fa 0a             	cmp    $0xa,%edx
 936:	0f 84 0d 00 00 00    	je     949 <gets+0x79>
 93c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 940:	83 f8 0d             	cmp    $0xd,%eax
 943:	0f 85 05 00 00 00    	jne    94e <gets+0x7e>
      break;
 949:	e9 05 00 00 00       	jmpq   953 <gets+0x83>
  for(i=0; i+1 < max; ){
 94e:	e9 93 ff ff ff       	jmpq   8e6 <gets+0x16>
  }
  buf[i] = '\0';
 953:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 957:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 95b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 95f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 963:	48 83 c4 20          	add    $0x20,%rsp
 967:	5d                   	pop    %rbp
 968:	c3                   	retq   
 969:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000970 <stat>:
}

int
stat(char *n, struct stat *st)
{
 970:	55                   	push   %rbp
 971:	48 89 e5             	mov    %rsp,%rbp
 974:	48 83 ec 30          	sub    $0x30,%rsp
 978:	31 c0                	xor    %eax,%eax
 97a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 97e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 982:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 986:	89 c6                	mov    %eax,%esi
 988:	e8 6b 01 00 00       	callq  af8 <open>
 98d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 990:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 994:	0f 8d 0c 00 00 00    	jge    9a6 <stat+0x36>
    return -1;
 99a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 9a1:	e9 20 00 00 00       	jmpq   9c6 <stat+0x56>
  r = fstat(fd, st);
 9a6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9a9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 9ad:	e8 5e 01 00 00       	callq  b10 <fstat>
 9b2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 9b5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9b8:	e8 23 01 00 00       	callq  ae0 <close>
  return r;
 9bd:	8b 7d e0             	mov    -0x20(%rbp),%edi
 9c0:	89 7d fc             	mov    %edi,-0x4(%rbp)
 9c3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 9c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 9c9:	48 83 c4 30          	add    $0x30,%rsp
 9cd:	5d                   	pop    %rbp
 9ce:	c3                   	retq   
 9cf:	90                   	nop

00000000000009d0 <atoi>:

int
atoi(const char *s)
{
 9d0:	55                   	push   %rbp
 9d1:	48 89 e5             	mov    %rsp,%rbp
 9d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 9d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 9df:	31 c0                	xor    %eax,%eax
 9e1:	88 c1                	mov    %al,%cl
 9e3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 9e8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 9ec:	0f be 32             	movsbl (%rdx),%esi
 9ef:	39 f0                	cmp    %esi,%eax
 9f1:	88 4d f3             	mov    %cl,-0xd(%rbp)
 9f4:	0f 8f 10 00 00 00    	jg     a0a <atoi+0x3a>
 9fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 9fe:	0f be 08             	movsbl (%rax),%ecx
 a01:	83 f9 39             	cmp    $0x39,%ecx
 a04:	0f 9e c2             	setle  %dl
 a07:	88 55 f3             	mov    %dl,-0xd(%rbp)
 a0a:	8a 45 f3             	mov    -0xd(%rbp),%al
 a0d:	a8 01                	test   $0x1,%al
 a0f:	0f 85 05 00 00 00    	jne    a1a <atoi+0x4a>
 a15:	e9 23 00 00 00       	jmpq   a3d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 a1a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 a1e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a22:	48 89 ca             	mov    %rcx,%rdx
 a25:	48 83 c2 01          	add    $0x1,%rdx
 a29:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 a2d:	0f be 31             	movsbl (%rcx),%esi
 a30:	01 f0                	add    %esi,%eax
 a32:	83 e8 30             	sub    $0x30,%eax
 a35:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 a38:	e9 a2 ff ff ff       	jmpq   9df <atoi+0xf>
  return n;
 a3d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 a40:	5d                   	pop    %rbp
 a41:	c3                   	retq   
 a42:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 a49:	1f 84 00 00 00 00 00 

0000000000000a50 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 a50:	55                   	push   %rbp
 a51:	48 89 e5             	mov    %rsp,%rbp
 a54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 a58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 a5c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 a5f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 a63:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 a67:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 a6b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 a6f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 a72:	89 c1                	mov    %eax,%ecx
 a74:	83 c1 ff             	add    $0xffffffff,%ecx
 a77:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 a7a:	83 f8 00             	cmp    $0x0,%eax
 a7d:	0f 8e 27 00 00 00    	jle    aaa <memmove+0x5a>
    *dst++ = *src++;
 a83:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a87:	48 89 c1             	mov    %rax,%rcx
 a8a:	48 83 c1 01          	add    $0x1,%rcx
 a8e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 a92:	8a 10                	mov    (%rax),%dl
 a94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 a98:	48 89 c1             	mov    %rax,%rcx
 a9b:	48 83 c1 01          	add    $0x1,%rcx
 a9f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 aa3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 aa5:	e9 c5 ff ff ff       	jmpq   a6f <memmove+0x1f>
  return vdst;
 aaa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 aae:	5d                   	pop    %rbp
 aaf:	c3                   	retq   

0000000000000ab0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 ab0:	b8 01 00 00 00       	mov    $0x1,%eax
 ab5:	cd 40                	int    $0x40
 ab7:	c3                   	retq   

0000000000000ab8 <exit>:
SYSCALL(exit)
 ab8:	b8 02 00 00 00       	mov    $0x2,%eax
 abd:	cd 40                	int    $0x40
 abf:	c3                   	retq   

0000000000000ac0 <wait>:
SYSCALL(wait)
 ac0:	b8 03 00 00 00       	mov    $0x3,%eax
 ac5:	cd 40                	int    $0x40
 ac7:	c3                   	retq   

0000000000000ac8 <pipe>:
SYSCALL(pipe)
 ac8:	b8 04 00 00 00       	mov    $0x4,%eax
 acd:	cd 40                	int    $0x40
 acf:	c3                   	retq   

0000000000000ad0 <read>:
SYSCALL(read)
 ad0:	b8 05 00 00 00       	mov    $0x5,%eax
 ad5:	cd 40                	int    $0x40
 ad7:	c3                   	retq   

0000000000000ad8 <write>:
SYSCALL(write)
 ad8:	b8 10 00 00 00       	mov    $0x10,%eax
 add:	cd 40                	int    $0x40
 adf:	c3                   	retq   

0000000000000ae0 <close>:
SYSCALL(close)
 ae0:	b8 15 00 00 00       	mov    $0x15,%eax
 ae5:	cd 40                	int    $0x40
 ae7:	c3                   	retq   

0000000000000ae8 <kill>:
SYSCALL(kill)
 ae8:	b8 06 00 00 00       	mov    $0x6,%eax
 aed:	cd 40                	int    $0x40
 aef:	c3                   	retq   

0000000000000af0 <exec>:
SYSCALL(exec)
 af0:	b8 07 00 00 00       	mov    $0x7,%eax
 af5:	cd 40                	int    $0x40
 af7:	c3                   	retq   

0000000000000af8 <open>:
SYSCALL(open)
 af8:	b8 0f 00 00 00       	mov    $0xf,%eax
 afd:	cd 40                	int    $0x40
 aff:	c3                   	retq   

0000000000000b00 <mknod>:
SYSCALL(mknod)
 b00:	b8 11 00 00 00       	mov    $0x11,%eax
 b05:	cd 40                	int    $0x40
 b07:	c3                   	retq   

0000000000000b08 <unlink>:
SYSCALL(unlink)
 b08:	b8 12 00 00 00       	mov    $0x12,%eax
 b0d:	cd 40                	int    $0x40
 b0f:	c3                   	retq   

0000000000000b10 <fstat>:
SYSCALL(fstat)
 b10:	b8 08 00 00 00       	mov    $0x8,%eax
 b15:	cd 40                	int    $0x40
 b17:	c3                   	retq   

0000000000000b18 <link>:
SYSCALL(link)
 b18:	b8 13 00 00 00       	mov    $0x13,%eax
 b1d:	cd 40                	int    $0x40
 b1f:	c3                   	retq   

0000000000000b20 <mkdir>:
SYSCALL(mkdir)
 b20:	b8 14 00 00 00       	mov    $0x14,%eax
 b25:	cd 40                	int    $0x40
 b27:	c3                   	retq   

0000000000000b28 <chdir>:
SYSCALL(chdir)
 b28:	b8 09 00 00 00       	mov    $0x9,%eax
 b2d:	cd 40                	int    $0x40
 b2f:	c3                   	retq   

0000000000000b30 <dup>:
SYSCALL(dup)
 b30:	b8 0a 00 00 00       	mov    $0xa,%eax
 b35:	cd 40                	int    $0x40
 b37:	c3                   	retq   

0000000000000b38 <getpid>:
SYSCALL(getpid)
 b38:	b8 0b 00 00 00       	mov    $0xb,%eax
 b3d:	cd 40                	int    $0x40
 b3f:	c3                   	retq   

0000000000000b40 <sbrk>:
SYSCALL(sbrk)
 b40:	b8 0c 00 00 00       	mov    $0xc,%eax
 b45:	cd 40                	int    $0x40
 b47:	c3                   	retq   

0000000000000b48 <sleep>:
SYSCALL(sleep)
 b48:	b8 0d 00 00 00       	mov    $0xd,%eax
 b4d:	cd 40                	int    $0x40
 b4f:	c3                   	retq   

0000000000000b50 <uptime>:
SYSCALL(uptime)
 b50:	b8 0e 00 00 00       	mov    $0xe,%eax
 b55:	cd 40                	int    $0x40
 b57:	c3                   	retq   

0000000000000b58 <sysinfo>:
SYSCALL(sysinfo)
 b58:	b8 16 00 00 00       	mov    $0x16,%eax
 b5d:	cd 40                	int    $0x40
 b5f:	c3                   	retq   

0000000000000b60 <mmap>:
SYSCALL(mmap)
 b60:	b8 17 00 00 00       	mov    $0x17,%eax
 b65:	cd 40                	int    $0x40
 b67:	c3                   	retq   

0000000000000b68 <munmap>:
SYSCALL(munmap)
 b68:	b8 18 00 00 00       	mov    $0x18,%eax
 b6d:	cd 40                	int    $0x40
 b6f:	c3                   	retq   

0000000000000b70 <crashn>:
SYSCALL(crashn)
 b70:	b8 19 00 00 00       	mov    $0x19,%eax
 b75:	cd 40                	int    $0x40
 b77:	c3                   	retq   
 b78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 b7f:	00 

0000000000000b80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b80:	55                   	push   %rbp
 b81:	48 89 e5             	mov    %rsp,%rbp
 b84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b88:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 b8c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 b90:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b94:	48 8b 3c 25 38 11 00 	mov    0x1138,%rdi
 b9b:	00 
 b9c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 ba0:	31 c0                	xor    %eax,%eax
 ba2:	88 c1                	mov    %al,%cl
 ba4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 ba8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 bac:	88 4d e7             	mov    %cl,-0x19(%rbp)
 baf:	0f 86 11 00 00 00    	jbe    bc6 <free+0x46>
 bb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bb9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bbd:	48 3b 01             	cmp    (%rcx),%rax
 bc0:	0f 92 c2             	setb   %dl
 bc3:	88 55 e7             	mov    %dl,-0x19(%rbp)
 bc6:	8a 45 e7             	mov    -0x19(%rbp),%al
 bc9:	34 ff                	xor    $0xff,%al
 bcb:	a8 01                	test   $0x1,%al
 bcd:	0f 85 05 00 00 00    	jne    bd8 <free+0x58>
 bd3:	e9 4a 00 00 00       	jmpq   c22 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 bdc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 be0:	48 3b 01             	cmp    (%rcx),%rax
 be3:	0f 82 24 00 00 00    	jb     c0d <free+0x8d>
 be9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bed:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 bf1:	0f 87 11 00 00 00    	ja     c08 <free+0x88>
 bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bfb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bff:	48 3b 01             	cmp    (%rcx),%rax
 c02:	0f 83 05 00 00 00    	jae    c0d <free+0x8d>
      break;
 c08:	e9 15 00 00 00       	jmpq   c22 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c0d:	e9 00 00 00 00       	jmpq   c12 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c16:	48 8b 00             	mov    (%rax),%rax
 c19:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 c1d:	e9 7e ff ff ff       	jmpq   ba0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 c22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c26:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c2a:	8b 51 08             	mov    0x8(%rcx),%edx
 c2d:	89 d1                	mov    %edx,%ecx
 c2f:	48 c1 e1 04          	shl    $0x4,%rcx
 c33:	48 01 c8             	add    %rcx,%rax
 c36:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c3a:	48 3b 01             	cmp    (%rcx),%rax
 c3d:	0f 85 2a 00 00 00    	jne    c6d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 c43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c47:	48 8b 00             	mov    (%rax),%rax
 c4a:	8b 48 08             	mov    0x8(%rax),%ecx
 c4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c51:	03 48 08             	add    0x8(%rax),%ecx
 c54:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 c57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c5b:	48 8b 00             	mov    (%rax),%rax
 c5e:	48 8b 00             	mov    (%rax),%rax
 c61:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c65:	48 89 02             	mov    %rax,(%rdx)
  } else
 c68:	e9 0e 00 00 00       	jmpq   c7b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 c6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c71:	48 8b 00             	mov    (%rax),%rax
 c74:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c78:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 c7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c7f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c83:	8b 51 08             	mov    0x8(%rcx),%edx
 c86:	89 d1                	mov    %edx,%ecx
 c88:	48 c1 e1 04          	shl    $0x4,%rcx
 c8c:	48 01 c8             	add    %rcx,%rax
 c8f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 c93:	0f 85 24 00 00 00    	jne    cbd <free+0x13d>
    p->s.size += bp->s.size;
 c99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c9d:	8b 48 08             	mov    0x8(%rax),%ecx
 ca0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ca4:	03 48 08             	add    0x8(%rax),%ecx
 ca7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 caa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cae:	48 8b 00             	mov    (%rax),%rax
 cb1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 cb5:	48 89 02             	mov    %rax,(%rdx)
  } else
 cb8:	e9 0b 00 00 00       	jmpq   cc8 <free+0x148>
    p->s.ptr = bp;
 cbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cc1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cc5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 cc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ccc:	48 89 04 25 38 11 00 	mov    %rax,0x1138
 cd3:	00 
}
 cd4:	5d                   	pop    %rbp
 cd5:	c3                   	retq   
 cd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 cdd:	00 00 00 

0000000000000ce0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ce0:	55                   	push   %rbp
 ce1:	48 89 e5             	mov    %rsp,%rbp
 ce4:	48 83 ec 30          	sub    $0x30,%rsp
 ce8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ceb:	8b 7d f4             	mov    -0xc(%rbp),%edi
 cee:	89 f8                	mov    %edi,%eax
 cf0:	48 83 c0 10          	add    $0x10,%rax
 cf4:	48 83 e8 01          	sub    $0x1,%rax
 cf8:	48 c1 e8 04          	shr    $0x4,%rax
 cfc:	48 83 c0 01          	add    $0x1,%rax
 d00:	89 c7                	mov    %eax,%edi
 d02:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 d05:	48 8b 04 25 38 11 00 	mov    0x1138,%rax
 d0c:	00 
 d0d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d11:	48 83 f8 00          	cmp    $0x0,%rax
 d15:	0f 85 29 00 00 00    	jne    d44 <malloc+0x64>
 d1b:	48 b8 40 11 00 00 00 	movabs $0x1140,%rax
 d22:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 d25:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d29:	48 89 04 25 38 11 00 	mov    %rax,0x1138
 d30:	00 
 d31:	48 89 04 25 40 11 00 	mov    %rax,0x1140
 d38:	00 
    base.s.size = 0;
 d39:	c7 04 25 48 11 00 00 	movl   $0x0,0x1148
 d40:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 d48:	48 8b 00             	mov    (%rax),%rax
 d4b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 d4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d53:	8b 48 08             	mov    0x8(%rax),%ecx
 d56:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d59:	0f 82 73 00 00 00    	jb     dd2 <malloc+0xf2>
      if(p->s.size == nunits)
 d5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d63:	8b 48 08             	mov    0x8(%rax),%ecx
 d66:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d69:	0f 85 13 00 00 00    	jne    d82 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 d6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d73:	48 8b 00             	mov    (%rax),%rax
 d76:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 d7a:	48 89 01             	mov    %rax,(%rcx)
 d7d:	e9 33 00 00 00       	jmpq   db5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 d82:	8b 45 dc             	mov    -0x24(%rbp),%eax
 d85:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d89:	8b 51 08             	mov    0x8(%rcx),%edx
 d8c:	29 c2                	sub    %eax,%edx
 d8e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 d91:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d95:	8b 41 08             	mov    0x8(%rcx),%eax
 d98:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d9c:	89 c0                	mov    %eax,%eax
 d9e:	89 c6                	mov    %eax,%esi
 da0:	48 c1 e6 04          	shl    $0x4,%rsi
 da4:	48 01 f1             	add    %rsi,%rcx
 da7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 dab:	8b 45 dc             	mov    -0x24(%rbp),%eax
 dae:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 db2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 db5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 db9:	48 89 04 25 38 11 00 	mov    %rax,0x1138
 dc0:	00 
      return (void*)(p + 1);
 dc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dc5:	48 83 c0 10          	add    $0x10,%rax
 dc9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 dcd:	e9 57 00 00 00       	jmpq   e29 <malloc+0x149>
    }
    if(p == freep)
 dd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dd6:	48 3b 04 25 38 11 00 	cmp    0x1138,%rax
 ddd:	00 
 dde:	0f 85 28 00 00 00    	jne    e0c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 de4:	8b 7d dc             	mov    -0x24(%rbp),%edi
 de7:	e8 54 00 00 00       	callq  e40 <morecore>
 dec:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 df0:	48 83 f8 00          	cmp    $0x0,%rax
 df4:	0f 85 0d 00 00 00    	jne    e07 <malloc+0x127>
        return 0;
 dfa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e01:	00 
 e02:	e9 22 00 00 00       	jmpq   e29 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 e07:	e9 00 00 00 00       	jmpq   e0c <malloc+0x12c>
  }
 e0c:	e9 00 00 00 00       	jmpq   e11 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e15:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e1d:	48 8b 00             	mov    (%rax),%rax
 e20:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 e24:	e9 26 ff ff ff       	jmpq   d4f <malloc+0x6f>
 e29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 e2d:	48 83 c4 30          	add    $0x30,%rsp
 e31:	5d                   	pop    %rbp
 e32:	c3                   	retq   
 e33:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 e3a:	84 00 00 00 00 00 

0000000000000e40 <morecore>:
{
 e40:	55                   	push   %rbp
 e41:	48 89 e5             	mov    %rsp,%rbp
 e44:	48 83 ec 20          	sub    $0x20,%rsp
 e48:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 e4b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 e52:	0f 83 07 00 00 00    	jae    e5f <morecore+0x1f>
    nu = 4096;
 e58:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 e5f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 e62:	89 c1                	mov    %eax,%ecx
 e64:	48 c1 e1 04          	shl    $0x4,%rcx
 e68:	89 c8                	mov    %ecx,%eax
 e6a:	89 c7                	mov    %eax,%edi
 e6c:	e8 cf fc ff ff       	callq  b40 <sbrk>
 e71:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 e78:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 e7c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 e80:	0f 85 0d 00 00 00    	jne    e93 <morecore+0x53>
    return 0;
 e86:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e8d:	00 
 e8e:	e9 2e 00 00 00       	jmpq   ec1 <morecore+0x81>
  hp = (Header*)p;
 e93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e97:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 e9b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 e9e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ea2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 ea5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ea9:	48 83 c0 10          	add    $0x10,%rax
 ead:	48 89 c7             	mov    %rax,%rdi
 eb0:	e8 cb fc ff ff       	callq  b80 <free>
  return freep;
 eb5:	48 8b 04 25 38 11 00 	mov    0x1138,%rax
 ebc:	00 
 ebd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 ec1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ec5:	48 83 c4 20          	add    $0x20,%rsp
 ec9:	5d                   	pop    %rbp
 eca:	c3                   	retq   
