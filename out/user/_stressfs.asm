
out/user/_stressfs:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
#include <fs.h>
#include <fcntl.h>

int
main(int argc, char *argv[])
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 81 ec 50 02 00 00 	sub    $0x250,%rsp
   b:	b8 01 00 00 00       	mov    $0x1,%eax
  10:	48 b9 f5 0f 00 00 00 	movabs $0xff5,%rcx
  17:	00 00 00 
  1a:	89 7d f8             	mov    %edi,-0x8(%rbp)
  1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int fd, i;
  char path[] = "stressfs0";
  21:	48 8b 34 25 eb 0f 00 	mov    0xfeb,%rsi
  28:	00 
  29:	48 89 75 de          	mov    %rsi,-0x22(%rbp)
  2d:	66 8b 14 25 f3 0f 00 	mov    0xff3,%dx
  34:	00 
  35:	66 89 55 e6          	mov    %dx,-0x1a(%rbp)
  char data[512];

  printf(1, "stressfs starting\n");
  39:	89 c7                	mov    %eax,%edi
  3b:	48 89 ce             	mov    %rcx,%rsi
  3e:	b0 00                	mov    $0x0,%al
  40:	e8 5b 01 00 00       	callq  1a0 <printf>
  45:	be 61 00 00 00       	mov    $0x61,%esi
  4a:	ba 00 02 00 00       	mov    $0x200,%edx
  4f:	48 8d bd d0 fd ff ff 	lea    -0x230(%rbp),%rdi
  memset(data, 'a', sizeof(data));
  56:	e8 d5 08 00 00       	callq  930 <memset>

  for(i = 0; i < 4; i++)
  5b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  62:	48 89 85 c8 fd ff ff 	mov    %rax,-0x238(%rbp)
  69:	83 7d e8 04          	cmpl   $0x4,-0x18(%rbp)
  6d:	0f 8d 26 00 00 00    	jge    99 <main+0x99>
    if(fork() > 0)
  73:	e8 58 0b 00 00       	callq  bd0 <fork>
  78:	83 f8 00             	cmp    $0x0,%eax
  7b:	0f 8e 05 00 00 00    	jle    86 <main+0x86>
      break;
  81:	e9 13 00 00 00       	jmpq   99 <main+0x99>
    if(fork() > 0)
  86:	e9 00 00 00 00       	jmpq   8b <main+0x8b>
  for(i = 0; i < 4; i++)
  8b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8e:	83 c0 01             	add    $0x1,%eax
  91:	89 45 e8             	mov    %eax,-0x18(%rbp)
  94:	e9 d0 ff ff ff       	jmpq   69 <main+0x69>
  99:	bf 01 00 00 00       	mov    $0x1,%edi
  9e:	48 be 08 10 00 00 00 	movabs $0x1008,%rsi
  a5:	00 00 00 

  printf(1, "write %d\n", i);
  a8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  ab:	b0 00                	mov    $0x0,%al
  ad:	e8 ee 00 00 00       	callq  1a0 <printf>
  b2:	be 02 02 00 00       	mov    $0x202,%esi
  b7:	48 8d 7d de          	lea    -0x22(%rbp),%rdi

  path[8] += i;
  bb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  be:	0f be 4d e6          	movsbl -0x1a(%rbp),%ecx
  c2:	01 d1                	add    %edx,%ecx
  c4:	88 c8                	mov    %cl,%al
  c6:	88 45 e6             	mov    %al,-0x1a(%rbp)
  fd = open(path, O_CREATE | O_RDWR);
  c9:	e8 4a 0b 00 00       	callq  c18 <open>
  ce:	89 45 ec             	mov    %eax,-0x14(%rbp)
  for(i = 0; i < 20; i++)
  d1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  d8:	83 7d e8 14          	cmpl   $0x14,-0x18(%rbp)
  dc:	0f 8d 28 00 00 00    	jge    10a <main+0x10a>
  e2:	ba 00 02 00 00       	mov    $0x200,%edx
  e7:	48 8d b5 d0 fd ff ff 	lea    -0x230(%rbp),%rsi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ee:	8b 7d ec             	mov    -0x14(%rbp),%edi
  f1:	e8 02 0b 00 00       	callq  bf8 <write>
  f6:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%rbp)
  for(i = 0; i < 20; i++)
  fc:	8b 45 e8             	mov    -0x18(%rbp),%eax
  ff:	83 c0 01             	add    $0x1,%eax
 102:	89 45 e8             	mov    %eax,-0x18(%rbp)
 105:	e9 ce ff ff ff       	jmpq   d8 <main+0xd8>
  close(fd);
 10a:	8b 7d ec             	mov    -0x14(%rbp),%edi
 10d:	e8 ee 0a 00 00       	callq  c00 <close>
 112:	bf 01 00 00 00       	mov    $0x1,%edi
 117:	48 be 12 10 00 00 00 	movabs $0x1012,%rsi
 11e:	00 00 00 

  printf(1, "read\n");
 121:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
 127:	b0 00                	mov    $0x0,%al
 129:	e8 72 00 00 00       	callq  1a0 <printf>
 12e:	31 f6                	xor    %esi,%esi
 130:	48 8d 7d de          	lea    -0x22(%rbp),%rdi

  fd = open(path, O_RDONLY);
 134:	e8 df 0a 00 00       	callq  c18 <open>
 139:	89 45 ec             	mov    %eax,-0x14(%rbp)
  for (i = 0; i < 20; i++)
 13c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
 143:	83 7d e8 14          	cmpl   $0x14,-0x18(%rbp)
 147:	0f 8d 28 00 00 00    	jge    175 <main+0x175>
 14d:	ba 00 02 00 00       	mov    $0x200,%edx
 152:	48 8d b5 d0 fd ff ff 	lea    -0x230(%rbp),%rsi
    read(fd, data, sizeof(data));
 159:	8b 7d ec             	mov    -0x14(%rbp),%edi
 15c:	e8 8f 0a 00 00       	callq  bf0 <read>
 161:	89 85 bc fd ff ff    	mov    %eax,-0x244(%rbp)
  for (i = 0; i < 20; i++)
 167:	8b 45 e8             	mov    -0x18(%rbp),%eax
 16a:	83 c0 01             	add    $0x1,%eax
 16d:	89 45 e8             	mov    %eax,-0x18(%rbp)
 170:	e9 ce ff ff ff       	jmpq   143 <main+0x143>
  close(fd);
 175:	8b 7d ec             	mov    -0x14(%rbp),%edi
 178:	e8 83 0a 00 00       	callq  c00 <close>

  wait();
 17d:	89 85 b8 fd ff ff    	mov    %eax,-0x248(%rbp)
 183:	e8 58 0a 00 00       	callq  be0 <wait>

  exit();
 188:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%rbp)
 18e:	e8 45 0a 00 00       	callq  bd8 <exit>
 193:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
 199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000001a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 1a0:	55                   	push   %rbp
 1a1:	48 89 e5             	mov    %rsp,%rbp
 1a4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
 1ab:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
 1af:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
 1b3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
 1b7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
 1bb:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
 1bf:	89 7d fc             	mov    %edi,-0x4(%rbp)
 1c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 1c6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
 1ca:	48 89 51 10          	mov    %rdx,0x10(%rcx)
 1ce:	48 8d 55 10          	lea    0x10(%rbp),%rdx
 1d2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
 1d6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
 1dd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
 1e3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
 1ea:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
 1f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1f5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 1f9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 1fd:	0f 84 f0 03 00 00    	je     5f3 <printf+0x453>
    c = fmt[i] & 0xff;
 203:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 207:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
 20b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
 20f:	81 e2 ff 00 00 00    	and    $0xff,%edx
 215:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
 218:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
 21c:	0f 85 32 00 00 00    	jne    254 <printf+0xb4>
      if(c == '%'){
 222:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 226:	0f 85 13 00 00 00    	jne    23f <printf+0x9f>
        state = '%';
 22c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
 233:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
 23a:	e9 10 00 00 00       	jmpq   24f <printf+0xaf>
        putc(fd, c);
 23f:	8b 7d fc             	mov    -0x4(%rbp),%edi
 242:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 245:	88 c1                	mov    %al,%cl
 247:	0f be f1             	movsbl %cl,%esi
 24a:	e8 b1 03 00 00       	callq  600 <putc>
      }
    } else if(state == '%'){
 24f:	e9 8c 03 00 00       	jmpq   5e0 <printf+0x440>
 254:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
 258:	0f 85 7d 03 00 00    	jne    5db <printf+0x43b>
      if(c == 'l') {
 25e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
 262:	0f 85 0c 00 00 00    	jne    274 <printf+0xd4>
        lflag = 1;
 268:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
 26f:	e9 71 03 00 00       	jmpq   5e5 <printf+0x445>
      } else if(c == 'd'){
 274:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
 278:	0f 85 0e 01 00 00    	jne    38c <printf+0x1ec>
        if (lflag == 1)
 27e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 282:	0f 85 79 00 00 00    	jne    301 <printf+0x161>
 288:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
 28c:	8b 7d fc             	mov    -0x4(%rbp),%edi
 28f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 292:	83 f9 28             	cmp    $0x28,%ecx
 295:	48 89 45 88          	mov    %rax,-0x78(%rbp)
 299:	89 7d 84             	mov    %edi,-0x7c(%rbp)
 29c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
 29f:	0f 87 1f 00 00 00    	ja     2c4 <printf+0x124>
 2a5:	8b 45 80             	mov    -0x80(%rbp),%eax
 2a8:	48 63 c8             	movslq %eax,%rcx
 2ab:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
 2af:	48 03 4a 10          	add    0x10(%rdx),%rcx
 2b3:	83 c0 08             	add    $0x8,%eax
 2b6:	89 02                	mov    %eax,(%rdx)
 2b8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
 2bf:	e9 1a 00 00 00       	jmpq   2de <printf+0x13e>
 2c4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 2c8:	48 8b 48 08          	mov    0x8(%rax),%rcx
 2cc:	48 89 ca             	mov    %rcx,%rdx
 2cf:	48 83 c1 08          	add    $0x8,%rcx
 2d3:	48 89 48 08          	mov    %rcx,0x8(%rax)
 2d7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 2de:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
 2e5:	ba 0a 00 00 00       	mov    $0xa,%edx
 2ea:	b9 01 00 00 00       	mov    $0x1,%ecx
 2ef:	48 8b 00             	mov    (%rax),%rax
 2f2:	89 c6                	mov    %eax,%esi
 2f4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
 2f7:	e8 34 03 00 00       	callq  630 <printint64>
 2fc:	e9 86 00 00 00       	jmpq   387 <printf+0x1e7>
 301:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
 305:	8b 7d fc             	mov    -0x4(%rbp),%edi
 308:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 30b:	83 f9 28             	cmp    $0x28,%ecx
 30e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
 315:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 31b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
 321:	0f 87 25 00 00 00    	ja     34c <printf+0x1ac>
 327:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 32d:	48 63 c8             	movslq %eax,%rcx
 330:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
 337:	48 03 4a 10          	add    0x10(%rdx),%rcx
 33b:	83 c0 08             	add    $0x8,%eax
 33e:	89 02                	mov    %eax,(%rdx)
 340:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
 347:	e9 1d 00 00 00       	jmpq   369 <printf+0x1c9>
 34c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
 353:	48 8b 48 08          	mov    0x8(%rax),%rcx
 357:	48 89 ca             	mov    %rcx,%rdx
 35a:	48 83 c1 08          	add    $0x8,%rcx
 35e:	48 89 48 08          	mov    %rcx,0x8(%rax)
 362:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
 369:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
 370:	ba 0a 00 00 00       	mov    $0xa,%edx
 375:	b9 01 00 00 00       	mov    $0x1,%ecx
 37a:	8b 30                	mov    (%rax),%esi
 37c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
 382:	e8 a9 03 00 00       	callq  730 <printint>
      } else if(c == 'x' || c == 'p'){
 387:	e9 43 02 00 00       	jmpq   5cf <printf+0x42f>
 38c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
 390:	0f 84 0a 00 00 00    	je     3a0 <printf+0x200>
 396:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
 39a:	0f 85 1d 01 00 00    	jne    4bd <printf+0x31d>
        if (lflag == 1)
 3a0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
 3a4:	0f 85 8b 00 00 00    	jne    435 <printf+0x295>
 3aa:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
 3ae:	8b 7d fc             	mov    -0x4(%rbp),%edi
 3b1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 3b4:	83 f9 28             	cmp    $0x28,%ecx
 3b7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
 3be:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
 3c4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
 3ca:	0f 87 25 00 00 00    	ja     3f5 <printf+0x255>
 3d0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
 3d6:	48 63 c8             	movslq %eax,%rcx
 3d9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
 3e0:	48 03 4a 10          	add    0x10(%rdx),%rcx
 3e4:	83 c0 08             	add    $0x8,%eax
 3e7:	89 02                	mov    %eax,(%rdx)
 3e9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
 3f0:	e9 1d 00 00 00       	jmpq   412 <printf+0x272>
 3f5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
 3fc:	48 8b 48 08          	mov    0x8(%rax),%rcx
 400:	48 89 ca             	mov    %rcx,%rdx
 403:	48 83 c1 08          	add    $0x8,%rcx
 407:	48 89 48 08          	mov    %rcx,0x8(%rax)
 40b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
 412:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
 419:	ba 10 00 00 00       	mov    $0x10,%edx
 41e:	31 c9                	xor    %ecx,%ecx
 420:	48 8b 00             	mov    (%rax),%rax
 423:	89 c6                	mov    %eax,%esi
 425:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
 42b:	e8 00 02 00 00       	callq  630 <printint64>
 430:	e9 83 00 00 00       	jmpq   4b8 <printf+0x318>
 435:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
 439:	8b 7d fc             	mov    -0x4(%rbp),%edi
 43c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 43f:	83 f9 28             	cmp    $0x28,%ecx
 442:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
 449:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
 44f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
 455:	0f 87 25 00 00 00    	ja     480 <printf+0x2e0>
 45b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
 461:	48 63 c8             	movslq %eax,%rcx
 464:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
 46b:	48 03 4a 10          	add    0x10(%rdx),%rcx
 46f:	83 c0 08             	add    $0x8,%eax
 472:	89 02                	mov    %eax,(%rdx)
 474:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
 47b:	e9 1d 00 00 00       	jmpq   49d <printf+0x2fd>
 480:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
 487:	48 8b 48 08          	mov    0x8(%rax),%rcx
 48b:	48 89 ca             	mov    %rcx,%rdx
 48e:	48 83 c1 08          	add    $0x8,%rcx
 492:	48 89 48 08          	mov    %rcx,0x8(%rax)
 496:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
 49d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 4a4:	ba 10 00 00 00       	mov    $0x10,%edx
 4a9:	31 c9                	xor    %ecx,%ecx
 4ab:	8b 30                	mov    (%rax),%esi
 4ad:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
 4b3:	e8 78 02 00 00       	callq  730 <printint>
      } else if(c == 's'){
 4b8:	e9 0d 01 00 00       	jmpq   5ca <printf+0x42a>
 4bd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
 4c1:	0f 85 bc 00 00 00    	jne    583 <printf+0x3e3>
 4c7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
 4cb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
 4ce:	83 f9 28             	cmp    $0x28,%ecx
 4d1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
 4d8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
 4de:	0f 87 25 00 00 00    	ja     509 <printf+0x369>
 4e4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
 4ea:	48 63 c8             	movslq %eax,%rcx
 4ed:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
 4f4:	48 03 4a 10          	add    0x10(%rdx),%rcx
 4f8:	83 c0 08             	add    $0x8,%eax
 4fb:	89 02                	mov    %eax,(%rdx)
 4fd:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
 504:	e9 1d 00 00 00       	jmpq   526 <printf+0x386>
 509:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
 510:	48 8b 48 08          	mov    0x8(%rax),%rcx
 514:	48 89 ca             	mov    %rcx,%rdx
 517:	48 83 c1 08          	add    $0x8,%rcx
 51b:	48 89 48 08          	mov    %rcx,0x8(%rax)
 51f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
 526:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
 52d:	48 8b 00             	mov    (%rax),%rax
 530:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 534:	48 83 f8 00          	cmp    $0x0,%rax
 538:	0f 85 0e 00 00 00    	jne    54c <printf+0x3ac>
 53e:	48 b8 18 10 00 00 00 	movabs $0x1018,%rax
 545:	00 00 00 
          s = "(null)";
 548:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
 54c:	e9 00 00 00 00       	jmpq   551 <printf+0x3b1>
 551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 555:	80 38 00             	cmpb   $0x0,(%rax)
 558:	0f 84 20 00 00 00    	je     57e <printf+0x3de>
          putc(fd, *s);
 55e:	8b 7d fc             	mov    -0x4(%rbp),%edi
 561:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 565:	0f be 30             	movsbl (%rax),%esi
 568:	e8 93 00 00 00       	callq  600 <putc>
        for(; *s; s++)
 56d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 571:	48 83 c0 01          	add    $0x1,%rax
 575:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 579:	e9 d3 ff ff ff       	jmpq   551 <printf+0x3b1>
      } else if(c == '%'){
 57e:	e9 42 00 00 00       	jmpq   5c5 <printf+0x425>
 583:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
 587:	0f 85 15 00 00 00    	jne    5a2 <printf+0x402>
        putc(fd, c);
 58d:	8b 7d fc             	mov    -0x4(%rbp),%edi
 590:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 593:	88 c1                	mov    %al,%cl
 595:	0f be f1             	movsbl %cl,%esi
 598:	e8 63 00 00 00       	callq  600 <putc>
      } else {
 59d:	e9 1e 00 00 00       	jmpq   5c0 <printf+0x420>
 5a2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5a7:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5aa:	e8 51 00 00 00       	callq  600 <putc>
        putc(fd, c);
 5af:	8b 7d fc             	mov    -0x4(%rbp),%edi
 5b2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
 5b5:	40 88 f0             	mov    %sil,%al
 5b8:	0f be f0             	movsbl %al,%esi
 5bb:	e8 40 00 00 00       	callq  600 <putc>
 5c0:	e9 00 00 00 00       	jmpq   5c5 <printf+0x425>
 5c5:	e9 00 00 00 00       	jmpq   5ca <printf+0x42a>
 5ca:	e9 00 00 00 00       	jmpq   5cf <printf+0x42f>
 5cf:	e9 00 00 00 00       	jmpq   5d4 <printf+0x434>
      }
      state = 0;
 5d4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 5db:	e9 00 00 00 00       	jmpq   5e0 <printf+0x440>
    }
  }
 5e0:	e9 00 00 00 00       	jmpq   5e5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
 5e5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 5e8:	83 c0 01             	add    $0x1,%eax
 5eb:	89 45 e0             	mov    %eax,-0x20(%rbp)
 5ee:	e9 fe fb ff ff       	jmpq   1f1 <printf+0x51>

  va_end(valist);
}
 5f3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
 5fa:	5d                   	pop    %rbp
 5fb:	c3                   	retq   
 5fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000600 <putc>:
{
 600:	55                   	push   %rbp
 601:	48 89 e5             	mov    %rsp,%rbp
 604:	48 83 ec 10          	sub    $0x10,%rsp
 608:	40 88 f0             	mov    %sil,%al
 60b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
 60f:	ba 01 00 00 00       	mov    $0x1,%edx
 614:	89 7d fc             	mov    %edi,-0x4(%rbp)
 617:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
 61a:	8b 7d fc             	mov    -0x4(%rbp),%edi
 61d:	e8 d6 05 00 00       	callq  bf8 <write>
}
 622:	89 45 f4             	mov    %eax,-0xc(%rbp)
 625:	48 83 c4 10          	add    $0x10,%rsp
 629:	5d                   	pop    %rbp
 62a:	c3                   	retq   
 62b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000630 <printint64>:
{
 630:	55                   	push   %rbp
 631:	48 89 e5             	mov    %rsp,%rbp
 634:	48 83 ec 50          	sub    $0x50,%rsp
 638:	89 7d fc             	mov    %edi,-0x4(%rbp)
 63b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 63e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 641:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
 644:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 648:	0f 84 30 00 00 00    	je     67e <printint64+0x4e>
 64e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 652:	0f 9c c0             	setl   %al
 655:	88 c1                	mov    %al,%cl
 657:	80 e1 01             	and    $0x1,%cl
 65a:	0f b6 d1             	movzbl %cl,%edx
 65d:	89 55 f0             	mov    %edx,-0x10(%rbp)
 660:	a8 01                	test   $0x1,%al
 662:	0f 85 05 00 00 00    	jne    66d <printint64+0x3d>
 668:	e9 11 00 00 00       	jmpq   67e <printint64+0x4e>
 66d:	31 c0                	xor    %eax,%eax
    x = -xx;
 66f:	2b 45 f8             	sub    -0x8(%rbp),%eax
 672:	48 63 c8             	movslq %eax,%rcx
 675:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
 679:	e9 08 00 00 00       	jmpq   686 <printint64+0x56>
    x = xx;
 67e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
 682:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
 686:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
 68d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 691:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 695:	31 d2                	xor    %edx,%edx
 697:	48 f7 f1             	div    %rcx
 69a:	40 8a 34 15 40 12 00 	mov    0x1240(,%rdx,1),%sil
 6a1:	00 
 6a2:	8b 7d cc             	mov    -0x34(%rbp),%edi
 6a5:	41 89 f8             	mov    %edi,%r8d
 6a8:	41 83 c0 01          	add    $0x1,%r8d
 6ac:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
 6b0:	48 63 cf             	movslq %edi,%rcx
 6b3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
 6b8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
 6bc:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
 6c0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 6c4:	48 89 c8             	mov    %rcx,%rax
 6c7:	31 d2                	xor    %edx,%edx
 6c9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
 6cd:	48 f7 f1             	div    %rcx
 6d0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 6d4:	48 83 f8 00          	cmp    $0x0,%rax
 6d8:	0f 85 af ff ff ff    	jne    68d <printint64+0x5d>
  if(sgn)
 6de:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 6e2:	0f 84 13 00 00 00    	je     6fb <printint64+0xcb>
    buf[i++] = '-';
 6e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
 6eb:	89 c1                	mov    %eax,%ecx
 6ed:	83 c1 01             	add    $0x1,%ecx
 6f0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
 6f3:	48 63 d0             	movslq %eax,%rdx
 6f6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
 6fb:	e9 00 00 00 00       	jmpq   700 <printint64+0xd0>
 700:	8b 45 cc             	mov    -0x34(%rbp),%eax
 703:	83 c0 ff             	add    $0xffffffff,%eax
 706:	89 45 cc             	mov    %eax,-0x34(%rbp)
 709:	83 f8 00             	cmp    $0x0,%eax
 70c:	0f 8c 16 00 00 00    	jl     728 <printint64+0xf8>
    putc(fd, buf[i]);
 712:	8b 7d fc             	mov    -0x4(%rbp),%edi
 715:	48 63 45 cc          	movslq -0x34(%rbp),%rax
 719:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
 71e:	e8 dd fe ff ff       	callq  600 <putc>
  while(--i >= 0)
 723:	e9 d8 ff ff ff       	jmpq   700 <printint64+0xd0>
}
 728:	48 83 c4 50          	add    $0x50,%rsp
 72c:	5d                   	pop    %rbp
 72d:	c3                   	retq   
 72e:	66 90                	xchg   %ax,%ax

0000000000000730 <printint>:
{
 730:	55                   	push   %rbp
 731:	48 89 e5             	mov    %rsp,%rbp
 734:	48 83 ec 30          	sub    $0x30,%rsp
 738:	89 7d fc             	mov    %edi,-0x4(%rbp)
 73b:	89 75 f8             	mov    %esi,-0x8(%rbp)
 73e:	89 55 f4             	mov    %edx,-0xc(%rbp)
 741:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
 744:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
 74b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
 74f:	0f 84 1e 00 00 00    	je     773 <printint+0x43>
 755:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 759:	0f 8d 14 00 00 00    	jge    773 <printint+0x43>
 75f:	31 c0                	xor    %eax,%eax
    neg = 1;
 761:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
 768:	2b 45 f8             	sub    -0x8(%rbp),%eax
 76b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
 76e:	e9 06 00 00 00       	jmpq   779 <printint+0x49>
    x = xx;
 773:	8b 45 f8             	mov    -0x8(%rbp),%eax
 776:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
 779:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
 780:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 783:	31 d2                	xor    %edx,%edx
 785:	f7 75 f4             	divl   -0xc(%rbp)
 788:	89 d2                	mov    %edx,%edx
 78a:	89 d1                	mov    %edx,%ecx
 78c:	40 8a 34 0d 60 12 00 	mov    0x1260(,%rcx,1),%sil
 793:	00 
 794:	8b 55 dc             	mov    -0x24(%rbp),%edx
 797:	89 d7                	mov    %edx,%edi
 799:	83 c7 01             	add    $0x1,%edi
 79c:	89 7d dc             	mov    %edi,-0x24(%rbp)
 79f:	48 63 ca             	movslq %edx,%rcx
 7a2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
 7a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
 7aa:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
 7ad:	89 45 d0             	mov    %eax,-0x30(%rbp)
 7b0:	89 c8                	mov    %ecx,%eax
 7b2:	31 d2                	xor    %edx,%edx
 7b4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
 7b7:	f7 f1                	div    %ecx
 7b9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
 7bc:	83 f8 00             	cmp    $0x0,%eax
 7bf:	0f 85 bb ff ff ff    	jne    780 <printint+0x50>
  if(neg)
 7c5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 7c9:	0f 84 13 00 00 00    	je     7e2 <printint+0xb2>
    buf[i++] = '-';
 7cf:	8b 45 dc             	mov    -0x24(%rbp),%eax
 7d2:	89 c1                	mov    %eax,%ecx
 7d4:	83 c1 01             	add    $0x1,%ecx
 7d7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
 7da:	48 63 d0             	movslq %eax,%rdx
 7dd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
 7e2:	e9 00 00 00 00       	jmpq   7e7 <printint+0xb7>
 7e7:	8b 45 dc             	mov    -0x24(%rbp),%eax
 7ea:	83 c0 ff             	add    $0xffffffff,%eax
 7ed:	89 45 dc             	mov    %eax,-0x24(%rbp)
 7f0:	83 f8 00             	cmp    $0x0,%eax
 7f3:	0f 8c 16 00 00 00    	jl     80f <printint+0xdf>
    putc(fd, buf[i]);
 7f9:	8b 7d fc             	mov    -0x4(%rbp),%edi
 7fc:	48 63 45 dc          	movslq -0x24(%rbp),%rax
 800:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
 805:	e8 f6 fd ff ff       	callq  600 <putc>
  while(--i >= 0)
 80a:	e9 d8 ff ff ff       	jmpq   7e7 <printint+0xb7>
}
 80f:	48 83 c4 30          	add    $0x30,%rsp
 813:	5d                   	pop    %rbp
 814:	c3                   	retq   
 815:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 81c:	00 00 00 
 81f:	90                   	nop

0000000000000820 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
 820:	55                   	push   %rbp
 821:	48 89 e5             	mov    %rsp,%rbp
 824:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 828:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
 82c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 830:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
 834:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 838:	48 89 c1             	mov    %rax,%rcx
 83b:	48 83 c1 01          	add    $0x1,%rcx
 83f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
 843:	8a 10                	mov    (%rax),%dl
 845:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 849:	48 89 c1             	mov    %rax,%rcx
 84c:	48 83 c1 01          	add    $0x1,%rcx
 850:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
 854:	88 10                	mov    %dl,(%rax)
 856:	0f be f2             	movsbl %dl,%esi
 859:	83 fe 00             	cmp    $0x0,%esi
 85c:	0f 84 05 00 00 00    	je     867 <strcpy+0x47>
 862:	e9 cd ff ff ff       	jmpq   834 <strcpy+0x14>
    ;
  return os;
 867:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 86b:	5d                   	pop    %rbp
 86c:	c3                   	retq   
 86d:	0f 1f 00             	nopl   (%rax)

0000000000000870 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
 870:	55                   	push   %rbp
 871:	48 89 e5             	mov    %rsp,%rbp
 874:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 878:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 87c:	31 c0                	xor    %eax,%eax
 87e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
 880:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 884:	0f be 02             	movsbl (%rdx),%eax
 887:	83 f8 00             	cmp    $0x0,%eax
 88a:	88 4d ef             	mov    %cl,-0x11(%rbp)
 88d:	0f 84 18 00 00 00    	je     8ab <strcmp+0x3b>
 893:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 897:	0f be 08             	movsbl (%rax),%ecx
 89a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 89e:	0f be 10             	movsbl (%rax),%edx
 8a1:	39 d1                	cmp    %edx,%ecx
 8a3:	40 0f 94 c6          	sete   %sil
 8a7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
 8ab:	8a 45 ef             	mov    -0x11(%rbp),%al
 8ae:	a8 01                	test   $0x1,%al
 8b0:	0f 85 05 00 00 00    	jne    8bb <strcmp+0x4b>
 8b6:	e9 1d 00 00 00       	jmpq   8d8 <strcmp+0x68>
    p++, q++;
 8bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8bf:	48 83 c0 01          	add    $0x1,%rax
 8c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 8c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8cb:	48 83 c0 01          	add    $0x1,%rax
 8cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
 8d3:	e9 a4 ff ff ff       	jmpq   87c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 8d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 8dc:	0f b6 08             	movzbl (%rax),%ecx
 8df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 8e3:	0f b6 10             	movzbl (%rax),%edx
 8e6:	29 d1                	sub    %edx,%ecx
 8e8:	89 c8                	mov    %ecx,%eax
 8ea:	5d                   	pop    %rbp
 8eb:	c3                   	retq   
 8ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008f0 <strlen>:
}

uint
strlen(char *s)
{
 8f0:	55                   	push   %rbp
 8f1:	48 89 e5             	mov    %rsp,%rbp
 8f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
 8f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 8ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 903:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
 907:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
 90b:	0f 84 13 00 00 00    	je     924 <strlen+0x34>
 911:	e9 00 00 00 00       	jmpq   916 <strlen+0x26>
 916:	8b 45 f4             	mov    -0xc(%rbp),%eax
 919:	83 c0 01             	add    $0x1,%eax
 91c:	89 45 f4             	mov    %eax,-0xc(%rbp)
 91f:	e9 db ff ff ff       	jmpq   8ff <strlen+0xf>
    ;
  return n;
 924:	8b 45 f4             	mov    -0xc(%rbp),%eax
 927:	5d                   	pop    %rbp
 928:	c3                   	retq   
 929:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000930 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
 930:	55                   	push   %rbp
 931:	48 89 e5             	mov    %rsp,%rbp
 934:	48 83 ec 10          	sub    $0x10,%rsp
 938:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 93c:	89 75 f4             	mov    %esi,-0xc(%rbp)
 93f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
 942:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 946:	8b 75 f4             	mov    -0xc(%rbp),%esi
 949:	8b 55 f0             	mov    -0x10(%rbp),%edx
 94c:	e8 0f 00 00 00       	callq  960 <stosb>
  return dst;
 951:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 955:	48 83 c4 10          	add    $0x10,%rsp
 959:	5d                   	pop    %rbp
 95a:	c3                   	retq   
 95b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000960 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 960:	55                   	push   %rbp
 961:	48 89 e5             	mov    %rsp,%rbp
 964:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 968:	89 75 f4             	mov    %esi,-0xc(%rbp)
 96b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
 96e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 972:	8b 55 f0             	mov    -0x10(%rbp),%edx
 975:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
 978:	89 d1                	mov    %edx,%ecx
 97a:	fc                   	cld    
 97b:	f3 aa                	rep stos %al,%es:(%rdi)
 97d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 981:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
 984:	5d                   	pop    %rbp
 985:	c3                   	retq   
 986:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 98d:	00 00 00 

0000000000000990 <strchr>:
}

char*
strchr(const char *s, char c)
{
 990:	55                   	push   %rbp
 991:	48 89 e5             	mov    %rsp,%rbp
 994:	40 88 f0             	mov    %sil,%al
 997:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 99b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
 99e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 9a2:	80 38 00             	cmpb   $0x0,(%rax)
 9a5:	0f 84 36 00 00 00    	je     9e1 <strchr+0x51>
    if(*s == c)
 9ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 9af:	0f be 08             	movsbl (%rax),%ecx
 9b2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
 9b6:	39 d1                	cmp    %edx,%ecx
 9b8:	0f 85 0d 00 00 00    	jne    9cb <strchr+0x3b>
      return (char*)s;
 9be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 9c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 9c6:	e9 1e 00 00 00       	jmpq   9e9 <strchr+0x59>
    if(*s == c)
 9cb:	e9 00 00 00 00       	jmpq   9d0 <strchr+0x40>
  for(; *s; s++)
 9d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 9d4:	48 83 c0 01          	add    $0x1,%rax
 9d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 9dc:	e9 bd ff ff ff       	jmpq   99e <strchr+0xe>
  return 0;
 9e1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 9e8:	00 
}
 9e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 9ed:	5d                   	pop    %rbp
 9ee:	c3                   	retq   
 9ef:	90                   	nop

00000000000009f0 <gets>:

char*
gets(char *buf, int max)
{
 9f0:	55                   	push   %rbp
 9f1:	48 89 e5             	mov    %rsp,%rbp
 9f4:	48 83 ec 20          	sub    $0x20,%rsp
 9f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 9fc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 9ff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 a06:	8b 45 f0             	mov    -0x10(%rbp),%eax
 a09:	83 c0 01             	add    $0x1,%eax
 a0c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 a0f:	0f 8d 5e 00 00 00    	jge    a73 <gets+0x83>
 a15:	31 ff                	xor    %edi,%edi
 a17:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
 a1b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
 a20:	e8 cb 01 00 00       	callq  bf0 <read>
 a25:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
 a28:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
 a2c:	0f 8d 05 00 00 00    	jge    a37 <gets+0x47>
      break;
 a32:	e9 3c 00 00 00       	jmpq   a73 <gets+0x83>
    buf[i++] = c;
 a37:	8a 45 eb             	mov    -0x15(%rbp),%al
 a3a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a3e:	8b 55 f0             	mov    -0x10(%rbp),%edx
 a41:	89 d6                	mov    %edx,%esi
 a43:	83 c6 01             	add    $0x1,%esi
 a46:	89 75 f0             	mov    %esi,-0x10(%rbp)
 a49:	48 63 fa             	movslq %edx,%rdi
 a4c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
 a4f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
 a53:	83 fa 0a             	cmp    $0xa,%edx
 a56:	0f 84 0d 00 00 00    	je     a69 <gets+0x79>
 a5c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
 a60:	83 f8 0d             	cmp    $0xd,%eax
 a63:	0f 85 05 00 00 00    	jne    a6e <gets+0x7e>
      break;
 a69:	e9 05 00 00 00       	jmpq   a73 <gets+0x83>
  for(i=0; i+1 < max; ){
 a6e:	e9 93 ff ff ff       	jmpq   a06 <gets+0x16>
  }
  buf[i] = '\0';
 a73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a77:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
 a7b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
 a7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a83:	48 83 c4 20          	add    $0x20,%rsp
 a87:	5d                   	pop    %rbp
 a88:	c3                   	retq   
 a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a90 <stat>:
}

int
stat(char *n, struct stat *st)
{
 a90:	55                   	push   %rbp
 a91:	48 89 e5             	mov    %rsp,%rbp
 a94:	48 83 ec 30          	sub    $0x30,%rsp
 a98:	31 c0                	xor    %eax,%eax
 a9a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
 a9e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 aa2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
 aa6:	89 c6                	mov    %eax,%esi
 aa8:	e8 6b 01 00 00       	callq  c18 <open>
 aad:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
 ab0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
 ab4:	0f 8d 0c 00 00 00    	jge    ac6 <stat+0x36>
    return -1;
 aba:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
 ac1:	e9 20 00 00 00       	jmpq   ae6 <stat+0x56>
  r = fstat(fd, st);
 ac6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 ac9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
 acd:	e8 5e 01 00 00       	callq  c30 <fstat>
 ad2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
 ad5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
 ad8:	e8 23 01 00 00       	callq  c00 <close>
  return r;
 add:	8b 7d e0             	mov    -0x20(%rbp),%edi
 ae0:	89 7d fc             	mov    %edi,-0x4(%rbp)
 ae3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
 ae6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 ae9:	48 83 c4 30          	add    $0x30,%rsp
 aed:	5d                   	pop    %rbp
 aee:	c3                   	retq   
 aef:	90                   	nop

0000000000000af0 <atoi>:

int
atoi(const char *s)
{
 af0:	55                   	push   %rbp
 af1:	48 89 e5             	mov    %rsp,%rbp
 af4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
 af8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 aff:	31 c0                	xor    %eax,%eax
 b01:	88 c1                	mov    %al,%cl
 b03:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
 b08:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 b0c:	0f be 32             	movsbl (%rdx),%esi
 b0f:	39 f0                	cmp    %esi,%eax
 b11:	88 4d f3             	mov    %cl,-0xd(%rbp)
 b14:	0f 8f 10 00 00 00    	jg     b2a <atoi+0x3a>
 b1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 b1e:	0f be 08             	movsbl (%rax),%ecx
 b21:	83 f9 39             	cmp    $0x39,%ecx
 b24:	0f 9e c2             	setle  %dl
 b27:	88 55 f3             	mov    %dl,-0xd(%rbp)
 b2a:	8a 45 f3             	mov    -0xd(%rbp),%al
 b2d:	a8 01                	test   $0x1,%al
 b2f:	0f 85 05 00 00 00    	jne    b3a <atoi+0x4a>
 b35:	e9 23 00 00 00       	jmpq   b5d <atoi+0x6d>
    n = n*10 + *s++ - '0';
 b3a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
 b3e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 b42:	48 89 ca             	mov    %rcx,%rdx
 b45:	48 83 c2 01          	add    $0x1,%rdx
 b49:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
 b4d:	0f be 31             	movsbl (%rcx),%esi
 b50:	01 f0                	add    %esi,%eax
 b52:	83 e8 30             	sub    $0x30,%eax
 b55:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
 b58:	e9 a2 ff ff ff       	jmpq   aff <atoi+0xf>
  return n;
 b5d:	8b 45 f4             	mov    -0xc(%rbp),%eax
 b60:	5d                   	pop    %rbp
 b61:	c3                   	retq   
 b62:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 b69:	1f 84 00 00 00 00 00 

0000000000000b70 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 b70:	55                   	push   %rbp
 b71:	48 89 e5             	mov    %rsp,%rbp
 b74:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 b78:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 b7c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
 b7f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 b83:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
 b87:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
 b8b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
 b8f:	8b 45 ec             	mov    -0x14(%rbp),%eax
 b92:	89 c1                	mov    %eax,%ecx
 b94:	83 c1 ff             	add    $0xffffffff,%ecx
 b97:	89 4d ec             	mov    %ecx,-0x14(%rbp)
 b9a:	83 f8 00             	cmp    $0x0,%eax
 b9d:	0f 8e 27 00 00 00    	jle    bca <memmove+0x5a>
    *dst++ = *src++;
 ba3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 ba7:	48 89 c1             	mov    %rax,%rcx
 baa:	48 83 c1 01          	add    $0x1,%rcx
 bae:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
 bb2:	8a 10                	mov    (%rax),%dl
 bb4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 bb8:	48 89 c1             	mov    %rax,%rcx
 bbb:	48 83 c1 01          	add    $0x1,%rcx
 bbf:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 bc3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
 bc5:	e9 c5 ff ff ff       	jmpq   b8f <memmove+0x1f>
  return vdst;
 bca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 bce:	5d                   	pop    %rbp
 bcf:	c3                   	retq   

0000000000000bd0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
 bd0:	b8 01 00 00 00       	mov    $0x1,%eax
 bd5:	cd 40                	int    $0x40
 bd7:	c3                   	retq   

0000000000000bd8 <exit>:
SYSCALL(exit)
 bd8:	b8 02 00 00 00       	mov    $0x2,%eax
 bdd:	cd 40                	int    $0x40
 bdf:	c3                   	retq   

0000000000000be0 <wait>:
SYSCALL(wait)
 be0:	b8 03 00 00 00       	mov    $0x3,%eax
 be5:	cd 40                	int    $0x40
 be7:	c3                   	retq   

0000000000000be8 <pipe>:
SYSCALL(pipe)
 be8:	b8 04 00 00 00       	mov    $0x4,%eax
 bed:	cd 40                	int    $0x40
 bef:	c3                   	retq   

0000000000000bf0 <read>:
SYSCALL(read)
 bf0:	b8 05 00 00 00       	mov    $0x5,%eax
 bf5:	cd 40                	int    $0x40
 bf7:	c3                   	retq   

0000000000000bf8 <write>:
SYSCALL(write)
 bf8:	b8 10 00 00 00       	mov    $0x10,%eax
 bfd:	cd 40                	int    $0x40
 bff:	c3                   	retq   

0000000000000c00 <close>:
SYSCALL(close)
 c00:	b8 15 00 00 00       	mov    $0x15,%eax
 c05:	cd 40                	int    $0x40
 c07:	c3                   	retq   

0000000000000c08 <kill>:
SYSCALL(kill)
 c08:	b8 06 00 00 00       	mov    $0x6,%eax
 c0d:	cd 40                	int    $0x40
 c0f:	c3                   	retq   

0000000000000c10 <exec>:
SYSCALL(exec)
 c10:	b8 07 00 00 00       	mov    $0x7,%eax
 c15:	cd 40                	int    $0x40
 c17:	c3                   	retq   

0000000000000c18 <open>:
SYSCALL(open)
 c18:	b8 0f 00 00 00       	mov    $0xf,%eax
 c1d:	cd 40                	int    $0x40
 c1f:	c3                   	retq   

0000000000000c20 <mknod>:
SYSCALL(mknod)
 c20:	b8 11 00 00 00       	mov    $0x11,%eax
 c25:	cd 40                	int    $0x40
 c27:	c3                   	retq   

0000000000000c28 <unlink>:
SYSCALL(unlink)
 c28:	b8 12 00 00 00       	mov    $0x12,%eax
 c2d:	cd 40                	int    $0x40
 c2f:	c3                   	retq   

0000000000000c30 <fstat>:
SYSCALL(fstat)
 c30:	b8 08 00 00 00       	mov    $0x8,%eax
 c35:	cd 40                	int    $0x40
 c37:	c3                   	retq   

0000000000000c38 <link>:
SYSCALL(link)
 c38:	b8 13 00 00 00       	mov    $0x13,%eax
 c3d:	cd 40                	int    $0x40
 c3f:	c3                   	retq   

0000000000000c40 <mkdir>:
SYSCALL(mkdir)
 c40:	b8 14 00 00 00       	mov    $0x14,%eax
 c45:	cd 40                	int    $0x40
 c47:	c3                   	retq   

0000000000000c48 <chdir>:
SYSCALL(chdir)
 c48:	b8 09 00 00 00       	mov    $0x9,%eax
 c4d:	cd 40                	int    $0x40
 c4f:	c3                   	retq   

0000000000000c50 <dup>:
SYSCALL(dup)
 c50:	b8 0a 00 00 00       	mov    $0xa,%eax
 c55:	cd 40                	int    $0x40
 c57:	c3                   	retq   

0000000000000c58 <getpid>:
SYSCALL(getpid)
 c58:	b8 0b 00 00 00       	mov    $0xb,%eax
 c5d:	cd 40                	int    $0x40
 c5f:	c3                   	retq   

0000000000000c60 <sbrk>:
SYSCALL(sbrk)
 c60:	b8 0c 00 00 00       	mov    $0xc,%eax
 c65:	cd 40                	int    $0x40
 c67:	c3                   	retq   

0000000000000c68 <sleep>:
SYSCALL(sleep)
 c68:	b8 0d 00 00 00       	mov    $0xd,%eax
 c6d:	cd 40                	int    $0x40
 c6f:	c3                   	retq   

0000000000000c70 <uptime>:
SYSCALL(uptime)
 c70:	b8 0e 00 00 00       	mov    $0xe,%eax
 c75:	cd 40                	int    $0x40
 c77:	c3                   	retq   

0000000000000c78 <sysinfo>:
SYSCALL(sysinfo)
 c78:	b8 16 00 00 00       	mov    $0x16,%eax
 c7d:	cd 40                	int    $0x40
 c7f:	c3                   	retq   

0000000000000c80 <mmap>:
SYSCALL(mmap)
 c80:	b8 17 00 00 00       	mov    $0x17,%eax
 c85:	cd 40                	int    $0x40
 c87:	c3                   	retq   

0000000000000c88 <munmap>:
SYSCALL(munmap)
 c88:	b8 18 00 00 00       	mov    $0x18,%eax
 c8d:	cd 40                	int    $0x40
 c8f:	c3                   	retq   

0000000000000c90 <crashn>:
SYSCALL(crashn)
 c90:	b8 19 00 00 00       	mov    $0x19,%eax
 c95:	cd 40                	int    $0x40
 c97:	c3                   	retq   
 c98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 c9f:	00 

0000000000000ca0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ca0:	55                   	push   %rbp
 ca1:	48 89 e5             	mov    %rsp,%rbp
 ca4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ca8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 cac:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
 cb0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cb4:	48 8b 3c 25 78 12 00 	mov    0x1278,%rdi
 cbb:	00 
 cbc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 cc0:	31 c0                	xor    %eax,%eax
 cc2:	88 c1                	mov    %al,%cl
 cc4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 cc8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
 ccc:	88 4d e7             	mov    %cl,-0x19(%rbp)
 ccf:	0f 86 11 00 00 00    	jbe    ce6 <free+0x46>
 cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 cd9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 cdd:	48 3b 01             	cmp    (%rcx),%rax
 ce0:	0f 92 c2             	setb   %dl
 ce3:	88 55 e7             	mov    %dl,-0x19(%rbp)
 ce6:	8a 45 e7             	mov    -0x19(%rbp),%al
 ce9:	34 ff                	xor    $0xff,%al
 ceb:	a8 01                	test   $0x1,%al
 ced:	0f 85 05 00 00 00    	jne    cf8 <free+0x58>
 cf3:	e9 4a 00 00 00       	jmpq   d42 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cf8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 cfc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d00:	48 3b 01             	cmp    (%rcx),%rax
 d03:	0f 82 24 00 00 00    	jb     d2d <free+0x8d>
 d09:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d0d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 d11:	0f 87 11 00 00 00    	ja     d28 <free+0x88>
 d17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d1b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d1f:	48 3b 01             	cmp    (%rcx),%rax
 d22:	0f 83 05 00 00 00    	jae    d2d <free+0x8d>
      break;
 d28:	e9 15 00 00 00       	jmpq   d42 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d2d:	e9 00 00 00 00       	jmpq   d32 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d36:	48 8b 00             	mov    (%rax),%rax
 d39:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 d3d:	e9 7e ff ff ff       	jmpq   cc0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 d42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d46:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 d4a:	8b 51 08             	mov    0x8(%rcx),%edx
 d4d:	89 d1                	mov    %edx,%ecx
 d4f:	48 c1 e1 04          	shl    $0x4,%rcx
 d53:	48 01 c8             	add    %rcx,%rax
 d56:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 d5a:	48 3b 01             	cmp    (%rcx),%rax
 d5d:	0f 85 2a 00 00 00    	jne    d8d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
 d63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d67:	48 8b 00             	mov    (%rax),%rax
 d6a:	8b 48 08             	mov    0x8(%rax),%ecx
 d6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 d71:	03 48 08             	add    0x8(%rax),%ecx
 d74:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d7b:	48 8b 00             	mov    (%rax),%rax
 d7e:	48 8b 00             	mov    (%rax),%rax
 d81:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 d85:	48 89 02             	mov    %rax,(%rdx)
  } else
 d88:	e9 0e 00 00 00       	jmpq   d9b <free+0xfb>
    bp->s.ptr = p->s.ptr;
 d8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d91:	48 8b 00             	mov    (%rax),%rax
 d94:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 d98:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
 d9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 d9f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 da3:	8b 51 08             	mov    0x8(%rcx),%edx
 da6:	89 d1                	mov    %edx,%ecx
 da8:	48 c1 e1 04          	shl    $0x4,%rcx
 dac:	48 01 c8             	add    %rcx,%rax
 daf:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 db3:	0f 85 24 00 00 00    	jne    ddd <free+0x13d>
    p->s.size += bp->s.size;
 db9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 dbd:	8b 48 08             	mov    0x8(%rax),%ecx
 dc0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dc4:	03 48 08             	add    0x8(%rax),%ecx
 dc7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
 dca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 dce:	48 8b 00             	mov    (%rax),%rax
 dd1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 dd5:	48 89 02             	mov    %rax,(%rdx)
  } else
 dd8:	e9 0b 00 00 00       	jmpq   de8 <free+0x148>
    p->s.ptr = bp;
 ddd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 de1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 de5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
 de8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 dec:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 df3:	00 
}
 df4:	5d                   	pop    %rbp
 df5:	c3                   	retq   
 df6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 dfd:	00 00 00 

0000000000000e00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 e00:	55                   	push   %rbp
 e01:	48 89 e5             	mov    %rsp,%rbp
 e04:	48 83 ec 30          	sub    $0x30,%rsp
 e08:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e0b:	8b 7d f4             	mov    -0xc(%rbp),%edi
 e0e:	89 f8                	mov    %edi,%eax
 e10:	48 83 c0 10          	add    $0x10,%rax
 e14:	48 83 e8 01          	sub    $0x1,%rax
 e18:	48 c1 e8 04          	shr    $0x4,%rax
 e1c:	48 83 c0 01          	add    $0x1,%rax
 e20:	89 c7                	mov    %eax,%edi
 e22:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
 e25:	48 8b 04 25 78 12 00 	mov    0x1278,%rax
 e2c:	00 
 e2d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e31:	48 83 f8 00          	cmp    $0x0,%rax
 e35:	0f 85 29 00 00 00    	jne    e64 <malloc+0x64>
 e3b:	48 b8 80 12 00 00 00 	movabs $0x1280,%rax
 e42:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 e45:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 e49:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 e50:	00 
 e51:	48 89 04 25 80 12 00 	mov    %rax,0x1280
 e58:	00 
    base.s.size = 0;
 e59:	c7 04 25 88 12 00 00 	movl   $0x0,0x1288
 e60:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 e68:	48 8b 00             	mov    (%rax),%rax
 e6b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
 e6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e73:	8b 48 08             	mov    0x8(%rax),%ecx
 e76:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e79:	0f 82 73 00 00 00    	jb     ef2 <malloc+0xf2>
      if(p->s.size == nunits)
 e7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e83:	8b 48 08             	mov    0x8(%rax),%ecx
 e86:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
 e89:	0f 85 13 00 00 00    	jne    ea2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
 e8f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 e93:	48 8b 00             	mov    (%rax),%rax
 e96:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
 e9a:	48 89 01             	mov    %rax,(%rcx)
 e9d:	e9 33 00 00 00       	jmpq   ed5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
 ea2:	8b 45 dc             	mov    -0x24(%rbp),%eax
 ea5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 ea9:	8b 51 08             	mov    0x8(%rcx),%edx
 eac:	29 c2                	sub    %eax,%edx
 eae:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
 eb1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 eb5:	8b 41 08             	mov    0x8(%rcx),%eax
 eb8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 ebc:	89 c0                	mov    %eax,%eax
 ebe:	89 c6                	mov    %eax,%esi
 ec0:	48 c1 e6 04          	shl    $0x4,%rsi
 ec4:	48 01 f1             	add    %rsi,%rcx
 ec7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
 ecb:	8b 45 dc             	mov    -0x24(%rbp),%eax
 ece:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 ed2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
 ed5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 ed9:	48 89 04 25 78 12 00 	mov    %rax,0x1278
 ee0:	00 
      return (void*)(p + 1);
 ee1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ee5:	48 83 c0 10          	add    $0x10,%rax
 ee9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 eed:	e9 57 00 00 00       	jmpq   f49 <malloc+0x149>
    }
    if(p == freep)
 ef2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 ef6:	48 3b 04 25 78 12 00 	cmp    0x1278,%rax
 efd:	00 
 efe:	0f 85 28 00 00 00    	jne    f2c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
 f04:	8b 7d dc             	mov    -0x24(%rbp),%edi
 f07:	e8 54 00 00 00       	callq  f60 <morecore>
 f0c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 f10:	48 83 f8 00          	cmp    $0x0,%rax
 f14:	0f 85 0d 00 00 00    	jne    f27 <malloc+0x127>
        return 0;
 f1a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 f21:	00 
 f22:	e9 22 00 00 00       	jmpq   f49 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
 f27:	e9 00 00 00 00       	jmpq   f2c <malloc+0x12c>
  }
 f2c:	e9 00 00 00 00       	jmpq   f31 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 f35:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 f39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 f3d:	48 8b 00             	mov    (%rax),%rax
 f40:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 f44:	e9 26 ff ff ff       	jmpq   e6f <malloc+0x6f>
 f49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 f4d:	48 83 c4 30          	add    $0x30,%rsp
 f51:	5d                   	pop    %rbp
 f52:	c3                   	retq   
 f53:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 f5a:	84 00 00 00 00 00 

0000000000000f60 <morecore>:
{
 f60:	55                   	push   %rbp
 f61:	48 89 e5             	mov    %rsp,%rbp
 f64:	48 83 ec 20          	sub    $0x20,%rsp
 f68:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
 f6b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
 f72:	0f 83 07 00 00 00    	jae    f7f <morecore+0x1f>
    nu = 4096;
 f78:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
 f7f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 f82:	89 c1                	mov    %eax,%ecx
 f84:	48 c1 e1 04          	shl    $0x4,%rcx
 f88:	89 c8                	mov    %ecx,%eax
 f8a:	89 c7                	mov    %eax,%edi
 f8c:	e8 cf fc ff ff       	callq  c60 <sbrk>
 f91:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 f98:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
 f9c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
 fa0:	0f 85 0d 00 00 00    	jne    fb3 <morecore+0x53>
    return 0;
 fa6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 fad:	00 
 fae:	e9 2e 00 00 00       	jmpq   fe1 <morecore+0x81>
  hp = (Header*)p;
 fb3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 fb7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
 fbb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
 fbe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 fc2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
 fc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 fc9:	48 83 c0 10          	add    $0x10,%rax
 fcd:	48 89 c7             	mov    %rax,%rdi
 fd0:	e8 cb fc ff ff       	callq  ca0 <free>
  return freep;
 fd5:	48 8b 04 25 78 12 00 	mov    0x1278,%rax
 fdc:	00 
 fdd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
 fe1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 fe5:	48 83 c4 20          	add    $0x20,%rsp
 fe9:	5d                   	pop    %rbp
 fea:	c3                   	retq   
