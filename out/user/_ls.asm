
out/user/_ls:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <fmtname>:
#include <user.h>
#include <fs.h>

char*
fmtname(char *path)
{
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 50          	sub    $0x50,%rsp
       8:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       c:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
      10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
      14:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
      18:	48 89 c7             	mov    %rax,%rdi
      1b:	e8 80 0b 00 00       	callq  ba0 <strlen>
      20:	89 c0                	mov    %eax,%eax
      22:	89 c7                	mov    %eax,%edi
      24:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
      28:	48 01 f9             	add    %rdi,%rcx
      2b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
      2f:	31 c0                	xor    %eax,%eax
      31:	88 c1                	mov    %al,%cl
      33:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
      37:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
      3b:	88 4d df             	mov    %cl,-0x21(%rbp)
      3e:	0f 82 10 00 00 00    	jb     54 <fmtname+0x54>
      44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      48:	0f be 08             	movsbl (%rax),%ecx
      4b:	83 f9 2f             	cmp    $0x2f,%ecx
      4e:	0f 95 c2             	setne  %dl
      51:	88 55 df             	mov    %dl,-0x21(%rbp)
      54:	8a 45 df             	mov    -0x21(%rbp),%al
      57:	a8 01                	test   $0x1,%al
      59:	0f 85 05 00 00 00    	jne    64 <fmtname+0x64>
      5f:	e9 16 00 00 00       	jmpq   7a <fmtname+0x7a>
      64:	e9 00 00 00 00       	jmpq   69 <fmtname+0x69>
      69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      6d:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
      71:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
      75:	e9 b5 ff ff ff       	jmpq   2f <fmtname+0x2f>
    ;
  p++;
      7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      7e:	48 83 c0 01          	add    $0x1,%rax
      82:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      86:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
      8a:	e8 11 0b 00 00       	callq  ba0 <strlen>
      8f:	83 f8 0e             	cmp    $0xe,%eax
      92:	0f 82 0d 00 00 00    	jb     a5 <fmtname+0xa5>
    return p;
      98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      9c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      a0:	e9 78 00 00 00       	jmpq   11d <fmtname+0x11d>
  memmove(buf, p, strlen(p));
      a5:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
      a9:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
      ad:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
      b1:	e8 ea 0a 00 00       	callq  ba0 <strlen>
      b6:	48 bf 78 15 00 00 00 	movabs $0x1578,%rdi
      bd:	00 00 00 
      c0:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
      c4:	89 c2                	mov    %eax,%edx
      c6:	e8 55 0d 00 00       	callq  e20 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      cb:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
      cf:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
      d3:	e8 c8 0a 00 00       	callq  ba0 <strlen>
      d8:	48 be 78 15 00 00 00 	movabs $0x1578,%rsi
      df:	00 00 00 
      e2:	89 c0                	mov    %eax,%eax
      e4:	89 c7                	mov    %eax,%edi
      e6:	48 01 fe             	add    %rdi,%rsi
      e9:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
      ed:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
      f1:	e8 aa 0a 00 00       	callq  ba0 <strlen>
      f6:	be 20 00 00 00       	mov    $0x20,%esi
      fb:	ba 0e 00 00 00       	mov    $0xe,%edx
     100:	29 c2                	sub    %eax,%edx
     102:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
     106:	e8 d5 0a 00 00       	callq  be0 <memset>
     10b:	48 bf 78 15 00 00 00 	movabs $0x1578,%rdi
     112:	00 00 00 
  return buf;
     115:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     119:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
}
     11d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     121:	48 83 c4 50          	add    $0x50,%rsp
     125:	5d                   	pop    %rbp
     126:	c3                   	retq   
     127:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     12e:	00 00 

0000000000000130 <ls>:

void
ls(char *path)
{
     130:	55                   	push   %rbp
     131:	48 89 e5             	mov    %rsp,%rbp
     134:	48 81 ec 80 02 00 00 	sub    $0x280,%rsp
     13b:	31 f6                	xor    %esi,%esi
     13d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     141:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     145:	e8 7e 0d 00 00       	callq  ec8 <open>
     14a:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%rbp)
     150:	83 f8 00             	cmp    $0x0,%eax
     153:	0f 8d 1f 00 00 00    	jge    178 <ls+0x48>
     159:	bf 02 00 00 00       	mov    $0x2,%edi
     15e:	48 be 9b 12 00 00 00 	movabs $0x129b,%rsi
     165:	00 00 00 
    printf(2, "ls: cannot open %s\n", path);
     168:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     16c:	b0 00                	mov    $0x0,%al
     16e:	e8 dd 02 00 00       	callq  450 <printf>
    return;
     173:	e9 5c 02 00 00       	jmpq   3d4 <ls+0x2a4>
     178:	48 8d b5 b8 fd ff ff 	lea    -0x248(%rbp),%rsi
  }

  if(fstat(fd, &st) < 0){
     17f:	8b bd e4 fd ff ff    	mov    -0x21c(%rbp),%edi
     185:	e8 56 0d 00 00       	callq  ee0 <fstat>
     18a:	83 f8 00             	cmp    $0x0,%eax
     18d:	0f 8d 30 00 00 00    	jge    1c3 <ls+0x93>
     193:	bf 02 00 00 00       	mov    $0x2,%edi
     198:	48 be af 12 00 00 00 	movabs $0x12af,%rsi
     19f:	00 00 00 
    printf(2, "ls: cannot stat %s\n", path);
     1a2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     1a6:	b0 00                	mov    $0x0,%al
     1a8:	e8 a3 02 00 00       	callq  450 <printf>
    close(fd);
     1ad:	8b bd e4 fd ff ff    	mov    -0x21c(%rbp),%edi
     1b3:	e8 f8 0c 00 00       	callq  eb0 <close>
    return;
     1b8:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%rbp)
     1be:	e9 11 02 00 00       	jmpq   3d4 <ls+0x2a4>
  }

  switch(st.type){
     1c3:	0f bf 85 b8 fd ff ff 	movswl -0x248(%rbp),%eax
     1ca:	89 c1                	mov    %eax,%ecx
     1cc:	83 e9 01             	sub    $0x1,%ecx
     1cf:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
     1d5:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%rbp)
     1db:	0f 84 5b 00 00 00    	je     23c <ls+0x10c>
     1e1:	e9 00 00 00 00       	jmpq   1e6 <ls+0xb6>
     1e6:	8b 85 b0 fd ff ff    	mov    -0x250(%rbp),%eax
     1ec:	83 e8 02             	sub    $0x2,%eax
     1ef:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%rbp)
     1f5:	0f 85 c8 01 00 00    	jne    3c3 <ls+0x293>
     1fb:	e9 00 00 00 00       	jmpq   200 <ls+0xd0>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     200:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     204:	e8 f7 fd ff ff       	callq  0 <fmtname>
     209:	bf 01 00 00 00       	mov    $0x1,%edi
     20e:	48 be c3 12 00 00 00 	movabs $0x12c3,%rsi
     215:	00 00 00 
     218:	0f bf 8d b8 fd ff ff 	movswl -0x248(%rbp),%ecx
     21f:	44 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8d
     226:	44 8b 8d c8 fd ff ff 	mov    -0x238(%rbp),%r9d
     22d:	48 89 c2             	mov    %rax,%rdx
     230:	b0 00                	mov    $0x0,%al
     232:	e8 19 02 00 00       	callq  450 <printf>
    break;
     237:	e9 87 01 00 00       	jmpq   3c3 <ls+0x293>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     23c:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     240:	e8 5b 09 00 00       	callq  ba0 <strlen>
     245:	83 c0 01             	add    $0x1,%eax
     248:	83 c0 0e             	add    $0xe,%eax
     24b:	83 c0 01             	add    $0x1,%eax
     24e:	89 c0                	mov    %eax,%eax
     250:	89 c7                	mov    %eax,%edi
     252:	48 81 ff 00 02 00 00 	cmp    $0x200,%rdi
     259:	0f 86 1b 00 00 00    	jbe    27a <ls+0x14a>
     25f:	bf 01 00 00 00       	mov    $0x1,%edi
     264:	48 be d0 12 00 00 00 	movabs $0x12d0,%rsi
     26b:	00 00 00 
      printf(1, "ls: path too long\n");
     26e:	b0 00                	mov    $0x0,%al
     270:	e8 db 01 00 00       	callq  450 <printf>
      break;
     275:	e9 49 01 00 00       	jmpq   3c3 <ls+0x293>
     27a:	48 8d bd f0 fd ff ff 	lea    -0x210(%rbp),%rdi
    }
    strcpy(buf, path);
     281:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     285:	e8 46 08 00 00       	callq  ad0 <strcpy>
     28a:	48 8d b5 f0 fd ff ff 	lea    -0x210(%rbp),%rsi
    p = buf+strlen(buf);
     291:	48 89 f7             	mov    %rsi,%rdi
     294:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
     29b:	48 89 b5 98 fd ff ff 	mov    %rsi,-0x268(%rbp)
     2a2:	e8 f9 08 00 00       	callq  ba0 <strlen>
     2a7:	89 c0                	mov    %eax,%eax
     2a9:	89 c6                	mov    %eax,%esi
     2ab:	48 8b bd 98 fd ff ff 	mov    -0x268(%rbp),%rdi
     2b2:	48 01 f7             	add    %rsi,%rdi
     2b5:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
    *p++ = '/';
     2bc:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
     2c3:	48 89 f7             	mov    %rsi,%rdi
     2c6:	48 83 c7 01          	add    $0x1,%rdi
     2ca:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
     2d1:	c6 06 2f             	movb   $0x2f,(%rsi)
     2d4:	ba 10 00 00 00       	mov    $0x10,%edx
     2d9:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2e0:	8b bd e4 fd ff ff    	mov    -0x21c(%rbp),%edi
     2e6:	48 89 c6             	mov    %rax,%rsi
     2e9:	e8 b2 0b 00 00       	callq  ea0 <read>
     2ee:	48 63 f0             	movslq %eax,%rsi
     2f1:	48 83 fe 10          	cmp    $0x10,%rsi
     2f5:	0f 85 c3 00 00 00    	jne    3be <ls+0x28e>
      if(de.inum == 0)
     2fb:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%rbp),%eax
     302:	83 f8 00             	cmp    $0x0,%eax
     305:	0f 85 05 00 00 00    	jne    310 <ls+0x1e0>
        continue;
     30b:	e9 c4 ff ff ff       	jmpq   2d4 <ls+0x1a4>
     310:	ba 0e 00 00 00       	mov    $0xe,%edx
     315:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
      memmove(p, de.name, DIRSIZ);
     31c:	48 8b bd e8 fd ff ff 	mov    -0x218(%rbp),%rdi
     323:	48 83 c0 02          	add    $0x2,%rax
     327:	48 89 c6             	mov    %rax,%rsi
     32a:	e8 f1 0a 00 00       	callq  e20 <memmove>
     32f:	48 8d b5 b8 fd ff ff 	lea    -0x248(%rbp),%rsi
     336:	48 8d bd f0 fd ff ff 	lea    -0x210(%rbp),%rdi
      p[DIRSIZ] = 0;
     33d:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
     344:	c6 41 0e 00          	movb   $0x0,0xe(%rcx)
      if(stat(buf, &st) < 0){
     348:	48 89 85 90 fd ff ff 	mov    %rax,-0x270(%rbp)
     34f:	e8 ec 09 00 00       	callq  d40 <stat>
     354:	83 f8 00             	cmp    $0x0,%eax
     357:	0f 8d 22 00 00 00    	jge    37f <ls+0x24f>
     35d:	bf 01 00 00 00       	mov    $0x1,%edi
     362:	48 be af 12 00 00 00 	movabs $0x12af,%rsi
     369:	00 00 00 
     36c:	48 8d 95 f0 fd ff ff 	lea    -0x210(%rbp),%rdx
        printf(1, "ls: cannot stat %s\n", buf);
     373:	b0 00                	mov    $0x0,%al
     375:	e8 d6 00 00 00       	callq  450 <printf>
        continue;
     37a:	e9 55 ff ff ff       	jmpq   2d4 <ls+0x1a4>
     37f:	48 8d bd f0 fd ff ff 	lea    -0x210(%rbp),%rdi
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     386:	e8 75 fc ff ff       	callq  0 <fmtname>
     38b:	bf 01 00 00 00       	mov    $0x1,%edi
     390:	48 be c3 12 00 00 00 	movabs $0x12c3,%rsi
     397:	00 00 00 
     39a:	0f bf 8d b8 fd ff ff 	movswl -0x248(%rbp),%ecx
     3a1:	44 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8d
     3a8:	44 8b 8d c8 fd ff ff 	mov    -0x238(%rbp),%r9d
     3af:	48 89 c2             	mov    %rax,%rdx
     3b2:	b0 00                	mov    $0x0,%al
     3b4:	e8 97 00 00 00       	callq  450 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     3b9:	e9 16 ff ff ff       	jmpq   2d4 <ls+0x1a4>
    }
    break;
     3be:	e9 00 00 00 00       	jmpq   3c3 <ls+0x293>
  }
  close(fd);
     3c3:	8b bd e4 fd ff ff    	mov    -0x21c(%rbp),%edi
     3c9:	e8 e2 0a 00 00       	callq  eb0 <close>
     3ce:	89 85 8c fd ff ff    	mov    %eax,-0x274(%rbp)
}
     3d4:	48 81 c4 80 02 00 00 	add    $0x280,%rsp
     3db:	5d                   	pop    %rbp
     3dc:	c3                   	retq   
     3dd:	0f 1f 00             	nopl   (%rax)

00000000000003e0 <main>:

int
main(int argc, char *argv[])
{
     3e0:	55                   	push   %rbp
     3e1:	48 89 e5             	mov    %rsp,%rbp
     3e4:	48 83 ec 20          	sub    $0x20,%rsp
     3e8:	89 7d f8             	mov    %edi,-0x8(%rbp)
     3eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  int i;

  if(argc < 2){
     3ef:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
     3f3:	0f 8d 17 00 00 00    	jge    410 <main+0x30>
     3f9:	48 bf e3 12 00 00 00 	movabs $0x12e3,%rdi
     400:	00 00 00 
    ls(".");
     403:	e8 28 fd ff ff       	callq  130 <ls>
    exit();
     408:	e8 7b 0a 00 00       	callq  e88 <exit>
     40d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  }
  for(i=1; i<argc; i++)
     410:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
     417:	8b 45 ec             	mov    -0x14(%rbp),%eax
     41a:	3b 45 f8             	cmp    -0x8(%rbp),%eax
     41d:	0f 8d 1f 00 00 00    	jge    442 <main+0x62>
    ls(argv[i]);
     423:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     427:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
     42b:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
     42f:	e8 fc fc ff ff       	callq  130 <ls>
  for(i=1; i<argc; i++)
     434:	8b 45 ec             	mov    -0x14(%rbp),%eax
     437:	83 c0 01             	add    $0x1,%eax
     43a:	89 45 ec             	mov    %eax,-0x14(%rbp)
     43d:	e9 d5 ff ff ff       	jmpq   417 <main+0x37>
  exit();
     442:	e8 41 0a 00 00       	callq  e88 <exit>
     447:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     44a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000450 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     450:	55                   	push   %rbp
     451:	48 89 e5             	mov    %rsp,%rbp
     454:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     45b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
     45f:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
     463:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     467:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
     46b:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
     46f:	89 7d fc             	mov    %edi,-0x4(%rbp)
     472:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     476:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  char *s;
  int c, i, state;
  int lflag;  
  va_list valist;
  va_start(valist, fmt);
     47a:	48 89 51 10          	mov    %rdx,0x10(%rcx)
     47e:	48 8d 55 10          	lea    0x10(%rbp),%rdx
     482:	48 89 51 08          	mov    %rdx,0x8(%rcx)
     486:	c7 41 04 30 00 00 00 	movl   $0x30,0x4(%rcx)
     48d:	c7 01 10 00 00 00    	movl   $0x10,(%rcx)

  state = 0;
     493:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  for(i = 0; fmt[i]; i++){
     49a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     4a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4a5:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     4a9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     4ad:	0f 84 f0 03 00 00    	je     8a3 <printf+0x453>
    c = fmt[i] & 0xff;
     4b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4b7:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
     4bb:	0f be 14 08          	movsbl (%rax,%rcx,1),%edx
     4bf:	81 e2 ff 00 00 00    	and    $0xff,%edx
     4c5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    if(state == 0){
     4c8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
     4cc:	0f 85 32 00 00 00    	jne    504 <printf+0xb4>
      if(c == '%'){
     4d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     4d6:	0f 85 13 00 00 00    	jne    4ef <printf+0x9f>
        state = '%';
     4dc:	c7 45 dc 25 00 00 00 	movl   $0x25,-0x24(%rbp)
        lflag = 0;
     4e3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
      } else {
     4ea:	e9 10 00 00 00       	jmpq   4ff <printf+0xaf>
        putc(fd, c);
     4ef:	8b 7d fc             	mov    -0x4(%rbp),%edi
     4f2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     4f5:	88 c1                	mov    %al,%cl
     4f7:	0f be f1             	movsbl %cl,%esi
     4fa:	e8 b1 03 00 00       	callq  8b0 <putc>
      }
    } else if(state == '%'){
     4ff:	e9 8c 03 00 00       	jmpq   890 <printf+0x440>
     504:	83 7d dc 25          	cmpl   $0x25,-0x24(%rbp)
     508:	0f 85 7d 03 00 00    	jne    88b <printf+0x43b>
      if(c == 'l') {
     50e:	83 7d e4 6c          	cmpl   $0x6c,-0x1c(%rbp)
     512:	0f 85 0c 00 00 00    	jne    524 <printf+0xd4>
        lflag = 1;
     518:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
        continue;
     51f:	e9 71 03 00 00       	jmpq   895 <printf+0x445>
      } else if(c == 'd'){
     524:	83 7d e4 64          	cmpl   $0x64,-0x1c(%rbp)
     528:	0f 85 0e 01 00 00    	jne    63c <printf+0x1ec>
        if (lflag == 1)
     52e:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     532:	0f 85 79 00 00 00    	jne    5b1 <printf+0x161>
     538:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 10, 1);
     53c:	8b 7d fc             	mov    -0x4(%rbp),%edi
     53f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     542:	83 f9 28             	cmp    $0x28,%ecx
     545:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     549:	89 7d 84             	mov    %edi,-0x7c(%rbp)
     54c:	89 4d 80             	mov    %ecx,-0x80(%rbp)
     54f:	0f 87 1f 00 00 00    	ja     574 <printf+0x124>
     555:	8b 45 80             	mov    -0x80(%rbp),%eax
     558:	48 63 c8             	movslq %eax,%rcx
     55b:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
     55f:	48 03 4a 10          	add    0x10(%rdx),%rcx
     563:	83 c0 08             	add    $0x8,%eax
     566:	89 02                	mov    %eax,(%rdx)
     568:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     56f:	e9 1a 00 00 00       	jmpq   58e <printf+0x13e>
     574:	48 8b 45 88          	mov    -0x78(%rbp),%rax
     578:	48 8b 48 08          	mov    0x8(%rax),%rcx
     57c:	48 89 ca             	mov    %rcx,%rdx
     57f:	48 83 c1 08          	add    $0x8,%rcx
     583:	48 89 48 08          	mov    %rcx,0x8(%rax)
     587:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
     58e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
     595:	ba 0a 00 00 00       	mov    $0xa,%edx
     59a:	b9 01 00 00 00       	mov    $0x1,%ecx
     59f:	48 8b 00             	mov    (%rax),%rax
     5a2:	89 c6                	mov    %eax,%esi
     5a4:	8b 7d 84             	mov    -0x7c(%rbp),%edi
     5a7:	e8 34 03 00 00       	callq  8e0 <printint64>
     5ac:	e9 86 00 00 00       	jmpq   637 <printf+0x1e7>
     5b1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 10, 1);       
     5b5:	8b 7d fc             	mov    -0x4(%rbp),%edi
     5b8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     5bb:	83 f9 28             	cmp    $0x28,%ecx
     5be:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
     5c5:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
     5cb:	89 8d 68 ff ff ff    	mov    %ecx,-0x98(%rbp)
     5d1:	0f 87 25 00 00 00    	ja     5fc <printf+0x1ac>
     5d7:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
     5dd:	48 63 c8             	movslq %eax,%rcx
     5e0:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
     5e7:	48 03 4a 10          	add    0x10(%rdx),%rcx
     5eb:	83 c0 08             	add    $0x8,%eax
     5ee:	89 02                	mov    %eax,(%rdx)
     5f0:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     5f7:	e9 1d 00 00 00       	jmpq   619 <printf+0x1c9>
     5fc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
     603:	48 8b 48 08          	mov    0x8(%rax),%rcx
     607:	48 89 ca             	mov    %rcx,%rdx
     60a:	48 83 c1 08          	add    $0x8,%rcx
     60e:	48 89 48 08          	mov    %rcx,0x8(%rax)
     612:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
     619:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
     620:	ba 0a 00 00 00       	mov    $0xa,%edx
     625:	b9 01 00 00 00       	mov    $0x1,%ecx
     62a:	8b 30                	mov    (%rax),%esi
     62c:	8b bd 6c ff ff ff    	mov    -0x94(%rbp),%edi
     632:	e8 a9 03 00 00       	callq  9e0 <printint>
      } else if(c == 'x' || c == 'p'){
     637:	e9 43 02 00 00       	jmpq   87f <printf+0x42f>
     63c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%rbp)
     640:	0f 84 0a 00 00 00    	je     650 <printf+0x200>
     646:	83 7d e4 70          	cmpl   $0x70,-0x1c(%rbp)
     64a:	0f 85 1d 01 00 00    	jne    76d <printf+0x31d>
        if (lflag == 1)
     650:	83 7d d8 01          	cmpl   $0x1,-0x28(%rbp)
     654:	0f 85 8b 00 00 00    	jne    6e5 <printf+0x295>
     65a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
          printint64(fd, va_arg(valist, int64_t), 16, 0);
     65e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     661:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     664:	83 f9 28             	cmp    $0x28,%ecx
     667:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
     66e:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
     674:	89 8d 50 ff ff ff    	mov    %ecx,-0xb0(%rbp)
     67a:	0f 87 25 00 00 00    	ja     6a5 <printf+0x255>
     680:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
     686:	48 63 c8             	movslq %eax,%rcx
     689:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
     690:	48 03 4a 10          	add    0x10(%rdx),%rcx
     694:	83 c0 08             	add    $0x8,%eax
     697:	89 02                	mov    %eax,(%rdx)
     699:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     6a0:	e9 1d 00 00 00       	jmpq   6c2 <printf+0x272>
     6a5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
     6ac:	48 8b 48 08          	mov    0x8(%rax),%rcx
     6b0:	48 89 ca             	mov    %rcx,%rdx
     6b3:	48 83 c1 08          	add    $0x8,%rcx
     6b7:	48 89 48 08          	mov    %rcx,0x8(%rax)
     6bb:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     6c2:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
     6c9:	ba 10 00 00 00       	mov    $0x10,%edx
     6ce:	31 c9                	xor    %ecx,%ecx
     6d0:	48 8b 00             	mov    (%rax),%rax
     6d3:	89 c6                	mov    %eax,%esi
     6d5:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
     6db:	e8 00 02 00 00       	callq  8e0 <printint64>
     6e0:	e9 83 00 00 00       	jmpq   768 <printf+0x318>
     6e5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        else
          printint(fd, va_arg(valist, int), 16, 0);
     6e9:	8b 7d fc             	mov    -0x4(%rbp),%edi
     6ec:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     6ef:	83 f9 28             	cmp    $0x28,%ecx
     6f2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
     6f9:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
     6ff:	89 8d 38 ff ff ff    	mov    %ecx,-0xc8(%rbp)
     705:	0f 87 25 00 00 00    	ja     730 <printf+0x2e0>
     70b:	8b 85 38 ff ff ff    	mov    -0xc8(%rbp),%eax
     711:	48 63 c8             	movslq %eax,%rcx
     714:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
     71b:	48 03 4a 10          	add    0x10(%rdx),%rcx
     71f:	83 c0 08             	add    $0x8,%eax
     722:	89 02                	mov    %eax,(%rdx)
     724:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
     72b:	e9 1d 00 00 00       	jmpq   74d <printf+0x2fd>
     730:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
     737:	48 8b 48 08          	mov    0x8(%rax),%rcx
     73b:	48 89 ca             	mov    %rcx,%rdx
     73e:	48 83 c1 08          	add    $0x8,%rcx
     742:	48 89 48 08          	mov    %rcx,0x8(%rax)
     746:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
     74d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
     754:	ba 10 00 00 00       	mov    $0x10,%edx
     759:	31 c9                	xor    %ecx,%ecx
     75b:	8b 30                	mov    (%rax),%esi
     75d:	8b bd 3c ff ff ff    	mov    -0xc4(%rbp),%edi
     763:	e8 78 02 00 00       	callq  9e0 <printint>
      } else if(c == 's'){
     768:	e9 0d 01 00 00       	jmpq   87a <printf+0x42a>
     76d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%rbp)
     771:	0f 85 bc 00 00 00    	jne    833 <printf+0x3e3>
     777:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
        if((s = (char*)va_arg(valist, char *)) == 0)
     77b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
     77e:	83 f9 28             	cmp    $0x28,%ecx
     781:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
     788:	89 8d 24 ff ff ff    	mov    %ecx,-0xdc(%rbp)
     78e:	0f 87 25 00 00 00    	ja     7b9 <printf+0x369>
     794:	8b 85 24 ff ff ff    	mov    -0xdc(%rbp),%eax
     79a:	48 63 c8             	movslq %eax,%rcx
     79d:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
     7a4:	48 03 4a 10          	add    0x10(%rdx),%rcx
     7a8:	83 c0 08             	add    $0x8,%eax
     7ab:	89 02                	mov    %eax,(%rdx)
     7ad:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
     7b4:	e9 1d 00 00 00       	jmpq   7d6 <printf+0x386>
     7b9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
     7c0:	48 8b 48 08          	mov    0x8(%rax),%rcx
     7c4:	48 89 ca             	mov    %rcx,%rdx
     7c7:	48 83 c1 08          	add    $0x8,%rcx
     7cb:	48 89 48 08          	mov    %rcx,0x8(%rax)
     7cf:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
     7d6:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
     7dd:	48 8b 00             	mov    (%rax),%rax
     7e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     7e4:	48 83 f8 00          	cmp    $0x0,%rax
     7e8:	0f 85 0e 00 00 00    	jne    7fc <printf+0x3ac>
     7ee:	48 b8 e5 12 00 00 00 	movabs $0x12e5,%rax
     7f5:	00 00 00 
          s = "(null)";
     7f8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        for(; *s; s++)
     7fc:	e9 00 00 00 00       	jmpq   801 <printf+0x3b1>
     801:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     805:	80 38 00             	cmpb   $0x0,(%rax)
     808:	0f 84 20 00 00 00    	je     82e <printf+0x3de>
          putc(fd, *s);
     80e:	8b 7d fc             	mov    -0x4(%rbp),%edi
     811:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     815:	0f be 30             	movsbl (%rax),%esi
     818:	e8 93 00 00 00       	callq  8b0 <putc>
        for(; *s; s++)
     81d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     821:	48 83 c0 01          	add    $0x1,%rax
     825:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     829:	e9 d3 ff ff ff       	jmpq   801 <printf+0x3b1>
      } else if(c == '%'){
     82e:	e9 42 00 00 00       	jmpq   875 <printf+0x425>
     833:	83 7d e4 25          	cmpl   $0x25,-0x1c(%rbp)
     837:	0f 85 15 00 00 00    	jne    852 <printf+0x402>
        putc(fd, c);
     83d:	8b 7d fc             	mov    -0x4(%rbp),%edi
     840:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     843:	88 c1                	mov    %al,%cl
     845:	0f be f1             	movsbl %cl,%esi
     848:	e8 63 00 00 00       	callq  8b0 <putc>
      } else {
     84d:	e9 1e 00 00 00       	jmpq   870 <printf+0x420>
     852:	be 25 00 00 00       	mov    $0x25,%esi
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     857:	8b 7d fc             	mov    -0x4(%rbp),%edi
     85a:	e8 51 00 00 00       	callq  8b0 <putc>
        putc(fd, c);
     85f:	8b 7d fc             	mov    -0x4(%rbp),%edi
     862:	8b 75 e4             	mov    -0x1c(%rbp),%esi
     865:	40 88 f0             	mov    %sil,%al
     868:	0f be f0             	movsbl %al,%esi
     86b:	e8 40 00 00 00       	callq  8b0 <putc>
     870:	e9 00 00 00 00       	jmpq   875 <printf+0x425>
     875:	e9 00 00 00 00       	jmpq   87a <printf+0x42a>
     87a:	e9 00 00 00 00       	jmpq   87f <printf+0x42f>
     87f:	e9 00 00 00 00       	jmpq   884 <printf+0x434>
      }
      state = 0;
     884:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     88b:	e9 00 00 00 00       	jmpq   890 <printf+0x440>
    }
  }
     890:	e9 00 00 00 00       	jmpq   895 <printf+0x445>
  for(i = 0; fmt[i]; i++){
     895:	8b 45 e0             	mov    -0x20(%rbp),%eax
     898:	83 c0 01             	add    $0x1,%eax
     89b:	89 45 e0             	mov    %eax,-0x20(%rbp)
     89e:	e9 fe fb ff ff       	jmpq   4a1 <printf+0x51>

  va_end(valist);
}
     8a3:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
     8aa:	5d                   	pop    %rbp
     8ab:	c3                   	retq   
     8ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008b0 <putc>:
{
     8b0:	55                   	push   %rbp
     8b1:	48 89 e5             	mov    %rsp,%rbp
     8b4:	48 83 ec 10          	sub    $0x10,%rsp
     8b8:	40 88 f0             	mov    %sil,%al
     8bb:	48 8d 75 fb          	lea    -0x5(%rbp),%rsi
     8bf:	ba 01 00 00 00       	mov    $0x1,%edx
     8c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
     8c7:	88 45 fb             	mov    %al,-0x5(%rbp)
  write(fd, &c, 1);
     8ca:	8b 7d fc             	mov    -0x4(%rbp),%edi
     8cd:	e8 d6 05 00 00       	callq  ea8 <write>
}
     8d2:	89 45 f4             	mov    %eax,-0xc(%rbp)
     8d5:	48 83 c4 10          	add    $0x10,%rsp
     8d9:	5d                   	pop    %rbp
     8da:	c3                   	retq   
     8db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000008e0 <printint64>:
{
     8e0:	55                   	push   %rbp
     8e1:	48 89 e5             	mov    %rsp,%rbp
     8e4:	48 83 ec 50          	sub    $0x50,%rsp
     8e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
     8eb:	89 75 f8             	mov    %esi,-0x8(%rbp)
     8ee:	89 55 f4             	mov    %edx,-0xc(%rbp)
     8f1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  if(sgn && (sgn = xx < 0))
     8f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     8f8:	0f 84 30 00 00 00    	je     92e <printint64+0x4e>
     8fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     902:	0f 9c c0             	setl   %al
     905:	88 c1                	mov    %al,%cl
     907:	80 e1 01             	and    $0x1,%cl
     90a:	0f b6 d1             	movzbl %cl,%edx
     90d:	89 55 f0             	mov    %edx,-0x10(%rbp)
     910:	a8 01                	test   $0x1,%al
     912:	0f 85 05 00 00 00    	jne    91d <printint64+0x3d>
     918:	e9 11 00 00 00       	jmpq   92e <printint64+0x4e>
     91d:	31 c0                	xor    %eax,%eax
    x = -xx;
     91f:	2b 45 f8             	sub    -0x8(%rbp),%eax
     922:	48 63 c8             	movslq %eax,%rcx
     925:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     929:	e9 08 00 00 00       	jmpq   936 <printint64+0x56>
    x = xx;
     92e:	48 63 45 f8          	movslq -0x8(%rbp),%rax
     932:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  i = 0;
     936:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    buf[i++] = digits[x % base];
     93d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     941:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     945:	31 d2                	xor    %edx,%edx
     947:	48 f7 f1             	div    %rcx
     94a:	40 8a 34 15 40 15 00 	mov    0x1540(,%rdx,1),%sil
     951:	00 
     952:	8b 7d cc             	mov    -0x34(%rbp),%edi
     955:	41 89 f8             	mov    %edi,%r8d
     958:	41 83 c0 01          	add    $0x1,%r8d
     95c:	44 89 45 cc          	mov    %r8d,-0x34(%rbp)
     960:	48 63 cf             	movslq %edi,%rcx
     963:	40 88 74 0d d0       	mov    %sil,-0x30(%rbp,%rcx,1)
  }while((x /= base) != 0);
     968:	48 63 45 f4          	movslq -0xc(%rbp),%rax
     96c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     970:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     974:	48 89 c8             	mov    %rcx,%rax
     977:	31 d2                	xor    %edx,%edx
     979:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     97d:	48 f7 f1             	div    %rcx
     980:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     984:	48 83 f8 00          	cmp    $0x0,%rax
     988:	0f 85 af ff ff ff    	jne    93d <printint64+0x5d>
  if(sgn)
     98e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     992:	0f 84 13 00 00 00    	je     9ab <printint64+0xcb>
    buf[i++] = '-';
     998:	8b 45 cc             	mov    -0x34(%rbp),%eax
     99b:	89 c1                	mov    %eax,%ecx
     99d:	83 c1 01             	add    $0x1,%ecx
     9a0:	89 4d cc             	mov    %ecx,-0x34(%rbp)
     9a3:	48 63 d0             	movslq %eax,%rdx
     9a6:	c6 44 15 d0 2d       	movb   $0x2d,-0x30(%rbp,%rdx,1)
  while(--i >= 0)
     9ab:	e9 00 00 00 00       	jmpq   9b0 <printint64+0xd0>
     9b0:	8b 45 cc             	mov    -0x34(%rbp),%eax
     9b3:	83 c0 ff             	add    $0xffffffff,%eax
     9b6:	89 45 cc             	mov    %eax,-0x34(%rbp)
     9b9:	83 f8 00             	cmp    $0x0,%eax
     9bc:	0f 8c 16 00 00 00    	jl     9d8 <printint64+0xf8>
    putc(fd, buf[i]);
     9c2:	8b 7d fc             	mov    -0x4(%rbp),%edi
     9c5:	48 63 45 cc          	movslq -0x34(%rbp),%rax
     9c9:	0f be 74 05 d0       	movsbl -0x30(%rbp,%rax,1),%esi
     9ce:	e8 dd fe ff ff       	callq  8b0 <putc>
  while(--i >= 0)
     9d3:	e9 d8 ff ff ff       	jmpq   9b0 <printint64+0xd0>
}
     9d8:	48 83 c4 50          	add    $0x50,%rsp
     9dc:	5d                   	pop    %rbp
     9dd:	c3                   	retq   
     9de:	66 90                	xchg   %ax,%ax

00000000000009e0 <printint>:
{
     9e0:	55                   	push   %rbp
     9e1:	48 89 e5             	mov    %rsp,%rbp
     9e4:	48 83 ec 30          	sub    $0x30,%rsp
     9e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
     9eb:	89 75 f8             	mov    %esi,-0x8(%rbp)
     9ee:	89 55 f4             	mov    %edx,-0xc(%rbp)
     9f1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
  neg = 0;
     9f4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  if(sgn && xx < 0){
     9fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
     9ff:	0f 84 1e 00 00 00    	je     a23 <printint+0x43>
     a05:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
     a09:	0f 8d 14 00 00 00    	jge    a23 <printint+0x43>
     a0f:	31 c0                	xor    %eax,%eax
    neg = 1;
     a11:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
    x = -xx;
     a18:	2b 45 f8             	sub    -0x8(%rbp),%eax
     a1b:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  } else {
     a1e:	e9 06 00 00 00       	jmpq   a29 <printint+0x49>
    x = xx;
     a23:	8b 45 f8             	mov    -0x8(%rbp),%eax
     a26:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  i = 0;
     a29:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    buf[i++] = digits[x % base];
     a30:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     a33:	31 d2                	xor    %edx,%edx
     a35:	f7 75 f4             	divl   -0xc(%rbp)
     a38:	89 d2                	mov    %edx,%edx
     a3a:	89 d1                	mov    %edx,%ecx
     a3c:	40 8a 34 0d 60 15 00 	mov    0x1560(,%rcx,1),%sil
     a43:	00 
     a44:	8b 55 dc             	mov    -0x24(%rbp),%edx
     a47:	89 d7                	mov    %edx,%edi
     a49:	83 c7 01             	add    $0x1,%edi
     a4c:	89 7d dc             	mov    %edi,-0x24(%rbp)
     a4f:	48 63 ca             	movslq %edx,%rcx
     a52:	40 88 74 0d e0       	mov    %sil,-0x20(%rbp,%rcx,1)
  }while((x /= base) != 0);
     a57:	8b 45 f4             	mov    -0xc(%rbp),%eax
     a5a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
     a5d:	89 45 d0             	mov    %eax,-0x30(%rbp)
     a60:	89 c8                	mov    %ecx,%eax
     a62:	31 d2                	xor    %edx,%edx
     a64:	8b 4d d0             	mov    -0x30(%rbp),%ecx
     a67:	f7 f1                	div    %ecx
     a69:	89 45 d4             	mov    %eax,-0x2c(%rbp)
     a6c:	83 f8 00             	cmp    $0x0,%eax
     a6f:	0f 85 bb ff ff ff    	jne    a30 <printint+0x50>
  if(neg)
     a75:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
     a79:	0f 84 13 00 00 00    	je     a92 <printint+0xb2>
    buf[i++] = '-';
     a7f:	8b 45 dc             	mov    -0x24(%rbp),%eax
     a82:	89 c1                	mov    %eax,%ecx
     a84:	83 c1 01             	add    $0x1,%ecx
     a87:	89 4d dc             	mov    %ecx,-0x24(%rbp)
     a8a:	48 63 d0             	movslq %eax,%rdx
     a8d:	c6 44 15 e0 2d       	movb   $0x2d,-0x20(%rbp,%rdx,1)
  while(--i >= 0)
     a92:	e9 00 00 00 00       	jmpq   a97 <printint+0xb7>
     a97:	8b 45 dc             	mov    -0x24(%rbp),%eax
     a9a:	83 c0 ff             	add    $0xffffffff,%eax
     a9d:	89 45 dc             	mov    %eax,-0x24(%rbp)
     aa0:	83 f8 00             	cmp    $0x0,%eax
     aa3:	0f 8c 16 00 00 00    	jl     abf <printint+0xdf>
    putc(fd, buf[i]);
     aa9:	8b 7d fc             	mov    -0x4(%rbp),%edi
     aac:	48 63 45 dc          	movslq -0x24(%rbp),%rax
     ab0:	0f be 74 05 e0       	movsbl -0x20(%rbp,%rax,1),%esi
     ab5:	e8 f6 fd ff ff       	callq  8b0 <putc>
  while(--i >= 0)
     aba:	e9 d8 ff ff ff       	jmpq   a97 <printint+0xb7>
}
     abf:	48 83 c4 30          	add    $0x30,%rsp
     ac3:	5d                   	pop    %rbp
     ac4:	c3                   	retq   
     ac5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     acc:	00 00 00 
     acf:	90                   	nop

0000000000000ad0 <strcpy>:
#include <x86_64.h>


char*
strcpy(char *s, char *t)
{
     ad0:	55                   	push   %rbp
     ad1:	48 89 e5             	mov    %rsp,%rbp
     ad4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ad8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  char *os;

  os = s;
     adc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     ae0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  while((*s++ = *t++) != 0)
     ae4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ae8:	48 89 c1             	mov    %rax,%rcx
     aeb:	48 83 c1 01          	add    $0x1,%rcx
     aef:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
     af3:	8a 10                	mov    (%rax),%dl
     af5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     af9:	48 89 c1             	mov    %rax,%rcx
     afc:	48 83 c1 01          	add    $0x1,%rcx
     b00:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     b04:	88 10                	mov    %dl,(%rax)
     b06:	0f be f2             	movsbl %dl,%esi
     b09:	83 fe 00             	cmp    $0x0,%esi
     b0c:	0f 84 05 00 00 00    	je     b17 <strcpy+0x47>
     b12:	e9 cd ff ff ff       	jmpq   ae4 <strcpy+0x14>
    ;
  return os;
     b17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b1b:	5d                   	pop    %rbp
     b1c:	c3                   	retq   
     b1d:	0f 1f 00             	nopl   (%rax)

0000000000000b20 <strcmp>:
}

int
strcmp(const char *p, const char *q)
{
     b20:	55                   	push   %rbp
     b21:	48 89 e5             	mov    %rsp,%rbp
     b24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     b28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     b2c:	31 c0                	xor    %eax,%eax
     b2e:	88 c1                	mov    %al,%cl
  while(*p && *p == *q)
     b30:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     b34:	0f be 02             	movsbl (%rdx),%eax
     b37:	83 f8 00             	cmp    $0x0,%eax
     b3a:	88 4d ef             	mov    %cl,-0x11(%rbp)
     b3d:	0f 84 18 00 00 00    	je     b5b <strcmp+0x3b>
     b43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b47:	0f be 08             	movsbl (%rax),%ecx
     b4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b4e:	0f be 10             	movsbl (%rax),%edx
     b51:	39 d1                	cmp    %edx,%ecx
     b53:	40 0f 94 c6          	sete   %sil
     b57:	40 88 75 ef          	mov    %sil,-0x11(%rbp)
     b5b:	8a 45 ef             	mov    -0x11(%rbp),%al
     b5e:	a8 01                	test   $0x1,%al
     b60:	0f 85 05 00 00 00    	jne    b6b <strcmp+0x4b>
     b66:	e9 1d 00 00 00       	jmpq   b88 <strcmp+0x68>
    p++, q++;
     b6b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b6f:	48 83 c0 01          	add    $0x1,%rax
     b73:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     b77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b7b:	48 83 c0 01          	add    $0x1,%rax
     b7f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  while(*p && *p == *q)
     b83:	e9 a4 ff ff ff       	jmpq   b2c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     b88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b8c:	0f b6 08             	movzbl (%rax),%ecx
     b8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b93:	0f b6 10             	movzbl (%rax),%edx
     b96:	29 d1                	sub    %edx,%ecx
     b98:	89 c8                	mov    %ecx,%eax
     b9a:	5d                   	pop    %rbp
     b9b:	c3                   	retq   
     b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000ba0 <strlen>:
}

uint
strlen(char *s)
{
     ba0:	55                   	push   %rbp
     ba1:	48 89 e5             	mov    %rsp,%rbp
     ba4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  for(n = 0; s[n]; n++)
     ba8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     baf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     bb3:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
     bb7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
     bbb:	0f 84 13 00 00 00    	je     bd4 <strlen+0x34>
     bc1:	e9 00 00 00 00       	jmpq   bc6 <strlen+0x26>
     bc6:	8b 45 f4             	mov    -0xc(%rbp),%eax
     bc9:	83 c0 01             	add    $0x1,%eax
     bcc:	89 45 f4             	mov    %eax,-0xc(%rbp)
     bcf:	e9 db ff ff ff       	jmpq   baf <strlen+0xf>
    ;
  return n;
     bd4:	8b 45 f4             	mov    -0xc(%rbp),%eax
     bd7:	5d                   	pop    %rbp
     bd8:	c3                   	retq   
     bd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000be0 <memset>:
}

void*
memset(void *dst, int c, uint n)
{
     be0:	55                   	push   %rbp
     be1:	48 89 e5             	mov    %rsp,%rbp
     be4:	48 83 ec 10          	sub    $0x10,%rsp
     be8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     bec:	89 75 f4             	mov    %esi,-0xc(%rbp)
     bef:	89 55 f0             	mov    %edx,-0x10(%rbp)
  stosb(dst, c, n);
     bf2:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     bf6:	8b 75 f4             	mov    -0xc(%rbp),%esi
     bf9:	8b 55 f0             	mov    -0x10(%rbp),%edx
     bfc:	e8 0f 00 00 00       	callq  c10 <stosb>
  return dst;
     c01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c05:	48 83 c4 10          	add    $0x10,%rsp
     c09:	5d                   	pop    %rbp
     c0a:	c3                   	retq   
     c0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000c10 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     c10:	55                   	push   %rbp
     c11:	48 89 e5             	mov    %rsp,%rbp
     c14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c18:	89 75 f4             	mov    %esi,-0xc(%rbp)
     c1b:	89 55 f0             	mov    %edx,-0x10(%rbp)
  asm volatile("cld; rep stosb" :
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
     c1e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     c22:	8b 55 f0             	mov    -0x10(%rbp),%edx
     c25:	8b 45 f4             	mov    -0xc(%rbp),%eax
  asm volatile("cld; rep stosb" :
     c28:	89 d1                	mov    %edx,%ecx
     c2a:	fc                   	cld    
     c2b:	f3 aa                	rep stos %al,%es:(%rdi)
     c2d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     c31:	89 4d f0             	mov    %ecx,-0x10(%rbp)
               "memory", "cc");
}
     c34:	5d                   	pop    %rbp
     c35:	c3                   	retq   
     c36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     c3d:	00 00 00 

0000000000000c40 <strchr>:
}

char*
strchr(const char *s, char c)
{
     c40:	55                   	push   %rbp
     c41:	48 89 e5             	mov    %rsp,%rbp
     c44:	40 88 f0             	mov    %sil,%al
     c47:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     c4b:	88 45 ef             	mov    %al,-0x11(%rbp)
  for(; *s; s++)
     c4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c52:	80 38 00             	cmpb   $0x0,(%rax)
     c55:	0f 84 36 00 00 00    	je     c91 <strchr+0x51>
    if(*s == c)
     c5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c5f:	0f be 08             	movsbl (%rax),%ecx
     c62:	0f be 55 ef          	movsbl -0x11(%rbp),%edx
     c66:	39 d1                	cmp    %edx,%ecx
     c68:	0f 85 0d 00 00 00    	jne    c7b <strchr+0x3b>
      return (char*)s;
     c6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c72:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     c76:	e9 1e 00 00 00       	jmpq   c99 <strchr+0x59>
    if(*s == c)
     c7b:	e9 00 00 00 00       	jmpq   c80 <strchr+0x40>
  for(; *s; s++)
     c80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c84:	48 83 c0 01          	add    $0x1,%rax
     c88:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     c8c:	e9 bd ff ff ff       	jmpq   c4e <strchr+0xe>
  return 0;
     c91:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     c98:	00 
}
     c99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c9d:	5d                   	pop    %rbp
     c9e:	c3                   	retq   
     c9f:	90                   	nop

0000000000000ca0 <gets>:

char*
gets(char *buf, int max)
{
     ca0:	55                   	push   %rbp
     ca1:	48 89 e5             	mov    %rsp,%rbp
     ca4:	48 83 ec 20          	sub    $0x20,%rsp
     ca8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     cac:	89 75 f4             	mov    %esi,-0xc(%rbp)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     caf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
     cb6:	8b 45 f0             	mov    -0x10(%rbp),%eax
     cb9:	83 c0 01             	add    $0x1,%eax
     cbc:	3b 45 f4             	cmp    -0xc(%rbp),%eax
     cbf:	0f 8d 5e 00 00 00    	jge    d23 <gets+0x83>
     cc5:	31 ff                	xor    %edi,%edi
     cc7:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
     ccb:	ba 01 00 00 00       	mov    $0x1,%edx
    cc = read(0, &c, 1);
     cd0:	e8 cb 01 00 00       	callq  ea0 <read>
     cd5:	89 45 ec             	mov    %eax,-0x14(%rbp)
    if(cc < 1)
     cd8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
     cdc:	0f 8d 05 00 00 00    	jge    ce7 <gets+0x47>
      break;
     ce2:	e9 3c 00 00 00       	jmpq   d23 <gets+0x83>
    buf[i++] = c;
     ce7:	8a 45 eb             	mov    -0x15(%rbp),%al
     cea:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     cee:	8b 55 f0             	mov    -0x10(%rbp),%edx
     cf1:	89 d6                	mov    %edx,%esi
     cf3:	83 c6 01             	add    $0x1,%esi
     cf6:	89 75 f0             	mov    %esi,-0x10(%rbp)
     cf9:	48 63 fa             	movslq %edx,%rdi
     cfc:	88 04 39             	mov    %al,(%rcx,%rdi,1)
    if(c == '\n' || c == '\r')
     cff:	0f be 55 eb          	movsbl -0x15(%rbp),%edx
     d03:	83 fa 0a             	cmp    $0xa,%edx
     d06:	0f 84 0d 00 00 00    	je     d19 <gets+0x79>
     d0c:	0f be 45 eb          	movsbl -0x15(%rbp),%eax
     d10:	83 f8 0d             	cmp    $0xd,%eax
     d13:	0f 85 05 00 00 00    	jne    d1e <gets+0x7e>
      break;
     d19:	e9 05 00 00 00       	jmpq   d23 <gets+0x83>
  for(i=0; i+1 < max; ){
     d1e:	e9 93 ff ff ff       	jmpq   cb6 <gets+0x16>
  }
  buf[i] = '\0';
     d23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d27:	48 63 4d f0          	movslq -0x10(%rbp),%rcx
     d2b:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  return buf;
     d2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d33:	48 83 c4 20          	add    $0x20,%rsp
     d37:	5d                   	pop    %rbp
     d38:	c3                   	retq   
     d39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000d40 <stat>:
}

int
stat(char *n, struct stat *st)
{
     d40:	55                   	push   %rbp
     d41:	48 89 e5             	mov    %rsp,%rbp
     d44:	48 83 ec 30          	sub    $0x30,%rsp
     d48:	31 c0                	xor    %eax,%eax
     d4a:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
     d4e:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d52:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
     d56:	89 c6                	mov    %eax,%esi
     d58:	e8 6b 01 00 00       	callq  ec8 <open>
     d5d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  if(fd < 0)
     d60:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     d64:	0f 8d 0c 00 00 00    	jge    d76 <stat+0x36>
    return -1;
     d6a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
     d71:	e9 20 00 00 00       	jmpq   d96 <stat+0x56>
  r = fstat(fd, st);
     d76:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     d79:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
     d7d:	e8 5e 01 00 00       	callq  ee0 <fstat>
     d82:	89 45 e0             	mov    %eax,-0x20(%rbp)
  close(fd);
     d85:	8b 7d e4             	mov    -0x1c(%rbp),%edi
     d88:	e8 23 01 00 00       	callq  eb0 <close>
  return r;
     d8d:	8b 7d e0             	mov    -0x20(%rbp),%edi
     d90:	89 7d fc             	mov    %edi,-0x4(%rbp)
     d93:	89 45 dc             	mov    %eax,-0x24(%rbp)
}
     d96:	8b 45 fc             	mov    -0x4(%rbp),%eax
     d99:	48 83 c4 30          	add    $0x30,%rsp
     d9d:	5d                   	pop    %rbp
     d9e:	c3                   	retq   
     d9f:	90                   	nop

0000000000000da0 <atoi>:

int
atoi(const char *s)
{
     da0:	55                   	push   %rbp
     da1:	48 89 e5             	mov    %rsp,%rbp
     da4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  int n;

  n = 0;
     da8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
     daf:	31 c0                	xor    %eax,%eax
     db1:	88 c1                	mov    %al,%cl
     db3:	b8 30 00 00 00       	mov    $0x30,%eax
  while('0' <= *s && *s <= '9')
     db8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     dbc:	0f be 32             	movsbl (%rdx),%esi
     dbf:	39 f0                	cmp    %esi,%eax
     dc1:	88 4d f3             	mov    %cl,-0xd(%rbp)
     dc4:	0f 8f 10 00 00 00    	jg     dda <atoi+0x3a>
     dca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dce:	0f be 08             	movsbl (%rax),%ecx
     dd1:	83 f9 39             	cmp    $0x39,%ecx
     dd4:	0f 9e c2             	setle  %dl
     dd7:	88 55 f3             	mov    %dl,-0xd(%rbp)
     dda:	8a 45 f3             	mov    -0xd(%rbp),%al
     ddd:	a8 01                	test   $0x1,%al
     ddf:	0f 85 05 00 00 00    	jne    dea <atoi+0x4a>
     de5:	e9 23 00 00 00       	jmpq   e0d <atoi+0x6d>
    n = n*10 + *s++ - '0';
     dea:	6b 45 f4 0a          	imul   $0xa,-0xc(%rbp),%eax
     dee:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
     df2:	48 89 ca             	mov    %rcx,%rdx
     df5:	48 83 c2 01          	add    $0x1,%rdx
     df9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     dfd:	0f be 31             	movsbl (%rcx),%esi
     e00:	01 f0                	add    %esi,%eax
     e02:	83 e8 30             	sub    $0x30,%eax
     e05:	89 45 f4             	mov    %eax,-0xc(%rbp)
  while('0' <= *s && *s <= '9')
     e08:	e9 a2 ff ff ff       	jmpq   daf <atoi+0xf>
  return n;
     e0d:	8b 45 f4             	mov    -0xc(%rbp),%eax
     e10:	5d                   	pop    %rbp
     e11:	c3                   	retq   
     e12:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
     e19:	1f 84 00 00 00 00 00 

0000000000000e20 <memmove>:
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     e20:	55                   	push   %rbp
     e21:	48 89 e5             	mov    %rsp,%rbp
     e24:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e2c:	89 55 ec             	mov    %edx,-0x14(%rbp)
  char *dst, *src;

  dst = vdst;
     e2f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
     e33:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  src = vsrc;
     e37:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
     e3b:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  while(n-- > 0)
     e3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
     e42:	89 c1                	mov    %eax,%ecx
     e44:	83 c1 ff             	add    $0xffffffff,%ecx
     e47:	89 4d ec             	mov    %ecx,-0x14(%rbp)
     e4a:	83 f8 00             	cmp    $0x0,%eax
     e4d:	0f 8e 27 00 00 00    	jle    e7a <memmove+0x5a>
    *dst++ = *src++;
     e53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e57:	48 89 c1             	mov    %rax,%rcx
     e5a:	48 83 c1 01          	add    $0x1,%rcx
     e5e:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
     e62:	8a 10                	mov    (%rax),%dl
     e64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     e68:	48 89 c1             	mov    %rax,%rcx
     e6b:	48 83 c1 01          	add    $0x1,%rcx
     e6f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     e73:	88 10                	mov    %dl,(%rax)
  while(n-- > 0)
     e75:	e9 c5 ff ff ff       	jmpq   e3f <memmove+0x1f>
  return vdst;
     e7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e7e:	5d                   	pop    %rbp
     e7f:	c3                   	retq   

0000000000000e80 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $TRAP_SYSCALL; \
    ret

SYSCALL(fork)
     e80:	b8 01 00 00 00       	mov    $0x1,%eax
     e85:	cd 40                	int    $0x40
     e87:	c3                   	retq   

0000000000000e88 <exit>:
SYSCALL(exit)
     e88:	b8 02 00 00 00       	mov    $0x2,%eax
     e8d:	cd 40                	int    $0x40
     e8f:	c3                   	retq   

0000000000000e90 <wait>:
SYSCALL(wait)
     e90:	b8 03 00 00 00       	mov    $0x3,%eax
     e95:	cd 40                	int    $0x40
     e97:	c3                   	retq   

0000000000000e98 <pipe>:
SYSCALL(pipe)
     e98:	b8 04 00 00 00       	mov    $0x4,%eax
     e9d:	cd 40                	int    $0x40
     e9f:	c3                   	retq   

0000000000000ea0 <read>:
SYSCALL(read)
     ea0:	b8 05 00 00 00       	mov    $0x5,%eax
     ea5:	cd 40                	int    $0x40
     ea7:	c3                   	retq   

0000000000000ea8 <write>:
SYSCALL(write)
     ea8:	b8 10 00 00 00       	mov    $0x10,%eax
     ead:	cd 40                	int    $0x40
     eaf:	c3                   	retq   

0000000000000eb0 <close>:
SYSCALL(close)
     eb0:	b8 15 00 00 00       	mov    $0x15,%eax
     eb5:	cd 40                	int    $0x40
     eb7:	c3                   	retq   

0000000000000eb8 <kill>:
SYSCALL(kill)
     eb8:	b8 06 00 00 00       	mov    $0x6,%eax
     ebd:	cd 40                	int    $0x40
     ebf:	c3                   	retq   

0000000000000ec0 <exec>:
SYSCALL(exec)
     ec0:	b8 07 00 00 00       	mov    $0x7,%eax
     ec5:	cd 40                	int    $0x40
     ec7:	c3                   	retq   

0000000000000ec8 <open>:
SYSCALL(open)
     ec8:	b8 0f 00 00 00       	mov    $0xf,%eax
     ecd:	cd 40                	int    $0x40
     ecf:	c3                   	retq   

0000000000000ed0 <mknod>:
SYSCALL(mknod)
     ed0:	b8 11 00 00 00       	mov    $0x11,%eax
     ed5:	cd 40                	int    $0x40
     ed7:	c3                   	retq   

0000000000000ed8 <unlink>:
SYSCALL(unlink)
     ed8:	b8 12 00 00 00       	mov    $0x12,%eax
     edd:	cd 40                	int    $0x40
     edf:	c3                   	retq   

0000000000000ee0 <fstat>:
SYSCALL(fstat)
     ee0:	b8 08 00 00 00       	mov    $0x8,%eax
     ee5:	cd 40                	int    $0x40
     ee7:	c3                   	retq   

0000000000000ee8 <link>:
SYSCALL(link)
     ee8:	b8 13 00 00 00       	mov    $0x13,%eax
     eed:	cd 40                	int    $0x40
     eef:	c3                   	retq   

0000000000000ef0 <mkdir>:
SYSCALL(mkdir)
     ef0:	b8 14 00 00 00       	mov    $0x14,%eax
     ef5:	cd 40                	int    $0x40
     ef7:	c3                   	retq   

0000000000000ef8 <chdir>:
SYSCALL(chdir)
     ef8:	b8 09 00 00 00       	mov    $0x9,%eax
     efd:	cd 40                	int    $0x40
     eff:	c3                   	retq   

0000000000000f00 <dup>:
SYSCALL(dup)
     f00:	b8 0a 00 00 00       	mov    $0xa,%eax
     f05:	cd 40                	int    $0x40
     f07:	c3                   	retq   

0000000000000f08 <getpid>:
SYSCALL(getpid)
     f08:	b8 0b 00 00 00       	mov    $0xb,%eax
     f0d:	cd 40                	int    $0x40
     f0f:	c3                   	retq   

0000000000000f10 <sbrk>:
SYSCALL(sbrk)
     f10:	b8 0c 00 00 00       	mov    $0xc,%eax
     f15:	cd 40                	int    $0x40
     f17:	c3                   	retq   

0000000000000f18 <sleep>:
SYSCALL(sleep)
     f18:	b8 0d 00 00 00       	mov    $0xd,%eax
     f1d:	cd 40                	int    $0x40
     f1f:	c3                   	retq   

0000000000000f20 <uptime>:
SYSCALL(uptime)
     f20:	b8 0e 00 00 00       	mov    $0xe,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	retq   

0000000000000f28 <sysinfo>:
SYSCALL(sysinfo)
     f28:	b8 16 00 00 00       	mov    $0x16,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	retq   

0000000000000f30 <mmap>:
SYSCALL(mmap)
     f30:	b8 17 00 00 00       	mov    $0x17,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	retq   

0000000000000f38 <munmap>:
SYSCALL(munmap)
     f38:	b8 18 00 00 00       	mov    $0x18,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	retq   

0000000000000f40 <crashn>:
SYSCALL(crashn)
     f40:	b8 19 00 00 00       	mov    $0x19,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	retq   
     f48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     f4f:	00 

0000000000000f50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f50:	55                   	push   %rbp
     f51:	48 89 e5             	mov    %rsp,%rbp
     f54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f58:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
     f5c:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
     f60:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f64:	48 8b 3c 25 88 15 00 	mov    0x1588,%rdi
     f6b:	00 
     f6c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     f70:	31 c0                	xor    %eax,%eax
     f72:	88 c1                	mov    %al,%cl
     f74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     f78:	48 3b 55 e8          	cmp    -0x18(%rbp),%rdx
     f7c:	88 4d e7             	mov    %cl,-0x19(%rbp)
     f7f:	0f 86 11 00 00 00    	jbe    f96 <free+0x46>
     f85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f89:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     f8d:	48 3b 01             	cmp    (%rcx),%rax
     f90:	0f 92 c2             	setb   %dl
     f93:	88 55 e7             	mov    %dl,-0x19(%rbp)
     f96:	8a 45 e7             	mov    -0x19(%rbp),%al
     f99:	34 ff                	xor    $0xff,%al
     f9b:	a8 01                	test   $0x1,%al
     f9d:	0f 85 05 00 00 00    	jne    fa8 <free+0x58>
     fa3:	e9 4a 00 00 00       	jmpq   ff2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fa8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     fac:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     fb0:	48 3b 01             	cmp    (%rcx),%rax
     fb3:	0f 82 24 00 00 00    	jb     fdd <free+0x8d>
     fb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fbd:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
     fc1:	0f 87 11 00 00 00    	ja     fd8 <free+0x88>
     fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fcb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     fcf:	48 3b 01             	cmp    (%rcx),%rax
     fd2:	0f 83 05 00 00 00    	jae    fdd <free+0x8d>
      break;
     fd8:	e9 15 00 00 00       	jmpq   ff2 <free+0xa2>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fdd:	e9 00 00 00 00       	jmpq   fe2 <free+0x92>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fe2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     fe6:	48 8b 00             	mov    (%rax),%rax
     fe9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     fed:	e9 7e ff ff ff       	jmpq   f70 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
     ff2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ff6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     ffa:	8b 51 08             	mov    0x8(%rcx),%edx
     ffd:	89 d1                	mov    %edx,%ecx
     fff:	48 c1 e1 04          	shl    $0x4,%rcx
    1003:	48 01 c8             	add    %rcx,%rax
    1006:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    100a:	48 3b 01             	cmp    (%rcx),%rax
    100d:	0f 85 2a 00 00 00    	jne    103d <free+0xed>
    bp->s.size += p->s.ptr->s.size;
    1013:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1017:	48 8b 00             	mov    (%rax),%rax
    101a:	8b 48 08             	mov    0x8(%rax),%ecx
    101d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1021:	03 48 08             	add    0x8(%rax),%ecx
    1024:	89 48 08             	mov    %ecx,0x8(%rax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1027:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    102b:	48 8b 00             	mov    (%rax),%rax
    102e:	48 8b 00             	mov    (%rax),%rax
    1031:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1035:	48 89 02             	mov    %rax,(%rdx)
  } else
    1038:	e9 0e 00 00 00       	jmpq   104b <free+0xfb>
    bp->s.ptr = p->s.ptr;
    103d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1041:	48 8b 00             	mov    (%rax),%rax
    1044:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1048:	48 89 01             	mov    %rax,(%rcx)
  if(p + p->s.size == bp){
    104b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    104f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1053:	8b 51 08             	mov    0x8(%rcx),%edx
    1056:	89 d1                	mov    %edx,%ecx
    1058:	48 c1 e1 04          	shl    $0x4,%rcx
    105c:	48 01 c8             	add    %rcx,%rax
    105f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1063:	0f 85 24 00 00 00    	jne    108d <free+0x13d>
    p->s.size += bp->s.size;
    1069:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    106d:	8b 48 08             	mov    0x8(%rax),%ecx
    1070:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1074:	03 48 08             	add    0x8(%rax),%ecx
    1077:	89 48 08             	mov    %ecx,0x8(%rax)
    p->s.ptr = bp->s.ptr;
    107a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    107e:	48 8b 00             	mov    (%rax),%rax
    1081:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1085:	48 89 02             	mov    %rax,(%rdx)
  } else
    1088:	e9 0b 00 00 00       	jmpq   1098 <free+0x148>
    p->s.ptr = bp;
    108d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1091:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1095:	48 89 01             	mov    %rax,(%rcx)
  freep = p;
    1098:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    109c:	48 89 04 25 88 15 00 	mov    %rax,0x1588
    10a3:	00 
}
    10a4:	5d                   	pop    %rbp
    10a5:	c3                   	retq   
    10a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    10ad:	00 00 00 

00000000000010b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10b0:	55                   	push   %rbp
    10b1:	48 89 e5             	mov    %rsp,%rbp
    10b4:	48 83 ec 30          	sub    $0x30,%rsp
    10b8:	89 7d f4             	mov    %edi,-0xc(%rbp)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10bb:	8b 7d f4             	mov    -0xc(%rbp),%edi
    10be:	89 f8                	mov    %edi,%eax
    10c0:	48 83 c0 10          	add    $0x10,%rax
    10c4:	48 83 e8 01          	sub    $0x1,%rax
    10c8:	48 c1 e8 04          	shr    $0x4,%rax
    10cc:	48 83 c0 01          	add    $0x1,%rax
    10d0:	89 c7                	mov    %eax,%edi
    10d2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  if((prevp = freep) == 0){
    10d5:	48 8b 04 25 88 15 00 	mov    0x1588,%rax
    10dc:	00 
    10dd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    10e1:	48 83 f8 00          	cmp    $0x0,%rax
    10e5:	0f 85 29 00 00 00    	jne    1114 <malloc+0x64>
    10eb:	48 b8 90 15 00 00 00 	movabs $0x1590,%rax
    10f2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    10f5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    10f9:	48 89 04 25 88 15 00 	mov    %rax,0x1588
    1100:	00 
    1101:	48 89 04 25 90 15 00 	mov    %rax,0x1590
    1108:	00 
    base.s.size = 0;
    1109:	c7 04 25 98 15 00 00 	movl   $0x0,0x1598
    1110:	00 00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1114:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1118:	48 8b 00             	mov    (%rax),%rax
    111b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if(p->s.size >= nunits){
    111f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1123:	8b 48 08             	mov    0x8(%rax),%ecx
    1126:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1129:	0f 82 73 00 00 00    	jb     11a2 <malloc+0xf2>
      if(p->s.size == nunits)
    112f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1133:	8b 48 08             	mov    0x8(%rax),%ecx
    1136:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1139:	0f 85 13 00 00 00    	jne    1152 <malloc+0xa2>
        prevp->s.ptr = p->s.ptr;
    113f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1143:	48 8b 00             	mov    (%rax),%rax
    1146:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    114a:	48 89 01             	mov    %rax,(%rcx)
    114d:	e9 33 00 00 00       	jmpq   1185 <malloc+0xd5>
      else {
        p->s.size -= nunits;
    1152:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1155:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1159:	8b 51 08             	mov    0x8(%rcx),%edx
    115c:	29 c2                	sub    %eax,%edx
    115e:	89 51 08             	mov    %edx,0x8(%rcx)
        p += p->s.size;
    1161:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1165:	8b 41 08             	mov    0x8(%rcx),%eax
    1168:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    116c:	89 c0                	mov    %eax,%eax
    116e:	89 c6                	mov    %eax,%esi
    1170:	48 c1 e6 04          	shl    $0x4,%rsi
    1174:	48 01 f1             	add    %rsi,%rcx
    1177:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
        p->s.size = nunits;
    117b:	8b 45 dc             	mov    -0x24(%rbp),%eax
    117e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1182:	89 41 08             	mov    %eax,0x8(%rcx)
      }
      freep = prevp;
    1185:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1189:	48 89 04 25 88 15 00 	mov    %rax,0x1588
    1190:	00 
      return (void*)(p + 1);
    1191:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1195:	48 83 c0 10          	add    $0x10,%rax
    1199:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    119d:	e9 57 00 00 00       	jmpq   11f9 <malloc+0x149>
    }
    if(p == freep)
    11a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11a6:	48 3b 04 25 88 15 00 	cmp    0x1588,%rax
    11ad:	00 
    11ae:	0f 85 28 00 00 00    	jne    11dc <malloc+0x12c>
      if((p = morecore(nunits)) == 0)
    11b4:	8b 7d dc             	mov    -0x24(%rbp),%edi
    11b7:	e8 54 00 00 00       	callq  1210 <morecore>
    11bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    11c0:	48 83 f8 00          	cmp    $0x0,%rax
    11c4:	0f 85 0d 00 00 00    	jne    11d7 <malloc+0x127>
        return 0;
    11ca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    11d1:	00 
    11d2:	e9 22 00 00 00       	jmpq   11f9 <malloc+0x149>
      if((p = morecore(nunits)) == 0)
    11d7:	e9 00 00 00 00       	jmpq   11dc <malloc+0x12c>
  }
    11dc:	e9 00 00 00 00       	jmpq   11e1 <malloc+0x131>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11e5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    11e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11ed:	48 8b 00             	mov    (%rax),%rax
    11f0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    11f4:	e9 26 ff ff ff       	jmpq   111f <malloc+0x6f>
    11f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11fd:	48 83 c4 30          	add    $0x30,%rsp
    1201:	5d                   	pop    %rbp
    1202:	c3                   	retq   
    1203:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
    120a:	84 00 00 00 00 00 

0000000000001210 <morecore>:
{
    1210:	55                   	push   %rbp
    1211:	48 89 e5             	mov    %rsp,%rbp
    1214:	48 83 ec 20          	sub    $0x20,%rsp
    1218:	89 7d f4             	mov    %edi,-0xc(%rbp)
  if(nu < 4096)
    121b:	81 7d f4 00 10 00 00 	cmpl   $0x1000,-0xc(%rbp)
    1222:	0f 83 07 00 00 00    	jae    122f <morecore+0x1f>
    nu = 4096;
    1228:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  p = sbrk(nu * sizeof(Header));
    122f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1232:	89 c1                	mov    %eax,%ecx
    1234:	48 c1 e1 04          	shl    $0x4,%rcx
    1238:	89 c8                	mov    %ecx,%eax
    123a:	89 c7                	mov    %eax,%edi
    123c:	e8 cf fc ff ff       	callq  f10 <sbrk>
    1241:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1248:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  if(p == (char*)-1)
    124c:	48 39 4d e8          	cmp    %rcx,-0x18(%rbp)
    1250:	0f 85 0d 00 00 00    	jne    1263 <morecore+0x53>
    return 0;
    1256:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    125d:	00 
    125e:	e9 2e 00 00 00       	jmpq   1291 <morecore+0x81>
  hp = (Header*)p;
    1263:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1267:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  hp->s.size = nu;
    126b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    126e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1272:	89 48 08             	mov    %ecx,0x8(%rax)
  free((void*)(hp + 1));
    1275:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1279:	48 83 c0 10          	add    $0x10,%rax
    127d:	48 89 c7             	mov    %rax,%rdi
    1280:	e8 cb fc ff ff       	callq  f50 <free>
  return freep;
    1285:	48 8b 04 25 88 15 00 	mov    0x1588,%rax
    128c:	00 
    128d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}
    1291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1295:	48 83 c4 20          	add    $0x20,%rsp
    1299:	5d                   	pop    %rbp
    129a:	c3                   	retq   
