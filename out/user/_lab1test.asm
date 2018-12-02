
out/user/_lab1test:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
void smallfilereadtest(void);
void testinvalidargs(void);
void testmaxfiles(void);
void pipetest(void);

int main() {
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 10          	sub    $0x10,%rsp
       8:	48 bf 1b 1c 00 00 00 	movabs $0x1c1b,%rdi
       f:	00 00 00 
      12:	be 02 00 00 00       	mov    $0x2,%esi
  if(open("console", O_RDWR) < 0){
      17:	e8 2c 18 00 00       	callq  1848 <open>
      1c:	83 f8 00             	cmp    $0x0,%eax
      1f:	0f 8d 0b 00 00 00    	jge    30 <main+0x30>
      25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
      2a:	48 83 c4 10          	add    $0x10,%rsp
      2e:	5d                   	pop    %rbp
      2f:	c3                   	retq   
      30:	31 ff                	xor    %edi,%edi
  }
  dup(0);  // stdout
      32:	e8 49 18 00 00       	callq  1880 <dup>
      37:	31 ff                	xor    %edi,%edi
  dup(0);  // stderr
      39:	89 45 fc             	mov    %eax,-0x4(%rbp)
      3c:	e8 3f 18 00 00       	callq  1880 <dup>
      41:	bf 01 00 00 00       	mov    $0x1,%edi
      46:	48 be 23 1c 00 00 00 	movabs $0x1c23,%rsi
      4d:	00 00 00 

  printf(1, "hello world\n");
      50:	89 45 f8             	mov    %eax,-0x8(%rbp)
      53:	b0 00                	mov    $0x0,%al
      55:	e8 76 0d 00 00       	callq  dd0 <printf>

  smallfilereadtest();
      5a:	e8 31 00 00 00       	callq  90 <smallfilereadtest>
  testinvalidargs();
      5f:	e8 fc 04 00 00       	callq  560 <testinvalidargs>
  pipetest();
      64:	e8 27 0b 00 00       	callq  b90 <pipetest>
      69:	48 be 30 1c 00 00 00 	movabs $0x1c30,%rsi
      70:	00 00 00 

  printf(stdout, "lab1 tests passed!\n");
      73:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
      7a:	b0 00                	mov    $0x0,%al
      7c:	e8 4f 0d 00 00       	callq  dd0 <printf>

  exit();
      81:	e8 82 17 00 00       	callq  1808 <exit>
      86:	89 45 f4             	mov    %eax,-0xc(%rbp)
      89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000090 <smallfilereadtest>:
  return 0;
}

void
smallfilereadtest(void)
{
      90:	55                   	push   %rbp
      91:	48 89 e5             	mov    %rsp,%rbp
      94:	48 83 ec 20          	sub    $0x20,%rsp
      98:	48 be 44 1c 00 00 00 	movabs $0x1c44,%rsi
      9f:	00 00 00 
  int fd;
  int i;
  char buf[11];

  printf(stdout, "small file test\n");
      a2:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
      a9:	b0 00                	mov    $0x0,%al
      ab:	e8 20 0d 00 00       	callq  dd0 <printf>
      b0:	48 bf 55 1c 00 00 00 	movabs $0x1c55,%rdi
      b7:	00 00 00 
      ba:	31 f6                	xor    %esi,%esi
  // Test read only funcionality
  fd = open("/small.txt", O_RDONLY);
      bc:	e8 87 17 00 00       	callq  1848 <open>
      c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if(fd < 0)
      c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
      c8:	0f 8d 57 00 00 00    	jge    125 <smallfilereadtest+0x95>
    error("unable to open small file");
      ce:	e9 00 00 00 00       	jmpq   d3 <smallfilereadtest+0x43>
      d3:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
      da:	00 00 00 
      dd:	ba 34 00 00 00       	mov    $0x34,%edx
      e2:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
      e9:	b0 00                	mov    $0x0,%al
      eb:	e8 e0 0c 00 00       	callq  dd0 <printf>
      f0:	48 be 72 1c 00 00 00 	movabs $0x1c72,%rsi
      f7:	00 00 00 
      fa:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     101:	b0 00                	mov    $0x0,%al
     103:	e8 c8 0c 00 00       	callq  dd0 <printf>
     108:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     10f:	00 00 00 
     112:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     119:	b0 00                	mov    $0x0,%al
     11b:	e8 b0 0c 00 00       	callq  dd0 <printf>
     120:	e9 fb ff ff ff       	jmpq   120 <smallfilereadtest+0x90>
     125:	48 be 8c 1c 00 00 00 	movabs $0x1c8c,%rsi
     12c:	00 00 00 

  printf(stdout, "open small file succeeded; ok\n");
     12f:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     136:	b0 00                	mov    $0x0,%al
     138:	e8 93 0c 00 00       	callq  dd0 <printf>
     13d:	ba 0a 00 00 00       	mov    $0xa,%edx
     142:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  if ((i = read(fd, buf, 10)) != 10)
     146:	8b 7d fc             	mov    -0x4(%rbp),%edi
     149:	e8 d2 16 00 00       	callq  1820 <read>
     14e:	89 45 f8             	mov    %eax,-0x8(%rbp)
     151:	83 f8 0a             	cmp    $0xa,%eax
     154:	0f 84 61 00 00 00    	je     1bb <smallfilereadtest+0x12b>
    error("read of first 10 bytes unsucessful was %s bytes", "6");
     15a:	e9 00 00 00 00       	jmpq   15f <smallfilereadtest+0xcf>
     15f:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     166:	00 00 00 
     169:	ba 39 00 00 00       	mov    $0x39,%edx
     16e:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     175:	b0 00                	mov    $0x0,%al
     177:	e8 54 0c 00 00       	callq  dd0 <printf>
     17c:	48 be ab 1c 00 00 00 	movabs $0x1cab,%rsi
     183:	00 00 00 
     186:	48 ba db 1c 00 00 00 	movabs $0x1cdb,%rdx
     18d:	00 00 00 
     190:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     197:	b0 00                	mov    $0x0,%al
     199:	e8 32 0c 00 00       	callq  dd0 <printf>
     19e:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     1a5:	00 00 00 
     1a8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     1af:	b0 00                	mov    $0x0,%al
     1b1:	e8 1a 0c 00 00       	callq  dd0 <printf>
     1b6:	e9 fb ff ff ff       	jmpq   1b6 <smallfilereadtest+0x126>
     1bb:	48 be dd 1c 00 00 00 	movabs $0x1cdd,%rsi
     1c2:	00 00 00 
     1c5:	48 8d 7d ed          	lea    -0x13(%rbp),%rdi

  buf[10] = 0;
     1c9:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
  if (strcmp(buf, "aaaaaaaaaa") != 0)
     1cd:	e8 ce 12 00 00       	callq  14a0 <strcmp>
     1d2:	83 f8 00             	cmp    $0x0,%eax
     1d5:	0f 84 5b 00 00 00    	je     236 <smallfilereadtest+0x1a6>
    error("buf was not 10 a's, was: '%s'", buf);
     1db:	e9 00 00 00 00       	jmpq   1e0 <smallfilereadtest+0x150>
     1e0:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     1e7:	00 00 00 
     1ea:	ba 3d 00 00 00       	mov    $0x3d,%edx
     1ef:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     1f6:	b0 00                	mov    $0x0,%al
     1f8:	e8 d3 0b 00 00       	callq  dd0 <printf>
     1fd:	48 be e8 1c 00 00 00 	movabs $0x1ce8,%rsi
     204:	00 00 00 
     207:	48 8d 55 ed          	lea    -0x13(%rbp),%rdx
     20b:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     212:	b0 00                	mov    $0x0,%al
     214:	e8 b7 0b 00 00       	callq  dd0 <printf>
     219:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     220:	00 00 00 
     223:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     22a:	b0 00                	mov    $0x0,%al
     22c:	e8 9f 0b 00 00       	callq  dd0 <printf>
     231:	e9 fb ff ff ff       	jmpq   231 <smallfilereadtest+0x1a1>
     236:	48 be 06 1d 00 00 00 	movabs $0x1d06,%rsi
     23d:	00 00 00 
  printf(stdout, "read of first 10 bytes sucessful\n");
     240:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     247:	b0 00                	mov    $0x0,%al
     249:	e8 82 0b 00 00       	callq  dd0 <printf>
     24e:	ba 0a 00 00 00       	mov    $0xa,%edx
     253:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  if ((i = read(fd, buf, 10)) != 10)
     257:	8b 7d fc             	mov    -0x4(%rbp),%edi
     25a:	e8 c1 15 00 00       	callq  1820 <read>
     25f:	89 45 f8             	mov    %eax,-0x8(%rbp)
     262:	83 f8 0a             	cmp    $0xa,%eax
     265:	0f 84 5a 00 00 00    	je     2c5 <smallfilereadtest+0x235>
    error("read of second 10 bytes unsucessful was %d bytes", i);
     26b:	e9 00 00 00 00       	jmpq   270 <smallfilereadtest+0x1e0>
     270:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     277:	00 00 00 
     27a:	ba 41 00 00 00       	mov    $0x41,%edx
     27f:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     286:	b0 00                	mov    $0x0,%al
     288:	e8 43 0b 00 00       	callq  dd0 <printf>
     28d:	48 be 28 1d 00 00 00 	movabs $0x1d28,%rsi
     294:	00 00 00 
     297:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     29e:	8b 55 f8             	mov    -0x8(%rbp),%edx
     2a1:	b0 00                	mov    $0x0,%al
     2a3:	e8 28 0b 00 00       	callq  dd0 <printf>
     2a8:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     2af:	00 00 00 
     2b2:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     2b9:	b0 00                	mov    $0x0,%al
     2bb:	e8 10 0b 00 00       	callq  dd0 <printf>
     2c0:	e9 fb ff ff ff       	jmpq   2c0 <smallfilereadtest+0x230>
     2c5:	48 be 59 1d 00 00 00 	movabs $0x1d59,%rsi
     2cc:	00 00 00 
     2cf:	48 8d 7d ed          	lea    -0x13(%rbp),%rdi

  buf[10] = 0;
     2d3:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
  if (strcmp(buf, "bbbbbbbbbb") != 0)
     2d7:	e8 c4 11 00 00       	callq  14a0 <strcmp>
     2dc:	83 f8 00             	cmp    $0x0,%eax
     2df:	0f 84 5b 00 00 00    	je     340 <smallfilereadtest+0x2b0>
    error("buf was not 10 b's, was: '%s'", buf);
     2e5:	e9 00 00 00 00       	jmpq   2ea <smallfilereadtest+0x25a>
     2ea:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     2f1:	00 00 00 
     2f4:	ba 45 00 00 00       	mov    $0x45,%edx
     2f9:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     300:	b0 00                	mov    $0x0,%al
     302:	e8 c9 0a 00 00       	callq  dd0 <printf>
     307:	48 be 64 1d 00 00 00 	movabs $0x1d64,%rsi
     30e:	00 00 00 
     311:	48 8d 55 ed          	lea    -0x13(%rbp),%rdx
     315:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     31c:	b0 00                	mov    $0x0,%al
     31e:	e8 ad 0a 00 00       	callq  dd0 <printf>
     323:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     32a:	00 00 00 
     32d:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     334:	b0 00                	mov    $0x0,%al
     336:	e8 95 0a 00 00       	callq  dd0 <printf>
     33b:	e9 fb ff ff ff       	jmpq   33b <smallfilereadtest+0x2ab>
     340:	48 be 82 1d 00 00 00 	movabs $0x1d82,%rsi
     347:	00 00 00 
  printf(stdout, "read of second 10 bytes sucessful\n");
     34a:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     351:	b0 00                	mov    $0x0,%al
     353:	e8 78 0a 00 00       	callq  dd0 <printf>
     358:	ba 0a 00 00 00       	mov    $0xa,%edx
     35d:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  // only 25 byte file
  if ((i = read(fd, buf, 10)) != 6)
     361:	8b 7d fc             	mov    -0x4(%rbp),%edi
     364:	e8 b7 14 00 00       	callq  1820 <read>
     369:	89 45 f8             	mov    %eax,-0x8(%rbp)
     36c:	83 f8 06             	cmp    $0x6,%eax
     36f:	0f 84 5a 00 00 00    	je     3cf <smallfilereadtest+0x33f>
    error("read of last 6 bytes unsucessful was %d bytes", i);
     375:	e9 00 00 00 00       	jmpq   37a <smallfilereadtest+0x2ea>
     37a:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     381:	00 00 00 
     384:	ba 4a 00 00 00       	mov    $0x4a,%edx
     389:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     390:	b0 00                	mov    $0x0,%al
     392:	e8 39 0a 00 00       	callq  dd0 <printf>
     397:	48 be a5 1d 00 00 00 	movabs $0x1da5,%rsi
     39e:	00 00 00 
     3a1:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     3a8:	8b 55 f8             	mov    -0x8(%rbp),%edx
     3ab:	b0 00                	mov    $0x0,%al
     3ad:	e8 1e 0a 00 00       	callq  dd0 <printf>
     3b2:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     3b9:	00 00 00 
     3bc:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     3c3:	b0 00                	mov    $0x0,%al
     3c5:	e8 06 0a 00 00       	callq  dd0 <printf>
     3ca:	e9 fb ff ff ff       	jmpq   3ca <smallfilereadtest+0x33a>
     3cf:	48 be d3 1d 00 00 00 	movabs $0x1dd3,%rsi
     3d6:	00 00 00 
     3d9:	48 8d 7d ed          	lea    -0x13(%rbp),%rdi

  buf[6] = 0;
     3dd:	c6 45 f3 00          	movb   $0x0,-0xd(%rbp)
  if (strcmp(buf, "ccccc\n") != 0)
     3e1:	e8 ba 10 00 00       	callq  14a0 <strcmp>
     3e6:	83 f8 00             	cmp    $0x0,%eax
     3e9:	0f 84 5b 00 00 00    	je     44a <smallfilereadtest+0x3ba>
    error("buf was not 5 c's (and a newline), was: '%s'", buf);
     3ef:	e9 00 00 00 00       	jmpq   3f4 <smallfilereadtest+0x364>
     3f4:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     3fb:	00 00 00 
     3fe:	ba 4e 00 00 00       	mov    $0x4e,%edx
     403:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     40a:	b0 00                	mov    $0x0,%al
     40c:	e8 bf 09 00 00       	callq  dd0 <printf>
     411:	48 be da 1d 00 00 00 	movabs $0x1dda,%rsi
     418:	00 00 00 
     41b:	48 8d 55 ed          	lea    -0x13(%rbp),%rdx
     41f:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     426:	b0 00                	mov    $0x0,%al
     428:	e8 a3 09 00 00       	callq  dd0 <printf>
     42d:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     434:	00 00 00 
     437:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     43e:	b0 00                	mov    $0x0,%al
     440:	e8 8b 09 00 00       	callq  dd0 <printf>
     445:	e9 fb ff ff ff       	jmpq   445 <smallfilereadtest+0x3b5>
     44a:	48 be 07 1e 00 00 00 	movabs $0x1e07,%rsi
     451:	00 00 00 

  printf(stdout, "read of last 5 bytes sucessful\n");
     454:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     45b:	b0 00                	mov    $0x0,%al
     45d:	e8 6e 09 00 00       	callq  dd0 <printf>
     462:	ba 0a 00 00 00       	mov    $0xa,%edx
     467:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  if (read(fd, buf, 10) != 0)
     46b:	8b 7d fc             	mov    -0x4(%rbp),%edi
     46e:	e8 ad 13 00 00       	callq  1820 <read>
     473:	83 f8 00             	cmp    $0x0,%eax
     476:	0f 84 57 00 00 00    	je     4d3 <smallfilereadtest+0x443>
    error("read more bytes than should be possible");
     47c:	e9 00 00 00 00       	jmpq   481 <smallfilereadtest+0x3f1>
     481:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     488:	00 00 00 
     48b:	ba 53 00 00 00       	mov    $0x53,%edx
     490:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     497:	b0 00                	mov    $0x0,%al
     499:	e8 32 09 00 00       	callq  dd0 <printf>
     49e:	48 be 27 1e 00 00 00 	movabs $0x1e27,%rsi
     4a5:	00 00 00 
     4a8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     4af:	b0 00                	mov    $0x0,%al
     4b1:	e8 1a 09 00 00       	callq  dd0 <printf>
     4b6:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     4bd:	00 00 00 
     4c0:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     4c7:	b0 00                	mov    $0x0,%al
     4c9:	e8 02 09 00 00       	callq  dd0 <printf>
     4ce:	e9 fb ff ff ff       	jmpq   4ce <smallfilereadtest+0x43e>

  if (close(fd) != 0)
     4d3:	8b 7d fc             	mov    -0x4(%rbp),%edi
     4d6:	e8 55 13 00 00       	callq  1830 <close>
     4db:	83 f8 00             	cmp    $0x0,%eax
     4de:	0f 84 57 00 00 00    	je     53b <smallfilereadtest+0x4ab>
    error("error closing fd");
     4e4:	e9 00 00 00 00       	jmpq   4e9 <smallfilereadtest+0x459>
     4e9:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     4f0:	00 00 00 
     4f3:	ba 56 00 00 00       	mov    $0x56,%edx
     4f8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     4ff:	b0 00                	mov    $0x0,%al
     501:	e8 ca 08 00 00       	callq  dd0 <printf>
     506:	48 be 4f 1e 00 00 00 	movabs $0x1e4f,%rsi
     50d:	00 00 00 
     510:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     517:	b0 00                	mov    $0x0,%al
     519:	e8 b2 08 00 00       	callq  dd0 <printf>
     51e:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     525:	00 00 00 
     528:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     52f:	b0 00                	mov    $0x0,%al
     531:	e8 9a 08 00 00       	callq  dd0 <printf>
     536:	e9 fb ff ff ff       	jmpq   536 <smallfilereadtest+0x4a6>
     53b:	48 be 60 1e 00 00 00 	movabs $0x1e60,%rsi
     542:	00 00 00 
  printf(stdout, "small file test ok\n");
     545:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     54c:	b0 00                	mov    $0x0,%al
     54e:	e8 7d 08 00 00       	callq  dd0 <printf>
}
     553:	48 83 c4 20          	add    $0x20,%rsp
     557:	5d                   	pop    %rbp
     558:	c3                   	retq   
     559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000560 <testinvalidargs>:

void
testinvalidargs(void)
{
     560:	55                   	push   %rbp
     561:	48 89 e5             	mov    %rsp,%rbp
     564:	48 83 ec 20          	sub    $0x20,%rsp
     568:	48 bf 74 1e 00 00 00 	movabs $0x1e74,%rdi
     56f:	00 00 00 
     572:	be 00 02 00 00       	mov    $0x200,%esi
  int fd;
  int i;
  char buf[11];
  // open
  if (open("/other.txt", O_CREATE) != -1)
     577:	e8 cc 12 00 00       	callq  1848 <open>
     57c:	83 f8 ff             	cmp    $0xffffffff,%eax
     57f:	0f 84 57 00 00 00    	je     5dc <testinvalidargs+0x7c>
    error("created file in read only file system");
     585:	e9 00 00 00 00       	jmpq   58a <testinvalidargs+0x2a>
     58a:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     591:	00 00 00 
     594:	ba 62 00 00 00       	mov    $0x62,%edx
     599:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     5a0:	b0 00                	mov    $0x0,%al
     5a2:	e8 29 08 00 00       	callq  dd0 <printf>
     5a7:	48 be 7f 1e 00 00 00 	movabs $0x1e7f,%rsi
     5ae:	00 00 00 
     5b1:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     5b8:	b0 00                	mov    $0x0,%al
     5ba:	e8 11 08 00 00       	callq  dd0 <printf>
     5bf:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     5c6:	00 00 00 
     5c9:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     5d0:	b0 00                	mov    $0x0,%al
     5d2:	e8 f9 07 00 00       	callq  dd0 <printf>
     5d7:	e9 fb ff ff ff       	jmpq   5d7 <testinvalidargs+0x77>
     5dc:	48 bf 55 1c 00 00 00 	movabs $0x1c55,%rdi
     5e3:	00 00 00 
     5e6:	be 02 00 00 00       	mov    $0x2,%esi

  if (open("/small.txt", O_RDWR) != -1 || open("/small.txt", O_WRONLY) != -1)
     5eb:	e8 58 12 00 00       	callq  1848 <open>
     5f0:	83 f8 ff             	cmp    $0xffffffff,%eax
     5f3:	0f 85 1d 00 00 00    	jne    616 <testinvalidargs+0xb6>
     5f9:	48 bf 55 1c 00 00 00 	movabs $0x1c55,%rdi
     600:	00 00 00 
     603:	be 01 00 00 00       	mov    $0x1,%esi
     608:	e8 3b 12 00 00       	callq  1848 <open>
     60d:	83 f8 ff             	cmp    $0xffffffff,%eax
     610:	0f 84 57 00 00 00    	je     66d <testinvalidargs+0x10d>
    error("tried to open a file for writing in read only fs");
     616:	e9 00 00 00 00       	jmpq   61b <testinvalidargs+0xbb>
     61b:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     622:	00 00 00 
     625:	ba 65 00 00 00       	mov    $0x65,%edx
     62a:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     631:	b0 00                	mov    $0x0,%al
     633:	e8 98 07 00 00       	callq  dd0 <printf>
     638:	48 be a5 1e 00 00 00 	movabs $0x1ea5,%rsi
     63f:	00 00 00 
     642:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     649:	b0 00                	mov    $0x0,%al
     64b:	e8 80 07 00 00       	callq  dd0 <printf>
     650:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     657:	00 00 00 
     65a:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     661:	b0 00                	mov    $0x0,%al
     663:	e8 68 07 00 00       	callq  dd0 <printf>
     668:	e9 fb ff ff ff       	jmpq   668 <testinvalidargs+0x108>
     66d:	48 bf 74 1e 00 00 00 	movabs $0x1e74,%rdi
     674:	00 00 00 
     677:	31 f6                	xor    %esi,%esi

  if (open("/other.txt", O_RDONLY) != -1)
     679:	e8 ca 11 00 00       	callq  1848 <open>
     67e:	83 f8 ff             	cmp    $0xffffffff,%eax
     681:	0f 84 57 00 00 00    	je     6de <testinvalidargs+0x17e>
    error("opened a file that doesn't exist");
     687:	e9 00 00 00 00       	jmpq   68c <testinvalidargs+0x12c>
     68c:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     693:	00 00 00 
     696:	ba 68 00 00 00       	mov    $0x68,%edx
     69b:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     6a2:	b0 00                	mov    $0x0,%al
     6a4:	e8 27 07 00 00       	callq  dd0 <printf>
     6a9:	48 be d6 1e 00 00 00 	movabs $0x1ed6,%rsi
     6b0:	00 00 00 
     6b3:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     6ba:	b0 00                	mov    $0x0,%al
     6bc:	e8 0f 07 00 00       	callq  dd0 <printf>
     6c1:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     6c8:	00 00 00 
     6cb:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     6d2:	b0 00                	mov    $0x0,%al
     6d4:	e8 f7 06 00 00       	callq  dd0 <printf>
     6d9:	e9 fb ff ff ff       	jmpq   6d9 <testinvalidargs+0x179>
     6de:	48 be f7 1e 00 00 00 	movabs $0x1ef7,%rsi
     6e5:	00 00 00 

  printf(stdout, "passed argument checking for open\n");
     6e8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     6ef:	b0 00                	mov    $0x0,%al
     6f1:	e8 da 06 00 00       	callq  dd0 <printf>
     6f6:	bf 0f 00 00 00       	mov    $0xf,%edi
     6fb:	ba 0b 00 00 00       	mov    $0xb,%edx
     700:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  // read
  if (read(15, buf, 11) != -1)
     704:	e8 17 11 00 00       	callq  1820 <read>
     709:	83 f8 ff             	cmp    $0xffffffff,%eax
     70c:	0f 84 57 00 00 00    	je     769 <testinvalidargs+0x209>
    error("read on a non existent file descriptor");
     712:	e9 00 00 00 00       	jmpq   717 <testinvalidargs+0x1b7>
     717:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     71e:	00 00 00 
     721:	ba 6e 00 00 00       	mov    $0x6e,%edx
     726:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     72d:	b0 00                	mov    $0x0,%al
     72f:	e8 9c 06 00 00       	callq  dd0 <printf>
     734:	48 be 1a 1f 00 00 00 	movabs $0x1f1a,%rsi
     73b:	00 00 00 
     73e:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     745:	b0 00                	mov    $0x0,%al
     747:	e8 84 06 00 00       	callq  dd0 <printf>
     74c:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     753:	00 00 00 
     756:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     75d:	b0 00                	mov    $0x0,%al
     75f:	e8 6c 06 00 00       	callq  dd0 <printf>
     764:	e9 fb ff ff ff       	jmpq   764 <testinvalidargs+0x204>
     769:	48 bf 55 1c 00 00 00 	movabs $0x1c55,%rdi
     770:	00 00 00 
     773:	31 f6                	xor    %esi,%esi

  fd = open("/small.txt", O_RDONLY);
     775:	e8 ce 10 00 00       	callq  1848 <open>
     77a:	ba 9c ff ff ff       	mov    $0xffffff9c,%edx
     77f:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi
     783:	89 45 fc             	mov    %eax,-0x4(%rbp)

  if ((i = read(fd, buf, -100)) != -1)
     786:	8b 7d fc             	mov    -0x4(%rbp),%edi
     789:	e8 92 10 00 00       	callq  1820 <read>
     78e:	89 45 f8             	mov    %eax,-0x8(%rbp)
     791:	83 f8 ff             	cmp    $0xffffffff,%eax
     794:	0f 84 5a 00 00 00    	je     7f4 <testinvalidargs+0x294>
    error("negative n didn't return error was %d", i);
     79a:	e9 00 00 00 00       	jmpq   79f <testinvalidargs+0x23f>
     79f:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     7a6:	00 00 00 
     7a9:	ba 73 00 00 00       	mov    $0x73,%edx
     7ae:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     7b5:	b0 00                	mov    $0x0,%al
     7b7:	e8 14 06 00 00       	callq  dd0 <printf>
     7bc:	48 be 41 1f 00 00 00 	movabs $0x1f41,%rsi
     7c3:	00 00 00 
     7c6:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     7cd:	8b 55 f8             	mov    -0x8(%rbp),%edx
     7d0:	b0 00                	mov    $0x0,%al
     7d2:	e8 f9 05 00 00       	callq  dd0 <printf>
     7d7:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     7de:	00 00 00 
     7e1:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     7e8:	b0 00                	mov    $0x0,%al
     7ea:	e8 e1 05 00 00       	callq  dd0 <printf>
     7ef:	e9 fb ff ff ff       	jmpq   7ef <testinvalidargs+0x28f>
     7f4:	b8 00 ff ff ff       	mov    $0xffffff00,%eax
     7f9:	89 c6                	mov    %eax,%esi
     7fb:	ba 0a 00 00 00       	mov    $0xa,%edx

  if (read(fd, (char *)0xffffff00, 10) != -1)
     800:	8b 7d fc             	mov    -0x4(%rbp),%edi
     803:	e8 18 10 00 00       	callq  1820 <read>
     808:	83 f8 ff             	cmp    $0xffffffff,%eax
     80b:	0f 84 57 00 00 00    	je     868 <testinvalidargs+0x308>
    error("able to read to a buffer not in my memory region");
     811:	e9 00 00 00 00       	jmpq   816 <testinvalidargs+0x2b6>
     816:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     81d:	00 00 00 
     820:	ba 76 00 00 00       	mov    $0x76,%edx
     825:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     82c:	b0 00                	mov    $0x0,%al
     82e:	e8 9d 05 00 00       	callq  dd0 <printf>
     833:	48 be 67 1f 00 00 00 	movabs $0x1f67,%rsi
     83a:	00 00 00 
     83d:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     844:	b0 00                	mov    $0x0,%al
     846:	e8 85 05 00 00       	callq  dd0 <printf>
     84b:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     852:	00 00 00 
     855:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     85c:	b0 00                	mov    $0x0,%al
     85e:	e8 6d 05 00 00       	callq  dd0 <printf>
     863:	e9 fb ff ff ff       	jmpq   863 <testinvalidargs+0x303>
     868:	48 be 98 1f 00 00 00 	movabs $0x1f98,%rsi
     86f:	00 00 00 

  printf(stdout, "passed argument checking for read\n");
     872:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     879:	b0 00                	mov    $0x0,%al
     87b:	e8 50 05 00 00       	callq  dd0 <printf>
     880:	bf 0f 00 00 00       	mov    $0xf,%edi
     885:	ba 0b 00 00 00       	mov    $0xb,%edx
     88a:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  // write
  if (write(15, buf, 11) != -1)
     88e:	e8 95 0f 00 00       	callq  1828 <write>
     893:	83 f8 ff             	cmp    $0xffffffff,%eax
     896:	0f 84 57 00 00 00    	je     8f3 <testinvalidargs+0x393>
    error("write on a non existent file descriptor");
     89c:	e9 00 00 00 00       	jmpq   8a1 <testinvalidargs+0x341>
     8a1:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     8a8:	00 00 00 
     8ab:	ba 7c 00 00 00       	mov    $0x7c,%edx
     8b0:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     8b7:	b0 00                	mov    $0x0,%al
     8b9:	e8 12 05 00 00       	callq  dd0 <printf>
     8be:	48 be bb 1f 00 00 00 	movabs $0x1fbb,%rsi
     8c5:	00 00 00 
     8c8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     8cf:	b0 00                	mov    $0x0,%al
     8d1:	e8 fa 04 00 00       	callq  dd0 <printf>
     8d6:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     8dd:	00 00 00 
     8e0:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     8e7:	b0 00                	mov    $0x0,%al
     8e9:	e8 e2 04 00 00       	callq  dd0 <printf>
     8ee:	e9 fb ff ff ff       	jmpq   8ee <testinvalidargs+0x38e>
     8f3:	ba 0b 00 00 00       	mov    $0xb,%edx
     8f8:	48 8d 75 ed          	lea    -0x13(%rbp),%rsi

  if (write(fd, buf, 11) != -1)
     8fc:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8ff:	e8 24 0f 00 00       	callq  1828 <write>
     904:	83 f8 ff             	cmp    $0xffffffff,%eax
     907:	0f 84 57 00 00 00    	je     964 <testinvalidargs+0x404>
    error("able to write to a file in read only fs");
     90d:	e9 00 00 00 00       	jmpq   912 <testinvalidargs+0x3b2>
     912:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     919:	00 00 00 
     91c:	ba 7f 00 00 00       	mov    $0x7f,%edx
     921:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     928:	b0 00                	mov    $0x0,%al
     92a:	e8 a1 04 00 00       	callq  dd0 <printf>
     92f:	48 be e3 1f 00 00 00 	movabs $0x1fe3,%rsi
     936:	00 00 00 
     939:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     940:	b0 00                	mov    $0x0,%al
     942:	e8 89 04 00 00       	callq  dd0 <printf>
     947:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     94e:	00 00 00 
     951:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     958:	b0 00                	mov    $0x0,%al
     95a:	e8 71 04 00 00       	callq  dd0 <printf>
     95f:	e9 fb ff ff ff       	jmpq   95f <testinvalidargs+0x3ff>
     964:	48 be 0b 20 00 00 00 	movabs $0x200b,%rsi
     96b:	00 00 00 

  printf(stdout, "passed argument checking for write\n");
     96e:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     975:	b0 00                	mov    $0x0,%al
     977:	e8 54 04 00 00       	callq  dd0 <printf>
     97c:	bf 0f 00 00 00       	mov    $0xf,%edi

  // dup
  if (dup(15) != -1)
     981:	e8 fa 0e 00 00       	callq  1880 <dup>
     986:	83 f8 ff             	cmp    $0xffffffff,%eax
     989:	0f 84 57 00 00 00    	je     9e6 <testinvalidargs+0x486>
    error("able to duplicated a non open file");
     98f:	e9 00 00 00 00       	jmpq   994 <testinvalidargs+0x434>
     994:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     99b:	00 00 00 
     99e:	ba 85 00 00 00       	mov    $0x85,%edx
     9a3:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     9aa:	b0 00                	mov    $0x0,%al
     9ac:	e8 1f 04 00 00       	callq  dd0 <printf>
     9b1:	48 be 2f 20 00 00 00 	movabs $0x202f,%rsi
     9b8:	00 00 00 
     9bb:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     9c2:	b0 00                	mov    $0x0,%al
     9c4:	e8 07 04 00 00       	callq  dd0 <printf>
     9c9:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     9d0:	00 00 00 
     9d3:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     9da:	b0 00                	mov    $0x0,%al
     9dc:	e8 ef 03 00 00       	callq  dd0 <printf>
     9e1:	e9 fb ff ff ff       	jmpq   9e1 <testinvalidargs+0x481>
     9e6:	48 be 52 20 00 00 00 	movabs $0x2052,%rsi
     9ed:	00 00 00 

  printf(stdout, "passed argument checking for dup\n");
     9f0:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     9f7:	b0 00                	mov    $0x0,%al
     9f9:	e8 d2 03 00 00       	callq  dd0 <printf>
     9fe:	bf 0f 00 00 00       	mov    $0xf,%edi

  // close
  if (close(15) != -1)
     a03:	e8 28 0e 00 00       	callq  1830 <close>
     a08:	83 f8 ff             	cmp    $0xffffffff,%eax
     a0b:	0f 84 57 00 00 00    	je     a68 <testinvalidargs+0x508>
    error("able to close non open file");
     a11:	e9 00 00 00 00       	jmpq   a16 <testinvalidargs+0x4b6>
     a16:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     a1d:	00 00 00 
     a20:	ba 8b 00 00 00       	mov    $0x8b,%edx
     a25:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     a2c:	b0 00                	mov    $0x0,%al
     a2e:	e8 9d 03 00 00       	callq  dd0 <printf>
     a33:	48 be 74 20 00 00 00 	movabs $0x2074,%rsi
     a3a:	00 00 00 
     a3d:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     a44:	b0 00                	mov    $0x0,%al
     a46:	e8 85 03 00 00       	callq  dd0 <printf>
     a4b:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     a52:	00 00 00 
     a55:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     a5c:	b0 00                	mov    $0x0,%al
     a5e:	e8 6d 03 00 00       	callq  dd0 <printf>
     a63:	e9 fb ff ff ff       	jmpq   a63 <testinvalidargs+0x503>

  if (close(fd) > 0 && close(fd) != -1)
     a68:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a6b:	e8 c0 0d 00 00       	callq  1830 <close>
     a70:	83 f8 00             	cmp    $0x0,%eax
     a73:	0f 8e 68 00 00 00    	jle    ae1 <testinvalidargs+0x581>
     a79:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a7c:	e8 af 0d 00 00       	callq  1830 <close>
     a81:	83 f8 ff             	cmp    $0xffffffff,%eax
     a84:	0f 84 57 00 00 00    	je     ae1 <testinvalidargs+0x581>
    error("able to close same file twice");
     a8a:	e9 00 00 00 00       	jmpq   a8f <testinvalidargs+0x52f>
     a8f:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     a96:	00 00 00 
     a99:	ba 8e 00 00 00       	mov    $0x8e,%edx
     a9e:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     aa5:	b0 00                	mov    $0x0,%al
     aa7:	e8 24 03 00 00       	callq  dd0 <printf>
     aac:	48 be 90 20 00 00 00 	movabs $0x2090,%rsi
     ab3:	00 00 00 
     ab6:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     abd:	b0 00                	mov    $0x0,%al
     abf:	e8 0c 03 00 00       	callq  dd0 <printf>
     ac4:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     acb:	00 00 00 
     ace:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     ad5:	b0 00                	mov    $0x0,%al
     ad7:	e8 f4 02 00 00       	callq  dd0 <printf>
     adc:	e9 fb ff ff ff       	jmpq   adc <testinvalidargs+0x57c>
     ae1:	48 be ae 20 00 00 00 	movabs $0x20ae,%rsi
     ae8:	00 00 00 

  printf(stdout, "passed argument checking for close\n");
     aeb:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     af2:	b0 00                	mov    $0x0,%al
     af4:	e8 d7 02 00 00       	callq  dd0 <printf>
     af9:	bf 00 ff ff ff       	mov    $0xffffff00,%edi

  // pipe
  if (pipe((int *)0xffffff00) != -1)
     afe:	e8 15 0d 00 00       	callq  1818 <pipe>
     b03:	83 f8 ff             	cmp    $0xffffffff,%eax
     b06:	0f 84 57 00 00 00    	je     b63 <testinvalidargs+0x603>
    error("able to alloc a pipe not in my memory region");
     b0c:	e9 00 00 00 00       	jmpq   b11 <testinvalidargs+0x5b1>
     b11:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     b18:	00 00 00 
     b1b:	ba 94 00 00 00       	mov    $0x94,%edx
     b20:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     b27:	b0 00                	mov    $0x0,%al
     b29:	e8 a2 02 00 00       	callq  dd0 <printf>
     b2e:	48 be d2 20 00 00 00 	movabs $0x20d2,%rsi
     b35:	00 00 00 
     b38:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     b3f:	b0 00                	mov    $0x0,%al
     b41:	e8 8a 02 00 00       	callq  dd0 <printf>
     b46:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     b4d:	00 00 00 
     b50:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     b57:	b0 00                	mov    $0x0,%al
     b59:	e8 72 02 00 00       	callq  dd0 <printf>
     b5e:	e9 fb ff ff ff       	jmpq   b5e <testinvalidargs+0x5fe>
     b63:	48 be ff 20 00 00 00 	movabs $0x20ff,%rsi
     b6a:	00 00 00 

  printf(stdout, "passed argument checking for pipe\n");
     b6d:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     b74:	b0 00                	mov    $0x0,%al
     b76:	e8 55 02 00 00       	callq  dd0 <printf>
}
     b7b:	48 83 c4 20          	add    $0x20,%rsp
     b7f:	5d                   	pop    %rbp
     b80:	c3                   	retq   
     b81:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     b88:	0f 1f 84 00 00 00 00 
     b8f:	00 

0000000000000b90 <pipetest>:
{
}

void
pipetest(void)
{
     b90:	55                   	push   %rbp
     b91:	48 89 e5             	mov    %rsp,%rbp
     b94:	48 83 ec 20          	sub    $0x20,%rsp
     b98:	48 8d 7d ec          	lea    -0x14(%rbp),%rdi
  char buf[11];
  int pfds[2];
  int i;
  pipe(pfds);
     b9c:	e8 77 0c 00 00       	callq  1818 <pipe>
     ba1:	48 be dd 1c 00 00 00 	movabs $0x1cdd,%rsi
     ba8:	00 00 00 
     bab:	ba 0a 00 00 00       	mov    $0xa,%edx

  if(write(pfds[1], "aaaaaaaaaa", 10) != 10)
     bb0:	8b 7d f0             	mov    -0x10(%rbp),%edi
     bb3:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     bb6:	e8 6d 0c 00 00       	callq  1828 <write>
     bbb:	83 f8 0a             	cmp    $0xa,%eax
     bbe:	0f 84 57 00 00 00    	je     c1b <pipetest+0x8b>
    error("unable to write to pipe");
     bc4:	e9 00 00 00 00       	jmpq   bc9 <pipetest+0x39>
     bc9:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     bd0:	00 00 00 
     bd3:	ba a7 00 00 00       	mov    $0xa7,%edx
     bd8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     bdf:	b0 00                	mov    $0x0,%al
     be1:	e8 ea 01 00 00       	callq  dd0 <printf>
     be6:	48 be 22 21 00 00 00 	movabs $0x2122,%rsi
     bed:	00 00 00 
     bf0:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     bf7:	b0 00                	mov    $0x0,%al
     bf9:	e8 d2 01 00 00       	callq  dd0 <printf>
     bfe:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     c05:	00 00 00 
     c08:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     c0f:	b0 00                	mov    $0x0,%al
     c11:	e8 ba 01 00 00       	callq  dd0 <printf>
     c16:	e9 fb ff ff ff       	jmpq   c16 <pipetest+0x86>
     c1b:	ba 0a 00 00 00       	mov    $0xa,%edx
     c20:	48 8d 75 f5          	lea    -0xb(%rbp),%rsi

  if ((i = read(pfds[0], buf, 10)) != 10)
     c24:	8b 7d ec             	mov    -0x14(%rbp),%edi
     c27:	e8 f4 0b 00 00       	callq  1820 <read>
     c2c:	89 45 e8             	mov    %eax,-0x18(%rbp)
     c2f:	83 f8 0a             	cmp    $0xa,%eax
     c32:	0f 84 5a 00 00 00    	je     c92 <pipetest+0x102>
    error("didn't read 10 bytes, only read %d bytes", i);
     c38:	e9 00 00 00 00       	jmpq   c3d <pipetest+0xad>
     c3d:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     c44:	00 00 00 
     c47:	ba aa 00 00 00       	mov    $0xaa,%edx
     c4c:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     c53:	b0 00                	mov    $0x0,%al
     c55:	e8 76 01 00 00       	callq  dd0 <printf>
     c5a:	48 be 3a 21 00 00 00 	movabs $0x213a,%rsi
     c61:	00 00 00 
     c64:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     c6b:	8b 55 e8             	mov    -0x18(%rbp),%edx
     c6e:	b0 00                	mov    $0x0,%al
     c70:	e8 5b 01 00 00       	callq  dd0 <printf>
     c75:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     c7c:	00 00 00 
     c7f:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     c86:	b0 00                	mov    $0x0,%al
     c88:	e8 43 01 00 00       	callq  dd0 <printf>
     c8d:	e9 fb ff ff ff       	jmpq   c8d <pipetest+0xfd>
     c92:	48 be dd 1c 00 00 00 	movabs $0x1cdd,%rsi
     c99:	00 00 00 
     c9c:	48 8d 7d f5          	lea    -0xb(%rbp),%rdi

  buf[10] = 0;
     ca0:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  if (strcmp(buf, "aaaaaaaaaa") != 0)
     ca4:	e8 f7 07 00 00       	callq  14a0 <strcmp>
     ca9:	83 f8 00             	cmp    $0x0,%eax
     cac:	0f 84 5b 00 00 00    	je     d0d <pipetest+0x17d>
    error("buf wasn't 10 a's, was '%s'", buf);
     cb2:	e9 00 00 00 00       	jmpq   cb7 <pipetest+0x127>
     cb7:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     cbe:	00 00 00 
     cc1:	ba ae 00 00 00       	mov    $0xae,%edx
     cc6:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     ccd:	b0 00                	mov    $0x0,%al
     ccf:	e8 fc 00 00 00       	callq  dd0 <printf>
     cd4:	48 be 63 21 00 00 00 	movabs $0x2163,%rsi
     cdb:	00 00 00 
     cde:	48 8d 55 f5          	lea    -0xb(%rbp),%rdx
     ce2:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     ce9:	b0 00                	mov    $0x0,%al
     ceb:	e8 e0 00 00 00       	callq  dd0 <printf>
     cf0:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     cf7:	00 00 00 
     cfa:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     d01:	b0 00                	mov    $0x0,%al
     d03:	e8 c8 00 00 00       	callq  dd0 <printf>
     d08:	e9 fb ff ff ff       	jmpq   d08 <pipetest+0x178>
     d0d:	48 be 7f 21 00 00 00 	movabs $0x217f,%rsi
     d14:	00 00 00 

  printf(stdout, "read succeeded ok\n");
     d17:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     d1e:	b0 00                	mov    $0x0,%al
     d20:	e8 ab 00 00 00       	callq  dd0 <printf>

  if (close(pfds[0]) < 0 || close(pfds[1]) < 0)
     d25:	8b 7d ec             	mov    -0x14(%rbp),%edi
     d28:	e8 03 0b 00 00       	callq  1830 <close>
     d2d:	83 f8 00             	cmp    $0x0,%eax
     d30:	0f 8c 11 00 00 00    	jl     d47 <pipetest+0x1b7>
     d36:	8b 7d f0             	mov    -0x10(%rbp),%edi
     d39:	e8 f2 0a 00 00       	callq  1830 <close>
     d3e:	83 f8 00             	cmp    $0x0,%eax
     d41:	0f 8d 57 00 00 00    	jge    d9e <pipetest+0x20e>
    error("closing the files in the pipe");
     d47:	e9 00 00 00 00       	jmpq   d4c <pipetest+0x1bc>
     d4c:	48 be 60 1c 00 00 00 	movabs $0x1c60,%rsi
     d53:	00 00 00 
     d56:	ba b3 00 00 00       	mov    $0xb3,%edx
     d5b:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     d62:	b0 00                	mov    $0x0,%al
     d64:	e8 67 00 00 00       	callq  dd0 <printf>
     d69:	48 be 92 21 00 00 00 	movabs $0x2192,%rsi
     d70:	00 00 00 
     d73:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     d7a:	b0 00                	mov    $0x0,%al
     d7c:	e8 4f 00 00 00       	callq  dd0 <printf>
     d81:	48 be 42 1c 00 00 00 	movabs $0x1c42,%rsi
     d88:	00 00 00 
     d8b:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     d92:	b0 00                	mov    $0x0,%al
     d94:	e8 37 00 00 00       	callq  dd0 <printf>
     d99:	e9 fb ff ff ff       	jmpq   d99 <pipetest+0x209>
     d9e:	48 be b0 21 00 00 00 	movabs $0x21b0,%rsi
     da5:	00 00 00 

  printf(stdout, "pipe test ok\n");
     da8:	8b 3c 25 50 24 00 00 	mov    0x2450,%edi
     daf:	b0 00                	mov    $0x0,%al
     db1:	e8 1a 00 00 00       	callq  dd0 <printf>
}
     db6:	48 83 c4 20          	add    $0x20,%rsp
     dba:	5d                   	pop    %rbp
     dbb:	c3                   	retq   
     dbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000dc0 <testmaxfiles>:
{
     dc0:	55                   	push   %rbp
     dc1:	48 89 e5             	mov    %rsp,%rbp
}
     dc4:	5d                   	pop    %rbp
     dc5:	c3                   	retq   
     dc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     dcd:	00 00 00 

0000000000000dd0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     dd0:	55                   	push   %rbp
     dd1:	48 89 e5             	mov    %rsp,%rbp
     dd4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     ddb:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     ddf:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     de3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     de7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     deb:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     def:	89 7d fc             	mov    %edi,-0x4(%rbp)
     df2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     df6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     dfa:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     dfe:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     e02:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     e06:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     e0d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     e13:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     e1a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     e21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e25:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     e29:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     e2d:	0f 84 f0 03 00 00    	je     1223 <printf+0x453>
    c = fmt[i] & 0xff;
     e33:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e37:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     e3b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     e3f:	81 e2 ff 00 00 00    	and    $0xff,%edx
     e45:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     e48:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     e4c:	0f 85 32 00 00 00    	jne    e84 <printf+0xb4>
      if(c == '%'){
     e52:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     e56:	0f 85 13 00 00 00    	jne    e6f <printf+0x9f>
        state = '%';
     e5c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     e63:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     e6a:	e9 10 00 00 00       	jmpq   e7f <printf+0xaf>
        putc(fd, c);
     e6f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     e72:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     e75:	88 c1                	mov    %al,%cl
     e77:	0f be f1             	movsbl %cl,%esi
     e7a:	e8 b1 03 00 00       	callq  1230 <putc>
      }
    } else if(state == '%'){
     e7f:	e9 8c 03 00 00       	jmpq   1210 <printf+0x440>
     e84:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     e88:	0f 85 7d 03 00 00    	jne    120b <printf+0x43b>
      if(c == 'l') {
     e8e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     e92:	0f 85 0c 00 00 00    	jne    ea4 <printf+0xd4>
        lflag = 1;
     e98:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     e9f:	e9 71 03 00 00       	jmpq   1215 <printf+0x445>
      } else if(c == 'd'){
     ea4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     ea8:	0f 85 0e 01 00 00    	jne    fbc <printf+0x1ec>
        if (lflag == 1)
     eae:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     eb2:	0f 85 79 00 00 00    	jne    f31 <printf+0x161>
     eb8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     ebc:	8b 7d fc             	mov    -0x4(%rbp),%edi
     ebf:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     ec2:	83 f9 28             	cmp    $0x28,%ecx
     ec5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     ec9:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     ecc:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     ecf:	0f 87 1f 00 00 00    	ja     ef4 <printf+0x124>
     ed5:	8b 45 80             	mov    -0x80(%rbp),%eax
     ed8:	48 63 c8             	movslq %eax,%rcx
     edb:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     edf:	48 03 4a 10          	add    0x10(%rdx),%rcx
     ee3:	83 c0 08             	add    $0x8,%eax
     ee6:	89 02                	mov    %eax,(%rdx)
     ee8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     eef:	e9 1a 00 00 00       	jmpq   f0e <printf+0x13e>
     ef4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     ef8:	48 8b 48 08          	mov    0x8(%rax),%rcx
     efc:	48 89 ca             	mov    %rcx,%rdx
     eff:	48 83 c1 08          	add    $0x8,%rcx
     f03:	48 89 48 08          	mov    %rcx,0x8(%rax)
     f07:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     f0e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     f15:	ba 0a 00 00 00       	mov    $0xa,%edx
     f1a:	b9 01 00 00 00       	mov    $0x1,%ecx
     f1f:	48 8b 00             	mov    (%rax),%rax
     f22:	89 c6                	mov    %eax,%esi
     f24:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     f27:	e8 34 03 00 00       	callq  1260 <printint64>
     f2c:	e9 86 00 00 00       	jmpq   fb7 <printf+0x1e7>
     f31:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     f35:	8b 7d fc             	mov    -0x4(%rbp),%edi
     f38:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     f3b:	83 f9 28             	cmp    $0x28,%ecx
     f3e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     f45:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     f4b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     f51:	0f 87 25 00 00 00    	ja     f7c <printf+0x1ac>
     f57:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     f5d:	48 63 c8             	movslq %eax,%rcx
     f60:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     f67:	48 03 4a 10          	add    0x10(%rdx),%rcx
     f6b:	83 c0 08             	add    $0x8,%eax
     f6e:	89 02                	mov    %eax,(%rdx)
     f70:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     f77:	e9 1d 00 00 00       	jmpq   f99 <printf+0x1c9>
     f7c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     f83:	48 8b 48 08          	mov    0x8(%rax),%rcx
     f87:	48 89 ca             	mov    %rcx,%rdx
     f8a:	48 83 c1 08          	add    $0x8,%rcx
     f8e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     f92:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     f99:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     fa0:	ba 0a 00 00 00       	mov    $0xa,%edx
     fa5:	b9 01 00 00 00       	mov    $0x1,%ecx
     faa:	8b 30                	mov    (%rax),%esi
     fac:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     fb2:	e8 a9 03 00 00       	callq  1360 <printint>
      } else if(c == 'x' || c == 'p'){
     fb7:	e9 43 02 00 00       	jmpq   11ff <printf+0x42f>
     fbc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     fc0:	0f 84 0a 00 00 00    	je     fd0 <printf+0x200>
     fc6:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     fca:	0f 85 1d 01 00 00    	jne    10ed <printf+0x31d>
        if (lflag == 1)
     fd0:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     fd4:	0f 85 8b 00 00 00    	jne    1065 <printf+0x295>
     fda:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     fde:	8b 7d fc             	mov    -0x4(%rbp),%edi
     fe1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     fe4:	83 f9 28             	cmp    $0x28,%ecx
     fe7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     fee:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     ff4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     ffa:	0f 87 25 00 00 00    	ja     1025 <printf+0x255>
    1000:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    1006:	48 63 c8             	movslq %eax,%rcx
    1009:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
    1010:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1014:	83 c0 08             	add    $0x8,%eax
    1017:	89 02                	mov    %eax,(%rdx)
    1019:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
    1020:	e9 1d 00 00 00       	jmpq   1042 <printf+0x272>
    1025:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    102c:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1030:	48 89 ca             	mov    %rcx,%rdx
    1033:	48 83 c1 08          	add    $0x8,%rcx
    1037:	48 89 48 08          	mov    %rcx,0x8(%rax)
    103b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
    1042:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
    1049:	ba 10 00 00 00       	mov    $0x10,%edx
    104e:	31 c9                	xor    %ecx,%ecx
    1050:	48 8b 00             	mov    (%rax),%rax
    1053:	89 c6                	mov    %eax,%esi
    1055:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
    105b:	e8 00 02 00 00       	callq  1260 <printint64>
    1060:	e9 83 00 00 00       	jmpq   10e8 <printf+0x318>
    1065:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
    1069:	8b 7d fc             	mov    -0x4(%rbp),%edi
    106c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    106f:	83 f9 28             	cmp    $0x28,%ecx
    1072:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
    1079:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
    107f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
    1085:	0f 87 25 00 00 00    	ja     10b0 <printf+0x2e0>
    108b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
    1091:	48 63 c8             	movslq %eax,%rcx
    1094:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
    109b:	48 03 4a 10          	add    0x10(%rdx),%rcx
    109f:	83 c0 08             	add    $0x8,%eax
    10a2:	89 02                	mov    %eax,(%rdx)
    10a4:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
    10ab:	e9 1d 00 00 00       	jmpq   10cd <printf+0x2fd>
    10b0:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
    10b7:	48 8b 48 08          	mov    0x8(%rax),%rcx
    10bb:	48 89 ca             	mov    %rcx,%rdx
    10be:	48 83 c1 08          	add    $0x8,%rcx
    10c2:	48 89 48 08          	mov    %rcx,0x8(%rax)
    10c6:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
    10cd:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
    10d4:	ba 10 00 00 00       	mov    $0x10,%edx
    10d9:	31 c9                	xor    %ecx,%ecx
    10db:	8b 30                	mov    (%rax),%esi
    10dd:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
    10e3:	e8 78 02 00 00       	callq  1360 <printint>
      } else if(c == 's'){
    10e8:	e9 0d 01 00 00       	jmpq   11fa <printf+0x42a>
    10ed:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
    10f1:	0f 85 bc 00 00 00    	jne    11b3 <printf+0x3e3>
    10f7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
    10fb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    10fe:	83 f9 28             	cmp    $0x28,%ecx
    1101:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
    1108:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
    110e:	0f 87 25 00 00 00    	ja     1139 <printf+0x369>
    1114:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
    111a:	48 63 c8             	movslq %eax,%rcx
    111d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
    1124:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1128:	83 c0 08             	add    $0x8,%eax
    112b:	89 02                	mov    %eax,(%rdx)
    112d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
    1134:	e9 1d 00 00 00       	jmpq   1156 <printf+0x386>
    1139:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    1140:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1144:	48 89 ca             	mov    %rcx,%rdx
    1147:	48 83 c1 08          	add    $0x8,%rcx
    114b:	48 89 48 08          	mov    %rcx,0x8(%rax)
    114f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
    1156:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    115d:	48 8b 00             	mov    (%rax),%rax
    1160:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1164:	48 83 f8 00          	cmp    $0x0,%rax
    1168:	0f 85 0e 00 00 00    	jne    117c <printf+0x3ac>
    116e:	48 b8 be 21 00 00 00 	movabs $0x21be,%rax
    1175:	00 00 00 
          s = "(null)";
    1178:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
    117c:	e9 00 00 00 00       	jmpq   1181 <printf+0x3b1>
    1181:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1185:	80 38 00             	cmpb   $0x0,(%rax)
    1188:	0f 84 20 00 00 00    	je     11ae <printf+0x3de>
          putc(fd, *s);
    118e:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1191:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1195:	0f be 30             	movsbl (%rax),%esi
    1198:	e8 93 00 00 00       	callq  1230 <putc>
        for(; *s; s++)
    119d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11a1:	48 83 c0 01          	add    $0x1,%rax
    11a5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    11a9:	e9 d3 ff ff ff       	jmpq   1181 <printf+0x3b1>
      } else if(c == '%'){
    11ae:	e9 42 00 00 00       	jmpq   11f5 <printf+0x425>
    11b3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    11b7:	0f 85 15 00 00 00    	jne    11d2 <printf+0x402>
        putc(fd, c);
    11bd:	8b 7d fc             	mov    -0x4(%rbp),%edi
    11c0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    11c3:	88 c1                	mov    %al,%cl
    11c5:	0f be f1             	movsbl %cl,%esi
    11c8:	e8 63 00 00 00       	callq  1230 <putc>
      } else {
    11cd:	e9 1e 00 00 00       	jmpq   11f0 <printf+0x420>
    11d2:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    11d7:	8b 7d fc             	mov    -0x4(%rbp),%edi
    11da:	e8 51 00 00 00       	callq  1230 <putc>
        putc(fd, c);
    11df:	8b 7d fc             	mov    -0x4(%rbp),%edi
    11e2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    11e5:	40 88 f0             	mov    %sil,%al
    11e8:	0f be f0             	movsbl %al,%esi
    11eb:	e8 40 00 00 00       	callq  1230 <putc>
    11f0:	e9 00 00 00 00       	jmpq   11f5 <printf+0x425>
    11f5:	e9 00 00 00 00       	jmpq   11fa <printf+0x42a>
    11fa:	e9 00 00 00 00       	jmpq   11ff <printf+0x42f>
    11ff:	e9 00 00 00 00       	jmpq   1204 <printf+0x434>
      }
      state = 0;
    1204:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    120b:	e9 00 00 00 00       	jmpq   1210 <printf+0x440>
    }
  }
    1210:	e9 00 00 00 00       	jmpq   1215 <printf+0x445>
  for(i = 0; fmt[i]; i++){
    1215:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1218:	83 c0 01             	add    $0x1,%eax
    121b:	89 45 e0             	mov    %eax,-0x20(%rbp)
    121e:	e9 fe fb ff ff       	jmpq   e21 <printf+0x51>

  va_end(valist);
}
    1223:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
    122a:	5d                   	pop    %rbp
    122b:	c3                   	retq   
    122c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001230 <putc>:
{
    1230:	55                   	push   %rbp
    1231:	48 89 e5             	mov    %rsp,%rbp
    1234:	48 83 ec 10          	sub    $0x10,%rsp
    1238:	40 88 f0             	mov    %sil,%al
    123b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
    123f:	ba 01 00 00 00       	mov    $0x1,%edx
    1244:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1247:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
    124a:	8b 7d fc             	mov    -0x4(%rbp),%edi
    124d:	e8 d6 05 00 00       	callq  1828 <write>
}
    1252:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1255:	48 83 c4 10          	add    $0x10,%rsp
    1259:	5d                   	pop    %rbp
    125a:	c3                   	retq   
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <printint64>:
{
    1260:	55                   	push   %rbp
    1261:	48 89 e5             	mov    %rsp,%rbp
    1264:	48 83 ec 50          	sub    $0x50,%rsp
    1268:	89 7d fc             	mov    %edi,-0x4(%rbp)
    126b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    126e:	89 55 f4             	mov    %edx,-0xc(%rbp)
    1271:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
    1274:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1278:	0f 84 30 00 00 00    	je     12ae <printint64+0x4e>
    127e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1282:	0f 9c c0             	setl   %al
    1285:	88 c1                	mov    %al,%cl
    1287:	80 e1 01             	and    $0x1,%cl
    128a:	0f b6 d1             	movzbl %cl,%edx
    128d:	89 55 f0             	mov    %edx,-0x10(%rbp)
    1290:	a8 01                	test   $0x1,%al
    1292:	0f 85 05 00 00 00    	jne    129d <printint64+0x3d>
    1298:	e9 11 00 00 00       	jmpq   12ae <printint64+0x4e>
    129d:	31 c0                	xor    %eax,%eax
    x = -xx;
    129f:	2b 45 f8             	sub    -0x8(%rbp),%eax
    12a2:	48 63 c8             	movslq %eax,%rcx
    12a5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    12a9:	e9 08 00 00 00       	jmpq   12b6 <printint64+0x56>
    x = xx;
    12ae:	48 63 45 f8          	movslq -0x8(%rbp),%rax
    12b2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
    12b6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
    12bd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    12c1:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    12c5:	31 d2                	xor    %edx,%edx
    12c7:	48 f7 f1             	div    %rcx
    12ca:	40 8a 34 15 60 24 00 	mov    0x2460(,%rdx,1),%sil
    12d1:	00 
    12d2:	8b 7d cc             	mov    -0x34(%rbp),%edi
    12d5:	41 89 f8             	mov    %edi,%r8d
    12d8:	41 83 c0 01          	add    $0x1,%r8d
    12dc:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
    12e0:	48 63 cf             	movslq %edi,%rcx
    12e3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
    12e8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
    12ec:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    12f0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    12f4:	48 89 c8             	mov    %rcx,%rax
    12f7:	31 d2                	xor    %edx,%edx
    12f9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    12fd:	48 f7 f1             	div    %rcx
    1300:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1304:	48 83 f8 00          	cmp    $0x0,%rax
    1308:	0f 85 af ff ff ff    	jne    12bd <printint64+0x5d>
  if(sgn)
    130e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1312:	0f 84 13 00 00 00    	je     132b <printint64+0xcb>
    buf[i++] = '-';
    1318:	8b 45 cc             	mov    -0x34(%rbp),%eax
    131b:	89 c1                	mov    %eax,%ecx
    131d:	83 c1 01             	add    $0x1,%ecx
    1320:	89 4d cc             	mov    %ecx,-0x34(%rbp)
    1323:	48 63 d0             	movslq %eax,%rdx
    1326:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
    132b:	e9 00 00 00 00       	jmpq   1330 <printint64+0xd0>
    1330:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1333:	83 c0 ff             	add    $0xffffffff,%eax
    1336:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1339:	83 f8 00             	cmp    $0x0,%eax
    133c:	0f 8c 16 00 00 00    	jl     1358 <printint64+0xf8>
    putc(fd, buf[i]);
    1342:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1345:	48 63 45 cc          	movslq -0x34(%rbp),%rax
    1349:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
    134e:	e8 dd fe ff ff       	callq  1230 <putc>
  while(--i >= 0)
    1353:	e9 d8 ff ff ff       	jmpq   1330 <printint64+0xd0>
}
    1358:	48 83 c4 50          	add    $0x50,%rsp
    135c:	5d                   	pop    %rbp
    135d:	c3                   	retq   
    135e:	66 90                	xchg   %ax,%ax

0000000000001360 <printint>:
{
    1360:	55                   	push   %rbp
    1361:	48 89 e5             	mov    %rsp,%rbp
    1364:	48 83 ec 30          	sub    $0x30,%rsp
    1368:	89 7d fc             	mov    %edi,-0x4(%rbp)
    136b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    136e:	89 55 f4             	mov    %edx,-0xc(%rbp)
    1371:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
    1374:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
    137b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    137f:	0f 84 1e 00 00 00    	je     13a3 <printint+0x43>
    1385:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1389:	0f 8d 14 00 00 00    	jge    13a3 <printint+0x43>
    138f:	31 c0                	xor    %eax,%eax
    neg = 1;
    1391:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
    1398:	2b 45 f8             	sub    -0x8(%rbp),%eax
    139b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
    139e:	e9 06 00 00 00       	jmpq   13a9 <printint+0x49>
    x = xx;
    13a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13a6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
    13a9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
    13b0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    13b3:	31 d2                	xor    %edx,%edx
    13b5:	f7 75 f4             	divl   -0xc(%rbp)
    13b8:	89 d2                	mov    %edx,%edx
    13ba:	89 d1                	mov    %edx,%ecx
    13bc:	40 8a 34 0d 80 24 00 	mov    0x2480(,%rcx,1),%sil
    13c3:	00 
    13c4:	8b 55 dc             	mov    -0x24(%rbp),%edx
    13c7:	89 d7                	mov    %edx,%edi
    13c9:	83 c7 01             	add    $0x1,%edi
    13cc:	89 7d dc             	mov    %edi,-0x24(%rbp)
    13cf:	48 63 ca             	movslq %edx,%rcx
    13d2:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
    13d7:	8b 45 f4             	mov    -0xc(%rbp),%eax
    13da:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
    13dd:	89 45 d0             	mov    %eax,-0x30(%rbp)
    13e0:	89 c8                	mov    %ecx,%eax
    13e2:	31 d2                	xor    %edx,%edx
    13e4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
    13e7:	f7 f1                	div    %ecx
    13e9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    13ec:	83 f8 00             	cmp    $0x0,%eax
    13ef:	0f 85 bb ff ff ff    	jne    13b0 <printint+0x50>
  if(neg)
    13f5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    13f9:	0f 84 13 00 00 00    	je     1412 <printint+0xb2>
    buf[i++] = '-';
    13ff:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1402:	89 c1                	mov    %eax,%ecx
    1404:	83 c1 01             	add    $0x1,%ecx
    1407:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    140a:	48 63 d0             	movslq %eax,%rdx
    140d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
    1412:	e9 00 00 00 00       	jmpq   1417 <printint+0xb7>
    1417:	8b 45 dc             	mov    -0x24(%rbp),%eax
    141a:	83 c0 ff             	add    $0xffffffff,%eax
    141d:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1420:	83 f8 00             	cmp    $0x0,%eax
    1423:	0f 8c 16 00 00 00    	jl     143f <printint+0xdf>
    putc(fd, buf[i]);
    1429:	8b 7d fc             	mov    -0x4(%rbp),%edi
    142c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
    1430:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
    1435:	e8 f6 fd ff ff       	callq  1230 <putc>
  while(--i >= 0)
    143a:	e9 d8 ff ff ff       	jmpq   1417 <printint+0xb7>
}
    143f:	48 83 c4 30          	add    $0x30,%rsp
    1443:	5d                   	pop    %rbp
    1444:	c3                   	retq   
    1445:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    144c:	00 00 00 
    144f:	90                   	nop

0000000000001450 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
    1450:	55                   	push   %rbp
    1451:	48 89 e5             	mov    %rsp,%rbp
    1454:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1458:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
    145c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1460:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
    1464:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1468:	48 89 c1             	mov    %rax,%rcx
    146b:	48 83 c1 01          	add    $0x1,%rcx
    146f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    1473:	8a 10                	mov    (%rax),%dl
    1475:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1479:	48 89 c1             	mov    %rax,%rcx
    147c:	48 83 c1 01          	add    $0x1,%rcx
    1480:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    1484:	88 10                	mov    %dl,(%rax)
    1486:	0f be f2             	movsbl %dl,%esi
    1489:	83 fe 00             	cmp    $0x0,%esi
    148c:	0f 84 05 00 00 00    	je     1497 <strcpy+0x47>
    1492:	e9 cd ff ff ff       	jmpq   1464 <strcpy+0x14>
    ;
  return os;
    1497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    149b:	5d                   	pop    %rbp
    149c:	c3                   	retq   
    149d:	0f 1f 00             	nopl   (%rax)

00000000000014a0 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
    14a0:	55                   	push   %rbp
    14a1:	48 89 e5             	mov    %rsp,%rbp
    14a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    14ac:	31 c0                	xor    %eax,%eax
    14ae:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
    14b0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    14b4:	0f be 02             	movsbl (%rdx),%eax
    14b7:	83 f8 00             	cmp    $0x0,%eax
    14ba:	88 4d ef             	mov    %cl,-0x11(%rbp)
    14bd:	0f 84 18 00 00 00    	je     14db <strcmp+0x3b>
    14c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14c7:	0f be 08             	movsbl (%rax),%ecx
    14ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14ce:	0f be 10             	movsbl (%rax),%edx
    14d1:	39 d1                	cmp    %edx,%ecx
    14d3:	40 0f 94 c6          	sete   %sil
    14d7:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
    14db:	8a 45 ef             	mov    -0x11(%rbp),%al
    14de:	a8 01                	test   $0x1,%al
    14e0:	0f 85 05 00 00 00    	jne    14eb <strcmp+0x4b>
    14e6:	e9 1d 00 00 00       	jmpq   1508 <strcmp+0x68>
    p++, q++;
    14eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14ef:	48 83 c0 01          	add    $0x1,%rax
    14f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    14f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14fb:	48 83 c0 01          	add    $0x1,%rax
    14ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
    1503:	e9 a4 ff ff ff       	jmpq   14ac <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    1508:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    150c:	0f b6 08             	movzbl (%rax),%ecx
    150f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1513:	0f b6 10             	movzbl (%rax),%edx
    1516:	29 d1                	sub    %edx,%ecx
    1518:	89 c8                	mov    %ecx,%eax
    151a:	5d                   	pop    %rbp
    151b:	c3                   	retq   
    151c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001520 <strlen>:
}

uint
strlen(char *s)
{
    1520:	55                   	push   %rbp
    1521:	48 89 e5             	mov    %rsp,%rbp
    1524:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
    1528:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    152f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1533:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1537:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    153b:	0f 84 13 00 00 00    	je     1554 <strlen+0x34>
    1541:	e9 00 00 00 00       	jmpq   1546 <strlen+0x26>
    1546:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1549:	83 c0 01             	add    $0x1,%eax
    154c:	89 45 f4             	mov    %eax,-0xc(%rbp)
    154f:	e9 db ff ff ff       	jmpq   152f <strlen+0xf>
    ;
  return n;
    1554:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1557:	5d                   	pop    %rbp
    1558:	c3                   	retq   
    1559:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001560 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
    1560:	55                   	push   %rbp
    1561:	48 89 e5             	mov    %rsp,%rbp
    1564:	48 83 ec 10          	sub    $0x10,%rsp
    1568:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    156c:	89 75 f4             	mov    %esi,-0xc(%rbp)
    156f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
    1572:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1576:	8b 75 f4             	mov    -0xc(%rbp),%esi
    1579:	8b 55 f0             	mov    -0x10(%rbp),%edx
    157c:	e8 0f 00 00 00       	callq  1590 <stosb>
  return dst;
    1581:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1585:	48 83 c4 10          	add    $0x10,%rsp
    1589:	5d                   	pop    %rbp
    158a:	c3                   	retq   
    158b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001590 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1590:	55                   	push   %rbp
    1591:	48 89 e5             	mov    %rsp,%rbp
    1594:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1598:	89 75 f4             	mov    %esi,-0xc(%rbp)
    159b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
    159e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    15a2:	8b 55 f0             	mov    -0x10(%rbp),%edx
    15a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
    15a8:	89 d1                	mov    %edx,%ecx
    15aa:	fc                   	cld    
    15ab:	f3 aa                	rep stos %al,%es:(%rdi)
    15ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    15b1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
    15b4:	5d                   	pop    %rbp
    15b5:	c3                   	retq   
    15b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    15bd:	00 00 00 

00000000000015c0 <strchr>:
}

char*
strchr(const char *s, char c)
{
    15c0:	55                   	push   %rbp
    15c1:	48 89 e5             	mov    %rsp,%rbp
    15c4:	40 88 f0             	mov    %sil,%al
    15c7:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    15cb:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
    15ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15d2:	80 38 00             	cmpb   $0x0,(%rax)
    15d5:	0f 84 36 00 00 00    	je     1611 <strchr+0x51>
    if(*s == c)
    15db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15df:	0f be 08             	movsbl (%rax),%ecx
    15e2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
    15e6:	39 d1                	cmp    %edx,%ecx
    15e8:	0f 85 0d 00 00 00    	jne    15fb <strchr+0x3b>
      return (char*)s;
    15ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    15f6:	e9 1e 00 00 00       	jmpq   1619 <strchr+0x59>
    if(*s == c)
    15fb:	e9 00 00 00 00       	jmpq   1600 <strchr+0x40>
  for(; *s; s++)
    1600:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1604:	48 83 c0 01          	add    $0x1,%rax
    1608:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    160c:	e9 bd ff ff ff       	jmpq   15ce <strchr+0xe>
  return 0;
    1611:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1618:	00 
}
    1619:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    161d:	5d                   	pop    %rbp
    161e:	c3                   	retq   
    161f:	90                   	nop

0000000000001620 <gets>:

char*
gets(char *buf, int max)
{
    1620:	55                   	push   %rbp
    1621:	48 89 e5             	mov    %rsp,%rbp
    1624:	48 83 ec 20          	sub    $0x20,%rsp
    1628:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    162c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    162f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1636:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1639:	83 c0 01             	add    $0x1,%eax
    163c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    163f:	0f 8d 5e 00 00 00    	jge    16a3 <gets+0x83>
    1645:	31 ff                	xor    %edi,%edi
    1647:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
    164b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
    1650:	e8 cb 01 00 00       	callq  1820 <read>
    1655:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
    1658:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    165c:	0f 8d 05 00 00 00    	jge    1667 <gets+0x47>
      break;
    1662:	e9 3c 00 00 00       	jmpq   16a3 <gets+0x83>
    buf[i++] = c;
    1667:	8a 45 eb             	mov    -0x15(%rbp),%al
    166a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    166e:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1671:	89 d6                	mov    %edx,%esi
    1673:	83 c6 01             	add    $0x1,%esi
    1676:	89 75 f0             	mov    %esi,-0x10(%rbp)
    1679:	48 63 fa             	movslq %edx,%rdi
    167c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
    167f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
    1683:	83 fa 0a             	cmp    $0xa,%edx
    1686:	0f 84 0d 00 00 00    	je     1699 <gets+0x79>
    168c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
    1690:	83 f8 0d             	cmp    $0xd,%eax
    1693:	0f 85 05 00 00 00    	jne    169e <gets+0x7e>
      break;
    1699:	e9 05 00 00 00       	jmpq   16a3 <gets+0x83>
  for(i=0; i+1 < max; ){
    169e:	e9 93 ff ff ff       	jmpq   1636 <gets+0x16>
  }
  buf[i] = '\0';
    16a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16a7:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
    16ab:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
    16af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16b3:	48 83 c4 20          	add    $0x20,%rsp
    16b7:	5d                   	pop    %rbp
    16b8:	c3                   	retq   
    16b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000016c0 <stat>:
}

int
stat(char *n, struct stat *st)
{
    16c0:	55                   	push   %rbp
    16c1:	48 89 e5             	mov    %rsp,%rbp
    16c4:	48 83 ec 30          	sub    $0x30,%rsp
    16c8:	31 c0                	xor    %eax,%eax
    16ca:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    16ce:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    16d2:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    16d6:	89 c6                	mov    %eax,%esi
    16d8:	e8 6b 01 00 00       	callq  1848 <open>
    16dd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
    16e0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    16e4:	0f 8d 0c 00 00 00    	jge    16f6 <stat+0x36>
    return -1;
    16ea:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    16f1:	e9 20 00 00 00       	jmpq   1716 <stat+0x56>
  r = fstat(fd, st);
    16f6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    16f9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    16fd:	e8 5e 01 00 00       	callq  1860 <fstat>
    1702:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
    1705:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    1708:	e8 23 01 00 00       	callq  1830 <close>
  return r;
    170d:	8b 7d e0             	mov    -0x20(%rbp),%edi
    1710:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1713:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
    1716:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1719:	48 83 c4 30          	add    $0x30,%rsp
    171d:	5d                   	pop    %rbp
    171e:	c3                   	retq   
    171f:	90                   	nop

0000000000001720 <atoi>:

int
atoi(const char *s)
{
    1720:	55                   	push   %rbp
    1721:	48 89 e5             	mov    %rsp,%rbp
    1724:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
    1728:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    172f:	31 c0                	xor    %eax,%eax
    1731:	88 c1                	mov    %al,%cl
    1733:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
    1738:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    173c:	0f be 32             	movsbl (%rdx),%esi
    173f:	39 f0                	cmp    %esi,%eax
    1741:	88 4d f3             	mov    %cl,-0xd(%rbp)
    1744:	0f 8f 10 00 00 00    	jg     175a <atoi+0x3a>
    174a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    174e:	0f be 08             	movsbl (%rax),%ecx
    1751:	83 f9 39             	cmp    $0x39,%ecx
    1754:	0f 9e c2             	setle  %dl
    1757:	88 55 f3             	mov    %dl,-0xd(%rbp)
    175a:	8a 45 f3             	mov    -0xd(%rbp),%al
    175d:	a8 01                	test   $0x1,%al
    175f:	0f 85 05 00 00 00    	jne    176a <atoi+0x4a>
    1765:	e9 23 00 00 00       	jmpq   178d <atoi+0x6d>
    n = n*10 + *s++ - '0';
    176a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
    176e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1772:	48 89 ca             	mov    %rcx,%rdx
    1775:	48 83 c2 01          	add    $0x1,%rdx
    1779:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    177d:	0f be 31             	movsbl (%rcx),%esi
    1780:	01 f0                	add    %esi,%eax
    1782:	83 e8 30             	sub    $0x30,%eax
    1785:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
    1788:	e9 a2 ff ff ff       	jmpq   172f <atoi+0xf>
  return n;
    178d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1790:	5d                   	pop    %rbp
    1791:	c3                   	retq   
    1792:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1799:	1f 84 00 00 00 00 00 

00000000000017a0 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    17a0:	55                   	push   %rbp
    17a1:	48 89 e5             	mov    %rsp,%rbp
    17a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    17ac:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
    17af:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    17b3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
    17b7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    17bb:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
    17bf:	8b 45 ec             	mov    -0x14(%rbp),%eax
    17c2:	89 c1                	mov    %eax,%ecx
    17c4:	83 c1 ff             	add    $0xffffffff,%ecx
    17c7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    17ca:	83 f8 00             	cmp    $0x0,%eax
    17cd:	0f 8e 27 00 00 00    	jle    17fa <memmove+0x5a>
    *dst++ = *src++;
    17d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    17d7:	48 89 c1             	mov    %rax,%rcx
    17da:	48 83 c1 01          	add    $0x1,%rcx
    17de:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    17e2:	8a 10                	mov    (%rax),%dl
    17e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    17e8:	48 89 c1             	mov    %rax,%rcx
    17eb:	48 83 c1 01          	add    $0x1,%rcx
    17ef:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    17f3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
    17f5:	e9 c5 ff ff ff       	jmpq   17bf <memmove+0x1f>
  return vdst;
    17fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17fe:	5d                   	pop    %rbp
    17ff:	c3                   	retq   

0000000000001800 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    1800:	b8 01 00 00 00       	mov    $0x1,%eax
    1805:	cd 40                	int    $0x40
    1807:	c3                   	retq   

0000000000001808 <exit>:
SYSCALL(exit)
    1808:	b8 02 00 00 00       	mov    $0x2,%eax
    180d:	cd 40                	int    $0x40
    180f:	c3                   	retq   

0000000000001810 <wait>:
SYSCALL(wait)
    1810:	b8 03 00 00 00       	mov    $0x3,%eax
    1815:	cd 40                	int    $0x40
    1817:	c3                   	retq   

0000000000001818 <pipe>:
SYSCALL(pipe)
    1818:	b8 04 00 00 00       	mov    $0x4,%eax
    181d:	cd 40                	int    $0x40
    181f:	c3                   	retq   

0000000000001820 <read>:
SYSCALL(read)
    1820:	b8 05 00 00 00       	mov    $0x5,%eax
    1825:	cd 40                	int    $0x40
    1827:	c3                   	retq   

0000000000001828 <write>:
SYSCALL(write)
    1828:	b8 10 00 00 00       	mov    $0x10,%eax
    182d:	cd 40                	int    $0x40
    182f:	c3                   	retq   

0000000000001830 <close>:
SYSCALL(close)
    1830:	b8 15 00 00 00       	mov    $0x15,%eax
    1835:	cd 40                	int    $0x40
    1837:	c3                   	retq   

0000000000001838 <kill>:
SYSCALL(kill)
    1838:	b8 06 00 00 00       	mov    $0x6,%eax
    183d:	cd 40                	int    $0x40
    183f:	c3                   	retq   

0000000000001840 <exec>:
SYSCALL(exec)
    1840:	b8 07 00 00 00       	mov    $0x7,%eax
    1845:	cd 40                	int    $0x40
    1847:	c3                   	retq   

0000000000001848 <open>:
SYSCALL(open)
    1848:	b8 0f 00 00 00       	mov    $0xf,%eax
    184d:	cd 40                	int    $0x40
    184f:	c3                   	retq   

0000000000001850 <mknod>:
SYSCALL(mknod)
    1850:	b8 11 00 00 00       	mov    $0x11,%eax
    1855:	cd 40                	int    $0x40
    1857:	c3                   	retq   

0000000000001858 <unlink>:
SYSCALL(unlink)
    1858:	b8 12 00 00 00       	mov    $0x12,%eax
    185d:	cd 40                	int    $0x40
    185f:	c3                   	retq   

0000000000001860 <fstat>:
SYSCALL(fstat)
    1860:	b8 08 00 00 00       	mov    $0x8,%eax
    1865:	cd 40                	int    $0x40
    1867:	c3                   	retq   

0000000000001868 <link>:
SYSCALL(link)
    1868:	b8 13 00 00 00       	mov    $0x13,%eax
    186d:	cd 40                	int    $0x40
    186f:	c3                   	retq   

0000000000001870 <mkdir>:
SYSCALL(mkdir)
    1870:	b8 14 00 00 00       	mov    $0x14,%eax
    1875:	cd 40                	int    $0x40
    1877:	c3                   	retq   

0000000000001878 <chdir>:
SYSCALL(chdir)
    1878:	b8 09 00 00 00       	mov    $0x9,%eax
    187d:	cd 40                	int    $0x40
    187f:	c3                   	retq   

0000000000001880 <dup>:
SYSCALL(dup)
    1880:	b8 0a 00 00 00       	mov    $0xa,%eax
    1885:	cd 40                	int    $0x40
    1887:	c3                   	retq   

0000000000001888 <getpid>:
SYSCALL(getpid)
    1888:	b8 0b 00 00 00       	mov    $0xb,%eax
    188d:	cd 40                	int    $0x40
    188f:	c3                   	retq   

0000000000001890 <sbrk>:
SYSCALL(sbrk)
    1890:	b8 0c 00 00 00       	mov    $0xc,%eax
    1895:	cd 40                	int    $0x40
    1897:	c3                   	retq   

0000000000001898 <sleep>:
SYSCALL(sleep)
    1898:	b8 0d 00 00 00       	mov    $0xd,%eax
    189d:	cd 40                	int    $0x40
    189f:	c3                   	retq   

00000000000018a0 <uptime>:
SYSCALL(uptime)
    18a0:	b8 0e 00 00 00       	mov    $0xe,%eax
    18a5:	cd 40                	int    $0x40
    18a7:	c3                   	retq   

00000000000018a8 <sysinfo>:
SYSCALL(sysinfo)
    18a8:	b8 16 00 00 00       	mov    $0x16,%eax
    18ad:	cd 40                	int    $0x40
    18af:	c3                   	retq   

00000000000018b0 <mmap>:
SYSCALL(mmap)
    18b0:	b8 17 00 00 00       	mov    $0x17,%eax
    18b5:	cd 40                	int    $0x40
    18b7:	c3                   	retq   

00000000000018b8 <munmap>:
SYSCALL(munmap)
    18b8:	b8 18 00 00 00       	mov    $0x18,%eax
    18bd:	cd 40                	int    $0x40
    18bf:	c3                   	retq   

00000000000018c0 <crashn>:
SYSCALL(crashn)
    18c0:	b8 19 00 00 00       	mov    $0x19,%eax
    18c5:	cd 40                	int    $0x40
    18c7:	c3                   	retq   
    18c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    18cf:	00 

00000000000018d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18d0:	55                   	push   %rbp
    18d1:	48 89 e5             	mov    %rsp,%rbp
    18d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    18d8:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    18dc:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    18e0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18e4:	48 8b 3c 25 98 24 00 	mov    0x2498,%rdi
    18eb:	00 
    18ec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    18f0:	31 c0                	xor    %eax,%eax
    18f2:	88 c1                	mov    %al,%cl
    18f4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    18f8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    18fc:	88 4d e7             	mov    %cl,-0x19(%rbp)
    18ff:	0f 86 11 00 00 00    	jbe    1916 <free+0x46>
    1905:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1909:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    190d:	48 3b 01             	cmp    (%rcx),%rax
    1910:	0f 92 c2             	setb   %dl
    1913:	88 55 e7             	mov    %dl,-0x19(%rbp)
    1916:	8a 45 e7             	mov    -0x19(%rbp),%al
    1919:	34 ff                	xor    $0xff,%al
    191b:	a8 01                	test   $0x1,%al
    191d:	0f 85 05 00 00 00    	jne    1928 <free+0x58>
    1923:	e9 4a 00 00 00       	jmpq   1972 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1928:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    192c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1930:	48 3b 01             	cmp    (%rcx),%rax
    1933:	0f 82 24 00 00 00    	jb     195d <free+0x8d>
    1939:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    193d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1941:	0f 87 11 00 00 00    	ja     1958 <free+0x88>
    1947:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    194b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    194f:	48 3b 01             	cmp    (%rcx),%rax
    1952:	0f 83 05 00 00 00    	jae    195d <free+0x8d>
      break;
    1958:	e9 15 00 00 00       	jmpq   1972 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    195d:	e9 00 00 00 00       	jmpq   1962 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1962:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1966:	48 8b 00             	mov    (%rax),%rax
    1969:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    196d:	e9 7e ff ff ff       	jmpq   18f0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1972:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1976:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    197a:	8b 51 08             	mov    0x8(%rcx),%edx
    197d:	89 d1                	mov    %edx,%ecx
    197f:	48 c1 e1 04          	shl    $0x4,%rcx
    1983:	48 01 c8             	add    %rcx,%rax
    1986:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    198a:	48 3b 01             	cmp    (%rcx),%rax
    198d:	0f 85 2a 00 00 00    	jne    19bd <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1997:	48 8b 00             	mov    (%rax),%rax
    199a:	8b 48 08             	mov    0x8(%rax),%ecx
    199d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    19a1:	03 48 08             	add    0x8(%rax),%ecx
    19a4:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    19a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19ab:	48 8b 00             	mov    (%rax),%rax
    19ae:	48 8b 00             	mov    (%rax),%rax
    19b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    19b5:	48 89 02             	mov    %rax,(%rdx)
  } else
    19b8:	e9 0e 00 00 00       	jmpq   19cb <free+0xfb>
    bp->s.ptr = p->s.ptr;
    19bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19c1:	48 8b 00             	mov    (%rax),%rax
    19c4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    19c8:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    19cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19cf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    19d3:	8b 51 08             	mov    0x8(%rcx),%edx
    19d6:	89 d1                	mov    %edx,%ecx
    19d8:	48 c1 e1 04          	shl    $0x4,%rcx
    19dc:	48 01 c8             	add    %rcx,%rax
    19df:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    19e3:	0f 85 24 00 00 00    	jne    1a0d <free+0x13d>
    p->s.size += bp->s.size;
    19e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    19ed:	8b 48 08             	mov    0x8(%rax),%ecx
    19f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    19f4:	03 48 08             	add    0x8(%rax),%ecx
    19f7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    19fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    19fe:	48 8b 00             	mov    (%rax),%rax
    1a01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1a05:	48 89 02             	mov    %rax,(%rdx)
  } else
    1a08:	e9 0b 00 00 00       	jmpq   1a18 <free+0x148>
    p->s.ptr = bp;
    1a0d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1a11:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1a15:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    1a18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a1c:	48 89 04 25 98 24 00 	mov    %rax,0x2498
    1a23:	00 
}
    1a24:	5d                   	pop    %rbp
    1a25:	c3                   	retq   
    1a26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1a2d:	00 00 00 

0000000000001a30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1a30:	55                   	push   %rbp
    1a31:	48 89 e5             	mov    %rsp,%rbp
    1a34:	48 83 ec 30          	sub    $0x30,%rsp
    1a38:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a3b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    1a3e:	89 f8                	mov    %edi,%eax
    1a40:	48 83 c0 10          	add    $0x10,%rax
    1a44:	48 83 e8 01          	sub    $0x1,%rax
    1a48:	48 c1 e8 04          	shr    $0x4,%rax
    1a4c:	48 83 c0 01          	add    $0x1,%rax
    1a50:	89 c7                	mov    %eax,%edi
    1a52:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1a55:	48 8b 04 25 98 24 00 	mov    0x2498,%rax
    1a5c:	00 
    1a5d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1a61:	48 83 f8 00          	cmp    $0x0,%rax
    1a65:	0f 85 29 00 00 00    	jne    1a94 <malloc+0x64>
    1a6b:	48 b8 a0 24 00 00 00 	movabs $0x24a0,%rax
    1a72:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1a75:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1a79:	48 89 04 25 98 24 00 	mov    %rax,0x2498
    1a80:	00 
    1a81:	48 89 04 25 a0 24 00 	mov    %rax,0x24a0
    1a88:	00 
    base.s.size = 0;
    1a89:	c7 04 25 a8 24 00 00 	movl   $0x0,0x24a8
    1a90:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1a98:	48 8b 00             	mov    (%rax),%rax
    1a9b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    1a9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1aa3:	8b 48 08             	mov    0x8(%rax),%ecx
    1aa6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1aa9:	0f 82 73 00 00 00    	jb     1b22 <malloc+0xf2>
      if(p->s.size == nunits)
    1aaf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ab3:	8b 48 08             	mov    0x8(%rax),%ecx
    1ab6:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1ab9:	0f 85 13 00 00 00    	jne    1ad2 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    1abf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ac3:	48 8b 00             	mov    (%rax),%rax
    1ac6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1aca:	48 89 01             	mov    %rax,(%rcx)
    1acd:	e9 33 00 00 00       	jmpq   1b05 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    1ad2:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1ad5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1ad9:	8b 51 08             	mov    0x8(%rcx),%edx
    1adc:	29 c2                	sub    %eax,%edx
    1ade:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    1ae1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1ae5:	8b 41 08             	mov    0x8(%rcx),%eax
    1ae8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1aec:	89 c0                	mov    %eax,%eax
    1aee:	89 c6                	mov    %eax,%esi
    1af0:	48 c1 e6 04          	shl    $0x4,%rsi
    1af4:	48 01 f1             	add    %rsi,%rcx
    1af7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    1afb:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1afe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1b02:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    1b05:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b09:	48 89 04 25 98 24 00 	mov    %rax,0x2498
    1b10:	00 
      return (void*)(p + 1);
    1b11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b15:	48 83 c0 10          	add    $0x10,%rax
    1b19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1b1d:	e9 57 00 00 00       	jmpq   1b79 <malloc+0x149>
    }
    if(p == freep)
    1b22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b26:	48 3b 04 25 98 24 00 	cmp    0x2498,%rax
    1b2d:	00 
    1b2e:	0f 85 28 00 00 00    	jne    1b5c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    1b34:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1b37:	e8 54 00 00 00       	callq  1b90 <morecore>
    1b3c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1b40:	48 83 f8 00          	cmp    $0x0,%rax
    1b44:	0f 85 0d 00 00 00    	jne    1b57 <malloc+0x127>
        return 0;
    1b4a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1b51:	00 
    1b52:	e9 22 00 00 00       	jmpq   1b79 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1b57:	e9 00 00 00 00       	jmpq   1b5c <malloc+0x12c>
  }
    1b5c:	e9 00 00 00 00       	jmpq   1b61 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b65:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1b69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b6d:	48 8b 00             	mov    (%rax),%rax
    1b70:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1b74:	e9 26 ff ff ff       	jmpq   1a9f <malloc+0x6f>
    1b79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b7d:	48 83 c4 30          	add    $0x30,%rsp
    1b81:	5d                   	pop    %rbp
    1b82:	c3                   	retq   
    1b83:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1b8a:	84 00 00 00 00 00 

0000000000001b90 <morecore>:
{
    1b90:	55                   	push   %rbp
    1b91:	48 89 e5             	mov    %rsp,%rbp
    1b94:	48 83 ec 20          	sub    $0x20,%rsp
    1b98:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    1b9b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1ba2:	0f 83 07 00 00 00    	jae    1baf <morecore+0x1f>
    nu = 4096;
    1ba8:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    1baf:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1bb2:	89 c1                	mov    %eax,%ecx
    1bb4:	48 c1 e1 04          	shl    $0x4,%rcx
    1bb8:	89 c8                	mov    %ecx,%eax
    1bba:	89 c7                	mov    %eax,%edi
    1bbc:	e8 cf fc ff ff       	callq  1890 <sbrk>
    1bc1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1bc8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    1bcc:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1bd0:	0f 85 0d 00 00 00    	jne    1be3 <morecore+0x53>
    return 0;
    1bd6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1bdd:	00 
    1bde:	e9 2e 00 00 00       	jmpq   1c11 <morecore+0x81>
  hp = (Header*)p;
    1be3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1be7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    1beb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1bee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1bf2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1bf5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1bf9:	48 83 c0 10          	add    $0x10,%rax
    1bfd:	48 89 c7             	mov    %rax,%rdi
    1c00:	e8 cb fc ff ff       	callq  18d0 <free>
  return freep;
    1c05:	48 8b 04 25 98 24 00 	mov    0x2498,%rax
    1c0c:	00 
    1c0d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1c11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c15:	48 83 c4 20          	add    $0x20,%rsp
    1c19:	5d                   	pop    %rbp
    1c1a:	c3                   	retq   
