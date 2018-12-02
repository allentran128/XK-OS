
out/user/_ln:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <stat.h>
#include <user.h>

int
main(int argc, char *argv[])
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	89 7d f8             	mov    %edi,-0x8(%rbp)
   b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  if(argc != 3){
   f:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
  13:	0f 84 1e 00 00 00    	je     37 <main+0x37>
  19:	bf 02 00 00 00       	mov    $0x2,%edi
  1e:	48 be db 0e 00 00 00 	movabs $0xedb,%rsi
  25:	00 00 00 
    printf(2, "Usage: ln old new\n");
  28:	b0 00                	mov    $0x0,%al
  2a:	e8 61 00 00 00       	callq  90 <printf>
    exit();
  2f:	e8 94 0a 00 00       	callq  ac8 <exit>
  34:	89 45 ec             	mov    %eax,-0x14(%rbp)
  }
  if(link(argv[1], argv[2]) < 0)
  37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  3b:	48 8b 78 08          	mov    0x8(%rax),%rdi
  3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  43:	48 8b 70 10          	mov    0x10(%rax),%rsi
  47:	e8 dc 0a 00 00       	callq  b28 <link>
  4c:	83 f8 00             	cmp    $0x0,%eax
  4f:	0f 8d 26 00 00 00    	jge    7b <main+0x7b>
  55:	bf 02 00 00 00       	mov    $0x2,%edi
  5a:	48 be ee 0e 00 00 00 	movabs $0xeee,%rsi
  61:	00 00 00 
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  68:	48 8b 50 08          	mov    0x8(%rax),%rdx
  6c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  70:	48 8b 48 10          	mov    0x10(%rax),%rcx
  74:	b0 00                	mov    $0x0,%al
  76:	e8 15 00 00 00       	callq  90 <printf>
  exit();
  7b:	e8 48 0a 00 00       	callq  ac8 <exit>
  80:	89 45 e8             	mov    %eax,-0x18(%rbp)
  83:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  8a:	00 00 00 
  8d:	0f 1f 00             	nopl   (%rax)

0000000000000090 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
  90:	55                   	push   %rbp
  91:	48 89 e5             	mov    %rsp,%rbp
  94:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  9b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  9f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  a3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
  a7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  ab:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  af:	89 7d fc             	mov    %edi,-0x4(%rbp)
  b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  b6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
  ba:	48 89 51 10          	mov    %rdx,0x10(%rcx)
  be:	48 8d 55 10          	lea    0x10(%rbp),%rdx
  c2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  c6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
  cd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
  d3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
  da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  e5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  e9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
  ed:	0f 84 f0 03 00 00    	je     4e3 <printf+0x453>
    c = fmt[i] & 0xff;
  f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  f7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
  fb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
  ff:	81 e2 ff 00 00 00    	and    $0xff,%edx
 105:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
 108:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
 10c:	0f 85 32 00 00 00    	jne    144 <printf+0xb4>
      if(c == '%'){
 112:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 116:	0f 85 13 00 00 00    	jne    12f <printf+0x9f>
        state = '%';
 11c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 123:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 12a:	e9 10 00 00 00       	jmpq   13f <printf+0xaf>
        putc(fd, c);
 12f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 132:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 135:	88 c1                	mov    %al,%cl
 137:	0f be f1             	movsbl %cl,%esi
 13a:	e8 b1 03 00 00       	callq  4f0 <putc>
      }
    } else if(state == '%'){
 13f:	e9 8c 03 00 00       	jmpq   4d0 <printf+0x440>
 144:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 148:	0f 85 7d 03 00 00    	jne    4cb <printf+0x43b>
      if(c == 'l') {
 14e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 152:	0f 85 0c 00 00 00    	jne    164 <printf+0xd4>
        lflag = 1;
 158:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 15f:	e9 71 03 00 00       	jmpq   4d5 <printf+0x445>
      } else if(c == 'd'){
 164:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 168:	0f 85 0e 01 00 00    	jne    27c <printf+0x1ec>
        if (lflag == 1)
 16e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 172:	0f 85 79 00 00 00    	jne    1f1 <printf+0x161>
 178:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 17c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 17f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 182:	83 f9 28             	cmp    $0x28,%ecx
 185:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 189:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 18c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 18f:	0f 87 1f 00 00 00    	ja     1b4 <printf+0x124>
 195:	8b 45 80             	mov    -0x80(%rbp),%eax
 198:	48 63 c8             	movslq %eax,%rcx
 19b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 19f:	48 03 4a 10          	add    0x10(%rdx),%rcx
 1a3:	83 c0 08             	add    $0x8,%eax
 1a6:	89 02                	mov    %eax,(%rdx)
 1a8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 1af:	e9 1a 00 00 00       	jmpq   1ce <printf+0x13e>
 1b4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 1b8:	48 8b 48 08          	mov    0x8(%rax),%rcx
 1bc:	48 89 ca             	mov    %rcx,%rdx
 1bf:	48 83 c1 08          	add    $0x8,%rcx
 1c3:	48 89 48 08          	mov    %rcx,0x8(%rax)
 1c7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 1ce:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 1d5:	ba 0a 00 00 00       	mov    $0xa,%edx
 1da:	b9 01 00 00 00       	mov    $0x1,%ecx
 1df:	48 8b 00             	mov    (%rax),%rax
 1e2:	89 c6                	mov    %eax,%esi
 1e4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 1e7:	e8 34 03 00 00       	callq  520 <printint64>
 1ec:	e9 86 00 00 00       	jmpq   277 <printf+0x1e7>
 1f1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 1f5:	8b 7d fc             	mov    -0x4(%rbp),%edi
 1f8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 1fb:	83 f9 28             	cmp    $0x28,%ecx
 1fe:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 205:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 20b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 211:	0f 87 25 00 00 00    	ja     23c <printf+0x1ac>
 217:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 21d:	48 63 c8             	movslq %eax,%rcx
 220:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 227:	48 03 4a 10          	add    0x10(%rdx),%rcx
 22b:	83 c0 08             	add    $0x8,%eax
 22e:	89 02                	mov    %eax,(%rdx)
 230:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 237:	e9 1d 00 00 00       	jmpq   259 <printf+0x1c9>
 23c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 243:	48 8b 48 08          	mov    0x8(%rax),%rcx
 247:	48 89 ca             	mov    %rcx,%rdx
 24a:	48 83 c1 08          	add    $0x8,%rcx
 24e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 252:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 259:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 260:	ba 0a 00 00 00       	mov    $0xa,%edx
 265:	b9 01 00 00 00       	mov    $0x1,%ecx
 26a:	8b 30                	mov    (%rax),%esi
 26c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 272:	e8 a9 03 00 00       	callq  620 <printint>
      } else if(c == 'x' || c == 'p'){
 277:	e9 43 02 00 00       	jmpq   4bf <printf+0x42f>
 27c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 280:	0f 84 0a 00 00 00    	je     290 <printf+0x200>
 286:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 28a:	0f 85 1d 01 00 00    	jne    3ad <printf+0x31d>
        if (lflag == 1)
 290:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 294:	0f 85 8b 00 00 00    	jne    325 <printf+0x295>
 29a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 29e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 2a1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 2a4:	83 f9 28             	cmp    $0x28,%ecx
 2a7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 2ae:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 2b4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 2ba:	0f 87 25 00 00 00    	ja     2e5 <printf+0x255>
 2c0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 2c6:	48 63 c8             	movslq %eax,%rcx
 2c9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 2d0:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2d4:	83 c0 08             	add    $0x8,%eax
 2d7:	89 02                	mov    %eax,(%rdx)
 2d9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 2e0:	e9 1d 00 00 00       	jmpq   302 <printf+0x272>
 2e5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 2ec:	48 8b 48 08          	mov    0x8(%rax),%rcx
 2f0:	48 89 ca             	mov    %rcx,%rdx
 2f3:	48 83 c1 08          	add    $0x8,%rcx
 2f7:	48 89 48 08          	mov    %rcx,0x8(%rax)
 2fb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 302:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 309:	ba 10 00 00 00       	mov    $0x10,%edx
 30e:	31 c9                	xor    %ecx,%ecx
 310:	48 8b 00             	mov    (%rax),%rax
 313:	89 c6                	mov    %eax,%esi
 315:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 31b:	e8 00 02 00 00       	callq  520 <printint64>
 320:	e9 83 00 00 00       	jmpq   3a8 <printf+0x318>
 325:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 329:	8b 7d fc             	mov    -0x4(%rbp),%edi
 32c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 32f:	83 f9 28             	cmp    $0x28,%ecx
 332:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 339:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 33f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 345:	0f 87 25 00 00 00    	ja     370 <printf+0x2e0>
 34b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 351:	48 63 c8             	movslq %eax,%rcx
 354:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 35b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 35f:	83 c0 08             	add    $0x8,%eax
 362:	89 02                	mov    %eax,(%rdx)
 364:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 36b:	e9 1d 00 00 00       	jmpq   38d <printf+0x2fd>
 370:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 377:	48 8b 48 08          	mov    0x8(%rax),%rcx
 37b:	48 89 ca             	mov    %rcx,%rdx
 37e:	48 83 c1 08          	add    $0x8,%rcx
 382:	48 89 48 08          	mov    %rcx,0x8(%rax)
 386:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 38d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 394:	ba 10 00 00 00       	mov    $0x10,%edx
 399:	31 c9                	xor    %ecx,%ecx
 39b:	8b 30                	mov    (%rax),%esi
 39d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 3a3:	e8 78 02 00 00       	callq  620 <printint>
      } else if(c == 's'){
 3a8:	e9 0d 01 00 00       	jmpq   4ba <printf+0x42a>
 3ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 3b1:	0f 85 bc 00 00 00    	jne    473 <printf+0x3e3>
 3b7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 3bb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3be:	83 f9 28             	cmp    $0x28,%ecx
 3c1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 3c8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 3ce:	0f 87 25 00 00 00    	ja     3f9 <printf+0x369>
 3d4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 3da:	48 63 c8             	movslq %eax,%rcx
 3dd:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 3e4:	48 03 4a 10          	add    0x10(%rdx),%rcx
 3e8:	83 c0 08             	add    $0x8,%eax
 3eb:	89 02                	mov    %eax,(%rdx)
 3ed:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 3f4:	e9 1d 00 00 00       	jmpq   416 <printf+0x386>
 3f9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 400:	48 8b 48 08          	mov    0x8(%rax),%rcx
 404:	48 89 ca             	mov    %rcx,%rdx
 407:	48 83 c1 08          	add    $0x8,%rcx
 40b:	48 89 48 08          	mov    %rcx,0x8(%rax)
 40f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 416:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 41d:	48 8b 00             	mov    (%rax),%rax
 420:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 424:	48 83 f8 00          	cmp    $0x0,%rax
 428:	0f 85 0e 00 00 00    	jne    43c <printf+0x3ac>
 42e:	48 b8 02 0f 00 00 00 	movabs $0xf02,%rax
 435:	00 00 00 
          s = "(null)";
 438:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 43c:	e9 00 00 00 00       	jmpq   441 <printf+0x3b1>
 441:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 445:	80 38 00             	cmpb   $0x0,(%rax)
 448:	0f 84 20 00 00 00    	je     46e <printf+0x3de>
          putc(fd, *s);
 44e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 451:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 455:	0f be 30             	movsbl (%rax),%esi
 458:	e8 93 00 00 00       	callq  4f0 <putc>
        for(; *s; s++)
 45d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 461:	48 83 c0 01          	add    $0x1,%rax
 465:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 469:	e9 d3 ff ff ff       	jmpq   441 <printf+0x3b1>
      } else if(c == '%'){
 46e:	e9 42 00 00 00       	jmpq   4b5 <printf+0x425>
 473:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 477:	0f 85 15 00 00 00    	jne    492 <printf+0x402>
        putc(fd, c);
 47d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 480:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 483:	88 c1                	mov    %al,%cl
 485:	0f be f1             	movsbl %cl,%esi
 488:	e8 63 00 00 00       	callq  4f0 <putc>
      } else {
 48d:	e9 1e 00 00 00       	jmpq   4b0 <printf+0x420>
 492:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 497:	8b 7d fc             	mov    -0x4(%rbp),%edi
 49a:	e8 51 00 00 00       	callq  4f0 <putc>
        putc(fd, c);
 49f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 4a2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 4a5:	40 88 f0             	mov    %sil,%al
 4a8:	0f be f0             	movsbl %al,%esi
 4ab:	e8 40 00 00 00       	callq  4f0 <putc>
 4b0:	e9 00 00 00 00       	jmpq   4b5 <printf+0x425>
 4b5:	e9 00 00 00 00       	jmpq   4ba <printf+0x42a>
 4ba:	e9 00 00 00 00       	jmpq   4bf <printf+0x42f>
 4bf:	e9 00 00 00 00       	jmpq   4c4 <printf+0x434>
      }
      state = 0;
 4c4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 4cb:	e9 00 00 00 00       	jmpq   4d0 <printf+0x440>
    }
  }
 4d0:	e9 00 00 00 00       	jmpq   4d5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 4d5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 4d8:	83 c0 01             	add    $0x1,%eax
 4db:	89 45 e0             	mov    %eax,-0x20(%rbp)
 4de:	e9 fe fb ff ff       	jmpq   e1 <printf+0x51>

  va_end(valist);
}
 4e3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 4ea:	5d                   	pop    %rbp
 4eb:	c3                   	retq   
 4ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000004f0 <putc>:
{
 4f0:	55                   	push   %rbp
 4f1:	48 89 e5             	mov    %rsp,%rbp
 4f4:	48 83 ec 10          	sub    $0x10,%rsp
 4f8:	40 88 f0             	mov    %sil,%al
 4fb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 4ff:	ba 01 00 00 00       	mov    $0x1,%edx
 504:	89 7d fc             	mov    %edi,-0x4(%rbp)
 507:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 50a:	8b 7d fc             	mov    -0x4(%rbp),%edi
 50d:	e8 d6 05 00 00       	callq  ae8 <write>
}
 512:	89 45 f4             	mov    %eax,-0xc(%rbp)
 515:	48 83 c4 10          	add    $0x10,%rsp
 519:	5d                   	pop    %rbp
 51a:	c3                   	retq   
 51b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000520 <printint64>:
{
 520:	55                   	push   %rbp
 521:	48 89 e5             	mov    %rsp,%rbp
 524:	48 83 ec 50          	sub    $0x50,%rsp
 528:	89 7d fc             	mov    %edi,-0x4(%rbp)
 52b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 52e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 531:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 534:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 538:	0f 84 30 00 00 00    	je     56e <printint64+0x4e>
 53e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 542:	0f 9c c0             	setl   %al
 545:	88 c1                	mov    %al,%cl
 547:	80 e1 01             	and    $0x1,%cl
 54a:	0f b6 d1             	movzbl %cl,%edx
 54d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 550:	a8 01                	test   $0x1,%al
 552:	0f 85 05 00 00 00    	jne    55d <printint64+0x3d>
 558:	e9 11 00 00 00       	jmpq   56e <printint64+0x4e>
 55d:	31 c0                	xor    %eax,%eax
    x = -xx;
 55f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 562:	48 63 c8             	movslq %eax,%rcx
 565:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 569:	e9 08 00 00 00       	jmpq   576 <printint64+0x56>
    x = xx;
 56e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 572:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 576:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 57d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 581:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 585:	31 d2                	xor    %edx,%edx
 587:	48 f7 f1             	div    %rcx
 58a:	40 8a 34 15 30 11 00 	mov    0x1130(,%rdx,1),%sil
 591:	00 
 592:	8b 7d cc             	mov    -0x34(%rbp),%edi
 595:	41 89 f8             	mov    %edi,%r8d
 598:	41 83 c0 01          	add    $0x1,%r8d
 59c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 5a0:	48 63 cf             	movslq %edi,%rcx
 5a3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 5a8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 5ac:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 5b0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 5b4:	48 89 c8             	mov    %rcx,%rax
 5b7:	31 d2                	xor    %edx,%edx
 5b9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 5bd:	48 f7 f1             	div    %rcx
 5c0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 5c4:	48 83 f8 00          	cmp    $0x0,%rax
 5c8:	0f 85 af ff ff ff    	jne    57d <printint64+0x5d>
  if(sgn)
 5ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 5d2:	0f 84 13 00 00 00    	je     5eb <printint64+0xcb>
    buf[i++] = '-';
 5d8:	8b 45 cc             	mov    -0x34(%rbp),%eax
 5db:	89 c1                	mov    %eax,%ecx
 5dd:	83 c1 01             	add    $0x1,%ecx
 5e0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 5e3:	48 63 d0             	movslq %eax,%rdx
 5e6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 5eb:	e9 00 00 00 00       	jmpq   5f0 <printint64+0xd0>
 5f0:	8b 45 cc             	mov    -0x34(%rbp),%eax
 5f3:	83 c0 ff             	add    $0xffffffff,%eax
 5f6:	89 45 cc             	mov    %eax,-0x34(%rbp)
 5f9:	83 f8 00             	cmp    $0x0,%eax
 5fc:	0f 8c 16 00 00 00    	jl     618 <printint64+0xf8>
    putc(fd, buf[i]);
 602:	8b 7d fc             	mov    -0x4(%rbp),%edi
 605:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 609:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 60e:	e8 dd fe ff ff       	callq  4f0 <putc>
  while(--i >= 0)
 613:	e9 d8 ff ff ff       	jmpq   5f0 <printint64+0xd0>
}
 618:	48 83 c4 50          	add    $0x50,%rsp
 61c:	5d                   	pop    %rbp
 61d:	c3                   	retq   
 61e:	66 90                	xchg   %ax,%ax

0000000000000620 <printint>:
{
 620:	55                   	push   %rbp
 621:	48 89 e5             	mov    %rsp,%rbp
 624:	48 83 ec 30          	sub    $0x30,%rsp
 628:	89 7d fc             	mov    %edi,-0x4(%rbp)
 62b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 62e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 631:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 634:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 63b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 63f:	0f 84 1e 00 00 00    	je     663 <printint+0x43>
 645:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 649:	0f 8d 14 00 00 00    	jge    663 <printint+0x43>
 64f:	31 c0                	xor    %eax,%eax
    neg = 1;
 651:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 658:	2b 45 f8             	sub    -0x8(%rbp),%eax
 65b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 65e:	e9 06 00 00 00       	jmpq   669 <printint+0x49>
    x = xx;
 663:	8b 45 f8             	mov    -0x8(%rbp),%eax
 666:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 669:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 670:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 673:	31 d2                	xor    %edx,%edx
 675:	f7 75 f4             	divl   -0xc(%rbp)
 678:	89 d2                	mov    %edx,%edx
 67a:	89 d1                	mov    %edx,%ecx
 67c:	40 8a 34 0d 50 11 00 	mov    0x1150(,%rcx,1),%sil
 683:	00 
 684:	8b 55 dc             	mov    -0x24(%rbp),%edx
 687:	89 d7                	mov    %edx,%edi
 689:	83 c7 01             	add    $0x1,%edi
 68c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 68f:	48 63 ca             	movslq %edx,%rcx
 692:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 697:	8b 45 f4             	mov    -0xc(%rbp),%eax
 69a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 69d:	89 45 d0             	mov    %eax,-0x30(%rbp)
 6a0:	89 c8                	mov    %ecx,%eax
 6a2:	31 d2                	xor    %edx,%edx
 6a4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 6a7:	f7 f1                	div    %ecx
 6a9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 6ac:	83 f8 00             	cmp    $0x0,%eax
 6af:	0f 85 bb ff ff ff    	jne    670 <printint+0x50>
  if(neg)
 6b5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 6b9:	0f 84 13 00 00 00    	je     6d2 <printint+0xb2>
    buf[i++] = '-';
 6bf:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6c2:	89 c1                	mov    %eax,%ecx
 6c4:	83 c1 01             	add    $0x1,%ecx
 6c7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 6ca:	48 63 d0             	movslq %eax,%rdx
 6cd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 6d2:	e9 00 00 00 00       	jmpq   6d7 <printint+0xb7>
 6d7:	8b 45 dc             	mov    -0x24(%rbp),%eax
 6da:	83 c0 ff             	add    $0xffffffff,%eax
 6dd:	89 45 dc             	mov    %eax,-0x24(%rbp)
 6e0:	83 f8 00             	cmp    $0x0,%eax
 6e3:	0f 8c 16 00 00 00    	jl     6ff <printint+0xdf>
    putc(fd, buf[i]);
 6e9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 6ec:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 6f0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 6f5:	e8 f6 fd ff ff       	callq  4f0 <putc>
  while(--i >= 0)
 6fa:	e9 d8 ff ff ff       	jmpq   6d7 <printint+0xb7>
}
 6ff:	48 83 c4 30          	add    $0x30,%rsp
 703:	5d                   	pop    %rbp
 704:	c3                   	retq   
 705:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 70c:	00 00 00 
 70f:	90                   	nop

0000000000000710 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 710:	55                   	push   %rbp
 711:	48 89 e5             	mov    %rsp,%rbp
 714:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 718:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 71c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 720:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 724:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 728:	48 89 c1             	mov    %rax,%rcx
 72b:	48 83 c1 01          	add    $0x1,%rcx
 72f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 733:	8a 10                	mov    (%rax),%dl
 735:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 739:	48 89 c1             	mov    %rax,%rcx
 73c:	48 83 c1 01          	add    $0x1,%rcx
 740:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 744:	88 10                	mov    %dl,(%rax)
 746:	0f be f2             	movsbl %dl,%esi
 749:	83 fe 00             	cmp    $0x0,%esi
 74c:	0f 84 05 00 00 00    	je     757 <strcpy+0x47>
 752:	e9 cd ff ff ff       	jmpq   724 <strcpy+0x14>
    ;
  return os;
 757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 75b:	5d                   	pop    %rbp
 75c:	c3                   	retq   
 75d:	0f 1f 00             	nopl   (%rax)

0000000000000760 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 760:	55                   	push   %rbp
 761:	48 89 e5             	mov    %rsp,%rbp
 764:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 768:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 76c:	31 c0                	xor    %eax,%eax
 76e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 770:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 774:	0f be 02             	movsbl (%rdx),%eax
 777:	83 f8 00             	cmp    $0x0,%eax
 77a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 77d:	0f 84 18 00 00 00    	je     79b <strcmp+0x3b>
 783:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 787:	0f be 08             	movsbl (%rax),%ecx
 78a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 78e:	0f be 10             	movsbl (%rax),%edx
 791:	39 d1                	cmp    %edx,%ecx
 793:	40 0f 94 c6          	sete   %sil
 797:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 79b:	8a 45 ef             	mov    -0x11(%rbp),%al
 79e:	a8 01                	test   $0x1,%al
 7a0:	0f 85 05 00 00 00    	jne    7ab <strcmp+0x4b>
 7a6:	e9 1d 00 00 00       	jmpq   7c8 <strcmp+0x68>
    p++, q++;
 7ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7af:	48 83 c0 01          	add    $0x1,%rax
 7b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 7b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7bb:	48 83 c0 01          	add    $0x1,%rax
 7bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 7c3:	e9 a4 ff ff ff       	jmpq   76c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 7c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7cc:	0f b6 08             	movzbl (%rax),%ecx
 7cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7d3:	0f b6 10             	movzbl (%rax),%edx
 7d6:	29 d1                	sub    %edx,%ecx
 7d8:	89 c8                	mov    %ecx,%eax
 7da:	5d                   	pop    %rbp
 7db:	c3                   	retq   
 7dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000007e0 <strlen>:
}

uint
strlen(char *s)
{
 7e0:	55                   	push   %rbp
 7e1:	48 89 e5             	mov    %rsp,%rbp
 7e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 7e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 7ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7f3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 7f7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 7fb:	0f 84 13 00 00 00    	je     814 <strlen+0x34>
 801:	e9 00 00 00 00       	jmpq   806 <strlen+0x26>
 806:	8b 45 f4             	mov    -0xc(%rbp),%eax
 809:	83 c0 01             	add    $0x1,%eax
 80c:	89 45 f4             	mov    %eax,-0xc(%rbp)
 80f:	e9 db ff ff ff       	jmpq   7ef <strlen+0xf>
    ;
  return n;
 814:	8b 45 f4             	mov    -0xc(%rbp),%eax
 817:	5d                   	pop    %rbp
 818:	c3                   	retq   
 819:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000820 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 820:	55                   	push   %rbp
 821:	48 89 e5             	mov    %rsp,%rbp
 824:	48 83 ec 10          	sub    $0x10,%rsp
 828:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 82c:	89 75 f4             	mov    %esi,-0xc(%rbp)
 82f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 832:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 836:	8b 75 f4             	mov    -0xc(%rbp),%esi
 839:	8b 55 f0             	mov    -0x10(%rbp),%edx
 83c:	e8 0f 00 00 00       	callq  850 <stosb>
  return dst;
 841:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 845:	48 83 c4 10          	add    $0x10,%rsp
 849:	5d                   	pop    %rbp
 84a:	c3                   	retq   
 84b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000850 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 850:	55                   	push   %rbp
 851:	48 89 e5             	mov    %rsp,%rbp
 854:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 858:	89 75 f4             	mov    %esi,-0xc(%rbp)
 85b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 85e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 862:	8b 55 f0             	mov    -0x10(%rbp),%edx
 865:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 868:	89 d1                	mov    %edx,%ecx
 86a:	fc                   	cld    
 86b:	f3 aa                	rep stos %al,%es:(%rdi)
 86d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 871:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 874:	5d                   	pop    %rbp
 875:	c3                   	retq   
 876:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 87d:	00 00 00 

0000000000000880 <strchr>:
}

char*
strchr(const char *s, char c)
{
 880:	55                   	push   %rbp
 881:	48 89 e5             	mov    %rsp,%rbp
 884:	40 88 f0             	mov    %sil,%al
 887:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 88b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 88e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 892:	80 38 00             	cmpb   $0x0,(%rax)
 895:	0f 84 36 00 00 00    	je     8d1 <strchr+0x51>
    if(*s == c)
 89b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 89f:	0f be 08             	movsbl (%rax),%ecx
 8a2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 8a6:	39 d1                	cmp    %edx,%ecx
 8a8:	0f 85 0d 00 00 00    	jne    8bb <strchr+0x3b>
      return (char*)s;
 8ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 8b6:	e9 1e 00 00 00       	jmpq   8d9 <strchr+0x59>
    if(*s == c)
 8bb:	e9 00 00 00 00       	jmpq   8c0 <strchr+0x40>
  for(; *s; s++)
 8c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8c4:	48 83 c0 01          	add    $0x1,%rax
 8c8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 8cc:	e9 bd ff ff ff       	jmpq   88e <strchr+0xe>
  return 0;
 8d1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 8d8:	00 
}
 8d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8dd:	5d                   	pop    %rbp
 8de:	c3                   	retq   
 8df:	90                   	nop

00000000000008e0 <gets>:

char*
gets(char *buf, int max)
{
 8e0:	55                   	push   %rbp
 8e1:	48 89 e5             	mov    %rsp,%rbp
 8e4:	48 83 ec 20          	sub    $0x20,%rsp
 8e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 8ec:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 8ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 8f6:	8b 45 f0             	mov    -0x10(%rbp),%eax
 8f9:	83 c0 01             	add    $0x1,%eax
 8fc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 8ff:	0f 8d 5e 00 00 00    	jge    963 <gets+0x83>
 905:	31 ff                	xor    %edi,%edi
 907:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 90b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 910:	e8 cb 01 00 00       	callq  ae0 <read>
 915:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 918:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 91c:	0f 8d 05 00 00 00    	jge    927 <gets+0x47>
      break;
 922:	e9 3c 00 00 00       	jmpq   963 <gets+0x83>
    buf[i++] = c;
 927:	8a 45 eb             	mov    -0x15(%rbp),%al
 92a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 92e:	8b 55 f0             	mov    -0x10(%rbp),%edx
 931:	89 d6                	mov    %edx,%esi
 933:	83 c6 01             	add    $0x1,%esi
 936:	89 75 f0             	mov    %esi,-0x10(%rbp)
 939:	48 63 fa             	movslq %edx,%rdi
 93c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 93f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 943:	83 fa 0a             	cmp    $0xa,%edx
 946:	0f 84 0d 00 00 00    	je     959 <gets+0x79>
 94c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 950:	83 f8 0d             	cmp    $0xd,%eax
 953:	0f 85 05 00 00 00    	jne    95e <gets+0x7e>
      break;
 959:	e9 05 00 00 00       	jmpq   963 <gets+0x83>
  for(i=0; i+1 < max; ){
 95e:	e9 93 ff ff ff       	jmpq   8f6 <gets+0x16>
  }
  buf[i] = '\0';
 963:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 967:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 96b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 96f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 973:	48 83 c4 20          	add    $0x20,%rsp
 977:	5d                   	pop    %rbp
 978:	c3                   	retq   
 979:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000980 <stat>:
}

int
stat(char *n, struct stat *st)
{
 980:	55                   	push   %rbp
 981:	48 89 e5             	mov    %rsp,%rbp
 984:	48 83 ec 30          	sub    $0x30,%rsp
 988:	31 c0                	xor    %eax,%eax
 98a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 98e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 992:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 996:	89 c6                	mov    %eax,%esi
 998:	e8 6b 01 00 00       	callq  b08 <open>
 99d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 9a0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 9a4:	0f 8d 0c 00 00 00    	jge    9b6 <stat+0x36>
    return -1;
 9aa:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 9b1:	e9 20 00 00 00       	jmpq   9d6 <stat+0x56>
  r = fstat(fd, st);
 9b6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9b9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 9bd:	e8 5e 01 00 00       	callq  b20 <fstat>
 9c2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 9c5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 9c8:	e8 23 01 00 00       	callq  af0 <close>
  return r;
 9cd:	8b 7d e0             	mov    -0x20(%rbp),%edi
 9d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
 9d3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 9d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 9d9:	48 83 c4 30          	add    $0x30,%rsp
 9dd:	5d                   	pop    %rbp
 9de:	c3                   	retq   
 9df:	90                   	nop

00000000000009e0 <atoi>:

int
atoi(const char *s)
{
 9e0:	55                   	push   %rbp
 9e1:	48 89 e5             	mov    %rsp,%rbp
 9e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 9e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 9ef:	31 c0                	xor    %eax,%eax
 9f1:	88 c1                	mov    %al,%cl
 9f3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 9f8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 9fc:	0f be 32             	movsbl (%rdx),%esi
 9ff:	39 f0                	cmp    %esi,%eax
 a01:	88 4d f3             	mov    %cl,-0xd(%rbp)
 a04:	0f 8f 10 00 00 00    	jg     a1a <atoi+0x3a>
 a0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a0e:	0f be 08             	movsbl (%rax),%ecx
 a11:	83 f9 39             	cmp    $0x39,%ecx
 a14:	0f 9e c2             	setle  %dl
 a17:	88 55 f3             	mov    %dl,-0xd(%rbp)
 a1a:	8a 45 f3             	mov    -0xd(%rbp),%al
 a1d:	a8 01                	test   $0x1,%al
 a1f:	0f 85 05 00 00 00    	jne    a2a <atoi+0x4a>
 a25:	e9 23 00 00 00       	jmpq   a4d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 a2a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 a2e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a32:	48 89 ca             	mov    %rcx,%rdx
 a35:	48 83 c2 01          	add    $0x1,%rdx
 a39:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 a3d:	0f be 31             	movsbl (%rcx),%esi
 a40:	01 f0                	add    %esi,%eax
 a42:	83 e8 30             	sub    $0x30,%eax
 a45:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 a48:	e9 a2 ff ff ff       	jmpq   9ef <atoi+0xf>
  return n;
 a4d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 a50:	5d                   	pop    %rbp
 a51:	c3                   	retq   
 a52:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 a59:	1f 84 00 00 00 00 00 

0000000000000a60 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 a60:	55                   	push   %rbp
 a61:	48 89 e5             	mov    %rsp,%rbp
 a64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 a68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 a6c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 a6f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 a73:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 a77:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 a7b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 a7f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 a82:	89 c1                	mov    %eax,%ecx
 a84:	83 c1 ff             	add    $0xffffffff,%ecx
 a87:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 a8a:	83 f8 00             	cmp    $0x0,%eax
 a8d:	0f 8e 27 00 00 00    	jle    aba <memmove+0x5a>
    *dst++ = *src++;
 a93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a97:	48 89 c1             	mov    %rax,%rcx
 a9a:	48 83 c1 01          	add    $0x1,%rcx
 a9e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 aa2:	8a 10                	mov    (%rax),%dl
 aa4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 aa8:	48 89 c1             	mov    %rax,%rcx
 aab:	48 83 c1 01          	add    $0x1,%rcx
 aaf:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 ab3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 ab5:	e9 c5 ff ff ff       	jmpq   a7f <memmove+0x1f>
  return vdst;
 aba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 abe:	5d                   	pop    %rbp
 abf:	c3                   	retq   

0000000000000ac0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 ac0:	b8 01 00 00 00       	mov    $0x1,%eax
 ac5:	cd 40                	int    $0x40
 ac7:	c3                   	retq   

0000000000000ac8 <exit>:
SYSCALL(exit)
 ac8:	b8 02 00 00 00       	mov    $0x2,%eax
 acd:	cd 40                	int    $0x40
 acf:	c3                   	retq   

0000000000000ad0 <wait>:
SYSCALL(wait)
 ad0:	b8 03 00 00 00       	mov    $0x3,%eax
 ad5:	cd 40                	int    $0x40
 ad7:	c3                   	retq   

0000000000000ad8 <pipe>:
SYSCALL(pipe)
 ad8:	b8 04 00 00 00       	mov    $0x4,%eax
 add:	cd 40                	int    $0x40
 adf:	c3                   	retq   

0000000000000ae0 <read>:
SYSCALL(read)
 ae0:	b8 05 00 00 00       	mov    $0x5,%eax
 ae5:	cd 40                	int    $0x40
 ae7:	c3                   	retq   

0000000000000ae8 <write>:
SYSCALL(write)
 ae8:	b8 10 00 00 00       	mov    $0x10,%eax
 aed:	cd 40                	int    $0x40
 aef:	c3                   	retq   

0000000000000af0 <close>:
SYSCALL(close)
 af0:	b8 15 00 00 00       	mov    $0x15,%eax
 af5:	cd 40                	int    $0x40
 af7:	c3                   	retq   

0000000000000af8 <kill>:
SYSCALL(kill)
 af8:	b8 06 00 00 00       	mov    $0x6,%eax
 afd:	cd 40                	int    $0x40
 aff:	c3                   	retq   

0000000000000b00 <exec>:
SYSCALL(exec)
 b00:	b8 07 00 00 00       	mov    $0x7,%eax
 b05:	cd 40                	int    $0x40
 b07:	c3                   	retq   

0000000000000b08 <open>:
SYSCALL(open)
 b08:	b8 0f 00 00 00       	mov    $0xf,%eax
 b0d:	cd 40                	int    $0x40
 b0f:	c3                   	retq   

0000000000000b10 <mknod>:
SYSCALL(mknod)
 b10:	b8 11 00 00 00       	mov    $0x11,%eax
 b15:	cd 40                	int    $0x40
 b17:	c3                   	retq   

0000000000000b18 <unlink>:
SYSCALL(unlink)
 b18:	b8 12 00 00 00       	mov    $0x12,%eax
 b1d:	cd 40                	int    $0x40
 b1f:	c3                   	retq   

0000000000000b20 <fstat>:
SYSCALL(fstat)
 b20:	b8 08 00 00 00       	mov    $0x8,%eax
 b25:	cd 40                	int    $0x40
 b27:	c3                   	retq   

0000000000000b28 <link>:
SYSCALL(link)
 b28:	b8 13 00 00 00       	mov    $0x13,%eax
 b2d:	cd 40                	int    $0x40
 b2f:	c3                   	retq   

0000000000000b30 <mkdir>:
SYSCALL(mkdir)
 b30:	b8 14 00 00 00       	mov    $0x14,%eax
 b35:	cd 40                	int    $0x40
 b37:	c3                   	retq   

0000000000000b38 <chdir>:
SYSCALL(chdir)
 b38:	b8 09 00 00 00       	mov    $0x9,%eax
 b3d:	cd 40                	int    $0x40
 b3f:	c3                   	retq   

0000000000000b40 <dup>:
SYSCALL(dup)
 b40:	b8 0a 00 00 00       	mov    $0xa,%eax
 b45:	cd 40                	int    $0x40
 b47:	c3                   	retq   

0000000000000b48 <getpid>:
SYSCALL(getpid)
 b48:	b8 0b 00 00 00       	mov    $0xb,%eax
 b4d:	cd 40                	int    $0x40
 b4f:	c3                   	retq   

0000000000000b50 <sbrk>:
SYSCALL(sbrk)
 b50:	b8 0c 00 00 00       	mov    $0xc,%eax
 b55:	cd 40                	int    $0x40
 b57:	c3                   	retq   

0000000000000b58 <sleep>:
SYSCALL(sleep)
 b58:	b8 0d 00 00 00       	mov    $0xd,%eax
 b5d:	cd 40                	int    $0x40
 b5f:	c3                   	retq   

0000000000000b60 <uptime>:
SYSCALL(uptime)
 b60:	b8 0e 00 00 00       	mov    $0xe,%eax
 b65:	cd 40                	int    $0x40
 b67:	c3                   	retq   

0000000000000b68 <sysinfo>:
SYSCALL(sysinfo)
 b68:	b8 16 00 00 00       	mov    $0x16,%eax
 b6d:	cd 40                	int    $0x40
 b6f:	c3                   	retq   

0000000000000b70 <mmap>:
SYSCALL(mmap)
 b70:	b8 17 00 00 00       	mov    $0x17,%eax
 b75:	cd 40                	int    $0x40
 b77:	c3                   	retq   

0000000000000b78 <munmap>:
SYSCALL(munmap)
 b78:	b8 18 00 00 00       	mov    $0x18,%eax
 b7d:	cd 40                	int    $0x40
 b7f:	c3                   	retq   

0000000000000b80 <crashn>:
SYSCALL(crashn)
 b80:	b8 19 00 00 00       	mov    $0x19,%eax
 b85:	cd 40                	int    $0x40
 b87:	c3                   	retq   
 b88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 b8f:	00 

0000000000000b90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b90:	55                   	push   %rbp
 b91:	48 89 e5             	mov    %rsp,%rbp
 b94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b98:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 b9c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 ba0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ba4:	48 8b 3c 25 68 11 00 	mov    0x1168,%rdi
 bab:	00 
 bac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 bb0:	31 c0                	xor    %eax,%eax
 bb2:	88 c1                	mov    %al,%cl
 bb4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 bb8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 bbc:	88 4d e7             	mov    %cl,-0x19(%rbp)
 bbf:	0f 86 11 00 00 00    	jbe    bd6 <free+0x46>
 bc5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bc9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bcd:	48 3b 01             	cmp    (%rcx),%rax
 bd0:	0f 92 c2             	setb   %dl
 bd3:	88 55 e7             	mov    %dl,-0x19(%rbp)
 bd6:	8a 45 e7             	mov    -0x19(%rbp),%al
 bd9:	34 ff                	xor    $0xff,%al
 bdb:	a8 01                	test   $0x1,%al
 bdd:	0f 85 05 00 00 00    	jne    be8 <free+0x58>
 be3:	e9 4a 00 00 00       	jmpq   c32 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 be8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 bec:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 bf0:	48 3b 01             	cmp    (%rcx),%rax
 bf3:	0f 82 24 00 00 00    	jb     c1d <free+0x8d>
 bf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 bfd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 c01:	0f 87 11 00 00 00    	ja     c18 <free+0x88>
 c07:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c0b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c0f:	48 3b 01             	cmp    (%rcx),%rax
 c12:	0f 83 05 00 00 00    	jae    c1d <free+0x8d>
      break;
 c18:	e9 15 00 00 00       	jmpq   c32 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c1d:	e9 00 00 00 00       	jmpq   c22 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c26:	48 8b 00             	mov    (%rax),%rax
 c29:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 c2d:	e9 7e ff ff ff       	jmpq   bb0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 c32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c36:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c3a:	8b 51 08             	mov    0x8(%rcx),%edx
 c3d:	89 d1                	mov    %edx,%ecx
 c3f:	48 c1 e1 04          	shl    $0x4,%rcx
 c43:	48 01 c8             	add    %rcx,%rax
 c46:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c4a:	48 3b 01             	cmp    (%rcx),%rax
 c4d:	0f 85 2a 00 00 00    	jne    c7d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 c53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c57:	48 8b 00             	mov    (%rax),%rax
 c5a:	8b 48 08             	mov    0x8(%rax),%ecx
 c5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c61:	03 48 08             	add    0x8(%rax),%ecx
 c64:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 c67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c6b:	48 8b 00             	mov    (%rax),%rax
 c6e:	48 8b 00             	mov    (%rax),%rax
 c71:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c75:	48 89 02             	mov    %rax,(%rdx)
  } else
 c78:	e9 0e 00 00 00       	jmpq   c8b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 c7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c81:	48 8b 00             	mov    (%rax),%rax
 c84:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 c88:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 c8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 c8f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c93:	8b 51 08             	mov    0x8(%rcx),%edx
 c96:	89 d1                	mov    %edx,%ecx
 c98:	48 c1 e1 04          	shl    $0x4,%rcx
 c9c:	48 01 c8             	add    %rcx,%rax
 c9f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 ca3:	0f 85 24 00 00 00    	jne    ccd <free+0x13d>
    p->s.size += bp->s.size;
 ca9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cad:	8b 48 08             	mov    0x8(%rax),%ecx
 cb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cb4:	03 48 08             	add    0x8(%rax),%ecx
 cb7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 cba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cbe:	48 8b 00             	mov    (%rax),%rax
 cc1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 cc5:	48 89 02             	mov    %rax,(%rdx)
  } else
 cc8:	e9 0b 00 00 00       	jmpq   cd8 <free+0x148>
    p->s.ptr = bp;
 ccd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cd1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cd5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 cd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cdc:	48 89 04 25 68 11 00 	mov    %rax,0x1168
 ce3:	00 
}
 ce4:	5d                   	pop    %rbp
 ce5:	c3                   	retq   
 ce6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 ced:	00 00 00 

0000000000000cf0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 cf0:	55                   	push   %rbp
 cf1:	48 89 e5             	mov    %rsp,%rbp
 cf4:	48 83 ec 30          	sub    $0x30,%rsp
 cf8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cfb:	8b 7d f4             	mov    -0xc(%rbp),%edi
 cfe:	89 f8                	mov    %edi,%eax
 d00:	48 83 c0 10          	add    $0x10,%rax
 d04:	48 83 e8 01          	sub    $0x1,%rax
 d08:	48 c1 e8 04          	shr    $0x4,%rax
 d0c:	48 83 c0 01          	add    $0x1,%rax
 d10:	89 c7                	mov    %eax,%edi
 d12:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 d15:	48 8b 04 25 68 11 00 	mov    0x1168,%rax
 d1c:	00 
 d1d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d21:	48 83 f8 00          	cmp    $0x0,%rax
 d25:	0f 85 29 00 00 00    	jne    d54 <malloc+0x64>
 d2b:	48 b8 70 11 00 00 00 	movabs $0x1170,%rax
 d32:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 d35:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 d39:	48 89 04 25 68 11 00 	mov    %rax,0x1168
 d40:	00 
 d41:	48 89 04 25 70 11 00 	mov    %rax,0x1170
 d48:	00 
    base.s.size = 0;
 d49:	c7 04 25 78 11 00 00 	movl   $0x0,0x1178
 d50:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d54:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 d58:	48 8b 00             	mov    (%rax),%rax
 d5b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 d5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d63:	8b 48 08             	mov    0x8(%rax),%ecx
 d66:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d69:	0f 82 73 00 00 00    	jb     de2 <malloc+0xf2>
      if(p->s.size == nunits)
 d6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d73:	8b 48 08             	mov    0x8(%rax),%ecx
 d76:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 d79:	0f 85 13 00 00 00    	jne    d92 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 d7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d83:	48 8b 00             	mov    (%rax),%rax
 d86:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 d8a:	48 89 01             	mov    %rax,(%rcx)
 d8d:	e9 33 00 00 00       	jmpq   dc5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 d92:	8b 45 dc             	mov    -0x24(%rbp),%eax
 d95:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d99:	8b 51 08             	mov    0x8(%rcx),%edx
 d9c:	29 c2                	sub    %eax,%edx
 d9e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 da1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 da5:	8b 41 08             	mov    0x8(%rcx),%eax
 da8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 dac:	89 c0                	mov    %eax,%eax
 dae:	89 c6                	mov    %eax,%esi
 db0:	48 c1 e6 04          	shl    $0x4,%rsi
 db4:	48 01 f1             	add    %rsi,%rcx
 db7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 dbb:	8b 45 dc             	mov    -0x24(%rbp),%eax
 dbe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 dc2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 dc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 dc9:	48 89 04 25 68 11 00 	mov    %rax,0x1168
 dd0:	00 
      return (void*)(p + 1);
 dd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dd5:	48 83 c0 10          	add    $0x10,%rax
 dd9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 ddd:	e9 57 00 00 00       	jmpq   e39 <malloc+0x149>
    }
    if(p == freep)
 de2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 de6:	48 3b 04 25 68 11 00 	cmp    0x1168,%rax
 ded:	00 
 dee:	0f 85 28 00 00 00    	jne    e1c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 df4:	8b 7d dc             	mov    -0x24(%rbp),%edi
 df7:	e8 54 00 00 00       	callq  e50 <morecore>
 dfc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 e00:	48 83 f8 00          	cmp    $0x0,%rax
 e04:	0f 85 0d 00 00 00    	jne    e17 <malloc+0x127>
        return 0;
 e0a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e11:	00 
 e12:	e9 22 00 00 00       	jmpq   e39 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 e17:	e9 00 00 00 00       	jmpq   e1c <malloc+0x12c>
  }
 e1c:	e9 00 00 00 00       	jmpq   e21 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e25:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e2d:	48 8b 00             	mov    (%rax),%rax
 e30:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 e34:	e9 26 ff ff ff       	jmpq   d5f <malloc+0x6f>
 e39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 e3d:	48 83 c4 30          	add    $0x30,%rsp
 e41:	5d                   	pop    %rbp
 e42:	c3                   	retq   
 e43:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 e4a:	84 00 00 00 00 00 

0000000000000e50 <morecore>:
{
 e50:	55                   	push   %rbp
 e51:	48 89 e5             	mov    %rsp,%rbp
 e54:	48 83 ec 20          	sub    $0x20,%rsp
 e58:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 e5b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 e62:	0f 83 07 00 00 00    	jae    e6f <morecore+0x1f>
    nu = 4096;
 e68:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 e6f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 e72:	89 c1                	mov    %eax,%ecx
 e74:	48 c1 e1 04          	shl    $0x4,%rcx
 e78:	89 c8                	mov    %ecx,%eax
 e7a:	89 c7                	mov    %eax,%edi
 e7c:	e8 cf fc ff ff       	callq  b50 <sbrk>
 e81:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 e88:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 e8c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 e90:	0f 85 0d 00 00 00    	jne    ea3 <morecore+0x53>
    return 0;
 e96:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 e9d:	00 
 e9e:	e9 2e 00 00 00       	jmpq   ed1 <morecore+0x81>
  hp = (Header*)p;
 ea3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ea7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 eab:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 eae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 eb2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 eb5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 eb9:	48 83 c0 10          	add    $0x10,%rax
 ebd:	48 89 c7             	mov    %rax,%rdi
 ec0:	e8 cb fc ff ff       	callq  b90 <free>
  return freep;
 ec5:	48 8b 04 25 68 11 00 	mov    0x1168,%rax
 ecc:	00 
 ecd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 ed1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ed5:	48 83 c4 20          	add    $0x20,%rsp
 ed9:	5d                   	pop    %rbp
 eda:	c3                   	retq   
