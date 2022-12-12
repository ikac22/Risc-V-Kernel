
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	4f813103          	ld	sp,1272(sp) # 8000c4f8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7e5000ef          	jal	ra,80001000 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <start>:
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00813423          	sd	s0,8(sp)
    80001008:	01010413          	addi	s0,sp,16
    8000100c:	300027f3          	csrr	a5,mstatus
    80001010:	ffffe737          	lui	a4,0xffffe
    80001014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff0dcf>
    80001018:	00e7f7b3          	and	a5,a5,a4
    8000101c:	00001737          	lui	a4,0x1
    80001020:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001024:	00e7e7b3          	or	a5,a5,a4
    80001028:	30079073          	csrw	mstatus,a5
    8000102c:	00000797          	auipc	a5,0x0
    80001030:	16078793          	addi	a5,a5,352 # 8000118c <system_main>
    80001034:	34179073          	csrw	mepc,a5
    80001038:	00000793          	li	a5,0
    8000103c:	18079073          	csrw	satp,a5
    80001040:	000107b7          	lui	a5,0x10
    80001044:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001048:	30279073          	csrw	medeleg,a5
    8000104c:	30379073          	csrw	mideleg,a5
    80001050:	104027f3          	csrr	a5,sie
    80001054:	2227e793          	ori	a5,a5,546
    80001058:	10479073          	csrw	sie,a5
    8000105c:	fff00793          	li	a5,-1
    80001060:	00a7d793          	srli	a5,a5,0xa
    80001064:	3b079073          	csrw	pmpaddr0,a5
    80001068:	00f00793          	li	a5,15
    8000106c:	3a079073          	csrw	pmpcfg0,a5
    80001070:	f14027f3          	csrr	a5,mhartid
    80001074:	0200c737          	lui	a4,0x200c
    80001078:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000107c:	0007869b          	sext.w	a3,a5
    80001080:	00269713          	slli	a4,a3,0x2
    80001084:	000f4637          	lui	a2,0xf4
    80001088:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000108c:	00d70733          	add	a4,a4,a3
    80001090:	0037979b          	slliw	a5,a5,0x3
    80001094:	020046b7          	lui	a3,0x2004
    80001098:	00d787b3          	add	a5,a5,a3
    8000109c:	00c585b3          	add	a1,a1,a2
    800010a0:	00371693          	slli	a3,a4,0x3
    800010a4:	0000b717          	auipc	a4,0xb
    800010a8:	72c70713          	addi	a4,a4,1836 # 8000c7d0 <timer_scratch>
    800010ac:	00b7b023          	sd	a1,0(a5)
    800010b0:	00d70733          	add	a4,a4,a3
    800010b4:	00f73c23          	sd	a5,24(a4)
    800010b8:	02c73023          	sd	a2,32(a4)
    800010bc:	34071073          	csrw	mscratch,a4
    800010c0:	00000797          	auipc	a5,0x0
    800010c4:	6e078793          	addi	a5,a5,1760 # 800017a0 <timervec>
    800010c8:	30579073          	csrw	mtvec,a5
    800010cc:	300027f3          	csrr	a5,mstatus
    800010d0:	0087e793          	ori	a5,a5,8
    800010d4:	30079073          	csrw	mstatus,a5
    800010d8:	304027f3          	csrr	a5,mie
    800010dc:	0807e793          	ori	a5,a5,128
    800010e0:	30479073          	csrw	mie,a5
    800010e4:	f14027f3          	csrr	a5,mhartid
    800010e8:	0007879b          	sext.w	a5,a5
    800010ec:	00078213          	mv	tp,a5
    800010f0:	30200073          	mret
    800010f4:	00813403          	ld	s0,8(sp)
    800010f8:	01010113          	addi	sp,sp,16
    800010fc:	00008067          	ret

0000000080001100 <timerinit>:
    80001100:	ff010113          	addi	sp,sp,-16
    80001104:	00813423          	sd	s0,8(sp)
    80001108:	01010413          	addi	s0,sp,16
    8000110c:	f14027f3          	csrr	a5,mhartid
    80001110:	0200c737          	lui	a4,0x200c
    80001114:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001118:	0007869b          	sext.w	a3,a5
    8000111c:	00269713          	slli	a4,a3,0x2
    80001120:	000f4637          	lui	a2,0xf4
    80001124:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001128:	00d70733          	add	a4,a4,a3
    8000112c:	0037979b          	slliw	a5,a5,0x3
    80001130:	020046b7          	lui	a3,0x2004
    80001134:	00d787b3          	add	a5,a5,a3
    80001138:	00c585b3          	add	a1,a1,a2
    8000113c:	00371693          	slli	a3,a4,0x3
    80001140:	0000b717          	auipc	a4,0xb
    80001144:	69070713          	addi	a4,a4,1680 # 8000c7d0 <timer_scratch>
    80001148:	00b7b023          	sd	a1,0(a5)
    8000114c:	00d70733          	add	a4,a4,a3
    80001150:	00f73c23          	sd	a5,24(a4)
    80001154:	02c73023          	sd	a2,32(a4)
    80001158:	34071073          	csrw	mscratch,a4
    8000115c:	00000797          	auipc	a5,0x0
    80001160:	64478793          	addi	a5,a5,1604 # 800017a0 <timervec>
    80001164:	30579073          	csrw	mtvec,a5
    80001168:	300027f3          	csrr	a5,mstatus
    8000116c:	0087e793          	ori	a5,a5,8
    80001170:	30079073          	csrw	mstatus,a5
    80001174:	304027f3          	csrr	a5,mie
    80001178:	0807e793          	ori	a5,a5,128
    8000117c:	30479073          	csrw	mie,a5
    80001180:	00813403          	ld	s0,8(sp)
    80001184:	01010113          	addi	sp,sp,16
    80001188:	00008067          	ret

000000008000118c <system_main>:
    8000118c:	fe010113          	addi	sp,sp,-32
    80001190:	00813823          	sd	s0,16(sp)
    80001194:	00913423          	sd	s1,8(sp)
    80001198:	00113c23          	sd	ra,24(sp)
    8000119c:	02010413          	addi	s0,sp,32
    800011a0:	00000097          	auipc	ra,0x0
    800011a4:	0c4080e7          	jalr	196(ra) # 80001264 <cpuid>
    800011a8:	0000b497          	auipc	s1,0xb
    800011ac:	59848493          	addi	s1,s1,1432 # 8000c740 <started>
    800011b0:	02050263          	beqz	a0,800011d4 <system_main+0x48>
    800011b4:	0004a783          	lw	a5,0(s1)
    800011b8:	0007879b          	sext.w	a5,a5
    800011bc:	fe078ce3          	beqz	a5,800011b4 <system_main+0x28>
    800011c0:	0ff0000f          	fence
    800011c4:	00009517          	auipc	a0,0x9
    800011c8:	5d450513          	addi	a0,a0,1492 # 8000a798 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    800011cc:	00001097          	auipc	ra,0x1
    800011d0:	a70080e7          	jalr	-1424(ra) # 80001c3c <panic>
    800011d4:	00001097          	auipc	ra,0x1
    800011d8:	9c4080e7          	jalr	-1596(ra) # 80001b98 <consoleinit>
    800011dc:	00001097          	auipc	ra,0x1
    800011e0:	150080e7          	jalr	336(ra) # 8000232c <printfinit>
    800011e4:	00009517          	auipc	a0,0x9
    800011e8:	2e450513          	addi	a0,a0,740 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	aac080e7          	jalr	-1364(ra) # 80001c98 <__printf>
    800011f4:	00009517          	auipc	a0,0x9
    800011f8:	57450513          	addi	a0,a0,1396 # 8000a768 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	a9c080e7          	jalr	-1380(ra) # 80001c98 <__printf>
    80001204:	00009517          	auipc	a0,0x9
    80001208:	2c450513          	addi	a0,a0,708 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    8000120c:	00001097          	auipc	ra,0x1
    80001210:	a8c080e7          	jalr	-1396(ra) # 80001c98 <__printf>
    80001214:	00001097          	auipc	ra,0x1
    80001218:	4a4080e7          	jalr	1188(ra) # 800026b8 <kinit>
    8000121c:	00000097          	auipc	ra,0x0
    80001220:	148080e7          	jalr	328(ra) # 80001364 <trapinit>
    80001224:	00000097          	auipc	ra,0x0
    80001228:	16c080e7          	jalr	364(ra) # 80001390 <trapinithart>
    8000122c:	00000097          	auipc	ra,0x0
    80001230:	5b4080e7          	jalr	1460(ra) # 800017e0 <plicinit>
    80001234:	00000097          	auipc	ra,0x0
    80001238:	5d4080e7          	jalr	1492(ra) # 80001808 <plicinithart>
    8000123c:	00000097          	auipc	ra,0x0
    80001240:	078080e7          	jalr	120(ra) # 800012b4 <userinit>
    80001244:	0ff0000f          	fence
    80001248:	00100793          	li	a5,1
    8000124c:	00009517          	auipc	a0,0x9
    80001250:	53450513          	addi	a0,a0,1332 # 8000a780 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x128>
    80001254:	00f4a023          	sw	a5,0(s1)
    80001258:	00001097          	auipc	ra,0x1
    8000125c:	a40080e7          	jalr	-1472(ra) # 80001c98 <__printf>
    80001260:	0000006f          	j	80001260 <system_main+0xd4>

0000000080001264 <cpuid>:
    80001264:	ff010113          	addi	sp,sp,-16
    80001268:	00813423          	sd	s0,8(sp)
    8000126c:	01010413          	addi	s0,sp,16
    80001270:	00020513          	mv	a0,tp
    80001274:	00813403          	ld	s0,8(sp)
    80001278:	0005051b          	sext.w	a0,a0
    8000127c:	01010113          	addi	sp,sp,16
    80001280:	00008067          	ret

0000000080001284 <mycpu>:
    80001284:	ff010113          	addi	sp,sp,-16
    80001288:	00813423          	sd	s0,8(sp)
    8000128c:	01010413          	addi	s0,sp,16
    80001290:	00020793          	mv	a5,tp
    80001294:	00813403          	ld	s0,8(sp)
    80001298:	0007879b          	sext.w	a5,a5
    8000129c:	00779793          	slli	a5,a5,0x7
    800012a0:	0000c517          	auipc	a0,0xc
    800012a4:	56050513          	addi	a0,a0,1376 # 8000d800 <cpus>
    800012a8:	00f50533          	add	a0,a0,a5
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <userinit>:
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    800012c0:	00813403          	ld	s0,8(sp)
    800012c4:	01010113          	addi	sp,sp,16
    800012c8:	00005317          	auipc	t1,0x5
    800012cc:	49830067          	jr	1176(t1) # 80006760 <main>

00000000800012d0 <either_copyout>:
    800012d0:	ff010113          	addi	sp,sp,-16
    800012d4:	00813023          	sd	s0,0(sp)
    800012d8:	00113423          	sd	ra,8(sp)
    800012dc:	01010413          	addi	s0,sp,16
    800012e0:	02051663          	bnez	a0,8000130c <either_copyout+0x3c>
    800012e4:	00058513          	mv	a0,a1
    800012e8:	00060593          	mv	a1,a2
    800012ec:	0006861b          	sext.w	a2,a3
    800012f0:	00002097          	auipc	ra,0x2
    800012f4:	c54080e7          	jalr	-940(ra) # 80002f44 <__memmove>
    800012f8:	00813083          	ld	ra,8(sp)
    800012fc:	00013403          	ld	s0,0(sp)
    80001300:	00000513          	li	a0,0
    80001304:	01010113          	addi	sp,sp,16
    80001308:	00008067          	ret
    8000130c:	00009517          	auipc	a0,0x9
    80001310:	4b450513          	addi	a0,a0,1204 # 8000a7c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x168>
    80001314:	00001097          	auipc	ra,0x1
    80001318:	928080e7          	jalr	-1752(ra) # 80001c3c <panic>

000000008000131c <either_copyin>:
    8000131c:	ff010113          	addi	sp,sp,-16
    80001320:	00813023          	sd	s0,0(sp)
    80001324:	00113423          	sd	ra,8(sp)
    80001328:	01010413          	addi	s0,sp,16
    8000132c:	02059463          	bnez	a1,80001354 <either_copyin+0x38>
    80001330:	00060593          	mv	a1,a2
    80001334:	0006861b          	sext.w	a2,a3
    80001338:	00002097          	auipc	ra,0x2
    8000133c:	c0c080e7          	jalr	-1012(ra) # 80002f44 <__memmove>
    80001340:	00813083          	ld	ra,8(sp)
    80001344:	00013403          	ld	s0,0(sp)
    80001348:	00000513          	li	a0,0
    8000134c:	01010113          	addi	sp,sp,16
    80001350:	00008067          	ret
    80001354:	00009517          	auipc	a0,0x9
    80001358:	49450513          	addi	a0,a0,1172 # 8000a7e8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x190>
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	8e0080e7          	jalr	-1824(ra) # 80001c3c <panic>

0000000080001364 <trapinit>:
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	00009597          	auipc	a1,0x9
    80001378:	49c58593          	addi	a1,a1,1180 # 8000a810 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1b8>
    8000137c:	0000c517          	auipc	a0,0xc
    80001380:	50450513          	addi	a0,a0,1284 # 8000d880 <tickslock>
    80001384:	01010113          	addi	sp,sp,16
    80001388:	00001317          	auipc	t1,0x1
    8000138c:	5c030067          	jr	1472(t1) # 80002948 <initlock>

0000000080001390 <trapinithart>:
    80001390:	ff010113          	addi	sp,sp,-16
    80001394:	00813423          	sd	s0,8(sp)
    80001398:	01010413          	addi	s0,sp,16
    8000139c:	00000797          	auipc	a5,0x0
    800013a0:	2f478793          	addi	a5,a5,756 # 80001690 <kernelvec>
    800013a4:	10579073          	csrw	stvec,a5
    800013a8:	00813403          	ld	s0,8(sp)
    800013ac:	01010113          	addi	sp,sp,16
    800013b0:	00008067          	ret

00000000800013b4 <usertrap>:
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00813423          	sd	s0,8(sp)
    800013bc:	01010413          	addi	s0,sp,16
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <usertrapret>:
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00008067          	ret

00000000800013e4 <kerneltrap>:
    800013e4:	fe010113          	addi	sp,sp,-32
    800013e8:	00813823          	sd	s0,16(sp)
    800013ec:	00113c23          	sd	ra,24(sp)
    800013f0:	00913423          	sd	s1,8(sp)
    800013f4:	02010413          	addi	s0,sp,32
    800013f8:	142025f3          	csrr	a1,scause
    800013fc:	100027f3          	csrr	a5,sstatus
    80001400:	0027f793          	andi	a5,a5,2
    80001404:	10079c63          	bnez	a5,8000151c <kerneltrap+0x138>
    80001408:	142027f3          	csrr	a5,scause
    8000140c:	0207ce63          	bltz	a5,80001448 <kerneltrap+0x64>
    80001410:	00009517          	auipc	a0,0x9
    80001414:	44850513          	addi	a0,a0,1096 # 8000a858 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x200>
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	880080e7          	jalr	-1920(ra) # 80001c98 <__printf>
    80001420:	141025f3          	csrr	a1,sepc
    80001424:	14302673          	csrr	a2,stval
    80001428:	00009517          	auipc	a0,0x9
    8000142c:	44050513          	addi	a0,a0,1088 # 8000a868 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x210>
    80001430:	00001097          	auipc	ra,0x1
    80001434:	868080e7          	jalr	-1944(ra) # 80001c98 <__printf>
    80001438:	00009517          	auipc	a0,0x9
    8000143c:	44850513          	addi	a0,a0,1096 # 8000a880 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x228>
    80001440:	00000097          	auipc	ra,0x0
    80001444:	7fc080e7          	jalr	2044(ra) # 80001c3c <panic>
    80001448:	0ff7f713          	andi	a4,a5,255
    8000144c:	00900693          	li	a3,9
    80001450:	04d70063          	beq	a4,a3,80001490 <kerneltrap+0xac>
    80001454:	fff00713          	li	a4,-1
    80001458:	03f71713          	slli	a4,a4,0x3f
    8000145c:	00170713          	addi	a4,a4,1
    80001460:	fae798e3          	bne	a5,a4,80001410 <kerneltrap+0x2c>
    80001464:	00000097          	auipc	ra,0x0
    80001468:	e00080e7          	jalr	-512(ra) # 80001264 <cpuid>
    8000146c:	06050663          	beqz	a0,800014d8 <kerneltrap+0xf4>
    80001470:	144027f3          	csrr	a5,sip
    80001474:	ffd7f793          	andi	a5,a5,-3
    80001478:	14479073          	csrw	sip,a5
    8000147c:	01813083          	ld	ra,24(sp)
    80001480:	01013403          	ld	s0,16(sp)
    80001484:	00813483          	ld	s1,8(sp)
    80001488:	02010113          	addi	sp,sp,32
    8000148c:	00008067          	ret
    80001490:	00000097          	auipc	ra,0x0
    80001494:	3c4080e7          	jalr	964(ra) # 80001854 <plic_claim>
    80001498:	00a00793          	li	a5,10
    8000149c:	00050493          	mv	s1,a0
    800014a0:	06f50863          	beq	a0,a5,80001510 <kerneltrap+0x12c>
    800014a4:	fc050ce3          	beqz	a0,8000147c <kerneltrap+0x98>
    800014a8:	00050593          	mv	a1,a0
    800014ac:	00009517          	auipc	a0,0x9
    800014b0:	38c50513          	addi	a0,a0,908 # 8000a838 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e0>
    800014b4:	00000097          	auipc	ra,0x0
    800014b8:	7e4080e7          	jalr	2020(ra) # 80001c98 <__printf>
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	01813083          	ld	ra,24(sp)
    800014c4:	00048513          	mv	a0,s1
    800014c8:	00813483          	ld	s1,8(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00000317          	auipc	t1,0x0
    800014d4:	3bc30067          	jr	956(t1) # 8000188c <plic_complete>
    800014d8:	0000c517          	auipc	a0,0xc
    800014dc:	3a850513          	addi	a0,a0,936 # 8000d880 <tickslock>
    800014e0:	00001097          	auipc	ra,0x1
    800014e4:	48c080e7          	jalr	1164(ra) # 8000296c <acquire>
    800014e8:	0000b717          	auipc	a4,0xb
    800014ec:	25c70713          	addi	a4,a4,604 # 8000c744 <ticks>
    800014f0:	00072783          	lw	a5,0(a4)
    800014f4:	0000c517          	auipc	a0,0xc
    800014f8:	38c50513          	addi	a0,a0,908 # 8000d880 <tickslock>
    800014fc:	0017879b          	addiw	a5,a5,1
    80001500:	00f72023          	sw	a5,0(a4)
    80001504:	00001097          	auipc	ra,0x1
    80001508:	534080e7          	jalr	1332(ra) # 80002a38 <release>
    8000150c:	f65ff06f          	j	80001470 <kerneltrap+0x8c>
    80001510:	00001097          	auipc	ra,0x1
    80001514:	090080e7          	jalr	144(ra) # 800025a0 <uartintr>
    80001518:	fa5ff06f          	j	800014bc <kerneltrap+0xd8>
    8000151c:	00009517          	auipc	a0,0x9
    80001520:	2fc50513          	addi	a0,a0,764 # 8000a818 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1c0>
    80001524:	00000097          	auipc	ra,0x0
    80001528:	718080e7          	jalr	1816(ra) # 80001c3c <panic>

000000008000152c <clockintr>:
    8000152c:	fe010113          	addi	sp,sp,-32
    80001530:	00813823          	sd	s0,16(sp)
    80001534:	00913423          	sd	s1,8(sp)
    80001538:	00113c23          	sd	ra,24(sp)
    8000153c:	02010413          	addi	s0,sp,32
    80001540:	0000c497          	auipc	s1,0xc
    80001544:	34048493          	addi	s1,s1,832 # 8000d880 <tickslock>
    80001548:	00048513          	mv	a0,s1
    8000154c:	00001097          	auipc	ra,0x1
    80001550:	420080e7          	jalr	1056(ra) # 8000296c <acquire>
    80001554:	0000b717          	auipc	a4,0xb
    80001558:	1f070713          	addi	a4,a4,496 # 8000c744 <ticks>
    8000155c:	00072783          	lw	a5,0(a4)
    80001560:	01013403          	ld	s0,16(sp)
    80001564:	01813083          	ld	ra,24(sp)
    80001568:	00048513          	mv	a0,s1
    8000156c:	0017879b          	addiw	a5,a5,1
    80001570:	00813483          	ld	s1,8(sp)
    80001574:	00f72023          	sw	a5,0(a4)
    80001578:	02010113          	addi	sp,sp,32
    8000157c:	00001317          	auipc	t1,0x1
    80001580:	4bc30067          	jr	1212(t1) # 80002a38 <release>

0000000080001584 <devintr>:
    80001584:	142027f3          	csrr	a5,scause
    80001588:	00000513          	li	a0,0
    8000158c:	0007c463          	bltz	a5,80001594 <devintr+0x10>
    80001590:	00008067          	ret
    80001594:	fe010113          	addi	sp,sp,-32
    80001598:	00813823          	sd	s0,16(sp)
    8000159c:	00113c23          	sd	ra,24(sp)
    800015a0:	00913423          	sd	s1,8(sp)
    800015a4:	02010413          	addi	s0,sp,32
    800015a8:	0ff7f713          	andi	a4,a5,255
    800015ac:	00900693          	li	a3,9
    800015b0:	04d70c63          	beq	a4,a3,80001608 <devintr+0x84>
    800015b4:	fff00713          	li	a4,-1
    800015b8:	03f71713          	slli	a4,a4,0x3f
    800015bc:	00170713          	addi	a4,a4,1
    800015c0:	00e78c63          	beq	a5,a4,800015d8 <devintr+0x54>
    800015c4:	01813083          	ld	ra,24(sp)
    800015c8:	01013403          	ld	s0,16(sp)
    800015cc:	00813483          	ld	s1,8(sp)
    800015d0:	02010113          	addi	sp,sp,32
    800015d4:	00008067          	ret
    800015d8:	00000097          	auipc	ra,0x0
    800015dc:	c8c080e7          	jalr	-884(ra) # 80001264 <cpuid>
    800015e0:	06050663          	beqz	a0,8000164c <devintr+0xc8>
    800015e4:	144027f3          	csrr	a5,sip
    800015e8:	ffd7f793          	andi	a5,a5,-3
    800015ec:	14479073          	csrw	sip,a5
    800015f0:	01813083          	ld	ra,24(sp)
    800015f4:	01013403          	ld	s0,16(sp)
    800015f8:	00813483          	ld	s1,8(sp)
    800015fc:	00200513          	li	a0,2
    80001600:	02010113          	addi	sp,sp,32
    80001604:	00008067          	ret
    80001608:	00000097          	auipc	ra,0x0
    8000160c:	24c080e7          	jalr	588(ra) # 80001854 <plic_claim>
    80001610:	00a00793          	li	a5,10
    80001614:	00050493          	mv	s1,a0
    80001618:	06f50663          	beq	a0,a5,80001684 <devintr+0x100>
    8000161c:	00100513          	li	a0,1
    80001620:	fa0482e3          	beqz	s1,800015c4 <devintr+0x40>
    80001624:	00048593          	mv	a1,s1
    80001628:	00009517          	auipc	a0,0x9
    8000162c:	21050513          	addi	a0,a0,528 # 8000a838 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e0>
    80001630:	00000097          	auipc	ra,0x0
    80001634:	668080e7          	jalr	1640(ra) # 80001c98 <__printf>
    80001638:	00048513          	mv	a0,s1
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	250080e7          	jalr	592(ra) # 8000188c <plic_complete>
    80001644:	00100513          	li	a0,1
    80001648:	f7dff06f          	j	800015c4 <devintr+0x40>
    8000164c:	0000c517          	auipc	a0,0xc
    80001650:	23450513          	addi	a0,a0,564 # 8000d880 <tickslock>
    80001654:	00001097          	auipc	ra,0x1
    80001658:	318080e7          	jalr	792(ra) # 8000296c <acquire>
    8000165c:	0000b717          	auipc	a4,0xb
    80001660:	0e870713          	addi	a4,a4,232 # 8000c744 <ticks>
    80001664:	00072783          	lw	a5,0(a4)
    80001668:	0000c517          	auipc	a0,0xc
    8000166c:	21850513          	addi	a0,a0,536 # 8000d880 <tickslock>
    80001670:	0017879b          	addiw	a5,a5,1
    80001674:	00f72023          	sw	a5,0(a4)
    80001678:	00001097          	auipc	ra,0x1
    8000167c:	3c0080e7          	jalr	960(ra) # 80002a38 <release>
    80001680:	f65ff06f          	j	800015e4 <devintr+0x60>
    80001684:	00001097          	auipc	ra,0x1
    80001688:	f1c080e7          	jalr	-228(ra) # 800025a0 <uartintr>
    8000168c:	fadff06f          	j	80001638 <devintr+0xb4>

0000000080001690 <kernelvec>:
    80001690:	f0010113          	addi	sp,sp,-256
    80001694:	00113023          	sd	ra,0(sp)
    80001698:	00213423          	sd	sp,8(sp)
    8000169c:	00313823          	sd	gp,16(sp)
    800016a0:	00413c23          	sd	tp,24(sp)
    800016a4:	02513023          	sd	t0,32(sp)
    800016a8:	02613423          	sd	t1,40(sp)
    800016ac:	02713823          	sd	t2,48(sp)
    800016b0:	02813c23          	sd	s0,56(sp)
    800016b4:	04913023          	sd	s1,64(sp)
    800016b8:	04a13423          	sd	a0,72(sp)
    800016bc:	04b13823          	sd	a1,80(sp)
    800016c0:	04c13c23          	sd	a2,88(sp)
    800016c4:	06d13023          	sd	a3,96(sp)
    800016c8:	06e13423          	sd	a4,104(sp)
    800016cc:	06f13823          	sd	a5,112(sp)
    800016d0:	07013c23          	sd	a6,120(sp)
    800016d4:	09113023          	sd	a7,128(sp)
    800016d8:	09213423          	sd	s2,136(sp)
    800016dc:	09313823          	sd	s3,144(sp)
    800016e0:	09413c23          	sd	s4,152(sp)
    800016e4:	0b513023          	sd	s5,160(sp)
    800016e8:	0b613423          	sd	s6,168(sp)
    800016ec:	0b713823          	sd	s7,176(sp)
    800016f0:	0b813c23          	sd	s8,184(sp)
    800016f4:	0d913023          	sd	s9,192(sp)
    800016f8:	0da13423          	sd	s10,200(sp)
    800016fc:	0db13823          	sd	s11,208(sp)
    80001700:	0dc13c23          	sd	t3,216(sp)
    80001704:	0fd13023          	sd	t4,224(sp)
    80001708:	0fe13423          	sd	t5,232(sp)
    8000170c:	0ff13823          	sd	t6,240(sp)
    80001710:	cd5ff0ef          	jal	ra,800013e4 <kerneltrap>
    80001714:	00013083          	ld	ra,0(sp)
    80001718:	00813103          	ld	sp,8(sp)
    8000171c:	01013183          	ld	gp,16(sp)
    80001720:	02013283          	ld	t0,32(sp)
    80001724:	02813303          	ld	t1,40(sp)
    80001728:	03013383          	ld	t2,48(sp)
    8000172c:	03813403          	ld	s0,56(sp)
    80001730:	04013483          	ld	s1,64(sp)
    80001734:	04813503          	ld	a0,72(sp)
    80001738:	05013583          	ld	a1,80(sp)
    8000173c:	05813603          	ld	a2,88(sp)
    80001740:	06013683          	ld	a3,96(sp)
    80001744:	06813703          	ld	a4,104(sp)
    80001748:	07013783          	ld	a5,112(sp)
    8000174c:	07813803          	ld	a6,120(sp)
    80001750:	08013883          	ld	a7,128(sp)
    80001754:	08813903          	ld	s2,136(sp)
    80001758:	09013983          	ld	s3,144(sp)
    8000175c:	09813a03          	ld	s4,152(sp)
    80001760:	0a013a83          	ld	s5,160(sp)
    80001764:	0a813b03          	ld	s6,168(sp)
    80001768:	0b013b83          	ld	s7,176(sp)
    8000176c:	0b813c03          	ld	s8,184(sp)
    80001770:	0c013c83          	ld	s9,192(sp)
    80001774:	0c813d03          	ld	s10,200(sp)
    80001778:	0d013d83          	ld	s11,208(sp)
    8000177c:	0d813e03          	ld	t3,216(sp)
    80001780:	0e013e83          	ld	t4,224(sp)
    80001784:	0e813f03          	ld	t5,232(sp)
    80001788:	0f013f83          	ld	t6,240(sp)
    8000178c:	10010113          	addi	sp,sp,256
    80001790:	10200073          	sret
    80001794:	00000013          	nop
    80001798:	00000013          	nop
    8000179c:	00000013          	nop

00000000800017a0 <timervec>:
    800017a0:	34051573          	csrrw	a0,mscratch,a0
    800017a4:	00b53023          	sd	a1,0(a0)
    800017a8:	00c53423          	sd	a2,8(a0)
    800017ac:	00d53823          	sd	a3,16(a0)
    800017b0:	01853583          	ld	a1,24(a0)
    800017b4:	02053603          	ld	a2,32(a0)
    800017b8:	0005b683          	ld	a3,0(a1)
    800017bc:	00c686b3          	add	a3,a3,a2
    800017c0:	00d5b023          	sd	a3,0(a1)
    800017c4:	00200593          	li	a1,2
    800017c8:	14459073          	csrw	sip,a1
    800017cc:	01053683          	ld	a3,16(a0)
    800017d0:	00853603          	ld	a2,8(a0)
    800017d4:	00053583          	ld	a1,0(a0)
    800017d8:	34051573          	csrrw	a0,mscratch,a0
    800017dc:	30200073          	mret

00000000800017e0 <plicinit>:
    800017e0:	ff010113          	addi	sp,sp,-16
    800017e4:	00813423          	sd	s0,8(sp)
    800017e8:	01010413          	addi	s0,sp,16
    800017ec:	00813403          	ld	s0,8(sp)
    800017f0:	0c0007b7          	lui	a5,0xc000
    800017f4:	00100713          	li	a4,1
    800017f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800017fc:	00e7a223          	sw	a4,4(a5)
    80001800:	01010113          	addi	sp,sp,16
    80001804:	00008067          	ret

0000000080001808 <plicinithart>:
    80001808:	ff010113          	addi	sp,sp,-16
    8000180c:	00813023          	sd	s0,0(sp)
    80001810:	00113423          	sd	ra,8(sp)
    80001814:	01010413          	addi	s0,sp,16
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	a4c080e7          	jalr	-1460(ra) # 80001264 <cpuid>
    80001820:	0085171b          	slliw	a4,a0,0x8
    80001824:	0c0027b7          	lui	a5,0xc002
    80001828:	00e787b3          	add	a5,a5,a4
    8000182c:	40200713          	li	a4,1026
    80001830:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001834:	00813083          	ld	ra,8(sp)
    80001838:	00013403          	ld	s0,0(sp)
    8000183c:	00d5151b          	slliw	a0,a0,0xd
    80001840:	0c2017b7          	lui	a5,0xc201
    80001844:	00a78533          	add	a0,a5,a0
    80001848:	00052023          	sw	zero,0(a0)
    8000184c:	01010113          	addi	sp,sp,16
    80001850:	00008067          	ret

0000000080001854 <plic_claim>:
    80001854:	ff010113          	addi	sp,sp,-16
    80001858:	00813023          	sd	s0,0(sp)
    8000185c:	00113423          	sd	ra,8(sp)
    80001860:	01010413          	addi	s0,sp,16
    80001864:	00000097          	auipc	ra,0x0
    80001868:	a00080e7          	jalr	-1536(ra) # 80001264 <cpuid>
    8000186c:	00813083          	ld	ra,8(sp)
    80001870:	00013403          	ld	s0,0(sp)
    80001874:	00d5151b          	slliw	a0,a0,0xd
    80001878:	0c2017b7          	lui	a5,0xc201
    8000187c:	00a78533          	add	a0,a5,a0
    80001880:	00452503          	lw	a0,4(a0)
    80001884:	01010113          	addi	sp,sp,16
    80001888:	00008067          	ret

000000008000188c <plic_complete>:
    8000188c:	fe010113          	addi	sp,sp,-32
    80001890:	00813823          	sd	s0,16(sp)
    80001894:	00913423          	sd	s1,8(sp)
    80001898:	00113c23          	sd	ra,24(sp)
    8000189c:	02010413          	addi	s0,sp,32
    800018a0:	00050493          	mv	s1,a0
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	9c0080e7          	jalr	-1600(ra) # 80001264 <cpuid>
    800018ac:	01813083          	ld	ra,24(sp)
    800018b0:	01013403          	ld	s0,16(sp)
    800018b4:	00d5179b          	slliw	a5,a0,0xd
    800018b8:	0c201737          	lui	a4,0xc201
    800018bc:	00f707b3          	add	a5,a4,a5
    800018c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800018c4:	00813483          	ld	s1,8(sp)
    800018c8:	02010113          	addi	sp,sp,32
    800018cc:	00008067          	ret

00000000800018d0 <consolewrite>:
    800018d0:	fb010113          	addi	sp,sp,-80
    800018d4:	04813023          	sd	s0,64(sp)
    800018d8:	04113423          	sd	ra,72(sp)
    800018dc:	02913c23          	sd	s1,56(sp)
    800018e0:	03213823          	sd	s2,48(sp)
    800018e4:	03313423          	sd	s3,40(sp)
    800018e8:	03413023          	sd	s4,32(sp)
    800018ec:	01513c23          	sd	s5,24(sp)
    800018f0:	05010413          	addi	s0,sp,80
    800018f4:	06c05c63          	blez	a2,8000196c <consolewrite+0x9c>
    800018f8:	00060993          	mv	s3,a2
    800018fc:	00050a13          	mv	s4,a0
    80001900:	00058493          	mv	s1,a1
    80001904:	00000913          	li	s2,0
    80001908:	fff00a93          	li	s5,-1
    8000190c:	01c0006f          	j	80001928 <consolewrite+0x58>
    80001910:	fbf44503          	lbu	a0,-65(s0)
    80001914:	0019091b          	addiw	s2,s2,1
    80001918:	00148493          	addi	s1,s1,1
    8000191c:	00001097          	auipc	ra,0x1
    80001920:	a9c080e7          	jalr	-1380(ra) # 800023b8 <uartputc>
    80001924:	03298063          	beq	s3,s2,80001944 <consolewrite+0x74>
    80001928:	00048613          	mv	a2,s1
    8000192c:	00100693          	li	a3,1
    80001930:	000a0593          	mv	a1,s4
    80001934:	fbf40513          	addi	a0,s0,-65
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	9e4080e7          	jalr	-1564(ra) # 8000131c <either_copyin>
    80001940:	fd5518e3          	bne	a0,s5,80001910 <consolewrite+0x40>
    80001944:	04813083          	ld	ra,72(sp)
    80001948:	04013403          	ld	s0,64(sp)
    8000194c:	03813483          	ld	s1,56(sp)
    80001950:	02813983          	ld	s3,40(sp)
    80001954:	02013a03          	ld	s4,32(sp)
    80001958:	01813a83          	ld	s5,24(sp)
    8000195c:	00090513          	mv	a0,s2
    80001960:	03013903          	ld	s2,48(sp)
    80001964:	05010113          	addi	sp,sp,80
    80001968:	00008067          	ret
    8000196c:	00000913          	li	s2,0
    80001970:	fd5ff06f          	j	80001944 <consolewrite+0x74>

0000000080001974 <consoleread>:
    80001974:	f9010113          	addi	sp,sp,-112
    80001978:	06813023          	sd	s0,96(sp)
    8000197c:	04913c23          	sd	s1,88(sp)
    80001980:	05213823          	sd	s2,80(sp)
    80001984:	05313423          	sd	s3,72(sp)
    80001988:	05413023          	sd	s4,64(sp)
    8000198c:	03513c23          	sd	s5,56(sp)
    80001990:	03613823          	sd	s6,48(sp)
    80001994:	03713423          	sd	s7,40(sp)
    80001998:	03813023          	sd	s8,32(sp)
    8000199c:	06113423          	sd	ra,104(sp)
    800019a0:	01913c23          	sd	s9,24(sp)
    800019a4:	07010413          	addi	s0,sp,112
    800019a8:	00060b93          	mv	s7,a2
    800019ac:	00050913          	mv	s2,a0
    800019b0:	00058c13          	mv	s8,a1
    800019b4:	00060b1b          	sext.w	s6,a2
    800019b8:	0000c497          	auipc	s1,0xc
    800019bc:	ef048493          	addi	s1,s1,-272 # 8000d8a8 <cons>
    800019c0:	00400993          	li	s3,4
    800019c4:	fff00a13          	li	s4,-1
    800019c8:	00a00a93          	li	s5,10
    800019cc:	05705e63          	blez	s7,80001a28 <consoleread+0xb4>
    800019d0:	09c4a703          	lw	a4,156(s1)
    800019d4:	0984a783          	lw	a5,152(s1)
    800019d8:	0007071b          	sext.w	a4,a4
    800019dc:	08e78463          	beq	a5,a4,80001a64 <consoleread+0xf0>
    800019e0:	07f7f713          	andi	a4,a5,127
    800019e4:	00e48733          	add	a4,s1,a4
    800019e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800019ec:	0017869b          	addiw	a3,a5,1
    800019f0:	08d4ac23          	sw	a3,152(s1)
    800019f4:	00070c9b          	sext.w	s9,a4
    800019f8:	0b370663          	beq	a4,s3,80001aa4 <consoleread+0x130>
    800019fc:	00100693          	li	a3,1
    80001a00:	f9f40613          	addi	a2,s0,-97
    80001a04:	000c0593          	mv	a1,s8
    80001a08:	00090513          	mv	a0,s2
    80001a0c:	f8e40fa3          	sb	a4,-97(s0)
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	8c0080e7          	jalr	-1856(ra) # 800012d0 <either_copyout>
    80001a18:	01450863          	beq	a0,s4,80001a28 <consoleread+0xb4>
    80001a1c:	001c0c13          	addi	s8,s8,1
    80001a20:	fffb8b9b          	addiw	s7,s7,-1
    80001a24:	fb5c94e3          	bne	s9,s5,800019cc <consoleread+0x58>
    80001a28:	000b851b          	sext.w	a0,s7
    80001a2c:	06813083          	ld	ra,104(sp)
    80001a30:	06013403          	ld	s0,96(sp)
    80001a34:	05813483          	ld	s1,88(sp)
    80001a38:	05013903          	ld	s2,80(sp)
    80001a3c:	04813983          	ld	s3,72(sp)
    80001a40:	04013a03          	ld	s4,64(sp)
    80001a44:	03813a83          	ld	s5,56(sp)
    80001a48:	02813b83          	ld	s7,40(sp)
    80001a4c:	02013c03          	ld	s8,32(sp)
    80001a50:	01813c83          	ld	s9,24(sp)
    80001a54:	40ab053b          	subw	a0,s6,a0
    80001a58:	03013b03          	ld	s6,48(sp)
    80001a5c:	07010113          	addi	sp,sp,112
    80001a60:	00008067          	ret
    80001a64:	00001097          	auipc	ra,0x1
    80001a68:	1d8080e7          	jalr	472(ra) # 80002c3c <push_on>
    80001a6c:	0984a703          	lw	a4,152(s1)
    80001a70:	09c4a783          	lw	a5,156(s1)
    80001a74:	0007879b          	sext.w	a5,a5
    80001a78:	fef70ce3          	beq	a4,a5,80001a70 <consoleread+0xfc>
    80001a7c:	00001097          	auipc	ra,0x1
    80001a80:	234080e7          	jalr	564(ra) # 80002cb0 <pop_on>
    80001a84:	0984a783          	lw	a5,152(s1)
    80001a88:	07f7f713          	andi	a4,a5,127
    80001a8c:	00e48733          	add	a4,s1,a4
    80001a90:	01874703          	lbu	a4,24(a4)
    80001a94:	0017869b          	addiw	a3,a5,1
    80001a98:	08d4ac23          	sw	a3,152(s1)
    80001a9c:	00070c9b          	sext.w	s9,a4
    80001aa0:	f5371ee3          	bne	a4,s3,800019fc <consoleread+0x88>
    80001aa4:	000b851b          	sext.w	a0,s7
    80001aa8:	f96bf2e3          	bgeu	s7,s6,80001a2c <consoleread+0xb8>
    80001aac:	08f4ac23          	sw	a5,152(s1)
    80001ab0:	f7dff06f          	j	80001a2c <consoleread+0xb8>

0000000080001ab4 <consputc>:
    80001ab4:	10000793          	li	a5,256
    80001ab8:	00f50663          	beq	a0,a5,80001ac4 <consputc+0x10>
    80001abc:	00001317          	auipc	t1,0x1
    80001ac0:	9f430067          	jr	-1548(t1) # 800024b0 <uartputc_sync>
    80001ac4:	ff010113          	addi	sp,sp,-16
    80001ac8:	00113423          	sd	ra,8(sp)
    80001acc:	00813023          	sd	s0,0(sp)
    80001ad0:	01010413          	addi	s0,sp,16
    80001ad4:	00800513          	li	a0,8
    80001ad8:	00001097          	auipc	ra,0x1
    80001adc:	9d8080e7          	jalr	-1576(ra) # 800024b0 <uartputc_sync>
    80001ae0:	02000513          	li	a0,32
    80001ae4:	00001097          	auipc	ra,0x1
    80001ae8:	9cc080e7          	jalr	-1588(ra) # 800024b0 <uartputc_sync>
    80001aec:	00013403          	ld	s0,0(sp)
    80001af0:	00813083          	ld	ra,8(sp)
    80001af4:	00800513          	li	a0,8
    80001af8:	01010113          	addi	sp,sp,16
    80001afc:	00001317          	auipc	t1,0x1
    80001b00:	9b430067          	jr	-1612(t1) # 800024b0 <uartputc_sync>

0000000080001b04 <consoleintr>:
    80001b04:	fe010113          	addi	sp,sp,-32
    80001b08:	00813823          	sd	s0,16(sp)
    80001b0c:	00913423          	sd	s1,8(sp)
    80001b10:	01213023          	sd	s2,0(sp)
    80001b14:	00113c23          	sd	ra,24(sp)
    80001b18:	02010413          	addi	s0,sp,32
    80001b1c:	0000c917          	auipc	s2,0xc
    80001b20:	d8c90913          	addi	s2,s2,-628 # 8000d8a8 <cons>
    80001b24:	00050493          	mv	s1,a0
    80001b28:	00090513          	mv	a0,s2
    80001b2c:	00001097          	auipc	ra,0x1
    80001b30:	e40080e7          	jalr	-448(ra) # 8000296c <acquire>
    80001b34:	02048c63          	beqz	s1,80001b6c <consoleintr+0x68>
    80001b38:	0a092783          	lw	a5,160(s2)
    80001b3c:	09892703          	lw	a4,152(s2)
    80001b40:	07f00693          	li	a3,127
    80001b44:	40e7873b          	subw	a4,a5,a4
    80001b48:	02e6e263          	bltu	a3,a4,80001b6c <consoleintr+0x68>
    80001b4c:	00d00713          	li	a4,13
    80001b50:	04e48063          	beq	s1,a4,80001b90 <consoleintr+0x8c>
    80001b54:	07f7f713          	andi	a4,a5,127
    80001b58:	00e90733          	add	a4,s2,a4
    80001b5c:	0017879b          	addiw	a5,a5,1
    80001b60:	0af92023          	sw	a5,160(s2)
    80001b64:	00970c23          	sb	s1,24(a4)
    80001b68:	08f92e23          	sw	a5,156(s2)
    80001b6c:	01013403          	ld	s0,16(sp)
    80001b70:	01813083          	ld	ra,24(sp)
    80001b74:	00813483          	ld	s1,8(sp)
    80001b78:	00013903          	ld	s2,0(sp)
    80001b7c:	0000c517          	auipc	a0,0xc
    80001b80:	d2c50513          	addi	a0,a0,-724 # 8000d8a8 <cons>
    80001b84:	02010113          	addi	sp,sp,32
    80001b88:	00001317          	auipc	t1,0x1
    80001b8c:	eb030067          	jr	-336(t1) # 80002a38 <release>
    80001b90:	00a00493          	li	s1,10
    80001b94:	fc1ff06f          	j	80001b54 <consoleintr+0x50>

0000000080001b98 <consoleinit>:
    80001b98:	fe010113          	addi	sp,sp,-32
    80001b9c:	00113c23          	sd	ra,24(sp)
    80001ba0:	00813823          	sd	s0,16(sp)
    80001ba4:	00913423          	sd	s1,8(sp)
    80001ba8:	02010413          	addi	s0,sp,32
    80001bac:	0000c497          	auipc	s1,0xc
    80001bb0:	cfc48493          	addi	s1,s1,-772 # 8000d8a8 <cons>
    80001bb4:	00048513          	mv	a0,s1
    80001bb8:	00009597          	auipc	a1,0x9
    80001bbc:	cd858593          	addi	a1,a1,-808 # 8000a890 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x238>
    80001bc0:	00001097          	auipc	ra,0x1
    80001bc4:	d88080e7          	jalr	-632(ra) # 80002948 <initlock>
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	7ac080e7          	jalr	1964(ra) # 80002374 <uartinit>
    80001bd0:	01813083          	ld	ra,24(sp)
    80001bd4:	01013403          	ld	s0,16(sp)
    80001bd8:	00000797          	auipc	a5,0x0
    80001bdc:	d9c78793          	addi	a5,a5,-612 # 80001974 <consoleread>
    80001be0:	0af4bc23          	sd	a5,184(s1)
    80001be4:	00000797          	auipc	a5,0x0
    80001be8:	cec78793          	addi	a5,a5,-788 # 800018d0 <consolewrite>
    80001bec:	0cf4b023          	sd	a5,192(s1)
    80001bf0:	00813483          	ld	s1,8(sp)
    80001bf4:	02010113          	addi	sp,sp,32
    80001bf8:	00008067          	ret

0000000080001bfc <console_read>:
    80001bfc:	ff010113          	addi	sp,sp,-16
    80001c00:	00813423          	sd	s0,8(sp)
    80001c04:	01010413          	addi	s0,sp,16
    80001c08:	00813403          	ld	s0,8(sp)
    80001c0c:	0000c317          	auipc	t1,0xc
    80001c10:	d5433303          	ld	t1,-684(t1) # 8000d960 <devsw+0x10>
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00030067          	jr	t1

0000000080001c1c <console_write>:
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	00813403          	ld	s0,8(sp)
    80001c2c:	0000c317          	auipc	t1,0xc
    80001c30:	d3c33303          	ld	t1,-708(t1) # 8000d968 <devsw+0x18>
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00030067          	jr	t1

0000000080001c3c <panic>:
    80001c3c:	fe010113          	addi	sp,sp,-32
    80001c40:	00113c23          	sd	ra,24(sp)
    80001c44:	00813823          	sd	s0,16(sp)
    80001c48:	00913423          	sd	s1,8(sp)
    80001c4c:	02010413          	addi	s0,sp,32
    80001c50:	00050493          	mv	s1,a0
    80001c54:	00009517          	auipc	a0,0x9
    80001c58:	c4450513          	addi	a0,a0,-956 # 8000a898 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x240>
    80001c5c:	0000c797          	auipc	a5,0xc
    80001c60:	da07a623          	sw	zero,-596(a5) # 8000da08 <pr+0x18>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	034080e7          	jalr	52(ra) # 80001c98 <__printf>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	028080e7          	jalr	40(ra) # 80001c98 <__printf>
    80001c78:	00009517          	auipc	a0,0x9
    80001c7c:	85050513          	addi	a0,a0,-1968 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	018080e7          	jalr	24(ra) # 80001c98 <__printf>
    80001c88:	00100793          	li	a5,1
    80001c8c:	0000b717          	auipc	a4,0xb
    80001c90:	aaf72e23          	sw	a5,-1348(a4) # 8000c748 <panicked>
    80001c94:	0000006f          	j	80001c94 <panic+0x58>

0000000080001c98 <__printf>:
    80001c98:	f3010113          	addi	sp,sp,-208
    80001c9c:	08813023          	sd	s0,128(sp)
    80001ca0:	07313423          	sd	s3,104(sp)
    80001ca4:	09010413          	addi	s0,sp,144
    80001ca8:	05813023          	sd	s8,64(sp)
    80001cac:	08113423          	sd	ra,136(sp)
    80001cb0:	06913c23          	sd	s1,120(sp)
    80001cb4:	07213823          	sd	s2,112(sp)
    80001cb8:	07413023          	sd	s4,96(sp)
    80001cbc:	05513c23          	sd	s5,88(sp)
    80001cc0:	05613823          	sd	s6,80(sp)
    80001cc4:	05713423          	sd	s7,72(sp)
    80001cc8:	03913c23          	sd	s9,56(sp)
    80001ccc:	03a13823          	sd	s10,48(sp)
    80001cd0:	03b13423          	sd	s11,40(sp)
    80001cd4:	0000c317          	auipc	t1,0xc
    80001cd8:	d1c30313          	addi	t1,t1,-740 # 8000d9f0 <pr>
    80001cdc:	01832c03          	lw	s8,24(t1)
    80001ce0:	00b43423          	sd	a1,8(s0)
    80001ce4:	00c43823          	sd	a2,16(s0)
    80001ce8:	00d43c23          	sd	a3,24(s0)
    80001cec:	02e43023          	sd	a4,32(s0)
    80001cf0:	02f43423          	sd	a5,40(s0)
    80001cf4:	03043823          	sd	a6,48(s0)
    80001cf8:	03143c23          	sd	a7,56(s0)
    80001cfc:	00050993          	mv	s3,a0
    80001d00:	4a0c1663          	bnez	s8,800021ac <__printf+0x514>
    80001d04:	60098c63          	beqz	s3,8000231c <__printf+0x684>
    80001d08:	0009c503          	lbu	a0,0(s3)
    80001d0c:	00840793          	addi	a5,s0,8
    80001d10:	f6f43c23          	sd	a5,-136(s0)
    80001d14:	00000493          	li	s1,0
    80001d18:	22050063          	beqz	a0,80001f38 <__printf+0x2a0>
    80001d1c:	00002a37          	lui	s4,0x2
    80001d20:	00018ab7          	lui	s5,0x18
    80001d24:	000f4b37          	lui	s6,0xf4
    80001d28:	00989bb7          	lui	s7,0x989
    80001d2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001d30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001d34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001d38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001d3c:	00148c9b          	addiw	s9,s1,1
    80001d40:	02500793          	li	a5,37
    80001d44:	01998933          	add	s2,s3,s9
    80001d48:	38f51263          	bne	a0,a5,800020cc <__printf+0x434>
    80001d4c:	00094783          	lbu	a5,0(s2)
    80001d50:	00078c9b          	sext.w	s9,a5
    80001d54:	1e078263          	beqz	a5,80001f38 <__printf+0x2a0>
    80001d58:	0024849b          	addiw	s1,s1,2
    80001d5c:	07000713          	li	a4,112
    80001d60:	00998933          	add	s2,s3,s1
    80001d64:	38e78a63          	beq	a5,a4,800020f8 <__printf+0x460>
    80001d68:	20f76863          	bltu	a4,a5,80001f78 <__printf+0x2e0>
    80001d6c:	42a78863          	beq	a5,a0,8000219c <__printf+0x504>
    80001d70:	06400713          	li	a4,100
    80001d74:	40e79663          	bne	a5,a4,80002180 <__printf+0x4e8>
    80001d78:	f7843783          	ld	a5,-136(s0)
    80001d7c:	0007a603          	lw	a2,0(a5)
    80001d80:	00878793          	addi	a5,a5,8
    80001d84:	f6f43c23          	sd	a5,-136(s0)
    80001d88:	42064a63          	bltz	a2,800021bc <__printf+0x524>
    80001d8c:	00a00713          	li	a4,10
    80001d90:	02e677bb          	remuw	a5,a2,a4
    80001d94:	00009d97          	auipc	s11,0x9
    80001d98:	b2cd8d93          	addi	s11,s11,-1236 # 8000a8c0 <digits>
    80001d9c:	00900593          	li	a1,9
    80001da0:	0006051b          	sext.w	a0,a2
    80001da4:	00000c93          	li	s9,0
    80001da8:	02079793          	slli	a5,a5,0x20
    80001dac:	0207d793          	srli	a5,a5,0x20
    80001db0:	00fd87b3          	add	a5,s11,a5
    80001db4:	0007c783          	lbu	a5,0(a5)
    80001db8:	02e656bb          	divuw	a3,a2,a4
    80001dbc:	f8f40023          	sb	a5,-128(s0)
    80001dc0:	14c5d863          	bge	a1,a2,80001f10 <__printf+0x278>
    80001dc4:	06300593          	li	a1,99
    80001dc8:	00100c93          	li	s9,1
    80001dcc:	02e6f7bb          	remuw	a5,a3,a4
    80001dd0:	02079793          	slli	a5,a5,0x20
    80001dd4:	0207d793          	srli	a5,a5,0x20
    80001dd8:	00fd87b3          	add	a5,s11,a5
    80001ddc:	0007c783          	lbu	a5,0(a5)
    80001de0:	02e6d73b          	divuw	a4,a3,a4
    80001de4:	f8f400a3          	sb	a5,-127(s0)
    80001de8:	12a5f463          	bgeu	a1,a0,80001f10 <__printf+0x278>
    80001dec:	00a00693          	li	a3,10
    80001df0:	00900593          	li	a1,9
    80001df4:	02d777bb          	remuw	a5,a4,a3
    80001df8:	02079793          	slli	a5,a5,0x20
    80001dfc:	0207d793          	srli	a5,a5,0x20
    80001e00:	00fd87b3          	add	a5,s11,a5
    80001e04:	0007c503          	lbu	a0,0(a5)
    80001e08:	02d757bb          	divuw	a5,a4,a3
    80001e0c:	f8a40123          	sb	a0,-126(s0)
    80001e10:	48e5f263          	bgeu	a1,a4,80002294 <__printf+0x5fc>
    80001e14:	06300513          	li	a0,99
    80001e18:	02d7f5bb          	remuw	a1,a5,a3
    80001e1c:	02059593          	slli	a1,a1,0x20
    80001e20:	0205d593          	srli	a1,a1,0x20
    80001e24:	00bd85b3          	add	a1,s11,a1
    80001e28:	0005c583          	lbu	a1,0(a1)
    80001e2c:	02d7d7bb          	divuw	a5,a5,a3
    80001e30:	f8b401a3          	sb	a1,-125(s0)
    80001e34:	48e57263          	bgeu	a0,a4,800022b8 <__printf+0x620>
    80001e38:	3e700513          	li	a0,999
    80001e3c:	02d7f5bb          	remuw	a1,a5,a3
    80001e40:	02059593          	slli	a1,a1,0x20
    80001e44:	0205d593          	srli	a1,a1,0x20
    80001e48:	00bd85b3          	add	a1,s11,a1
    80001e4c:	0005c583          	lbu	a1,0(a1)
    80001e50:	02d7d7bb          	divuw	a5,a5,a3
    80001e54:	f8b40223          	sb	a1,-124(s0)
    80001e58:	46e57663          	bgeu	a0,a4,800022c4 <__printf+0x62c>
    80001e5c:	02d7f5bb          	remuw	a1,a5,a3
    80001e60:	02059593          	slli	a1,a1,0x20
    80001e64:	0205d593          	srli	a1,a1,0x20
    80001e68:	00bd85b3          	add	a1,s11,a1
    80001e6c:	0005c583          	lbu	a1,0(a1)
    80001e70:	02d7d7bb          	divuw	a5,a5,a3
    80001e74:	f8b402a3          	sb	a1,-123(s0)
    80001e78:	46ea7863          	bgeu	s4,a4,800022e8 <__printf+0x650>
    80001e7c:	02d7f5bb          	remuw	a1,a5,a3
    80001e80:	02059593          	slli	a1,a1,0x20
    80001e84:	0205d593          	srli	a1,a1,0x20
    80001e88:	00bd85b3          	add	a1,s11,a1
    80001e8c:	0005c583          	lbu	a1,0(a1)
    80001e90:	02d7d7bb          	divuw	a5,a5,a3
    80001e94:	f8b40323          	sb	a1,-122(s0)
    80001e98:	3eeaf863          	bgeu	s5,a4,80002288 <__printf+0x5f0>
    80001e9c:	02d7f5bb          	remuw	a1,a5,a3
    80001ea0:	02059593          	slli	a1,a1,0x20
    80001ea4:	0205d593          	srli	a1,a1,0x20
    80001ea8:	00bd85b3          	add	a1,s11,a1
    80001eac:	0005c583          	lbu	a1,0(a1)
    80001eb0:	02d7d7bb          	divuw	a5,a5,a3
    80001eb4:	f8b403a3          	sb	a1,-121(s0)
    80001eb8:	42eb7e63          	bgeu	s6,a4,800022f4 <__printf+0x65c>
    80001ebc:	02d7f5bb          	remuw	a1,a5,a3
    80001ec0:	02059593          	slli	a1,a1,0x20
    80001ec4:	0205d593          	srli	a1,a1,0x20
    80001ec8:	00bd85b3          	add	a1,s11,a1
    80001ecc:	0005c583          	lbu	a1,0(a1)
    80001ed0:	02d7d7bb          	divuw	a5,a5,a3
    80001ed4:	f8b40423          	sb	a1,-120(s0)
    80001ed8:	42ebfc63          	bgeu	s7,a4,80002310 <__printf+0x678>
    80001edc:	02079793          	slli	a5,a5,0x20
    80001ee0:	0207d793          	srli	a5,a5,0x20
    80001ee4:	00fd8db3          	add	s11,s11,a5
    80001ee8:	000dc703          	lbu	a4,0(s11)
    80001eec:	00a00793          	li	a5,10
    80001ef0:	00900c93          	li	s9,9
    80001ef4:	f8e404a3          	sb	a4,-119(s0)
    80001ef8:	00065c63          	bgez	a2,80001f10 <__printf+0x278>
    80001efc:	f9040713          	addi	a4,s0,-112
    80001f00:	00f70733          	add	a4,a4,a5
    80001f04:	02d00693          	li	a3,45
    80001f08:	fed70823          	sb	a3,-16(a4)
    80001f0c:	00078c93          	mv	s9,a5
    80001f10:	f8040793          	addi	a5,s0,-128
    80001f14:	01978cb3          	add	s9,a5,s9
    80001f18:	f7f40d13          	addi	s10,s0,-129
    80001f1c:	000cc503          	lbu	a0,0(s9)
    80001f20:	fffc8c93          	addi	s9,s9,-1
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	b90080e7          	jalr	-1136(ra) # 80001ab4 <consputc>
    80001f2c:	ffac98e3          	bne	s9,s10,80001f1c <__printf+0x284>
    80001f30:	00094503          	lbu	a0,0(s2)
    80001f34:	e00514e3          	bnez	a0,80001d3c <__printf+0xa4>
    80001f38:	1a0c1663          	bnez	s8,800020e4 <__printf+0x44c>
    80001f3c:	08813083          	ld	ra,136(sp)
    80001f40:	08013403          	ld	s0,128(sp)
    80001f44:	07813483          	ld	s1,120(sp)
    80001f48:	07013903          	ld	s2,112(sp)
    80001f4c:	06813983          	ld	s3,104(sp)
    80001f50:	06013a03          	ld	s4,96(sp)
    80001f54:	05813a83          	ld	s5,88(sp)
    80001f58:	05013b03          	ld	s6,80(sp)
    80001f5c:	04813b83          	ld	s7,72(sp)
    80001f60:	04013c03          	ld	s8,64(sp)
    80001f64:	03813c83          	ld	s9,56(sp)
    80001f68:	03013d03          	ld	s10,48(sp)
    80001f6c:	02813d83          	ld	s11,40(sp)
    80001f70:	0d010113          	addi	sp,sp,208
    80001f74:	00008067          	ret
    80001f78:	07300713          	li	a4,115
    80001f7c:	1ce78a63          	beq	a5,a4,80002150 <__printf+0x4b8>
    80001f80:	07800713          	li	a4,120
    80001f84:	1ee79e63          	bne	a5,a4,80002180 <__printf+0x4e8>
    80001f88:	f7843783          	ld	a5,-136(s0)
    80001f8c:	0007a703          	lw	a4,0(a5)
    80001f90:	00878793          	addi	a5,a5,8
    80001f94:	f6f43c23          	sd	a5,-136(s0)
    80001f98:	28074263          	bltz	a4,8000221c <__printf+0x584>
    80001f9c:	00009d97          	auipc	s11,0x9
    80001fa0:	924d8d93          	addi	s11,s11,-1756 # 8000a8c0 <digits>
    80001fa4:	00f77793          	andi	a5,a4,15
    80001fa8:	00fd87b3          	add	a5,s11,a5
    80001fac:	0007c683          	lbu	a3,0(a5)
    80001fb0:	00f00613          	li	a2,15
    80001fb4:	0007079b          	sext.w	a5,a4
    80001fb8:	f8d40023          	sb	a3,-128(s0)
    80001fbc:	0047559b          	srliw	a1,a4,0x4
    80001fc0:	0047569b          	srliw	a3,a4,0x4
    80001fc4:	00000c93          	li	s9,0
    80001fc8:	0ee65063          	bge	a2,a4,800020a8 <__printf+0x410>
    80001fcc:	00f6f693          	andi	a3,a3,15
    80001fd0:	00dd86b3          	add	a3,s11,a3
    80001fd4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80001fd8:	0087d79b          	srliw	a5,a5,0x8
    80001fdc:	00100c93          	li	s9,1
    80001fe0:	f8d400a3          	sb	a3,-127(s0)
    80001fe4:	0cb67263          	bgeu	a2,a1,800020a8 <__printf+0x410>
    80001fe8:	00f7f693          	andi	a3,a5,15
    80001fec:	00dd86b3          	add	a3,s11,a3
    80001ff0:	0006c583          	lbu	a1,0(a3)
    80001ff4:	00f00613          	li	a2,15
    80001ff8:	0047d69b          	srliw	a3,a5,0x4
    80001ffc:	f8b40123          	sb	a1,-126(s0)
    80002000:	0047d593          	srli	a1,a5,0x4
    80002004:	28f67e63          	bgeu	a2,a5,800022a0 <__printf+0x608>
    80002008:	00f6f693          	andi	a3,a3,15
    8000200c:	00dd86b3          	add	a3,s11,a3
    80002010:	0006c503          	lbu	a0,0(a3)
    80002014:	0087d813          	srli	a6,a5,0x8
    80002018:	0087d69b          	srliw	a3,a5,0x8
    8000201c:	f8a401a3          	sb	a0,-125(s0)
    80002020:	28b67663          	bgeu	a2,a1,800022ac <__printf+0x614>
    80002024:	00f6f693          	andi	a3,a3,15
    80002028:	00dd86b3          	add	a3,s11,a3
    8000202c:	0006c583          	lbu	a1,0(a3)
    80002030:	00c7d513          	srli	a0,a5,0xc
    80002034:	00c7d69b          	srliw	a3,a5,0xc
    80002038:	f8b40223          	sb	a1,-124(s0)
    8000203c:	29067a63          	bgeu	a2,a6,800022d0 <__printf+0x638>
    80002040:	00f6f693          	andi	a3,a3,15
    80002044:	00dd86b3          	add	a3,s11,a3
    80002048:	0006c583          	lbu	a1,0(a3)
    8000204c:	0107d813          	srli	a6,a5,0x10
    80002050:	0107d69b          	srliw	a3,a5,0x10
    80002054:	f8b402a3          	sb	a1,-123(s0)
    80002058:	28a67263          	bgeu	a2,a0,800022dc <__printf+0x644>
    8000205c:	00f6f693          	andi	a3,a3,15
    80002060:	00dd86b3          	add	a3,s11,a3
    80002064:	0006c683          	lbu	a3,0(a3)
    80002068:	0147d79b          	srliw	a5,a5,0x14
    8000206c:	f8d40323          	sb	a3,-122(s0)
    80002070:	21067663          	bgeu	a2,a6,8000227c <__printf+0x5e4>
    80002074:	02079793          	slli	a5,a5,0x20
    80002078:	0207d793          	srli	a5,a5,0x20
    8000207c:	00fd8db3          	add	s11,s11,a5
    80002080:	000dc683          	lbu	a3,0(s11)
    80002084:	00800793          	li	a5,8
    80002088:	00700c93          	li	s9,7
    8000208c:	f8d403a3          	sb	a3,-121(s0)
    80002090:	00075c63          	bgez	a4,800020a8 <__printf+0x410>
    80002094:	f9040713          	addi	a4,s0,-112
    80002098:	00f70733          	add	a4,a4,a5
    8000209c:	02d00693          	li	a3,45
    800020a0:	fed70823          	sb	a3,-16(a4)
    800020a4:	00078c93          	mv	s9,a5
    800020a8:	f8040793          	addi	a5,s0,-128
    800020ac:	01978cb3          	add	s9,a5,s9
    800020b0:	f7f40d13          	addi	s10,s0,-129
    800020b4:	000cc503          	lbu	a0,0(s9)
    800020b8:	fffc8c93          	addi	s9,s9,-1
    800020bc:	00000097          	auipc	ra,0x0
    800020c0:	9f8080e7          	jalr	-1544(ra) # 80001ab4 <consputc>
    800020c4:	ff9d18e3          	bne	s10,s9,800020b4 <__printf+0x41c>
    800020c8:	0100006f          	j	800020d8 <__printf+0x440>
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	9e8080e7          	jalr	-1560(ra) # 80001ab4 <consputc>
    800020d4:	000c8493          	mv	s1,s9
    800020d8:	00094503          	lbu	a0,0(s2)
    800020dc:	c60510e3          	bnez	a0,80001d3c <__printf+0xa4>
    800020e0:	e40c0ee3          	beqz	s8,80001f3c <__printf+0x2a4>
    800020e4:	0000c517          	auipc	a0,0xc
    800020e8:	90c50513          	addi	a0,a0,-1780 # 8000d9f0 <pr>
    800020ec:	00001097          	auipc	ra,0x1
    800020f0:	94c080e7          	jalr	-1716(ra) # 80002a38 <release>
    800020f4:	e49ff06f          	j	80001f3c <__printf+0x2a4>
    800020f8:	f7843783          	ld	a5,-136(s0)
    800020fc:	03000513          	li	a0,48
    80002100:	01000d13          	li	s10,16
    80002104:	00878713          	addi	a4,a5,8
    80002108:	0007bc83          	ld	s9,0(a5)
    8000210c:	f6e43c23          	sd	a4,-136(s0)
    80002110:	00000097          	auipc	ra,0x0
    80002114:	9a4080e7          	jalr	-1628(ra) # 80001ab4 <consputc>
    80002118:	07800513          	li	a0,120
    8000211c:	00000097          	auipc	ra,0x0
    80002120:	998080e7          	jalr	-1640(ra) # 80001ab4 <consputc>
    80002124:	00008d97          	auipc	s11,0x8
    80002128:	79cd8d93          	addi	s11,s11,1948 # 8000a8c0 <digits>
    8000212c:	03ccd793          	srli	a5,s9,0x3c
    80002130:	00fd87b3          	add	a5,s11,a5
    80002134:	0007c503          	lbu	a0,0(a5)
    80002138:	fffd0d1b          	addiw	s10,s10,-1
    8000213c:	004c9c93          	slli	s9,s9,0x4
    80002140:	00000097          	auipc	ra,0x0
    80002144:	974080e7          	jalr	-1676(ra) # 80001ab4 <consputc>
    80002148:	fe0d12e3          	bnez	s10,8000212c <__printf+0x494>
    8000214c:	f8dff06f          	j	800020d8 <__printf+0x440>
    80002150:	f7843783          	ld	a5,-136(s0)
    80002154:	0007bc83          	ld	s9,0(a5)
    80002158:	00878793          	addi	a5,a5,8
    8000215c:	f6f43c23          	sd	a5,-136(s0)
    80002160:	000c9a63          	bnez	s9,80002174 <__printf+0x4dc>
    80002164:	1080006f          	j	8000226c <__printf+0x5d4>
    80002168:	001c8c93          	addi	s9,s9,1
    8000216c:	00000097          	auipc	ra,0x0
    80002170:	948080e7          	jalr	-1720(ra) # 80001ab4 <consputc>
    80002174:	000cc503          	lbu	a0,0(s9)
    80002178:	fe0518e3          	bnez	a0,80002168 <__printf+0x4d0>
    8000217c:	f5dff06f          	j	800020d8 <__printf+0x440>
    80002180:	02500513          	li	a0,37
    80002184:	00000097          	auipc	ra,0x0
    80002188:	930080e7          	jalr	-1744(ra) # 80001ab4 <consputc>
    8000218c:	000c8513          	mv	a0,s9
    80002190:	00000097          	auipc	ra,0x0
    80002194:	924080e7          	jalr	-1756(ra) # 80001ab4 <consputc>
    80002198:	f41ff06f          	j	800020d8 <__printf+0x440>
    8000219c:	02500513          	li	a0,37
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	914080e7          	jalr	-1772(ra) # 80001ab4 <consputc>
    800021a8:	f31ff06f          	j	800020d8 <__printf+0x440>
    800021ac:	00030513          	mv	a0,t1
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	7bc080e7          	jalr	1980(ra) # 8000296c <acquire>
    800021b8:	b4dff06f          	j	80001d04 <__printf+0x6c>
    800021bc:	40c0053b          	negw	a0,a2
    800021c0:	00a00713          	li	a4,10
    800021c4:	02e576bb          	remuw	a3,a0,a4
    800021c8:	00008d97          	auipc	s11,0x8
    800021cc:	6f8d8d93          	addi	s11,s11,1784 # 8000a8c0 <digits>
    800021d0:	ff700593          	li	a1,-9
    800021d4:	02069693          	slli	a3,a3,0x20
    800021d8:	0206d693          	srli	a3,a3,0x20
    800021dc:	00dd86b3          	add	a3,s11,a3
    800021e0:	0006c683          	lbu	a3,0(a3)
    800021e4:	02e557bb          	divuw	a5,a0,a4
    800021e8:	f8d40023          	sb	a3,-128(s0)
    800021ec:	10b65e63          	bge	a2,a1,80002308 <__printf+0x670>
    800021f0:	06300593          	li	a1,99
    800021f4:	02e7f6bb          	remuw	a3,a5,a4
    800021f8:	02069693          	slli	a3,a3,0x20
    800021fc:	0206d693          	srli	a3,a3,0x20
    80002200:	00dd86b3          	add	a3,s11,a3
    80002204:	0006c683          	lbu	a3,0(a3)
    80002208:	02e7d73b          	divuw	a4,a5,a4
    8000220c:	00200793          	li	a5,2
    80002210:	f8d400a3          	sb	a3,-127(s0)
    80002214:	bca5ece3          	bltu	a1,a0,80001dec <__printf+0x154>
    80002218:	ce5ff06f          	j	80001efc <__printf+0x264>
    8000221c:	40e007bb          	negw	a5,a4
    80002220:	00008d97          	auipc	s11,0x8
    80002224:	6a0d8d93          	addi	s11,s11,1696 # 8000a8c0 <digits>
    80002228:	00f7f693          	andi	a3,a5,15
    8000222c:	00dd86b3          	add	a3,s11,a3
    80002230:	0006c583          	lbu	a1,0(a3)
    80002234:	ff100613          	li	a2,-15
    80002238:	0047d69b          	srliw	a3,a5,0x4
    8000223c:	f8b40023          	sb	a1,-128(s0)
    80002240:	0047d59b          	srliw	a1,a5,0x4
    80002244:	0ac75e63          	bge	a4,a2,80002300 <__printf+0x668>
    80002248:	00f6f693          	andi	a3,a3,15
    8000224c:	00dd86b3          	add	a3,s11,a3
    80002250:	0006c603          	lbu	a2,0(a3)
    80002254:	00f00693          	li	a3,15
    80002258:	0087d79b          	srliw	a5,a5,0x8
    8000225c:	f8c400a3          	sb	a2,-127(s0)
    80002260:	d8b6e4e3          	bltu	a3,a1,80001fe8 <__printf+0x350>
    80002264:	00200793          	li	a5,2
    80002268:	e2dff06f          	j	80002094 <__printf+0x3fc>
    8000226c:	00008c97          	auipc	s9,0x8
    80002270:	634c8c93          	addi	s9,s9,1588 # 8000a8a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x248>
    80002274:	02800513          	li	a0,40
    80002278:	ef1ff06f          	j	80002168 <__printf+0x4d0>
    8000227c:	00700793          	li	a5,7
    80002280:	00600c93          	li	s9,6
    80002284:	e0dff06f          	j	80002090 <__printf+0x3f8>
    80002288:	00700793          	li	a5,7
    8000228c:	00600c93          	li	s9,6
    80002290:	c69ff06f          	j	80001ef8 <__printf+0x260>
    80002294:	00300793          	li	a5,3
    80002298:	00200c93          	li	s9,2
    8000229c:	c5dff06f          	j	80001ef8 <__printf+0x260>
    800022a0:	00300793          	li	a5,3
    800022a4:	00200c93          	li	s9,2
    800022a8:	de9ff06f          	j	80002090 <__printf+0x3f8>
    800022ac:	00400793          	li	a5,4
    800022b0:	00300c93          	li	s9,3
    800022b4:	dddff06f          	j	80002090 <__printf+0x3f8>
    800022b8:	00400793          	li	a5,4
    800022bc:	00300c93          	li	s9,3
    800022c0:	c39ff06f          	j	80001ef8 <__printf+0x260>
    800022c4:	00500793          	li	a5,5
    800022c8:	00400c93          	li	s9,4
    800022cc:	c2dff06f          	j	80001ef8 <__printf+0x260>
    800022d0:	00500793          	li	a5,5
    800022d4:	00400c93          	li	s9,4
    800022d8:	db9ff06f          	j	80002090 <__printf+0x3f8>
    800022dc:	00600793          	li	a5,6
    800022e0:	00500c93          	li	s9,5
    800022e4:	dadff06f          	j	80002090 <__printf+0x3f8>
    800022e8:	00600793          	li	a5,6
    800022ec:	00500c93          	li	s9,5
    800022f0:	c09ff06f          	j	80001ef8 <__printf+0x260>
    800022f4:	00800793          	li	a5,8
    800022f8:	00700c93          	li	s9,7
    800022fc:	bfdff06f          	j	80001ef8 <__printf+0x260>
    80002300:	00100793          	li	a5,1
    80002304:	d91ff06f          	j	80002094 <__printf+0x3fc>
    80002308:	00100793          	li	a5,1
    8000230c:	bf1ff06f          	j	80001efc <__printf+0x264>
    80002310:	00900793          	li	a5,9
    80002314:	00800c93          	li	s9,8
    80002318:	be1ff06f          	j	80001ef8 <__printf+0x260>
    8000231c:	00008517          	auipc	a0,0x8
    80002320:	58c50513          	addi	a0,a0,1420 # 8000a8a8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x250>
    80002324:	00000097          	auipc	ra,0x0
    80002328:	918080e7          	jalr	-1768(ra) # 80001c3c <panic>

000000008000232c <printfinit>:
    8000232c:	fe010113          	addi	sp,sp,-32
    80002330:	00813823          	sd	s0,16(sp)
    80002334:	00913423          	sd	s1,8(sp)
    80002338:	00113c23          	sd	ra,24(sp)
    8000233c:	02010413          	addi	s0,sp,32
    80002340:	0000b497          	auipc	s1,0xb
    80002344:	6b048493          	addi	s1,s1,1712 # 8000d9f0 <pr>
    80002348:	00048513          	mv	a0,s1
    8000234c:	00008597          	auipc	a1,0x8
    80002350:	56c58593          	addi	a1,a1,1388 # 8000a8b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x260>
    80002354:	00000097          	auipc	ra,0x0
    80002358:	5f4080e7          	jalr	1524(ra) # 80002948 <initlock>
    8000235c:	01813083          	ld	ra,24(sp)
    80002360:	01013403          	ld	s0,16(sp)
    80002364:	0004ac23          	sw	zero,24(s1)
    80002368:	00813483          	ld	s1,8(sp)
    8000236c:	02010113          	addi	sp,sp,32
    80002370:	00008067          	ret

0000000080002374 <uartinit>:
    80002374:	ff010113          	addi	sp,sp,-16
    80002378:	00813423          	sd	s0,8(sp)
    8000237c:	01010413          	addi	s0,sp,16
    80002380:	100007b7          	lui	a5,0x10000
    80002384:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002388:	f8000713          	li	a4,-128
    8000238c:	00e781a3          	sb	a4,3(a5)
    80002390:	00300713          	li	a4,3
    80002394:	00e78023          	sb	a4,0(a5)
    80002398:	000780a3          	sb	zero,1(a5)
    8000239c:	00e781a3          	sb	a4,3(a5)
    800023a0:	00700693          	li	a3,7
    800023a4:	00d78123          	sb	a3,2(a5)
    800023a8:	00e780a3          	sb	a4,1(a5)
    800023ac:	00813403          	ld	s0,8(sp)
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret

00000000800023b8 <uartputc>:
    800023b8:	0000a797          	auipc	a5,0xa
    800023bc:	3907a783          	lw	a5,912(a5) # 8000c748 <panicked>
    800023c0:	00078463          	beqz	a5,800023c8 <uartputc+0x10>
    800023c4:	0000006f          	j	800023c4 <uartputc+0xc>
    800023c8:	fd010113          	addi	sp,sp,-48
    800023cc:	02813023          	sd	s0,32(sp)
    800023d0:	00913c23          	sd	s1,24(sp)
    800023d4:	01213823          	sd	s2,16(sp)
    800023d8:	01313423          	sd	s3,8(sp)
    800023dc:	02113423          	sd	ra,40(sp)
    800023e0:	03010413          	addi	s0,sp,48
    800023e4:	0000a917          	auipc	s2,0xa
    800023e8:	36c90913          	addi	s2,s2,876 # 8000c750 <uart_tx_r>
    800023ec:	00093783          	ld	a5,0(s2)
    800023f0:	0000a497          	auipc	s1,0xa
    800023f4:	36848493          	addi	s1,s1,872 # 8000c758 <uart_tx_w>
    800023f8:	0004b703          	ld	a4,0(s1)
    800023fc:	02078693          	addi	a3,a5,32
    80002400:	00050993          	mv	s3,a0
    80002404:	02e69c63          	bne	a3,a4,8000243c <uartputc+0x84>
    80002408:	00001097          	auipc	ra,0x1
    8000240c:	834080e7          	jalr	-1996(ra) # 80002c3c <push_on>
    80002410:	00093783          	ld	a5,0(s2)
    80002414:	0004b703          	ld	a4,0(s1)
    80002418:	02078793          	addi	a5,a5,32
    8000241c:	00e79463          	bne	a5,a4,80002424 <uartputc+0x6c>
    80002420:	0000006f          	j	80002420 <uartputc+0x68>
    80002424:	00001097          	auipc	ra,0x1
    80002428:	88c080e7          	jalr	-1908(ra) # 80002cb0 <pop_on>
    8000242c:	00093783          	ld	a5,0(s2)
    80002430:	0004b703          	ld	a4,0(s1)
    80002434:	02078693          	addi	a3,a5,32
    80002438:	fce688e3          	beq	a3,a4,80002408 <uartputc+0x50>
    8000243c:	01f77693          	andi	a3,a4,31
    80002440:	0000b597          	auipc	a1,0xb
    80002444:	5d058593          	addi	a1,a1,1488 # 8000da10 <uart_tx_buf>
    80002448:	00d586b3          	add	a3,a1,a3
    8000244c:	00170713          	addi	a4,a4,1
    80002450:	01368023          	sb	s3,0(a3)
    80002454:	00e4b023          	sd	a4,0(s1)
    80002458:	10000637          	lui	a2,0x10000
    8000245c:	02f71063          	bne	a4,a5,8000247c <uartputc+0xc4>
    80002460:	0340006f          	j	80002494 <uartputc+0xdc>
    80002464:	00074703          	lbu	a4,0(a4)
    80002468:	00f93023          	sd	a5,0(s2)
    8000246c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002470:	00093783          	ld	a5,0(s2)
    80002474:	0004b703          	ld	a4,0(s1)
    80002478:	00f70e63          	beq	a4,a5,80002494 <uartputc+0xdc>
    8000247c:	00564683          	lbu	a3,5(a2)
    80002480:	01f7f713          	andi	a4,a5,31
    80002484:	00e58733          	add	a4,a1,a4
    80002488:	0206f693          	andi	a3,a3,32
    8000248c:	00178793          	addi	a5,a5,1
    80002490:	fc069ae3          	bnez	a3,80002464 <uartputc+0xac>
    80002494:	02813083          	ld	ra,40(sp)
    80002498:	02013403          	ld	s0,32(sp)
    8000249c:	01813483          	ld	s1,24(sp)
    800024a0:	01013903          	ld	s2,16(sp)
    800024a4:	00813983          	ld	s3,8(sp)
    800024a8:	03010113          	addi	sp,sp,48
    800024ac:	00008067          	ret

00000000800024b0 <uartputc_sync>:
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00813423          	sd	s0,8(sp)
    800024b8:	01010413          	addi	s0,sp,16
    800024bc:	0000a717          	auipc	a4,0xa
    800024c0:	28c72703          	lw	a4,652(a4) # 8000c748 <panicked>
    800024c4:	02071663          	bnez	a4,800024f0 <uartputc_sync+0x40>
    800024c8:	00050793          	mv	a5,a0
    800024cc:	100006b7          	lui	a3,0x10000
    800024d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800024d4:	02077713          	andi	a4,a4,32
    800024d8:	fe070ce3          	beqz	a4,800024d0 <uartputc_sync+0x20>
    800024dc:	0ff7f793          	andi	a5,a5,255
    800024e0:	00f68023          	sb	a5,0(a3)
    800024e4:	00813403          	ld	s0,8(sp)
    800024e8:	01010113          	addi	sp,sp,16
    800024ec:	00008067          	ret
    800024f0:	0000006f          	j	800024f0 <uartputc_sync+0x40>

00000000800024f4 <uartstart>:
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00813423          	sd	s0,8(sp)
    800024fc:	01010413          	addi	s0,sp,16
    80002500:	0000a617          	auipc	a2,0xa
    80002504:	25060613          	addi	a2,a2,592 # 8000c750 <uart_tx_r>
    80002508:	0000a517          	auipc	a0,0xa
    8000250c:	25050513          	addi	a0,a0,592 # 8000c758 <uart_tx_w>
    80002510:	00063783          	ld	a5,0(a2)
    80002514:	00053703          	ld	a4,0(a0)
    80002518:	04f70263          	beq	a4,a5,8000255c <uartstart+0x68>
    8000251c:	100005b7          	lui	a1,0x10000
    80002520:	0000b817          	auipc	a6,0xb
    80002524:	4f080813          	addi	a6,a6,1264 # 8000da10 <uart_tx_buf>
    80002528:	01c0006f          	j	80002544 <uartstart+0x50>
    8000252c:	0006c703          	lbu	a4,0(a3)
    80002530:	00f63023          	sd	a5,0(a2)
    80002534:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002538:	00063783          	ld	a5,0(a2)
    8000253c:	00053703          	ld	a4,0(a0)
    80002540:	00f70e63          	beq	a4,a5,8000255c <uartstart+0x68>
    80002544:	01f7f713          	andi	a4,a5,31
    80002548:	00e806b3          	add	a3,a6,a4
    8000254c:	0055c703          	lbu	a4,5(a1)
    80002550:	00178793          	addi	a5,a5,1
    80002554:	02077713          	andi	a4,a4,32
    80002558:	fc071ae3          	bnez	a4,8000252c <uartstart+0x38>
    8000255c:	00813403          	ld	s0,8(sp)
    80002560:	01010113          	addi	sp,sp,16
    80002564:	00008067          	ret

0000000080002568 <uartgetc>:
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00813423          	sd	s0,8(sp)
    80002570:	01010413          	addi	s0,sp,16
    80002574:	10000737          	lui	a4,0x10000
    80002578:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000257c:	0017f793          	andi	a5,a5,1
    80002580:	00078c63          	beqz	a5,80002598 <uartgetc+0x30>
    80002584:	00074503          	lbu	a0,0(a4)
    80002588:	0ff57513          	andi	a0,a0,255
    8000258c:	00813403          	ld	s0,8(sp)
    80002590:	01010113          	addi	sp,sp,16
    80002594:	00008067          	ret
    80002598:	fff00513          	li	a0,-1
    8000259c:	ff1ff06f          	j	8000258c <uartgetc+0x24>

00000000800025a0 <uartintr>:
    800025a0:	100007b7          	lui	a5,0x10000
    800025a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800025a8:	0017f793          	andi	a5,a5,1
    800025ac:	0a078463          	beqz	a5,80002654 <uartintr+0xb4>
    800025b0:	fe010113          	addi	sp,sp,-32
    800025b4:	00813823          	sd	s0,16(sp)
    800025b8:	00913423          	sd	s1,8(sp)
    800025bc:	00113c23          	sd	ra,24(sp)
    800025c0:	02010413          	addi	s0,sp,32
    800025c4:	100004b7          	lui	s1,0x10000
    800025c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800025cc:	0ff57513          	andi	a0,a0,255
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	534080e7          	jalr	1332(ra) # 80001b04 <consoleintr>
    800025d8:	0054c783          	lbu	a5,5(s1)
    800025dc:	0017f793          	andi	a5,a5,1
    800025e0:	fe0794e3          	bnez	a5,800025c8 <uartintr+0x28>
    800025e4:	0000a617          	auipc	a2,0xa
    800025e8:	16c60613          	addi	a2,a2,364 # 8000c750 <uart_tx_r>
    800025ec:	0000a517          	auipc	a0,0xa
    800025f0:	16c50513          	addi	a0,a0,364 # 8000c758 <uart_tx_w>
    800025f4:	00063783          	ld	a5,0(a2)
    800025f8:	00053703          	ld	a4,0(a0)
    800025fc:	04f70263          	beq	a4,a5,80002640 <uartintr+0xa0>
    80002600:	100005b7          	lui	a1,0x10000
    80002604:	0000b817          	auipc	a6,0xb
    80002608:	40c80813          	addi	a6,a6,1036 # 8000da10 <uart_tx_buf>
    8000260c:	01c0006f          	j	80002628 <uartintr+0x88>
    80002610:	0006c703          	lbu	a4,0(a3)
    80002614:	00f63023          	sd	a5,0(a2)
    80002618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000261c:	00063783          	ld	a5,0(a2)
    80002620:	00053703          	ld	a4,0(a0)
    80002624:	00f70e63          	beq	a4,a5,80002640 <uartintr+0xa0>
    80002628:	01f7f713          	andi	a4,a5,31
    8000262c:	00e806b3          	add	a3,a6,a4
    80002630:	0055c703          	lbu	a4,5(a1)
    80002634:	00178793          	addi	a5,a5,1
    80002638:	02077713          	andi	a4,a4,32
    8000263c:	fc071ae3          	bnez	a4,80002610 <uartintr+0x70>
    80002640:	01813083          	ld	ra,24(sp)
    80002644:	01013403          	ld	s0,16(sp)
    80002648:	00813483          	ld	s1,8(sp)
    8000264c:	02010113          	addi	sp,sp,32
    80002650:	00008067          	ret
    80002654:	0000a617          	auipc	a2,0xa
    80002658:	0fc60613          	addi	a2,a2,252 # 8000c750 <uart_tx_r>
    8000265c:	0000a517          	auipc	a0,0xa
    80002660:	0fc50513          	addi	a0,a0,252 # 8000c758 <uart_tx_w>
    80002664:	00063783          	ld	a5,0(a2)
    80002668:	00053703          	ld	a4,0(a0)
    8000266c:	04f70263          	beq	a4,a5,800026b0 <uartintr+0x110>
    80002670:	100005b7          	lui	a1,0x10000
    80002674:	0000b817          	auipc	a6,0xb
    80002678:	39c80813          	addi	a6,a6,924 # 8000da10 <uart_tx_buf>
    8000267c:	01c0006f          	j	80002698 <uartintr+0xf8>
    80002680:	0006c703          	lbu	a4,0(a3)
    80002684:	00f63023          	sd	a5,0(a2)
    80002688:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000268c:	00063783          	ld	a5,0(a2)
    80002690:	00053703          	ld	a4,0(a0)
    80002694:	02f70063          	beq	a4,a5,800026b4 <uartintr+0x114>
    80002698:	01f7f713          	andi	a4,a5,31
    8000269c:	00e806b3          	add	a3,a6,a4
    800026a0:	0055c703          	lbu	a4,5(a1)
    800026a4:	00178793          	addi	a5,a5,1
    800026a8:	02077713          	andi	a4,a4,32
    800026ac:	fc071ae3          	bnez	a4,80002680 <uartintr+0xe0>
    800026b0:	00008067          	ret
    800026b4:	00008067          	ret

00000000800026b8 <kinit>:
    800026b8:	fc010113          	addi	sp,sp,-64
    800026bc:	02913423          	sd	s1,40(sp)
    800026c0:	fffff7b7          	lui	a5,0xfffff
    800026c4:	0000c497          	auipc	s1,0xc
    800026c8:	36b48493          	addi	s1,s1,875 # 8000ea2f <end+0xfff>
    800026cc:	02813823          	sd	s0,48(sp)
    800026d0:	01313c23          	sd	s3,24(sp)
    800026d4:	00f4f4b3          	and	s1,s1,a5
    800026d8:	02113c23          	sd	ra,56(sp)
    800026dc:	03213023          	sd	s2,32(sp)
    800026e0:	01413823          	sd	s4,16(sp)
    800026e4:	01513423          	sd	s5,8(sp)
    800026e8:	04010413          	addi	s0,sp,64
    800026ec:	000017b7          	lui	a5,0x1
    800026f0:	01100993          	li	s3,17
    800026f4:	00f487b3          	add	a5,s1,a5
    800026f8:	01b99993          	slli	s3,s3,0x1b
    800026fc:	06f9e063          	bltu	s3,a5,8000275c <kinit+0xa4>
    80002700:	0000ba97          	auipc	s5,0xb
    80002704:	330a8a93          	addi	s5,s5,816 # 8000da30 <end>
    80002708:	0754ec63          	bltu	s1,s5,80002780 <kinit+0xc8>
    8000270c:	0734fa63          	bgeu	s1,s3,80002780 <kinit+0xc8>
    80002710:	00088a37          	lui	s4,0x88
    80002714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002718:	0000a917          	auipc	s2,0xa
    8000271c:	04890913          	addi	s2,s2,72 # 8000c760 <kmem>
    80002720:	00ca1a13          	slli	s4,s4,0xc
    80002724:	0140006f          	j	80002738 <kinit+0x80>
    80002728:	000017b7          	lui	a5,0x1
    8000272c:	00f484b3          	add	s1,s1,a5
    80002730:	0554e863          	bltu	s1,s5,80002780 <kinit+0xc8>
    80002734:	0534f663          	bgeu	s1,s3,80002780 <kinit+0xc8>
    80002738:	00001637          	lui	a2,0x1
    8000273c:	00100593          	li	a1,1
    80002740:	00048513          	mv	a0,s1
    80002744:	00000097          	auipc	ra,0x0
    80002748:	5e4080e7          	jalr	1508(ra) # 80002d28 <__memset>
    8000274c:	00093783          	ld	a5,0(s2)
    80002750:	00f4b023          	sd	a5,0(s1)
    80002754:	00993023          	sd	s1,0(s2)
    80002758:	fd4498e3          	bne	s1,s4,80002728 <kinit+0x70>
    8000275c:	03813083          	ld	ra,56(sp)
    80002760:	03013403          	ld	s0,48(sp)
    80002764:	02813483          	ld	s1,40(sp)
    80002768:	02013903          	ld	s2,32(sp)
    8000276c:	01813983          	ld	s3,24(sp)
    80002770:	01013a03          	ld	s4,16(sp)
    80002774:	00813a83          	ld	s5,8(sp)
    80002778:	04010113          	addi	sp,sp,64
    8000277c:	00008067          	ret
    80002780:	00008517          	auipc	a0,0x8
    80002784:	15850513          	addi	a0,a0,344 # 8000a8d8 <digits+0x18>
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	4b4080e7          	jalr	1204(ra) # 80001c3c <panic>

0000000080002790 <freerange>:
    80002790:	fc010113          	addi	sp,sp,-64
    80002794:	000017b7          	lui	a5,0x1
    80002798:	02913423          	sd	s1,40(sp)
    8000279c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800027a0:	009504b3          	add	s1,a0,s1
    800027a4:	fffff537          	lui	a0,0xfffff
    800027a8:	02813823          	sd	s0,48(sp)
    800027ac:	02113c23          	sd	ra,56(sp)
    800027b0:	03213023          	sd	s2,32(sp)
    800027b4:	01313c23          	sd	s3,24(sp)
    800027b8:	01413823          	sd	s4,16(sp)
    800027bc:	01513423          	sd	s5,8(sp)
    800027c0:	01613023          	sd	s6,0(sp)
    800027c4:	04010413          	addi	s0,sp,64
    800027c8:	00a4f4b3          	and	s1,s1,a0
    800027cc:	00f487b3          	add	a5,s1,a5
    800027d0:	06f5e463          	bltu	a1,a5,80002838 <freerange+0xa8>
    800027d4:	0000ba97          	auipc	s5,0xb
    800027d8:	25ca8a93          	addi	s5,s5,604 # 8000da30 <end>
    800027dc:	0954e263          	bltu	s1,s5,80002860 <freerange+0xd0>
    800027e0:	01100993          	li	s3,17
    800027e4:	01b99993          	slli	s3,s3,0x1b
    800027e8:	0734fc63          	bgeu	s1,s3,80002860 <freerange+0xd0>
    800027ec:	00058a13          	mv	s4,a1
    800027f0:	0000a917          	auipc	s2,0xa
    800027f4:	f7090913          	addi	s2,s2,-144 # 8000c760 <kmem>
    800027f8:	00002b37          	lui	s6,0x2
    800027fc:	0140006f          	j	80002810 <freerange+0x80>
    80002800:	000017b7          	lui	a5,0x1
    80002804:	00f484b3          	add	s1,s1,a5
    80002808:	0554ec63          	bltu	s1,s5,80002860 <freerange+0xd0>
    8000280c:	0534fa63          	bgeu	s1,s3,80002860 <freerange+0xd0>
    80002810:	00001637          	lui	a2,0x1
    80002814:	00100593          	li	a1,1
    80002818:	00048513          	mv	a0,s1
    8000281c:	00000097          	auipc	ra,0x0
    80002820:	50c080e7          	jalr	1292(ra) # 80002d28 <__memset>
    80002824:	00093703          	ld	a4,0(s2)
    80002828:	016487b3          	add	a5,s1,s6
    8000282c:	00e4b023          	sd	a4,0(s1)
    80002830:	00993023          	sd	s1,0(s2)
    80002834:	fcfa76e3          	bgeu	s4,a5,80002800 <freerange+0x70>
    80002838:	03813083          	ld	ra,56(sp)
    8000283c:	03013403          	ld	s0,48(sp)
    80002840:	02813483          	ld	s1,40(sp)
    80002844:	02013903          	ld	s2,32(sp)
    80002848:	01813983          	ld	s3,24(sp)
    8000284c:	01013a03          	ld	s4,16(sp)
    80002850:	00813a83          	ld	s5,8(sp)
    80002854:	00013b03          	ld	s6,0(sp)
    80002858:	04010113          	addi	sp,sp,64
    8000285c:	00008067          	ret
    80002860:	00008517          	auipc	a0,0x8
    80002864:	07850513          	addi	a0,a0,120 # 8000a8d8 <digits+0x18>
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	3d4080e7          	jalr	980(ra) # 80001c3c <panic>

0000000080002870 <kfree>:
    80002870:	fe010113          	addi	sp,sp,-32
    80002874:	00813823          	sd	s0,16(sp)
    80002878:	00113c23          	sd	ra,24(sp)
    8000287c:	00913423          	sd	s1,8(sp)
    80002880:	02010413          	addi	s0,sp,32
    80002884:	03451793          	slli	a5,a0,0x34
    80002888:	04079c63          	bnez	a5,800028e0 <kfree+0x70>
    8000288c:	0000b797          	auipc	a5,0xb
    80002890:	1a478793          	addi	a5,a5,420 # 8000da30 <end>
    80002894:	00050493          	mv	s1,a0
    80002898:	04f56463          	bltu	a0,a5,800028e0 <kfree+0x70>
    8000289c:	01100793          	li	a5,17
    800028a0:	01b79793          	slli	a5,a5,0x1b
    800028a4:	02f57e63          	bgeu	a0,a5,800028e0 <kfree+0x70>
    800028a8:	00001637          	lui	a2,0x1
    800028ac:	00100593          	li	a1,1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	478080e7          	jalr	1144(ra) # 80002d28 <__memset>
    800028b8:	0000a797          	auipc	a5,0xa
    800028bc:	ea878793          	addi	a5,a5,-344 # 8000c760 <kmem>
    800028c0:	0007b703          	ld	a4,0(a5)
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00e4b023          	sd	a4,0(s1)
    800028d0:	0097b023          	sd	s1,0(a5)
    800028d4:	00813483          	ld	s1,8(sp)
    800028d8:	02010113          	addi	sp,sp,32
    800028dc:	00008067          	ret
    800028e0:	00008517          	auipc	a0,0x8
    800028e4:	ff850513          	addi	a0,a0,-8 # 8000a8d8 <digits+0x18>
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	354080e7          	jalr	852(ra) # 80001c3c <panic>

00000000800028f0 <kalloc>:
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00813823          	sd	s0,16(sp)
    800028f8:	00913423          	sd	s1,8(sp)
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	02010413          	addi	s0,sp,32
    80002904:	0000a797          	auipc	a5,0xa
    80002908:	e5c78793          	addi	a5,a5,-420 # 8000c760 <kmem>
    8000290c:	0007b483          	ld	s1,0(a5)
    80002910:	02048063          	beqz	s1,80002930 <kalloc+0x40>
    80002914:	0004b703          	ld	a4,0(s1)
    80002918:	00001637          	lui	a2,0x1
    8000291c:	00500593          	li	a1,5
    80002920:	00048513          	mv	a0,s1
    80002924:	00e7b023          	sd	a4,0(a5)
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	400080e7          	jalr	1024(ra) # 80002d28 <__memset>
    80002930:	01813083          	ld	ra,24(sp)
    80002934:	01013403          	ld	s0,16(sp)
    80002938:	00048513          	mv	a0,s1
    8000293c:	00813483          	ld	s1,8(sp)
    80002940:	02010113          	addi	sp,sp,32
    80002944:	00008067          	ret

0000000080002948 <initlock>:
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00813423          	sd	s0,8(sp)
    80002950:	01010413          	addi	s0,sp,16
    80002954:	00813403          	ld	s0,8(sp)
    80002958:	00b53423          	sd	a1,8(a0)
    8000295c:	00052023          	sw	zero,0(a0)
    80002960:	00053823          	sd	zero,16(a0)
    80002964:	01010113          	addi	sp,sp,16
    80002968:	00008067          	ret

000000008000296c <acquire>:
    8000296c:	fe010113          	addi	sp,sp,-32
    80002970:	00813823          	sd	s0,16(sp)
    80002974:	00913423          	sd	s1,8(sp)
    80002978:	00113c23          	sd	ra,24(sp)
    8000297c:	01213023          	sd	s2,0(sp)
    80002980:	02010413          	addi	s0,sp,32
    80002984:	00050493          	mv	s1,a0
    80002988:	10002973          	csrr	s2,sstatus
    8000298c:	100027f3          	csrr	a5,sstatus
    80002990:	ffd7f793          	andi	a5,a5,-3
    80002994:	10079073          	csrw	sstatus,a5
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	8ec080e7          	jalr	-1812(ra) # 80001284 <mycpu>
    800029a0:	07852783          	lw	a5,120(a0)
    800029a4:	06078e63          	beqz	a5,80002a20 <acquire+0xb4>
    800029a8:	fffff097          	auipc	ra,0xfffff
    800029ac:	8dc080e7          	jalr	-1828(ra) # 80001284 <mycpu>
    800029b0:	07852783          	lw	a5,120(a0)
    800029b4:	0004a703          	lw	a4,0(s1)
    800029b8:	0017879b          	addiw	a5,a5,1
    800029bc:	06f52c23          	sw	a5,120(a0)
    800029c0:	04071063          	bnez	a4,80002a00 <acquire+0x94>
    800029c4:	00100713          	li	a4,1
    800029c8:	00070793          	mv	a5,a4
    800029cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800029d0:	0007879b          	sext.w	a5,a5
    800029d4:	fe079ae3          	bnez	a5,800029c8 <acquire+0x5c>
    800029d8:	0ff0000f          	fence
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	8a8080e7          	jalr	-1880(ra) # 80001284 <mycpu>
    800029e4:	01813083          	ld	ra,24(sp)
    800029e8:	01013403          	ld	s0,16(sp)
    800029ec:	00a4b823          	sd	a0,16(s1)
    800029f0:	00013903          	ld	s2,0(sp)
    800029f4:	00813483          	ld	s1,8(sp)
    800029f8:	02010113          	addi	sp,sp,32
    800029fc:	00008067          	ret
    80002a00:	0104b903          	ld	s2,16(s1)
    80002a04:	fffff097          	auipc	ra,0xfffff
    80002a08:	880080e7          	jalr	-1920(ra) # 80001284 <mycpu>
    80002a0c:	faa91ce3          	bne	s2,a0,800029c4 <acquire+0x58>
    80002a10:	00008517          	auipc	a0,0x8
    80002a14:	ed050513          	addi	a0,a0,-304 # 8000a8e0 <digits+0x20>
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	224080e7          	jalr	548(ra) # 80001c3c <panic>
    80002a20:	00195913          	srli	s2,s2,0x1
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	860080e7          	jalr	-1952(ra) # 80001284 <mycpu>
    80002a2c:	00197913          	andi	s2,s2,1
    80002a30:	07252e23          	sw	s2,124(a0)
    80002a34:	f75ff06f          	j	800029a8 <acquire+0x3c>

0000000080002a38 <release>:
    80002a38:	fe010113          	addi	sp,sp,-32
    80002a3c:	00813823          	sd	s0,16(sp)
    80002a40:	00113c23          	sd	ra,24(sp)
    80002a44:	00913423          	sd	s1,8(sp)
    80002a48:	01213023          	sd	s2,0(sp)
    80002a4c:	02010413          	addi	s0,sp,32
    80002a50:	00052783          	lw	a5,0(a0)
    80002a54:	00079a63          	bnez	a5,80002a68 <release+0x30>
    80002a58:	00008517          	auipc	a0,0x8
    80002a5c:	e9050513          	addi	a0,a0,-368 # 8000a8e8 <digits+0x28>
    80002a60:	fffff097          	auipc	ra,0xfffff
    80002a64:	1dc080e7          	jalr	476(ra) # 80001c3c <panic>
    80002a68:	01053903          	ld	s2,16(a0)
    80002a6c:	00050493          	mv	s1,a0
    80002a70:	fffff097          	auipc	ra,0xfffff
    80002a74:	814080e7          	jalr	-2028(ra) # 80001284 <mycpu>
    80002a78:	fea910e3          	bne	s2,a0,80002a58 <release+0x20>
    80002a7c:	0004b823          	sd	zero,16(s1)
    80002a80:	0ff0000f          	fence
    80002a84:	0f50000f          	fence	iorw,ow
    80002a88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002a8c:	ffffe097          	auipc	ra,0xffffe
    80002a90:	7f8080e7          	jalr	2040(ra) # 80001284 <mycpu>
    80002a94:	100027f3          	csrr	a5,sstatus
    80002a98:	0027f793          	andi	a5,a5,2
    80002a9c:	04079a63          	bnez	a5,80002af0 <release+0xb8>
    80002aa0:	07852783          	lw	a5,120(a0)
    80002aa4:	02f05e63          	blez	a5,80002ae0 <release+0xa8>
    80002aa8:	fff7871b          	addiw	a4,a5,-1
    80002aac:	06e52c23          	sw	a4,120(a0)
    80002ab0:	00071c63          	bnez	a4,80002ac8 <release+0x90>
    80002ab4:	07c52783          	lw	a5,124(a0)
    80002ab8:	00078863          	beqz	a5,80002ac8 <release+0x90>
    80002abc:	100027f3          	csrr	a5,sstatus
    80002ac0:	0027e793          	ori	a5,a5,2
    80002ac4:	10079073          	csrw	sstatus,a5
    80002ac8:	01813083          	ld	ra,24(sp)
    80002acc:	01013403          	ld	s0,16(sp)
    80002ad0:	00813483          	ld	s1,8(sp)
    80002ad4:	00013903          	ld	s2,0(sp)
    80002ad8:	02010113          	addi	sp,sp,32
    80002adc:	00008067          	ret
    80002ae0:	00008517          	auipc	a0,0x8
    80002ae4:	e2850513          	addi	a0,a0,-472 # 8000a908 <digits+0x48>
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	154080e7          	jalr	340(ra) # 80001c3c <panic>
    80002af0:	00008517          	auipc	a0,0x8
    80002af4:	e0050513          	addi	a0,a0,-512 # 8000a8f0 <digits+0x30>
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	144080e7          	jalr	324(ra) # 80001c3c <panic>

0000000080002b00 <holding>:
    80002b00:	00052783          	lw	a5,0(a0)
    80002b04:	00079663          	bnez	a5,80002b10 <holding+0x10>
    80002b08:	00000513          	li	a0,0
    80002b0c:	00008067          	ret
    80002b10:	fe010113          	addi	sp,sp,-32
    80002b14:	00813823          	sd	s0,16(sp)
    80002b18:	00913423          	sd	s1,8(sp)
    80002b1c:	00113c23          	sd	ra,24(sp)
    80002b20:	02010413          	addi	s0,sp,32
    80002b24:	01053483          	ld	s1,16(a0)
    80002b28:	ffffe097          	auipc	ra,0xffffe
    80002b2c:	75c080e7          	jalr	1884(ra) # 80001284 <mycpu>
    80002b30:	01813083          	ld	ra,24(sp)
    80002b34:	01013403          	ld	s0,16(sp)
    80002b38:	40a48533          	sub	a0,s1,a0
    80002b3c:	00153513          	seqz	a0,a0
    80002b40:	00813483          	ld	s1,8(sp)
    80002b44:	02010113          	addi	sp,sp,32
    80002b48:	00008067          	ret

0000000080002b4c <push_off>:
    80002b4c:	fe010113          	addi	sp,sp,-32
    80002b50:	00813823          	sd	s0,16(sp)
    80002b54:	00113c23          	sd	ra,24(sp)
    80002b58:	00913423          	sd	s1,8(sp)
    80002b5c:	02010413          	addi	s0,sp,32
    80002b60:	100024f3          	csrr	s1,sstatus
    80002b64:	100027f3          	csrr	a5,sstatus
    80002b68:	ffd7f793          	andi	a5,a5,-3
    80002b6c:	10079073          	csrw	sstatus,a5
    80002b70:	ffffe097          	auipc	ra,0xffffe
    80002b74:	714080e7          	jalr	1812(ra) # 80001284 <mycpu>
    80002b78:	07852783          	lw	a5,120(a0)
    80002b7c:	02078663          	beqz	a5,80002ba8 <push_off+0x5c>
    80002b80:	ffffe097          	auipc	ra,0xffffe
    80002b84:	704080e7          	jalr	1796(ra) # 80001284 <mycpu>
    80002b88:	07852783          	lw	a5,120(a0)
    80002b8c:	01813083          	ld	ra,24(sp)
    80002b90:	01013403          	ld	s0,16(sp)
    80002b94:	0017879b          	addiw	a5,a5,1
    80002b98:	06f52c23          	sw	a5,120(a0)
    80002b9c:	00813483          	ld	s1,8(sp)
    80002ba0:	02010113          	addi	sp,sp,32
    80002ba4:	00008067          	ret
    80002ba8:	0014d493          	srli	s1,s1,0x1
    80002bac:	ffffe097          	auipc	ra,0xffffe
    80002bb0:	6d8080e7          	jalr	1752(ra) # 80001284 <mycpu>
    80002bb4:	0014f493          	andi	s1,s1,1
    80002bb8:	06952e23          	sw	s1,124(a0)
    80002bbc:	fc5ff06f          	j	80002b80 <push_off+0x34>

0000000080002bc0 <pop_off>:
    80002bc0:	ff010113          	addi	sp,sp,-16
    80002bc4:	00813023          	sd	s0,0(sp)
    80002bc8:	00113423          	sd	ra,8(sp)
    80002bcc:	01010413          	addi	s0,sp,16
    80002bd0:	ffffe097          	auipc	ra,0xffffe
    80002bd4:	6b4080e7          	jalr	1716(ra) # 80001284 <mycpu>
    80002bd8:	100027f3          	csrr	a5,sstatus
    80002bdc:	0027f793          	andi	a5,a5,2
    80002be0:	04079663          	bnez	a5,80002c2c <pop_off+0x6c>
    80002be4:	07852783          	lw	a5,120(a0)
    80002be8:	02f05a63          	blez	a5,80002c1c <pop_off+0x5c>
    80002bec:	fff7871b          	addiw	a4,a5,-1
    80002bf0:	06e52c23          	sw	a4,120(a0)
    80002bf4:	00071c63          	bnez	a4,80002c0c <pop_off+0x4c>
    80002bf8:	07c52783          	lw	a5,124(a0)
    80002bfc:	00078863          	beqz	a5,80002c0c <pop_off+0x4c>
    80002c00:	100027f3          	csrr	a5,sstatus
    80002c04:	0027e793          	ori	a5,a5,2
    80002c08:	10079073          	csrw	sstatus,a5
    80002c0c:	00813083          	ld	ra,8(sp)
    80002c10:	00013403          	ld	s0,0(sp)
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00008067          	ret
    80002c1c:	00008517          	auipc	a0,0x8
    80002c20:	cec50513          	addi	a0,a0,-788 # 8000a908 <digits+0x48>
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	018080e7          	jalr	24(ra) # 80001c3c <panic>
    80002c2c:	00008517          	auipc	a0,0x8
    80002c30:	cc450513          	addi	a0,a0,-828 # 8000a8f0 <digits+0x30>
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	008080e7          	jalr	8(ra) # 80001c3c <panic>

0000000080002c3c <push_on>:
    80002c3c:	fe010113          	addi	sp,sp,-32
    80002c40:	00813823          	sd	s0,16(sp)
    80002c44:	00113c23          	sd	ra,24(sp)
    80002c48:	00913423          	sd	s1,8(sp)
    80002c4c:	02010413          	addi	s0,sp,32
    80002c50:	100024f3          	csrr	s1,sstatus
    80002c54:	100027f3          	csrr	a5,sstatus
    80002c58:	0027e793          	ori	a5,a5,2
    80002c5c:	10079073          	csrw	sstatus,a5
    80002c60:	ffffe097          	auipc	ra,0xffffe
    80002c64:	624080e7          	jalr	1572(ra) # 80001284 <mycpu>
    80002c68:	07852783          	lw	a5,120(a0)
    80002c6c:	02078663          	beqz	a5,80002c98 <push_on+0x5c>
    80002c70:	ffffe097          	auipc	ra,0xffffe
    80002c74:	614080e7          	jalr	1556(ra) # 80001284 <mycpu>
    80002c78:	07852783          	lw	a5,120(a0)
    80002c7c:	01813083          	ld	ra,24(sp)
    80002c80:	01013403          	ld	s0,16(sp)
    80002c84:	0017879b          	addiw	a5,a5,1
    80002c88:	06f52c23          	sw	a5,120(a0)
    80002c8c:	00813483          	ld	s1,8(sp)
    80002c90:	02010113          	addi	sp,sp,32
    80002c94:	00008067          	ret
    80002c98:	0014d493          	srli	s1,s1,0x1
    80002c9c:	ffffe097          	auipc	ra,0xffffe
    80002ca0:	5e8080e7          	jalr	1512(ra) # 80001284 <mycpu>
    80002ca4:	0014f493          	andi	s1,s1,1
    80002ca8:	06952e23          	sw	s1,124(a0)
    80002cac:	fc5ff06f          	j	80002c70 <push_on+0x34>

0000000080002cb0 <pop_on>:
    80002cb0:	ff010113          	addi	sp,sp,-16
    80002cb4:	00813023          	sd	s0,0(sp)
    80002cb8:	00113423          	sd	ra,8(sp)
    80002cbc:	01010413          	addi	s0,sp,16
    80002cc0:	ffffe097          	auipc	ra,0xffffe
    80002cc4:	5c4080e7          	jalr	1476(ra) # 80001284 <mycpu>
    80002cc8:	100027f3          	csrr	a5,sstatus
    80002ccc:	0027f793          	andi	a5,a5,2
    80002cd0:	04078463          	beqz	a5,80002d18 <pop_on+0x68>
    80002cd4:	07852783          	lw	a5,120(a0)
    80002cd8:	02f05863          	blez	a5,80002d08 <pop_on+0x58>
    80002cdc:	fff7879b          	addiw	a5,a5,-1
    80002ce0:	06f52c23          	sw	a5,120(a0)
    80002ce4:	07853783          	ld	a5,120(a0)
    80002ce8:	00079863          	bnez	a5,80002cf8 <pop_on+0x48>
    80002cec:	100027f3          	csrr	a5,sstatus
    80002cf0:	ffd7f793          	andi	a5,a5,-3
    80002cf4:	10079073          	csrw	sstatus,a5
    80002cf8:	00813083          	ld	ra,8(sp)
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	01010113          	addi	sp,sp,16
    80002d04:	00008067          	ret
    80002d08:	00008517          	auipc	a0,0x8
    80002d0c:	c2850513          	addi	a0,a0,-984 # 8000a930 <digits+0x70>
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	f2c080e7          	jalr	-212(ra) # 80001c3c <panic>
    80002d18:	00008517          	auipc	a0,0x8
    80002d1c:	bf850513          	addi	a0,a0,-1032 # 8000a910 <digits+0x50>
    80002d20:	fffff097          	auipc	ra,0xfffff
    80002d24:	f1c080e7          	jalr	-228(ra) # 80001c3c <panic>

0000000080002d28 <__memset>:
    80002d28:	ff010113          	addi	sp,sp,-16
    80002d2c:	00813423          	sd	s0,8(sp)
    80002d30:	01010413          	addi	s0,sp,16
    80002d34:	1a060e63          	beqz	a2,80002ef0 <__memset+0x1c8>
    80002d38:	40a007b3          	neg	a5,a0
    80002d3c:	0077f793          	andi	a5,a5,7
    80002d40:	00778693          	addi	a3,a5,7
    80002d44:	00b00813          	li	a6,11
    80002d48:	0ff5f593          	andi	a1,a1,255
    80002d4c:	fff6071b          	addiw	a4,a2,-1
    80002d50:	1b06e663          	bltu	a3,a6,80002efc <__memset+0x1d4>
    80002d54:	1cd76463          	bltu	a4,a3,80002f1c <__memset+0x1f4>
    80002d58:	1a078e63          	beqz	a5,80002f14 <__memset+0x1ec>
    80002d5c:	00b50023          	sb	a1,0(a0)
    80002d60:	00100713          	li	a4,1
    80002d64:	1ae78463          	beq	a5,a4,80002f0c <__memset+0x1e4>
    80002d68:	00b500a3          	sb	a1,1(a0)
    80002d6c:	00200713          	li	a4,2
    80002d70:	1ae78a63          	beq	a5,a4,80002f24 <__memset+0x1fc>
    80002d74:	00b50123          	sb	a1,2(a0)
    80002d78:	00300713          	li	a4,3
    80002d7c:	18e78463          	beq	a5,a4,80002f04 <__memset+0x1dc>
    80002d80:	00b501a3          	sb	a1,3(a0)
    80002d84:	00400713          	li	a4,4
    80002d88:	1ae78263          	beq	a5,a4,80002f2c <__memset+0x204>
    80002d8c:	00b50223          	sb	a1,4(a0)
    80002d90:	00500713          	li	a4,5
    80002d94:	1ae78063          	beq	a5,a4,80002f34 <__memset+0x20c>
    80002d98:	00b502a3          	sb	a1,5(a0)
    80002d9c:	00700713          	li	a4,7
    80002da0:	18e79e63          	bne	a5,a4,80002f3c <__memset+0x214>
    80002da4:	00b50323          	sb	a1,6(a0)
    80002da8:	00700e93          	li	t4,7
    80002dac:	00859713          	slli	a4,a1,0x8
    80002db0:	00e5e733          	or	a4,a1,a4
    80002db4:	01059e13          	slli	t3,a1,0x10
    80002db8:	01c76e33          	or	t3,a4,t3
    80002dbc:	01859313          	slli	t1,a1,0x18
    80002dc0:	006e6333          	or	t1,t3,t1
    80002dc4:	02059893          	slli	a7,a1,0x20
    80002dc8:	40f60e3b          	subw	t3,a2,a5
    80002dcc:	011368b3          	or	a7,t1,a7
    80002dd0:	02859813          	slli	a6,a1,0x28
    80002dd4:	0108e833          	or	a6,a7,a6
    80002dd8:	03059693          	slli	a3,a1,0x30
    80002ddc:	003e589b          	srliw	a7,t3,0x3
    80002de0:	00d866b3          	or	a3,a6,a3
    80002de4:	03859713          	slli	a4,a1,0x38
    80002de8:	00389813          	slli	a6,a7,0x3
    80002dec:	00f507b3          	add	a5,a0,a5
    80002df0:	00e6e733          	or	a4,a3,a4
    80002df4:	000e089b          	sext.w	a7,t3
    80002df8:	00f806b3          	add	a3,a6,a5
    80002dfc:	00e7b023          	sd	a4,0(a5)
    80002e00:	00878793          	addi	a5,a5,8
    80002e04:	fed79ce3          	bne	a5,a3,80002dfc <__memset+0xd4>
    80002e08:	ff8e7793          	andi	a5,t3,-8
    80002e0c:	0007871b          	sext.w	a4,a5
    80002e10:	01d787bb          	addw	a5,a5,t4
    80002e14:	0ce88e63          	beq	a7,a4,80002ef0 <__memset+0x1c8>
    80002e18:	00f50733          	add	a4,a0,a5
    80002e1c:	00b70023          	sb	a1,0(a4)
    80002e20:	0017871b          	addiw	a4,a5,1
    80002e24:	0cc77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e28:	00e50733          	add	a4,a0,a4
    80002e2c:	00b70023          	sb	a1,0(a4)
    80002e30:	0027871b          	addiw	a4,a5,2
    80002e34:	0ac77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e38:	00e50733          	add	a4,a0,a4
    80002e3c:	00b70023          	sb	a1,0(a4)
    80002e40:	0037871b          	addiw	a4,a5,3
    80002e44:	0ac77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e48:	00e50733          	add	a4,a0,a4
    80002e4c:	00b70023          	sb	a1,0(a4)
    80002e50:	0047871b          	addiw	a4,a5,4
    80002e54:	08c77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e58:	00e50733          	add	a4,a0,a4
    80002e5c:	00b70023          	sb	a1,0(a4)
    80002e60:	0057871b          	addiw	a4,a5,5
    80002e64:	08c77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e68:	00e50733          	add	a4,a0,a4
    80002e6c:	00b70023          	sb	a1,0(a4)
    80002e70:	0067871b          	addiw	a4,a5,6
    80002e74:	06c77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e78:	00e50733          	add	a4,a0,a4
    80002e7c:	00b70023          	sb	a1,0(a4)
    80002e80:	0077871b          	addiw	a4,a5,7
    80002e84:	06c77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e88:	00e50733          	add	a4,a0,a4
    80002e8c:	00b70023          	sb	a1,0(a4)
    80002e90:	0087871b          	addiw	a4,a5,8
    80002e94:	04c77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002e98:	00e50733          	add	a4,a0,a4
    80002e9c:	00b70023          	sb	a1,0(a4)
    80002ea0:	0097871b          	addiw	a4,a5,9
    80002ea4:	04c77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002ea8:	00e50733          	add	a4,a0,a4
    80002eac:	00b70023          	sb	a1,0(a4)
    80002eb0:	00a7871b          	addiw	a4,a5,10
    80002eb4:	02c77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002eb8:	00e50733          	add	a4,a0,a4
    80002ebc:	00b70023          	sb	a1,0(a4)
    80002ec0:	00b7871b          	addiw	a4,a5,11
    80002ec4:	02c77663          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002ec8:	00e50733          	add	a4,a0,a4
    80002ecc:	00b70023          	sb	a1,0(a4)
    80002ed0:	00c7871b          	addiw	a4,a5,12
    80002ed4:	00c77e63          	bgeu	a4,a2,80002ef0 <__memset+0x1c8>
    80002ed8:	00e50733          	add	a4,a0,a4
    80002edc:	00b70023          	sb	a1,0(a4)
    80002ee0:	00d7879b          	addiw	a5,a5,13
    80002ee4:	00c7f663          	bgeu	a5,a2,80002ef0 <__memset+0x1c8>
    80002ee8:	00f507b3          	add	a5,a0,a5
    80002eec:	00b78023          	sb	a1,0(a5)
    80002ef0:	00813403          	ld	s0,8(sp)
    80002ef4:	01010113          	addi	sp,sp,16
    80002ef8:	00008067          	ret
    80002efc:	00b00693          	li	a3,11
    80002f00:	e55ff06f          	j	80002d54 <__memset+0x2c>
    80002f04:	00300e93          	li	t4,3
    80002f08:	ea5ff06f          	j	80002dac <__memset+0x84>
    80002f0c:	00100e93          	li	t4,1
    80002f10:	e9dff06f          	j	80002dac <__memset+0x84>
    80002f14:	00000e93          	li	t4,0
    80002f18:	e95ff06f          	j	80002dac <__memset+0x84>
    80002f1c:	00000793          	li	a5,0
    80002f20:	ef9ff06f          	j	80002e18 <__memset+0xf0>
    80002f24:	00200e93          	li	t4,2
    80002f28:	e85ff06f          	j	80002dac <__memset+0x84>
    80002f2c:	00400e93          	li	t4,4
    80002f30:	e7dff06f          	j	80002dac <__memset+0x84>
    80002f34:	00500e93          	li	t4,5
    80002f38:	e75ff06f          	j	80002dac <__memset+0x84>
    80002f3c:	00600e93          	li	t4,6
    80002f40:	e6dff06f          	j	80002dac <__memset+0x84>

0000000080002f44 <__memmove>:
    80002f44:	ff010113          	addi	sp,sp,-16
    80002f48:	00813423          	sd	s0,8(sp)
    80002f4c:	01010413          	addi	s0,sp,16
    80002f50:	0e060863          	beqz	a2,80003040 <__memmove+0xfc>
    80002f54:	fff6069b          	addiw	a3,a2,-1
    80002f58:	0006881b          	sext.w	a6,a3
    80002f5c:	0ea5e863          	bltu	a1,a0,8000304c <__memmove+0x108>
    80002f60:	00758713          	addi	a4,a1,7
    80002f64:	00a5e7b3          	or	a5,a1,a0
    80002f68:	40a70733          	sub	a4,a4,a0
    80002f6c:	0077f793          	andi	a5,a5,7
    80002f70:	00f73713          	sltiu	a4,a4,15
    80002f74:	00174713          	xori	a4,a4,1
    80002f78:	0017b793          	seqz	a5,a5
    80002f7c:	00e7f7b3          	and	a5,a5,a4
    80002f80:	10078863          	beqz	a5,80003090 <__memmove+0x14c>
    80002f84:	00900793          	li	a5,9
    80002f88:	1107f463          	bgeu	a5,a6,80003090 <__memmove+0x14c>
    80002f8c:	0036581b          	srliw	a6,a2,0x3
    80002f90:	fff8081b          	addiw	a6,a6,-1
    80002f94:	02081813          	slli	a6,a6,0x20
    80002f98:	01d85893          	srli	a7,a6,0x1d
    80002f9c:	00858813          	addi	a6,a1,8
    80002fa0:	00058793          	mv	a5,a1
    80002fa4:	00050713          	mv	a4,a0
    80002fa8:	01088833          	add	a6,a7,a6
    80002fac:	0007b883          	ld	a7,0(a5)
    80002fb0:	00878793          	addi	a5,a5,8
    80002fb4:	00870713          	addi	a4,a4,8
    80002fb8:	ff173c23          	sd	a7,-8(a4)
    80002fbc:	ff0798e3          	bne	a5,a6,80002fac <__memmove+0x68>
    80002fc0:	ff867713          	andi	a4,a2,-8
    80002fc4:	02071793          	slli	a5,a4,0x20
    80002fc8:	0207d793          	srli	a5,a5,0x20
    80002fcc:	00f585b3          	add	a1,a1,a5
    80002fd0:	40e686bb          	subw	a3,a3,a4
    80002fd4:	00f507b3          	add	a5,a0,a5
    80002fd8:	06e60463          	beq	a2,a4,80003040 <__memmove+0xfc>
    80002fdc:	0005c703          	lbu	a4,0(a1)
    80002fe0:	00e78023          	sb	a4,0(a5)
    80002fe4:	04068e63          	beqz	a3,80003040 <__memmove+0xfc>
    80002fe8:	0015c603          	lbu	a2,1(a1)
    80002fec:	00100713          	li	a4,1
    80002ff0:	00c780a3          	sb	a2,1(a5)
    80002ff4:	04e68663          	beq	a3,a4,80003040 <__memmove+0xfc>
    80002ff8:	0025c603          	lbu	a2,2(a1)
    80002ffc:	00200713          	li	a4,2
    80003000:	00c78123          	sb	a2,2(a5)
    80003004:	02e68e63          	beq	a3,a4,80003040 <__memmove+0xfc>
    80003008:	0035c603          	lbu	a2,3(a1)
    8000300c:	00300713          	li	a4,3
    80003010:	00c781a3          	sb	a2,3(a5)
    80003014:	02e68663          	beq	a3,a4,80003040 <__memmove+0xfc>
    80003018:	0045c603          	lbu	a2,4(a1)
    8000301c:	00400713          	li	a4,4
    80003020:	00c78223          	sb	a2,4(a5)
    80003024:	00e68e63          	beq	a3,a4,80003040 <__memmove+0xfc>
    80003028:	0055c603          	lbu	a2,5(a1)
    8000302c:	00500713          	li	a4,5
    80003030:	00c782a3          	sb	a2,5(a5)
    80003034:	00e68663          	beq	a3,a4,80003040 <__memmove+0xfc>
    80003038:	0065c703          	lbu	a4,6(a1)
    8000303c:	00e78323          	sb	a4,6(a5)
    80003040:	00813403          	ld	s0,8(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret
    8000304c:	02061713          	slli	a4,a2,0x20
    80003050:	02075713          	srli	a4,a4,0x20
    80003054:	00e587b3          	add	a5,a1,a4
    80003058:	f0f574e3          	bgeu	a0,a5,80002f60 <__memmove+0x1c>
    8000305c:	02069613          	slli	a2,a3,0x20
    80003060:	02065613          	srli	a2,a2,0x20
    80003064:	fff64613          	not	a2,a2
    80003068:	00e50733          	add	a4,a0,a4
    8000306c:	00c78633          	add	a2,a5,a2
    80003070:	fff7c683          	lbu	a3,-1(a5)
    80003074:	fff78793          	addi	a5,a5,-1
    80003078:	fff70713          	addi	a4,a4,-1
    8000307c:	00d70023          	sb	a3,0(a4)
    80003080:	fec798e3          	bne	a5,a2,80003070 <__memmove+0x12c>
    80003084:	00813403          	ld	s0,8(sp)
    80003088:	01010113          	addi	sp,sp,16
    8000308c:	00008067          	ret
    80003090:	02069713          	slli	a4,a3,0x20
    80003094:	02075713          	srli	a4,a4,0x20
    80003098:	00170713          	addi	a4,a4,1
    8000309c:	00e50733          	add	a4,a0,a4
    800030a0:	00050793          	mv	a5,a0
    800030a4:	0005c683          	lbu	a3,0(a1)
    800030a8:	00178793          	addi	a5,a5,1
    800030ac:	00158593          	addi	a1,a1,1
    800030b0:	fed78fa3          	sb	a3,-1(a5)
    800030b4:	fee798e3          	bne	a5,a4,800030a4 <__memmove+0x160>
    800030b8:	f89ff06f          	j	80003040 <__memmove+0xfc>
	...

0000000080004000 <_kernel_text_start>:
.globl interrupt
.globl interruptvec
.align 4
interruptvec:

addi sp, sp, -256
    80004000:	f0010113          	addi	sp,sp,-256
.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80004004:	00113423          	sd	ra,8(sp)
    80004008:	00213823          	sd	sp,16(sp)
    8000400c:	00313c23          	sd	gp,24(sp)
    80004010:	02413023          	sd	tp,32(sp)
    80004014:	02513423          	sd	t0,40(sp)
    80004018:	02613823          	sd	t1,48(sp)
    8000401c:	02713c23          	sd	t2,56(sp)
    80004020:	04813023          	sd	s0,64(sp)
    80004024:	04913423          	sd	s1,72(sp)
    80004028:	04a13823          	sd	a0,80(sp)
    8000402c:	04b13c23          	sd	a1,88(sp)
    80004030:	06c13023          	sd	a2,96(sp)
    80004034:	06d13423          	sd	a3,104(sp)
    80004038:	06e13823          	sd	a4,112(sp)
    8000403c:	06f13c23          	sd	a5,120(sp)
    80004040:	09013023          	sd	a6,128(sp)
    80004044:	09113423          	sd	a7,136(sp)
    80004048:	09213823          	sd	s2,144(sp)
    8000404c:	09313c23          	sd	s3,152(sp)
    80004050:	0b413023          	sd	s4,160(sp)
    80004054:	0b513423          	sd	s5,168(sp)
    80004058:	0b613823          	sd	s6,176(sp)
    8000405c:	0b713c23          	sd	s7,184(sp)
    80004060:	0d813023          	sd	s8,192(sp)
    80004064:	0d913423          	sd	s9,200(sp)
    80004068:	0da13823          	sd	s10,208(sp)
    8000406c:	0db13c23          	sd	s11,216(sp)
    80004070:	0fc13023          	sd	t3,224(sp)
    80004074:	0fd13423          	sd	t4,232(sp)
    80004078:	0fe13823          	sd	t5,240(sp)
    8000407c:	0ff13c23          	sd	t6,248(sp)

call interrupt
    80004080:	634010ef          	jal	ra,800056b4 <interrupt>

.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    80004084:	00813083          	ld	ra,8(sp)
    80004088:	01013103          	ld	sp,16(sp)
    8000408c:	01813183          	ld	gp,24(sp)
    80004090:	02013203          	ld	tp,32(sp)
    80004094:	02813283          	ld	t0,40(sp)
    80004098:	03013303          	ld	t1,48(sp)
    8000409c:	03813383          	ld	t2,56(sp)
    800040a0:	04013403          	ld	s0,64(sp)
    800040a4:	04813483          	ld	s1,72(sp)
    800040a8:	05013503          	ld	a0,80(sp)
    800040ac:	05813583          	ld	a1,88(sp)
    800040b0:	06013603          	ld	a2,96(sp)
    800040b4:	06813683          	ld	a3,104(sp)
    800040b8:	07013703          	ld	a4,112(sp)
    800040bc:	07813783          	ld	a5,120(sp)
    800040c0:	08013803          	ld	a6,128(sp)
    800040c4:	08813883          	ld	a7,136(sp)
    800040c8:	09013903          	ld	s2,144(sp)
    800040cc:	09813983          	ld	s3,152(sp)
    800040d0:	0a013a03          	ld	s4,160(sp)
    800040d4:	0a813a83          	ld	s5,168(sp)
    800040d8:	0b013b03          	ld	s6,176(sp)
    800040dc:	0b813b83          	ld	s7,184(sp)
    800040e0:	0c013c03          	ld	s8,192(sp)
    800040e4:	0c813c83          	ld	s9,200(sp)
    800040e8:	0d013d03          	ld	s10,208(sp)
    800040ec:	0d813d83          	ld	s11,216(sp)
    800040f0:	0e013e03          	ld	t3,224(sp)
    800040f4:	0e813e83          	ld	t4,232(sp)
    800040f8:	0f013f03          	ld	t5,240(sp)
    800040fc:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    80004100:	10010113          	addi	sp,sp,256



sret
    80004104:	10200073          	sret
	...

0000000080004110 <KERNEL_TEXT_START>:
    80004110:	4000                	lw	s0,0(s0)
    80004112:	8000                	0x8000
    80004114:	0000                	unimp
	...

0000000080004118 <KERNEL_TEXT_END>:
    80004118:	7f08                	ld	a0,56(a4)
    8000411a:	8000                	0x8000
    8000411c:	0000                	unimp
	...

0000000080004120 <USER_TEXT_START>:
    80004120:	8000                	0x8000
    80004122:	8000                	0x8000
    80004124:	0000                	unimp
	...

0000000080004128 <USER_TEXT_END>:
    80004128:	9524                	0x9524
    8000412a:	8000                	0x8000
    8000412c:	0000                	unimp
	...

0000000080004130 <copy_and_swap>:

.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
    80004130:	100522af          	lr.w	t0,(a0)
bne t0, a1, fail       # Doesn’t match, so fail.
    80004134:	00b29a63          	bne	t0,a1,80004148 <fail>
sc.w t0, a2, (a0)      # Try to update.
    80004138:	18c522af          	sc.w	t0,a2,(a0)
bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000413c:	fe029ae3          	bnez	t0,80004130 <copy_and_swap>
li a0, 0               # Set return to success.
    80004140:	00000513          	li	a0,0
jr ra                  # Return.
    80004144:	00008067          	ret

0000000080004148 <fail>:
fail:
li a0, 1               # Set return to failure.
    80004148:	00100513          	li	a0,1

000000008000414c <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
addi sp, sp, -256
    8000414c:	f0010113          	addi	sp,sp,-256
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80004150:	00313c23          	sd	gp,24(sp)
    80004154:	02413023          	sd	tp,32(sp)
    80004158:	02513423          	sd	t0,40(sp)
    8000415c:	02613823          	sd	t1,48(sp)
    80004160:	02713c23          	sd	t2,56(sp)
    80004164:	04813023          	sd	s0,64(sp)
    80004168:	04913423          	sd	s1,72(sp)
    8000416c:	04a13823          	sd	a0,80(sp)
    80004170:	04b13c23          	sd	a1,88(sp)
    80004174:	06c13023          	sd	a2,96(sp)
    80004178:	06d13423          	sd	a3,104(sp)
    8000417c:	06e13823          	sd	a4,112(sp)
    80004180:	06f13c23          	sd	a5,120(sp)
    80004184:	09013023          	sd	a6,128(sp)
    80004188:	09113423          	sd	a7,136(sp)
    8000418c:	09213823          	sd	s2,144(sp)
    80004190:	09313c23          	sd	s3,152(sp)
    80004194:	0b413023          	sd	s4,160(sp)
    80004198:	0b513423          	sd	s5,168(sp)
    8000419c:	0b613823          	sd	s6,176(sp)
    800041a0:	0b713c23          	sd	s7,184(sp)
    800041a4:	0d813023          	sd	s8,192(sp)
    800041a8:	0d913423          	sd	s9,200(sp)
    800041ac:	0da13823          	sd	s10,208(sp)
    800041b0:	0db13c23          	sd	s11,216(sp)
    800041b4:	0fc13023          	sd	t3,224(sp)
    800041b8:	0fd13423          	sd	t4,232(sp)
    800041bc:	0fe13823          	sd	t5,240(sp)
    800041c0:	0ff13c23          	sd	t6,248(sp)
ret
    800041c4:	00008067          	ret

00000000800041c8 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800041c8:	01813183          	ld	gp,24(sp)
    800041cc:	02013203          	ld	tp,32(sp)
    800041d0:	02813283          	ld	t0,40(sp)
    800041d4:	03013303          	ld	t1,48(sp)
    800041d8:	03813383          	ld	t2,56(sp)
    800041dc:	04013403          	ld	s0,64(sp)
    800041e0:	04813483          	ld	s1,72(sp)
    800041e4:	05013503          	ld	a0,80(sp)
    800041e8:	05813583          	ld	a1,88(sp)
    800041ec:	06013603          	ld	a2,96(sp)
    800041f0:	06813683          	ld	a3,104(sp)
    800041f4:	07013703          	ld	a4,112(sp)
    800041f8:	07813783          	ld	a5,120(sp)
    800041fc:	08013803          	ld	a6,128(sp)
    80004200:	08813883          	ld	a7,136(sp)
    80004204:	09013903          	ld	s2,144(sp)
    80004208:	09813983          	ld	s3,152(sp)
    8000420c:	0a013a03          	ld	s4,160(sp)
    80004210:	0a813a83          	ld	s5,168(sp)
    80004214:	0b013b03          	ld	s6,176(sp)
    80004218:	0b813b83          	ld	s7,184(sp)
    8000421c:	0c013c03          	ld	s8,192(sp)
    80004220:	0c813c83          	ld	s9,200(sp)
    80004224:	0d013d03          	ld	s10,208(sp)
    80004228:	0d813d83          	ld	s11,216(sp)
    8000422c:	0e013e03          	ld	t3,224(sp)
    80004230:	0e813e83          	ld	t4,232(sp)
    80004234:	0f013f03          	ld	t5,240(sp)
    80004238:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    8000423c:	10010113          	addi	sp,sp,256
ret
    80004240:	00008067          	ret

0000000080004244 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:

.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
sd ra, 0 * 8(a0)
    80004244:	00153023          	sd	ra,0(a0)
sd sp, 1 * 8(a0)
    80004248:	00253423          	sd	sp,8(a0)

ld ra, 0 * 8(a1)
    8000424c:	0005b083          	ld	ra,0(a1)
ld sp, 1 * 8(a1)
    80004250:	0085b103          	ld	sp,8(a1)

ret
    80004254:	00008067          	ret

0000000080004258 <_ZN5Buddy11getInstanceEv>:
    buddy_mem_size = (buddy_mem_size - 1)/Buddy::BLOCK_SIZE + 1;

    return Buddy::initalize(buddy_mem_start, buddy_mem_size);
}

Buddy& Buddy::getInstance(){
    80004258:	ff010113          	addi	sp,sp,-16
    8000425c:	00813423          	sd	s0,8(sp)
    80004260:	01010413          	addi	s0,sp,16
    if(!buddy) {  /* TODO: panic */ }

    return (*buddy);
}
    80004264:	00008797          	auipc	a5,0x8
    80004268:	44478793          	addi	a5,a5,1092 # 8000c6a8 <_ZN5Buddy5buddyE>
    8000426c:	0007b503          	ld	a0,0(a5)
    80004270:	00813403          	ld	s0,8(sp)
    80004274:	01010113          	addi	sp,sp,16
    80004278:	00008067          	ret

000000008000427c <_ZN5Buddy8print_beEm>:

void Buddy::print_be(size_t entry){
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00113c23          	sd	ra,24(sp)
    80004284:	00813823          	sd	s0,16(sp)
    80004288:	00913423          	sd	s1,8(sp)
    8000428c:	01213023          	sd	s2,0(sp)
    80004290:	02010413          	addi	s0,sp,32
    80004294:	00050913          	mv	s2,a0
    80004298:	00058493          	mv	s1,a1
    kprintString("blocks["); kprintInt( entry, 10); kprintString("]: ");
    8000429c:	00006517          	auipc	a0,0x6
    800042a0:	d8450513          	addi	a0,a0,-636 # 8000a020 <CONSOLE_STATUS+0x10>
    800042a4:	00001097          	auipc	ra,0x1
    800042a8:	69c080e7          	jalr	1692(ra) # 80005940 <_Z12kprintStringPKc>
    800042ac:	00000613          	li	a2,0
    800042b0:	00a00593          	li	a1,10
    800042b4:	00048513          	mv	a0,s1
    800042b8:	00001097          	auipc	ra,0x1
    800042bc:	6d0080e7          	jalr	1744(ra) # 80005988 <_Z9kprintIntmib>
    800042c0:	00006517          	auipc	a0,0x6
    800042c4:	d6850513          	addi	a0,a0,-664 # 8000a028 <CONSOLE_STATUS+0x18>
    800042c8:	00001097          	auipc	ra,0x1
    800042cc:	678080e7          	jalr	1656(ra) # 80005940 <_Z12kprintStringPKc>
    switch(blocks[entry]){
    800042d0:	02093783          	ld	a5,32(s2)
    800042d4:	00149493          	slli	s1,s1,0x1
    800042d8:	009787b3          	add	a5,a5,s1
    800042dc:	00079703          	lh	a4,0(a5)
    800042e0:	0007069b          	sext.w	a3,a4
    800042e4:	ffe00793          	li	a5,-2
    800042e8:	02f68c63          	beq	a3,a5,80004320 <_ZN5Buddy8print_beEm+0xa4>
    800042ec:	00068793          	mv	a5,a3
    800042f0:	fff00693          	li	a3,-1
    800042f4:	04d79063          	bne	a5,a3,80004334 <_ZN5Buddy8print_beEm+0xb8>
        case bstatus::FREE:
            kprintString("FREE");
    800042f8:	00006517          	auipc	a0,0x6
    800042fc:	d3850513          	addi	a0,a0,-712 # 8000a030 <CONSOLE_STATUS+0x20>
    80004300:	00001097          	auipc	ra,0x1
    80004304:	640080e7          	jalr	1600(ra) # 80005940 <_Z12kprintStringPKc>
                kprintString("ALLOC: 2^");
                kprintInt(blocks[entry]);
            }
            break;
    }
}
    80004308:	01813083          	ld	ra,24(sp)
    8000430c:	01013403          	ld	s0,16(sp)
    80004310:	00813483          	ld	s1,8(sp)
    80004314:	00013903          	ld	s2,0(sp)
    80004318:	02010113          	addi	sp,sp,32
    8000431c:	00008067          	ret
            kprintString("SUB_ALLOC");
    80004320:	00006517          	auipc	a0,0x6
    80004324:	d1850513          	addi	a0,a0,-744 # 8000a038 <CONSOLE_STATUS+0x28>
    80004328:	00001097          	auipc	ra,0x1
    8000432c:	618080e7          	jalr	1560(ra) # 80005940 <_Z12kprintStringPKc>
            break;
    80004330:	fd9ff06f          	j	80004308 <_ZN5Buddy8print_beEm+0x8c>
            if((short)blocks[entry] < 0)
    80004334:	02074a63          	bltz	a4,80004368 <_ZN5Buddy8print_beEm+0xec>
                kprintString("ALLOC: 2^");
    80004338:	00006517          	auipc	a0,0x6
    8000433c:	d1850513          	addi	a0,a0,-744 # 8000a050 <CONSOLE_STATUS+0x40>
    80004340:	00001097          	auipc	ra,0x1
    80004344:	600080e7          	jalr	1536(ra) # 80005940 <_Z12kprintStringPKc>
                kprintInt(blocks[entry]);
    80004348:	02093783          	ld	a5,32(s2)
    8000434c:	009784b3          	add	s1,a5,s1
    80004350:	00000613          	li	a2,0
    80004354:	00a00593          	li	a1,10
    80004358:	00049503          	lh	a0,0(s1)
    8000435c:	00001097          	auipc	ra,0x1
    80004360:	62c080e7          	jalr	1580(ra) # 80005988 <_Z9kprintIntmib>
}
    80004364:	fa5ff06f          	j	80004308 <_ZN5Buddy8print_beEm+0x8c>
                kprintString("INVALID");
    80004368:	00006517          	auipc	a0,0x6
    8000436c:	ce050513          	addi	a0,a0,-800 # 8000a048 <CONSOLE_STATUS+0x38>
    80004370:	00001097          	auipc	ra,0x1
    80004374:	5d0080e7          	jalr	1488(ra) # 80005940 <_Z12kprintStringPKc>
    80004378:	f91ff06f          	j	80004308 <_ZN5Buddy8print_beEm+0x8c>

000000008000437c <_ZN5Buddy13get_from_listEh>:
    lhp[level] = chunk;

    return 0;
}

mmeta_t* Buddy::get_from_list(uchar level){
    8000437c:	ff010113          	addi	sp,sp,-16
    80004380:	00813423          	sd	s0,8(sp)
    80004384:	01010413          	addi	s0,sp,16
    /* chk if level is valid */
    if(level >= lhp_size) return nullptr;
    80004388:	01854783          	lbu	a5,24(a0)
    8000438c:	04f5f463          	bgeu	a1,a5,800043d4 <_ZN5Buddy13get_from_listEh+0x58>
    mmeta_t* ret = lhp[level];
    80004390:	01053783          	ld	a5,16(a0)
    80004394:	00359593          	slli	a1,a1,0x3
    80004398:	00b787b3          	add	a5,a5,a1
    8000439c:	0007b783          	ld	a5,0(a5)
    if(ret){
    800043a0:	02078063          	beqz	a5,800043c0 <_ZN5Buddy13get_from_listEh+0x44>
        if(ret->next) ret->next->prev = 0;
    800043a4:	0007b703          	ld	a4,0(a5)
    800043a8:	00070463          	beqz	a4,800043b0 <_ZN5Buddy13get_from_listEh+0x34>
    800043ac:	00073423          	sd	zero,8(a4)
        lhp[level] = ret->next;    
    800043b0:	01053703          	ld	a4,16(a0)
    800043b4:	00b705b3          	add	a1,a4,a1
    800043b8:	0007b703          	ld	a4,0(a5)
    800043bc:	00e5b023          	sd	a4,0(a1)
    }
    ret->next = 0;
    800043c0:	0007b023          	sd	zero,0(a5)
    return ret;
}
    800043c4:	00078513          	mv	a0,a5
    800043c8:	00813403          	ld	s0,8(sp)
    800043cc:	01010113          	addi	sp,sp,16
    800043d0:	00008067          	ret
    if(level >= lhp_size) return nullptr;
    800043d4:	00000793          	li	a5,0
    800043d8:	fedff06f          	j	800043c4 <_ZN5Buddy13get_from_listEh+0x48>

00000000800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>:

size_t Buddy::get_block_num(mmeta_t* chunk){
    800043dc:	ff010113          	addi	sp,sp,-16
    800043e0:	00813423          	sd	s0,8(sp)
    800043e4:	01010413          	addi	s0,sp,16
    if((uint64)chunk & (BLOCK_SIZE - 1)) return -1;
    800043e8:	000017b7          	lui	a5,0x1
    800043ec:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800043f0:	00f5f7b3          	and	a5,a1,a5
    800043f4:	02079263          	bnez	a5,80004418 <_ZN5Buddy13get_block_numEP7mmeta_t+0x3c>
    return ((uint64)chunk - (uint64)start_address) >> BLOCK_SIZE_BIT_LEN;
    800043f8:	00053503          	ld	a0,0(a0)
    800043fc:	40a585b3          	sub	a1,a1,a0
    80004400:	00008517          	auipc	a0,0x8
    80004404:	2a054503          	lbu	a0,672(a0) # 8000c6a0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80004408:	00a5d533          	srl	a0,a1,a0
}
    8000440c:	00813403          	ld	s0,8(sp)
    80004410:	01010113          	addi	sp,sp,16
    80004414:	00008067          	ret
    if((uint64)chunk & (BLOCK_SIZE - 1)) return -1;
    80004418:	fff00513          	li	a0,-1
    8000441c:	ff1ff06f          	j	8000440c <_ZN5Buddy13get_block_numEP7mmeta_t+0x30>

0000000080004420 <_ZN5Buddy11add_to_listEhP7mmeta_t>:
    if(level >= lhp_size) return -4;
    80004420:	01854783          	lbu	a5,24(a0)
    80004424:	0cf5f063          	bgeu	a1,a5,800044e4 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xc4>
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80004428:	0c060263          	beqz	a2,800044ec <_ZN5Buddy11add_to_listEhP7mmeta_t+0xcc>
    8000442c:	000017b7          	lui	a5,0x1
    80004430:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004434:	00f677b3          	and	a5,a2,a5
    80004438:	0a079e63          	bnez	a5,800044f4 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xd4>
int Buddy::add_to_list(uchar level, mmeta_t* chunk){
    8000443c:	fd010113          	addi	sp,sp,-48
    80004440:	02113423          	sd	ra,40(sp)
    80004444:	02813023          	sd	s0,32(sp)
    80004448:	00913c23          	sd	s1,24(sp)
    8000444c:	01213823          	sd	s2,16(sp)
    80004450:	01313423          	sd	s3,8(sp)
    80004454:	03010413          	addi	s0,sp,48
    80004458:	00060493          	mv	s1,a2
    8000445c:	00058993          	mv	s3,a1
    80004460:	00050913          	mv	s2,a0
    size_t bn = get_block_num(chunk);
    80004464:	00060593          	mv	a1,a2
    80004468:	00000097          	auipc	ra,0x0
    8000446c:	f74080e7          	jalr	-140(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    if(blocks[bn] != FREE) return -2;
    80004470:	02093783          	ld	a5,32(s2)
    80004474:	00151513          	slli	a0,a0,0x1
    80004478:	00a787b3          	add	a5,a5,a0
    8000447c:	00079703          	lh	a4,0(a5)
    80004480:	fff00793          	li	a5,-1
    80004484:	06f71c63          	bne	a4,a5,800044fc <_ZN5Buddy11add_to_listEhP7mmeta_t+0xdc>
    chunk -> next = lhp[level];
    80004488:	01093783          	ld	a5,16(s2)
    8000448c:	00399713          	slli	a4,s3,0x3
    80004490:	00e787b3          	add	a5,a5,a4
    80004494:	0007b783          	ld	a5,0(a5)
    80004498:	00f4b023          	sd	a5,0(s1)
    chunk -> prev = 0;
    8000449c:	0004b423          	sd	zero,8(s1)
    chunk -> level = level;
    800044a0:	01348823          	sb	s3,16(s1)
    if(lhp[level]) lhp[level] -> prev = chunk;
    800044a4:	01093783          	ld	a5,16(s2)
    800044a8:	00e787b3          	add	a5,a5,a4
    800044ac:	0007b783          	ld	a5,0(a5)
    800044b0:	00078463          	beqz	a5,800044b8 <_ZN5Buddy11add_to_listEhP7mmeta_t+0x98>
    800044b4:	0097b423          	sd	s1,8(a5)
    lhp[level] = chunk;
    800044b8:	01093783          	ld	a5,16(s2)
    800044bc:	00e787b3          	add	a5,a5,a4
    800044c0:	0097b023          	sd	s1,0(a5)
    return 0;
    800044c4:	00000513          	li	a0,0
}
    800044c8:	02813083          	ld	ra,40(sp)
    800044cc:	02013403          	ld	s0,32(sp)
    800044d0:	01813483          	ld	s1,24(sp)
    800044d4:	01013903          	ld	s2,16(sp)
    800044d8:	00813983          	ld	s3,8(sp)
    800044dc:	03010113          	addi	sp,sp,48
    800044e0:	00008067          	ret
    if(level >= lhp_size) return -4;
    800044e4:	ffc00513          	li	a0,-4
    800044e8:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    800044ec:	fff00513          	li	a0,-1
    800044f0:	00008067          	ret
    800044f4:	fff00513          	li	a0,-1
}
    800044f8:	00008067          	ret
    if(blocks[bn] != FREE) return -2;
    800044fc:	ffe00513          	li	a0,-2
    80004500:	fc9ff06f          	j	800044c8 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xa8>

0000000080004504 <_ZN5Buddy16remove_from_listEhP7mmeta_t>:

int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    /* chk if level is valid */
    if(level >= lhp_size) return -4;
    80004504:	01854783          	lbu	a5,24(a0)
    80004508:	0cf5fc63          	bgeu	a1,a5,800045e0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xdc>
    /* chk if address is valid */
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    8000450c:	0c060e63          	beqz	a2,800045e8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xe4>
    80004510:	000017b7          	lui	a5,0x1
    80004514:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004518:	00f677b3          	and	a5,a2,a5
    8000451c:	0c079a63          	bnez	a5,800045f0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xec>
int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    80004520:	fd010113          	addi	sp,sp,-48
    80004524:	02113423          	sd	ra,40(sp)
    80004528:	02813023          	sd	s0,32(sp)
    8000452c:	00913c23          	sd	s1,24(sp)
    80004530:	01213823          	sd	s2,16(sp)
    80004534:	01313423          	sd	s3,8(sp)
    80004538:	03010413          	addi	s0,sp,48
    8000453c:	00060493          	mv	s1,a2
    80004540:	00058993          	mv	s3,a1
    80004544:	00050913          	mv	s2,a0
    /* chk if starting block of chunk is set to free */ 
    size_t bn = get_block_num(chunk);
    80004548:	00060593          	mv	a1,a2
    8000454c:	00000097          	auipc	ra,0x0
    80004550:	e90080e7          	jalr	-368(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    if(blocks[bn] != FREE) return -2;
    80004554:	02093783          	ld	a5,32(s2)
    80004558:	00151513          	slli	a0,a0,0x1
    8000455c:	00a787b3          	add	a5,a5,a0
    80004560:	00079703          	lh	a4,0(a5)
    80004564:	fff00793          	li	a5,-1
    80004568:	08f71863          	bne	a4,a5,800045f8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xf4>
    /* chk if level of block is equal to given */
    if(!(chunk->level == level)) return -3;
    8000456c:	0104c783          	lbu	a5,16(s1)
    80004570:	09379863          	bne	a5,s3,80004600 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xfc>

    /* check if it is on the front */
    if(lhp[level] == chunk){
    80004574:	01093783          	ld	a5,16(s2)
    80004578:	00399713          	slli	a4,s3,0x3
    8000457c:	00e787b3          	add	a5,a5,a4
    80004580:	0007b783          	ld	a5,0(a5)
    80004584:	04978263          	beq	a5,s1,800045c8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xc4>
        get_from_list(level);
        return 0;
    }

    /* if it is not on the front */
    chunk->prev->next = chunk->next;
    80004588:	0084b703          	ld	a4,8(s1)
    8000458c:	0004b783          	ld	a5,0(s1)
    80004590:	00f73023          	sd	a5,0(a4)
    /* if it isn't last */
    if(chunk->next) chunk->next->prev = chunk->prev;
    80004594:	00078663          	beqz	a5,800045a0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0x9c>
    80004598:	0084b703          	ld	a4,8(s1)
    8000459c:	00e7b423          	sd	a4,8(a5)
    chunk->next = chunk->prev = 0;
    800045a0:	0004b423          	sd	zero,8(s1)
    800045a4:	0004b023          	sd	zero,0(s1)
    return 0;
    800045a8:	00000513          	li	a0,0

}
    800045ac:	02813083          	ld	ra,40(sp)
    800045b0:	02013403          	ld	s0,32(sp)
    800045b4:	01813483          	ld	s1,24(sp)
    800045b8:	01013903          	ld	s2,16(sp)
    800045bc:	00813983          	ld	s3,8(sp)
    800045c0:	03010113          	addi	sp,sp,48
    800045c4:	00008067          	ret
        get_from_list(level);
    800045c8:	00098593          	mv	a1,s3
    800045cc:	00090513          	mv	a0,s2
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	dac080e7          	jalr	-596(ra) # 8000437c <_ZN5Buddy13get_from_listEh>
        return 0;
    800045d8:	00000513          	li	a0,0
    800045dc:	fd1ff06f          	j	800045ac <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa8>
    if(level >= lhp_size) return -4;
    800045e0:	ffc00513          	li	a0,-4
    800045e4:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    800045e8:	fff00513          	li	a0,-1
    800045ec:	00008067          	ret
    800045f0:	fff00513          	li	a0,-1
}
    800045f4:	00008067          	ret
    if(blocks[bn] != FREE) return -2;
    800045f8:	ffe00513          	li	a0,-2
    800045fc:	fb1ff06f          	j	800045ac <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa8>
    if(!(chunk->level == level)) return -3;
    80004600:	ffd00513          	li	a0,-3
    80004604:	fa9ff06f          	j	800045ac <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa8>

0000000080004608 <_ZN5BuddyC1EPvm>:

/* sz - size is size in blocks */
Buddy::Buddy(void* saddr, size_t sz){
    80004608:	fe010113          	addi	sp,sp,-32
    8000460c:	00113c23          	sd	ra,24(sp)
    80004610:	00813823          	sd	s0,16(sp)
    80004614:	00913423          	sd	s1,8(sp)
    80004618:	02010413          	addi	s0,sp,32
    8000461c:	00050493          	mv	s1,a0
    start_address = saddr;
    80004620:	00b53023          	sd	a1,0(a0)
    size = sz;
    80004624:	00c53423          	sd	a2,8(a0)
*/
class NoAlloc{ /* singleton */ 
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    80004628:	00008797          	auipc	a5,0x8
    8000462c:	09078793          	addi	a5,a5,144 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80004630:	0007b503          	ld	a0,0(a5)
    /* --------MEMORY RESERVING-------- */
    /* last allocated address */
    uint64 x = (uint64)NoAlloc::getEndAddress();
    /* last buddy address */
    uint64 y = (uint64)saddr + (sz << BLOCK_SIZE_BIT_LEN);
    80004634:	00008797          	auipc	a5,0x8
    80004638:	06c7c783          	lbu	a5,108(a5) # 8000c6a0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    8000463c:	00f61633          	sll	a2,a2,a5
    80004640:	00b60633          	add	a2,a2,a1
    /* 
    *   Allocate diff between 
    *   last allocated address 
    *   and last buddy address 
    */
    void* ind = NoAlloc::mem_alloc(y - x);
    80004644:	40a60533          	sub	a0,a2,a0
    80004648:	00002097          	auipc	ra,0x2
    8000464c:	5c8080e7          	jalr	1480(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    if(ind == nullptr) { /* TODO: panic */ }

    /* ------MEMORY META ALLOC------ */
    /* allocate list head pointers */
    /* allocate is_free boolean array */
    blocks = (bstatus*)NoAlloc::mem_alloc(size*sizeof(bstatus));
    80004650:	0084b503          	ld	a0,8(s1)
    80004654:	00151513          	slli	a0,a0,0x1
    80004658:	00002097          	auipc	ra,0x2
    8000465c:	5b8080e7          	jalr	1464(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    80004660:	02a4b023          	sd	a0,32(s1)
    if(!blocks) { kprintString("is_free null panic!\n");}
    80004664:	02050663          	beqz	a0,80004690 <_ZN5BuddyC1EPvm+0x88>
Buddy::Buddy(void* saddr, size_t sz){
    80004668:	00000793          	li	a5,0
    /* set all is_free to 0 except first block */
    for(size_t i = 0; i < size; i++)
    8000466c:	0084b503          	ld	a0,8(s1)
    80004670:	02a7fa63          	bgeu	a5,a0,800046a4 <_ZN5BuddyC1EPvm+0x9c>
        blocks[i] = SUB_ALLOC;
    80004674:	0204b703          	ld	a4,32(s1)
    80004678:	00179693          	slli	a3,a5,0x1
    8000467c:	00d70733          	add	a4,a4,a3
    80004680:	ffe00693          	li	a3,-2
    80004684:	00d71023          	sh	a3,0(a4)
    for(size_t i = 0; i < size; i++)
    80004688:	00178793          	addi	a5,a5,1
    8000468c:	fe1ff06f          	j	8000466c <_ZN5BuddyC1EPvm+0x64>
    if(!blocks) { kprintString("is_free null panic!\n");}
    80004690:	00006517          	auipc	a0,0x6
    80004694:	9d050513          	addi	a0,a0,-1584 # 8000a060 <CONSOLE_STATUS+0x50>
    80004698:	00001097          	auipc	ra,0x1
    8000469c:	2a8080e7          	jalr	680(ra) # 80005940 <_Z12kprintStringPKc>
    800046a0:	fc9ff06f          	j	80004668 <_ZN5BuddyC1EPvm+0x60>

    lhp_size = log2(size)+1;
    800046a4:	00002097          	auipc	ra,0x2
    800046a8:	9c0080e7          	jalr	-1600(ra) # 80006064 <_Z4log2m>
    800046ac:	0015051b          	addiw	a0,a0,1
    800046b0:	0ff57513          	andi	a0,a0,255
    800046b4:	00a48c23          	sb	a0,24(s1)
    lhp = (mmeta_t**)NoAlloc::mem_alloc(lhp_size*sizeof(mmeta_t*));
    800046b8:	00351513          	slli	a0,a0,0x3
    800046bc:	00002097          	auipc	ra,0x2
    800046c0:	554080e7          	jalr	1364(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    800046c4:	00a4b823          	sd	a0,16(s1)
    if(!lhp) { kprintString("lhp null panic!\n");}
    800046c8:	02050663          	beqz	a0,800046f4 <_ZN5BuddyC1EPvm+0xec>
Buddy::Buddy(void* saddr, size_t sz){
    800046cc:	00000793          	li	a5,0
    /* set all list head pointers to null */
    for(uchar i = 0; i < lhp_size; i++ )
    800046d0:	0184c703          	lbu	a4,24(s1)
    800046d4:	02e7fa63          	bgeu	a5,a4,80004708 <_ZN5BuddyC1EPvm+0x100>
        lhp[i] = nullptr;
    800046d8:	0104b703          	ld	a4,16(s1)
    800046dc:	00379693          	slli	a3,a5,0x3
    800046e0:	00d70733          	add	a4,a4,a3
    800046e4:	00073023          	sd	zero,0(a4)
    for(uchar i = 0; i < lhp_size; i++ )
    800046e8:	0017879b          	addiw	a5,a5,1
    800046ec:	0ff7f793          	andi	a5,a5,255
    800046f0:	fe1ff06f          	j	800046d0 <_ZN5BuddyC1EPvm+0xc8>
    if(!lhp) { kprintString("lhp null panic!\n");}
    800046f4:	00006517          	auipc	a0,0x6
    800046f8:	98450513          	addi	a0,a0,-1660 # 8000a078 <CONSOLE_STATUS+0x68>
    800046fc:	00001097          	auipc	ra,0x1
    80004700:	244080e7          	jalr	580(ra) # 80005940 <_Z12kprintStringPKc>
    80004704:	fc9ff06f          	j	800046cc <_ZN5BuddyC1EPvm+0xc4>
    /* add just biggest element (whole memory) to last list */
    
    blocks[0] = FREE;
    80004708:	0204b783          	ld	a5,32(s1)
    8000470c:	fff00713          	li	a4,-1
    80004710:	00e79023          	sh	a4,0(a5)
    int code = add_to_list(lhp_size-1, (mmeta_t*)start_address);
    80004714:	0184c583          	lbu	a1,24(s1)
    80004718:	fff5859b          	addiw	a1,a1,-1
    8000471c:	0004b603          	ld	a2,0(s1)
    80004720:	0ff5f593          	andi	a1,a1,255
    80004724:	00048513          	mv	a0,s1
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	cf8080e7          	jalr	-776(ra) # 80004420 <_ZN5Buddy11add_to_listEhP7mmeta_t>
    80004730:	00050493          	mv	s1,a0
    if ( code < 0) {
    80004734:	00054c63          	bltz	a0,8000474c <_ZN5BuddyC1EPvm+0x144>
        kprintString("\n");
    }
    
    
    
}
    80004738:	01813083          	ld	ra,24(sp)
    8000473c:	01013403          	ld	s0,16(sp)
    80004740:	00813483          	ld	s1,8(sp)
    80004744:	02010113          	addi	sp,sp,32
    80004748:	00008067          	ret
        kprintString("addtolist panic: ");
    8000474c:	00006517          	auipc	a0,0x6
    80004750:	94450513          	addi	a0,a0,-1724 # 8000a090 <CONSOLE_STATUS+0x80>
    80004754:	00001097          	auipc	ra,0x1
    80004758:	1ec080e7          	jalr	492(ra) # 80005940 <_Z12kprintStringPKc>
        kprintInt(code, 16);
    8000475c:	00000613          	li	a2,0
    80004760:	01000593          	li	a1,16
    80004764:	00048513          	mv	a0,s1
    80004768:	00001097          	auipc	ra,0x1
    8000476c:	220080e7          	jalr	544(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80004770:	00006517          	auipc	a0,0x6
    80004774:	d5850513          	addi	a0,a0,-680 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004778:	00001097          	auipc	ra,0x1
    8000477c:	1c8080e7          	jalr	456(ra) # 80005940 <_Z12kprintStringPKc>
}
    80004780:	fb9ff06f          	j	80004738 <_ZN5BuddyC1EPvm+0x130>

0000000080004784 <_ZN5Buddy9initalizeEPvm>:
int Buddy::initalize(void* saddr, size_t sz){
    80004784:	fd010113          	addi	sp,sp,-48
    80004788:	02113423          	sd	ra,40(sp)
    8000478c:	02813023          	sd	s0,32(sp)
    80004790:	00913c23          	sd	s1,24(sp)
    80004794:	01213823          	sd	s2,16(sp)
    80004798:	01313423          	sd	s3,8(sp)
    8000479c:	03010413          	addi	s0,sp,48
    800047a0:	00050493          	mv	s1,a0
    800047a4:	00058913          	mv	s2,a1
    BLOCK_SIZE_BIT_LEN = log2(BLOCK_SIZE);
    800047a8:	00001537          	lui	a0,0x1
    800047ac:	00002097          	auipc	ra,0x2
    800047b0:	8b8080e7          	jalr	-1864(ra) # 80006064 <_Z4log2m>
    800047b4:	00008797          	auipc	a5,0x8
    800047b8:	eea78623          	sb	a0,-276(a5) # 8000c6a0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    800047bc:	00008797          	auipc	a5,0x8
    800047c0:	efc78793          	addi	a5,a5,-260 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    800047c4:	0007b783          	ld	a5,0(a5)
    if((uint64)saddr < laa + sizeof(Buddy))
    800047c8:	02878793          	addi	a5,a5,40
    800047cc:	02f4f263          	bgeu	s1,a5,800047f0 <_ZN5Buddy9initalizeEPvm+0x6c>
        return 1;
    800047d0:	00100513          	li	a0,1
}
    800047d4:	02813083          	ld	ra,40(sp)
    800047d8:	02013403          	ld	s0,32(sp)
    800047dc:	01813483          	ld	s1,24(sp)
    800047e0:	01013903          	ld	s2,16(sp)
    800047e4:	00813983          	ld	s3,8(sp)
    800047e8:	03010113          	addi	sp,sp,48
    800047ec:	00008067          	ret
    /* buddy allocator constructor */
    Buddy(void* saddr, size_t sz);

    /* align input to size of blocks */
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    800047f0:	000017b7          	lui	a5,0x1
    800047f4:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800047f8:	00f484b3          	add	s1,s1,a5
    800047fc:	fff00793          	li	a5,-1
    80004800:	00a79533          	sll	a0,a5,a0
    80004804:	00a4f4b3          	and	s1,s1,a0
    sz = closest2pow(sz);
    80004808:	00090513          	mv	a0,s2
    8000480c:	00002097          	auipc	ra,0x2
    80004810:	82c080e7          	jalr	-2004(ra) # 80006038 <_Z11closest2powm>
    80004814:	00050993          	mv	s3,a0
    __NOALLOC_OPERATORS__
    80004818:	02800513          	li	a0,40
    8000481c:	00002097          	auipc	ra,0x2
    80004820:	3f4080e7          	jalr	1012(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    80004824:	00050913          	mv	s2,a0
    buddy = new Buddy(saddr, sz);
    80004828:	00098613          	mv	a2,s3
    8000482c:	00048593          	mv	a1,s1
    80004830:	00000097          	auipc	ra,0x0
    80004834:	dd8080e7          	jalr	-552(ra) # 80004608 <_ZN5BuddyC1EPvm>
    80004838:	00008797          	auipc	a5,0x8
    8000483c:	e727b823          	sd	s2,-400(a5) # 8000c6a8 <_ZN5Buddy5buddyE>
    if(!buddy)  return 1;
    80004840:	00090663          	beqz	s2,8000484c <_ZN5Buddy9initalizeEPvm+0xc8>
    return 0;
    80004844:	00000513          	li	a0,0
    80004848:	f8dff06f          	j	800047d4 <_ZN5Buddy9initalizeEPvm+0x50>
    if(!buddy)  return 1;
    8000484c:	00100513          	li	a0,1
    80004850:	f85ff06f          	j	800047d4 <_ZN5Buddy9initalizeEPvm+0x50>

0000000080004854 <_Z3kmiv>:
    80004854:	00008797          	auipc	a5,0x8
    80004858:	e6478793          	addi	a5,a5,-412 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    8000485c:	0007b503          	ld	a0,0(a5)
        (uint64)NoAlloc::getEndAddress() + sizeof(Buddy) ) ;
    80004860:	02850513          	addi	a0,a0,40 # 1028 <_entry-0x7fffefd8>
    size_t buddy_mem_size = ((uint64)HEAP_END_ADDR - (uint64)buddy_mem_start) >> 3; 
    80004864:	00008797          	auipc	a5,0x8
    80004868:	c4478793          	addi	a5,a5,-956 # 8000c4a8 <HEAP_END_ADDR>
    8000486c:	0007b583          	ld	a1,0(a5)
    80004870:	40a585b3          	sub	a1,a1,a0
    80004874:	0035d593          	srli	a1,a1,0x3
    if(buddy_mem_size == 0){ return 1; }
    80004878:	00059663          	bnez	a1,80004884 <_Z3kmiv+0x30>
    8000487c:	00100513          	li	a0,1
}
    80004880:	00008067          	ret
int kmi(){
    80004884:	ff010113          	addi	sp,sp,-16
    80004888:	00113423          	sd	ra,8(sp)
    8000488c:	00813023          	sd	s0,0(sp)
    80004890:	01010413          	addi	s0,sp,16
    buddy_mem_size = (buddy_mem_size - 1)/Buddy::BLOCK_SIZE + 1;
    80004894:	fff58593          	addi	a1,a1,-1
    80004898:	00c5d593          	srli	a1,a1,0xc
    return Buddy::initalize(buddy_mem_start, buddy_mem_size);
    8000489c:	00158593          	addi	a1,a1,1
    800048a0:	00000097          	auipc	ra,0x0
    800048a4:	ee4080e7          	jalr	-284(ra) # 80004784 <_ZN5Buddy9initalizeEPvm>
}
    800048a8:	00813083          	ld	ra,8(sp)
    800048ac:	00013403          	ld	s0,0(sp)
    800048b0:	01010113          	addi	sp,sp,16
    800048b4:	00008067          	ret

00000000800048b8 <_ZN5Buddy5splitEP7mmeta_t>:

mmeta_t* Buddy::split(mmeta_t* chunk){
    800048b8:	ff010113          	addi	sp,sp,-16
    800048bc:	00813423          	sd	s0,8(sp)
    800048c0:	01010413          	addi	s0,sp,16
    /* chk if address is valid */
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    800048c4:	000017b7          	lui	a5,0x1
    800048c8:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800048cc:	00f5f7b3          	and	a5,a1,a5
    800048d0:	02079663          	bnez	a5,800048fc <_ZN5Buddy5splitEP7mmeta_t+0x44>
    800048d4:	00053783          	ld	a5,0(a0)
    800048d8:	02f5e663          	bltu	a1,a5,80004904 <_ZN5Buddy5splitEP7mmeta_t+0x4c>
    return (mmeta_t*)( (uint64)chunk + (BLOCK_SIZE << (chunk->level - 1)) ) ;
    800048dc:	0105c503          	lbu	a0,16(a1)
    800048e0:	fff5079b          	addiw	a5,a0,-1
    800048e4:	00001537          	lui	a0,0x1
    800048e8:	00f51533          	sll	a0,a0,a5
    800048ec:	00a58533          	add	a0,a1,a0
}
    800048f0:	00813403          	ld	s0,8(sp)
    800048f4:	01010113          	addi	sp,sp,16
    800048f8:	00008067          	ret
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    800048fc:	00000513          	li	a0,0
    80004900:	ff1ff06f          	j	800048f0 <_ZN5Buddy5splitEP7mmeta_t+0x38>
    80004904:	00000513          	li	a0,0
    80004908:	fe9ff06f          	j	800048f0 <_ZN5Buddy5splitEP7mmeta_t+0x38>

000000008000490c <_ZN5Buddy12status_printEb>:

void Buddy::status_print(bool f){
    8000490c:	fd010113          	addi	sp,sp,-48
    80004910:	02113423          	sd	ra,40(sp)
    80004914:	02813023          	sd	s0,32(sp)
    80004918:	00913c23          	sd	s1,24(sp)
    8000491c:	01213823          	sd	s2,16(sp)
    80004920:	01313423          	sd	s3,8(sp)
    80004924:	01413023          	sd	s4,0(sp)
    80004928:	03010413          	addi	s0,sp,48
    if(!buddy){
    8000492c:	00008797          	auipc	a5,0x8
    80004930:	d7c78793          	addi	a5,a5,-644 # 8000c6a8 <_ZN5Buddy5buddyE>
    80004934:	0007b783          	ld	a5,0(a5)
    80004938:	0c078c63          	beqz	a5,80004a10 <_ZN5Buddy12status_printEb+0x104>
    8000493c:	00050993          	mv	s3,a0
    80004940:	00058a13          	mv	s4,a1
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    80004944:	00005517          	auipc	a0,0x5
    80004948:	77c50513          	addi	a0,a0,1916 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    8000494c:	00001097          	auipc	ra,0x1
    80004950:	ff4080e7          	jalr	-12(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    80004954:	00005517          	auipc	a0,0x5
    80004958:	78c50513          	addi	a0,a0,1932 # 8000a0e0 <CONSOLE_STATUS+0xd0>
    8000495c:	00001097          	auipc	ra,0x1
    80004960:	fe4080e7          	jalr	-28(ra) # 80005940 <_Z12kprintStringPKc>
    80004964:	00000613          	li	a2,0
    80004968:	01000593          	li	a1,16
    8000496c:	00008797          	auipc	a5,0x8
    80004970:	d3c78793          	addi	a5,a5,-708 # 8000c6a8 <_ZN5Buddy5buddyE>
    80004974:	0007b503          	ld	a0,0(a5)
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	010080e7          	jalr	16(ra) # 80005988 <_Z9kprintIntmib>
    80004980:	00006517          	auipc	a0,0x6
    80004984:	b4850513          	addi	a0,a0,-1208 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004988:	00001097          	auipc	ra,0x1
    8000498c:	fb8080e7          	jalr	-72(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    80004990:	00005517          	auipc	a0,0x5
    80004994:	75850513          	addi	a0,a0,1880 # 8000a0e8 <CONSOLE_STATUS+0xd8>
    80004998:	00001097          	auipc	ra,0x1
    8000499c:	fa8080e7          	jalr	-88(ra) # 80005940 <_Z12kprintStringPKc>
    800049a0:	00000613          	li	a2,0
    800049a4:	01000593          	li	a1,16
    800049a8:	0009b503          	ld	a0,0(s3)
    800049ac:	00001097          	auipc	ra,0x1
    800049b0:	fdc080e7          	jalr	-36(ra) # 80005988 <_Z9kprintIntmib>
    800049b4:	00006517          	auipc	a0,0x6
    800049b8:	b1450513          	addi	a0,a0,-1260 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800049bc:	00001097          	auipc	ra,0x1
    800049c0:	f84080e7          	jalr	-124(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(size);
    800049c4:	00005517          	auipc	a0,0x5
    800049c8:	73450513          	addi	a0,a0,1844 # 8000a0f8 <CONSOLE_STATUS+0xe8>
    800049cc:	00001097          	auipc	ra,0x1
    800049d0:	f74080e7          	jalr	-140(ra) # 80005940 <_Z12kprintStringPKc>
    800049d4:	00000613          	li	a2,0
    800049d8:	01000593          	li	a1,16
    800049dc:	0089b503          	ld	a0,8(s3)
    800049e0:	00001097          	auipc	ra,0x1
    800049e4:	fa8080e7          	jalr	-88(ra) # 80005988 <_Z9kprintIntmib>
    800049e8:	00006517          	auipc	a0,0x6
    800049ec:	ae050513          	addi	a0,a0,-1312 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800049f0:	00001097          	auipc	ra,0x1
    800049f4:	f50080e7          	jalr	-176(ra) # 80005940 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    800049f8:	00005517          	auipc	a0,0x5
    800049fc:	70850513          	addi	a0,a0,1800 # 8000a100 <CONSOLE_STATUS+0xf0>
    80004a00:	00001097          	auipc	ra,0x1
    80004a04:	f40080e7          	jalr	-192(ra) # 80005940 <_Z12kprintStringPKc>
    for(uchar i = 0; i < lhp_size; i++){
    80004a08:	00000913          	li	s2,0
    80004a0c:	0680006f          	j	80004a74 <_ZN5Buddy12status_printEb+0x168>
        kprintString("BUDDY NOT INITALIZED!!!");
    80004a10:	00005517          	auipc	a0,0x5
    80004a14:	69850513          	addi	a0,a0,1688 # 8000a0a8 <CONSOLE_STATUS+0x98>
    80004a18:	00001097          	auipc	ra,0x1
    80004a1c:	f28080e7          	jalr	-216(ra) # 80005940 <_Z12kprintStringPKc>
        return;
    80004a20:	1880006f          	j	80004ba8 <_ZN5Buddy12status_printEb+0x29c>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
        kprintString("\t");
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
            kprintInt((uint64)curr, 16);
            if(curr->next)
                kprintString(" -> ");
    80004a24:	00005517          	auipc	a0,0x5
    80004a28:	70c50513          	addi	a0,a0,1804 # 8000a130 <CONSOLE_STATUS+0x120>
    80004a2c:	00001097          	auipc	ra,0x1
    80004a30:	f14080e7          	jalr	-236(ra) # 80005940 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    80004a34:	0004b483          	ld	s1,0(s1)
    80004a38:	02048263          	beqz	s1,80004a5c <_ZN5Buddy12status_printEb+0x150>
            kprintInt((uint64)curr, 16);
    80004a3c:	00000613          	li	a2,0
    80004a40:	01000593          	li	a1,16
    80004a44:	00048513          	mv	a0,s1
    80004a48:	00001097          	auipc	ra,0x1
    80004a4c:	f40080e7          	jalr	-192(ra) # 80005988 <_Z9kprintIntmib>
            if(curr->next)
    80004a50:	0004b783          	ld	a5,0(s1)
    80004a54:	fc0798e3          	bnez	a5,80004a24 <_ZN5Buddy12status_printEb+0x118>
    80004a58:	fddff06f          	j	80004a34 <_ZN5Buddy12status_printEb+0x128>
        }
        kprintString("\n");
    80004a5c:	00006517          	auipc	a0,0x6
    80004a60:	a6c50513          	addi	a0,a0,-1428 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004a64:	00001097          	auipc	ra,0x1
    80004a68:	edc080e7          	jalr	-292(ra) # 80005940 <_Z12kprintStringPKc>
    for(uchar i = 0; i < lhp_size; i++){
    80004a6c:	0019091b          	addiw	s2,s2,1
    80004a70:	0ff97913          	andi	s2,s2,255
    80004a74:	0189c783          	lbu	a5,24(s3)
    80004a78:	08f97e63          	bgeu	s2,a5,80004b14 <_ZN5Buddy12status_printEb+0x208>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
    80004a7c:	00005517          	auipc	a0,0x5
    80004a80:	6a450513          	addi	a0,a0,1700 # 8000a120 <CONSOLE_STATUS+0x110>
    80004a84:	00001097          	auipc	ra,0x1
    80004a88:	ebc080e7          	jalr	-324(ra) # 80005940 <_Z12kprintStringPKc>
    80004a8c:	00005517          	auipc	a0,0x5
    80004a90:	69c50513          	addi	a0,a0,1692 # 8000a128 <CONSOLE_STATUS+0x118>
    80004a94:	00001097          	auipc	ra,0x1
    80004a98:	eac080e7          	jalr	-340(ra) # 80005940 <_Z12kprintStringPKc>
    80004a9c:	00000613          	li	a2,0
    80004aa0:	00a00593          	li	a1,10
    80004aa4:	00090513          	mv	a0,s2
    80004aa8:	00001097          	auipc	ra,0x1
    80004aac:	ee0080e7          	jalr	-288(ra) # 80005988 <_Z9kprintIntmib>
    80004ab0:	00005517          	auipc	a0,0x5
    80004ab4:	57850513          	addi	a0,a0,1400 # 8000a028 <CONSOLE_STATUS+0x18>
    80004ab8:	00001097          	auipc	ra,0x1
    80004abc:	e88080e7          	jalr	-376(ra) # 80005940 <_Z12kprintStringPKc>
    80004ac0:	0109b783          	ld	a5,16(s3)
    80004ac4:	00391493          	slli	s1,s2,0x3
    80004ac8:	009787b3          	add	a5,a5,s1
    80004acc:	0007b503          	ld	a0,0(a5)
    80004ad0:	00000613          	li	a2,0
    80004ad4:	01000593          	li	a1,16
    80004ad8:	00a03533          	snez	a0,a0
    80004adc:	00001097          	auipc	ra,0x1
    80004ae0:	eac080e7          	jalr	-340(ra) # 80005988 <_Z9kprintIntmib>
    80004ae4:	00006517          	auipc	a0,0x6
    80004ae8:	9e450513          	addi	a0,a0,-1564 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004aec:	00001097          	auipc	ra,0x1
    80004af0:	e54080e7          	jalr	-428(ra) # 80005940 <_Z12kprintStringPKc>
        kprintString("\t");
    80004af4:	00005517          	auipc	a0,0x5
    80004af8:	62c50513          	addi	a0,a0,1580 # 8000a120 <CONSOLE_STATUS+0x110>
    80004afc:	00001097          	auipc	ra,0x1
    80004b00:	e44080e7          	jalr	-444(ra) # 80005940 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    80004b04:	0109b783          	ld	a5,16(s3)
    80004b08:	009787b3          	add	a5,a5,s1
    80004b0c:	0007b483          	ld	s1,0(a5)
    80004b10:	f29ff06f          	j	80004a38 <_ZN5Buddy12status_printEb+0x12c>
    }
    kprintString("\n");
    80004b14:	00006517          	auipc	a0,0x6
    80004b18:	9b450513          	addi	a0,a0,-1612 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004b1c:	00001097          	auipc	ra,0x1
    80004b20:	e24080e7          	jalr	-476(ra) # 80005940 <_Z12kprintStringPKc>
    if(f){
    80004b24:	060a0263          	beqz	s4,80004b88 <_ZN5Buddy12status_printEb+0x27c>
        for(size_t i = 0; i < size; i++){
    80004b28:	00000493          	li	s1,0
    80004b2c:	0080006f          	j	80004b34 <_ZN5Buddy12status_printEb+0x228>
    80004b30:	00148493          	addi	s1,s1,1
    80004b34:	0089b783          	ld	a5,8(s3)
    80004b38:	04f4f863          	bgeu	s1,a5,80004b88 <_ZN5Buddy12status_printEb+0x27c>
            if(blocks[i] != bstatus::SUB_ALLOC){
    80004b3c:	0209b783          	ld	a5,32(s3)
    80004b40:	00149713          	slli	a4,s1,0x1
    80004b44:	00e787b3          	add	a5,a5,a4
    80004b48:	00079703          	lh	a4,0(a5)
    80004b4c:	ffe00793          	li	a5,-2
    80004b50:	fef700e3          	beq	a4,a5,80004b30 <_ZN5Buddy12status_printEb+0x224>
                kprintString("\t"); print_be(i); kprintString("\n");
    80004b54:	00005517          	auipc	a0,0x5
    80004b58:	5cc50513          	addi	a0,a0,1484 # 8000a120 <CONSOLE_STATUS+0x110>
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	de4080e7          	jalr	-540(ra) # 80005940 <_Z12kprintStringPKc>
    80004b64:	00048593          	mv	a1,s1
    80004b68:	00098513          	mv	a0,s3
    80004b6c:	fffff097          	auipc	ra,0xfffff
    80004b70:	710080e7          	jalr	1808(ra) # 8000427c <_ZN5Buddy8print_beEm>
    80004b74:	00006517          	auipc	a0,0x6
    80004b78:	95450513          	addi	a0,a0,-1708 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80004b7c:	00001097          	auipc	ra,0x1
    80004b80:	dc4080e7          	jalr	-572(ra) # 80005940 <_Z12kprintStringPKc>
    80004b84:	fadff06f          	j	80004b30 <_ZN5Buddy12status_printEb+0x224>
            }
        }
    }
    kprintString("\t----END MEMORY META----\n");
    80004b88:	00005517          	auipc	a0,0x5
    80004b8c:	5b050513          	addi	a0,a0,1456 # 8000a138 <CONSOLE_STATUS+0x128>
    80004b90:	00001097          	auipc	ra,0x1
    80004b94:	db0080e7          	jalr	-592(ra) # 80005940 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    80004b98:	00005517          	auipc	a0,0x5
    80004b9c:	5c050513          	addi	a0,a0,1472 # 8000a158 <CONSOLE_STATUS+0x148>
    80004ba0:	00001097          	auipc	ra,0x1
    80004ba4:	da0080e7          	jalr	-608(ra) # 80005940 <_Z12kprintStringPKc>

}
    80004ba8:	02813083          	ld	ra,40(sp)
    80004bac:	02013403          	ld	s0,32(sp)
    80004bb0:	01813483          	ld	s1,24(sp)
    80004bb4:	01013903          	ld	s2,16(sp)
    80004bb8:	00813983          	ld	s3,8(sp)
    80004bbc:	00013a03          	ld	s4,0(sp)
    80004bc0:	03010113          	addi	sp,sp,48
    80004bc4:	00008067          	ret

0000000080004bc8 <_ZN5Buddy9mem_allocEm>:

void* Buddy::mem_alloc(size_t sz){
    80004bc8:	fc010113          	addi	sp,sp,-64
    80004bcc:	02113c23          	sd	ra,56(sp)
    80004bd0:	02813823          	sd	s0,48(sp)
    80004bd4:	02913423          	sd	s1,40(sp)
    80004bd8:	03213023          	sd	s2,32(sp)
    80004bdc:	01313c23          	sd	s3,24(sp)
    80004be0:	01413823          	sd	s4,16(sp)
    80004be4:	01513423          	sd	s5,8(sp)
    80004be8:	01613023          	sd	s6,0(sp)
    80004bec:	04010413          	addi	s0,sp,64
    80004bf0:	00050913          	mv	s2,a0
    80004bf4:	00058493          	mv	s1,a1
    /* check if sz is pow of 2 */
    if(!osb(sz)) return nullptr;
    80004bf8:	00058513          	mv	a0,a1
    80004bfc:	00001097          	auipc	ra,0x1
    80004c00:	49c080e7          	jalr	1180(ra) # 80006098 <_Z3osbm>
    80004c04:	10050a63          	beqz	a0,80004d18 <_ZN5Buddy9mem_allocEm+0x150>
    if(sz > size) return nullptr;
    80004c08:	00893783          	ld	a5,8(s2)
    80004c0c:	1097ea63          	bltu	a5,s1,80004d20 <_ZN5Buddy9mem_allocEm+0x158>
    /* get level of the size */
    uchar level = log2(sz);
    80004c10:	00048513          	mv	a0,s1
    80004c14:	00001097          	auipc	ra,0x1
    80004c18:	450080e7          	jalr	1104(ra) # 80006064 <_Z4log2m>
    80004c1c:	00050b13          	mv	s6,a0
    uchar i = level;
    80004c20:	00050493          	mv	s1,a0
    mmeta_t* chunk;
    /* iterate through levels until we find not-empty list */
    for(; i < lhp_size; i++)
    80004c24:	01894703          	lbu	a4,24(s2)
    80004c28:	02e4f263          	bgeu	s1,a4,80004c4c <_ZN5Buddy9mem_allocEm+0x84>
        if(lhp[i]) break;
    80004c2c:	01093783          	ld	a5,16(s2)
    80004c30:	00349693          	slli	a3,s1,0x3
    80004c34:	00d787b3          	add	a5,a5,a3
    80004c38:	0007b783          	ld	a5,0(a5)
    80004c3c:	00079863          	bnez	a5,80004c4c <_ZN5Buddy9mem_allocEm+0x84>
    for(; i < lhp_size; i++)
    80004c40:	0014849b          	addiw	s1,s1,1
    80004c44:	0ff4f493          	andi	s1,s1,255
    80004c48:	fddff06f          	j	80004c24 <_ZN5Buddy9mem_allocEm+0x5c>
    
    if(i == lhp_size) return nullptr;
    80004c4c:	0c970e63          	beq	a4,s1,80004d28 <_ZN5Buddy9mem_allocEm+0x160>
    /* get chunk from list */
    chunk = get_from_list(i);
    80004c50:	00048593          	mv	a1,s1
    80004c54:	00090513          	mv	a0,s2
    80004c58:	fffff097          	auipc	ra,0xfffff
    80004c5c:	724080e7          	jalr	1828(ra) # 8000437c <_ZN5Buddy13get_from_listEh>
    80004c60:	00050a13          	mv	s4,a0
    /* split chunk until we get to given level */
    for(;i > level; i--){
    80004c64:	069b7463          	bgeu	s6,s1,80004ccc <_ZN5Buddy9mem_allocEm+0x104>
        mmeta_t* t = split(chunk);
    80004c68:	000a0593          	mv	a1,s4
    80004c6c:	00090513          	mv	a0,s2
    80004c70:	00000097          	auipc	ra,0x0
    80004c74:	c48080e7          	jalr	-952(ra) # 800048b8 <_ZN5Buddy5splitEP7mmeta_t>
    80004c78:	00050a93          	mv	s5,a0
        /* set is_free of the second half */
        blocks[get_block_num(t)] = FREE;
    80004c7c:	02093983          	ld	s3,32(s2)
    80004c80:	00050593          	mv	a1,a0
    80004c84:	00090513          	mv	a0,s2
    80004c88:	fffff097          	auipc	ra,0xfffff
    80004c8c:	754080e7          	jalr	1876(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    80004c90:	00151513          	slli	a0,a0,0x1
    80004c94:	00a989b3          	add	s3,s3,a0
    80004c98:	fff00793          	li	a5,-1
    80004c9c:	00f99023          	sh	a5,0(s3)
        add_to_list(i-1, t);
    80004ca0:	fff4849b          	addiw	s1,s1,-1
    80004ca4:	0ff4f493          	andi	s1,s1,255
    80004ca8:	000a8613          	mv	a2,s5
    80004cac:	00048593          	mv	a1,s1
    80004cb0:	00090513          	mv	a0,s2
    80004cb4:	fffff097          	auipc	ra,0xfffff
    80004cb8:	76c080e7          	jalr	1900(ra) # 80004420 <_ZN5Buddy11add_to_listEhP7mmeta_t>
        chunk->level--;
    80004cbc:	010a4783          	lbu	a5,16(s4)
    80004cc0:	fff7879b          	addiw	a5,a5,-1
    80004cc4:	00fa0823          	sb	a5,16(s4)
    for(;i > level; i--){
    80004cc8:	f9dff06f          	j	80004c64 <_ZN5Buddy9mem_allocEm+0x9c>
    }
    /* set allocate curr chunk */
    blocks[get_block_num(chunk)] = (bstatus)level;
    80004ccc:	02093483          	ld	s1,32(s2)
    80004cd0:	000a0593          	mv	a1,s4
    80004cd4:	00090513          	mv	a0,s2
    80004cd8:	fffff097          	auipc	ra,0xfffff
    80004cdc:	704080e7          	jalr	1796(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    80004ce0:	00151513          	slli	a0,a0,0x1
    80004ce4:	00a484b3          	add	s1,s1,a0
    80004ce8:	01649023          	sh	s6,0(s1)
    return chunk;
}
    80004cec:	000a0513          	mv	a0,s4
    80004cf0:	03813083          	ld	ra,56(sp)
    80004cf4:	03013403          	ld	s0,48(sp)
    80004cf8:	02813483          	ld	s1,40(sp)
    80004cfc:	02013903          	ld	s2,32(sp)
    80004d00:	01813983          	ld	s3,24(sp)
    80004d04:	01013a03          	ld	s4,16(sp)
    80004d08:	00813a83          	ld	s5,8(sp)
    80004d0c:	00013b03          	ld	s6,0(sp)
    80004d10:	04010113          	addi	sp,sp,64
    80004d14:	00008067          	ret
    if(!osb(sz)) return nullptr;
    80004d18:	00000a13          	li	s4,0
    80004d1c:	fd1ff06f          	j	80004cec <_ZN5Buddy9mem_allocEm+0x124>
    if(sz > size) return nullptr;
    80004d20:	00000a13          	li	s4,0
    80004d24:	fc9ff06f          	j	80004cec <_ZN5Buddy9mem_allocEm+0x124>
    if(i == lhp_size) return nullptr;
    80004d28:	00000a13          	li	s4,0
    80004d2c:	fc1ff06f          	j	80004cec <_ZN5Buddy9mem_allocEm+0x124>

0000000080004d30 <_ZN5Buddy8merge_ipEP7mmeta_t>:
    }
    add_to_list(chunk->level, chunk);
    return 0;
}

mmeta_t* Buddy::merge_ip(mmeta_t* chunk){
    80004d30:	fb010113          	addi	sp,sp,-80
    80004d34:	04113423          	sd	ra,72(sp)
    80004d38:	04813023          	sd	s0,64(sp)
    80004d3c:	02913c23          	sd	s1,56(sp)
    80004d40:	03213823          	sd	s2,48(sp)
    80004d44:	05010413          	addi	s0,sp,80
    80004d48:	00050493          	mv	s1,a0
    80004d4c:	fab43c23          	sd	a1,-72(s0)
    size_t bn = get_block_num(chunk);
    80004d50:	00058913          	mv	s2,a1
    80004d54:	fffff097          	auipc	ra,0xfffff
    80004d58:	688080e7          	jalr	1672(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    80004d5c:	fca43c23          	sd	a0,-40(s0)
    size_t budd_bn;
    /* get buddy number */
    budd_bn = bn ^ (1ULL << chunk->level);
    80004d60:	01094703          	lbu	a4,16(s2)
    80004d64:	00100613          	li	a2,1
    80004d68:	00e61633          	sll	a2,a2,a4
    80004d6c:	00c54533          	xor	a0,a0,a2
    80004d70:	fca43823          	sd	a0,-48(s0)

    if(blocks[budd_bn]!=FREE) return nullptr;
    80004d74:	0204b783          	ld	a5,32(s1)
    80004d78:	00151693          	slli	a3,a0,0x1
    80004d7c:	00d787b3          	add	a5,a5,a3
    80004d80:	00079683          	lh	a3,0(a5)
    80004d84:	fff00793          	li	a5,-1
    80004d88:	0af69e63          	bne	a3,a5,80004e44 <_ZN5Buddy8merge_ipEP7mmeta_t+0x114>
    /* get buddy address */
    mmeta_t* budd_addr = (mmeta_t*)((budd_bn << BLOCK_SIZE_BIT_LEN) + (size_t)start_address);
    80004d8c:	00008617          	auipc	a2,0x8
    80004d90:	91464603          	lbu	a2,-1772(a2) # 8000c6a0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80004d94:	00c51533          	sll	a0,a0,a2
    80004d98:	0004b603          	ld	a2,0(s1)
    80004d9c:	00a60633          	add	a2,a2,a0
    80004da0:	fcc43423          	sd	a2,-56(s0)
    if(budd_addr->level != chunk->level) return nullptr;
    80004da4:	01064583          	lbu	a1,16(a2)
    80004da8:	0ab71263          	bne	a4,a1,80004e4c <_ZN5Buddy8merge_ipEP7mmeta_t+0x11c>
   
    /* remove buddy from list */
    int code = remove_from_list(budd_addr->level, budd_addr);
    80004dac:	00048513          	mv	a0,s1
    80004db0:	fffff097          	auipc	ra,0xfffff
    80004db4:	754080e7          	jalr	1876(ra) # 80004504 <_ZN5Buddy16remove_from_listEhP7mmeta_t>
    
    if(code < 0) return nullptr;
    80004db8:	08054e63          	bltz	a0,80004e54 <_ZN5Buddy8merge_ipEP7mmeta_t+0x124>

    if(budd_bn < bn){
    80004dbc:	fd043703          	ld	a4,-48(s0)
    80004dc0:	fd843783          	ld	a5,-40(s0)
    80004dc4:	04f76e63          	bltu	a4,a5,80004e20 <_ZN5Buddy8merge_ipEP7mmeta_t+0xf0>
        swap(bn, budd_bn);
        swap(chunk, budd_addr);
    }
    blocks[budd_bn] = SUB_ALLOC;
    80004dc8:	0204b783          	ld	a5,32(s1)
    80004dcc:	fd043703          	ld	a4,-48(s0)
    80004dd0:	00171713          	slli	a4,a4,0x1
    80004dd4:	00e787b3          	add	a5,a5,a4
    80004dd8:	ffe00713          	li	a4,-2
    80004ddc:	00e79023          	sh	a4,0(a5)
    blocks[bn] = FREE;
    80004de0:	0204b783          	ld	a5,32(s1)
    80004de4:	fd843703          	ld	a4,-40(s0)
    80004de8:	00171713          	slli	a4,a4,0x1
    80004dec:	00e787b3          	add	a5,a5,a4
    80004df0:	fff00713          	li	a4,-1
    80004df4:	00e79023          	sh	a4,0(a5)
    chunk->level = chunk->level + 1;
    80004df8:	fb843503          	ld	a0,-72(s0)
    80004dfc:	01054783          	lbu	a5,16(a0)
    80004e00:	0017879b          	addiw	a5,a5,1
    80004e04:	00f50823          	sb	a5,16(a0)

    return chunk;
    80004e08:	04813083          	ld	ra,72(sp)
    80004e0c:	04013403          	ld	s0,64(sp)
    80004e10:	03813483          	ld	s1,56(sp)
    80004e14:	03013903          	ld	s2,48(sp)
    80004e18:	05010113          	addi	sp,sp,80
    80004e1c:	00008067          	ret
        swap(bn, budd_bn);
    80004e20:	fd040593          	addi	a1,s0,-48
    80004e24:	fd840513          	addi	a0,s0,-40
    80004e28:	00000097          	auipc	ra,0x0
    80004e2c:	124080e7          	jalr	292(ra) # 80004f4c <_Z4swapImEvRT_S1_>
        swap(chunk, budd_addr);
    80004e30:	fc840593          	addi	a1,s0,-56
    80004e34:	fb840513          	addi	a0,s0,-72
    80004e38:	00000097          	auipc	ra,0x0
    80004e3c:	13c080e7          	jalr	316(ra) # 80004f74 <_Z4swapIP7mmeta_tEvRT_S3_>
    80004e40:	f89ff06f          	j	80004dc8 <_ZN5Buddy8merge_ipEP7mmeta_t+0x98>
    if(blocks[budd_bn]!=FREE) return nullptr;
    80004e44:	00000513          	li	a0,0
    80004e48:	fc1ff06f          	j	80004e08 <_ZN5Buddy8merge_ipEP7mmeta_t+0xd8>
    if(budd_addr->level != chunk->level) return nullptr;
    80004e4c:	00000513          	li	a0,0
    80004e50:	fb9ff06f          	j	80004e08 <_ZN5Buddy8merge_ipEP7mmeta_t+0xd8>
    if(code < 0) return nullptr;
    80004e54:	00000513          	li	a0,0
    80004e58:	fb1ff06f          	j	80004e08 <_ZN5Buddy8merge_ipEP7mmeta_t+0xd8>

0000000080004e5c <_ZN5Buddy8mem_freeEPv>:
    if(( (uint64)addr & (BLOCK_SIZE - 1) )
    80004e5c:	000017b7          	lui	a5,0x1
    80004e60:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004e64:	00f5f7b3          	and	a5,a1,a5
    80004e68:	0c079263          	bnez	a5,80004f2c <_ZN5Buddy8mem_freeEPv+0xd0>
int Buddy::mem_free(void* addr){
    80004e6c:	fe010113          	addi	sp,sp,-32
    80004e70:	00113c23          	sd	ra,24(sp)
    80004e74:	00813823          	sd	s0,16(sp)
    80004e78:	00913423          	sd	s1,8(sp)
    80004e7c:	01213023          	sd	s2,0(sp)
    80004e80:	02010413          	addi	s0,sp,32
    80004e84:	00050913          	mv	s2,a0
    80004e88:	00058493          	mv	s1,a1
    || addr < start_address) return -1;
    80004e8c:	00053783          	ld	a5,0(a0)
    80004e90:	0af5e263          	bltu	a1,a5,80004f34 <_ZN5Buddy8mem_freeEPv+0xd8>
    size_t bn = get_block_num((mmeta_t*)addr);
    80004e94:	fffff097          	auipc	ra,0xfffff
    80004e98:	548080e7          	jalr	1352(ra) # 800043dc <_ZN5Buddy13get_block_numEP7mmeta_t>
    if(bn >= size) return -3;
    80004e9c:	00893783          	ld	a5,8(s2)
    80004ea0:	08f57e63          	bgeu	a0,a5,80004f3c <_ZN5Buddy8mem_freeEPv+0xe0>
    if(blocks[bn] < 0) return -2;
    80004ea4:	02093783          	ld	a5,32(s2)
    80004ea8:	00151513          	slli	a0,a0,0x1
    80004eac:	00a787b3          	add	a5,a5,a0
    80004eb0:	00079783          	lh	a5,0(a5)
    80004eb4:	0807c863          	bltz	a5,80004f44 <_ZN5Buddy8mem_freeEPv+0xe8>
    chunk->level = blocks[bn];
    80004eb8:	00f48823          	sb	a5,16(s1)
    chunk->prev = chunk->next = nullptr;
    80004ebc:	0004b023          	sd	zero,0(s1)
    80004ec0:	0004b423          	sd	zero,8(s1)
    blocks[bn] = bstatus::FREE;
    80004ec4:	02093783          	ld	a5,32(s2)
    80004ec8:	00a78533          	add	a0,a5,a0
    80004ecc:	fff00793          	li	a5,-1
    80004ed0:	00f51023          	sh	a5,0(a0)
    80004ed4:	0080006f          	j	80004edc <_ZN5Buddy8mem_freeEPv+0x80>
            chunk = maddr;
    80004ed8:	00050493          	mv	s1,a0
    while(chunk->level <= lhp_size){
    80004edc:	0104c703          	lbu	a4,16(s1)
    80004ee0:	01894783          	lbu	a5,24(s2)
    80004ee4:	00e7ec63          	bltu	a5,a4,80004efc <_ZN5Buddy8mem_freeEPv+0xa0>
        mmeta_t* maddr = merge_ip(chunk);
    80004ee8:	00048593          	mv	a1,s1
    80004eec:	00090513          	mv	a0,s2
    80004ef0:	00000097          	auipc	ra,0x0
    80004ef4:	e40080e7          	jalr	-448(ra) # 80004d30 <_ZN5Buddy8merge_ipEP7mmeta_t>
        if(maddr)
    80004ef8:	fe0510e3          	bnez	a0,80004ed8 <_ZN5Buddy8mem_freeEPv+0x7c>
    add_to_list(chunk->level, chunk);
    80004efc:	00048613          	mv	a2,s1
    80004f00:	0104c583          	lbu	a1,16(s1)
    80004f04:	00090513          	mv	a0,s2
    80004f08:	fffff097          	auipc	ra,0xfffff
    80004f0c:	518080e7          	jalr	1304(ra) # 80004420 <_ZN5Buddy11add_to_listEhP7mmeta_t>
    return 0;
    80004f10:	00000513          	li	a0,0
}
    80004f14:	01813083          	ld	ra,24(sp)
    80004f18:	01013403          	ld	s0,16(sp)
    80004f1c:	00813483          	ld	s1,8(sp)
    80004f20:	00013903          	ld	s2,0(sp)
    80004f24:	02010113          	addi	sp,sp,32
    80004f28:	00008067          	ret
    || addr < start_address) return -1;
    80004f2c:	fff00513          	li	a0,-1
}
    80004f30:	00008067          	ret
    || addr < start_address) return -1;
    80004f34:	fff00513          	li	a0,-1
    80004f38:	fddff06f          	j	80004f14 <_ZN5Buddy8mem_freeEPv+0xb8>
    if(bn >= size) return -3;
    80004f3c:	ffd00513          	li	a0,-3
    80004f40:	fd5ff06f          	j	80004f14 <_ZN5Buddy8mem_freeEPv+0xb8>
    if(blocks[bn] < 0) return -2;
    80004f44:	ffe00513          	li	a0,-2
    80004f48:	fcdff06f          	j	80004f14 <_ZN5Buddy8mem_freeEPv+0xb8>

0000000080004f4c <_Z4swapImEvRT_S1_>:
/* one or less set bits */
bool osb(uint64);

/* classic swap */
template<typename T>
void swap(T& a, T& b){
    80004f4c:	ff010113          	addi	sp,sp,-16
    80004f50:	00813423          	sd	s0,8(sp)
    80004f54:	01010413          	addi	s0,sp,16
    T x = a;
    80004f58:	00053783          	ld	a5,0(a0)
    a = b;
    80004f5c:	0005b703          	ld	a4,0(a1)
    80004f60:	00e53023          	sd	a4,0(a0)
    b = x;
    80004f64:	00f5b023          	sd	a5,0(a1)
}
    80004f68:	00813403          	ld	s0,8(sp)
    80004f6c:	01010113          	addi	sp,sp,16
    80004f70:	00008067          	ret

0000000080004f74 <_Z4swapIP7mmeta_tEvRT_S3_>:
void swap(T& a, T& b){
    80004f74:	ff010113          	addi	sp,sp,-16
    80004f78:	00813423          	sd	s0,8(sp)
    80004f7c:	01010413          	addi	s0,sp,16
    T x = a;
    80004f80:	00053783          	ld	a5,0(a0)
    a = b;
    80004f84:	0005b703          	ld	a4,0(a1)
    80004f88:	00e53023          	sd	a4,0(a0)
    b = x;
    80004f8c:	00f5b023          	sd	a5,0(a1)
}
    80004f90:	00813403          	ld	s0,8(sp)
    80004f94:	01010113          	addi	sp,sp,16
    80004f98:	00008067          	ret

0000000080004f9c <_Z13timer_handlerv>:
    IW = 7,

};

void timer_handler()
{
    80004f9c:	fd010113          	addi	sp,sp,-48
    80004fa0:	02113423          	sd	ra,40(sp)
    80004fa4:	02813023          	sd	s0,32(sp)
    80004fa8:	00913c23          	sd	s1,24(sp)
    80004fac:	01213823          	sd	s2,16(sp)
    80004fb0:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80004fb4:	00002097          	auipc	ra,0x2
    80004fb8:	1c0080e7          	jalr	448(ra) # 80007174 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80004fbc:	00007717          	auipc	a4,0x7
    80004fc0:	74c70713          	addi	a4,a4,1868 # 8000c708 <_ZN3TCB16timeSliceCounterE>
    80004fc4:	00073783          	ld	a5,0(a4)
    80004fc8:	00178793          	addi	a5,a5,1
    80004fcc:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80004fd0:	00007717          	auipc	a4,0x7
    80004fd4:	74070713          	addi	a4,a4,1856 # 8000c710 <_ZN3TCB7runningE>
    80004fd8:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80004fdc:	02873703          	ld	a4,40(a4)
    80004fe0:	02e7f263          	bgeu	a5,a4,80005004 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80004fe4:	00200793          	li	a5,2
    80004fe8:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80004fec:	02813083          	ld	ra,40(sp)
    80004ff0:	02013403          	ld	s0,32(sp)
    80004ff4:	01813483          	ld	s1,24(sp)
    80004ff8:	01013903          	ld	s2,16(sp)
    80004ffc:	03010113          	addi	sp,sp,48
    80005000:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005004:	100027f3          	csrr	a5,sstatus
    80005008:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    8000500c:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005010:	141027f3          	csrr	a5,sepc
    80005014:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80005018:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    8000501c:	00007797          	auipc	a5,0x7
    80005020:	6e07b623          	sd	zero,1772(a5) # 8000c708 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005024:	00003097          	auipc	ra,0x3
    80005028:	ba0080e7          	jalr	-1120(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000502c:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005030:	14149073          	csrw	sepc,s1
    80005034:	fb1ff06f          	j	80004fe4 <_Z13timer_handlerv+0x48>

0000000080005038 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80005038:	fb010113          	addi	sp,sp,-80
    8000503c:	04113423          	sd	ra,72(sp)
    80005040:	04813023          	sd	s0,64(sp)
    80005044:	02913c23          	sd	s1,56(sp)
    80005048:	03213823          	sd	s2,48(sp)
    8000504c:	03313423          	sd	s3,40(sp)
    80005050:	03413023          	sd	s4,32(sp)
    80005054:	01513c23          	sd	s5,24(sp)
    80005058:	01613823          	sd	s6,16(sp)
    8000505c:	05010413          	addi	s0,sp,80
    80005060:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005064:	141027f3          	csrr	a5,sepc
    80005068:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    8000506c:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005070:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005074:	100027f3          	csrr	a5,sstatus
    80005078:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    8000507c:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80005080:	00100793          	li	a5,1
    80005084:	0ef50663          	beq	a0,a5,80005170 <_Z8usrEcallmmmmm+0x138>
    80005088:	00050493          	mv	s1,a0
    8000508c:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    80005090:	00200793          	li	a5,2
    80005094:	12f50063          	beq	a0,a5,800051b4 <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    80005098:	01100793          	li	a5,17
    8000509c:	12f50863          	beq	a0,a5,800051cc <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    800050a0:	01200793          	li	a5,18
    800050a4:	14f50a63          	beq	a0,a5,800051f8 <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    800050a8:	01300793          	li	a5,19
    800050ac:	16f50863          	beq	a0,a5,8000521c <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    800050b0:	06900793          	li	a5,105
    800050b4:	18f50063          	beq	a0,a5,80005234 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    800050b8:	02100793          	li	a5,33
    800050bc:	18f50663          	beq	a0,a5,80005248 <_Z8usrEcallmmmmm+0x210>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    800050c0:	02200793          	li	a5,34
    800050c4:	1cf50463          	beq	a0,a5,8000528c <_Z8usrEcallmmmmm+0x254>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    800050c8:	02300793          	li	a5,35
    800050cc:	1cf50863          	beq	a0,a5,8000529c <_Z8usrEcallmmmmm+0x264>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    800050d0:	02400793          	li	a5,36
    800050d4:	1ef50863          	beq	a0,a5,800052c4 <_Z8usrEcallmmmmm+0x28c>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    800050d8:	03100793          	li	a5,49
    800050dc:	20f50863          	beq	a0,a5,800052ec <_Z8usrEcallmmmmm+0x2b4>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    800050e0:	04100793          	li	a5,65
    800050e4:	20f50e63          	beq	a0,a5,80005300 <_Z8usrEcallmmmmm+0x2c8>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800050e8:	04200793          	li	a5,66
    800050ec:	08f51c63          	bne	a0,a5,80005184 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    800050f0:	00007797          	auipc	a5,0x7
    800050f4:	5e078793          	addi	a5,a5,1504 # 8000c6d0 <_ZN5StdIO7obufferE>
    800050f8:	0007ba83          	ld	s5,0(a5)
    800050fc:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    80005100:	450a8513          	addi	a0,s5,1104
    80005104:	00001097          	auipc	ra,0x1
    80005108:	398080e7          	jalr	920(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000510c:	400a8b13          	addi	s6,s5,1024
    80005110:	000b0513          	mv	a0,s6
    80005114:	00001097          	auipc	ra,0x1
    80005118:	388080e7          	jalr	904(ra) # 8000649c <_ZN10KSemaphore4waitEv>

        tmpLen++;
    8000511c:	480aa783          	lw	a5,1152(s5)
    80005120:	0017879b          	addiw	a5,a5,1
    80005124:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    80005128:	47caa783          	lw	a5,1148(s5)
    8000512c:	00fa8733          	add	a4,s5,a5
    80005130:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80005134:	0017879b          	addiw	a5,a5,1
    80005138:	41f7d71b          	sraiw	a4,a5,0x1f
    8000513c:	0167571b          	srliw	a4,a4,0x16
    80005140:	00e787bb          	addw	a5,a5,a4
    80005144:	3ff7f793          	andi	a5,a5,1023
    80005148:	40e787bb          	subw	a5,a5,a4
    8000514c:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    80005150:	428a8513          	addi	a0,s5,1064
    80005154:	00001097          	auipc	ra,0x1
    80005158:	3cc080e7          	jalr	972(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000515c:	000b0513          	mv	a0,s6
    80005160:	00001097          	auipc	ra,0x1
    80005164:	3c0080e7          	jalr	960(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005168:	00048513          	mv	a0,s1
    8000516c:	0180006f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80005170:	00001097          	auipc	ra,0x1
    80005174:	618080e7          	jalr	1560(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80005178:	000a0593          	mv	a1,s4
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	680080e7          	jalr	1664(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005184:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005188:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    8000518c:	04813083          	ld	ra,72(sp)
    80005190:	04013403          	ld	s0,64(sp)
    80005194:	03813483          	ld	s1,56(sp)
    80005198:	03013903          	ld	s2,48(sp)
    8000519c:	02813983          	ld	s3,40(sp)
    800051a0:	02013a03          	ld	s4,32(sp)
    800051a4:	01813a83          	ld	s5,24(sp)
    800051a8:	01013b03          	ld	s6,16(sp)
    800051ac:	05010113          	addi	sp,sp,80
    800051b0:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    800051b4:	00001097          	auipc	ra,0x1
    800051b8:	5d4080e7          	jalr	1492(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800051bc:	000a0593          	mv	a1,s4
    800051c0:	00001097          	auipc	ra,0x1
    800051c4:	7f8080e7          	jalr	2040(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    800051c8:	fbdff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    800051cc:	00070613          	mv	a2,a4
    800051d0:	00068593          	mv	a1,a3
    800051d4:	000a8513          	mv	a0,s5
    800051d8:	00002097          	auipc	ra,0x2
    800051dc:	638080e7          	jalr	1592(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800051e0:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    800051e4:	00050663          	beqz	a0,800051f0 <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    800051e8:	00000513          	li	a0,0
    800051ec:	f99ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    800051f0:	ffc00513          	li	a0,-4
    800051f4:	f91ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    800051f8:	00007797          	auipc	a5,0x7
    800051fc:	51878793          	addi	a5,a5,1304 # 8000c710 <_ZN3TCB7runningE>
    80005200:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80005204:	00200713          	li	a4,2
    80005208:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    8000520c:	00003097          	auipc	ra,0x3
    80005210:	8c0080e7          	jalr	-1856(ra) # 80007acc <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005214:	00048513          	mv	a0,s1
    80005218:	f6dff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    8000521c:	00007797          	auipc	a5,0x7
    80005220:	4e07b623          	sd	zero,1260(a5) # 8000c708 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005224:	00003097          	auipc	ra,0x3
    80005228:	9a0080e7          	jalr	-1632(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000522c:	00048513          	mv	a0,s1
    80005230:	f55ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    80005234:	00058513          	mv	a0,a1
    80005238:	00002097          	auipc	ra,0x2
    8000523c:	72c080e7          	jalr	1836(ra) # 80007964 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005240:	00048513          	mv	a0,s1
    80005244:	f41ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
*   THE ALLOCATION FOR THE KERNEL CLASSES 
*   it is easier to keep this lines in the file and just include
*   them in kernel structures
*/

void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	540080e7          	jalr	1344(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80005250:	00100593          	li	a1,1
    80005254:	00001097          	auipc	ra,0x1
    80005258:	5a8080e7          	jalr	1448(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    KSemaphore(unsigned val):val(val)
    8000525c:	01552423          	sw	s5,8(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80005260:	00053823          	sd	zero,16(a0)
    80005264:	00053c23          	sd	zero,24(a0)
    80005268:	02052023          	sw	zero,32(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    8000526c:	00007797          	auipc	a5,0x7
    80005270:	44478793          	addi	a5,a5,1092 # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    80005274:	0007b703          	ld	a4,0(a5)
    80005278:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    8000527c:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    80005280:	00aa3023          	sd	a0,0(s4)
        else ret = 0;
    80005284:	00000513          	li	a0,0
    80005288:	efdff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        ret = KSemaphore::close(t);
    8000528c:	00058513          	mv	a0,a1
    80005290:	00001097          	auipc	ra,0x1
    80005294:	338080e7          	jalr	824(ra) # 800065c8 <_ZN10KSemaphore5closeEPS_>
    80005298:	eedff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    8000529c:	00058513          	mv	a0,a1
    800052a0:	00001097          	auipc	ra,0x1
    800052a4:	3c4080e7          	jalr	964(ra) # 80006664 <_ZN10KSemaphore6existsEPS_>
    800052a8:	00051663          	bnez	a0,800052b4 <_Z8usrEcallmmmmm+0x27c>
            ret = -1;
    800052ac:	fff00513          	li	a0,-1
    800052b0:	ed5ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    800052b4:	000a0513          	mv	a0,s4
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	1e4080e7          	jalr	484(ra) # 8000649c <_ZN10KSemaphore4waitEv>
    800052c0:	ec5ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    800052c4:	00058513          	mv	a0,a1
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	39c080e7          	jalr	924(ra) # 80006664 <_ZN10KSemaphore6existsEPS_>
    800052d0:	00051663          	bnez	a0,800052dc <_Z8usrEcallmmmmm+0x2a4>
            ret = -1;
    800052d4:	fff00513          	li	a0,-1
    800052d8:	eadff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    800052dc:	000a0513          	mv	a0,s4
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	240080e7          	jalr	576(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    800052e8:	e9dff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    800052ec:	00058513          	mv	a0,a1
    800052f0:	00003097          	auipc	ra,0x3
    800052f4:	90c080e7          	jalr	-1780(ra) # 80007bfc <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800052f8:	00048513          	mv	a0,s1
    800052fc:	e89ff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    80005300:	00007797          	auipc	a5,0x7
    80005304:	3d878793          	addi	a5,a5,984 # 8000c6d8 <_ZN5StdIO7ibufferE>
    80005308:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    8000530c:	428a0513          	addi	a0,s4,1064
    80005310:	00001097          	auipc	ra,0x1
    80005314:	18c080e7          	jalr	396(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005318:	400a0a93          	addi	s5,s4,1024
    8000531c:	000a8513          	mv	a0,s5
    80005320:	00001097          	auipc	ra,0x1
    80005324:	17c080e7          	jalr	380(ra) # 8000649c <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80005328:	480a2783          	lw	a5,1152(s4)
    8000532c:	fff7879b          	addiw	a5,a5,-1
    80005330:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    80005334:	478a2783          	lw	a5,1144(s4)
    80005338:	00fa0733          	add	a4,s4,a5
    8000533c:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80005340:	0017879b          	addiw	a5,a5,1
    80005344:	41f7d71b          	sraiw	a4,a5,0x1f
    80005348:	0167571b          	srliw	a4,a4,0x16
    8000534c:	00e787bb          	addw	a5,a5,a4
    80005350:	3ff7f793          	andi	a5,a5,1023
    80005354:	40e787bb          	subw	a5,a5,a4
    80005358:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    8000535c:	450a0513          	addi	a0,s4,1104
    80005360:	00001097          	auipc	ra,0x1
    80005364:	1c0080e7          	jalr	448(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80005368:	000a8513          	mv	a0,s5
    8000536c:	00001097          	auipc	ra,0x1
    80005370:	1b4080e7          	jalr	436(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    80005374:	00048513          	mv	a0,s1
    80005378:	e0dff06f          	j	80005184 <_Z8usrEcallmmmmm+0x14c>

000000008000537c <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    8000537c:	fb010113          	addi	sp,sp,-80
    80005380:	04113423          	sd	ra,72(sp)
    80005384:	04813023          	sd	s0,64(sp)
    80005388:	02913c23          	sd	s1,56(sp)
    8000538c:	03213823          	sd	s2,48(sp)
    80005390:	03313423          	sd	s3,40(sp)
    80005394:	03413023          	sd	s4,32(sp)
    80005398:	01513c23          	sd	s5,24(sp)
    8000539c:	05010413          	addi	s0,sp,80
    800053a0:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800053a4:	141027f3          	csrr	a5,sepc
    800053a8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800053ac:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800053b0:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800053b4:	100027f3          	csrr	a5,sstatus
    800053b8:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800053bc:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    800053c0:	00100793          	li	a5,1
    800053c4:	0ef50663          	beq	a0,a5,800054b0 <_Z8sysEcallmmmmm+0x134>
    800053c8:	00050493          	mv	s1,a0
    800053cc:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    800053d0:	00200793          	li	a5,2
    800053d4:	10f50c63          	beq	a0,a5,800054ec <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    800053d8:	01100793          	li	a5,17
    800053dc:	12f50463          	beq	a0,a5,80005504 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    800053e0:	01200793          	li	a5,18
    800053e4:	14f50663          	beq	a0,a5,80005530 <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    800053e8:	01300793          	li	a5,19
    800053ec:	16f50663          	beq	a0,a5,80005558 <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    800053f0:	06900793          	li	a5,105
    800053f4:	18f50063          	beq	a0,a5,80005574 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    800053f8:	02100793          	li	a5,33
    800053fc:	18f50663          	beq	a0,a5,80005588 <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    80005400:	02200793          	li	a5,34
    80005404:	1cf50463          	beq	a0,a5,800055cc <_Z8sysEcallmmmmm+0x250>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80005408:	02300793          	li	a5,35
    8000540c:	1ef50663          	beq	a0,a5,800055f8 <_Z8sysEcallmmmmm+0x27c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    80005410:	02400793          	li	a5,36
    80005414:	1ef50c63          	beq	a0,a5,8000560c <_Z8sysEcallmmmmm+0x290>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80005418:	03100793          	li	a5,49
    8000541c:	20f50263          	beq	a0,a5,80005620 <_Z8sysEcallmmmmm+0x2a4>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    80005420:	04100793          	li	a5,65
    80005424:	20f50a63          	beq	a0,a5,80005638 <_Z8sysEcallmmmmm+0x2bc>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80005428:	04200793          	li	a5,66
    8000542c:	08f51c63          	bne	a0,a5,800054c4 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    80005430:	00007797          	auipc	a5,0x7
    80005434:	2a078793          	addi	a5,a5,672 # 8000c6d0 <_ZN5StdIO7obufferE>
    80005438:	0007ba03          	ld	s4,0(a5)
    8000543c:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    80005440:	450a0513          	addi	a0,s4,1104
    80005444:	00001097          	auipc	ra,0x1
    80005448:	058080e7          	jalr	88(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000544c:	400a0a93          	addi	s5,s4,1024
    80005450:	000a8513          	mv	a0,s5
    80005454:	00001097          	auipc	ra,0x1
    80005458:	048080e7          	jalr	72(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        tmpLen++;
    8000545c:	480a2783          	lw	a5,1152(s4)
    80005460:	0017879b          	addiw	a5,a5,1
    80005464:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    80005468:	47ca2783          	lw	a5,1148(s4)
    8000546c:	00fa0733          	add	a4,s4,a5
    80005470:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80005474:	0017879b          	addiw	a5,a5,1
    80005478:	41f7d71b          	sraiw	a4,a5,0x1f
    8000547c:	0167571b          	srliw	a4,a4,0x16
    80005480:	00e787bb          	addw	a5,a5,a4
    80005484:	3ff7f793          	andi	a5,a5,1023
    80005488:	40e787bb          	subw	a5,a5,a4
    8000548c:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    80005490:	428a0513          	addi	a0,s4,1064
    80005494:	00001097          	auipc	ra,0x1
    80005498:	08c080e7          	jalr	140(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000549c:	000a8513          	mv	a0,s5
    800054a0:	00001097          	auipc	ra,0x1
    800054a4:	080080e7          	jalr	128(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800054a8:	00048513          	mv	a0,s1
    800054ac:	0180006f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    800054b0:	00001097          	auipc	ra,0x1
    800054b4:	2d8080e7          	jalr	728(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800054b8:	00098593          	mv	a1,s3
    800054bc:	00001097          	auipc	ra,0x1
    800054c0:	340080e7          	jalr	832(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800054c4:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    800054c8:	04813083          	ld	ra,72(sp)
    800054cc:	04013403          	ld	s0,64(sp)
    800054d0:	03813483          	ld	s1,56(sp)
    800054d4:	03013903          	ld	s2,48(sp)
    800054d8:	02813983          	ld	s3,40(sp)
    800054dc:	02013a03          	ld	s4,32(sp)
    800054e0:	01813a83          	ld	s5,24(sp)
    800054e4:	05010113          	addi	sp,sp,80
    800054e8:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    800054ec:	00001097          	auipc	ra,0x1
    800054f0:	29c080e7          	jalr	668(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800054f4:	00098593          	mv	a1,s3
    800054f8:	00001097          	auipc	ra,0x1
    800054fc:	4c0080e7          	jalr	1216(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    80005500:	fc5ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    80005504:	00070613          	mv	a2,a4
    80005508:	00068593          	mv	a1,a3
    8000550c:	000a8513          	mv	a0,s5
    80005510:	00002097          	auipc	ra,0x2
    80005514:	300080e7          	jalr	768(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005518:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    8000551c:	00050663          	beqz	a0,80005528 <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    80005520:	00000513          	li	a0,0
    80005524:	fa1ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    80005528:	ffc00513          	li	a0,-4
    8000552c:	f99ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    80005530:	00007797          	auipc	a5,0x7
    80005534:	1e078793          	addi	a5,a5,480 # 8000c710 <_ZN3TCB7runningE>
    80005538:	0007b783          	ld	a5,0(a5)
    8000553c:	00200713          	li	a4,2
    80005540:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80005544:	00002097          	auipc	ra,0x2
    80005548:	588080e7          	jalr	1416(ra) # 80007acc <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000554c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005550:	00048513          	mv	a0,s1
    80005554:	f71ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    80005558:	00007797          	auipc	a5,0x7
    8000555c:	1a07b823          	sd	zero,432(a5) # 8000c708 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005560:	00002097          	auipc	ra,0x2
    80005564:	664080e7          	jalr	1636(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    80005568:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000556c:	00048513          	mv	a0,s1
    80005570:	f55ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80005574:	00058513          	mv	a0,a1
    80005578:	00002097          	auipc	ra,0x2
    8000557c:	3ec080e7          	jalr	1004(ra) # 80007964 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005580:	00048513          	mv	a0,s1
    80005584:	f41ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
    80005588:	00001097          	auipc	ra,0x1
    8000558c:	200080e7          	jalr	512(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80005590:	00100593          	li	a1,1
    80005594:	00001097          	auipc	ra,0x1
    80005598:	268080e7          	jalr	616(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    8000559c:	01552423          	sw	s5,8(a0)
    800055a0:	00053823          	sd	zero,16(a0)
    800055a4:	00053c23          	sd	zero,24(a0)
    800055a8:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    800055ac:	00007797          	auipc	a5,0x7
    800055b0:	10478793          	addi	a5,a5,260 # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    800055b4:	0007b703          	ld	a4,0(a5)
    800055b8:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    800055bc:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    800055c0:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800055c4:	00048513          	mv	a0,s1
    800055c8:	efdff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        delete t;
    800055cc:	ee058ce3          	beqz	a1,800054c4 <_Z8sysEcallmmmmm+0x148>
    800055d0:	00058513          	mv	a0,a1
    800055d4:	00001097          	auipc	ra,0x1
    800055d8:	fa0080e7          	jalr	-96(ra) # 80006574 <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    800055dc:	00001097          	auipc	ra,0x1
    800055e0:	1ac080e7          	jalr	428(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800055e4:	00098593          	mv	a1,s3
    800055e8:	00001097          	auipc	ra,0x1
    800055ec:	3d0080e7          	jalr	976(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800055f0:	00048513          	mv	a0,s1
    800055f4:	ed1ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800055f8:	00058513          	mv	a0,a1
    800055fc:	00001097          	auipc	ra,0x1
    80005600:	ea0080e7          	jalr	-352(ra) # 8000649c <_ZN10KSemaphore4waitEv>
    80005604:	100a1073          	csrw	sstatus,s4
    80005608:	ebdff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    8000560c:	00058513          	mv	a0,a1
    80005610:	00001097          	auipc	ra,0x1
    80005614:	f10080e7          	jalr	-240(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005618:	00048513          	mv	a0,s1
    8000561c:	ea9ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    80005620:	00058513          	mv	a0,a1
    80005624:	00002097          	auipc	ra,0x2
    80005628:	5d8080e7          	jalr	1496(ra) # 80007bfc <_ZN3TCB5sleepEm>
    8000562c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005630:	00048513          	mv	a0,s1
    80005634:	e91ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    80005638:	00007797          	auipc	a5,0x7
    8000563c:	0a078793          	addi	a5,a5,160 # 8000c6d8 <_ZN5StdIO7ibufferE>
    80005640:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    80005644:	42898513          	addi	a0,s3,1064
    80005648:	00001097          	auipc	ra,0x1
    8000564c:	e54080e7          	jalr	-428(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005650:	40098a13          	addi	s4,s3,1024
    80005654:	000a0513          	mv	a0,s4
    80005658:	00001097          	auipc	ra,0x1
    8000565c:	e44080e7          	jalr	-444(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        tmpLen--;
    80005660:	4809a783          	lw	a5,1152(s3)
    80005664:	fff7879b          	addiw	a5,a5,-1
    80005668:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    8000566c:	4789a783          	lw	a5,1144(s3)
    80005670:	00f98733          	add	a4,s3,a5
    80005674:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80005678:	0017879b          	addiw	a5,a5,1
    8000567c:	41f7d71b          	sraiw	a4,a5,0x1f
    80005680:	0167571b          	srliw	a4,a4,0x16
    80005684:	00e787bb          	addw	a5,a5,a4
    80005688:	3ff7f793          	andi	a5,a5,1023
    8000568c:	40e787bb          	subw	a5,a5,a4
    80005690:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    80005694:	45098513          	addi	a0,s3,1104
    80005698:	00001097          	auipc	ra,0x1
    8000569c:	e88080e7          	jalr	-376(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800056a0:	000a0513          	mv	a0,s4
    800056a4:	00001097          	auipc	ra,0x1
    800056a8:	e7c080e7          	jalr	-388(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    800056ac:	00048513          	mv	a0,s1
    800056b0:	e15ff06f          	j	800054c4 <_Z8sysEcallmmmmm+0x148>

00000000800056b4 <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800056b4:	fd010113          	addi	sp,sp,-48
    800056b8:	02113423          	sd	ra,40(sp)
    800056bc:	02813023          	sd	s0,32(sp)
    800056c0:	00913c23          	sd	s1,24(sp)
    800056c4:	01213823          	sd	s2,16(sp)
    800056c8:	03010413          	addi	s0,sp,48
    asm volatile("csrr %0, scause" : "=r" (scause));
    800056cc:	142027f3          	csrr	a5,scause
    800056d0:	fcf43823          	sd	a5,-48(s0)
    return scause;
    800056d4:	fd043483          	ld	s1,-48(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;

    if(scause == IS)
    800056d8:	00900793          	li	a5,9
    800056dc:	12f48863          	beq	s1,a5,8000580c <interrupt+0x158>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    800056e0:	00800793          	li	a5,8
    800056e4:	14f48663          	beq	s1,a5,80005830 <interrupt+0x17c>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    800056e8:	fff00793          	li	a5,-1
    800056ec:	03f79793          	slli	a5,a5,0x3f
    800056f0:	00978793          	addi	a5,a5,9
    800056f4:	14f48663          	beq	s1,a5,80005840 <interrupt+0x18c>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800056f8:	fff00793          	li	a5,-1
    800056fc:	03f79793          	slli	a5,a5,0x3f
    80005700:	00178793          	addi	a5,a5,1
    80005704:	14f48463          	beq	s1,a5,8000584c <interrupt+0x198>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == II || scause == IR || scause == IW)
    80005708:	00200793          	li	a5,2
    8000570c:	00f48a63          	beq	s1,a5,80005720 <interrupt+0x6c>
    80005710:	00500793          	li	a5,5
    80005714:	00f48663          	beq	s1,a5,80005720 <interrupt+0x6c>
    80005718:	00700793          	li	a5,7
    8000571c:	0ef49e63          	bne	s1,a5,80005818 <interrupt+0x164>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    80005720:	00007797          	auipc	a5,0x7
    80005724:	ff078793          	addi	a5,a5,-16 # 8000c710 <_ZN3TCB7runningE>
    80005728:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    8000572c:	0357c783          	lbu	a5,53(a5)
    80005730:	12078463          	beqz	a5,80005858 <interrupt+0x1a4>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    80005734:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    80005738:	00005517          	auipc	a0,0x5
    8000573c:	a4050513          	addi	a0,a0,-1472 # 8000a178 <CONSOLE_STATUS+0x168>
    80005740:	00000097          	auipc	ra,0x0
    80005744:	200080e7          	jalr	512(ra) # 80005940 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    80005748:	00005517          	auipc	a0,0x5
    8000574c:	a6850513          	addi	a0,a0,-1432 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80005750:	00000097          	auipc	ra,0x0
    80005754:	1f0080e7          	jalr	496(ra) # 80005940 <_Z12kprintStringPKc>
    80005758:	00000613          	li	a2,0
    8000575c:	01000593          	li	a1,16
    80005760:	00048513          	mv	a0,s1
    80005764:	00000097          	auipc	ra,0x0
    80005768:	224080e7          	jalr	548(ra) # 80005988 <_Z9kprintIntmib>
    8000576c:	00005517          	auipc	a0,0x5
    80005770:	d5c50513          	addi	a0,a0,-676 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005774:	00000097          	auipc	ra,0x0
    80005778:	1cc080e7          	jalr	460(ra) # 80005940 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    8000577c:	00005517          	auipc	a0,0x5
    80005780:	a4450513          	addi	a0,a0,-1468 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80005784:	00000097          	auipc	ra,0x0
    80005788:	1bc080e7          	jalr	444(ra) # 80005940 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000578c:	141027f3          	csrr	a5,sepc
    80005790:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80005794:	fd843503          	ld	a0,-40(s0)
    80005798:	00000613          	li	a2,0
    8000579c:	01000593          	li	a1,16
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	1e8080e7          	jalr	488(ra) # 80005988 <_Z9kprintIntmib>
    800057a8:	00005517          	auipc	a0,0x5
    800057ac:	d2050513          	addi	a0,a0,-736 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800057b0:	00000097          	auipc	ra,0x0
    800057b4:	190080e7          	jalr	400(ra) # 80005940 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    800057b8:	00005517          	auipc	a0,0x5
    800057bc:	a1050513          	addi	a0,a0,-1520 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    800057c0:	00000097          	auipc	ra,0x0
    800057c4:	180080e7          	jalr	384(ra) # 80005940 <_Z12kprintStringPKc>
    800057c8:	00000613          	li	a2,0
    800057cc:	01000593          	li	a1,16
    800057d0:	00090513          	mv	a0,s2
    800057d4:	00000097          	auipc	ra,0x0
    800057d8:	1b4080e7          	jalr	436(ra) # 80005988 <_Z9kprintIntmib>
    800057dc:	00005517          	auipc	a0,0x5
    800057e0:	9f450513          	addi	a0,a0,-1548 # 8000a1d0 <CONSOLE_STATUS+0x1c0>
    800057e4:	00000097          	auipc	ra,0x0
    800057e8:	15c080e7          	jalr	348(ra) # 80005940 <_Z12kprintStringPKc>
            TCB::running->finish();
    800057ec:	00007797          	auipc	a5,0x7
    800057f0:	f2478793          	addi	a5,a5,-220 # 8000c710 <_ZN3TCB7runningE>
    800057f4:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800057f8:	00200713          	li	a4,2
    800057fc:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    80005800:	00002097          	auipc	ra,0x2
    80005804:	2cc080e7          	jalr	716(ra) # 80007acc <_ZN3TCB8dispatchEv>
    80005808:	0100006f          	j	80005818 <interrupt+0x164>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    8000580c:	00000097          	auipc	ra,0x0
    80005810:	b70080e7          	jalr	-1168(ra) # 8000537c <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80005814:	04a43823          	sd	a0,80(s0)
        }
    }
                    
    
    //print(a4);
    80005818:	02813083          	ld	ra,40(sp)
    8000581c:	02013403          	ld	s0,32(sp)
    80005820:	01813483          	ld	s1,24(sp)
    80005824:	01013903          	ld	s2,16(sp)
    80005828:	03010113          	addi	sp,sp,48
    8000582c:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80005830:	00000097          	auipc	ra,0x0
    80005834:	808080e7          	jalr	-2040(ra) # 80005038 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80005838:	04a43823          	sd	a0,80(s0)
    8000583c:	fddff06f          	j	80005818 <interrupt+0x164>
       StdIO::console_handler();
    80005840:	00002097          	auipc	ra,0x2
    80005844:	d78080e7          	jalr	-648(ra) # 800075b8 <_ZN5StdIO15console_handlerEv>
    80005848:	fd1ff06f          	j	80005818 <interrupt+0x164>
        timer_handler();      
    8000584c:	fffff097          	auipc	ra,0xfffff
    80005850:	750080e7          	jalr	1872(ra) # 80004f9c <_Z13timer_handlerv>
    80005854:	fc5ff06f          	j	80005818 <interrupt+0x164>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    80005858:	00005517          	auipc	a0,0x5
    8000585c:	98050513          	addi	a0,a0,-1664 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80005860:	00000097          	auipc	ra,0x0
    80005864:	0e0080e7          	jalr	224(ra) # 80005940 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    80005868:	00002097          	auipc	ra,0x2
    8000586c:	408080e7          	jalr	1032(ra) # 80007c70 <_ZN3TCB13panicDispatchEv>
    80005870:	fa9ff06f          	j	80005818 <interrupt+0x164>

0000000080005874 <_Z15userMainWrapperPv>:
#include"../../h/kernel_lib.h"


void userMainWrapper(void*)
{
    80005874:	ff010113          	addi	sp,sp,-16
    80005878:	00113423          	sd	ra,8(sp)
    8000587c:	00813023          	sd	s0,0(sp)
    80005880:	01010413          	addi	s0,sp,16
    userMain();
    80005884:	00004097          	auipc	ra,0x4
    80005888:	8f0080e7          	jalr	-1808(ra) # 80009174 <_Z8userMainv>
}
    8000588c:	00813083          	ld	ra,8(sp)
    80005890:	00013403          	ld	s0,0(sp)
    80005894:	01010113          	addi	sp,sp,16
    80005898:	00008067          	ret

000000008000589c <_Z12idleFunctionPv>:

void idleFunction(void*)
{
    8000589c:	ff010113          	addi	sp,sp,-16
    800058a0:	00113423          	sd	ra,8(sp)
    800058a4:	00813023          	sd	s0,0(sp)
    800058a8:	01010413          	addi	s0,sp,16
        *   We could make preemptive kernel thread but that is a little bit harder.
        *   We must make INTERRUPTION LOCK FUNCTION (function that disables interrupts)  
        *   that will lock the thread when executing critical section code! TODO or NOT
        *    
        */
        thread_dispatch();
    800058ac:	00002097          	auipc	ra,0x2
    800058b0:	7bc080e7          	jalr	1980(ra) # 80008068 <thread_dispatch>
    800058b4:	ff9ff06f          	j	800058ac <_Z12idleFunctionPv+0x10>

00000000800058b8 <_Z7kmallocm>:
    }
}

void* kmalloc(size_t size)
{
    800058b8:	fe010113          	addi	sp,sp,-32
    800058bc:	00113c23          	sd	ra,24(sp)
    800058c0:	00813823          	sd	s0,16(sp)
    800058c4:	00913423          	sd	s1,8(sp)
    800058c8:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    800058cc:	fff50493          	addi	s1,a0,-1
    800058d0:	0064d493          	srli	s1,s1,0x6
    800058d4:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    800058d8:	00001097          	auipc	ra,0x1
    800058dc:	eb0080e7          	jalr	-336(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800058e0:	00048593          	mv	a1,s1
    800058e4:	00001097          	auipc	ra,0x1
    800058e8:	f18080e7          	jalr	-232(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
}
    800058ec:	01813083          	ld	ra,24(sp)
    800058f0:	01013403          	ld	s0,16(sp)
    800058f4:	00813483          	ld	s1,8(sp)
    800058f8:	02010113          	addi	sp,sp,32
    800058fc:	00008067          	ret

0000000080005900 <_Z5kputcc>:

void kputc(char c){
    80005900:	ff010113          	addi	sp,sp,-16
    80005904:	00813423          	sd	s0,8(sp)
    80005908:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    8000590c:	00004797          	auipc	a5,0x4
    80005910:	6fc78793          	addi	a5,a5,1788 # 8000a008 <CONSOLE_TX_DATA>
    80005914:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    80005918:	00004797          	auipc	a5,0x4
    8000591c:	6f878793          	addi	a5,a5,1784 # 8000a010 <CONSOLE_STATUS>
    80005920:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    80005924:	00074783          	lbu	a5,0(a4)
    80005928:	0207f793          	andi	a5,a5,32
    8000592c:	fe078ce3          	beqz	a5,80005924 <_Z5kputcc+0x24>
    *odata = c;
    80005930:	00a68023          	sb	a0,0(a3)
}
    80005934:	00813403          	ld	s0,8(sp)
    80005938:	01010113          	addi	sp,sp,16
    8000593c:	00008067          	ret

0000000080005940 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    80005940:	fe010113          	addi	sp,sp,-32
    80005944:	00113c23          	sd	ra,24(sp)
    80005948:	00813823          	sd	s0,16(sp)
    8000594c:	00913423          	sd	s1,8(sp)
    80005950:	02010413          	addi	s0,sp,32
    80005954:	00050493          	mv	s1,a0
    if(!string) return;
    80005958:	00050e63          	beqz	a0,80005974 <_Z12kprintStringPKc+0x34>
    while(*string)
    8000595c:	0004c503          	lbu	a0,0(s1)
    80005960:	00050a63          	beqz	a0,80005974 <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    80005964:	00000097          	auipc	ra,0x0
    80005968:	f9c080e7          	jalr	-100(ra) # 80005900 <_Z5kputcc>
        string++;
    8000596c:	00148493          	addi	s1,s1,1
    while(*string)
    80005970:	fedff06f          	j	8000595c <_Z12kprintStringPKc+0x1c>
    }
}
    80005974:	01813083          	ld	ra,24(sp)
    80005978:	01013403          	ld	s0,16(sp)
    8000597c:	00813483          	ld	s1,8(sp)
    80005980:	02010113          	addi	sp,sp,32
    80005984:	00008067          	ret

0000000080005988 <_Z9kprintIntmib>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base, bool sgn){
    80005988:	fc010113          	addi	sp,sp,-64
    8000598c:	02113c23          	sd	ra,56(sp)
    80005990:	02813823          	sd	s0,48(sp)
    80005994:	02913423          	sd	s1,40(sp)
    80005998:	03213023          	sd	s2,32(sp)
    8000599c:	01313c23          	sd	s3,24(sp)
    800059a0:	04010413          	addi	s0,sp,64
    800059a4:	00050913          	mv	s2,a0
    800059a8:	00058993          	mv	s3,a1
    char buf[16];
    int i;
    if(sgn && base == 10){ 
    800059ac:	00060663          	beqz	a2,800059b8 <_Z9kprintIntmib+0x30>
    800059b0:	00a00793          	li	a5,10
    800059b4:	00f58663          	beq	a1,a5,800059c0 <_Z9kprintIntmib+0x38>
void kprintInt(uint64 xx, int base, bool sgn){
    800059b8:	00000793          	li	a5,0
    800059bc:	01c0006f          	j	800059d8 <_Z9kprintIntmib+0x50>
        kputc('-');
    800059c0:	02d00513          	li	a0,45
    800059c4:	00000097          	auipc	ra,0x0
    800059c8:	f3c080e7          	jalr	-196(ra) # 80005900 <_Z5kputcc>
        xx = -xx;
    800059cc:	41200933          	neg	s2,s2
    800059d0:	fe9ff06f          	j	800059b8 <_Z9kprintIntmib+0x30>
    }

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    800059d4:	00070913          	mv	s2,a4
        buf[i++] = kdigits[xx % base];
    800059d8:	033976b3          	remu	a3,s2,s3
    800059dc:	0017849b          	addiw	s1,a5,1
    800059e0:	00007717          	auipc	a4,0x7
    800059e4:	ae070713          	addi	a4,a4,-1312 # 8000c4c0 <kdigits>
    800059e8:	00d70733          	add	a4,a4,a3
    800059ec:	00074703          	lbu	a4,0(a4)
    800059f0:	fd040693          	addi	a3,s0,-48
    800059f4:	00f687b3          	add	a5,a3,a5
    800059f8:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    800059fc:	03395733          	divu	a4,s2,s3
        buf[i++] = kdigits[xx % base];
    80005a00:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80005a04:	fd3978e3          	bgeu	s2,s3,800059d4 <_Z9kprintIntmib+0x4c>
    
    while(--i >= 0)
    80005a08:	fff4849b          	addiw	s1,s1,-1
    80005a0c:	0004ce63          	bltz	s1,80005a28 <_Z9kprintIntmib+0xa0>
        kputc(buf[i]);
    80005a10:	fd040793          	addi	a5,s0,-48
    80005a14:	009787b3          	add	a5,a5,s1
    80005a18:	ff07c503          	lbu	a0,-16(a5)
    80005a1c:	00000097          	auipc	ra,0x0
    80005a20:	ee4080e7          	jalr	-284(ra) # 80005900 <_Z5kputcc>
    while(--i >= 0)
    80005a24:	fe5ff06f          	j	80005a08 <_Z9kprintIntmib+0x80>
}
    80005a28:	03813083          	ld	ra,56(sp)
    80005a2c:	03013403          	ld	s0,48(sp)
    80005a30:	02813483          	ld	s1,40(sp)
    80005a34:	02013903          	ld	s2,32(sp)
    80005a38:	01813983          	ld	s3,24(sp)
    80005a3c:	04010113          	addi	sp,sp,64
    80005a40:	00008067          	ret

0000000080005a44 <_Z10kernelInitv>:
{
    80005a44:	fd010113          	addi	sp,sp,-48
    80005a48:	02113423          	sd	ra,40(sp)
    80005a4c:	02813023          	sd	s0,32(sp)
    80005a50:	00913c23          	sd	s1,24(sp)
    80005a54:	01213823          	sd	s2,16(sp)
    80005a58:	01313423          	sd	s3,8(sp)
    80005a5c:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    80005a60:	00004517          	auipc	a0,0x4
    80005a64:	7b050513          	addi	a0,a0,1968 # 8000a210 <CONSOLE_STATUS+0x200>
    80005a68:	00000097          	auipc	ra,0x0
    80005a6c:	ed8080e7          	jalr	-296(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_START_ADDR);
    80005a70:	00004517          	auipc	a0,0x4
    80005a74:	7d050513          	addi	a0,a0,2000 # 8000a240 <CONSOLE_STATUS+0x230>
    80005a78:	00000097          	auipc	ra,0x0
    80005a7c:	ec8080e7          	jalr	-312(ra) # 80005940 <_Z12kprintStringPKc>
    80005a80:	00000613          	li	a2,0
    80005a84:	01000593          	li	a1,16
    80005a88:	00007797          	auipc	a5,0x7
    80005a8c:	a2878793          	addi	a5,a5,-1496 # 8000c4b0 <HEAP_START_ADDR>
    80005a90:	0007b503          	ld	a0,0(a5)
    80005a94:	00000097          	auipc	ra,0x0
    80005a98:	ef4080e7          	jalr	-268(ra) # 80005988 <_Z9kprintIntmib>
    80005a9c:	00005517          	auipc	a0,0x5
    80005aa0:	a2c50513          	addi	a0,a0,-1492 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	e9c080e7          	jalr	-356(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    80005aac:	00004517          	auipc	a0,0x4
    80005ab0:	7ac50513          	addi	a0,a0,1964 # 8000a258 <CONSOLE_STATUS+0x248>
    80005ab4:	00000097          	auipc	ra,0x0
    80005ab8:	e8c080e7          	jalr	-372(ra) # 80005940 <_Z12kprintStringPKc>
    80005abc:	00000613          	li	a2,0
    80005ac0:	01000593          	li	a1,16
    80005ac4:	00007797          	auipc	a5,0x7
    80005ac8:	9e478793          	addi	a5,a5,-1564 # 8000c4a8 <HEAP_END_ADDR>
    80005acc:	0007b503          	ld	a0,0(a5)
    80005ad0:	00000097          	auipc	ra,0x0
    80005ad4:	eb8080e7          	jalr	-328(ra) # 80005988 <_Z9kprintIntmib>
    80005ad8:	00005517          	auipc	a0,0x5
    80005adc:	9f050513          	addi	a0,a0,-1552 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005ae0:	00000097          	auipc	ra,0x0
    80005ae4:	e60080e7          	jalr	-416(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    80005ae8:	00004517          	auipc	a0,0x4
    80005aec:	78050513          	addi	a0,a0,1920 # 8000a268 <CONSOLE_STATUS+0x258>
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	e50080e7          	jalr	-432(ra) # 80005940 <_Z12kprintStringPKc>
    80005af8:	00000613          	li	a2,0
    80005afc:	01000593          	li	a1,16
    80005b00:	ffffe797          	auipc	a5,0xffffe
    80005b04:	61078793          	addi	a5,a5,1552 # 80004110 <KERNEL_TEXT_START>
    80005b08:	0007b503          	ld	a0,0(a5)
    80005b0c:	00000097          	auipc	ra,0x0
    80005b10:	e7c080e7          	jalr	-388(ra) # 80005988 <_Z9kprintIntmib>
    80005b14:	00005517          	auipc	a0,0x5
    80005b18:	9b450513          	addi	a0,a0,-1612 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005b1c:	00000097          	auipc	ra,0x0
    80005b20:	e24080e7          	jalr	-476(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    80005b24:	00004517          	auipc	a0,0x4
    80005b28:	75c50513          	addi	a0,a0,1884 # 8000a280 <CONSOLE_STATUS+0x270>
    80005b2c:	00000097          	auipc	ra,0x0
    80005b30:	e14080e7          	jalr	-492(ra) # 80005940 <_Z12kprintStringPKc>
    80005b34:	00000613          	li	a2,0
    80005b38:	01000593          	li	a1,16
    80005b3c:	ffffe797          	auipc	a5,0xffffe
    80005b40:	5dc78793          	addi	a5,a5,1500 # 80004118 <KERNEL_TEXT_END>
    80005b44:	0007b503          	ld	a0,0(a5)
    80005b48:	00000097          	auipc	ra,0x0
    80005b4c:	e40080e7          	jalr	-448(ra) # 80005988 <_Z9kprintIntmib>
    80005b50:	00005517          	auipc	a0,0x5
    80005b54:	97850513          	addi	a0,a0,-1672 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005b58:	00000097          	auipc	ra,0x0
    80005b5c:	de8080e7          	jalr	-536(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    80005b60:	00004517          	auipc	a0,0x4
    80005b64:	73850513          	addi	a0,a0,1848 # 8000a298 <CONSOLE_STATUS+0x288>
    80005b68:	00000097          	auipc	ra,0x0
    80005b6c:	dd8080e7          	jalr	-552(ra) # 80005940 <_Z12kprintStringPKc>
    80005b70:	00000613          	li	a2,0
    80005b74:	01000593          	li	a1,16
    80005b78:	ffffe797          	auipc	a5,0xffffe
    80005b7c:	5a878793          	addi	a5,a5,1448 # 80004120 <USER_TEXT_START>
    80005b80:	0007b503          	ld	a0,0(a5)
    80005b84:	00000097          	auipc	ra,0x0
    80005b88:	e04080e7          	jalr	-508(ra) # 80005988 <_Z9kprintIntmib>
    80005b8c:	00005517          	auipc	a0,0x5
    80005b90:	93c50513          	addi	a0,a0,-1732 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005b94:	00000097          	auipc	ra,0x0
    80005b98:	dac080e7          	jalr	-596(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    80005b9c:	00004517          	auipc	a0,0x4
    80005ba0:	71450513          	addi	a0,a0,1812 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    80005ba4:	00000097          	auipc	ra,0x0
    80005ba8:	d9c080e7          	jalr	-612(ra) # 80005940 <_Z12kprintStringPKc>
    80005bac:	00000613          	li	a2,0
    80005bb0:	01000593          	li	a1,16
    80005bb4:	ffffe797          	auipc	a5,0xffffe
    80005bb8:	57478793          	addi	a5,a5,1396 # 80004128 <USER_TEXT_END>
    80005bbc:	0007b503          	ld	a0,0(a5)
    80005bc0:	00000097          	auipc	ra,0x0
    80005bc4:	dc8080e7          	jalr	-568(ra) # 80005988 <_Z9kprintIntmib>
    80005bc8:	00005517          	auipc	a0,0x5
    80005bcc:	90050513          	addi	a0,a0,-1792 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	d70080e7          	jalr	-656(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    80005bd8:	00004517          	auipc	a0,0x4
    80005bdc:	6e850513          	addi	a0,a0,1768 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    80005be0:	00000097          	auipc	ra,0x0
    80005be4:	d60080e7          	jalr	-672(ra) # 80005940 <_Z12kprintStringPKc>
    80005be8:	00000613          	li	a2,0
    80005bec:	01000593          	li	a1,16
    80005bf0:	00001537          	lui	a0,0x1
    80005bf4:	00000097          	auipc	ra,0x0
    80005bf8:	d94080e7          	jalr	-620(ra) # 80005988 <_Z9kprintIntmib>
    80005bfc:	00005517          	auipc	a0,0x5
    80005c00:	8cc50513          	addi	a0,a0,-1844 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005c04:	00000097          	auipc	ra,0x0
    80005c08:	d3c080e7          	jalr	-708(ra) # 80005940 <_Z12kprintStringPKc>
    kprintString("\n\n");
    80005c0c:	00004517          	auipc	a0,0x4
    80005c10:	5c450513          	addi	a0,a0,1476 # 8000a1d0 <CONSOLE_STATUS+0x1c0>
    80005c14:	00000097          	auipc	ra,0x0
    80005c18:	d2c080e7          	jalr	-724(ra) # 80005940 <_Z12kprintStringPKc>
    NoAlloc::init();
    80005c1c:	00001097          	auipc	ra,0x1
    80005c20:	044080e7          	jalr	68(ra) # 80006c60 <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    80005c24:	00004517          	auipc	a0,0x4
    80005c28:	6ac50513          	addi	a0,a0,1708 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80005c2c:	00000097          	auipc	ra,0x0
    80005c30:	d14080e7          	jalr	-748(ra) # 80005940 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005c34:	00004517          	auipc	a0,0x4
    80005c38:	6b450513          	addi	a0,a0,1716 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80005c3c:	00000097          	auipc	ra,0x0
    80005c40:	d04080e7          	jalr	-764(ra) # 80005940 <_Z12kprintStringPKc>
    80005c44:	00000613          	li	a2,0
    80005c48:	01000593          	li	a1,16
    80005c4c:	00007797          	auipc	a5,0x7
    80005c50:	a6c78793          	addi	a5,a5,-1428 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80005c54:	0007b503          	ld	a0,0(a5)
    80005c58:	00000097          	auipc	ra,0x0
    80005c5c:	d30080e7          	jalr	-720(ra) # 80005988 <_Z9kprintIntmib>
    80005c60:	00005517          	auipc	a0,0x5
    80005c64:	86850513          	addi	a0,a0,-1944 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005c68:	00000097          	auipc	ra,0x0
    80005c6c:	cd8080e7          	jalr	-808(ra) # 80005940 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec); 
    80005c70:	ffffe797          	auipc	a5,0xffffe
    80005c74:	39078793          	addi	a5,a5,912 # 80004000 <_kernel_text_start>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    80005c78:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80005c7c:	00004517          	auipc	a0,0x4
    80005c80:	68450513          	addi	a0,a0,1668 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80005c84:	00000097          	auipc	ra,0x0
    80005c88:	cbc080e7          	jalr	-836(ra) # 80005940 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance();
    80005c8c:	00001097          	auipc	ra,0x1
    80005c90:	afc080e7          	jalr	-1284(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    kprintString("MemoryAllocator initalized!\n");
    80005c94:	00004517          	auipc	a0,0x4
    80005c98:	68450513          	addi	a0,a0,1668 # 8000a318 <CONSOLE_STATUS+0x308>
    80005c9c:	00000097          	auipc	ra,0x0
    80005ca0:	ca4080e7          	jalr	-860(ra) # 80005940 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80005ca4:	00001097          	auipc	ra,0x1
    80005ca8:	430080e7          	jalr	1072(ra) # 800070d4 <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80005cac:	00004517          	auipc	a0,0x4
    80005cb0:	68c50513          	addi	a0,a0,1676 # 8000a338 <CONSOLE_STATUS+0x328>
    80005cb4:	00000097          	auipc	ra,0x0
    80005cb8:	c8c080e7          	jalr	-884(ra) # 80005940 <_Z12kprintStringPKc>
    StdIO::initalize();
    80005cbc:	00001097          	auipc	ra,0x1
    80005cc0:	6fc080e7          	jalr	1788(ra) # 800073b8 <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80005cc4:	00004517          	auipc	a0,0x4
    80005cc8:	68c50513          	addi	a0,a0,1676 # 8000a350 <CONSOLE_STATUS+0x340>
    80005ccc:	00000097          	auipc	ra,0x0
    80005cd0:	c74080e7          	jalr	-908(ra) # 80005940 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80005cd4:	00002097          	auipc	ra,0x2
    80005cd8:	d14080e7          	jalr	-748(ra) # 800079e8 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80005cdc:	00004517          	auipc	a0,0x4
    80005ce0:	68c50513          	addi	a0,a0,1676 # 8000a368 <CONSOLE_STATUS+0x358>
    80005ce4:	00000097          	auipc	ra,0x0
    80005ce8:	c5c080e7          	jalr	-932(ra) # 80005940 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80005cec:	00004517          	auipc	a0,0x4
    80005cf0:	69c50513          	addi	a0,a0,1692 # 8000a388 <CONSOLE_STATUS+0x378>
    80005cf4:	00000097          	auipc	ra,0x0
    80005cf8:	c4c080e7          	jalr	-948(ra) # 80005940 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80005cfc:	00001537          	lui	a0,0x1
    80005d00:	00000097          	auipc	ra,0x0
    80005d04:	bb8080e7          	jalr	-1096(ra) # 800058b8 <_Z7kmallocm>
    80005d08:	00050493          	mv	s1,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80005d0c:	00050613          	mv	a2,a0
    80005d10:	00000593          	li	a1,0
    80005d14:	00000517          	auipc	a0,0x0
    80005d18:	b6050513          	addi	a0,a0,-1184 # 80005874 <_Z15userMainWrapperPv>
    80005d1c:	00002097          	auipc	ra,0x2
    80005d20:	af4080e7          	jalr	-1292(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005d24:	00050993          	mv	s3,a0
    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80005d28:	00001537          	lui	a0,0x1
    80005d2c:	00000097          	auipc	ra,0x0
    80005d30:	b8c080e7          	jalr	-1140(ra) # 800058b8 <_Z7kmallocm>
    80005d34:	00050913          	mv	s2,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    80005d38:	00050613          	mv	a2,a0
    80005d3c:	00000593          	li	a1,0
    80005d40:	00000517          	auipc	a0,0x0
    80005d44:	b5c50513          	addi	a0,a0,-1188 # 8000589c <_Z12idleFunctionPv>
    80005d48:	00002097          	auipc	ra,0x2
    80005d4c:	ac8080e7          	jalr	-1336(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    80005d50:	04048863          	beqz	s1,80005da0 <_Z10kernelInitv+0x35c>
    80005d54:	04090a63          	beqz	s2,80005da8 <_Z10kernelInitv+0x364>
    80005d58:	04050c63          	beqz	a0,80005db0 <_Z10kernelInitv+0x36c>
    80005d5c:	04098e63          	beqz	s3,80005db8 <_Z10kernelInitv+0x374>
        kprintString("Threads successfully initalized!\n");
    80005d60:	00004517          	auipc	a0,0x4
    80005d64:	65850513          	addi	a0,a0,1624 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80005d68:	00000097          	auipc	ra,0x0
    80005d6c:	bd8080e7          	jalr	-1064(ra) # 80005940 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80005d70:	00004517          	auipc	a0,0x4
    80005d74:	67050513          	addi	a0,a0,1648 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80005d78:	00000097          	auipc	ra,0x0
    80005d7c:	bc8080e7          	jalr	-1080(ra) # 80005940 <_Z12kprintStringPKc>
    return 0;
    80005d80:	00000513          	li	a0,0
}
    80005d84:	02813083          	ld	ra,40(sp)
    80005d88:	02013403          	ld	s0,32(sp)
    80005d8c:	01813483          	ld	s1,24(sp)
    80005d90:	01013903          	ld	s2,16(sp)
    80005d94:	00813983          	ld	s3,8(sp)
    80005d98:	03010113          	addi	sp,sp,48
    80005d9c:	00008067          	ret
        return -1; /* EXCEPTION */
    80005da0:	fff00513          	li	a0,-1
    80005da4:	fe1ff06f          	j	80005d84 <_Z10kernelInitv+0x340>
    80005da8:	fff00513          	li	a0,-1
    80005dac:	fd9ff06f          	j	80005d84 <_Z10kernelInitv+0x340>
    80005db0:	fff00513          	li	a0,-1
    80005db4:	fd1ff06f          	j	80005d84 <_Z10kernelInitv+0x340>
    80005db8:	fff00513          	li	a0,-1
    80005dbc:	fc9ff06f          	j	80005d84 <_Z10kernelInitv+0x340>

0000000080005dc0 <_Z13newKernelInitv>:

int newKernelInit(){
    80005dc0:	ff010113          	addi	sp,sp,-16
    80005dc4:	00113423          	sd	ra,8(sp)
    80005dc8:	00813023          	sd	s0,0(sp)
    80005dcc:	01010413          	addi	s0,sp,16
    kprintString("--------------KERNEL INIT--------------\n");
    80005dd0:	00004517          	auipc	a0,0x4
    80005dd4:	44050513          	addi	a0,a0,1088 # 8000a210 <CONSOLE_STATUS+0x200>
    80005dd8:	00000097          	auipc	ra,0x0
    80005ddc:	b68080e7          	jalr	-1176(ra) # 80005940 <_Z12kprintStringPKc>
    /* CHECKING VALUES OF KERNEL STATIC VARIABLES */
    KCHECKPRINT(HEAP_START_ADDR);
    80005de0:	00004517          	auipc	a0,0x4
    80005de4:	46050513          	addi	a0,a0,1120 # 8000a240 <CONSOLE_STATUS+0x230>
    80005de8:	00000097          	auipc	ra,0x0
    80005dec:	b58080e7          	jalr	-1192(ra) # 80005940 <_Z12kprintStringPKc>
    80005df0:	00000613          	li	a2,0
    80005df4:	01000593          	li	a1,16
    80005df8:	00006797          	auipc	a5,0x6
    80005dfc:	6b878793          	addi	a5,a5,1720 # 8000c4b0 <HEAP_START_ADDR>
    80005e00:	0007b503          	ld	a0,0(a5)
    80005e04:	00000097          	auipc	ra,0x0
    80005e08:	b84080e7          	jalr	-1148(ra) # 80005988 <_Z9kprintIntmib>
    80005e0c:	00004517          	auipc	a0,0x4
    80005e10:	6bc50513          	addi	a0,a0,1724 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005e14:	00000097          	auipc	ra,0x0
    80005e18:	b2c080e7          	jalr	-1236(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    80005e1c:	00004517          	auipc	a0,0x4
    80005e20:	43c50513          	addi	a0,a0,1084 # 8000a258 <CONSOLE_STATUS+0x248>
    80005e24:	00000097          	auipc	ra,0x0
    80005e28:	b1c080e7          	jalr	-1252(ra) # 80005940 <_Z12kprintStringPKc>
    80005e2c:	00000613          	li	a2,0
    80005e30:	01000593          	li	a1,16
    80005e34:	00006797          	auipc	a5,0x6
    80005e38:	67478793          	addi	a5,a5,1652 # 8000c4a8 <HEAP_END_ADDR>
    80005e3c:	0007b503          	ld	a0,0(a5)
    80005e40:	00000097          	auipc	ra,0x0
    80005e44:	b48080e7          	jalr	-1208(ra) # 80005988 <_Z9kprintIntmib>
    80005e48:	00004517          	auipc	a0,0x4
    80005e4c:	68050513          	addi	a0,a0,1664 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005e50:	00000097          	auipc	ra,0x0
    80005e54:	af0080e7          	jalr	-1296(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    80005e58:	00004517          	auipc	a0,0x4
    80005e5c:	41050513          	addi	a0,a0,1040 # 8000a268 <CONSOLE_STATUS+0x258>
    80005e60:	00000097          	auipc	ra,0x0
    80005e64:	ae0080e7          	jalr	-1312(ra) # 80005940 <_Z12kprintStringPKc>
    80005e68:	00000613          	li	a2,0
    80005e6c:	01000593          	li	a1,16
    80005e70:	ffffe797          	auipc	a5,0xffffe
    80005e74:	2a078793          	addi	a5,a5,672 # 80004110 <KERNEL_TEXT_START>
    80005e78:	0007b503          	ld	a0,0(a5)
    80005e7c:	00000097          	auipc	ra,0x0
    80005e80:	b0c080e7          	jalr	-1268(ra) # 80005988 <_Z9kprintIntmib>
    80005e84:	00004517          	auipc	a0,0x4
    80005e88:	64450513          	addi	a0,a0,1604 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005e8c:	00000097          	auipc	ra,0x0
    80005e90:	ab4080e7          	jalr	-1356(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    80005e94:	00004517          	auipc	a0,0x4
    80005e98:	3ec50513          	addi	a0,a0,1004 # 8000a280 <CONSOLE_STATUS+0x270>
    80005e9c:	00000097          	auipc	ra,0x0
    80005ea0:	aa4080e7          	jalr	-1372(ra) # 80005940 <_Z12kprintStringPKc>
    80005ea4:	00000613          	li	a2,0
    80005ea8:	01000593          	li	a1,16
    80005eac:	ffffe797          	auipc	a5,0xffffe
    80005eb0:	26c78793          	addi	a5,a5,620 # 80004118 <KERNEL_TEXT_END>
    80005eb4:	0007b503          	ld	a0,0(a5)
    80005eb8:	00000097          	auipc	ra,0x0
    80005ebc:	ad0080e7          	jalr	-1328(ra) # 80005988 <_Z9kprintIntmib>
    80005ec0:	00004517          	auipc	a0,0x4
    80005ec4:	60850513          	addi	a0,a0,1544 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005ec8:	00000097          	auipc	ra,0x0
    80005ecc:	a78080e7          	jalr	-1416(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    80005ed0:	00004517          	auipc	a0,0x4
    80005ed4:	3c850513          	addi	a0,a0,968 # 8000a298 <CONSOLE_STATUS+0x288>
    80005ed8:	00000097          	auipc	ra,0x0
    80005edc:	a68080e7          	jalr	-1432(ra) # 80005940 <_Z12kprintStringPKc>
    80005ee0:	00000613          	li	a2,0
    80005ee4:	01000593          	li	a1,16
    80005ee8:	ffffe797          	auipc	a5,0xffffe
    80005eec:	23878793          	addi	a5,a5,568 # 80004120 <USER_TEXT_START>
    80005ef0:	0007b503          	ld	a0,0(a5)
    80005ef4:	00000097          	auipc	ra,0x0
    80005ef8:	a94080e7          	jalr	-1388(ra) # 80005988 <_Z9kprintIntmib>
    80005efc:	00004517          	auipc	a0,0x4
    80005f00:	5cc50513          	addi	a0,a0,1484 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005f04:	00000097          	auipc	ra,0x0
    80005f08:	a3c080e7          	jalr	-1476(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    80005f0c:	00004517          	auipc	a0,0x4
    80005f10:	3a450513          	addi	a0,a0,932 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    80005f14:	00000097          	auipc	ra,0x0
    80005f18:	a2c080e7          	jalr	-1492(ra) # 80005940 <_Z12kprintStringPKc>
    80005f1c:	00000613          	li	a2,0
    80005f20:	01000593          	li	a1,16
    80005f24:	ffffe797          	auipc	a5,0xffffe
    80005f28:	20478793          	addi	a5,a5,516 # 80004128 <USER_TEXT_END>
    80005f2c:	0007b503          	ld	a0,0(a5)
    80005f30:	00000097          	auipc	ra,0x0
    80005f34:	a58080e7          	jalr	-1448(ra) # 80005988 <_Z9kprintIntmib>
    80005f38:	00004517          	auipc	a0,0x4
    80005f3c:	59050513          	addi	a0,a0,1424 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005f40:	00000097          	auipc	ra,0x0
    80005f44:	a00080e7          	jalr	-1536(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    80005f48:	00004517          	auipc	a0,0x4
    80005f4c:	37850513          	addi	a0,a0,888 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    80005f50:	00000097          	auipc	ra,0x0
    80005f54:	9f0080e7          	jalr	-1552(ra) # 80005940 <_Z12kprintStringPKc>
    80005f58:	00000613          	li	a2,0
    80005f5c:	01000593          	li	a1,16
    80005f60:	00001537          	lui	a0,0x1
    80005f64:	00000097          	auipc	ra,0x0
    80005f68:	a24080e7          	jalr	-1500(ra) # 80005988 <_Z9kprintIntmib>
    80005f6c:	00004517          	auipc	a0,0x4
    80005f70:	55c50513          	addi	a0,a0,1372 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005f74:	00000097          	auipc	ra,0x0
    80005f78:	9cc080e7          	jalr	-1588(ra) # 80005940 <_Z12kprintStringPKc>
    kprintString("\n\n");
    80005f7c:	00004517          	auipc	a0,0x4
    80005f80:	25450513          	addi	a0,a0,596 # 8000a1d0 <CONSOLE_STATUS+0x1c0>
    80005f84:	00000097          	auipc	ra,0x0
    80005f88:	9bc080e7          	jalr	-1604(ra) # 80005940 <_Z12kprintStringPKc>

    /* INITALIZING MAIN KERNEL OBJECTS */
    NoAlloc::init(); /* No Allocator init */ 
    80005f8c:	00001097          	auipc	ra,0x1
    80005f90:	cd4080e7          	jalr	-812(ra) # 80006c60 <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    80005f94:	00004517          	auipc	a0,0x4
    80005f98:	33c50513          	addi	a0,a0,828 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80005f9c:	00000097          	auipc	ra,0x0
    80005fa0:	9a4080e7          	jalr	-1628(ra) # 80005940 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005fa4:	00004517          	auipc	a0,0x4
    80005fa8:	34450513          	addi	a0,a0,836 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80005fac:	00000097          	auipc	ra,0x0
    80005fb0:	994080e7          	jalr	-1644(ra) # 80005940 <_Z12kprintStringPKc>
    80005fb4:	00000613          	li	a2,0
    80005fb8:	01000593          	li	a1,16
    80005fbc:	00006797          	auipc	a5,0x6
    80005fc0:	6fc78793          	addi	a5,a5,1788 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80005fc4:	0007b503          	ld	a0,0(a5)
    80005fc8:	00000097          	auipc	ra,0x0
    80005fcc:	9c0080e7          	jalr	-1600(ra) # 80005988 <_Z9kprintIntmib>
    80005fd0:	00004517          	auipc	a0,0x4
    80005fd4:	4f850513          	addi	a0,a0,1272 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005fd8:	00000097          	auipc	ra,0x0
    80005fdc:	968080e7          	jalr	-1688(ra) # 80005940 <_Z12kprintStringPKc>
    /* 
    *   -Kernel Allocator Init 
    *       -Init Buddy Allocator
    *       -Init Slab Slab Allocator
    */
    kmi(); 
    80005fe0:	fffff097          	auipc	ra,0xfffff
    80005fe4:	874080e7          	jalr	-1932(ra) # 80004854 <_Z3kmiv>
     
    /* Pager Init */
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80005fe8:	00004517          	auipc	a0,0x4
    80005fec:	3f850513          	addi	a0,a0,1016 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80005ff0:	00000097          	auipc	ra,0x0
    80005ff4:	950080e7          	jalr	-1712(ra) # 80005940 <_Z12kprintStringPKc>
    return 0;
}
    80005ff8:	00000513          	li	a0,0
    80005ffc:	00813083          	ld	ra,8(sp)
    80006000:	00013403          	ld	s0,0(sp)
    80006004:	01010113          	addi	sp,sp,16
    80006008:	00008067          	ret

000000008000600c <_Z8align4kbm>:

uint64 align4kb(uint64 input){
    8000600c:	ff010113          	addi	sp,sp,-16
    80006010:	00813423          	sd	s0,8(sp)
    80006014:	01010413          	addi	s0,sp,16
    return  (input + 4095ULL) & ( (~0ULL) << 12);
    80006018:	000017b7          	lui	a5,0x1
    8000601c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006020:	00f50533          	add	a0,a0,a5
}
    80006024:	fffff7b7          	lui	a5,0xfffff
    80006028:	00f57533          	and	a0,a0,a5
    8000602c:	00813403          	ld	s0,8(sp)
    80006030:	01010113          	addi	sp,sp,16
    80006034:	00008067          	ret

0000000080006038 <_Z11closest2powm>:


uint64 closest2pow(uint64 input){ 
    80006038:	ff010113          	addi	sp,sp,-16
    8000603c:	00813423          	sd	s0,8(sp)
    80006040:	01010413          	addi	s0,sp,16
    /* set start to 2^0 */
    uint64 i = 1; 
    80006044:	00100793          	li	a5,1

    /* iterate till i >= input */
    while ( i < input){ i <<= 1; }
    80006048:	00a7f663          	bgeu	a5,a0,80006054 <_Z11closest2powm+0x1c>
    8000604c:	00179793          	slli	a5,a5,0x1
    80006050:	ff9ff06f          	j	80006048 <_Z11closest2powm+0x10>

    return i;
}
    80006054:	00078513          	mv	a0,a5
    80006058:	00813403          	ld	s0,8(sp)
    8000605c:	01010113          	addi	sp,sp,16
    80006060:	00008067          	ret

0000000080006064 <_Z4log2m>:

char log2(uint64 input){
    80006064:	ff010113          	addi	sp,sp,-16
    80006068:	00813423          	sd	s0,8(sp)
    8000606c:	01010413          	addi	s0,sp,16
    int t = 0;
    80006070:	00000793          	li	a5,0
    while(input > 1) {
    80006074:	00100713          	li	a4,1
    80006078:	00a77863          	bgeu	a4,a0,80006088 <_Z4log2m+0x24>
        input >>= 1;
    8000607c:	00155513          	srli	a0,a0,0x1
        t++;
    80006080:	0017879b          	addiw	a5,a5,1
    while(input > 1) {
    80006084:	ff1ff06f          	j	80006074 <_Z4log2m+0x10>
    }
    return t;
}
    80006088:	0ff7f513          	andi	a0,a5,255
    8000608c:	00813403          	ld	s0,8(sp)
    80006090:	01010113          	addi	sp,sp,16
    80006094:	00008067          	ret

0000000080006098 <_Z3osbm>:

bool osb(uint64 input){
    80006098:	ff010113          	addi	sp,sp,-16
    8000609c:	00813423          	sd	s0,8(sp)
    800060a0:	01010413          	addi	s0,sp,16
    if (!input) return 0;
    800060a4:	02050063          	beqz	a0,800060c4 <_Z3osbm+0x2c>
    return (input & (-input)) == input;
    800060a8:	40a007b3          	neg	a5,a0
    800060ac:	00a7f7b3          	and	a5,a5,a0
    800060b0:	40a78533          	sub	a0,a5,a0
    800060b4:	00153513          	seqz	a0,a0
    800060b8:	00813403          	ld	s0,8(sp)
    800060bc:	01010113          	addi	sp,sp,16
    800060c0:	00008067          	ret
    if (!input) return 0;
    800060c4:	00000513          	li	a0,0
    800060c8:	ff1ff06f          	j	800060b8 <_Z3osbm+0x20>

00000000800060cc <_Z19buddy_allocate_testmb>:
#include"../../h/kernel_lib.h"
#include"../../h/kernel_test.h"

void* buddy_allocate_test(size_t s, bool a = false){
    800060cc:	fe010113          	addi	sp,sp,-32
    800060d0:	00113c23          	sd	ra,24(sp)
    800060d4:	00813823          	sd	s0,16(sp)
    800060d8:	00913423          	sd	s1,8(sp)
    800060dc:	01213023          	sd	s2,0(sp)
    800060e0:	02010413          	addi	s0,sp,32
    800060e4:	00050493          	mv	s1,a0
    800060e8:	00058913          	mv	s2,a1
    kprintString("Buddy allocate: ");
    800060ec:	00004517          	auipc	a0,0x4
    800060f0:	32450513          	addi	a0,a0,804 # 8000a410 <CONSOLE_STATUS+0x400>
    800060f4:	00000097          	auipc	ra,0x0
    800060f8:	84c080e7          	jalr	-1972(ra) # 80005940 <_Z12kprintStringPKc>
    kprintInt(s);
    800060fc:	00000613          	li	a2,0
    80006100:	00a00593          	li	a1,10
    80006104:	00048513          	mv	a0,s1
    80006108:	00000097          	auipc	ra,0x0
    8000610c:	880080e7          	jalr	-1920(ra) # 80005988 <_Z9kprintIntmib>
    kprintString(" blocks\n");
    80006110:	00004517          	auipc	a0,0x4
    80006114:	31850513          	addi	a0,a0,792 # 8000a428 <CONSOLE_STATUS+0x418>
    80006118:	00000097          	auipc	ra,0x0
    8000611c:	828080e7          	jalr	-2008(ra) # 80005940 <_Z12kprintStringPKc>
    void* ret = Buddy::getInstance().mem_alloc(s);
    80006120:	ffffe097          	auipc	ra,0xffffe
    80006124:	138080e7          	jalr	312(ra) # 80004258 <_ZN5Buddy11getInstanceEv>
    80006128:	00048593          	mv	a1,s1
    8000612c:	fffff097          	auipc	ra,0xfffff
    80006130:	a9c080e7          	jalr	-1380(ra) # 80004bc8 <_ZN5Buddy9mem_allocEm>
    80006134:	00050493          	mv	s1,a0
    KVALCHECKPRINT(Returned address, ret);
    80006138:	00004517          	auipc	a0,0x4
    8000613c:	30050513          	addi	a0,a0,768 # 8000a438 <CONSOLE_STATUS+0x428>
    80006140:	00000097          	auipc	ra,0x0
    80006144:	800080e7          	jalr	-2048(ra) # 80005940 <_Z12kprintStringPKc>
    80006148:	00000613          	li	a2,0
    8000614c:	01000593          	li	a1,16
    80006150:	00048513          	mv	a0,s1
    80006154:	00000097          	auipc	ra,0x0
    80006158:	834080e7          	jalr	-1996(ra) # 80005988 <_Z9kprintIntmib>
    8000615c:	00004517          	auipc	a0,0x4
    80006160:	36c50513          	addi	a0,a0,876 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006164:	fffff097          	auipc	ra,0xfffff
    80006168:	7dc080e7          	jalr	2012(ra) # 80005940 <_Z12kprintStringPKc>
    kprintString("\n");
    8000616c:	00004517          	auipc	a0,0x4
    80006170:	35c50513          	addi	a0,a0,860 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006174:	fffff097          	auipc	ra,0xfffff
    80006178:	7cc080e7          	jalr	1996(ra) # 80005940 <_Z12kprintStringPKc>
    if(!ret)
    8000617c:	04048263          	beqz	s1,800061c0 <_Z19buddy_allocate_testmb+0xf4>
        kprintString("BUDDY ALLOCATE ERROR\n");
    kprintString("\n");
    80006180:	00004517          	auipc	a0,0x4
    80006184:	34850513          	addi	a0,a0,840 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006188:	fffff097          	auipc	ra,0xfffff
    8000618c:	7b8080e7          	jalr	1976(ra) # 80005940 <_Z12kprintStringPKc>
    
    if(a) Buddy::getInstance().status_print();
    80006190:	04091263          	bnez	s2,800061d4 <_Z19buddy_allocate_testmb+0x108>
    kprintString("\n");
    80006194:	00004517          	auipc	a0,0x4
    80006198:	33450513          	addi	a0,a0,820 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    8000619c:	fffff097          	auipc	ra,0xfffff
    800061a0:	7a4080e7          	jalr	1956(ra) # 80005940 <_Z12kprintStringPKc>
    return ret;
}
    800061a4:	00048513          	mv	a0,s1
    800061a8:	01813083          	ld	ra,24(sp)
    800061ac:	01013403          	ld	s0,16(sp)
    800061b0:	00813483          	ld	s1,8(sp)
    800061b4:	00013903          	ld	s2,0(sp)
    800061b8:	02010113          	addi	sp,sp,32
    800061bc:	00008067          	ret
        kprintString("BUDDY ALLOCATE ERROR\n");
    800061c0:	00004517          	auipc	a0,0x4
    800061c4:	29050513          	addi	a0,a0,656 # 8000a450 <CONSOLE_STATUS+0x440>
    800061c8:	fffff097          	auipc	ra,0xfffff
    800061cc:	778080e7          	jalr	1912(ra) # 80005940 <_Z12kprintStringPKc>
    800061d0:	fb1ff06f          	j	80006180 <_Z19buddy_allocate_testmb+0xb4>
    if(a) Buddy::getInstance().status_print();
    800061d4:	ffffe097          	auipc	ra,0xffffe
    800061d8:	084080e7          	jalr	132(ra) # 80004258 <_ZN5Buddy11getInstanceEv>
    800061dc:	00100593          	li	a1,1
    800061e0:	ffffe097          	auipc	ra,0xffffe
    800061e4:	72c080e7          	jalr	1836(ra) # 8000490c <_ZN5Buddy12status_printEb>
    800061e8:	fadff06f          	j	80006194 <_Z19buddy_allocate_testmb+0xc8>

00000000800061ec <_Z21buddy_deallocate_testPvb>:

int buddy_deallocate_test(void* s, bool a = false){
    800061ec:	fe010113          	addi	sp,sp,-32
    800061f0:	00113c23          	sd	ra,24(sp)
    800061f4:	00813823          	sd	s0,16(sp)
    800061f8:	00913423          	sd	s1,8(sp)
    800061fc:	01213023          	sd	s2,0(sp)
    80006200:	02010413          	addi	s0,sp,32
    80006204:	00050493          	mv	s1,a0
    80006208:	00058913          	mv	s2,a1
    kprintString("Buddy deallocate block on address: ");
    8000620c:	00004517          	auipc	a0,0x4
    80006210:	25c50513          	addi	a0,a0,604 # 8000a468 <CONSOLE_STATUS+0x458>
    80006214:	fffff097          	auipc	ra,0xfffff
    80006218:	72c080e7          	jalr	1836(ra) # 80005940 <_Z12kprintStringPKc>
    kprintInt((uint64)s, 16);
    8000621c:	00000613          	li	a2,0
    80006220:	01000593          	li	a1,16
    80006224:	00048513          	mv	a0,s1
    80006228:	fffff097          	auipc	ra,0xfffff
    8000622c:	760080e7          	jalr	1888(ra) # 80005988 <_Z9kprintIntmib>
    kprintString("\n");
    80006230:	00004517          	auipc	a0,0x4
    80006234:	29850513          	addi	a0,a0,664 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006238:	fffff097          	auipc	ra,0xfffff
    8000623c:	708080e7          	jalr	1800(ra) # 80005940 <_Z12kprintStringPKc>
    int ret = Buddy::getInstance().mem_free(s);
    80006240:	ffffe097          	auipc	ra,0xffffe
    80006244:	018080e7          	jalr	24(ra) # 80004258 <_ZN5Buddy11getInstanceEv>
    80006248:	00048593          	mv	a1,s1
    8000624c:	fffff097          	auipc	ra,0xfffff
    80006250:	c10080e7          	jalr	-1008(ra) # 80004e5c <_ZN5Buddy8mem_freeEPv>
    80006254:	00050493          	mv	s1,a0
    if(ret < 0){
    80006258:	04054263          	bltz	a0,8000629c <_Z21buddy_deallocate_testPvb+0xb0>
        kprintString("BUDDY DEALLOCATE ERROR:");
        kprintInt((uint64)ret, 10, true);
        kprintString("\n");
    }
    kprintString("\n");
    8000625c:	00004517          	auipc	a0,0x4
    80006260:	26c50513          	addi	a0,a0,620 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006264:	fffff097          	auipc	ra,0xfffff
    80006268:	6dc080e7          	jalr	1756(ra) # 80005940 <_Z12kprintStringPKc>
    if(a) Buddy::getInstance().status_print();
    8000626c:	06091463          	bnez	s2,800062d4 <_Z21buddy_deallocate_testPvb+0xe8>
    kprintString("\n");
    80006270:	00004517          	auipc	a0,0x4
    80006274:	25850513          	addi	a0,a0,600 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006278:	fffff097          	auipc	ra,0xfffff
    8000627c:	6c8080e7          	jalr	1736(ra) # 80005940 <_Z12kprintStringPKc>
    return ret;
}
    80006280:	00048513          	mv	a0,s1
    80006284:	01813083          	ld	ra,24(sp)
    80006288:	01013403          	ld	s0,16(sp)
    8000628c:	00813483          	ld	s1,8(sp)
    80006290:	00013903          	ld	s2,0(sp)
    80006294:	02010113          	addi	sp,sp,32
    80006298:	00008067          	ret
        kprintString("BUDDY DEALLOCATE ERROR:");
    8000629c:	00004517          	auipc	a0,0x4
    800062a0:	1f450513          	addi	a0,a0,500 # 8000a490 <CONSOLE_STATUS+0x480>
    800062a4:	fffff097          	auipc	ra,0xfffff
    800062a8:	69c080e7          	jalr	1692(ra) # 80005940 <_Z12kprintStringPKc>
        kprintInt((uint64)ret, 10, true);
    800062ac:	00100613          	li	a2,1
    800062b0:	00a00593          	li	a1,10
    800062b4:	00048513          	mv	a0,s1
    800062b8:	fffff097          	auipc	ra,0xfffff
    800062bc:	6d0080e7          	jalr	1744(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    800062c0:	00004517          	auipc	a0,0x4
    800062c4:	20850513          	addi	a0,a0,520 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800062c8:	fffff097          	auipc	ra,0xfffff
    800062cc:	678080e7          	jalr	1656(ra) # 80005940 <_Z12kprintStringPKc>
    800062d0:	f8dff06f          	j	8000625c <_Z21buddy_deallocate_testPvb+0x70>
    if(a) Buddy::getInstance().status_print();
    800062d4:	ffffe097          	auipc	ra,0xffffe
    800062d8:	f84080e7          	jalr	-124(ra) # 80004258 <_ZN5Buddy11getInstanceEv>
    800062dc:	00100593          	li	a1,1
    800062e0:	ffffe097          	auipc	ra,0xffffe
    800062e4:	62c080e7          	jalr	1580(ra) # 8000490c <_ZN5Buddy12status_printEb>
    800062e8:	f89ff06f          	j	80006270 <_Z21buddy_deallocate_testPvb+0x84>

00000000800062ec <_Z10buddy_testv>:

void buddy_test(){
    800062ec:	fc010113          	addi	sp,sp,-64
    800062f0:	02113c23          	sd	ra,56(sp)
    800062f4:	02813823          	sd	s0,48(sp)
    800062f8:	02913423          	sd	s1,40(sp)
    800062fc:	03213023          	sd	s2,32(sp)
    80006300:	01313c23          	sd	s3,24(sp)
    80006304:	01413823          	sd	s4,16(sp)
    80006308:	01513423          	sd	s5,8(sp)
    8000630c:	01613023          	sd	s6,0(sp)
    80006310:	04010413          	addi	s0,sp,64
    void* t = buddy_allocate_test(128);
    80006314:	00000593          	li	a1,0
    80006318:	08000513          	li	a0,128
    8000631c:	00000097          	auipc	ra,0x0
    80006320:	db0080e7          	jalr	-592(ra) # 800060cc <_Z19buddy_allocate_testmb>
    80006324:	00050b13          	mv	s6,a0
    buddy_allocate_test(25);
    80006328:	00000593          	li	a1,0
    8000632c:	01900513          	li	a0,25
    80006330:	00000097          	auipc	ra,0x0
    80006334:	d9c080e7          	jalr	-612(ra) # 800060cc <_Z19buddy_allocate_testmb>
    void* t1 = buddy_allocate_test(64);
    80006338:	00000593          	li	a1,0
    8000633c:	04000513          	li	a0,64
    80006340:	00000097          	auipc	ra,0x0
    80006344:	d8c080e7          	jalr	-628(ra) # 800060cc <_Z19buddy_allocate_testmb>
    80006348:	00050913          	mv	s2,a0
    void* t2 = buddy_allocate_test(1);
    8000634c:	00000593          	li	a1,0
    80006350:	00100513          	li	a0,1
    80006354:	00000097          	auipc	ra,0x0
    80006358:	d78080e7          	jalr	-648(ra) # 800060cc <_Z19buddy_allocate_testmb>
    8000635c:	00050a93          	mv	s5,a0
    void* t2_bud = buddy_allocate_test(1);
    80006360:	00000593          	li	a1,0
    80006364:	00100513          	li	a0,1
    80006368:	00000097          	auipc	ra,0x0
    8000636c:	d64080e7          	jalr	-668(ra) # 800060cc <_Z19buddy_allocate_testmb>
    80006370:	00050493          	mv	s1,a0
    void* t3 = buddy_allocate_test(1);
    80006374:	00000593          	li	a1,0
    80006378:	00100513          	li	a0,1
    8000637c:	00000097          	auipc	ra,0x0
    80006380:	d50080e7          	jalr	-688(ra) # 800060cc <_Z19buddy_allocate_testmb>
    80006384:	00050a13          	mv	s4,a0
    void* t3_bud = buddy_allocate_test(1, true);
    80006388:	00100593          	li	a1,1
    8000638c:	00100513          	li	a0,1
    80006390:	00000097          	auipc	ra,0x0
    80006394:	d3c080e7          	jalr	-708(ra) # 800060cc <_Z19buddy_allocate_testmb>
    80006398:	00050993          	mv	s3,a0
    /* deallocate dont have buddy */
    buddy_deallocate_test(t);
    8000639c:	00000593          	li	a1,0
    800063a0:	000b0513          	mv	a0,s6
    800063a4:	00000097          	auipc	ra,0x0
    800063a8:	e48080e7          	jalr	-440(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    buddy_deallocate_test(nullptr);
    800063ac:	00000593          	li	a1,0
    800063b0:	00000513          	li	a0,0
    800063b4:	00000097          	auipc	ra,0x0
    800063b8:	e38080e7          	jalr	-456(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* merge not-all */
    buddy_deallocate_test(t2,true);
    800063bc:	00100593          	li	a1,1
    800063c0:	000a8513          	mv	a0,s5
    800063c4:	00000097          	auipc	ra,0x0
    800063c8:	e28080e7          	jalr	-472(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    buddy_deallocate_test(t3,true);
    800063cc:	00100593          	li	a1,1
    800063d0:	000a0513          	mv	a0,s4
    800063d4:	00000097          	auipc	ra,0x0
    800063d8:	e18080e7          	jalr	-488(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    buddy_deallocate_test(t3_bud,true);
    800063dc:	00100593          	li	a1,1
    800063e0:	00098513          	mv	a0,s3
    800063e4:	00000097          	auipc	ra,0x0
    800063e8:	e08080e7          	jalr	-504(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    buddy_deallocate_test(t2_bud,true);
    800063ec:	00100593          	li	a1,1
    800063f0:	00048513          	mv	a0,s1
    800063f4:	00000097          	auipc	ra,0x0
    800063f8:	df8080e7          	jalr	-520(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* merge all (deallocate has buddy) */
    buddy_deallocate_test(t1, true);
    800063fc:	00100593          	li	a1,1
    80006400:	00090513          	mv	a0,s2
    80006404:	00000097          	auipc	ra,0x0
    80006408:	de8080e7          	jalr	-536(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* allocate all memory */
    t = buddy_allocate_test(4096);
    8000640c:	00000593          	li	a1,0
    80006410:	00001537          	lui	a0,0x1
    80006414:	00000097          	auipc	ra,0x0
    80006418:	cb8080e7          	jalr	-840(ra) # 800060cc <_Z19buddy_allocate_testmb>
    8000641c:	00050493          	mv	s1,a0
    /* deallocate sub-block */
    buddy_deallocate_test(t1);
    80006420:	00000593          	li	a1,0
    80006424:	00090513          	mv	a0,s2
    80006428:	00000097          	auipc	ra,0x0
    8000642c:	dc4080e7          	jalr	-572(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* try allocation if all memory is allocated */
    buddy_allocate_test(128);
    80006430:	00000593          	li	a1,0
    80006434:	08000513          	li	a0,128
    80006438:	00000097          	auipc	ra,0x0
    8000643c:	c94080e7          	jalr	-876(ra) # 800060cc <_Z19buddy_allocate_testmb>
    /* deallocate all memory */
    buddy_deallocate_test(t);
    80006440:	00000593          	li	a1,0
    80006444:	00048513          	mv	a0,s1
    80006448:	00000097          	auipc	ra,0x0
    8000644c:	da4080e7          	jalr	-604(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* deallocate memory not in range */
    buddy_deallocate_test((void*)((uint64)t + (Buddy::BLOCK_SIZE<<13)));
    80006450:	00000593          	li	a1,0
    80006454:	02000537          	lui	a0,0x2000
    80006458:	00a48533          	add	a0,s1,a0
    8000645c:	00000097          	auipc	ra,0x0
    80006460:	d90080e7          	jalr	-624(ra) # 800061ec <_Z21buddy_deallocate_testPvb>
    /* allocate memory not in range */
    buddy_allocate_test(8192, true);
    80006464:	00100593          	li	a1,1
    80006468:	00002537          	lui	a0,0x2
    8000646c:	00000097          	auipc	ra,0x0
    80006470:	c60080e7          	jalr	-928(ra) # 800060cc <_Z19buddy_allocate_testmb>


    80006474:	03813083          	ld	ra,56(sp)
    80006478:	03013403          	ld	s0,48(sp)
    8000647c:	02813483          	ld	s1,40(sp)
    80006480:	02013903          	ld	s2,32(sp)
    80006484:	01813983          	ld	s3,24(sp)
    80006488:	01013a03          	ld	s4,16(sp)
    8000648c:	00813a83          	ld	s5,8(sp)
    80006490:	00013b03          	ld	s6,0(sp)
    80006494:	04010113          	addi	sp,sp,64
    80006498:	00008067          	ret

000000008000649c <_ZN10KSemaphore4waitEv>:
#include"../../h/kernel_lib.h"

KSemaphore* KSemaphore::activeSemaphores = nullptr;

int KSemaphore::wait(){
    if(val > 0)
    8000649c:	00852783          	lw	a5,8(a0) # 2008 <_entry-0x7fffdff8>
    800064a0:	00078a63          	beqz	a5,800064b4 <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    800064a4:	fff7879b          	addiw	a5,a5,-1
    800064a8:	00f52423          	sw	a5,8(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    800064ac:	00000513          	li	a0,0
}
    800064b0:	00008067          	ret
int KSemaphore::wait(){
    800064b4:	fe010113          	addi	sp,sp,-32
    800064b8:	00113c23          	sd	ra,24(sp)
    800064bc:	00813823          	sd	s0,16(sp)
    800064c0:	00913423          	sd	s1,8(sp)
    800064c4:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    800064c8:	00006497          	auipc	s1,0x6
    800064cc:	24848493          	addi	s1,s1,584 # 8000c710 <_ZN3TCB7runningE>
    800064d0:	0004b583          	ld	a1,0(s1)
    void setState(TCBState s) {state = s;}
    800064d4:	0205a823          	sw	zero,48(a1)
        blocked.insert(TCB::running);
    800064d8:	01050513          	addi	a0,a0,16
    800064dc:	00001097          	auipc	ra,0x1
    800064e0:	8e8080e7          	jalr	-1816(ra) # 80006dc4 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    800064e4:	00001097          	auipc	ra,0x1
    800064e8:	6e0080e7          	jalr	1760(ra) # 80007bc4 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    800064ec:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    800064f0:	0307a703          	lw	a4,48(a5) # fffffffffffff030 <end+0xffffffff7fff1600>
    800064f4:	02071263          	bnez	a4,80006518 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    800064f8:	00100713          	li	a4,1
    800064fc:	02e7a823          	sw	a4,48(a5)
    return 0;
    80006500:	00000513          	li	a0,0
}
    80006504:	01813083          	ld	ra,24(sp)
    80006508:	01013403          	ld	s0,16(sp)
    8000650c:	00813483          	ld	s1,8(sp)
    80006510:	02010113          	addi	sp,sp,32
    80006514:	00008067          	ret
            return -2;
    80006518:	ffe00513          	li	a0,-2
    8000651c:	fe9ff06f          	j	80006504 <_ZN10KSemaphore4waitEv+0x68>

0000000080006520 <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80006520:	01053783          	ld	a5,16(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    80006524:	02078e63          	beqz	a5,80006560 <_ZN10KSemaphore6signalEv+0x40>
{
    80006528:	ff010113          	addi	sp,sp,-16
    8000652c:	00113423          	sd	ra,8(sp)
    80006530:	00813023          	sd	s0,0(sp)
    80006534:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80006538:	01050513          	addi	a0,a0,16
    8000653c:	00001097          	auipc	ra,0x1
    80006540:	8c8080e7          	jalr	-1848(ra) # 80006e04 <_ZN8TcbQueue6removeEv>
    80006544:	00001097          	auipc	ra,0x1
    80006548:	b5c080e7          	jalr	-1188(ra) # 800070a0 <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    8000654c:	00000513          	li	a0,0
    80006550:	00813083          	ld	ra,8(sp)
    80006554:	00013403          	ld	s0,0(sp)
    80006558:	01010113          	addi	sp,sp,16
    8000655c:	00008067          	ret
        val++;
    80006560:	00852783          	lw	a5,8(a0)
    80006564:	0017879b          	addiw	a5,a5,1
    80006568:	00f52423          	sw	a5,8(a0)
}
    8000656c:	00000513          	li	a0,0
    80006570:	00008067          	ret

0000000080006574 <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    80006574:	fe010113          	addi	sp,sp,-32
    80006578:	00113c23          	sd	ra,24(sp)
    8000657c:	00813823          	sd	s0,16(sp)
    80006580:	00913423          	sd	s1,8(sp)
    80006584:	02010413          	addi	s0,sp,32
    80006588:	00050493          	mv	s1,a0
    8000658c:	0104b783          	ld	a5,16(s1)
{
    while(!blocked.isEmpty()){
    80006590:	02078263          	beqz	a5,800065b4 <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    80006594:	01048513          	addi	a0,s1,16
    80006598:	00001097          	auipc	ra,0x1
    8000659c:	86c080e7          	jalr	-1940(ra) # 80006e04 <_ZN8TcbQueue6removeEv>
    800065a0:	00100793          	li	a5,1
    800065a4:	02f52823          	sw	a5,48(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    800065a8:	00001097          	auipc	ra,0x1
    800065ac:	af8080e7          	jalr	-1288(ra) # 800070a0 <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    800065b0:	fddff06f          	j	8000658c <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    800065b4:	01813083          	ld	ra,24(sp)
    800065b8:	01013403          	ld	s0,16(sp)
    800065bc:	00813483          	ld	s1,8(sp)
    800065c0:	02010113          	addi	sp,sp,32
    800065c4:	00008067          	ret

00000000800065c8 <_ZN10KSemaphore5closeEPS_>:

int KSemaphore::close(KSemaphore* sem)
{
    800065c8:	fe010113          	addi	sp,sp,-32
    800065cc:	00113c23          	sd	ra,24(sp)
    800065d0:	00813823          	sd	s0,16(sp)
    800065d4:	00913423          	sd	s1,8(sp)
    800065d8:	02010413          	addi	s0,sp,32
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    800065dc:	00006797          	auipc	a5,0x6
    800065e0:	0d478793          	addi	a5,a5,212 # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    800065e4:	0007b483          	ld	s1,0(a5)
    800065e8:	00000793          	li	a5,0
    while(cur)
    800065ec:	00048a63          	beqz	s1,80006600 <_ZN10KSemaphore5closeEPS_+0x38>
    {
        if(cur == sem)
    800065f0:	00a48863          	beq	s1,a0,80006600 <_ZN10KSemaphore5closeEPS_+0x38>
            break;
        prev = cur;
    800065f4:	00048793          	mv	a5,s1
        cur = cur->next;
    800065f8:	0004b483          	ld	s1,0(s1)
    while(cur)
    800065fc:	ff1ff06f          	j	800065ec <_ZN10KSemaphore5closeEPS_+0x24>
    }
    if(cur)
    80006600:	04048e63          	beqz	s1,8000665c <_ZN10KSemaphore5closeEPS_+0x94>
    {
        if(prev)
    80006604:	04078463          	beqz	a5,8000664c <_ZN10KSemaphore5closeEPS_+0x84>
            prev->next = cur->next;
    80006608:	0004b703          	ld	a4,0(s1)
    8000660c:	00e7b023          	sd	a4,0(a5)
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
    80006610:	0004b023          	sd	zero,0(s1)
        delete cur;
    80006614:	00048513          	mv	a0,s1
    80006618:	00000097          	auipc	ra,0x0
    8000661c:	f5c080e7          	jalr	-164(ra) # 80006574 <_ZN10KSemaphoreD1Ev>
    80006620:	00000097          	auipc	ra,0x0
    80006624:	168080e7          	jalr	360(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80006628:	00048593          	mv	a1,s1
    8000662c:	00000097          	auipc	ra,0x0
    80006630:	38c080e7          	jalr	908(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
        return 0;
    80006634:	00000513          	li	a0,0
    }
    else return -1;

}
    80006638:	01813083          	ld	ra,24(sp)
    8000663c:	01013403          	ld	s0,16(sp)
    80006640:	00813483          	ld	s1,8(sp)
    80006644:	02010113          	addi	sp,sp,32
    80006648:	00008067          	ret
            activeSemaphores = cur->next;
    8000664c:	0004b783          	ld	a5,0(s1)
    80006650:	00006717          	auipc	a4,0x6
    80006654:	06f73023          	sd	a5,96(a4) # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    80006658:	fb9ff06f          	j	80006610 <_ZN10KSemaphore5closeEPS_+0x48>
    else return -1;
    8000665c:	fff00513          	li	a0,-1
    80006660:	fd9ff06f          	j	80006638 <_ZN10KSemaphore5closeEPS_+0x70>

0000000080006664 <_ZN10KSemaphore6existsEPS_>:

bool KSemaphore::exists(KSemaphore* sem)
{
    80006664:	ff010113          	addi	sp,sp,-16
    80006668:	00813423          	sd	s0,8(sp)
    8000666c:	01010413          	addi	s0,sp,16
    KSemaphore* cur = activeSemaphores;
    80006670:	00006797          	auipc	a5,0x6
    80006674:	04078793          	addi	a5,a5,64 # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    80006678:	0007b783          	ld	a5,0(a5)
    while(cur)
    8000667c:	00078863          	beqz	a5,8000668c <_ZN10KSemaphore6existsEPS_+0x28>
    {
        if(cur == sem)
    80006680:	00a78e63          	beq	a5,a0,8000669c <_ZN10KSemaphore6existsEPS_+0x38>
            return true;
        cur = cur->next;
    80006684:	0007b783          	ld	a5,0(a5)
    while(cur)
    80006688:	ff5ff06f          	j	8000667c <_ZN10KSemaphore6existsEPS_+0x18>
    }
    return false;
    8000668c:	00000513          	li	a0,0
}
    80006690:	00813403          	ld	s0,8(sp)
    80006694:	01010113          	addi	sp,sp,16
    80006698:	00008067          	ret
            return true;
    8000669c:	00100513          	li	a0,1
    800066a0:	ff1ff06f          	j	80006690 <_ZN10KSemaphore6existsEPS_+0x2c>

00000000800066a4 <_Z13oldKernelMainv>:
#include"../../h/kernel_lib.h"
#include"../../h/kernel_test.h"

int oldKernelMain(){
    800066a4:	fd010113          	addi	sp,sp,-48
    800066a8:	02113423          	sd	ra,40(sp)
    800066ac:	02813023          	sd	s0,32(sp)
    800066b0:	00913c23          	sd	s1,24(sp)
    800066b4:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    800066b8:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    800066bc:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    800066c0:	00001097          	auipc	ra,0x1
    800066c4:	588080e7          	jalr	1416(ra) # 80007c48 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	37c080e7          	jalr	892(ra) # 80005a44 <_Z10kernelInitv>
    if(panic < 0){
    800066d0:	04054263          	bltz	a0,80006714 <_Z13oldKernelMainv+0x70>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800066d4:	100027f3          	csrr	a5,sstatus
    800066d8:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800066dc:	fd843483          	ld	s1,-40(s0)
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    800066e0:	00001097          	auipc	ra,0x1
    800066e4:	4e4080e7          	jalr	1252(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800066e8:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    800066ec:	00004517          	auipc	a0,0x4
    800066f0:	de450513          	addi	a0,a0,-540 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    800066f4:	fffff097          	auipc	ra,0xfffff
    800066f8:	24c080e7          	jalr	588(ra) # 80005940 <_Z12kprintStringPKc>
    return 0;
    800066fc:	00000513          	li	a0,0
}
    80006700:	02813083          	ld	ra,40(sp)
    80006704:	02013403          	ld	s0,32(sp)
    80006708:	01813483          	ld	s1,24(sp)
    8000670c:	03010113          	addi	sp,sp,48
    80006710:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80006714:	00004517          	auipc	a0,0x4
    80006718:	d9450513          	addi	a0,a0,-620 # 8000a4a8 <CONSOLE_STATUS+0x498>
    8000671c:	fffff097          	auipc	ra,0xfffff
    80006720:	224080e7          	jalr	548(ra) # 80005940 <_Z12kprintStringPKc>
        return -1;
    80006724:	fff00513          	li	a0,-1
    80006728:	fd9ff06f          	j	80006700 <_Z13oldKernelMainv+0x5c>

000000008000672c <_Z13newKernelMainv>:

int newKernelMain(){
    8000672c:	ff010113          	addi	sp,sp,-16
    80006730:	00113423          	sd	ra,8(sp)
    80006734:	00813023          	sd	s0,0(sp)
    80006738:	01010413          	addi	s0,sp,16
    newKernelInit();
    8000673c:	fffff097          	auipc	ra,0xfffff
    80006740:	684080e7          	jalr	1668(ra) # 80005dc0 <_Z13newKernelInitv>
    buddy_test();
    80006744:	00000097          	auipc	ra,0x0
    80006748:	ba8080e7          	jalr	-1112(ra) # 800062ec <_Z10buddy_testv>
    return 0;
}
    8000674c:	00000513          	li	a0,0
    80006750:	00813083          	ld	ra,8(sp)
    80006754:	00013403          	ld	s0,0(sp)
    80006758:	01010113          	addi	sp,sp,16
    8000675c:	00008067          	ret

0000000080006760 <main>:

int main(){
    80006760:	ff010113          	addi	sp,sp,-16
    80006764:	00113423          	sd	ra,8(sp)
    80006768:	00813023          	sd	s0,0(sp)
    8000676c:	01010413          	addi	s0,sp,16
    return newKernelMain();
    80006770:	00000097          	auipc	ra,0x0
    80006774:	fbc080e7          	jalr	-68(ra) # 8000672c <_Z13newKernelMainv>
    80006778:	00813083          	ld	ra,8(sp)
    8000677c:	00013403          	ld	s0,0(sp)
    80006780:	01010113          	addi	sp,sp,16
    80006784:	00008067          	ret

0000000080006788 <_ZN15MemoryAllocator11getInstanceEv>:
#include"../../h/kernel_lib.h"

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80006788:	ff010113          	addi	sp,sp,-16
    8000678c:	00813423          	sd	s0,8(sp)
    80006790:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80006794:	00006797          	auipc	a5,0x6
    80006798:	fdc7c783          	lbu	a5,-36(a5) # 8000c770 <_ZN15MemoryAllocator9allocatorE>
    8000679c:	04079663          	bnez	a5,800067e8 <_ZN15MemoryAllocator11getInstanceEv+0x60>
        allocator.fall_head = nullptr;
    800067a0:	00006717          	auipc	a4,0x6
    800067a4:	fd070713          	addi	a4,a4,-48 # 8000c770 <_ZN15MemoryAllocator9allocatorE>
    800067a8:	00073823          	sd	zero,16(a4)
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    800067ac:	00006697          	auipc	a3,0x6
    800067b0:	d0468693          	addi	a3,a3,-764 # 8000c4b0 <HEAP_START_ADDR>
    800067b4:	0006b783          	ld	a5,0(a3)
    800067b8:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    800067bc:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    800067c0:	00006797          	auipc	a5,0x6
    800067c4:	ce878793          	addi	a5,a5,-792 # 8000c4a8 <HEAP_END_ADDR>
    800067c8:	0007b783          	ld	a5,0(a5)
    800067cc:	0006b683          	ld	a3,0(a3)
    800067d0:	40d787b3          	sub	a5,a5,a3
    800067d4:	00873683          	ld	a3,8(a4)
    800067d8:	ff078793          	addi	a5,a5,-16
    800067dc:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    800067e0:	00100793          	li	a5,1
    800067e4:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    800067e8:	00006517          	auipc	a0,0x6
    800067ec:	f8850513          	addi	a0,a0,-120 # 8000c770 <_ZN15MemoryAllocator9allocatorE>
    800067f0:	00813403          	ld	s0,8(sp)
    800067f4:	01010113          	addi	sp,sp,16
    800067f8:	00008067          	ret

00000000800067fc <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    800067fc:	ff010113          	addi	sp,sp,-16
    80006800:	00813423          	sd	s0,8(sp)
    80006804:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80006808:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    8000680c:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80006810:	00000613          	li	a2,0
    80006814:	00000893          	li	a7,0
    80006818:	00000713          	li	a4,0
    8000681c:	0140006f          	j	80006830 <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    80006820:	00060893          	mv	a7,a2
                best = curr;     
    80006824:	00078713          	mv	a4,a5
            }
        prev = curr;
    80006828:	00078613          	mv	a2,a5
        curr = curr->next;
    8000682c:	0007b783          	ld	a5,0(a5)
    while(curr){
    80006830:	02078263          	beqz	a5,80006854 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    80006834:	0087b683          	ld	a3,8(a5)
    80006838:	feb6e8e3          	bltu	a3,a1,80006828 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    8000683c:	fe0702e3          	beqz	a4,80006820 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    80006840:	00873803          	ld	a6,8(a4)
    80006844:	ff06f2e3          	bgeu	a3,a6,80006828 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    80006848:	00060893          	mv	a7,a2
                best = curr;     
    8000684c:	00078713          	mv	a4,a5
    80006850:	fd9ff06f          	j	80006828 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    80006854:	02070863          	beqz	a4,80006884 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    80006858:	00873783          	ld	a5,8(a4)
    8000685c:	40b787b3          	sub	a5,a5,a1
    80006860:	04f00693          	li	a3,79
    80006864:	02f6ee63          	bltu	a3,a5,800068a0 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(!best_prev) fmem_head = best->next;
    80006868:	02088663          	beqz	a7,80006894 <_ZN15MemoryAllocator9mem_allocEm+0x98>
        else best_prev->next = best->next;
    8000686c:	00073783          	ld	a5,0(a4)
    80006870:	00f8b023          	sd	a5,0(a7)
        curr->size = best->size - size - sizeof(FreeSegment);
        best->size = size;
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    best->next = fall_head;
    80006874:	01053783          	ld	a5,16(a0)
    80006878:	00f73023          	sd	a5,0(a4)
    fall_head = best;
    8000687c:	00e53823          	sd	a4,16(a0)
    return (char*)best+sizeof(FreeSegment);
    80006880:	01070713          	addi	a4,a4,16
}
    80006884:	00070513          	mv	a0,a4
    80006888:	00813403          	ld	s0,8(sp)
    8000688c:	01010113          	addi	sp,sp,16
    80006890:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80006894:	00073783          	ld	a5,0(a4)
    80006898:	00f53423          	sd	a5,8(a0)
    8000689c:	fd9ff06f          	j	80006874 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    800068a0:	01058793          	addi	a5,a1,16
    800068a4:	00f707b3          	add	a5,a4,a5
        curr->next = best->next;
    800068a8:	00073683          	ld	a3,0(a4)
    800068ac:	00d7b023          	sd	a3,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    800068b0:	00873683          	ld	a3,8(a4)
    800068b4:	40b686b3          	sub	a3,a3,a1
    800068b8:	ff068693          	addi	a3,a3,-16
    800068bc:	00d7b423          	sd	a3,8(a5)
        best->size = size;
    800068c0:	00b73423          	sd	a1,8(a4)
        if(best_prev) best_prev->next = curr;
    800068c4:	00088663          	beqz	a7,800068d0 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    800068c8:	00f8b023          	sd	a5,0(a7)
    800068cc:	fa9ff06f          	j	80006874 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    800068d0:	00f53423          	sd	a5,8(a0)
    800068d4:	fa1ff06f          	j	80006874 <_ZN15MemoryAllocator9mem_allocEm+0x78>

00000000800068d8 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    800068d8:	ff010113          	addi	sp,sp,-16
    800068dc:	00813423          	sd	s0,8(sp)
    800068e0:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    800068e4:	00006797          	auipc	a5,0x6
    800068e8:	bcc78793          	addi	a5,a5,-1076 # 8000c4b0 <HEAP_START_ADDR>
    800068ec:	0007b783          	ld	a5,0(a5)
    800068f0:	04f5ee63          	bltu	a1,a5,8000694c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    800068f4:	00006797          	auipc	a5,0x6
    800068f8:	bb478793          	addi	a5,a5,-1100 # 8000c4a8 <HEAP_END_ADDR>
    800068fc:	0007b783          	ld	a5,0(a5)
    80006900:	04f5fe63          	bgeu	a1,a5,8000695c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    80006904:	01053783          	ld	a5,16(a0)
    80006908:	00000693          	li	a3,0
    while(cur)
    8000690c:	00078c63          	beqz	a5,80006924 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        if(t == (size_t)cur+sizeof(FreeSegment))
    80006910:	01078713          	addi	a4,a5,16
    80006914:	00b70863          	beq	a4,a1,80006924 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;
        prev = cur;
    80006918:	00078693          	mv	a3,a5
        cur = cur->next;
    8000691c:	0007b783          	ld	a5,0(a5)
    while(cur)
    80006920:	fedff06f          	j	8000690c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    80006924:	04078063          	beqz	a5,80006964 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    80006928:	00068c63          	beqz	a3,80006940 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    8000692c:	0007b703          	ld	a4,0(a5)
    80006930:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    80006934:	0007b023          	sd	zero,0(a5)
        return false;
    80006938:	00000513          	li	a0,0
    8000693c:	0140006f          	j	80006950 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    80006940:	0007b703          	ld	a4,0(a5)
    80006944:	00e53823          	sd	a4,16(a0)
    80006948:	fedff06f          	j	80006934 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    8000694c:	00100513          	li	a0,1
    }
    else return true;
}
    80006950:	00813403          	ld	s0,8(sp)
    80006954:	01010113          	addi	sp,sp,16
    80006958:	00008067          	ret
        return true;
    8000695c:	00100513          	li	a0,1
    80006960:	ff1ff06f          	j	80006950 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    80006964:	00100513          	li	a0,1
    80006968:	fe9ff06f          	j	80006950 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

000000008000696c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    8000696c:	ff010113          	addi	sp,sp,-16
    80006970:	00813423          	sd	s0,8(sp)
    80006974:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80006978:	0085b703          	ld	a4,8(a1)
    8000697c:	01070793          	addi	a5,a4,16
    80006980:	00f587b3          	add	a5,a1,a5
    80006984:	0005b503          	ld	a0,0(a1)
    80006988:	00a78863          	beq	a5,a0,80006998 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    8000698c:	00813403          	ld	s0,8(sp)
    80006990:	01010113          	addi	sp,sp,16
    80006994:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80006998:	00853783          	ld	a5,8(a0)
    8000699c:	00f70733          	add	a4,a4,a5
    800069a0:	01070713          	addi	a4,a4,16
    800069a4:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    800069a8:	00053783          	ld	a5,0(a0)
    800069ac:	00f5b023          	sd	a5,0(a1)
        return t;
    800069b0:	00058513          	mv	a0,a1
    800069b4:	fd9ff06f          	j	8000698c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

00000000800069b8 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    800069b8:	fd010113          	addi	sp,sp,-48
    800069bc:	02113423          	sd	ra,40(sp)
    800069c0:	02813023          	sd	s0,32(sp)
    800069c4:	00913c23          	sd	s1,24(sp)
    800069c8:	01213823          	sd	s2,16(sp)
    800069cc:	01313423          	sd	s3,8(sp)
    800069d0:	01413023          	sd	s4,0(sp)
    800069d4:	03010413          	addi	s0,sp,48
    800069d8:	00050993          	mv	s3,a0
    800069dc:	00058913          	mv	s2,a1
    if(wantToFreeAddress(adr)) return -1;
    800069e0:	00000097          	auipc	ra,0x0
    800069e4:	ef8080e7          	jalr	-264(ra) # 800068d8 <_ZN15MemoryAllocator17wantToFreeAddressEPv>
    800069e8:	0a051063          	bnez	a0,80006a88 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    800069ec:	0089b783          	ld	a5,8(s3)
    800069f0:	00078863          	beqz	a5,80006a00 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    800069f4:	ff090a13          	addi	s4,s2,-16
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    800069f8:	00000493          	li	s1,0
    800069fc:	01c0006f          	j	80006a18 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80006a00:	ff090913          	addi	s2,s2,-16
    80006a04:	0129b423          	sd	s2,8(s3)
    80006a08:	0540006f          	j	80006a5c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80006a0c:	00f96e63          	bltu	s2,a5,80006a28 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80006a10:	00078493          	mv	s1,a5
    80006a14:	0007b783          	ld	a5,0(a5)
    80006a18:	00078863          	beqz	a5,80006a28 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80006a1c:	fe0488e3          	beqz	s1,80006a0c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    80006a20:	ff24f8e3          	bgeu	s1,s2,80006a10 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80006a24:	fe9ff06f          	j	80006a0c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        newsgm->next = cur;
    80006a28:	fef93823          	sd	a5,-16(s2)
        if(cur)
    80006a2c:	00078a63          	beqz	a5,80006a40 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    80006a30:	000a0593          	mv	a1,s4
    80006a34:	00098513          	mv	a0,s3
    80006a38:	00000097          	auipc	ra,0x0
    80006a3c:	f34080e7          	jalr	-204(ra) # 8000696c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80006a40:	02048e63          	beqz	s1,80006a7c <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    80006a44:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    80006a48:	00048593          	mv	a1,s1
    80006a4c:	00098513          	mv	a0,s3
    80006a50:	00000097          	auipc	ra,0x0
    80006a54:	f1c080e7          	jalr	-228(ra) # 8000696c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    80006a58:	00000513          	li	a0,0
}
    80006a5c:	02813083          	ld	ra,40(sp)
    80006a60:	02013403          	ld	s0,32(sp)
    80006a64:	01813483          	ld	s1,24(sp)
    80006a68:	01013903          	ld	s2,16(sp)
    80006a6c:	00813983          	ld	s3,8(sp)
    80006a70:	00013a03          	ld	s4,0(sp)
    80006a74:	03010113          	addi	sp,sp,48
    80006a78:	00008067          	ret
            fmem_head = newsgm;
    80006a7c:	0149b423          	sd	s4,8(s3)
    return 0;
    80006a80:	00000513          	li	a0,0
    80006a84:	fd9ff06f          	j	80006a5c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(wantToFreeAddress(adr)) return -1;
    80006a88:	fff00513          	li	a0,-1
    80006a8c:	fd1ff06f          	j	80006a5c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080006a90 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80006a90:	fe010113          	addi	sp,sp,-32
    80006a94:	00113c23          	sd	ra,24(sp)
    80006a98:	00813823          	sd	s0,16(sp)
    80006a9c:	00913423          	sd	s1,8(sp)
    80006aa0:	02010413          	addi	s0,sp,32
    80006aa4:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    80006aa8:	00004517          	auipc	a0,0x4
    80006aac:	a4850513          	addi	a0,a0,-1464 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80006ab0:	fffff097          	auipc	ra,0xfffff
    80006ab4:	e90080e7          	jalr	-368(ra) # 80005940 <_Z12kprintStringPKc>
    if(!fmem_head)
    80006ab8:	0084b783          	ld	a5,8(s1)
    80006abc:	04078e63          	beqz	a5,80006b18 <_ZN15MemoryAllocator10print_listEv+0x88>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80006ac0:	0084b483          	ld	s1,8(s1)
    80006ac4:	06048463          	beqz	s1,80006b2c <_ZN15MemoryAllocator10print_listEv+0x9c>
        kprintInt((uint64)curr);
    80006ac8:	00000613          	li	a2,0
    80006acc:	00a00593          	li	a1,10
    80006ad0:	00048513          	mv	a0,s1
    80006ad4:	fffff097          	auipc	ra,0xfffff
    80006ad8:	eb4080e7          	jalr	-332(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80006adc:	00004517          	auipc	a0,0x4
    80006ae0:	9ec50513          	addi	a0,a0,-1556 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006ae4:	fffff097          	auipc	ra,0xfffff
    80006ae8:	e5c080e7          	jalr	-420(ra) # 80005940 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80006aec:	00000613          	li	a2,0
    80006af0:	00a00593          	li	a1,10
    80006af4:	0084b503          	ld	a0,8(s1)
    80006af8:	fffff097          	auipc	ra,0xfffff
    80006afc:	e90080e7          	jalr	-368(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80006b00:	00004517          	auipc	a0,0x4
    80006b04:	9c850513          	addi	a0,a0,-1592 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006b08:	fffff097          	auipc	ra,0xfffff
    80006b0c:	e38080e7          	jalr	-456(ra) # 80005940 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80006b10:	0004b483          	ld	s1,0(s1)
    80006b14:	fb1ff06f          	j	80006ac4 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80006b18:	00004517          	auipc	a0,0x4
    80006b1c:	9f850513          	addi	a0,a0,-1544 # 8000a510 <CONSOLE_STATUS+0x500>
    80006b20:	fffff097          	auipc	ra,0xfffff
    80006b24:	e20080e7          	jalr	-480(ra) # 80005940 <_Z12kprintStringPKc>
    80006b28:	f99ff06f          	j	80006ac0 <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80006b2c:	00004517          	auipc	a0,0x4
    80006b30:	9fc50513          	addi	a0,a0,-1540 # 8000a528 <CONSOLE_STATUS+0x518>
    80006b34:	fffff097          	auipc	ra,0xfffff
    80006b38:	e0c080e7          	jalr	-500(ra) # 80005940 <_Z12kprintStringPKc>
}
    80006b3c:	01813083          	ld	ra,24(sp)
    80006b40:	01013403          	ld	s0,16(sp)
    80006b44:	00813483          	ld	s1,8(sp)
    80006b48:	02010113          	addi	sp,sp,32
    80006b4c:	00008067          	ret

0000000080006b50 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    80006b50:	fe010113          	addi	sp,sp,-32
    80006b54:	00113c23          	sd	ra,24(sp)
    80006b58:	00813823          	sd	s0,16(sp)
    80006b5c:	00913423          	sd	s1,8(sp)
    80006b60:	02010413          	addi	s0,sp,32
    80006b64:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    80006b68:	00004517          	auipc	a0,0x4
    80006b6c:	9e050513          	addi	a0,a0,-1568 # 8000a548 <CONSOLE_STATUS+0x538>
    80006b70:	fffff097          	auipc	ra,0xfffff
    80006b74:	dd0080e7          	jalr	-560(ra) # 80005940 <_Z12kprintStringPKc>
    if(!fall_head)
    80006b78:	0104b783          	ld	a5,16(s1)
    80006b7c:	04078e63          	beqz	a5,80006bd8 <_ZN15MemoryAllocator14print_all_listEv+0x88>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80006b80:	0104b483          	ld	s1,16(s1)
    80006b84:	06048463          	beqz	s1,80006bec <_ZN15MemoryAllocator14print_all_listEv+0x9c>
        kprintInt((uint64)curr);
    80006b88:	00000613          	li	a2,0
    80006b8c:	00a00593          	li	a1,10
    80006b90:	00048513          	mv	a0,s1
    80006b94:	fffff097          	auipc	ra,0xfffff
    80006b98:	df4080e7          	jalr	-524(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80006b9c:	00004517          	auipc	a0,0x4
    80006ba0:	92c50513          	addi	a0,a0,-1748 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006ba4:	fffff097          	auipc	ra,0xfffff
    80006ba8:	d9c080e7          	jalr	-612(ra) # 80005940 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80006bac:	00000613          	li	a2,0
    80006bb0:	00a00593          	li	a1,10
    80006bb4:	0084b503          	ld	a0,8(s1)
    80006bb8:	fffff097          	auipc	ra,0xfffff
    80006bbc:	dd0080e7          	jalr	-560(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80006bc0:	00004517          	auipc	a0,0x4
    80006bc4:	90850513          	addi	a0,a0,-1784 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006bc8:	fffff097          	auipc	ra,0xfffff
    80006bcc:	d78080e7          	jalr	-648(ra) # 80005940 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80006bd0:	0004b483          	ld	s1,0(s1)
    80006bd4:	fb1ff06f          	j	80006b84 <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80006bd8:	00004517          	auipc	a0,0x4
    80006bdc:	93850513          	addi	a0,a0,-1736 # 8000a510 <CONSOLE_STATUS+0x500>
    80006be0:	fffff097          	auipc	ra,0xfffff
    80006be4:	d60080e7          	jalr	-672(ra) # 80005940 <_Z12kprintStringPKc>
    80006be8:	f99ff06f          	j	80006b80 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80006bec:	00004517          	auipc	a0,0x4
    80006bf0:	93c50513          	addi	a0,a0,-1732 # 8000a528 <CONSOLE_STATUS+0x518>
    80006bf4:	fffff097          	auipc	ra,0xfffff
    80006bf8:	d4c080e7          	jalr	-692(ra) # 80005940 <_Z12kprintStringPKc>
    80006bfc:	01813083          	ld	ra,24(sp)
    80006c00:	01013403          	ld	s0,16(sp)
    80006c04:	00813483          	ld	s1,8(sp)
    80006c08:	02010113          	addi	sp,sp,32
    80006c0c:	00008067          	ret

0000000080006c10 <_ZN7NoAlloc9mem_allocEm>:
#include"../../h/kernel_lib.h"

void* NoAlloc::NOALLOC_END_ADDR;

void* NoAlloc::mem_alloc(size_t size){
    80006c10:	ff010113          	addi	sp,sp,-16
    80006c14:	00813423          	sd	s0,8(sp)
    80006c18:	01010413          	addi	s0,sp,16
    80006c1c:	00050793          	mv	a5,a0
    /* not initalized */
    if(!NOALLOC_END_ADDR) return nullptr;
    80006c20:	00006717          	auipc	a4,0x6
    80006c24:	a9870713          	addi	a4,a4,-1384 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006c28:	00073503          	ld	a0,0(a4)
    80006c2c:	02050063          	beqz	a0,80006c4c <_ZN7NoAlloc9mem_allocEm+0x3c>

    /* not enough memory */
    if((size_t) NOALLOC_END_ADDR + size >= (uint64)HEAP_END_ADDR)
    80006c30:	00f507b3          	add	a5,a0,a5
    80006c34:	00006717          	auipc	a4,0x6
    80006c38:	87470713          	addi	a4,a4,-1932 # 8000c4a8 <HEAP_END_ADDR>
    80006c3c:	00073703          	ld	a4,0(a4)
    80006c40:	00e7fc63          	bgeu	a5,a4,80006c58 <_ZN7NoAlloc9mem_allocEm+0x48>
        return nullptr;
    
    void* ret = NOALLOC_END_ADDR;
    NOALLOC_END_ADDR = (void*) ((size_t)NOALLOC_END_ADDR + size); /* increase end addr by size of object */
    80006c44:	00006717          	auipc	a4,0x6
    80006c48:	a6f73a23          	sd	a5,-1420(a4) # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    
    return ret; 
}
    80006c4c:	00813403          	ld	s0,8(sp)
    80006c50:	01010113          	addi	sp,sp,16
    80006c54:	00008067          	ret
        return nullptr;
    80006c58:	00000513          	li	a0,0
    80006c5c:	ff1ff06f          	j	80006c4c <_ZN7NoAlloc9mem_allocEm+0x3c>

0000000080006c60 <_ZN7NoAlloc4initEv>:

void NoAlloc::init(){
    80006c60:	ff010113          	addi	sp,sp,-16
    80006c64:	00813423          	sd	s0,8(sp)
    80006c68:	01010413          	addi	s0,sp,16
    if(!NOALLOC_END_ADDR)
    80006c6c:	00006797          	auipc	a5,0x6
    80006c70:	a4c78793          	addi	a5,a5,-1460 # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006c74:	0007b783          	ld	a5,0(a5)
    80006c78:	00078863          	beqz	a5,80006c88 <_ZN7NoAlloc4initEv+0x28>
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
    80006c7c:	00813403          	ld	s0,8(sp)
    80006c80:	01010113          	addi	sp,sp,16
    80006c84:	00008067          	ret
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
    80006c88:	00006797          	auipc	a5,0x6
    80006c8c:	82878793          	addi	a5,a5,-2008 # 8000c4b0 <HEAP_START_ADDR>
    80006c90:	0007b783          	ld	a5,0(a5)
    80006c94:	00006717          	auipc	a4,0x6
    80006c98:	a2f73223          	sd	a5,-1500(a4) # 8000c6b8 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006c9c:	fe1ff06f          	j	80006c7c <_ZN7NoAlloc4initEv+0x1c>

0000000080006ca0 <_ZN8PMTEntry9set_flagsE12PMTEntryBits>:
#include"../../h/kernel_lib.h"

void PMTEntry::set_flags(PMTEntryBits peb){ val |= (uint64) peb; }
    80006ca0:	ff010113          	addi	sp,sp,-16
    80006ca4:	00813423          	sd	s0,8(sp)
    80006ca8:	01010413          	addi	s0,sp,16
    80006cac:	02059593          	slli	a1,a1,0x20
    80006cb0:	0205d593          	srli	a1,a1,0x20
    80006cb4:	00053783          	ld	a5,0(a0)
    80006cb8:	00b7e7b3          	or	a5,a5,a1
    80006cbc:	00f53023          	sd	a5,0(a0)
    80006cc0:	00813403          	ld	s0,8(sp)
    80006cc4:	01010113          	addi	sp,sp,16
    80006cc8:	00008067          	ret

0000000080006ccc <_ZN8PMTEntry11clear_flagsE12PMTEntryBits>:

void PMTEntry::clear_flags(PMTEntryBits peb){ val &= ~((uint64) peb); }
    80006ccc:	ff010113          	addi	sp,sp,-16
    80006cd0:	00813423          	sd	s0,8(sp)
    80006cd4:	01010413          	addi	s0,sp,16
    80006cd8:	02059593          	slli	a1,a1,0x20
    80006cdc:	0205d593          	srli	a1,a1,0x20
    80006ce0:	fff5c793          	not	a5,a1
    80006ce4:	00053583          	ld	a1,0(a0)
    80006ce8:	00f5f5b3          	and	a1,a1,a5
    80006cec:	00b53023          	sd	a1,0(a0)
    80006cf0:	00813403          	ld	s0,8(sp)
    80006cf4:	01010113          	addi	sp,sp,16
    80006cf8:	00008067          	ret

0000000080006cfc <_ZN8PMTEntry6get_faEv>:

void* PMTEntry::get_fa(){
    80006cfc:	ff010113          	addi	sp,sp,-16
    80006d00:	00813423          	sd	s0,8(sp)
    80006d04:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 10;
    return (void*)((val & mask) << 2);
    80006d08:	00053783          	ld	a5,0(a0)
    80006d0c:	00279793          	slli	a5,a5,0x2
}
    80006d10:	fffff537          	lui	a0,0xfffff
    80006d14:	00a7f533          	and	a0,a5,a0
    80006d18:	00813403          	ld	s0,8(sp)
    80006d1c:	01010113          	addi	sp,sp,16
    80006d20:	00008067          	ret

0000000080006d24 <_ZN8PMTEntry6set_faEPv>:

int PMTEntry::set_fa(void* fa){
    80006d24:	ff010113          	addi	sp,sp,-16
    80006d28:	00813423          	sd	s0,8(sp)
    80006d2c:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 12, uifa = (uint64) fa;
    
    if( (mask & uifa) != uifa )
    80006d30:	03459793          	slli	a5,a1,0x34
    80006d34:	02079463          	bnez	a5,80006d5c <_ZN8PMTEntry6set_faEPv+0x38>
        return -1; //exception
    
    mask = ~((~0ULL) << 10);
    val &= mask;
    80006d38:	00053783          	ld	a5,0(a0) # fffffffffffff000 <end+0xffffffff7fff15d0>
    80006d3c:	3ff7f793          	andi	a5,a5,1023
    val |= (uifa >> 2); 
    80006d40:	0025d593          	srli	a1,a1,0x2
    80006d44:	00b7e7b3          	or	a5,a5,a1
    80006d48:	00f53023          	sd	a5,0(a0)
    return 0;
    80006d4c:	00000513          	li	a0,0
}
    80006d50:	00813403          	ld	s0,8(sp)
    80006d54:	01010113          	addi	sp,sp,16
    80006d58:	00008067          	ret
        return -1; //exception
    80006d5c:	fff00513          	li	a0,-1
    80006d60:	ff1ff06f          	j	80006d50 <_ZN8PMTEntry6set_faEPv+0x2c>

0000000080006d64 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>:

bool PMTEntry::chk_flags(PMTEntryBits peb){
    80006d64:	ff010113          	addi	sp,sp,-16
    80006d68:	00813423          	sd	s0,8(sp)
    80006d6c:	01010413          	addi	s0,sp,16
    uint64 t = val & peb;
    80006d70:	00053503          	ld	a0,0(a0)
    80006d74:	00b57533          	and	a0,a0,a1
    return t == peb;
    80006d78:	40a58533          	sub	a0,a1,a0
}
    80006d7c:	00153513          	seqz	a0,a0
    80006d80:	00813403          	ld	s0,8(sp)
    80006d84:	01010113          	addi	sp,sp,16
    80006d88:	00008067          	ret

0000000080006d8c <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../h/kernel_lib.h"
bool TcbQueue::exists(TCB* info) const 
{
    80006d8c:	ff010113          	addi	sp,sp,-16
    80006d90:	00813423          	sd	s0,8(sp)
    80006d94:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    80006d98:	00053783          	ld	a5,0(a0)
    80006d9c:	00078863          	beqz	a5,80006dac <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    80006da0:	00b78e63          	beq	a5,a1,80006dbc <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    80006da4:	0007b783          	ld	a5,0(a5)
    80006da8:	ff5ff06f          	j	80006d9c <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    80006dac:	00000513          	li	a0,0
}
    80006db0:	00813403          	ld	s0,8(sp)
    80006db4:	01010113          	addi	sp,sp,16
    80006db8:	00008067          	ret
            return true;
    80006dbc:	00100513          	li	a0,1
    80006dc0:	ff1ff06f          	j	80006db0 <_ZNK8TcbQueue6existsEP3TCB+0x24>

0000000080006dc4 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    80006dc4:	ff010113          	addi	sp,sp,-16
    80006dc8:	00813423          	sd	s0,8(sp)
    80006dcc:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    80006dd0:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    80006dd4:	00853783          	ld	a5,8(a0)
    80006dd8:	02078263          	beqz	a5,80006dfc <_ZN8TcbQueue6insertEP3TCB+0x38>
    80006ddc:	00b7b023          	sd	a1,0(a5)
    80006de0:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    80006de4:	01052783          	lw	a5,16(a0)
    80006de8:	0017879b          	addiw	a5,a5,1
    80006dec:	00f52823          	sw	a5,16(a0)
    return *this;
}
    80006df0:	00813403          	ld	s0,8(sp)
    80006df4:	01010113          	addi	sp,sp,16
    80006df8:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80006dfc:	00b53023          	sd	a1,0(a0)
    80006e00:	fe1ff06f          	j	80006de0 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080006e04 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80006e04:	ff010113          	addi	sp,sp,-16
    80006e08:	00813423          	sd	s0,8(sp)
    80006e0c:	01010413          	addi	s0,sp,16
    80006e10:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80006e14:	00053503          	ld	a0,0(a0)
    80006e18:	02050263          	beqz	a0,80006e3c <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80006e1c:	0087b703          	ld	a4,8(a5)
    80006e20:	02e50463          	beq	a0,a4,80006e48 <_ZN8TcbQueue6removeEv+0x44>
    80006e24:	00053703          	ld	a4,0(a0)
    80006e28:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    80006e2c:	00053023          	sd	zero,0(a0)
        tmpNum--;
    80006e30:	0107a703          	lw	a4,16(a5)
    80006e34:	fff7071b          	addiw	a4,a4,-1
    80006e38:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    80006e3c:	00813403          	ld	s0,8(sp)
    80006e40:	01010113          	addi	sp,sp,16
    80006e44:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    80006e48:	0007b423          	sd	zero,8(a5)
    80006e4c:	00000713          	li	a4,0
    80006e50:	fd9ff06f          	j	80006e28 <_ZN8TcbQueue6removeEv+0x24>

0000000080006e54 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80006e54:	ff010113          	addi	sp,sp,-16
    80006e58:	00813423          	sd	s0,8(sp)
    80006e5c:	01010413          	addi	s0,sp,16
    return head;
}
    80006e60:	00053503          	ld	a0,0(a0)
    80006e64:	00813403          	ld	s0,8(sp)
    80006e68:	01010113          	addi	sp,sp,16
    80006e6c:	00008067          	ret

0000000080006e70 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    80006e70:	fe010113          	addi	sp,sp,-32
    80006e74:	00113c23          	sd	ra,24(sp)
    80006e78:	00813823          	sd	s0,16(sp)
    80006e7c:	00913423          	sd	s1,8(sp)
    80006e80:	02010413          	addi	s0,sp,32
    TCB* t = head;
    80006e84:	00053483          	ld	s1,0(a0)
    while(t){
    80006e88:	04048063          	beqz	s1,80006ec8 <_ZN8TcbQueue10printQueueEv+0x58>
        kprintString("-> ");
    80006e8c:	00003517          	auipc	a0,0x3
    80006e90:	6e450513          	addi	a0,a0,1764 # 8000a570 <CONSOLE_STATUS+0x560>
    80006e94:	fffff097          	auipc	ra,0xfffff
    80006e98:	aac080e7          	jalr	-1364(ra) # 80005940 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    80006e9c:	00000613          	li	a2,0
    80006ea0:	00a00593          	li	a1,10
    80006ea4:	00048513          	mv	a0,s1
    80006ea8:	fffff097          	auipc	ra,0xfffff
    80006eac:	ae0080e7          	jalr	-1312(ra) # 80005988 <_Z9kprintIntmib>
        kprintString("\n");
    80006eb0:	00003517          	auipc	a0,0x3
    80006eb4:	61850513          	addi	a0,a0,1560 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006eb8:	fffff097          	auipc	ra,0xfffff
    80006ebc:	a88080e7          	jalr	-1400(ra) # 80005940 <_Z12kprintStringPKc>
        t = t->next;            
    80006ec0:	0004b483          	ld	s1,0(s1)
    while(t){
    80006ec4:	fc5ff06f          	j	80006e88 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    80006ec8:	00003517          	auipc	a0,0x3
    80006ecc:	60050513          	addi	a0,a0,1536 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006ed0:	fffff097          	auipc	ra,0xfffff
    80006ed4:	a70080e7          	jalr	-1424(ra) # 80005940 <_Z12kprintStringPKc>
}
    80006ed8:	01813083          	ld	ra,24(sp)
    80006edc:	01013403          	ld	s0,16(sp)
    80006ee0:	00813483          	ld	s1,8(sp)
    80006ee4:	02010113          	addi	sp,sp,32
    80006ee8:	00008067          	ret

0000000080006eec <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    80006eec:	fc010113          	addi	sp,sp,-64
    80006ef0:	02113c23          	sd	ra,56(sp)
    80006ef4:	02813823          	sd	s0,48(sp)
    80006ef8:	02913423          	sd	s1,40(sp)
    80006efc:	03213023          	sd	s2,32(sp)
    80006f00:	01313c23          	sd	s3,24(sp)
    80006f04:	01413823          	sd	s4,16(sp)
    80006f08:	01513423          	sd	s5,8(sp)
    80006f0c:	04010413          	addi	s0,sp,64
    80006f10:	00050a93          	mv	s5,a0
    80006f14:	00058913          	mv	s2,a1
    80006f18:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80006f1c:	00053483          	ld	s1,0(a0)
    80006f20:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80006f24:	02048063          	beqz	s1,80006f44 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80006f28:	00048593          	mv	a1,s1
    80006f2c:	00090513          	mv	a0,s2
    80006f30:	000a00e7          	jalr	s4
    80006f34:	00054863          	bltz	a0,80006f44 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80006f38:	00048993          	mv	s3,s1
        cur = cur->next;
    80006f3c:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80006f40:	fe5ff06f          	j	80006f24 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80006f44:	04098063          	beqz	s3,80006f84 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80006f48:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    80006f4c:	04048a63          	beqz	s1,80006fa0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    80006f50:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    80006f54:	010aa783          	lw	a5,16(s5)
    80006f58:	0017879b          	addiw	a5,a5,1
    80006f5c:	00faa823          	sw	a5,16(s5)
}
    80006f60:	03813083          	ld	ra,56(sp)
    80006f64:	03013403          	ld	s0,48(sp)
    80006f68:	02813483          	ld	s1,40(sp)
    80006f6c:	02013903          	ld	s2,32(sp)
    80006f70:	01813983          	ld	s3,24(sp)
    80006f74:	01013a03          	ld	s4,16(sp)
    80006f78:	00813a83          	ld	s5,8(sp)
    80006f7c:	04010113          	addi	sp,sp,64
    80006f80:	00008067          	ret
        info->next = head;
    80006f84:	000ab783          	ld	a5,0(s5)
    80006f88:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    80006f8c:	00078663          	beqz	a5,80006f98 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    80006f90:	012ab023          	sd	s2,0(s5)
    80006f94:	fc1ff06f          	j	80006f54 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    80006f98:	012ab423          	sd	s2,8(s5)
    80006f9c:	ff5ff06f          	j	80006f90 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    80006fa0:	012ab423          	sd	s2,8(s5)
    80006fa4:	fadff06f          	j	80006f50 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

0000000080006fa8 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    80006fa8:	ff010113          	addi	sp,sp,-16
    80006fac:	00813423          	sd	s0,8(sp)
    80006fb0:	01010413          	addi	s0,sp,16
    info->next = head;
    80006fb4:	00053783          	ld	a5,0(a0)
    80006fb8:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    80006fbc:	02078063          	beqz	a5,80006fdc <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    80006fc0:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    80006fc4:	01052783          	lw	a5,16(a0)
    80006fc8:	0017879b          	addiw	a5,a5,1
    80006fcc:	00f52823          	sw	a5,16(a0)
    80006fd0:	00813403          	ld	s0,8(sp)
    80006fd4:	01010113          	addi	sp,sp,16
    80006fd8:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    80006fdc:	00b53423          	sd	a1,8(a0)
    80006fe0:	fe1ff06f          	j	80006fc0 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

0000000080006fe4 <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    80006fe4:	ff010113          	addi	sp,sp,-16
    80006fe8:	00813423          	sd	s0,8(sp)
    80006fec:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    80006ff0:	00852683          	lw	a3,8(a0)
    80006ff4:	0085a703          	lw	a4,8(a1)
    80006ff8:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    80006ffc:	0007cc63          	bltz	a5,80007014 <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    80007000:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    80007004:	00078513          	mv	a0,a5
    80007008:	00813403          	ld	s0,8(sp)
    8000700c:	01010113          	addi	sp,sp,16
    80007010:	00008067          	ret
        x2->sleep_time = -diff;
    80007014:	40d7073b          	subw	a4,a4,a3
    80007018:	00e5b423          	sd	a4,8(a1)
    8000701c:	fe9ff06f          	j	80007004 <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

0000000080007020 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    80007020:	ff010113          	addi	sp,sp,-16
    80007024:	00813423          	sd	s0,8(sp)
    80007028:	01010413          	addi	s0,sp,16
    8000702c:	00100793          	li	a5,1
    80007030:	00f50863          	beq	a0,a5,80007040 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80007034:	00813403          	ld	s0,8(sp)
    80007038:	01010113          	addi	sp,sp,16
    8000703c:	00008067          	ret
    80007040:	000107b7          	lui	a5,0x10
    80007044:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007048:	fef596e3          	bne	a1,a5,80007034 <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    8000704c:	00005797          	auipc	a5,0x5
    80007050:	73c78793          	addi	a5,a5,1852 # 8000c788 <_ZN9Scheduler5queueE>
    80007054:	0007b023          	sd	zero,0(a5)
    80007058:	0007b423          	sd	zero,8(a5)
    8000705c:	0007a823          	sw	zero,16(a5)
    80007060:	0007bc23          	sd	zero,24(a5)
    80007064:	0207b023          	sd	zero,32(a5)
    80007068:	0207a423          	sw	zero,40(a5)
    8000706c:	fc9ff06f          	j	80007034 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080007070 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80007070:	ff010113          	addi	sp,sp,-16
    80007074:	00113423          	sd	ra,8(sp)
    80007078:	00813023          	sd	s0,0(sp)
    8000707c:	01010413          	addi	s0,sp,16
    80007080:	00005517          	auipc	a0,0x5
    80007084:	70850513          	addi	a0,a0,1800 # 8000c788 <_ZN9Scheduler5queueE>
    80007088:	00000097          	auipc	ra,0x0
    8000708c:	d7c080e7          	jalr	-644(ra) # 80006e04 <_ZN8TcbQueue6removeEv>
    80007090:	00813083          	ld	ra,8(sp)
    80007094:	00013403          	ld	s0,0(sp)
    80007098:	01010113          	addi	sp,sp,16
    8000709c:	00008067          	ret

00000000800070a0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    800070a0:	ff010113          	addi	sp,sp,-16
    800070a4:	00113423          	sd	ra,8(sp)
    800070a8:	00813023          	sd	s0,0(sp)
    800070ac:	01010413          	addi	s0,sp,16
    800070b0:	00050593          	mv	a1,a0
    800070b4:	00005517          	auipc	a0,0x5
    800070b8:	6d450513          	addi	a0,a0,1748 # 8000c788 <_ZN9Scheduler5queueE>
    800070bc:	00000097          	auipc	ra,0x0
    800070c0:	d08080e7          	jalr	-760(ra) # 80006dc4 <_ZN8TcbQueue6insertEP3TCB>
    800070c4:	00813083          	ld	ra,8(sp)
    800070c8:	00013403          	ld	s0,0(sp)
    800070cc:	01010113          	addi	sp,sp,16
    800070d0:	00008067          	ret

00000000800070d4 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    800070d4:	ff010113          	addi	sp,sp,-16
    800070d8:	00813423          	sd	s0,8(sp)
    800070dc:	01010413          	addi	s0,sp,16
    800070e0:	00813403          	ld	s0,8(sp)
    800070e4:	01010113          	addi	sp,sp,16
    800070e8:	00008067          	ret

00000000800070ec <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    800070ec:	ff010113          	addi	sp,sp,-16
    800070f0:	00813423          	sd	s0,8(sp)
    800070f4:	01010413          	addi	s0,sp,16
    800070f8:	00813403          	ld	s0,8(sp)
    800070fc:	01010113          	addi	sp,sp,16
    80007100:	00008067          	ret

0000000080007104 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    80007104:	ff010113          	addi	sp,sp,-16
    80007108:	00113423          	sd	ra,8(sp)
    8000710c:	00813023          	sd	s0,0(sp)
    80007110:	01010413          	addi	s0,sp,16
    80007114:	00005517          	auipc	a0,0x5
    80007118:	67450513          	addi	a0,a0,1652 # 8000c788 <_ZN9Scheduler5queueE>
    8000711c:	00000097          	auipc	ra,0x0
    80007120:	d54080e7          	jalr	-684(ra) # 80006e70 <_ZN8TcbQueue10printQueueEv>
    80007124:	00813083          	ld	ra,8(sp)
    80007128:	00013403          	ld	s0,0(sp)
    8000712c:	01010113          	addi	sp,sp,16
    80007130:	00008067          	ret

0000000080007134 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    80007134:	ff010113          	addi	sp,sp,-16
    80007138:	00113423          	sd	ra,8(sp)
    8000713c:	00813023          	sd	s0,0(sp)
    80007140:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    80007144:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80007148:	00000617          	auipc	a2,0x0
    8000714c:	e9c60613          	addi	a2,a2,-356 # 80006fe4 <_ZN9Scheduler3cmpEP3TCBS1_>
    80007150:	00050593          	mv	a1,a0
    80007154:	00005517          	auipc	a0,0x5
    80007158:	64c50513          	addi	a0,a0,1612 # 8000c7a0 <_ZN9Scheduler8sleepingE>
    8000715c:	00000097          	auipc	ra,0x0
    80007160:	d90080e7          	jalr	-624(ra) # 80006eec <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80007164:	00813083          	ld	ra,8(sp)
    80007168:	00013403          	ld	s0,0(sp)
    8000716c:	01010113          	addi	sp,sp,16
    80007170:	00008067          	ret

0000000080007174 <_ZN9Scheduler12update_sleepEv>:
{
    80007174:	fe010113          	addi	sp,sp,-32
    80007178:	00113c23          	sd	ra,24(sp)
    8000717c:	00813823          	sd	s0,16(sp)
    80007180:	00913423          	sd	s1,8(sp)
    80007184:	01213023          	sd	s2,0(sp)
    80007188:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    8000718c:	00005517          	auipc	a0,0x5
    80007190:	61450513          	addi	a0,a0,1556 # 8000c7a0 <_ZN9Scheduler8sleepingE>
    80007194:	00000097          	auipc	ra,0x0
    80007198:	cc0080e7          	jalr	-832(ra) # 80006e54 <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    8000719c:	04050e63          	beqz	a0,800071f8 <_ZN9Scheduler12update_sleepEv+0x84>
    800071a0:	00050493          	mv	s1,a0
    t->sleep_time--;
    800071a4:	00853783          	ld	a5,8(a0)
    800071a8:	fff78793          	addi	a5,a5,-1
    800071ac:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    800071b0:	04048463          	beqz	s1,800071f8 <_ZN9Scheduler12update_sleepEv+0x84>
    800071b4:	0084b783          	ld	a5,8(s1)
    800071b8:	04079063          	bnez	a5,800071f8 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    800071bc:	00005917          	auipc	s2,0x5
    800071c0:	5e490913          	addi	s2,s2,1508 # 8000c7a0 <_ZN9Scheduler8sleepingE>
    800071c4:	00090513          	mv	a0,s2
    800071c8:	00000097          	auipc	ra,0x0
    800071cc:	c3c080e7          	jalr	-964(ra) # 80006e04 <_ZN8TcbQueue6removeEv>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
        allocator.mem_free(this->stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    800071d0:	00100793          	li	a5,1
    800071d4:	02f4a823          	sw	a5,48(s1)
        put(t);
    800071d8:	00048513          	mv	a0,s1
    800071dc:	00000097          	auipc	ra,0x0
    800071e0:	ec4080e7          	jalr	-316(ra) # 800070a0 <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    800071e4:	00090513          	mv	a0,s2
    800071e8:	00000097          	auipc	ra,0x0
    800071ec:	c6c080e7          	jalr	-916(ra) # 80006e54 <_ZN8TcbQueue3topEv>
    800071f0:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    800071f4:	fbdff06f          	j	800071b0 <_ZN9Scheduler12update_sleepEv+0x3c>
    800071f8:	01813083          	ld	ra,24(sp)
    800071fc:	01013403          	ld	s0,16(sp)
    80007200:	00813483          	ld	s1,8(sp)
    80007204:	00013903          	ld	s2,0(sp)
    80007208:	02010113          	addi	sp,sp,32
    8000720c:	00008067          	ret

0000000080007210 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80007210:	ff010113          	addi	sp,sp,-16
    80007214:	00113423          	sd	ra,8(sp)
    80007218:	00813023          	sd	s0,0(sp)
    8000721c:	01010413          	addi	s0,sp,16
    80007220:	000105b7          	lui	a1,0x10
    80007224:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80007228:	00100513          	li	a0,1
    8000722c:	00000097          	auipc	ra,0x0
    80007230:	df4080e7          	jalr	-524(ra) # 80007020 <_Z41__static_initialization_and_destruction_0ii>
    80007234:	00813083          	ld	ra,8(sp)
    80007238:	00013403          	ld	s0,0(sp)
    8000723c:	01010113          	addi	sp,sp,16
    80007240:	00008067          	ret

0000000080007244 <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80007244:	ff010113          	addi	sp,sp,-16
    80007248:	00813423          	sd	s0,8(sp)
    8000724c:	01010413          	addi	s0,sp,16
    80007250:	00100793          	li	a5,1
    80007254:	00f50863          	beq	a0,a5,80007264 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80007258:	00813403          	ld	s0,8(sp)
    8000725c:	01010113          	addi	sp,sp,16
    80007260:	00008067          	ret
    80007264:	000107b7          	lui	a5,0x10
    80007268:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000726c:	fef596e3          	bne	a1,a5,80007258 <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80007270:	00003797          	auipc	a5,0x3
    80007274:	da078793          	addi	a5,a5,-608 # 8000a010 <CONSOLE_STATUS>
    80007278:	0007b783          	ld	a5,0(a5)
    8000727c:	00005717          	auipc	a4,0x5
    80007280:	46f73a23          	sd	a5,1140(a4) # 8000c6f0 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80007284:	00003797          	auipc	a5,0x3
    80007288:	d7c78793          	addi	a5,a5,-644 # 8000a000 <CONSOLE_RX_DATA>
    8000728c:	0007b783          	ld	a5,0(a5)
    80007290:	00005717          	auipc	a4,0x5
    80007294:	44f73c23          	sd	a5,1112(a4) # 8000c6e8 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80007298:	00003797          	auipc	a5,0x3
    8000729c:	d7078793          	addi	a5,a5,-656 # 8000a008 <CONSOLE_TX_DATA>
    800072a0:	0007b783          	ld	a5,0(a5)
    800072a4:	00005717          	auipc	a4,0x5
    800072a8:	42f73e23          	sd	a5,1084(a4) # 8000c6e0 <_ZN5StdIO5odataE>
    800072ac:	fadff06f          	j	80007258 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800072b0 <_ZN5StdIO12outputWorkerEPv>:
{
    800072b0:	fc010113          	addi	sp,sp,-64
    800072b4:	02113c23          	sd	ra,56(sp)
    800072b8:	02813823          	sd	s0,48(sp)
    800072bc:	02913423          	sd	s1,40(sp)
    800072c0:	03213023          	sd	s2,32(sp)
    800072c4:	01313c23          	sd	s3,24(sp)
    800072c8:	01413823          	sd	s4,16(sp)
    800072cc:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    800072d0:	00005797          	auipc	a5,0x5
    800072d4:	3e07b823          	sd	zero,1008(a5) # 8000c6c0 <_ZN5StdIO10out_threadE>
    800072d8:	0400006f          	j	80007318 <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800072dc:	100027f3          	csrr	a5,sstatus
    800072e0:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800072e4:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800072e8:	141027f3          	csrr	a5,sepc
    800072ec:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800072f0:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    800072f4:	00005797          	auipc	a5,0x5
    800072f8:	41c78793          	addi	a5,a5,1052 # 8000c710 <_ZN3TCB7runningE>
    800072fc:	0007b783          	ld	a5,0(a5)
    80007300:	00005717          	auipc	a4,0x5
    80007304:	3cf73023          	sd	a5,960(a4) # 8000c6c0 <_ZN5StdIO10out_threadE>
            TCB::yield();
    80007308:	00001097          	auipc	ra,0x1
    8000730c:	8bc080e7          	jalr	-1860(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80007310:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80007314:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80007318:	00005797          	auipc	a5,0x5
    8000731c:	3d878793          	addi	a5,a5,984 # 8000c6f0 <_ZN5StdIO8iostatusE>
    80007320:	0007b783          	ld	a5,0(a5)
    80007324:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80007328:	0207f793          	andi	a5,a5,32
    8000732c:	fa0788e3          	beqz	a5,800072dc <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80007330:	00005797          	auipc	a5,0x5
    80007334:	3a078793          	addi	a5,a5,928 # 8000c6d0 <_ZN5StdIO7obufferE>
    80007338:	0007b483          	ld	s1,0(a5)
    8000733c:	00005797          	auipc	a5,0x5
    80007340:	3a478793          	addi	a5,a5,932 # 8000c6e0 <_ZN5StdIO5odataE>
    80007344:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80007348:	42848513          	addi	a0,s1,1064
    8000734c:	fffff097          	auipc	ra,0xfffff
    80007350:	150080e7          	jalr	336(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80007354:	40048913          	addi	s2,s1,1024
    80007358:	00090513          	mv	a0,s2
    8000735c:	fffff097          	auipc	ra,0xfffff
    80007360:	140080e7          	jalr	320(ra) # 8000649c <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80007364:	4804a783          	lw	a5,1152(s1)
    80007368:	fff7879b          	addiw	a5,a5,-1
    8000736c:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80007370:	4784a783          	lw	a5,1144(s1)
    80007374:	00f48733          	add	a4,s1,a5
    80007378:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    8000737c:	0017879b          	addiw	a5,a5,1
    80007380:	41f7d71b          	sraiw	a4,a5,0x1f
    80007384:	0167571b          	srliw	a4,a4,0x16
    80007388:	00e787bb          	addw	a5,a5,a4
    8000738c:	3ff7f793          	andi	a5,a5,1023
    80007390:	40e787bb          	subw	a5,a5,a4
    80007394:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    80007398:	45048513          	addi	a0,s1,1104
    8000739c:	fffff097          	auipc	ra,0xfffff
    800073a0:	184080e7          	jalr	388(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800073a4:	00090513          	mv	a0,s2
    800073a8:	fffff097          	auipc	ra,0xfffff
    800073ac:	178080e7          	jalr	376(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    800073b0:	01498023          	sb	s4,0(s3)
    800073b4:	f65ff06f          	j	80007318 <_ZN5StdIO12outputWorkerEPv+0x68>

00000000800073b8 <_ZN5StdIO9initalizeEv>:
{
    800073b8:	fd010113          	addi	sp,sp,-48
    800073bc:	02113423          	sd	ra,40(sp)
    800073c0:	02813023          	sd	s0,32(sp)
    800073c4:	00913c23          	sd	s1,24(sp)
    800073c8:	01213823          	sd	s2,16(sp)
    800073cc:	01313423          	sd	s3,8(sp)
    800073d0:	03010413          	addi	s0,sp,48
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800073d4:	fffff097          	auipc	ra,0xfffff
    800073d8:	3b4080e7          	jalr	948(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800073dc:	01300593          	li	a1,19
    800073e0:	fffff097          	auipc	ra,0xfffff
    800073e4:	41c080e7          	jalr	1052(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    800073e8:	40050793          	addi	a5,a0,1024
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    KSemaphore(unsigned val):val(val)
    800073ec:	00100913          	li	s2,1
    800073f0:	41252423          	sw	s2,1032(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    800073f4:	40053823          	sd	zero,1040(a0)
    800073f8:	40053c23          	sd	zero,1048(a0)
    800073fc:	42052023          	sw	zero,1056(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80007400:	00005497          	auipc	s1,0x5
    80007404:	2b048493          	addi	s1,s1,688 # 8000c6b0 <_ZN10KSemaphore16activeSemaphoresE>
    80007408:	0004b703          	ld	a4,0(s1)
    8000740c:	40e53023          	sd	a4,1024(a0)
    80007410:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80007414:	42052823          	sw	zero,1072(a0)
    80007418:	42053c23          	sd	zero,1080(a0)
    8000741c:	44053023          	sd	zero,1088(a0)
    80007420:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    80007424:	42f53423          	sd	a5,1064(a0)
    80007428:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    8000742c:	40000993          	li	s3,1024
    80007430:	45352c23          	sw	s3,1112(a0)
    80007434:	46053023          	sd	zero,1120(a0)
    80007438:	46053423          	sd	zero,1128(a0)
    8000743c:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    80007440:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80007444:	00f4b023          	sd	a5,0(s1)
    80007448:	46052c23          	sw	zero,1144(a0)
    8000744c:	46052e23          	sw	zero,1148(a0)
    80007450:	48052023          	sw	zero,1152(a0)
    ibuffer = new SharedBuffer<char>();
    80007454:	00005797          	auipc	a5,0x5
    80007458:	28a7b223          	sd	a0,644(a5) # 8000c6d8 <_ZN5StdIO7ibufferE>
    8000745c:	fffff097          	auipc	ra,0xfffff
    80007460:	32c080e7          	jalr	812(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80007464:	01300593          	li	a1,19
    80007468:	fffff097          	auipc	ra,0xfffff
    8000746c:	394080e7          	jalr	916(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    80007470:	40050793          	addi	a5,a0,1024
    KSemaphore(unsigned val):val(val)
    80007474:	41252423          	sw	s2,1032(a0)
    80007478:	40053823          	sd	zero,1040(a0)
    8000747c:	40053c23          	sd	zero,1048(a0)
    80007480:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores; 
    80007484:	0004b703          	ld	a4,0(s1)
    80007488:	40e53023          	sd	a4,1024(a0)
    8000748c:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80007490:	42052823          	sw	zero,1072(a0)
    80007494:	42053c23          	sd	zero,1080(a0)
    80007498:	44053023          	sd	zero,1088(a0)
    8000749c:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    800074a0:	42f53423          	sd	a5,1064(a0)
    800074a4:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    800074a8:	45352c23          	sw	s3,1112(a0)
    800074ac:	46053023          	sd	zero,1120(a0)
    800074b0:	46053423          	sd	zero,1128(a0)
    800074b4:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    800074b8:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    800074bc:	00f4b023          	sd	a5,0(s1)
    800074c0:	46052c23          	sw	zero,1144(a0)
    800074c4:	46052e23          	sw	zero,1148(a0)
    800074c8:	48052023          	sw	zero,1152(a0)
    obuffer = new SharedBuffer<char>();
    800074cc:	00005797          	auipc	a5,0x5
    800074d0:	20a7b223          	sd	a0,516(a5) # 8000c6d0 <_ZN5StdIO7obufferE>
*   THE ALLOCATION FOR THE KERNEL CLASSES 
*   it is easier to keep this lines in the file and just include
*   them in kernel structures
*/

void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800074d4:	fffff097          	auipc	ra,0xfffff
    800074d8:	2b4080e7          	jalr	692(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800074dc:	00100593          	li	a1,1
    800074e0:	fffff097          	auipc	ra,0xfffff
    800074e4:	31c080e7          	jalr	796(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    800074e8:	00052423          	sw	zero,8(a0)
    800074ec:	00053823          	sd	zero,16(a0)
    800074f0:	00053c23          	sd	zero,24(a0)
    800074f4:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    800074f8:	0004b783          	ld	a5,0(s1)
    800074fc:	00f53023          	sd	a5,0(a0)
        activeSemaphores = this;
    80007500:	00a4b023          	sd	a0,0(s1)
    blockSem = new KSemaphore(0);
    80007504:	00005797          	auipc	a5,0x5
    80007508:	1ca7b223          	sd	a0,452(a5) # 8000c6c8 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    8000750c:	00003797          	auipc	a5,0x3
    80007510:	b0478793          	addi	a5,a5,-1276 # 8000a010 <CONSOLE_STATUS>
    80007514:	0007b783          	ld	a5,0(a5)
    80007518:	00005717          	auipc	a4,0x5
    8000751c:	1cf73c23          	sd	a5,472(a4) # 8000c6f0 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80007520:	00003797          	auipc	a5,0x3
    80007524:	ae078793          	addi	a5,a5,-1312 # 8000a000 <CONSOLE_RX_DATA>
    80007528:	0007b783          	ld	a5,0(a5)
    8000752c:	00005717          	auipc	a4,0x5
    80007530:	1af73e23          	sd	a5,444(a4) # 8000c6e8 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80007534:	00003797          	auipc	a5,0x3
    80007538:	ad478793          	addi	a5,a5,-1324 # 8000a008 <CONSOLE_TX_DATA>
    8000753c:	0007b783          	ld	a5,0(a5)
    80007540:	00005717          	auipc	a4,0x5
    80007544:	1af73023          	sd	a5,416(a4) # 8000c6e0 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80007548:	fffff097          	auipc	ra,0xfffff
    8000754c:	240080e7          	jalr	576(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80007550:	04000593          	li	a1,64
    80007554:	fffff097          	auipc	ra,0xfffff
    80007558:	2a8080e7          	jalr	680(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    8000755c:	00050613          	mv	a2,a0
    80007560:	00000593          	li	a1,0
    80007564:	00000517          	auipc	a0,0x0
    80007568:	d4c50513          	addi	a0,a0,-692 # 800072b0 <_ZN5StdIO12outputWorkerEPv>
    8000756c:	00000097          	auipc	ra,0x0
    80007570:	2a4080e7          	jalr	676(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80007574:	00005797          	auipc	a5,0x5
    80007578:	14a7b623          	sd	a0,332(a5) # 8000c6c0 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    8000757c:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80007580:	03250b23          	sb	s2,54(a0)
}
    80007584:	02813083          	ld	ra,40(sp)
    80007588:	02013403          	ld	s0,32(sp)
    8000758c:	01813483          	ld	s1,24(sp)
    80007590:	01013903          	ld	s2,16(sp)
    80007594:	00813983          	ld	s3,8(sp)
    80007598:	03010113          	addi	sp,sp,48
    8000759c:	00008067          	ret

00000000800075a0 <_ZN5StdIO11inputWorkerEv>:
{
    800075a0:	ff010113          	addi	sp,sp,-16
    800075a4:	00813423          	sd	s0,8(sp)
    800075a8:	01010413          	addi	s0,sp,16
}
    800075ac:	00813403          	ld	s0,8(sp)
    800075b0:	01010113          	addi	sp,sp,16
    800075b4:	00008067          	ret

00000000800075b8 <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    800075b8:	fc010113          	addi	sp,sp,-64
    800075bc:	02113c23          	sd	ra,56(sp)
    800075c0:	02813823          	sd	s0,48(sp)
    800075c4:	02913423          	sd	s1,40(sp)
    800075c8:	03213023          	sd	s2,32(sp)
    800075cc:	01313c23          	sd	s3,24(sp)
    800075d0:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    800075d4:	ffffa097          	auipc	ra,0xffffa
    800075d8:	280080e7          	jalr	640(ra) # 80001854 <plic_claim>
    if(t == CONSOLE_IRQ)
    800075dc:	00a00793          	li	a5,10
    800075e0:	12f51063          	bne	a0,a5,80007700 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    800075e4:	00005797          	auipc	a5,0x5
    800075e8:	10c78793          	addi	a5,a5,268 # 8000c6f0 <_ZN5StdIO8iostatusE>
    800075ec:	0007b783          	ld	a5,0(a5)
    800075f0:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    800075f4:	0017f793          	andi	a5,a5,1
    800075f8:	0a078263          	beqz	a5,8000769c <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    800075fc:	00005797          	auipc	a5,0x5
    80007600:	0ec78793          	addi	a5,a5,236 # 8000c6e8 <_ZN5StdIO5idataE>
    80007604:	0007b783          	ld	a5,0(a5)
    80007608:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    8000760c:	00a00513          	li	a0,10
    80007610:	ffffa097          	auipc	ra,0xffffa
    80007614:	27c080e7          	jalr	636(ra) # 8000188c <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80007618:	00005797          	auipc	a5,0x5
    8000761c:	0c078793          	addi	a5,a5,192 # 8000c6d8 <_ZN5StdIO7ibufferE>
    80007620:	0007b483          	ld	s1,0(a5)
    80007624:	4804a703          	lw	a4,1152(s1)
    80007628:	3ff00793          	li	a5,1023
    8000762c:	0ce7ce63          	blt	a5,a4,80007708 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80007630:	45048513          	addi	a0,s1,1104
    80007634:	fffff097          	auipc	ra,0xfffff
    80007638:	e68080e7          	jalr	-408(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000763c:	40048993          	addi	s3,s1,1024
    80007640:	00098513          	mv	a0,s3
    80007644:	fffff097          	auipc	ra,0xfffff
    80007648:	e58080e7          	jalr	-424(ra) # 8000649c <_ZN10KSemaphore4waitEv>
        tmpLen++;
    8000764c:	4804a783          	lw	a5,1152(s1)
    80007650:	0017879b          	addiw	a5,a5,1
    80007654:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    80007658:	47c4a783          	lw	a5,1148(s1)
    8000765c:	00f48733          	add	a4,s1,a5
    80007660:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80007664:	0017879b          	addiw	a5,a5,1
    80007668:	41f7d71b          	sraiw	a4,a5,0x1f
    8000766c:	0167571b          	srliw	a4,a4,0x16
    80007670:	00e787bb          	addw	a5,a5,a4
    80007674:	3ff7f793          	andi	a5,a5,1023
    80007678:	40e787bb          	subw	a5,a5,a4
    8000767c:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    80007680:	42848513          	addi	a0,s1,1064
    80007684:	fffff097          	auipc	ra,0xfffff
    80007688:	e9c080e7          	jalr	-356(ra) # 80006520 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000768c:	00098513          	mv	a0,s3
    80007690:	fffff097          	auipc	ra,0xfffff
    80007694:	e90080e7          	jalr	-368(ra) # 80006520 <_ZN10KSemaphore6signalEv>
    80007698:	0700006f          	j	80007708 <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    8000769c:	00a00513          	li	a0,10
    800076a0:	ffffa097          	auipc	ra,0xffffa
    800076a4:	1ec080e7          	jalr	492(ra) # 8000188c <plic_complete>
            if(out_thread != nullptr)
    800076a8:	00005797          	auipc	a5,0x5
    800076ac:	01878793          	addi	a5,a5,24 # 8000c6c0 <_ZN5StdIO10out_threadE>
    800076b0:	0007b783          	ld	a5,0(a5)
    800076b4:	04078a63          	beqz	a5,80007708 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800076b8:	100027f3          	csrr	a5,sstatus
    800076bc:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800076c0:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800076c4:	141027f3          	csrr	a5,sepc
    800076c8:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800076cc:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    800076d0:	00005797          	auipc	a5,0x5
    800076d4:	ff078793          	addi	a5,a5,-16 # 8000c6c0 <_ZN5StdIO10out_threadE>
    800076d8:	0007b583          	ld	a1,0(a5)
    800076dc:	00005517          	auipc	a0,0x5
    800076e0:	0ac50513          	addi	a0,a0,172 # 8000c788 <_ZN9Scheduler5queueE>
    800076e4:	00000097          	auipc	ra,0x0
    800076e8:	8c4080e7          	jalr	-1852(ra) # 80006fa8 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    800076ec:	00000097          	auipc	ra,0x0
    800076f0:	4d8080e7          	jalr	1240(ra) # 80007bc4 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800076f4:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800076f8:	14149073          	csrw	sepc,s1
    800076fc:	00c0006f          	j	80007708 <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    80007700:	ffffa097          	auipc	ra,0xffffa
    80007704:	18c080e7          	jalr	396(ra) # 8000188c <plic_complete>
    80007708:	03813083          	ld	ra,56(sp)
    8000770c:	03013403          	ld	s0,48(sp)
    80007710:	02813483          	ld	s1,40(sp)
    80007714:	02013903          	ld	s2,32(sp)
    80007718:	01813983          	ld	s3,24(sp)
    8000771c:	04010113          	addi	sp,sp,64
    80007720:	00008067          	ret

0000000080007724 <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    80007724:	ff010113          	addi	sp,sp,-16
    80007728:	00113423          	sd	ra,8(sp)
    8000772c:	00813023          	sd	s0,0(sp)
    80007730:	01010413          	addi	s0,sp,16
    80007734:	000105b7          	lui	a1,0x10
    80007738:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8000773c:	00100513          	li	a0,1
    80007740:	00000097          	auipc	ra,0x0
    80007744:	b04080e7          	jalr	-1276(ra) # 80007244 <_Z41__static_initialization_and_destruction_0ii>
    80007748:	00813083          	ld	ra,8(sp)
    8000774c:	00013403          	ld	s0,0(sp)
    80007750:	01010113          	addi	sp,sp,16
    80007754:	00008067          	ret

0000000080007758 <_ZN5Riscv10popSppSpieEv>:
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;

void Riscv::popSppSpie() 
{
    80007758:	ff010113          	addi	sp,sp,-16
    8000775c:	00813423          	sd	s0,8(sp)
    80007760:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80007764:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80007768:	10200073          	sret
}
    8000776c:	00813403          	ld	s0,8(sp)
    80007770:	01010113          	addi	sp,sp,16
    80007774:	00008067          	ret

0000000080007778 <_ZN3TCBC1EPFvPvES0_Pmm>:
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80007778:	00053023          	sd	zero,0(a0)
    8000777c:	00053423          	sd	zero,8(a0)
    80007780:	00b53823          	sd	a1,16(a0)
    80007784:	00c53c23          	sd	a2,24(a0)
    80007788:	02d53023          	sd	a3,32(a0)
    8000778c:	02e53423          	sd	a4,40(a0)
    80007790:	00100793          	li	a5,1
    80007794:	02f52823          	sw	a5,48(a0)
    80007798:	02050a23          	sb	zero,52(a0)
    8000779c:	02f50aa3          	sb	a5,53(a0)
    800077a0:	02050b23          	sb	zero,54(a0)
    800077a4:	00000797          	auipc	a5,0x0
    800077a8:	17078793          	addi	a5,a5,368 # 80007914 <_ZN3TCB13threadWrapperEv>
    800077ac:	02f53c23          	sd	a5,56(a0)
    800077b0:	04068a63          	beqz	a3,80007804 <_ZN3TCBC1EPFvPvES0_Pmm+0x8c>
    800077b4:	000017b7          	lui	a5,0x1
    800077b8:	00f687b3          	add	a5,a3,a5
    800077bc:	04f53023          	sd	a5,64(a0)
{    
    if(body && stack){
    800077c0:	04058663          	beqz	a1,8000780c <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
    800077c4:	04068463          	beqz	a3,8000780c <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    800077c8:	ff010113          	addi	sp,sp,-16
    800077cc:	00113423          	sd	ra,8(sp)
    800077d0:	00813023          	sd	s0,0(sp)
    800077d4:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    800077d8:	00000097          	auipc	ra,0x0
    800077dc:	8c8080e7          	jalr	-1848(ra) # 800070a0 <_ZN9Scheduler3putEP3TCB>
        threadsUp++;
    800077e0:	00005717          	auipc	a4,0x5
    800077e4:	f1870713          	addi	a4,a4,-232 # 8000c6f8 <_ZN3TCB9threadsUpE>
    800077e8:	00072783          	lw	a5,0(a4)
    800077ec:	0017879b          	addiw	a5,a5,1
    800077f0:	00f72023          	sw	a5,0(a4)
    }
}   
    800077f4:	00813083          	ld	ra,8(sp)
    800077f8:	00013403          	ld	s0,0(sp)
    800077fc:	01010113          	addi	sp,sp,16
    80007800:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80007804:	00000793          	li	a5,0
    80007808:	fb5ff06f          	j	800077bc <_ZN3TCBC1EPFvPvES0_Pmm+0x44>
    8000780c:	00008067          	ret

0000000080007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80007810:	fd010113          	addi	sp,sp,-48
    80007814:	02113423          	sd	ra,40(sp)
    80007818:	02813023          	sd	s0,32(sp)
    8000781c:	00913c23          	sd	s1,24(sp)
    80007820:	01213823          	sd	s2,16(sp)
    80007824:	01313423          	sd	s3,8(sp)
    80007828:	01413023          	sd	s4,0(sp)
    8000782c:	03010413          	addi	s0,sp,48
    80007830:	00050913          	mv	s2,a0
    80007834:	00058993          	mv	s3,a1
    80007838:	00060a13          	mv	s4,a2
*   THE ALLOCATION FOR THE KERNEL CLASSES 
*   it is easier to keep this lines in the file and just include
*   them in kernel structures
*/

void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    8000783c:	fffff097          	auipc	ra,0xfffff
    80007840:	f4c080e7          	jalr	-180(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80007844:	00200593          	li	a1,2
    80007848:	fffff097          	auipc	ra,0xfffff
    8000784c:	fb4080e7          	jalr	-76(ra) # 800067fc <_ZN15MemoryAllocator9mem_allocEm>
    80007850:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    80007854:	00200713          	li	a4,2
    80007858:	000a0693          	mv	a3,s4
    8000785c:	00098613          	mv	a2,s3
    80007860:	00090593          	mv	a1,s2
    80007864:	00000097          	auipc	ra,0x0
    80007868:	f14080e7          	jalr	-236(ra) # 80007778 <_ZN3TCBC1EPFvPvES0_Pmm>
    8000786c:	0280006f          	j	80007894 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80007870:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80007874:	fffff097          	auipc	ra,0xfffff
    80007878:	f14080e7          	jalr	-236(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    8000787c:	00048593          	mv	a1,s1
    80007880:	fffff097          	auipc	ra,0xfffff
    80007884:	138080e7          	jalr	312(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    80007888:	00090513          	mv	a0,s2
    8000788c:	00006097          	auipc	ra,0x6
    80007890:	00c080e7          	jalr	12(ra) # 8000d898 <_Unwind_Resume>
}
    80007894:	00048513          	mv	a0,s1
    80007898:	02813083          	ld	ra,40(sp)
    8000789c:	02013403          	ld	s0,32(sp)
    800078a0:	01813483          	ld	s1,24(sp)
    800078a4:	01013903          	ld	s2,16(sp)
    800078a8:	00813983          	ld	s3,8(sp)
    800078ac:	00013a03          	ld	s4,0(sp)
    800078b0:	03010113          	addi	sp,sp,48
    800078b4:	00008067          	ret

00000000800078b8 <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    800078b8:	ff010113          	addi	sp,sp,-16
    800078bc:	00813423          	sd	s0,8(sp)
    800078c0:	01010413          	addi	s0,sp,16
    if(running->userMode)
    800078c4:	00005797          	auipc	a5,0x5
    800078c8:	e4c78793          	addi	a5,a5,-436 # 8000c710 <_ZN3TCB7runningE>
    800078cc:	0007b783          	ld	a5,0(a5)
    800078d0:	0357c703          	lbu	a4,53(a5)
    800078d4:	00070c63          	beqz	a4,800078ec <_ZN3TCB9initalizeEv+0x34>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800078d8:	10000793          	li	a5,256
    800078dc:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    800078e0:	00813403          	ld	s0,8(sp)
    800078e4:	01010113          	addi	sp,sp,16
    800078e8:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800078ec:	10000713          	li	a4,256
    800078f0:	10072073          	csrs	sstatus,a4
        if(running->locked)
    800078f4:	0367c783          	lbu	a5,54(a5)
    800078f8:	00078863          	beqz	a5,80007908 <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800078fc:	02000793          	li	a5,32
    80007900:	1007b073          	csrc	sstatus,a5
    80007904:	fddff06f          	j	800078e0 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80007908:	02000793          	li	a5,32
    8000790c:	1007a073          	csrs	sstatus,a5
}
    80007910:	fd1ff06f          	j	800078e0 <_ZN3TCB9initalizeEv+0x28>

0000000080007914 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    80007914:	ff010113          	addi	sp,sp,-16
    80007918:	00113423          	sd	ra,8(sp)
    8000791c:	00813023          	sd	s0,0(sp)
    80007920:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    80007924:	00000097          	auipc	ra,0x0
    80007928:	f94080e7          	jalr	-108(ra) # 800078b8 <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    8000792c:	00000097          	auipc	ra,0x0
    80007930:	e2c080e7          	jalr	-468(ra) # 80007758 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80007934:	00005797          	auipc	a5,0x5
    80007938:	ddc78793          	addi	a5,a5,-548 # 8000c710 <_ZN3TCB7runningE>
    8000793c:	0007b783          	ld	a5,0(a5)
    80007940:	0107b703          	ld	a4,16(a5)
    80007944:	0187b503          	ld	a0,24(a5)
    80007948:	000700e7          	jalr	a4
    thread_exit();
    8000794c:	00000097          	auipc	ra,0x0
    80007950:	7d4080e7          	jalr	2004(ra) # 80008120 <thread_exit>
}
    80007954:	00813083          	ld	ra,8(sp)
    80007958:	00013403          	ld	s0,0(sp)
    8000795c:	01010113          	addi	sp,sp,16
    80007960:	00008067          	ret

0000000080007964 <_ZN3TCB12deleteThreadEPS_>:
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t)
{
    if(t)
    80007964:	08050063          	beqz	a0,800079e4 <_ZN3TCB12deleteThreadEPS_+0x80>
    {
        if(running != t && t->isFinished())
    80007968:	00005797          	auipc	a5,0x5
    8000796c:	da878793          	addi	a5,a5,-600 # 8000c710 <_ZN3TCB7runningE>
    80007970:	0007b783          	ld	a5,0(a5)
    80007974:	00a78863          	beq	a5,a0,80007984 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    80007978:	03052703          	lw	a4,48(a0)
    8000797c:	00200793          	li	a5,2
    80007980:	00f70863          	beq	a4,a5,80007990 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    80007984:	00100793          	li	a5,1
    80007988:	02f50a23          	sb	a5,52(a0)
        }        
    }
}
    8000798c:	00008067          	ret
{
    80007990:	fe010113          	addi	sp,sp,-32
    80007994:	00113c23          	sd	ra,24(sp)
    80007998:	00813823          	sd	s0,16(sp)
    8000799c:	00913423          	sd	s1,8(sp)
    800079a0:	02010413          	addi	s0,sp,32
    800079a4:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    800079a8:	fffff097          	auipc	ra,0xfffff
    800079ac:	de0080e7          	jalr	-544(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    800079b0:	0204b583          	ld	a1,32(s1)
    800079b4:	fffff097          	auipc	ra,0xfffff
    800079b8:	004080e7          	jalr	4(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    800079bc:	fffff097          	auipc	ra,0xfffff
    800079c0:	dcc080e7          	jalr	-564(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    800079c4:	00048593          	mv	a1,s1
    800079c8:	fffff097          	auipc	ra,0xfffff
    800079cc:	ff0080e7          	jalr	-16(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800079d0:	01813083          	ld	ra,24(sp)
    800079d4:	01013403          	ld	s0,16(sp)
    800079d8:	00813483          	ld	s1,8(sp)
    800079dc:	02010113          	addi	sp,sp,32
    800079e0:	00008067          	ret
    800079e4:	00008067          	ret

00000000800079e8 <_ZN3TCB22createMainKernelThreadEv>:
    TCB::yield(); 
}

TCB* TCB::createMainKernelThread()
{
    if(!kernelThread)
    800079e8:	00005797          	auipc	a5,0x5
    800079ec:	d1878793          	addi	a5,a5,-744 # 8000c700 <_ZN3TCB12kernelThreadE>
    800079f0:	0007b783          	ld	a5,0(a5)
    800079f4:	00078e63          	beqz	a5,80007a10 <_ZN3TCB22createMainKernelThreadEv+0x28>
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    800079f8:	00005797          	auipc	a5,0x5
    800079fc:	d0878793          	addi	a5,a5,-760 # 8000c700 <_ZN3TCB12kernelThreadE>
    80007a00:	0007b503          	ld	a0,0(a5)
    80007a04:	00005797          	auipc	a5,0x5
    80007a08:	d0a7b623          	sd	a0,-756(a5) # 8000c710 <_ZN3TCB7runningE>
    return kernelThread;
}
    80007a0c:	00008067          	ret
{
    80007a10:	ff010113          	addi	sp,sp,-16
    80007a14:	00113423          	sd	ra,8(sp)
    80007a18:	00813023          	sd	s0,0(sp)
    80007a1c:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    80007a20:	00000613          	li	a2,0
    80007a24:	00000593          	li	a1,0
    80007a28:	00000513          	li	a0,0
    80007a2c:	00000097          	auipc	ra,0x0
    80007a30:	de4080e7          	jalr	-540(ra) # 80007810 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80007a34:	00005797          	auipc	a5,0x5
    80007a38:	cca7b623          	sd	a0,-820(a5) # 8000c700 <_ZN3TCB12kernelThreadE>
    void setKernelMode() { userMode = false; }
    80007a3c:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80007a40:	00100793          	li	a5,1
    80007a44:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    80007a48:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    80007a4c:	00005797          	auipc	a5,0x5
    80007a50:	cb478793          	addi	a5,a5,-844 # 8000c700 <_ZN3TCB12kernelThreadE>
    80007a54:	0007b503          	ld	a0,0(a5)
    80007a58:	00005797          	auipc	a5,0x5
    80007a5c:	caa7bc23          	sd	a0,-840(a5) # 8000c710 <_ZN3TCB7runningE>
}
    80007a60:	00813083          	ld	ra,8(sp)
    80007a64:	00013403          	ld	s0,0(sp)
    80007a68:	01010113          	addi	sp,sp,16
    80007a6c:	00008067          	ret

0000000080007a70 <_ZN3TCB9endKernelEv>:

int TCB::endKernel()
{
    if(kernelThread)
    80007a70:	00005797          	auipc	a5,0x5
    80007a74:	c9078793          	addi	a5,a5,-880 # 8000c700 <_ZN3TCB12kernelThreadE>
    80007a78:	0007b583          	ld	a1,0(a5)
    80007a7c:	04058463          	beqz	a1,80007ac4 <_ZN3TCB9endKernelEv+0x54>
{
    80007a80:	ff010113          	addi	sp,sp,-16
    80007a84:	00113423          	sd	ra,8(sp)
    80007a88:	00813023          	sd	s0,0(sp)
    80007a8c:	01010413          	addi	s0,sp,16
    80007a90:	00005517          	auipc	a0,0x5
    80007a94:	cf850513          	addi	a0,a0,-776 # 8000c788 <_ZN9Scheduler5queueE>
    80007a98:	fffff097          	auipc	ra,0xfffff
    80007a9c:	510080e7          	jalr	1296(ra) # 80006fa8 <_ZN8TcbQueue11insertFrontEP3TCB>
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
    80007aa0:	00005797          	auipc	a5,0x5
    80007aa4:	c607b023          	sd	zero,-928(a5) # 8000c700 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    80007aa8:	00000097          	auipc	ra,0x0
    80007aac:	024080e7          	jalr	36(ra) # 80007acc <_ZN3TCB8dispatchEv>
    }
    return -1;

    
}
    80007ab0:	fff00513          	li	a0,-1
    80007ab4:	00813083          	ld	ra,8(sp)
    80007ab8:	00013403          	ld	s0,0(sp)
    80007abc:	01010113          	addi	sp,sp,16
    80007ac0:	00008067          	ret
    80007ac4:	fff00513          	li	a0,-1
    80007ac8:	00008067          	ret

0000000080007acc <_ZN3TCB8dispatchEv>:
{
    80007acc:	fe010113          	addi	sp,sp,-32
    80007ad0:	00113c23          	sd	ra,24(sp)
    80007ad4:	00813823          	sd	s0,16(sp)
    80007ad8:	00913423          	sd	s1,8(sp)
    80007adc:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    80007ae0:	00005797          	auipc	a5,0x5
    80007ae4:	c3078793          	addi	a5,a5,-976 # 8000c710 <_ZN3TCB7runningE>
    80007ae8:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80007aec:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80007af0:	00200713          	li	a4,2
    80007af4:	06e78c63          	beq	a5,a4,80007b6c <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80007af8:	00078c63          	beqz	a5,80007b10 <_ZN3TCB8dispatchEv+0x44>
    80007afc:	00300713          	li	a4,3
    80007b00:	00e78863          	beq	a5,a4,80007b10 <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    80007b04:	00048513          	mv	a0,s1
    80007b08:	fffff097          	auipc	ra,0xfffff
    80007b0c:	598080e7          	jalr	1432(ra) # 800070a0 <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80007b10:	00005797          	auipc	a5,0x5
    80007b14:	be878793          	addi	a5,a5,-1048 # 8000c6f8 <_ZN3TCB9threadsUpE>
    80007b18:	0007a703          	lw	a4,0(a5)
    80007b1c:	00200793          	li	a5,2
    80007b20:	00e7cc63          	blt	a5,a4,80007b38 <_ZN3TCB8dispatchEv+0x6c>
    80007b24:	00005797          	auipc	a5,0x5
    80007b28:	bac78793          	addi	a5,a5,-1108 # 8000c6d0 <_ZN5StdIO7obufferE>
    80007b2c:	0007b783          	ld	a5,0(a5)
    80007b30:	4807a783          	lw	a5,1152(a5)
    80007b34:	08078263          	beqz	a5,80007bb8 <_ZN3TCB8dispatchEv+0xec>
    running = Scheduler::get(); 
    80007b38:	fffff097          	auipc	ra,0xfffff
    80007b3c:	538080e7          	jalr	1336(ra) # 80007070 <_ZN9Scheduler3getEv>
    80007b40:	00005797          	auipc	a5,0x5
    80007b44:	bca7b823          	sd	a0,-1072(a5) # 8000c710 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80007b48:	03850593          	addi	a1,a0,56
    80007b4c:	03848513          	addi	a0,s1,56
    80007b50:	ffffc097          	auipc	ra,0xffffc
    80007b54:	6f4080e7          	jalr	1780(ra) # 80004244 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80007b58:	01813083          	ld	ra,24(sp)
    80007b5c:	01013403          	ld	s0,16(sp)
    80007b60:	00813483          	ld	s1,8(sp)
    80007b64:	02010113          	addi	sp,sp,32
    80007b68:	00008067          	ret
        threadsUp--;
    80007b6c:	00005717          	auipc	a4,0x5
    80007b70:	b8c70713          	addi	a4,a4,-1140 # 8000c6f8 <_ZN3TCB9threadsUpE>
    80007b74:	00072783          	lw	a5,0(a4)
    80007b78:	fff7879b          	addiw	a5,a5,-1
    80007b7c:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    80007b80:	0344c783          	lbu	a5,52(s1)
    80007b84:	f80786e3          	beqz	a5,80007b10 <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    80007b88:	f80484e3          	beqz	s1,80007b10 <_ZN3TCB8dispatchEv+0x44>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80007b8c:	fffff097          	auipc	ra,0xfffff
    80007b90:	bfc080e7          	jalr	-1028(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    80007b94:	0204b583          	ld	a1,32(s1)
    80007b98:	fffff097          	auipc	ra,0xfffff
    80007b9c:	e20080e7          	jalr	-480(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    80007ba0:	fffff097          	auipc	ra,0xfffff
    80007ba4:	be8080e7          	jalr	-1048(ra) # 80006788 <_ZN15MemoryAllocator11getInstanceEv>
    80007ba8:	00048593          	mv	a1,s1
    80007bac:	fffff097          	auipc	ra,0xfffff
    80007bb0:	e0c080e7          	jalr	-500(ra) # 800069b8 <_ZN15MemoryAllocator8mem_freeEPv>
    80007bb4:	f5dff06f          	j	80007b10 <_ZN3TCB8dispatchEv+0x44>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80007bb8:	00000097          	auipc	ra,0x0
    80007bbc:	eb8080e7          	jalr	-328(ra) # 80007a70 <_ZN3TCB9endKernelEv>
    80007bc0:	f79ff06f          	j	80007b38 <_ZN3TCB8dispatchEv+0x6c>

0000000080007bc4 <_ZN3TCB5yieldEv>:
{
    80007bc4:	ff010113          	addi	sp,sp,-16
    80007bc8:	00113423          	sd	ra,8(sp)
    80007bcc:	00813023          	sd	s0,0(sp)
    80007bd0:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80007bd4:	ffffc097          	auipc	ra,0xffffc
    80007bd8:	578080e7          	jalr	1400(ra) # 8000414c <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80007bdc:	00000097          	auipc	ra,0x0
    80007be0:	ef0080e7          	jalr	-272(ra) # 80007acc <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80007be4:	ffffc097          	auipc	ra,0xffffc
    80007be8:	5e4080e7          	jalr	1508(ra) # 800041c8 <_ZN5Riscv12popRegistersEv>
}
    80007bec:	00813083          	ld	ra,8(sp)
    80007bf0:	00013403          	ld	s0,0(sp)
    80007bf4:	01010113          	addi	sp,sp,16
    80007bf8:	00008067          	ret

0000000080007bfc <_ZN3TCB5sleepEm>:
{
    80007bfc:	ff010113          	addi	sp,sp,-16
    80007c00:	00113423          	sd	ra,8(sp)
    80007c04:	00813023          	sd	s0,0(sp)
    80007c08:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80007c0c:	00005797          	auipc	a5,0x5
    80007c10:	b0478793          	addi	a5,a5,-1276 # 8000c710 <_ZN3TCB7runningE>
    80007c14:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80007c18:	00300713          	li	a4,3
    80007c1c:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80007c20:	00050593          	mv	a1,a0
    80007c24:	00078513          	mv	a0,a5
    80007c28:	fffff097          	auipc	ra,0xfffff
    80007c2c:	50c080e7          	jalr	1292(ra) # 80007134 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80007c30:	00000097          	auipc	ra,0x0
    80007c34:	f94080e7          	jalr	-108(ra) # 80007bc4 <_ZN3TCB5yieldEv>
}
    80007c38:	00813083          	ld	ra,8(sp)
    80007c3c:	00013403          	ld	s0,0(sp)
    80007c40:	01010113          	addi	sp,sp,16
    80007c44:	00008067          	ret

0000000080007c48 <_ZN3TCB15setPanicContextEmm>:

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    80007c48:	ff010113          	addi	sp,sp,-16
    80007c4c:	00813423          	sd	s0,8(sp)
    80007c50:	01010413          	addi	s0,sp,16
    panicContext.ra = ra;
    80007c54:	00005797          	auipc	a5,0x5
    80007c58:	b6478793          	addi	a5,a5,-1180 # 8000c7b8 <_ZN3TCB12panicContextE>
    80007c5c:	00a7b023          	sd	a0,0(a5)
    panicContext.sp = sp;
    80007c60:	00b7b423          	sd	a1,8(a5)
}
    80007c64:	00813403          	ld	s0,8(sp)
    80007c68:	01010113          	addi	sp,sp,16
    80007c6c:	00008067          	ret

0000000080007c70 <_ZN3TCB13panicDispatchEv>:

void TCB::panicDispatch()
{
    80007c70:	ff010113          	addi	sp,sp,-16
    80007c74:	00113423          	sd	ra,8(sp)
    80007c78:	00813023          	sd	s0,0(sp)
    80007c7c:	01010413          	addi	s0,sp,16
    contextSwitch(&running->context, &panicContext);
    80007c80:	00005797          	auipc	a5,0x5
    80007c84:	a9078793          	addi	a5,a5,-1392 # 8000c710 <_ZN3TCB7runningE>
    80007c88:	0007b503          	ld	a0,0(a5)
    80007c8c:	00005597          	auipc	a1,0x5
    80007c90:	b2c58593          	addi	a1,a1,-1236 # 8000c7b8 <_ZN3TCB12panicContextE>
    80007c94:	03850513          	addi	a0,a0,56
    80007c98:	ffffc097          	auipc	ra,0xffffc
    80007c9c:	5ac080e7          	jalr	1452(ra) # 80004244 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    80007ca0:	00813083          	ld	ra,8(sp)
    80007ca4:	00013403          	ld	s0,0(sp)
    80007ca8:	01010113          	addi	sp,sp,16
    80007cac:	00008067          	ret

0000000080007cb0 <_ZN13TreeLikeBuddyC1EPvm>:
#include"../../h/kernel_lib.h"
#include"../../h/tree_like_buddy.h"
TreeLikeBuddy* TreeLikeBuddy::buddy = nullptr;
uchar TreeLikeBuddy::BLOCK_SIZE_BIT_LEN = 0;
TreeLikeBuddy::TreeLikeBuddy(void* saddr, size_t sz){
    80007cb0:	fd010113          	addi	sp,sp,-48
    80007cb4:	02113423          	sd	ra,40(sp)
    80007cb8:	02813023          	sd	s0,32(sp)
    80007cbc:	00913c23          	sd	s1,24(sp)
    80007cc0:	01213823          	sd	s2,16(sp)
    80007cc4:	01313423          	sd	s3,8(sp)
    80007cc8:	01413023          	sd	s4,0(sp)
    80007ccc:	03010413          	addi	s0,sp,48
    80007cd0:	00050493          	mv	s1,a0
    /* --------Memory Meta Init-------- */
    mmeta_num = log2(sz) + 1;
    80007cd4:	00060513          	mv	a0,a2
    80007cd8:	ffffe097          	auipc	ra,0xffffe
    80007cdc:	38c080e7          	jalr	908(ra) # 80006064 <_Z4log2m>
    80007ce0:	0015051b          	addiw	a0,a0,1
    80007ce4:	0ff57513          	andi	a0,a0,255
    80007ce8:	02a48023          	sb	a0,32(s1)
    mmeta_s = (uint64*)NoAlloc::mem_alloc(mmeta_num * sizeof(uint64));
    80007cec:	00351513          	slli	a0,a0,0x3
    80007cf0:	fffff097          	auipc	ra,0xfffff
    80007cf4:	f20080e7          	jalr	-224(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    80007cf8:	00a4bc23          	sd	a0,24(s1)
    if(!mmeta_s) { /* TODO: panic */ }
    mmeta = (alloc_t**) NoAlloc::mem_alloc(mmeta_num * sizeof(alloc_t*));
    80007cfc:	0204c503          	lbu	a0,32(s1)
    80007d00:	00351513          	slli	a0,a0,0x3
    80007d04:	fffff097          	auipc	ra,0xfffff
    80007d08:	f0c080e7          	jalr	-244(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    80007d0c:	00a4b823          	sd	a0,16(s1)
    if(!mmeta) { /* TODO: panic */ }
    for(uchar i = 0; i < mmeta_num; i++){
    80007d10:	00000993          	li	s3,0
    80007d14:	00c0006f          	j	80007d20 <_ZN13TreeLikeBuddyC1EPvm+0x70>
    80007d18:	0019899b          	addiw	s3,s3,1
    80007d1c:	0ff9f993          	andi	s3,s3,255
    80007d20:	0204c783          	lbu	a5,32(s1)
    80007d24:	06f9fa63          	bgeu	s3,a5,80007d98 <_ZN13TreeLikeBuddyC1EPvm+0xe8>
        mmeta_s[i] = 1ULL << (mmeta_num - i - 1);
    80007d28:	413787bb          	subw	a5,a5,s3
    80007d2c:	fff7879b          	addiw	a5,a5,-1
    80007d30:	0184b703          	ld	a4,24(s1)
    80007d34:	00399913          	slli	s2,s3,0x3
    80007d38:	01270733          	add	a4,a4,s2
    80007d3c:	00100693          	li	a3,1
    80007d40:	00f697b3          	sll	a5,a3,a5
    80007d44:	00f73023          	sd	a5,0(a4)
        mmeta[i] = (alloc_t*) NoAlloc::mem_alloc(mmeta_s[i] * sizeof(alloc_t));
    80007d48:	0184b783          	ld	a5,24(s1)
    80007d4c:	012787b3          	add	a5,a5,s2
    80007d50:	0104ba03          	ld	s4,16(s1)
    80007d54:	012a0a33          	add	s4,s4,s2
    80007d58:	0007b503          	ld	a0,0(a5)
    80007d5c:	fffff097          	auipc	ra,0xfffff
    80007d60:	eb4080e7          	jalr	-332(ra) # 80006c10 <_ZN7NoAlloc9mem_allocEm>
    80007d64:	00aa3023          	sd	a0,0(s4)
        if(!mmeta[i]) { /* TODO: panic */ }
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    80007d68:	00000713          	li	a4,0
    80007d6c:	0184b783          	ld	a5,24(s1)
    80007d70:	012787b3          	add	a5,a5,s2
    80007d74:	0007b783          	ld	a5,0(a5)
    80007d78:	faf770e3          	bgeu	a4,a5,80007d18 <_ZN13TreeLikeBuddyC1EPvm+0x68>
            mmeta[i][j] = alloc_t::ALLOC; 
    80007d7c:	0104b783          	ld	a5,16(s1)
    80007d80:	012787b3          	add	a5,a5,s2
    80007d84:	0007b783          	ld	a5,0(a5)
    80007d88:	00e787b3          	add	a5,a5,a4
    80007d8c:	00078023          	sb	zero,0(a5)
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    80007d90:	00170713          	addi	a4,a4,1
    80007d94:	fd9ff06f          	j	80007d6c <_ZN13TreeLikeBuddyC1EPvm+0xbc>
    }
    mmeta[mmeta_num - 1][0] = alloc_t::FREE;
    80007d98:	0104b703          	ld	a4,16(s1)
    80007d9c:	00379793          	slli	a5,a5,0x3
    80007da0:	ff878793          	addi	a5,a5,-8
    80007da4:	00f707b3          	add	a5,a4,a5
    80007da8:	0007b783          	ld	a5,0(a5)
    80007dac:	00100713          	li	a4,1
    80007db0:	00e78023          	sb	a4,0(a5)
}
    80007db4:	02813083          	ld	ra,40(sp)
    80007db8:	02013403          	ld	s0,32(sp)
    80007dbc:	01813483          	ld	s1,24(sp)
    80007dc0:	01013903          	ld	s2,16(sp)
    80007dc4:	00813983          	ld	s3,8(sp)
    80007dc8:	00013a03          	ld	s4,0(sp)
    80007dcc:	03010113          	addi	sp,sp,48
    80007dd0:	00008067          	ret

0000000080007dd4 <_ZN13TreeLikeBuddy12status_printEv>:

void TreeLikeBuddy::status_print(){
    80007dd4:	fe010113          	addi	sp,sp,-32
    80007dd8:	00113c23          	sd	ra,24(sp)
    80007ddc:	00813823          	sd	s0,16(sp)
    80007de0:	00913423          	sd	s1,8(sp)
    80007de4:	02010413          	addi	s0,sp,32
    if(!buddy){
    80007de8:	00005797          	auipc	a5,0x5
    80007dec:	93878793          	addi	a5,a5,-1736 # 8000c720 <_ZN13TreeLikeBuddy5buddyE>
    80007df0:	0007b783          	ld	a5,0(a5)
    80007df4:	10078063          	beqz	a5,80007ef4 <_ZN13TreeLikeBuddy12status_printEv+0x120>
    80007df8:	00050493          	mv	s1,a0
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    80007dfc:	00002517          	auipc	a0,0x2
    80007e00:	2c450513          	addi	a0,a0,708 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80007e04:	ffffe097          	auipc	ra,0xffffe
    80007e08:	b3c080e7          	jalr	-1220(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    80007e0c:	00002517          	auipc	a0,0x2
    80007e10:	2d450513          	addi	a0,a0,724 # 8000a0e0 <CONSOLE_STATUS+0xd0>
    80007e14:	ffffe097          	auipc	ra,0xffffe
    80007e18:	b2c080e7          	jalr	-1236(ra) # 80005940 <_Z12kprintStringPKc>
    80007e1c:	00000613          	li	a2,0
    80007e20:	01000593          	li	a1,16
    80007e24:	00005797          	auipc	a5,0x5
    80007e28:	8fc78793          	addi	a5,a5,-1796 # 8000c720 <_ZN13TreeLikeBuddy5buddyE>
    80007e2c:	0007b503          	ld	a0,0(a5)
    80007e30:	ffffe097          	auipc	ra,0xffffe
    80007e34:	b58080e7          	jalr	-1192(ra) # 80005988 <_Z9kprintIntmib>
    80007e38:	00002517          	auipc	a0,0x2
    80007e3c:	69050513          	addi	a0,a0,1680 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007e40:	ffffe097          	auipc	ra,0xffffe
    80007e44:	b00080e7          	jalr	-1280(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    80007e48:	00002517          	auipc	a0,0x2
    80007e4c:	2a050513          	addi	a0,a0,672 # 8000a0e8 <CONSOLE_STATUS+0xd8>
    80007e50:	ffffe097          	auipc	ra,0xffffe
    80007e54:	af0080e7          	jalr	-1296(ra) # 80005940 <_Z12kprintStringPKc>
    80007e58:	00000613          	li	a2,0
    80007e5c:	01000593          	li	a1,16
    80007e60:	0004b503          	ld	a0,0(s1)
    80007e64:	ffffe097          	auipc	ra,0xffffe
    80007e68:	b24080e7          	jalr	-1244(ra) # 80005988 <_Z9kprintIntmib>
    80007e6c:	00002517          	auipc	a0,0x2
    80007e70:	65c50513          	addi	a0,a0,1628 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007e74:	ffffe097          	auipc	ra,0xffffe
    80007e78:	acc080e7          	jalr	-1332(ra) # 80005940 <_Z12kprintStringPKc>
    KCHECKPRINT(size);
    80007e7c:	00002517          	auipc	a0,0x2
    80007e80:	27c50513          	addi	a0,a0,636 # 8000a0f8 <CONSOLE_STATUS+0xe8>
    80007e84:	ffffe097          	auipc	ra,0xffffe
    80007e88:	abc080e7          	jalr	-1348(ra) # 80005940 <_Z12kprintStringPKc>
    80007e8c:	00000613          	li	a2,0
    80007e90:	01000593          	li	a1,16
    80007e94:	0084b503          	ld	a0,8(s1)
    80007e98:	ffffe097          	auipc	ra,0xffffe
    80007e9c:	af0080e7          	jalr	-1296(ra) # 80005988 <_Z9kprintIntmib>
    80007ea0:	00002517          	auipc	a0,0x2
    80007ea4:	62850513          	addi	a0,a0,1576 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007ea8:	ffffe097          	auipc	ra,0xffffe
    80007eac:	a98080e7          	jalr	-1384(ra) # 80005940 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    80007eb0:	00002517          	auipc	a0,0x2
    80007eb4:	25050513          	addi	a0,a0,592 # 8000a100 <CONSOLE_STATUS+0xf0>
    80007eb8:	ffffe097          	auipc	ra,0xffffe
    80007ebc:	a88080e7          	jalr	-1400(ra) # 80005940 <_Z12kprintStringPKc>
    /**/
    kprintString("\t----END MEMORY META----\n");
    80007ec0:	00002517          	auipc	a0,0x2
    80007ec4:	27850513          	addi	a0,a0,632 # 8000a138 <CONSOLE_STATUS+0x128>
    80007ec8:	ffffe097          	auipc	ra,0xffffe
    80007ecc:	a78080e7          	jalr	-1416(ra) # 80005940 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    80007ed0:	00002517          	auipc	a0,0x2
    80007ed4:	28850513          	addi	a0,a0,648 # 8000a158 <CONSOLE_STATUS+0x148>
    80007ed8:	ffffe097          	auipc	ra,0xffffe
    80007edc:	a68080e7          	jalr	-1432(ra) # 80005940 <_Z12kprintStringPKc>

    80007ee0:	01813083          	ld	ra,24(sp)
    80007ee4:	01013403          	ld	s0,16(sp)
    80007ee8:	00813483          	ld	s1,8(sp)
    80007eec:	02010113          	addi	sp,sp,32
    80007ef0:	00008067          	ret
        kprintString("BUDDY NOT INITALIZED!!!");
    80007ef4:	00002517          	auipc	a0,0x2
    80007ef8:	1b450513          	addi	a0,a0,436 # 8000a0a8 <CONSOLE_STATUS+0x98>
    80007efc:	ffffe097          	auipc	ra,0xffffe
    80007f00:	a44080e7          	jalr	-1468(ra) # 80005940 <_Z12kprintStringPKc>
        return;
    80007f04:	fddff06f          	j	80007ee0 <_ZN13TreeLikeBuddy12status_printEv+0x10c>

0000000080007f08 <_kernel_text_end>:
	...

0000000080008000 <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.h"
#include"../../h/_semaphore.h"

extern "C" void* mem_alloc(size_t size)
{
    80008000:	ff010113          	addi	sp,sp,-16
    80008004:	00813423          	sd	s0,8(sp)
    80008008:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    8000800c:	fff50513          	addi	a0,a0,-1
    80008010:	00655513          	srli	a0,a0,0x6
    80008014:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80008018:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    8000801c:	00100793          	li	a5,1
    80008020:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80008024:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80008028:	00050513          	mv	a0,a0
    
    return adr;  
}
    8000802c:	00813403          	ld	s0,8(sp)
    80008030:	01010113          	addi	sp,sp,16
    80008034:	00008067          	ret

0000000080008038 <mem_free>:

extern "C" int mem_free (void* adr)
{
    80008038:	ff010113          	addi	sp,sp,-16
    8000803c:	00813423          	sd	s0,8(sp)
    80008040:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80008044:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80008048:	00200793          	li	a5,2
    8000804c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80008050:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80008054:	00050513          	mv	a0,a0
    
    return ret;
}
    80008058:	0005051b          	sext.w	a0,a0
    8000805c:	00813403          	ld	s0,8(sp)
    80008060:	01010113          	addi	sp,sp,16
    80008064:	00008067          	ret

0000000080008068 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    80008068:	ff010113          	addi	sp,sp,-16
    8000806c:	00813423          	sd	s0,8(sp)
    80008070:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80008074:	01300793          	li	a5,19
    80008078:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000807c:	00000073          	ecall
}
    80008080:	00813403          	ld	s0,8(sp)
    80008084:	01010113          	addi	sp,sp,16
    80008088:	00008067          	ret

000000008000808c <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    8000808c:	06050e63          	beqz	a0,80008108 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    80008090:	08058063          	beqz	a1,80008110 <thread_create+0x84>
{
    80008094:	fd010113          	addi	sp,sp,-48
    80008098:	02113423          	sd	ra,40(sp)
    8000809c:	02813023          	sd	s0,32(sp)
    800080a0:	00913c23          	sd	s1,24(sp)
    800080a4:	01213823          	sd	s2,16(sp)
    800080a8:	01313423          	sd	s3,8(sp)
    800080ac:	03010413          	addi	s0,sp,48
    800080b0:	00060993          	mv	s3,a2
    800080b4:	00058913          	mv	s2,a1
    800080b8:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800080bc:	00001537          	lui	a0,0x1
    800080c0:	00000097          	auipc	ra,0x0
    800080c4:	f40080e7          	jalr	-192(ra) # 80008000 <mem_alloc>
    if(stack_space == nullptr) return -3;
    800080c8:	04050863          	beqz	a0,80008118 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    800080cc:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    800080d0:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    800080d4:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    800080d8:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    800080dc:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    800080e0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800080e4:	00050513          	mv	a0,a0
    800080e8:	0005051b          	sext.w	a0,a0
    return ret;
}
    800080ec:	02813083          	ld	ra,40(sp)
    800080f0:	02013403          	ld	s0,32(sp)
    800080f4:	01813483          	ld	s1,24(sp)
    800080f8:	01013903          	ld	s2,16(sp)
    800080fc:	00813983          	ld	s3,8(sp)
    80008100:	03010113          	addi	sp,sp,48
    80008104:	00008067          	ret
    if(handle == nullptr) return -1;
    80008108:	fff00513          	li	a0,-1
    8000810c:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80008110:	ffe00513          	li	a0,-2
}
    80008114:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80008118:	ffd00513          	li	a0,-3
    8000811c:	fd1ff06f          	j	800080ec <thread_create+0x60>

0000000080008120 <thread_exit>:

extern "C" int thread_exit()
{
    80008120:	ff010113          	addi	sp,sp,-16
    80008124:	00813423          	sd	s0,8(sp)
    80008128:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    8000812c:	01200513          	li	a0,18
    asm volatile("ecall");
    80008130:	00000073          	ecall

    return ret;
}
    80008134:	00000513          	li	a0,0
    80008138:	00813403          	ld	s0,8(sp)
    8000813c:	01010113          	addi	sp,sp,16
    80008140:	00008067          	ret

0000000080008144 <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    80008144:	ff010113          	addi	sp,sp,-16
    80008148:	00813423          	sd	s0,8(sp)
    8000814c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    80008150:	02050463          	beqz	a0,80008178 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    80008154:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    80008158:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    8000815c:	02100513          	li	a0,33
    asm volatile("ecall");
    80008160:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80008164:	00050513          	mv	a0,a0
    80008168:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000816c:	00813403          	ld	s0,8(sp)
    80008170:	01010113          	addi	sp,sp,16
    80008174:	00008067          	ret
    if(handle == nullptr) return -1;
    80008178:	fff00513          	li	a0,-1
    8000817c:	ff1ff06f          	j	8000816c <sem_open+0x28>

0000000080008180 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    80008180:	ff010113          	addi	sp,sp,-16
    80008184:	00813423          	sd	s0,8(sp)
    80008188:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000818c:	02050263          	beqz	a0,800081b0 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    80008190:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    80008194:	02200513          	li	a0,34
    asm volatile("ecall");
    80008198:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000819c:	00050513          	mv	a0,a0
    800081a0:	0005051b          	sext.w	a0,a0
    return ret;
}
    800081a4:	00813403          	ld	s0,8(sp)
    800081a8:	01010113          	addi	sp,sp,16
    800081ac:	00008067          	ret
    if(handle == nullptr) return -1;
    800081b0:	fff00513          	li	a0,-1
    800081b4:	ff1ff06f          	j	800081a4 <sem_close+0x24>

00000000800081b8 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    800081b8:	ff010113          	addi	sp,sp,-16
    800081bc:	00813423          	sd	s0,8(sp)
    800081c0:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800081c4:	02050263          	beqz	a0,800081e8 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    800081c8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    800081cc:	02300513          	li	a0,35
    asm volatile("ecall");
    800081d0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800081d4:	00050513          	mv	a0,a0
    800081d8:	0005051b          	sext.w	a0,a0
    return ret;
}
    800081dc:	00813403          	ld	s0,8(sp)
    800081e0:	01010113          	addi	sp,sp,16
    800081e4:	00008067          	ret
    if(id == nullptr) return -1;
    800081e8:	fff00513          	li	a0,-1
    800081ec:	ff1ff06f          	j	800081dc <sem_wait+0x24>

00000000800081f0 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    800081f0:	ff010113          	addi	sp,sp,-16
    800081f4:	00813423          	sd	s0,8(sp)
    800081f8:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800081fc:	02050263          	beqz	a0,80008220 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80008200:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    80008204:	02400513          	li	a0,36
    asm volatile("ecall");
    80008208:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000820c:	00050513          	mv	a0,a0
    80008210:	0005051b          	sext.w	a0,a0
    return ret;
}
    80008214:	00813403          	ld	s0,8(sp)
    80008218:	01010113          	addi	sp,sp,16
    8000821c:	00008067          	ret
    if(id == nullptr) return -1;
    80008220:	fff00513          	li	a0,-1
    80008224:	ff1ff06f          	j	80008214 <sem_signal+0x24>

0000000080008228 <time_sleep>:

extern "C" int time_sleep(time_t time){
    80008228:	ff010113          	addi	sp,sp,-16
    8000822c:	00813423          	sd	s0,8(sp)
    80008230:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    80008234:	02050263          	beqz	a0,80008258 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    80008238:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    8000823c:	03100513          	li	a0,49
    asm volatile("ecall");
    80008240:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80008244:	00050513          	mv	a0,a0
    80008248:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000824c:	00813403          	ld	s0,8(sp)
    80008250:	01010113          	addi	sp,sp,16
    80008254:	00008067          	ret
    if(time == 0) return -1;
    80008258:	fff00513          	li	a0,-1
    8000825c:	ff1ff06f          	j	8000824c <time_sleep+0x24>

0000000080008260 <getc>:

const int EOF = -1;
extern "C" char getc(){
    80008260:	ff010113          	addi	sp,sp,-16
    80008264:	00813423          	sd	s0,8(sp)
    80008268:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    8000826c:	04100513          	li	a0,65
    asm volatile("ecall");
    80008270:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80008274:	00050513          	mv	a0,a0
    80008278:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    8000827c:	0ff00793          	li	a5,255
    80008280:	00a7ea63          	bltu	a5,a0,80008294 <getc+0x34>
    80008284:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    80008288:	00813403          	ld	s0,8(sp)
    8000828c:	01010113          	addi	sp,sp,16
    80008290:	00008067          	ret
    else return EOF;
    80008294:	0ff00513          	li	a0,255
    80008298:	ff1ff06f          	j	80008288 <getc+0x28>

000000008000829c <putc>:

extern "C" void putc(char c){
    8000829c:	ff010113          	addi	sp,sp,-16
    800082a0:	00813423          	sd	s0,8(sp)
    800082a4:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    800082a8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    800082ac:	04200513          	li	a0,66
    asm volatile("ecall");
    800082b0:	00000073          	ecall
    800082b4:	00813403          	ld	s0,8(sp)
    800082b8:	01010113          	addi	sp,sp,16
    800082bc:	00008067          	ret

00000000800082c0 <_ZN6Thread10runWrapperEPv>:
        thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    800082c0:	ff010113          	addi	sp,sp,-16
    800082c4:	00113423          	sd	ra,8(sp)
    800082c8:	00813023          	sd	s0,0(sp)
    800082cc:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    800082d0:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    800082d4:	0107b783          	ld	a5,16(a5)
    800082d8:	000780e7          	jalr	a5
}
    800082dc:	00813083          	ld	ra,8(sp)
    800082e0:	00013403          	ld	s0,0(sp)
    800082e4:	01010113          	addi	sp,sp,16
    800082e8:	00008067          	ret

00000000800082ec <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    800082ec:	fe010113          	addi	sp,sp,-32
    800082f0:	00113c23          	sd	ra,24(sp)
    800082f4:	00813823          	sd	s0,16(sp)
    800082f8:	00913423          	sd	s1,8(sp)
    800082fc:	02010413          	addi	s0,sp,32
    80008300:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    80008304:	02050263          	beqz	a0,80008328 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    80008308:	0004b503          	ld	a0,0(s1)
    8000830c:	00053783          	ld	a5,0(a0)
    80008310:	0187b783          	ld	a5,24(a5)
    80008314:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80008318:	0084b503          	ld	a0,8(s1)
    8000831c:	00000097          	auipc	ra,0x0
    80008320:	f0c080e7          	jalr	-244(ra) # 80008228 <time_sleep>
    80008324:	fe5ff06f          	j	80008308 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    80008328:	01813083          	ld	ra,24(sp)
    8000832c:	01013403          	ld	s0,16(sp)
    80008330:	00813483          	ld	s1,8(sp)
    80008334:	02010113          	addi	sp,sp,32
    80008338:	00008067          	ret

000000008000833c <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    8000833c:	ff010113          	addi	sp,sp,-16
    80008340:	00113423          	sd	ra,8(sp)
    80008344:	00813023          	sd	s0,0(sp)
    80008348:	01010413          	addi	s0,sp,16
    8000834c:	00000097          	auipc	ra,0x0
    80008350:	cb4080e7          	jalr	-844(ra) # 80008000 <mem_alloc>
    80008354:	00813083          	ld	ra,8(sp)
    80008358:	00013403          	ld	s0,0(sp)
    8000835c:	01010113          	addi	sp,sp,16
    80008360:	00008067          	ret

0000000080008364 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    80008364:	ff010113          	addi	sp,sp,-16
    80008368:	00113423          	sd	ra,8(sp)
    8000836c:	00813023          	sd	s0,0(sp)
    80008370:	01010413          	addi	s0,sp,16
    80008374:	00000097          	auipc	ra,0x0
    80008378:	cc4080e7          	jalr	-828(ra) # 80008038 <mem_free>
    8000837c:	00813083          	ld	ra,8(sp)
    80008380:	00013403          	ld	s0,0(sp)
    80008384:	01010113          	addi	sp,sp,16
    80008388:	00008067          	ret

000000008000838c <_ZN6ThreadD1Ev>:
Thread::~Thread()
    8000838c:	ff010113          	addi	sp,sp,-16
    80008390:	00113423          	sd	ra,8(sp)
    80008394:	00813023          	sd	s0,0(sp)
    80008398:	01010413          	addi	s0,sp,16
    8000839c:	00002797          	auipc	a5,0x2
    800083a0:	21c78793          	addi	a5,a5,540 # 8000a5b8 <_ZTV6Thread+0x10>
    800083a4:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    800083a8:	00853503          	ld	a0,8(a0)
    delete w->handle;
    800083ac:	00053783          	ld	a5,0(a0)
*/

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    800083b0:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800083b4:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800083b8:	00000073          	ecall
    delete w;
    800083bc:	00000097          	auipc	ra,0x0
    800083c0:	fa8080e7          	jalr	-88(ra) # 80008364 <_ZdlPv>
}
    800083c4:	00813083          	ld	ra,8(sp)
    800083c8:	00013403          	ld	s0,0(sp)
    800083cc:	01010113          	addi	sp,sp,16
    800083d0:	00008067          	ret

00000000800083d4 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    800083d4:	fe010113          	addi	sp,sp,-32
    800083d8:	00113c23          	sd	ra,24(sp)
    800083dc:	00813823          	sd	s0,16(sp)
    800083e0:	00913423          	sd	s1,8(sp)
    800083e4:	02010413          	addi	s0,sp,32
    800083e8:	00050493          	mv	s1,a0
}
    800083ec:	00000097          	auipc	ra,0x0
    800083f0:	fa0080e7          	jalr	-96(ra) # 8000838c <_ZN6ThreadD1Ev>
    800083f4:	00048513          	mv	a0,s1
    800083f8:	00000097          	auipc	ra,0x0
    800083fc:	f6c080e7          	jalr	-148(ra) # 80008364 <_ZdlPv>
    80008400:	01813083          	ld	ra,24(sp)
    80008404:	01013403          	ld	s0,16(sp)
    80008408:	00813483          	ld	s1,8(sp)
    8000840c:	02010113          	addi	sp,sp,32
    80008410:	00008067          	ret

0000000080008414 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    80008414:	ff010113          	addi	sp,sp,-16
    80008418:	00113423          	sd	ra,8(sp)
    8000841c:	00813023          	sd	s0,0(sp)
    80008420:	01010413          	addi	s0,sp,16
    80008424:	00000097          	auipc	ra,0x0
    80008428:	bdc080e7          	jalr	-1060(ra) # 80008000 <mem_alloc>
    8000842c:	00813083          	ld	ra,8(sp)
    80008430:	00013403          	ld	s0,0(sp)
    80008434:	01010113          	addi	sp,sp,16
    80008438:	00008067          	ret

000000008000843c <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    8000843c:	ff010113          	addi	sp,sp,-16
    80008440:	00113423          	sd	ra,8(sp)
    80008444:	00813023          	sd	s0,0(sp)
    80008448:	01010413          	addi	s0,sp,16
    8000844c:	00000097          	auipc	ra,0x0
    80008450:	bec080e7          	jalr	-1044(ra) # 80008038 <mem_free>
    80008454:	00813083          	ld	ra,8(sp)
    80008458:	00013403          	ld	s0,0(sp)
    8000845c:	01010113          	addi	sp,sp,16
    80008460:	00008067          	ret

0000000080008464 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    80008464:	fd010113          	addi	sp,sp,-48
    80008468:	02113423          	sd	ra,40(sp)
    8000846c:	02813023          	sd	s0,32(sp)
    80008470:	00913c23          	sd	s1,24(sp)
    80008474:	01213823          	sd	s2,16(sp)
    80008478:	01313423          	sd	s3,8(sp)
    8000847c:	03010413          	addi	s0,sp,48
    80008480:	00050493          	mv	s1,a0
    80008484:	00058993          	mv	s3,a1
    80008488:	00060913          	mv	s2,a2
    8000848c:	00002797          	auipc	a5,0x2
    80008490:	12c78793          	addi	a5,a5,300 # 8000a5b8 <_ZTV6Thread+0x10>
    80008494:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    80008498:	01800513          	li	a0,24
    8000849c:	00000097          	auipc	ra,0x0
    800084a0:	ea0080e7          	jalr	-352(ra) # 8000833c <_Znwm>
    800084a4:	00053023          	sd	zero,0(a0)
    800084a8:	01353423          	sd	s3,8(a0)
    800084ac:	01253823          	sd	s2,16(a0)
    800084b0:	00a4b423          	sd	a0,8(s1)
}
    800084b4:	02813083          	ld	ra,40(sp)
    800084b8:	02013403          	ld	s0,32(sp)
    800084bc:	01813483          	ld	s1,24(sp)
    800084c0:	01013903          	ld	s2,16(sp)
    800084c4:	00813983          	ld	s3,8(sp)
    800084c8:	03010113          	addi	sp,sp,48
    800084cc:	00008067          	ret

00000000800084d0 <_ZN6Thread5startEv>:
void Thread::start(){
    800084d0:	fe010113          	addi	sp,sp,-32
    800084d4:	00113c23          	sd	ra,24(sp)
    800084d8:	00813823          	sd	s0,16(sp)
    800084dc:	00913423          	sd	s1,8(sp)
    800084e0:	02010413          	addi	s0,sp,32
    800084e4:	00050493          	mv	s1,a0
    if(myHandle)
    800084e8:	00853503          	ld	a0,8(a0)
    800084ec:	02050463          	beqz	a0,80008514 <_ZN6Thread5startEv+0x44>
        thread_create(&w->handle, w->body, w->arg);    
    800084f0:	01053603          	ld	a2,16(a0)
    800084f4:	00853583          	ld	a1,8(a0)
    800084f8:	00000097          	auipc	ra,0x0
    800084fc:	b94080e7          	jalr	-1132(ra) # 8000808c <thread_create>
}
    80008500:	01813083          	ld	ra,24(sp)
    80008504:	01013403          	ld	s0,16(sp)
    80008508:	00813483          	ld	s1,8(sp)
    8000850c:	02010113          	addi	sp,sp,32
    80008510:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    80008514:	01800513          	li	a0,24
    80008518:	00000097          	auipc	ra,0x0
    8000851c:	e24080e7          	jalr	-476(ra) # 8000833c <_Znwm>
    80008520:	00053023          	sd	zero,0(a0)
    80008524:	00053423          	sd	zero,8(a0)
    80008528:	00053823          	sd	zero,16(a0)
        myHandle = (thread_t)w;
    8000852c:	00a4b423          	sd	a0,8(s1)
        thread_create(&w->handle, &runWrapper, this);   
    80008530:	00048613          	mv	a2,s1
    80008534:	00000597          	auipc	a1,0x0
    80008538:	d8c58593          	addi	a1,a1,-628 # 800082c0 <_ZN6Thread10runWrapperEPv>
    8000853c:	00000097          	auipc	ra,0x0
    80008540:	b50080e7          	jalr	-1200(ra) # 8000808c <thread_create>
}
    80008544:	fbdff06f          	j	80008500 <_ZN6Thread5startEv+0x30>

0000000080008548 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    80008548:	fe010113          	addi	sp,sp,-32
    8000854c:	00113c23          	sd	ra,24(sp)
    80008550:	00813823          	sd	s0,16(sp)
    80008554:	00913423          	sd	s1,8(sp)
    80008558:	01213023          	sd	s2,0(sp)
    8000855c:	02010413          	addi	s0,sp,32
    80008560:	00050493          	mv	s1,a0
    80008564:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    80008568:	01000513          	li	a0,16
    8000856c:	00000097          	auipc	ra,0x0
    80008570:	dd0080e7          	jalr	-560(ra) # 8000833c <_Znwm>
    80008574:	00050613          	mv	a2,a0
    80008578:	00953023          	sd	s1,0(a0)
    8000857c:	01253423          	sd	s2,8(a0)
    80008580:	00000597          	auipc	a1,0x0
    80008584:	d6c58593          	addi	a1,a1,-660 # 800082ec <_ZN14PeriodicThread15periodicWrapperEPv>
    80008588:	00048513          	mv	a0,s1
    8000858c:	00000097          	auipc	ra,0x0
    80008590:	ed8080e7          	jalr	-296(ra) # 80008464 <_ZN6ThreadC1EPFvPvES0_>
    80008594:	00002797          	auipc	a5,0x2
    80008598:	ff478793          	addi	a5,a5,-12 # 8000a588 <_ZTV14PeriodicThread+0x10>
    8000859c:	00f4b023          	sd	a5,0(s1)
    800085a0:	01813083          	ld	ra,24(sp)
    800085a4:	01013403          	ld	s0,16(sp)
    800085a8:	00813483          	ld	s1,8(sp)
    800085ac:	00013903          	ld	s2,0(sp)
    800085b0:	02010113          	addi	sp,sp,32
    800085b4:	00008067          	ret

00000000800085b8 <_ZN6Thread3runEv>:
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    800085b8:	ff010113          	addi	sp,sp,-16
    800085bc:	00813423          	sd	s0,8(sp)
    800085c0:	01010413          	addi	s0,sp,16
    800085c4:	00813403          	ld	s0,8(sp)
    800085c8:	01010113          	addi	sp,sp,16
    800085cc:	00008067          	ret

00000000800085d0 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800085d0:	ff010113          	addi	sp,sp,-16
    800085d4:	00813423          	sd	s0,8(sp)
    800085d8:	01010413          	addi	s0,sp,16
    800085dc:	00813403          	ld	s0,8(sp)
    800085e0:	01010113          	addi	sp,sp,16
    800085e4:	00008067          	ret

00000000800085e8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800085e8:	ff010113          	addi	sp,sp,-16
    800085ec:	00113423          	sd	ra,8(sp)
    800085f0:	00813023          	sd	s0,0(sp)
    800085f4:	01010413          	addi	s0,sp,16
    800085f8:	00002797          	auipc	a5,0x2
    800085fc:	f9078793          	addi	a5,a5,-112 # 8000a588 <_ZTV14PeriodicThread+0x10>
    80008600:	00f53023          	sd	a5,0(a0)
    80008604:	00000097          	auipc	ra,0x0
    80008608:	d88080e7          	jalr	-632(ra) # 8000838c <_ZN6ThreadD1Ev>
    8000860c:	00813083          	ld	ra,8(sp)
    80008610:	00013403          	ld	s0,0(sp)
    80008614:	01010113          	addi	sp,sp,16
    80008618:	00008067          	ret

000000008000861c <_ZN14PeriodicThreadD0Ev>:
    8000861c:	fe010113          	addi	sp,sp,-32
    80008620:	00113c23          	sd	ra,24(sp)
    80008624:	00813823          	sd	s0,16(sp)
    80008628:	00913423          	sd	s1,8(sp)
    8000862c:	02010413          	addi	s0,sp,32
    80008630:	00050493          	mv	s1,a0
    80008634:	00002797          	auipc	a5,0x2
    80008638:	f5478793          	addi	a5,a5,-172 # 8000a588 <_ZTV14PeriodicThread+0x10>
    8000863c:	00f53023          	sd	a5,0(a0)
    80008640:	00000097          	auipc	ra,0x0
    80008644:	d4c080e7          	jalr	-692(ra) # 8000838c <_ZN6ThreadD1Ev>
    80008648:	00048513          	mv	a0,s1
    8000864c:	00000097          	auipc	ra,0x0
    80008650:	d18080e7          	jalr	-744(ra) # 80008364 <_ZdlPv>
    80008654:	01813083          	ld	ra,24(sp)
    80008658:	01013403          	ld	s0,16(sp)
    8000865c:	00813483          	ld	s1,8(sp)
    80008660:	02010113          	addi	sp,sp,32
    80008664:	00008067          	ret

0000000080008668 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80008668:	fd010113          	addi	sp,sp,-48
    8000866c:	02113423          	sd	ra,40(sp)
    80008670:	02813023          	sd	s0,32(sp)
    80008674:	00913c23          	sd	s1,24(sp)
    80008678:	01213823          	sd	s2,16(sp)
    8000867c:	01313423          	sd	s3,8(sp)
    80008680:	03010413          	addi	s0,sp,48
    80008684:	00050493          	mv	s1,a0
    80008688:	00058993          	mv	s3,a1
    8000868c:	0015879b          	addiw	a5,a1,1
    80008690:	0007851b          	sext.w	a0,a5
    80008694:	00f4a023          	sw	a5,0(s1)
    80008698:	0004a823          	sw	zero,16(s1)
    8000869c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800086a0:	00251513          	slli	a0,a0,0x2
    800086a4:	00000097          	auipc	ra,0x0
    800086a8:	95c080e7          	jalr	-1700(ra) # 80008000 <mem_alloc>
    800086ac:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800086b0:	01000513          	li	a0,16
    800086b4:	00000097          	auipc	ra,0x0
    800086b8:	c88080e7          	jalr	-888(ra) # 8000833c <_Znwm>
    800086bc:	00050913          	mv	s2,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    800086c0:	00002797          	auipc	a5,0x2
    800086c4:	f2078793          	addi	a5,a5,-224 # 8000a5e0 <_ZTV9Semaphore+0x10>
    800086c8:	00f53023          	sd	a5,0(a0)
    800086cc:	00000593          	li	a1,0
    800086d0:	00850513          	addi	a0,a0,8
    800086d4:	00000097          	auipc	ra,0x0
    800086d8:	a70080e7          	jalr	-1424(ra) # 80008144 <sem_open>
    800086dc:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800086e0:	01000513          	li	a0,16
    800086e4:	00000097          	auipc	ra,0x0
    800086e8:	c58080e7          	jalr	-936(ra) # 8000833c <_Znwm>
    800086ec:	00050913          	mv	s2,a0
    800086f0:	00002797          	auipc	a5,0x2
    800086f4:	ef078793          	addi	a5,a5,-272 # 8000a5e0 <_ZTV9Semaphore+0x10>
    800086f8:	00f53023          	sd	a5,0(a0)
    800086fc:	00098593          	mv	a1,s3
    80008700:	00850513          	addi	a0,a0,8
    80008704:	00000097          	auipc	ra,0x0
    80008708:	a40080e7          	jalr	-1472(ra) # 80008144 <sem_open>
    8000870c:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    80008710:	01000513          	li	a0,16
    80008714:	00000097          	auipc	ra,0x0
    80008718:	c28080e7          	jalr	-984(ra) # 8000833c <_Znwm>
    8000871c:	00050913          	mv	s2,a0
    80008720:	00002797          	auipc	a5,0x2
    80008724:	ec078793          	addi	a5,a5,-320 # 8000a5e0 <_ZTV9Semaphore+0x10>
    80008728:	00f53023          	sd	a5,0(a0)
    8000872c:	00100593          	li	a1,1
    80008730:	00850513          	addi	a0,a0,8
    80008734:	00000097          	auipc	ra,0x0
    80008738:	a10080e7          	jalr	-1520(ra) # 80008144 <sem_open>
    8000873c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80008740:	01000513          	li	a0,16
    80008744:	00000097          	auipc	ra,0x0
    80008748:	bf8080e7          	jalr	-1032(ra) # 8000833c <_Znwm>
    8000874c:	00050913          	mv	s2,a0
    80008750:	00002797          	auipc	a5,0x2
    80008754:	e9078793          	addi	a5,a5,-368 # 8000a5e0 <_ZTV9Semaphore+0x10>
    80008758:	00f53023          	sd	a5,0(a0)
    8000875c:	00100593          	li	a1,1
    80008760:	00850513          	addi	a0,a0,8
    80008764:	00000097          	auipc	ra,0x0
    80008768:	9e0080e7          	jalr	-1568(ra) # 80008144 <sem_open>
    8000876c:	0324b823          	sd	s2,48(s1)
}
    80008770:	02813083          	ld	ra,40(sp)
    80008774:	02013403          	ld	s0,32(sp)
    80008778:	01813483          	ld	s1,24(sp)
    8000877c:	01013903          	ld	s2,16(sp)
    80008780:	00813983          	ld	s3,8(sp)
    80008784:	03010113          	addi	sp,sp,48
    80008788:	00008067          	ret
    8000878c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80008790:	00090513          	mv	a0,s2
    80008794:	00000097          	auipc	ra,0x0
    80008798:	bd0080e7          	jalr	-1072(ra) # 80008364 <_ZdlPv>
    8000879c:	00048513          	mv	a0,s1
    800087a0:	00005097          	auipc	ra,0x5
    800087a4:	0f8080e7          	jalr	248(ra) # 8000d898 <_Unwind_Resume>
    800087a8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800087ac:	00090513          	mv	a0,s2
    800087b0:	00000097          	auipc	ra,0x0
    800087b4:	bb4080e7          	jalr	-1100(ra) # 80008364 <_ZdlPv>
    800087b8:	00048513          	mv	a0,s1
    800087bc:	00005097          	auipc	ra,0x5
    800087c0:	0dc080e7          	jalr	220(ra) # 8000d898 <_Unwind_Resume>
    800087c4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800087c8:	00090513          	mv	a0,s2
    800087cc:	00000097          	auipc	ra,0x0
    800087d0:	b98080e7          	jalr	-1128(ra) # 80008364 <_ZdlPv>
    800087d4:	00048513          	mv	a0,s1
    800087d8:	00005097          	auipc	ra,0x5
    800087dc:	0c0080e7          	jalr	192(ra) # 8000d898 <_Unwind_Resume>
    800087e0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800087e4:	00090513          	mv	a0,s2
    800087e8:	00000097          	auipc	ra,0x0
    800087ec:	b7c080e7          	jalr	-1156(ra) # 80008364 <_ZdlPv>
    800087f0:	00048513          	mv	a0,s1
    800087f4:	00005097          	auipc	ra,0x5
    800087f8:	0a4080e7          	jalr	164(ra) # 8000d898 <_Unwind_Resume>

00000000800087fc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800087fc:	fe010113          	addi	sp,sp,-32
    80008800:	00113c23          	sd	ra,24(sp)
    80008804:	00813823          	sd	s0,16(sp)
    80008808:	00913423          	sd	s1,8(sp)
    8000880c:	01213023          	sd	s2,0(sp)
    80008810:	02010413          	addi	s0,sp,32
    80008814:	00050493          	mv	s1,a0
    80008818:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000881c:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80008820:	0087b503          	ld	a0,8(a5)
    80008824:	00000097          	auipc	ra,0x0
    80008828:	994080e7          	jalr	-1644(ra) # 800081b8 <sem_wait>

    mutexTail->wait();
    8000882c:	0304b783          	ld	a5,48(s1)
    80008830:	0087b503          	ld	a0,8(a5)
    80008834:	00000097          	auipc	ra,0x0
    80008838:	984080e7          	jalr	-1660(ra) # 800081b8 <sem_wait>
    buffer[tail] = val;
    8000883c:	0084b783          	ld	a5,8(s1)
    80008840:	0144a703          	lw	a4,20(s1)
    80008844:	00271713          	slli	a4,a4,0x2
    80008848:	00e787b3          	add	a5,a5,a4
    8000884c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80008850:	0144a783          	lw	a5,20(s1)
    80008854:	0017879b          	addiw	a5,a5,1
    80008858:	0004a703          	lw	a4,0(s1)
    8000885c:	02e7e7bb          	remw	a5,a5,a4
    80008860:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80008864:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80008868:	0087b503          	ld	a0,8(a5)
    8000886c:	00000097          	auipc	ra,0x0
    80008870:	984080e7          	jalr	-1660(ra) # 800081f0 <sem_signal>

    itemAvailable->signal();
    80008874:	0204b783          	ld	a5,32(s1)
    80008878:	0087b503          	ld	a0,8(a5)
    8000887c:	00000097          	auipc	ra,0x0
    80008880:	974080e7          	jalr	-1676(ra) # 800081f0 <sem_signal>

}
    80008884:	01813083          	ld	ra,24(sp)
    80008888:	01013403          	ld	s0,16(sp)
    8000888c:	00813483          	ld	s1,8(sp)
    80008890:	00013903          	ld	s2,0(sp)
    80008894:	02010113          	addi	sp,sp,32
    80008898:	00008067          	ret

000000008000889c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000889c:	fe010113          	addi	sp,sp,-32
    800088a0:	00113c23          	sd	ra,24(sp)
    800088a4:	00813823          	sd	s0,16(sp)
    800088a8:	00913423          	sd	s1,8(sp)
    800088ac:	01213023          	sd	s2,0(sp)
    800088b0:	02010413          	addi	s0,sp,32
    800088b4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800088b8:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    800088bc:	0087b503          	ld	a0,8(a5)
    800088c0:	00000097          	auipc	ra,0x0
    800088c4:	8f8080e7          	jalr	-1800(ra) # 800081b8 <sem_wait>

    mutexHead->wait();
    800088c8:	0284b783          	ld	a5,40(s1)
    800088cc:	0087b503          	ld	a0,8(a5)
    800088d0:	00000097          	auipc	ra,0x0
    800088d4:	8e8080e7          	jalr	-1816(ra) # 800081b8 <sem_wait>

    int ret = buffer[head];
    800088d8:	0084b703          	ld	a4,8(s1)
    800088dc:	0104a783          	lw	a5,16(s1)
    800088e0:	00279693          	slli	a3,a5,0x2
    800088e4:	00d70733          	add	a4,a4,a3
    800088e8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800088ec:	0017879b          	addiw	a5,a5,1
    800088f0:	0004a703          	lw	a4,0(s1)
    800088f4:	02e7e7bb          	remw	a5,a5,a4
    800088f8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800088fc:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    80008900:	0087b503          	ld	a0,8(a5)
    80008904:	00000097          	auipc	ra,0x0
    80008908:	8ec080e7          	jalr	-1812(ra) # 800081f0 <sem_signal>

    spaceAvailable->signal();
    8000890c:	0184b783          	ld	a5,24(s1)
    80008910:	0087b503          	ld	a0,8(a5)
    80008914:	00000097          	auipc	ra,0x0
    80008918:	8dc080e7          	jalr	-1828(ra) # 800081f0 <sem_signal>

    return ret;
}
    8000891c:	00090513          	mv	a0,s2
    80008920:	01813083          	ld	ra,24(sp)
    80008924:	01013403          	ld	s0,16(sp)
    80008928:	00813483          	ld	s1,8(sp)
    8000892c:	00013903          	ld	s2,0(sp)
    80008930:	02010113          	addi	sp,sp,32
    80008934:	00008067          	ret

0000000080008938 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80008938:	fe010113          	addi	sp,sp,-32
    8000893c:	00113c23          	sd	ra,24(sp)
    80008940:	00813823          	sd	s0,16(sp)
    80008944:	00913423          	sd	s1,8(sp)
    80008948:	01213023          	sd	s2,0(sp)
    8000894c:	02010413          	addi	s0,sp,32
    80008950:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80008954:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    80008958:	0087b503          	ld	a0,8(a5)
    8000895c:	00000097          	auipc	ra,0x0
    80008960:	85c080e7          	jalr	-1956(ra) # 800081b8 <sem_wait>
    mutexTail->wait();
    80008964:	0304b783          	ld	a5,48(s1)
    80008968:	0087b503          	ld	a0,8(a5)
    8000896c:	00000097          	auipc	ra,0x0
    80008970:	84c080e7          	jalr	-1972(ra) # 800081b8 <sem_wait>

    if (tail >= head) {
    80008974:	0144a783          	lw	a5,20(s1)
    80008978:	0104a903          	lw	s2,16(s1)
    8000897c:	0527c263          	blt	a5,s2,800089c0 <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    80008980:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80008984:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80008988:	0087b503          	ld	a0,8(a5)
    8000898c:	00000097          	auipc	ra,0x0
    80008990:	864080e7          	jalr	-1948(ra) # 800081f0 <sem_signal>
    mutexHead->signal();
    80008994:	0284b783          	ld	a5,40(s1)
    80008998:	0087b503          	ld	a0,8(a5)
    8000899c:	00000097          	auipc	ra,0x0
    800089a0:	854080e7          	jalr	-1964(ra) # 800081f0 <sem_signal>

    return ret;
}
    800089a4:	00090513          	mv	a0,s2
    800089a8:	01813083          	ld	ra,24(sp)
    800089ac:	01013403          	ld	s0,16(sp)
    800089b0:	00813483          	ld	s1,8(sp)
    800089b4:	00013903          	ld	s2,0(sp)
    800089b8:	02010113          	addi	sp,sp,32
    800089bc:	00008067          	ret
        ret = cap - head + tail;
    800089c0:	0004a703          	lw	a4,0(s1)
    800089c4:	4127093b          	subw	s2,a4,s2
    800089c8:	00f9093b          	addw	s2,s2,a5
    800089cc:	fb9ff06f          	j	80008984 <_ZN9BufferCPP6getCntEv+0x4c>

00000000800089d0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800089d0:	fe010113          	addi	sp,sp,-32
    800089d4:	00113c23          	sd	ra,24(sp)
    800089d8:	00813823          	sd	s0,16(sp)
    800089dc:	00913423          	sd	s1,8(sp)
    800089e0:	02010413          	addi	s0,sp,32
    800089e4:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800089e8:	00a00513          	li	a0,10
    800089ec:	00000097          	auipc	ra,0x0
    800089f0:	8b0080e7          	jalr	-1872(ra) # 8000829c <putc>
    printString("Buffer deleted!\n");
    800089f4:	00002517          	auipc	a0,0x2
    800089f8:	bfc50513          	addi	a0,a0,-1028 # 8000a5f0 <_ZTV9Semaphore+0x20>
    800089fc:	00000097          	auipc	ra,0x0
    80008a00:	15c080e7          	jalr	348(ra) # 80008b58 <_Z11printStringPKc>
    while (getCnt()) {
    80008a04:	00048513          	mv	a0,s1
    80008a08:	00000097          	auipc	ra,0x0
    80008a0c:	f30080e7          	jalr	-208(ra) # 80008938 <_ZN9BufferCPP6getCntEv>
    80008a10:	02050c63          	beqz	a0,80008a48 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80008a14:	0084b783          	ld	a5,8(s1)
    80008a18:	0104a703          	lw	a4,16(s1)
    80008a1c:	00271713          	slli	a4,a4,0x2
    80008a20:	00e787b3          	add	a5,a5,a4
    80008a24:	0007c503          	lbu	a0,0(a5)
    80008a28:	00000097          	auipc	ra,0x0
    80008a2c:	874080e7          	jalr	-1932(ra) # 8000829c <putc>
        head = (head + 1) % cap;
    80008a30:	0104a783          	lw	a5,16(s1)
    80008a34:	0017879b          	addiw	a5,a5,1
    80008a38:	0004a703          	lw	a4,0(s1)
    80008a3c:	02e7e7bb          	remw	a5,a5,a4
    80008a40:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80008a44:	fc1ff06f          	j	80008a04 <_ZN9BufferCPPD1Ev+0x34>
    80008a48:	02100513          	li	a0,33
    80008a4c:	00000097          	auipc	ra,0x0
    80008a50:	850080e7          	jalr	-1968(ra) # 8000829c <putc>
    80008a54:	00a00513          	li	a0,10
    80008a58:	00000097          	auipc	ra,0x0
    80008a5c:	844080e7          	jalr	-1980(ra) # 8000829c <putc>
    mem_free(buffer);
    80008a60:	0084b503          	ld	a0,8(s1)
    80008a64:	fffff097          	auipc	ra,0xfffff
    80008a68:	5d4080e7          	jalr	1492(ra) # 80008038 <mem_free>
    delete itemAvailable;
    80008a6c:	0204b503          	ld	a0,32(s1)
    80008a70:	00050863          	beqz	a0,80008a80 <_ZN9BufferCPPD1Ev+0xb0>
    80008a74:	00053783          	ld	a5,0(a0)
    80008a78:	0087b783          	ld	a5,8(a5)
    80008a7c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80008a80:	0184b503          	ld	a0,24(s1)
    80008a84:	00050863          	beqz	a0,80008a94 <_ZN9BufferCPPD1Ev+0xc4>
    80008a88:	00053783          	ld	a5,0(a0)
    80008a8c:	0087b783          	ld	a5,8(a5)
    80008a90:	000780e7          	jalr	a5
    delete mutexTail;
    80008a94:	0304b503          	ld	a0,48(s1)
    80008a98:	00050863          	beqz	a0,80008aa8 <_ZN9BufferCPPD1Ev+0xd8>
    80008a9c:	00053783          	ld	a5,0(a0)
    80008aa0:	0087b783          	ld	a5,8(a5)
    80008aa4:	000780e7          	jalr	a5
    delete mutexHead;
    80008aa8:	0284b503          	ld	a0,40(s1)
    80008aac:	00050863          	beqz	a0,80008abc <_ZN9BufferCPPD1Ev+0xec>
    80008ab0:	00053783          	ld	a5,0(a0)
    80008ab4:	0087b783          	ld	a5,8(a5)
    80008ab8:	000780e7          	jalr	a5
}
    80008abc:	01813083          	ld	ra,24(sp)
    80008ac0:	01013403          	ld	s0,16(sp)
    80008ac4:	00813483          	ld	s1,8(sp)
    80008ac8:	02010113          	addi	sp,sp,32
    80008acc:	00008067          	ret

0000000080008ad0 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    80008ad0:	ff010113          	addi	sp,sp,-16
    80008ad4:	00113423          	sd	ra,8(sp)
    80008ad8:	00813023          	sd	s0,0(sp)
    80008adc:	01010413          	addi	s0,sp,16
    80008ae0:	00002797          	auipc	a5,0x2
    80008ae4:	b0078793          	addi	a5,a5,-1280 # 8000a5e0 <_ZTV9Semaphore+0x10>
    80008ae8:	00f53023          	sd	a5,0(a0)
    80008aec:	00853503          	ld	a0,8(a0)
    80008af0:	fffff097          	auipc	ra,0xfffff
    80008af4:	690080e7          	jalr	1680(ra) # 80008180 <sem_close>
    80008af8:	00813083          	ld	ra,8(sp)
    80008afc:	00013403          	ld	s0,0(sp)
    80008b00:	01010113          	addi	sp,sp,16
    80008b04:	00008067          	ret

0000000080008b08 <_ZN9SemaphoreD0Ev>:
    80008b08:	fe010113          	addi	sp,sp,-32
    80008b0c:	00113c23          	sd	ra,24(sp)
    80008b10:	00813823          	sd	s0,16(sp)
    80008b14:	00913423          	sd	s1,8(sp)
    80008b18:	02010413          	addi	s0,sp,32
    80008b1c:	00050493          	mv	s1,a0
    80008b20:	00002797          	auipc	a5,0x2
    80008b24:	ac078793          	addi	a5,a5,-1344 # 8000a5e0 <_ZTV9Semaphore+0x10>
    80008b28:	00f53023          	sd	a5,0(a0)
    80008b2c:	00853503          	ld	a0,8(a0)
    80008b30:	fffff097          	auipc	ra,0xfffff
    80008b34:	650080e7          	jalr	1616(ra) # 80008180 <sem_close>
    80008b38:	00048513          	mv	a0,s1
    80008b3c:	00000097          	auipc	ra,0x0
    80008b40:	828080e7          	jalr	-2008(ra) # 80008364 <_ZdlPv>
    80008b44:	01813083          	ld	ra,24(sp)
    80008b48:	01013403          	ld	s0,16(sp)
    80008b4c:	00813483          	ld	s1,8(sp)
    80008b50:	02010113          	addi	sp,sp,32
    80008b54:	00008067          	ret

0000000080008b58 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80008b58:	fe010113          	addi	sp,sp,-32
    80008b5c:	00113c23          	sd	ra,24(sp)
    80008b60:	00813823          	sd	s0,16(sp)
    80008b64:	00913423          	sd	s1,8(sp)
    80008b68:	02010413          	addi	s0,sp,32
    80008b6c:	00050493          	mv	s1,a0
    LOCK();
    80008b70:	00100613          	li	a2,1
    80008b74:	00000593          	li	a1,0
    80008b78:	00004517          	auipc	a0,0x4
    80008b7c:	bb050513          	addi	a0,a0,-1104 # 8000c728 <lockPrint>
    80008b80:	ffffb097          	auipc	ra,0xffffb
    80008b84:	5b0080e7          	jalr	1456(ra) # 80004130 <copy_and_swap>
    80008b88:	fe0514e3          	bnez	a0,80008b70 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80008b8c:	0004c503          	lbu	a0,0(s1)
    80008b90:	00050a63          	beqz	a0,80008ba4 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80008b94:	fffff097          	auipc	ra,0xfffff
    80008b98:	708080e7          	jalr	1800(ra) # 8000829c <putc>
        string++;
    80008b9c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80008ba0:	fedff06f          	j	80008b8c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80008ba4:	00000613          	li	a2,0
    80008ba8:	00100593          	li	a1,1
    80008bac:	00004517          	auipc	a0,0x4
    80008bb0:	b7c50513          	addi	a0,a0,-1156 # 8000c728 <lockPrint>
    80008bb4:	ffffb097          	auipc	ra,0xffffb
    80008bb8:	57c080e7          	jalr	1404(ra) # 80004130 <copy_and_swap>
    80008bbc:	fe0514e3          	bnez	a0,80008ba4 <_Z11printStringPKc+0x4c>
}
    80008bc0:	01813083          	ld	ra,24(sp)
    80008bc4:	01013403          	ld	s0,16(sp)
    80008bc8:	00813483          	ld	s1,8(sp)
    80008bcc:	02010113          	addi	sp,sp,32
    80008bd0:	00008067          	ret

0000000080008bd4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80008bd4:	fd010113          	addi	sp,sp,-48
    80008bd8:	02113423          	sd	ra,40(sp)
    80008bdc:	02813023          	sd	s0,32(sp)
    80008be0:	00913c23          	sd	s1,24(sp)
    80008be4:	01213823          	sd	s2,16(sp)
    80008be8:	01313423          	sd	s3,8(sp)
    80008bec:	01413023          	sd	s4,0(sp)
    80008bf0:	03010413          	addi	s0,sp,48
    80008bf4:	00050993          	mv	s3,a0
    80008bf8:	00058a13          	mv	s4,a1
    LOCK();
    80008bfc:	00100613          	li	a2,1
    80008c00:	00000593          	li	a1,0
    80008c04:	00004517          	auipc	a0,0x4
    80008c08:	b2450513          	addi	a0,a0,-1244 # 8000c728 <lockPrint>
    80008c0c:	ffffb097          	auipc	ra,0xffffb
    80008c10:	524080e7          	jalr	1316(ra) # 80004130 <copy_and_swap>
    80008c14:	fe0514e3          	bnez	a0,80008bfc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80008c18:	00000493          	li	s1,0
    80008c1c:	0014891b          	addiw	s2,s1,1
    80008c20:	03495a63          	bge	s2,s4,80008c54 <_Z9getStringPci+0x80>
        cc = getc();
    80008c24:	fffff097          	auipc	ra,0xfffff
    80008c28:	63c080e7          	jalr	1596(ra) # 80008260 <getc>
        if(cc < 1)
    80008c2c:	02050463          	beqz	a0,80008c54 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80008c30:	009984b3          	add	s1,s3,s1
    80008c34:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80008c38:	00a00793          	li	a5,10
    80008c3c:	00f50a63          	beq	a0,a5,80008c50 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80008c40:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80008c44:	00d00793          	li	a5,13
    80008c48:	fcf51ae3          	bne	a0,a5,80008c1c <_Z9getStringPci+0x48>
    80008c4c:	0080006f          	j	80008c54 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80008c50:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80008c54:	009984b3          	add	s1,s3,s1
    80008c58:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80008c5c:	00000613          	li	a2,0
    80008c60:	00100593          	li	a1,1
    80008c64:	00004517          	auipc	a0,0x4
    80008c68:	ac450513          	addi	a0,a0,-1340 # 8000c728 <lockPrint>
    80008c6c:	ffffb097          	auipc	ra,0xffffb
    80008c70:	4c4080e7          	jalr	1220(ra) # 80004130 <copy_and_swap>
    80008c74:	fe0514e3          	bnez	a0,80008c5c <_Z9getStringPci+0x88>
    return buf;
}
    80008c78:	00098513          	mv	a0,s3
    80008c7c:	02813083          	ld	ra,40(sp)
    80008c80:	02013403          	ld	s0,32(sp)
    80008c84:	01813483          	ld	s1,24(sp)
    80008c88:	01013903          	ld	s2,16(sp)
    80008c8c:	00813983          	ld	s3,8(sp)
    80008c90:	00013a03          	ld	s4,0(sp)
    80008c94:	03010113          	addi	sp,sp,48
    80008c98:	00008067          	ret

0000000080008c9c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80008c9c:	ff010113          	addi	sp,sp,-16
    80008ca0:	00813423          	sd	s0,8(sp)
    80008ca4:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    80008ca8:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    80008cac:	00054603          	lbu	a2,0(a0)
    80008cb0:	fd06069b          	addiw	a3,a2,-48
    80008cb4:	0ff6f693          	andi	a3,a3,255
    80008cb8:	00900713          	li	a4,9
    80008cbc:	02d76063          	bltu	a4,a3,80008cdc <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    80008cc0:	0027969b          	slliw	a3,a5,0x2
    80008cc4:	00f687bb          	addw	a5,a3,a5
    80008cc8:	0017971b          	slliw	a4,a5,0x1
    80008ccc:	00150513          	addi	a0,a0,1
    80008cd0:	00c707bb          	addw	a5,a4,a2
    80008cd4:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    80008cd8:	fd5ff06f          	j	80008cac <_Z11stringToIntPKc+0x10>
    return n;
}
    80008cdc:	00078513          	mv	a0,a5
    80008ce0:	00813403          	ld	s0,8(sp)
    80008ce4:	01010113          	addi	sp,sp,16
    80008ce8:	00008067          	ret

0000000080008cec <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    80008cec:	fc010113          	addi	sp,sp,-64
    80008cf0:	02113c23          	sd	ra,56(sp)
    80008cf4:	02813823          	sd	s0,48(sp)
    80008cf8:	02913423          	sd	s1,40(sp)
    80008cfc:	03213023          	sd	s2,32(sp)
    80008d00:	01313c23          	sd	s3,24(sp)
    80008d04:	04010413          	addi	s0,sp,64
    80008d08:	00050913          	mv	s2,a0
    80008d0c:	00058993          	mv	s3,a1
    LOCK();
    80008d10:	00100613          	li	a2,1
    80008d14:	00000593          	li	a1,0
    80008d18:	00004517          	auipc	a0,0x4
    80008d1c:	a1050513          	addi	a0,a0,-1520 # 8000c728 <lockPrint>
    80008d20:	ffffb097          	auipc	ra,0xffffb
    80008d24:	410080e7          	jalr	1040(ra) # 80004130 <copy_and_swap>
    80008d28:	fe0514e3          	bnez	a0,80008d10 <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    80008d2c:	00000793          	li	a5,0
    80008d30:	0080006f          	j	80008d38 <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    80008d34:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    80008d38:	033976b3          	remu	a3,s2,s3
    80008d3c:	0017849b          	addiw	s1,a5,1
    80008d40:	00003717          	auipc	a4,0x3
    80008d44:	79870713          	addi	a4,a4,1944 # 8000c4d8 <digits>
    80008d48:	00d70733          	add	a4,a4,a3
    80008d4c:	00074703          	lbu	a4,0(a4)
    80008d50:	fd040693          	addi	a3,s0,-48
    80008d54:	00f687b3          	add	a5,a3,a5
    80008d58:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80008d5c:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    80008d60:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80008d64:	fd3978e3          	bgeu	s2,s3,80008d34 <_Z8printIntmi+0x48>

    while(--i >= 0)
    80008d68:	fff4849b          	addiw	s1,s1,-1
    80008d6c:	0004ce63          	bltz	s1,80008d88 <_Z8printIntmi+0x9c>
        putc(buf[i]);
    80008d70:	fd040793          	addi	a5,s0,-48
    80008d74:	009787b3          	add	a5,a5,s1
    80008d78:	ff07c503          	lbu	a0,-16(a5)
    80008d7c:	fffff097          	auipc	ra,0xfffff
    80008d80:	520080e7          	jalr	1312(ra) # 8000829c <putc>
    80008d84:	fe5ff06f          	j	80008d68 <_Z8printIntmi+0x7c>

    UNLOCK();
    80008d88:	00000613          	li	a2,0
    80008d8c:	00100593          	li	a1,1
    80008d90:	00004517          	auipc	a0,0x4
    80008d94:	99850513          	addi	a0,a0,-1640 # 8000c728 <lockPrint>
    80008d98:	ffffb097          	auipc	ra,0xffffb
    80008d9c:	398080e7          	jalr	920(ra) # 80004130 <copy_and_swap>
    80008da0:	fe0514e3          	bnez	a0,80008d88 <_Z8printIntmi+0x9c>
    80008da4:	03813083          	ld	ra,56(sp)
    80008da8:	03013403          	ld	s0,48(sp)
    80008dac:	02813483          	ld	s1,40(sp)
    80008db0:	02013903          	ld	s2,32(sp)
    80008db4:	01813983          	ld	s3,24(sp)
    80008db8:	04010113          	addi	sp,sp,64
    80008dbc:	00008067          	ret

0000000080008dc0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    80008dc0:	f9010113          	addi	sp,sp,-112
    80008dc4:	06113423          	sd	ra,104(sp)
    80008dc8:	06813023          	sd	s0,96(sp)
    80008dcc:	04913c23          	sd	s1,88(sp)
    80008dd0:	05213823          	sd	s2,80(sp)
    80008dd4:	05313423          	sd	s3,72(sp)
    80008dd8:	05413023          	sd	s4,64(sp)
    80008ddc:	03513c23          	sd	s5,56(sp)
    80008de0:	03613823          	sd	s6,48(sp)
    80008de4:	03713423          	sd	s7,40(sp)
    80008de8:	03813023          	sd	s8,32(sp)
    80008dec:	07010413          	addi	s0,sp,112
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80008df0:	00010b93          	mv	s7,sp
        printString("Unesite broj proizvodjaca?\n");
    80008df4:	00002517          	auipc	a0,0x2
    80008df8:	88c50513          	addi	a0,a0,-1908 # 8000a680 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    80008dfc:	00000097          	auipc	ra,0x0
    80008e00:	d5c080e7          	jalr	-676(ra) # 80008b58 <_Z11printStringPKc>
        getString(input, 30);
    80008e04:	01e00593          	li	a1,30
    80008e08:	f9040513          	addi	a0,s0,-112
    80008e0c:	00000097          	auipc	ra,0x0
    80008e10:	dc8080e7          	jalr	-568(ra) # 80008bd4 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80008e14:	f9040513          	addi	a0,s0,-112
    80008e18:	00000097          	auipc	ra,0x0
    80008e1c:	e84080e7          	jalr	-380(ra) # 80008c9c <_Z11stringToIntPKc>
    80008e20:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    80008e24:	00002517          	auipc	a0,0x2
    80008e28:	87c50513          	addi	a0,a0,-1924 # 8000a6a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    80008e2c:	00000097          	auipc	ra,0x0
    80008e30:	d2c080e7          	jalr	-724(ra) # 80008b58 <_Z11printStringPKc>
        getString(input, 30);
    80008e34:	01e00593          	li	a1,30
    80008e38:	f9040513          	addi	a0,s0,-112
    80008e3c:	00000097          	auipc	ra,0x0
    80008e40:	d98080e7          	jalr	-616(ra) # 80008bd4 <_Z9getStringPci>
        n = stringToInt(input);
    80008e44:	f9040513          	addi	a0,s0,-112
    80008e48:	00000097          	auipc	ra,0x0
    80008e4c:	e54080e7          	jalr	-428(ra) # 80008c9c <_Z11stringToIntPKc>
    80008e50:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    80008e54:	00002517          	auipc	a0,0x2
    80008e58:	86c50513          	addi	a0,a0,-1940 # 8000a6c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    80008e5c:	00000097          	auipc	ra,0x0
    80008e60:	cfc080e7          	jalr	-772(ra) # 80008b58 <_Z11printStringPKc>
    80008e64:	00a00593          	li	a1,10
    80008e68:	00098513          	mv	a0,s3
    80008e6c:	00000097          	auipc	ra,0x0
    80008e70:	e80080e7          	jalr	-384(ra) # 80008cec <_Z8printIntmi>
        printString(" i velicina bafera "); printInt(n);
    80008e74:	00002517          	auipc	a0,0x2
    80008e78:	86450513          	addi	a0,a0,-1948 # 8000a6d8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    80008e7c:	00000097          	auipc	ra,0x0
    80008e80:	cdc080e7          	jalr	-804(ra) # 80008b58 <_Z11printStringPKc>
    80008e84:	00a00593          	li	a1,10
    80008e88:	00048513          	mv	a0,s1
    80008e8c:	00000097          	auipc	ra,0x0
    80008e90:	e60080e7          	jalr	-416(ra) # 80008cec <_Z8printIntmi>
        printString(".\n");
    80008e94:	00002517          	auipc	a0,0x2
    80008e98:	85c50513          	addi	a0,a0,-1956 # 8000a6f0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    80008e9c:	00000097          	auipc	ra,0x0
    80008ea0:	cbc080e7          	jalr	-836(ra) # 80008b58 <_Z11printStringPKc>
        if(threadNum > n) {
    80008ea4:	0334c463          	blt	s1,s3,80008ecc <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x10c>
        } else if (threadNum < 1) {
    80008ea8:	03305c63          	blez	s3,80008ee0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x120>
        BufferCPP *buffer = new BufferCPP(n);
    80008eac:	03800513          	li	a0,56
    80008eb0:	fffff097          	auipc	ra,0xfffff
    80008eb4:	48c080e7          	jalr	1164(ra) # 8000833c <_Znwm>
    80008eb8:	00050a93          	mv	s5,a0
    80008ebc:	00048593          	mv	a1,s1
    80008ec0:	fffff097          	auipc	ra,0xfffff
    80008ec4:	7a8080e7          	jalr	1960(ra) # 80008668 <_ZN9BufferCPPC1Ei>
    80008ec8:	0300006f          	j	80008ef8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x138>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80008ecc:	00002517          	auipc	a0,0x2
    80008ed0:	82c50513          	addi	a0,a0,-2004 # 8000a6f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    80008ed4:	00000097          	auipc	ra,0x0
    80008ed8:	c84080e7          	jalr	-892(ra) # 80008b58 <_Z11printStringPKc>
            return;
    80008edc:	0140006f          	j	80008ef0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80008ee0:	00002517          	auipc	a0,0x2
    80008ee4:	85850513          	addi	a0,a0,-1960 # 8000a738 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    80008ee8:	00000097          	auipc	ra,0x0
    80008eec:	c70080e7          	jalr	-912(ra) # 80008b58 <_Z11printStringPKc>
            return;
    80008ef0:	000b8113          	mv	sp,s7
    80008ef4:	2140006f          	j	80009108 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x348>
        waitForAll = new Semaphore(0);
    80008ef8:	01000513          	li	a0,16
    80008efc:	fffff097          	auipc	ra,0xfffff
    80008f00:	440080e7          	jalr	1088(ra) # 8000833c <_Znwm>
    80008f04:	00050493          	mv	s1,a0
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80008f08:	00001797          	auipc	a5,0x1
    80008f0c:	6d878793          	addi	a5,a5,1752 # 8000a5e0 <_ZTV9Semaphore+0x10>
    80008f10:	00f53023          	sd	a5,0(a0)
    80008f14:	00000593          	li	a1,0
    80008f18:	00850513          	addi	a0,a0,8
    80008f1c:	fffff097          	auipc	ra,0xfffff
    80008f20:	228080e7          	jalr	552(ra) # 80008144 <sem_open>
    80008f24:	00004917          	auipc	s2,0x4
    80008f28:	81490913          	addi	s2,s2,-2028 # 8000c738 <_ZN19ConsumerProducerCPP10waitForAllE>
    80008f2c:	00993023          	sd	s1,0(s2)
        Thread *producers[threadNum];
    80008f30:	00399793          	slli	a5,s3,0x3
    80008f34:	00f78793          	addi	a5,a5,15
    80008f38:	ff07f793          	andi	a5,a5,-16
    80008f3c:	40f10133          	sub	sp,sp,a5
    80008f40:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    80008f44:	0019879b          	addiw	a5,s3,1
    80008f48:	00179713          	slli	a4,a5,0x1
    80008f4c:	00f70733          	add	a4,a4,a5
    80008f50:	00371793          	slli	a5,a4,0x3
    80008f54:	00f78793          	addi	a5,a5,15
    80008f58:	ff07f793          	andi	a5,a5,-16
    80008f5c:	40f10133          	sub	sp,sp,a5
    80008f60:	00010c13          	mv	s8,sp
        threadData[threadNum].id = threadNum;
    80008f64:	00199793          	slli	a5,s3,0x1
    80008f68:	013787b3          	add	a5,a5,s3
    80008f6c:	00379493          	slli	s1,a5,0x3
    80008f70:	009c04b3          	add	s1,s8,s1
    80008f74:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    80008f78:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    80008f7c:	00093783          	ld	a5,0(s2)
    80008f80:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80008f84:	01800513          	li	a0,24
    80008f88:	fffff097          	auipc	ra,0xfffff
    80008f8c:	3b4080e7          	jalr	948(ra) # 8000833c <_Znwm>
    80008f90:	00050b13          	mv	s6,a0
    Thread (){ myHandle = nullptr;}
    80008f94:	00053423          	sd	zero,8(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    80008f98:	00001797          	auipc	a5,0x1
    80008f9c:	6d078793          	addi	a5,a5,1744 # 8000a668 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80008fa0:	00f53023          	sd	a5,0(a0)
    80008fa4:	00953823          	sd	s1,16(a0)
        consumer->start();
    80008fa8:	fffff097          	auipc	ra,0xfffff
    80008fac:	528080e7          	jalr	1320(ra) # 800084d0 <_ZN6Thread5startEv>
        threadData[0].id = 0;
    80008fb0:	000c2023          	sw	zero,0(s8)
        threadData[0].buffer = buffer;
    80008fb4:	015c3423          	sd	s5,8(s8)
        threadData[0].sem = waitForAll;
    80008fb8:	00093783          	ld	a5,0(s2)
    80008fbc:	00fc3823          	sd	a5,16(s8)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80008fc0:	01800513          	li	a0,24
    80008fc4:	fffff097          	auipc	ra,0xfffff
    80008fc8:	378080e7          	jalr	888(ra) # 8000833c <_Znwm>
    80008fcc:	00053423          	sd	zero,8(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80008fd0:	00001717          	auipc	a4,0x1
    80008fd4:	64870713          	addi	a4,a4,1608 # 8000a618 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80008fd8:	00e53023          	sd	a4,0(a0)
    80008fdc:	01853823          	sd	s8,16(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80008fe0:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    80008fe4:	fffff097          	auipc	ra,0xfffff
    80008fe8:	4ec080e7          	jalr	1260(ra) # 800084d0 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80008fec:	00100913          	li	s2,1
    80008ff0:	07395463          	bge	s2,s3,80009058 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x298>
            threadData[i].id = i;
    80008ff4:	00191793          	slli	a5,s2,0x1
    80008ff8:	012787b3          	add	a5,a5,s2
    80008ffc:	00379493          	slli	s1,a5,0x3
    80009000:	009c04b3          	add	s1,s8,s1
    80009004:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    80009008:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    8000900c:	00003797          	auipc	a5,0x3
    80009010:	72c78793          	addi	a5,a5,1836 # 8000c738 <_ZN19ConsumerProducerCPP10waitForAllE>
    80009014:	0007b783          	ld	a5,0(a5)
    80009018:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    8000901c:	01800513          	li	a0,24
    80009020:	fffff097          	auipc	ra,0xfffff
    80009024:	31c080e7          	jalr	796(ra) # 8000833c <_Znwm>
    80009028:	00053423          	sd	zero,8(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    8000902c:	00001717          	auipc	a4,0x1
    80009030:	61470713          	addi	a4,a4,1556 # 8000a640 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80009034:	00e53023          	sd	a4,0(a0)
    80009038:	00953823          	sd	s1,16(a0)
            producers[i] = new Producer(&threadData[i]);
    8000903c:	00391713          	slli	a4,s2,0x3
    80009040:	00ea0733          	add	a4,s4,a4
    80009044:	00a73023          	sd	a0,0(a4)
            producers[i]->start();
    80009048:	fffff097          	auipc	ra,0xfffff
    8000904c:	488080e7          	jalr	1160(ra) # 800084d0 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80009050:	0019091b          	addiw	s2,s2,1
    80009054:	f9dff06f          	j	80008ff0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x230>
    static void dispatch () { thread_dispatch(); }
    80009058:	fffff097          	auipc	ra,0xfffff
    8000905c:	010080e7          	jalr	16(ra) # 80008068 <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    80009060:	00000493          	li	s1,0
    80009064:	0299c263          	blt	s3,s1,80009088 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2c8>
            waitForAll->wait();
    80009068:	00003797          	auipc	a5,0x3
    8000906c:	6d078793          	addi	a5,a5,1744 # 8000c738 <_ZN19ConsumerProducerCPP10waitForAllE>
    80009070:	0007b783          	ld	a5,0(a5)
    void wait (){ sem_wait(myHandle); }
    80009074:	0087b503          	ld	a0,8(a5)
    80009078:	fffff097          	auipc	ra,0xfffff
    8000907c:	140080e7          	jalr	320(ra) # 800081b8 <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    80009080:	0014849b          	addiw	s1,s1,1
    80009084:	fe1ff06f          	j	80009064 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2a4>
        delete waitForAll;
    80009088:	00003797          	auipc	a5,0x3
    8000908c:	6b078793          	addi	a5,a5,1712 # 8000c738 <_ZN19ConsumerProducerCPP10waitForAllE>
    80009090:	0007b503          	ld	a0,0(a5)
    80009094:	00050863          	beqz	a0,800090a4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2e4>
    80009098:	00053783          	ld	a5,0(a0)
    8000909c:	0087b783          	ld	a5,8(a5)
    800090a0:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    800090a4:	00000493          	li	s1,0
    800090a8:	0080006f          	j	800090b0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f0>
        for (int i = 0; i < threadNum; i++) {
    800090ac:	0014849b          	addiw	s1,s1,1
    800090b0:	0334d263          	bge	s1,s3,800090d4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x314>
            delete producers[i];
    800090b4:	00349793          	slli	a5,s1,0x3
    800090b8:	00fa07b3          	add	a5,s4,a5
    800090bc:	0007b503          	ld	a0,0(a5)
    800090c0:	fe0506e3          	beqz	a0,800090ac <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
    800090c4:	00053783          	ld	a5,0(a0)
    800090c8:	0087b783          	ld	a5,8(a5)
    800090cc:	000780e7          	jalr	a5
    800090d0:	fddff06f          	j	800090ac <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
        delete consumer;
    800090d4:	000b0a63          	beqz	s6,800090e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x328>
    800090d8:	000b3783          	ld	a5,0(s6) # 2000 <_entry-0x7fffe000>
    800090dc:	0087b783          	ld	a5,8(a5)
    800090e0:	000b0513          	mv	a0,s6
    800090e4:	000780e7          	jalr	a5
        delete buffer;
    800090e8:	000a8e63          	beqz	s5,80009104 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x344>
    800090ec:	000a8513          	mv	a0,s5
    800090f0:	00000097          	auipc	ra,0x0
    800090f4:	8e0080e7          	jalr	-1824(ra) # 800089d0 <_ZN9BufferCPPD1Ev>
    800090f8:	000a8513          	mv	a0,s5
    800090fc:	fffff097          	auipc	ra,0xfffff
    80009100:	268080e7          	jalr	616(ra) # 80008364 <_ZdlPv>
    80009104:	000b8113          	mv	sp,s7
    }
    80009108:	f9040113          	addi	sp,s0,-112
    8000910c:	06813083          	ld	ra,104(sp)
    80009110:	06013403          	ld	s0,96(sp)
    80009114:	05813483          	ld	s1,88(sp)
    80009118:	05013903          	ld	s2,80(sp)
    8000911c:	04813983          	ld	s3,72(sp)
    80009120:	04013a03          	ld	s4,64(sp)
    80009124:	03813a83          	ld	s5,56(sp)
    80009128:	03013b03          	ld	s6,48(sp)
    8000912c:	02813b83          	ld	s7,40(sp)
    80009130:	02013c03          	ld	s8,32(sp)
    80009134:	07010113          	addi	sp,sp,112
    80009138:	00008067          	ret
    8000913c:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80009140:	000a8513          	mv	a0,s5
    80009144:	fffff097          	auipc	ra,0xfffff
    80009148:	220080e7          	jalr	544(ra) # 80008364 <_ZdlPv>
    8000914c:	00048513          	mv	a0,s1
    80009150:	00004097          	auipc	ra,0x4
    80009154:	748080e7          	jalr	1864(ra) # 8000d898 <_Unwind_Resume>
    80009158:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    8000915c:	00048513          	mv	a0,s1
    80009160:	fffff097          	auipc	ra,0xfffff
    80009164:	204080e7          	jalr	516(ra) # 80008364 <_ZdlPv>
    80009168:	00090513          	mv	a0,s2
    8000916c:	00004097          	auipc	ra,0x4
    80009170:	72c080e7          	jalr	1836(ra) # 8000d898 <_Unwind_Resume>

0000000080009174 <_Z8userMainv>:
//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
//#include"test/testing.hpp"
//#include"../../h/syscall_c.h"
//#include"test/printing.hpp"
void userMain() {
    80009174:	ff010113          	addi	sp,sp,-16
    80009178:	00113423          	sd	ra,8(sp)
    8000917c:	00813023          	sd	s0,0(sp)
    80009180:	01010413          	addi	s0,sp,16

    //NZM? producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //NZM? producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80009184:	00000097          	auipc	ra,0x0
    80009188:	c3c080e7          	jalr	-964(ra) # 80008dc0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
    8000918c:	00813083          	ld	ra,8(sp)
    80009190:	00013403          	ld	s0,0(sp)
    80009194:	01010113          	addi	sp,sp,16
    80009198:	00008067          	ret

000000008000919c <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    8000919c:	fd010113          	addi	sp,sp,-48
    800091a0:	02113423          	sd	ra,40(sp)
    800091a4:	02813023          	sd	s0,32(sp)
    800091a8:	00913c23          	sd	s1,24(sp)
    800091ac:	01213823          	sd	s2,16(sp)
    800091b0:	01313423          	sd	s3,8(sp)
    800091b4:	03010413          	addi	s0,sp,48
    800091b8:	00050913          	mv	s2,a0
            int i = 0;
    800091bc:	00000993          	li	s3,0
    800091c0:	0100006f          	j	800091d0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    static void putc (char c){ ::putc(c); }
    800091c4:	00a00513          	li	a0,10
    800091c8:	fffff097          	auipc	ra,0xfffff
    800091cc:	0d4080e7          	jalr	212(ra) # 8000829c <putc>
            while (!threadEnd) {
    800091d0:	00003797          	auipc	a5,0x3
    800091d4:	56078793          	addi	a5,a5,1376 # 8000c730 <_ZN19ConsumerProducerCPP9threadEndE>
    800091d8:	0007a783          	lw	a5,0(a5)
    800091dc:	0007879b          	sext.w	a5,a5
    800091e0:	02079c63          	bnez	a5,80009218 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    800091e4:	01093783          	ld	a5,16(s2)
    800091e8:	0087b503          	ld	a0,8(a5)
    800091ec:	fffff097          	auipc	ra,0xfffff
    800091f0:	6b0080e7          	jalr	1712(ra) # 8000889c <_ZN9BufferCPP3getEv>
                i++;
    800091f4:	0019849b          	addiw	s1,s3,1
    800091f8:	0004899b          	sext.w	s3,s1
    800091fc:	0ff57513          	andi	a0,a0,255
    80009200:	fffff097          	auipc	ra,0xfffff
    80009204:	09c080e7          	jalr	156(ra) # 8000829c <putc>
                if (i % 80 == 0) {
    80009208:	05000793          	li	a5,80
    8000920c:	02f4e4bb          	remw	s1,s1,a5
    80009210:	fc0490e3          	bnez	s1,800091d0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80009214:	fb1ff06f          	j	800091c4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    80009218:	01093783          	ld	a5,16(s2)
    8000921c:	0087b503          	ld	a0,8(a5)
    80009220:	fffff097          	auipc	ra,0xfffff
    80009224:	718080e7          	jalr	1816(ra) # 80008938 <_ZN9BufferCPP6getCntEv>
    80009228:	02a05263          	blez	a0,8000924c <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    8000922c:	01093783          	ld	a5,16(s2)
    80009230:	0087b503          	ld	a0,8(a5)
    80009234:	fffff097          	auipc	ra,0xfffff
    80009238:	668080e7          	jalr	1640(ra) # 8000889c <_ZN9BufferCPP3getEv>
    8000923c:	0ff57513          	andi	a0,a0,255
    80009240:	fffff097          	auipc	ra,0xfffff
    80009244:	05c080e7          	jalr	92(ra) # 8000829c <putc>
    80009248:	fd1ff06f          	j	80009218 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    8000924c:	01093783          	ld	a5,16(s2)
    80009250:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80009254:	0087b503          	ld	a0,8(a5)
    80009258:	fffff097          	auipc	ra,0xfffff
    8000925c:	f98080e7          	jalr	-104(ra) # 800081f0 <sem_signal>
        }
    80009260:	02813083          	ld	ra,40(sp)
    80009264:	02013403          	ld	s0,32(sp)
    80009268:	01813483          	ld	s1,24(sp)
    8000926c:	01013903          	ld	s2,16(sp)
    80009270:	00813983          	ld	s3,8(sp)
    80009274:	03010113          	addi	sp,sp,48
    80009278:	00008067          	ret

000000008000927c <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    8000927c:	ff010113          	addi	sp,sp,-16
    80009280:	00113423          	sd	ra,8(sp)
    80009284:	00813023          	sd	s0,0(sp)
    80009288:	01010413          	addi	s0,sp,16
    8000928c:	00001797          	auipc	a5,0x1
    80009290:	3dc78793          	addi	a5,a5,988 # 8000a668 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80009294:	00f53023          	sd	a5,0(a0)
    80009298:	fffff097          	auipc	ra,0xfffff
    8000929c:	0f4080e7          	jalr	244(ra) # 8000838c <_ZN6ThreadD1Ev>
    800092a0:	00813083          	ld	ra,8(sp)
    800092a4:	00013403          	ld	s0,0(sp)
    800092a8:	01010113          	addi	sp,sp,16
    800092ac:	00008067          	ret

00000000800092b0 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    800092b0:	fe010113          	addi	sp,sp,-32
    800092b4:	00113c23          	sd	ra,24(sp)
    800092b8:	00813823          	sd	s0,16(sp)
    800092bc:	00913423          	sd	s1,8(sp)
    800092c0:	02010413          	addi	s0,sp,32
    800092c4:	00050493          	mv	s1,a0
    800092c8:	00001797          	auipc	a5,0x1
    800092cc:	3a078793          	addi	a5,a5,928 # 8000a668 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800092d0:	00f53023          	sd	a5,0(a0)
    800092d4:	fffff097          	auipc	ra,0xfffff
    800092d8:	0b8080e7          	jalr	184(ra) # 8000838c <_ZN6ThreadD1Ev>
    800092dc:	00048513          	mv	a0,s1
    800092e0:	fffff097          	auipc	ra,0xfffff
    800092e4:	084080e7          	jalr	132(ra) # 80008364 <_ZdlPv>
    800092e8:	01813083          	ld	ra,24(sp)
    800092ec:	01013403          	ld	s0,16(sp)
    800092f0:	00813483          	ld	s1,8(sp)
    800092f4:	02010113          	addi	sp,sp,32
    800092f8:	00008067          	ret

00000000800092fc <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    800092fc:	ff010113          	addi	sp,sp,-16
    80009300:	00113423          	sd	ra,8(sp)
    80009304:	00813023          	sd	s0,0(sp)
    80009308:	01010413          	addi	s0,sp,16
    8000930c:	00001797          	auipc	a5,0x1
    80009310:	30c78793          	addi	a5,a5,780 # 8000a618 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80009314:	00f53023          	sd	a5,0(a0)
    80009318:	fffff097          	auipc	ra,0xfffff
    8000931c:	074080e7          	jalr	116(ra) # 8000838c <_ZN6ThreadD1Ev>
    80009320:	00813083          	ld	ra,8(sp)
    80009324:	00013403          	ld	s0,0(sp)
    80009328:	01010113          	addi	sp,sp,16
    8000932c:	00008067          	ret

0000000080009330 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    80009330:	fe010113          	addi	sp,sp,-32
    80009334:	00113c23          	sd	ra,24(sp)
    80009338:	00813823          	sd	s0,16(sp)
    8000933c:	00913423          	sd	s1,8(sp)
    80009340:	02010413          	addi	s0,sp,32
    80009344:	00050493          	mv	s1,a0
    80009348:	00001797          	auipc	a5,0x1
    8000934c:	2d078793          	addi	a5,a5,720 # 8000a618 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80009350:	00f53023          	sd	a5,0(a0)
    80009354:	fffff097          	auipc	ra,0xfffff
    80009358:	038080e7          	jalr	56(ra) # 8000838c <_ZN6ThreadD1Ev>
    8000935c:	00048513          	mv	a0,s1
    80009360:	fffff097          	auipc	ra,0xfffff
    80009364:	004080e7          	jalr	4(ra) # 80008364 <_ZdlPv>
    80009368:	01813083          	ld	ra,24(sp)
    8000936c:	01013403          	ld	s0,16(sp)
    80009370:	00813483          	ld	s1,8(sp)
    80009374:	02010113          	addi	sp,sp,32
    80009378:	00008067          	ret

000000008000937c <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    8000937c:	ff010113          	addi	sp,sp,-16
    80009380:	00113423          	sd	ra,8(sp)
    80009384:	00813023          	sd	s0,0(sp)
    80009388:	01010413          	addi	s0,sp,16
    8000938c:	00001797          	auipc	a5,0x1
    80009390:	2b478793          	addi	a5,a5,692 # 8000a640 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80009394:	00f53023          	sd	a5,0(a0)
    80009398:	fffff097          	auipc	ra,0xfffff
    8000939c:	ff4080e7          	jalr	-12(ra) # 8000838c <_ZN6ThreadD1Ev>
    800093a0:	00813083          	ld	ra,8(sp)
    800093a4:	00013403          	ld	s0,0(sp)
    800093a8:	01010113          	addi	sp,sp,16
    800093ac:	00008067          	ret

00000000800093b0 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    800093b0:	fe010113          	addi	sp,sp,-32
    800093b4:	00113c23          	sd	ra,24(sp)
    800093b8:	00813823          	sd	s0,16(sp)
    800093bc:	00913423          	sd	s1,8(sp)
    800093c0:	02010413          	addi	s0,sp,32
    800093c4:	00050493          	mv	s1,a0
    800093c8:	00001797          	auipc	a5,0x1
    800093cc:	27878793          	addi	a5,a5,632 # 8000a640 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    800093d0:	00f53023          	sd	a5,0(a0)
    800093d4:	fffff097          	auipc	ra,0xfffff
    800093d8:	fb8080e7          	jalr	-72(ra) # 8000838c <_ZN6ThreadD1Ev>
    800093dc:	00048513          	mv	a0,s1
    800093e0:	fffff097          	auipc	ra,0xfffff
    800093e4:	f84080e7          	jalr	-124(ra) # 80008364 <_ZdlPv>
    800093e8:	01813083          	ld	ra,24(sp)
    800093ec:	01013403          	ld	s0,16(sp)
    800093f0:	00813483          	ld	s1,8(sp)
    800093f4:	02010113          	addi	sp,sp,32
    800093f8:	00008067          	ret

00000000800093fc <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    800093fc:	fe010113          	addi	sp,sp,-32
    80009400:	00113c23          	sd	ra,24(sp)
    80009404:	00813823          	sd	s0,16(sp)
    80009408:	00913423          	sd	s1,8(sp)
    8000940c:	02010413          	addi	s0,sp,32
    80009410:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    80009414:	fffff097          	auipc	ra,0xfffff
    80009418:	e4c080e7          	jalr	-436(ra) # 80008260 <getc>
    8000941c:	0005059b          	sext.w	a1,a0
    80009420:	01b00793          	li	a5,27
    80009424:	00f58c63          	beq	a1,a5,8000943c <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    80009428:	0104b783          	ld	a5,16(s1)
    8000942c:	0087b503          	ld	a0,8(a5)
    80009430:	fffff097          	auipc	ra,0xfffff
    80009434:	3cc080e7          	jalr	972(ra) # 800087fc <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    80009438:	fddff06f          	j	80009414 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    8000943c:	00100793          	li	a5,1
    80009440:	00003717          	auipc	a4,0x3
    80009444:	2ef72823          	sw	a5,752(a4) # 8000c730 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    80009448:	0104b783          	ld	a5,16(s1)
    8000944c:	02100593          	li	a1,33
    80009450:	0087b503          	ld	a0,8(a5)
    80009454:	fffff097          	auipc	ra,0xfffff
    80009458:	3a8080e7          	jalr	936(ra) # 800087fc <_ZN9BufferCPP3putEi>
            td->sem->signal();
    8000945c:	0104b783          	ld	a5,16(s1)
    80009460:	0107b783          	ld	a5,16(a5)
    80009464:	0087b503          	ld	a0,8(a5)
    80009468:	fffff097          	auipc	ra,0xfffff
    8000946c:	d88080e7          	jalr	-632(ra) # 800081f0 <sem_signal>
        }
    80009470:	01813083          	ld	ra,24(sp)
    80009474:	01013403          	ld	s0,16(sp)
    80009478:	00813483          	ld	s1,8(sp)
    8000947c:	02010113          	addi	sp,sp,32
    80009480:	00008067          	ret

0000000080009484 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80009484:	fe010113          	addi	sp,sp,-32
    80009488:	00113c23          	sd	ra,24(sp)
    8000948c:	00813823          	sd	s0,16(sp)
    80009490:	00913423          	sd	s1,8(sp)
    80009494:	01213023          	sd	s2,0(sp)
    80009498:	02010413          	addi	s0,sp,32
    8000949c:	00050493          	mv	s1,a0
            int i = 0;
    800094a0:	00000913          	li	s2,0
            while (!threadEnd) {
    800094a4:	00003797          	auipc	a5,0x3
    800094a8:	28c78793          	addi	a5,a5,652 # 8000c730 <_ZN19ConsumerProducerCPP9threadEndE>
    800094ac:	0007a783          	lw	a5,0(a5)
    800094b0:	0007879b          	sext.w	a5,a5
    800094b4:	04079263          	bnez	a5,800094f8 <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    800094b8:	0104b783          	ld	a5,16(s1)
    800094bc:	0007a583          	lw	a1,0(a5)
    800094c0:	0305859b          	addiw	a1,a1,48
    800094c4:	0087b503          	ld	a0,8(a5)
    800094c8:	fffff097          	auipc	ra,0xfffff
    800094cc:	334080e7          	jalr	820(ra) # 800087fc <_ZN9BufferCPP3putEi>
                i++;
    800094d0:	0019051b          	addiw	a0,s2,1
    800094d4:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    800094d8:	0104b783          	ld	a5,16(s1)
    800094dc:	0007a783          	lw	a5,0(a5)
    800094e0:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    800094e4:	00500513          	li	a0,5
    800094e8:	02a7e53b          	remw	a0,a5,a0
    800094ec:	fffff097          	auipc	ra,0xfffff
    800094f0:	d3c080e7          	jalr	-708(ra) # 80008228 <time_sleep>
    800094f4:	fb1ff06f          	j	800094a4 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    800094f8:	0104b783          	ld	a5,16(s1)
    800094fc:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80009500:	0087b503          	ld	a0,8(a5)
    80009504:	fffff097          	auipc	ra,0xfffff
    80009508:	cec080e7          	jalr	-788(ra) # 800081f0 <sem_signal>
        }
    8000950c:	01813083          	ld	ra,24(sp)
    80009510:	01013403          	ld	s0,16(sp)
    80009514:	00813483          	ld	s1,8(sp)
    80009518:	00013903          	ld	s2,0(sp)
    8000951c:	02010113          	addi	sp,sp,32
    80009520:	00008067          	ret

0000000080009524 <_user_text_end>:
	...
