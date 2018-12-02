
out/user/_lab3test:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
void growstacktest(void);
void copyonwriteforktest(void);

int
main(int argc, char *argv[])
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 20          	sub    $0x20,%rsp
       8:	89 7d f8             	mov    %edi,-0x8(%rbp)
       b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  memtest();
       f:	e8 3c 00 00 00       	callq  50 <memtest>
  sbrktest();
      14:	e8 a7 01 00 00       	callq  1c0 <sbrktest>
  mmaptest();
      19:	e8 42 0a 00 00       	callq  a60 <mmaptest>
  growstacktest();
      1e:	e8 cd 0e 00 00       	callq  ef0 <growstacktest>
  copyonwriteforktest();
      23:	e8 88 10 00 00       	callq  10b0 <copyonwriteforktest>
      28:	48 be 5b 22 00 00 00 	movabs $0x225b,%rsi
      2f:	00 00 00 

  printf(stdout, "lab3 tests passed!!\n");
      32:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
      39:	b0 00                	mov    $0x0,%al
      3b:	e8 d0 13 00 00       	callq  1410 <printf>

  exit();
      40:	e8 03 1e 00 00       	callq  1e48 <exit>
      45:	89 45 ec             	mov    %eax,-0x14(%rbp)
      48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
      4f:	00 

0000000000000050 <memtest>:
  return 0;
}

void memtest()
{
      50:	55                   	push   %rbp
      51:	48 89 e5             	mov    %rsp,%rbp
      54:	48 83 ec 20          	sub    $0x20,%rsp
      58:	48 be 70 22 00 00 00 	movabs $0x2270,%rsi
      5f:	00 00 00 
  void *m1, *m2;
  int pid;
  int i;

  printf(stdout, "memtest\n");
      62:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
      69:	b0 00                	mov    $0x0,%al
      6b:	e8 a0 13 00 00       	callq  1410 <printf>
  if((pid = fork()) == 0){
      70:	e8 cb 1d 00 00       	callq  1e40 <fork>
      75:	89 45 ec             	mov    %eax,-0x14(%rbp)
      78:	83 f8 00             	cmp    $0x0,%eax
      7b:	0f 85 12 01 00 00    	jne    193 <memtest+0x143>
    m1 = 0;
      81:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
      88:	00 
    for (i=0;i<10;i++) {
      89:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
      90:	83 7d e8 0a          	cmpl   $0xa,-0x18(%rbp)
      94:	0f 8d 2f 00 00 00    	jge    c9 <memtest+0x79>
      9a:	bf 11 27 00 00       	mov    $0x2711,%edi
      m2 = malloc(10001);
      9f:	e8 cc 1f 00 00       	callq  2070 <malloc>
      a4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
      *(char**)m2 = m1;
      a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      ac:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
      b0:	48 89 01             	mov    %rax,(%rcx)
      m1 = m2;
      b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
      b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (i=0;i<10;i++) {
      bb:	8b 45 e8             	mov    -0x18(%rbp),%eax
      be:	83 c0 01             	add    $0x1,%eax
      c1:	89 45 e8             	mov    %eax,-0x18(%rbp)
      c4:	e9 c7 ff ff ff       	jmpq   90 <memtest+0x40>
    }
    while(m1){
      c9:	e9 00 00 00 00       	jmpq   ce <memtest+0x7e>
      ce:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
      d3:	0f 84 21 00 00 00    	je     fa <memtest+0xaa>
      m2 = *(char**)m1;
      d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      dd:	48 8b 00             	mov    (%rax),%rax
      e0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
      free(m1);
      e4:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
      e8:	e8 23 1e 00 00       	callq  1f10 <free>
      m1 = m2;
      ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
      f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    while(m1){
      f5:	e9 d4 ff ff ff       	jmpq   ce <memtest+0x7e>
      fa:	bf 00 50 00 00       	mov    $0x5000,%edi
    }
    m1 = malloc(1024*20);
      ff:	e8 6c 1f 00 00       	callq  2070 <malloc>
     104:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if(m1 == 0){
     108:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     10d:	0f 85 57 00 00 00    	jne    16a <memtest+0x11a>
      error("couldn't allocate mem?!!\n");
     113:	e9 00 00 00 00       	jmpq   118 <memtest+0xc8>
     118:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     11f:	00 00 00 
     122:	ba 3e 00 00 00       	mov    $0x3e,%edx
     127:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     12e:	b0 00                	mov    $0x0,%al
     130:	e8 db 12 00 00       	callq  1410 <printf>
     135:	48 be 8b 22 00 00 00 	movabs $0x228b,%rsi
     13c:	00 00 00 
     13f:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     146:	b0 00                	mov    $0x0,%al
     148:	e8 c3 12 00 00       	callq  1410 <printf>
     14d:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     154:	00 00 00 
     157:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     15e:	b0 00                	mov    $0x0,%al
     160:	e8 ab 12 00 00       	callq  1410 <printf>
     165:	e9 fb ff ff ff       	jmpq   165 <memtest+0x115>
    }
    free(m1);
     16a:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     16e:	e8 9d 1d 00 00       	callq  1f10 <free>
     173:	48 be a5 22 00 00 00 	movabs $0x22a5,%rsi
     17a:	00 00 00 
    printf(stdout, "mem ok\n");
     17d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     184:	b0 00                	mov    $0x0,%al
     186:	e8 85 12 00 00       	callq  1410 <printf>
    exit();
     18b:	e8 b8 1c 00 00       	callq  1e48 <exit>
     190:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  } else {
    wait();
     193:	e8 b8 1c 00 00       	callq  1e50 <wait>
     198:	89 45 e0             	mov    %eax,-0x20(%rbp)
     19b:	48 be ad 22 00 00 00 	movabs $0x22ad,%rsi
     1a2:	00 00 00 
  }
  printf(stdout, "memtest passed\n");
     1a5:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     1ac:	b0 00                	mov    $0x0,%al
     1ae:	e8 5d 12 00 00       	callq  1410 <printf>
}
     1b3:	48 83 c4 20          	add    $0x20,%rsp
     1b7:	5d                   	pop    %rbp
     1b8:	c3                   	retq   
     1b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000001c0 <sbrktest>:

void
sbrktest(void)
{
     1c0:	55                   	push   %rbp
     1c1:	48 89 e5             	mov    %rsp,%rbp
     1c4:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
     1cb:	48 be bd 22 00 00 00 	movabs $0x22bd,%rsi
     1d2:	00 00 00 
  int fds[2], pid, pids[7];
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint64_t amt;

  printf(stdout, "sbrktest\n");
     1d5:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     1dc:	b0 00                	mov    $0x0,%al
     1de:	e8 2d 12 00 00       	callq  1410 <printf>
     1e3:	31 ff                	xor    %edi,%edi
  oldbrk = sbrk(0);
     1e5:	e8 e6 1c 00 00       	callq  1ed0 <sbrk>
     1ea:	31 ff                	xor    %edi,%edi
     1ec:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

  // can one sbrk() less than a page?
  a = sbrk(0);
     1f0:	e8 db 1c 00 00       	callq  1ed0 <sbrk>
     1f5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  int i;
  for(i = 0; i < 5000; i++){
     1f9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%rbp)
     200:	81 7d 8c 88 13 00 00 	cmpl   $0x1388,-0x74(%rbp)
     207:	0f 8d 9f 00 00 00    	jge    2ac <sbrktest+0xec>
     20d:	bf 01 00 00 00       	mov    $0x1,%edi
    b = sbrk(1);
     212:	e8 b9 1c 00 00       	callq  1ed0 <sbrk>
     217:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    if(b != a){
     21b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     21f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
     223:	0f 84 62 00 00 00    	je     28b <sbrktest+0xcb>
      error("sbrk test failed %d %x %x\n", i, a, b);
     229:	e9 00 00 00 00       	jmpq   22e <sbrktest+0x6e>
     22e:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     235:	00 00 00 
     238:	ba 59 00 00 00       	mov    $0x59,%edx
     23d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     244:	b0 00                	mov    $0x0,%al
     246:	e8 c5 11 00 00       	callq  1410 <printf>
     24b:	48 be c7 22 00 00 00 	movabs $0x22c7,%rsi
     252:	00 00 00 
     255:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     25c:	8b 55 8c             	mov    -0x74(%rbp),%edx
     25f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     263:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
     267:	b0 00                	mov    $0x0,%al
     269:	e8 a2 11 00 00       	callq  1410 <printf>
     26e:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     275:	00 00 00 
     278:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     27f:	b0 00                	mov    $0x0,%al
     281:	e8 8a 11 00 00       	callq  1410 <printf>
     286:	e9 fb ff ff ff       	jmpq   286 <sbrktest+0xc6>
    }
    *b = 1;
     28b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     28f:	c6 00 01             	movb   $0x1,(%rax)
    a = b + 1;
     292:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     296:	48 83 c0 01          	add    $0x1,%rax
     29a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  for(i = 0; i < 5000; i++){
     29e:	8b 45 8c             	mov    -0x74(%rbp),%eax
     2a1:	83 c0 01             	add    $0x1,%eax
     2a4:	89 45 8c             	mov    %eax,-0x74(%rbp)
     2a7:	e9 54 ff ff ff       	jmpq   200 <sbrktest+0x40>
  }
  pid = fork();
     2ac:	e8 8f 1b 00 00       	callq  1e40 <fork>
     2b1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  if(pid < 0){
     2b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     2b8:	0f 8d 57 00 00 00    	jge    315 <sbrktest+0x155>
    error("sbrk test fork failed\n");
     2be:	e9 00 00 00 00       	jmpq   2c3 <sbrktest+0x103>
     2c3:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     2ca:	00 00 00 
     2cd:	ba 60 00 00 00       	mov    $0x60,%edx
     2d2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     2d9:	b0 00                	mov    $0x0,%al
     2db:	e8 30 11 00 00       	callq  1410 <printf>
     2e0:	48 be e2 22 00 00 00 	movabs $0x22e2,%rsi
     2e7:	00 00 00 
     2ea:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     2f1:	b0 00                	mov    $0x0,%al
     2f3:	e8 18 11 00 00       	callq  1410 <printf>
     2f8:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     2ff:	00 00 00 
     302:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     309:	b0 00                	mov    $0x0,%al
     30b:	e8 00 11 00 00       	callq  1410 <printf>
     310:	e9 fb ff ff ff       	jmpq   310 <sbrktest+0x150>
     315:	bf 01 00 00 00       	mov    $0x1,%edi
  }
  c = sbrk(1);
     31a:	e8 b1 1b 00 00       	callq  1ed0 <sbrk>
     31f:	bf 01 00 00 00       	mov    $0x1,%edi
     324:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  c = sbrk(1);
     328:	e8 a3 1b 00 00       	callq  1ed0 <sbrk>
     32d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  if(c != a + 1){
     331:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     335:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     339:	48 83 c1 01          	add    $0x1,%rcx
     33d:	48 39 c8             	cmp    %rcx,%rax
     340:	0f 84 57 00 00 00    	je     39d <sbrktest+0x1dd>
    error("sbrk test failed post-fork\n");
     346:	e9 00 00 00 00       	jmpq   34b <sbrktest+0x18b>
     34b:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     352:	00 00 00 
     355:	ba 65 00 00 00       	mov    $0x65,%edx
     35a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     361:	b0 00                	mov    $0x0,%al
     363:	e8 a8 10 00 00       	callq  1410 <printf>
     368:	48 be f9 22 00 00 00 	movabs $0x22f9,%rsi
     36f:	00 00 00 
     372:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     379:	b0 00                	mov    $0x0,%al
     37b:	e8 90 10 00 00       	callq  1410 <printf>
     380:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     387:	00 00 00 
     38a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     391:	b0 00                	mov    $0x0,%al
     393:	e8 78 10 00 00       	callq  1410 <printf>
     398:	e9 fb ff ff ff       	jmpq   398 <sbrktest+0x1d8>
  }
  if(pid == 0)
     39d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     3a1:	0f 85 08 00 00 00    	jne    3af <sbrktest+0x1ef>
    exit();
     3a7:	e8 9c 1a 00 00       	callq  1e48 <exit>
     3ac:	89 45 88             	mov    %eax,-0x78(%rbp)
  wait();
     3af:	e8 9c 1a 00 00       	callq  1e50 <wait>
     3b4:	31 ff                	xor    %edi,%edi

  // can one grow address space to something big?
#define BIG (1*1024*1024)
  a = sbrk(0);
     3b6:	89 45 84             	mov    %eax,-0x7c(%rbp)
     3b9:	e8 12 1b 00 00       	callq  1ed0 <sbrk>
     3be:	bf 00 00 10 00       	mov    $0x100000,%edi
     3c3:	89 f9                	mov    %edi,%ecx
     3c5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  amt = (BIG) - (uint64_t)a;
     3c9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     3cd:	48 29 c1             	sub    %rax,%rcx
     3d0:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  p = sbrk(amt);
     3d4:	48 8b 45 90          	mov    -0x70(%rbp),%rax
     3d8:	89 c7                	mov    %eax,%edi
     3da:	e8 f1 1a 00 00       	callq  1ed0 <sbrk>
     3df:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  if (p != a) {
     3e3:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     3e7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
     3eb:	0f 84 57 00 00 00    	je     448 <sbrktest+0x288>
    error("sbrk test failed to grow big address space; enough phys mem?\n");
     3f1:	e9 00 00 00 00       	jmpq   3f6 <sbrktest+0x236>
     3f6:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     3fd:	00 00 00 
     400:	ba 71 00 00 00       	mov    $0x71,%edx
     405:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     40c:	b0 00                	mov    $0x0,%al
     40e:	e8 fd 0f 00 00       	callq  1410 <printf>
     413:	48 be 15 23 00 00 00 	movabs $0x2315,%rsi
     41a:	00 00 00 
     41d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     424:	b0 00                	mov    $0x0,%al
     426:	e8 e5 0f 00 00       	callq  1410 <printf>
     42b:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     432:	00 00 00 
     435:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     43c:	b0 00                	mov    $0x0,%al
     43e:	e8 cd 0f 00 00       	callq  1410 <printf>
     443:	e9 fb ff ff ff       	jmpq   443 <sbrktest+0x283>
     448:	31 ff                	xor    %edi,%edi
     44a:	b8 ff ff 0f 00       	mov    $0xfffff,%eax
     44f:	89 c1                	mov    %eax,%ecx
  }
  lastaddr = (char*) (BIG-1);
     451:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  *lastaddr = 99;
     455:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
     459:	c6 01 63             	movb   $0x63,(%rcx)

  // can one de-allocate?
  a = sbrk(0);
     45c:	e8 6f 1a 00 00       	callq  1ed0 <sbrk>
     461:	bf 00 f0 ff ff       	mov    $0xfffff000,%edi
     466:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  c = sbrk(-4096);
     46a:	e8 61 1a 00 00       	callq  1ed0 <sbrk>
     46f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     474:	89 f9                	mov    %edi,%ecx
     476:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  if(c == (char*)0xffffffff){
     47a:	48 39 4d b8          	cmp    %rcx,-0x48(%rbp)
     47e:	0f 85 57 00 00 00    	jne    4db <sbrktest+0x31b>
    error("sbrk could not deallocate\n");
     484:	e9 00 00 00 00       	jmpq   489 <sbrktest+0x2c9>
     489:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     490:	00 00 00 
     493:	ba 7a 00 00 00       	mov    $0x7a,%edx
     498:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     49f:	b0 00                	mov    $0x0,%al
     4a1:	e8 6a 0f 00 00       	callq  1410 <printf>
     4a6:	48 be 53 23 00 00 00 	movabs $0x2353,%rsi
     4ad:	00 00 00 
     4b0:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     4b7:	b0 00                	mov    $0x0,%al
     4b9:	e8 52 0f 00 00       	callq  1410 <printf>
     4be:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     4c5:	00 00 00 
     4c8:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     4cf:	b0 00                	mov    $0x0,%al
     4d1:	e8 3a 0f 00 00       	callq  1410 <printf>
     4d6:	e9 fb ff ff ff       	jmpq   4d6 <sbrktest+0x316>
     4db:	31 ff                	xor    %edi,%edi
  }
  c = sbrk(0);
     4dd:	e8 ee 19 00 00       	callq  1ed0 <sbrk>
     4e2:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  if(c != a - 4096){
     4e6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     4ea:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     4ee:	48 81 c1 00 f0 ff ff 	add    $0xfffffffffffff000,%rcx
     4f5:	48 39 c8             	cmp    %rcx,%rax
     4f8:	0f 84 5f 00 00 00    	je     55d <sbrktest+0x39d>
    error("sbrk deallocation produced wrong address, a %x c %x\n", a, c);
     4fe:	e9 00 00 00 00       	jmpq   503 <sbrktest+0x343>
     503:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     50a:	00 00 00 
     50d:	ba 7e 00 00 00       	mov    $0x7e,%edx
     512:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     519:	b0 00                	mov    $0x0,%al
     51b:	e8 f0 0e 00 00       	callq  1410 <printf>
     520:	48 be 6e 23 00 00 00 	movabs $0x236e,%rsi
     527:	00 00 00 
     52a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     531:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     535:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     539:	b0 00                	mov    $0x0,%al
     53b:	e8 d0 0e 00 00       	callq  1410 <printf>
     540:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     547:	00 00 00 
     54a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     551:	b0 00                	mov    $0x0,%al
     553:	e8 b8 0e 00 00       	callq  1410 <printf>
     558:	e9 fb ff ff ff       	jmpq   558 <sbrktest+0x398>
     55d:	31 ff                	xor    %edi,%edi
  }

  // can one re-allocate that page?
  a = sbrk(0);
     55f:	e8 6c 19 00 00       	callq  1ed0 <sbrk>
     564:	bf 00 10 00 00       	mov    $0x1000,%edi
     569:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  c = sbrk(4096);
     56d:	e8 5e 19 00 00       	callq  1ed0 <sbrk>
     572:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  if(c != a || sbrk(0) != a + 4096){
     576:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     57a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
     57e:	0f 85 1b 00 00 00    	jne    59f <sbrktest+0x3df>
     584:	31 ff                	xor    %edi,%edi
     586:	e8 45 19 00 00       	callq  1ed0 <sbrk>
     58b:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     58f:	48 81 c1 00 10 00 00 	add    $0x1000,%rcx
     596:	48 39 c8             	cmp    %rcx,%rax
     599:	0f 84 5f 00 00 00    	je     5fe <sbrktest+0x43e>
    error("sbrk re-allocation failed, a %x c %x\n", a, c);
     59f:	e9 00 00 00 00       	jmpq   5a4 <sbrktest+0x3e4>
     5a4:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     5ab:	00 00 00 
     5ae:	ba 85 00 00 00       	mov    $0x85,%edx
     5b3:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     5ba:	b0 00                	mov    $0x0,%al
     5bc:	e8 4f 0e 00 00       	callq  1410 <printf>
     5c1:	48 be a3 23 00 00 00 	movabs $0x23a3,%rsi
     5c8:	00 00 00 
     5cb:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     5d2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     5d6:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     5da:	b0 00                	mov    $0x0,%al
     5dc:	e8 2f 0e 00 00       	callq  1410 <printf>
     5e1:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     5e8:	00 00 00 
     5eb:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     5f2:	b0 00                	mov    $0x0,%al
     5f4:	e8 17 0e 00 00       	callq  1410 <printf>
     5f9:	e9 fb ff ff ff       	jmpq   5f9 <sbrktest+0x439>
  }
  if(*lastaddr == 99){
     5fe:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     602:	0f be 08             	movsbl (%rax),%ecx
     605:	83 f9 63             	cmp    $0x63,%ecx
     608:	0f 85 57 00 00 00    	jne    665 <sbrktest+0x4a5>
    // should be zero
    error("sbrk de-allocation didn't really deallocate\n");
     60e:	e9 00 00 00 00       	jmpq   613 <sbrktest+0x453>
     613:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     61a:	00 00 00 
     61d:	ba 89 00 00 00       	mov    $0x89,%edx
     622:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     629:	b0 00                	mov    $0x0,%al
     62b:	e8 e0 0d 00 00       	callq  1410 <printf>
     630:	48 be c9 23 00 00 00 	movabs $0x23c9,%rsi
     637:	00 00 00 
     63a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     641:	b0 00                	mov    $0x0,%al
     643:	e8 c8 0d 00 00       	callq  1410 <printf>
     648:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     64f:	00 00 00 
     652:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     659:	b0 00                	mov    $0x0,%al
     65b:	e8 b0 0d 00 00       	callq  1410 <printf>
     660:	e9 fb ff ff ff       	jmpq   660 <sbrktest+0x4a0>
     665:	31 ff                	xor    %edi,%edi
  }

  a = sbrk(0);
     667:	e8 64 18 00 00       	callq  1ed0 <sbrk>
     66c:	31 ff                	xor    %edi,%edi
     66e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  c = sbrk(-(sbrk(0) - oldbrk));
     672:	e8 59 18 00 00       	callq  1ed0 <sbrk>
     677:	31 ff                	xor    %edi,%edi
     679:	89 f9                	mov    %edi,%ecx
     67b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     67f:	48 29 d0             	sub    %rdx,%rax
     682:	48 29 c1             	sub    %rax,%rcx
     685:	89 cf                	mov    %ecx,%edi
     687:	e8 44 18 00 00       	callq  1ed0 <sbrk>
     68c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  if(c != a){
     690:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     694:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
     698:	0f 84 5f 00 00 00    	je     6fd <sbrktest+0x53d>
    error("sbrk downsize failed, a %x c %x\n", a, c);
     69e:	e9 00 00 00 00       	jmpq   6a3 <sbrktest+0x4e3>
     6a3:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     6aa:	00 00 00 
     6ad:	ba 8f 00 00 00       	mov    $0x8f,%edx
     6b2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     6b9:	b0 00                	mov    $0x0,%al
     6bb:	e8 50 0d 00 00       	callq  1410 <printf>
     6c0:	48 be f6 23 00 00 00 	movabs $0x23f6,%rsi
     6c7:	00 00 00 
     6ca:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     6d1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     6d5:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     6d9:	b0 00                	mov    $0x0,%al
     6db:	e8 30 0d 00 00       	callq  1410 <printf>
     6e0:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     6e7:	00 00 00 
     6ea:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     6f1:	b0 00                	mov    $0x0,%al
     6f3:	e8 18 0d 00 00       	callq  1410 <printf>
     6f8:	e9 fb ff ff ff       	jmpq   6f8 <sbrktest+0x538>
     6fd:	48 c7 c0 00 00 00 80 	mov    $0xffffffff80000000,%rax
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
     704:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     708:	48 c7 c0 80 84 1e 80 	mov    $0xffffffff801e8480,%rax
     70f:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
     713:	0f 83 03 01 00 00    	jae    81c <sbrktest+0x65c>
    pid = fork();
     719:	e8 22 17 00 00       	callq  1e40 <fork>
     71e:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if(pid < 0){
     721:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     725:	0f 8d 57 00 00 00    	jge    782 <sbrktest+0x5c2>
      error("fork failed\n");
     72b:	e9 00 00 00 00       	jmpq   730 <sbrktest+0x570>
     730:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     737:	00 00 00 
     73a:	ba 96 00 00 00       	mov    $0x96,%edx
     73f:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     746:	b0 00                	mov    $0x0,%al
     748:	e8 c3 0c 00 00       	callq  1410 <printf>
     74d:	48 be ec 22 00 00 00 	movabs $0x22ec,%rsi
     754:	00 00 00 
     757:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     75e:	b0 00                	mov    $0x0,%al
     760:	e8 ab 0c 00 00       	callq  1410 <printf>
     765:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     76c:	00 00 00 
     76f:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     776:	b0 00                	mov    $0x0,%al
     778:	e8 93 0c 00 00       	callq  1410 <printf>
     77d:	e9 fb ff ff ff       	jmpq   77d <sbrktest+0x5bd>
    }
    if(pid == 0){
     782:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     786:	0f 85 75 00 00 00    	jne    801 <sbrktest+0x641>
     78c:	48 be 17 24 00 00 00 	movabs $0x2417,%rsi
     793:	00 00 00 
      printf(stdout, "oops could read %x = %x\n", a, *a);
     796:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     79d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     7a1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     7a5:	0f be 08             	movsbl (%rax),%ecx
     7a8:	b0 00                	mov    $0x0,%al
     7aa:	e8 61 0c 00 00       	callq  1410 <printf>
     7af:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     7b6:	00 00 00 
     7b9:	ba 9a 00 00 00       	mov    $0x9a,%edx
      error("a bad process is not killed!");
     7be:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     7c5:	b0 00                	mov    $0x0,%al
     7c7:	e8 44 0c 00 00       	callq  1410 <printf>
     7cc:	48 be 30 24 00 00 00 	movabs $0x2430,%rsi
     7d3:	00 00 00 
     7d6:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     7dd:	b0 00                	mov    $0x0,%al
     7df:	e8 2c 0c 00 00       	callq  1410 <printf>
     7e4:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     7eb:	00 00 00 
     7ee:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     7f5:	b0 00                	mov    $0x0,%al
     7f7:	e8 14 0c 00 00       	callq  1410 <printf>
     7fc:	e9 fb ff ff ff       	jmpq   7fc <sbrktest+0x63c>
    }
    wait();
     801:	e8 4a 16 00 00       	callq  1e50 <wait>
     806:	89 45 80             	mov    %eax,-0x80(%rbp)
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
     809:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     80d:	48 05 50 c3 00 00    	add    $0xc350,%rax
     813:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     817:	e9 ec fe ff ff       	jmpq   708 <sbrktest+0x548>
     81c:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
     820:	e8 33 16 00 00       	callq  1e58 <pipe>
     825:	83 f8 00             	cmp    $0x0,%eax
     828:	0f 84 57 00 00 00    	je     885 <sbrktest+0x6c5>
    error("pipe() failed\n");
     82e:	e9 00 00 00 00       	jmpq   833 <sbrktest+0x673>
     833:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     83a:	00 00 00 
     83d:	ba a2 00 00 00       	mov    $0xa2,%edx
     842:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     849:	b0 00                	mov    $0x0,%al
     84b:	e8 c0 0b 00 00       	callq  1410 <printf>
     850:	48 be 4d 24 00 00 00 	movabs $0x244d,%rsi
     857:	00 00 00 
     85a:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     861:	b0 00                	mov    $0x0,%al
     863:	e8 a8 0b 00 00       	callq  1410 <printf>
     868:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     86f:	00 00 00 
     872:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     879:	b0 00                	mov    $0x0,%al
     87b:	e8 90 0b 00 00       	callq  1410 <printf>
     880:	e9 fb ff ff ff       	jmpq   880 <sbrktest+0x6c0>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
     885:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%rbp)
     88c:	48 63 45 8c          	movslq -0x74(%rbp),%rax
     890:	48 83 f8 07          	cmp    $0x7,%rax
     894:	0f 83 a0 00 00 00    	jae    93a <sbrktest+0x77a>
    if((pids[i] = fork()) == 0){
     89a:	e8 a1 15 00 00       	callq  1e40 <fork>
     89f:	48 63 4d 8c          	movslq -0x74(%rbp),%rcx
     8a3:	89 44 8d d0          	mov    %eax,-0x30(%rbp,%rcx,4)
     8a7:	83 f8 00             	cmp    $0x0,%eax
     8aa:	0f 85 51 00 00 00    	jne    901 <sbrktest+0x741>
     8b0:	31 ff                	xor    %edi,%edi
      // allocate a lot of memory
      sbrk(BIG - (uint64_t)sbrk(0));
     8b2:	e8 19 16 00 00       	callq  1ed0 <sbrk>
     8b7:	bf 00 00 10 00       	mov    $0x100000,%edi
     8bc:	89 f9                	mov    %edi,%ecx
     8be:	48 29 c1             	sub    %rax,%rcx
     8c1:	89 cf                	mov    %ecx,%edi
     8c3:	e8 08 16 00 00       	callq  1ed0 <sbrk>
     8c8:	48 be 5c 24 00 00 00 	movabs $0x245c,%rsi
     8cf:	00 00 00 
     8d2:	ba 01 00 00 00       	mov    $0x1,%edx
      write(fds[1], "x", 1);
     8d7:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8da:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
     8e1:	e8 82 15 00 00       	callq  1e68 <write>
     8e6:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
     8ec:	bf e8 03 00 00       	mov    $0x3e8,%edi
      // sit around until killed
      for(;;) sleep(1000);
     8f1:	e8 e2 15 00 00       	callq  1ed8 <sleep>
     8f6:	89 85 70 ff ff ff    	mov    %eax,-0x90(%rbp)
     8fc:	e9 eb ff ff ff       	jmpq   8ec <sbrktest+0x72c>
    }
    if(pids[i] != -1) {
     901:	48 63 45 8c          	movslq -0x74(%rbp),%rax
     905:	83 7c 85 d0 ff       	cmpl   $0xffffffff,-0x30(%rbp,%rax,4)
     90a:	0f 84 17 00 00 00    	je     927 <sbrktest+0x767>
     910:	48 8d 75 9f          	lea    -0x61(%rbp),%rsi
     914:	ba 01 00 00 00       	mov    $0x1,%edx
      read(fds[0], &scratch, 1);
     919:	8b 7d f8             	mov    -0x8(%rbp),%edi
     91c:	e8 3f 15 00 00       	callq  1e60 <read>
     921:	89 85 6c ff ff ff    	mov    %eax,-0x94(%rbp)
    }
  }
     927:	e9 00 00 00 00       	jmpq   92c <sbrktest+0x76c>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
     92c:	8b 45 8c             	mov    -0x74(%rbp),%eax
     92f:	83 c0 01             	add    $0x1,%eax
     932:	89 45 8c             	mov    %eax,-0x74(%rbp)
     935:	e9 52 ff ff ff       	jmpq   88c <sbrktest+0x6cc>
     93a:	bf 00 10 00 00       	mov    $0x1000,%edi

  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
     93f:	e8 8c 15 00 00       	callq  1ed0 <sbrk>
     944:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
     948:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%rbp)
     94f:	48 63 45 8c          	movslq -0x74(%rbp),%rax
     953:	48 83 f8 07          	cmp    $0x7,%rax
     957:	0f 83 40 00 00 00    	jae    99d <sbrktest+0x7dd>
    if(pids[i] == -1)
     95d:	48 63 45 8c          	movslq -0x74(%rbp),%rax
     961:	83 7c 85 d0 ff       	cmpl   $0xffffffff,-0x30(%rbp,%rax,4)
     966:	0f 85 05 00 00 00    	jne    971 <sbrktest+0x7b1>
      continue;
     96c:	e9 1e 00 00 00       	jmpq   98f <sbrktest+0x7cf>
    kill(pids[i]);
     971:	48 63 45 8c          	movslq -0x74(%rbp),%rax
     975:	8b 7c 85 d0          	mov    -0x30(%rbp,%rax,4),%edi
     979:	e8 fa 14 00 00       	callq  1e78 <kill>
    wait();
     97e:	89 85 68 ff ff ff    	mov    %eax,-0x98(%rbp)
     984:	e8 c7 14 00 00       	callq  1e50 <wait>
     989:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%rbp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
     98f:	8b 45 8c             	mov    -0x74(%rbp),%eax
     992:	83 c0 01             	add    $0x1,%eax
     995:	89 45 8c             	mov    %eax,-0x74(%rbp)
     998:	e9 b2 ff ff ff       	jmpq   94f <sbrktest+0x78f>
     99d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     9a2:	89 c1                	mov    %eax,%ecx
  }
  if(c == (char*)0xffffffff){
     9a4:	48 39 4d b8          	cmp    %rcx,-0x48(%rbp)
     9a8:	0f 85 57 00 00 00    	jne    a05 <sbrktest+0x845>
    error("failed sbrk leaked memory\n");
     9ae:	e9 00 00 00 00       	jmpq   9b3 <sbrktest+0x7f3>
     9b3:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     9ba:	00 00 00 
     9bd:	ba bb 00 00 00       	mov    $0xbb,%edx
     9c2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     9c9:	b0 00                	mov    $0x0,%al
     9cb:	e8 40 0a 00 00       	callq  1410 <printf>
     9d0:	48 be 5e 24 00 00 00 	movabs $0x245e,%rsi
     9d7:	00 00 00 
     9da:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     9e1:	b0 00                	mov    $0x0,%al
     9e3:	e8 28 0a 00 00       	callq  1410 <printf>
     9e8:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     9ef:	00 00 00 
     9f2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     9f9:	b0 00                	mov    $0x0,%al
     9fb:	e8 10 0a 00 00       	callq  1410 <printf>
     a00:	e9 fb ff ff ff       	jmpq   a00 <sbrktest+0x840>
     a05:	31 ff                	xor    %edi,%edi
  }

  if(sbrk(0) > oldbrk)
     a07:	e8 c4 14 00 00       	callq  1ed0 <sbrk>
     a0c:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
     a10:	0f 86 23 00 00 00    	jbe    a39 <sbrktest+0x879>
     a16:	31 ff                	xor    %edi,%edi
    sbrk(-(sbrk(0) - oldbrk));
     a18:	e8 b3 14 00 00       	callq  1ed0 <sbrk>
     a1d:	31 ff                	xor    %edi,%edi
     a1f:	89 f9                	mov    %edi,%ecx
     a21:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     a25:	48 29 d0             	sub    %rdx,%rax
     a28:	48 29 c1             	sub    %rax,%rcx
     a2b:	89 cf                	mov    %ecx,%edi
     a2d:	e8 9e 14 00 00       	callq  1ed0 <sbrk>
     a32:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     a39:	48 be 79 24 00 00 00 	movabs $0x2479,%rsi
     a40:	00 00 00 

  printf(stdout, "sbrktest OK\n");
     a43:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     a4a:	b0 00                	mov    $0x0,%al
     a4c:	e8 bf 09 00 00       	callq  1410 <printf>
}
     a51:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
     a58:	5d                   	pop    %rbp
     a59:	c3                   	retq   
     a5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000a60 <mmaptest>:

void mmaptest()
{
     a60:	55                   	push   %rbp
     a61:	48 89 e5             	mov    %rsp,%rbp
     a64:	48 83 ec 30          	sub    $0x30,%rsp
     a68:	48 be 86 24 00 00 00 	movabs $0x2486,%rsi
     a6f:	00 00 00 
     a72:	b8 00 00 00 80       	mov    $0x80000000,%eax
     a77:	89 c1                	mov    %eax,%ecx
  char* addr = (char*)SZ_2G;
     a79:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  int fd;
  int r;
  int pid;

  printf(stdout, "mmaptest\n");
     a7d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     a84:	b0 00                	mov    $0x0,%al
     a86:	e8 85 09 00 00       	callq  1410 <printf>
     a8b:	48 bf 90 24 00 00 00 	movabs $0x2490,%rdi
     a92:	00 00 00 
     a95:	31 f6                	xor    %esi,%esi

  fd = open("/small.txt", O_RDONLY);
     a97:	e8 ec 13 00 00       	callq  1e88 <open>
     a9c:	89 45 f4             	mov    %eax,-0xc(%rbp)
  if(fd < 0)
     a9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     aa3:	0f 8d 57 00 00 00    	jge    b00 <mmaptest+0xa0>
    error("unable to open small file");
     aa9:	e9 00 00 00 00       	jmpq   aae <mmaptest+0x4e>
     aae:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     ab5:	00 00 00 
     ab8:	ba cf 00 00 00       	mov    $0xcf,%edx
     abd:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     ac4:	b0 00                	mov    $0x0,%al
     ac6:	e8 45 09 00 00       	callq  1410 <printf>
     acb:	48 be 9b 24 00 00 00 	movabs $0x249b,%rsi
     ad2:	00 00 00 
     ad5:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     adc:	b0 00                	mov    $0x0,%al
     ade:	e8 2d 09 00 00       	callq  1410 <printf>
     ae3:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     aea:	00 00 00 
     aed:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     af4:	b0 00                	mov    $0x0,%al
     af6:	e8 15 09 00 00       	callq  1410 <printf>
     afb:	e9 fb ff ff ff       	jmpq   afb <mmaptest+0x9b>

  r = mmap(fd);
     b00:	8b 7d f4             	mov    -0xc(%rbp),%edi
     b03:	e8 e8 13 00 00       	callq  1ef0 <mmap>
     b08:	89 45 f0             	mov    %eax,-0x10(%rbp)
  if(r < 0)
     b0b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     b0f:	0f 8d 57 00 00 00    	jge    b6c <mmaptest+0x10c>
    error("unable to mmap a small file");
     b15:	e9 00 00 00 00       	jmpq   b1a <mmaptest+0xba>
     b1a:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     b21:	00 00 00 
     b24:	ba d3 00 00 00       	mov    $0xd3,%edx
     b29:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     b30:	b0 00                	mov    $0x0,%al
     b32:	e8 d9 08 00 00       	callq  1410 <printf>
     b37:	48 be b5 24 00 00 00 	movabs $0x24b5,%rsi
     b3e:	00 00 00 
     b41:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     b48:	b0 00                	mov    $0x0,%al
     b4a:	e8 c1 08 00 00       	callq  1410 <printf>
     b4f:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     b56:	00 00 00 
     b59:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     b60:	b0 00                	mov    $0x0,%al
     b62:	e8 a9 08 00 00       	callq  1410 <printf>
     b67:	e9 fb ff ff ff       	jmpq   b67 <mmaptest+0x107>
     b6c:	48 be d1 24 00 00 00 	movabs $0x24d1,%rsi
     b73:	00 00 00 

  if (strcmp(addr, "aaaaaaaaaabbbbbbbbbbccccc\n") != 0)
     b76:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b7a:	e8 61 0f 00 00       	callq  1ae0 <strcmp>
     b7f:	83 f8 00             	cmp    $0x0,%eax
     b82:	0f 84 5b 00 00 00    	je     be3 <mmaptest+0x183>
    error("file content was not aaaaaaaaaabbbbbbbbbbccccc, was: '%s'", addr);
     b88:	e9 00 00 00 00       	jmpq   b8d <mmaptest+0x12d>
     b8d:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     b94:	00 00 00 
     b97:	ba d6 00 00 00       	mov    $0xd6,%edx
     b9c:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     ba3:	b0 00                	mov    $0x0,%al
     ba5:	e8 66 08 00 00       	callq  1410 <printf>
     baa:	48 be ec 24 00 00 00 	movabs $0x24ec,%rsi
     bb1:	00 00 00 
     bb4:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     bbb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     bbf:	b0 00                	mov    $0x0,%al
     bc1:	e8 4a 08 00 00       	callq  1410 <printf>
     bc6:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     bcd:	00 00 00 
     bd0:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     bd7:	b0 00                	mov    $0x0,%al
     bd9:	e8 32 08 00 00       	callq  1410 <printf>
     bde:	e9 fb ff ff ff       	jmpq   bde <mmaptest+0x17e>

  r = munmap(fd);
     be3:	8b 7d f4             	mov    -0xc(%rbp),%edi
     be6:	e8 0d 13 00 00       	callq  1ef8 <munmap>
     beb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  if(r < 0)
     bee:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     bf2:	0f 8d 57 00 00 00    	jge    c4f <mmaptest+0x1ef>
    error("unable to munmap");
     bf8:	e9 00 00 00 00       	jmpq   bfd <mmaptest+0x19d>
     bfd:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     c04:	00 00 00 
     c07:	ba da 00 00 00       	mov    $0xda,%edx
     c0c:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     c13:	b0 00                	mov    $0x0,%al
     c15:	e8 f6 07 00 00       	callq  1410 <printf>
     c1a:	48 be 26 25 00 00 00 	movabs $0x2526,%rsi
     c21:	00 00 00 
     c24:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     c2b:	b0 00                	mov    $0x0,%al
     c2d:	e8 de 07 00 00       	callq  1410 <printf>
     c32:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     c39:	00 00 00 
     c3c:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     c43:	b0 00                	mov    $0x0,%al
     c45:	e8 c6 07 00 00       	callq  1410 <printf>
     c4a:	e9 fb ff ff ff       	jmpq   c4a <mmaptest+0x1ea>

  close(fd);
     c4f:	8b 7d f4             	mov    -0xc(%rbp),%edi
     c52:	e8 19 12 00 00       	callq  1e70 <close>
     c57:	48 bf 90 24 00 00 00 	movabs $0x2490,%rdi
     c5e:	00 00 00 
     c61:	31 f6                	xor    %esi,%esi

  // test inter-process communication via mmaped file

  fd = open("/small.txt", O_RDONLY);
     c63:	89 45 e8             	mov    %eax,-0x18(%rbp)
     c66:	e8 1d 12 00 00       	callq  1e88 <open>
     c6b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  if(fd < 0)
     c6e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     c72:	0f 8d 57 00 00 00    	jge    ccf <mmaptest+0x26f>
    error("unable to open small file");
     c78:	e9 00 00 00 00       	jmpq   c7d <mmaptest+0x21d>
     c7d:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     c84:	00 00 00 
     c87:	ba e2 00 00 00       	mov    $0xe2,%edx
     c8c:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     c93:	b0 00                	mov    $0x0,%al
     c95:	e8 76 07 00 00       	callq  1410 <printf>
     c9a:	48 be 9b 24 00 00 00 	movabs $0x249b,%rsi
     ca1:	00 00 00 
     ca4:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     cab:	b0 00                	mov    $0x0,%al
     cad:	e8 5e 07 00 00       	callq  1410 <printf>
     cb2:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     cb9:	00 00 00 
     cbc:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     cc3:	b0 00                	mov    $0x0,%al
     cc5:	e8 46 07 00 00       	callq  1410 <printf>
     cca:	e9 fb ff ff ff       	jmpq   cca <mmaptest+0x26a>

  r = mmap(fd);
     ccf:	8b 7d f4             	mov    -0xc(%rbp),%edi
     cd2:	e8 19 12 00 00       	callq  1ef0 <mmap>
     cd7:	89 45 f0             	mov    %eax,-0x10(%rbp)
  if(r < 0)
     cda:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     cde:	0f 8d 57 00 00 00    	jge    d3b <mmaptest+0x2db>
    error("unable to mmap a small file");
     ce4:	e9 00 00 00 00       	jmpq   ce9 <mmaptest+0x289>
     ce9:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     cf0:	00 00 00 
     cf3:	ba e6 00 00 00       	mov    $0xe6,%edx
     cf8:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     cff:	b0 00                	mov    $0x0,%al
     d01:	e8 0a 07 00 00       	callq  1410 <printf>
     d06:	48 be b5 24 00 00 00 	movabs $0x24b5,%rsi
     d0d:	00 00 00 
     d10:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     d17:	b0 00                	mov    $0x0,%al
     d19:	e8 f2 06 00 00       	callq  1410 <printf>
     d1e:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     d25:	00 00 00 
     d28:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     d2f:	b0 00                	mov    $0x0,%al
     d31:	e8 da 06 00 00       	callq  1410 <printf>
     d36:	e9 fb ff ff ff       	jmpq   d36 <mmaptest+0x2d6>

  pid = fork();
     d3b:	e8 00 11 00 00       	callq  1e40 <fork>
     d40:	89 45 ec             	mov    %eax,-0x14(%rbp)
  if (pid == 0) {
     d43:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
     d47:	0f 85 8e 00 00 00    	jne    ddb <mmaptest+0x37b>
    addr[0] = 'b';
     d4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d51:	c6 00 62             	movb   $0x62,(%rax)
    addr[5] = 'd';
     d54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d58:	c6 40 05 64          	movb   $0x64,0x5(%rax)
    r = munmap(fd);
     d5c:	8b 7d f4             	mov    -0xc(%rbp),%edi
     d5f:	e8 94 11 00 00       	callq  1ef8 <munmap>
     d64:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if(r < 0)
     d67:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     d6b:	0f 8d 57 00 00 00    	jge    dc8 <mmaptest+0x368>
      error("unable to munmap");
     d71:	e9 00 00 00 00       	jmpq   d76 <mmaptest+0x316>
     d76:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     d7d:	00 00 00 
     d80:	ba ee 00 00 00       	mov    $0xee,%edx
     d85:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     d8c:	b0 00                	mov    $0x0,%al
     d8e:	e8 7d 06 00 00       	callq  1410 <printf>
     d93:	48 be 26 25 00 00 00 	movabs $0x2526,%rsi
     d9a:	00 00 00 
     d9d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     da4:	b0 00                	mov    $0x0,%al
     da6:	e8 65 06 00 00       	callq  1410 <printf>
     dab:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     db2:	00 00 00 
     db5:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     dbc:	b0 00                	mov    $0x0,%al
     dbe:	e8 4d 06 00 00       	callq  1410 <printf>
     dc3:	e9 fb ff ff ff       	jmpq   dc3 <mmaptest+0x363>

    close(fd);
     dc8:	8b 7d f4             	mov    -0xc(%rbp),%edi
     dcb:	e8 a0 10 00 00       	callq  1e70 <close>
    exit();
     dd0:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     dd3:	e8 70 10 00 00       	callq  1e48 <exit>
     dd8:	89 45 e0             	mov    %eax,-0x20(%rbp)
  } else {
    wait();
     ddb:	e8 70 10 00 00       	callq  1e50 <wait>
     de0:	89 45 dc             	mov    %eax,-0x24(%rbp)
     de3:	48 be 37 25 00 00 00 	movabs $0x2537,%rsi
     dea:	00 00 00 
  }

  if (strcmp(addr, "baaaadaaaabbbbbbbbbbccccc\n") != 0)
     ded:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     df1:	e8 ea 0c 00 00       	callq  1ae0 <strcmp>
     df6:	83 f8 00             	cmp    $0x0,%eax
     df9:	0f 84 5b 00 00 00    	je     e5a <mmaptest+0x3fa>
    error("file content was not baaaadaaaabbbbbbbbbbccccc, was: '%s'", addr);
     dff:	e9 00 00 00 00       	jmpq   e04 <mmaptest+0x3a4>
     e04:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     e0b:	00 00 00 
     e0e:	ba f7 00 00 00       	mov    $0xf7,%edx
     e13:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     e1a:	b0 00                	mov    $0x0,%al
     e1c:	e8 ef 05 00 00       	callq  1410 <printf>
     e21:	48 be 52 25 00 00 00 	movabs $0x2552,%rsi
     e28:	00 00 00 
     e2b:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     e32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e36:	b0 00                	mov    $0x0,%al
     e38:	e8 d3 05 00 00       	callq  1410 <printf>
     e3d:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     e44:	00 00 00 
     e47:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     e4e:	b0 00                	mov    $0x0,%al
     e50:	e8 bb 05 00 00       	callq  1410 <printf>
     e55:	e9 fb ff ff ff       	jmpq   e55 <mmaptest+0x3f5>

  r = munmap(fd);
     e5a:	8b 7d f4             	mov    -0xc(%rbp),%edi
     e5d:	e8 96 10 00 00       	callq  1ef8 <munmap>
     e62:	89 45 f0             	mov    %eax,-0x10(%rbp)
  if(r < 0)
     e65:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     e69:	0f 8d 57 00 00 00    	jge    ec6 <mmaptest+0x466>
    error("unable to munmap");
     e6f:	e9 00 00 00 00       	jmpq   e74 <mmaptest+0x414>
     e74:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
     e7b:	00 00 00 
     e7e:	ba fb 00 00 00       	mov    $0xfb,%edx
     e83:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     e8a:	b0 00                	mov    $0x0,%al
     e8c:	e8 7f 05 00 00       	callq  1410 <printf>
     e91:	48 be 26 25 00 00 00 	movabs $0x2526,%rsi
     e98:	00 00 00 
     e9b:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     ea2:	b0 00                	mov    $0x0,%al
     ea4:	e8 67 05 00 00       	callq  1410 <printf>
     ea9:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
     eb0:	00 00 00 
     eb3:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     eba:	b0 00                	mov    $0x0,%al
     ebc:	e8 4f 05 00 00       	callq  1410 <printf>
     ec1:	e9 fb ff ff ff       	jmpq   ec1 <mmaptest+0x461>

  close(fd);
     ec6:	8b 7d f4             	mov    -0xc(%rbp),%edi
     ec9:	e8 a2 0f 00 00       	callq  1e70 <close>
     ece:	48 be 8c 25 00 00 00 	movabs $0x258c,%rsi
     ed5:	00 00 00 

  printf(stdout, "mmaptest passed\n");
     ed8:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     edf:	89 45 d8             	mov    %eax,-0x28(%rbp)
     ee2:	b0 00                	mov    $0x0,%al
     ee4:	e8 27 05 00 00       	callq  1410 <printf>
}
     ee9:	48 83 c4 30          	add    $0x30,%rsp
     eed:	5d                   	pop    %rbp
     eee:	c3                   	retq   
     eef:	90                   	nop

0000000000000ef0 <growstacktest>:

void growstacktest()
{
     ef0:	55                   	push   %rbp
     ef1:	48 89 e5             	mov    %rsp,%rbp
  int i;
  struct sys_info info1, info2;
  printf(stdout, "growstacktest\n");
     ef4:	48 83 ec 60          	sub    $0x60,%rsp
     ef8:	8b 3d 02 1c 00 00    	mov    0x1c02(%rip),%edi        # 2b00 <stdout>
     efe:	b8 9d 25 00 00       	mov    $0x259d,%eax
     f03:	89 c6                	mov    %eax,%esi
     f05:	31 c0                	xor    %eax,%eax
     f07:	88 c1                	mov    %al,%cl
     f09:	88 c8                	mov    %cl,%al
     f0b:	88 4d bf             	mov    %cl,-0x41(%rbp)
     f0e:	e8 fd 04 00 00       	callq  1410 <printf>
     f13:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
  sysinfo(&info1);
     f17:	e8 cc 0f 00 00       	callq  1ee8 <sysinfo>

  printf(stdout, "pages_in_use before stack allocation = %d\n", info1.pages_in_use);
     f1c:	8b 3d de 1b 00 00    	mov    0x1bde(%rip),%edi        # 2b00 <stdout>
     f22:	8b 55 e8             	mov    -0x18(%rbp),%edx
     f25:	41 b8 ac 25 00 00    	mov    $0x25ac,%r8d
     f2b:	44 89 c6             	mov    %r8d,%esi
     f2e:	8a 4d bf             	mov    -0x41(%rbp),%cl
     f31:	89 45 b8             	mov    %eax,-0x48(%rbp)
     f34:	88 c8                	mov    %cl,%al
     f36:	e8 d5 04 00 00       	callq  1410 <printf>
  printf(stdout, "pages_in_swap before stack allocation = %d\n", info1.pages_in_swap);
     f3b:	8b 3d bf 1b 00 00    	mov    0x1bbf(%rip),%edi        # 2b00 <stdout>
     f41:	8b 55 ec             	mov    -0x14(%rbp),%edx
     f44:	41 b8 d7 25 00 00    	mov    $0x25d7,%r8d
     f4a:	44 89 c6             	mov    %r8d,%esi
     f4d:	8a 45 bf             	mov    -0x41(%rbp),%al
     f50:	e8 bb 04 00 00       	callq  1410 <printf>

  int page8 = 8 * 4096;
     f55:	c7 45 cc 00 80 00 00 	movl   $0x8000,-0x34(%rbp)
  char buf[page8];
     f5c:	8b 55 cc             	mov    -0x34(%rbp),%edx
     f5f:	89 d6                	mov    %edx,%esi
     f61:	49 89 e1             	mov    %rsp,%r9
     f64:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
     f68:	48 83 c6 0f          	add    $0xf,%rsi
     f6c:	49 b9 f0 ff ff ff 01 	movabs $0x1fffffff0,%r9
     f73:	00 00 00 
     f76:	4c 21 ce             	and    %r9,%rsi
     f79:	49 89 e1             	mov    %rsp,%r9
     f7c:	49 29 f1             	sub    %rsi,%r9
     f7f:	4c 89 cc             	mov    %r9,%rsp
  //printf(stdout, "start buf = 0x%x, end buf = 0x%x\n", &buf[0], &buf[page8-1]);
  for (i = 0; i < 8; i ++) {
     f82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     f89:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
     f8d:	83 7d fc 08          	cmpl   $0x8,-0x4(%rbp)
     f91:	0f 8d 3c 00 00 00    	jge    fd3 <growstacktest+0xe3>
    buf[i * 4096] = 'a';
     f97:	8b 45 fc             	mov    -0x4(%rbp),%eax
     f9a:	c1 e0 0c             	shl    $0xc,%eax
     f9d:	48 63 c8             	movslq %eax,%rcx
     fa0:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     fa4:	c6 04 0a 61          	movb   $0x61,(%rdx,%rcx,1)
    buf[i * 4096 - 1] = buf[i * 4096];
     fa8:	8b 45 fc             	mov    -0x4(%rbp),%eax
     fab:	c1 e0 0c             	shl    $0xc,%eax
     fae:	48 63 c8             	movslq %eax,%rcx
     fb1:	40 8a 34 0a          	mov    (%rdx,%rcx,1),%sil
     fb5:	8b 45 fc             	mov    -0x4(%rbp),%eax
     fb8:	c1 e0 0c             	shl    $0xc,%eax
     fbb:	83 e8 01             	sub    $0x1,%eax
     fbe:	48 63 c8             	movslq %eax,%rcx
     fc1:	40 88 34 0a          	mov    %sil,(%rdx,%rcx,1)
  for (i = 0; i < 8; i ++) {
     fc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
     fc8:	83 c0 01             	add    $0x1,%eax
     fcb:	89 45 fc             	mov    %eax,-0x4(%rbp)
     fce:	e9 ba ff ff ff       	jmpq   f8d <growstacktest+0x9d>
     fd3:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    //printf(stdout, "cur buf = 0x%x\n", &buf[i * 4096]);
  }
  sysinfo(&info2);
     fd7:	e8 0c 0f 00 00       	callq  1ee8 <sysinfo>
     fdc:	48 be 03 26 00 00 00 	movabs $0x2603,%rsi
     fe3:	00 00 00 

  printf(stdout, "pages_in_use after stack allocation = %d\n", info2.pages_in_use);
     fe6:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
     fed:	8b 55 d0             	mov    -0x30(%rbp),%edx
     ff0:	89 45 ac             	mov    %eax,-0x54(%rbp)
     ff3:	b0 00                	mov    $0x0,%al
     ff5:	e8 16 04 00 00       	callq  1410 <printf>
     ffa:	48 be 2d 26 00 00 00 	movabs $0x262d,%rsi
    1001:	00 00 00 
  printf(stdout, "pages_in_swap after stack allocation = %d\n", info2.pages_in_swap);
    1004:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    100b:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    100e:	b0 00                	mov    $0x0,%al
    1010:	e8 fb 03 00 00       	callq  1410 <printf>

  // if grow ustack on-demand is implemented, then the 8 pages are allocated at run-time
  if (info2.pages_in_use - info1.pages_in_use + info1.pages_in_swap - info2.pages_in_swap != 8)
    1015:	8b 55 d0             	mov    -0x30(%rbp),%edx
    1018:	2b 55 e8             	sub    -0x18(%rbp),%edx
    101b:	03 55 ec             	add    -0x14(%rbp),%edx
    101e:	2b 55 d4             	sub    -0x2c(%rbp),%edx
    1021:	83 fa 08             	cmp    $0x8,%edx
    1024:	0f 84 5c 00 00 00    	je     1086 <growstacktest+0x196>
   error("user stack is not growing");
    102a:	e9 00 00 00 00       	jmpq   102f <growstacktest+0x13f>
    102f:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
    1036:	00 00 00 
    1039:	ba 1b 01 00 00       	mov    $0x11b,%edx
    103e:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1045:	b0 00                	mov    $0x0,%al
    1047:	e8 c4 03 00 00       	callq  1410 <printf>
    104c:	48 be 58 26 00 00 00 	movabs $0x2658,%rsi
    1053:	00 00 00 
    1056:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    105d:	b0 00                	mov    $0x0,%al
    105f:	e8 ac 03 00 00       	callq  1410 <printf>
    1064:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
    106b:	00 00 00 
    106e:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1075:	b0 00                	mov    $0x0,%al
    1077:	e8 94 03 00 00       	callq  1410 <printf>
    107c:	e9 00 00 00 00       	jmpq   1081 <growstacktest+0x191>
    1081:	e9 f6 ff ff ff       	jmpq   107c <growstacktest+0x18c>
    1086:	48 be 72 26 00 00 00 	movabs $0x2672,%rsi
    108d:	00 00 00 

  printf(stdout, "growstacktest passed\n");
    1090:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1097:	b0 00                	mov    $0x0,%al
    1099:	e8 72 03 00 00       	callq  1410 <printf>
}
    109e:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
    10a2:	48 89 f4             	mov    %rsi,%rsp
    10a5:	48 89 ec             	mov    %rbp,%rsp
    10a8:	5d                   	pop    %rbp
    10a9:	c3                   	retq   
    10aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000010b0 <copyonwriteforktest>:

void
copyonwriteforktest() {
    10b0:	55                   	push   %rbp
    10b1:	48 89 e5             	mov    %rsp,%rbp
  struct sys_info info1, info2, info3, info4;
  int page200 = 200 * 4096;
    10b4:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    10bb:	c7 45 9c 00 80 0c 00 	movl   $0xc8000,-0x64(%rbp)
  char *a = sbrk(page200);
    10c2:	8b 7d 9c             	mov    -0x64(%rbp),%edi
    10c5:	e8 06 0e 00 00       	callq  1ed0 <sbrk>
    10ca:	48 be 88 26 00 00 00 	movabs $0x2688,%rsi
    10d1:	00 00 00 
    10d4:	48 89 45 90          	mov    %rax,-0x70(%rbp)
  char b;
  int j;

  a[0] = 0;
    10d8:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    10dc:	c6 00 00             	movb   $0x0,(%rax)
  printf(stdout, "copyonwriteforktest\n");
    10df:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    10e6:	b0 00                	mov    $0x0,%al
    10e8:	e8 23 03 00 00       	callq  1410 <printf>
    10ed:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
  sysinfo(&info1);
    10f1:	e8 f2 0d 00 00       	callq  1ee8 <sysinfo>
    10f6:	48 be 9d 26 00 00 00 	movabs $0x269d,%rsi
    10fd:	00 00 00 
  printf(stdout, "pages_in_use before copy-on-write fork = %d\n", info1.pages_in_use);
    1100:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1107:	8b 55 e8             	mov    -0x18(%rbp),%edx
    110a:	89 45 80             	mov    %eax,-0x80(%rbp)
    110d:	b0 00                	mov    $0x0,%al
    110f:	e8 fc 02 00 00       	callq  1410 <printf>
    1114:	48 be ca 26 00 00 00 	movabs $0x26ca,%rsi
    111b:	00 00 00 
  printf(stdout, "pages_in_swap before copy-on-write fork = %d\n", info1.pages_in_swap);
    111e:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1125:	8b 55 ec             	mov    -0x14(%rbp),%edx
    1128:	b0 00                	mov    $0x0,%al
    112a:	e8 e1 02 00 00       	callq  1410 <printf>
  int pid = fork();
    112f:	e8 0c 0d 00 00       	callq  1e40 <fork>
    1134:	89 45 84             	mov    %eax,-0x7c(%rbp)
  if (pid == 0) {
    1137:	83 7d 84 00          	cmpl   $0x0,-0x7c(%rbp)
    113b:	0f 85 1b 00 00 00    	jne    115c <copyonwriteforktest+0xac>
    1141:	bf 64 00 00 00       	mov    $0x64,%edi
    sleep(100);
    1146:	e8 8d 0d 00 00       	callq  1ed8 <sleep>
    exit();
    114b:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
    1151:	e8 f2 0c 00 00       	callq  1e48 <exit>
    1156:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
    115c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  } else {
    sysinfo(&info2);
    1160:	e8 83 0d 00 00       	callq  1ee8 <sysinfo>
    1165:	48 be f8 26 00 00 00 	movabs $0x26f8,%rsi
    116c:	00 00 00 
    printf(stdout, "pages_in_use after copy-on-write fork = %d\n", info2.pages_in_use);
    116f:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1176:	8b 55 d0             	mov    -0x30(%rbp),%edx
    1179:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    117f:	b0 00                	mov    $0x0,%al
    1181:	e8 8a 02 00 00       	callq  1410 <printf>
    1186:	48 be 24 27 00 00 00 	movabs $0x2724,%rsi
    118d:	00 00 00 
    printf(stdout, "pages_in_swap after copy-on-write fork = %d\n", info2.pages_in_swap);
    1190:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1197:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    119a:	b0 00                	mov    $0x0,%al
    119c:	e8 6f 02 00 00       	callq  1410 <printf>

    // if copy-on-write is implemented, there is no way a new process can take more than 100 pages
    if (info2.pages_in_use - info1.pages_in_use + info1.pages_in_swap - info2.pages_in_swap > 100)
    11a1:	8b 55 d0             	mov    -0x30(%rbp),%edx
    11a4:	2b 55 e8             	sub    -0x18(%rbp),%edx
    11a7:	03 55 ec             	add    -0x14(%rbp),%edx
    11aa:	2b 55 d4             	sub    -0x2c(%rbp),%edx
    11ad:	83 fa 64             	cmp    $0x64,%edx
    11b0:	0f 8e 57 00 00 00    	jle    120d <copyonwriteforktest+0x15d>
      error("too much memory is used for fork");
    11b6:	e9 00 00 00 00       	jmpq   11bb <copyonwriteforktest+0x10b>
    11bb:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
    11c2:	00 00 00 
    11c5:	ba 38 01 00 00       	mov    $0x138,%edx
    11ca:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    11d1:	b0 00                	mov    $0x0,%al
    11d3:	e8 38 02 00 00       	callq  1410 <printf>
    11d8:	48 be 51 27 00 00 00 	movabs $0x2751,%rsi
    11df:	00 00 00 
    11e2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    11e9:	b0 00                	mov    $0x0,%al
    11eb:	e8 20 02 00 00       	callq  1410 <printf>
    11f0:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
    11f7:	00 00 00 
    11fa:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1201:	b0 00                	mov    $0x0,%al
    1203:	e8 08 02 00 00       	callq  1410 <printf>
    1208:	e9 fb ff ff ff       	jmpq   1208 <copyonwriteforktest+0x158>

    for (j=0;j<200;j++) {
    120d:	c7 45 88 00 00 00 00 	movl   $0x0,-0x78(%rbp)
    1214:	81 7d 88 c8 00 00 00 	cmpl   $0xc8,-0x78(%rbp)
    121b:	0f 8d 23 00 00 00    	jge    1244 <copyonwriteforktest+0x194>
      b = a[j * 4096];
    1221:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    1225:	8b 4d 88             	mov    -0x78(%rbp),%ecx
    1228:	c1 e1 0c             	shl    $0xc,%ecx
    122b:	48 63 d1             	movslq %ecx,%rdx
    122e:	40 8a 34 10          	mov    (%rax,%rdx,1),%sil
    1232:	40 88 75 8f          	mov    %sil,-0x71(%rbp)
    for (j=0;j<200;j++) {
    1236:	8b 45 88             	mov    -0x78(%rbp),%eax
    1239:	83 c0 01             	add    $0x1,%eax
    123c:	89 45 88             	mov    %eax,-0x78(%rbp)
    123f:	e9 d0 ff ff ff       	jmpq   1214 <copyonwriteforktest+0x164>
    1244:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
    }

    sysinfo(&info3);
    1248:	e8 9b 0c 00 00       	callq  1ee8 <sysinfo>
    124d:	48 be 72 27 00 00 00 	movabs $0x2772,%rsi
    1254:	00 00 00 
    printf(stdout, "pages_in_use after read = %d\n", info3.pages_in_use);
    1257:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    125e:	8b 55 b8             	mov    -0x48(%rbp),%edx
    1261:	89 85 70 ff ff ff    	mov    %eax,-0x90(%rbp)
    1267:	b0 00                	mov    $0x0,%al
    1269:	e8 a2 01 00 00       	callq  1410 <printf>
    126e:	48 be 90 27 00 00 00 	movabs $0x2790,%rsi
    1275:	00 00 00 
    printf(stdout, "pages_in_swap after read = %d\n", info3.pages_in_swap);
    1278:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    127f:	8b 55 bc             	mov    -0x44(%rbp),%edx
    1282:	b0 00                	mov    $0x0,%al
    1284:	e8 87 01 00 00       	callq  1410 <printf>

    // Read should not increase the amount of memory allocated
    if (info3.pages_in_use - info2.pages_in_use + info3.pages_in_swap - info2.pages_in_swap > 100)
    1289:	8b 55 b8             	mov    -0x48(%rbp),%edx
    128c:	2b 55 d0             	sub    -0x30(%rbp),%edx
    128f:	03 55 bc             	add    -0x44(%rbp),%edx
    1292:	2b 55 d4             	sub    -0x2c(%rbp),%edx
    1295:	83 fa 64             	cmp    $0x64,%edx
    1298:	0f 8e 57 00 00 00    	jle    12f5 <copyonwriteforktest+0x245>
      error("too much memory is used for read");
    129e:	e9 00 00 00 00       	jmpq   12a3 <copyonwriteforktest+0x1f3>
    12a3:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
    12aa:	00 00 00 
    12ad:	ba 44 01 00 00       	mov    $0x144,%edx
    12b2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    12b9:	b0 00                	mov    $0x0,%al
    12bb:	e8 50 01 00 00       	callq  1410 <printf>
    12c0:	48 be af 27 00 00 00 	movabs $0x27af,%rsi
    12c7:	00 00 00 
    12ca:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    12d1:	b0 00                	mov    $0x0,%al
    12d3:	e8 38 01 00 00       	callq  1410 <printf>
    12d8:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
    12df:	00 00 00 
    12e2:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    12e9:	b0 00                	mov    $0x0,%al
    12eb:	e8 20 01 00 00       	callq  1410 <printf>
    12f0:	e9 fb ff ff ff       	jmpq   12f0 <copyonwriteforktest+0x240>

    for (j=0;j<200;j++) {
    12f5:	c7 45 88 00 00 00 00 	movl   $0x0,-0x78(%rbp)
    12fc:	81 7d 88 c8 00 00 00 	cmpl   $0xc8,-0x78(%rbp)
    1303:	0f 8d 21 00 00 00    	jge    132a <copyonwriteforktest+0x27a>
      a[j * 4096] = b;
    1309:	8a 45 8f             	mov    -0x71(%rbp),%al
    130c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    1310:	8b 55 88             	mov    -0x78(%rbp),%edx
    1313:	c1 e2 0c             	shl    $0xc,%edx
    1316:	48 63 f2             	movslq %edx,%rsi
    1319:	88 04 31             	mov    %al,(%rcx,%rsi,1)
    for (j=0;j<200;j++) {
    131c:	8b 45 88             	mov    -0x78(%rbp),%eax
    131f:	83 c0 01             	add    $0x1,%eax
    1322:	89 45 88             	mov    %eax,-0x78(%rbp)
    1325:	e9 d2 ff ff ff       	jmpq   12fc <copyonwriteforktest+0x24c>
    132a:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
    }

    sysinfo(&info4);
    132e:	e8 b5 0b 00 00       	callq  1ee8 <sysinfo>
    1333:	48 be d0 27 00 00 00 	movabs $0x27d0,%rsi
    133a:	00 00 00 
    printf(stdout, "pages_in_use after write = %d\n", info4.pages_in_use);
    133d:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1344:	8b 55 a0             	mov    -0x60(%rbp),%edx
    1347:	89 85 6c ff ff ff    	mov    %eax,-0x94(%rbp)
    134d:	b0 00                	mov    $0x0,%al
    134f:	e8 bc 00 00 00       	callq  1410 <printf>
    1354:	48 be ef 27 00 00 00 	movabs $0x27ef,%rsi
    135b:	00 00 00 
    printf(stdout, "pages_in_swap after write = %d\n", info4.pages_in_swap);
    135e:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    1365:	8b 55 a4             	mov    -0x5c(%rbp),%edx
    1368:	b0 00                	mov    $0x0,%al
    136a:	e8 a1 00 00 00       	callq  1410 <printf>

    // Write should allocate the 200 pages of memory
    if (info4.pages_in_use - info3.pages_in_use + info4.pages_in_swap - info3.pages_in_swap < 100)
    136f:	8b 55 a0             	mov    -0x60(%rbp),%edx
    1372:	2b 55 b8             	sub    -0x48(%rbp),%edx
    1375:	03 55 a4             	add    -0x5c(%rbp),%edx
    1378:	2b 55 bc             	sub    -0x44(%rbp),%edx
    137b:	83 fa 64             	cmp    $0x64,%edx
    137e:	0f 8d 57 00 00 00    	jge    13db <copyonwriteforktest+0x32b>
      error("too less memory is used for write");
    1384:	e9 00 00 00 00       	jmpq   1389 <copyonwriteforktest+0x2d9>
    1389:	48 be 79 22 00 00 00 	movabs $0x2279,%rsi
    1390:	00 00 00 
    1393:	ba 50 01 00 00       	mov    $0x150,%edx
    1398:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    139f:	b0 00                	mov    $0x0,%al
    13a1:	e8 6a 00 00 00       	callq  1410 <printf>
    13a6:	48 be 0f 28 00 00 00 	movabs $0x280f,%rsi
    13ad:	00 00 00 
    13b0:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    13b7:	b0 00                	mov    $0x0,%al
    13b9:	e8 52 00 00 00       	callq  1410 <printf>
    13be:	48 be a3 22 00 00 00 	movabs $0x22a3,%rsi
    13c5:	00 00 00 
    13c8:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    13cf:	b0 00                	mov    $0x0,%al
    13d1:	e8 3a 00 00 00       	callq  1410 <printf>
    13d6:	e9 fb ff ff ff       	jmpq   13d6 <copyonwriteforktest+0x326>

    wait();
    13db:	e8 70 0a 00 00       	callq  1e50 <wait>
    13e0:	89 85 68 ff ff ff    	mov    %eax,-0x98(%rbp)
    13e6:	48 be 31 28 00 00 00 	movabs $0x2831,%rsi
    13ed:	00 00 00 
  }

  printf(stdout, "copyonwriteforktest passed\n");
    13f0:	8b 3c 25 00 2b 00 00 	mov    0x2b00,%edi
    13f7:	b0 00                	mov    $0x0,%al
    13f9:	e8 12 00 00 00       	callq  1410 <printf>
}
    13fe:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
    1405:	5d                   	pop    %rbp
    1406:	c3                   	retq   
    1407:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    140e:	00 00 

0000000000001410 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1410:	55                   	push   %rbp
    1411:	48 89 e5             	mov    %rsp,%rbp
    1414:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    141b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
    141f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
    1423:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    1427:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    142b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    142f:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1432:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1436:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
    143a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
    143e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
    1442:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    1446:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
    144d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
    1453:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
    145a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1461:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1465:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
    1469:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    146d:	0f 84 f0 03 00 00    	je     1863 <printf+0x453>
    c = fmt[i] & 0xff;
    1473:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1477:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
    147b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
    147f:	81 e2 ff 00 00 00    	and    $0xff,%edx
    1485:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
    1488:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
    148c:	0f 85 32 00 00 00    	jne    14c4 <printf+0xb4>
      if(c == '%'){
    1492:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    1496:	0f 85 13 00 00 00    	jne    14af <printf+0x9f>
        state = '%';
    149c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
    14a3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
    14aa:	e9 10 00 00 00       	jmpq   14bf <printf+0xaf>
        putc(fd, c);
    14af:	8b 7d fc             	mov    -0x4(%rbp),%edi
    14b2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    14b5:	88 c1                	mov    %al,%cl
    14b7:	0f be f1             	movsbl %cl,%esi
    14ba:	e8 b1 03 00 00       	callq  1870 <putc>
      }
    } else if(state == '%'){
    14bf:	e9 8c 03 00 00       	jmpq   1850 <printf+0x440>
    14c4:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
    14c8:	0f 85 7d 03 00 00    	jne    184b <printf+0x43b>
      if(c == 'l') {
    14ce:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
    14d2:	0f 85 0c 00 00 00    	jne    14e4 <printf+0xd4>
        lflag = 1;
    14d8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
    14df:	e9 71 03 00 00       	jmpq   1855 <printf+0x445>
      } else if(c == 'd'){
    14e4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
    14e8:	0f 85 0e 01 00 00    	jne    15fc <printf+0x1ec>
        if (lflag == 1)
    14ee:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
    14f2:	0f 85 79 00 00 00    	jne    1571 <printf+0x161>
    14f8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
    14fc:	8b 7d fc             	mov    -0x4(%rbp),%edi
    14ff:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    1502:	83 f9 28             	cmp    $0x28,%ecx
    1505:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    1509:	89 7d 84             	mov    %edi,-0x7c(%rbp)
    150c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
    150f:	0f 87 1f 00 00 00    	ja     1534 <printf+0x124>
    1515:	8b 45 80             	mov    -0x80(%rbp),%eax
    1518:	48 63 c8             	movslq %eax,%rcx
    151b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    151f:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1523:	83 c0 08             	add    $0x8,%eax
    1526:	89 02                	mov    %eax,(%rdx)
    1528:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    152f:	e9 1a 00 00 00       	jmpq   154e <printf+0x13e>
    1534:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    1538:	48 8b 48 08          	mov    0x8(%rax),%rcx
    153c:	48 89 ca             	mov    %rcx,%rdx
    153f:	48 83 c1 08          	add    $0x8,%rcx
    1543:	48 89 48 08          	mov    %rcx,0x8(%rax)
    1547:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
    154e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    1555:	ba 0a 00 00 00       	mov    $0xa,%edx
    155a:	b9 01 00 00 00       	mov    $0x1,%ecx
    155f:	48 8b 00             	mov    (%rax),%rax
    1562:	89 c6                	mov    %eax,%esi
    1564:	8b 7d 84             	mov    -0x7c(%rbp),%edi
    1567:	e8 34 03 00 00       	callq  18a0 <printint64>
    156c:	e9 86 00 00 00       	jmpq   15f7 <printf+0x1e7>
    1571:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
    1575:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1578:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    157b:	83 f9 28             	cmp    $0x28,%ecx
    157e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    1585:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
    158b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
    1591:	0f 87 25 00 00 00    	ja     15bc <printf+0x1ac>
    1597:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
    159d:	48 63 c8             	movslq %eax,%rcx
    15a0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
    15a7:	48 03 4a 10          	add    0x10(%rdx),%rcx
    15ab:	83 c0 08             	add    $0x8,%eax
    15ae:	89 02                	mov    %eax,(%rdx)
    15b0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
    15b7:	e9 1d 00 00 00       	jmpq   15d9 <printf+0x1c9>
    15bc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
    15c3:	48 8b 48 08          	mov    0x8(%rax),%rcx
    15c7:	48 89 ca             	mov    %rcx,%rdx
    15ca:	48 83 c1 08          	add    $0x8,%rcx
    15ce:	48 89 48 08          	mov    %rcx,0x8(%rax)
    15d2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
    15d9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    15e0:	ba 0a 00 00 00       	mov    $0xa,%edx
    15e5:	b9 01 00 00 00       	mov    $0x1,%ecx
    15ea:	8b 30                	mov    (%rax),%esi
    15ec:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
    15f2:	e8 a9 03 00 00       	callq  19a0 <printint>
      } else if(c == 'x' || c == 'p'){
    15f7:	e9 43 02 00 00       	jmpq   183f <printf+0x42f>
    15fc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
    1600:	0f 84 0a 00 00 00    	je     1610 <printf+0x200>
    1606:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
    160a:	0f 85 1d 01 00 00    	jne    172d <printf+0x31d>
        if (lflag == 1)
    1610:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
    1614:	0f 85 8b 00 00 00    	jne    16a5 <printf+0x295>
    161a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
    161e:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1621:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    1624:	83 f9 28             	cmp    $0x28,%ecx
    1627:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
    162e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
    1634:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
    163a:	0f 87 25 00 00 00    	ja     1665 <printf+0x255>
    1640:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    1646:	48 63 c8             	movslq %eax,%rcx
    1649:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
    1650:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1654:	83 c0 08             	add    $0x8,%eax
    1657:	89 02                	mov    %eax,(%rdx)
    1659:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
    1660:	e9 1d 00 00 00       	jmpq   1682 <printf+0x272>
    1665:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    166c:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1670:	48 89 ca             	mov    %rcx,%rdx
    1673:	48 83 c1 08          	add    $0x8,%rcx
    1677:	48 89 48 08          	mov    %rcx,0x8(%rax)
    167b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
    1682:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
    1689:	ba 10 00 00 00       	mov    $0x10,%edx
    168e:	31 c9                	xor    %ecx,%ecx
    1690:	48 8b 00             	mov    (%rax),%rax
    1693:	89 c6                	mov    %eax,%esi
    1695:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
    169b:	e8 00 02 00 00       	callq  18a0 <printint64>
    16a0:	e9 83 00 00 00       	jmpq   1728 <printf+0x318>
    16a5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
    16a9:	8b 7d fc             	mov    -0x4(%rbp),%edi
    16ac:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    16af:	83 f9 28             	cmp    $0x28,%ecx
    16b2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
    16b9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
    16bf:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
    16c5:	0f 87 25 00 00 00    	ja     16f0 <printf+0x2e0>
    16cb:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
    16d1:	48 63 c8             	movslq %eax,%rcx
    16d4:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
    16db:	48 03 4a 10          	add    0x10(%rdx),%rcx
    16df:	83 c0 08             	add    $0x8,%eax
    16e2:	89 02                	mov    %eax,(%rdx)
    16e4:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
    16eb:	e9 1d 00 00 00       	jmpq   170d <printf+0x2fd>
    16f0:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
    16f7:	48 8b 48 08          	mov    0x8(%rax),%rcx
    16fb:	48 89 ca             	mov    %rcx,%rdx
    16fe:	48 83 c1 08          	add    $0x8,%rcx
    1702:	48 89 48 08          	mov    %rcx,0x8(%rax)
    1706:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
    170d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
    1714:	ba 10 00 00 00       	mov    $0x10,%edx
    1719:	31 c9                	xor    %ecx,%ecx
    171b:	8b 30                	mov    (%rax),%esi
    171d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
    1723:	e8 78 02 00 00       	callq  19a0 <printint>
      } else if(c == 's'){
    1728:	e9 0d 01 00 00       	jmpq   183a <printf+0x42a>
    172d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
    1731:	0f 85 bc 00 00 00    	jne    17f3 <printf+0x3e3>
    1737:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
    173b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    173e:	83 f9 28             	cmp    $0x28,%ecx
    1741:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
    1748:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
    174e:	0f 87 25 00 00 00    	ja     1779 <printf+0x369>
    1754:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
    175a:	48 63 c8             	movslq %eax,%rcx
    175d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
    1764:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1768:	83 c0 08             	add    $0x8,%eax
    176b:	89 02                	mov    %eax,(%rdx)
    176d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
    1774:	e9 1d 00 00 00       	jmpq   1796 <printf+0x386>
    1779:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    1780:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1784:	48 89 ca             	mov    %rcx,%rdx
    1787:	48 83 c1 08          	add    $0x8,%rcx
    178b:	48 89 48 08          	mov    %rcx,0x8(%rax)
    178f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
    1796:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    179d:	48 8b 00             	mov    (%rax),%rax
    17a0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    17a4:	48 83 f8 00          	cmp    $0x0,%rax
    17a8:	0f 85 0e 00 00 00    	jne    17bc <printf+0x3ac>
    17ae:	48 b8 4d 28 00 00 00 	movabs $0x284d,%rax
    17b5:	00 00 00 
          s = "(null)";
    17b8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
    17bc:	e9 00 00 00 00       	jmpq   17c1 <printf+0x3b1>
    17c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17c5:	80 38 00             	cmpb   $0x0,(%rax)
    17c8:	0f 84 20 00 00 00    	je     17ee <printf+0x3de>
          putc(fd, *s);
    17ce:	8b 7d fc             	mov    -0x4(%rbp),%edi
    17d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17d5:	0f be 30             	movsbl (%rax),%esi
    17d8:	e8 93 00 00 00       	callq  1870 <putc>
        for(; *s; s++)
    17dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17e1:	48 83 c0 01          	add    $0x1,%rax
    17e5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    17e9:	e9 d3 ff ff ff       	jmpq   17c1 <printf+0x3b1>
      } else if(c == '%'){
    17ee:	e9 42 00 00 00       	jmpq   1835 <printf+0x425>
    17f3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    17f7:	0f 85 15 00 00 00    	jne    1812 <printf+0x402>
        putc(fd, c);
    17fd:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1800:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1803:	88 c1                	mov    %al,%cl
    1805:	0f be f1             	movsbl %cl,%esi
    1808:	e8 63 00 00 00       	callq  1870 <putc>
      } else {
    180d:	e9 1e 00 00 00       	jmpq   1830 <printf+0x420>
    1812:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1817:	8b 7d fc             	mov    -0x4(%rbp),%edi
    181a:	e8 51 00 00 00       	callq  1870 <putc>
        putc(fd, c);
    181f:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1822:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    1825:	40 88 f0             	mov    %sil,%al
    1828:	0f be f0             	movsbl %al,%esi
    182b:	e8 40 00 00 00       	callq  1870 <putc>
    1830:	e9 00 00 00 00       	jmpq   1835 <printf+0x425>
    1835:	e9 00 00 00 00       	jmpq   183a <printf+0x42a>
    183a:	e9 00 00 00 00       	jmpq   183f <printf+0x42f>
    183f:	e9 00 00 00 00       	jmpq   1844 <printf+0x434>
      }
      state = 0;
    1844:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    184b:	e9 00 00 00 00       	jmpq   1850 <printf+0x440>
    }
  }
    1850:	e9 00 00 00 00       	jmpq   1855 <printf+0x445>
  for(i = 0; fmt[i]; i++){
    1855:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1858:	83 c0 01             	add    $0x1,%eax
    185b:	89 45 e0             	mov    %eax,-0x20(%rbp)
    185e:	e9 fe fb ff ff       	jmpq   1461 <printf+0x51>

  va_end(valist);
}
    1863:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
    186a:	5d                   	pop    %rbp
    186b:	c3                   	retq   
    186c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001870 <putc>:
{
    1870:	55                   	push   %rbp
    1871:	48 89 e5             	mov    %rsp,%rbp
    1874:	48 83 ec 10          	sub    $0x10,%rsp
    1878:	40 88 f0             	mov    %sil,%al
    187b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
    187f:	ba 01 00 00 00       	mov    $0x1,%edx
    1884:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1887:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
    188a:	8b 7d fc             	mov    -0x4(%rbp),%edi
    188d:	e8 d6 05 00 00       	callq  1e68 <write>
}
    1892:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1895:	48 83 c4 10          	add    $0x10,%rsp
    1899:	5d                   	pop    %rbp
    189a:	c3                   	retq   
    189b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000018a0 <printint64>:
{
    18a0:	55                   	push   %rbp
    18a1:	48 89 e5             	mov    %rsp,%rbp
    18a4:	48 83 ec 50          	sub    $0x50,%rsp
    18a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    18ab:	89 75 f8             	mov    %esi,-0x8(%rbp)
    18ae:	89 55 f4             	mov    %edx,-0xc(%rbp)
    18b1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
    18b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    18b8:	0f 84 30 00 00 00    	je     18ee <printint64+0x4e>
    18be:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    18c2:	0f 9c c0             	setl   %al
    18c5:	88 c1                	mov    %al,%cl
    18c7:	80 e1 01             	and    $0x1,%cl
    18ca:	0f b6 d1             	movzbl %cl,%edx
    18cd:	89 55 f0             	mov    %edx,-0x10(%rbp)
    18d0:	a8 01                	test   $0x1,%al
    18d2:	0f 85 05 00 00 00    	jne    18dd <printint64+0x3d>
    18d8:	e9 11 00 00 00       	jmpq   18ee <printint64+0x4e>
    18dd:	31 c0                	xor    %eax,%eax
    x = -xx;
    18df:	2b 45 f8             	sub    -0x8(%rbp),%eax
    18e2:	48 63 c8             	movslq %eax,%rcx
    18e5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    18e9:	e9 08 00 00 00       	jmpq   18f6 <printint64+0x56>
    x = xx;
    18ee:	48 63 45 f8          	movslq -0x8(%rbp),%rax
    18f2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
    18f6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
    18fd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1901:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1905:	31 d2                	xor    %edx,%edx
    1907:	48 f7 f1             	div    %rcx
    190a:	40 8a 34 15 10 2b 00 	mov    0x2b10(,%rdx,1),%sil
    1911:	00 
    1912:	8b 7d cc             	mov    -0x34(%rbp),%edi
    1915:	41 89 f8             	mov    %edi,%r8d
    1918:	41 83 c0 01          	add    $0x1,%r8d
    191c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
    1920:	48 63 cf             	movslq %edi,%rcx
    1923:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
    1928:	48 63 45 f4          	movslq -0xc(%rbp),%rax
    192c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    1930:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1934:	48 89 c8             	mov    %rcx,%rax
    1937:	31 d2                	xor    %edx,%edx
    1939:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    193d:	48 f7 f1             	div    %rcx
    1940:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1944:	48 83 f8 00          	cmp    $0x0,%rax
    1948:	0f 85 af ff ff ff    	jne    18fd <printint64+0x5d>
  if(sgn)
    194e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1952:	0f 84 13 00 00 00    	je     196b <printint64+0xcb>
    buf[i++] = '-';
    1958:	8b 45 cc             	mov    -0x34(%rbp),%eax
    195b:	89 c1                	mov    %eax,%ecx
    195d:	83 c1 01             	add    $0x1,%ecx
    1960:	89 4d cc             	mov    %ecx,-0x34(%rbp)
    1963:	48 63 d0             	movslq %eax,%rdx
    1966:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
    196b:	e9 00 00 00 00       	jmpq   1970 <printint64+0xd0>
    1970:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1973:	83 c0 ff             	add    $0xffffffff,%eax
    1976:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1979:	83 f8 00             	cmp    $0x0,%eax
    197c:	0f 8c 16 00 00 00    	jl     1998 <printint64+0xf8>
    putc(fd, buf[i]);
    1982:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1985:	48 63 45 cc          	movslq -0x34(%rbp),%rax
    1989:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
    198e:	e8 dd fe ff ff       	callq  1870 <putc>
  while(--i >= 0)
    1993:	e9 d8 ff ff ff       	jmpq   1970 <printint64+0xd0>
}
    1998:	48 83 c4 50          	add    $0x50,%rsp
    199c:	5d                   	pop    %rbp
    199d:	c3                   	retq   
    199e:	66 90                	xchg   %ax,%ax

00000000000019a0 <printint>:
{
    19a0:	55                   	push   %rbp
    19a1:	48 89 e5             	mov    %rsp,%rbp
    19a4:	48 83 ec 30          	sub    $0x30,%rsp
    19a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    19ab:	89 75 f8             	mov    %esi,-0x8(%rbp)
    19ae:	89 55 f4             	mov    %edx,-0xc(%rbp)
    19b1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
    19b4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
    19bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    19bf:	0f 84 1e 00 00 00    	je     19e3 <printint+0x43>
    19c5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    19c9:	0f 8d 14 00 00 00    	jge    19e3 <printint+0x43>
    19cf:	31 c0                	xor    %eax,%eax
    neg = 1;
    19d1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
    19d8:	2b 45 f8             	sub    -0x8(%rbp),%eax
    19db:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
    19de:	e9 06 00 00 00       	jmpq   19e9 <printint+0x49>
    x = xx;
    19e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
    19e6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
    19e9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
    19f0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    19f3:	31 d2                	xor    %edx,%edx
    19f5:	f7 75 f4             	divl   -0xc(%rbp)
    19f8:	89 d2                	mov    %edx,%edx
    19fa:	89 d1                	mov    %edx,%ecx
    19fc:	40 8a 34 0d 30 2b 00 	mov    0x2b30(,%rcx,1),%sil
    1a03:	00 
    1a04:	8b 55 dc             	mov    -0x24(%rbp),%edx
    1a07:	89 d7                	mov    %edx,%edi
    1a09:	83 c7 01             	add    $0x1,%edi
    1a0c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    1a0f:	48 63 ca             	movslq %edx,%rcx
    1a12:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
    1a17:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1a1a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
    1a1d:	89 45 d0             	mov    %eax,-0x30(%rbp)
    1a20:	89 c8                	mov    %ecx,%eax
    1a22:	31 d2                	xor    %edx,%edx
    1a24:	8b 4d d0             	mov    -0x30(%rbp),%ecx
    1a27:	f7 f1                	div    %ecx
    1a29:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    1a2c:	83 f8 00             	cmp    $0x0,%eax
    1a2f:	0f 85 bb ff ff ff    	jne    19f0 <printint+0x50>
  if(neg)
    1a35:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    1a39:	0f 84 13 00 00 00    	je     1a52 <printint+0xb2>
    buf[i++] = '-';
    1a3f:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1a42:	89 c1                	mov    %eax,%ecx
    1a44:	83 c1 01             	add    $0x1,%ecx
    1a47:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    1a4a:	48 63 d0             	movslq %eax,%rdx
    1a4d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
    1a52:	e9 00 00 00 00       	jmpq   1a57 <printint+0xb7>
    1a57:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1a5a:	83 c0 ff             	add    $0xffffffff,%eax
    1a5d:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1a60:	83 f8 00             	cmp    $0x0,%eax
    1a63:	0f 8c 16 00 00 00    	jl     1a7f <printint+0xdf>
    putc(fd, buf[i]);
    1a69:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1a6c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
    1a70:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
    1a75:	e8 f6 fd ff ff       	callq  1870 <putc>
  while(--i >= 0)
    1a7a:	e9 d8 ff ff ff       	jmpq   1a57 <printint+0xb7>
}
    1a7f:	48 83 c4 30          	add    $0x30,%rsp
    1a83:	5d                   	pop    %rbp
    1a84:	c3                   	retq   
    1a85:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1a8c:	00 00 00 
    1a8f:	90                   	nop

0000000000001a90 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
    1a90:	55                   	push   %rbp
    1a91:	48 89 e5             	mov    %rsp,%rbp
    1a94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a98:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
    1a9c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1aa0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
    1aa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1aa8:	48 89 c1             	mov    %rax,%rcx
    1aab:	48 83 c1 01          	add    $0x1,%rcx
    1aaf:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    1ab3:	8a 10                	mov    (%rax),%dl
    1ab5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ab9:	48 89 c1             	mov    %rax,%rcx
    1abc:	48 83 c1 01          	add    $0x1,%rcx
    1ac0:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    1ac4:	88 10                	mov    %dl,(%rax)
    1ac6:	0f be f2             	movsbl %dl,%esi
    1ac9:	83 fe 00             	cmp    $0x0,%esi
    1acc:	0f 84 05 00 00 00    	je     1ad7 <strcpy+0x47>
    1ad2:	e9 cd ff ff ff       	jmpq   1aa4 <strcpy+0x14>
    ;
  return os;
    1ad7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1adb:	5d                   	pop    %rbp
    1adc:	c3                   	retq   
    1add:	0f 1f 00             	nopl   (%rax)

0000000000001ae0 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
    1ae0:	55                   	push   %rbp
    1ae1:	48 89 e5             	mov    %rsp,%rbp
    1ae4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ae8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1aec:	31 c0                	xor    %eax,%eax
    1aee:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
    1af0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1af4:	0f be 02             	movsbl (%rdx),%eax
    1af7:	83 f8 00             	cmp    $0x0,%eax
    1afa:	88 4d ef             	mov    %cl,-0x11(%rbp)
    1afd:	0f 84 18 00 00 00    	je     1b1b <strcmp+0x3b>
    1b03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b07:	0f be 08             	movsbl (%rax),%ecx
    1b0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b0e:	0f be 10             	movsbl (%rax),%edx
    1b11:	39 d1                	cmp    %edx,%ecx
    1b13:	40 0f 94 c6          	sete   %sil
    1b17:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
    1b1b:	8a 45 ef             	mov    -0x11(%rbp),%al
    1b1e:	a8 01                	test   $0x1,%al
    1b20:	0f 85 05 00 00 00    	jne    1b2b <strcmp+0x4b>
    1b26:	e9 1d 00 00 00       	jmpq   1b48 <strcmp+0x68>
    p++, q++;
    1b2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b2f:	48 83 c0 01          	add    $0x1,%rax
    1b33:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1b37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b3b:	48 83 c0 01          	add    $0x1,%rax
    1b3f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
    1b43:	e9 a4 ff ff ff       	jmpq   1aec <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    1b48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b4c:	0f b6 08             	movzbl (%rax),%ecx
    1b4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b53:	0f b6 10             	movzbl (%rax),%edx
    1b56:	29 d1                	sub    %edx,%ecx
    1b58:	89 c8                	mov    %ecx,%eax
    1b5a:	5d                   	pop    %rbp
    1b5b:	c3                   	retq   
    1b5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001b60 <strlen>:
}

uint
strlen(char *s)
{
    1b60:	55                   	push   %rbp
    1b61:	48 89 e5             	mov    %rsp,%rbp
    1b64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
    1b68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1b6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b73:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1b77:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    1b7b:	0f 84 13 00 00 00    	je     1b94 <strlen+0x34>
    1b81:	e9 00 00 00 00       	jmpq   1b86 <strlen+0x26>
    1b86:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1b89:	83 c0 01             	add    $0x1,%eax
    1b8c:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1b8f:	e9 db ff ff ff       	jmpq   1b6f <strlen+0xf>
    ;
  return n;
    1b94:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1b97:	5d                   	pop    %rbp
    1b98:	c3                   	retq   
    1b99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001ba0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
    1ba0:	55                   	push   %rbp
    1ba1:	48 89 e5             	mov    %rsp,%rbp
    1ba4:	48 83 ec 10          	sub    $0x10,%rsp
    1ba8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1bac:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1baf:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
    1bb2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1bb6:	8b 75 f4             	mov    -0xc(%rbp),%esi
    1bb9:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1bbc:	e8 0f 00 00 00       	callq  1bd0 <stosb>
  return dst;
    1bc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bc5:	48 83 c4 10          	add    $0x10,%rsp
    1bc9:	5d                   	pop    %rbp
    1bca:	c3                   	retq   
    1bcb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001bd0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1bd0:	55                   	push   %rbp
    1bd1:	48 89 e5             	mov    %rsp,%rbp
    1bd4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1bd8:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1bdb:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
    1bde:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1be2:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1be5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
    1be8:	89 d1                	mov    %edx,%ecx
    1bea:	fc                   	cld    
    1beb:	f3 aa                	rep stos %al,%es:(%rdi)
    1bed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1bf1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
    1bf4:	5d                   	pop    %rbp
    1bf5:	c3                   	retq   
    1bf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1bfd:	00 00 00 

0000000000001c00 <strchr>:
}

char*
strchr(const char *s, char c)
{
    1c00:	55                   	push   %rbp
    1c01:	48 89 e5             	mov    %rsp,%rbp
    1c04:	40 88 f0             	mov    %sil,%al
    1c07:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1c0b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
    1c0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c12:	80 38 00             	cmpb   $0x0,(%rax)
    1c15:	0f 84 36 00 00 00    	je     1c51 <strchr+0x51>
    if(*s == c)
    1c1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c1f:	0f be 08             	movsbl (%rax),%ecx
    1c22:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
    1c26:	39 d1                	cmp    %edx,%ecx
    1c28:	0f 85 0d 00 00 00    	jne    1c3b <strchr+0x3b>
      return (char*)s;
    1c2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c32:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1c36:	e9 1e 00 00 00       	jmpq   1c59 <strchr+0x59>
    if(*s == c)
    1c3b:	e9 00 00 00 00       	jmpq   1c40 <strchr+0x40>
  for(; *s; s++)
    1c40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c44:	48 83 c0 01          	add    $0x1,%rax
    1c48:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1c4c:	e9 bd ff ff ff       	jmpq   1c0e <strchr+0xe>
  return 0;
    1c51:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1c58:	00 
}
    1c59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c5d:	5d                   	pop    %rbp
    1c5e:	c3                   	retq   
    1c5f:	90                   	nop

0000000000001c60 <gets>:

char*
gets(char *buf, int max)
{
    1c60:	55                   	push   %rbp
    1c61:	48 89 e5             	mov    %rsp,%rbp
    1c64:	48 83 ec 20          	sub    $0x20,%rsp
    1c68:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1c6c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c6f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1c76:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1c79:	83 c0 01             	add    $0x1,%eax
    1c7c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    1c7f:	0f 8d 5e 00 00 00    	jge    1ce3 <gets+0x83>
    1c85:	31 ff                	xor    %edi,%edi
    1c87:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
    1c8b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
    1c90:	e8 cb 01 00 00       	callq  1e60 <read>
    1c95:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
    1c98:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    1c9c:	0f 8d 05 00 00 00    	jge    1ca7 <gets+0x47>
      break;
    1ca2:	e9 3c 00 00 00       	jmpq   1ce3 <gets+0x83>
    buf[i++] = c;
    1ca7:	8a 45 eb             	mov    -0x15(%rbp),%al
    1caa:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1cae:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1cb1:	89 d6                	mov    %edx,%esi
    1cb3:	83 c6 01             	add    $0x1,%esi
    1cb6:	89 75 f0             	mov    %esi,-0x10(%rbp)
    1cb9:	48 63 fa             	movslq %edx,%rdi
    1cbc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
    1cbf:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
    1cc3:	83 fa 0a             	cmp    $0xa,%edx
    1cc6:	0f 84 0d 00 00 00    	je     1cd9 <gets+0x79>
    1ccc:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
    1cd0:	83 f8 0d             	cmp    $0xd,%eax
    1cd3:	0f 85 05 00 00 00    	jne    1cde <gets+0x7e>
      break;
    1cd9:	e9 05 00 00 00       	jmpq   1ce3 <gets+0x83>
  for(i=0; i+1 < max; ){
    1cde:	e9 93 ff ff ff       	jmpq   1c76 <gets+0x16>
  }
  buf[i] = '\0';
    1ce3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ce7:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
    1ceb:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
    1cef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1cf3:	48 83 c4 20          	add    $0x20,%rsp
    1cf7:	5d                   	pop    %rbp
    1cf8:	c3                   	retq   
    1cf9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001d00 <stat>:
}

int
stat(char *n, struct stat *st)
{
    1d00:	55                   	push   %rbp
    1d01:	48 89 e5             	mov    %rsp,%rbp
    1d04:	48 83 ec 30          	sub    $0x30,%rsp
    1d08:	31 c0                	xor    %eax,%eax
    1d0a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1d0e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1d12:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    1d16:	89 c6                	mov    %eax,%esi
    1d18:	e8 6b 01 00 00       	callq  1e88 <open>
    1d1d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
    1d20:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1d24:	0f 8d 0c 00 00 00    	jge    1d36 <stat+0x36>
    return -1;
    1d2a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    1d31:	e9 20 00 00 00       	jmpq   1d56 <stat+0x56>
  r = fstat(fd, st);
    1d36:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    1d39:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    1d3d:	e8 5e 01 00 00       	callq  1ea0 <fstat>
    1d42:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
    1d45:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    1d48:	e8 23 01 00 00       	callq  1e70 <close>
  return r;
    1d4d:	8b 7d e0             	mov    -0x20(%rbp),%edi
    1d50:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1d53:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
    1d56:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1d59:	48 83 c4 30          	add    $0x30,%rsp
    1d5d:	5d                   	pop    %rbp
    1d5e:	c3                   	retq   
    1d5f:	90                   	nop

0000000000001d60 <atoi>:

int
atoi(const char *s)
{
    1d60:	55                   	push   %rbp
    1d61:	48 89 e5             	mov    %rsp,%rbp
    1d64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
    1d68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1d6f:	31 c0                	xor    %eax,%eax
    1d71:	88 c1                	mov    %al,%cl
    1d73:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
    1d78:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1d7c:	0f be 32             	movsbl (%rdx),%esi
    1d7f:	39 f0                	cmp    %esi,%eax
    1d81:	88 4d f3             	mov    %cl,-0xd(%rbp)
    1d84:	0f 8f 10 00 00 00    	jg     1d9a <atoi+0x3a>
    1d8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1d8e:	0f be 08             	movsbl (%rax),%ecx
    1d91:	83 f9 39             	cmp    $0x39,%ecx
    1d94:	0f 9e c2             	setle  %dl
    1d97:	88 55 f3             	mov    %dl,-0xd(%rbp)
    1d9a:	8a 45 f3             	mov    -0xd(%rbp),%al
    1d9d:	a8 01                	test   $0x1,%al
    1d9f:	0f 85 05 00 00 00    	jne    1daa <atoi+0x4a>
    1da5:	e9 23 00 00 00       	jmpq   1dcd <atoi+0x6d>
    n = n*10 + *s++ - '0';
    1daa:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
    1dae:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1db2:	48 89 ca             	mov    %rcx,%rdx
    1db5:	48 83 c2 01          	add    $0x1,%rdx
    1db9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    1dbd:	0f be 31             	movsbl (%rcx),%esi
    1dc0:	01 f0                	add    %esi,%eax
    1dc2:	83 e8 30             	sub    $0x30,%eax
    1dc5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
    1dc8:	e9 a2 ff ff ff       	jmpq   1d6f <atoi+0xf>
  return n;
    1dcd:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1dd0:	5d                   	pop    %rbp
    1dd1:	c3                   	retq   
    1dd2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1dd9:	1f 84 00 00 00 00 00 

0000000000001de0 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1de0:	55                   	push   %rbp
    1de1:	48 89 e5             	mov    %rsp,%rbp
    1de4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1de8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1dec:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
    1def:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1df3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
    1df7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1dfb:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
    1dff:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1e02:	89 c1                	mov    %eax,%ecx
    1e04:	83 c1 ff             	add    $0xffffffff,%ecx
    1e07:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    1e0a:	83 f8 00             	cmp    $0x0,%eax
    1e0d:	0f 8e 27 00 00 00    	jle    1e3a <memmove+0x5a>
    *dst++ = *src++;
    1e13:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1e17:	48 89 c1             	mov    %rax,%rcx
    1e1a:	48 83 c1 01          	add    $0x1,%rcx
    1e1e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    1e22:	8a 10                	mov    (%rax),%dl
    1e24:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1e28:	48 89 c1             	mov    %rax,%rcx
    1e2b:	48 83 c1 01          	add    $0x1,%rcx
    1e2f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1e33:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
    1e35:	e9 c5 ff ff ff       	jmpq   1dff <memmove+0x1f>
  return vdst;
    1e3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e3e:	5d                   	pop    %rbp
    1e3f:	c3                   	retq   

0000000000001e40 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    1e40:	b8 01 00 00 00       	mov    $0x1,%eax
    1e45:	cd 40                	int    $0x40
    1e47:	c3                   	retq   

0000000000001e48 <exit>:
SYSCALL(exit)
    1e48:	b8 02 00 00 00       	mov    $0x2,%eax
    1e4d:	cd 40                	int    $0x40
    1e4f:	c3                   	retq   

0000000000001e50 <wait>:
SYSCALL(wait)
    1e50:	b8 03 00 00 00       	mov    $0x3,%eax
    1e55:	cd 40                	int    $0x40
    1e57:	c3                   	retq   

0000000000001e58 <pipe>:
SYSCALL(pipe)
    1e58:	b8 04 00 00 00       	mov    $0x4,%eax
    1e5d:	cd 40                	int    $0x40
    1e5f:	c3                   	retq   

0000000000001e60 <read>:
SYSCALL(read)
    1e60:	b8 05 00 00 00       	mov    $0x5,%eax
    1e65:	cd 40                	int    $0x40
    1e67:	c3                   	retq   

0000000000001e68 <write>:
SYSCALL(write)
    1e68:	b8 10 00 00 00       	mov    $0x10,%eax
    1e6d:	cd 40                	int    $0x40
    1e6f:	c3                   	retq   

0000000000001e70 <close>:
SYSCALL(close)
    1e70:	b8 15 00 00 00       	mov    $0x15,%eax
    1e75:	cd 40                	int    $0x40
    1e77:	c3                   	retq   

0000000000001e78 <kill>:
SYSCALL(kill)
    1e78:	b8 06 00 00 00       	mov    $0x6,%eax
    1e7d:	cd 40                	int    $0x40
    1e7f:	c3                   	retq   

0000000000001e80 <exec>:
SYSCALL(exec)
    1e80:	b8 07 00 00 00       	mov    $0x7,%eax
    1e85:	cd 40                	int    $0x40
    1e87:	c3                   	retq   

0000000000001e88 <open>:
SYSCALL(open)
    1e88:	b8 0f 00 00 00       	mov    $0xf,%eax
    1e8d:	cd 40                	int    $0x40
    1e8f:	c3                   	retq   

0000000000001e90 <mknod>:
SYSCALL(mknod)
    1e90:	b8 11 00 00 00       	mov    $0x11,%eax
    1e95:	cd 40                	int    $0x40
    1e97:	c3                   	retq   

0000000000001e98 <unlink>:
SYSCALL(unlink)
    1e98:	b8 12 00 00 00       	mov    $0x12,%eax
    1e9d:	cd 40                	int    $0x40
    1e9f:	c3                   	retq   

0000000000001ea0 <fstat>:
SYSCALL(fstat)
    1ea0:	b8 08 00 00 00       	mov    $0x8,%eax
    1ea5:	cd 40                	int    $0x40
    1ea7:	c3                   	retq   

0000000000001ea8 <link>:
SYSCALL(link)
    1ea8:	b8 13 00 00 00       	mov    $0x13,%eax
    1ead:	cd 40                	int    $0x40
    1eaf:	c3                   	retq   

0000000000001eb0 <mkdir>:
SYSCALL(mkdir)
    1eb0:	b8 14 00 00 00       	mov    $0x14,%eax
    1eb5:	cd 40                	int    $0x40
    1eb7:	c3                   	retq   

0000000000001eb8 <chdir>:
SYSCALL(chdir)
    1eb8:	b8 09 00 00 00       	mov    $0x9,%eax
    1ebd:	cd 40                	int    $0x40
    1ebf:	c3                   	retq   

0000000000001ec0 <dup>:
SYSCALL(dup)
    1ec0:	b8 0a 00 00 00       	mov    $0xa,%eax
    1ec5:	cd 40                	int    $0x40
    1ec7:	c3                   	retq   

0000000000001ec8 <getpid>:
SYSCALL(getpid)
    1ec8:	b8 0b 00 00 00       	mov    $0xb,%eax
    1ecd:	cd 40                	int    $0x40
    1ecf:	c3                   	retq   

0000000000001ed0 <sbrk>:
SYSCALL(sbrk)
    1ed0:	b8 0c 00 00 00       	mov    $0xc,%eax
    1ed5:	cd 40                	int    $0x40
    1ed7:	c3                   	retq   

0000000000001ed8 <sleep>:
SYSCALL(sleep)
    1ed8:	b8 0d 00 00 00       	mov    $0xd,%eax
    1edd:	cd 40                	int    $0x40
    1edf:	c3                   	retq   

0000000000001ee0 <uptime>:
SYSCALL(uptime)
    1ee0:	b8 0e 00 00 00       	mov    $0xe,%eax
    1ee5:	cd 40                	int    $0x40
    1ee7:	c3                   	retq   

0000000000001ee8 <sysinfo>:
SYSCALL(sysinfo)
    1ee8:	b8 16 00 00 00       	mov    $0x16,%eax
    1eed:	cd 40                	int    $0x40
    1eef:	c3                   	retq   

0000000000001ef0 <mmap>:
SYSCALL(mmap)
    1ef0:	b8 17 00 00 00       	mov    $0x17,%eax
    1ef5:	cd 40                	int    $0x40
    1ef7:	c3                   	retq   

0000000000001ef8 <munmap>:
SYSCALL(munmap)
    1ef8:	b8 18 00 00 00       	mov    $0x18,%eax
    1efd:	cd 40                	int    $0x40
    1eff:	c3                   	retq   

0000000000001f00 <crashn>:
SYSCALL(crashn)
    1f00:	b8 19 00 00 00       	mov    $0x19,%eax
    1f05:	cd 40                	int    $0x40
    1f07:	c3                   	retq   
    1f08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1f0f:	00 

0000000000001f10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1f10:	55                   	push   %rbp
    1f11:	48 89 e5             	mov    %rsp,%rbp
    1f14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1f18:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1f1c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    1f20:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1f24:	48 8b 3c 25 48 2b 00 	mov    0x2b48,%rdi
    1f2b:	00 
    1f2c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1f30:	31 c0                	xor    %eax,%eax
    1f32:	88 c1                	mov    %al,%cl
    1f34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1f38:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    1f3c:	88 4d e7             	mov    %cl,-0x19(%rbp)
    1f3f:	0f 86 11 00 00 00    	jbe    1f56 <free+0x46>
    1f45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1f49:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1f4d:	48 3b 01             	cmp    (%rcx),%rax
    1f50:	0f 92 c2             	setb   %dl
    1f53:	88 55 e7             	mov    %dl,-0x19(%rbp)
    1f56:	8a 45 e7             	mov    -0x19(%rbp),%al
    1f59:	34 ff                	xor    $0xff,%al
    1f5b:	a8 01                	test   $0x1,%al
    1f5d:	0f 85 05 00 00 00    	jne    1f68 <free+0x58>
    1f63:	e9 4a 00 00 00       	jmpq   1fb2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1f68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f6c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1f70:	48 3b 01             	cmp    (%rcx),%rax
    1f73:	0f 82 24 00 00 00    	jb     1f9d <free+0x8d>
    1f79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1f7d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1f81:	0f 87 11 00 00 00    	ja     1f98 <free+0x88>
    1f87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1f8b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1f8f:	48 3b 01             	cmp    (%rcx),%rax
    1f92:	0f 83 05 00 00 00    	jae    1f9d <free+0x8d>
      break;
    1f98:	e9 15 00 00 00       	jmpq   1fb2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1f9d:	e9 00 00 00 00       	jmpq   1fa2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1fa2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1fa6:	48 8b 00             	mov    (%rax),%rax
    1fa9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1fad:	e9 7e ff ff ff       	jmpq   1f30 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1fb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1fb6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1fba:	8b 51 08             	mov    0x8(%rcx),%edx
    1fbd:	89 d1                	mov    %edx,%ecx
    1fbf:	48 c1 e1 04          	shl    $0x4,%rcx
    1fc3:	48 01 c8             	add    %rcx,%rax
    1fc6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1fca:	48 3b 01             	cmp    (%rcx),%rax
    1fcd:	0f 85 2a 00 00 00    	jne    1ffd <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1fd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1fd7:	48 8b 00             	mov    (%rax),%rax
    1fda:	8b 48 08             	mov    0x8(%rax),%ecx
    1fdd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1fe1:	03 48 08             	add    0x8(%rax),%ecx
    1fe4:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1fe7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1feb:	48 8b 00             	mov    (%rax),%rax
    1fee:	48 8b 00             	mov    (%rax),%rax
    1ff1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1ff5:	48 89 02             	mov    %rax,(%rdx)
  } else
    1ff8:	e9 0e 00 00 00       	jmpq   200b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    1ffd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2001:	48 8b 00             	mov    (%rax),%rax
    2004:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2008:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    200b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2013:	8b 51 08             	mov    0x8(%rcx),%edx
    2016:	89 d1                	mov    %edx,%ecx
    2018:	48 c1 e1 04          	shl    $0x4,%rcx
    201c:	48 01 c8             	add    %rcx,%rax
    201f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    2023:	0f 85 24 00 00 00    	jne    204d <free+0x13d>
    p->s.size += bp->s.size;
    2029:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    202d:	8b 48 08             	mov    0x8(%rax),%ecx
    2030:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2034:	03 48 08             	add    0x8(%rax),%ecx
    2037:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    203a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    203e:	48 8b 00             	mov    (%rax),%rax
    2041:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2045:	48 89 02             	mov    %rax,(%rdx)
  } else
    2048:	e9 0b 00 00 00       	jmpq   2058 <free+0x148>
    p->s.ptr = bp;
    204d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2051:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2055:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    2058:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    205c:	48 89 04 25 48 2b 00 	mov    %rax,0x2b48
    2063:	00 
}
    2064:	5d                   	pop    %rbp
    2065:	c3                   	retq   
    2066:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    206d:	00 00 00 

0000000000002070 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    2070:	55                   	push   %rbp
    2071:	48 89 e5             	mov    %rsp,%rbp
    2074:	48 83 ec 30          	sub    $0x30,%rsp
    2078:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    207b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    207e:	89 f8                	mov    %edi,%eax
    2080:	48 83 c0 10          	add    $0x10,%rax
    2084:	48 83 e8 01          	sub    $0x1,%rax
    2088:	48 c1 e8 04          	shr    $0x4,%rax
    208c:	48 83 c0 01          	add    $0x1,%rax
    2090:	89 c7                	mov    %eax,%edi
    2092:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    2095:	48 8b 04 25 48 2b 00 	mov    0x2b48,%rax
    209c:	00 
    209d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20a1:	48 83 f8 00          	cmp    $0x0,%rax
    20a5:	0f 85 29 00 00 00    	jne    20d4 <malloc+0x64>
    20ab:	48 b8 50 2b 00 00 00 	movabs $0x2b50,%rax
    20b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    20b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20b9:	48 89 04 25 48 2b 00 	mov    %rax,0x2b48
    20c0:	00 
    20c1:	48 89 04 25 50 2b 00 	mov    %rax,0x2b50
    20c8:	00 
    base.s.size = 0;
    20c9:	c7 04 25 58 2b 00 00 	movl   $0x0,0x2b58
    20d0:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    20d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20d8:	48 8b 00             	mov    (%rax),%rax
    20db:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    20df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20e3:	8b 48 08             	mov    0x8(%rax),%ecx
    20e6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    20e9:	0f 82 73 00 00 00    	jb     2162 <malloc+0xf2>
      if(p->s.size == nunits)
    20ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20f3:	8b 48 08             	mov    0x8(%rax),%ecx
    20f6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    20f9:	0f 85 13 00 00 00    	jne    2112 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    20ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2103:	48 8b 00             	mov    (%rax),%rax
    2106:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    210a:	48 89 01             	mov    %rax,(%rcx)
    210d:	e9 33 00 00 00       	jmpq   2145 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    2112:	8b 45 dc             	mov    -0x24(%rbp),%eax
    2115:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2119:	8b 51 08             	mov    0x8(%rcx),%edx
    211c:	29 c2                	sub    %eax,%edx
    211e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    2121:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2125:	8b 41 08             	mov    0x8(%rcx),%eax
    2128:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    212c:	89 c0                	mov    %eax,%eax
    212e:	89 c6                	mov    %eax,%esi
    2130:	48 c1 e6 04          	shl    $0x4,%rsi
    2134:	48 01 f1             	add    %rsi,%rcx
    2137:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    213b:	8b 45 dc             	mov    -0x24(%rbp),%eax
    213e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2142:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    2145:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2149:	48 89 04 25 48 2b 00 	mov    %rax,0x2b48
    2150:	00 
      return (void*)(p + 1);
    2151:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2155:	48 83 c0 10          	add    $0x10,%rax
    2159:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    215d:	e9 57 00 00 00       	jmpq   21b9 <malloc+0x149>
    }
    if(p == freep)
    2162:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2166:	48 3b 04 25 48 2b 00 	cmp    0x2b48,%rax
    216d:	00 
    216e:	0f 85 28 00 00 00    	jne    219c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    2174:	8b 7d dc             	mov    -0x24(%rbp),%edi
    2177:	e8 54 00 00 00       	callq  21d0 <morecore>
    217c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2180:	48 83 f8 00          	cmp    $0x0,%rax
    2184:	0f 85 0d 00 00 00    	jne    2197 <malloc+0x127>
        return 0;
    218a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    2191:	00 
    2192:	e9 22 00 00 00       	jmpq   21b9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    2197:	e9 00 00 00 00       	jmpq   219c <malloc+0x12c>
  }
    219c:	e9 00 00 00 00       	jmpq   21a1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    21a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    21a5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    21a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    21ad:	48 8b 00             	mov    (%rax),%rax
    21b0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    21b4:	e9 26 ff ff ff       	jmpq   20df <malloc+0x6f>
    21b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    21bd:	48 83 c4 30          	add    $0x30,%rsp
    21c1:	5d                   	pop    %rbp
    21c2:	c3                   	retq   
    21c3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    21ca:	84 00 00 00 00 00 

00000000000021d0 <morecore>:
{
    21d0:	55                   	push   %rbp
    21d1:	48 89 e5             	mov    %rsp,%rbp
    21d4:	48 83 ec 20          	sub    $0x20,%rsp
    21d8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    21db:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    21e2:	0f 83 07 00 00 00    	jae    21ef <morecore+0x1f>
    nu = 4096;
    21e8:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    21ef:	8b 45 f4             	mov    -0xc(%rbp),%eax
    21f2:	89 c1                	mov    %eax,%ecx
    21f4:	48 c1 e1 04          	shl    $0x4,%rcx
    21f8:	89 c8                	mov    %ecx,%eax
    21fa:	89 c7                	mov    %eax,%edi
    21fc:	e8 cf fc ff ff       	callq  1ed0 <sbrk>
    2201:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2208:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    220c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    2210:	0f 85 0d 00 00 00    	jne    2223 <morecore+0x53>
    return 0;
    2216:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    221d:	00 
    221e:	e9 2e 00 00 00       	jmpq   2251 <morecore+0x81>
  hp = (Header*)p;
    2223:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2227:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    222b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    222e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2232:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    2235:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2239:	48 83 c0 10          	add    $0x10,%rax
    223d:	48 89 c7             	mov    %rax,%rdi
    2240:	e8 cb fc ff ff       	callq  1f10 <free>
  return freep;
    2245:	48 8b 04 25 48 2b 00 	mov    0x2b48,%rax
    224c:	00 
    224d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    2251:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2255:	48 83 c4 20          	add    $0x20,%rsp
    2259:	5d                   	pop    %rbp
    225a:	c3                   	retq   
