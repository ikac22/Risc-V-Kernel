
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	be813103          	ld	sp,-1048(sp) # 8000abe8 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80001014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff270f>
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
    800010a4:	0000a717          	auipc	a4,0xa
    800010a8:	dec70713          	addi	a4,a4,-532 # 8000ae90 <timer_scratch>
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
    80001140:	0000a717          	auipc	a4,0xa
    80001144:	d5070713          	addi	a4,a4,-688 # 8000ae90 <timer_scratch>
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
    800011a8:	0000a497          	auipc	s1,0xa
    800011ac:	c6048493          	addi	s1,s1,-928 # 8000ae08 <started>
    800011b0:	02050263          	beqz	a0,800011d4 <system_main+0x48>
    800011b4:	0004a783          	lw	a5,0(s1)
    800011b8:	0007879b          	sext.w	a5,a5
    800011bc:	fe078ce3          	beqz	a5,800011b4 <system_main+0x28>
    800011c0:	0ff0000f          	fence
    800011c4:	00008517          	auipc	a0,0x8
    800011c8:	3a450513          	addi	a0,a0,932 # 80009568 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    800011cc:	00001097          	auipc	ra,0x1
    800011d0:	a70080e7          	jalr	-1424(ra) # 80001c3c <panic>
    800011d4:	00001097          	auipc	ra,0x1
    800011d8:	9c4080e7          	jalr	-1596(ra) # 80001b98 <consoleinit>
    800011dc:	00001097          	auipc	ra,0x1
    800011e0:	150080e7          	jalr	336(ra) # 8000232c <printfinit>
    800011e4:	00008517          	auipc	a0,0x8
    800011e8:	0b450513          	addi	a0,a0,180 # 80009298 <CONSOLE_STATUS+0x288>
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	aac080e7          	jalr	-1364(ra) # 80001c98 <__printf>
    800011f4:	00008517          	auipc	a0,0x8
    800011f8:	34450513          	addi	a0,a0,836 # 80009538 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	a9c080e7          	jalr	-1380(ra) # 80001c98 <__printf>
    80001204:	00008517          	auipc	a0,0x8
    80001208:	09450513          	addi	a0,a0,148 # 80009298 <CONSOLE_STATUS+0x288>
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
    8000124c:	00008517          	auipc	a0,0x8
    80001250:	30450513          	addi	a0,a0,772 # 80009550 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x128>
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
    800012a0:	0000b517          	auipc	a0,0xb
    800012a4:	c2050513          	addi	a0,a0,-992 # 8000bec0 <cpus>
    800012a8:	00f50533          	add	a0,a0,a5
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <userinit>:
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    800012c0:	00813403          	ld	s0,8(sp)
    800012c4:	01010113          	addi	sp,sp,16
    800012c8:	00004317          	auipc	t1,0x4
    800012cc:	ed430067          	jr	-300(t1) # 8000519c <main>

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
    8000130c:	00008517          	auipc	a0,0x8
    80001310:	28450513          	addi	a0,a0,644 # 80009590 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x168>
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
    80001354:	00008517          	auipc	a0,0x8
    80001358:	26450513          	addi	a0,a0,612 # 800095b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x190>
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	8e0080e7          	jalr	-1824(ra) # 80001c3c <panic>

0000000080001364 <trapinit>:
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	00008597          	auipc	a1,0x8
    80001378:	26c58593          	addi	a1,a1,620 # 800095e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1b8>
    8000137c:	0000b517          	auipc	a0,0xb
    80001380:	bc450513          	addi	a0,a0,-1084 # 8000bf40 <tickslock>
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
    80001410:	00008517          	auipc	a0,0x8
    80001414:	21850513          	addi	a0,a0,536 # 80009628 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x200>
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	880080e7          	jalr	-1920(ra) # 80001c98 <__printf>
    80001420:	141025f3          	csrr	a1,sepc
    80001424:	14302673          	csrr	a2,stval
    80001428:	00008517          	auipc	a0,0x8
    8000142c:	21050513          	addi	a0,a0,528 # 80009638 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x210>
    80001430:	00001097          	auipc	ra,0x1
    80001434:	868080e7          	jalr	-1944(ra) # 80001c98 <__printf>
    80001438:	00008517          	auipc	a0,0x8
    8000143c:	21850513          	addi	a0,a0,536 # 80009650 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x228>
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
    800014ac:	00008517          	auipc	a0,0x8
    800014b0:	15c50513          	addi	a0,a0,348 # 80009608 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e0>
    800014b4:	00000097          	auipc	ra,0x0
    800014b8:	7e4080e7          	jalr	2020(ra) # 80001c98 <__printf>
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	01813083          	ld	ra,24(sp)
    800014c4:	00048513          	mv	a0,s1
    800014c8:	00813483          	ld	s1,8(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00000317          	auipc	t1,0x0
    800014d4:	3bc30067          	jr	956(t1) # 8000188c <plic_complete>
    800014d8:	0000b517          	auipc	a0,0xb
    800014dc:	a6850513          	addi	a0,a0,-1432 # 8000bf40 <tickslock>
    800014e0:	00001097          	auipc	ra,0x1
    800014e4:	48c080e7          	jalr	1164(ra) # 8000296c <acquire>
    800014e8:	0000a717          	auipc	a4,0xa
    800014ec:	92470713          	addi	a4,a4,-1756 # 8000ae0c <ticks>
    800014f0:	00072783          	lw	a5,0(a4)
    800014f4:	0000b517          	auipc	a0,0xb
    800014f8:	a4c50513          	addi	a0,a0,-1460 # 8000bf40 <tickslock>
    800014fc:	0017879b          	addiw	a5,a5,1
    80001500:	00f72023          	sw	a5,0(a4)
    80001504:	00001097          	auipc	ra,0x1
    80001508:	534080e7          	jalr	1332(ra) # 80002a38 <release>
    8000150c:	f65ff06f          	j	80001470 <kerneltrap+0x8c>
    80001510:	00001097          	auipc	ra,0x1
    80001514:	090080e7          	jalr	144(ra) # 800025a0 <uartintr>
    80001518:	fa5ff06f          	j	800014bc <kerneltrap+0xd8>
    8000151c:	00008517          	auipc	a0,0x8
    80001520:	0cc50513          	addi	a0,a0,204 # 800095e8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1c0>
    80001524:	00000097          	auipc	ra,0x0
    80001528:	718080e7          	jalr	1816(ra) # 80001c3c <panic>

000000008000152c <clockintr>:
    8000152c:	fe010113          	addi	sp,sp,-32
    80001530:	00813823          	sd	s0,16(sp)
    80001534:	00913423          	sd	s1,8(sp)
    80001538:	00113c23          	sd	ra,24(sp)
    8000153c:	02010413          	addi	s0,sp,32
    80001540:	0000b497          	auipc	s1,0xb
    80001544:	a0048493          	addi	s1,s1,-1536 # 8000bf40 <tickslock>
    80001548:	00048513          	mv	a0,s1
    8000154c:	00001097          	auipc	ra,0x1
    80001550:	420080e7          	jalr	1056(ra) # 8000296c <acquire>
    80001554:	0000a717          	auipc	a4,0xa
    80001558:	8b870713          	addi	a4,a4,-1864 # 8000ae0c <ticks>
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
    80001628:	00008517          	auipc	a0,0x8
    8000162c:	fe050513          	addi	a0,a0,-32 # 80009608 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e0>
    80001630:	00000097          	auipc	ra,0x0
    80001634:	668080e7          	jalr	1640(ra) # 80001c98 <__printf>
    80001638:	00048513          	mv	a0,s1
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	250080e7          	jalr	592(ra) # 8000188c <plic_complete>
    80001644:	00100513          	li	a0,1
    80001648:	f7dff06f          	j	800015c4 <devintr+0x40>
    8000164c:	0000b517          	auipc	a0,0xb
    80001650:	8f450513          	addi	a0,a0,-1804 # 8000bf40 <tickslock>
    80001654:	00001097          	auipc	ra,0x1
    80001658:	318080e7          	jalr	792(ra) # 8000296c <acquire>
    8000165c:	00009717          	auipc	a4,0x9
    80001660:	7b070713          	addi	a4,a4,1968 # 8000ae0c <ticks>
    80001664:	00072783          	lw	a5,0(a4)
    80001668:	0000b517          	auipc	a0,0xb
    8000166c:	8d850513          	addi	a0,a0,-1832 # 8000bf40 <tickslock>
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
    800019b8:	0000a497          	auipc	s1,0xa
    800019bc:	5b048493          	addi	s1,s1,1456 # 8000bf68 <cons>
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
    80001b1c:	0000a917          	auipc	s2,0xa
    80001b20:	44c90913          	addi	s2,s2,1100 # 8000bf68 <cons>
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
    80001b7c:	0000a517          	auipc	a0,0xa
    80001b80:	3ec50513          	addi	a0,a0,1004 # 8000bf68 <cons>
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
    80001bac:	0000a497          	auipc	s1,0xa
    80001bb0:	3bc48493          	addi	s1,s1,956 # 8000bf68 <cons>
    80001bb4:	00048513          	mv	a0,s1
    80001bb8:	00008597          	auipc	a1,0x8
    80001bbc:	aa858593          	addi	a1,a1,-1368 # 80009660 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x238>
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
    80001c0c:	0000a317          	auipc	t1,0xa
    80001c10:	41433303          	ld	t1,1044(t1) # 8000c020 <devsw+0x10>
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00030067          	jr	t1

0000000080001c1c <console_write>:
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	00813403          	ld	s0,8(sp)
    80001c2c:	0000a317          	auipc	t1,0xa
    80001c30:	3fc33303          	ld	t1,1020(t1) # 8000c028 <devsw+0x18>
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00030067          	jr	t1

0000000080001c3c <panic>:
    80001c3c:	fe010113          	addi	sp,sp,-32
    80001c40:	00113c23          	sd	ra,24(sp)
    80001c44:	00813823          	sd	s0,16(sp)
    80001c48:	00913423          	sd	s1,8(sp)
    80001c4c:	02010413          	addi	s0,sp,32
    80001c50:	00050493          	mv	s1,a0
    80001c54:	00008517          	auipc	a0,0x8
    80001c58:	a1450513          	addi	a0,a0,-1516 # 80009668 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x240>
    80001c5c:	0000a797          	auipc	a5,0xa
    80001c60:	4607a623          	sw	zero,1132(a5) # 8000c0c8 <pr+0x18>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	034080e7          	jalr	52(ra) # 80001c98 <__printf>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	028080e7          	jalr	40(ra) # 80001c98 <__printf>
    80001c78:	00007517          	auipc	a0,0x7
    80001c7c:	62050513          	addi	a0,a0,1568 # 80009298 <CONSOLE_STATUS+0x288>
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	018080e7          	jalr	24(ra) # 80001c98 <__printf>
    80001c88:	00100793          	li	a5,1
    80001c8c:	00009717          	auipc	a4,0x9
    80001c90:	18f72223          	sw	a5,388(a4) # 8000ae10 <panicked>
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
    80001cd4:	0000a317          	auipc	t1,0xa
    80001cd8:	3dc30313          	addi	t1,t1,988 # 8000c0b0 <pr>
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
    80001d94:	00008d97          	auipc	s11,0x8
    80001d98:	8fcd8d93          	addi	s11,s11,-1796 # 80009690 <digits>
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
    80001f9c:	00007d97          	auipc	s11,0x7
    80001fa0:	6f4d8d93          	addi	s11,s11,1780 # 80009690 <digits>
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
    800020e4:	0000a517          	auipc	a0,0xa
    800020e8:	fcc50513          	addi	a0,a0,-52 # 8000c0b0 <pr>
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
    80002124:	00007d97          	auipc	s11,0x7
    80002128:	56cd8d93          	addi	s11,s11,1388 # 80009690 <digits>
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
    800021c8:	00007d97          	auipc	s11,0x7
    800021cc:	4c8d8d93          	addi	s11,s11,1224 # 80009690 <digits>
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
    80002220:	00007d97          	auipc	s11,0x7
    80002224:	470d8d93          	addi	s11,s11,1136 # 80009690 <digits>
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
    8000226c:	00007c97          	auipc	s9,0x7
    80002270:	404c8c93          	addi	s9,s9,1028 # 80009670 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x248>
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
    8000231c:	00007517          	auipc	a0,0x7
    80002320:	35c50513          	addi	a0,a0,860 # 80009678 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x250>
    80002324:	00000097          	auipc	ra,0x0
    80002328:	918080e7          	jalr	-1768(ra) # 80001c3c <panic>

000000008000232c <printfinit>:
    8000232c:	fe010113          	addi	sp,sp,-32
    80002330:	00813823          	sd	s0,16(sp)
    80002334:	00913423          	sd	s1,8(sp)
    80002338:	00113c23          	sd	ra,24(sp)
    8000233c:	02010413          	addi	s0,sp,32
    80002340:	0000a497          	auipc	s1,0xa
    80002344:	d7048493          	addi	s1,s1,-656 # 8000c0b0 <pr>
    80002348:	00048513          	mv	a0,s1
    8000234c:	00007597          	auipc	a1,0x7
    80002350:	33c58593          	addi	a1,a1,828 # 80009688 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x260>
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
    800023b8:	00009797          	auipc	a5,0x9
    800023bc:	a587a783          	lw	a5,-1448(a5) # 8000ae10 <panicked>
    800023c0:	00078463          	beqz	a5,800023c8 <uartputc+0x10>
    800023c4:	0000006f          	j	800023c4 <uartputc+0xc>
    800023c8:	fd010113          	addi	sp,sp,-48
    800023cc:	02813023          	sd	s0,32(sp)
    800023d0:	00913c23          	sd	s1,24(sp)
    800023d4:	01213823          	sd	s2,16(sp)
    800023d8:	01313423          	sd	s3,8(sp)
    800023dc:	02113423          	sd	ra,40(sp)
    800023e0:	03010413          	addi	s0,sp,48
    800023e4:	00009917          	auipc	s2,0x9
    800023e8:	a3490913          	addi	s2,s2,-1484 # 8000ae18 <uart_tx_r>
    800023ec:	00093783          	ld	a5,0(s2)
    800023f0:	00009497          	auipc	s1,0x9
    800023f4:	a3048493          	addi	s1,s1,-1488 # 8000ae20 <uart_tx_w>
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
    80002440:	0000a597          	auipc	a1,0xa
    80002444:	c9058593          	addi	a1,a1,-880 # 8000c0d0 <uart_tx_buf>
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
    800024bc:	00009717          	auipc	a4,0x9
    800024c0:	95472703          	lw	a4,-1708(a4) # 8000ae10 <panicked>
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
    80002500:	00009617          	auipc	a2,0x9
    80002504:	91860613          	addi	a2,a2,-1768 # 8000ae18 <uart_tx_r>
    80002508:	00009517          	auipc	a0,0x9
    8000250c:	91850513          	addi	a0,a0,-1768 # 8000ae20 <uart_tx_w>
    80002510:	00063783          	ld	a5,0(a2)
    80002514:	00053703          	ld	a4,0(a0)
    80002518:	04f70263          	beq	a4,a5,8000255c <uartstart+0x68>
    8000251c:	100005b7          	lui	a1,0x10000
    80002520:	0000a817          	auipc	a6,0xa
    80002524:	bb080813          	addi	a6,a6,-1104 # 8000c0d0 <uart_tx_buf>
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
    800025e4:	00009617          	auipc	a2,0x9
    800025e8:	83460613          	addi	a2,a2,-1996 # 8000ae18 <uart_tx_r>
    800025ec:	00009517          	auipc	a0,0x9
    800025f0:	83450513          	addi	a0,a0,-1996 # 8000ae20 <uart_tx_w>
    800025f4:	00063783          	ld	a5,0(a2)
    800025f8:	00053703          	ld	a4,0(a0)
    800025fc:	04f70263          	beq	a4,a5,80002640 <uartintr+0xa0>
    80002600:	100005b7          	lui	a1,0x10000
    80002604:	0000a817          	auipc	a6,0xa
    80002608:	acc80813          	addi	a6,a6,-1332 # 8000c0d0 <uart_tx_buf>
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
    80002654:	00008617          	auipc	a2,0x8
    80002658:	7c460613          	addi	a2,a2,1988 # 8000ae18 <uart_tx_r>
    8000265c:	00008517          	auipc	a0,0x8
    80002660:	7c450513          	addi	a0,a0,1988 # 8000ae20 <uart_tx_w>
    80002664:	00063783          	ld	a5,0(a2)
    80002668:	00053703          	ld	a4,0(a0)
    8000266c:	04f70263          	beq	a4,a5,800026b0 <uartintr+0x110>
    80002670:	100005b7          	lui	a1,0x10000
    80002674:	0000a817          	auipc	a6,0xa
    80002678:	a5c80813          	addi	a6,a6,-1444 # 8000c0d0 <uart_tx_buf>
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
    800026c4:	0000b497          	auipc	s1,0xb
    800026c8:	a2b48493          	addi	s1,s1,-1493 # 8000d0ef <end+0xfff>
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
    80002700:	0000aa97          	auipc	s5,0xa
    80002704:	9f0a8a93          	addi	s5,s5,-1552 # 8000c0f0 <end>
    80002708:	0754ec63          	bltu	s1,s5,80002780 <kinit+0xc8>
    8000270c:	0734fa63          	bgeu	s1,s3,80002780 <kinit+0xc8>
    80002710:	00088a37          	lui	s4,0x88
    80002714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002718:	00008917          	auipc	s2,0x8
    8000271c:	71090913          	addi	s2,s2,1808 # 8000ae28 <kmem>
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
    80002780:	00007517          	auipc	a0,0x7
    80002784:	f2850513          	addi	a0,a0,-216 # 800096a8 <digits+0x18>
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
    800027d4:	0000aa97          	auipc	s5,0xa
    800027d8:	91ca8a93          	addi	s5,s5,-1764 # 8000c0f0 <end>
    800027dc:	0954e263          	bltu	s1,s5,80002860 <freerange+0xd0>
    800027e0:	01100993          	li	s3,17
    800027e4:	01b99993          	slli	s3,s3,0x1b
    800027e8:	0734fc63          	bgeu	s1,s3,80002860 <freerange+0xd0>
    800027ec:	00058a13          	mv	s4,a1
    800027f0:	00008917          	auipc	s2,0x8
    800027f4:	63890913          	addi	s2,s2,1592 # 8000ae28 <kmem>
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
    80002860:	00007517          	auipc	a0,0x7
    80002864:	e4850513          	addi	a0,a0,-440 # 800096a8 <digits+0x18>
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
    8000288c:	0000a797          	auipc	a5,0xa
    80002890:	86478793          	addi	a5,a5,-1948 # 8000c0f0 <end>
    80002894:	00050493          	mv	s1,a0
    80002898:	04f56463          	bltu	a0,a5,800028e0 <kfree+0x70>
    8000289c:	01100793          	li	a5,17
    800028a0:	01b79793          	slli	a5,a5,0x1b
    800028a4:	02f57e63          	bgeu	a0,a5,800028e0 <kfree+0x70>
    800028a8:	00001637          	lui	a2,0x1
    800028ac:	00100593          	li	a1,1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	478080e7          	jalr	1144(ra) # 80002d28 <__memset>
    800028b8:	00008797          	auipc	a5,0x8
    800028bc:	57078793          	addi	a5,a5,1392 # 8000ae28 <kmem>
    800028c0:	0007b703          	ld	a4,0(a5)
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00e4b023          	sd	a4,0(s1)
    800028d0:	0097b023          	sd	s1,0(a5)
    800028d4:	00813483          	ld	s1,8(sp)
    800028d8:	02010113          	addi	sp,sp,32
    800028dc:	00008067          	ret
    800028e0:	00007517          	auipc	a0,0x7
    800028e4:	dc850513          	addi	a0,a0,-568 # 800096a8 <digits+0x18>
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	354080e7          	jalr	852(ra) # 80001c3c <panic>

00000000800028f0 <kalloc>:
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00813823          	sd	s0,16(sp)
    800028f8:	00913423          	sd	s1,8(sp)
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	02010413          	addi	s0,sp,32
    80002904:	00008797          	auipc	a5,0x8
    80002908:	52478793          	addi	a5,a5,1316 # 8000ae28 <kmem>
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
    80002a10:	00007517          	auipc	a0,0x7
    80002a14:	ca050513          	addi	a0,a0,-864 # 800096b0 <digits+0x20>
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
    80002a58:	00007517          	auipc	a0,0x7
    80002a5c:	c6050513          	addi	a0,a0,-928 # 800096b8 <digits+0x28>
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
    80002ae0:	00007517          	auipc	a0,0x7
    80002ae4:	bf850513          	addi	a0,a0,-1032 # 800096d8 <digits+0x48>
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	154080e7          	jalr	340(ra) # 80001c3c <panic>
    80002af0:	00007517          	auipc	a0,0x7
    80002af4:	bd050513          	addi	a0,a0,-1072 # 800096c0 <digits+0x30>
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
    80002c1c:	00007517          	auipc	a0,0x7
    80002c20:	abc50513          	addi	a0,a0,-1348 # 800096d8 <digits+0x48>
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	018080e7          	jalr	24(ra) # 80001c3c <panic>
    80002c2c:	00007517          	auipc	a0,0x7
    80002c30:	a9450513          	addi	a0,a0,-1388 # 800096c0 <digits+0x30>
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
    80002d08:	00007517          	auipc	a0,0x7
    80002d0c:	9f850513          	addi	a0,a0,-1544 # 80009700 <digits+0x70>
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	f2c080e7          	jalr	-212(ra) # 80001c3c <panic>
    80002d18:	00007517          	auipc	a0,0x7
    80002d1c:	9c850513          	addi	a0,a0,-1592 # 800096e0 <digits+0x50>
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
    80004080:	0f1000ef          	jal	ra,80004970 <interrupt>

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

0000000080004110 <copy_and_swap>:

.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
    80004110:	100522af          	lr.w	t0,(a0)
bne t0, a1, fail       # Doesn’t match, so fail.
    80004114:	00b29a63          	bne	t0,a1,80004128 <fail>
sc.w t0, a2, (a0)      # Try to update.
    80004118:	18c522af          	sc.w	t0,a2,(a0)
bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000411c:	fe029ae3          	bnez	t0,80004110 <copy_and_swap>
li a0, 0               # Set return to success.
    80004120:	00000513          	li	a0,0
jr ra                  # Return.
    80004124:	00008067          	ret

0000000080004128 <fail>:
fail:
li a0, 1               # Set return to failure.
    80004128:	00100513          	li	a0,1

000000008000412c <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
addi sp, sp, -256
    8000412c:	f0010113          	addi	sp,sp,-256
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80004130:	00313c23          	sd	gp,24(sp)
    80004134:	02413023          	sd	tp,32(sp)
    80004138:	02513423          	sd	t0,40(sp)
    8000413c:	02613823          	sd	t1,48(sp)
    80004140:	02713c23          	sd	t2,56(sp)
    80004144:	04813023          	sd	s0,64(sp)
    80004148:	04913423          	sd	s1,72(sp)
    8000414c:	04a13823          	sd	a0,80(sp)
    80004150:	04b13c23          	sd	a1,88(sp)
    80004154:	06c13023          	sd	a2,96(sp)
    80004158:	06d13423          	sd	a3,104(sp)
    8000415c:	06e13823          	sd	a4,112(sp)
    80004160:	06f13c23          	sd	a5,120(sp)
    80004164:	09013023          	sd	a6,128(sp)
    80004168:	09113423          	sd	a7,136(sp)
    8000416c:	09213823          	sd	s2,144(sp)
    80004170:	09313c23          	sd	s3,152(sp)
    80004174:	0b413023          	sd	s4,160(sp)
    80004178:	0b513423          	sd	s5,168(sp)
    8000417c:	0b613823          	sd	s6,176(sp)
    80004180:	0b713c23          	sd	s7,184(sp)
    80004184:	0d813023          	sd	s8,192(sp)
    80004188:	0d913423          	sd	s9,200(sp)
    8000418c:	0da13823          	sd	s10,208(sp)
    80004190:	0db13c23          	sd	s11,216(sp)
    80004194:	0fc13023          	sd	t3,224(sp)
    80004198:	0fd13423          	sd	t4,232(sp)
    8000419c:	0fe13823          	sd	t5,240(sp)
    800041a0:	0ff13c23          	sd	t6,248(sp)
ret
    800041a4:	00008067          	ret

00000000800041a8 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800041a8:	01813183          	ld	gp,24(sp)
    800041ac:	02013203          	ld	tp,32(sp)
    800041b0:	02813283          	ld	t0,40(sp)
    800041b4:	03013303          	ld	t1,48(sp)
    800041b8:	03813383          	ld	t2,56(sp)
    800041bc:	04013403          	ld	s0,64(sp)
    800041c0:	04813483          	ld	s1,72(sp)
    800041c4:	05013503          	ld	a0,80(sp)
    800041c8:	05813583          	ld	a1,88(sp)
    800041cc:	06013603          	ld	a2,96(sp)
    800041d0:	06813683          	ld	a3,104(sp)
    800041d4:	07013703          	ld	a4,112(sp)
    800041d8:	07813783          	ld	a5,120(sp)
    800041dc:	08013803          	ld	a6,128(sp)
    800041e0:	08813883          	ld	a7,136(sp)
    800041e4:	09013903          	ld	s2,144(sp)
    800041e8:	09813983          	ld	s3,152(sp)
    800041ec:	0a013a03          	ld	s4,160(sp)
    800041f0:	0a813a83          	ld	s5,168(sp)
    800041f4:	0b013b03          	ld	s6,176(sp)
    800041f8:	0b813b83          	ld	s7,184(sp)
    800041fc:	0c013c03          	ld	s8,192(sp)
    80004200:	0c813c83          	ld	s9,200(sp)
    80004204:	0d013d03          	ld	s10,208(sp)
    80004208:	0d813d83          	ld	s11,216(sp)
    8000420c:	0e013e03          	ld	t3,224(sp)
    80004210:	0e813e83          	ld	t4,232(sp)
    80004214:	0f013f03          	ld	t5,240(sp)
    80004218:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    8000421c:	10010113          	addi	sp,sp,256
ret
    80004220:	00008067          	ret

0000000080004224 <KERNEL_TEXT_START>:
    80004224:	4000                	lw	s0,0(s0)
    80004226:	8000                	0x8000
    80004228:	0000                	unimp
	...

000000008000422c <KERNEL_TEXT_END>:
    8000422c:	65c4                	ld	s1,136(a1)
    8000422e:	8000                	0x8000
    80004230:	0000                	unimp
	...

0000000080004234 <USER_TEXT_START>:
    80004234:	7000                	ld	s0,32(s0)
    80004236:	8000                	0x8000
    80004238:	0000                	unimp
	...

000000008000423c <USER_TEXT_END>:
    8000423c:	8524                	0x8524
    8000423e:	8000                	0x8000
    80004240:	0000                	unimp
	...

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

0000000080004258 <_Z13timer_handlerv>:
    IW = 7,

};

void timer_handler()
{
    80004258:	fd010113          	addi	sp,sp,-48
    8000425c:	02113423          	sd	ra,40(sp)
    80004260:	02813023          	sd	s0,32(sp)
    80004264:	00913c23          	sd	s1,24(sp)
    80004268:	01213823          	sd	s2,16(sp)
    8000426c:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80004270:	00002097          	auipc	ra,0x2
    80004274:	818080e7          	jalr	-2024(ra) # 80005a88 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80004278:	00007717          	auipc	a4,0x7
    8000427c:	b6870713          	addi	a4,a4,-1176 # 8000ade0 <_ZN3TCB16timeSliceCounterE>
    80004280:	00073783          	ld	a5,0(a4)
    80004284:	00178793          	addi	a5,a5,1
    80004288:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    8000428c:	00007717          	auipc	a4,0x7
    80004290:	b5c70713          	addi	a4,a4,-1188 # 8000ade8 <_ZN3TCB7runningE>
    80004294:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80004298:	02873703          	ld	a4,40(a4)
    8000429c:	02e7f263          	bgeu	a5,a4,800042c0 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    800042a0:	00200793          	li	a5,2
    800042a4:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    800042a8:	02813083          	ld	ra,40(sp)
    800042ac:	02013403          	ld	s0,32(sp)
    800042b0:	01813483          	ld	s1,24(sp)
    800042b4:	01013903          	ld	s2,16(sp)
    800042b8:	03010113          	addi	sp,sp,48
    800042bc:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800042c0:	100027f3          	csrr	a5,sstatus
    800042c4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800042c8:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800042cc:	141027f3          	csrr	a5,sepc
    800042d0:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    800042d4:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    800042d8:	00007797          	auipc	a5,0x7
    800042dc:	b007b423          	sd	zero,-1272(a5) # 8000ade0 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800042e0:	00002097          	auipc	ra,0x2
    800042e4:	1f8080e7          	jalr	504(ra) # 800064d8 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800042e8:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800042ec:	14149073          	csrw	sepc,s1
    800042f0:	fb1ff06f          	j	800042a0 <_Z13timer_handlerv+0x48>

00000000800042f4 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800042f4:	fb010113          	addi	sp,sp,-80
    800042f8:	04113423          	sd	ra,72(sp)
    800042fc:	04813023          	sd	s0,64(sp)
    80004300:	02913c23          	sd	s1,56(sp)
    80004304:	03213823          	sd	s2,48(sp)
    80004308:	03313423          	sd	s3,40(sp)
    8000430c:	03413023          	sd	s4,32(sp)
    80004310:	01513c23          	sd	s5,24(sp)
    80004314:	01613823          	sd	s6,16(sp)
    80004318:	05010413          	addi	s0,sp,80
    8000431c:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80004320:	141027f3          	csrr	a5,sepc
    80004324:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80004328:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000432c:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80004330:	100027f3          	csrr	a5,sstatus
    80004334:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80004338:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    8000433c:	00100793          	li	a5,1
    80004340:	0ef50663          	beq	a0,a5,8000442c <_Z8usrEcallmmmmm+0x138>
    80004344:	00050493          	mv	s1,a0
    80004348:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    8000434c:	00200793          	li	a5,2
    80004350:	12f50063          	beq	a0,a5,80004470 <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    80004354:	01100793          	li	a5,17
    80004358:	12f50863          	beq	a0,a5,80004488 <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    8000435c:	01200793          	li	a5,18
    80004360:	14f50a63          	beq	a0,a5,800044b4 <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80004364:	01300793          	li	a5,19
    80004368:	16f50863          	beq	a0,a5,800044d8 <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    8000436c:	06900793          	li	a5,105
    80004370:	18f50063          	beq	a0,a5,800044f0 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80004374:	02100793          	li	a5,33
    80004378:	18f50663          	beq	a0,a5,80004504 <_Z8usrEcallmmmmm+0x210>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    8000437c:	02200793          	li	a5,34
    80004380:	1cf50463          	beq	a0,a5,80004548 <_Z8usrEcallmmmmm+0x254>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    80004384:	02300793          	li	a5,35
    80004388:	1cf50863          	beq	a0,a5,80004558 <_Z8usrEcallmmmmm+0x264>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    8000438c:	02400793          	li	a5,36
    80004390:	1ef50863          	beq	a0,a5,80004580 <_Z8usrEcallmmmmm+0x28c>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    80004394:	03100793          	li	a5,49
    80004398:	20f50863          	beq	a0,a5,800045a8 <_Z8usrEcallmmmmm+0x2b4>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    8000439c:	04100793          	li	a5,65
    800043a0:	20f50e63          	beq	a0,a5,800045bc <_Z8usrEcallmmmmm+0x2c8>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800043a4:	04200793          	li	a5,66
    800043a8:	08f51c63          	bne	a0,a5,80004440 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    800043ac:	00007797          	auipc	a5,0x7
    800043b0:	9fc78793          	addi	a5,a5,-1540 # 8000ada8 <_ZN5StdIO7obufferE>
    800043b4:	0007ba83          	ld	s5,0(a5)
    800043b8:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    800043bc:	450a8513          	addi	a0,s5,1104
    800043c0:	00001097          	auipc	ra,0x1
    800043c4:	bd4080e7          	jalr	-1068(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800043c8:	400a8b13          	addi	s6,s5,1024
    800043cc:	000b0513          	mv	a0,s6
    800043d0:	00001097          	auipc	ra,0x1
    800043d4:	bc4080e7          	jalr	-1084(ra) # 80004f94 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    800043d8:	480aa783          	lw	a5,1152(s5)
    800043dc:	0017879b          	addiw	a5,a5,1
    800043e0:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    800043e4:	47caa783          	lw	a5,1148(s5)
    800043e8:	00fa8733          	add	a4,s5,a5
    800043ec:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    800043f0:	0017879b          	addiw	a5,a5,1
    800043f4:	41f7d71b          	sraiw	a4,a5,0x1f
    800043f8:	0167571b          	srliw	a4,a4,0x16
    800043fc:	00e787bb          	addw	a5,a5,a4
    80004400:	3ff7f793          	andi	a5,a5,1023
    80004404:	40e787bb          	subw	a5,a5,a4
    80004408:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    8000440c:	428a8513          	addi	a0,s5,1064
    80004410:	00001097          	auipc	ra,0x1
    80004414:	c08080e7          	jalr	-1016(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80004418:	000b0513          	mv	a0,s6
    8000441c:	00001097          	auipc	ra,0x1
    80004420:	bfc080e7          	jalr	-1028(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80004424:	00048513          	mv	a0,s1
    80004428:	0180006f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    8000442c:	00001097          	auipc	ra,0x1
    80004430:	df8080e7          	jalr	-520(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80004434:	000a0593          	mv	a1,s4
    80004438:	00001097          	auipc	ra,0x1
    8000443c:	e60080e7          	jalr	-416(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80004440:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80004444:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80004448:	04813083          	ld	ra,72(sp)
    8000444c:	04013403          	ld	s0,64(sp)
    80004450:	03813483          	ld	s1,56(sp)
    80004454:	03013903          	ld	s2,48(sp)
    80004458:	02813983          	ld	s3,40(sp)
    8000445c:	02013a03          	ld	s4,32(sp)
    80004460:	01813a83          	ld	s5,24(sp)
    80004464:	01013b03          	ld	s6,16(sp)
    80004468:	05010113          	addi	sp,sp,80
    8000446c:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80004470:	00001097          	auipc	ra,0x1
    80004474:	db4080e7          	jalr	-588(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80004478:	000a0593          	mv	a1,s4
    8000447c:	00001097          	auipc	ra,0x1
    80004480:	fd8080e7          	jalr	-40(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    80004484:	fbdff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80004488:	00070613          	mv	a2,a4
    8000448c:	00068593          	mv	a1,a3
    80004490:	000a8513          	mv	a0,s5
    80004494:	00002097          	auipc	ra,0x2
    80004498:	c90080e7          	jalr	-880(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000449c:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    800044a0:	00050663          	beqz	a0,800044ac <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    800044a4:	00000513          	li	a0,0
    800044a8:	f99ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    800044ac:	ffc00513          	li	a0,-4
    800044b0:	f91ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    800044b4:	00007797          	auipc	a5,0x7
    800044b8:	93478793          	addi	a5,a5,-1740 # 8000ade8 <_ZN3TCB7runningE>
    800044bc:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800044c0:	00200713          	li	a4,2
    800044c4:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    800044c8:	00002097          	auipc	ra,0x2
    800044cc:	f18080e7          	jalr	-232(ra) # 800063e0 <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800044d0:	00048513          	mv	a0,s1
    800044d4:	f6dff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    800044d8:	00007797          	auipc	a5,0x7
    800044dc:	9007b423          	sd	zero,-1784(a5) # 8000ade0 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800044e0:	00002097          	auipc	ra,0x2
    800044e4:	ff8080e7          	jalr	-8(ra) # 800064d8 <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800044e8:	00048513          	mv	a0,s1
    800044ec:	f55ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    800044f0:	00058513          	mv	a0,a1
    800044f4:	00002097          	auipc	ra,0x2
    800044f8:	d84080e7          	jalr	-636(ra) # 80006278 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800044fc:	00048513          	mv	a0,s1
    80004500:	f41ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80004504:	00001097          	auipc	ra,0x1
    80004508:	d20080e7          	jalr	-736(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    8000450c:	00100593          	li	a1,1
    80004510:	00001097          	auipc	ra,0x1
    80004514:	d88080e7          	jalr	-632(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    80004518:	01552423          	sw	s5,8(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    8000451c:	00053823          	sd	zero,16(a0)
    80004520:	00053c23          	sd	zero,24(a0)
    80004524:	02052023          	sw	zero,32(a0)
    {
        next = activeSemaphores;
    80004528:	00007797          	auipc	a5,0x7
    8000452c:	86878793          	addi	a5,a5,-1944 # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    80004530:	0007b703          	ld	a4,0(a5)
    80004534:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80004538:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    8000453c:	00aa3023          	sd	a0,0(s4)
        else ret = 0;
    80004540:	00000513          	li	a0,0
    80004544:	efdff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        ret = KSemaphore::close(t);
    80004548:	00058513          	mv	a0,a1
    8000454c:	00001097          	auipc	ra,0x1
    80004550:	b74080e7          	jalr	-1164(ra) # 800050c0 <_ZN10KSemaphore5closeEPS_>
    80004554:	eedff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80004558:	00058513          	mv	a0,a1
    8000455c:	00001097          	auipc	ra,0x1
    80004560:	c00080e7          	jalr	-1024(ra) # 8000515c <_ZN10KSemaphore6existsEPS_>
    80004564:	00051663          	bnez	a0,80004570 <_Z8usrEcallmmmmm+0x27c>
            ret = -1;
    80004568:	fff00513          	li	a0,-1
    8000456c:	ed5ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    80004570:	000a0513          	mv	a0,s4
    80004574:	00001097          	auipc	ra,0x1
    80004578:	a20080e7          	jalr	-1504(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
    8000457c:	ec5ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80004580:	00058513          	mv	a0,a1
    80004584:	00001097          	auipc	ra,0x1
    80004588:	bd8080e7          	jalr	-1064(ra) # 8000515c <_ZN10KSemaphore6existsEPS_>
    8000458c:	00051663          	bnez	a0,80004598 <_Z8usrEcallmmmmm+0x2a4>
            ret = -1;
    80004590:	fff00513          	li	a0,-1
    80004594:	eadff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    80004598:	000a0513          	mv	a0,s4
    8000459c:	00001097          	auipc	ra,0x1
    800045a0:	a7c080e7          	jalr	-1412(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    800045a4:	e9dff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    800045a8:	00058513          	mv	a0,a1
    800045ac:	00002097          	auipc	ra,0x2
    800045b0:	f64080e7          	jalr	-156(ra) # 80006510 <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800045b4:	00048513          	mv	a0,s1
    800045b8:	e89ff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    800045bc:	00006797          	auipc	a5,0x6
    800045c0:	7f478793          	addi	a5,a5,2036 # 8000adb0 <_ZN5StdIO7ibufferE>
    800045c4:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    800045c8:	428a0513          	addi	a0,s4,1064
    800045cc:	00001097          	auipc	ra,0x1
    800045d0:	9c8080e7          	jalr	-1592(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800045d4:	400a0a93          	addi	s5,s4,1024
    800045d8:	000a8513          	mv	a0,s5
    800045dc:	00001097          	auipc	ra,0x1
    800045e0:	9b8080e7          	jalr	-1608(ra) # 80004f94 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    800045e4:	480a2783          	lw	a5,1152(s4)
    800045e8:	fff7879b          	addiw	a5,a5,-1
    800045ec:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    800045f0:	478a2783          	lw	a5,1144(s4)
    800045f4:	00fa0733          	add	a4,s4,a5
    800045f8:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    800045fc:	0017879b          	addiw	a5,a5,1
    80004600:	41f7d71b          	sraiw	a4,a5,0x1f
    80004604:	0167571b          	srliw	a4,a4,0x16
    80004608:	00e787bb          	addw	a5,a5,a4
    8000460c:	3ff7f793          	andi	a5,a5,1023
    80004610:	40e787bb          	subw	a5,a5,a4
    80004614:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    80004618:	450a0513          	addi	a0,s4,1104
    8000461c:	00001097          	auipc	ra,0x1
    80004620:	9fc080e7          	jalr	-1540(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80004624:	000a8513          	mv	a0,s5
    80004628:	00001097          	auipc	ra,0x1
    8000462c:	9f0080e7          	jalr	-1552(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    80004630:	00048513          	mv	a0,s1
    80004634:	e0dff06f          	j	80004440 <_Z8usrEcallmmmmm+0x14c>

0000000080004638 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80004638:	fb010113          	addi	sp,sp,-80
    8000463c:	04113423          	sd	ra,72(sp)
    80004640:	04813023          	sd	s0,64(sp)
    80004644:	02913c23          	sd	s1,56(sp)
    80004648:	03213823          	sd	s2,48(sp)
    8000464c:	03313423          	sd	s3,40(sp)
    80004650:	03413023          	sd	s4,32(sp)
    80004654:	01513c23          	sd	s5,24(sp)
    80004658:	05010413          	addi	s0,sp,80
    8000465c:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80004660:	141027f3          	csrr	a5,sepc
    80004664:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80004668:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000466c:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80004670:	100027f3          	csrr	a5,sstatus
    80004674:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80004678:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    8000467c:	00100793          	li	a5,1
    80004680:	0ef50663          	beq	a0,a5,8000476c <_Z8sysEcallmmmmm+0x134>
    80004684:	00050493          	mv	s1,a0
    80004688:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    8000468c:	00200793          	li	a5,2
    80004690:	10f50c63          	beq	a0,a5,800047a8 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    80004694:	01100793          	li	a5,17
    80004698:	12f50463          	beq	a0,a5,800047c0 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    8000469c:	01200793          	li	a5,18
    800046a0:	14f50663          	beq	a0,a5,800047ec <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    800046a4:	01300793          	li	a5,19
    800046a8:	16f50663          	beq	a0,a5,80004814 <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    800046ac:	06900793          	li	a5,105
    800046b0:	18f50063          	beq	a0,a5,80004830 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    800046b4:	02100793          	li	a5,33
    800046b8:	18f50663          	beq	a0,a5,80004844 <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    800046bc:	02200793          	li	a5,34
    800046c0:	1cf50463          	beq	a0,a5,80004888 <_Z8sysEcallmmmmm+0x250>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    800046c4:	02300793          	li	a5,35
    800046c8:	1ef50663          	beq	a0,a5,800048b4 <_Z8sysEcallmmmmm+0x27c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    800046cc:	02400793          	li	a5,36
    800046d0:	1ef50c63          	beq	a0,a5,800048c8 <_Z8sysEcallmmmmm+0x290>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    800046d4:	03100793          	li	a5,49
    800046d8:	20f50263          	beq	a0,a5,800048dc <_Z8sysEcallmmmmm+0x2a4>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    800046dc:	04100793          	li	a5,65
    800046e0:	20f50a63          	beq	a0,a5,800048f4 <_Z8sysEcallmmmmm+0x2bc>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800046e4:	04200793          	li	a5,66
    800046e8:	08f51c63          	bne	a0,a5,80004780 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    800046ec:	00006797          	auipc	a5,0x6
    800046f0:	6bc78793          	addi	a5,a5,1724 # 8000ada8 <_ZN5StdIO7obufferE>
    800046f4:	0007ba03          	ld	s4,0(a5)
    800046f8:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    800046fc:	450a0513          	addi	a0,s4,1104
    80004700:	00001097          	auipc	ra,0x1
    80004704:	894080e7          	jalr	-1900(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80004708:	400a0a93          	addi	s5,s4,1024
    8000470c:	000a8513          	mv	a0,s5
    80004710:	00001097          	auipc	ra,0x1
    80004714:	884080e7          	jalr	-1916(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80004718:	480a2783          	lw	a5,1152(s4)
    8000471c:	0017879b          	addiw	a5,a5,1
    80004720:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    80004724:	47ca2783          	lw	a5,1148(s4)
    80004728:	00fa0733          	add	a4,s4,a5
    8000472c:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80004730:	0017879b          	addiw	a5,a5,1
    80004734:	41f7d71b          	sraiw	a4,a5,0x1f
    80004738:	0167571b          	srliw	a4,a4,0x16
    8000473c:	00e787bb          	addw	a5,a5,a4
    80004740:	3ff7f793          	andi	a5,a5,1023
    80004744:	40e787bb          	subw	a5,a5,a4
    80004748:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    8000474c:	428a0513          	addi	a0,s4,1064
    80004750:	00001097          	auipc	ra,0x1
    80004754:	8c8080e7          	jalr	-1848(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80004758:	000a8513          	mv	a0,s5
    8000475c:	00001097          	auipc	ra,0x1
    80004760:	8bc080e7          	jalr	-1860(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80004764:	00048513          	mv	a0,s1
    80004768:	0180006f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    8000476c:	00001097          	auipc	ra,0x1
    80004770:	ab8080e7          	jalr	-1352(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80004774:	00098593          	mv	a1,s3
    80004778:	00001097          	auipc	ra,0x1
    8000477c:	b20080e7          	jalr	-1248(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80004780:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80004784:	04813083          	ld	ra,72(sp)
    80004788:	04013403          	ld	s0,64(sp)
    8000478c:	03813483          	ld	s1,56(sp)
    80004790:	03013903          	ld	s2,48(sp)
    80004794:	02813983          	ld	s3,40(sp)
    80004798:	02013a03          	ld	s4,32(sp)
    8000479c:	01813a83          	ld	s5,24(sp)
    800047a0:	05010113          	addi	sp,sp,80
    800047a4:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    800047a8:	00001097          	auipc	ra,0x1
    800047ac:	a7c080e7          	jalr	-1412(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    800047b0:	00098593          	mv	a1,s3
    800047b4:	00001097          	auipc	ra,0x1
    800047b8:	ca0080e7          	jalr	-864(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    800047bc:	fc5ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800047c0:	00070613          	mv	a2,a4
    800047c4:	00068593          	mv	a1,a3
    800047c8:	000a8513          	mv	a0,s5
    800047cc:	00002097          	auipc	ra,0x2
    800047d0:	958080e7          	jalr	-1704(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800047d4:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    800047d8:	00050663          	beqz	a0,800047e4 <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    800047dc:	00000513          	li	a0,0
    800047e0:	fa1ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    800047e4:	ffc00513          	li	a0,-4
    800047e8:	f99ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    800047ec:	00006797          	auipc	a5,0x6
    800047f0:	5fc78793          	addi	a5,a5,1532 # 8000ade8 <_ZN3TCB7runningE>
    800047f4:	0007b783          	ld	a5,0(a5)
    800047f8:	00200713          	li	a4,2
    800047fc:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80004800:	00002097          	auipc	ra,0x2
    80004804:	be0080e7          	jalr	-1056(ra) # 800063e0 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80004808:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000480c:	00048513          	mv	a0,s1
    80004810:	f71ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    80004814:	00006797          	auipc	a5,0x6
    80004818:	5c07b623          	sd	zero,1484(a5) # 8000ade0 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    8000481c:	00002097          	auipc	ra,0x2
    80004820:	cbc080e7          	jalr	-836(ra) # 800064d8 <_ZN3TCB5yieldEv>
    80004824:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80004828:	00048513          	mv	a0,s1
    8000482c:	f55ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80004830:	00058513          	mv	a0,a1
    80004834:	00002097          	auipc	ra,0x2
    80004838:	a44080e7          	jalr	-1468(ra) # 80006278 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000483c:	00048513          	mv	a0,s1
    80004840:	f41ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
    80004844:	00001097          	auipc	ra,0x1
    80004848:	9e0080e7          	jalr	-1568(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    8000484c:	00100593          	li	a1,1
    80004850:	00001097          	auipc	ra,0x1
    80004854:	a48080e7          	jalr	-1464(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80004858:	01552423          	sw	s5,8(a0)
    8000485c:	00053823          	sd	zero,16(a0)
    80004860:	00053c23          	sd	zero,24(a0)
    80004864:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80004868:	00006797          	auipc	a5,0x6
    8000486c:	52878793          	addi	a5,a5,1320 # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    80004870:	0007b703          	ld	a4,0(a5)
    80004874:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80004878:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    8000487c:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80004880:	00048513          	mv	a0,s1
    80004884:	efdff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        delete t;
    80004888:	ee058ce3          	beqz	a1,80004780 <_Z8sysEcallmmmmm+0x148>
    8000488c:	00058513          	mv	a0,a1
    80004890:	00000097          	auipc	ra,0x0
    80004894:	7dc080e7          	jalr	2012(ra) # 8000506c <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80004898:	00001097          	auipc	ra,0x1
    8000489c:	98c080e7          	jalr	-1652(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    800048a0:	00098593          	mv	a1,s3
    800048a4:	00001097          	auipc	ra,0x1
    800048a8:	bb0080e7          	jalr	-1104(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800048ac:	00048513          	mv	a0,s1
    800048b0:	ed1ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800048b4:	00058513          	mv	a0,a1
    800048b8:	00000097          	auipc	ra,0x0
    800048bc:	6dc080e7          	jalr	1756(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
    800048c0:	100a1073          	csrw	sstatus,s4
    800048c4:	ebdff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    800048c8:	00058513          	mv	a0,a1
    800048cc:	00000097          	auipc	ra,0x0
    800048d0:	74c080e7          	jalr	1868(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800048d4:	00048513          	mv	a0,s1
    800048d8:	ea9ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    800048dc:	00058513          	mv	a0,a1
    800048e0:	00002097          	auipc	ra,0x2
    800048e4:	c30080e7          	jalr	-976(ra) # 80006510 <_ZN3TCB5sleepEm>
    800048e8:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800048ec:	00048513          	mv	a0,s1
    800048f0:	e91ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    800048f4:	00006797          	auipc	a5,0x6
    800048f8:	4bc78793          	addi	a5,a5,1212 # 8000adb0 <_ZN5StdIO7ibufferE>
    800048fc:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    80004900:	42898513          	addi	a0,s3,1064
    80004904:	00000097          	auipc	ra,0x0
    80004908:	690080e7          	jalr	1680(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000490c:	40098a13          	addi	s4,s3,1024
    80004910:	000a0513          	mv	a0,s4
    80004914:	00000097          	auipc	ra,0x0
    80004918:	680080e7          	jalr	1664(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    8000491c:	4809a783          	lw	a5,1152(s3)
    80004920:	fff7879b          	addiw	a5,a5,-1
    80004924:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    80004928:	4789a783          	lw	a5,1144(s3)
    8000492c:	00f98733          	add	a4,s3,a5
    80004930:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80004934:	0017879b          	addiw	a5,a5,1
    80004938:	41f7d71b          	sraiw	a4,a5,0x1f
    8000493c:	0167571b          	srliw	a4,a4,0x16
    80004940:	00e787bb          	addw	a5,a5,a4
    80004944:	3ff7f793          	andi	a5,a5,1023
    80004948:	40e787bb          	subw	a5,a5,a4
    8000494c:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    80004950:	45098513          	addi	a0,s3,1104
    80004954:	00000097          	auipc	ra,0x0
    80004958:	6c4080e7          	jalr	1732(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000495c:	000a0513          	mv	a0,s4
    80004960:	00000097          	auipc	ra,0x0
    80004964:	6b8080e7          	jalr	1720(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    80004968:	00048513          	mv	a0,s1
    8000496c:	e15ff06f          	j	80004780 <_Z8sysEcallmmmmm+0x148>

0000000080004970 <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80004970:	fd010113          	addi	sp,sp,-48
    80004974:	02113423          	sd	ra,40(sp)
    80004978:	02813023          	sd	s0,32(sp)
    8000497c:	00913c23          	sd	s1,24(sp)
    80004980:	01213823          	sd	s2,16(sp)
    80004984:	03010413          	addi	s0,sp,48
    asm volatile("csrr %0, scause" : "=r" (scause));
    80004988:	142027f3          	csrr	a5,scause
    8000498c:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80004990:	fd043483          	ld	s1,-48(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;

    if(scause == IS)
    80004994:	00900793          	li	a5,9
    80004998:	12f48263          	beq	s1,a5,80004abc <interrupt+0x14c>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    8000499c:	00800793          	li	a5,8
    800049a0:	14f48063          	beq	s1,a5,80004ae0 <interrupt+0x170>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    800049a4:	fff00793          	li	a5,-1
    800049a8:	03f79793          	slli	a5,a5,0x3f
    800049ac:	00978793          	addi	a5,a5,9
    800049b0:	14f48063          	beq	s1,a5,80004af0 <interrupt+0x180>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800049b4:	fff00793          	li	a5,-1
    800049b8:	03f79793          	slli	a5,a5,0x3f
    800049bc:	00178793          	addi	a5,a5,1
    800049c0:	12f48e63          	beq	s1,a5,80004afc <interrupt+0x18c>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == II || scause == IR || scause == IW)
    800049c4:	00200793          	li	a5,2
    800049c8:	00f48a63          	beq	s1,a5,800049dc <interrupt+0x6c>
    800049cc:	00500793          	li	a5,5
    800049d0:	00f48663          	beq	s1,a5,800049dc <interrupt+0x6c>
    800049d4:	00700793          	li	a5,7
    800049d8:	0ef49863          	bne	s1,a5,80004ac8 <interrupt+0x158>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    800049dc:	00006797          	auipc	a5,0x6
    800049e0:	40c78793          	addi	a5,a5,1036 # 8000ade8 <_ZN3TCB7runningE>
    800049e4:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    800049e8:	0357c783          	lbu	a5,53(a5)
    800049ec:	10078e63          	beqz	a5,80004b08 <interrupt+0x198>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    800049f0:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    800049f4:	00004517          	auipc	a0,0x4
    800049f8:	62c50513          	addi	a0,a0,1580 # 80009020 <CONSOLE_STATUS+0x10>
    800049fc:	00000097          	auipc	ra,0x0
    80004a00:	1f4080e7          	jalr	500(ra) # 80004bf0 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    80004a04:	00004517          	auipc	a0,0x4
    80004a08:	65450513          	addi	a0,a0,1620 # 80009058 <CONSOLE_STATUS+0x48>
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	1e4080e7          	jalr	484(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004a14:	01000593          	li	a1,16
    80004a18:	00048513          	mv	a0,s1
    80004a1c:	00000097          	auipc	ra,0x0
    80004a20:	21c080e7          	jalr	540(ra) # 80004c38 <_Z9kprintIntmi>
    80004a24:	00005517          	auipc	a0,0x5
    80004a28:	87450513          	addi	a0,a0,-1932 # 80009298 <CONSOLE_STATUS+0x288>
    80004a2c:	00000097          	auipc	ra,0x0
    80004a30:	1c4080e7          	jalr	452(ra) # 80004bf0 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    80004a34:	00004517          	auipc	a0,0x4
    80004a38:	63450513          	addi	a0,a0,1588 # 80009068 <CONSOLE_STATUS+0x58>
    80004a3c:	00000097          	auipc	ra,0x0
    80004a40:	1b4080e7          	jalr	436(ra) # 80004bf0 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80004a44:	141027f3          	csrr	a5,sepc
    80004a48:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80004a4c:	fd843503          	ld	a0,-40(s0)
    80004a50:	01000593          	li	a1,16
    80004a54:	00000097          	auipc	ra,0x0
    80004a58:	1e4080e7          	jalr	484(ra) # 80004c38 <_Z9kprintIntmi>
    80004a5c:	00005517          	auipc	a0,0x5
    80004a60:	83c50513          	addi	a0,a0,-1988 # 80009298 <CONSOLE_STATUS+0x288>
    80004a64:	00000097          	auipc	ra,0x0
    80004a68:	18c080e7          	jalr	396(ra) # 80004bf0 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80004a6c:	00004517          	auipc	a0,0x4
    80004a70:	60450513          	addi	a0,a0,1540 # 80009070 <CONSOLE_STATUS+0x60>
    80004a74:	00000097          	auipc	ra,0x0
    80004a78:	17c080e7          	jalr	380(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004a7c:	01000593          	li	a1,16
    80004a80:	00090513          	mv	a0,s2
    80004a84:	00000097          	auipc	ra,0x0
    80004a88:	1b4080e7          	jalr	436(ra) # 80004c38 <_Z9kprintIntmi>
    80004a8c:	00004517          	auipc	a0,0x4
    80004a90:	5ec50513          	addi	a0,a0,1516 # 80009078 <CONSOLE_STATUS+0x68>
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	15c080e7          	jalr	348(ra) # 80004bf0 <_Z12kprintStringPKc>
            TCB::running->finish();
    80004a9c:	00006797          	auipc	a5,0x6
    80004aa0:	34c78793          	addi	a5,a5,844 # 8000ade8 <_ZN3TCB7runningE>
    80004aa4:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80004aa8:	00200713          	li	a4,2
    80004aac:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    80004ab0:	00002097          	auipc	ra,0x2
    80004ab4:	930080e7          	jalr	-1744(ra) # 800063e0 <_ZN3TCB8dispatchEv>
    80004ab8:	0100006f          	j	80004ac8 <interrupt+0x158>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80004abc:	00000097          	auipc	ra,0x0
    80004ac0:	b7c080e7          	jalr	-1156(ra) # 80004638 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80004ac4:	04a43823          	sd	a0,80(s0)
        }
    }
                    
    
    //print(a4);
    80004ac8:	02813083          	ld	ra,40(sp)
    80004acc:	02013403          	ld	s0,32(sp)
    80004ad0:	01813483          	ld	s1,24(sp)
    80004ad4:	01013903          	ld	s2,16(sp)
    80004ad8:	03010113          	addi	sp,sp,48
    80004adc:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80004ae0:	00000097          	auipc	ra,0x0
    80004ae4:	814080e7          	jalr	-2028(ra) # 800042f4 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80004ae8:	04a43823          	sd	a0,80(s0)
    80004aec:	fddff06f          	j	80004ac8 <interrupt+0x158>
       StdIO::console_handler();
    80004af0:	00001097          	auipc	ra,0x1
    80004af4:	3dc080e7          	jalr	988(ra) # 80005ecc <_ZN5StdIO15console_handlerEv>
    80004af8:	fd1ff06f          	j	80004ac8 <interrupt+0x158>
        timer_handler();      
    80004afc:	fffff097          	auipc	ra,0xfffff
    80004b00:	75c080e7          	jalr	1884(ra) # 80004258 <_Z13timer_handlerv>
    80004b04:	fc5ff06f          	j	80004ac8 <interrupt+0x158>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    80004b08:	00004517          	auipc	a0,0x4
    80004b0c:	57850513          	addi	a0,a0,1400 # 80009080 <CONSOLE_STATUS+0x70>
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	0e0080e7          	jalr	224(ra) # 80004bf0 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    80004b18:	00002097          	auipc	ra,0x2
    80004b1c:	a6c080e7          	jalr	-1428(ra) # 80006584 <_ZN3TCB13panicDispatchEv>
    80004b20:	fa9ff06f          	j	80004ac8 <interrupt+0x158>

0000000080004b24 <_Z15userMainWrapperPv>:
extern "C" uint64 KERNEL_TEXT_END;
extern "C" uint64 USER_TEXT_START;
extern "C" uint64 USER_TEXT_END;

void userMainWrapper(void*)
{
    80004b24:	ff010113          	addi	sp,sp,-16
    80004b28:	00113423          	sd	ra,8(sp)
    80004b2c:	00813023          	sd	s0,0(sp)
    80004b30:	01010413          	addi	s0,sp,16
    userMain();
    80004b34:	00003097          	auipc	ra,0x3
    80004b38:	640080e7          	jalr	1600(ra) # 80008174 <_Z8userMainv>
}
    80004b3c:	00813083          	ld	ra,8(sp)
    80004b40:	00013403          	ld	s0,0(sp)
    80004b44:	01010113          	addi	sp,sp,16
    80004b48:	00008067          	ret

0000000080004b4c <_Z12idleFunctionPv>:

void idleFunction(void*)
{
    80004b4c:	ff010113          	addi	sp,sp,-16
    80004b50:	00113423          	sd	ra,8(sp)
    80004b54:	00813023          	sd	s0,0(sp)
    80004b58:	01010413          	addi	s0,sp,16
    while(1){
        TCB::yield();
    80004b5c:	00002097          	auipc	ra,0x2
    80004b60:	97c080e7          	jalr	-1668(ra) # 800064d8 <_ZN3TCB5yieldEv>
    80004b64:	ff9ff06f          	j	80004b5c <_Z12idleFunctionPv+0x10>

0000000080004b68 <_Z7kmallocm>:
        //thread_dispatch();
    }
}

void* kmalloc(size_t size)
{
    80004b68:	fe010113          	addi	sp,sp,-32
    80004b6c:	00113c23          	sd	ra,24(sp)
    80004b70:	00813823          	sd	s0,16(sp)
    80004b74:	00913423          	sd	s1,8(sp)
    80004b78:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80004b7c:	fff50493          	addi	s1,a0,-1
    80004b80:	0064d493          	srli	s1,s1,0x6
    80004b84:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    80004b88:	00000097          	auipc	ra,0x0
    80004b8c:	69c080e7          	jalr	1692(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80004b90:	00048593          	mv	a1,s1
    80004b94:	00000097          	auipc	ra,0x0
    80004b98:	704080e7          	jalr	1796(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
}
    80004b9c:	01813083          	ld	ra,24(sp)
    80004ba0:	01013403          	ld	s0,16(sp)
    80004ba4:	00813483          	ld	s1,8(sp)
    80004ba8:	02010113          	addi	sp,sp,32
    80004bac:	00008067          	ret

0000000080004bb0 <_Z5kputcc>:

void kputc(char c){
    80004bb0:	ff010113          	addi	sp,sp,-16
    80004bb4:	00813423          	sd	s0,8(sp)
    80004bb8:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    80004bbc:	00004797          	auipc	a5,0x4
    80004bc0:	44c78793          	addi	a5,a5,1100 # 80009008 <CONSOLE_TX_DATA>
    80004bc4:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    80004bc8:	00004797          	auipc	a5,0x4
    80004bcc:	44878793          	addi	a5,a5,1096 # 80009010 <CONSOLE_STATUS>
    80004bd0:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    80004bd4:	00074783          	lbu	a5,0(a4)
    80004bd8:	0207f793          	andi	a5,a5,32
    80004bdc:	fe078ce3          	beqz	a5,80004bd4 <_Z5kputcc+0x24>
    *odata = c;
    80004be0:	00a68023          	sb	a0,0(a3)
}
    80004be4:	00813403          	ld	s0,8(sp)
    80004be8:	01010113          	addi	sp,sp,16
    80004bec:	00008067          	ret

0000000080004bf0 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    80004bf0:	fe010113          	addi	sp,sp,-32
    80004bf4:	00113c23          	sd	ra,24(sp)
    80004bf8:	00813823          	sd	s0,16(sp)
    80004bfc:	00913423          	sd	s1,8(sp)
    80004c00:	02010413          	addi	s0,sp,32
    80004c04:	00050493          	mv	s1,a0
    if(!string) return;
    80004c08:	00050e63          	beqz	a0,80004c24 <_Z12kprintStringPKc+0x34>
    while(*string)
    80004c0c:	0004c503          	lbu	a0,0(s1)
    80004c10:	00050a63          	beqz	a0,80004c24 <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    80004c14:	00000097          	auipc	ra,0x0
    80004c18:	f9c080e7          	jalr	-100(ra) # 80004bb0 <_Z5kputcc>
        string++;
    80004c1c:	00148493          	addi	s1,s1,1
    while(*string)
    80004c20:	fedff06f          	j	80004c0c <_Z12kprintStringPKc+0x1c>
    }
}
    80004c24:	01813083          	ld	ra,24(sp)
    80004c28:	01013403          	ld	s0,16(sp)
    80004c2c:	00813483          	ld	s1,8(sp)
    80004c30:	02010113          	addi	sp,sp,32
    80004c34:	00008067          	ret

0000000080004c38 <_Z9kprintIntmi>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base){
    80004c38:	fd010113          	addi	sp,sp,-48
    80004c3c:	02113423          	sd	ra,40(sp)
    80004c40:	02813023          	sd	s0,32(sp)
    80004c44:	00913c23          	sd	s1,24(sp)
    80004c48:	03010413          	addi	s0,sp,48

    }
    char buf[16];
    int i;

    i = 0;
    80004c4c:	00000793          	li	a5,0
    80004c50:	0080006f          	j	80004c58 <_Z9kprintIntmi+0x20>
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    80004c54:	00070513          	mv	a0,a4
        buf[i++] = kdigits[xx % base];
    80004c58:	02b576b3          	remu	a3,a0,a1
    80004c5c:	0017849b          	addiw	s1,a5,1
    80004c60:	00006717          	auipc	a4,0x6
    80004c64:	f5070713          	addi	a4,a4,-176 # 8000abb0 <kdigits>
    80004c68:	00d70733          	add	a4,a4,a3
    80004c6c:	00074703          	lbu	a4,0(a4)
    80004c70:	fe040693          	addi	a3,s0,-32
    80004c74:	00f687b3          	add	a5,a3,a5
    80004c78:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80004c7c:	02b55733          	divu	a4,a0,a1
        buf[i++] = kdigits[xx % base];
    80004c80:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80004c84:	fcb578e3          	bgeu	a0,a1,80004c54 <_Z9kprintIntmi+0x1c>
    
    while(--i >= 0)
    80004c88:	fff4849b          	addiw	s1,s1,-1
    80004c8c:	0004ce63          	bltz	s1,80004ca8 <_Z9kprintIntmi+0x70>
        kputc(buf[i]);
    80004c90:	fe040793          	addi	a5,s0,-32
    80004c94:	009787b3          	add	a5,a5,s1
    80004c98:	ff07c503          	lbu	a0,-16(a5)
    80004c9c:	00000097          	auipc	ra,0x0
    80004ca0:	f14080e7          	jalr	-236(ra) # 80004bb0 <_Z5kputcc>
    while(--i >= 0)
    80004ca4:	fe5ff06f          	j	80004c88 <_Z9kprintIntmi+0x50>
    80004ca8:	02813083          	ld	ra,40(sp)
    80004cac:	02013403          	ld	s0,32(sp)
    80004cb0:	01813483          	ld	s1,24(sp)
    80004cb4:	03010113          	addi	sp,sp,48
    80004cb8:	00008067          	ret

0000000080004cbc <_Z10kernelInitv>:
{
    80004cbc:	fd010113          	addi	sp,sp,-48
    80004cc0:	02113423          	sd	ra,40(sp)
    80004cc4:	02813023          	sd	s0,32(sp)
    80004cc8:	00913c23          	sd	s1,24(sp)
    80004ccc:	01213823          	sd	s2,16(sp)
    80004cd0:	01313423          	sd	s3,8(sp)
    80004cd4:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    80004cd8:	00004517          	auipc	a0,0x4
    80004cdc:	3e050513          	addi	a0,a0,992 # 800090b8 <CONSOLE_STATUS+0xa8>
    80004ce0:	00000097          	auipc	ra,0x0
    80004ce4:	f10080e7          	jalr	-240(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("HEAP_START_ADDR: "); kprintInt((uint64)HEAP_START_ADDR,16); kprintString("\n");
    80004ce8:	00004517          	auipc	a0,0x4
    80004cec:	40050513          	addi	a0,a0,1024 # 800090e8 <CONSOLE_STATUS+0xd8>
    80004cf0:	00000097          	auipc	ra,0x0
    80004cf4:	f00080e7          	jalr	-256(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004cf8:	01000593          	li	a1,16
    80004cfc:	00006797          	auipc	a5,0x6
    80004d00:	ea478793          	addi	a5,a5,-348 # 8000aba0 <HEAP_START_ADDR>
    80004d04:	0007b503          	ld	a0,0(a5)
    80004d08:	00000097          	auipc	ra,0x0
    80004d0c:	f30080e7          	jalr	-208(ra) # 80004c38 <_Z9kprintIntmi>
    80004d10:	00004517          	auipc	a0,0x4
    80004d14:	58850513          	addi	a0,a0,1416 # 80009298 <CONSOLE_STATUS+0x288>
    80004d18:	00000097          	auipc	ra,0x0
    80004d1c:	ed8080e7          	jalr	-296(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("HEAP_END_ADDR: "); kprintInt((uint64)HEAP_END_ADDR,16); kprintString("\n");
    80004d20:	00004517          	auipc	a0,0x4
    80004d24:	3e050513          	addi	a0,a0,992 # 80009100 <CONSOLE_STATUS+0xf0>
    80004d28:	00000097          	auipc	ra,0x0
    80004d2c:	ec8080e7          	jalr	-312(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004d30:	01000593          	li	a1,16
    80004d34:	00006797          	auipc	a5,0x6
    80004d38:	e6478793          	addi	a5,a5,-412 # 8000ab98 <HEAP_END_ADDR>
    80004d3c:	0007b503          	ld	a0,0(a5)
    80004d40:	00000097          	auipc	ra,0x0
    80004d44:	ef8080e7          	jalr	-264(ra) # 80004c38 <_Z9kprintIntmi>
    80004d48:	00004517          	auipc	a0,0x4
    80004d4c:	55050513          	addi	a0,a0,1360 # 80009298 <CONSOLE_STATUS+0x288>
    80004d50:	00000097          	auipc	ra,0x0
    80004d54:	ea0080e7          	jalr	-352(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("KERNEL_TEXT_START: "); kprintInt(KERNEL_TEXT_START,16); kprintString("\n");
    80004d58:	00004517          	auipc	a0,0x4
    80004d5c:	3b850513          	addi	a0,a0,952 # 80009110 <CONSOLE_STATUS+0x100>
    80004d60:	00000097          	auipc	ra,0x0
    80004d64:	e90080e7          	jalr	-368(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004d68:	01000593          	li	a1,16
    80004d6c:	fffff797          	auipc	a5,0xfffff
    80004d70:	4b878793          	addi	a5,a5,1208 # 80004224 <KERNEL_TEXT_START>
    80004d74:	0007b503          	ld	a0,0(a5)
    80004d78:	00000097          	auipc	ra,0x0
    80004d7c:	ec0080e7          	jalr	-320(ra) # 80004c38 <_Z9kprintIntmi>
    80004d80:	00004517          	auipc	a0,0x4
    80004d84:	51850513          	addi	a0,a0,1304 # 80009298 <CONSOLE_STATUS+0x288>
    80004d88:	00000097          	auipc	ra,0x0
    80004d8c:	e68080e7          	jalr	-408(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("KERNEL_TEXT_END: "); kprintInt(KERNEL_TEXT_END,16); kprintString("\n");
    80004d90:	00004517          	auipc	a0,0x4
    80004d94:	39850513          	addi	a0,a0,920 # 80009128 <CONSOLE_STATUS+0x118>
    80004d98:	00000097          	auipc	ra,0x0
    80004d9c:	e58080e7          	jalr	-424(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004da0:	01000593          	li	a1,16
    80004da4:	fffff797          	auipc	a5,0xfffff
    80004da8:	48878793          	addi	a5,a5,1160 # 8000422c <KERNEL_TEXT_END>
    80004dac:	0007b503          	ld	a0,0(a5)
    80004db0:	00000097          	auipc	ra,0x0
    80004db4:	e88080e7          	jalr	-376(ra) # 80004c38 <_Z9kprintIntmi>
    80004db8:	00004517          	auipc	a0,0x4
    80004dbc:	4e050513          	addi	a0,a0,1248 # 80009298 <CONSOLE_STATUS+0x288>
    80004dc0:	00000097          	auipc	ra,0x0
    80004dc4:	e30080e7          	jalr	-464(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("USER_TEXT_START: "); kprintInt(USER_TEXT_START,16); kprintString("\n");
    80004dc8:	00004517          	auipc	a0,0x4
    80004dcc:	37850513          	addi	a0,a0,888 # 80009140 <CONSOLE_STATUS+0x130>
    80004dd0:	00000097          	auipc	ra,0x0
    80004dd4:	e20080e7          	jalr	-480(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004dd8:	01000593          	li	a1,16
    80004ddc:	fffff797          	auipc	a5,0xfffff
    80004de0:	45878793          	addi	a5,a5,1112 # 80004234 <USER_TEXT_START>
    80004de4:	0007b503          	ld	a0,0(a5)
    80004de8:	00000097          	auipc	ra,0x0
    80004dec:	e50080e7          	jalr	-432(ra) # 80004c38 <_Z9kprintIntmi>
    80004df0:	00004517          	auipc	a0,0x4
    80004df4:	4a850513          	addi	a0,a0,1192 # 80009298 <CONSOLE_STATUS+0x288>
    80004df8:	00000097          	auipc	ra,0x0
    80004dfc:	df8080e7          	jalr	-520(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("USER_TEXT_END: "); kprintInt(USER_TEXT_END,16); kprintString("\n");
    80004e00:	00004517          	auipc	a0,0x4
    80004e04:	35850513          	addi	a0,a0,856 # 80009158 <CONSOLE_STATUS+0x148>
    80004e08:	00000097          	auipc	ra,0x0
    80004e0c:	de8080e7          	jalr	-536(ra) # 80004bf0 <_Z12kprintStringPKc>
    80004e10:	01000593          	li	a1,16
    80004e14:	fffff797          	auipc	a5,0xfffff
    80004e18:	42878793          	addi	a5,a5,1064 # 8000423c <USER_TEXT_END>
    80004e1c:	0007b503          	ld	a0,0(a5)
    80004e20:	00000097          	auipc	ra,0x0
    80004e24:	e18080e7          	jalr	-488(ra) # 80004c38 <_Z9kprintIntmi>
    80004e28:	00004517          	auipc	a0,0x4
    80004e2c:	47050513          	addi	a0,a0,1136 # 80009298 <CONSOLE_STATUS+0x288>
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	dc0080e7          	jalr	-576(ra) # 80004bf0 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec);
    80004e38:	fffff797          	auipc	a5,0xfffff
    80004e3c:	1c878793          	addi	a5,a5,456 # 80004000 <_kernel_text_start>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    80004e40:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80004e44:	00004517          	auipc	a0,0x4
    80004e48:	32450513          	addi	a0,a0,804 # 80009168 <CONSOLE_STATUS+0x158>
    80004e4c:	00000097          	auipc	ra,0x0
    80004e50:	da4080e7          	jalr	-604(ra) # 80004bf0 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance();
    80004e54:	00000097          	auipc	ra,0x0
    80004e58:	3d0080e7          	jalr	976(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    kprintString("MemoryAllocator initalized!\n");
    80004e5c:	00004517          	auipc	a0,0x4
    80004e60:	32450513          	addi	a0,a0,804 # 80009180 <CONSOLE_STATUS+0x170>
    80004e64:	00000097          	auipc	ra,0x0
    80004e68:	d8c080e7          	jalr	-628(ra) # 80004bf0 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80004e6c:	00001097          	auipc	ra,0x1
    80004e70:	b44080e7          	jalr	-1212(ra) # 800059b0 <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80004e74:	00004517          	auipc	a0,0x4
    80004e78:	32c50513          	addi	a0,a0,812 # 800091a0 <CONSOLE_STATUS+0x190>
    80004e7c:	00000097          	auipc	ra,0x0
    80004e80:	d74080e7          	jalr	-652(ra) # 80004bf0 <_Z12kprintStringPKc>
    StdIO::initalize();
    80004e84:	00001097          	auipc	ra,0x1
    80004e88:	e48080e7          	jalr	-440(ra) # 80005ccc <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80004e8c:	00004517          	auipc	a0,0x4
    80004e90:	32c50513          	addi	a0,a0,812 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80004e94:	00000097          	auipc	ra,0x0
    80004e98:	d5c080e7          	jalr	-676(ra) # 80004bf0 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80004e9c:	00001097          	auipc	ra,0x1
    80004ea0:	460080e7          	jalr	1120(ra) # 800062fc <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80004ea4:	00004517          	auipc	a0,0x4
    80004ea8:	32c50513          	addi	a0,a0,812 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80004eac:	00000097          	auipc	ra,0x0
    80004eb0:	d44080e7          	jalr	-700(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80004eb4:	00004517          	auipc	a0,0x4
    80004eb8:	33c50513          	addi	a0,a0,828 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80004ebc:	00000097          	auipc	ra,0x0
    80004ec0:	d34080e7          	jalr	-716(ra) # 80004bf0 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80004ec4:	00001537          	lui	a0,0x1
    80004ec8:	00000097          	auipc	ra,0x0
    80004ecc:	ca0080e7          	jalr	-864(ra) # 80004b68 <_Z7kmallocm>
    80004ed0:	00050493          	mv	s1,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80004ed4:	00050613          	mv	a2,a0
    80004ed8:	00000593          	li	a1,0
    80004edc:	00000517          	auipc	a0,0x0
    80004ee0:	c4850513          	addi	a0,a0,-952 # 80004b24 <_Z15userMainWrapperPv>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	240080e7          	jalr	576(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80004eec:	00050993          	mv	s3,a0
    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80004ef0:	00001537          	lui	a0,0x1
    80004ef4:	00000097          	auipc	ra,0x0
    80004ef8:	c74080e7          	jalr	-908(ra) # 80004b68 <_Z7kmallocm>
    80004efc:	00050913          	mv	s2,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    80004f00:	00050613          	mv	a2,a0
    80004f04:	00000593          	li	a1,0
    80004f08:	00000517          	auipc	a0,0x0
    80004f0c:	c4450513          	addi	a0,a0,-956 # 80004b4c <_Z12idleFunctionPv>
    80004f10:	00001097          	auipc	ra,0x1
    80004f14:	214080e7          	jalr	532(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    void setKernelMode() { userMode = false; }
    80004f18:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80004f1c:	00100793          	li	a5,1
    80004f20:	02f50b23          	sb	a5,54(a0)
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    80004f24:	04048863          	beqz	s1,80004f74 <_Z10kernelInitv+0x2b8>
    80004f28:	04090a63          	beqz	s2,80004f7c <_Z10kernelInitv+0x2c0>
    80004f2c:	04050c63          	beqz	a0,80004f84 <_Z10kernelInitv+0x2c8>
    80004f30:	04098e63          	beqz	s3,80004f8c <_Z10kernelInitv+0x2d0>
        kprintString("Threads successfully initalized!\n");
    80004f34:	00004517          	auipc	a0,0x4
    80004f38:	2ec50513          	addi	a0,a0,748 # 80009220 <CONSOLE_STATUS+0x210>
    80004f3c:	00000097          	auipc	ra,0x0
    80004f40:	cb4080e7          	jalr	-844(ra) # 80004bf0 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80004f44:	00004517          	auipc	a0,0x4
    80004f48:	30450513          	addi	a0,a0,772 # 80009248 <CONSOLE_STATUS+0x238>
    80004f4c:	00000097          	auipc	ra,0x0
    80004f50:	ca4080e7          	jalr	-860(ra) # 80004bf0 <_Z12kprintStringPKc>
    return 0;
    80004f54:	00000513          	li	a0,0
}
    80004f58:	02813083          	ld	ra,40(sp)
    80004f5c:	02013403          	ld	s0,32(sp)
    80004f60:	01813483          	ld	s1,24(sp)
    80004f64:	01013903          	ld	s2,16(sp)
    80004f68:	00813983          	ld	s3,8(sp)
    80004f6c:	03010113          	addi	sp,sp,48
    80004f70:	00008067          	ret
        return -1;
    80004f74:	fff00513          	li	a0,-1
    80004f78:	fe1ff06f          	j	80004f58 <_Z10kernelInitv+0x29c>
    80004f7c:	fff00513          	li	a0,-1
    80004f80:	fd9ff06f          	j	80004f58 <_Z10kernelInitv+0x29c>
    80004f84:	fff00513          	li	a0,-1
    80004f88:	fd1ff06f          	j	80004f58 <_Z10kernelInitv+0x29c>
    80004f8c:	fff00513          	li	a0,-1
    80004f90:	fc9ff06f          	j	80004f58 <_Z10kernelInitv+0x29c>

0000000080004f94 <_ZN10KSemaphore4waitEv>:
#include"../../h/KInclude.hpp"

KSemaphore* KSemaphore::activeSemaphores = nullptr;

int KSemaphore::wait(){
    if(val > 0)
    80004f94:	00852783          	lw	a5,8(a0)
    80004f98:	00078a63          	beqz	a5,80004fac <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    80004f9c:	fff7879b          	addiw	a5,a5,-1
    80004fa0:	00f52423          	sw	a5,8(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80004fa4:	00000513          	li	a0,0
}
    80004fa8:	00008067          	ret
int KSemaphore::wait(){
    80004fac:	fe010113          	addi	sp,sp,-32
    80004fb0:	00113c23          	sd	ra,24(sp)
    80004fb4:	00813823          	sd	s0,16(sp)
    80004fb8:	00913423          	sd	s1,8(sp)
    80004fbc:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    80004fc0:	00006497          	auipc	s1,0x6
    80004fc4:	e2848493          	addi	s1,s1,-472 # 8000ade8 <_ZN3TCB7runningE>
    80004fc8:	0004b583          	ld	a1,0(s1)
    void setState(TCBState s) {state = s;}
    80004fcc:	0205a823          	sw	zero,48(a1)
        blocked.insert(TCB::running);
    80004fd0:	01050513          	addi	a0,a0,16
    80004fd4:	00000097          	auipc	ra,0x0
    80004fd8:	700080e7          	jalr	1792(ra) # 800056d4 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	4fc080e7          	jalr	1276(ra) # 800064d8 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    80004fe4:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    80004fe8:	0307a703          	lw	a4,48(a5)
    80004fec:	02071263          	bnez	a4,80005010 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    80004ff0:	00100713          	li	a4,1
    80004ff4:	02e7a823          	sw	a4,48(a5)
    return 0;
    80004ff8:	00000513          	li	a0,0
}
    80004ffc:	01813083          	ld	ra,24(sp)
    80005000:	01013403          	ld	s0,16(sp)
    80005004:	00813483          	ld	s1,8(sp)
    80005008:	02010113          	addi	sp,sp,32
    8000500c:	00008067          	ret
            return -2;
    80005010:	ffe00513          	li	a0,-2
    80005014:	fe9ff06f          	j	80004ffc <_ZN10KSemaphore4waitEv+0x68>

0000000080005018 <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80005018:	01053783          	ld	a5,16(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    8000501c:	02078e63          	beqz	a5,80005058 <_ZN10KSemaphore6signalEv+0x40>
{
    80005020:	ff010113          	addi	sp,sp,-16
    80005024:	00113423          	sd	ra,8(sp)
    80005028:	00813023          	sd	s0,0(sp)
    8000502c:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80005030:	01050513          	addi	a0,a0,16
    80005034:	00000097          	auipc	ra,0x0
    80005038:	6e0080e7          	jalr	1760(ra) # 80005714 <_ZN8TcbQueue6removeEv>
    8000503c:	00001097          	auipc	ra,0x1
    80005040:	940080e7          	jalr	-1728(ra) # 8000597c <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    80005044:	00000513          	li	a0,0
    80005048:	00813083          	ld	ra,8(sp)
    8000504c:	00013403          	ld	s0,0(sp)
    80005050:	01010113          	addi	sp,sp,16
    80005054:	00008067          	ret
        val++;
    80005058:	00852783          	lw	a5,8(a0)
    8000505c:	0017879b          	addiw	a5,a5,1
    80005060:	00f52423          	sw	a5,8(a0)
}
    80005064:	00000513          	li	a0,0
    80005068:	00008067          	ret

000000008000506c <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    8000506c:	fe010113          	addi	sp,sp,-32
    80005070:	00113c23          	sd	ra,24(sp)
    80005074:	00813823          	sd	s0,16(sp)
    80005078:	00913423          	sd	s1,8(sp)
    8000507c:	02010413          	addi	s0,sp,32
    80005080:	00050493          	mv	s1,a0
    80005084:	0104b783          	ld	a5,16(s1)
{
    while(!blocked.isEmpty()){
    80005088:	02078263          	beqz	a5,800050ac <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    8000508c:	01048513          	addi	a0,s1,16
    80005090:	00000097          	auipc	ra,0x0
    80005094:	684080e7          	jalr	1668(ra) # 80005714 <_ZN8TcbQueue6removeEv>
    80005098:	00100793          	li	a5,1
    8000509c:	02f52823          	sw	a5,48(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    800050a0:	00001097          	auipc	ra,0x1
    800050a4:	8dc080e7          	jalr	-1828(ra) # 8000597c <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    800050a8:	fddff06f          	j	80005084 <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    800050ac:	01813083          	ld	ra,24(sp)
    800050b0:	01013403          	ld	s0,16(sp)
    800050b4:	00813483          	ld	s1,8(sp)
    800050b8:	02010113          	addi	sp,sp,32
    800050bc:	00008067          	ret

00000000800050c0 <_ZN10KSemaphore5closeEPS_>:

int KSemaphore::close(KSemaphore* sem)
{
    800050c0:	fe010113          	addi	sp,sp,-32
    800050c4:	00113c23          	sd	ra,24(sp)
    800050c8:	00813823          	sd	s0,16(sp)
    800050cc:	00913423          	sd	s1,8(sp)
    800050d0:	02010413          	addi	s0,sp,32
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    800050d4:	00006797          	auipc	a5,0x6
    800050d8:	cbc78793          	addi	a5,a5,-836 # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    800050dc:	0007b483          	ld	s1,0(a5)
    800050e0:	00000793          	li	a5,0
    while(cur)
    800050e4:	00048a63          	beqz	s1,800050f8 <_ZN10KSemaphore5closeEPS_+0x38>
    {
        if(cur == sem)
    800050e8:	00a48863          	beq	s1,a0,800050f8 <_ZN10KSemaphore5closeEPS_+0x38>
            break;
        prev = cur;
    800050ec:	00048793          	mv	a5,s1
        cur = cur->next;
    800050f0:	0004b483          	ld	s1,0(s1)
    while(cur)
    800050f4:	ff1ff06f          	j	800050e4 <_ZN10KSemaphore5closeEPS_+0x24>
    }
    if(cur)
    800050f8:	04048e63          	beqz	s1,80005154 <_ZN10KSemaphore5closeEPS_+0x94>
    {
        if(prev)
    800050fc:	04078463          	beqz	a5,80005144 <_ZN10KSemaphore5closeEPS_+0x84>
            prev->next = cur->next;
    80005100:	0004b703          	ld	a4,0(s1)
    80005104:	00e7b023          	sd	a4,0(a5)
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
    80005108:	0004b023          	sd	zero,0(s1)
        delete cur;
    8000510c:	00048513          	mv	a0,s1
    80005110:	00000097          	auipc	ra,0x0
    80005114:	f5c080e7          	jalr	-164(ra) # 8000506c <_ZN10KSemaphoreD1Ev>
    80005118:	00000097          	auipc	ra,0x0
    8000511c:	10c080e7          	jalr	268(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80005120:	00048593          	mv	a1,s1
    80005124:	00000097          	auipc	ra,0x0
    80005128:	330080e7          	jalr	816(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
        return 0;
    8000512c:	00000513          	li	a0,0
    }
    else return -1;

}
    80005130:	01813083          	ld	ra,24(sp)
    80005134:	01013403          	ld	s0,16(sp)
    80005138:	00813483          	ld	s1,8(sp)
    8000513c:	02010113          	addi	sp,sp,32
    80005140:	00008067          	ret
            activeSemaphores = cur->next;
    80005144:	0004b783          	ld	a5,0(s1)
    80005148:	00006717          	auipc	a4,0x6
    8000514c:	c4f73423          	sd	a5,-952(a4) # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    80005150:	fb9ff06f          	j	80005108 <_ZN10KSemaphore5closeEPS_+0x48>
    else return -1;
    80005154:	fff00513          	li	a0,-1
    80005158:	fd9ff06f          	j	80005130 <_ZN10KSemaphore5closeEPS_+0x70>

000000008000515c <_ZN10KSemaphore6existsEPS_>:

bool KSemaphore::exists(KSemaphore* sem)
{
    8000515c:	ff010113          	addi	sp,sp,-16
    80005160:	00813423          	sd	s0,8(sp)
    80005164:	01010413          	addi	s0,sp,16
    KSemaphore* cur = activeSemaphores;
    80005168:	00006797          	auipc	a5,0x6
    8000516c:	c2878793          	addi	a5,a5,-984 # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    80005170:	0007b783          	ld	a5,0(a5)
    while(cur)
    80005174:	00078863          	beqz	a5,80005184 <_ZN10KSemaphore6existsEPS_+0x28>
    {
        if(cur == sem)
    80005178:	00a78e63          	beq	a5,a0,80005194 <_ZN10KSemaphore6existsEPS_+0x38>
            return true;
        cur = cur->next;
    8000517c:	0007b783          	ld	a5,0(a5)
    while(cur)
    80005180:	ff5ff06f          	j	80005174 <_ZN10KSemaphore6existsEPS_+0x18>
    }
    return false;
    80005184:	00000513          	li	a0,0
}
    80005188:	00813403          	ld	s0,8(sp)
    8000518c:	01010113          	addi	sp,sp,16
    80005190:	00008067          	ret
            return true;
    80005194:	00100513          	li	a0,1
    80005198:	ff1ff06f          	j	80005188 <_ZN10KSemaphore6existsEPS_+0x2c>

000000008000519c <main>:
#include"../../h/kernel_lib.h"

int main(){
    8000519c:	fd010113          	addi	sp,sp,-48
    800051a0:	02113423          	sd	ra,40(sp)
    800051a4:	02813023          	sd	s0,32(sp)
    800051a8:	00913c23          	sd	s1,24(sp)
    800051ac:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    800051b0:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    800051b4:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    800051b8:	00001097          	auipc	ra,0x1
    800051bc:	3a4080e7          	jalr	932(ra) # 8000655c <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	afc080e7          	jalr	-1284(ra) # 80004cbc <_Z10kernelInitv>
    if(panic < 0){
    800051c8:	04054263          	bltz	a0,8000520c <main+0x70>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800051cc:	100027f3          	csrr	a5,sstatus
    800051d0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800051d4:	fd843483          	ld	s1,-40(s0)
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    800051d8:	00001097          	auipc	ra,0x1
    800051dc:	300080e7          	jalr	768(ra) # 800064d8 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800051e0:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    800051e4:	00004517          	auipc	a0,0x4
    800051e8:	0bc50513          	addi	a0,a0,188 # 800092a0 <CONSOLE_STATUS+0x290>
    800051ec:	00000097          	auipc	ra,0x0
    800051f0:	a04080e7          	jalr	-1532(ra) # 80004bf0 <_Z12kprintStringPKc>
    return 0;
    800051f4:	00000513          	li	a0,0
    800051f8:	02813083          	ld	ra,40(sp)
    800051fc:	02013403          	ld	s0,32(sp)
    80005200:	01813483          	ld	s1,24(sp)
    80005204:	03010113          	addi	sp,sp,48
    80005208:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    8000520c:	00004517          	auipc	a0,0x4
    80005210:	06c50513          	addi	a0,a0,108 # 80009278 <CONSOLE_STATUS+0x268>
    80005214:	00000097          	auipc	ra,0x0
    80005218:	9dc080e7          	jalr	-1572(ra) # 80004bf0 <_Z12kprintStringPKc>
        return -1;
    8000521c:	fff00513          	li	a0,-1
    80005220:	fd9ff06f          	j	800051f8 <main+0x5c>

0000000080005224 <_ZN15MemoryAllocator11getInstanceEv>:
#include"../../h/memory_allocator.hpp"
#include"../../h/kernel_funs.h"
MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80005224:	ff010113          	addi	sp,sp,-16
    80005228:	00813423          	sd	s0,8(sp)
    8000522c:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80005230:	00006797          	auipc	a5,0x6
    80005234:	c007c783          	lbu	a5,-1024(a5) # 8000ae30 <_ZN15MemoryAllocator9allocatorE>
    80005238:	04079663          	bnez	a5,80005284 <_ZN15MemoryAllocator11getInstanceEv+0x60>
        allocator.fall_head = nullptr;
    8000523c:	00006717          	auipc	a4,0x6
    80005240:	bf470713          	addi	a4,a4,-1036 # 8000ae30 <_ZN15MemoryAllocator9allocatorE>
    80005244:	00073823          	sd	zero,16(a4)
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    80005248:	00006697          	auipc	a3,0x6
    8000524c:	95868693          	addi	a3,a3,-1704 # 8000aba0 <HEAP_START_ADDR>
    80005250:	0006b783          	ld	a5,0(a3)
    80005254:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    80005258:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    8000525c:	00006797          	auipc	a5,0x6
    80005260:	93c78793          	addi	a5,a5,-1732 # 8000ab98 <HEAP_END_ADDR>
    80005264:	0007b783          	ld	a5,0(a5)
    80005268:	0006b683          	ld	a3,0(a3)
    8000526c:	40d787b3          	sub	a5,a5,a3
    80005270:	00873683          	ld	a3,8(a4)
    80005274:	ff078793          	addi	a5,a5,-16
    80005278:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    8000527c:	00100793          	li	a5,1
    80005280:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    80005284:	00006517          	auipc	a0,0x6
    80005288:	bac50513          	addi	a0,a0,-1108 # 8000ae30 <_ZN15MemoryAllocator9allocatorE>
    8000528c:	00813403          	ld	s0,8(sp)
    80005290:	01010113          	addi	sp,sp,16
    80005294:	00008067          	ret

0000000080005298 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    80005298:	ff010113          	addi	sp,sp,-16
    8000529c:	00813423          	sd	s0,8(sp)
    800052a0:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800052a4:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    800052a8:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800052ac:	00000613          	li	a2,0
    800052b0:	00000893          	li	a7,0
    800052b4:	00000713          	li	a4,0
    800052b8:	0140006f          	j	800052cc <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    800052bc:	00060893          	mv	a7,a2
                best = curr;     
    800052c0:	00078713          	mv	a4,a5
            }
        prev = curr;
    800052c4:	00078613          	mv	a2,a5
        curr = curr->next;
    800052c8:	0007b783          	ld	a5,0(a5)
    while(curr){
    800052cc:	02078263          	beqz	a5,800052f0 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    800052d0:	0087b683          	ld	a3,8(a5)
    800052d4:	feb6e8e3          	bltu	a3,a1,800052c4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    800052d8:	fe0702e3          	beqz	a4,800052bc <_ZN15MemoryAllocator9mem_allocEm+0x24>
    800052dc:	00873803          	ld	a6,8(a4)
    800052e0:	ff06f2e3          	bgeu	a3,a6,800052c4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    800052e4:	00060893          	mv	a7,a2
                best = curr;     
    800052e8:	00078713          	mv	a4,a5
    800052ec:	fd9ff06f          	j	800052c4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    800052f0:	02070863          	beqz	a4,80005320 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    800052f4:	00873783          	ld	a5,8(a4)
    800052f8:	40b787b3          	sub	a5,a5,a1
    800052fc:	04f00693          	li	a3,79
    80005300:	02f6ee63          	bltu	a3,a5,8000533c <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(!best_prev) fmem_head = best->next;
    80005304:	02088663          	beqz	a7,80005330 <_ZN15MemoryAllocator9mem_allocEm+0x98>
        else best_prev->next = best->next;
    80005308:	00073783          	ld	a5,0(a4)
    8000530c:	00f8b023          	sd	a5,0(a7)
        curr->size = best->size - size - sizeof(FreeSegment);
        best->size = size;
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    best->next = fall_head;
    80005310:	01053783          	ld	a5,16(a0)
    80005314:	00f73023          	sd	a5,0(a4)
    fall_head = best;
    80005318:	00e53823          	sd	a4,16(a0)
    return (char*)best+sizeof(FreeSegment);
    8000531c:	01070713          	addi	a4,a4,16
}
    80005320:	00070513          	mv	a0,a4
    80005324:	00813403          	ld	s0,8(sp)
    80005328:	01010113          	addi	sp,sp,16
    8000532c:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80005330:	00073783          	ld	a5,0(a4)
    80005334:	00f53423          	sd	a5,8(a0)
    80005338:	fd9ff06f          	j	80005310 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    8000533c:	01058793          	addi	a5,a1,16
    80005340:	00f707b3          	add	a5,a4,a5
        curr->next = best->next;
    80005344:	00073683          	ld	a3,0(a4)
    80005348:	00d7b023          	sd	a3,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    8000534c:	00873683          	ld	a3,8(a4)
    80005350:	40b686b3          	sub	a3,a3,a1
    80005354:	ff068693          	addi	a3,a3,-16
    80005358:	00d7b423          	sd	a3,8(a5)
        best->size = size;
    8000535c:	00b73423          	sd	a1,8(a4)
        if(best_prev) best_prev->next = curr;
    80005360:	00088663          	beqz	a7,8000536c <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80005364:	00f8b023          	sd	a5,0(a7)
    80005368:	fa9ff06f          	j	80005310 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    8000536c:	00f53423          	sd	a5,8(a0)
    80005370:	fa1ff06f          	j	80005310 <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080005374 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    80005374:	ff010113          	addi	sp,sp,-16
    80005378:	00813423          	sd	s0,8(sp)
    8000537c:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80005380:	00006797          	auipc	a5,0x6
    80005384:	82078793          	addi	a5,a5,-2016 # 8000aba0 <HEAP_START_ADDR>
    80005388:	0007b783          	ld	a5,0(a5)
    8000538c:	04f5ee63          	bltu	a1,a5,800053e8 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80005390:	00006797          	auipc	a5,0x6
    80005394:	80878793          	addi	a5,a5,-2040 # 8000ab98 <HEAP_END_ADDR>
    80005398:	0007b783          	ld	a5,0(a5)
    8000539c:	04f5fe63          	bgeu	a1,a5,800053f8 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    800053a0:	01053783          	ld	a5,16(a0)
    800053a4:	00000693          	li	a3,0
    while(cur)
    800053a8:	00078c63          	beqz	a5,800053c0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        if(t == (size_t)cur+sizeof(FreeSegment))
    800053ac:	01078713          	addi	a4,a5,16
    800053b0:	00b70863          	beq	a4,a1,800053c0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;
        prev = cur;
    800053b4:	00078693          	mv	a3,a5
        cur = cur->next;
    800053b8:	0007b783          	ld	a5,0(a5)
    while(cur)
    800053bc:	fedff06f          	j	800053a8 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    800053c0:	04078063          	beqz	a5,80005400 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    800053c4:	00068c63          	beqz	a3,800053dc <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    800053c8:	0007b703          	ld	a4,0(a5)
    800053cc:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    800053d0:	0007b023          	sd	zero,0(a5)
        return false;
    800053d4:	00000513          	li	a0,0
    800053d8:	0140006f          	j	800053ec <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    800053dc:	0007b703          	ld	a4,0(a5)
    800053e0:	00e53823          	sd	a4,16(a0)
    800053e4:	fedff06f          	j	800053d0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    800053e8:	00100513          	li	a0,1
    }
    else return true;
}
    800053ec:	00813403          	ld	s0,8(sp)
    800053f0:	01010113          	addi	sp,sp,16
    800053f4:	00008067          	ret
        return true;
    800053f8:	00100513          	li	a0,1
    800053fc:	ff1ff06f          	j	800053ec <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    80005400:	00100513          	li	a0,1
    80005404:	fe9ff06f          	j	800053ec <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

0000000080005408 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    80005408:	ff010113          	addi	sp,sp,-16
    8000540c:	00813423          	sd	s0,8(sp)
    80005410:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80005414:	0085b703          	ld	a4,8(a1)
    80005418:	01070793          	addi	a5,a4,16
    8000541c:	00f587b3          	add	a5,a1,a5
    80005420:	0005b503          	ld	a0,0(a1)
    80005424:	00a78863          	beq	a5,a0,80005434 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    80005428:	00813403          	ld	s0,8(sp)
    8000542c:	01010113          	addi	sp,sp,16
    80005430:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80005434:	00853783          	ld	a5,8(a0)
    80005438:	00f70733          	add	a4,a4,a5
    8000543c:	01070713          	addi	a4,a4,16
    80005440:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    80005444:	00053783          	ld	a5,0(a0)
    80005448:	00f5b023          	sd	a5,0(a1)
        return t;
    8000544c:	00058513          	mv	a0,a1
    80005450:	fd9ff06f          	j	80005428 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

0000000080005454 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80005454:	fd010113          	addi	sp,sp,-48
    80005458:	02113423          	sd	ra,40(sp)
    8000545c:	02813023          	sd	s0,32(sp)
    80005460:	00913c23          	sd	s1,24(sp)
    80005464:	01213823          	sd	s2,16(sp)
    80005468:	01313423          	sd	s3,8(sp)
    8000546c:	01413023          	sd	s4,0(sp)
    80005470:	03010413          	addi	s0,sp,48
    80005474:	00050993          	mv	s3,a0
    80005478:	00058913          	mv	s2,a1
    if(wantToFreeAddress(adr)) return -1;
    8000547c:	00000097          	auipc	ra,0x0
    80005480:	ef8080e7          	jalr	-264(ra) # 80005374 <_ZN15MemoryAllocator17wantToFreeAddressEPv>
    80005484:	0a051063          	bnez	a0,80005524 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    80005488:	0089b783          	ld	a5,8(s3)
    8000548c:	00078863          	beqz	a5,8000549c <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80005490:	ff090a13          	addi	s4,s2,-16
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80005494:	00000493          	li	s1,0
    80005498:	01c0006f          	j	800054b4 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    8000549c:	ff090913          	addi	s2,s2,-16
    800054a0:	0129b423          	sd	s2,8(s3)
    800054a4:	0540006f          	j	800054f8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    800054a8:	00f96e63          	bltu	s2,a5,800054c4 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    800054ac:	00078493          	mv	s1,a5
    800054b0:	0007b783          	ld	a5,0(a5)
    800054b4:	00078863          	beqz	a5,800054c4 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    800054b8:	fe0488e3          	beqz	s1,800054a8 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800054bc:	ff24f8e3          	bgeu	s1,s2,800054ac <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800054c0:	fe9ff06f          	j	800054a8 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        newsgm->next = cur;
    800054c4:	fef93823          	sd	a5,-16(s2)
        if(cur)
    800054c8:	00078a63          	beqz	a5,800054dc <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    800054cc:	000a0593          	mv	a1,s4
    800054d0:	00098513          	mv	a0,s3
    800054d4:	00000097          	auipc	ra,0x0
    800054d8:	f34080e7          	jalr	-204(ra) # 80005408 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    800054dc:	02048e63          	beqz	s1,80005518 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    800054e0:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    800054e4:	00048593          	mv	a1,s1
    800054e8:	00098513          	mv	a0,s3
    800054ec:	00000097          	auipc	ra,0x0
    800054f0:	f1c080e7          	jalr	-228(ra) # 80005408 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    800054f4:	00000513          	li	a0,0
}
    800054f8:	02813083          	ld	ra,40(sp)
    800054fc:	02013403          	ld	s0,32(sp)
    80005500:	01813483          	ld	s1,24(sp)
    80005504:	01013903          	ld	s2,16(sp)
    80005508:	00813983          	ld	s3,8(sp)
    8000550c:	00013a03          	ld	s4,0(sp)
    80005510:	03010113          	addi	sp,sp,48
    80005514:	00008067          	ret
            fmem_head = newsgm;
    80005518:	0149b423          	sd	s4,8(s3)
    return 0;
    8000551c:	00000513          	li	a0,0
    80005520:	fd9ff06f          	j	800054f8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(wantToFreeAddress(adr)) return -1;
    80005524:	fff00513          	li	a0,-1
    80005528:	fd1ff06f          	j	800054f8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

000000008000552c <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    8000552c:	fe010113          	addi	sp,sp,-32
    80005530:	00113c23          	sd	ra,24(sp)
    80005534:	00813823          	sd	s0,16(sp)
    80005538:	00913423          	sd	s1,8(sp)
    8000553c:	02010413          	addi	s0,sp,32
    80005540:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    80005544:	00004517          	auipc	a0,0x4
    80005548:	d7c50513          	addi	a0,a0,-644 # 800092c0 <CONSOLE_STATUS+0x2b0>
    8000554c:	fffff097          	auipc	ra,0xfffff
    80005550:	6a4080e7          	jalr	1700(ra) # 80004bf0 <_Z12kprintStringPKc>
    if(!fmem_head)
    80005554:	0084b783          	ld	a5,8(s1)
    80005558:	04078a63          	beqz	a5,800055ac <_ZN15MemoryAllocator10print_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    8000555c:	0084b483          	ld	s1,8(s1)
    80005560:	06048063          	beqz	s1,800055c0 <_ZN15MemoryAllocator10print_listEv+0x94>
        kprintInt((uint64)curr);
    80005564:	00a00593          	li	a1,10
    80005568:	00048513          	mv	a0,s1
    8000556c:	fffff097          	auipc	ra,0xfffff
    80005570:	6cc080e7          	jalr	1740(ra) # 80004c38 <_Z9kprintIntmi>
        kprintString("\n");
    80005574:	00004517          	auipc	a0,0x4
    80005578:	d2450513          	addi	a0,a0,-732 # 80009298 <CONSOLE_STATUS+0x288>
    8000557c:	fffff097          	auipc	ra,0xfffff
    80005580:	674080e7          	jalr	1652(ra) # 80004bf0 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80005584:	00a00593          	li	a1,10
    80005588:	0084b503          	ld	a0,8(s1)
    8000558c:	fffff097          	auipc	ra,0xfffff
    80005590:	6ac080e7          	jalr	1708(ra) # 80004c38 <_Z9kprintIntmi>
        kprintString("\n");
    80005594:	00004517          	auipc	a0,0x4
    80005598:	d0450513          	addi	a0,a0,-764 # 80009298 <CONSOLE_STATUS+0x288>
    8000559c:	fffff097          	auipc	ra,0xfffff
    800055a0:	654080e7          	jalr	1620(ra) # 80004bf0 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    800055a4:	0004b483          	ld	s1,0(s1)
    800055a8:	fb9ff06f          	j	80005560 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    800055ac:	00004517          	auipc	a0,0x4
    800055b0:	d3450513          	addi	a0,a0,-716 # 800092e0 <CONSOLE_STATUS+0x2d0>
    800055b4:	fffff097          	auipc	ra,0xfffff
    800055b8:	63c080e7          	jalr	1596(ra) # 80004bf0 <_Z12kprintStringPKc>
    800055bc:	fa1ff06f          	j	8000555c <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    800055c0:	00004517          	auipc	a0,0x4
    800055c4:	d3850513          	addi	a0,a0,-712 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800055c8:	fffff097          	auipc	ra,0xfffff
    800055cc:	628080e7          	jalr	1576(ra) # 80004bf0 <_Z12kprintStringPKc>
}
    800055d0:	01813083          	ld	ra,24(sp)
    800055d4:	01013403          	ld	s0,16(sp)
    800055d8:	00813483          	ld	s1,8(sp)
    800055dc:	02010113          	addi	sp,sp,32
    800055e0:	00008067          	ret

00000000800055e4 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    800055e4:	fe010113          	addi	sp,sp,-32
    800055e8:	00113c23          	sd	ra,24(sp)
    800055ec:	00813823          	sd	s0,16(sp)
    800055f0:	00913423          	sd	s1,8(sp)
    800055f4:	02010413          	addi	s0,sp,32
    800055f8:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    800055fc:	00004517          	auipc	a0,0x4
    80005600:	d1c50513          	addi	a0,a0,-740 # 80009318 <CONSOLE_STATUS+0x308>
    80005604:	fffff097          	auipc	ra,0xfffff
    80005608:	5ec080e7          	jalr	1516(ra) # 80004bf0 <_Z12kprintStringPKc>
    if(!fall_head)
    8000560c:	0104b783          	ld	a5,16(s1)
    80005610:	04078a63          	beqz	a5,80005664 <_ZN15MemoryAllocator14print_all_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80005614:	0104b483          	ld	s1,16(s1)
    80005618:	06048063          	beqz	s1,80005678 <_ZN15MemoryAllocator14print_all_listEv+0x94>
        kprintInt((uint64)curr);
    8000561c:	00a00593          	li	a1,10
    80005620:	00048513          	mv	a0,s1
    80005624:	fffff097          	auipc	ra,0xfffff
    80005628:	614080e7          	jalr	1556(ra) # 80004c38 <_Z9kprintIntmi>
        kprintString("\n");
    8000562c:	00004517          	auipc	a0,0x4
    80005630:	c6c50513          	addi	a0,a0,-916 # 80009298 <CONSOLE_STATUS+0x288>
    80005634:	fffff097          	auipc	ra,0xfffff
    80005638:	5bc080e7          	jalr	1468(ra) # 80004bf0 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    8000563c:	00a00593          	li	a1,10
    80005640:	0084b503          	ld	a0,8(s1)
    80005644:	fffff097          	auipc	ra,0xfffff
    80005648:	5f4080e7          	jalr	1524(ra) # 80004c38 <_Z9kprintIntmi>
        kprintString("\n");
    8000564c:	00004517          	auipc	a0,0x4
    80005650:	c4c50513          	addi	a0,a0,-948 # 80009298 <CONSOLE_STATUS+0x288>
    80005654:	fffff097          	auipc	ra,0xfffff
    80005658:	59c080e7          	jalr	1436(ra) # 80004bf0 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    8000565c:	0004b483          	ld	s1,0(s1)
    80005660:	fb9ff06f          	j	80005618 <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80005664:	00004517          	auipc	a0,0x4
    80005668:	c7c50513          	addi	a0,a0,-900 # 800092e0 <CONSOLE_STATUS+0x2d0>
    8000566c:	fffff097          	auipc	ra,0xfffff
    80005670:	584080e7          	jalr	1412(ra) # 80004bf0 <_Z12kprintStringPKc>
    80005674:	fa1ff06f          	j	80005614 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80005678:	00004517          	auipc	a0,0x4
    8000567c:	c8050513          	addi	a0,a0,-896 # 800092f8 <CONSOLE_STATUS+0x2e8>
    80005680:	fffff097          	auipc	ra,0xfffff
    80005684:	570080e7          	jalr	1392(ra) # 80004bf0 <_Z12kprintStringPKc>
    80005688:	01813083          	ld	ra,24(sp)
    8000568c:	01013403          	ld	s0,16(sp)
    80005690:	00813483          	ld	s1,8(sp)
    80005694:	02010113          	addi	sp,sp,32
    80005698:	00008067          	ret

000000008000569c <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../h/ptr_queue.hpp"
#include"../../h/kernel_funs.h"
#include"../../h/tcb.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    8000569c:	ff010113          	addi	sp,sp,-16
    800056a0:	00813423          	sd	s0,8(sp)
    800056a4:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    800056a8:	00053783          	ld	a5,0(a0)
    800056ac:	00078863          	beqz	a5,800056bc <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    800056b0:	00b78e63          	beq	a5,a1,800056cc <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    800056b4:	0007b783          	ld	a5,0(a5)
    800056b8:	ff5ff06f          	j	800056ac <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    800056bc:	00000513          	li	a0,0
}
    800056c0:	00813403          	ld	s0,8(sp)
    800056c4:	01010113          	addi	sp,sp,16
    800056c8:	00008067          	ret
            return true;
    800056cc:	00100513          	li	a0,1
    800056d0:	ff1ff06f          	j	800056c0 <_ZNK8TcbQueue6existsEP3TCB+0x24>

00000000800056d4 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    800056d4:	ff010113          	addi	sp,sp,-16
    800056d8:	00813423          	sd	s0,8(sp)
    800056dc:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    800056e0:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    800056e4:	00853783          	ld	a5,8(a0)
    800056e8:	02078263          	beqz	a5,8000570c <_ZN8TcbQueue6insertEP3TCB+0x38>
    800056ec:	00b7b023          	sd	a1,0(a5)
    800056f0:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    800056f4:	01052783          	lw	a5,16(a0)
    800056f8:	0017879b          	addiw	a5,a5,1
    800056fc:	00f52823          	sw	a5,16(a0)
    return *this;
}
    80005700:	00813403          	ld	s0,8(sp)
    80005704:	01010113          	addi	sp,sp,16
    80005708:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    8000570c:	00b53023          	sd	a1,0(a0)
    80005710:	fe1ff06f          	j	800056f0 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080005714 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80005714:	ff010113          	addi	sp,sp,-16
    80005718:	00813423          	sd	s0,8(sp)
    8000571c:	01010413          	addi	s0,sp,16
    80005720:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80005724:	00053503          	ld	a0,0(a0)
    80005728:	02050263          	beqz	a0,8000574c <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    8000572c:	0087b703          	ld	a4,8(a5)
    80005730:	02e50463          	beq	a0,a4,80005758 <_ZN8TcbQueue6removeEv+0x44>
    80005734:	00053703          	ld	a4,0(a0)
    80005738:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    8000573c:	00053023          	sd	zero,0(a0)
        tmpNum--;
    80005740:	0107a703          	lw	a4,16(a5)
    80005744:	fff7071b          	addiw	a4,a4,-1
    80005748:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    8000574c:	00813403          	ld	s0,8(sp)
    80005750:	01010113          	addi	sp,sp,16
    80005754:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    80005758:	0007b423          	sd	zero,8(a5)
    8000575c:	00000713          	li	a4,0
    80005760:	fd9ff06f          	j	80005738 <_ZN8TcbQueue6removeEv+0x24>

0000000080005764 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80005764:	ff010113          	addi	sp,sp,-16
    80005768:	00813423          	sd	s0,8(sp)
    8000576c:	01010413          	addi	s0,sp,16
    return head;
}
    80005770:	00053503          	ld	a0,0(a0)
    80005774:	00813403          	ld	s0,8(sp)
    80005778:	01010113          	addi	sp,sp,16
    8000577c:	00008067          	ret

0000000080005780 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    80005780:	fe010113          	addi	sp,sp,-32
    80005784:	00113c23          	sd	ra,24(sp)
    80005788:	00813823          	sd	s0,16(sp)
    8000578c:	00913423          	sd	s1,8(sp)
    80005790:	02010413          	addi	s0,sp,32
    TCB* t = head;
    80005794:	00053483          	ld	s1,0(a0)
    while(t){
    80005798:	02048e63          	beqz	s1,800057d4 <_ZN8TcbQueue10printQueueEv+0x54>
        kprintString("-> ");
    8000579c:	00004517          	auipc	a0,0x4
    800057a0:	ba450513          	addi	a0,a0,-1116 # 80009340 <CONSOLE_STATUS+0x330>
    800057a4:	fffff097          	auipc	ra,0xfffff
    800057a8:	44c080e7          	jalr	1100(ra) # 80004bf0 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    800057ac:	00a00593          	li	a1,10
    800057b0:	00048513          	mv	a0,s1
    800057b4:	fffff097          	auipc	ra,0xfffff
    800057b8:	484080e7          	jalr	1156(ra) # 80004c38 <_Z9kprintIntmi>
        kprintString("\n");
    800057bc:	00004517          	auipc	a0,0x4
    800057c0:	adc50513          	addi	a0,a0,-1316 # 80009298 <CONSOLE_STATUS+0x288>
    800057c4:	fffff097          	auipc	ra,0xfffff
    800057c8:	42c080e7          	jalr	1068(ra) # 80004bf0 <_Z12kprintStringPKc>
        t = t->next;            
    800057cc:	0004b483          	ld	s1,0(s1)
    while(t){
    800057d0:	fc9ff06f          	j	80005798 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    800057d4:	00004517          	auipc	a0,0x4
    800057d8:	ac450513          	addi	a0,a0,-1340 # 80009298 <CONSOLE_STATUS+0x288>
    800057dc:	fffff097          	auipc	ra,0xfffff
    800057e0:	414080e7          	jalr	1044(ra) # 80004bf0 <_Z12kprintStringPKc>
}
    800057e4:	01813083          	ld	ra,24(sp)
    800057e8:	01013403          	ld	s0,16(sp)
    800057ec:	00813483          	ld	s1,8(sp)
    800057f0:	02010113          	addi	sp,sp,32
    800057f4:	00008067          	ret

00000000800057f8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    800057f8:	fc010113          	addi	sp,sp,-64
    800057fc:	02113c23          	sd	ra,56(sp)
    80005800:	02813823          	sd	s0,48(sp)
    80005804:	02913423          	sd	s1,40(sp)
    80005808:	03213023          	sd	s2,32(sp)
    8000580c:	01313c23          	sd	s3,24(sp)
    80005810:	01413823          	sd	s4,16(sp)
    80005814:	01513423          	sd	s5,8(sp)
    80005818:	04010413          	addi	s0,sp,64
    8000581c:	00050a93          	mv	s5,a0
    80005820:	00058913          	mv	s2,a1
    80005824:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80005828:	00053483          	ld	s1,0(a0)
    8000582c:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80005830:	02048063          	beqz	s1,80005850 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80005834:	00048593          	mv	a1,s1
    80005838:	00090513          	mv	a0,s2
    8000583c:	000a00e7          	jalr	s4
    80005840:	00054863          	bltz	a0,80005850 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80005844:	00048993          	mv	s3,s1
        cur = cur->next;
    80005848:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    8000584c:	fe5ff06f          	j	80005830 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80005850:	04098063          	beqz	s3,80005890 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80005854:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    80005858:	04048a63          	beqz	s1,800058ac <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    8000585c:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    80005860:	010aa783          	lw	a5,16(s5)
    80005864:	0017879b          	addiw	a5,a5,1
    80005868:	00faa823          	sw	a5,16(s5)
}
    8000586c:	03813083          	ld	ra,56(sp)
    80005870:	03013403          	ld	s0,48(sp)
    80005874:	02813483          	ld	s1,40(sp)
    80005878:	02013903          	ld	s2,32(sp)
    8000587c:	01813983          	ld	s3,24(sp)
    80005880:	01013a03          	ld	s4,16(sp)
    80005884:	00813a83          	ld	s5,8(sp)
    80005888:	04010113          	addi	sp,sp,64
    8000588c:	00008067          	ret
        info->next = head;
    80005890:	000ab783          	ld	a5,0(s5)
    80005894:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    80005898:	00078663          	beqz	a5,800058a4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    8000589c:	012ab023          	sd	s2,0(s5)
    800058a0:	fc1ff06f          	j	80005860 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    800058a4:	012ab423          	sd	s2,8(s5)
    800058a8:	ff5ff06f          	j	8000589c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    800058ac:	012ab423          	sd	s2,8(s5)
    800058b0:	fadff06f          	j	8000585c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

00000000800058b4 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    800058b4:	ff010113          	addi	sp,sp,-16
    800058b8:	00813423          	sd	s0,8(sp)
    800058bc:	01010413          	addi	s0,sp,16
    info->next = head;
    800058c0:	00053783          	ld	a5,0(a0)
    800058c4:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    800058c8:	02078063          	beqz	a5,800058e8 <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    800058cc:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    800058d0:	01052783          	lw	a5,16(a0)
    800058d4:	0017879b          	addiw	a5,a5,1
    800058d8:	00f52823          	sw	a5,16(a0)
    800058dc:	00813403          	ld	s0,8(sp)
    800058e0:	01010113          	addi	sp,sp,16
    800058e4:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    800058e8:	00b53423          	sd	a1,8(a0)
    800058ec:	fe1ff06f          	j	800058cc <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

00000000800058f0 <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    800058f0:	ff010113          	addi	sp,sp,-16
    800058f4:	00813423          	sd	s0,8(sp)
    800058f8:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    800058fc:	00852683          	lw	a3,8(a0)
    80005900:	0085a703          	lw	a4,8(a1)
    80005904:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    80005908:	0007cc63          	bltz	a5,80005920 <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    8000590c:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    80005910:	00078513          	mv	a0,a5
    80005914:	00813403          	ld	s0,8(sp)
    80005918:	01010113          	addi	sp,sp,16
    8000591c:	00008067          	ret
        x2->sleep_time = -diff;
    80005920:	40d7073b          	subw	a4,a4,a3
    80005924:	00e5b423          	sd	a4,8(a1)
    80005928:	fe9ff06f          	j	80005910 <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

000000008000592c <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    8000592c:	ff010113          	addi	sp,sp,-16
    80005930:	00813423          	sd	s0,8(sp)
    80005934:	01010413          	addi	s0,sp,16
    80005938:	00100793          	li	a5,1
    8000593c:	00f50863          	beq	a0,a5,8000594c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80005940:	00813403          	ld	s0,8(sp)
    80005944:	01010113          	addi	sp,sp,16
    80005948:	00008067          	ret
    8000594c:	000107b7          	lui	a5,0x10
    80005950:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005954:	fef596e3          	bne	a1,a5,80005940 <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80005958:	00005797          	auipc	a5,0x5
    8000595c:	4f078793          	addi	a5,a5,1264 # 8000ae48 <_ZN9Scheduler5queueE>
    80005960:	0007b023          	sd	zero,0(a5)
    80005964:	0007b423          	sd	zero,8(a5)
    80005968:	0007a823          	sw	zero,16(a5)
    8000596c:	0007bc23          	sd	zero,24(a5)
    80005970:	0207b023          	sd	zero,32(a5)
    80005974:	0207a423          	sw	zero,40(a5)
    80005978:	fc9ff06f          	j	80005940 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000597c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    8000597c:	ff010113          	addi	sp,sp,-16
    80005980:	00113423          	sd	ra,8(sp)
    80005984:	00813023          	sd	s0,0(sp)
    80005988:	01010413          	addi	s0,sp,16
    8000598c:	00050593          	mv	a1,a0
    80005990:	00005517          	auipc	a0,0x5
    80005994:	4b850513          	addi	a0,a0,1208 # 8000ae48 <_ZN9Scheduler5queueE>
    80005998:	00000097          	auipc	ra,0x0
    8000599c:	d3c080e7          	jalr	-708(ra) # 800056d4 <_ZN8TcbQueue6insertEP3TCB>
    800059a0:	00813083          	ld	ra,8(sp)
    800059a4:	00013403          	ld	s0,0(sp)
    800059a8:	01010113          	addi	sp,sp,16
    800059ac:	00008067          	ret

00000000800059b0 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    800059b0:	ff010113          	addi	sp,sp,-16
    800059b4:	00813423          	sd	s0,8(sp)
    800059b8:	01010413          	addi	s0,sp,16
    800059bc:	00813403          	ld	s0,8(sp)
    800059c0:	01010113          	addi	sp,sp,16
    800059c4:	00008067          	ret

00000000800059c8 <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    800059c8:	ff010113          	addi	sp,sp,-16
    800059cc:	00813423          	sd	s0,8(sp)
    800059d0:	01010413          	addi	s0,sp,16
    800059d4:	00813403          	ld	s0,8(sp)
    800059d8:	01010113          	addi	sp,sp,16
    800059dc:	00008067          	ret

00000000800059e0 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    800059e0:	ff010113          	addi	sp,sp,-16
    800059e4:	00113423          	sd	ra,8(sp)
    800059e8:	00813023          	sd	s0,0(sp)
    800059ec:	01010413          	addi	s0,sp,16
    800059f0:	00005517          	auipc	a0,0x5
    800059f4:	45850513          	addi	a0,a0,1112 # 8000ae48 <_ZN9Scheduler5queueE>
    800059f8:	00000097          	auipc	ra,0x0
    800059fc:	d88080e7          	jalr	-632(ra) # 80005780 <_ZN8TcbQueue10printQueueEv>
    80005a00:	00813083          	ld	ra,8(sp)
    80005a04:	00013403          	ld	s0,0(sp)
    80005a08:	01010113          	addi	sp,sp,16
    80005a0c:	00008067          	ret

0000000080005a10 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { 
    80005a10:	ff010113          	addi	sp,sp,-16
    80005a14:	00113423          	sd	ra,8(sp)
    80005a18:	00813023          	sd	s0,0(sp)
    80005a1c:	01010413          	addi	s0,sp,16
    print_queue();
    80005a20:	00000097          	auipc	ra,0x0
    80005a24:	fc0080e7          	jalr	-64(ra) # 800059e0 <_ZN9Scheduler11print_queueEv>
    return queue.remove(); }
    80005a28:	00005517          	auipc	a0,0x5
    80005a2c:	42050513          	addi	a0,a0,1056 # 8000ae48 <_ZN9Scheduler5queueE>
    80005a30:	00000097          	auipc	ra,0x0
    80005a34:	ce4080e7          	jalr	-796(ra) # 80005714 <_ZN8TcbQueue6removeEv>
    80005a38:	00813083          	ld	ra,8(sp)
    80005a3c:	00013403          	ld	s0,0(sp)
    80005a40:	01010113          	addi	sp,sp,16
    80005a44:	00008067          	ret

0000000080005a48 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    80005a48:	ff010113          	addi	sp,sp,-16
    80005a4c:	00113423          	sd	ra,8(sp)
    80005a50:	00813023          	sd	s0,0(sp)
    80005a54:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    80005a58:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80005a5c:	00000617          	auipc	a2,0x0
    80005a60:	e9460613          	addi	a2,a2,-364 # 800058f0 <_ZN9Scheduler3cmpEP3TCBS1_>
    80005a64:	00050593          	mv	a1,a0
    80005a68:	00005517          	auipc	a0,0x5
    80005a6c:	3f850513          	addi	a0,a0,1016 # 8000ae60 <_ZN9Scheduler8sleepingE>
    80005a70:	00000097          	auipc	ra,0x0
    80005a74:	d88080e7          	jalr	-632(ra) # 800057f8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80005a78:	00813083          	ld	ra,8(sp)
    80005a7c:	00013403          	ld	s0,0(sp)
    80005a80:	01010113          	addi	sp,sp,16
    80005a84:	00008067          	ret

0000000080005a88 <_ZN9Scheduler12update_sleepEv>:
{
    80005a88:	fe010113          	addi	sp,sp,-32
    80005a8c:	00113c23          	sd	ra,24(sp)
    80005a90:	00813823          	sd	s0,16(sp)
    80005a94:	00913423          	sd	s1,8(sp)
    80005a98:	01213023          	sd	s2,0(sp)
    80005a9c:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    80005aa0:	00005517          	auipc	a0,0x5
    80005aa4:	3c050513          	addi	a0,a0,960 # 8000ae60 <_ZN9Scheduler8sleepingE>
    80005aa8:	00000097          	auipc	ra,0x0
    80005aac:	cbc080e7          	jalr	-836(ra) # 80005764 <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    80005ab0:	04050e63          	beqz	a0,80005b0c <_ZN9Scheduler12update_sleepEv+0x84>
    80005ab4:	00050493          	mv	s1,a0
    t->sleep_time--;
    80005ab8:	00853783          	ld	a5,8(a0)
    80005abc:	fff78793          	addi	a5,a5,-1
    80005ac0:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    80005ac4:	04048463          	beqz	s1,80005b0c <_ZN9Scheduler12update_sleepEv+0x84>
    80005ac8:	0084b783          	ld	a5,8(s1)
    80005acc:	04079063          	bnez	a5,80005b0c <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    80005ad0:	00005917          	auipc	s2,0x5
    80005ad4:	39090913          	addi	s2,s2,912 # 8000ae60 <_ZN9Scheduler8sleepingE>
    80005ad8:	00090513          	mv	a0,s2
    80005adc:	00000097          	auipc	ra,0x0
    80005ae0:	c38080e7          	jalr	-968(ra) # 80005714 <_ZN8TcbQueue6removeEv>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
        allocator.mem_free(this->stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    80005ae4:	00100793          	li	a5,1
    80005ae8:	02f4a823          	sw	a5,48(s1)
        put(t);
    80005aec:	00048513          	mv	a0,s1
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	e8c080e7          	jalr	-372(ra) # 8000597c <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    80005af8:	00090513          	mv	a0,s2
    80005afc:	00000097          	auipc	ra,0x0
    80005b00:	c68080e7          	jalr	-920(ra) # 80005764 <_ZN8TcbQueue3topEv>
    80005b04:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    80005b08:	fbdff06f          	j	80005ac4 <_ZN9Scheduler12update_sleepEv+0x3c>
    80005b0c:	01813083          	ld	ra,24(sp)
    80005b10:	01013403          	ld	s0,16(sp)
    80005b14:	00813483          	ld	s1,8(sp)
    80005b18:	00013903          	ld	s2,0(sp)
    80005b1c:	02010113          	addi	sp,sp,32
    80005b20:	00008067          	ret

0000000080005b24 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80005b24:	ff010113          	addi	sp,sp,-16
    80005b28:	00113423          	sd	ra,8(sp)
    80005b2c:	00813023          	sd	s0,0(sp)
    80005b30:	01010413          	addi	s0,sp,16
    80005b34:	000105b7          	lui	a1,0x10
    80005b38:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80005b3c:	00100513          	li	a0,1
    80005b40:	00000097          	auipc	ra,0x0
    80005b44:	dec080e7          	jalr	-532(ra) # 8000592c <_Z41__static_initialization_and_destruction_0ii>
    80005b48:	00813083          	ld	ra,8(sp)
    80005b4c:	00013403          	ld	s0,0(sp)
    80005b50:	01010113          	addi	sp,sp,16
    80005b54:	00008067          	ret

0000000080005b58 <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80005b58:	ff010113          	addi	sp,sp,-16
    80005b5c:	00813423          	sd	s0,8(sp)
    80005b60:	01010413          	addi	s0,sp,16
    80005b64:	00100793          	li	a5,1
    80005b68:	00f50863          	beq	a0,a5,80005b78 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80005b6c:	00813403          	ld	s0,8(sp)
    80005b70:	01010113          	addi	sp,sp,16
    80005b74:	00008067          	ret
    80005b78:	000107b7          	lui	a5,0x10
    80005b7c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005b80:	fef596e3          	bne	a1,a5,80005b6c <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80005b84:	00003797          	auipc	a5,0x3
    80005b88:	48c78793          	addi	a5,a5,1164 # 80009010 <CONSOLE_STATUS>
    80005b8c:	0007b783          	ld	a5,0(a5)
    80005b90:	00005717          	auipc	a4,0x5
    80005b94:	22f73c23          	sd	a5,568(a4) # 8000adc8 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80005b98:	00003797          	auipc	a5,0x3
    80005b9c:	46878793          	addi	a5,a5,1128 # 80009000 <CONSOLE_RX_DATA>
    80005ba0:	0007b783          	ld	a5,0(a5)
    80005ba4:	00005717          	auipc	a4,0x5
    80005ba8:	20f73e23          	sd	a5,540(a4) # 8000adc0 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80005bac:	00003797          	auipc	a5,0x3
    80005bb0:	45c78793          	addi	a5,a5,1116 # 80009008 <CONSOLE_TX_DATA>
    80005bb4:	0007b783          	ld	a5,0(a5)
    80005bb8:	00005717          	auipc	a4,0x5
    80005bbc:	20f73023          	sd	a5,512(a4) # 8000adb8 <_ZN5StdIO5odataE>
    80005bc0:	fadff06f          	j	80005b6c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080005bc4 <_ZN5StdIO12outputWorkerEPv>:
{
    80005bc4:	fc010113          	addi	sp,sp,-64
    80005bc8:	02113c23          	sd	ra,56(sp)
    80005bcc:	02813823          	sd	s0,48(sp)
    80005bd0:	02913423          	sd	s1,40(sp)
    80005bd4:	03213023          	sd	s2,32(sp)
    80005bd8:	01313c23          	sd	s3,24(sp)
    80005bdc:	01413823          	sd	s4,16(sp)
    80005be0:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    80005be4:	00005797          	auipc	a5,0x5
    80005be8:	1a07ba23          	sd	zero,436(a5) # 8000ad98 <_ZN5StdIO10out_threadE>
    80005bec:	0400006f          	j	80005c2c <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005bf0:	100027f3          	csrr	a5,sstatus
    80005bf4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80005bf8:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005bfc:	141027f3          	csrr	a5,sepc
    80005c00:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80005c04:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    80005c08:	00005797          	auipc	a5,0x5
    80005c0c:	1e078793          	addi	a5,a5,480 # 8000ade8 <_ZN3TCB7runningE>
    80005c10:	0007b783          	ld	a5,0(a5)
    80005c14:	00005717          	auipc	a4,0x5
    80005c18:	18f73223          	sd	a5,388(a4) # 8000ad98 <_ZN5StdIO10out_threadE>
            TCB::yield();
    80005c1c:	00001097          	auipc	ra,0x1
    80005c20:	8bc080e7          	jalr	-1860(ra) # 800064d8 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005c24:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005c28:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80005c2c:	00005797          	auipc	a5,0x5
    80005c30:	19c78793          	addi	a5,a5,412 # 8000adc8 <_ZN5StdIO8iostatusE>
    80005c34:	0007b783          	ld	a5,0(a5)
    80005c38:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80005c3c:	0207f793          	andi	a5,a5,32
    80005c40:	fa0788e3          	beqz	a5,80005bf0 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80005c44:	00005797          	auipc	a5,0x5
    80005c48:	16478793          	addi	a5,a5,356 # 8000ada8 <_ZN5StdIO7obufferE>
    80005c4c:	0007b483          	ld	s1,0(a5)
    80005c50:	00005797          	auipc	a5,0x5
    80005c54:	16878793          	addi	a5,a5,360 # 8000adb8 <_ZN5StdIO5odataE>
    80005c58:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80005c5c:	42848513          	addi	a0,s1,1064
    80005c60:	fffff097          	auipc	ra,0xfffff
    80005c64:	334080e7          	jalr	820(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005c68:	40048913          	addi	s2,s1,1024
    80005c6c:	00090513          	mv	a0,s2
    80005c70:	fffff097          	auipc	ra,0xfffff
    80005c74:	324080e7          	jalr	804(ra) # 80004f94 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80005c78:	4804a783          	lw	a5,1152(s1)
    80005c7c:	fff7879b          	addiw	a5,a5,-1
    80005c80:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80005c84:	4784a783          	lw	a5,1144(s1)
    80005c88:	00f48733          	add	a4,s1,a5
    80005c8c:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80005c90:	0017879b          	addiw	a5,a5,1
    80005c94:	41f7d71b          	sraiw	a4,a5,0x1f
    80005c98:	0167571b          	srliw	a4,a4,0x16
    80005c9c:	00e787bb          	addw	a5,a5,a4
    80005ca0:	3ff7f793          	andi	a5,a5,1023
    80005ca4:	40e787bb          	subw	a5,a5,a4
    80005ca8:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    80005cac:	45048513          	addi	a0,s1,1104
    80005cb0:	fffff097          	auipc	ra,0xfffff
    80005cb4:	368080e7          	jalr	872(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80005cb8:	00090513          	mv	a0,s2
    80005cbc:	fffff097          	auipc	ra,0xfffff
    80005cc0:	35c080e7          	jalr	860(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    80005cc4:	01498023          	sb	s4,0(s3)
    80005cc8:	f65ff06f          	j	80005c2c <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080005ccc <_ZN5StdIO9initalizeEv>:
{
    80005ccc:	fd010113          	addi	sp,sp,-48
    80005cd0:	02113423          	sd	ra,40(sp)
    80005cd4:	02813023          	sd	s0,32(sp)
    80005cd8:	00913c23          	sd	s1,24(sp)
    80005cdc:	01213823          	sd	s2,16(sp)
    80005ce0:	01313423          	sd	s3,8(sp)
    80005ce4:	03010413          	addi	s0,sp,48
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80005ce8:	fffff097          	auipc	ra,0xfffff
    80005cec:	53c080e7          	jalr	1340(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80005cf0:	01300593          	li	a1,19
    80005cf4:	fffff097          	auipc	ra,0xfffff
    80005cf8:	5a4080e7          	jalr	1444(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80005cfc:	40050793          	addi	a5,a0,1024
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    80005d00:	00100913          	li	s2,1
    80005d04:	41252423          	sw	s2,1032(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80005d08:	40053823          	sd	zero,1040(a0)
    80005d0c:	40053c23          	sd	zero,1048(a0)
    80005d10:	42052023          	sw	zero,1056(a0)
    {
        next = activeSemaphores;
    80005d14:	00005497          	auipc	s1,0x5
    80005d18:	07c48493          	addi	s1,s1,124 # 8000ad90 <_ZN10KSemaphore16activeSemaphoresE>
    80005d1c:	0004b703          	ld	a4,0(s1)
    80005d20:	40e53023          	sd	a4,1024(a0)
    80005d24:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80005d28:	42052823          	sw	zero,1072(a0)
    80005d2c:	42053c23          	sd	zero,1080(a0)
    80005d30:	44053023          	sd	zero,1088(a0)
    80005d34:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80005d38:	42f53423          	sd	a5,1064(a0)
    80005d3c:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80005d40:	40000993          	li	s3,1024
    80005d44:	45352c23          	sw	s3,1112(a0)
    80005d48:	46053023          	sd	zero,1120(a0)
    80005d4c:	46053423          	sd	zero,1128(a0)
    80005d50:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80005d54:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80005d58:	00f4b023          	sd	a5,0(s1)
    80005d5c:	46052c23          	sw	zero,1144(a0)
    80005d60:	46052e23          	sw	zero,1148(a0)
    80005d64:	48052023          	sw	zero,1152(a0)
    ibuffer = new SharedBuffer<char>();
    80005d68:	00005797          	auipc	a5,0x5
    80005d6c:	04a7b423          	sd	a0,72(a5) # 8000adb0 <_ZN5StdIO7ibufferE>
    80005d70:	fffff097          	auipc	ra,0xfffff
    80005d74:	4b4080e7          	jalr	1204(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80005d78:	01300593          	li	a1,19
    80005d7c:	fffff097          	auipc	ra,0xfffff
    80005d80:	51c080e7          	jalr	1308(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    80005d84:	40050793          	addi	a5,a0,1024
    KSemaphore(unsigned val):val(val)
    80005d88:	41252423          	sw	s2,1032(a0)
    80005d8c:	40053823          	sd	zero,1040(a0)
    80005d90:	40053c23          	sd	zero,1048(a0)
    80005d94:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores;
    80005d98:	0004b703          	ld	a4,0(s1)
    80005d9c:	40e53023          	sd	a4,1024(a0)
    80005da0:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80005da4:	42052823          	sw	zero,1072(a0)
    80005da8:	42053c23          	sd	zero,1080(a0)
    80005dac:	44053023          	sd	zero,1088(a0)
    80005db0:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80005db4:	42f53423          	sd	a5,1064(a0)
    80005db8:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80005dbc:	45352c23          	sw	s3,1112(a0)
    80005dc0:	46053023          	sd	zero,1120(a0)
    80005dc4:	46053423          	sd	zero,1128(a0)
    80005dc8:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80005dcc:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80005dd0:	00f4b023          	sd	a5,0(s1)
    80005dd4:	46052c23          	sw	zero,1144(a0)
    80005dd8:	46052e23          	sw	zero,1148(a0)
    80005ddc:	48052023          	sw	zero,1152(a0)
    obuffer = new SharedBuffer<char>();
    80005de0:	00005797          	auipc	a5,0x5
    80005de4:	fca7b423          	sd	a0,-56(a5) # 8000ada8 <_ZN5StdIO7obufferE>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80005de8:	fffff097          	auipc	ra,0xfffff
    80005dec:	43c080e7          	jalr	1084(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80005df0:	00100593          	li	a1,1
    80005df4:	fffff097          	auipc	ra,0xfffff
    80005df8:	4a4080e7          	jalr	1188(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80005dfc:	00052423          	sw	zero,8(a0)
    80005e00:	00053823          	sd	zero,16(a0)
    80005e04:	00053c23          	sd	zero,24(a0)
    80005e08:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80005e0c:	0004b783          	ld	a5,0(s1)
    80005e10:	00f53023          	sd	a5,0(a0)
        activeSemaphores = this;
    80005e14:	00a4b023          	sd	a0,0(s1)
    blockSem = new KSemaphore(0);
    80005e18:	00005797          	auipc	a5,0x5
    80005e1c:	f8a7b423          	sd	a0,-120(a5) # 8000ada0 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80005e20:	00003797          	auipc	a5,0x3
    80005e24:	1f078793          	addi	a5,a5,496 # 80009010 <CONSOLE_STATUS>
    80005e28:	0007b783          	ld	a5,0(a5)
    80005e2c:	00005717          	auipc	a4,0x5
    80005e30:	f8f73e23          	sd	a5,-100(a4) # 8000adc8 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80005e34:	00003797          	auipc	a5,0x3
    80005e38:	1cc78793          	addi	a5,a5,460 # 80009000 <CONSOLE_RX_DATA>
    80005e3c:	0007b783          	ld	a5,0(a5)
    80005e40:	00005717          	auipc	a4,0x5
    80005e44:	f8f73023          	sd	a5,-128(a4) # 8000adc0 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80005e48:	00003797          	auipc	a5,0x3
    80005e4c:	1c078793          	addi	a5,a5,448 # 80009008 <CONSOLE_TX_DATA>
    80005e50:	0007b783          	ld	a5,0(a5)
    80005e54:	00005717          	auipc	a4,0x5
    80005e58:	f6f73223          	sd	a5,-156(a4) # 8000adb8 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80005e5c:	fffff097          	auipc	ra,0xfffff
    80005e60:	3c8080e7          	jalr	968(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80005e64:	04000593          	li	a1,64
    80005e68:	fffff097          	auipc	ra,0xfffff
    80005e6c:	430080e7          	jalr	1072(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80005e70:	00050613          	mv	a2,a0
    80005e74:	00000593          	li	a1,0
    80005e78:	00000517          	auipc	a0,0x0
    80005e7c:	d4c50513          	addi	a0,a0,-692 # 80005bc4 <_ZN5StdIO12outputWorkerEPv>
    80005e80:	00000097          	auipc	ra,0x0
    80005e84:	2a4080e7          	jalr	676(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005e88:	00005797          	auipc	a5,0x5
    80005e8c:	f0a7b823          	sd	a0,-240(a5) # 8000ad98 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80005e90:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80005e94:	03250b23          	sb	s2,54(a0)
}
    80005e98:	02813083          	ld	ra,40(sp)
    80005e9c:	02013403          	ld	s0,32(sp)
    80005ea0:	01813483          	ld	s1,24(sp)
    80005ea4:	01013903          	ld	s2,16(sp)
    80005ea8:	00813983          	ld	s3,8(sp)
    80005eac:	03010113          	addi	sp,sp,48
    80005eb0:	00008067          	ret

0000000080005eb4 <_ZN5StdIO11inputWorkerEv>:
{
    80005eb4:	ff010113          	addi	sp,sp,-16
    80005eb8:	00813423          	sd	s0,8(sp)
    80005ebc:	01010413          	addi	s0,sp,16
}
    80005ec0:	00813403          	ld	s0,8(sp)
    80005ec4:	01010113          	addi	sp,sp,16
    80005ec8:	00008067          	ret

0000000080005ecc <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    80005ecc:	fc010113          	addi	sp,sp,-64
    80005ed0:	02113c23          	sd	ra,56(sp)
    80005ed4:	02813823          	sd	s0,48(sp)
    80005ed8:	02913423          	sd	s1,40(sp)
    80005edc:	03213023          	sd	s2,32(sp)
    80005ee0:	01313c23          	sd	s3,24(sp)
    80005ee4:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    80005ee8:	ffffc097          	auipc	ra,0xffffc
    80005eec:	96c080e7          	jalr	-1684(ra) # 80001854 <plic_claim>
    if(t == CONSOLE_IRQ)
    80005ef0:	00a00793          	li	a5,10
    80005ef4:	12f51063          	bne	a0,a5,80006014 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    80005ef8:	00005797          	auipc	a5,0x5
    80005efc:	ed078793          	addi	a5,a5,-304 # 8000adc8 <_ZN5StdIO8iostatusE>
    80005f00:	0007b783          	ld	a5,0(a5)
    80005f04:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    80005f08:	0017f793          	andi	a5,a5,1
    80005f0c:	0a078263          	beqz	a5,80005fb0 <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    80005f10:	00005797          	auipc	a5,0x5
    80005f14:	eb078793          	addi	a5,a5,-336 # 8000adc0 <_ZN5StdIO5idataE>
    80005f18:	0007b783          	ld	a5,0(a5)
    80005f1c:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    80005f20:	00a00513          	li	a0,10
    80005f24:	ffffc097          	auipc	ra,0xffffc
    80005f28:	968080e7          	jalr	-1688(ra) # 8000188c <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80005f2c:	00005797          	auipc	a5,0x5
    80005f30:	e8478793          	addi	a5,a5,-380 # 8000adb0 <_ZN5StdIO7ibufferE>
    80005f34:	0007b483          	ld	s1,0(a5)
    80005f38:	4804a703          	lw	a4,1152(s1)
    80005f3c:	3ff00793          	li	a5,1023
    80005f40:	0ce7ce63          	blt	a5,a4,8000601c <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80005f44:	45048513          	addi	a0,s1,1104
    80005f48:	fffff097          	auipc	ra,0xfffff
    80005f4c:	04c080e7          	jalr	76(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005f50:	40048993          	addi	s3,s1,1024
    80005f54:	00098513          	mv	a0,s3
    80005f58:	fffff097          	auipc	ra,0xfffff
    80005f5c:	03c080e7          	jalr	60(ra) # 80004f94 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80005f60:	4804a783          	lw	a5,1152(s1)
    80005f64:	0017879b          	addiw	a5,a5,1
    80005f68:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    80005f6c:	47c4a783          	lw	a5,1148(s1)
    80005f70:	00f48733          	add	a4,s1,a5
    80005f74:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80005f78:	0017879b          	addiw	a5,a5,1
    80005f7c:	41f7d71b          	sraiw	a4,a5,0x1f
    80005f80:	0167571b          	srliw	a4,a4,0x16
    80005f84:	00e787bb          	addw	a5,a5,a4
    80005f88:	3ff7f793          	andi	a5,a5,1023
    80005f8c:	40e787bb          	subw	a5,a5,a4
    80005f90:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    80005f94:	42848513          	addi	a0,s1,1064
    80005f98:	fffff097          	auipc	ra,0xfffff
    80005f9c:	080080e7          	jalr	128(ra) # 80005018 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80005fa0:	00098513          	mv	a0,s3
    80005fa4:	fffff097          	auipc	ra,0xfffff
    80005fa8:	074080e7          	jalr	116(ra) # 80005018 <_ZN10KSemaphore6signalEv>
    80005fac:	0700006f          	j	8000601c <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    80005fb0:	00a00513          	li	a0,10
    80005fb4:	ffffc097          	auipc	ra,0xffffc
    80005fb8:	8d8080e7          	jalr	-1832(ra) # 8000188c <plic_complete>
            if(out_thread != nullptr)
    80005fbc:	00005797          	auipc	a5,0x5
    80005fc0:	ddc78793          	addi	a5,a5,-548 # 8000ad98 <_ZN5StdIO10out_threadE>
    80005fc4:	0007b783          	ld	a5,0(a5)
    80005fc8:	04078a63          	beqz	a5,8000601c <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005fcc:	100027f3          	csrr	a5,sstatus
    80005fd0:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80005fd4:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005fd8:	141027f3          	csrr	a5,sepc
    80005fdc:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80005fe0:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80005fe4:	00005797          	auipc	a5,0x5
    80005fe8:	db478793          	addi	a5,a5,-588 # 8000ad98 <_ZN5StdIO10out_threadE>
    80005fec:	0007b583          	ld	a1,0(a5)
    80005ff0:	00005517          	auipc	a0,0x5
    80005ff4:	e5850513          	addi	a0,a0,-424 # 8000ae48 <_ZN9Scheduler5queueE>
    80005ff8:	00000097          	auipc	ra,0x0
    80005ffc:	8bc080e7          	jalr	-1860(ra) # 800058b4 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    80006000:	00000097          	auipc	ra,0x0
    80006004:	4d8080e7          	jalr	1240(ra) # 800064d8 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80006008:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    8000600c:	14149073          	csrw	sepc,s1
    80006010:	00c0006f          	j	8000601c <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    80006014:	ffffc097          	auipc	ra,0xffffc
    80006018:	878080e7          	jalr	-1928(ra) # 8000188c <plic_complete>
    8000601c:	03813083          	ld	ra,56(sp)
    80006020:	03013403          	ld	s0,48(sp)
    80006024:	02813483          	ld	s1,40(sp)
    80006028:	02013903          	ld	s2,32(sp)
    8000602c:	01813983          	ld	s3,24(sp)
    80006030:	04010113          	addi	sp,sp,64
    80006034:	00008067          	ret

0000000080006038 <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    80006038:	ff010113          	addi	sp,sp,-16
    8000603c:	00113423          	sd	ra,8(sp)
    80006040:	00813023          	sd	s0,0(sp)
    80006044:	01010413          	addi	s0,sp,16
    80006048:	000105b7          	lui	a1,0x10
    8000604c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80006050:	00100513          	li	a0,1
    80006054:	00000097          	auipc	ra,0x0
    80006058:	b04080e7          	jalr	-1276(ra) # 80005b58 <_Z41__static_initialization_and_destruction_0ii>
    8000605c:	00813083          	ld	ra,8(sp)
    80006060:	00013403          	ld	s0,0(sp)
    80006064:	01010113          	addi	sp,sp,16
    80006068:	00008067          	ret

000000008000606c <_ZN5Riscv10popSppSpieEv>:
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;

void Riscv::popSppSpie() 
{
    8000606c:	ff010113          	addi	sp,sp,-16
    80006070:	00813423          	sd	s0,8(sp)
    80006074:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80006078:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    8000607c:	10200073          	sret
}
    80006080:	00813403          	ld	s0,8(sp)
    80006084:	01010113          	addi	sp,sp,16
    80006088:	00008067          	ret

000000008000608c <_ZN3TCBC1EPFvPvES0_Pmm>:
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    8000608c:	00053023          	sd	zero,0(a0)
    80006090:	00053423          	sd	zero,8(a0)
    80006094:	00b53823          	sd	a1,16(a0)
    80006098:	00c53c23          	sd	a2,24(a0)
    8000609c:	02d53023          	sd	a3,32(a0)
    800060a0:	02e53423          	sd	a4,40(a0)
    800060a4:	00100793          	li	a5,1
    800060a8:	02f52823          	sw	a5,48(a0)
    800060ac:	02050a23          	sb	zero,52(a0)
    800060b0:	02f50aa3          	sb	a5,53(a0)
    800060b4:	02050b23          	sb	zero,54(a0)
    800060b8:	00000797          	auipc	a5,0x0
    800060bc:	17078793          	addi	a5,a5,368 # 80006228 <_ZN3TCB13threadWrapperEv>
    800060c0:	02f53c23          	sd	a5,56(a0)
    800060c4:	04068a63          	beqz	a3,80006118 <_ZN3TCBC1EPFvPvES0_Pmm+0x8c>
    800060c8:	000017b7          	lui	a5,0x1
    800060cc:	00f687b3          	add	a5,a3,a5
    800060d0:	04f53023          	sd	a5,64(a0)
{    
    if(body && stack){
    800060d4:	04058663          	beqz	a1,80006120 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
    800060d8:	04068463          	beqz	a3,80006120 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    800060dc:	ff010113          	addi	sp,sp,-16
    800060e0:	00113423          	sd	ra,8(sp)
    800060e4:	00813023          	sd	s0,0(sp)
    800060e8:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    800060ec:	00000097          	auipc	ra,0x0
    800060f0:	890080e7          	jalr	-1904(ra) # 8000597c <_ZN9Scheduler3putEP3TCB>
        threadsUp++;
    800060f4:	00005717          	auipc	a4,0x5
    800060f8:	cdc70713          	addi	a4,a4,-804 # 8000add0 <_ZN3TCB9threadsUpE>
    800060fc:	00072783          	lw	a5,0(a4)
    80006100:	0017879b          	addiw	a5,a5,1
    80006104:	00f72023          	sw	a5,0(a4)
    }
}   
    80006108:	00813083          	ld	ra,8(sp)
    8000610c:	00013403          	ld	s0,0(sp)
    80006110:	01010113          	addi	sp,sp,16
    80006114:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80006118:	00000793          	li	a5,0
    8000611c:	fb5ff06f          	j	800060d0 <_ZN3TCBC1EPFvPvES0_Pmm+0x44>
    80006120:	00008067          	ret

0000000080006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80006124:	fd010113          	addi	sp,sp,-48
    80006128:	02113423          	sd	ra,40(sp)
    8000612c:	02813023          	sd	s0,32(sp)
    80006130:	00913c23          	sd	s1,24(sp)
    80006134:	01213823          	sd	s2,16(sp)
    80006138:	01313423          	sd	s3,8(sp)
    8000613c:	01413023          	sd	s4,0(sp)
    80006140:	03010413          	addi	s0,sp,48
    80006144:	00050913          	mv	s2,a0
    80006148:	00058993          	mv	s3,a1
    8000614c:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80006150:	fffff097          	auipc	ra,0xfffff
    80006154:	0d4080e7          	jalr	212(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80006158:	00200593          	li	a1,2
    8000615c:	fffff097          	auipc	ra,0xfffff
    80006160:	13c080e7          	jalr	316(ra) # 80005298 <_ZN15MemoryAllocator9mem_allocEm>
    80006164:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    80006168:	00200713          	li	a4,2
    8000616c:	000a0693          	mv	a3,s4
    80006170:	00098613          	mv	a2,s3
    80006174:	00090593          	mv	a1,s2
    80006178:	00000097          	auipc	ra,0x0
    8000617c:	f14080e7          	jalr	-236(ra) # 8000608c <_ZN3TCBC1EPFvPvES0_Pmm>
    80006180:	0280006f          	j	800061a8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80006184:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80006188:	fffff097          	auipc	ra,0xfffff
    8000618c:	09c080e7          	jalr	156(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    80006190:	00048593          	mv	a1,s1
    80006194:	fffff097          	auipc	ra,0xfffff
    80006198:	2c0080e7          	jalr	704(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    8000619c:	00090513          	mv	a0,s2
    800061a0:	00006097          	auipc	ra,0x6
    800061a4:	db8080e7          	jalr	-584(ra) # 8000bf58 <_Unwind_Resume>
}
    800061a8:	00048513          	mv	a0,s1
    800061ac:	02813083          	ld	ra,40(sp)
    800061b0:	02013403          	ld	s0,32(sp)
    800061b4:	01813483          	ld	s1,24(sp)
    800061b8:	01013903          	ld	s2,16(sp)
    800061bc:	00813983          	ld	s3,8(sp)
    800061c0:	00013a03          	ld	s4,0(sp)
    800061c4:	03010113          	addi	sp,sp,48
    800061c8:	00008067          	ret

00000000800061cc <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    800061cc:	ff010113          	addi	sp,sp,-16
    800061d0:	00813423          	sd	s0,8(sp)
    800061d4:	01010413          	addi	s0,sp,16
    if(running->userMode)
    800061d8:	00005797          	auipc	a5,0x5
    800061dc:	c1078793          	addi	a5,a5,-1008 # 8000ade8 <_ZN3TCB7runningE>
    800061e0:	0007b783          	ld	a5,0(a5)
    800061e4:	0357c703          	lbu	a4,53(a5)
    800061e8:	00070c63          	beqz	a4,80006200 <_ZN3TCB9initalizeEv+0x34>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800061ec:	10000793          	li	a5,256
    800061f0:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    800061f4:	00813403          	ld	s0,8(sp)
    800061f8:	01010113          	addi	sp,sp,16
    800061fc:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80006200:	10000713          	li	a4,256
    80006204:	10072073          	csrs	sstatus,a4
        if(running->locked)
    80006208:	0367c783          	lbu	a5,54(a5)
    8000620c:	00078863          	beqz	a5,8000621c <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80006210:	02000793          	li	a5,32
    80006214:	1007b073          	csrc	sstatus,a5
    80006218:	fddff06f          	j	800061f4 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    8000621c:	02000793          	li	a5,32
    80006220:	1007a073          	csrs	sstatus,a5
}
    80006224:	fd1ff06f          	j	800061f4 <_ZN3TCB9initalizeEv+0x28>

0000000080006228 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    80006228:	ff010113          	addi	sp,sp,-16
    8000622c:	00113423          	sd	ra,8(sp)
    80006230:	00813023          	sd	s0,0(sp)
    80006234:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    80006238:	00000097          	auipc	ra,0x0
    8000623c:	f94080e7          	jalr	-108(ra) # 800061cc <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    80006240:	00000097          	auipc	ra,0x0
    80006244:	e2c080e7          	jalr	-468(ra) # 8000606c <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80006248:	00005797          	auipc	a5,0x5
    8000624c:	ba078793          	addi	a5,a5,-1120 # 8000ade8 <_ZN3TCB7runningE>
    80006250:	0007b783          	ld	a5,0(a5)
    80006254:	0107b703          	ld	a4,16(a5)
    80006258:	0187b503          	ld	a0,24(a5)
    8000625c:	000700e7          	jalr	a4
    thread_exit();
    80006260:	00001097          	auipc	ra,0x1
    80006264:	ec0080e7          	jalr	-320(ra) # 80007120 <thread_exit>
}
    80006268:	00813083          	ld	ra,8(sp)
    8000626c:	00013403          	ld	s0,0(sp)
    80006270:	01010113          	addi	sp,sp,16
    80006274:	00008067          	ret

0000000080006278 <_ZN3TCB12deleteThreadEPS_>:
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t)
{
    if(t)
    80006278:	08050063          	beqz	a0,800062f8 <_ZN3TCB12deleteThreadEPS_+0x80>
    {
        if(running != t && t->isFinished())
    8000627c:	00005797          	auipc	a5,0x5
    80006280:	b6c78793          	addi	a5,a5,-1172 # 8000ade8 <_ZN3TCB7runningE>
    80006284:	0007b783          	ld	a5,0(a5)
    80006288:	00a78863          	beq	a5,a0,80006298 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    8000628c:	03052703          	lw	a4,48(a0)
    80006290:	00200793          	li	a5,2
    80006294:	00f70863          	beq	a4,a5,800062a4 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    80006298:	00100793          	li	a5,1
    8000629c:	02f50a23          	sb	a5,52(a0)
        }        
    }
}
    800062a0:	00008067          	ret
{
    800062a4:	fe010113          	addi	sp,sp,-32
    800062a8:	00113c23          	sd	ra,24(sp)
    800062ac:	00813823          	sd	s0,16(sp)
    800062b0:	00913423          	sd	s1,8(sp)
    800062b4:	02010413          	addi	s0,sp,32
    800062b8:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    800062bc:	fffff097          	auipc	ra,0xfffff
    800062c0:	f68080e7          	jalr	-152(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    800062c4:	0204b583          	ld	a1,32(s1)
    800062c8:	fffff097          	auipc	ra,0xfffff
    800062cc:	18c080e7          	jalr	396(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    800062d0:	fffff097          	auipc	ra,0xfffff
    800062d4:	f54080e7          	jalr	-172(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    800062d8:	00048593          	mv	a1,s1
    800062dc:	fffff097          	auipc	ra,0xfffff
    800062e0:	178080e7          	jalr	376(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800062e4:	01813083          	ld	ra,24(sp)
    800062e8:	01013403          	ld	s0,16(sp)
    800062ec:	00813483          	ld	s1,8(sp)
    800062f0:	02010113          	addi	sp,sp,32
    800062f4:	00008067          	ret
    800062f8:	00008067          	ret

00000000800062fc <_ZN3TCB22createMainKernelThreadEv>:
    TCB::yield(); 
}

TCB* TCB::createMainKernelThread()
{
    if(!kernelThread)
    800062fc:	00005797          	auipc	a5,0x5
    80006300:	adc78793          	addi	a5,a5,-1316 # 8000add8 <_ZN3TCB12kernelThreadE>
    80006304:	0007b783          	ld	a5,0(a5)
    80006308:	00078e63          	beqz	a5,80006324 <_ZN3TCB22createMainKernelThreadEv+0x28>
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    8000630c:	00005797          	auipc	a5,0x5
    80006310:	acc78793          	addi	a5,a5,-1332 # 8000add8 <_ZN3TCB12kernelThreadE>
    80006314:	0007b503          	ld	a0,0(a5)
    80006318:	00005797          	auipc	a5,0x5
    8000631c:	aca7b823          	sd	a0,-1328(a5) # 8000ade8 <_ZN3TCB7runningE>
    return kernelThread;
}
    80006320:	00008067          	ret
{
    80006324:	ff010113          	addi	sp,sp,-16
    80006328:	00113423          	sd	ra,8(sp)
    8000632c:	00813023          	sd	s0,0(sp)
    80006330:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    80006334:	00000613          	li	a2,0
    80006338:	00000593          	li	a1,0
    8000633c:	00000513          	li	a0,0
    80006340:	00000097          	auipc	ra,0x0
    80006344:	de4080e7          	jalr	-540(ra) # 80006124 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80006348:	00005797          	auipc	a5,0x5
    8000634c:	a8a7b823          	sd	a0,-1392(a5) # 8000add8 <_ZN3TCB12kernelThreadE>
    void setKernelMode() { userMode = false; }
    80006350:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80006354:	00100793          	li	a5,1
    80006358:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    8000635c:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    80006360:	00005797          	auipc	a5,0x5
    80006364:	a7878793          	addi	a5,a5,-1416 # 8000add8 <_ZN3TCB12kernelThreadE>
    80006368:	0007b503          	ld	a0,0(a5)
    8000636c:	00005797          	auipc	a5,0x5
    80006370:	a6a7be23          	sd	a0,-1412(a5) # 8000ade8 <_ZN3TCB7runningE>
}
    80006374:	00813083          	ld	ra,8(sp)
    80006378:	00013403          	ld	s0,0(sp)
    8000637c:	01010113          	addi	sp,sp,16
    80006380:	00008067          	ret

0000000080006384 <_ZN3TCB9endKernelEv>:

int TCB::endKernel()
{
    if(kernelThread)
    80006384:	00005797          	auipc	a5,0x5
    80006388:	a5478793          	addi	a5,a5,-1452 # 8000add8 <_ZN3TCB12kernelThreadE>
    8000638c:	0007b583          	ld	a1,0(a5)
    80006390:	04058463          	beqz	a1,800063d8 <_ZN3TCB9endKernelEv+0x54>
{
    80006394:	ff010113          	addi	sp,sp,-16
    80006398:	00113423          	sd	ra,8(sp)
    8000639c:	00813023          	sd	s0,0(sp)
    800063a0:	01010413          	addi	s0,sp,16
    800063a4:	00005517          	auipc	a0,0x5
    800063a8:	aa450513          	addi	a0,a0,-1372 # 8000ae48 <_ZN9Scheduler5queueE>
    800063ac:	fffff097          	auipc	ra,0xfffff
    800063b0:	508080e7          	jalr	1288(ra) # 800058b4 <_ZN8TcbQueue11insertFrontEP3TCB>
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
    800063b4:	00005797          	auipc	a5,0x5
    800063b8:	a207b223          	sd	zero,-1500(a5) # 8000add8 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    800063bc:	00000097          	auipc	ra,0x0
    800063c0:	024080e7          	jalr	36(ra) # 800063e0 <_ZN3TCB8dispatchEv>
    }
    return -1;

    
}
    800063c4:	fff00513          	li	a0,-1
    800063c8:	00813083          	ld	ra,8(sp)
    800063cc:	00013403          	ld	s0,0(sp)
    800063d0:	01010113          	addi	sp,sp,16
    800063d4:	00008067          	ret
    800063d8:	fff00513          	li	a0,-1
    800063dc:	00008067          	ret

00000000800063e0 <_ZN3TCB8dispatchEv>:
{
    800063e0:	fe010113          	addi	sp,sp,-32
    800063e4:	00113c23          	sd	ra,24(sp)
    800063e8:	00813823          	sd	s0,16(sp)
    800063ec:	00913423          	sd	s1,8(sp)
    800063f0:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    800063f4:	00005797          	auipc	a5,0x5
    800063f8:	9f478793          	addi	a5,a5,-1548 # 8000ade8 <_ZN3TCB7runningE>
    800063fc:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80006400:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80006404:	00200713          	li	a4,2
    80006408:	06e78c63          	beq	a5,a4,80006480 <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    8000640c:	00078c63          	beqz	a5,80006424 <_ZN3TCB8dispatchEv+0x44>
    80006410:	00300713          	li	a4,3
    80006414:	00e78863          	beq	a5,a4,80006424 <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    80006418:	00048513          	mv	a0,s1
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	560080e7          	jalr	1376(ra) # 8000597c <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80006424:	00005797          	auipc	a5,0x5
    80006428:	9ac78793          	addi	a5,a5,-1620 # 8000add0 <_ZN3TCB9threadsUpE>
    8000642c:	0007a703          	lw	a4,0(a5)
    80006430:	00200793          	li	a5,2
    80006434:	00e7cc63          	blt	a5,a4,8000644c <_ZN3TCB8dispatchEv+0x6c>
    80006438:	00005797          	auipc	a5,0x5
    8000643c:	97078793          	addi	a5,a5,-1680 # 8000ada8 <_ZN5StdIO7obufferE>
    80006440:	0007b783          	ld	a5,0(a5)
    80006444:	4807a783          	lw	a5,1152(a5)
    80006448:	08078263          	beqz	a5,800064cc <_ZN3TCB8dispatchEv+0xec>
    running = Scheduler::get(); 
    8000644c:	fffff097          	auipc	ra,0xfffff
    80006450:	5c4080e7          	jalr	1476(ra) # 80005a10 <_ZN9Scheduler3getEv>
    80006454:	00005797          	auipc	a5,0x5
    80006458:	98a7ba23          	sd	a0,-1644(a5) # 8000ade8 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    8000645c:	03850593          	addi	a1,a0,56
    80006460:	03848513          	addi	a0,s1,56
    80006464:	ffffe097          	auipc	ra,0xffffe
    80006468:	de0080e7          	jalr	-544(ra) # 80004244 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    8000646c:	01813083          	ld	ra,24(sp)
    80006470:	01013403          	ld	s0,16(sp)
    80006474:	00813483          	ld	s1,8(sp)
    80006478:	02010113          	addi	sp,sp,32
    8000647c:	00008067          	ret
        threadsUp--;
    80006480:	00005717          	auipc	a4,0x5
    80006484:	95070713          	addi	a4,a4,-1712 # 8000add0 <_ZN3TCB9threadsUpE>
    80006488:	00072783          	lw	a5,0(a4)
    8000648c:	fff7879b          	addiw	a5,a5,-1
    80006490:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    80006494:	0344c783          	lbu	a5,52(s1)
    80006498:	f80786e3          	beqz	a5,80006424 <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    8000649c:	f80484e3          	beqz	s1,80006424 <_ZN3TCB8dispatchEv+0x44>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    800064a0:	fffff097          	auipc	ra,0xfffff
    800064a4:	d84080e7          	jalr	-636(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    800064a8:	0204b583          	ld	a1,32(s1)
    800064ac:	fffff097          	auipc	ra,0xfffff
    800064b0:	fa8080e7          	jalr	-88(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    800064b4:	fffff097          	auipc	ra,0xfffff
    800064b8:	d70080e7          	jalr	-656(ra) # 80005224 <_ZN15MemoryAllocator11getInstanceEv>
    800064bc:	00048593          	mv	a1,s1
    800064c0:	fffff097          	auipc	ra,0xfffff
    800064c4:	f94080e7          	jalr	-108(ra) # 80005454 <_ZN15MemoryAllocator8mem_freeEPv>
    800064c8:	f5dff06f          	j	80006424 <_ZN3TCB8dispatchEv+0x44>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    800064cc:	00000097          	auipc	ra,0x0
    800064d0:	eb8080e7          	jalr	-328(ra) # 80006384 <_ZN3TCB9endKernelEv>
    800064d4:	f79ff06f          	j	8000644c <_ZN3TCB8dispatchEv+0x6c>

00000000800064d8 <_ZN3TCB5yieldEv>:
{
    800064d8:	ff010113          	addi	sp,sp,-16
    800064dc:	00113423          	sd	ra,8(sp)
    800064e0:	00813023          	sd	s0,0(sp)
    800064e4:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    800064e8:	ffffe097          	auipc	ra,0xffffe
    800064ec:	c44080e7          	jalr	-956(ra) # 8000412c <_ZN5Riscv13pushRegistersEv>
    dispatch();
    800064f0:	00000097          	auipc	ra,0x0
    800064f4:	ef0080e7          	jalr	-272(ra) # 800063e0 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    800064f8:	ffffe097          	auipc	ra,0xffffe
    800064fc:	cb0080e7          	jalr	-848(ra) # 800041a8 <_ZN5Riscv12popRegistersEv>
}
    80006500:	00813083          	ld	ra,8(sp)
    80006504:	00013403          	ld	s0,0(sp)
    80006508:	01010113          	addi	sp,sp,16
    8000650c:	00008067          	ret

0000000080006510 <_ZN3TCB5sleepEm>:
{
    80006510:	ff010113          	addi	sp,sp,-16
    80006514:	00113423          	sd	ra,8(sp)
    80006518:	00813023          	sd	s0,0(sp)
    8000651c:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80006520:	00005797          	auipc	a5,0x5
    80006524:	8c878793          	addi	a5,a5,-1848 # 8000ade8 <_ZN3TCB7runningE>
    80006528:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    8000652c:	00300713          	li	a4,3
    80006530:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80006534:	00050593          	mv	a1,a0
    80006538:	00078513          	mv	a0,a5
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	50c080e7          	jalr	1292(ra) # 80005a48 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80006544:	00000097          	auipc	ra,0x0
    80006548:	f94080e7          	jalr	-108(ra) # 800064d8 <_ZN3TCB5yieldEv>
}
    8000654c:	00813083          	ld	ra,8(sp)
    80006550:	00013403          	ld	s0,0(sp)
    80006554:	01010113          	addi	sp,sp,16
    80006558:	00008067          	ret

000000008000655c <_ZN3TCB15setPanicContextEmm>:

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    8000655c:	ff010113          	addi	sp,sp,-16
    80006560:	00813423          	sd	s0,8(sp)
    80006564:	01010413          	addi	s0,sp,16
    panicContext.ra = ra;
    80006568:	00005797          	auipc	a5,0x5
    8000656c:	91078793          	addi	a5,a5,-1776 # 8000ae78 <_ZN3TCB12panicContextE>
    80006570:	00a7b023          	sd	a0,0(a5)
    panicContext.sp = sp;
    80006574:	00b7b423          	sd	a1,8(a5)
}
    80006578:	00813403          	ld	s0,8(sp)
    8000657c:	01010113          	addi	sp,sp,16
    80006580:	00008067          	ret

0000000080006584 <_ZN3TCB13panicDispatchEv>:

void TCB::panicDispatch()
{
    80006584:	ff010113          	addi	sp,sp,-16
    80006588:	00113423          	sd	ra,8(sp)
    8000658c:	00813023          	sd	s0,0(sp)
    80006590:	01010413          	addi	s0,sp,16
    contextSwitch(&running->context, &panicContext);
    80006594:	00005797          	auipc	a5,0x5
    80006598:	85478793          	addi	a5,a5,-1964 # 8000ade8 <_ZN3TCB7runningE>
    8000659c:	0007b503          	ld	a0,0(a5)
    800065a0:	00005597          	auipc	a1,0x5
    800065a4:	8d858593          	addi	a1,a1,-1832 # 8000ae78 <_ZN3TCB12panicContextE>
    800065a8:	03850513          	addi	a0,a0,56
    800065ac:	ffffe097          	auipc	ra,0xffffe
    800065b0:	c98080e7          	jalr	-872(ra) # 80004244 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    800065b4:	00813083          	ld	ra,8(sp)
    800065b8:	00013403          	ld	s0,0(sp)
    800065bc:	01010113          	addi	sp,sp,16
    800065c0:	00008067          	ret

00000000800065c4 <_kernel_text_end>:
	...

0000000080007000 <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.h"
#include"../../h/_semaphore.h"

extern "C" void* mem_alloc(size_t size)
{
    80007000:	ff010113          	addi	sp,sp,-16
    80007004:	00813423          	sd	s0,8(sp)
    80007008:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    8000700c:	fff50513          	addi	a0,a0,-1
    80007010:	00655513          	srli	a0,a0,0x6
    80007014:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80007018:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    8000701c:	00100793          	li	a5,1
    80007020:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80007024:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80007028:	00050513          	mv	a0,a0
    
    return adr;  
}
    8000702c:	00813403          	ld	s0,8(sp)
    80007030:	01010113          	addi	sp,sp,16
    80007034:	00008067          	ret

0000000080007038 <mem_free>:

extern "C" int mem_free (void* adr)
{
    80007038:	ff010113          	addi	sp,sp,-16
    8000703c:	00813423          	sd	s0,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80007044:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80007048:	00200793          	li	a5,2
    8000704c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80007050:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80007054:	00050513          	mv	a0,a0
    
    return ret;
}
    80007058:	0005051b          	sext.w	a0,a0
    8000705c:	00813403          	ld	s0,8(sp)
    80007060:	01010113          	addi	sp,sp,16
    80007064:	00008067          	ret

0000000080007068 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    80007068:	ff010113          	addi	sp,sp,-16
    8000706c:	00813423          	sd	s0,8(sp)
    80007070:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80007074:	01300793          	li	a5,19
    80007078:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000707c:	00000073          	ecall
}
    80007080:	00813403          	ld	s0,8(sp)
    80007084:	01010113          	addi	sp,sp,16
    80007088:	00008067          	ret

000000008000708c <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    8000708c:	06050e63          	beqz	a0,80007108 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    80007090:	08058063          	beqz	a1,80007110 <thread_create+0x84>
{
    80007094:	fd010113          	addi	sp,sp,-48
    80007098:	02113423          	sd	ra,40(sp)
    8000709c:	02813023          	sd	s0,32(sp)
    800070a0:	00913c23          	sd	s1,24(sp)
    800070a4:	01213823          	sd	s2,16(sp)
    800070a8:	01313423          	sd	s3,8(sp)
    800070ac:	03010413          	addi	s0,sp,48
    800070b0:	00060993          	mv	s3,a2
    800070b4:	00058913          	mv	s2,a1
    800070b8:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800070bc:	00001537          	lui	a0,0x1
    800070c0:	00000097          	auipc	ra,0x0
    800070c4:	f40080e7          	jalr	-192(ra) # 80007000 <mem_alloc>
    if(stack_space == nullptr) return -3;
    800070c8:	04050863          	beqz	a0,80007118 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    800070cc:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    800070d0:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    800070d4:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    800070d8:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    800070dc:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    800070e0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800070e4:	00050513          	mv	a0,a0
    800070e8:	0005051b          	sext.w	a0,a0
    return ret;
}
    800070ec:	02813083          	ld	ra,40(sp)
    800070f0:	02013403          	ld	s0,32(sp)
    800070f4:	01813483          	ld	s1,24(sp)
    800070f8:	01013903          	ld	s2,16(sp)
    800070fc:	00813983          	ld	s3,8(sp)
    80007100:	03010113          	addi	sp,sp,48
    80007104:	00008067          	ret
    if(handle == nullptr) return -1;
    80007108:	fff00513          	li	a0,-1
    8000710c:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80007110:	ffe00513          	li	a0,-2
}
    80007114:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80007118:	ffd00513          	li	a0,-3
    8000711c:	fd1ff06f          	j	800070ec <thread_create+0x60>

0000000080007120 <thread_exit>:

extern "C" int thread_exit()
{
    80007120:	ff010113          	addi	sp,sp,-16
    80007124:	00813423          	sd	s0,8(sp)
    80007128:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    8000712c:	01200513          	li	a0,18
    asm volatile("ecall");
    80007130:	00000073          	ecall

    return ret;
}
    80007134:	00000513          	li	a0,0
    80007138:	00813403          	ld	s0,8(sp)
    8000713c:	01010113          	addi	sp,sp,16
    80007140:	00008067          	ret

0000000080007144 <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    80007144:	ff010113          	addi	sp,sp,-16
    80007148:	00813423          	sd	s0,8(sp)
    8000714c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    80007150:	02050463          	beqz	a0,80007178 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    80007154:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    80007158:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    8000715c:	02100513          	li	a0,33
    asm volatile("ecall");
    80007160:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80007164:	00050513          	mv	a0,a0
    80007168:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000716c:	00813403          	ld	s0,8(sp)
    80007170:	01010113          	addi	sp,sp,16
    80007174:	00008067          	ret
    if(handle == nullptr) return -1;
    80007178:	fff00513          	li	a0,-1
    8000717c:	ff1ff06f          	j	8000716c <sem_open+0x28>

0000000080007180 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    80007180:	ff010113          	addi	sp,sp,-16
    80007184:	00813423          	sd	s0,8(sp)
    80007188:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000718c:	02050263          	beqz	a0,800071b0 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    80007190:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    80007194:	02200513          	li	a0,34
    asm volatile("ecall");
    80007198:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000719c:	00050513          	mv	a0,a0
    800071a0:	0005051b          	sext.w	a0,a0
    return ret;
}
    800071a4:	00813403          	ld	s0,8(sp)
    800071a8:	01010113          	addi	sp,sp,16
    800071ac:	00008067          	ret
    if(handle == nullptr) return -1;
    800071b0:	fff00513          	li	a0,-1
    800071b4:	ff1ff06f          	j	800071a4 <sem_close+0x24>

00000000800071b8 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    800071b8:	ff010113          	addi	sp,sp,-16
    800071bc:	00813423          	sd	s0,8(sp)
    800071c0:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800071c4:	02050263          	beqz	a0,800071e8 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    800071c8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    800071cc:	02300513          	li	a0,35
    asm volatile("ecall");
    800071d0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800071d4:	00050513          	mv	a0,a0
    800071d8:	0005051b          	sext.w	a0,a0
    return ret;
}
    800071dc:	00813403          	ld	s0,8(sp)
    800071e0:	01010113          	addi	sp,sp,16
    800071e4:	00008067          	ret
    if(id == nullptr) return -1;
    800071e8:	fff00513          	li	a0,-1
    800071ec:	ff1ff06f          	j	800071dc <sem_wait+0x24>

00000000800071f0 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    800071f0:	ff010113          	addi	sp,sp,-16
    800071f4:	00813423          	sd	s0,8(sp)
    800071f8:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800071fc:	02050263          	beqz	a0,80007220 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80007200:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    80007204:	02400513          	li	a0,36
    asm volatile("ecall");
    80007208:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000720c:	00050513          	mv	a0,a0
    80007210:	0005051b          	sext.w	a0,a0
    return ret;
}
    80007214:	00813403          	ld	s0,8(sp)
    80007218:	01010113          	addi	sp,sp,16
    8000721c:	00008067          	ret
    if(id == nullptr) return -1;
    80007220:	fff00513          	li	a0,-1
    80007224:	ff1ff06f          	j	80007214 <sem_signal+0x24>

0000000080007228 <time_sleep>:

extern "C" int time_sleep(time_t time){
    80007228:	ff010113          	addi	sp,sp,-16
    8000722c:	00813423          	sd	s0,8(sp)
    80007230:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    80007234:	02050263          	beqz	a0,80007258 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    80007238:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    8000723c:	03100513          	li	a0,49
    asm volatile("ecall");
    80007240:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80007244:	00050513          	mv	a0,a0
    80007248:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000724c:	00813403          	ld	s0,8(sp)
    80007250:	01010113          	addi	sp,sp,16
    80007254:	00008067          	ret
    if(time == 0) return -1;
    80007258:	fff00513          	li	a0,-1
    8000725c:	ff1ff06f          	j	8000724c <time_sleep+0x24>

0000000080007260 <getc>:

const int EOF = -1;
extern "C" char getc(){
    80007260:	ff010113          	addi	sp,sp,-16
    80007264:	00813423          	sd	s0,8(sp)
    80007268:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    8000726c:	04100513          	li	a0,65
    asm volatile("ecall");
    80007270:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80007274:	00050513          	mv	a0,a0
    80007278:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    8000727c:	0ff00793          	li	a5,255
    80007280:	00a7ea63          	bltu	a5,a0,80007294 <getc+0x34>
    80007284:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    80007288:	00813403          	ld	s0,8(sp)
    8000728c:	01010113          	addi	sp,sp,16
    80007290:	00008067          	ret
    else return EOF;
    80007294:	0ff00513          	li	a0,255
    80007298:	ff1ff06f          	j	80007288 <getc+0x28>

000000008000729c <putc>:

extern "C" void putc(char c){
    8000729c:	ff010113          	addi	sp,sp,-16
    800072a0:	00813423          	sd	s0,8(sp)
    800072a4:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    800072a8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    800072ac:	04200513          	li	a0,66
    asm volatile("ecall");
    800072b0:	00000073          	ecall
    800072b4:	00813403          	ld	s0,8(sp)
    800072b8:	01010113          	addi	sp,sp,16
    800072bc:	00008067          	ret

00000000800072c0 <_ZN6Thread10runWrapperEPv>:
        thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    800072c0:	ff010113          	addi	sp,sp,-16
    800072c4:	00113423          	sd	ra,8(sp)
    800072c8:	00813023          	sd	s0,0(sp)
    800072cc:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    800072d0:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    800072d4:	0107b783          	ld	a5,16(a5)
    800072d8:	000780e7          	jalr	a5
}
    800072dc:	00813083          	ld	ra,8(sp)
    800072e0:	00013403          	ld	s0,0(sp)
    800072e4:	01010113          	addi	sp,sp,16
    800072e8:	00008067          	ret

00000000800072ec <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    800072ec:	fe010113          	addi	sp,sp,-32
    800072f0:	00113c23          	sd	ra,24(sp)
    800072f4:	00813823          	sd	s0,16(sp)
    800072f8:	00913423          	sd	s1,8(sp)
    800072fc:	02010413          	addi	s0,sp,32
    80007300:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    80007304:	02050263          	beqz	a0,80007328 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    80007308:	0004b503          	ld	a0,0(s1)
    8000730c:	00053783          	ld	a5,0(a0)
    80007310:	0187b783          	ld	a5,24(a5)
    80007314:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80007318:	0084b503          	ld	a0,8(s1)
    8000731c:	00000097          	auipc	ra,0x0
    80007320:	f0c080e7          	jalr	-244(ra) # 80007228 <time_sleep>
    80007324:	fe5ff06f          	j	80007308 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    80007328:	01813083          	ld	ra,24(sp)
    8000732c:	01013403          	ld	s0,16(sp)
    80007330:	00813483          	ld	s1,8(sp)
    80007334:	02010113          	addi	sp,sp,32
    80007338:	00008067          	ret

000000008000733c <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    8000733c:	ff010113          	addi	sp,sp,-16
    80007340:	00113423          	sd	ra,8(sp)
    80007344:	00813023          	sd	s0,0(sp)
    80007348:	01010413          	addi	s0,sp,16
    8000734c:	00000097          	auipc	ra,0x0
    80007350:	cb4080e7          	jalr	-844(ra) # 80007000 <mem_alloc>
    80007354:	00813083          	ld	ra,8(sp)
    80007358:	00013403          	ld	s0,0(sp)
    8000735c:	01010113          	addi	sp,sp,16
    80007360:	00008067          	ret

0000000080007364 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    80007364:	ff010113          	addi	sp,sp,-16
    80007368:	00113423          	sd	ra,8(sp)
    8000736c:	00813023          	sd	s0,0(sp)
    80007370:	01010413          	addi	s0,sp,16
    80007374:	00000097          	auipc	ra,0x0
    80007378:	cc4080e7          	jalr	-828(ra) # 80007038 <mem_free>
    8000737c:	00813083          	ld	ra,8(sp)
    80007380:	00013403          	ld	s0,0(sp)
    80007384:	01010113          	addi	sp,sp,16
    80007388:	00008067          	ret

000000008000738c <_ZN6ThreadD1Ev>:
Thread::~Thread()
    8000738c:	ff010113          	addi	sp,sp,-16
    80007390:	00113423          	sd	ra,8(sp)
    80007394:	00813023          	sd	s0,0(sp)
    80007398:	01010413          	addi	s0,sp,16
    8000739c:	00002797          	auipc	a5,0x2
    800073a0:	fec78793          	addi	a5,a5,-20 # 80009388 <_ZTV6Thread+0x10>
    800073a4:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    800073a8:	00853503          	ld	a0,8(a0)
    delete w->handle;
    800073ac:	00053783          	ld	a5,0(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    800073b0:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800073b4:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800073b8:	00000073          	ecall
    delete w;
    800073bc:	00000097          	auipc	ra,0x0
    800073c0:	fa8080e7          	jalr	-88(ra) # 80007364 <_ZdlPv>
}
    800073c4:	00813083          	ld	ra,8(sp)
    800073c8:	00013403          	ld	s0,0(sp)
    800073cc:	01010113          	addi	sp,sp,16
    800073d0:	00008067          	ret

00000000800073d4 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    800073d4:	fe010113          	addi	sp,sp,-32
    800073d8:	00113c23          	sd	ra,24(sp)
    800073dc:	00813823          	sd	s0,16(sp)
    800073e0:	00913423          	sd	s1,8(sp)
    800073e4:	02010413          	addi	s0,sp,32
    800073e8:	00050493          	mv	s1,a0
}
    800073ec:	00000097          	auipc	ra,0x0
    800073f0:	fa0080e7          	jalr	-96(ra) # 8000738c <_ZN6ThreadD1Ev>
    800073f4:	00048513          	mv	a0,s1
    800073f8:	00000097          	auipc	ra,0x0
    800073fc:	f6c080e7          	jalr	-148(ra) # 80007364 <_ZdlPv>
    80007400:	01813083          	ld	ra,24(sp)
    80007404:	01013403          	ld	s0,16(sp)
    80007408:	00813483          	ld	s1,8(sp)
    8000740c:	02010113          	addi	sp,sp,32
    80007410:	00008067          	ret

0000000080007414 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    80007414:	ff010113          	addi	sp,sp,-16
    80007418:	00113423          	sd	ra,8(sp)
    8000741c:	00813023          	sd	s0,0(sp)
    80007420:	01010413          	addi	s0,sp,16
    80007424:	00000097          	auipc	ra,0x0
    80007428:	bdc080e7          	jalr	-1060(ra) # 80007000 <mem_alloc>
    8000742c:	00813083          	ld	ra,8(sp)
    80007430:	00013403          	ld	s0,0(sp)
    80007434:	01010113          	addi	sp,sp,16
    80007438:	00008067          	ret

000000008000743c <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    8000743c:	ff010113          	addi	sp,sp,-16
    80007440:	00113423          	sd	ra,8(sp)
    80007444:	00813023          	sd	s0,0(sp)
    80007448:	01010413          	addi	s0,sp,16
    8000744c:	00000097          	auipc	ra,0x0
    80007450:	bec080e7          	jalr	-1044(ra) # 80007038 <mem_free>
    80007454:	00813083          	ld	ra,8(sp)
    80007458:	00013403          	ld	s0,0(sp)
    8000745c:	01010113          	addi	sp,sp,16
    80007460:	00008067          	ret

0000000080007464 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    80007464:	fd010113          	addi	sp,sp,-48
    80007468:	02113423          	sd	ra,40(sp)
    8000746c:	02813023          	sd	s0,32(sp)
    80007470:	00913c23          	sd	s1,24(sp)
    80007474:	01213823          	sd	s2,16(sp)
    80007478:	01313423          	sd	s3,8(sp)
    8000747c:	03010413          	addi	s0,sp,48
    80007480:	00050493          	mv	s1,a0
    80007484:	00058993          	mv	s3,a1
    80007488:	00060913          	mv	s2,a2
    8000748c:	00002797          	auipc	a5,0x2
    80007490:	efc78793          	addi	a5,a5,-260 # 80009388 <_ZTV6Thread+0x10>
    80007494:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    80007498:	01800513          	li	a0,24
    8000749c:	00000097          	auipc	ra,0x0
    800074a0:	ea0080e7          	jalr	-352(ra) # 8000733c <_Znwm>
    800074a4:	00053023          	sd	zero,0(a0)
    800074a8:	01353423          	sd	s3,8(a0)
    800074ac:	01253823          	sd	s2,16(a0)
    800074b0:	00a4b423          	sd	a0,8(s1)
}
    800074b4:	02813083          	ld	ra,40(sp)
    800074b8:	02013403          	ld	s0,32(sp)
    800074bc:	01813483          	ld	s1,24(sp)
    800074c0:	01013903          	ld	s2,16(sp)
    800074c4:	00813983          	ld	s3,8(sp)
    800074c8:	03010113          	addi	sp,sp,48
    800074cc:	00008067          	ret

00000000800074d0 <_ZN6Thread5startEv>:
void Thread::start(){
    800074d0:	fe010113          	addi	sp,sp,-32
    800074d4:	00113c23          	sd	ra,24(sp)
    800074d8:	00813823          	sd	s0,16(sp)
    800074dc:	00913423          	sd	s1,8(sp)
    800074e0:	02010413          	addi	s0,sp,32
    800074e4:	00050493          	mv	s1,a0
    if(myHandle)
    800074e8:	00853503          	ld	a0,8(a0)
    800074ec:	02050463          	beqz	a0,80007514 <_ZN6Thread5startEv+0x44>
        thread_create(&w->handle, w->body, w->arg);    
    800074f0:	01053603          	ld	a2,16(a0)
    800074f4:	00853583          	ld	a1,8(a0)
    800074f8:	00000097          	auipc	ra,0x0
    800074fc:	b94080e7          	jalr	-1132(ra) # 8000708c <thread_create>
}
    80007500:	01813083          	ld	ra,24(sp)
    80007504:	01013403          	ld	s0,16(sp)
    80007508:	00813483          	ld	s1,8(sp)
    8000750c:	02010113          	addi	sp,sp,32
    80007510:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    80007514:	01800513          	li	a0,24
    80007518:	00000097          	auipc	ra,0x0
    8000751c:	e24080e7          	jalr	-476(ra) # 8000733c <_Znwm>
    80007520:	00053023          	sd	zero,0(a0)
    80007524:	00053423          	sd	zero,8(a0)
    80007528:	00053823          	sd	zero,16(a0)
        myHandle = (thread_t)w;
    8000752c:	00a4b423          	sd	a0,8(s1)
        thread_create(&w->handle, &runWrapper, this);   
    80007530:	00048613          	mv	a2,s1
    80007534:	00000597          	auipc	a1,0x0
    80007538:	d8c58593          	addi	a1,a1,-628 # 800072c0 <_ZN6Thread10runWrapperEPv>
    8000753c:	00000097          	auipc	ra,0x0
    80007540:	b50080e7          	jalr	-1200(ra) # 8000708c <thread_create>
}
    80007544:	fbdff06f          	j	80007500 <_ZN6Thread5startEv+0x30>

0000000080007548 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    80007548:	fe010113          	addi	sp,sp,-32
    8000754c:	00113c23          	sd	ra,24(sp)
    80007550:	00813823          	sd	s0,16(sp)
    80007554:	00913423          	sd	s1,8(sp)
    80007558:	01213023          	sd	s2,0(sp)
    8000755c:	02010413          	addi	s0,sp,32
    80007560:	00050493          	mv	s1,a0
    80007564:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    80007568:	01000513          	li	a0,16
    8000756c:	00000097          	auipc	ra,0x0
    80007570:	dd0080e7          	jalr	-560(ra) # 8000733c <_Znwm>
    80007574:	00050613          	mv	a2,a0
    80007578:	00953023          	sd	s1,0(a0)
    8000757c:	01253423          	sd	s2,8(a0)
    80007580:	00000597          	auipc	a1,0x0
    80007584:	d6c58593          	addi	a1,a1,-660 # 800072ec <_ZN14PeriodicThread15periodicWrapperEPv>
    80007588:	00048513          	mv	a0,s1
    8000758c:	00000097          	auipc	ra,0x0
    80007590:	ed8080e7          	jalr	-296(ra) # 80007464 <_ZN6ThreadC1EPFvPvES0_>
    80007594:	00002797          	auipc	a5,0x2
    80007598:	dc478793          	addi	a5,a5,-572 # 80009358 <_ZTV14PeriodicThread+0x10>
    8000759c:	00f4b023          	sd	a5,0(s1)
    800075a0:	01813083          	ld	ra,24(sp)
    800075a4:	01013403          	ld	s0,16(sp)
    800075a8:	00813483          	ld	s1,8(sp)
    800075ac:	00013903          	ld	s2,0(sp)
    800075b0:	02010113          	addi	sp,sp,32
    800075b4:	00008067          	ret

00000000800075b8 <_ZN6Thread3runEv>:
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    800075b8:	ff010113          	addi	sp,sp,-16
    800075bc:	00813423          	sd	s0,8(sp)
    800075c0:	01010413          	addi	s0,sp,16
    800075c4:	00813403          	ld	s0,8(sp)
    800075c8:	01010113          	addi	sp,sp,16
    800075cc:	00008067          	ret

00000000800075d0 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800075d0:	ff010113          	addi	sp,sp,-16
    800075d4:	00813423          	sd	s0,8(sp)
    800075d8:	01010413          	addi	s0,sp,16
    800075dc:	00813403          	ld	s0,8(sp)
    800075e0:	01010113          	addi	sp,sp,16
    800075e4:	00008067          	ret

00000000800075e8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800075e8:	ff010113          	addi	sp,sp,-16
    800075ec:	00113423          	sd	ra,8(sp)
    800075f0:	00813023          	sd	s0,0(sp)
    800075f4:	01010413          	addi	s0,sp,16
    800075f8:	00002797          	auipc	a5,0x2
    800075fc:	d6078793          	addi	a5,a5,-672 # 80009358 <_ZTV14PeriodicThread+0x10>
    80007600:	00f53023          	sd	a5,0(a0)
    80007604:	00000097          	auipc	ra,0x0
    80007608:	d88080e7          	jalr	-632(ra) # 8000738c <_ZN6ThreadD1Ev>
    8000760c:	00813083          	ld	ra,8(sp)
    80007610:	00013403          	ld	s0,0(sp)
    80007614:	01010113          	addi	sp,sp,16
    80007618:	00008067          	ret

000000008000761c <_ZN14PeriodicThreadD0Ev>:
    8000761c:	fe010113          	addi	sp,sp,-32
    80007620:	00113c23          	sd	ra,24(sp)
    80007624:	00813823          	sd	s0,16(sp)
    80007628:	00913423          	sd	s1,8(sp)
    8000762c:	02010413          	addi	s0,sp,32
    80007630:	00050493          	mv	s1,a0
    80007634:	00002797          	auipc	a5,0x2
    80007638:	d2478793          	addi	a5,a5,-732 # 80009358 <_ZTV14PeriodicThread+0x10>
    8000763c:	00f53023          	sd	a5,0(a0)
    80007640:	00000097          	auipc	ra,0x0
    80007644:	d4c080e7          	jalr	-692(ra) # 8000738c <_ZN6ThreadD1Ev>
    80007648:	00048513          	mv	a0,s1
    8000764c:	00000097          	auipc	ra,0x0
    80007650:	d18080e7          	jalr	-744(ra) # 80007364 <_ZdlPv>
    80007654:	01813083          	ld	ra,24(sp)
    80007658:	01013403          	ld	s0,16(sp)
    8000765c:	00813483          	ld	s1,8(sp)
    80007660:	02010113          	addi	sp,sp,32
    80007664:	00008067          	ret

0000000080007668 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80007668:	fd010113          	addi	sp,sp,-48
    8000766c:	02113423          	sd	ra,40(sp)
    80007670:	02813023          	sd	s0,32(sp)
    80007674:	00913c23          	sd	s1,24(sp)
    80007678:	01213823          	sd	s2,16(sp)
    8000767c:	01313423          	sd	s3,8(sp)
    80007680:	03010413          	addi	s0,sp,48
    80007684:	00050493          	mv	s1,a0
    80007688:	00058993          	mv	s3,a1
    8000768c:	0015879b          	addiw	a5,a1,1
    80007690:	0007851b          	sext.w	a0,a5
    80007694:	00f4a023          	sw	a5,0(s1)
    80007698:	0004a823          	sw	zero,16(s1)
    8000769c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800076a0:	00251513          	slli	a0,a0,0x2
    800076a4:	00000097          	auipc	ra,0x0
    800076a8:	95c080e7          	jalr	-1700(ra) # 80007000 <mem_alloc>
    800076ac:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800076b0:	01000513          	li	a0,16
    800076b4:	00000097          	auipc	ra,0x0
    800076b8:	c88080e7          	jalr	-888(ra) # 8000733c <_Znwm>
    800076bc:	00050913          	mv	s2,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    800076c0:	00002797          	auipc	a5,0x2
    800076c4:	cf078793          	addi	a5,a5,-784 # 800093b0 <_ZTV9Semaphore+0x10>
    800076c8:	00f53023          	sd	a5,0(a0)
    800076cc:	00000593          	li	a1,0
    800076d0:	00850513          	addi	a0,a0,8
    800076d4:	00000097          	auipc	ra,0x0
    800076d8:	a70080e7          	jalr	-1424(ra) # 80007144 <sem_open>
    800076dc:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800076e0:	01000513          	li	a0,16
    800076e4:	00000097          	auipc	ra,0x0
    800076e8:	c58080e7          	jalr	-936(ra) # 8000733c <_Znwm>
    800076ec:	00050913          	mv	s2,a0
    800076f0:	00002797          	auipc	a5,0x2
    800076f4:	cc078793          	addi	a5,a5,-832 # 800093b0 <_ZTV9Semaphore+0x10>
    800076f8:	00f53023          	sd	a5,0(a0)
    800076fc:	00098593          	mv	a1,s3
    80007700:	00850513          	addi	a0,a0,8
    80007704:	00000097          	auipc	ra,0x0
    80007708:	a40080e7          	jalr	-1472(ra) # 80007144 <sem_open>
    8000770c:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    80007710:	01000513          	li	a0,16
    80007714:	00000097          	auipc	ra,0x0
    80007718:	c28080e7          	jalr	-984(ra) # 8000733c <_Znwm>
    8000771c:	00050913          	mv	s2,a0
    80007720:	00002797          	auipc	a5,0x2
    80007724:	c9078793          	addi	a5,a5,-880 # 800093b0 <_ZTV9Semaphore+0x10>
    80007728:	00f53023          	sd	a5,0(a0)
    8000772c:	00100593          	li	a1,1
    80007730:	00850513          	addi	a0,a0,8
    80007734:	00000097          	auipc	ra,0x0
    80007738:	a10080e7          	jalr	-1520(ra) # 80007144 <sem_open>
    8000773c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80007740:	01000513          	li	a0,16
    80007744:	00000097          	auipc	ra,0x0
    80007748:	bf8080e7          	jalr	-1032(ra) # 8000733c <_Znwm>
    8000774c:	00050913          	mv	s2,a0
    80007750:	00002797          	auipc	a5,0x2
    80007754:	c6078793          	addi	a5,a5,-928 # 800093b0 <_ZTV9Semaphore+0x10>
    80007758:	00f53023          	sd	a5,0(a0)
    8000775c:	00100593          	li	a1,1
    80007760:	00850513          	addi	a0,a0,8
    80007764:	00000097          	auipc	ra,0x0
    80007768:	9e0080e7          	jalr	-1568(ra) # 80007144 <sem_open>
    8000776c:	0324b823          	sd	s2,48(s1)
}
    80007770:	02813083          	ld	ra,40(sp)
    80007774:	02013403          	ld	s0,32(sp)
    80007778:	01813483          	ld	s1,24(sp)
    8000777c:	01013903          	ld	s2,16(sp)
    80007780:	00813983          	ld	s3,8(sp)
    80007784:	03010113          	addi	sp,sp,48
    80007788:	00008067          	ret
    8000778c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80007790:	00090513          	mv	a0,s2
    80007794:	00000097          	auipc	ra,0x0
    80007798:	bd0080e7          	jalr	-1072(ra) # 80007364 <_ZdlPv>
    8000779c:	00048513          	mv	a0,s1
    800077a0:	00004097          	auipc	ra,0x4
    800077a4:	7b8080e7          	jalr	1976(ra) # 8000bf58 <_Unwind_Resume>
    800077a8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800077ac:	00090513          	mv	a0,s2
    800077b0:	00000097          	auipc	ra,0x0
    800077b4:	bb4080e7          	jalr	-1100(ra) # 80007364 <_ZdlPv>
    800077b8:	00048513          	mv	a0,s1
    800077bc:	00004097          	auipc	ra,0x4
    800077c0:	79c080e7          	jalr	1948(ra) # 8000bf58 <_Unwind_Resume>
    800077c4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800077c8:	00090513          	mv	a0,s2
    800077cc:	00000097          	auipc	ra,0x0
    800077d0:	b98080e7          	jalr	-1128(ra) # 80007364 <_ZdlPv>
    800077d4:	00048513          	mv	a0,s1
    800077d8:	00004097          	auipc	ra,0x4
    800077dc:	780080e7          	jalr	1920(ra) # 8000bf58 <_Unwind_Resume>
    800077e0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800077e4:	00090513          	mv	a0,s2
    800077e8:	00000097          	auipc	ra,0x0
    800077ec:	b7c080e7          	jalr	-1156(ra) # 80007364 <_ZdlPv>
    800077f0:	00048513          	mv	a0,s1
    800077f4:	00004097          	auipc	ra,0x4
    800077f8:	764080e7          	jalr	1892(ra) # 8000bf58 <_Unwind_Resume>

00000000800077fc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800077fc:	fe010113          	addi	sp,sp,-32
    80007800:	00113c23          	sd	ra,24(sp)
    80007804:	00813823          	sd	s0,16(sp)
    80007808:	00913423          	sd	s1,8(sp)
    8000780c:	01213023          	sd	s2,0(sp)
    80007810:	02010413          	addi	s0,sp,32
    80007814:	00050493          	mv	s1,a0
    80007818:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000781c:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80007820:	0087b503          	ld	a0,8(a5)
    80007824:	00000097          	auipc	ra,0x0
    80007828:	994080e7          	jalr	-1644(ra) # 800071b8 <sem_wait>

    mutexTail->wait();
    8000782c:	0304b783          	ld	a5,48(s1)
    80007830:	0087b503          	ld	a0,8(a5)
    80007834:	00000097          	auipc	ra,0x0
    80007838:	984080e7          	jalr	-1660(ra) # 800071b8 <sem_wait>
    buffer[tail] = val;
    8000783c:	0084b783          	ld	a5,8(s1)
    80007840:	0144a703          	lw	a4,20(s1)
    80007844:	00271713          	slli	a4,a4,0x2
    80007848:	00e787b3          	add	a5,a5,a4
    8000784c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007850:	0144a783          	lw	a5,20(s1)
    80007854:	0017879b          	addiw	a5,a5,1
    80007858:	0004a703          	lw	a4,0(s1)
    8000785c:	02e7e7bb          	remw	a5,a5,a4
    80007860:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80007864:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80007868:	0087b503          	ld	a0,8(a5)
    8000786c:	00000097          	auipc	ra,0x0
    80007870:	984080e7          	jalr	-1660(ra) # 800071f0 <sem_signal>

    itemAvailable->signal();
    80007874:	0204b783          	ld	a5,32(s1)
    80007878:	0087b503          	ld	a0,8(a5)
    8000787c:	00000097          	auipc	ra,0x0
    80007880:	974080e7          	jalr	-1676(ra) # 800071f0 <sem_signal>

}
    80007884:	01813083          	ld	ra,24(sp)
    80007888:	01013403          	ld	s0,16(sp)
    8000788c:	00813483          	ld	s1,8(sp)
    80007890:	00013903          	ld	s2,0(sp)
    80007894:	02010113          	addi	sp,sp,32
    80007898:	00008067          	ret

000000008000789c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000789c:	fe010113          	addi	sp,sp,-32
    800078a0:	00113c23          	sd	ra,24(sp)
    800078a4:	00813823          	sd	s0,16(sp)
    800078a8:	00913423          	sd	s1,8(sp)
    800078ac:	01213023          	sd	s2,0(sp)
    800078b0:	02010413          	addi	s0,sp,32
    800078b4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800078b8:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    800078bc:	0087b503          	ld	a0,8(a5)
    800078c0:	00000097          	auipc	ra,0x0
    800078c4:	8f8080e7          	jalr	-1800(ra) # 800071b8 <sem_wait>

    mutexHead->wait();
    800078c8:	0284b783          	ld	a5,40(s1)
    800078cc:	0087b503          	ld	a0,8(a5)
    800078d0:	00000097          	auipc	ra,0x0
    800078d4:	8e8080e7          	jalr	-1816(ra) # 800071b8 <sem_wait>

    int ret = buffer[head];
    800078d8:	0084b703          	ld	a4,8(s1)
    800078dc:	0104a783          	lw	a5,16(s1)
    800078e0:	00279693          	slli	a3,a5,0x2
    800078e4:	00d70733          	add	a4,a4,a3
    800078e8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800078ec:	0017879b          	addiw	a5,a5,1
    800078f0:	0004a703          	lw	a4,0(s1)
    800078f4:	02e7e7bb          	remw	a5,a5,a4
    800078f8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800078fc:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    80007900:	0087b503          	ld	a0,8(a5)
    80007904:	00000097          	auipc	ra,0x0
    80007908:	8ec080e7          	jalr	-1812(ra) # 800071f0 <sem_signal>

    spaceAvailable->signal();
    8000790c:	0184b783          	ld	a5,24(s1)
    80007910:	0087b503          	ld	a0,8(a5)
    80007914:	00000097          	auipc	ra,0x0
    80007918:	8dc080e7          	jalr	-1828(ra) # 800071f0 <sem_signal>

    return ret;
}
    8000791c:	00090513          	mv	a0,s2
    80007920:	01813083          	ld	ra,24(sp)
    80007924:	01013403          	ld	s0,16(sp)
    80007928:	00813483          	ld	s1,8(sp)
    8000792c:	00013903          	ld	s2,0(sp)
    80007930:	02010113          	addi	sp,sp,32
    80007934:	00008067          	ret

0000000080007938 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80007938:	fe010113          	addi	sp,sp,-32
    8000793c:	00113c23          	sd	ra,24(sp)
    80007940:	00813823          	sd	s0,16(sp)
    80007944:	00913423          	sd	s1,8(sp)
    80007948:	01213023          	sd	s2,0(sp)
    8000794c:	02010413          	addi	s0,sp,32
    80007950:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80007954:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    80007958:	0087b503          	ld	a0,8(a5)
    8000795c:	00000097          	auipc	ra,0x0
    80007960:	85c080e7          	jalr	-1956(ra) # 800071b8 <sem_wait>
    mutexTail->wait();
    80007964:	0304b783          	ld	a5,48(s1)
    80007968:	0087b503          	ld	a0,8(a5)
    8000796c:	00000097          	auipc	ra,0x0
    80007970:	84c080e7          	jalr	-1972(ra) # 800071b8 <sem_wait>

    if (tail >= head) {
    80007974:	0144a783          	lw	a5,20(s1)
    80007978:	0104a903          	lw	s2,16(s1)
    8000797c:	0527c263          	blt	a5,s2,800079c0 <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    80007980:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80007984:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80007988:	0087b503          	ld	a0,8(a5)
    8000798c:	00000097          	auipc	ra,0x0
    80007990:	864080e7          	jalr	-1948(ra) # 800071f0 <sem_signal>
    mutexHead->signal();
    80007994:	0284b783          	ld	a5,40(s1)
    80007998:	0087b503          	ld	a0,8(a5)
    8000799c:	00000097          	auipc	ra,0x0
    800079a0:	854080e7          	jalr	-1964(ra) # 800071f0 <sem_signal>

    return ret;
}
    800079a4:	00090513          	mv	a0,s2
    800079a8:	01813083          	ld	ra,24(sp)
    800079ac:	01013403          	ld	s0,16(sp)
    800079b0:	00813483          	ld	s1,8(sp)
    800079b4:	00013903          	ld	s2,0(sp)
    800079b8:	02010113          	addi	sp,sp,32
    800079bc:	00008067          	ret
        ret = cap - head + tail;
    800079c0:	0004a703          	lw	a4,0(s1)
    800079c4:	4127093b          	subw	s2,a4,s2
    800079c8:	00f9093b          	addw	s2,s2,a5
    800079cc:	fb9ff06f          	j	80007984 <_ZN9BufferCPP6getCntEv+0x4c>

00000000800079d0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800079d0:	fe010113          	addi	sp,sp,-32
    800079d4:	00113c23          	sd	ra,24(sp)
    800079d8:	00813823          	sd	s0,16(sp)
    800079dc:	00913423          	sd	s1,8(sp)
    800079e0:	02010413          	addi	s0,sp,32
    800079e4:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800079e8:	00a00513          	li	a0,10
    800079ec:	00000097          	auipc	ra,0x0
    800079f0:	8b0080e7          	jalr	-1872(ra) # 8000729c <putc>
    printString("Buffer deleted!\n");
    800079f4:	00002517          	auipc	a0,0x2
    800079f8:	9cc50513          	addi	a0,a0,-1588 # 800093c0 <_ZTV9Semaphore+0x20>
    800079fc:	00000097          	auipc	ra,0x0
    80007a00:	15c080e7          	jalr	348(ra) # 80007b58 <_Z11printStringPKc>
    while (getCnt()) {
    80007a04:	00048513          	mv	a0,s1
    80007a08:	00000097          	auipc	ra,0x0
    80007a0c:	f30080e7          	jalr	-208(ra) # 80007938 <_ZN9BufferCPP6getCntEv>
    80007a10:	02050c63          	beqz	a0,80007a48 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80007a14:	0084b783          	ld	a5,8(s1)
    80007a18:	0104a703          	lw	a4,16(s1)
    80007a1c:	00271713          	slli	a4,a4,0x2
    80007a20:	00e787b3          	add	a5,a5,a4
    80007a24:	0007c503          	lbu	a0,0(a5)
    80007a28:	00000097          	auipc	ra,0x0
    80007a2c:	874080e7          	jalr	-1932(ra) # 8000729c <putc>
        head = (head + 1) % cap;
    80007a30:	0104a783          	lw	a5,16(s1)
    80007a34:	0017879b          	addiw	a5,a5,1
    80007a38:	0004a703          	lw	a4,0(s1)
    80007a3c:	02e7e7bb          	remw	a5,a5,a4
    80007a40:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80007a44:	fc1ff06f          	j	80007a04 <_ZN9BufferCPPD1Ev+0x34>
    80007a48:	02100513          	li	a0,33
    80007a4c:	00000097          	auipc	ra,0x0
    80007a50:	850080e7          	jalr	-1968(ra) # 8000729c <putc>
    80007a54:	00a00513          	li	a0,10
    80007a58:	00000097          	auipc	ra,0x0
    80007a5c:	844080e7          	jalr	-1980(ra) # 8000729c <putc>
    mem_free(buffer);
    80007a60:	0084b503          	ld	a0,8(s1)
    80007a64:	fffff097          	auipc	ra,0xfffff
    80007a68:	5d4080e7          	jalr	1492(ra) # 80007038 <mem_free>
    delete itemAvailable;
    80007a6c:	0204b503          	ld	a0,32(s1)
    80007a70:	00050863          	beqz	a0,80007a80 <_ZN9BufferCPPD1Ev+0xb0>
    80007a74:	00053783          	ld	a5,0(a0)
    80007a78:	0087b783          	ld	a5,8(a5)
    80007a7c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80007a80:	0184b503          	ld	a0,24(s1)
    80007a84:	00050863          	beqz	a0,80007a94 <_ZN9BufferCPPD1Ev+0xc4>
    80007a88:	00053783          	ld	a5,0(a0)
    80007a8c:	0087b783          	ld	a5,8(a5)
    80007a90:	000780e7          	jalr	a5
    delete mutexTail;
    80007a94:	0304b503          	ld	a0,48(s1)
    80007a98:	00050863          	beqz	a0,80007aa8 <_ZN9BufferCPPD1Ev+0xd8>
    80007a9c:	00053783          	ld	a5,0(a0)
    80007aa0:	0087b783          	ld	a5,8(a5)
    80007aa4:	000780e7          	jalr	a5
    delete mutexHead;
    80007aa8:	0284b503          	ld	a0,40(s1)
    80007aac:	00050863          	beqz	a0,80007abc <_ZN9BufferCPPD1Ev+0xec>
    80007ab0:	00053783          	ld	a5,0(a0)
    80007ab4:	0087b783          	ld	a5,8(a5)
    80007ab8:	000780e7          	jalr	a5
}
    80007abc:	01813083          	ld	ra,24(sp)
    80007ac0:	01013403          	ld	s0,16(sp)
    80007ac4:	00813483          	ld	s1,8(sp)
    80007ac8:	02010113          	addi	sp,sp,32
    80007acc:	00008067          	ret

0000000080007ad0 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    80007ad0:	ff010113          	addi	sp,sp,-16
    80007ad4:	00113423          	sd	ra,8(sp)
    80007ad8:	00813023          	sd	s0,0(sp)
    80007adc:	01010413          	addi	s0,sp,16
    80007ae0:	00002797          	auipc	a5,0x2
    80007ae4:	8d078793          	addi	a5,a5,-1840 # 800093b0 <_ZTV9Semaphore+0x10>
    80007ae8:	00f53023          	sd	a5,0(a0)
    80007aec:	00853503          	ld	a0,8(a0)
    80007af0:	fffff097          	auipc	ra,0xfffff
    80007af4:	690080e7          	jalr	1680(ra) # 80007180 <sem_close>
    80007af8:	00813083          	ld	ra,8(sp)
    80007afc:	00013403          	ld	s0,0(sp)
    80007b00:	01010113          	addi	sp,sp,16
    80007b04:	00008067          	ret

0000000080007b08 <_ZN9SemaphoreD0Ev>:
    80007b08:	fe010113          	addi	sp,sp,-32
    80007b0c:	00113c23          	sd	ra,24(sp)
    80007b10:	00813823          	sd	s0,16(sp)
    80007b14:	00913423          	sd	s1,8(sp)
    80007b18:	02010413          	addi	s0,sp,32
    80007b1c:	00050493          	mv	s1,a0
    80007b20:	00002797          	auipc	a5,0x2
    80007b24:	89078793          	addi	a5,a5,-1904 # 800093b0 <_ZTV9Semaphore+0x10>
    80007b28:	00f53023          	sd	a5,0(a0)
    80007b2c:	00853503          	ld	a0,8(a0)
    80007b30:	fffff097          	auipc	ra,0xfffff
    80007b34:	650080e7          	jalr	1616(ra) # 80007180 <sem_close>
    80007b38:	00048513          	mv	a0,s1
    80007b3c:	00000097          	auipc	ra,0x0
    80007b40:	828080e7          	jalr	-2008(ra) # 80007364 <_ZdlPv>
    80007b44:	01813083          	ld	ra,24(sp)
    80007b48:	01013403          	ld	s0,16(sp)
    80007b4c:	00813483          	ld	s1,8(sp)
    80007b50:	02010113          	addi	sp,sp,32
    80007b54:	00008067          	ret

0000000080007b58 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007b58:	fe010113          	addi	sp,sp,-32
    80007b5c:	00113c23          	sd	ra,24(sp)
    80007b60:	00813823          	sd	s0,16(sp)
    80007b64:	00913423          	sd	s1,8(sp)
    80007b68:	02010413          	addi	s0,sp,32
    80007b6c:	00050493          	mv	s1,a0
    LOCK();
    80007b70:	00100613          	li	a2,1
    80007b74:	00000593          	li	a1,0
    80007b78:	00003517          	auipc	a0,0x3
    80007b7c:	27850513          	addi	a0,a0,632 # 8000adf0 <lockPrint>
    80007b80:	ffffc097          	auipc	ra,0xffffc
    80007b84:	590080e7          	jalr	1424(ra) # 80004110 <copy_and_swap>
    80007b88:	fe0514e3          	bnez	a0,80007b70 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007b8c:	0004c503          	lbu	a0,0(s1)
    80007b90:	00050a63          	beqz	a0,80007ba4 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80007b94:	fffff097          	auipc	ra,0xfffff
    80007b98:	708080e7          	jalr	1800(ra) # 8000729c <putc>
        string++;
    80007b9c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007ba0:	fedff06f          	j	80007b8c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80007ba4:	00000613          	li	a2,0
    80007ba8:	00100593          	li	a1,1
    80007bac:	00003517          	auipc	a0,0x3
    80007bb0:	24450513          	addi	a0,a0,580 # 8000adf0 <lockPrint>
    80007bb4:	ffffc097          	auipc	ra,0xffffc
    80007bb8:	55c080e7          	jalr	1372(ra) # 80004110 <copy_and_swap>
    80007bbc:	fe0514e3          	bnez	a0,80007ba4 <_Z11printStringPKc+0x4c>
}
    80007bc0:	01813083          	ld	ra,24(sp)
    80007bc4:	01013403          	ld	s0,16(sp)
    80007bc8:	00813483          	ld	s1,8(sp)
    80007bcc:	02010113          	addi	sp,sp,32
    80007bd0:	00008067          	ret

0000000080007bd4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80007bd4:	fd010113          	addi	sp,sp,-48
    80007bd8:	02113423          	sd	ra,40(sp)
    80007bdc:	02813023          	sd	s0,32(sp)
    80007be0:	00913c23          	sd	s1,24(sp)
    80007be4:	01213823          	sd	s2,16(sp)
    80007be8:	01313423          	sd	s3,8(sp)
    80007bec:	01413023          	sd	s4,0(sp)
    80007bf0:	03010413          	addi	s0,sp,48
    80007bf4:	00050993          	mv	s3,a0
    80007bf8:	00058a13          	mv	s4,a1
    LOCK();
    80007bfc:	00100613          	li	a2,1
    80007c00:	00000593          	li	a1,0
    80007c04:	00003517          	auipc	a0,0x3
    80007c08:	1ec50513          	addi	a0,a0,492 # 8000adf0 <lockPrint>
    80007c0c:	ffffc097          	auipc	ra,0xffffc
    80007c10:	504080e7          	jalr	1284(ra) # 80004110 <copy_and_swap>
    80007c14:	fe0514e3          	bnez	a0,80007bfc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007c18:	00000493          	li	s1,0
    80007c1c:	0014891b          	addiw	s2,s1,1
    80007c20:	03495a63          	bge	s2,s4,80007c54 <_Z9getStringPci+0x80>
        cc = getc();
    80007c24:	fffff097          	auipc	ra,0xfffff
    80007c28:	63c080e7          	jalr	1596(ra) # 80007260 <getc>
        if(cc < 1)
    80007c2c:	02050463          	beqz	a0,80007c54 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80007c30:	009984b3          	add	s1,s3,s1
    80007c34:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007c38:	00a00793          	li	a5,10
    80007c3c:	00f50a63          	beq	a0,a5,80007c50 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80007c40:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80007c44:	00d00793          	li	a5,13
    80007c48:	fcf51ae3          	bne	a0,a5,80007c1c <_Z9getStringPci+0x48>
    80007c4c:	0080006f          	j	80007c54 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80007c50:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007c54:	009984b3          	add	s1,s3,s1
    80007c58:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007c5c:	00000613          	li	a2,0
    80007c60:	00100593          	li	a1,1
    80007c64:	00003517          	auipc	a0,0x3
    80007c68:	18c50513          	addi	a0,a0,396 # 8000adf0 <lockPrint>
    80007c6c:	ffffc097          	auipc	ra,0xffffc
    80007c70:	4a4080e7          	jalr	1188(ra) # 80004110 <copy_and_swap>
    80007c74:	fe0514e3          	bnez	a0,80007c5c <_Z9getStringPci+0x88>
    return buf;
}
    80007c78:	00098513          	mv	a0,s3
    80007c7c:	02813083          	ld	ra,40(sp)
    80007c80:	02013403          	ld	s0,32(sp)
    80007c84:	01813483          	ld	s1,24(sp)
    80007c88:	01013903          	ld	s2,16(sp)
    80007c8c:	00813983          	ld	s3,8(sp)
    80007c90:	00013a03          	ld	s4,0(sp)
    80007c94:	03010113          	addi	sp,sp,48
    80007c98:	00008067          	ret

0000000080007c9c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80007c9c:	ff010113          	addi	sp,sp,-16
    80007ca0:	00813423          	sd	s0,8(sp)
    80007ca4:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    80007ca8:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    80007cac:	00054603          	lbu	a2,0(a0)
    80007cb0:	fd06069b          	addiw	a3,a2,-48
    80007cb4:	0ff6f693          	andi	a3,a3,255
    80007cb8:	00900713          	li	a4,9
    80007cbc:	02d76063          	bltu	a4,a3,80007cdc <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    80007cc0:	0027969b          	slliw	a3,a5,0x2
    80007cc4:	00f687bb          	addw	a5,a3,a5
    80007cc8:	0017971b          	slliw	a4,a5,0x1
    80007ccc:	00150513          	addi	a0,a0,1
    80007cd0:	00c707bb          	addw	a5,a4,a2
    80007cd4:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    80007cd8:	fd5ff06f          	j	80007cac <_Z11stringToIntPKc+0x10>
    return n;
}
    80007cdc:	00078513          	mv	a0,a5
    80007ce0:	00813403          	ld	s0,8(sp)
    80007ce4:	01010113          	addi	sp,sp,16
    80007ce8:	00008067          	ret

0000000080007cec <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    80007cec:	fc010113          	addi	sp,sp,-64
    80007cf0:	02113c23          	sd	ra,56(sp)
    80007cf4:	02813823          	sd	s0,48(sp)
    80007cf8:	02913423          	sd	s1,40(sp)
    80007cfc:	03213023          	sd	s2,32(sp)
    80007d00:	01313c23          	sd	s3,24(sp)
    80007d04:	04010413          	addi	s0,sp,64
    80007d08:	00050913          	mv	s2,a0
    80007d0c:	00058993          	mv	s3,a1
    LOCK();
    80007d10:	00100613          	li	a2,1
    80007d14:	00000593          	li	a1,0
    80007d18:	00003517          	auipc	a0,0x3
    80007d1c:	0d850513          	addi	a0,a0,216 # 8000adf0 <lockPrint>
    80007d20:	ffffc097          	auipc	ra,0xffffc
    80007d24:	3f0080e7          	jalr	1008(ra) # 80004110 <copy_and_swap>
    80007d28:	fe0514e3          	bnez	a0,80007d10 <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    80007d2c:	00000793          	li	a5,0
    80007d30:	0080006f          	j	80007d38 <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    80007d34:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    80007d38:	033976b3          	remu	a3,s2,s3
    80007d3c:	0017849b          	addiw	s1,a5,1
    80007d40:	00003717          	auipc	a4,0x3
    80007d44:	e8870713          	addi	a4,a4,-376 # 8000abc8 <digits>
    80007d48:	00d70733          	add	a4,a4,a3
    80007d4c:	00074703          	lbu	a4,0(a4)
    80007d50:	fd040693          	addi	a3,s0,-48
    80007d54:	00f687b3          	add	a5,a3,a5
    80007d58:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80007d5c:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    80007d60:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80007d64:	fd3978e3          	bgeu	s2,s3,80007d34 <_Z8printIntmi+0x48>

    while(--i >= 0)
    80007d68:	fff4849b          	addiw	s1,s1,-1
    80007d6c:	0004ce63          	bltz	s1,80007d88 <_Z8printIntmi+0x9c>
        putc(buf[i]);
    80007d70:	fd040793          	addi	a5,s0,-48
    80007d74:	009787b3          	add	a5,a5,s1
    80007d78:	ff07c503          	lbu	a0,-16(a5)
    80007d7c:	fffff097          	auipc	ra,0xfffff
    80007d80:	520080e7          	jalr	1312(ra) # 8000729c <putc>
    80007d84:	fe5ff06f          	j	80007d68 <_Z8printIntmi+0x7c>

    UNLOCK();
    80007d88:	00000613          	li	a2,0
    80007d8c:	00100593          	li	a1,1
    80007d90:	00003517          	auipc	a0,0x3
    80007d94:	06050513          	addi	a0,a0,96 # 8000adf0 <lockPrint>
    80007d98:	ffffc097          	auipc	ra,0xffffc
    80007d9c:	378080e7          	jalr	888(ra) # 80004110 <copy_and_swap>
    80007da0:	fe0514e3          	bnez	a0,80007d88 <_Z8printIntmi+0x9c>
    80007da4:	03813083          	ld	ra,56(sp)
    80007da8:	03013403          	ld	s0,48(sp)
    80007dac:	02813483          	ld	s1,40(sp)
    80007db0:	02013903          	ld	s2,32(sp)
    80007db4:	01813983          	ld	s3,24(sp)
    80007db8:	04010113          	addi	sp,sp,64
    80007dbc:	00008067          	ret

0000000080007dc0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    80007dc0:	f9010113          	addi	sp,sp,-112
    80007dc4:	06113423          	sd	ra,104(sp)
    80007dc8:	06813023          	sd	s0,96(sp)
    80007dcc:	04913c23          	sd	s1,88(sp)
    80007dd0:	05213823          	sd	s2,80(sp)
    80007dd4:	05313423          	sd	s3,72(sp)
    80007dd8:	05413023          	sd	s4,64(sp)
    80007ddc:	03513c23          	sd	s5,56(sp)
    80007de0:	03613823          	sd	s6,48(sp)
    80007de4:	03713423          	sd	s7,40(sp)
    80007de8:	03813023          	sd	s8,32(sp)
    80007dec:	07010413          	addi	s0,sp,112
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80007df0:	00010b93          	mv	s7,sp
        printString("Unesite broj proizvodjaca?\n");
    80007df4:	00001517          	auipc	a0,0x1
    80007df8:	65c50513          	addi	a0,a0,1628 # 80009450 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    80007dfc:	00000097          	auipc	ra,0x0
    80007e00:	d5c080e7          	jalr	-676(ra) # 80007b58 <_Z11printStringPKc>
        getString(input, 30);
    80007e04:	01e00593          	li	a1,30
    80007e08:	f9040513          	addi	a0,s0,-112
    80007e0c:	00000097          	auipc	ra,0x0
    80007e10:	dc8080e7          	jalr	-568(ra) # 80007bd4 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80007e14:	f9040513          	addi	a0,s0,-112
    80007e18:	00000097          	auipc	ra,0x0
    80007e1c:	e84080e7          	jalr	-380(ra) # 80007c9c <_Z11stringToIntPKc>
    80007e20:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    80007e24:	00001517          	auipc	a0,0x1
    80007e28:	64c50513          	addi	a0,a0,1612 # 80009470 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    80007e2c:	00000097          	auipc	ra,0x0
    80007e30:	d2c080e7          	jalr	-724(ra) # 80007b58 <_Z11printStringPKc>
        getString(input, 30);
    80007e34:	01e00593          	li	a1,30
    80007e38:	f9040513          	addi	a0,s0,-112
    80007e3c:	00000097          	auipc	ra,0x0
    80007e40:	d98080e7          	jalr	-616(ra) # 80007bd4 <_Z9getStringPci>
        n = stringToInt(input);
    80007e44:	f9040513          	addi	a0,s0,-112
    80007e48:	00000097          	auipc	ra,0x0
    80007e4c:	e54080e7          	jalr	-428(ra) # 80007c9c <_Z11stringToIntPKc>
    80007e50:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    80007e54:	00001517          	auipc	a0,0x1
    80007e58:	63c50513          	addi	a0,a0,1596 # 80009490 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    80007e5c:	00000097          	auipc	ra,0x0
    80007e60:	cfc080e7          	jalr	-772(ra) # 80007b58 <_Z11printStringPKc>
    80007e64:	00a00593          	li	a1,10
    80007e68:	00098513          	mv	a0,s3
    80007e6c:	00000097          	auipc	ra,0x0
    80007e70:	e80080e7          	jalr	-384(ra) # 80007cec <_Z8printIntmi>
        printString(" i velicina bafera "); printInt(n);
    80007e74:	00001517          	auipc	a0,0x1
    80007e78:	63450513          	addi	a0,a0,1588 # 800094a8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    80007e7c:	00000097          	auipc	ra,0x0
    80007e80:	cdc080e7          	jalr	-804(ra) # 80007b58 <_Z11printStringPKc>
    80007e84:	00a00593          	li	a1,10
    80007e88:	00048513          	mv	a0,s1
    80007e8c:	00000097          	auipc	ra,0x0
    80007e90:	e60080e7          	jalr	-416(ra) # 80007cec <_Z8printIntmi>
        printString(".\n");
    80007e94:	00001517          	auipc	a0,0x1
    80007e98:	62c50513          	addi	a0,a0,1580 # 800094c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    80007e9c:	00000097          	auipc	ra,0x0
    80007ea0:	cbc080e7          	jalr	-836(ra) # 80007b58 <_Z11printStringPKc>
        if(threadNum > n) {
    80007ea4:	0334c463          	blt	s1,s3,80007ecc <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x10c>
        } else if (threadNum < 1) {
    80007ea8:	03305c63          	blez	s3,80007ee0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x120>
        BufferCPP *buffer = new BufferCPP(n);
    80007eac:	03800513          	li	a0,56
    80007eb0:	fffff097          	auipc	ra,0xfffff
    80007eb4:	48c080e7          	jalr	1164(ra) # 8000733c <_Znwm>
    80007eb8:	00050a93          	mv	s5,a0
    80007ebc:	00048593          	mv	a1,s1
    80007ec0:	fffff097          	auipc	ra,0xfffff
    80007ec4:	7a8080e7          	jalr	1960(ra) # 80007668 <_ZN9BufferCPPC1Ei>
    80007ec8:	0300006f          	j	80007ef8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x138>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007ecc:	00001517          	auipc	a0,0x1
    80007ed0:	5fc50513          	addi	a0,a0,1532 # 800094c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    80007ed4:	00000097          	auipc	ra,0x0
    80007ed8:	c84080e7          	jalr	-892(ra) # 80007b58 <_Z11printStringPKc>
            return;
    80007edc:	0140006f          	j	80007ef0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007ee0:	00001517          	auipc	a0,0x1
    80007ee4:	62850513          	addi	a0,a0,1576 # 80009508 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    80007ee8:	00000097          	auipc	ra,0x0
    80007eec:	c70080e7          	jalr	-912(ra) # 80007b58 <_Z11printStringPKc>
            return;
    80007ef0:	000b8113          	mv	sp,s7
    80007ef4:	2140006f          	j	80008108 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x348>
        waitForAll = new Semaphore(0);
    80007ef8:	01000513          	li	a0,16
    80007efc:	fffff097          	auipc	ra,0xfffff
    80007f00:	440080e7          	jalr	1088(ra) # 8000733c <_Znwm>
    80007f04:	00050493          	mv	s1,a0
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80007f08:	00001797          	auipc	a5,0x1
    80007f0c:	4a878793          	addi	a5,a5,1192 # 800093b0 <_ZTV9Semaphore+0x10>
    80007f10:	00f53023          	sd	a5,0(a0)
    80007f14:	00000593          	li	a1,0
    80007f18:	00850513          	addi	a0,a0,8
    80007f1c:	fffff097          	auipc	ra,0xfffff
    80007f20:	228080e7          	jalr	552(ra) # 80007144 <sem_open>
    80007f24:	00003917          	auipc	s2,0x3
    80007f28:	edc90913          	addi	s2,s2,-292 # 8000ae00 <_ZN19ConsumerProducerCPP10waitForAllE>
    80007f2c:	00993023          	sd	s1,0(s2)
        Thread *producers[threadNum];
    80007f30:	00399793          	slli	a5,s3,0x3
    80007f34:	00f78793          	addi	a5,a5,15
    80007f38:	ff07f793          	andi	a5,a5,-16
    80007f3c:	40f10133          	sub	sp,sp,a5
    80007f40:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    80007f44:	0019879b          	addiw	a5,s3,1
    80007f48:	00179713          	slli	a4,a5,0x1
    80007f4c:	00f70733          	add	a4,a4,a5
    80007f50:	00371793          	slli	a5,a4,0x3
    80007f54:	00f78793          	addi	a5,a5,15
    80007f58:	ff07f793          	andi	a5,a5,-16
    80007f5c:	40f10133          	sub	sp,sp,a5
    80007f60:	00010c13          	mv	s8,sp
        threadData[threadNum].id = threadNum;
    80007f64:	00199793          	slli	a5,s3,0x1
    80007f68:	013787b3          	add	a5,a5,s3
    80007f6c:	00379493          	slli	s1,a5,0x3
    80007f70:	009c04b3          	add	s1,s8,s1
    80007f74:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    80007f78:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    80007f7c:	00093783          	ld	a5,0(s2)
    80007f80:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80007f84:	01800513          	li	a0,24
    80007f88:	fffff097          	auipc	ra,0xfffff
    80007f8c:	3b4080e7          	jalr	948(ra) # 8000733c <_Znwm>
    80007f90:	00050b13          	mv	s6,a0
    Thread (){ myHandle = nullptr;}
    80007f94:	00053423          	sd	zero,8(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    80007f98:	00001797          	auipc	a5,0x1
    80007f9c:	4a078793          	addi	a5,a5,1184 # 80009438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80007fa0:	00f53023          	sd	a5,0(a0)
    80007fa4:	00953823          	sd	s1,16(a0)
        consumer->start();
    80007fa8:	fffff097          	auipc	ra,0xfffff
    80007fac:	528080e7          	jalr	1320(ra) # 800074d0 <_ZN6Thread5startEv>
        threadData[0].id = 0;
    80007fb0:	000c2023          	sw	zero,0(s8)
        threadData[0].buffer = buffer;
    80007fb4:	015c3423          	sd	s5,8(s8)
        threadData[0].sem = waitForAll;
    80007fb8:	00093783          	ld	a5,0(s2)
    80007fbc:	00fc3823          	sd	a5,16(s8)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80007fc0:	01800513          	li	a0,24
    80007fc4:	fffff097          	auipc	ra,0xfffff
    80007fc8:	378080e7          	jalr	888(ra) # 8000733c <_Znwm>
    80007fcc:	00053423          	sd	zero,8(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80007fd0:	00001717          	auipc	a4,0x1
    80007fd4:	41870713          	addi	a4,a4,1048 # 800093e8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80007fd8:	00e53023          	sd	a4,0(a0)
    80007fdc:	01853823          	sd	s8,16(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80007fe0:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    80007fe4:	fffff097          	auipc	ra,0xfffff
    80007fe8:	4ec080e7          	jalr	1260(ra) # 800074d0 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80007fec:	00100913          	li	s2,1
    80007ff0:	07395463          	bge	s2,s3,80008058 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x298>
            threadData[i].id = i;
    80007ff4:	00191793          	slli	a5,s2,0x1
    80007ff8:	012787b3          	add	a5,a5,s2
    80007ffc:	00379493          	slli	s1,a5,0x3
    80008000:	009c04b3          	add	s1,s8,s1
    80008004:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    80008008:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    8000800c:	00003797          	auipc	a5,0x3
    80008010:	df478793          	addi	a5,a5,-524 # 8000ae00 <_ZN19ConsumerProducerCPP10waitForAllE>
    80008014:	0007b783          	ld	a5,0(a5)
    80008018:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    8000801c:	01800513          	li	a0,24
    80008020:	fffff097          	auipc	ra,0xfffff
    80008024:	31c080e7          	jalr	796(ra) # 8000733c <_Znwm>
    80008028:	00053423          	sd	zero,8(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    8000802c:	00001717          	auipc	a4,0x1
    80008030:	3e470713          	addi	a4,a4,996 # 80009410 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80008034:	00e53023          	sd	a4,0(a0)
    80008038:	00953823          	sd	s1,16(a0)
            producers[i] = new Producer(&threadData[i]);
    8000803c:	00391713          	slli	a4,s2,0x3
    80008040:	00ea0733          	add	a4,s4,a4
    80008044:	00a73023          	sd	a0,0(a4)
            producers[i]->start();
    80008048:	fffff097          	auipc	ra,0xfffff
    8000804c:	488080e7          	jalr	1160(ra) # 800074d0 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80008050:	0019091b          	addiw	s2,s2,1
    80008054:	f9dff06f          	j	80007ff0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x230>
    static void dispatch () { thread_dispatch(); }
    80008058:	fffff097          	auipc	ra,0xfffff
    8000805c:	010080e7          	jalr	16(ra) # 80007068 <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    80008060:	00000493          	li	s1,0
    80008064:	0299c263          	blt	s3,s1,80008088 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2c8>
            waitForAll->wait();
    80008068:	00003797          	auipc	a5,0x3
    8000806c:	d9878793          	addi	a5,a5,-616 # 8000ae00 <_ZN19ConsumerProducerCPP10waitForAllE>
    80008070:	0007b783          	ld	a5,0(a5)
    void wait (){ sem_wait(myHandle); }
    80008074:	0087b503          	ld	a0,8(a5)
    80008078:	fffff097          	auipc	ra,0xfffff
    8000807c:	140080e7          	jalr	320(ra) # 800071b8 <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    80008080:	0014849b          	addiw	s1,s1,1
    80008084:	fe1ff06f          	j	80008064 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2a4>
        delete waitForAll;
    80008088:	00003797          	auipc	a5,0x3
    8000808c:	d7878793          	addi	a5,a5,-648 # 8000ae00 <_ZN19ConsumerProducerCPP10waitForAllE>
    80008090:	0007b503          	ld	a0,0(a5)
    80008094:	00050863          	beqz	a0,800080a4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2e4>
    80008098:	00053783          	ld	a5,0(a0)
    8000809c:	0087b783          	ld	a5,8(a5)
    800080a0:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    800080a4:	00000493          	li	s1,0
    800080a8:	0080006f          	j	800080b0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f0>
        for (int i = 0; i < threadNum; i++) {
    800080ac:	0014849b          	addiw	s1,s1,1
    800080b0:	0334d263          	bge	s1,s3,800080d4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x314>
            delete producers[i];
    800080b4:	00349793          	slli	a5,s1,0x3
    800080b8:	00fa07b3          	add	a5,s4,a5
    800080bc:	0007b503          	ld	a0,0(a5)
    800080c0:	fe0506e3          	beqz	a0,800080ac <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
    800080c4:	00053783          	ld	a5,0(a0)
    800080c8:	0087b783          	ld	a5,8(a5)
    800080cc:	000780e7          	jalr	a5
    800080d0:	fddff06f          	j	800080ac <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
        delete consumer;
    800080d4:	000b0a63          	beqz	s6,800080e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x328>
    800080d8:	000b3783          	ld	a5,0(s6) # 2000 <_entry-0x7fffe000>
    800080dc:	0087b783          	ld	a5,8(a5)
    800080e0:	000b0513          	mv	a0,s6
    800080e4:	000780e7          	jalr	a5
        delete buffer;
    800080e8:	000a8e63          	beqz	s5,80008104 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x344>
    800080ec:	000a8513          	mv	a0,s5
    800080f0:	00000097          	auipc	ra,0x0
    800080f4:	8e0080e7          	jalr	-1824(ra) # 800079d0 <_ZN9BufferCPPD1Ev>
    800080f8:	000a8513          	mv	a0,s5
    800080fc:	fffff097          	auipc	ra,0xfffff
    80008100:	268080e7          	jalr	616(ra) # 80007364 <_ZdlPv>
    80008104:	000b8113          	mv	sp,s7
    }
    80008108:	f9040113          	addi	sp,s0,-112
    8000810c:	06813083          	ld	ra,104(sp)
    80008110:	06013403          	ld	s0,96(sp)
    80008114:	05813483          	ld	s1,88(sp)
    80008118:	05013903          	ld	s2,80(sp)
    8000811c:	04813983          	ld	s3,72(sp)
    80008120:	04013a03          	ld	s4,64(sp)
    80008124:	03813a83          	ld	s5,56(sp)
    80008128:	03013b03          	ld	s6,48(sp)
    8000812c:	02813b83          	ld	s7,40(sp)
    80008130:	02013c03          	ld	s8,32(sp)
    80008134:	07010113          	addi	sp,sp,112
    80008138:	00008067          	ret
    8000813c:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80008140:	000a8513          	mv	a0,s5
    80008144:	fffff097          	auipc	ra,0xfffff
    80008148:	220080e7          	jalr	544(ra) # 80007364 <_ZdlPv>
    8000814c:	00048513          	mv	a0,s1
    80008150:	00004097          	auipc	ra,0x4
    80008154:	e08080e7          	jalr	-504(ra) # 8000bf58 <_Unwind_Resume>
    80008158:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    8000815c:	00048513          	mv	a0,s1
    80008160:	fffff097          	auipc	ra,0xfffff
    80008164:	204080e7          	jalr	516(ra) # 80007364 <_ZdlPv>
    80008168:	00090513          	mv	a0,s2
    8000816c:	00004097          	auipc	ra,0x4
    80008170:	dec080e7          	jalr	-532(ra) # 8000bf58 <_Unwind_Resume>

0000000080008174 <_Z8userMainv>:
//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
//#include"test/testing.hpp"
//#include"../../h/syscall_c.h"
//#include"test/printing.hpp"
void userMain() {
    80008174:	ff010113          	addi	sp,sp,-16
    80008178:	00113423          	sd	ra,8(sp)
    8000817c:	00813023          	sd	s0,0(sp)
    80008180:	01010413          	addi	s0,sp,16

    //NZM? producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //NZM? producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80008184:	00000097          	auipc	ra,0x0
    80008188:	c3c080e7          	jalr	-964(ra) # 80007dc0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
    8000818c:	00813083          	ld	ra,8(sp)
    80008190:	00013403          	ld	s0,0(sp)
    80008194:	01010113          	addi	sp,sp,16
    80008198:	00008067          	ret

000000008000819c <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    8000819c:	fd010113          	addi	sp,sp,-48
    800081a0:	02113423          	sd	ra,40(sp)
    800081a4:	02813023          	sd	s0,32(sp)
    800081a8:	00913c23          	sd	s1,24(sp)
    800081ac:	01213823          	sd	s2,16(sp)
    800081b0:	01313423          	sd	s3,8(sp)
    800081b4:	03010413          	addi	s0,sp,48
    800081b8:	00050913          	mv	s2,a0
            int i = 0;
    800081bc:	00000993          	li	s3,0
    800081c0:	0100006f          	j	800081d0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    static void putc (char c){ ::putc(c); }
    800081c4:	00a00513          	li	a0,10
    800081c8:	fffff097          	auipc	ra,0xfffff
    800081cc:	0d4080e7          	jalr	212(ra) # 8000729c <putc>
            while (!threadEnd) {
    800081d0:	00003797          	auipc	a5,0x3
    800081d4:	c2878793          	addi	a5,a5,-984 # 8000adf8 <_ZN19ConsumerProducerCPP9threadEndE>
    800081d8:	0007a783          	lw	a5,0(a5)
    800081dc:	0007879b          	sext.w	a5,a5
    800081e0:	02079c63          	bnez	a5,80008218 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    800081e4:	01093783          	ld	a5,16(s2)
    800081e8:	0087b503          	ld	a0,8(a5)
    800081ec:	fffff097          	auipc	ra,0xfffff
    800081f0:	6b0080e7          	jalr	1712(ra) # 8000789c <_ZN9BufferCPP3getEv>
                i++;
    800081f4:	0019849b          	addiw	s1,s3,1
    800081f8:	0004899b          	sext.w	s3,s1
    800081fc:	0ff57513          	andi	a0,a0,255
    80008200:	fffff097          	auipc	ra,0xfffff
    80008204:	09c080e7          	jalr	156(ra) # 8000729c <putc>
                if (i % 80 == 0) {
    80008208:	05000793          	li	a5,80
    8000820c:	02f4e4bb          	remw	s1,s1,a5
    80008210:	fc0490e3          	bnez	s1,800081d0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80008214:	fb1ff06f          	j	800081c4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    80008218:	01093783          	ld	a5,16(s2)
    8000821c:	0087b503          	ld	a0,8(a5)
    80008220:	fffff097          	auipc	ra,0xfffff
    80008224:	718080e7          	jalr	1816(ra) # 80007938 <_ZN9BufferCPP6getCntEv>
    80008228:	02a05263          	blez	a0,8000824c <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    8000822c:	01093783          	ld	a5,16(s2)
    80008230:	0087b503          	ld	a0,8(a5)
    80008234:	fffff097          	auipc	ra,0xfffff
    80008238:	668080e7          	jalr	1640(ra) # 8000789c <_ZN9BufferCPP3getEv>
    8000823c:	0ff57513          	andi	a0,a0,255
    80008240:	fffff097          	auipc	ra,0xfffff
    80008244:	05c080e7          	jalr	92(ra) # 8000729c <putc>
    80008248:	fd1ff06f          	j	80008218 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    8000824c:	01093783          	ld	a5,16(s2)
    80008250:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80008254:	0087b503          	ld	a0,8(a5)
    80008258:	fffff097          	auipc	ra,0xfffff
    8000825c:	f98080e7          	jalr	-104(ra) # 800071f0 <sem_signal>
        }
    80008260:	02813083          	ld	ra,40(sp)
    80008264:	02013403          	ld	s0,32(sp)
    80008268:	01813483          	ld	s1,24(sp)
    8000826c:	01013903          	ld	s2,16(sp)
    80008270:	00813983          	ld	s3,8(sp)
    80008274:	03010113          	addi	sp,sp,48
    80008278:	00008067          	ret

000000008000827c <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    8000827c:	ff010113          	addi	sp,sp,-16
    80008280:	00113423          	sd	ra,8(sp)
    80008284:	00813023          	sd	s0,0(sp)
    80008288:	01010413          	addi	s0,sp,16
    8000828c:	00001797          	auipc	a5,0x1
    80008290:	1ac78793          	addi	a5,a5,428 # 80009438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80008294:	00f53023          	sd	a5,0(a0)
    80008298:	fffff097          	auipc	ra,0xfffff
    8000829c:	0f4080e7          	jalr	244(ra) # 8000738c <_ZN6ThreadD1Ev>
    800082a0:	00813083          	ld	ra,8(sp)
    800082a4:	00013403          	ld	s0,0(sp)
    800082a8:	01010113          	addi	sp,sp,16
    800082ac:	00008067          	ret

00000000800082b0 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    800082b0:	fe010113          	addi	sp,sp,-32
    800082b4:	00113c23          	sd	ra,24(sp)
    800082b8:	00813823          	sd	s0,16(sp)
    800082bc:	00913423          	sd	s1,8(sp)
    800082c0:	02010413          	addi	s0,sp,32
    800082c4:	00050493          	mv	s1,a0
    800082c8:	00001797          	auipc	a5,0x1
    800082cc:	17078793          	addi	a5,a5,368 # 80009438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800082d0:	00f53023          	sd	a5,0(a0)
    800082d4:	fffff097          	auipc	ra,0xfffff
    800082d8:	0b8080e7          	jalr	184(ra) # 8000738c <_ZN6ThreadD1Ev>
    800082dc:	00048513          	mv	a0,s1
    800082e0:	fffff097          	auipc	ra,0xfffff
    800082e4:	084080e7          	jalr	132(ra) # 80007364 <_ZdlPv>
    800082e8:	01813083          	ld	ra,24(sp)
    800082ec:	01013403          	ld	s0,16(sp)
    800082f0:	00813483          	ld	s1,8(sp)
    800082f4:	02010113          	addi	sp,sp,32
    800082f8:	00008067          	ret

00000000800082fc <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    800082fc:	ff010113          	addi	sp,sp,-16
    80008300:	00113423          	sd	ra,8(sp)
    80008304:	00813023          	sd	s0,0(sp)
    80008308:	01010413          	addi	s0,sp,16
    8000830c:	00001797          	auipc	a5,0x1
    80008310:	0dc78793          	addi	a5,a5,220 # 800093e8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80008314:	00f53023          	sd	a5,0(a0)
    80008318:	fffff097          	auipc	ra,0xfffff
    8000831c:	074080e7          	jalr	116(ra) # 8000738c <_ZN6ThreadD1Ev>
    80008320:	00813083          	ld	ra,8(sp)
    80008324:	00013403          	ld	s0,0(sp)
    80008328:	01010113          	addi	sp,sp,16
    8000832c:	00008067          	ret

0000000080008330 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    80008330:	fe010113          	addi	sp,sp,-32
    80008334:	00113c23          	sd	ra,24(sp)
    80008338:	00813823          	sd	s0,16(sp)
    8000833c:	00913423          	sd	s1,8(sp)
    80008340:	02010413          	addi	s0,sp,32
    80008344:	00050493          	mv	s1,a0
    80008348:	00001797          	auipc	a5,0x1
    8000834c:	0a078793          	addi	a5,a5,160 # 800093e8 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80008350:	00f53023          	sd	a5,0(a0)
    80008354:	fffff097          	auipc	ra,0xfffff
    80008358:	038080e7          	jalr	56(ra) # 8000738c <_ZN6ThreadD1Ev>
    8000835c:	00048513          	mv	a0,s1
    80008360:	fffff097          	auipc	ra,0xfffff
    80008364:	004080e7          	jalr	4(ra) # 80007364 <_ZdlPv>
    80008368:	01813083          	ld	ra,24(sp)
    8000836c:	01013403          	ld	s0,16(sp)
    80008370:	00813483          	ld	s1,8(sp)
    80008374:	02010113          	addi	sp,sp,32
    80008378:	00008067          	ret

000000008000837c <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    8000837c:	ff010113          	addi	sp,sp,-16
    80008380:	00113423          	sd	ra,8(sp)
    80008384:	00813023          	sd	s0,0(sp)
    80008388:	01010413          	addi	s0,sp,16
    8000838c:	00001797          	auipc	a5,0x1
    80008390:	08478793          	addi	a5,a5,132 # 80009410 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80008394:	00f53023          	sd	a5,0(a0)
    80008398:	fffff097          	auipc	ra,0xfffff
    8000839c:	ff4080e7          	jalr	-12(ra) # 8000738c <_ZN6ThreadD1Ev>
    800083a0:	00813083          	ld	ra,8(sp)
    800083a4:	00013403          	ld	s0,0(sp)
    800083a8:	01010113          	addi	sp,sp,16
    800083ac:	00008067          	ret

00000000800083b0 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    800083b0:	fe010113          	addi	sp,sp,-32
    800083b4:	00113c23          	sd	ra,24(sp)
    800083b8:	00813823          	sd	s0,16(sp)
    800083bc:	00913423          	sd	s1,8(sp)
    800083c0:	02010413          	addi	s0,sp,32
    800083c4:	00050493          	mv	s1,a0
    800083c8:	00001797          	auipc	a5,0x1
    800083cc:	04878793          	addi	a5,a5,72 # 80009410 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    800083d0:	00f53023          	sd	a5,0(a0)
    800083d4:	fffff097          	auipc	ra,0xfffff
    800083d8:	fb8080e7          	jalr	-72(ra) # 8000738c <_ZN6ThreadD1Ev>
    800083dc:	00048513          	mv	a0,s1
    800083e0:	fffff097          	auipc	ra,0xfffff
    800083e4:	f84080e7          	jalr	-124(ra) # 80007364 <_ZdlPv>
    800083e8:	01813083          	ld	ra,24(sp)
    800083ec:	01013403          	ld	s0,16(sp)
    800083f0:	00813483          	ld	s1,8(sp)
    800083f4:	02010113          	addi	sp,sp,32
    800083f8:	00008067          	ret

00000000800083fc <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    800083fc:	fe010113          	addi	sp,sp,-32
    80008400:	00113c23          	sd	ra,24(sp)
    80008404:	00813823          	sd	s0,16(sp)
    80008408:	00913423          	sd	s1,8(sp)
    8000840c:	02010413          	addi	s0,sp,32
    80008410:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    80008414:	fffff097          	auipc	ra,0xfffff
    80008418:	e4c080e7          	jalr	-436(ra) # 80007260 <getc>
    8000841c:	0005059b          	sext.w	a1,a0
    80008420:	01b00793          	li	a5,27
    80008424:	00f58c63          	beq	a1,a5,8000843c <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    80008428:	0104b783          	ld	a5,16(s1)
    8000842c:	0087b503          	ld	a0,8(a5)
    80008430:	fffff097          	auipc	ra,0xfffff
    80008434:	3cc080e7          	jalr	972(ra) # 800077fc <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    80008438:	fddff06f          	j	80008414 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    8000843c:	00100793          	li	a5,1
    80008440:	00003717          	auipc	a4,0x3
    80008444:	9af72c23          	sw	a5,-1608(a4) # 8000adf8 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    80008448:	0104b783          	ld	a5,16(s1)
    8000844c:	02100593          	li	a1,33
    80008450:	0087b503          	ld	a0,8(a5)
    80008454:	fffff097          	auipc	ra,0xfffff
    80008458:	3a8080e7          	jalr	936(ra) # 800077fc <_ZN9BufferCPP3putEi>
            td->sem->signal();
    8000845c:	0104b783          	ld	a5,16(s1)
    80008460:	0107b783          	ld	a5,16(a5)
    80008464:	0087b503          	ld	a0,8(a5)
    80008468:	fffff097          	auipc	ra,0xfffff
    8000846c:	d88080e7          	jalr	-632(ra) # 800071f0 <sem_signal>
        }
    80008470:	01813083          	ld	ra,24(sp)
    80008474:	01013403          	ld	s0,16(sp)
    80008478:	00813483          	ld	s1,8(sp)
    8000847c:	02010113          	addi	sp,sp,32
    80008480:	00008067          	ret

0000000080008484 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80008484:	fe010113          	addi	sp,sp,-32
    80008488:	00113c23          	sd	ra,24(sp)
    8000848c:	00813823          	sd	s0,16(sp)
    80008490:	00913423          	sd	s1,8(sp)
    80008494:	01213023          	sd	s2,0(sp)
    80008498:	02010413          	addi	s0,sp,32
    8000849c:	00050493          	mv	s1,a0
            int i = 0;
    800084a0:	00000913          	li	s2,0
            while (!threadEnd) {
    800084a4:	00003797          	auipc	a5,0x3
    800084a8:	95478793          	addi	a5,a5,-1708 # 8000adf8 <_ZN19ConsumerProducerCPP9threadEndE>
    800084ac:	0007a783          	lw	a5,0(a5)
    800084b0:	0007879b          	sext.w	a5,a5
    800084b4:	04079263          	bnez	a5,800084f8 <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    800084b8:	0104b783          	ld	a5,16(s1)
    800084bc:	0007a583          	lw	a1,0(a5)
    800084c0:	0305859b          	addiw	a1,a1,48
    800084c4:	0087b503          	ld	a0,8(a5)
    800084c8:	fffff097          	auipc	ra,0xfffff
    800084cc:	334080e7          	jalr	820(ra) # 800077fc <_ZN9BufferCPP3putEi>
                i++;
    800084d0:	0019051b          	addiw	a0,s2,1
    800084d4:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    800084d8:	0104b783          	ld	a5,16(s1)
    800084dc:	0007a783          	lw	a5,0(a5)
    800084e0:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    800084e4:	00500513          	li	a0,5
    800084e8:	02a7e53b          	remw	a0,a5,a0
    800084ec:	fffff097          	auipc	ra,0xfffff
    800084f0:	d3c080e7          	jalr	-708(ra) # 80007228 <time_sleep>
    800084f4:	fb1ff06f          	j	800084a4 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    800084f8:	0104b783          	ld	a5,16(s1)
    800084fc:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80008500:	0087b503          	ld	a0,8(a5)
    80008504:	fffff097          	auipc	ra,0xfffff
    80008508:	cec080e7          	jalr	-788(ra) # 800071f0 <sem_signal>
        }
    8000850c:	01813083          	ld	ra,24(sp)
    80008510:	01013403          	ld	s0,16(sp)
    80008514:	00813483          	ld	s1,8(sp)
    80008518:	00013903          	ld	s2,0(sp)
    8000851c:	02010113          	addi	sp,sp,32
    80008520:	00008067          	ret

0000000080008524 <_user_text_end>:
	...
