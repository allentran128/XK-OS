
out/user/_lab2test:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
void forktest(void);
void pipetest(void);
void pkilltest(void);
void exectest(void);

int main() {
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 20          	sub    $0x20,%rsp
       8:	48 bf f0 1a 00 00 00 	movabs $0x1af0,%rdi
       f:	00 00 00 
      12:	be 02 00 00 00       	mov    $0x2,%esi
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
      17:	e8 fc 16 00 00       	callq  1718 <open>
      1c:	83 f8 00             	cmp    $0x0,%eax
      1f:	0f 8d 0b 00 00 00    	jge    30 <main+0x30>
      25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
      2a:	48 83 c4 20          	add    $0x20,%rsp
      2e:	5d                   	pop    %rbp
      2f:	c3                   	retq   
      30:	31 ff                	xor    %edi,%edi
  }
  dup(0);  // stdout
      32:	e8 19 17 00 00       	callq  1750 <dup>
      37:	31 ff                	xor    %edi,%edi
  dup(0);  // stderr
      39:	89 45 f4             	mov    %eax,-0xc(%rbp)
      3c:	e8 0f 17 00 00       	callq  1750 <dup>

  pid = fork();
      41:	89 45 f0             	mov    %eax,-0x10(%rbp)
      44:	e8 87 16 00 00       	callq  16d0 <fork>
      49:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if(pid < 0){
      4c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
      50:	0f 8d 1e 00 00 00    	jge    74 <main+0x74>
      56:	bf 01 00 00 00       	mov    $0x1,%edi
      5b:	48 be f2 1c 00 00 00 	movabs $0x1cf2,%rsi
      62:	00 00 00 
    printf(1, "fork failed\n");
      65:	b0 00                	mov    $0x0,%al
      67:	e8 34 0c 00 00       	callq  ca0 <printf>
    exit();
      6c:	e8 67 16 00 00       	callq  16d8 <exit>
      71:	89 45 ec             	mov    %eax,-0x14(%rbp)
  }

  if(pid == 0){
      74:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
      78:	0f 85 2a 00 00 00    	jne    a8 <main+0xa8>
    forktest();
      7e:	e8 8d 00 00 00       	callq  110 <forktest>
    pipetest();
      83:	e8 78 02 00 00       	callq  300 <pipetest>
    exectest();
      88:	e8 83 06 00 00       	callq  710 <exectest>
      8d:	bf 01 00 00 00       	mov    $0x1,%edi
      92:	48 be f8 1a 00 00 00 	movabs $0x1af8,%rsi
      99:	00 00 00 

    printf(1, "lab2 tests passed!!\n");
      9c:	b0 00                	mov    $0x0,%al
      9e:	e8 fd 0b 00 00       	callq  ca0 <printf>

    while(1);
      a3:	e9 fb ff ff ff       	jmpq   a3 <main+0xa3>
  }

  while((wpid=wait()) >= 0 && wpid != pid)
      a8:	e9 00 00 00 00       	jmpq   ad <main+0xad>
      ad:	e8 2e 16 00 00       	callq  16e0 <wait>
      b2:	31 c9                	xor    %ecx,%ecx
      b4:	88 ca                	mov    %cl,%dl
      b6:	89 45 f8             	mov    %eax,-0x8(%rbp)
      b9:	83 f8 00             	cmp    $0x0,%eax
      bc:	88 55 eb             	mov    %dl,-0x15(%rbp)
      bf:	0f 8c 0c 00 00 00    	jl     d1 <main+0xd1>
      c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
      c8:	3b 45 fc             	cmp    -0x4(%rbp),%eax
      cb:	0f 95 c1             	setne  %cl
      ce:	88 4d eb             	mov    %cl,-0x15(%rbp)
      d1:	8a 45 eb             	mov    -0x15(%rbp),%al
      d4:	a8 01                	test   $0x1,%al
      d6:	0f 85 05 00 00 00    	jne    e1 <main+0xe1>
      dc:	e9 1b 00 00 00       	jmpq   fc <main+0xfc>
      e1:	bf 01 00 00 00       	mov    $0x1,%edi
      e6:	48 be 0d 1b 00 00 00 	movabs $0x1b0d,%rsi
      ed:	00 00 00 
    printf(1, "zombie!\n");
      f0:	b0 00                	mov    $0x0,%al
      f2:	e8 a9 0b 00 00       	callq  ca0 <printf>
  while((wpid=wait()) >= 0 && wpid != pid)
      f7:	e9 b1 ff ff ff       	jmpq   ad <main+0xad>

  exit();
      fc:	e8 d7 15 00 00       	callq  16d8 <exit>
     101:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     104:	66 66 66 2e 0f 1f 84 	data16 data16 nopw %cs:0x0(%rax,%rax,1)
     10b:	00 00 00 00 00 

0000000000000110 <forktest>:
  return 0;
}

void
forktest(void)
{
     110:	55                   	push   %rbp
     111:	48 89 e5             	mov    %rsp,%rbp
     114:	48 83 ec 10          	sub    $0x10,%rsp
     118:	bf 01 00 00 00       	mov    $0x1,%edi
     11d:	48 be 16 1b 00 00 00 	movabs $0x1b16,%rsi
     124:	00 00 00 
  int n, pid;
  int nproc = 6;
     127:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%rbp)

  printf(1, "forktest\n");
     12e:	b0 00                	mov    $0x0,%al
     130:	e8 6b 0b 00 00       	callq  ca0 <printf>

  for(n=0; n<nproc; n++){
     135:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     13c:	8b 45 fc             	mov    -0x4(%rbp),%eax
     13f:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     142:	0f 8d 3c 00 00 00    	jge    184 <forktest+0x74>
    pid = fork();
     148:	e8 83 15 00 00       	callq  16d0 <fork>
     14d:	89 45 f8             	mov    %eax,-0x8(%rbp)
    if(pid < 0)
     150:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     154:	0f 8d 05 00 00 00    	jge    15f <forktest+0x4f>
      break;
     15a:	e9 25 00 00 00       	jmpq   184 <forktest+0x74>
    if(pid == 0)
     15f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     163:	0f 85 08 00 00 00    	jne    171 <forktest+0x61>
      exit();
     169:	e8 6a 15 00 00       	callq  16d8 <exit>
     16e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  }
     171:	e9 00 00 00 00       	jmpq   176 <forktest+0x66>
  for(n=0; n<nproc; n++){
     176:	8b 45 fc             	mov    -0x4(%rbp),%eax
     179:	83 c0 01             	add    $0x1,%eax
     17c:	89 45 fc             	mov    %eax,-0x4(%rbp)
     17f:	e9 b8 ff ff ff       	jmpq   13c <forktest+0x2c>

  if(n != nproc){
     184:	8b 45 fc             	mov    -0x4(%rbp),%eax
     187:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     18a:	0f 84 5d 00 00 00    	je     1ed <forktest+0xdd>
    error("forktest: fork claimed to work %d times! but only %d\n", nproc, n);
     190:	e9 00 00 00 00       	jmpq   195 <forktest+0x85>
     195:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     19c:	00 00 00 
     19f:	ba 47 00 00 00       	mov    $0x47,%edx
     1a4:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     1ab:	b0 00                	mov    $0x0,%al
     1ad:	e8 ee 0a 00 00       	callq  ca0 <printf>
     1b2:	48 be 32 1b 00 00 00 	movabs $0x1b32,%rsi
     1b9:	00 00 00 
     1bc:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     1c3:	8b 55 f4             	mov    -0xc(%rbp),%edx
     1c6:	8b 4d fc             	mov    -0x4(%rbp),%ecx
     1c9:	b0 00                	mov    $0x0,%al
     1cb:	e8 d0 0a 00 00       	callq  ca0 <printf>
     1d0:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     1d7:	00 00 00 
     1da:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     1e1:	b0 00                	mov    $0x0,%al
     1e3:	e8 b8 0a 00 00       	callq  ca0 <printf>
     1e8:	e9 fb ff ff ff       	jmpq   1e8 <forktest+0xd8>
  }

  for(; n > 0; n--){
     1ed:	e9 00 00 00 00       	jmpq   1f2 <forktest+0xe2>
     1f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     1f6:	0f 8e 78 00 00 00    	jle    274 <forktest+0x164>
    if(wait() < 0){
     1fc:	e8 df 14 00 00       	callq  16e0 <wait>
     201:	83 f8 00             	cmp    $0x0,%eax
     204:	0f 8d 57 00 00 00    	jge    261 <forktest+0x151>
      error("forktest: wait stopped early\n");
     20a:	e9 00 00 00 00       	jmpq   20f <forktest+0xff>
     20f:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     216:	00 00 00 
     219:	ba 4c 00 00 00       	mov    $0x4c,%edx
     21e:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     225:	b0 00                	mov    $0x0,%al
     227:	e8 74 0a 00 00       	callq  ca0 <printf>
     22c:	48 be 68 1b 00 00 00 	movabs $0x1b68,%rsi
     233:	00 00 00 
     236:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     23d:	b0 00                	mov    $0x0,%al
     23f:	e8 5c 0a 00 00       	callq  ca0 <printf>
     244:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     24b:	00 00 00 
     24e:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     255:	b0 00                	mov    $0x0,%al
     257:	e8 44 0a 00 00       	callq  ca0 <printf>
     25c:	e9 fb ff ff ff       	jmpq   25c <forktest+0x14c>
    }
  }
     261:	e9 00 00 00 00       	jmpq   266 <forktest+0x156>
  for(; n > 0; n--){
     266:	8b 45 fc             	mov    -0x4(%rbp),%eax
     269:	83 c0 ff             	add    $0xffffffff,%eax
     26c:	89 45 fc             	mov    %eax,-0x4(%rbp)
     26f:	e9 7e ff ff ff       	jmpq   1f2 <forktest+0xe2>

  if(wait() != -1){
     274:	e8 67 14 00 00       	callq  16e0 <wait>
     279:	83 f8 ff             	cmp    $0xffffffff,%eax
     27c:	0f 84 57 00 00 00    	je     2d9 <forktest+0x1c9>
    error("forktest: wait got too many\n");
     282:	e9 00 00 00 00       	jmpq   287 <forktest+0x177>
     287:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     28e:	00 00 00 
     291:	ba 51 00 00 00       	mov    $0x51,%edx
     296:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     29d:	b0 00                	mov    $0x0,%al
     29f:	e8 fc 09 00 00       	callq  ca0 <printf>
     2a4:	48 be 86 1b 00 00 00 	movabs $0x1b86,%rsi
     2ab:	00 00 00 
     2ae:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     2b5:	b0 00                	mov    $0x0,%al
     2b7:	e8 e4 09 00 00       	callq  ca0 <printf>
     2bc:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     2c3:	00 00 00 
     2c6:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     2cd:	b0 00                	mov    $0x0,%al
     2cf:	e8 cc 09 00 00       	callq  ca0 <printf>
     2d4:	e9 fb ff ff ff       	jmpq   2d4 <forktest+0x1c4>
     2d9:	bf 01 00 00 00       	mov    $0x1,%edi
     2de:	48 be a3 1b 00 00 00 	movabs $0x1ba3,%rsi
     2e5:	00 00 00 
  }

  printf(1, "forktest: fork test OK\n");
     2e8:	b0 00                	mov    $0x0,%al
     2ea:	e8 b1 09 00 00       	callq  ca0 <printf>
}
     2ef:	48 83 c4 10          	add    $0x10,%rsp
     2f3:	5d                   	pop    %rbp
     2f4:	c3                   	retq   
     2f5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     2fc:	00 00 00 00 

0000000000000300 <pipetest>:

void
pipetest(void)
{
     300:	55                   	push   %rbp
     301:	48 89 e5             	mov    %rsp,%rbp
     304:	48 81 ec 40 02 00 00 	sub    $0x240,%rsp
     30b:	48 8d bd f8 fd ff ff 	lea    -0x208(%rbp),%rdi
  char buf[500];
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     312:	e8 d1 13 00 00       	callq  16e8 <pipe>
     317:	83 f8 00             	cmp    $0x0,%eax
     31a:	0f 84 57 00 00 00    	je     377 <pipetest+0x77>
    error("pipetest: pipe() failed\n");
     320:	e9 00 00 00 00       	jmpq   325 <pipetest+0x25>
     325:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     32c:	00 00 00 
     32f:	ba 5f 00 00 00       	mov    $0x5f,%edx
     334:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     33b:	b0 00                	mov    $0x0,%al
     33d:	e8 5e 09 00 00       	callq  ca0 <printf>
     342:	48 be bb 1b 00 00 00 	movabs $0x1bbb,%rsi
     349:	00 00 00 
     34c:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     353:	b0 00                	mov    $0x0,%al
     355:	e8 46 09 00 00       	callq  ca0 <printf>
     35a:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     361:	00 00 00 
     364:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     36b:	b0 00                	mov    $0x0,%al
     36d:	e8 2e 09 00 00       	callq  ca0 <printf>
     372:	e9 fb ff ff ff       	jmpq   372 <pipetest+0x72>
  }
  pid = fork();
     377:	e8 54 13 00 00       	callq  16d0 <fork>
     37c:	89 85 f4 fd ff ff    	mov    %eax,-0x20c(%rbp)
  seq = 0;
     382:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%rbp)
     389:	00 00 00 
  if(pid == 0){
     38c:	83 bd f4 fd ff ff 00 	cmpl   $0x0,-0x20c(%rbp)
     393:	0f 85 0f 01 00 00    	jne    4a8 <pipetest+0x1a8>
    close(fds[0]);
     399:	8b bd f8 fd ff ff    	mov    -0x208(%rbp),%edi
     39f:	e8 5c 13 00 00       	callq  1700 <close>
    for(n = 0; n < 5; n++){
     3a4:	c7 85 e8 fd ff ff 00 	movl   $0x0,-0x218(%rbp)
     3ab:	00 00 00 
     3ae:	89 85 dc fd ff ff    	mov    %eax,-0x224(%rbp)
     3b4:	83 bd e8 fd ff ff 05 	cmpl   $0x5,-0x218(%rbp)
     3bb:	0f 8d dc 00 00 00    	jge    49d <pipetest+0x19d>
      for(i = 0; i < 95; i++)
     3c1:	c7 85 ec fd ff ff 00 	movl   $0x0,-0x214(%rbp)
     3c8:	00 00 00 
     3cb:	83 bd ec fd ff ff 5f 	cmpl   $0x5f,-0x214(%rbp)
     3d2:	0f 8d 35 00 00 00    	jge    40d <pipetest+0x10d>
        buf[i] = seq++;
     3d8:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
     3de:	89 c1                	mov    %eax,%ecx
     3e0:	83 c1 01             	add    $0x1,%ecx
     3e3:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
     3e9:	88 c2                	mov    %al,%dl
     3eb:	48 63 b5 ec fd ff ff 	movslq -0x214(%rbp),%rsi
     3f2:	88 94 35 00 fe ff ff 	mov    %dl,-0x200(%rbp,%rsi,1)
      for(i = 0; i < 95; i++)
     3f9:	8b 85 ec fd ff ff    	mov    -0x214(%rbp),%eax
     3ff:	83 c0 01             	add    $0x1,%eax
     402:	89 85 ec fd ff ff    	mov    %eax,-0x214(%rbp)
     408:	e9 be ff ff ff       	jmpq   3cb <pipetest+0xcb>
     40d:	ba 5f 00 00 00       	mov    $0x5f,%edx
     412:	48 8d b5 00 fe ff ff 	lea    -0x200(%rbp),%rsi
      if(write(fds[1], buf, 95) != 95){
     419:	8b bd fc fd ff ff    	mov    -0x204(%rbp),%edi
     41f:	e8 d4 12 00 00       	callq  16f8 <write>
     424:	83 f8 5f             	cmp    $0x5f,%eax
     427:	0f 84 57 00 00 00    	je     484 <pipetest+0x184>
        error("pipetest: oops 1\n");
     42d:	e9 00 00 00 00       	jmpq   432 <pipetest+0x132>
     432:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     439:	00 00 00 
     43c:	ba 69 00 00 00       	mov    $0x69,%edx
     441:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     448:	b0 00                	mov    $0x0,%al
     44a:	e8 51 08 00 00       	callq  ca0 <printf>
     44f:	48 be d4 1b 00 00 00 	movabs $0x1bd4,%rsi
     456:	00 00 00 
     459:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     460:	b0 00                	mov    $0x0,%al
     462:	e8 39 08 00 00       	callq  ca0 <printf>
     467:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     46e:	00 00 00 
     471:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     478:	b0 00                	mov    $0x0,%al
     47a:	e8 21 08 00 00       	callq  ca0 <printf>
     47f:	e9 fb ff ff ff       	jmpq   47f <pipetest+0x17f>
      }
    }
     484:	e9 00 00 00 00       	jmpq   489 <pipetest+0x189>
    for(n = 0; n < 5; n++){
     489:	8b 85 e8 fd ff ff    	mov    -0x218(%rbp),%eax
     48f:	83 c0 01             	add    $0x1,%eax
     492:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%rbp)
     498:	e9 17 ff ff ff       	jmpq   3b4 <pipetest+0xb4>
    exit();
     49d:	e8 36 12 00 00       	callq  16d8 <exit>
     4a2:	89 85 d8 fd ff ff    	mov    %eax,-0x228(%rbp)
  } else if(pid > 0){
     4a8:	83 bd f4 fd ff ff 00 	cmpl   $0x0,-0x20c(%rbp)
     4af:	0f 8e de 01 00 00    	jle    693 <pipetest+0x393>
    close(fds[1]);
     4b5:	8b bd fc fd ff ff    	mov    -0x204(%rbp),%edi
     4bb:	e8 40 12 00 00       	callq  1700 <close>
    total = 0;
     4c0:	c7 85 e0 fd ff ff 00 	movl   $0x0,-0x220(%rbp)
     4c7:	00 00 00 
    cc = 1;
     4ca:	c7 85 e4 fd ff ff 01 	movl   $0x1,-0x21c(%rbp)
     4d1:	00 00 00 
     4d4:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%rbp)
     4da:	48 8d b5 00 fe ff ff 	lea    -0x200(%rbp),%rsi
    while((n = read(fds[0], buf, cc)) > 0){
     4e1:	8b bd f8 fd ff ff    	mov    -0x208(%rbp),%edi
     4e7:	8b 95 e4 fd ff ff    	mov    -0x21c(%rbp),%edx
     4ed:	e8 fe 11 00 00       	callq  16f0 <read>
     4f2:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%rbp)
     4f8:	83 f8 00             	cmp    $0x0,%eax
     4fb:	0f 8e 04 01 00 00    	jle    605 <pipetest+0x305>
      for(i = 0; i < n; i++){
     501:	c7 85 ec fd ff ff 00 	movl   $0x0,-0x214(%rbp)
     508:	00 00 00 
     50b:	8b 85 ec fd ff ff    	mov    -0x214(%rbp),%eax
     511:	3b 85 e8 fd ff ff    	cmp    -0x218(%rbp),%eax
     517:	0f 8d a4 00 00 00    	jge    5c1 <pipetest+0x2c1>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     51d:	48 63 85 ec fd ff ff 	movslq -0x214(%rbp),%rax
     524:	0f be 8c 05 00 fe ff 	movsbl -0x200(%rbp,%rax,1),%ecx
     52b:	ff 
     52c:	81 e1 ff 00 00 00    	and    $0xff,%ecx
     532:	8b 95 f0 fd ff ff    	mov    -0x210(%rbp),%edx
     538:	89 d6                	mov    %edx,%esi
     53a:	83 c6 01             	add    $0x1,%esi
     53d:	89 b5 f0 fd ff ff    	mov    %esi,-0x210(%rbp)
     543:	81 e2 ff 00 00 00    	and    $0xff,%edx
     549:	39 d1                	cmp    %edx,%ecx
     54b:	0f 84 57 00 00 00    	je     5a8 <pipetest+0x2a8>
          error("pipetest: oops 2\n");
     551:	e9 00 00 00 00       	jmpq   556 <pipetest+0x256>
     556:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     55d:	00 00 00 
     560:	ba 74 00 00 00       	mov    $0x74,%edx
     565:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     56c:	b0 00                	mov    $0x0,%al
     56e:	e8 2d 07 00 00       	callq  ca0 <printf>
     573:	48 be e6 1b 00 00 00 	movabs $0x1be6,%rsi
     57a:	00 00 00 
     57d:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     584:	b0 00                	mov    $0x0,%al
     586:	e8 15 07 00 00       	callq  ca0 <printf>
     58b:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     592:	00 00 00 
     595:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     59c:	b0 00                	mov    $0x0,%al
     59e:	e8 fd 06 00 00       	callq  ca0 <printf>
     5a3:	e9 fb ff ff ff       	jmpq   5a3 <pipetest+0x2a3>
        }
      }
     5a8:	e9 00 00 00 00       	jmpq   5ad <pipetest+0x2ad>
      for(i = 0; i < n; i++){
     5ad:	8b 85 ec fd ff ff    	mov    -0x214(%rbp),%eax
     5b3:	83 c0 01             	add    $0x1,%eax
     5b6:	89 85 ec fd ff ff    	mov    %eax,-0x214(%rbp)
     5bc:	e9 4a ff ff ff       	jmpq   50b <pipetest+0x20b>
      total += n;
     5c1:	8b 85 e8 fd ff ff    	mov    -0x218(%rbp),%eax
     5c7:	03 85 e0 fd ff ff    	add    -0x220(%rbp),%eax
     5cd:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%rbp)
      cc = cc * 2;
     5d3:	8b 85 e4 fd ff ff    	mov    -0x21c(%rbp),%eax
     5d9:	c1 e0 01             	shl    $0x1,%eax
     5dc:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%rbp)
      if(cc > sizeof(buf))
     5e2:	48 63 8d e4 fd ff ff 	movslq -0x21c(%rbp),%rcx
     5e9:	48 81 f9 f4 01 00 00 	cmp    $0x1f4,%rcx
     5f0:	0f 86 0a 00 00 00    	jbe    600 <pipetest+0x300>
        cc = sizeof(buf);
     5f6:	c7 85 e4 fd ff ff f4 	movl   $0x1f4,-0x21c(%rbp)
     5fd:	01 00 00 
    while((n = read(fds[0], buf, cc)) > 0){
     600:	e9 d5 fe ff ff       	jmpq   4da <pipetest+0x1da>
    }
    if(total != 5 * 95){
     605:	81 bd e0 fd ff ff db 	cmpl   $0x1db,-0x220(%rbp)
     60c:	01 00 00 
     60f:	0f 84 5d 00 00 00    	je     672 <pipetest+0x372>
      error("pipetest: oops 3 total %d\n", total);
     615:	e9 00 00 00 00       	jmpq   61a <pipetest+0x31a>
     61a:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     621:	00 00 00 
     624:	ba 7d 00 00 00       	mov    $0x7d,%edx
     629:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     630:	b0 00                	mov    $0x0,%al
     632:	e8 69 06 00 00       	callq  ca0 <printf>
     637:	48 be f8 1b 00 00 00 	movabs $0x1bf8,%rsi
     63e:	00 00 00 
     641:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     648:	8b 95 e0 fd ff ff    	mov    -0x220(%rbp),%edx
     64e:	b0 00                	mov    $0x0,%al
     650:	e8 4b 06 00 00       	callq  ca0 <printf>
     655:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     65c:	00 00 00 
     65f:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     666:	b0 00                	mov    $0x0,%al
     668:	e8 33 06 00 00       	callq  ca0 <printf>
     66d:	e9 fb ff ff ff       	jmpq   66d <pipetest+0x36d>
    }
    close(fds[0]);
     672:	8b bd f8 fd ff ff    	mov    -0x208(%rbp),%edi
     678:	e8 83 10 00 00       	callq  1700 <close>
    wait();
     67d:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
     683:	e8 58 10 00 00       	callq  16e0 <wait>
  } else {
     688:	89 85 cc fd ff ff    	mov    %eax,-0x234(%rbp)
     68e:	e9 57 00 00 00       	jmpq   6ea <pipetest+0x3ea>
    error("pipetest: fork() failed\n");
     693:	e9 00 00 00 00       	jmpq   698 <pipetest+0x398>
     698:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     69f:	00 00 00 
     6a2:	ba 82 00 00 00       	mov    $0x82,%edx
     6a7:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     6ae:	b0 00                	mov    $0x0,%al
     6b0:	e8 eb 05 00 00       	callq  ca0 <printf>
     6b5:	48 be 13 1c 00 00 00 	movabs $0x1c13,%rsi
     6bc:	00 00 00 
     6bf:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     6c6:	b0 00                	mov    $0x0,%al
     6c8:	e8 d3 05 00 00       	callq  ca0 <printf>
     6cd:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     6d4:	00 00 00 
     6d7:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     6de:	b0 00                	mov    $0x0,%al
     6e0:	e8 bb 05 00 00       	callq  ca0 <printf>
     6e5:	e9 fb ff ff ff       	jmpq   6e5 <pipetest+0x3e5>
     6ea:	e9 00 00 00 00       	jmpq   6ef <pipetest+0x3ef>
     6ef:	bf 01 00 00 00       	mov    $0x1,%edi
     6f4:	48 be 2c 1c 00 00 00 	movabs $0x1c2c,%rsi
     6fb:	00 00 00 
  }
  printf(1, "pipetest ok\n");
     6fe:	b0 00                	mov    $0x0,%al
     700:	e8 9b 05 00 00       	callq  ca0 <printf>
}
     705:	48 81 c4 40 02 00 00 	add    $0x240,%rsp
     70c:	5d                   	pop    %rbp
     70d:	c3                   	retq   
     70e:	66 90                	xchg   %ax,%ax

0000000000000710 <exectest>:
  printf(1, "racetest ok\n");
}

void
exectest(void)
{
     710:	55                   	push   %rbp
     711:	48 89 e5             	mov    %rsp,%rbp
     714:	48 83 ec 40          	sub    $0x40,%rsp
     718:	bf 01 00 00 00       	mov    $0x1,%edi
     71d:	48 be d1 1c 00 00 00 	movabs $0x1cd1,%rsi
     724:	00 00 00 
  printf(1, "exectest: starting ls\n");
     727:	b0 00                	mov    $0x0,%al
     729:	e8 72 05 00 00       	callq  ca0 <printf>
  int pid = fork();
     72e:	e8 9d 0f 00 00       	callq  16d0 <fork>
     733:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if(pid < 0){
     736:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     73a:	0f 8d 57 00 00 00    	jge    797 <exectest+0x87>
    error("exectest: fork failed\n");
     740:	e9 00 00 00 00       	jmpq   745 <exectest+0x35>
     745:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     74c:	00 00 00 
     74f:	ba d0 00 00 00       	mov    $0xd0,%edx
     754:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     75b:	b0 00                	mov    $0x0,%al
     75d:	e8 3e 05 00 00       	callq  ca0 <printf>
     762:	48 be e8 1c 00 00 00 	movabs $0x1ce8,%rsi
     769:	00 00 00 
     76c:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     773:	b0 00                	mov    $0x0,%al
     775:	e8 26 05 00 00       	callq  ca0 <printf>
     77a:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     781:	00 00 00 
     784:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     78b:	b0 00                	mov    $0x0,%al
     78d:	e8 0e 05 00 00       	callq  ca0 <printf>
     792:	e9 fb ff ff ff       	jmpq   792 <exectest+0x82>
     797:	31 f6                	xor    %esi,%esi
     799:	b8 08 00 00 00       	mov    $0x8,%eax
     79e:	89 c2                	mov    %eax,%edx
     7a0:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  }

  char *argv[] = {0};
     7a4:	48 89 cf             	mov    %rcx,%rdi
     7a7:	e8 84 0c 00 00       	callq  1430 <memset>

  if(pid == 0){
     7ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     7b0:	0f 85 68 00 00 00    	jne    81e <exectest+0x10e>
     7b6:	48 bf ff 1c 00 00 00 	movabs $0x1cff,%rdi
     7bd:	00 00 00 
     7c0:	48 8d 75 f0          	lea    -0x10(%rbp),%rsi
    exec("ls", argv);
     7c4:	e8 47 0f 00 00       	callq  1710 <exec>
     7c9:	89 45 cc             	mov    %eax,-0x34(%rbp)
     7cc:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     7d3:	00 00 00 
     7d6:	ba d7 00 00 00       	mov    $0xd7,%edx
    error("exectest: exec ls failed\n");
     7db:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     7e2:	b0 00                	mov    $0x0,%al
     7e4:	e8 b7 04 00 00       	callq  ca0 <printf>
     7e9:	48 be 02 1d 00 00 00 	movabs $0x1d02,%rsi
     7f0:	00 00 00 
     7f3:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     7fa:	b0 00                	mov    $0x0,%al
     7fc:	e8 9f 04 00 00       	callq  ca0 <printf>
     801:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     808:	00 00 00 
     80b:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     812:	b0 00                	mov    $0x0,%al
     814:	e8 87 04 00 00       	callq  ca0 <printf>
     819:	e9 fb ff ff ff       	jmpq   819 <exectest+0x109>
  } else {
    pid = wait();
     81e:	e8 bd 0e 00 00       	callq  16e0 <wait>
     823:	89 45 fc             	mov    %eax,-0x4(%rbp)
     826:	48 be 2d 1d 00 00 00 	movabs $0x1d2d,%rsi
     82d:	00 00 00 
  }

  char *echoargv[] = { "echo", "echotest", "ok", 0 };
     830:	48 8b 04 25 70 1d 00 	mov    0x1d70,%rax
     837:	00 
     838:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     83c:	48 8b 04 25 78 1d 00 	mov    0x1d78,%rax
     843:	00 
     844:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     848:	48 8b 04 25 80 1d 00 	mov    0x1d80,%rax
     84f:	00 
     850:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     854:	48 8b 04 25 88 1d 00 	mov    0x1d88,%rax
     85b:	00 
     85c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  printf(stdout, "exectest: test argument\n");
     860:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     867:	b0 00                	mov    $0x0,%al
     869:	e8 32 04 00 00       	callq  ca0 <printf>

  pid = fork();
     86e:	e8 5d 0e 00 00       	callq  16d0 <fork>
     873:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if(pid < 0){
     876:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     87a:	0f 8d 57 00 00 00    	jge    8d7 <exectest+0x1c7>
    error("exectest: fork failed\n");
     880:	e9 00 00 00 00       	jmpq   885 <exectest+0x175>
     885:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     88c:	00 00 00 
     88f:	ba e1 00 00 00       	mov    $0xe1,%edx
     894:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     89b:	b0 00                	mov    $0x0,%al
     89d:	e8 fe 03 00 00       	callq  ca0 <printf>
     8a2:	48 be e8 1c 00 00 00 	movabs $0x1ce8,%rsi
     8a9:	00 00 00 
     8ac:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     8b3:	b0 00                	mov    $0x0,%al
     8b5:	e8 e6 03 00 00       	callq  ca0 <printf>
     8ba:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     8c1:	00 00 00 
     8c4:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     8cb:	b0 00                	mov    $0x0,%al
     8cd:	e8 ce 03 00 00       	callq  ca0 <printf>
     8d2:	e9 fb ff ff ff       	jmpq   8d2 <exectest+0x1c2>
  }
  if(pid == 0){
     8d7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     8db:	0f 85 68 00 00 00    	jne    949 <exectest+0x239>
     8e1:	48 bf 1c 1d 00 00 00 	movabs $0x1d1c,%rdi
     8e8:	00 00 00 
     8eb:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
    exec("echo", echoargv);
     8ef:	e8 1c 0e 00 00       	callq  1710 <exec>
     8f4:	89 45 c8             	mov    %eax,-0x38(%rbp)
     8f7:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     8fe:	00 00 00 
     901:	ba e5 00 00 00       	mov    $0xe5,%edx
    error("exectest: exec echo failed\n");
     906:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     90d:	b0 00                	mov    $0x0,%al
     90f:	e8 8c 03 00 00       	callq  ca0 <printf>
     914:	48 be 46 1d 00 00 00 	movabs $0x1d46,%rsi
     91b:	00 00 00 
     91e:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     925:	b0 00                	mov    $0x0,%al
     927:	e8 74 03 00 00       	callq  ca0 <printf>
     92c:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     933:	00 00 00 
     936:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     93d:	b0 00                	mov    $0x0,%al
     93f:	e8 5c 03 00 00       	callq  ca0 <printf>
     944:	e9 fb ff ff ff       	jmpq   944 <exectest+0x234>
  } else {
    pid = wait();
     949:	e8 92 0d 00 00       	callq  16e0 <wait>
     94e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  }
}
     951:	48 83 c4 40          	add    $0x40,%rsp
     955:	5d                   	pop    %rbp
     956:	c3                   	retq   
     957:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     95e:	00 00 

0000000000000960 <pkilltest>:
{
     960:	55                   	push   %rbp
     961:	48 89 e5             	mov    %rsp,%rbp
     964:	48 83 ec 50          	sub    $0x50,%rsp
     968:	bf 01 00 00 00       	mov    $0x1,%edi
     96d:	48 be 39 1c 00 00 00 	movabs $0x1c39,%rsi
     974:	00 00 00 
  printf(1, "preempt: ");
     977:	b0 00                	mov    $0x0,%al
     979:	e8 22 03 00 00       	callq  ca0 <printf>
  pid1 = fork();
     97e:	e8 4d 0d 00 00       	callq  16d0 <fork>
     983:	89 45 f0             	mov    %eax,-0x10(%rbp)
  if(pid1 == 0)
     986:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     98a:	0f 85 0a 00 00 00    	jne    99a <pkilltest+0x3a>
    for(;;)
     990:	e9 00 00 00 00       	jmpq   995 <pkilltest+0x35>
     995:	e9 fb ff ff ff       	jmpq   995 <pkilltest+0x35>
  pid2 = fork();
     99a:	e8 31 0d 00 00       	callq  16d0 <fork>
     99f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  if(pid2 == 0)
     9a2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
     9a6:	0f 85 0a 00 00 00    	jne    9b6 <pkilltest+0x56>
    for(;;)
     9ac:	e9 00 00 00 00       	jmpq   9b1 <pkilltest+0x51>
     9b1:	e9 fb ff ff ff       	jmpq   9b1 <pkilltest+0x51>
     9b6:	48 8d 7d e0          	lea    -0x20(%rbp),%rdi
  pipe(pfds);
     9ba:	e8 29 0d 00 00       	callq  16e8 <pipe>
  pid3 = fork();
     9bf:	89 45 dc             	mov    %eax,-0x24(%rbp)
     9c2:	e8 09 0d 00 00       	callq  16d0 <fork>
     9c7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  if(pid3 == 0){
     9ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
     9ce:	0f 85 92 00 00 00    	jne    a66 <pkilltest+0x106>
    close(pfds[0]);
     9d4:	8b 7d e0             	mov    -0x20(%rbp),%edi
     9d7:	e8 24 0d 00 00       	callq  1700 <close>
     9dc:	48 be 43 1c 00 00 00 	movabs $0x1c43,%rsi
     9e3:	00 00 00 
     9e6:	ba 01 00 00 00       	mov    $0x1,%edx
    if(write(pfds[1], "x", 1) != 1)
     9eb:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     9ee:	89 45 d8             	mov    %eax,-0x28(%rbp)
     9f1:	e8 02 0d 00 00       	callq  16f8 <write>
     9f6:	83 f8 01             	cmp    $0x1,%eax
     9f9:	0f 84 57 00 00 00    	je     a56 <pkilltest+0xf6>
      error("pkilltest: write error");
     9ff:	e9 00 00 00 00       	jmpq   a04 <pkilltest+0xa4>
     a04:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     a0b:	00 00 00 
     a0e:	ba 9f 00 00 00       	mov    $0x9f,%edx
     a13:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     a1a:	b0 00                	mov    $0x0,%al
     a1c:	e8 7f 02 00 00       	callq  ca0 <printf>
     a21:	48 be 45 1c 00 00 00 	movabs $0x1c45,%rsi
     a28:	00 00 00 
     a2b:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     a32:	b0 00                	mov    $0x0,%al
     a34:	e8 67 02 00 00       	callq  ca0 <printf>
     a39:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     a40:	00 00 00 
     a43:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     a4a:	b0 00                	mov    $0x0,%al
     a4c:	e8 4f 02 00 00       	callq  ca0 <printf>
     a51:	e9 fb ff ff ff       	jmpq   a51 <pkilltest+0xf1>
    close(pfds[1]);
     a56:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     a59:	e8 a2 0c 00 00       	callq  1700 <close>
     a5e:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    for(;;)
     a61:	e9 fb ff ff ff       	jmpq   a61 <pkilltest+0x101>
  close(pfds[1]);
     a66:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     a69:	e8 92 0c 00 00       	callq  1700 <close>
     a6e:	ba 0b 00 00 00       	mov    $0xb,%edx
     a73:	48 8d 75 f5          	lea    -0xb(%rbp),%rsi
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     a77:	8b 7d e0             	mov    -0x20(%rbp),%edi
     a7a:	89 45 d0             	mov    %eax,-0x30(%rbp)
     a7d:	e8 6e 0c 00 00       	callq  16f0 <read>
     a82:	83 f8 01             	cmp    $0x1,%eax
     a85:	0f 84 57 00 00 00    	je     ae2 <pkilltest+0x182>
    error("pkilltest: read error");
     a8b:	e9 00 00 00 00       	jmpq   a90 <pkilltest+0x130>
     a90:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     a97:	00 00 00 
     a9a:	ba a7 00 00 00       	mov    $0xa7,%edx
     a9f:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     aa6:	b0 00                	mov    $0x0,%al
     aa8:	e8 f3 01 00 00       	callq  ca0 <printf>
     aad:	48 be 5c 1c 00 00 00 	movabs $0x1c5c,%rsi
     ab4:	00 00 00 
     ab7:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     abe:	b0 00                	mov    $0x0,%al
     ac0:	e8 db 01 00 00       	callq  ca0 <printf>
     ac5:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     acc:	00 00 00 
     acf:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     ad6:	b0 00                	mov    $0x0,%al
     ad8:	e8 c3 01 00 00       	callq  ca0 <printf>
     add:	e9 fb ff ff ff       	jmpq   add <pkilltest+0x17d>
  close(pfds[0]);
     ae2:	8b 7d e0             	mov    -0x20(%rbp),%edi
     ae5:	e8 16 0c 00 00       	callq  1700 <close>
     aea:	bf 01 00 00 00       	mov    $0x1,%edi
     aef:	48 be 72 1c 00 00 00 	movabs $0x1c72,%rsi
     af6:	00 00 00 
  printf(1, "kill... ");
     af9:	89 45 cc             	mov    %eax,-0x34(%rbp)
     afc:	b0 00                	mov    $0x0,%al
     afe:	e8 9d 01 00 00       	callq  ca0 <printf>
  kill(pid1);
     b03:	8b 7d f0             	mov    -0x10(%rbp),%edi
     b06:	e8 fd 0b 00 00       	callq  1708 <kill>
  kill(pid2);
     b0b:	8b 7d ec             	mov    -0x14(%rbp),%edi
     b0e:	89 45 c8             	mov    %eax,-0x38(%rbp)
     b11:	e8 f2 0b 00 00       	callq  1708 <kill>
  kill(pid3);
     b16:	8b 7d e8             	mov    -0x18(%rbp),%edi
     b19:	89 45 c4             	mov    %eax,-0x3c(%rbp)
     b1c:	e8 e7 0b 00 00       	callq  1708 <kill>
     b21:	bf 01 00 00 00       	mov    $0x1,%edi
     b26:	48 be 7b 1c 00 00 00 	movabs $0x1c7b,%rsi
     b2d:	00 00 00 
  printf(1, "wait... ");
     b30:	89 45 c0             	mov    %eax,-0x40(%rbp)
     b33:	b0 00                	mov    $0x0,%al
     b35:	e8 66 01 00 00       	callq  ca0 <printf>
  wait();
     b3a:	e8 a1 0b 00 00       	callq  16e0 <wait>
  wait();
     b3f:	89 45 bc             	mov    %eax,-0x44(%rbp)
     b42:	e8 99 0b 00 00       	callq  16e0 <wait>
  wait();
     b47:	89 45 b8             	mov    %eax,-0x48(%rbp)
     b4a:	e8 91 0b 00 00       	callq  16e0 <wait>
     b4f:	bf 01 00 00 00       	mov    $0x1,%edi
     b54:	48 be 84 1c 00 00 00 	movabs $0x1c84,%rsi
     b5b:	00 00 00 
  printf(1, "pkilltest: ok\n");
     b5e:	89 45 b4             	mov    %eax,-0x4c(%rbp)
     b61:	b0 00                	mov    $0x0,%al
     b63:	e8 38 01 00 00       	callq  ca0 <printf>
}
     b68:	48 83 c4 50          	add    $0x50,%rsp
     b6c:	5d                   	pop    %rbp
     b6d:	c3                   	retq   
     b6e:	66 90                	xchg   %ax,%ax

0000000000000b70 <racetest>:
{
     b70:	55                   	push   %rbp
     b71:	48 89 e5             	mov    %rsp,%rbp
  for(i = 0; i < 100; i++){
     b74:	48 83 ec 10          	sub    $0x10,%rsp
     b78:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     b7f:	83 7d fc 64          	cmpl   $0x64,-0x4(%rbp)
     b83:	0f 8d f8 00 00 00    	jge    c81 <racetest+0x111>
    pid = fork();
     b89:	e8 42 0b 00 00       	callq  16d0 <fork>
     b8e:	89 45 f8             	mov    %eax,-0x8(%rbp)
    if(pid < 0){
     b91:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     b95:	0f 8d 57 00 00 00    	jge    bf2 <racetest+0x82>
      error("racetest: fork failed\n");
     b9b:	e9 00 00 00 00       	jmpq   ba0 <racetest+0x30>
     ba0:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     ba7:	00 00 00 
     baa:	ba bd 00 00 00       	mov    $0xbd,%edx
     baf:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     bb6:	b0 00                	mov    $0x0,%al
     bb8:	e8 e3 00 00 00       	callq  ca0 <printf>
     bbd:	48 be 93 1c 00 00 00 	movabs $0x1c93,%rsi
     bc4:	00 00 00 
     bc7:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     bce:	b0 00                	mov    $0x0,%al
     bd0:	e8 cb 00 00 00       	callq  ca0 <printf>
     bd5:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     bdc:	00 00 00 
     bdf:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     be6:	b0 00                	mov    $0x0,%al
     be8:	e8 b3 00 00 00       	callq  ca0 <printf>
     bed:	e9 fb ff ff ff       	jmpq   bed <racetest+0x7d>
    if(pid){
     bf2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     bf6:	0f 84 6a 00 00 00    	je     c66 <racetest+0xf6>
      if(wait() != pid){
     bfc:	e8 df 0a 00 00       	callq  16e0 <wait>
     c01:	3b 45 f8             	cmp    -0x8(%rbp),%eax
     c04:	0f 84 57 00 00 00    	je     c61 <racetest+0xf1>
        error("racetest: wait wrong pid\n");
     c0a:	e9 00 00 00 00       	jmpq   c0f <racetest+0x9f>
     c0f:	48 be 20 1b 00 00 00 	movabs $0x1b20,%rsi
     c16:	00 00 00 
     c19:	ba c1 00 00 00       	mov    $0xc1,%edx
     c1e:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     c25:	b0 00                	mov    $0x0,%al
     c27:	e8 74 00 00 00       	callq  ca0 <printf>
     c2c:	48 be aa 1c 00 00 00 	movabs $0x1caa,%rsi
     c33:	00 00 00 
     c36:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     c3d:	b0 00                	mov    $0x0,%al
     c3f:	e8 5c 00 00 00       	callq  ca0 <printf>
     c44:	48 be 0b 1b 00 00 00 	movabs $0x1b0b,%rsi
     c4b:	00 00 00 
     c4e:	8b 3c 25 40 20 00 00 	mov    0x2040,%edi
     c55:	b0 00                	mov    $0x0,%al
     c57:	e8 44 00 00 00       	callq  ca0 <printf>
     c5c:	e9 fb ff ff ff       	jmpq   c5c <racetest+0xec>
    } else {
     c61:	e9 08 00 00 00       	jmpq   c6e <racetest+0xfe>
      exit();
     c66:	e8 6d 0a 00 00       	callq  16d8 <exit>
     c6b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  }
     c6e:	e9 00 00 00 00       	jmpq   c73 <racetest+0x103>
  for(i = 0; i < 100; i++){
     c73:	8b 45 fc             	mov    -0x4(%rbp),%eax
     c76:	83 c0 01             	add    $0x1,%eax
     c79:	89 45 fc             	mov    %eax,-0x4(%rbp)
     c7c:	e9 fe fe ff ff       	jmpq   b7f <racetest+0xf>
     c81:	bf 01 00 00 00       	mov    $0x1,%edi
     c86:	48 be c4 1c 00 00 00 	movabs $0x1cc4,%rsi
     c8d:	00 00 00 
  printf(1, "racetest ok\n");
     c90:	b0 00                	mov    $0x0,%al
     c92:	e8 09 00 00 00       	callq  ca0 <printf>
}
     c97:	48 83 c4 10          	add    $0x10,%rsp
     c9b:	5d                   	pop    %rbp
     c9c:	c3                   	retq   
     c9d:	0f 1f 00             	nopl   (%rax)

0000000000000ca0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     ca0:	55                   	push   %rbp
     ca1:	48 89 e5             	mov    %rsp,%rbp
     ca4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     cab:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     caf:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     cb3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     cb7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     cbb:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     cbf:	89 7d fc             	mov    %edi,-0x4(%rbp)
     cc2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     cc6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     cca:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     cce:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     cd2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     cd6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     cdd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     ce3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     cea:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     cf1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cf5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     cf9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     cfd:	0f 84 f0 03 00 00    	je     10f3 <printf+0x453>
    c = fmt[i] & 0xff;
     d03:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d07:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     d0b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     d0f:	81 e2 ff 00 00 00    	and    $0xff,%edx
     d15:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     d18:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     d1c:	0f 85 32 00 00 00    	jne    d54 <printf+0xb4>
      if(c == '%'){
     d22:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     d26:	0f 85 13 00 00 00    	jne    d3f <printf+0x9f>
        state = '%';
     d2c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     d33:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     d3a:	e9 10 00 00 00       	jmpq   d4f <printf+0xaf>
        putc(fd, c);
     d3f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     d42:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     d45:	88 c1                	mov    %al,%cl
     d47:	0f be f1             	movsbl %cl,%esi
     d4a:	e8 b1 03 00 00       	callq  1100 <putc>
      }
    } else if(state == '%'){
     d4f:	e9 8c 03 00 00       	jmpq   10e0 <printf+0x440>
     d54:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     d58:	0f 85 7d 03 00 00    	jne    10db <printf+0x43b>
      if(c == 'l') {
     d5e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     d62:	0f 85 0c 00 00 00    	jne    d74 <printf+0xd4>
        lflag = 1;
     d68:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     d6f:	e9 71 03 00 00       	jmpq   10e5 <printf+0x445>
      } else if(c == 'd'){
     d74:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     d78:	0f 85 0e 01 00 00    	jne    e8c <printf+0x1ec>
        if (lflag == 1)
     d7e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     d82:	0f 85 79 00 00 00    	jne    e01 <printf+0x161>
     d88:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     d8c:	8b 7d fc             	mov    -0x4(%rbp),%edi
     d8f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     d92:	83 f9 28             	cmp    $0x28,%ecx
     d95:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     d99:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     d9c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     d9f:	0f 87 1f 00 00 00    	ja     dc4 <printf+0x124>
     da5:	8b 45 80             	mov    -0x80(%rbp),%eax
     da8:	48 63 c8             	movslq %eax,%rcx
     dab:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     daf:	48 03 4a 10          	add    0x10(%rdx),%rcx
     db3:	83 c0 08             	add    $0x8,%eax
     db6:	89 02                	mov    %eax,(%rdx)
     db8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     dbf:	e9 1a 00 00 00       	jmpq   dde <printf+0x13e>
     dc4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     dc8:	48 8b 48 08          	mov    0x8(%rax),%rcx
     dcc:	48 89 ca             	mov    %rcx,%rdx
     dcf:	48 83 c1 08          	add    $0x8,%rcx
     dd3:	48 89 48 08          	mov    %rcx,0x8(%rax)
     dd7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     dde:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     de5:	ba 0a 00 00 00       	mov    $0xa,%edx
     dea:	b9 01 00 00 00       	mov    $0x1,%ecx
     def:	48 8b 00             	mov    (%rax),%rax
     df2:	89 c6                	mov    %eax,%esi
     df4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     df7:	e8 34 03 00 00       	callq  1130 <printint64>
     dfc:	e9 86 00 00 00       	jmpq   e87 <printf+0x1e7>
     e01:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     e05:	8b 7d fc             	mov    -0x4(%rbp),%edi
     e08:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     e0b:	83 f9 28             	cmp    $0x28,%ecx
     e0e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     e15:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     e1b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     e21:	0f 87 25 00 00 00    	ja     e4c <printf+0x1ac>
     e27:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     e2d:	48 63 c8             	movslq %eax,%rcx
     e30:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     e37:	48 03 4a 10          	add    0x10(%rdx),%rcx
     e3b:	83 c0 08             	add    $0x8,%eax
     e3e:	89 02                	mov    %eax,(%rdx)
     e40:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     e47:	e9 1d 00 00 00       	jmpq   e69 <printf+0x1c9>
     e4c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     e53:	48 8b 48 08          	mov    0x8(%rax),%rcx
     e57:	48 89 ca             	mov    %rcx,%rdx
     e5a:	48 83 c1 08          	add    $0x8,%rcx
     e5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     e62:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     e69:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     e70:	ba 0a 00 00 00       	mov    $0xa,%edx
     e75:	b9 01 00 00 00       	mov    $0x1,%ecx
     e7a:	8b 30                	mov    (%rax),%esi
     e7c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     e82:	e8 a9 03 00 00       	callq  1230 <printint>
      } else if(c == 'x' || c == 'p'){
     e87:	e9 43 02 00 00       	jmpq   10cf <printf+0x42f>
     e8c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     e90:	0f 84 0a 00 00 00    	je     ea0 <printf+0x200>
     e96:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     e9a:	0f 85 1d 01 00 00    	jne    fbd <printf+0x31d>
        if (lflag == 1)
     ea0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     ea4:	0f 85 8b 00 00 00    	jne    f35 <printf+0x295>
     eaa:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     eae:	8b 7d fc             	mov    -0x4(%rbp),%edi
     eb1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     eb4:	83 f9 28             	cmp    $0x28,%ecx
     eb7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     ebe:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     ec4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     eca:	0f 87 25 00 00 00    	ja     ef5 <printf+0x255>
     ed0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     ed6:	48 63 c8             	movslq %eax,%rcx
     ed9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     ee0:	48 03 4a 10          	add    0x10(%rdx),%rcx
     ee4:	83 c0 08             	add    $0x8,%eax
     ee7:	89 02                	mov    %eax,(%rdx)
     ee9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     ef0:	e9 1d 00 00 00       	jmpq   f12 <printf+0x272>
     ef5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     efc:	48 8b 48 08          	mov    0x8(%rax),%rcx
     f00:	48 89 ca             	mov    %rcx,%rdx
     f03:	48 83 c1 08          	add    $0x8,%rcx
     f07:	48 89 48 08          	mov    %rcx,0x8(%rax)
     f0b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     f12:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     f19:	ba 10 00 00 00       	mov    $0x10,%edx
     f1e:	31 c9                	xor    %ecx,%ecx
     f20:	48 8b 00             	mov    (%rax),%rax
     f23:	89 c6                	mov    %eax,%esi
     f25:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     f2b:	e8 00 02 00 00       	callq  1130 <printint64>
     f30:	e9 83 00 00 00       	jmpq   fb8 <printf+0x318>
     f35:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     f39:	8b 7d fc             	mov    -0x4(%rbp),%edi
     f3c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     f3f:	83 f9 28             	cmp    $0x28,%ecx
     f42:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     f49:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     f4f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     f55:	0f 87 25 00 00 00    	ja     f80 <printf+0x2e0>
     f5b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     f61:	48 63 c8             	movslq %eax,%rcx
     f64:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     f6b:	48 03 4a 10          	add    0x10(%rdx),%rcx
     f6f:	83 c0 08             	add    $0x8,%eax
     f72:	89 02                	mov    %eax,(%rdx)
     f74:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     f7b:	e9 1d 00 00 00       	jmpq   f9d <printf+0x2fd>
     f80:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     f87:	48 8b 48 08          	mov    0x8(%rax),%rcx
     f8b:	48 89 ca             	mov    %rcx,%rdx
     f8e:	48 83 c1 08          	add    $0x8,%rcx
     f92:	48 89 48 08          	mov    %rcx,0x8(%rax)
     f96:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     f9d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     fa4:	ba 10 00 00 00       	mov    $0x10,%edx
     fa9:	31 c9                	xor    %ecx,%ecx
     fab:	8b 30                	mov    (%rax),%esi
     fad:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     fb3:	e8 78 02 00 00       	callq  1230 <printint>
      } else if(c == 's'){
     fb8:	e9 0d 01 00 00       	jmpq   10ca <printf+0x42a>
     fbd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     fc1:	0f 85 bc 00 00 00    	jne    1083 <printf+0x3e3>
     fc7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     fcb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     fce:	83 f9 28             	cmp    $0x28,%ecx
     fd1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     fd8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     fde:	0f 87 25 00 00 00    	ja     1009 <printf+0x369>
     fe4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     fea:	48 63 c8             	movslq %eax,%rcx
     fed:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     ff4:	48 03 4a 10          	add    0x10(%rdx),%rcx
     ff8:	83 c0 08             	add    $0x8,%eax
     ffb:	89 02                	mov    %eax,(%rdx)
     ffd:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
    1004:	e9 1d 00 00 00       	jmpq   1026 <printf+0x386>
    1009:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    1010:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1014:	48 89 ca             	mov    %rcx,%rdx
    1017:	48 83 c1 08          	add    $0x8,%rcx
    101b:	48 89 48 08          	mov    %rcx,0x8(%rax)
    101f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
    1026:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    102d:	48 8b 00             	mov    (%rax),%rax
    1030:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1034:	48 83 f8 00          	cmp    $0x0,%rax
    1038:	0f 85 0e 00 00 00    	jne    104c <printf+0x3ac>
    103e:	48 b8 90 1d 00 00 00 	movabs $0x1d90,%rax
    1045:	00 00 00 
          s = "(null)";
    1048:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
    104c:	e9 00 00 00 00       	jmpq   1051 <printf+0x3b1>
    1051:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1055:	80 38 00             	cmpb   $0x0,(%rax)
    1058:	0f 84 20 00 00 00    	je     107e <printf+0x3de>
          putc(fd, *s);
    105e:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1061:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1065:	0f be 30             	movsbl (%rax),%esi
    1068:	e8 93 00 00 00       	callq  1100 <putc>
        for(; *s; s++)
    106d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1071:	48 83 c0 01          	add    $0x1,%rax
    1075:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1079:	e9 d3 ff ff ff       	jmpq   1051 <printf+0x3b1>
      } else if(c == '%'){
    107e:	e9 42 00 00 00       	jmpq   10c5 <printf+0x425>
    1083:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    1087:	0f 85 15 00 00 00    	jne    10a2 <printf+0x402>
        putc(fd, c);
    108d:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1090:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1093:	88 c1                	mov    %al,%cl
    1095:	0f be f1             	movsbl %cl,%esi
    1098:	e8 63 00 00 00       	callq  1100 <putc>
      } else {
    109d:	e9 1e 00 00 00       	jmpq   10c0 <printf+0x420>
    10a2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    10a7:	8b 7d fc             	mov    -0x4(%rbp),%edi
    10aa:	e8 51 00 00 00       	callq  1100 <putc>
        putc(fd, c);
    10af:	8b 7d fc             	mov    -0x4(%rbp),%edi
    10b2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    10b5:	40 88 f0             	mov    %sil,%al
    10b8:	0f be f0             	movsbl %al,%esi
    10bb:	e8 40 00 00 00       	callq  1100 <putc>
    10c0:	e9 00 00 00 00       	jmpq   10c5 <printf+0x425>
    10c5:	e9 00 00 00 00       	jmpq   10ca <printf+0x42a>
    10ca:	e9 00 00 00 00       	jmpq   10cf <printf+0x42f>
    10cf:	e9 00 00 00 00       	jmpq   10d4 <printf+0x434>
      }
      state = 0;
    10d4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    10db:	e9 00 00 00 00       	jmpq   10e0 <printf+0x440>
    }
  }
    10e0:	e9 00 00 00 00       	jmpq   10e5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
    10e5:	8b 45 e0             	mov    -0x20(%rbp),%eax
    10e8:	83 c0 01             	add    $0x1,%eax
    10eb:	89 45 e0             	mov    %eax,-0x20(%rbp)
    10ee:	e9 fe fb ff ff       	jmpq   cf1 <printf+0x51>

  va_end(valist);
}
    10f3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
    10fa:	5d                   	pop    %rbp
    10fb:	c3                   	retq   
    10fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001100 <putc>:
{
    1100:	55                   	push   %rbp
    1101:	48 89 e5             	mov    %rsp,%rbp
    1104:	48 83 ec 10          	sub    $0x10,%rsp
    1108:	40 88 f0             	mov    %sil,%al
    110b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
    110f:	ba 01 00 00 00       	mov    $0x1,%edx
    1114:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1117:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
    111a:	8b 7d fc             	mov    -0x4(%rbp),%edi
    111d:	e8 d6 05 00 00       	callq  16f8 <write>
}
    1122:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1125:	48 83 c4 10          	add    $0x10,%rsp
    1129:	5d                   	pop    %rbp
    112a:	c3                   	retq   
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <printint64>:
{
    1130:	55                   	push   %rbp
    1131:	48 89 e5             	mov    %rsp,%rbp
    1134:	48 83 ec 50          	sub    $0x50,%rsp
    1138:	89 7d fc             	mov    %edi,-0x4(%rbp)
    113b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    113e:	89 55 f4             	mov    %edx,-0xc(%rbp)
    1141:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
    1144:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1148:	0f 84 30 00 00 00    	je     117e <printint64+0x4e>
    114e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1152:	0f 9c c0             	setl   %al
    1155:	88 c1                	mov    %al,%cl
    1157:	80 e1 01             	and    $0x1,%cl
    115a:	0f b6 d1             	movzbl %cl,%edx
    115d:	89 55 f0             	mov    %edx,-0x10(%rbp)
    1160:	a8 01                	test   $0x1,%al
    1162:	0f 85 05 00 00 00    	jne    116d <printint64+0x3d>
    1168:	e9 11 00 00 00       	jmpq   117e <printint64+0x4e>
    116d:	31 c0                	xor    %eax,%eax
    x = -xx;
    116f:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1172:	48 63 c8             	movslq %eax,%rcx
    1175:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    1179:	e9 08 00 00 00       	jmpq   1186 <printint64+0x56>
    x = xx;
    117e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
    1182:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
    1186:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
    118d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1191:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1195:	31 d2                	xor    %edx,%edx
    1197:	48 f7 f1             	div    %rcx
    119a:	40 8a 34 15 50 20 00 	mov    0x2050(,%rdx,1),%sil
    11a1:	00 
    11a2:	8b 7d cc             	mov    -0x34(%rbp),%edi
    11a5:	41 89 f8             	mov    %edi,%r8d
    11a8:	41 83 c0 01          	add    $0x1,%r8d
    11ac:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
    11b0:	48 63 cf             	movslq %edi,%rcx
    11b3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
    11b8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
    11bc:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    11c0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    11c4:	48 89 c8             	mov    %rcx,%rax
    11c7:	31 d2                	xor    %edx,%edx
    11c9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    11cd:	48 f7 f1             	div    %rcx
    11d0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    11d4:	48 83 f8 00          	cmp    $0x0,%rax
    11d8:	0f 85 af ff ff ff    	jne    118d <printint64+0x5d>
  if(sgn)
    11de:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    11e2:	0f 84 13 00 00 00    	je     11fb <printint64+0xcb>
    buf[i++] = '-';
    11e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
    11eb:	89 c1                	mov    %eax,%ecx
    11ed:	83 c1 01             	add    $0x1,%ecx
    11f0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
    11f3:	48 63 d0             	movslq %eax,%rdx
    11f6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
    11fb:	e9 00 00 00 00       	jmpq   1200 <printint64+0xd0>
    1200:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1203:	83 c0 ff             	add    $0xffffffff,%eax
    1206:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1209:	83 f8 00             	cmp    $0x0,%eax
    120c:	0f 8c 16 00 00 00    	jl     1228 <printint64+0xf8>
    putc(fd, buf[i]);
    1212:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1215:	48 63 45 cc          	movslq -0x34(%rbp),%rax
    1219:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
    121e:	e8 dd fe ff ff       	callq  1100 <putc>
  while(--i >= 0)
    1223:	e9 d8 ff ff ff       	jmpq   1200 <printint64+0xd0>
}
    1228:	48 83 c4 50          	add    $0x50,%rsp
    122c:	5d                   	pop    %rbp
    122d:	c3                   	retq   
    122e:	66 90                	xchg   %ax,%ax

0000000000001230 <printint>:
{
    1230:	55                   	push   %rbp
    1231:	48 89 e5             	mov    %rsp,%rbp
    1234:	48 83 ec 30          	sub    $0x30,%rsp
    1238:	89 7d fc             	mov    %edi,-0x4(%rbp)
    123b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    123e:	89 55 f4             	mov    %edx,-0xc(%rbp)
    1241:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
    1244:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
    124b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    124f:	0f 84 1e 00 00 00    	je     1273 <printint+0x43>
    1255:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1259:	0f 8d 14 00 00 00    	jge    1273 <printint+0x43>
    125f:	31 c0                	xor    %eax,%eax
    neg = 1;
    1261:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
    1268:	2b 45 f8             	sub    -0x8(%rbp),%eax
    126b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
    126e:	e9 06 00 00 00       	jmpq   1279 <printint+0x49>
    x = xx;
    1273:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1276:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
    1279:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
    1280:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1283:	31 d2                	xor    %edx,%edx
    1285:	f7 75 f4             	divl   -0xc(%rbp)
    1288:	89 d2                	mov    %edx,%edx
    128a:	89 d1                	mov    %edx,%ecx
    128c:	40 8a 34 0d 70 20 00 	mov    0x2070(,%rcx,1),%sil
    1293:	00 
    1294:	8b 55 dc             	mov    -0x24(%rbp),%edx
    1297:	89 d7                	mov    %edx,%edi
    1299:	83 c7 01             	add    $0x1,%edi
    129c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    129f:	48 63 ca             	movslq %edx,%rcx
    12a2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
    12a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
    12aa:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
    12ad:	89 45 d0             	mov    %eax,-0x30(%rbp)
    12b0:	89 c8                	mov    %ecx,%eax
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
    12b7:	f7 f1                	div    %ecx
    12b9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    12bc:	83 f8 00             	cmp    $0x0,%eax
    12bf:	0f 85 bb ff ff ff    	jne    1280 <printint+0x50>
  if(neg)
    12c5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    12c9:	0f 84 13 00 00 00    	je     12e2 <printint+0xb2>
    buf[i++] = '-';
    12cf:	8b 45 dc             	mov    -0x24(%rbp),%eax
    12d2:	89 c1                	mov    %eax,%ecx
    12d4:	83 c1 01             	add    $0x1,%ecx
    12d7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    12da:	48 63 d0             	movslq %eax,%rdx
    12dd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
    12e2:	e9 00 00 00 00       	jmpq   12e7 <printint+0xb7>
    12e7:	8b 45 dc             	mov    -0x24(%rbp),%eax
    12ea:	83 c0 ff             	add    $0xffffffff,%eax
    12ed:	89 45 dc             	mov    %eax,-0x24(%rbp)
    12f0:	83 f8 00             	cmp    $0x0,%eax
    12f3:	0f 8c 16 00 00 00    	jl     130f <printint+0xdf>
    putc(fd, buf[i]);
    12f9:	8b 7d fc             	mov    -0x4(%rbp),%edi
    12fc:	48 63 45 dc          	movslq -0x24(%rbp),%rax
    1300:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
    1305:	e8 f6 fd ff ff       	callq  1100 <putc>
  while(--i >= 0)
    130a:	e9 d8 ff ff ff       	jmpq   12e7 <printint+0xb7>
}
    130f:	48 83 c4 30          	add    $0x30,%rsp
    1313:	5d                   	pop    %rbp
    1314:	c3                   	retq   
    1315:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    131c:	00 00 00 
    131f:	90                   	nop

0000000000001320 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
    1320:	55                   	push   %rbp
    1321:	48 89 e5             	mov    %rsp,%rbp
    1324:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1328:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
    132c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1330:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
    1334:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1338:	48 89 c1             	mov    %rax,%rcx
    133b:	48 83 c1 01          	add    $0x1,%rcx
    133f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    1343:	8a 10                	mov    (%rax),%dl
    1345:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1349:	48 89 c1             	mov    %rax,%rcx
    134c:	48 83 c1 01          	add    $0x1,%rcx
    1350:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    1354:	88 10                	mov    %dl,(%rax)
    1356:	0f be f2             	movsbl %dl,%esi
    1359:	83 fe 00             	cmp    $0x0,%esi
    135c:	0f 84 05 00 00 00    	je     1367 <strcpy+0x47>
    1362:	e9 cd ff ff ff       	jmpq   1334 <strcpy+0x14>
    ;
  return os;
    1367:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    136b:	5d                   	pop    %rbp
    136c:	c3                   	retq   
    136d:	0f 1f 00             	nopl   (%rax)

0000000000001370 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
    1370:	55                   	push   %rbp
    1371:	48 89 e5             	mov    %rsp,%rbp
    1374:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1378:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    137c:	31 c0                	xor    %eax,%eax
    137e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
    1380:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1384:	0f be 02             	movsbl (%rdx),%eax
    1387:	83 f8 00             	cmp    $0x0,%eax
    138a:	88 4d ef             	mov    %cl,-0x11(%rbp)
    138d:	0f 84 18 00 00 00    	je     13ab <strcmp+0x3b>
    1393:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1397:	0f be 08             	movsbl (%rax),%ecx
    139a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    139e:	0f be 10             	movsbl (%rax),%edx
    13a1:	39 d1                	cmp    %edx,%ecx
    13a3:	40 0f 94 c6          	sete   %sil
    13a7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
    13ab:	8a 45 ef             	mov    -0x11(%rbp),%al
    13ae:	a8 01                	test   $0x1,%al
    13b0:	0f 85 05 00 00 00    	jne    13bb <strcmp+0x4b>
    13b6:	e9 1d 00 00 00       	jmpq   13d8 <strcmp+0x68>
    p++, q++;
    13bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13bf:	48 83 c0 01          	add    $0x1,%rax
    13c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13cb:	48 83 c0 01          	add    $0x1,%rax
    13cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
    13d3:	e9 a4 ff ff ff       	jmpq   137c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    13d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13dc:	0f b6 08             	movzbl (%rax),%ecx
    13df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13e3:	0f b6 10             	movzbl (%rax),%edx
    13e6:	29 d1                	sub    %edx,%ecx
    13e8:	89 c8                	mov    %ecx,%eax
    13ea:	5d                   	pop    %rbp
    13eb:	c3                   	retq   
    13ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000013f0 <strlen>:
}

uint
strlen(char *s)
{
    13f0:	55                   	push   %rbp
    13f1:	48 89 e5             	mov    %rsp,%rbp
    13f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
    13f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    13ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1403:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1407:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    140b:	0f 84 13 00 00 00    	je     1424 <strlen+0x34>
    1411:	e9 00 00 00 00       	jmpq   1416 <strlen+0x26>
    1416:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1419:	83 c0 01             	add    $0x1,%eax
    141c:	89 45 f4             	mov    %eax,-0xc(%rbp)
    141f:	e9 db ff ff ff       	jmpq   13ff <strlen+0xf>
    ;
  return n;
    1424:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1427:	5d                   	pop    %rbp
    1428:	c3                   	retq   
    1429:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001430 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
    1430:	55                   	push   %rbp
    1431:	48 89 e5             	mov    %rsp,%rbp
    1434:	48 83 ec 10          	sub    $0x10,%rsp
    1438:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    143c:	89 75 f4             	mov    %esi,-0xc(%rbp)
    143f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
    1442:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1446:	8b 75 f4             	mov    -0xc(%rbp),%esi
    1449:	8b 55 f0             	mov    -0x10(%rbp),%edx
    144c:	e8 0f 00 00 00       	callq  1460 <stosb>
  return dst;
    1451:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1455:	48 83 c4 10          	add    $0x10,%rsp
    1459:	5d                   	pop    %rbp
    145a:	c3                   	retq   
    145b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001460 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1460:	55                   	push   %rbp
    1461:	48 89 e5             	mov    %rsp,%rbp
    1464:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1468:	89 75 f4             	mov    %esi,-0xc(%rbp)
    146b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
    146e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1472:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1475:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
    1478:	89 d1                	mov    %edx,%ecx
    147a:	fc                   	cld    
    147b:	f3 aa                	rep stos %al,%es:(%rdi)
    147d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1481:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
    1484:	5d                   	pop    %rbp
    1485:	c3                   	retq   
    1486:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    148d:	00 00 00 

0000000000001490 <strchr>:
}

char*
strchr(const char *s, char c)
{
    1490:	55                   	push   %rbp
    1491:	48 89 e5             	mov    %rsp,%rbp
    1494:	40 88 f0             	mov    %sil,%al
    1497:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    149b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
    149e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14a2:	80 38 00             	cmpb   $0x0,(%rax)
    14a5:	0f 84 36 00 00 00    	je     14e1 <strchr+0x51>
    if(*s == c)
    14ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14af:	0f be 08             	movsbl (%rax),%ecx
    14b2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
    14b6:	39 d1                	cmp    %edx,%ecx
    14b8:	0f 85 0d 00 00 00    	jne    14cb <strchr+0x3b>
      return (char*)s;
    14be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    14c6:	e9 1e 00 00 00       	jmpq   14e9 <strchr+0x59>
    if(*s == c)
    14cb:	e9 00 00 00 00       	jmpq   14d0 <strchr+0x40>
  for(; *s; s++)
    14d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14d4:	48 83 c0 01          	add    $0x1,%rax
    14d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    14dc:	e9 bd ff ff ff       	jmpq   149e <strchr+0xe>
  return 0;
    14e1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    14e8:	00 
}
    14e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14ed:	5d                   	pop    %rbp
    14ee:	c3                   	retq   
    14ef:	90                   	nop

00000000000014f0 <gets>:

char*
gets(char *buf, int max)
{
    14f0:	55                   	push   %rbp
    14f1:	48 89 e5             	mov    %rsp,%rbp
    14f4:	48 83 ec 20          	sub    $0x20,%rsp
    14f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14fc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14ff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1506:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1509:	83 c0 01             	add    $0x1,%eax
    150c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    150f:	0f 8d 5e 00 00 00    	jge    1573 <gets+0x83>
    1515:	31 ff                	xor    %edi,%edi
    1517:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
    151b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
    1520:	e8 cb 01 00 00       	callq  16f0 <read>
    1525:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
    1528:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    152c:	0f 8d 05 00 00 00    	jge    1537 <gets+0x47>
      break;
    1532:	e9 3c 00 00 00       	jmpq   1573 <gets+0x83>
    buf[i++] = c;
    1537:	8a 45 eb             	mov    -0x15(%rbp),%al
    153a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    153e:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1541:	89 d6                	mov    %edx,%esi
    1543:	83 c6 01             	add    $0x1,%esi
    1546:	89 75 f0             	mov    %esi,-0x10(%rbp)
    1549:	48 63 fa             	movslq %edx,%rdi
    154c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
    154f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
    1553:	83 fa 0a             	cmp    $0xa,%edx
    1556:	0f 84 0d 00 00 00    	je     1569 <gets+0x79>
    155c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
    1560:	83 f8 0d             	cmp    $0xd,%eax
    1563:	0f 85 05 00 00 00    	jne    156e <gets+0x7e>
      break;
    1569:	e9 05 00 00 00       	jmpq   1573 <gets+0x83>
  for(i=0; i+1 < max; ){
    156e:	e9 93 ff ff ff       	jmpq   1506 <gets+0x16>
  }
  buf[i] = '\0';
    1573:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1577:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
    157b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
    157f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1583:	48 83 c4 20          	add    $0x20,%rsp
    1587:	5d                   	pop    %rbp
    1588:	c3                   	retq   
    1589:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001590 <stat>:
}

int
stat(char *n, struct stat *st)
{
    1590:	55                   	push   %rbp
    1591:	48 89 e5             	mov    %rsp,%rbp
    1594:	48 83 ec 30          	sub    $0x30,%rsp
    1598:	31 c0                	xor    %eax,%eax
    159a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    159e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    15a2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    15a6:	89 c6                	mov    %eax,%esi
    15a8:	e8 6b 01 00 00       	callq  1718 <open>
    15ad:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
    15b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    15b4:	0f 8d 0c 00 00 00    	jge    15c6 <stat+0x36>
    return -1;
    15ba:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    15c1:	e9 20 00 00 00       	jmpq   15e6 <stat+0x56>
  r = fstat(fd, st);
    15c6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    15c9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    15cd:	e8 5e 01 00 00       	callq  1730 <fstat>
    15d2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
    15d5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    15d8:	e8 23 01 00 00       	callq  1700 <close>
  return r;
    15dd:	8b 7d e0             	mov    -0x20(%rbp),%edi
    15e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15e3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
    15e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15e9:	48 83 c4 30          	add    $0x30,%rsp
    15ed:	5d                   	pop    %rbp
    15ee:	c3                   	retq   
    15ef:	90                   	nop

00000000000015f0 <atoi>:

int
atoi(const char *s)
{
    15f0:	55                   	push   %rbp
    15f1:	48 89 e5             	mov    %rsp,%rbp
    15f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
    15f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    15ff:	31 c0                	xor    %eax,%eax
    1601:	88 c1                	mov    %al,%cl
    1603:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
    1608:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    160c:	0f be 32             	movsbl (%rdx),%esi
    160f:	39 f0                	cmp    %esi,%eax
    1611:	88 4d f3             	mov    %cl,-0xd(%rbp)
    1614:	0f 8f 10 00 00 00    	jg     162a <atoi+0x3a>
    161a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    161e:	0f be 08             	movsbl (%rax),%ecx
    1621:	83 f9 39             	cmp    $0x39,%ecx
    1624:	0f 9e c2             	setle  %dl
    1627:	88 55 f3             	mov    %dl,-0xd(%rbp)
    162a:	8a 45 f3             	mov    -0xd(%rbp),%al
    162d:	a8 01                	test   $0x1,%al
    162f:	0f 85 05 00 00 00    	jne    163a <atoi+0x4a>
    1635:	e9 23 00 00 00       	jmpq   165d <atoi+0x6d>
    n = n*10 + *s++ - '0';
    163a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
    163e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1642:	48 89 ca             	mov    %rcx,%rdx
    1645:	48 83 c2 01          	add    $0x1,%rdx
    1649:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    164d:	0f be 31             	movsbl (%rcx),%esi
    1650:	01 f0                	add    %esi,%eax
    1652:	83 e8 30             	sub    $0x30,%eax
    1655:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
    1658:	e9 a2 ff ff ff       	jmpq   15ff <atoi+0xf>
  return n;
    165d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1660:	5d                   	pop    %rbp
    1661:	c3                   	retq   
    1662:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1669:	1f 84 00 00 00 00 00 

0000000000001670 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1670:	55                   	push   %rbp
    1671:	48 89 e5             	mov    %rsp,%rbp
    1674:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1678:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    167c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
    167f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1683:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
    1687:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    168b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
    168f:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1692:	89 c1                	mov    %eax,%ecx
    1694:	83 c1 ff             	add    $0xffffffff,%ecx
    1697:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    169a:	83 f8 00             	cmp    $0x0,%eax
    169d:	0f 8e 27 00 00 00    	jle    16ca <memmove+0x5a>
    *dst++ = *src++;
    16a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    16a7:	48 89 c1             	mov    %rax,%rcx
    16aa:	48 83 c1 01          	add    $0x1,%rcx
    16ae:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    16b2:	8a 10                	mov    (%rax),%dl
    16b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    16b8:	48 89 c1             	mov    %rax,%rcx
    16bb:	48 83 c1 01          	add    $0x1,%rcx
    16bf:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    16c3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
    16c5:	e9 c5 ff ff ff       	jmpq   168f <memmove+0x1f>
  return vdst;
    16ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16ce:	5d                   	pop    %rbp
    16cf:	c3                   	retq   

00000000000016d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    16d0:	b8 01 00 00 00       	mov    $0x1,%eax
    16d5:	cd 40                	int    $0x40
    16d7:	c3                   	retq   

00000000000016d8 <exit>:
SYSCALL(exit)
    16d8:	b8 02 00 00 00       	mov    $0x2,%eax
    16dd:	cd 40                	int    $0x40
    16df:	c3                   	retq   

00000000000016e0 <wait>:
SYSCALL(wait)
    16e0:	b8 03 00 00 00       	mov    $0x3,%eax
    16e5:	cd 40                	int    $0x40
    16e7:	c3                   	retq   

00000000000016e8 <pipe>:
SYSCALL(pipe)
    16e8:	b8 04 00 00 00       	mov    $0x4,%eax
    16ed:	cd 40                	int    $0x40
    16ef:	c3                   	retq   

00000000000016f0 <read>:
SYSCALL(read)
    16f0:	b8 05 00 00 00       	mov    $0x5,%eax
    16f5:	cd 40                	int    $0x40
    16f7:	c3                   	retq   

00000000000016f8 <write>:
SYSCALL(write)
    16f8:	b8 10 00 00 00       	mov    $0x10,%eax
    16fd:	cd 40                	int    $0x40
    16ff:	c3                   	retq   

0000000000001700 <close>:
SYSCALL(close)
    1700:	b8 15 00 00 00       	mov    $0x15,%eax
    1705:	cd 40                	int    $0x40
    1707:	c3                   	retq   

0000000000001708 <kill>:
SYSCALL(kill)
    1708:	b8 06 00 00 00       	mov    $0x6,%eax
    170d:	cd 40                	int    $0x40
    170f:	c3                   	retq   

0000000000001710 <exec>:
SYSCALL(exec)
    1710:	b8 07 00 00 00       	mov    $0x7,%eax
    1715:	cd 40                	int    $0x40
    1717:	c3                   	retq   

0000000000001718 <open>:
SYSCALL(open)
    1718:	b8 0f 00 00 00       	mov    $0xf,%eax
    171d:	cd 40                	int    $0x40
    171f:	c3                   	retq   

0000000000001720 <mknod>:
SYSCALL(mknod)
    1720:	b8 11 00 00 00       	mov    $0x11,%eax
    1725:	cd 40                	int    $0x40
    1727:	c3                   	retq   

0000000000001728 <unlink>:
SYSCALL(unlink)
    1728:	b8 12 00 00 00       	mov    $0x12,%eax
    172d:	cd 40                	int    $0x40
    172f:	c3                   	retq   

0000000000001730 <fstat>:
SYSCALL(fstat)
    1730:	b8 08 00 00 00       	mov    $0x8,%eax
    1735:	cd 40                	int    $0x40
    1737:	c3                   	retq   

0000000000001738 <link>:
SYSCALL(link)
    1738:	b8 13 00 00 00       	mov    $0x13,%eax
    173d:	cd 40                	int    $0x40
    173f:	c3                   	retq   

0000000000001740 <mkdir>:
SYSCALL(mkdir)
    1740:	b8 14 00 00 00       	mov    $0x14,%eax
    1745:	cd 40                	int    $0x40
    1747:	c3                   	retq   

0000000000001748 <chdir>:
SYSCALL(chdir)
    1748:	b8 09 00 00 00       	mov    $0x9,%eax
    174d:	cd 40                	int    $0x40
    174f:	c3                   	retq   

0000000000001750 <dup>:
SYSCALL(dup)
    1750:	b8 0a 00 00 00       	mov    $0xa,%eax
    1755:	cd 40                	int    $0x40
    1757:	c3                   	retq   

0000000000001758 <getpid>:
SYSCALL(getpid)
    1758:	b8 0b 00 00 00       	mov    $0xb,%eax
    175d:	cd 40                	int    $0x40
    175f:	c3                   	retq   

0000000000001760 <sbrk>:
SYSCALL(sbrk)
    1760:	b8 0c 00 00 00       	mov    $0xc,%eax
    1765:	cd 40                	int    $0x40
    1767:	c3                   	retq   

0000000000001768 <sleep>:
SYSCALL(sleep)
    1768:	b8 0d 00 00 00       	mov    $0xd,%eax
    176d:	cd 40                	int    $0x40
    176f:	c3                   	retq   

0000000000001770 <uptime>:
SYSCALL(uptime)
    1770:	b8 0e 00 00 00       	mov    $0xe,%eax
    1775:	cd 40                	int    $0x40
    1777:	c3                   	retq   

0000000000001778 <sysinfo>:
SYSCALL(sysinfo)
    1778:	b8 16 00 00 00       	mov    $0x16,%eax
    177d:	cd 40                	int    $0x40
    177f:	c3                   	retq   

0000000000001780 <mmap>:
SYSCALL(mmap)
    1780:	b8 17 00 00 00       	mov    $0x17,%eax
    1785:	cd 40                	int    $0x40
    1787:	c3                   	retq   

0000000000001788 <munmap>:
SYSCALL(munmap)
    1788:	b8 18 00 00 00       	mov    $0x18,%eax
    178d:	cd 40                	int    $0x40
    178f:	c3                   	retq   

0000000000001790 <crashn>:
SYSCALL(crashn)
    1790:	b8 19 00 00 00       	mov    $0x19,%eax
    1795:	cd 40                	int    $0x40
    1797:	c3                   	retq   
    1798:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    179f:	00 

00000000000017a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    17a0:	55                   	push   %rbp
    17a1:	48 89 e5             	mov    %rsp,%rbp
    17a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    17a8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    17ac:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    17b0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17b4:	48 8b 3c 25 88 20 00 	mov    0x2088,%rdi
    17bb:	00 
    17bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    17c0:	31 c0                	xor    %eax,%eax
    17c2:	88 c1                	mov    %al,%cl
    17c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    17c8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    17cc:	88 4d e7             	mov    %cl,-0x19(%rbp)
    17cf:	0f 86 11 00 00 00    	jbe    17e6 <free+0x46>
    17d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    17d9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    17dd:	48 3b 01             	cmp    (%rcx),%rax
    17e0:	0f 92 c2             	setb   %dl
    17e3:	88 55 e7             	mov    %dl,-0x19(%rbp)
    17e6:	8a 45 e7             	mov    -0x19(%rbp),%al
    17e9:	34 ff                	xor    $0xff,%al
    17eb:	a8 01                	test   $0x1,%al
    17ed:	0f 85 05 00 00 00    	jne    17f8 <free+0x58>
    17f3:	e9 4a 00 00 00       	jmpq   1842 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17fc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1800:	48 3b 01             	cmp    (%rcx),%rax
    1803:	0f 82 24 00 00 00    	jb     182d <free+0x8d>
    1809:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    180d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1811:	0f 87 11 00 00 00    	ja     1828 <free+0x88>
    1817:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    181b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    181f:	48 3b 01             	cmp    (%rcx),%rax
    1822:	0f 83 05 00 00 00    	jae    182d <free+0x8d>
      break;
    1828:	e9 15 00 00 00       	jmpq   1842 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    182d:	e9 00 00 00 00       	jmpq   1832 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1832:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1836:	48 8b 00             	mov    (%rax),%rax
    1839:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    183d:	e9 7e ff ff ff       	jmpq   17c0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1842:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1846:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    184a:	8b 51 08             	mov    0x8(%rcx),%edx
    184d:	89 d1                	mov    %edx,%ecx
    184f:	48 c1 e1 04          	shl    $0x4,%rcx
    1853:	48 01 c8             	add    %rcx,%rax
    1856:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    185a:	48 3b 01             	cmp    (%rcx),%rax
    185d:	0f 85 2a 00 00 00    	jne    188d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1863:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1867:	48 8b 00             	mov    (%rax),%rax
    186a:	8b 48 08             	mov    0x8(%rax),%ecx
    186d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1871:	03 48 08             	add    0x8(%rax),%ecx
    1874:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    187b:	48 8b 00             	mov    (%rax),%rax
    187e:	48 8b 00             	mov    (%rax),%rax
    1881:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1885:	48 89 02             	mov    %rax,(%rdx)
  } else
    1888:	e9 0e 00 00 00       	jmpq   189b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    188d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1891:	48 8b 00             	mov    (%rax),%rax
    1894:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1898:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    189b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    189f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    18a3:	8b 51 08             	mov    0x8(%rcx),%edx
    18a6:	89 d1                	mov    %edx,%ecx
    18a8:	48 c1 e1 04          	shl    $0x4,%rcx
    18ac:	48 01 c8             	add    %rcx,%rax
    18af:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    18b3:	0f 85 24 00 00 00    	jne    18dd <free+0x13d>
    p->s.size += bp->s.size;
    18b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    18bd:	8b 48 08             	mov    0x8(%rax),%ecx
    18c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    18c4:	03 48 08             	add    0x8(%rax),%ecx
    18c7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    18ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    18ce:	48 8b 00             	mov    (%rax),%rax
    18d1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    18d5:	48 89 02             	mov    %rax,(%rdx)
  } else
    18d8:	e9 0b 00 00 00       	jmpq   18e8 <free+0x148>
    p->s.ptr = bp;
    18dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    18e1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    18e5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    18e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    18ec:	48 89 04 25 88 20 00 	mov    %rax,0x2088
    18f3:	00 
}
    18f4:	5d                   	pop    %rbp
    18f5:	c3                   	retq   
    18f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    18fd:	00 00 00 

0000000000001900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1900:	55                   	push   %rbp
    1901:	48 89 e5             	mov    %rsp,%rbp
    1904:	48 83 ec 30          	sub    $0x30,%rsp
    1908:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    190b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    190e:	89 f8                	mov    %edi,%eax
    1910:	48 83 c0 10          	add    $0x10,%rax
    1914:	48 83 e8 01          	sub    $0x1,%rax
    1918:	48 c1 e8 04          	shr    $0x4,%rax
    191c:	48 83 c0 01          	add    $0x1,%rax
    1920:	89 c7                	mov    %eax,%edi
    1922:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1925:	48 8b 04 25 88 20 00 	mov    0x2088,%rax
    192c:	00 
    192d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1931:	48 83 f8 00          	cmp    $0x0,%rax
    1935:	0f 85 29 00 00 00    	jne    1964 <malloc+0x64>
    193b:	48 b8 90 20 00 00 00 	movabs $0x2090,%rax
    1942:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1945:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1949:	48 89 04 25 88 20 00 	mov    %rax,0x2088
    1950:	00 
    1951:	48 89 04 25 90 20 00 	mov    %rax,0x2090
    1958:	00 
    base.s.size = 0;
    1959:	c7 04 25 98 20 00 00 	movl   $0x0,0x2098
    1960:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1964:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1968:	48 8b 00             	mov    (%rax),%rax
    196b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    196f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1973:	8b 48 08             	mov    0x8(%rax),%ecx
    1976:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1979:	0f 82 73 00 00 00    	jb     19f2 <malloc+0xf2>
      if(p->s.size == nunits)
    197f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1983:	8b 48 08             	mov    0x8(%rax),%ecx
    1986:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1989:	0f 85 13 00 00 00    	jne    19a2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    198f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1993:	48 8b 00             	mov    (%rax),%rax
    1996:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    199a:	48 89 01             	mov    %rax,(%rcx)
    199d:	e9 33 00 00 00       	jmpq   19d5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    19a2:	8b 45 dc             	mov    -0x24(%rbp),%eax
    19a5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    19a9:	8b 51 08             	mov    0x8(%rcx),%edx
    19ac:	29 c2                	sub    %eax,%edx
    19ae:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    19b1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    19b5:	8b 41 08             	mov    0x8(%rcx),%eax
    19b8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    19bc:	89 c0                	mov    %eax,%eax
    19be:	89 c6                	mov    %eax,%esi
    19c0:	48 c1 e6 04          	shl    $0x4,%rsi
    19c4:	48 01 f1             	add    %rsi,%rcx
    19c7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    19cb:	8b 45 dc             	mov    -0x24(%rbp),%eax
    19ce:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    19d2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    19d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    19d9:	48 89 04 25 88 20 00 	mov    %rax,0x2088
    19e0:	00 
      return (void*)(p + 1);
    19e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19e5:	48 83 c0 10          	add    $0x10,%rax
    19e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    19ed:	e9 57 00 00 00       	jmpq   1a49 <malloc+0x149>
    }
    if(p == freep)
    19f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19f6:	48 3b 04 25 88 20 00 	cmp    0x2088,%rax
    19fd:	00 
    19fe:	0f 85 28 00 00 00    	jne    1a2c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    1a04:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1a07:	e8 54 00 00 00       	callq  1a60 <morecore>
    1a0c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1a10:	48 83 f8 00          	cmp    $0x0,%rax
    1a14:	0f 85 0d 00 00 00    	jne    1a27 <malloc+0x127>
        return 0;
    1a1a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1a21:	00 
    1a22:	e9 22 00 00 00       	jmpq   1a49 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1a27:	e9 00 00 00 00       	jmpq   1a2c <malloc+0x12c>
  }
    1a2c:	e9 00 00 00 00       	jmpq   1a31 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a35:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1a39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a3d:	48 8b 00             	mov    (%rax),%rax
    1a40:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1a44:	e9 26 ff ff ff       	jmpq   196f <malloc+0x6f>
    1a49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a4d:	48 83 c4 30          	add    $0x30,%rsp
    1a51:	5d                   	pop    %rbp
    1a52:	c3                   	retq   
    1a53:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1a5a:	84 00 00 00 00 00 

0000000000001a60 <morecore>:
{
    1a60:	55                   	push   %rbp
    1a61:	48 89 e5             	mov    %rsp,%rbp
    1a64:	48 83 ec 20          	sub    $0x20,%rsp
    1a68:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    1a6b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1a72:	0f 83 07 00 00 00    	jae    1a7f <morecore+0x1f>
    nu = 4096;
    1a78:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    1a7f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1a82:	89 c1                	mov    %eax,%ecx
    1a84:	48 c1 e1 04          	shl    $0x4,%rcx
    1a88:	89 c8                	mov    %ecx,%eax
    1a8a:	89 c7                	mov    %eax,%edi
    1a8c:	e8 cf fc ff ff       	callq  1760 <sbrk>
    1a91:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1a98:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    1a9c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1aa0:	0f 85 0d 00 00 00    	jne    1ab3 <morecore+0x53>
    return 0;
    1aa6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1aad:	00 
    1aae:	e9 2e 00 00 00       	jmpq   1ae1 <morecore+0x81>
  hp = (Header*)p;
    1ab3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ab7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    1abb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1abe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1ac2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1ac5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1ac9:	48 83 c0 10          	add    $0x10,%rax
    1acd:	48 89 c7             	mov    %rax,%rdi
    1ad0:	e8 cb fc ff ff       	callq  17a0 <free>
  return freep;
    1ad5:	48 8b 04 25 88 20 00 	mov    0x2088,%rax
    1adc:	00 
    1add:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1ae1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ae5:	48 83 c4 20          	add    $0x20,%rsp
    1ae9:	5d                   	pop    %rbp
    1aea:	c3                   	retq   
