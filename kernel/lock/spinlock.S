
spinlock.o:     file format elf64-littleriscv


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

000000000000001a <r_sstatus>:
  1a:	1101                	add	sp,sp,-32
  1c:	ec22                	sd	s0,24(sp)
  1e:	1000                	add	s0,sp,32
  20:	100027f3          	csrr	a5,sstatus
  24:	fef43423          	sd	a5,-24(s0)
  28:	fe843783          	ld	a5,-24(s0)
  2c:	853e                	mv	a0,a5
  2e:	6462                	ld	s0,24(sp)
  30:	6105                	add	sp,sp,32
  32:	8082                	ret

0000000000000034 <w_sstatus>:
  34:	1101                	add	sp,sp,-32
  36:	ec22                	sd	s0,24(sp)
  38:	1000                	add	s0,sp,32
  3a:	fea43423          	sd	a0,-24(s0)
  3e:	fe843783          	ld	a5,-24(s0)
  42:	10079073          	csrw	sstatus,a5
  46:	0001                	nop
  48:	6462                	ld	s0,24(sp)
  4a:	6105                	add	sp,sp,32
  4c:	8082                	ret

000000000000004e <intr_get>:
  4e:	1101                	add	sp,sp,-32
  50:	ec06                	sd	ra,24(sp)
  52:	e822                	sd	s0,16(sp)
  54:	1000                	add	s0,sp,32
  56:	00000097          	auipc	ra,0x0
  5a:	000080e7          	jalr	ra # 56 <intr_get+0x8>
  5e:	fea43423          	sd	a0,-24(s0)
  62:	fe843783          	ld	a5,-24(s0)
  66:	8b89                	and	a5,a5,2
  68:	00f037b3          	snez	a5,a5
  6c:	0ff7f793          	zext.b	a5,a5
  70:	2781                	sext.w	a5,a5
  72:	853e                	mv	a0,a5
  74:	60e2                	ld	ra,24(sp)
  76:	6442                	ld	s0,16(sp)
  78:	6105                	add	sp,sp,32
  7a:	8082                	ret

000000000000007c <intr_off>:
  7c:	1141                	add	sp,sp,-16
  7e:	e406                	sd	ra,8(sp)
  80:	e022                	sd	s0,0(sp)
  82:	0800                	add	s0,sp,16
  84:	00000097          	auipc	ra,0x0
  88:	000080e7          	jalr	ra # 84 <intr_off+0x8>
  8c:	87aa                	mv	a5,a0
  8e:	9bf5                	and	a5,a5,-3
  90:	853e                	mv	a0,a5
  92:	00000097          	auipc	ra,0x0
  96:	000080e7          	jalr	ra # 92 <intr_off+0x16>
  9a:	0001                	nop
  9c:	60a2                	ld	ra,8(sp)
  9e:	6402                	ld	s0,0(sp)
  a0:	0141                	add	sp,sp,16
  a2:	8082                	ret

00000000000000a4 <intr_on>:
  a4:	1141                	add	sp,sp,-16
  a6:	e406                	sd	ra,8(sp)
  a8:	e022                	sd	s0,0(sp)
  aa:	0800                	add	s0,sp,16
  ac:	00000097          	auipc	ra,0x0
  b0:	000080e7          	jalr	ra # ac <intr_on+0x8>
  b4:	87aa                	mv	a5,a0
  b6:	0027e793          	or	a5,a5,2
  ba:	853e                	mv	a0,a5
  bc:	00000097          	auipc	ra,0x0
  c0:	000080e7          	jalr	ra # bc <intr_on+0x18>
  c4:	0001                	nop
  c6:	60a2                	ld	ra,8(sp)
  c8:	6402                	ld	s0,0(sp)
  ca:	0141                	add	sp,sp,16
  cc:	8082                	ret

00000000000000ce <cpuid>:
  ce:	1101                	add	sp,sp,-32
  d0:	ec06                	sd	ra,24(sp)
  d2:	e822                	sd	s0,16(sp)
  d4:	1000                	add	s0,sp,32
  d6:	00000097          	auipc	ra,0x0
  da:	000080e7          	jalr	ra # d6 <cpuid+0x8>
  de:	87aa                	mv	a5,a0
  e0:	fef42623          	sw	a5,-20(s0)
  e4:	fec42783          	lw	a5,-20(s0)
  e8:	853e                	mv	a0,a5
  ea:	60e2                	ld	ra,24(sp)
  ec:	6442                	ld	s0,16(sp)
  ee:	6105                	add	sp,sp,32
  f0:	8082                	ret

00000000000000f2 <mycpu>:
  f2:	1101                	add	sp,sp,-32
  f4:	ec06                	sd	ra,24(sp)
  f6:	e822                	sd	s0,16(sp)
  f8:	1000                	add	s0,sp,32
  fa:	00000097          	auipc	ra,0x0
  fe:	000080e7          	jalr	ra # fa <mycpu+0x8>
 102:	87aa                	mv	a5,a0
 104:	fef42623          	sw	a5,-20(s0)
 108:	fec42703          	lw	a4,-20(s0)
 10c:	87ba                	mv	a5,a4
 10e:	0792                	sll	a5,a5,0x4
 110:	8f99                	sub	a5,a5,a4
 112:	078e                	sll	a5,a5,0x3
 114:	00000737          	lui	a4,0x0
 118:	00070713          	mv	a4,a4
 11c:	97ba                	add	a5,a5,a4
 11e:	fef43023          	sd	a5,-32(s0)
 122:	fe043783          	ld	a5,-32(s0)
 126:	853e                	mv	a0,a5
 128:	60e2                	ld	ra,24(sp)
 12a:	6442                	ld	s0,16(sp)
 12c:	6105                	add	sp,sp,32
 12e:	8082                	ret

0000000000000130 <init_lock>:
 130:	1101                	add	sp,sp,-32
 132:	ec22                	sd	s0,24(sp)
 134:	1000                	add	s0,sp,32
 136:	fea43423          	sd	a0,-24(s0)
 13a:	feb43023          	sd	a1,-32(s0)
 13e:	fe843783          	ld	a5,-24(s0)
 142:	0007b823          	sd	zero,16(a5)
 146:	fe843783          	ld	a5,-24(s0)
 14a:	0007a023          	sw	zero,0(a5)
 14e:	fe843783          	ld	a5,-24(s0)
 152:	fe043703          	ld	a4,-32(s0)
 156:	e798                	sd	a4,8(a5)
 158:	0001                	nop
 15a:	6462                	ld	s0,24(sp)
 15c:	6105                	add	sp,sp,32
 15e:	8082                	ret

0000000000000160 <acquire>:
 160:	1101                	add	sp,sp,-32
 162:	ec06                	sd	ra,24(sp)
 164:	e822                	sd	s0,16(sp)
 166:	1000                	add	s0,sp,32
 168:	fea43423          	sd	a0,-24(s0)
 16c:	00000097          	auipc	ra,0x0
 170:	000080e7          	jalr	ra # 16c <acquire+0xc>
 174:	fe843503          	ld	a0,-24(s0)
 178:	00000097          	auipc	ra,0x0
 17c:	000080e7          	jalr	ra # 178 <acquire+0x18>
 180:	0001                	nop

0000000000000182 <.L16>:
 182:	fe843783          	ld	a5,-24(s0)
 186:	4705                	li	a4,1
 188:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
 18c:	0007079b          	sext.w	a5,a4
 190:	fbed                	bnez	a5,182 <.L16>
 192:	0ff0000f          	fence
 196:	00000097          	auipc	ra,0x0
 19a:	000080e7          	jalr	ra # 196 <.L16+0x14>
 19e:	872a                	mv	a4,a0
 1a0:	fe843783          	ld	a5,-24(s0)
 1a4:	eb98                	sd	a4,16(a5)
 1a6:	0001                	nop
 1a8:	60e2                	ld	ra,24(sp)
 1aa:	6442                	ld	s0,16(sp)
 1ac:	6105                	add	sp,sp,32
 1ae:	8082                	ret

00000000000001b0 <release>:
 1b0:	1101                	add	sp,sp,-32
 1b2:	ec06                	sd	ra,24(sp)
 1b4:	e822                	sd	s0,16(sp)
 1b6:	1000                	add	s0,sp,32
 1b8:	fea43423          	sd	a0,-24(s0)
 1bc:	fe843503          	ld	a0,-24(s0)
 1c0:	00000097          	auipc	ra,0x0
 1c4:	000080e7          	jalr	ra # 1c0 <release+0x10>
 1c8:	fe843783          	ld	a5,-24(s0)
 1cc:	0007b823          	sd	zero,16(a5)
 1d0:	0ff0000f          	fence
 1d4:	fe843783          	ld	a5,-24(s0)
 1d8:	0f50000f          	fence	iorw,ow
 1dc:	0807a02f          	amoswap.w	zero,zero,(a5)
 1e0:	00000097          	auipc	ra,0x0
 1e4:	000080e7          	jalr	ra # 1e0 <release+0x30>
 1e8:	0001                	nop
 1ea:	60e2                	ld	ra,24(sp)
 1ec:	6442                	ld	s0,16(sp)
 1ee:	6105                	add	sp,sp,32
 1f0:	8082                	ret

00000000000001f2 <holding>:
 1f2:	7139                	add	sp,sp,-64
 1f4:	fc06                	sd	ra,56(sp)
 1f6:	f822                	sd	s0,48(sp)
 1f8:	f426                	sd	s1,40(sp)
 1fa:	0080                	add	s0,sp,64
 1fc:	fca43423          	sd	a0,-56(s0)
 200:	fc843783          	ld	a5,-56(s0)
 204:	439c                	lw	a5,0(a5)
 206:	cf89                	beqz	a5,220 <.L19>
 208:	fc843783          	ld	a5,-56(s0)
 20c:	6b84                	ld	s1,16(a5)
 20e:	00000097          	auipc	ra,0x0
 212:	000080e7          	jalr	ra # 20e <holding+0x1c>
 216:	87aa                	mv	a5,a0
 218:	00f49463          	bne	s1,a5,220 <.L19>
 21c:	4785                	li	a5,1
 21e:	a011                	j	222 <.L20>

0000000000000220 <.L19>:
 220:	4781                	li	a5,0

0000000000000222 <.L20>:
 222:	fcf42e23          	sw	a5,-36(s0)
 226:	fdc42783          	lw	a5,-36(s0)
 22a:	853e                	mv	a0,a5
 22c:	70e2                	ld	ra,56(sp)
 22e:	7442                	ld	s0,48(sp)
 230:	74a2                	ld	s1,40(sp)
 232:	6121                	add	sp,sp,64
 234:	8082                	ret

0000000000000236 <push_off>:
 236:	1101                	add	sp,sp,-32
 238:	ec06                	sd	ra,24(sp)
 23a:	e822                	sd	s0,16(sp)
 23c:	1000                	add	s0,sp,32
 23e:	00000097          	auipc	ra,0x0
 242:	000080e7          	jalr	ra # 23e <push_off+0x8>
 246:	87aa                	mv	a5,a0
 248:	fef42623          	sw	a5,-20(s0)
 24c:	00000097          	auipc	ra,0x0
 250:	000080e7          	jalr	ra # 24c <push_off+0x16>
 254:	00000097          	auipc	ra,0x0
 258:	000080e7          	jalr	ra # 254 <push_off+0x1e>
 25c:	87aa                	mv	a5,a0
 25e:	5bbc                	lw	a5,112(a5)
 260:	eb89                	bnez	a5,272 <.L23>
 262:	00000097          	auipc	ra,0x0
 266:	000080e7          	jalr	ra # 262 <push_off+0x2c>
 26a:	872a                	mv	a4,a0
 26c:	fec42783          	lw	a5,-20(s0)
 270:	db7c                	sw	a5,116(a4)

0000000000000272 <.L23>:
 272:	00000097          	auipc	ra,0x0
 276:	000080e7          	jalr	ra # 272 <.L23>
 27a:	87aa                	mv	a5,a0
 27c:	5bb8                	lw	a4,112(a5)
 27e:	2705                	addw	a4,a4,1 # 1 <read_mhartid+0x1>
 280:	2701                	sext.w	a4,a4
 282:	dbb8                	sw	a4,112(a5)
 284:	0001                	nop
 286:	60e2                	ld	ra,24(sp)
 288:	6442                	ld	s0,16(sp)
 28a:	6105                	add	sp,sp,32
 28c:	8082                	ret

000000000000028e <pop_off>:
 28e:	1101                	add	sp,sp,-32
 290:	ec06                	sd	ra,24(sp)
 292:	e822                	sd	s0,16(sp)
 294:	1000                	add	s0,sp,32
 296:	00000097          	auipc	ra,0x0
 29a:	000080e7          	jalr	ra # 296 <pop_off+0x8>
 29e:	fea43423          	sd	a0,-24(s0)
 2a2:	00000097          	auipc	ra,0x0
 2a6:	000080e7          	jalr	ra # 2a2 <pop_off+0x14>
 2aa:	fe843783          	ld	a5,-24(s0)
 2ae:	5bbc                	lw	a5,112(a5)
 2b0:	37fd                	addw	a5,a5,-1
 2b2:	0007871b          	sext.w	a4,a5
 2b6:	fe843783          	ld	a5,-24(s0)
 2ba:	dbb8                	sw	a4,112(a5)
 2bc:	fe843783          	ld	a5,-24(s0)
 2c0:	eb89                	bnez	a5,2d2 <.L26>
 2c2:	fe843783          	ld	a5,-24(s0)
 2c6:	5bfc                	lw	a5,116(a5)
 2c8:	c789                	beqz	a5,2d2 <.L26>
 2ca:	00000097          	auipc	ra,0x0
 2ce:	000080e7          	jalr	ra # 2ca <pop_off+0x3c>

00000000000002d2 <.L26>:
 2d2:	0001                	nop
 2d4:	60e2                	ld	ra,24(sp)
 2d6:	6442                	ld	s0,16(sp)
 2d8:	6105                	add	sp,sp,32
 2da:	8082                	ret

Disassembly of section .bss:

0000000000000000 <cpus>:
	...

Disassembly of section .debug_info:

0000000000000000 <.Ldebug_info0>:
   0:	00000453          	fadd.s	fs0,ft0,ft0,rne
   4:	0005                	c.nop	1
   6:	0801                	add	a6,a6,0
   8:	0000                	unimp
   a:	0000                	unimp
   c:	000d                	c.nop	3
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
  3c:	040e                	sll	s0,s0,0x3
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
  58:	0008                	.2byte	0x8
  5a:	0000                	unimp
  5c:	0b00                	add	s0,sp,400
  5e:	6316                	ld	t1,320(sp)
  60:	0000                	unimp
  62:	0200                	add	s0,sp,256
  64:	0704                	add	s1,sp,896
  66:	0000                	unimp
  68:	0000                	unimp
  6a:	0008                	.2byte	0x8
  6c:	0000                	unimp
  6e:	0c00                	add	s0,sp,528
  70:	751c                	ld	a5,40(a0)
  72:	0000                	unimp
  74:	0200                	add	s0,sp,256
  76:	0708                	add	a0,sp,896
  78:	0000                	unimp
  7a:	0000                	unimp
  7c:	0009                	c.nop	2
  7e:	0000                	unimp
  80:	7000                	ld	s0,32(s0)
  82:	0802                	c.slli64	a6
  84:	00000133          	add	sp,zero,zero
  88:	7201                	lui	tp,0xfffe0
  8a:	0061                	c.nop	24
  8c:	0902                	c.slli64	s2
  8e:	6a0c                	ld	a1,16(a2)
  90:	0000                	unimp
  92:	0000                	unimp
  94:	7301                	lui	t1,0xfffe0
  96:	0070                	add	a2,sp,12
  98:	0a02                	c.slli64	s4
  9a:	6a0c                	ld	a1,16(a2)
  9c:	0000                	unimp
  9e:	0800                	add	s0,sp,16
  a0:	7301                	lui	t1,0xfffe0
  a2:	0030                	add	a2,sp,8
  a4:	0d02                	c.slli64	s10
  a6:	6a0c                	ld	a1,16(a2)
  a8:	0000                	unimp
  aa:	1000                	add	s0,sp,32
  ac:	7301                	lui	t1,0xfffe0
  ae:	0031                	c.nop	12
  b0:	0e02                	c.slli64	t3
  b2:	6a0c                	ld	a1,16(a2)
  b4:	0000                	unimp
  b6:	1800                	add	s0,sp,48
  b8:	7301                	lui	t1,0xfffe0
  ba:	0032                	c.slli	zero,0xc
  bc:	0f02                	c.slli64	t5
  be:	6a0c                	ld	a1,16(a2)
  c0:	0000                	unimp
  c2:	2000                	fld	fs0,0(s0)
  c4:	7301                	lui	t1,0xfffe0
  c6:	10020033          	.4byte	0x10020033
  ca:	6a0c                	ld	a1,16(a2)
  cc:	0000                	unimp
  ce:	2800                	fld	fs0,16(s0)
  d0:	7301                	lui	t1,0xfffe0
  d2:	0034                	add	a3,sp,8
  d4:	1102                	sll	sp,sp,0x20
  d6:	6a0c                	ld	a1,16(a2)
  d8:	0000                	unimp
  da:	3000                	fld	fs0,32(s0)
  dc:	7301                	lui	t1,0xfffe0
  de:	0035                	c.nop	13
  e0:	1202                	sll	tp,tp,0x20
  e2:	6a0c                	ld	a1,16(a2)
  e4:	0000                	unimp
  e6:	3800                	fld	fs0,48(s0)
  e8:	7301                	lui	t1,0xfffe0
  ea:	0036                	c.slli	zero,0xd
  ec:	1302                	sll	t1,t1,0x20
  ee:	6a0c                	ld	a1,16(a2)
  f0:	0000                	unimp
  f2:	4000                	lw	s0,0(s0)
  f4:	7301                	lui	t1,0xfffe0
  f6:	14020037          	lui	zero,0x14020
  fa:	6a0c                	ld	a1,16(a2)
  fc:	0000                	unimp
  fe:	4800                	lw	s0,16(s0)
 100:	7301                	lui	t1,0xfffe0
 102:	0038                	add	a4,sp,8
 104:	1502                	sll	a0,a0,0x20
 106:	6a0c                	ld	a1,16(a2)
 108:	0000                	unimp
 10a:	5000                	lw	s0,32(s0)
 10c:	7301                	lui	t1,0xfffe0
 10e:	0039                	c.nop	14
 110:	1602                	sll	a2,a2,0x20
 112:	6a0c                	ld	a1,16(a2)
 114:	0000                	unimp
 116:	5800                	lw	s0,48(s0)
 118:	7301                	lui	t1,0xfffe0
 11a:	3031                	.2byte	0x3031
 11c:	0200                	add	s0,sp,256
 11e:	006a0c17          	auipc	s8,0x6a0
 122:	0000                	unimp
 124:	0160                	add	s0,sp,140
 126:	00313173          	csrrc	sp,fcsr,sp
 12a:	1802                	sll	a6,a6,0x20
 12c:	6a0c                	ld	a1,16(a2)
 12e:	0000                	unimp
 130:	6800                	ld	s0,16(s0)
 132:	0f00                	add	s0,sp,912
 134:	00757063          	bgeu	a0,t2,134 <.Ldebug_info0+0x134>
 138:	0278                	add	a4,sp,268
 13a:	0168081b          	addw	a6,a6,22
 13e:	0000                	unimp
 140:	0004                	.2byte	0x4
 142:	0000                	unimp
 144:	0200                	add	s0,sp,256
 146:	121d                	add	tp,tp,-25 # fffffffffffdffe7 <.LFE14+0xfffffffffffdfd0b>
 148:	007c                	add	a5,sp,12
 14a:	0000                	unimp
 14c:	0400                	add	s0,sp,512
 14e:	0000                	unimp
 150:	0000                	unimp
 152:	1e02                	sll	t3,t3,0x20
 154:	00003c07          	fld	fs8,0(zero) # 0 <.Ldebug_info0>
 158:	7000                	ld	s0,32(s0)
 15a:	0004                	.2byte	0x4
 15c:	0000                	unimp
 15e:	0200                	add	s0,sp,256
 160:	071f 003c 0000      	.byte	0x1f, 0x07, 0x3c, 0x00, 0x00, 0x00
 166:	0074                	add	a3,sp,12
 168:	3310                	fld	fa2,32(a4)
 16a:	0001                	nop
 16c:	7800                	ld	s0,48(s0)
 16e:	0001                	nop
 170:	1100                	add	s0,sp,160
 172:	0178                	add	a4,sp,140
 174:	0000                	unimp
 176:	08020007          	.4byte	0x8020007
 17a:	00000007          	.4byte	0x7
 17e:	1200                	add	s0,sp,288
 180:	0000                	unimp
 182:	0000                	unimp
 184:	2202                	fld	ft4,0(sp)
 186:	680c                	ld	a1,16(s0)
 188:	0001                	nop
 18a:	0900                	add	s0,sp,144
 18c:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_info0>
 190:	0000                	unimp
 192:	0000                	unimp
 194:	0900                	add	s0,sp,144
 196:	0000                	unimp
 198:	0000                	unimp
 19a:	0518                	add	a4,sp,640
 19c:	c905                	beqz	a0,1cc <.Ldebug_info0+0x1cc>
 19e:	0001                	nop
 1a0:	0400                	add	s0,sp,512
 1a2:	0000                	unimp
 1a4:	0000                	unimp
 1a6:	0605                	add	a2,a2,1
 1a8:	580c                	lw	a1,48(s0)
 1aa:	0000                	unimp
 1ac:	0000                	unimp
 1ae:	0004                	.2byte	0x4
 1b0:	0000                	unimp
 1b2:	0500                	add	s0,sp,640
 1b4:	0908                	add	a0,sp,144
 1b6:	01c9                	add	gp,gp,18
 1b8:	0000                	unimp
 1ba:	0108                	add	a0,sp,128
 1bc:	00757063          	bgeu	a0,t2,1bc <.Ldebug_info0+0x1bc>
 1c0:	0905                	add	s2,s2,1 # 1001 <.LFE14+0xd25>
 1c2:	0001ce0f          	.4byte	0x1ce0f
 1c6:	1000                	add	s0,sp,32
 1c8:	0700                	add	s0,sp,896
 1ca:	002e                	c.slli	zero,0xb
 1cc:	0000                	unimp
 1ce:	00013307          	fld	ft6,0(sp)
 1d2:	0600                	add	s0,sp,768
 1d4:	0000                	unimp
 1d6:	0000                	unimp
 1d8:	0000003f 00000000 	.8byte	0x3f
	...
 1e8:	0100                	add	s0,sp,128
 1ea:	fe9c                	sd	a5,56(a3)
 1ec:	0001                	nop
 1ee:	0a00                	add	s0,sp,272
 1f0:	0000                	unimp
 1f2:	0000                	unimp
 1f4:	1140                	add	s0,sp,164
 1f6:	01ce                	sll	gp,gp,0x13
 1f8:	0000                	unimp
 1fa:	9102                	jalr	sp
 1fc:	0068                	add	a0,sp,12
 1fe:	0006                	c.slli	zero,0x1
 200:	0000                	unimp
 202:	3500                	fld	fs0,40(a0)
	...
 214:	9c01                	subw	s0,s0,s0
 216:	022a                	sll	tp,tp,0xa
 218:	0000                	unimp
 21a:	646c6f03          	lwu	t5,1606(s8) # 6a0764 <.LFE14+0x6a0488>
 21e:	0300                	add	s0,sp,384
 220:	0936                	sll	s2,s2,0xd
 222:	003c                	add	a5,sp,8
 224:	0000                	unimp
 226:	9102                	jalr	sp
 228:	006c                	add	a1,sp,12
 22a:	0000000b          	.4byte	0xb
 22e:	0300                	add	s0,sp,384
 230:	003c052f          	.4byte	0x3c052f
	...
 244:	0000                	unimp
 246:	9c01                	subw	s0,s0,s0
 248:	0269                	add	tp,tp,26 # 1a <.Ldebug_info0+0x1a>
 24a:	0000                	unimp
 24c:	0005                	c.nop	1
 24e:	0000                	unimp
 250:	2f00                	fld	fs0,24(a4)
 252:	691e                	ld	s2,448(sp)
 254:	0002                	c.slli64	zero
 256:	0200                	add	s0,sp,256
 258:	4891                	li	a7,4
 25a:	000a                	c.slli	zero,0x2
 25c:	0000                	unimp
 25e:	3000                	fld	fs0,32(s0)
 260:	3c09                	addw	s8,s8,-30
 262:	0000                	unimp
 264:	0200                	add	s0,sp,256
 266:	5c91                	li	s9,-28
 268:	0700                	add	s0,sp,896
 26a:	0195                	add	gp,gp,5
 26c:	0000                	unimp
 26e:	0006                	c.slli	zero,0x1
 270:	0000                	unimp
 272:	1f00                	add	s0,sp,944
	...
 284:	9c01                	subw	s0,s0,s0
 286:	0299                	add	t0,t0,6
 288:	0000                	unimp
 28a:	0005                	c.nop	1
 28c:	0000                	unimp
 28e:	1f00                	add	s0,sp,944
 290:	691f 0002 0200      	.byte	0x1f, 0x69, 0x02, 0x00, 0x00, 0x02
 296:	6891                	lui	a7,0x4
 298:	0600                	add	s0,sp,768
 29a:	0000                	unimp
 29c:	0000                	unimp
 29e:	0000000b          	.4byte	0xb
	...
 2ae:	0100                	add	s0,sp,128
 2b0:	c49c                	sw	a5,8(s1)
 2b2:	0002                	c.slli64	zero
 2b4:	0500                	add	s0,sp,640
 2b6:	0000                	unimp
 2b8:	0000                	unimp
 2ba:	02691f0b          	.4byte	0x2691f0b
 2be:	0000                	unimp
 2c0:	9102                	jalr	sp
 2c2:	0068                	add	a0,sp,12
 2c4:	00000013          	nop
 2c8:	0300                	add	s0,sp,384
 2ca:	0604                	add	s1,sp,768
	...
 2dc:	9c01                	subw	s0,s0,s0
 2de:	02ff 0000 0005 0000 	.byte	0xff, 0x02, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x04
 2e6:	0400 
 2e8:	6921                	lui	s2,0x8
 2ea:	0002                	c.slli64	zero
 2ec:	0200                	add	s0,sp,256
 2ee:	6891                	lui	a7,0x4
 2f0:	0005                	c.nop	1
 2f2:	0000                	unimp
 2f4:	0400                	add	s0,sp,512
 2f6:	c92d                	beqz	a0,368 <.Ldebug_info0+0x368>
 2f8:	0001                	nop
 2fa:	0200                	add	s0,sp,256
 2fc:	6091                	lui	ra,0x4
 2fe:	0b00                	add	s0,sp,400
 300:	0000                	unimp
 302:	0000                	unimp
 304:	2b02                	fld	fs6,0(sp)
 306:	ce0d                	beqz	a2,340 <.Ldebug_info0+0x340>
 308:	0001                	nop
	...
 31a:	0100                	add	s0,sp,128
 31c:	3d9c                	fld	fa5,56(a1)
 31e:	03000003          	lb	zero,48(zero) # 30 <.Ldebug_info0+0x30>
 322:	6469                	lui	s0,0x1a
 324:	0200                	add	s0,sp,256
 326:	072d                	add	a4,a4,11
 328:	003c                	add	a5,sp,8
 32a:	0000                	unimp
 32c:	9102                	jalr	sp
 32e:	036c                	add	a1,sp,396
 330:	2e020063          	beqz	tp,610 <.LFE14+0x334>
 334:	0001ce0f          	.4byte	0x1ce0f
 338:	0200                	add	s0,sp,256
 33a:	6091                	lui	ra,0x4
 33c:	1400                	add	s0,sp,544
 33e:	0000                	unimp
 340:	0000                	unimp
 342:	2502                	fld	fa0,0(sp)
 344:	3c05                	addw	s8,s8,-31
	...
 356:	0000                	unimp
 358:	0100                	add	s0,sp,128
 35a:	6e9c                	ld	a5,24(a3)
 35c:	03000003          	lb	zero,48(zero) # 30 <.Ldebug_info0+0x30>
 360:	6469                	lui	s0,0x1a
 362:	0200                	add	s0,sp,256
 364:	003c0727          	.4byte	0x3c0727
 368:	0000                	unimp
 36a:	9102                	jalr	sp
 36c:	006c                	add	a1,sp,12
 36e:	000c                	.2byte	0xc
 370:	0000                	unimp
 372:	4500                	lw	s0,8(a0)
	...
 384:	9c01                	subw	s0,s0,s0
 386:	000c                	.2byte	0xc
 388:	0000                	unimp
 38a:	3c00                	fld	fs0,56(s0)
	...
 39c:	9c01                	subw	s0,s0,s0
 39e:	0015                	c.nop	5
 3a0:	0000                	unimp
 3a2:	0100                	add	s0,sp,128
 3a4:	0129                	add	sp,sp,10
 3a6:	003c                	add	a5,sp,8
	...
 3b8:	0000                	unimp
 3ba:	9c01                	subw	s0,s0,s0
 3bc:	03ce                	sll	t2,t2,0x13
 3be:	0000                	unimp
 3c0:	01007803          	.4byte	0x1007803
 3c4:	006a0c2b          	.4byte	0x6a0c2b
 3c8:	0000                	unimp
 3ca:	9102                	jalr	sp
 3cc:	0068                	add	a0,sp,12
 3ce:	0016                	c.slli	zero,0x5
 3d0:	0000                	unimp
 3d2:	0100                	add	s0,sp,128
 3d4:	011f 0000 0000      	.byte	0x1f, 0x01, 0x00, 0x00, 0x00, 0x00
	...
 3e6:	9c01                	subw	s0,s0,s0
 3e8:	03fa                	sll	t2,t2,0x1e
 3ea:	0000                	unimp
 3ec:	01007817          	auipc	a6,0x1007
 3f0:	141f 006a 0000      	.byte	0x1f, 0x14, 0x6a, 0x00, 0x00, 0x00
 3f6:	9102                	jalr	sp
 3f8:	0068                	add	a0,sp,12
 3fa:	0018                	.2byte	0x18
 3fc:	0000                	unimp
 3fe:	0100                	add	s0,sp,128
 400:	0118                	add	a4,sp,128
 402:	006a                	c.slli	zero,0x1a
	...
 414:	0000                	unimp
 416:	9c01                	subw	s0,s0,s0
 418:	042a                	sll	s0,s0,0xa
 41a:	0000                	unimp
 41c:	01007803          	.4byte	0x1007803
 420:	0c1a                	sll	s8,s8,0x6
 422:	006a                	c.slli	zero,0x1a
 424:	0000                	unimp
 426:	9102                	jalr	sp
 428:	0068                	add	a0,sp,12
 42a:	0019                	c.nop	6
 42c:	0000                	unimp
 42e:	0100                	add	s0,sp,128
 430:	0109                	add	sp,sp,2
 432:	006a                	c.slli	zero,0x1a
	...
 444:	0000                	unimp
 446:	9c01                	subw	s0,s0,s0
 448:	01007803          	.4byte	0x1007803
 44c:	006a0c0b          	.4byte	0x6a0c0b
 450:	0000                	unimp
 452:	9102                	jalr	sp
 454:	0068                	add	a0,sp,12
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.Ldebug_abbrev0>:
   0:	0d01                	add	s10,s10,0
   2:	0300                	add	s0,sp,384
   4:	3a08                	fld	fa0,48(a2)
   6:	390b3b0b          	.4byte	0x390b3b0b
   a:	3813490b          	.4byte	0x3813490b
   e:	0200000b          	.4byte	0x200000b
  12:	0024                	add	s1,sp,8
  14:	0b3e0b0b          	.4byte	0xb3e0b0b
  18:	00000e03          	lb	t3,0(zero) # 0 <.Ldebug_abbrev0>
  1c:	03003403          	ld	s0,48(zero) # 30 <.Ldebug_abbrev0+0x30>
  20:	3a08                	fld	fa0,48(a2)
  22:	390b3b0b          	.4byte	0x390b3b0b
  26:	0213490b          	.4byte	0x213490b
  2a:	0018                	.2byte	0x18
  2c:	0400                	add	s0,sp,512
  2e:	000d                	c.nop	3
  30:	0b3a0e03          	lb	t3,179(s4)
  34:	0b390b3b          	.4byte	0xb390b3b
  38:	1349                	add	t1,t1,-14 # fffffffffffdfff2 <.LFE14+0xfffffffffffdfd16>
  3a:	0b38                	add	a4,sp,408
  3c:	0000                	unimp
  3e:	0505                	add	a0,a0,1
  40:	0300                	add	s0,sp,384
  42:	3a0e                	fld	fs4,224(sp)
  44:	0321                	add	t1,t1,8
  46:	0b390b3b          	.4byte	0xb390b3b
  4a:	1349                	add	t1,t1,-14
  4c:	1802                	sll	a6,a6,0x20
  4e:	0000                	unimp
  50:	2e06                	fld	ft8,64(sp)
  52:	3f01                	addw	t5,t5,-32
  54:	0319                	add	t1,t1,6
  56:	3a0e                	fld	fs4,224(sp)
  58:	0321                	add	t1,t1,8
  5a:	21390b3b          	.4byte	0x21390b3b
  5e:	2706                	fld	fa4,64(sp)
  60:	1119                	add	sp,sp,-26
  62:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LFE14+0xfffffffffffffd04>
  64:	7c184007          	.4byte	0x7c184007
  68:	0119                	add	sp,sp,6
  6a:	07000013          	li	zero,112
  6e:	210b000f          	.4byte	0x210b000f
  72:	4908                	lw	a0,16(a0)
  74:	08000013          	li	zero,128
  78:	0016                	c.slli	zero,0x5
  7a:	213a0e03          	lb	t3,531(s4)
  7e:	3b04                	fld	fs1,48(a4)
  80:	490b390b          	.4byte	0x490b390b
  84:	09000013          	li	zero,144
  88:	0e030113          	add	sp,t1,224
  8c:	0b3a0b0b          	.4byte	0xb3a0b0b
  90:	21390b3b          	.4byte	0x21390b3b
  94:	0108                	add	a0,sp,128
  96:	0a000013          	li	zero,160
  9a:	0034                	add	a3,sp,8
  9c:	213a0e03          	lb	t3,531(s4)
  a0:	390b3b03          	ld	s6,912(s6)
  a4:	0213490b          	.4byte	0x213490b
  a8:	0018                	.2byte	0x18
  aa:	0b00                	add	s0,sp,400
  ac:	012e                	sll	sp,sp,0xb
  ae:	0e03193f 0b3b0b3a 	.8byte	0xb3b0b3a0e03193f
  b6:	0b39                	add	s6,s6,14
  b8:	13491927          	.4byte	0x13491927
  bc:	0111                	add	sp,sp,4
  be:	0712                	sll	a4,a4,0x4
  c0:	1840                	add	s0,sp,52
  c2:	197c                	add	a5,sp,188
  c4:	1301                	add	t1,t1,-32
  c6:	0000                	unimp
  c8:	2e0c                	fld	fa1,24(a2)
  ca:	0300                	add	s0,sp,384
  cc:	3a0e                	fld	fs4,224(sp)
  ce:	0121                	add	sp,sp,8
  d0:	21390b3b          	.4byte	0x21390b3b
  d4:	1101                	add	sp,sp,-32
  d6:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LFE14+0xfffffffffffffd04>
  d8:	7c184007          	.4byte	0x7c184007
  dc:	0019                	c.nop	6
  de:	0d00                	add	s0,sp,656
  e0:	0111                	add	sp,sp,4
  e2:	0e25                	add	t3,t3,9
  e4:	1f030b13          	add	s6,t1,496
  e8:	01111f1b          	sllw	t5,sp,0x11
  ec:	0712                	sll	a4,a4,0x4
  ee:	1710                	add	a2,sp,928
  f0:	0000                	unimp
  f2:	240e                	fld	fs0,192(sp)
  f4:	0b00                	add	s0,sp,400
  f6:	030b3e0b          	.4byte	0x30b3e0b
  fa:	0008                	.2byte	0x8
  fc:	0f00                	add	s0,sp,912
  fe:	08030113          	add	sp,t1,128
 102:	0b3a0b0b          	.4byte	0xb3a0b0b
 106:	0b390b3b          	.4byte	0xb390b3b
 10a:	1301                	add	t1,t1,-32
 10c:	0000                	unimp
 10e:	0110                	add	a2,sp,128
 110:	4901                	li	s2,0
 112:	00130113          	add	sp,t1,1
 116:	1100                	add	s0,sp,160
 118:	0021                	c.nop	8
 11a:	1349                	add	t1,t1,-14
 11c:	00000b2f          	.4byte	0xb2f
 120:	3412                	fld	fs0,288(sp)
 122:	0300                	add	s0,sp,384
 124:	3a0e                	fld	fs4,224(sp)
 126:	390b3b0b          	.4byte	0x390b3b0b
 12a:	3f13490b          	.4byte	0x3f13490b
 12e:	0219                	add	tp,tp,6 # 6 <.Ldebug_abbrev0+0x6>
 130:	0018                	.2byte	0x18
 132:	1300                	add	s0,sp,416
 134:	012e                	sll	sp,sp,0xb
 136:	0e03193f 0b3b0b3a 	.8byte	0xb3b0b3a0e03193f
 13e:	0b39                	add	s6,s6,14
 140:	01111927          	.4byte	0x1111927
 144:	0712                	sll	a4,a4,0x4
 146:	1840                	add	s0,sp,52
 148:	197a                	sll	s2,s2,0x3e
 14a:	1301                	add	t1,t1,-32
 14c:	0000                	unimp
 14e:	2e14                	fld	fa3,24(a2)
 150:	3f01                	addw	t5,t5,-32
 152:	0319                	add	t1,t1,6
 154:	3a0e                	fld	fs4,224(sp)
 156:	390b3b0b          	.4byte	0x390b3b0b
 15a:	1113490b          	.4byte	0x1113490b
 15e:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LFE14+0xfffffffffffffd04>
 160:	7c184007          	.4byte	0x7c184007
 164:	0119                	add	sp,sp,6
 166:	15000013          	li	zero,336
 16a:	012e                	sll	sp,sp,0xb
 16c:	0b3a0e03          	lb	t3,179(s4)
 170:	0b390b3b          	.4byte	0xb390b3b
 174:	1349                	add	t1,t1,-14
 176:	0111                	add	sp,sp,4
 178:	0712                	sll	a4,a4,0x4
 17a:	1840                	add	s0,sp,52
 17c:	197c                	add	a5,sp,188
 17e:	1301                	add	t1,t1,-32
 180:	0000                	unimp
 182:	2e16                	fld	ft8,320(sp)
 184:	0301                	add	t1,t1,0
 186:	3a0e                	fld	fs4,224(sp)
 188:	390b3b0b          	.4byte	0x390b3b0b
 18c:	1119270b          	.4byte	0x1119270b
 190:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LFE14+0xfffffffffffffd04>
 192:	7a184007          	.4byte	0x7a184007
 196:	0119                	add	sp,sp,6
 198:	17000013          	li	zero,368
 19c:	0005                	c.nop	1
 19e:	0b3a0803          	lb	a6,179(s4)
 1a2:	0b390b3b          	.4byte	0xb390b3b
 1a6:	1349                	add	t1,t1,-14
 1a8:	1802                	sll	a6,a6,0x20
 1aa:	0000                	unimp
 1ac:	2e18                	fld	fa4,24(a2)
 1ae:	0301                	add	t1,t1,0
 1b0:	3a0e                	fld	fs4,224(sp)
 1b2:	390b3b0b          	.4byte	0x390b3b0b
 1b6:	1113490b          	.4byte	0x1113490b
 1ba:	1201                	add	tp,tp,-32 # ffffffffffffffe0 <.LFE14+0xfffffffffffffd04>
 1bc:	7a184007          	.4byte	0x7a184007
 1c0:	0119                	add	sp,sp,6
 1c2:	19000013          	li	zero,400
 1c6:	012e                	sll	sp,sp,0xb
 1c8:	0b3a0e03          	lb	t3,179(s4)
 1cc:	0b390b3b          	.4byte	0xb390b3b
 1d0:	1349                	add	t1,t1,-14
 1d2:	0111                	add	sp,sp,4
 1d4:	0712                	sll	a4,a4,0x4
 1d6:	1840                	add	s0,sp,52
 1d8:	197a                	sll	s2,s2,0x3e
 1da:	0000                	unimp
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
   0:	035e                	sll	t1,t1,0x17
   2:	0000                	unimp
   4:	0005                	c.nop	1
   6:	0008                	.2byte	0x8
   8:	004e                	c.slli	zero,0x13
   a:	0000                	unimp
   c:	0101                	add	sp,sp,0
   e:	fb01                	bnez	a4,ffffffffffffff1e <.LFE14+0xfffffffffffffc42>
  10:	0d0e                	sll	s10,s10,0x3
  12:	0100                	add	s0,sp,128
  14:	0101                	add	sp,sp,0
  16:	0001                	nop
  18:	0000                	unimp
  1a:	0001                	nop
  1c:	0100                	add	s0,sp,128
  1e:	0101                	add	sp,sp,0
  20:	051f 0000 0000      	.byte	0x1f, 0x05, 0x00, 0x00, 0x00, 0x00
	...
  36:	0102                	c.slli64	sp
  38:	021f 060f 0000      	.byte	0x1f, 0x02, 0x0f, 0x06, 0x00, 0x00
  3e:	0000                	unimp
  40:	0001                	nop
  42:	0000                	unimp
  44:	0200                	add	s0,sp,256
  46:	0000                	unimp
  48:	0000                	unimp
  4a:	00000003          	lb	zero,0(zero) # 0 <.Ldebug_line0>
  4e:	0100                	add	s0,sp,128
  50:	0000                	unimp
  52:	0000                	unimp
  54:	0002                	c.slli64	zero
  56:	0000                	unimp
  58:	0400                	add	s0,sp,512
  5a:	0105                	add	sp,sp,1
  5c:	0900                	add	s0,sp,144
  5e:	0002                	c.slli64	zero
  60:	0000                	unimp
  62:	0000                	unimp
  64:	0000                	unimp
  66:	0300                	add	s0,sp,384
  68:	0109                	add	sp,sp,2
  6a:	0305                	add	t1,t1,1
  6c:	00090203          	lb	tp,0(s2) # 8000 <.LFE14+0x7d24>
  70:	0100                	add	s0,sp,128
  72:	0a05                	add	s4,s4,1
  74:	00090103          	lb	sp,0(s2)
  78:	0100                	add	s0,sp,128
  7a:	0105                	add	sp,sp,1
  7c:	00090103          	lb	sp,0(s2)
  80:	0100                	add	s0,sp,128
  82:	00090b03          	lb	s6,0(s2)
  86:	0100                	add	s0,sp,128
  88:	0305                	add	t1,t1,1
  8a:	00090203          	lb	tp,0(s2)
  8e:	0100                	add	s0,sp,128
  90:	0a05                	add	s4,s4,1
  92:	00090103          	lb	sp,0(s2)
  96:	0100                	add	s0,sp,128
  98:	0105                	add	sp,sp,1
  9a:	00090103          	lb	sp,0(s2)
  9e:	0100                	add	s0,sp,128
  a0:	00090303          	lb	t1,0(s2)
  a4:	0100                	add	s0,sp,128
  a6:	0305                	add	t1,t1,1
  a8:	00090103          	lb	sp,0(s2)
  ac:	0100                	add	s0,sp,128
  ae:	0105                	add	sp,sp,1
  b0:	00090103          	lb	sp,0(s2)
  b4:	0100                	add	s0,sp,128
  b6:	00090803          	lb	a6,0(s2)
  ba:	0100                	add	s0,sp,128
  bc:	1005                	c.nop	-31
  be:	00090103          	lb	sp,0(s2)
  c2:	0100                	add	s0,sp,128
  c4:	0d05                	add	s10,s10,1
  c6:	00090103          	lb	sp,0(s2)
  ca:	0100                	add	s0,sp,128
  cc:	1c05                	add	s8,s8,-31
  ce:	00090003          	lb	zero,0(s2)
  d2:	0100                	add	s0,sp,128
  d4:	0105                	add	sp,sp,1
  d6:	00090103          	lb	sp,0(s2)
  da:	0100                	add	s0,sp,128
  dc:	00091003          	lh	zero,0(s2)
  e0:	0100                	add	s0,sp,128
  e2:	0d05                	add	s10,s10,1
  e4:	00090103          	lb	sp,0(s2)
  e8:	0100                	add	s0,sp,128
  ea:	0305                	add	t1,t1,1
  ec:	00090003          	lb	zero,0(s2)
  f0:	0100                	add	s0,sp,128
  f2:	0105                	add	sp,sp,1
  f4:	00090103          	lb	sp,0(s2)
  f8:	0100                	add	s0,sp,128
  fa:	00090703          	lb	a4,0(s2)
  fe:	0100                	add	s0,sp,128
 100:	0d05                	add	s10,s10,1
 102:	00090103          	lb	sp,0(s2)
 106:	0100                	add	s0,sp,128
 108:	0305                	add	t1,t1,1
 10a:	00090003          	lb	zero,0(s2)
 10e:	0100                	add	s0,sp,128
 110:	0105                	add	sp,sp,1
 112:	00090103          	lb	sp,0(s2)
 116:	0100                	add	s0,sp,128
 118:	0204                	add	s1,sp,256
 11a:	00095e03          	lhu	t3,0(s2)
 11e:	0100                	add	s0,sp,128
 120:	0c05                	add	s8,s8,1
 122:	00090103          	lb	sp,0(s2)
 126:	0100                	add	s0,sp,128
 128:	0705                	add	a4,a4,1
 12a:	00090003          	lb	zero,0(s2)
 12e:	0100                	add	s0,sp,128
 130:	0a05                	add	s4,s4,1
 132:	00090103          	lb	sp,0(s2)
 136:	0100                	add	s0,sp,128
 138:	0105                	add	sp,sp,1
 13a:	00090103          	lb	sp,0(s2)
 13e:	0100                	add	s0,sp,128
 140:	00090303          	lb	t1,0(s2)
 144:	0100                	add	s0,sp,128
 146:	0c05                	add	s8,s8,1
 148:	00090103          	lb	sp,0(s2)
 14c:	0100                	add	s0,sp,128
 14e:	0f05                	add	t5,t5,1
 150:	00090103          	lb	sp,0(s2)
 154:	0100                	add	s0,sp,128
 156:	0a05                	add	s4,s4,1
 158:	00090103          	lb	sp,0(s2)
 15c:	0100                	add	s0,sp,128
 15e:	0105                	add	sp,sp,1
 160:	00090103          	lb	sp,0(s2)
 164:	0100                	add	s0,sp,128
 166:	0304                	add	s1,sp,384
 168:	00095503          	lhu	a0,0(s2)
 16c:	0100                	add	s0,sp,128
 16e:	0f05                	add	t5,t5,1
 170:	00090103          	lb	sp,0(s2)
 174:	0100                	add	s0,sp,128
 176:	1205                	add	tp,tp,-31 # ffffffffffffffe1 <.LFE14+0xfffffffffffffd05>
 178:	00090103          	lb	sp,0(s2)
 17c:	0100                	add	s0,sp,128
 17e:	1005                	c.nop	-31
 180:	00090103          	lb	sp,0(s2)
 184:	0100                	add	s0,sp,128
 186:	0105                	add	sp,sp,1
 188:	00090103          	lb	sp,0(s2)
 18c:	0100                	add	s0,sp,128
 18e:	2505                	addw	a0,a0,1
 190:	00090203          	lb	tp,0(s2)
 194:	0100                	add	s0,sp,128
 196:	0505                	add	a0,a0,1
 198:	00090103          	lb	sp,0(s2)
 19c:	0100                	add	s0,sp,128
 19e:	0905                	add	s2,s2,1
 1a0:	00090103          	lb	sp,0(s2)
 1a4:	0100                	add	s0,sp,128
 1a6:	0b05                	add	s6,s6,1
 1a8:	00090903          	lb	s2,0(s2)
 1ac:	0100                	add	s0,sp,128
 1ae:	2505                	addw	a0,a0,1
 1b0:	0200                	add	s0,sp,256
 1b2:	0104                	add	s1,sp,128
 1b4:	00090003          	lb	zero,0(s2)
 1b8:	0100                	add	s0,sp,128
 1ba:	0c05                	add	s8,s8,1
 1bc:	0200                	add	s0,sp,256
 1be:	0104                	add	s1,sp,128
 1c0:	00090003          	lb	zero,0(s2)
 1c4:	0100                	add	s0,sp,128
 1c6:	3705                	addw	a4,a4,-31
 1c8:	0200                	add	s0,sp,256
 1ca:	0104                	add	s1,sp,128
 1cc:	00090003          	lb	zero,0(s2)
 1d0:	0100                	add	s0,sp,128
 1d2:	0505                	add	a0,a0,1
 1d4:	00090303          	lb	t1,0(s2)
 1d8:	0100                	add	s0,sp,128
 1da:	1105                	add	sp,sp,-31
 1dc:	00090203          	lb	tp,0(s2)
 1e0:	0100                	add	s0,sp,128
 1e2:	0f05                	add	t5,t5,1
 1e4:	00090003          	lb	zero,0(s2)
 1e8:	0100                	add	s0,sp,128
 1ea:	0105                	add	sp,sp,1
 1ec:	00090103          	lb	sp,0(s2)
 1f0:	0100                	add	s0,sp,128
 1f2:	2505                	addw	a0,a0,1
 1f4:	00090303          	lb	t1,0(s2)
 1f8:	0100                	add	s0,sp,128
 1fa:	0a05                	add	s4,s4,1
 1fc:	00090103          	lb	sp,0(s2)
 200:	0100                	add	s0,sp,128
 202:	0f05                	add	t5,t5,1
 204:	00090403          	lb	s0,0(s2)
 208:	0100                	add	s0,sp,128
 20a:	0505                	add	a0,a0,1
 20c:	00090303          	lb	t1,0(s2)
 210:	0100                	add	s0,sp,128
 212:	1905                	add	s2,s2,-31
 214:	00090203          	lb	tp,0(s2)
 218:	0100                	add	s0,sp,128
 21a:	0505                	add	a0,a0,1
 21c:	00090003          	lb	zero,0(s2)
 220:	0100                	add	s0,sp,128
 222:	00090203          	lb	tp,0(s2)
 226:	0100                	add	s0,sp,128
 228:	0105                	add	sp,sp,1
 22a:	00090103          	lb	sp,0(s2)
 22e:	0100                	add	s0,sp,128
 230:	2405                	addw	s0,s0,1 # 1a001 <.LFE14+0x19d25>
 232:	00090303          	lb	t1,0(s2)
 236:	0100                	add	s0,sp,128
 238:	1305                	add	t1,t1,-31
 23a:	00090203          	lb	tp,0(s2)
 23e:	0100                	add	s0,sp,128
 240:	1c05                	add	s8,s8,-31
 242:	00090003          	lb	zero,0(s2)
 246:	0100                	add	s0,sp,128
 248:	2305                	addw	t1,t1,1
 24a:	0200                	add	s0,sp,256
 24c:	0104                	add	s1,sp,128
 24e:	00090003          	lb	zero,0(s2)
 252:	0100                	add	s0,sp,128
 254:	2c05                	addw	s8,s8,1
 256:	0200                	add	s0,sp,256
 258:	0104                	add	s1,sp,128
 25a:	00090003          	lb	zero,0(s2)
 25e:	0100                	add	s0,sp,128
 260:	1c05                	add	s8,s8,-31
 262:	0200                	add	s0,sp,256
 264:	0104                	add	s1,sp,128
 266:	00090003          	lb	zero,0(s2)
 26a:	0100                	add	s0,sp,128
 26c:	0200                	add	s0,sp,256
 26e:	0304                	add	s1,sp,384
 270:	0306                	sll	t1,t1,0x1
 272:	0900                	add	s0,sp,144
 274:	0000                	unimp
 276:	0001                	nop
 278:	0402                	c.slli64	s0
 27a:	0304                	add	s1,sp,384
 27c:	0900                	add	s0,sp,144
 27e:	0000                	unimp
 280:	0501                	add	a0,a0,0
 282:	000c                	.2byte	0xc
 284:	0402                	c.slli64	s0
 286:	0606                	sll	a2,a2,0x1
 288:	00090003          	lb	zero,0(s2)
 28c:	0100                	add	s0,sp,128
 28e:	0200                	add	s0,sp,256
 290:	0604                	add	s1,sp,768
 292:	00090103          	lb	sp,0(s2)
 296:	0100                	add	s0,sp,128
 298:	0105                	add	sp,sp,1
 29a:	0200                	add	s0,sp,256
 29c:	0604                	add	s1,sp,768
 29e:	00090103          	lb	sp,0(s2)
 2a2:	0100                	add	s0,sp,128
 2a4:	1505                	add	a0,a0,-31
 2a6:	00090203          	lb	tp,0(s2)
 2aa:	0100                	add	s0,sp,128
 2ac:	0f05                	add	t5,t5,1
 2ae:	00090103          	lb	sp,0(s2)
 2b2:	0100                	add	s0,sp,128
 2b4:	0505                	add	a0,a0,1
 2b6:	00090103          	lb	sp,0(s2)
 2ba:	0100                	add	s0,sp,128
 2bc:	0905                	add	s2,s2,1
 2be:	00090103          	lb	sp,0(s2)
 2c2:	0100                	add	s0,sp,128
 2c4:	1005                	c.nop	-31
 2c6:	00090003          	lb	zero,0(s2)
 2ca:	0100                	add	s0,sp,128
 2cc:	0805                	add	a6,a6,1 # 10073ed <.LFE14+0x1007111>
 2ce:	00090003          	lb	zero,0(s2)
 2d2:	0100                	add	s0,sp,128
 2d4:	0905                	add	s2,s2,1
 2d6:	00090203          	lb	tp,0(s2)
 2da:	0100                	add	s0,sp,128
 2dc:	1905                	add	s2,s2,-31
 2de:	00090003          	lb	zero,0(s2)
 2e2:	0100                	add	s0,sp,128
 2e4:	0505                	add	a0,a0,1
 2e6:	00090203          	lb	tp,0(s2)
 2ea:	0100                	add	s0,sp,128
 2ec:	0c05                	add	s8,s8,1
 2ee:	00090003          	lb	zero,0(s2)
 2f2:	0100                	add	s0,sp,128
 2f4:	1305                	add	t1,t1,-31
 2f6:	00090003          	lb	zero,0(s2)
 2fa:	0100                	add	s0,sp,128
 2fc:	0105                	add	sp,sp,1
 2fe:	00090103          	lb	sp,0(s2)
 302:	0100                	add	s0,sp,128
 304:	1405                	add	s0,s0,-31
 306:	00090203          	lb	tp,0(s2)
 30a:	0100                	add	s0,sp,128
 30c:	1b05                	add	s6,s6,-31
 30e:	00090103          	lb	sp,0(s2)
 312:	0100                	add	s0,sp,128
 314:	0905                	add	s2,s2,1
 316:	00090103          	lb	sp,0(s2)
 31a:	0100                	add	s0,sp,128
 31c:	0c05                	add	s8,s8,1
 31e:	00090a03          	lb	s4,0(s2)
 322:	0100                	add	s0,sp,128
 324:	1305                	add	t1,t1,-31
 326:	00090003          	lb	zero,0(s2)
 32a:	0100                	add	s0,sp,128
 32c:	0805                	add	a6,a6,1
 32e:	00090103          	lb	sp,0(s2)
 332:	0100                	add	s0,sp,128
 334:	2005                	.2byte	0x2005
 336:	0200                	add	s0,sp,256
 338:	0104                	add	s1,sp,128
 33a:	00090003          	lb	zero,0(s2)
 33e:	0100                	add	s0,sp,128
 340:	1605                	add	a2,a2,-31
 342:	0200                	add	s0,sp,256
 344:	0104                	add	s1,sp,128
 346:	00090003          	lb	zero,0(s2)
 34a:	0100                	add	s0,sp,128
 34c:	0905                	add	s2,s2,1
 34e:	00090203          	lb	tp,0(s2)
 352:	0100                	add	s0,sp,128
 354:	0105                	add	sp,sp,1
 356:	00090403          	lb	s0,0(s2)
 35a:	0100                	add	s0,sp,128
 35c:	0009                	c.nop	2
 35e:	0000                	unimp
 360:	0101                	add	sp,sp,0

Disassembly of section .debug_str:

0000000000000000 <.LASF36>:
   0:	6572                	ld	a0,280(sp)
   2:	6461                	lui	s0,0x18
   4:	6d5f 6168 7472      	.byte	0x5f, 0x6d, 0x68, 0x61, 0x72, 0x74
   a:	6469                	lui	s0,0x1a
	...

000000000000000d <.LASF29>:
   d:	6e69                	lui	t3,0x1a
   f:	7274                	ld	a3,224(a2)
  11:	6f5f 006e       	.byte	0x5f, 0x6f, 0x6e, 0x00, 0x77, 0x5f

0000000000000015 <.LASF32>:
  15:	73735f77          	.4byte	0x73735f77
  19:	6174                	ld	a3,192(a0)
  1b:	7574                	ld	a3,232(a0)
  1d:	          	.4byte	0x6e690073

000000000000001f <.LASF30>:
  1f:	6e69                	lui	t3,0x1a
  21:	7274                	ld	a3,224(a2)
  23:	6f5f 6666       	.byte	0x5f, 0x6f, 0x66, 0x66, 0x00, 0x72

0000000000000028 <.LASF33>:
  28:	5f72                	lw	t5,60(sp)
  2a:	61747373          	csrrc	t1,0x617,8
  2e:	7574                	ld	a3,232(a0)
  30:	          	.4byte	0x6e690073

0000000000000032 <.LASF25>:
  32:	6e69                	lui	t3,0x1a
  34:	7469                	lui	s0,0xffffa
  36:	6c5f 636f 006b      	.byte	0x5f, 0x6c, 0x6f, 0x63, 0x6b, 0x00

000000000000003c <.LASF15>:
  3c:	6e697073          	csrc	0x6e6,18
  40:	6f6c                	ld	a1,216(a4)
  42:	          	bltu	zero,a6,798 <.LFE14+0x4bc>

0000000000000045 <.LASF9>:
  45:	6975                	lui	s2,0x1d
  47:	746e                	ld	s0,248(sp)
  49:	3436                	fld	fs0,360(sp)
  4b:	745f        	.byte	0x5f, 0x74, 0x00, 0x68, 0x6f, 0x6c

000000000000004e <.LASF26>:
  4e:	6f68                	ld	a0,216(a4)
  50:	646c                	ld	a1,200(s0)
  52:	6e69                	lui	t3,0x1a
  54:	          	jr	1782(s8)

0000000000000056 <.LASF10>:
  56:	6f6c                	ld	a1,216(a4)
  58:	676e                	ld	a4,216(sp)
  5a:	6c20                	ld	s0,88(s0)
  5c:	20676e6f          	jal	t3,76262 <.LFE14+0x75f86>
  60:	6e75                	lui	t3,0x1d
  62:	6e676973          	csrrs	s2,0x6e6,14
  66:	6465                	lui	s0,0x19
  68:	6920                	ld	s0,80(a0)
  6a:	746e                	ld	s0,248(sp)
	...

000000000000006d <.LASF5>:
  6d:	6e75                	lui	t3,0x1d
  6f:	6e676973          	csrrs	s2,0x6e6,14
  73:	6465                	lui	s0,0x19
  75:	6320                	ld	s0,64(a4)
  77:	6168                	ld	a0,192(a0)
  79:	0072                	c.slli	zero,0x1c

000000000000007b <.LASF14>:
  7b:	6f6c                	ld	a1,216(a4)
  7d:	676e                	ld	a4,216(sp)
  7f:	7520                	ld	s0,104(a0)
  81:	736e                	ld	t1,248(sp)
  83:	6769                	lui	a4,0x1a
  85:	656e                	ld	a0,216(sp)
  87:	2064                	fld	fs1,192(s0)
  89:	6e69                	lui	t3,0x1a
  8b:	0074                	add	a3,sp,12

000000000000008d <.LASF6>:
  8d:	726f6873          	csrrs	a6,mhpmevent6h,30
  91:	2074                	fld	fa3,192(s0)
  93:	6e75                	lui	t3,0x1d
  95:	6e676973          	csrrs	s2,0x6e6,14
  99:	6465                	lui	s0,0x19
  9b:	6920                	ld	s0,80(a0)
  9d:	746e                	ld	s0,248(sp)
	...

00000000000000a0 <.LASF24>:
  a0:	6361                	lui	t1,0x18
  a2:	7571                	lui	a0,0xffffc
  a4:	7269                	lui	tp,0xffffa
  a6:	0065                	c.nop	25

00000000000000a8 <.LASF16>:
  a8:	6f6c                	ld	a1,216(a4)
  aa:	64656b63          	bltu	a0,t1,700 <.LFE14+0x424>
	...

00000000000000af <.LASF13>:
  af:	6e69                	lui	t3,0x1a
  b1:	6574                	ld	a3,200(a0)
  b3:	616e                	ld	sp,216(sp)
	...

00000000000000b6 <.LASF28>:
  b6:	69757063          	bgeu	a0,s7,736 <.LFE14+0x45a>
  ba:	0064                	add	s1,sp,12

00000000000000bc <.LASF34>:
  bc:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
  c0:	20373143          	fmadd.s	ft2,fa4,ft3,ft4,rup
  c4:	3231                	addw	tp,tp,-20 # ffffffffffff9fec <.LFE14+0xffffffffffff9d10>
  c6:	322e                	fld	ft4,232(sp)
  c8:	302e                	fld	ft0,232(sp)
  ca:	2d20                	fld	fs0,88(a0)
  cc:	6e6d                	lui	t3,0x1b
  ce:	65722d6f          	jal	s10,22f24 <.LFE14+0x22c48>
  d2:	616c                	ld	a1,192(a0)
  d4:	2078                	fld	fa4,192(s0)
  d6:	6d2d                	lui	s10,0xb
  d8:	7574                	ld	a3,232(a0)
  da:	656e                	ld	a0,216(sp)
  dc:	723d                	lui	tp,0xfffef
  de:	656b636f          	jal	t1,b6734 <.LFE14+0xb6458>
  e2:	2074                	fld	fa3,192(s0)
  e4:	6d2d                	lui	s10,0xb
  e6:	6261                	lui	tp,0x18
  e8:	3d69                	addw	s10,s10,-6 # affa <.LFE14+0xad1e>
  ea:	706c                	ld	a1,224(s0)
  ec:	3436                	fld	fs0,360(sp)
  ee:	2064                	fld	fs1,192(s0)
  f0:	6d2d                	lui	s10,0xb
  f2:	7369                	lui	t1,0xffffa
  f4:	2d61                	addw	s10,s10,24 # b018 <.LFE14+0xad3c>
  f6:	63657073          	csrc	0x636,10
  fa:	323d                	addw	tp,tp,-17 # 17fef <.LFE14+0x17d13>
  fc:	322e                	fld	ft4,232(sp)
  fe:	2d20                	fld	fs0,88(a0)
 100:	616d                	add	sp,sp,240
 102:	6372                	ld	t1,280(sp)
 104:	3d68                	fld	fa0,248(a0)
 106:	7672                	ld	a2,312(sp)
 108:	3436                	fld	fs0,360(sp)
 10a:	6d69                	lui	s10,0x1a
 10c:	6661                	lui	a2,0x18
 10e:	6364                	ld	s1,192(a4)
 110:	2d20                	fld	fs0,88(a0)
 112:	62646767          	.4byte	0x62646767
 116:	2d20                	fld	fs0,88(a0)
 118:	6666                	ld	a2,88(sp)
 11a:	6572                	ld	a0,280(sp)
 11c:	7365                	lui	t1,0xffff9
 11e:	6174                	ld	a3,192(a0)
 120:	646e                	ld	s0,216(sp)
 122:	6e69                	lui	t3,0x1a
 124:	662d2067          	.4byte	0x662d2067
 128:	6f6e                	ld	t5,216(sp)
 12a:	632d                	lui	t1,0xb
 12c:	6f6d6d6f          	jal	s10,d6822 <.LFE14+0xd6546>
 130:	006e                	c.slli	zero,0x1b

0000000000000132 <.LASF7>:
 132:	6e75                	lui	t3,0x1d
 134:	6e676973          	csrrs	s2,0x6e6,14
 138:	6465                	lui	s0,0x19
 13a:	6920                	ld	s0,80(a0)
 13c:	746e                	ld	s0,248(sp)
	...

000000000000013f <.LASF2>:
 13f:	72616863          	bltu	sp,t1,86f <.LFE14+0x593>
	...

0000000000000144 <.LASF21>:
 144:	6572                	ld	a0,280(sp)
 146:	746c7573          	csrrc	a0,0x746,24
	...

000000000000014b <.LASF27>:
 14b:	796d                	lui	s2,0xffffb
 14d:	00757063          	bgeu	a0,t2,14d <.LASF27+0x2>

0000000000000151 <.LASF19>:
 151:	7570                	ld	a2,232(a0)
 153:	6f5f6873          	csrrs	a6,0x6f5,30
 157:	6666                	ld	a2,88(sp)
	...

000000000000015a <.LASF18>:
 15a:	6f70                	ld	a2,216(a4)
 15c:	5f70                	lw	a2,124(a4)
 15e:	0066666f          	jal	a2,66164 <.LFE14+0x65e88>

0000000000000162 <.LASF11>:
 162:	746e6f63          	bltu	t3,t1,8c0 <.LFE14+0x5e4>
 166:	7865                	lui	a6,0xffff9
 168:	0074                	add	a3,sp,12

000000000000016a <.LASF17>:
 16a:	616e                	ld	sp,216(sp)
 16c:	656d                	lui	a0,0x1b
	...

000000000000016f <.LASF3>:
 16f:	726f6873          	csrrs	a6,mhpmevent6h,30
 173:	2074                	fld	fa3,192(s0)
 175:	6e69                	lui	t3,0x1a
 177:	0074                	add	a3,sp,12

0000000000000179 <.LASF31>:
 179:	6e69                	lui	t3,0x1a
 17b:	7274                	ld	a3,224(a2)
 17d:	675f 7465       	.byte	0x5f, 0x67, 0x65, 0x74, 0x00, 0x75

0000000000000182 <.LASF8>:
 182:	6975                	lui	s2,0x1d
 184:	746e                	ld	s0,248(sp)
 186:	745f3233          	.4byte	0x745f3233
	...

000000000000018b <.LASF4>:
 18b:	6f6c                	ld	a1,216(a4)
 18d:	676e                	ld	a4,216(sp)
 18f:	6920                	ld	s0,80(a0)
 191:	746e                	ld	s0,248(sp)
	...

0000000000000194 <.LASF12>:
 194:	6f6e                	ld	t5,216(sp)
 196:	6666                	ld	a2,88(sp)
	...

0000000000000199 <.LASF35>:
 199:	73757063          	bgeu	a0,s7,8b9 <.LFE14+0x5dd>
	...

000000000000019e <.LASF23>:
 19e:	6f6c                	ld	a1,216(a4)
 1a0:	          	bltu	zero,a6,7d6 <.LFE14+0x4fa>

00000000000001a3 <.LASF20>:
 1a3:	5f757063          	bgeu	a0,s7,783 <.LFE14+0x4a7>
 1a7:	7470                	ld	a2,232(s0)
 1a9:	0072                	c.slli	zero,0x1c

00000000000001ab <.LASF22>:
 1ab:	6572                	ld	a0,280(sp)
 1ad:	656c                	ld	a1,200(a0)
 1af:	7361                	lui	t1,0xffff8
 1b1:	0065                	c.nop	25

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
  14:	4f2f736f          	jal	t1,f7506 <.LFE14+0xf722a>
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
  2e:	4f2f736f          	jal	t1,f7520 <.LFE14+0xf7244>
  32:	656b2f53          	.4byte	0x656b2f53
  36:	6e72                	ld	t3,280(sp)
  38:	6c65                	lui	s8,0x19
  3a:	636f6c2f          	.4byte	0x636f6c2f
  3e:	70732f6b          	.4byte	0x70732f6b
  42:	6e69                	lui	t3,0x1a
  44:	6f6c                	ld	a1,216(a4)
  46:	632e6b63          	bltu	t3,s2,67c <.LFE14+0x3a0>
  4a:	2f00                	fld	fs0,24(a4)
  4c:	6f68                	ld	a0,216(a4)
  4e:	656d                	lui	a0,0x1b
  50:	71696c2f          	.4byte	0x71696c2f
  54:	6975                	lui	s2,0x1d
  56:	2f64                	fld	fs1,216(a4)
  58:	6d696c67          	.4byte	0x6d696c67
  5c:	656d                	lui	a0,0x1b
  5e:	6f72                	ld	t5,280(sp)
  60:	534f2f73          	csrrs	t5,0x534,t5
  64:	2f00                	fld	fs0,24(a4)
  66:	6f68                	ld	a0,216(a4)
  68:	656d                	lui	a0,0x1b
  6a:	71696c2f          	.4byte	0x71696c2f
  6e:	6975                	lui	s2,0x1d
  70:	2f64                	fld	fs1,216(a4)
  72:	6d696c67          	.4byte	0x6d696c67
  76:	656d                	lui	a0,0x1b
  78:	6f72                	ld	t5,280(sp)
  7a:	534f2f73          	csrrs	t5,0x534,t5
  7e:	72656b2f          	.4byte	0x72656b2f
  82:	656e                	ld	a0,216(sp)
  84:	2f6c                	fld	fa1,216(a4)
  86:	6f6c                	ld	a1,216(a4)
  88:	2f006b63          	bltu	zero,a6,37e <.LFE14+0xa2>
  8c:	6f68                	ld	a0,216(a4)
  8e:	656d                	lui	a0,0x1b
  90:	71696c2f          	.4byte	0x71696c2f
  94:	6975                	lui	s2,0x1d
  96:	2f64                	fld	fs1,216(a4)
  98:	6d696c67          	.4byte	0x6d696c67
  9c:	656d                	lui	a0,0x1b
  9e:	6f72                	ld	t5,280(sp)
  a0:	534f2f73          	csrrs	t5,0x534,t5
  a4:	636e692f          	.4byte	0x636e692f
  a8:	756c                	ld	a1,232(a0)
  aa:	6564                	ld	s1,200(a0)
  ac:	2f00                	fld	fs0,24(a4)
  ae:	6f68                	ld	a0,216(a4)
  b0:	656d                	lui	a0,0x1b
  b2:	71696c2f          	.4byte	0x71696c2f
  b6:	6975                	lui	s2,0x1d
  b8:	2f64                	fld	fs1,216(a4)
  ba:	6d696c67          	.4byte	0x6d696c67
  be:	656d                	lui	a0,0x1b
  c0:	6f72                	ld	t5,280(sp)
  c2:	534f2f73          	csrrs	t5,0x534,t5
  c6:	636e692f          	.4byte	0x636e692f
  ca:	756c                	ld	a1,232(a0)
  cc:	6564                	ld	s1,200(a0)
  ce:	6f72702f          	.4byte	0x6f72702f
  d2:	73736563          	bltu	t1,s7,7fc <.LFE14+0x520>
  d6:	2f00                	fld	fs0,24(a4)
  d8:	6f68                	ld	a0,216(a4)
  da:	656d                	lui	a0,0x1b
  dc:	71696c2f          	.4byte	0x71696c2f
  e0:	6975                	lui	s2,0x1d
  e2:	2f64                	fld	fs1,216(a4)
  e4:	6d696c67          	.4byte	0x6d696c67
  e8:	656d                	lui	a0,0x1b
  ea:	6f72                	ld	t5,280(sp)
  ec:	534f2f73          	csrrs	t5,0x534,t5
  f0:	636e692f          	.4byte	0x636e692f
  f4:	756c                	ld	a1,232(a0)
  f6:	6564                	ld	s1,200(a0)
  f8:	636f6c2f          	.4byte	0x636f6c2f
  fc:	7073006b          	.4byte	0x7073006b
 100:	6e69                	lui	t3,0x1a
 102:	6f6c                	ld	a1,216(a4)
 104:	632e6b63          	bltu	t3,s2,73a <.LFE14+0x45e>
 108:	7200                	ld	s0,32(a2)
 10a:	7369                	lui	t1,0xffffa
 10c:	34367663          	bgeu	a2,gp,458 <.LFE14+0x17c>
 110:	682e                	ld	a6,200(sp)
 112:	6300                	ld	s0,0(a4)
 114:	7570                	ld	a2,232(a0)
 116:	682e                	ld	a6,200(sp)
 118:	7300                	ld	s0,32(a4)
 11a:	6970                	ld	a2,208(a0)
 11c:	6c6e                	ld	s8,216(sp)
 11e:	2e6b636f          	jal	t1,b6404 <.LFE14+0xb6128>
 122:	74730063          	beq	t1,t2,862 <.LFE14+0x586>
 126:	6964                	ld	s1,208(a0)
 128:	746e                	ld	s0,248(sp)
 12a:	682e                	ld	a6,200(sp)
 12c:	7300                	ld	s0,32(a4)
 12e:	6970                	ld	a2,208(a0)
 130:	6c6e                	ld	s8,216(sp)
 132:	2e6b636f          	jal	t1,b6418 <.LFE14+0xb613c>
 136:	0068                	add	a0,sp,12

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	4700                	lw	s0,8(a4)
   2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
   6:	6728                	ld	a0,72(a4)
   8:	6532                	ld	a0,264(sp)
   a:	3565                	addw	a0,a0,-7 # 1aff9 <.LFE14+0x1ad1d>
   c:	3465                	addw	s0,s0,-7 # 19ff9 <.LFE14+0x19d1d>
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
   c:	0d01                	add	s10,s10,0 # 1b000 <.LFE14+0x1ad24>
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
  5a:	4220                	lw	s0,64(a2)
  5c:	0288                	add	a0,sp,320
  5e:	0c42                	sll	s8,s8,0x10
  60:	0008                	.2byte	0x8
  62:	c850                	sw	a2,20(s0)
  64:	020c                	add	a1,sp,256
  66:	4220                	lw	s0,64(a2)
  68:	000e                	c.slli	zero,0x3
  6a:	0000                	unimp
  6c:	0000                	unimp
  6e:	0000                	unimp
  70:	002c                	add	a1,sp,8
	...
  86:	0000                	unimp
  88:	0e42                	sll	t3,t3,0x10
  8a:	4220                	lw	s0,64(a2)
  8c:	0288                	add	a0,sp,320
  8e:	0c42                	sll	s8,s8,0x10
  90:	0008                	.2byte	0x8
  92:	c850                	sw	a2,20(s0)
  94:	020c                	add	a1,sp,256
  96:	4220                	lw	s0,64(a2)
  98:	000e                	c.slli	zero,0x3
  9a:	0000                	unimp
  9c:	0000                	unimp
  9e:	0000                	unimp
  a0:	002c                	add	a1,sp,8
	...
  b6:	0000                	unimp
  b8:	0e42                	sll	t3,t3,0x10
  ba:	4420                	lw	s0,72(s0)
  bc:	0281                	add	t0,t0,0
  be:	0488                	add	a0,sp,576
  c0:	0c42                	sll	s8,s8,0x10
  c2:	0008                	.2byte	0x8
  c4:	c160                	sw	s0,68(a0)
  c6:	c842                	sw	a6,16(sp)
  c8:	020c                	add	a1,sp,256
  ca:	4220                	lw	s0,64(a2)
  cc:	000e                	c.slli	zero,0x3
  ce:	0000                	unimp
  d0:	002c                	add	a1,sp,8
	...
  e6:	0000                	unimp
  e8:	0e42                	sll	t3,t3,0x10
  ea:	4410                	lw	a2,8(s0)
  ec:	0281                	add	t0,t0,0
  ee:	0488                	add	a0,sp,576
  f0:	0c42                	sll	s8,s8,0x10
  f2:	0008                	.2byte	0x8
  f4:	c15a                	sw	s6,128(sp)
  f6:	c842                	sw	a6,16(sp)
  f8:	020c                	add	a1,sp,256
  fa:	4210                	lw	a2,0(a2)
  fc:	000e                	c.slli	zero,0x3
  fe:	0000                	unimp
 100:	002c                	add	a1,sp,8
	...
 116:	0000                	unimp
 118:	0e42                	sll	t3,t3,0x10
 11a:	4410                	lw	a2,8(s0)
 11c:	0281                	add	t0,t0,0
 11e:	0488                	add	a0,sp,576
 120:	0c42                	sll	s8,s8,0x10
 122:	0008                	.2byte	0x8
 124:	c15c                	sw	a5,4(a0)
 126:	c842                	sw	a6,16(sp)
 128:	020c                	add	a1,sp,256
 12a:	4210                	lw	a2,0(a2)
 12c:	000e                	c.slli	zero,0x3
 12e:	0000                	unimp
 130:	002c                	add	a1,sp,8
	...
 146:	0000                	unimp
 148:	0e42                	sll	t3,t3,0x10
 14a:	4420                	lw	s0,72(s0)
 14c:	0281                	add	t0,t0,0
 14e:	0488                	add	a0,sp,576
 150:	0c42                	sll	s8,s8,0x10
 152:	0008                	.2byte	0x8
 154:	c156                	sw	s5,128(sp)
 156:	c842                	sw	a6,16(sp)
 158:	020c                	add	a1,sp,256
 15a:	4220                	lw	s0,64(a2)
 15c:	000e                	c.slli	zero,0x3
 15e:	0000                	unimp
 160:	002c                	add	a1,sp,8
	...
 176:	0000                	unimp
 178:	0e42                	sll	t3,t3,0x10
 17a:	4420                	lw	s0,72(s0)
 17c:	0281                	add	t0,t0,0
 17e:	0488                	add	a0,sp,576
 180:	0c42                	sll	s8,s8,0x10
 182:	0008                	.2byte	0x8
 184:	c170                	sw	a2,68(a0)
 186:	c842                	sw	a6,16(sp)
 188:	020c                	add	a1,sp,256
 18a:	4220                	lw	s0,64(a2)
 18c:	000e                	c.slli	zero,0x3
 18e:	0000                	unimp
 190:	002c                	add	a1,sp,8
	...
 1a6:	0000                	unimp
 1a8:	0e42                	sll	t3,t3,0x10
 1aa:	4220                	lw	s0,64(a2)
 1ac:	0288                	add	a0,sp,320
 1ae:	0c42                	sll	s8,s8,0x10
 1b0:	0008                	.2byte	0x8
 1b2:	c866                	sw	s9,16(sp)
 1b4:	020c                	add	a1,sp,256
 1b6:	4220                	lw	s0,64(a2)
 1b8:	000e                	c.slli	zero,0x3
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	0000                	unimp
 1c0:	002c                	add	a1,sp,8
	...
 1d6:	0000                	unimp
 1d8:	0e42                	sll	t3,t3,0x10
 1da:	4420                	lw	s0,72(s0)
 1dc:	0281                	add	t0,t0,0
 1de:	0488                	add	a0,sp,576
 1e0:	0c42                	sll	s8,s8,0x10
 1e2:	0008                	.2byte	0x8
 1e4:	4202                	lw	tp,0(sp)
 1e6:	42c1                	li	t0,16
 1e8:	0cc8                	add	a0,sp,596
 1ea:	2002                	fld	ft0,0(sp)
 1ec:	0e42                	sll	t3,t3,0x10
 1ee:	0000                	unimp
 1f0:	002c                	add	a1,sp,8
	...
 206:	0000                	unimp
 208:	0e42                	sll	t3,t3,0x10
 20a:	4420                	lw	s0,72(s0)
 20c:	0281                	add	t0,t0,0
 20e:	0488                	add	a0,sp,576
 210:	0c42                	sll	s8,s8,0x10
 212:	0008                	.2byte	0x8
 214:	c174                	sw	a3,68(a0)
 216:	c842                	sw	a6,16(sp)
 218:	020c                	add	a1,sp,256
 21a:	4220                	lw	s0,64(a2)
 21c:	000e                	c.slli	zero,0x3
 21e:	0000                	unimp
 220:	0034                	add	a3,sp,8
	...
 236:	0000                	unimp
 238:	0e42                	sll	t3,t3,0x10
 23a:	4640                	lw	s0,12(a2)
 23c:	0281                	add	t0,t0,0
 23e:	0488                	add	a0,sp,576
 240:	0689                	add	a3,a3,2
 242:	0c42                	sll	s8,s8,0x10
 244:	0008                	.2byte	0x8
 246:	c172                	sw	t3,128(sp)
 248:	c842                	sw	a6,16(sp)
 24a:	020c                	add	a1,sp,256
 24c:	4240                	lw	s0,4(a2)
 24e:	42c9                	li	t0,18
 250:	000e                	c.slli	zero,0x3
 252:	0000                	unimp
 254:	0000                	unimp
 256:	0000                	unimp
 258:	002c                	add	a1,sp,8
	...
 26e:	0000                	unimp
 270:	0e42                	sll	t3,t3,0x10
 272:	4420                	lw	s0,72(s0)
 274:	0281                	add	t0,t0,0
 276:	0488                	add	a0,sp,576
 278:	0c42                	sll	s8,s8,0x10
 27a:	0008                	.2byte	0x8
 27c:	4a02                	lw	s4,0(sp)
 27e:	42c1                	li	t0,16
 280:	0cc8                	add	a0,sp,596
 282:	2002                	fld	ft0,0(sp)
 284:	0e42                	sll	t3,t3,0x10
 286:	0000                	unimp
 288:	002c                	add	a1,sp,8
	...
 29e:	0000                	unimp
 2a0:	0e42                	sll	t3,t3,0x10
 2a2:	4420                	lw	s0,72(s0)
 2a4:	0281                	add	t0,t0,0
 2a6:	0488                	add	a0,sp,576
 2a8:	0c42                	sll	s8,s8,0x10
 2aa:	0008                	.2byte	0x8
 2ac:	4002                	.2byte	0x4002
 2ae:	42c1                	li	t0,16
 2b0:	0cc8                	add	a0,sp,596
 2b2:	2002                	fld	ft0,0(sp)
 2b4:	0e42                	sll	t3,t3,0x10
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
  1c:	326d                	addw	tp,tp,-5 # fffffffffffe0ffb <.LFE14+0xfffffffffffe0d1f>
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
