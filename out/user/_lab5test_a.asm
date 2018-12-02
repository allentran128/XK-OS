
out/user/_lab5test_a:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <modification>:
  printf(stdout, msg,  ##__VA_ARGS__); \
  printf(stdout, "\n"); \
  while(1) {};} while(0)

void
modification(void) {
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 20          	sub    $0x20,%rsp
       8:	48 be 20 14 00 00 00 	movabs $0x1420,%rsi
       f:	00 00 00 
  int fd;

  printf(stdout, "modification test starting\n");
      12:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
      19:	b0 00                	mov    $0x0,%al
      1b:	e8 b0 05 00 00       	callq  5d0 <printf>
      20:	48 bf 60 18 00 00 00 	movabs $0x1860,%rdi
      27:	00 00 00 
      2a:	48 be 3c 14 00 00 00 	movabs $0x143c,%rsi
      31:	00 00 00 
  strcpy(buf, "lab5 is 451's last lab.\n");
      34:	e8 17 0c 00 00       	callq  c50 <strcpy>
      39:	48 bf 55 14 00 00 00 	movabs $0x1455,%rdi
      40:	00 00 00 
      43:	be 02 00 00 00       	mov    $0x2,%esi
  fd = open("small.txt", O_RDWR);
      48:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
      4c:	e8 f7 0f 00 00       	callq  1048 <open>
      51:	48 be 60 18 00 00 00 	movabs $0x1860,%rsi
      58:	00 00 00 
      5b:	ba 32 00 00 00       	mov    $0x32,%edx
      60:	89 45 fc             	mov    %eax,-0x4(%rbp)
  write(fd, buf, 50);
      63:	8b 7d fc             	mov    -0x4(%rbp),%edi
      66:	e8 bd 0f 00 00       	callq  1028 <write>
  close(fd);
      6b:	8b 7d fc             	mov    -0x4(%rbp),%edi
      6e:	89 45 ec             	mov    %eax,-0x14(%rbp)
      71:	e8 ba 0f 00 00       	callq  1030 <close>
      76:	48 bf 55 14 00 00 00 	movabs $0x1455,%rdi
      7d:	00 00 00 
      80:	31 f6                	xor    %esi,%esi

  fd = open("small.txt", O_RDONLY);
      82:	89 45 e8             	mov    %eax,-0x18(%rbp)
      85:	e8 be 0f 00 00       	callq  1048 <open>
      8a:	48 be 60 18 00 00 00 	movabs $0x1860,%rsi
      91:	00 00 00 
      94:	ba 32 00 00 00       	mov    $0x32,%edx
      99:	89 45 fc             	mov    %eax,-0x4(%rbp)
  read(fd, buf, 50);
      9c:	8b 7d fc             	mov    -0x4(%rbp),%edi
      9f:	e8 7c 0f 00 00       	callq  1020 <read>
      a4:	48 bf 60 18 00 00 00 	movabs $0x1860,%rdi
      ab:	00 00 00 
      ae:	48 be 3c 14 00 00 00 	movabs $0x143c,%rsi
      b5:	00 00 00 

  if (strcmp(buf, "lab5 is 451's last lab.\n") != 0)
      b8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
      bb:	e8 e0 0b 00 00       	callq  ca0 <strcmp>
      c0:	83 f8 00             	cmp    $0x0,%eax
      c3:	0f 84 61 00 00 00    	je     12a <modification+0x12a>
    error("file content was not lab5 is 451's last lab., was: '%s'", buf);
      c9:	e9 00 00 00 00       	jmpq   ce <modification+0xce>
      ce:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
      d5:	00 00 00 
      d8:	ba 22 00 00 00       	mov    $0x22,%edx
      dd:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
      e4:	b0 00                	mov    $0x0,%al
      e6:	e8 e5 04 00 00       	callq  5d0 <printf>
      eb:	48 be 71 14 00 00 00 	movabs $0x1471,%rsi
      f2:	00 00 00 
      f5:	48 ba 60 18 00 00 00 	movabs $0x1860,%rdx
      fc:	00 00 00 
      ff:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     106:	b0 00                	mov    $0x0,%al
     108:	e8 c3 04 00 00       	callq  5d0 <printf>
     10d:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     114:	00 00 00 
     117:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     11e:	b0 00                	mov    $0x0,%al
     120:	e8 ab 04 00 00       	callq  5d0 <printf>
     125:	e9 fb ff ff ff       	jmpq   125 <modification+0x125>

  close(fd);
     12a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     12d:	e8 fe 0e 00 00       	callq  1030 <close>
     132:	48 be a9 14 00 00 00 	movabs $0x14a9,%rsi
     139:	00 00 00 

  printf(stdout, "modification test ok!\n");
     13c:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     143:	89 45 e0             	mov    %eax,-0x20(%rbp)
     146:	b0 00                	mov    $0x0,%al
     148:	e8 83 04 00 00       	callq  5d0 <printf>
}
     14d:	48 83 c4 20          	add    $0x20,%rsp
     151:	5d                   	pop    %rbp
     152:	c3                   	retq   
     153:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     15a:	84 00 00 00 00 00 

0000000000000160 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     160:	55                   	push   %rbp
     161:	48 89 e5             	mov    %rsp,%rbp
     164:	48 83 ec 60          	sub    $0x60,%rsp
     168:	bf 01 00 00 00       	mov    $0x1,%edi
     16d:	48 be cc 14 00 00 00 	movabs $0x14cc,%rsi
     174:	00 00 00 
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
     177:	48 8b 04 25 70 15 00 	mov    0x1570,%rax
     17e:	00 
     17f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     183:	48 8b 04 25 78 15 00 	mov    0x1578,%rax
     18a:	00 
     18b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     18f:	48 8b 04 25 80 15 00 	mov    0x1580,%rax
     196:	00 
     197:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     19b:	48 8b 04 25 88 15 00 	mov    0x1588,%rax
     1a2:	00 
     1a3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  char *fname;

  printf(1, "fourfiles test\n");
     1a7:	b0 00                	mov    $0x0,%al
     1a9:	e8 22 04 00 00       	callq  5d0 <printf>

  for(pi = 0; pi < 4; pi++){
     1ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
     1b5:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
     1b9:	0f 8d d0 01 00 00    	jge    38f <fourfiles+0x22f>
    fname = names[pi];
     1bf:	48 63 45 e4          	movslq -0x1c(%rbp),%rax
     1c3:	48 8b 44 c5 c0       	mov    -0x40(%rbp,%rax,8),%rax
     1c8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

    pid = fork();
     1cc:	e8 2f 0e 00 00       	callq  1000 <fork>
     1d1:	89 45 f8             	mov    %eax,-0x8(%rbp)
    if(pid < 0){
     1d4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     1d8:	0f 8d 57 00 00 00    	jge    235 <fourfiles+0xd5>
      error("fork failed\n");
     1de:	e9 00 00 00 00       	jmpq   1e3 <fourfiles+0x83>
     1e3:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
     1ea:	00 00 00 
     1ed:	ba 39 00 00 00       	mov    $0x39,%edx
     1f2:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     1f9:	b0 00                	mov    $0x0,%al
     1fb:	e8 d0 03 00 00       	callq  5d0 <printf>
     200:	48 be dc 14 00 00 00 	movabs $0x14dc,%rsi
     207:	00 00 00 
     20a:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     211:	b0 00                	mov    $0x0,%al
     213:	e8 b8 03 00 00       	callq  5d0 <printf>
     218:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     21f:	00 00 00 
     222:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     229:	b0 00                	mov    $0x0,%al
     22b:	e8 a0 03 00 00       	callq  5d0 <printf>
     230:	e9 fb ff ff ff       	jmpq   230 <fourfiles+0xd0>
    }

    if(pid == 0){
     235:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     239:	0f 85 3d 01 00 00    	jne    37c <fourfiles+0x21c>
     23f:	be 02 02 00 00       	mov    $0x202,%esi
      fd = open(fname, O_CREATE | O_RDWR);
     244:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     248:	e8 fb 0d 00 00       	callq  1048 <open>
     24d:	89 45 fc             	mov    %eax,-0x4(%rbp)
      if(fd < 0){
     250:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     254:	0f 8d 57 00 00 00    	jge    2b1 <fourfiles+0x151>
        error("create failed\n");
     25a:	e9 00 00 00 00       	jmpq   25f <fourfiles+0xff>
     25f:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
     266:	00 00 00 
     269:	ba 3f 00 00 00       	mov    $0x3f,%edx
     26e:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     275:	b0 00                	mov    $0x0,%al
     277:	e8 54 03 00 00       	callq  5d0 <printf>
     27c:	48 be e9 14 00 00 00 	movabs $0x14e9,%rsi
     283:	00 00 00 
     286:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     28d:	b0 00                	mov    $0x0,%al
     28f:	e8 3c 03 00 00       	callq  5d0 <printf>
     294:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     29b:	00 00 00 
     29e:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     2a5:	b0 00                	mov    $0x0,%al
     2a7:	e8 24 03 00 00       	callq  5d0 <printf>
     2ac:	e9 fb ff ff ff       	jmpq   2ac <fourfiles+0x14c>
     2b1:	48 bf 60 18 00 00 00 	movabs $0x1860,%rdi
     2b8:	00 00 00 
     2bb:	ba 00 02 00 00       	mov    $0x200,%edx
      }

      memset(buf, '0'+pi, 512);
     2c0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     2c3:	83 c0 30             	add    $0x30,%eax
     2c6:	89 c6                	mov    %eax,%esi
     2c8:	e8 93 0a 00 00       	callq  d60 <memset>
      for(i = 0; i < 12; i++){
     2cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     2d4:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     2d8:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
     2dc:	0f 8d 92 00 00 00    	jge    374 <fourfiles+0x214>
     2e2:	48 be 60 18 00 00 00 	movabs $0x1860,%rsi
     2e9:	00 00 00 
     2ec:	ba f4 01 00 00       	mov    $0x1f4,%edx
        if((n = write(fd, buf, 500)) != 500){
     2f1:	8b 7d fc             	mov    -0x4(%rbp),%edi
     2f4:	e8 2f 0d 00 00       	callq  1028 <write>
     2f9:	89 45 ec             	mov    %eax,-0x14(%rbp)
     2fc:	3d f4 01 00 00       	cmp    $0x1f4,%eax
     301:	0f 84 5a 00 00 00    	je     361 <fourfiles+0x201>
          error("write failed %d\n", n);
     307:	e9 00 00 00 00       	jmpq   30c <fourfiles+0x1ac>
     30c:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
     313:	00 00 00 
     316:	ba 45 00 00 00       	mov    $0x45,%edx
     31b:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     322:	b0 00                	mov    $0x0,%al
     324:	e8 a7 02 00 00       	callq  5d0 <printf>
     329:	48 be f8 14 00 00 00 	movabs $0x14f8,%rsi
     330:	00 00 00 
     333:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     33a:	8b 55 ec             	mov    -0x14(%rbp),%edx
     33d:	b0 00                	mov    $0x0,%al
     33f:	e8 8c 02 00 00       	callq  5d0 <printf>
     344:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     34b:	00 00 00 
     34e:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     355:	b0 00                	mov    $0x0,%al
     357:	e8 74 02 00 00       	callq  5d0 <printf>
     35c:	e9 fb ff ff ff       	jmpq   35c <fourfiles+0x1fc>
        }
      }
     361:	e9 00 00 00 00       	jmpq   366 <fourfiles+0x206>
      for(i = 0; i < 12; i++){
     366:	8b 45 f4             	mov    -0xc(%rbp),%eax
     369:	83 c0 01             	add    $0x1,%eax
     36c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     36f:	e9 64 ff ff ff       	jmpq   2d8 <fourfiles+0x178>
      exit();
     374:	e8 8f 0c 00 00       	callq  1008 <exit>
     379:	89 45 ac             	mov    %eax,-0x54(%rbp)
    }
  }
     37c:	e9 00 00 00 00       	jmpq   381 <fourfiles+0x221>
  for(pi = 0; pi < 4; pi++){
     381:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     384:	83 c0 01             	add    $0x1,%eax
     387:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     38a:	e9 26 fe ff ff       	jmpq   1b5 <fourfiles+0x55>

  for(pi = 0; pi < 4; pi++){
     38f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
     396:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
     39a:	0f 8d 16 00 00 00    	jge    3b6 <fourfiles+0x256>
    wait();
     3a0:	e8 6b 0c 00 00       	callq  1010 <wait>
     3a5:	89 45 a8             	mov    %eax,-0x58(%rbp)
  for(pi = 0; pi < 4; pi++){
     3a8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     3ab:	83 c0 01             	add    $0x1,%eax
     3ae:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     3b1:	e9 e0 ff ff ff       	jmpq   396 <fourfiles+0x236>
     3b6:	bf 01 00 00 00       	mov    $0x1,%edi
     3bb:	48 be 09 15 00 00 00 	movabs $0x1509,%rsi
     3c2:	00 00 00 
  }

  printf(1, "writing...\n");
     3c5:	b0 00                	mov    $0x0,%al
     3c7:	e8 04 02 00 00       	callq  5d0 <printf>

  for(i = 0; i < 2; i++){
     3cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     3d3:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
     3d7:	0f 8d 6f 01 00 00    	jge    54c <fourfiles+0x3ec>
     3dd:	31 f6                	xor    %esi,%esi
    fname = names[i];
     3df:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     3e3:	48 8b 44 c5 c0       	mov    -0x40(%rbp,%rax,8),%rax
     3e8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    fd = open(fname, 0);
     3ec:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
     3f0:	e8 53 0c 00 00       	callq  1048 <open>
     3f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    total = 0;
     3f8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     3ff:	48 be 60 18 00 00 00 	movabs $0x1860,%rsi
     406:	00 00 00 
     409:	ba 00 20 00 00       	mov    $0x2000,%edx
    while((n = read(fd, buf, sizeof(buf))) > 0){
     40e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     411:	e8 0a 0c 00 00       	callq  1020 <read>
     416:	89 45 ec             	mov    %eax,-0x14(%rbp)
     419:	83 f8 00             	cmp    $0x0,%eax
     41c:	0f 8e a5 00 00 00    	jle    4c7 <fourfiles+0x367>
      for(j = 0; j < n; j++){
     422:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     429:	8b 45 f0             	mov    -0x10(%rbp),%eax
     42c:	3b 45 ec             	cmp    -0x14(%rbp),%eax
     42f:	0f 8d 84 00 00 00    	jge    4b9 <fourfiles+0x359>
        if(buf[j] != '0'+i){
     435:	48 63 45 f0          	movslq -0x10(%rbp),%rax
     439:	0f be 0c 05 60 18 00 	movsbl 0x1860(,%rax,1),%ecx
     440:	00 
     441:	8b 55 f4             	mov    -0xc(%rbp),%edx
     444:	83 c2 30             	add    $0x30,%edx
     447:	39 d1                	cmp    %edx,%ecx
     449:	0f 84 57 00 00 00    	je     4a6 <fourfiles+0x346>
          error("wrong char\n");
     44f:	e9 00 00 00 00       	jmpq   454 <fourfiles+0x2f4>
     454:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
     45b:	00 00 00 
     45e:	ba 59 00 00 00       	mov    $0x59,%edx
     463:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     46a:	b0 00                	mov    $0x0,%al
     46c:	e8 5f 01 00 00       	callq  5d0 <printf>
     471:	48 be 15 15 00 00 00 	movabs $0x1515,%rsi
     478:	00 00 00 
     47b:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     482:	b0 00                	mov    $0x0,%al
     484:	e8 47 01 00 00       	callq  5d0 <printf>
     489:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     490:	00 00 00 
     493:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     49a:	b0 00                	mov    $0x0,%al
     49c:	e8 2f 01 00 00       	callq  5d0 <printf>
     4a1:	e9 fb ff ff ff       	jmpq   4a1 <fourfiles+0x341>
        }
      }
     4a6:	e9 00 00 00 00       	jmpq   4ab <fourfiles+0x34b>
      for(j = 0; j < n; j++){
     4ab:	8b 45 f0             	mov    -0x10(%rbp),%eax
     4ae:	83 c0 01             	add    $0x1,%eax
     4b1:	89 45 f0             	mov    %eax,-0x10(%rbp)
     4b4:	e9 70 ff ff ff       	jmpq   429 <fourfiles+0x2c9>
      total += n;
     4b9:	8b 45 ec             	mov    -0x14(%rbp),%eax
     4bc:	03 45 e8             	add    -0x18(%rbp),%eax
     4bf:	89 45 e8             	mov    %eax,-0x18(%rbp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     4c2:	e9 38 ff ff ff       	jmpq   3ff <fourfiles+0x29f>
    }
    close(fd);
     4c7:	8b 7d fc             	mov    -0x4(%rbp),%edi
     4ca:	e8 61 0b 00 00       	callq  1030 <close>
    if(total != 12*500){
     4cf:	81 7d e8 70 17 00 00 	cmpl   $0x1770,-0x18(%rbp)
     4d6:	89 45 a4             	mov    %eax,-0x5c(%rbp)
     4d9:	0f 84 5a 00 00 00    	je     539 <fourfiles+0x3d9>
      error("wrong length %d\n", total);
     4df:	e9 00 00 00 00       	jmpq   4e4 <fourfiles+0x384>
     4e4:	48 be 5f 14 00 00 00 	movabs $0x145f,%rsi
     4eb:	00 00 00 
     4ee:	ba 60 00 00 00       	mov    $0x60,%edx
     4f3:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     4fa:	b0 00                	mov    $0x0,%al
     4fc:	e8 cf 00 00 00       	callq  5d0 <printf>
     501:	48 be 21 15 00 00 00 	movabs $0x1521,%rsi
     508:	00 00 00 
     50b:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     512:	8b 55 e8             	mov    -0x18(%rbp),%edx
     515:	b0 00                	mov    $0x0,%al
     517:	e8 b4 00 00 00       	callq  5d0 <printf>
     51c:	48 be 67 15 00 00 00 	movabs $0x1567,%rsi
     523:	00 00 00 
     526:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     52d:	b0 00                	mov    $0x0,%al
     52f:	e8 9c 00 00 00       	callq  5d0 <printf>
     534:	e9 fb ff ff ff       	jmpq   534 <fourfiles+0x3d4>
    }
  }
     539:	e9 00 00 00 00       	jmpq   53e <fourfiles+0x3de>
  for(i = 0; i < 2; i++){
     53e:	8b 45 f4             	mov    -0xc(%rbp),%eax
     541:	83 c0 01             	add    $0x1,%eax
     544:	89 45 f4             	mov    %eax,-0xc(%rbp)
     547:	e9 87 fe ff ff       	jmpq   3d3 <fourfiles+0x273>
     54c:	bf 01 00 00 00       	mov    $0x1,%edi
     551:	48 be 32 15 00 00 00 	movabs $0x1532,%rsi
     558:	00 00 00 

  printf(1, "fourfiles ok\n");
     55b:	b0 00                	mov    $0x0,%al
     55d:	e8 6e 00 00 00       	callq  5d0 <printf>
}
     562:	48 83 c4 60          	add    $0x60,%rsp
     566:	5d                   	pop    %rbp
     567:	c3                   	retq   
     568:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     56f:	00 

0000000000000570 <main>:

int
main(int argc, char *argv[])
{
     570:	55                   	push   %rbp
     571:	48 89 e5             	mov    %rsp,%rbp
     574:	48 83 ec 20          	sub    $0x20,%rsp
     578:	48 b8 40 15 00 00 00 	movabs $0x1540,%rax
     57f:	00 00 00 
     582:	89 7d f8             	mov    %edi,-0x8(%rbp)
     585:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  printf(stdout, "lab5test_a starting\n");
     589:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     590:	48 89 c6             	mov    %rax,%rsi
     593:	b0 00                	mov    $0x0,%al
     595:	e8 36 00 00 00       	callq  5d0 <printf>
  modification();
     59a:	e8 61 fa ff ff       	callq  0 <modification>
  fourfiles();
     59f:	e8 bc fb ff ff       	callq  160 <fourfiles>
     5a4:	48 be 55 15 00 00 00 	movabs $0x1555,%rsi
     5ab:	00 00 00 

  printf(stdout, "lab5test_a passed!\n");
     5ae:	8b 3c 25 f0 17 00 00 	mov    0x17f0,%edi
     5b5:	b0 00                	mov    $0x0,%al
     5b7:	e8 14 00 00 00       	callq  5d0 <printf>
  exit();
     5bc:	e8 47 0a 00 00       	callq  1008 <exit>
     5c1:	89 45 ec             	mov    %eax,-0x14(%rbp)
     5c4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     5cb:	00 00 00 
     5ce:	66 90                	xchg   %ax,%ax

00000000000005d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     5d0:	55                   	push   %rbp
     5d1:	48 89 e5             	mov    %rsp,%rbp
     5d4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     5db:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     5df:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     5e3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     5e7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     5eb:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     5ef:	89 7d fc             	mov    %edi,-0x4(%rbp)
     5f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     5f6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     5fa:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     5fe:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     602:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     606:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     60d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     613:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     61a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     625:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     629:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     62d:	0f 84 f0 03 00 00    	je     a23 <printf+0x453>
    c = fmt[i] & 0xff;
     633:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     637:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     63b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     63f:	81 e2 ff 00 00 00    	and    $0xff,%edx
     645:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     648:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     64c:	0f 85 32 00 00 00    	jne    684 <printf+0xb4>
      if(c == '%'){
     652:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     656:	0f 85 13 00 00 00    	jne    66f <printf+0x9f>
        state = '%';
     65c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     663:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     66a:	e9 10 00 00 00       	jmpq   67f <printf+0xaf>
        putc(fd, c);
     66f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     672:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     675:	88 c1                	mov    %al,%cl
     677:	0f be f1             	movsbl %cl,%esi
     67a:	e8 b1 03 00 00       	callq  a30 <putc>
      }
    } else if(state == '%'){
     67f:	e9 8c 03 00 00       	jmpq   a10 <printf+0x440>
     684:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     688:	0f 85 7d 03 00 00    	jne    a0b <printf+0x43b>
      if(c == 'l') {
     68e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     692:	0f 85 0c 00 00 00    	jne    6a4 <printf+0xd4>
        lflag = 1;
     698:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     69f:	e9 71 03 00 00       	jmpq   a15 <printf+0x445>
      } else if(c == 'd'){
     6a4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     6a8:	0f 85 0e 01 00 00    	jne    7bc <printf+0x1ec>
        if (lflag == 1)
     6ae:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     6b2:	0f 85 79 00 00 00    	jne    731 <printf+0x161>
     6b8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     6bc:	8b 7d fc             	mov    -0x4(%rbp),%edi
     6bf:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     6c2:	83 f9 28             	cmp    $0x28,%ecx
     6c5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     6c9:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     6cc:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     6cf:	0f 87 1f 00 00 00    	ja     6f4 <printf+0x124>
     6d5:	8b 45 80             	mov    -0x80(%rbp),%eax
     6d8:	48 63 c8             	movslq %eax,%rcx
     6db:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     6df:	48 03 4a 10          	add    0x10(%rdx),%rcx
     6e3:	83 c0 08             	add    $0x8,%eax
     6e6:	89 02                	mov    %eax,(%rdx)
     6e8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     6ef:	e9 1a 00 00 00       	jmpq   70e <printf+0x13e>
     6f4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     6f8:	48 8b 48 08          	mov    0x8(%rax),%rcx
     6fc:	48 89 ca             	mov    %rcx,%rdx
     6ff:	48 83 c1 08          	add    $0x8,%rcx
     703:	48 89 48 08          	mov    %rcx,0x8(%rax)
     707:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     70e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     715:	ba 0a 00 00 00       	mov    $0xa,%edx
     71a:	b9 01 00 00 00       	mov    $0x1,%ecx
     71f:	48 8b 00             	mov    (%rax),%rax
     722:	89 c6                	mov    %eax,%esi
     724:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     727:	e8 34 03 00 00       	callq  a60 <printint64>
     72c:	e9 86 00 00 00       	jmpq   7b7 <printf+0x1e7>
     731:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     735:	8b 7d fc             	mov    -0x4(%rbp),%edi
     738:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     73b:	83 f9 28             	cmp    $0x28,%ecx
     73e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     745:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     74b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     751:	0f 87 25 00 00 00    	ja     77c <printf+0x1ac>
     757:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     75d:	48 63 c8             	movslq %eax,%rcx
     760:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     767:	48 03 4a 10          	add    0x10(%rdx),%rcx
     76b:	83 c0 08             	add    $0x8,%eax
     76e:	89 02                	mov    %eax,(%rdx)
     770:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     777:	e9 1d 00 00 00       	jmpq   799 <printf+0x1c9>
     77c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     783:	48 8b 48 08          	mov    0x8(%rax),%rcx
     787:	48 89 ca             	mov    %rcx,%rdx
     78a:	48 83 c1 08          	add    $0x8,%rcx
     78e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     792:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     799:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     7a0:	ba 0a 00 00 00       	mov    $0xa,%edx
     7a5:	b9 01 00 00 00       	mov    $0x1,%ecx
     7aa:	8b 30                	mov    (%rax),%esi
     7ac:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     7b2:	e8 a9 03 00 00       	callq  b60 <printint>
      } else if(c == 'x' || c == 'p'){
     7b7:	e9 43 02 00 00       	jmpq   9ff <printf+0x42f>
     7bc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     7c0:	0f 84 0a 00 00 00    	je     7d0 <printf+0x200>
     7c6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     7ca:	0f 85 1d 01 00 00    	jne    8ed <printf+0x31d>
        if (lflag == 1)
     7d0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     7d4:	0f 85 8b 00 00 00    	jne    865 <printf+0x295>
     7da:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     7de:	8b 7d fc             	mov    -0x4(%rbp),%edi
     7e1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     7e4:	83 f9 28             	cmp    $0x28,%ecx
     7e7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     7ee:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     7f4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     7fa:	0f 87 25 00 00 00    	ja     825 <printf+0x255>
     800:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     806:	48 63 c8             	movslq %eax,%rcx
     809:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     810:	48 03 4a 10          	add    0x10(%rdx),%rcx
     814:	83 c0 08             	add    $0x8,%eax
     817:	89 02                	mov    %eax,(%rdx)
     819:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     820:	e9 1d 00 00 00       	jmpq   842 <printf+0x272>
     825:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     82c:	48 8b 48 08          	mov    0x8(%rax),%rcx
     830:	48 89 ca             	mov    %rcx,%rdx
     833:	48 83 c1 08          	add    $0x8,%rcx
     837:	48 89 48 08          	mov    %rcx,0x8(%rax)
     83b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     842:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     849:	ba 10 00 00 00       	mov    $0x10,%edx
     84e:	31 c9                	xor    %ecx,%ecx
     850:	48 8b 00             	mov    (%rax),%rax
     853:	89 c6                	mov    %eax,%esi
     855:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     85b:	e8 00 02 00 00       	callq  a60 <printint64>
     860:	e9 83 00 00 00       	jmpq   8e8 <printf+0x318>
     865:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     869:	8b 7d fc             	mov    -0x4(%rbp),%edi
     86c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     86f:	83 f9 28             	cmp    $0x28,%ecx
     872:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     879:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     87f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     885:	0f 87 25 00 00 00    	ja     8b0 <printf+0x2e0>
     88b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     891:	48 63 c8             	movslq %eax,%rcx
     894:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     89b:	48 03 4a 10          	add    0x10(%rdx),%rcx
     89f:	83 c0 08             	add    $0x8,%eax
     8a2:	89 02                	mov    %eax,(%rdx)
     8a4:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     8ab:	e9 1d 00 00 00       	jmpq   8cd <printf+0x2fd>
     8b0:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     8b7:	48 8b 48 08          	mov    0x8(%rax),%rcx
     8bb:	48 89 ca             	mov    %rcx,%rdx
     8be:	48 83 c1 08          	add    $0x8,%rcx
     8c2:	48 89 48 08          	mov    %rcx,0x8(%rax)
     8c6:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     8cd:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     8d4:	ba 10 00 00 00       	mov    $0x10,%edx
     8d9:	31 c9                	xor    %ecx,%ecx
     8db:	8b 30                	mov    (%rax),%esi
     8dd:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     8e3:	e8 78 02 00 00       	callq  b60 <printint>
      } else if(c == 's'){
     8e8:	e9 0d 01 00 00       	jmpq   9fa <printf+0x42a>
     8ed:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     8f1:	0f 85 bc 00 00 00    	jne    9b3 <printf+0x3e3>
     8f7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     8fb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     8fe:	83 f9 28             	cmp    $0x28,%ecx
     901:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     908:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     90e:	0f 87 25 00 00 00    	ja     939 <printf+0x369>
     914:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     91a:	48 63 c8             	movslq %eax,%rcx
     91d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     924:	48 03 4a 10          	add    0x10(%rdx),%rcx
     928:	83 c0 08             	add    $0x8,%eax
     92b:	89 02                	mov    %eax,(%rdx)
     92d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     934:	e9 1d 00 00 00       	jmpq   956 <printf+0x386>
     939:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     940:	48 8b 48 08          	mov    0x8(%rax),%rcx
     944:	48 89 ca             	mov    %rcx,%rdx
     947:	48 83 c1 08          	add    $0x8,%rcx
     94b:	48 89 48 08          	mov    %rcx,0x8(%rax)
     94f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     956:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     95d:	48 8b 00             	mov    (%rax),%rax
     960:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     964:	48 83 f8 00          	cmp    $0x0,%rax
     968:	0f 85 0e 00 00 00    	jne    97c <printf+0x3ac>
     96e:	48 b8 90 15 00 00 00 	movabs $0x1590,%rax
     975:	00 00 00 
          s = "(null)";
     978:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     97c:	e9 00 00 00 00       	jmpq   981 <printf+0x3b1>
     981:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     985:	80 38 00             	cmpb   $0x0,(%rax)
     988:	0f 84 20 00 00 00    	je     9ae <printf+0x3de>
          putc(fd, *s);
     98e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     991:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     995:	0f be 30             	movsbl (%rax),%esi
     998:	e8 93 00 00 00       	callq  a30 <putc>
        for(; *s; s++)
     99d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     9a1:	48 83 c0 01          	add    $0x1,%rax
     9a5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     9a9:	e9 d3 ff ff ff       	jmpq   981 <printf+0x3b1>
      } else if(c == '%'){
     9ae:	e9 42 00 00 00       	jmpq   9f5 <printf+0x425>
     9b3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     9b7:	0f 85 15 00 00 00    	jne    9d2 <printf+0x402>
        putc(fd, c);
     9bd:	8b 7d fc             	mov    -0x4(%rbp),%edi
     9c0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     9c3:	88 c1                	mov    %al,%cl
     9c5:	0f be f1             	movsbl %cl,%esi
     9c8:	e8 63 00 00 00       	callq  a30 <putc>
      } else {
     9cd:	e9 1e 00 00 00       	jmpq   9f0 <printf+0x420>
     9d2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9d7:	8b 7d fc             	mov    -0x4(%rbp),%edi
     9da:	e8 51 00 00 00       	callq  a30 <putc>
        putc(fd, c);
     9df:	8b 7d fc             	mov    -0x4(%rbp),%edi
     9e2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     9e5:	40 88 f0             	mov    %sil,%al
     9e8:	0f be f0             	movsbl %al,%esi
     9eb:	e8 40 00 00 00       	callq  a30 <putc>
     9f0:	e9 00 00 00 00       	jmpq   9f5 <printf+0x425>
     9f5:	e9 00 00 00 00       	jmpq   9fa <printf+0x42a>
     9fa:	e9 00 00 00 00       	jmpq   9ff <printf+0x42f>
     9ff:	e9 00 00 00 00       	jmpq   a04 <printf+0x434>
      }
      state = 0;
     a04:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     a0b:	e9 00 00 00 00       	jmpq   a10 <printf+0x440>
    }
  }
     a10:	e9 00 00 00 00       	jmpq   a15 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     a15:	8b 45 e0             	mov    -0x20(%rbp),%eax
     a18:	83 c0 01             	add    $0x1,%eax
     a1b:	89 45 e0             	mov    %eax,-0x20(%rbp)
     a1e:	e9 fe fb ff ff       	jmpq   621 <printf+0x51>

  va_end(valist);
}
     a23:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     a2a:	5d                   	pop    %rbp
     a2b:	c3                   	retq   
     a2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000a30 <putc>:
{
     a30:	55                   	push   %rbp
     a31:	48 89 e5             	mov    %rsp,%rbp
     a34:	48 83 ec 10          	sub    $0x10,%rsp
     a38:	40 88 f0             	mov    %sil,%al
     a3b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     a3f:	ba 01 00 00 00       	mov    $0x1,%edx
     a44:	89 7d fc             	mov    %edi,-0x4(%rbp)
     a47:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     a4a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a4d:	e8 d6 05 00 00       	callq  1028 <write>
}
     a52:	89 45 f4             	mov    %eax,-0xc(%rbp)
     a55:	48 83 c4 10          	add    $0x10,%rsp
     a59:	5d                   	pop    %rbp
     a5a:	c3                   	retq   
     a5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000a60 <printint64>:
{
     a60:	55                   	push   %rbp
     a61:	48 89 e5             	mov    %rsp,%rbp
     a64:	48 83 ec 50          	sub    $0x50,%rsp
     a68:	89 7d fc             	mov    %edi,-0x4(%rbp)
     a6b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     a6e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     a71:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     a74:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     a78:	0f 84 30 00 00 00    	je     aae <printint64+0x4e>
     a7e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     a82:	0f 9c c0             	setl   %al
     a85:	88 c1                	mov    %al,%cl
     a87:	80 e1 01             	and    $0x1,%cl
     a8a:	0f b6 d1             	movzbl %cl,%edx
     a8d:	89 55 f0             	mov    %edx,-0x10(%rbp)
     a90:	a8 01                	test   $0x1,%al
     a92:	0f 85 05 00 00 00    	jne    a9d <printint64+0x3d>
     a98:	e9 11 00 00 00       	jmpq   aae <printint64+0x4e>
     a9d:	31 c0                	xor    %eax,%eax
    x = -xx;
     a9f:	2b 45 f8             	sub    -0x8(%rbp),%eax
     aa2:	48 63 c8             	movslq %eax,%rcx
     aa5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     aa9:	e9 08 00 00 00       	jmpq   ab6 <printint64+0x56>
    x = xx;
     aae:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     ab2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     ab6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     abd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     ac1:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     ac5:	31 d2                	xor    %edx,%edx
     ac7:	48 f7 f1             	div    %rcx
     aca:	40 8a 34 15 00 18 00 	mov    0x1800(,%rdx,1),%sil
     ad1:	00 
     ad2:	8b 7d cc             	mov    -0x34(%rbp),%edi
     ad5:	41 89 f8             	mov    %edi,%r8d
     ad8:	41 83 c0 01          	add    $0x1,%r8d
     adc:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     ae0:	48 63 cf             	movslq %edi,%rcx
     ae3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     ae8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     aec:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     af0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     af4:	48 89 c8             	mov    %rcx,%rax
     af7:	31 d2                	xor    %edx,%edx
     af9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     afd:	48 f7 f1             	div    %rcx
     b00:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     b04:	48 83 f8 00          	cmp    $0x0,%rax
     b08:	0f 85 af ff ff ff    	jne    abd <printint64+0x5d>
  if(sgn)
     b0e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     b12:	0f 84 13 00 00 00    	je     b2b <printint64+0xcb>
    buf[i++] = '-';
     b18:	8b 45 cc             	mov    -0x34(%rbp),%eax
     b1b:	89 c1                	mov    %eax,%ecx
     b1d:	83 c1 01             	add    $0x1,%ecx
     b20:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     b23:	48 63 d0             	movslq %eax,%rdx
     b26:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     b2b:	e9 00 00 00 00       	jmpq   b30 <printint64+0xd0>
     b30:	8b 45 cc             	mov    -0x34(%rbp),%eax
     b33:	83 c0 ff             	add    $0xffffffff,%eax
     b36:	89 45 cc             	mov    %eax,-0x34(%rbp)
     b39:	83 f8 00             	cmp    $0x0,%eax
     b3c:	0f 8c 16 00 00 00    	jl     b58 <printint64+0xf8>
    putc(fd, buf[i]);
     b42:	8b 7d fc             	mov    -0x4(%rbp),%edi
     b45:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     b49:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     b4e:	e8 dd fe ff ff       	callq  a30 <putc>
  while(--i >= 0)
     b53:	e9 d8 ff ff ff       	jmpq   b30 <printint64+0xd0>
}
     b58:	48 83 c4 50          	add    $0x50,%rsp
     b5c:	5d                   	pop    %rbp
     b5d:	c3                   	retq   
     b5e:	66 90                	xchg   %ax,%ax

0000000000000b60 <printint>:
{
     b60:	55                   	push   %rbp
     b61:	48 89 e5             	mov    %rsp,%rbp
     b64:	48 83 ec 30          	sub    $0x30,%rsp
     b68:	89 7d fc             	mov    %edi,-0x4(%rbp)
     b6b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     b6e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     b71:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     b74:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     b7b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     b7f:	0f 84 1e 00 00 00    	je     ba3 <printint+0x43>
     b85:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     b89:	0f 8d 14 00 00 00    	jge    ba3 <printint+0x43>
     b8f:	31 c0                	xor    %eax,%eax
    neg = 1;
     b91:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     b98:	2b 45 f8             	sub    -0x8(%rbp),%eax
     b9b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     b9e:	e9 06 00 00 00       	jmpq   ba9 <printint+0x49>
    x = xx;
     ba3:	8b 45 f8             	mov    -0x8(%rbp),%eax
     ba6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     ba9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     bb0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     bb3:	31 d2                	xor    %edx,%edx
     bb5:	f7 75 f4             	divl   -0xc(%rbp)
     bb8:	89 d2                	mov    %edx,%edx
     bba:	89 d1                	mov    %edx,%ecx
     bbc:	40 8a 34 0d 20 18 00 	mov    0x1820(,%rcx,1),%sil
     bc3:	00 
     bc4:	8b 55 dc             	mov    -0x24(%rbp),%edx
     bc7:	89 d7                	mov    %edx,%edi
     bc9:	83 c7 01             	add    $0x1,%edi
     bcc:	89 7d dc             	mov    %edi,-0x24(%rbp)
     bcf:	48 63 ca             	movslq %edx,%rcx
     bd2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     bd7:	8b 45 f4             	mov    -0xc(%rbp),%eax
     bda:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     bdd:	89 45 d0             	mov    %eax,-0x30(%rbp)
     be0:	89 c8                	mov    %ecx,%eax
     be2:	31 d2                	xor    %edx,%edx
     be4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     be7:	f7 f1                	div    %ecx
     be9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     bec:	83 f8 00             	cmp    $0x0,%eax
     bef:	0f 85 bb ff ff ff    	jne    bb0 <printint+0x50>
  if(neg)
     bf5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     bf9:	0f 84 13 00 00 00    	je     c12 <printint+0xb2>
    buf[i++] = '-';
     bff:	8b 45 dc             	mov    -0x24(%rbp),%eax
     c02:	89 c1                	mov    %eax,%ecx
     c04:	83 c1 01             	add    $0x1,%ecx
     c07:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     c0a:	48 63 d0             	movslq %eax,%rdx
     c0d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     c12:	e9 00 00 00 00       	jmpq   c17 <printint+0xb7>
     c17:	8b 45 dc             	mov    -0x24(%rbp),%eax
     c1a:	83 c0 ff             	add    $0xffffffff,%eax
     c1d:	89 45 dc             	mov    %eax,-0x24(%rbp)
     c20:	83 f8 00             	cmp    $0x0,%eax
     c23:	0f 8c 16 00 00 00    	jl     c3f <printint+0xdf>
    putc(fd, buf[i]);
     c29:	8b 7d fc             	mov    -0x4(%rbp),%edi
     c2c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     c30:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     c35:	e8 f6 fd ff ff       	callq  a30 <putc>
  while(--i >= 0)
     c3a:	e9 d8 ff ff ff       	jmpq   c17 <printint+0xb7>
}
     c3f:	48 83 c4 30          	add    $0x30,%rsp
     c43:	5d                   	pop    %rbp
     c44:	c3                   	retq   
     c45:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     c4c:	00 00 00 
     c4f:	90                   	nop

0000000000000c50 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     c50:	55                   	push   %rbp
     c51:	48 89 e5             	mov    %rsp,%rbp
     c54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     c5c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     c60:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     c64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c68:	48 89 c1             	mov    %rax,%rcx
     c6b:	48 83 c1 01          	add    $0x1,%rcx
     c6f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     c73:	8a 10                	mov    (%rax),%dl
     c75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c79:	48 89 c1             	mov    %rax,%rcx
     c7c:	48 83 c1 01          	add    $0x1,%rcx
     c80:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     c84:	88 10                	mov    %dl,(%rax)
     c86:	0f be f2             	movsbl %dl,%esi
     c89:	83 fe 00             	cmp    $0x0,%esi
     c8c:	0f 84 05 00 00 00    	je     c97 <strcpy+0x47>
     c92:	e9 cd ff ff ff       	jmpq   c64 <strcpy+0x14>
    ;
  return os;
     c97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     c9b:	5d                   	pop    %rbp
     c9c:	c3                   	retq   
     c9d:	0f 1f 00             	nopl   (%rax)

0000000000000ca0 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     ca0:	55                   	push   %rbp
     ca1:	48 89 e5             	mov    %rsp,%rbp
     ca4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ca8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     cac:	31 c0                	xor    %eax,%eax
     cae:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     cb0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     cb4:	0f be 02             	movsbl (%rdx),%eax
     cb7:	83 f8 00             	cmp    $0x0,%eax
     cba:	88 4d ef             	mov    %cl,-0x11(%rbp)
     cbd:	0f 84 18 00 00 00    	je     cdb <strcmp+0x3b>
     cc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     cc7:	0f be 08             	movsbl (%rax),%ecx
     cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cce:	0f be 10             	movsbl (%rax),%edx
     cd1:	39 d1                	cmp    %edx,%ecx
     cd3:	40 0f 94 c6          	sete   %sil
     cd7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     cdb:	8a 45 ef             	mov    -0x11(%rbp),%al
     cde:	a8 01                	test   $0x1,%al
     ce0:	0f 85 05 00 00 00    	jne    ceb <strcmp+0x4b>
     ce6:	e9 1d 00 00 00       	jmpq   d08 <strcmp+0x68>
    p++, q++;
     ceb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     cef:	48 83 c0 01          	add    $0x1,%rax
     cf3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     cf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cfb:	48 83 c0 01          	add    $0x1,%rax
     cff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     d03:	e9 a4 ff ff ff       	jmpq   cac <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     d08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d0c:	0f b6 08             	movzbl (%rax),%ecx
     d0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d13:	0f b6 10             	movzbl (%rax),%edx
     d16:	29 d1                	sub    %edx,%ecx
     d18:	89 c8                	mov    %ecx,%eax
     d1a:	5d                   	pop    %rbp
     d1b:	c3                   	retq   
     d1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000d20 <strlen>:
}

uint
strlen(char *s)
{
     d20:	55                   	push   %rbp
     d21:	48 89 e5             	mov    %rsp,%rbp
     d24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     d28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     d2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d33:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     d37:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     d3b:	0f 84 13 00 00 00    	je     d54 <strlen+0x34>
     d41:	e9 00 00 00 00       	jmpq   d46 <strlen+0x26>
     d46:	8b 45 f4             	mov    -0xc(%rbp),%eax
     d49:	83 c0 01             	add    $0x1,%eax
     d4c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     d4f:	e9 db ff ff ff       	jmpq   d2f <strlen+0xf>
    ;
  return n;
     d54:	8b 45 f4             	mov    -0xc(%rbp),%eax
     d57:	5d                   	pop    %rbp
     d58:	c3                   	retq   
     d59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000d60 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     d60:	55                   	push   %rbp
     d61:	48 89 e5             	mov    %rsp,%rbp
     d64:	48 83 ec 10          	sub    $0x10,%rsp
     d68:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     d6c:	89 75 f4             	mov    %esi,-0xc(%rbp)
     d6f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     d72:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     d76:	8b 75 f4             	mov    -0xc(%rbp),%esi
     d79:	8b 55 f0             	mov    -0x10(%rbp),%edx
     d7c:	e8 0f 00 00 00       	callq  d90 <stosb>
  return dst;
     d81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d85:	48 83 c4 10          	add    $0x10,%rsp
     d89:	5d                   	pop    %rbp
     d8a:	c3                   	retq   
     d8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000d90 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     d90:	55                   	push   %rbp
     d91:	48 89 e5             	mov    %rsp,%rbp
     d94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     d98:	89 75 f4             	mov    %esi,-0xc(%rbp)
     d9b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     d9e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     da2:	8b 55 f0             	mov    -0x10(%rbp),%edx
     da5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     da8:	89 d1                	mov    %edx,%ecx
     daa:	fc                   	cld    
     dab:	f3 aa                	rep stos %al,%es:(%rdi)
     dad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     db1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     db4:	5d                   	pop    %rbp
     db5:	c3                   	retq   
     db6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     dbd:	00 00 00 

0000000000000dc0 <strchr>:
}

char*
strchr(const char *s, char c)
{
     dc0:	55                   	push   %rbp
     dc1:	48 89 e5             	mov    %rsp,%rbp
     dc4:	40 88 f0             	mov    %sil,%al
     dc7:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     dcb:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     dce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     dd2:	80 38 00             	cmpb   $0x0,(%rax)
     dd5:	0f 84 36 00 00 00    	je     e11 <strchr+0x51>
    if(*s == c)
     ddb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ddf:	0f be 08             	movsbl (%rax),%ecx
     de2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     de6:	39 d1                	cmp    %edx,%ecx
     de8:	0f 85 0d 00 00 00    	jne    dfb <strchr+0x3b>
      return (char*)s;
     dee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     df2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     df6:	e9 1e 00 00 00       	jmpq   e19 <strchr+0x59>
    if(*s == c)
     dfb:	e9 00 00 00 00       	jmpq   e00 <strchr+0x40>
  for(; *s; s++)
     e00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e04:	48 83 c0 01          	add    $0x1,%rax
     e08:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     e0c:	e9 bd ff ff ff       	jmpq   dce <strchr+0xe>
  return 0;
     e11:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     e18:	00 
}
     e19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e1d:	5d                   	pop    %rbp
     e1e:	c3                   	retq   
     e1f:	90                   	nop

0000000000000e20 <gets>:

char*
gets(char *buf, int max)
{
     e20:	55                   	push   %rbp
     e21:	48 89 e5             	mov    %rsp,%rbp
     e24:	48 83 ec 20          	sub    $0x20,%rsp
     e28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e2c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     e36:	8b 45 f0             	mov    -0x10(%rbp),%eax
     e39:	83 c0 01             	add    $0x1,%eax
     e3c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     e3f:	0f 8d 5e 00 00 00    	jge    ea3 <gets+0x83>
     e45:	31 ff                	xor    %edi,%edi
     e47:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
     e4b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
     e50:	e8 cb 01 00 00       	callq  1020 <read>
     e55:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
     e58:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
     e5c:	0f 8d 05 00 00 00    	jge    e67 <gets+0x47>
      break;
     e62:	e9 3c 00 00 00       	jmpq   ea3 <gets+0x83>
    buf[i++] = c;
     e67:	8a 45 eb             	mov    -0x15(%rbp),%al
     e6a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     e6e:	8b 55 f0             	mov    -0x10(%rbp),%edx
     e71:	89 d6                	mov    %edx,%esi
     e73:	83 c6 01             	add    $0x1,%esi
     e76:	89 75 f0             	mov    %esi,-0x10(%rbp)
     e79:	48 63 fa             	movslq %edx,%rdi
     e7c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
     e7f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
     e83:	83 fa 0a             	cmp    $0xa,%edx
     e86:	0f 84 0d 00 00 00    	je     e99 <gets+0x79>
     e8c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
     e90:	83 f8 0d             	cmp    $0xd,%eax
     e93:	0f 85 05 00 00 00    	jne    e9e <gets+0x7e>
      break;
     e99:	e9 05 00 00 00       	jmpq   ea3 <gets+0x83>
  for(i=0; i+1 < max; ){
     e9e:	e9 93 ff ff ff       	jmpq   e36 <gets+0x16>
  }
  buf[i] = '\0';
     ea3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ea7:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
     eab:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
     eaf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     eb3:	48 83 c4 20          	add    $0x20,%rsp
     eb7:	5d                   	pop    %rbp
     eb8:	c3                   	retq   
     eb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000ec0 <stat>:
}

int
stat(char *n, struct stat *st)
{
     ec0:	55                   	push   %rbp
     ec1:	48 89 e5             	mov    %rsp,%rbp
     ec4:	48 83 ec 30          	sub    $0x30,%rsp
     ec8:	31 c0                	xor    %eax,%eax
     eca:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     ece:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ed2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     ed6:	89 c6                	mov    %eax,%esi
     ed8:	e8 6b 01 00 00       	callq  1048 <open>
     edd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
     ee0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     ee4:	0f 8d 0c 00 00 00    	jge    ef6 <stat+0x36>
    return -1;
     eea:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     ef1:	e9 20 00 00 00       	jmpq   f16 <stat+0x56>
  r = fstat(fd, st);
     ef6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     ef9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     efd:	e8 5e 01 00 00       	callq  1060 <fstat>
     f02:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
     f05:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     f08:	e8 23 01 00 00       	callq  1030 <close>
  return r;
     f0d:	8b 7d e0             	mov    -0x20(%rbp),%edi
     f10:	89 7d fc             	mov    %edi,-0x4(%rbp)
     f13:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
     f16:	8b 45 fc             	mov    -0x4(%rbp),%eax
     f19:	48 83 c4 30          	add    $0x30,%rsp
     f1d:	5d                   	pop    %rbp
     f1e:	c3                   	retq   
     f1f:	90                   	nop

0000000000000f20 <atoi>:

int
atoi(const char *s)
{
     f20:	55                   	push   %rbp
     f21:	48 89 e5             	mov    %rsp,%rbp
     f24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
     f28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     f2f:	31 c0                	xor    %eax,%eax
     f31:	88 c1                	mov    %al,%cl
     f33:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
     f38:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     f3c:	0f be 32             	movsbl (%rdx),%esi
     f3f:	39 f0                	cmp    %esi,%eax
     f41:	88 4d f3             	mov    %cl,-0xd(%rbp)
     f44:	0f 8f 10 00 00 00    	jg     f5a <atoi+0x3a>
     f4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f4e:	0f be 08             	movsbl (%rax),%ecx
     f51:	83 f9 39             	cmp    $0x39,%ecx
     f54:	0f 9e c2             	setle  %dl
     f57:	88 55 f3             	mov    %dl,-0xd(%rbp)
     f5a:	8a 45 f3             	mov    -0xd(%rbp),%al
     f5d:	a8 01                	test   $0x1,%al
     f5f:	0f 85 05 00 00 00    	jne    f6a <atoi+0x4a>
     f65:	e9 23 00 00 00       	jmpq   f8d <atoi+0x6d>
    n = n*10 + *s++ - '0';
     f6a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
     f6e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     f72:	48 89 ca             	mov    %rcx,%rdx
     f75:	48 83 c2 01          	add    $0x1,%rdx
     f79:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     f7d:	0f be 31             	movsbl (%rcx),%esi
     f80:	01 f0                	add    %esi,%eax
     f82:	83 e8 30             	sub    $0x30,%eax
     f85:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
     f88:	e9 a2 ff ff ff       	jmpq   f2f <atoi+0xf>
  return n;
     f8d:	8b 45 f4             	mov    -0xc(%rbp),%eax
     f90:	5d                   	pop    %rbp
     f91:	c3                   	retq   
     f92:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     f99:	1f 84 00 00 00 00 00 

0000000000000fa0 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     fa0:	55                   	push   %rbp
     fa1:	48 89 e5             	mov    %rsp,%rbp
     fa4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     fa8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     fac:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
     faf:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     fb3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
     fb7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     fbb:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
     fbf:	8b 45 ec             	mov    -0x14(%rbp),%eax
     fc2:	89 c1                	mov    %eax,%ecx
     fc4:	83 c1 ff             	add    $0xffffffff,%ecx
     fc7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
     fca:	83 f8 00             	cmp    $0x0,%eax
     fcd:	0f 8e 27 00 00 00    	jle    ffa <memmove+0x5a>
    *dst++ = *src++;
     fd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     fd7:	48 89 c1             	mov    %rax,%rcx
     fda:	48 83 c1 01          	add    $0x1,%rcx
     fde:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     fe2:	8a 10                	mov    (%rax),%dl
     fe4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     fe8:	48 89 c1             	mov    %rax,%rcx
     feb:	48 83 c1 01          	add    $0x1,%rcx
     fef:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     ff3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
     ff5:	e9 c5 ff ff ff       	jmpq   fbf <memmove+0x1f>
  return vdst;
     ffa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ffe:	5d                   	pop    %rbp
     fff:	c3                   	retq   

0000000000001000 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    1000:	b8 01 00 00 00       	mov    $0x1,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	retq   

0000000000001008 <exit>:
SYSCALL(exit)
    1008:	b8 02 00 00 00       	mov    $0x2,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	retq   

0000000000001010 <wait>:
SYSCALL(wait)
    1010:	b8 03 00 00 00       	mov    $0x3,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	retq   

0000000000001018 <pipe>:
SYSCALL(pipe)
    1018:	b8 04 00 00 00       	mov    $0x4,%eax
    101d:	cd 40                	int    $0x40
    101f:	c3                   	retq   

0000000000001020 <read>:
SYSCALL(read)
    1020:	b8 05 00 00 00       	mov    $0x5,%eax
    1025:	cd 40                	int    $0x40
    1027:	c3                   	retq   

0000000000001028 <write>:
SYSCALL(write)
    1028:	b8 10 00 00 00       	mov    $0x10,%eax
    102d:	cd 40                	int    $0x40
    102f:	c3                   	retq   

0000000000001030 <close>:
SYSCALL(close)
    1030:	b8 15 00 00 00       	mov    $0x15,%eax
    1035:	cd 40                	int    $0x40
    1037:	c3                   	retq   

0000000000001038 <kill>:
SYSCALL(kill)
    1038:	b8 06 00 00 00       	mov    $0x6,%eax
    103d:	cd 40                	int    $0x40
    103f:	c3                   	retq   

0000000000001040 <exec>:
SYSCALL(exec)
    1040:	b8 07 00 00 00       	mov    $0x7,%eax
    1045:	cd 40                	int    $0x40
    1047:	c3                   	retq   

0000000000001048 <open>:
SYSCALL(open)
    1048:	b8 0f 00 00 00       	mov    $0xf,%eax
    104d:	cd 40                	int    $0x40
    104f:	c3                   	retq   

0000000000001050 <mknod>:
SYSCALL(mknod)
    1050:	b8 11 00 00 00       	mov    $0x11,%eax
    1055:	cd 40                	int    $0x40
    1057:	c3                   	retq   

0000000000001058 <unlink>:
SYSCALL(unlink)
    1058:	b8 12 00 00 00       	mov    $0x12,%eax
    105d:	cd 40                	int    $0x40
    105f:	c3                   	retq   

0000000000001060 <fstat>:
SYSCALL(fstat)
    1060:	b8 08 00 00 00       	mov    $0x8,%eax
    1065:	cd 40                	int    $0x40
    1067:	c3                   	retq   

0000000000001068 <link>:
SYSCALL(link)
    1068:	b8 13 00 00 00       	mov    $0x13,%eax
    106d:	cd 40                	int    $0x40
    106f:	c3                   	retq   

0000000000001070 <mkdir>:
SYSCALL(mkdir)
    1070:	b8 14 00 00 00       	mov    $0x14,%eax
    1075:	cd 40                	int    $0x40
    1077:	c3                   	retq   

0000000000001078 <chdir>:
SYSCALL(chdir)
    1078:	b8 09 00 00 00       	mov    $0x9,%eax
    107d:	cd 40                	int    $0x40
    107f:	c3                   	retq   

0000000000001080 <dup>:
SYSCALL(dup)
    1080:	b8 0a 00 00 00       	mov    $0xa,%eax
    1085:	cd 40                	int    $0x40
    1087:	c3                   	retq   

0000000000001088 <getpid>:
SYSCALL(getpid)
    1088:	b8 0b 00 00 00       	mov    $0xb,%eax
    108d:	cd 40                	int    $0x40
    108f:	c3                   	retq   

0000000000001090 <sbrk>:
SYSCALL(sbrk)
    1090:	b8 0c 00 00 00       	mov    $0xc,%eax
    1095:	cd 40                	int    $0x40
    1097:	c3                   	retq   

0000000000001098 <sleep>:
SYSCALL(sleep)
    1098:	b8 0d 00 00 00       	mov    $0xd,%eax
    109d:	cd 40                	int    $0x40
    109f:	c3                   	retq   

00000000000010a0 <uptime>:
SYSCALL(uptime)
    10a0:	b8 0e 00 00 00       	mov    $0xe,%eax
    10a5:	cd 40                	int    $0x40
    10a7:	c3                   	retq   

00000000000010a8 <sysinfo>:
SYSCALL(sysinfo)
    10a8:	b8 16 00 00 00       	mov    $0x16,%eax
    10ad:	cd 40                	int    $0x40
    10af:	c3                   	retq   

00000000000010b0 <mmap>:
SYSCALL(mmap)
    10b0:	b8 17 00 00 00       	mov    $0x17,%eax
    10b5:	cd 40                	int    $0x40
    10b7:	c3                   	retq   

00000000000010b8 <munmap>:
SYSCALL(munmap)
    10b8:	b8 18 00 00 00       	mov    $0x18,%eax
    10bd:	cd 40                	int    $0x40
    10bf:	c3                   	retq   

00000000000010c0 <crashn>:
SYSCALL(crashn)
    10c0:	b8 19 00 00 00       	mov    $0x19,%eax
    10c5:	cd 40                	int    $0x40
    10c7:	c3                   	retq   
    10c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    10cf:	00 

00000000000010d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10d0:	55                   	push   %rbp
    10d1:	48 89 e5             	mov    %rsp,%rbp
    10d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    10d8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    10dc:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    10e0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10e4:	48 8b 3c 25 40 18 00 	mov    0x1840,%rdi
    10eb:	00 
    10ec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    10f0:	31 c0                	xor    %eax,%eax
    10f2:	88 c1                	mov    %al,%cl
    10f4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    10f8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    10fc:	88 4d e7             	mov    %cl,-0x19(%rbp)
    10ff:	0f 86 11 00 00 00    	jbe    1116 <free+0x46>
    1105:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1109:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    110d:	48 3b 01             	cmp    (%rcx),%rax
    1110:	0f 92 c2             	setb   %dl
    1113:	88 55 e7             	mov    %dl,-0x19(%rbp)
    1116:	8a 45 e7             	mov    -0x19(%rbp),%al
    1119:	34 ff                	xor    $0xff,%al
    111b:	a8 01                	test   $0x1,%al
    111d:	0f 85 05 00 00 00    	jne    1128 <free+0x58>
    1123:	e9 4a 00 00 00       	jmpq   1172 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1128:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    112c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1130:	48 3b 01             	cmp    (%rcx),%rax
    1133:	0f 82 24 00 00 00    	jb     115d <free+0x8d>
    1139:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    113d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1141:	0f 87 11 00 00 00    	ja     1158 <free+0x88>
    1147:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    114b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    114f:	48 3b 01             	cmp    (%rcx),%rax
    1152:	0f 83 05 00 00 00    	jae    115d <free+0x8d>
      break;
    1158:	e9 15 00 00 00       	jmpq   1172 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    115d:	e9 00 00 00 00       	jmpq   1162 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1162:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1166:	48 8b 00             	mov    (%rax),%rax
    1169:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    116d:	e9 7e ff ff ff       	jmpq   10f0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1172:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1176:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    117a:	8b 51 08             	mov    0x8(%rcx),%edx
    117d:	89 d1                	mov    %edx,%ecx
    117f:	48 c1 e1 04          	shl    $0x4,%rcx
    1183:	48 01 c8             	add    %rcx,%rax
    1186:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    118a:	48 3b 01             	cmp    (%rcx),%rax
    118d:	0f 85 2a 00 00 00    	jne    11bd <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1193:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1197:	48 8b 00             	mov    (%rax),%rax
    119a:	8b 48 08             	mov    0x8(%rax),%ecx
    119d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11a1:	03 48 08             	add    0x8(%rax),%ecx
    11a4:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    11a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11ab:	48 8b 00             	mov    (%rax),%rax
    11ae:	48 8b 00             	mov    (%rax),%rax
    11b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    11b5:	48 89 02             	mov    %rax,(%rdx)
  } else
    11b8:	e9 0e 00 00 00       	jmpq   11cb <free+0xfb>
    bp->s.ptr = p->s.ptr;
    11bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11c1:	48 8b 00             	mov    (%rax),%rax
    11c4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    11c8:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    11cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11cf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    11d3:	8b 51 08             	mov    0x8(%rcx),%edx
    11d6:	89 d1                	mov    %edx,%ecx
    11d8:	48 c1 e1 04          	shl    $0x4,%rcx
    11dc:	48 01 c8             	add    %rcx,%rax
    11df:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    11e3:	0f 85 24 00 00 00    	jne    120d <free+0x13d>
    p->s.size += bp->s.size;
    11e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11ed:	8b 48 08             	mov    0x8(%rax),%ecx
    11f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11f4:	03 48 08             	add    0x8(%rax),%ecx
    11f7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    11fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11fe:	48 8b 00             	mov    (%rax),%rax
    1201:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1205:	48 89 02             	mov    %rax,(%rdx)
  } else
    1208:	e9 0b 00 00 00       	jmpq   1218 <free+0x148>
    p->s.ptr = bp;
    120d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1211:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1215:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    1218:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    121c:	48 89 04 25 40 18 00 	mov    %rax,0x1840
    1223:	00 
}
    1224:	5d                   	pop    %rbp
    1225:	c3                   	retq   
    1226:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    122d:	00 00 00 

0000000000001230 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1230:	55                   	push   %rbp
    1231:	48 89 e5             	mov    %rsp,%rbp
    1234:	48 83 ec 30          	sub    $0x30,%rsp
    1238:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    123b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    123e:	89 f8                	mov    %edi,%eax
    1240:	48 83 c0 10          	add    $0x10,%rax
    1244:	48 83 e8 01          	sub    $0x1,%rax
    1248:	48 c1 e8 04          	shr    $0x4,%rax
    124c:	48 83 c0 01          	add    $0x1,%rax
    1250:	89 c7                	mov    %eax,%edi
    1252:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1255:	48 8b 04 25 40 18 00 	mov    0x1840,%rax
    125c:	00 
    125d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1261:	48 83 f8 00          	cmp    $0x0,%rax
    1265:	0f 85 29 00 00 00    	jne    1294 <malloc+0x64>
    126b:	48 b8 48 18 00 00 00 	movabs $0x1848,%rax
    1272:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1275:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1279:	48 89 04 25 40 18 00 	mov    %rax,0x1840
    1280:	00 
    1281:	48 89 04 25 48 18 00 	mov    %rax,0x1848
    1288:	00 
    base.s.size = 0;
    1289:	c7 04 25 50 18 00 00 	movl   $0x0,0x1850
    1290:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1294:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1298:	48 8b 00             	mov    (%rax),%rax
    129b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    129f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12a3:	8b 48 08             	mov    0x8(%rax),%ecx
    12a6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    12a9:	0f 82 73 00 00 00    	jb     1322 <malloc+0xf2>
      if(p->s.size == nunits)
    12af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12b3:	8b 48 08             	mov    0x8(%rax),%ecx
    12b6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    12b9:	0f 85 13 00 00 00    	jne    12d2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    12bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12c3:	48 8b 00             	mov    (%rax),%rax
    12c6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    12ca:	48 89 01             	mov    %rax,(%rcx)
    12cd:	e9 33 00 00 00       	jmpq   1305 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    12d2:	8b 45 dc             	mov    -0x24(%rbp),%eax
    12d5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    12d9:	8b 51 08             	mov    0x8(%rcx),%edx
    12dc:	29 c2                	sub    %eax,%edx
    12de:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    12e1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    12e5:	8b 41 08             	mov    0x8(%rcx),%eax
    12e8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    12ec:	89 c0                	mov    %eax,%eax
    12ee:	89 c6                	mov    %eax,%esi
    12f0:	48 c1 e6 04          	shl    $0x4,%rsi
    12f4:	48 01 f1             	add    %rsi,%rcx
    12f7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    12fb:	8b 45 dc             	mov    -0x24(%rbp),%eax
    12fe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1302:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    1305:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1309:	48 89 04 25 40 18 00 	mov    %rax,0x1840
    1310:	00 
      return (void*)(p + 1);
    1311:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1315:	48 83 c0 10          	add    $0x10,%rax
    1319:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    131d:	e9 57 00 00 00       	jmpq   1379 <malloc+0x149>
    }
    if(p == freep)
    1322:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1326:	48 3b 04 25 40 18 00 	cmp    0x1840,%rax
    132d:	00 
    132e:	0f 85 28 00 00 00    	jne    135c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    1334:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1337:	e8 54 00 00 00       	callq  1390 <morecore>
    133c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1340:	48 83 f8 00          	cmp    $0x0,%rax
    1344:	0f 85 0d 00 00 00    	jne    1357 <malloc+0x127>
        return 0;
    134a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1351:	00 
    1352:	e9 22 00 00 00       	jmpq   1379 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1357:	e9 00 00 00 00       	jmpq   135c <malloc+0x12c>
  }
    135c:	e9 00 00 00 00       	jmpq   1361 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1361:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1365:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1369:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    136d:	48 8b 00             	mov    (%rax),%rax
    1370:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1374:	e9 26 ff ff ff       	jmpq   129f <malloc+0x6f>
    1379:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    137d:	48 83 c4 30          	add    $0x30,%rsp
    1381:	5d                   	pop    %rbp
    1382:	c3                   	retq   
    1383:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    138a:	84 00 00 00 00 00 

0000000000001390 <morecore>:
{
    1390:	55                   	push   %rbp
    1391:	48 89 e5             	mov    %rsp,%rbp
    1394:	48 83 ec 20          	sub    $0x20,%rsp
    1398:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    139b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    13a2:	0f 83 07 00 00 00    	jae    13af <morecore+0x1f>
    nu = 4096;
    13a8:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    13af:	8b 45 f4             	mov    -0xc(%rbp),%eax
    13b2:	89 c1                	mov    %eax,%ecx
    13b4:	48 c1 e1 04          	shl    $0x4,%rcx
    13b8:	89 c8                	mov    %ecx,%eax
    13ba:	89 c7                	mov    %eax,%edi
    13bc:	e8 cf fc ff ff       	callq  1090 <sbrk>
    13c1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    13c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    13cc:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    13d0:	0f 85 0d 00 00 00    	jne    13e3 <morecore+0x53>
    return 0;
    13d6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    13dd:	00 
    13de:	e9 2e 00 00 00       	jmpq   1411 <morecore+0x81>
  hp = (Header*)p;
    13e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13e7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    13eb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    13ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13f2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    13f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13f9:	48 83 c0 10          	add    $0x10,%rax
    13fd:	48 89 c7             	mov    %rax,%rdi
    1400:	e8 cb fc ff ff       	callq  10d0 <free>
  return freep;
    1405:	48 8b 04 25 40 18 00 	mov    0x1840,%rax
    140c:	00 
    140d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1411:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1415:	48 83 c4 20          	add    $0x20,%rsp
    1419:	5d                   	pop    %rbp
    141a:	c3                   	retq   
