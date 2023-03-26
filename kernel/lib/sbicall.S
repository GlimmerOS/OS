
sbicall.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <sbi_call>:
   0:	7139                	addi	sp,sp,-64
   2:	fc22                	sd	s0,56(sp)
   4:	0080                	addi	s0,sp,64
   6:	fca43c23          	sd	a0,-40(s0)
   a:	fcb43823          	sd	a1,-48(s0)
   e:	fcc43423          	sd	a2,-56(s0)
  12:	fcd43023          	sd	a3,-64(s0)
  16:	fd843783          	ld	a5,-40(s0)
  1a:	fd043703          	ld	a4,-48(s0)
  1e:	fc843683          	ld	a3,-56(s0)
  22:	fc043603          	ld	a2,-64(s0)
  26:	88be                	mv	a7,a5
  28:	853a                	mv	a0,a4
  2a:	85b6                	mv	a1,a3
  2c:	8632                	mv	a2,a2
  2e:	00000073          	ecall
  32:	87aa                	mv	a5,a0
  34:	fef43423          	sd	a5,-24(s0)
  38:	fe843783          	ld	a5,-24(s0)
  3c:	853e                	mv	a0,a5
  3e:	7462                	ld	s0,56(sp)
  40:	6121                	addi	sp,sp,64
  42:	8082                	ret

0000000000000044 <sbi_console_putchar>:
  44:	1101                	addi	sp,sp,-32
  46:	ec06                	sd	ra,24(sp)
  48:	e822                	sd	s0,16(sp)
  4a:	1000                	addi	s0,sp,32
  4c:	fea43423          	sd	a0,-24(s0)
  50:	000007b7          	lui	a5,0x0
  54:	0007b783          	ld	a5,0(a5) # 0 <sbi_call>
  58:	4681                	li	a3,0
  5a:	4601                	li	a2,0
  5c:	fe843583          	ld	a1,-24(s0)
  60:	853e                	mv	a0,a5
  62:	00000097          	auipc	ra,0x0
  66:	000080e7          	jalr	ra # 62 <sbi_console_putchar+0x1e>
  6a:	0001                	nop
  6c:	60e2                	ld	ra,24(sp)
  6e:	6442                	ld	s0,16(sp)
  70:	6105                	addi	sp,sp,32
  72:	8082                	ret

0000000000000074 <sbi_set_timer>:
  74:	1101                	addi	sp,sp,-32
  76:	ec06                	sd	ra,24(sp)
  78:	e822                	sd	s0,16(sp)
  7a:	1000                	addi	s0,sp,32
  7c:	fea43423          	sd	a0,-24(s0)
  80:	000007b7          	lui	a5,0x0
  84:	0007b783          	ld	a5,0(a5) # 0 <sbi_call>
  88:	4681                	li	a3,0
  8a:	4601                	li	a2,0
  8c:	fe843583          	ld	a1,-24(s0)
  90:	853e                	mv	a0,a5
  92:	00000097          	auipc	ra,0x0
  96:	000080e7          	jalr	ra # 92 <sbi_set_timer+0x1e>
  9a:	0001                	nop
  9c:	60e2                	ld	ra,24(sp)
  9e:	6442                	ld	s0,16(sp)
  a0:	6105                	addi	sp,sp,32
  a2:	8082                	ret

Disassembly of section .bss:

0000000000000000 <SBI_SET_TIMER>:
	...

Disassembly of section .sdata:

0000000000000000 <SBI_CONSOLE_PUTCHAR>:
   0:	0001                	nop
   2:	0000                	unimp
   4:	0000                	unimp
	...

Disassembly of section .debug_info:

0000000000000000 <.Ldebug_info0>:
   0:	00000143          	fmadd.s	ft2,ft0,ft0,ft0,rne
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
  2e:	0704                	addi	s1,sp,896
  30:	0000                	unimp
  32:	0000                	unimp
  34:	0202                	c.slli64	tp
  36:	00000007          	0x7
  3a:	0200                	addi	s0,sp,256
  3c:	0801                	addi	a6,a6,0
  3e:	0000                	unimp
  40:	0000                	unimp
  42:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
  46:	0200                	addi	s0,sp,256
  48:	1708                	addi	a0,sp,928
  4a:	004e                	c.slli	zero,0x13
  4c:	0000                	unimp
  4e:	0802                	c.slli64	a6
  50:	00000007          	0x7
  54:	0400                	addi	s0,sp,512
  56:	0000                	unimp
  58:	0000                	unimp
  5a:	0401                	addi	s0,s0,0
  5c:	0000420f          	0x420f
  60:	0900                	addi	s0,sp,144
  62:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
  66:	0000                	unimp
  68:	0000                	unimp
  6a:	0400                	addi	s0,sp,512
  6c:	0000                	unimp
  6e:	0000                	unimp
  70:	0501                	addi	a0,a0,0
  72:	0000420f          	0x420f
  76:	0900                	addi	s0,sp,144
  78:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
  7c:	0000                	unimp
  7e:	0000                	unimp
  80:	0500                	addi	s0,sp,640
  82:	0000                	unimp
  84:	0000                	unimp
  86:	1c01                	addi	s8,s8,-32
  88:	0006                	c.slli	zero,0x1
	...
  96:	0000                	unimp
  98:	0100                	addi	s0,sp,128
  9a:	af9c                	fsd	fa5,24(a5)
  9c:	0000                	unimp
  9e:	0600                	addi	s0,sp,768
  a0:	0000                	unimp
  a2:	0000                	unimp
  a4:	1c01                	addi	s8,s8,-32
  a6:	0000421b          	0x421b
  aa:	0200                	addi	s0,sp,256
  ac:	6891                	lui	a7,0x4
  ae:	0500                	addi	s0,sp,640
  b0:	0000                	unimp
  b2:	0000                	unimp
  b4:	1801                	addi	a6,a6,-32
  b6:	0006                	c.slli	zero,0x1
	...
  c4:	0000                	unimp
  c6:	0100                	addi	s0,sp,128
  c8:	dc9c                	sw	a5,56(s1)
  ca:	0000                	unimp
  cc:	0700                	addi	s0,sp,896
  ce:	01006863          	bltu	zero,a6,de <.Ldebug_info0+0xde>
  d2:	2118                	fld	fa4,0(a0)
  d4:	0042                	c.slli	zero,0x10
  d6:	0000                	unimp
  d8:	9102                	jalr	sp
  da:	0068                	addi	a0,sp,12
  dc:	0008                	0x8
  de:	0000                	unimp
  e0:	0100                	addi	s0,sp,128
  e2:	0808                	addi	a0,sp,16
  e4:	0042                	c.slli	zero,0x10
	...
  f6:	0000                	unimp
  f8:	9c01                	subw	s0,s0,s0
  fa:	0006                	c.slli	zero,0x1
  fc:	0000                	unimp
  fe:	0100                	addi	s0,sp,128
 100:	1808                	addi	a0,sp,48
 102:	0042                	c.slli	zero,0x10
 104:	0000                	unimp
 106:	9102                	jalr	sp
 108:	0658                	addi	a4,sp,772
 10a:	0000                	unimp
 10c:	0000                	unimp
 10e:	0801                	addi	a6,a6,0
 110:	4226                	lw	tp,72(sp)
 112:	0000                	unimp
 114:	0200                	addi	s0,sp,256
 116:	5091                	li	ra,-28
 118:	0006                	c.slli	zero,0x1
 11a:	0000                	unimp
 11c:	0100                	addi	s0,sp,128
 11e:	3308                	fld	fa0,32(a4)
 120:	0042                	c.slli	zero,0x10
 122:	0000                	unimp
 124:	9102                	jalr	sp
 126:	0648                	addi	a0,sp,772
 128:	0000                	unimp
 12a:	0000                	unimp
 12c:	0801                	addi	a6,a6,0
 12e:	4240                	lw	s0,4(a2)
 130:	0000                	unimp
 132:	0200                	addi	s0,sp,256
 134:	4091                	li	ra,4
 136:	7209                	lui	tp,0xfffe2
 138:	7465                	lui	s0,0xffff9
 13a:	0100                	addi	s0,sp,128
 13c:	0c09                	addi	s8,s8,2
 13e:	0042                	c.slli	zero,0x10
 140:	0000                	unimp
 142:	9102                	jalr	sp
 144:	0068                	addi	a0,sp,12
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
  1e:	03001603          	lh	a2,48(zero) # 30 <.Ldebug_abbrev0+0x30>
  22:	3a0e                	fld	fs4,224(sp)
  24:	390b3b0b          	0x390b3b0b
  28:	0013490b          	0x13490b
  2c:	0400                	addi	s0,sp,512
  2e:	0034                	addi	a3,sp,8
  30:	0b3a0e03          	lb	t3,179(s4)
  34:	0b390b3b          	0xb390b3b
  38:	1349                	addi	t1,t1,-14
  3a:	1802                	slli	a6,a6,0x20
  3c:	0000                	unimp
  3e:	2e05                	addiw	t3,t3,1
  40:	3f01                	addiw	t5,t5,-32
  42:	0319                	addi	t1,t1,6
  44:	3a0e                	fld	fs4,224(sp)
  46:	390b3b0b          	0x390b3b0b
  4a:	1119270b          	0x1119270b
  4e:	1201                	addi	tp,tp,-32
  50:	96184007          	flq	ft0,-1695(a6)
  54:	1942                	slli	s2,s2,0x30
  56:	1301                	addi	t1,t1,-32
  58:	0000                	unimp
  5a:	0506                	slli	a0,a0,0x1
  5c:	0300                	addi	s0,sp,384
  5e:	3a0e                	fld	fs4,224(sp)
  60:	390b3b0b          	0x390b3b0b
  64:	0213490b          	0x213490b
  68:	0018                	0x18
  6a:	0700                	addi	s0,sp,896
  6c:	0005                	c.nop	1
  6e:	0b3a0803          	lb	a6,179(s4)
  72:	0b390b3b          	0xb390b3b
  76:	1349                	addi	t1,t1,-14
  78:	1802                	slli	a6,a6,0x20
  7a:	0000                	unimp
  7c:	2e08                	fld	fa0,24(a2)
  7e:	3f01                	addiw	t5,t5,-32
  80:	0319                	addi	t1,t1,6
  82:	3a0e                	fld	fs4,224(sp)
  84:	390b3b0b          	0x390b3b0b
  88:	4919270b          	0x4919270b
  8c:	12011113          	0x12011113
  90:	97184007          	flq	ft0,-1679(a6)
  94:	1942                	slli	s2,s2,0x30
  96:	0000                	unimp
  98:	3409                	addiw	s0,s0,-30
  9a:	0300                	addi	s0,sp,384
  9c:	3a08                	fld	fa0,48(a2)
  9e:	390b3b0b          	0x390b3b0b
  a2:	0213490b          	0x213490b
  a6:	0018                	0x18
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
   0:	00df 0000 0003      	0x3000000df
   6:	007d                	c.nop	31
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
  34:	72656b2f          	0x72656b2f
  38:	656e                	ld	a0,216(sp)
  3a:	2f6c                	fld	fa1,216(a4)
  3c:	696c                	ld	a1,208(a0)
  3e:	0062                	c.slli	zero,0x18
  40:	6d6f682f          	0x6d6f682f
  44:	2f65                	addiw	t5,t5,25
  46:	696c                	ld	a1,208(a0)
  48:	7571                	lui	a0,0xffffc
  4a:	6469                	lui	s0,0x1a
  4c:	696c672f          	0x696c672f
  50:	6d6d                	lui	s10,0x1b
  52:	7265                	lui	tp,0xffff9
  54:	4f2f736f          	jal	t1,f7546 <.LASF15+0xf741f>
  58:	656b2f53          	0x656b2f53
  5c:	6e72                	ld	t3,280(sp)
  5e:	6c65                	lui	s8,0x19
  60:	62696c2f          	0x62696c2f
  64:	2f2e2e2f          	0x2f2e2e2f
  68:	7974                	ld	a3,240(a0)
  6a:	6570                	ld	a2,200(a0)
  6c:	0000                	unimp
  6e:	63696273          	csrrsi	tp,0x636,18
  72:	6c61                	lui	s8,0x18
  74:	2e6c                	fld	fa1,216(a2)
  76:	00010063          	beqz	sp,76 <.Ldebug_line0+0x76>
  7a:	7400                	ld	s0,40(s0)
  7c:	7079                	c.lui	zero,0xffffe
  7e:	7365                	lui	t1,0xffff9
  80:	682e                	ld	a6,200(sp)
  82:	0200                	addi	s0,sp,256
  84:	0000                	unimp
  86:	0500                	addi	s0,sp,640
  88:	0045                	c.nop	17
  8a:	0209                	addi	tp,tp,2
	...
  94:	0519                	addi	a0,a0,6
  96:	0305                	addi	t1,t1,1
  98:	0902                	c.slli64	s2
  9a:	0000                	unimp
  9c:	0501                	addi	a0,a0,0
  9e:	030c                	addi	a1,sp,384
  a0:	0000090b          	0x90b
  a4:	0501                	addi	a0,a0,0
  a6:	0301                	addi	t1,t1,0
  a8:	0901                	addi	s2,s2,0
  aa:	0000                	unimp
  ac:	0501                	addi	a0,a0,0
  ae:	0325                	addi	t1,t1,9
  b0:	0902                	c.slli64	s2
  b2:	0000                	unimp
  b4:	0501                	addi	a0,a0,0
  b6:	0305                	addi	t1,t1,1
  b8:	0901                	addi	s2,s2,0
  ba:	0000                	unimp
  bc:	0501                	addi	a0,a0,0
  be:	0301                	addi	t1,t1,0
  c0:	0901                	addi	s2,s2,0
  c2:	0000                	unimp
  c4:	0501                	addi	a0,a0,0
  c6:	09020327          	0x9020327
  ca:	0000                	unimp
  cc:	0501                	addi	a0,a0,0
  ce:	0305                	addi	t1,t1,1
  d0:	0901                	addi	s2,s2,0
  d2:	0000                	unimp
  d4:	0501                	addi	a0,a0,0
  d6:	0301                	addi	t1,t1,0
  d8:	0901                	addi	s2,s2,0
  da:	0000                	unimp
  dc:	0901                	addi	s2,s2,0
  de:	0000                	unimp
  e0:	0100                	addi	s0,sp,128
  e2:	01              	Address 0x00000000000000e2 is out of bounds.


Disassembly of section .debug_str:

0000000000000000 <.LASF0>:
   0:	6e75                	lui	t3,0x1d
   2:	6e676973          	csrrsi	s2,0x6e6,14
   6:	6465                	lui	s0,0x19
   8:	6920                	ld	s0,80(a0)
   a:	746e                	ld	s0,248(sp)
	...

000000000000000d <.LASF7>:
   d:	5f696273          	csrrsi	tp,0x5f6,18
  11:	736e6f63          	bltu	t3,s6,74f <.LASF15+0x628>
  15:	5f656c6f          	jal	s8,5660b <.LASF15+0x564e4>
  19:	7570                	ld	a2,232(a0)
  1b:	6374                	ld	a3,192(a4)
  1d:	6168                	ld	a0,192(a0)
  1f:	0072                	c.slli	zero,0x1c

0000000000000021 <.LASF3>:
  21:	6f6c                	ld	a1,216(a4)
  23:	676e                	ld	a4,216(sp)
  25:	7520                	ld	s0,104(a0)
  27:	736e                	ld	t1,248(sp)
  29:	6769                	lui	a4,0x1a
  2b:	656e                	ld	a0,216(sp)
  2d:	2064                	fld	fs1,192(s0)
  2f:	6e69                	lui	t3,0x1a
  31:	0074                	addi	a3,sp,12

0000000000000033 <.LASF8>:
  33:	6d697473          	csrrci	s0,0x6d6,18
  37:	5f65                	li	t5,-7
  39:	6176                	ld	sp,344(sp)
  3b:	756c                	ld	a1,232(a0)
  3d:	0065                	c.nop	25

000000000000003f <.LASF17>:
  3f:	6975                	lui	s2,0x1d
  41:	746e                	ld	s0,248(sp)
  43:	3436                	fld	fs0,360(sp)
	...

0000000000000046 <.LASF10>:
  46:	63696877          	0x63696877
  4a:	0068                	addi	a0,sp,12

000000000000004c <.LASF16>:
  4c:	6d6f682f          	0x6d6f682f
  50:	2f65                	addiw	t5,t5,25
  52:	696c                	ld	a1,208(a0)
  54:	7571                	lui	a0,0xffffc
  56:	6469                	lui	s0,0x1a
  58:	696c672f          	0x696c672f
  5c:	6d6d                	lui	s10,0x1b
  5e:	7265                	lui	tp,0xffff9
  60:	4f2f736f          	jal	t1,f7552 <.LASF15+0xf742b>
  64:	          	0x6e750053

0000000000000066 <.LASF2>:
  66:	6e75                	lui	t3,0x1d
  68:	6e676973          	csrrsi	s2,0x6e6,14
  6c:	6465                	lui	s0,0x19
  6e:	6320                	ld	s0,64(a4)
  70:	6168                	ld	a0,192(a0)
  72:	0072                	c.slli	zero,0x1c

0000000000000074 <.LASF6>:
  74:	5f696273          	csrrsi	tp,0x5f6,18
  78:	5f746573          	csrrsi	a0,0x5f7,8
  7c:	6974                	ld	a3,208(a0)
  7e:	656d                	lui	a0,0x1b
  80:	0072                	c.slli	zero,0x1c

0000000000000082 <.LASF5>:
  82:	5f494253          	0x5f494253
  86:	534e4f43          	fmadd.d	ft10,ft8,fs4,fa0,rmm
  8a:	5f454c4f          	fnmadd.q	fs8,fa0,fs4,fa1,rmm
  8e:	5550                	lw	a2,44(a0)
  90:	4354                	lw	a3,4(a4)
  92:	4148                	lw	a0,4(a0)
  94:	0052                	c.slli	zero,0x14

0000000000000096 <.LASF14>:
  96:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
  9a:	20373143          	fmadd.s	ft2,fa4,ft3,ft4,rup
  9e:	2e38                	fld	fa4,88(a2)
  a0:	20302e33          	0x20302e33
  a4:	6d2d                	lui	s10,0xb
  a6:	6f6e                	ld	t5,216(sp)
  a8:	722d                	lui	tp,0xfffeb
  aa:	6c65                	lui	s8,0x19
  ac:	7861                	lui	a6,0xffff8
  ae:	2d20                	fld	fs0,88(a0)
  b0:	616d                	addi	sp,sp,240
  b2:	6372                	ld	t1,280(sp)
  b4:	3d68                	fld	fa0,248(a0)
  b6:	7672                	ld	a2,312(sp)
  b8:	3436                	fld	fs0,360(sp)
  ba:	6d69                	lui	s10,0x1a
  bc:	6661                	lui	a2,0x18
  be:	6364                	ld	s1,192(a4)
  c0:	2d20                	fld	fs0,88(a0)
  c2:	616d                	addi	sp,sp,240
  c4:	6962                	ld	s2,24(sp)
  c6:	6c3d                	lui	s8,0xf
  c8:	3670                	fld	fa2,232(a2)
  ca:	6434                	ld	a3,72(s0)
  cc:	2d20                	fld	fs0,88(a0)
  ce:	62646767          	0x62646767
  d2:	2d20                	fld	fs0,88(a0)
  d4:	6666                	ld	a2,88(sp)
  d6:	6572                	ld	a0,280(sp)
  d8:	7365                	lui	t1,0xffff9
  da:	6174                	ld	a3,192(a0)
  dc:	646e                	ld	s0,216(sp)
  de:	6e69                	lui	t3,0x1a
  e0:	662d2067          	0x662d2067
  e4:	6f6e                	ld	t5,216(sp)
  e6:	632d                	lui	t1,0xb
  e8:	6f6d6d6f          	jal	s10,d67de <.LASF15+0xd66b7>
  ec:	006e                	c.slli	zero,0x1b

00000000000000ee <.LASF1>:
  ee:	726f6873          	csrrsi	a6,0x726,30
  f2:	2074                	fld	fa3,192(s0)
  f4:	6e75                	lui	t3,0x1d
  f6:	6e676973          	csrrsi	s2,0x6e6,14
  fa:	6465                	lui	s0,0x19
  fc:	6920                	ld	s0,80(a0)
  fe:	746e                	ld	s0,248(sp)
	...

0000000000000101 <.LASF9>:
 101:	5f696273          	csrrsi	tp,0x5f6,18
 105:	6c6c6163          	bltu	s8,t1,7c7 <.LASF15+0x6a0>
	...

000000000000010a <.LASF11>:
 10a:	7261                	lui	tp,0xffff8
 10c:	          	0x61003067

000000000000010f <.LASF12>:
 10f:	7261                	lui	tp,0xffff8
 111:	          	0x61003167

0000000000000114 <.LASF13>:
 114:	7261                	lui	tp,0xffff8
 116:	          	0x53003267

0000000000000119 <.LASF4>:
 119:	5f494253          	0x5f494253
 11d:	5f544553          	0x5f544553
 121:	4954                	lw	a3,20(a0)
 123:	454d                	li	a0,19
 125:	0052                	c.slli	zero,0x14

0000000000000127 <.LASF15>:
 127:	6d6f682f          	0x6d6f682f
 12b:	2f65                	addiw	t5,t5,25
 12d:	696c                	ld	a1,208(a0)
 12f:	7571                	lui	a0,0xffffc
 131:	6469                	lui	s0,0x1a
 133:	696c672f          	0x696c672f
 137:	6d6d                	lui	s10,0x1b
 139:	7265                	lui	tp,0xffff9
 13b:	4f2f736f          	jal	t1,f762d <.LASF15+0xf7506>
 13f:	656b2f53          	0x656b2f53
 143:	6e72                	ld	t3,280(sp)
 145:	6c65                	lui	s8,0x19
 147:	62696c2f          	0x62696c2f
 14b:	6962732f          	0x6962732f
 14f:	6c6c6163          	bltu	s8,t1,811 <.LASF15+0x6ea>
 153:	632e                	ld	t1,200(sp)
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
  2a:	4240                	lw	s0,4(a2)
  2c:	0288                	addi	a0,sp,320
  2e:	0c42                	slli	s8,s8,0x10
  30:	0008                	0x8
  32:	c87a                	sw	t5,16(sp)
  34:	020c                	addi	a1,sp,256
  36:	4240                	lw	s0,4(a2)
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
  64:	c162                	sw	s8,128(sp)
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
  94:	c162                	sw	s8,128(sp)
  96:	c842                	sw	a6,16(sp)
  98:	020c                	addi	a1,sp,256
  9a:	4220                	lw	s0,64(a2)
  9c:	000e                	c.slli	zero,0x3
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
