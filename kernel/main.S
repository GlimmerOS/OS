
main.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <read_mhartid>:
   0:	1101                	addi	sp,sp,-32
   2:	ec22                	sd	s0,24(sp)
   4:	1000                	addi	s0,sp,32
   6:	f14027f3          	csrr	a5,mhartid
   a:	fef43423          	sd	a5,-24(s0)
   e:	fe843783          	ld	a5,-24(s0)
  12:	853e                	mv	a0,a5
  14:	6462                	ld	s0,24(sp)
  16:	6105                	addi	sp,sp,32
  18:	8082                	ret

000000000000001a <cpuid>:
  1a:	1101                	addi	sp,sp,-32
  1c:	ec06                	sd	ra,24(sp)
  1e:	e822                	sd	s0,16(sp)
  20:	1000                	addi	s0,sp,32
  22:	00000097          	auipc	ra,0x0
  26:	000080e7          	jalr	ra # 22 <cpuid+0x8>
  2a:	87aa                	mv	a5,a0
  2c:	fef42623          	sw	a5,-20(s0)
  30:	fec42783          	lw	a5,-20(s0)
  34:	853e                	mv	a0,a5
  36:	60e2                	ld	ra,24(sp)
  38:	6442                	ld	s0,16(sp)
  3a:	6105                	addi	sp,sp,32
  3c:	8082                	ret

000000000000003e <mycpu>:
  3e:	1101                	addi	sp,sp,-32
  40:	ec06                	sd	ra,24(sp)
  42:	e822                	sd	s0,16(sp)
  44:	1000                	addi	s0,sp,32
  46:	00000097          	auipc	ra,0x0
  4a:	000080e7          	jalr	ra # 46 <mycpu+0x8>
  4e:	87aa                	mv	a5,a0
  50:	fef42623          	sw	a5,-20(s0)
  54:	fec42703          	lw	a4,-20(s0)
  58:	87ba                	mv	a5,a4
  5a:	0792                	slli	a5,a5,0x4
  5c:	8f99                	sub	a5,a5,a4
  5e:	078e                	slli	a5,a5,0x3
  60:	00000737          	lui	a4,0x0
  64:	00070713          	mv	a4,a4
  68:	97ba                	add	a5,a5,a4
  6a:	fef43023          	sd	a5,-32(s0)
  6e:	fe043783          	ld	a5,-32(s0)
  72:	853e                	mv	a0,a5
  74:	60e2                	ld	ra,24(sp)
  76:	6442                	ld	s0,16(sp)
  78:	6105                	addi	sp,sp,32
  7a:	8082                	ret

000000000000007c <main>:
  7c:	1141                	addi	sp,sp,-16
  7e:	e422                	sd	s0,8(sp)
  80:	0800                	addi	s0,sp,16
  82:	0001                	nop
  84:	6422                	ld	s0,8(sp)
  86:	0141                	addi	sp,sp,16
  88:	8082                	ret

Disassembly of section .bss:

0000000000000000 <boot_stack>:
	...

0000000000001000 <cpus>:
	...

Disassembly of section .debug_info:

0000000000000000 <.Ldebug_info0>:
   0:	0000026b          	0x26b
   4:	0004                	0x4
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0108                	addi	a0,sp,128
   c:	0000                	unimp
   e:	0000                	unimp
  10:	000c                	0xc
	...
  2a:	0000                	unimp
  2c:	0200                	addi	s0,sp,256
  2e:	0801                	addi	a6,a6,0
  30:	0000                	unimp
  32:	0000                	unimp
  34:	0202                	c.slli64	tp
  36:	0005                	c.nop	1
  38:	0000                	unimp
  3a:	0300                	addi	s0,sp,384
  3c:	0504                	addi	s1,sp,640
  3e:	6e69                	lui	t3,0x1a
  40:	0074                	addi	a3,sp,12
  42:	0802                	c.slli64	a6
  44:	0005                	c.nop	1
  46:	0000                	unimp
  48:	0200                	addi	s0,sp,256
  4a:	0801                	addi	a6,a6,0
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	0202                	c.slli64	tp
  52:	00000007          	0x7
  56:	0200                	addi	s0,sp,256
  58:	0704                	addi	s1,sp,896
  5a:	0000                	unimp
  5c:	0000                	unimp
  5e:	0004                	0x4
  60:	0000                	unimp
  62:	0400                	addi	s0,sp,512
  64:	1c0c                	addi	a1,sp,560
  66:	006a                	c.slli	zero,0x1a
  68:	0000                	unimp
  6a:	0802                	c.slli64	a6
  6c:	00000007          	0x7
  70:	0500                	addi	s0,sp,640
  72:	0000                	unimp
  74:	0000                	unimp
  76:	0270                	addi	a2,sp,268
  78:	0808                	addi	a0,sp,16
  7a:	0129                	addi	sp,sp,10
  7c:	0000                	unimp
  7e:	7206                	ld	tp,96(sp)
  80:	0061                	c.nop	24
  82:	0902                	c.slli64	s2
  84:	5e0c                	lw	a1,56(a2)
  86:	0000                	unimp
  88:	0000                	unimp
  8a:	7306                	ld	t1,96(sp)
  8c:	0070                	addi	a2,sp,12
  8e:	0a02                	c.slli64	s4
  90:	5e0c                	lw	a1,56(a2)
  92:	0000                	unimp
  94:	0800                	addi	s0,sp,16
  96:	7306                	ld	t1,96(sp)
  98:	0030                	addi	a2,sp,8
  9a:	0d02                	c.slli64	s10
  9c:	5e0c                	lw	a1,56(a2)
  9e:	0000                	unimp
  a0:	1000                	addi	s0,sp,32
  a2:	7306                	ld	t1,96(sp)
  a4:	0031                	c.nop	12
  a6:	0e02                	c.slli64	t3
  a8:	5e0c                	lw	a1,56(a2)
  aa:	0000                	unimp
  ac:	1800                	addi	s0,sp,48
  ae:	7306                	ld	t1,96(sp)
  b0:	0032                	c.slli	zero,0xc
  b2:	0f02                	c.slli64	t5
  b4:	5e0c                	lw	a1,56(a2)
  b6:	0000                	unimp
  b8:	2000                	fld	fs0,0(s0)
  ba:	7306                	ld	t1,96(sp)
  bc:	10020033          	0x10020033
  c0:	5e0c                	lw	a1,56(a2)
  c2:	0000                	unimp
  c4:	2800                	fld	fs0,16(s0)
  c6:	7306                	ld	t1,96(sp)
  c8:	0034                	addi	a3,sp,8
  ca:	1102                	slli	sp,sp,0x20
  cc:	5e0c                	lw	a1,56(a2)
  ce:	0000                	unimp
  d0:	3000                	fld	fs0,32(s0)
  d2:	7306                	ld	t1,96(sp)
  d4:	0035                	c.nop	13
  d6:	1202                	slli	tp,tp,0x20
  d8:	5e0c                	lw	a1,56(a2)
  da:	0000                	unimp
  dc:	3800                	fld	fs0,48(s0)
  de:	7306                	ld	t1,96(sp)
  e0:	0036                	c.slli	zero,0xd
  e2:	1302                	slli	t1,t1,0x20
  e4:	5e0c                	lw	a1,56(a2)
  e6:	0000                	unimp
  e8:	4000                	lw	s0,0(s0)
  ea:	7306                	ld	t1,96(sp)
  ec:	14020037          	lui	zero,0x14020
  f0:	5e0c                	lw	a1,56(a2)
  f2:	0000                	unimp
  f4:	4800                	lw	s0,16(s0)
  f6:	7306                	ld	t1,96(sp)
  f8:	0038                	addi	a4,sp,8
  fa:	1502                	slli	a0,a0,0x20
  fc:	5e0c                	lw	a1,56(a2)
  fe:	0000                	unimp
 100:	5000                	lw	s0,32(s0)
 102:	7306                	ld	t1,96(sp)
 104:	0039                	c.nop	14
 106:	1602                	slli	a2,a2,0x20
 108:	5e0c                	lw	a1,56(a2)
 10a:	0000                	unimp
 10c:	5800                	lw	s0,48(s0)
 10e:	7306                	ld	t1,96(sp)
 110:	3031                	0x3031
 112:	0200                	addi	s0,sp,256
 114:	005e0c17          	auipc	s8,0x5e0
 118:	0000                	unimp
 11a:	0660                	addi	s0,sp,780
 11c:	00313173          	csrrc	sp,fcsr,sp
 120:	1802                	slli	a6,a6,0x20
 122:	5e0c                	lw	a1,56(a2)
 124:	0000                	unimp
 126:	6800                	ld	s0,16(s0)
 128:	0700                	addi	s0,sp,896
 12a:	00757063          	bgeu	a0,t2,12a <.Ldebug_info0+0x12a>
 12e:	0278                	addi	a4,sp,268
 130:	015e081b          	addiw	a6,t3,21
 134:	0000                	unimp
 136:	0008                	0x8
 138:	0000                	unimp
 13a:	0200                	addi	s0,sp,256
 13c:	121d                	addi	tp,tp,-25
 13e:	0071                	c.nop	28
 140:	0000                	unimp
 142:	0800                	addi	s0,sp,16
 144:	0000                	unimp
 146:	0000                	unimp
 148:	1e02                	slli	t3,t3,0x20
 14a:	00003b07          	fld	fs6,0(zero) # 0 <.Ldebug_info0>
 14e:	7000                	ld	s0,32(s0)
 150:	0008                	0x8
 152:	0000                	unimp
 154:	0200                	addi	s0,sp,256
 156:	071f 003b 0000      	0x3b071f
 15c:	0074                	addi	a3,sp,12
 15e:	2909                	addiw	s2,s2,2
 160:	0001                	nop
 162:	6e00                	ld	s0,24(a2)
 164:	0001                	nop
 166:	0a00                	addi	s0,sp,272
 168:	016e                	slli	sp,sp,0x1b
 16a:	0000                	unimp
 16c:	08020007          	0x8020007
 170:	00000007          	0x7
 174:	0b00                	addi	s0,sp,400
 176:	0000                	unimp
 178:	0000                	unimp
 17a:	2202                	fld	ft4,0(sp)
 17c:	00015e13          	srli	t3,sp,0x0
 180:	0900                	addi	s0,sp,144
 182:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 186:	0000                	unimp
 188:	0000                	unimp
 18a:	0c00                	addi	s0,sp,528
 18c:	2908                	fld	fa0,16(a0)
 18e:	0001                	nop
 190:	0900                	addi	s0,sp,144
 192:	002d                	c.nop	11
 194:	0000                	unimp
 196:	01a2                	slli	gp,gp,0x8
 198:	0000                	unimp
 19a:	6e0d                	lui	t3,0x3
 19c:	0001                	nop
 19e:	ff00                	sd	s0,56(a4)
 1a0:	000e000f          	0xe000f
 1a4:	0000                	unimp
 1a6:	0300                	addi	s0,sp,384
 1a8:	2605                	addiw	a2,a2,1
 1aa:	0191                	addi	gp,gp,4
 1ac:	0000                	unimp
 1ae:	0910                	addi	a2,sp,144
 1b0:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 1b4:	0000                	unimp
 1b6:	0000                	unimp
 1b8:	0f00                	addi	s0,sp,912
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	00060703          	lb	a4,0(a2)
	...
 1ce:	0000                	unimp
 1d0:	0100                	addi	s0,sp,128
 1d2:	109c                	addi	a5,sp,96
 1d4:	0000                	unimp
 1d6:	0000                	unimp
 1d8:	2b02                	fld	fs6,0(sp)
 1da:	8b0d                	andi	a4,a4,3
 1dc:	0001                	nop
	...
 1ee:	0100                	addi	s0,sp,128
 1f0:	119c                	addi	a5,sp,224
 1f2:	0002                	c.slli64	zero
 1f4:	1100                	addi	s0,sp,160
 1f6:	6469                	lui	s0,0x1a
 1f8:	0200                	addi	s0,sp,256
 1fa:	072d                	addi	a4,a4,11
 1fc:	0000003b          	addw	zero,zero,zero
 200:	9102                	jalr	sp
 202:	116c                	addi	a1,sp,172
 204:	2e020063          	beqz	tp,4e4 <.LASF11+0x395>
 208:	00018b0f          	0x18b0f
 20c:	0200                	addi	s0,sp,256
 20e:	6091                	lui	ra,0x4
 210:	1200                	addi	s0,sp,288
 212:	0000                	unimp
 214:	0000                	unimp
 216:	2502                	fld	fa0,0(sp)
 218:	3b05                	addiw	s6,s6,-31
	...
 22a:	0000                	unimp
 22c:	0100                	addi	s0,sp,128
 22e:	429c                	lw	a5,0(a3)
 230:	0002                	c.slli64	zero
 232:	1100                	addi	s0,sp,160
 234:	6469                	lui	s0,0x1a
 236:	0200                	addi	s0,sp,256
 238:	003b0727          	0x3b0727
 23c:	0000                	unimp
 23e:	9102                	jalr	sp
 240:	006c                	addi	a1,sp,12
 242:	00000013          	nop
 246:	0100                	addi	s0,sp,128
 248:	0109                	addi	sp,sp,2
 24a:	005e                	c.slli	zero,0x17
	...
 25c:	0000                	unimp
 25e:	9c01                	subw	s0,s0,s0
 260:	7811                	lui	a6,0xfffe4
 262:	0100                	addi	s0,sp,128
 264:	005e0c0b          	0x5e0c0b
 268:	0000                	unimp
 26a:	9102                	jalr	sp
 26c:	0068                	addi	a0,sp,12
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.Ldebug_abbrev0>:
   0:	1101                	addi	sp,sp,-32
   2:	2501                	sext.w	a0,a0
   4:	130e                	slli	t1,t1,0x23
   6:	1b0e030b          	0x1b0e030b
   a:	110e                	slli	sp,sp,0x23
   c:	1201                	addi	tp,tp,-32
   e:	00171007          	0x171007
  12:	0200                	addi	s0,sp,256
  14:	0024                	addi	s1,sp,8
  16:	0b3e0b0b          	0xb3e0b0b
  1a:	00000e03          	lb	t3,0(zero) # 0 <.Ldebug_abbrev0>
  1e:	0b002403          	lw	s0,176(zero) # b0 <.Ldebug_abbrev0+0xb0>
  22:	030b3e0b          	0x30b3e0b
  26:	0008                	0x8
  28:	0400                	addi	s0,sp,512
  2a:	0016                	c.slli	zero,0x5
  2c:	0b3a0e03          	lb	t3,179(s4)
  30:	0b390b3b          	0xb390b3b
  34:	1349                	addi	t1,t1,-14
  36:	0000                	unimp
  38:	1305                	addi	t1,t1,-31
  3a:	0301                	addi	t1,t1,0
  3c:	0b0e                	slli	s6,s6,0x3
  3e:	3b0b3a0b          	0x3b0b3a0b
  42:	010b390b          	0x10b390b
  46:	06000013          	li	zero,96
  4a:	000d                	c.nop	3
  4c:	0b3a0803          	lb	a6,179(s4)
  50:	0b390b3b          	0xb390b3b
  54:	1349                	addi	t1,t1,-14
  56:	0b38                	addi	a4,sp,408
  58:	0000                	unimp
  5a:	03011307          	0x3011307
  5e:	0b08                	addi	a0,sp,400
  60:	3b0b3a0b          	0x3b0b3a0b
  64:	010b390b          	0x10b390b
  68:	08000013          	li	zero,128
  6c:	000d                	c.nop	3
  6e:	0b3a0e03          	lb	t3,179(s4)
  72:	0b390b3b          	0xb390b3b
  76:	1349                	addi	t1,t1,-14
  78:	0b38                	addi	a4,sp,408
  7a:	0000                	unimp
  7c:	0109                	addi	sp,sp,2
  7e:	4901                	li	s2,0
  80:	00130113          	addi	sp,t1,1
  84:	0a00                	addi	s0,sp,272
  86:	0021                	c.nop	8
  88:	1349                	addi	t1,t1,-14
  8a:	00000b2f          	0xb2f
  8e:	0300340b          	0x300340b
  92:	3a0e                	fld	fs4,224(sp)
  94:	390b3b0b          	0x390b3b0b
  98:	0213490b          	0x213490b
  9c:	0018                	0x18
  9e:	0c00                	addi	s0,sp,528
  a0:	0b0b000f          	0xb0b000f
  a4:	1349                	addi	t1,t1,-14
  a6:	0000                	unimp
  a8:	210d                	addiw	sp,sp,3
  aa:	4900                	lw	s0,16(a0)
  ac:	00052f13          	slti	t5,a0,0
  b0:	0e00                	addi	s0,sp,784
  b2:	0034                	addi	a3,sp,8
  b4:	0b3a0e03          	lb	t3,179(s4)
  b8:	0b390b3b          	0xb390b3b
  bc:	1349                	addi	t1,t1,-14
  be:	0188193f 0018020b 	0x18020b0188193f
  c6:	0f00                	addi	s0,sp,912
  c8:	002e                	c.slli	zero,0xb
  ca:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  d2:	0b39                	addi	s6,s6,14
  d4:	0111                	addi	sp,sp,4
  d6:	0712                	slli	a4,a4,0x4
  d8:	1840                	addi	s0,sp,52
  da:	00194297          	auipc	t0,0x194
  de:	1000                	addi	s0,sp,32
  e0:	012e                	slli	sp,sp,0xb
  e2:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  ea:	0b39                	addi	s6,s6,14
  ec:	13491927          	0x13491927
  f0:	0111                	addi	sp,sp,4
  f2:	0712                	slli	a4,a4,0x4
  f4:	1840                	addi	s0,sp,52
  f6:	4296                	lw	t0,68(sp)
  f8:	0119                	addi	sp,sp,6
  fa:	11000013          	li	zero,272
  fe:	0034                	addi	a3,sp,8
 100:	0b3a0803          	lb	a6,179(s4)
 104:	0b390b3b          	0xb390b3b
 108:	1349                	addi	t1,t1,-14
 10a:	1802                	slli	a6,a6,0x20
 10c:	0000                	unimp
 10e:	2e12                	fld	ft8,256(sp)
 110:	3f01                	addiw	t5,t5,-32
 112:	0319                	addi	t1,t1,6
 114:	3a0e                	fld	fs4,224(sp)
 116:	390b3b0b          	0x390b3b0b
 11a:	1113490b          	0x1113490b
 11e:	1201                	addi	tp,tp,-32
 120:	96184007          	flq	ft0,-1695(a6) # fffffffffffe3961 <cpus+0xfffffffffffe2961>
 124:	1942                	slli	s2,s2,0x30
 126:	1301                	addi	t1,t1,-32
 128:	0000                	unimp
 12a:	03012e13          	slti	t3,sp,48
 12e:	3a0e                	fld	fs4,224(sp)
 130:	390b3b0b          	0x390b3b0b
 134:	1113490b          	0x1113490b
 138:	1201                	addi	tp,tp,-32
 13a:	97184007          	flq	ft0,-1679(a6)
 13e:	1942                	slli	s2,s2,0x30
 140:	0000                	unimp
	...

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	002c                	addi	a1,sp,8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0008                	0x8
	...

Disassembly of section .debug_line:

0000000000000000 <.Ldebug_line0>:
   0:	0140                	addi	s0,sp,132
   2:	0000                	unimp
   4:	00ac0003          	lb	zero,10(s8) # 5e011e <cpus+0x5df11e>
   8:	0000                	unimp
   a:	0101                	addi	sp,sp,0
   c:	000d0efb          	0xd0efb
  10:	0101                	addi	sp,sp,0
  12:	0101                	addi	sp,sp,0
  14:	0000                	unimp
  16:	0100                	addi	s0,sp,128
  18:	0000                	unimp
  1a:	2f01                	sext.w	t5,t5
  1c:	6f68                	ld	a0,216(a4)
  1e:	656d                	lui	a0,0x1b
  20:	71696c2f          	0x71696c2f
  24:	6975                	lui	s2,0x1d
  26:	2f64                	fld	fs1,216(a4)
  28:	6d696c67          	0x6d696c67
  2c:	656d                	lui	a0,0x1b
  2e:	6f72                	ld	t5,280(sp)
  30:	534f2f73          	csrrs	t5,0x534,t5
  34:	636e692f          	0x636e692f
  38:	756c                	ld	a1,232(a0)
  3a:	6564                	ld	s1,200(a0)
  3c:	2f00                	fld	fs0,24(a4)
  3e:	6f68                	ld	a0,216(a4)
  40:	656d                	lui	a0,0x1b
  42:	71696c2f          	0x71696c2f
  46:	6975                	lui	s2,0x1d
  48:	2f64                	fld	fs1,216(a4)
  4a:	6d696c67          	0x6d696c67
  4e:	656d                	lui	a0,0x1b
  50:	6f72                	ld	t5,280(sp)
  52:	534f2f73          	csrrs	t5,0x534,t5
  56:	636e692f          	0x636e692f
  5a:	756c                	ld	a1,232(a0)
  5c:	6564                	ld	s1,200(a0)
  5e:	6f72702f          	0x6f72702f
  62:	73736563          	bltu	t1,s7,78c <.LASF11+0x63d>
  66:	2f00                	fld	fs0,24(a4)
  68:	6f68                	ld	a0,216(a4)
  6a:	656d                	lui	a0,0x1b
  6c:	71696c2f          	0x71696c2f
  70:	6975                	lui	s2,0x1d
  72:	2f64                	fld	fs1,216(a4)
  74:	6d696c67          	0x6d696c67
  78:	656d                	lui	a0,0x1b
  7a:	6f72                	ld	t5,280(sp)
  7c:	534f2f73          	csrrs	t5,0x534,t5
  80:	72656b2f          	0x72656b2f
  84:	656e                	ld	a0,216(sp)
  86:	006c                	addi	a1,sp,12
  88:	7200                	ld	s0,32(a2)
  8a:	7369                	lui	t1,0xffffa
  8c:	34367663          	bgeu	a2,gp,3d8 <.LASF11+0x289>
  90:	682e                	ld	a6,200(sp)
  92:	0100                	addi	s0,sp,128
  94:	0000                	unimp
  96:	2e757063          	bgeu	a0,t2,376 <.LASF11+0x227>
  9a:	0068                	addi	a0,sp,12
  9c:	0002                	c.slli64	zero
  9e:	6d00                	ld	s0,24(a0)
  a0:	6961                	lui	s2,0x18
  a2:	2e6e                	fld	ft8,216(sp)
  a4:	00030063          	beqz	t1,a4 <.Ldebug_line0+0xa4>
  a8:	7300                	ld	s0,32(a4)
  aa:	6474                	ld	a3,200(s0)
  ac:	6e69                	lui	t3,0x1a
  ae:	2e74                	fld	fa3,216(a2)
  b0:	0068                	addi	a0,sp,12
  b2:	0001                	nop
  b4:	0000                	unimp
  b6:	0105                	addi	sp,sp,1
  b8:	0900                	addi	s0,sp,144
  ba:	0002                	c.slli64	zero
  bc:	0000                	unimp
  be:	0000                	unimp
  c0:	0000                	unimp
  c2:	0300                	addi	s0,sp,384
  c4:	0109                	addi	sp,sp,2
  c6:	0305                	addi	t1,t1,1
  c8:	00090203          	lb	tp,0(s2) # 18000 <cpus+0x17000>
  cc:	0100                	addi	s0,sp,128
  ce:	0a05                	addi	s4,s4,1
  d0:	00090103          	lb	sp,0(s2)
  d4:	0100                	addi	s0,sp,128
  d6:	0105                	addi	sp,sp,1
  d8:	00090103          	lb	sp,0(s2)
  dc:	0100                	addi	s0,sp,128
  de:	0204                	addi	s1,sp,256
  e0:	00091803          	lh	a6,0(s2)
  e4:	0100                	addi	s0,sp,128
  e6:	0c05                	addi	s8,s8,1
  e8:	00090103          	lb	sp,0(s2)
  ec:	0100                	addi	s0,sp,128
  ee:	0705                	addi	a4,a4,1
  f0:	00090003          	lb	zero,0(s2)
  f4:	0100                	addi	s0,sp,128
  f6:	0a05                	addi	s4,s4,1
  f8:	00090103          	lb	sp,0(s2)
  fc:	0100                	addi	s0,sp,128
  fe:	0105                	addi	sp,sp,1
 100:	00090103          	lb	sp,0(s2)
 104:	0100                	addi	s0,sp,128
 106:	00090303          	lb	t1,0(s2)
 10a:	0100                	addi	s0,sp,128
 10c:	0c05                	addi	s8,s8,1
 10e:	00090103          	lb	sp,0(s2)
 112:	0100                	addi	s0,sp,128
 114:	0f05                	addi	t5,t5,1
 116:	00090103          	lb	sp,0(s2)
 11a:	0100                	addi	s0,sp,128
 11c:	0a05                	addi	s4,s4,1
 11e:	00090103          	lb	sp,0(s2)
 122:	0100                	addi	s0,sp,128
 124:	0105                	addi	sp,sp,1
 126:	00090103          	lb	sp,0(s2)
 12a:	0100                	addi	s0,sp,128
 12c:	0304                	addi	s1,sp,384
 12e:	0d05                	addi	s10,s10,1
 130:	00095703          	lhu	a4,0(s2)
 134:	0100                	addi	s0,sp,128
 136:	0105                	addi	sp,sp,1
 138:	00090203          	lb	tp,0(s2)
 13c:	0100                	addi	s0,sp,128
 13e:	0009                	c.nop	2
 140:	0000                	unimp
 142:	0101                	addi	sp,sp,0

Disassembly of section .debug_str:

0000000000000000 <.LASF20>:
   0:	6572                	ld	a0,280(sp)
   2:	6461                	lui	s0,0x18
   4:	6d5f 6168 7472      	0x747261686d5f
   a:	6469                	lui	s0,0x1a
	...

000000000000000d <.LASF14>:
   d:	6d6f682f          	0x6d6f682f
  11:	2f65                	addiw	t5,t5,25
  13:	696c                	ld	a1,208(a0)
  15:	7571                	lui	a0,0xffffc
  17:	6469                	lui	s0,0x1a
  19:	696c672f          	0x696c672f
  1d:	6d6d                	lui	s10,0x1b
  1f:	7265                	lui	tp,0xffff9
  21:	4f2f736f          	jal	t1,f7513 <cpus+0xf6513>
  25:	          	0x69750053

0000000000000027 <.LASF15>:
  27:	6975                	lui	s2,0x1d
  29:	746e                	ld	s0,248(sp)
  2b:	3436                	fld	fs0,360(sp)
  2d:	745f        	0x6e6f6c00745f

0000000000000030 <.LASF6>:
  30:	6f6c                	ld	a1,216(a4)
  32:	676e                	ld	a4,216(sp)
  34:	6c20                	ld	s0,88(s0)
  36:	20676e6f          	jal	t3,7623c <cpus+0x7523c>
  3a:	6e75                	lui	t3,0x1d
  3c:	6e676973          	csrrsi	s2,0x6e6,14
  40:	6465                	lui	s0,0x19
  42:	6920                	ld	s0,80(a0)
  44:	746e                	ld	s0,248(sp)
	...

0000000000000047 <.LASF3>:
  47:	6e75                	lui	t3,0x1d
  49:	6e676973          	csrrsi	s2,0x6e6,14
  4d:	6465                	lui	s0,0x19
  4f:	6320                	ld	s0,64(a4)
  51:	6168                	ld	a0,192(a0)
  53:	0072                	c.slli	zero,0x1c

0000000000000055 <.LASF10>:
  55:	6f6c                	ld	a1,216(a4)
  57:	676e                	ld	a4,216(sp)
  59:	7520                	ld	s0,104(a0)
  5b:	736e                	ld	t1,248(sp)
  5d:	6769                	lui	a4,0x1a
  5f:	656e                	ld	a0,216(sp)
  61:	2064                	fld	fs1,192(s0)
  63:	6e69                	lui	t3,0x1a
  65:	0074                	addi	a3,sp,12

0000000000000067 <.LASF4>:
  67:	726f6873          	csrrsi	a6,0x726,30
  6b:	2074                	fld	fa3,192(s0)
  6d:	6e75                	lui	t3,0x1d
  6f:	6e676973          	csrrsi	s2,0x6e6,14
  73:	6465                	lui	s0,0x19
  75:	6920                	ld	s0,80(a0)
  77:	746e                	ld	s0,248(sp)
	...

000000000000007a <.LASF17>:
  7a:	616d                	addi	sp,sp,240
  7c:	6e69                	lui	t3,0x1a
	...

000000000000007f <.LASF16>:
  7f:	6f62                	ld	t5,24(sp)
  81:	735f746f          	jal	s0,f7fb5 <cpus+0xf6fb5>
  85:	6174                	ld	a3,192(a0)
  87:	          	bltu	zero,a6,6bd <.LASF11+0x56e>

000000000000008a <.LASF19>:
  8a:	69757063          	bgeu	a0,s7,70a <.LASF11+0x5bb>
  8e:	0064                	addi	s1,sp,12

0000000000000090 <.LASF9>:
  90:	6e69                	lui	t3,0x1a
  92:	6574                	ld	a3,200(a0)
  94:	616e                	ld	sp,216(sp)
	...

0000000000000097 <.LASF5>:
  97:	6e75                	lui	t3,0x1d
  99:	6e676973          	csrrsi	s2,0x6e6,14
  9d:	6465                	lui	s0,0x19
  9f:	6920                	ld	s0,80(a0)
  a1:	746e                	ld	s0,248(sp)
	...

00000000000000a4 <.LASF0>:
  a4:	72616863          	bltu	sp,t1,7d4 <.LASF11+0x685>
	...

00000000000000a9 <.LASF13>:
  a9:	6d6f682f          	0x6d6f682f
  ad:	2f65                	addiw	t5,t5,25
  af:	696c                	ld	a1,208(a0)
  b1:	7571                	lui	a0,0xffffc
  b3:	6469                	lui	s0,0x1a
  b5:	696c672f          	0x696c672f
  b9:	6d6d                	lui	s10,0x1b
  bb:	7265                	lui	tp,0xffff9
  bd:	4f2f736f          	jal	t1,f75af <cpus+0xf65af>
  c1:	656b2f53          	0x656b2f53
  c5:	6e72                	ld	t3,280(sp)
  c7:	6c65                	lui	s8,0x19
  c9:	69616d2f          	0x69616d2f
  cd:	2e6e                	fld	ft8,216(sp)
  cf:	          	beq	s10,s6,84f <.LASF11+0x700>

00000000000000d1 <.LASF18>:
  d1:	796d                	lui	s2,0xffffb
  d3:	00757063          	bgeu	a0,t2,d3 <.LASF18+0x2>

00000000000000d7 <.LASF7>:
  d7:	746e6f63          	bltu	t3,t1,835 <.LASF11+0x6e6>
  db:	7865                	lui	a6,0xffff9
  dd:	0074                	addi	a3,sp,12

00000000000000df <.LASF1>:
  df:	726f6873          	csrrsi	a6,0x726,30
  e3:	2074                	fld	fa3,192(s0)
  e5:	6e69                	lui	t3,0x1a
  e7:	0074                	addi	a3,sp,12

00000000000000e9 <.LASF2>:
  e9:	6f6c                	ld	a1,216(a4)
  eb:	676e                	ld	a4,216(sp)
  ed:	6920                	ld	s0,80(a0)
  ef:	746e                	ld	s0,248(sp)
	...

00000000000000f2 <.LASF12>:
  f2:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
  f6:	20373143          	fmadd.s	ft2,fa4,ft3,ft4,rup
  fa:	2e38                	fld	fa4,88(a2)
  fc:	20302e33          	0x20302e33
 100:	6d2d                	lui	s10,0xb
 102:	6f6e                	ld	t5,216(sp)
 104:	722d                	lui	tp,0xfffeb
 106:	6c65                	lui	s8,0x19
 108:	7861                	lui	a6,0xffff8
 10a:	2d20                	fld	fs0,88(a0)
 10c:	616d                	addi	sp,sp,240
 10e:	6372                	ld	t1,280(sp)
 110:	3d68                	fld	fa0,248(a0)
 112:	7672                	ld	a2,312(sp)
 114:	3436                	fld	fs0,360(sp)
 116:	6d69                	lui	s10,0x1a
 118:	6661                	lui	a2,0x18
 11a:	6364                	ld	s1,192(a4)
 11c:	2d20                	fld	fs0,88(a0)
 11e:	616d                	addi	sp,sp,240
 120:	6962                	ld	s2,24(sp)
 122:	6c3d                	lui	s8,0xf
 124:	3670                	fld	fa2,232(a2)
 126:	6434                	ld	a3,72(s0)
 128:	2d20                	fld	fs0,88(a0)
 12a:	62646767          	0x62646767
 12e:	2d20                	fld	fs0,88(a0)
 130:	6666                	ld	a2,88(sp)
 132:	6572                	ld	a0,280(sp)
 134:	7365                	lui	t1,0xffff9
 136:	6174                	ld	a3,192(a0)
 138:	646e                	ld	s0,216(sp)
 13a:	6e69                	lui	t3,0x1a
 13c:	662d2067          	0x662d2067
 140:	6f6e                	ld	t5,216(sp)
 142:	632d                	lui	t1,0xb
 144:	6f6d6d6f          	jal	s10,d683a <cpus+0xd583a>
 148:	006e                	c.slli	zero,0x1b

000000000000014a <.LASF8>:
 14a:	6f6e                	ld	t5,216(sp)
 14c:	6666                	ld	a2,88(sp)
	...

000000000000014f <.LASF11>:
 14f:	73757063          	bgeu	a0,s7,86f <.LASF11+0x720>
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	4700                	lw	s0,8(a4)
   2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
   6:	5328                	lw	a0,96(a4)
   8:	4669                	li	a2,26
   a:	7669                	lui	a2,0xffffa
   c:	2065                	0x2065
   e:	20434347          	fmsub.s	ft6,ft6,ft4,ft4,rmm
  12:	2e38                	fld	fa4,88(a2)
  14:	2d302e33          	0x2d302e33
  18:	3032                	fld	ft0,296(sp)
  1a:	3032                	fld	ft0,296(sp)
  1c:	302e                	fld	ft0,232(sp)
  1e:	2e34                	fld	fa3,88(a2)
  20:	2931                	addiw	s2,s2,12
  22:	3820                	fld	fs0,112(s0)
  24:	332e                	fld	ft6,232(sp)
  26:	302e                	fld	ft0,232(sp)
	...

Disassembly of section .debug_frame:

0000000000000000 <.debug_frame>:
   0:	000c                	0xc
   2:	0000                	unimp
   4:	ffff                	0xffff
   6:	ffff                	0xffff
   8:	0001                	nop
   a:	7c01                	lui	s8,0xfffe0
   c:	0d01                	addi	s10,s10,0
   e:	0002                	c.slli64	zero
  10:	002c                	addi	a1,sp,8
	...
  26:	0000                	unimp
  28:	0e42                	slli	t3,t3,0x10
  2a:	4220                	lw	s0,64(a2)
  2c:	0288                	addi	a0,sp,320
  2e:	0c42                	slli	s8,s8,0x10
  30:	0008                	0x8
  32:	c850                	sw	a2,20(s0)
  34:	020c                	addi	a1,sp,256
  36:	4220                	lw	s0,64(a2)
  38:	000e                	c.slli	zero,0x3
  3a:	0000                	unimp
  3c:	0000                	unimp
  3e:	0000                	unimp
  40:	002c                	addi	a1,sp,8
	...
  56:	0000                	unimp
  58:	0e42                	slli	t3,t3,0x10
  5a:	4420                	lw	s0,72(s0)
  5c:	0281                	addi	t0,t0,0
  5e:	0488                	addi	a0,sp,576
  60:	0c42                	slli	s8,s8,0x10
  62:	0008                	0x8
  64:	c156                	sw	s5,128(sp)
  66:	c842                	sw	a6,16(sp)
  68:	020c                	addi	a1,sp,256
  6a:	4220                	lw	s0,64(a2)
  6c:	000e                	c.slli	zero,0x3
  6e:	0000                	unimp
  70:	002c                	addi	a1,sp,8
	...
  86:	0000                	unimp
  88:	0e42                	slli	t3,t3,0x10
  8a:	4420                	lw	s0,72(s0)
  8c:	0281                	addi	t0,t0,0
  8e:	0488                	addi	a0,sp,576
  90:	0c42                	slli	s8,s8,0x10
  92:	0008                	0x8
  94:	c170                	sw	a2,68(a0)
  96:	c842                	sw	a6,16(sp)
  98:	020c                	addi	a1,sp,256
  9a:	4220                	lw	s0,64(a2)
  9c:	000e                	c.slli	zero,0x3
  9e:	0000                	unimp
  a0:	002c                	addi	a1,sp,8
	...
  b6:	0000                	unimp
  b8:	0e42                	slli	t3,t3,0x10
  ba:	4210                	lw	a2,0(a2)
  bc:	0288                	addi	a0,sp,320
  be:	0c42                	slli	s8,s8,0x10
  c0:	0008                	0x8
  c2:	c844                	sw	s1,20(s0)
  c4:	020c                	addi	a1,sp,256
  c6:	4210                	lw	a2,0(a2)
  c8:	000e                	c.slli	zero,0x3
  ca:	0000                	unimp
  cc:	0000                	unimp
	...

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3441                	addiw	s0,s0,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <.riscv.attributes+0x14>
   c:	002a                	c.slli	zero,0xa
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3676                	fld	fa2,376(sp)
  16:	6934                	ld	a3,80(a0)
  18:	7032                	0x7032
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	addiw	tp,tp,-5
  1e:	3070                	fld	fa2,224(s0)
  20:	615f 7032 5f30      	0x5f307032615f
  26:	3266                	fld	ft4,120(sp)
  28:	3070                	fld	fa2,224(s0)
  2a:	645f 7032 5f30      	0x5f307032645f
  30:	30703263          	0x30703263
	...
