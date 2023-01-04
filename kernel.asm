
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00014117          	auipc	sp,0x14
    80000004:	00813103          	ld	sp,8(sp) # 80014008 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80001014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <_user_bss_end+0xffffffff7ffe87df>
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
    800010a4:	00013717          	auipc	a4,0x13
    800010a8:	3dc70713          	addi	a4,a4,988 # 80014480 <timer_scratch>
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
    80001140:	00013717          	auipc	a4,0x13
    80001144:	34070713          	addi	a4,a4,832 # 80014480 <timer_scratch>
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
    800011a8:	00013497          	auipc	s1,0x13
    800011ac:	27048493          	addi	s1,s1,624 # 80014418 <started>
    800011b0:	02050263          	beqz	a0,800011d4 <system_main+0x48>
    800011b4:	0004a783          	lw	a5,0(s1)
    800011b8:	0007879b          	sext.w	a5,a5
    800011bc:	fe078ce3          	beqz	a5,800011b4 <system_main+0x28>
    800011c0:	0ff0000f          	fence
    800011c4:	0000e517          	auipc	a0,0xe
    800011c8:	28c50513          	addi	a0,a0,652 # 8000f450 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x230>
    800011cc:	00001097          	auipc	ra,0x1
    800011d0:	a70080e7          	jalr	-1424(ra) # 80001c3c <panic>
    800011d4:	00001097          	auipc	ra,0x1
    800011d8:	9c4080e7          	jalr	-1596(ra) # 80001b98 <consoleinit>
    800011dc:	00001097          	auipc	ra,0x1
    800011e0:	150080e7          	jalr	336(ra) # 8000232c <printfinit>
    800011e4:	0000d517          	auipc	a0,0xd
    800011e8:	17450513          	addi	a0,a0,372 # 8000e358 <CONSOLE_STATUS+0x348>
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	aac080e7          	jalr	-1364(ra) # 80001c98 <__printf>
    800011f4:	0000e517          	auipc	a0,0xe
    800011f8:	22c50513          	addi	a0,a0,556 # 8000f420 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x200>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	a9c080e7          	jalr	-1380(ra) # 80001c98 <__printf>
    80001204:	0000d517          	auipc	a0,0xd
    80001208:	15450513          	addi	a0,a0,340 # 8000e358 <CONSOLE_STATUS+0x348>
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
    8000124c:	0000e517          	auipc	a0,0xe
    80001250:	1ec50513          	addi	a0,a0,492 # 8000f438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x218>
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
    800012a0:	00014517          	auipc	a0,0x14
    800012a4:	21050513          	addi	a0,a0,528 # 800154b0 <cpus>
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
    800012cc:	98030067          	jr	-1664(t1) # 80005c48 <main>

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
    8000130c:	0000e517          	auipc	a0,0xe
    80001310:	16c50513          	addi	a0,a0,364 # 8000f478 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x258>
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
    80001354:	0000e517          	auipc	a0,0xe
    80001358:	14c50513          	addi	a0,a0,332 # 8000f4a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x280>
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	8e0080e7          	jalr	-1824(ra) # 80001c3c <panic>

0000000080001364 <trapinit>:
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	0000e597          	auipc	a1,0xe
    80001378:	15458593          	addi	a1,a1,340 # 8000f4c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2a8>
    8000137c:	00014517          	auipc	a0,0x14
    80001380:	1b450513          	addi	a0,a0,436 # 80015530 <tickslock>
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
    80001410:	0000e517          	auipc	a0,0xe
    80001414:	10050513          	addi	a0,a0,256 # 8000f510 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2f0>
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	880080e7          	jalr	-1920(ra) # 80001c98 <__printf>
    80001420:	141025f3          	csrr	a1,sepc
    80001424:	14302673          	csrr	a2,stval
    80001428:	0000e517          	auipc	a0,0xe
    8000142c:	0f850513          	addi	a0,a0,248 # 8000f520 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x300>
    80001430:	00001097          	auipc	ra,0x1
    80001434:	868080e7          	jalr	-1944(ra) # 80001c98 <__printf>
    80001438:	0000e517          	auipc	a0,0xe
    8000143c:	10050513          	addi	a0,a0,256 # 8000f538 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x318>
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
    800014ac:	0000e517          	auipc	a0,0xe
    800014b0:	04450513          	addi	a0,a0,68 # 8000f4f0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2d0>
    800014b4:	00000097          	auipc	ra,0x0
    800014b8:	7e4080e7          	jalr	2020(ra) # 80001c98 <__printf>
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	01813083          	ld	ra,24(sp)
    800014c4:	00048513          	mv	a0,s1
    800014c8:	00813483          	ld	s1,8(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00000317          	auipc	t1,0x0
    800014d4:	3bc30067          	jr	956(t1) # 8000188c <plic_complete>
    800014d8:	00014517          	auipc	a0,0x14
    800014dc:	05850513          	addi	a0,a0,88 # 80015530 <tickslock>
    800014e0:	00001097          	auipc	ra,0x1
    800014e4:	48c080e7          	jalr	1164(ra) # 8000296c <acquire>
    800014e8:	00013717          	auipc	a4,0x13
    800014ec:	f3470713          	addi	a4,a4,-204 # 8001441c <ticks>
    800014f0:	00072783          	lw	a5,0(a4)
    800014f4:	00014517          	auipc	a0,0x14
    800014f8:	03c50513          	addi	a0,a0,60 # 80015530 <tickslock>
    800014fc:	0017879b          	addiw	a5,a5,1
    80001500:	00f72023          	sw	a5,0(a4)
    80001504:	00001097          	auipc	ra,0x1
    80001508:	534080e7          	jalr	1332(ra) # 80002a38 <release>
    8000150c:	f65ff06f          	j	80001470 <kerneltrap+0x8c>
    80001510:	00001097          	auipc	ra,0x1
    80001514:	090080e7          	jalr	144(ra) # 800025a0 <uartintr>
    80001518:	fa5ff06f          	j	800014bc <kerneltrap+0xd8>
    8000151c:	0000e517          	auipc	a0,0xe
    80001520:	fb450513          	addi	a0,a0,-76 # 8000f4d0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2b0>
    80001524:	00000097          	auipc	ra,0x0
    80001528:	718080e7          	jalr	1816(ra) # 80001c3c <panic>

000000008000152c <clockintr>:
    8000152c:	fe010113          	addi	sp,sp,-32
    80001530:	00813823          	sd	s0,16(sp)
    80001534:	00913423          	sd	s1,8(sp)
    80001538:	00113c23          	sd	ra,24(sp)
    8000153c:	02010413          	addi	s0,sp,32
    80001540:	00014497          	auipc	s1,0x14
    80001544:	ff048493          	addi	s1,s1,-16 # 80015530 <tickslock>
    80001548:	00048513          	mv	a0,s1
    8000154c:	00001097          	auipc	ra,0x1
    80001550:	420080e7          	jalr	1056(ra) # 8000296c <acquire>
    80001554:	00013717          	auipc	a4,0x13
    80001558:	ec870713          	addi	a4,a4,-312 # 8001441c <ticks>
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
    80001628:	0000e517          	auipc	a0,0xe
    8000162c:	ec850513          	addi	a0,a0,-312 # 8000f4f0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2d0>
    80001630:	00000097          	auipc	ra,0x0
    80001634:	668080e7          	jalr	1640(ra) # 80001c98 <__printf>
    80001638:	00048513          	mv	a0,s1
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	250080e7          	jalr	592(ra) # 8000188c <plic_complete>
    80001644:	00100513          	li	a0,1
    80001648:	f7dff06f          	j	800015c4 <devintr+0x40>
    8000164c:	00014517          	auipc	a0,0x14
    80001650:	ee450513          	addi	a0,a0,-284 # 80015530 <tickslock>
    80001654:	00001097          	auipc	ra,0x1
    80001658:	318080e7          	jalr	792(ra) # 8000296c <acquire>
    8000165c:	00013717          	auipc	a4,0x13
    80001660:	dc070713          	addi	a4,a4,-576 # 8001441c <ticks>
    80001664:	00072783          	lw	a5,0(a4)
    80001668:	00014517          	auipc	a0,0x14
    8000166c:	ec850513          	addi	a0,a0,-312 # 80015530 <tickslock>
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
    800019b8:	00014497          	auipc	s1,0x14
    800019bc:	ba048493          	addi	s1,s1,-1120 # 80015558 <cons>
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
    80001b1c:	00014917          	auipc	s2,0x14
    80001b20:	a3c90913          	addi	s2,s2,-1476 # 80015558 <cons>
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
    80001b7c:	00014517          	auipc	a0,0x14
    80001b80:	9dc50513          	addi	a0,a0,-1572 # 80015558 <cons>
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
    80001bac:	00014497          	auipc	s1,0x14
    80001bb0:	9ac48493          	addi	s1,s1,-1620 # 80015558 <cons>
    80001bb4:	00048513          	mv	a0,s1
    80001bb8:	0000e597          	auipc	a1,0xe
    80001bbc:	99058593          	addi	a1,a1,-1648 # 8000f548 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x328>
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
    80001c0c:	00014317          	auipc	t1,0x14
    80001c10:	a0433303          	ld	t1,-1532(t1) # 80015610 <devsw+0x10>
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00030067          	jr	t1

0000000080001c1c <console_write>:
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	00813403          	ld	s0,8(sp)
    80001c2c:	00014317          	auipc	t1,0x14
    80001c30:	9ec33303          	ld	t1,-1556(t1) # 80015618 <devsw+0x18>
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00030067          	jr	t1

0000000080001c3c <panic>:
    80001c3c:	fe010113          	addi	sp,sp,-32
    80001c40:	00113c23          	sd	ra,24(sp)
    80001c44:	00813823          	sd	s0,16(sp)
    80001c48:	00913423          	sd	s1,8(sp)
    80001c4c:	02010413          	addi	s0,sp,32
    80001c50:	00050493          	mv	s1,a0
    80001c54:	0000e517          	auipc	a0,0xe
    80001c58:	8fc50513          	addi	a0,a0,-1796 # 8000f550 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x330>
    80001c5c:	00014797          	auipc	a5,0x14
    80001c60:	a407ae23          	sw	zero,-1444(a5) # 800156b8 <pr+0x18>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	034080e7          	jalr	52(ra) # 80001c98 <__printf>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	028080e7          	jalr	40(ra) # 80001c98 <__printf>
    80001c78:	0000c517          	auipc	a0,0xc
    80001c7c:	6e050513          	addi	a0,a0,1760 # 8000e358 <CONSOLE_STATUS+0x348>
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	018080e7          	jalr	24(ra) # 80001c98 <__printf>
    80001c88:	00100793          	li	a5,1
    80001c8c:	00012717          	auipc	a4,0x12
    80001c90:	78f72a23          	sw	a5,1940(a4) # 80014420 <panicked>
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
    80001cd4:	00014317          	auipc	t1,0x14
    80001cd8:	9cc30313          	addi	t1,t1,-1588 # 800156a0 <pr>
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
    80001d94:	0000dd97          	auipc	s11,0xd
    80001d98:	7e4d8d93          	addi	s11,s11,2020 # 8000f578 <digits>
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
    80001f9c:	0000dd97          	auipc	s11,0xd
    80001fa0:	5dcd8d93          	addi	s11,s11,1500 # 8000f578 <digits>
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
    800020e4:	00013517          	auipc	a0,0x13
    800020e8:	5bc50513          	addi	a0,a0,1468 # 800156a0 <pr>
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
    80002124:	0000dd97          	auipc	s11,0xd
    80002128:	454d8d93          	addi	s11,s11,1108 # 8000f578 <digits>
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
    800021c8:	0000dd97          	auipc	s11,0xd
    800021cc:	3b0d8d93          	addi	s11,s11,944 # 8000f578 <digits>
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
    80002220:	0000dd97          	auipc	s11,0xd
    80002224:	358d8d93          	addi	s11,s11,856 # 8000f578 <digits>
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
    8000226c:	0000dc97          	auipc	s9,0xd
    80002270:	2ecc8c93          	addi	s9,s9,748 # 8000f558 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x338>
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
    8000231c:	0000d517          	auipc	a0,0xd
    80002320:	24450513          	addi	a0,a0,580 # 8000f560 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x340>
    80002324:	00000097          	auipc	ra,0x0
    80002328:	918080e7          	jalr	-1768(ra) # 80001c3c <panic>

000000008000232c <printfinit>:
    8000232c:	fe010113          	addi	sp,sp,-32
    80002330:	00813823          	sd	s0,16(sp)
    80002334:	00913423          	sd	s1,8(sp)
    80002338:	00113c23          	sd	ra,24(sp)
    8000233c:	02010413          	addi	s0,sp,32
    80002340:	00013497          	auipc	s1,0x13
    80002344:	36048493          	addi	s1,s1,864 # 800156a0 <pr>
    80002348:	00048513          	mv	a0,s1
    8000234c:	0000d597          	auipc	a1,0xd
    80002350:	22458593          	addi	a1,a1,548 # 8000f570 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x350>
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
    800023b8:	00012797          	auipc	a5,0x12
    800023bc:	0687a783          	lw	a5,104(a5) # 80014420 <panicked>
    800023c0:	00078463          	beqz	a5,800023c8 <uartputc+0x10>
    800023c4:	0000006f          	j	800023c4 <uartputc+0xc>
    800023c8:	fd010113          	addi	sp,sp,-48
    800023cc:	02813023          	sd	s0,32(sp)
    800023d0:	00913c23          	sd	s1,24(sp)
    800023d4:	01213823          	sd	s2,16(sp)
    800023d8:	01313423          	sd	s3,8(sp)
    800023dc:	02113423          	sd	ra,40(sp)
    800023e0:	03010413          	addi	s0,sp,48
    800023e4:	00012917          	auipc	s2,0x12
    800023e8:	04490913          	addi	s2,s2,68 # 80014428 <uart_tx_r>
    800023ec:	00093783          	ld	a5,0(s2)
    800023f0:	00012497          	auipc	s1,0x12
    800023f4:	04048493          	addi	s1,s1,64 # 80014430 <uart_tx_w>
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
    80002440:	00013597          	auipc	a1,0x13
    80002444:	28058593          	addi	a1,a1,640 # 800156c0 <uart_tx_buf>
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
    800024bc:	00012717          	auipc	a4,0x12
    800024c0:	f6472703          	lw	a4,-156(a4) # 80014420 <panicked>
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
    80002500:	00012617          	auipc	a2,0x12
    80002504:	f2860613          	addi	a2,a2,-216 # 80014428 <uart_tx_r>
    80002508:	00012517          	auipc	a0,0x12
    8000250c:	f2850513          	addi	a0,a0,-216 # 80014430 <uart_tx_w>
    80002510:	00063783          	ld	a5,0(a2)
    80002514:	00053703          	ld	a4,0(a0)
    80002518:	04f70263          	beq	a4,a5,8000255c <uartstart+0x68>
    8000251c:	100005b7          	lui	a1,0x10000
    80002520:	00013817          	auipc	a6,0x13
    80002524:	1a080813          	addi	a6,a6,416 # 800156c0 <uart_tx_buf>
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
    800025e4:	00012617          	auipc	a2,0x12
    800025e8:	e4460613          	addi	a2,a2,-444 # 80014428 <uart_tx_r>
    800025ec:	00012517          	auipc	a0,0x12
    800025f0:	e4450513          	addi	a0,a0,-444 # 80014430 <uart_tx_w>
    800025f4:	00063783          	ld	a5,0(a2)
    800025f8:	00053703          	ld	a4,0(a0)
    800025fc:	04f70263          	beq	a4,a5,80002640 <uartintr+0xa0>
    80002600:	100005b7          	lui	a1,0x10000
    80002604:	00013817          	auipc	a6,0x13
    80002608:	0bc80813          	addi	a6,a6,188 # 800156c0 <uart_tx_buf>
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
    80002654:	00012617          	auipc	a2,0x12
    80002658:	dd460613          	addi	a2,a2,-556 # 80014428 <uart_tx_r>
    8000265c:	00012517          	auipc	a0,0x12
    80002660:	dd450513          	addi	a0,a0,-556 # 80014430 <uart_tx_w>
    80002664:	00063783          	ld	a5,0(a2)
    80002668:	00053703          	ld	a4,0(a0)
    8000266c:	04f70263          	beq	a4,a5,800026b0 <uartintr+0x110>
    80002670:	100005b7          	lui	a1,0x10000
    80002674:	00013817          	auipc	a6,0x13
    80002678:	04c80813          	addi	a6,a6,76 # 800156c0 <uart_tx_buf>
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
    800026c4:	00015497          	auipc	s1,0x15
    800026c8:	95b48493          	addi	s1,s1,-1701 # 8001701f <_user_bss_end+0xfff>
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
    80002700:	00014a97          	auipc	s5,0x14
    80002704:	920a8a93          	addi	s5,s5,-1760 # 80016020 <_user_bss_end>
    80002708:	0754ec63          	bltu	s1,s5,80002780 <kinit+0xc8>
    8000270c:	0734fa63          	bgeu	s1,s3,80002780 <kinit+0xc8>
    80002710:	00088a37          	lui	s4,0x88
    80002714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002718:	00012917          	auipc	s2,0x12
    8000271c:	d2090913          	addi	s2,s2,-736 # 80014438 <kmem>
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
    80002780:	0000d517          	auipc	a0,0xd
    80002784:	e1050513          	addi	a0,a0,-496 # 8000f590 <digits+0x18>
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
    800027d4:	00014a97          	auipc	s5,0x14
    800027d8:	84ca8a93          	addi	s5,s5,-1972 # 80016020 <_user_bss_end>
    800027dc:	0954e263          	bltu	s1,s5,80002860 <freerange+0xd0>
    800027e0:	01100993          	li	s3,17
    800027e4:	01b99993          	slli	s3,s3,0x1b
    800027e8:	0734fc63          	bgeu	s1,s3,80002860 <freerange+0xd0>
    800027ec:	00058a13          	mv	s4,a1
    800027f0:	00012917          	auipc	s2,0x12
    800027f4:	c4890913          	addi	s2,s2,-952 # 80014438 <kmem>
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
    80002860:	0000d517          	auipc	a0,0xd
    80002864:	d3050513          	addi	a0,a0,-720 # 8000f590 <digits+0x18>
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
    8000288c:	00013797          	auipc	a5,0x13
    80002890:	79478793          	addi	a5,a5,1940 # 80016020 <_user_bss_end>
    80002894:	00050493          	mv	s1,a0
    80002898:	04f56463          	bltu	a0,a5,800028e0 <kfree+0x70>
    8000289c:	01100793          	li	a5,17
    800028a0:	01b79793          	slli	a5,a5,0x1b
    800028a4:	02f57e63          	bgeu	a0,a5,800028e0 <kfree+0x70>
    800028a8:	00001637          	lui	a2,0x1
    800028ac:	00100593          	li	a1,1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	478080e7          	jalr	1144(ra) # 80002d28 <__memset>
    800028b8:	00012797          	auipc	a5,0x12
    800028bc:	b8078793          	addi	a5,a5,-1152 # 80014438 <kmem>
    800028c0:	0007b703          	ld	a4,0(a5)
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00e4b023          	sd	a4,0(s1)
    800028d0:	0097b023          	sd	s1,0(a5)
    800028d4:	00813483          	ld	s1,8(sp)
    800028d8:	02010113          	addi	sp,sp,32
    800028dc:	00008067          	ret
    800028e0:	0000d517          	auipc	a0,0xd
    800028e4:	cb050513          	addi	a0,a0,-848 # 8000f590 <digits+0x18>
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	354080e7          	jalr	852(ra) # 80001c3c <panic>

00000000800028f0 <kalloc>:
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00813823          	sd	s0,16(sp)
    800028f8:	00913423          	sd	s1,8(sp)
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	02010413          	addi	s0,sp,32
    80002904:	00012797          	auipc	a5,0x12
    80002908:	b3478793          	addi	a5,a5,-1228 # 80014438 <kmem>
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
    80002a10:	0000d517          	auipc	a0,0xd
    80002a14:	b8850513          	addi	a0,a0,-1144 # 8000f598 <digits+0x20>
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
    80002a58:	0000d517          	auipc	a0,0xd
    80002a5c:	b4850513          	addi	a0,a0,-1208 # 8000f5a0 <digits+0x28>
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
    80002ae0:	0000d517          	auipc	a0,0xd
    80002ae4:	ae050513          	addi	a0,a0,-1312 # 8000f5c0 <digits+0x48>
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	154080e7          	jalr	340(ra) # 80001c3c <panic>
    80002af0:	0000d517          	auipc	a0,0xd
    80002af4:	ab850513          	addi	a0,a0,-1352 # 8000f5a8 <digits+0x30>
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
    80002c1c:	0000d517          	auipc	a0,0xd
    80002c20:	9a450513          	addi	a0,a0,-1628 # 8000f5c0 <digits+0x48>
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	018080e7          	jalr	24(ra) # 80001c3c <panic>
    80002c2c:	0000d517          	auipc	a0,0xd
    80002c30:	97c50513          	addi	a0,a0,-1668 # 8000f5a8 <digits+0x30>
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
    80002d08:	0000d517          	auipc	a0,0xd
    80002d0c:	8e050513          	addi	a0,a0,-1824 # 8000f5e8 <digits+0x70>
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	f2c080e7          	jalr	-212(ra) # 80001c3c <panic>
    80002d18:	0000d517          	auipc	a0,0xd
    80002d1c:	8b050513          	addi	a0,a0,-1872 # 8000f5c8 <digits+0x50>
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

0000000080004000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:

.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
sd ra, 0 * 8(a0)
    80004000:	00153023          	sd	ra,0(a0)
sd sp, 1 * 8(a0)
    80004004:	00253423          	sd	sp,8(a0)

ld ra, 0 * 8(a1)
    80004008:	0005b083          	ld	ra,0(a1)
ld sp, 1 * 8(a1)
    8000400c:	0085b103          	ld	sp,8(a1)

ret
    80004010:	00008067          	ret

0000000080004014 <KERNEL_TEXT_START>:
    80004014:	0000                	unimp
    80004016:	8000                	0x8000
    80004018:	0000                	unimp
	...

000000008000401c <KERNEL_TEXT_END>:
    8000401c:	b520                	fsd	fs0,104(a0)
    8000401e:	8000                	0x8000
    80004020:	0000                	unimp
	...

0000000080004024 <USER_TEXT_START>:
    80004024:	c000                	sw	s0,0(s0)
    80004026:	8000                	0x8000
    80004028:	0000                	unimp
	...

000000008000402c <USER_TEXT_END>:
    8000402c:	d6e8                	sw	a0,108(a3)
    8000402e:	8000                	0x8000
    80004030:	0000                	unimp
	...

0000000080004034 <USER_BSS_START>:
    80004034:	6000                	ld	s0,0(s0)
    80004036:	8001                	c.srli64	s0
    80004038:	0000                	unimp
	...

000000008000403c <USER_BSS_END>:
    8000403c:	6020                	ld	s0,64(s0)
    8000403e:	8001                	c.srli64	s0
    80004040:	0000                	unimp
	...

0000000080004044 <USER_DATA_START>:
    80004044:	3000                	fld	fs0,32(s0)
    80004046:	8001                	c.srli64	s0
    80004048:	0000                	unimp
	...

000000008000404c <USER_DATA_END>:
    8000404c:	3011                	0x3011
    8000404e:	8001                	c.srli64	s0
    80004050:	0000                	unimp
	...

0000000080004054 <USER_RODATA_START>:
    80004054:	e000                	sd	s0,0(s0)
    80004056:	8000                	0x8000
    80004058:	0000                	unimp
	...

000000008000405c <USER_RODATA_END>:
    8000405c:	f5f0                	sd	a2,232(a1)
    8000405e:	8000                	0x8000
	...

0000000080004070 <interruptvec>:
.globl interrupt
.globl interruptvec
.align 4
interruptvec:

addi sp, sp, -256
    80004070:	f0010113          	addi	sp,sp,-256
.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80004074:	00113423          	sd	ra,8(sp)
    80004078:	00213823          	sd	sp,16(sp)
    8000407c:	00313c23          	sd	gp,24(sp)
    80004080:	02413023          	sd	tp,32(sp)
    80004084:	02513423          	sd	t0,40(sp)
    80004088:	02613823          	sd	t1,48(sp)
    8000408c:	02713c23          	sd	t2,56(sp)
    80004090:	04813023          	sd	s0,64(sp)
    80004094:	04913423          	sd	s1,72(sp)
    80004098:	04a13823          	sd	a0,80(sp)
    8000409c:	04b13c23          	sd	a1,88(sp)
    800040a0:	06c13023          	sd	a2,96(sp)
    800040a4:	06d13423          	sd	a3,104(sp)
    800040a8:	06e13823          	sd	a4,112(sp)
    800040ac:	06f13c23          	sd	a5,120(sp)
    800040b0:	09013023          	sd	a6,128(sp)
    800040b4:	09113423          	sd	a7,136(sp)
    800040b8:	09213823          	sd	s2,144(sp)
    800040bc:	09313c23          	sd	s3,152(sp)
    800040c0:	0b413023          	sd	s4,160(sp)
    800040c4:	0b513423          	sd	s5,168(sp)
    800040c8:	0b613823          	sd	s6,176(sp)
    800040cc:	0b713c23          	sd	s7,184(sp)
    800040d0:	0d813023          	sd	s8,192(sp)
    800040d4:	0d913423          	sd	s9,200(sp)
    800040d8:	0da13823          	sd	s10,208(sp)
    800040dc:	0db13c23          	sd	s11,216(sp)
    800040e0:	0fc13023          	sd	t3,224(sp)
    800040e4:	0fd13423          	sd	t4,232(sp)
    800040e8:	0fe13823          	sd	t5,240(sp)
    800040ec:	0ff13c23          	sd	t6,248(sp)

call interrupt
    800040f0:	36c020ef          	jal	ra,8000645c <interrupt>

.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800040f4:	00813083          	ld	ra,8(sp)
    800040f8:	01013103          	ld	sp,16(sp)
    800040fc:	01813183          	ld	gp,24(sp)
    80004100:	02013203          	ld	tp,32(sp)
    80004104:	02813283          	ld	t0,40(sp)
    80004108:	03013303          	ld	t1,48(sp)
    8000410c:	03813383          	ld	t2,56(sp)
    80004110:	04013403          	ld	s0,64(sp)
    80004114:	04813483          	ld	s1,72(sp)
    80004118:	05013503          	ld	a0,80(sp)
    8000411c:	05813583          	ld	a1,88(sp)
    80004120:	06013603          	ld	a2,96(sp)
    80004124:	06813683          	ld	a3,104(sp)
    80004128:	07013703          	ld	a4,112(sp)
    8000412c:	07813783          	ld	a5,120(sp)
    80004130:	08013803          	ld	a6,128(sp)
    80004134:	08813883          	ld	a7,136(sp)
    80004138:	09013903          	ld	s2,144(sp)
    8000413c:	09813983          	ld	s3,152(sp)
    80004140:	0a013a03          	ld	s4,160(sp)
    80004144:	0a813a83          	ld	s5,168(sp)
    80004148:	0b013b03          	ld	s6,176(sp)
    8000414c:	0b813b83          	ld	s7,184(sp)
    80004150:	0c013c03          	ld	s8,192(sp)
    80004154:	0c813c83          	ld	s9,200(sp)
    80004158:	0d013d03          	ld	s10,208(sp)
    8000415c:	0d813d83          	ld	s11,216(sp)
    80004160:	0e013e03          	ld	t3,224(sp)
    80004164:	0e813e83          	ld	t4,232(sp)
    80004168:	0f013f03          	ld	t5,240(sp)
    8000416c:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    80004170:	10010113          	addi	sp,sp,256



sret
    80004174:	10200073          	sret
	...

0000000080004180 <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
addi sp, sp, -256
    80004180:	f0010113          	addi	sp,sp,-256
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80004184:	00313c23          	sd	gp,24(sp)
    80004188:	02413023          	sd	tp,32(sp)
    8000418c:	02513423          	sd	t0,40(sp)
    80004190:	02613823          	sd	t1,48(sp)
    80004194:	02713c23          	sd	t2,56(sp)
    80004198:	04813023          	sd	s0,64(sp)
    8000419c:	04913423          	sd	s1,72(sp)
    800041a0:	04a13823          	sd	a0,80(sp)
    800041a4:	04b13c23          	sd	a1,88(sp)
    800041a8:	06c13023          	sd	a2,96(sp)
    800041ac:	06d13423          	sd	a3,104(sp)
    800041b0:	06e13823          	sd	a4,112(sp)
    800041b4:	06f13c23          	sd	a5,120(sp)
    800041b8:	09013023          	sd	a6,128(sp)
    800041bc:	09113423          	sd	a7,136(sp)
    800041c0:	09213823          	sd	s2,144(sp)
    800041c4:	09313c23          	sd	s3,152(sp)
    800041c8:	0b413023          	sd	s4,160(sp)
    800041cc:	0b513423          	sd	s5,168(sp)
    800041d0:	0b613823          	sd	s6,176(sp)
    800041d4:	0b713c23          	sd	s7,184(sp)
    800041d8:	0d813023          	sd	s8,192(sp)
    800041dc:	0d913423          	sd	s9,200(sp)
    800041e0:	0da13823          	sd	s10,208(sp)
    800041e4:	0db13c23          	sd	s11,216(sp)
    800041e8:	0fc13023          	sd	t3,224(sp)
    800041ec:	0fd13423          	sd	t4,232(sp)
    800041f0:	0fe13823          	sd	t5,240(sp)
    800041f4:	0ff13c23          	sd	t6,248(sp)
ret
    800041f8:	00008067          	ret

00000000800041fc <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800041fc:	01813183          	ld	gp,24(sp)
    80004200:	02013203          	ld	tp,32(sp)
    80004204:	02813283          	ld	t0,40(sp)
    80004208:	03013303          	ld	t1,48(sp)
    8000420c:	03813383          	ld	t2,56(sp)
    80004210:	04013403          	ld	s0,64(sp)
    80004214:	04813483          	ld	s1,72(sp)
    80004218:	05013503          	ld	a0,80(sp)
    8000421c:	05813583          	ld	a1,88(sp)
    80004220:	06013603          	ld	a2,96(sp)
    80004224:	06813683          	ld	a3,104(sp)
    80004228:	07013703          	ld	a4,112(sp)
    8000422c:	07813783          	ld	a5,120(sp)
    80004230:	08013803          	ld	a6,128(sp)
    80004234:	08813883          	ld	a7,136(sp)
    80004238:	09013903          	ld	s2,144(sp)
    8000423c:	09813983          	ld	s3,152(sp)
    80004240:	0a013a03          	ld	s4,160(sp)
    80004244:	0a813a83          	ld	s5,168(sp)
    80004248:	0b013b03          	ld	s6,176(sp)
    8000424c:	0b813b83          	ld	s7,184(sp)
    80004250:	0c013c03          	ld	s8,192(sp)
    80004254:	0c813c83          	ld	s9,200(sp)
    80004258:	0d013d03          	ld	s10,208(sp)
    8000425c:	0d813d83          	ld	s11,216(sp)
    80004260:	0e013e03          	ld	t3,224(sp)
    80004264:	0e813e83          	ld	t4,232(sp)
    80004268:	0f013f03          	ld	t5,240(sp)
    8000426c:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    80004270:	10010113          	addi	sp,sp,256
ret
    80004274:	00008067          	ret

0000000080004278 <_ZN10KSemaphore4waitEv>:
#include"../../../h/kernel_lib.h"

KSemaphore* KSemaphore::activeSemaphores = nullptr;
ObjectCache* KSemaphore::cache = nullptr;
int KSemaphore::wait(){
    if(val > 0)
    80004278:	00852783          	lw	a5,8(a0)
    8000427c:	00078a63          	beqz	a5,80004290 <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    80004280:	fff7879b          	addiw	a5,a5,-1
    80004284:	00f52423          	sw	a5,8(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80004288:	00000513          	li	a0,0
}
    8000428c:	00008067          	ret
int KSemaphore::wait(){
    80004290:	fe010113          	addi	sp,sp,-32
    80004294:	00113c23          	sd	ra,24(sp)
    80004298:	00813823          	sd	s0,16(sp)
    8000429c:	00913423          	sd	s1,8(sp)
    800042a0:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    800042a4:	00010497          	auipc	s1,0x10
    800042a8:	0dc48493          	addi	s1,s1,220 # 80014380 <_ZN3TCB7runningE>
    800042ac:	0004b583          	ld	a1,0(s1)
            allocator.mem_free(this->stack);
        }
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    800042b0:	0205a823          	sw	zero,48(a1)
        blocked.insert(TCB::running);
    800042b4:	01050513          	addi	a0,a0,16
    800042b8:	00001097          	auipc	ra,0x1
    800042bc:	b44080e7          	jalr	-1212(ra) # 80004dfc <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    800042c0:	00001097          	auipc	ra,0x1
    800042c4:	948080e7          	jalr	-1720(ra) # 80004c08 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    800042c8:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    800042cc:	0307a703          	lw	a4,48(a5)
    800042d0:	02071263          	bnez	a4,800042f4 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    800042d4:	00100713          	li	a4,1
    800042d8:	02e7a823          	sw	a4,48(a5)
    return 0;
    800042dc:	00000513          	li	a0,0
}
    800042e0:	01813083          	ld	ra,24(sp)
    800042e4:	01013403          	ld	s0,16(sp)
    800042e8:	00813483          	ld	s1,8(sp)
    800042ec:	02010113          	addi	sp,sp,32
    800042f0:	00008067          	ret
            return -2;
    800042f4:	ffe00513          	li	a0,-2
    800042f8:	fe9ff06f          	j	800042e0 <_ZN10KSemaphore4waitEv+0x68>

00000000800042fc <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    800042fc:	01053783          	ld	a5,16(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    80004300:	02078e63          	beqz	a5,8000433c <_ZN10KSemaphore6signalEv+0x40>
{
    80004304:	ff010113          	addi	sp,sp,-16
    80004308:	00113423          	sd	ra,8(sp)
    8000430c:	00813023          	sd	s0,0(sp)
    80004310:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80004314:	01050513          	addi	a0,a0,16
    80004318:	00001097          	auipc	ra,0x1
    8000431c:	b24080e7          	jalr	-1244(ra) # 80004e3c <_ZN8TcbQueue6removeEv>
    80004320:	00000097          	auipc	ra,0x0
    80004324:	220080e7          	jalr	544(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    80004328:	00000513          	li	a0,0
    8000432c:	00813083          	ld	ra,8(sp)
    80004330:	00013403          	ld	s0,0(sp)
    80004334:	01010113          	addi	sp,sp,16
    80004338:	00008067          	ret
        val++;
    8000433c:	00852783          	lw	a5,8(a0)
    80004340:	0017879b          	addiw	a5,a5,1
    80004344:	00f52423          	sw	a5,8(a0)
}
    80004348:	00000513          	li	a0,0
    8000434c:	00008067          	ret

0000000080004350 <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    80004350:	fe010113          	addi	sp,sp,-32
    80004354:	00113c23          	sd	ra,24(sp)
    80004358:	00813823          	sd	s0,16(sp)
    8000435c:	00913423          	sd	s1,8(sp)
    80004360:	02010413          	addi	s0,sp,32
    80004364:	00050493          	mv	s1,a0
    80004368:	0104b783          	ld	a5,16(s1)
{
    while(!blocked.isEmpty()){
    8000436c:	02078263          	beqz	a5,80004390 <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    80004370:	01048513          	addi	a0,s1,16
    80004374:	00001097          	auipc	ra,0x1
    80004378:	ac8080e7          	jalr	-1336(ra) # 80004e3c <_ZN8TcbQueue6removeEv>
    8000437c:	00100793          	li	a5,1
    80004380:	02f52823          	sw	a5,48(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    80004384:	00000097          	auipc	ra,0x0
    80004388:	1bc080e7          	jalr	444(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    8000438c:	fddff06f          	j	80004368 <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    80004390:	01813083          	ld	ra,24(sp)
    80004394:	01013403          	ld	s0,16(sp)
    80004398:	00813483          	ld	s1,8(sp)
    8000439c:	02010113          	addi	sp,sp,32
    800043a0:	00008067          	ret

00000000800043a4 <_ZN10KSemaphore5closeEPS_>:

int KSemaphore::close(KSemaphore* sem)
{
    800043a4:	fe010113          	addi	sp,sp,-32
    800043a8:	00113c23          	sd	ra,24(sp)
    800043ac:	00813823          	sd	s0,16(sp)
    800043b0:	00913423          	sd	s1,8(sp)
    800043b4:	02010413          	addi	s0,sp,32
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    800043b8:	00010797          	auipc	a5,0x10
    800043bc:	fa078793          	addi	a5,a5,-96 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    800043c0:	0007b483          	ld	s1,0(a5)
    800043c4:	00000793          	li	a5,0
    while(cur)
    800043c8:	00048a63          	beqz	s1,800043dc <_ZN10KSemaphore5closeEPS_+0x38>
    {
        if(cur == sem)
    800043cc:	00a48863          	beq	s1,a0,800043dc <_ZN10KSemaphore5closeEPS_+0x38>
            break;
        prev = cur;
    800043d0:	00048793          	mv	a5,s1
        cur = cur->next;
    800043d4:	0004b483          	ld	s1,0(s1)
    while(cur)
    800043d8:	ff1ff06f          	j	800043c8 <_ZN10KSemaphore5closeEPS_+0x24>
    }
    if(cur)
    800043dc:	06048063          	beqz	s1,8000443c <_ZN10KSemaphore5closeEPS_+0x98>
    {
        if(prev)
    800043e0:	04078663          	beqz	a5,8000442c <_ZN10KSemaphore5closeEPS_+0x88>
            prev->next = cur->next;
    800043e4:	0004b703          	ld	a4,0(s1)
    800043e8:	00e7b023          	sd	a4,0(a5)
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
    800043ec:	0004b023          	sd	zero,0(s1)
        delete cur;
    800043f0:	00048513          	mv	a0,s1
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	f5c080e7          	jalr	-164(ra) # 80004350 <_ZN10KSemaphoreD1Ev>
{
    static ObjectCache* cache; 
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    800043fc:	00048593          	mv	a1,s1
    80004400:	00010797          	auipc	a5,0x10
    80004404:	f5078793          	addi	a5,a5,-176 # 80014350 <_ZN10KSemaphore5cacheE>
    80004408:	0007b503          	ld	a0,0(a5)
    8000440c:	00004097          	auipc	ra,0x4
    80004410:	39c080e7          	jalr	924(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
        return 0;
    80004414:	00000513          	li	a0,0
    }
    else return -1;

}
    80004418:	01813083          	ld	ra,24(sp)
    8000441c:	01013403          	ld	s0,16(sp)
    80004420:	00813483          	ld	s1,8(sp)
    80004424:	02010113          	addi	sp,sp,32
    80004428:	00008067          	ret
            activeSemaphores = cur->next;
    8000442c:	0004b783          	ld	a5,0(s1)
    80004430:	00010717          	auipc	a4,0x10
    80004434:	f2f73423          	sd	a5,-216(a4) # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80004438:	fb5ff06f          	j	800043ec <_ZN10KSemaphore5closeEPS_+0x48>
    else return -1;
    8000443c:	fff00513          	li	a0,-1
    80004440:	fd9ff06f          	j	80004418 <_ZN10KSemaphore5closeEPS_+0x74>

0000000080004444 <_ZN10KSemaphore6existsEPS_>:

bool KSemaphore::exists(KSemaphore* sem)
{
    80004444:	ff010113          	addi	sp,sp,-16
    80004448:	00813423          	sd	s0,8(sp)
    8000444c:	01010413          	addi	s0,sp,16
    KSemaphore* cur = activeSemaphores;
    80004450:	00010797          	auipc	a5,0x10
    80004454:	f0878793          	addi	a5,a5,-248 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80004458:	0007b783          	ld	a5,0(a5)
    while(cur)
    8000445c:	00078863          	beqz	a5,8000446c <_ZN10KSemaphore6existsEPS_+0x28>
    {
        if(cur == sem)
    80004460:	00a78e63          	beq	a5,a0,8000447c <_ZN10KSemaphore6existsEPS_+0x38>
            return true;
        cur = cur->next;
    80004464:	0007b783          	ld	a5,0(a5)
    while(cur)
    80004468:	ff5ff06f          	j	8000445c <_ZN10KSemaphore6existsEPS_+0x18>
    }
    return false;
    8000446c:	00000513          	li	a0,0
}
    80004470:	00813403          	ld	s0,8(sp)
    80004474:	01010113          	addi	sp,sp,16
    80004478:	00008067          	ret
            return true;
    8000447c:	00100513          	li	a0,1
    80004480:	ff1ff06f          	j	80004470 <_ZN10KSemaphore6existsEPS_+0x2c>

0000000080004484 <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    80004484:	ff010113          	addi	sp,sp,-16
    80004488:	00813423          	sd	s0,8(sp)
    8000448c:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    80004490:	00852683          	lw	a3,8(a0)
    80004494:	0085a703          	lw	a4,8(a1)
    80004498:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    8000449c:	0007cc63          	bltz	a5,800044b4 <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    800044a0:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    800044a4:	00078513          	mv	a0,a5
    800044a8:	00813403          	ld	s0,8(sp)
    800044ac:	01010113          	addi	sp,sp,16
    800044b0:	00008067          	ret
        x2->sleep_time = -diff;
    800044b4:	40d7073b          	subw	a4,a4,a3
    800044b8:	00e5b423          	sd	a4,8(a1)
    800044bc:	fe9ff06f          	j	800044a4 <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

00000000800044c0 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    800044c0:	ff010113          	addi	sp,sp,-16
    800044c4:	00813423          	sd	s0,8(sp)
    800044c8:	01010413          	addi	s0,sp,16
    800044cc:	00100793          	li	a5,1
    800044d0:	00f50863          	beq	a0,a5,800044e0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800044d4:	00813403          	ld	s0,8(sp)
    800044d8:	01010113          	addi	sp,sp,16
    800044dc:	00008067          	ret
    800044e0:	000107b7          	lui	a5,0x10
    800044e4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800044e8:	fef596e3          	bne	a1,a5,800044d4 <_Z41__static_initialization_and_destruction_0ii+0x14>
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    800044ec:	00010797          	auipc	a5,0x10
    800044f0:	f5478793          	addi	a5,a5,-172 # 80014440 <_ZN9Scheduler5queueE>
    800044f4:	0007b023          	sd	zero,0(a5)
    800044f8:	0007b423          	sd	zero,8(a5)
    800044fc:	0007a823          	sw	zero,16(a5)
    80004500:	0007bc23          	sd	zero,24(a5)
    80004504:	0207b023          	sd	zero,32(a5)
    80004508:	0207a423          	sw	zero,40(a5)
    8000450c:	fc9ff06f          	j	800044d4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080004510 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80004510:	ff010113          	addi	sp,sp,-16
    80004514:	00113423          	sd	ra,8(sp)
    80004518:	00813023          	sd	s0,0(sp)
    8000451c:	01010413          	addi	s0,sp,16
    80004520:	00010517          	auipc	a0,0x10
    80004524:	f2050513          	addi	a0,a0,-224 # 80014440 <_ZN9Scheduler5queueE>
    80004528:	00001097          	auipc	ra,0x1
    8000452c:	914080e7          	jalr	-1772(ra) # 80004e3c <_ZN8TcbQueue6removeEv>
    80004530:	00813083          	ld	ra,8(sp)
    80004534:	00013403          	ld	s0,0(sp)
    80004538:	01010113          	addi	sp,sp,16
    8000453c:	00008067          	ret

0000000080004540 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    80004540:	ff010113          	addi	sp,sp,-16
    80004544:	00113423          	sd	ra,8(sp)
    80004548:	00813023          	sd	s0,0(sp)
    8000454c:	01010413          	addi	s0,sp,16
    80004550:	00050593          	mv	a1,a0
    80004554:	00010517          	auipc	a0,0x10
    80004558:	eec50513          	addi	a0,a0,-276 # 80014440 <_ZN9Scheduler5queueE>
    8000455c:	00001097          	auipc	ra,0x1
    80004560:	8a0080e7          	jalr	-1888(ra) # 80004dfc <_ZN8TcbQueue6insertEP3TCB>
    80004564:	00813083          	ld	ra,8(sp)
    80004568:	00013403          	ld	s0,0(sp)
    8000456c:	01010113          	addi	sp,sp,16
    80004570:	00008067          	ret

0000000080004574 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    80004574:	ff010113          	addi	sp,sp,-16
    80004578:	00813423          	sd	s0,8(sp)
    8000457c:	01010413          	addi	s0,sp,16
    80004580:	00813403          	ld	s0,8(sp)
    80004584:	01010113          	addi	sp,sp,16
    80004588:	00008067          	ret

000000008000458c <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    8000458c:	ff010113          	addi	sp,sp,-16
    80004590:	00813423          	sd	s0,8(sp)
    80004594:	01010413          	addi	s0,sp,16
    80004598:	00813403          	ld	s0,8(sp)
    8000459c:	01010113          	addi	sp,sp,16
    800045a0:	00008067          	ret

00000000800045a4 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    800045a4:	ff010113          	addi	sp,sp,-16
    800045a8:	00113423          	sd	ra,8(sp)
    800045ac:	00813023          	sd	s0,0(sp)
    800045b0:	01010413          	addi	s0,sp,16
    800045b4:	00010517          	auipc	a0,0x10
    800045b8:	e8c50513          	addi	a0,a0,-372 # 80014440 <_ZN9Scheduler5queueE>
    800045bc:	00001097          	auipc	ra,0x1
    800045c0:	8ec080e7          	jalr	-1812(ra) # 80004ea8 <_ZN8TcbQueue10printQueueEv>
    800045c4:	00813083          	ld	ra,8(sp)
    800045c8:	00013403          	ld	s0,0(sp)
    800045cc:	01010113          	addi	sp,sp,16
    800045d0:	00008067          	ret

00000000800045d4 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    800045d4:	ff010113          	addi	sp,sp,-16
    800045d8:	00113423          	sd	ra,8(sp)
    800045dc:	00813023          	sd	s0,0(sp)
    800045e0:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    800045e4:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    800045e8:	00000617          	auipc	a2,0x0
    800045ec:	e9c60613          	addi	a2,a2,-356 # 80004484 <_ZN9Scheduler3cmpEP3TCBS1_>
    800045f0:	00050593          	mv	a1,a0
    800045f4:	00010517          	auipc	a0,0x10
    800045f8:	e6450513          	addi	a0,a0,-412 # 80014458 <_ZN9Scheduler8sleepingE>
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	928080e7          	jalr	-1752(ra) # 80004f24 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80004604:	00813083          	ld	ra,8(sp)
    80004608:	00013403          	ld	s0,0(sp)
    8000460c:	01010113          	addi	sp,sp,16
    80004610:	00008067          	ret

0000000080004614 <_ZN9Scheduler12update_sleepEv>:
{
    80004614:	fe010113          	addi	sp,sp,-32
    80004618:	00113c23          	sd	ra,24(sp)
    8000461c:	00813823          	sd	s0,16(sp)
    80004620:	00913423          	sd	s1,8(sp)
    80004624:	01213023          	sd	s2,0(sp)
    80004628:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    8000462c:	00010517          	auipc	a0,0x10
    80004630:	e2c50513          	addi	a0,a0,-468 # 80014458 <_ZN9Scheduler8sleepingE>
    80004634:	00001097          	auipc	ra,0x1
    80004638:	858080e7          	jalr	-1960(ra) # 80004e8c <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    8000463c:	04050e63          	beqz	a0,80004698 <_ZN9Scheduler12update_sleepEv+0x84>
    80004640:	00050493          	mv	s1,a0
    t->sleep_time--;
    80004644:	00853783          	ld	a5,8(a0)
    80004648:	fff78793          	addi	a5,a5,-1
    8000464c:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    80004650:	04048463          	beqz	s1,80004698 <_ZN9Scheduler12update_sleepEv+0x84>
    80004654:	0084b783          	ld	a5,8(s1)
    80004658:	04079063          	bnez	a5,80004698 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    8000465c:	00010917          	auipc	s2,0x10
    80004660:	dfc90913          	addi	s2,s2,-516 # 80014458 <_ZN9Scheduler8sleepingE>
    80004664:	00090513          	mv	a0,s2
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	7d4080e7          	jalr	2004(ra) # 80004e3c <_ZN8TcbQueue6removeEv>
            allocator.mem_free(this->stack);
        }
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    80004670:	00100793          	li	a5,1
    80004674:	02f4a823          	sw	a5,48(s1)
        put(t);
    80004678:	00048513          	mv	a0,s1
    8000467c:	00000097          	auipc	ra,0x0
    80004680:	ec4080e7          	jalr	-316(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    80004684:	00090513          	mv	a0,s2
    80004688:	00001097          	auipc	ra,0x1
    8000468c:	804080e7          	jalr	-2044(ra) # 80004e8c <_ZN8TcbQueue3topEv>
    80004690:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    80004694:	fbdff06f          	j	80004650 <_ZN9Scheduler12update_sleepEv+0x3c>
    80004698:	01813083          	ld	ra,24(sp)
    8000469c:	01013403          	ld	s0,16(sp)
    800046a0:	00813483          	ld	s1,8(sp)
    800046a4:	00013903          	ld	s2,0(sp)
    800046a8:	02010113          	addi	sp,sp,32
    800046ac:	00008067          	ret

00000000800046b0 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    800046b0:	ff010113          	addi	sp,sp,-16
    800046b4:	00113423          	sd	ra,8(sp)
    800046b8:	00813023          	sd	s0,0(sp)
    800046bc:	01010413          	addi	s0,sp,16
    800046c0:	000105b7          	lui	a1,0x10
    800046c4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800046c8:	00100513          	li	a0,1
    800046cc:	00000097          	auipc	ra,0x0
    800046d0:	df4080e7          	jalr	-524(ra) # 800044c0 <_Z41__static_initialization_and_destruction_0ii>
    800046d4:	00813083          	ld	ra,8(sp)
    800046d8:	00013403          	ld	s0,0(sp)
    800046dc:	01010113          	addi	sp,sp,16
    800046e0:	00008067          	ret

00000000800046e4 <_ZN5Riscv10popSppSpieEv>:
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;
ObjectCache* TCB::cache = nullptr;
void Riscv::popSppSpie() 
{
    800046e4:	ff010113          	addi	sp,sp,-16
    800046e8:	00813423          	sd	s0,8(sp)
    800046ec:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800046f0:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800046f4:	10200073          	sret
}
    800046f8:	00813403          	ld	s0,8(sp)
    800046fc:	01010113          	addi	sp,sp,16
    80004700:	00008067          	ret

0000000080004704 <_ZN3TCBC1EPFvPvES0_Pmm>:
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80004704:	00053023          	sd	zero,0(a0)
    80004708:	00053423          	sd	zero,8(a0)
    8000470c:	00b53823          	sd	a1,16(a0)
    80004710:	00c53c23          	sd	a2,24(a0)
    80004714:	02d53023          	sd	a3,32(a0)
    80004718:	02e53423          	sd	a4,40(a0)
    8000471c:	00100793          	li	a5,1
    80004720:	02f52823          	sw	a5,48(a0)
    80004724:	02050a23          	sb	zero,52(a0)
    80004728:	02f50aa3          	sb	a5,53(a0)
    8000472c:	02050b23          	sb	zero,54(a0)
    80004730:	00000797          	auipc	a5,0x0
    80004734:	0c878793          	addi	a5,a5,200 # 800047f8 <_ZN3TCB13threadWrapperEv>
    80004738:	02f53c23          	sd	a5,56(a0)
    8000473c:	04068a63          	beqz	a3,80004790 <_ZN3TCBC1EPFvPvES0_Pmm+0x8c>
    80004740:	000017b7          	lui	a5,0x1
    80004744:	00f687b3          	add	a5,a3,a5
    80004748:	04f53023          	sd	a5,64(a0)
{    
    if(body && stack){
    8000474c:	04058663          	beqz	a1,80004798 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
    80004750:	04068463          	beqz	a3,80004798 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80004754:	ff010113          	addi	sp,sp,-16
    80004758:	00113423          	sd	ra,8(sp)
    8000475c:	00813023          	sd	s0,0(sp)
    80004760:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    80004764:	00000097          	auipc	ra,0x0
    80004768:	ddc080e7          	jalr	-548(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
        threadsUp++;
    8000476c:	00010717          	auipc	a4,0x10
    80004770:	bfc70713          	addi	a4,a4,-1028 # 80014368 <_ZN3TCB9threadsUpE>
    80004774:	00072783          	lw	a5,0(a4)
    80004778:	0017879b          	addiw	a5,a5,1
    8000477c:	00f72023          	sw	a5,0(a4)
    }
    // kprintString("TCB initalizing!\n");
    // KCHECKPRINT(this);
    // KCHECKPRINT(stack);
}   
    80004780:	00813083          	ld	ra,8(sp)
    80004784:	00013403          	ld	s0,0(sp)
    80004788:	01010113          	addi	sp,sp,16
    8000478c:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80004790:	00000793          	li	a5,0
    80004794:	fb5ff06f          	j	80004748 <_ZN3TCBC1EPFvPvES0_Pmm+0x44>
    80004798:	00008067          	ret

000000008000479c <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    8000479c:	ff010113          	addi	sp,sp,-16
    800047a0:	00813423          	sd	s0,8(sp)
    800047a4:	01010413          	addi	s0,sp,16
    if(running->userMode){
    800047a8:	00010797          	auipc	a5,0x10
    800047ac:	bd878793          	addi	a5,a5,-1064 # 80014380 <_ZN3TCB7runningE>
    800047b0:	0007b783          	ld	a5,0(a5)
    800047b4:	0357c703          	lbu	a4,53(a5)
    800047b8:	02070063          	beqz	a4,800047d8 <_ZN3TCB9initalizeEv+0x3c>
    800047bc:	00400713          	li	a4,4
    800047c0:	02e7a823          	sw	a4,48(a5)
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800047c4:	10000793          	li	a5,256
    800047c8:	1007a073          	csrs	sstatus,a5
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
    Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
}
    800047cc:	00813403          	ld	s0,8(sp)
    800047d0:	01010113          	addi	sp,sp,16
    800047d4:	00008067          	ret
        if(running->locked)
    800047d8:	0367c783          	lbu	a5,54(a5)
    800047dc:	00078863          	beqz	a5,800047ec <_ZN3TCB9initalizeEv+0x50>
}

inline void Riscv::mc_sstatus(uint64 mask){
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800047e0:	02000793          	li	a5,32
    800047e4:	1007b073          	csrc	sstatus,a5
    800047e8:	fddff06f          	j	800047c4 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800047ec:	02000793          	li	a5,32
    800047f0:	1007a073          	csrs	sstatus,a5
    800047f4:	fd1ff06f          	j	800047c4 <_ZN3TCB9initalizeEv+0x28>

00000000800047f8 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    800047f8:	ff010113          	addi	sp,sp,-16
    800047fc:	00113423          	sd	ra,8(sp)
    80004800:	00813023          	sd	s0,0(sp)
    80004804:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    80004808:	00000097          	auipc	ra,0x0
    8000480c:	f94080e7          	jalr	-108(ra) # 8000479c <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    80004810:	00000097          	auipc	ra,0x0
    80004814:	ed4080e7          	jalr	-300(ra) # 800046e4 <_ZN5Riscv10popSppSpieEv>
    //__asm__ volatile ("csrw sepc, %0" : : "r" (running->body) );
    //__asm__ volatile ("sret");
    running->body(running->args);
    80004818:	00010797          	auipc	a5,0x10
    8000481c:	b6878793          	addi	a5,a5,-1176 # 80014380 <_ZN3TCB7runningE>
    80004820:	0007b783          	ld	a5,0(a5)
    80004824:	0107b703          	ld	a4,16(a5)
    80004828:	0187b503          	ld	a0,24(a5)
    8000482c:	000700e7          	jalr	a4
    thread_exit();
    80004830:	00008097          	auipc	ra,0x8
    80004834:	960080e7          	jalr	-1696(ra) # 8000c190 <thread_exit>
}
    80004838:	00813083          	ld	ra,8(sp)
    8000483c:	00013403          	ld	s0,0(sp)
    80004840:	01010113          	addi	sp,sp,16
    80004844:	00008067          	ret

0000000080004848 <_ZN3TCB15setPanicContextEmm>:

    
}

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    80004848:	ff010113          	addi	sp,sp,-16
    8000484c:	00813423          	sd	s0,8(sp)
    80004850:	01010413          	addi	s0,sp,16
    panicContext.ra = ra;
    80004854:	00010797          	auipc	a5,0x10
    80004858:	c1c78793          	addi	a5,a5,-996 # 80014470 <_ZN3TCB12panicContextE>
    8000485c:	00a7b023          	sd	a0,0(a5)
    panicContext.sp = sp;
    80004860:	00b7b423          	sd	a1,8(a5)
}
    80004864:	00813403          	ld	s0,8(sp)
    80004868:	01010113          	addi	sp,sp,16
    8000486c:	00008067          	ret

0000000080004870 <_ZN3TCB13panicDispatchEv>:

void TCB::panicDispatch()
{
    80004870:	ff010113          	addi	sp,sp,-16
    80004874:	00113423          	sd	ra,8(sp)
    80004878:	00813023          	sd	s0,0(sp)
    8000487c:	01010413          	addi	s0,sp,16
    contextSwitch(&running->context, &panicContext);
    80004880:	00010797          	auipc	a5,0x10
    80004884:	b0078793          	addi	a5,a5,-1280 # 80014380 <_ZN3TCB7runningE>
    80004888:	0007b503          	ld	a0,0(a5)
    8000488c:	00010597          	auipc	a1,0x10
    80004890:	be458593          	addi	a1,a1,-1052 # 80014470 <_ZN3TCB12panicContextE>
    80004894:	03850513          	addi	a0,a0,56
    80004898:	fffff097          	auipc	ra,0xfffff
    8000489c:	768080e7          	jalr	1896(ra) # 80004000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800048a0:	00813083          	ld	ra,8(sp)
    800048a4:	00013403          	ld	s0,0(sp)
    800048a8:	01010113          	addi	sp,sp,16
    800048ac:	00008067          	ret

00000000800048b0 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t sz){ 
    800048b0:	fe010113          	addi	sp,sp,-32
    800048b4:	00113c23          	sd	ra,24(sp)
    800048b8:	00813823          	sd	s0,16(sp)
    800048bc:	00913423          	sd	s1,8(sp)
    800048c0:	01213023          	sd	s2,0(sp)
    800048c4:	02010413          	addi	s0,sp,32
    if(!cache){
    800048c8:	00010797          	auipc	a5,0x10
    800048cc:	a9878793          	addi	a5,a5,-1384 # 80014360 <_ZN3TCB5cacheE>
    800048d0:	0007b783          	ld	a5,0(a5)
    800048d4:	02078863          	beqz	a5,80004904 <_ZN3TCBnwEm+0x54>
        cache = new ObjectCache("tcb_cache", sz, nullptr, nullptr); 
    }
    return cache->alloc_obj();
    800048d8:	00010797          	auipc	a5,0x10
    800048dc:	a8878793          	addi	a5,a5,-1400 # 80014360 <_ZN3TCB5cacheE>
    800048e0:	0007b503          	ld	a0,0(a5)
    800048e4:	00004097          	auipc	ra,0x4
    800048e8:	df0080e7          	jalr	-528(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
} 
    800048ec:	01813083          	ld	ra,24(sp)
    800048f0:	01013403          	ld	s0,16(sp)
    800048f4:	00813483          	ld	s1,8(sp)
    800048f8:	00013903          	ld	s2,0(sp)
    800048fc:	02010113          	addi	sp,sp,32
    80004900:	00008067          	ret
    80004904:	00050493          	mv	s1,a0
        cache = new ObjectCache("tcb_cache", sz, nullptr, nullptr); 
    80004908:	05800513          	li	a0,88
    8000490c:	00004097          	auipc	ra,0x4
    80004910:	e6c080e7          	jalr	-404(ra) # 80008778 <_ZN11ObjectCachenwEm>
    80004914:	00050913          	mv	s2,a0
    80004918:	00000793          	li	a5,0
    8000491c:	00000713          	li	a4,0
    80004920:	00000693          	li	a3,0
    80004924:	00048613          	mv	a2,s1
    80004928:	00009597          	auipc	a1,0x9
    8000492c:	6f858593          	addi	a1,a1,1784 # 8000e020 <CONSOLE_STATUS+0x10>
    80004930:	00003097          	auipc	ra,0x3
    80004934:	62c080e7          	jalr	1580(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80004938:	00010797          	auipc	a5,0x10
    8000493c:	a327b423          	sd	s2,-1496(a5) # 80014360 <_ZN3TCB5cacheE>
    80004940:	f99ff06f          	j	800048d8 <_ZN3TCBnwEm+0x28>
    80004944:	00050493          	mv	s1,a0
    80004948:	00090513          	mv	a0,s2
    8000494c:	00004097          	auipc	ra,0x4
    80004950:	f8c080e7          	jalr	-116(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    80004954:	00048513          	mv	a0,s1
    80004958:	00011097          	auipc	ra,0x11
    8000495c:	bf0080e7          	jalr	-1040(ra) # 80015548 <_Unwind_Resume>

0000000080004960 <_ZN3TCBnaEm>:
void* TCB::operator new[](size_t sz){ 
    80004960:	fe010113          	addi	sp,sp,-32
    80004964:	00113c23          	sd	ra,24(sp)
    80004968:	00813823          	sd	s0,16(sp)
    8000496c:	00913423          	sd	s1,8(sp)
    80004970:	02010413          	addi	s0,sp,32
    80004974:	00050493          	mv	s1,a0
    return SlabAllocator::getInstance().kmalloc(sz);
    80004978:	00004097          	auipc	ra,0x4
    8000497c:	7c4080e7          	jalr	1988(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80004980:	00048593          	mv	a1,s1
    80004984:	00005097          	auipc	ra,0x5
    80004988:	8b8080e7          	jalr	-1864(ra) # 8000923c <_ZN13SlabAllocator7kmallocEm>
} 
    8000498c:	01813083          	ld	ra,24(sp)
    80004990:	01013403          	ld	s0,16(sp)
    80004994:	00813483          	ld	s1,8(sp)
    80004998:	02010113          	addi	sp,sp,32
    8000499c:	00008067          	ret

00000000800049a0 <_ZN3TCBdlEPv>:
void TCB::operator delete(void* ptr){ 
    800049a0:	ff010113          	addi	sp,sp,-16
    800049a4:	00113423          	sd	ra,8(sp)
    800049a8:	00813023          	sd	s0,0(sp)
    800049ac:	01010413          	addi	s0,sp,16
    // kprintString("TCB dealloc!\n");
    cache->free_obj(ptr);
    800049b0:	00050593          	mv	a1,a0
    800049b4:	00010797          	auipc	a5,0x10
    800049b8:	9ac78793          	addi	a5,a5,-1620 # 80014360 <_ZN3TCB5cacheE>
    800049bc:	0007b503          	ld	a0,0(a5)
    800049c0:	00004097          	auipc	ra,0x4
    800049c4:	de8080e7          	jalr	-536(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
} 
    800049c8:	00813083          	ld	ra,8(sp)
    800049cc:	00013403          	ld	s0,0(sp)
    800049d0:	01010113          	addi	sp,sp,16
    800049d4:	00008067          	ret

00000000800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    800049d8:	fd010113          	addi	sp,sp,-48
    800049dc:	02113423          	sd	ra,40(sp)
    800049e0:	02813023          	sd	s0,32(sp)
    800049e4:	00913c23          	sd	s1,24(sp)
    800049e8:	01213823          	sd	s2,16(sp)
    800049ec:	01313423          	sd	s3,8(sp)
    800049f0:	01413023          	sd	s4,0(sp)
    800049f4:	03010413          	addi	s0,sp,48
    800049f8:	00050913          	mv	s2,a0
    800049fc:	00058993          	mv	s3,a1
    80004a00:	00060a13          	mv	s4,a2
    return new TCB(body, args, stack);
    80004a04:	04800513          	li	a0,72
    80004a08:	00000097          	auipc	ra,0x0
    80004a0c:	ea8080e7          	jalr	-344(ra) # 800048b0 <_ZN3TCBnwEm>
    80004a10:	00050493          	mv	s1,a0
    80004a14:	00200713          	li	a4,2
    80004a18:	000a0693          	mv	a3,s4
    80004a1c:	00098613          	mv	a2,s3
    80004a20:	00090593          	mv	a1,s2
    80004a24:	00000097          	auipc	ra,0x0
    80004a28:	ce0080e7          	jalr	-800(ra) # 80004704 <_ZN3TCBC1EPFvPvES0_Pmm>
    80004a2c:	0200006f          	j	80004a4c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
    80004a30:	00050913          	mv	s2,a0
    80004a34:	00048513          	mv	a0,s1
    80004a38:	00000097          	auipc	ra,0x0
    80004a3c:	f68080e7          	jalr	-152(ra) # 800049a0 <_ZN3TCBdlEPv>
    80004a40:	00090513          	mv	a0,s2
    80004a44:	00011097          	auipc	ra,0x11
    80004a48:	b04080e7          	jalr	-1276(ra) # 80015548 <_Unwind_Resume>
}
    80004a4c:	00048513          	mv	a0,s1
    80004a50:	02813083          	ld	ra,40(sp)
    80004a54:	02013403          	ld	s0,32(sp)
    80004a58:	01813483          	ld	s1,24(sp)
    80004a5c:	01013903          	ld	s2,16(sp)
    80004a60:	00813983          	ld	s3,8(sp)
    80004a64:	00013a03          	ld	s4,0(sp)
    80004a68:	03010113          	addi	sp,sp,48
    80004a6c:	00008067          	ret

0000000080004a70 <_ZN3TCB22createMainKernelThreadEv>:
    if(!kernelThread)
    80004a70:	00010797          	auipc	a5,0x10
    80004a74:	90078793          	addi	a5,a5,-1792 # 80014370 <_ZN3TCB12kernelThreadE>
    80004a78:	0007b783          	ld	a5,0(a5)
    80004a7c:	00078e63          	beqz	a5,80004a98 <_ZN3TCB22createMainKernelThreadEv+0x28>
    running = kernelThread;
    80004a80:	00010797          	auipc	a5,0x10
    80004a84:	8f078793          	addi	a5,a5,-1808 # 80014370 <_ZN3TCB12kernelThreadE>
    80004a88:	0007b503          	ld	a0,0(a5)
    80004a8c:	00010797          	auipc	a5,0x10
    80004a90:	8ea7ba23          	sd	a0,-1804(a5) # 80014380 <_ZN3TCB7runningE>
}
    80004a94:	00008067          	ret
{
    80004a98:	ff010113          	addi	sp,sp,-16
    80004a9c:	00113423          	sd	ra,8(sp)
    80004aa0:	00813023          	sd	s0,0(sp)
    80004aa4:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    80004aa8:	00000613          	li	a2,0
    80004aac:	00000593          	li	a1,0
    80004ab0:	00000513          	li	a0,0
    80004ab4:	00000097          	auipc	ra,0x0
    80004ab8:	f24080e7          	jalr	-220(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80004abc:	00010797          	auipc	a5,0x10
    80004ac0:	8aa7ba23          	sd	a0,-1868(a5) # 80014370 <_ZN3TCB12kernelThreadE>
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80004ac4:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80004ac8:	00100793          	li	a5,1
    80004acc:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    80004ad0:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    80004ad4:	00010797          	auipc	a5,0x10
    80004ad8:	89c78793          	addi	a5,a5,-1892 # 80014370 <_ZN3TCB12kernelThreadE>
    80004adc:	0007b503          	ld	a0,0(a5)
    80004ae0:	00010797          	auipc	a5,0x10
    80004ae4:	8aa7b023          	sd	a0,-1888(a5) # 80014380 <_ZN3TCB7runningE>
}
    80004ae8:	00813083          	ld	ra,8(sp)
    80004aec:	00013403          	ld	s0,0(sp)
    80004af0:	01010113          	addi	sp,sp,16
    80004af4:	00008067          	ret

0000000080004af8 <_ZN3TCB8dispatchEv>:
{
    80004af8:	fe010113          	addi	sp,sp,-32
    80004afc:	00113c23          	sd	ra,24(sp)
    80004b00:	00813823          	sd	s0,16(sp)
    80004b04:	00913423          	sd	s1,8(sp)
    80004b08:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    80004b0c:	00010797          	auipc	a5,0x10
    80004b10:	87478793          	addi	a5,a5,-1932 # 80014380 <_ZN3TCB7runningE>
    80004b14:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80004b18:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80004b1c:	00200713          	li	a4,2
    80004b20:	06e78c63          	beq	a5,a4,80004b98 <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80004b24:	00078c63          	beqz	a5,80004b3c <_ZN3TCB8dispatchEv+0x44>
    80004b28:	00300713          	li	a4,3
    80004b2c:	00e78863          	beq	a5,a4,80004b3c <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    80004b30:	00048513          	mv	a0,s1
    80004b34:	00000097          	auipc	ra,0x0
    80004b38:	a0c080e7          	jalr	-1524(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80004b3c:	00010797          	auipc	a5,0x10
    80004b40:	82c78793          	addi	a5,a5,-2004 # 80014368 <_ZN3TCB9threadsUpE>
    80004b44:	0007a703          	lw	a4,0(a5)
    80004b48:	00200793          	li	a5,2
    80004b4c:	00e7cc63          	blt	a5,a4,80004b64 <_ZN3TCB8dispatchEv+0x6c>
    80004b50:	00010797          	auipc	a5,0x10
    80004b54:	88878793          	addi	a5,a5,-1912 # 800143d8 <_ZN5StdIO7obufferE>
    80004b58:	0007b783          	ld	a5,0(a5)
    80004b5c:	4807a783          	lw	a5,1152(a5)
    80004b60:	08078e63          	beqz	a5,80004bfc <_ZN3TCB8dispatchEv+0x104>
    running = Scheduler::get(); 
    80004b64:	00000097          	auipc	ra,0x0
    80004b68:	9ac080e7          	jalr	-1620(ra) # 80004510 <_ZN9Scheduler3getEv>
    80004b6c:	00010797          	auipc	a5,0x10
    80004b70:	80a7ba23          	sd	a0,-2028(a5) # 80014380 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80004b74:	03850593          	addi	a1,a0,56
    80004b78:	03848513          	addi	a0,s1,56
    80004b7c:	fffff097          	auipc	ra,0xfffff
    80004b80:	484080e7          	jalr	1156(ra) # 80004000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80004b84:	01813083          	ld	ra,24(sp)
    80004b88:	01013403          	ld	s0,16(sp)
    80004b8c:	00813483          	ld	s1,8(sp)
    80004b90:	02010113          	addi	sp,sp,32
    80004b94:	00008067          	ret
        threadsUp--;
    80004b98:	0000f717          	auipc	a4,0xf
    80004b9c:	7d070713          	addi	a4,a4,2000 # 80014368 <_ZN3TCB9threadsUpE>
    80004ba0:	00072783          	lw	a5,0(a4)
    80004ba4:	fff7879b          	addiw	a5,a5,-1
    80004ba8:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    80004bac:	0344c783          	lbu	a5,52(s1)
    80004bb0:	f80786e3          	beqz	a5,80004b3c <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    80004bb4:	f80484e3          	beqz	s1,80004b3c <_ZN3TCB8dispatchEv+0x44>
    bool isKernelThread() { return !userMode; } 
    80004bb8:	0354c783          	lbu	a5,53(s1)
        if(isKernelThread()){
    80004bbc:	02079463          	bnez	a5,80004be4 <_ZN3TCB8dispatchEv+0xec>
            SlabAllocator::getInstance().kfree(this->stack);
    80004bc0:	00004097          	auipc	ra,0x4
    80004bc4:	57c080e7          	jalr	1404(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80004bc8:	0204b583          	ld	a1,32(s1)
    80004bcc:	00004097          	auipc	ra,0x4
    80004bd0:	6f4080e7          	jalr	1780(ra) # 800092c0 <_ZN13SlabAllocator5kfreeEPv>
    80004bd4:	00048513          	mv	a0,s1
    80004bd8:	00000097          	auipc	ra,0x0
    80004bdc:	dc8080e7          	jalr	-568(ra) # 800049a0 <_ZN3TCBdlEPv>
    80004be0:	f5dff06f          	j	80004b3c <_ZN3TCB8dispatchEv+0x44>
            MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80004be4:	00003097          	auipc	ra,0x3
    80004be8:	9e8080e7          	jalr	-1560(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
            allocator.mem_free(this->stack);
    80004bec:	0204b583          	ld	a1,32(s1)
    80004bf0:	00003097          	auipc	ra,0x3
    80004bf4:	e10080e7          	jalr	-496(ra) # 80007a00 <_ZN15MemoryAllocator8mem_freeEPv>
    80004bf8:	fddff06f          	j	80004bd4 <_ZN3TCB8dispatchEv+0xdc>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80004bfc:	00000097          	auipc	ra,0x0
    80004c00:	090080e7          	jalr	144(ra) # 80004c8c <_ZN3TCB9endKernelEv>
    80004c04:	f61ff06f          	j	80004b64 <_ZN3TCB8dispatchEv+0x6c>

0000000080004c08 <_ZN3TCB5yieldEv>:
{
    80004c08:	ff010113          	addi	sp,sp,-16
    80004c0c:	00113423          	sd	ra,8(sp)
    80004c10:	00813023          	sd	s0,0(sp)
    80004c14:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80004c18:	fffff097          	auipc	ra,0xfffff
    80004c1c:	568080e7          	jalr	1384(ra) # 80004180 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80004c20:	00000097          	auipc	ra,0x0
    80004c24:	ed8080e7          	jalr	-296(ra) # 80004af8 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80004c28:	fffff097          	auipc	ra,0xfffff
    80004c2c:	5d4080e7          	jalr	1492(ra) # 800041fc <_ZN5Riscv12popRegistersEv>
}
    80004c30:	00813083          	ld	ra,8(sp)
    80004c34:	00013403          	ld	s0,0(sp)
    80004c38:	01010113          	addi	sp,sp,16
    80004c3c:	00008067          	ret

0000000080004c40 <_ZN3TCB5sleepEm>:
{
    80004c40:	ff010113          	addi	sp,sp,-16
    80004c44:	00113423          	sd	ra,8(sp)
    80004c48:	00813023          	sd	s0,0(sp)
    80004c4c:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80004c50:	0000f797          	auipc	a5,0xf
    80004c54:	73078793          	addi	a5,a5,1840 # 80014380 <_ZN3TCB7runningE>
    80004c58:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80004c5c:	00300713          	li	a4,3
    80004c60:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80004c64:	00050593          	mv	a1,a0
    80004c68:	00078513          	mv	a0,a5
    80004c6c:	00000097          	auipc	ra,0x0
    80004c70:	968080e7          	jalr	-1688(ra) # 800045d4 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	f94080e7          	jalr	-108(ra) # 80004c08 <_ZN3TCB5yieldEv>
}
    80004c7c:	00813083          	ld	ra,8(sp)
    80004c80:	00013403          	ld	s0,0(sp)
    80004c84:	01010113          	addi	sp,sp,16
    80004c88:	00008067          	ret

0000000080004c8c <_ZN3TCB9endKernelEv>:
    if(kernelThread)
    80004c8c:	0000f797          	auipc	a5,0xf
    80004c90:	6e478793          	addi	a5,a5,1764 # 80014370 <_ZN3TCB12kernelThreadE>
    80004c94:	0007b583          	ld	a1,0(a5)
    80004c98:	04058463          	beqz	a1,80004ce0 <_ZN3TCB9endKernelEv+0x54>
{
    80004c9c:	ff010113          	addi	sp,sp,-16
    80004ca0:	00113423          	sd	ra,8(sp)
    80004ca4:	00813023          	sd	s0,0(sp)
    80004ca8:	01010413          	addi	s0,sp,16
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80004cac:	0000f517          	auipc	a0,0xf
    80004cb0:	79450513          	addi	a0,a0,1940 # 80014440 <_ZN9Scheduler5queueE>
    80004cb4:	00000097          	auipc	ra,0x0
    80004cb8:	32c080e7          	jalr	812(ra) # 80004fe0 <_ZN8TcbQueue11insertFrontEP3TCB>
        kernelThread = nullptr;
    80004cbc:	0000f797          	auipc	a5,0xf
    80004cc0:	6a07ba23          	sd	zero,1716(a5) # 80014370 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    80004cc4:	00000097          	auipc	ra,0x0
    80004cc8:	e34080e7          	jalr	-460(ra) # 80004af8 <_ZN3TCB8dispatchEv>
}
    80004ccc:	fff00513          	li	a0,-1
    80004cd0:	00813083          	ld	ra,8(sp)
    80004cd4:	00013403          	ld	s0,0(sp)
    80004cd8:	01010113          	addi	sp,sp,16
    80004cdc:	00008067          	ret
    80004ce0:	fff00513          	li	a0,-1
    80004ce4:	00008067          	ret

0000000080004ce8 <_ZN3TCB12deleteThreadEPS_>:
    if(t)
    80004ce8:	08050c63          	beqz	a0,80004d80 <_ZN3TCB12deleteThreadEPS_+0x98>
        if(running != t && t->isFinished())
    80004cec:	0000f797          	auipc	a5,0xf
    80004cf0:	69478793          	addi	a5,a5,1684 # 80014380 <_ZN3TCB7runningE>
    80004cf4:	0007b783          	ld	a5,0(a5)
    80004cf8:	00a78863          	beq	a5,a0,80004d08 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    80004cfc:	03052703          	lw	a4,48(a0)
    80004d00:	00200793          	li	a5,2
    80004d04:	00f70863          	beq	a4,a5,80004d14 <_ZN3TCB12deleteThreadEPS_+0x2c>
            t->deleteOnEnd = true;
    80004d08:	00100793          	li	a5,1
    80004d0c:	02f50a23          	sb	a5,52(a0)
}
    80004d10:	00008067          	ret
{
    80004d14:	fe010113          	addi	sp,sp,-32
    80004d18:	00113c23          	sd	ra,24(sp)
    80004d1c:	00813823          	sd	s0,16(sp)
    80004d20:	00913423          	sd	s1,8(sp)
    80004d24:	02010413          	addi	s0,sp,32
    80004d28:	00050493          	mv	s1,a0
    bool isKernelThread() { return !userMode; } 
    80004d2c:	03554783          	lbu	a5,53(a0)
        if(isKernelThread()){
    80004d30:	02079c63          	bnez	a5,80004d68 <_ZN3TCB12deleteThreadEPS_+0x80>
            SlabAllocator::getInstance().kfree(this->stack);
    80004d34:	00004097          	auipc	ra,0x4
    80004d38:	408080e7          	jalr	1032(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80004d3c:	0204b583          	ld	a1,32(s1)
    80004d40:	00004097          	auipc	ra,0x4
    80004d44:	580080e7          	jalr	1408(ra) # 800092c0 <_ZN13SlabAllocator5kfreeEPv>
            delete t;
    80004d48:	00048513          	mv	a0,s1
    80004d4c:	00000097          	auipc	ra,0x0
    80004d50:	c54080e7          	jalr	-940(ra) # 800049a0 <_ZN3TCBdlEPv>
}
    80004d54:	01813083          	ld	ra,24(sp)
    80004d58:	01013403          	ld	s0,16(sp)
    80004d5c:	00813483          	ld	s1,8(sp)
    80004d60:	02010113          	addi	sp,sp,32
    80004d64:	00008067          	ret
            MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80004d68:	00003097          	auipc	ra,0x3
    80004d6c:	864080e7          	jalr	-1948(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
            allocator.mem_free(this->stack);
    80004d70:	0204b583          	ld	a1,32(s1)
    80004d74:	00003097          	auipc	ra,0x3
    80004d78:	c8c080e7          	jalr	-884(ra) # 80007a00 <_ZN15MemoryAllocator8mem_freeEPv>
    80004d7c:	fcdff06f          	j	80004d48 <_ZN3TCB12deleteThreadEPS_+0x60>
    80004d80:	00008067          	ret

0000000080004d84 <_ZN3TCBdaEPv>:
void TCB::operator delete[](void* ptr){
    80004d84:	fe010113          	addi	sp,sp,-32
    80004d88:	00113c23          	sd	ra,24(sp)
    80004d8c:	00813823          	sd	s0,16(sp)
    80004d90:	00913423          	sd	s1,8(sp)
    80004d94:	02010413          	addi	s0,sp,32
    80004d98:	00050493          	mv	s1,a0
    SlabAllocator::getInstance().kfree(ptr);
    80004d9c:	00004097          	auipc	ra,0x4
    80004da0:	3a0080e7          	jalr	928(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80004da4:	00048593          	mv	a1,s1
    80004da8:	00004097          	auipc	ra,0x4
    80004dac:	518080e7          	jalr	1304(ra) # 800092c0 <_ZN13SlabAllocator5kfreeEPv>
    80004db0:	01813083          	ld	ra,24(sp)
    80004db4:	01013403          	ld	s0,16(sp)
    80004db8:	00813483          	ld	s1,8(sp)
    80004dbc:	02010113          	addi	sp,sp,32
    80004dc0:	00008067          	ret

0000000080004dc4 <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../../h/kernel_lib.h"

ObjectCache* TcbQueue::cache = nullptr;

bool TcbQueue::exists(TCB* info) const 
{
    80004dc4:	ff010113          	addi	sp,sp,-16
    80004dc8:	00813423          	sd	s0,8(sp)
    80004dcc:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    80004dd0:	00053783          	ld	a5,0(a0)
    80004dd4:	00078863          	beqz	a5,80004de4 <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    80004dd8:	00b78e63          	beq	a5,a1,80004df4 <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    80004ddc:	0007b783          	ld	a5,0(a5)
    80004de0:	ff5ff06f          	j	80004dd4 <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    80004de4:	00000513          	li	a0,0
}
    80004de8:	00813403          	ld	s0,8(sp)
    80004dec:	01010113          	addi	sp,sp,16
    80004df0:	00008067          	ret
            return true;
    80004df4:	00100513          	li	a0,1
    80004df8:	ff1ff06f          	j	80004de8 <_ZNK8TcbQueue6existsEP3TCB+0x24>

0000000080004dfc <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    80004dfc:	ff010113          	addi	sp,sp,-16
    80004e00:	00813423          	sd	s0,8(sp)
    80004e04:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    80004e08:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004e0c:	00853783          	ld	a5,8(a0)
    80004e10:	02078263          	beqz	a5,80004e34 <_ZN8TcbQueue6insertEP3TCB+0x38>
    80004e14:	00b7b023          	sd	a1,0(a5)
    80004e18:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    80004e1c:	01052783          	lw	a5,16(a0)
    80004e20:	0017879b          	addiw	a5,a5,1
    80004e24:	00f52823          	sw	a5,16(a0)
    return *this;
}
    80004e28:	00813403          	ld	s0,8(sp)
    80004e2c:	01010113          	addi	sp,sp,16
    80004e30:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004e34:	00b53023          	sd	a1,0(a0)
    80004e38:	fe1ff06f          	j	80004e18 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080004e3c <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80004e3c:	ff010113          	addi	sp,sp,-16
    80004e40:	00813423          	sd	s0,8(sp)
    80004e44:	01010413          	addi	s0,sp,16
    80004e48:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80004e4c:	00053503          	ld	a0,0(a0)
    80004e50:	02050263          	beqz	a0,80004e74 <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80004e54:	0087b703          	ld	a4,8(a5)
    80004e58:	02e50463          	beq	a0,a4,80004e80 <_ZN8TcbQueue6removeEv+0x44>
    80004e5c:	00053703          	ld	a4,0(a0)
    80004e60:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    80004e64:	00053023          	sd	zero,0(a0)
        tmpNum--;
    80004e68:	0107a703          	lw	a4,16(a5)
    80004e6c:	fff7071b          	addiw	a4,a4,-1
    80004e70:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    80004e74:	00813403          	ld	s0,8(sp)
    80004e78:	01010113          	addi	sp,sp,16
    80004e7c:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    80004e80:	0007b423          	sd	zero,8(a5)
    80004e84:	00000713          	li	a4,0
    80004e88:	fd9ff06f          	j	80004e60 <_ZN8TcbQueue6removeEv+0x24>

0000000080004e8c <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80004e8c:	ff010113          	addi	sp,sp,-16
    80004e90:	00813423          	sd	s0,8(sp)
    80004e94:	01010413          	addi	s0,sp,16
    return head;
}
    80004e98:	00053503          	ld	a0,0(a0)
    80004e9c:	00813403          	ld	s0,8(sp)
    80004ea0:	01010113          	addi	sp,sp,16
    80004ea4:	00008067          	ret

0000000080004ea8 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    80004ea8:	fe010113          	addi	sp,sp,-32
    80004eac:	00113c23          	sd	ra,24(sp)
    80004eb0:	00813823          	sd	s0,16(sp)
    80004eb4:	00913423          	sd	s1,8(sp)
    80004eb8:	02010413          	addi	s0,sp,32
    TCB* t = head;
    80004ebc:	00053483          	ld	s1,0(a0)
    while(t){
    80004ec0:	04048063          	beqz	s1,80004f00 <_ZN8TcbQueue10printQueueEv+0x58>
        kprintString("-> ");
    80004ec4:	00009517          	auipc	a0,0x9
    80004ec8:	16c50513          	addi	a0,a0,364 # 8000e030 <CONSOLE_STATUS+0x20>
    80004ecc:	00000097          	auipc	ra,0x0
    80004ed0:	218080e7          	jalr	536(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    80004ed4:	00000613          	li	a2,0
    80004ed8:	00a00593          	li	a1,10
    80004edc:	00048513          	mv	a0,s1
    80004ee0:	00000097          	auipc	ra,0x0
    80004ee4:	24c080e7          	jalr	588(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80004ee8:	00009517          	auipc	a0,0x9
    80004eec:	47050513          	addi	a0,a0,1136 # 8000e358 <CONSOLE_STATUS+0x348>
    80004ef0:	00000097          	auipc	ra,0x0
    80004ef4:	1f4080e7          	jalr	500(ra) # 800050e4 <_Z12kprintStringPKc>
        t = t->next;            
    80004ef8:	0004b483          	ld	s1,0(s1)
    while(t){
    80004efc:	fc5ff06f          	j	80004ec0 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    80004f00:	00009517          	auipc	a0,0x9
    80004f04:	45850513          	addi	a0,a0,1112 # 8000e358 <CONSOLE_STATUS+0x348>
    80004f08:	00000097          	auipc	ra,0x0
    80004f0c:	1dc080e7          	jalr	476(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80004f10:	01813083          	ld	ra,24(sp)
    80004f14:	01013403          	ld	s0,16(sp)
    80004f18:	00813483          	ld	s1,8(sp)
    80004f1c:	02010113          	addi	sp,sp,32
    80004f20:	00008067          	ret

0000000080004f24 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    80004f24:	fc010113          	addi	sp,sp,-64
    80004f28:	02113c23          	sd	ra,56(sp)
    80004f2c:	02813823          	sd	s0,48(sp)
    80004f30:	02913423          	sd	s1,40(sp)
    80004f34:	03213023          	sd	s2,32(sp)
    80004f38:	01313c23          	sd	s3,24(sp)
    80004f3c:	01413823          	sd	s4,16(sp)
    80004f40:	01513423          	sd	s5,8(sp)
    80004f44:	04010413          	addi	s0,sp,64
    80004f48:	00050a93          	mv	s5,a0
    80004f4c:	00058913          	mv	s2,a1
    80004f50:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80004f54:	00053483          	ld	s1,0(a0)
    80004f58:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80004f5c:	02048063          	beqz	s1,80004f7c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80004f60:	00048593          	mv	a1,s1
    80004f64:	00090513          	mv	a0,s2
    80004f68:	000a00e7          	jalr	s4
    80004f6c:	00054863          	bltz	a0,80004f7c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80004f70:	00048993          	mv	s3,s1
        cur = cur->next;
    80004f74:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80004f78:	fe5ff06f          	j	80004f5c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80004f7c:	04098063          	beqz	s3,80004fbc <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80004f80:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    80004f84:	04048a63          	beqz	s1,80004fd8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    80004f88:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    80004f8c:	010aa783          	lw	a5,16(s5)
    80004f90:	0017879b          	addiw	a5,a5,1
    80004f94:	00faa823          	sw	a5,16(s5)
}
    80004f98:	03813083          	ld	ra,56(sp)
    80004f9c:	03013403          	ld	s0,48(sp)
    80004fa0:	02813483          	ld	s1,40(sp)
    80004fa4:	02013903          	ld	s2,32(sp)
    80004fa8:	01813983          	ld	s3,24(sp)
    80004fac:	01013a03          	ld	s4,16(sp)
    80004fb0:	00813a83          	ld	s5,8(sp)
    80004fb4:	04010113          	addi	sp,sp,64
    80004fb8:	00008067          	ret
        info->next = head;
    80004fbc:	000ab783          	ld	a5,0(s5)
    80004fc0:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    80004fc4:	00078663          	beqz	a5,80004fd0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    80004fc8:	012ab023          	sd	s2,0(s5)
    80004fcc:	fc1ff06f          	j	80004f8c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    80004fd0:	012ab423          	sd	s2,8(s5)
    80004fd4:	ff5ff06f          	j	80004fc8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    80004fd8:	012ab423          	sd	s2,8(s5)
    80004fdc:	fadff06f          	j	80004f88 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

0000000080004fe0 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    80004fe0:	ff010113          	addi	sp,sp,-16
    80004fe4:	00813423          	sd	s0,8(sp)
    80004fe8:	01010413          	addi	s0,sp,16
    info->next = head;
    80004fec:	00053783          	ld	a5,0(a0)
    80004ff0:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    80004ff4:	02078063          	beqz	a5,80005014 <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    80004ff8:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    80004ffc:	01052783          	lw	a5,16(a0)
    80005000:	0017879b          	addiw	a5,a5,1
    80005004:	00f52823          	sw	a5,16(a0)
    80005008:	00813403          	ld	s0,8(sp)
    8000500c:	01010113          	addi	sp,sp,16
    80005010:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    80005014:	00b53423          	sd	a1,8(a0)
    80005018:	fe1ff06f          	j	80004ff8 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

000000008000501c <_ZN8KSysCall15thread_dispatchEv>:
#include"../../../h/kernel_lib.h"

namespace KSysCall{
    void thread_dispatch(){
    8000501c:	ff010113          	addi	sp,sp,-16
    80005020:	00813423          	sd	s0,8(sp)
    80005024:	01010413          	addi	s0,sp,16
        __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80005028:	01300793          	li	a5,19
    8000502c:	00078513          	mv	a0,a5
        __asm__ volatile("ecall");  
    80005030:	00000073          	ecall
    }
    80005034:	00813403          	ld	s0,8(sp)
    80005038:	01010113          	addi	sp,sp,16
    8000503c:	00008067          	ret

0000000080005040 <_Z12idleFunctionPv>:
}

void idleFunction(void*)
{
    80005040:	ff010113          	addi	sp,sp,-16
    80005044:	00113423          	sd	ra,8(sp)
    80005048:	00813023          	sd	s0,0(sp)
    8000504c:	01010413          	addi	s0,sp,16
        *   We could make preemptive kernel thread but that is a little bit harder.
        *   We must make INTERRUPTION LOCK FUNCTION (function that disables interrupts)  
        *   that will lock the thread when executing critical section code! TODO or NOT
        *    
        */
        KSysCall::thread_dispatch();
    80005050:	00000097          	auipc	ra,0x0
    80005054:	fcc080e7          	jalr	-52(ra) # 8000501c <_ZN8KSysCall15thread_dispatchEv>
    80005058:	ff9ff06f          	j	80005050 <_Z12idleFunctionPv+0x10>

000000008000505c <_Z7kmallocm>:
    }
}

void* kmalloc(size_t size)
{
    8000505c:	fe010113          	addi	sp,sp,-32
    80005060:	00113c23          	sd	ra,24(sp)
    80005064:	00813823          	sd	s0,16(sp)
    80005068:	00913423          	sd	s1,8(sp)
    8000506c:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80005070:	fff50493          	addi	s1,a0,-1
    80005074:	0064d493          	srli	s1,s1,0x6
    80005078:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    8000507c:	00002097          	auipc	ra,0x2
    80005080:	550080e7          	jalr	1360(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    80005084:	00048593          	mv	a1,s1
    80005088:	00002097          	auipc	ra,0x2
    8000508c:	6d8080e7          	jalr	1752(ra) # 80007760 <_ZN15MemoryAllocator9mem_allocEm>
}
    80005090:	01813083          	ld	ra,24(sp)
    80005094:	01013403          	ld	s0,16(sp)
    80005098:	00813483          	ld	s1,8(sp)
    8000509c:	02010113          	addi	sp,sp,32
    800050a0:	00008067          	ret

00000000800050a4 <_Z5kputcc>:

void kputc(char c){
    800050a4:	ff010113          	addi	sp,sp,-16
    800050a8:	00813423          	sd	s0,8(sp)
    800050ac:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    800050b0:	00009797          	auipc	a5,0x9
    800050b4:	f5878793          	addi	a5,a5,-168 # 8000e008 <CONSOLE_TX_DATA>
    800050b8:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    800050bc:	00009797          	auipc	a5,0x9
    800050c0:	f5478793          	addi	a5,a5,-172 # 8000e010 <CONSOLE_STATUS>
    800050c4:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    800050c8:	00074783          	lbu	a5,0(a4)
    800050cc:	0207f793          	andi	a5,a5,32
    800050d0:	fe078ce3          	beqz	a5,800050c8 <_Z5kputcc+0x24>
    *odata = c;
    800050d4:	00a68023          	sb	a0,0(a3)
}
    800050d8:	00813403          	ld	s0,8(sp)
    800050dc:	01010113          	addi	sp,sp,16
    800050e0:	00008067          	ret

00000000800050e4 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    800050e4:	fe010113          	addi	sp,sp,-32
    800050e8:	00113c23          	sd	ra,24(sp)
    800050ec:	00813823          	sd	s0,16(sp)
    800050f0:	00913423          	sd	s1,8(sp)
    800050f4:	02010413          	addi	s0,sp,32
    800050f8:	00050493          	mv	s1,a0
    if(!string) return;
    800050fc:	00050e63          	beqz	a0,80005118 <_Z12kprintStringPKc+0x34>
    while(*string)
    80005100:	0004c503          	lbu	a0,0(s1)
    80005104:	00050a63          	beqz	a0,80005118 <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    80005108:	00000097          	auipc	ra,0x0
    8000510c:	f9c080e7          	jalr	-100(ra) # 800050a4 <_Z5kputcc>
        string++;
    80005110:	00148493          	addi	s1,s1,1
    while(*string)
    80005114:	fedff06f          	j	80005100 <_Z12kprintStringPKc+0x1c>
    }
}
    80005118:	01813083          	ld	ra,24(sp)
    8000511c:	01013403          	ld	s0,16(sp)
    80005120:	00813483          	ld	s1,8(sp)
    80005124:	02010113          	addi	sp,sp,32
    80005128:	00008067          	ret

000000008000512c <_Z9kprintIntmib>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base, bool sgn){
    8000512c:	fc010113          	addi	sp,sp,-64
    80005130:	02113c23          	sd	ra,56(sp)
    80005134:	02813823          	sd	s0,48(sp)
    80005138:	02913423          	sd	s1,40(sp)
    8000513c:	03213023          	sd	s2,32(sp)
    80005140:	01313c23          	sd	s3,24(sp)
    80005144:	04010413          	addi	s0,sp,64
    80005148:	00050913          	mv	s2,a0
    8000514c:	00058993          	mv	s3,a1
    char buf[16];
    int i;
    if(sgn && base == 10){ 
    80005150:	00060663          	beqz	a2,8000515c <_Z9kprintIntmib+0x30>
    80005154:	00a00793          	li	a5,10
    80005158:	00f58663          	beq	a1,a5,80005164 <_Z9kprintIntmib+0x38>
void kprintInt(uint64 xx, int base, bool sgn){
    8000515c:	00000793          	li	a5,0
    80005160:	01c0006f          	j	8000517c <_Z9kprintIntmib+0x50>
        kputc('-');
    80005164:	02d00513          	li	a0,45
    80005168:	00000097          	auipc	ra,0x0
    8000516c:	f3c080e7          	jalr	-196(ra) # 800050a4 <_Z5kputcc>
        xx = -xx;
    80005170:	41200933          	neg	s2,s2
    80005174:	fe9ff06f          	j	8000515c <_Z9kprintIntmib+0x30>
    }

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    80005178:	00070913          	mv	s2,a4
        buf[i++] = kdigits[xx % base];
    8000517c:	033976b3          	remu	a3,s2,s3
    80005180:	0017849b          	addiw	s1,a5,1
    80005184:	0000e717          	auipc	a4,0xe
    80005188:	84c70713          	addi	a4,a4,-1972 # 800129d0 <kdigits>
    8000518c:	00d70733          	add	a4,a4,a3
    80005190:	00074703          	lbu	a4,0(a4)
    80005194:	fd040693          	addi	a3,s0,-48
    80005198:	00f687b3          	add	a5,a3,a5
    8000519c:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    800051a0:	03395733          	divu	a4,s2,s3
        buf[i++] = kdigits[xx % base];
    800051a4:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    800051a8:	fd3978e3          	bgeu	s2,s3,80005178 <_Z9kprintIntmib+0x4c>
    
    while(--i >= 0)
    800051ac:	fff4849b          	addiw	s1,s1,-1
    800051b0:	0004ce63          	bltz	s1,800051cc <_Z9kprintIntmib+0xa0>
        kputc(buf[i]);
    800051b4:	fd040793          	addi	a5,s0,-48
    800051b8:	009787b3          	add	a5,a5,s1
    800051bc:	ff07c503          	lbu	a0,-16(a5)
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	ee4080e7          	jalr	-284(ra) # 800050a4 <_Z5kputcc>
    while(--i >= 0)
    800051c8:	fe5ff06f          	j	800051ac <_Z9kprintIntmib+0x80>
}
    800051cc:	03813083          	ld	ra,56(sp)
    800051d0:	03013403          	ld	s0,48(sp)
    800051d4:	02813483          	ld	s1,40(sp)
    800051d8:	02013903          	ld	s2,32(sp)
    800051dc:	01813983          	ld	s3,24(sp)
    800051e0:	04010113          	addi	sp,sp,64
    800051e4:	00008067          	ret

00000000800051e8 <_Z10kernelInitv>:
{
    800051e8:	fd010113          	addi	sp,sp,-48
    800051ec:	02113423          	sd	ra,40(sp)
    800051f0:	02813023          	sd	s0,32(sp)
    800051f4:	00913c23          	sd	s1,24(sp)
    800051f8:	01213823          	sd	s2,16(sp)
    800051fc:	01313423          	sd	s3,8(sp)
    80005200:	01413023          	sd	s4,0(sp)
    80005204:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    80005208:	00009517          	auipc	a0,0x9
    8000520c:	e3050513          	addi	a0,a0,-464 # 8000e038 <CONSOLE_STATUS+0x28>
    80005210:	00000097          	auipc	ra,0x0
    80005214:	ed4080e7          	jalr	-300(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_START_ADDR);
    80005218:	00009517          	auipc	a0,0x9
    8000521c:	e5050513          	addi	a0,a0,-432 # 8000e068 <CONSOLE_STATUS+0x58>
    80005220:	00000097          	auipc	ra,0x0
    80005224:	ec4080e7          	jalr	-316(ra) # 800050e4 <_Z12kprintStringPKc>
    80005228:	00000613          	li	a2,0
    8000522c:	01000593          	li	a1,16
    80005230:	0000d797          	auipc	a5,0xd
    80005234:	79078793          	addi	a5,a5,1936 # 800129c0 <HEAP_START_ADDR>
    80005238:	0007b503          	ld	a0,0(a5)
    8000523c:	00000097          	auipc	ra,0x0
    80005240:	ef0080e7          	jalr	-272(ra) # 8000512c <_Z9kprintIntmib>
    80005244:	00009517          	auipc	a0,0x9
    80005248:	11450513          	addi	a0,a0,276 # 8000e358 <CONSOLE_STATUS+0x348>
    8000524c:	00000097          	auipc	ra,0x0
    80005250:	e98080e7          	jalr	-360(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    80005254:	00009517          	auipc	a0,0x9
    80005258:	e2c50513          	addi	a0,a0,-468 # 8000e080 <CONSOLE_STATUS+0x70>
    8000525c:	00000097          	auipc	ra,0x0
    80005260:	e88080e7          	jalr	-376(ra) # 800050e4 <_Z12kprintStringPKc>
    80005264:	00000613          	li	a2,0
    80005268:	01000593          	li	a1,16
    8000526c:	0000d797          	auipc	a5,0xd
    80005270:	74c78793          	addi	a5,a5,1868 # 800129b8 <HEAP_END_ADDR>
    80005274:	0007b503          	ld	a0,0(a5)
    80005278:	00000097          	auipc	ra,0x0
    8000527c:	eb4080e7          	jalr	-332(ra) # 8000512c <_Z9kprintIntmib>
    80005280:	00009517          	auipc	a0,0x9
    80005284:	0d850513          	addi	a0,a0,216 # 8000e358 <CONSOLE_STATUS+0x348>
    80005288:	00000097          	auipc	ra,0x0
    8000528c:	e5c080e7          	jalr	-420(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    80005290:	00009517          	auipc	a0,0x9
    80005294:	e0050513          	addi	a0,a0,-512 # 8000e090 <CONSOLE_STATUS+0x80>
    80005298:	00000097          	auipc	ra,0x0
    8000529c:	e4c080e7          	jalr	-436(ra) # 800050e4 <_Z12kprintStringPKc>
    800052a0:	00000613          	li	a2,0
    800052a4:	01000593          	li	a1,16
    800052a8:	fffff797          	auipc	a5,0xfffff
    800052ac:	d6c78793          	addi	a5,a5,-660 # 80004014 <KERNEL_TEXT_START>
    800052b0:	0007b503          	ld	a0,0(a5)
    800052b4:	00000097          	auipc	ra,0x0
    800052b8:	e78080e7          	jalr	-392(ra) # 8000512c <_Z9kprintIntmib>
    800052bc:	00009517          	auipc	a0,0x9
    800052c0:	09c50513          	addi	a0,a0,156 # 8000e358 <CONSOLE_STATUS+0x348>
    800052c4:	00000097          	auipc	ra,0x0
    800052c8:	e20080e7          	jalr	-480(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    800052cc:	00009517          	auipc	a0,0x9
    800052d0:	ddc50513          	addi	a0,a0,-548 # 8000e0a8 <CONSOLE_STATUS+0x98>
    800052d4:	00000097          	auipc	ra,0x0
    800052d8:	e10080e7          	jalr	-496(ra) # 800050e4 <_Z12kprintStringPKc>
    800052dc:	00000613          	li	a2,0
    800052e0:	01000593          	li	a1,16
    800052e4:	fffff797          	auipc	a5,0xfffff
    800052e8:	d3878793          	addi	a5,a5,-712 # 8000401c <KERNEL_TEXT_END>
    800052ec:	0007b503          	ld	a0,0(a5)
    800052f0:	00000097          	auipc	ra,0x0
    800052f4:	e3c080e7          	jalr	-452(ra) # 8000512c <_Z9kprintIntmib>
    800052f8:	00009517          	auipc	a0,0x9
    800052fc:	06050513          	addi	a0,a0,96 # 8000e358 <CONSOLE_STATUS+0x348>
    80005300:	00000097          	auipc	ra,0x0
    80005304:	de4080e7          	jalr	-540(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    80005308:	00009517          	auipc	a0,0x9
    8000530c:	db850513          	addi	a0,a0,-584 # 8000e0c0 <CONSOLE_STATUS+0xb0>
    80005310:	00000097          	auipc	ra,0x0
    80005314:	dd4080e7          	jalr	-556(ra) # 800050e4 <_Z12kprintStringPKc>
    80005318:	00000613          	li	a2,0
    8000531c:	01000593          	li	a1,16
    80005320:	fffff797          	auipc	a5,0xfffff
    80005324:	d0478793          	addi	a5,a5,-764 # 80004024 <USER_TEXT_START>
    80005328:	0007b503          	ld	a0,0(a5)
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	e00080e7          	jalr	-512(ra) # 8000512c <_Z9kprintIntmib>
    80005334:	00009517          	auipc	a0,0x9
    80005338:	02450513          	addi	a0,a0,36 # 8000e358 <CONSOLE_STATUS+0x348>
    8000533c:	00000097          	auipc	ra,0x0
    80005340:	da8080e7          	jalr	-600(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    80005344:	00009517          	auipc	a0,0x9
    80005348:	d9450513          	addi	a0,a0,-620 # 8000e0d8 <CONSOLE_STATUS+0xc8>
    8000534c:	00000097          	auipc	ra,0x0
    80005350:	d98080e7          	jalr	-616(ra) # 800050e4 <_Z12kprintStringPKc>
    80005354:	00000613          	li	a2,0
    80005358:	01000593          	li	a1,16
    8000535c:	fffff797          	auipc	a5,0xfffff
    80005360:	cd078793          	addi	a5,a5,-816 # 8000402c <USER_TEXT_END>
    80005364:	0007b503          	ld	a0,0(a5)
    80005368:	00000097          	auipc	ra,0x0
    8000536c:	dc4080e7          	jalr	-572(ra) # 8000512c <_Z9kprintIntmib>
    80005370:	00009517          	auipc	a0,0x9
    80005374:	fe850513          	addi	a0,a0,-24 # 8000e358 <CONSOLE_STATUS+0x348>
    80005378:	00000097          	auipc	ra,0x0
    8000537c:	d6c080e7          	jalr	-660(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_BSS_START);
    80005380:	00009517          	auipc	a0,0x9
    80005384:	d6850513          	addi	a0,a0,-664 # 8000e0e8 <CONSOLE_STATUS+0xd8>
    80005388:	00000097          	auipc	ra,0x0
    8000538c:	d5c080e7          	jalr	-676(ra) # 800050e4 <_Z12kprintStringPKc>
    80005390:	00000613          	li	a2,0
    80005394:	01000593          	li	a1,16
    80005398:	fffff797          	auipc	a5,0xfffff
    8000539c:	c9c78793          	addi	a5,a5,-868 # 80004034 <USER_BSS_START>
    800053a0:	0007b503          	ld	a0,0(a5)
    800053a4:	00000097          	auipc	ra,0x0
    800053a8:	d88080e7          	jalr	-632(ra) # 8000512c <_Z9kprintIntmib>
    800053ac:	00009517          	auipc	a0,0x9
    800053b0:	fac50513          	addi	a0,a0,-84 # 8000e358 <CONSOLE_STATUS+0x348>
    800053b4:	00000097          	auipc	ra,0x0
    800053b8:	d30080e7          	jalr	-720(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_BSS_END);
    800053bc:	00009517          	auipc	a0,0x9
    800053c0:	d4450513          	addi	a0,a0,-700 # 8000e100 <CONSOLE_STATUS+0xf0>
    800053c4:	00000097          	auipc	ra,0x0
    800053c8:	d20080e7          	jalr	-736(ra) # 800050e4 <_Z12kprintStringPKc>
    800053cc:	00000613          	li	a2,0
    800053d0:	01000593          	li	a1,16
    800053d4:	fffff797          	auipc	a5,0xfffff
    800053d8:	c6878793          	addi	a5,a5,-920 # 8000403c <USER_BSS_END>
    800053dc:	0007b503          	ld	a0,0(a5)
    800053e0:	00000097          	auipc	ra,0x0
    800053e4:	d4c080e7          	jalr	-692(ra) # 8000512c <_Z9kprintIntmib>
    800053e8:	00009517          	auipc	a0,0x9
    800053ec:	f7050513          	addi	a0,a0,-144 # 8000e358 <CONSOLE_STATUS+0x348>
    800053f0:	00000097          	auipc	ra,0x0
    800053f4:	cf4080e7          	jalr	-780(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_DATA_START);
    800053f8:	00009517          	auipc	a0,0x9
    800053fc:	d1850513          	addi	a0,a0,-744 # 8000e110 <CONSOLE_STATUS+0x100>
    80005400:	00000097          	auipc	ra,0x0
    80005404:	ce4080e7          	jalr	-796(ra) # 800050e4 <_Z12kprintStringPKc>
    80005408:	00000613          	li	a2,0
    8000540c:	01000593          	li	a1,16
    80005410:	fffff797          	auipc	a5,0xfffff
    80005414:	c3478793          	addi	a5,a5,-972 # 80004044 <USER_DATA_START>
    80005418:	0007b503          	ld	a0,0(a5)
    8000541c:	00000097          	auipc	ra,0x0
    80005420:	d10080e7          	jalr	-752(ra) # 8000512c <_Z9kprintIntmib>
    80005424:	00009517          	auipc	a0,0x9
    80005428:	f3450513          	addi	a0,a0,-204 # 8000e358 <CONSOLE_STATUS+0x348>
    8000542c:	00000097          	auipc	ra,0x0
    80005430:	cb8080e7          	jalr	-840(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_DATA_END);
    80005434:	00009517          	auipc	a0,0x9
    80005438:	cf450513          	addi	a0,a0,-780 # 8000e128 <CONSOLE_STATUS+0x118>
    8000543c:	00000097          	auipc	ra,0x0
    80005440:	ca8080e7          	jalr	-856(ra) # 800050e4 <_Z12kprintStringPKc>
    80005444:	00000613          	li	a2,0
    80005448:	01000593          	li	a1,16
    8000544c:	fffff797          	auipc	a5,0xfffff
    80005450:	c0078793          	addi	a5,a5,-1024 # 8000404c <USER_DATA_END>
    80005454:	0007b503          	ld	a0,0(a5)
    80005458:	00000097          	auipc	ra,0x0
    8000545c:	cd4080e7          	jalr	-812(ra) # 8000512c <_Z9kprintIntmib>
    80005460:	00009517          	auipc	a0,0x9
    80005464:	ef850513          	addi	a0,a0,-264 # 8000e358 <CONSOLE_STATUS+0x348>
    80005468:	00000097          	auipc	ra,0x0
    8000546c:	c7c080e7          	jalr	-900(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_RODATA_START);
    80005470:	00009517          	auipc	a0,0x9
    80005474:	cc850513          	addi	a0,a0,-824 # 8000e138 <CONSOLE_STATUS+0x128>
    80005478:	00000097          	auipc	ra,0x0
    8000547c:	c6c080e7          	jalr	-916(ra) # 800050e4 <_Z12kprintStringPKc>
    80005480:	00000613          	li	a2,0
    80005484:	01000593          	li	a1,16
    80005488:	fffff797          	auipc	a5,0xfffff
    8000548c:	bcc78793          	addi	a5,a5,-1076 # 80004054 <USER_RODATA_START>
    80005490:	0007b503          	ld	a0,0(a5)
    80005494:	00000097          	auipc	ra,0x0
    80005498:	c98080e7          	jalr	-872(ra) # 8000512c <_Z9kprintIntmib>
    8000549c:	00009517          	auipc	a0,0x9
    800054a0:	ebc50513          	addi	a0,a0,-324 # 8000e358 <CONSOLE_STATUS+0x348>
    800054a4:	00000097          	auipc	ra,0x0
    800054a8:	c40080e7          	jalr	-960(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_RODATA_END);
    800054ac:	00009517          	auipc	a0,0x9
    800054b0:	ca450513          	addi	a0,a0,-860 # 8000e150 <CONSOLE_STATUS+0x140>
    800054b4:	00000097          	auipc	ra,0x0
    800054b8:	c30080e7          	jalr	-976(ra) # 800050e4 <_Z12kprintStringPKc>
    800054bc:	00000613          	li	a2,0
    800054c0:	01000593          	li	a1,16
    800054c4:	fffff797          	auipc	a5,0xfffff
    800054c8:	b9878793          	addi	a5,a5,-1128 # 8000405c <USER_RODATA_END>
    800054cc:	0007b503          	ld	a0,0(a5)
    800054d0:	00000097          	auipc	ra,0x0
    800054d4:	c5c080e7          	jalr	-932(ra) # 8000512c <_Z9kprintIntmib>
    800054d8:	00009517          	auipc	a0,0x9
    800054dc:	e8050513          	addi	a0,a0,-384 # 8000e358 <CONSOLE_STATUS+0x348>
    800054e0:	00000097          	auipc	ra,0x0
    800054e4:	c04080e7          	jalr	-1020(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    800054e8:	00009517          	auipc	a0,0x9
    800054ec:	c8050513          	addi	a0,a0,-896 # 8000e168 <CONSOLE_STATUS+0x158>
    800054f0:	00000097          	auipc	ra,0x0
    800054f4:	bf4080e7          	jalr	-1036(ra) # 800050e4 <_Z12kprintStringPKc>
    800054f8:	00000613          	li	a2,0
    800054fc:	01000593          	li	a1,16
    80005500:	00001537          	lui	a0,0x1
    80005504:	00000097          	auipc	ra,0x0
    80005508:	c28080e7          	jalr	-984(ra) # 8000512c <_Z9kprintIntmib>
    8000550c:	00009517          	auipc	a0,0x9
    80005510:	e4c50513          	addi	a0,a0,-436 # 8000e358 <CONSOLE_STATUS+0x348>
    80005514:	00000097          	auipc	ra,0x0
    80005518:	bd0080e7          	jalr	-1072(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("\n\n");
    8000551c:	0000a517          	auipc	a0,0xa
    80005520:	98c50513          	addi	a0,a0,-1652 # 8000eea8 <CONSOLE_STATUS+0xe98>
    80005524:	00000097          	auipc	ra,0x0
    80005528:	bc0080e7          	jalr	-1088(ra) # 800050e4 <_Z12kprintStringPKc>
    NoAlloc::init();
    8000552c:	00003097          	auipc	ra,0x3
    80005530:	8f0080e7          	jalr	-1808(ra) # 80007e1c <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    80005534:	00009517          	auipc	a0,0x9
    80005538:	c4450513          	addi	a0,a0,-956 # 8000e178 <CONSOLE_STATUS+0x168>
    8000553c:	00000097          	auipc	ra,0x0
    80005540:	ba8080e7          	jalr	-1112(ra) # 800050e4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005544:	00009517          	auipc	a0,0x9
    80005548:	c4c50513          	addi	a0,a0,-948 # 8000e190 <CONSOLE_STATUS+0x180>
    8000554c:	00000097          	auipc	ra,0x0
    80005550:	b98080e7          	jalr	-1128(ra) # 800050e4 <_Z12kprintStringPKc>
    80005554:	00000613          	li	a2,0
    80005558:	01000593          	li	a1,16
    8000555c:	0000f797          	auipc	a5,0xf
    80005560:	e5478793          	addi	a5,a5,-428 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80005564:	0007b503          	ld	a0,0(a5)
    80005568:	00000097          	auipc	ra,0x0
    8000556c:	bc4080e7          	jalr	-1084(ra) # 8000512c <_Z9kprintIntmib>
    80005570:	00009517          	auipc	a0,0x9
    80005574:	de850513          	addi	a0,a0,-536 # 8000e358 <CONSOLE_STATUS+0x348>
    80005578:	00000097          	auipc	ra,0x0
    8000557c:	b6c080e7          	jalr	-1172(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("Initalizing kmem!!!\n");
    80005580:	00009517          	auipc	a0,0x9
    80005584:	c2850513          	addi	a0,a0,-984 # 8000e1a8 <CONSOLE_STATUS+0x198>
    80005588:	00000097          	auipc	ra,0x0
    8000558c:	b5c080e7          	jalr	-1188(ra) # 800050e4 <_Z12kprintStringPKc>
    if(kmi()){
    80005590:	00002097          	auipc	ra,0x2
    80005594:	998080e7          	jalr	-1640(ra) # 80006f28 <_Z3kmiv>
    80005598:	18051a63          	bnez	a0,8000572c <_Z10kernelInitv+0x544>
    8000559c:	00050493          	mv	s1,a0
    kprintString("kmem initalized!!!\n");
    800055a0:	00009517          	auipc	a0,0x9
    800055a4:	c4850513          	addi	a0,a0,-952 # 8000e1e8 <CONSOLE_STATUS+0x1d8>
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	b3c080e7          	jalr	-1220(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("Paging init!\n");
    800055b0:	00009517          	auipc	a0,0x9
    800055b4:	c5050513          	addi	a0,a0,-944 # 8000e200 <CONSOLE_STATUS+0x1f0>
    800055b8:	00000097          	auipc	ra,0x0
    800055bc:	b2c080e7          	jalr	-1236(ra) # 800050e4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800055c0:	000407b7          	lui	a5,0x40
    800055c4:	1007a073          	csrs	sstatus,a5
    Pager& pager = Pager::getInstance();
    800055c8:	00005097          	auipc	ra,0x5
    800055cc:	534080e7          	jalr	1332(ra) # 8000aafc <_ZN5Pager11getInstanceEv>
    800055d0:	00050913          	mv	s2,a0
    pager.map_kernel();
    800055d4:	00005097          	auipc	ra,0x5
    800055d8:	73c080e7          	jalr	1852(ra) # 8000ad10 <_ZN5Pager10map_kernelEv>
    pager.map_user();
    800055dc:	00090513          	mv	a0,s2
    800055e0:	00005097          	auipc	ra,0x5
    800055e4:	7d8080e7          	jalr	2008(ra) # 8000adb8 <_ZN5Pager8map_userEv>
    pager.start_paging();
    800055e8:	00090513          	mv	a0,s2
    800055ec:	00006097          	auipc	ra,0x6
    800055f0:	898080e7          	jalr	-1896(ra) # 8000ae84 <_ZN5Pager12start_pagingEv>
    kprintString("Paging initalized!\n");
    800055f4:	00009517          	auipc	a0,0x9
    800055f8:	c1c50513          	addi	a0,a0,-996 # 8000e210 <CONSOLE_STATUS+0x200>
    800055fc:	00000097          	auipc	ra,0x0
    80005600:	ae8080e7          	jalr	-1304(ra) # 800050e4 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec); 
    80005604:	fffff797          	auipc	a5,0xfffff
    80005608:	a6c78793          	addi	a5,a5,-1428 # 80004070 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    8000560c:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80005610:	00009517          	auipc	a0,0x9
    80005614:	c1850513          	addi	a0,a0,-1000 # 8000e228 <CONSOLE_STATUS+0x218>
    80005618:	00000097          	auipc	ra,0x0
    8000561c:	acc080e7          	jalr	-1332(ra) # 800050e4 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance().print_list();
    80005620:	00002097          	auipc	ra,0x2
    80005624:	fac080e7          	jalr	-84(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    80005628:	00002097          	auipc	ra,0x2
    8000562c:	5b8080e7          	jalr	1464(ra) # 80007be0 <_ZN15MemoryAllocator10print_listEv>
    kprintString("MemoryAllocator initalized!\n");
    80005630:	00009517          	auipc	a0,0x9
    80005634:	c1050513          	addi	a0,a0,-1008 # 8000e240 <CONSOLE_STATUS+0x230>
    80005638:	00000097          	auipc	ra,0x0
    8000563c:	aac080e7          	jalr	-1364(ra) # 800050e4 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80005640:	fffff097          	auipc	ra,0xfffff
    80005644:	f34080e7          	jalr	-204(ra) # 80004574 <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80005648:	00009517          	auipc	a0,0x9
    8000564c:	c1850513          	addi	a0,a0,-1000 # 8000e260 <CONSOLE_STATUS+0x250>
    80005650:	00000097          	auipc	ra,0x0
    80005654:	a94080e7          	jalr	-1388(ra) # 800050e4 <_Z12kprintStringPKc>
    StdIO::initalize();
    80005658:	00004097          	auipc	ra,0x4
    8000565c:	e64080e7          	jalr	-412(ra) # 800094bc <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80005660:	00009517          	auipc	a0,0x9
    80005664:	c1850513          	addi	a0,a0,-1000 # 8000e278 <CONSOLE_STATUS+0x268>
    80005668:	00000097          	auipc	ra,0x0
    8000566c:	a7c080e7          	jalr	-1412(ra) # 800050e4 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80005670:	fffff097          	auipc	ra,0xfffff
    80005674:	400080e7          	jalr	1024(ra) # 80004a70 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80005678:	00009517          	auipc	a0,0x9
    8000567c:	c1850513          	addi	a0,a0,-1000 # 8000e290 <CONSOLE_STATUS+0x280>
    80005680:	00000097          	auipc	ra,0x0
    80005684:	a64080e7          	jalr	-1436(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80005688:	00009517          	auipc	a0,0x9
    8000568c:	c2850513          	addi	a0,a0,-984 # 8000e2b0 <CONSOLE_STATUS+0x2a0>
    80005690:	00000097          	auipc	ra,0x0
    80005694:	a54080e7          	jalr	-1452(ra) # 800050e4 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80005698:	00001537          	lui	a0,0x1
    8000569c:	00000097          	auipc	ra,0x0
    800056a0:	9c0080e7          	jalr	-1600(ra) # 8000505c <_Z7kmallocm>
    800056a4:	00050913          	mv	s2,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    800056a8:	00050613          	mv	a2,a0
    800056ac:	00000593          	li	a1,0
    800056b0:	00008517          	auipc	a0,0x8
    800056b4:	c8850513          	addi	a0,a0,-888 # 8000d338 <_Z15userMainWrapperPv>
    800056b8:	fffff097          	auipc	ra,0xfffff
    800056bc:	320080e7          	jalr	800(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800056c0:	00050a13          	mv	s4,a0
    uint64* idleThreadStack = (uint64*)SlabAllocator::getInstance().kmalloc(DEFAULT_STACK_SIZE);
    800056c4:	00004097          	auipc	ra,0x4
    800056c8:	a78080e7          	jalr	-1416(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    800056cc:	000015b7          	lui	a1,0x1
    800056d0:	00004097          	auipc	ra,0x4
    800056d4:	b6c080e7          	jalr	-1172(ra) # 8000923c <_ZN13SlabAllocator7kmallocEm>
    800056d8:	00050993          	mv	s3,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    800056dc:	00050613          	mv	a2,a0
    800056e0:	00000593          	li	a1,0
    800056e4:	00000517          	auipc	a0,0x0
    800056e8:	95c50513          	addi	a0,a0,-1700 # 80005040 <_Z12idleFunctionPv>
    800056ec:	fffff097          	auipc	ra,0xfffff
    800056f0:	2ec080e7          	jalr	748(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    800056f4:	02050aa3          	sb	zero,53(a0)
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    800056f8:	06090663          	beqz	s2,80005764 <_Z10kernelInitv+0x57c>
    800056fc:	06098863          	beqz	s3,8000576c <_Z10kernelInitv+0x584>
    80005700:	06050a63          	beqz	a0,80005774 <_Z10kernelInitv+0x58c>
    80005704:	060a0c63          	beqz	s4,8000577c <_Z10kernelInitv+0x594>
        kprintString("Threads successfully initalized!\n");
    80005708:	00009517          	auipc	a0,0x9
    8000570c:	bd850513          	addi	a0,a0,-1064 # 8000e2e0 <CONSOLE_STATUS+0x2d0>
    80005710:	00000097          	auipc	ra,0x0
    80005714:	9d4080e7          	jalr	-1580(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80005718:	00009517          	auipc	a0,0x9
    8000571c:	bf050513          	addi	a0,a0,-1040 # 8000e308 <CONSOLE_STATUS+0x2f8>
    80005720:	00000097          	auipc	ra,0x0
    80005724:	9c4080e7          	jalr	-1596(ra) # 800050e4 <_Z12kprintStringPKc>
    return 0;
    80005728:	0180006f          	j	80005740 <_Z10kernelInitv+0x558>
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
    8000572c:	00009517          	auipc	a0,0x9
    80005730:	a9450513          	addi	a0,a0,-1388 # 8000e1c0 <CONSOLE_STATUS+0x1b0>
    80005734:	00000097          	auipc	ra,0x0
    80005738:	9b0080e7          	jalr	-1616(ra) # 800050e4 <_Z12kprintStringPKc>
        return 1;
    8000573c:	00100493          	li	s1,1
}
    80005740:	00048513          	mv	a0,s1
    80005744:	02813083          	ld	ra,40(sp)
    80005748:	02013403          	ld	s0,32(sp)
    8000574c:	01813483          	ld	s1,24(sp)
    80005750:	01013903          	ld	s2,16(sp)
    80005754:	00813983          	ld	s3,8(sp)
    80005758:	00013a03          	ld	s4,0(sp)
    8000575c:	03010113          	addi	sp,sp,48
    80005760:	00008067          	ret
        return -1; /* EXCEPTION */
    80005764:	fff00493          	li	s1,-1
    80005768:	fd9ff06f          	j	80005740 <_Z10kernelInitv+0x558>
    8000576c:	fff00493          	li	s1,-1
    80005770:	fd1ff06f          	j	80005740 <_Z10kernelInitv+0x558>
    80005774:	fff00493          	li	s1,-1
    80005778:	fc9ff06f          	j	80005740 <_Z10kernelInitv+0x558>
    8000577c:	fff00493          	li	s1,-1
    80005780:	fc1ff06f          	j	80005740 <_Z10kernelInitv+0x558>

0000000080005784 <_Z13newKernelInitv>:

int newKernelInit(){
    80005784:	fe010113          	addi	sp,sp,-32
    80005788:	00113c23          	sd	ra,24(sp)
    8000578c:	00813823          	sd	s0,16(sp)
    80005790:	00913423          	sd	s1,8(sp)
    80005794:	02010413          	addi	s0,sp,32
    kprintString("--------------KERNEL INIT--------------\n");
    80005798:	00009517          	auipc	a0,0x9
    8000579c:	8a050513          	addi	a0,a0,-1888 # 8000e038 <CONSOLE_STATUS+0x28>
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	944080e7          	jalr	-1724(ra) # 800050e4 <_Z12kprintStringPKc>
    /* CHECKING VALUES OF KERNEL STATIC VARIABLES */
    KCHECKPRINT(HEAP_START_ADDR);
    800057a8:	00009517          	auipc	a0,0x9
    800057ac:	8c050513          	addi	a0,a0,-1856 # 8000e068 <CONSOLE_STATUS+0x58>
    800057b0:	00000097          	auipc	ra,0x0
    800057b4:	934080e7          	jalr	-1740(ra) # 800050e4 <_Z12kprintStringPKc>
    800057b8:	00000613          	li	a2,0
    800057bc:	01000593          	li	a1,16
    800057c0:	0000d797          	auipc	a5,0xd
    800057c4:	20078793          	addi	a5,a5,512 # 800129c0 <HEAP_START_ADDR>
    800057c8:	0007b503          	ld	a0,0(a5)
    800057cc:	00000097          	auipc	ra,0x0
    800057d0:	960080e7          	jalr	-1696(ra) # 8000512c <_Z9kprintIntmib>
    800057d4:	00009517          	auipc	a0,0x9
    800057d8:	b8450513          	addi	a0,a0,-1148 # 8000e358 <CONSOLE_STATUS+0x348>
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	908080e7          	jalr	-1784(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    800057e4:	00009517          	auipc	a0,0x9
    800057e8:	89c50513          	addi	a0,a0,-1892 # 8000e080 <CONSOLE_STATUS+0x70>
    800057ec:	00000097          	auipc	ra,0x0
    800057f0:	8f8080e7          	jalr	-1800(ra) # 800050e4 <_Z12kprintStringPKc>
    800057f4:	00000613          	li	a2,0
    800057f8:	01000593          	li	a1,16
    800057fc:	0000d797          	auipc	a5,0xd
    80005800:	1bc78793          	addi	a5,a5,444 # 800129b8 <HEAP_END_ADDR>
    80005804:	0007b503          	ld	a0,0(a5)
    80005808:	00000097          	auipc	ra,0x0
    8000580c:	924080e7          	jalr	-1756(ra) # 8000512c <_Z9kprintIntmib>
    80005810:	00009517          	auipc	a0,0x9
    80005814:	b4850513          	addi	a0,a0,-1208 # 8000e358 <CONSOLE_STATUS+0x348>
    80005818:	00000097          	auipc	ra,0x0
    8000581c:	8cc080e7          	jalr	-1844(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    80005820:	00009517          	auipc	a0,0x9
    80005824:	87050513          	addi	a0,a0,-1936 # 8000e090 <CONSOLE_STATUS+0x80>
    80005828:	00000097          	auipc	ra,0x0
    8000582c:	8bc080e7          	jalr	-1860(ra) # 800050e4 <_Z12kprintStringPKc>
    80005830:	00000613          	li	a2,0
    80005834:	01000593          	li	a1,16
    80005838:	ffffe797          	auipc	a5,0xffffe
    8000583c:	7dc78793          	addi	a5,a5,2012 # 80004014 <KERNEL_TEXT_START>
    80005840:	0007b503          	ld	a0,0(a5)
    80005844:	00000097          	auipc	ra,0x0
    80005848:	8e8080e7          	jalr	-1816(ra) # 8000512c <_Z9kprintIntmib>
    8000584c:	00009517          	auipc	a0,0x9
    80005850:	b0c50513          	addi	a0,a0,-1268 # 8000e358 <CONSOLE_STATUS+0x348>
    80005854:	00000097          	auipc	ra,0x0
    80005858:	890080e7          	jalr	-1904(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    8000585c:	00009517          	auipc	a0,0x9
    80005860:	84c50513          	addi	a0,a0,-1972 # 8000e0a8 <CONSOLE_STATUS+0x98>
    80005864:	00000097          	auipc	ra,0x0
    80005868:	880080e7          	jalr	-1920(ra) # 800050e4 <_Z12kprintStringPKc>
    8000586c:	00000613          	li	a2,0
    80005870:	01000593          	li	a1,16
    80005874:	ffffe797          	auipc	a5,0xffffe
    80005878:	7a878793          	addi	a5,a5,1960 # 8000401c <KERNEL_TEXT_END>
    8000587c:	0007b503          	ld	a0,0(a5)
    80005880:	00000097          	auipc	ra,0x0
    80005884:	8ac080e7          	jalr	-1876(ra) # 8000512c <_Z9kprintIntmib>
    80005888:	00009517          	auipc	a0,0x9
    8000588c:	ad050513          	addi	a0,a0,-1328 # 8000e358 <CONSOLE_STATUS+0x348>
    80005890:	00000097          	auipc	ra,0x0
    80005894:	854080e7          	jalr	-1964(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    80005898:	00009517          	auipc	a0,0x9
    8000589c:	82850513          	addi	a0,a0,-2008 # 8000e0c0 <CONSOLE_STATUS+0xb0>
    800058a0:	00000097          	auipc	ra,0x0
    800058a4:	844080e7          	jalr	-1980(ra) # 800050e4 <_Z12kprintStringPKc>
    800058a8:	00000613          	li	a2,0
    800058ac:	01000593          	li	a1,16
    800058b0:	ffffe797          	auipc	a5,0xffffe
    800058b4:	77478793          	addi	a5,a5,1908 # 80004024 <USER_TEXT_START>
    800058b8:	0007b503          	ld	a0,0(a5)
    800058bc:	00000097          	auipc	ra,0x0
    800058c0:	870080e7          	jalr	-1936(ra) # 8000512c <_Z9kprintIntmib>
    800058c4:	00009517          	auipc	a0,0x9
    800058c8:	a9450513          	addi	a0,a0,-1388 # 8000e358 <CONSOLE_STATUS+0x348>
    800058cc:	00000097          	auipc	ra,0x0
    800058d0:	818080e7          	jalr	-2024(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    800058d4:	00009517          	auipc	a0,0x9
    800058d8:	80450513          	addi	a0,a0,-2044 # 8000e0d8 <CONSOLE_STATUS+0xc8>
    800058dc:	00000097          	auipc	ra,0x0
    800058e0:	808080e7          	jalr	-2040(ra) # 800050e4 <_Z12kprintStringPKc>
    800058e4:	00000613          	li	a2,0
    800058e8:	01000593          	li	a1,16
    800058ec:	ffffe797          	auipc	a5,0xffffe
    800058f0:	74078793          	addi	a5,a5,1856 # 8000402c <USER_TEXT_END>
    800058f4:	0007b503          	ld	a0,0(a5)
    800058f8:	00000097          	auipc	ra,0x0
    800058fc:	834080e7          	jalr	-1996(ra) # 8000512c <_Z9kprintIntmib>
    80005900:	00009517          	auipc	a0,0x9
    80005904:	a5850513          	addi	a0,a0,-1448 # 8000e358 <CONSOLE_STATUS+0x348>
    80005908:	fffff097          	auipc	ra,0xfffff
    8000590c:	7dc080e7          	jalr	2012(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    80005910:	00009517          	auipc	a0,0x9
    80005914:	85850513          	addi	a0,a0,-1960 # 8000e168 <CONSOLE_STATUS+0x158>
    80005918:	fffff097          	auipc	ra,0xfffff
    8000591c:	7cc080e7          	jalr	1996(ra) # 800050e4 <_Z12kprintStringPKc>
    80005920:	00000613          	li	a2,0
    80005924:	01000593          	li	a1,16
    80005928:	00001537          	lui	a0,0x1
    8000592c:	00000097          	auipc	ra,0x0
    80005930:	800080e7          	jalr	-2048(ra) # 8000512c <_Z9kprintIntmib>
    80005934:	00009517          	auipc	a0,0x9
    80005938:	a2450513          	addi	a0,a0,-1500 # 8000e358 <CONSOLE_STATUS+0x348>
    8000593c:	fffff097          	auipc	ra,0xfffff
    80005940:	7a8080e7          	jalr	1960(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("\n\n");
    80005944:	00009517          	auipc	a0,0x9
    80005948:	56450513          	addi	a0,a0,1380 # 8000eea8 <CONSOLE_STATUS+0xe98>
    8000594c:	fffff097          	auipc	ra,0xfffff
    80005950:	798080e7          	jalr	1944(ra) # 800050e4 <_Z12kprintStringPKc>

    /* INITALIZING MAIN KERNEL OBJECTS */
    NoAlloc::init(); /* No Allocator init */ 
    80005954:	00002097          	auipc	ra,0x2
    80005958:	4c8080e7          	jalr	1224(ra) # 80007e1c <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    8000595c:	00009517          	auipc	a0,0x9
    80005960:	81c50513          	addi	a0,a0,-2020 # 8000e178 <CONSOLE_STATUS+0x168>
    80005964:	fffff097          	auipc	ra,0xfffff
    80005968:	780080e7          	jalr	1920(ra) # 800050e4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    8000596c:	00009517          	auipc	a0,0x9
    80005970:	82450513          	addi	a0,a0,-2012 # 8000e190 <CONSOLE_STATUS+0x180>
    80005974:	fffff097          	auipc	ra,0xfffff
    80005978:	770080e7          	jalr	1904(ra) # 800050e4 <_Z12kprintStringPKc>
    8000597c:	00000613          	li	a2,0
    80005980:	01000593          	li	a1,16
    80005984:	0000f797          	auipc	a5,0xf
    80005988:	a2c78793          	addi	a5,a5,-1492 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    8000598c:	0007b503          	ld	a0,0(a5)
    80005990:	fffff097          	auipc	ra,0xfffff
    80005994:	79c080e7          	jalr	1948(ra) # 8000512c <_Z9kprintIntmib>
    80005998:	00009517          	auipc	a0,0x9
    8000599c:	9c050513          	addi	a0,a0,-1600 # 8000e358 <CONSOLE_STATUS+0x348>
    800059a0:	fffff097          	auipc	ra,0xfffff
    800059a4:	744080e7          	jalr	1860(ra) # 800050e4 <_Z12kprintStringPKc>
    

    kprintString("Initalizing kmem!!!\n");
    800059a8:	00009517          	auipc	a0,0x9
    800059ac:	80050513          	addi	a0,a0,-2048 # 8000e1a8 <CONSOLE_STATUS+0x198>
    800059b0:	fffff097          	auipc	ra,0xfffff
    800059b4:	734080e7          	jalr	1844(ra) # 800050e4 <_Z12kprintStringPKc>
    if(kmi()){
    800059b8:	00001097          	auipc	ra,0x1
    800059bc:	570080e7          	jalr	1392(ra) # 80006f28 <_Z3kmiv>
    800059c0:	06051663          	bnez	a0,80005a2c <_Z13newKernelInitv+0x2a8>
    800059c4:	00050493          	mv	s1,a0
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
        return 1;
    }
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    800059c8:	00008517          	auipc	a0,0x8
    800059cc:	7c850513          	addi	a0,a0,1992 # 8000e190 <CONSOLE_STATUS+0x180>
    800059d0:	fffff097          	auipc	ra,0xfffff
    800059d4:	714080e7          	jalr	1812(ra) # 800050e4 <_Z12kprintStringPKc>
    800059d8:	00000613          	li	a2,0
    800059dc:	01000593          	li	a1,16
    800059e0:	0000f797          	auipc	a5,0xf
    800059e4:	9d078793          	addi	a5,a5,-1584 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    800059e8:	0007b503          	ld	a0,0(a5)
    800059ec:	fffff097          	auipc	ra,0xfffff
    800059f0:	740080e7          	jalr	1856(ra) # 8000512c <_Z9kprintIntmib>
    800059f4:	00009517          	auipc	a0,0x9
    800059f8:	96450513          	addi	a0,a0,-1692 # 8000e358 <CONSOLE_STATUS+0x348>
    800059fc:	fffff097          	auipc	ra,0xfffff
    80005a00:	6e8080e7          	jalr	1768(ra) # 800050e4 <_Z12kprintStringPKc>
    /* Pager Init */
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80005a04:	00009517          	auipc	a0,0x9
    80005a08:	90450513          	addi	a0,a0,-1788 # 8000e308 <CONSOLE_STATUS+0x2f8>
    80005a0c:	fffff097          	auipc	ra,0xfffff
    80005a10:	6d8080e7          	jalr	1752(ra) # 800050e4 <_Z12kprintStringPKc>
    return 0;
}
    80005a14:	00048513          	mv	a0,s1
    80005a18:	01813083          	ld	ra,24(sp)
    80005a1c:	01013403          	ld	s0,16(sp)
    80005a20:	00813483          	ld	s1,8(sp)
    80005a24:	02010113          	addi	sp,sp,32
    80005a28:	00008067          	ret
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
    80005a2c:	00008517          	auipc	a0,0x8
    80005a30:	79450513          	addi	a0,a0,1940 # 8000e1c0 <CONSOLE_STATUS+0x1b0>
    80005a34:	fffff097          	auipc	ra,0xfffff
    80005a38:	6b0080e7          	jalr	1712(ra) # 800050e4 <_Z12kprintStringPKc>
        return 1;
    80005a3c:	00100493          	li	s1,1
    80005a40:	fd5ff06f          	j	80005a14 <_Z13newKernelInitv+0x290>

0000000080005a44 <_Z8align4kbm>:

uint64 align4kb(uint64 input){
    80005a44:	ff010113          	addi	sp,sp,-16
    80005a48:	00813423          	sd	s0,8(sp)
    80005a4c:	01010413          	addi	s0,sp,16
    return  (input + 4095ULL) & ( (~0ULL) << 12);
    80005a50:	000017b7          	lui	a5,0x1
    80005a54:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80005a58:	00f50533          	add	a0,a0,a5
}
    80005a5c:	fffff7b7          	lui	a5,0xfffff
    80005a60:	00f57533          	and	a0,a0,a5
    80005a64:	00813403          	ld	s0,8(sp)
    80005a68:	01010113          	addi	sp,sp,16
    80005a6c:	00008067          	ret

0000000080005a70 <_Z11closest2powm>:


uint64 closest2pow(uint64 input){ 
    80005a70:	ff010113          	addi	sp,sp,-16
    80005a74:	00813423          	sd	s0,8(sp)
    80005a78:	01010413          	addi	s0,sp,16
    /* set start to 2^0 */
    uint64 i = 1; 
    80005a7c:	00100793          	li	a5,1

    /* iterate till i >= input */
    while ( i < input){ i <<= 1; }
    80005a80:	00a7f663          	bgeu	a5,a0,80005a8c <_Z11closest2powm+0x1c>
    80005a84:	00179793          	slli	a5,a5,0x1
    80005a88:	ff9ff06f          	j	80005a80 <_Z11closest2powm+0x10>
    
    return i;
}
    80005a8c:	00078513          	mv	a0,a5
    80005a90:	00813403          	ld	s0,8(sp)
    80005a94:	01010113          	addi	sp,sp,16
    80005a98:	00008067          	ret

0000000080005a9c <_Z4log2m>:

char log2(uint64 input){
    80005a9c:	ff010113          	addi	sp,sp,-16
    80005aa0:	00813423          	sd	s0,8(sp)
    80005aa4:	01010413          	addi	s0,sp,16
    int t = 0;
    80005aa8:	00000793          	li	a5,0
    while(input > 1) {
    80005aac:	00100713          	li	a4,1
    80005ab0:	00a77863          	bgeu	a4,a0,80005ac0 <_Z4log2m+0x24>
        input >>= 1;
    80005ab4:	00155513          	srli	a0,a0,0x1
        t++;
    80005ab8:	0017879b          	addiw	a5,a5,1
    while(input > 1) {
    80005abc:	ff1ff06f          	j	80005aac <_Z4log2m+0x10>
    }
    return t;
}
    80005ac0:	0ff7f513          	andi	a0,a5,255
    80005ac4:	00813403          	ld	s0,8(sp)
    80005ac8:	01010113          	addi	sp,sp,16
    80005acc:	00008067          	ret

0000000080005ad0 <_Z3osbm>:

bool osb(uint64 input){
    80005ad0:	ff010113          	addi	sp,sp,-16
    80005ad4:	00813423          	sd	s0,8(sp)
    80005ad8:	01010413          	addi	s0,sp,16
    if (!input) return 0;
    80005adc:	02050063          	beqz	a0,80005afc <_Z3osbm+0x2c>
    return (input & (-input)) == input;
    80005ae0:	40a007b3          	neg	a5,a0
    80005ae4:	00a7f7b3          	and	a5,a5,a0
    80005ae8:	40a78533          	sub	a0,a5,a0
    80005aec:	00153513          	seqz	a0,a0
}
    80005af0:	00813403          	ld	s0,8(sp)
    80005af4:	01010113          	addi	sp,sp,16
    80005af8:	00008067          	ret
    if (!input) return 0;
    80005afc:	00000513          	li	a0,0
    80005b00:	ff1ff06f          	j	80005af0 <_Z3osbm+0x20>

0000000080005b04 <_Z13oldKernelMainv>:
#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

int oldKernelMain(){
    80005b04:	fd010113          	addi	sp,sp,-48
    80005b08:	02113423          	sd	ra,40(sp)
    80005b0c:	02813023          	sd	s0,32(sp)
    80005b10:	00913c23          	sd	s1,24(sp)
    80005b14:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    80005b18:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    80005b1c:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    80005b20:	fffff097          	auipc	ra,0xfffff
    80005b24:	d28080e7          	jalr	-728(ra) # 80004848 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    80005b28:	fffff097          	auipc	ra,0xfffff
    80005b2c:	6c0080e7          	jalr	1728(ra) # 800051e8 <_Z10kernelInitv>
    if(panic < 0){
    80005b30:	04054a63          	bltz	a0,80005b84 <_Z13oldKernelMainv+0x80>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005b34:	100027f3          	csrr	a5,sstatus
    80005b38:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005b3c:	fd843483          	ld	s1,-40(s0)
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    kprintString("Starting User Process\n");
    80005b40:	00009517          	auipc	a0,0x9
    80005b44:	82050513          	addi	a0,a0,-2016 # 8000e360 <CONSOLE_STATUS+0x350>
    80005b48:	fffff097          	auipc	ra,0xfffff
    80005b4c:	59c080e7          	jalr	1436(ra) # 800050e4 <_Z12kprintStringPKc>
    TCB::yield();
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	0b8080e7          	jalr	184(ra) # 80004c08 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005b58:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("SRECNA NOVA GODINAAAA!!!!!");
    80005b5c:	00009517          	auipc	a0,0x9
    80005b60:	81c50513          	addi	a0,a0,-2020 # 8000e378 <CONSOLE_STATUS+0x368>
    80005b64:	fffff097          	auipc	ra,0xfffff
    80005b68:	580080e7          	jalr	1408(ra) # 800050e4 <_Z12kprintStringPKc>
    //kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    return 0;
    80005b6c:	00000513          	li	a0,0
}
    80005b70:	02813083          	ld	ra,40(sp)
    80005b74:	02013403          	ld	s0,32(sp)
    80005b78:	01813483          	ld	s1,24(sp)
    80005b7c:	03010113          	addi	sp,sp,48
    80005b80:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80005b84:	00008517          	auipc	a0,0x8
    80005b88:	7b450513          	addi	a0,a0,1972 # 8000e338 <CONSOLE_STATUS+0x328>
    80005b8c:	fffff097          	auipc	ra,0xfffff
    80005b90:	558080e7          	jalr	1368(ra) # 800050e4 <_Z12kprintStringPKc>
        return -1;
    80005b94:	fff00513          	li	a0,-1
    80005b98:	fd9ff06f          	j	80005b70 <_Z13oldKernelMainv+0x6c>

0000000080005b9c <_Z13newKernelMainv>:

int newKernelMain(){
    80005b9c:	fd010113          	addi	sp,sp,-48
    80005ba0:	02113423          	sd	ra,40(sp)
    80005ba4:	02813023          	sd	s0,32(sp)
    80005ba8:	00913c23          	sd	s1,24(sp)
    80005bac:	01213823          	sd	s2,16(sp)
    80005bb0:	03010413          	addi	s0,sp,48
    asm volatile("mv %0, sp" : "=r" (a0));
    80005bb4:	00010493          	mv	s1,sp
    uint64 sp = Riscv::r_sp();
    KCHECKPRINT(sp);
    80005bb8:	00008517          	auipc	a0,0x8
    80005bbc:	7e050513          	addi	a0,a0,2016 # 8000e398 <CONSOLE_STATUS+0x388>
    80005bc0:	fffff097          	auipc	ra,0xfffff
    80005bc4:	524080e7          	jalr	1316(ra) # 800050e4 <_Z12kprintStringPKc>
    80005bc8:	00000613          	li	a2,0
    80005bcc:	01000593          	li	a1,16
    80005bd0:	00048513          	mv	a0,s1
    80005bd4:	fffff097          	auipc	ra,0xfffff
    80005bd8:	558080e7          	jalr	1368(ra) # 8000512c <_Z9kprintIntmib>
    80005bdc:	00008517          	auipc	a0,0x8
    80005be0:	77c50513          	addi	a0,a0,1916 # 8000e358 <CONSOLE_STATUS+0x348>
    80005be4:	fffff097          	auipc	ra,0xfffff
    80005be8:	500080e7          	jalr	1280(ra) # 800050e4 <_Z12kprintStringPKc>
    if(newKernelInit()){
    80005bec:	00000097          	auipc	ra,0x0
    80005bf0:	b98080e7          	jalr	-1128(ra) # 80005784 <_Z13newKernelInitv>
    80005bf4:	02051e63          	bnez	a0,80005c30 <_Z13newKernelMainv+0x94>
    80005bf8:	00050493          	mv	s1,a0
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005bfc:	100027f3          	csrr	a5,sstatus
    80005c00:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005c04:	fd843903          	ld	s2,-40(s0)
        kprintString("KERNEL PANIC: KERNEL NOT SUCCESFULLY INITALIZED!!!\n");
        return 1;
    }   

    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    80005c08:	fffff097          	auipc	ra,0xfffff
    80005c0c:	000080e7          	jalr	ra # 80004c08 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005c10:	10091073          	csrw	sstatus,s2
    // buddy_test();
    // slab_test();
    // paging_test();
    
    return 0;
}
    80005c14:	00048513          	mv	a0,s1
    80005c18:	02813083          	ld	ra,40(sp)
    80005c1c:	02013403          	ld	s0,32(sp)
    80005c20:	01813483          	ld	s1,24(sp)
    80005c24:	01013903          	ld	s2,16(sp)
    80005c28:	03010113          	addi	sp,sp,48
    80005c2c:	00008067          	ret
        kprintString("KERNEL PANIC: KERNEL NOT SUCCESFULLY INITALIZED!!!\n");
    80005c30:	00008517          	auipc	a0,0x8
    80005c34:	77050513          	addi	a0,a0,1904 # 8000e3a0 <CONSOLE_STATUS+0x390>
    80005c38:	fffff097          	auipc	ra,0xfffff
    80005c3c:	4ac080e7          	jalr	1196(ra) # 800050e4 <_Z12kprintStringPKc>
        return 1;
    80005c40:	00100493          	li	s1,1
    80005c44:	fd1ff06f          	j	80005c14 <_Z13newKernelMainv+0x78>

0000000080005c48 <main>:

int main(){
    80005c48:	ff010113          	addi	sp,sp,-16
    80005c4c:	00113423          	sd	ra,8(sp)
    80005c50:	00813023          	sd	s0,0(sp)
    80005c54:	01010413          	addi	s0,sp,16
    return oldKernelMain();
    80005c58:	00000097          	auipc	ra,0x0
    80005c5c:	eac080e7          	jalr	-340(ra) # 80005b04 <_Z13oldKernelMainv>
    80005c60:	00813083          	ld	ra,8(sp)
    80005c64:	00013403          	ld	s0,0(sp)
    80005c68:	01010113          	addi	sp,sp,16
    80005c6c:	00008067          	ret

0000000080005c70 <_Z13timer_handlerv>:
    PFI = 12,
    PFW = 15
};

void timer_handler()
{
    80005c70:	fd010113          	addi	sp,sp,-48
    80005c74:	02113423          	sd	ra,40(sp)
    80005c78:	02813023          	sd	s0,32(sp)
    80005c7c:	00913c23          	sd	s1,24(sp)
    80005c80:	01213823          	sd	s2,16(sp)
    80005c84:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80005c88:	fffff097          	auipc	ra,0xfffff
    80005c8c:	98c080e7          	jalr	-1652(ra) # 80004614 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80005c90:	0000e717          	auipc	a4,0xe
    80005c94:	6e870713          	addi	a4,a4,1768 # 80014378 <_ZN3TCB16timeSliceCounterE>
    80005c98:	00073783          	ld	a5,0(a4)
    80005c9c:	00178793          	addi	a5,a5,1 # fffffffffffff001 <_user_bss_end+0xffffffff7ffe8fe1>
    80005ca0:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80005ca4:	0000e717          	auipc	a4,0xe
    80005ca8:	6dc70713          	addi	a4,a4,1756 # 80014380 <_ZN3TCB7runningE>
    80005cac:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80005cb0:	02873703          	ld	a4,40(a4)
    80005cb4:	02e7f263          	bgeu	a5,a4,80005cd8 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80005cb8:	00200793          	li	a5,2
    80005cbc:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80005cc0:	02813083          	ld	ra,40(sp)
    80005cc4:	02013403          	ld	s0,32(sp)
    80005cc8:	01813483          	ld	s1,24(sp)
    80005ccc:	01013903          	ld	s2,16(sp)
    80005cd0:	03010113          	addi	sp,sp,48
    80005cd4:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005cd8:	100027f3          	csrr	a5,sstatus
    80005cdc:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005ce0:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005ce4:	141027f3          	csrr	a5,sepc
    80005ce8:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80005cec:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    80005cf0:	0000e797          	auipc	a5,0xe
    80005cf4:	6807b423          	sd	zero,1672(a5) # 80014378 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005cf8:	fffff097          	auipc	ra,0xfffff
    80005cfc:	f10080e7          	jalr	-240(ra) # 80004c08 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005d00:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005d04:	14149073          	csrw	sepc,s1
    80005d08:	fb1ff06f          	j	80005cb8 <_Z13timer_handlerv+0x48>

0000000080005d0c <_Z8usrEcallmmmmm>:

volatile uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80005d0c:	fb010113          	addi	sp,sp,-80
    80005d10:	04113423          	sd	ra,72(sp)
    80005d14:	04813023          	sd	s0,64(sp)
    80005d18:	02913c23          	sd	s1,56(sp)
    80005d1c:	03213823          	sd	s2,48(sp)
    80005d20:	03313423          	sd	s3,40(sp)
    80005d24:	03413023          	sd	s4,32(sp)
    80005d28:	01513c23          	sd	s5,24(sp)
    80005d2c:	01613823          	sd	s6,16(sp)
    80005d30:	05010413          	addi	s0,sp,80
    80005d34:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005d38:	141027f3          	csrr	a5,sepc
    80005d3c:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80005d40:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005d44:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005d48:	100027f3          	csrr	a5,sstatus
    80005d4c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80005d50:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80005d54:	00100793          	li	a5,1
    80005d58:	0ef50463          	beq	a0,a5,80005e40 <_Z8usrEcallmmmmm+0x134>
    80005d5c:	00050493          	mv	s1,a0
    80005d60:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        //KCHECKPRINT(ret);
    }
    else if(a0 == MF)
    80005d64:	00200793          	li	a5,2
    80005d68:	12f50263          	beq	a0,a5,80005e8c <_Z8usrEcallmmmmm+0x180>
        //mem_free
        // KCHECKPRINT(a1);
        // MemoryAllocator::getInstance().print_all_list();
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    }
    else if(a0 == TC)
    80005d6c:	01100793          	li	a5,17
    80005d70:	12f50c63          	beq	a0,a5,80005ea8 <_Z8usrEcallmmmmm+0x19c>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80005d74:	01200793          	li	a5,18
    80005d78:	14f50e63          	beq	a0,a5,80005ed4 <_Z8usrEcallmmmmm+0x1c8>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80005d7c:	01300793          	li	a5,19
    80005d80:	16f50a63          	beq	a0,a5,80005ef4 <_Z8usrEcallmmmmm+0x1e8>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    80005d84:	06900793          	li	a5,105
    80005d88:	18f50063          	beq	a0,a5,80005f08 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        // KCHECKPRINT(a1);
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80005d8c:	02100793          	li	a5,33
    80005d90:	18f50463          	beq	a0,a5,80005f18 <_Z8usrEcallmmmmm+0x20c>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    80005d94:	02200793          	li	a5,34
    80005d98:	22f50663          	beq	a0,a5,80005fc4 <_Z8usrEcallmmmmm+0x2b8>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    80005d9c:	02300793          	li	a5,35
    80005da0:	22f50c63          	beq	a0,a5,80005fd8 <_Z8usrEcallmmmmm+0x2cc>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    80005da4:	02400793          	li	a5,36
    80005da8:	24f50e63          	beq	a0,a5,80006004 <_Z8usrEcallmmmmm+0x2f8>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    80005dac:	03100793          	li	a5,49
    80005db0:	28f50063          	beq	a0,a5,80006030 <_Z8usrEcallmmmmm+0x324>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    80005db4:	04100793          	li	a5,65
    80005db8:	28f50463          	beq	a0,a5,80006040 <_Z8usrEcallmmmmm+0x334>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80005dbc:	04200793          	li	a5,66
    80005dc0:	08f51c63          	bne	a0,a5,80005e58 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    80005dc4:	0000e797          	auipc	a5,0xe
    80005dc8:	61478793          	addi	a5,a5,1556 # 800143d8 <_ZN5StdIO7obufferE>
    80005dcc:	0007ba83          	ld	s5,0(a5)
    80005dd0:	0ff5fa13          	andi	s4,a1,255
    
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    80005dd4:	450a8513          	addi	a0,s5,1104
    80005dd8:	ffffe097          	auipc	ra,0xffffe
    80005ddc:	4a0080e7          	jalr	1184(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005de0:	400a8b13          	addi	s6,s5,1024
    80005de4:	000b0513          	mv	a0,s6
    80005de8:	ffffe097          	auipc	ra,0xffffe
    80005dec:	490080e7          	jalr	1168(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    80005df0:	480aa783          	lw	a5,1152(s5)
    80005df4:	0017879b          	addiw	a5,a5,1
    80005df8:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    80005dfc:	47caa783          	lw	a5,1148(s5)
    80005e00:	00fa8733          	add	a4,s5,a5
    80005e04:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80005e08:	0017879b          	addiw	a5,a5,1
    80005e0c:	41f7d71b          	sraiw	a4,a5,0x1f
    80005e10:	0167571b          	srliw	a4,a4,0x16
    80005e14:	00e787bb          	addw	a5,a5,a4
    80005e18:	3ff7f793          	andi	a5,a5,1023
    80005e1c:	40e787bb          	subw	a5,a5,a4
    80005e20:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    80005e24:	428a8513          	addi	a0,s5,1064
    80005e28:	ffffe097          	auipc	ra,0xffffe
    80005e2c:	4d4080e7          	jalr	1236(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80005e30:	000b0513          	mv	a0,s6
    80005e34:	ffffe097          	auipc	ra,0xffffe
    80005e38:	4c8080e7          	jalr	1224(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80005e3c:	01c0006f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80005e40:	00001097          	auipc	ra,0x1
    80005e44:	78c080e7          	jalr	1932(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    80005e48:	000a0593          	mv	a1,s4
    80005e4c:	00002097          	auipc	ra,0x2
    80005e50:	914080e7          	jalr	-1772(ra) # 80007760 <_ZN15MemoryAllocator9mem_allocEm>
    80005e54:	00050493          	mv	s1,a0
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005e58:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005e5c:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80005e60:	00048513          	mv	a0,s1
    80005e64:	04813083          	ld	ra,72(sp)
    80005e68:	04013403          	ld	s0,64(sp)
    80005e6c:	03813483          	ld	s1,56(sp)
    80005e70:	03013903          	ld	s2,48(sp)
    80005e74:	02813983          	ld	s3,40(sp)
    80005e78:	02013a03          	ld	s4,32(sp)
    80005e7c:	01813a83          	ld	s5,24(sp)
    80005e80:	01013b03          	ld	s6,16(sp)
    80005e84:	05010113          	addi	sp,sp,80
    80005e88:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80005e8c:	00001097          	auipc	ra,0x1
    80005e90:	740080e7          	jalr	1856(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    80005e94:	000a0593          	mv	a1,s4
    80005e98:	00002097          	auipc	ra,0x2
    80005e9c:	b68080e7          	jalr	-1176(ra) # 80007a00 <_ZN15MemoryAllocator8mem_freeEPv>
    80005ea0:	00050493          	mv	s1,a0
    80005ea4:	fb5ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80005ea8:	00070613          	mv	a2,a4
    80005eac:	00068593          	mv	a1,a3
    80005eb0:	000a8513          	mv	a0,s5
    80005eb4:	fffff097          	auipc	ra,0xfffff
    80005eb8:	b24080e7          	jalr	-1244(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005ebc:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80005ec0:	00050663          	beqz	a0,80005ecc <_Z8usrEcallmmmmm+0x1c0>
        else ret = 0;
    80005ec4:	00000493          	li	s1,0
    80005ec8:	f91ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    80005ecc:	ffc00493          	li	s1,-4
    80005ed0:	f89ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    80005ed4:	0000e797          	auipc	a5,0xe
    80005ed8:	4ac78793          	addi	a5,a5,1196 # 80014380 <_ZN3TCB7runningE>
    80005edc:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80005ee0:	00200713          	li	a4,2
    80005ee4:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80005ee8:	fffff097          	auipc	ra,0xfffff
    80005eec:	c10080e7          	jalr	-1008(ra) # 80004af8 <_ZN3TCB8dispatchEv>
    80005ef0:	f69ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    80005ef4:	0000e797          	auipc	a5,0xe
    80005ef8:	4807b223          	sd	zero,1156(a5) # 80014378 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005efc:	fffff097          	auipc	ra,0xfffff
    80005f00:	d0c080e7          	jalr	-756(ra) # 80004c08 <_ZN3TCB5yieldEv>
    80005f04:	f55ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    80005f08:	00058513          	mv	a0,a1
    80005f0c:	fffff097          	auipc	ra,0xfffff
    80005f10:	ddc080e7          	jalr	-548(ra) # 80004ce8 <_ZN3TCB12deleteThreadEPS_>
    80005f14:	f45ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
{
    static ObjectCache* cache; 
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80005f18:	0000e797          	auipc	a5,0xe
    80005f1c:	43878793          	addi	a5,a5,1080 # 80014350 <_ZN10KSemaphore5cacheE>
    80005f20:	0007b783          	ld	a5,0(a5)
    80005f24:	04078463          	beqz	a5,80005f6c <_Z8usrEcallmmmmm+0x260>
    80005f28:	0000e797          	auipc	a5,0xe
    80005f2c:	42878793          	addi	a5,a5,1064 # 80014350 <_ZN10KSemaphore5cacheE>
    80005f30:	0007b503          	ld	a0,0(a5)
    80005f34:	00002097          	auipc	ra,0x2
    80005f38:	7a0080e7          	jalr	1952(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>

    KSemaphore(unsigned val):val(val)
    80005f3c:	01552423          	sw	s5,8(a0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80005f40:	00053823          	sd	zero,16(a0)
    80005f44:	00053c23          	sd	zero,24(a0)
    80005f48:	02052023          	sw	zero,32(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80005f4c:	0000e797          	auipc	a5,0xe
    80005f50:	40c78793          	addi	a5,a5,1036 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80005f54:	0007b703          	ld	a4,0(a5)
    80005f58:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80005f5c:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    80005f60:	00aa3023          	sd	a0,0(s4)
        else ret = 0;
    80005f64:	00000493          	li	s1,0
    80005f68:	ef1ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80005f6c:	05800513          	li	a0,88
    80005f70:	00003097          	auipc	ra,0x3
    80005f74:	808080e7          	jalr	-2040(ra) # 80008778 <_ZN11ObjectCachenwEm>
    80005f78:	00050493          	mv	s1,a0
    80005f7c:	00000793          	li	a5,0
    80005f80:	00000713          	li	a4,0
    80005f84:	00000693          	li	a3,0
    80005f88:	02800613          	li	a2,40
    80005f8c:	00008597          	auipc	a1,0x8
    80005f90:	44c58593          	addi	a1,a1,1100 # 8000e3d8 <CONSOLE_STATUS+0x3c8>
    80005f94:	00002097          	auipc	ra,0x2
    80005f98:	fc8080e7          	jalr	-56(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80005f9c:	0000e797          	auipc	a5,0xe
    80005fa0:	3a97ba23          	sd	s1,948(a5) # 80014350 <_ZN10KSemaphore5cacheE>
    80005fa4:	f85ff06f          	j	80005f28 <_Z8usrEcallmmmmm+0x21c>
    80005fa8:	00050913          	mv	s2,a0
    80005fac:	00048513          	mv	a0,s1
    80005fb0:	00003097          	auipc	ra,0x3
    80005fb4:	928080e7          	jalr	-1752(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    80005fb8:	00090513          	mv	a0,s2
    80005fbc:	0000f097          	auipc	ra,0xf
    80005fc0:	58c080e7          	jalr	1420(ra) # 80015548 <_Unwind_Resume>
        ret = KSemaphore::close(t);
    80005fc4:	00058513          	mv	a0,a1
    80005fc8:	ffffe097          	auipc	ra,0xffffe
    80005fcc:	3dc080e7          	jalr	988(ra) # 800043a4 <_ZN10KSemaphore5closeEPS_>
    80005fd0:	00050493          	mv	s1,a0
    80005fd4:	e85ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80005fd8:	00058513          	mv	a0,a1
    80005fdc:	ffffe097          	auipc	ra,0xffffe
    80005fe0:	468080e7          	jalr	1128(ra) # 80004444 <_ZN10KSemaphore6existsEPS_>
    80005fe4:	00051663          	bnez	a0,80005ff0 <_Z8usrEcallmmmmm+0x2e4>
            ret = -1;
    80005fe8:	fff00493          	li	s1,-1
    80005fec:	e6dff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    80005ff0:	000a0513          	mv	a0,s4
    80005ff4:	ffffe097          	auipc	ra,0xffffe
    80005ff8:	284080e7          	jalr	644(ra) # 80004278 <_ZN10KSemaphore4waitEv>
    80005ffc:	00050493          	mv	s1,a0
    80006000:	e59ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80006004:	00058513          	mv	a0,a1
    80006008:	ffffe097          	auipc	ra,0xffffe
    8000600c:	43c080e7          	jalr	1084(ra) # 80004444 <_ZN10KSemaphore6existsEPS_>
    80006010:	00051663          	bnez	a0,8000601c <_Z8usrEcallmmmmm+0x310>
            ret = -1;
    80006014:	fff00493          	li	s1,-1
    80006018:	e41ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    8000601c:	000a0513          	mv	a0,s4
    80006020:	ffffe097          	auipc	ra,0xffffe
    80006024:	2dc080e7          	jalr	732(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80006028:	00050493          	mv	s1,a0
    8000602c:	e2dff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    80006030:	00058513          	mv	a0,a1
    80006034:	fffff097          	auipc	ra,0xfffff
    80006038:	c0c080e7          	jalr	-1012(ra) # 80004c40 <_ZN3TCB5sleepEm>
    8000603c:	e1dff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    80006040:	0000e797          	auipc	a5,0xe
    80006044:	3a078793          	addi	a5,a5,928 # 800143e0 <_ZN5StdIO7ibufferE>
    80006048:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    8000604c:	428a0513          	addi	a0,s4,1064
    80006050:	ffffe097          	auipc	ra,0xffffe
    80006054:	228080e7          	jalr	552(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80006058:	400a0a93          	addi	s5,s4,1024
    8000605c:	000a8513          	mv	a0,s5
    80006060:	ffffe097          	auipc	ra,0xffffe
    80006064:	218080e7          	jalr	536(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80006068:	480a2783          	lw	a5,1152(s4)
    8000606c:	fff7879b          	addiw	a5,a5,-1
    80006070:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    80006074:	478a2783          	lw	a5,1144(s4)
    80006078:	00fa0733          	add	a4,s4,a5
    8000607c:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80006080:	0017879b          	addiw	a5,a5,1
    80006084:	41f7d71b          	sraiw	a4,a5,0x1f
    80006088:	0167571b          	srliw	a4,a4,0x16
    8000608c:	00e787bb          	addw	a5,a5,a4
    80006090:	3ff7f793          	andi	a5,a5,1023
    80006094:	40e787bb          	subw	a5,a5,a4
    80006098:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    8000609c:	450a0513          	addi	a0,s4,1104
    800060a0:	ffffe097          	auipc	ra,0xffffe
    800060a4:	25c080e7          	jalr	604(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800060a8:	000a8513          	mv	a0,s5
    800060ac:	ffffe097          	auipc	ra,0xffffe
    800060b0:	250080e7          	jalr	592(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    800060b4:	da5ff06f          	j	80005e58 <_Z8usrEcallmmmmm+0x14c>

00000000800060b8 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    800060b8:	fb010113          	addi	sp,sp,-80
    800060bc:	04113423          	sd	ra,72(sp)
    800060c0:	04813023          	sd	s0,64(sp)
    800060c4:	02913c23          	sd	s1,56(sp)
    800060c8:	03213823          	sd	s2,48(sp)
    800060cc:	03313423          	sd	s3,40(sp)
    800060d0:	03413023          	sd	s4,32(sp)
    800060d4:	01513c23          	sd	s5,24(sp)
    800060d8:	05010413          	addi	s0,sp,80
    800060dc:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800060e0:	141027f3          	csrr	a5,sepc
    800060e4:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800060e8:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800060ec:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800060f0:	100027f3          	csrr	a5,sstatus
    800060f4:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800060f8:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    800060fc:	00100793          	li	a5,1
    80006100:	0ef50663          	beq	a0,a5,800061ec <_Z8sysEcallmmmmm+0x134>
    80006104:	00050493          	mv	s1,a0
    80006108:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    8000610c:	00200793          	li	a5,2
    80006110:	10f50c63          	beq	a0,a5,80006228 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    80006114:	01100793          	li	a5,17
    80006118:	12f50463          	beq	a0,a5,80006240 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    8000611c:	01200793          	li	a5,18
    80006120:	14f50663          	beq	a0,a5,8000626c <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    80006124:	01300793          	li	a5,19
    80006128:	16f50663          	beq	a0,a5,80006294 <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    8000612c:	06900793          	li	a5,105
    80006130:	18f50063          	beq	a0,a5,800062b0 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80006134:	02100793          	li	a5,33
    80006138:	18f50663          	beq	a0,a5,800062c4 <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    8000613c:	02200793          	li	a5,34
    80006140:	22f50863          	beq	a0,a5,80006370 <_Z8sysEcallmmmmm+0x2b8>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80006144:	02300793          	li	a5,35
    80006148:	24f50c63          	beq	a0,a5,800063a0 <_Z8sysEcallmmmmm+0x2e8>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    8000614c:	02400793          	li	a5,36
    80006150:	26f50263          	beq	a0,a5,800063b4 <_Z8sysEcallmmmmm+0x2fc>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80006154:	03100793          	li	a5,49
    80006158:	26f50863          	beq	a0,a5,800063c8 <_Z8sysEcallmmmmm+0x310>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    8000615c:	04100793          	li	a5,65
    80006160:	28f50063          	beq	a0,a5,800063e0 <_Z8sysEcallmmmmm+0x328>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80006164:	04200793          	li	a5,66
    80006168:	08f51c63          	bne	a0,a5,80006200 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    8000616c:	0000e797          	auipc	a5,0xe
    80006170:	26c78793          	addi	a5,a5,620 # 800143d8 <_ZN5StdIO7obufferE>
    80006174:	0007ba03          	ld	s4,0(a5)
    80006178:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    8000617c:	450a0513          	addi	a0,s4,1104
    80006180:	ffffe097          	auipc	ra,0xffffe
    80006184:	0f8080e7          	jalr	248(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80006188:	400a0a93          	addi	s5,s4,1024
    8000618c:	000a8513          	mv	a0,s5
    80006190:	ffffe097          	auipc	ra,0xffffe
    80006194:	0e8080e7          	jalr	232(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80006198:	480a2783          	lw	a5,1152(s4)
    8000619c:	0017879b          	addiw	a5,a5,1
    800061a0:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    800061a4:	47ca2783          	lw	a5,1148(s4)
    800061a8:	00fa0733          	add	a4,s4,a5
    800061ac:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    800061b0:	0017879b          	addiw	a5,a5,1
    800061b4:	41f7d71b          	sraiw	a4,a5,0x1f
    800061b8:	0167571b          	srliw	a4,a4,0x16
    800061bc:	00e787bb          	addw	a5,a5,a4
    800061c0:	3ff7f793          	andi	a5,a5,1023
    800061c4:	40e787bb          	subw	a5,a5,a4
    800061c8:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    800061cc:	428a0513          	addi	a0,s4,1064
    800061d0:	ffffe097          	auipc	ra,0xffffe
    800061d4:	12c080e7          	jalr	300(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800061d8:	000a8513          	mv	a0,s5
    800061dc:	ffffe097          	auipc	ra,0xffffe
    800061e0:	120080e7          	jalr	288(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800061e4:	00048513          	mv	a0,s1
    800061e8:	0180006f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    800061ec:	00001097          	auipc	ra,0x1
    800061f0:	3e0080e7          	jalr	992(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    800061f4:	00098593          	mv	a1,s3
    800061f8:	00001097          	auipc	ra,0x1
    800061fc:	568080e7          	jalr	1384(ra) # 80007760 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80006200:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80006204:	04813083          	ld	ra,72(sp)
    80006208:	04013403          	ld	s0,64(sp)
    8000620c:	03813483          	ld	s1,56(sp)
    80006210:	03013903          	ld	s2,48(sp)
    80006214:	02813983          	ld	s3,40(sp)
    80006218:	02013a03          	ld	s4,32(sp)
    8000621c:	01813a83          	ld	s5,24(sp)
    80006220:	05010113          	addi	sp,sp,80
    80006224:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80006228:	00001097          	auipc	ra,0x1
    8000622c:	3a4080e7          	jalr	932(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
    80006230:	00098593          	mv	a1,s3
    80006234:	00001097          	auipc	ra,0x1
    80006238:	7cc080e7          	jalr	1996(ra) # 80007a00 <_ZN15MemoryAllocator8mem_freeEPv>
    8000623c:	fc5ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    80006240:	00070613          	mv	a2,a4
    80006244:	00068593          	mv	a1,a3
    80006248:	000a8513          	mv	a0,s5
    8000624c:	ffffe097          	auipc	ra,0xffffe
    80006250:	78c080e7          	jalr	1932(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80006254:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    80006258:	00050663          	beqz	a0,80006264 <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    8000625c:	00000513          	li	a0,0
    80006260:	fa1ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    80006264:	ffc00513          	li	a0,-4
    80006268:	f99ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    8000626c:	0000e797          	auipc	a5,0xe
    80006270:	11478793          	addi	a5,a5,276 # 80014380 <_ZN3TCB7runningE>
    80006274:	0007b783          	ld	a5,0(a5)
    80006278:	00200713          	li	a4,2
    8000627c:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80006280:	fffff097          	auipc	ra,0xfffff
    80006284:	878080e7          	jalr	-1928(ra) # 80004af8 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80006288:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000628c:	00048513          	mv	a0,s1
    80006290:	f71ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    80006294:	0000e797          	auipc	a5,0xe
    80006298:	0e07b223          	sd	zero,228(a5) # 80014378 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    8000629c:	fffff097          	auipc	ra,0xfffff
    800062a0:	96c080e7          	jalr	-1684(ra) # 80004c08 <_ZN3TCB5yieldEv>
    800062a4:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800062a8:	00048513          	mv	a0,s1
    800062ac:	f55ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    800062b0:	00058513          	mv	a0,a1
    800062b4:	fffff097          	auipc	ra,0xfffff
    800062b8:	a34080e7          	jalr	-1484(ra) # 80004ce8 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800062bc:	00048513          	mv	a0,s1
    800062c0:	f41ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
    800062c4:	0000e797          	auipc	a5,0xe
    800062c8:	08c78793          	addi	a5,a5,140 # 80014350 <_ZN10KSemaphore5cacheE>
    800062cc:	0007b783          	ld	a5,0(a5)
    800062d0:	04078463          	beqz	a5,80006318 <_Z8sysEcallmmmmm+0x260>
    800062d4:	0000e797          	auipc	a5,0xe
    800062d8:	07c78793          	addi	a5,a5,124 # 80014350 <_ZN10KSemaphore5cacheE>
    800062dc:	0007b503          	ld	a0,0(a5)
    800062e0:	00002097          	auipc	ra,0x2
    800062e4:	3f4080e7          	jalr	1012(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    KSemaphore(unsigned val):val(val)
    800062e8:	01552423          	sw	s5,8(a0)
    800062ec:	00053823          	sd	zero,16(a0)
    800062f0:	00053c23          	sd	zero,24(a0)
    800062f4:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    800062f8:	0000e797          	auipc	a5,0xe
    800062fc:	06078793          	addi	a5,a5,96 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80006300:	0007b703          	ld	a4,0(a5)
    80006304:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80006308:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    8000630c:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006310:	00048513          	mv	a0,s1
    80006314:	eedff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80006318:	05800513          	li	a0,88
    8000631c:	00002097          	auipc	ra,0x2
    80006320:	45c080e7          	jalr	1116(ra) # 80008778 <_ZN11ObjectCachenwEm>
    80006324:	00050a13          	mv	s4,a0
    80006328:	00000793          	li	a5,0
    8000632c:	00000713          	li	a4,0
    80006330:	00000693          	li	a3,0
    80006334:	02800613          	li	a2,40
    80006338:	00008597          	auipc	a1,0x8
    8000633c:	0a058593          	addi	a1,a1,160 # 8000e3d8 <CONSOLE_STATUS+0x3c8>
    80006340:	00002097          	auipc	ra,0x2
    80006344:	c1c080e7          	jalr	-996(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80006348:	0000e797          	auipc	a5,0xe
    8000634c:	0147b423          	sd	s4,8(a5) # 80014350 <_ZN10KSemaphore5cacheE>
    80006350:	f85ff06f          	j	800062d4 <_Z8sysEcallmmmmm+0x21c>
    80006354:	00050493          	mv	s1,a0
    80006358:	000a0513          	mv	a0,s4
    8000635c:	00002097          	auipc	ra,0x2
    80006360:	57c080e7          	jalr	1404(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    80006364:	00048513          	mv	a0,s1
    80006368:	0000f097          	auipc	ra,0xf
    8000636c:	1e0080e7          	jalr	480(ra) # 80015548 <_Unwind_Resume>
        delete t;
    80006370:	e80588e3          	beqz	a1,80006200 <_Z8sysEcallmmmmm+0x148>
    80006374:	00058513          	mv	a0,a1
    80006378:	ffffe097          	auipc	ra,0xffffe
    8000637c:	fd8080e7          	jalr	-40(ra) # 80004350 <_ZN10KSemaphoreD1Ev>
    80006380:	00098593          	mv	a1,s3
    80006384:	0000e797          	auipc	a5,0xe
    80006388:	fcc78793          	addi	a5,a5,-52 # 80014350 <_ZN10KSemaphore5cacheE>
    8000638c:	0007b503          	ld	a0,0(a5)
    80006390:	00002097          	auipc	ra,0x2
    80006394:	418080e7          	jalr	1048(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006398:	00048513          	mv	a0,s1
    8000639c:	e65ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800063a0:	00058513          	mv	a0,a1
    800063a4:	ffffe097          	auipc	ra,0xffffe
    800063a8:	ed4080e7          	jalr	-300(ra) # 80004278 <_ZN10KSemaphore4waitEv>
    800063ac:	100a1073          	csrw	sstatus,s4
    800063b0:	e51ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    800063b4:	00058513          	mv	a0,a1
    800063b8:	ffffe097          	auipc	ra,0xffffe
    800063bc:	f44080e7          	jalr	-188(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800063c0:	00048513          	mv	a0,s1
    800063c4:	e3dff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    800063c8:	00058513          	mv	a0,a1
    800063cc:	fffff097          	auipc	ra,0xfffff
    800063d0:	874080e7          	jalr	-1932(ra) # 80004c40 <_ZN3TCB5sleepEm>
    800063d4:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800063d8:	00048513          	mv	a0,s1
    800063dc:	e25ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    800063e0:	0000e797          	auipc	a5,0xe
    800063e4:	00078793          	mv	a5,a5
    800063e8:	0007b983          	ld	s3,0(a5) # 800143e0 <_ZN5StdIO7ibufferE>
        itemAvailable.wait();
    800063ec:	42898513          	addi	a0,s3,1064
    800063f0:	ffffe097          	auipc	ra,0xffffe
    800063f4:	e88080e7          	jalr	-376(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800063f8:	40098a13          	addi	s4,s3,1024
    800063fc:	000a0513          	mv	a0,s4
    80006400:	ffffe097          	auipc	ra,0xffffe
    80006404:	e78080e7          	jalr	-392(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    80006408:	4809a783          	lw	a5,1152(s3)
    8000640c:	fff7879b          	addiw	a5,a5,-1
    80006410:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    80006414:	4789a783          	lw	a5,1144(s3)
    80006418:	00f98733          	add	a4,s3,a5
    8000641c:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80006420:	0017879b          	addiw	a5,a5,1
    80006424:	41f7d71b          	sraiw	a4,a5,0x1f
    80006428:	0167571b          	srliw	a4,a4,0x16
    8000642c:	00e787bb          	addw	a5,a5,a4
    80006430:	3ff7f793          	andi	a5,a5,1023
    80006434:	40e787bb          	subw	a5,a5,a4
    80006438:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    8000643c:	45098513          	addi	a0,s3,1104
    80006440:	ffffe097          	auipc	ra,0xffffe
    80006444:	ebc080e7          	jalr	-324(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80006448:	000a0513          	mv	a0,s4
    8000644c:	ffffe097          	auipc	ra,0xffffe
    80006450:	eb0080e7          	jalr	-336(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80006454:	00048513          	mv	a0,s1
    80006458:	da9ff06f          	j	80006200 <_Z8sysEcallmmmmm+0x148>

000000008000645c <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    8000645c:	fa010113          	addi	sp,sp,-96
    80006460:	04113c23          	sd	ra,88(sp)
    80006464:	04813823          	sd	s0,80(sp)
    80006468:	04913423          	sd	s1,72(sp)
    8000646c:	05213023          	sd	s2,64(sp)
    80006470:	03313c23          	sd	s3,56(sp)
    80006474:	03413823          	sd	s4,48(sp)
    80006478:	06010413          	addi	s0,sp,96
    asm volatile("csrr %0, scause" : "=r" (scause));
    8000647c:	142027f3          	csrr	a5,scause
    80006480:	faf43423          	sd	a5,-88(s0)
    return scause;
    80006484:	fa843483          	ld	s1,-88(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;
    //KCHECKPRINT(scause);
    if(scause == IS)
    80006488:	00900793          	li	a5,9
    8000648c:	14f48463          	beq	s1,a5,800065d4 <interrupt+0x178>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    80006490:	00800793          	li	a5,8
    80006494:	16f48663          	beq	s1,a5,80006600 <interrupt+0x1a4>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    80006498:	fff00793          	li	a5,-1
    8000649c:	03f79793          	slli	a5,a5,0x3f
    800064a0:	00978793          	addi	a5,a5,9
    800064a4:	16f48663          	beq	s1,a5,80006610 <interrupt+0x1b4>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800064a8:	fff00793          	li	a5,-1
    800064ac:	03f79793          	slli	a5,a5,0x3f
    800064b0:	00178793          	addi	a5,a5,1
    800064b4:	16f48463          	beq	s1,a5,8000661c <interrupt+0x1c0>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == PFI){
    800064b8:	00c00793          	li	a5,12
    800064bc:	16f48663          	beq	s1,a5,80006628 <interrupt+0x1cc>
            TCB::running->setState(TCB::TCBState::READY);
            asm volatile("sd %0, 1 * 8(s0)" :: "r" (thread_exit));
            Riscv::mc_sstatus(Riscv::BitMaskSstatus::SSTATUS_SPP);
        }
    }
    else if(scause == PFL || scause == PFW){
    800064c0:	00d00793          	li	a5,13
    800064c4:	18f48e63          	beq	s1,a5,80006660 <interrupt+0x204>
    800064c8:	00f00793          	li	a5,15
    800064cc:	18f48a63          	beq	s1,a5,80006660 <interrupt+0x204>
                
            }
        }
        
    }
    else if(scause == II || scause == IR || scause == IW)
    800064d0:	00200793          	li	a5,2
    800064d4:	00f48a63          	beq	s1,a5,800064e8 <interrupt+0x8c>
    800064d8:	00500793          	li	a5,5
    800064dc:	00f48663          	beq	s1,a5,800064e8 <interrupt+0x8c>
    800064e0:	00700793          	li	a5,7
    800064e4:	34f49a63          	bne	s1,a5,80006838 <interrupt+0x3dc>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    800064e8:	0000e797          	auipc	a5,0xe
    800064ec:	e9878793          	addi	a5,a5,-360 # 80014380 <_ZN3TCB7runningE>
    800064f0:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    800064f4:	0357c783          	lbu	a5,53(a5)
    800064f8:	32078263          	beqz	a5,8000681c <interrupt+0x3c0>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    800064fc:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    80006500:	00008517          	auipc	a0,0x8
    80006504:	f2050513          	addi	a0,a0,-224 # 8000e420 <CONSOLE_STATUS+0x410>
    80006508:	fffff097          	auipc	ra,0xfffff
    8000650c:	bdc080e7          	jalr	-1060(ra) # 800050e4 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    80006510:	00008517          	auipc	a0,0x8
    80006514:	f4850513          	addi	a0,a0,-184 # 8000e458 <CONSOLE_STATUS+0x448>
    80006518:	fffff097          	auipc	ra,0xfffff
    8000651c:	bcc080e7          	jalr	-1076(ra) # 800050e4 <_Z12kprintStringPKc>
    80006520:	00000613          	li	a2,0
    80006524:	01000593          	li	a1,16
    80006528:	00048513          	mv	a0,s1
    8000652c:	fffff097          	auipc	ra,0xfffff
    80006530:	c00080e7          	jalr	-1024(ra) # 8000512c <_Z9kprintIntmib>
    80006534:	00008517          	auipc	a0,0x8
    80006538:	e2450513          	addi	a0,a0,-476 # 8000e358 <CONSOLE_STATUS+0x348>
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	ba8080e7          	jalr	-1112(ra) # 800050e4 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    80006544:	00008517          	auipc	a0,0x8
    80006548:	f2450513          	addi	a0,a0,-220 # 8000e468 <CONSOLE_STATUS+0x458>
    8000654c:	fffff097          	auipc	ra,0xfffff
    80006550:	b98080e7          	jalr	-1128(ra) # 800050e4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80006554:	141027f3          	csrr	a5,sepc
    80006558:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    8000655c:	fc843503          	ld	a0,-56(s0)
    80006560:	00000613          	li	a2,0
    80006564:	01000593          	li	a1,16
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	bc4080e7          	jalr	-1084(ra) # 8000512c <_Z9kprintIntmib>
    80006570:	00008517          	auipc	a0,0x8
    80006574:	de850513          	addi	a0,a0,-536 # 8000e358 <CONSOLE_STATUS+0x348>
    80006578:	fffff097          	auipc	ra,0xfffff
    8000657c:	b6c080e7          	jalr	-1172(ra) # 800050e4 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80006580:	00008517          	auipc	a0,0x8
    80006584:	ef050513          	addi	a0,a0,-272 # 8000e470 <CONSOLE_STATUS+0x460>
    80006588:	fffff097          	auipc	ra,0xfffff
    8000658c:	b5c080e7          	jalr	-1188(ra) # 800050e4 <_Z12kprintStringPKc>
    80006590:	00000613          	li	a2,0
    80006594:	01000593          	li	a1,16
    80006598:	00090513          	mv	a0,s2
    8000659c:	fffff097          	auipc	ra,0xfffff
    800065a0:	b90080e7          	jalr	-1136(ra) # 8000512c <_Z9kprintIntmib>
    800065a4:	00009517          	auipc	a0,0x9
    800065a8:	90450513          	addi	a0,a0,-1788 # 8000eea8 <CONSOLE_STATUS+0xe98>
    800065ac:	fffff097          	auipc	ra,0xfffff
    800065b0:	b38080e7          	jalr	-1224(ra) # 800050e4 <_Z12kprintStringPKc>
            TCB::running->finish();
    800065b4:	0000e797          	auipc	a5,0xe
    800065b8:	dcc78793          	addi	a5,a5,-564 # 80014380 <_ZN3TCB7runningE>
    800065bc:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800065c0:	00200713          	li	a4,2
    800065c4:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    800065c8:	ffffe097          	auipc	ra,0xffffe
    800065cc:	530080e7          	jalr	1328(ra) # 80004af8 <_ZN3TCB8dispatchEv>
    800065d0:	0100006f          	j	800065e0 <interrupt+0x184>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    800065d4:	00000097          	auipc	ra,0x0
    800065d8:	ae4080e7          	jalr	-1308(ra) # 800060b8 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800065dc:	04a43823          	sd	a0,80(s0)

    }
                    
    
    //print(a4);
    800065e0:	05813083          	ld	ra,88(sp)
    800065e4:	05013403          	ld	s0,80(sp)
    800065e8:	04813483          	ld	s1,72(sp)
    800065ec:	04013903          	ld	s2,64(sp)
    800065f0:	03813983          	ld	s3,56(sp)
    800065f4:	03013a03          	ld	s4,48(sp)
    800065f8:	06010113          	addi	sp,sp,96
    800065fc:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80006600:	fffff097          	auipc	ra,0xfffff
    80006604:	70c080e7          	jalr	1804(ra) # 80005d0c <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80006608:	04a43823          	sd	a0,80(s0)
    8000660c:	fd5ff06f          	j	800065e0 <interrupt+0x184>
       StdIO::console_handler();
    80006610:	00003097          	auipc	ra,0x3
    80006614:	1f0080e7          	jalr	496(ra) # 80009800 <_ZN5StdIO15console_handlerEv>
    80006618:	fc9ff06f          	j	800065e0 <interrupt+0x184>
        timer_handler();      
    8000661c:	fffff097          	auipc	ra,0xfffff
    80006620:	654080e7          	jalr	1620(ra) # 80005c70 <_Z13timer_handlerv>
    80006624:	fbdff06f          	j	800065e0 <interrupt+0x184>
        if(TCB::running->getState() == TCB::TCBState::PREPARING){
    80006628:	0000e797          	auipc	a5,0xe
    8000662c:	d5878793          	addi	a5,a5,-680 # 80014380 <_ZN3TCB7runningE>
    80006630:	0007b783          	ld	a5,0(a5)
    TCBState getState() const{ return state; }
    80006634:	0307a683          	lw	a3,48(a5)
    80006638:	00400713          	li	a4,4
    8000663c:	fae692e3          	bne	a3,a4,800065e0 <interrupt+0x184>
    void setState(TCBState s) {state = s;}
    80006640:	00100713          	li	a4,1
    80006644:	02e7a823          	sw	a4,48(a5)
            asm volatile("sd %0, 1 * 8(s0)" :: "r" (thread_exit));
    80006648:	00006797          	auipc	a5,0x6
    8000664c:	b4878793          	addi	a5,a5,-1208 # 8000c190 <thread_exit>
    80006650:	00f43423          	sd	a5,8(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80006654:	10000793          	li	a5,256
    80006658:	1007b073          	csrc	sstatus,a5
    8000665c:	f85ff06f          	j	800065e0 <interrupt+0x184>
    asm volatile("csrr %0, stval" : "=r" (stval));
    80006660:	143027f3          	csrr	a5,stval
    80006664:	fcf43023          	sd	a5,-64(s0)
    return stval;
    80006668:	fc043983          	ld	s3,-64(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000666c:	141027f3          	csrr	a5,sepc
    80006670:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80006674:	fb843a03          	ld	s4,-72(s0)
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80006678:	100027f3          	csrr	a5,sstatus
    8000667c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80006680:	fb043783          	ld	a5,-80(s0)
        if(sstatus & Riscv::BitMaskSstatus::SSTATUS_SPP){
    80006684:	1007f793          	andi	a5,a5,256
    80006688:	0a078a63          	beqz	a5,8000673c <interrupt+0x2e0>
            KCHECKPRINT(scause);
    8000668c:	00008517          	auipc	a0,0x8
    80006690:	d6450513          	addi	a0,a0,-668 # 8000e3f0 <CONSOLE_STATUS+0x3e0>
    80006694:	fffff097          	auipc	ra,0xfffff
    80006698:	a50080e7          	jalr	-1456(ra) # 800050e4 <_Z12kprintStringPKc>
    8000669c:	00000613          	li	a2,0
    800066a0:	01000593          	li	a1,16
    800066a4:	00048513          	mv	a0,s1
    800066a8:	fffff097          	auipc	ra,0xfffff
    800066ac:	a84080e7          	jalr	-1404(ra) # 8000512c <_Z9kprintIntmib>
    800066b0:	00008517          	auipc	a0,0x8
    800066b4:	ca850513          	addi	a0,a0,-856 # 8000e358 <CONSOLE_STATUS+0x348>
    800066b8:	fffff097          	auipc	ra,0xfffff
    800066bc:	a2c080e7          	jalr	-1492(ra) # 800050e4 <_Z12kprintStringPKc>
            KCHECKPRINT(sepc);
    800066c0:	00008517          	auipc	a0,0x8
    800066c4:	d4050513          	addi	a0,a0,-704 # 8000e400 <CONSOLE_STATUS+0x3f0>
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	a1c080e7          	jalr	-1508(ra) # 800050e4 <_Z12kprintStringPKc>
    800066d0:	00000613          	li	a2,0
    800066d4:	01000593          	li	a1,16
    800066d8:	000a0513          	mv	a0,s4
    800066dc:	fffff097          	auipc	ra,0xfffff
    800066e0:	a50080e7          	jalr	-1456(ra) # 8000512c <_Z9kprintIntmib>
    800066e4:	00008517          	auipc	a0,0x8
    800066e8:	c7450513          	addi	a0,a0,-908 # 8000e358 <CONSOLE_STATUS+0x348>
    800066ec:	fffff097          	auipc	ra,0xfffff
    800066f0:	9f8080e7          	jalr	-1544(ra) # 800050e4 <_Z12kprintStringPKc>
            KCHECKPRINT(stval);
    800066f4:	00008517          	auipc	a0,0x8
    800066f8:	d1450513          	addi	a0,a0,-748 # 8000e408 <CONSOLE_STATUS+0x3f8>
    800066fc:	fffff097          	auipc	ra,0xfffff
    80006700:	9e8080e7          	jalr	-1560(ra) # 800050e4 <_Z12kprintStringPKc>
    80006704:	00000613          	li	a2,0
    80006708:	01000593          	li	a1,16
    8000670c:	00098513          	mv	a0,s3
    80006710:	fffff097          	auipc	ra,0xfffff
    80006714:	a1c080e7          	jalr	-1508(ra) # 8000512c <_Z9kprintIntmib>
    80006718:	00008517          	auipc	a0,0x8
    8000671c:	c4050513          	addi	a0,a0,-960 # 8000e358 <CONSOLE_STATUS+0x348>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	9c4080e7          	jalr	-1596(ra) # 800050e4 <_Z12kprintStringPKc>
            kprintString("PAGE FAULT\n");
    80006728:	00008517          	auipc	a0,0x8
    8000672c:	ce850513          	addi	a0,a0,-792 # 8000e410 <CONSOLE_STATUS+0x400>
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	9b4080e7          	jalr	-1612(ra) # 800050e4 <_Z12kprintStringPKc>
            while(true);
    80006738:	0000006f          	j	80006738 <interrupt+0x2dc>
            MemoryAllocator& allocator = MemoryAllocator::getInstance();
    8000673c:	00001097          	auipc	ra,0x1
    80006740:	e90080e7          	jalr	-368(ra) # 800075cc <_ZN15MemoryAllocator11getInstanceEv>
            FreeSegment* fs = allocator.getFreeSegmentMeta((void*)stval);
    80006744:	00098593          	mv	a1,s3
    80006748:	00001097          	auipc	ra,0x1
    8000674c:	418080e7          	jalr	1048(ra) # 80007b60 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv>
    80006750:	00050913          	mv	s2,a0
            if(fs){
    80006754:	02050463          	beqz	a0,8000677c <interrupt+0x320>
                Pager::getInstance().id_map(
    80006758:	00004097          	auipc	ra,0x4
    8000675c:	3a4080e7          	jalr	932(ra) # 8000aafc <_ZN5Pager11getInstanceEv>
    80006760:	01093583          	ld	a1,16(s2)
                    (char*)fs->addr+fs->size, 
    80006764:	00893603          	ld	a2,8(s2)
                Pager::getInstance().id_map(
    80006768:	01600693          	li	a3,22
    8000676c:	00c58633          	add	a2,a1,a2
    80006770:	00004097          	auipc	ra,0x4
    80006774:	520080e7          	jalr	1312(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
        }
    80006778:	e69ff06f          	j	800065e0 <interrupt+0x184>
                KCHECKPRINT(scause);
    8000677c:	00008517          	auipc	a0,0x8
    80006780:	c7450513          	addi	a0,a0,-908 # 8000e3f0 <CONSOLE_STATUS+0x3e0>
    80006784:	fffff097          	auipc	ra,0xfffff
    80006788:	960080e7          	jalr	-1696(ra) # 800050e4 <_Z12kprintStringPKc>
    8000678c:	00000613          	li	a2,0
    80006790:	01000593          	li	a1,16
    80006794:	00048513          	mv	a0,s1
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	994080e7          	jalr	-1644(ra) # 8000512c <_Z9kprintIntmib>
    800067a0:	00008517          	auipc	a0,0x8
    800067a4:	bb850513          	addi	a0,a0,-1096 # 8000e358 <CONSOLE_STATUS+0x348>
    800067a8:	fffff097          	auipc	ra,0xfffff
    800067ac:	93c080e7          	jalr	-1732(ra) # 800050e4 <_Z12kprintStringPKc>
                KCHECKPRINT(sepc);
    800067b0:	00008517          	auipc	a0,0x8
    800067b4:	c5050513          	addi	a0,a0,-944 # 8000e400 <CONSOLE_STATUS+0x3f0>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	92c080e7          	jalr	-1748(ra) # 800050e4 <_Z12kprintStringPKc>
    800067c0:	00000613          	li	a2,0
    800067c4:	01000593          	li	a1,16
    800067c8:	000a0513          	mv	a0,s4
    800067cc:	fffff097          	auipc	ra,0xfffff
    800067d0:	960080e7          	jalr	-1696(ra) # 8000512c <_Z9kprintIntmib>
    800067d4:	00008517          	auipc	a0,0x8
    800067d8:	b8450513          	addi	a0,a0,-1148 # 8000e358 <CONSOLE_STATUS+0x348>
    800067dc:	fffff097          	auipc	ra,0xfffff
    800067e0:	908080e7          	jalr	-1784(ra) # 800050e4 <_Z12kprintStringPKc>
                KCHECKPRINT(stval);
    800067e4:	00008517          	auipc	a0,0x8
    800067e8:	c2450513          	addi	a0,a0,-988 # 8000e408 <CONSOLE_STATUS+0x3f8>
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	8f8080e7          	jalr	-1800(ra) # 800050e4 <_Z12kprintStringPKc>
    800067f4:	00000613          	li	a2,0
    800067f8:	01000593          	li	a1,16
    800067fc:	00098513          	mv	a0,s3
    80006800:	fffff097          	auipc	ra,0xfffff
    80006804:	92c080e7          	jalr	-1748(ra) # 8000512c <_Z9kprintIntmib>
    80006808:	00008517          	auipc	a0,0x8
    8000680c:	b5050513          	addi	a0,a0,-1200 # 8000e358 <CONSOLE_STATUS+0x348>
    80006810:	fffff097          	auipc	ra,0xfffff
    80006814:	8d4080e7          	jalr	-1836(ra) # 800050e4 <_Z12kprintStringPKc>
                while(true);
    80006818:	0000006f          	j	80006818 <interrupt+0x3bc>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    8000681c:	00008517          	auipc	a0,0x8
    80006820:	c5c50513          	addi	a0,a0,-932 # 8000e478 <CONSOLE_STATUS+0x468>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	8c0080e7          	jalr	-1856(ra) # 800050e4 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    8000682c:	ffffe097          	auipc	ra,0xffffe
    80006830:	044080e7          	jalr	68(ra) # 80004870 <_ZN3TCB13panicDispatchEv>
    80006834:	dadff06f          	j	800065e0 <interrupt+0x184>
        KCHECKPRINT(scause);
    80006838:	00008517          	auipc	a0,0x8
    8000683c:	bb850513          	addi	a0,a0,-1096 # 8000e3f0 <CONSOLE_STATUS+0x3e0>
    80006840:	fffff097          	auipc	ra,0xfffff
    80006844:	8a4080e7          	jalr	-1884(ra) # 800050e4 <_Z12kprintStringPKc>
    80006848:	00000613          	li	a2,0
    8000684c:	01000593          	li	a1,16
    80006850:	00048513          	mv	a0,s1
    80006854:	fffff097          	auipc	ra,0xfffff
    80006858:	8d8080e7          	jalr	-1832(ra) # 8000512c <_Z9kprintIntmib>
    8000685c:	00008517          	auipc	a0,0x8
    80006860:	afc50513          	addi	a0,a0,-1284 # 8000e358 <CONSOLE_STATUS+0x348>
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	880080e7          	jalr	-1920(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintString("GRESKA\n");
    8000686c:	00008517          	auipc	a0,0x8
    80006870:	dcc50513          	addi	a0,a0,-564 # 8000e638 <CONSOLE_STATUS+0x628>
    80006874:	fffff097          	auipc	ra,0xfffff
    80006878:	870080e7          	jalr	-1936(ra) # 800050e4 <_Z12kprintStringPKc>
        while(1);
    8000687c:	0000006f          	j	8000687c <interrupt+0x420>

0000000080006880 <_ZN5Buddy11getInstanceEv>:
    if(!buddy)  return 1;

    return 0;
}

Buddy& Buddy::getInstance(){
    80006880:	ff010113          	addi	sp,sp,-16
    80006884:	00813423          	sd	s0,8(sp)
    80006888:	01010413          	addi	s0,sp,16
    if(!buddy) {  /* panic */ }
    return (*buddy);
}
    8000688c:	0000e797          	auipc	a5,0xe
    80006890:	b0c78793          	addi	a5,a5,-1268 # 80014398 <_ZN5Buddy5buddyE>
    80006894:	0007b503          	ld	a0,0(a5)
    80006898:	00813403          	ld	s0,8(sp)
    8000689c:	01010113          	addi	sp,sp,16
    800068a0:	00008067          	ret

00000000800068a4 <_ZN5Buddy13get_from_listEh>:
    lhp[level] = chunk;

    return 0;
}

mmeta_t* Buddy::get_from_list(uchar level){
    800068a4:	ff010113          	addi	sp,sp,-16
    800068a8:	00813423          	sd	s0,8(sp)
    800068ac:	01010413          	addi	s0,sp,16
    /* chk if level is valid */
    if(level > max_level) return nullptr;
    800068b0:	00853783          	ld	a5,8(a0)
    800068b4:	04b7e463          	bltu	a5,a1,800068fc <_ZN5Buddy13get_from_listEh+0x58>
    mmeta_t* ret = lhp[level];
    800068b8:	01053783          	ld	a5,16(a0)
    800068bc:	00359593          	slli	a1,a1,0x3
    800068c0:	00b787b3          	add	a5,a5,a1
    800068c4:	0007b783          	ld	a5,0(a5)
    if(ret){
    800068c8:	02078063          	beqz	a5,800068e8 <_ZN5Buddy13get_from_listEh+0x44>
        if(ret->next) ret->next->prev = 0;
    800068cc:	0007b703          	ld	a4,0(a5)
    800068d0:	00070463          	beqz	a4,800068d8 <_ZN5Buddy13get_from_listEh+0x34>
    800068d4:	00073423          	sd	zero,8(a4)
        lhp[level] = ret->next;    
    800068d8:	01053703          	ld	a4,16(a0)
    800068dc:	00b705b3          	add	a1,a4,a1
    800068e0:	0007b703          	ld	a4,0(a5)
    800068e4:	00e5b023          	sd	a4,0(a1)
    }
    ret->next = 0;
    800068e8:	0007b023          	sd	zero,0(a5)
    return ret;
}
    800068ec:	00078513          	mv	a0,a5
    800068f0:	00813403          	ld	s0,8(sp)
    800068f4:	01010113          	addi	sp,sp,16
    800068f8:	00008067          	ret
    if(level > max_level) return nullptr;
    800068fc:	00000793          	li	a5,0
    80006900:	fedff06f          	j	800068ec <_ZN5Buddy13get_from_listEh+0x48>

0000000080006904 <_ZN5Buddy5splitEP7mmeta_t>:
    return 0;

}


mmeta_t* Buddy::split(mmeta_t* chunk){
    80006904:	ff010113          	addi	sp,sp,-16
    80006908:	00813423          	sd	s0,8(sp)
    8000690c:	01010413          	addi	s0,sp,16
    /* chk if address is valid */
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    80006910:	000017b7          	lui	a5,0x1
    80006914:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006918:	00f5f7b3          	and	a5,a1,a5
    8000691c:	02079663          	bnez	a5,80006948 <_ZN5Buddy5splitEP7mmeta_t+0x44>
    80006920:	00053783          	ld	a5,0(a0)
    80006924:	02f5e663          	bltu	a1,a5,80006950 <_ZN5Buddy5splitEP7mmeta_t+0x4c>
    return (mmeta_t*)( (uint64)chunk + (BLOCK_SIZE << (chunk->level - 1)) ) ;
    80006928:	0105c503          	lbu	a0,16(a1)
    8000692c:	fff5079b          	addiw	a5,a0,-1
    80006930:	00001537          	lui	a0,0x1
    80006934:	00f51533          	sll	a0,a0,a5
    80006938:	00a58533          	add	a0,a1,a0
}
    8000693c:	00813403          	ld	s0,8(sp)
    80006940:	01010113          	addi	sp,sp,16
    80006944:	00008067          	ret
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    80006948:	00000513          	li	a0,0
    8000694c:	ff1ff06f          	j	8000693c <_ZN5Buddy5splitEP7mmeta_t+0x38>
    80006950:	00000513          	li	a0,0
    80006954:	fe9ff06f          	j	8000693c <_ZN5Buddy5splitEP7mmeta_t+0x38>

0000000080006958 <_ZN5Buddy11get_bit_valEm>:
    chunk->level = chunk->level + 1;

    return chunk;
}

bool Buddy::get_bit_val(size_t index){
    80006958:	ff010113          	addi	sp,sp,-16
    8000695c:	00813423          	sd	s0,8(sp)
    80006960:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    80006964:	0035d713          	srli	a4,a1,0x3
    return fmap[entry] & ( 1 << (index & 7) );
    80006968:	01853783          	ld	a5,24(a0) # 1018 <_entry-0x7fffefe8>
    8000696c:	00e787b3          	add	a5,a5,a4
    80006970:	0007c503          	lbu	a0,0(a5)
    80006974:	0075f593          	andi	a1,a1,7
    80006978:	40b5553b          	sraw	a0,a0,a1
}
    8000697c:	00157513          	andi	a0,a0,1
    80006980:	00813403          	ld	s0,8(sp)
    80006984:	01010113          	addi	sp,sp,16
    80006988:	00008067          	ret

000000008000698c <_ZN5Buddy11add_to_listEhP7mmeta_t>:
    if(level > max_level) return -4;
    8000698c:	00853783          	ld	a5,8(a0)
    80006990:	0ab7ee63          	bltu	a5,a1,80006a4c <_ZN5Buddy11add_to_listEhP7mmeta_t+0xc0>
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006994:	0c060063          	beqz	a2,80006a54 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xc8>
    80006998:	000017b7          	lui	a5,0x1
    8000699c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800069a0:	00f677b3          	and	a5,a2,a5
    800069a4:	0a079c63          	bnez	a5,80006a5c <_ZN5Buddy11add_to_listEhP7mmeta_t+0xd0>
int Buddy::add_to_list(uchar level, mmeta_t* chunk){
    800069a8:	fd010113          	addi	sp,sp,-48
    800069ac:	02113423          	sd	ra,40(sp)
    800069b0:	02813023          	sd	s0,32(sp)
    800069b4:	00913c23          	sd	s1,24(sp)
    800069b8:	01213823          	sd	s2,16(sp)
    800069bc:	01313423          	sd	s3,8(sp)
    800069c0:	03010413          	addi	s0,sp,48
    800069c4:	00060493          	mv	s1,a2
    800069c8:	00058993          	mv	s3,a1
    800069cc:	00050913          	mv	s2,a0
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    800069d0:	00053783          	ld	a5,0(a0)
    800069d4:	40f607b3          	sub	a5,a2,a5
    800069d8:	0000e597          	auipc	a1,0xe
    800069dc:	9b85c583          	lbu	a1,-1608(a1) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    800069e0:	00b7d5b3          	srl	a1,a5,a1
    800069e4:	00000097          	auipc	ra,0x0
    800069e8:	f74080e7          	jalr	-140(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    800069ec:	06050c63          	beqz	a0,80006a64 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xd8>
    chunk -> next = lhp[level];
    800069f0:	01093783          	ld	a5,16(s2)
    800069f4:	00399713          	slli	a4,s3,0x3
    800069f8:	00e787b3          	add	a5,a5,a4
    800069fc:	0007b783          	ld	a5,0(a5)
    80006a00:	00f4b023          	sd	a5,0(s1)
    chunk -> prev = 0;
    80006a04:	0004b423          	sd	zero,8(s1)
    chunk -> level = level;
    80006a08:	01348823          	sb	s3,16(s1)
    if(lhp[level]) lhp[level] -> prev = chunk;
    80006a0c:	01093783          	ld	a5,16(s2)
    80006a10:	00e787b3          	add	a5,a5,a4
    80006a14:	0007b783          	ld	a5,0(a5)
    80006a18:	00078463          	beqz	a5,80006a20 <_ZN5Buddy11add_to_listEhP7mmeta_t+0x94>
    80006a1c:	0097b423          	sd	s1,8(a5)
    lhp[level] = chunk;
    80006a20:	01093783          	ld	a5,16(s2)
    80006a24:	00e787b3          	add	a5,a5,a4
    80006a28:	0097b023          	sd	s1,0(a5)
    return 0;
    80006a2c:	00000513          	li	a0,0
}
    80006a30:	02813083          	ld	ra,40(sp)
    80006a34:	02013403          	ld	s0,32(sp)
    80006a38:	01813483          	ld	s1,24(sp)
    80006a3c:	01013903          	ld	s2,16(sp)
    80006a40:	00813983          	ld	s3,8(sp)
    80006a44:	03010113          	addi	sp,sp,48
    80006a48:	00008067          	ret
    if(level > max_level) return -4;
    80006a4c:	ffc00513          	li	a0,-4
    80006a50:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006a54:	fff00513          	li	a0,-1
    80006a58:	00008067          	ret
    80006a5c:	fff00513          	li	a0,-1
}
    80006a60:	00008067          	ret
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006a64:	ffe00513          	li	a0,-2
    80006a68:	fc9ff06f          	j	80006a30 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xa4>

0000000080006a6c <_ZN5BuddyC1EPvh>:
Buddy::Buddy(void* saddr, uchar level){
    80006a6c:	fd010113          	addi	sp,sp,-48
    80006a70:	02113423          	sd	ra,40(sp)
    80006a74:	02813023          	sd	s0,32(sp)
    80006a78:	00913c23          	sd	s1,24(sp)
    80006a7c:	01213823          	sd	s2,16(sp)
    80006a80:	01313423          	sd	s3,8(sp)
    80006a84:	03010413          	addi	s0,sp,48
    80006a88:	00050493          	mv	s1,a0
    80006a8c:	00060993          	mv	s3,a2
    start_address = saddr;
    80006a90:	00b53023          	sd	a1,0(a0)
    max_level = level;
    80006a94:	00c4b423          	sd	a2,8(s1)
class NoAlloc{ /* singleton */ 
    static bool working;
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    80006a98:	0000e797          	auipc	a5,0xe
    80006a9c:	91878793          	addi	a5,a5,-1768 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006aa0:	0007b503          	ld	a0,0(a5)
    uint64 y = (uint64)saddr + (BLOCK_SIZE << max_level);
    80006aa4:	000017b7          	lui	a5,0x1
    80006aa8:	00c797b3          	sll	a5,a5,a2
    80006aac:	00b787b3          	add	a5,a5,a1
    void* ind = NoAlloc::mem_alloc(y - x);
    80006ab0:	40a78533          	sub	a0,a5,a0
    80006ab4:	00001097          	auipc	ra,0x1
    80006ab8:	304080e7          	jalr	772(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    x = 1 << (BLOCK_SIZE_BIT_LEN - 3);
    80006abc:	0000e917          	auipc	s2,0xe
    80006ac0:	8d494903          	lbu	s2,-1836(s2) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006ac4:	ffd9079b          	addiw	a5,s2,-3
    80006ac8:	00100913          	li	s2,1
    80006acc:	00f9193b          	sllw	s2,s2,a5
    fmap = (uchar*)NoAlloc::mem_alloc(x);
    80006ad0:	00090513          	mv	a0,s2
    80006ad4:	00001097          	auipc	ra,0x1
    80006ad8:	2e4080e7          	jalr	740(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    80006adc:	00a4bc23          	sd	a0,24(s1)
    for(uint64 i = 0; i < x; i++) fmap[i] = 0;
    80006ae0:	00000793          	li	a5,0
    80006ae4:	0127fc63          	bgeu	a5,s2,80006afc <_ZN5BuddyC1EPvh+0x90>
    80006ae8:	0184b703          	ld	a4,24(s1)
    80006aec:	00f70733          	add	a4,a4,a5
    80006af0:	00070023          	sb	zero,0(a4)
    80006af4:	00178793          	addi	a5,a5,1 # 1001 <_entry-0x7fffefff>
    80006af8:	fedff06f          	j	80006ae4 <_ZN5BuddyC1EPvh+0x78>
    lhp = (mmeta_t**)NoAlloc::mem_alloc((level+1)*sizeof(mmeta_t*));
    80006afc:	00198513          	addi	a0,s3,1
    80006b00:	00351513          	slli	a0,a0,0x3
    80006b04:	00001097          	auipc	ra,0x1
    80006b08:	2b4080e7          	jalr	692(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    80006b0c:	00a4b823          	sd	a0,16(s1)
    for(uchar i = 0; i < max_level + 1; i++)
    80006b10:	00000793          	li	a5,0
    80006b14:	0084b703          	ld	a4,8(s1)
    80006b18:	00170713          	addi	a4,a4,1
    80006b1c:	02e7f063          	bgeu	a5,a4,80006b3c <_ZN5BuddyC1EPvh+0xd0>
        lhp[i] = nullptr;
    80006b20:	0104b703          	ld	a4,16(s1)
    80006b24:	00379693          	slli	a3,a5,0x3
    80006b28:	00d70733          	add	a4,a4,a3
    80006b2c:	00073023          	sd	zero,0(a4)
    for(uchar i = 0; i < max_level + 1; i++)
    80006b30:	0017879b          	addiw	a5,a5,1
    80006b34:	0ff7f793          	andi	a5,a5,255
    80006b38:	fddff06f          	j	80006b14 <_ZN5BuddyC1EPvh+0xa8>
    fmap[0] |= 1;
    80006b3c:	0184b703          	ld	a4,24(s1)
    80006b40:	00074783          	lbu	a5,0(a4)
    80006b44:	0017e793          	ori	a5,a5,1
    80006b48:	00f70023          	sb	a5,0(a4)
    int code = add_to_list(max_level, (mmeta_t*)start_address);
    80006b4c:	0004b603          	ld	a2,0(s1)
    80006b50:	0084c583          	lbu	a1,8(s1)
    80006b54:	00048513          	mv	a0,s1
    80006b58:	00000097          	auipc	ra,0x0
    80006b5c:	e34080e7          	jalr	-460(ra) # 8000698c <_ZN5Buddy11add_to_listEhP7mmeta_t>
    80006b60:	00050493          	mv	s1,a0
    if ( code < 0) {
    80006b64:	02054063          	bltz	a0,80006b84 <_ZN5BuddyC1EPvh+0x118>
}
    80006b68:	02813083          	ld	ra,40(sp)
    80006b6c:	02013403          	ld	s0,32(sp)
    80006b70:	01813483          	ld	s1,24(sp)
    80006b74:	01013903          	ld	s2,16(sp)
    80006b78:	00813983          	ld	s3,8(sp)
    80006b7c:	03010113          	addi	sp,sp,48
    80006b80:	00008067          	ret
        kprintString("addtolist panic: ");
    80006b84:	00008517          	auipc	a0,0x8
    80006b88:	92c50513          	addi	a0,a0,-1748 # 8000e4b0 <CONSOLE_STATUS+0x4a0>
    80006b8c:	ffffe097          	auipc	ra,0xffffe
    80006b90:	558080e7          	jalr	1368(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt(code, 16);
    80006b94:	00000613          	li	a2,0
    80006b98:	01000593          	li	a1,16
    80006b9c:	00048513          	mv	a0,s1
    80006ba0:	ffffe097          	auipc	ra,0xffffe
    80006ba4:	58c080e7          	jalr	1420(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80006ba8:	00007517          	auipc	a0,0x7
    80006bac:	7b050513          	addi	a0,a0,1968 # 8000e358 <CONSOLE_STATUS+0x348>
    80006bb0:	ffffe097          	auipc	ra,0xffffe
    80006bb4:	534080e7          	jalr	1332(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80006bb8:	fb1ff06f          	j	80006b68 <_ZN5BuddyC1EPvh+0xfc>

0000000080006bbc <_ZN5Buddy9initalizeEPvh>:
int Buddy::initalize(void* saddr, uchar level){
    80006bbc:	fd010113          	addi	sp,sp,-48
    80006bc0:	02113423          	sd	ra,40(sp)
    80006bc4:	02813023          	sd	s0,32(sp)
    80006bc8:	00913c23          	sd	s1,24(sp)
    80006bcc:	01213823          	sd	s2,16(sp)
    80006bd0:	01313423          	sd	s3,8(sp)
    80006bd4:	03010413          	addi	s0,sp,48
    80006bd8:	00050493          	mv	s1,a0
    80006bdc:	00058913          	mv	s2,a1
    BLOCK_SIZE_BIT_LEN = log2(BLOCK_SIZE);
    80006be0:	00001537          	lui	a0,0x1
    80006be4:	fffff097          	auipc	ra,0xfffff
    80006be8:	eb8080e7          	jalr	-328(ra) # 80005a9c <_Z4log2m>
    80006bec:	0000d797          	auipc	a5,0xd
    80006bf0:	7aa78223          	sb	a0,1956(a5) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006bf4:	0000d797          	auipc	a5,0xd
    80006bf8:	7bc78793          	addi	a5,a5,1980 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006bfc:	0007b783          	ld	a5,0(a5)
    if((uint64)saddr < laa + sizeof(Buddy))
    80006c00:	02078793          	addi	a5,a5,32
    80006c04:	02f4f263          	bgeu	s1,a5,80006c28 <_ZN5Buddy9initalizeEPvh+0x6c>
        return 1;
    80006c08:	00100513          	li	a0,1
}
    80006c0c:	02813083          	ld	ra,40(sp)
    80006c10:	02013403          	ld	s0,32(sp)
    80006c14:	01813483          	ld	s1,24(sp)
    80006c18:	01013903          	ld	s2,16(sp)
    80006c1c:	00813983          	ld	s3,8(sp)
    80006c20:	03010113          	addi	sp,sp,48
    80006c24:	00008067          	ret
    void clr_bit(size_t index);

    /* utility */
    void* get_buddy_addr(uchar level, void*);
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    80006c28:	000017b7          	lui	a5,0x1
    80006c2c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006c30:	00f484b3          	add	s1,s1,a5
    80006c34:	fff00793          	li	a5,-1
    80006c38:	00a79533          	sll	a0,a5,a0
    80006c3c:	00a4f4b3          	and	s1,s1,a0
    __NOALLOC_OPERATORS__
    80006c40:	02000513          	li	a0,32
    80006c44:	00001097          	auipc	ra,0x1
    80006c48:	174080e7          	jalr	372(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    80006c4c:	00050993          	mv	s3,a0
    buddy = new Buddy(saddr, level);
    80006c50:	00090613          	mv	a2,s2
    80006c54:	00048593          	mv	a1,s1
    80006c58:	00000097          	auipc	ra,0x0
    80006c5c:	e14080e7          	jalr	-492(ra) # 80006a6c <_ZN5BuddyC1EPvh>
    80006c60:	0000d797          	auipc	a5,0xd
    80006c64:	7337bc23          	sd	s3,1848(a5) # 80014398 <_ZN5Buddy5buddyE>
    if(!buddy)  return 1;
    80006c68:	00098663          	beqz	s3,80006c74 <_ZN5Buddy9initalizeEPvh+0xb8>
    return 0;
    80006c6c:	00000513          	li	a0,0
    80006c70:	f9dff06f          	j	80006c0c <_ZN5Buddy9initalizeEPvh+0x50>
    if(!buddy)  return 1;
    80006c74:	00100513          	li	a0,1
    80006c78:	f95ff06f          	j	80006c0c <_ZN5Buddy9initalizeEPvh+0x50>

0000000080006c7c <_ZN5Buddy16remove_from_listEhP7mmeta_t>:
    if(level > max_level) return -4;
    80006c7c:	00853783          	ld	a5,8(a0) # 1008 <_entry-0x7fffeff8>
    80006c80:	0cb7ea63          	bltu	a5,a1,80006d54 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xd8>
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006c84:	0c060c63          	beqz	a2,80006d5c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xe0>
    80006c88:	000017b7          	lui	a5,0x1
    80006c8c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006c90:	00f677b3          	and	a5,a2,a5
    80006c94:	0c079863          	bnez	a5,80006d64 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xe8>
int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    80006c98:	fd010113          	addi	sp,sp,-48
    80006c9c:	02113423          	sd	ra,40(sp)
    80006ca0:	02813023          	sd	s0,32(sp)
    80006ca4:	00913c23          	sd	s1,24(sp)
    80006ca8:	01213823          	sd	s2,16(sp)
    80006cac:	01313423          	sd	s3,8(sp)
    80006cb0:	03010413          	addi	s0,sp,48
    80006cb4:	00060493          	mv	s1,a2
    80006cb8:	00058993          	mv	s3,a1
    80006cbc:	00050913          	mv	s2,a0
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006cc0:	00053783          	ld	a5,0(a0)
    80006cc4:	40f607b3          	sub	a5,a2,a5
    80006cc8:	0000d597          	auipc	a1,0xd
    80006ccc:	6c85c583          	lbu	a1,1736(a1) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006cd0:	00b7d5b3          	srl	a1,a5,a1
    80006cd4:	00000097          	auipc	ra,0x0
    80006cd8:	c84080e7          	jalr	-892(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    80006cdc:	08050863          	beqz	a0,80006d6c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xf0>
    if(!(chunk->level == level)) return -3;
    80006ce0:	0104c783          	lbu	a5,16(s1)
    80006ce4:	09379863          	bne	a5,s3,80006d74 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xf8>
    if(lhp[level] == chunk){
    80006ce8:	01093783          	ld	a5,16(s2)
    80006cec:	00399713          	slli	a4,s3,0x3
    80006cf0:	00e787b3          	add	a5,a5,a4
    80006cf4:	0007b783          	ld	a5,0(a5)
    80006cf8:	04978263          	beq	a5,s1,80006d3c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xc0>
    chunk->prev->next = chunk->next;
    80006cfc:	0084b703          	ld	a4,8(s1)
    80006d00:	0004b783          	ld	a5,0(s1)
    80006d04:	00f73023          	sd	a5,0(a4)
    if(chunk->next) chunk->next->prev = chunk->prev;
    80006d08:	00078663          	beqz	a5,80006d14 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0x98>
    80006d0c:	0084b703          	ld	a4,8(s1)
    80006d10:	00e7b423          	sd	a4,8(a5)
    chunk->next = chunk->prev = 0;
    80006d14:	0004b423          	sd	zero,8(s1)
    80006d18:	0004b023          	sd	zero,0(s1)
    return 0;
    80006d1c:	00000513          	li	a0,0
}
    80006d20:	02813083          	ld	ra,40(sp)
    80006d24:	02013403          	ld	s0,32(sp)
    80006d28:	01813483          	ld	s1,24(sp)
    80006d2c:	01013903          	ld	s2,16(sp)
    80006d30:	00813983          	ld	s3,8(sp)
    80006d34:	03010113          	addi	sp,sp,48
    80006d38:	00008067          	ret
        get_from_list(level);
    80006d3c:	00098593          	mv	a1,s3
    80006d40:	00090513          	mv	a0,s2
    80006d44:	00000097          	auipc	ra,0x0
    80006d48:	b60080e7          	jalr	-1184(ra) # 800068a4 <_ZN5Buddy13get_from_listEh>
        return 0;
    80006d4c:	00000513          	li	a0,0
    80006d50:	fd1ff06f          	j	80006d20 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>
    if(level > max_level) return -4;
    80006d54:	ffc00513          	li	a0,-4
    80006d58:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006d5c:	fff00513          	li	a0,-1
    80006d60:	00008067          	ret
    80006d64:	fff00513          	li	a0,-1
}
    80006d68:	00008067          	ret
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006d6c:	ffe00513          	li	a0,-2
    80006d70:	fb1ff06f          	j	80006d20 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>
    if(!(chunk->level == level)) return -3;
    80006d74:	ffd00513          	li	a0,-3
    80006d78:	fa9ff06f          	j	80006d20 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>

0000000080006d7c <_ZN5Buddy7set_bitEm>:

void Buddy::set_bit(size_t index){
    80006d7c:	ff010113          	addi	sp,sp,-16
    80006d80:	00813423          	sd	s0,8(sp)
    80006d84:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    80006d88:	0035d713          	srli	a4,a1,0x3
    fmap[entry] |= ( 1 << (index & 7) );
    80006d8c:	01853783          	ld	a5,24(a0)
    80006d90:	00e787b3          	add	a5,a5,a4
    80006d94:	0075f713          	andi	a4,a1,7
    80006d98:	00100593          	li	a1,1
    80006d9c:	00e595bb          	sllw	a1,a1,a4
    80006da0:	0007c703          	lbu	a4,0(a5)
    80006da4:	00e5e5b3          	or	a1,a1,a4
    80006da8:	00b78023          	sb	a1,0(a5)
}
    80006dac:	00813403          	ld	s0,8(sp)
    80006db0:	01010113          	addi	sp,sp,16
    80006db4:	00008067          	ret

0000000080006db8 <_ZN5Buddy7clr_bitEm>:

void Buddy::clr_bit(size_t index){
    80006db8:	ff010113          	addi	sp,sp,-16
    80006dbc:	00813423          	sd	s0,8(sp)
    80006dc0:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    80006dc4:	0035d793          	srli	a5,a1,0x3
    fmap[entry] &= ~( 1 << (index & 7) );
    80006dc8:	01853703          	ld	a4,24(a0)
    80006dcc:	00f70733          	add	a4,a4,a5
    80006dd0:	0075f593          	andi	a1,a1,7
    80006dd4:	00100793          	li	a5,1
    80006dd8:	00b797bb          	sllw	a5,a5,a1
    80006ddc:	fff7c793          	not	a5,a5
    80006de0:	00074683          	lbu	a3,0(a4)
    80006de4:	00d7f7b3          	and	a5,a5,a3
    80006de8:	00f70023          	sb	a5,0(a4)
}
    80006dec:	00813403          	ld	s0,8(sp)
    80006df0:	01010113          	addi	sp,sp,16
    80006df4:	00008067          	ret

0000000080006df8 <_ZN5Buddy9mem_allocEh>:
void* Buddy::mem_alloc(uchar level){
    80006df8:	fc010113          	addi	sp,sp,-64
    80006dfc:	02113c23          	sd	ra,56(sp)
    80006e00:	02813823          	sd	s0,48(sp)
    80006e04:	02913423          	sd	s1,40(sp)
    80006e08:	03213023          	sd	s2,32(sp)
    80006e0c:	01313c23          	sd	s3,24(sp)
    80006e10:	01413823          	sd	s4,16(sp)
    80006e14:	01513423          	sd	s5,8(sp)
    80006e18:	04010413          	addi	s0,sp,64
    if(level > max_level) return nullptr;
    80006e1c:	00853683          	ld	a3,8(a0)
    80006e20:	0eb6ec63          	bltu	a3,a1,80006f18 <_ZN5Buddy9mem_allocEh+0x120>
    uchar i = level;
    80006e24:	00058493          	mv	s1,a1
    for(; i <= max_level; i++)
    80006e28:	00048613          	mv	a2,s1
    80006e2c:	0296e263          	bltu	a3,s1,80006e50 <_ZN5Buddy9mem_allocEh+0x58>
        if(lhp[i]) break;
    80006e30:	01053783          	ld	a5,16(a0)
    80006e34:	00349713          	slli	a4,s1,0x3
    80006e38:	00e787b3          	add	a5,a5,a4
    80006e3c:	0007b783          	ld	a5,0(a5)
    80006e40:	00079863          	bnez	a5,80006e50 <_ZN5Buddy9mem_allocEh+0x58>
    for(; i <= max_level; i++)
    80006e44:	0014849b          	addiw	s1,s1,1
    80006e48:	0ff4f493          	andi	s1,s1,255
    80006e4c:	fddff06f          	j	80006e28 <_ZN5Buddy9mem_allocEh+0x30>
    if(i > max_level) return nullptr;
    80006e50:	0cc6e863          	bltu	a3,a2,80006f20 <_ZN5Buddy9mem_allocEh+0x128>
    80006e54:	00058a93          	mv	s5,a1
    80006e58:	00050913          	mv	s2,a0
    mmeta_t* chunk = get_from_list(i);
    80006e5c:	00048593          	mv	a1,s1
    80006e60:	00000097          	auipc	ra,0x0
    80006e64:	a44080e7          	jalr	-1468(ra) # 800068a4 <_ZN5Buddy13get_from_listEh>
    80006e68:	00050993          	mv	s3,a0
    for(;i > level; i--){
    80006e6c:	069af263          	bgeu	s5,s1,80006ed0 <_ZN5Buddy9mem_allocEh+0xd8>
        mmeta_t* t = split(chunk);
    80006e70:	00098593          	mv	a1,s3
    80006e74:	00090513          	mv	a0,s2
    80006e78:	00000097          	auipc	ra,0x0
    80006e7c:	a8c080e7          	jalr	-1396(ra) # 80006904 <_ZN5Buddy5splitEP7mmeta_t>
    80006e80:	00050a13          	mv	s4,a0
        set_bit(BLOCK_IND(t));
    80006e84:	00093783          	ld	a5,0(s2)
    80006e88:	40f507b3          	sub	a5,a0,a5
    80006e8c:	0000d597          	auipc	a1,0xd
    80006e90:	5045c583          	lbu	a1,1284(a1) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006e94:	00b7d5b3          	srl	a1,a5,a1
    80006e98:	00090513          	mv	a0,s2
    80006e9c:	00000097          	auipc	ra,0x0
    80006ea0:	ee0080e7          	jalr	-288(ra) # 80006d7c <_ZN5Buddy7set_bitEm>
        add_to_list(i-1, t);
    80006ea4:	fff4849b          	addiw	s1,s1,-1
    80006ea8:	0ff4f493          	andi	s1,s1,255
    80006eac:	000a0613          	mv	a2,s4
    80006eb0:	00048593          	mv	a1,s1
    80006eb4:	00090513          	mv	a0,s2
    80006eb8:	00000097          	auipc	ra,0x0
    80006ebc:	ad4080e7          	jalr	-1324(ra) # 8000698c <_ZN5Buddy11add_to_listEhP7mmeta_t>
        chunk->level--;
    80006ec0:	0109c783          	lbu	a5,16(s3)
    80006ec4:	fff7879b          	addiw	a5,a5,-1
    80006ec8:	00f98823          	sb	a5,16(s3)
    for(;i > level; i--){
    80006ecc:	fa1ff06f          	j	80006e6c <_ZN5Buddy9mem_allocEh+0x74>
    clr_bit(BLOCK_IND(chunk));
    80006ed0:	00093783          	ld	a5,0(s2)
    80006ed4:	40f987b3          	sub	a5,s3,a5
    80006ed8:	0000d597          	auipc	a1,0xd
    80006edc:	4b85c583          	lbu	a1,1208(a1) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006ee0:	00b7d5b3          	srl	a1,a5,a1
    80006ee4:	00090513          	mv	a0,s2
    80006ee8:	00000097          	auipc	ra,0x0
    80006eec:	ed0080e7          	jalr	-304(ra) # 80006db8 <_ZN5Buddy7clr_bitEm>
}
    80006ef0:	00098513          	mv	a0,s3
    80006ef4:	03813083          	ld	ra,56(sp)
    80006ef8:	03013403          	ld	s0,48(sp)
    80006efc:	02813483          	ld	s1,40(sp)
    80006f00:	02013903          	ld	s2,32(sp)
    80006f04:	01813983          	ld	s3,24(sp)
    80006f08:	01013a03          	ld	s4,16(sp)
    80006f0c:	00813a83          	ld	s5,8(sp)
    80006f10:	04010113          	addi	sp,sp,64
    80006f14:	00008067          	ret
    if(level > max_level) return nullptr;
    80006f18:	00000993          	li	s3,0
    80006f1c:	fd5ff06f          	j	80006ef0 <_ZN5Buddy9mem_allocEh+0xf8>
    if(i > max_level) return nullptr;
    80006f20:	00000993          	li	s3,0
    80006f24:	fcdff06f          	j	80006ef0 <_ZN5Buddy9mem_allocEh+0xf8>

0000000080006f28 <_Z3kmiv>:

int kmi(){
    80006f28:	fe010113          	addi	sp,sp,-32
    80006f2c:	00113c23          	sd	ra,24(sp)
    80006f30:	00813823          	sd	s0,16(sp)
    80006f34:	00913423          	sd	s1,8(sp)
    80006f38:	01213023          	sd	s2,0(sp)
    80006f3c:	02010413          	addi	s0,sp,32
    80006f40:	0000d797          	auipc	a5,0xd
    80006f44:	47078793          	addi	a5,a5,1136 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006f48:	0007b903          	ld	s2,0(a5)
    /* start of reserved memory for buddy allocator */
    void* buddy_mem_start = (void*)( 
        (uint64)NoAlloc::getEndAddress() + sizeof(Buddy) ) ;
    80006f4c:	02090913          	addi	s2,s2,32

    size_t buddy_mem_size = ((uint64)HEAP_END_ADDR - (uint64)buddy_mem_start) >> 3;
    80006f50:	0000c797          	auipc	a5,0xc
    80006f54:	a6878793          	addi	a5,a5,-1432 # 800129b8 <HEAP_END_ADDR>
    80006f58:	0007b503          	ld	a0,0(a5)
    80006f5c:	41250533          	sub	a0,a0,s2
    80006f60:	00355513          	srli	a0,a0,0x3
    if(!buddy_mem_size) return 2;
    80006f64:	06050663          	beqz	a0,80006fd0 <_Z3kmiv+0xa8>
    buddy_mem_size = ( (buddy_mem_size-1) >> log2(Buddy::BLOCK_SIZE) ) + 1;
    80006f68:	fff50493          	addi	s1,a0,-1
    80006f6c:	00001537          	lui	a0,0x1
    80006f70:	fffff097          	auipc	ra,0xfffff
    80006f74:	b2c080e7          	jalr	-1236(ra) # 80005a9c <_Z4log2m>
    80006f78:	00a4d533          	srl	a0,s1,a0
    uchar level = log2(closest2pow(buddy_mem_size));
    80006f7c:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80006f80:	fffff097          	auipc	ra,0xfffff
    80006f84:	af0080e7          	jalr	-1296(ra) # 80005a70 <_Z11closest2powm>
    80006f88:	fffff097          	auipc	ra,0xfffff
    80006f8c:	b14080e7          	jalr	-1260(ra) # 80005a9c <_Z4log2m>
    
    int ret = Buddy::initalize(buddy_mem_start, level);
    80006f90:	00050593          	mv	a1,a0
    80006f94:	00090513          	mv	a0,s2
    80006f98:	00000097          	auipc	ra,0x0
    80006f9c:	c24080e7          	jalr	-988(ra) # 80006bbc <_ZN5Buddy9initalizeEPvh>
    80006fa0:	00050493          	mv	s1,a0
    if(!ret) SlabAllocator::getInstance();
    80006fa4:	02050063          	beqz	a0,80006fc4 <_Z3kmiv+0x9c>
    return ret;
}
    80006fa8:	00048513          	mv	a0,s1
    80006fac:	01813083          	ld	ra,24(sp)
    80006fb0:	01013403          	ld	s0,16(sp)
    80006fb4:	00813483          	ld	s1,8(sp)
    80006fb8:	00013903          	ld	s2,0(sp)
    80006fbc:	02010113          	addi	sp,sp,32
    80006fc0:	00008067          	ret
    if(!ret) SlabAllocator::getInstance();
    80006fc4:	00002097          	auipc	ra,0x2
    80006fc8:	178080e7          	jalr	376(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80006fcc:	fddff06f          	j	80006fa8 <_Z3kmiv+0x80>
    if(!buddy_mem_size) return 2;
    80006fd0:	00200493          	li	s1,2
    80006fd4:	fd5ff06f          	j	80006fa8 <_Z3kmiv+0x80>

0000000080006fd8 <_ZN5Buddy8print_beEm>:

void Buddy::print_be(size_t index){
    80006fd8:	fe010113          	addi	sp,sp,-32
    80006fdc:	00113c23          	sd	ra,24(sp)
    80006fe0:	00813823          	sd	s0,16(sp)
    80006fe4:	00913423          	sd	s1,8(sp)
    80006fe8:	01213023          	sd	s2,0(sp)
    80006fec:	02010413          	addi	s0,sp,32
    80006ff0:	00050913          	mv	s2,a0
    80006ff4:	00058493          	mv	s1,a1
    kprintString("blocks["); kprintInt( index, 10); kprintString("]: ");
    80006ff8:	00007517          	auipc	a0,0x7
    80006ffc:	4d050513          	addi	a0,a0,1232 # 8000e4c8 <CONSOLE_STATUS+0x4b8>
    80007000:	ffffe097          	auipc	ra,0xffffe
    80007004:	0e4080e7          	jalr	228(ra) # 800050e4 <_Z12kprintStringPKc>
    80007008:	00000613          	li	a2,0
    8000700c:	00a00593          	li	a1,10
    80007010:	00048513          	mv	a0,s1
    80007014:	ffffe097          	auipc	ra,0xffffe
    80007018:	118080e7          	jalr	280(ra) # 8000512c <_Z9kprintIntmib>
    8000701c:	00007517          	auipc	a0,0x7
    80007020:	4b450513          	addi	a0,a0,1204 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80007024:	ffffe097          	auipc	ra,0xffffe
    80007028:	0c0080e7          	jalr	192(ra) # 800050e4 <_Z12kprintStringPKc>
    bool bit = get_bit_val(index);
    8000702c:	00048593          	mv	a1,s1
    80007030:	00090513          	mv	a0,s2
    80007034:	00000097          	auipc	ra,0x0
    80007038:	924080e7          	jalr	-1756(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    if(bit)
    8000703c:	02050663          	beqz	a0,80007068 <_ZN5Buddy8print_beEm+0x90>
        kprintString("FREE");
    80007040:	00007517          	auipc	a0,0x7
    80007044:	49850513          	addi	a0,a0,1176 # 8000e4d8 <CONSOLE_STATUS+0x4c8>
    80007048:	ffffe097          	auipc	ra,0xffffe
    8000704c:	09c080e7          	jalr	156(ra) # 800050e4 <_Z12kprintStringPKc>
    else
        kprintString("ALLOC");
}
    80007050:	01813083          	ld	ra,24(sp)
    80007054:	01013403          	ld	s0,16(sp)
    80007058:	00813483          	ld	s1,8(sp)
    8000705c:	00013903          	ld	s2,0(sp)
    80007060:	02010113          	addi	sp,sp,32
    80007064:	00008067          	ret
        kprintString("ALLOC");
    80007068:	00007517          	auipc	a0,0x7
    8000706c:	47850513          	addi	a0,a0,1144 # 8000e4e0 <CONSOLE_STATUS+0x4d0>
    80007070:	ffffe097          	auipc	ra,0xffffe
    80007074:	074080e7          	jalr	116(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80007078:	fd9ff06f          	j	80007050 <_ZN5Buddy8print_beEm+0x78>

000000008000707c <_ZN5Buddy12status_printEb>:

void Buddy::status_print(bool f){
    8000707c:	fd010113          	addi	sp,sp,-48
    80007080:	02113423          	sd	ra,40(sp)
    80007084:	02813023          	sd	s0,32(sp)
    80007088:	00913c23          	sd	s1,24(sp)
    8000708c:	01213823          	sd	s2,16(sp)
    80007090:	01313423          	sd	s3,8(sp)
    80007094:	01413023          	sd	s4,0(sp)
    80007098:	03010413          	addi	s0,sp,48
    if(!buddy){
    8000709c:	0000d797          	auipc	a5,0xd
    800070a0:	2fc78793          	addi	a5,a5,764 # 80014398 <_ZN5Buddy5buddyE>
    800070a4:	0007b783          	ld	a5,0(a5)
    800070a8:	0c078c63          	beqz	a5,80007180 <_ZN5Buddy12status_printEb+0x104>
    800070ac:	00050993          	mv	s3,a0
    800070b0:	00058a13          	mv	s4,a1
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    800070b4:	00007517          	auipc	a0,0x7
    800070b8:	44c50513          	addi	a0,a0,1100 # 8000e500 <CONSOLE_STATUS+0x4f0>
    800070bc:	ffffe097          	auipc	ra,0xffffe
    800070c0:	028080e7          	jalr	40(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    800070c4:	00007517          	auipc	a0,0x7
    800070c8:	45c50513          	addi	a0,a0,1116 # 8000e520 <CONSOLE_STATUS+0x510>
    800070cc:	ffffe097          	auipc	ra,0xffffe
    800070d0:	018080e7          	jalr	24(ra) # 800050e4 <_Z12kprintStringPKc>
    800070d4:	00000613          	li	a2,0
    800070d8:	01000593          	li	a1,16
    800070dc:	0000d797          	auipc	a5,0xd
    800070e0:	2bc78793          	addi	a5,a5,700 # 80014398 <_ZN5Buddy5buddyE>
    800070e4:	0007b503          	ld	a0,0(a5)
    800070e8:	ffffe097          	auipc	ra,0xffffe
    800070ec:	044080e7          	jalr	68(ra) # 8000512c <_Z9kprintIntmib>
    800070f0:	00007517          	auipc	a0,0x7
    800070f4:	26850513          	addi	a0,a0,616 # 8000e358 <CONSOLE_STATUS+0x348>
    800070f8:	ffffe097          	auipc	ra,0xffffe
    800070fc:	fec080e7          	jalr	-20(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    80007100:	00007517          	auipc	a0,0x7
    80007104:	42850513          	addi	a0,a0,1064 # 8000e528 <CONSOLE_STATUS+0x518>
    80007108:	ffffe097          	auipc	ra,0xffffe
    8000710c:	fdc080e7          	jalr	-36(ra) # 800050e4 <_Z12kprintStringPKc>
    80007110:	00000613          	li	a2,0
    80007114:	01000593          	li	a1,16
    80007118:	0009b503          	ld	a0,0(s3)
    8000711c:	ffffe097          	auipc	ra,0xffffe
    80007120:	010080e7          	jalr	16(ra) # 8000512c <_Z9kprintIntmib>
    80007124:	00007517          	auipc	a0,0x7
    80007128:	23450513          	addi	a0,a0,564 # 8000e358 <CONSOLE_STATUS+0x348>
    8000712c:	ffffe097          	auipc	ra,0xffffe
    80007130:	fb8080e7          	jalr	-72(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(max_level);
    80007134:	00007517          	auipc	a0,0x7
    80007138:	40450513          	addi	a0,a0,1028 # 8000e538 <CONSOLE_STATUS+0x528>
    8000713c:	ffffe097          	auipc	ra,0xffffe
    80007140:	fa8080e7          	jalr	-88(ra) # 800050e4 <_Z12kprintStringPKc>
    80007144:	00000613          	li	a2,0
    80007148:	01000593          	li	a1,16
    8000714c:	0089b503          	ld	a0,8(s3)
    80007150:	ffffe097          	auipc	ra,0xffffe
    80007154:	fdc080e7          	jalr	-36(ra) # 8000512c <_Z9kprintIntmib>
    80007158:	00007517          	auipc	a0,0x7
    8000715c:	20050513          	addi	a0,a0,512 # 8000e358 <CONSOLE_STATUS+0x348>
    80007160:	ffffe097          	auipc	ra,0xffffe
    80007164:	f84080e7          	jalr	-124(ra) # 800050e4 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    80007168:	00007517          	auipc	a0,0x7
    8000716c:	3e050513          	addi	a0,a0,992 # 8000e548 <CONSOLE_STATUS+0x538>
    80007170:	ffffe097          	auipc	ra,0xffffe
    80007174:	f74080e7          	jalr	-140(ra) # 800050e4 <_Z12kprintStringPKc>
    for(uchar i = 0; i <= max_level; i++){
    80007178:	00000913          	li	s2,0
    8000717c:	0680006f          	j	800071e4 <_ZN5Buddy12status_printEb+0x168>
        kprintString("BUDDY NOT INITALIZED!!!");
    80007180:	00007517          	auipc	a0,0x7
    80007184:	36850513          	addi	a0,a0,872 # 8000e4e8 <CONSOLE_STATUS+0x4d8>
    80007188:	ffffe097          	auipc	ra,0xffffe
    8000718c:	f5c080e7          	jalr	-164(ra) # 800050e4 <_Z12kprintStringPKc>
        return;
    80007190:	18c0006f          	j	8000731c <_ZN5Buddy12status_printEb+0x2a0>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
        kprintString("\t");
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
            kprintInt((uint64)curr, 16);
            if(curr->next)
                kprintString(" -> ");
    80007194:	00007517          	auipc	a0,0x7
    80007198:	3e450513          	addi	a0,a0,996 # 8000e578 <CONSOLE_STATUS+0x568>
    8000719c:	ffffe097          	auipc	ra,0xffffe
    800071a0:	f48080e7          	jalr	-184(ra) # 800050e4 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    800071a4:	0004b483          	ld	s1,0(s1)
    800071a8:	02048263          	beqz	s1,800071cc <_ZN5Buddy12status_printEb+0x150>
            kprintInt((uint64)curr, 16);
    800071ac:	00000613          	li	a2,0
    800071b0:	01000593          	li	a1,16
    800071b4:	00048513          	mv	a0,s1
    800071b8:	ffffe097          	auipc	ra,0xffffe
    800071bc:	f74080e7          	jalr	-140(ra) # 8000512c <_Z9kprintIntmib>
            if(curr->next)
    800071c0:	0004b783          	ld	a5,0(s1)
    800071c4:	fc0798e3          	bnez	a5,80007194 <_ZN5Buddy12status_printEb+0x118>
    800071c8:	fddff06f          	j	800071a4 <_ZN5Buddy12status_printEb+0x128>
        }
        kprintString("\n");
    800071cc:	00007517          	auipc	a0,0x7
    800071d0:	18c50513          	addi	a0,a0,396 # 8000e358 <CONSOLE_STATUS+0x348>
    800071d4:	ffffe097          	auipc	ra,0xffffe
    800071d8:	f10080e7          	jalr	-240(ra) # 800050e4 <_Z12kprintStringPKc>
    for(uchar i = 0; i <= max_level; i++){
    800071dc:	0019091b          	addiw	s2,s2,1
    800071e0:	0ff97913          	andi	s2,s2,255
    800071e4:	0089b783          	ld	a5,8(s3)
    800071e8:	0927ee63          	bltu	a5,s2,80007284 <_ZN5Buddy12status_printEb+0x208>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
    800071ec:	00007517          	auipc	a0,0x7
    800071f0:	37c50513          	addi	a0,a0,892 # 8000e568 <CONSOLE_STATUS+0x558>
    800071f4:	ffffe097          	auipc	ra,0xffffe
    800071f8:	ef0080e7          	jalr	-272(ra) # 800050e4 <_Z12kprintStringPKc>
    800071fc:	00007517          	auipc	a0,0x7
    80007200:	37450513          	addi	a0,a0,884 # 8000e570 <CONSOLE_STATUS+0x560>
    80007204:	ffffe097          	auipc	ra,0xffffe
    80007208:	ee0080e7          	jalr	-288(ra) # 800050e4 <_Z12kprintStringPKc>
    8000720c:	00000613          	li	a2,0
    80007210:	00a00593          	li	a1,10
    80007214:	00090513          	mv	a0,s2
    80007218:	ffffe097          	auipc	ra,0xffffe
    8000721c:	f14080e7          	jalr	-236(ra) # 8000512c <_Z9kprintIntmib>
    80007220:	00007517          	auipc	a0,0x7
    80007224:	2b050513          	addi	a0,a0,688 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80007228:	ffffe097          	auipc	ra,0xffffe
    8000722c:	ebc080e7          	jalr	-324(ra) # 800050e4 <_Z12kprintStringPKc>
    80007230:	0109b783          	ld	a5,16(s3)
    80007234:	00391493          	slli	s1,s2,0x3
    80007238:	009787b3          	add	a5,a5,s1
    8000723c:	0007b503          	ld	a0,0(a5)
    80007240:	00000613          	li	a2,0
    80007244:	01000593          	li	a1,16
    80007248:	00a03533          	snez	a0,a0
    8000724c:	ffffe097          	auipc	ra,0xffffe
    80007250:	ee0080e7          	jalr	-288(ra) # 8000512c <_Z9kprintIntmib>
    80007254:	00007517          	auipc	a0,0x7
    80007258:	10450513          	addi	a0,a0,260 # 8000e358 <CONSOLE_STATUS+0x348>
    8000725c:	ffffe097          	auipc	ra,0xffffe
    80007260:	e88080e7          	jalr	-376(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintString("\t");
    80007264:	00007517          	auipc	a0,0x7
    80007268:	30450513          	addi	a0,a0,772 # 8000e568 <CONSOLE_STATUS+0x558>
    8000726c:	ffffe097          	auipc	ra,0xffffe
    80007270:	e78080e7          	jalr	-392(ra) # 800050e4 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    80007274:	0109b783          	ld	a5,16(s3)
    80007278:	009787b3          	add	a5,a5,s1
    8000727c:	0007b483          	ld	s1,0(a5)
    80007280:	f29ff06f          	j	800071a8 <_ZN5Buddy12status_printEb+0x12c>
    }
    kprintString("\n");
    80007284:	00007517          	auipc	a0,0x7
    80007288:	0d450513          	addi	a0,a0,212 # 8000e358 <CONSOLE_STATUS+0x348>
    8000728c:	ffffe097          	auipc	ra,0xffffe
    80007290:	e58080e7          	jalr	-424(ra) # 800050e4 <_Z12kprintStringPKc>
    if(f){
    80007294:	060a0463          	beqz	s4,800072fc <_ZN5Buddy12status_printEb+0x280>
        for(size_t i = 0; i < (1ULL << max_level); i++){
    80007298:	00000493          	li	s1,0
    8000729c:	0080006f          	j	800072a4 <_ZN5Buddy12status_printEb+0x228>
    800072a0:	00148493          	addi	s1,s1,1
    800072a4:	0089b703          	ld	a4,8(s3)
    800072a8:	00100793          	li	a5,1
    800072ac:	00e797b3          	sll	a5,a5,a4
    800072b0:	04f4f663          	bgeu	s1,a5,800072fc <_ZN5Buddy12status_printEb+0x280>
            if(get_bit_val(i)){
    800072b4:	00048593          	mv	a1,s1
    800072b8:	00098513          	mv	a0,s3
    800072bc:	fffff097          	auipc	ra,0xfffff
    800072c0:	69c080e7          	jalr	1692(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    800072c4:	fc050ee3          	beqz	a0,800072a0 <_ZN5Buddy12status_printEb+0x224>
                kprintString("\t"); print_be(i); kprintString("\n");
    800072c8:	00007517          	auipc	a0,0x7
    800072cc:	2a050513          	addi	a0,a0,672 # 8000e568 <CONSOLE_STATUS+0x558>
    800072d0:	ffffe097          	auipc	ra,0xffffe
    800072d4:	e14080e7          	jalr	-492(ra) # 800050e4 <_Z12kprintStringPKc>
    800072d8:	00048593          	mv	a1,s1
    800072dc:	00098513          	mv	a0,s3
    800072e0:	00000097          	auipc	ra,0x0
    800072e4:	cf8080e7          	jalr	-776(ra) # 80006fd8 <_ZN5Buddy8print_beEm>
    800072e8:	00007517          	auipc	a0,0x7
    800072ec:	07050513          	addi	a0,a0,112 # 8000e358 <CONSOLE_STATUS+0x348>
    800072f0:	ffffe097          	auipc	ra,0xffffe
    800072f4:	df4080e7          	jalr	-524(ra) # 800050e4 <_Z12kprintStringPKc>
    800072f8:	fa9ff06f          	j	800072a0 <_ZN5Buddy12status_printEb+0x224>
            }
        }
    }
    kprintString("\t----END MEMORY META----\n");
    800072fc:	00007517          	auipc	a0,0x7
    80007300:	28450513          	addi	a0,a0,644 # 8000e580 <CONSOLE_STATUS+0x570>
    80007304:	ffffe097          	auipc	ra,0xffffe
    80007308:	de0080e7          	jalr	-544(ra) # 800050e4 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    8000730c:	00007517          	auipc	a0,0x7
    80007310:	29450513          	addi	a0,a0,660 # 8000e5a0 <CONSOLE_STATUS+0x590>
    80007314:	ffffe097          	auipc	ra,0xffffe
    80007318:	dd0080e7          	jalr	-560(ra) # 800050e4 <_Z12kprintStringPKc>

    8000731c:	02813083          	ld	ra,40(sp)
    80007320:	02013403          	ld	s0,32(sp)
    80007324:	01813483          	ld	s1,24(sp)
    80007328:	01013903          	ld	s2,16(sp)
    8000732c:	00813983          	ld	s3,8(sp)
    80007330:	00013a03          	ld	s4,0(sp)
    80007334:	03010113          	addi	sp,sp,48
    80007338:	00008067          	ret

000000008000733c <_ZN5Buddy8merge_ipEP7mmeta_t>:
mmeta_t* Buddy::merge_ip(mmeta_t* chunk){
    8000733c:	fa010113          	addi	sp,sp,-96
    80007340:	04113c23          	sd	ra,88(sp)
    80007344:	04813823          	sd	s0,80(sp)
    80007348:	04913423          	sd	s1,72(sp)
    8000734c:	05213023          	sd	s2,64(sp)
    80007350:	03313c23          	sd	s3,56(sp)
    80007354:	03413823          	sd	s4,48(sp)
    80007358:	06010413          	addi	s0,sp,96
    8000735c:	00050913          	mv	s2,a0
    80007360:	fab43423          	sd	a1,-88(s0)
    size_t bi = BLOCK_IND(chunk);
    80007364:	00053783          	ld	a5,0(a0)
    80007368:	40f587b3          	sub	a5,a1,a5
    8000736c:	0000da17          	auipc	s4,0xd
    80007370:	024a4a03          	lbu	s4,36(s4) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80007374:	0147d7b3          	srl	a5,a5,s4
    80007378:	fcf43423          	sd	a5,-56(s0)
    budd_bi = bi ^ (1ULL << chunk->level);
    8000737c:	0105c983          	lbu	s3,16(a1)
    80007380:	00100493          	li	s1,1
    80007384:	013494b3          	sll	s1,s1,s3
    80007388:	0097c4b3          	xor	s1,a5,s1
    8000738c:	fc943023          	sd	s1,-64(s0)
    if(!get_bit_val(bi)) return nullptr;
    80007390:	00078593          	mv	a1,a5
    80007394:	fffff097          	auipc	ra,0xfffff
    80007398:	5c4080e7          	jalr	1476(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    8000739c:	0a050663          	beqz	a0,80007448 <_ZN5Buddy8merge_ipEP7mmeta_t+0x10c>
    mmeta_t* budd_addr = (mmeta_t*)((budd_bi << BLOCK_SIZE_BIT_LEN) + (size_t)start_address);
    800073a0:	014494b3          	sll	s1,s1,s4
    800073a4:	00093603          	ld	a2,0(s2)
    800073a8:	00960633          	add	a2,a2,s1
    800073ac:	fac43c23          	sd	a2,-72(s0)
    if(budd_addr->level != chunk->level) return nullptr;
    800073b0:	01064583          	lbu	a1,16(a2)
    800073b4:	08b99e63          	bne	s3,a1,80007450 <_ZN5Buddy8merge_ipEP7mmeta_t+0x114>
    int code = remove_from_list(budd_addr->level, budd_addr);    
    800073b8:	00090513          	mv	a0,s2
    800073bc:	00000097          	auipc	ra,0x0
    800073c0:	8c0080e7          	jalr	-1856(ra) # 80006c7c <_ZN5Buddy16remove_from_listEhP7mmeta_t>
    if(code < 0) return nullptr;
    800073c4:	08054a63          	bltz	a0,80007458 <_ZN5Buddy8merge_ipEP7mmeta_t+0x11c>
    if(budd_bi < bi){
    800073c8:	fc043703          	ld	a4,-64(s0)
    800073cc:	fc843783          	ld	a5,-56(s0)
    800073d0:	04f76a63          	bltu	a4,a5,80007424 <_ZN5Buddy8merge_ipEP7mmeta_t+0xe8>
    clr_bit(budd_bi);
    800073d4:	fc043583          	ld	a1,-64(s0)
    800073d8:	00090513          	mv	a0,s2
    800073dc:	00000097          	auipc	ra,0x0
    800073e0:	9dc080e7          	jalr	-1572(ra) # 80006db8 <_ZN5Buddy7clr_bitEm>
    set_bit(bi);
    800073e4:	fc843583          	ld	a1,-56(s0)
    800073e8:	00090513          	mv	a0,s2
    800073ec:	00000097          	auipc	ra,0x0
    800073f0:	990080e7          	jalr	-1648(ra) # 80006d7c <_ZN5Buddy7set_bitEm>
    chunk->level = chunk->level + 1;
    800073f4:	fa843503          	ld	a0,-88(s0)
    800073f8:	01054783          	lbu	a5,16(a0)
    800073fc:	0017879b          	addiw	a5,a5,1
    80007400:	00f50823          	sb	a5,16(a0)
}
    80007404:	05813083          	ld	ra,88(sp)
    80007408:	05013403          	ld	s0,80(sp)
    8000740c:	04813483          	ld	s1,72(sp)
    80007410:	04013903          	ld	s2,64(sp)
    80007414:	03813983          	ld	s3,56(sp)
    80007418:	03013a03          	ld	s4,48(sp)
    8000741c:	06010113          	addi	sp,sp,96
    80007420:	00008067          	ret
        swap(bi, budd_bi);
    80007424:	fc040593          	addi	a1,s0,-64
    80007428:	fc840513          	addi	a0,s0,-56
    8000742c:	00000097          	auipc	ra,0x0
    80007430:	150080e7          	jalr	336(ra) # 8000757c <_Z4swapImEvRT_S1_>
        swap(chunk, budd_addr);
    80007434:	fb840593          	addi	a1,s0,-72
    80007438:	fa840513          	addi	a0,s0,-88
    8000743c:	00000097          	auipc	ra,0x0
    80007440:	168080e7          	jalr	360(ra) # 800075a4 <_Z4swapIP7mmeta_tEvRT_S3_>
    80007444:	f91ff06f          	j	800073d4 <_ZN5Buddy8merge_ipEP7mmeta_t+0x98>
    if(!get_bit_val(bi)) return nullptr;
    80007448:	00000513          	li	a0,0
    8000744c:	fb9ff06f          	j	80007404 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>
    if(budd_addr->level != chunk->level) return nullptr;
    80007450:	00000513          	li	a0,0
    80007454:	fb1ff06f          	j	80007404 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>
    if(code < 0) return nullptr;
    80007458:	00000513          	li	a0,0
    8000745c:	fa9ff06f          	j	80007404 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>

0000000080007460 <_ZN5Buddy8mem_freeEPvh>:
    if(( (uint64)addr & (BLOCK_SIZE - 1) )
    80007460:	000017b7          	lui	a5,0x1
    80007464:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80007468:	00f5f7b3          	and	a5,a1,a5
    8000746c:	0e079463          	bnez	a5,80007554 <_ZN5Buddy8mem_freeEPvh+0xf4>
int Buddy::mem_free(void* addr, uchar level){
    80007470:	fd010113          	addi	sp,sp,-48
    80007474:	02113423          	sd	ra,40(sp)
    80007478:	02813023          	sd	s0,32(sp)
    8000747c:	00913c23          	sd	s1,24(sp)
    80007480:	01213823          	sd	s2,16(sp)
    80007484:	01313423          	sd	s3,8(sp)
    80007488:	01413023          	sd	s4,0(sp)
    8000748c:	03010413          	addi	s0,sp,48
    80007490:	00050913          	mv	s2,a0
    80007494:	00058493          	mv	s1,a1
    80007498:	00060a13          	mv	s4,a2
    || addr < start_address) return -1;
    8000749c:	00053703          	ld	a4,0(a0)
    800074a0:	0ae5ee63          	bltu	a1,a4,8000755c <_ZN5Buddy8mem_freeEPvh+0xfc>
    if(level > max_level) return -4;
    800074a4:	00853683          	ld	a3,8(a0)
    800074a8:	0ac6ee63          	bltu	a3,a2,80007564 <_ZN5Buddy8mem_freeEPvh+0x104>
    uint64 bind = BLOCK_IND(addr);
    800074ac:	40e589b3          	sub	s3,a1,a4
    800074b0:	0000d797          	auipc	a5,0xd
    800074b4:	ee07c783          	lbu	a5,-288(a5) # 80014390 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    800074b8:	00f9d9b3          	srl	s3,s3,a5
    if(bind >= (1ULL << max_level)) return -3;
    800074bc:	00100793          	li	a5,1
    800074c0:	00d797b3          	sll	a5,a5,a3
    800074c4:	0af9f463          	bgeu	s3,a5,8000756c <_ZN5Buddy8mem_freeEPvh+0x10c>
    if(get_bit_val(bind)) return -2;
    800074c8:	00098593          	mv	a1,s3
    800074cc:	fffff097          	auipc	ra,0xfffff
    800074d0:	48c080e7          	jalr	1164(ra) # 80006958 <_ZN5Buddy11get_bit_valEm>
    800074d4:	0a051063          	bnez	a0,80007574 <_ZN5Buddy8mem_freeEPvh+0x114>
    chunk->level = level;
    800074d8:	01448823          	sb	s4,16(s1)
    chunk->prev = chunk->next = nullptr;
    800074dc:	0004b023          	sd	zero,0(s1)
    800074e0:	0004b423          	sd	zero,8(s1)
    set_bit(bind);
    800074e4:	00098593          	mv	a1,s3
    800074e8:	00090513          	mv	a0,s2
    800074ec:	00000097          	auipc	ra,0x0
    800074f0:	890080e7          	jalr	-1904(ra) # 80006d7c <_ZN5Buddy7set_bitEm>
    800074f4:	0080006f          	j	800074fc <_ZN5Buddy8mem_freeEPvh+0x9c>
            chunk = maddr;
    800074f8:	00050493          	mv	s1,a0
    while(chunk->level < max_level){
    800074fc:	0104c703          	lbu	a4,16(s1)
    80007500:	00893783          	ld	a5,8(s2)
    80007504:	00f77c63          	bgeu	a4,a5,8000751c <_ZN5Buddy8mem_freeEPvh+0xbc>
        mmeta_t* maddr = merge_ip(chunk);
    80007508:	00048593          	mv	a1,s1
    8000750c:	00090513          	mv	a0,s2
    80007510:	00000097          	auipc	ra,0x0
    80007514:	e2c080e7          	jalr	-468(ra) # 8000733c <_ZN5Buddy8merge_ipEP7mmeta_t>
        if(maddr)
    80007518:	fe0510e3          	bnez	a0,800074f8 <_ZN5Buddy8mem_freeEPvh+0x98>
    add_to_list(chunk->level, chunk);
    8000751c:	00048613          	mv	a2,s1
    80007520:	0104c583          	lbu	a1,16(s1)
    80007524:	00090513          	mv	a0,s2
    80007528:	fffff097          	auipc	ra,0xfffff
    8000752c:	464080e7          	jalr	1124(ra) # 8000698c <_ZN5Buddy11add_to_listEhP7mmeta_t>
    return 0;
    80007530:	00000513          	li	a0,0
}
    80007534:	02813083          	ld	ra,40(sp)
    80007538:	02013403          	ld	s0,32(sp)
    8000753c:	01813483          	ld	s1,24(sp)
    80007540:	01013903          	ld	s2,16(sp)
    80007544:	00813983          	ld	s3,8(sp)
    80007548:	00013a03          	ld	s4,0(sp)
    8000754c:	03010113          	addi	sp,sp,48
    80007550:	00008067          	ret
    || addr < start_address) return -1;
    80007554:	fff00513          	li	a0,-1
}
    80007558:	00008067          	ret
    || addr < start_address) return -1;
    8000755c:	fff00513          	li	a0,-1
    80007560:	fd5ff06f          	j	80007534 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(level > max_level) return -4;
    80007564:	ffc00513          	li	a0,-4
    80007568:	fcdff06f          	j	80007534 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(bind >= (1ULL << max_level)) return -3;
    8000756c:	ffd00513          	li	a0,-3
    80007570:	fc5ff06f          	j	80007534 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(get_bit_val(bind)) return -2;
    80007574:	ffe00513          	li	a0,-2
    80007578:	fbdff06f          	j	80007534 <_ZN5Buddy8mem_freeEPvh+0xd4>

000000008000757c <_Z4swapImEvRT_S1_>:
/* one or less set bits */
bool osb(uint64);

/* classic swap */
template<typename T>
void swap(T& a, T& b){
    8000757c:	ff010113          	addi	sp,sp,-16
    80007580:	00813423          	sd	s0,8(sp)
    80007584:	01010413          	addi	s0,sp,16
    T x = a;
    80007588:	00053783          	ld	a5,0(a0)
    a = b;
    8000758c:	0005b703          	ld	a4,0(a1)
    80007590:	00e53023          	sd	a4,0(a0)
    b = x;
    80007594:	00f5b023          	sd	a5,0(a1)
}
    80007598:	00813403          	ld	s0,8(sp)
    8000759c:	01010113          	addi	sp,sp,16
    800075a0:	00008067          	ret

00000000800075a4 <_Z4swapIP7mmeta_tEvRT_S3_>:
void swap(T& a, T& b){
    800075a4:	ff010113          	addi	sp,sp,-16
    800075a8:	00813423          	sd	s0,8(sp)
    800075ac:	01010413          	addi	s0,sp,16
    T x = a;
    800075b0:	00053783          	ld	a5,0(a0)
    a = b;
    800075b4:	0005b703          	ld	a4,0(a1)
    800075b8:	00e53023          	sd	a4,0(a0)
    b = x;
    800075bc:	00f5b023          	sd	a5,0(a1)
}
    800075c0:	00813403          	ld	s0,8(sp)
    800075c4:	01010113          	addi	sp,sp,16
    800075c8:	00008067          	ret

00000000800075cc <_ZN15MemoryAllocator11getInstanceEv>:
#include"../../../h/kernel_lib.h"

MemoryAllocator* MemoryAllocator::allocator = nullptr;

MemoryAllocator& MemoryAllocator::getInstance(){
    if(!allocator){
    800075cc:	0000d797          	auipc	a5,0xd
    800075d0:	dd478793          	addi	a5,a5,-556 # 800143a0 <_ZN15MemoryAllocator9allocatorE>
    800075d4:	0007b783          	ld	a5,0(a5)
    800075d8:	00078a63          	beqz	a5,800075ec <_ZN15MemoryAllocator11getInstanceEv+0x20>
        KVALCHECKPRINT("MemoryAllocator start address: ", start_addr);
        allocator->fmem_head->addr = (void*) start_addr;
        allocator->fmem_head->size = ((size_t)HEAP_END_ADDR - start_addr);
        allocator->init = true;
    }
    return *allocator;
    800075dc:	0000d797          	auipc	a5,0xd
    800075e0:	dc478793          	addi	a5,a5,-572 # 800143a0 <_ZN15MemoryAllocator9allocatorE>
    800075e4:	0007b503          	ld	a0,0(a5)
}
    800075e8:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance(){
    800075ec:	fe010113          	addi	sp,sp,-32
    800075f0:	00113c23          	sd	ra,24(sp)
    800075f4:	00813823          	sd	s0,16(sp)
    800075f8:	00913423          	sd	s1,8(sp)
    800075fc:	01213023          	sd	s2,0(sp)
    80007600:	02010413          	addi	s0,sp,32
        allocator = (MemoryAllocator*)SlabAllocator::getInstance().kmalloc(sizeof(MemoryAllocator));
    80007604:	00002097          	auipc	ra,0x2
    80007608:	b38080e7          	jalr	-1224(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000760c:	02000593          	li	a1,32
    80007610:	00002097          	auipc	ra,0x2
    80007614:	c2c080e7          	jalr	-980(ra) # 8000923c <_ZN13SlabAllocator7kmallocEm>
    80007618:	0000d797          	auipc	a5,0xd
    8000761c:	d8a7b423          	sd	a0,-632(a5) # 800143a0 <_ZN15MemoryAllocator9allocatorE>
        allocator->node_cache = new ObjectCache("free_seg_meta_cache", sizeof(FreeSegment), 0, 0);
    80007620:	05800513          	li	a0,88
    80007624:	00001097          	auipc	ra,0x1
    80007628:	154080e7          	jalr	340(ra) # 80008778 <_ZN11ObjectCachenwEm>
    8000762c:	00050493          	mv	s1,a0
    80007630:	00000793          	li	a5,0
    80007634:	00000713          	li	a4,0
    80007638:	00000693          	li	a3,0
    8000763c:	01800613          	li	a2,24
    80007640:	00007597          	auipc	a1,0x7
    80007644:	f8058593          	addi	a1,a1,-128 # 8000e5c0 <CONSOLE_STATUS+0x5b0>
    80007648:	00001097          	auipc	ra,0x1
    8000764c:	914080e7          	jalr	-1772(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80007650:	0000d797          	auipc	a5,0xd
    80007654:	d5078793          	addi	a5,a5,-688 # 800143a0 <_ZN15MemoryAllocator9allocatorE>
    80007658:	0007b903          	ld	s2,0(a5)
    8000765c:	00993c23          	sd	s1,24(s2)
        if(!allocator->node_cache){ kprintString("MEM ALLOC node cache not allocated\n"); while(1); }
    80007660:	0c048863          	beqz	s1,80007730 <_ZN15MemoryAllocator11getInstanceEv+0x164>
        allocator->fall_head = nullptr;
    80007664:	00093823          	sd	zero,16(s2)
        allocator->fmem_head = (FreeSegment*)allocator->node_cache->alloc_obj();
    80007668:	00048513          	mv	a0,s1
    8000766c:	00001097          	auipc	ra,0x1
    80007670:	068080e7          	jalr	104(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    80007674:	00a93423          	sd	a0,8(s2)
        allocator->fmem_head->next = nullptr;
    80007678:	0000d917          	auipc	s2,0xd
    8000767c:	d2890913          	addi	s2,s2,-728 # 800143a0 <_ZN15MemoryAllocator9allocatorE>
    80007680:	00093783          	ld	a5,0(s2)
    80007684:	0087b783          	ld	a5,8(a5)
    80007688:	0007b023          	sd	zero,0(a5)
    8000768c:	0000d797          	auipc	a5,0xd
    80007690:	d2478793          	addi	a5,a5,-732 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007694:	0007b483          	ld	s1,0(a5)
        size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    80007698:	fff48493          	addi	s1,s1,-1
    8000769c:	fffff7b7          	lui	a5,0xfffff
    800076a0:	00f4f4b3          	and	s1,s1,a5
    800076a4:	000017b7          	lui	a5,0x1
    800076a8:	00f484b3          	add	s1,s1,a5
        KVALCHECKPRINT("MemoryAllocator start address: ", start_addr);
    800076ac:	00007517          	auipc	a0,0x7
    800076b0:	f5450513          	addi	a0,a0,-172 # 8000e600 <CONSOLE_STATUS+0x5f0>
    800076b4:	ffffe097          	auipc	ra,0xffffe
    800076b8:	a30080e7          	jalr	-1488(ra) # 800050e4 <_Z12kprintStringPKc>
    800076bc:	00000613          	li	a2,0
    800076c0:	01000593          	li	a1,16
    800076c4:	00048513          	mv	a0,s1
    800076c8:	ffffe097          	auipc	ra,0xffffe
    800076cc:	a64080e7          	jalr	-1436(ra) # 8000512c <_Z9kprintIntmib>
    800076d0:	00007517          	auipc	a0,0x7
    800076d4:	c8850513          	addi	a0,a0,-888 # 8000e358 <CONSOLE_STATUS+0x348>
    800076d8:	ffffe097          	auipc	ra,0xffffe
    800076dc:	a0c080e7          	jalr	-1524(ra) # 800050e4 <_Z12kprintStringPKc>
        allocator->fmem_head->addr = (void*) start_addr;
    800076e0:	00093783          	ld	a5,0(s2)
    800076e4:	0087b703          	ld	a4,8(a5) # 1008 <_entry-0x7fffeff8>
    800076e8:	00973823          	sd	s1,16(a4)
        allocator->fmem_head->size = ((size_t)HEAP_END_ADDR - start_addr);
    800076ec:	0087b683          	ld	a3,8(a5)
    800076f0:	0000b717          	auipc	a4,0xb
    800076f4:	2c870713          	addi	a4,a4,712 # 800129b8 <HEAP_END_ADDR>
    800076f8:	00073703          	ld	a4,0(a4)
    800076fc:	409704b3          	sub	s1,a4,s1
    80007700:	0096b423          	sd	s1,8(a3)
        allocator->init = true;
    80007704:	00100713          	li	a4,1
    80007708:	00e78023          	sb	a4,0(a5)
    return *allocator;
    8000770c:	0000d797          	auipc	a5,0xd
    80007710:	c9478793          	addi	a5,a5,-876 # 800143a0 <_ZN15MemoryAllocator9allocatorE>
    80007714:	0007b503          	ld	a0,0(a5)
}
    80007718:	01813083          	ld	ra,24(sp)
    8000771c:	01013403          	ld	s0,16(sp)
    80007720:	00813483          	ld	s1,8(sp)
    80007724:	00013903          	ld	s2,0(sp)
    80007728:	02010113          	addi	sp,sp,32
    8000772c:	00008067          	ret
        if(!allocator->node_cache){ kprintString("MEM ALLOC node cache not allocated\n"); while(1); }
    80007730:	00007517          	auipc	a0,0x7
    80007734:	ea850513          	addi	a0,a0,-344 # 8000e5d8 <CONSOLE_STATUS+0x5c8>
    80007738:	ffffe097          	auipc	ra,0xffffe
    8000773c:	9ac080e7          	jalr	-1620(ra) # 800050e4 <_Z12kprintStringPKc>
    80007740:	0000006f          	j	80007740 <_ZN15MemoryAllocator11getInstanceEv+0x174>
    80007744:	00050913          	mv	s2,a0
        allocator->node_cache = new ObjectCache("free_seg_meta_cache", sizeof(FreeSegment), 0, 0);
    80007748:	00048513          	mv	a0,s1
    8000774c:	00001097          	auipc	ra,0x1
    80007750:	18c080e7          	jalr	396(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    80007754:	00090513          	mv	a0,s2
    80007758:	0000e097          	auipc	ra,0xe
    8000775c:	df0080e7          	jalr	-528(ra) # 80015548 <_Unwind_Resume>

0000000080007760 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    80007760:	fd010113          	addi	sp,sp,-48
    80007764:	02113423          	sd	ra,40(sp)
    80007768:	02813023          	sd	s0,32(sp)
    8000776c:	00913c23          	sd	s1,24(sp)
    80007770:	01213823          	sd	s2,16(sp)
    80007774:	01313423          	sd	s3,8(sp)
    80007778:	01413023          	sd	s4,0(sp)
    8000777c:	03010413          	addi	s0,sp,48
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80007780:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    80007784:	00659913          	slli	s2,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80007788:	00000693          	li	a3,0
    8000778c:	00000a13          	li	s4,0
    80007790:	00000493          	li	s1,0
    80007794:	0140006f          	j	800077a8 <_ZN15MemoryAllocator9mem_allocEm+0x48>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    80007798:	00068a13          	mv	s4,a3
                best = curr;     
    8000779c:	00078493          	mv	s1,a5
            }
        prev = curr;
    800077a0:	00078693          	mv	a3,a5
        curr = curr->next;
    800077a4:	0007b783          	ld	a5,0(a5)
    while(curr){
    800077a8:	02078263          	beqz	a5,800077cc <_ZN15MemoryAllocator9mem_allocEm+0x6c>
        if(curr->size >= size)
    800077ac:	0087b703          	ld	a4,8(a5)
    800077b0:	ff2768e3          	bltu	a4,s2,800077a0 <_ZN15MemoryAllocator9mem_allocEm+0x40>
            if (!best || (curr->size < best->size)){
    800077b4:	fe0482e3          	beqz	s1,80007798 <_ZN15MemoryAllocator9mem_allocEm+0x38>
    800077b8:	0084b603          	ld	a2,8(s1)
    800077bc:	fec772e3          	bgeu	a4,a2,800077a0 <_ZN15MemoryAllocator9mem_allocEm+0x40>
                best_prev = prev;
    800077c0:	00068a13          	mv	s4,a3
                best = curr;     
    800077c4:	00078493          	mv	s1,a5
    800077c8:	fd9ff06f          	j	800077a0 <_ZN15MemoryAllocator9mem_allocEm+0x40>
    } 
    if(!best)
    800077cc:	02048663          	beqz	s1,800077f8 <_ZN15MemoryAllocator9mem_allocEm+0x98>
    800077d0:	00050993          	mv	s3,a0
    //     curr->size = best->size - size - sizeof(FreeSegment);
    //     best->size = size;
    //     if(best_prev) best_prev->next = curr;
    //     else fmem_head = curr;
    // }
    if(best->size != size){
    800077d4:	0084b783          	ld	a5,8(s1)
    800077d8:	05279263          	bne	a5,s2,8000781c <_ZN15MemoryAllocator9mem_allocEm+0xbc>
        curr->next = best->next;
        curr->size = best->size - size;
        curr->addr = (char*)best->addr + size;
        best->size = size;
    }
    else { curr = best->next; }
    800077dc:	0004b503          	ld	a0,0(s1)

    if(!best_prev) fmem_head = curr;
    800077e0:	060a0863          	beqz	s4,80007850 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
    else best_prev->next = curr;
    800077e4:	00aa3023          	sd	a0,0(s4)
    
    best->next = fall_head;
    800077e8:	0109b783          	ld	a5,16(s3)
    800077ec:	00f4b023          	sd	a5,0(s1)
    fall_head = best;
    800077f0:	0099b823          	sd	s1,16(s3)
    // return (char*)best+sizeof(FreeSegment);
    // print_all_list();
    // print_list();
    return best->addr;
    800077f4:	0104b483          	ld	s1,16(s1)
}
    800077f8:	00048513          	mv	a0,s1
    800077fc:	02813083          	ld	ra,40(sp)
    80007800:	02013403          	ld	s0,32(sp)
    80007804:	01813483          	ld	s1,24(sp)
    80007808:	01013903          	ld	s2,16(sp)
    8000780c:	00813983          	ld	s3,8(sp)
    80007810:	00013a03          	ld	s4,0(sp)
    80007814:	03010113          	addi	sp,sp,48
    80007818:	00008067          	ret
        curr = (FreeSegment*)node_cache->alloc_obj();
    8000781c:	01853503          	ld	a0,24(a0)
    80007820:	00001097          	auipc	ra,0x1
    80007824:	eb4080e7          	jalr	-332(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
        curr->next = best->next;
    80007828:	0004b783          	ld	a5,0(s1)
    8000782c:	00f53023          	sd	a5,0(a0)
        curr->size = best->size - size;
    80007830:	0084b783          	ld	a5,8(s1)
    80007834:	412787b3          	sub	a5,a5,s2
    80007838:	00f53423          	sd	a5,8(a0)
        curr->addr = (char*)best->addr + size;
    8000783c:	0104b783          	ld	a5,16(s1)
    80007840:	012787b3          	add	a5,a5,s2
    80007844:	00f53823          	sd	a5,16(a0)
        best->size = size;
    80007848:	0124b423          	sd	s2,8(s1)
    8000784c:	f95ff06f          	j	800077e0 <_ZN15MemoryAllocator9mem_allocEm+0x80>
    if(!best_prev) fmem_head = curr;
    80007850:	00a9b423          	sd	a0,8(s3)
    80007854:	f95ff06f          	j	800077e8 <_ZN15MemoryAllocator9mem_allocEm+0x88>

0000000080007858 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    80007858:	ff010113          	addi	sp,sp,-16
    8000785c:	00813423          	sd	s0,8(sp)
    80007860:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80007864:	0000b797          	auipc	a5,0xb
    80007868:	15c78793          	addi	a5,a5,348 # 800129c0 <HEAP_START_ADDR>
    8000786c:	0007b783          	ld	a5,0(a5)
    80007870:	04f5ee63          	bltu	a1,a5,800078cc <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80007874:	0000b797          	auipc	a5,0xb
    80007878:	14478793          	addi	a5,a5,324 # 800129b8 <HEAP_END_ADDR>
    8000787c:	0007b783          	ld	a5,0(a5)
    80007880:	04f5fe63          	bgeu	a1,a5,800078dc <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    80007884:	01053783          	ld	a5,16(a0)
    80007888:	00000693          	li	a3,0
    while(cur)
    8000788c:	00078c63          	beqz	a5,800078a4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
    80007890:	0107b703          	ld	a4,16(a5)
    80007894:	00b70863          	beq	a4,a1,800078a4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;    
        prev = cur;
    80007898:	00078693          	mv	a3,a5
        cur = cur->next;
    8000789c:	0007b783          	ld	a5,0(a5)
    while(cur)
    800078a0:	fedff06f          	j	8000788c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    800078a4:	04078063          	beqz	a5,800078e4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    800078a8:	00068c63          	beqz	a3,800078c0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    800078ac:	0007b703          	ld	a4,0(a5)
    800078b0:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    800078b4:	0007b023          	sd	zero,0(a5)
        return false;
    800078b8:	00000513          	li	a0,0
    800078bc:	0140006f          	j	800078d0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    800078c0:	0007b703          	ld	a4,0(a5)
    800078c4:	00e53823          	sd	a4,16(a0)
    800078c8:	fedff06f          	j	800078b4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    800078cc:	00100513          	li	a0,1
    }
    else return true;
}
    800078d0:	00813403          	ld	s0,8(sp)
    800078d4:	01010113          	addi	sp,sp,16
    800078d8:	00008067          	ret
        return true;
    800078dc:	00100513          	li	a0,1
    800078e0:	ff1ff06f          	j	800078d0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    800078e4:	00100513          	li	a0,1
    800078e8:	fe9ff06f          	j	800078d0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

00000000800078ec <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv>:

FreeSegment* MemoryAllocator::getAndRemoveFreeSegmentMeta(void* adr){
    800078ec:	ff010113          	addi	sp,sp,-16
    800078f0:	00813423          	sd	s0,8(sp)
    800078f4:	01010413          	addi	s0,sp,16
    800078f8:	0000d797          	auipc	a5,0xd
    800078fc:	ab878793          	addi	a5,a5,-1352 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007900:	0007b783          	ld	a5,0(a5)
    size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    80007904:	fff78793          	addi	a5,a5,-1
    80007908:	fffff737          	lui	a4,0xfffff
    8000790c:	00e7f7b3          	and	a5,a5,a4
    80007910:	00001737          	lui	a4,0x1
    80007914:	00e787b3          	add	a5,a5,a4
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
    80007918:	06f5e263          	bltu	a1,a5,8000797c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x90>
    8000791c:	0000b797          	auipc	a5,0xb
    80007920:	09c78793          	addi	a5,a5,156 # 800129b8 <HEAP_END_ADDR>
    80007924:	0007b783          	ld	a5,0(a5)
    80007928:	04f5fe63          	bgeu	a1,a5,80007984 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x98>
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    8000792c:	01053783          	ld	a5,16(a0)
    80007930:	00000693          	li	a3,0
    while(cur)
    80007934:	00078c63          	beqz	a5,8000794c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x60>
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
    80007938:	0107b703          	ld	a4,16(a5)
    8000793c:	00b70863          	beq	a4,a1,8000794c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x60>
            break;    
        prev = cur;
    80007940:	00078693          	mv	a3,a5
        cur = cur->next;
    80007944:	0007b783          	ld	a5,0(a5)
    while(cur)
    80007948:	fedff06f          	j	80007934 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x48>
    }
    if(cur)
    8000794c:	00078a63          	beqz	a5,80007960 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>
    {
        if(prev)
    80007950:	02068063          	beqz	a3,80007970 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x84>
            prev->next = cur->next;
    80007954:	0007b703          	ld	a4,0(a5)
    80007958:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    8000795c:	0007b023          	sd	zero,0(a5)
        return cur;
    }
    else return nullptr;
}
    80007960:	00078513          	mv	a0,a5
    80007964:	00813403          	ld	s0,8(sp)
    80007968:	01010113          	addi	sp,sp,16
    8000796c:	00008067          	ret
            fall_head = cur->next;
    80007970:	0007b703          	ld	a4,0(a5)
    80007974:	00e53823          	sd	a4,16(a0)
    80007978:	fe5ff06f          	j	8000795c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x70>
        return nullptr;
    8000797c:	00000793          	li	a5,0
    80007980:	fe1ff06f          	j	80007960 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>
    80007984:	00000793          	li	a5,0
    80007988:	fd9ff06f          	j	80007960 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>

000000008000798c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:
    // if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    //     t->size += t->next->size + sizeof(FreeSegment);
    //     t->next = t->next->next;
    //     return t;
    // }
    if((char*)t->addr + t->size == (char*)t->next->addr){
    8000798c:	0105b783          	ld	a5,16(a1)
    80007990:	0085b683          	ld	a3,8(a1)
    80007994:	00d787b3          	add	a5,a5,a3
    80007998:	0005b703          	ld	a4,0(a1)
    8000799c:	01073603          	ld	a2,16(a4) # 1010 <_entry-0x7fffeff0>
    800079a0:	00c78663          	beq	a5,a2,800079ac <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>
        t->next = t->next->next;
        node_cache->free_obj(old);
        return t;
    }
    return t->next;
}
    800079a4:	00070513          	mv	a0,a4
    800079a8:	00008067          	ret
FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    800079ac:	fe010113          	addi	sp,sp,-32
    800079b0:	00113c23          	sd	ra,24(sp)
    800079b4:	00813823          	sd	s0,16(sp)
    800079b8:	00913423          	sd	s1,8(sp)
    800079bc:	02010413          	addi	s0,sp,32
    800079c0:	00058493          	mv	s1,a1
        t->size += t->next->size;
    800079c4:	00873783          	ld	a5,8(a4)
    800079c8:	00f686b3          	add	a3,a3,a5
    800079cc:	00d5b423          	sd	a3,8(a1)
        t->next = t->next->next;
    800079d0:	00073783          	ld	a5,0(a4)
    800079d4:	00f5b023          	sd	a5,0(a1)
        node_cache->free_obj(old);
    800079d8:	00070593          	mv	a1,a4
    800079dc:	01853503          	ld	a0,24(a0)
    800079e0:	00001097          	auipc	ra,0x1
    800079e4:	dc8080e7          	jalr	-568(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
}
    800079e8:	00048513          	mv	a0,s1
    800079ec:	01813083          	ld	ra,24(sp)
    800079f0:	01013403          	ld	s0,16(sp)
    800079f4:	00813483          	ld	s1,8(sp)
    800079f8:	02010113          	addi	sp,sp,32
    800079fc:	00008067          	ret

0000000080007a00 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80007a00:	fc010113          	addi	sp,sp,-64
    80007a04:	02113c23          	sd	ra,56(sp)
    80007a08:	02813823          	sd	s0,48(sp)
    80007a0c:	02913423          	sd	s1,40(sp)
    80007a10:	03213023          	sd	s2,32(sp)
    80007a14:	01313c23          	sd	s3,24(sp)
    80007a18:	01413823          	sd	s4,16(sp)
    80007a1c:	04010413          	addi	s0,sp,64
    80007a20:	00050a13          	mv	s4,a0
    80007a24:	00058913          	mv	s2,a1
    // if(wantToFreeAddress(adr)) return -1;
    FreeSegment* newsgm = getAndRemoveFreeSegmentMeta(adr);
    80007a28:	00000097          	auipc	ra,0x0
    80007a2c:	ec4080e7          	jalr	-316(ra) # 800078ec <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv>
    if(!newsgm){
    80007a30:	00050c63          	beqz	a0,80007a48 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
    80007a34:	00050993          	mv	s3,a0
        KCHECKPRINT(adr);
        KCHECKPRINT(Riscv::r_sepc());
        return -1;
    }
    
    if(!fmem_head)
    80007a38:	008a3783          	ld	a5,8(s4)
    80007a3c:	08078a63          	beqz	a5,80007ad0 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        // fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
        fmem_head = newsgm;
    else{
        FreeSegment/* * newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)),*/ *prev,* cur;
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80007a40:	00000493          	li	s1,0
    80007a44:	0a80006f          	j	80007aec <_ZN15MemoryAllocator8mem_freeEPv+0xec>
        kprintString("MEM_ALLOC_FREEE GRESKA\n"); 
    80007a48:	00007517          	auipc	a0,0x7
    80007a4c:	be050513          	addi	a0,a0,-1056 # 8000e628 <CONSOLE_STATUS+0x618>
    80007a50:	ffffd097          	auipc	ra,0xffffd
    80007a54:	694080e7          	jalr	1684(ra) # 800050e4 <_Z12kprintStringPKc>
        KCHECKPRINT(adr);
    80007a58:	00007517          	auipc	a0,0x7
    80007a5c:	be850513          	addi	a0,a0,-1048 # 8000e640 <CONSOLE_STATUS+0x630>
    80007a60:	ffffd097          	auipc	ra,0xffffd
    80007a64:	684080e7          	jalr	1668(ra) # 800050e4 <_Z12kprintStringPKc>
    80007a68:	00000613          	li	a2,0
    80007a6c:	01000593          	li	a1,16
    80007a70:	00090513          	mv	a0,s2
    80007a74:	ffffd097          	auipc	ra,0xffffd
    80007a78:	6b8080e7          	jalr	1720(ra) # 8000512c <_Z9kprintIntmib>
    80007a7c:	00007517          	auipc	a0,0x7
    80007a80:	8dc50513          	addi	a0,a0,-1828 # 8000e358 <CONSOLE_STATUS+0x348>
    80007a84:	ffffd097          	auipc	ra,0xffffd
    80007a88:	660080e7          	jalr	1632(ra) # 800050e4 <_Z12kprintStringPKc>
        KCHECKPRINT(Riscv::r_sepc());
    80007a8c:	00007517          	auipc	a0,0x7
    80007a90:	bbc50513          	addi	a0,a0,-1092 # 8000e648 <CONSOLE_STATUS+0x638>
    80007a94:	ffffd097          	auipc	ra,0xffffd
    80007a98:	650080e7          	jalr	1616(ra) # 800050e4 <_Z12kprintStringPKc>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
}

inline uint64 Riscv::r_sepc(){
    uint64 volatile sepc;
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80007a9c:	141027f3          	csrr	a5,sepc
    80007aa0:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80007aa4:	fc843503          	ld	a0,-56(s0)
    80007aa8:	00000613          	li	a2,0
    80007aac:	01000593          	li	a1,16
    80007ab0:	ffffd097          	auipc	ra,0xffffd
    80007ab4:	67c080e7          	jalr	1660(ra) # 8000512c <_Z9kprintIntmib>
    80007ab8:	00007517          	auipc	a0,0x7
    80007abc:	8a050513          	addi	a0,a0,-1888 # 8000e358 <CONSOLE_STATUS+0x348>
    80007ac0:	ffffd097          	auipc	ra,0xffffd
    80007ac4:	624080e7          	jalr	1572(ra) # 800050e4 <_Z12kprintStringPKc>
        return -1;
    80007ac8:	fff00513          	li	a0,-1
    80007acc:	0680006f          	j	80007b34 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
        fmem_head = newsgm;
    80007ad0:	00aa3423          	sd	a0,8(s4)
        else
            fmem_head = newsgm;
    }
    // print_all_list();
    // print_list();
    return 0;
    80007ad4:	00000513          	li	a0,0
    80007ad8:	05c0006f          	j	80007b34 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
            if((!prev || (size_t)adr > (size_t)prev->addr) && (size_t)adr < (size_t)cur->addr)
    80007adc:	0107b703          	ld	a4,16(a5)
    80007ae0:	02e96063          	bltu	s2,a4,80007b00 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80007ae4:	00078493          	mv	s1,a5
    80007ae8:	0007b783          	ld	a5,0(a5)
    80007aec:	00078a63          	beqz	a5,80007b00 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
            if((!prev || (size_t)adr > (size_t)prev->addr) && (size_t)adr < (size_t)cur->addr)
    80007af0:	fe0486e3          	beqz	s1,80007adc <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    80007af4:	0104b703          	ld	a4,16(s1)
    80007af8:	ff2776e3          	bgeu	a4,s2,80007ae4 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
    80007afc:	fe1ff06f          	j	80007adc <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        newsgm->next = cur;
    80007b00:	00f9b023          	sd	a5,0(s3)
        if(cur)
    80007b04:	00078a63          	beqz	a5,80007b18 <_ZN15MemoryAllocator8mem_freeEPv+0x118>
            mergeWithNext(newsgm);
    80007b08:	00098593          	mv	a1,s3
    80007b0c:	000a0513          	mv	a0,s4
    80007b10:	00000097          	auipc	ra,0x0
    80007b14:	e7c080e7          	jalr	-388(ra) # 8000798c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80007b18:	02048e63          	beqz	s1,80007b54 <_ZN15MemoryAllocator8mem_freeEPv+0x154>
            prev->next = newsgm;
    80007b1c:	0134b023          	sd	s3,0(s1)
            mergeWithNext(prev);
    80007b20:	00048593          	mv	a1,s1
    80007b24:	000a0513          	mv	a0,s4
    80007b28:	00000097          	auipc	ra,0x0
    80007b2c:	e64080e7          	jalr	-412(ra) # 8000798c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
    return 0;
    80007b30:	00000513          	li	a0,0
}
    80007b34:	03813083          	ld	ra,56(sp)
    80007b38:	03013403          	ld	s0,48(sp)
    80007b3c:	02813483          	ld	s1,40(sp)
    80007b40:	02013903          	ld	s2,32(sp)
    80007b44:	01813983          	ld	s3,24(sp)
    80007b48:	01013a03          	ld	s4,16(sp)
    80007b4c:	04010113          	addi	sp,sp,64
    80007b50:	00008067          	ret
            fmem_head = newsgm;
    80007b54:	013a3423          	sd	s3,8(s4)
    return 0;
    80007b58:	00000513          	li	a0,0
    80007b5c:	fd9ff06f          	j	80007b34 <_ZN15MemoryAllocator8mem_freeEPv+0x134>

0000000080007b60 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv>:

FreeSegment* MemoryAllocator::getFreeSegmentMeta(void* adr){
    80007b60:	ff010113          	addi	sp,sp,-16
    80007b64:	00813423          	sd	s0,8(sp)
    80007b68:	01010413          	addi	s0,sp,16
    80007b6c:	0000d797          	auipc	a5,0xd
    80007b70:	84478793          	addi	a5,a5,-1980 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007b74:	0007b783          	ld	a5,0(a5)
   size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    80007b78:	fff78793          	addi	a5,a5,-1
    80007b7c:	fffff737          	lui	a4,0xfffff
    80007b80:	00e7f7b3          	and	a5,a5,a4
    80007b84:	00001737          	lui	a4,0x1
    80007b88:	00e787b3          	add	a5,a5,a4
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
    80007b8c:	04f5e263          	bltu	a1,a5,80007bd0 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x70>
    80007b90:	0000b797          	auipc	a5,0xb
    80007b94:	e2878793          	addi	a5,a5,-472 # 800129b8 <HEAP_END_ADDR>
    80007b98:	0007b783          	ld	a5,0(a5)
    80007b9c:	02f5fe63          	bgeu	a1,a5,80007bd8 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x78>
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment *cur = fall_head;
    80007ba0:	01053503          	ld	a0,16(a0)
    80007ba4:	0080006f          	j	80007bac <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x4c>
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t >= (size_t)cur->addr && t < (size_t)cur->addr + cur->size)
            break;    
        
        cur = cur->next;
    80007ba8:	00053503          	ld	a0,0(a0)
    while(cur)
    80007bac:	00050c63          	beqz	a0,80007bc4 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>
        if(t >= (size_t)cur->addr && t < (size_t)cur->addr + cur->size)
    80007bb0:	01053783          	ld	a5,16(a0)
    80007bb4:	fef5eae3          	bltu	a1,a5,80007ba8 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x48>
    80007bb8:	00853703          	ld	a4,8(a0)
    80007bbc:	00e787b3          	add	a5,a5,a4
    80007bc0:	fef5f4e3          	bgeu	a1,a5,80007ba8 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x48>
    }
    if(cur)
        return cur;
    else return nullptr;
}
    80007bc4:	00813403          	ld	s0,8(sp)
    80007bc8:	01010113          	addi	sp,sp,16
    80007bcc:	00008067          	ret
        return nullptr;
    80007bd0:	00000513          	li	a0,0
    80007bd4:	ff1ff06f          	j	80007bc4 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>
    80007bd8:	00000513          	li	a0,0
    80007bdc:	fe9ff06f          	j	80007bc4 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>

0000000080007be0 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80007be0:	fe010113          	addi	sp,sp,-32
    80007be4:	00113c23          	sd	ra,24(sp)
    80007be8:	00813823          	sd	s0,16(sp)
    80007bec:	00913423          	sd	s1,8(sp)
    80007bf0:	02010413          	addi	s0,sp,32
    80007bf4:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    80007bf8:	00007517          	auipc	a0,0x7
    80007bfc:	a6850513          	addi	a0,a0,-1432 # 8000e660 <CONSOLE_STATUS+0x650>
    80007c00:	ffffd097          	auipc	ra,0xffffd
    80007c04:	4e4080e7          	jalr	1252(ra) # 800050e4 <_Z12kprintStringPKc>
    if(!fmem_head)
    80007c08:	0084b783          	ld	a5,8(s1)
    80007c0c:	08078063          	beqz	a5,80007c8c <_ZN15MemoryAllocator10print_listEv+0xac>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80007c10:	0084b483          	ld	s1,8(s1)
    80007c14:	08048663          	beqz	s1,80007ca0 <_ZN15MemoryAllocator10print_listEv+0xc0>
        kprintInt((uint64)curr, 16);
    80007c18:	00000613          	li	a2,0
    80007c1c:	01000593          	li	a1,16
    80007c20:	00048513          	mv	a0,s1
    80007c24:	ffffd097          	auipc	ra,0xffffd
    80007c28:	508080e7          	jalr	1288(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007c2c:	00006517          	auipc	a0,0x6
    80007c30:	72c50513          	addi	a0,a0,1836 # 8000e358 <CONSOLE_STATUS+0x348>
    80007c34:	ffffd097          	auipc	ra,0xffffd
    80007c38:	4b0080e7          	jalr	1200(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size, 16);
    80007c3c:	00000613          	li	a2,0
    80007c40:	01000593          	li	a1,16
    80007c44:	0084b503          	ld	a0,8(s1)
    80007c48:	ffffd097          	auipc	ra,0xffffd
    80007c4c:	4e4080e7          	jalr	1252(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007c50:	00006517          	auipc	a0,0x6
    80007c54:	70850513          	addi	a0,a0,1800 # 8000e358 <CONSOLE_STATUS+0x348>
    80007c58:	ffffd097          	auipc	ra,0xffffd
    80007c5c:	48c080e7          	jalr	1164(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->addr, 16);
    80007c60:	00000613          	li	a2,0
    80007c64:	01000593          	li	a1,16
    80007c68:	0104b503          	ld	a0,16(s1)
    80007c6c:	ffffd097          	auipc	ra,0xffffd
    80007c70:	4c0080e7          	jalr	1216(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007c74:	00006517          	auipc	a0,0x6
    80007c78:	6e450513          	addi	a0,a0,1764 # 8000e358 <CONSOLE_STATUS+0x348>
    80007c7c:	ffffd097          	auipc	ra,0xffffd
    80007c80:	468080e7          	jalr	1128(ra) # 800050e4 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80007c84:	0004b483          	ld	s1,0(s1)
    80007c88:	f8dff06f          	j	80007c14 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80007c8c:	00007517          	auipc	a0,0x7
    80007c90:	9f450513          	addi	a0,a0,-1548 # 8000e680 <CONSOLE_STATUS+0x670>
    80007c94:	ffffd097          	auipc	ra,0xffffd
    80007c98:	450080e7          	jalr	1104(ra) # 800050e4 <_Z12kprintStringPKc>
    80007c9c:	f75ff06f          	j	80007c10 <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80007ca0:	00007517          	auipc	a0,0x7
    80007ca4:	9f850513          	addi	a0,a0,-1544 # 8000e698 <CONSOLE_STATUS+0x688>
    80007ca8:	ffffd097          	auipc	ra,0xffffd
    80007cac:	43c080e7          	jalr	1084(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80007cb0:	01813083          	ld	ra,24(sp)
    80007cb4:	01013403          	ld	s0,16(sp)
    80007cb8:	00813483          	ld	s1,8(sp)
    80007cbc:	02010113          	addi	sp,sp,32
    80007cc0:	00008067          	ret

0000000080007cc4 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    80007cc4:	fe010113          	addi	sp,sp,-32
    80007cc8:	00113c23          	sd	ra,24(sp)
    80007ccc:	00813823          	sd	s0,16(sp)
    80007cd0:	00913423          	sd	s1,8(sp)
    80007cd4:	02010413          	addi	s0,sp,32
    80007cd8:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    80007cdc:	00007517          	auipc	a0,0x7
    80007ce0:	9dc50513          	addi	a0,a0,-1572 # 8000e6b8 <CONSOLE_STATUS+0x6a8>
    80007ce4:	ffffd097          	auipc	ra,0xffffd
    80007ce8:	400080e7          	jalr	1024(ra) # 800050e4 <_Z12kprintStringPKc>
    if(!fall_head)
    80007cec:	0104b783          	ld	a5,16(s1)
    80007cf0:	08078863          	beqz	a5,80007d80 <_ZN15MemoryAllocator14print_all_listEv+0xbc>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80007cf4:	0104b483          	ld	s1,16(s1)
    80007cf8:	08048e63          	beqz	s1,80007d94 <_ZN15MemoryAllocator14print_all_listEv+0xd0>
        kprintInt((uint64)curr, 16);
    80007cfc:	00000613          	li	a2,0
    80007d00:	01000593          	li	a1,16
    80007d04:	00048513          	mv	a0,s1
    80007d08:	ffffd097          	auipc	ra,0xffffd
    80007d0c:	424080e7          	jalr	1060(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007d10:	00006517          	auipc	a0,0x6
    80007d14:	64850513          	addi	a0,a0,1608 # 8000e358 <CONSOLE_STATUS+0x348>
    80007d18:	ffffd097          	auipc	ra,0xffffd
    80007d1c:	3cc080e7          	jalr	972(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size,16);
    80007d20:	00000613          	li	a2,0
    80007d24:	01000593          	li	a1,16
    80007d28:	0084b503          	ld	a0,8(s1)
    80007d2c:	ffffd097          	auipc	ra,0xffffd
    80007d30:	400080e7          	jalr	1024(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007d34:	00006517          	auipc	a0,0x6
    80007d38:	62450513          	addi	a0,a0,1572 # 8000e358 <CONSOLE_STATUS+0x348>
    80007d3c:	ffffd097          	auipc	ra,0xffffd
    80007d40:	3a8080e7          	jalr	936(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->addr, 16);
    80007d44:	00000613          	li	a2,0
    80007d48:	01000593          	li	a1,16
    80007d4c:	0104b503          	ld	a0,16(s1)
    80007d50:	ffffd097          	auipc	ra,0xffffd
    80007d54:	3dc080e7          	jalr	988(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80007d58:	00006517          	auipc	a0,0x6
    80007d5c:	60050513          	addi	a0,a0,1536 # 8000e358 <CONSOLE_STATUS+0x348>
    80007d60:	ffffd097          	auipc	ra,0xffffd
    80007d64:	384080e7          	jalr	900(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintString("\n");
    80007d68:	00006517          	auipc	a0,0x6
    80007d6c:	5f050513          	addi	a0,a0,1520 # 8000e358 <CONSOLE_STATUS+0x348>
    80007d70:	ffffd097          	auipc	ra,0xffffd
    80007d74:	374080e7          	jalr	884(ra) # 800050e4 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80007d78:	0004b483          	ld	s1,0(s1)
    80007d7c:	f7dff06f          	j	80007cf8 <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80007d80:	00007517          	auipc	a0,0x7
    80007d84:	90050513          	addi	a0,a0,-1792 # 8000e680 <CONSOLE_STATUS+0x670>
    80007d88:	ffffd097          	auipc	ra,0xffffd
    80007d8c:	35c080e7          	jalr	860(ra) # 800050e4 <_Z12kprintStringPKc>
    80007d90:	f65ff06f          	j	80007cf4 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80007d94:	00007517          	auipc	a0,0x7
    80007d98:	90450513          	addi	a0,a0,-1788 # 8000e698 <CONSOLE_STATUS+0x688>
    80007d9c:	ffffd097          	auipc	ra,0xffffd
    80007da0:	348080e7          	jalr	840(ra) # 800050e4 <_Z12kprintStringPKc>
    80007da4:	01813083          	ld	ra,24(sp)
    80007da8:	01013403          	ld	s0,16(sp)
    80007dac:	00813483          	ld	s1,8(sp)
    80007db0:	02010113          	addi	sp,sp,32
    80007db4:	00008067          	ret

0000000080007db8 <_ZN7NoAlloc9mem_allocEm>:
#include"../../../h/kernel_lib.h"

void* NoAlloc::NOALLOC_END_ADDR;
bool NoAlloc::working = false;

void* NoAlloc::mem_alloc(size_t size){
    80007db8:	ff010113          	addi	sp,sp,-16
    80007dbc:	00813423          	sd	s0,8(sp)
    80007dc0:	01010413          	addi	s0,sp,16
    /* not initalized */
    if(!working) return nullptr;
    80007dc4:	0000c717          	auipc	a4,0xc
    80007dc8:	5e474703          	lbu	a4,1508(a4) # 800143a8 <_ZN7NoAlloc7workingE>
    80007dcc:	04070063          	beqz	a4,80007e0c <_ZN7NoAlloc9mem_allocEm+0x54>
    80007dd0:	00050793          	mv	a5,a0
    if(!NOALLOC_END_ADDR) return nullptr;
    80007dd4:	0000c717          	auipc	a4,0xc
    80007dd8:	5dc70713          	addi	a4,a4,1500 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007ddc:	00073503          	ld	a0,0(a4)
    80007de0:	02050063          	beqz	a0,80007e00 <_ZN7NoAlloc9mem_allocEm+0x48>

    /* not enough memory */
    if((size_t) NOALLOC_END_ADDR + size >= (uint64)HEAP_END_ADDR)
    80007de4:	00f507b3          	add	a5,a0,a5
    80007de8:	0000b717          	auipc	a4,0xb
    80007dec:	bd070713          	addi	a4,a4,-1072 # 800129b8 <HEAP_END_ADDR>
    80007df0:	00073703          	ld	a4,0(a4)
    80007df4:	02e7f063          	bgeu	a5,a4,80007e14 <_ZN7NoAlloc9mem_allocEm+0x5c>
        return nullptr;
    
    void* ret = NOALLOC_END_ADDR;
    NOALLOC_END_ADDR = (void*) ((size_t)NOALLOC_END_ADDR + size); /* increase end addr by size of object */
    80007df8:	0000c717          	auipc	a4,0xc
    80007dfc:	5af73c23          	sd	a5,1464(a4) # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    
    return ret; 
}
    80007e00:	00813403          	ld	s0,8(sp)
    80007e04:	01010113          	addi	sp,sp,16
    80007e08:	00008067          	ret
    if(!working) return nullptr;
    80007e0c:	00000513          	li	a0,0
    80007e10:	ff1ff06f          	j	80007e00 <_ZN7NoAlloc9mem_allocEm+0x48>
        return nullptr;
    80007e14:	00000513          	li	a0,0
    80007e18:	fe9ff06f          	j	80007e00 <_ZN7NoAlloc9mem_allocEm+0x48>

0000000080007e1c <_ZN7NoAlloc4initEv>:

void NoAlloc::init(){
    80007e1c:	ff010113          	addi	sp,sp,-16
    80007e20:	00813423          	sd	s0,8(sp)
    80007e24:	01010413          	addi	s0,sp,16
    if(!NOALLOC_END_ADDR){
    80007e28:	0000c797          	auipc	a5,0xc
    80007e2c:	58878793          	addi	a5,a5,1416 # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007e30:	0007b783          	ld	a5,0(a5)
    80007e34:	00078863          	beqz	a5,80007e44 <_ZN7NoAlloc4initEv+0x28>
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
        working = true;
    }
    80007e38:	00813403          	ld	s0,8(sp)
    80007e3c:	01010113          	addi	sp,sp,16
    80007e40:	00008067          	ret
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
    80007e44:	0000b797          	auipc	a5,0xb
    80007e48:	b7c78793          	addi	a5,a5,-1156 # 800129c0 <HEAP_START_ADDR>
    80007e4c:	0007b783          	ld	a5,0(a5)
    80007e50:	0000c717          	auipc	a4,0xc
    80007e54:	56f73023          	sd	a5,1376(a4) # 800143b0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
        working = true;
    80007e58:	00100793          	li	a5,1
    80007e5c:	0000c717          	auipc	a4,0xc
    80007e60:	54f70623          	sb	a5,1356(a4) # 800143a8 <_ZN7NoAlloc7workingE>
    80007e64:	fd5ff06f          	j	80007e38 <_ZN7NoAlloc4initEv+0x1c>

0000000080007e68 <_ZN11ObjectCache13get_slab_sizeEPh>:
    return NONE;
}



size_t ObjectCache::get_slab_size(uchar* buddy_level_ptr){
    80007e68:	fe010113          	addi	sp,sp,-32
    80007e6c:	00113c23          	sd	ra,24(sp)
    80007e70:	00813823          	sd	s0,16(sp)
    80007e74:	00913423          	sd	s1,8(sp)
    80007e78:	01213023          	sd	s2,0(sp)
    80007e7c:	02010413          	addi	s0,sp,32
    80007e80:	00058913          	mv	s2,a1
    uchar buddy_level = 
        type == BUFF_SLAB ?
    80007e84:	01852703          	lw	a4,24(a0)
    80007e88:	00400793          	li	a5,4
    80007e8c:	04f70863          	beq	a4,a5,80007edc <_ZN11ObjectCache13get_slab_sizeEPh+0x74>
        BUDDY_LEVEL(objsize) : BUDDY_LEVEL(objsize+sizeof(Slab*));
    80007e90:	01053483          	ld	s1,16(a0)
    80007e94:	00748493          	addi	s1,s1,7
    80007e98:	00001537          	lui	a0,0x1
    80007e9c:	ffffe097          	auipc	ra,0xffffe
    80007ea0:	c00080e7          	jalr	-1024(ra) # 80005a9c <_Z4log2m>
    80007ea4:	00a4d533          	srl	a0,s1,a0
    80007ea8:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80007eac:	ffffe097          	auipc	ra,0xffffe
    80007eb0:	bf0080e7          	jalr	-1040(ra) # 80005a9c <_Z4log2m>

    if(buddy_level_ptr) *buddy_level_ptr = buddy_level;
    80007eb4:	00090463          	beqz	s2,80007ebc <_ZN11ObjectCache13get_slab_sizeEPh+0x54>
    80007eb8:	00a90023          	sb	a0,0(s2)

    return ( 1UL << buddy_level) * Buddy::BLOCK_SIZE;
}
    80007ebc:	000017b7          	lui	a5,0x1
    80007ec0:	00a79533          	sll	a0,a5,a0
    80007ec4:	01813083          	ld	ra,24(sp)
    80007ec8:	01013403          	ld	s0,16(sp)
    80007ecc:	00813483          	ld	s1,8(sp)
    80007ed0:	00013903          	ld	s2,0(sp)
    80007ed4:	02010113          	addi	sp,sp,32
    80007ed8:	00008067          	ret
        BUDDY_LEVEL(objsize) : BUDDY_LEVEL(objsize+sizeof(Slab*));
    80007edc:	01053483          	ld	s1,16(a0)
    80007ee0:	fff48493          	addi	s1,s1,-1
    80007ee4:	00001537          	lui	a0,0x1
    80007ee8:	ffffe097          	auipc	ra,0xffffe
    80007eec:	bb4080e7          	jalr	-1100(ra) # 80005a9c <_Z4log2m>
    80007ef0:	00a4d533          	srl	a0,s1,a0
    80007ef4:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80007ef8:	ffffe097          	auipc	ra,0xffffe
    80007efc:	ba4080e7          	jalr	-1116(ra) # 80005a9c <_Z4log2m>
    80007f00:	fb5ff06f          	j	80007eb4 <_ZN11ObjectCache13get_slab_sizeEPh+0x4c>

0000000080007f04 <_ZN11ObjectCache14calculate_typeEv>:
ObjectCache::SlabMetaType ObjectCache::calculate_type(){
    80007f04:	fe010113          	addi	sp,sp,-32
    80007f08:	00113c23          	sd	ra,24(sp)
    80007f0c:	00813823          	sd	s0,16(sp)
    80007f10:	00913423          	sd	s1,8(sp)
    80007f14:	02010413          	addi	s0,sp,32
    80007f18:	00050493          	mv	s1,a0
    size_t slab_size = get_slab_size();
    80007f1c:	00000593          	li	a1,0
    80007f20:	00000097          	auipc	ra,0x0
    80007f24:	f48080e7          	jalr	-184(ra) # 80007e68 <_ZN11ObjectCache13get_slab_sizeEPh>
    if( (slab_size - sizeof(void*))  % objsize >= sizeof(Slab))
    80007f28:	ff850513          	addi	a0,a0,-8
    80007f2c:	0104b783          	ld	a5,16(s1)
    80007f30:	02f57533          	remu	a0,a0,a5
    80007f34:	0b700793          	li	a5,183
    80007f38:	00a7ee63          	bltu	a5,a0,80007f54 <_ZN11ObjectCache14calculate_typeEv+0x50>
        return OFF_SLAB;
    80007f3c:	00100513          	li	a0,1
}
    80007f40:	01813083          	ld	ra,24(sp)
    80007f44:	01013403          	ld	s0,16(sp)
    80007f48:	00813483          	ld	s1,8(sp)
    80007f4c:	02010113          	addi	sp,sp,32
    80007f50:	00008067          	ret
        return ON_SLAB;
    80007f54:	00300513          	li	a0,3
    80007f58:	fe9ff06f          	j	80007f40 <_ZN11ObjectCache14calculate_typeEv+0x3c>

0000000080007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>:
ObjectCache::ObjectCache(const char* t_name, size_t t_objsize,
    80007f5c:	fd010113          	addi	sp,sp,-48
    80007f60:	02113423          	sd	ra,40(sp)
    80007f64:	02813023          	sd	s0,32(sp)
    80007f68:	00913c23          	sd	s1,24(sp)
    80007f6c:	01213823          	sd	s2,16(sp)
    80007f70:	01313423          	sd	s3,8(sp)
    80007f74:	01413023          	sd	s4,0(sp)
    80007f78:	03010413          	addi	s0,sp,48
    80007f7c:	00050493          	mv	s1,a0
    80007f80:	00068a13          	mv	s4,a3
    80007f84:	00070993          	mv	s3,a4
    80007f88:	00078913          	mv	s2,a5
        , ctor(t_ctor), dtor(t_dtor)
    80007f8c:	00b53023          	sd	a1,0(a0)
    80007f90:	00c53823          	sd	a2,16(a0)
    80007f94:	02053023          	sd	zero,32(a0)
    80007f98:	02053423          	sd	zero,40(a0)
    80007f9c:	02053823          	sd	zero,48(a0)
    80007fa0:	00000613          	li	a2,0
    80007fa4:	00000593          	li	a1,0
    80007fa8:	03850513          	addi	a0,a0,56
    80007fac:	00003097          	auipc	ra,0x3
    80007fb0:	a84080e7          	jalr	-1404(ra) # 8000aa30 <_ZN6list_tC1EPS_S0_>
    80007fb4:	0544b423          	sd	s4,72(s1)
    80007fb8:	0534b823          	sd	s3,80(s1)
    size_t lowest_size = Buddy::BLOCK_SIZE >> log2(Slab::RB_SIZE);
    80007fbc:	08000513          	li	a0,128
    80007fc0:	ffffe097          	auipc	ra,0xffffe
    80007fc4:	adc080e7          	jalr	-1316(ra) # 80005a9c <_Z4log2m>
    80007fc8:	000017b7          	lui	a5,0x1
    80007fcc:	00a7d533          	srl	a0,a5,a0
    if(objsize < lowest_size) objsize = lowest_size;
    80007fd0:	0104b783          	ld	a5,16(s1)
    80007fd4:	00a7f463          	bgeu	a5,a0,80007fdc <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0x80>
    80007fd8:	00a4b823          	sd	a0,16(s1)
    type = t_type;
    80007fdc:	0124ac23          	sw	s2,24(s1)
    if(t_type == NONE){ type = calculate_type(); }
    80007fe0:	02090263          	beqz	s2,80008004 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0xa8>
}
    80007fe4:	02813083          	ld	ra,40(sp)
    80007fe8:	02013403          	ld	s0,32(sp)
    80007fec:	01813483          	ld	s1,24(sp)
    80007ff0:	01013903          	ld	s2,16(sp)
    80007ff4:	00813983          	ld	s3,8(sp)
    80007ff8:	00013a03          	ld	s4,0(sp)
    80007ffc:	03010113          	addi	sp,sp,48
    80008000:	00008067          	ret
    if(t_type == NONE){ type = calculate_type(); }
    80008004:	00048513          	mv	a0,s1
    80008008:	00000097          	auipc	ra,0x0
    8000800c:	efc080e7          	jalr	-260(ra) # 80007f04 <_ZN11ObjectCache14calculate_typeEv>
    80008010:	00a4ac23          	sw	a0,24(s1)
}
    80008014:	fd1ff06f          	j	80007fe4 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0x88>

0000000080008018 <_ZN11ObjectCache17list_update_allocEP4Slabb>:
    return slab_meta;
}



void ObjectCache::list_update_alloc(Slab* slab_meta, bool was_free){
    80008018:	fe010113          	addi	sp,sp,-32
    8000801c:	00113c23          	sd	ra,24(sp)
    80008020:	00813823          	sd	s0,16(sp)
    80008024:	00913423          	sd	s1,8(sp)
    80008028:	01213023          	sd	s2,0(sp)
    8000802c:	02010413          	addi	s0,sp,32
    80008030:	00050493          	mv	s1,a0
    80008034:	00058913          	mv	s2,a1

    Slab() = default;
    Slab& operator=(const Slab&) = default;
    void* get_obj();
    int put_obj(void*);
    bool full(){ return front == RB_SIZE; }
    80008038:	0885c703          	lbu	a4,136(a1)
    if(slab_meta->full()){
    8000803c:	08000793          	li	a5,128
    80008040:	02f70063          	beq	a4,a5,80008060 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x48>
            free_head = remove(free_head);
        else
            part_head = remove(part_head);
        full_head = insert(&(slab_meta->node), full_head);
    }
    else if(was_free){
    80008044:	04061e63          	bnez	a2,800080a0 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x88>
        free_head = remove(free_head);
        part_head = insert(&(slab_meta->node), part_head);
    }
}
    80008048:	01813083          	ld	ra,24(sp)
    8000804c:	01013403          	ld	s0,16(sp)
    80008050:	00813483          	ld	s1,8(sp)
    80008054:	00013903          	ld	s2,0(sp)
    80008058:	02010113          	addi	sp,sp,32
    8000805c:	00008067          	ret
        if(was_free)
    80008060:	02060663          	beqz	a2,8000808c <_ZN11ObjectCache17list_update_allocEP4Slabb+0x74>
            free_head = remove(free_head);
    80008064:	02053503          	ld	a0,32(a0)
    80008068:	00003097          	auipc	ra,0x3
    8000806c:	9e8080e7          	jalr	-1560(ra) # 8000aa50 <_Z6removeP6list_t>
    80008070:	02a4b023          	sd	a0,32(s1)
        full_head = insert(&(slab_meta->node), full_head);
    80008074:	0304b583          	ld	a1,48(s1)
    80008078:	0a890513          	addi	a0,s2,168
    8000807c:	00003097          	auipc	ra,0x3
    80008080:	a20080e7          	jalr	-1504(ra) # 8000aa9c <_Z6insertP6list_tS0_>
    80008084:	02a4b823          	sd	a0,48(s1)
    80008088:	fc1ff06f          	j	80008048 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x30>
            part_head = remove(part_head);
    8000808c:	02853503          	ld	a0,40(a0)
    80008090:	00003097          	auipc	ra,0x3
    80008094:	9c0080e7          	jalr	-1600(ra) # 8000aa50 <_Z6removeP6list_t>
    80008098:	02a4b423          	sd	a0,40(s1)
    8000809c:	fd9ff06f          	j	80008074 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x5c>
        free_head = remove(free_head);
    800080a0:	02053503          	ld	a0,32(a0)
    800080a4:	00003097          	auipc	ra,0x3
    800080a8:	9ac080e7          	jalr	-1620(ra) # 8000aa50 <_Z6removeP6list_t>
    800080ac:	02a4b023          	sd	a0,32(s1)
        part_head = insert(&(slab_meta->node), part_head);
    800080b0:	0284b583          	ld	a1,40(s1)
    800080b4:	0a890513          	addi	a0,s2,168
    800080b8:	00003097          	auipc	ra,0x3
    800080bc:	9e4080e7          	jalr	-1564(ra) # 8000aa9c <_Z6insertP6list_tS0_>
    800080c0:	02a4b423          	sd	a0,40(s1)
}
    800080c4:	f85ff06f          	j	80008048 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x30>

00000000800080c8 <_ZN11ObjectCache16list_update_freeEP4Slabb>:
    return obj;
}



void ObjectCache::list_update_free(Slab* slab_meta, bool was_full){
    800080c8:	fe010113          	addi	sp,sp,-32
    800080cc:	00113c23          	sd	ra,24(sp)
    800080d0:	00813823          	sd	s0,16(sp)
    800080d4:	00913423          	sd	s1,8(sp)
    800080d8:	01213023          	sd	s2,0(sp)
    800080dc:	02010413          	addi	s0,sp,32
    800080e0:	00050913          	mv	s2,a0
    800080e4:	00058493          	mv	s1,a1
    bool free(){ return rear == front; }
    800080e8:	0895c703          	lbu	a4,137(a1)
    800080ec:	0885c783          	lbu	a5,136(a1)
    
    if(slab_meta->free()){
    800080f0:	02f70c63          	beq	a4,a5,80008128 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x60>
                part_head = remove(part_head);
            else
                remove(&slab_meta->node);
        }
        free_head = insert(&slab_meta->node, free_head);
    }else if(was_full){
    800080f4:	06060063          	beqz	a2,80008154 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x8c>
        if(&slab_meta->node == full_head)
    800080f8:	0a858493          	addi	s1,a1,168
    800080fc:	03053503          	ld	a0,48(a0)
    80008100:	0aa48663          	beq	s1,a0,800081ac <_ZN11ObjectCache16list_update_freeEP4Slabb+0xe4>
            full_head = remove(full_head);
        else
            remove(&slab_meta->node);
    80008104:	00048513          	mv	a0,s1
    80008108:	00003097          	auipc	ra,0x3
    8000810c:	948080e7          	jalr	-1720(ra) # 8000aa50 <_Z6removeP6list_t>
        part_head = insert(&slab_meta->node, part_head);
    80008110:	02893583          	ld	a1,40(s2)
    80008114:	00048513          	mv	a0,s1
    80008118:	00003097          	auipc	ra,0x3
    8000811c:	984080e7          	jalr	-1660(ra) # 8000aa9c <_Z6insertP6list_tS0_>
    80008120:	02a93423          	sd	a0,40(s2)
    }

}
    80008124:	0300006f          	j	80008154 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x8c>
        if(was_full){
    80008128:	04060c63          	beqz	a2,80008180 <_ZN11ObjectCache16list_update_freeEP4Slabb+0xb8>
            if(&slab_meta->node == full_head)
    8000812c:	0a858513          	addi	a0,a1,168
    80008130:	03093783          	ld	a5,48(s2)
    80008134:	02f50c63          	beq	a0,a5,8000816c <_ZN11ObjectCache16list_update_freeEP4Slabb+0xa4>
                remove(&slab_meta->node);
    80008138:	00003097          	auipc	ra,0x3
    8000813c:	918080e7          	jalr	-1768(ra) # 8000aa50 <_Z6removeP6list_t>
        free_head = insert(&slab_meta->node, free_head);
    80008140:	02093583          	ld	a1,32(s2)
    80008144:	0a848513          	addi	a0,s1,168
    80008148:	00003097          	auipc	ra,0x3
    8000814c:	954080e7          	jalr	-1708(ra) # 8000aa9c <_Z6insertP6list_tS0_>
    80008150:	02a93023          	sd	a0,32(s2)
}
    80008154:	01813083          	ld	ra,24(sp)
    80008158:	01013403          	ld	s0,16(sp)
    8000815c:	00813483          	ld	s1,8(sp)
    80008160:	00013903          	ld	s2,0(sp)
    80008164:	02010113          	addi	sp,sp,32
    80008168:	00008067          	ret
                full_head = remove(full_head);
    8000816c:	00078513          	mv	a0,a5
    80008170:	00003097          	auipc	ra,0x3
    80008174:	8e0080e7          	jalr	-1824(ra) # 8000aa50 <_Z6removeP6list_t>
    80008178:	02a93823          	sd	a0,48(s2)
    8000817c:	fc5ff06f          	j	80008140 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
            if(&slab_meta->node == part_head)
    80008180:	0a858513          	addi	a0,a1,168
    80008184:	02893783          	ld	a5,40(s2)
    80008188:	00f50863          	beq	a0,a5,80008198 <_ZN11ObjectCache16list_update_freeEP4Slabb+0xd0>
                remove(&slab_meta->node);
    8000818c:	00003097          	auipc	ra,0x3
    80008190:	8c4080e7          	jalr	-1852(ra) # 8000aa50 <_Z6removeP6list_t>
    80008194:	fadff06f          	j	80008140 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
                part_head = remove(part_head);
    80008198:	00078513          	mv	a0,a5
    8000819c:	00003097          	auipc	ra,0x3
    800081a0:	8b4080e7          	jalr	-1868(ra) # 8000aa50 <_Z6removeP6list_t>
    800081a4:	02a93423          	sd	a0,40(s2)
    800081a8:	f99ff06f          	j	80008140 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
            full_head = remove(full_head);
    800081ac:	00003097          	auipc	ra,0x3
    800081b0:	8a4080e7          	jalr	-1884(ra) # 8000aa50 <_Z6removeP6list_t>
    800081b4:	02a93823          	sd	a0,48(s2)
    800081b8:	f59ff06f          	j	80008110 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x48>

00000000800081bc <_ZN11ObjectCache9find_slabEPvP6list_t>:



Slab* ObjectCache::find_slab(void* addr, list_t* head){
    800081bc:	fd010113          	addi	sp,sp,-48
    800081c0:	02113423          	sd	ra,40(sp)
    800081c4:	02813023          	sd	s0,32(sp)
    800081c8:	00913c23          	sd	s1,24(sp)
    800081cc:	01213823          	sd	s2,16(sp)
    800081d0:	01313423          	sd	s3,8(sp)
    800081d4:	03010413          	addi	s0,sp,48
    800081d8:	00058993          	mv	s3,a1
    800081dc:	00060493          	mv	s1,a2
    list_t* tmp = head;
    while(tmp){
    800081e0:	02048463          	beqz	s1,80008208 <_ZN11ObjectCache9find_slabEPvP6list_t+0x4c>
        Slab* slab_meta = get_list_parent(tmp, Slab, node);
    800081e4:	f5848913          	addi	s2,s1,-168
        if(slab_meta->contains(addr)) return slab_meta;
    800081e8:	00098593          	mv	a1,s3
    800081ec:	00090513          	mv	a0,s2
    800081f0:	00001097          	auipc	ra,0x1
    800081f4:	8b4080e7          	jalr	-1868(ra) # 80008aa4 <_ZN4Slab8containsEPv>
    800081f8:	00051663          	bnez	a0,80008204 <_ZN11ObjectCache9find_slabEPvP6list_t+0x48>
        tmp = tmp->next;
    800081fc:	0004b483          	ld	s1,0(s1)
    while(tmp){
    80008200:	fe1ff06f          	j	800081e0 <_ZN11ObjectCache9find_slabEPvP6list_t+0x24>
        if(slab_meta->contains(addr)) return slab_meta;
    80008204:	00090493          	mv	s1,s2
    }
    return 0;
}
    80008208:	00048513          	mv	a0,s1
    8000820c:	02813083          	ld	ra,40(sp)
    80008210:	02013403          	ld	s0,32(sp)
    80008214:	01813483          	ld	s1,24(sp)
    80008218:	01013903          	ld	s2,16(sp)
    8000821c:	00813983          	ld	s3,8(sp)
    80008220:	03010113          	addi	sp,sp,48
    80008224:	00008067          	ret

0000000080008228 <_ZN11ObjectCache9printInfoEc>:
}




void ObjectCache::printInfo(char flags){
    80008228:	fd010113          	addi	sp,sp,-48
    8000822c:	02113423          	sd	ra,40(sp)
    80008230:	02813023          	sd	s0,32(sp)
    80008234:	00913c23          	sd	s1,24(sp)
    80008238:	01213823          	sd	s2,16(sp)
    8000823c:	01313423          	sd	s3,8(sp)
    80008240:	03010413          	addi	s0,sp,48
    80008244:	00050993          	mv	s3,a0
    80008248:	00058913          	mv	s2,a1
    kprintString("\n--------OBJCACHE ");kprintString(name); kprintString("--------\n");
    8000824c:	00006517          	auipc	a0,0x6
    80008250:	4ac50513          	addi	a0,a0,1196 # 8000e6f8 <CONSOLE_STATUS+0x6e8>
    80008254:	ffffd097          	auipc	ra,0xffffd
    80008258:	e90080e7          	jalr	-368(ra) # 800050e4 <_Z12kprintStringPKc>
    8000825c:	0009b503          	ld	a0,0(s3)
    80008260:	ffffd097          	auipc	ra,0xffffd
    80008264:	e84080e7          	jalr	-380(ra) # 800050e4 <_Z12kprintStringPKc>
    80008268:	00006517          	auipc	a0,0x6
    8000826c:	4a850513          	addi	a0,a0,1192 # 8000e710 <CONSOLE_STATUS+0x700>
    80008270:	ffffd097          	auipc	ra,0xffffd
    80008274:	e74080e7          	jalr	-396(ra) # 800050e4 <_Z12kprintStringPKc>
   
     
    KCHECKPRINT(objsize);
    80008278:	00006517          	auipc	a0,0x6
    8000827c:	4a850513          	addi	a0,a0,1192 # 8000e720 <CONSOLE_STATUS+0x710>
    80008280:	ffffd097          	auipc	ra,0xffffd
    80008284:	e64080e7          	jalr	-412(ra) # 800050e4 <_Z12kprintStringPKc>
    80008288:	00000613          	li	a2,0
    8000828c:	01000593          	li	a1,16
    80008290:	0109b503          	ld	a0,16(s3)
    80008294:	ffffd097          	auipc	ra,0xffffd
    80008298:	e98080e7          	jalr	-360(ra) # 8000512c <_Z9kprintIntmib>
    8000829c:	00006517          	auipc	a0,0x6
    800082a0:	0bc50513          	addi	a0,a0,188 # 8000e358 <CONSOLE_STATUS+0x348>
    800082a4:	ffffd097          	auipc	ra,0xffffd
    800082a8:	e40080e7          	jalr	-448(ra) # 800050e4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(SLAB SIZE, get_slab_size());
    800082ac:	00006517          	auipc	a0,0x6
    800082b0:	48450513          	addi	a0,a0,1156 # 8000e730 <CONSOLE_STATUS+0x720>
    800082b4:	ffffd097          	auipc	ra,0xffffd
    800082b8:	e30080e7          	jalr	-464(ra) # 800050e4 <_Z12kprintStringPKc>
    800082bc:	00000593          	li	a1,0
    800082c0:	00098513          	mv	a0,s3
    800082c4:	00000097          	auipc	ra,0x0
    800082c8:	ba4080e7          	jalr	-1116(ra) # 80007e68 <_ZN11ObjectCache13get_slab_sizeEPh>
    800082cc:	00000613          	li	a2,0
    800082d0:	01000593          	li	a1,16
    800082d4:	ffffd097          	auipc	ra,0xffffd
    800082d8:	e58080e7          	jalr	-424(ra) # 8000512c <_Z9kprintIntmib>
    800082dc:	00006517          	auipc	a0,0x6
    800082e0:	07c50513          	addi	a0,a0,124 # 8000e358 <CONSOLE_STATUS+0x348>
    800082e4:	ffffd097          	auipc	ra,0xffffd
    800082e8:	e00080e7          	jalr	-512(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("SLAB TYPE: ");
    800082ec:	00006517          	auipc	a0,0x6
    800082f0:	45450513          	addi	a0,a0,1108 # 8000e740 <CONSOLE_STATUS+0x730>
    800082f4:	ffffd097          	auipc	ra,0xffffd
    800082f8:	df0080e7          	jalr	-528(ra) # 800050e4 <_Z12kprintStringPKc>
    switch (type) {
    800082fc:	0189a783          	lw	a5,24(s3)
    80008300:	00400713          	li	a4,4
    80008304:	02f76863          	bltu	a4,a5,80008334 <_ZN11ObjectCache9printInfoEc+0x10c>
    80008308:	00279793          	slli	a5,a5,0x2
    8000830c:	00006717          	auipc	a4,0x6
    80008310:	3d470713          	addi	a4,a4,980 # 8000e6e0 <CONSOLE_STATUS+0x6d0>
    80008314:	00e787b3          	add	a5,a5,a4
    80008318:	0007a783          	lw	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000831c:	00e787b3          	add	a5,a5,a4
    80008320:	00078067          	jr	a5
        case NONE : kprintString("NONE\n");
    80008324:	00006517          	auipc	a0,0x6
    80008328:	42c50513          	addi	a0,a0,1068 # 8000e750 <CONSOLE_STATUS+0x740>
    8000832c:	ffffd097          	auipc	ra,0xffffd
    80008330:	db8080e7          	jalr	-584(ra) # 800050e4 <_Z12kprintStringPKc>
        case ON_SLAB: kprintString("ON_SLAB\n");
        break;
        case BUFF_SLAB: kprintString("BUFF_SLAB\n");
        break;
    }
    kprintString("!!!!!!FREE SLAB LIST!!!!!! \n");
    80008334:	00006517          	auipc	a0,0x6
    80008338:	46450513          	addi	a0,a0,1124 # 8000e798 <CONSOLE_STATUS+0x788>
    8000833c:	ffffd097          	auipc	ra,0xffffd
    80008340:	da8080e7          	jalr	-600(ra) # 800050e4 <_Z12kprintStringPKc>
    list_t* tmp = free_head;
    80008344:	0209b483          	ld	s1,32(s3)
    while(tmp){
    80008348:	06048e63          	beqz	s1,800083c4 <_ZN11ObjectCache9printInfoEc+0x19c>
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
    8000834c:	00090593          	mv	a1,s2
    80008350:	f5848513          	addi	a0,s1,-168
    80008354:	00000097          	auipc	ra,0x0
    80008358:	7dc080e7          	jalr	2012(ra) # 80008b30 <_ZN4Slab10print_infoEc>
        kprintString("\n");
    8000835c:	00006517          	auipc	a0,0x6
    80008360:	ffc50513          	addi	a0,a0,-4 # 8000e358 <CONSOLE_STATUS+0x348>
    80008364:	ffffd097          	auipc	ra,0xffffd
    80008368:	d80080e7          	jalr	-640(ra) # 800050e4 <_Z12kprintStringPKc>
        tmp = tmp->next;
    8000836c:	0004b483          	ld	s1,0(s1)
    while(tmp){
    80008370:	fd9ff06f          	j	80008348 <_ZN11ObjectCache9printInfoEc+0x120>
        case OFF_SLAB : kprintString("OFF_SLAB\n");
    80008374:	00006517          	auipc	a0,0x6
    80008378:	3e450513          	addi	a0,a0,996 # 8000e758 <CONSOLE_STATUS+0x748>
    8000837c:	ffffd097          	auipc	ra,0xffffd
    80008380:	d68080e7          	jalr	-664(ra) # 800050e4 <_Z12kprintStringPKc>
        break;
    80008384:	fb1ff06f          	j	80008334 <_ZN11ObjectCache9printInfoEc+0x10c>
        case SLAB_SLAB : kprintString("SLAB_SLAB\n");
    80008388:	00006517          	auipc	a0,0x6
    8000838c:	3e050513          	addi	a0,a0,992 # 8000e768 <CONSOLE_STATUS+0x758>
    80008390:	ffffd097          	auipc	ra,0xffffd
    80008394:	d54080e7          	jalr	-684(ra) # 800050e4 <_Z12kprintStringPKc>
        break;
    80008398:	f9dff06f          	j	80008334 <_ZN11ObjectCache9printInfoEc+0x10c>
        case ON_SLAB: kprintString("ON_SLAB\n");
    8000839c:	00006517          	auipc	a0,0x6
    800083a0:	3dc50513          	addi	a0,a0,988 # 8000e778 <CONSOLE_STATUS+0x768>
    800083a4:	ffffd097          	auipc	ra,0xffffd
    800083a8:	d40080e7          	jalr	-704(ra) # 800050e4 <_Z12kprintStringPKc>
        break;
    800083ac:	f89ff06f          	j	80008334 <_ZN11ObjectCache9printInfoEc+0x10c>
        case BUFF_SLAB: kprintString("BUFF_SLAB\n");
    800083b0:	00006517          	auipc	a0,0x6
    800083b4:	3d850513          	addi	a0,a0,984 # 8000e788 <CONSOLE_STATUS+0x778>
    800083b8:	ffffd097          	auipc	ra,0xffffd
    800083bc:	d2c080e7          	jalr	-724(ra) # 800050e4 <_Z12kprintStringPKc>
        break;
    800083c0:	f75ff06f          	j	80008334 <_ZN11ObjectCache9printInfoEc+0x10c>
    }
    kprintString("!!!!!!PARTIAL SLAB LIST!!!!!! \n");
    800083c4:	00006517          	auipc	a0,0x6
    800083c8:	3f450513          	addi	a0,a0,1012 # 8000e7b8 <CONSOLE_STATUS+0x7a8>
    800083cc:	ffffd097          	auipc	ra,0xffffd
    800083d0:	d18080e7          	jalr	-744(ra) # 800050e4 <_Z12kprintStringPKc>
    tmp = part_head;
    800083d4:	0289b483          	ld	s1,40(s3)
    while(tmp){
    800083d8:	02048663          	beqz	s1,80008404 <_ZN11ObjectCache9printInfoEc+0x1dc>
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
    800083dc:	00090593          	mv	a1,s2
    800083e0:	f5848513          	addi	a0,s1,-168
    800083e4:	00000097          	auipc	ra,0x0
    800083e8:	74c080e7          	jalr	1868(ra) # 80008b30 <_ZN4Slab10print_infoEc>
        kprintString("\n");
    800083ec:	00006517          	auipc	a0,0x6
    800083f0:	f6c50513          	addi	a0,a0,-148 # 8000e358 <CONSOLE_STATUS+0x348>
    800083f4:	ffffd097          	auipc	ra,0xffffd
    800083f8:	cf0080e7          	jalr	-784(ra) # 800050e4 <_Z12kprintStringPKc>
        tmp = tmp->next;
    800083fc:	0004b483          	ld	s1,0(s1)
    while(tmp){
    80008400:	fd9ff06f          	j	800083d8 <_ZN11ObjectCache9printInfoEc+0x1b0>
    }
    kprintString("!!!!!!FULL SLAB LIST!!!!!!\n");
    80008404:	00006517          	auipc	a0,0x6
    80008408:	3d450513          	addi	a0,a0,980 # 8000e7d8 <CONSOLE_STATUS+0x7c8>
    8000840c:	ffffd097          	auipc	ra,0xffffd
    80008410:	cd8080e7          	jalr	-808(ra) # 800050e4 <_Z12kprintStringPKc>
    tmp = full_head;
    80008414:	0309b483          	ld	s1,48(s3)
    while(tmp){
    80008418:	02048663          	beqz	s1,80008444 <_ZN11ObjectCache9printInfoEc+0x21c>
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
    8000841c:	00090593          	mv	a1,s2
    80008420:	f5848513          	addi	a0,s1,-168
    80008424:	00000097          	auipc	ra,0x0
    80008428:	70c080e7          	jalr	1804(ra) # 80008b30 <_ZN4Slab10print_infoEc>
        kprintString("\n");
    8000842c:	00006517          	auipc	a0,0x6
    80008430:	f2c50513          	addi	a0,a0,-212 # 8000e358 <CONSOLE_STATUS+0x348>
    80008434:	ffffd097          	auipc	ra,0xffffd
    80008438:	cb0080e7          	jalr	-848(ra) # 800050e4 <_Z12kprintStringPKc>
        tmp = tmp->next;
    8000843c:	0004b483          	ld	s1,0(s1)
    while(tmp){
    80008440:	fd9ff06f          	j	80008418 <_ZN11ObjectCache9printInfoEc+0x1f0>
    }
    kprintString("------OBJCACHE ");kprintString(name); kprintString(" END------\n\n");
    80008444:	00006517          	auipc	a0,0x6
    80008448:	3b450513          	addi	a0,a0,948 # 8000e7f8 <CONSOLE_STATUS+0x7e8>
    8000844c:	ffffd097          	auipc	ra,0xffffd
    80008450:	c98080e7          	jalr	-872(ra) # 800050e4 <_Z12kprintStringPKc>
    80008454:	0009b503          	ld	a0,0(s3)
    80008458:	ffffd097          	auipc	ra,0xffffd
    8000845c:	c8c080e7          	jalr	-884(ra) # 800050e4 <_Z12kprintStringPKc>
    80008460:	00006517          	auipc	a0,0x6
    80008464:	3a850513          	addi	a0,a0,936 # 8000e808 <CONSOLE_STATUS+0x7f8>
    80008468:	ffffd097          	auipc	ra,0xffffd
    8000846c:	c7c080e7          	jalr	-900(ra) # 800050e4 <_Z12kprintStringPKc>
    
}
    80008470:	02813083          	ld	ra,40(sp)
    80008474:	02013403          	ld	s0,32(sp)
    80008478:	01813483          	ld	s1,24(sp)
    8000847c:	01013903          	ld	s2,16(sp)
    80008480:	00813983          	ld	s3,8(sp)
    80008484:	03010113          	addi	sp,sp,48
    80008488:	00008067          	ret

000000008000848c <_ZN11ObjectCache8zero_outEPv>:




void ObjectCache::zero_out(void* t){
    8000848c:	ff010113          	addi	sp,sp,-16
    80008490:	00813423          	sd	s0,8(sp)
    80008494:	01010413          	addi	s0,sp,16
    for( char* ptr = (char*)t; ptr < (char*)t + objsize; ptr++ )
    80008498:	00058713          	mv	a4,a1
    8000849c:	01053783          	ld	a5,16(a0)
    800084a0:	00f587b3          	add	a5,a1,a5
    800084a4:	00f77863          	bgeu	a4,a5,800084b4 <_ZN11ObjectCache8zero_outEPv+0x28>
        *ptr = 0;
    800084a8:	00070023          	sb	zero,0(a4)
    for( char* ptr = (char*)t; ptr < (char*)t + objsize; ptr++ )
    800084ac:	00170713          	addi	a4,a4,1
    800084b0:	fedff06f          	j	8000849c <_ZN11ObjectCache8zero_outEPv+0x10>

    800084b4:	00813403          	ld	s0,8(sp)
    800084b8:	01010113          	addi	sp,sp,16
    800084bc:	00008067          	ret

00000000800084c0 <_ZN11ObjectCache10slab_allocEv>:
Slab* ObjectCache::slab_alloc(){
    800084c0:	ef010113          	addi	sp,sp,-272
    800084c4:	10113423          	sd	ra,264(sp)
    800084c8:	10813023          	sd	s0,256(sp)
    800084cc:	0e913c23          	sd	s1,248(sp)
    800084d0:	0f213823          	sd	s2,240(sp)
    800084d4:	0f313423          	sd	s3,232(sp)
    800084d8:	0f413023          	sd	s4,224(sp)
    800084dc:	0d513c23          	sd	s5,216(sp)
    800084e0:	0d613823          	sd	s6,208(sp)
    800084e4:	0d713423          	sd	s7,200(sp)
    800084e8:	11010413          	addi	s0,sp,272
    800084ec:	00050913          	mv	s2,a0
    size_t slab_size = get_slab_size(&buddy_level);
    800084f0:	faf40593          	addi	a1,s0,-81
    800084f4:	00000097          	auipc	ra,0x0
    800084f8:	974080e7          	jalr	-1676(ra) # 80007e68 <_ZN11ObjectCache13get_slab_sizeEPh>
    800084fc:	00050b13          	mv	s6,a0
    obj_num = slab_size/objsize - 1;
    80008500:	01093a83          	ld	s5,16(s2)
    80008504:	03555ab3          	divu	s5,a0,s5
    80008508:	0ffafa93          	andi	s5,s5,255
    8000850c:	fffa879b          	addiw	a5,s5,-1
    80008510:	0ff7fb93          	andi	s7,a5,255
    start = (char*)Buddy::getInstance().mem_alloc(buddy_level);
    80008514:	ffffe097          	auipc	ra,0xffffe
    80008518:	36c080e7          	jalr	876(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    8000851c:	faf44583          	lbu	a1,-81(s0)
    80008520:	fffff097          	auipc	ra,0xfffff
    80008524:	8d8080e7          	jalr	-1832(ra) # 80006df8 <_ZN5Buddy9mem_allocEh>
    80008528:	00050993          	mv	s3,a0
    if(!start){
    8000852c:	0e050263          	beqz	a0,80008610 <_ZN11ObjectCache10slab_allocEv+0x150>
    tmp_addr = start + sizeof(Slab*);
    80008530:	00850493          	addi	s1,a0,8
        &SlabAllocator::getInstance().slab_cache;
    80008534:	00001097          	auipc	ra,0x1
    80008538:	c08080e7          	jalr	-1016(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000853c:	05850513          	addi	a0,a0,88
    switch(type){
    80008540:	01892783          	lw	a5,24(s2)
    80008544:	00200713          	li	a4,2
    80008548:	12e78063          	beq	a5,a4,80008668 <_ZN11ObjectCache10slab_allocEv+0x1a8>
    8000854c:	0cf77c63          	bgeu	a4,a5,80008624 <_ZN11ObjectCache10slab_allocEv+0x164>
    80008550:	00300713          	li	a4,3
    80008554:	12e78263          	beq	a5,a4,80008678 <_ZN11ObjectCache10slab_allocEv+0x1b8>
    80008558:	00400713          	li	a4,4
    8000855c:	16e79863          	bne	a5,a4,800086cc <_ZN11ObjectCache10slab_allocEv+0x20c>
            tmp_addr = start;
    80008560:	00098493          	mv	s1,s3
            slab_meta = (Slab*)slab_cache_ptr->alloc_obj();
    80008564:	00000097          	auipc	ra,0x0
    80008568:	170080e7          	jalr	368(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    8000856c:	00050a13          	mv	s4,a0
    if(type == SLAB_SLAB){ obj_num -= 1; }
    80008570:	01892703          	lw	a4,24(s2)
    80008574:	00200793          	li	a5,2
    80008578:	10f70863          	beq	a4,a5,80008688 <_ZN11ObjectCache10slab_allocEv+0x1c8>
    *slab_meta = Slab(obj_num
    8000857c:	00090693          	mv	a3,s2
    80008580:	00048613          	mv	a2,s1
    80008584:	000a8593          	mv	a1,s5
    80008588:	ef040513          	addi	a0,s0,-272
    8000858c:	00000097          	auipc	ra,0x0
    80008590:	450080e7          	jalr	1104(ra) # 800089dc <_ZN4SlabC1EhPvP11ObjectCache>
    80008594:	ef040793          	addi	a5,s0,-272
    80008598:	000a0713          	mv	a4,s4
    8000859c:	f9040813          	addi	a6,s0,-112
    800085a0:	0007b503          	ld	a0,0(a5)
    800085a4:	0087b583          	ld	a1,8(a5)
    800085a8:	0107b603          	ld	a2,16(a5)
    800085ac:	0187b683          	ld	a3,24(a5)
    800085b0:	00a73023          	sd	a0,0(a4)
    800085b4:	00b73423          	sd	a1,8(a4)
    800085b8:	00c73823          	sd	a2,16(a4)
    800085bc:	00d73c23          	sd	a3,24(a4)
    800085c0:	02078793          	addi	a5,a5,32
    800085c4:	02070713          	addi	a4,a4,32
    800085c8:	fd079ce3          	bne	a5,a6,800085a0 <_ZN11ObjectCache10slab_allocEv+0xe0>
    800085cc:	0007b603          	ld	a2,0(a5)
    800085d0:	0087b683          	ld	a3,8(a5)
    800085d4:	0107b783          	ld	a5,16(a5)
    800085d8:	00c73023          	sd	a2,0(a4)
    800085dc:	00d73423          	sd	a3,8(a4)
    800085e0:	00f73823          	sd	a5,16(a4)
    if(type != BUFF_SLAB) { *slab_meta_addr_ptr = slab_meta; }
    800085e4:	01892703          	lw	a4,24(s2)
    800085e8:	00400793          	li	a5,4
    800085ec:	00f70463          	beq	a4,a5,800085f4 <_ZN11ObjectCache10slab_allocEv+0x134>
    800085f0:	0149b023          	sd	s4,0(s3)
    free_head = insert(&slab_meta->node, free_head);
    800085f4:	02093583          	ld	a1,32(s2)
    800085f8:	0a8a0513          	addi	a0,s4,168
    800085fc:	00002097          	auipc	ra,0x2
    80008600:	4a0080e7          	jalr	1184(ra) # 8000aa9c <_Z6insertP6list_tS0_>
    80008604:	02a93023          	sd	a0,32(s2)
    char* end = start + slab_size;
    80008608:	016989b3          	add	s3,s3,s6
    8000860c:	0a00006f          	j	800086ac <_ZN11ObjectCache10slab_allocEv+0x1ec>
        error = "Not enough memory left";
    80008610:	00006797          	auipc	a5,0x6
    80008614:	20878793          	addi	a5,a5,520 # 8000e818 <CONSOLE_STATUS+0x808>
    80008618:	00f93423          	sd	a5,8(s2)
        return nullptr;
    8000861c:	00050a13          	mv	s4,a0
    80008620:	0180006f          	j	80008638 <_ZN11ObjectCache10slab_allocEv+0x178>
    switch(type){
    80008624:	00100713          	li	a4,1
    80008628:	00e79663          	bne	a5,a4,80008634 <_ZN11ObjectCache10slab_allocEv+0x174>
    obj_num = slab_size/objsize - 1;
    8000862c:	000b8a93          	mv	s5,s7
    80008630:	f35ff06f          	j	80008564 <_ZN11ObjectCache10slab_allocEv+0xa4>
        case NONE: default: return nullptr;
    80008634:	00000a13          	li	s4,0
}
    80008638:	000a0513          	mv	a0,s4
    8000863c:	10813083          	ld	ra,264(sp)
    80008640:	10013403          	ld	s0,256(sp)
    80008644:	0f813483          	ld	s1,248(sp)
    80008648:	0f013903          	ld	s2,240(sp)
    8000864c:	0e813983          	ld	s3,232(sp)
    80008650:	0e013a03          	ld	s4,224(sp)
    80008654:	0d813a83          	ld	s5,216(sp)
    80008658:	0d013b03          	ld	s6,208(sp)
    8000865c:	0c813b83          	ld	s7,200(sp)
    80008660:	11010113          	addi	sp,sp,272
    80008664:	00008067          	ret
            slab_meta = (Slab*)tmp_addr;
    80008668:	00048a13          	mv	s4,s1
            tmp_addr += sizeof(Slab);
    8000866c:	0c098493          	addi	s1,s3,192
    obj_num = slab_size/objsize - 1;
    80008670:	000b8a93          	mv	s5,s7
            break;
    80008674:	efdff06f          	j	80008570 <_ZN11ObjectCache10slab_allocEv+0xb0>
            slab_meta = (Slab*)(start + slab_size - sizeof(Slab));
    80008678:	f48b0a13          	addi	s4,s6,-184 # 1f48 <_entry-0x7fffe0b8>
    8000867c:	01498a33          	add	s4,s3,s4
    obj_num = slab_size/objsize - 1;
    80008680:	000b8a93          	mv	s5,s7
            break;
    80008684:	eedff06f          	j	80008570 <_ZN11ObjectCache10slab_allocEv+0xb0>
    if(type == SLAB_SLAB){ obj_num -= 1; }
    80008688:	fffa8a9b          	addiw	s5,s5,-1
    8000868c:	0ffafa93          	andi	s5,s5,255
    80008690:	eedff06f          	j	8000857c <_ZN11ObjectCache10slab_allocEv+0xbc>
            zero_out(tmp_addr);
    80008694:	00048593          	mv	a1,s1
    80008698:	00090513          	mv	a0,s2
    8000869c:	00000097          	auipc	ra,0x0
    800086a0:	df0080e7          	jalr	-528(ra) # 8000848c <_ZN11ObjectCache8zero_outEPv>
    for(; tmp_addr + objsize <= end; tmp_addr += objsize){
    800086a4:	01093783          	ld	a5,16(s2)
    800086a8:	00f484b3          	add	s1,s1,a5
    800086ac:	01093783          	ld	a5,16(s2)
    800086b0:	00f487b3          	add	a5,s1,a5
    800086b4:	f8f9e2e3          	bltu	s3,a5,80008638 <_ZN11ObjectCache10slab_allocEv+0x178>
        if(ctor)
    800086b8:	04893783          	ld	a5,72(s2)
    800086bc:	fc078ce3          	beqz	a5,80008694 <_ZN11ObjectCache10slab_allocEv+0x1d4>
            ctor(tmp_addr);
    800086c0:	00048513          	mv	a0,s1
    800086c4:	000780e7          	jalr	a5
    800086c8:	fddff06f          	j	800086a4 <_ZN11ObjectCache10slab_allocEv+0x1e4>
        case NONE: default: return nullptr;
    800086cc:	00000a13          	li	s4,0
    800086d0:	f69ff06f          	j	80008638 <_ZN11ObjectCache10slab_allocEv+0x178>

00000000800086d4 <_ZN11ObjectCache9alloc_objEv>:
void* ObjectCache::alloc_obj(){ 
    800086d4:	fd010113          	addi	sp,sp,-48
    800086d8:	02113423          	sd	ra,40(sp)
    800086dc:	02813023          	sd	s0,32(sp)
    800086e0:	00913c23          	sd	s1,24(sp)
    800086e4:	01213823          	sd	s2,16(sp)
    800086e8:	01313423          	sd	s3,8(sp)
    800086ec:	01413023          	sd	s4,0(sp)
    800086f0:	03010413          	addi	s0,sp,48
    800086f4:	00050913          	mv	s2,a0
    if(part_head){
    800086f8:	02853483          	ld	s1,40(a0)
    800086fc:	04048a63          	beqz	s1,80008750 <_ZN11ObjectCache9alloc_objEv+0x7c>
        t = get_list_parent(part_head, Slab, node);
    80008700:	f5848493          	addi	s1,s1,-168
    bool was_free = false;
    80008704:	00000a13          	li	s4,0
    obj = t->get_obj();
    80008708:	00048513          	mv	a0,s1
    8000870c:	00000097          	auipc	ra,0x0
    80008710:	6d4080e7          	jalr	1748(ra) # 80008de0 <_ZN4Slab7get_objEv>
    80008714:	00050993          	mv	s3,a0
    list_update_alloc(t, was_free);
    80008718:	000a0613          	mv	a2,s4
    8000871c:	00048593          	mv	a1,s1
    80008720:	00090513          	mv	a0,s2
    80008724:	00000097          	auipc	ra,0x0
    80008728:	8f4080e7          	jalr	-1804(ra) # 80008018 <_ZN11ObjectCache17list_update_allocEP4Slabb>
}
    8000872c:	00098513          	mv	a0,s3
    80008730:	02813083          	ld	ra,40(sp)
    80008734:	02013403          	ld	s0,32(sp)
    80008738:	01813483          	ld	s1,24(sp)
    8000873c:	01013903          	ld	s2,16(sp)
    80008740:	00813983          	ld	s3,8(sp)
    80008744:	00013a03          	ld	s4,0(sp)
    80008748:	03010113          	addi	sp,sp,48
    8000874c:	00008067          	ret
        if(free_head){ 
    80008750:	02053483          	ld	s1,32(a0)
    80008754:	00048863          	beqz	s1,80008764 <_ZN11ObjectCache9alloc_objEv+0x90>
            t = get_list_parent(free_head, Slab, node); 
    80008758:	f5848493          	addi	s1,s1,-168
        was_free = true;
    8000875c:	00100a13          	li	s4,1
    80008760:	fa9ff06f          	j	80008708 <_ZN11ObjectCache9alloc_objEv+0x34>
        } else {  t = slab_alloc(); }
    80008764:	00000097          	auipc	ra,0x0
    80008768:	d5c080e7          	jalr	-676(ra) # 800084c0 <_ZN11ObjectCache10slab_allocEv>
    8000876c:	00050493          	mv	s1,a0
        was_free = true;
    80008770:	00100a13          	li	s4,1
    80008774:	f95ff06f          	j	80008708 <_ZN11ObjectCache9alloc_objEv+0x34>

0000000080008778 <_ZN11ObjectCachenwEm>:
void* ObjectCache::operator new(size_t size){
    80008778:	ff010113          	addi	sp,sp,-16
    8000877c:	00113423          	sd	ra,8(sp)
    80008780:	00813023          	sd	s0,0(sp)
    80008784:	01010413          	addi	s0,sp,16
    void* addr = SlabAl::getInstance().objcache_cache.alloc_obj();
    80008788:	00001097          	auipc	ra,0x1
    8000878c:	9b4080e7          	jalr	-1612(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80008790:	00000097          	auipc	ra,0x0
    80008794:	f44080e7          	jalr	-188(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
}
    80008798:	00813083          	ld	ra,8(sp)
    8000879c:	00013403          	ld	s0,0(sp)
    800087a0:	01010113          	addi	sp,sp,16
    800087a4:	00008067          	ret

00000000800087a8 <_ZN11ObjectCache8free_objEPv>:
int ObjectCache::free_obj(void* ptr){
    800087a8:	fc010113          	addi	sp,sp,-64
    800087ac:	02113c23          	sd	ra,56(sp)
    800087b0:	02813823          	sd	s0,48(sp)
    800087b4:	02913423          	sd	s1,40(sp)
    800087b8:	03213023          	sd	s2,32(sp)
    800087bc:	01313c23          	sd	s3,24(sp)
    800087c0:	01413823          	sd	s4,16(sp)
    800087c4:	01513423          	sd	s5,8(sp)
    800087c8:	04010413          	addi	s0,sp,64
    800087cc:	00050493          	mv	s1,a0
    800087d0:	00058993          	mv	s3,a1
    Slab* slab_meta = *(Slab**)((uint64)ptr & (-Buddy::BLOCK_SIZE));
    800087d4:	fffff7b7          	lui	a5,0xfffff
    800087d8:	00f5f7b3          	and	a5,a1,a5
    800087dc:	0007b903          	ld	s2,0(a5) # fffffffffffff000 <_user_bss_end+0xffffffff7ffe8fe0>
    if(type == BUFF_SLAB){
    800087e0:	01852703          	lw	a4,24(a0)
    800087e4:	00400793          	li	a5,4
    800087e8:	04f70263          	beq	a4,a5,8000882c <_ZN11ObjectCache8free_objEPv+0x84>
    if(slab_meta->parent != this){
    800087ec:	00093783          	ld	a5,0(s2)
    800087f0:	06978c63          	beq	a5,s1,80008868 <_ZN11ObjectCache8free_objEPv+0xc0>
        error = "Dealocation failed: Object is not from specified cache!!";
    800087f4:	00006797          	auipc	a5,0x6
    800087f8:	03c78793          	addi	a5,a5,60 # 8000e830 <CONSOLE_STATUS+0x820>
    800087fc:	00f4b423          	sd	a5,8(s1)
        return 1;
    80008800:	00100a13          	li	s4,1
}
    80008804:	000a0513          	mv	a0,s4
    80008808:	03813083          	ld	ra,56(sp)
    8000880c:	03013403          	ld	s0,48(sp)
    80008810:	02813483          	ld	s1,40(sp)
    80008814:	02013903          	ld	s2,32(sp)
    80008818:	01813983          	ld	s3,24(sp)
    8000881c:	01013a03          	ld	s4,16(sp)
    80008820:	00813a83          	ld	s5,8(sp)
    80008824:	04010113          	addi	sp,sp,64
    80008828:	00008067          	ret
        slab_meta = find_slab(ptr, part_head);
    8000882c:	02853603          	ld	a2,40(a0)
    80008830:	00000097          	auipc	ra,0x0
    80008834:	98c080e7          	jalr	-1652(ra) # 800081bc <_ZN11ObjectCache9find_slabEPvP6list_t>
    80008838:	00050913          	mv	s2,a0
        if(!slab_meta)
    8000883c:	00050863          	beqz	a0,8000884c <_ZN11ObjectCache8free_objEPv+0xa4>
        if(!slab_meta){
    80008840:	fa0916e3          	bnez	s2,800087ec <_ZN11ObjectCache8free_objEPv+0x44>
             return 2;
    80008844:	00200a13          	li	s4,2
    80008848:	fbdff06f          	j	80008804 <_ZN11ObjectCache8free_objEPv+0x5c>
            slab_meta = find_slab(ptr, full_head);
    8000884c:	0304b603          	ld	a2,48(s1)
    80008850:	00098593          	mv	a1,s3
    80008854:	00048513          	mv	a0,s1
    80008858:	00000097          	auipc	ra,0x0
    8000885c:	964080e7          	jalr	-1692(ra) # 800081bc <_ZN11ObjectCache9find_slabEPvP6list_t>
    80008860:	00050913          	mv	s2,a0
    80008864:	fddff06f          	j	80008840 <_ZN11ObjectCache8free_objEPv+0x98>
    bool full(){ return front == RB_SIZE; }
    80008868:	08894603          	lbu	a2,136(s2)
    8000886c:	f8060613          	addi	a2,a2,-128
    80008870:	00163a93          	seqz	s5,a2
    int ind = slab_meta->put_obj(ptr);
    80008874:	00098593          	mv	a1,s3
    80008878:	00090513          	mv	a0,s2
    8000887c:	00000097          	auipc	ra,0x0
    80008880:	644080e7          	jalr	1604(ra) # 80008ec0 <_ZN4Slab7put_objEPv>
    80008884:	00050a13          	mv	s4,a0
    if(ind){
    80008888:	02051663          	bnez	a0,800088b4 <_ZN11ObjectCache8free_objEPv+0x10c>
    }else if(ctor)
    8000888c:	0484b783          	ld	a5,72(s1)
    80008890:	02078a63          	beqz	a5,800088c4 <_ZN11ObjectCache8free_objEPv+0x11c>
        ctor(ptr);
    80008894:	00098513          	mv	a0,s3
    80008898:	000780e7          	jalr	a5
    list_update_free(slab_meta, was_full);
    8000889c:	000a8613          	mv	a2,s5
    800088a0:	00090593          	mv	a1,s2
    800088a4:	00048513          	mv	a0,s1
    800088a8:	00000097          	auipc	ra,0x0
    800088ac:	820080e7          	jalr	-2016(ra) # 800080c8 <_ZN11ObjectCache16list_update_freeEP4Slabb>
    return 0;
    800088b0:	f55ff06f          	j	80008804 <_ZN11ObjectCache8free_objEPv+0x5c>
        error = "Deallocation failed: invalid deallocation address!";
    800088b4:	00006797          	auipc	a5,0x6
    800088b8:	fbc78793          	addi	a5,a5,-68 # 8000e870 <CONSOLE_STATUS+0x860>
    800088bc:	00f4b423          	sd	a5,8(s1)
        return ind;
    800088c0:	f45ff06f          	j	80008804 <_ZN11ObjectCache8free_objEPv+0x5c>
        zero_out(ptr);
    800088c4:	00098593          	mv	a1,s3
    800088c8:	00048513          	mv	a0,s1
    800088cc:	00000097          	auipc	ra,0x0
    800088d0:	bc0080e7          	jalr	-1088(ra) # 8000848c <_ZN11ObjectCache8zero_outEPv>
    800088d4:	fc9ff06f          	j	8000889c <_ZN11ObjectCache8free_objEPv+0xf4>

00000000800088d8 <_ZN11ObjectCachedlEPv>:
void ObjectCache::operator delete(void* addr){
    800088d8:	fe010113          	addi	sp,sp,-32
    800088dc:	00113c23          	sd	ra,24(sp)
    800088e0:	00813823          	sd	s0,16(sp)
    800088e4:	00913423          	sd	s1,8(sp)
    800088e8:	02010413          	addi	s0,sp,32
    800088ec:	00050493          	mv	s1,a0
    SlabAl::getInstance().objcache_cache.free_obj(addr);
    800088f0:	00001097          	auipc	ra,0x1
    800088f4:	84c080e7          	jalr	-1972(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    800088f8:	00048593          	mv	a1,s1
    800088fc:	00000097          	auipc	ra,0x0
    80008900:	eac080e7          	jalr	-340(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
}
    80008904:	01813083          	ld	ra,24(sp)
    80008908:	01013403          	ld	s0,16(sp)
    8000890c:	00813483          	ld	s1,8(sp)
    80008910:	02010113          	addi	sp,sp,32
    80008914:	00008067          	ret

0000000080008918 <_ZN11ObjectCache6shrinkEv>:
int ObjectCache::shrink(){
    80008918:	fd010113          	addi	sp,sp,-48
    8000891c:	02113423          	sd	ra,40(sp)
    80008920:	02813023          	sd	s0,32(sp)
    80008924:	00913c23          	sd	s1,24(sp)
    80008928:	01213823          	sd	s2,16(sp)
    8000892c:	03010413          	addi	s0,sp,48
    80008930:	00050493          	mv	s1,a0
    if(!free_head){
    80008934:	02053783          	ld	a5,32(a0)
    80008938:	02079863          	bnez	a5,80008968 <_ZN11ObjectCache6shrinkEv+0x50>
        error = "No free slabs!";
    8000893c:	00006797          	auipc	a5,0x6
    80008940:	f6c78793          	addi	a5,a5,-148 # 8000e8a8 <CONSOLE_STATUS+0x898>
    80008944:	00f53423          	sd	a5,8(a0)
        return 1;
    80008948:	00100513          	li	a0,1
    8000894c:	0780006f          	j	800089c4 <_ZN11ObjectCache6shrinkEv+0xac>
            SlabAllocator::getInstance().slab_cache.free_obj(slab);
    80008950:	00000097          	auipc	ra,0x0
    80008954:	7ec080e7          	jalr	2028(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80008958:	00090593          	mv	a1,s2
    8000895c:	05850513          	addi	a0,a0,88
    80008960:	00000097          	auipc	ra,0x0
    80008964:	e48080e7          	jalr	-440(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
    while(free_head){
    80008968:	0204b503          	ld	a0,32(s1)
    8000896c:	04050a63          	beqz	a0,800089c0 <_ZN11ObjectCache6shrinkEv+0xa8>
        Slab* slab = get_list_parent(free_head, Slab, node);
    80008970:	f5850913          	addi	s2,a0,-168
        free_head = remove(free_head);
    80008974:	00002097          	auipc	ra,0x2
    80008978:	0dc080e7          	jalr	220(ra) # 8000aa50 <_Z6removeP6list_t>
    8000897c:	02a4b023          	sd	a0,32(s1)
        get_slab_size(&buddy_level);
    80008980:	fdf40593          	addi	a1,s0,-33
    80008984:	00048513          	mv	a0,s1
    80008988:	fffff097          	auipc	ra,0xfffff
    8000898c:	4e0080e7          	jalr	1248(ra) # 80007e68 <_ZN11ObjectCache13get_slab_sizeEPh>
        Buddy::getInstance().mem_free(slab->addr_start, buddy_level);
    80008990:	ffffe097          	auipc	ra,0xffffe
    80008994:	ef0080e7          	jalr	-272(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    80008998:	fdf44603          	lbu	a2,-33(s0)
    8000899c:	0a093583          	ld	a1,160(s2)
    800089a0:	fffff097          	auipc	ra,0xfffff
    800089a4:	ac0080e7          	jalr	-1344(ra) # 80007460 <_ZN5Buddy8mem_freeEPvh>
        if(type == BUFF_SLAB || type == OFF_SLAB)
    800089a8:	0184a783          	lw	a5,24(s1)
    800089ac:	00400713          	li	a4,4
    800089b0:	fae780e3          	beq	a5,a4,80008950 <_ZN11ObjectCache6shrinkEv+0x38>
    800089b4:	00100713          	li	a4,1
    800089b8:	fae798e3          	bne	a5,a4,80008968 <_ZN11ObjectCache6shrinkEv+0x50>
    800089bc:	f95ff06f          	j	80008950 <_ZN11ObjectCache6shrinkEv+0x38>
    return 0;
    800089c0:	00000513          	li	a0,0
}
    800089c4:	02813083          	ld	ra,40(sp)
    800089c8:	02013403          	ld	s0,32(sp)
    800089cc:	01813483          	ld	s1,24(sp)
    800089d0:	01013903          	ld	s2,16(sp)
    800089d4:	03010113          	addi	sp,sp,48
    800089d8:	00008067          	ret

00000000800089dc <_ZN4SlabC1EhPvP11ObjectCache>:
#include "../../../h/kernel_lib.h"

Slab::Slab(uchar cap, void* addr, ObjectCache* parent){
    800089dc:	fd010113          	addi	sp,sp,-48
    800089e0:	02113423          	sd	ra,40(sp)
    800089e4:	02813023          	sd	s0,32(sp)
    800089e8:	00913c23          	sd	s1,24(sp)
    800089ec:	01213823          	sd	s2,16(sp)
    800089f0:	01313423          	sd	s3,8(sp)
    800089f4:	01413023          	sd	s4,0(sp)
    800089f8:	03010413          	addi	s0,sp,48
    800089fc:	00050493          	mv	s1,a0
    80008a00:	00058913          	mv	s2,a1
    80008a04:	00060a13          	mv	s4,a2
    80008a08:	00068993          	mv	s3,a3
    80008a0c:	00000613          	li	a2,0
    80008a10:	00000593          	li	a1,0
    80008a14:	0a850513          	addi	a0,a0,168
    80008a18:	00002097          	auipc	ra,0x2
    80008a1c:	018080e7          	jalr	24(ra) # 8000aa30 <_ZN6list_tC1EPS_S0_>
    this->cap = cap;
    80008a20:	09248523          	sb	s2,138(s1)
    this->addr_start = (char*)addr;
    80008a24:	0b44b023          	sd	s4,160(s1)
    node.next = node.prev = nullptr;
    80008a28:	0a04b823          	sd	zero,176(s1)
    80008a2c:	0a04b423          	sd	zero,168(s1)
    this->parent = parent;
    80008a30:	0134b023          	sd	s3,0(s1)

    for(uint a = 0; a < cap; a++)
    80008a34:	00000793          	li	a5,0
    80008a38:	0009071b          	sext.w	a4,s2
    80008a3c:	00e7fe63          	bgeu	a5,a4,80008a58 <_ZN4SlabC1EhPvP11ObjectCache+0x7c>
        round_buffer[a] = a;
    80008a40:	02079713          	slli	a4,a5,0x20
    80008a44:	02075713          	srli	a4,a4,0x20
    80008a48:	00e48733          	add	a4,s1,a4
    80008a4c:	00f70423          	sb	a5,8(a4)
    for(uint a = 0; a < cap; a++)
    80008a50:	0017879b          	addiw	a5,a5,1
    80008a54:	fe5ff06f          	j	80008a38 <_ZN4SlabC1EhPvP11ObjectCache+0x5c>
    front = rear = 0;
    80008a58:	080484a3          	sb	zero,137(s1)
    80008a5c:	08048423          	sb	zero,136(s1)
    
    for(uint a = 0; a < (RB_SIZE >> 3); a++){
    80008a60:	00000793          	li	a5,0
    80008a64:	00f00713          	li	a4,15
    80008a68:	00f76e63          	bltu	a4,a5,80008a84 <_ZN4SlabC1EhPvP11ObjectCache+0xa8>
        map[a] = 0;
    80008a6c:	02079713          	slli	a4,a5,0x20
    80008a70:	02075713          	srli	a4,a4,0x20
    80008a74:	00e48733          	add	a4,s1,a4
    80008a78:	080705a3          	sb	zero,139(a4)
    for(uint a = 0; a < (RB_SIZE >> 3); a++){
    80008a7c:	0017879b          	addiw	a5,a5,1
    80008a80:	fe5ff06f          	j	80008a64 <_ZN4SlabC1EhPvP11ObjectCache+0x88>
    }
}
    80008a84:	02813083          	ld	ra,40(sp)
    80008a88:	02013403          	ld	s0,32(sp)
    80008a8c:	01813483          	ld	s1,24(sp)
    80008a90:	01013903          	ld	s2,16(sp)
    80008a94:	00813983          	ld	s3,8(sp)
    80008a98:	00013a03          	ld	s4,0(sp)
    80008a9c:	03010113          	addi	sp,sp,48
    80008aa0:	00008067          	ret

0000000080008aa4 <_ZN4Slab8containsEPv>:
    return ret;
}



bool Slab::contains(void *ptr){
    80008aa4:	ff010113          	addi	sp,sp,-16
    80008aa8:	00813423          	sd	s0,8(sp)
    80008aac:	01010413          	addi	s0,sp,16
    if((char*)ptr < addr_start) return 0;
    80008ab0:	0a053783          	ld	a5,160(a0)
    80008ab4:	02f5e663          	bltu	a1,a5,80008ae0 <_ZN4Slab8containsEPv+0x3c>

    size_t diff = (char*)ptr - addr_start;
    80008ab8:	40f585b3          	sub	a1,a1,a5
    if(diff % parent->objsize
    80008abc:	00053783          	ld	a5,0(a0)
    80008ac0:	0107b783          	ld	a5,16(a5)
    80008ac4:	02f5f733          	remu	a4,a1,a5
    80008ac8:	02071463          	bnez	a4,80008af0 <_ZN4Slab8containsEPv+0x4c>
        || diff > parent->objsize*cap) return 0;
    80008acc:	08a54703          	lbu	a4,138(a0)
    80008ad0:	02e787b3          	mul	a5,a5,a4
    80008ad4:	02b7e263          	bltu	a5,a1,80008af8 <_ZN4Slab8containsEPv+0x54>
    
    return 1;
    80008ad8:	00100513          	li	a0,1
    80008adc:	0080006f          	j	80008ae4 <_ZN4Slab8containsEPv+0x40>
    if((char*)ptr < addr_start) return 0;
    80008ae0:	00000513          	li	a0,0
}
    80008ae4:	00813403          	ld	s0,8(sp)
    80008ae8:	01010113          	addi	sp,sp,16
    80008aec:	00008067          	ret
        || diff > parent->objsize*cap) return 0;
    80008af0:	00000513          	li	a0,0
    80008af4:	ff1ff06f          	j	80008ae4 <_ZN4Slab8containsEPv+0x40>
    80008af8:	00000513          	li	a0,0
    80008afc:	fe9ff06f          	j	80008ae4 <_ZN4Slab8containsEPv+0x40>

0000000080008b00 <_ZN4Slab7get_bitEh>:
}




bool Slab::get_bit(uchar index){
    80008b00:	ff010113          	addi	sp,sp,-16
    80008b04:	00813423          	sd	s0,8(sp)
    80008b08:	01010413          	addi	s0,sp,16
    return map[index >> 3] & (1U << (index & 7U));
    80008b0c:	0035d793          	srli	a5,a1,0x3
    80008b10:	00f50533          	add	a0,a0,a5
    80008b14:	08b54503          	lbu	a0,139(a0)
    80008b18:	0075f593          	andi	a1,a1,7
    80008b1c:	00b5553b          	srlw	a0,a0,a1
}
    80008b20:	00157513          	andi	a0,a0,1
    80008b24:	00813403          	ld	s0,8(sp)
    80008b28:	01010113          	addi	sp,sp,16
    80008b2c:	00008067          	ret

0000000080008b30 <_ZN4Slab10print_infoEc>:
void Slab::print_info(char flag){
    80008b30:	fd010113          	addi	sp,sp,-48
    80008b34:	02113423          	sd	ra,40(sp)
    80008b38:	02813023          	sd	s0,32(sp)
    80008b3c:	00913c23          	sd	s1,24(sp)
    80008b40:	01213823          	sd	s2,16(sp)
    80008b44:	01313423          	sd	s3,8(sp)
    80008b48:	03010413          	addi	s0,sp,48
    80008b4c:	00050913          	mv	s2,a0
    80008b50:	00058993          	mv	s3,a1
    kprintString("Slab info:\n");
    80008b54:	00006517          	auipc	a0,0x6
    80008b58:	d6450513          	addi	a0,a0,-668 # 8000e8b8 <CONSOLE_STATUS+0x8a8>
    80008b5c:	ffffc097          	auipc	ra,0xffffc
    80008b60:	588080e7          	jalr	1416(ra) # 800050e4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(Slab Meta Address, this);
    80008b64:	00006517          	auipc	a0,0x6
    80008b68:	d6450513          	addi	a0,a0,-668 # 8000e8c8 <CONSOLE_STATUS+0x8b8>
    80008b6c:	ffffc097          	auipc	ra,0xffffc
    80008b70:	578080e7          	jalr	1400(ra) # 800050e4 <_Z12kprintStringPKc>
    80008b74:	00000613          	li	a2,0
    80008b78:	01000593          	li	a1,16
    80008b7c:	00090513          	mv	a0,s2
    80008b80:	ffffc097          	auipc	ra,0xffffc
    80008b84:	5ac080e7          	jalr	1452(ra) # 8000512c <_Z9kprintIntmib>
    80008b88:	00005517          	auipc	a0,0x5
    80008b8c:	7d050513          	addi	a0,a0,2000 # 8000e358 <CONSOLE_STATUS+0x348>
    80008b90:	ffffc097          	auipc	ra,0xffffc
    80008b94:	554080e7          	jalr	1364(ra) # 800050e4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(Slab Address, addr_start);
    80008b98:	00006517          	auipc	a0,0x6
    80008b9c:	d4850513          	addi	a0,a0,-696 # 8000e8e0 <CONSOLE_STATUS+0x8d0>
    80008ba0:	ffffc097          	auipc	ra,0xffffc
    80008ba4:	544080e7          	jalr	1348(ra) # 800050e4 <_Z12kprintStringPKc>
    80008ba8:	00000613          	li	a2,0
    80008bac:	01000593          	li	a1,16
    80008bb0:	0a093503          	ld	a0,160(s2)
    80008bb4:	ffffc097          	auipc	ra,0xffffc
    80008bb8:	578080e7          	jalr	1400(ra) # 8000512c <_Z9kprintIntmib>
    80008bbc:	00005517          	auipc	a0,0x5
    80008bc0:	79c50513          	addi	a0,a0,1948 # 8000e358 <CONSOLE_STATUS+0x348>
    80008bc4:	ffffc097          	auipc	ra,0xffffc
    80008bc8:	520080e7          	jalr	1312(ra) # 800050e4 <_Z12kprintStringPKc>
    uchar t = front;
    80008bcc:	08894483          	lbu	s1,136(s2)
    if(flag & pb_mask::FREE){
    80008bd0:	0019f793          	andi	a5,s3,1
    80008bd4:	12078463          	beqz	a5,80008cfc <_ZN4Slab10print_infoEc+0x1cc>
        if(front == rear){
    80008bd8:	08994783          	lbu	a5,137(s2)
    80008bdc:	08978c63          	beq	a5,s1,80008c74 <_ZN4Slab10print_infoEc+0x144>
        if(front != RB_SIZE) 
    80008be0:	08894703          	lbu	a4,136(s2)
    80008be4:	08000793          	li	a5,128
    80008be8:	10f70263          	beq	a4,a5,80008cec <_ZN4Slab10print_infoEc+0x1bc>
            for(;  t < RB_SIZE && t != rear;  t = (t + 1)%cap){
    80008bec:	0184979b          	slliw	a5,s1,0x18
    80008bf0:	4187d79b          	sraiw	a5,a5,0x18
    80008bf4:	0e07cc63          	bltz	a5,80008cec <_ZN4Slab10print_infoEc+0x1bc>
    80008bf8:	08994783          	lbu	a5,137(s2)
    80008bfc:	0e978863          	beq	a5,s1,80008cec <_ZN4Slab10print_infoEc+0x1bc>
                KPRINTARR(FreeSlot, round_buffer[t], 1);
    80008c00:	00006517          	auipc	a0,0x6
    80008c04:	cf050513          	addi	a0,a0,-784 # 8000e8f0 <CONSOLE_STATUS+0x8e0>
    80008c08:	ffffc097          	auipc	ra,0xffffc
    80008c0c:	4dc080e7          	jalr	1244(ra) # 800050e4 <_Z12kprintStringPKc>
    80008c10:	0004849b          	sext.w	s1,s1
    80008c14:	009907b3          	add	a5,s2,s1
    80008c18:	00000613          	li	a2,0
    80008c1c:	00a00593          	li	a1,10
    80008c20:	0087c503          	lbu	a0,8(a5)
    80008c24:	ffffc097          	auipc	ra,0xffffc
    80008c28:	508080e7          	jalr	1288(ra) # 8000512c <_Z9kprintIntmib>
    80008c2c:	00006517          	auipc	a0,0x6
    80008c30:	8a450513          	addi	a0,a0,-1884 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80008c34:	ffffc097          	auipc	ra,0xffffc
    80008c38:	4b0080e7          	jalr	1200(ra) # 800050e4 <_Z12kprintStringPKc>
    80008c3c:	00000613          	li	a2,0
    80008c40:	01000593          	li	a1,16
    80008c44:	00100513          	li	a0,1
    80008c48:	ffffc097          	auipc	ra,0xffffc
    80008c4c:	4e4080e7          	jalr	1252(ra) # 8000512c <_Z9kprintIntmib>
    80008c50:	00005517          	auipc	a0,0x5
    80008c54:	70850513          	addi	a0,a0,1800 # 8000e358 <CONSOLE_STATUS+0x348>
    80008c58:	ffffc097          	auipc	ra,0xffffc
    80008c5c:	48c080e7          	jalr	1164(ra) # 800050e4 <_Z12kprintStringPKc>
            for(;  t < RB_SIZE && t != rear;  t = (t + 1)%cap){
    80008c60:	0014849b          	addiw	s1,s1,1
    80008c64:	08a94783          	lbu	a5,138(s2)
    80008c68:	02f4e4bb          	remw	s1,s1,a5
    80008c6c:	0ff4f493          	andi	s1,s1,255
    80008c70:	f7dff06f          	j	80008bec <_ZN4Slab10print_infoEc+0xbc>
            KPRINTARR(FreeSlot, round_buffer[front], 1);
    80008c74:	00006517          	auipc	a0,0x6
    80008c78:	c7c50513          	addi	a0,a0,-900 # 8000e8f0 <CONSOLE_STATUS+0x8e0>
    80008c7c:	ffffc097          	auipc	ra,0xffffc
    80008c80:	468080e7          	jalr	1128(ra) # 800050e4 <_Z12kprintStringPKc>
    80008c84:	08894783          	lbu	a5,136(s2)
    80008c88:	00f907b3          	add	a5,s2,a5
    80008c8c:	00000613          	li	a2,0
    80008c90:	00a00593          	li	a1,10
    80008c94:	0087c503          	lbu	a0,8(a5)
    80008c98:	ffffc097          	auipc	ra,0xffffc
    80008c9c:	494080e7          	jalr	1172(ra) # 8000512c <_Z9kprintIntmib>
    80008ca0:	00006517          	auipc	a0,0x6
    80008ca4:	83050513          	addi	a0,a0,-2000 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80008ca8:	ffffc097          	auipc	ra,0xffffc
    80008cac:	43c080e7          	jalr	1084(ra) # 800050e4 <_Z12kprintStringPKc>
    80008cb0:	00000613          	li	a2,0
    80008cb4:	01000593          	li	a1,16
    80008cb8:	00100513          	li	a0,1
    80008cbc:	ffffc097          	auipc	ra,0xffffc
    80008cc0:	470080e7          	jalr	1136(ra) # 8000512c <_Z9kprintIntmib>
    80008cc4:	00005517          	auipc	a0,0x5
    80008cc8:	69450513          	addi	a0,a0,1684 # 8000e358 <CONSOLE_STATUS+0x348>
    80008ccc:	ffffc097          	auipc	ra,0xffffc
    80008cd0:	418080e7          	jalr	1048(ra) # 800050e4 <_Z12kprintStringPKc>
            if(cap > 1)
    80008cd4:	08a94703          	lbu	a4,138(s2)
    80008cd8:	00100793          	li	a5,1
    80008cdc:	f0e7f2e3          	bgeu	a5,a4,80008be0 <_ZN4Slab10print_infoEc+0xb0>
                t++;
    80008ce0:	0014849b          	addiw	s1,s1,1
    80008ce4:	0ff4f493          	andi	s1,s1,255
    80008ce8:	ef9ff06f          	j	80008be0 <_ZN4Slab10print_infoEc+0xb0>
        kprintString("\n");
    80008cec:	00005517          	auipc	a0,0x5
    80008cf0:	66c50513          	addi	a0,a0,1644 # 8000e358 <CONSOLE_STATUS+0x348>
    80008cf4:	ffffc097          	auipc	ra,0xffffc
    80008cf8:	3f0080e7          	jalr	1008(ra) # 800050e4 <_Z12kprintStringPKc>
    if(flag & pb_mask::ALLOC){
    80008cfc:	0029f993          	andi	s3,s3,2
    80008d00:	08098663          	beqz	s3,80008d8c <_ZN4Slab10print_infoEc+0x25c>
        for(uint i = 0; i < cap; i++){
    80008d04:	00000493          	li	s1,0
    80008d08:	0640006f          	j	80008d6c <_ZN4Slab10print_infoEc+0x23c>
                KPRINTARR(UsedSlot, i, 1);
    80008d0c:	00006517          	auipc	a0,0x6
    80008d10:	bf450513          	addi	a0,a0,-1036 # 8000e900 <CONSOLE_STATUS+0x8f0>
    80008d14:	ffffc097          	auipc	ra,0xffffc
    80008d18:	3d0080e7          	jalr	976(ra) # 800050e4 <_Z12kprintStringPKc>
    80008d1c:	00000613          	li	a2,0
    80008d20:	00a00593          	li	a1,10
    80008d24:	02049513          	slli	a0,s1,0x20
    80008d28:	02055513          	srli	a0,a0,0x20
    80008d2c:	ffffc097          	auipc	ra,0xffffc
    80008d30:	400080e7          	jalr	1024(ra) # 8000512c <_Z9kprintIntmib>
    80008d34:	00005517          	auipc	a0,0x5
    80008d38:	79c50513          	addi	a0,a0,1948 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80008d3c:	ffffc097          	auipc	ra,0xffffc
    80008d40:	3a8080e7          	jalr	936(ra) # 800050e4 <_Z12kprintStringPKc>
    80008d44:	00000613          	li	a2,0
    80008d48:	01000593          	li	a1,16
    80008d4c:	00100513          	li	a0,1
    80008d50:	ffffc097          	auipc	ra,0xffffc
    80008d54:	3dc080e7          	jalr	988(ra) # 8000512c <_Z9kprintIntmib>
    80008d58:	00005517          	auipc	a0,0x5
    80008d5c:	60050513          	addi	a0,a0,1536 # 8000e358 <CONSOLE_STATUS+0x348>
    80008d60:	ffffc097          	auipc	ra,0xffffc
    80008d64:	384080e7          	jalr	900(ra) # 800050e4 <_Z12kprintStringPKc>
        for(uint i = 0; i < cap; i++){
    80008d68:	0014849b          	addiw	s1,s1,1
    80008d6c:	08a94783          	lbu	a5,138(s2)
    80008d70:	00f4fe63          	bgeu	s1,a5,80008d8c <_ZN4Slab10print_infoEc+0x25c>
            if(get_bit(i)){
    80008d74:	0ff4f593          	andi	a1,s1,255
    80008d78:	00090513          	mv	a0,s2
    80008d7c:	00000097          	auipc	ra,0x0
    80008d80:	d84080e7          	jalr	-636(ra) # 80008b00 <_ZN4Slab7get_bitEh>
    80008d84:	fe0502e3          	beqz	a0,80008d68 <_ZN4Slab10print_infoEc+0x238>
    80008d88:	f85ff06f          	j	80008d0c <_ZN4Slab10print_infoEc+0x1dc>
}
    80008d8c:	02813083          	ld	ra,40(sp)
    80008d90:	02013403          	ld	s0,32(sp)
    80008d94:	01813483          	ld	s1,24(sp)
    80008d98:	01013903          	ld	s2,16(sp)
    80008d9c:	00813983          	ld	s3,8(sp)
    80008da0:	03010113          	addi	sp,sp,48
    80008da4:	00008067          	ret

0000000080008da8 <_ZN4Slab7set_bitEh>:




void Slab::set_bit(uchar index){
    80008da8:	ff010113          	addi	sp,sp,-16
    80008dac:	00813423          	sd	s0,8(sp)
    80008db0:	01010413          	addi	s0,sp,16
    map[index >> 3] |= (1 << (index & 7));
    80008db4:	0035d793          	srli	a5,a1,0x3
    80008db8:	0075f713          	andi	a4,a1,7
    80008dbc:	00100593          	li	a1,1
    80008dc0:	00e595bb          	sllw	a1,a1,a4
    80008dc4:	00f50533          	add	a0,a0,a5
    80008dc8:	08b54783          	lbu	a5,139(a0)
    80008dcc:	00f5e5b3          	or	a1,a1,a5
    80008dd0:	08b505a3          	sb	a1,139(a0)
}
    80008dd4:	00813403          	ld	s0,8(sp)
    80008dd8:	01010113          	addi	sp,sp,16
    80008ddc:	00008067          	ret

0000000080008de0 <_ZN4Slab7get_objEv>:
void* Slab::get_obj(){
    80008de0:	fe010113          	addi	sp,sp,-32
    80008de4:	00113c23          	sd	ra,24(sp)
    80008de8:	00813823          	sd	s0,16(sp)
    80008dec:	00913423          	sd	s1,8(sp)
    80008df0:	01213023          	sd	s2,0(sp)
    80008df4:	02010413          	addi	s0,sp,32
    80008df8:	08854783          	lbu	a5,136(a0)
    if(full()) return nullptr;
    80008dfc:	08000713          	li	a4,128
    80008e00:	06e78e63          	beq	a5,a4,80008e7c <_ZN4Slab7get_objEv+0x9c>
    80008e04:	00050493          	mv	s1,a0
        (void*) (addr_start + round_buffer[front] * parent->objsize);
    80008e08:	0a053903          	ld	s2,160(a0)
    80008e0c:	00f507b3          	add	a5,a0,a5
    80008e10:	0087c583          	lbu	a1,8(a5)
    80008e14:	00053783          	ld	a5,0(a0)
    80008e18:	0107b783          	ld	a5,16(a5)
    80008e1c:	02f587b3          	mul	a5,a1,a5
    void* ret = 
    80008e20:	00f90933          	add	s2,s2,a5
    set_bit(round_buffer[front]);
    80008e24:	00000097          	auipc	ra,0x0
    80008e28:	f84080e7          	jalr	-124(ra) # 80008da8 <_ZN4Slab7set_bitEh>
    front = front+1;
    80008e2c:	0884c783          	lbu	a5,136(s1)
    80008e30:	0017879b          	addiw	a5,a5,1
    80008e34:	0ff7f793          	andi	a5,a5,255
    80008e38:	08f48423          	sb	a5,136(s1)
    if(front >= cap) front = 0;
    80008e3c:	08a4c703          	lbu	a4,138(s1)
    80008e40:	00e7e463          	bltu	a5,a4,80008e48 <_ZN4Slab7get_objEv+0x68>
    80008e44:	08048423          	sb	zero,136(s1)
    if(front == rear) front = RB_SIZE;
    80008e48:	0884c703          	lbu	a4,136(s1)
    80008e4c:	0894c783          	lbu	a5,137(s1)
    80008e50:	02f70063          	beq	a4,a5,80008e70 <_ZN4Slab7get_objEv+0x90>
}
    80008e54:	00090513          	mv	a0,s2
    80008e58:	01813083          	ld	ra,24(sp)
    80008e5c:	01013403          	ld	s0,16(sp)
    80008e60:	00813483          	ld	s1,8(sp)
    80008e64:	00013903          	ld	s2,0(sp)
    80008e68:	02010113          	addi	sp,sp,32
    80008e6c:	00008067          	ret
    if(front == rear) front = RB_SIZE;
    80008e70:	f8000793          	li	a5,-128
    80008e74:	08f48423          	sb	a5,136(s1)
    80008e78:	fddff06f          	j	80008e54 <_ZN4Slab7get_objEv+0x74>
    if(full()) return nullptr;
    80008e7c:	00000913          	li	s2,0
    80008e80:	fd5ff06f          	j	80008e54 <_ZN4Slab7get_objEv+0x74>

0000000080008e84 <_ZN4Slab9clear_bitEh>:




void Slab::clear_bit(uchar index){
    80008e84:	ff010113          	addi	sp,sp,-16
    80008e88:	00813423          	sd	s0,8(sp)
    80008e8c:	01010413          	addi	s0,sp,16
    map[index >> 3] &= ~(1 << (index & 7));
    80008e90:	0035d793          	srli	a5,a1,0x3
    80008e94:	0075f713          	andi	a4,a1,7
    80008e98:	00100593          	li	a1,1
    80008e9c:	00e595bb          	sllw	a1,a1,a4
    80008ea0:	00f50533          	add	a0,a0,a5
    80008ea4:	fff5c593          	not	a1,a1
    80008ea8:	08b54783          	lbu	a5,139(a0)
    80008eac:	00f5f5b3          	and	a1,a1,a5
    80008eb0:	08b505a3          	sb	a1,139(a0)
}
    80008eb4:	00813403          	ld	s0,8(sp)
    80008eb8:	01010113          	addi	sp,sp,16
    80008ebc:	00008067          	ret

0000000080008ec0 <_ZN4Slab7put_objEPv>:
    bool free(){ return rear == front; }
    80008ec0:	08954783          	lbu	a5,137(a0)
    80008ec4:	08854703          	lbu	a4,136(a0)
    if(free()) return -4;
    80008ec8:	0cf70663          	beq	a4,a5,80008f94 <_ZN4Slab7put_objEPv+0xd4>
    if((char*)ptr < addr_start) return -1;
    80008ecc:	0a053783          	ld	a5,160(a0)
    80008ed0:	0cf5e663          	bltu	a1,a5,80008f9c <_ZN4Slab7put_objEPv+0xdc>
int Slab::put_obj(void *ptr){
    80008ed4:	fd010113          	addi	sp,sp,-48
    80008ed8:	02113423          	sd	ra,40(sp)
    80008edc:	02813023          	sd	s0,32(sp)
    80008ee0:	00913c23          	sd	s1,24(sp)
    80008ee4:	01213823          	sd	s2,16(sp)
    80008ee8:	01313423          	sd	s3,8(sp)
    80008eec:	01413023          	sd	s4,0(sp)
    80008ef0:	03010413          	addi	s0,sp,48
    size_t diff = (char*)ptr - addr_start;
    80008ef4:	40f587b3          	sub	a5,a1,a5
    if(diff % parent->objsize
    80008ef8:	00053a03          	ld	s4,0(a0)
    80008efc:	010a3903          	ld	s2,16(s4)
    80008f00:	0327f733          	remu	a4,a5,s2
    80008f04:	0a071063          	bnez	a4,80008fa4 <_ZN4Slab7put_objEPv+0xe4>
        || diff > parent->objsize*cap) return -2;
    80008f08:	08a54703          	lbu	a4,138(a0)
    80008f0c:	02e90733          	mul	a4,s2,a4
    80008f10:	08f76e63          	bltu	a4,a5,80008fac <_ZN4Slab7put_objEPv+0xec>
    80008f14:	00058993          	mv	s3,a1
    80008f18:	00050493          	mv	s1,a0
    size_t num = diff/parent->objsize;
    80008f1c:	0327d7b3          	divu	a5,a5,s2
    if(!get_bit(num)) return -5;
    80008f20:	0ff7f913          	andi	s2,a5,255
    80008f24:	00090593          	mv	a1,s2
    80008f28:	00000097          	auipc	ra,0x0
    80008f2c:	bd8080e7          	jalr	-1064(ra) # 80008b00 <_ZN4Slab7get_bitEh>
    80008f30:	08050263          	beqz	a0,80008fb4 <_ZN4Slab7put_objEPv+0xf4>
    if(parent->dtor) parent->dtor(ptr);
    80008f34:	050a3783          	ld	a5,80(s4)
    80008f38:	00078663          	beqz	a5,80008f44 <_ZN4Slab7put_objEPv+0x84>
    80008f3c:	00098513          	mv	a0,s3
    80008f40:	000780e7          	jalr	a5
    clear_bit(num);
    80008f44:	00090593          	mv	a1,s2
    80008f48:	00048513          	mv	a0,s1
    80008f4c:	00000097          	auipc	ra,0x0
    80008f50:	f38080e7          	jalr	-200(ra) # 80008e84 <_ZN4Slab9clear_bitEh>
    round_buffer[rear] = num;
    80008f54:	0894c783          	lbu	a5,137(s1)
    80008f58:	00f48733          	add	a4,s1,a5
    80008f5c:	01270423          	sb	s2,8(a4)
    if(front == RB_SIZE) front = rear;
    80008f60:	0884c683          	lbu	a3,136(s1)
    80008f64:	08000713          	li	a4,128
    80008f68:	02e68263          	beq	a3,a4,80008f8c <_ZN4Slab7put_objEPv+0xcc>
    rear = rear+1;
    80008f6c:	0017879b          	addiw	a5,a5,1
    80008f70:	0ff7f793          	andi	a5,a5,255
    80008f74:	08f484a3          	sb	a5,137(s1)
    if(rear >= cap) rear = 0;
    80008f78:	08a4c703          	lbu	a4,138(s1)
    80008f7c:	04e7e063          	bltu	a5,a4,80008fbc <_ZN4Slab7put_objEPv+0xfc>
    80008f80:	080484a3          	sb	zero,137(s1)
    return 0;
    80008f84:	00000513          	li	a0,0
    80008f88:	0380006f          	j	80008fc0 <_ZN4Slab7put_objEPv+0x100>
    if(front == RB_SIZE) front = rear;
    80008f8c:	08f48423          	sb	a5,136(s1)
    80008f90:	fddff06f          	j	80008f6c <_ZN4Slab7put_objEPv+0xac>
    if(free()) return -4;
    80008f94:	ffc00513          	li	a0,-4
    80008f98:	00008067          	ret
    if((char*)ptr < addr_start) return -1;
    80008f9c:	fff00513          	li	a0,-1
}
    80008fa0:	00008067          	ret
        || diff > parent->objsize*cap) return -2;
    80008fa4:	ffe00513          	li	a0,-2
    80008fa8:	0180006f          	j	80008fc0 <_ZN4Slab7put_objEPv+0x100>
    80008fac:	ffe00513          	li	a0,-2
    80008fb0:	0100006f          	j	80008fc0 <_ZN4Slab7put_objEPv+0x100>
    if(!get_bit(num)) return -5;
    80008fb4:	ffb00513          	li	a0,-5
    80008fb8:	0080006f          	j	80008fc0 <_ZN4Slab7put_objEPv+0x100>
    return 0;
    80008fbc:	00000513          	li	a0,0
}
    80008fc0:	02813083          	ld	ra,40(sp)
    80008fc4:	02013403          	ld	s0,32(sp)
    80008fc8:	01813483          	ld	s1,24(sp)
    80008fcc:	01013903          	ld	s2,16(sp)
    80008fd0:	00813983          	ld	s3,8(sp)
    80008fd4:	00013a03          	ld	s4,0(sp)
    80008fd8:	03010113          	addi	sp,sp,48
    80008fdc:	00008067          	ret

0000000080008fe0 <_ZN13SlabAllocatorC1Ev>:
        , "smb_cache_14", "smb_cache_15", "smb_cache_16"
        , "smb_cache_17" };



SlabAllocator::SlabAllocator():objcache_cache("objcache_cache", sizeof(ObjectCache),nullptr,nullptr),
    80008fe0:	f7010113          	addi	sp,sp,-144
    80008fe4:	08113423          	sd	ra,136(sp)
    80008fe8:	08813023          	sd	s0,128(sp)
    80008fec:	06913c23          	sd	s1,120(sp)
    80008ff0:	07213823          	sd	s2,112(sp)
    80008ff4:	07313423          	sd	s3,104(sp)
    80008ff8:	09010413          	addi	s0,sp,144
    80008ffc:	00050993          	mv	s3,a0
    slab_cache("slab_meta_cache", sizeof(Slab), nullptr, nullptr, SMT::SLAB_SLAB){
    80009000:	00000793          	li	a5,0
    80009004:	00000713          	li	a4,0
    80009008:	00000693          	li	a3,0
    8000900c:	05800613          	li	a2,88
    80009010:	00006597          	auipc	a1,0x6
    80009014:	90058593          	addi	a1,a1,-1792 # 8000e910 <CONSOLE_STATUS+0x900>
    80009018:	fffff097          	auipc	ra,0xfffff
    8000901c:	f44080e7          	jalr	-188(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009020:	00200793          	li	a5,2
    80009024:	00000713          	li	a4,0
    80009028:	00000693          	li	a3,0
    8000902c:	0b800613          	li	a2,184
    80009030:	00006597          	auipc	a1,0x6
    80009034:	8f058593          	addi	a1,a1,-1808 # 8000e920 <CONSOLE_STATUS+0x910>
    80009038:	05898513          	addi	a0,s3,88
    8000903c:	fffff097          	auipc	ra,0xfffff
    80009040:	f20080e7          	jalr	-224(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009044:	0b098913          	addi	s2,s3,176
    80009048:	00c00493          	li	s1,12
    8000904c:	0200006f          	j	8000906c <_ZN13SlabAllocatorC1Ev+0x8c>
        SLAB_SLAB ,
        ON_SLAB,
        BUFF_SLAB
    };

    ObjectCache() = default;
    80009050:	00000613          	li	a2,0
    80009054:	00000593          	li	a1,0
    80009058:	03890513          	addi	a0,s2,56
    8000905c:	00002097          	auipc	ra,0x2
    80009060:	9d4080e7          	jalr	-1580(ra) # 8000aa30 <_ZN6list_tC1EPS_S0_>
    80009064:	05890913          	addi	s2,s2,88
    80009068:	fff48493          	addi	s1,s1,-1
    8000906c:	fe04d2e3          	bgez	s1,80009050 <_ZN13SlabAllocatorC1Ev+0x70>

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    80009070:	00500913          	li	s2,5
    80009074:	0a40006f          	j	80009118 <_ZN13SlabAllocatorC1Ev+0x138>
        smb_caches[i-MIN_BUFFER_ORDER] = 
            ObjectCache(buff_cache_names[i-MIN_BUFFER_ORDER], 1 << i
    80009078:	ffb9049b          	addiw	s1,s2,-5
    8000907c:	00349793          	slli	a5,s1,0x3
    80009080:	0000a597          	auipc	a1,0xa
    80009084:	96858593          	addi	a1,a1,-1688 # 800129e8 <_ZN13SlabAllocator16buff_cache_namesE>
    80009088:	00f585b3          	add	a1,a1,a5
    8000908c:	00400793          	li	a5,4
    80009090:	00000713          	li	a4,0
    80009094:	00000693          	li	a3,0
    80009098:	00100613          	li	a2,1
    8000909c:	0126163b          	sllw	a2,a2,s2
    800090a0:	0005b583          	ld	a1,0(a1)
    800090a4:	f7840513          	addi	a0,s0,-136
    800090a8:	fffff097          	auipc	ra,0xfffff
    800090ac:	eb4080e7          	jalr	-332(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
        smb_caches[i-MIN_BUFFER_ORDER] = 
    800090b0:	05800793          	li	a5,88
    800090b4:	02f487b3          	mul	a5,s1,a5
    800090b8:	00f987b3          	add	a5,s3,a5
    800090bc:	f7843703          	ld	a4,-136(s0)
    800090c0:	0ae7b823          	sd	a4,176(a5)
    800090c4:	f8043703          	ld	a4,-128(s0)
    800090c8:	0ae7bc23          	sd	a4,184(a5)
    800090cc:	f8843703          	ld	a4,-120(s0)
    800090d0:	0ce7b023          	sd	a4,192(a5)
    800090d4:	f9043703          	ld	a4,-112(s0)
    800090d8:	0ce7b423          	sd	a4,200(a5)
    800090dc:	f9843703          	ld	a4,-104(s0)
    800090e0:	0ce7b823          	sd	a4,208(a5)
    800090e4:	fa043703          	ld	a4,-96(s0)
    800090e8:	0ce7bc23          	sd	a4,216(a5)
    800090ec:	fa843703          	ld	a4,-88(s0)
    800090f0:	0ee7b023          	sd	a4,224(a5)
    800090f4:	fb043703          	ld	a4,-80(s0)
    800090f8:	0ee7b423          	sd	a4,232(a5)
    800090fc:	fb843703          	ld	a4,-72(s0)
    80009100:	0ee7b823          	sd	a4,240(a5)
    80009104:	fc043703          	ld	a4,-64(s0)
    80009108:	0ee7bc23          	sd	a4,248(a5)
    8000910c:	fc843703          	ld	a4,-56(s0)
    80009110:	10e7b023          	sd	a4,256(a5)
    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    80009114:	0019091b          	addiw	s2,s2,1
    80009118:	01100793          	li	a5,17
    8000911c:	f527dee3          	bge	a5,s2,80009078 <_ZN13SlabAllocatorC1Ev+0x98>
                , nullptr, nullptr, SMT::BUFF_SLAB);

}
    80009120:	08813083          	ld	ra,136(sp)
    80009124:	08013403          	ld	s0,128(sp)
    80009128:	07813483          	ld	s1,120(sp)
    8000912c:	07013903          	ld	s2,112(sp)
    80009130:	06813983          	ld	s3,104(sp)
    80009134:	09010113          	addi	sp,sp,144
    80009138:	00008067          	ret

000000008000913c <_ZN13SlabAllocator11getInstanceEv>:



SlabAllocator& SlabAllocator::getInstance(){
    
    if(!allocator) { allocator = new SlabAllocator; }
    8000913c:	0000b797          	auipc	a5,0xb
    80009140:	27c78793          	addi	a5,a5,636 # 800143b8 <_ZN13SlabAllocator9allocatorE>
    80009144:	0007b783          	ld	a5,0(a5)
    80009148:	00078a63          	beqz	a5,8000915c <_ZN13SlabAllocator11getInstanceEv+0x20>

    return *allocator;
}
    8000914c:	0000b797          	auipc	a5,0xb
    80009150:	26c78793          	addi	a5,a5,620 # 800143b8 <_ZN13SlabAllocator9allocatorE>
    80009154:	0007b503          	ld	a0,0(a5)
    80009158:	00008067          	ret
SlabAllocator& SlabAllocator::getInstance(){
    8000915c:	fe010113          	addi	sp,sp,-32
    80009160:	00113c23          	sd	ra,24(sp)
    80009164:	00813823          	sd	s0,16(sp)
    80009168:	00913423          	sd	s1,8(sp)
    8000916c:	02010413          	addi	s0,sp,32
    __NOALLOC_OPERATORS__
    80009170:	53000513          	li	a0,1328
    80009174:	fffff097          	auipc	ra,0xfffff
    80009178:	c44080e7          	jalr	-956(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000917c:	00050493          	mv	s1,a0
    if(!allocator) { allocator = new SlabAllocator; }
    80009180:	00000097          	auipc	ra,0x0
    80009184:	e60080e7          	jalr	-416(ra) # 80008fe0 <_ZN13SlabAllocatorC1Ev>
    80009188:	0000b797          	auipc	a5,0xb
    8000918c:	2297b823          	sd	s1,560(a5) # 800143b8 <_ZN13SlabAllocator9allocatorE>
}
    80009190:	0000b797          	auipc	a5,0xb
    80009194:	22878793          	addi	a5,a5,552 # 800143b8 <_ZN13SlabAllocator9allocatorE>
    80009198:	0007b503          	ld	a0,0(a5)
    8000919c:	01813083          	ld	ra,24(sp)
    800091a0:	01013403          	ld	s0,16(sp)
    800091a4:	00813483          	ld	s1,8(sp)
    800091a8:	02010113          	addi	sp,sp,32
    800091ac:	00008067          	ret

00000000800091b0 <_ZN13SlabAllocator11print_stateEc>:



void SlabAllocator::print_state(char flags){
    800091b0:	fd010113          	addi	sp,sp,-48
    800091b4:	02113423          	sd	ra,40(sp)
    800091b8:	02813023          	sd	s0,32(sp)
    800091bc:	00913c23          	sd	s1,24(sp)
    800091c0:	01213823          	sd	s2,16(sp)
    800091c4:	01313423          	sd	s3,8(sp)
    800091c8:	03010413          	addi	s0,sp,48
    800091cc:	00050913          	mv	s2,a0
    800091d0:	00058993          	mv	s3,a1

    objcache_cache.printInfo(flags);
    800091d4:	fffff097          	auipc	ra,0xfffff
    800091d8:	054080e7          	jalr	84(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>
    slab_cache.printInfo(flags);
    800091dc:	00098593          	mv	a1,s3
    800091e0:	05890513          	addi	a0,s2,88
    800091e4:	fffff097          	auipc	ra,0xfffff
    800091e8:	044080e7          	jalr	68(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    800091ec:	00500493          	li	s1,5
    800091f0:	0280006f          	j	80009218 <_ZN13SlabAllocator11print_stateEc+0x68>
        smb_caches[i - MIN_BUFFER_ORDER].printInfo(flags);
    800091f4:	ffb4851b          	addiw	a0,s1,-5
    800091f8:	05800793          	li	a5,88
    800091fc:	02f50533          	mul	a0,a0,a5
    80009200:	0b050513          	addi	a0,a0,176
    80009204:	00098593          	mv	a1,s3
    80009208:	00a90533          	add	a0,s2,a0
    8000920c:	fffff097          	auipc	ra,0xfffff
    80009210:	01c080e7          	jalr	28(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>
    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    80009214:	0014849b          	addiw	s1,s1,1
    80009218:	01100793          	li	a5,17
    8000921c:	fc97dce3          	bge	a5,s1,800091f4 <_ZN13SlabAllocator11print_stateEc+0x44>

}
    80009220:	02813083          	ld	ra,40(sp)
    80009224:	02013403          	ld	s0,32(sp)
    80009228:	01813483          	ld	s1,24(sp)
    8000922c:	01013903          	ld	s2,16(sp)
    80009230:	00813983          	ld	s3,8(sp)
    80009234:	03010113          	addi	sp,sp,48
    80009238:	00008067          	ret

000000008000923c <_ZN13SlabAllocator7kmallocEm>:



void* SlabAllocator::kmalloc(size_t size){
    if(size == 0)
    8000923c:	06058a63          	beqz	a1,800092b0 <_ZN13SlabAllocator7kmallocEm+0x74>
void* SlabAllocator::kmalloc(size_t size){
    80009240:	fe010113          	addi	sp,sp,-32
    80009244:	00113c23          	sd	ra,24(sp)
    80009248:	00813823          	sd	s0,16(sp)
    8000924c:	00913423          	sd	s1,8(sp)
    80009250:	02010413          	addi	s0,sp,32
    80009254:	00050493          	mv	s1,a0
        return nullptr;
    
    uchar size_order = log2(size - 1) + 1;
    80009258:	fff58513          	addi	a0,a1,-1
    8000925c:	ffffd097          	auipc	ra,0xffffd
    80009260:	840080e7          	jalr	-1984(ra) # 80005a9c <_Z4log2m>
    80009264:	0015079b          	addiw	a5,a0,1
    80009268:	0ff7f793          	andi	a5,a5,255
    if(size_order > 17)
    8000926c:	01100713          	li	a4,17
    80009270:	04f76463          	bltu	a4,a5,800092b8 <_ZN13SlabAllocator7kmallocEm+0x7c>
        return nullptr;
    
    if(size_order < 5)
    80009274:	00400713          	li	a4,4
    80009278:	00f76463          	bltu	a4,a5,80009280 <_ZN13SlabAllocator7kmallocEm+0x44>
        size_order = 5;
    8000927c:	00500793          	li	a5,5

    return smb_caches[size_order-5].alloc_obj();
    80009280:	ffb7879b          	addiw	a5,a5,-5
    80009284:	05800513          	li	a0,88
    80009288:	02a787b3          	mul	a5,a5,a0
    8000928c:	0b078793          	addi	a5,a5,176
    80009290:	00f48533          	add	a0,s1,a5
    80009294:	fffff097          	auipc	ra,0xfffff
    80009298:	440080e7          	jalr	1088(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
}
    8000929c:	01813083          	ld	ra,24(sp)
    800092a0:	01013403          	ld	s0,16(sp)
    800092a4:	00813483          	ld	s1,8(sp)
    800092a8:	02010113          	addi	sp,sp,32
    800092ac:	00008067          	ret
        return nullptr;
    800092b0:	00000513          	li	a0,0
}
    800092b4:	00008067          	ret
        return nullptr;
    800092b8:	00000513          	li	a0,0
    800092bc:	fe1ff06f          	j	8000929c <_ZN13SlabAllocator7kmallocEm+0x60>

00000000800092c0 <_ZN13SlabAllocator5kfreeEPv>:



int SlabAllocator::kfree(void* p){
    800092c0:	fd010113          	addi	sp,sp,-48
    800092c4:	02113423          	sd	ra,40(sp)
    800092c8:	02813023          	sd	s0,32(sp)
    800092cc:	00913c23          	sd	s1,24(sp)
    800092d0:	01213823          	sd	s2,16(sp)
    800092d4:	01313423          	sd	s3,8(sp)
    800092d8:	01413023          	sd	s4,0(sp)
    800092dc:	03010413          	addi	s0,sp,48
    800092e0:	00058a13          	mv	s4,a1
    for(ObjectCache& smb_cache: smb_caches){
    800092e4:	0b050493          	addi	s1,a0,176
    800092e8:	52850993          	addi	s3,a0,1320
    800092ec:	03348a63          	beq	s1,s3,80009320 <_ZN13SlabAllocator5kfreeEPv+0x60>
        if(!smb_cache.free_obj(p)){
    800092f0:	000a0593          	mv	a1,s4
    800092f4:	00048513          	mv	a0,s1
    800092f8:	fffff097          	auipc	ra,0xfffff
    800092fc:	4b0080e7          	jalr	1200(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
    80009300:	00050913          	mv	s2,a0
    80009304:	00050663          	beqz	a0,80009310 <_ZN13SlabAllocator5kfreeEPv+0x50>
    for(ObjectCache& smb_cache: smb_caches){
    80009308:	05848493          	addi	s1,s1,88
    8000930c:	fe1ff06f          	j	800092ec <_ZN13SlabAllocator5kfreeEPv+0x2c>
            smb_cache.shrink();
    80009310:	00048513          	mv	a0,s1
    80009314:	fffff097          	auipc	ra,0xfffff
    80009318:	604080e7          	jalr	1540(ra) # 80008918 <_ZN11ObjectCache6shrinkEv>
            return 0;
    8000931c:	0080006f          	j	80009324 <_ZN13SlabAllocator5kfreeEPv+0x64>
        }
    }
    return 1;
    80009320:	00100913          	li	s2,1
}
    80009324:	00090513          	mv	a0,s2
    80009328:	02813083          	ld	ra,40(sp)
    8000932c:	02013403          	ld	s0,32(sp)
    80009330:	01813483          	ld	s1,24(sp)
    80009334:	01013903          	ld	s2,16(sp)
    80009338:	00813983          	ld	s3,8(sp)
    8000933c:	00013a03          	ld	s4,0(sp)
    80009340:	03010113          	addi	sp,sp,48
    80009344:	00008067          	ret

0000000080009348 <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80009348:	ff010113          	addi	sp,sp,-16
    8000934c:	00813423          	sd	s0,8(sp)
    80009350:	01010413          	addi	s0,sp,16
    80009354:	00100793          	li	a5,1
    80009358:	00f50863          	beq	a0,a5,80009368 <_Z41__static_initialization_and_destruction_0ii+0x20>
    8000935c:	00813403          	ld	s0,8(sp)
    80009360:	01010113          	addi	sp,sp,16
    80009364:	00008067          	ret
    80009368:	000107b7          	lui	a5,0x10
    8000936c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80009370:	fef596e3          	bne	a1,a5,8000935c <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80009374:	00005797          	auipc	a5,0x5
    80009378:	c9c78793          	addi	a5,a5,-868 # 8000e010 <CONSOLE_STATUS>
    8000937c:	0007b783          	ld	a5,0(a5)
    80009380:	0000b717          	auipc	a4,0xb
    80009384:	06f73c23          	sd	a5,120(a4) # 800143f8 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80009388:	00005797          	auipc	a5,0x5
    8000938c:	c7878793          	addi	a5,a5,-904 # 8000e000 <CONSOLE_RX_DATA>
    80009390:	0007b783          	ld	a5,0(a5)
    80009394:	0000b717          	auipc	a4,0xb
    80009398:	04f73e23          	sd	a5,92(a4) # 800143f0 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    8000939c:	00005797          	auipc	a5,0x5
    800093a0:	c6c78793          	addi	a5,a5,-916 # 8000e008 <CONSOLE_TX_DATA>
    800093a4:	0007b783          	ld	a5,0(a5)
    800093a8:	0000b717          	auipc	a4,0xb
    800093ac:	04f73023          	sd	a5,64(a4) # 800143e8 <_ZN5StdIO5odataE>
    800093b0:	fadff06f          	j	8000935c <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800093b4 <_ZN5StdIO12outputWorkerEPv>:
{
    800093b4:	fc010113          	addi	sp,sp,-64
    800093b8:	02113c23          	sd	ra,56(sp)
    800093bc:	02813823          	sd	s0,48(sp)
    800093c0:	02913423          	sd	s1,40(sp)
    800093c4:	03213023          	sd	s2,32(sp)
    800093c8:	01313c23          	sd	s3,24(sp)
    800093cc:	01413823          	sd	s4,16(sp)
    800093d0:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    800093d4:	0000b797          	auipc	a5,0xb
    800093d8:	fe07ba23          	sd	zero,-12(a5) # 800143c8 <_ZN5StdIO10out_threadE>
    800093dc:	0400006f          	j	8000941c <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800093e0:	100027f3          	csrr	a5,sstatus
    800093e4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800093e8:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800093ec:	141027f3          	csrr	a5,sepc
    800093f0:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800093f4:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    800093f8:	0000b797          	auipc	a5,0xb
    800093fc:	f8878793          	addi	a5,a5,-120 # 80014380 <_ZN3TCB7runningE>
    80009400:	0007b783          	ld	a5,0(a5)
    80009404:	0000b717          	auipc	a4,0xb
    80009408:	fcf73223          	sd	a5,-60(a4) # 800143c8 <_ZN5StdIO10out_threadE>
            TCB::yield();
    8000940c:	ffffb097          	auipc	ra,0xffffb
    80009410:	7fc080e7          	jalr	2044(ra) # 80004c08 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80009414:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80009418:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    8000941c:	0000b797          	auipc	a5,0xb
    80009420:	fdc78793          	addi	a5,a5,-36 # 800143f8 <_ZN5StdIO8iostatusE>
    80009424:	0007b783          	ld	a5,0(a5)
    80009428:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    8000942c:	0207f793          	andi	a5,a5,32
    80009430:	fa0788e3          	beqz	a5,800093e0 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80009434:	0000b797          	auipc	a5,0xb
    80009438:	fa478793          	addi	a5,a5,-92 # 800143d8 <_ZN5StdIO7obufferE>
    8000943c:	0007b483          	ld	s1,0(a5)
    80009440:	0000b797          	auipc	a5,0xb
    80009444:	fa878793          	addi	a5,a5,-88 # 800143e8 <_ZN5StdIO5odataE>
    80009448:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    8000944c:	42848513          	addi	a0,s1,1064
    80009450:	ffffb097          	auipc	ra,0xffffb
    80009454:	e28080e7          	jalr	-472(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80009458:	40048913          	addi	s2,s1,1024
    8000945c:	00090513          	mv	a0,s2
    80009460:	ffffb097          	auipc	ra,0xffffb
    80009464:	e18080e7          	jalr	-488(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80009468:	4804a783          	lw	a5,1152(s1)
    8000946c:	fff7879b          	addiw	a5,a5,-1
    80009470:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80009474:	4784a783          	lw	a5,1144(s1)
    80009478:	00f48733          	add	a4,s1,a5
    8000947c:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80009480:	0017879b          	addiw	a5,a5,1
    80009484:	41f7d71b          	sraiw	a4,a5,0x1f
    80009488:	0167571b          	srliw	a4,a4,0x16
    8000948c:	00e787bb          	addw	a5,a5,a4
    80009490:	3ff7f793          	andi	a5,a5,1023
    80009494:	40e787bb          	subw	a5,a5,a4
    80009498:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    8000949c:	45048513          	addi	a0,s1,1104
    800094a0:	ffffb097          	auipc	ra,0xffffb
    800094a4:	e5c080e7          	jalr	-420(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800094a8:	00090513          	mv	a0,s2
    800094ac:	ffffb097          	auipc	ra,0xffffb
    800094b0:	e50080e7          	jalr	-432(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    800094b4:	01498023          	sb	s4,0(s3)
    800094b8:	f65ff06f          	j	8000941c <_ZN5StdIO12outputWorkerEPv+0x68>

00000000800094bc <_ZN5StdIO9initalizeEv>:
{
    800094bc:	fe010113          	addi	sp,sp,-32
    800094c0:	00113c23          	sd	ra,24(sp)
    800094c4:	00813823          	sd	s0,16(sp)
    800094c8:	00913423          	sd	s1,8(sp)
    800094cc:	01213023          	sd	s2,0(sp)
    800094d0:	02010413          	addi	s0,sp,32
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    800094d4:	0000b797          	auipc	a5,0xb
    800094d8:	eec78793          	addi	a5,a5,-276 # 800143c0 <_ZN12SharedBufferIcE5cacheE>
    800094dc:	0007b783          	ld	a5,0(a5)
    800094e0:	20078063          	beqz	a5,800096e0 <_ZN5StdIO9initalizeEv+0x224>
    800094e4:	0000b497          	auipc	s1,0xb
    800094e8:	edc48493          	addi	s1,s1,-292 # 800143c0 <_ZN12SharedBufferIcE5cacheE>
    800094ec:	0004b503          	ld	a0,0(s1)
    800094f0:	fffff097          	auipc	ra,0xfffff
    800094f4:	1e4080e7          	jalr	484(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    800094f8:	40050713          	addi	a4,a0,1024
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)

    KSemaphore(unsigned val):val(val)
    800094fc:	00100793          	li	a5,1
    80009500:	40f52423          	sw	a5,1032(a0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80009504:	40053823          	sd	zero,1040(a0)
    80009508:	40053c23          	sd	zero,1048(a0)
    8000950c:	42052023          	sw	zero,1056(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80009510:	0000b797          	auipc	a5,0xb
    80009514:	e4878793          	addi	a5,a5,-440 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80009518:	0007b683          	ld	a3,0(a5)
    8000951c:	40d53023          	sd	a3,1024(a0)
    80009520:	42850693          	addi	a3,a0,1064
    KSemaphore(unsigned val):val(val)
    80009524:	42052823          	sw	zero,1072(a0)
    80009528:	42053c23          	sd	zero,1080(a0)
    8000952c:	44053023          	sd	zero,1088(a0)
    80009530:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    80009534:	42e53423          	sd	a4,1064(a0)
    80009538:	45050713          	addi	a4,a0,1104
    KSemaphore(unsigned val):val(val)
    8000953c:	40000613          	li	a2,1024
    80009540:	44c52c23          	sw	a2,1112(a0)
    80009544:	46053023          	sd	zero,1120(a0)
    80009548:	46053423          	sd	zero,1128(a0)
    8000954c:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    80009550:	44d53823          	sd	a3,1104(a0)
        activeSemaphores = this;
    80009554:	00e7b023          	sd	a4,0(a5)
    80009558:	46052c23          	sw	zero,1144(a0)
    8000955c:	46052e23          	sw	zero,1148(a0)
    80009560:	48052023          	sw	zero,1152(a0)
    ibuffer = new SharedBuffer<char>();
    80009564:	0000b797          	auipc	a5,0xb
    80009568:	e6a7be23          	sd	a0,-388(a5) # 800143e0 <_ZN5StdIO7ibufferE>
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    8000956c:	0004b783          	ld	a5,0(s1)
    80009570:	1c078463          	beqz	a5,80009738 <_ZN5StdIO9initalizeEv+0x27c>
    80009574:	0000b797          	auipc	a5,0xb
    80009578:	e4c78793          	addi	a5,a5,-436 # 800143c0 <_ZN12SharedBufferIcE5cacheE>
    8000957c:	0007b503          	ld	a0,0(a5)
    80009580:	fffff097          	auipc	ra,0xfffff
    80009584:	154080e7          	jalr	340(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80009588:	40050713          	addi	a4,a0,1024
    KSemaphore(unsigned val):val(val)
    8000958c:	00100793          	li	a5,1
    80009590:	40f52423          	sw	a5,1032(a0)
    80009594:	40053823          	sd	zero,1040(a0)
    80009598:	40053c23          	sd	zero,1048(a0)
    8000959c:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores; 
    800095a0:	0000b797          	auipc	a5,0xb
    800095a4:	db878793          	addi	a5,a5,-584 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    800095a8:	0007b683          	ld	a3,0(a5)
    800095ac:	40d53023          	sd	a3,1024(a0)
    800095b0:	42850693          	addi	a3,a0,1064
    KSemaphore(unsigned val):val(val)
    800095b4:	42052823          	sw	zero,1072(a0)
    800095b8:	42053c23          	sd	zero,1080(a0)
    800095bc:	44053023          	sd	zero,1088(a0)
    800095c0:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    800095c4:	42e53423          	sd	a4,1064(a0)
    800095c8:	45050713          	addi	a4,a0,1104
    KSemaphore(unsigned val):val(val)
    800095cc:	40000613          	li	a2,1024
    800095d0:	44c52c23          	sw	a2,1112(a0)
    800095d4:	46053023          	sd	zero,1120(a0)
    800095d8:	46053423          	sd	zero,1128(a0)
    800095dc:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    800095e0:	44d53823          	sd	a3,1104(a0)
        activeSemaphores = this;
    800095e4:	00e7b023          	sd	a4,0(a5)
    800095e8:	46052c23          	sw	zero,1144(a0)
    800095ec:	46052e23          	sw	zero,1148(a0)
    800095f0:	48052023          	sw	zero,1152(a0)
    obuffer = new SharedBuffer<char>();
    800095f4:	0000b797          	auipc	a5,0xb
    800095f8:	dea7b223          	sd	a0,-540(a5) # 800143d8 <_ZN5StdIO7obufferE>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    800095fc:	0000b797          	auipc	a5,0xb
    80009600:	d5478793          	addi	a5,a5,-684 # 80014350 <_ZN10KSemaphore5cacheE>
    80009604:	0007b783          	ld	a5,0(a5)
    80009608:	18078463          	beqz	a5,80009790 <_ZN5StdIO9initalizeEv+0x2d4>
    8000960c:	0000b797          	auipc	a5,0xb
    80009610:	d4478793          	addi	a5,a5,-700 # 80014350 <_ZN10KSemaphore5cacheE>
    80009614:	0007b503          	ld	a0,0(a5)
    80009618:	fffff097          	auipc	ra,0xfffff
    8000961c:	0bc080e7          	jalr	188(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    KSemaphore(unsigned val):val(val)
    80009620:	00052423          	sw	zero,8(a0)
    80009624:	00053823          	sd	zero,16(a0)
    80009628:	00053c23          	sd	zero,24(a0)
    8000962c:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    80009630:	0000b797          	auipc	a5,0xb
    80009634:	d2878793          	addi	a5,a5,-728 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80009638:	0007b703          	ld	a4,0(a5)
    8000963c:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80009640:	00a7b023          	sd	a0,0(a5)
    blockSem = new KSemaphore(0);
    80009644:	0000b797          	auipc	a5,0xb
    80009648:	d8a7b623          	sd	a0,-628(a5) # 800143d0 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    8000964c:	00005797          	auipc	a5,0x5
    80009650:	9c478793          	addi	a5,a5,-1596 # 8000e010 <CONSOLE_STATUS>
    80009654:	0007b783          	ld	a5,0(a5)
    80009658:	0000b717          	auipc	a4,0xb
    8000965c:	daf73023          	sd	a5,-608(a4) # 800143f8 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80009660:	00005797          	auipc	a5,0x5
    80009664:	9a078793          	addi	a5,a5,-1632 # 8000e000 <CONSOLE_RX_DATA>
    80009668:	0007b783          	ld	a5,0(a5)
    8000966c:	0000b717          	auipc	a4,0xb
    80009670:	d8f73223          	sd	a5,-636(a4) # 800143f0 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80009674:	00005797          	auipc	a5,0x5
    80009678:	99478793          	addi	a5,a5,-1644 # 8000e008 <CONSOLE_TX_DATA>
    8000967c:	0007b783          	ld	a5,0(a5)
    80009680:	0000b717          	auipc	a4,0xb
    80009684:	d6f73423          	sd	a5,-664(a4) # 800143e8 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)SlabAllocator::getInstance().kmalloc(DEFAULT_STACK_SIZE);
    80009688:	00000097          	auipc	ra,0x0
    8000968c:	ab4080e7          	jalr	-1356(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80009690:	000015b7          	lui	a1,0x1
    80009694:	00000097          	auipc	ra,0x0
    80009698:	ba8080e7          	jalr	-1112(ra) # 8000923c <_ZN13SlabAllocator7kmallocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    8000969c:	00050613          	mv	a2,a0
    800096a0:	00000593          	li	a1,0
    800096a4:	00000517          	auipc	a0,0x0
    800096a8:	d1050513          	addi	a0,a0,-752 # 800093b4 <_ZN5StdIO12outputWorkerEPv>
    800096ac:	ffffb097          	auipc	ra,0xffffb
    800096b0:	32c080e7          	jalr	812(ra) # 800049d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800096b4:	0000b797          	auipc	a5,0xb
    800096b8:	d0a7ba23          	sd	a0,-748(a5) # 800143c8 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    800096bc:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    800096c0:	00100793          	li	a5,1
    800096c4:	02f50b23          	sb	a5,54(a0)
}
    800096c8:	01813083          	ld	ra,24(sp)
    800096cc:	01013403          	ld	s0,16(sp)
    800096d0:	00813483          	ld	s1,8(sp)
    800096d4:	00013903          	ld	s2,0(sp)
    800096d8:	02010113          	addi	sp,sp,32
    800096dc:	00008067          	ret
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    800096e0:	05800513          	li	a0,88
    800096e4:	fffff097          	auipc	ra,0xfffff
    800096e8:	094080e7          	jalr	148(ra) # 80008778 <_ZN11ObjectCachenwEm>
    800096ec:	00050493          	mv	s1,a0
    800096f0:	00000793          	li	a5,0
    800096f4:	00000713          	li	a4,0
    800096f8:	00000693          	li	a3,0
    800096fc:	48800613          	li	a2,1160
    80009700:	00005597          	auipc	a1,0x5
    80009704:	30058593          	addi	a1,a1,768 # 8000ea00 <CONSOLE_STATUS+0x9f0>
    80009708:	fffff097          	auipc	ra,0xfffff
    8000970c:	854080e7          	jalr	-1964(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009710:	0000b797          	auipc	a5,0xb
    80009714:	ca97b823          	sd	s1,-848(a5) # 800143c0 <_ZN12SharedBufferIcE5cacheE>
    80009718:	dcdff06f          	j	800094e4 <_ZN5StdIO9initalizeEv+0x28>
    8000971c:	00050913          	mv	s2,a0
    80009720:	00048513          	mv	a0,s1
    80009724:	fffff097          	auipc	ra,0xfffff
    80009728:	1b4080e7          	jalr	436(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    8000972c:	00090513          	mv	a0,s2
    80009730:	0000c097          	auipc	ra,0xc
    80009734:	e18080e7          	jalr	-488(ra) # 80015548 <_Unwind_Resume>
    80009738:	05800513          	li	a0,88
    8000973c:	fffff097          	auipc	ra,0xfffff
    80009740:	03c080e7          	jalr	60(ra) # 80008778 <_ZN11ObjectCachenwEm>
    80009744:	00050493          	mv	s1,a0
    80009748:	00000793          	li	a5,0
    8000974c:	00000713          	li	a4,0
    80009750:	00000693          	li	a3,0
    80009754:	48800613          	li	a2,1160
    80009758:	00005597          	auipc	a1,0x5
    8000975c:	2a858593          	addi	a1,a1,680 # 8000ea00 <CONSOLE_STATUS+0x9f0>
    80009760:	ffffe097          	auipc	ra,0xffffe
    80009764:	7fc080e7          	jalr	2044(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009768:	0000b797          	auipc	a5,0xb
    8000976c:	c497bc23          	sd	s1,-936(a5) # 800143c0 <_ZN12SharedBufferIcE5cacheE>
    80009770:	e05ff06f          	j	80009574 <_ZN5StdIO9initalizeEv+0xb8>
    80009774:	00050913          	mv	s2,a0
    80009778:	00048513          	mv	a0,s1
    8000977c:	fffff097          	auipc	ra,0xfffff
    80009780:	15c080e7          	jalr	348(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    80009784:	00090513          	mv	a0,s2
    80009788:	0000c097          	auipc	ra,0xc
    8000978c:	dc0080e7          	jalr	-576(ra) # 80015548 <_Unwind_Resume>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80009790:	05800513          	li	a0,88
    80009794:	fffff097          	auipc	ra,0xfffff
    80009798:	fe4080e7          	jalr	-28(ra) # 80008778 <_ZN11ObjectCachenwEm>
    8000979c:	00050493          	mv	s1,a0
    800097a0:	00000793          	li	a5,0
    800097a4:	00000713          	li	a4,0
    800097a8:	00000693          	li	a3,0
    800097ac:	02800613          	li	a2,40
    800097b0:	00005597          	auipc	a1,0x5
    800097b4:	c2858593          	addi	a1,a1,-984 # 8000e3d8 <CONSOLE_STATUS+0x3c8>
    800097b8:	ffffe097          	auipc	ra,0xffffe
    800097bc:	7a4080e7          	jalr	1956(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    800097c0:	0000b797          	auipc	a5,0xb
    800097c4:	b897b823          	sd	s1,-1136(a5) # 80014350 <_ZN10KSemaphore5cacheE>
    800097c8:	e45ff06f          	j	8000960c <_ZN5StdIO9initalizeEv+0x150>
    800097cc:	00050913          	mv	s2,a0
    800097d0:	00048513          	mv	a0,s1
    800097d4:	fffff097          	auipc	ra,0xfffff
    800097d8:	104080e7          	jalr	260(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    800097dc:	00090513          	mv	a0,s2
    800097e0:	0000c097          	auipc	ra,0xc
    800097e4:	d68080e7          	jalr	-664(ra) # 80015548 <_Unwind_Resume>

00000000800097e8 <_ZN5StdIO11inputWorkerEv>:
{
    800097e8:	ff010113          	addi	sp,sp,-16
    800097ec:	00813423          	sd	s0,8(sp)
    800097f0:	01010413          	addi	s0,sp,16
}
    800097f4:	00813403          	ld	s0,8(sp)
    800097f8:	01010113          	addi	sp,sp,16
    800097fc:	00008067          	ret

0000000080009800 <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    80009800:	fc010113          	addi	sp,sp,-64
    80009804:	02113c23          	sd	ra,56(sp)
    80009808:	02813823          	sd	s0,48(sp)
    8000980c:	02913423          	sd	s1,40(sp)
    80009810:	03213023          	sd	s2,32(sp)
    80009814:	01313c23          	sd	s3,24(sp)
    80009818:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    8000981c:	ffff8097          	auipc	ra,0xffff8
    80009820:	038080e7          	jalr	56(ra) # 80001854 <plic_claim>
    if(t == CONSOLE_IRQ)
    80009824:	00a00793          	li	a5,10
    80009828:	12f51063          	bne	a0,a5,80009948 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    8000982c:	0000b797          	auipc	a5,0xb
    80009830:	bcc78793          	addi	a5,a5,-1076 # 800143f8 <_ZN5StdIO8iostatusE>
    80009834:	0007b783          	ld	a5,0(a5)
    80009838:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    8000983c:	0017f793          	andi	a5,a5,1
    80009840:	0a078263          	beqz	a5,800098e4 <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    80009844:	0000b797          	auipc	a5,0xb
    80009848:	bac78793          	addi	a5,a5,-1108 # 800143f0 <_ZN5StdIO5idataE>
    8000984c:	0007b783          	ld	a5,0(a5)
    80009850:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    80009854:	00a00513          	li	a0,10
    80009858:	ffff8097          	auipc	ra,0xffff8
    8000985c:	034080e7          	jalr	52(ra) # 8000188c <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80009860:	0000b797          	auipc	a5,0xb
    80009864:	b8078793          	addi	a5,a5,-1152 # 800143e0 <_ZN5StdIO7ibufferE>
    80009868:	0007b483          	ld	s1,0(a5)
    8000986c:	4804a703          	lw	a4,1152(s1)
    80009870:	3ff00793          	li	a5,1023
    80009874:	0ce7ce63          	blt	a5,a4,80009950 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80009878:	45048513          	addi	a0,s1,1104
    8000987c:	ffffb097          	auipc	ra,0xffffb
    80009880:	9fc080e7          	jalr	-1540(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80009884:	40048993          	addi	s3,s1,1024
    80009888:	00098513          	mv	a0,s3
    8000988c:	ffffb097          	auipc	ra,0xffffb
    80009890:	9ec080e7          	jalr	-1556(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80009894:	4804a783          	lw	a5,1152(s1)
    80009898:	0017879b          	addiw	a5,a5,1
    8000989c:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    800098a0:	47c4a783          	lw	a5,1148(s1)
    800098a4:	00f48733          	add	a4,s1,a5
    800098a8:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    800098ac:	0017879b          	addiw	a5,a5,1
    800098b0:	41f7d71b          	sraiw	a4,a5,0x1f
    800098b4:	0167571b          	srliw	a4,a4,0x16
    800098b8:	00e787bb          	addw	a5,a5,a4
    800098bc:	3ff7f793          	andi	a5,a5,1023
    800098c0:	40e787bb          	subw	a5,a5,a4
    800098c4:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    800098c8:	42848513          	addi	a0,s1,1064
    800098cc:	ffffb097          	auipc	ra,0xffffb
    800098d0:	a30080e7          	jalr	-1488(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800098d4:	00098513          	mv	a0,s3
    800098d8:	ffffb097          	auipc	ra,0xffffb
    800098dc:	a24080e7          	jalr	-1500(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    800098e0:	0700006f          	j	80009950 <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    800098e4:	00a00513          	li	a0,10
    800098e8:	ffff8097          	auipc	ra,0xffff8
    800098ec:	fa4080e7          	jalr	-92(ra) # 8000188c <plic_complete>
            if(out_thread != nullptr)
    800098f0:	0000b797          	auipc	a5,0xb
    800098f4:	ad878793          	addi	a5,a5,-1320 # 800143c8 <_ZN5StdIO10out_threadE>
    800098f8:	0007b783          	ld	a5,0(a5)
    800098fc:	04078a63          	beqz	a5,80009950 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80009900:	100027f3          	csrr	a5,sstatus
    80009904:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80009908:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000990c:	141027f3          	csrr	a5,sepc
    80009910:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80009914:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80009918:	0000b797          	auipc	a5,0xb
    8000991c:	ab078793          	addi	a5,a5,-1360 # 800143c8 <_ZN5StdIO10out_threadE>
    80009920:	0007b583          	ld	a1,0(a5)
    80009924:	0000b517          	auipc	a0,0xb
    80009928:	b1c50513          	addi	a0,a0,-1252 # 80014440 <_ZN9Scheduler5queueE>
    8000992c:	ffffb097          	auipc	ra,0xffffb
    80009930:	6b4080e7          	jalr	1716(ra) # 80004fe0 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    80009934:	ffffb097          	auipc	ra,0xffffb
    80009938:	2d4080e7          	jalr	724(ra) # 80004c08 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000993c:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80009940:	14149073          	csrw	sepc,s1
    80009944:	00c0006f          	j	80009950 <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    80009948:	ffff8097          	auipc	ra,0xffff8
    8000994c:	f44080e7          	jalr	-188(ra) # 8000188c <plic_complete>
    80009950:	03813083          	ld	ra,56(sp)
    80009954:	03013403          	ld	s0,48(sp)
    80009958:	02813483          	ld	s1,40(sp)
    8000995c:	02013903          	ld	s2,32(sp)
    80009960:	01813983          	ld	s3,24(sp)
    80009964:	04010113          	addi	sp,sp,64
    80009968:	00008067          	ret

000000008000996c <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    8000996c:	ff010113          	addi	sp,sp,-16
    80009970:	00113423          	sd	ra,8(sp)
    80009974:	00813023          	sd	s0,0(sp)
    80009978:	01010413          	addi	s0,sp,16
    8000997c:	000105b7          	lui	a1,0x10
    80009980:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80009984:	00100513          	li	a0,1
    80009988:	00000097          	auipc	ra,0x0
    8000998c:	9c0080e7          	jalr	-1600(ra) # 80009348 <_Z41__static_initialization_and_destruction_0ii>
    80009990:	00813083          	ld	ra,8(sp)
    80009994:	00013403          	ld	s0,0(sp)
    80009998:	01010113          	addi	sp,sp,16
    8000999c:	00008067          	ret

00000000800099a0 <_Z19buddy_allocate_testhb>:
#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

void* buddy_allocate_test(uchar level, bool a = false){
    800099a0:	fe010113          	addi	sp,sp,-32
    800099a4:	00113c23          	sd	ra,24(sp)
    800099a8:	00813823          	sd	s0,16(sp)
    800099ac:	00913423          	sd	s1,8(sp)
    800099b0:	01213023          	sd	s2,0(sp)
    800099b4:	02010413          	addi	s0,sp,32
    800099b8:	00050493          	mv	s1,a0
    800099bc:	00058913          	mv	s2,a1
    kprintString("Buddy allocate: 2^");
    800099c0:	00005517          	auipc	a0,0x5
    800099c4:	05850513          	addi	a0,a0,88 # 8000ea18 <CONSOLE_STATUS+0xa08>
    800099c8:	ffffb097          	auipc	ra,0xffffb
    800099cc:	71c080e7          	jalr	1820(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintInt(level);
    800099d0:	00000613          	li	a2,0
    800099d4:	00a00593          	li	a1,10
    800099d8:	00048513          	mv	a0,s1
    800099dc:	ffffb097          	auipc	ra,0xffffb
    800099e0:	750080e7          	jalr	1872(ra) # 8000512c <_Z9kprintIntmib>
    kprintString(" blocks\n");
    800099e4:	00005517          	auipc	a0,0x5
    800099e8:	04c50513          	addi	a0,a0,76 # 8000ea30 <CONSOLE_STATUS+0xa20>
    800099ec:	ffffb097          	auipc	ra,0xffffb
    800099f0:	6f8080e7          	jalr	1784(ra) # 800050e4 <_Z12kprintStringPKc>
    void* ret = Buddy::getInstance().mem_alloc(level);
    800099f4:	ffffd097          	auipc	ra,0xffffd
    800099f8:	e8c080e7          	jalr	-372(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    800099fc:	00048593          	mv	a1,s1
    80009a00:	ffffd097          	auipc	ra,0xffffd
    80009a04:	3f8080e7          	jalr	1016(ra) # 80006df8 <_ZN5Buddy9mem_allocEh>
    80009a08:	00050493          	mv	s1,a0
    KVALCHECKPRINT(Returned address, ret);
    80009a0c:	00005517          	auipc	a0,0x5
    80009a10:	03450513          	addi	a0,a0,52 # 8000ea40 <CONSOLE_STATUS+0xa30>
    80009a14:	ffffb097          	auipc	ra,0xffffb
    80009a18:	6d0080e7          	jalr	1744(ra) # 800050e4 <_Z12kprintStringPKc>
    80009a1c:	00000613          	li	a2,0
    80009a20:	01000593          	li	a1,16
    80009a24:	00048513          	mv	a0,s1
    80009a28:	ffffb097          	auipc	ra,0xffffb
    80009a2c:	704080e7          	jalr	1796(ra) # 8000512c <_Z9kprintIntmib>
    80009a30:	00005517          	auipc	a0,0x5
    80009a34:	92850513          	addi	a0,a0,-1752 # 8000e358 <CONSOLE_STATUS+0x348>
    80009a38:	ffffb097          	auipc	ra,0xffffb
    80009a3c:	6ac080e7          	jalr	1708(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("\n");
    80009a40:	00005517          	auipc	a0,0x5
    80009a44:	91850513          	addi	a0,a0,-1768 # 8000e358 <CONSOLE_STATUS+0x348>
    80009a48:	ffffb097          	auipc	ra,0xffffb
    80009a4c:	69c080e7          	jalr	1692(ra) # 800050e4 <_Z12kprintStringPKc>
    if(!ret)
    80009a50:	04048263          	beqz	s1,80009a94 <_Z19buddy_allocate_testhb+0xf4>
        kprintString("BUDDY ALLOCATE ERROR\n");
    kprintString("\n");
    80009a54:	00005517          	auipc	a0,0x5
    80009a58:	90450513          	addi	a0,a0,-1788 # 8000e358 <CONSOLE_STATUS+0x348>
    80009a5c:	ffffb097          	auipc	ra,0xffffb
    80009a60:	688080e7          	jalr	1672(ra) # 800050e4 <_Z12kprintStringPKc>
    
    if(a) Buddy::getInstance().status_print();
    80009a64:	04091263          	bnez	s2,80009aa8 <_Z19buddy_allocate_testhb+0x108>
    kprintString("\n");
    80009a68:	00005517          	auipc	a0,0x5
    80009a6c:	8f050513          	addi	a0,a0,-1808 # 8000e358 <CONSOLE_STATUS+0x348>
    80009a70:	ffffb097          	auipc	ra,0xffffb
    80009a74:	674080e7          	jalr	1652(ra) # 800050e4 <_Z12kprintStringPKc>
    return ret;
}
    80009a78:	00048513          	mv	a0,s1
    80009a7c:	01813083          	ld	ra,24(sp)
    80009a80:	01013403          	ld	s0,16(sp)
    80009a84:	00813483          	ld	s1,8(sp)
    80009a88:	00013903          	ld	s2,0(sp)
    80009a8c:	02010113          	addi	sp,sp,32
    80009a90:	00008067          	ret
        kprintString("BUDDY ALLOCATE ERROR\n");
    80009a94:	00005517          	auipc	a0,0x5
    80009a98:	fc450513          	addi	a0,a0,-60 # 8000ea58 <CONSOLE_STATUS+0xa48>
    80009a9c:	ffffb097          	auipc	ra,0xffffb
    80009aa0:	648080e7          	jalr	1608(ra) # 800050e4 <_Z12kprintStringPKc>
    80009aa4:	fb1ff06f          	j	80009a54 <_Z19buddy_allocate_testhb+0xb4>
    if(a) Buddy::getInstance().status_print();
    80009aa8:	ffffd097          	auipc	ra,0xffffd
    80009aac:	dd8080e7          	jalr	-552(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    80009ab0:	00100593          	li	a1,1
    80009ab4:	ffffd097          	auipc	ra,0xffffd
    80009ab8:	5c8080e7          	jalr	1480(ra) # 8000707c <_ZN5Buddy12status_printEb>
    80009abc:	fadff06f          	j	80009a68 <_Z19buddy_allocate_testhb+0xc8>

0000000080009ac0 <_Z21buddy_deallocate_testPvhb>:

int buddy_deallocate_test(void* s, uchar level, bool a = false){
    80009ac0:	fd010113          	addi	sp,sp,-48
    80009ac4:	02113423          	sd	ra,40(sp)
    80009ac8:	02813023          	sd	s0,32(sp)
    80009acc:	00913c23          	sd	s1,24(sp)
    80009ad0:	01213823          	sd	s2,16(sp)
    80009ad4:	01313423          	sd	s3,8(sp)
    80009ad8:	03010413          	addi	s0,sp,48
    80009adc:	00050493          	mv	s1,a0
    80009ae0:	00058913          	mv	s2,a1
    80009ae4:	00060993          	mv	s3,a2
    kprintString("Buddy deallocate 2^"); 
    80009ae8:	00005517          	auipc	a0,0x5
    80009aec:	f8850513          	addi	a0,a0,-120 # 8000ea70 <CONSOLE_STATUS+0xa60>
    80009af0:	ffffb097          	auipc	ra,0xffffb
    80009af4:	5f4080e7          	jalr	1524(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintInt(level);
    80009af8:	00000613          	li	a2,0
    80009afc:	00a00593          	li	a1,10
    80009b00:	00090513          	mv	a0,s2
    80009b04:	ffffb097          	auipc	ra,0xffffb
    80009b08:	628080e7          	jalr	1576(ra) # 8000512c <_Z9kprintIntmib>
    kprintString(" blocks on address: ");
    80009b0c:	00005517          	auipc	a0,0x5
    80009b10:	f7c50513          	addi	a0,a0,-132 # 8000ea88 <CONSOLE_STATUS+0xa78>
    80009b14:	ffffb097          	auipc	ra,0xffffb
    80009b18:	5d0080e7          	jalr	1488(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintInt((uint64)s, 16);
    80009b1c:	00000613          	li	a2,0
    80009b20:	01000593          	li	a1,16
    80009b24:	00048513          	mv	a0,s1
    80009b28:	ffffb097          	auipc	ra,0xffffb
    80009b2c:	604080e7          	jalr	1540(ra) # 8000512c <_Z9kprintIntmib>
    kprintString("\n");
    80009b30:	00005517          	auipc	a0,0x5
    80009b34:	82850513          	addi	a0,a0,-2008 # 8000e358 <CONSOLE_STATUS+0x348>
    80009b38:	ffffb097          	auipc	ra,0xffffb
    80009b3c:	5ac080e7          	jalr	1452(ra) # 800050e4 <_Z12kprintStringPKc>
    int ret = Buddy::getInstance().mem_free(s, level);
    80009b40:	ffffd097          	auipc	ra,0xffffd
    80009b44:	d40080e7          	jalr	-704(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    80009b48:	00090613          	mv	a2,s2
    80009b4c:	00048593          	mv	a1,s1
    80009b50:	ffffe097          	auipc	ra,0xffffe
    80009b54:	910080e7          	jalr	-1776(ra) # 80007460 <_ZN5Buddy8mem_freeEPvh>
    80009b58:	00050493          	mv	s1,a0
    if(ret < 0){
    80009b5c:	04054463          	bltz	a0,80009ba4 <_Z21buddy_deallocate_testPvhb+0xe4>
        kprintString("BUDDY DEALLOCATE ERROR:");
        kprintInt((uint64)ret, 10, true);
        kprintString("\n");
    }
    kprintString("\n");
    80009b60:	00004517          	auipc	a0,0x4
    80009b64:	7f850513          	addi	a0,a0,2040 # 8000e358 <CONSOLE_STATUS+0x348>
    80009b68:	ffffb097          	auipc	ra,0xffffb
    80009b6c:	57c080e7          	jalr	1404(ra) # 800050e4 <_Z12kprintStringPKc>
    if(a) Buddy::getInstance().status_print();
    80009b70:	06099663          	bnez	s3,80009bdc <_Z21buddy_deallocate_testPvhb+0x11c>
    kprintString("\n");
    80009b74:	00004517          	auipc	a0,0x4
    80009b78:	7e450513          	addi	a0,a0,2020 # 8000e358 <CONSOLE_STATUS+0x348>
    80009b7c:	ffffb097          	auipc	ra,0xffffb
    80009b80:	568080e7          	jalr	1384(ra) # 800050e4 <_Z12kprintStringPKc>
    return ret;
}
    80009b84:	00048513          	mv	a0,s1
    80009b88:	02813083          	ld	ra,40(sp)
    80009b8c:	02013403          	ld	s0,32(sp)
    80009b90:	01813483          	ld	s1,24(sp)
    80009b94:	01013903          	ld	s2,16(sp)
    80009b98:	00813983          	ld	s3,8(sp)
    80009b9c:	03010113          	addi	sp,sp,48
    80009ba0:	00008067          	ret
        kprintString("BUDDY DEALLOCATE ERROR:");
    80009ba4:	00005517          	auipc	a0,0x5
    80009ba8:	efc50513          	addi	a0,a0,-260 # 8000eaa0 <CONSOLE_STATUS+0xa90>
    80009bac:	ffffb097          	auipc	ra,0xffffb
    80009bb0:	538080e7          	jalr	1336(ra) # 800050e4 <_Z12kprintStringPKc>
        kprintInt((uint64)ret, 10, true);
    80009bb4:	00100613          	li	a2,1
    80009bb8:	00a00593          	li	a1,10
    80009bbc:	00048513          	mv	a0,s1
    80009bc0:	ffffb097          	auipc	ra,0xffffb
    80009bc4:	56c080e7          	jalr	1388(ra) # 8000512c <_Z9kprintIntmib>
        kprintString("\n");
    80009bc8:	00004517          	auipc	a0,0x4
    80009bcc:	79050513          	addi	a0,a0,1936 # 8000e358 <CONSOLE_STATUS+0x348>
    80009bd0:	ffffb097          	auipc	ra,0xffffb
    80009bd4:	514080e7          	jalr	1300(ra) # 800050e4 <_Z12kprintStringPKc>
    80009bd8:	f89ff06f          	j	80009b60 <_Z21buddy_deallocate_testPvhb+0xa0>
    if(a) Buddy::getInstance().status_print();
    80009bdc:	ffffd097          	auipc	ra,0xffffd
    80009be0:	ca4080e7          	jalr	-860(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    80009be4:	00100593          	li	a1,1
    80009be8:	ffffd097          	auipc	ra,0xffffd
    80009bec:	494080e7          	jalr	1172(ra) # 8000707c <_ZN5Buddy12status_printEb>
    80009bf0:	f85ff06f          	j	80009b74 <_Z21buddy_deallocate_testPvhb+0xb4>

0000000080009bf4 <_Z10buddy_testv>:

void buddy_test(){
    80009bf4:	fe010113          	addi	sp,sp,-32
    80009bf8:	00113c23          	sd	ra,24(sp)
    80009bfc:	00813823          	sd	s0,16(sp)
    80009c00:	00913423          	sd	s1,8(sp)
    80009c04:	02010413          	addi	s0,sp,32
    kprintString("--------BUDDY TEST--------\n");
    80009c08:	00005517          	auipc	a0,0x5
    80009c0c:	eb050513          	addi	a0,a0,-336 # 8000eab8 <CONSOLE_STATUS+0xaa8>
    80009c10:	ffffb097          	auipc	ra,0xffffb
    80009c14:	4d4080e7          	jalr	1236(ra) # 800050e4 <_Z12kprintStringPKc>

    /* allocate deallocate */
    bool x = false;
    void* t = buddy_allocate_test(4, x);
    80009c18:	00000593          	li	a1,0
    80009c1c:	00400513          	li	a0,4
    80009c20:	00000097          	auipc	ra,0x0
    80009c24:	d80080e7          	jalr	-640(ra) # 800099a0 <_Z19buddy_allocate_testhb>
    80009c28:	00050493          	mv	s1,a0
    buddy_deallocate_test(t, 4, x);
    80009c2c:	00000613          	li	a2,0
    80009c30:	00400593          	li	a1,4
    80009c34:	00000097          	auipc	ra,0x0
    80009c38:	e8c080e7          	jalr	-372(ra) # 80009ac0 <_Z21buddy_deallocate_testPvhb>

    /* allocate errors */
    x = true;
    buddy_allocate_test(13);
    80009c3c:	00000593          	li	a1,0
    80009c40:	00d00513          	li	a0,13
    80009c44:	00000097          	auipc	ra,0x0
    80009c48:	d5c080e7          	jalr	-676(ra) # 800099a0 <_Z19buddy_allocate_testhb>
    buddy_deallocate_test(t, 13);
    80009c4c:	00000613          	li	a2,0
    80009c50:	00d00593          	li	a1,13
    80009c54:	00048513          	mv	a0,s1
    80009c58:	00000097          	auipc	ra,0x0
    80009c5c:	e68080e7          	jalr	-408(ra) # 80009ac0 <_Z21buddy_deallocate_testPvhb>
    buddy_deallocate_test(nullptr, 2);
    80009c60:	00000613          	li	a2,0
    80009c64:	00200593          	li	a1,2
    80009c68:	00000513          	li	a0,0
    80009c6c:	00000097          	auipc	ra,0x0
    80009c70:	e54080e7          	jalr	-428(ra) # 80009ac0 <_Z21buddy_deallocate_testPvhb>

    kprintString("------BUDDY TEST END------\n");
    80009c74:	00005517          	auipc	a0,0x5
    80009c78:	e6450513          	addi	a0,a0,-412 # 8000ead8 <CONSOLE_STATUS+0xac8>
    80009c7c:	ffffb097          	auipc	ra,0xffffb
    80009c80:	468080e7          	jalr	1128(ra) # 800050e4 <_Z12kprintStringPKc>
    80009c84:	01813083          	ld	ra,24(sp)
    80009c88:	01013403          	ld	s0,16(sp)
    80009c8c:	00813483          	ld	s1,8(sp)
    80009c90:	02010113          	addi	sp,sp,32
    80009c94:	00008067          	ret

0000000080009c98 <_Z11paging_testv>:
#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"


void paging_test(){
    80009c98:	fe010113          	addi	sp,sp,-32
    80009c9c:	00113c23          	sd	ra,24(sp)
    80009ca0:	00813823          	sd	s0,16(sp)
    80009ca4:	00913423          	sd	s1,8(sp)
    80009ca8:	01213023          	sd	s2,0(sp)
    80009cac:	02010413          	addi	s0,sp,32
    kprintString("--------PAGING TEST--------\n");
    80009cb0:	00005517          	auipc	a0,0x5
    80009cb4:	e4850513          	addi	a0,a0,-440 # 8000eaf8 <CONSOLE_STATUS+0xae8>
    80009cb8:	ffffb097          	auipc	ra,0xffffb
    80009cbc:	42c080e7          	jalr	1068(ra) # 800050e4 <_Z12kprintStringPKc>

    kprintString("GETING PAGER iNSTANCE\n");
    80009cc0:	00005517          	auipc	a0,0x5
    80009cc4:	e5850513          	addi	a0,a0,-424 # 8000eb18 <CONSOLE_STATUS+0xb08>
    80009cc8:	ffffb097          	auipc	ra,0xffffb
    80009ccc:	41c080e7          	jalr	1052(ra) # 800050e4 <_Z12kprintStringPKc>
    Pager& pager = Pager::getInstance();
    80009cd0:	00001097          	auipc	ra,0x1
    80009cd4:	e2c080e7          	jalr	-468(ra) # 8000aafc <_ZN5Pager11getInstanceEv>
    80009cd8:	00050913          	mv	s2,a0
    kprintString("MAPPING KERNEL\n");
    80009cdc:	00005517          	auipc	a0,0x5
    80009ce0:	e5450513          	addi	a0,a0,-428 # 8000eb30 <CONSOLE_STATUS+0xb20>
    80009ce4:	ffffb097          	auipc	ra,0xffffb
    80009ce8:	400080e7          	jalr	1024(ra) # 800050e4 <_Z12kprintStringPKc>
    pager.map_kernel();
    80009cec:	00090513          	mv	a0,s2
    80009cf0:	00001097          	auipc	ra,0x1
    80009cf4:	020080e7          	jalr	32(ra) # 8000ad10 <_ZN5Pager10map_kernelEv>
    kprintString("PAGING BEGIN\n");
    80009cf8:	00005517          	auipc	a0,0x5
    80009cfc:	e4850513          	addi	a0,a0,-440 # 8000eb40 <CONSOLE_STATUS+0xb30>
    80009d00:	ffffb097          	auipc	ra,0xffffb
    80009d04:	3e4080e7          	jalr	996(ra) # 800050e4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80009d08:	000407b7          	lui	a5,0x40
    80009d0c:	1007a073          	csrs	sstatus,a5
    //Riscv::mc_sie(Riscv::BitMaskSip::SIP_STIE);
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SIE);
    Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    kprintString("Moze li\n");
    80009d10:	00005517          	auipc	a0,0x5
    80009d14:	e4050513          	addi	a0,a0,-448 # 8000eb50 <CONSOLE_STATUS+0xb40>
    80009d18:	ffffb097          	auipc	ra,0xffffb
    80009d1c:	3cc080e7          	jalr	972(ra) # 800050e4 <_Z12kprintStringPKc>
    pager.start_paging();
    80009d20:	00090513          	mv	a0,s2
    80009d24:	00001097          	auipc	ra,0x1
    80009d28:	160080e7          	jalr	352(ra) # 8000ae84 <_ZN5Pager12start_pagingEv>
   
    for(int i = 0; i < 5; i++){
    80009d2c:	00000493          	li	s1,0
    80009d30:	00400793          	li	a5,4
    80009d34:	0497c063          	blt	a5,s1,80009d74 <_Z11paging_testv+0xdc>
        KCHECKPRINT(i);
    80009d38:	00005517          	auipc	a0,0x5
    80009d3c:	e2850513          	addi	a0,a0,-472 # 8000eb60 <CONSOLE_STATUS+0xb50>
    80009d40:	ffffb097          	auipc	ra,0xffffb
    80009d44:	3a4080e7          	jalr	932(ra) # 800050e4 <_Z12kprintStringPKc>
    80009d48:	00000613          	li	a2,0
    80009d4c:	01000593          	li	a1,16
    80009d50:	00048513          	mv	a0,s1
    80009d54:	ffffb097          	auipc	ra,0xffffb
    80009d58:	3d8080e7          	jalr	984(ra) # 8000512c <_Z9kprintIntmib>
    80009d5c:	00004517          	auipc	a0,0x4
    80009d60:	5fc50513          	addi	a0,a0,1532 # 8000e358 <CONSOLE_STATUS+0x348>
    80009d64:	ffffb097          	auipc	ra,0xffffb
    80009d68:	380080e7          	jalr	896(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < 5; i++){
    80009d6c:	0014849b          	addiw	s1,s1,1
    80009d70:	fc1ff06f          	j	80009d30 <_Z11paging_testv+0x98>
    }
    uint64* ptr = (uint64*) HEAP_END_ADDR - 40;
    80009d74:	00009797          	auipc	a5,0x9
    80009d78:	c4478793          	addi	a5,a5,-956 # 800129b8 <HEAP_END_ADDR>
    80009d7c:	0007b483          	ld	s1,0(a5)
    80009d80:	ec048593          	addi	a1,s1,-320
    pager.map(ptr, (void*)((uint64)ptr & ~0xFFF), 
    80009d84:	01600693          	li	a3,22
    80009d88:	fffff637          	lui	a2,0xfffff
    80009d8c:	00c5f633          	and	a2,a1,a2
    80009d90:	00090513          	mv	a0,s2
    80009d94:	00001097          	auipc	ra,0x1
    80009d98:	ddc080e7          	jalr	-548(ra) # 8000ab70 <_ZN5Pager3mapEPvS0_12PMTEntryBits>
        (PMTEntryBits) (PMTEntryBits::user | PMTEntryBits::write | PMTEntryBits::read)); 
    pager.print();
    80009d9c:	00090513          	mv	a0,s2
    80009da0:	00001097          	auipc	ra,0x1
    80009da4:	12c080e7          	jalr	300(ra) # 8000aecc <_ZN5Pager5printEv>
    //KCHECKPRINT(CONSOLE_RX_DATA);
    //pager.print();
    
    *ptr = 13;
    80009da8:	00d00793          	li	a5,13
    80009dac:	ecf4b023          	sd	a5,-320(s1)
    //KCHECKPRINT(*ptr);
    //KCHECKPRINT(ptr);
    
    kprintString("------PAGING TEST END------\n");
    80009db0:	00005517          	auipc	a0,0x5
    80009db4:	db850513          	addi	a0,a0,-584 # 8000eb68 <CONSOLE_STATUS+0xb58>
    80009db8:	ffffb097          	auipc	ra,0xffffb
    80009dbc:	32c080e7          	jalr	812(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80009dc0:	01813083          	ld	ra,24(sp)
    80009dc4:	01013403          	ld	s0,16(sp)
    80009dc8:	00813483          	ld	s1,8(sp)
    80009dcc:	00013903          	ld	s2,0(sp)
    80009dd0:	02010113          	addi	sp,sp,32
    80009dd4:	00008067          	ret

0000000080009dd8 <_Z4ctorPv>:
    kprintString("\n\n=============Object Dellocate Test End=============\n\n");
    
}


void ctor(void* ptr){
    80009dd8:	fc010113          	addi	sp,sp,-64
    80009ddc:	02113c23          	sd	ra,56(sp)
    80009de0:	02813823          	sd	s0,48(sp)
    80009de4:	04010413          	addi	s0,sp,64
    80009de8:	00050793          	mv	a5,a0
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)

    KSemaphore(unsigned val):val(val)
    80009dec:	00100713          	li	a4,1
    80009df0:	fce42823          	sw	a4,-48(s0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80009df4:	fc043c23          	sd	zero,-40(s0)
    80009df8:	fe043023          	sd	zero,-32(s0)
    80009dfc:	fe042423          	sw	zero,-24(s0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80009e00:	0000a697          	auipc	a3,0xa
    80009e04:	55868693          	addi	a3,a3,1368 # 80014358 <_ZN10KSemaphore16activeSemaphoresE>
    80009e08:	0006b703          	ld	a4,0(a3)
    80009e0c:	fce43423          	sd	a4,-56(s0)
        activeSemaphores = this;
    80009e10:	fc840513          	addi	a0,s0,-56
    80009e14:	00a6b023          	sd	a0,0(a3)
   
    *(KSemaphore*)ptr = KSemaphore(1);
    80009e18:	00e7b023          	sd	a4,0(a5)
    80009e1c:	fd043703          	ld	a4,-48(s0)
    80009e20:	00e7b423          	sd	a4,8(a5)
    80009e24:	0007b823          	sd	zero,16(a5)
    80009e28:	0007bc23          	sd	zero,24(a5)
    80009e2c:	fe843703          	ld	a4,-24(s0)
    80009e30:	02e7b023          	sd	a4,32(a5)
    80009e34:	ffffa097          	auipc	ra,0xffffa
    80009e38:	51c080e7          	jalr	1308(ra) # 80004350 <_ZN10KSemaphoreD1Ev>
}
    80009e3c:	03813083          	ld	ra,56(sp)
    80009e40:	03013403          	ld	s0,48(sp)
    80009e44:	04010113          	addi	sp,sp,64
    80009e48:	00008067          	ret

0000000080009e4c <_Z16cache_alloc_testPP11ObjectCacheimc>:
void cache_alloc_test(ObjectCache** oc_arr,int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    80009e4c:	fb010113          	addi	sp,sp,-80
    80009e50:	04113423          	sd	ra,72(sp)
    80009e54:	04813023          	sd	s0,64(sp)
    80009e58:	02913c23          	sd	s1,56(sp)
    80009e5c:	03213823          	sd	s2,48(sp)
    80009e60:	03313423          	sd	s3,40(sp)
    80009e64:	03413023          	sd	s4,32(sp)
    80009e68:	01513c23          	sd	s5,24(sp)
    80009e6c:	01613823          	sd	s6,16(sp)
    80009e70:	01713423          	sd	s7,8(sp)
    80009e74:	05010413          	addi	s0,sp,80
    80009e78:	00050993          	mv	s3,a0
    80009e7c:	00058a93          	mv	s5,a1
    80009e80:	00060b93          	mv	s7,a2
    80009e84:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Cache Allocating=============\n\n");
    80009e88:	00005517          	auipc	a0,0x5
    80009e8c:	d0050513          	addi	a0,a0,-768 # 8000eb88 <CONSOLE_STATUS+0xb78>
    80009e90:	ffffb097          	auipc	ra,0xffffb
    80009e94:	254080e7          	jalr	596(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("Allocating "); kprintInt(size); kprintString(" caches!!\n");
    80009e98:	00005517          	auipc	a0,0x5
    80009e9c:	d2850513          	addi	a0,a0,-728 # 8000ebc0 <CONSOLE_STATUS+0xbb0>
    80009ea0:	ffffb097          	auipc	ra,0xffffb
    80009ea4:	244080e7          	jalr	580(ra) # 800050e4 <_Z12kprintStringPKc>
    80009ea8:	00000613          	li	a2,0
    80009eac:	00a00593          	li	a1,10
    80009eb0:	000a8513          	mv	a0,s5
    80009eb4:	ffffb097          	auipc	ra,0xffffb
    80009eb8:	278080e7          	jalr	632(ra) # 8000512c <_Z9kprintIntmib>
    80009ebc:	00005517          	auipc	a0,0x5
    80009ec0:	d1450513          	addi	a0,a0,-748 # 8000ebd0 <CONSOLE_STATUS+0xbc0>
    80009ec4:	ffffb097          	auipc	ra,0xffffb
    80009ec8:	220080e7          	jalr	544(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    80009ecc:	00000913          	li	s2,0
    80009ed0:	0900006f          	j	80009f60 <_Z16cache_alloc_testPP11ObjectCacheimc+0x114>
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    80009ed4:	00391493          	slli	s1,s2,0x3
    80009ed8:	009984b3          	add	s1,s3,s1
    80009edc:	0144b023          	sd	s4,0(s1)
        KPRINTARR(oc_arr, i, oc_arr[i]);
    80009ee0:	00005517          	auipc	a0,0x5
    80009ee4:	d0850513          	addi	a0,a0,-760 # 8000ebe8 <CONSOLE_STATUS+0xbd8>
    80009ee8:	ffffb097          	auipc	ra,0xffffb
    80009eec:	1fc080e7          	jalr	508(ra) # 800050e4 <_Z12kprintStringPKc>
    80009ef0:	00000613          	li	a2,0
    80009ef4:	00a00593          	li	a1,10
    80009ef8:	00090513          	mv	a0,s2
    80009efc:	ffffb097          	auipc	ra,0xffffb
    80009f00:	230080e7          	jalr	560(ra) # 8000512c <_Z9kprintIntmib>
    80009f04:	00004517          	auipc	a0,0x4
    80009f08:	5cc50513          	addi	a0,a0,1484 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    80009f0c:	ffffb097          	auipc	ra,0xffffb
    80009f10:	1d8080e7          	jalr	472(ra) # 800050e4 <_Z12kprintStringPKc>
    80009f14:	00000613          	li	a2,0
    80009f18:	01000593          	li	a1,16
    80009f1c:	0004b503          	ld	a0,0(s1)
    80009f20:	ffffb097          	auipc	ra,0xffffb
    80009f24:	20c080e7          	jalr	524(ra) # 8000512c <_Z9kprintIntmib>
    80009f28:	00004517          	auipc	a0,0x4
    80009f2c:	43050513          	addi	a0,a0,1072 # 8000e358 <CONSOLE_STATUS+0x348>
    80009f30:	ffffb097          	auipc	ra,0xffffb
    80009f34:	1b4080e7          	jalr	436(ra) # 800050e4 <_Z12kprintStringPKc>
        if(oc_arr == nullptr){
    80009f38:	06098063          	beqz	s3,80009f98 <_Z16cache_alloc_testPP11ObjectCacheimc+0x14c>
        oc_arr[i]->printInfo(flags);
    80009f3c:	000b0593          	mv	a1,s6
    80009f40:	0004b503          	ld	a0,0(s1)
    80009f44:	ffffe097          	auipc	ra,0xffffe
    80009f48:	2e4080e7          	jalr	740(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>
        kprintString("\n");
    80009f4c:	00004517          	auipc	a0,0x4
    80009f50:	40c50513          	addi	a0,a0,1036 # 8000e358 <CONSOLE_STATUS+0x348>
    80009f54:	ffffb097          	auipc	ra,0xffffb
    80009f58:	190080e7          	jalr	400(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    80009f5c:	0019091b          	addiw	s2,s2,1
    80009f60:	05595663          	bge	s2,s5,80009fac <_Z16cache_alloc_testPP11ObjectCacheimc+0x160>
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    80009f64:	05800513          	li	a0,88
    80009f68:	fffff097          	auipc	ra,0xfffff
    80009f6c:	810080e7          	jalr	-2032(ra) # 80008778 <_ZN11ObjectCachenwEm>
    80009f70:	00050a13          	mv	s4,a0
    80009f74:	00000793          	li	a5,0
    80009f78:	00000713          	li	a4,0
    80009f7c:	00000693          	li	a3,0
    80009f80:	000b8613          	mv	a2,s7
    80009f84:	00005597          	auipc	a1,0x5
    80009f88:	c5c58593          	addi	a1,a1,-932 # 8000ebe0 <CONSOLE_STATUS+0xbd0>
    80009f8c:	ffffe097          	auipc	ra,0xffffe
    80009f90:	fd0080e7          	jalr	-48(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009f94:	f41ff06f          	j	80009ed4 <_Z16cache_alloc_testPP11ObjectCacheimc+0x88>
            kprintString("Not enough memory left!\n");
    80009f98:	00005517          	auipc	a0,0x5
    80009f9c:	c5850513          	addi	a0,a0,-936 # 8000ebf0 <CONSOLE_STATUS+0xbe0>
    80009fa0:	ffffb097          	auipc	ra,0xffffb
    80009fa4:	144080e7          	jalr	324(ra) # 800050e4 <_Z12kprintStringPKc>
            return;
    80009fa8:	0280006f          	j	80009fd0 <_Z16cache_alloc_testPP11ObjectCacheimc+0x184>
    SlabAl::getInstance().print_state(flags);
    80009fac:	fffff097          	auipc	ra,0xfffff
    80009fb0:	190080e7          	jalr	400(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    80009fb4:	000b0593          	mv	a1,s6
    80009fb8:	fffff097          	auipc	ra,0xfffff
    80009fbc:	1f8080e7          	jalr	504(ra) # 800091b0 <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Object Cache Allocating End===========\n\n");
    80009fc0:	00005517          	auipc	a0,0x5
    80009fc4:	c5050513          	addi	a0,a0,-944 # 8000ec10 <CONSOLE_STATUS+0xc00>
    80009fc8:	ffffb097          	auipc	ra,0xffffb
    80009fcc:	11c080e7          	jalr	284(ra) # 800050e4 <_Z12kprintStringPKc>
}
    80009fd0:	04813083          	ld	ra,72(sp)
    80009fd4:	04013403          	ld	s0,64(sp)
    80009fd8:	03813483          	ld	s1,56(sp)
    80009fdc:	03013903          	ld	s2,48(sp)
    80009fe0:	02813983          	ld	s3,40(sp)
    80009fe4:	02013a03          	ld	s4,32(sp)
    80009fe8:	01813a83          	ld	s5,24(sp)
    80009fec:	01013b03          	ld	s6,16(sp)
    80009ff0:	00813b83          	ld	s7,8(sp)
    80009ff4:	05010113          	addi	sp,sp,80
    80009ff8:	00008067          	ret
    80009ffc:	00050493          	mv	s1,a0
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    8000a000:	000a0513          	mv	a0,s4
    8000a004:	fffff097          	auipc	ra,0xfffff
    8000a008:	8d4080e7          	jalr	-1836(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    8000a00c:	00048513          	mv	a0,s1
    8000a010:	0000b097          	auipc	ra,0xb
    8000a014:	538080e7          	jalr	1336(ra) # 80015548 <_Unwind_Resume>

000000008000a018 <_Z18cache_dealloc_testPP11ObjectCacheic>:
void cache_dealloc_test(ObjectCache** oc_arr, int size, char flags = Slab::pb_mask::FREE){
    8000a018:	fc010113          	addi	sp,sp,-64
    8000a01c:	02113c23          	sd	ra,56(sp)
    8000a020:	02813823          	sd	s0,48(sp)
    8000a024:	02913423          	sd	s1,40(sp)
    8000a028:	03213023          	sd	s2,32(sp)
    8000a02c:	01313c23          	sd	s3,24(sp)
    8000a030:	01413823          	sd	s4,16(sp)
    8000a034:	01513423          	sd	s5,8(sp)
    8000a038:	04010413          	addi	s0,sp,64
    8000a03c:	00050a13          	mv	s4,a0
    8000a040:	00058993          	mv	s3,a1
    8000a044:	00060a93          	mv	s5,a2
    kprintString("\n\n=============Object Cache Deallocating=============\n\n");
    8000a048:	00005517          	auipc	a0,0x5
    8000a04c:	c0050513          	addi	a0,a0,-1024 # 8000ec48 <CONSOLE_STATUS+0xc38>
    8000a050:	ffffb097          	auipc	ra,0xffffb
    8000a054:	094080e7          	jalr	148(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000a058:	00000913          	li	s2,0
    8000a05c:	09395a63          	bge	s2,s3,8000a0f0 <_Z18cache_dealloc_testPP11ObjectCacheic+0xd8>
        KPRINTARR(oc_arr, i, oc_arr[i]);
    8000a060:	00005517          	auipc	a0,0x5
    8000a064:	b8850513          	addi	a0,a0,-1144 # 8000ebe8 <CONSOLE_STATUS+0xbd8>
    8000a068:	ffffb097          	auipc	ra,0xffffb
    8000a06c:	07c080e7          	jalr	124(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a070:	00000613          	li	a2,0
    8000a074:	00a00593          	li	a1,10
    8000a078:	00090513          	mv	a0,s2
    8000a07c:	ffffb097          	auipc	ra,0xffffb
    8000a080:	0b0080e7          	jalr	176(ra) # 8000512c <_Z9kprintIntmib>
    8000a084:	00004517          	auipc	a0,0x4
    8000a088:	44c50513          	addi	a0,a0,1100 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000a08c:	ffffb097          	auipc	ra,0xffffb
    8000a090:	058080e7          	jalr	88(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a094:	00391493          	slli	s1,s2,0x3
    8000a098:	009a04b3          	add	s1,s4,s1
    8000a09c:	00000613          	li	a2,0
    8000a0a0:	01000593          	li	a1,16
    8000a0a4:	0004b503          	ld	a0,0(s1)
    8000a0a8:	ffffb097          	auipc	ra,0xffffb
    8000a0ac:	084080e7          	jalr	132(ra) # 8000512c <_Z9kprintIntmib>
    8000a0b0:	00004517          	auipc	a0,0x4
    8000a0b4:	2a850513          	addi	a0,a0,680 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a0b8:	ffffb097          	auipc	ra,0xffffb
    8000a0bc:	02c080e7          	jalr	44(ra) # 800050e4 <_Z12kprintStringPKc>
        if(oc_arr[i]){
    8000a0c0:	0004b503          	ld	a0,0(s1)
    8000a0c4:	00050c63          	beqz	a0,8000a0dc <_Z18cache_dealloc_testPP11ObjectCacheic+0xc4>
            delete oc_arr[i];
    8000a0c8:	fffff097          	auipc	ra,0xfffff
    8000a0cc:	810080e7          	jalr	-2032(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
            oc_arr[i] = 0;
    8000a0d0:	0004b023          	sd	zero,0(s1)
    for(int i = 0; i < size; i++){
    8000a0d4:	0019091b          	addiw	s2,s2,1
    8000a0d8:	f85ff06f          	j	8000a05c <_Z18cache_dealloc_testPP11ObjectCacheic+0x44>
            kprintString("Given address not valid!\n");
    8000a0dc:	00005517          	auipc	a0,0x5
    8000a0e0:	ba450513          	addi	a0,a0,-1116 # 8000ec80 <CONSOLE_STATUS+0xc70>
    8000a0e4:	ffffb097          	auipc	ra,0xffffb
    8000a0e8:	000080e7          	jalr	ra # 800050e4 <_Z12kprintStringPKc>
            return;
    8000a0ec:	0280006f          	j	8000a114 <_Z18cache_dealloc_testPP11ObjectCacheic+0xfc>
    SlabAl::getInstance().print_state(flags);
    8000a0f0:	fffff097          	auipc	ra,0xfffff
    8000a0f4:	04c080e7          	jalr	76(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a0f8:	000a8593          	mv	a1,s5
    8000a0fc:	fffff097          	auipc	ra,0xfffff
    8000a100:	0b4080e7          	jalr	180(ra) # 800091b0 <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Object Cache Dellocating End===========\n\n");
    8000a104:	00005517          	auipc	a0,0x5
    8000a108:	b9c50513          	addi	a0,a0,-1124 # 8000eca0 <CONSOLE_STATUS+0xc90>
    8000a10c:	ffffb097          	auipc	ra,0xffffb
    8000a110:	fd8080e7          	jalr	-40(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a114:	03813083          	ld	ra,56(sp)
    8000a118:	03013403          	ld	s0,48(sp)
    8000a11c:	02813483          	ld	s1,40(sp)
    8000a120:	02013903          	ld	s2,32(sp)
    8000a124:	01813983          	ld	s3,24(sp)
    8000a128:	01013a03          	ld	s4,16(sp)
    8000a12c:	00813a83          	ld	s5,8(sp)
    8000a130:	04010113          	addi	sp,sp,64
    8000a134:	00008067          	ret

000000008000a138 <_Z12kmalloc_testPPvimc>:
void kmalloc_test(void** buff_arr, int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    8000a138:	fc010113          	addi	sp,sp,-64
    8000a13c:	02113c23          	sd	ra,56(sp)
    8000a140:	02813823          	sd	s0,48(sp)
    8000a144:	02913423          	sd	s1,40(sp)
    8000a148:	03213023          	sd	s2,32(sp)
    8000a14c:	01313c23          	sd	s3,24(sp)
    8000a150:	01413823          	sd	s4,16(sp)
    8000a154:	01513423          	sd	s5,8(sp)
    8000a158:	01613023          	sd	s6,0(sp)
    8000a15c:	04010413          	addi	s0,sp,64
    8000a160:	00050a93          	mv	s5,a0
    8000a164:	00058993          	mv	s3,a1
    8000a168:	00060a13          	mv	s4,a2
    8000a16c:	00068b13          	mv	s6,a3
    kprintString("\n\n=============SMALL MEMORY BUFFER ALLOC=============\n\n");
    8000a170:	00005517          	auipc	a0,0x5
    8000a174:	b6850513          	addi	a0,a0,-1176 # 8000ecd8 <CONSOLE_STATUS+0xcc8>
    8000a178:	ffffb097          	auipc	ra,0xffffb
    8000a17c:	f6c080e7          	jalr	-148(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0 ; i < size; i++){
    8000a180:	00000913          	li	s2,0
    8000a184:	0b395063          	bge	s2,s3,8000a224 <_Z12kmalloc_testPPvimc+0xec>
        buff_arr[i] = SlabAllocator::getInstance().kmalloc(objsize);
    8000a188:	fffff097          	auipc	ra,0xfffff
    8000a18c:	fb4080e7          	jalr	-76(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a190:	00391493          	slli	s1,s2,0x3
    8000a194:	009a84b3          	add	s1,s5,s1
    8000a198:	000a0593          	mv	a1,s4
    8000a19c:	fffff097          	auipc	ra,0xfffff
    8000a1a0:	0a0080e7          	jalr	160(ra) # 8000923c <_ZN13SlabAllocator7kmallocEm>
    8000a1a4:	00a4b023          	sd	a0,0(s1)
        KPRINTARR(buff_arr, i, buff_arr[i]);
    8000a1a8:	00005517          	auipc	a0,0x5
    8000a1ac:	b6850513          	addi	a0,a0,-1176 # 8000ed10 <CONSOLE_STATUS+0xd00>
    8000a1b0:	ffffb097          	auipc	ra,0xffffb
    8000a1b4:	f34080e7          	jalr	-204(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a1b8:	00000613          	li	a2,0
    8000a1bc:	00a00593          	li	a1,10
    8000a1c0:	00090513          	mv	a0,s2
    8000a1c4:	ffffb097          	auipc	ra,0xffffb
    8000a1c8:	f68080e7          	jalr	-152(ra) # 8000512c <_Z9kprintIntmib>
    8000a1cc:	00004517          	auipc	a0,0x4
    8000a1d0:	30450513          	addi	a0,a0,772 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000a1d4:	ffffb097          	auipc	ra,0xffffb
    8000a1d8:	f10080e7          	jalr	-240(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a1dc:	00000613          	li	a2,0
    8000a1e0:	01000593          	li	a1,16
    8000a1e4:	0004b503          	ld	a0,0(s1)
    8000a1e8:	ffffb097          	auipc	ra,0xffffb
    8000a1ec:	f44080e7          	jalr	-188(ra) # 8000512c <_Z9kprintIntmib>
    8000a1f0:	00004517          	auipc	a0,0x4
    8000a1f4:	16850513          	addi	a0,a0,360 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a1f8:	ffffb097          	auipc	ra,0xffffb
    8000a1fc:	eec080e7          	jalr	-276(ra) # 800050e4 <_Z12kprintStringPKc>
        if(buff_arr[i] == nullptr){
    8000a200:	0004b783          	ld	a5,0(s1)
    8000a204:	00078663          	beqz	a5,8000a210 <_Z12kmalloc_testPPvimc+0xd8>
    for(int i = 0 ; i < size; i++){
    8000a208:	0019091b          	addiw	s2,s2,1
    8000a20c:	f79ff06f          	j	8000a184 <_Z12kmalloc_testPPvimc+0x4c>
            kprintString("Not enough memory left!\n");
    8000a210:	00005517          	auipc	a0,0x5
    8000a214:	9e050513          	addi	a0,a0,-1568 # 8000ebf0 <CONSOLE_STATUS+0xbe0>
    8000a218:	ffffb097          	auipc	ra,0xffffb
    8000a21c:	ecc080e7          	jalr	-308(ra) # 800050e4 <_Z12kprintStringPKc>
            return;
    8000a220:	0280006f          	j	8000a248 <_Z12kmalloc_testPPvimc+0x110>
    SlabAl::getInstance().print_state(flags);
    8000a224:	fffff097          	auipc	ra,0xfffff
    8000a228:	f18080e7          	jalr	-232(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a22c:	000b0593          	mv	a1,s6
    8000a230:	fffff097          	auipc	ra,0xfffff
    8000a234:	f80080e7          	jalr	-128(ra) # 800091b0 <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========SMALL MEMORY BUFFER ALLOC END===========\n\n");
    8000a238:	00005517          	auipc	a0,0x5
    8000a23c:	ae850513          	addi	a0,a0,-1304 # 8000ed20 <CONSOLE_STATUS+0xd10>
    8000a240:	ffffb097          	auipc	ra,0xffffb
    8000a244:	ea4080e7          	jalr	-348(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a248:	03813083          	ld	ra,56(sp)
    8000a24c:	03013403          	ld	s0,48(sp)
    8000a250:	02813483          	ld	s1,40(sp)
    8000a254:	02013903          	ld	s2,32(sp)
    8000a258:	01813983          	ld	s3,24(sp)
    8000a25c:	01013a03          	ld	s4,16(sp)
    8000a260:	00813a83          	ld	s5,8(sp)
    8000a264:	00013b03          	ld	s6,0(sp)
    8000a268:	04010113          	addi	sp,sp,64
    8000a26c:	00008067          	ret

000000008000a270 <_Z10kfree_testPPvic>:
void kfree_test(void** buff_arr, int size, char flags = Slab::pb_mask::FREE){
    8000a270:	fc010113          	addi	sp,sp,-64
    8000a274:	02113c23          	sd	ra,56(sp)
    8000a278:	02813823          	sd	s0,48(sp)
    8000a27c:	02913423          	sd	s1,40(sp)
    8000a280:	03213023          	sd	s2,32(sp)
    8000a284:	01313c23          	sd	s3,24(sp)
    8000a288:	01413823          	sd	s4,16(sp)
    8000a28c:	01513423          	sd	s5,8(sp)
    8000a290:	04010413          	addi	s0,sp,64
    8000a294:	00050a13          	mv	s4,a0
    8000a298:	00058993          	mv	s3,a1
    8000a29c:	00060a93          	mv	s5,a2
    kprintString("\n\n=============SMALL MEMORY BUFFER DEALLOC=============\n\n");
    8000a2a0:	00005517          	auipc	a0,0x5
    8000a2a4:	ab850513          	addi	a0,a0,-1352 # 8000ed58 <CONSOLE_STATUS+0xd48>
    8000a2a8:	ffffb097          	auipc	ra,0xffffb
    8000a2ac:	e3c080e7          	jalr	-452(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000a2b0:	00000913          	li	s2,0
    8000a2b4:	09395e63          	bge	s2,s3,8000a350 <_Z10kfree_testPPvic+0xe0>
        if(!buff_arr[i]){
    8000a2b8:	00391493          	slli	s1,s2,0x3
    8000a2bc:	009a04b3          	add	s1,s4,s1
    8000a2c0:	0004b783          	ld	a5,0(s1)
    8000a2c4:	06078c63          	beqz	a5,8000a33c <_Z10kfree_testPPvic+0xcc>
        KPRINTARR(buff_arr, i, buff_arr[i]);
    8000a2c8:	00005517          	auipc	a0,0x5
    8000a2cc:	a4850513          	addi	a0,a0,-1464 # 8000ed10 <CONSOLE_STATUS+0xd00>
    8000a2d0:	ffffb097          	auipc	ra,0xffffb
    8000a2d4:	e14080e7          	jalr	-492(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a2d8:	00000613          	li	a2,0
    8000a2dc:	00a00593          	li	a1,10
    8000a2e0:	00090513          	mv	a0,s2
    8000a2e4:	ffffb097          	auipc	ra,0xffffb
    8000a2e8:	e48080e7          	jalr	-440(ra) # 8000512c <_Z9kprintIntmib>
    8000a2ec:	00004517          	auipc	a0,0x4
    8000a2f0:	1e450513          	addi	a0,a0,484 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000a2f4:	ffffb097          	auipc	ra,0xffffb
    8000a2f8:	df0080e7          	jalr	-528(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a2fc:	00000613          	li	a2,0
    8000a300:	01000593          	li	a1,16
    8000a304:	0004b503          	ld	a0,0(s1)
    8000a308:	ffffb097          	auipc	ra,0xffffb
    8000a30c:	e24080e7          	jalr	-476(ra) # 8000512c <_Z9kprintIntmib>
    8000a310:	00004517          	auipc	a0,0x4
    8000a314:	04850513          	addi	a0,a0,72 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a318:	ffffb097          	auipc	ra,0xffffb
    8000a31c:	dcc080e7          	jalr	-564(ra) # 800050e4 <_Z12kprintStringPKc>
        SlabAl::getInstance().kfree(buff_arr[i]);
    8000a320:	fffff097          	auipc	ra,0xfffff
    8000a324:	e1c080e7          	jalr	-484(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a328:	0004b583          	ld	a1,0(s1)
    8000a32c:	fffff097          	auipc	ra,0xfffff
    8000a330:	f94080e7          	jalr	-108(ra) # 800092c0 <_ZN13SlabAllocator5kfreeEPv>
    for(int i = 0; i < size; i++){
    8000a334:	0019091b          	addiw	s2,s2,1
    8000a338:	f7dff06f          	j	8000a2b4 <_Z10kfree_testPPvic+0x44>
            kprintString("Invalid free address given!!");
    8000a33c:	00005517          	auipc	a0,0x5
    8000a340:	a5c50513          	addi	a0,a0,-1444 # 8000ed98 <CONSOLE_STATUS+0xd88>
    8000a344:	ffffb097          	auipc	ra,0xffffb
    8000a348:	da0080e7          	jalr	-608(ra) # 800050e4 <_Z12kprintStringPKc>
            return;
    8000a34c:	0280006f          	j	8000a374 <_Z10kfree_testPPvic+0x104>
    SlabAl::getInstance().print_state(flags); 
    8000a350:	fffff097          	auipc	ra,0xfffff
    8000a354:	dec080e7          	jalr	-532(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a358:	000a8593          	mv	a1,s5
    8000a35c:	fffff097          	auipc	ra,0xfffff
    8000a360:	e54080e7          	jalr	-428(ra) # 800091b0 <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========SMALL MEMORY BUFFER DEALLOC END===========\n\n");
    8000a364:	00005517          	auipc	a0,0x5
    8000a368:	a5450513          	addi	a0,a0,-1452 # 8000edb8 <CONSOLE_STATUS+0xda8>
    8000a36c:	ffffb097          	auipc	ra,0xffffb
    8000a370:	d78080e7          	jalr	-648(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a374:	03813083          	ld	ra,56(sp)
    8000a378:	03013403          	ld	s0,48(sp)
    8000a37c:	02813483          	ld	s1,40(sp)
    8000a380:	02013903          	ld	s2,32(sp)
    8000a384:	01813983          	ld	s3,24(sp)
    8000a388:	01013a03          	ld	s4,16(sp)
    8000a38c:	00813a83          	ld	s5,8(sp)
    8000a390:	04010113          	addi	sp,sp,64
    8000a394:	00008067          	ret

000000008000a398 <_Z25slab_allocator_state_ceckc>:
void slab_allocator_state_ceck(char flags = Slab::pb_mask::FREE){
    8000a398:	fe010113          	addi	sp,sp,-32
    8000a39c:	00113c23          	sd	ra,24(sp)
    8000a3a0:	00813823          	sd	s0,16(sp)
    8000a3a4:	00913423          	sd	s1,8(sp)
    8000a3a8:	02010413          	addi	s0,sp,32
    8000a3ac:	00050493          	mv	s1,a0
    kprintString("\n\n=============Slab Allocator State Check=============\n\n");
    8000a3b0:	00005517          	auipc	a0,0x5
    8000a3b4:	a4850513          	addi	a0,a0,-1464 # 8000edf8 <CONSOLE_STATUS+0xde8>
    8000a3b8:	ffffb097          	auipc	ra,0xffffb
    8000a3bc:	d2c080e7          	jalr	-724(ra) # 800050e4 <_Z12kprintStringPKc>
    SlabAl::getInstance().print_state(flags);
    8000a3c0:	fffff097          	auipc	ra,0xfffff
    8000a3c4:	d7c080e7          	jalr	-644(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    8000a3c8:	00048593          	mv	a1,s1
    8000a3cc:	fffff097          	auipc	ra,0xfffff
    8000a3d0:	de4080e7          	jalr	-540(ra) # 800091b0 <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Slab Allocator State Check End===========\n\n");
    8000a3d4:	00005517          	auipc	a0,0x5
    8000a3d8:	a6450513          	addi	a0,a0,-1436 # 8000ee38 <CONSOLE_STATUS+0xe28>
    8000a3dc:	ffffb097          	auipc	ra,0xffffb
    8000a3e0:	d08080e7          	jalr	-760(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a3e4:	01813083          	ld	ra,24(sp)
    8000a3e8:	01013403          	ld	s0,16(sp)
    8000a3ec:	00813483          	ld	s1,8(sp)
    8000a3f0:	02010113          	addi	sp,sp,32
    8000a3f4:	00008067          	ret

000000008000a3f8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec>:
void cache_obj_alloc_test(void** object, int size, ObjectCache* cache, char flags){
    8000a3f8:	fc010113          	addi	sp,sp,-64
    8000a3fc:	02113c23          	sd	ra,56(sp)
    8000a400:	02813823          	sd	s0,48(sp)
    8000a404:	02913423          	sd	s1,40(sp)
    8000a408:	03213023          	sd	s2,32(sp)
    8000a40c:	01313c23          	sd	s3,24(sp)
    8000a410:	01413823          	sd	s4,16(sp)
    8000a414:	01513423          	sd	s5,8(sp)
    8000a418:	01613023          	sd	s6,0(sp)
    8000a41c:	04010413          	addi	s0,sp,64
    8000a420:	00050a93          	mv	s5,a0
    8000a424:	00058a13          	mv	s4,a1
    8000a428:	00060993          	mv	s3,a2
    8000a42c:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Allocate Test=============\n\n");
    8000a430:	00005517          	auipc	a0,0x5
    8000a434:	a4850513          	addi	a0,a0,-1464 # 8000ee78 <CONSOLE_STATUS+0xe68>
    8000a438:	ffffb097          	auipc	ra,0xffffb
    8000a43c:	cac080e7          	jalr	-852(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000a440:	00000493          	li	s1,0
    8000a444:	0944da63          	bge	s1,s4,8000a4d8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0xe0>
        object[i] = cache->alloc_obj();
    8000a448:	00349913          	slli	s2,s1,0x3
    8000a44c:	012a8933          	add	s2,s5,s2
    8000a450:	00098513          	mv	a0,s3
    8000a454:	ffffe097          	auipc	ra,0xffffe
    8000a458:	280080e7          	jalr	640(ra) # 800086d4 <_ZN11ObjectCache9alloc_objEv>
    8000a45c:	00a93023          	sd	a0,0(s2)
        if(!object[i]){
    8000a460:	06050263          	beqz	a0,8000a4c4 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0xcc>
        KPRINTARR(object, i, object[i]);
    8000a464:	00005517          	auipc	a0,0x5
    8000a468:	a7450513          	addi	a0,a0,-1420 # 8000eed8 <CONSOLE_STATUS+0xec8>
    8000a46c:	ffffb097          	auipc	ra,0xffffb
    8000a470:	c78080e7          	jalr	-904(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a474:	00000613          	li	a2,0
    8000a478:	00a00593          	li	a1,10
    8000a47c:	00048513          	mv	a0,s1
    8000a480:	ffffb097          	auipc	ra,0xffffb
    8000a484:	cac080e7          	jalr	-852(ra) # 8000512c <_Z9kprintIntmib>
    8000a488:	00004517          	auipc	a0,0x4
    8000a48c:	04850513          	addi	a0,a0,72 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000a490:	ffffb097          	auipc	ra,0xffffb
    8000a494:	c54080e7          	jalr	-940(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a498:	00000613          	li	a2,0
    8000a49c:	01000593          	li	a1,16
    8000a4a0:	00093503          	ld	a0,0(s2)
    8000a4a4:	ffffb097          	auipc	ra,0xffffb
    8000a4a8:	c88080e7          	jalr	-888(ra) # 8000512c <_Z9kprintIntmib>
    8000a4ac:	00004517          	auipc	a0,0x4
    8000a4b0:	eac50513          	addi	a0,a0,-340 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a4b4:	ffffb097          	auipc	ra,0xffffb
    8000a4b8:	c30080e7          	jalr	-976(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000a4bc:	0014849b          	addiw	s1,s1,1
    8000a4c0:	f85ff06f          	j	8000a444 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0x4c>
            kprintString("Object not corresctly allocated!!\n");   
    8000a4c4:	00005517          	auipc	a0,0x5
    8000a4c8:	9ec50513          	addi	a0,a0,-1556 # 8000eeb0 <CONSOLE_STATUS+0xea0>
    8000a4cc:	ffffb097          	auipc	ra,0xffffb
    8000a4d0:	c18080e7          	jalr	-1000(ra) # 800050e4 <_Z12kprintStringPKc>
            return;
    8000a4d4:	0300006f          	j	8000a504 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0x10c>
    cache->printInfo(flags);
    8000a4d8:	000b0593          	mv	a1,s6
    8000a4dc:	00098513          	mv	a0,s3
    8000a4e0:	ffffe097          	auipc	ra,0xffffe
    8000a4e4:	d48080e7          	jalr	-696(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>
    slab_allocator_state_ceck(flags);
    8000a4e8:	000b0513          	mv	a0,s6
    8000a4ec:	00000097          	auipc	ra,0x0
    8000a4f0:	eac080e7          	jalr	-340(ra) # 8000a398 <_Z25slab_allocator_state_ceckc>
    kprintString("\n\n===========Object Allocate Test End===========\n\n");
    8000a4f4:	00005517          	auipc	a0,0x5
    8000a4f8:	9ec50513          	addi	a0,a0,-1556 # 8000eee0 <CONSOLE_STATUS+0xed0>
    8000a4fc:	ffffb097          	auipc	ra,0xffffb
    8000a500:	be8080e7          	jalr	-1048(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a504:	03813083          	ld	ra,56(sp)
    8000a508:	03013403          	ld	s0,48(sp)
    8000a50c:	02813483          	ld	s1,40(sp)
    8000a510:	02013903          	ld	s2,32(sp)
    8000a514:	01813983          	ld	s3,24(sp)
    8000a518:	01013a03          	ld	s4,16(sp)
    8000a51c:	00813a83          	ld	s5,8(sp)
    8000a520:	00013b03          	ld	s6,0(sp)
    8000a524:	04010113          	addi	sp,sp,64
    8000a528:	00008067          	ret

000000008000a52c <_Z23cache_obj_dealloca_testPPviP11ObjectCachec>:
void cache_obj_dealloca_test(void** object, int size, ObjectCache* cache, char flags){
    8000a52c:	fc010113          	addi	sp,sp,-64
    8000a530:	02113c23          	sd	ra,56(sp)
    8000a534:	02813823          	sd	s0,48(sp)
    8000a538:	02913423          	sd	s1,40(sp)
    8000a53c:	03213023          	sd	s2,32(sp)
    8000a540:	01313c23          	sd	s3,24(sp)
    8000a544:	01413823          	sd	s4,16(sp)
    8000a548:	01513423          	sd	s5,8(sp)
    8000a54c:	01613023          	sd	s6,0(sp)
    8000a550:	04010413          	addi	s0,sp,64
    8000a554:	00050a93          	mv	s5,a0
    8000a558:	00058993          	mv	s3,a1
    8000a55c:	00060a13          	mv	s4,a2
    8000a560:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Deallocate Test=============\n\n");
    8000a564:	00005517          	auipc	a0,0x5
    8000a568:	9b450513          	addi	a0,a0,-1612 # 8000ef18 <CONSOLE_STATUS+0xf08>
    8000a56c:	ffffb097          	auipc	ra,0xffffb
    8000a570:	b78080e7          	jalr	-1160(ra) # 800050e4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000a574:	00000493          	li	s1,0
    8000a578:	0934da63          	bge	s1,s3,8000a60c <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0xe0>
        KPRINTARR(object, i, object[i]);
    8000a57c:	00005517          	auipc	a0,0x5
    8000a580:	95c50513          	addi	a0,a0,-1700 # 8000eed8 <CONSOLE_STATUS+0xec8>
    8000a584:	ffffb097          	auipc	ra,0xffffb
    8000a588:	b60080e7          	jalr	-1184(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a58c:	00000613          	li	a2,0
    8000a590:	00a00593          	li	a1,10
    8000a594:	00048513          	mv	a0,s1
    8000a598:	ffffb097          	auipc	ra,0xffffb
    8000a59c:	b94080e7          	jalr	-1132(ra) # 8000512c <_Z9kprintIntmib>
    8000a5a0:	00004517          	auipc	a0,0x4
    8000a5a4:	f3050513          	addi	a0,a0,-208 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000a5a8:	ffffb097          	auipc	ra,0xffffb
    8000a5ac:	b3c080e7          	jalr	-1220(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a5b0:	00349913          	slli	s2,s1,0x3
    8000a5b4:	012a8933          	add	s2,s5,s2
    8000a5b8:	00000613          	li	a2,0
    8000a5bc:	01000593          	li	a1,16
    8000a5c0:	00093503          	ld	a0,0(s2)
    8000a5c4:	ffffb097          	auipc	ra,0xffffb
    8000a5c8:	b68080e7          	jalr	-1176(ra) # 8000512c <_Z9kprintIntmib>
    8000a5cc:	00004517          	auipc	a0,0x4
    8000a5d0:	d8c50513          	addi	a0,a0,-628 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a5d4:	ffffb097          	auipc	ra,0xffffb
    8000a5d8:	b10080e7          	jalr	-1264(ra) # 800050e4 <_Z12kprintStringPKc>
        if(!object[i]){
    8000a5dc:	00093583          	ld	a1,0(s2)
    8000a5e0:	00058c63          	beqz	a1,8000a5f8 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0xcc>
        cache->free_obj(object[i]);
    8000a5e4:	000a0513          	mv	a0,s4
    8000a5e8:	ffffe097          	auipc	ra,0xffffe
    8000a5ec:	1c0080e7          	jalr	448(ra) # 800087a8 <_ZN11ObjectCache8free_objEPv>
    for(int i = 0; i < size; i++){
    8000a5f0:	0014849b          	addiw	s1,s1,1
    8000a5f4:	f85ff06f          	j	8000a578 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0x4c>
            kprintString("Invalid object address!\n");   
    8000a5f8:	00005517          	auipc	a0,0x5
    8000a5fc:	95850513          	addi	a0,a0,-1704 # 8000ef50 <CONSOLE_STATUS+0xf40>
    8000a600:	ffffb097          	auipc	ra,0xffffb
    8000a604:	ae4080e7          	jalr	-1308(ra) # 800050e4 <_Z12kprintStringPKc>
            return;
    8000a608:	0300006f          	j	8000a638 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0x10c>
    cache->printInfo(flags);
    8000a60c:	000b0593          	mv	a1,s6
    8000a610:	000a0513          	mv	a0,s4
    8000a614:	ffffe097          	auipc	ra,0xffffe
    8000a618:	c14080e7          	jalr	-1004(ra) # 80008228 <_ZN11ObjectCache9printInfoEc>
    slab_allocator_state_ceck(flags);
    8000a61c:	000b0513          	mv	a0,s6
    8000a620:	00000097          	auipc	ra,0x0
    8000a624:	d78080e7          	jalr	-648(ra) # 8000a398 <_Z25slab_allocator_state_ceckc>
    kprintString("\n\n=============Object Dellocate Test End=============\n\n");
    8000a628:	00005517          	auipc	a0,0x5
    8000a62c:	94850513          	addi	a0,a0,-1720 # 8000ef70 <CONSOLE_STATUS+0xf60>
    8000a630:	ffffb097          	auipc	ra,0xffffb
    8000a634:	ab4080e7          	jalr	-1356(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000a638:	03813083          	ld	ra,56(sp)
    8000a63c:	03013403          	ld	s0,48(sp)
    8000a640:	02813483          	ld	s1,40(sp)
    8000a644:	02013903          	ld	s2,32(sp)
    8000a648:	01813983          	ld	s3,24(sp)
    8000a64c:	01013a03          	ld	s4,16(sp)
    8000a650:	00813a83          	ld	s5,8(sp)
    8000a654:	00013b03          	ld	s6,0(sp)
    8000a658:	04010113          	addi	sp,sp,64
    8000a65c:	00008067          	ret

000000008000a660 <_Z9slab_testv>:


void slab_test(){
    8000a660:	f4010113          	addi	sp,sp,-192
    8000a664:	0a113c23          	sd	ra,184(sp)
    8000a668:	0a813823          	sd	s0,176(sp)
    8000a66c:	0a913423          	sd	s1,168(sp)
    8000a670:	0b213023          	sd	s2,160(sp)
    8000a674:	0c010413          	addi	s0,sp,192
    kprintString("\n\n--------SLAB TEST--------\n\n");
    8000a678:	00005517          	auipc	a0,0x5
    8000a67c:	93050513          	addi	a0,a0,-1744 # 8000efa8 <CONSOLE_STATUS+0xf98>
    8000a680:	ffffb097          	auipc	ra,0xffffb
    8000a684:	a64080e7          	jalr	-1436(ra) # 800050e4 <_Z12kprintStringPKc>
    
    kprintString("Slab Allocator init!\n");
    8000a688:	00005517          	auipc	a0,0x5
    8000a68c:	94050513          	addi	a0,a0,-1728 # 8000efc8 <CONSOLE_STATUS+0xfb8>
    8000a690:	ffffb097          	auipc	ra,0xffffb
    8000a694:	a54080e7          	jalr	-1452(ra) # 800050e4 <_Z12kprintStringPKc>
    SlabAl::getInstance();
    8000a698:	fffff097          	auipc	ra,0xfffff
    8000a69c:	aa4080e7          	jalr	-1372(ra) # 8000913c <_ZN13SlabAllocator11getInstanceEv>
    // slab_allocator_state_ceck(Slab::pb_mask::ALLOC);
    
    char flagAllocFree = Slab::pb_mask::ALLOC | Slab::pb_mask::FREE;

     int size = 10;
     ObjectCache** oc = (ObjectCache**)NoAlloc::mem_alloc(size*sizeof(ObjectCache*));
    8000a6a0:	05000513          	li	a0,80
    8000a6a4:	ffffd097          	auipc	ra,0xffffd
    8000a6a8:	714080e7          	jalr	1812(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000a6ac:	00050913          	mv	s2,a0
     cache_alloc_test(oc, size, 32, flagAllocFree);
    8000a6b0:	00300693          	li	a3,3
    8000a6b4:	02000613          	li	a2,32
    8000a6b8:	00a00593          	li	a1,10
    8000a6bc:	fffff097          	auipc	ra,0xfffff
    8000a6c0:	790080e7          	jalr	1936(ra) # 80009e4c <_Z16cache_alloc_testPP11ObjectCacheimc>

    //int obj_num = 20;
    KSemaphore* x[20];
    ObjectCache* semaphore_cache = new ObjectCache("ksemaphore_cache", sizeof(KSemaphore), ctor, nullptr);
    8000a6c4:	05800513          	li	a0,88
    8000a6c8:	ffffe097          	auipc	ra,0xffffe
    8000a6cc:	0b0080e7          	jalr	176(ra) # 80008778 <_ZN11ObjectCachenwEm>
    8000a6d0:	00050493          	mv	s1,a0
    8000a6d4:	00000793          	li	a5,0
    8000a6d8:	00000713          	li	a4,0
    8000a6dc:	fffff697          	auipc	a3,0xfffff
    8000a6e0:	6fc68693          	addi	a3,a3,1788 # 80009dd8 <_Z4ctorPv>
    8000a6e4:	02800613          	li	a2,40
    8000a6e8:	00005597          	auipc	a1,0x5
    8000a6ec:	8f858593          	addi	a1,a1,-1800 # 8000efe0 <CONSOLE_STATUS+0xfd0>
    8000a6f0:	ffffe097          	auipc	ra,0xffffe
    8000a6f4:	86c080e7          	jalr	-1940(ra) # 80007f5c <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>

    cache_obj_alloc_test((void**)x, 10, semaphore_cache, flagAllocFree);
    8000a6f8:	00300693          	li	a3,3
    8000a6fc:	00048613          	mv	a2,s1
    8000a700:	00a00593          	li	a1,10
    8000a704:	f4040513          	addi	a0,s0,-192
    8000a708:	00000097          	auipc	ra,0x0
    8000a70c:	cf0080e7          	jalr	-784(ra) # 8000a3f8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec>

    KCHECKPRINT(x[1]->get_val());
    8000a710:	00005517          	auipc	a0,0x5
    8000a714:	8e850513          	addi	a0,a0,-1816 # 8000eff8 <CONSOLE_STATUS+0xfe8>
    8000a718:	ffffb097          	auipc	ra,0xffffb
    8000a71c:	9cc080e7          	jalr	-1588(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a720:	00000613          	li	a2,0
    8000a724:	01000593          	li	a1,16
    8000a728:	f4843783          	ld	a5,-184(s0)
    8000a72c:	0087e503          	lwu	a0,8(a5)
    8000a730:	ffffb097          	auipc	ra,0xffffb
    8000a734:	9fc080e7          	jalr	-1540(ra) # 8000512c <_Z9kprintIntmib>
    8000a738:	00004517          	auipc	a0,0x4
    8000a73c:	c2050513          	addi	a0,a0,-992 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a740:	ffffb097          	auipc	ra,0xffffb
    8000a744:	9a4080e7          	jalr	-1628(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(x[8]->get_val());
    8000a748:	00005517          	auipc	a0,0x5
    8000a74c:	8c850513          	addi	a0,a0,-1848 # 8000f010 <CONSOLE_STATUS+0x1000>
    8000a750:	ffffb097          	auipc	ra,0xffffb
    8000a754:	994080e7          	jalr	-1644(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a758:	00000613          	li	a2,0
    8000a75c:	01000593          	li	a1,16
    8000a760:	f8043783          	ld	a5,-128(s0)
    8000a764:	0087e503          	lwu	a0,8(a5)
    8000a768:	ffffb097          	auipc	ra,0xffffb
    8000a76c:	9c4080e7          	jalr	-1596(ra) # 8000512c <_Z9kprintIntmib>
    8000a770:	00004517          	auipc	a0,0x4
    8000a774:	be850513          	addi	a0,a0,-1048 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a778:	ffffb097          	auipc	ra,0xffffb
    8000a77c:	96c080e7          	jalr	-1684(ra) # 800050e4 <_Z12kprintStringPKc>

    cache_dealloc_test(oc, size, flagAllocFree);
    8000a780:	00300613          	li	a2,3
    8000a784:	00a00593          	li	a1,10
    8000a788:	00090513          	mv	a0,s2
    8000a78c:	00000097          	auipc	ra,0x0
    8000a790:	88c080e7          	jalr	-1908(ra) # 8000a018 <_Z18cache_dealloc_testPP11ObjectCacheic>

    
    
   
   
    kprintString("\n\n------SLAB TEST END------\n\n");
    8000a794:	00005517          	auipc	a0,0x5
    8000a798:	89450513          	addi	a0,a0,-1900 # 8000f028 <CONSOLE_STATUS+0x1018>
    8000a79c:	ffffb097          	auipc	ra,0xffffb
    8000a7a0:	948080e7          	jalr	-1720(ra) # 800050e4 <_Z12kprintStringPKc>


    8000a7a4:	0b813083          	ld	ra,184(sp)
    8000a7a8:	0b013403          	ld	s0,176(sp)
    8000a7ac:	0a813483          	ld	s1,168(sp)
    8000a7b0:	0a013903          	ld	s2,160(sp)
    8000a7b4:	0c010113          	addi	sp,sp,192
    8000a7b8:	00008067          	ret
    8000a7bc:	00050913          	mv	s2,a0
    ObjectCache* semaphore_cache = new ObjectCache("ksemaphore_cache", sizeof(KSemaphore), ctor, nullptr);
    8000a7c0:	00048513          	mv	a0,s1
    8000a7c4:	ffffe097          	auipc	ra,0xffffe
    8000a7c8:	114080e7          	jalr	276(ra) # 800088d8 <_ZN11ObjectCachedlEPv>
    8000a7cc:	00090513          	mv	a0,s2
    8000a7d0:	0000b097          	auipc	ra,0xb
    8000a7d4:	d78080e7          	jalr	-648(ra) # 80015548 <_Unwind_Resume>

000000008000a7d8 <_ZN13TreeLikeBuddyC1EPvm>:
#include"../../h/kernel_lib.h"
#include"../../h/tree_like_buddy.h"
TreeLikeBuddy* TreeLikeBuddy::buddy = nullptr;
uchar TreeLikeBuddy::BLOCK_SIZE_BIT_LEN = 0;
TreeLikeBuddy::TreeLikeBuddy(void* saddr, size_t sz){
    8000a7d8:	fd010113          	addi	sp,sp,-48
    8000a7dc:	02113423          	sd	ra,40(sp)
    8000a7e0:	02813023          	sd	s0,32(sp)
    8000a7e4:	00913c23          	sd	s1,24(sp)
    8000a7e8:	01213823          	sd	s2,16(sp)
    8000a7ec:	01313423          	sd	s3,8(sp)
    8000a7f0:	01413023          	sd	s4,0(sp)
    8000a7f4:	03010413          	addi	s0,sp,48
    8000a7f8:	00050493          	mv	s1,a0
    /* --------Memory Meta Init-------- */
    mmeta_num = log2(sz) + 1;
    8000a7fc:	00060513          	mv	a0,a2
    8000a800:	ffffb097          	auipc	ra,0xffffb
    8000a804:	29c080e7          	jalr	668(ra) # 80005a9c <_Z4log2m>
    8000a808:	0015051b          	addiw	a0,a0,1
    8000a80c:	0ff57513          	andi	a0,a0,255
    8000a810:	02a48023          	sb	a0,32(s1)
    mmeta_s = (uint64*)NoAlloc::mem_alloc(mmeta_num * sizeof(uint64));
    8000a814:	00351513          	slli	a0,a0,0x3
    8000a818:	ffffd097          	auipc	ra,0xffffd
    8000a81c:	5a0080e7          	jalr	1440(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000a820:	00a4bc23          	sd	a0,24(s1)
    if(!mmeta_s) { /* TODO: panic */ }
    mmeta = (alloc_t**) NoAlloc::mem_alloc(mmeta_num * sizeof(alloc_t*));
    8000a824:	0204c503          	lbu	a0,32(s1)
    8000a828:	00351513          	slli	a0,a0,0x3
    8000a82c:	ffffd097          	auipc	ra,0xffffd
    8000a830:	58c080e7          	jalr	1420(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000a834:	00a4b823          	sd	a0,16(s1)
    if(!mmeta) { /* TODO: panic */ }
    for(uchar i = 0; i < mmeta_num; i++){
    8000a838:	00000993          	li	s3,0
    8000a83c:	00c0006f          	j	8000a848 <_ZN13TreeLikeBuddyC1EPvm+0x70>
    8000a840:	0019899b          	addiw	s3,s3,1
    8000a844:	0ff9f993          	andi	s3,s3,255
    8000a848:	0204c783          	lbu	a5,32(s1)
    8000a84c:	06f9fa63          	bgeu	s3,a5,8000a8c0 <_ZN13TreeLikeBuddyC1EPvm+0xe8>
        mmeta_s[i] = 1ULL << (mmeta_num - i - 1);
    8000a850:	413787bb          	subw	a5,a5,s3
    8000a854:	fff7879b          	addiw	a5,a5,-1
    8000a858:	0184b703          	ld	a4,24(s1)
    8000a85c:	00399913          	slli	s2,s3,0x3
    8000a860:	01270733          	add	a4,a4,s2
    8000a864:	00100693          	li	a3,1
    8000a868:	00f697b3          	sll	a5,a3,a5
    8000a86c:	00f73023          	sd	a5,0(a4)
        mmeta[i] = (alloc_t*) NoAlloc::mem_alloc(mmeta_s[i] * sizeof(alloc_t));
    8000a870:	0184b783          	ld	a5,24(s1)
    8000a874:	012787b3          	add	a5,a5,s2
    8000a878:	0104ba03          	ld	s4,16(s1)
    8000a87c:	012a0a33          	add	s4,s4,s2
    8000a880:	0007b503          	ld	a0,0(a5)
    8000a884:	ffffd097          	auipc	ra,0xffffd
    8000a888:	534080e7          	jalr	1332(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000a88c:	00aa3023          	sd	a0,0(s4)
        if(!mmeta[i]) { /* TODO: panic */ }
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    8000a890:	00000713          	li	a4,0
    8000a894:	0184b783          	ld	a5,24(s1)
    8000a898:	012787b3          	add	a5,a5,s2
    8000a89c:	0007b783          	ld	a5,0(a5)
    8000a8a0:	faf770e3          	bgeu	a4,a5,8000a840 <_ZN13TreeLikeBuddyC1EPvm+0x68>
            mmeta[i][j] = alloc_t::ALLOC; 
    8000a8a4:	0104b783          	ld	a5,16(s1)
    8000a8a8:	012787b3          	add	a5,a5,s2
    8000a8ac:	0007b783          	ld	a5,0(a5)
    8000a8b0:	00e787b3          	add	a5,a5,a4
    8000a8b4:	00078023          	sb	zero,0(a5)
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    8000a8b8:	00170713          	addi	a4,a4,1
    8000a8bc:	fd9ff06f          	j	8000a894 <_ZN13TreeLikeBuddyC1EPvm+0xbc>
    }
    mmeta[mmeta_num - 1][0] = alloc_t::FREE;
    8000a8c0:	0104b703          	ld	a4,16(s1)
    8000a8c4:	00379793          	slli	a5,a5,0x3
    8000a8c8:	ff878793          	addi	a5,a5,-8
    8000a8cc:	00f707b3          	add	a5,a4,a5
    8000a8d0:	0007b783          	ld	a5,0(a5)
    8000a8d4:	00100713          	li	a4,1
    8000a8d8:	00e78023          	sb	a4,0(a5)
}
    8000a8dc:	02813083          	ld	ra,40(sp)
    8000a8e0:	02013403          	ld	s0,32(sp)
    8000a8e4:	01813483          	ld	s1,24(sp)
    8000a8e8:	01013903          	ld	s2,16(sp)
    8000a8ec:	00813983          	ld	s3,8(sp)
    8000a8f0:	00013a03          	ld	s4,0(sp)
    8000a8f4:	03010113          	addi	sp,sp,48
    8000a8f8:	00008067          	ret

000000008000a8fc <_ZN13TreeLikeBuddy12status_printEv>:

void TreeLikeBuddy::status_print(){
    8000a8fc:	fe010113          	addi	sp,sp,-32
    8000a900:	00113c23          	sd	ra,24(sp)
    8000a904:	00813823          	sd	s0,16(sp)
    8000a908:	00913423          	sd	s1,8(sp)
    8000a90c:	02010413          	addi	s0,sp,32
    if(!buddy){
    8000a910:	0000a797          	auipc	a5,0xa
    8000a914:	af878793          	addi	a5,a5,-1288 # 80014408 <_ZN13TreeLikeBuddy5buddyE>
    8000a918:	0007b783          	ld	a5,0(a5)
    8000a91c:	10078063          	beqz	a5,8000aa1c <_ZN13TreeLikeBuddy12status_printEv+0x120>
    8000a920:	00050493          	mv	s1,a0
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    8000a924:	00004517          	auipc	a0,0x4
    8000a928:	bdc50513          	addi	a0,a0,-1060 # 8000e500 <CONSOLE_STATUS+0x4f0>
    8000a92c:	ffffa097          	auipc	ra,0xffffa
    8000a930:	7b8080e7          	jalr	1976(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    8000a934:	00004517          	auipc	a0,0x4
    8000a938:	bec50513          	addi	a0,a0,-1044 # 8000e520 <CONSOLE_STATUS+0x510>
    8000a93c:	ffffa097          	auipc	ra,0xffffa
    8000a940:	7a8080e7          	jalr	1960(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a944:	00000613          	li	a2,0
    8000a948:	01000593          	li	a1,16
    8000a94c:	0000a797          	auipc	a5,0xa
    8000a950:	abc78793          	addi	a5,a5,-1348 # 80014408 <_ZN13TreeLikeBuddy5buddyE>
    8000a954:	0007b503          	ld	a0,0(a5)
    8000a958:	ffffa097          	auipc	ra,0xffffa
    8000a95c:	7d4080e7          	jalr	2004(ra) # 8000512c <_Z9kprintIntmib>
    8000a960:	00004517          	auipc	a0,0x4
    8000a964:	9f850513          	addi	a0,a0,-1544 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a968:	ffffa097          	auipc	ra,0xffffa
    8000a96c:	77c080e7          	jalr	1916(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    8000a970:	00004517          	auipc	a0,0x4
    8000a974:	bb850513          	addi	a0,a0,-1096 # 8000e528 <CONSOLE_STATUS+0x518>
    8000a978:	ffffa097          	auipc	ra,0xffffa
    8000a97c:	76c080e7          	jalr	1900(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a980:	00000613          	li	a2,0
    8000a984:	01000593          	li	a1,16
    8000a988:	0004b503          	ld	a0,0(s1)
    8000a98c:	ffffa097          	auipc	ra,0xffffa
    8000a990:	7a0080e7          	jalr	1952(ra) # 8000512c <_Z9kprintIntmib>
    8000a994:	00004517          	auipc	a0,0x4
    8000a998:	9c450513          	addi	a0,a0,-1596 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a99c:	ffffa097          	auipc	ra,0xffffa
    8000a9a0:	748080e7          	jalr	1864(ra) # 800050e4 <_Z12kprintStringPKc>
    KCHECKPRINT(size);
    8000a9a4:	00004517          	auipc	a0,0x4
    8000a9a8:	6a450513          	addi	a0,a0,1700 # 8000f048 <CONSOLE_STATUS+0x1038>
    8000a9ac:	ffffa097          	auipc	ra,0xffffa
    8000a9b0:	738080e7          	jalr	1848(ra) # 800050e4 <_Z12kprintStringPKc>
    8000a9b4:	00000613          	li	a2,0
    8000a9b8:	01000593          	li	a1,16
    8000a9bc:	0084b503          	ld	a0,8(s1)
    8000a9c0:	ffffa097          	auipc	ra,0xffffa
    8000a9c4:	76c080e7          	jalr	1900(ra) # 8000512c <_Z9kprintIntmib>
    8000a9c8:	00004517          	auipc	a0,0x4
    8000a9cc:	99050513          	addi	a0,a0,-1648 # 8000e358 <CONSOLE_STATUS+0x348>
    8000a9d0:	ffffa097          	auipc	ra,0xffffa
    8000a9d4:	714080e7          	jalr	1812(ra) # 800050e4 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    8000a9d8:	00004517          	auipc	a0,0x4
    8000a9dc:	b7050513          	addi	a0,a0,-1168 # 8000e548 <CONSOLE_STATUS+0x538>
    8000a9e0:	ffffa097          	auipc	ra,0xffffa
    8000a9e4:	704080e7          	jalr	1796(ra) # 800050e4 <_Z12kprintStringPKc>
    /**/
    kprintString("\t----END MEMORY META----\n");
    8000a9e8:	00004517          	auipc	a0,0x4
    8000a9ec:	b9850513          	addi	a0,a0,-1128 # 8000e580 <CONSOLE_STATUS+0x570>
    8000a9f0:	ffffa097          	auipc	ra,0xffffa
    8000a9f4:	6f4080e7          	jalr	1780(ra) # 800050e4 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    8000a9f8:	00004517          	auipc	a0,0x4
    8000a9fc:	ba850513          	addi	a0,a0,-1112 # 8000e5a0 <CONSOLE_STATUS+0x590>
    8000aa00:	ffffa097          	auipc	ra,0xffffa
    8000aa04:	6e4080e7          	jalr	1764(ra) # 800050e4 <_Z12kprintStringPKc>

    8000aa08:	01813083          	ld	ra,24(sp)
    8000aa0c:	01013403          	ld	s0,16(sp)
    8000aa10:	00813483          	ld	s1,8(sp)
    8000aa14:	02010113          	addi	sp,sp,32
    8000aa18:	00008067          	ret
        kprintString("BUDDY NOT INITALIZED!!!");
    8000aa1c:	00004517          	auipc	a0,0x4
    8000aa20:	acc50513          	addi	a0,a0,-1332 # 8000e4e8 <CONSOLE_STATUS+0x4d8>
    8000aa24:	ffffa097          	auipc	ra,0xffffa
    8000aa28:	6c0080e7          	jalr	1728(ra) # 800050e4 <_Z12kprintStringPKc>
        return;
    8000aa2c:	fddff06f          	j	8000aa08 <_ZN13TreeLikeBuddy12status_printEv+0x10c>

000000008000aa30 <_ZN6list_tC1EPS_S0_>:
#include"../../../h/kernel_lib.h"

list_t::list_t(list_t* t_next, list_t* t_prev):next(t_next),prev(t_prev){}
    8000aa30:	ff010113          	addi	sp,sp,-16
    8000aa34:	00813423          	sd	s0,8(sp)
    8000aa38:	01010413          	addi	s0,sp,16
    8000aa3c:	00b53023          	sd	a1,0(a0)
    8000aa40:	00c53423          	sd	a2,8(a0)
    8000aa44:	00813403          	ld	s0,8(sp)
    8000aa48:	01010113          	addi	sp,sp,16
    8000aa4c:	00008067          	ret

000000008000aa50 <_Z6removeP6list_t>:

list_t* remove(list_t* head){
    8000aa50:	ff010113          	addi	sp,sp,-16
    8000aa54:	00813423          	sd	s0,8(sp)
    8000aa58:	01010413          	addi	s0,sp,16
    8000aa5c:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    8000aa60:	02050863          	beqz	a0,8000aa90 <_Z6removeP6list_t+0x40>

    if(head->next) head -> next -> prev = head -> prev;
    8000aa64:	00053703          	ld	a4,0(a0)
    8000aa68:	00070663          	beqz	a4,8000aa74 <_Z6removeP6list_t+0x24>
    8000aa6c:	00853683          	ld	a3,8(a0)
    8000aa70:	00d73423          	sd	a3,8(a4)
    if(head->prev) head -> prev -> next = head -> next;
    8000aa74:	0087b703          	ld	a4,8(a5)
    8000aa78:	00070663          	beqz	a4,8000aa84 <_Z6removeP6list_t+0x34>
    8000aa7c:	0007b683          	ld	a3,0(a5)
    8000aa80:	00d73023          	sd	a3,0(a4)
    list_t* node = head;
    head = head->next;
    8000aa84:	0007b503          	ld	a0,0(a5)
    node -> next = nullptr;
    8000aa88:	0007b023          	sd	zero,0(a5)
    node -> prev = nullptr;
    8000aa8c:	0007b423          	sd	zero,8(a5)

    return head; 
}
    8000aa90:	00813403          	ld	s0,8(sp)
    8000aa94:	01010113          	addi	sp,sp,16
    8000aa98:	00008067          	ret

000000008000aa9c <_Z6insertP6list_tS0_>:
list_t* insert(list_t* node, list_t* head){
    8000aa9c:	ff010113          	addi	sp,sp,-16
    8000aaa0:	00813423          	sd	s0,8(sp)
    8000aaa4:	01010413          	addi	s0,sp,16
    if(!node) return head;
    8000aaa8:	02050863          	beqz	a0,8000aad8 <_Z6insertP6list_tS0_+0x3c>
    node->next = nullptr;
    node->prev = nullptr;
    8000aaac:	00053423          	sd	zero,8(a0)

    node -> next = head;
    8000aab0:	00b53023          	sd	a1,0(a0)
    if(head){
    8000aab4:	00058c63          	beqz	a1,8000aacc <_Z6insertP6list_tS0_+0x30>
        node -> prev = head->prev;
    8000aab8:	0085b783          	ld	a5,8(a1)
    8000aabc:	00f53423          	sd	a5,8(a0)
        if(head->prev) head->prev->next = node;
    8000aac0:	00078463          	beqz	a5,8000aac8 <_Z6insertP6list_tS0_+0x2c>
    8000aac4:	00a7b023          	sd	a0,0(a5)
        head->prev = node;
    8000aac8:	00a5b423          	sd	a0,8(a1)
    }
    return node;
}
    8000aacc:	00813403          	ld	s0,8(sp)
    8000aad0:	01010113          	addi	sp,sp,16
    8000aad4:	00008067          	ret
    if(!node) return head;
    8000aad8:	00058513          	mv	a0,a1
    8000aadc:	ff1ff06f          	j	8000aacc <_Z6insertP6list_tS0_+0x30>

000000008000aae0 <_ZN5PagerC1Ev>:
#include"../../../h/kernel_lib.h"

Pager* Pager::p = nullptr;

Pager::Pager():pmt(nullptr){}
    8000aae0:	ff010113          	addi	sp,sp,-16
    8000aae4:	00813423          	sd	s0,8(sp)
    8000aae8:	01010413          	addi	s0,sp,16
    8000aaec:	00053023          	sd	zero,0(a0)
    8000aaf0:	00813403          	ld	s0,8(sp)
    8000aaf4:	01010113          	addi	sp,sp,16
    8000aaf8:	00008067          	ret

000000008000aafc <_ZN5Pager11getInstanceEv>:

Pager& Pager::getInstance(){
    if(!p) p = new Pager();
    8000aafc:	0000a797          	auipc	a5,0xa
    8000ab00:	91478793          	addi	a5,a5,-1772 # 80014410 <_ZN5Pager1pE>
    8000ab04:	0007b783          	ld	a5,0(a5)
    8000ab08:	00078a63          	beqz	a5,8000ab1c <_ZN5Pager11getInstanceEv+0x20>
    
    return *p;
}
    8000ab0c:	0000a797          	auipc	a5,0xa
    8000ab10:	90478793          	addi	a5,a5,-1788 # 80014410 <_ZN5Pager1pE>
    8000ab14:	0007b503          	ld	a0,0(a5)
    8000ab18:	00008067          	ret
Pager& Pager::getInstance(){
    8000ab1c:	fe010113          	addi	sp,sp,-32
    8000ab20:	00113c23          	sd	ra,24(sp)
    8000ab24:	00813823          	sd	s0,16(sp)
    8000ab28:	00913423          	sd	s1,8(sp)
    8000ab2c:	02010413          	addi	s0,sp,32
    
    static Pager* p;
    PMT* pmt;
    Pager();

    __NOALLOC_OPERATORS__
    8000ab30:	00800513          	li	a0,8
    8000ab34:	ffffd097          	auipc	ra,0xffffd
    8000ab38:	284080e7          	jalr	644(ra) # 80007db8 <_ZN7NoAlloc9mem_allocEm>
    8000ab3c:	00050493          	mv	s1,a0
    8000ab40:	00000097          	auipc	ra,0x0
    8000ab44:	fa0080e7          	jalr	-96(ra) # 8000aae0 <_ZN5PagerC1Ev>
    if(!p) p = new Pager();
    8000ab48:	0000a797          	auipc	a5,0xa
    8000ab4c:	8c97b423          	sd	s1,-1848(a5) # 80014410 <_ZN5Pager1pE>
}
    8000ab50:	0000a797          	auipc	a5,0xa
    8000ab54:	8c078793          	addi	a5,a5,-1856 # 80014410 <_ZN5Pager1pE>
    8000ab58:	0007b503          	ld	a0,0(a5)
    8000ab5c:	01813083          	ld	ra,24(sp)
    8000ab60:	01013403          	ld	s0,16(sp)
    8000ab64:	00813483          	ld	s1,8(sp)
    8000ab68:	02010113          	addi	sp,sp,32
    8000ab6c:	00008067          	ret

000000008000ab70 <_ZN5Pager3mapEPvS0_12PMTEntryBits>:

int Pager::map(void *va, void *pa, PMTEntryBits flag){
    8000ab70:	fc010113          	addi	sp,sp,-64
    8000ab74:	02113c23          	sd	ra,56(sp)
    8000ab78:	02813823          	sd	s0,48(sp)
    8000ab7c:	02913423          	sd	s1,40(sp)
    8000ab80:	03213023          	sd	s2,32(sp)
    8000ab84:	01313c23          	sd	s3,24(sp)
    8000ab88:	01413823          	sd	s4,16(sp)
    8000ab8c:	01513423          	sd	s5,8(sp)
    8000ab90:	04010413          	addi	s0,sp,64
    8000ab94:	00050493          	mv	s1,a0
    8000ab98:	00058993          	mv	s3,a1
    8000ab9c:	00060a13          	mv	s4,a2
    8000aba0:	00068a93          	mv	s5,a3
   
    if(!pmt)
    8000aba4:	00053783          	ld	a5,0(a0)
    8000aba8:	02078263          	beqz	a5,8000abcc <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x5c>
        pmt = PMT::allocate_pmt();
    
    PMT* curr = pmt;
    PMTEntry* pmte = curr->get_entry(2, va);
    8000abac:	00098613          	mv	a2,s3
    8000abb0:	00200593          	li	a1,2
    8000abb4:	0004b503          	ld	a0,0(s1)
    8000abb8:	00000097          	auipc	ra,0x0
    8000abbc:	724080e7          	jalr	1828(ra) # 8000b2dc <_ZN3PMT9get_entryEhPv>
    8000abc0:	00050493          	mv	s1,a0
    
    for(int i = 2; i > 0; i--){
    8000abc4:	00200913          	li	s2,2
    8000abc8:	0640006f          	j	8000ac2c <_ZN5Pager3mapEPvS0_12PMTEntryBits+0xbc>
        pmt = PMT::allocate_pmt();
    8000abcc:	00000097          	auipc	ra,0x0
    8000abd0:	7fc080e7          	jalr	2044(ra) # 8000b3c8 <_ZN3PMT12allocate_pmtEv>
    8000abd4:	00a4b023          	sd	a0,0(s1)
    8000abd8:	fd5ff06f          	j	8000abac <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x3c>
       
        if(!(pmte->chk_flags(PMTEntryBits::valid))){
            pmte->set_flags(PMTEntryBits::valid);
    8000abdc:	00100593          	li	a1,1
    8000abe0:	00048513          	mv	a0,s1
    8000abe4:	00000097          	auipc	ra,0x0
    8000abe8:	600080e7          	jalr	1536(ra) # 8000b1e4 <_ZN8PMTEntry9set_flagsE12PMTEntryBits>
            pmte->set_pa(PMT::allocate_pmt());
    8000abec:	00000097          	auipc	ra,0x0
    8000abf0:	7dc080e7          	jalr	2012(ra) # 8000b3c8 <_ZN3PMT12allocate_pmtEv>
    8000abf4:	00050593          	mv	a1,a0
    8000abf8:	00048513          	mv	a0,s1
    8000abfc:	00000097          	auipc	ra,0x0
    8000ac00:	678080e7          	jalr	1656(ra) # 8000b274 <_ZN8PMTEntry6set_paEPv>
        }
       
        curr = (PMT*)pmte->get_pa();
    8000ac04:	00048513          	mv	a0,s1
    8000ac08:	00000097          	auipc	ra,0x0
    8000ac0c:	644080e7          	jalr	1604(ra) # 8000b24c <_ZN8PMTEntry6get_paEv>
        
        pmte = curr->get_entry(i-1, va);
    8000ac10:	fff9059b          	addiw	a1,s2,-1
    8000ac14:	00098613          	mv	a2,s3
    8000ac18:	0ff5f593          	andi	a1,a1,255
    8000ac1c:	00000097          	auipc	ra,0x0
    8000ac20:	6c0080e7          	jalr	1728(ra) # 8000b2dc <_ZN3PMT9get_entryEhPv>
    8000ac24:	00050493          	mv	s1,a0
    for(int i = 2; i > 0; i--){
    8000ac28:	fff9091b          	addiw	s2,s2,-1
    8000ac2c:	01205e63          	blez	s2,8000ac48 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0xd8>
        if(!(pmte->chk_flags(PMTEntryBits::valid))){
    8000ac30:	00100593          	li	a1,1
    8000ac34:	00048513          	mv	a0,s1
    8000ac38:	00000097          	auipc	ra,0x0
    8000ac3c:	67c080e7          	jalr	1660(ra) # 8000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000ac40:	fc0512e3          	bnez	a0,8000ac04 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x94>
    8000ac44:	f99ff06f          	j	8000abdc <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x6c>
    }
    
    pmte->set_flags((PMTEntryBits)(PMTEntryBits::valid | flag));
    8000ac48:	001ae593          	ori	a1,s5,1
    8000ac4c:	00048513          	mv	a0,s1
    8000ac50:	00000097          	auipc	ra,0x0
    8000ac54:	594080e7          	jalr	1428(ra) # 8000b1e4 <_ZN8PMTEntry9set_flagsE12PMTEntryBits>
    pmte->set_pa(pa);
    8000ac58:	000a0593          	mv	a1,s4
    8000ac5c:	00048513          	mv	a0,s1
    8000ac60:	00000097          	auipc	ra,0x0
    8000ac64:	614080e7          	jalr	1556(ra) # 8000b274 <_ZN8PMTEntry6set_paEPv>
    

    return 0;
}
    8000ac68:	00000513          	li	a0,0
    8000ac6c:	03813083          	ld	ra,56(sp)
    8000ac70:	03013403          	ld	s0,48(sp)
    8000ac74:	02813483          	ld	s1,40(sp)
    8000ac78:	02013903          	ld	s2,32(sp)
    8000ac7c:	01813983          	ld	s3,24(sp)
    8000ac80:	01013a03          	ld	s4,16(sp)
    8000ac84:	00813a83          	ld	s5,8(sp)
    8000ac88:	04010113          	addi	sp,sp,64
    8000ac8c:	00008067          	ret

000000008000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>:

int Pager::id_map(void* start, void* end, PMTEntryBits flag){
    8000ac90:	fd010113          	addi	sp,sp,-48
    8000ac94:	02113423          	sd	ra,40(sp)
    8000ac98:	02813023          	sd	s0,32(sp)
    8000ac9c:	00913c23          	sd	s1,24(sp)
    8000aca0:	01213823          	sd	s2,16(sp)
    8000aca4:	01313423          	sd	s3,8(sp)
    8000aca8:	01413023          	sd	s4,0(sp)
    8000acac:	03010413          	addi	s0,sp,48
    8000acb0:	00050a13          	mv	s4,a0
    8000acb4:	00068993          	mv	s3,a3
    uint64 ustart = (uint64) start, uend = (uint64) end;
    8000acb8:	00060913          	mv	s2,a2
    ustart = ustart & ~(0xfff);
    8000acbc:	fffff4b7          	lui	s1,0xfffff
    8000acc0:	0095f4b3          	and	s1,a1,s1
    uint64 tmp = ustart;

    while(tmp < uend){
    8000acc4:	0324f463          	bgeu	s1,s2,8000acec <_ZN5Pager6id_mapEPvS0_12PMTEntryBits+0x5c>
        map((void*)tmp, (void*)tmp, flag);
    8000acc8:	00098693          	mv	a3,s3
    8000accc:	00048613          	mv	a2,s1
    8000acd0:	00048593          	mv	a1,s1
    8000acd4:	000a0513          	mv	a0,s4
    8000acd8:	00000097          	auipc	ra,0x0
    8000acdc:	e98080e7          	jalr	-360(ra) # 8000ab70 <_ZN5Pager3mapEPvS0_12PMTEntryBits>
        tmp += PMT::PAGE_SIZE;    
    8000ace0:	000017b7          	lui	a5,0x1
    8000ace4:	00f484b3          	add	s1,s1,a5
    while(tmp < uend){
    8000ace8:	fddff06f          	j	8000acc4 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits+0x34>
    }

    return 0;
}
    8000acec:	00000513          	li	a0,0
    8000acf0:	02813083          	ld	ra,40(sp)
    8000acf4:	02013403          	ld	s0,32(sp)
    8000acf8:	01813483          	ld	s1,24(sp)
    8000acfc:	01013903          	ld	s2,16(sp)
    8000ad00:	00813983          	ld	s3,8(sp)
    8000ad04:	00013a03          	ld	s4,0(sp)
    8000ad08:	03010113          	addi	sp,sp,48
    8000ad0c:	00008067          	ret

000000008000ad10 <_ZN5Pager10map_kernelEv>:

int Pager::map_kernel(){
    8000ad10:	fe010113          	addi	sp,sp,-32
    8000ad14:	00113c23          	sd	ra,24(sp)
    8000ad18:	00813823          	sd	s0,16(sp)
    8000ad1c:	00913423          	sd	s1,8(sp)
    8000ad20:	02010413          	addi	s0,sp,32
    8000ad24:	00050493          	mv	s1,a0
    //uint64 laa = (uint64)NoAlloc::getEndAddress();
    uint64 laa = (uint64)HEAP_END_ADDR;
    uint64 fa = KERNEL_TEXT_START;
    
    //map_ram
    id_map((void*)fa, (void*)laa, (PMTEntryBits)
    8000ad28:	00e00693          	li	a3,14
    8000ad2c:	00008797          	auipc	a5,0x8
    8000ad30:	c8c78793          	addi	a5,a5,-884 # 800129b8 <HEAP_END_ADDR>
    8000ad34:	0007b603          	ld	a2,0(a5)
    8000ad38:	ffff9797          	auipc	a5,0xffff9
    8000ad3c:	2dc78793          	addi	a5,a5,732 # 80004014 <KERNEL_TEXT_START>
    8000ad40:	0007b583          	ld	a1,0(a5)
    8000ad44:	00000097          	auipc	ra,0x0
    8000ad48:	f4c080e7          	jalr	-180(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
            (PMTEntryBits::write | PMTEntryBits::read | PMTEntryBits::execute ));

    // UART
	id_map((void*)0x10000000,
    8000ad4c:	00600693          	li	a3,6
    8000ad50:	10000637          	lui	a2,0x10000
    8000ad54:	10060613          	addi	a2,a2,256 # 10000100 <_entry-0x6fffff00>
    8000ad58:	100005b7          	lui	a1,0x10000
    8000ad5c:	00048513          	mv	a0,s1
    8000ad60:	00000097          	auipc	ra,0x0
    8000ad64:	f30080e7          	jalr	-208(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
	//             (void*)0x0200ffff,
	//             (PMTEntryBits)
    //             (PMTEntryBits::write | PMTEntryBits::read)
	// );
	// PLIC
	id_map(
    8000ad68:	00600693          	li	a3,6
    8000ad6c:	0c002637          	lui	a2,0xc002
    8000ad70:	00160613          	addi	a2,a2,1 # c002001 <_entry-0x73ffdfff>
    8000ad74:	0c0005b7          	lui	a1,0xc000
    8000ad78:	00048513          	mv	a0,s1
    8000ad7c:	00000097          	auipc	ra,0x0
    8000ad80:	f14080e7          	jalr	-236(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
	            (void*)0x0c000000,
	            (void*)0x0c002001,
	            (PMTEntryBits)
                (PMTEntryBits::write | PMTEntryBits::read )
	);
	id_map(
    8000ad84:	00600693          	li	a3,6
    8000ad88:	0c208637          	lui	a2,0xc208
    8000ad8c:	00160613          	addi	a2,a2,1 # c208001 <_entry-0x73df7fff>
    8000ad90:	0c2005b7          	lui	a1,0xc200
    8000ad94:	00048513          	mv	a0,s1
    8000ad98:	00000097          	auipc	ra,0x0
    8000ad9c:	ef8080e7          	jalr	-264(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (PMTEntryBits::write | PMTEntryBits::read )
	);


    return 0;        
}
    8000ada0:	00000513          	li	a0,0
    8000ada4:	01813083          	ld	ra,24(sp)
    8000ada8:	01013403          	ld	s0,16(sp)
    8000adac:	00813483          	ld	s1,8(sp)
    8000adb0:	02010113          	addi	sp,sp,32
    8000adb4:	00008067          	ret

000000008000adb8 <_ZN5Pager8map_userEv>:

int Pager::map_user(){
    8000adb8:	fe010113          	addi	sp,sp,-32
    8000adbc:	00113c23          	sd	ra,24(sp)
    8000adc0:	00813823          	sd	s0,16(sp)
    8000adc4:	00913423          	sd	s1,8(sp)
    8000adc8:	02010413          	addi	s0,sp,32
    8000adcc:	00050493          	mv	s1,a0
    id_map(
    8000add0:	01a00693          	li	a3,26
    8000add4:	ffff9797          	auipc	a5,0xffff9
    8000add8:	25878793          	addi	a5,a5,600 # 8000402c <USER_TEXT_END>
    8000addc:	0007b603          	ld	a2,0(a5)
    8000ade0:	ffff9797          	auipc	a5,0xffff9
    8000ade4:	24478793          	addi	a5,a5,580 # 80004024 <USER_TEXT_START>
    8000ade8:	0007b583          	ld	a1,0(a5)
    8000adec:	00000097          	auipc	ra,0x0
    8000adf0:	ea4080e7          	jalr	-348(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_TEXT_START,
                (void*)USER_TEXT_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::execute | PMTEntryBits::user)
    );

    id_map(
    8000adf4:	01600693          	li	a3,22
    8000adf8:	ffff9797          	auipc	a5,0xffff9
    8000adfc:	24478793          	addi	a5,a5,580 # 8000403c <USER_BSS_END>
    8000ae00:	0007b603          	ld	a2,0(a5)
    8000ae04:	ffff9797          	auipc	a5,0xffff9
    8000ae08:	23078793          	addi	a5,a5,560 # 80004034 <USER_BSS_START>
    8000ae0c:	0007b583          	ld	a1,0(a5)
    8000ae10:	00048513          	mv	a0,s1
    8000ae14:	00000097          	auipc	ra,0x0
    8000ae18:	e7c080e7          	jalr	-388(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_BSS_START,
                (void*)USER_BSS_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
    8000ae1c:	01600693          	li	a3,22
    8000ae20:	ffff9797          	auipc	a5,0xffff9
    8000ae24:	22c78793          	addi	a5,a5,556 # 8000404c <USER_DATA_END>
    8000ae28:	0007b603          	ld	a2,0(a5)
    8000ae2c:	ffff9797          	auipc	a5,0xffff9
    8000ae30:	21878793          	addi	a5,a5,536 # 80004044 <USER_DATA_START>
    8000ae34:	0007b583          	ld	a1,0(a5)
    8000ae38:	00048513          	mv	a0,s1
    8000ae3c:	00000097          	auipc	ra,0x0
    8000ae40:	e54080e7          	jalr	-428(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_DATA_START,
                (void*)USER_DATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
    8000ae44:	01200693          	li	a3,18
    8000ae48:	ffff9797          	auipc	a5,0xffff9
    8000ae4c:	21478793          	addi	a5,a5,532 # 8000405c <USER_RODATA_END>
    8000ae50:	0007b603          	ld	a2,0(a5)
    8000ae54:	ffff9797          	auipc	a5,0xffff9
    8000ae58:	20078793          	addi	a5,a5,512 # 80004054 <USER_RODATA_START>
    8000ae5c:	0007b583          	ld	a1,0(a5)
    8000ae60:	00048513          	mv	a0,s1
    8000ae64:	00000097          	auipc	ra,0x0
    8000ae68:	e2c080e7          	jalr	-468(ra) # 8000ac90 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_RODATA_START,
                (void*)USER_RODATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::user)
    );
    return 0;
}
    8000ae6c:	00000513          	li	a0,0
    8000ae70:	01813083          	ld	ra,24(sp)
    8000ae74:	01013403          	ld	s0,16(sp)
    8000ae78:	00813483          	ld	s1,8(sp)
    8000ae7c:	02010113          	addi	sp,sp,32
    8000ae80:	00008067          	ret

000000008000ae84 <_ZN5Pager12start_pagingEv>:

int Pager::start_paging(){
    8000ae84:	ff010113          	addi	sp,sp,-16
    8000ae88:	00813423          	sd	s0,8(sp)
    8000ae8c:	01010413          	addi	s0,sp,16
    if(!pmt)
    8000ae90:	00053783          	ld	a5,0(a0)
    8000ae94:	02078863          	beqz	a5,8000aec4 <_ZN5Pager12start_pagingEv+0x40>
        return 1;
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    uint64 satp = (8ULL << 60) | ( (uint64)pmt >> 12);
    8000ae98:	00c7d793          	srli	a5,a5,0xc
    8000ae9c:	fff00713          	li	a4,-1
    8000aea0:	03f71713          	slli	a4,a4,0x3f
    8000aea4:	00e7e7b3          	or	a5,a5,a4
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    static void* mem_alloc(size_t); /* allocate */
    static void turn_off() { working = false; }
    8000aea8:	00009717          	auipc	a4,0x9
    8000aeac:	50070023          	sb	zero,1280(a4) # 800143a8 <_ZN7NoAlloc7workingE>
    NoAlloc::turn_off();
    asm volatile("csrw satp, %0" : : "r" (satp));
    8000aeb0:	18079073          	csrw	satp,a5
    return 0;
    8000aeb4:	00000513          	li	a0,0
}
    8000aeb8:	00813403          	ld	s0,8(sp)
    8000aebc:	01010113          	addi	sp,sp,16
    8000aec0:	00008067          	ret
        return 1;
    8000aec4:	00100513          	li	a0,1
    8000aec8:	ff1ff06f          	j	8000aeb8 <_ZN5Pager12start_pagingEv+0x34>

000000008000aecc <_ZN5Pager5printEv>:

void Pager::print(){
    8000aecc:	fc010113          	addi	sp,sp,-64
    8000aed0:	02113c23          	sd	ra,56(sp)
    8000aed4:	02813823          	sd	s0,48(sp)
    8000aed8:	02913423          	sd	s1,40(sp)
    8000aedc:	03213023          	sd	s2,32(sp)
    8000aee0:	01313c23          	sd	s3,24(sp)
    8000aee4:	01413823          	sd	s4,16(sp)
    8000aee8:	01513423          	sd	s5,8(sp)
    8000aeec:	01613023          	sd	s6,0(sp)
    8000aef0:	04010413          	addi	s0,sp,64
    int t = 0;
    if(pmt){
    8000aef4:	00053783          	ld	a5,0(a0)
    8000aef8:	16078263          	beqz	a5,8000b05c <_ZN5Pager5printEv+0x190>
    8000aefc:	00050b13          	mv	s6,a0
        t++;
        kprintString("--------LEVEL 0--------\n");
    8000af00:	00004517          	auipc	a0,0x4
    8000af04:	15050513          	addi	a0,a0,336 # 8000f050 <CONSOLE_STATUS+0x1040>
    8000af08:	ffffa097          	auipc	ra,0xffffa
    8000af0c:	1dc080e7          	jalr	476(ra) # 800050e4 <_Z12kprintStringPKc>
        pmt->print();
    8000af10:	000b3503          	ld	a0,0(s6)
    8000af14:	00000097          	auipc	ra,0x0
    8000af18:	52c080e7          	jalr	1324(ra) # 8000b440 <_ZN3PMT5printEv>
        for(size_t i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000af1c:	00000a93          	li	s5,0
        t++;
    8000af20:	00100a13          	li	s4,1
    8000af24:	0a00006f          	j	8000afc4 <_ZN5Pager5printEv+0xf8>
                pmt1->print();
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
                    PMTEntry* en1 = pmt1->get_entry(i);

                    if(en1->chk_flags(PMTEntryBits::valid)){
                        t++;
    8000af28:	001a0a1b          	addiw	s4,s4,1
                        PMT* pmt2 = (PMT*)en1->get_pa();
    8000af2c:	00090513          	mv	a0,s2
    8000af30:	00000097          	auipc	ra,0x0
    8000af34:	31c080e7          	jalr	796(ra) # 8000b24c <_ZN8PMTEntry6get_paEv>
    8000af38:	00050913          	mv	s2,a0
                        kprintString("--------LEVEL 2--------\n");
    8000af3c:	00004517          	auipc	a0,0x4
    8000af40:	15c50513          	addi	a0,a0,348 # 8000f098 <CONSOLE_STATUS+0x1088>
    8000af44:	ffffa097          	auipc	ra,0xffffa
    8000af48:	1a0080e7          	jalr	416(ra) # 800050e4 <_Z12kprintStringPKc>
                        KCHECKPRINT(pmt2);
    8000af4c:	00004517          	auipc	a0,0x4
    8000af50:	16c50513          	addi	a0,a0,364 # 8000f0b8 <CONSOLE_STATUS+0x10a8>
    8000af54:	ffffa097          	auipc	ra,0xffffa
    8000af58:	190080e7          	jalr	400(ra) # 800050e4 <_Z12kprintStringPKc>
    8000af5c:	00000613          	li	a2,0
    8000af60:	01000593          	li	a1,16
    8000af64:	00090513          	mv	a0,s2
    8000af68:	ffffa097          	auipc	ra,0xffffa
    8000af6c:	1c4080e7          	jalr	452(ra) # 8000512c <_Z9kprintIntmib>
    8000af70:	00003517          	auipc	a0,0x3
    8000af74:	3e850513          	addi	a0,a0,1000 # 8000e358 <CONSOLE_STATUS+0x348>
    8000af78:	ffffa097          	auipc	ra,0xffffa
    8000af7c:	16c080e7          	jalr	364(ra) # 800050e4 <_Z12kprintStringPKc>
                        pmt2->print();
    8000af80:	00090513          	mv	a0,s2
    8000af84:	00000097          	auipc	ra,0x0
    8000af88:	4bc080e7          	jalr	1212(ra) # 8000b440 <_ZN3PMT5printEv>
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000af8c:	00148493          	addi	s1,s1,1 # fffffffffffff001 <_user_bss_end+0xffffffff7ffe8fe1>
    8000af90:	1ff00793          	li	a5,511
    8000af94:	0297e663          	bltu	a5,s1,8000afc0 <_ZN5Pager5printEv+0xf4>
                    PMTEntry* en1 = pmt1->get_entry(i);
    8000af98:	00048593          	mv	a1,s1
    8000af9c:	00098513          	mv	a0,s3
    8000afa0:	00000097          	auipc	ra,0x0
    8000afa4:	3b0080e7          	jalr	944(ra) # 8000b350 <_ZN3PMT9get_entryEm>
    8000afa8:	00050913          	mv	s2,a0
                    if(en1->chk_flags(PMTEntryBits::valid)){
    8000afac:	00100593          	li	a1,1
    8000afb0:	00000097          	auipc	ra,0x0
    8000afb4:	304080e7          	jalr	772(ra) # 8000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000afb8:	fc050ae3          	beqz	a0,8000af8c <_ZN5Pager5printEv+0xc0>
    8000afbc:	f6dff06f          	j	8000af28 <_ZN5Pager5printEv+0x5c>
        for(size_t i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000afc0:	001a8a93          	addi	s5,s5,1
    8000afc4:	1ff00793          	li	a5,511
    8000afc8:	0957ec63          	bltu	a5,s5,8000b060 <_ZN5Pager5printEv+0x194>
            PMTEntry* en = pmt->get_entry(i);
    8000afcc:	000a8593          	mv	a1,s5
    8000afd0:	000b3503          	ld	a0,0(s6)
    8000afd4:	00000097          	auipc	ra,0x0
    8000afd8:	37c080e7          	jalr	892(ra) # 8000b350 <_ZN3PMT9get_entryEm>
    8000afdc:	00050493          	mv	s1,a0
            if(en->chk_flags(PMTEntryBits::valid)){
    8000afe0:	00100593          	li	a1,1
    8000afe4:	00000097          	auipc	ra,0x0
    8000afe8:	2d0080e7          	jalr	720(ra) # 8000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000afec:	fc050ae3          	beqz	a0,8000afc0 <_ZN5Pager5printEv+0xf4>
                t++;
    8000aff0:	001a0a1b          	addiw	s4,s4,1
                PMT* pmt1 = (PMT*)en->get_pa();
    8000aff4:	00048513          	mv	a0,s1
    8000aff8:	00000097          	auipc	ra,0x0
    8000affc:	254080e7          	jalr	596(ra) # 8000b24c <_ZN8PMTEntry6get_paEv>
    8000b000:	00050993          	mv	s3,a0
                kprintString("--------LEVEL 1--------\n");
    8000b004:	00004517          	auipc	a0,0x4
    8000b008:	06c50513          	addi	a0,a0,108 # 8000f070 <CONSOLE_STATUS+0x1060>
    8000b00c:	ffffa097          	auipc	ra,0xffffa
    8000b010:	0d8080e7          	jalr	216(ra) # 800050e4 <_Z12kprintStringPKc>
                KCHECKPRINT(pmt1);
    8000b014:	00004517          	auipc	a0,0x4
    8000b018:	07c50513          	addi	a0,a0,124 # 8000f090 <CONSOLE_STATUS+0x1080>
    8000b01c:	ffffa097          	auipc	ra,0xffffa
    8000b020:	0c8080e7          	jalr	200(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b024:	00000613          	li	a2,0
    8000b028:	01000593          	li	a1,16
    8000b02c:	00098513          	mv	a0,s3
    8000b030:	ffffa097          	auipc	ra,0xffffa
    8000b034:	0fc080e7          	jalr	252(ra) # 8000512c <_Z9kprintIntmib>
    8000b038:	00003517          	auipc	a0,0x3
    8000b03c:	32050513          	addi	a0,a0,800 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b040:	ffffa097          	auipc	ra,0xffffa
    8000b044:	0a4080e7          	jalr	164(ra) # 800050e4 <_Z12kprintStringPKc>
                pmt1->print();
    8000b048:	00098513          	mv	a0,s3
    8000b04c:	00000097          	auipc	ra,0x0
    8000b050:	3f4080e7          	jalr	1012(ra) # 8000b440 <_ZN3PMT5printEv>
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000b054:	00000493          	li	s1,0
    8000b058:	f39ff06f          	j	8000af90 <_ZN5Pager5printEv+0xc4>
    int t = 0;
    8000b05c:	00000a13          	li	s4,0
                }
            }
            
        }
    }
    kprintString("page_table_num: "); kprintInt(t); kprintString("\n");
    8000b060:	00004517          	auipc	a0,0x4
    8000b064:	06050513          	addi	a0,a0,96 # 8000f0c0 <CONSOLE_STATUS+0x10b0>
    8000b068:	ffffa097          	auipc	ra,0xffffa
    8000b06c:	07c080e7          	jalr	124(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b070:	00000613          	li	a2,0
    8000b074:	00a00593          	li	a1,10
    8000b078:	000a0513          	mv	a0,s4
    8000b07c:	ffffa097          	auipc	ra,0xffffa
    8000b080:	0b0080e7          	jalr	176(ra) # 8000512c <_Z9kprintIntmib>
    8000b084:	00003517          	auipc	a0,0x3
    8000b088:	2d450513          	addi	a0,a0,724 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b08c:	ffffa097          	auipc	ra,0xffffa
    8000b090:	058080e7          	jalr	88(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("page_table_size: "); kprintInt(sizeof(PMT)); kprintString("\n");
    8000b094:	00004517          	auipc	a0,0x4
    8000b098:	04450513          	addi	a0,a0,68 # 8000f0d8 <CONSOLE_STATUS+0x10c8>
    8000b09c:	ffffa097          	auipc	ra,0xffffa
    8000b0a0:	048080e7          	jalr	72(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b0a4:	00000613          	li	a2,0
    8000b0a8:	00a00593          	li	a1,10
    8000b0ac:	00001537          	lui	a0,0x1
    8000b0b0:	ffffa097          	auipc	ra,0xffffa
    8000b0b4:	07c080e7          	jalr	124(ra) # 8000512c <_Z9kprintIntmib>
    8000b0b8:	00003517          	auipc	a0,0x3
    8000b0bc:	2a050513          	addi	a0,a0,672 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b0c0:	ffffa097          	auipc	ra,0xffffa
    8000b0c4:	024080e7          	jalr	36(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("page_table_buddy_level: "); kprintInt(BUDDY_LEVEL(sizeof(PMT))); kprintString("\n"); 
    8000b0c8:	00004517          	auipc	a0,0x4
    8000b0cc:	02850513          	addi	a0,a0,40 # 8000f0f0 <CONSOLE_STATUS+0x10e0>
    8000b0d0:	ffffa097          	auipc	ra,0xffffa
    8000b0d4:	014080e7          	jalr	20(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b0d8:	00001537          	lui	a0,0x1
    8000b0dc:	ffffb097          	auipc	ra,0xffffb
    8000b0e0:	9c0080e7          	jalr	-1600(ra) # 80005a9c <_Z4log2m>
    8000b0e4:	000017b7          	lui	a5,0x1
    8000b0e8:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000b0ec:	00a7d533          	srl	a0,a5,a0
    8000b0f0:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    8000b0f4:	ffffb097          	auipc	ra,0xffffb
    8000b0f8:	9a8080e7          	jalr	-1624(ra) # 80005a9c <_Z4log2m>
    8000b0fc:	00000613          	li	a2,0
    8000b100:	00a00593          	li	a1,10
    8000b104:	ffffa097          	auipc	ra,0xffffa
    8000b108:	028080e7          	jalr	40(ra) # 8000512c <_Z9kprintIntmib>
    8000b10c:	00003517          	auipc	a0,0x3
    8000b110:	24c50513          	addi	a0,a0,588 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b114:	ffffa097          	auipc	ra,0xffffa
    8000b118:	fd0080e7          	jalr	-48(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000b11c:	03813083          	ld	ra,56(sp)
    8000b120:	03013403          	ld	s0,48(sp)
    8000b124:	02813483          	ld	s1,40(sp)
    8000b128:	02013903          	ld	s2,32(sp)
    8000b12c:	01813983          	ld	s3,24(sp)
    8000b130:	01013a03          	ld	s4,16(sp)
    8000b134:	00813a83          	ld	s5,8(sp)
    8000b138:	00013b03          	ld	s6,0(sp)
    8000b13c:	04010113          	addi	sp,sp,64
    8000b140:	00008067          	ret

000000008000b144 <_ZN8PMTEntry5printEv>:
    PMT* ret = (PMT*)(Buddy::getInstance().mem_alloc(BUDDY_LEVEL(sizeof(PMT))));
    ret->clear();
    return ret;
}

void PMTEntry::print(){
    8000b144:	fe010113          	addi	sp,sp,-32
    8000b148:	00113c23          	sd	ra,24(sp)
    8000b14c:	00813823          	sd	s0,16(sp)
    8000b150:	00913423          	sd	s1,8(sp)
    8000b154:	02010413          	addi	s0,sp,32
    8000b158:	00050493          	mv	s1,a0
    KVALCHECKPRINT(PA, (val >> 10) << 12);
    8000b15c:	00004517          	auipc	a0,0x4
    8000b160:	fcc50513          	addi	a0,a0,-52 # 8000f128 <_ZN3PMT10VADDR_MASKE+0x18>
    8000b164:	ffffa097          	auipc	ra,0xffffa
    8000b168:	f80080e7          	jalr	-128(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b16c:	0004b503          	ld	a0,0(s1)
    8000b170:	00a55513          	srli	a0,a0,0xa
    8000b174:	00000613          	li	a2,0
    8000b178:	01000593          	li	a1,16
    8000b17c:	00c51513          	slli	a0,a0,0xc
    8000b180:	ffffa097          	auipc	ra,0xffffa
    8000b184:	fac080e7          	jalr	-84(ra) # 8000512c <_Z9kprintIntmib>
    8000b188:	00003517          	auipc	a0,0x3
    8000b18c:	1d050513          	addi	a0,a0,464 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b190:	ffffa097          	auipc	ra,0xffffa
    8000b194:	f54080e7          	jalr	-172(ra) # 800050e4 <_Z12kprintStringPKc>
    kprintString("bits: "); kprintInt((val & 511ULL), 2); kprintString("\n");
    8000b198:	00004517          	auipc	a0,0x4
    8000b19c:	f9850513          	addi	a0,a0,-104 # 8000f130 <_ZN3PMT10VADDR_MASKE+0x20>
    8000b1a0:	ffffa097          	auipc	ra,0xffffa
    8000b1a4:	f44080e7          	jalr	-188(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b1a8:	0004b503          	ld	a0,0(s1)
    8000b1ac:	00000613          	li	a2,0
    8000b1b0:	00200593          	li	a1,2
    8000b1b4:	1ff57513          	andi	a0,a0,511
    8000b1b8:	ffffa097          	auipc	ra,0xffffa
    8000b1bc:	f74080e7          	jalr	-140(ra) # 8000512c <_Z9kprintIntmib>
    8000b1c0:	00003517          	auipc	a0,0x3
    8000b1c4:	19850513          	addi	a0,a0,408 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b1c8:	ffffa097          	auipc	ra,0xffffa
    8000b1cc:	f1c080e7          	jalr	-228(ra) # 800050e4 <_Z12kprintStringPKc>
}
    8000b1d0:	01813083          	ld	ra,24(sp)
    8000b1d4:	01013403          	ld	s0,16(sp)
    8000b1d8:	00813483          	ld	s1,8(sp)
    8000b1dc:	02010113          	addi	sp,sp,32
    8000b1e0:	00008067          	ret

000000008000b1e4 <_ZN8PMTEntry9set_flagsE12PMTEntryBits>:

void PMTEntry::set_flags(PMTEntryBits peb){ val |= (uint64) peb; }
    8000b1e4:	ff010113          	addi	sp,sp,-16
    8000b1e8:	00813423          	sd	s0,8(sp)
    8000b1ec:	01010413          	addi	s0,sp,16
    8000b1f0:	00053783          	ld	a5,0(a0)
    8000b1f4:	00b7e5b3          	or	a1,a5,a1
    8000b1f8:	00b53023          	sd	a1,0(a0)
    8000b1fc:	00813403          	ld	s0,8(sp)
    8000b200:	01010113          	addi	sp,sp,16
    8000b204:	00008067          	ret

000000008000b208 <_ZN8PMTEntry11clear_flagsE12PMTEntryBits>:

void PMTEntry::clear_flags(PMTEntryBits peb){ val &= ~((uint64) peb); }
    8000b208:	ff010113          	addi	sp,sp,-16
    8000b20c:	00813423          	sd	s0,8(sp)
    8000b210:	01010413          	addi	s0,sp,16
    8000b214:	fff5c593          	not	a1,a1
    8000b218:	00053783          	ld	a5,0(a0)
    8000b21c:	00b7f7b3          	and	a5,a5,a1
    8000b220:	00f53023          	sd	a5,0(a0)
    8000b224:	00813403          	ld	s0,8(sp)
    8000b228:	01010113          	addi	sp,sp,16
    8000b22c:	00008067          	ret

000000008000b230 <_ZN8PMTEntry5clearEv>:

void PMTEntry::clear(){ val = PMTEntryBits::clear; }
    8000b230:	ff010113          	addi	sp,sp,-16
    8000b234:	00813423          	sd	s0,8(sp)
    8000b238:	01010413          	addi	s0,sp,16
    8000b23c:	00053023          	sd	zero,0(a0)
    8000b240:	00813403          	ld	s0,8(sp)
    8000b244:	01010113          	addi	sp,sp,16
    8000b248:	00008067          	ret

000000008000b24c <_ZN8PMTEntry6get_paEv>:

void* PMTEntry::get_pa(){
    8000b24c:	ff010113          	addi	sp,sp,-16
    8000b250:	00813423          	sd	s0,8(sp)
    8000b254:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 10;
    return (void*)((val & mask) << 2);
    8000b258:	00053783          	ld	a5,0(a0)
    8000b25c:	00279793          	slli	a5,a5,0x2
}
    8000b260:	fffff537          	lui	a0,0xfffff
    8000b264:	00a7f533          	and	a0,a5,a0
    8000b268:	00813403          	ld	s0,8(sp)
    8000b26c:	01010113          	addi	sp,sp,16
    8000b270:	00008067          	ret

000000008000b274 <_ZN8PMTEntry6set_paEPv>:

int PMTEntry::set_pa(void* pa){
    8000b274:	ff010113          	addi	sp,sp,-16
    8000b278:	00813423          	sd	s0,8(sp)
    8000b27c:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 12, 
    uipa = (uint64) pa; //uint phisical address
    
    if( (mask & uipa) != uipa )
    8000b280:	03459793          	slli	a5,a1,0x34
    8000b284:	02079463          	bnez	a5,8000b2ac <_ZN8PMTEntry6set_paEPv+0x38>
        return -1; //exception
    
    mask = ~((~0ULL) << 10);
    val &= mask;
    8000b288:	00053783          	ld	a5,0(a0) # fffffffffffff000 <_user_bss_end+0xffffffff7ffe8fe0>
    8000b28c:	3ff7f793          	andi	a5,a5,1023
    val |= (uipa >> 2); 
    8000b290:	0025d593          	srli	a1,a1,0x2
    8000b294:	00b7e7b3          	or	a5,a5,a1
    8000b298:	00f53023          	sd	a5,0(a0)
    return 0;
    8000b29c:	00000513          	li	a0,0
}
    8000b2a0:	00813403          	ld	s0,8(sp)
    8000b2a4:	01010113          	addi	sp,sp,16
    8000b2a8:	00008067          	ret
        return -1; //exception
    8000b2ac:	fff00513          	li	a0,-1
    8000b2b0:	ff1ff06f          	j	8000b2a0 <_ZN8PMTEntry6set_paEPv+0x2c>

000000008000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>:

bool PMTEntry::chk_flags(PMTEntryBits peb){
    8000b2b4:	ff010113          	addi	sp,sp,-16
    8000b2b8:	00813423          	sd	s0,8(sp)
    8000b2bc:	01010413          	addi	s0,sp,16
    uint64 t = val & peb;
    8000b2c0:	00053503          	ld	a0,0(a0)
    8000b2c4:	00b57533          	and	a0,a0,a1
    return t == peb;
    8000b2c8:	40a58533          	sub	a0,a1,a0
}
    8000b2cc:	00153513          	seqz	a0,a0
    8000b2d0:	00813403          	ld	s0,8(sp)
    8000b2d4:	01010113          	addi	sp,sp,16
    8000b2d8:	00008067          	ret

000000008000b2dc <_ZN3PMT9get_entryEhPv>:

PMTEntry* PMT::get_entry(uchar level, void *vaddr){
    8000b2dc:	ff010113          	addi	sp,sp,-16
    8000b2e0:	00813423          	sd	s0,8(sp)
    8000b2e4:	01010413          	addi	s0,sp,16
    if(level >= 3) return nullptr;
    8000b2e8:	00200793          	li	a5,2
    8000b2ec:	04b7ea63          	bltu	a5,a1,8000b340 <_ZN3PMT9get_entryEhPv+0x64>
    if(INVALID_MASK & (size_t)vaddr) return nullptr;
    8000b2f0:	fff00793          	li	a5,-1
    8000b2f4:	02779793          	slli	a5,a5,0x27
    8000b2f8:	00f677b3          	and	a5,a2,a5
    8000b2fc:	04079663          	bnez	a5,8000b348 <_ZN3PMT9get_entryEhPv+0x6c>
    
    return entry + 
    ( ((uint64)(vaddr) & VADDR_MASK[level]) >> (12 + 9*level) );
    8000b300:	0005859b          	sext.w	a1,a1
    8000b304:	00359713          	slli	a4,a1,0x3
    8000b308:	00004797          	auipc	a5,0x4
    8000b30c:	e0878793          	addi	a5,a5,-504 # 8000f110 <_ZN3PMT10VADDR_MASKE>
    8000b310:	00e787b3          	add	a5,a5,a4
    8000b314:	0007b783          	ld	a5,0(a5)
    8000b318:	00f67633          	and	a2,a2,a5
    8000b31c:	0035979b          	slliw	a5,a1,0x3
    8000b320:	00b785bb          	addw	a1,a5,a1
    8000b324:	00c58593          	addi	a1,a1,12 # c20000c <_entry-0x73dffff4>
    8000b328:	00b65633          	srl	a2,a2,a1
    return entry + 
    8000b32c:	00361613          	slli	a2,a2,0x3
    ( ((uint64)(vaddr) & VADDR_MASK[level]) >> (12 + 9*level) );
    8000b330:	00c50533          	add	a0,a0,a2
}
    8000b334:	00813403          	ld	s0,8(sp)
    8000b338:	01010113          	addi	sp,sp,16
    8000b33c:	00008067          	ret
    if(level >= 3) return nullptr;
    8000b340:	00000513          	li	a0,0
    8000b344:	ff1ff06f          	j	8000b334 <_ZN3PMT9get_entryEhPv+0x58>
    if(INVALID_MASK & (size_t)vaddr) return nullptr;
    8000b348:	00000513          	li	a0,0
    8000b34c:	fe9ff06f          	j	8000b334 <_ZN3PMT9get_entryEhPv+0x58>

000000008000b350 <_ZN3PMT9get_entryEm>:

PMTEntry* PMT::get_entry(uint64 index){
    8000b350:	ff010113          	addi	sp,sp,-16
    8000b354:	00813423          	sd	s0,8(sp)
    8000b358:	01010413          	addi	s0,sp,16
    return entry + index;
    8000b35c:	00359593          	slli	a1,a1,0x3

}
    8000b360:	00b50533          	add	a0,a0,a1
    8000b364:	00813403          	ld	s0,8(sp)
    8000b368:	01010113          	addi	sp,sp,16
    8000b36c:	00008067          	ret

000000008000b370 <_ZN3PMT5clearEv>:


void PMT::clear(){
    8000b370:	fe010113          	addi	sp,sp,-32
    8000b374:	00113c23          	sd	ra,24(sp)
    8000b378:	00813823          	sd	s0,16(sp)
    8000b37c:	00913423          	sd	s1,8(sp)
    8000b380:	01213023          	sd	s2,0(sp)
    8000b384:	02010413          	addi	s0,sp,32
    8000b388:	00050913          	mv	s2,a0
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++)
    8000b38c:	00000493          	li	s1,0
    8000b390:	1ff00793          	li	a5,511
    8000b394:	0097ee63          	bltu	a5,s1,8000b3b0 <_ZN3PMT5clearEv+0x40>
        entry[i].clear();
    8000b398:	00349513          	slli	a0,s1,0x3
    8000b39c:	00a90533          	add	a0,s2,a0
    8000b3a0:	00000097          	auipc	ra,0x0
    8000b3a4:	e90080e7          	jalr	-368(ra) # 8000b230 <_ZN8PMTEntry5clearEv>
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++)
    8000b3a8:	00148493          	addi	s1,s1,1
    8000b3ac:	fe5ff06f          	j	8000b390 <_ZN3PMT5clearEv+0x20>
}
    8000b3b0:	01813083          	ld	ra,24(sp)
    8000b3b4:	01013403          	ld	s0,16(sp)
    8000b3b8:	00813483          	ld	s1,8(sp)
    8000b3bc:	00013903          	ld	s2,0(sp)
    8000b3c0:	02010113          	addi	sp,sp,32
    8000b3c4:	00008067          	ret

000000008000b3c8 <_ZN3PMT12allocate_pmtEv>:
PMT* PMT::allocate_pmt(){
    8000b3c8:	fe010113          	addi	sp,sp,-32
    8000b3cc:	00113c23          	sd	ra,24(sp)
    8000b3d0:	00813823          	sd	s0,16(sp)
    8000b3d4:	00913423          	sd	s1,8(sp)
    8000b3d8:	02010413          	addi	s0,sp,32
    PMT* ret = (PMT*)(Buddy::getInstance().mem_alloc(BUDDY_LEVEL(sizeof(PMT))));
    8000b3dc:	ffffb097          	auipc	ra,0xffffb
    8000b3e0:	4a4080e7          	jalr	1188(ra) # 80006880 <_ZN5Buddy11getInstanceEv>
    8000b3e4:	00050493          	mv	s1,a0
    8000b3e8:	00001537          	lui	a0,0x1
    8000b3ec:	ffffa097          	auipc	ra,0xffffa
    8000b3f0:	6b0080e7          	jalr	1712(ra) # 80005a9c <_Z4log2m>
    8000b3f4:	000017b7          	lui	a5,0x1
    8000b3f8:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000b3fc:	00a7d533          	srl	a0,a5,a0
    8000b400:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    8000b404:	ffffa097          	auipc	ra,0xffffa
    8000b408:	698080e7          	jalr	1688(ra) # 80005a9c <_Z4log2m>
    8000b40c:	00050593          	mv	a1,a0
    8000b410:	00048513          	mv	a0,s1
    8000b414:	ffffc097          	auipc	ra,0xffffc
    8000b418:	9e4080e7          	jalr	-1564(ra) # 80006df8 <_ZN5Buddy9mem_allocEh>
    8000b41c:	00050493          	mv	s1,a0
    ret->clear();
    8000b420:	00000097          	auipc	ra,0x0
    8000b424:	f50080e7          	jalr	-176(ra) # 8000b370 <_ZN3PMT5clearEv>
}
    8000b428:	00048513          	mv	a0,s1
    8000b42c:	01813083          	ld	ra,24(sp)
    8000b430:	01013403          	ld	s0,16(sp)
    8000b434:	00813483          	ld	s1,8(sp)
    8000b438:	02010113          	addi	sp,sp,32
    8000b43c:	00008067          	ret

000000008000b440 <_ZN3PMT5printEv>:

void PMT::print(){
    8000b440:	fd010113          	addi	sp,sp,-48
    8000b444:	02113423          	sd	ra,40(sp)
    8000b448:	02813023          	sd	s0,32(sp)
    8000b44c:	00913c23          	sd	s1,24(sp)
    8000b450:	01213823          	sd	s2,16(sp)
    8000b454:	01313423          	sd	s3,8(sp)
    8000b458:	03010413          	addi	s0,sp,48
    8000b45c:	00050993          	mv	s3,a0
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++){
    8000b460:	00000913          	li	s2,0
    8000b464:	0780006f          	j	8000b4dc <_ZN3PMT5printEv+0x9c>
        if(entry[i].chk_flags(PMTEntryBits::valid)){
            KPRINTARR(entry, i, entry[i].chk_flags(PMTEntryBits::valid));
    8000b468:	00004517          	auipc	a0,0x4
    8000b46c:	cd050513          	addi	a0,a0,-816 # 8000f138 <_ZN3PMT10VADDR_MASKE+0x28>
    8000b470:	ffffa097          	auipc	ra,0xffffa
    8000b474:	c74080e7          	jalr	-908(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b478:	00000613          	li	a2,0
    8000b47c:	00a00593          	li	a1,10
    8000b480:	00090513          	mv	a0,s2
    8000b484:	ffffa097          	auipc	ra,0xffffa
    8000b488:	ca8080e7          	jalr	-856(ra) # 8000512c <_Z9kprintIntmib>
    8000b48c:	00003517          	auipc	a0,0x3
    8000b490:	04450513          	addi	a0,a0,68 # 8000e4d0 <CONSOLE_STATUS+0x4c0>
    8000b494:	ffffa097          	auipc	ra,0xffffa
    8000b498:	c50080e7          	jalr	-944(ra) # 800050e4 <_Z12kprintStringPKc>
    8000b49c:	00100593          	li	a1,1
    8000b4a0:	00048513          	mv	a0,s1
    8000b4a4:	00000097          	auipc	ra,0x0
    8000b4a8:	e10080e7          	jalr	-496(ra) # 8000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000b4ac:	00000613          	li	a2,0
    8000b4b0:	01000593          	li	a1,16
    8000b4b4:	ffffa097          	auipc	ra,0xffffa
    8000b4b8:	c78080e7          	jalr	-904(ra) # 8000512c <_Z9kprintIntmib>
    8000b4bc:	00003517          	auipc	a0,0x3
    8000b4c0:	e9c50513          	addi	a0,a0,-356 # 8000e358 <CONSOLE_STATUS+0x348>
    8000b4c4:	ffffa097          	auipc	ra,0xffffa
    8000b4c8:	c20080e7          	jalr	-992(ra) # 800050e4 <_Z12kprintStringPKc>
            entry[i].print();
    8000b4cc:	00048513          	mv	a0,s1
    8000b4d0:	00000097          	auipc	ra,0x0
    8000b4d4:	c74080e7          	jalr	-908(ra) # 8000b144 <_ZN8PMTEntry5printEv>
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++){
    8000b4d8:	00190913          	addi	s2,s2,1
    8000b4dc:	1ff00793          	li	a5,511
    8000b4e0:	0327e263          	bltu	a5,s2,8000b504 <_ZN3PMT5printEv+0xc4>
        if(entry[i].chk_flags(PMTEntryBits::valid)){
    8000b4e4:	00391493          	slli	s1,s2,0x3
    8000b4e8:	009984b3          	add	s1,s3,s1
    8000b4ec:	00100593          	li	a1,1
    8000b4f0:	00048513          	mv	a0,s1
    8000b4f4:	00000097          	auipc	ra,0x0
    8000b4f8:	dc0080e7          	jalr	-576(ra) # 8000b2b4 <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000b4fc:	fc050ee3          	beqz	a0,8000b4d8 <_ZN3PMT5printEv+0x98>
    8000b500:	f69ff06f          	j	8000b468 <_ZN3PMT5printEv+0x28>
        }
    }
    8000b504:	02813083          	ld	ra,40(sp)
    8000b508:	02013403          	ld	s0,32(sp)
    8000b50c:	01813483          	ld	s1,24(sp)
    8000b510:	01013903          	ld	s2,16(sp)
    8000b514:	00813983          	ld	s3,8(sp)
    8000b518:	03010113          	addi	sp,sp,48
    8000b51c:	00008067          	ret

000000008000b520 <_kernel_text_end>:
	...

000000008000c000 <_user_text_start>:

.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
    8000c000:	100522af          	lr.w	t0,(a0)
bne t0, a1, fail       # Doesn’t match, so fail.
    8000c004:	00b29a63          	bne	t0,a1,8000c018 <fail>
sc.w t0, a2, (a0)      # Try to update.
    8000c008:	18c522af          	sc.w	t0,a2,(a0)
bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000c00c:	fe029ae3          	bnez	t0,8000c000 <_user_text_start>
li a0, 0               # Set return to success.
    8000c010:	00000513          	li	a0,0
jr ra                  # Return.
    8000c014:	00008067          	ret

000000008000c018 <fail>:
fail:
li a0, 1               # Set return to failure.
    8000c018:	00100513          	li	a0,1

000000008000c01c <thread_delete>:
#include"../../h/_thread.h"
#include"../../h/_semaphore.h"


extern "C" int thread_delete(void* addr)
{
    8000c01c:	ff010113          	addi	sp,sp,-16
    8000c020:	00813423          	sd	s0,8(sp)
    8000c024:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("mv a1, %0" : : "r" (addr));
    8000c028:	00050593          	mv	a1,a0
    asm volatile("mv a0, %0" : : "r" (0x69));
    8000c02c:	06900793          	li	a5,105
    8000c030:	00078513          	mv	a0,a5
    asm volatile("ecall");
    8000c034:	00000073          	ecall

    return ret;
}
    8000c038:	00000513          	li	a0,0
    8000c03c:	00813403          	ld	s0,8(sp)
    8000c040:	01010113          	addi	sp,sp,16
    8000c044:	00008067          	ret

000000008000c048 <_ZN7_threaddlEPv>:


void _thread::operator delete(void* ptr){
    8000c048:	ff010113          	addi	sp,sp,-16
    8000c04c:	00113423          	sd	ra,8(sp)
    8000c050:	00813023          	sd	s0,0(sp)
    8000c054:	01010413          	addi	s0,sp,16
    thread_delete(ptr);
    8000c058:	00000097          	auipc	ra,0x0
    8000c05c:	fc4080e7          	jalr	-60(ra) # 8000c01c <thread_delete>
}
    8000c060:	00813083          	ld	ra,8(sp)
    8000c064:	00013403          	ld	s0,0(sp)
    8000c068:	01010113          	addi	sp,sp,16
    8000c06c:	00008067          	ret

000000008000c070 <mem_alloc>:



extern "C" void* mem_alloc(size_t size)
{
    8000c070:	ff010113          	addi	sp,sp,-16
    8000c074:	00813423          	sd	s0,8(sp)
    8000c078:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    8000c07c:	fff50513          	addi	a0,a0,-1
    8000c080:	00655513          	srli	a0,a0,0x6
    8000c084:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    8000c088:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    8000c08c:	00100793          	li	a5,1
    8000c090:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000c094:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    8000c098:	00050513          	mv	a0,a0
    
    return adr;  
}
    8000c09c:	00813403          	ld	s0,8(sp)
    8000c0a0:	01010113          	addi	sp,sp,16
    8000c0a4:	00008067          	ret

000000008000c0a8 <mem_free>:

extern "C" int mem_free (void* adr)
{
    8000c0a8:	ff010113          	addi	sp,sp,-16
    8000c0ac:	00813423          	sd	s0,8(sp)
    8000c0b0:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    8000c0b4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    8000c0b8:	00200793          	li	a5,2
    8000c0bc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000c0c0:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000c0c4:	00050513          	mv	a0,a0
    
    return ret;
}
    8000c0c8:	0005051b          	sext.w	a0,a0
    8000c0cc:	00813403          	ld	s0,8(sp)
    8000c0d0:	01010113          	addi	sp,sp,16
    8000c0d4:	00008067          	ret

000000008000c0d8 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    8000c0d8:	ff010113          	addi	sp,sp,-16
    8000c0dc:	00813423          	sd	s0,8(sp)
    8000c0e0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    8000c0e4:	01300793          	li	a5,19
    8000c0e8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000c0ec:	00000073          	ecall
}
    8000c0f0:	00813403          	ld	s0,8(sp)
    8000c0f4:	01010113          	addi	sp,sp,16
    8000c0f8:	00008067          	ret

000000008000c0fc <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    8000c0fc:	06050e63          	beqz	a0,8000c178 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    8000c100:	08058063          	beqz	a1,8000c180 <thread_create+0x84>
{
    8000c104:	fd010113          	addi	sp,sp,-48
    8000c108:	02113423          	sd	ra,40(sp)
    8000c10c:	02813023          	sd	s0,32(sp)
    8000c110:	00913c23          	sd	s1,24(sp)
    8000c114:	01213823          	sd	s2,16(sp)
    8000c118:	01313423          	sd	s3,8(sp)
    8000c11c:	03010413          	addi	s0,sp,48
    8000c120:	00060993          	mv	s3,a2
    8000c124:	00058913          	mv	s2,a1
    8000c128:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    8000c12c:	00001537          	lui	a0,0x1
    8000c130:	00000097          	auipc	ra,0x0
    8000c134:	f40080e7          	jalr	-192(ra) # 8000c070 <mem_alloc>
    if(stack_space == nullptr) return -3;
    8000c138:	04050863          	beqz	a0,8000c188 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    8000c13c:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    8000c140:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    8000c144:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    8000c148:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    8000c14c:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    8000c150:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c154:	00050513          	mv	a0,a0
    8000c158:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c15c:	02813083          	ld	ra,40(sp)
    8000c160:	02013403          	ld	s0,32(sp)
    8000c164:	01813483          	ld	s1,24(sp)
    8000c168:	01013903          	ld	s2,16(sp)
    8000c16c:	00813983          	ld	s3,8(sp)
    8000c170:	03010113          	addi	sp,sp,48
    8000c174:	00008067          	ret
    if(handle == nullptr) return -1;
    8000c178:	fff00513          	li	a0,-1
    8000c17c:	00008067          	ret
    if(start_routine == nullptr) return -2;
    8000c180:	ffe00513          	li	a0,-2
}
    8000c184:	00008067          	ret
    if(stack_space == nullptr) return -3;
    8000c188:	ffd00513          	li	a0,-3
    8000c18c:	fd1ff06f          	j	8000c15c <thread_create+0x60>

000000008000c190 <thread_exit>:

extern "C" int thread_exit()
{
    8000c190:	ff010113          	addi	sp,sp,-16
    8000c194:	00813423          	sd	s0,8(sp)
    8000c198:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    8000c19c:	01200513          	li	a0,18
    asm volatile("ecall");
    8000c1a0:	00000073          	ecall

    return ret;
}
    8000c1a4:	00000513          	li	a0,0
    8000c1a8:	00813403          	ld	s0,8(sp)
    8000c1ac:	01010113          	addi	sp,sp,16
    8000c1b0:	00008067          	ret

000000008000c1b4 <sem_open>:



extern "C" int sem_open(sem_t* handle, unsigned val)
{
    8000c1b4:	ff010113          	addi	sp,sp,-16
    8000c1b8:	00813423          	sd	s0,8(sp)
    8000c1bc:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000c1c0:	02050463          	beqz	a0,8000c1e8 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    8000c1c4:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    8000c1c8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    8000c1cc:	02100513          	li	a0,33
    asm volatile("ecall");
    8000c1d0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c1d4:	00050513          	mv	a0,a0
    8000c1d8:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c1dc:	00813403          	ld	s0,8(sp)
    8000c1e0:	01010113          	addi	sp,sp,16
    8000c1e4:	00008067          	ret
    if(handle == nullptr) return -1;
    8000c1e8:	fff00513          	li	a0,-1
    8000c1ec:	ff1ff06f          	j	8000c1dc <sem_open+0x28>

000000008000c1f0 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    8000c1f0:	ff010113          	addi	sp,sp,-16
    8000c1f4:	00813423          	sd	s0,8(sp)
    8000c1f8:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000c1fc:	02050263          	beqz	a0,8000c220 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    8000c200:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    8000c204:	02200513          	li	a0,34
    asm volatile("ecall");
    8000c208:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c20c:	00050513          	mv	a0,a0
    8000c210:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c214:	00813403          	ld	s0,8(sp)
    8000c218:	01010113          	addi	sp,sp,16
    8000c21c:	00008067          	ret
    if(handle == nullptr) return -1;
    8000c220:	fff00513          	li	a0,-1
    8000c224:	ff1ff06f          	j	8000c214 <sem_close+0x24>

000000008000c228 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    8000c228:	ff010113          	addi	sp,sp,-16
    8000c22c:	00813423          	sd	s0,8(sp)
    8000c230:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    8000c234:	02050263          	beqz	a0,8000c258 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    8000c238:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    8000c23c:	02300513          	li	a0,35
    asm volatile("ecall");
    8000c240:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c244:	00050513          	mv	a0,a0
    8000c248:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c24c:	00813403          	ld	s0,8(sp)
    8000c250:	01010113          	addi	sp,sp,16
    8000c254:	00008067          	ret
    if(id == nullptr) return -1;
    8000c258:	fff00513          	li	a0,-1
    8000c25c:	ff1ff06f          	j	8000c24c <sem_wait+0x24>

000000008000c260 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    8000c260:	ff010113          	addi	sp,sp,-16
    8000c264:	00813423          	sd	s0,8(sp)
    8000c268:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    8000c26c:	02050263          	beqz	a0,8000c290 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    8000c270:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    8000c274:	02400513          	li	a0,36
    asm volatile("ecall");
    8000c278:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c27c:	00050513          	mv	a0,a0
    8000c280:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c284:	00813403          	ld	s0,8(sp)
    8000c288:	01010113          	addi	sp,sp,16
    8000c28c:	00008067          	ret
    if(id == nullptr) return -1;
    8000c290:	fff00513          	li	a0,-1
    8000c294:	ff1ff06f          	j	8000c284 <sem_signal+0x24>

000000008000c298 <time_sleep>:

extern "C" int time_sleep(time_t time){
    8000c298:	ff010113          	addi	sp,sp,-16
    8000c29c:	00813423          	sd	s0,8(sp)
    8000c2a0:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    8000c2a4:	02050263          	beqz	a0,8000c2c8 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    8000c2a8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    8000c2ac:	03100513          	li	a0,49
    asm volatile("ecall");
    8000c2b0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c2b4:	00050513          	mv	a0,a0
    8000c2b8:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000c2bc:	00813403          	ld	s0,8(sp)
    8000c2c0:	01010113          	addi	sp,sp,16
    8000c2c4:	00008067          	ret
    if(time == 0) return -1;
    8000c2c8:	fff00513          	li	a0,-1
    8000c2cc:	ff1ff06f          	j	8000c2bc <time_sleep+0x24>

000000008000c2d0 <getc>:

const int EOF = -1;
extern "C" char getc(){
    8000c2d0:	ff010113          	addi	sp,sp,-16
    8000c2d4:	00813423          	sd	s0,8(sp)
    8000c2d8:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    8000c2dc:	04100513          	li	a0,65
    asm volatile("ecall");
    8000c2e0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000c2e4:	00050513          	mv	a0,a0
    8000c2e8:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    8000c2ec:	0ff00793          	li	a5,255
    8000c2f0:	00a7ea63          	bltu	a5,a0,8000c304 <getc+0x34>
    8000c2f4:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    8000c2f8:	00813403          	ld	s0,8(sp)
    8000c2fc:	01010113          	addi	sp,sp,16
    8000c300:	00008067          	ret
    else return EOF;
    8000c304:	0ff00513          	li	a0,255
    8000c308:	ff1ff06f          	j	8000c2f8 <getc+0x28>

000000008000c30c <putc>:

extern "C" void putc(char c){
    8000c30c:	ff010113          	addi	sp,sp,-16
    8000c310:	00813423          	sd	s0,8(sp)
    8000c314:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    8000c318:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    8000c31c:	04200513          	li	a0,66
    asm volatile("ecall");
    8000c320:	00000073          	ecall
    8000c324:	00813403          	ld	s0,8(sp)
    8000c328:	01010113          	addi	sp,sp,16
    8000c32c:	00008067          	ret

000000008000c330 <_ZN6Thread10runWrapperEPv>:
        thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    8000c330:	ff010113          	addi	sp,sp,-16
    8000c334:	00113423          	sd	ra,8(sp)
    8000c338:	00813023          	sd	s0,0(sp)
    8000c33c:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    8000c340:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    8000c344:	0107b783          	ld	a5,16(a5)
    8000c348:	000780e7          	jalr	a5
}
    8000c34c:	00813083          	ld	ra,8(sp)
    8000c350:	00013403          	ld	s0,0(sp)
    8000c354:	01010113          	addi	sp,sp,16
    8000c358:	00008067          	ret

000000008000c35c <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    8000c35c:	fe010113          	addi	sp,sp,-32
    8000c360:	00113c23          	sd	ra,24(sp)
    8000c364:	00813823          	sd	s0,16(sp)
    8000c368:	00913423          	sd	s1,8(sp)
    8000c36c:	02010413          	addi	s0,sp,32
    8000c370:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    8000c374:	02050263          	beqz	a0,8000c398 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    8000c378:	0004b503          	ld	a0,0(s1)
    8000c37c:	00053783          	ld	a5,0(a0)
    8000c380:	0187b783          	ld	a5,24(a5)
    8000c384:	000780e7          	jalr	a5
        time_sleep(wp->period);
    8000c388:	0084b503          	ld	a0,8(s1)
    8000c38c:	00000097          	auipc	ra,0x0
    8000c390:	f0c080e7          	jalr	-244(ra) # 8000c298 <time_sleep>
    8000c394:	fe5ff06f          	j	8000c378 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    8000c398:	01813083          	ld	ra,24(sp)
    8000c39c:	01013403          	ld	s0,16(sp)
    8000c3a0:	00813483          	ld	s1,8(sp)
    8000c3a4:	02010113          	addi	sp,sp,32
    8000c3a8:	00008067          	ret

000000008000c3ac <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    8000c3ac:	ff010113          	addi	sp,sp,-16
    8000c3b0:	00113423          	sd	ra,8(sp)
    8000c3b4:	00813023          	sd	s0,0(sp)
    8000c3b8:	01010413          	addi	s0,sp,16
    8000c3bc:	00000097          	auipc	ra,0x0
    8000c3c0:	cb4080e7          	jalr	-844(ra) # 8000c070 <mem_alloc>
    8000c3c4:	00813083          	ld	ra,8(sp)
    8000c3c8:	00013403          	ld	s0,0(sp)
    8000c3cc:	01010113          	addi	sp,sp,16
    8000c3d0:	00008067          	ret

000000008000c3d4 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    8000c3d4:	ff010113          	addi	sp,sp,-16
    8000c3d8:	00113423          	sd	ra,8(sp)
    8000c3dc:	00813023          	sd	s0,0(sp)
    8000c3e0:	01010413          	addi	s0,sp,16
    8000c3e4:	00000097          	auipc	ra,0x0
    8000c3e8:	cc4080e7          	jalr	-828(ra) # 8000c0a8 <mem_free>
    8000c3ec:	00813083          	ld	ra,8(sp)
    8000c3f0:	00013403          	ld	s0,0(sp)
    8000c3f4:	01010113          	addi	sp,sp,16
    8000c3f8:	00008067          	ret

000000008000c3fc <_ZN6ThreadD1Ev>:
Thread::~Thread()
    8000c3fc:	fe010113          	addi	sp,sp,-32
    8000c400:	00113c23          	sd	ra,24(sp)
    8000c404:	00813823          	sd	s0,16(sp)
    8000c408:	00913423          	sd	s1,8(sp)
    8000c40c:	02010413          	addi	s0,sp,32
    8000c410:	00003797          	auipc	a5,0x3
    8000c414:	d7078793          	addi	a5,a5,-656 # 8000f180 <_ZTV6Thread+0x10>
    8000c418:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    8000c41c:	00853483          	ld	s1,8(a0)
    if(w->handle){
    8000c420:	0004b503          	ld	a0,0(s1)
    8000c424:	00050663          	beqz	a0,8000c430 <_ZN6ThreadD1Ev+0x34>
        delete w->handle;
    8000c428:	00000097          	auipc	ra,0x0
    8000c42c:	c20080e7          	jalr	-992(ra) # 8000c048 <_ZN7_threaddlEPv>
    delete w;
    8000c430:	00048513          	mv	a0,s1
    8000c434:	00000097          	auipc	ra,0x0
    8000c438:	fa0080e7          	jalr	-96(ra) # 8000c3d4 <_ZdlPv>
}
    8000c43c:	01813083          	ld	ra,24(sp)
    8000c440:	01013403          	ld	s0,16(sp)
    8000c444:	00813483          	ld	s1,8(sp)
    8000c448:	02010113          	addi	sp,sp,32
    8000c44c:	00008067          	ret

000000008000c450 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    8000c450:	fe010113          	addi	sp,sp,-32
    8000c454:	00113c23          	sd	ra,24(sp)
    8000c458:	00813823          	sd	s0,16(sp)
    8000c45c:	00913423          	sd	s1,8(sp)
    8000c460:	02010413          	addi	s0,sp,32
    8000c464:	00050493          	mv	s1,a0
}
    8000c468:	00000097          	auipc	ra,0x0
    8000c46c:	f94080e7          	jalr	-108(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000c470:	00048513          	mv	a0,s1
    8000c474:	00000097          	auipc	ra,0x0
    8000c478:	f60080e7          	jalr	-160(ra) # 8000c3d4 <_ZdlPv>
    8000c47c:	01813083          	ld	ra,24(sp)
    8000c480:	01013403          	ld	s0,16(sp)
    8000c484:	00813483          	ld	s1,8(sp)
    8000c488:	02010113          	addi	sp,sp,32
    8000c48c:	00008067          	ret

000000008000c490 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    8000c490:	ff010113          	addi	sp,sp,-16
    8000c494:	00113423          	sd	ra,8(sp)
    8000c498:	00813023          	sd	s0,0(sp)
    8000c49c:	01010413          	addi	s0,sp,16
    8000c4a0:	00000097          	auipc	ra,0x0
    8000c4a4:	bd0080e7          	jalr	-1072(ra) # 8000c070 <mem_alloc>
    8000c4a8:	00813083          	ld	ra,8(sp)
    8000c4ac:	00013403          	ld	s0,0(sp)
    8000c4b0:	01010113          	addi	sp,sp,16
    8000c4b4:	00008067          	ret

000000008000c4b8 <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    8000c4b8:	ff010113          	addi	sp,sp,-16
    8000c4bc:	00113423          	sd	ra,8(sp)
    8000c4c0:	00813023          	sd	s0,0(sp)
    8000c4c4:	01010413          	addi	s0,sp,16
    8000c4c8:	00000097          	auipc	ra,0x0
    8000c4cc:	be0080e7          	jalr	-1056(ra) # 8000c0a8 <mem_free>
    8000c4d0:	00813083          	ld	ra,8(sp)
    8000c4d4:	00013403          	ld	s0,0(sp)
    8000c4d8:	01010113          	addi	sp,sp,16
    8000c4dc:	00008067          	ret

000000008000c4e0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    8000c4e0:	fd010113          	addi	sp,sp,-48
    8000c4e4:	02113423          	sd	ra,40(sp)
    8000c4e8:	02813023          	sd	s0,32(sp)
    8000c4ec:	00913c23          	sd	s1,24(sp)
    8000c4f0:	01213823          	sd	s2,16(sp)
    8000c4f4:	01313423          	sd	s3,8(sp)
    8000c4f8:	03010413          	addi	s0,sp,48
    8000c4fc:	00050493          	mv	s1,a0
    8000c500:	00058993          	mv	s3,a1
    8000c504:	00060913          	mv	s2,a2
    8000c508:	00003797          	auipc	a5,0x3
    8000c50c:	c7878793          	addi	a5,a5,-904 # 8000f180 <_ZTV6Thread+0x10>
    8000c510:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    8000c514:	01800513          	li	a0,24
    8000c518:	00000097          	auipc	ra,0x0
    8000c51c:	e94080e7          	jalr	-364(ra) # 8000c3ac <_Znwm>
    8000c520:	00053023          	sd	zero,0(a0)
    8000c524:	01353423          	sd	s3,8(a0)
    8000c528:	01253823          	sd	s2,16(a0)
    8000c52c:	00a4b423          	sd	a0,8(s1)
}
    8000c530:	02813083          	ld	ra,40(sp)
    8000c534:	02013403          	ld	s0,32(sp)
    8000c538:	01813483          	ld	s1,24(sp)
    8000c53c:	01013903          	ld	s2,16(sp)
    8000c540:	00813983          	ld	s3,8(sp)
    8000c544:	03010113          	addi	sp,sp,48
    8000c548:	00008067          	ret

000000008000c54c <_ZN6Thread5startEv>:
void Thread::start(){
    8000c54c:	fe010113          	addi	sp,sp,-32
    8000c550:	00113c23          	sd	ra,24(sp)
    8000c554:	00813823          	sd	s0,16(sp)
    8000c558:	00913423          	sd	s1,8(sp)
    8000c55c:	02010413          	addi	s0,sp,32
    8000c560:	00050493          	mv	s1,a0
    if(myHandle)
    8000c564:	00853503          	ld	a0,8(a0)
    8000c568:	02050463          	beqz	a0,8000c590 <_ZN6Thread5startEv+0x44>
        thread_create(&w->handle, w->body, w->arg);    
    8000c56c:	01053603          	ld	a2,16(a0)
    8000c570:	00853583          	ld	a1,8(a0)
    8000c574:	00000097          	auipc	ra,0x0
    8000c578:	b88080e7          	jalr	-1144(ra) # 8000c0fc <thread_create>
}
    8000c57c:	01813083          	ld	ra,24(sp)
    8000c580:	01013403          	ld	s0,16(sp)
    8000c584:	00813483          	ld	s1,8(sp)
    8000c588:	02010113          	addi	sp,sp,32
    8000c58c:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    8000c590:	01800513          	li	a0,24
    8000c594:	00000097          	auipc	ra,0x0
    8000c598:	e18080e7          	jalr	-488(ra) # 8000c3ac <_Znwm>
    8000c59c:	00053023          	sd	zero,0(a0)
    8000c5a0:	00053423          	sd	zero,8(a0)
    8000c5a4:	00053823          	sd	zero,16(a0)
        myHandle = (thread_t)w;
    8000c5a8:	00a4b423          	sd	a0,8(s1)
        thread_create(&w->handle, &runWrapper, this);   
    8000c5ac:	00048613          	mv	a2,s1
    8000c5b0:	00000597          	auipc	a1,0x0
    8000c5b4:	d8058593          	addi	a1,a1,-640 # 8000c330 <_ZN6Thread10runWrapperEPv>
    8000c5b8:	00000097          	auipc	ra,0x0
    8000c5bc:	b44080e7          	jalr	-1212(ra) # 8000c0fc <thread_create>
}
    8000c5c0:	fbdff06f          	j	8000c57c <_ZN6Thread5startEv+0x30>

000000008000c5c4 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    8000c5c4:	fe010113          	addi	sp,sp,-32
    8000c5c8:	00113c23          	sd	ra,24(sp)
    8000c5cc:	00813823          	sd	s0,16(sp)
    8000c5d0:	00913423          	sd	s1,8(sp)
    8000c5d4:	01213023          	sd	s2,0(sp)
    8000c5d8:	02010413          	addi	s0,sp,32
    8000c5dc:	00050493          	mv	s1,a0
    8000c5e0:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    8000c5e4:	01000513          	li	a0,16
    8000c5e8:	00000097          	auipc	ra,0x0
    8000c5ec:	dc4080e7          	jalr	-572(ra) # 8000c3ac <_Znwm>
    8000c5f0:	00050613          	mv	a2,a0
    8000c5f4:	00953023          	sd	s1,0(a0)
    8000c5f8:	01253423          	sd	s2,8(a0)
    8000c5fc:	00000597          	auipc	a1,0x0
    8000c600:	d6058593          	addi	a1,a1,-672 # 8000c35c <_ZN14PeriodicThread15periodicWrapperEPv>
    8000c604:	00048513          	mv	a0,s1
    8000c608:	00000097          	auipc	ra,0x0
    8000c60c:	ed8080e7          	jalr	-296(ra) # 8000c4e0 <_ZN6ThreadC1EPFvPvES0_>
    8000c610:	00003797          	auipc	a5,0x3
    8000c614:	b4078793          	addi	a5,a5,-1216 # 8000f150 <_ZTV14PeriodicThread+0x10>
    8000c618:	00f4b023          	sd	a5,0(s1)
    8000c61c:	01813083          	ld	ra,24(sp)
    8000c620:	01013403          	ld	s0,16(sp)
    8000c624:	00813483          	ld	s1,8(sp)
    8000c628:	00013903          	ld	s2,0(sp)
    8000c62c:	02010113          	addi	sp,sp,32
    8000c630:	00008067          	ret

000000008000c634 <_ZN6Thread3runEv>:
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    8000c634:	ff010113          	addi	sp,sp,-16
    8000c638:	00813423          	sd	s0,8(sp)
    8000c63c:	01010413          	addi	s0,sp,16
    8000c640:	00813403          	ld	s0,8(sp)
    8000c644:	01010113          	addi	sp,sp,16
    8000c648:	00008067          	ret

000000008000c64c <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    8000c64c:	ff010113          	addi	sp,sp,-16
    8000c650:	00813423          	sd	s0,8(sp)
    8000c654:	01010413          	addi	s0,sp,16
    8000c658:	00813403          	ld	s0,8(sp)
    8000c65c:	01010113          	addi	sp,sp,16
    8000c660:	00008067          	ret

000000008000c664 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000c664:	ff010113          	addi	sp,sp,-16
    8000c668:	00113423          	sd	ra,8(sp)
    8000c66c:	00813023          	sd	s0,0(sp)
    8000c670:	01010413          	addi	s0,sp,16
    8000c674:	00003797          	auipc	a5,0x3
    8000c678:	adc78793          	addi	a5,a5,-1316 # 8000f150 <_ZTV14PeriodicThread+0x10>
    8000c67c:	00f53023          	sd	a5,0(a0)
    8000c680:	00000097          	auipc	ra,0x0
    8000c684:	d7c080e7          	jalr	-644(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000c688:	00813083          	ld	ra,8(sp)
    8000c68c:	00013403          	ld	s0,0(sp)
    8000c690:	01010113          	addi	sp,sp,16
    8000c694:	00008067          	ret

000000008000c698 <_ZN14PeriodicThreadD0Ev>:
    8000c698:	fe010113          	addi	sp,sp,-32
    8000c69c:	00113c23          	sd	ra,24(sp)
    8000c6a0:	00813823          	sd	s0,16(sp)
    8000c6a4:	00913423          	sd	s1,8(sp)
    8000c6a8:	02010413          	addi	s0,sp,32
    8000c6ac:	00050493          	mv	s1,a0
    8000c6b0:	00003797          	auipc	a5,0x3
    8000c6b4:	aa078793          	addi	a5,a5,-1376 # 8000f150 <_ZTV14PeriodicThread+0x10>
    8000c6b8:	00f53023          	sd	a5,0(a0)
    8000c6bc:	00000097          	auipc	ra,0x0
    8000c6c0:	d40080e7          	jalr	-704(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000c6c4:	00048513          	mv	a0,s1
    8000c6c8:	00000097          	auipc	ra,0x0
    8000c6cc:	d0c080e7          	jalr	-756(ra) # 8000c3d4 <_ZdlPv>
    8000c6d0:	01813083          	ld	ra,24(sp)
    8000c6d4:	01013403          	ld	s0,16(sp)
    8000c6d8:	00813483          	ld	s1,8(sp)
    8000c6dc:	02010113          	addi	sp,sp,32
    8000c6e0:	00008067          	ret

000000008000c6e4 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000c6e4:	fd010113          	addi	sp,sp,-48
    8000c6e8:	02113423          	sd	ra,40(sp)
    8000c6ec:	02813023          	sd	s0,32(sp)
    8000c6f0:	00913c23          	sd	s1,24(sp)
    8000c6f4:	01213823          	sd	s2,16(sp)
    8000c6f8:	01313423          	sd	s3,8(sp)
    8000c6fc:	03010413          	addi	s0,sp,48
    8000c700:	00050493          	mv	s1,a0
    8000c704:	00058993          	mv	s3,a1
    8000c708:	0015879b          	addiw	a5,a1,1
    8000c70c:	0007851b          	sext.w	a0,a5
    8000c710:	00f4a023          	sw	a5,0(s1)
    8000c714:	0004a823          	sw	zero,16(s1)
    8000c718:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000c71c:	00251513          	slli	a0,a0,0x2
    8000c720:	00000097          	auipc	ra,0x0
    8000c724:	950080e7          	jalr	-1712(ra) # 8000c070 <mem_alloc>
    8000c728:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000c72c:	01000513          	li	a0,16
    8000c730:	00000097          	auipc	ra,0x0
    8000c734:	c7c080e7          	jalr	-900(ra) # 8000c3ac <_Znwm>
    8000c738:	00050913          	mv	s2,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000c73c:	00003797          	auipc	a5,0x3
    8000c740:	a6c78793          	addi	a5,a5,-1428 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000c744:	00f53023          	sd	a5,0(a0)
    8000c748:	00000593          	li	a1,0
    8000c74c:	00850513          	addi	a0,a0,8
    8000c750:	00000097          	auipc	ra,0x0
    8000c754:	a64080e7          	jalr	-1436(ra) # 8000c1b4 <sem_open>
    8000c758:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000c75c:	01000513          	li	a0,16
    8000c760:	00000097          	auipc	ra,0x0
    8000c764:	c4c080e7          	jalr	-948(ra) # 8000c3ac <_Znwm>
    8000c768:	00050913          	mv	s2,a0
    8000c76c:	00003797          	auipc	a5,0x3
    8000c770:	a3c78793          	addi	a5,a5,-1476 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000c774:	00f53023          	sd	a5,0(a0)
    8000c778:	00098593          	mv	a1,s3
    8000c77c:	00850513          	addi	a0,a0,8
    8000c780:	00000097          	auipc	ra,0x0
    8000c784:	a34080e7          	jalr	-1484(ra) # 8000c1b4 <sem_open>
    8000c788:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    8000c78c:	01000513          	li	a0,16
    8000c790:	00000097          	auipc	ra,0x0
    8000c794:	c1c080e7          	jalr	-996(ra) # 8000c3ac <_Znwm>
    8000c798:	00050913          	mv	s2,a0
    8000c79c:	00003797          	auipc	a5,0x3
    8000c7a0:	a0c78793          	addi	a5,a5,-1524 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000c7a4:	00f53023          	sd	a5,0(a0)
    8000c7a8:	00100593          	li	a1,1
    8000c7ac:	00850513          	addi	a0,a0,8
    8000c7b0:	00000097          	auipc	ra,0x0
    8000c7b4:	a04080e7          	jalr	-1532(ra) # 8000c1b4 <sem_open>
    8000c7b8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000c7bc:	01000513          	li	a0,16
    8000c7c0:	00000097          	auipc	ra,0x0
    8000c7c4:	bec080e7          	jalr	-1044(ra) # 8000c3ac <_Znwm>
    8000c7c8:	00050913          	mv	s2,a0
    8000c7cc:	00003797          	auipc	a5,0x3
    8000c7d0:	9dc78793          	addi	a5,a5,-1572 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000c7d4:	00f53023          	sd	a5,0(a0)
    8000c7d8:	00100593          	li	a1,1
    8000c7dc:	00850513          	addi	a0,a0,8
    8000c7e0:	00000097          	auipc	ra,0x0
    8000c7e4:	9d4080e7          	jalr	-1580(ra) # 8000c1b4 <sem_open>
    8000c7e8:	0324b823          	sd	s2,48(s1)
}
    8000c7ec:	02813083          	ld	ra,40(sp)
    8000c7f0:	02013403          	ld	s0,32(sp)
    8000c7f4:	01813483          	ld	s1,24(sp)
    8000c7f8:	01013903          	ld	s2,16(sp)
    8000c7fc:	00813983          	ld	s3,8(sp)
    8000c800:	03010113          	addi	sp,sp,48
    8000c804:	00008067          	ret
    8000c808:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000c80c:	00090513          	mv	a0,s2
    8000c810:	00000097          	auipc	ra,0x0
    8000c814:	bc4080e7          	jalr	-1084(ra) # 8000c3d4 <_ZdlPv>
    8000c818:	00048513          	mv	a0,s1
    8000c81c:	00009097          	auipc	ra,0x9
    8000c820:	d2c080e7          	jalr	-724(ra) # 80015548 <_Unwind_Resume>
    8000c824:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000c828:	00090513          	mv	a0,s2
    8000c82c:	00000097          	auipc	ra,0x0
    8000c830:	ba8080e7          	jalr	-1112(ra) # 8000c3d4 <_ZdlPv>
    8000c834:	00048513          	mv	a0,s1
    8000c838:	00009097          	auipc	ra,0x9
    8000c83c:	d10080e7          	jalr	-752(ra) # 80015548 <_Unwind_Resume>
    8000c840:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000c844:	00090513          	mv	a0,s2
    8000c848:	00000097          	auipc	ra,0x0
    8000c84c:	b8c080e7          	jalr	-1140(ra) # 8000c3d4 <_ZdlPv>
    8000c850:	00048513          	mv	a0,s1
    8000c854:	00009097          	auipc	ra,0x9
    8000c858:	cf4080e7          	jalr	-780(ra) # 80015548 <_Unwind_Resume>
    8000c85c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000c860:	00090513          	mv	a0,s2
    8000c864:	00000097          	auipc	ra,0x0
    8000c868:	b70080e7          	jalr	-1168(ra) # 8000c3d4 <_ZdlPv>
    8000c86c:	00048513          	mv	a0,s1
    8000c870:	00009097          	auipc	ra,0x9
    8000c874:	cd8080e7          	jalr	-808(ra) # 80015548 <_Unwind_Resume>

000000008000c878 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000c878:	fe010113          	addi	sp,sp,-32
    8000c87c:	00113c23          	sd	ra,24(sp)
    8000c880:	00813823          	sd	s0,16(sp)
    8000c884:	00913423          	sd	s1,8(sp)
    8000c888:	01213023          	sd	s2,0(sp)
    8000c88c:	02010413          	addi	s0,sp,32
    8000c890:	00050493          	mv	s1,a0
    8000c894:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000c898:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    8000c89c:	0087b503          	ld	a0,8(a5)
    8000c8a0:	00000097          	auipc	ra,0x0
    8000c8a4:	988080e7          	jalr	-1656(ra) # 8000c228 <sem_wait>

    mutexTail->wait();
    8000c8a8:	0304b783          	ld	a5,48(s1)
    8000c8ac:	0087b503          	ld	a0,8(a5)
    8000c8b0:	00000097          	auipc	ra,0x0
    8000c8b4:	978080e7          	jalr	-1672(ra) # 8000c228 <sem_wait>
    buffer[tail] = val;
    8000c8b8:	0084b783          	ld	a5,8(s1)
    8000c8bc:	0144a703          	lw	a4,20(s1)
    8000c8c0:	00271713          	slli	a4,a4,0x2
    8000c8c4:	00e787b3          	add	a5,a5,a4
    8000c8c8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000c8cc:	0144a783          	lw	a5,20(s1)
    8000c8d0:	0017879b          	addiw	a5,a5,1
    8000c8d4:	0004a703          	lw	a4,0(s1)
    8000c8d8:	02e7e7bb          	remw	a5,a5,a4
    8000c8dc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000c8e0:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    8000c8e4:	0087b503          	ld	a0,8(a5)
    8000c8e8:	00000097          	auipc	ra,0x0
    8000c8ec:	978080e7          	jalr	-1672(ra) # 8000c260 <sem_signal>

    itemAvailable->signal();
    8000c8f0:	0204b783          	ld	a5,32(s1)
    8000c8f4:	0087b503          	ld	a0,8(a5)
    8000c8f8:	00000097          	auipc	ra,0x0
    8000c8fc:	968080e7          	jalr	-1688(ra) # 8000c260 <sem_signal>

}
    8000c900:	01813083          	ld	ra,24(sp)
    8000c904:	01013403          	ld	s0,16(sp)
    8000c908:	00813483          	ld	s1,8(sp)
    8000c90c:	00013903          	ld	s2,0(sp)
    8000c910:	02010113          	addi	sp,sp,32
    8000c914:	00008067          	ret

000000008000c918 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000c918:	fe010113          	addi	sp,sp,-32
    8000c91c:	00113c23          	sd	ra,24(sp)
    8000c920:	00813823          	sd	s0,16(sp)
    8000c924:	00913423          	sd	s1,8(sp)
    8000c928:	01213023          	sd	s2,0(sp)
    8000c92c:	02010413          	addi	s0,sp,32
    8000c930:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000c934:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    8000c938:	0087b503          	ld	a0,8(a5)
    8000c93c:	00000097          	auipc	ra,0x0
    8000c940:	8ec080e7          	jalr	-1812(ra) # 8000c228 <sem_wait>

    mutexHead->wait();
    8000c944:	0284b783          	ld	a5,40(s1)
    8000c948:	0087b503          	ld	a0,8(a5)
    8000c94c:	00000097          	auipc	ra,0x0
    8000c950:	8dc080e7          	jalr	-1828(ra) # 8000c228 <sem_wait>

    int ret = buffer[head];
    8000c954:	0084b703          	ld	a4,8(s1)
    8000c958:	0104a783          	lw	a5,16(s1)
    8000c95c:	00279693          	slli	a3,a5,0x2
    8000c960:	00d70733          	add	a4,a4,a3
    8000c964:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000c968:	0017879b          	addiw	a5,a5,1
    8000c96c:	0004a703          	lw	a4,0(s1)
    8000c970:	02e7e7bb          	remw	a5,a5,a4
    8000c974:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000c978:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    8000c97c:	0087b503          	ld	a0,8(a5)
    8000c980:	00000097          	auipc	ra,0x0
    8000c984:	8e0080e7          	jalr	-1824(ra) # 8000c260 <sem_signal>

    spaceAvailable->signal();
    8000c988:	0184b783          	ld	a5,24(s1)
    8000c98c:	0087b503          	ld	a0,8(a5)
    8000c990:	00000097          	auipc	ra,0x0
    8000c994:	8d0080e7          	jalr	-1840(ra) # 8000c260 <sem_signal>

    return ret;
}
    8000c998:	00090513          	mv	a0,s2
    8000c99c:	01813083          	ld	ra,24(sp)
    8000c9a0:	01013403          	ld	s0,16(sp)
    8000c9a4:	00813483          	ld	s1,8(sp)
    8000c9a8:	00013903          	ld	s2,0(sp)
    8000c9ac:	02010113          	addi	sp,sp,32
    8000c9b0:	00008067          	ret

000000008000c9b4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000c9b4:	fe010113          	addi	sp,sp,-32
    8000c9b8:	00113c23          	sd	ra,24(sp)
    8000c9bc:	00813823          	sd	s0,16(sp)
    8000c9c0:	00913423          	sd	s1,8(sp)
    8000c9c4:	01213023          	sd	s2,0(sp)
    8000c9c8:	02010413          	addi	s0,sp,32
    8000c9cc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000c9d0:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    8000c9d4:	0087b503          	ld	a0,8(a5)
    8000c9d8:	00000097          	auipc	ra,0x0
    8000c9dc:	850080e7          	jalr	-1968(ra) # 8000c228 <sem_wait>
    mutexTail->wait();
    8000c9e0:	0304b783          	ld	a5,48(s1)
    8000c9e4:	0087b503          	ld	a0,8(a5)
    8000c9e8:	00000097          	auipc	ra,0x0
    8000c9ec:	840080e7          	jalr	-1984(ra) # 8000c228 <sem_wait>

    if (tail >= head) {
    8000c9f0:	0144a783          	lw	a5,20(s1)
    8000c9f4:	0104a903          	lw	s2,16(s1)
    8000c9f8:	0527c263          	blt	a5,s2,8000ca3c <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    8000c9fc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000ca00:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    8000ca04:	0087b503          	ld	a0,8(a5)
    8000ca08:	00000097          	auipc	ra,0x0
    8000ca0c:	858080e7          	jalr	-1960(ra) # 8000c260 <sem_signal>
    mutexHead->signal();
    8000ca10:	0284b783          	ld	a5,40(s1)
    8000ca14:	0087b503          	ld	a0,8(a5)
    8000ca18:	00000097          	auipc	ra,0x0
    8000ca1c:	848080e7          	jalr	-1976(ra) # 8000c260 <sem_signal>

    return ret;
}
    8000ca20:	00090513          	mv	a0,s2
    8000ca24:	01813083          	ld	ra,24(sp)
    8000ca28:	01013403          	ld	s0,16(sp)
    8000ca2c:	00813483          	ld	s1,8(sp)
    8000ca30:	00013903          	ld	s2,0(sp)
    8000ca34:	02010113          	addi	sp,sp,32
    8000ca38:	00008067          	ret
        ret = cap - head + tail;
    8000ca3c:	0004a703          	lw	a4,0(s1)
    8000ca40:	4127093b          	subw	s2,a4,s2
    8000ca44:	00f9093b          	addw	s2,s2,a5
    8000ca48:	fb9ff06f          	j	8000ca00 <_ZN9BufferCPP6getCntEv+0x4c>

000000008000ca4c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000ca4c:	fe010113          	addi	sp,sp,-32
    8000ca50:	00113c23          	sd	ra,24(sp)
    8000ca54:	00813823          	sd	s0,16(sp)
    8000ca58:	00913423          	sd	s1,8(sp)
    8000ca5c:	02010413          	addi	s0,sp,32
    8000ca60:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    8000ca64:	00a00513          	li	a0,10
    8000ca68:	00000097          	auipc	ra,0x0
    8000ca6c:	8a4080e7          	jalr	-1884(ra) # 8000c30c <putc>
    printString("Buffer deleted!\n");
    8000ca70:	00002517          	auipc	a0,0x2
    8000ca74:	74850513          	addi	a0,a0,1864 # 8000f1b8 <_ZTV9Semaphore+0x20>
    8000ca78:	00000097          	auipc	ra,0x0
    8000ca7c:	15c080e7          	jalr	348(ra) # 8000cbd4 <_Z11printStringPKc>
    while (getCnt()) {
    8000ca80:	00048513          	mv	a0,s1
    8000ca84:	00000097          	auipc	ra,0x0
    8000ca88:	f30080e7          	jalr	-208(ra) # 8000c9b4 <_ZN9BufferCPP6getCntEv>
    8000ca8c:	02050c63          	beqz	a0,8000cac4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000ca90:	0084b783          	ld	a5,8(s1)
    8000ca94:	0104a703          	lw	a4,16(s1)
    8000ca98:	00271713          	slli	a4,a4,0x2
    8000ca9c:	00e787b3          	add	a5,a5,a4
    8000caa0:	0007c503          	lbu	a0,0(a5)
    8000caa4:	00000097          	auipc	ra,0x0
    8000caa8:	868080e7          	jalr	-1944(ra) # 8000c30c <putc>
        head = (head + 1) % cap;
    8000caac:	0104a783          	lw	a5,16(s1)
    8000cab0:	0017879b          	addiw	a5,a5,1
    8000cab4:	0004a703          	lw	a4,0(s1)
    8000cab8:	02e7e7bb          	remw	a5,a5,a4
    8000cabc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000cac0:	fc1ff06f          	j	8000ca80 <_ZN9BufferCPPD1Ev+0x34>
    8000cac4:	02100513          	li	a0,33
    8000cac8:	00000097          	auipc	ra,0x0
    8000cacc:	844080e7          	jalr	-1980(ra) # 8000c30c <putc>
    8000cad0:	00a00513          	li	a0,10
    8000cad4:	00000097          	auipc	ra,0x0
    8000cad8:	838080e7          	jalr	-1992(ra) # 8000c30c <putc>
    mem_free(buffer);
    8000cadc:	0084b503          	ld	a0,8(s1)
    8000cae0:	fffff097          	auipc	ra,0xfffff
    8000cae4:	5c8080e7          	jalr	1480(ra) # 8000c0a8 <mem_free>
    delete itemAvailable;
    8000cae8:	0204b503          	ld	a0,32(s1)
    8000caec:	00050863          	beqz	a0,8000cafc <_ZN9BufferCPPD1Ev+0xb0>
    8000caf0:	00053783          	ld	a5,0(a0)
    8000caf4:	0087b783          	ld	a5,8(a5)
    8000caf8:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000cafc:	0184b503          	ld	a0,24(s1)
    8000cb00:	00050863          	beqz	a0,8000cb10 <_ZN9BufferCPPD1Ev+0xc4>
    8000cb04:	00053783          	ld	a5,0(a0)
    8000cb08:	0087b783          	ld	a5,8(a5)
    8000cb0c:	000780e7          	jalr	a5
    delete mutexTail;
    8000cb10:	0304b503          	ld	a0,48(s1)
    8000cb14:	00050863          	beqz	a0,8000cb24 <_ZN9BufferCPPD1Ev+0xd8>
    8000cb18:	00053783          	ld	a5,0(a0)
    8000cb1c:	0087b783          	ld	a5,8(a5)
    8000cb20:	000780e7          	jalr	a5
    delete mutexHead;
    8000cb24:	0284b503          	ld	a0,40(s1)
    8000cb28:	00050863          	beqz	a0,8000cb38 <_ZN9BufferCPPD1Ev+0xec>
    8000cb2c:	00053783          	ld	a5,0(a0)
    8000cb30:	0087b783          	ld	a5,8(a5)
    8000cb34:	000780e7          	jalr	a5
}
    8000cb38:	01813083          	ld	ra,24(sp)
    8000cb3c:	01013403          	ld	s0,16(sp)
    8000cb40:	00813483          	ld	s1,8(sp)
    8000cb44:	02010113          	addi	sp,sp,32
    8000cb48:	00008067          	ret

000000008000cb4c <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    8000cb4c:	ff010113          	addi	sp,sp,-16
    8000cb50:	00113423          	sd	ra,8(sp)
    8000cb54:	00813023          	sd	s0,0(sp)
    8000cb58:	01010413          	addi	s0,sp,16
    8000cb5c:	00002797          	auipc	a5,0x2
    8000cb60:	64c78793          	addi	a5,a5,1612 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000cb64:	00f53023          	sd	a5,0(a0)
    8000cb68:	00853503          	ld	a0,8(a0)
    8000cb6c:	fffff097          	auipc	ra,0xfffff
    8000cb70:	684080e7          	jalr	1668(ra) # 8000c1f0 <sem_close>
    8000cb74:	00813083          	ld	ra,8(sp)
    8000cb78:	00013403          	ld	s0,0(sp)
    8000cb7c:	01010113          	addi	sp,sp,16
    8000cb80:	00008067          	ret

000000008000cb84 <_ZN9SemaphoreD0Ev>:
    8000cb84:	fe010113          	addi	sp,sp,-32
    8000cb88:	00113c23          	sd	ra,24(sp)
    8000cb8c:	00813823          	sd	s0,16(sp)
    8000cb90:	00913423          	sd	s1,8(sp)
    8000cb94:	02010413          	addi	s0,sp,32
    8000cb98:	00050493          	mv	s1,a0
    8000cb9c:	00002797          	auipc	a5,0x2
    8000cba0:	60c78793          	addi	a5,a5,1548 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000cba4:	00f53023          	sd	a5,0(a0)
    8000cba8:	00853503          	ld	a0,8(a0)
    8000cbac:	fffff097          	auipc	ra,0xfffff
    8000cbb0:	644080e7          	jalr	1604(ra) # 8000c1f0 <sem_close>
    8000cbb4:	00048513          	mv	a0,s1
    8000cbb8:	00000097          	auipc	ra,0x0
    8000cbbc:	81c080e7          	jalr	-2020(ra) # 8000c3d4 <_ZdlPv>
    8000cbc0:	01813083          	ld	ra,24(sp)
    8000cbc4:	01013403          	ld	s0,16(sp)
    8000cbc8:	00813483          	ld	s1,8(sp)
    8000cbcc:	02010113          	addi	sp,sp,32
    8000cbd0:	00008067          	ret

000000008000cbd4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000cbd4:	fe010113          	addi	sp,sp,-32
    8000cbd8:	00113c23          	sd	ra,24(sp)
    8000cbdc:	00813823          	sd	s0,16(sp)
    8000cbe0:	00913423          	sd	s1,8(sp)
    8000cbe4:	02010413          	addi	s0,sp,32
    8000cbe8:	00050493          	mv	s1,a0
    LOCK();
    8000cbec:	00100613          	li	a2,1
    8000cbf0:	00000593          	li	a1,0
    8000cbf4:	00009517          	auipc	a0,0x9
    8000cbf8:	40c50513          	addi	a0,a0,1036 # 80016000 <lockPrint>
    8000cbfc:	fffff097          	auipc	ra,0xfffff
    8000cc00:	404080e7          	jalr	1028(ra) # 8000c000 <_user_text_start>
    8000cc04:	fe0514e3          	bnez	a0,8000cbec <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000cc08:	0004c503          	lbu	a0,0(s1)
    8000cc0c:	00050a63          	beqz	a0,8000cc20 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    8000cc10:	fffff097          	auipc	ra,0xfffff
    8000cc14:	6fc080e7          	jalr	1788(ra) # 8000c30c <putc>
        string++;
    8000cc18:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000cc1c:	fedff06f          	j	8000cc08 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    8000cc20:	00000613          	li	a2,0
    8000cc24:	00100593          	li	a1,1
    8000cc28:	00009517          	auipc	a0,0x9
    8000cc2c:	3d850513          	addi	a0,a0,984 # 80016000 <lockPrint>
    8000cc30:	fffff097          	auipc	ra,0xfffff
    8000cc34:	3d0080e7          	jalr	976(ra) # 8000c000 <_user_text_start>
    8000cc38:	fe0514e3          	bnez	a0,8000cc20 <_Z11printStringPKc+0x4c>
}
    8000cc3c:	01813083          	ld	ra,24(sp)
    8000cc40:	01013403          	ld	s0,16(sp)
    8000cc44:	00813483          	ld	s1,8(sp)
    8000cc48:	02010113          	addi	sp,sp,32
    8000cc4c:	00008067          	ret

000000008000cc50 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000cc50:	fd010113          	addi	sp,sp,-48
    8000cc54:	02113423          	sd	ra,40(sp)
    8000cc58:	02813023          	sd	s0,32(sp)
    8000cc5c:	00913c23          	sd	s1,24(sp)
    8000cc60:	01213823          	sd	s2,16(sp)
    8000cc64:	01313423          	sd	s3,8(sp)
    8000cc68:	01413023          	sd	s4,0(sp)
    8000cc6c:	03010413          	addi	s0,sp,48
    8000cc70:	00050993          	mv	s3,a0
    8000cc74:	00058a13          	mv	s4,a1
    LOCK();
    8000cc78:	00100613          	li	a2,1
    8000cc7c:	00000593          	li	a1,0
    8000cc80:	00009517          	auipc	a0,0x9
    8000cc84:	38050513          	addi	a0,a0,896 # 80016000 <lockPrint>
    8000cc88:	fffff097          	auipc	ra,0xfffff
    8000cc8c:	378080e7          	jalr	888(ra) # 8000c000 <_user_text_start>
    8000cc90:	fe0514e3          	bnez	a0,8000cc78 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000cc94:	00000493          	li	s1,0
    8000cc98:	0014891b          	addiw	s2,s1,1
    8000cc9c:	03495a63          	bge	s2,s4,8000ccd0 <_Z9getStringPci+0x80>
        cc = getc();
    8000cca0:	fffff097          	auipc	ra,0xfffff
    8000cca4:	630080e7          	jalr	1584(ra) # 8000c2d0 <getc>
        if(cc < 1)
    8000cca8:	02050463          	beqz	a0,8000ccd0 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    8000ccac:	009984b3          	add	s1,s3,s1
    8000ccb0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000ccb4:	00a00793          	li	a5,10
    8000ccb8:	00f50a63          	beq	a0,a5,8000cccc <_Z9getStringPci+0x7c>
        buf[i++] = c;
    8000ccbc:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    8000ccc0:	00d00793          	li	a5,13
    8000ccc4:	fcf51ae3          	bne	a0,a5,8000cc98 <_Z9getStringPci+0x48>
    8000ccc8:	0080006f          	j	8000ccd0 <_Z9getStringPci+0x80>
        buf[i++] = c;
    8000cccc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000ccd0:	009984b3          	add	s1,s3,s1
    8000ccd4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000ccd8:	00000613          	li	a2,0
    8000ccdc:	00100593          	li	a1,1
    8000cce0:	00009517          	auipc	a0,0x9
    8000cce4:	32050513          	addi	a0,a0,800 # 80016000 <lockPrint>
    8000cce8:	fffff097          	auipc	ra,0xfffff
    8000ccec:	318080e7          	jalr	792(ra) # 8000c000 <_user_text_start>
    8000ccf0:	fe0514e3          	bnez	a0,8000ccd8 <_Z9getStringPci+0x88>
    return buf;
}
    8000ccf4:	00098513          	mv	a0,s3
    8000ccf8:	02813083          	ld	ra,40(sp)
    8000ccfc:	02013403          	ld	s0,32(sp)
    8000cd00:	01813483          	ld	s1,24(sp)
    8000cd04:	01013903          	ld	s2,16(sp)
    8000cd08:	00813983          	ld	s3,8(sp)
    8000cd0c:	00013a03          	ld	s4,0(sp)
    8000cd10:	03010113          	addi	sp,sp,48
    8000cd14:	00008067          	ret

000000008000cd18 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000cd18:	ff010113          	addi	sp,sp,-16
    8000cd1c:	00813423          	sd	s0,8(sp)
    8000cd20:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    8000cd24:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    8000cd28:	00054603          	lbu	a2,0(a0)
    8000cd2c:	fd06069b          	addiw	a3,a2,-48
    8000cd30:	0ff6f693          	andi	a3,a3,255
    8000cd34:	00900713          	li	a4,9
    8000cd38:	02d76063          	bltu	a4,a3,8000cd58 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    8000cd3c:	0027969b          	slliw	a3,a5,0x2
    8000cd40:	00f687bb          	addw	a5,a3,a5
    8000cd44:	0017971b          	slliw	a4,a5,0x1
    8000cd48:	00150513          	addi	a0,a0,1
    8000cd4c:	00c707bb          	addw	a5,a4,a2
    8000cd50:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    8000cd54:	fd5ff06f          	j	8000cd28 <_Z11stringToIntPKc+0x10>
    return n;
}
    8000cd58:	00078513          	mv	a0,a5
    8000cd5c:	00813403          	ld	s0,8(sp)
    8000cd60:	01010113          	addi	sp,sp,16
    8000cd64:	00008067          	ret

000000008000cd68 <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    8000cd68:	fc010113          	addi	sp,sp,-64
    8000cd6c:	02113c23          	sd	ra,56(sp)
    8000cd70:	02813823          	sd	s0,48(sp)
    8000cd74:	02913423          	sd	s1,40(sp)
    8000cd78:	03213023          	sd	s2,32(sp)
    8000cd7c:	01313c23          	sd	s3,24(sp)
    8000cd80:	04010413          	addi	s0,sp,64
    8000cd84:	00050913          	mv	s2,a0
    8000cd88:	00058993          	mv	s3,a1
    LOCK();
    8000cd8c:	00100613          	li	a2,1
    8000cd90:	00000593          	li	a1,0
    8000cd94:	00009517          	auipc	a0,0x9
    8000cd98:	26c50513          	addi	a0,a0,620 # 80016000 <lockPrint>
    8000cd9c:	fffff097          	auipc	ra,0xfffff
    8000cda0:	264080e7          	jalr	612(ra) # 8000c000 <_user_text_start>
    8000cda4:	fe0514e3          	bnez	a0,8000cd8c <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    8000cda8:	00000793          	li	a5,0
    8000cdac:	0080006f          	j	8000cdb4 <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    8000cdb0:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    8000cdb4:	033976b3          	remu	a3,s2,s3
    8000cdb8:	0017849b          	addiw	s1,a5,1
    8000cdbc:	00006717          	auipc	a4,0x6
    8000cdc0:	24470713          	addi	a4,a4,580 # 80013000 <digits>
    8000cdc4:	00d70733          	add	a4,a4,a3
    8000cdc8:	00074703          	lbu	a4,0(a4)
    8000cdcc:	fd040693          	addi	a3,s0,-48
    8000cdd0:	00f687b3          	add	a5,a3,a5
    8000cdd4:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    8000cdd8:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    8000cddc:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    8000cde0:	fd3978e3          	bgeu	s2,s3,8000cdb0 <_Z8printIntmi+0x48>

    while(--i >= 0)
    8000cde4:	fff4849b          	addiw	s1,s1,-1
    8000cde8:	0004ce63          	bltz	s1,8000ce04 <_Z8printIntmi+0x9c>
        putc(buf[i]);
    8000cdec:	fd040793          	addi	a5,s0,-48
    8000cdf0:	009787b3          	add	a5,a5,s1
    8000cdf4:	ff07c503          	lbu	a0,-16(a5)
    8000cdf8:	fffff097          	auipc	ra,0xfffff
    8000cdfc:	514080e7          	jalr	1300(ra) # 8000c30c <putc>
    8000ce00:	fe5ff06f          	j	8000cde4 <_Z8printIntmi+0x7c>

    UNLOCK();
    8000ce04:	00000613          	li	a2,0
    8000ce08:	00100593          	li	a1,1
    8000ce0c:	00009517          	auipc	a0,0x9
    8000ce10:	1f450513          	addi	a0,a0,500 # 80016000 <lockPrint>
    8000ce14:	fffff097          	auipc	ra,0xfffff
    8000ce18:	1ec080e7          	jalr	492(ra) # 8000c000 <_user_text_start>
    8000ce1c:	fe0514e3          	bnez	a0,8000ce04 <_Z8printIntmi+0x9c>
    8000ce20:	03813083          	ld	ra,56(sp)
    8000ce24:	03013403          	ld	s0,48(sp)
    8000ce28:	02813483          	ld	s1,40(sp)
    8000ce2c:	02013903          	ld	s2,32(sp)
    8000ce30:	01813983          	ld	s3,24(sp)
    8000ce34:	04010113          	addi	sp,sp,64
    8000ce38:	00008067          	ret

000000008000ce3c <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    8000ce3c:	f9010113          	addi	sp,sp,-112
    8000ce40:	06113423          	sd	ra,104(sp)
    8000ce44:	06813023          	sd	s0,96(sp)
    8000ce48:	04913c23          	sd	s1,88(sp)
    8000ce4c:	05213823          	sd	s2,80(sp)
    8000ce50:	05313423          	sd	s3,72(sp)
    8000ce54:	05413023          	sd	s4,64(sp)
    8000ce58:	03513c23          	sd	s5,56(sp)
    8000ce5c:	03613823          	sd	s6,48(sp)
    8000ce60:	03713423          	sd	s7,40(sp)
    8000ce64:	03813023          	sd	s8,32(sp)
    8000ce68:	07010413          	addi	s0,sp,112
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    8000ce6c:	00010c13          	mv	s8,sp
        printString("Unesite broj proizvodjaca?\n");
    8000ce70:	00002517          	auipc	a0,0x2
    8000ce74:	3d850513          	addi	a0,a0,984 # 8000f248 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    8000ce78:	00000097          	auipc	ra,0x0
    8000ce7c:	d5c080e7          	jalr	-676(ra) # 8000cbd4 <_Z11printStringPKc>
        getString(input, 30);
    8000ce80:	01e00593          	li	a1,30
    8000ce84:	f9040513          	addi	a0,s0,-112
    8000ce88:	00000097          	auipc	ra,0x0
    8000ce8c:	dc8080e7          	jalr	-568(ra) # 8000cc50 <_Z9getStringPci>
        threadNum = stringToInt(input);
    8000ce90:	f9040513          	addi	a0,s0,-112
    8000ce94:	00000097          	auipc	ra,0x0
    8000ce98:	e84080e7          	jalr	-380(ra) # 8000cd18 <_Z11stringToIntPKc>
    8000ce9c:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    8000cea0:	00002517          	auipc	a0,0x2
    8000cea4:	3c850513          	addi	a0,a0,968 # 8000f268 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    8000cea8:	00000097          	auipc	ra,0x0
    8000ceac:	d2c080e7          	jalr	-724(ra) # 8000cbd4 <_Z11printStringPKc>
        getString(input, 30);
    8000ceb0:	01e00593          	li	a1,30
    8000ceb4:	f9040513          	addi	a0,s0,-112
    8000ceb8:	00000097          	auipc	ra,0x0
    8000cebc:	d98080e7          	jalr	-616(ra) # 8000cc50 <_Z9getStringPci>
        n = stringToInt(input);
    8000cec0:	f9040513          	addi	a0,s0,-112
    8000cec4:	00000097          	auipc	ra,0x0
    8000cec8:	e54080e7          	jalr	-428(ra) # 8000cd18 <_Z11stringToIntPKc>
    8000cecc:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    8000ced0:	00002517          	auipc	a0,0x2
    8000ced4:	3b850513          	addi	a0,a0,952 # 8000f288 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    8000ced8:	00000097          	auipc	ra,0x0
    8000cedc:	cfc080e7          	jalr	-772(ra) # 8000cbd4 <_Z11printStringPKc>
    8000cee0:	00a00593          	li	a1,10
    8000cee4:	00098513          	mv	a0,s3
    8000cee8:	00000097          	auipc	ra,0x0
    8000ceec:	e80080e7          	jalr	-384(ra) # 8000cd68 <_Z8printIntmi>
        printString(" i velicina bafera "); printInt(n);
    8000cef0:	00002517          	auipc	a0,0x2
    8000cef4:	3b050513          	addi	a0,a0,944 # 8000f2a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    8000cef8:	00000097          	auipc	ra,0x0
    8000cefc:	cdc080e7          	jalr	-804(ra) # 8000cbd4 <_Z11printStringPKc>
    8000cf00:	00a00593          	li	a1,10
    8000cf04:	00048513          	mv	a0,s1
    8000cf08:	00000097          	auipc	ra,0x0
    8000cf0c:	e60080e7          	jalr	-416(ra) # 8000cd68 <_Z8printIntmi>
        printString(".\n");
    8000cf10:	00002517          	auipc	a0,0x2
    8000cf14:	3a850513          	addi	a0,a0,936 # 8000f2b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    8000cf18:	00000097          	auipc	ra,0x0
    8000cf1c:	cbc080e7          	jalr	-836(ra) # 8000cbd4 <_Z11printStringPKc>
        if(threadNum > n) {
    8000cf20:	0334cc63          	blt	s1,s3,8000cf58 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x11c>
        } else if (threadNum < 1) {
    8000cf24:	05305463          	blez	s3,8000cf6c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
        printString("\n-----USER---NIT-----\nAlokacija BufferCpp: ");
    8000cf28:	00002517          	auipc	a0,0x2
    8000cf2c:	40850513          	addi	a0,a0,1032 # 8000f330 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    8000cf30:	00000097          	auipc	ra,0x0
    8000cf34:	ca4080e7          	jalr	-860(ra) # 8000cbd4 <_Z11printStringPKc>
        BufferCPP *buffer = new BufferCPP(n);
    8000cf38:	03800513          	li	a0,56
    8000cf3c:	fffff097          	auipc	ra,0xfffff
    8000cf40:	470080e7          	jalr	1136(ra) # 8000c3ac <_Znwm>
    8000cf44:	00050a93          	mv	s5,a0
    8000cf48:	00048593          	mv	a1,s1
    8000cf4c:	fffff097          	auipc	ra,0xfffff
    8000cf50:	798080e7          	jalr	1944(ra) # 8000c6e4 <_ZN9BufferCPPC1Ei>
    8000cf54:	0300006f          	j	8000cf84 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x148>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000cf58:	00002517          	auipc	a0,0x2
    8000cf5c:	36850513          	addi	a0,a0,872 # 8000f2c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    8000cf60:	00000097          	auipc	ra,0x0
    8000cf64:	c74080e7          	jalr	-908(ra) # 8000cbd4 <_Z11printStringPKc>
            return;
    8000cf68:	0140006f          	j	8000cf7c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x140>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000cf6c:	00002517          	auipc	a0,0x2
    8000cf70:	39450513          	addi	a0,a0,916 # 8000f300 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    8000cf74:	00000097          	auipc	ra,0x0
    8000cf78:	c60080e7          	jalr	-928(ra) # 8000cbd4 <_Z11printStringPKc>
            return;
    8000cf7c:	000c0113          	mv	sp,s8
    8000cf80:	3240006f          	j	8000d2a4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x468>
        printInt((uint64)buffer, 16);
    8000cf84:	01000593          	li	a1,16
    8000cf88:	000a8513          	mv	a0,s5
    8000cf8c:	00000097          	auipc	ra,0x0
    8000cf90:	ddc080e7          	jalr	-548(ra) # 8000cd68 <_Z8printIntmi>
        printString("\nsizeof(BufferCPP): "); printInt(sizeof(BufferCPP), 16); printString(".\n");
    8000cf94:	00002517          	auipc	a0,0x2
    8000cf98:	3cc50513          	addi	a0,a0,972 # 8000f360 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    8000cf9c:	00000097          	auipc	ra,0x0
    8000cfa0:	c38080e7          	jalr	-968(ra) # 8000cbd4 <_Z11printStringPKc>
    8000cfa4:	01000593          	li	a1,16
    8000cfa8:	03800513          	li	a0,56
    8000cfac:	00000097          	auipc	ra,0x0
    8000cfb0:	dbc080e7          	jalr	-580(ra) # 8000cd68 <_Z8printIntmi>
    8000cfb4:	00002517          	auipc	a0,0x2
    8000cfb8:	30450513          	addi	a0,a0,772 # 8000f2b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    8000cfbc:	00000097          	auipc	ra,0x0
    8000cfc0:	c18080e7          	jalr	-1000(ra) # 8000cbd4 <_Z11printStringPKc>
        printString("\n----USER-NIT---\n");
    8000cfc4:	00002517          	auipc	a0,0x2
    8000cfc8:	3b450513          	addi	a0,a0,948 # 8000f378 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x158>
    8000cfcc:	00000097          	auipc	ra,0x0
    8000cfd0:	c08080e7          	jalr	-1016(ra) # 8000cbd4 <_Z11printStringPKc>
        waitForAll = new Semaphore(0);
    8000cfd4:	01000513          	li	a0,16
    8000cfd8:	fffff097          	auipc	ra,0xfffff
    8000cfdc:	3d4080e7          	jalr	980(ra) # 8000c3ac <_Znwm>
    8000cfe0:	00050493          	mv	s1,a0
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000cfe4:	00002797          	auipc	a5,0x2
    8000cfe8:	1c478793          	addi	a5,a5,452 # 8000f1a8 <_ZTV9Semaphore+0x10>
    8000cfec:	00f53023          	sd	a5,0(a0)
    8000cff0:	00000593          	li	a1,0
    8000cff4:	00850513          	addi	a0,a0,8
    8000cff8:	fffff097          	auipc	ra,0xfffff
    8000cffc:	1bc080e7          	jalr	444(ra) # 8000c1b4 <sem_open>
    8000d000:	00009917          	auipc	s2,0x9
    8000d004:	01090913          	addi	s2,s2,16 # 80016010 <_ZN19ConsumerProducerCPP10waitForAllE>
    8000d008:	00993023          	sd	s1,0(s2)
        Thread *producers[threadNum];
    8000d00c:	00399793          	slli	a5,s3,0x3
    8000d010:	00f78793          	addi	a5,a5,15
    8000d014:	ff07f793          	andi	a5,a5,-16
    8000d018:	40f10133          	sub	sp,sp,a5
    8000d01c:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    8000d020:	0019879b          	addiw	a5,s3,1
    8000d024:	00179713          	slli	a4,a5,0x1
    8000d028:	00f70733          	add	a4,a4,a5
    8000d02c:	00371793          	slli	a5,a4,0x3
    8000d030:	00f78793          	addi	a5,a5,15
    8000d034:	ff07f793          	andi	a5,a5,-16
    8000d038:	40f10133          	sub	sp,sp,a5
    8000d03c:	00010b13          	mv	s6,sp
        threadData[threadNum].id = threadNum;
    8000d040:	00199793          	slli	a5,s3,0x1
    8000d044:	013787b3          	add	a5,a5,s3
    8000d048:	00379493          	slli	s1,a5,0x3
    8000d04c:	009b04b3          	add	s1,s6,s1
    8000d050:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    8000d054:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    8000d058:	00093783          	ld	a5,0(s2)
    8000d05c:	00f4b823          	sd	a5,16(s1)
        printString("\n-----USER---NIT-----\nAlokacija Consumer: ");
    8000d060:	00002517          	auipc	a0,0x2
    8000d064:	33050513          	addi	a0,a0,816 # 8000f390 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x170>
    8000d068:	00000097          	auipc	ra,0x0
    8000d06c:	b6c080e7          	jalr	-1172(ra) # 8000cbd4 <_Z11printStringPKc>
        Thread *consumer = new Consumer(&threadData[threadNum]);
    8000d070:	01800513          	li	a0,24
    8000d074:	fffff097          	auipc	ra,0xfffff
    8000d078:	338080e7          	jalr	824(ra) # 8000c3ac <_Znwm>
    8000d07c:	00050b93          	mv	s7,a0
    Thread (){ myHandle = nullptr;}
    8000d080:	00053423          	sd	zero,8(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000d084:	00002797          	auipc	a5,0x2
    8000d088:	1ac78793          	addi	a5,a5,428 # 8000f230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    8000d08c:	00f53023          	sd	a5,0(a0)
    8000d090:	00953823          	sd	s1,16(a0)
        printInt((uint64)consumer, 16);
    8000d094:	01000593          	li	a1,16
    8000d098:	00000097          	auipc	ra,0x0
    8000d09c:	cd0080e7          	jalr	-816(ra) # 8000cd68 <_Z8printIntmi>
        printString("\nsizeof(Consumer): "); printInt(sizeof(Consumer), 16); printString(".\n");
    8000d0a0:	00002517          	auipc	a0,0x2
    8000d0a4:	32050513          	addi	a0,a0,800 # 8000f3c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1a0>
    8000d0a8:	00000097          	auipc	ra,0x0
    8000d0ac:	b2c080e7          	jalr	-1236(ra) # 8000cbd4 <_Z11printStringPKc>
    8000d0b0:	01000593          	li	a1,16
    8000d0b4:	01800513          	li	a0,24
    8000d0b8:	00000097          	auipc	ra,0x0
    8000d0bc:	cb0080e7          	jalr	-848(ra) # 8000cd68 <_Z8printIntmi>
    8000d0c0:	00002517          	auipc	a0,0x2
    8000d0c4:	1f850513          	addi	a0,a0,504 # 8000f2b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    8000d0c8:	00000097          	auipc	ra,0x0
    8000d0cc:	b0c080e7          	jalr	-1268(ra) # 8000cbd4 <_Z11printStringPKc>
        printString("\n----USER-NIT---\n");
    8000d0d0:	00002517          	auipc	a0,0x2
    8000d0d4:	2a850513          	addi	a0,a0,680 # 8000f378 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x158>
    8000d0d8:	00000097          	auipc	ra,0x0
    8000d0dc:	afc080e7          	jalr	-1284(ra) # 8000cbd4 <_Z11printStringPKc>
        consumer->start();
    8000d0e0:	000b8513          	mv	a0,s7
    8000d0e4:	fffff097          	auipc	ra,0xfffff
    8000d0e8:	468080e7          	jalr	1128(ra) # 8000c54c <_ZN6Thread5startEv>
        threadData[0].id = 0;
    8000d0ec:	000b2023          	sw	zero,0(s6)
        threadData[0].buffer = buffer;
    8000d0f0:	015b3423          	sd	s5,8(s6)
        threadData[0].sem = waitForAll;
    8000d0f4:	00093783          	ld	a5,0(s2)
    8000d0f8:	00fb3823          	sd	a5,16(s6)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    8000d0fc:	01800513          	li	a0,24
    8000d100:	fffff097          	auipc	ra,0xfffff
    8000d104:	2ac080e7          	jalr	684(ra) # 8000c3ac <_Znwm>
    8000d108:	00053423          	sd	zero,8(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000d10c:	00002717          	auipc	a4,0x2
    8000d110:	0d470713          	addi	a4,a4,212 # 8000f1e0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    8000d114:	00e53023          	sd	a4,0(a0)
    8000d118:	01653823          	sd	s6,16(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    8000d11c:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    8000d120:	fffff097          	auipc	ra,0xfffff
    8000d124:	42c080e7          	jalr	1068(ra) # 8000c54c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    8000d128:	00100913          	li	s2,1
    8000d12c:	0d395463          	bge	s2,s3,8000d1f4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x3b8>
            threadData[i].id = i;
    8000d130:	00191793          	slli	a5,s2,0x1
    8000d134:	012787b3          	add	a5,a5,s2
    8000d138:	00379493          	slli	s1,a5,0x3
    8000d13c:	009b04b3          	add	s1,s6,s1
    8000d140:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    8000d144:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    8000d148:	00009797          	auipc	a5,0x9
    8000d14c:	ec878793          	addi	a5,a5,-312 # 80016010 <_ZN19ConsumerProducerCPP10waitForAllE>
    8000d150:	0007b783          	ld	a5,0(a5)
    8000d154:	00f4b823          	sd	a5,16(s1)
            printString("\n-----USER---NIT-----\nAlokacija Producer: ");
    8000d158:	00002517          	auipc	a0,0x2
    8000d15c:	28050513          	addi	a0,a0,640 # 8000f3d8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1b8>
    8000d160:	00000097          	auipc	ra,0x0
    8000d164:	a74080e7          	jalr	-1420(ra) # 8000cbd4 <_Z11printStringPKc>
            producers[i] = new Producer(&threadData[i]);
    8000d168:	01800513          	li	a0,24
    8000d16c:	fffff097          	auipc	ra,0xfffff
    8000d170:	240080e7          	jalr	576(ra) # 8000c3ac <_Znwm>
    8000d174:	00053423          	sd	zero,8(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    8000d178:	00002717          	auipc	a4,0x2
    8000d17c:	09070713          	addi	a4,a4,144 # 8000f208 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    8000d180:	00e53023          	sd	a4,0(a0)
    8000d184:	00953823          	sd	s1,16(a0)
            producers[i] = new Producer(&threadData[i]);
    8000d188:	00391493          	slli	s1,s2,0x3
    8000d18c:	009a04b3          	add	s1,s4,s1
    8000d190:	00a4b023          	sd	a0,0(s1)
            printInt((uint64)producers[i], 16);
    8000d194:	01000593          	li	a1,16
    8000d198:	00000097          	auipc	ra,0x0
    8000d19c:	bd0080e7          	jalr	-1072(ra) # 8000cd68 <_Z8printIntmi>
            printString("\nsizeof(Producer): "); printInt(sizeof(Producer), 16); printString(".\n");
    8000d1a0:	00002517          	auipc	a0,0x2
    8000d1a4:	26850513          	addi	a0,a0,616 # 8000f408 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e8>
    8000d1a8:	00000097          	auipc	ra,0x0
    8000d1ac:	a2c080e7          	jalr	-1492(ra) # 8000cbd4 <_Z11printStringPKc>
    8000d1b0:	01000593          	li	a1,16
    8000d1b4:	01800513          	li	a0,24
    8000d1b8:	00000097          	auipc	ra,0x0
    8000d1bc:	bb0080e7          	jalr	-1104(ra) # 8000cd68 <_Z8printIntmi>
    8000d1c0:	00002517          	auipc	a0,0x2
    8000d1c4:	0f850513          	addi	a0,a0,248 # 8000f2b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    8000d1c8:	00000097          	auipc	ra,0x0
    8000d1cc:	a0c080e7          	jalr	-1524(ra) # 8000cbd4 <_Z11printStringPKc>
            printString("\n");
    8000d1d0:	00001517          	auipc	a0,0x1
    8000d1d4:	18850513          	addi	a0,a0,392 # 8000e358 <CONSOLE_STATUS+0x348>
    8000d1d8:	00000097          	auipc	ra,0x0
    8000d1dc:	9fc080e7          	jalr	-1540(ra) # 8000cbd4 <_Z11printStringPKc>
            producers[i]->start();
    8000d1e0:	0004b503          	ld	a0,0(s1)
    8000d1e4:	fffff097          	auipc	ra,0xfffff
    8000d1e8:	368080e7          	jalr	872(ra) # 8000c54c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    8000d1ec:	0019091b          	addiw	s2,s2,1
    8000d1f0:	f3dff06f          	j	8000d12c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f0>
    static void dispatch () { thread_dispatch(); }
    8000d1f4:	fffff097          	auipc	ra,0xfffff
    8000d1f8:	ee4080e7          	jalr	-284(ra) # 8000c0d8 <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    8000d1fc:	00000493          	li	s1,0
    8000d200:	0299c263          	blt	s3,s1,8000d224 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x3e8>
            waitForAll->wait();
    8000d204:	00009797          	auipc	a5,0x9
    8000d208:	e0c78793          	addi	a5,a5,-500 # 80016010 <_ZN19ConsumerProducerCPP10waitForAllE>
    8000d20c:	0007b783          	ld	a5,0(a5)
    void wait (){ sem_wait(myHandle); }
    8000d210:	0087b503          	ld	a0,8(a5)
    8000d214:	fffff097          	auipc	ra,0xfffff
    8000d218:	014080e7          	jalr	20(ra) # 8000c228 <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    8000d21c:	0014849b          	addiw	s1,s1,1
    8000d220:	fe1ff06f          	j	8000d200 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x3c4>
        delete waitForAll;
    8000d224:	00009797          	auipc	a5,0x9
    8000d228:	dec78793          	addi	a5,a5,-532 # 80016010 <_ZN19ConsumerProducerCPP10waitForAllE>
    8000d22c:	0007b503          	ld	a0,0(a5)
    8000d230:	00050863          	beqz	a0,8000d240 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x404>
    8000d234:	00053783          	ld	a5,0(a0)
    8000d238:	0087b783          	ld	a5,8(a5)
    8000d23c:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    8000d240:	00000493          	li	s1,0
    8000d244:	0080006f          	j	8000d24c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x410>
        for (int i = 0; i < threadNum; i++) {
    8000d248:	0014849b          	addiw	s1,s1,1
    8000d24c:	0334d263          	bge	s1,s3,8000d270 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x434>
            delete producers[i];
    8000d250:	00349793          	slli	a5,s1,0x3
    8000d254:	00fa07b3          	add	a5,s4,a5
    8000d258:	0007b503          	ld	a0,0(a5)
    8000d25c:	fe0506e3          	beqz	a0,8000d248 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x40c>
    8000d260:	00053783          	ld	a5,0(a0)
    8000d264:	0087b783          	ld	a5,8(a5)
    8000d268:	000780e7          	jalr	a5
    8000d26c:	fddff06f          	j	8000d248 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x40c>
        delete consumer;
    8000d270:	000b8a63          	beqz	s7,8000d284 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x448>
    8000d274:	000bb783          	ld	a5,0(s7)
    8000d278:	0087b783          	ld	a5,8(a5)
    8000d27c:	000b8513          	mv	a0,s7
    8000d280:	000780e7          	jalr	a5
        delete buffer;
    8000d284:	000a8e63          	beqz	s5,8000d2a0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x464>
    8000d288:	000a8513          	mv	a0,s5
    8000d28c:	fffff097          	auipc	ra,0xfffff
    8000d290:	7c0080e7          	jalr	1984(ra) # 8000ca4c <_ZN9BufferCPPD1Ev>
    8000d294:	000a8513          	mv	a0,s5
    8000d298:	fffff097          	auipc	ra,0xfffff
    8000d29c:	13c080e7          	jalr	316(ra) # 8000c3d4 <_ZdlPv>
    8000d2a0:	000c0113          	mv	sp,s8
    }
    8000d2a4:	f9040113          	addi	sp,s0,-112
    8000d2a8:	06813083          	ld	ra,104(sp)
    8000d2ac:	06013403          	ld	s0,96(sp)
    8000d2b0:	05813483          	ld	s1,88(sp)
    8000d2b4:	05013903          	ld	s2,80(sp)
    8000d2b8:	04813983          	ld	s3,72(sp)
    8000d2bc:	04013a03          	ld	s4,64(sp)
    8000d2c0:	03813a83          	ld	s5,56(sp)
    8000d2c4:	03013b03          	ld	s6,48(sp)
    8000d2c8:	02813b83          	ld	s7,40(sp)
    8000d2cc:	02013c03          	ld	s8,32(sp)
    8000d2d0:	07010113          	addi	sp,sp,112
    8000d2d4:	00008067          	ret
    8000d2d8:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    8000d2dc:	000a8513          	mv	a0,s5
    8000d2e0:	fffff097          	auipc	ra,0xfffff
    8000d2e4:	0f4080e7          	jalr	244(ra) # 8000c3d4 <_ZdlPv>
    8000d2e8:	00048513          	mv	a0,s1
    8000d2ec:	00008097          	auipc	ra,0x8
    8000d2f0:	25c080e7          	jalr	604(ra) # 80015548 <_Unwind_Resume>
    8000d2f4:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    8000d2f8:	00048513          	mv	a0,s1
    8000d2fc:	fffff097          	auipc	ra,0xfffff
    8000d300:	0d8080e7          	jalr	216(ra) # 8000c3d4 <_ZdlPv>
    8000d304:	00090513          	mv	a0,s2
    8000d308:	00008097          	auipc	ra,0x8
    8000d30c:	240080e7          	jalr	576(ra) # 80015548 <_Unwind_Resume>

000000008000d310 <_Z8userMainv>:
//#include"../../h/syscall_c.h"
//#include"test/printing.hpp"



void userMain() {
    8000d310:	ff010113          	addi	sp,sp,-16
    8000d314:	00113423          	sd	ra,8(sp)
    8000d318:	00813023          	sd	s0,0(sp)
    8000d31c:	01010413          	addi	s0,sp,16

    //NZM? producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //NZM? producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    8000d320:	00000097          	auipc	ra,0x0
    8000d324:	b1c080e7          	jalr	-1252(ra) # 8000ce3c <_ZN19ConsumerProducerCPP20testConsumerProducerEv>
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
}
    8000d328:	00813083          	ld	ra,8(sp)
    8000d32c:	00013403          	ld	s0,0(sp)
    8000d330:	01010113          	addi	sp,sp,16
    8000d334:	00008067          	ret

000000008000d338 <_Z15userMainWrapperPv>:

void userMainWrapper(void*)
{
    8000d338:	ff010113          	addi	sp,sp,-16
    8000d33c:	00113423          	sd	ra,8(sp)
    8000d340:	00813023          	sd	s0,0(sp)
    8000d344:	01010413          	addi	s0,sp,16
    userMain();
    8000d348:	00000097          	auipc	ra,0x0
    8000d34c:	fc8080e7          	jalr	-56(ra) # 8000d310 <_Z8userMainv>
    8000d350:	00813083          	ld	ra,8(sp)
    8000d354:	00013403          	ld	s0,0(sp)
    8000d358:	01010113          	addi	sp,sp,16
    8000d35c:	00008067          	ret

000000008000d360 <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    8000d360:	fd010113          	addi	sp,sp,-48
    8000d364:	02113423          	sd	ra,40(sp)
    8000d368:	02813023          	sd	s0,32(sp)
    8000d36c:	00913c23          	sd	s1,24(sp)
    8000d370:	01213823          	sd	s2,16(sp)
    8000d374:	01313423          	sd	s3,8(sp)
    8000d378:	03010413          	addi	s0,sp,48
    8000d37c:	00050913          	mv	s2,a0
            int i = 0;
    8000d380:	00000993          	li	s3,0
    8000d384:	0100006f          	j	8000d394 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    static void putc (char c){ ::putc(c); }
    8000d388:	00a00513          	li	a0,10
    8000d38c:	fffff097          	auipc	ra,0xfffff
    8000d390:	f80080e7          	jalr	-128(ra) # 8000c30c <putc>
            while (!threadEnd) {
    8000d394:	00009797          	auipc	a5,0x9
    8000d398:	c7478793          	addi	a5,a5,-908 # 80016008 <_ZN19ConsumerProducerCPP9threadEndE>
    8000d39c:	0007a783          	lw	a5,0(a5)
    8000d3a0:	0007879b          	sext.w	a5,a5
    8000d3a4:	02079c63          	bnez	a5,8000d3dc <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    8000d3a8:	01093783          	ld	a5,16(s2)
    8000d3ac:	0087b503          	ld	a0,8(a5)
    8000d3b0:	fffff097          	auipc	ra,0xfffff
    8000d3b4:	568080e7          	jalr	1384(ra) # 8000c918 <_ZN9BufferCPP3getEv>
                i++;
    8000d3b8:	0019849b          	addiw	s1,s3,1
    8000d3bc:	0004899b          	sext.w	s3,s1
    8000d3c0:	0ff57513          	andi	a0,a0,255
    8000d3c4:	fffff097          	auipc	ra,0xfffff
    8000d3c8:	f48080e7          	jalr	-184(ra) # 8000c30c <putc>
                if (i % 80 == 0) {
    8000d3cc:	05000793          	li	a5,80
    8000d3d0:	02f4e4bb          	remw	s1,s1,a5
    8000d3d4:	fc0490e3          	bnez	s1,8000d394 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    8000d3d8:	fb1ff06f          	j	8000d388 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    8000d3dc:	01093783          	ld	a5,16(s2)
    8000d3e0:	0087b503          	ld	a0,8(a5)
    8000d3e4:	fffff097          	auipc	ra,0xfffff
    8000d3e8:	5d0080e7          	jalr	1488(ra) # 8000c9b4 <_ZN9BufferCPP6getCntEv>
    8000d3ec:	02a05263          	blez	a0,8000d410 <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    8000d3f0:	01093783          	ld	a5,16(s2)
    8000d3f4:	0087b503          	ld	a0,8(a5)
    8000d3f8:	fffff097          	auipc	ra,0xfffff
    8000d3fc:	520080e7          	jalr	1312(ra) # 8000c918 <_ZN9BufferCPP3getEv>
    8000d400:	0ff57513          	andi	a0,a0,255
    8000d404:	fffff097          	auipc	ra,0xfffff
    8000d408:	f08080e7          	jalr	-248(ra) # 8000c30c <putc>
    8000d40c:	fd1ff06f          	j	8000d3dc <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    8000d410:	01093783          	ld	a5,16(s2)
    8000d414:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    8000d418:	0087b503          	ld	a0,8(a5)
    8000d41c:	fffff097          	auipc	ra,0xfffff
    8000d420:	e44080e7          	jalr	-444(ra) # 8000c260 <sem_signal>
        }
    8000d424:	02813083          	ld	ra,40(sp)
    8000d428:	02013403          	ld	s0,32(sp)
    8000d42c:	01813483          	ld	s1,24(sp)
    8000d430:	01013903          	ld	s2,16(sp)
    8000d434:	00813983          	ld	s3,8(sp)
    8000d438:	03010113          	addi	sp,sp,48
    8000d43c:	00008067          	ret

000000008000d440 <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    8000d440:	ff010113          	addi	sp,sp,-16
    8000d444:	00113423          	sd	ra,8(sp)
    8000d448:	00813023          	sd	s0,0(sp)
    8000d44c:	01010413          	addi	s0,sp,16
    8000d450:	00002797          	auipc	a5,0x2
    8000d454:	de078793          	addi	a5,a5,-544 # 8000f230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    8000d458:	00f53023          	sd	a5,0(a0)
    8000d45c:	fffff097          	auipc	ra,0xfffff
    8000d460:	fa0080e7          	jalr	-96(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d464:	00813083          	ld	ra,8(sp)
    8000d468:	00013403          	ld	s0,0(sp)
    8000d46c:	01010113          	addi	sp,sp,16
    8000d470:	00008067          	ret

000000008000d474 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    8000d474:	fe010113          	addi	sp,sp,-32
    8000d478:	00113c23          	sd	ra,24(sp)
    8000d47c:	00813823          	sd	s0,16(sp)
    8000d480:	00913423          	sd	s1,8(sp)
    8000d484:	02010413          	addi	s0,sp,32
    8000d488:	00050493          	mv	s1,a0
    8000d48c:	00002797          	auipc	a5,0x2
    8000d490:	da478793          	addi	a5,a5,-604 # 8000f230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    8000d494:	00f53023          	sd	a5,0(a0)
    8000d498:	fffff097          	auipc	ra,0xfffff
    8000d49c:	f64080e7          	jalr	-156(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d4a0:	00048513          	mv	a0,s1
    8000d4a4:	fffff097          	auipc	ra,0xfffff
    8000d4a8:	f30080e7          	jalr	-208(ra) # 8000c3d4 <_ZdlPv>
    8000d4ac:	01813083          	ld	ra,24(sp)
    8000d4b0:	01013403          	ld	s0,16(sp)
    8000d4b4:	00813483          	ld	s1,8(sp)
    8000d4b8:	02010113          	addi	sp,sp,32
    8000d4bc:	00008067          	ret

000000008000d4c0 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    8000d4c0:	ff010113          	addi	sp,sp,-16
    8000d4c4:	00113423          	sd	ra,8(sp)
    8000d4c8:	00813023          	sd	s0,0(sp)
    8000d4cc:	01010413          	addi	s0,sp,16
    8000d4d0:	00002797          	auipc	a5,0x2
    8000d4d4:	d1078793          	addi	a5,a5,-752 # 8000f1e0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    8000d4d8:	00f53023          	sd	a5,0(a0)
    8000d4dc:	fffff097          	auipc	ra,0xfffff
    8000d4e0:	f20080e7          	jalr	-224(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d4e4:	00813083          	ld	ra,8(sp)
    8000d4e8:	00013403          	ld	s0,0(sp)
    8000d4ec:	01010113          	addi	sp,sp,16
    8000d4f0:	00008067          	ret

000000008000d4f4 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    8000d4f4:	fe010113          	addi	sp,sp,-32
    8000d4f8:	00113c23          	sd	ra,24(sp)
    8000d4fc:	00813823          	sd	s0,16(sp)
    8000d500:	00913423          	sd	s1,8(sp)
    8000d504:	02010413          	addi	s0,sp,32
    8000d508:	00050493          	mv	s1,a0
    8000d50c:	00002797          	auipc	a5,0x2
    8000d510:	cd478793          	addi	a5,a5,-812 # 8000f1e0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    8000d514:	00f53023          	sd	a5,0(a0)
    8000d518:	fffff097          	auipc	ra,0xfffff
    8000d51c:	ee4080e7          	jalr	-284(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d520:	00048513          	mv	a0,s1
    8000d524:	fffff097          	auipc	ra,0xfffff
    8000d528:	eb0080e7          	jalr	-336(ra) # 8000c3d4 <_ZdlPv>
    8000d52c:	01813083          	ld	ra,24(sp)
    8000d530:	01013403          	ld	s0,16(sp)
    8000d534:	00813483          	ld	s1,8(sp)
    8000d538:	02010113          	addi	sp,sp,32
    8000d53c:	00008067          	ret

000000008000d540 <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    8000d540:	ff010113          	addi	sp,sp,-16
    8000d544:	00113423          	sd	ra,8(sp)
    8000d548:	00813023          	sd	s0,0(sp)
    8000d54c:	01010413          	addi	s0,sp,16
    8000d550:	00002797          	auipc	a5,0x2
    8000d554:	cb878793          	addi	a5,a5,-840 # 8000f208 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    8000d558:	00f53023          	sd	a5,0(a0)
    8000d55c:	fffff097          	auipc	ra,0xfffff
    8000d560:	ea0080e7          	jalr	-352(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d564:	00813083          	ld	ra,8(sp)
    8000d568:	00013403          	ld	s0,0(sp)
    8000d56c:	01010113          	addi	sp,sp,16
    8000d570:	00008067          	ret

000000008000d574 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    8000d574:	fe010113          	addi	sp,sp,-32
    8000d578:	00113c23          	sd	ra,24(sp)
    8000d57c:	00813823          	sd	s0,16(sp)
    8000d580:	00913423          	sd	s1,8(sp)
    8000d584:	02010413          	addi	s0,sp,32
    8000d588:	00050493          	mv	s1,a0
    8000d58c:	00002797          	auipc	a5,0x2
    8000d590:	c7c78793          	addi	a5,a5,-900 # 8000f208 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    8000d594:	00f53023          	sd	a5,0(a0)
    8000d598:	fffff097          	auipc	ra,0xfffff
    8000d59c:	e64080e7          	jalr	-412(ra) # 8000c3fc <_ZN6ThreadD1Ev>
    8000d5a0:	00048513          	mv	a0,s1
    8000d5a4:	fffff097          	auipc	ra,0xfffff
    8000d5a8:	e30080e7          	jalr	-464(ra) # 8000c3d4 <_ZdlPv>
    8000d5ac:	01813083          	ld	ra,24(sp)
    8000d5b0:	01013403          	ld	s0,16(sp)
    8000d5b4:	00813483          	ld	s1,8(sp)
    8000d5b8:	02010113          	addi	sp,sp,32
    8000d5bc:	00008067          	ret

000000008000d5c0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    8000d5c0:	fe010113          	addi	sp,sp,-32
    8000d5c4:	00113c23          	sd	ra,24(sp)
    8000d5c8:	00813823          	sd	s0,16(sp)
    8000d5cc:	00913423          	sd	s1,8(sp)
    8000d5d0:	02010413          	addi	s0,sp,32
    8000d5d4:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    8000d5d8:	fffff097          	auipc	ra,0xfffff
    8000d5dc:	cf8080e7          	jalr	-776(ra) # 8000c2d0 <getc>
    8000d5e0:	0005059b          	sext.w	a1,a0
    8000d5e4:	01b00793          	li	a5,27
    8000d5e8:	00f58c63          	beq	a1,a5,8000d600 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    8000d5ec:	0104b783          	ld	a5,16(s1)
    8000d5f0:	0087b503          	ld	a0,8(a5)
    8000d5f4:	fffff097          	auipc	ra,0xfffff
    8000d5f8:	284080e7          	jalr	644(ra) # 8000c878 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    8000d5fc:	fddff06f          	j	8000d5d8 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    8000d600:	00100793          	li	a5,1
    8000d604:	00009717          	auipc	a4,0x9
    8000d608:	a0f72223          	sw	a5,-1532(a4) # 80016008 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    8000d60c:	0104b783          	ld	a5,16(s1)
    8000d610:	02100593          	li	a1,33
    8000d614:	0087b503          	ld	a0,8(a5)
    8000d618:	fffff097          	auipc	ra,0xfffff
    8000d61c:	260080e7          	jalr	608(ra) # 8000c878 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    8000d620:	0104b783          	ld	a5,16(s1)
    8000d624:	0107b783          	ld	a5,16(a5)
    8000d628:	0087b503          	ld	a0,8(a5)
    8000d62c:	fffff097          	auipc	ra,0xfffff
    8000d630:	c34080e7          	jalr	-972(ra) # 8000c260 <sem_signal>
        }
    8000d634:	01813083          	ld	ra,24(sp)
    8000d638:	01013403          	ld	s0,16(sp)
    8000d63c:	00813483          	ld	s1,8(sp)
    8000d640:	02010113          	addi	sp,sp,32
    8000d644:	00008067          	ret

000000008000d648 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    8000d648:	fe010113          	addi	sp,sp,-32
    8000d64c:	00113c23          	sd	ra,24(sp)
    8000d650:	00813823          	sd	s0,16(sp)
    8000d654:	00913423          	sd	s1,8(sp)
    8000d658:	01213023          	sd	s2,0(sp)
    8000d65c:	02010413          	addi	s0,sp,32
    8000d660:	00050493          	mv	s1,a0
            int i = 0;
    8000d664:	00000913          	li	s2,0
            while (!threadEnd) {
    8000d668:	00009797          	auipc	a5,0x9
    8000d66c:	9a078793          	addi	a5,a5,-1632 # 80016008 <_ZN19ConsumerProducerCPP9threadEndE>
    8000d670:	0007a783          	lw	a5,0(a5)
    8000d674:	0007879b          	sext.w	a5,a5
    8000d678:	04079263          	bnez	a5,8000d6bc <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    8000d67c:	0104b783          	ld	a5,16(s1)
    8000d680:	0007a583          	lw	a1,0(a5)
    8000d684:	0305859b          	addiw	a1,a1,48
    8000d688:	0087b503          	ld	a0,8(a5)
    8000d68c:	fffff097          	auipc	ra,0xfffff
    8000d690:	1ec080e7          	jalr	492(ra) # 8000c878 <_ZN9BufferCPP3putEi>
                i++;
    8000d694:	0019051b          	addiw	a0,s2,1
    8000d698:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    8000d69c:	0104b783          	ld	a5,16(s1)
    8000d6a0:	0007a783          	lw	a5,0(a5)
    8000d6a4:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    8000d6a8:	00500513          	li	a0,5
    8000d6ac:	02a7e53b          	remw	a0,a5,a0
    8000d6b0:	fffff097          	auipc	ra,0xfffff
    8000d6b4:	be8080e7          	jalr	-1048(ra) # 8000c298 <time_sleep>
    8000d6b8:	fb1ff06f          	j	8000d668 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    8000d6bc:	0104b783          	ld	a5,16(s1)
    8000d6c0:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    8000d6c4:	0087b503          	ld	a0,8(a5)
    8000d6c8:	fffff097          	auipc	ra,0xfffff
    8000d6cc:	b98080e7          	jalr	-1128(ra) # 8000c260 <sem_signal>
        }
    8000d6d0:	01813083          	ld	ra,24(sp)
    8000d6d4:	01013403          	ld	s0,16(sp)
    8000d6d8:	00813483          	ld	s1,8(sp)
    8000d6dc:	00013903          	ld	s2,0(sp)
    8000d6e0:	02010113          	addi	sp,sp,32
    8000d6e4:	00008067          	ret

000000008000d6e8 <_user_text_end>:
	...
