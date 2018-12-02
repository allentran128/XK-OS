
out/user/_wc:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 30          	sub    $0x30,%rsp
       8:	89 7d fc             	mov    %edi,-0x4(%rbp)
       b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
       f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
      16:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
      1d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  inword = 0;
      24:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      2b:	48 be 40 13 00 00 00 	movabs $0x1340,%rsi
      32:	00 00 00 
      35:	ba 00 02 00 00       	mov    $0x200,%edx
  while((n = read(fd, buf, sizeof(buf))) > 0){
      3a:	8b 7d fc             	mov    -0x4(%rbp),%edi
      3d:	e8 2e 0c 00 00       	callq  c70 <read>
      42:	89 45 e8             	mov    %eax,-0x18(%rbp)
      45:	83 f8 00             	cmp    $0x0,%eax
      48:	0f 8e a2 00 00 00    	jle    f0 <wc+0xf0>
    for(i=0; i<n; i++){
      4e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
      55:	8b 45 ec             	mov    -0x14(%rbp),%eax
      58:	3b 45 e8             	cmp    -0x18(%rbp),%eax
      5b:	0f 8d 8a 00 00 00    	jge    eb <wc+0xeb>
      c++;
      61:	8b 45 dc             	mov    -0x24(%rbp),%eax
      64:	83 c0 01             	add    $0x1,%eax
      67:	89 45 dc             	mov    %eax,-0x24(%rbp)
      if(buf[i] == '\n')
      6a:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
      6e:	0f be 04 0d 40 13 00 	movsbl 0x1340(,%rcx,1),%eax
      75:	00 
      76:	83 f8 0a             	cmp    $0xa,%eax
      79:	0f 85 09 00 00 00    	jne    88 <wc+0x88>
        l++;
      7f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
      82:	83 c0 01             	add    $0x1,%eax
      85:	89 45 e4             	mov    %eax,-0x1c(%rbp)
      88:	48 bf 6b 10 00 00 00 	movabs $0x106b,%rdi
      8f:	00 00 00 
      if(strchr(" \r\t\n\v", buf[i]))
      92:	48 63 45 ec          	movslq -0x14(%rbp),%rax
      96:	0f be 34 05 40 13 00 	movsbl 0x1340(,%rax,1),%esi
      9d:	00 
      9e:	e8 6d 09 00 00       	callq  a10 <strchr>
      a3:	48 83 f8 00          	cmp    $0x0,%rax
      a7:	0f 84 0c 00 00 00    	je     b9 <wc+0xb9>
        inword = 0;
      ad:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      b4:	e9 1f 00 00 00       	jmpq   d8 <wc+0xd8>
      else if(!inword){
      b9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
      bd:	0f 85 10 00 00 00    	jne    d3 <wc+0xd3>
        w++;
      c3:	8b 45 e0             	mov    -0x20(%rbp),%eax
      c6:	83 c0 01             	add    $0x1,%eax
      c9:	89 45 e0             	mov    %eax,-0x20(%rbp)
        inword = 1;
      cc:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
      d3:	e9 00 00 00 00       	jmpq   d8 <wc+0xd8>
      }
    }
      d8:	e9 00 00 00 00       	jmpq   dd <wc+0xdd>
    for(i=0; i<n; i++){
      dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
      e0:	83 c0 01             	add    $0x1,%eax
      e3:	89 45 ec             	mov    %eax,-0x14(%rbp)
      e6:	e9 6a ff ff ff       	jmpq   55 <wc+0x55>
  while((n = read(fd, buf, sizeof(buf))) > 0){
      eb:	e9 3b ff ff ff       	jmpq   2b <wc+0x2b>
  }
  if(n < 0){
      f0:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
      f4:	0f 8d 1e 00 00 00    	jge    118 <wc+0x118>
      fa:	bf 01 00 00 00       	mov    $0x1,%edi
      ff:	48 be 71 10 00 00 00 	movabs $0x1071,%rsi
     106:	00 00 00 
    printf(1, "wc: read error\n");
     109:	b0 00                	mov    $0x0,%al
     10b:	e8 10 01 00 00       	callq  220 <printf>
    exit();
     110:	e8 43 0b 00 00       	callq  c58 <exit>
     115:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     118:	bf 01 00 00 00       	mov    $0x1,%edi
     11d:	48 be 81 10 00 00 00 	movabs $0x1081,%rsi
     124:	00 00 00 
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
     127:	8b 55 e4             	mov    -0x1c(%rbp),%edx
     12a:	8b 4d e0             	mov    -0x20(%rbp),%ecx
     12d:	44 8b 45 dc          	mov    -0x24(%rbp),%r8d
     131:	4c 8b 4d f0          	mov    -0x10(%rbp),%r9
     135:	b0 00                	mov    $0x0,%al
     137:	e8 e4 00 00 00       	callq  220 <printf>
}
     13c:	48 83 c4 30          	add    $0x30,%rsp
     140:	5d                   	pop    %rbp
     141:	c3                   	retq   
     142:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     149:	1f 84 00 00 00 00 00 

0000000000000150 <main>:

int
main(int argc, char *argv[])
{
     150:	55                   	push   %rbp
     151:	48 89 e5             	mov    %rsp,%rbp
     154:	48 83 ec 30          	sub    $0x30,%rsp
     158:	89 7d f8             	mov    %edi,-0x8(%rbp)
     15b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int fd, i;

  if(argc <= 1){
     15f:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
     163:	0f 8f 19 00 00 00    	jg     182 <main+0x32>
     169:	31 ff                	xor    %edi,%edi
     16b:	48 be 80 10 00 00 00 	movabs $0x1080,%rsi
     172:	00 00 00 
    wc(0, "");
     175:	e8 86 fe ff ff       	callq  0 <wc>
    exit();
     17a:	e8 d9 0a 00 00       	callq  c58 <exit>
     17f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  }

  for(i = 1; i < argc; i++){
     182:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
     189:	8b 45 e8             	mov    -0x18(%rbp),%eax
     18c:	3b 45 f8             	cmp    -0x8(%rbp),%eax
     18f:	0f 8d 76 00 00 00    	jge    20b <main+0xbb>
     195:	31 f6                	xor    %esi,%esi
    if((fd = open(argv[i], 0)) < 0){
     197:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     19b:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
     19f:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
     1a3:	e8 f0 0a 00 00       	callq  c98 <open>
     1a8:	89 45 ec             	mov    %eax,-0x14(%rbp)
     1ab:	83 f8 00             	cmp    $0x0,%eax
     1ae:	0f 8d 2a 00 00 00    	jge    1de <main+0x8e>
     1b4:	bf 01 00 00 00       	mov    $0x1,%edi
     1b9:	48 be 8e 10 00 00 00 	movabs $0x108e,%rsi
     1c0:	00 00 00 
      printf(1, "wc: cannot open %s\n", argv[i]);
     1c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     1c7:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
     1cb:	48 8b 14 c8          	mov    (%rax,%rcx,8),%rdx
     1cf:	b0 00                	mov    $0x0,%al
     1d1:	e8 4a 00 00 00       	callq  220 <printf>
      exit();
     1d6:	e8 7d 0a 00 00       	callq  c58 <exit>
     1db:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    wc(fd, argv[i]);
     1de:	8b 7d ec             	mov    -0x14(%rbp),%edi
     1e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     1e5:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
     1e9:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
     1ed:	e8 0e fe ff ff       	callq  0 <wc>
    close(fd);
     1f2:	8b 7d ec             	mov    -0x14(%rbp),%edi
     1f5:	e8 86 0a 00 00       	callq  c80 <close>
     1fa:	89 45 dc             	mov    %eax,-0x24(%rbp)
  for(i = 1; i < argc; i++){
     1fd:	8b 45 e8             	mov    -0x18(%rbp),%eax
     200:	83 c0 01             	add    $0x1,%eax
     203:	89 45 e8             	mov    %eax,-0x18(%rbp)
     206:	e9 7e ff ff ff       	jmpq   189 <main+0x39>
  }
  exit();
     20b:	e8 48 0a 00 00       	callq  c58 <exit>
     210:	89 45 d8             	mov    %eax,-0x28(%rbp)
     213:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     21a:	00 00 00 
     21d:	0f 1f 00             	nopl   (%rax)

0000000000000220 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     220:	55                   	push   %rbp
     221:	48 89 e5             	mov    %rsp,%rbp
     224:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     22b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     22f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     233:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     237:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     23b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     23f:	89 7d fc             	mov    %edi,-0x4(%rbp)
     242:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     246:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     24a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     24e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     252:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     256:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     25d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     263:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     26a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     271:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     275:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     279:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     27d:	0f 84 f0 03 00 00    	je     673 <printf+0x453>
    c = fmt[i] & 0xff;
     283:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     287:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     28b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     28f:	81 e2 ff 00 00 00    	and    $0xff,%edx
     295:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     298:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     29c:	0f 85 32 00 00 00    	jne    2d4 <printf+0xb4>
      if(c == '%'){
     2a2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     2a6:	0f 85 13 00 00 00    	jne    2bf <printf+0x9f>
        state = '%';
     2ac:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     2b3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     2ba:	e9 10 00 00 00       	jmpq   2cf <printf+0xaf>
        putc(fd, c);
     2bf:	8b 7d fc             	mov    -0x4(%rbp),%edi
     2c2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     2c5:	88 c1                	mov    %al,%cl
     2c7:	0f be f1             	movsbl %cl,%esi
     2ca:	e8 b1 03 00 00       	callq  680 <putc>
      }
    } else if(state == '%'){
     2cf:	e9 8c 03 00 00       	jmpq   660 <printf+0x440>
     2d4:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     2d8:	0f 85 7d 03 00 00    	jne    65b <printf+0x43b>
      if(c == 'l') {
     2de:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     2e2:	0f 85 0c 00 00 00    	jne    2f4 <printf+0xd4>
        lflag = 1;
     2e8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     2ef:	e9 71 03 00 00       	jmpq   665 <printf+0x445>
      } else if(c == 'd'){
     2f4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     2f8:	0f 85 0e 01 00 00    	jne    40c <printf+0x1ec>
        if (lflag == 1)
     2fe:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     302:	0f 85 79 00 00 00    	jne    381 <printf+0x161>
     308:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     30c:	8b 7d fc             	mov    -0x4(%rbp),%edi
     30f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     312:	83 f9 28             	cmp    $0x28,%ecx
     315:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     319:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     31c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     31f:	0f 87 1f 00 00 00    	ja     344 <printf+0x124>
     325:	8b 45 80             	mov    -0x80(%rbp),%eax
     328:	48 63 c8             	movslq %eax,%rcx
     32b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     32f:	48 03 4a 10          	add    0x10(%rdx),%rcx
     333:	83 c0 08             	add    $0x8,%eax
     336:	89 02                	mov    %eax,(%rdx)
     338:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     33f:	e9 1a 00 00 00       	jmpq   35e <printf+0x13e>
     344:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     348:	48 8b 48 08          	mov    0x8(%rax),%rcx
     34c:	48 89 ca             	mov    %rcx,%rdx
     34f:	48 83 c1 08          	add    $0x8,%rcx
     353:	48 89 48 08          	mov    %rcx,0x8(%rax)
     357:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     35e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     365:	ba 0a 00 00 00       	mov    $0xa,%edx
     36a:	b9 01 00 00 00       	mov    $0x1,%ecx
     36f:	48 8b 00             	mov    (%rax),%rax
     372:	89 c6                	mov    %eax,%esi
     374:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     377:	e8 34 03 00 00       	callq  6b0 <printint64>
     37c:	e9 86 00 00 00       	jmpq   407 <printf+0x1e7>
     381:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     385:	8b 7d fc             	mov    -0x4(%rbp),%edi
     388:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     38b:	83 f9 28             	cmp    $0x28,%ecx
     38e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     395:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     39b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     3a1:	0f 87 25 00 00 00    	ja     3cc <printf+0x1ac>
     3a7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     3ad:	48 63 c8             	movslq %eax,%rcx
     3b0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     3b7:	48 03 4a 10          	add    0x10(%rdx),%rcx
     3bb:	83 c0 08             	add    $0x8,%eax
     3be:	89 02                	mov    %eax,(%rdx)
     3c0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     3c7:	e9 1d 00 00 00       	jmpq   3e9 <printf+0x1c9>
     3cc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     3d3:	48 8b 48 08          	mov    0x8(%rax),%rcx
     3d7:	48 89 ca             	mov    %rcx,%rdx
     3da:	48 83 c1 08          	add    $0x8,%rcx
     3de:	48 89 48 08          	mov    %rcx,0x8(%rax)
     3e2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     3e9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     3f0:	ba 0a 00 00 00       	mov    $0xa,%edx
     3f5:	b9 01 00 00 00       	mov    $0x1,%ecx
     3fa:	8b 30                	mov    (%rax),%esi
     3fc:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     402:	e8 a9 03 00 00       	callq  7b0 <printint>
      } else if(c == 'x' || c == 'p'){
     407:	e9 43 02 00 00       	jmpq   64f <printf+0x42f>
     40c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     410:	0f 84 0a 00 00 00    	je     420 <printf+0x200>
     416:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     41a:	0f 85 1d 01 00 00    	jne    53d <printf+0x31d>
        if (lflag == 1)
     420:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     424:	0f 85 8b 00 00 00    	jne    4b5 <printf+0x295>
     42a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     42e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     431:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     434:	83 f9 28             	cmp    $0x28,%ecx
     437:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     43e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     444:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     44a:	0f 87 25 00 00 00    	ja     475 <printf+0x255>
     450:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     456:	48 63 c8             	movslq %eax,%rcx
     459:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     460:	48 03 4a 10          	add    0x10(%rdx),%rcx
     464:	83 c0 08             	add    $0x8,%eax
     467:	89 02                	mov    %eax,(%rdx)
     469:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     470:	e9 1d 00 00 00       	jmpq   492 <printf+0x272>
     475:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     47c:	48 8b 48 08          	mov    0x8(%rax),%rcx
     480:	48 89 ca             	mov    %rcx,%rdx
     483:	48 83 c1 08          	add    $0x8,%rcx
     487:	48 89 48 08          	mov    %rcx,0x8(%rax)
     48b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     492:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     499:	ba 10 00 00 00       	mov    $0x10,%edx
     49e:	31 c9                	xor    %ecx,%ecx
     4a0:	48 8b 00             	mov    (%rax),%rax
     4a3:	89 c6                	mov    %eax,%esi
     4a5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     4ab:	e8 00 02 00 00       	callq  6b0 <printint64>
     4b0:	e9 83 00 00 00       	jmpq   538 <printf+0x318>
     4b5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     4b9:	8b 7d fc             	mov    -0x4(%rbp),%edi
     4bc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     4bf:	83 f9 28             	cmp    $0x28,%ecx
     4c2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     4c9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     4cf:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     4d5:	0f 87 25 00 00 00    	ja     500 <printf+0x2e0>
     4db:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     4e1:	48 63 c8             	movslq %eax,%rcx
     4e4:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     4eb:	48 03 4a 10          	add    0x10(%rdx),%rcx
     4ef:	83 c0 08             	add    $0x8,%eax
     4f2:	89 02                	mov    %eax,(%rdx)
     4f4:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     4fb:	e9 1d 00 00 00       	jmpq   51d <printf+0x2fd>
     500:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     507:	48 8b 48 08          	mov    0x8(%rax),%rcx
     50b:	48 89 ca             	mov    %rcx,%rdx
     50e:	48 83 c1 08          	add    $0x8,%rcx
     512:	48 89 48 08          	mov    %rcx,0x8(%rax)
     516:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     51d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     524:	ba 10 00 00 00       	mov    $0x10,%edx
     529:	31 c9                	xor    %ecx,%ecx
     52b:	8b 30                	mov    (%rax),%esi
     52d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     533:	e8 78 02 00 00       	callq  7b0 <printint>
      } else if(c == 's'){
     538:	e9 0d 01 00 00       	jmpq   64a <printf+0x42a>
     53d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     541:	0f 85 bc 00 00 00    	jne    603 <printf+0x3e3>
     547:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     54b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     54e:	83 f9 28             	cmp    $0x28,%ecx
     551:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     558:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     55e:	0f 87 25 00 00 00    	ja     589 <printf+0x369>
     564:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     56a:	48 63 c8             	movslq %eax,%rcx
     56d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     574:	48 03 4a 10          	add    0x10(%rdx),%rcx
     578:	83 c0 08             	add    $0x8,%eax
     57b:	89 02                	mov    %eax,(%rdx)
     57d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     584:	e9 1d 00 00 00       	jmpq   5a6 <printf+0x386>
     589:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     590:	48 8b 48 08          	mov    0x8(%rax),%rcx
     594:	48 89 ca             	mov    %rcx,%rdx
     597:	48 83 c1 08          	add    $0x8,%rcx
     59b:	48 89 48 08          	mov    %rcx,0x8(%rax)
     59f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     5a6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     5ad:	48 8b 00             	mov    (%rax),%rax
     5b0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     5b4:	48 83 f8 00          	cmp    $0x0,%rax
     5b8:	0f 85 0e 00 00 00    	jne    5cc <printf+0x3ac>
     5be:	48 b8 a2 10 00 00 00 	movabs $0x10a2,%rax
     5c5:	00 00 00 
          s = "(null)";
     5c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     5cc:	e9 00 00 00 00       	jmpq   5d1 <printf+0x3b1>
     5d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5d5:	80 38 00             	cmpb   $0x0,(%rax)
     5d8:	0f 84 20 00 00 00    	je     5fe <printf+0x3de>
          putc(fd, *s);
     5de:	8b 7d fc             	mov    -0x4(%rbp),%edi
     5e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5e5:	0f be 30             	movsbl (%rax),%esi
     5e8:	e8 93 00 00 00       	callq  680 <putc>
        for(; *s; s++)
     5ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5f1:	48 83 c0 01          	add    $0x1,%rax
     5f5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     5f9:	e9 d3 ff ff ff       	jmpq   5d1 <printf+0x3b1>
      } else if(c == '%'){
     5fe:	e9 42 00 00 00       	jmpq   645 <printf+0x425>
     603:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     607:	0f 85 15 00 00 00    	jne    622 <printf+0x402>
        putc(fd, c);
     60d:	8b 7d fc             	mov    -0x4(%rbp),%edi
     610:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     613:	88 c1                	mov    %al,%cl
     615:	0f be f1             	movsbl %cl,%esi
     618:	e8 63 00 00 00       	callq  680 <putc>
      } else {
     61d:	e9 1e 00 00 00       	jmpq   640 <printf+0x420>
     622:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     627:	8b 7d fc             	mov    -0x4(%rbp),%edi
     62a:	e8 51 00 00 00       	callq  680 <putc>
        putc(fd, c);
     62f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     632:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     635:	40 88 f0             	mov    %sil,%al
     638:	0f be f0             	movsbl %al,%esi
     63b:	e8 40 00 00 00       	callq  680 <putc>
     640:	e9 00 00 00 00       	jmpq   645 <printf+0x425>
     645:	e9 00 00 00 00       	jmpq   64a <printf+0x42a>
     64a:	e9 00 00 00 00       	jmpq   64f <printf+0x42f>
     64f:	e9 00 00 00 00       	jmpq   654 <printf+0x434>
      }
      state = 0;
     654:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     65b:	e9 00 00 00 00       	jmpq   660 <printf+0x440>
    }
  }
     660:	e9 00 00 00 00       	jmpq   665 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     665:	8b 45 e0             	mov    -0x20(%rbp),%eax
     668:	83 c0 01             	add    $0x1,%eax
     66b:	89 45 e0             	mov    %eax,-0x20(%rbp)
     66e:	e9 fe fb ff ff       	jmpq   271 <printf+0x51>

  va_end(valist);
}
     673:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     67a:	5d                   	pop    %rbp
     67b:	c3                   	retq   
     67c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000680 <putc>:
{
     680:	55                   	push   %rbp
     681:	48 89 e5             	mov    %rsp,%rbp
     684:	48 83 ec 10          	sub    $0x10,%rsp
     688:	40 88 f0             	mov    %sil,%al
     68b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     68f:	ba 01 00 00 00       	mov    $0x1,%edx
     694:	89 7d fc             	mov    %edi,-0x4(%rbp)
     697:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     69a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     69d:	e8 d6 05 00 00       	callq  c78 <write>
}
     6a2:	89 45 f4             	mov    %eax,-0xc(%rbp)
     6a5:	48 83 c4 10          	add    $0x10,%rsp
     6a9:	5d                   	pop    %rbp
     6aa:	c3                   	retq   
     6ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000006b0 <printint64>:
{
     6b0:	55                   	push   %rbp
     6b1:	48 89 e5             	mov    %rsp,%rbp
     6b4:	48 83 ec 50          	sub    $0x50,%rsp
     6b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
     6bb:	89 75 f8             	mov    %esi,-0x8(%rbp)
     6be:	89 55 f4             	mov    %edx,-0xc(%rbp)
     6c1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     6c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     6c8:	0f 84 30 00 00 00    	je     6fe <printint64+0x4e>
     6ce:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     6d2:	0f 9c c0             	setl   %al
     6d5:	88 c1                	mov    %al,%cl
     6d7:	80 e1 01             	and    $0x1,%cl
     6da:	0f b6 d1             	movzbl %cl,%edx
     6dd:	89 55 f0             	mov    %edx,-0x10(%rbp)
     6e0:	a8 01                	test   $0x1,%al
     6e2:	0f 85 05 00 00 00    	jne    6ed <printint64+0x3d>
     6e8:	e9 11 00 00 00       	jmpq   6fe <printint64+0x4e>
     6ed:	31 c0                	xor    %eax,%eax
    x = -xx;
     6ef:	2b 45 f8             	sub    -0x8(%rbp),%eax
     6f2:	48 63 c8             	movslq %eax,%rcx
     6f5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     6f9:	e9 08 00 00 00       	jmpq   706 <printint64+0x56>
    x = xx;
     6fe:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     702:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     706:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     70d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     711:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     715:	31 d2                	xor    %edx,%edx
     717:	48 f7 f1             	div    %rcx
     71a:	40 8a 34 15 e0 12 00 	mov    0x12e0(,%rdx,1),%sil
     721:	00 
     722:	8b 7d cc             	mov    -0x34(%rbp),%edi
     725:	41 89 f8             	mov    %edi,%r8d
     728:	41 83 c0 01          	add    $0x1,%r8d
     72c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     730:	48 63 cf             	movslq %edi,%rcx
     733:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     738:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     73c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     740:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     744:	48 89 c8             	mov    %rcx,%rax
     747:	31 d2                	xor    %edx,%edx
     749:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     74d:	48 f7 f1             	div    %rcx
     750:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     754:	48 83 f8 00          	cmp    $0x0,%rax
     758:	0f 85 af ff ff ff    	jne    70d <printint64+0x5d>
  if(sgn)
     75e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     762:	0f 84 13 00 00 00    	je     77b <printint64+0xcb>
    buf[i++] = '-';
     768:	8b 45 cc             	mov    -0x34(%rbp),%eax
     76b:	89 c1                	mov    %eax,%ecx
     76d:	83 c1 01             	add    $0x1,%ecx
     770:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     773:	48 63 d0             	movslq %eax,%rdx
     776:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     77b:	e9 00 00 00 00       	jmpq   780 <printint64+0xd0>
     780:	8b 45 cc             	mov    -0x34(%rbp),%eax
     783:	83 c0 ff             	add    $0xffffffff,%eax
     786:	89 45 cc             	mov    %eax,-0x34(%rbp)
     789:	83 f8 00             	cmp    $0x0,%eax
     78c:	0f 8c 16 00 00 00    	jl     7a8 <printint64+0xf8>
    putc(fd, buf[i]);
     792:	8b 7d fc             	mov    -0x4(%rbp),%edi
     795:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     799:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     79e:	e8 dd fe ff ff       	callq  680 <putc>
  while(--i >= 0)
     7a3:	e9 d8 ff ff ff       	jmpq   780 <printint64+0xd0>
}
     7a8:	48 83 c4 50          	add    $0x50,%rsp
     7ac:	5d                   	pop    %rbp
     7ad:	c3                   	retq   
     7ae:	66 90                	xchg   %ax,%ax

00000000000007b0 <printint>:
{
     7b0:	55                   	push   %rbp
     7b1:	48 89 e5             	mov    %rsp,%rbp
     7b4:	48 83 ec 30          	sub    $0x30,%rsp
     7b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
     7bb:	89 75 f8             	mov    %esi,-0x8(%rbp)
     7be:	89 55 f4             	mov    %edx,-0xc(%rbp)
     7c1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     7c4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     7cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     7cf:	0f 84 1e 00 00 00    	je     7f3 <printint+0x43>
     7d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     7d9:	0f 8d 14 00 00 00    	jge    7f3 <printint+0x43>
     7df:	31 c0                	xor    %eax,%eax
    neg = 1;
     7e1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     7e8:	2b 45 f8             	sub    -0x8(%rbp),%eax
     7eb:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     7ee:	e9 06 00 00 00       	jmpq   7f9 <printint+0x49>
    x = xx;
     7f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
     7f6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     7f9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     800:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     803:	31 d2                	xor    %edx,%edx
     805:	f7 75 f4             	divl   -0xc(%rbp)
     808:	89 d2                	mov    %edx,%edx
     80a:	89 d1                	mov    %edx,%ecx
     80c:	40 8a 34 0d 00 13 00 	mov    0x1300(,%rcx,1),%sil
     813:	00 
     814:	8b 55 dc             	mov    -0x24(%rbp),%edx
     817:	89 d7                	mov    %edx,%edi
     819:	83 c7 01             	add    $0x1,%edi
     81c:	89 7d dc             	mov    %edi,-0x24(%rbp)
     81f:	48 63 ca             	movslq %edx,%rcx
     822:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     827:	8b 45 f4             	mov    -0xc(%rbp),%eax
     82a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     82d:	89 45 d0             	mov    %eax,-0x30(%rbp)
     830:	89 c8                	mov    %ecx,%eax
     832:	31 d2                	xor    %edx,%edx
     834:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     837:	f7 f1                	div    %ecx
     839:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     83c:	83 f8 00             	cmp    $0x0,%eax
     83f:	0f 85 bb ff ff ff    	jne    800 <printint+0x50>
  if(neg)
     845:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     849:	0f 84 13 00 00 00    	je     862 <printint+0xb2>
    buf[i++] = '-';
     84f:	8b 45 dc             	mov    -0x24(%rbp),%eax
     852:	89 c1                	mov    %eax,%ecx
     854:	83 c1 01             	add    $0x1,%ecx
     857:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     85a:	48 63 d0             	movslq %eax,%rdx
     85d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     862:	e9 00 00 00 00       	jmpq   867 <printint+0xb7>
     867:	8b 45 dc             	mov    -0x24(%rbp),%eax
     86a:	83 c0 ff             	add    $0xffffffff,%eax
     86d:	89 45 dc             	mov    %eax,-0x24(%rbp)
     870:	83 f8 00             	cmp    $0x0,%eax
     873:	0f 8c 16 00 00 00    	jl     88f <printint+0xdf>
    putc(fd, buf[i]);
     879:	8b 7d fc             	mov    -0x4(%rbp),%edi
     87c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     880:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     885:	e8 f6 fd ff ff       	callq  680 <putc>
  while(--i >= 0)
     88a:	e9 d8 ff ff ff       	jmpq   867 <printint+0xb7>
}
     88f:	48 83 c4 30          	add    $0x30,%rsp
     893:	5d                   	pop    %rbp
     894:	c3                   	retq   
     895:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     89c:	00 00 00 
     89f:	90                   	nop

00000000000008a0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     8a0:	55                   	push   %rbp
     8a1:	48 89 e5             	mov    %rsp,%rbp
     8a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     8a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     8ac:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     8b0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     8b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     8b8:	48 89 c1             	mov    %rax,%rcx
     8bb:	48 83 c1 01          	add    $0x1,%rcx
     8bf:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     8c3:	8a 10                	mov    (%rax),%dl
     8c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     8c9:	48 89 c1             	mov    %rax,%rcx
     8cc:	48 83 c1 01          	add    $0x1,%rcx
     8d0:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     8d4:	88 10                	mov    %dl,(%rax)
     8d6:	0f be f2             	movsbl %dl,%esi
     8d9:	83 fe 00             	cmp    $0x0,%esi
     8dc:	0f 84 05 00 00 00    	je     8e7 <strcpy+0x47>
     8e2:	e9 cd ff ff ff       	jmpq   8b4 <strcpy+0x14>
    ;
  return os;
     8e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     8eb:	5d                   	pop    %rbp
     8ec:	c3                   	retq   
     8ed:	0f 1f 00             	nopl   (%rax)

00000000000008f0 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     8f0:	55                   	push   %rbp
     8f1:	48 89 e5             	mov    %rsp,%rbp
     8f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     8f8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     8fc:	31 c0                	xor    %eax,%eax
     8fe:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     900:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     904:	0f be 02             	movsbl (%rdx),%eax
     907:	83 f8 00             	cmp    $0x0,%eax
     90a:	88 4d ef             	mov    %cl,-0x11(%rbp)
     90d:	0f 84 18 00 00 00    	je     92b <strcmp+0x3b>
     913:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     917:	0f be 08             	movsbl (%rax),%ecx
     91a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     91e:	0f be 10             	movsbl (%rax),%edx
     921:	39 d1                	cmp    %edx,%ecx
     923:	40 0f 94 c6          	sete   %sil
     927:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     92b:	8a 45 ef             	mov    -0x11(%rbp),%al
     92e:	a8 01                	test   $0x1,%al
     930:	0f 85 05 00 00 00    	jne    93b <strcmp+0x4b>
     936:	e9 1d 00 00 00       	jmpq   958 <strcmp+0x68>
    p++, q++;
     93b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     93f:	48 83 c0 01          	add    $0x1,%rax
     943:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     947:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     94b:	48 83 c0 01          	add    $0x1,%rax
     94f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     953:	e9 a4 ff ff ff       	jmpq   8fc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     958:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     95c:	0f b6 08             	movzbl (%rax),%ecx
     95f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     963:	0f b6 10             	movzbl (%rax),%edx
     966:	29 d1                	sub    %edx,%ecx
     968:	89 c8                	mov    %ecx,%eax
     96a:	5d                   	pop    %rbp
     96b:	c3                   	retq   
     96c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000970 <strlen>:
}

uint
strlen(char *s)
{
     970:	55                   	push   %rbp
     971:	48 89 e5             	mov    %rsp,%rbp
     974:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     978:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     97f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     983:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     987:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     98b:	0f 84 13 00 00 00    	je     9a4 <strlen+0x34>
     991:	e9 00 00 00 00       	jmpq   996 <strlen+0x26>
     996:	8b 45 f4             	mov    -0xc(%rbp),%eax
     999:	83 c0 01             	add    $0x1,%eax
     99c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     99f:	e9 db ff ff ff       	jmpq   97f <strlen+0xf>
    ;
  return n;
     9a4:	8b 45 f4             	mov    -0xc(%rbp),%eax
     9a7:	5d                   	pop    %rbp
     9a8:	c3                   	retq   
     9a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000009b0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     9b0:	55                   	push   %rbp
     9b1:	48 89 e5             	mov    %rsp,%rbp
     9b4:	48 83 ec 10          	sub    $0x10,%rsp
     9b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     9bc:	89 75 f4             	mov    %esi,-0xc(%rbp)
     9bf:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     9c2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     9c6:	8b 75 f4             	mov    -0xc(%rbp),%esi
     9c9:	8b 55 f0             	mov    -0x10(%rbp),%edx
     9cc:	e8 0f 00 00 00       	callq  9e0 <stosb>
  return dst;
     9d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     9d5:	48 83 c4 10          	add    $0x10,%rsp
     9d9:	5d                   	pop    %rbp
     9da:	c3                   	retq   
     9db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000009e0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     9e0:	55                   	push   %rbp
     9e1:	48 89 e5             	mov    %rsp,%rbp
     9e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     9e8:	89 75 f4             	mov    %esi,-0xc(%rbp)
     9eb:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     9ee:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     9f2:	8b 55 f0             	mov    -0x10(%rbp),%edx
     9f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     9f8:	89 d1                	mov    %edx,%ecx
     9fa:	fc                   	cld    
     9fb:	f3 aa                	rep stos %al,%es:(%rdi)
     9fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     a01:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     a04:	5d                   	pop    %rbp
     a05:	c3                   	retq   
     a06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     a0d:	00 00 00 

0000000000000a10 <strchr>:
}

char*
strchr(const char *s, char c)
{
     a10:	55                   	push   %rbp
     a11:	48 89 e5             	mov    %rsp,%rbp
     a14:	40 88 f0             	mov    %sil,%al
     a17:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     a1b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     a1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a22:	80 38 00             	cmpb   $0x0,(%rax)
     a25:	0f 84 36 00 00 00    	je     a61 <strchr+0x51>
    if(*s == c)
     a2b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a2f:	0f be 08             	movsbl (%rax),%ecx
     a32:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     a36:	39 d1                	cmp    %edx,%ecx
     a38:	0f 85 0d 00 00 00    	jne    a4b <strchr+0x3b>
      return (char*)s;
     a3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a42:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     a46:	e9 1e 00 00 00       	jmpq   a69 <strchr+0x59>
    if(*s == c)
     a4b:	e9 00 00 00 00       	jmpq   a50 <strchr+0x40>
  for(; *s; s++)
     a50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a54:	48 83 c0 01          	add    $0x1,%rax
     a58:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     a5c:	e9 bd ff ff ff       	jmpq   a1e <strchr+0xe>
  return 0;
     a61:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     a68:	00 
}
     a69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     a6d:	5d                   	pop    %rbp
     a6e:	c3                   	retq   
     a6f:	90                   	nop

0000000000000a70 <gets>:

char*
gets(char *buf, int max)
{
     a70:	55                   	push   %rbp
     a71:	48 89 e5             	mov    %rsp,%rbp
     a74:	48 83 ec 20          	sub    $0x20,%rsp
     a78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     a7c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     a7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     a86:	8b 45 f0             	mov    -0x10(%rbp),%eax
     a89:	83 c0 01             	add    $0x1,%eax
     a8c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     a8f:	0f 8d 5e 00 00 00    	jge    af3 <gets+0x83>
     a95:	31 ff                	xor    %edi,%edi
     a97:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
     a9b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
     aa0:	e8 cb 01 00 00       	callq  c70 <read>
     aa5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
     aa8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
     aac:	0f 8d 05 00 00 00    	jge    ab7 <gets+0x47>
      break;
     ab2:	e9 3c 00 00 00       	jmpq   af3 <gets+0x83>
    buf[i++] = c;
     ab7:	8a 45 eb             	mov    -0x15(%rbp),%al
     aba:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     abe:	8b 55 f0             	mov    -0x10(%rbp),%edx
     ac1:	89 d6                	mov    %edx,%esi
     ac3:	83 c6 01             	add    $0x1,%esi
     ac6:	89 75 f0             	mov    %esi,-0x10(%rbp)
     ac9:	48 63 fa             	movslq %edx,%rdi
     acc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
     acf:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
     ad3:	83 fa 0a             	cmp    $0xa,%edx
     ad6:	0f 84 0d 00 00 00    	je     ae9 <gets+0x79>
     adc:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
     ae0:	83 f8 0d             	cmp    $0xd,%eax
     ae3:	0f 85 05 00 00 00    	jne    aee <gets+0x7e>
      break;
     ae9:	e9 05 00 00 00       	jmpq   af3 <gets+0x83>
  for(i=0; i+1 < max; ){
     aee:	e9 93 ff ff ff       	jmpq   a86 <gets+0x16>
  }
  buf[i] = '\0';
     af3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     af7:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
     afb:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
     aff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b03:	48 83 c4 20          	add    $0x20,%rsp
     b07:	5d                   	pop    %rbp
     b08:	c3                   	retq   
     b09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000b10 <stat>:
}

int
stat(char *n, struct stat *st)
{
     b10:	55                   	push   %rbp
     b11:	48 89 e5             	mov    %rsp,%rbp
     b14:	48 83 ec 30          	sub    $0x30,%rsp
     b18:	31 c0                	xor    %eax,%eax
     b1a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     b1e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b22:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     b26:	89 c6                	mov    %eax,%esi
     b28:	e8 6b 01 00 00       	callq  c98 <open>
     b2d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
     b30:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     b34:	0f 8d 0c 00 00 00    	jge    b46 <stat+0x36>
    return -1;
     b3a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     b41:	e9 20 00 00 00       	jmpq   b66 <stat+0x56>
  r = fstat(fd, st);
     b46:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     b49:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     b4d:	e8 5e 01 00 00       	callq  cb0 <fstat>
     b52:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
     b55:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     b58:	e8 23 01 00 00       	callq  c80 <close>
  return r;
     b5d:	8b 7d e0             	mov    -0x20(%rbp),%edi
     b60:	89 7d fc             	mov    %edi,-0x4(%rbp)
     b63:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
     b66:	8b 45 fc             	mov    -0x4(%rbp),%eax
     b69:	48 83 c4 30          	add    $0x30,%rsp
     b6d:	5d                   	pop    %rbp
     b6e:	c3                   	retq   
     b6f:	90                   	nop

0000000000000b70 <atoi>:

int
atoi(const char *s)
{
     b70:	55                   	push   %rbp
     b71:	48 89 e5             	mov    %rsp,%rbp
     b74:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
     b78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     b7f:	31 c0                	xor    %eax,%eax
     b81:	88 c1                	mov    %al,%cl
     b83:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
     b88:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     b8c:	0f be 32             	movsbl (%rdx),%esi
     b8f:	39 f0                	cmp    %esi,%eax
     b91:	88 4d f3             	mov    %cl,-0xd(%rbp)
     b94:	0f 8f 10 00 00 00    	jg     baa <atoi+0x3a>
     b9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b9e:	0f be 08             	movsbl (%rax),%ecx
     ba1:	83 f9 39             	cmp    $0x39,%ecx
     ba4:	0f 9e c2             	setle  %dl
     ba7:	88 55 f3             	mov    %dl,-0xd(%rbp)
     baa:	8a 45 f3             	mov    -0xd(%rbp),%al
     bad:	a8 01                	test   $0x1,%al
     baf:	0f 85 05 00 00 00    	jne    bba <atoi+0x4a>
     bb5:	e9 23 00 00 00       	jmpq   bdd <atoi+0x6d>
    n = n*10 + *s++ - '0';
     bba:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
     bbe:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     bc2:	48 89 ca             	mov    %rcx,%rdx
     bc5:	48 83 c2 01          	add    $0x1,%rdx
     bc9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     bcd:	0f be 31             	movsbl (%rcx),%esi
     bd0:	01 f0                	add    %esi,%eax
     bd2:	83 e8 30             	sub    $0x30,%eax
     bd5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
     bd8:	e9 a2 ff ff ff       	jmpq   b7f <atoi+0xf>
  return n;
     bdd:	8b 45 f4             	mov    -0xc(%rbp),%eax
     be0:	5d                   	pop    %rbp
     be1:	c3                   	retq   
     be2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     be9:	1f 84 00 00 00 00 00 

0000000000000bf0 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     bf0:	55                   	push   %rbp
     bf1:	48 89 e5             	mov    %rsp,%rbp
     bf4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     bf8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     bfc:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
     bff:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     c03:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
     c07:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     c0b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
     c0f:	8b 45 ec             	mov    -0x14(%rbp),%eax
     c12:	89 c1                	mov    %eax,%ecx
     c14:	83 c1 ff             	add    $0xffffffff,%ecx
     c17:	89 4d ec             	mov    %ecx,-0x14(%rbp)
     c1a:	83 f8 00             	cmp    $0x0,%eax
     c1d:	0f 8e 27 00 00 00    	jle    c4a <memmove+0x5a>
    *dst++ = *src++;
     c23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     c27:	48 89 c1             	mov    %rax,%rcx
     c2a:	48 83 c1 01          	add    $0x1,%rcx
     c2e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     c32:	8a 10                	mov    (%rax),%dl
     c34:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c38:	48 89 c1             	mov    %rax,%rcx
     c3b:	48 83 c1 01          	add    $0x1,%rcx
     c3f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     c43:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
     c45:	e9 c5 ff ff ff       	jmpq   c0f <memmove+0x1f>
  return vdst;
     c4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c4e:	5d                   	pop    %rbp
     c4f:	c3                   	retq   

0000000000000c50 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
     c50:	b8 01 00 00 00       	mov    $0x1,%eax
     c55:	cd 40                	int    $0x40
     c57:	c3                   	retq   

0000000000000c58 <exit>:
SYSCALL(exit)
     c58:	b8 02 00 00 00       	mov    $0x2,%eax
     c5d:	cd 40                	int    $0x40
     c5f:	c3                   	retq   

0000000000000c60 <wait>:
SYSCALL(wait)
     c60:	b8 03 00 00 00       	mov    $0x3,%eax
     c65:	cd 40                	int    $0x40
     c67:	c3                   	retq   

0000000000000c68 <pipe>:
SYSCALL(pipe)
     c68:	b8 04 00 00 00       	mov    $0x4,%eax
     c6d:	cd 40                	int    $0x40
     c6f:	c3                   	retq   

0000000000000c70 <read>:
SYSCALL(read)
     c70:	b8 05 00 00 00       	mov    $0x5,%eax
     c75:	cd 40                	int    $0x40
     c77:	c3                   	retq   

0000000000000c78 <write>:
SYSCALL(write)
     c78:	b8 10 00 00 00       	mov    $0x10,%eax
     c7d:	cd 40                	int    $0x40
     c7f:	c3                   	retq   

0000000000000c80 <close>:
SYSCALL(close)
     c80:	b8 15 00 00 00       	mov    $0x15,%eax
     c85:	cd 40                	int    $0x40
     c87:	c3                   	retq   

0000000000000c88 <kill>:
SYSCALL(kill)
     c88:	b8 06 00 00 00       	mov    $0x6,%eax
     c8d:	cd 40                	int    $0x40
     c8f:	c3                   	retq   

0000000000000c90 <exec>:
SYSCALL(exec)
     c90:	b8 07 00 00 00       	mov    $0x7,%eax
     c95:	cd 40                	int    $0x40
     c97:	c3                   	retq   

0000000000000c98 <open>:
SYSCALL(open)
     c98:	b8 0f 00 00 00       	mov    $0xf,%eax
     c9d:	cd 40                	int    $0x40
     c9f:	c3                   	retq   

0000000000000ca0 <mknod>:
SYSCALL(mknod)
     ca0:	b8 11 00 00 00       	mov    $0x11,%eax
     ca5:	cd 40                	int    $0x40
     ca7:	c3                   	retq   

0000000000000ca8 <unlink>:
SYSCALL(unlink)
     ca8:	b8 12 00 00 00       	mov    $0x12,%eax
     cad:	cd 40                	int    $0x40
     caf:	c3                   	retq   

0000000000000cb0 <fstat>:
SYSCALL(fstat)
     cb0:	b8 08 00 00 00       	mov    $0x8,%eax
     cb5:	cd 40                	int    $0x40
     cb7:	c3                   	retq   

0000000000000cb8 <link>:
SYSCALL(link)
     cb8:	b8 13 00 00 00       	mov    $0x13,%eax
     cbd:	cd 40                	int    $0x40
     cbf:	c3                   	retq   

0000000000000cc0 <mkdir>:
SYSCALL(mkdir)
     cc0:	b8 14 00 00 00       	mov    $0x14,%eax
     cc5:	cd 40                	int    $0x40
     cc7:	c3                   	retq   

0000000000000cc8 <chdir>:
SYSCALL(chdir)
     cc8:	b8 09 00 00 00       	mov    $0x9,%eax
     ccd:	cd 40                	int    $0x40
     ccf:	c3                   	retq   

0000000000000cd0 <dup>:
SYSCALL(dup)
     cd0:	b8 0a 00 00 00       	mov    $0xa,%eax
     cd5:	cd 40                	int    $0x40
     cd7:	c3                   	retq   

0000000000000cd8 <getpid>:
SYSCALL(getpid)
     cd8:	b8 0b 00 00 00       	mov    $0xb,%eax
     cdd:	cd 40                	int    $0x40
     cdf:	c3                   	retq   

0000000000000ce0 <sbrk>:
SYSCALL(sbrk)
     ce0:	b8 0c 00 00 00       	mov    $0xc,%eax
     ce5:	cd 40                	int    $0x40
     ce7:	c3                   	retq   

0000000000000ce8 <sleep>:
SYSCALL(sleep)
     ce8:	b8 0d 00 00 00       	mov    $0xd,%eax
     ced:	cd 40                	int    $0x40
     cef:	c3                   	retq   

0000000000000cf0 <uptime>:
SYSCALL(uptime)
     cf0:	b8 0e 00 00 00       	mov    $0xe,%eax
     cf5:	cd 40                	int    $0x40
     cf7:	c3                   	retq   

0000000000000cf8 <sysinfo>:
SYSCALL(sysinfo)
     cf8:	b8 16 00 00 00       	mov    $0x16,%eax
     cfd:	cd 40                	int    $0x40
     cff:	c3                   	retq   

0000000000000d00 <mmap>:
SYSCALL(mmap)
     d00:	b8 17 00 00 00       	mov    $0x17,%eax
     d05:	cd 40                	int    $0x40
     d07:	c3                   	retq   

0000000000000d08 <munmap>:
SYSCALL(munmap)
     d08:	b8 18 00 00 00       	mov    $0x18,%eax
     d0d:	cd 40                	int    $0x40
     d0f:	c3                   	retq   

0000000000000d10 <crashn>:
SYSCALL(crashn)
     d10:	b8 19 00 00 00       	mov    $0x19,%eax
     d15:	cd 40                	int    $0x40
     d17:	c3                   	retq   
     d18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     d1f:	00 

0000000000000d20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d20:	55                   	push   %rbp
     d21:	48 89 e5             	mov    %rsp,%rbp
     d24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     d28:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     d2c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
     d30:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d34:	48 8b 3c 25 20 13 00 	mov    0x1320,%rdi
     d3b:	00 
     d3c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     d40:	31 c0                	xor    %eax,%eax
     d42:	88 c1                	mov    %al,%cl
     d44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     d48:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
     d4c:	88 4d e7             	mov    %cl,-0x19(%rbp)
     d4f:	0f 86 11 00 00 00    	jbe    d66 <free+0x46>
     d55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d59:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     d5d:	48 3b 01             	cmp    (%rcx),%rax
     d60:	0f 92 c2             	setb   %dl
     d63:	88 55 e7             	mov    %dl,-0x19(%rbp)
     d66:	8a 45 e7             	mov    -0x19(%rbp),%al
     d69:	34 ff                	xor    $0xff,%al
     d6b:	a8 01                	test   $0x1,%al
     d6d:	0f 85 05 00 00 00    	jne    d78 <free+0x58>
     d73:	e9 4a 00 00 00       	jmpq   dc2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     d7c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     d80:	48 3b 01             	cmp    (%rcx),%rax
     d83:	0f 82 24 00 00 00    	jb     dad <free+0x8d>
     d89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d8d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
     d91:	0f 87 11 00 00 00    	ja     da8 <free+0x88>
     d97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d9b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     d9f:	48 3b 01             	cmp    (%rcx),%rax
     da2:	0f 83 05 00 00 00    	jae    dad <free+0x8d>
      break;
     da8:	e9 15 00 00 00       	jmpq   dc2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     dad:	e9 00 00 00 00       	jmpq   db2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     db2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     db6:	48 8b 00             	mov    (%rax),%rax
     db9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     dbd:	e9 7e ff ff ff       	jmpq   d40 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
     dc2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     dc6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     dca:	8b 51 08             	mov    0x8(%rcx),%edx
     dcd:	89 d1                	mov    %edx,%ecx
     dcf:	48 c1 e1 04          	shl    $0x4,%rcx
     dd3:	48 01 c8             	add    %rcx,%rax
     dd6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     dda:	48 3b 01             	cmp    (%rcx),%rax
     ddd:	0f 85 2a 00 00 00    	jne    e0d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
     de3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     de7:	48 8b 00             	mov    (%rax),%rax
     dea:	8b 48 08             	mov    0x8(%rax),%ecx
     ded:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     df1:	03 48 08             	add    0x8(%rax),%ecx
     df4:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
     df7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     dfb:	48 8b 00             	mov    (%rax),%rax
     dfe:	48 8b 00             	mov    (%rax),%rax
     e01:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     e05:	48 89 02             	mov    %rax,(%rdx)
  } else
     e08:	e9 0e 00 00 00       	jmpq   e1b <free+0xfb>
    bp->s.ptr = p->s.ptr;
     e0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e11:	48 8b 00             	mov    (%rax),%rax
     e14:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     e18:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
     e1b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e1f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     e23:	8b 51 08             	mov    0x8(%rcx),%edx
     e26:	89 d1                	mov    %edx,%ecx
     e28:	48 c1 e1 04          	shl    $0x4,%rcx
     e2c:	48 01 c8             	add    %rcx,%rax
     e2f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
     e33:	0f 85 24 00 00 00    	jne    e5d <free+0x13d>
    p->s.size += bp->s.size;
     e39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e3d:	8b 48 08             	mov    0x8(%rax),%ecx
     e40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e44:	03 48 08             	add    0x8(%rax),%ecx
     e47:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
     e4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e4e:	48 8b 00             	mov    (%rax),%rax
     e51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     e55:	48 89 02             	mov    %rax,(%rdx)
  } else
     e58:	e9 0b 00 00 00       	jmpq   e68 <free+0x148>
    p->s.ptr = bp;
     e5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e61:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     e65:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
     e68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e6c:	48 89 04 25 20 13 00 	mov    %rax,0x1320
     e73:	00 
}
     e74:	5d                   	pop    %rbp
     e75:	c3                   	retq   
     e76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     e7d:	00 00 00 

0000000000000e80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     e80:	55                   	push   %rbp
     e81:	48 89 e5             	mov    %rsp,%rbp
     e84:	48 83 ec 30          	sub    $0x30,%rsp
     e88:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     e8b:	8b 7d f4             	mov    -0xc(%rbp),%edi
     e8e:	89 f8                	mov    %edi,%eax
     e90:	48 83 c0 10          	add    $0x10,%rax
     e94:	48 83 e8 01          	sub    $0x1,%rax
     e98:	48 c1 e8 04          	shr    $0x4,%rax
     e9c:	48 83 c0 01          	add    $0x1,%rax
     ea0:	89 c7                	mov    %eax,%edi
     ea2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
     ea5:	48 8b 04 25 20 13 00 	mov    0x1320,%rax
     eac:	00 
     ead:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     eb1:	48 83 f8 00          	cmp    $0x0,%rax
     eb5:	0f 85 29 00 00 00    	jne    ee4 <malloc+0x64>
     ebb:	48 b8 28 13 00 00 00 	movabs $0x1328,%rax
     ec2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
     ec5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     ec9:	48 89 04 25 20 13 00 	mov    %rax,0x1320
     ed0:	00 
     ed1:	48 89 04 25 28 13 00 	mov    %rax,0x1328
     ed8:	00 
    base.s.size = 0;
     ed9:	c7 04 25 30 13 00 00 	movl   $0x0,0x1330
     ee0:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ee4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     ee8:	48 8b 00             	mov    (%rax),%rax
     eeb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
     eef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     ef3:	8b 48 08             	mov    0x8(%rax),%ecx
     ef6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
     ef9:	0f 82 73 00 00 00    	jb     f72 <malloc+0xf2>
      if(p->s.size == nunits)
     eff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f03:	8b 48 08             	mov    0x8(%rax),%ecx
     f06:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
     f09:	0f 85 13 00 00 00    	jne    f22 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
     f0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f13:	48 8b 00             	mov    (%rax),%rax
     f16:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
     f1a:	48 89 01             	mov    %rax,(%rcx)
     f1d:	e9 33 00 00 00       	jmpq   f55 <malloc+0xd5>
      else {
        p->s.size -= nunits;
     f22:	8b 45 dc             	mov    -0x24(%rbp),%eax
     f25:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     f29:	8b 51 08             	mov    0x8(%rcx),%edx
     f2c:	29 c2                	sub    %eax,%edx
     f2e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
     f31:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     f35:	8b 41 08             	mov    0x8(%rcx),%eax
     f38:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     f3c:	89 c0                	mov    %eax,%eax
     f3e:	89 c6                	mov    %eax,%esi
     f40:	48 c1 e6 04          	shl    $0x4,%rsi
     f44:	48 01 f1             	add    %rsi,%rcx
     f47:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
     f4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
     f4e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     f52:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
     f55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f59:	48 89 04 25 20 13 00 	mov    %rax,0x1320
     f60:	00 
      return (void*)(p + 1);
     f61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f65:	48 83 c0 10          	add    $0x10,%rax
     f69:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     f6d:	e9 57 00 00 00       	jmpq   fc9 <malloc+0x149>
    }
    if(p == freep)
     f72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f76:	48 3b 04 25 20 13 00 	cmp    0x1320,%rax
     f7d:	00 
     f7e:	0f 85 28 00 00 00    	jne    fac <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
     f84:	8b 7d dc             	mov    -0x24(%rbp),%edi
     f87:	e8 54 00 00 00       	callq  fe0 <morecore>
     f8c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     f90:	48 83 f8 00          	cmp    $0x0,%rax
     f94:	0f 85 0d 00 00 00    	jne    fa7 <malloc+0x127>
        return 0;
     f9a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     fa1:	00 
     fa2:	e9 22 00 00 00       	jmpq   fc9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
     fa7:	e9 00 00 00 00       	jmpq   fac <malloc+0x12c>
  }
     fac:	e9 00 00 00 00       	jmpq   fb1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     fb5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     fb9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     fbd:	48 8b 00             	mov    (%rax),%rax
     fc0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     fc4:	e9 26 ff ff ff       	jmpq   eef <malloc+0x6f>
     fc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     fcd:	48 83 c4 30          	add    $0x30,%rsp
     fd1:	5d                   	pop    %rbp
     fd2:	c3                   	retq   
     fd3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     fda:	84 00 00 00 00 00 

0000000000000fe0 <morecore>:
{
     fe0:	55                   	push   %rbp
     fe1:	48 89 e5             	mov    %rsp,%rbp
     fe4:	48 83 ec 20          	sub    $0x20,%rsp
     fe8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
     feb:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
     ff2:	0f 83 07 00 00 00    	jae    fff <morecore+0x1f>
    nu = 4096;
     ff8:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
     fff:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1002:	89 c1                	mov    %eax,%ecx
    1004:	48 c1 e1 04          	shl    $0x4,%rcx
    1008:	89 c8                	mov    %ecx,%eax
    100a:	89 c7                	mov    %eax,%edi
    100c:	e8 cf fc ff ff       	callq  ce0 <sbrk>
    1011:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1018:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    101c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1020:	0f 85 0d 00 00 00    	jne    1033 <morecore+0x53>
    return 0;
    1026:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    102d:	00 
    102e:	e9 2e 00 00 00       	jmpq   1061 <morecore+0x81>
  hp = (Header*)p;
    1033:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1037:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    103b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    103e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1042:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1045:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1049:	48 83 c0 10          	add    $0x10,%rax
    104d:	48 89 c7             	mov    %rax,%rdi
    1050:	e8 cb fc ff ff       	callq  d20 <free>
  return freep;
    1055:	48 8b 04 25 20 13 00 	mov    0x1320,%rax
    105c:	00 
    105d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1061:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1065:	48 83 c4 20          	add    $0x20,%rsp
    1069:	5d                   	pop    %rbp
    106a:	c3                   	retq   
