
out/bootblock.o:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	31 c0                	xor    %eax,%eax
    7c03:	8e d8                	mov    %eax,%ds
    7c05:	8e c0                	mov    %eax,%es
    7c07:	8e d0                	mov    %eax,%ss

00007c09 <seta20.1>:
    7c09:	e4 64                	in     $0x64,%al
    7c0b:	a8 02                	test   $0x2,%al
    7c0d:	75 fa                	jne    7c09 <seta20.1>
    7c0f:	b0 d1                	mov    $0xd1,%al
    7c11:	e6 64                	out    %al,$0x64

00007c13 <seta20.2>:
    7c13:	e4 64                	in     $0x64,%al
    7c15:	a8 02                	test   $0x2,%al
    7c17:	75 fa                	jne    7c13 <seta20.2>
    7c19:	b0 df                	mov    $0xdf,%al
    7c1b:	e6 60                	out    %al,$0x60

00007c1d <e820_start>:
    7c1d:	66 31 db             	xor    %bx,%bx
    7c20:	bf                   	.byte 0xbf
    7c21:	00                   	.byte 0x0
    7c22:	90                   	nop

00007c23 <e820_loop>:
    7c23:	66 c7 05 14 00 00 00 	movw   $0xc783,0x14
    7c2a:	83 c7 
    7c2c:	04 66                	add    $0x66,%al
    7c2e:	ba 50 41 4d 53       	mov    $0x534d4150,%edx
    7c33:	66 b8 20 e8          	mov    $0xe820,%ax
    7c37:	00 00                	add    %al,(%eax)
    7c39:	b9 14 00 cd 15       	mov    $0x15cd0014,%ecx
    7c3e:	72 0d                	jb     7c4d <e820_end>
    7c40:	83 f9 14             	cmp    $0x14,%ecx
    7c43:	7f 03                	jg     7c48 <e820_skip>

00007c45 <e820_next>:
    7c45:	83 c7 14             	add    $0x14,%edi

00007c48 <e820_skip>:
    7c48:	66 85 db             	test   %bx,%bx
    7c4b:	75 d6                	jne    7c23 <e820_loop>

00007c4d <e820_end>:
    7c4d:	67 66 89 3d          	mov    %di,(%di)
    7c51:	f0 7d 00             	lock jge 7c54 <e820_end+0x7>
    7c54:	00 67 0f             	add    %ah,0xf(%edi)
    7c57:	01 15 b4 7c 00 00    	add    %edx,0x7cb4
    7c5d:	0f 20 c0             	mov    %cr0,%eax
    7c60:	66 83 c8 01          	or     $0x1,%ax
    7c64:	0f 22 c0             	mov    %eax,%cr0
    7c67:	ea                   	.byte 0xea
    7c68:	6c                   	insb   (%dx),%es:(%edi)
    7c69:	7c 08                	jl     7c73 <start32+0x7>
	...

00007c6c <start32>:
    7c6c:	66 b8 10 00          	mov    $0x10,%ax
    7c70:	8e d8                	mov    %eax,%ds
    7c72:	8e c0                	mov    %eax,%es
    7c74:	8e d0                	mov    %eax,%ss
    7c76:	66 b8 00 00          	mov    $0x0,%ax
    7c7a:	8e e0                	mov    %eax,%fs
    7c7c:	8e e8                	mov    %eax,%gs
    7c7e:	bc 00 7c 00 00       	mov    $0x7c00,%esp
    7c83:	e8 34 00 00 00       	call   7cbc <bootmain>
    7c88:	66 b8 00 8a          	mov    $0x8a00,%ax
    7c8c:	66 89 c2             	mov    %ax,%dx
    7c8f:	66 ef                	out    %ax,(%dx)
    7c91:	66 b8 e0 8a          	mov    $0x8ae0,%ax
    7c95:	66 ef                	out    %ax,(%dx)

00007c97 <spin>:
    7c97:	eb fe                	jmp    7c97 <spin>
    7c99:	0f 1f 00             	nopl   (%eax)

00007c9c <gdt>:
	...
    7ca4:	ff                   	(bad)  
    7ca5:	ff 00                	incl   (%eax)
    7ca7:	00 00                	add    %al,(%eax)
    7ca9:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7cb0:	00                   	.byte 0x0
    7cb1:	92                   	xchg   %eax,%edx
    7cb2:	cf                   	iret   
	...

00007cb4 <gdtdesc>:
    7cb4:	17                   	pop    %ss
    7cb5:	00 9c 7c 00 00 66 90 	add    %bl,-0x6f9a0000(%esp,%edi,2)

00007cbc <bootmain>:
    7cbc:	55                   	push   %ebp
    7cbd:	53                   	push   %ebx
    7cbe:	57                   	push   %edi
    7cbf:	56                   	push   %esi
    7cc0:	83 ec 0c             	sub    $0xc,%esp
    7cc3:	31 ff                	xor    %edi,%edi
    7cc5:	be 00 00 01 00       	mov    $0x10000,%esi
    7cca:	47                   	inc    %edi
    7ccb:	83 ec 08             	sub    $0x8,%esp
    7cce:	57                   	push   %edi
    7ccf:	56                   	push   %esi
    7cd0:	e8 ba 00 00 00       	call   7d8f <readsect>
    7cd5:	83 c4 10             	add    $0x10,%esp
    7cd8:	47                   	inc    %edi
    7cd9:	81 c6 00 02 00 00    	add    $0x200,%esi
    7cdf:	83 ff 11             	cmp    $0x11,%edi
    7ce2:	75 e7                	jne    7ccb <bootmain+0xf>
    7ce4:	31 f6                	xor    %esi,%esi
    7ce6:	ba 1c 00 01 00       	mov    $0x1001c,%edx
    7ceb:	31 c0                	xor    %eax,%eax
    7ced:	81 7c 32 e4 02 b0 ad 	cmpl   $0x1badb002,-0x1c(%edx,%esi,1)
    7cf4:	1b 
    7cf5:	74 10                	je     7d07 <bootmain+0x4b>
    7cf7:	40                   	inc    %eax
    7cf8:	83 c6 04             	add    $0x4,%esi
    7cfb:	3d 00 08 00 00       	cmp    $0x800,%eax
    7d00:	72 eb                	jb     7ced <bootmain+0x31>
    7d02:	e9 80 00 00 00       	jmp    7d87 <bootmain+0xcb>
    7d07:	8b 6c 32 f4          	mov    -0xc(%edx,%esi,1),%ebp
    7d0b:	8b 7c 32 f8          	mov    -0x8(%edx,%esi,1),%edi
    7d0f:	89 eb                	mov    %ebp,%ebx
    7d11:	89 f9                	mov    %edi,%ecx
    7d13:	2b 5c 32 f0          	sub    -0x10(%edx,%esi,1),%ebx
    7d17:	29 e9                	sub    %ebp,%ecx
    7d19:	01 f3                	add    %esi,%ebx
    7d1b:	89 d8                	mov    %ebx,%eax
    7d1d:	25 ff 01 00 00       	and    $0x1ff,%eax
    7d22:	f7 d8                	neg    %eax
    7d24:	39 c1                	cmp    %eax,%ecx
    7d26:	7e 27                	jle    7d4f <bootmain+0x93>
    7d28:	c1 eb 09             	shr    $0x9,%ebx
    7d2b:	01 c5                	add    %eax,%ebp
    7d2d:	43                   	inc    %ebx
    7d2e:	83 ec 08             	sub    $0x8,%esp
    7d31:	53                   	push   %ebx
    7d32:	55                   	push   %ebp
    7d33:	e8 57 00 00 00       	call   7d8f <readsect>
    7d38:	83 c4 10             	add    $0x10,%esp
    7d3b:	81 c5 00 02 00 00    	add    $0x200,%ebp
    7d41:	43                   	inc    %ebx
    7d42:	39 fd                	cmp    %edi,%ebp
    7d44:	72 e8                	jb     7d2e <bootmain+0x72>
    7d46:	ba 1c 00 01 00       	mov    $0x1001c,%edx
    7d4b:	8b 7c 32 f8          	mov    -0x8(%edx,%esi,1),%edi
    7d4f:	8b 4c 32 fc          	mov    -0x4(%edx,%esi,1),%ecx
    7d53:	29 f9                	sub    %edi,%ecx
    7d55:	76 05                	jbe    7d5c <bootmain+0xa0>
    7d57:	31 c0                	xor    %eax,%eax
    7d59:	fc                   	cld    
    7d5a:	f3 aa                	rep stos %al,%es:(%edi)
    7d5c:	8b 0c 32             	mov    (%edx,%esi,1),%ecx
    7d5f:	8b 15 f0 7d 00 00    	mov    0x7df0,%edx
    7d65:	89 d0                	mov    %edx,%eax
    7d67:	89 d6                	mov    %edx,%esi
    7d69:	c7 02 40 00 00 00    	movl   $0x40,(%edx)
    7d6f:	25 ff 0f 00 00       	and    $0xfff,%eax
    7d74:	29 c6                	sub    %eax,%esi
    7d76:	89 42 2c             	mov    %eax,0x2c(%edx)
    7d79:	89 72 30             	mov    %esi,0x30(%edx)
    7d7c:	be 02 b0 ad 2b       	mov    $0x2badb002,%esi
    7d81:	89 f0                	mov    %esi,%eax
    7d83:	89 d3                	mov    %edx,%ebx
    7d85:	51                   	push   %ecx
    7d86:	c3                   	ret    
    7d87:	83 c4 0c             	add    $0xc,%esp
    7d8a:	5e                   	pop    %esi
    7d8b:	5f                   	pop    %edi
    7d8c:	5b                   	pop    %ebx
    7d8d:	5d                   	pop    %ebp
    7d8e:	c3                   	ret    

00007d8f <readsect>:
    7d8f:	57                   	push   %edi
    7d90:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    7d94:	8b 7c 24 08          	mov    0x8(%esp),%edi
    7d98:	66 ba f7 01          	mov    $0x1f7,%dx
    7d9c:	ec                   	in     (%dx),%al
    7d9d:	24 c0                	and    $0xc0,%al
    7d9f:	3c 40                	cmp    $0x40,%al
    7da1:	75 f5                	jne    7d98 <readsect+0x9>
    7da3:	b0 01                	mov    $0x1,%al
    7da5:	66 ba f2 01          	mov    $0x1f2,%dx
    7da9:	ee                   	out    %al,(%dx)
    7daa:	66 ba f3 01          	mov    $0x1f3,%dx
    7dae:	89 c8                	mov    %ecx,%eax
    7db0:	ee                   	out    %al,(%dx)
    7db1:	66 ba f4 01          	mov    $0x1f4,%dx
    7db5:	88 e8                	mov    %ch,%al
    7db7:	ee                   	out    %al,(%dx)
    7db8:	89 c8                	mov    %ecx,%eax
    7dba:	c1 e9 18             	shr    $0x18,%ecx
    7dbd:	66 ba f5 01          	mov    $0x1f5,%dx
    7dc1:	c1 e8 10             	shr    $0x10,%eax
    7dc4:	80 c9 e0             	or     $0xe0,%cl
    7dc7:	ee                   	out    %al,(%dx)
    7dc8:	66 ba f6 01          	mov    $0x1f6,%dx
    7dcc:	89 c8                	mov    %ecx,%eax
    7dce:	ee                   	out    %al,(%dx)
    7dcf:	b0 20                	mov    $0x20,%al
    7dd1:	66 ba f7 01          	mov    $0x1f7,%dx
    7dd5:	ee                   	out    %al,(%dx)
    7dd6:	66 ba f7 01          	mov    $0x1f7,%dx
    7dda:	ec                   	in     (%dx),%al
    7ddb:	24 c0                	and    $0xc0,%al
    7ddd:	3c 40                	cmp    $0x40,%al
    7ddf:	75 f5                	jne    7dd6 <readsect+0x47>
    7de1:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7de6:	b9 80 00 00 00       	mov    $0x80,%ecx
    7deb:	fc                   	cld    
    7dec:	f3 6d                	rep insl (%dx),%es:(%edi)
    7dee:	5f                   	pop    %edi
    7def:	c3                   	ret    
