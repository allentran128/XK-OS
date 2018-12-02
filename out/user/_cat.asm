
out/user/_cat:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	89 7d fc             	mov    %edi,-0x4(%rbp)
   b:	48 be 70 12 00 00 00 	movabs $0x1270,%rsi
  12:	00 00 00 
  15:	ba 00 02 00 00       	mov    $0x200,%edx
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  1a:	8b 7d fc             	mov    -0x4(%rbp),%edi
  1d:	e8 7e 0b 00 00       	callq  ba0 <read>
  22:	89 45 f8             	mov    %eax,-0x8(%rbp)
  25:	83 f8 00             	cmp    $0x0,%eax
  28:	0f 8e 43 00 00 00    	jle    71 <cat+0x71>
  2e:	bf 01 00 00 00       	mov    $0x1,%edi
  33:	48 be 70 12 00 00 00 	movabs $0x1270,%rsi
  3a:	00 00 00 
    if (write(1, buf, n) != n) {
  3d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  40:	e8 63 0b 00 00       	callq  ba8 <write>
  45:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  48:	0f 84 1e 00 00 00    	je     6c <cat+0x6c>
  4e:	bf 01 00 00 00       	mov    $0x1,%edi
  53:	48 be 9b 0f 00 00 00 	movabs $0xf9b,%rsi
  5a:	00 00 00 
      printf(1, "cat: write error\n");
  5d:	b0 00                	mov    $0x0,%al
  5f:	e8 ec 00 00 00       	callq  150 <printf>
      exit();
  64:	e8 1f 0b 00 00       	callq  b88 <exit>
  69:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  6c:	e9 9a ff ff ff       	jmpq   b <cat+0xb>
    }
  }
  if(n < 0){
  71:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  75:	0f 8d 1e 00 00 00    	jge    99 <cat+0x99>
  7b:	bf 01 00 00 00       	mov    $0x1,%edi
  80:	48 be ad 0f 00 00 00 	movabs $0xfad,%rsi
  87:	00 00 00 
    printf(1, "cat: read error\n");
  8a:	b0 00                	mov    $0x0,%al
  8c:	e8 bf 00 00 00       	callq  150 <printf>
    exit();
  91:	e8 f2 0a 00 00       	callq  b88 <exit>
  96:	89 45 f0             	mov    %eax,-0x10(%rbp)
  }
}
  99:	48 83 c4 10          	add    $0x10,%rsp
  9d:	5d                   	pop    %rbp
  9e:	c3                   	retq   
  9f:	90                   	nop

00000000000000a0 <main>:

int
main(int argc, char *argv[])
{
  a0:	55                   	push   %rbp
  a1:	48 89 e5             	mov    %rsp,%rbp
  a4:	48 83 ec 30          	sub    $0x30,%rsp
  a8:	89 7d f8             	mov    %edi,-0x8(%rbp)
  ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int fd, i;

  if(argc <= 1){
  af:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
  b3:	0f 8f 0f 00 00 00    	jg     c8 <main+0x28>
  b9:	31 ff                	xor    %edi,%edi
    cat(0);
  bb:	e8 40 ff ff ff       	callq  0 <cat>
    exit();
  c0:	e8 c3 0a 00 00       	callq  b88 <exit>
  c5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  }

  for(i = 1; i < argc; i++){
  c8:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
  cf:	8b 45 e8             	mov    -0x18(%rbp),%eax
  d2:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  d5:	0f 8d 6a 00 00 00    	jge    145 <main+0xa5>
  db:	31 f6                	xor    %esi,%esi
    if((fd = open(argv[i], 0)) < 0){
  dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  e1:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
  e5:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
  e9:	e8 da 0a 00 00       	callq  bc8 <open>
  ee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  f1:	83 f8 00             	cmp    $0x0,%eax
  f4:	0f 8d 2a 00 00 00    	jge    124 <main+0x84>
  fa:	bf 01 00 00 00       	mov    $0x1,%edi
  ff:	48 be be 0f 00 00 00 	movabs $0xfbe,%rsi
 106:	00 00 00 
      printf(1, "cat: cannot open %s\n", argv[i]);
 109:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 10d:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
 111:	48 8b 14 c8          	mov    (%rax,%rcx,8),%rdx
 115:	b0 00                	mov    $0x0,%al
 117:	e8 34 00 00 00       	callq  150 <printf>
      exit();
 11c:	e8 67 0a 00 00       	callq  b88 <exit>
 121:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    cat(fd);
 124:	8b 7d ec             	mov    -0x14(%rbp),%edi
 127:	e8 d4 fe ff ff       	callq  0 <cat>
    close(fd);
 12c:	8b 7d ec             	mov    -0x14(%rbp),%edi
 12f:	e8 7c 0a 00 00       	callq  bb0 <close>
 134:	89 45 dc             	mov    %eax,-0x24(%rbp)
  for(i = 1; i < argc; i++){
 137:	8b 45 e8             	mov    -0x18(%rbp),%eax
 13a:	83 c0 01             	add    $0x1,%eax
 13d:	89 45 e8             	mov    %eax,-0x18(%rbp)
 140:	e9 8a ff ff ff       	jmpq   cf <main+0x2f>
  }
  exit();
 145:	e8 3e 0a 00 00       	callq  b88 <exit>
 14a:	89 45 d8             	mov    %eax,-0x28(%rbp)
 14d:	0f 1f 00             	nopl   (%rax)

0000000000000150 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 150:	55                   	push   %rbp
 151:	48 89 e5             	mov    %rsp,%rbp
 154:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
 15b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
 15f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
 163:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
 167:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
 16b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
 16f:	89 7d fc             	mov    %edi,-0x4(%rbp)
 172:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 176:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
 17a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
 17e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
 182:	48 89 51 08          	mov    %rdx,0x8(%rcx)
 186:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
 18d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
 193:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
 19a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
 1a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1a5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 1a9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 1ad:	0f 84 f0 03 00 00    	je     5a3 <printf+0x453>
    c = fmt[i] & 0xff;
 1b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1b7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 1bb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
 1bf:	81 e2 ff 00 00 00    	and    $0xff,%edx
 1c5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
 1c8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
 1cc:	0f 85 32 00 00 00    	jne    204 <printf+0xb4>
      if(c == '%'){
 1d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 1d6:	0f 85 13 00 00 00    	jne    1ef <printf+0x9f>
        state = '%';
 1dc:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 1e3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 1ea:	e9 10 00 00 00       	jmpq   1ff <printf+0xaf>
        putc(fd, c);
 1ef:	8b 7d fc             	mov    -0x4(%rbp),%edi
 1f2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 1f5:	88 c1                	mov    %al,%cl
 1f7:	0f be f1             	movsbl %cl,%esi
 1fa:	e8 b1 03 00 00       	callq  5b0 <putc>
      }
    } else if(state == '%'){
 1ff:	e9 8c 03 00 00       	jmpq   590 <printf+0x440>
 204:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 208:	0f 85 7d 03 00 00    	jne    58b <printf+0x43b>
      if(c == 'l') {
 20e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 212:	0f 85 0c 00 00 00    	jne    224 <printf+0xd4>
        lflag = 1;
 218:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 21f:	e9 71 03 00 00       	jmpq   595 <printf+0x445>
      } else if(c == 'd'){
 224:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 228:	0f 85 0e 01 00 00    	jne    33c <printf+0x1ec>
        if (lflag == 1)
 22e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 232:	0f 85 79 00 00 00    	jne    2b1 <printf+0x161>
 238:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 23c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 23f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 242:	83 f9 28             	cmp    $0x28,%ecx
 245:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 249:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 24c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 24f:	0f 87 1f 00 00 00    	ja     274 <printf+0x124>
 255:	8b 45 80             	mov    -0x80(%rbp),%eax
 258:	48 63 c8             	movslq %eax,%rcx
 25b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 25f:	48 03 4a 10          	add    0x10(%rdx),%rcx
 263:	83 c0 08             	add    $0x8,%eax
 266:	89 02                	mov    %eax,(%rdx)
 268:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 26f:	e9 1a 00 00 00       	jmpq   28e <printf+0x13e>
 274:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 278:	48 8b 48 08          	mov    0x8(%rax),%rcx
 27c:	48 89 ca             	mov    %rcx,%rdx
 27f:	48 83 c1 08          	add    $0x8,%rcx
 283:	48 89 48 08          	mov    %rcx,0x8(%rax)
 287:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 28e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 295:	ba 0a 00 00 00       	mov    $0xa,%edx
 29a:	b9 01 00 00 00       	mov    $0x1,%ecx
 29f:	48 8b 00             	mov    (%rax),%rax
 2a2:	89 c6                	mov    %eax,%esi
 2a4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 2a7:	e8 34 03 00 00       	callq  5e0 <printint64>
 2ac:	e9 86 00 00 00       	jmpq   337 <printf+0x1e7>
 2b1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 2b5:	8b 7d fc             	mov    -0x4(%rbp),%edi
 2b8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 2bb:	83 f9 28             	cmp    $0x28,%ecx
 2be:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 2c5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 2cb:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 2d1:	0f 87 25 00 00 00    	ja     2fc <printf+0x1ac>
 2d7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 2dd:	48 63 c8             	movslq %eax,%rcx
 2e0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 2e7:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2eb:	83 c0 08             	add    $0x8,%eax
 2ee:	89 02                	mov    %eax,(%rdx)
 2f0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 2f7:	e9 1d 00 00 00       	jmpq   319 <printf+0x1c9>
 2fc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 303:	48 8b 48 08          	mov    0x8(%rax),%rcx
 307:	48 89 ca             	mov    %rcx,%rdx
 30a:	48 83 c1 08          	add    $0x8,%rcx
 30e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 312:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 319:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 320:	ba 0a 00 00 00       	mov    $0xa,%edx
 325:	b9 01 00 00 00       	mov    $0x1,%ecx
 32a:	8b 30                	mov    (%rax),%esi
 32c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 332:	e8 a9 03 00 00       	callq  6e0 <printint>
      } else if(c == 'x' || c == 'p'){
 337:	e9 43 02 00 00       	jmpq   57f <printf+0x42f>
 33c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 340:	0f 84 0a 00 00 00    	je     350 <printf+0x200>
 346:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 34a:	0f 85 1d 01 00 00    	jne    46d <printf+0x31d>
        if (lflag == 1)
 350:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 354:	0f 85 8b 00 00 00    	jne    3e5 <printf+0x295>
 35a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 35e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 361:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 364:	83 f9 28             	cmp    $0x28,%ecx
 367:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 36e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 374:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 37a:	0f 87 25 00 00 00    	ja     3a5 <printf+0x255>
 380:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 386:	48 63 c8             	movslq %eax,%rcx
 389:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 390:	48 03 4a 10          	add    0x10(%rdx),%rcx
 394:	83 c0 08             	add    $0x8,%eax
 397:	89 02                	mov    %eax,(%rdx)
 399:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 3a0:	e9 1d 00 00 00       	jmpq   3c2 <printf+0x272>
 3a5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 3ac:	48 8b 48 08          	mov    0x8(%rax),%rcx
 3b0:	48 89 ca             	mov    %rcx,%rdx
 3b3:	48 83 c1 08          	add    $0x8,%rcx
 3b7:	48 89 48 08          	mov    %rcx,0x8(%rax)
 3bb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 3c2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 3c9:	ba 10 00 00 00       	mov    $0x10,%edx
 3ce:	31 c9                	xor    %ecx,%ecx
 3d0:	48 8b 00             	mov    (%rax),%rax
 3d3:	89 c6                	mov    %eax,%esi
 3d5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 3db:	e8 00 02 00 00       	callq  5e0 <printint64>
 3e0:	e9 83 00 00 00       	jmpq   468 <printf+0x318>
 3e5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 3e9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 3ec:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3ef:	83 f9 28             	cmp    $0x28,%ecx
 3f2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 3f9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 3ff:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 405:	0f 87 25 00 00 00    	ja     430 <printf+0x2e0>
 40b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 411:	48 63 c8             	movslq %eax,%rcx
 414:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 41b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 41f:	83 c0 08             	add    $0x8,%eax
 422:	89 02                	mov    %eax,(%rdx)
 424:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 42b:	e9 1d 00 00 00       	jmpq   44d <printf+0x2fd>
 430:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 437:	48 8b 48 08          	mov    0x8(%rax),%rcx
 43b:	48 89 ca             	mov    %rcx,%rdx
 43e:	48 83 c1 08          	add    $0x8,%rcx
 442:	48 89 48 08          	mov    %rcx,0x8(%rax)
 446:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 44d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 454:	ba 10 00 00 00       	mov    $0x10,%edx
 459:	31 c9                	xor    %ecx,%ecx
 45b:	8b 30                	mov    (%rax),%esi
 45d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 463:	e8 78 02 00 00       	callq  6e0 <printint>
      } else if(c == 's'){
 468:	e9 0d 01 00 00       	jmpq   57a <printf+0x42a>
 46d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 471:	0f 85 bc 00 00 00    	jne    533 <printf+0x3e3>
 477:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 47b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 47e:	83 f9 28             	cmp    $0x28,%ecx
 481:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 488:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 48e:	0f 87 25 00 00 00    	ja     4b9 <printf+0x369>
 494:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 49a:	48 63 c8             	movslq %eax,%rcx
 49d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 4a4:	48 03 4a 10          	add    0x10(%rdx),%rcx
 4a8:	83 c0 08             	add    $0x8,%eax
 4ab:	89 02                	mov    %eax,(%rdx)
 4ad:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 4b4:	e9 1d 00 00 00       	jmpq   4d6 <printf+0x386>
 4b9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 4c0:	48 8b 48 08          	mov    0x8(%rax),%rcx
 4c4:	48 89 ca             	mov    %rcx,%rdx
 4c7:	48 83 c1 08          	add    $0x8,%rcx
 4cb:	48 89 48 08          	mov    %rcx,0x8(%rax)
 4cf:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 4d6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 4dd:	48 8b 00             	mov    (%rax),%rax
 4e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 4e4:	48 83 f8 00          	cmp    $0x0,%rax
 4e8:	0f 85 0e 00 00 00    	jne    4fc <printf+0x3ac>
 4ee:	48 b8 d3 0f 00 00 00 	movabs $0xfd3,%rax
 4f5:	00 00 00 
          s = "(null)";
 4f8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 4fc:	e9 00 00 00 00       	jmpq   501 <printf+0x3b1>
 501:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 505:	80 38 00             	cmpb   $0x0,(%rax)
 508:	0f 84 20 00 00 00    	je     52e <printf+0x3de>
          putc(fd, *s);
 50e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 511:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 515:	0f be 30             	movsbl (%rax),%esi
 518:	e8 93 00 00 00       	callq  5b0 <putc>
        for(; *s; s++)
 51d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 521:	48 83 c0 01          	add    $0x1,%rax
 525:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 529:	e9 d3 ff ff ff       	jmpq   501 <printf+0x3b1>
      } else if(c == '%'){
 52e:	e9 42 00 00 00       	jmpq   575 <printf+0x425>
 533:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 537:	0f 85 15 00 00 00    	jne    552 <printf+0x402>
        putc(fd, c);
 53d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 540:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 543:	88 c1                	mov    %al,%cl
 545:	0f be f1             	movsbl %cl,%esi
 548:	e8 63 00 00 00       	callq  5b0 <putc>
      } else {
 54d:	e9 1e 00 00 00       	jmpq   570 <printf+0x420>
 552:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 557:	8b 7d fc             	mov    -0x4(%rbp),%edi
 55a:	e8 51 00 00 00       	callq  5b0 <putc>
        putc(fd, c);
 55f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 562:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 565:	40 88 f0             	mov    %sil,%al
 568:	0f be f0             	movsbl %al,%esi
 56b:	e8 40 00 00 00       	callq  5b0 <putc>
 570:	e9 00 00 00 00       	jmpq   575 <printf+0x425>
 575:	e9 00 00 00 00       	jmpq   57a <printf+0x42a>
 57a:	e9 00 00 00 00       	jmpq   57f <printf+0x42f>
 57f:	e9 00 00 00 00       	jmpq   584 <printf+0x434>
      }
      state = 0;
 584:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 58b:	e9 00 00 00 00       	jmpq   590 <printf+0x440>
    }
  }
 590:	e9 00 00 00 00       	jmpq   595 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 595:	8b 45 e0             	mov    -0x20(%rbp),%eax
 598:	83 c0 01             	add    $0x1,%eax
 59b:	89 45 e0             	mov    %eax,-0x20(%rbp)
 59e:	e9 fe fb ff ff       	jmpq   1a1 <printf+0x51>

  va_end(valist);
}
 5a3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 5aa:	5d                   	pop    %rbp
 5ab:	c3                   	retq   
 5ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000005b0 <putc>:
{
 5b0:	55                   	push   %rbp
 5b1:	48 89 e5             	mov    %rsp,%rbp
 5b4:	48 83 ec 10          	sub    $0x10,%rsp
 5b8:	40 88 f0             	mov    %sil,%al
 5bb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 5bf:	ba 01 00 00 00       	mov    $0x1,%edx
 5c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
 5c7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 5ca:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5cd:	e8 d6 05 00 00       	callq  ba8 <write>
}
 5d2:	89 45 f4             	mov    %eax,-0xc(%rbp)
 5d5:	48 83 c4 10          	add    $0x10,%rsp
 5d9:	5d                   	pop    %rbp
 5da:	c3                   	retq   
 5db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000005e0 <printint64>:
{
 5e0:	55                   	push   %rbp
 5e1:	48 89 e5             	mov    %rsp,%rbp
 5e4:	48 83 ec 50          	sub    $0x50,%rsp
 5e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 5eb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 5ee:	89 55 f4             	mov    %edx,-0xc(%rbp)
 5f1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 5f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 5f8:	0f 84 30 00 00 00    	je     62e <printint64+0x4e>
 5fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 602:	0f 9c c0             	setl   %al
 605:	88 c1                	mov    %al,%cl
 607:	80 e1 01             	and    $0x1,%cl
 60a:	0f b6 d1             	movzbl %cl,%edx
 60d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 610:	a8 01                	test   $0x1,%al
 612:	0f 85 05 00 00 00    	jne    61d <printint64+0x3d>
 618:	e9 11 00 00 00       	jmpq   62e <printint64+0x4e>
 61d:	31 c0                	xor    %eax,%eax
    x = -xx;
 61f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 622:	48 63 c8             	movslq %eax,%rcx
 625:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 629:	e9 08 00 00 00       	jmpq   636 <printint64+0x56>
    x = xx;
 62e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 632:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 636:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 63d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 641:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 645:	31 d2                	xor    %edx,%edx
 647:	48 f7 f1             	div    %rcx
 64a:	40 8a 34 15 10 12 00 	mov    0x1210(,%rdx,1),%sil
 651:	00 
 652:	8b 7d cc             	mov    -0x34(%rbp),%edi
 655:	41 89 f8             	mov    %edi,%r8d
 658:	41 83 c0 01          	add    $0x1,%r8d
 65c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 660:	48 63 cf             	movslq %edi,%rcx
 663:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 668:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 66c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 670:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 674:	48 89 c8             	mov    %rcx,%rax
 677:	31 d2                	xor    %edx,%edx
 679:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 67d:	48 f7 f1             	div    %rcx
 680:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 684:	48 83 f8 00          	cmp    $0x0,%rax
 688:	0f 85 af ff ff ff    	jne    63d <printint64+0x5d>
  if(sgn)
 68e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 692:	0f 84 13 00 00 00    	je     6ab <printint64+0xcb>
    buf[i++] = '-';
 698:	8b 45 cc             	mov    -0x34(%rbp),%eax
 69b:	89 c1                	mov    %eax,%ecx
 69d:	83 c1 01             	add    $0x1,%ecx
 6a0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 6a3:	48 63 d0             	movslq %eax,%rdx
 6a6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 6ab:	e9 00 00 00 00       	jmpq   6b0 <printint64+0xd0>
 6b0:	8b 45 cc             	mov    -0x34(%rbp),%eax
 6b3:	83 c0 ff             	add    $0xffffffff,%eax
 6b6:	89 45 cc             	mov    %eax,-0x34(%rbp)
 6b9:	83 f8 00             	cmp    $0x0,%eax
 6bc:	0f 8c 16 00 00 00    	jl     6d8 <printint64+0xf8>
    putc(fd, buf[i]);
 6c2:	8b 7d fc             	mov    -0x4(%rbp),%edi
 6c5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 6c9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 6ce:	e8 dd fe ff ff       	callq  5b0 <putc>
  while(--i >= 0)
 6d3:	e9 d8 ff ff ff       	jmpq   6b0 <printint64+0xd0>
}
 6d8:	48 83 c4 50          	add    $0x50,%rsp
 6dc:	5d                   	pop    %rbp
 6dd:	c3                   	retq   
 6de:	66 90                	xchg   %ax,%ax

00000000000006e0 <printint>:
{
 6e0:	55                   	push   %rbp
 6e1:	48 89 e5             	mov    %rsp,%rbp
 6e4:	48 83 ec 30          	sub    $0x30,%rsp
 6e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
 6eb:	89 75 f8             	mov    %esi,-0x8(%rbp)
 6ee:	89 55 f4             	mov    %edx,-0xc(%rbp)
 6f1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 6f4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 6fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 6ff:	0f 84 1e 00 00 00    	je     723 <printint+0x43>
 705:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 709:	0f 8d 14 00 00 00    	jge    723 <printint+0x43>
 70f:	31 c0                	xor    %eax,%eax
    neg = 1;
 711:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 718:	2b 45 f8             	sub    -0x8(%rbp),%eax
 71b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 71e:	e9 06 00 00 00       	jmpq   729 <printint+0x49>
    x = xx;
 723:	8b 45 f8             	mov    -0x8(%rbp),%eax
 726:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 729:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 730:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 733:	31 d2                	xor    %edx,%edx
 735:	f7 75 f4             	divl   -0xc(%rbp)
 738:	89 d2                	mov    %edx,%edx
 73a:	89 d1                	mov    %edx,%ecx
 73c:	40 8a 34 0d 30 12 00 	mov    0x1230(,%rcx,1),%sil
 743:	00 
 744:	8b 55 dc             	mov    -0x24(%rbp),%edx
 747:	89 d7                	mov    %edx,%edi
 749:	83 c7 01             	add    $0x1,%edi
 74c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 74f:	48 63 ca             	movslq %edx,%rcx
 752:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 757:	8b 45 f4             	mov    -0xc(%rbp),%eax
 75a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 75d:	89 45 d0             	mov    %eax,-0x30(%rbp)
 760:	89 c8                	mov    %ecx,%eax
 762:	31 d2                	xor    %edx,%edx
 764:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 767:	f7 f1                	div    %ecx
 769:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 76c:	83 f8 00             	cmp    $0x0,%eax
 76f:	0f 85 bb ff ff ff    	jne    730 <printint+0x50>
  if(neg)
 775:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 779:	0f 84 13 00 00 00    	je     792 <printint+0xb2>
    buf[i++] = '-';
 77f:	8b 45 dc             	mov    -0x24(%rbp),%eax
 782:	89 c1                	mov    %eax,%ecx
 784:	83 c1 01             	add    $0x1,%ecx
 787:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 78a:	48 63 d0             	movslq %eax,%rdx
 78d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 792:	e9 00 00 00 00       	jmpq   797 <printint+0xb7>
 797:	8b 45 dc             	mov    -0x24(%rbp),%eax
 79a:	83 c0 ff             	add    $0xffffffff,%eax
 79d:	89 45 dc             	mov    %eax,-0x24(%rbp)
 7a0:	83 f8 00             	cmp    $0x0,%eax
 7a3:	0f 8c 16 00 00 00    	jl     7bf <printint+0xdf>
    putc(fd, buf[i]);
 7a9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 7ac:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 7b0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 7b5:	e8 f6 fd ff ff       	callq  5b0 <putc>
  while(--i >= 0)
 7ba:	e9 d8 ff ff ff       	jmpq   797 <printint+0xb7>
}
 7bf:	48 83 c4 30          	add    $0x30,%rsp
 7c3:	5d                   	pop    %rbp
 7c4:	c3                   	retq   
 7c5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7cc:	00 00 00 
 7cf:	90                   	nop

00000000000007d0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 7d0:	55                   	push   %rbp
 7d1:	48 89 e5             	mov    %rsp,%rbp
 7d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 7d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 7dc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 7e0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 7e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7e8:	48 89 c1             	mov    %rax,%rcx
 7eb:	48 83 c1 01          	add    $0x1,%rcx
 7ef:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 7f3:	8a 10                	mov    (%rax),%dl
 7f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7f9:	48 89 c1             	mov    %rax,%rcx
 7fc:	48 83 c1 01          	add    $0x1,%rcx
 800:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 804:	88 10                	mov    %dl,(%rax)
 806:	0f be f2             	movsbl %dl,%esi
 809:	83 fe 00             	cmp    $0x0,%esi
 80c:	0f 84 05 00 00 00    	je     817 <strcpy+0x47>
 812:	e9 cd ff ff ff       	jmpq   7e4 <strcpy+0x14>
    ;
  return os;
 817:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 81b:	5d                   	pop    %rbp
 81c:	c3                   	retq   
 81d:	0f 1f 00             	nopl   (%rax)

0000000000000820 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 820:	55                   	push   %rbp
 821:	48 89 e5             	mov    %rsp,%rbp
 824:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 828:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 82c:	31 c0                	xor    %eax,%eax
 82e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 830:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 834:	0f be 02             	movsbl (%rdx),%eax
 837:	83 f8 00             	cmp    $0x0,%eax
 83a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 83d:	0f 84 18 00 00 00    	je     85b <strcmp+0x3b>
 843:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 847:	0f be 08             	movsbl (%rax),%ecx
 84a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 84e:	0f be 10             	movsbl (%rax),%edx
 851:	39 d1                	cmp    %edx,%ecx
 853:	40 0f 94 c6          	sete   %sil
 857:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 85b:	8a 45 ef             	mov    -0x11(%rbp),%al
 85e:	a8 01                	test   $0x1,%al
 860:	0f 85 05 00 00 00    	jne    86b <strcmp+0x4b>
 866:	e9 1d 00 00 00       	jmpq   888 <strcmp+0x68>
    p++, q++;
 86b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 86f:	48 83 c0 01          	add    $0x1,%rax
 873:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 877:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 87b:	48 83 c0 01          	add    $0x1,%rax
 87f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 883:	e9 a4 ff ff ff       	jmpq   82c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 888:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 88c:	0f b6 08             	movzbl (%rax),%ecx
 88f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 893:	0f b6 10             	movzbl (%rax),%edx
 896:	29 d1                	sub    %edx,%ecx
 898:	89 c8                	mov    %ecx,%eax
 89a:	5d                   	pop    %rbp
 89b:	c3                   	retq   
 89c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008a0 <strlen>:
}

uint
strlen(char *s)
{
 8a0:	55                   	push   %rbp
 8a1:	48 89 e5             	mov    %rsp,%rbp
 8a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 8a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 8af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8b3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 8b7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 8bb:	0f 84 13 00 00 00    	je     8d4 <strlen+0x34>
 8c1:	e9 00 00 00 00       	jmpq   8c6 <strlen+0x26>
 8c6:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8c9:	83 c0 01             	add    $0x1,%eax
 8cc:	89 45 f4             	mov    %eax,-0xc(%rbp)
 8cf:	e9 db ff ff ff       	jmpq   8af <strlen+0xf>
    ;
  return n;
 8d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8d7:	5d                   	pop    %rbp
 8d8:	c3                   	retq   
 8d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000008e0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 8e0:	55                   	push   %rbp
 8e1:	48 89 e5             	mov    %rsp,%rbp
 8e4:	48 83 ec 10          	sub    $0x10,%rsp
 8e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 8ec:	89 75 f4             	mov    %esi,-0xc(%rbp)
 8ef:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 8f2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 8f6:	8b 75 f4             	mov    -0xc(%rbp),%esi
 8f9:	8b 55 f0             	mov    -0x10(%rbp),%edx
 8fc:	e8 0f 00 00 00       	callq  910 <stosb>
  return dst;
 901:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 905:	48 83 c4 10          	add    $0x10,%rsp
 909:	5d                   	pop    %rbp
 90a:	c3                   	retq   
 90b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000910 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 910:	55                   	push   %rbp
 911:	48 89 e5             	mov    %rsp,%rbp
 914:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 918:	89 75 f4             	mov    %esi,-0xc(%rbp)
 91b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 91e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 922:	8b 55 f0             	mov    -0x10(%rbp),%edx
 925:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 928:	89 d1                	mov    %edx,%ecx
 92a:	fc                   	cld    
 92b:	f3 aa                	rep stos %al,%es:(%rdi)
 92d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 931:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 934:	5d                   	pop    %rbp
 935:	c3                   	retq   
 936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 93d:	00 00 00 

0000000000000940 <strchr>:
}

char*
strchr(const char *s, char c)
{
 940:	55                   	push   %rbp
 941:	48 89 e5             	mov    %rsp,%rbp
 944:	40 88 f0             	mov    %sil,%al
 947:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 94b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 94e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 952:	80 38 00             	cmpb   $0x0,(%rax)
 955:	0f 84 36 00 00 00    	je     991 <strchr+0x51>
    if(*s == c)
 95b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 95f:	0f be 08             	movsbl (%rax),%ecx
 962:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 966:	39 d1                	cmp    %edx,%ecx
 968:	0f 85 0d 00 00 00    	jne    97b <strchr+0x3b>
      return (char*)s;
 96e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 972:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 976:	e9 1e 00 00 00       	jmpq   999 <strchr+0x59>
    if(*s == c)
 97b:	e9 00 00 00 00       	jmpq   980 <strchr+0x40>
  for(; *s; s++)
 980:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 984:	48 83 c0 01          	add    $0x1,%rax
 988:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 98c:	e9 bd ff ff ff       	jmpq   94e <strchr+0xe>
  return 0;
 991:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 998:	00 
}
 999:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 99d:	5d                   	pop    %rbp
 99e:	c3                   	retq   
 99f:	90                   	nop

00000000000009a0 <gets>:

char*
gets(char *buf, int max)
{
 9a0:	55                   	push   %rbp
 9a1:	48 89 e5             	mov    %rsp,%rbp
 9a4:	48 83 ec 20          	sub    $0x20,%rsp
 9a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 9ac:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 9af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 9b6:	8b 45 f0             	mov    -0x10(%rbp),%eax
 9b9:	83 c0 01             	add    $0x1,%eax
 9bc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 9bf:	0f 8d 5e 00 00 00    	jge    a23 <gets+0x83>
 9c5:	31 ff                	xor    %edi,%edi
 9c7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 9cb:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 9d0:	e8 cb 01 00 00       	callq  ba0 <read>
 9d5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 9d8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 9dc:	0f 8d 05 00 00 00    	jge    9e7 <gets+0x47>
      break;
 9e2:	e9 3c 00 00 00       	jmpq   a23 <gets+0x83>
    buf[i++] = c;
 9e7:	8a 45 eb             	mov    -0x15(%rbp),%al
 9ea:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9ee:	8b 55 f0             	mov    -0x10(%rbp),%edx
 9f1:	89 d6                	mov    %edx,%esi
 9f3:	83 c6 01             	add    $0x1,%esi
 9f6:	89 75 f0             	mov    %esi,-0x10(%rbp)
 9f9:	48 63 fa             	movslq %edx,%rdi
 9fc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 9ff:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 a03:	83 fa 0a             	cmp    $0xa,%edx
 a06:	0f 84 0d 00 00 00    	je     a19 <gets+0x79>
 a0c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 a10:	83 f8 0d             	cmp    $0xd,%eax
 a13:	0f 85 05 00 00 00    	jne    a1e <gets+0x7e>
      break;
 a19:	e9 05 00 00 00       	jmpq   a23 <gets+0x83>
  for(i=0; i+1 < max; ){
 a1e:	e9 93 ff ff ff       	jmpq   9b6 <gets+0x16>
  }
  buf[i] = '\0';
 a23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a27:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 a2b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 a2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a33:	48 83 c4 20          	add    $0x20,%rsp
 a37:	5d                   	pop    %rbp
 a38:	c3                   	retq   
 a39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a40 <stat>:
}

int
stat(char *n, struct stat *st)
{
 a40:	55                   	push   %rbp
 a41:	48 89 e5             	mov    %rsp,%rbp
 a44:	48 83 ec 30          	sub    $0x30,%rsp
 a48:	31 c0                	xor    %eax,%eax
 a4a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 a4e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 a52:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 a56:	89 c6                	mov    %eax,%esi
 a58:	e8 6b 01 00 00       	callq  bc8 <open>
 a5d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 a60:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 a64:	0f 8d 0c 00 00 00    	jge    a76 <stat+0x36>
    return -1;
 a6a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 a71:	e9 20 00 00 00       	jmpq   a96 <stat+0x56>
  r = fstat(fd, st);
 a76:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 a79:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 a7d:	e8 5e 01 00 00       	callq  be0 <fstat>
 a82:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 a85:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 a88:	e8 23 01 00 00       	callq  bb0 <close>
  return r;
 a8d:	8b 7d e0             	mov    -0x20(%rbp),%edi
 a90:	89 7d fc             	mov    %edi,-0x4(%rbp)
 a93:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 a96:	8b 45 fc             	mov    -0x4(%rbp),%eax
 a99:	48 83 c4 30          	add    $0x30,%rsp
 a9d:	5d                   	pop    %rbp
 a9e:	c3                   	retq   
 a9f:	90                   	nop

0000000000000aa0 <atoi>:

int
atoi(const char *s)
{
 aa0:	55                   	push   %rbp
 aa1:	48 89 e5             	mov    %rsp,%rbp
 aa4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 aa8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 aaf:	31 c0                	xor    %eax,%eax
 ab1:	88 c1                	mov    %al,%cl
 ab3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 ab8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 abc:	0f be 32             	movsbl (%rdx),%esi
 abf:	39 f0                	cmp    %esi,%eax
 ac1:	88 4d f3             	mov    %cl,-0xd(%rbp)
 ac4:	0f 8f 10 00 00 00    	jg     ada <atoi+0x3a>
 aca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 ace:	0f be 08             	movsbl (%rax),%ecx
 ad1:	83 f9 39             	cmp    $0x39,%ecx
 ad4:	0f 9e c2             	setle  %dl
 ad7:	88 55 f3             	mov    %dl,-0xd(%rbp)
 ada:	8a 45 f3             	mov    -0xd(%rbp),%al
 add:	a8 01                	test   $0x1,%al
 adf:	0f 85 05 00 00 00    	jne    aea <atoi+0x4a>
 ae5:	e9 23 00 00 00       	jmpq   b0d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 aea:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 aee:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 af2:	48 89 ca             	mov    %rcx,%rdx
 af5:	48 83 c2 01          	add    $0x1,%rdx
 af9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 afd:	0f be 31             	movsbl (%rcx),%esi
 b00:	01 f0                	add    %esi,%eax
 b02:	83 e8 30             	sub    $0x30,%eax
 b05:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 b08:	e9 a2 ff ff ff       	jmpq   aaf <atoi+0xf>
  return n;
 b0d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 b10:	5d                   	pop    %rbp
 b11:	c3                   	retq   
 b12:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 b19:	1f 84 00 00 00 00 00 

0000000000000b20 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 b20:	55                   	push   %rbp
 b21:	48 89 e5             	mov    %rsp,%rbp
 b24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 b28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 b2c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 b2f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 b33:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 b37:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 b3b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 b3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 b42:	89 c1                	mov    %eax,%ecx
 b44:	83 c1 ff             	add    $0xffffffff,%ecx
 b47:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 b4a:	83 f8 00             	cmp    $0x0,%eax
 b4d:	0f 8e 27 00 00 00    	jle    b7a <memmove+0x5a>
    *dst++ = *src++;
 b53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 b57:	48 89 c1             	mov    %rax,%rcx
 b5a:	48 83 c1 01          	add    $0x1,%rcx
 b5e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 b62:	8a 10                	mov    (%rax),%dl
 b64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 b68:	48 89 c1             	mov    %rax,%rcx
 b6b:	48 83 c1 01          	add    $0x1,%rcx
 b6f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 b73:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 b75:	e9 c5 ff ff ff       	jmpq   b3f <memmove+0x1f>
  return vdst;
 b7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 b7e:	5d                   	pop    %rbp
 b7f:	c3                   	retq   

0000000000000b80 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 b80:	b8 01 00 00 00       	mov    $0x1,%eax
 b85:	cd 40                	int    $0x40
 b87:	c3                   	retq   

0000000000000b88 <exit>:
SYSCALL(exit)
 b88:	b8 02 00 00 00       	mov    $0x2,%eax
 b8d:	cd 40                	int    $0x40
 b8f:	c3                   	retq   

0000000000000b90 <wait>:
SYSCALL(wait)
 b90:	b8 03 00 00 00       	mov    $0x3,%eax
 b95:	cd 40                	int    $0x40
 b97:	c3                   	retq   

0000000000000b98 <pipe>:
SYSCALL(pipe)
 b98:	b8 04 00 00 00       	mov    $0x4,%eax
 b9d:	cd 40                	int    $0x40
 b9f:	c3                   	retq   

0000000000000ba0 <read>:
SYSCALL(read)
 ba0:	b8 05 00 00 00       	mov    $0x5,%eax
 ba5:	cd 40                	int    $0x40
 ba7:	c3                   	retq   

0000000000000ba8 <write>:
SYSCALL(write)
 ba8:	b8 10 00 00 00       	mov    $0x10,%eax
 bad:	cd 40                	int    $0x40
 baf:	c3                   	retq   

0000000000000bb0 <close>:
SYSCALL(close)
 bb0:	b8 15 00 00 00       	mov    $0x15,%eax
 bb5:	cd 40                	int    $0x40
 bb7:	c3                   	retq   

0000000000000bb8 <kill>:
SYSCALL(kill)
 bb8:	b8 06 00 00 00       	mov    $0x6,%eax
 bbd:	cd 40                	int    $0x40
 bbf:	c3                   	retq   

0000000000000bc0 <exec>:
SYSCALL(exec)
 bc0:	b8 07 00 00 00       	mov    $0x7,%eax
 bc5:	cd 40                	int    $0x40
 bc7:	c3                   	retq   

0000000000000bc8 <open>:
SYSCALL(open)
 bc8:	b8 0f 00 00 00       	mov    $0xf,%eax
 bcd:	cd 40                	int    $0x40
 bcf:	c3                   	retq   

0000000000000bd0 <mknod>:
SYSCALL(mknod)
 bd0:	b8 11 00 00 00       	mov    $0x11,%eax
 bd5:	cd 40                	int    $0x40
 bd7:	c3                   	retq   

0000000000000bd8 <unlink>:
SYSCALL(unlink)
 bd8:	b8 12 00 00 00       	mov    $0x12,%eax
 bdd:	cd 40                	int    $0x40
 bdf:	c3                   	retq   

0000000000000be0 <fstat>:
SYSCALL(fstat)
 be0:	b8 08 00 00 00       	mov    $0x8,%eax
 be5:	cd 40                	int    $0x40
 be7:	c3                   	retq   

0000000000000be8 <link>:
SYSCALL(link)
 be8:	b8 13 00 00 00       	mov    $0x13,%eax
 bed:	cd 40                	int    $0x40
 bef:	c3                   	retq   

0000000000000bf0 <mkdir>:
SYSCALL(mkdir)
 bf0:	b8 14 00 00 00       	mov    $0x14,%eax
 bf5:	cd 40                	int    $0x40
 bf7:	c3                   	retq   

0000000000000bf8 <chdir>:
SYSCALL(chdir)
 bf8:	b8 09 00 00 00       	mov    $0x9,%eax
 bfd:	cd 40                	int    $0x40
 bff:	c3                   	retq   

0000000000000c00 <dup>:
SYSCALL(dup)
 c00:	b8 0a 00 00 00       	mov    $0xa,%eax
 c05:	cd 40                	int    $0x40
 c07:	c3                   	retq   

0000000000000c08 <getpid>:
SYSCALL(getpid)
 c08:	b8 0b 00 00 00       	mov    $0xb,%eax
 c0d:	cd 40                	int    $0x40
 c0f:	c3                   	retq   

0000000000000c10 <sbrk>:
SYSCALL(sbrk)
 c10:	b8 0c 00 00 00       	mov    $0xc,%eax
 c15:	cd 40                	int    $0x40
 c17:	c3                   	retq   

0000000000000c18 <sleep>:
SYSCALL(sleep)
 c18:	b8 0d 00 00 00       	mov    $0xd,%eax
 c1d:	cd 40                	int    $0x40
 c1f:	c3                   	retq   

0000000000000c20 <uptime>:
SYSCALL(uptime)
 c20:	b8 0e 00 00 00       	mov    $0xe,%eax
 c25:	cd 40                	int    $0x40
 c27:	c3                   	retq   

0000000000000c28 <sysinfo>:
SYSCALL(sysinfo)
 c28:	b8 16 00 00 00       	mov    $0x16,%eax
 c2d:	cd 40                	int    $0x40
 c2f:	c3                   	retq   

0000000000000c30 <mmap>:
SYSCALL(mmap)
 c30:	b8 17 00 00 00       	mov    $0x17,%eax
 c35:	cd 40                	int    $0x40
 c37:	c3                   	retq   

0000000000000c38 <munmap>:
SYSCALL(munmap)
 c38:	b8 18 00 00 00       	mov    $0x18,%eax
 c3d:	cd 40                	int    $0x40
 c3f:	c3                   	retq   

0000000000000c40 <crashn>:
SYSCALL(crashn)
 c40:	b8 19 00 00 00       	mov    $0x19,%eax
 c45:	cd 40                	int    $0x40
 c47:	c3                   	retq   
 c48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 c4f:	00 

0000000000000c50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c50:	55                   	push   %rbp
 c51:	48 89 e5             	mov    %rsp,%rbp
 c54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c58:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 c5c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 c60:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c64:	48 8b 3c 25 50 12 00 	mov    0x1250,%rdi
 c6b:	00 
 c6c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 c70:	31 c0                	xor    %eax,%eax
 c72:	88 c1                	mov    %al,%cl
 c74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 c78:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 c7c:	88 4d e7             	mov    %cl,-0x19(%rbp)
 c7f:	0f 86 11 00 00 00    	jbe    c96 <free+0x46>
 c85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 c89:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 c8d:	48 3b 01             	cmp    (%rcx),%rax
 c90:	0f 92 c2             	setb   %dl
 c93:	88 55 e7             	mov    %dl,-0x19(%rbp)
 c96:	8a 45 e7             	mov    -0x19(%rbp),%al
 c99:	34 ff                	xor    $0xff,%al
 c9b:	a8 01                	test   $0x1,%al
 c9d:	0f 85 05 00 00 00    	jne    ca8 <free+0x58>
 ca3:	e9 4a 00 00 00       	jmpq   cf2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ca8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cac:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cb0:	48 3b 01             	cmp    (%rcx),%rax
 cb3:	0f 82 24 00 00 00    	jb     cdd <free+0x8d>
 cb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cbd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 cc1:	0f 87 11 00 00 00    	ja     cd8 <free+0x88>
 cc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 ccb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 ccf:	48 3b 01             	cmp    (%rcx),%rax
 cd2:	0f 83 05 00 00 00    	jae    cdd <free+0x8d>
      break;
 cd8:	e9 15 00 00 00       	jmpq   cf2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cdd:	e9 00 00 00 00       	jmpq   ce2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ce2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ce6:	48 8b 00             	mov    (%rax),%rax
 ce9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 ced:	e9 7e ff ff ff       	jmpq   c70 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 cf2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cf6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 cfa:	8b 51 08             	mov    0x8(%rcx),%edx
 cfd:	89 d1                	mov    %edx,%ecx
 cff:	48 c1 e1 04          	shl    $0x4,%rcx
 d03:	48 01 c8             	add    %rcx,%rax
 d06:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d0a:	48 3b 01             	cmp    (%rcx),%rax
 d0d:	0f 85 2a 00 00 00    	jne    d3d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 d13:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d17:	48 8b 00             	mov    (%rax),%rax
 d1a:	8b 48 08             	mov    0x8(%rax),%ecx
 d1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d21:	03 48 08             	add    0x8(%rax),%ecx
 d24:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d2b:	48 8b 00             	mov    (%rax),%rax
 d2e:	48 8b 00             	mov    (%rax),%rax
 d31:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 d35:	48 89 02             	mov    %rax,(%rdx)
  } else
 d38:	e9 0e 00 00 00       	jmpq   d4b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 d3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d41:	48 8b 00             	mov    (%rax),%rax
 d44:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 d48:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 d4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d4f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d53:	8b 51 08             	mov    0x8(%rcx),%edx
 d56:	89 d1                	mov    %edx,%ecx
 d58:	48 c1 e1 04          	shl    $0x4,%rcx
 d5c:	48 01 c8             	add    %rcx,%rax
 d5f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 d63:	0f 85 24 00 00 00    	jne    d8d <free+0x13d>
    p->s.size += bp->s.size;
 d69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d6d:	8b 48 08             	mov    0x8(%rax),%ecx
 d70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d74:	03 48 08             	add    0x8(%rax),%ecx
 d77:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 d7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d7e:	48 8b 00             	mov    (%rax),%rax
 d81:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 d85:	48 89 02             	mov    %rax,(%rdx)
  } else
 d88:	e9 0b 00 00 00       	jmpq   d98 <free+0x148>
    p->s.ptr = bp;
 d8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d91:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d95:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 d98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d9c:	48 89 04 25 50 12 00 	mov    %rax,0x1250
 da3:	00 
}
 da4:	5d                   	pop    %rbp
 da5:	c3                   	retq   
 da6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 dad:	00 00 00 

0000000000000db0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 db0:	55                   	push   %rbp
 db1:	48 89 e5             	mov    %rsp,%rbp
 db4:	48 83 ec 30          	sub    $0x30,%rsp
 db8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 dbb:	8b 7d f4             	mov    -0xc(%rbp),%edi
 dbe:	89 f8                	mov    %edi,%eax
 dc0:	48 83 c0 10          	add    $0x10,%rax
 dc4:	48 83 e8 01          	sub    $0x1,%rax
 dc8:	48 c1 e8 04          	shr    $0x4,%rax
 dcc:	48 83 c0 01          	add    $0x1,%rax
 dd0:	89 c7                	mov    %eax,%edi
 dd2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 dd5:	48 8b 04 25 50 12 00 	mov    0x1250,%rax
 ddc:	00 
 ddd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 de1:	48 83 f8 00          	cmp    $0x0,%rax
 de5:	0f 85 29 00 00 00    	jne    e14 <malloc+0x64>
 deb:	48 b8 58 12 00 00 00 	movabs $0x1258,%rax
 df2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 df5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 df9:	48 89 04 25 50 12 00 	mov    %rax,0x1250
 e00:	00 
 e01:	48 89 04 25 58 12 00 	mov    %rax,0x1258
 e08:	00 
    base.s.size = 0;
 e09:	c7 04 25 60 12 00 00 	movl   $0x0,0x1260
 e10:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e14:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e18:	48 8b 00             	mov    (%rax),%rax
 e1b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 e1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e23:	8b 48 08             	mov    0x8(%rax),%ecx
 e26:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e29:	0f 82 73 00 00 00    	jb     ea2 <malloc+0xf2>
      if(p->s.size == nunits)
 e2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e33:	8b 48 08             	mov    0x8(%rax),%ecx
 e36:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e39:	0f 85 13 00 00 00    	jne    e52 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 e3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e43:	48 8b 00             	mov    (%rax),%rax
 e46:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 e4a:	48 89 01             	mov    %rax,(%rcx)
 e4d:	e9 33 00 00 00       	jmpq   e85 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 e52:	8b 45 dc             	mov    -0x24(%rbp),%eax
 e55:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e59:	8b 51 08             	mov    0x8(%rcx),%edx
 e5c:	29 c2                	sub    %eax,%edx
 e5e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 e61:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e65:	8b 41 08             	mov    0x8(%rcx),%eax
 e68:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e6c:	89 c0                	mov    %eax,%eax
 e6e:	89 c6                	mov    %eax,%esi
 e70:	48 c1 e6 04          	shl    $0x4,%rsi
 e74:	48 01 f1             	add    %rsi,%rcx
 e77:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 e7b:	8b 45 dc             	mov    -0x24(%rbp),%eax
 e7e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 e82:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 e85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e89:	48 89 04 25 50 12 00 	mov    %rax,0x1250
 e90:	00 
      return (void*)(p + 1);
 e91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e95:	48 83 c0 10          	add    $0x10,%rax
 e99:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 e9d:	e9 57 00 00 00       	jmpq   ef9 <malloc+0x149>
    }
    if(p == freep)
 ea2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ea6:	48 3b 04 25 50 12 00 	cmp    0x1250,%rax
 ead:	00 
 eae:	0f 85 28 00 00 00    	jne    edc <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 eb4:	8b 7d dc             	mov    -0x24(%rbp),%edi
 eb7:	e8 54 00 00 00       	callq  f10 <morecore>
 ebc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 ec0:	48 83 f8 00          	cmp    $0x0,%rax
 ec4:	0f 85 0d 00 00 00    	jne    ed7 <malloc+0x127>
        return 0;
 eca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 ed1:	00 
 ed2:	e9 22 00 00 00       	jmpq   ef9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 ed7:	e9 00 00 00 00       	jmpq   edc <malloc+0x12c>
  }
 edc:	e9 00 00 00 00       	jmpq   ee1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ee1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ee5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 ee9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 eed:	48 8b 00             	mov    (%rax),%rax
 ef0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 ef4:	e9 26 ff ff ff       	jmpq   e1f <malloc+0x6f>
 ef9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 efd:	48 83 c4 30          	add    $0x30,%rsp
 f01:	5d                   	pop    %rbp
 f02:	c3                   	retq   
 f03:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 f0a:	84 00 00 00 00 00 

0000000000000f10 <morecore>:
{
 f10:	55                   	push   %rbp
 f11:	48 89 e5             	mov    %rsp,%rbp
 f14:	48 83 ec 20          	sub    $0x20,%rsp
 f18:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 f1b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 f22:	0f 83 07 00 00 00    	jae    f2f <morecore+0x1f>
    nu = 4096;
 f28:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 f2f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 f32:	89 c1                	mov    %eax,%ecx
 f34:	48 c1 e1 04          	shl    $0x4,%rcx
 f38:	89 c8                	mov    %ecx,%eax
 f3a:	89 c7                	mov    %eax,%edi
 f3c:	e8 cf fc ff ff       	callq  c10 <sbrk>
 f41:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 f48:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 f4c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 f50:	0f 85 0d 00 00 00    	jne    f63 <morecore+0x53>
    return 0;
 f56:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 f5d:	00 
 f5e:	e9 2e 00 00 00       	jmpq   f91 <morecore+0x81>
  hp = (Header*)p;
 f63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 f67:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 f6b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 f6e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 f72:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 f75:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 f79:	48 83 c0 10          	add    $0x10,%rax
 f7d:	48 89 c7             	mov    %rax,%rdi
 f80:	e8 cb fc ff ff       	callq  c50 <free>
  return freep;
 f85:	48 8b 04 25 50 12 00 	mov    0x1250,%rax
 f8c:	00 
 f8d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 f91:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 f95:	48 83 c4 20          	add    $0x20,%rsp
 f99:	5d                   	pop    %rbp
 f9a:	c3                   	retq   
