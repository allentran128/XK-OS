
out/user/_lab4test:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <swaptest>:
    while(1) {} \
  } while (0)

void
swaptest(void)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
       b:	31 ff                	xor    %edi,%edi
  char *start = sbrk(0);
       d:	e8 9e 0f 00 00       	callq  fb0 <sbrk>
      12:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  char *a;
  int i;
  int b = 4096;
      16:	c7 45 e8 00 10 00 00 	movl   $0x1000,-0x18(%rbp)
  int num_pages_to_alloc = 6000;
      1d:	c7 45 e4 70 17 00 00 	movl   $0x1770,-0x1c(%rbp)
  struct sys_info info1, info2, info3;

  for(i = 0; i < num_pages_to_alloc; i++){
      24:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
      2b:	8b 45 ec             	mov    -0x14(%rbp),%eax
      2e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
      31:	0f 8d 7b 00 00 00    	jge    b2 <swaptest+0xb2>
    a = sbrk(b);
      37:	8b 7d e8             	mov    -0x18(%rbp),%edi
      3a:	e8 71 0f 00 00       	callq  fb0 <sbrk>
      3f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
      46:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (a == (char*)-1) {
      4a:	48 39 4d f0          	cmp    %rcx,-0x10(%rbp)
      4e:	0f 85 1d 00 00 00    	jne    71 <swaptest+0x71>
      54:	48 be 3b 13 00 00 00 	movabs $0x133b,%rsi
      5b:	00 00 00 
      printf(stdout, "no more memory\n");
      5e:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
      65:	b0 00                	mov    $0x0,%al
      67:	e8 84 04 00 00       	callq  4f0 <printf>
      break;
      6c:	e9 41 00 00 00       	jmpq   b2 <swaptest+0xb2>
      71:	31 f6                	xor    %esi,%esi
    }
    memset(a, 0, b);
      73:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
      77:	8b 55 e8             	mov    -0x18(%rbp),%edx
      7a:	e8 01 0c 00 00       	callq  c80 <memset>
      7f:	48 be 4b 13 00 00 00 	movabs $0x134b,%rsi
      86:	00 00 00 
    *(int*)a = i;
      89:	8b 55 ec             	mov    -0x14(%rbp),%edx
      8c:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
      90:	89 17                	mov    %edx,(%rdi)
    printf(stdout, "%d pages allocated\n");
      92:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
      99:	48 89 45 98          	mov    %rax,-0x68(%rbp)
      9d:	b0 00                	mov    $0x0,%al
      9f:	e8 4c 04 00 00       	callq  4f0 <printf>
  for(i = 0; i < num_pages_to_alloc; i++){
      a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
      a7:	83 c0 01             	add    $0x1,%eax
      aa:	89 45 ec             	mov    %eax,-0x14(%rbp)
      ad:	e9 79 ff ff ff       	jmpq   2b <swaptest+0x2b>
      b2:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  }

  sysinfo(&info1);
      b6:	e8 0d 0f 00 00       	callq  fc8 <sysinfo>

  // check whether memory data is consistent
  for(i = 0; i < num_pages_to_alloc; i++){
      bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
      c2:	89 45 94             	mov    %eax,-0x6c(%rbp)
      c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
      c8:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
      cb:	0f 8d b6 00 00 00    	jge    187 <swaptest+0x187>
      d1:	48 be cf 13 00 00 00 	movabs $0x13cf,%rsi
      d8:	00 00 00 
    printf(stdout, "%d\n", i);
      db:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
      e2:	8b 55 ec             	mov    -0x14(%rbp),%edx
      e5:	b0 00                	mov    $0x0,%al
      e7:	e8 04 04 00 00       	callq  4f0 <printf>
    if (*(int*)(start + i*b) != i) {
      ec:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
      f0:	8b 55 ec             	mov    -0x14(%rbp),%edx
      f3:	0f af 55 e8          	imul   -0x18(%rbp),%edx
      f7:	48 63 ca             	movslq %edx,%rcx
      fa:	8b 14 0e             	mov    (%rsi,%rcx,1),%edx
      fd:	3b 55 ec             	cmp    -0x14(%rbp),%edx
     100:	0f 84 6e 00 00 00    	je     174 <swaptest+0x174>
      error("data is incorrect, should be %d, but %d\n", i, *(int*)(start + i*b));
     106:	e9 00 00 00 00       	jmpq   10b <swaptest+0x10b>
     10b:	48 be 5f 13 00 00 00 	movabs $0x135f,%rsi
     112:	00 00 00 
     115:	ba 2e 00 00 00       	mov    $0x2e,%edx
     11a:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     121:	b0 00                	mov    $0x0,%al
     123:	e8 c8 03 00 00       	callq  4f0 <printf>
     128:	48 be 71 13 00 00 00 	movabs $0x1371,%rsi
     12f:	00 00 00 
     132:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     139:	8b 55 ec             	mov    -0x14(%rbp),%edx
     13c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     140:	44 8b 45 ec          	mov    -0x14(%rbp),%r8d
     144:	44 0f af 45 e8       	imul   -0x18(%rbp),%r8d
     149:	4d 63 c8             	movslq %r8d,%r9
     14c:	42 8b 0c 09          	mov    (%rcx,%r9,1),%ecx
     150:	b0 00                	mov    $0x0,%al
     152:	e8 99 03 00 00       	callq  4f0 <printf>
     157:	48 be 33 14 00 00 00 	movabs $0x1433,%rsi
     15e:	00 00 00 
     161:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     168:	b0 00                	mov    $0x0,%al
     16a:	e8 81 03 00 00       	callq  4f0 <printf>
     16f:	e9 fb ff ff ff       	jmpq   16f <swaptest+0x16f>
    }
  }
     174:	e9 00 00 00 00       	jmpq   179 <swaptest+0x179>
  for(i = 0; i < num_pages_to_alloc; i++){
     179:	8b 45 ec             	mov    -0x14(%rbp),%eax
     17c:	83 c0 01             	add    $0x1,%eax
     17f:	89 45 ec             	mov    %eax,-0x14(%rbp)
     182:	e9 3e ff ff ff       	jmpq   c5 <swaptest+0xc5>
     187:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi

  sysinfo(&info2);
     18b:	e8 38 0e 00 00       	callq  fc8 <sysinfo>
     190:	48 be 9a 13 00 00 00 	movabs $0x139a,%rsi
     197:	00 00 00 

  printf(stdout, "number of disk reads = %d\n", info2.num_disk_reads - info1.num_disk_reads);
     19a:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     1a1:	8b 4d c8             	mov    -0x38(%rbp),%ecx
     1a4:	2b 4d e0             	sub    -0x20(%rbp),%ecx
     1a7:	89 ca                	mov    %ecx,%edx
     1a9:	89 45 90             	mov    %eax,-0x70(%rbp)
     1ac:	b0 00                	mov    $0x0,%al
     1ae:	e8 3d 03 00 00       	callq  4f0 <printf>

  for(i = 0; i < num_pages_to_alloc; i++){
     1b3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     1ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
     1bd:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
     1c0:	0f 8d 1e 00 00 00    	jge    1e4 <swaptest+0x1e4>
     1c6:	31 c0                	xor    %eax,%eax
    sbrk(-b);
     1c8:	2b 45 e8             	sub    -0x18(%rbp),%eax
     1cb:	89 c7                	mov    %eax,%edi
     1cd:	e8 de 0d 00 00       	callq  fb0 <sbrk>
     1d2:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  for(i = 0; i < num_pages_to_alloc; i++){
     1d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
     1d9:	83 c0 01             	add    $0x1,%eax
     1dc:	89 45 ec             	mov    %eax,-0x14(%rbp)
     1df:	e9 d6 ff ff ff       	jmpq   1ba <swaptest+0x1ba>
     1e4:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
  }

  sysinfo(&info3);
     1e8:	e8 db 0d 00 00       	callq  fc8 <sysinfo>
     1ed:	48 be b5 13 00 00 00 	movabs $0x13b5,%rsi
     1f4:	00 00 00 
  printf(stdout, "number of pages in swap = %d\n", info3.pages_in_swap);
     1f7:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     1fe:	8b 55 a4             	mov    -0x5c(%rbp),%edx
     201:	89 45 84             	mov    %eax,-0x7c(%rbp)
     204:	b0 00                	mov    $0x0,%al
     206:	e8 e5 02 00 00       	callq  4f0 <printf>
     20b:	48 be d3 13 00 00 00 	movabs $0x13d3,%rsi
     212:	00 00 00 

  printf(stdout, "swaptest OK\n");
     215:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     21c:	b0 00                	mov    $0x0,%al
     21e:	e8 cd 02 00 00       	callq  4f0 <printf>
}
     223:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
     22a:	5d                   	pop    %rbp
     22b:	c3                   	retq   
     22c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000230 <localitytest>:

void
localitytest(void)
{
     230:	55                   	push   %rbp
     231:	48 89 e5             	mov    %rsp,%rbp
     234:	48 83 ec 70          	sub    $0x70,%rsp
     238:	31 ff                	xor    %edi,%edi
  char *start = sbrk(0);
     23a:	e8 71 0d 00 00       	callq  fb0 <sbrk>
     23f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  char *a;
  int i,j,k;
  int b = 4096;
     243:	c7 45 e0 00 10 00 00 	movl   $0x1000,-0x20(%rbp)
  int groups = 6;
     24a:	c7 45 dc 06 00 00 00 	movl   $0x6,-0x24(%rbp)
  int pages_per_group = 1000;
     251:	c7 45 d8 e8 03 00 00 	movl   $0x3e8,-0x28(%rbp)
  struct sys_info info1, info2;

  for(i = 0; i < groups * pages_per_group; i++){
     258:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     25f:	8b 45 ec             	mov    -0x14(%rbp),%eax
     262:	8b 4d dc             	mov    -0x24(%rbp),%ecx
     265:	0f af 4d d8          	imul   -0x28(%rbp),%ecx
     269:	39 c8                	cmp    %ecx,%eax
     26b:	0f 8d 35 00 00 00    	jge    2a6 <localitytest+0x76>
    a = sbrk(b);
     271:	8b 7d e0             	mov    -0x20(%rbp),%edi
     274:	e8 37 0d 00 00       	callq  fb0 <sbrk>
     279:	31 f6                	xor    %esi,%esi
     27b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    memset(a, 0, b);
     27f:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     283:	8b 55 e0             	mov    -0x20(%rbp),%edx
     286:	e8 f5 09 00 00       	callq  c80 <memset>
    *(int*)a = i;
     28b:	8b 55 ec             	mov    -0x14(%rbp),%edx
     28e:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     292:	89 17                	mov    %edx,(%rdi)
     294:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  for(i = 0; i < groups * pages_per_group; i++){
     298:	8b 45 ec             	mov    -0x14(%rbp),%eax
     29b:	83 c0 01             	add    $0x1,%eax
     29e:	89 45 ec             	mov    %eax,-0x14(%rbp)
     2a1:	e9 b9 ff ff ff       	jmpq   25f <localitytest+0x2f>
     2a6:	48 be 4b 13 00 00 00 	movabs $0x134b,%rsi
     2ad:	00 00 00 
  }

  printf(stdout, "%d pages allocated\n", groups*pages_per_group);
     2b0:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     2b7:	8b 45 dc             	mov    -0x24(%rbp),%eax
     2ba:	0f af 45 d8          	imul   -0x28(%rbp),%eax
     2be:	89 c2                	mov    %eax,%edx
     2c0:	b0 00                	mov    $0x0,%al
     2c2:	e8 29 02 00 00       	callq  4f0 <printf>
     2c7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi

  sysinfo(&info1);
     2cb:	e8 f8 0c 00 00       	callq  fc8 <sysinfo>

  // test whether LRU is implemented
  for(i = 0; i < groups; i++){
     2d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     2d7:	89 45 9c             	mov    %eax,-0x64(%rbp)
     2da:	8b 45 ec             	mov    -0x14(%rbp),%eax
     2dd:	3b 45 dc             	cmp    -0x24(%rbp),%eax
     2e0:	0f 8d df 00 00 00    	jge    3c5 <localitytest+0x195>
    for (j = i; j < groups; j++) {
     2e6:	8b 45 ec             	mov    -0x14(%rbp),%eax
     2e9:	89 45 e8             	mov    %eax,-0x18(%rbp)
     2ec:	8b 45 e8             	mov    -0x18(%rbp),%eax
     2ef:	3b 45 dc             	cmp    -0x24(%rbp),%eax
     2f2:	0f 8d ba 00 00 00    	jge    3b2 <localitytest+0x182>
      for (k = pages_per_group-1; k >=0 ; k--) {
     2f8:	8b 45 d8             	mov    -0x28(%rbp),%eax
     2fb:	83 e8 01             	sub    $0x1,%eax
     2fe:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     301:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     305:	0f 8c 94 00 00 00    	jl     39f <localitytest+0x16f>
        if (*(int*)(start + (j*pages_per_group + k)*b) != j*pages_per_group + k) {
     30b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     30f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
     312:	0f af 4d d8          	imul   -0x28(%rbp),%ecx
     316:	03 4d e4             	add    -0x1c(%rbp),%ecx
     319:	0f af 4d e0          	imul   -0x20(%rbp),%ecx
     31d:	48 63 d1             	movslq %ecx,%rdx
     320:	8b 0c 10             	mov    (%rax,%rdx,1),%ecx
     323:	8b 75 e8             	mov    -0x18(%rbp),%esi
     326:	0f af 75 d8          	imul   -0x28(%rbp),%esi
     32a:	03 75 e4             	add    -0x1c(%rbp),%esi
     32d:	39 f1                	cmp    %esi,%ecx
     32f:	0f 84 57 00 00 00    	je     38c <localitytest+0x15c>
          error("data is incorrect");
     335:	e9 00 00 00 00       	jmpq   33a <localitytest+0x10a>
     33a:	48 be 5f 13 00 00 00 	movabs $0x135f,%rsi
     341:	00 00 00 
     344:	ba 5a 00 00 00       	mov    $0x5a,%edx
     349:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     350:	b0 00                	mov    $0x0,%al
     352:	e8 99 01 00 00       	callq  4f0 <printf>
     357:	48 be e0 13 00 00 00 	movabs $0x13e0,%rsi
     35e:	00 00 00 
     361:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     368:	b0 00                	mov    $0x0,%al
     36a:	e8 81 01 00 00       	callq  4f0 <printf>
     36f:	48 be 33 14 00 00 00 	movabs $0x1433,%rsi
     376:	00 00 00 
     379:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     380:	b0 00                	mov    $0x0,%al
     382:	e8 69 01 00 00       	callq  4f0 <printf>
     387:	e9 fb ff ff ff       	jmpq   387 <localitytest+0x157>
        }
      }
     38c:	e9 00 00 00 00       	jmpq   391 <localitytest+0x161>
      for (k = pages_per_group-1; k >=0 ; k--) {
     391:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     394:	83 c0 ff             	add    $0xffffffff,%eax
     397:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     39a:	e9 62 ff ff ff       	jmpq   301 <localitytest+0xd1>
    }
     39f:	e9 00 00 00 00       	jmpq   3a4 <localitytest+0x174>
    for (j = i; j < groups; j++) {
     3a4:	8b 45 e8             	mov    -0x18(%rbp),%eax
     3a7:	83 c0 01             	add    $0x1,%eax
     3aa:	89 45 e8             	mov    %eax,-0x18(%rbp)
     3ad:	e9 3a ff ff ff       	jmpq   2ec <localitytest+0xbc>
  }
     3b2:	e9 00 00 00 00       	jmpq   3b7 <localitytest+0x187>
  for(i = 0; i < groups; i++){
     3b7:	8b 45 ec             	mov    -0x14(%rbp),%eax
     3ba:	83 c0 01             	add    $0x1,%eax
     3bd:	89 45 ec             	mov    %eax,-0x14(%rbp)
     3c0:	e9 15 ff ff ff       	jmpq   2da <localitytest+0xaa>
     3c5:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi

  sysinfo(&info2);
     3c9:	e8 fa 0b 00 00       	callq  fc8 <sysinfo>
     3ce:	48 be 9a 13 00 00 00 	movabs $0x139a,%rsi
     3d5:	00 00 00 
  // If LRU is implemented, the first ~4000 pages should not incur disk operations
  // Number of disk operations is around (2000 + 5000 + 4000) * 8 * 2 = 176000

  // we set threshold to be 230000 so any LRU-like implementation can pass our test

  printf(stdout, "number of disk reads = %d\n", info2.num_disk_reads - info1.num_disk_reads);
     3d8:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     3df:	8b 4d b8             	mov    -0x48(%rbp),%ecx
     3e2:	2b 4d d0             	sub    -0x30(%rbp),%ecx
     3e5:	89 ca                	mov    %ecx,%edx
     3e7:	89 45 98             	mov    %eax,-0x68(%rbp)
     3ea:	b0 00                	mov    $0x0,%al
     3ec:	e8 ff 00 00 00       	callq  4f0 <printf>
  if (info2.num_disk_reads - info1.num_disk_reads > 230000)
     3f1:	8b 4d b8             	mov    -0x48(%rbp),%ecx
     3f4:	2b 4d d0             	sub    -0x30(%rbp),%ecx
     3f7:	81 f9 70 82 03 00    	cmp    $0x38270,%ecx
     3fd:	0f 8e 57 00 00 00    	jle    45a <localitytest+0x22a>
    error("LRU function does not exist!");
     403:	e9 00 00 00 00       	jmpq   408 <localitytest+0x1d8>
     408:	48 be 5f 13 00 00 00 	movabs $0x135f,%rsi
     40f:	00 00 00 
     412:	ba 6f 00 00 00       	mov    $0x6f,%edx
     417:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     41e:	b0 00                	mov    $0x0,%al
     420:	e8 cb 00 00 00       	callq  4f0 <printf>
     425:	48 be f2 13 00 00 00 	movabs $0x13f2,%rsi
     42c:	00 00 00 
     42f:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     436:	b0 00                	mov    $0x0,%al
     438:	e8 b3 00 00 00       	callq  4f0 <printf>
     43d:	48 be 33 14 00 00 00 	movabs $0x1433,%rsi
     444:	00 00 00 
     447:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     44e:	b0 00                	mov    $0x0,%al
     450:	e8 9b 00 00 00       	callq  4f0 <printf>
     455:	e9 fb ff ff ff       	jmpq   455 <localitytest+0x225>

  for(i = 0; i < groups * pages_per_group; i++){
     45a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     461:	8b 45 ec             	mov    -0x14(%rbp),%eax
     464:	8b 4d dc             	mov    -0x24(%rbp),%ecx
     467:	0f af 4d d8          	imul   -0x28(%rbp),%ecx
     46b:	39 c8                	cmp    %ecx,%eax
     46d:	0f 8d 1e 00 00 00    	jge    491 <localitytest+0x261>
     473:	31 c0                	xor    %eax,%eax
    sbrk(-b);
     475:	2b 45 e0             	sub    -0x20(%rbp),%eax
     478:	89 c7                	mov    %eax,%edi
     47a:	e8 31 0b 00 00       	callq  fb0 <sbrk>
     47f:	48 89 45 90          	mov    %rax,-0x70(%rbp)
  for(i = 0; i < groups * pages_per_group; i++){
     483:	8b 45 ec             	mov    -0x14(%rbp),%eax
     486:	83 c0 01             	add    $0x1,%eax
     489:	89 45 ec             	mov    %eax,-0x14(%rbp)
     48c:	e9 d0 ff ff ff       	jmpq   461 <localitytest+0x231>
     491:	48 be 0f 14 00 00 00 	movabs $0x140f,%rsi
     498:	00 00 00 
  }

  printf(stdout, "localitytest OK\n");
     49b:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     4a2:	b0 00                	mov    $0x0,%al
     4a4:	e8 47 00 00 00       	callq  4f0 <printf>
}
     4a9:	48 83 c4 70          	add    $0x70,%rsp
     4ad:	5d                   	pop    %rbp
     4ae:	c3                   	retq   
     4af:	90                   	nop

00000000000004b0 <main>:

int
main(int argc, char *argv[])
{
     4b0:	55                   	push   %rbp
     4b1:	48 89 e5             	mov    %rsp,%rbp
     4b4:	48 83 ec 20          	sub    $0x20,%rsp
     4b8:	89 7d f8             	mov    %edi,-0x8(%rbp)
     4bb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  swaptest();
     4bf:	e8 3c fb ff ff       	callq  0 <swaptest>
  localitytest();
     4c4:	e8 67 fd ff ff       	callq  230 <localitytest>
     4c9:	48 be 20 14 00 00 00 	movabs $0x1420,%rsi
     4d0:	00 00 00 
  printf(stdout, "lab4 tests passed!!\n");
     4d3:	8b 3c 25 90 16 00 00 	mov    0x1690,%edi
     4da:	b0 00                	mov    $0x0,%al
     4dc:	e8 0f 00 00 00       	callq  4f0 <printf>
  exit();
     4e1:	e8 42 0a 00 00       	callq  f28 <exit>
     4e6:	89 45 ec             	mov    %eax,-0x14(%rbp)
     4e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000004f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4f0:	55                   	push   %rbp
     4f1:	48 89 e5             	mov    %rsp,%rbp
     4f4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     4fb:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     4ff:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     503:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     507:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     50b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     50f:	89 7d fc             	mov    %edi,-0x4(%rbp)
     512:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     516:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     51a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     51e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     522:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     526:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     52d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     533:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     53a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     541:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     545:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     549:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     54d:	0f 84 f0 03 00 00    	je     943 <printf+0x453>
    c = fmt[i] & 0xff;
     553:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     557:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     55b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     55f:	81 e2 ff 00 00 00    	and    $0xff,%edx
     565:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     568:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     56c:	0f 85 32 00 00 00    	jne    5a4 <printf+0xb4>
      if(c == '%'){
     572:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     576:	0f 85 13 00 00 00    	jne    58f <printf+0x9f>
        state = '%';
     57c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     583:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     58a:	e9 10 00 00 00       	jmpq   59f <printf+0xaf>
        putc(fd, c);
     58f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     592:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     595:	88 c1                	mov    %al,%cl
     597:	0f be f1             	movsbl %cl,%esi
     59a:	e8 b1 03 00 00       	callq  950 <putc>
      }
    } else if(state == '%'){
     59f:	e9 8c 03 00 00       	jmpq   930 <printf+0x440>
     5a4:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     5a8:	0f 85 7d 03 00 00    	jne    92b <printf+0x43b>
      if(c == 'l') {
     5ae:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     5b2:	0f 85 0c 00 00 00    	jne    5c4 <printf+0xd4>
        lflag = 1;
     5b8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     5bf:	e9 71 03 00 00       	jmpq   935 <printf+0x445>
      } else if(c == 'd'){
     5c4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     5c8:	0f 85 0e 01 00 00    	jne    6dc <printf+0x1ec>
        if (lflag == 1)
     5ce:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     5d2:	0f 85 79 00 00 00    	jne    651 <printf+0x161>
     5d8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     5dc:	8b 7d fc             	mov    -0x4(%rbp),%edi
     5df:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     5e2:	83 f9 28             	cmp    $0x28,%ecx
     5e5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     5e9:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     5ec:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     5ef:	0f 87 1f 00 00 00    	ja     614 <printf+0x124>
     5f5:	8b 45 80             	mov    -0x80(%rbp),%eax
     5f8:	48 63 c8             	movslq %eax,%rcx
     5fb:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     5ff:	48 03 4a 10          	add    0x10(%rdx),%rcx
     603:	83 c0 08             	add    $0x8,%eax
     606:	89 02                	mov    %eax,(%rdx)
     608:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     60f:	e9 1a 00 00 00       	jmpq   62e <printf+0x13e>
     614:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     618:	48 8b 48 08          	mov    0x8(%rax),%rcx
     61c:	48 89 ca             	mov    %rcx,%rdx
     61f:	48 83 c1 08          	add    $0x8,%rcx
     623:	48 89 48 08          	mov    %rcx,0x8(%rax)
     627:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     62e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     635:	ba 0a 00 00 00       	mov    $0xa,%edx
     63a:	b9 01 00 00 00       	mov    $0x1,%ecx
     63f:	48 8b 00             	mov    (%rax),%rax
     642:	89 c6                	mov    %eax,%esi
     644:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     647:	e8 34 03 00 00       	callq  980 <printint64>
     64c:	e9 86 00 00 00       	jmpq   6d7 <printf+0x1e7>
     651:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     655:	8b 7d fc             	mov    -0x4(%rbp),%edi
     658:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     65b:	83 f9 28             	cmp    $0x28,%ecx
     65e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     665:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     66b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     671:	0f 87 25 00 00 00    	ja     69c <printf+0x1ac>
     677:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     67d:	48 63 c8             	movslq %eax,%rcx
     680:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     687:	48 03 4a 10          	add    0x10(%rdx),%rcx
     68b:	83 c0 08             	add    $0x8,%eax
     68e:	89 02                	mov    %eax,(%rdx)
     690:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     697:	e9 1d 00 00 00       	jmpq   6b9 <printf+0x1c9>
     69c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     6a3:	48 8b 48 08          	mov    0x8(%rax),%rcx
     6a7:	48 89 ca             	mov    %rcx,%rdx
     6aa:	48 83 c1 08          	add    $0x8,%rcx
     6ae:	48 89 48 08          	mov    %rcx,0x8(%rax)
     6b2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     6b9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     6c0:	ba 0a 00 00 00       	mov    $0xa,%edx
     6c5:	b9 01 00 00 00       	mov    $0x1,%ecx
     6ca:	8b 30                	mov    (%rax),%esi
     6cc:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     6d2:	e8 a9 03 00 00       	callq  a80 <printint>
      } else if(c == 'x' || c == 'p'){
     6d7:	e9 43 02 00 00       	jmpq   91f <printf+0x42f>
     6dc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     6e0:	0f 84 0a 00 00 00    	je     6f0 <printf+0x200>
     6e6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     6ea:	0f 85 1d 01 00 00    	jne    80d <printf+0x31d>
        if (lflag == 1)
     6f0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     6f4:	0f 85 8b 00 00 00    	jne    785 <printf+0x295>
     6fa:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     6fe:	8b 7d fc             	mov    -0x4(%rbp),%edi
     701:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     704:	83 f9 28             	cmp    $0x28,%ecx
     707:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     70e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     714:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     71a:	0f 87 25 00 00 00    	ja     745 <printf+0x255>
     720:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     726:	48 63 c8             	movslq %eax,%rcx
     729:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     730:	48 03 4a 10          	add    0x10(%rdx),%rcx
     734:	83 c0 08             	add    $0x8,%eax
     737:	89 02                	mov    %eax,(%rdx)
     739:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     740:	e9 1d 00 00 00       	jmpq   762 <printf+0x272>
     745:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     74c:	48 8b 48 08          	mov    0x8(%rax),%rcx
     750:	48 89 ca             	mov    %rcx,%rdx
     753:	48 83 c1 08          	add    $0x8,%rcx
     757:	48 89 48 08          	mov    %rcx,0x8(%rax)
     75b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     762:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     769:	ba 10 00 00 00       	mov    $0x10,%edx
     76e:	31 c9                	xor    %ecx,%ecx
     770:	48 8b 00             	mov    (%rax),%rax
     773:	89 c6                	mov    %eax,%esi
     775:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     77b:	e8 00 02 00 00       	callq  980 <printint64>
     780:	e9 83 00 00 00       	jmpq   808 <printf+0x318>
     785:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     789:	8b 7d fc             	mov    -0x4(%rbp),%edi
     78c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     78f:	83 f9 28             	cmp    $0x28,%ecx
     792:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     799:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     79f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     7a5:	0f 87 25 00 00 00    	ja     7d0 <printf+0x2e0>
     7ab:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     7b1:	48 63 c8             	movslq %eax,%rcx
     7b4:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     7bb:	48 03 4a 10          	add    0x10(%rdx),%rcx
     7bf:	83 c0 08             	add    $0x8,%eax
     7c2:	89 02                	mov    %eax,(%rdx)
     7c4:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     7cb:	e9 1d 00 00 00       	jmpq   7ed <printf+0x2fd>
     7d0:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     7d7:	48 8b 48 08          	mov    0x8(%rax),%rcx
     7db:	48 89 ca             	mov    %rcx,%rdx
     7de:	48 83 c1 08          	add    $0x8,%rcx
     7e2:	48 89 48 08          	mov    %rcx,0x8(%rax)
     7e6:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     7ed:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     7f4:	ba 10 00 00 00       	mov    $0x10,%edx
     7f9:	31 c9                	xor    %ecx,%ecx
     7fb:	8b 30                	mov    (%rax),%esi
     7fd:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     803:	e8 78 02 00 00       	callq  a80 <printint>
      } else if(c == 's'){
     808:	e9 0d 01 00 00       	jmpq   91a <printf+0x42a>
     80d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     811:	0f 85 bc 00 00 00    	jne    8d3 <printf+0x3e3>
     817:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     81b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     81e:	83 f9 28             	cmp    $0x28,%ecx
     821:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     828:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     82e:	0f 87 25 00 00 00    	ja     859 <printf+0x369>
     834:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     83a:	48 63 c8             	movslq %eax,%rcx
     83d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     844:	48 03 4a 10          	add    0x10(%rdx),%rcx
     848:	83 c0 08             	add    $0x8,%eax
     84b:	89 02                	mov    %eax,(%rdx)
     84d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     854:	e9 1d 00 00 00       	jmpq   876 <printf+0x386>
     859:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     860:	48 8b 48 08          	mov    0x8(%rax),%rcx
     864:	48 89 ca             	mov    %rcx,%rdx
     867:	48 83 c1 08          	add    $0x8,%rcx
     86b:	48 89 48 08          	mov    %rcx,0x8(%rax)
     86f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     876:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     87d:	48 8b 00             	mov    (%rax),%rax
     880:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     884:	48 83 f8 00          	cmp    $0x0,%rax
     888:	0f 85 0e 00 00 00    	jne    89c <printf+0x3ac>
     88e:	48 b8 35 14 00 00 00 	movabs $0x1435,%rax
     895:	00 00 00 
          s = "(null)";
     898:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     89c:	e9 00 00 00 00       	jmpq   8a1 <printf+0x3b1>
     8a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     8a5:	80 38 00             	cmpb   $0x0,(%rax)
     8a8:	0f 84 20 00 00 00    	je     8ce <printf+0x3de>
          putc(fd, *s);
     8ae:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     8b5:	0f be 30             	movsbl (%rax),%esi
     8b8:	e8 93 00 00 00       	callq  950 <putc>
        for(; *s; s++)
     8bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     8c1:	48 83 c0 01          	add    $0x1,%rax
     8c5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     8c9:	e9 d3 ff ff ff       	jmpq   8a1 <printf+0x3b1>
      } else if(c == '%'){
     8ce:	e9 42 00 00 00       	jmpq   915 <printf+0x425>
     8d3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     8d7:	0f 85 15 00 00 00    	jne    8f2 <printf+0x402>
        putc(fd, c);
     8dd:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8e0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     8e3:	88 c1                	mov    %al,%cl
     8e5:	0f be f1             	movsbl %cl,%esi
     8e8:	e8 63 00 00 00       	callq  950 <putc>
      } else {
     8ed:	e9 1e 00 00 00       	jmpq   910 <printf+0x420>
     8f2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     8f7:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8fa:	e8 51 00 00 00       	callq  950 <putc>
        putc(fd, c);
     8ff:	8b 7d fc             	mov    -0x4(%rbp),%edi
     902:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     905:	40 88 f0             	mov    %sil,%al
     908:	0f be f0             	movsbl %al,%esi
     90b:	e8 40 00 00 00       	callq  950 <putc>
     910:	e9 00 00 00 00       	jmpq   915 <printf+0x425>
     915:	e9 00 00 00 00       	jmpq   91a <printf+0x42a>
     91a:	e9 00 00 00 00       	jmpq   91f <printf+0x42f>
     91f:	e9 00 00 00 00       	jmpq   924 <printf+0x434>
      }
      state = 0;
     924:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     92b:	e9 00 00 00 00       	jmpq   930 <printf+0x440>
    }
  }
     930:	e9 00 00 00 00       	jmpq   935 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     935:	8b 45 e0             	mov    -0x20(%rbp),%eax
     938:	83 c0 01             	add    $0x1,%eax
     93b:	89 45 e0             	mov    %eax,-0x20(%rbp)
     93e:	e9 fe fb ff ff       	jmpq   541 <printf+0x51>

  va_end(valist);
}
     943:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     94a:	5d                   	pop    %rbp
     94b:	c3                   	retq   
     94c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000950 <putc>:
{
     950:	55                   	push   %rbp
     951:	48 89 e5             	mov    %rsp,%rbp
     954:	48 83 ec 10          	sub    $0x10,%rsp
     958:	40 88 f0             	mov    %sil,%al
     95b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     95f:	ba 01 00 00 00       	mov    $0x1,%edx
     964:	89 7d fc             	mov    %edi,-0x4(%rbp)
     967:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     96a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     96d:	e8 d6 05 00 00       	callq  f48 <write>
}
     972:	89 45 f4             	mov    %eax,-0xc(%rbp)
     975:	48 83 c4 10          	add    $0x10,%rsp
     979:	5d                   	pop    %rbp
     97a:	c3                   	retq   
     97b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000980 <printint64>:
{
     980:	55                   	push   %rbp
     981:	48 89 e5             	mov    %rsp,%rbp
     984:	48 83 ec 50          	sub    $0x50,%rsp
     988:	89 7d fc             	mov    %edi,-0x4(%rbp)
     98b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     98e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     991:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     994:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     998:	0f 84 30 00 00 00    	je     9ce <printint64+0x4e>
     99e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     9a2:	0f 9c c0             	setl   %al
     9a5:	88 c1                	mov    %al,%cl
     9a7:	80 e1 01             	and    $0x1,%cl
     9aa:	0f b6 d1             	movzbl %cl,%edx
     9ad:	89 55 f0             	mov    %edx,-0x10(%rbp)
     9b0:	a8 01                	test   $0x1,%al
     9b2:	0f 85 05 00 00 00    	jne    9bd <printint64+0x3d>
     9b8:	e9 11 00 00 00       	jmpq   9ce <printint64+0x4e>
     9bd:	31 c0                	xor    %eax,%eax
    x = -xx;
     9bf:	2b 45 f8             	sub    -0x8(%rbp),%eax
     9c2:	48 63 c8             	movslq %eax,%rcx
     9c5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     9c9:	e9 08 00 00 00       	jmpq   9d6 <printint64+0x56>
    x = xx;
     9ce:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     9d2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     9d6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     9dd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     9e1:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     9e5:	31 d2                	xor    %edx,%edx
     9e7:	48 f7 f1             	div    %rcx
     9ea:	40 8a 34 15 a0 16 00 	mov    0x16a0(,%rdx,1),%sil
     9f1:	00 
     9f2:	8b 7d cc             	mov    -0x34(%rbp),%edi
     9f5:	41 89 f8             	mov    %edi,%r8d
     9f8:	41 83 c0 01          	add    $0x1,%r8d
     9fc:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     a00:	48 63 cf             	movslq %edi,%rcx
     a03:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     a08:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     a0c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     a10:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     a14:	48 89 c8             	mov    %rcx,%rax
     a17:	31 d2                	xor    %edx,%edx
     a19:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     a1d:	48 f7 f1             	div    %rcx
     a20:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     a24:	48 83 f8 00          	cmp    $0x0,%rax
     a28:	0f 85 af ff ff ff    	jne    9dd <printint64+0x5d>
  if(sgn)
     a2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     a32:	0f 84 13 00 00 00    	je     a4b <printint64+0xcb>
    buf[i++] = '-';
     a38:	8b 45 cc             	mov    -0x34(%rbp),%eax
     a3b:	89 c1                	mov    %eax,%ecx
     a3d:	83 c1 01             	add    $0x1,%ecx
     a40:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     a43:	48 63 d0             	movslq %eax,%rdx
     a46:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     a4b:	e9 00 00 00 00       	jmpq   a50 <printint64+0xd0>
     a50:	8b 45 cc             	mov    -0x34(%rbp),%eax
     a53:	83 c0 ff             	add    $0xffffffff,%eax
     a56:	89 45 cc             	mov    %eax,-0x34(%rbp)
     a59:	83 f8 00             	cmp    $0x0,%eax
     a5c:	0f 8c 16 00 00 00    	jl     a78 <printint64+0xf8>
    putc(fd, buf[i]);
     a62:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a65:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     a69:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     a6e:	e8 dd fe ff ff       	callq  950 <putc>
  while(--i >= 0)
     a73:	e9 d8 ff ff ff       	jmpq   a50 <printint64+0xd0>
}
     a78:	48 83 c4 50          	add    $0x50,%rsp
     a7c:	5d                   	pop    %rbp
     a7d:	c3                   	retq   
     a7e:	66 90                	xchg   %ax,%ax

0000000000000a80 <printint>:
{
     a80:	55                   	push   %rbp
     a81:	48 89 e5             	mov    %rsp,%rbp
     a84:	48 83 ec 30          	sub    $0x30,%rsp
     a88:	89 7d fc             	mov    %edi,-0x4(%rbp)
     a8b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     a8e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     a91:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     a94:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     a9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     a9f:	0f 84 1e 00 00 00    	je     ac3 <printint+0x43>
     aa5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     aa9:	0f 8d 14 00 00 00    	jge    ac3 <printint+0x43>
     aaf:	31 c0                	xor    %eax,%eax
    neg = 1;
     ab1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     ab8:	2b 45 f8             	sub    -0x8(%rbp),%eax
     abb:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     abe:	e9 06 00 00 00       	jmpq   ac9 <printint+0x49>
    x = xx;
     ac3:	8b 45 f8             	mov    -0x8(%rbp),%eax
     ac6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     ac9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     ad0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     ad3:	31 d2                	xor    %edx,%edx
     ad5:	f7 75 f4             	divl   -0xc(%rbp)
     ad8:	89 d2                	mov    %edx,%edx
     ada:	89 d1                	mov    %edx,%ecx
     adc:	40 8a 34 0d c0 16 00 	mov    0x16c0(,%rcx,1),%sil
     ae3:	00 
     ae4:	8b 55 dc             	mov    -0x24(%rbp),%edx
     ae7:	89 d7                	mov    %edx,%edi
     ae9:	83 c7 01             	add    $0x1,%edi
     aec:	89 7d dc             	mov    %edi,-0x24(%rbp)
     aef:	48 63 ca             	movslq %edx,%rcx
     af2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     af7:	8b 45 f4             	mov    -0xc(%rbp),%eax
     afa:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     afd:	89 45 d0             	mov    %eax,-0x30(%rbp)
     b00:	89 c8                	mov    %ecx,%eax
     b02:	31 d2                	xor    %edx,%edx
     b04:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     b07:	f7 f1                	div    %ecx
     b09:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     b0c:	83 f8 00             	cmp    $0x0,%eax
     b0f:	0f 85 bb ff ff ff    	jne    ad0 <printint+0x50>
  if(neg)
     b15:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     b19:	0f 84 13 00 00 00    	je     b32 <printint+0xb2>
    buf[i++] = '-';
     b1f:	8b 45 dc             	mov    -0x24(%rbp),%eax
     b22:	89 c1                	mov    %eax,%ecx
     b24:	83 c1 01             	add    $0x1,%ecx
     b27:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     b2a:	48 63 d0             	movslq %eax,%rdx
     b2d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     b32:	e9 00 00 00 00       	jmpq   b37 <printint+0xb7>
     b37:	8b 45 dc             	mov    -0x24(%rbp),%eax
     b3a:	83 c0 ff             	add    $0xffffffff,%eax
     b3d:	89 45 dc             	mov    %eax,-0x24(%rbp)
     b40:	83 f8 00             	cmp    $0x0,%eax
     b43:	0f 8c 16 00 00 00    	jl     b5f <printint+0xdf>
    putc(fd, buf[i]);
     b49:	8b 7d fc             	mov    -0x4(%rbp),%edi
     b4c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     b50:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     b55:	e8 f6 fd ff ff       	callq  950 <putc>
  while(--i >= 0)
     b5a:	e9 d8 ff ff ff       	jmpq   b37 <printint+0xb7>
}
     b5f:	48 83 c4 30          	add    $0x30,%rsp
     b63:	5d                   	pop    %rbp
     b64:	c3                   	retq   
     b65:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     b6c:	00 00 00 
     b6f:	90                   	nop

0000000000000b70 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     b70:	55                   	push   %rbp
     b71:	48 89 e5             	mov    %rsp,%rbp
     b74:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     b78:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     b7c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     b80:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     b84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b88:	48 89 c1             	mov    %rax,%rcx
     b8b:	48 83 c1 01          	add    $0x1,%rcx
     b8f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     b93:	8a 10                	mov    (%rax),%dl
     b95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b99:	48 89 c1             	mov    %rax,%rcx
     b9c:	48 83 c1 01          	add    $0x1,%rcx
     ba0:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     ba4:	88 10                	mov    %dl,(%rax)
     ba6:	0f be f2             	movsbl %dl,%esi
     ba9:	83 fe 00             	cmp    $0x0,%esi
     bac:	0f 84 05 00 00 00    	je     bb7 <strcpy+0x47>
     bb2:	e9 cd ff ff ff       	jmpq   b84 <strcpy+0x14>
    ;
  return os;
     bb7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     bbb:	5d                   	pop    %rbp
     bbc:	c3                   	retq   
     bbd:	0f 1f 00             	nopl   (%rax)

0000000000000bc0 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     bc0:	55                   	push   %rbp
     bc1:	48 89 e5             	mov    %rsp,%rbp
     bc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     bc8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     bcc:	31 c0                	xor    %eax,%eax
     bce:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     bd0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     bd4:	0f be 02             	movsbl (%rdx),%eax
     bd7:	83 f8 00             	cmp    $0x0,%eax
     bda:	88 4d ef             	mov    %cl,-0x11(%rbp)
     bdd:	0f 84 18 00 00 00    	je     bfb <strcmp+0x3b>
     be3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     be7:	0f be 08             	movsbl (%rax),%ecx
     bea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     bee:	0f be 10             	movsbl (%rax),%edx
     bf1:	39 d1                	cmp    %edx,%ecx
     bf3:	40 0f 94 c6          	sete   %sil
     bf7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     bfb:	8a 45 ef             	mov    -0x11(%rbp),%al
     bfe:	a8 01                	test   $0x1,%al
     c00:	0f 85 05 00 00 00    	jne    c0b <strcmp+0x4b>
     c06:	e9 1d 00 00 00       	jmpq   c28 <strcmp+0x68>
    p++, q++;
     c0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c0f:	48 83 c0 01          	add    $0x1,%rax
     c13:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     c17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c1b:	48 83 c0 01          	add    $0x1,%rax
     c1f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     c23:	e9 a4 ff ff ff       	jmpq   bcc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     c28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c2c:	0f b6 08             	movzbl (%rax),%ecx
     c2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c33:	0f b6 10             	movzbl (%rax),%edx
     c36:	29 d1                	sub    %edx,%ecx
     c38:	89 c8                	mov    %ecx,%eax
     c3a:	5d                   	pop    %rbp
     c3b:	c3                   	retq   
     c3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000c40 <strlen>:
}

uint
strlen(char *s)
{
     c40:	55                   	push   %rbp
     c41:	48 89 e5             	mov    %rsp,%rbp
     c44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     c48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     c4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c53:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     c57:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     c5b:	0f 84 13 00 00 00    	je     c74 <strlen+0x34>
     c61:	e9 00 00 00 00       	jmpq   c66 <strlen+0x26>
     c66:	8b 45 f4             	mov    -0xc(%rbp),%eax
     c69:	83 c0 01             	add    $0x1,%eax
     c6c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     c6f:	e9 db ff ff ff       	jmpq   c4f <strlen+0xf>
    ;
  return n;
     c74:	8b 45 f4             	mov    -0xc(%rbp),%eax
     c77:	5d                   	pop    %rbp
     c78:	c3                   	retq   
     c79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000c80 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     c80:	55                   	push   %rbp
     c81:	48 89 e5             	mov    %rsp,%rbp
     c84:	48 83 ec 10          	sub    $0x10,%rsp
     c88:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c8c:	89 75 f4             	mov    %esi,-0xc(%rbp)
     c8f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     c92:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     c96:	8b 75 f4             	mov    -0xc(%rbp),%esi
     c99:	8b 55 f0             	mov    -0x10(%rbp),%edx
     c9c:	e8 0f 00 00 00       	callq  cb0 <stosb>
  return dst;
     ca1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ca5:	48 83 c4 10          	add    $0x10,%rsp
     ca9:	5d                   	pop    %rbp
     caa:	c3                   	retq   
     cab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000cb0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     cb0:	55                   	push   %rbp
     cb1:	48 89 e5             	mov    %rsp,%rbp
     cb4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     cb8:	89 75 f4             	mov    %esi,-0xc(%rbp)
     cbb:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     cbe:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     cc2:	8b 55 f0             	mov    -0x10(%rbp),%edx
     cc5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     cc8:	89 d1                	mov    %edx,%ecx
     cca:	fc                   	cld    
     ccb:	f3 aa                	rep stos %al,%es:(%rdi)
     ccd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     cd1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     cd4:	5d                   	pop    %rbp
     cd5:	c3                   	retq   
     cd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     cdd:	00 00 00 

0000000000000ce0 <strchr>:
}

char*
strchr(const char *s, char c)
{
     ce0:	55                   	push   %rbp
     ce1:	48 89 e5             	mov    %rsp,%rbp
     ce4:	40 88 f0             	mov    %sil,%al
     ce7:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     ceb:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     cee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cf2:	80 38 00             	cmpb   $0x0,(%rax)
     cf5:	0f 84 36 00 00 00    	je     d31 <strchr+0x51>
    if(*s == c)
     cfb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cff:	0f be 08             	movsbl (%rax),%ecx
     d02:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     d06:	39 d1                	cmp    %edx,%ecx
     d08:	0f 85 0d 00 00 00    	jne    d1b <strchr+0x3b>
      return (char*)s;
     d0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d12:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     d16:	e9 1e 00 00 00       	jmpq   d39 <strchr+0x59>
    if(*s == c)
     d1b:	e9 00 00 00 00       	jmpq   d20 <strchr+0x40>
  for(; *s; s++)
     d20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d24:	48 83 c0 01          	add    $0x1,%rax
     d28:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     d2c:	e9 bd ff ff ff       	jmpq   cee <strchr+0xe>
  return 0;
     d31:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     d38:	00 
}
     d39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d3d:	5d                   	pop    %rbp
     d3e:	c3                   	retq   
     d3f:	90                   	nop

0000000000000d40 <gets>:

char*
gets(char *buf, int max)
{
     d40:	55                   	push   %rbp
     d41:	48 89 e5             	mov    %rsp,%rbp
     d44:	48 83 ec 20          	sub    $0x20,%rsp
     d48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     d4c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d4f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     d56:	8b 45 f0             	mov    -0x10(%rbp),%eax
     d59:	83 c0 01             	add    $0x1,%eax
     d5c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     d5f:	0f 8d 5e 00 00 00    	jge    dc3 <gets+0x83>
     d65:	31 ff                	xor    %edi,%edi
     d67:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
     d6b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
     d70:	e8 cb 01 00 00       	callq  f40 <read>
     d75:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
     d78:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
     d7c:	0f 8d 05 00 00 00    	jge    d87 <gets+0x47>
      break;
     d82:	e9 3c 00 00 00       	jmpq   dc3 <gets+0x83>
    buf[i++] = c;
     d87:	8a 45 eb             	mov    -0x15(%rbp),%al
     d8a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     d8e:	8b 55 f0             	mov    -0x10(%rbp),%edx
     d91:	89 d6                	mov    %edx,%esi
     d93:	83 c6 01             	add    $0x1,%esi
     d96:	89 75 f0             	mov    %esi,-0x10(%rbp)
     d99:	48 63 fa             	movslq %edx,%rdi
     d9c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
     d9f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
     da3:	83 fa 0a             	cmp    $0xa,%edx
     da6:	0f 84 0d 00 00 00    	je     db9 <gets+0x79>
     dac:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
     db0:	83 f8 0d             	cmp    $0xd,%eax
     db3:	0f 85 05 00 00 00    	jne    dbe <gets+0x7e>
      break;
     db9:	e9 05 00 00 00       	jmpq   dc3 <gets+0x83>
  for(i=0; i+1 < max; ){
     dbe:	e9 93 ff ff ff       	jmpq   d56 <gets+0x16>
  }
  buf[i] = '\0';
     dc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dc7:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
     dcb:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
     dcf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dd3:	48 83 c4 20          	add    $0x20,%rsp
     dd7:	5d                   	pop    %rbp
     dd8:	c3                   	retq   
     dd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000de0 <stat>:
}

int
stat(char *n, struct stat *st)
{
     de0:	55                   	push   %rbp
     de1:	48 89 e5             	mov    %rsp,%rbp
     de4:	48 83 ec 30          	sub    $0x30,%rsp
     de8:	31 c0                	xor    %eax,%eax
     dea:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     dee:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     df2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     df6:	89 c6                	mov    %eax,%esi
     df8:	e8 6b 01 00 00       	callq  f68 <open>
     dfd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
     e00:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     e04:	0f 8d 0c 00 00 00    	jge    e16 <stat+0x36>
    return -1;
     e0a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     e11:	e9 20 00 00 00       	jmpq   e36 <stat+0x56>
  r = fstat(fd, st);
     e16:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     e19:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     e1d:	e8 5e 01 00 00       	callq  f80 <fstat>
     e22:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
     e25:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     e28:	e8 23 01 00 00       	callq  f50 <close>
  return r;
     e2d:	8b 7d e0             	mov    -0x20(%rbp),%edi
     e30:	89 7d fc             	mov    %edi,-0x4(%rbp)
     e33:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
     e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
     e39:	48 83 c4 30          	add    $0x30,%rsp
     e3d:	5d                   	pop    %rbp
     e3e:	c3                   	retq   
     e3f:	90                   	nop

0000000000000e40 <atoi>:

int
atoi(const char *s)
{
     e40:	55                   	push   %rbp
     e41:	48 89 e5             	mov    %rsp,%rbp
     e44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
     e48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     e4f:	31 c0                	xor    %eax,%eax
     e51:	88 c1                	mov    %al,%cl
     e53:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
     e58:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e5c:	0f be 32             	movsbl (%rdx),%esi
     e5f:	39 f0                	cmp    %esi,%eax
     e61:	88 4d f3             	mov    %cl,-0xd(%rbp)
     e64:	0f 8f 10 00 00 00    	jg     e7a <atoi+0x3a>
     e6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e6e:	0f be 08             	movsbl (%rax),%ecx
     e71:	83 f9 39             	cmp    $0x39,%ecx
     e74:	0f 9e c2             	setle  %dl
     e77:	88 55 f3             	mov    %dl,-0xd(%rbp)
     e7a:	8a 45 f3             	mov    -0xd(%rbp),%al
     e7d:	a8 01                	test   $0x1,%al
     e7f:	0f 85 05 00 00 00    	jne    e8a <atoi+0x4a>
     e85:	e9 23 00 00 00       	jmpq   ead <atoi+0x6d>
    n = n*10 + *s++ - '0';
     e8a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
     e8e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     e92:	48 89 ca             	mov    %rcx,%rdx
     e95:	48 83 c2 01          	add    $0x1,%rdx
     e99:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     e9d:	0f be 31             	movsbl (%rcx),%esi
     ea0:	01 f0                	add    %esi,%eax
     ea2:	83 e8 30             	sub    $0x30,%eax
     ea5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
     ea8:	e9 a2 ff ff ff       	jmpq   e4f <atoi+0xf>
  return n;
     ead:	8b 45 f4             	mov    -0xc(%rbp),%eax
     eb0:	5d                   	pop    %rbp
     eb1:	c3                   	retq   
     eb2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     eb9:	1f 84 00 00 00 00 00 

0000000000000ec0 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     ec0:	55                   	push   %rbp
     ec1:	48 89 e5             	mov    %rsp,%rbp
     ec4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ec8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     ecc:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
     ecf:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     ed3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
     ed7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     edb:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
     edf:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ee2:	89 c1                	mov    %eax,%ecx
     ee4:	83 c1 ff             	add    $0xffffffff,%ecx
     ee7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
     eea:	83 f8 00             	cmp    $0x0,%eax
     eed:	0f 8e 27 00 00 00    	jle    f1a <memmove+0x5a>
    *dst++ = *src++;
     ef3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ef7:	48 89 c1             	mov    %rax,%rcx
     efa:	48 83 c1 01          	add    $0x1,%rcx
     efe:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     f02:	8a 10                	mov    (%rax),%dl
     f04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f08:	48 89 c1             	mov    %rax,%rcx
     f0b:	48 83 c1 01          	add    $0x1,%rcx
     f0f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     f13:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
     f15:	e9 c5 ff ff ff       	jmpq   edf <memmove+0x1f>
  return vdst;
     f1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f1e:	5d                   	pop    %rbp
     f1f:	c3                   	retq   

0000000000000f20 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
     f20:	b8 01 00 00 00       	mov    $0x1,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	retq   

0000000000000f28 <exit>:
SYSCALL(exit)
     f28:	b8 02 00 00 00       	mov    $0x2,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	retq   

0000000000000f30 <wait>:
SYSCALL(wait)
     f30:	b8 03 00 00 00       	mov    $0x3,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	retq   

0000000000000f38 <pipe>:
SYSCALL(pipe)
     f38:	b8 04 00 00 00       	mov    $0x4,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	retq   

0000000000000f40 <read>:
SYSCALL(read)
     f40:	b8 05 00 00 00       	mov    $0x5,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	retq   

0000000000000f48 <write>:
SYSCALL(write)
     f48:	b8 10 00 00 00       	mov    $0x10,%eax
     f4d:	cd 40                	int    $0x40
     f4f:	c3                   	retq   

0000000000000f50 <close>:
SYSCALL(close)
     f50:	b8 15 00 00 00       	mov    $0x15,%eax
     f55:	cd 40                	int    $0x40
     f57:	c3                   	retq   

0000000000000f58 <kill>:
SYSCALL(kill)
     f58:	b8 06 00 00 00       	mov    $0x6,%eax
     f5d:	cd 40                	int    $0x40
     f5f:	c3                   	retq   

0000000000000f60 <exec>:
SYSCALL(exec)
     f60:	b8 07 00 00 00       	mov    $0x7,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	retq   

0000000000000f68 <open>:
SYSCALL(open)
     f68:	b8 0f 00 00 00       	mov    $0xf,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	retq   

0000000000000f70 <mknod>:
SYSCALL(mknod)
     f70:	b8 11 00 00 00       	mov    $0x11,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	retq   

0000000000000f78 <unlink>:
SYSCALL(unlink)
     f78:	b8 12 00 00 00       	mov    $0x12,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	retq   

0000000000000f80 <fstat>:
SYSCALL(fstat)
     f80:	b8 08 00 00 00       	mov    $0x8,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	retq   

0000000000000f88 <link>:
SYSCALL(link)
     f88:	b8 13 00 00 00       	mov    $0x13,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	retq   

0000000000000f90 <mkdir>:
SYSCALL(mkdir)
     f90:	b8 14 00 00 00       	mov    $0x14,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	retq   

0000000000000f98 <chdir>:
SYSCALL(chdir)
     f98:	b8 09 00 00 00       	mov    $0x9,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	retq   

0000000000000fa0 <dup>:
SYSCALL(dup)
     fa0:	b8 0a 00 00 00       	mov    $0xa,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	retq   

0000000000000fa8 <getpid>:
SYSCALL(getpid)
     fa8:	b8 0b 00 00 00       	mov    $0xb,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	retq   

0000000000000fb0 <sbrk>:
SYSCALL(sbrk)
     fb0:	b8 0c 00 00 00       	mov    $0xc,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	retq   

0000000000000fb8 <sleep>:
SYSCALL(sleep)
     fb8:	b8 0d 00 00 00       	mov    $0xd,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	retq   

0000000000000fc0 <uptime>:
SYSCALL(uptime)
     fc0:	b8 0e 00 00 00       	mov    $0xe,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	retq   

0000000000000fc8 <sysinfo>:
SYSCALL(sysinfo)
     fc8:	b8 16 00 00 00       	mov    $0x16,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	retq   

0000000000000fd0 <mmap>:
SYSCALL(mmap)
     fd0:	b8 17 00 00 00       	mov    $0x17,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	retq   

0000000000000fd8 <munmap>:
SYSCALL(munmap)
     fd8:	b8 18 00 00 00       	mov    $0x18,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	retq   

0000000000000fe0 <crashn>:
SYSCALL(crashn)
     fe0:	b8 19 00 00 00       	mov    $0x19,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	retq   
     fe8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     fef:	00 

0000000000000ff0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ff0:	55                   	push   %rbp
     ff1:	48 89 e5             	mov    %rsp,%rbp
     ff4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ff8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     ffc:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    1000:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1004:	48 8b 3c 25 d8 16 00 	mov    0x16d8,%rdi
    100b:	00 
    100c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1010:	31 c0                	xor    %eax,%eax
    1012:	88 c1                	mov    %al,%cl
    1014:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1018:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    101c:	88 4d e7             	mov    %cl,-0x19(%rbp)
    101f:	0f 86 11 00 00 00    	jbe    1036 <free+0x46>
    1025:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1029:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    102d:	48 3b 01             	cmp    (%rcx),%rax
    1030:	0f 92 c2             	setb   %dl
    1033:	88 55 e7             	mov    %dl,-0x19(%rbp)
    1036:	8a 45 e7             	mov    -0x19(%rbp),%al
    1039:	34 ff                	xor    $0xff,%al
    103b:	a8 01                	test   $0x1,%al
    103d:	0f 85 05 00 00 00    	jne    1048 <free+0x58>
    1043:	e9 4a 00 00 00       	jmpq   1092 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1048:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    104c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1050:	48 3b 01             	cmp    (%rcx),%rax
    1053:	0f 82 24 00 00 00    	jb     107d <free+0x8d>
    1059:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    105d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1061:	0f 87 11 00 00 00    	ja     1078 <free+0x88>
    1067:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    106b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    106f:	48 3b 01             	cmp    (%rcx),%rax
    1072:	0f 83 05 00 00 00    	jae    107d <free+0x8d>
      break;
    1078:	e9 15 00 00 00       	jmpq   1092 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    107d:	e9 00 00 00 00       	jmpq   1082 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1082:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1086:	48 8b 00             	mov    (%rax),%rax
    1089:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    108d:	e9 7e ff ff ff       	jmpq   1010 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1092:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1096:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    109a:	8b 51 08             	mov    0x8(%rcx),%edx
    109d:	89 d1                	mov    %edx,%ecx
    109f:	48 c1 e1 04          	shl    $0x4,%rcx
    10a3:	48 01 c8             	add    %rcx,%rax
    10a6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    10aa:	48 3b 01             	cmp    (%rcx),%rax
    10ad:	0f 85 2a 00 00 00    	jne    10dd <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    10b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10b7:	48 8b 00             	mov    (%rax),%rax
    10ba:	8b 48 08             	mov    0x8(%rax),%ecx
    10bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10c1:	03 48 08             	add    0x8(%rax),%ecx
    10c4:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    10c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10cb:	48 8b 00             	mov    (%rax),%rax
    10ce:	48 8b 00             	mov    (%rax),%rax
    10d1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    10d5:	48 89 02             	mov    %rax,(%rdx)
  } else
    10d8:	e9 0e 00 00 00       	jmpq   10eb <free+0xfb>
    bp->s.ptr = p->s.ptr;
    10dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10e1:	48 8b 00             	mov    (%rax),%rax
    10e4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    10e8:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    10eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10ef:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    10f3:	8b 51 08             	mov    0x8(%rcx),%edx
    10f6:	89 d1                	mov    %edx,%ecx
    10f8:	48 c1 e1 04          	shl    $0x4,%rcx
    10fc:	48 01 c8             	add    %rcx,%rax
    10ff:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1103:	0f 85 24 00 00 00    	jne    112d <free+0x13d>
    p->s.size += bp->s.size;
    1109:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    110d:	8b 48 08             	mov    0x8(%rax),%ecx
    1110:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1114:	03 48 08             	add    0x8(%rax),%ecx
    1117:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    111a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    111e:	48 8b 00             	mov    (%rax),%rax
    1121:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1125:	48 89 02             	mov    %rax,(%rdx)
  } else
    1128:	e9 0b 00 00 00       	jmpq   1138 <free+0x148>
    p->s.ptr = bp;
    112d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1131:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1135:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    1138:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    113c:	48 89 04 25 d8 16 00 	mov    %rax,0x16d8
    1143:	00 
}
    1144:	5d                   	pop    %rbp
    1145:	c3                   	retq   
    1146:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    114d:	00 00 00 

0000000000001150 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1150:	55                   	push   %rbp
    1151:	48 89 e5             	mov    %rsp,%rbp
    1154:	48 83 ec 30          	sub    $0x30,%rsp
    1158:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    115b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    115e:	89 f8                	mov    %edi,%eax
    1160:	48 83 c0 10          	add    $0x10,%rax
    1164:	48 83 e8 01          	sub    $0x1,%rax
    1168:	48 c1 e8 04          	shr    $0x4,%rax
    116c:	48 83 c0 01          	add    $0x1,%rax
    1170:	89 c7                	mov    %eax,%edi
    1172:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1175:	48 8b 04 25 d8 16 00 	mov    0x16d8,%rax
    117c:	00 
    117d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1181:	48 83 f8 00          	cmp    $0x0,%rax
    1185:	0f 85 29 00 00 00    	jne    11b4 <malloc+0x64>
    118b:	48 b8 e0 16 00 00 00 	movabs $0x16e0,%rax
    1192:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1195:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1199:	48 89 04 25 d8 16 00 	mov    %rax,0x16d8
    11a0:	00 
    11a1:	48 89 04 25 e0 16 00 	mov    %rax,0x16e0
    11a8:	00 
    base.s.size = 0;
    11a9:	c7 04 25 e8 16 00 00 	movl   $0x0,0x16e8
    11b0:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11b8:	48 8b 00             	mov    (%rax),%rax
    11bb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    11bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11c3:	8b 48 08             	mov    0x8(%rax),%ecx
    11c6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    11c9:	0f 82 73 00 00 00    	jb     1242 <malloc+0xf2>
      if(p->s.size == nunits)
    11cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11d3:	8b 48 08             	mov    0x8(%rax),%ecx
    11d6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    11d9:	0f 85 13 00 00 00    	jne    11f2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    11df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11e3:	48 8b 00             	mov    (%rax),%rax
    11e6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    11ea:	48 89 01             	mov    %rax,(%rcx)
    11ed:	e9 33 00 00 00       	jmpq   1225 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    11f2:	8b 45 dc             	mov    -0x24(%rbp),%eax
    11f5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    11f9:	8b 51 08             	mov    0x8(%rcx),%edx
    11fc:	29 c2                	sub    %eax,%edx
    11fe:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    1201:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1205:	8b 41 08             	mov    0x8(%rcx),%eax
    1208:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    120c:	89 c0                	mov    %eax,%eax
    120e:	89 c6                	mov    %eax,%esi
    1210:	48 c1 e6 04          	shl    $0x4,%rsi
    1214:	48 01 f1             	add    %rsi,%rcx
    1217:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    121b:	8b 45 dc             	mov    -0x24(%rbp),%eax
    121e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1222:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    1225:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1229:	48 89 04 25 d8 16 00 	mov    %rax,0x16d8
    1230:	00 
      return (void*)(p + 1);
    1231:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1235:	48 83 c0 10          	add    $0x10,%rax
    1239:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    123d:	e9 57 00 00 00       	jmpq   1299 <malloc+0x149>
    }
    if(p == freep)
    1242:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1246:	48 3b 04 25 d8 16 00 	cmp    0x16d8,%rax
    124d:	00 
    124e:	0f 85 28 00 00 00    	jne    127c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    1254:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1257:	e8 54 00 00 00       	callq  12b0 <morecore>
    125c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1260:	48 83 f8 00          	cmp    $0x0,%rax
    1264:	0f 85 0d 00 00 00    	jne    1277 <malloc+0x127>
        return 0;
    126a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1271:	00 
    1272:	e9 22 00 00 00       	jmpq   1299 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1277:	e9 00 00 00 00       	jmpq   127c <malloc+0x12c>
  }
    127c:	e9 00 00 00 00       	jmpq   1281 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1281:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1285:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    128d:	48 8b 00             	mov    (%rax),%rax
    1290:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1294:	e9 26 ff ff ff       	jmpq   11bf <malloc+0x6f>
    1299:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    129d:	48 83 c4 30          	add    $0x30,%rsp
    12a1:	5d                   	pop    %rbp
    12a2:	c3                   	retq   
    12a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    12aa:	84 00 00 00 00 00 

00000000000012b0 <morecore>:
{
    12b0:	55                   	push   %rbp
    12b1:	48 89 e5             	mov    %rsp,%rbp
    12b4:	48 83 ec 20          	sub    $0x20,%rsp
    12b8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    12bb:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    12c2:	0f 83 07 00 00 00    	jae    12cf <morecore+0x1f>
    nu = 4096;
    12c8:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    12cf:	8b 45 f4             	mov    -0xc(%rbp),%eax
    12d2:	89 c1                	mov    %eax,%ecx
    12d4:	48 c1 e1 04          	shl    $0x4,%rcx
    12d8:	89 c8                	mov    %ecx,%eax
    12da:	89 c7                	mov    %eax,%edi
    12dc:	e8 cf fc ff ff       	callq  fb0 <sbrk>
    12e1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    12e8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    12ec:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    12f0:	0f 85 0d 00 00 00    	jne    1303 <morecore+0x53>
    return 0;
    12f6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    12fd:	00 
    12fe:	e9 2e 00 00 00       	jmpq   1331 <morecore+0x81>
  hp = (Header*)p;
    1303:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1307:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    130b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    130e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1312:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1315:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1319:	48 83 c0 10          	add    $0x10,%rax
    131d:	48 89 c7             	mov    %rax,%rdi
    1320:	e8 cb fc ff ff       	callq  ff0 <free>
  return freep;
    1325:	48 8b 04 25 d8 16 00 	mov    0x16d8,%rax
    132c:	00 
    132d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1331:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1335:	48 83 c4 20          	add    $0x20,%rsp
    1339:	5d                   	pop    %rbp
    133a:	c3                   	retq   
