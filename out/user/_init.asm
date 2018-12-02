
out/user/_init:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 30          	sub    $0x30,%rsp
   8:	48 bf ae 0f 00 00 00 	movabs $0xfae,%rdi
   f:	00 00 00 
  12:	be 02 00 00 00       	mov    $0x2,%esi
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  17:	e8 bc 0b 00 00       	callq  bd8 <open>
  1c:	83 f8 00             	cmp    $0x0,%eax
  1f:	0f 8d 32 00 00 00    	jge    57 <main+0x57>
  25:	48 bf ae 0f 00 00 00 	movabs $0xfae,%rdi
  2c:	00 00 00 
  2f:	b8 01 00 00 00       	mov    $0x1,%eax
    mknod("console", 1, 1);
  34:	89 c6                	mov    %eax,%esi
  36:	89 c2                	mov    %eax,%edx
  38:	e8 a3 0b 00 00       	callq  be0 <mknod>
  3d:	48 bf ae 0f 00 00 00 	movabs $0xfae,%rdi
  44:	00 00 00 
  47:	be 02 00 00 00       	mov    $0x2,%esi
    open("console", O_RDWR);
  4c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  4f:	e8 84 0b 00 00       	callq  bd8 <open>
  54:	89 45 ec             	mov    %eax,-0x14(%rbp)
  57:	31 ff                	xor    %edi,%edi
  }
  dup(0);  // stdout
  59:	e8 b2 0b 00 00       	callq  c10 <dup>
  5e:	31 ff                	xor    %edi,%edi
  dup(0);  // stderr
  60:	89 45 e8             	mov    %eax,-0x18(%rbp)
  63:	e8 a8 0b 00 00       	callq  c10 <dup>
  68:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  6b:	bf 01 00 00 00       	mov    $0x1,%edi
  70:	48 be b6 0f 00 00 00 	movabs $0xfb6,%rsi
  77:	00 00 00 

  for(;;){
    printf(1, "init: starting sh\n");
  7a:	b0 00                	mov    $0x0,%al
  7c:	e8 df 00 00 00       	callq  160 <printf>
    pid = fork();
  81:	e8 0a 0b 00 00       	callq  b90 <fork>
  86:	89 45 f8             	mov    %eax,-0x8(%rbp)
    if(pid < 0){
  89:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8d:	0f 8d 1e 00 00 00    	jge    b1 <main+0xb1>
  93:	bf 01 00 00 00       	mov    $0x1,%edi
  98:	48 be c9 0f 00 00 00 	movabs $0xfc9,%rsi
  9f:	00 00 00 
      printf(1, "init: fork failed\n");
  a2:	b0 00                	mov    $0x0,%al
  a4:	e8 b7 00 00 00       	callq  160 <printf>
      exit();
  a9:	e8 ea 0a 00 00       	callq  b98 <exit>
  ae:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    if(pid == 0){
  b1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  b5:	0f 85 3a 00 00 00    	jne    f5 <main+0xf5>
  bb:	48 bf ab 0f 00 00 00 	movabs $0xfab,%rdi
  c2:	00 00 00 
  c5:	48 be 30 12 00 00 00 	movabs $0x1230,%rsi
  cc:	00 00 00 
      exec("sh", argv);
  cf:	e8 fc 0a 00 00       	callq  bd0 <exec>
  d4:	bf 01 00 00 00       	mov    $0x1,%edi
  d9:	48 be dc 0f 00 00 00 	movabs $0xfdc,%rsi
  e0:	00 00 00 
      printf(1, "init: exec sh failed\n");
  e3:	89 45 dc             	mov    %eax,-0x24(%rbp)
  e6:	b0 00                	mov    $0x0,%al
  e8:	e8 73 00 00 00       	callq  160 <printf>
      exit();
  ed:	e8 a6 0a 00 00       	callq  b98 <exit>
  f2:	89 45 d8             	mov    %eax,-0x28(%rbp)
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f5:	e9 00 00 00 00       	jmpq   fa <main+0xfa>
  fa:	e8 a1 0a 00 00       	callq  ba0 <wait>
  ff:	31 c9                	xor    %ecx,%ecx
 101:	88 ca                	mov    %cl,%dl
 103:	89 45 f4             	mov    %eax,-0xc(%rbp)
 106:	83 f8 00             	cmp    $0x0,%eax
 109:	88 55 d7             	mov    %dl,-0x29(%rbp)
 10c:	0f 8c 0c 00 00 00    	jl     11e <main+0x11e>
 112:	8b 45 f4             	mov    -0xc(%rbp),%eax
 115:	3b 45 f8             	cmp    -0x8(%rbp),%eax
 118:	0f 95 c1             	setne  %cl
 11b:	88 4d d7             	mov    %cl,-0x29(%rbp)
 11e:	8a 45 d7             	mov    -0x29(%rbp),%al
 121:	a8 01                	test   $0x1,%al
 123:	0f 85 05 00 00 00    	jne    12e <main+0x12e>
 129:	e9 1e 00 00 00       	jmpq   14c <main+0x14c>
 12e:	bf 01 00 00 00       	mov    $0x1,%edi
 133:	48 be f2 0f 00 00 00 	movabs $0xff2,%rsi
 13a:	00 00 00 
      printf(1, "zombie! from %d\n", wpid);
 13d:	8b 55 f4             	mov    -0xc(%rbp),%edx
 140:	b0 00                	mov    $0x0,%al
 142:	e8 19 00 00 00       	callq  160 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
 147:	e9 ae ff ff ff       	jmpq   fa <main+0xfa>
  for(;;){
 14c:	e9 1a ff ff ff       	jmpq   6b <main+0x6b>
 151:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 158:	00 00 00 
 15b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000160 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 160:	55                   	push   %rbp
 161:	48 89 e5             	mov    %rsp,%rbp
 164:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
 16b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
 16f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
 173:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
 177:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
 17b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
 17f:	89 7d fc             	mov    %edi,-0x4(%rbp)
 182:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 186:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
 18a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
 18e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
 192:	48 89 51 08          	mov    %rdx,0x8(%rcx)
 196:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
 19d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
 1a3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
 1aa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
 1b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1b5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 1b9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 1bd:	0f 84 f0 03 00 00    	je     5b3 <printf+0x453>
    c = fmt[i] & 0xff;
 1c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1c7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 1cb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
 1cf:	81 e2 ff 00 00 00    	and    $0xff,%edx
 1d5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
 1d8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
 1dc:	0f 85 32 00 00 00    	jne    214 <printf+0xb4>
      if(c == '%'){
 1e2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 1e6:	0f 85 13 00 00 00    	jne    1ff <printf+0x9f>
        state = '%';
 1ec:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 1f3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 1fa:	e9 10 00 00 00       	jmpq   20f <printf+0xaf>
        putc(fd, c);
 1ff:	8b 7d fc             	mov    -0x4(%rbp),%edi
 202:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 205:	88 c1                	mov    %al,%cl
 207:	0f be f1             	movsbl %cl,%esi
 20a:	e8 b1 03 00 00       	callq  5c0 <putc>
      }
    } else if(state == '%'){
 20f:	e9 8c 03 00 00       	jmpq   5a0 <printf+0x440>
 214:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 218:	0f 85 7d 03 00 00    	jne    59b <printf+0x43b>
      if(c == 'l') {
 21e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 222:	0f 85 0c 00 00 00    	jne    234 <printf+0xd4>
        lflag = 1;
 228:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 22f:	e9 71 03 00 00       	jmpq   5a5 <printf+0x445>
      } else if(c == 'd'){
 234:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 238:	0f 85 0e 01 00 00    	jne    34c <printf+0x1ec>
        if (lflag == 1)
 23e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 242:	0f 85 79 00 00 00    	jne    2c1 <printf+0x161>
 248:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 24c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 24f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 252:	83 f9 28             	cmp    $0x28,%ecx
 255:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 259:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 25c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 25f:	0f 87 1f 00 00 00    	ja     284 <printf+0x124>
 265:	8b 45 80             	mov    -0x80(%rbp),%eax
 268:	48 63 c8             	movslq %eax,%rcx
 26b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 26f:	48 03 4a 10          	add    0x10(%rdx),%rcx
 273:	83 c0 08             	add    $0x8,%eax
 276:	89 02                	mov    %eax,(%rdx)
 278:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 27f:	e9 1a 00 00 00       	jmpq   29e <printf+0x13e>
 284:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 288:	48 8b 48 08          	mov    0x8(%rax),%rcx
 28c:	48 89 ca             	mov    %rcx,%rdx
 28f:	48 83 c1 08          	add    $0x8,%rcx
 293:	48 89 48 08          	mov    %rcx,0x8(%rax)
 297:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 29e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 2a5:	ba 0a 00 00 00       	mov    $0xa,%edx
 2aa:	b9 01 00 00 00       	mov    $0x1,%ecx
 2af:	48 8b 00             	mov    (%rax),%rax
 2b2:	89 c6                	mov    %eax,%esi
 2b4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 2b7:	e8 34 03 00 00       	callq  5f0 <printint64>
 2bc:	e9 86 00 00 00       	jmpq   347 <printf+0x1e7>
 2c1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 2c5:	8b 7d fc             	mov    -0x4(%rbp),%edi
 2c8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 2cb:	83 f9 28             	cmp    $0x28,%ecx
 2ce:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 2d5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 2db:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 2e1:	0f 87 25 00 00 00    	ja     30c <printf+0x1ac>
 2e7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 2ed:	48 63 c8             	movslq %eax,%rcx
 2f0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 2f7:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2fb:	83 c0 08             	add    $0x8,%eax
 2fe:	89 02                	mov    %eax,(%rdx)
 300:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 307:	e9 1d 00 00 00       	jmpq   329 <printf+0x1c9>
 30c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 313:	48 8b 48 08          	mov    0x8(%rax),%rcx
 317:	48 89 ca             	mov    %rcx,%rdx
 31a:	48 83 c1 08          	add    $0x8,%rcx
 31e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 322:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 329:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 330:	ba 0a 00 00 00       	mov    $0xa,%edx
 335:	b9 01 00 00 00       	mov    $0x1,%ecx
 33a:	8b 30                	mov    (%rax),%esi
 33c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 342:	e8 a9 03 00 00       	callq  6f0 <printint>
      } else if(c == 'x' || c == 'p'){
 347:	e9 43 02 00 00       	jmpq   58f <printf+0x42f>
 34c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 350:	0f 84 0a 00 00 00    	je     360 <printf+0x200>
 356:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 35a:	0f 85 1d 01 00 00    	jne    47d <printf+0x31d>
        if (lflag == 1)
 360:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 364:	0f 85 8b 00 00 00    	jne    3f5 <printf+0x295>
 36a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 36e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 371:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 374:	83 f9 28             	cmp    $0x28,%ecx
 377:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 37e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 384:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 38a:	0f 87 25 00 00 00    	ja     3b5 <printf+0x255>
 390:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 396:	48 63 c8             	movslq %eax,%rcx
 399:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 3a0:	48 03 4a 10          	add    0x10(%rdx),%rcx
 3a4:	83 c0 08             	add    $0x8,%eax
 3a7:	89 02                	mov    %eax,(%rdx)
 3a9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 3b0:	e9 1d 00 00 00       	jmpq   3d2 <printf+0x272>
 3b5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 3bc:	48 8b 48 08          	mov    0x8(%rax),%rcx
 3c0:	48 89 ca             	mov    %rcx,%rdx
 3c3:	48 83 c1 08          	add    $0x8,%rcx
 3c7:	48 89 48 08          	mov    %rcx,0x8(%rax)
 3cb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 3d2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 3d9:	ba 10 00 00 00       	mov    $0x10,%edx
 3de:	31 c9                	xor    %ecx,%ecx
 3e0:	48 8b 00             	mov    (%rax),%rax
 3e3:	89 c6                	mov    %eax,%esi
 3e5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 3eb:	e8 00 02 00 00       	callq  5f0 <printint64>
 3f0:	e9 83 00 00 00       	jmpq   478 <printf+0x318>
 3f5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 3f9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 3fc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3ff:	83 f9 28             	cmp    $0x28,%ecx
 402:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 409:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 40f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 415:	0f 87 25 00 00 00    	ja     440 <printf+0x2e0>
 41b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 421:	48 63 c8             	movslq %eax,%rcx
 424:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 42b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 42f:	83 c0 08             	add    $0x8,%eax
 432:	89 02                	mov    %eax,(%rdx)
 434:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 43b:	e9 1d 00 00 00       	jmpq   45d <printf+0x2fd>
 440:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 447:	48 8b 48 08          	mov    0x8(%rax),%rcx
 44b:	48 89 ca             	mov    %rcx,%rdx
 44e:	48 83 c1 08          	add    $0x8,%rcx
 452:	48 89 48 08          	mov    %rcx,0x8(%rax)
 456:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 45d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 464:	ba 10 00 00 00       	mov    $0x10,%edx
 469:	31 c9                	xor    %ecx,%ecx
 46b:	8b 30                	mov    (%rax),%esi
 46d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 473:	e8 78 02 00 00       	callq  6f0 <printint>
      } else if(c == 's'){
 478:	e9 0d 01 00 00       	jmpq   58a <printf+0x42a>
 47d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 481:	0f 85 bc 00 00 00    	jne    543 <printf+0x3e3>
 487:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 48b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 48e:	83 f9 28             	cmp    $0x28,%ecx
 491:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 498:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 49e:	0f 87 25 00 00 00    	ja     4c9 <printf+0x369>
 4a4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 4aa:	48 63 c8             	movslq %eax,%rcx
 4ad:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 4b4:	48 03 4a 10          	add    0x10(%rdx),%rcx
 4b8:	83 c0 08             	add    $0x8,%eax
 4bb:	89 02                	mov    %eax,(%rdx)
 4bd:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 4c4:	e9 1d 00 00 00       	jmpq   4e6 <printf+0x386>
 4c9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 4d0:	48 8b 48 08          	mov    0x8(%rax),%rcx
 4d4:	48 89 ca             	mov    %rcx,%rdx
 4d7:	48 83 c1 08          	add    $0x8,%rcx
 4db:	48 89 48 08          	mov    %rcx,0x8(%rax)
 4df:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 4e6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 4ed:	48 8b 00             	mov    (%rax),%rax
 4f0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 4f4:	48 83 f8 00          	cmp    $0x0,%rax
 4f8:	0f 85 0e 00 00 00    	jne    50c <printf+0x3ac>
 4fe:	48 b8 03 10 00 00 00 	movabs $0x1003,%rax
 505:	00 00 00 
          s = "(null)";
 508:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 50c:	e9 00 00 00 00       	jmpq   511 <printf+0x3b1>
 511:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 515:	80 38 00             	cmpb   $0x0,(%rax)
 518:	0f 84 20 00 00 00    	je     53e <printf+0x3de>
          putc(fd, *s);
 51e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 521:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 525:	0f be 30             	movsbl (%rax),%esi
 528:	e8 93 00 00 00       	callq  5c0 <putc>
        for(; *s; s++)
 52d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 531:	48 83 c0 01          	add    $0x1,%rax
 535:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 539:	e9 d3 ff ff ff       	jmpq   511 <printf+0x3b1>
      } else if(c == '%'){
 53e:	e9 42 00 00 00       	jmpq   585 <printf+0x425>
 543:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 547:	0f 85 15 00 00 00    	jne    562 <printf+0x402>
        putc(fd, c);
 54d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 550:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 553:	88 c1                	mov    %al,%cl
 555:	0f be f1             	movsbl %cl,%esi
 558:	e8 63 00 00 00       	callq  5c0 <putc>
      } else {
 55d:	e9 1e 00 00 00       	jmpq   580 <printf+0x420>
 562:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 567:	8b 7d fc             	mov    -0x4(%rbp),%edi
 56a:	e8 51 00 00 00       	callq  5c0 <putc>
        putc(fd, c);
 56f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 572:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 575:	40 88 f0             	mov    %sil,%al
 578:	0f be f0             	movsbl %al,%esi
 57b:	e8 40 00 00 00       	callq  5c0 <putc>
 580:	e9 00 00 00 00       	jmpq   585 <printf+0x425>
 585:	e9 00 00 00 00       	jmpq   58a <printf+0x42a>
 58a:	e9 00 00 00 00       	jmpq   58f <printf+0x42f>
 58f:	e9 00 00 00 00       	jmpq   594 <printf+0x434>
      }
      state = 0;
 594:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 59b:	e9 00 00 00 00       	jmpq   5a0 <printf+0x440>
    }
  }
 5a0:	e9 00 00 00 00       	jmpq   5a5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 5a5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 5a8:	83 c0 01             	add    $0x1,%eax
 5ab:	89 45 e0             	mov    %eax,-0x20(%rbp)
 5ae:	e9 fe fb ff ff       	jmpq   1b1 <printf+0x51>

  va_end(valist);
}
 5b3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 5ba:	5d                   	pop    %rbp
 5bb:	c3                   	retq   
 5bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000005c0 <putc>:
{
 5c0:	55                   	push   %rbp
 5c1:	48 89 e5             	mov    %rsp,%rbp
 5c4:	48 83 ec 10          	sub    $0x10,%rsp
 5c8:	40 88 f0             	mov    %sil,%al
 5cb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 5cf:	ba 01 00 00 00       	mov    $0x1,%edx
 5d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
 5d7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 5da:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5dd:	e8 d6 05 00 00       	callq  bb8 <write>
}
 5e2:	89 45 f4             	mov    %eax,-0xc(%rbp)
 5e5:	48 83 c4 10          	add    $0x10,%rsp
 5e9:	5d                   	pop    %rbp
 5ea:	c3                   	retq   
 5eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000005f0 <printint64>:
{
 5f0:	55                   	push   %rbp
 5f1:	48 89 e5             	mov    %rsp,%rbp
 5f4:	48 83 ec 50          	sub    $0x50,%rsp
 5f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 5fb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 5fe:	89 55 f4             	mov    %edx,-0xc(%rbp)
 601:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 604:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 608:	0f 84 30 00 00 00    	je     63e <printint64+0x4e>
 60e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 612:	0f 9c c0             	setl   %al
 615:	88 c1                	mov    %al,%cl
 617:	80 e1 01             	and    $0x1,%cl
 61a:	0f b6 d1             	movzbl %cl,%edx
 61d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 620:	a8 01                	test   $0x1,%al
 622:	0f 85 05 00 00 00    	jne    62d <printint64+0x3d>
 628:	e9 11 00 00 00       	jmpq   63e <printint64+0x4e>
 62d:	31 c0                	xor    %eax,%eax
    x = -xx;
 62f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 632:	48 63 c8             	movslq %eax,%rcx
 635:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 639:	e9 08 00 00 00       	jmpq   646 <printint64+0x56>
    x = xx;
 63e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 642:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 646:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 64d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 651:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 655:	31 d2                	xor    %edx,%edx
 657:	48 f7 f1             	div    %rcx
 65a:	40 8a 34 15 40 12 00 	mov    0x1240(,%rdx,1),%sil
 661:	00 
 662:	8b 7d cc             	mov    -0x34(%rbp),%edi
 665:	41 89 f8             	mov    %edi,%r8d
 668:	41 83 c0 01          	add    $0x1,%r8d
 66c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 670:	48 63 cf             	movslq %edi,%rcx
 673:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 678:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 67c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 680:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 684:	48 89 c8             	mov    %rcx,%rax
 687:	31 d2                	xor    %edx,%edx
 689:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 68d:	48 f7 f1             	div    %rcx
 690:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 694:	48 83 f8 00          	cmp    $0x0,%rax
 698:	0f 85 af ff ff ff    	jne    64d <printint64+0x5d>
  if(sgn)
 69e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 6a2:	0f 84 13 00 00 00    	je     6bb <printint64+0xcb>
    buf[i++] = '-';
 6a8:	8b 45 cc             	mov    -0x34(%rbp),%eax
 6ab:	89 c1                	mov    %eax,%ecx
 6ad:	83 c1 01             	add    $0x1,%ecx
 6b0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 6b3:	48 63 d0             	movslq %eax,%rdx
 6b6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 6bb:	e9 00 00 00 00       	jmpq   6c0 <printint64+0xd0>
 6c0:	8b 45 cc             	mov    -0x34(%rbp),%eax
 6c3:	83 c0 ff             	add    $0xffffffff,%eax
 6c6:	89 45 cc             	mov    %eax,-0x34(%rbp)
 6c9:	83 f8 00             	cmp    $0x0,%eax
 6cc:	0f 8c 16 00 00 00    	jl     6e8 <printint64+0xf8>
    putc(fd, buf[i]);
 6d2:	8b 7d fc             	mov    -0x4(%rbp),%edi
 6d5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 6d9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 6de:	e8 dd fe ff ff       	callq  5c0 <putc>
  while(--i >= 0)
 6e3:	e9 d8 ff ff ff       	jmpq   6c0 <printint64+0xd0>
}
 6e8:	48 83 c4 50          	add    $0x50,%rsp
 6ec:	5d                   	pop    %rbp
 6ed:	c3                   	retq   
 6ee:	66 90                	xchg   %ax,%ax

00000000000006f0 <printint>:
{
 6f0:	55                   	push   %rbp
 6f1:	48 89 e5             	mov    %rsp,%rbp
 6f4:	48 83 ec 30          	sub    $0x30,%rsp
 6f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 6fb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 6fe:	89 55 f4             	mov    %edx,-0xc(%rbp)
 701:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 704:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 70b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 70f:	0f 84 1e 00 00 00    	je     733 <printint+0x43>
 715:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 719:	0f 8d 14 00 00 00    	jge    733 <printint+0x43>
 71f:	31 c0                	xor    %eax,%eax
    neg = 1;
 721:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 728:	2b 45 f8             	sub    -0x8(%rbp),%eax
 72b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 72e:	e9 06 00 00 00       	jmpq   739 <printint+0x49>
    x = xx;
 733:	8b 45 f8             	mov    -0x8(%rbp),%eax
 736:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 739:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 740:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 743:	31 d2                	xor    %edx,%edx
 745:	f7 75 f4             	divl   -0xc(%rbp)
 748:	89 d2                	mov    %edx,%edx
 74a:	89 d1                	mov    %edx,%ecx
 74c:	40 8a 34 0d 60 12 00 	mov    0x1260(,%rcx,1),%sil
 753:	00 
 754:	8b 55 dc             	mov    -0x24(%rbp),%edx
 757:	89 d7                	mov    %edx,%edi
 759:	83 c7 01             	add    $0x1,%edi
 75c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 75f:	48 63 ca             	movslq %edx,%rcx
 762:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 767:	8b 45 f4             	mov    -0xc(%rbp),%eax
 76a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 76d:	89 45 d0             	mov    %eax,-0x30(%rbp)
 770:	89 c8                	mov    %ecx,%eax
 772:	31 d2                	xor    %edx,%edx
 774:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 777:	f7 f1                	div    %ecx
 779:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 77c:	83 f8 00             	cmp    $0x0,%eax
 77f:	0f 85 bb ff ff ff    	jne    740 <printint+0x50>
  if(neg)
 785:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 789:	0f 84 13 00 00 00    	je     7a2 <printint+0xb2>
    buf[i++] = '-';
 78f:	8b 45 dc             	mov    -0x24(%rbp),%eax
 792:	89 c1                	mov    %eax,%ecx
 794:	83 c1 01             	add    $0x1,%ecx
 797:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 79a:	48 63 d0             	movslq %eax,%rdx
 79d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 7a2:	e9 00 00 00 00       	jmpq   7a7 <printint+0xb7>
 7a7:	8b 45 dc             	mov    -0x24(%rbp),%eax
 7aa:	83 c0 ff             	add    $0xffffffff,%eax
 7ad:	89 45 dc             	mov    %eax,-0x24(%rbp)
 7b0:	83 f8 00             	cmp    $0x0,%eax
 7b3:	0f 8c 16 00 00 00    	jl     7cf <printint+0xdf>
    putc(fd, buf[i]);
 7b9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 7bc:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 7c0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 7c5:	e8 f6 fd ff ff       	callq  5c0 <putc>
  while(--i >= 0)
 7ca:	e9 d8 ff ff ff       	jmpq   7a7 <printint+0xb7>
}
 7cf:	48 83 c4 30          	add    $0x30,%rsp
 7d3:	5d                   	pop    %rbp
 7d4:	c3                   	retq   
 7d5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7dc:	00 00 00 
 7df:	90                   	nop

00000000000007e0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 7e0:	55                   	push   %rbp
 7e1:	48 89 e5             	mov    %rsp,%rbp
 7e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 7e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 7ec:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 7f0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 7f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7f8:	48 89 c1             	mov    %rax,%rcx
 7fb:	48 83 c1 01          	add    $0x1,%rcx
 7ff:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 803:	8a 10                	mov    (%rax),%dl
 805:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 809:	48 89 c1             	mov    %rax,%rcx
 80c:	48 83 c1 01          	add    $0x1,%rcx
 810:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 814:	88 10                	mov    %dl,(%rax)
 816:	0f be f2             	movsbl %dl,%esi
 819:	83 fe 00             	cmp    $0x0,%esi
 81c:	0f 84 05 00 00 00    	je     827 <strcpy+0x47>
 822:	e9 cd ff ff ff       	jmpq   7f4 <strcpy+0x14>
    ;
  return os;
 827:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 82b:	5d                   	pop    %rbp
 82c:	c3                   	retq   
 82d:	0f 1f 00             	nopl   (%rax)

0000000000000830 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 830:	55                   	push   %rbp
 831:	48 89 e5             	mov    %rsp,%rbp
 834:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 838:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 83c:	31 c0                	xor    %eax,%eax
 83e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 840:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 844:	0f be 02             	movsbl (%rdx),%eax
 847:	83 f8 00             	cmp    $0x0,%eax
 84a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 84d:	0f 84 18 00 00 00    	je     86b <strcmp+0x3b>
 853:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 857:	0f be 08             	movsbl (%rax),%ecx
 85a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 85e:	0f be 10             	movsbl (%rax),%edx
 861:	39 d1                	cmp    %edx,%ecx
 863:	40 0f 94 c6          	sete   %sil
 867:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 86b:	8a 45 ef             	mov    -0x11(%rbp),%al
 86e:	a8 01                	test   $0x1,%al
 870:	0f 85 05 00 00 00    	jne    87b <strcmp+0x4b>
 876:	e9 1d 00 00 00       	jmpq   898 <strcmp+0x68>
    p++, q++;
 87b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 87f:	48 83 c0 01          	add    $0x1,%rax
 883:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 887:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 88b:	48 83 c0 01          	add    $0x1,%rax
 88f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 893:	e9 a4 ff ff ff       	jmpq   83c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 898:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 89c:	0f b6 08             	movzbl (%rax),%ecx
 89f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8a3:	0f b6 10             	movzbl (%rax),%edx
 8a6:	29 d1                	sub    %edx,%ecx
 8a8:	89 c8                	mov    %ecx,%eax
 8aa:	5d                   	pop    %rbp
 8ab:	c3                   	retq   
 8ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008b0 <strlen>:
}

uint
strlen(char *s)
{
 8b0:	55                   	push   %rbp
 8b1:	48 89 e5             	mov    %rsp,%rbp
 8b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 8b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 8bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8c3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 8c7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 8cb:	0f 84 13 00 00 00    	je     8e4 <strlen+0x34>
 8d1:	e9 00 00 00 00       	jmpq   8d6 <strlen+0x26>
 8d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8d9:	83 c0 01             	add    $0x1,%eax
 8dc:	89 45 f4             	mov    %eax,-0xc(%rbp)
 8df:	e9 db ff ff ff       	jmpq   8bf <strlen+0xf>
    ;
  return n;
 8e4:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8e7:	5d                   	pop    %rbp
 8e8:	c3                   	retq   
 8e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000008f0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 8f0:	55                   	push   %rbp
 8f1:	48 89 e5             	mov    %rsp,%rbp
 8f4:	48 83 ec 10          	sub    $0x10,%rsp
 8f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 8fc:	89 75 f4             	mov    %esi,-0xc(%rbp)
 8ff:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 902:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 906:	8b 75 f4             	mov    -0xc(%rbp),%esi
 909:	8b 55 f0             	mov    -0x10(%rbp),%edx
 90c:	e8 0f 00 00 00       	callq  920 <stosb>
  return dst;
 911:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 915:	48 83 c4 10          	add    $0x10,%rsp
 919:	5d                   	pop    %rbp
 91a:	c3                   	retq   
 91b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000920 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 920:	55                   	push   %rbp
 921:	48 89 e5             	mov    %rsp,%rbp
 924:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 928:	89 75 f4             	mov    %esi,-0xc(%rbp)
 92b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 92e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 932:	8b 55 f0             	mov    -0x10(%rbp),%edx
 935:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 938:	89 d1                	mov    %edx,%ecx
 93a:	fc                   	cld    
 93b:	f3 aa                	rep stos %al,%es:(%rdi)
 93d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 941:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 944:	5d                   	pop    %rbp
 945:	c3                   	retq   
 946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 94d:	00 00 00 

0000000000000950 <strchr>:
}

char*
strchr(const char *s, char c)
{
 950:	55                   	push   %rbp
 951:	48 89 e5             	mov    %rsp,%rbp
 954:	40 88 f0             	mov    %sil,%al
 957:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 95b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 95e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 962:	80 38 00             	cmpb   $0x0,(%rax)
 965:	0f 84 36 00 00 00    	je     9a1 <strchr+0x51>
    if(*s == c)
 96b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 96f:	0f be 08             	movsbl (%rax),%ecx
 972:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 976:	39 d1                	cmp    %edx,%ecx
 978:	0f 85 0d 00 00 00    	jne    98b <strchr+0x3b>
      return (char*)s;
 97e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 982:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 986:	e9 1e 00 00 00       	jmpq   9a9 <strchr+0x59>
    if(*s == c)
 98b:	e9 00 00 00 00       	jmpq   990 <strchr+0x40>
  for(; *s; s++)
 990:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 994:	48 83 c0 01          	add    $0x1,%rax
 998:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 99c:	e9 bd ff ff ff       	jmpq   95e <strchr+0xe>
  return 0;
 9a1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 9a8:	00 
}
 9a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 9ad:	5d                   	pop    %rbp
 9ae:	c3                   	retq   
 9af:	90                   	nop

00000000000009b0 <gets>:

char*
gets(char *buf, int max)
{
 9b0:	55                   	push   %rbp
 9b1:	48 89 e5             	mov    %rsp,%rbp
 9b4:	48 83 ec 20          	sub    $0x20,%rsp
 9b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 9bc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 9bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 9c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
 9c9:	83 c0 01             	add    $0x1,%eax
 9cc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 9cf:	0f 8d 5e 00 00 00    	jge    a33 <gets+0x83>
 9d5:	31 ff                	xor    %edi,%edi
 9d7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 9db:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 9e0:	e8 cb 01 00 00       	callq  bb0 <read>
 9e5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 9e8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 9ec:	0f 8d 05 00 00 00    	jge    9f7 <gets+0x47>
      break;
 9f2:	e9 3c 00 00 00       	jmpq   a33 <gets+0x83>
    buf[i++] = c;
 9f7:	8a 45 eb             	mov    -0x15(%rbp),%al
 9fa:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9fe:	8b 55 f0             	mov    -0x10(%rbp),%edx
 a01:	89 d6                	mov    %edx,%esi
 a03:	83 c6 01             	add    $0x1,%esi
 a06:	89 75 f0             	mov    %esi,-0x10(%rbp)
 a09:	48 63 fa             	movslq %edx,%rdi
 a0c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 a0f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 a13:	83 fa 0a             	cmp    $0xa,%edx
 a16:	0f 84 0d 00 00 00    	je     a29 <gets+0x79>
 a1c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 a20:	83 f8 0d             	cmp    $0xd,%eax
 a23:	0f 85 05 00 00 00    	jne    a2e <gets+0x7e>
      break;
 a29:	e9 05 00 00 00       	jmpq   a33 <gets+0x83>
  for(i=0; i+1 < max; ){
 a2e:	e9 93 ff ff ff       	jmpq   9c6 <gets+0x16>
  }
  buf[i] = '\0';
 a33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a37:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 a3b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 a3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a43:	48 83 c4 20          	add    $0x20,%rsp
 a47:	5d                   	pop    %rbp
 a48:	c3                   	retq   
 a49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a50 <stat>:
}

int
stat(char *n, struct stat *st)
{
 a50:	55                   	push   %rbp
 a51:	48 89 e5             	mov    %rsp,%rbp
 a54:	48 83 ec 30          	sub    $0x30,%rsp
 a58:	31 c0                	xor    %eax,%eax
 a5a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 a5e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 a62:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 a66:	89 c6                	mov    %eax,%esi
 a68:	e8 6b 01 00 00       	callq  bd8 <open>
 a6d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 a70:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 a74:	0f 8d 0c 00 00 00    	jge    a86 <stat+0x36>
    return -1;
 a7a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 a81:	e9 20 00 00 00       	jmpq   aa6 <stat+0x56>
  r = fstat(fd, st);
 a86:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 a89:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 a8d:	e8 5e 01 00 00       	callq  bf0 <fstat>
 a92:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 a95:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 a98:	e8 23 01 00 00       	callq  bc0 <close>
  return r;
 a9d:	8b 7d e0             	mov    -0x20(%rbp),%edi
 aa0:	89 7d fc             	mov    %edi,-0x4(%rbp)
 aa3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 aa6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 aa9:	48 83 c4 30          	add    $0x30,%rsp
 aad:	5d                   	pop    %rbp
 aae:	c3                   	retq   
 aaf:	90                   	nop

0000000000000ab0 <atoi>:

int
atoi(const char *s)
{
 ab0:	55                   	push   %rbp
 ab1:	48 89 e5             	mov    %rsp,%rbp
 ab4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 ab8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 abf:	31 c0                	xor    %eax,%eax
 ac1:	88 c1                	mov    %al,%cl
 ac3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 ac8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 acc:	0f be 32             	movsbl (%rdx),%esi
 acf:	39 f0                	cmp    %esi,%eax
 ad1:	88 4d f3             	mov    %cl,-0xd(%rbp)
 ad4:	0f 8f 10 00 00 00    	jg     aea <atoi+0x3a>
 ada:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ade:	0f be 08             	movsbl (%rax),%ecx
 ae1:	83 f9 39             	cmp    $0x39,%ecx
 ae4:	0f 9e c2             	setle  %dl
 ae7:	88 55 f3             	mov    %dl,-0xd(%rbp)
 aea:	8a 45 f3             	mov    -0xd(%rbp),%al
 aed:	a8 01                	test   $0x1,%al
 aef:	0f 85 05 00 00 00    	jne    afa <atoi+0x4a>
 af5:	e9 23 00 00 00       	jmpq   b1d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 afa:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 afe:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 b02:	48 89 ca             	mov    %rcx,%rdx
 b05:	48 83 c2 01          	add    $0x1,%rdx
 b09:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 b0d:	0f be 31             	movsbl (%rcx),%esi
 b10:	01 f0                	add    %esi,%eax
 b12:	83 e8 30             	sub    $0x30,%eax
 b15:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 b18:	e9 a2 ff ff ff       	jmpq   abf <atoi+0xf>
  return n;
 b1d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 b20:	5d                   	pop    %rbp
 b21:	c3                   	retq   
 b22:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 b29:	1f 84 00 00 00 00 00 

0000000000000b30 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 b30:	55                   	push   %rbp
 b31:	48 89 e5             	mov    %rsp,%rbp
 b34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 b38:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 b3c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 b3f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 b43:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 b47:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 b4b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 b4f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 b52:	89 c1                	mov    %eax,%ecx
 b54:	83 c1 ff             	add    $0xffffffff,%ecx
 b57:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 b5a:	83 f8 00             	cmp    $0x0,%eax
 b5d:	0f 8e 27 00 00 00    	jle    b8a <memmove+0x5a>
    *dst++ = *src++;
 b63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 b67:	48 89 c1             	mov    %rax,%rcx
 b6a:	48 83 c1 01          	add    $0x1,%rcx
 b6e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 b72:	8a 10                	mov    (%rax),%dl
 b74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 b78:	48 89 c1             	mov    %rax,%rcx
 b7b:	48 83 c1 01          	add    $0x1,%rcx
 b7f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 b83:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 b85:	e9 c5 ff ff ff       	jmpq   b4f <memmove+0x1f>
  return vdst;
 b8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 b8e:	5d                   	pop    %rbp
 b8f:	c3                   	retq   

0000000000000b90 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 b90:	b8 01 00 00 00       	mov    $0x1,%eax
 b95:	cd 40                	int    $0x40
 b97:	c3                   	retq   

0000000000000b98 <exit>:
SYSCALL(exit)
 b98:	b8 02 00 00 00       	mov    $0x2,%eax
 b9d:	cd 40                	int    $0x40
 b9f:	c3                   	retq   

0000000000000ba0 <wait>:
SYSCALL(wait)
 ba0:	b8 03 00 00 00       	mov    $0x3,%eax
 ba5:	cd 40                	int    $0x40
 ba7:	c3                   	retq   

0000000000000ba8 <pipe>:
SYSCALL(pipe)
 ba8:	b8 04 00 00 00       	mov    $0x4,%eax
 bad:	cd 40                	int    $0x40
 baf:	c3                   	retq   

0000000000000bb0 <read>:
SYSCALL(read)
 bb0:	b8 05 00 00 00       	mov    $0x5,%eax
 bb5:	cd 40                	int    $0x40
 bb7:	c3                   	retq   

0000000000000bb8 <write>:
SYSCALL(write)
 bb8:	b8 10 00 00 00       	mov    $0x10,%eax
 bbd:	cd 40                	int    $0x40
 bbf:	c3                   	retq   

0000000000000bc0 <close>:
SYSCALL(close)
 bc0:	b8 15 00 00 00       	mov    $0x15,%eax
 bc5:	cd 40                	int    $0x40
 bc7:	c3                   	retq   

0000000000000bc8 <kill>:
SYSCALL(kill)
 bc8:	b8 06 00 00 00       	mov    $0x6,%eax
 bcd:	cd 40                	int    $0x40
 bcf:	c3                   	retq   

0000000000000bd0 <exec>:
SYSCALL(exec)
 bd0:	b8 07 00 00 00       	mov    $0x7,%eax
 bd5:	cd 40                	int    $0x40
 bd7:	c3                   	retq   

0000000000000bd8 <open>:
SYSCALL(open)
 bd8:	b8 0f 00 00 00       	mov    $0xf,%eax
 bdd:	cd 40                	int    $0x40
 bdf:	c3                   	retq   

0000000000000be0 <mknod>:
SYSCALL(mknod)
 be0:	b8 11 00 00 00       	mov    $0x11,%eax
 be5:	cd 40                	int    $0x40
 be7:	c3                   	retq   

0000000000000be8 <unlink>:
SYSCALL(unlink)
 be8:	b8 12 00 00 00       	mov    $0x12,%eax
 bed:	cd 40                	int    $0x40
 bef:	c3                   	retq   

0000000000000bf0 <fstat>:
SYSCALL(fstat)
 bf0:	b8 08 00 00 00       	mov    $0x8,%eax
 bf5:	cd 40                	int    $0x40
 bf7:	c3                   	retq   

0000000000000bf8 <link>:
SYSCALL(link)
 bf8:	b8 13 00 00 00       	mov    $0x13,%eax
 bfd:	cd 40                	int    $0x40
 bff:	c3                   	retq   

0000000000000c00 <mkdir>:
SYSCALL(mkdir)
 c00:	b8 14 00 00 00       	mov    $0x14,%eax
 c05:	cd 40                	int    $0x40
 c07:	c3                   	retq   

0000000000000c08 <chdir>:
SYSCALL(chdir)
 c08:	b8 09 00 00 00       	mov    $0x9,%eax
 c0d:	cd 40                	int    $0x40
 c0f:	c3                   	retq   

0000000000000c10 <dup>:
SYSCALL(dup)
 c10:	b8 0a 00 00 00       	mov    $0xa,%eax
 c15:	cd 40                	int    $0x40
 c17:	c3                   	retq   

0000000000000c18 <getpid>:
SYSCALL(getpid)
 c18:	b8 0b 00 00 00       	mov    $0xb,%eax
 c1d:	cd 40                	int    $0x40
 c1f:	c3                   	retq   

0000000000000c20 <sbrk>:
SYSCALL(sbrk)
 c20:	b8 0c 00 00 00       	mov    $0xc,%eax
 c25:	cd 40                	int    $0x40
 c27:	c3                   	retq   

0000000000000c28 <sleep>:
SYSCALL(sleep)
 c28:	b8 0d 00 00 00       	mov    $0xd,%eax
 c2d:	cd 40                	int    $0x40
 c2f:	c3                   	retq   

0000000000000c30 <uptime>:
SYSCALL(uptime)
 c30:	b8 0e 00 00 00       	mov    $0xe,%eax
 c35:	cd 40                	int    $0x40
 c37:	c3                   	retq   

0000000000000c38 <sysinfo>:
SYSCALL(sysinfo)
 c38:	b8 16 00 00 00       	mov    $0x16,%eax
 c3d:	cd 40                	int    $0x40
 c3f:	c3                   	retq   

0000000000000c40 <mmap>:
SYSCALL(mmap)
 c40:	b8 17 00 00 00       	mov    $0x17,%eax
 c45:	cd 40                	int    $0x40
 c47:	c3                   	retq   

0000000000000c48 <munmap>:
SYSCALL(munmap)
 c48:	b8 18 00 00 00       	mov    $0x18,%eax
 c4d:	cd 40                	int    $0x40
 c4f:	c3                   	retq   

0000000000000c50 <crashn>:
SYSCALL(crashn)
 c50:	b8 19 00 00 00       	mov    $0x19,%eax
 c55:	cd 40                	int    $0x40
 c57:	c3                   	retq   
 c58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 c5f:	00 

0000000000000c60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c60:	55                   	push   %rbp
 c61:	48 89 e5             	mov    %rsp,%rbp
 c64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c68:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 c6c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 c70:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c74:	48 8b 3c 25 78 12 00 	mov    0x1278,%rdi
 c7b:	00 
 c7c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 c80:	31 c0                	xor    %eax,%eax
 c82:	88 c1                	mov    %al,%cl
 c84:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c88:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 c8c:	88 4d e7             	mov    %cl,-0x19(%rbp)
 c8f:	0f 86 11 00 00 00    	jbe    ca6 <free+0x46>
 c95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c99:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c9d:	48 3b 01             	cmp    (%rcx),%rax
 ca0:	0f 92 c2             	setb   %dl
 ca3:	88 55 e7             	mov    %dl,-0x19(%rbp)
 ca6:	8a 45 e7             	mov    -0x19(%rbp),%al
 ca9:	34 ff                	xor    $0xff,%al
 cab:	a8 01                	test   $0x1,%al
 cad:	0f 85 05 00 00 00    	jne    cb8 <free+0x58>
 cb3:	e9 4a 00 00 00       	jmpq   d02 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cbc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cc0:	48 3b 01             	cmp    (%rcx),%rax
 cc3:	0f 82 24 00 00 00    	jb     ced <free+0x8d>
 cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 ccd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 cd1:	0f 87 11 00 00 00    	ja     ce8 <free+0x88>
 cd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cdb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cdf:	48 3b 01             	cmp    (%rcx),%rax
 ce2:	0f 83 05 00 00 00    	jae    ced <free+0x8d>
      break;
 ce8:	e9 15 00 00 00       	jmpq   d02 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ced:	e9 00 00 00 00       	jmpq   cf2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cf6:	48 8b 00             	mov    (%rax),%rax
 cf9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 cfd:	e9 7e ff ff ff       	jmpq   c80 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 d02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d06:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 d0a:	8b 51 08             	mov    0x8(%rcx),%edx
 d0d:	89 d1                	mov    %edx,%ecx
 d0f:	48 c1 e1 04          	shl    $0x4,%rcx
 d13:	48 01 c8             	add    %rcx,%rax
 d16:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d1a:	48 3b 01             	cmp    (%rcx),%rax
 d1d:	0f 85 2a 00 00 00    	jne    d4d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 d23:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d27:	48 8b 00             	mov    (%rax),%rax
 d2a:	8b 48 08             	mov    0x8(%rax),%ecx
 d2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d31:	03 48 08             	add    0x8(%rax),%ecx
 d34:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d3b:	48 8b 00             	mov    (%rax),%rax
 d3e:	48 8b 00             	mov    (%rax),%rax
 d41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 d45:	48 89 02             	mov    %rax,(%rdx)
  } else
 d48:	e9 0e 00 00 00       	jmpq   d5b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 d4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d51:	48 8b 00             	mov    (%rax),%rax
 d54:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 d58:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 d5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d5f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d63:	8b 51 08             	mov    0x8(%rcx),%edx
 d66:	89 d1                	mov    %edx,%ecx
 d68:	48 c1 e1 04          	shl    $0x4,%rcx
 d6c:	48 01 c8             	add    %rcx,%rax
 d6f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 d73:	0f 85 24 00 00 00    	jne    d9d <free+0x13d>
    p->s.size += bp->s.size;
 d79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d7d:	8b 48 08             	mov    0x8(%rax),%ecx
 d80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d84:	03 48 08             	add    0x8(%rax),%ecx
 d87:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 d8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d8e:	48 8b 00             	mov    (%rax),%rax
 d91:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 d95:	48 89 02             	mov    %rax,(%rdx)
  } else
 d98:	e9 0b 00 00 00       	jmpq   da8 <free+0x148>
    p->s.ptr = bp;
 d9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 da1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 da5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 da8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dac:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 db3:	00 
}
 db4:	5d                   	pop    %rbp
 db5:	c3                   	retq   
 db6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 dbd:	00 00 00 

0000000000000dc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 dc0:	55                   	push   %rbp
 dc1:	48 89 e5             	mov    %rsp,%rbp
 dc4:	48 83 ec 30          	sub    $0x30,%rsp
 dc8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 dcb:	8b 7d f4             	mov    -0xc(%rbp),%edi
 dce:	89 f8                	mov    %edi,%eax
 dd0:	48 83 c0 10          	add    $0x10,%rax
 dd4:	48 83 e8 01          	sub    $0x1,%rax
 dd8:	48 c1 e8 04          	shr    $0x4,%rax
 ddc:	48 83 c0 01          	add    $0x1,%rax
 de0:	89 c7                	mov    %eax,%edi
 de2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 de5:	48 8b 04 25 78 12 00 	mov    0x1278,%rax
 dec:	00 
 ded:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 df1:	48 83 f8 00          	cmp    $0x0,%rax
 df5:	0f 85 29 00 00 00    	jne    e24 <malloc+0x64>
 dfb:	48 b8 80 12 00 00 00 	movabs $0x1280,%rax
 e02:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 e05:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e09:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 e10:	00 
 e11:	48 89 04 25 80 12 00 	mov    %rax,0x1280
 e18:	00 
    base.s.size = 0;
 e19:	c7 04 25 88 12 00 00 	movl   $0x0,0x1288
 e20:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e24:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e28:	48 8b 00             	mov    (%rax),%rax
 e2b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 e2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e33:	8b 48 08             	mov    0x8(%rax),%ecx
 e36:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e39:	0f 82 73 00 00 00    	jb     eb2 <malloc+0xf2>
      if(p->s.size == nunits)
 e3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e43:	8b 48 08             	mov    0x8(%rax),%ecx
 e46:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e49:	0f 85 13 00 00 00    	jne    e62 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 e4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e53:	48 8b 00             	mov    (%rax),%rax
 e56:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 e5a:	48 89 01             	mov    %rax,(%rcx)
 e5d:	e9 33 00 00 00       	jmpq   e95 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 e62:	8b 45 dc             	mov    -0x24(%rbp),%eax
 e65:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e69:	8b 51 08             	mov    0x8(%rcx),%edx
 e6c:	29 c2                	sub    %eax,%edx
 e6e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 e71:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e75:	8b 41 08             	mov    0x8(%rcx),%eax
 e78:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e7c:	89 c0                	mov    %eax,%eax
 e7e:	89 c6                	mov    %eax,%esi
 e80:	48 c1 e6 04          	shl    $0x4,%rsi
 e84:	48 01 f1             	add    %rsi,%rcx
 e87:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 e8b:	8b 45 dc             	mov    -0x24(%rbp),%eax
 e8e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e92:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 e95:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e99:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 ea0:	00 
      return (void*)(p + 1);
 ea1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ea5:	48 83 c0 10          	add    $0x10,%rax
 ea9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 ead:	e9 57 00 00 00       	jmpq   f09 <malloc+0x149>
    }
    if(p == freep)
 eb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 eb6:	48 3b 04 25 78 12 00 	cmp    0x1278,%rax
 ebd:	00 
 ebe:	0f 85 28 00 00 00    	jne    eec <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 ec4:	8b 7d dc             	mov    -0x24(%rbp),%edi
 ec7:	e8 54 00 00 00       	callq  f20 <morecore>
 ecc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 ed0:	48 83 f8 00          	cmp    $0x0,%rax
 ed4:	0f 85 0d 00 00 00    	jne    ee7 <malloc+0x127>
        return 0;
 eda:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 ee1:	00 
 ee2:	e9 22 00 00 00       	jmpq   f09 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 ee7:	e9 00 00 00 00       	jmpq   eec <malloc+0x12c>
  }
 eec:	e9 00 00 00 00       	jmpq   ef1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ef1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ef5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 ef9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 efd:	48 8b 00             	mov    (%rax),%rax
 f00:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 f04:	e9 26 ff ff ff       	jmpq   e2f <malloc+0x6f>
 f09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 f0d:	48 83 c4 30          	add    $0x30,%rsp
 f11:	5d                   	pop    %rbp
 f12:	c3                   	retq   
 f13:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 f1a:	84 00 00 00 00 00 

0000000000000f20 <morecore>:
{
 f20:	55                   	push   %rbp
 f21:	48 89 e5             	mov    %rsp,%rbp
 f24:	48 83 ec 20          	sub    $0x20,%rsp
 f28:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 f2b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 f32:	0f 83 07 00 00 00    	jae    f3f <morecore+0x1f>
    nu = 4096;
 f38:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 f3f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 f42:	89 c1                	mov    %eax,%ecx
 f44:	48 c1 e1 04          	shl    $0x4,%rcx
 f48:	89 c8                	mov    %ecx,%eax
 f4a:	89 c7                	mov    %eax,%edi
 f4c:	e8 cf fc ff ff       	callq  c20 <sbrk>
 f51:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 f58:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 f5c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 f60:	0f 85 0d 00 00 00    	jne    f73 <morecore+0x53>
    return 0;
 f66:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 f6d:	00 
 f6e:	e9 2e 00 00 00       	jmpq   fa1 <morecore+0x81>
  hp = (Header*)p;
 f73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 f77:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 f7b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 f7e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 f82:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 f85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 f89:	48 83 c0 10          	add    $0x10,%rax
 f8d:	48 89 c7             	mov    %rax,%rdi
 f90:	e8 cb fc ff ff       	callq  c60 <free>
  return freep;
 f95:	48 8b 04 25 78 12 00 	mov    0x1278,%rax
 f9c:	00 
 f9d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 fa1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 fa5:	48 83 c4 20          	add    $0x20,%rsp
 fa9:	5d                   	pop    %rbp
 faa:	c3                   	retq   
