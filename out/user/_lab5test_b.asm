
out/user/_lab5test_b:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <get_progress>:

int state;

void
get_progress(void)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 30          	sub    $0x30,%rsp
       8:	48 bf db 15 00 00 00 	movabs $0x15db,%rdi
       f:	00 00 00 
      12:	31 f6                	xor    %esi,%esi
  int fd;
  fd = open("progress.txt", O_RDONLY);
      14:	e8 ef 11 00 00       	callq  1208 <open>
      19:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if (fd < 0) {
      1c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
      20:	0f 8d 56 00 00 00    	jge    7c <get_progress+0x7c>
      26:	48 bf db 15 00 00 00 	movabs $0x15db,%rdi
      2d:	00 00 00 
      30:	be 02 02 00 00       	mov    $0x202,%esi
    //nothing is created yet
    state = 1;
      35:	c7 04 25 60 1a 00 00 	movl   $0x1,0x1a60
      3c:	01 00 00 00 
    fd = open("progress.txt", O_CREATE | O_RDWR);
      40:	e8 c3 11 00 00       	callq  1208 <open>
      45:	48 bf 60 1a 00 00 00 	movabs $0x1a60,%rdi
      4c:	00 00 00 
      4f:	ba 04 00 00 00       	mov    $0x4,%edx
      54:	89 45 fc             	mov    %eax,-0x4(%rbp)
    write(fd, &state, sizeof(int));
      57:	8b 45 fc             	mov    -0x4(%rbp),%eax
      5a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
      5e:	89 c7                	mov    %eax,%edi
      60:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
      64:	e8 7f 11 00 00       	callq  11e8 <write>
    close(fd);
      69:	8b 7d fc             	mov    -0x4(%rbp),%edi
      6c:	89 45 ec             	mov    %eax,-0x14(%rbp)
      6f:	e8 7c 11 00 00       	callq  11f0 <close>
  } else {
      74:	89 45 e8             	mov    %eax,-0x18(%rbp)
      77:	e9 e7 00 00 00       	jmpq   163 <get_progress+0x163>
      7c:	48 b8 60 1a 00 00 00 	movabs $0x1a60,%rax
      83:	00 00 00 
      86:	ba 04 00 00 00       	mov    $0x4,%edx
    read(fd, &state, sizeof(int));
      8b:	8b 7d fc             	mov    -0x4(%rbp),%edi
      8e:	48 89 c6             	mov    %rax,%rsi
      91:	e8 4a 11 00 00       	callq  11e0 <read>
    close(fd);
      96:	8b 7d fc             	mov    -0x4(%rbp),%edi
      99:	89 45 e4             	mov    %eax,-0x1c(%rbp)
      9c:	e8 4f 11 00 00       	callq  11f0 <close>

    if (state > 1000)
      a1:	81 3c 25 60 1a 00 00 	cmpl   $0x3e8,0x1a60
      a8:	e8 03 00 00 
      ac:	89 45 e0             	mov    %eax,-0x20(%rbp)
      af:	0f 8e 57 00 00 00    	jle    10c <get_progress+0x10c>
      error("too many steps before operating is complete");
      b5:	e9 00 00 00 00       	jmpq   ba <get_progress+0xba>
      ba:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
      c1:	00 00 00 
      c4:	ba 26 00 00 00       	mov    $0x26,%edx
      c9:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
      d0:	b0 00                	mov    $0x0,%al
      d2:	e8 b9 06 00 00       	callq  790 <printf>
      d7:	48 be fa 15 00 00 00 	movabs $0x15fa,%rsi
      de:	00 00 00 
      e1:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
      e8:	b0 00                	mov    $0x0,%al
      ea:	e8 a1 06 00 00       	callq  790 <printf>
      ef:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
      f6:	00 00 00 
      f9:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     100:	b0 00                	mov    $0x0,%al
     102:	e8 89 06 00 00       	callq  790 <printf>
     107:	e9 fb ff ff ff       	jmpq   107 <get_progress+0x107>
     10c:	48 bf db 15 00 00 00 	movabs $0x15db,%rdi
     113:	00 00 00 
     116:	be 02 00 00 00       	mov    $0x2,%esi

    state ++;
     11b:	8b 04 25 60 1a 00 00 	mov    0x1a60,%eax
     122:	83 c0 01             	add    $0x1,%eax
     125:	89 04 25 60 1a 00 00 	mov    %eax,0x1a60
    fd = open("progress.txt", O_RDWR);
     12c:	e8 d7 10 00 00       	callq  1208 <open>
     131:	48 bf 60 1a 00 00 00 	movabs $0x1a60,%rdi
     138:	00 00 00 
     13b:	ba 04 00 00 00       	mov    $0x4,%edx
     140:	89 45 fc             	mov    %eax,-0x4(%rbp)
    write(fd, &state, sizeof(int));
     143:	8b 45 fc             	mov    -0x4(%rbp),%eax
     146:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     14a:	89 c7                	mov    %eax,%edi
     14c:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
     150:	e8 93 10 00 00       	callq  11e8 <write>
    close(fd);
     155:	8b 7d fc             	mov    -0x4(%rbp),%edi
     158:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     15b:	e8 90 10 00 00       	callq  11f0 <close>
     160:	89 45 d0             	mov    %eax,-0x30(%rbp)
  }
}
     163:	48 83 c4 30          	add    $0x30,%rsp
     167:	5d                   	pop    %rbp
     168:	c3                   	retq   
     169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000170 <check1>:

void
check1(void)
{
     170:	55                   	push   %rbp
     171:	48 89 e5             	mov    %rsp,%rbp
     174:	48 83 ec 40          	sub    $0x40,%rsp
     178:	48 bf 26 16 00 00 00 	movabs $0x1626,%rdi
     17f:	00 00 00 
     182:	31 f6                	xor    %esi,%esi
  int fd;
  int i,j;
  struct stat st;

  fd = open("big.txt", O_RDONLY);
     184:	e8 7f 10 00 00       	callq  1208 <open>
     189:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if (fd < 0)
     18c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     190:	0f 8d 05 00 00 00    	jge    19b <check1+0x2b>
    return;
     196:	e9 55 02 00 00       	jmpq   3f0 <check1+0x280>
     19b:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  fstat(fd, &st);
     19f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     1a2:	e8 79 10 00 00       	callq  1220 <fstat>

  // check if it is a zero-size file
  if (st.size == 0)
     1a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     1ab:	89 45 d8             	mov    %eax,-0x28(%rbp)
     1ae:	0f 85 05 00 00 00    	jne    1b9 <check1+0x49>
    return;
     1b4:	e9 37 02 00 00       	jmpq   3f0 <check1+0x280>

  if (st.size % 512 != 0)
     1b9:	8b 45 f0             	mov    -0x10(%rbp),%eax
     1bc:	25 ff 01 00 00       	and    $0x1ff,%eax
     1c1:	83 f8 00             	cmp    $0x0,%eax
     1c4:	0f 84 57 00 00 00    	je     221 <check1+0xb1>
    error("write is in-complete, file system not in consistent state!");
     1ca:	e9 00 00 00 00       	jmpq   1cf <check1+0x5f>
     1cf:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     1d6:	00 00 00 
     1d9:	ba 40 00 00 00       	mov    $0x40,%edx
     1de:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     1e5:	b0 00                	mov    $0x0,%al
     1e7:	e8 a4 05 00 00       	callq  790 <printf>
     1ec:	48 be 2e 16 00 00 00 	movabs $0x162e,%rsi
     1f3:	00 00 00 
     1f6:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     1fd:	b0 00                	mov    $0x0,%al
     1ff:	e8 8c 05 00 00       	callq  790 <printf>
     204:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     20b:	00 00 00 
     20e:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     215:	b0 00                	mov    $0x0,%al
     217:	e8 74 05 00 00       	callq  790 <printf>
     21c:	e9 fb ff ff ff       	jmpq   21c <check1+0xac>

  // check if the size of the file is correct
  int progress = st.size / 512;
     221:	8b 45 f0             	mov    -0x10(%rbp),%eax
     224:	c1 e8 09             	shr    $0x9,%eax
     227:	89 45 dc             	mov    %eax,-0x24(%rbp)
  if (progress > 3)
     22a:	83 7d dc 03          	cmpl   $0x3,-0x24(%rbp)
     22e:	0f 8e 57 00 00 00    	jle    28b <check1+0x11b>
    error("write is incorrect, file system not in consistent state!");
     234:	e9 00 00 00 00       	jmpq   239 <check1+0xc9>
     239:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     240:	00 00 00 
     243:	ba 45 00 00 00       	mov    $0x45,%edx
     248:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     24f:	b0 00                	mov    $0x0,%al
     251:	e8 3a 05 00 00       	callq  790 <printf>
     256:	48 be 69 16 00 00 00 	movabs $0x1669,%rsi
     25d:	00 00 00 
     260:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     267:	b0 00                	mov    $0x0,%al
     269:	e8 22 05 00 00       	callq  790 <printf>
     26e:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     275:	00 00 00 
     278:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     27f:	b0 00                	mov    $0x0,%al
     281:	e8 0a 05 00 00       	callq  790 <printf>
     286:	e9 fb ff ff ff       	jmpq   286 <check1+0x116>
     28b:	48 bf 70 1a 00 00 00 	movabs $0x1a70,%rdi
     292:	00 00 00 
     295:	31 f6                	xor    %esi,%esi
     297:	ba 00 20 00 00       	mov    $0x2000,%edx

  memset(buf, 0, sizeof(buf));
     29c:	e8 7f 0c 00 00       	callq  f20 <memset>
     2a1:	48 be 70 1a 00 00 00 	movabs $0x1a70,%rsi
     2a8:	00 00 00 
     2ab:	ba 00 06 00 00       	mov    $0x600,%edx
  read(fd, buf, 3 * 512);
     2b0:	8b 7d fc             	mov    -0x4(%rbp),%edi
     2b3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     2b7:	e8 24 0f 00 00       	callq  11e0 <read>
  for (i = 0; i < progress; i++) {
     2bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
     2c3:	89 45 cc             	mov    %eax,-0x34(%rbp)
     2c6:	8b 45 f8             	mov    -0x8(%rbp),%eax
     2c9:	3b 45 dc             	cmp    -0x24(%rbp),%eax
     2cc:	0f 8d d1 00 00 00    	jge    3a3 <check1+0x233>
    for (j = 0; j < 512; j++ ){
     2d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     2d9:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%rbp)
     2e0:	0f 8d aa 00 00 00    	jge    390 <check1+0x220>
      if (buf[i * 512 + j] != 'a' + i)
     2e6:	8b 45 f8             	mov    -0x8(%rbp),%eax
     2e9:	c1 e0 09             	shl    $0x9,%eax
     2ec:	03 45 f4             	add    -0xc(%rbp),%eax
     2ef:	48 63 c8             	movslq %eax,%rcx
     2f2:	0f be 04 0d 70 1a 00 	movsbl 0x1a70(,%rcx,1),%eax
     2f9:	00 
     2fa:	8b 55 f8             	mov    -0x8(%rbp),%edx
     2fd:	83 c2 61             	add    $0x61,%edx
     300:	39 d0                	cmp    %edx,%eax
     302:	0f 84 75 00 00 00    	je     37d <check1+0x20d>
        error("file system not in consistent state!, i = %d, j = %d, content = %d", i, j, buf[i*512+j]);
     308:	e9 00 00 00 00       	jmpq   30d <check1+0x19d>
     30d:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     314:	00 00 00 
     317:	ba 4c 00 00 00       	mov    $0x4c,%edx
     31c:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     323:	b0 00                	mov    $0x0,%al
     325:	e8 66 04 00 00       	callq  790 <printf>
     32a:	48 be a2 16 00 00 00 	movabs $0x16a2,%rsi
     331:	00 00 00 
     334:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     33b:	8b 55 f8             	mov    -0x8(%rbp),%edx
     33e:	8b 4d f4             	mov    -0xc(%rbp),%ecx
     341:	44 8b 45 f8          	mov    -0x8(%rbp),%r8d
     345:	41 c1 e0 09          	shl    $0x9,%r8d
     349:	44 03 45 f4          	add    -0xc(%rbp),%r8d
     34d:	4d 63 c8             	movslq %r8d,%r9
     350:	46 0f be 04 0d 70 1a 	movsbl 0x1a70(,%r9,1),%r8d
     357:	00 00 
     359:	b0 00                	mov    $0x0,%al
     35b:	e8 30 04 00 00       	callq  790 <printf>
     360:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     367:	00 00 00 
     36a:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     371:	b0 00                	mov    $0x0,%al
     373:	e8 18 04 00 00       	callq  790 <printf>
     378:	e9 fb ff ff ff       	jmpq   378 <check1+0x208>
    }
     37d:	e9 00 00 00 00       	jmpq   382 <check1+0x212>
    for (j = 0; j < 512; j++ ){
     382:	8b 45 f4             	mov    -0xc(%rbp),%eax
     385:	83 c0 01             	add    $0x1,%eax
     388:	89 45 f4             	mov    %eax,-0xc(%rbp)
     38b:	e9 49 ff ff ff       	jmpq   2d9 <check1+0x169>
  }
     390:	e9 00 00 00 00       	jmpq   395 <check1+0x225>
  for (i = 0; i < progress; i++) {
     395:	8b 45 f8             	mov    -0x8(%rbp),%eax
     398:	83 c0 01             	add    $0x1,%eax
     39b:	89 45 f8             	mov    %eax,-0x8(%rbp)
     39e:	e9 23 ff ff ff       	jmpq   2c6 <check1+0x156>
  close(fd);
     3a3:	8b 7d fc             	mov    -0x4(%rbp),%edi
     3a6:	e8 45 0e 00 00       	callq  11f0 <close>

  if (progress == 3) {
     3ab:	83 7d dc 03          	cmpl   $0x3,-0x24(%rbp)
     3af:	89 45 c8             	mov    %eax,-0x38(%rbp)
     3b2:	0f 85 38 00 00 00    	jne    3f0 <check1+0x280>
     3b8:	48 be e5 16 00 00 00 	movabs $0x16e5,%rsi
     3bf:	00 00 00 
    printf(stdout, "big.txt is completely written\n");
     3c2:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     3c9:	b0 00                	mov    $0x0,%al
     3cb:	e8 c0 03 00 00       	callq  790 <printf>
     3d0:	48 be 04 17 00 00 00 	movabs $0x1704,%rsi
     3d7:	00 00 00 
    printf(stdout, "lab5test_b passed!\n");
     3da:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     3e1:	b0 00                	mov    $0x0,%al
     3e3:	e8 a8 03 00 00       	callq  790 <printf>
    exit();
     3e8:	e8 db 0d 00 00       	callq  11c8 <exit>
     3ed:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  }
}
     3f0:	48 83 c4 40          	add    $0x40,%rsp
     3f4:	5d                   	pop    %rbp
     3f5:	c3                   	retq   
     3f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     3fd:	00 00 00 

0000000000000400 <check2>:

void
check2(void)
{
     400:	55                   	push   %rbp
     401:	48 89 e5             	mov    %rsp,%rbp
     404:	48 83 ec 40          	sub    $0x40,%rsp
     408:	48 bf 26 16 00 00 00 	movabs $0x1626,%rdi
     40f:	00 00 00 
     412:	31 f6                	xor    %esi,%esi
  int fd;
  int i,j;
  struct stat st;

  fd = open("big.txt", O_RDONLY);
     414:	e8 ef 0d 00 00       	callq  1208 <open>
     419:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if (fd < 0)
     41c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     420:	0f 8d 57 00 00 00    	jge    47d <check2+0x7d>
    error("file is not generated");
     426:	e9 00 00 00 00       	jmpq   42b <check2+0x2b>
     42b:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     432:	00 00 00 
     435:	ba 61 00 00 00       	mov    $0x61,%edx
     43a:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     441:	b0 00                	mov    $0x0,%al
     443:	e8 48 03 00 00       	callq  790 <printf>
     448:	48 be 18 17 00 00 00 	movabs $0x1718,%rsi
     44f:	00 00 00 
     452:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     459:	b0 00                	mov    $0x0,%al
     45b:	e8 30 03 00 00       	callq  790 <printf>
     460:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     467:	00 00 00 
     46a:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     471:	b0 00                	mov    $0x0,%al
     473:	e8 18 03 00 00       	callq  790 <printf>
     478:	e9 fb ff ff ff       	jmpq   478 <check2+0x78>
     47d:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi

  fstat(fd, &st);
     481:	8b 7d fc             	mov    -0x4(%rbp),%edi
     484:	e8 97 0d 00 00       	callq  1220 <fstat>

  // check if the size of the file is correct
  if (st.size != 512 * 3)
     489:	81 7d f0 00 06 00 00 	cmpl   $0x600,-0x10(%rbp)
     490:	89 45 dc             	mov    %eax,-0x24(%rbp)
     493:	0f 84 57 00 00 00    	je     4f0 <check2+0xf0>
    error("write is in-complete, file system not in consistent state!");
     499:	e9 00 00 00 00       	jmpq   49e <check2+0x9e>
     49e:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     4a5:	00 00 00 
     4a8:	ba 67 00 00 00       	mov    $0x67,%edx
     4ad:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     4b4:	b0 00                	mov    $0x0,%al
     4b6:	e8 d5 02 00 00       	callq  790 <printf>
     4bb:	48 be 2e 16 00 00 00 	movabs $0x162e,%rsi
     4c2:	00 00 00 
     4c5:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     4cc:	b0 00                	mov    $0x0,%al
     4ce:	e8 bd 02 00 00       	callq  790 <printf>
     4d3:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     4da:	00 00 00 
     4dd:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     4e4:	b0 00                	mov    $0x0,%al
     4e6:	e8 a5 02 00 00       	callq  790 <printf>
     4eb:	e9 fb ff ff ff       	jmpq   4eb <check2+0xeb>
     4f0:	48 bf 70 1a 00 00 00 	movabs $0x1a70,%rdi
     4f7:	00 00 00 
     4fa:	31 f6                	xor    %esi,%esi
     4fc:	ba 00 20 00 00       	mov    $0x2000,%edx
  memset(buf, 0, sizeof(buf));
     501:	e8 1a 0a 00 00       	callq  f20 <memset>
     506:	48 be 70 1a 00 00 00 	movabs $0x1a70,%rsi
     50d:	00 00 00 
     510:	ba 00 06 00 00       	mov    $0x600,%edx
  read(fd, buf, 3 * 512);
     515:	8b 7d fc             	mov    -0x4(%rbp),%edi
     518:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     51c:	e8 bf 0c 00 00       	callq  11e0 <read>
  for (i = 0; i < 3; i++) {
     521:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
     528:	89 45 cc             	mov    %eax,-0x34(%rbp)
     52b:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
     52f:	0f 8d b3 00 00 00    	jge    5e8 <check2+0x1e8>
    for (j = 0; j < 512; j++ ){
     535:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     53c:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%rbp)
     543:	0f 8d 8c 00 00 00    	jge    5d5 <check2+0x1d5>
      if (buf[i * 512 + j] != 'a' + i)
     549:	8b 45 f8             	mov    -0x8(%rbp),%eax
     54c:	c1 e0 09             	shl    $0x9,%eax
     54f:	03 45 f4             	add    -0xc(%rbp),%eax
     552:	48 63 c8             	movslq %eax,%rcx
     555:	0f be 04 0d 70 1a 00 	movsbl 0x1a70(,%rcx,1),%eax
     55c:	00 
     55d:	8b 55 f8             	mov    -0x8(%rbp),%edx
     560:	83 c2 61             	add    $0x61,%edx
     563:	39 d0                	cmp    %edx,%eax
     565:	0f 84 57 00 00 00    	je     5c2 <check2+0x1c2>
        error("file system not in consistent state!");
     56b:	e9 00 00 00 00       	jmpq   570 <check2+0x170>
     570:	48 be e8 15 00 00 00 	movabs $0x15e8,%rsi
     577:	00 00 00 
     57a:	ba 6d 00 00 00       	mov    $0x6d,%edx
     57f:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     586:	b0 00                	mov    $0x0,%al
     588:	e8 03 02 00 00       	callq  790 <printf>
     58d:	48 be 44 16 00 00 00 	movabs $0x1644,%rsi
     594:	00 00 00 
     597:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     59e:	b0 00                	mov    $0x0,%al
     5a0:	e8 eb 01 00 00       	callq  790 <printf>
     5a5:	48 be 16 17 00 00 00 	movabs $0x1716,%rsi
     5ac:	00 00 00 
     5af:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     5b6:	b0 00                	mov    $0x0,%al
     5b8:	e8 d3 01 00 00       	callq  790 <printf>
     5bd:	e9 fb ff ff ff       	jmpq   5bd <check2+0x1bd>
    }
     5c2:	e9 00 00 00 00       	jmpq   5c7 <check2+0x1c7>
    for (j = 0; j < 512; j++ ){
     5c7:	8b 45 f4             	mov    -0xc(%rbp),%eax
     5ca:	83 c0 01             	add    $0x1,%eax
     5cd:	89 45 f4             	mov    %eax,-0xc(%rbp)
     5d0:	e9 67 ff ff ff       	jmpq   53c <check2+0x13c>
  }
     5d5:	e9 00 00 00 00       	jmpq   5da <check2+0x1da>
  for (i = 0; i < 3; i++) {
     5da:	8b 45 f8             	mov    -0x8(%rbp),%eax
     5dd:	83 c0 01             	add    $0x1,%eax
     5e0:	89 45 f8             	mov    %eax,-0x8(%rbp)
     5e3:	e9 43 ff ff ff       	jmpq   52b <check2+0x12b>
  close(fd);
     5e8:	8b 7d fc             	mov    -0x4(%rbp),%edi
     5eb:	e8 00 0c 00 00       	callq  11f0 <close>
  return;
     5f0:	89 45 c8             	mov    %eax,-0x38(%rbp)
     5f3:	48 83 c4 40          	add    $0x40,%rsp
     5f7:	5d                   	pop    %rbp
     5f8:	c3                   	retq   
     5f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000600 <crashsafe>:
}

void
crashsafe(int steps)
{
     600:	55                   	push   %rbp
     601:	48 89 e5             	mov    %rsp,%rbp
     604:	48 83 ec 40          	sub    $0x40,%rsp
     608:	89 7d fc             	mov    %edi,-0x4(%rbp)
  int fd;
  crashn(steps);
     60b:	8b 7d fc             	mov    -0x4(%rbp),%edi
     60e:	e8 6d 0c 00 00       	callq  1280 <crashn>
     613:	48 be 2e 17 00 00 00 	movabs $0x172e,%rsi
     61a:	00 00 00 
  printf(stdout, "crash after %d steps\n", steps);
     61d:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     624:	8b 55 fc             	mov    -0x4(%rbp),%edx
     627:	89 45 f4             	mov    %eax,-0xc(%rbp)
     62a:	b0 00                	mov    $0x0,%al
     62c:	e8 5f 01 00 00       	callq  790 <printf>
     631:	48 bf 26 16 00 00 00 	movabs $0x1626,%rdi
     638:	00 00 00 
     63b:	be 02 02 00 00       	mov    $0x202,%esi
  fd = open("big.txt", O_CREATE | O_RDWR);
     640:	e8 c3 0b 00 00       	callq  1208 <open>
     645:	48 bf 70 1a 00 00 00 	movabs $0x1a70,%rdi
     64c:	00 00 00 
     64f:	be 61 00 00 00       	mov    $0x61,%esi
     654:	ba 00 02 00 00       	mov    $0x200,%edx
     659:	89 45 f8             	mov    %eax,-0x8(%rbp)
  memset(buf, 'a', 512);
     65c:	e8 bf 08 00 00       	callq  f20 <memset>
     661:	48 bf 70 1a 00 00 00 	movabs $0x1a70,%rdi
     668:	00 00 00 
     66b:	48 81 c7 00 02 00 00 	add    $0x200,%rdi
     672:	be 62 00 00 00       	mov    $0x62,%esi
     677:	ba 00 02 00 00       	mov    $0x200,%edx
  memset(buf + 512 * 1, 'b', 512);
     67c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     680:	e8 9b 08 00 00       	callq  f20 <memset>
     685:	48 bf 70 1a 00 00 00 	movabs $0x1a70,%rdi
     68c:	00 00 00 
     68f:	48 81 c7 00 04 00 00 	add    $0x400,%rdi
     696:	be 63 00 00 00       	mov    $0x63,%esi
     69b:	ba 00 02 00 00       	mov    $0x200,%edx
  memset(buf + 512 * 2, 'c', 512);
     6a0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     6a4:	e8 77 08 00 00       	callq  f20 <memset>
     6a9:	48 be 70 1a 00 00 00 	movabs $0x1a70,%rsi
     6b0:	00 00 00 
     6b3:	ba 00 02 00 00       	mov    $0x200,%edx
  write(fd, buf, 512);
     6b8:	8b 7d f8             	mov    -0x8(%rbp),%edi
     6bb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     6bf:	e8 24 0b 00 00       	callq  11e8 <write>
     6c4:	48 be 70 1a 00 00 00 	movabs $0x1a70,%rsi
     6cb:	00 00 00 
     6ce:	48 81 c6 00 02 00 00 	add    $0x200,%rsi
     6d5:	ba 00 02 00 00       	mov    $0x200,%edx
  write(fd, buf + 512, 512);
     6da:	8b 7d f8             	mov    -0x8(%rbp),%edi
     6dd:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     6e0:	e8 03 0b 00 00       	callq  11e8 <write>
     6e5:	48 be 70 1a 00 00 00 	movabs $0x1a70,%rsi
     6ec:	00 00 00 
     6ef:	48 81 c6 00 04 00 00 	add    $0x400,%rsi
     6f6:	ba 00 02 00 00       	mov    $0x200,%edx
  write(fd, buf + 1024, 512);
     6fb:	8b 7d f8             	mov    -0x8(%rbp),%edi
     6fe:	89 45 d0             	mov    %eax,-0x30(%rbp)
     701:	e8 e2 0a 00 00       	callq  11e8 <write>
  close(fd);
     706:	8b 7d f8             	mov    -0x8(%rbp),%edi
     709:	89 45 cc             	mov    %eax,-0x34(%rbp)
     70c:	e8 df 0a 00 00       	callq  11f0 <close>
}
     711:	89 45 c8             	mov    %eax,-0x38(%rbp)
     714:	48 83 c4 40          	add    $0x40,%rsp
     718:	5d                   	pop    %rbp
     719:	c3                   	retq   
     71a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000720 <main>:

int
main(int argc, char *argv[])
{
     720:	55                   	push   %rbp
     721:	48 89 e5             	mov    %rsp,%rbp
     724:	48 83 ec 20          	sub    $0x20,%rsp
     728:	48 b8 44 17 00 00 00 	movabs $0x1744,%rax
     72f:	00 00 00 
     732:	89 7d f8             	mov    %edi,-0x8(%rbp)
     735:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  printf(stdout, "lab5test_b starting\n");
     739:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     740:	48 89 c6             	mov    %rax,%rsi
     743:	b0 00                	mov    $0x0,%al
     745:	e8 46 00 00 00       	callq  790 <printf>
  check1();
     74a:	e8 21 fa ff ff       	callq  170 <check1>
  get_progress();
     74f:	e8 ac f8 ff ff       	callq  0 <get_progress>
  crashsafe(state);
     754:	8b 3c 25 60 1a 00 00 	mov    0x1a60,%edi
     75b:	e8 a0 fe ff ff       	callq  600 <crashsafe>
  check2();
     760:	e8 9b fc ff ff       	callq  400 <check2>
     765:	48 be 04 17 00 00 00 	movabs $0x1704,%rsi
     76c:	00 00 00 
  printf(stdout, "lab5test_b passed!\n");
     76f:	8b 3c 25 f0 19 00 00 	mov    0x19f0,%edi
     776:	b0 00                	mov    $0x0,%al
     778:	e8 13 00 00 00       	callq  790 <printf>
  exit();
     77d:	e8 46 0a 00 00       	callq  11c8 <exit>
     782:	89 45 ec             	mov    %eax,-0x14(%rbp)
     785:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     78c:	00 00 00 
     78f:	90                   	nop

0000000000000790 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     790:	55                   	push   %rbp
     791:	48 89 e5             	mov    %rsp,%rbp
     794:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     79b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     79f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     7a3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     7a7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     7ab:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     7af:	89 7d fc             	mov    %edi,-0x4(%rbp)
     7b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     7b6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     7ba:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     7be:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     7c2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     7c6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     7cd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     7d3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     7da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     7e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     7e5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     7e9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     7ed:	0f 84 f0 03 00 00    	je     be3 <printf+0x453>
    c = fmt[i] & 0xff;
     7f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     7f7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     7fb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     7ff:	81 e2 ff 00 00 00    	and    $0xff,%edx
     805:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     808:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     80c:	0f 85 32 00 00 00    	jne    844 <printf+0xb4>
      if(c == '%'){
     812:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     816:	0f 85 13 00 00 00    	jne    82f <printf+0x9f>
        state = '%';
     81c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     823:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     82a:	e9 10 00 00 00       	jmpq   83f <printf+0xaf>
        putc(fd, c);
     82f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     832:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     835:	88 c1                	mov    %al,%cl
     837:	0f be f1             	movsbl %cl,%esi
     83a:	e8 b1 03 00 00       	callq  bf0 <putc>
      }
    } else if(state == '%'){
     83f:	e9 8c 03 00 00       	jmpq   bd0 <printf+0x440>
     844:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     848:	0f 85 7d 03 00 00    	jne    bcb <printf+0x43b>
      if(c == 'l') {
     84e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     852:	0f 85 0c 00 00 00    	jne    864 <printf+0xd4>
        lflag = 1;
     858:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     85f:	e9 71 03 00 00       	jmpq   bd5 <printf+0x445>
      } else if(c == 'd'){
     864:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     868:	0f 85 0e 01 00 00    	jne    97c <printf+0x1ec>
        if (lflag == 1)
     86e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     872:	0f 85 79 00 00 00    	jne    8f1 <printf+0x161>
     878:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     87c:	8b 7d fc             	mov    -0x4(%rbp),%edi
     87f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     882:	83 f9 28             	cmp    $0x28,%ecx
     885:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     889:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     88c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     88f:	0f 87 1f 00 00 00    	ja     8b4 <printf+0x124>
     895:	8b 45 80             	mov    -0x80(%rbp),%eax
     898:	48 63 c8             	movslq %eax,%rcx
     89b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     89f:	48 03 4a 10          	add    0x10(%rdx),%rcx
     8a3:	83 c0 08             	add    $0x8,%eax
     8a6:	89 02                	mov    %eax,(%rdx)
     8a8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     8af:	e9 1a 00 00 00       	jmpq   8ce <printf+0x13e>
     8b4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     8b8:	48 8b 48 08          	mov    0x8(%rax),%rcx
     8bc:	48 89 ca             	mov    %rcx,%rdx
     8bf:	48 83 c1 08          	add    $0x8,%rcx
     8c3:	48 89 48 08          	mov    %rcx,0x8(%rax)
     8c7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     8ce:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     8d5:	ba 0a 00 00 00       	mov    $0xa,%edx
     8da:	b9 01 00 00 00       	mov    $0x1,%ecx
     8df:	48 8b 00             	mov    (%rax),%rax
     8e2:	89 c6                	mov    %eax,%esi
     8e4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     8e7:	e8 34 03 00 00       	callq  c20 <printint64>
     8ec:	e9 86 00 00 00       	jmpq   977 <printf+0x1e7>
     8f1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     8f5:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8f8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     8fb:	83 f9 28             	cmp    $0x28,%ecx
     8fe:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     905:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     90b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     911:	0f 87 25 00 00 00    	ja     93c <printf+0x1ac>
     917:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     91d:	48 63 c8             	movslq %eax,%rcx
     920:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     927:	48 03 4a 10          	add    0x10(%rdx),%rcx
     92b:	83 c0 08             	add    $0x8,%eax
     92e:	89 02                	mov    %eax,(%rdx)
     930:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     937:	e9 1d 00 00 00       	jmpq   959 <printf+0x1c9>
     93c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     943:	48 8b 48 08          	mov    0x8(%rax),%rcx
     947:	48 89 ca             	mov    %rcx,%rdx
     94a:	48 83 c1 08          	add    $0x8,%rcx
     94e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     952:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     959:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     960:	ba 0a 00 00 00       	mov    $0xa,%edx
     965:	b9 01 00 00 00       	mov    $0x1,%ecx
     96a:	8b 30                	mov    (%rax),%esi
     96c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     972:	e8 a9 03 00 00       	callq  d20 <printint>
      } else if(c == 'x' || c == 'p'){
     977:	e9 43 02 00 00       	jmpq   bbf <printf+0x42f>
     97c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     980:	0f 84 0a 00 00 00    	je     990 <printf+0x200>
     986:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     98a:	0f 85 1d 01 00 00    	jne    aad <printf+0x31d>
        if (lflag == 1)
     990:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     994:	0f 85 8b 00 00 00    	jne    a25 <printf+0x295>
     99a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     99e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     9a1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     9a4:	83 f9 28             	cmp    $0x28,%ecx
     9a7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     9ae:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     9b4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     9ba:	0f 87 25 00 00 00    	ja     9e5 <printf+0x255>
     9c0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     9c6:	48 63 c8             	movslq %eax,%rcx
     9c9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     9d0:	48 03 4a 10          	add    0x10(%rdx),%rcx
     9d4:	83 c0 08             	add    $0x8,%eax
     9d7:	89 02                	mov    %eax,(%rdx)
     9d9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     9e0:	e9 1d 00 00 00       	jmpq   a02 <printf+0x272>
     9e5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     9ec:	48 8b 48 08          	mov    0x8(%rax),%rcx
     9f0:	48 89 ca             	mov    %rcx,%rdx
     9f3:	48 83 c1 08          	add    $0x8,%rcx
     9f7:	48 89 48 08          	mov    %rcx,0x8(%rax)
     9fb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     a02:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     a09:	ba 10 00 00 00       	mov    $0x10,%edx
     a0e:	31 c9                	xor    %ecx,%ecx
     a10:	48 8b 00             	mov    (%rax),%rax
     a13:	89 c6                	mov    %eax,%esi
     a15:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     a1b:	e8 00 02 00 00       	callq  c20 <printint64>
     a20:	e9 83 00 00 00       	jmpq   aa8 <printf+0x318>
     a25:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     a29:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a2c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     a2f:	83 f9 28             	cmp    $0x28,%ecx
     a32:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     a39:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     a3f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     a45:	0f 87 25 00 00 00    	ja     a70 <printf+0x2e0>
     a4b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     a51:	48 63 c8             	movslq %eax,%rcx
     a54:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     a5b:	48 03 4a 10          	add    0x10(%rdx),%rcx
     a5f:	83 c0 08             	add    $0x8,%eax
     a62:	89 02                	mov    %eax,(%rdx)
     a64:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     a6b:	e9 1d 00 00 00       	jmpq   a8d <printf+0x2fd>
     a70:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     a77:	48 8b 48 08          	mov    0x8(%rax),%rcx
     a7b:	48 89 ca             	mov    %rcx,%rdx
     a7e:	48 83 c1 08          	add    $0x8,%rcx
     a82:	48 89 48 08          	mov    %rcx,0x8(%rax)
     a86:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     a8d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     a94:	ba 10 00 00 00       	mov    $0x10,%edx
     a99:	31 c9                	xor    %ecx,%ecx
     a9b:	8b 30                	mov    (%rax),%esi
     a9d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     aa3:	e8 78 02 00 00       	callq  d20 <printint>
      } else if(c == 's'){
     aa8:	e9 0d 01 00 00       	jmpq   bba <printf+0x42a>
     aad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     ab1:	0f 85 bc 00 00 00    	jne    b73 <printf+0x3e3>
     ab7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     abb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     abe:	83 f9 28             	cmp    $0x28,%ecx
     ac1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     ac8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     ace:	0f 87 25 00 00 00    	ja     af9 <printf+0x369>
     ad4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     ada:	48 63 c8             	movslq %eax,%rcx
     add:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     ae4:	48 03 4a 10          	add    0x10(%rdx),%rcx
     ae8:	83 c0 08             	add    $0x8,%eax
     aeb:	89 02                	mov    %eax,(%rdx)
     aed:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     af4:	e9 1d 00 00 00       	jmpq   b16 <printf+0x386>
     af9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     b00:	48 8b 48 08          	mov    0x8(%rax),%rcx
     b04:	48 89 ca             	mov    %rcx,%rdx
     b07:	48 83 c1 08          	add    $0x8,%rcx
     b0b:	48 89 48 08          	mov    %rcx,0x8(%rax)
     b0f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     b16:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     b1d:	48 8b 00             	mov    (%rax),%rax
     b20:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     b24:	48 83 f8 00          	cmp    $0x0,%rax
     b28:	0f 85 0e 00 00 00    	jne    b3c <printf+0x3ac>
     b2e:	48 b8 59 17 00 00 00 	movabs $0x1759,%rax
     b35:	00 00 00 
          s = "(null)";
     b38:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     b3c:	e9 00 00 00 00       	jmpq   b41 <printf+0x3b1>
     b41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b45:	80 38 00             	cmpb   $0x0,(%rax)
     b48:	0f 84 20 00 00 00    	je     b6e <printf+0x3de>
          putc(fd, *s);
     b4e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     b51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b55:	0f be 30             	movsbl (%rax),%esi
     b58:	e8 93 00 00 00       	callq  bf0 <putc>
        for(; *s; s++)
     b5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b61:	48 83 c0 01          	add    $0x1,%rax
     b65:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     b69:	e9 d3 ff ff ff       	jmpq   b41 <printf+0x3b1>
      } else if(c == '%'){
     b6e:	e9 42 00 00 00       	jmpq   bb5 <printf+0x425>
     b73:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     b77:	0f 85 15 00 00 00    	jne    b92 <printf+0x402>
        putc(fd, c);
     b7d:	8b 7d fc             	mov    -0x4(%rbp),%edi
     b80:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     b83:	88 c1                	mov    %al,%cl
     b85:	0f be f1             	movsbl %cl,%esi
     b88:	e8 63 00 00 00       	callq  bf0 <putc>
      } else {
     b8d:	e9 1e 00 00 00       	jmpq   bb0 <printf+0x420>
     b92:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     b97:	8b 7d fc             	mov    -0x4(%rbp),%edi
     b9a:	e8 51 00 00 00       	callq  bf0 <putc>
        putc(fd, c);
     b9f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     ba2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     ba5:	40 88 f0             	mov    %sil,%al
     ba8:	0f be f0             	movsbl %al,%esi
     bab:	e8 40 00 00 00       	callq  bf0 <putc>
     bb0:	e9 00 00 00 00       	jmpq   bb5 <printf+0x425>
     bb5:	e9 00 00 00 00       	jmpq   bba <printf+0x42a>
     bba:	e9 00 00 00 00       	jmpq   bbf <printf+0x42f>
     bbf:	e9 00 00 00 00       	jmpq   bc4 <printf+0x434>
      }
      state = 0;
     bc4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     bcb:	e9 00 00 00 00       	jmpq   bd0 <printf+0x440>
    }
  }
     bd0:	e9 00 00 00 00       	jmpq   bd5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     bd5:	8b 45 e0             	mov    -0x20(%rbp),%eax
     bd8:	83 c0 01             	add    $0x1,%eax
     bdb:	89 45 e0             	mov    %eax,-0x20(%rbp)
     bde:	e9 fe fb ff ff       	jmpq   7e1 <printf+0x51>

  va_end(valist);
}
     be3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     bea:	5d                   	pop    %rbp
     beb:	c3                   	retq   
     bec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000bf0 <putc>:
{
     bf0:	55                   	push   %rbp
     bf1:	48 89 e5             	mov    %rsp,%rbp
     bf4:	48 83 ec 10          	sub    $0x10,%rsp
     bf8:	40 88 f0             	mov    %sil,%al
     bfb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     bff:	ba 01 00 00 00       	mov    $0x1,%edx
     c04:	89 7d fc             	mov    %edi,-0x4(%rbp)
     c07:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     c0a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     c0d:	e8 d6 05 00 00       	callq  11e8 <write>
}
     c12:	89 45 f4             	mov    %eax,-0xc(%rbp)
     c15:	48 83 c4 10          	add    $0x10,%rsp
     c19:	5d                   	pop    %rbp
     c1a:	c3                   	retq   
     c1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000c20 <printint64>:
{
     c20:	55                   	push   %rbp
     c21:	48 89 e5             	mov    %rsp,%rbp
     c24:	48 83 ec 50          	sub    $0x50,%rsp
     c28:	89 7d fc             	mov    %edi,-0x4(%rbp)
     c2b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     c2e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     c31:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     c34:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     c38:	0f 84 30 00 00 00    	je     c6e <printint64+0x4e>
     c3e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     c42:	0f 9c c0             	setl   %al
     c45:	88 c1                	mov    %al,%cl
     c47:	80 e1 01             	and    $0x1,%cl
     c4a:	0f b6 d1             	movzbl %cl,%edx
     c4d:	89 55 f0             	mov    %edx,-0x10(%rbp)
     c50:	a8 01                	test   $0x1,%al
     c52:	0f 85 05 00 00 00    	jne    c5d <printint64+0x3d>
     c58:	e9 11 00 00 00       	jmpq   c6e <printint64+0x4e>
     c5d:	31 c0                	xor    %eax,%eax
    x = -xx;
     c5f:	2b 45 f8             	sub    -0x8(%rbp),%eax
     c62:	48 63 c8             	movslq %eax,%rcx
     c65:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     c69:	e9 08 00 00 00       	jmpq   c76 <printint64+0x56>
    x = xx;
     c6e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     c72:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     c76:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     c7d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     c81:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     c85:	31 d2                	xor    %edx,%edx
     c87:	48 f7 f1             	div    %rcx
     c8a:	40 8a 34 15 00 1a 00 	mov    0x1a00(,%rdx,1),%sil
     c91:	00 
     c92:	8b 7d cc             	mov    -0x34(%rbp),%edi
     c95:	41 89 f8             	mov    %edi,%r8d
     c98:	41 83 c0 01          	add    $0x1,%r8d
     c9c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     ca0:	48 63 cf             	movslq %edi,%rcx
     ca3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     ca8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     cac:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     cb0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     cb4:	48 89 c8             	mov    %rcx,%rax
     cb7:	31 d2                	xor    %edx,%edx
     cb9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     cbd:	48 f7 f1             	div    %rcx
     cc0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     cc4:	48 83 f8 00          	cmp    $0x0,%rax
     cc8:	0f 85 af ff ff ff    	jne    c7d <printint64+0x5d>
  if(sgn)
     cce:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     cd2:	0f 84 13 00 00 00    	je     ceb <printint64+0xcb>
    buf[i++] = '-';
     cd8:	8b 45 cc             	mov    -0x34(%rbp),%eax
     cdb:	89 c1                	mov    %eax,%ecx
     cdd:	83 c1 01             	add    $0x1,%ecx
     ce0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     ce3:	48 63 d0             	movslq %eax,%rdx
     ce6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     ceb:	e9 00 00 00 00       	jmpq   cf0 <printint64+0xd0>
     cf0:	8b 45 cc             	mov    -0x34(%rbp),%eax
     cf3:	83 c0 ff             	add    $0xffffffff,%eax
     cf6:	89 45 cc             	mov    %eax,-0x34(%rbp)
     cf9:	83 f8 00             	cmp    $0x0,%eax
     cfc:	0f 8c 16 00 00 00    	jl     d18 <printint64+0xf8>
    putc(fd, buf[i]);
     d02:	8b 7d fc             	mov    -0x4(%rbp),%edi
     d05:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     d09:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     d0e:	e8 dd fe ff ff       	callq  bf0 <putc>
  while(--i >= 0)
     d13:	e9 d8 ff ff ff       	jmpq   cf0 <printint64+0xd0>
}
     d18:	48 83 c4 50          	add    $0x50,%rsp
     d1c:	5d                   	pop    %rbp
     d1d:	c3                   	retq   
     d1e:	66 90                	xchg   %ax,%ax

0000000000000d20 <printint>:
{
     d20:	55                   	push   %rbp
     d21:	48 89 e5             	mov    %rsp,%rbp
     d24:	48 83 ec 30          	sub    $0x30,%rsp
     d28:	89 7d fc             	mov    %edi,-0x4(%rbp)
     d2b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     d2e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     d31:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     d34:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     d3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     d3f:	0f 84 1e 00 00 00    	je     d63 <printint+0x43>
     d45:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     d49:	0f 8d 14 00 00 00    	jge    d63 <printint+0x43>
     d4f:	31 c0                	xor    %eax,%eax
    neg = 1;
     d51:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     d58:	2b 45 f8             	sub    -0x8(%rbp),%eax
     d5b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     d5e:	e9 06 00 00 00       	jmpq   d69 <printint+0x49>
    x = xx;
     d63:	8b 45 f8             	mov    -0x8(%rbp),%eax
     d66:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     d69:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     d70:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     d73:	31 d2                	xor    %edx,%edx
     d75:	f7 75 f4             	divl   -0xc(%rbp)
     d78:	89 d2                	mov    %edx,%edx
     d7a:	89 d1                	mov    %edx,%ecx
     d7c:	40 8a 34 0d 20 1a 00 	mov    0x1a20(,%rcx,1),%sil
     d83:	00 
     d84:	8b 55 dc             	mov    -0x24(%rbp),%edx
     d87:	89 d7                	mov    %edx,%edi
     d89:	83 c7 01             	add    $0x1,%edi
     d8c:	89 7d dc             	mov    %edi,-0x24(%rbp)
     d8f:	48 63 ca             	movslq %edx,%rcx
     d92:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     d97:	8b 45 f4             	mov    -0xc(%rbp),%eax
     d9a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     d9d:	89 45 d0             	mov    %eax,-0x30(%rbp)
     da0:	89 c8                	mov    %ecx,%eax
     da2:	31 d2                	xor    %edx,%edx
     da4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     da7:	f7 f1                	div    %ecx
     da9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     dac:	83 f8 00             	cmp    $0x0,%eax
     daf:	0f 85 bb ff ff ff    	jne    d70 <printint+0x50>
  if(neg)
     db5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     db9:	0f 84 13 00 00 00    	je     dd2 <printint+0xb2>
    buf[i++] = '-';
     dbf:	8b 45 dc             	mov    -0x24(%rbp),%eax
     dc2:	89 c1                	mov    %eax,%ecx
     dc4:	83 c1 01             	add    $0x1,%ecx
     dc7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     dca:	48 63 d0             	movslq %eax,%rdx
     dcd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     dd2:	e9 00 00 00 00       	jmpq   dd7 <printint+0xb7>
     dd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
     dda:	83 c0 ff             	add    $0xffffffff,%eax
     ddd:	89 45 dc             	mov    %eax,-0x24(%rbp)
     de0:	83 f8 00             	cmp    $0x0,%eax
     de3:	0f 8c 16 00 00 00    	jl     dff <printint+0xdf>
    putc(fd, buf[i]);
     de9:	8b 7d fc             	mov    -0x4(%rbp),%edi
     dec:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     df0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     df5:	e8 f6 fd ff ff       	callq  bf0 <putc>
  while(--i >= 0)
     dfa:	e9 d8 ff ff ff       	jmpq   dd7 <printint+0xb7>
}
     dff:	48 83 c4 30          	add    $0x30,%rsp
     e03:	5d                   	pop    %rbp
     e04:	c3                   	retq   
     e05:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     e0c:	00 00 00 
     e0f:	90                   	nop

0000000000000e10 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     e10:	55                   	push   %rbp
     e11:	48 89 e5             	mov    %rsp,%rbp
     e14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e18:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     e1c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     e20:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     e24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e28:	48 89 c1             	mov    %rax,%rcx
     e2b:	48 83 c1 01          	add    $0x1,%rcx
     e2f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     e33:	8a 10                	mov    (%rax),%dl
     e35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e39:	48 89 c1             	mov    %rax,%rcx
     e3c:	48 83 c1 01          	add    $0x1,%rcx
     e40:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     e44:	88 10                	mov    %dl,(%rax)
     e46:	0f be f2             	movsbl %dl,%esi
     e49:	83 fe 00             	cmp    $0x0,%esi
     e4c:	0f 84 05 00 00 00    	je     e57 <strcpy+0x47>
     e52:	e9 cd ff ff ff       	jmpq   e24 <strcpy+0x14>
    ;
  return os;
     e57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e5b:	5d                   	pop    %rbp
     e5c:	c3                   	retq   
     e5d:	0f 1f 00             	nopl   (%rax)

0000000000000e60 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     e60:	55                   	push   %rbp
     e61:	48 89 e5             	mov    %rsp,%rbp
     e64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e6c:	31 c0                	xor    %eax,%eax
     e6e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     e70:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e74:	0f be 02             	movsbl (%rdx),%eax
     e77:	83 f8 00             	cmp    $0x0,%eax
     e7a:	88 4d ef             	mov    %cl,-0x11(%rbp)
     e7d:	0f 84 18 00 00 00    	je     e9b <strcmp+0x3b>
     e83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e87:	0f be 08             	movsbl (%rax),%ecx
     e8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e8e:	0f be 10             	movsbl (%rax),%edx
     e91:	39 d1                	cmp    %edx,%ecx
     e93:	40 0f 94 c6          	sete   %sil
     e97:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     e9b:	8a 45 ef             	mov    -0x11(%rbp),%al
     e9e:	a8 01                	test   $0x1,%al
     ea0:	0f 85 05 00 00 00    	jne    eab <strcmp+0x4b>
     ea6:	e9 1d 00 00 00       	jmpq   ec8 <strcmp+0x68>
    p++, q++;
     eab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     eaf:	48 83 c0 01          	add    $0x1,%rax
     eb3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     eb7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ebb:	48 83 c0 01          	add    $0x1,%rax
     ebf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     ec3:	e9 a4 ff ff ff       	jmpq   e6c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     ec8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ecc:	0f b6 08             	movzbl (%rax),%ecx
     ecf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ed3:	0f b6 10             	movzbl (%rax),%edx
     ed6:	29 d1                	sub    %edx,%ecx
     ed8:	89 c8                	mov    %ecx,%eax
     eda:	5d                   	pop    %rbp
     edb:	c3                   	retq   
     edc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000ee0 <strlen>:
}

uint
strlen(char *s)
{
     ee0:	55                   	push   %rbp
     ee1:	48 89 e5             	mov    %rsp,%rbp
     ee4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     ee8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     eef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ef3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     ef7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     efb:	0f 84 13 00 00 00    	je     f14 <strlen+0x34>
     f01:	e9 00 00 00 00       	jmpq   f06 <strlen+0x26>
     f06:	8b 45 f4             	mov    -0xc(%rbp),%eax
     f09:	83 c0 01             	add    $0x1,%eax
     f0c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     f0f:	e9 db ff ff ff       	jmpq   eef <strlen+0xf>
    ;
  return n;
     f14:	8b 45 f4             	mov    -0xc(%rbp),%eax
     f17:	5d                   	pop    %rbp
     f18:	c3                   	retq   
     f19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000f20 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     f20:	55                   	push   %rbp
     f21:	48 89 e5             	mov    %rsp,%rbp
     f24:	48 83 ec 10          	sub    $0x10,%rsp
     f28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f2c:	89 75 f4             	mov    %esi,-0xc(%rbp)
     f2f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     f32:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     f36:	8b 75 f4             	mov    -0xc(%rbp),%esi
     f39:	8b 55 f0             	mov    -0x10(%rbp),%edx
     f3c:	e8 0f 00 00 00       	callq  f50 <stosb>
  return dst;
     f41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f45:	48 83 c4 10          	add    $0x10,%rsp
     f49:	5d                   	pop    %rbp
     f4a:	c3                   	retq   
     f4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000f50 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     f50:	55                   	push   %rbp
     f51:	48 89 e5             	mov    %rsp,%rbp
     f54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f58:	89 75 f4             	mov    %esi,-0xc(%rbp)
     f5b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     f5e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     f62:	8b 55 f0             	mov    -0x10(%rbp),%edx
     f65:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     f68:	89 d1                	mov    %edx,%ecx
     f6a:	fc                   	cld    
     f6b:	f3 aa                	rep stos %al,%es:(%rdi)
     f6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f71:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     f74:	5d                   	pop    %rbp
     f75:	c3                   	retq   
     f76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     f7d:	00 00 00 

0000000000000f80 <strchr>:
}

char*
strchr(const char *s, char c)
{
     f80:	55                   	push   %rbp
     f81:	48 89 e5             	mov    %rsp,%rbp
     f84:	40 88 f0             	mov    %sil,%al
     f87:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     f8b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f92:	80 38 00             	cmpb   $0x0,(%rax)
     f95:	0f 84 36 00 00 00    	je     fd1 <strchr+0x51>
    if(*s == c)
     f9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f9f:	0f be 08             	movsbl (%rax),%ecx
     fa2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     fa6:	39 d1                	cmp    %edx,%ecx
     fa8:	0f 85 0d 00 00 00    	jne    fbb <strchr+0x3b>
      return (char*)s;
     fae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fb2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     fb6:	e9 1e 00 00 00       	jmpq   fd9 <strchr+0x59>
    if(*s == c)
     fbb:	e9 00 00 00 00       	jmpq   fc0 <strchr+0x40>
  for(; *s; s++)
     fc0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fc4:	48 83 c0 01          	add    $0x1,%rax
     fc8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     fcc:	e9 bd ff ff ff       	jmpq   f8e <strchr+0xe>
  return 0;
     fd1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     fd8:	00 
}
     fd9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     fdd:	5d                   	pop    %rbp
     fde:	c3                   	retq   
     fdf:	90                   	nop

0000000000000fe0 <gets>:

char*
gets(char *buf, int max)
{
     fe0:	55                   	push   %rbp
     fe1:	48 89 e5             	mov    %rsp,%rbp
     fe4:	48 83 ec 20          	sub    $0x20,%rsp
     fe8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     fec:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     fef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     ff6:	8b 45 f0             	mov    -0x10(%rbp),%eax
     ff9:	83 c0 01             	add    $0x1,%eax
     ffc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     fff:	0f 8d 5e 00 00 00    	jge    1063 <gets+0x83>
    1005:	31 ff                	xor    %edi,%edi
    1007:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
    100b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
    1010:	e8 cb 01 00 00       	callq  11e0 <read>
    1015:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
    1018:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    101c:	0f 8d 05 00 00 00    	jge    1027 <gets+0x47>
      break;
    1022:	e9 3c 00 00 00       	jmpq   1063 <gets+0x83>
    buf[i++] = c;
    1027:	8a 45 eb             	mov    -0x15(%rbp),%al
    102a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    102e:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1031:	89 d6                	mov    %edx,%esi
    1033:	83 c6 01             	add    $0x1,%esi
    1036:	89 75 f0             	mov    %esi,-0x10(%rbp)
    1039:	48 63 fa             	movslq %edx,%rdi
    103c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
    103f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
    1043:	83 fa 0a             	cmp    $0xa,%edx
    1046:	0f 84 0d 00 00 00    	je     1059 <gets+0x79>
    104c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
    1050:	83 f8 0d             	cmp    $0xd,%eax
    1053:	0f 85 05 00 00 00    	jne    105e <gets+0x7e>
      break;
    1059:	e9 05 00 00 00       	jmpq   1063 <gets+0x83>
  for(i=0; i+1 < max; ){
    105e:	e9 93 ff ff ff       	jmpq   ff6 <gets+0x16>
  }
  buf[i] = '\0';
    1063:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1067:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
    106b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
    106f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1073:	48 83 c4 20          	add    $0x20,%rsp
    1077:	5d                   	pop    %rbp
    1078:	c3                   	retq   
    1079:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001080 <stat>:
}

int
stat(char *n, struct stat *st)
{
    1080:	55                   	push   %rbp
    1081:	48 89 e5             	mov    %rsp,%rbp
    1084:	48 83 ec 30          	sub    $0x30,%rsp
    1088:	31 c0                	xor    %eax,%eax
    108a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    108e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1092:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    1096:	89 c6                	mov    %eax,%esi
    1098:	e8 6b 01 00 00       	callq  1208 <open>
    109d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
    10a0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    10a4:	0f 8d 0c 00 00 00    	jge    10b6 <stat+0x36>
    return -1;
    10aa:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    10b1:	e9 20 00 00 00       	jmpq   10d6 <stat+0x56>
  r = fstat(fd, st);
    10b6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    10b9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    10bd:	e8 5e 01 00 00       	callq  1220 <fstat>
    10c2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
    10c5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    10c8:	e8 23 01 00 00       	callq  11f0 <close>
  return r;
    10cd:	8b 7d e0             	mov    -0x20(%rbp),%edi
    10d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
    10d3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
    10d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    10d9:	48 83 c4 30          	add    $0x30,%rsp
    10dd:	5d                   	pop    %rbp
    10de:	c3                   	retq   
    10df:	90                   	nop

00000000000010e0 <atoi>:

int
atoi(const char *s)
{
    10e0:	55                   	push   %rbp
    10e1:	48 89 e5             	mov    %rsp,%rbp
    10e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
    10e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    10ef:	31 c0                	xor    %eax,%eax
    10f1:	88 c1                	mov    %al,%cl
    10f3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
    10f8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    10fc:	0f be 32             	movsbl (%rdx),%esi
    10ff:	39 f0                	cmp    %esi,%eax
    1101:	88 4d f3             	mov    %cl,-0xd(%rbp)
    1104:	0f 8f 10 00 00 00    	jg     111a <atoi+0x3a>
    110a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    110e:	0f be 08             	movsbl (%rax),%ecx
    1111:	83 f9 39             	cmp    $0x39,%ecx
    1114:	0f 9e c2             	setle  %dl
    1117:	88 55 f3             	mov    %dl,-0xd(%rbp)
    111a:	8a 45 f3             	mov    -0xd(%rbp),%al
    111d:	a8 01                	test   $0x1,%al
    111f:	0f 85 05 00 00 00    	jne    112a <atoi+0x4a>
    1125:	e9 23 00 00 00       	jmpq   114d <atoi+0x6d>
    n = n*10 + *s++ - '0';
    112a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
    112e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1132:	48 89 ca             	mov    %rcx,%rdx
    1135:	48 83 c2 01          	add    $0x1,%rdx
    1139:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    113d:	0f be 31             	movsbl (%rcx),%esi
    1140:	01 f0                	add    %esi,%eax
    1142:	83 e8 30             	sub    $0x30,%eax
    1145:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
    1148:	e9 a2 ff ff ff       	jmpq   10ef <atoi+0xf>
  return n;
    114d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1150:	5d                   	pop    %rbp
    1151:	c3                   	retq   
    1152:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1159:	1f 84 00 00 00 00 00 

0000000000001160 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1160:	55                   	push   %rbp
    1161:	48 89 e5             	mov    %rsp,%rbp
    1164:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1168:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    116c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
    116f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1173:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
    1177:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    117b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
    117f:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1182:	89 c1                	mov    %eax,%ecx
    1184:	83 c1 ff             	add    $0xffffffff,%ecx
    1187:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    118a:	83 f8 00             	cmp    $0x0,%eax
    118d:	0f 8e 27 00 00 00    	jle    11ba <memmove+0x5a>
    *dst++ = *src++;
    1193:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1197:	48 89 c1             	mov    %rax,%rcx
    119a:	48 83 c1 01          	add    $0x1,%rcx
    119e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    11a2:	8a 10                	mov    (%rax),%dl
    11a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11a8:	48 89 c1             	mov    %rax,%rcx
    11ab:	48 83 c1 01          	add    $0x1,%rcx
    11af:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    11b3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
    11b5:	e9 c5 ff ff ff       	jmpq   117f <memmove+0x1f>
  return vdst;
    11ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11be:	5d                   	pop    %rbp
    11bf:	c3                   	retq   

00000000000011c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    11c0:	b8 01 00 00 00       	mov    $0x1,%eax
    11c5:	cd 40                	int    $0x40
    11c7:	c3                   	retq   

00000000000011c8 <exit>:
SYSCALL(exit)
    11c8:	b8 02 00 00 00       	mov    $0x2,%eax
    11cd:	cd 40                	int    $0x40
    11cf:	c3                   	retq   

00000000000011d0 <wait>:
SYSCALL(wait)
    11d0:	b8 03 00 00 00       	mov    $0x3,%eax
    11d5:	cd 40                	int    $0x40
    11d7:	c3                   	retq   

00000000000011d8 <pipe>:
SYSCALL(pipe)
    11d8:	b8 04 00 00 00       	mov    $0x4,%eax
    11dd:	cd 40                	int    $0x40
    11df:	c3                   	retq   

00000000000011e0 <read>:
SYSCALL(read)
    11e0:	b8 05 00 00 00       	mov    $0x5,%eax
    11e5:	cd 40                	int    $0x40
    11e7:	c3                   	retq   

00000000000011e8 <write>:
SYSCALL(write)
    11e8:	b8 10 00 00 00       	mov    $0x10,%eax
    11ed:	cd 40                	int    $0x40
    11ef:	c3                   	retq   

00000000000011f0 <close>:
SYSCALL(close)
    11f0:	b8 15 00 00 00       	mov    $0x15,%eax
    11f5:	cd 40                	int    $0x40
    11f7:	c3                   	retq   

00000000000011f8 <kill>:
SYSCALL(kill)
    11f8:	b8 06 00 00 00       	mov    $0x6,%eax
    11fd:	cd 40                	int    $0x40
    11ff:	c3                   	retq   

0000000000001200 <exec>:
SYSCALL(exec)
    1200:	b8 07 00 00 00       	mov    $0x7,%eax
    1205:	cd 40                	int    $0x40
    1207:	c3                   	retq   

0000000000001208 <open>:
SYSCALL(open)
    1208:	b8 0f 00 00 00       	mov    $0xf,%eax
    120d:	cd 40                	int    $0x40
    120f:	c3                   	retq   

0000000000001210 <mknod>:
SYSCALL(mknod)
    1210:	b8 11 00 00 00       	mov    $0x11,%eax
    1215:	cd 40                	int    $0x40
    1217:	c3                   	retq   

0000000000001218 <unlink>:
SYSCALL(unlink)
    1218:	b8 12 00 00 00       	mov    $0x12,%eax
    121d:	cd 40                	int    $0x40
    121f:	c3                   	retq   

0000000000001220 <fstat>:
SYSCALL(fstat)
    1220:	b8 08 00 00 00       	mov    $0x8,%eax
    1225:	cd 40                	int    $0x40
    1227:	c3                   	retq   

0000000000001228 <link>:
SYSCALL(link)
    1228:	b8 13 00 00 00       	mov    $0x13,%eax
    122d:	cd 40                	int    $0x40
    122f:	c3                   	retq   

0000000000001230 <mkdir>:
SYSCALL(mkdir)
    1230:	b8 14 00 00 00       	mov    $0x14,%eax
    1235:	cd 40                	int    $0x40
    1237:	c3                   	retq   

0000000000001238 <chdir>:
SYSCALL(chdir)
    1238:	b8 09 00 00 00       	mov    $0x9,%eax
    123d:	cd 40                	int    $0x40
    123f:	c3                   	retq   

0000000000001240 <dup>:
SYSCALL(dup)
    1240:	b8 0a 00 00 00       	mov    $0xa,%eax
    1245:	cd 40                	int    $0x40
    1247:	c3                   	retq   

0000000000001248 <getpid>:
SYSCALL(getpid)
    1248:	b8 0b 00 00 00       	mov    $0xb,%eax
    124d:	cd 40                	int    $0x40
    124f:	c3                   	retq   

0000000000001250 <sbrk>:
SYSCALL(sbrk)
    1250:	b8 0c 00 00 00       	mov    $0xc,%eax
    1255:	cd 40                	int    $0x40
    1257:	c3                   	retq   

0000000000001258 <sleep>:
SYSCALL(sleep)
    1258:	b8 0d 00 00 00       	mov    $0xd,%eax
    125d:	cd 40                	int    $0x40
    125f:	c3                   	retq   

0000000000001260 <uptime>:
SYSCALL(uptime)
    1260:	b8 0e 00 00 00       	mov    $0xe,%eax
    1265:	cd 40                	int    $0x40
    1267:	c3                   	retq   

0000000000001268 <sysinfo>:
SYSCALL(sysinfo)
    1268:	b8 16 00 00 00       	mov    $0x16,%eax
    126d:	cd 40                	int    $0x40
    126f:	c3                   	retq   

0000000000001270 <mmap>:
SYSCALL(mmap)
    1270:	b8 17 00 00 00       	mov    $0x17,%eax
    1275:	cd 40                	int    $0x40
    1277:	c3                   	retq   

0000000000001278 <munmap>:
SYSCALL(munmap)
    1278:	b8 18 00 00 00       	mov    $0x18,%eax
    127d:	cd 40                	int    $0x40
    127f:	c3                   	retq   

0000000000001280 <crashn>:
SYSCALL(crashn)
    1280:	b8 19 00 00 00       	mov    $0x19,%eax
    1285:	cd 40                	int    $0x40
    1287:	c3                   	retq   
    1288:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    128f:	00 

0000000000001290 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1290:	55                   	push   %rbp
    1291:	48 89 e5             	mov    %rsp,%rbp
    1294:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1298:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    129c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    12a0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12a4:	48 8b 3c 25 40 1a 00 	mov    0x1a40,%rdi
    12ab:	00 
    12ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    12b0:	31 c0                	xor    %eax,%eax
    12b2:	88 c1                	mov    %al,%cl
    12b4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    12b8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    12bc:	88 4d e7             	mov    %cl,-0x19(%rbp)
    12bf:	0f 86 11 00 00 00    	jbe    12d6 <free+0x46>
    12c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12c9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    12cd:	48 3b 01             	cmp    (%rcx),%rax
    12d0:	0f 92 c2             	setb   %dl
    12d3:	88 55 e7             	mov    %dl,-0x19(%rbp)
    12d6:	8a 45 e7             	mov    -0x19(%rbp),%al
    12d9:	34 ff                	xor    $0xff,%al
    12db:	a8 01                	test   $0x1,%al
    12dd:	0f 85 05 00 00 00    	jne    12e8 <free+0x58>
    12e3:	e9 4a 00 00 00       	jmpq   1332 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12ec:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    12f0:	48 3b 01             	cmp    (%rcx),%rax
    12f3:	0f 82 24 00 00 00    	jb     131d <free+0x8d>
    12f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12fd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1301:	0f 87 11 00 00 00    	ja     1318 <free+0x88>
    1307:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    130b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    130f:	48 3b 01             	cmp    (%rcx),%rax
    1312:	0f 83 05 00 00 00    	jae    131d <free+0x8d>
      break;
    1318:	e9 15 00 00 00       	jmpq   1332 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    131d:	e9 00 00 00 00       	jmpq   1322 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1322:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1326:	48 8b 00             	mov    (%rax),%rax
    1329:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    132d:	e9 7e ff ff ff       	jmpq   12b0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1332:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1336:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    133a:	8b 51 08             	mov    0x8(%rcx),%edx
    133d:	89 d1                	mov    %edx,%ecx
    133f:	48 c1 e1 04          	shl    $0x4,%rcx
    1343:	48 01 c8             	add    %rcx,%rax
    1346:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    134a:	48 3b 01             	cmp    (%rcx),%rax
    134d:	0f 85 2a 00 00 00    	jne    137d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1353:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1357:	48 8b 00             	mov    (%rax),%rax
    135a:	8b 48 08             	mov    0x8(%rax),%ecx
    135d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1361:	03 48 08             	add    0x8(%rax),%ecx
    1364:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1367:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    136b:	48 8b 00             	mov    (%rax),%rax
    136e:	48 8b 00             	mov    (%rax),%rax
    1371:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1375:	48 89 02             	mov    %rax,(%rdx)
  } else
    1378:	e9 0e 00 00 00       	jmpq   138b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    137d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1381:	48 8b 00             	mov    (%rax),%rax
    1384:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1388:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    138b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    138f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1393:	8b 51 08             	mov    0x8(%rcx),%edx
    1396:	89 d1                	mov    %edx,%ecx
    1398:	48 c1 e1 04          	shl    $0x4,%rcx
    139c:	48 01 c8             	add    %rcx,%rax
    139f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    13a3:	0f 85 24 00 00 00    	jne    13cd <free+0x13d>
    p->s.size += bp->s.size;
    13a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13ad:	8b 48 08             	mov    0x8(%rax),%ecx
    13b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13b4:	03 48 08             	add    0x8(%rax),%ecx
    13b7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    13ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13be:	48 8b 00             	mov    (%rax),%rax
    13c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    13c5:	48 89 02             	mov    %rax,(%rdx)
  } else
    13c8:	e9 0b 00 00 00       	jmpq   13d8 <free+0x148>
    p->s.ptr = bp;
    13cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13d1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    13d5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    13d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13dc:	48 89 04 25 40 1a 00 	mov    %rax,0x1a40
    13e3:	00 
}
    13e4:	5d                   	pop    %rbp
    13e5:	c3                   	retq   
    13e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    13ed:	00 00 00 

00000000000013f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13f0:	55                   	push   %rbp
    13f1:	48 89 e5             	mov    %rsp,%rbp
    13f4:	48 83 ec 30          	sub    $0x30,%rsp
    13f8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13fb:	8b 7d f4             	mov    -0xc(%rbp),%edi
    13fe:	89 f8                	mov    %edi,%eax
    1400:	48 83 c0 10          	add    $0x10,%rax
    1404:	48 83 e8 01          	sub    $0x1,%rax
    1408:	48 c1 e8 04          	shr    $0x4,%rax
    140c:	48 83 c0 01          	add    $0x1,%rax
    1410:	89 c7                	mov    %eax,%edi
    1412:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1415:	48 8b 04 25 40 1a 00 	mov    0x1a40,%rax
    141c:	00 
    141d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1421:	48 83 f8 00          	cmp    $0x0,%rax
    1425:	0f 85 29 00 00 00    	jne    1454 <malloc+0x64>
    142b:	48 b8 48 1a 00 00 00 	movabs $0x1a48,%rax
    1432:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1435:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1439:	48 89 04 25 40 1a 00 	mov    %rax,0x1a40
    1440:	00 
    1441:	48 89 04 25 48 1a 00 	mov    %rax,0x1a48
    1448:	00 
    base.s.size = 0;
    1449:	c7 04 25 50 1a 00 00 	movl   $0x0,0x1a50
    1450:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1454:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1458:	48 8b 00             	mov    (%rax),%rax
    145b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    145f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1463:	8b 48 08             	mov    0x8(%rax),%ecx
    1466:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1469:	0f 82 73 00 00 00    	jb     14e2 <malloc+0xf2>
      if(p->s.size == nunits)
    146f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1473:	8b 48 08             	mov    0x8(%rax),%ecx
    1476:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1479:	0f 85 13 00 00 00    	jne    1492 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    147f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1483:	48 8b 00             	mov    (%rax),%rax
    1486:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    148a:	48 89 01             	mov    %rax,(%rcx)
    148d:	e9 33 00 00 00       	jmpq   14c5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    1492:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1495:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1499:	8b 51 08             	mov    0x8(%rcx),%edx
    149c:	29 c2                	sub    %eax,%edx
    149e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    14a1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    14a5:	8b 41 08             	mov    0x8(%rcx),%eax
    14a8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    14ac:	89 c0                	mov    %eax,%eax
    14ae:	89 c6                	mov    %eax,%esi
    14b0:	48 c1 e6 04          	shl    $0x4,%rsi
    14b4:	48 01 f1             	add    %rsi,%rcx
    14b7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    14bb:	8b 45 dc             	mov    -0x24(%rbp),%eax
    14be:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    14c2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    14c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14c9:	48 89 04 25 40 1a 00 	mov    %rax,0x1a40
    14d0:	00 
      return (void*)(p + 1);
    14d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14d5:	48 83 c0 10          	add    $0x10,%rax
    14d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    14dd:	e9 57 00 00 00       	jmpq   1539 <malloc+0x149>
    }
    if(p == freep)
    14e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14e6:	48 3b 04 25 40 1a 00 	cmp    0x1a40,%rax
    14ed:	00 
    14ee:	0f 85 28 00 00 00    	jne    151c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    14f4:	8b 7d dc             	mov    -0x24(%rbp),%edi
    14f7:	e8 54 00 00 00       	callq  1550 <morecore>
    14fc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1500:	48 83 f8 00          	cmp    $0x0,%rax
    1504:	0f 85 0d 00 00 00    	jne    1517 <malloc+0x127>
        return 0;
    150a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1511:	00 
    1512:	e9 22 00 00 00       	jmpq   1539 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1517:	e9 00 00 00 00       	jmpq   151c <malloc+0x12c>
  }
    151c:	e9 00 00 00 00       	jmpq   1521 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1521:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1525:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    152d:	48 8b 00             	mov    (%rax),%rax
    1530:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1534:	e9 26 ff ff ff       	jmpq   145f <malloc+0x6f>
    1539:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    153d:	48 83 c4 30          	add    $0x30,%rsp
    1541:	5d                   	pop    %rbp
    1542:	c3                   	retq   
    1543:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    154a:	84 00 00 00 00 00 

0000000000001550 <morecore>:
{
    1550:	55                   	push   %rbp
    1551:	48 89 e5             	mov    %rsp,%rbp
    1554:	48 83 ec 20          	sub    $0x20,%rsp
    1558:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    155b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1562:	0f 83 07 00 00 00    	jae    156f <morecore+0x1f>
    nu = 4096;
    1568:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    156f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1572:	89 c1                	mov    %eax,%ecx
    1574:	48 c1 e1 04          	shl    $0x4,%rcx
    1578:	89 c8                	mov    %ecx,%eax
    157a:	89 c7                	mov    %eax,%edi
    157c:	e8 cf fc ff ff       	callq  1250 <sbrk>
    1581:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1588:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    158c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1590:	0f 85 0d 00 00 00    	jne    15a3 <morecore+0x53>
    return 0;
    1596:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    159d:	00 
    159e:	e9 2e 00 00 00       	jmpq   15d1 <morecore+0x81>
  hp = (Header*)p;
    15a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    15a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    15ab:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    15ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    15b2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    15b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    15b9:	48 83 c0 10          	add    $0x10,%rax
    15bd:	48 89 c7             	mov    %rax,%rdi
    15c0:	e8 cb fc ff ff       	callq  1290 <free>
  return freep;
    15c5:	48 8b 04 25 40 1a 00 	mov    0x1a40,%rax
    15cc:	00 
    15cd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    15d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15d5:	48 83 c4 20          	add    $0x20,%rsp
    15d9:	5d                   	pop    %rbp
    15da:	c3                   	retq   
