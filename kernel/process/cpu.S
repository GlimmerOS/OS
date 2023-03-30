
cpu.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <read_mhartid>:
   0:	1101                	add	sp,sp,-32
   2:	ec22                	sd	s0,24(sp)
   4:	1000                	add	s0,sp,32
   6:	f14027f3          	csrr	a5,mhartid
   a:	fef43423          	sd	a5,-24(s0)
   e:	fe843783          	ld	a5,-24(s0)
  12:	853e                	mv	a0,a5
  14:	6462                	ld	s0,24(sp)
  16:	6105                	add	sp,sp,32
  18:	8082                	ret

000000000000001a <cpuid>:
  1a:	1141                	add	sp,sp,-16
  1c:	e406                	sd	ra,8(sp)
  1e:	e022                	sd	s0,0(sp)
  20:	0800                	add	s0,sp,16
  22:	00000097          	auipc	ra,0x0
  26:	000080e7          	jalr	ra # 22 <cpuid+0x8>
  2a:	87aa                	mv	a5,a0
  2c:	2781                	sext.w	a5,a5
  2e:	853e                	mv	a0,a5
  30:	60a2                	ld	ra,8(sp)
  32:	6402                	ld	s0,0(sp)
  34:	0141                	add	sp,sp,16
  36:	8082                	ret

0000000000000038 <mycpu>:
  38:	1141                	add	sp,sp,-16
  3a:	e406                	sd	ra,8(sp)
  3c:	e022                	sd	s0,0(sp)
  3e:	0800                	add	s0,sp,16
  40:	00000097          	auipc	ra,0x0
  44:	000080e7          	jalr	ra # 40 <mycpu+0x8>
  48:	87aa                	mv	a5,a0
  4a:	873e                	mv	a4,a5
  4c:	87ba                	mv	a5,a4
  4e:	0792                	sll	a5,a5,0x4
  50:	8f99                	sub	a5,a5,a4
  52:	078e                	sll	a5,a5,0x3
  54:	00000737          	lui	a4,0x0
  58:	00070713          	mv	a4,a4
  5c:	97ba                	add	a5,a5,a4
  5e:	853e                	mv	a0,a5
  60:	60a2                	ld	ra,8(sp)
  62:	6402                	ld	s0,0(sp)
  64:	0141                	add	sp,sp,16
  66:	8082                	ret

Disassembly of section .data:

0000000000000000 <cpus>:
	...
  74:	0001                	nop
	...
  ea:	0000                	unimp
  ec:	0001                	nop
	...
 3ba:	0000                	unimp
 3bc:	0001                	nop
	...

Disassembly of section .rodata:

0000000000000000 <NullContext>:
	...

Disassembly of section .sdata:

0000000000000000 <test>:
   0:	0001                	nop
	...

Disassembly of section .debug_info:

0000000000000000 <.Ldebug_info0>:
   0:	0000020f          	.4byte	0x20f
   4:	0005                	c.nop	1
   6:	0801                	add	a6,a6,0
   8:	0000                	unimp
   a:	0000                	unimp
   c:	0005                	c.nop	1
   e:	0000                	unimp
  10:	1d00                	add	s0,sp,688
	...
  2e:	0102                	c.slli64	sp
  30:	0008                	.2byte	0x8
  32:	0000                	unimp
  34:	0200                	add	s0,sp,256
  36:	0502                	c.slli64	a0
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	0406                	sll	s0,s0,0x1
  3e:	6905                	lui	s2,0x1
  40:	746e                	ld	s0,248(sp)
  42:	0200                	add	s0,sp,256
  44:	0508                	add	a0,sp,640
  46:	0000                	unimp
  48:	0000                	unimp
  4a:	0102                	c.slli64	sp
  4c:	0008                	.2byte	0x8
  4e:	0000                	unimp
  50:	0200                	add	s0,sp,256
  52:	0702                	c.slli64	a4
  54:	0000                	unimp
  56:	0000                	unimp
  58:	0402                	c.slli64	s0
  5a:	00000007          	.4byte	0x7
  5e:	0700                	add	s0,sp,896
  60:	0000                	unimp
  62:	0000                	unimp
  64:	0c04                	add	s1,sp,528
  66:	6b1c                	ld	a5,16(a4)
  68:	0000                	unimp
  6a:	0200                	add	s0,sp,256
  6c:	0708                	add	a0,sp,896
  6e:	0000                	unimp
  70:	0000                	unimp
  72:	0008                	.2byte	0x8
  74:	0000                	unimp
  76:	7000                	ld	s0,32(s0)
  78:	0e080703          	lb	a4,224(a6)
  7c:	0001                	nop
  7e:	0100                	add	s0,sp,128
  80:	6172                	ld	sp,280(sp)
  82:	0800                	add	s0,sp,16
  84:	005f 0000 0100      	.byte	0x5f, 0x00, 0x00, 0x00, 0x00, 0x01
  8a:	09007073          	csrc	0x90,0
  8e:	005f 0000 0108      	.byte	0x5f, 0x00, 0x00, 0x00, 0x08, 0x01
  94:	0c003073          	csrc	0xc0,zero
  98:	005f 0000 0110      	.byte	0x5f, 0x00, 0x00, 0x00, 0x10, 0x01
  9e:	0d003173          	csrrc	sp,0xd0,zero
  a2:	005f 0000 0118      	.byte	0x5f, 0x00, 0x00, 0x00, 0x18, 0x01
  a8:	0e003273          	csrrc	tp,0xe0,zero
  ac:	005f 0000 0120      	.byte	0x5f, 0x00, 0x00, 0x00, 0x20, 0x01
  b2:	0f003373          	csrrc	t1,0xf0,zero
  b6:	005f 0000 0128      	.byte	0x5f, 0x00, 0x00, 0x00, 0x28, 0x01
  bc:	10003473          	csrrc	s0,sstatus,zero
  c0:	005f 0000 0130      	.byte	0x5f, 0x00, 0x00, 0x00, 0x30, 0x01
  c6:	11003573          	csrrc	a0,0x110,zero
  ca:	005f 0000 0138      	.byte	0x5f, 0x00, 0x00, 0x00, 0x38, 0x01
  d0:	12003673          	csrrc	a2,0x120,zero
  d4:	005f 0000 0140      	.byte	0x5f, 0x00, 0x00, 0x00, 0x40, 0x01
  da:	13003773          	csrrc	a4,0x130,zero
  de:	005f 0000 0148      	.byte	0x5f, 0x00, 0x00, 0x00, 0x48, 0x01
  e4:	14003873          	csrrc	a6,sscratch,zero
  e8:	005f 0000 0150      	.byte	0x5f, 0x00, 0x00, 0x00, 0x50, 0x01
  ee:	15003973          	csrrc	s2,siselect,zero
  f2:	005f 0000 0158      	.byte	0x5f, 0x00, 0x00, 0x00, 0x58, 0x01
  f8:	00303173          	csrrc	sp,fcsr,zero
  fc:	5f16                	lw	t5,100(sp)
  fe:	0000                	unimp
 100:	6000                	ld	s0,0(s0)
 102:	7301                	lui	t1,0xfffe0
 104:	3131                	addw	sp,sp,-20
 106:	1700                	add	s0,sp,928
 108:	005f 0000 0068      	.byte	0x5f, 0x00, 0x00, 0x00, 0x68, 0x00
 10e:	7209                	lui	tp,0xfffe2
 110:	0000                	unimp
 112:	0a00                	add	s0,sp,272
 114:	00757063          	bgeu	a0,t2,114 <.Ldebug_info0+0x114>
 118:	0378                	add	a4,sp,396
 11a:	081a                	sll	a6,a6,0x6
 11c:	0145                	add	sp,sp,17
 11e:	0000                	unimp
 120:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 124:	1c00                	add	s0,sp,560
 126:	7212                	ld	tp,288(sp)
 128:	0000                	unimp
 12a:	0000                	unimp
 12c:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 130:	1d00                	add	s0,sp,688
 132:	00003c07          	fld	fs8,0(zero) # 0 <.Ldebug_info0>
 136:	7000                	ld	s0,32(s0)
 138:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 13c:	1e00                	add	s0,sp,816
 13e:	00003c07          	fld	fs8,0(zero) # 0 <.Ldebug_info0>
 142:	7400                	ld	s0,40(s0)
 144:	0b00                	add	s0,sp,400
 146:	00000113          	li	sp,0
 14a:	0155                	add	sp,sp,21
 14c:	0000                	unimp
 14e:	550c                	lw	a1,40(a0)
 150:	0001                	nop
 152:	0700                	add	s0,sp,896
 154:	0200                	add	s0,sp,256
 156:	0708                	add	a0,sp,896
 158:	0000                	unimp
 15a:	0000                	unimp
 15c:	000d                	c.nop	3
 15e:	0000                	unimp
 160:	0300                	add	s0,sp,384
 162:	1321                	add	t1,t1,-24 # fffffffffffdffe8 <.LASF14+0xfffffffffffdfec3>
 164:	0145                	add	sp,sp,17
 166:	0000                	unimp
 168:	0004                	.2byte	0x4
 16a:	0000                	unimp
 16c:	0300                	add	s0,sp,384
 16e:	0e16                	sll	t3,t3,0x5
 170:	0001                	nop
 172:	0900                	add	s0,sp,144
 174:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 178:	0000                	unimp
 17a:	0000                	unimp
 17c:	0e00                	add	s0,sp,784
 17e:	015c                	add	a5,sp,132
 180:	0000                	unimp
 182:	0502                	c.slli64	a0
 184:	090c                	add	a1,sp,144
 186:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 18a:	0000                	unimp
 18c:	0000                	unimp
 18e:	0400                	add	s0,sp,512
 190:	0000                	unimp
 192:	0000                	unimp
 194:	003c0507          	.4byte	0x3c0507
 198:	0000                	unimp
 19a:	0309                	add	t1,t1,2
	...
 1a4:	0000000f          	fence	unknown,unknown
 1a8:	0200                	add	s0,sp,256
 1aa:	01c20d0f          	.4byte	0x1c20d0f
	...
 1be:	0000                	unimp
 1c0:	9c01                	subw	s0,s0,s0
 1c2:	0810                	add	a2,sp,16
 1c4:	00000113          	li	sp,0
 1c8:	0011                	c.nop	4
 1ca:	0000                	unimp
 1cc:	0200                	add	s0,sp,256
 1ce:	050a                	sll	a0,a0,0x2
 1d0:	003c                	add	a5,sp,8
	...
 1e2:	0000                	unimp
 1e4:	9c01                	subw	s0,s0,s0
 1e6:	0012                	c.slli	zero,0x4
 1e8:	0000                	unimp
 1ea:	0100                	add	s0,sp,128
 1ec:	0109                	add	sp,sp,2
 1ee:	005f 0000 0000      	.byte	0x5f, 0x00, 0x00, 0x00, 0x00, 0x00
	...
 200:	0000                	unimp
 202:	9c01                	subw	s0,s0,s0
 204:	01007813          	and	a6,zero,16
 208:	005f0c0b          	.4byte	0x5f0c0b
 20c:	0000                	unimp
 20e:	9102                	jalr	sp
 210:	0068                	add	a0,sp,12
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.Ldebug_abbrev0>:
   0:	0d01                	add	s10,s10,0
   2:	0300                	add	s0,sp,384
   4:	3a08                	fld	fa0,48(a2)
   6:	0321                	add	t1,t1,8
   8:	21390b3b          	.4byte	0x21390b3b
   c:	490c                	lw	a1,16(a0)
   e:	000b3813          	sltiu	a6,s6,0
  12:	0200                	add	s0,sp,256
  14:	0024                	add	s1,sp,8
  16:	0b3e0b0b          	.4byte	0xb3e0b0b
  1a:	00000e03          	lb	t3,0(zero) # 0 <.Ldebug_abbrev0>
  1e:	03000d03          	lb	s10,48(zero) # 30 <.Ldebug_abbrev0+0x30>
  22:	3a0e                	fld	fs4,224(sp)
  24:	0321                	add	t1,t1,8
  26:	0b390b3b          	.4byte	0xb390b3b
  2a:	1349                	add	t1,t1,-14
  2c:	0b38                	add	a4,sp,408
  2e:	0000                	unimp
  30:	3404                	fld	fs1,40(s0)
  32:	0300                	add	s0,sp,384
  34:	3a0e                	fld	fs4,224(sp)
  36:	0221                	add	tp,tp,8 # fffffffffffe2008 <.LASF14+0xfffffffffffe1ee3>
  38:	0b390b3b          	.4byte	0xb390b3b
  3c:	1349                	add	t1,t1,-14
  3e:	1802193f 11050000 	.8byte	0x110500001802193f
  46:	2501                	sext.w	a0,a0
  48:	130e                	sll	t1,t1,0x23
  4a:	1b1f030b          	.4byte	0x1b1f030b
  4e:	111f 1201 1007      	.byte	0x1f, 0x11, 0x01, 0x12, 0x07, 0x10
  54:	06000017          	auipc	zero,0x6000
  58:	0024                	add	s1,sp,8
  5a:	0b3e0b0b          	.4byte	0xb3e0b0b
  5e:	00000803          	lb	a6,0(zero) # 0 <.Ldebug_abbrev0>
  62:	03001607          	.4byte	0x3001607
  66:	3a0e                	fld	fs4,224(sp)
  68:	390b3b0b          	.4byte	0x390b3b0b
  6c:	0013490b          	.4byte	0x13490b
  70:	0800                	add	s0,sp,16
  72:	0e030113          	add	sp,t1,224
  76:	0b3a0b0b          	.4byte	0xb3a0b0b
  7a:	0b390b3b          	.4byte	0xb390b3b
  7e:	1301                	add	t1,t1,-32
  80:	0000                	unimp
  82:	2609                	addw	a2,a2,2
  84:	4900                	lw	s0,16(a0)
  86:	0a000013          	li	zero,160
  8a:	08030113          	add	sp,t1,128
  8e:	0b3a0b0b          	.4byte	0xb3a0b0b
  92:	0b390b3b          	.4byte	0xb390b3b
  96:	1301                	add	t1,t1,-32
  98:	0000                	unimp
  9a:	4901010b          	.4byte	0x4901010b
  9e:	00130113          	add	sp,t1,1
  a2:	0c00                	add	s0,sp,528
  a4:	0021                	c.nop	8
  a6:	1349                	add	t1,t1,-14
  a8:	00000b2f          	.4byte	0xb2f
  ac:	340d                	addw	s0,s0,-29
  ae:	0300                	add	s0,sp,384
  b0:	3a0e                	fld	fs4,224(sp)
  b2:	390b3b0b          	.4byte	0x390b3b0b
  b6:	3f13490b          	.4byte	0x3f13490b
  ba:	3c19                	addw	s8,s8,-26
  bc:	0019                	c.nop	6
  be:	0e00                	add	s0,sp,784
  c0:	0034                	add	a3,sp,8
  c2:	0b3a1347          	fmsub.d	ft6,fs4,fs3,ft1,rtz
  c6:	0b390b3b          	.4byte	0xb390b3b
  ca:	1802                	sll	a6,a6,0x20
  cc:	0000                	unimp
  ce:	3f002e0f          	.4byte	0x3f002e0f
  d2:	0319                	add	t1,t1,6
  d4:	3a0e                	fld	fs4,224(sp)
  d6:	390b3b0b          	.4byte	0x390b3b0b
  da:	4919270b          	.4byte	0x4919270b
  de:	12011113          	.4byte	0x12011113
  e2:	7c184007          	.4byte	0x7c184007
  e6:	0019                	c.nop	6
  e8:	1000                	add	s0,sp,32
  ea:	0b0b000f          	.4byte	0xb0b000f
  ee:	1349                	add	t1,t1,-14
  f0:	0000                	unimp
  f2:	2e11                	addw	t3,t3,4
  f4:	3f00                	fld	fs0,56(a4)
  f6:	0319                	add	t1,t1,6
  f8:	3a0e                	fld	fs4,224(sp)
  fa:	390b3b0b          	.4byte	0x390b3b0b
  fe:	1113490b          	.4byte	0x1113490b
 102:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LASF14+0xfffffffffffffebb>
 104:	7c184007          	.4byte	0x7c184007
 108:	0019                	c.nop	6
 10a:	1200                	add	s0,sp,288
 10c:	012e                	sll	sp,sp,0xb
 10e:	0b3a0e03          	lb	t3,179(s4)
 112:	0b390b3b          	.4byte	0xb390b3b
 116:	1349                	add	t1,t1,-14
 118:	0111                	add	sp,sp,4
 11a:	0712                	sll	a4,a4,0x4
 11c:	1840                	add	s0,sp,52
 11e:	197a                	sll	s2,s2,0x3e
 120:	0000                	unimp
 122:	03003413          	sltiu	s0,zero,48
 126:	3a08                	fld	fa0,48(a2)
 128:	390b3b0b          	.4byte	0x390b3b0b
 12c:	0213490b          	.4byte	0x213490b
 130:	0018                	.2byte	0x18
	...

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	002c                	add	a1,sp,8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0008                	.2byte	0x8
	...

Disassembly of section .debug_line:

0000000000000000 <.Ldebug_line0>:
   0:	00b1                	add	ra,ra,12
   2:	0000                	unimp
   4:	0005                	c.nop	1
   6:	0008                	.2byte	0x8
   8:	0045                	c.nop	17
   a:	0000                	unimp
   c:	0101                	add	sp,sp,0
   e:	fb01                	bnez	a4,ffffffffffffff1e <.LASF14+0xfffffffffffffdf9>
  10:	0d0e                	sll	s10,s10,0x3
  12:	0100                	add	s0,sp,128
  14:	0101                	add	sp,sp,0
  16:	0001                	nop
  18:	0000                	unimp
  1a:	0001                	nop
  1c:	0100                	add	s0,sp,128
  1e:	0101                	add	sp,sp,0
  20:	041f 0000 0000      	.byte	0x1f, 0x04, 0x00, 0x00, 0x00, 0x00
	...
  32:	0102                	c.slli64	sp
  34:	021f 050f 0000      	.byte	0x1f, 0x02, 0x0f, 0x05, 0x00, 0x00
  3a:	0000                	unimp
  3c:	0001                	nop
  3e:	0000                	unimp
  40:	0200                	add	s0,sp,256
  42:	0000                	unimp
  44:	0000                	unimp
  46:	0001                	nop
  48:	0000                	unimp
  4a:	0300                	add	s0,sp,384
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	0502                	c.slli64	a0
  52:	0001                	nop
  54:	0209                	add	tp,tp,2 # 2 <.Ldebug_line0+0x2>
	...
  5e:	05010903          	lb	s2,80(sp)
  62:	09020303          	lb	t1,144(tp) # 90 <.Ldebug_line0+0x90>
  66:	0000                	unimp
  68:	0501                	add	a0,a0,0
  6a:	030a                	sll	t1,t1,0x2
  6c:	0901                	add	s2,s2,0 # 1000 <.LASF14+0xedb>
  6e:	0000                	unimp
  70:	0501                	add	a0,a0,0
  72:	0301                	add	t1,t1,0
  74:	0901                	add	s2,s2,0
  76:	0000                	unimp
  78:	0401                	add	s0,s0,0
  7a:	0302                	c.slli64	t1
  7c:	097d                	add	s2,s2,31
  7e:	0000                	unimp
  80:	0501                	add	a0,a0,0
  82:	030a                	sll	t1,t1,0x2
  84:	0901                	add	s2,s2,0
  86:	0000                	unimp
  88:	0501                	add	a0,a0,0
  8a:	0301                	add	t1,t1,0
  8c:	0901                	add	s2,s2,0
  8e:	0000                	unimp
  90:	0301                	add	t1,t1,0
  92:	00000903          	lb	s2,0(zero) # 0 <.Ldebug_line0>
  96:	0501                	add	a0,a0,0
  98:	0310                	add	a2,sp,384
  9a:	0901                	add	s2,s2,0
  9c:	0000                	unimp
  9e:	0501                	add	a0,a0,0
  a0:	030a                	sll	t1,t1,0x2
  a2:	0900                	add	s0,sp,144
  a4:	0000                	unimp
  a6:	0501                	add	a0,a0,0
  a8:	0301                	add	t1,t1,0
  aa:	0901                	add	s2,s2,0
  ac:	0000                	unimp
  ae:	0901                	add	s2,s2,0
  b0:	0000                	unimp
  b2:	0100                	add	s0,sp,128
  b4:	01              	Address 0xb4 is out of bounds.


Disassembly of section .debug_str:

0000000000000000 <.LASF7>:
   0:	6e75                	lui	t3,0x1d
   2:	6e676973          	csrrs	s2,0x6e6,14
   6:	6465                	lui	s0,0x19
   8:	6920                	ld	s0,80(a0)
   a:	746e                	ld	s0,248(sp)
	...

000000000000000d <.LASF9>:
   d:	746e6f63          	bltu	t3,t1,76b <.LASF14+0x646>
  11:	7865                	lui	a6,0xffff9
  13:	0074                	add	a3,sp,12

0000000000000015 <.LASF8>:
  15:	6f6c                	ld	a1,216(a4)
  17:	676e                	ld	a4,216(sp)
  19:	6c20                	ld	s0,88(s0)
  1b:	20676e6f          	jal	t3,76221 <.LASF14+0x760fc>
  1f:	6e75                	lui	t3,0x1d
  21:	6e676973          	csrrs	s2,0x6e6,14
  25:	6465                	lui	s0,0x19
  27:	6920                	ld	s0,80(a0)
  29:	746e                	ld	s0,248(sp)
	...

000000000000002c <.LASF19>:
  2c:	69757063          	bgeu	a0,s7,6ac <.LASF14+0x587>
  30:	0064                	add	s1,sp,12

0000000000000032 <.LASF17>:
  32:	6975                	lui	s2,0x1d
  34:	746e                	ld	s0,248(sp)
  36:	3436                	fld	fs0,360(sp)
  38:	745f        	.byte	0x5f, 0x74, 0x00, 0x72, 0x65, 0x61

000000000000003b <.LASF20>:
  3b:	6572                	ld	a0,280(sp)
  3d:	6461                	lui	s0,0x18
  3f:	6d5f 6168 7472      	.byte	0x5f, 0x6d, 0x68, 0x61, 0x72, 0x74
  45:	6469                	lui	s0,0x1a
	...

0000000000000048 <.LASF16>:
  48:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
  4c:	20373143          	fmadd.s	ft2,fa4,ft3,ft4,rup
  50:	3231                	addw	tp,tp,-20 # ffffffffffffffec <.LASF14+0xfffffffffffffec7>
  52:	322e                	fld	ft4,232(sp)
  54:	302e                	fld	ft0,232(sp)
  56:	2d20                	fld	fs0,88(a0)
  58:	6e6d                	lui	t3,0x1b
  5a:	65722d6f          	jal	s10,22eb0 <.LASF14+0x22d8b>
  5e:	616c                	ld	a1,192(a0)
  60:	2078                	fld	fa4,192(s0)
  62:	6d2d                	lui	s10,0xb
  64:	7574                	ld	a3,232(a0)
  66:	656e                	ld	a0,216(sp)
  68:	723d                	lui	tp,0xfffef
  6a:	656b636f          	jal	t1,b66c0 <.LASF14+0xb659b>
  6e:	2074                	fld	fa3,192(s0)
  70:	6d2d                	lui	s10,0xb
  72:	6261                	lui	tp,0x18
  74:	3d69                	addw	s10,s10,-6 # affa <.LASF14+0xaed5>
  76:	706c                	ld	a1,224(s0)
  78:	3436                	fld	fs0,360(sp)
  7a:	2064                	fld	fs1,192(s0)
  7c:	6d2d                	lui	s10,0xb
  7e:	7369                	lui	t1,0xffffa
  80:	2d61                	addw	s10,s10,24 # b018 <.LASF14+0xaef3>
  82:	63657073          	csrc	0x636,10
  86:	323d                	addw	tp,tp,-17 # 17fef <.LASF14+0x17eca>
  88:	322e                	fld	ft4,232(sp)
  8a:	2d20                	fld	fs0,88(a0)
  8c:	616d                	add	sp,sp,240
  8e:	6372                	ld	t1,280(sp)
  90:	3d68                	fld	fa0,248(a0)
  92:	7672                	ld	a2,312(sp)
  94:	3436                	fld	fs0,360(sp)
  96:	6d69                	lui	s10,0x1a
  98:	6661                	lui	a2,0x18
  9a:	6364                	ld	s1,192(a4)
  9c:	2d20                	fld	fs0,88(a0)
  9e:	62646767          	.4byte	0x62646767
  a2:	2d20                	fld	fs0,88(a0)
  a4:	6666                	ld	a2,88(sp)
  a6:	6572                	ld	a0,280(sp)
  a8:	7365                	lui	t1,0xffff9
  aa:	6174                	ld	a3,192(a0)
  ac:	646e                	ld	s0,216(sp)
  ae:	6e69                	lui	t3,0x1a
  b0:	662d2067          	.4byte	0x662d2067
  b4:	6f6e                	ld	t5,216(sp)
  b6:	632d                	lui	t1,0xb
  b8:	6f6d6d6f          	jal	s10,d67ae <.LASF14+0xd6689>
  bc:	006e                	c.slli	zero,0x1b

00000000000000be <.LASF5>:
  be:	6e75                	lui	t3,0x1d
  c0:	6e676973          	csrrs	s2,0x6e6,14
  c4:	6465                	lui	s0,0x19
  c6:	6320                	ld	s0,64(a4)
  c8:	6168                	ld	a0,192(a0)
  ca:	0072                	c.slli	zero,0x1c

00000000000000cc <.LASF15>:
  cc:	6574                	ld	a3,200(a0)
  ce:	          	csrrc	s0,0x630,0

00000000000000d1 <.LASF2>:
  d1:	72616863          	bltu	sp,t1,801 <.LASF14+0x6dc>
	...

00000000000000d6 <.LASF4>:
  d6:	6f6c                	ld	a1,216(a4)
  d8:	676e                	ld	a4,216(sp)
  da:	6920                	ld	s0,80(a0)
  dc:	746e                	ld	s0,248(sp)
	...

00000000000000df <.LASF12>:
  df:	6f6c                	ld	a1,216(a4)
  e1:	676e                	ld	a4,216(sp)
  e3:	7520                	ld	s0,104(a0)
  e5:	736e                	ld	t1,248(sp)
  e7:	6769                	lui	a4,0x1a
  e9:	656e                	ld	a0,216(sp)
  eb:	2064                	fld	fs1,192(s0)
  ed:	6e69                	lui	t3,0x1a
  ef:	0074                	add	a3,sp,12

00000000000000f1 <.LASF18>:
  f1:	796d                	lui	s2,0xffffb
  f3:	00757063          	bgeu	a0,t2,f3 <.LASF18+0x2>

00000000000000f7 <.LASF6>:
  f7:	726f6873          	csrrs	a6,mhpmevent6h,30
  fb:	2074                	fld	fa3,192(s0)
  fd:	6e75                	lui	t3,0x1d
  ff:	6e676973          	csrrs	s2,0x6e6,14
 103:	6465                	lui	s0,0x19
 105:	6920                	ld	s0,80(a0)
 107:	746e                	ld	s0,248(sp)
	...

000000000000010a <.LASF11>:
 10a:	6e69                	lui	t3,0x1a
 10c:	6574                	ld	a3,200(a0)
 10e:	616e                	ld	sp,216(sp)
	...

0000000000000111 <.LASF10>:
 111:	6f6e                	ld	t5,216(sp)
 113:	6666                	ld	a2,88(sp)
	...

0000000000000116 <.LASF3>:
 116:	726f6873          	csrrs	a6,mhpmevent6h,30
 11a:	2074                	fld	fa3,192(s0)
 11c:	6e69                	lui	t3,0x1a
 11e:	0074                	add	a3,sp,12

0000000000000120 <.LASF13>:
 120:	73757063          	bgeu	a0,s7,840 <.LASF14+0x71b>
	...

0000000000000125 <.LASF14>:
 125:	754e                	ld	a0,240(sp)
 127:	6c6c                	ld	a1,216(s0)
 129:	746e6f43          	.4byte	0x746e6f43
 12d:	7865                	lui	a6,0xffff9
 12f:	0074                	add	a3,sp,12

Disassembly of section .debug_line_str:

0000000000000000 <.LASF1>:
   0:	6d6f682f          	.4byte	0x6d6f682f
   4:	2f65                	addw	t5,t5,25
   6:	696c                	ld	a1,208(a0)
   8:	7571                	lui	a0,0xffffc
   a:	6469                	lui	s0,0x1a
   c:	696c672f          	.4byte	0x696c672f
  10:	6d6d                	lui	s10,0x1b
  12:	7265                	lui	tp,0xffff9
  14:	4f2f736f          	jal	t1,f7506 <.LASF14+0xf73e1>
  18:	          	.4byte	0x682f0053

000000000000001a <.LASF0>:
  1a:	6d6f682f          	.4byte	0x6d6f682f
  1e:	2f65                	addw	t5,t5,25
  20:	696c                	ld	a1,208(a0)
  22:	7571                	lui	a0,0xffffc
  24:	6469                	lui	s0,0x1a
  26:	696c672f          	.4byte	0x696c672f
  2a:	6d6d                	lui	s10,0x1b
  2c:	7265                	lui	tp,0xffff9
  2e:	4f2f736f          	jal	t1,f7520 <.LASF14+0xf73fb>
  32:	656b2f53          	.4byte	0x656b2f53
  36:	6e72                	ld	t3,280(sp)
  38:	6c65                	lui	s8,0x19
  3a:	6f72702f          	.4byte	0x6f72702f
  3e:	73736563          	bltu	t1,s7,768 <.LASF14+0x643>
  42:	7570632f          	.4byte	0x7570632f
  46:	632e                	ld	t1,200(sp)
  48:	2f00                	fld	fs0,24(a4)
  4a:	6f68                	ld	a0,216(a4)
  4c:	656d                	lui	a0,0x1b
  4e:	71696c2f          	.4byte	0x71696c2f
  52:	6975                	lui	s2,0x1d
  54:	2f64                	fld	fs1,216(a4)
  56:	6d696c67          	.4byte	0x6d696c67
  5a:	656d                	lui	a0,0x1b
  5c:	6f72                	ld	t5,280(sp)
  5e:	534f2f73          	csrrs	t5,0x534,t5
  62:	2f00                	fld	fs0,24(a4)
  64:	6f68                	ld	a0,216(a4)
  66:	656d                	lui	a0,0x1b
  68:	71696c2f          	.4byte	0x71696c2f
  6c:	6975                	lui	s2,0x1d
  6e:	2f64                	fld	fs1,216(a4)
  70:	6d696c67          	.4byte	0x6d696c67
  74:	656d                	lui	a0,0x1b
  76:	6f72                	ld	t5,280(sp)
  78:	534f2f73          	csrrs	t5,0x534,t5
  7c:	72656b2f          	.4byte	0x72656b2f
  80:	656e                	ld	a0,216(sp)
  82:	2f6c                	fld	fa1,216(a4)
  84:	7270                	ld	a2,224(a2)
  86:	7365636f          	jal	t1,567bc <.LASF14+0x56697>
  8a:	682f0073          	.4byte	0x682f0073
  8e:	2f656d6f          	jal	s10,56384 <.LASF14+0x5625f>
  92:	696c                	ld	a1,208(a0)
  94:	7571                	lui	a0,0xffffc
  96:	6469                	lui	s0,0x1a
  98:	696c672f          	.4byte	0x696c672f
  9c:	6d6d                	lui	s10,0x1b
  9e:	7265                	lui	tp,0xffff9
  a0:	4f2f736f          	jal	t1,f7592 <.LASF14+0xf746d>
  a4:	6e692f53          	.4byte	0x6e692f53
  a8:	64756c63          	bltu	a0,t2,700 <.LASF14+0x5db>
  ac:	0065                	c.nop	25
  ae:	6d6f682f          	.4byte	0x6d6f682f
  b2:	2f65                	addw	t5,t5,25
  b4:	696c                	ld	a1,208(a0)
  b6:	7571                	lui	a0,0xffffc
  b8:	6469                	lui	s0,0x1a
  ba:	696c672f          	.4byte	0x696c672f
  be:	6d6d                	lui	s10,0x1b
  c0:	7265                	lui	tp,0xffff9
  c2:	4f2f736f          	jal	t1,f75b4 <.LASF14+0xf748f>
  c6:	6e692f53          	.4byte	0x6e692f53
  ca:	64756c63          	bltu	a0,t2,722 <.LASF14+0x5fd>
  ce:	2f65                	addw	t5,t5,25
  d0:	7270                	ld	a2,224(a2)
  d2:	7365636f          	jal	t1,56808 <.LASF14+0x566e3>
  d6:	70630073          	.4byte	0x70630073
  da:	2e75                	addw	t3,t3,29 # 1a01d <.LASF14+0x19ef8>
  dc:	69720063          	beq	tp,s7,75c <.LASF14+0x637>
  e0:	36766373          	csrrs	t1,0x367,12
  e4:	2e34                	fld	fa3,88(a2)
  e6:	0068                	add	a0,sp,12
  e8:	2e757063          	bgeu	a0,t2,3c8 <.LASF14+0x2a3>
  ec:	70630063          	beq	t1,t1,7ec <.LASF14+0x6c7>
  f0:	2e75                	addw	t3,t3,29
  f2:	0068                	add	a0,sp,12
  f4:	69647473          	csrrc	s0,0x696,8
  f8:	746e                	ld	s0,248(sp)
  fa:	682e                	ld	a6,200(sp)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	4700                	lw	s0,8(a4)
   2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
   6:	6728                	ld	a0,72(a4)
   8:	6532                	ld	a0,264(sp)
   a:	3565                	addw	a0,a0,-7 # ffffffffffffbff9 <.LASF14+0xffffffffffffbed4>
   c:	3465                	addw	s0,s0,-7 # 19ff9 <.LASF14+0x19ed4>
   e:	31303033          	.4byte	0x31303033
  12:	2938                	fld	fa4,80(a0)
  14:	3120                	fld	fs0,96(a0)
  16:	2e32                	fld	ft8,264(sp)
  18:	2e32                	fld	ft8,264(sp)
  1a:	0030                	add	a2,sp,8

Disassembly of section .debug_frame:

0000000000000000 <.debug_frame>:
   0:	000c                	.2byte	0xc
   2:	0000                	unimp
   4:	ffff                	.2byte	0xffff
   6:	ffff                	.2byte	0xffff
   8:	7c010003          	lb	zero,1984(sp)
   c:	0d01                	add	s10,s10,0 # 1b000 <.LASF14+0x1aedb>
   e:	0002                	c.slli64	zero
  10:	002c                	add	a1,sp,8
	...
  26:	0000                	unimp
  28:	0e42                	sll	t3,t3,0x10
  2a:	4220                	lw	s0,64(a2)
  2c:	0288                	add	a0,sp,320
  2e:	0c42                	sll	s8,s8,0x10
  30:	0008                	.2byte	0x8
  32:	c850                	sw	a2,20(s0)
  34:	020c                	add	a1,sp,256
  36:	4220                	lw	s0,64(a2)
  38:	000e                	c.slli	zero,0x3
  3a:	0000                	unimp
  3c:	0000                	unimp
  3e:	0000                	unimp
  40:	002c                	add	a1,sp,8
	...
  56:	0000                	unimp
  58:	0e42                	sll	t3,t3,0x10
  5a:	4410                	lw	a2,8(s0)
  5c:	0281                	add	t0,t0,0
  5e:	0488                	add	a0,sp,576
  60:	0c42                	sll	s8,s8,0x10
  62:	0008                	.2byte	0x8
  64:	c150                	sw	a2,4(a0)
  66:	c842                	sw	a6,16(sp)
  68:	020c                	add	a1,sp,256
  6a:	4210                	lw	a2,0(a2)
  6c:	000e                	c.slli	zero,0x3
  6e:	0000                	unimp
  70:	002c                	add	a1,sp,8
	...
  86:	0000                	unimp
  88:	0e42                	sll	t3,t3,0x10
  8a:	4410                	lw	a2,8(s0)
  8c:	0281                	add	t0,t0,0
  8e:	0488                	add	a0,sp,576
  90:	0c42                	sll	s8,s8,0x10
  92:	0008                	.2byte	0x8
  94:	c162                	sw	s8,128(sp)
  96:	c842                	sw	a6,16(sp)
  98:	020c                	add	a1,sp,256
  9a:	4210                	lw	a2,0(a2)
  9c:	000e                	c.slli	zero,0x3
	...

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	4141                	li	sp,16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <.riscv.attributes+0x14>
   c:	00000037          	lui	zero,0x0
  10:	1004                	add	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3676                	fld	fa2,376(sp)
  16:	6934                	ld	a3,80(a0)
  18:	7032                	.2byte	0x7032
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	addw	tp,tp,-5 # fffffffffffe0ffb <.LASF14+0xfffffffffffe0ed6>
  1e:	3070                	fld	fa2,224(s0)
  20:	615f 7032 5f30      	.byte	0x5f, 0x61, 0x32, 0x70, 0x30, 0x5f
  26:	3266                	fld	ft4,120(sp)
  28:	3070                	fld	fa2,224(s0)
  2a:	645f 7032 5f30      	.byte	0x5f, 0x64, 0x32, 0x70, 0x30, 0x5f
  30:	30703263          	.4byte	0x30703263
  34:	7a5f 6d6d 6c75      	.byte	0x5f, 0x7a, 0x6d, 0x6d, 0x75, 0x6c
  3a:	7031                	c.lui	zero,0xfffec
  3c:	0030                	add	a2,sp,8
  3e:	0108                	add	a0,sp,128
  40:	0b0a                	sll	s6,s6,0x2
