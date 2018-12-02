
out/user/_zombie:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <stat.h>
#include <user.h>

int
main(void)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
  if(fork() > 0)
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	e8 53 0a 00 00       	callq  a60 <fork>
   d:	83 f8 00             	cmp    $0x0,%eax
  10:	0f 8e 0d 00 00 00    	jle    23 <main+0x23>
  16:	bf 05 00 00 00       	mov    $0x5,%edi
    sleep(5);  // Let child exit before parent.
  1b:	e8 d8 0a 00 00       	callq  af8 <sleep>
  20:	89 45 f8             	mov    %eax,-0x8(%rbp)
  exit();
  23:	e8 40 0a 00 00       	callq  a68 <exit>
  28:	89 45 f4             	mov    %eax,-0xc(%rbp)
  2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000030 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
  30:	55                   	push   %rbp
  31:	48 89 e5             	mov    %rsp,%rbp
  34:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  3b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  3f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  43:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
  47:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  4b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  4f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  52:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  56:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
  5a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
  5e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
  62:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  66:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
  6d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
  73:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
  7a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  85:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  89:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
  8d:	0f 84 f0 03 00 00    	je     483 <printf+0x453>
    c = fmt[i] & 0xff;
  93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  97:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  9b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
  9f:	81 e2 ff 00 00 00    	and    $0xff,%edx
  a5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
  a8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  ac:	0f 85 32 00 00 00    	jne    e4 <printf+0xb4>
      if(c == '%'){
  b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
  b6:	0f 85 13 00 00 00    	jne    cf <printf+0x9f>
        state = '%';
  bc:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
  c3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
  ca:	e9 10 00 00 00       	jmpq   df <printf+0xaf>
        putc(fd, c);
  cf:	8b 7d fc             	mov    -0x4(%rbp),%edi
  d2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  d5:	88 c1                	mov    %al,%cl
  d7:	0f be f1             	movsbl %cl,%esi
  da:	e8 b1 03 00 00       	callq  490 <putc>
      }
    } else if(state == '%'){
  df:	e9 8c 03 00 00       	jmpq   470 <printf+0x440>
  e4:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
  e8:	0f 85 7d 03 00 00    	jne    46b <printf+0x43b>
      if(c == 'l') {
  ee:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
  f2:	0f 85 0c 00 00 00    	jne    104 <printf+0xd4>
        lflag = 1;
  f8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
  ff:	e9 71 03 00 00       	jmpq   475 <printf+0x445>
      } else if(c == 'd'){
 104:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 108:	0f 85 0e 01 00 00    	jne    21c <printf+0x1ec>
        if (lflag == 1)
 10e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 112:	0f 85 79 00 00 00    	jne    191 <printf+0x161>
 118:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 11c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 11f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 122:	83 f9 28             	cmp    $0x28,%ecx
 125:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 129:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 12c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 12f:	0f 87 1f 00 00 00    	ja     154 <printf+0x124>
 135:	8b 45 80             	mov    -0x80(%rbp),%eax
 138:	48 63 c8             	movslq %eax,%rcx
 13b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 13f:	48 03 4a 10          	add    0x10(%rdx),%rcx
 143:	83 c0 08             	add    $0x8,%eax
 146:	89 02                	mov    %eax,(%rdx)
 148:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 14f:	e9 1a 00 00 00       	jmpq   16e <printf+0x13e>
 154:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 158:	48 8b 48 08          	mov    0x8(%rax),%rcx
 15c:	48 89 ca             	mov    %rcx,%rdx
 15f:	48 83 c1 08          	add    $0x8,%rcx
 163:	48 89 48 08          	mov    %rcx,0x8(%rax)
 167:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 16e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 175:	ba 0a 00 00 00       	mov    $0xa,%edx
 17a:	b9 01 00 00 00       	mov    $0x1,%ecx
 17f:	48 8b 00             	mov    (%rax),%rax
 182:	89 c6                	mov    %eax,%esi
 184:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 187:	e8 34 03 00 00       	callq  4c0 <printint64>
 18c:	e9 86 00 00 00       	jmpq   217 <printf+0x1e7>
 191:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 195:	8b 7d fc             	mov    -0x4(%rbp),%edi
 198:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 19b:	83 f9 28             	cmp    $0x28,%ecx
 19e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 1a5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 1ab:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 1b1:	0f 87 25 00 00 00    	ja     1dc <printf+0x1ac>
 1b7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 1bd:	48 63 c8             	movslq %eax,%rcx
 1c0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 1c7:	48 03 4a 10          	add    0x10(%rdx),%rcx
 1cb:	83 c0 08             	add    $0x8,%eax
 1ce:	89 02                	mov    %eax,(%rdx)
 1d0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 1d7:	e9 1d 00 00 00       	jmpq   1f9 <printf+0x1c9>
 1dc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 1e3:	48 8b 48 08          	mov    0x8(%rax),%rcx
 1e7:	48 89 ca             	mov    %rcx,%rdx
 1ea:	48 83 c1 08          	add    $0x8,%rcx
 1ee:	48 89 48 08          	mov    %rcx,0x8(%rax)
 1f2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 1f9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 200:	ba 0a 00 00 00       	mov    $0xa,%edx
 205:	b9 01 00 00 00       	mov    $0x1,%ecx
 20a:	8b 30                	mov    (%rax),%esi
 20c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 212:	e8 a9 03 00 00       	callq  5c0 <printint>
      } else if(c == 'x' || c == 'p'){
 217:	e9 43 02 00 00       	jmpq   45f <printf+0x42f>
 21c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 220:	0f 84 0a 00 00 00    	je     230 <printf+0x200>
 226:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 22a:	0f 85 1d 01 00 00    	jne    34d <printf+0x31d>
        if (lflag == 1)
 230:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 234:	0f 85 8b 00 00 00    	jne    2c5 <printf+0x295>
 23a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 23e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 241:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 244:	83 f9 28             	cmp    $0x28,%ecx
 247:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 24e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 254:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 25a:	0f 87 25 00 00 00    	ja     285 <printf+0x255>
 260:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 266:	48 63 c8             	movslq %eax,%rcx
 269:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 270:	48 03 4a 10          	add    0x10(%rdx),%rcx
 274:	83 c0 08             	add    $0x8,%eax
 277:	89 02                	mov    %eax,(%rdx)
 279:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 280:	e9 1d 00 00 00       	jmpq   2a2 <printf+0x272>
 285:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 28c:	48 8b 48 08          	mov    0x8(%rax),%rcx
 290:	48 89 ca             	mov    %rcx,%rdx
 293:	48 83 c1 08          	add    $0x8,%rcx
 297:	48 89 48 08          	mov    %rcx,0x8(%rax)
 29b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 2a2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 2a9:	ba 10 00 00 00       	mov    $0x10,%edx
 2ae:	31 c9                	xor    %ecx,%ecx
 2b0:	48 8b 00             	mov    (%rax),%rax
 2b3:	89 c6                	mov    %eax,%esi
 2b5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 2bb:	e8 00 02 00 00       	callq  4c0 <printint64>
 2c0:	e9 83 00 00 00       	jmpq   348 <printf+0x318>
 2c5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 2c9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 2cc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 2cf:	83 f9 28             	cmp    $0x28,%ecx
 2d2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 2d9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 2df:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 2e5:	0f 87 25 00 00 00    	ja     310 <printf+0x2e0>
 2eb:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 2f1:	48 63 c8             	movslq %eax,%rcx
 2f4:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 2fb:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2ff:	83 c0 08             	add    $0x8,%eax
 302:	89 02                	mov    %eax,(%rdx)
 304:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 30b:	e9 1d 00 00 00       	jmpq   32d <printf+0x2fd>
 310:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 317:	48 8b 48 08          	mov    0x8(%rax),%rcx
 31b:	48 89 ca             	mov    %rcx,%rdx
 31e:	48 83 c1 08          	add    $0x8,%rcx
 322:	48 89 48 08          	mov    %rcx,0x8(%rax)
 326:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 32d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 334:	ba 10 00 00 00       	mov    $0x10,%edx
 339:	31 c9                	xor    %ecx,%ecx
 33b:	8b 30                	mov    (%rax),%esi
 33d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 343:	e8 78 02 00 00       	callq  5c0 <printint>
      } else if(c == 's'){
 348:	e9 0d 01 00 00       	jmpq   45a <printf+0x42a>
 34d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 351:	0f 85 bc 00 00 00    	jne    413 <printf+0x3e3>
 357:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 35b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 35e:	83 f9 28             	cmp    $0x28,%ecx
 361:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 368:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 36e:	0f 87 25 00 00 00    	ja     399 <printf+0x369>
 374:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 37a:	48 63 c8             	movslq %eax,%rcx
 37d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 384:	48 03 4a 10          	add    0x10(%rdx),%rcx
 388:	83 c0 08             	add    $0x8,%eax
 38b:	89 02                	mov    %eax,(%rdx)
 38d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 394:	e9 1d 00 00 00       	jmpq   3b6 <printf+0x386>
 399:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 3a0:	48 8b 48 08          	mov    0x8(%rax),%rcx
 3a4:	48 89 ca             	mov    %rcx,%rdx
 3a7:	48 83 c1 08          	add    $0x8,%rcx
 3ab:	48 89 48 08          	mov    %rcx,0x8(%rax)
 3af:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 3b6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 3bd:	48 8b 00             	mov    (%rax),%rax
 3c0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 3c4:	48 83 f8 00          	cmp    $0x0,%rax
 3c8:	0f 85 0e 00 00 00    	jne    3dc <printf+0x3ac>
 3ce:	48 b8 7b 0e 00 00 00 	movabs $0xe7b,%rax
 3d5:	00 00 00 
          s = "(null)";
 3d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 3dc:	e9 00 00 00 00       	jmpq   3e1 <printf+0x3b1>
 3e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3e5:	80 38 00             	cmpb   $0x0,(%rax)
 3e8:	0f 84 20 00 00 00    	je     40e <printf+0x3de>
          putc(fd, *s);
 3ee:	8b 7d fc             	mov    -0x4(%rbp),%edi
 3f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3f5:	0f be 30             	movsbl (%rax),%esi
 3f8:	e8 93 00 00 00       	callq  490 <putc>
        for(; *s; s++)
 3fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 401:	48 83 c0 01          	add    $0x1,%rax
 405:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 409:	e9 d3 ff ff ff       	jmpq   3e1 <printf+0x3b1>
      } else if(c == '%'){
 40e:	e9 42 00 00 00       	jmpq   455 <printf+0x425>
 413:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 417:	0f 85 15 00 00 00    	jne    432 <printf+0x402>
        putc(fd, c);
 41d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 420:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 423:	88 c1                	mov    %al,%cl
 425:	0f be f1             	movsbl %cl,%esi
 428:	e8 63 00 00 00       	callq  490 <putc>
      } else {
 42d:	e9 1e 00 00 00       	jmpq   450 <printf+0x420>
 432:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 437:	8b 7d fc             	mov    -0x4(%rbp),%edi
 43a:	e8 51 00 00 00       	callq  490 <putc>
        putc(fd, c);
 43f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 442:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 445:	40 88 f0             	mov    %sil,%al
 448:	0f be f0             	movsbl %al,%esi
 44b:	e8 40 00 00 00       	callq  490 <putc>
 450:	e9 00 00 00 00       	jmpq   455 <printf+0x425>
 455:	e9 00 00 00 00       	jmpq   45a <printf+0x42a>
 45a:	e9 00 00 00 00       	jmpq   45f <printf+0x42f>
 45f:	e9 00 00 00 00       	jmpq   464 <printf+0x434>
      }
      state = 0;
 464:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 46b:	e9 00 00 00 00       	jmpq   470 <printf+0x440>
    }
  }
 470:	e9 00 00 00 00       	jmpq   475 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 475:	8b 45 e0             	mov    -0x20(%rbp),%eax
 478:	83 c0 01             	add    $0x1,%eax
 47b:	89 45 e0             	mov    %eax,-0x20(%rbp)
 47e:	e9 fe fb ff ff       	jmpq   81 <printf+0x51>

  va_end(valist);
}
 483:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 48a:	5d                   	pop    %rbp
 48b:	c3                   	retq   
 48c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000490 <putc>:
{
 490:	55                   	push   %rbp
 491:	48 89 e5             	mov    %rsp,%rbp
 494:	48 83 ec 10          	sub    $0x10,%rsp
 498:	40 88 f0             	mov    %sil,%al
 49b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 49f:	ba 01 00 00 00       	mov    $0x1,%edx
 4a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
 4a7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 4aa:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4ad:	e8 d6 05 00 00       	callq  a88 <write>
}
 4b2:	89 45 f4             	mov    %eax,-0xc(%rbp)
 4b5:	48 83 c4 10          	add    $0x10,%rsp
 4b9:	5d                   	pop    %rbp
 4ba:	c3                   	retq   
 4bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000004c0 <printint64>:
{
 4c0:	55                   	push   %rbp
 4c1:	48 89 e5             	mov    %rsp,%rbp
 4c4:	48 83 ec 50          	sub    $0x50,%rsp
 4c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 4cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 4ce:	89 55 f4             	mov    %edx,-0xc(%rbp)
 4d1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 4d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 4d8:	0f 84 30 00 00 00    	je     50e <printint64+0x4e>
 4de:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 4e2:	0f 9c c0             	setl   %al
 4e5:	88 c1                	mov    %al,%cl
 4e7:	80 e1 01             	and    $0x1,%cl
 4ea:	0f b6 d1             	movzbl %cl,%edx
 4ed:	89 55 f0             	mov    %edx,-0x10(%rbp)
 4f0:	a8 01                	test   $0x1,%al
 4f2:	0f 85 05 00 00 00    	jne    4fd <printint64+0x3d>
 4f8:	e9 11 00 00 00       	jmpq   50e <printint64+0x4e>
 4fd:	31 c0                	xor    %eax,%eax
    x = -xx;
 4ff:	2b 45 f8             	sub    -0x8(%rbp),%eax
 502:	48 63 c8             	movslq %eax,%rcx
 505:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 509:	e9 08 00 00 00       	jmpq   516 <printint64+0x56>
    x = xx;
 50e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 512:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 516:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 51d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 521:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 525:	31 d2                	xor    %edx,%edx
 527:	48 f7 f1             	div    %rcx
 52a:	40 8a 34 15 a0 10 00 	mov    0x10a0(,%rdx,1),%sil
 531:	00 
 532:	8b 7d cc             	mov    -0x34(%rbp),%edi
 535:	41 89 f8             	mov    %edi,%r8d
 538:	41 83 c0 01          	add    $0x1,%r8d
 53c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 540:	48 63 cf             	movslq %edi,%rcx
 543:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 548:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 54c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 550:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 554:	48 89 c8             	mov    %rcx,%rax
 557:	31 d2                	xor    %edx,%edx
 559:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 55d:	48 f7 f1             	div    %rcx
 560:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 564:	48 83 f8 00          	cmp    $0x0,%rax
 568:	0f 85 af ff ff ff    	jne    51d <printint64+0x5d>
  if(sgn)
 56e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 572:	0f 84 13 00 00 00    	je     58b <printint64+0xcb>
    buf[i++] = '-';
 578:	8b 45 cc             	mov    -0x34(%rbp),%eax
 57b:	89 c1                	mov    %eax,%ecx
 57d:	83 c1 01             	add    $0x1,%ecx
 580:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 583:	48 63 d0             	movslq %eax,%rdx
 586:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 58b:	e9 00 00 00 00       	jmpq   590 <printint64+0xd0>
 590:	8b 45 cc             	mov    -0x34(%rbp),%eax
 593:	83 c0 ff             	add    $0xffffffff,%eax
 596:	89 45 cc             	mov    %eax,-0x34(%rbp)
 599:	83 f8 00             	cmp    $0x0,%eax
 59c:	0f 8c 16 00 00 00    	jl     5b8 <printint64+0xf8>
    putc(fd, buf[i]);
 5a2:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5a5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 5a9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 5ae:	e8 dd fe ff ff       	callq  490 <putc>
  while(--i >= 0)
 5b3:	e9 d8 ff ff ff       	jmpq   590 <printint64+0xd0>
}
 5b8:	48 83 c4 50          	add    $0x50,%rsp
 5bc:	5d                   	pop    %rbp
 5bd:	c3                   	retq   
 5be:	66 90                	xchg   %ax,%ax

00000000000005c0 <printint>:
{
 5c0:	55                   	push   %rbp
 5c1:	48 89 e5             	mov    %rsp,%rbp
 5c4:	48 83 ec 30          	sub    $0x30,%rsp
 5c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 5cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 5ce:	89 55 f4             	mov    %edx,-0xc(%rbp)
 5d1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 5d4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 5db:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 5df:	0f 84 1e 00 00 00    	je     603 <printint+0x43>
 5e5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 5e9:	0f 8d 14 00 00 00    	jge    603 <printint+0x43>
 5ef:	31 c0                	xor    %eax,%eax
    neg = 1;
 5f1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 5f8:	2b 45 f8             	sub    -0x8(%rbp),%eax
 5fb:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 5fe:	e9 06 00 00 00       	jmpq   609 <printint+0x49>
    x = xx;
 603:	8b 45 f8             	mov    -0x8(%rbp),%eax
 606:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 609:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 610:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 613:	31 d2                	xor    %edx,%edx
 615:	f7 75 f4             	divl   -0xc(%rbp)
 618:	89 d2                	mov    %edx,%edx
 61a:	89 d1                	mov    %edx,%ecx
 61c:	40 8a 34 0d c0 10 00 	mov    0x10c0(,%rcx,1),%sil
 623:	00 
 624:	8b 55 dc             	mov    -0x24(%rbp),%edx
 627:	89 d7                	mov    %edx,%edi
 629:	83 c7 01             	add    $0x1,%edi
 62c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 62f:	48 63 ca             	movslq %edx,%rcx
 632:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 637:	8b 45 f4             	mov    -0xc(%rbp),%eax
 63a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 63d:	89 45 d0             	mov    %eax,-0x30(%rbp)
 640:	89 c8                	mov    %ecx,%eax
 642:	31 d2                	xor    %edx,%edx
 644:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 647:	f7 f1                	div    %ecx
 649:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 64c:	83 f8 00             	cmp    $0x0,%eax
 64f:	0f 85 bb ff ff ff    	jne    610 <printint+0x50>
  if(neg)
 655:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 659:	0f 84 13 00 00 00    	je     672 <printint+0xb2>
    buf[i++] = '-';
 65f:	8b 45 dc             	mov    -0x24(%rbp),%eax
 662:	89 c1                	mov    %eax,%ecx
 664:	83 c1 01             	add    $0x1,%ecx
 667:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 66a:	48 63 d0             	movslq %eax,%rdx
 66d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 672:	e9 00 00 00 00       	jmpq   677 <printint+0xb7>
 677:	8b 45 dc             	mov    -0x24(%rbp),%eax
 67a:	83 c0 ff             	add    $0xffffffff,%eax
 67d:	89 45 dc             	mov    %eax,-0x24(%rbp)
 680:	83 f8 00             	cmp    $0x0,%eax
 683:	0f 8c 16 00 00 00    	jl     69f <printint+0xdf>
    putc(fd, buf[i]);
 689:	8b 7d fc             	mov    -0x4(%rbp),%edi
 68c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 690:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 695:	e8 f6 fd ff ff       	callq  490 <putc>
  while(--i >= 0)
 69a:	e9 d8 ff ff ff       	jmpq   677 <printint+0xb7>
}
 69f:	48 83 c4 30          	add    $0x30,%rsp
 6a3:	5d                   	pop    %rbp
 6a4:	c3                   	retq   
 6a5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6ac:	00 00 00 
 6af:	90                   	nop

00000000000006b0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 6b0:	55                   	push   %rbp
 6b1:	48 89 e5             	mov    %rsp,%rbp
 6b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 6b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 6bc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 6c0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 6c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 6c8:	48 89 c1             	mov    %rax,%rcx
 6cb:	48 83 c1 01          	add    $0x1,%rcx
 6cf:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 6d3:	8a 10                	mov    (%rax),%dl
 6d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 6d9:	48 89 c1             	mov    %rax,%rcx
 6dc:	48 83 c1 01          	add    $0x1,%rcx
 6e0:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 6e4:	88 10                	mov    %dl,(%rax)
 6e6:	0f be f2             	movsbl %dl,%esi
 6e9:	83 fe 00             	cmp    $0x0,%esi
 6ec:	0f 84 05 00 00 00    	je     6f7 <strcpy+0x47>
 6f2:	e9 cd ff ff ff       	jmpq   6c4 <strcpy+0x14>
    ;
  return os;
 6f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 6fb:	5d                   	pop    %rbp
 6fc:	c3                   	retq   
 6fd:	0f 1f 00             	nopl   (%rax)

0000000000000700 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 700:	55                   	push   %rbp
 701:	48 89 e5             	mov    %rsp,%rbp
 704:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 708:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 70c:	31 c0                	xor    %eax,%eax
 70e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 710:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 714:	0f be 02             	movsbl (%rdx),%eax
 717:	83 f8 00             	cmp    $0x0,%eax
 71a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 71d:	0f 84 18 00 00 00    	je     73b <strcmp+0x3b>
 723:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 727:	0f be 08             	movsbl (%rax),%ecx
 72a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 72e:	0f be 10             	movsbl (%rax),%edx
 731:	39 d1                	cmp    %edx,%ecx
 733:	40 0f 94 c6          	sete   %sil
 737:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 73b:	8a 45 ef             	mov    -0x11(%rbp),%al
 73e:	a8 01                	test   $0x1,%al
 740:	0f 85 05 00 00 00    	jne    74b <strcmp+0x4b>
 746:	e9 1d 00 00 00       	jmpq   768 <strcmp+0x68>
    p++, q++;
 74b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 74f:	48 83 c0 01          	add    $0x1,%rax
 753:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 757:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 75b:	48 83 c0 01          	add    $0x1,%rax
 75f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 763:	e9 a4 ff ff ff       	jmpq   70c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 768:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 76c:	0f b6 08             	movzbl (%rax),%ecx
 76f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 773:	0f b6 10             	movzbl (%rax),%edx
 776:	29 d1                	sub    %edx,%ecx
 778:	89 c8                	mov    %ecx,%eax
 77a:	5d                   	pop    %rbp
 77b:	c3                   	retq   
 77c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000780 <strlen>:
}

uint
strlen(char *s)
{
 780:	55                   	push   %rbp
 781:	48 89 e5             	mov    %rsp,%rbp
 784:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 788:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 78f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 793:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 797:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 79b:	0f 84 13 00 00 00    	je     7b4 <strlen+0x34>
 7a1:	e9 00 00 00 00       	jmpq   7a6 <strlen+0x26>
 7a6:	8b 45 f4             	mov    -0xc(%rbp),%eax
 7a9:	83 c0 01             	add    $0x1,%eax
 7ac:	89 45 f4             	mov    %eax,-0xc(%rbp)
 7af:	e9 db ff ff ff       	jmpq   78f <strlen+0xf>
    ;
  return n;
 7b4:	8b 45 f4             	mov    -0xc(%rbp),%eax
 7b7:	5d                   	pop    %rbp
 7b8:	c3                   	retq   
 7b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000007c0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 7c0:	55                   	push   %rbp
 7c1:	48 89 e5             	mov    %rsp,%rbp
 7c4:	48 83 ec 10          	sub    $0x10,%rsp
 7c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 7cc:	89 75 f4             	mov    %esi,-0xc(%rbp)
 7cf:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 7d2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 7d6:	8b 75 f4             	mov    -0xc(%rbp),%esi
 7d9:	8b 55 f0             	mov    -0x10(%rbp),%edx
 7dc:	e8 0f 00 00 00       	callq  7f0 <stosb>
  return dst;
 7e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7e5:	48 83 c4 10          	add    $0x10,%rsp
 7e9:	5d                   	pop    %rbp
 7ea:	c3                   	retq   
 7eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000007f0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 7f0:	55                   	push   %rbp
 7f1:	48 89 e5             	mov    %rsp,%rbp
 7f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 7f8:	89 75 f4             	mov    %esi,-0xc(%rbp)
 7fb:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 7fe:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 802:	8b 55 f0             	mov    -0x10(%rbp),%edx
 805:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 808:	89 d1                	mov    %edx,%ecx
 80a:	fc                   	cld    
 80b:	f3 aa                	rep stos %al,%es:(%rdi)
 80d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 811:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 814:	5d                   	pop    %rbp
 815:	c3                   	retq   
 816:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 81d:	00 00 00 

0000000000000820 <strchr>:
}

char*
strchr(const char *s, char c)
{
 820:	55                   	push   %rbp
 821:	48 89 e5             	mov    %rsp,%rbp
 824:	40 88 f0             	mov    %sil,%al
 827:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 82b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 82e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 832:	80 38 00             	cmpb   $0x0,(%rax)
 835:	0f 84 36 00 00 00    	je     871 <strchr+0x51>
    if(*s == c)
 83b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 83f:	0f be 08             	movsbl (%rax),%ecx
 842:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 846:	39 d1                	cmp    %edx,%ecx
 848:	0f 85 0d 00 00 00    	jne    85b <strchr+0x3b>
      return (char*)s;
 84e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 852:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 856:	e9 1e 00 00 00       	jmpq   879 <strchr+0x59>
    if(*s == c)
 85b:	e9 00 00 00 00       	jmpq   860 <strchr+0x40>
  for(; *s; s++)
 860:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 864:	48 83 c0 01          	add    $0x1,%rax
 868:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 86c:	e9 bd ff ff ff       	jmpq   82e <strchr+0xe>
  return 0;
 871:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 878:	00 
}
 879:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 87d:	5d                   	pop    %rbp
 87e:	c3                   	retq   
 87f:	90                   	nop

0000000000000880 <gets>:

char*
gets(char *buf, int max)
{
 880:	55                   	push   %rbp
 881:	48 89 e5             	mov    %rsp,%rbp
 884:	48 83 ec 20          	sub    $0x20,%rsp
 888:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 88c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 88f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 896:	8b 45 f0             	mov    -0x10(%rbp),%eax
 899:	83 c0 01             	add    $0x1,%eax
 89c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 89f:	0f 8d 5e 00 00 00    	jge    903 <gets+0x83>
 8a5:	31 ff                	xor    %edi,%edi
 8a7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 8ab:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 8b0:	e8 cb 01 00 00       	callq  a80 <read>
 8b5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 8b8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 8bc:	0f 8d 05 00 00 00    	jge    8c7 <gets+0x47>
      break;
 8c2:	e9 3c 00 00 00       	jmpq   903 <gets+0x83>
    buf[i++] = c;
 8c7:	8a 45 eb             	mov    -0x15(%rbp),%al
 8ca:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 8ce:	8b 55 f0             	mov    -0x10(%rbp),%edx
 8d1:	89 d6                	mov    %edx,%esi
 8d3:	83 c6 01             	add    $0x1,%esi
 8d6:	89 75 f0             	mov    %esi,-0x10(%rbp)
 8d9:	48 63 fa             	movslq %edx,%rdi
 8dc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 8df:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 8e3:	83 fa 0a             	cmp    $0xa,%edx
 8e6:	0f 84 0d 00 00 00    	je     8f9 <gets+0x79>
 8ec:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 8f0:	83 f8 0d             	cmp    $0xd,%eax
 8f3:	0f 85 05 00 00 00    	jne    8fe <gets+0x7e>
      break;
 8f9:	e9 05 00 00 00       	jmpq   903 <gets+0x83>
  for(i=0; i+1 < max; ){
 8fe:	e9 93 ff ff ff       	jmpq   896 <gets+0x16>
  }
  buf[i] = '\0';
 903:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 907:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 90b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 90f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 913:	48 83 c4 20          	add    $0x20,%rsp
 917:	5d                   	pop    %rbp
 918:	c3                   	retq   
 919:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000920 <stat>:
}

int
stat(char *n, struct stat *st)
{
 920:	55                   	push   %rbp
 921:	48 89 e5             	mov    %rsp,%rbp
 924:	48 83 ec 30          	sub    $0x30,%rsp
 928:	31 c0                	xor    %eax,%eax
 92a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 92e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 932:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 936:	89 c6                	mov    %eax,%esi
 938:	e8 6b 01 00 00       	callq  aa8 <open>
 93d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 940:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 944:	0f 8d 0c 00 00 00    	jge    956 <stat+0x36>
    return -1;
 94a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 951:	e9 20 00 00 00       	jmpq   976 <stat+0x56>
  r = fstat(fd, st);
 956:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 959:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 95d:	e8 5e 01 00 00       	callq  ac0 <fstat>
 962:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 965:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 968:	e8 23 01 00 00       	callq  a90 <close>
  return r;
 96d:	8b 7d e0             	mov    -0x20(%rbp),%edi
 970:	89 7d fc             	mov    %edi,-0x4(%rbp)
 973:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 976:	8b 45 fc             	mov    -0x4(%rbp),%eax
 979:	48 83 c4 30          	add    $0x30,%rsp
 97d:	5d                   	pop    %rbp
 97e:	c3                   	retq   
 97f:	90                   	nop

0000000000000980 <atoi>:

int
atoi(const char *s)
{
 980:	55                   	push   %rbp
 981:	48 89 e5             	mov    %rsp,%rbp
 984:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 988:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 98f:	31 c0                	xor    %eax,%eax
 991:	88 c1                	mov    %al,%cl
 993:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 998:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 99c:	0f be 32             	movsbl (%rdx),%esi
 99f:	39 f0                	cmp    %esi,%eax
 9a1:	88 4d f3             	mov    %cl,-0xd(%rbp)
 9a4:	0f 8f 10 00 00 00    	jg     9ba <atoi+0x3a>
 9aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 9ae:	0f be 08             	movsbl (%rax),%ecx
 9b1:	83 f9 39             	cmp    $0x39,%ecx
 9b4:	0f 9e c2             	setle  %dl
 9b7:	88 55 f3             	mov    %dl,-0xd(%rbp)
 9ba:	8a 45 f3             	mov    -0xd(%rbp),%al
 9bd:	a8 01                	test   $0x1,%al
 9bf:	0f 85 05 00 00 00    	jne    9ca <atoi+0x4a>
 9c5:	e9 23 00 00 00       	jmpq   9ed <atoi+0x6d>
    n = n*10 + *s++ - '0';
 9ca:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 9ce:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9d2:	48 89 ca             	mov    %rcx,%rdx
 9d5:	48 83 c2 01          	add    $0x1,%rdx
 9d9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 9dd:	0f be 31             	movsbl (%rcx),%esi
 9e0:	01 f0                	add    %esi,%eax
 9e2:	83 e8 30             	sub    $0x30,%eax
 9e5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 9e8:	e9 a2 ff ff ff       	jmpq   98f <atoi+0xf>
  return n;
 9ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
 9f0:	5d                   	pop    %rbp
 9f1:	c3                   	retq   
 9f2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 9f9:	1f 84 00 00 00 00 00 

0000000000000a00 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 a00:	55                   	push   %rbp
 a01:	48 89 e5             	mov    %rsp,%rbp
 a04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 a08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 a0c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 a0f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 a13:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 a17:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 a1b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 a1f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 a22:	89 c1                	mov    %eax,%ecx
 a24:	83 c1 ff             	add    $0xffffffff,%ecx
 a27:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 a2a:	83 f8 00             	cmp    $0x0,%eax
 a2d:	0f 8e 27 00 00 00    	jle    a5a <memmove+0x5a>
    *dst++ = *src++;
 a33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a37:	48 89 c1             	mov    %rax,%rcx
 a3a:	48 83 c1 01          	add    $0x1,%rcx
 a3e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 a42:	8a 10                	mov    (%rax),%dl
 a44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 a48:	48 89 c1             	mov    %rax,%rcx
 a4b:	48 83 c1 01          	add    $0x1,%rcx
 a4f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 a53:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 a55:	e9 c5 ff ff ff       	jmpq   a1f <memmove+0x1f>
  return vdst;
 a5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a5e:	5d                   	pop    %rbp
 a5f:	c3                   	retq   

0000000000000a60 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 a60:	b8 01 00 00 00       	mov    $0x1,%eax
 a65:	cd 40                	int    $0x40
 a67:	c3                   	retq   

0000000000000a68 <exit>:
SYSCALL(exit)
 a68:	b8 02 00 00 00       	mov    $0x2,%eax
 a6d:	cd 40                	int    $0x40
 a6f:	c3                   	retq   

0000000000000a70 <wait>:
SYSCALL(wait)
 a70:	b8 03 00 00 00       	mov    $0x3,%eax
 a75:	cd 40                	int    $0x40
 a77:	c3                   	retq   

0000000000000a78 <pipe>:
SYSCALL(pipe)
 a78:	b8 04 00 00 00       	mov    $0x4,%eax
 a7d:	cd 40                	int    $0x40
 a7f:	c3                   	retq   

0000000000000a80 <read>:
SYSCALL(read)
 a80:	b8 05 00 00 00       	mov    $0x5,%eax
 a85:	cd 40                	int    $0x40
 a87:	c3                   	retq   

0000000000000a88 <write>:
SYSCALL(write)
 a88:	b8 10 00 00 00       	mov    $0x10,%eax
 a8d:	cd 40                	int    $0x40
 a8f:	c3                   	retq   

0000000000000a90 <close>:
SYSCALL(close)
 a90:	b8 15 00 00 00       	mov    $0x15,%eax
 a95:	cd 40                	int    $0x40
 a97:	c3                   	retq   

0000000000000a98 <kill>:
SYSCALL(kill)
 a98:	b8 06 00 00 00       	mov    $0x6,%eax
 a9d:	cd 40                	int    $0x40
 a9f:	c3                   	retq   

0000000000000aa0 <exec>:
SYSCALL(exec)
 aa0:	b8 07 00 00 00       	mov    $0x7,%eax
 aa5:	cd 40                	int    $0x40
 aa7:	c3                   	retq   

0000000000000aa8 <open>:
SYSCALL(open)
 aa8:	b8 0f 00 00 00       	mov    $0xf,%eax
 aad:	cd 40                	int    $0x40
 aaf:	c3                   	retq   

0000000000000ab0 <mknod>:
SYSCALL(mknod)
 ab0:	b8 11 00 00 00       	mov    $0x11,%eax
 ab5:	cd 40                	int    $0x40
 ab7:	c3                   	retq   

0000000000000ab8 <unlink>:
SYSCALL(unlink)
 ab8:	b8 12 00 00 00       	mov    $0x12,%eax
 abd:	cd 40                	int    $0x40
 abf:	c3                   	retq   

0000000000000ac0 <fstat>:
SYSCALL(fstat)
 ac0:	b8 08 00 00 00       	mov    $0x8,%eax
 ac5:	cd 40                	int    $0x40
 ac7:	c3                   	retq   

0000000000000ac8 <link>:
SYSCALL(link)
 ac8:	b8 13 00 00 00       	mov    $0x13,%eax
 acd:	cd 40                	int    $0x40
 acf:	c3                   	retq   

0000000000000ad0 <mkdir>:
SYSCALL(mkdir)
 ad0:	b8 14 00 00 00       	mov    $0x14,%eax
 ad5:	cd 40                	int    $0x40
 ad7:	c3                   	retq   

0000000000000ad8 <chdir>:
SYSCALL(chdir)
 ad8:	b8 09 00 00 00       	mov    $0x9,%eax
 add:	cd 40                	int    $0x40
 adf:	c3                   	retq   

0000000000000ae0 <dup>:
SYSCALL(dup)
 ae0:	b8 0a 00 00 00       	mov    $0xa,%eax
 ae5:	cd 40                	int    $0x40
 ae7:	c3                   	retq   

0000000000000ae8 <getpid>:
SYSCALL(getpid)
 ae8:	b8 0b 00 00 00       	mov    $0xb,%eax
 aed:	cd 40                	int    $0x40
 aef:	c3                   	retq   

0000000000000af0 <sbrk>:
SYSCALL(sbrk)
 af0:	b8 0c 00 00 00       	mov    $0xc,%eax
 af5:	cd 40                	int    $0x40
 af7:	c3                   	retq   

0000000000000af8 <sleep>:
SYSCALL(sleep)
 af8:	b8 0d 00 00 00       	mov    $0xd,%eax
 afd:	cd 40                	int    $0x40
 aff:	c3                   	retq   

0000000000000b00 <uptime>:
SYSCALL(uptime)
 b00:	b8 0e 00 00 00       	mov    $0xe,%eax
 b05:	cd 40                	int    $0x40
 b07:	c3                   	retq   

0000000000000b08 <sysinfo>:
SYSCALL(sysinfo)
 b08:	b8 16 00 00 00       	mov    $0x16,%eax
 b0d:	cd 40                	int    $0x40
 b0f:	c3                   	retq   

0000000000000b10 <mmap>:
SYSCALL(mmap)
 b10:	b8 17 00 00 00       	mov    $0x17,%eax
 b15:	cd 40                	int    $0x40
 b17:	c3                   	retq   

0000000000000b18 <munmap>:
SYSCALL(munmap)
 b18:	b8 18 00 00 00       	mov    $0x18,%eax
 b1d:	cd 40                	int    $0x40
 b1f:	c3                   	retq   

0000000000000b20 <crashn>:
SYSCALL(crashn)
 b20:	b8 19 00 00 00       	mov    $0x19,%eax
 b25:	cd 40                	int    $0x40
 b27:	c3                   	retq   
 b28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 b2f:	00 

0000000000000b30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b30:	55                   	push   %rbp
 b31:	48 89 e5             	mov    %rsp,%rbp
 b34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b38:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 b3c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 b40:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b44:	48 8b 3c 25 d8 10 00 	mov    0x10d8,%rdi
 b4b:	00 
 b4c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 b50:	31 c0                	xor    %eax,%eax
 b52:	88 c1                	mov    %al,%cl
 b54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 b58:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 b5c:	88 4d e7             	mov    %cl,-0x19(%rbp)
 b5f:	0f 86 11 00 00 00    	jbe    b76 <free+0x46>
 b65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 b69:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 b6d:	48 3b 01             	cmp    (%rcx),%rax
 b70:	0f 92 c2             	setb   %dl
 b73:	88 55 e7             	mov    %dl,-0x19(%rbp)
 b76:	8a 45 e7             	mov    -0x19(%rbp),%al
 b79:	34 ff                	xor    $0xff,%al
 b7b:	a8 01                	test   $0x1,%al
 b7d:	0f 85 05 00 00 00    	jne    b88 <free+0x58>
 b83:	e9 4a 00 00 00       	jmpq   bd2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 b8c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 b90:	48 3b 01             	cmp    (%rcx),%rax
 b93:	0f 82 24 00 00 00    	jb     bbd <free+0x8d>
 b99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 b9d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 ba1:	0f 87 11 00 00 00    	ja     bb8 <free+0x88>
 ba7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 baf:	48 3b 01             	cmp    (%rcx),%rax
 bb2:	0f 83 05 00 00 00    	jae    bbd <free+0x8d>
      break;
 bb8:	e9 15 00 00 00       	jmpq   bd2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bbd:	e9 00 00 00 00       	jmpq   bc2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 bc6:	48 8b 00             	mov    (%rax),%rax
 bc9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 bcd:	e9 7e ff ff ff       	jmpq   b50 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 bd2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bd6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 bda:	8b 51 08             	mov    0x8(%rcx),%edx
 bdd:	89 d1                	mov    %edx,%ecx
 bdf:	48 c1 e1 04          	shl    $0x4,%rcx
 be3:	48 01 c8             	add    %rcx,%rax
 be6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bea:	48 3b 01             	cmp    (%rcx),%rax
 bed:	0f 85 2a 00 00 00    	jne    c1d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 bf3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 bf7:	48 8b 00             	mov    (%rax),%rax
 bfa:	8b 48 08             	mov    0x8(%rax),%ecx
 bfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c01:	03 48 08             	add    0x8(%rax),%ecx
 c04:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 c07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c0b:	48 8b 00             	mov    (%rax),%rax
 c0e:	48 8b 00             	mov    (%rax),%rax
 c11:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c15:	48 89 02             	mov    %rax,(%rdx)
  } else
 c18:	e9 0e 00 00 00       	jmpq   c2b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 c1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c21:	48 8b 00             	mov    (%rax),%rax
 c24:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c28:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 c2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c2f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c33:	8b 51 08             	mov    0x8(%rcx),%edx
 c36:	89 d1                	mov    %edx,%ecx
 c38:	48 c1 e1 04          	shl    $0x4,%rcx
 c3c:	48 01 c8             	add    %rcx,%rax
 c3f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 c43:	0f 85 24 00 00 00    	jne    c6d <free+0x13d>
    p->s.size += bp->s.size;
 c49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c4d:	8b 48 08             	mov    0x8(%rax),%ecx
 c50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c54:	03 48 08             	add    0x8(%rax),%ecx
 c57:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 c5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c5e:	48 8b 00             	mov    (%rax),%rax
 c61:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 c65:	48 89 02             	mov    %rax,(%rdx)
  } else
 c68:	e9 0b 00 00 00       	jmpq   c78 <free+0x148>
    p->s.ptr = bp;
 c6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c71:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c75:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 c78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c7c:	48 89 04 25 d8 10 00 	mov    %rax,0x10d8
 c83:	00 
}
 c84:	5d                   	pop    %rbp
 c85:	c3                   	retq   
 c86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 c8d:	00 00 00 

0000000000000c90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c90:	55                   	push   %rbp
 c91:	48 89 e5             	mov    %rsp,%rbp
 c94:	48 83 ec 30          	sub    $0x30,%rsp
 c98:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c9b:	8b 7d f4             	mov    -0xc(%rbp),%edi
 c9e:	89 f8                	mov    %edi,%eax
 ca0:	48 83 c0 10          	add    $0x10,%rax
 ca4:	48 83 e8 01          	sub    $0x1,%rax
 ca8:	48 c1 e8 04          	shr    $0x4,%rax
 cac:	48 83 c0 01          	add    $0x1,%rax
 cb0:	89 c7                	mov    %eax,%edi
 cb2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 cb5:	48 8b 04 25 d8 10 00 	mov    0x10d8,%rax
 cbc:	00 
 cbd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 cc1:	48 83 f8 00          	cmp    $0x0,%rax
 cc5:	0f 85 29 00 00 00    	jne    cf4 <malloc+0x64>
 ccb:	48 b8 e0 10 00 00 00 	movabs $0x10e0,%rax
 cd2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 cd5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 cd9:	48 89 04 25 d8 10 00 	mov    %rax,0x10d8
 ce0:	00 
 ce1:	48 89 04 25 e0 10 00 	mov    %rax,0x10e0
 ce8:	00 
    base.s.size = 0;
 ce9:	c7 04 25 e8 10 00 00 	movl   $0x0,0x10e8
 cf0:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cf4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 cf8:	48 8b 00             	mov    (%rax),%rax
 cfb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 cff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d03:	8b 48 08             	mov    0x8(%rax),%ecx
 d06:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d09:	0f 82 73 00 00 00    	jb     d82 <malloc+0xf2>
      if(p->s.size == nunits)
 d0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d13:	8b 48 08             	mov    0x8(%rax),%ecx
 d16:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d19:	0f 85 13 00 00 00    	jne    d32 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 d1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d23:	48 8b 00             	mov    (%rax),%rax
 d26:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 d2a:	48 89 01             	mov    %rax,(%rcx)
 d2d:	e9 33 00 00 00       	jmpq   d65 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 d32:	8b 45 dc             	mov    -0x24(%rbp),%eax
 d35:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d39:	8b 51 08             	mov    0x8(%rcx),%edx
 d3c:	29 c2                	sub    %eax,%edx
 d3e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 d41:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d45:	8b 41 08             	mov    0x8(%rcx),%eax
 d48:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d4c:	89 c0                	mov    %eax,%eax
 d4e:	89 c6                	mov    %eax,%esi
 d50:	48 c1 e6 04          	shl    $0x4,%rsi
 d54:	48 01 f1             	add    %rsi,%rcx
 d57:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 d5b:	8b 45 dc             	mov    -0x24(%rbp),%eax
 d5e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d62:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 d65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 d69:	48 89 04 25 d8 10 00 	mov    %rax,0x10d8
 d70:	00 
      return (void*)(p + 1);
 d71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d75:	48 83 c0 10          	add    $0x10,%rax
 d79:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 d7d:	e9 57 00 00 00       	jmpq   dd9 <malloc+0x149>
    }
    if(p == freep)
 d82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d86:	48 3b 04 25 d8 10 00 	cmp    0x10d8,%rax
 d8d:	00 
 d8e:	0f 85 28 00 00 00    	jne    dbc <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 d94:	8b 7d dc             	mov    -0x24(%rbp),%edi
 d97:	e8 54 00 00 00       	callq  df0 <morecore>
 d9c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 da0:	48 83 f8 00          	cmp    $0x0,%rax
 da4:	0f 85 0d 00 00 00    	jne    db7 <malloc+0x127>
        return 0;
 daa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 db1:	00 
 db2:	e9 22 00 00 00       	jmpq   dd9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 db7:	e9 00 00 00 00       	jmpq   dbc <malloc+0x12c>
  }
 dbc:	e9 00 00 00 00       	jmpq   dc1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 dc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dc5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 dc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dcd:	48 8b 00             	mov    (%rax),%rax
 dd0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 dd4:	e9 26 ff ff ff       	jmpq   cff <malloc+0x6f>
 dd9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ddd:	48 83 c4 30          	add    $0x30,%rsp
 de1:	5d                   	pop    %rbp
 de2:	c3                   	retq   
 de3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 dea:	84 00 00 00 00 00 

0000000000000df0 <morecore>:
{
 df0:	55                   	push   %rbp
 df1:	48 89 e5             	mov    %rsp,%rbp
 df4:	48 83 ec 20          	sub    $0x20,%rsp
 df8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 dfb:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 e02:	0f 83 07 00 00 00    	jae    e0f <morecore+0x1f>
    nu = 4096;
 e08:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 e0f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 e12:	89 c1                	mov    %eax,%ecx
 e14:	48 c1 e1 04          	shl    $0x4,%rcx
 e18:	89 c8                	mov    %ecx,%eax
 e1a:	89 c7                	mov    %eax,%edi
 e1c:	e8 cf fc ff ff       	callq  af0 <sbrk>
 e21:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 e28:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 e2c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 e30:	0f 85 0d 00 00 00    	jne    e43 <morecore+0x53>
    return 0;
 e36:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e3d:	00 
 e3e:	e9 2e 00 00 00       	jmpq   e71 <morecore+0x81>
  hp = (Header*)p;
 e43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e47:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 e4b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 e4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e52:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 e55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e59:	48 83 c0 10          	add    $0x10,%rax
 e5d:	48 89 c7             	mov    %rax,%rdi
 e60:	e8 cb fc ff ff       	callq  b30 <free>
  return freep;
 e65:	48 8b 04 25 d8 10 00 	mov    0x10d8,%rax
 e6c:	00 
 e6d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 e71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 e75:	48 83 c4 20          	add    $0x20,%rsp
 e79:	5d                   	pop    %rbp
 e7a:	c3                   	retq   
