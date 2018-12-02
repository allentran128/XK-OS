
out/user/_sh:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
       b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  //printf(1, "running cmd %p w/ type %d.\n", cmd, cmd->type);

  if(cmd == 0)
       f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
      14:	0f 85 08 00 00 00    	jne    22 <runcmd+0x22>
    exit();
      1a:	e8 49 1b 00 00       	callq  1b68 <exit>
      1f:	89 45 c4             	mov    %eax,-0x3c(%rbp)

  switch(cmd->type){
      22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      26:	8b 08                	mov    (%rax),%ecx
      28:	ff c9                	dec    %ecx
      2a:	89 c8                	mov    %ecx,%eax
      2c:	83 e9 04             	sub    $0x4,%ecx
      2f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
      33:	89 4d b4             	mov    %ecx,-0x4c(%rbp)
      36:	0f 87 0e 00 00 00    	ja     4a <runcmd+0x4a>
      3c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
      40:	48 8b 0c c5 80 1f 00 	mov    0x1f80(,%rax,8),%rcx
      47:	00 
      48:	ff e1                	jmpq   *%rcx
      4a:	48 bf d0 1f 00 00 00 	movabs $0x1fd0,%rdi
      51:	00 00 00 
  default:
    panic("runcmd");
      54:	e8 37 02 00 00       	callq  290 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      5d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    if(ecmd->argv[0] == 0)
      61:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      65:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
      6a:	0f 85 08 00 00 00    	jne    78 <runcmd+0x78>
      exit();
      70:	e8 f3 1a 00 00       	callq  1b68 <exit>
      75:	89 45 b0             	mov    %eax,-0x50(%rbp)
    exec(ecmd->argv[0], ecmd->argv);
      78:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      7c:	48 8b 78 08          	mov    0x8(%rax),%rdi
      80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      84:	48 83 c0 08          	add    $0x8,%rax
      88:	48 89 c6             	mov    %rax,%rsi
      8b:	e8 10 1b 00 00       	callq  1ba0 <exec>
      90:	bf 02 00 00 00       	mov    $0x2,%edi
      95:	48 be d7 1f 00 00 00 	movabs $0x1fd7,%rsi
      9c:	00 00 00 
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      9f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
      a3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
      a7:	89 45 ac             	mov    %eax,-0x54(%rbp)
      aa:	b0 00                	mov    $0x0,%al
      ac:	e8 7f 10 00 00       	callq  1130 <printf>
    break;
      b1:	e9 c0 01 00 00       	jmpq   276 <runcmd+0x276>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      ba:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    close(rcmd->fd);
      be:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
      c2:	8b 78 24             	mov    0x24(%rax),%edi
      c5:	e8 c6 1a 00 00       	callq  1b90 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      ca:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
      ce:	48 8b 79 10          	mov    0x10(%rcx),%rdi
      d2:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
      d6:	8b 71 20             	mov    0x20(%rcx),%esi
      d9:	89 45 a8             	mov    %eax,-0x58(%rbp)
      dc:	e8 c7 1a 00 00       	callq  1ba8 <open>
      e1:	83 f8 00             	cmp    $0x0,%eax
      e4:	0f 8d 26 00 00 00    	jge    110 <runcmd+0x110>
      ea:	bf 02 00 00 00       	mov    $0x2,%edi
      ef:	48 be e7 1f 00 00 00 	movabs $0x1fe7,%rsi
      f6:	00 00 00 
      printf(2, "open %s failed\n", rcmd->file);
      f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
      fd:	48 8b 50 10          	mov    0x10(%rax),%rdx
     101:	b0 00                	mov    $0x0,%al
     103:	e8 28 10 00 00       	callq  1130 <printf>
      exit();
     108:	e8 5b 1a 00 00       	callq  1b68 <exit>
     10d:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    }
    runcmd(rcmd->cmd);
     110:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     114:	48 8b 78 08          	mov    0x8(%rax),%rdi
     118:	e8 e3 fe ff ff       	callq  0 <runcmd>
    break;
     11d:	e9 54 01 00 00       	jmpq   276 <runcmd+0x276>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     122:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     126:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    if(fork1() == 0)
     12a:	e8 91 01 00 00       	callq  2c0 <fork1>
     12f:	83 f8 00             	cmp    $0x0,%eax
     132:	0f 85 0d 00 00 00    	jne    145 <runcmd+0x145>
      runcmd(lcmd->left);
     138:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     13c:	48 8b 78 08          	mov    0x8(%rax),%rdi
     140:	e8 bb fe ff ff       	callq  0 <runcmd>
    wait();
     145:	e8 26 1a 00 00       	callq  1b70 <wait>
    runcmd(lcmd->right);
     14a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
     14e:	48 8b 79 10          	mov    0x10(%rcx),%rdi
     152:	89 45 a0             	mov    %eax,-0x60(%rbp)
     155:	e8 a6 fe ff ff       	callq  0 <runcmd>
    break;
     15a:	e9 17 01 00 00       	jmpq   276 <runcmd+0x276>
     15f:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     163:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     167:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    if(pipe(p) < 0)
     16b:	e8 08 1a 00 00       	callq  1b78 <pipe>
     170:	83 f8 00             	cmp    $0x0,%eax
     173:	0f 8d 0f 00 00 00    	jge    188 <runcmd+0x188>
     179:	48 bf f7 1f 00 00 00 	movabs $0x1ff7,%rdi
     180:	00 00 00 
      panic("pipe");
     183:	e8 08 01 00 00       	callq  290 <panic>
    if(fork1() == 0){
     188:	e8 33 01 00 00       	callq  2c0 <fork1>
     18d:	83 f8 00             	cmp    $0x0,%eax
     190:	0f 85 3b 00 00 00    	jne    1d1 <runcmd+0x1d1>
     196:	bf 01 00 00 00       	mov    $0x1,%edi
      close(1);
     19b:	e8 f0 19 00 00       	callq  1b90 <close>
      dup(p[1]);
     1a0:	8b 7d f4             	mov    -0xc(%rbp),%edi
     1a3:	89 45 9c             	mov    %eax,-0x64(%rbp)
     1a6:	e8 35 1a 00 00       	callq  1be0 <dup>
      close(p[0]);
     1ab:	8b 7d f0             	mov    -0x10(%rbp),%edi
     1ae:	89 45 98             	mov    %eax,-0x68(%rbp)
     1b1:	e8 da 19 00 00       	callq  1b90 <close>
      close(p[1]);
     1b6:	8b 7d f4             	mov    -0xc(%rbp),%edi
     1b9:	89 45 94             	mov    %eax,-0x6c(%rbp)
     1bc:	e8 cf 19 00 00       	callq  1b90 <close>
      runcmd(pcmd->left);
     1c1:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
     1c5:	48 8b 79 08          	mov    0x8(%rcx),%rdi
     1c9:	89 45 90             	mov    %eax,-0x70(%rbp)
     1cc:	e8 2f fe ff ff       	callq  0 <runcmd>
    }
    if(fork1() == 0){
     1d1:	e8 ea 00 00 00       	callq  2c0 <fork1>
     1d6:	83 f8 00             	cmp    $0x0,%eax
     1d9:	0f 85 38 00 00 00    	jne    217 <runcmd+0x217>
     1df:	31 ff                	xor    %edi,%edi
      close(0);
     1e1:	e8 aa 19 00 00       	callq  1b90 <close>
      dup(p[0]);
     1e6:	8b 7d f0             	mov    -0x10(%rbp),%edi
     1e9:	89 45 8c             	mov    %eax,-0x74(%rbp)
     1ec:	e8 ef 19 00 00       	callq  1be0 <dup>
      close(p[0]);
     1f1:	8b 7d f0             	mov    -0x10(%rbp),%edi
     1f4:	89 45 88             	mov    %eax,-0x78(%rbp)
     1f7:	e8 94 19 00 00       	callq  1b90 <close>
      close(p[1]);
     1fc:	8b 7d f4             	mov    -0xc(%rbp),%edi
     1ff:	89 45 84             	mov    %eax,-0x7c(%rbp)
     202:	e8 89 19 00 00       	callq  1b90 <close>
      runcmd(pcmd->right);
     207:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
     20b:	48 8b 79 10          	mov    0x10(%rcx),%rdi
     20f:	89 45 80             	mov    %eax,-0x80(%rbp)
     212:	e8 e9 fd ff ff       	callq  0 <runcmd>
    }
    close(p[0]);
     217:	8b 7d f0             	mov    -0x10(%rbp),%edi
     21a:	e8 71 19 00 00       	callq  1b90 <close>
    close(p[1]);
     21f:	8b 7d f4             	mov    -0xc(%rbp),%edi
     222:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
     228:	e8 63 19 00 00       	callq  1b90 <close>
    wait();
     22d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
     233:	e8 38 19 00 00       	callq  1b70 <wait>
    wait();
     238:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
     23e:	e8 2d 19 00 00       	callq  1b70 <wait>
    break;
     243:	89 85 70 ff ff ff    	mov    %eax,-0x90(%rbp)
     249:	e9 28 00 00 00       	jmpq   276 <runcmd+0x276>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     24e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     252:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(fork1() == 0)
     256:	e8 65 00 00 00       	callq  2c0 <fork1>
     25b:	83 f8 00             	cmp    $0x0,%eax
     25e:	0f 85 0d 00 00 00    	jne    271 <runcmd+0x271>
      runcmd(bcmd->cmd);
     264:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     268:	48 8b 78 08          	mov    0x8(%rax),%rdi
     26c:	e8 8f fd ff ff       	callq  0 <runcmd>
    break;
     271:	e9 00 00 00 00       	jmpq   276 <runcmd+0x276>
  }
  exit();
     276:	e8 ed 18 00 00       	callq  1b68 <exit>
     27b:	89 85 6c ff ff ff    	mov    %eax,-0x94(%rbp)
     281:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     288:	0f 1f 84 00 00 00 00 
     28f:	00 

0000000000000290 <panic>:
  exit();
}

void
panic(char *s)
{
     290:	55                   	push   %rbp
     291:	48 89 e5             	mov    %rsp,%rbp
     294:	48 83 ec 10          	sub    $0x10,%rsp
     298:	b8 02 00 00 00       	mov    $0x2,%eax
     29d:	48 be 25 20 00 00 00 	movabs $0x2025,%rsi
     2a4:	00 00 00 
     2a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  printf(2, "%s\n", s);
     2ab:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     2af:	89 c7                	mov    %eax,%edi
     2b1:	b0 00                	mov    $0x0,%al
     2b3:	e8 78 0e 00 00       	callq  1130 <printf>
  exit();
     2b8:	e8 ab 18 00 00       	callq  1b68 <exit>
     2bd:	89 45 f4             	mov    %eax,-0xc(%rbp)

00000000000002c0 <fork1>:
}

int
fork1(void)
{
     2c0:	55                   	push   %rbp
     2c1:	48 89 e5             	mov    %rsp,%rbp
  int pid;

  pid = fork();
     2c4:	48 83 ec 10          	sub    $0x10,%rsp
     2c8:	e8 93 18 00 00       	callq  1b60 <fork>
     2cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  if(pid == -1)
     2d0:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%rbp)
     2d4:	0f 85 0f 00 00 00    	jne    2e9 <fork1+0x29>
     2da:	48 bf 15 20 00 00 00 	movabs $0x2015,%rdi
     2e1:	00 00 00 
    panic("fork");
     2e4:	e8 a7 ff ff ff       	callq  290 <panic>
  return pid;
     2e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
     2ec:	48 83 c4 10          	add    $0x10,%rsp
     2f0:	5d                   	pop    %rbp
     2f1:	c3                   	retq   
     2f2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     2f9:	1f 84 00 00 00 00 00 

0000000000000300 <getcmd>:
{
     300:	55                   	push   %rbp
     301:	48 89 e5             	mov    %rsp,%rbp
     304:	48 83 ec 30          	sub    $0x30,%rsp
     308:	b8 02 00 00 00       	mov    $0x2,%eax
     30d:	48 b9 fc 1f 00 00 00 	movabs $0x1ffc,%rcx
     314:	00 00 00 
     317:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     31b:	89 75 ec             	mov    %esi,-0x14(%rbp)
  printf(2, "$ ");
     31e:	89 c7                	mov    %eax,%edi
     320:	48 89 ce             	mov    %rcx,%rsi
     323:	b0 00                	mov    $0x0,%al
     325:	e8 06 0e 00 00       	callq  1130 <printf>
     32a:	31 f6                	xor    %esi,%esi
  memset(buf, 0, nbuf);
     32c:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     330:	8b 55 ec             	mov    -0x14(%rbp),%edx
     333:	e8 88 15 00 00       	callq  18c0 <memset>
  gets(buf, nbuf);
     338:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     33c:	8b 75 ec             	mov    -0x14(%rbp),%esi
     33f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     343:	e8 38 16 00 00       	callq  1980 <gets>
  if(buf[0] == 0) // EOF
     348:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     34c:	0f be 11             	movsbl (%rcx),%edx
     34f:	83 fa 00             	cmp    $0x0,%edx
     352:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     356:	0f 85 0c 00 00 00    	jne    368 <getcmd+0x68>
    return -1;
     35c:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     363:	e9 07 00 00 00       	jmpq   36f <getcmd+0x6f>
  return 0;
     368:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
}
     36f:	8b 45 fc             	mov    -0x4(%rbp),%eax
     372:	48 83 c4 30          	add    $0x30,%rsp
     376:	5d                   	pop    %rbp
     377:	c3                   	retq   
     378:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     37f:	00 

0000000000000380 <main>:
{
     380:	55                   	push   %rbp
     381:	48 89 e5             	mov    %rsp,%rbp
     384:	48 83 ec 20          	sub    $0x20,%rsp
     388:	48 bf ff 1f 00 00 00 	movabs $0x1fff,%rdi
     38f:	00 00 00 
     392:	be 02 00 00 00       	mov    $0x2,%esi
  while((fd = open("console", O_RDWR)) >= 0){
     397:	e8 0c 18 00 00       	callq  1ba8 <open>
     39c:	89 45 f8             	mov    %eax,-0x8(%rbp)
     39f:	83 f8 00             	cmp    $0x0,%eax
     3a2:	0f 8c 1f 00 00 00    	jl     3c7 <main+0x47>
    if(fd >= 3){
     3a8:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
     3ac:	0f 8c 10 00 00 00    	jl     3c2 <main+0x42>
      close(fd);
     3b2:	8b 7d f8             	mov    -0x8(%rbp),%edi
     3b5:	e8 d6 17 00 00       	callq  1b90 <close>
      break;
     3ba:	89 45 f4             	mov    %eax,-0xc(%rbp)
     3bd:	e9 05 00 00 00       	jmpq   3c7 <main+0x47>
  while((fd = open("console", O_RDWR)) >= 0){
     3c2:	e9 c1 ff ff ff       	jmpq   388 <main+0x8>
  while(getcmd(buf, sizeof(buf)) >= 0){
     3c7:	e9 00 00 00 00       	jmpq   3cc <main+0x4c>
     3cc:	48 bf f0 24 00 00 00 	movabs $0x24f0,%rdi
     3d3:	00 00 00 
     3d6:	be 64 00 00 00       	mov    $0x64,%esi
     3db:	e8 20 ff ff ff       	callq  300 <getcmd>
     3e0:	83 f8 00             	cmp    $0x0,%eax
     3e3:	0f 8c d0 00 00 00    	jl     4b9 <main+0x139>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     3e9:	0f be 04 25 f0 24 00 	movsbl 0x24f0,%eax
     3f0:	00 
     3f1:	83 f8 63             	cmp    $0x63,%eax
     3f4:	0f 85 88 00 00 00    	jne    482 <main+0x102>
     3fa:	0f be 04 25 f1 24 00 	movsbl 0x24f1,%eax
     401:	00 
     402:	83 f8 64             	cmp    $0x64,%eax
     405:	0f 85 77 00 00 00    	jne    482 <main+0x102>
     40b:	0f be 04 25 f2 24 00 	movsbl 0x24f2,%eax
     412:	00 
     413:	83 f8 20             	cmp    $0x20,%eax
     416:	0f 85 66 00 00 00    	jne    482 <main+0x102>
     41c:	48 bf f0 24 00 00 00 	movabs $0x24f0,%rdi
     423:	00 00 00 
      buf[strlen(buf)-1] = 0;  // chop \n
     426:	e8 55 14 00 00       	callq  1880 <strlen>
     42b:	48 bf f0 24 00 00 00 	movabs $0x24f0,%rdi
     432:	00 00 00 
     435:	48 83 c7 03          	add    $0x3,%rdi
     439:	83 e8 01             	sub    $0x1,%eax
     43c:	89 c0                	mov    %eax,%eax
     43e:	89 c1                	mov    %eax,%ecx
     440:	c6 04 0d f0 24 00 00 	movb   $0x0,0x24f0(,%rcx,1)
     447:	00 
      if(chdir(buf+3) < 0)
     448:	e8 8b 17 00 00       	callq  1bd8 <chdir>
     44d:	83 f8 00             	cmp    $0x0,%eax
     450:	0f 8d 27 00 00 00    	jge    47d <main+0xfd>
     456:	bf 02 00 00 00       	mov    $0x2,%edi
     45b:	48 be 07 20 00 00 00 	movabs $0x2007,%rsi
     462:	00 00 00 
     465:	48 b8 f0 24 00 00 00 	movabs $0x24f0,%rax
     46c:	00 00 00 
     46f:	48 83 c0 03          	add    $0x3,%rax
        printf(2, "cannot cd %s\n", buf+3);
     473:	48 89 c2             	mov    %rax,%rdx
     476:	b0 00                	mov    $0x0,%al
     478:	e8 b3 0c 00 00       	callq  1130 <printf>
      continue;
     47d:	e9 4a ff ff ff       	jmpq   3cc <main+0x4c>
    if(fork1() == 0) {
     482:	e8 39 fe ff ff       	callq  2c0 <fork1>
     487:	83 f8 00             	cmp    $0x0,%eax
     48a:	0f 85 1c 00 00 00    	jne    4ac <main+0x12c>
     490:	48 bf f0 24 00 00 00 	movabs $0x24f0,%rdi
     497:	00 00 00 
      runcmd(parsecmd(buf));
     49a:	e8 31 00 00 00       	callq  4d0 <parsecmd>
     49f:	48 89 c7             	mov    %rax,%rdi
     4a2:	e8 59 fb ff ff       	callq  0 <runcmd>
    } else {
     4a7:	e9 08 00 00 00       	jmpq   4b4 <main+0x134>
      wait();
     4ac:	e8 bf 16 00 00       	callq  1b70 <wait>
     4b1:	89 45 f0             	mov    %eax,-0x10(%rbp)
  while(getcmd(buf, sizeof(buf)) >= 0){
     4b4:	e9 13 ff ff ff       	jmpq   3cc <main+0x4c>
  exit();
     4b9:	e8 aa 16 00 00       	callq  1b68 <exit>
     4be:	89 45 ec             	mov    %eax,-0x14(%rbp)
     4c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     4c8:	0f 1f 84 00 00 00 00 
     4cf:	00 

00000000000004d0 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     4d0:	55                   	push   %rbp
     4d1:	48 89 e5             	mov    %rsp,%rbp
     4d4:	48 83 ec 30          	sub    $0x30,%rsp
     4d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     4dc:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     4e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     4e4:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
     4e8:	48 89 c7             	mov    %rax,%rdi
     4eb:	e8 90 13 00 00       	callq  1880 <strlen>
     4f0:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
     4f4:	89 c0                	mov    %eax,%eax
     4f6:	89 c1                	mov    %eax,%ecx
     4f8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     4fc:	48 01 ca             	add    %rcx,%rdx
     4ff:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  cmd = parseline(&s, es);
     503:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     507:	e8 e4 05 00 00       	callq  af0 <parseline>
     50c:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
     510:	48 ba e6 1f 00 00 00 	movabs $0x1fe6,%rdx
     517:	00 00 00 
     51a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  peek(&s, es, "");
     51e:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     522:	e8 09 05 00 00       	callq  a30 <peek>
  if(s != es){
     527:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     52b:	48 3b 4d f0          	cmp    -0x10(%rbp),%rcx
     52f:	89 45 dc             	mov    %eax,-0x24(%rbp)
     532:	0f 84 29 00 00 00    	je     561 <parsecmd+0x91>
     538:	bf 02 00 00 00       	mov    $0x2,%edi
     53d:	48 be 1a 20 00 00 00 	movabs $0x201a,%rsi
     544:	00 00 00 
    printf(2, "leftovers: %s\n", s);
     547:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     54b:	b0 00                	mov    $0x0,%al
     54d:	e8 de 0b 00 00       	callq  1130 <printf>
     552:	48 bf 29 20 00 00 00 	movabs $0x2029,%rdi
     559:	00 00 00 
    panic("syntax");
     55c:	e8 2f fd ff ff       	callq  290 <panic>
  }
  nulterminate(cmd);
     561:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     565:	e8 66 06 00 00       	callq  bd0 <nulterminate>
  //printf(1, "parsed cmd %p.\n", cmd);
  return cmd;
     56a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     56e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     572:	48 89 f8             	mov    %rdi,%rax
     575:	48 83 c4 30          	add    $0x30,%rsp
     579:	5d                   	pop    %rbp
     57a:	c3                   	retq   
     57b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000580 <execcmd>:
{
     580:	55                   	push   %rbp
     581:	48 89 e5             	mov    %rsp,%rbp
     584:	48 83 ec 10          	sub    $0x10,%rsp
     588:	bf a8 00 00 00       	mov    $0xa8,%edi
  cmd = malloc(sizeof(*cmd));
     58d:	e8 fe 17 00 00       	callq  1d90 <malloc>
     592:	31 f6                	xor    %esi,%esi
     594:	ba a8 00 00 00       	mov    $0xa8,%edx
     599:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  memset(cmd, 0, sizeof(*cmd));
     59d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     5a1:	48 89 c7             	mov    %rax,%rdi
     5a4:	e8 17 13 00 00       	callq  18c0 <memset>
  cmd->type = EXEC;
     5a9:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     5ad:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  return (struct cmd*)cmd;
     5b3:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     5b7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     5bb:	48 89 f8             	mov    %rdi,%rax
     5be:	48 83 c4 10          	add    $0x10,%rsp
     5c2:	5d                   	pop    %rbp
     5c3:	c3                   	retq   
     5c4:	66 66 66 2e 0f 1f 84 	data16 data16 nopw %cs:0x0(%rax,%rax,1)
     5cb:	00 00 00 00 00 

00000000000005d0 <redircmd>:
{
     5d0:	55                   	push   %rbp
     5d1:	48 89 e5             	mov    %rsp,%rbp
     5d4:	48 83 ec 30          	sub    $0x30,%rsp
     5d8:	b8 28 00 00 00       	mov    $0x28,%eax
     5dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     5e1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     5e5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     5e9:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
     5ec:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  cmd = malloc(sizeof(*cmd));
     5f0:	89 c7                	mov    %eax,%edi
     5f2:	e8 99 17 00 00       	callq  1d90 <malloc>
     5f7:	31 f6                	xor    %esi,%esi
     5f9:	ba 28 00 00 00       	mov    $0x28,%edx
     5fe:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  memset(cmd, 0, sizeof(*cmd));
     602:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     606:	48 89 c7             	mov    %rax,%rdi
     609:	e8 b2 12 00 00       	callq  18c0 <memset>
  cmd->type = REDIR;
     60e:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     612:	c7 07 02 00 00 00    	movl   $0x2,(%rdi)
  cmd->cmd = subcmd;
     618:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     61c:	4c 8b 4d d8          	mov    -0x28(%rbp),%r9
     620:	49 89 79 08          	mov    %rdi,0x8(%r9)
  cmd->file = file;
     624:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     628:	4c 8b 4d d8          	mov    -0x28(%rbp),%r9
     62c:	49 89 79 10          	mov    %rdi,0x10(%r9)
  cmd->efile = efile;
     630:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     634:	4c 8b 4d d8          	mov    -0x28(%rbp),%r9
     638:	49 89 79 18          	mov    %rdi,0x18(%r9)
  cmd->mode = mode;
     63c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     63f:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     643:	89 4f 20             	mov    %ecx,0x20(%rdi)
  cmd->fd = fd;
     646:	8b 4d e0             	mov    -0x20(%rbp),%ecx
     649:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     64d:	89 4f 24             	mov    %ecx,0x24(%rdi)
  return (struct cmd*)cmd;
     650:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     654:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     658:	48 89 f8             	mov    %rdi,%rax
     65b:	48 83 c4 30          	add    $0x30,%rsp
     65f:	5d                   	pop    %rbp
     660:	c3                   	retq   
     661:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     668:	0f 1f 84 00 00 00 00 
     66f:	00 

0000000000000670 <pipecmd>:
{
     670:	55                   	push   %rbp
     671:	48 89 e5             	mov    %rsp,%rbp
     674:	48 83 ec 20          	sub    $0x20,%rsp
     678:	b8 18 00 00 00       	mov    $0x18,%eax
     67d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     681:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  cmd = malloc(sizeof(*cmd));
     685:	89 c7                	mov    %eax,%edi
     687:	e8 04 17 00 00       	callq  1d90 <malloc>
     68c:	31 f6                	xor    %esi,%esi
     68e:	ba 18 00 00 00       	mov    $0x18,%edx
     693:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  memset(cmd, 0, sizeof(*cmd));
     697:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     69b:	48 89 c7             	mov    %rax,%rdi
     69e:	e8 1d 12 00 00       	callq  18c0 <memset>
  cmd->type = PIPE;
     6a3:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     6a7:	c7 07 03 00 00 00    	movl   $0x3,(%rdi)
  cmd->left = left;
     6ad:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     6b1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     6b5:	48 89 79 08          	mov    %rdi,0x8(%rcx)
  cmd->right = right;
     6b9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     6bd:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     6c1:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
  return (struct cmd*)cmd;
     6c5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     6c9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     6cd:	48 89 c8             	mov    %rcx,%rax
     6d0:	48 83 c4 20          	add    $0x20,%rsp
     6d4:	5d                   	pop    %rbp
     6d5:	c3                   	retq   
     6d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     6dd:	00 00 00 

00000000000006e0 <listcmd>:
{
     6e0:	55                   	push   %rbp
     6e1:	48 89 e5             	mov    %rsp,%rbp
     6e4:	48 83 ec 20          	sub    $0x20,%rsp
     6e8:	b8 18 00 00 00       	mov    $0x18,%eax
     6ed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     6f1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  cmd = malloc(sizeof(*cmd));
     6f5:	89 c7                	mov    %eax,%edi
     6f7:	e8 94 16 00 00       	callq  1d90 <malloc>
     6fc:	31 f6                	xor    %esi,%esi
     6fe:	ba 18 00 00 00       	mov    $0x18,%edx
     703:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  memset(cmd, 0, sizeof(*cmd));
     707:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     70b:	48 89 c7             	mov    %rax,%rdi
     70e:	e8 ad 11 00 00       	callq  18c0 <memset>
  cmd->type = LIST;
     713:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     717:	c7 07 04 00 00 00    	movl   $0x4,(%rdi)
  cmd->left = left;
     71d:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     721:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     725:	48 89 79 08          	mov    %rdi,0x8(%rcx)
  cmd->right = right;
     729:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     72d:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     731:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
  return (struct cmd*)cmd;
     735:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     739:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     73d:	48 89 c8             	mov    %rcx,%rax
     740:	48 83 c4 20          	add    $0x20,%rsp
     744:	5d                   	pop    %rbp
     745:	c3                   	retq   
     746:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     74d:	00 00 00 

0000000000000750 <backcmd>:
{
     750:	55                   	push   %rbp
     751:	48 89 e5             	mov    %rsp,%rbp
     754:	48 83 ec 20          	sub    $0x20,%rsp
     758:	b8 10 00 00 00       	mov    $0x10,%eax
     75d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  cmd = malloc(sizeof(*cmd));
     761:	89 c7                	mov    %eax,%edi
     763:	e8 28 16 00 00       	callq  1d90 <malloc>
     768:	31 f6                	xor    %esi,%esi
     76a:	ba 10 00 00 00       	mov    $0x10,%edx
     76f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  memset(cmd, 0, sizeof(*cmd));
     773:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     777:	48 89 c7             	mov    %rax,%rdi
     77a:	e8 41 11 00 00       	callq  18c0 <memset>
  cmd->type = BACK;
     77f:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     783:	c7 07 05 00 00 00    	movl   $0x5,(%rdi)
  cmd->cmd = subcmd;
     789:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     78d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     791:	48 89 79 08          	mov    %rdi,0x8(%rcx)
  return (struct cmd*)cmd;
     795:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     799:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     79d:	48 89 c8             	mov    %rcx,%rax
     7a0:	48 83 c4 20          	add    $0x20,%rsp
     7a4:	5d                   	pop    %rbp
     7a5:	c3                   	retq   
     7a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     7ad:	00 00 00 

00000000000007b0 <gettoken>:
{
     7b0:	55                   	push   %rbp
     7b1:	48 89 e5             	mov    %rsp,%rbp
     7b4:	48 83 ec 50          	sub    $0x50,%rsp
     7b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     7bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     7c0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     7c4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  s = *ps;
     7c8:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     7cc:	48 8b 09             	mov    (%rcx),%rcx
     7cf:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     7d3:	31 c0                	xor    %eax,%eax
     7d5:	88 c1                	mov    %al,%cl
  while(s < es && strchr(whitespace, *s))
     7d7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     7db:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
     7df:	88 4d d3             	mov    %cl,-0x2d(%rbp)
     7e2:	0f 83 20 00 00 00    	jae    808 <gettoken+0x58>
     7e8:	48 bf a0 24 00 00 00 	movabs $0x24a0,%rdi
     7ef:	00 00 00 
     7f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     7f6:	0f be 30             	movsbl (%rax),%esi
     7f9:	e8 22 11 00 00       	callq  1920 <strchr>
     7fe:	48 83 f8 00          	cmp    $0x0,%rax
     802:	0f 95 c1             	setne  %cl
     805:	88 4d d3             	mov    %cl,-0x2d(%rbp)
     808:	8a 45 d3             	mov    -0x2d(%rbp),%al
     80b:	a8 01                	test   $0x1,%al
     80d:	0f 85 05 00 00 00    	jne    818 <gettoken+0x68>
     813:	e9 11 00 00 00       	jmpq   829 <gettoken+0x79>
    s++;
     818:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     81c:	48 83 c0 01          	add    $0x1,%rax
     820:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  while(s < es && strchr(whitespace, *s))
     824:	e9 aa ff ff ff       	jmpq   7d3 <gettoken+0x23>
  if(q)
     829:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     82e:	0f 84 0b 00 00 00    	je     83f <gettoken+0x8f>
    *q = s;
     834:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     838:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     83c:	48 89 01             	mov    %rax,(%rcx)
  ret = *s;
     83f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     843:	0f be 08             	movsbl (%rax),%ecx
     846:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  switch(*s){
     849:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     84d:	0f be 08             	movsbl (%rax),%ecx
     850:	85 c9                	test   %ecx,%ecx
     852:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     855:	0f 84 6f 00 00 00    	je     8ca <gettoken+0x11a>
     85b:	e9 00 00 00 00       	jmpq   860 <gettoken+0xb0>
     860:	8b 45 cc             	mov    -0x34(%rbp),%eax
     863:	83 e8 26             	sub    $0x26,%eax
     866:	89 45 c8             	mov    %eax,-0x38(%rbp)
     869:	0f 84 60 00 00 00    	je     8cf <gettoken+0x11f>
     86f:	e9 00 00 00 00       	jmpq   874 <gettoken+0xc4>
     874:	8b 45 cc             	mov    -0x34(%rbp),%eax
     877:	83 c0 d8             	add    $0xffffffd8,%eax
     87a:	83 e8 02             	sub    $0x2,%eax
     87d:	89 45 c4             	mov    %eax,-0x3c(%rbp)
     880:	0f 82 49 00 00 00    	jb     8cf <gettoken+0x11f>
     886:	e9 00 00 00 00       	jmpq   88b <gettoken+0xdb>
     88b:	8b 45 cc             	mov    -0x34(%rbp),%eax
     88e:	83 c0 c5             	add    $0xffffffc5,%eax
     891:	83 e8 02             	sub    $0x2,%eax
     894:	89 45 c0             	mov    %eax,-0x40(%rbp)
     897:	0f 82 32 00 00 00    	jb     8cf <gettoken+0x11f>
     89d:	e9 00 00 00 00       	jmpq   8a2 <gettoken+0xf2>
     8a2:	8b 45 cc             	mov    -0x34(%rbp),%eax
     8a5:	83 e8 3e             	sub    $0x3e,%eax
     8a8:	89 45 bc             	mov    %eax,-0x44(%rbp)
     8ab:	0f 84 2f 00 00 00    	je     8e0 <gettoken+0x130>
     8b1:	e9 00 00 00 00       	jmpq   8b6 <gettoken+0x106>
     8b6:	8b 45 cc             	mov    -0x34(%rbp),%eax
     8b9:	83 e8 7c             	sub    $0x7c,%eax
     8bc:	89 45 b8             	mov    %eax,-0x48(%rbp)
     8bf:	0f 84 0a 00 00 00    	je     8cf <gettoken+0x11f>
     8c5:	e9 4a 00 00 00       	jmpq   914 <gettoken+0x164>
    break;
     8ca:	e9 d2 00 00 00       	jmpq   9a1 <gettoken+0x1f1>
    s++;
     8cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     8d3:	48 83 c0 01          	add    $0x1,%rax
     8d7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    break;
     8db:	e9 c1 00 00 00       	jmpq   9a1 <gettoken+0x1f1>
    s++;
     8e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     8e4:	48 83 c0 01          	add    $0x1,%rax
     8e8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    if(*s == '>'){
     8ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     8f0:	0f be 08             	movsbl (%rax),%ecx
     8f3:	83 f9 3e             	cmp    $0x3e,%ecx
     8f6:	0f 85 13 00 00 00    	jne    90f <gettoken+0x15f>
      ret = '+';
     8fc:	c7 45 d4 2b 00 00 00 	movl   $0x2b,-0x2c(%rbp)
      s++;
     903:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     907:	48 83 c0 01          	add    $0x1,%rax
     90b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    break;
     90f:	e9 8d 00 00 00       	jmpq   9a1 <gettoken+0x1f1>
    ret = 'a';
     914:	c7 45 d4 61 00 00 00 	movl   $0x61,-0x2c(%rbp)
     91b:	31 c0                	xor    %eax,%eax
     91d:	88 c1                	mov    %al,%cl
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     91f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     923:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
     927:	88 4d b7             	mov    %cl,-0x49(%rbp)
     92a:	0f 83 4b 00 00 00    	jae    97b <gettoken+0x1cb>
     930:	48 bf a0 24 00 00 00 	movabs $0x24a0,%rdi
     937:	00 00 00 
     93a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     93e:	0f be 30             	movsbl (%rax),%esi
     941:	e8 da 0f 00 00       	callq  1920 <strchr>
     946:	31 f6                	xor    %esi,%esi
     948:	40 88 f1             	mov    %sil,%cl
     94b:	48 83 f8 00          	cmp    $0x0,%rax
     94f:	88 4d b7             	mov    %cl,-0x49(%rbp)
     952:	0f 85 23 00 00 00    	jne    97b <gettoken+0x1cb>
     958:	48 bf a6 24 00 00 00 	movabs $0x24a6,%rdi
     95f:	00 00 00 
     962:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     966:	0f be 30             	movsbl (%rax),%esi
     969:	e8 b2 0f 00 00       	callq  1920 <strchr>
     96e:	48 83 f8 00          	cmp    $0x0,%rax
     972:	0f 95 c1             	setne  %cl
     975:	80 f1 ff             	xor    $0xff,%cl
     978:	88 4d b7             	mov    %cl,-0x49(%rbp)
     97b:	8a 45 b7             	mov    -0x49(%rbp),%al
     97e:	a8 01                	test   $0x1,%al
     980:	0f 85 05 00 00 00    	jne    98b <gettoken+0x1db>
     986:	e9 11 00 00 00       	jmpq   99c <gettoken+0x1ec>
      s++;
     98b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     98f:	48 83 c0 01          	add    $0x1,%rax
     993:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     997:	e9 7f ff ff ff       	jmpq   91b <gettoken+0x16b>
    break;
     99c:	e9 00 00 00 00       	jmpq   9a1 <gettoken+0x1f1>
  if(eq)
     9a1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
     9a6:	0f 84 0b 00 00 00    	je     9b7 <gettoken+0x207>
    *eq = s;
     9ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     9b0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
     9b4:	48 89 01             	mov    %rax,(%rcx)
  while(s < es && strchr(whitespace, *s))
     9b7:	e9 00 00 00 00       	jmpq   9bc <gettoken+0x20c>
     9bc:	31 c0                	xor    %eax,%eax
     9be:	88 c1                	mov    %al,%cl
     9c0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     9c4:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
     9c8:	88 4d b6             	mov    %cl,-0x4a(%rbp)
     9cb:	0f 83 20 00 00 00    	jae    9f1 <gettoken+0x241>
     9d1:	48 bf a0 24 00 00 00 	movabs $0x24a0,%rdi
     9d8:	00 00 00 
     9db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     9df:	0f be 30             	movsbl (%rax),%esi
     9e2:	e8 39 0f 00 00       	callq  1920 <strchr>
     9e7:	48 83 f8 00          	cmp    $0x0,%rax
     9eb:	0f 95 c1             	setne  %cl
     9ee:	88 4d b6             	mov    %cl,-0x4a(%rbp)
     9f1:	8a 45 b6             	mov    -0x4a(%rbp),%al
     9f4:	a8 01                	test   $0x1,%al
     9f6:	0f 85 05 00 00 00    	jne    a01 <gettoken+0x251>
     9fc:	e9 11 00 00 00       	jmpq   a12 <gettoken+0x262>
    s++;
     a01:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a05:	48 83 c0 01          	add    $0x1,%rax
     a09:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  while(s < es && strchr(whitespace, *s))
     a0d:	e9 aa ff ff ff       	jmpq   9bc <gettoken+0x20c>
  *ps = s;
     a12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a16:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     a1a:	48 89 01             	mov    %rax,(%rcx)
  return ret;
     a1d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     a20:	48 83 c4 50          	add    $0x50,%rsp
     a24:	5d                   	pop    %rbp
     a25:	c3                   	retq   
     a26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     a2d:	00 00 00 

0000000000000a30 <peek>:
{
     a30:	55                   	push   %rbp
     a31:	48 89 e5             	mov    %rsp,%rbp
     a34:	48 83 ec 30          	sub    $0x30,%rsp
     a38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     a3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     a40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  s = *ps;
     a44:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     a48:	48 8b 12             	mov    (%rdx),%rdx
     a4b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
     a4f:	31 c0                	xor    %eax,%eax
     a51:	88 c1                	mov    %al,%cl
  while(s < es && strchr(whitespace, *s))
     a53:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     a57:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
     a5b:	88 4d df             	mov    %cl,-0x21(%rbp)
     a5e:	0f 83 20 00 00 00    	jae    a84 <peek+0x54>
     a64:	48 bf a0 24 00 00 00 	movabs $0x24a0,%rdi
     a6b:	00 00 00 
     a6e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     a72:	0f be 30             	movsbl (%rax),%esi
     a75:	e8 a6 0e 00 00       	callq  1920 <strchr>
     a7a:	48 83 f8 00          	cmp    $0x0,%rax
     a7e:	0f 95 c1             	setne  %cl
     a81:	88 4d df             	mov    %cl,-0x21(%rbp)
     a84:	8a 45 df             	mov    -0x21(%rbp),%al
     a87:	a8 01                	test   $0x1,%al
     a89:	0f 85 05 00 00 00    	jne    a94 <peek+0x64>
     a8f:	e9 11 00 00 00       	jmpq   aa5 <peek+0x75>
    s++;
     a94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     a98:	48 83 c0 01          	add    $0x1,%rax
     a9c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  while(s < es && strchr(whitespace, *s))
     aa0:	e9 aa ff ff ff       	jmpq   a4f <peek+0x1f>
     aa5:	31 c0                	xor    %eax,%eax
     aa7:	88 c1                	mov    %al,%cl
  *ps = s;
     aa9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     aad:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     ab1:	48 89 16             	mov    %rdx,(%rsi)
  return *s && strchr(toks, *s);
     ab4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     ab8:	0f be 02             	movsbl (%rdx),%eax
     abb:	83 f8 00             	cmp    $0x0,%eax
     abe:	88 4d de             	mov    %cl,-0x22(%rbp)
     ac1:	0f 84 1a 00 00 00    	je     ae1 <peek+0xb1>
     ac7:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     acb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     acf:	0f be 30             	movsbl (%rax),%esi
     ad2:	e8 49 0e 00 00       	callq  1920 <strchr>
     ad7:	48 83 f8 00          	cmp    $0x0,%rax
     adb:	0f 95 c1             	setne  %cl
     ade:	88 4d de             	mov    %cl,-0x22(%rbp)
     ae1:	8a 45 de             	mov    -0x22(%rbp),%al
     ae4:	24 01                	and    $0x1,%al
     ae6:	0f b6 c0             	movzbl %al,%eax
     ae9:	48 83 c4 30          	add    $0x30,%rsp
     aed:	5d                   	pop    %rbp
     aee:	c3                   	retq   
     aef:	90                   	nop

0000000000000af0 <parseline>:
}

struct cmd*
parseline(char **ps, char *es)
{
     af0:	55                   	push   %rbp
     af1:	48 89 e5             	mov    %rsp,%rbp
     af4:	48 83 ec 30          	sub    $0x30,%rsp
     af8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     afc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     b00:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b04:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b08:	e8 13 02 00 00       	callq  d20 <parsepipe>
     b0d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     b11:	48 ba 30 20 00 00 00 	movabs $0x2030,%rdx
     b18:	00 00 00 
  while(peek(ps, es, "&")){
     b1b:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b1f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b23:	e8 08 ff ff ff       	callq  a30 <peek>
     b28:	83 f8 00             	cmp    $0x0,%eax
     b2b:	0f 84 29 00 00 00    	je     b5a <parseline+0x6a>
     b31:	31 c0                	xor    %eax,%eax
     b33:	89 c1                	mov    %eax,%ecx
    gettoken(ps, es, 0, 0);
     b35:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b39:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b3d:	48 89 ca             	mov    %rcx,%rdx
     b40:	e8 6b fc ff ff       	callq  7b0 <gettoken>
    cmd = backcmd(cmd);
     b45:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     b49:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     b4c:	e8 ff fb ff ff       	callq  750 <backcmd>
     b51:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  while(peek(ps, es, "&")){
     b55:	e9 b7 ff ff ff       	jmpq   b11 <parseline+0x21>
     b5a:	48 ba 77 20 00 00 00 	movabs $0x2077,%rdx
     b61:	00 00 00 
  }
  if(peek(ps, es, ";")){
     b64:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b68:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b6c:	e8 bf fe ff ff       	callq  a30 <peek>
     b71:	83 f8 00             	cmp    $0x0,%eax
     b74:	0f 84 3f 00 00 00    	je     bb9 <parseline+0xc9>
     b7a:	31 c0                	xor    %eax,%eax
     b7c:	89 c1                	mov    %eax,%ecx
    gettoken(ps, es, 0, 0);
     b7e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     b82:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b86:	48 89 ca             	mov    %rcx,%rdx
     b89:	e8 22 fc ff ff       	callq  7b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     b8e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     b92:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     b96:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     b9a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     b9e:	48 89 cf             	mov    %rcx,%rdi
     ba1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     ba4:	e8 47 ff ff ff       	callq  af0 <parseline>
     ba9:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
     bad:	48 89 c6             	mov    %rax,%rsi
     bb0:	e8 2b fb ff ff       	callq  6e0 <listcmd>
     bb5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  }
  return cmd;
     bb9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     bbd:	48 83 c4 30          	add    $0x30,%rsp
     bc1:	5d                   	pop    %rbp
     bc2:	c3                   	retq   
     bc3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     bca:	84 00 00 00 00 00 

0000000000000bd0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     bd0:	55                   	push   %rbp
     bd1:	48 89 e5             	mov    %rsp,%rbp
     bd4:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
     bdb:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     bdf:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     be4:	0f 85 0d 00 00 00    	jne    bf7 <nulterminate+0x27>
    return 0;
     bea:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     bf1:	00 
     bf2:	e9 16 01 00 00       	jmpq   d0d <nulterminate+0x13d>

  switch(cmd->type){
     bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     bfb:	8b 08                	mov    (%rax),%ecx
     bfd:	ff c9                	dec    %ecx
     bff:	89 c8                	mov    %ecx,%eax
     c01:	83 e9 04             	sub    $0x4,%ecx
     c04:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     c08:	89 4d b4             	mov    %ecx,-0x4c(%rbp)
     c0b:	0f 87 f4 00 00 00    	ja     d05 <nulterminate+0x135>
     c11:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     c15:	48 8b 0c c5 a8 1f 00 	mov    0x1fa8(,%rax,8),%rcx
     c1c:	00 
     c1d:	ff e1                	jmpq   *%rcx
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c23:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    for(i=0; ecmd->argv[i]; i++)
     c27:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     c2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     c32:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
     c36:	48 83 7c c8 08 00    	cmpq   $0x0,0x8(%rax,%rcx,8)
     c3c:	0f 84 1e 00 00 00    	je     c60 <nulterminate+0x90>
      *ecmd->eargv[i] = 0;
     c42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     c46:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
     c4a:	48 8b 44 c8 58       	mov    0x58(%rax,%rcx,8),%rax
     c4f:	c6 00 00             	movb   $0x0,(%rax)
    for(i=0; ecmd->argv[i]; i++)
     c52:	8b 45 ec             	mov    -0x14(%rbp),%eax
     c55:	83 c0 01             	add    $0x1,%eax
     c58:	89 45 ec             	mov    %eax,-0x14(%rbp)
     c5b:	e9 ce ff ff ff       	jmpq   c2e <nulterminate+0x5e>
    break;
     c60:	e9 a0 00 00 00       	jmpq   d05 <nulterminate+0x135>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c69:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    nulterminate(rcmd->cmd);
     c6d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     c71:	48 8b 78 08          	mov    0x8(%rax),%rdi
     c75:	e8 56 ff ff ff       	callq  bd0 <nulterminate>
    *rcmd->efile = 0;
     c7a:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     c7e:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
     c82:	c6 07 00             	movb   $0x0,(%rdi)
    break;
     c85:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     c89:	e9 77 00 00 00       	jmpq   d05 <nulterminate+0x135>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c92:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    nulterminate(pcmd->left);
     c96:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c9a:	48 8b 78 08          	mov    0x8(%rax),%rdi
     c9e:	e8 2d ff ff ff       	callq  bd0 <nulterminate>
    nulterminate(pcmd->right);
     ca3:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
     ca7:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
     cab:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
     caf:	e8 1c ff ff ff       	callq  bd0 <nulterminate>
    break;
     cb4:	48 89 45 98          	mov    %rax,-0x68(%rbp)
     cb8:	e9 48 00 00 00       	jmpq   d05 <nulterminate+0x135>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     cbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cc1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    nulterminate(lcmd->left);
     cc5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     cc9:	48 8b 78 08          	mov    0x8(%rax),%rdi
     ccd:	e8 fe fe ff ff       	callq  bd0 <nulterminate>
    nulterminate(lcmd->right);
     cd2:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
     cd6:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
     cda:	48 89 45 90          	mov    %rax,-0x70(%rbp)
     cde:	e8 ed fe ff ff       	callq  bd0 <nulterminate>
    break;
     ce3:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     ce7:	e9 19 00 00 00       	jmpq   d05 <nulterminate+0x135>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     cec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cf0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    nulterminate(bcmd->cmd);
     cf4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     cf8:	48 8b 78 08          	mov    0x8(%rax),%rdi
     cfc:	e8 cf fe ff ff       	callq  bd0 <nulterminate>
     d01:	48 89 45 80          	mov    %rax,-0x80(%rbp)
    break;
  }
  return cmd;
     d05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     d09:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
     d0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d11:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
     d18:	5d                   	pop    %rbp
     d19:	c3                   	retq   
     d1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000d20 <parsepipe>:
{
     d20:	55                   	push   %rbp
     d21:	48 89 e5             	mov    %rsp,%rbp
     d24:	48 83 ec 30          	sub    $0x30,%rsp
     d28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     d2c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  cmd = parseexec(ps, es);
     d30:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     d34:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     d38:	e8 73 00 00 00       	callq  db0 <parseexec>
     d3d:	48 ba 32 20 00 00 00 	movabs $0x2032,%rdx
     d44:	00 00 00 
     d47:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(peek(ps, es, "|")){
     d4b:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     d4f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     d53:	e8 d8 fc ff ff       	callq  a30 <peek>
     d58:	83 f8 00             	cmp    $0x0,%eax
     d5b:	0f 84 3f 00 00 00    	je     da0 <parsepipe+0x80>
     d61:	31 c0                	xor    %eax,%eax
     d63:	89 c1                	mov    %eax,%ecx
    gettoken(ps, es, 0, 0);
     d65:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     d69:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     d6d:	48 89 ca             	mov    %rcx,%rdx
     d70:	e8 3b fa ff ff       	callq  7b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d75:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
     d79:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     d7d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     d81:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
     d85:	48 89 cf             	mov    %rcx,%rdi
     d88:	89 45 dc             	mov    %eax,-0x24(%rbp)
     d8b:	e8 90 ff ff ff       	callq  d20 <parsepipe>
     d90:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
     d94:	48 89 c6             	mov    %rax,%rsi
     d97:	e8 d4 f8 ff ff       	callq  670 <pipecmd>
     d9c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  return cmd;
     da0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     da4:	48 83 c4 30          	add    $0x30,%rsp
     da8:	5d                   	pop    %rbp
     da9:	c3                   	retq   
     daa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000db0 <parseexec>:
{
     db0:	55                   	push   %rbp
     db1:	48 89 e5             	mov    %rsp,%rbp
     db4:	48 83 ec 40          	sub    $0x40,%rsp
     db8:	48 ba 54 20 00 00 00 	movabs $0x2054,%rdx
     dbf:	00 00 00 
     dc2:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     dc6:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  if(peek(ps, es, "("))
     dca:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     dce:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     dd2:	e8 59 fc ff ff       	callq  a30 <peek>
     dd7:	83 f8 00             	cmp    $0x0,%eax
     dda:	0f 84 16 00 00 00    	je     df6 <parseexec+0x46>
    return parseblock(ps, es);
     de0:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     de4:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     de8:	e8 73 02 00 00       	callq  1060 <parseblock>
     ded:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     df1:	e9 22 01 00 00       	jmpq   f18 <parseexec+0x168>
  ret = execcmd();
     df6:	e8 85 f7 ff ff       	callq  580 <execcmd>
     dfb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  cmd = (struct execcmd*)ret;
     dff:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     e03:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  argc = 0;
     e07:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
  ret = parseredirs(ret, ps, es);
     e0e:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     e12:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     e16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     e1a:	e8 11 01 00 00       	callq  f30 <parseredirs>
     e1f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     e23:	48 ba 74 20 00 00 00 	movabs $0x2074,%rdx
     e2a:	00 00 00 
  while(!peek(ps, es, "|)&;")){
     e2d:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     e31:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     e35:	e8 f6 fb ff ff       	callq  a30 <peek>
     e3a:	83 f8 00             	cmp    $0x0,%eax
     e3d:	0f 95 c1             	setne  %cl
     e40:	80 f1 ff             	xor    $0xff,%cl
     e43:	f6 c1 01             	test   $0x1,%cl
     e46:	0f 85 05 00 00 00    	jne    e51 <parseexec+0xa1>
     e4c:	e9 9d 00 00 00       	jmpq   eee <parseexec+0x13e>
     e51:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
     e55:	48 8d 4d d8          	lea    -0x28(%rbp),%rcx
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     e59:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     e5d:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     e61:	e8 4a f9 ff ff       	callq  7b0 <gettoken>
     e66:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     e69:	83 f8 00             	cmp    $0x0,%eax
     e6c:	0f 85 05 00 00 00    	jne    e77 <parseexec+0xc7>
      break;
     e72:	e9 77 00 00 00       	jmpq   eee <parseexec+0x13e>
    if(tok != 'a')
     e77:	83 7d d4 61          	cmpl   $0x61,-0x2c(%rbp)
     e7b:	0f 84 0f 00 00 00    	je     e90 <parseexec+0xe0>
     e81:	48 bf 29 20 00 00 00 	movabs $0x2029,%rdi
     e88:	00 00 00 
      panic("syntax");
     e8b:	e8 00 f4 ff ff       	callq  290 <panic>
    cmd->argv[argc] = q;
     e90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     e94:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     e98:	48 63 55 d0          	movslq -0x30(%rbp),%rdx
     e9c:	48 89 44 d1 08       	mov    %rax,0x8(%rcx,%rdx,8)
    cmd->eargv[argc] = eq;
     ea1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ea5:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     ea9:	48 63 55 d0          	movslq -0x30(%rbp),%rdx
     ead:	48 89 44 d1 58       	mov    %rax,0x58(%rcx,%rdx,8)
    argc++;
     eb2:	8b 75 d0             	mov    -0x30(%rbp),%esi
     eb5:	83 c6 01             	add    $0x1,%esi
     eb8:	89 75 d0             	mov    %esi,-0x30(%rbp)
    if(argc >= MAXARGS)
     ebb:	83 7d d0 0a          	cmpl   $0xa,-0x30(%rbp)
     ebf:	0f 8c 0f 00 00 00    	jl     ed4 <parseexec+0x124>
     ec5:	48 bf 79 20 00 00 00 	movabs $0x2079,%rdi
     ecc:	00 00 00 
      panic("too many args");
     ecf:	e8 bc f3 ff ff       	callq  290 <panic>
    ret = parseredirs(ret, ps, es);
     ed4:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     ed8:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     edc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     ee0:	e8 4b 00 00 00       	callq  f30 <parseredirs>
     ee5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  while(!peek(ps, es, "|)&;")){
     ee9:	e9 35 ff ff ff       	jmpq   e23 <parseexec+0x73>
  cmd->argv[argc] = 0;
     eee:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ef2:	48 63 4d d0          	movslq -0x30(%rbp),%rcx
     ef6:	48 c7 44 c8 08 00 00 	movq   $0x0,0x8(%rax,%rcx,8)
     efd:	00 00 
  cmd->eargv[argc] = 0;
     eff:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f03:	48 63 4d d0          	movslq -0x30(%rbp),%rcx
     f07:	48 c7 44 c8 58 00 00 	movq   $0x0,0x58(%rax,%rcx,8)
     f0e:	00 00 
  return ret;
     f10:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     f14:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
     f18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f1c:	48 83 c4 40          	add    $0x40,%rsp
     f20:	5d                   	pop    %rbp
     f21:	c3                   	retq   
     f22:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     f29:	1f 84 00 00 00 00 00 

0000000000000f30 <parseredirs>:
{
     f30:	55                   	push   %rbp
     f31:	48 89 e5             	mov    %rsp,%rbp
     f34:	48 83 ec 40          	sub    $0x40,%rsp
     f38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     f40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     f44:	48 ba 34 20 00 00 00 	movabs $0x2034,%rdx
     f4b:	00 00 00 
  while(peek(ps, es, "<>")){
     f4e:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     f52:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     f56:	e8 d5 fa ff ff       	callq  a30 <peek>
     f5b:	83 f8 00             	cmp    $0x0,%eax
     f5e:	0f 84 f0 00 00 00    	je     1054 <parseredirs+0x124>
     f64:	31 c0                	xor    %eax,%eax
     f66:	89 c1                	mov    %eax,%ecx
    tok = gettoken(ps, es, 0, 0);
     f68:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     f6c:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     f70:	48 89 ca             	mov    %rcx,%rdx
     f73:	e8 38 f8 ff ff       	callq  7b0 <gettoken>
     f78:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
     f7c:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
     f80:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     f83:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     f87:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     f8b:	e8 20 f8 ff ff       	callq  7b0 <gettoken>
     f90:	83 f8 61             	cmp    $0x61,%eax
     f93:	0f 84 0f 00 00 00    	je     fa8 <parseredirs+0x78>
     f99:	48 bf 37 20 00 00 00 	movabs $0x2037,%rdi
     fa0:	00 00 00 
      panic("missing file for redirection");
     fa3:	e8 e8 f2 ff ff       	callq  290 <panic>
    switch(tok){
     fa8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     fab:	89 c1                	mov    %eax,%ecx
     fad:	83 e9 2b             	sub    $0x2b,%ecx
     fb0:	89 45 cc             	mov    %eax,-0x34(%rbp)
     fb3:	89 4d c8             	mov    %ecx,-0x38(%rbp)
     fb6:	0f 84 73 00 00 00    	je     102f <parseredirs+0xff>
     fbc:	e9 00 00 00 00       	jmpq   fc1 <parseredirs+0x91>
     fc1:	8b 45 cc             	mov    -0x34(%rbp),%eax
     fc4:	83 e8 3c             	sub    $0x3c,%eax
     fc7:	89 45 c4             	mov    %eax,-0x3c(%rbp)
     fca:	0f 84 19 00 00 00    	je     fe9 <parseredirs+0xb9>
     fd0:	e9 00 00 00 00       	jmpq   fd5 <parseredirs+0xa5>
     fd5:	8b 45 cc             	mov    -0x34(%rbp),%eax
     fd8:	83 e8 3e             	sub    $0x3e,%eax
     fdb:	89 45 c0             	mov    %eax,-0x40(%rbp)
     fde:	0f 84 26 00 00 00    	je     100a <parseredirs+0xda>
     fe4:	e9 66 00 00 00       	jmpq   104f <parseredirs+0x11f>
     fe9:	31 c0                	xor    %eax,%eax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     feb:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     fef:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
     ff3:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
     ff7:	89 c1                	mov    %eax,%ecx
     ff9:	41 89 c0             	mov    %eax,%r8d
     ffc:	e8 cf f5 ff ff       	callq  5d0 <redircmd>
    1001:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      break;
    1005:	e9 45 00 00 00       	jmpq   104f <parseredirs+0x11f>
    100a:	b9 01 02 00 00       	mov    $0x201,%ecx
    100f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    1015:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1019:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    101d:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1021:	e8 aa f5 ff ff       	callq  5d0 <redircmd>
    1026:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      break;
    102a:	e9 20 00 00 00       	jmpq   104f <parseredirs+0x11f>
    102f:	b9 01 02 00 00       	mov    $0x201,%ecx
    1034:	41 b8 01 00 00 00    	mov    $0x1,%r8d
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    103a:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    103e:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    1042:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1046:	e8 85 f5 ff ff       	callq  5d0 <redircmd>
    104b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  while(peek(ps, es, "<>")){
    104f:	e9 f0 fe ff ff       	jmpq   f44 <parseredirs+0x14>
  return cmd;
    1054:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1058:	48 83 c4 40          	add    $0x40,%rsp
    105c:	5d                   	pop    %rbp
    105d:	c3                   	retq   
    105e:	66 90                	xchg   %ax,%ax

0000000000001060 <parseblock>:
{
    1060:	55                   	push   %rbp
    1061:	48 89 e5             	mov    %rsp,%rbp
    1064:	48 83 ec 20          	sub    $0x20,%rsp
    1068:	48 ba 54 20 00 00 00 	movabs $0x2054,%rdx
    106f:	00 00 00 
    1072:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1076:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  if(!peek(ps, es, "("))
    107a:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    107e:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1082:	e8 a9 f9 ff ff       	callq  a30 <peek>
    1087:	83 f8 00             	cmp    $0x0,%eax
    108a:	0f 85 0f 00 00 00    	jne    109f <parseblock+0x3f>
    1090:	48 bf 56 20 00 00 00 	movabs $0x2056,%rdi
    1097:	00 00 00 
    panic("parseblock");
    109a:	e8 f1 f1 ff ff       	callq  290 <panic>
    109f:	31 c0                	xor    %eax,%eax
    10a1:	89 c1                	mov    %eax,%ecx
  gettoken(ps, es, 0, 0);
    10a3:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    10a7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    10ab:	48 89 ca             	mov    %rcx,%rdx
    10ae:	e8 fd f6 ff ff       	callq  7b0 <gettoken>
  cmd = parseline(ps, es);
    10b3:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    10b7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    10bb:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    10be:	e8 2d fa ff ff       	callq  af0 <parseline>
    10c3:	48 ba 72 20 00 00 00 	movabs $0x2072,%rdx
    10ca:	00 00 00 
    10cd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(!peek(ps, es, ")"))
    10d1:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    10d5:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    10d9:	e8 52 f9 ff ff       	callq  a30 <peek>
    10de:	83 f8 00             	cmp    $0x0,%eax
    10e1:	0f 85 0f 00 00 00    	jne    10f6 <parseblock+0x96>
    10e7:	48 bf 61 20 00 00 00 	movabs $0x2061,%rdi
    10ee:	00 00 00 
    panic("syntax - missing )");
    10f1:	e8 9a f1 ff ff       	callq  290 <panic>
    10f6:	31 c0                	xor    %eax,%eax
    10f8:	89 c1                	mov    %eax,%ecx
  gettoken(ps, es, 0, 0);
    10fa:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    10fe:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1102:	48 89 ca             	mov    %rcx,%rdx
    1105:	e8 a6 f6 ff ff       	callq  7b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    110a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    110e:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1112:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1116:	89 45 e0             	mov    %eax,-0x20(%rbp)
    1119:	e8 12 fe ff ff       	callq  f30 <parseredirs>
    111e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  return cmd;
    1122:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1126:	48 83 c4 20          	add    $0x20,%rsp
    112a:	5d                   	pop    %rbp
    112b:	c3                   	retq   
    112c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001130 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1130:	55                   	push   %rbp
    1131:	48 89 e5             	mov    %rsp,%rbp
    1134:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    113b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
    113f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
    1143:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    1147:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    114b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    114f:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1152:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1156:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
    115a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
    115e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
    1162:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    1166:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
    116d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
    1173:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
    117a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1181:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1185:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
    1189:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    118d:	0f 84 f0 03 00 00    	je     1583 <printf+0x453>
    c = fmt[i] & 0xff;
    1193:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1197:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
    119b:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
    119f:	81 e2 ff 00 00 00    	and    $0xff,%edx
    11a5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
    11a8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
    11ac:	0f 85 32 00 00 00    	jne    11e4 <printf+0xb4>
      if(c == '%'){
    11b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    11b6:	0f 85 13 00 00 00    	jne    11cf <printf+0x9f>
        state = '%';
    11bc:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
    11c3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
    11ca:	e9 10 00 00 00       	jmpq   11df <printf+0xaf>
        putc(fd, c);
    11cf:	8b 7d fc             	mov    -0x4(%rbp),%edi
    11d2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    11d5:	88 c1                	mov    %al,%cl
    11d7:	0f be f1             	movsbl %cl,%esi
    11da:	e8 b1 03 00 00       	callq  1590 <putc>
      }
    } else if(state == '%'){
    11df:	e9 8c 03 00 00       	jmpq   1570 <printf+0x440>
    11e4:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
    11e8:	0f 85 7d 03 00 00    	jne    156b <printf+0x43b>
      if(c == 'l') {
    11ee:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
    11f2:	0f 85 0c 00 00 00    	jne    1204 <printf+0xd4>
        lflag = 1;
    11f8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
    11ff:	e9 71 03 00 00       	jmpq   1575 <printf+0x445>
      } else if(c == 'd'){
    1204:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
    1208:	0f 85 0e 01 00 00    	jne    131c <printf+0x1ec>
        if (lflag == 1)
    120e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
    1212:	0f 85 79 00 00 00    	jne    1291 <printf+0x161>
    1218:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
    121c:	8b 7d fc             	mov    -0x4(%rbp),%edi
    121f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    1222:	83 f9 28             	cmp    $0x28,%ecx
    1225:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    1229:	89 7d 84             	mov    %edi,-0x7c(%rbp)
    122c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
    122f:	0f 87 1f 00 00 00    	ja     1254 <printf+0x124>
    1235:	8b 45 80             	mov    -0x80(%rbp),%eax
    1238:	48 63 c8             	movslq %eax,%rcx
    123b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    123f:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1243:	83 c0 08             	add    $0x8,%eax
    1246:	89 02                	mov    %eax,(%rdx)
    1248:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    124f:	e9 1a 00 00 00       	jmpq   126e <printf+0x13e>
    1254:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    1258:	48 8b 48 08          	mov    0x8(%rax),%rcx
    125c:	48 89 ca             	mov    %rcx,%rdx
    125f:	48 83 c1 08          	add    $0x8,%rcx
    1263:	48 89 48 08          	mov    %rcx,0x8(%rax)
    1267:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
    126e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    1275:	ba 0a 00 00 00       	mov    $0xa,%edx
    127a:	b9 01 00 00 00       	mov    $0x1,%ecx
    127f:	48 8b 00             	mov    (%rax),%rax
    1282:	89 c6                	mov    %eax,%esi
    1284:	8b 7d 84             	mov    -0x7c(%rbp),%edi
    1287:	e8 34 03 00 00       	callq  15c0 <printint64>
    128c:	e9 86 00 00 00       	jmpq   1317 <printf+0x1e7>
    1291:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
    1295:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1298:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    129b:	83 f9 28             	cmp    $0x28,%ecx
    129e:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    12a5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
    12ab:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
    12b1:	0f 87 25 00 00 00    	ja     12dc <printf+0x1ac>
    12b7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
    12bd:	48 63 c8             	movslq %eax,%rcx
    12c0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
    12c7:	48 03 4a 10          	add    0x10(%rdx),%rcx
    12cb:	83 c0 08             	add    $0x8,%eax
    12ce:	89 02                	mov    %eax,(%rdx)
    12d0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
    12d7:	e9 1d 00 00 00       	jmpq   12f9 <printf+0x1c9>
    12dc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
    12e3:	48 8b 48 08          	mov    0x8(%rax),%rcx
    12e7:	48 89 ca             	mov    %rcx,%rdx
    12ea:	48 83 c1 08          	add    $0x8,%rcx
    12ee:	48 89 48 08          	mov    %rcx,0x8(%rax)
    12f2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
    12f9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
    1300:	ba 0a 00 00 00       	mov    $0xa,%edx
    1305:	b9 01 00 00 00       	mov    $0x1,%ecx
    130a:	8b 30                	mov    (%rax),%esi
    130c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
    1312:	e8 a9 03 00 00       	callq  16c0 <printint>
      } else if(c == 'x' || c == 'p'){
    1317:	e9 43 02 00 00       	jmpq   155f <printf+0x42f>
    131c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
    1320:	0f 84 0a 00 00 00    	je     1330 <printf+0x200>
    1326:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
    132a:	0f 85 1d 01 00 00    	jne    144d <printf+0x31d>
        if (lflag == 1)
    1330:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
    1334:	0f 85 8b 00 00 00    	jne    13c5 <printf+0x295>
    133a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
    133e:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1341:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    1344:	83 f9 28             	cmp    $0x28,%ecx
    1347:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
    134e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
    1354:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
    135a:	0f 87 25 00 00 00    	ja     1385 <printf+0x255>
    1360:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    1366:	48 63 c8             	movslq %eax,%rcx
    1369:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
    1370:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1374:	83 c0 08             	add    $0x8,%eax
    1377:	89 02                	mov    %eax,(%rdx)
    1379:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
    1380:	e9 1d 00 00 00       	jmpq   13a2 <printf+0x272>
    1385:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    138c:	48 8b 48 08          	mov    0x8(%rax),%rcx
    1390:	48 89 ca             	mov    %rcx,%rdx
    1393:	48 83 c1 08          	add    $0x8,%rcx
    1397:	48 89 48 08          	mov    %rcx,0x8(%rax)
    139b:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
    13a2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
    13a9:	ba 10 00 00 00       	mov    $0x10,%edx
    13ae:	31 c9                	xor    %ecx,%ecx
    13b0:	48 8b 00             	mov    (%rax),%rax
    13b3:	89 c6                	mov    %eax,%esi
    13b5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
    13bb:	e8 00 02 00 00       	callq  15c0 <printint64>
    13c0:	e9 83 00 00 00       	jmpq   1448 <printf+0x318>
    13c5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
    13c9:	8b 7d fc             	mov    -0x4(%rbp),%edi
    13cc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    13cf:	83 f9 28             	cmp    $0x28,%ecx
    13d2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
    13d9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
    13df:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
    13e5:	0f 87 25 00 00 00    	ja     1410 <printf+0x2e0>
    13eb:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
    13f1:	48 63 c8             	movslq %eax,%rcx
    13f4:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
    13fb:	48 03 4a 10          	add    0x10(%rdx),%rcx
    13ff:	83 c0 08             	add    $0x8,%eax
    1402:	89 02                	mov    %eax,(%rdx)
    1404:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
    140b:	e9 1d 00 00 00       	jmpq   142d <printf+0x2fd>
    1410:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
    1417:	48 8b 48 08          	mov    0x8(%rax),%rcx
    141b:	48 89 ca             	mov    %rcx,%rdx
    141e:	48 83 c1 08          	add    $0x8,%rcx
    1422:	48 89 48 08          	mov    %rcx,0x8(%rax)
    1426:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
    142d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
    1434:	ba 10 00 00 00       	mov    $0x10,%edx
    1439:	31 c9                	xor    %ecx,%ecx
    143b:	8b 30                	mov    (%rax),%esi
    143d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
    1443:	e8 78 02 00 00       	callq  16c0 <printint>
      } else if(c == 's'){
    1448:	e9 0d 01 00 00       	jmpq   155a <printf+0x42a>
    144d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
    1451:	0f 85 bc 00 00 00    	jne    1513 <printf+0x3e3>
    1457:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
    145b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    145e:	83 f9 28             	cmp    $0x28,%ecx
    1461:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
    1468:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
    146e:	0f 87 25 00 00 00    	ja     1499 <printf+0x369>
    1474:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
    147a:	48 63 c8             	movslq %eax,%rcx
    147d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
    1484:	48 03 4a 10          	add    0x10(%rdx),%rcx
    1488:	83 c0 08             	add    $0x8,%eax
    148b:	89 02                	mov    %eax,(%rdx)
    148d:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
    1494:	e9 1d 00 00 00       	jmpq   14b6 <printf+0x386>
    1499:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    14a0:	48 8b 48 08          	mov    0x8(%rax),%rcx
    14a4:	48 89 ca             	mov    %rcx,%rdx
    14a7:	48 83 c1 08          	add    $0x8,%rcx
    14ab:	48 89 48 08          	mov    %rcx,0x8(%rax)
    14af:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
    14b6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    14bd:	48 8b 00             	mov    (%rax),%rax
    14c0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    14c4:	48 83 f8 00          	cmp    $0x0,%rax
    14c8:	0f 85 0e 00 00 00    	jne    14dc <printf+0x3ac>
    14ce:	48 b8 87 20 00 00 00 	movabs $0x2087,%rax
    14d5:	00 00 00 
          s = "(null)";
    14d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
    14dc:	e9 00 00 00 00       	jmpq   14e1 <printf+0x3b1>
    14e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14e5:	80 38 00             	cmpb   $0x0,(%rax)
    14e8:	0f 84 20 00 00 00    	je     150e <printf+0x3de>
          putc(fd, *s);
    14ee:	8b 7d fc             	mov    -0x4(%rbp),%edi
    14f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14f5:	0f be 30             	movsbl (%rax),%esi
    14f8:	e8 93 00 00 00       	callq  1590 <putc>
        for(; *s; s++)
    14fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1501:	48 83 c0 01          	add    $0x1,%rax
    1505:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1509:	e9 d3 ff ff ff       	jmpq   14e1 <printf+0x3b1>
      } else if(c == '%'){
    150e:	e9 42 00 00 00       	jmpq   1555 <printf+0x425>
    1513:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
    1517:	0f 85 15 00 00 00    	jne    1532 <printf+0x402>
        putc(fd, c);
    151d:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1520:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1523:	88 c1                	mov    %al,%cl
    1525:	0f be f1             	movsbl %cl,%esi
    1528:	e8 63 00 00 00       	callq  1590 <putc>
      } else {
    152d:	e9 1e 00 00 00       	jmpq   1550 <printf+0x420>
    1532:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1537:	8b 7d fc             	mov    -0x4(%rbp),%edi
    153a:	e8 51 00 00 00       	callq  1590 <putc>
        putc(fd, c);
    153f:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1542:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    1545:	40 88 f0             	mov    %sil,%al
    1548:	0f be f0             	movsbl %al,%esi
    154b:	e8 40 00 00 00       	callq  1590 <putc>
    1550:	e9 00 00 00 00       	jmpq   1555 <printf+0x425>
    1555:	e9 00 00 00 00       	jmpq   155a <printf+0x42a>
    155a:	e9 00 00 00 00       	jmpq   155f <printf+0x42f>
    155f:	e9 00 00 00 00       	jmpq   1564 <printf+0x434>
      }
      state = 0;
    1564:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    156b:	e9 00 00 00 00       	jmpq   1570 <printf+0x440>
    }
  }
    1570:	e9 00 00 00 00       	jmpq   1575 <printf+0x445>
  for(i = 0; fmt[i]; i++){
    1575:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1578:	83 c0 01             	add    $0x1,%eax
    157b:	89 45 e0             	mov    %eax,-0x20(%rbp)
    157e:	e9 fe fb ff ff       	jmpq   1181 <printf+0x51>

  va_end(valist);
}
    1583:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
    158a:	5d                   	pop    %rbp
    158b:	c3                   	retq   
    158c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001590 <putc>:
{
    1590:	55                   	push   %rbp
    1591:	48 89 e5             	mov    %rsp,%rbp
    1594:	48 83 ec 10          	sub    $0x10,%rsp
    1598:	40 88 f0             	mov    %sil,%al
    159b:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
    159f:	ba 01 00 00 00       	mov    $0x1,%edx
    15a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15a7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
    15aa:	8b 7d fc             	mov    -0x4(%rbp),%edi
    15ad:	e8 d6 05 00 00       	callq  1b88 <write>
}
    15b2:	89 45 f4             	mov    %eax,-0xc(%rbp)
    15b5:	48 83 c4 10          	add    $0x10,%rsp
    15b9:	5d                   	pop    %rbp
    15ba:	c3                   	retq   
    15bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000015c0 <printint64>:
{
    15c0:	55                   	push   %rbp
    15c1:	48 89 e5             	mov    %rsp,%rbp
    15c4:	48 83 ec 50          	sub    $0x50,%rsp
    15c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
    15ce:	89 55 f4             	mov    %edx,-0xc(%rbp)
    15d1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
    15d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    15d8:	0f 84 30 00 00 00    	je     160e <printint64+0x4e>
    15de:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    15e2:	0f 9c c0             	setl   %al
    15e5:	88 c1                	mov    %al,%cl
    15e7:	80 e1 01             	and    $0x1,%cl
    15ea:	0f b6 d1             	movzbl %cl,%edx
    15ed:	89 55 f0             	mov    %edx,-0x10(%rbp)
    15f0:	a8 01                	test   $0x1,%al
    15f2:	0f 85 05 00 00 00    	jne    15fd <printint64+0x3d>
    15f8:	e9 11 00 00 00       	jmpq   160e <printint64+0x4e>
    15fd:	31 c0                	xor    %eax,%eax
    x = -xx;
    15ff:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1602:	48 63 c8             	movslq %eax,%rcx
    1605:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    1609:	e9 08 00 00 00       	jmpq   1616 <printint64+0x56>
    x = xx;
    160e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
    1612:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
    1616:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
    161d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1621:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1625:	31 d2                	xor    %edx,%edx
    1627:	48 f7 f1             	div    %rcx
    162a:	40 8a 34 15 b0 24 00 	mov    0x24b0(,%rdx,1),%sil
    1631:	00 
    1632:	8b 7d cc             	mov    -0x34(%rbp),%edi
    1635:	41 89 f8             	mov    %edi,%r8d
    1638:	41 83 c0 01          	add    $0x1,%r8d
    163c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
    1640:	48 63 cf             	movslq %edi,%rcx
    1643:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
    1648:	48 63 45 f4          	movslq -0xc(%rbp),%rax
    164c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    1650:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1654:	48 89 c8             	mov    %rcx,%rax
    1657:	31 d2                	xor    %edx,%edx
    1659:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    165d:	48 f7 f1             	div    %rcx
    1660:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1664:	48 83 f8 00          	cmp    $0x0,%rax
    1668:	0f 85 af ff ff ff    	jne    161d <printint64+0x5d>
  if(sgn)
    166e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    1672:	0f 84 13 00 00 00    	je     168b <printint64+0xcb>
    buf[i++] = '-';
    1678:	8b 45 cc             	mov    -0x34(%rbp),%eax
    167b:	89 c1                	mov    %eax,%ecx
    167d:	83 c1 01             	add    $0x1,%ecx
    1680:	89 4d cc             	mov    %ecx,-0x34(%rbp)
    1683:	48 63 d0             	movslq %eax,%rdx
    1686:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
    168b:	e9 00 00 00 00       	jmpq   1690 <printint64+0xd0>
    1690:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1693:	83 c0 ff             	add    $0xffffffff,%eax
    1696:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1699:	83 f8 00             	cmp    $0x0,%eax
    169c:	0f 8c 16 00 00 00    	jl     16b8 <printint64+0xf8>
    putc(fd, buf[i]);
    16a2:	8b 7d fc             	mov    -0x4(%rbp),%edi
    16a5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
    16a9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
    16ae:	e8 dd fe ff ff       	callq  1590 <putc>
  while(--i >= 0)
    16b3:	e9 d8 ff ff ff       	jmpq   1690 <printint64+0xd0>
}
    16b8:	48 83 c4 50          	add    $0x50,%rsp
    16bc:	5d                   	pop    %rbp
    16bd:	c3                   	retq   
    16be:	66 90                	xchg   %ax,%ax

00000000000016c0 <printint>:
{
    16c0:	55                   	push   %rbp
    16c1:	48 89 e5             	mov    %rsp,%rbp
    16c4:	48 83 ec 30          	sub    $0x30,%rsp
    16c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    16cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
    16ce:	89 55 f4             	mov    %edx,-0xc(%rbp)
    16d1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
    16d4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
    16db:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    16df:	0f 84 1e 00 00 00    	je     1703 <printint+0x43>
    16e5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    16e9:	0f 8d 14 00 00 00    	jge    1703 <printint+0x43>
    16ef:	31 c0                	xor    %eax,%eax
    neg = 1;
    16f1:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
    16f8:	2b 45 f8             	sub    -0x8(%rbp),%eax
    16fb:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
    16fe:	e9 06 00 00 00       	jmpq   1709 <printint+0x49>
    x = xx;
    1703:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1706:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
    1709:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
    1710:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1713:	31 d2                	xor    %edx,%edx
    1715:	f7 75 f4             	divl   -0xc(%rbp)
    1718:	89 d2                	mov    %edx,%edx
    171a:	89 d1                	mov    %edx,%ecx
    171c:	40 8a 34 0d d0 24 00 	mov    0x24d0(,%rcx,1),%sil
    1723:	00 
    1724:	8b 55 dc             	mov    -0x24(%rbp),%edx
    1727:	89 d7                	mov    %edx,%edi
    1729:	83 c7 01             	add    $0x1,%edi
    172c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    172f:	48 63 ca             	movslq %edx,%rcx
    1732:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
    1737:	8b 45 f4             	mov    -0xc(%rbp),%eax
    173a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
    173d:	89 45 d0             	mov    %eax,-0x30(%rbp)
    1740:	89 c8                	mov    %ecx,%eax
    1742:	31 d2                	xor    %edx,%edx
    1744:	8b 4d d0             	mov    -0x30(%rbp),%ecx
    1747:	f7 f1                	div    %ecx
    1749:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    174c:	83 f8 00             	cmp    $0x0,%eax
    174f:	0f 85 bb ff ff ff    	jne    1710 <printint+0x50>
  if(neg)
    1755:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
    1759:	0f 84 13 00 00 00    	je     1772 <printint+0xb2>
    buf[i++] = '-';
    175f:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1762:	89 c1                	mov    %eax,%ecx
    1764:	83 c1 01             	add    $0x1,%ecx
    1767:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    176a:	48 63 d0             	movslq %eax,%rdx
    176d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
    1772:	e9 00 00 00 00       	jmpq   1777 <printint+0xb7>
    1777:	8b 45 dc             	mov    -0x24(%rbp),%eax
    177a:	83 c0 ff             	add    $0xffffffff,%eax
    177d:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1780:	83 f8 00             	cmp    $0x0,%eax
    1783:	0f 8c 16 00 00 00    	jl     179f <printint+0xdf>
    putc(fd, buf[i]);
    1789:	8b 7d fc             	mov    -0x4(%rbp),%edi
    178c:	48 63 45 dc          	movslq -0x24(%rbp),%rax
    1790:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
    1795:	e8 f6 fd ff ff       	callq  1590 <putc>
  while(--i >= 0)
    179a:	e9 d8 ff ff ff       	jmpq   1777 <printint+0xb7>
}
    179f:	48 83 c4 30          	add    $0x30,%rsp
    17a3:	5d                   	pop    %rbp
    17a4:	c3                   	retq   
    17a5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    17ac:	00 00 00 
    17af:	90                   	nop

00000000000017b0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
    17b0:	55                   	push   %rbp
    17b1:	48 89 e5             	mov    %rsp,%rbp
    17b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
    17bc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    17c0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
    17c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    17c8:	48 89 c1             	mov    %rax,%rcx
    17cb:	48 83 c1 01          	add    $0x1,%rcx
    17cf:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    17d3:	8a 10                	mov    (%rax),%dl
    17d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17d9:	48 89 c1             	mov    %rax,%rcx
    17dc:	48 83 c1 01          	add    $0x1,%rcx
    17e0:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    17e4:	88 10                	mov    %dl,(%rax)
    17e6:	0f be f2             	movsbl %dl,%esi
    17e9:	83 fe 00             	cmp    $0x0,%esi
    17ec:	0f 84 05 00 00 00    	je     17f7 <strcpy+0x47>
    17f2:	e9 cd ff ff ff       	jmpq   17c4 <strcpy+0x14>
    ;
  return os;
    17f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17fb:	5d                   	pop    %rbp
    17fc:	c3                   	retq   
    17fd:	0f 1f 00             	nopl   (%rax)

0000000000001800 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
    1800:	55                   	push   %rbp
    1801:	48 89 e5             	mov    %rsp,%rbp
    1804:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1808:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    180c:	31 c0                	xor    %eax,%eax
    180e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
    1810:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1814:	0f be 02             	movsbl (%rdx),%eax
    1817:	83 f8 00             	cmp    $0x0,%eax
    181a:	88 4d ef             	mov    %cl,-0x11(%rbp)
    181d:	0f 84 18 00 00 00    	je     183b <strcmp+0x3b>
    1823:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1827:	0f be 08             	movsbl (%rax),%ecx
    182a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    182e:	0f be 10             	movsbl (%rax),%edx
    1831:	39 d1                	cmp    %edx,%ecx
    1833:	40 0f 94 c6          	sete   %sil
    1837:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
    183b:	8a 45 ef             	mov    -0x11(%rbp),%al
    183e:	a8 01                	test   $0x1,%al
    1840:	0f 85 05 00 00 00    	jne    184b <strcmp+0x4b>
    1846:	e9 1d 00 00 00       	jmpq   1868 <strcmp+0x68>
    p++, q++;
    184b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    184f:	48 83 c0 01          	add    $0x1,%rax
    1853:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1857:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    185b:	48 83 c0 01          	add    $0x1,%rax
    185f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
    1863:	e9 a4 ff ff ff       	jmpq   180c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    1868:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    186c:	0f b6 08             	movzbl (%rax),%ecx
    186f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1873:	0f b6 10             	movzbl (%rax),%edx
    1876:	29 d1                	sub    %edx,%ecx
    1878:	89 c8                	mov    %ecx,%eax
    187a:	5d                   	pop    %rbp
    187b:	c3                   	retq   
    187c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001880 <strlen>:
}

uint
strlen(char *s)
{
    1880:	55                   	push   %rbp
    1881:	48 89 e5             	mov    %rsp,%rbp
    1884:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
    1888:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    188f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1893:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    1897:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    189b:	0f 84 13 00 00 00    	je     18b4 <strlen+0x34>
    18a1:	e9 00 00 00 00       	jmpq   18a6 <strlen+0x26>
    18a6:	8b 45 f4             	mov    -0xc(%rbp),%eax
    18a9:	83 c0 01             	add    $0x1,%eax
    18ac:	89 45 f4             	mov    %eax,-0xc(%rbp)
    18af:	e9 db ff ff ff       	jmpq   188f <strlen+0xf>
    ;
  return n;
    18b4:	8b 45 f4             	mov    -0xc(%rbp),%eax
    18b7:	5d                   	pop    %rbp
    18b8:	c3                   	retq   
    18b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000018c0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
    18c0:	55                   	push   %rbp
    18c1:	48 89 e5             	mov    %rsp,%rbp
    18c4:	48 83 ec 10          	sub    $0x10,%rsp
    18c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    18cc:	89 75 f4             	mov    %esi,-0xc(%rbp)
    18cf:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
    18d2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    18d6:	8b 75 f4             	mov    -0xc(%rbp),%esi
    18d9:	8b 55 f0             	mov    -0x10(%rbp),%edx
    18dc:	e8 0f 00 00 00       	callq  18f0 <stosb>
  return dst;
    18e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    18e5:	48 83 c4 10          	add    $0x10,%rsp
    18e9:	5d                   	pop    %rbp
    18ea:	c3                   	retq   
    18eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000018f0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    18f0:	55                   	push   %rbp
    18f1:	48 89 e5             	mov    %rsp,%rbp
    18f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    18f8:	89 75 f4             	mov    %esi,-0xc(%rbp)
    18fb:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
    18fe:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1902:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1905:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
    1908:	89 d1                	mov    %edx,%ecx
    190a:	fc                   	cld    
    190b:	f3 aa                	rep stos %al,%es:(%rdi)
    190d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1911:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
    1914:	5d                   	pop    %rbp
    1915:	c3                   	retq   
    1916:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    191d:	00 00 00 

0000000000001920 <strchr>:
}

char*
strchr(const char *s, char c)
{
    1920:	55                   	push   %rbp
    1921:	48 89 e5             	mov    %rsp,%rbp
    1924:	40 88 f0             	mov    %sil,%al
    1927:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    192b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
    192e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1932:	80 38 00             	cmpb   $0x0,(%rax)
    1935:	0f 84 36 00 00 00    	je     1971 <strchr+0x51>
    if(*s == c)
    193b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    193f:	0f be 08             	movsbl (%rax),%ecx
    1942:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
    1946:	39 d1                	cmp    %edx,%ecx
    1948:	0f 85 0d 00 00 00    	jne    195b <strchr+0x3b>
      return (char*)s;
    194e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1952:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1956:	e9 1e 00 00 00       	jmpq   1979 <strchr+0x59>
    if(*s == c)
    195b:	e9 00 00 00 00       	jmpq   1960 <strchr+0x40>
  for(; *s; s++)
    1960:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1964:	48 83 c0 01          	add    $0x1,%rax
    1968:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    196c:	e9 bd ff ff ff       	jmpq   192e <strchr+0xe>
  return 0;
    1971:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1978:	00 
}
    1979:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    197d:	5d                   	pop    %rbp
    197e:	c3                   	retq   
    197f:	90                   	nop

0000000000001980 <gets>:

char*
gets(char *buf, int max)
{
    1980:	55                   	push   %rbp
    1981:	48 89 e5             	mov    %rsp,%rbp
    1984:	48 83 ec 20          	sub    $0x20,%rsp
    1988:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    198c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    198f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1996:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1999:	83 c0 01             	add    $0x1,%eax
    199c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    199f:	0f 8d 5e 00 00 00    	jge    1a03 <gets+0x83>
    19a5:	31 ff                	xor    %edi,%edi
    19a7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
    19ab:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
    19b0:	e8 cb 01 00 00       	callq  1b80 <read>
    19b5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
    19b8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    19bc:	0f 8d 05 00 00 00    	jge    19c7 <gets+0x47>
      break;
    19c2:	e9 3c 00 00 00       	jmpq   1a03 <gets+0x83>
    buf[i++] = c;
    19c7:	8a 45 eb             	mov    -0x15(%rbp),%al
    19ca:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    19ce:	8b 55 f0             	mov    -0x10(%rbp),%edx
    19d1:	89 d6                	mov    %edx,%esi
    19d3:	83 c6 01             	add    $0x1,%esi
    19d6:	89 75 f0             	mov    %esi,-0x10(%rbp)
    19d9:	48 63 fa             	movslq %edx,%rdi
    19dc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
    19df:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
    19e3:	83 fa 0a             	cmp    $0xa,%edx
    19e6:	0f 84 0d 00 00 00    	je     19f9 <gets+0x79>
    19ec:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
    19f0:	83 f8 0d             	cmp    $0xd,%eax
    19f3:	0f 85 05 00 00 00    	jne    19fe <gets+0x7e>
      break;
    19f9:	e9 05 00 00 00       	jmpq   1a03 <gets+0x83>
  for(i=0; i+1 < max; ){
    19fe:	e9 93 ff ff ff       	jmpq   1996 <gets+0x16>
  }
  buf[i] = '\0';
    1a03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a07:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
    1a0b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
    1a0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a13:	48 83 c4 20          	add    $0x20,%rsp
    1a17:	5d                   	pop    %rbp
    1a18:	c3                   	retq   
    1a19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a20 <stat>:
}

int
stat(char *n, struct stat *st)
{
    1a20:	55                   	push   %rbp
    1a21:	48 89 e5             	mov    %rsp,%rbp
    1a24:	48 83 ec 30          	sub    $0x30,%rsp
    1a28:	31 c0                	xor    %eax,%eax
    1a2a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1a2e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1a32:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    1a36:	89 c6                	mov    %eax,%esi
    1a38:	e8 6b 01 00 00       	callq  1ba8 <open>
    1a3d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
    1a40:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    1a44:	0f 8d 0c 00 00 00    	jge    1a56 <stat+0x36>
    return -1;
    1a4a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    1a51:	e9 20 00 00 00       	jmpq   1a76 <stat+0x56>
  r = fstat(fd, st);
    1a56:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    1a59:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    1a5d:	e8 5e 01 00 00       	callq  1bc0 <fstat>
    1a62:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
    1a65:	8b 7d e4             	mov    -0x1c(%rbp),%edi
    1a68:	e8 23 01 00 00       	callq  1b90 <close>
  return r;
    1a6d:	8b 7d e0             	mov    -0x20(%rbp),%edi
    1a70:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1a73:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
    1a76:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1a79:	48 83 c4 30          	add    $0x30,%rsp
    1a7d:	5d                   	pop    %rbp
    1a7e:	c3                   	retq   
    1a7f:	90                   	nop

0000000000001a80 <atoi>:

int
atoi(const char *s)
{
    1a80:	55                   	push   %rbp
    1a81:	48 89 e5             	mov    %rsp,%rbp
    1a84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
    1a88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1a8f:	31 c0                	xor    %eax,%eax
    1a91:	88 c1                	mov    %al,%cl
    1a93:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
    1a98:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1a9c:	0f be 32             	movsbl (%rdx),%esi
    1a9f:	39 f0                	cmp    %esi,%eax
    1aa1:	88 4d f3             	mov    %cl,-0xd(%rbp)
    1aa4:	0f 8f 10 00 00 00    	jg     1aba <atoi+0x3a>
    1aaa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1aae:	0f be 08             	movsbl (%rax),%ecx
    1ab1:	83 f9 39             	cmp    $0x39,%ecx
    1ab4:	0f 9e c2             	setle  %dl
    1ab7:	88 55 f3             	mov    %dl,-0xd(%rbp)
    1aba:	8a 45 f3             	mov    -0xd(%rbp),%al
    1abd:	a8 01                	test   $0x1,%al
    1abf:	0f 85 05 00 00 00    	jne    1aca <atoi+0x4a>
    1ac5:	e9 23 00 00 00       	jmpq   1aed <atoi+0x6d>
    n = n*10 + *s++ - '0';
    1aca:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
    1ace:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1ad2:	48 89 ca             	mov    %rcx,%rdx
    1ad5:	48 83 c2 01          	add    $0x1,%rdx
    1ad9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    1add:	0f be 31             	movsbl (%rcx),%esi
    1ae0:	01 f0                	add    %esi,%eax
    1ae2:	83 e8 30             	sub    $0x30,%eax
    1ae5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
    1ae8:	e9 a2 ff ff ff       	jmpq   1a8f <atoi+0xf>
  return n;
    1aed:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1af0:	5d                   	pop    %rbp
    1af1:	c3                   	retq   
    1af2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1af9:	1f 84 00 00 00 00 00 

0000000000001b00 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1b00:	55                   	push   %rbp
    1b01:	48 89 e5             	mov    %rsp,%rbp
    1b04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1b08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1b0c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
    1b0f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1b13:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
    1b17:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1b1b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
    1b1f:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1b22:	89 c1                	mov    %eax,%ecx
    1b24:	83 c1 ff             	add    $0xffffffff,%ecx
    1b27:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    1b2a:	83 f8 00             	cmp    $0x0,%eax
    1b2d:	0f 8e 27 00 00 00    	jle    1b5a <memmove+0x5a>
    *dst++ = *src++;
    1b33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1b37:	48 89 c1             	mov    %rax,%rcx
    1b3a:	48 83 c1 01          	add    $0x1,%rcx
    1b3e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    1b42:	8a 10                	mov    (%rax),%dl
    1b44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b48:	48 89 c1             	mov    %rax,%rcx
    1b4b:	48 83 c1 01          	add    $0x1,%rcx
    1b4f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1b53:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
    1b55:	e9 c5 ff ff ff       	jmpq   1b1f <memmove+0x1f>
  return vdst;
    1b5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b5e:	5d                   	pop    %rbp
    1b5f:	c3                   	retq   

0000000000001b60 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
    1b60:	b8 01 00 00 00       	mov    $0x1,%eax
    1b65:	cd 40                	int    $0x40
    1b67:	c3                   	retq   

0000000000001b68 <exit>:
SYSCALL(exit)
    1b68:	b8 02 00 00 00       	mov    $0x2,%eax
    1b6d:	cd 40                	int    $0x40
    1b6f:	c3                   	retq   

0000000000001b70 <wait>:
SYSCALL(wait)
    1b70:	b8 03 00 00 00       	mov    $0x3,%eax
    1b75:	cd 40                	int    $0x40
    1b77:	c3                   	retq   

0000000000001b78 <pipe>:
SYSCALL(pipe)
    1b78:	b8 04 00 00 00       	mov    $0x4,%eax
    1b7d:	cd 40                	int    $0x40
    1b7f:	c3                   	retq   

0000000000001b80 <read>:
SYSCALL(read)
    1b80:	b8 05 00 00 00       	mov    $0x5,%eax
    1b85:	cd 40                	int    $0x40
    1b87:	c3                   	retq   

0000000000001b88 <write>:
SYSCALL(write)
    1b88:	b8 10 00 00 00       	mov    $0x10,%eax
    1b8d:	cd 40                	int    $0x40
    1b8f:	c3                   	retq   

0000000000001b90 <close>:
SYSCALL(close)
    1b90:	b8 15 00 00 00       	mov    $0x15,%eax
    1b95:	cd 40                	int    $0x40
    1b97:	c3                   	retq   

0000000000001b98 <kill>:
SYSCALL(kill)
    1b98:	b8 06 00 00 00       	mov    $0x6,%eax
    1b9d:	cd 40                	int    $0x40
    1b9f:	c3                   	retq   

0000000000001ba0 <exec>:
SYSCALL(exec)
    1ba0:	b8 07 00 00 00       	mov    $0x7,%eax
    1ba5:	cd 40                	int    $0x40
    1ba7:	c3                   	retq   

0000000000001ba8 <open>:
SYSCALL(open)
    1ba8:	b8 0f 00 00 00       	mov    $0xf,%eax
    1bad:	cd 40                	int    $0x40
    1baf:	c3                   	retq   

0000000000001bb0 <mknod>:
SYSCALL(mknod)
    1bb0:	b8 11 00 00 00       	mov    $0x11,%eax
    1bb5:	cd 40                	int    $0x40
    1bb7:	c3                   	retq   

0000000000001bb8 <unlink>:
SYSCALL(unlink)
    1bb8:	b8 12 00 00 00       	mov    $0x12,%eax
    1bbd:	cd 40                	int    $0x40
    1bbf:	c3                   	retq   

0000000000001bc0 <fstat>:
SYSCALL(fstat)
    1bc0:	b8 08 00 00 00       	mov    $0x8,%eax
    1bc5:	cd 40                	int    $0x40
    1bc7:	c3                   	retq   

0000000000001bc8 <link>:
SYSCALL(link)
    1bc8:	b8 13 00 00 00       	mov    $0x13,%eax
    1bcd:	cd 40                	int    $0x40
    1bcf:	c3                   	retq   

0000000000001bd0 <mkdir>:
SYSCALL(mkdir)
    1bd0:	b8 14 00 00 00       	mov    $0x14,%eax
    1bd5:	cd 40                	int    $0x40
    1bd7:	c3                   	retq   

0000000000001bd8 <chdir>:
SYSCALL(chdir)
    1bd8:	b8 09 00 00 00       	mov    $0x9,%eax
    1bdd:	cd 40                	int    $0x40
    1bdf:	c3                   	retq   

0000000000001be0 <dup>:
SYSCALL(dup)
    1be0:	b8 0a 00 00 00       	mov    $0xa,%eax
    1be5:	cd 40                	int    $0x40
    1be7:	c3                   	retq   

0000000000001be8 <getpid>:
SYSCALL(getpid)
    1be8:	b8 0b 00 00 00       	mov    $0xb,%eax
    1bed:	cd 40                	int    $0x40
    1bef:	c3                   	retq   

0000000000001bf0 <sbrk>:
SYSCALL(sbrk)
    1bf0:	b8 0c 00 00 00       	mov    $0xc,%eax
    1bf5:	cd 40                	int    $0x40
    1bf7:	c3                   	retq   

0000000000001bf8 <sleep>:
SYSCALL(sleep)
    1bf8:	b8 0d 00 00 00       	mov    $0xd,%eax
    1bfd:	cd 40                	int    $0x40
    1bff:	c3                   	retq   

0000000000001c00 <uptime>:
SYSCALL(uptime)
    1c00:	b8 0e 00 00 00       	mov    $0xe,%eax
    1c05:	cd 40                	int    $0x40
    1c07:	c3                   	retq   

0000000000001c08 <sysinfo>:
SYSCALL(sysinfo)
    1c08:	b8 16 00 00 00       	mov    $0x16,%eax
    1c0d:	cd 40                	int    $0x40
    1c0f:	c3                   	retq   

0000000000001c10 <mmap>:
SYSCALL(mmap)
    1c10:	b8 17 00 00 00       	mov    $0x17,%eax
    1c15:	cd 40                	int    $0x40
    1c17:	c3                   	retq   

0000000000001c18 <munmap>:
SYSCALL(munmap)
    1c18:	b8 18 00 00 00       	mov    $0x18,%eax
    1c1d:	cd 40                	int    $0x40
    1c1f:	c3                   	retq   

0000000000001c20 <crashn>:
SYSCALL(crashn)
    1c20:	b8 19 00 00 00       	mov    $0x19,%eax
    1c25:	cd 40                	int    $0x40
    1c27:	c3                   	retq   
    1c28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1c2f:	00 

0000000000001c30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1c30:	55                   	push   %rbp
    1c31:	48 89 e5             	mov    %rsp,%rbp
    1c34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1c38:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1c3c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
    1c40:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1c44:	48 8b 3c 25 58 25 00 	mov    0x2558,%rdi
    1c4b:	00 
    1c4c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1c50:	31 c0                	xor    %eax,%eax
    1c52:	88 c1                	mov    %al,%cl
    1c54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1c58:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
    1c5c:	88 4d e7             	mov    %cl,-0x19(%rbp)
    1c5f:	0f 86 11 00 00 00    	jbe    1c76 <free+0x46>
    1c65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c69:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1c6d:	48 3b 01             	cmp    (%rcx),%rax
    1c70:	0f 92 c2             	setb   %dl
    1c73:	88 55 e7             	mov    %dl,-0x19(%rbp)
    1c76:	8a 45 e7             	mov    -0x19(%rbp),%al
    1c79:	34 ff                	xor    $0xff,%al
    1c7b:	a8 01                	test   $0x1,%al
    1c7d:	0f 85 05 00 00 00    	jne    1c88 <free+0x58>
    1c83:	e9 4a 00 00 00       	jmpq   1cd2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1c88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1c8c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1c90:	48 3b 01             	cmp    (%rcx),%rax
    1c93:	0f 82 24 00 00 00    	jb     1cbd <free+0x8d>
    1c99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c9d:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1ca1:	0f 87 11 00 00 00    	ja     1cb8 <free+0x88>
    1ca7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1caf:	48 3b 01             	cmp    (%rcx),%rax
    1cb2:	0f 83 05 00 00 00    	jae    1cbd <free+0x8d>
      break;
    1cb8:	e9 15 00 00 00       	jmpq   1cd2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1cbd:	e9 00 00 00 00       	jmpq   1cc2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1cc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1cc6:	48 8b 00             	mov    (%rax),%rax
    1cc9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1ccd:	e9 7e ff ff ff       	jmpq   1c50 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1cd2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cd6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1cda:	8b 51 08             	mov    0x8(%rcx),%edx
    1cdd:	89 d1                	mov    %edx,%ecx
    1cdf:	48 c1 e1 04          	shl    $0x4,%rcx
    1ce3:	48 01 c8             	add    %rcx,%rax
    1ce6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1cea:	48 3b 01             	cmp    (%rcx),%rax
    1ced:	0f 85 2a 00 00 00    	jne    1d1d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1cf3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1cf7:	48 8b 00             	mov    (%rax),%rax
    1cfa:	8b 48 08             	mov    0x8(%rax),%ecx
    1cfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1d01:	03 48 08             	add    0x8(%rax),%ecx
    1d04:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1d07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d0b:	48 8b 00             	mov    (%rax),%rax
    1d0e:	48 8b 00             	mov    (%rax),%rax
    1d11:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1d15:	48 89 02             	mov    %rax,(%rdx)
  } else
    1d18:	e9 0e 00 00 00       	jmpq   1d2b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    1d1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d21:	48 8b 00             	mov    (%rax),%rax
    1d24:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1d28:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    1d2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d2f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1d33:	8b 51 08             	mov    0x8(%rcx),%edx
    1d36:	89 d1                	mov    %edx,%ecx
    1d38:	48 c1 e1 04          	shl    $0x4,%rcx
    1d3c:	48 01 c8             	add    %rcx,%rax
    1d3f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1d43:	0f 85 24 00 00 00    	jne    1d6d <free+0x13d>
    p->s.size += bp->s.size;
    1d49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1d4d:	8b 48 08             	mov    0x8(%rax),%ecx
    1d50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d54:	03 48 08             	add    0x8(%rax),%ecx
    1d57:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    1d5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1d5e:	48 8b 00             	mov    (%rax),%rax
    1d61:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1d65:	48 89 02             	mov    %rax,(%rdx)
  } else
    1d68:	e9 0b 00 00 00       	jmpq   1d78 <free+0x148>
    p->s.ptr = bp;
    1d6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1d71:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1d75:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    1d78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d7c:	48 89 04 25 58 25 00 	mov    %rax,0x2558
    1d83:	00 
}
    1d84:	5d                   	pop    %rbp
    1d85:	c3                   	retq   
    1d86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1d8d:	00 00 00 

0000000000001d90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1d90:	55                   	push   %rbp
    1d91:	48 89 e5             	mov    %rsp,%rbp
    1d94:	48 83 ec 30          	sub    $0x30,%rsp
    1d98:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1d9b:	8b 7d f4             	mov    -0xc(%rbp),%edi
    1d9e:	89 f8                	mov    %edi,%eax
    1da0:	48 83 c0 10          	add    $0x10,%rax
    1da4:	48 83 e8 01          	sub    $0x1,%rax
    1da8:	48 c1 e8 04          	shr    $0x4,%rax
    1dac:	48 83 c0 01          	add    $0x1,%rax
    1db0:	89 c7                	mov    %eax,%edi
    1db2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1db5:	48 8b 04 25 58 25 00 	mov    0x2558,%rax
    1dbc:	00 
    1dbd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1dc1:	48 83 f8 00          	cmp    $0x0,%rax
    1dc5:	0f 85 29 00 00 00    	jne    1df4 <malloc+0x64>
    1dcb:	48 b8 60 25 00 00 00 	movabs $0x2560,%rax
    1dd2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1dd5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1dd9:	48 89 04 25 58 25 00 	mov    %rax,0x2558
    1de0:	00 
    1de1:	48 89 04 25 60 25 00 	mov    %rax,0x2560
    1de8:	00 
    base.s.size = 0;
    1de9:	c7 04 25 68 25 00 00 	movl   $0x0,0x2568
    1df0:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1df4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1df8:	48 8b 00             	mov    (%rax),%rax
    1dfb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    1dff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e03:	8b 48 08             	mov    0x8(%rax),%ecx
    1e06:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1e09:	0f 82 73 00 00 00    	jb     1e82 <malloc+0xf2>
      if(p->s.size == nunits)
    1e0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e13:	8b 48 08             	mov    0x8(%rax),%ecx
    1e16:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1e19:	0f 85 13 00 00 00    	jne    1e32 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    1e1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e23:	48 8b 00             	mov    (%rax),%rax
    1e26:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1e2a:	48 89 01             	mov    %rax,(%rcx)
    1e2d:	e9 33 00 00 00       	jmpq   1e65 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    1e32:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1e35:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1e39:	8b 51 08             	mov    0x8(%rcx),%edx
    1e3c:	29 c2                	sub    %eax,%edx
    1e3e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    1e41:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1e45:	8b 41 08             	mov    0x8(%rcx),%eax
    1e48:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1e4c:	89 c0                	mov    %eax,%eax
    1e4e:	89 c6                	mov    %eax,%esi
    1e50:	48 c1 e6 04          	shl    $0x4,%rsi
    1e54:	48 01 f1             	add    %rsi,%rcx
    1e57:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    1e5b:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1e5e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1e62:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    1e65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1e69:	48 89 04 25 58 25 00 	mov    %rax,0x2558
    1e70:	00 
      return (void*)(p + 1);
    1e71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e75:	48 83 c0 10          	add    $0x10,%rax
    1e79:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1e7d:	e9 57 00 00 00       	jmpq   1ed9 <malloc+0x149>
    }
    if(p == freep)
    1e82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e86:	48 3b 04 25 58 25 00 	cmp    0x2558,%rax
    1e8d:	00 
    1e8e:	0f 85 28 00 00 00    	jne    1ebc <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    1e94:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1e97:	e8 54 00 00 00       	callq  1ef0 <morecore>
    1e9c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1ea0:	48 83 f8 00          	cmp    $0x0,%rax
    1ea4:	0f 85 0d 00 00 00    	jne    1eb7 <malloc+0x127>
        return 0;
    1eaa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1eb1:	00 
    1eb2:	e9 22 00 00 00       	jmpq   1ed9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1eb7:	e9 00 00 00 00       	jmpq   1ebc <malloc+0x12c>
  }
    1ebc:	e9 00 00 00 00       	jmpq   1ec1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ec1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ec5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1ec9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ecd:	48 8b 00             	mov    (%rax),%rax
    1ed0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1ed4:	e9 26 ff ff ff       	jmpq   1dff <malloc+0x6f>
    1ed9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1edd:	48 83 c4 30          	add    $0x30,%rsp
    1ee1:	5d                   	pop    %rbp
    1ee2:	c3                   	retq   
    1ee3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    1eea:	84 00 00 00 00 00 

0000000000001ef0 <morecore>:
{
    1ef0:	55                   	push   %rbp
    1ef1:	48 89 e5             	mov    %rsp,%rbp
    1ef4:	48 83 ec 20          	sub    $0x20,%rsp
    1ef8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    1efb:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1f02:	0f 83 07 00 00 00    	jae    1f0f <morecore+0x1f>
    nu = 4096;
    1f08:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    1f0f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1f12:	89 c1                	mov    %eax,%ecx
    1f14:	48 c1 e1 04          	shl    $0x4,%rcx
    1f18:	89 c8                	mov    %ecx,%eax
    1f1a:	89 c7                	mov    %eax,%edi
    1f1c:	e8 cf fc ff ff       	callq  1bf0 <sbrk>
    1f21:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1f28:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    1f2c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1f30:	0f 85 0d 00 00 00    	jne    1f43 <morecore+0x53>
    return 0;
    1f36:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1f3d:	00 
    1f3e:	e9 2e 00 00 00       	jmpq   1f71 <morecore+0x81>
  hp = (Header*)p;
    1f43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f47:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    1f4b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1f4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1f52:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1f55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1f59:	48 83 c0 10          	add    $0x10,%rax
    1f5d:	48 89 c7             	mov    %rax,%rdi
    1f60:	e8 cb fc ff ff       	callq  1c30 <free>
  return freep;
    1f65:	48 8b 04 25 58 25 00 	mov    0x2558,%rax
    1f6c:	00 
    1f6d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1f71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f75:	48 83 c4 20          	add    $0x20,%rsp
    1f79:	5d                   	pop    %rbp
    1f7a:	c3                   	retq   
