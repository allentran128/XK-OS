
out/user/_grep:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 40          	sub    $0x40,%rsp
       8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
       c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int n, m;
  char *p, *q;

  m = 0;
       f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
      16:	b8 00 04 00 00       	mov    $0x400,%eax
      1b:	89 c1                	mov    %eax,%ecx
      1d:	48 ba 00 16 00 00 00 	movabs $0x1600,%rdx
      24:	00 00 00 
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      27:	8b 7d f4             	mov    -0xc(%rbp),%edi
      2a:	48 63 75 ec          	movslq -0x14(%rbp),%rsi
      2e:	48 01 f2             	add    %rsi,%rdx
      31:	48 63 75 ec          	movslq -0x14(%rbp),%rsi
      35:	48 29 f1             	sub    %rsi,%rcx
      38:	48 83 e9 01          	sub    $0x1,%rcx
      3c:	89 c8                	mov    %ecx,%eax
      3e:	48 89 d6             	mov    %rdx,%rsi
      41:	89 c2                	mov    %eax,%edx
      43:	e8 98 0e 00 00       	callq  ee0 <read>
      48:	89 45 f0             	mov    %eax,-0x10(%rbp)
      4b:	83 f8 00             	cmp    $0x0,%eax
      4e:	0f 8e f0 00 00 00    	jle    144 <grep+0x144>
      54:	48 b8 00 16 00 00 00 	movabs $0x1600,%rax
      5b:	00 00 00 
    m += n;
      5e:	8b 4d f0             	mov    -0x10(%rbp),%ecx
      61:	03 4d ec             	add    -0x14(%rbp),%ecx
      64:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    buf[m] = '\0';
      67:	48 63 55 ec          	movslq -0x14(%rbp),%rdx
      6b:	c6 04 15 00 16 00 00 	movb   $0x0,0x1600(,%rdx,1)
      72:	00 
    p = buf;
      73:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
      77:	be 0a 00 00 00       	mov    $0xa,%esi
    while((q = strchr(p, '\n')) != 0){
      7c:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
      80:	e8 fb 0b 00 00       	callq  c80 <strchr>
      85:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
      89:	48 83 f8 00          	cmp    $0x0,%rax
      8d:	0f 84 57 00 00 00    	je     ea <grep+0xea>
      *q = 0;
      93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      97:	c6 00 00             	movb   $0x0,(%rax)
      if(match(pattern, p)){
      9a:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
      9e:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
      a2:	e8 a9 00 00 00       	callq  150 <match>
      a7:	83 f8 00             	cmp    $0x0,%eax
      aa:	0f 84 29 00 00 00    	je     d9 <grep+0xd9>
      b0:	bf 01 00 00 00       	mov    $0x1,%edi
        *q = '\n';
      b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      b9:	c6 00 0a             	movb   $0xa,(%rax)
        write(1, p, q+1 - p);
      bc:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
      c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      c4:	48 83 c0 01          	add    $0x1,%rax
      c8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
      cc:	48 29 c8             	sub    %rcx,%rax
      cf:	89 c2                	mov    %eax,%edx
      d1:	e8 12 0e 00 00       	callq  ee8 <write>
      d6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
      }
      p = q+1;
      d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      dd:	48 83 c0 01          	add    $0x1,%rax
      e1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    while((q = strchr(p, '\n')) != 0){
      e5:	e9 8d ff ff ff       	jmpq   77 <grep+0x77>
      ea:	48 b8 00 16 00 00 00 	movabs $0x1600,%rax
      f1:	00 00 00 
    }
    if(p == buf)
      f4:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
      f8:	0f 85 07 00 00 00    	jne    105 <grep+0x105>
      m = 0;
      fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    if(m > 0){
     105:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
     109:	0f 8e 30 00 00 00    	jle    13f <grep+0x13f>
     10f:	48 b8 00 16 00 00 00 	movabs $0x1600,%rax
     116:	00 00 00 
      m -= p - buf;
     119:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
     11d:	48 29 c1             	sub    %rax,%rcx
     120:	48 63 55 ec          	movslq -0x14(%rbp),%rdx
     124:	48 29 ca             	sub    %rcx,%rdx
     127:	89 d6                	mov    %edx,%esi
     129:	89 75 ec             	mov    %esi,-0x14(%rbp)
      memmove(buf, p, m);
     12c:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
     130:	8b 55 ec             	mov    -0x14(%rbp),%edx
     133:	48 89 c7             	mov    %rax,%rdi
     136:	e8 25 0d 00 00       	callq  e60 <memmove>
     13b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
     13f:	e9 d2 fe ff ff       	jmpq   16 <grep+0x16>
    }
  }
}
     144:	48 83 c4 40          	add    $0x40,%rsp
     148:	5d                   	pop    %rbp
     149:	c3                   	retq   
     14a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000150 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     150:	55                   	push   %rbp
     151:	48 89 e5             	mov    %rsp,%rbp
     154:	48 83 ec 20          	sub    $0x20,%rsp
     158:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     15c:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  if(re[0] == '^')
     160:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     164:	0f be 06             	movsbl (%rsi),%eax
     167:	83 f8 5e             	cmp    $0x5e,%eax
     16a:	0f 85 1c 00 00 00    	jne    18c <match+0x3c>
    return matchhere(re+1, text);
     170:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     174:	48 83 c0 01          	add    $0x1,%rax
     178:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     17c:	48 89 c7             	mov    %rax,%rdi
     17f:	e8 5c 01 00 00       	callq  2e0 <matchhere>
     184:	89 45 fc             	mov    %eax,-0x4(%rbp)
     187:	e9 4e 00 00 00       	jmpq   1da <match+0x8a>
  do{  // must look at empty string
     18c:	e9 00 00 00 00       	jmpq   191 <match+0x41>
    if(matchhere(re, text))
     191:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     195:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     199:	e8 42 01 00 00       	callq  2e0 <matchhere>
     19e:	83 f8 00             	cmp    $0x0,%eax
     1a1:	0f 84 0c 00 00 00    	je     1b3 <match+0x63>
      return 1;
     1a7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
     1ae:	e9 27 00 00 00       	jmpq   1da <match+0x8a>
  }while(*text++ != '\0');
     1b3:	e9 00 00 00 00       	jmpq   1b8 <match+0x68>
     1b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     1bc:	48 89 c1             	mov    %rax,%rcx
     1bf:	48 83 c1 01          	add    $0x1,%rcx
     1c3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
     1c7:	0f be 10             	movsbl (%rax),%edx
     1ca:	83 fa 00             	cmp    $0x0,%edx
     1cd:	0f 85 be ff ff ff    	jne    191 <match+0x41>
  return 0;
     1d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
}
     1da:	8b 45 fc             	mov    -0x4(%rbp),%eax
     1dd:	48 83 c4 20          	add    $0x20,%rsp
     1e1:	5d                   	pop    %rbp
     1e2:	c3                   	retq   
     1e3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     1ea:	84 00 00 00 00 00 

00000000000001f0 <main>:
{
     1f0:	55                   	push   %rbp
     1f1:	48 89 e5             	mov    %rsp,%rbp
     1f4:	48 83 ec 40          	sub    $0x40,%rsp
     1f8:	89 7d f8             	mov    %edi,-0x8(%rbp)
     1fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  if(argc <= 1){
     1ff:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
     203:	0f 8f 1e 00 00 00    	jg     227 <main+0x37>
     209:	bf 02 00 00 00       	mov    $0x2,%edi
     20e:	48 be db 12 00 00 00 	movabs $0x12db,%rsi
     215:	00 00 00 
    printf(2, "usage: grep pattern [file ...]\n");
     218:	b0 00                	mov    $0x0,%al
     21a:	e8 71 02 00 00       	callq  490 <printf>
    exit();
     21f:	e8 a4 0c 00 00       	callq  ec8 <exit>
     224:	89 45 dc             	mov    %eax,-0x24(%rbp)
  pattern = argv[1];
     227:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     22b:	48 8b 40 08          	mov    0x8(%rax),%rax
     22f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  if(argc <= 2){
     233:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
     237:	0f 8f 13 00 00 00    	jg     250 <main+0x60>
     23d:	31 f6                	xor    %esi,%esi
    grep(pattern, 0);
     23f:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
     243:	e8 b8 fd ff ff       	callq  0 <grep>
    exit();
     248:	e8 7b 0c 00 00       	callq  ec8 <exit>
     24d:	89 45 d8             	mov    %eax,-0x28(%rbp)
  for(i = 2; i < argc; i++){
     250:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%rbp)
     257:	8b 45 e8             	mov    -0x18(%rbp),%eax
     25a:	3b 45 f8             	cmp    -0x8(%rbp),%eax
     25d:	0f 8d 6e 00 00 00    	jge    2d1 <main+0xe1>
     263:	31 f6                	xor    %esi,%esi
    if((fd = open(argv[i], 0)) < 0){
     265:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     269:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
     26d:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
     271:	e8 92 0c 00 00       	callq  f08 <open>
     276:	89 45 ec             	mov    %eax,-0x14(%rbp)
     279:	83 f8 00             	cmp    $0x0,%eax
     27c:	0f 8d 2a 00 00 00    	jge    2ac <main+0xbc>
     282:	bf 01 00 00 00       	mov    $0x1,%edi
     287:	48 be fb 12 00 00 00 	movabs $0x12fb,%rsi
     28e:	00 00 00 
      printf(1, "grep: cannot open %s\n", argv[i]);
     291:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     295:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
     299:	48 8b 14 c8          	mov    (%rax,%rcx,8),%rdx
     29d:	b0 00                	mov    $0x0,%al
     29f:	e8 ec 01 00 00       	callq  490 <printf>
      exit();
     2a4:	e8 1f 0c 00 00       	callq  ec8 <exit>
     2a9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    grep(pattern, fd);
     2ac:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
     2b0:	8b 75 ec             	mov    -0x14(%rbp),%esi
     2b3:	e8 48 fd ff ff       	callq  0 <grep>
    close(fd);
     2b8:	8b 7d ec             	mov    -0x14(%rbp),%edi
     2bb:	e8 30 0c 00 00       	callq  ef0 <close>
     2c0:	89 45 d0             	mov    %eax,-0x30(%rbp)
  for(i = 2; i < argc; i++){
     2c3:	8b 45 e8             	mov    -0x18(%rbp),%eax
     2c6:	83 c0 01             	add    $0x1,%eax
     2c9:	89 45 e8             	mov    %eax,-0x18(%rbp)
     2cc:	e9 86 ff ff ff       	jmpq   257 <main+0x67>
  exit();
     2d1:	e8 f2 0b 00 00       	callq  ec8 <exit>
     2d6:	89 45 cc             	mov    %eax,-0x34(%rbp)
     2d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000002e0 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2e0:	55                   	push   %rbp
     2e1:	48 89 e5             	mov    %rsp,%rbp
     2e4:	48 83 ec 20          	sub    $0x20,%rsp
     2e8:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     2ec:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  if(re[0] == '\0')
     2f0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     2f4:	0f be 06             	movsbl (%rsi),%eax
     2f7:	83 f8 00             	cmp    $0x0,%eax
     2fa:	0f 85 0c 00 00 00    	jne    30c <matchhere+0x2c>
    return 1;
     300:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
     307:	e9 d0 00 00 00       	jmpq   3dc <matchhere+0xfc>
  if(re[1] == '*')
     30c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     310:	0f be 48 01          	movsbl 0x1(%rax),%ecx
     314:	83 f9 2a             	cmp    $0x2a,%ecx
     317:	0f 85 23 00 00 00    	jne    340 <matchhere+0x60>
    return matchstar(re[0], re+2, text);
     31d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     321:	0f be 38             	movsbl (%rax),%edi
     324:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     328:	48 83 c0 02          	add    $0x2,%rax
     32c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     330:	48 89 c6             	mov    %rax,%rsi
     333:	e8 b8 00 00 00       	callq  3f0 <matchstar>
     338:	89 45 fc             	mov    %eax,-0x4(%rbp)
     33b:	e9 9c 00 00 00       	jmpq   3dc <matchhere+0xfc>
  if(re[0] == '$' && re[1] == '\0')
     340:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     344:	0f be 08             	movsbl (%rax),%ecx
     347:	83 f9 24             	cmp    $0x24,%ecx
     34a:	0f 85 2c 00 00 00    	jne    37c <matchhere+0x9c>
     350:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     354:	0f be 48 01          	movsbl 0x1(%rax),%ecx
     358:	83 f9 00             	cmp    $0x0,%ecx
     35b:	0f 85 1b 00 00 00    	jne    37c <matchhere+0x9c>
    return *text == '\0';
     361:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     365:	0f be 08             	movsbl (%rax),%ecx
     368:	83 f9 00             	cmp    $0x0,%ecx
     36b:	0f 94 c2             	sete   %dl
     36e:	80 e2 01             	and    $0x1,%dl
     371:	0f b6 ca             	movzbl %dl,%ecx
     374:	89 4d fc             	mov    %ecx,-0x4(%rbp)
     377:	e9 60 00 00 00       	jmpq   3dc <matchhere+0xfc>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     37c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     380:	0f be 08             	movsbl (%rax),%ecx
     383:	83 f9 00             	cmp    $0x0,%ecx
     386:	0f 84 49 00 00 00    	je     3d5 <matchhere+0xf5>
     38c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     390:	0f be 08             	movsbl (%rax),%ecx
     393:	83 f9 2e             	cmp    $0x2e,%ecx
     396:	0f 84 16 00 00 00    	je     3b2 <matchhere+0xd2>
     39c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     3a0:	0f be 08             	movsbl (%rax),%ecx
     3a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     3a7:	0f be 10             	movsbl (%rax),%edx
     3aa:	39 d1                	cmp    %edx,%ecx
     3ac:	0f 85 23 00 00 00    	jne    3d5 <matchhere+0xf5>
    return matchhere(re+1, text+1);
     3b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     3b6:	48 83 c0 01          	add    $0x1,%rax
     3ba:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     3be:	48 83 c1 01          	add    $0x1,%rcx
     3c2:	48 89 c7             	mov    %rax,%rdi
     3c5:	48 89 ce             	mov    %rcx,%rsi
     3c8:	e8 13 ff ff ff       	callq  2e0 <matchhere>
     3cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
     3d0:	e9 07 00 00 00       	jmpq   3dc <matchhere+0xfc>
  return 0;
     3d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
}
     3dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
     3df:	48 83 c4 20          	add    $0x20,%rsp
     3e3:	5d                   	pop    %rbp
     3e4:	c3                   	retq   
     3e5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
     3ec:	00 00 00 00 

00000000000003f0 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3f0:	55                   	push   %rbp
     3f1:	48 89 e5             	mov    %rsp,%rbp
     3f4:	48 83 ec 20          	sub    $0x20,%rsp
     3f8:	89 7d f8             	mov    %edi,-0x8(%rbp)
     3fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     3ff:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     403:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     407:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     40b:	e8 d0 fe ff ff       	callq  2e0 <matchhere>
     410:	83 f8 00             	cmp    $0x0,%eax
     413:	0f 84 0c 00 00 00    	je     425 <matchstar+0x35>
      return 1;
     419:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
     420:	e9 5e 00 00 00       	jmpq   483 <matchstar+0x93>
  }while(*text!='\0' && (*text++==c || c=='.'));
     425:	e9 00 00 00 00       	jmpq   42a <matchstar+0x3a>
     42a:	31 c0                	xor    %eax,%eax
     42c:	88 c1                	mov    %al,%cl
     42e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     432:	0f be 02             	movsbl (%rdx),%eax
     435:	83 f8 00             	cmp    $0x0,%eax
     438:	88 4d e7             	mov    %cl,-0x19(%rbp)
     43b:	0f 84 30 00 00 00    	je     471 <matchstar+0x81>
     441:	b0 01                	mov    $0x1,%al
     443:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     447:	48 89 ca             	mov    %rcx,%rdx
     44a:	48 83 c2 01          	add    $0x1,%rdx
     44e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     452:	0f be 31             	movsbl (%rcx),%esi
     455:	3b 75 f8             	cmp    -0x8(%rbp),%esi
     458:	88 45 e6             	mov    %al,-0x1a(%rbp)
     45b:	0f 84 0a 00 00 00    	je     46b <matchstar+0x7b>
     461:	83 7d f8 2e          	cmpl   $0x2e,-0x8(%rbp)
     465:	0f 94 c0             	sete   %al
     468:	88 45 e6             	mov    %al,-0x1a(%rbp)
     46b:	8a 45 e6             	mov    -0x1a(%rbp),%al
     46e:	88 45 e7             	mov    %al,-0x19(%rbp)
     471:	8a 45 e7             	mov    -0x19(%rbp),%al
     474:	a8 01                	test   $0x1,%al
     476:	0f 85 87 ff ff ff    	jne    403 <matchstar+0x13>
  return 0;
     47c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
}
     483:	8b 45 fc             	mov    -0x4(%rbp),%eax
     486:	48 83 c4 20          	add    $0x20,%rsp
     48a:	5d                   	pop    %rbp
     48b:	c3                   	retq   
     48c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000490 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     490:	55                   	push   %rbp
     491:	48 89 e5             	mov    %rsp,%rbp
     494:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     49b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     49f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     4a3:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     4a7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     4ab:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     4af:	89 7d fc             	mov    %edi,-0x4(%rbp)
     4b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     4b6:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     4ba:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     4be:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     4c2:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     4c6:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     4cd:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     4d3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     4da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     4e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4e5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     4e9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     4ed:	0f 84 f0 03 00 00    	je     8e3 <printf+0x453>
    c = fmt[i] & 0xff;
     4f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4f7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     4fb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     4ff:	81 e2 ff 00 00 00    	and    $0xff,%edx
     505:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     508:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     50c:	0f 85 32 00 00 00    	jne    544 <printf+0xb4>
      if(c == '%'){
     512:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     516:	0f 85 13 00 00 00    	jne    52f <printf+0x9f>
        state = '%';
     51c:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     523:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     52a:	e9 10 00 00 00       	jmpq   53f <printf+0xaf>
        putc(fd, c);
     52f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     532:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     535:	88 c1                	mov    %al,%cl
     537:	0f be f1             	movsbl %cl,%esi
     53a:	e8 b1 03 00 00       	callq  8f0 <putc>
      }
    } else if(state == '%'){
     53f:	e9 8c 03 00 00       	jmpq   8d0 <printf+0x440>
     544:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     548:	0f 85 7d 03 00 00    	jne    8cb <printf+0x43b>
      if(c == 'l') {
     54e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     552:	0f 85 0c 00 00 00    	jne    564 <printf+0xd4>
        lflag = 1;
     558:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     55f:	e9 71 03 00 00       	jmpq   8d5 <printf+0x445>
      } else if(c == 'd'){
     564:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     568:	0f 85 0e 01 00 00    	jne    67c <printf+0x1ec>
        if (lflag == 1)
     56e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     572:	0f 85 79 00 00 00    	jne    5f1 <printf+0x161>
     578:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     57c:	8b 7d fc             	mov    -0x4(%rbp),%edi
     57f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     582:	83 f9 28             	cmp    $0x28,%ecx
     585:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     589:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     58c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     58f:	0f 87 1f 00 00 00    	ja     5b4 <printf+0x124>
     595:	8b 45 80             	mov    -0x80(%rbp),%eax
     598:	48 63 c8             	movslq %eax,%rcx
     59b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     59f:	48 03 4a 10          	add    0x10(%rdx),%rcx
     5a3:	83 c0 08             	add    $0x8,%eax
     5a6:	89 02                	mov    %eax,(%rdx)
     5a8:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     5af:	e9 1a 00 00 00       	jmpq   5ce <printf+0x13e>
     5b4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     5b8:	48 8b 48 08          	mov    0x8(%rax),%rcx
     5bc:	48 89 ca             	mov    %rcx,%rdx
     5bf:	48 83 c1 08          	add    $0x8,%rcx
     5c3:	48 89 48 08          	mov    %rcx,0x8(%rax)
     5c7:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     5ce:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     5d5:	ba 0a 00 00 00       	mov    $0xa,%edx
     5da:	b9 01 00 00 00       	mov    $0x1,%ecx
     5df:	48 8b 00             	mov    (%rax),%rax
     5e2:	89 c6                	mov    %eax,%esi
     5e4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     5e7:	e8 34 03 00 00       	callq  920 <printint64>
     5ec:	e9 86 00 00 00       	jmpq   677 <printf+0x1e7>
     5f1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     5f5:	8b 7d fc             	mov    -0x4(%rbp),%edi
     5f8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     5fb:	83 f9 28             	cmp    $0x28,%ecx
     5fe:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     605:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     60b:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     611:	0f 87 25 00 00 00    	ja     63c <printf+0x1ac>
     617:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     61d:	48 63 c8             	movslq %eax,%rcx
     620:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     627:	48 03 4a 10          	add    0x10(%rdx),%rcx
     62b:	83 c0 08             	add    $0x8,%eax
     62e:	89 02                	mov    %eax,(%rdx)
     630:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     637:	e9 1d 00 00 00       	jmpq   659 <printf+0x1c9>
     63c:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     643:	48 8b 48 08          	mov    0x8(%rax),%rcx
     647:	48 89 ca             	mov    %rcx,%rdx
     64a:	48 83 c1 08          	add    $0x8,%rcx
     64e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     652:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     659:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     660:	ba 0a 00 00 00       	mov    $0xa,%edx
     665:	b9 01 00 00 00       	mov    $0x1,%ecx
     66a:	8b 30                	mov    (%rax),%esi
     66c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     672:	e8 a9 03 00 00       	callq  a20 <printint>
      } else if(c == 'x' || c == 'p'){
     677:	e9 43 02 00 00       	jmpq   8bf <printf+0x42f>
     67c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     680:	0f 84 0a 00 00 00    	je     690 <printf+0x200>
     686:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     68a:	0f 85 1d 01 00 00    	jne    7ad <printf+0x31d>
        if (lflag == 1)
     690:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     694:	0f 85 8b 00 00 00    	jne    725 <printf+0x295>
     69a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     69e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     6a1:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     6a4:	83 f9 28             	cmp    $0x28,%ecx
     6a7:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     6ae:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     6b4:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     6ba:	0f 87 25 00 00 00    	ja     6e5 <printf+0x255>
     6c0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     6c6:	48 63 c8             	movslq %eax,%rcx
     6c9:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     6d0:	48 03 4a 10          	add    0x10(%rdx),%rcx
     6d4:	83 c0 08             	add    $0x8,%eax
     6d7:	89 02                	mov    %eax,(%rdx)
     6d9:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     6e0:	e9 1d 00 00 00       	jmpq   702 <printf+0x272>
     6e5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     6ec:	48 8b 48 08          	mov    0x8(%rax),%rcx
     6f0:	48 89 ca             	mov    %rcx,%rdx
     6f3:	48 83 c1 08          	add    $0x8,%rcx
     6f7:	48 89 48 08          	mov    %rcx,0x8(%rax)
     6fb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     702:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     709:	ba 10 00 00 00       	mov    $0x10,%edx
     70e:	31 c9                	xor    %ecx,%ecx
     710:	48 8b 00             	mov    (%rax),%rax
     713:	89 c6                	mov    %eax,%esi
     715:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     71b:	e8 00 02 00 00       	callq  920 <printint64>
     720:	e9 83 00 00 00       	jmpq   7a8 <printf+0x318>
     725:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     729:	8b 7d fc             	mov    -0x4(%rbp),%edi
     72c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     72f:	83 f9 28             	cmp    $0x28,%ecx
     732:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     739:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     73f:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     745:	0f 87 25 00 00 00    	ja     770 <printf+0x2e0>
     74b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     751:	48 63 c8             	movslq %eax,%rcx
     754:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     75b:	48 03 4a 10          	add    0x10(%rdx),%rcx
     75f:	83 c0 08             	add    $0x8,%eax
     762:	89 02                	mov    %eax,(%rdx)
     764:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     76b:	e9 1d 00 00 00       	jmpq   78d <printf+0x2fd>
     770:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     777:	48 8b 48 08          	mov    0x8(%rax),%rcx
     77b:	48 89 ca             	mov    %rcx,%rdx
     77e:	48 83 c1 08          	add    $0x8,%rcx
     782:	48 89 48 08          	mov    %rcx,0x8(%rax)
     786:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     78d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     794:	ba 10 00 00 00       	mov    $0x10,%edx
     799:	31 c9                	xor    %ecx,%ecx
     79b:	8b 30                	mov    (%rax),%esi
     79d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     7a3:	e8 78 02 00 00       	callq  a20 <printint>
      } else if(c == 's'){
     7a8:	e9 0d 01 00 00       	jmpq   8ba <printf+0x42a>
     7ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     7b1:	0f 85 bc 00 00 00    	jne    873 <printf+0x3e3>
     7b7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     7bb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     7be:	83 f9 28             	cmp    $0x28,%ecx
     7c1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     7c8:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     7ce:	0f 87 25 00 00 00    	ja     7f9 <printf+0x369>
     7d4:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     7da:	48 63 c8             	movslq %eax,%rcx
     7dd:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     7e4:	48 03 4a 10          	add    0x10(%rdx),%rcx
     7e8:	83 c0 08             	add    $0x8,%eax
     7eb:	89 02                	mov    %eax,(%rdx)
     7ed:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     7f4:	e9 1d 00 00 00       	jmpq   816 <printf+0x386>
     7f9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     800:	48 8b 48 08          	mov    0x8(%rax),%rcx
     804:	48 89 ca             	mov    %rcx,%rdx
     807:	48 83 c1 08          	add    $0x8,%rcx
     80b:	48 89 48 08          	mov    %rcx,0x8(%rax)
     80f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     816:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     81d:	48 8b 00             	mov    (%rax),%rax
     820:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     824:	48 83 f8 00          	cmp    $0x0,%rax
     828:	0f 85 0e 00 00 00    	jne    83c <printf+0x3ac>
     82e:	48 b8 11 13 00 00 00 	movabs $0x1311,%rax
     835:	00 00 00 
          s = "(null)";
     838:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     83c:	e9 00 00 00 00       	jmpq   841 <printf+0x3b1>
     841:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     845:	80 38 00             	cmpb   $0x0,(%rax)
     848:	0f 84 20 00 00 00    	je     86e <printf+0x3de>
          putc(fd, *s);
     84e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     851:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     855:	0f be 30             	movsbl (%rax),%esi
     858:	e8 93 00 00 00       	callq  8f0 <putc>
        for(; *s; s++)
     85d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     861:	48 83 c0 01          	add    $0x1,%rax
     865:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     869:	e9 d3 ff ff ff       	jmpq   841 <printf+0x3b1>
      } else if(c == '%'){
     86e:	e9 42 00 00 00       	jmpq   8b5 <printf+0x425>
     873:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     877:	0f 85 15 00 00 00    	jne    892 <printf+0x402>
        putc(fd, c);
     87d:	8b 7d fc             	mov    -0x4(%rbp),%edi
     880:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     883:	88 c1                	mov    %al,%cl
     885:	0f be f1             	movsbl %cl,%esi
     888:	e8 63 00 00 00       	callq  8f0 <putc>
      } else {
     88d:	e9 1e 00 00 00       	jmpq   8b0 <printf+0x420>
     892:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     897:	8b 7d fc             	mov    -0x4(%rbp),%edi
     89a:	e8 51 00 00 00       	callq  8f0 <putc>
        putc(fd, c);
     89f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8a2:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     8a5:	40 88 f0             	mov    %sil,%al
     8a8:	0f be f0             	movsbl %al,%esi
     8ab:	e8 40 00 00 00       	callq  8f0 <putc>
     8b0:	e9 00 00 00 00       	jmpq   8b5 <printf+0x425>
     8b5:	e9 00 00 00 00       	jmpq   8ba <printf+0x42a>
     8ba:	e9 00 00 00 00       	jmpq   8bf <printf+0x42f>
     8bf:	e9 00 00 00 00       	jmpq   8c4 <printf+0x434>
      }
      state = 0;
     8c4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     8cb:	e9 00 00 00 00       	jmpq   8d0 <printf+0x440>
    }
  }
     8d0:	e9 00 00 00 00       	jmpq   8d5 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     8d5:	8b 45 e0             	mov    -0x20(%rbp),%eax
     8d8:	83 c0 01             	add    $0x1,%eax
     8db:	89 45 e0             	mov    %eax,-0x20(%rbp)
     8de:	e9 fe fb ff ff       	jmpq   4e1 <printf+0x51>

  va_end(valist);
}
     8e3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     8ea:	5d                   	pop    %rbp
     8eb:	c3                   	retq   
     8ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008f0 <putc>:
{
     8f0:	55                   	push   %rbp
     8f1:	48 89 e5             	mov    %rsp,%rbp
     8f4:	48 83 ec 10          	sub    $0x10,%rsp
     8f8:	40 88 f0             	mov    %sil,%al
     8fb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     8ff:	ba 01 00 00 00       	mov    $0x1,%edx
     904:	89 7d fc             	mov    %edi,-0x4(%rbp)
     907:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     90a:	8b 7d fc             	mov    -0x4(%rbp),%edi
     90d:	e8 d6 05 00 00       	callq  ee8 <write>
}
     912:	89 45 f4             	mov    %eax,-0xc(%rbp)
     915:	48 83 c4 10          	add    $0x10,%rsp
     919:	5d                   	pop    %rbp
     91a:	c3                   	retq   
     91b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000920 <printint64>:
{
     920:	55                   	push   %rbp
     921:	48 89 e5             	mov    %rsp,%rbp
     924:	48 83 ec 50          	sub    $0x50,%rsp
     928:	89 7d fc             	mov    %edi,-0x4(%rbp)
     92b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     92e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     931:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     934:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     938:	0f 84 30 00 00 00    	je     96e <printint64+0x4e>
     93e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     942:	0f 9c c0             	setl   %al
     945:	88 c1                	mov    %al,%cl
     947:	80 e1 01             	and    $0x1,%cl
     94a:	0f b6 d1             	movzbl %cl,%edx
     94d:	89 55 f0             	mov    %edx,-0x10(%rbp)
     950:	a8 01                	test   $0x1,%al
     952:	0f 85 05 00 00 00    	jne    95d <printint64+0x3d>
     958:	e9 11 00 00 00       	jmpq   96e <printint64+0x4e>
     95d:	31 c0                	xor    %eax,%eax
    x = -xx;
     95f:	2b 45 f8             	sub    -0x8(%rbp),%eax
     962:	48 63 c8             	movslq %eax,%rcx
     965:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     969:	e9 08 00 00 00       	jmpq   976 <printint64+0x56>
    x = xx;
     96e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     972:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     976:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     97d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     981:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     985:	31 d2                	xor    %edx,%edx
     987:	48 f7 f1             	div    %rcx
     98a:	40 8a 34 15 a0 15 00 	mov    0x15a0(,%rdx,1),%sil
     991:	00 
     992:	8b 7d cc             	mov    -0x34(%rbp),%edi
     995:	41 89 f8             	mov    %edi,%r8d
     998:	41 83 c0 01          	add    $0x1,%r8d
     99c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     9a0:	48 63 cf             	movslq %edi,%rcx
     9a3:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     9a8:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     9ac:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     9b0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     9b4:	48 89 c8             	mov    %rcx,%rax
     9b7:	31 d2                	xor    %edx,%edx
     9b9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     9bd:	48 f7 f1             	div    %rcx
     9c0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     9c4:	48 83 f8 00          	cmp    $0x0,%rax
     9c8:	0f 85 af ff ff ff    	jne    97d <printint64+0x5d>
  if(sgn)
     9ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     9d2:	0f 84 13 00 00 00    	je     9eb <printint64+0xcb>
    buf[i++] = '-';
     9d8:	8b 45 cc             	mov    -0x34(%rbp),%eax
     9db:	89 c1                	mov    %eax,%ecx
     9dd:	83 c1 01             	add    $0x1,%ecx
     9e0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     9e3:	48 63 d0             	movslq %eax,%rdx
     9e6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     9eb:	e9 00 00 00 00       	jmpq   9f0 <printint64+0xd0>
     9f0:	8b 45 cc             	mov    -0x34(%rbp),%eax
     9f3:	83 c0 ff             	add    $0xffffffff,%eax
     9f6:	89 45 cc             	mov    %eax,-0x34(%rbp)
     9f9:	83 f8 00             	cmp    $0x0,%eax
     9fc:	0f 8c 16 00 00 00    	jl     a18 <printint64+0xf8>
    putc(fd, buf[i]);
     a02:	8b 7d fc             	mov    -0x4(%rbp),%edi
     a05:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     a09:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     a0e:	e8 dd fe ff ff       	callq  8f0 <putc>
  while(--i >= 0)
     a13:	e9 d8 ff ff ff       	jmpq   9f0 <printint64+0xd0>
}
     a18:	48 83 c4 50          	add    $0x50,%rsp
     a1c:	5d                   	pop    %rbp
     a1d:	c3                   	retq   
     a1e:	66 90                	xchg   %ax,%ax

0000000000000a20 <printint>:
{
     a20:	55                   	push   %rbp
     a21:	48 89 e5             	mov    %rsp,%rbp
     a24:	48 83 ec 30          	sub    $0x30,%rsp
     a28:	89 7d fc             	mov    %edi,-0x4(%rbp)
     a2b:	89 75 f8             	mov    %esi,-0x8(%rbp)
     a2e:	89 55 f4             	mov    %edx,-0xc(%rbp)
     a31:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     a34:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     a3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     a3f:	0f 84 1e 00 00 00    	je     a63 <printint+0x43>
     a45:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     a49:	0f 8d 14 00 00 00    	jge    a63 <printint+0x43>
     a4f:	31 c0                	xor    %eax,%eax
    neg = 1;
     a51:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     a58:	2b 45 f8             	sub    -0x8(%rbp),%eax
     a5b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     a5e:	e9 06 00 00 00       	jmpq   a69 <printint+0x49>
    x = xx;
     a63:	8b 45 f8             	mov    -0x8(%rbp),%eax
     a66:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     a69:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     a70:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     a73:	31 d2                	xor    %edx,%edx
     a75:	f7 75 f4             	divl   -0xc(%rbp)
     a78:	89 d2                	mov    %edx,%edx
     a7a:	89 d1                	mov    %edx,%ecx
     a7c:	40 8a 34 0d c0 15 00 	mov    0x15c0(,%rcx,1),%sil
     a83:	00 
     a84:	8b 55 dc             	mov    -0x24(%rbp),%edx
     a87:	89 d7                	mov    %edx,%edi
     a89:	83 c7 01             	add    $0x1,%edi
     a8c:	89 7d dc             	mov    %edi,-0x24(%rbp)
     a8f:	48 63 ca             	movslq %edx,%rcx
     a92:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     a97:	8b 45 f4             	mov    -0xc(%rbp),%eax
     a9a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     a9d:	89 45 d0             	mov    %eax,-0x30(%rbp)
     aa0:	89 c8                	mov    %ecx,%eax
     aa2:	31 d2                	xor    %edx,%edx
     aa4:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     aa7:	f7 f1                	div    %ecx
     aa9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     aac:	83 f8 00             	cmp    $0x0,%eax
     aaf:	0f 85 bb ff ff ff    	jne    a70 <printint+0x50>
  if(neg)
     ab5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     ab9:	0f 84 13 00 00 00    	je     ad2 <printint+0xb2>
    buf[i++] = '-';
     abf:	8b 45 dc             	mov    -0x24(%rbp),%eax
     ac2:	89 c1                	mov    %eax,%ecx
     ac4:	83 c1 01             	add    $0x1,%ecx
     ac7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     aca:	48 63 d0             	movslq %eax,%rdx
     acd:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     ad2:	e9 00 00 00 00       	jmpq   ad7 <printint+0xb7>
     ad7:	8b 45 dc             	mov    -0x24(%rbp),%eax
     ada:	83 c0 ff             	add    $0xffffffff,%eax
     add:	89 45 dc             	mov    %eax,-0x24(%rbp)
     ae0:	83 f8 00             	cmp    $0x0,%eax
     ae3:	0f 8c 16 00 00 00    	jl     aff <printint+0xdf>
    putc(fd, buf[i]);
     ae9:	8b 7d fc             	mov    -0x4(%rbp),%edi
     aec:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     af0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     af5:	e8 f6 fd ff ff       	callq  8f0 <putc>
  while(--i >= 0)
     afa:	e9 d8 ff ff ff       	jmpq   ad7 <printint+0xb7>
}
     aff:	48 83 c4 30          	add    $0x30,%rsp
     b03:	5d                   	pop    %rbp
     b04:	c3                   	retq   
     b05:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     b0c:	00 00 00 
     b0f:	90                   	nop

0000000000000b10 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     b10:	55                   	push   %rbp
     b11:	48 89 e5             	mov    %rsp,%rbp
     b14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     b18:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     b1c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     b20:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     b24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b28:	48 89 c1             	mov    %rax,%rcx
     b2b:	48 83 c1 01          	add    $0x1,%rcx
     b2f:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     b33:	8a 10                	mov    (%rax),%dl
     b35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b39:	48 89 c1             	mov    %rax,%rcx
     b3c:	48 83 c1 01          	add    $0x1,%rcx
     b40:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     b44:	88 10                	mov    %dl,(%rax)
     b46:	0f be f2             	movsbl %dl,%esi
     b49:	83 fe 00             	cmp    $0x0,%esi
     b4c:	0f 84 05 00 00 00    	je     b57 <strcpy+0x47>
     b52:	e9 cd ff ff ff       	jmpq   b24 <strcpy+0x14>
    ;
  return os;
     b57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b5b:	5d                   	pop    %rbp
     b5c:	c3                   	retq   
     b5d:	0f 1f 00             	nopl   (%rax)

0000000000000b60 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     b60:	55                   	push   %rbp
     b61:	48 89 e5             	mov    %rsp,%rbp
     b64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     b68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     b6c:	31 c0                	xor    %eax,%eax
     b6e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     b70:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     b74:	0f be 02             	movsbl (%rdx),%eax
     b77:	83 f8 00             	cmp    $0x0,%eax
     b7a:	88 4d ef             	mov    %cl,-0x11(%rbp)
     b7d:	0f 84 18 00 00 00    	je     b9b <strcmp+0x3b>
     b83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b87:	0f be 08             	movsbl (%rax),%ecx
     b8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b8e:	0f be 10             	movsbl (%rax),%edx
     b91:	39 d1                	cmp    %edx,%ecx
     b93:	40 0f 94 c6          	sete   %sil
     b97:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     b9b:	8a 45 ef             	mov    -0x11(%rbp),%al
     b9e:	a8 01                	test   $0x1,%al
     ba0:	0f 85 05 00 00 00    	jne    bab <strcmp+0x4b>
     ba6:	e9 1d 00 00 00       	jmpq   bc8 <strcmp+0x68>
    p++, q++;
     bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     baf:	48 83 c0 01          	add    $0x1,%rax
     bb3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     bb7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     bbb:	48 83 c0 01          	add    $0x1,%rax
     bbf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     bc3:	e9 a4 ff ff ff       	jmpq   b6c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     bc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     bcc:	0f b6 08             	movzbl (%rax),%ecx
     bcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     bd3:	0f b6 10             	movzbl (%rax),%edx
     bd6:	29 d1                	sub    %edx,%ecx
     bd8:	89 c8                	mov    %ecx,%eax
     bda:	5d                   	pop    %rbp
     bdb:	c3                   	retq   
     bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000be0 <strlen>:
}

uint
strlen(char *s)
{
     be0:	55                   	push   %rbp
     be1:	48 89 e5             	mov    %rsp,%rbp
     be4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     be8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     bef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     bf3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     bf7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     bfb:	0f 84 13 00 00 00    	je     c14 <strlen+0x34>
     c01:	e9 00 00 00 00       	jmpq   c06 <strlen+0x26>
     c06:	8b 45 f4             	mov    -0xc(%rbp),%eax
     c09:	83 c0 01             	add    $0x1,%eax
     c0c:	89 45 f4             	mov    %eax,-0xc(%rbp)
     c0f:	e9 db ff ff ff       	jmpq   bef <strlen+0xf>
    ;
  return n;
     c14:	8b 45 f4             	mov    -0xc(%rbp),%eax
     c17:	5d                   	pop    %rbp
     c18:	c3                   	retq   
     c19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000c20 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     c20:	55                   	push   %rbp
     c21:	48 89 e5             	mov    %rsp,%rbp
     c24:	48 83 ec 10          	sub    $0x10,%rsp
     c28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c2c:	89 75 f4             	mov    %esi,-0xc(%rbp)
     c2f:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     c32:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     c36:	8b 75 f4             	mov    -0xc(%rbp),%esi
     c39:	8b 55 f0             	mov    -0x10(%rbp),%edx
     c3c:	e8 0f 00 00 00       	callq  c50 <stosb>
  return dst;
     c41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c45:	48 83 c4 10          	add    $0x10,%rsp
     c49:	5d                   	pop    %rbp
     c4a:	c3                   	retq   
     c4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000c50 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     c50:	55                   	push   %rbp
     c51:	48 89 e5             	mov    %rsp,%rbp
     c54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c58:	89 75 f4             	mov    %esi,-0xc(%rbp)
     c5b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     c5e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     c62:	8b 55 f0             	mov    -0x10(%rbp),%edx
     c65:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     c68:	89 d1                	mov    %edx,%ecx
     c6a:	fc                   	cld    
     c6b:	f3 aa                	rep stos %al,%es:(%rdi)
     c6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c71:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     c74:	5d                   	pop    %rbp
     c75:	c3                   	retq   
     c76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     c7d:	00 00 00 

0000000000000c80 <strchr>:
}

char*
strchr(const char *s, char c)
{
     c80:	55                   	push   %rbp
     c81:	48 89 e5             	mov    %rsp,%rbp
     c84:	40 88 f0             	mov    %sil,%al
     c87:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     c8b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     c8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c92:	80 38 00             	cmpb   $0x0,(%rax)
     c95:	0f 84 36 00 00 00    	je     cd1 <strchr+0x51>
    if(*s == c)
     c9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c9f:	0f be 08             	movsbl (%rax),%ecx
     ca2:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     ca6:	39 d1                	cmp    %edx,%ecx
     ca8:	0f 85 0d 00 00 00    	jne    cbb <strchr+0x3b>
      return (char*)s;
     cae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cb2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     cb6:	e9 1e 00 00 00       	jmpq   cd9 <strchr+0x59>
    if(*s == c)
     cbb:	e9 00 00 00 00       	jmpq   cc0 <strchr+0x40>
  for(; *s; s++)
     cc0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     cc4:	48 83 c0 01          	add    $0x1,%rax
     cc8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     ccc:	e9 bd ff ff ff       	jmpq   c8e <strchr+0xe>
  return 0;
     cd1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     cd8:	00 
}
     cd9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     cdd:	5d                   	pop    %rbp
     cde:	c3                   	retq   
     cdf:	90                   	nop

0000000000000ce0 <gets>:

char*
gets(char *buf, int max)
{
     ce0:	55                   	push   %rbp
     ce1:	48 89 e5             	mov    %rsp,%rbp
     ce4:	48 83 ec 20          	sub    $0x20,%rsp
     ce8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     cec:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     cef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     cf6:	8b 45 f0             	mov    -0x10(%rbp),%eax
     cf9:	83 c0 01             	add    $0x1,%eax
     cfc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     cff:	0f 8d 5e 00 00 00    	jge    d63 <gets+0x83>
     d05:	31 ff                	xor    %edi,%edi
     d07:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
     d0b:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
     d10:	e8 cb 01 00 00       	callq  ee0 <read>
     d15:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
     d18:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
     d1c:	0f 8d 05 00 00 00    	jge    d27 <gets+0x47>
      break;
     d22:	e9 3c 00 00 00       	jmpq   d63 <gets+0x83>
    buf[i++] = c;
     d27:	8a 45 eb             	mov    -0x15(%rbp),%al
     d2a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     d2e:	8b 55 f0             	mov    -0x10(%rbp),%edx
     d31:	89 d6                	mov    %edx,%esi
     d33:	83 c6 01             	add    $0x1,%esi
     d36:	89 75 f0             	mov    %esi,-0x10(%rbp)
     d39:	48 63 fa             	movslq %edx,%rdi
     d3c:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
     d3f:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
     d43:	83 fa 0a             	cmp    $0xa,%edx
     d46:	0f 84 0d 00 00 00    	je     d59 <gets+0x79>
     d4c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
     d50:	83 f8 0d             	cmp    $0xd,%eax
     d53:	0f 85 05 00 00 00    	jne    d5e <gets+0x7e>
      break;
     d59:	e9 05 00 00 00       	jmpq   d63 <gets+0x83>
  for(i=0; i+1 < max; ){
     d5e:	e9 93 ff ff ff       	jmpq   cf6 <gets+0x16>
  }
  buf[i] = '\0';
     d63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d67:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
     d6b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
     d6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d73:	48 83 c4 20          	add    $0x20,%rsp
     d77:	5d                   	pop    %rbp
     d78:	c3                   	retq   
     d79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000d80 <stat>:
}

int
stat(char *n, struct stat *st)
{
     d80:	55                   	push   %rbp
     d81:	48 89 e5             	mov    %rsp,%rbp
     d84:	48 83 ec 30          	sub    $0x30,%rsp
     d88:	31 c0                	xor    %eax,%eax
     d8a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     d8e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d92:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     d96:	89 c6                	mov    %eax,%esi
     d98:	e8 6b 01 00 00       	callq  f08 <open>
     d9d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
     da0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     da4:	0f 8d 0c 00 00 00    	jge    db6 <stat+0x36>
    return -1;
     daa:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     db1:	e9 20 00 00 00       	jmpq   dd6 <stat+0x56>
  r = fstat(fd, st);
     db6:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     db9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     dbd:	e8 5e 01 00 00       	callq  f20 <fstat>
     dc2:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
     dc5:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     dc8:	e8 23 01 00 00       	callq  ef0 <close>
  return r;
     dcd:	8b 7d e0             	mov    -0x20(%rbp),%edi
     dd0:	89 7d fc             	mov    %edi,-0x4(%rbp)
     dd3:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
     dd6:	8b 45 fc             	mov    -0x4(%rbp),%eax
     dd9:	48 83 c4 30          	add    $0x30,%rsp
     ddd:	5d                   	pop    %rbp
     dde:	c3                   	retq   
     ddf:	90                   	nop

0000000000000de0 <atoi>:

int
atoi(const char *s)
{
     de0:	55                   	push   %rbp
     de1:	48 89 e5             	mov    %rsp,%rbp
     de4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
     de8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     def:	31 c0                	xor    %eax,%eax
     df1:	88 c1                	mov    %al,%cl
     df3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
     df8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     dfc:	0f be 32             	movsbl (%rdx),%esi
     dff:	39 f0                	cmp    %esi,%eax
     e01:	88 4d f3             	mov    %cl,-0xd(%rbp)
     e04:	0f 8f 10 00 00 00    	jg     e1a <atoi+0x3a>
     e0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e0e:	0f be 08             	movsbl (%rax),%ecx
     e11:	83 f9 39             	cmp    $0x39,%ecx
     e14:	0f 9e c2             	setle  %dl
     e17:	88 55 f3             	mov    %dl,-0xd(%rbp)
     e1a:	8a 45 f3             	mov    -0xd(%rbp),%al
     e1d:	a8 01                	test   $0x1,%al
     e1f:	0f 85 05 00 00 00    	jne    e2a <atoi+0x4a>
     e25:	e9 23 00 00 00       	jmpq   e4d <atoi+0x6d>
    n = n*10 + *s++ - '0';
     e2a:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
     e2e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     e32:	48 89 ca             	mov    %rcx,%rdx
     e35:	48 83 c2 01          	add    $0x1,%rdx
     e39:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     e3d:	0f be 31             	movsbl (%rcx),%esi
     e40:	01 f0                	add    %esi,%eax
     e42:	83 e8 30             	sub    $0x30,%eax
     e45:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
     e48:	e9 a2 ff ff ff       	jmpq   def <atoi+0xf>
  return n;
     e4d:	8b 45 f4             	mov    -0xc(%rbp),%eax
     e50:	5d                   	pop    %rbp
     e51:	c3                   	retq   
     e52:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     e59:	1f 84 00 00 00 00 00 

0000000000000e60 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     e60:	55                   	push   %rbp
     e61:	48 89 e5             	mov    %rsp,%rbp
     e64:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e6c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
     e6f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     e73:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
     e77:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     e7b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
     e7f:	8b 45 ec             	mov    -0x14(%rbp),%eax
     e82:	89 c1                	mov    %eax,%ecx
     e84:	83 c1 ff             	add    $0xffffffff,%ecx
     e87:	89 4d ec             	mov    %ecx,-0x14(%rbp)
     e8a:	83 f8 00             	cmp    $0x0,%eax
     e8d:	0f 8e 27 00 00 00    	jle    eba <memmove+0x5a>
    *dst++ = *src++;
     e93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e97:	48 89 c1             	mov    %rax,%rcx
     e9a:	48 83 c1 01          	add    $0x1,%rcx
     e9e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     ea2:	8a 10                	mov    (%rax),%dl
     ea4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     ea8:	48 89 c1             	mov    %rax,%rcx
     eab:	48 83 c1 01          	add    $0x1,%rcx
     eaf:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     eb3:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
     eb5:	e9 c5 ff ff ff       	jmpq   e7f <memmove+0x1f>
  return vdst;
     eba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ebe:	5d                   	pop    %rbp
     ebf:	c3                   	retq   

0000000000000ec0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
     ec0:	b8 01 00 00 00       	mov    $0x1,%eax
     ec5:	cd 40                	int    $0x40
     ec7:	c3                   	retq   

0000000000000ec8 <exit>:
SYSCALL(exit)
     ec8:	b8 02 00 00 00       	mov    $0x2,%eax
     ecd:	cd 40                	int    $0x40
     ecf:	c3                   	retq   

0000000000000ed0 <wait>:
SYSCALL(wait)
     ed0:	b8 03 00 00 00       	mov    $0x3,%eax
     ed5:	cd 40                	int    $0x40
     ed7:	c3                   	retq   

0000000000000ed8 <pipe>:
SYSCALL(pipe)
     ed8:	b8 04 00 00 00       	mov    $0x4,%eax
     edd:	cd 40                	int    $0x40
     edf:	c3                   	retq   

0000000000000ee0 <read>:
SYSCALL(read)
     ee0:	b8 05 00 00 00       	mov    $0x5,%eax
     ee5:	cd 40                	int    $0x40
     ee7:	c3                   	retq   

0000000000000ee8 <write>:
SYSCALL(write)
     ee8:	b8 10 00 00 00       	mov    $0x10,%eax
     eed:	cd 40                	int    $0x40
     eef:	c3                   	retq   

0000000000000ef0 <close>:
SYSCALL(close)
     ef0:	b8 15 00 00 00       	mov    $0x15,%eax
     ef5:	cd 40                	int    $0x40
     ef7:	c3                   	retq   

0000000000000ef8 <kill>:
SYSCALL(kill)
     ef8:	b8 06 00 00 00       	mov    $0x6,%eax
     efd:	cd 40                	int    $0x40
     eff:	c3                   	retq   

0000000000000f00 <exec>:
SYSCALL(exec)
     f00:	b8 07 00 00 00       	mov    $0x7,%eax
     f05:	cd 40                	int    $0x40
     f07:	c3                   	retq   

0000000000000f08 <open>:
SYSCALL(open)
     f08:	b8 0f 00 00 00       	mov    $0xf,%eax
     f0d:	cd 40                	int    $0x40
     f0f:	c3                   	retq   

0000000000000f10 <mknod>:
SYSCALL(mknod)
     f10:	b8 11 00 00 00       	mov    $0x11,%eax
     f15:	cd 40                	int    $0x40
     f17:	c3                   	retq   

0000000000000f18 <unlink>:
SYSCALL(unlink)
     f18:	b8 12 00 00 00       	mov    $0x12,%eax
     f1d:	cd 40                	int    $0x40
     f1f:	c3                   	retq   

0000000000000f20 <fstat>:
SYSCALL(fstat)
     f20:	b8 08 00 00 00       	mov    $0x8,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	retq   

0000000000000f28 <link>:
SYSCALL(link)
     f28:	b8 13 00 00 00       	mov    $0x13,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	retq   

0000000000000f30 <mkdir>:
SYSCALL(mkdir)
     f30:	b8 14 00 00 00       	mov    $0x14,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	retq   

0000000000000f38 <chdir>:
SYSCALL(chdir)
     f38:	b8 09 00 00 00       	mov    $0x9,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	retq   

0000000000000f40 <dup>:
SYSCALL(dup)
     f40:	b8 0a 00 00 00       	mov    $0xa,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	retq   

0000000000000f48 <getpid>:
SYSCALL(getpid)
     f48:	b8 0b 00 00 00       	mov    $0xb,%eax
     f4d:	cd 40                	int    $0x40
     f4f:	c3                   	retq   

0000000000000f50 <sbrk>:
SYSCALL(sbrk)
     f50:	b8 0c 00 00 00       	mov    $0xc,%eax
     f55:	cd 40                	int    $0x40
     f57:	c3                   	retq   

0000000000000f58 <sleep>:
SYSCALL(sleep)
     f58:	b8 0d 00 00 00       	mov    $0xd,%eax
     f5d:	cd 40                	int    $0x40
     f5f:	c3                   	retq   

0000000000000f60 <uptime>:
SYSCALL(uptime)
     f60:	b8 0e 00 00 00       	mov    $0xe,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	retq   

0000000000000f68 <sysinfo>:
SYSCALL(sysinfo)
     f68:	b8 16 00 00 00       	mov    $0x16,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	retq   

0000000000000f70 <mmap>:
SYSCALL(mmap)
     f70:	b8 17 00 00 00       	mov    $0x17,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	retq   

0000000000000f78 <munmap>:
SYSCALL(munmap)
     f78:	b8 18 00 00 00       	mov    $0x18,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	retq   

0000000000000f80 <crashn>:
SYSCALL(crashn)
     f80:	b8 19 00 00 00       	mov    $0x19,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	retq   
     f88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     f8f:	00 

0000000000000f90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f90:	55                   	push   %rbp
     f91:	48 89 e5             	mov    %rsp,%rbp
     f94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f98:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     f9c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
     fa0:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fa4:	48 8b 3c 25 e0 15 00 	mov    0x15e0,%rdi
     fab:	00 
     fac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     fb0:	31 c0                	xor    %eax,%eax
     fb2:	88 c1                	mov    %al,%cl
     fb4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     fb8:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
     fbc:	88 4d e7             	mov    %cl,-0x19(%rbp)
     fbf:	0f 86 11 00 00 00    	jbe    fd6 <free+0x46>
     fc5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fc9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     fcd:	48 3b 01             	cmp    (%rcx),%rax
     fd0:	0f 92 c2             	setb   %dl
     fd3:	88 55 e7             	mov    %dl,-0x19(%rbp)
     fd6:	8a 45 e7             	mov    -0x19(%rbp),%al
     fd9:	34 ff                	xor    $0xff,%al
     fdb:	a8 01                	test   $0x1,%al
     fdd:	0f 85 05 00 00 00    	jne    fe8 <free+0x58>
     fe3:	e9 4a 00 00 00       	jmpq   1032 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fe8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     fec:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     ff0:	48 3b 01             	cmp    (%rcx),%rax
     ff3:	0f 82 24 00 00 00    	jb     101d <free+0x8d>
     ff9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ffd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1001:	0f 87 11 00 00 00    	ja     1018 <free+0x88>
    1007:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    100b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    100f:	48 3b 01             	cmp    (%rcx),%rax
    1012:	0f 83 05 00 00 00    	jae    101d <free+0x8d>
      break;
    1018:	e9 15 00 00 00       	jmpq   1032 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    101d:	e9 00 00 00 00       	jmpq   1022 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1022:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1026:	48 8b 00             	mov    (%rax),%rax
    1029:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    102d:	e9 7e ff ff ff       	jmpq   fb0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    1032:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1036:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    103a:	8b 51 08             	mov    0x8(%rcx),%edx
    103d:	89 d1                	mov    %edx,%ecx
    103f:	48 c1 e1 04          	shl    $0x4,%rcx
    1043:	48 01 c8             	add    %rcx,%rax
    1046:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    104a:	48 3b 01             	cmp    (%rcx),%rax
    104d:	0f 85 2a 00 00 00    	jne    107d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1053:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1057:	48 8b 00             	mov    (%rax),%rax
    105a:	8b 48 08             	mov    0x8(%rax),%ecx
    105d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1061:	03 48 08             	add    0x8(%rax),%ecx
    1064:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1067:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    106b:	48 8b 00             	mov    (%rax),%rax
    106e:	48 8b 00             	mov    (%rax),%rax
    1071:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1075:	48 89 02             	mov    %rax,(%rdx)
  } else
    1078:	e9 0e 00 00 00       	jmpq   108b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    107d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1081:	48 8b 00             	mov    (%rax),%rax
    1084:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1088:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    108b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    108f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1093:	8b 51 08             	mov    0x8(%rcx),%edx
    1096:	89 d1                	mov    %edx,%ecx
    1098:	48 c1 e1 04          	shl    $0x4,%rcx
    109c:	48 01 c8             	add    %rcx,%rax
    109f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    10a3:	0f 85 24 00 00 00    	jne    10cd <free+0x13d>
    p->s.size += bp->s.size;
    10a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10ad:	8b 48 08             	mov    0x8(%rax),%ecx
    10b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10b4:	03 48 08             	add    0x8(%rax),%ecx
    10b7:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    10ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10be:	48 8b 00             	mov    (%rax),%rax
    10c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    10c5:	48 89 02             	mov    %rax,(%rdx)
  } else
    10c8:	e9 0b 00 00 00       	jmpq   10d8 <free+0x148>
    p->s.ptr = bp;
    10cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10d1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    10d5:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    10d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10dc:	48 89 04 25 e0 15 00 	mov    %rax,0x15e0
    10e3:	00 
}
    10e4:	5d                   	pop    %rbp
    10e5:	c3                   	retq   
    10e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    10ed:	00 00 00 

00000000000010f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10f0:	55                   	push   %rbp
    10f1:	48 89 e5             	mov    %rsp,%rbp
    10f4:	48 83 ec 30          	sub    $0x30,%rsp
    10f8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10fb:	8b 7d f4             	mov    -0xc(%rbp),%edi
    10fe:	89 f8                	mov    %edi,%eax
    1100:	48 83 c0 10          	add    $0x10,%rax
    1104:	48 83 e8 01          	sub    $0x1,%rax
    1108:	48 c1 e8 04          	shr    $0x4,%rax
    110c:	48 83 c0 01          	add    $0x1,%rax
    1110:	89 c7                	mov    %eax,%edi
    1112:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    1115:	48 8b 04 25 e0 15 00 	mov    0x15e0,%rax
    111c:	00 
    111d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1121:	48 83 f8 00          	cmp    $0x0,%rax
    1125:	0f 85 29 00 00 00    	jne    1154 <malloc+0x64>
    112b:	48 b8 e8 15 00 00 00 	movabs $0x15e8,%rax
    1132:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1135:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1139:	48 89 04 25 e0 15 00 	mov    %rax,0x15e0
    1140:	00 
    1141:	48 89 04 25 e8 15 00 	mov    %rax,0x15e8
    1148:	00 
    base.s.size = 0;
    1149:	c7 04 25 f0 15 00 00 	movl   $0x0,0x15f0
    1150:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1154:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1158:	48 8b 00             	mov    (%rax),%rax
    115b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    115f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1163:	8b 48 08             	mov    0x8(%rax),%ecx
    1166:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1169:	0f 82 73 00 00 00    	jb     11e2 <malloc+0xf2>
      if(p->s.size == nunits)
    116f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1173:	8b 48 08             	mov    0x8(%rax),%ecx
    1176:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1179:	0f 85 13 00 00 00    	jne    1192 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    117f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1183:	48 8b 00             	mov    (%rax),%rax
    1186:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    118a:	48 89 01             	mov    %rax,(%rcx)
    118d:	e9 33 00 00 00       	jmpq   11c5 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    1192:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1195:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1199:	8b 51 08             	mov    0x8(%rcx),%edx
    119c:	29 c2                	sub    %eax,%edx
    119e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    11a1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    11a5:	8b 41 08             	mov    0x8(%rcx),%eax
    11a8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    11ac:	89 c0                	mov    %eax,%eax
    11ae:	89 c6                	mov    %eax,%esi
    11b0:	48 c1 e6 04          	shl    $0x4,%rsi
    11b4:	48 01 f1             	add    %rsi,%rcx
    11b7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    11bb:	8b 45 dc             	mov    -0x24(%rbp),%eax
    11be:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    11c2:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    11c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11c9:	48 89 04 25 e0 15 00 	mov    %rax,0x15e0
    11d0:	00 
      return (void*)(p + 1);
    11d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11d5:	48 83 c0 10          	add    $0x10,%rax
    11d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11dd:	e9 57 00 00 00       	jmpq   1239 <malloc+0x149>
    }
    if(p == freep)
    11e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11e6:	48 3b 04 25 e0 15 00 	cmp    0x15e0,%rax
    11ed:	00 
    11ee:	0f 85 28 00 00 00    	jne    121c <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    11f4:	8b 7d dc             	mov    -0x24(%rbp),%edi
    11f7:	e8 54 00 00 00       	callq  1250 <morecore>
    11fc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1200:	48 83 f8 00          	cmp    $0x0,%rax
    1204:	0f 85 0d 00 00 00    	jne    1217 <malloc+0x127>
        return 0;
    120a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1211:	00 
    1212:	e9 22 00 00 00       	jmpq   1239 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    1217:	e9 00 00 00 00       	jmpq   121c <malloc+0x12c>
  }
    121c:	e9 00 00 00 00       	jmpq   1221 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1221:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1225:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1229:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    122d:	48 8b 00             	mov    (%rax),%rax
    1230:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1234:	e9 26 ff ff ff       	jmpq   115f <malloc+0x6f>
    1239:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    123d:	48 83 c4 30          	add    $0x30,%rsp
    1241:	5d                   	pop    %rbp
    1242:	c3                   	retq   
    1243:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    124a:	84 00 00 00 00 00 

0000000000001250 <morecore>:
{
    1250:	55                   	push   %rbp
    1251:	48 89 e5             	mov    %rsp,%rbp
    1254:	48 83 ec 20          	sub    $0x20,%rsp
    1258:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    125b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1262:	0f 83 07 00 00 00    	jae    126f <morecore+0x1f>
    nu = 4096;
    1268:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    126f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1272:	89 c1                	mov    %eax,%ecx
    1274:	48 c1 e1 04          	shl    $0x4,%rcx
    1278:	89 c8                	mov    %ecx,%eax
    127a:	89 c7                	mov    %eax,%edi
    127c:	e8 cf fc ff ff       	callq  f50 <sbrk>
    1281:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1288:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    128c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1290:	0f 85 0d 00 00 00    	jne    12a3 <morecore+0x53>
    return 0;
    1296:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    129d:	00 
    129e:	e9 2e 00 00 00       	jmpq   12d1 <morecore+0x81>
  hp = (Header*)p;
    12a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    12ab:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    12ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12b2:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    12b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12b9:	48 83 c0 10          	add    $0x10,%rax
    12bd:	48 89 c7             	mov    %rax,%rdi
    12c0:	e8 cb fc ff ff       	callq  f90 <free>
  return freep;
    12c5:	48 8b 04 25 e0 15 00 	mov    0x15e0,%rax
    12cc:	00 
    12cd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    12d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    12d5:	48 83 c4 20          	add    $0x20,%rsp
    12d9:	5d                   	pop    %rbp
    12da:	c3                   	retq   
