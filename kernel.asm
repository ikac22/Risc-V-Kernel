
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00015117          	auipc	sp,0x15
    80000004:	00813103          	ld	sp,8(sp) # 80015008 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80001014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <_user_bss_end+0xffffffff7ffe77ef>
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
    800010a4:	00014717          	auipc	a4,0x14
    800010a8:	40c70713          	addi	a4,a4,1036 # 800154b0 <timer_scratch>
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
    80001140:	00014717          	auipc	a4,0x14
    80001144:	37070713          	addi	a4,a4,880 # 800154b0 <timer_scratch>
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
    800011a8:	00014497          	auipc	s1,0x14
    800011ac:	2a048493          	addi	s1,s1,672 # 80015448 <started>
    800011b0:	02050263          	beqz	a0,800011d4 <system_main+0x48>
    800011b4:	0004a783          	lw	a5,0(s1)
    800011b8:	0007879b          	sext.w	a5,a5
    800011bc:	fe078ce3          	beqz	a5,800011b4 <system_main+0x28>
    800011c0:	0ff0000f          	fence
    800011c4:	0000f517          	auipc	a0,0xf
    800011c8:	1fc50513          	addi	a0,a0,508 # 800103c0 <_ZTV10ForkThread+0x90>
    800011cc:	00001097          	auipc	ra,0x1
    800011d0:	a70080e7          	jalr	-1424(ra) # 80001c3c <panic>
    800011d4:	00001097          	auipc	ra,0x1
    800011d8:	9c4080e7          	jalr	-1596(ra) # 80001b98 <consoleinit>
    800011dc:	00001097          	auipc	ra,0x1
    800011e0:	150080e7          	jalr	336(ra) # 8000232c <printfinit>
    800011e4:	0000e517          	auipc	a0,0xe
    800011e8:	17450513          	addi	a0,a0,372 # 8000f358 <CONSOLE_STATUS+0x348>
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	aac080e7          	jalr	-1364(ra) # 80001c98 <__printf>
    800011f4:	0000f517          	auipc	a0,0xf
    800011f8:	19c50513          	addi	a0,a0,412 # 80010390 <_ZTV10ForkThread+0x60>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	a9c080e7          	jalr	-1380(ra) # 80001c98 <__printf>
    80001204:	0000e517          	auipc	a0,0xe
    80001208:	15450513          	addi	a0,a0,340 # 8000f358 <CONSOLE_STATUS+0x348>
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
    8000124c:	0000f517          	auipc	a0,0xf
    80001250:	15c50513          	addi	a0,a0,348 # 800103a8 <_ZTV10ForkThread+0x78>
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
    800012a0:	00015517          	auipc	a0,0x15
    800012a4:	24050513          	addi	a0,a0,576 # 800164e0 <cpus>
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
    800012cc:	90430067          	jr	-1788(t1) # 80005bcc <main>

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
    8000130c:	0000f517          	auipc	a0,0xf
    80001310:	0dc50513          	addi	a0,a0,220 # 800103e8 <_ZTV10ForkThread+0xb8>
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
    80001354:	0000f517          	auipc	a0,0xf
    80001358:	0bc50513          	addi	a0,a0,188 # 80010410 <_ZTV10ForkThread+0xe0>
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	8e0080e7          	jalr	-1824(ra) # 80001c3c <panic>

0000000080001364 <trapinit>:
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	0000f597          	auipc	a1,0xf
    80001378:	0c458593          	addi	a1,a1,196 # 80010438 <_ZTV10ForkThread+0x108>
    8000137c:	00015517          	auipc	a0,0x15
    80001380:	1e450513          	addi	a0,a0,484 # 80016560 <tickslock>
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
    80001410:	0000f517          	auipc	a0,0xf
    80001414:	07050513          	addi	a0,a0,112 # 80010480 <_ZTV10ForkThread+0x150>
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	880080e7          	jalr	-1920(ra) # 80001c98 <__printf>
    80001420:	141025f3          	csrr	a1,sepc
    80001424:	14302673          	csrr	a2,stval
    80001428:	0000f517          	auipc	a0,0xf
    8000142c:	06850513          	addi	a0,a0,104 # 80010490 <_ZTV10ForkThread+0x160>
    80001430:	00001097          	auipc	ra,0x1
    80001434:	868080e7          	jalr	-1944(ra) # 80001c98 <__printf>
    80001438:	0000f517          	auipc	a0,0xf
    8000143c:	07050513          	addi	a0,a0,112 # 800104a8 <_ZTV10ForkThread+0x178>
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
    800014ac:	0000f517          	auipc	a0,0xf
    800014b0:	fb450513          	addi	a0,a0,-76 # 80010460 <_ZTV10ForkThread+0x130>
    800014b4:	00000097          	auipc	ra,0x0
    800014b8:	7e4080e7          	jalr	2020(ra) # 80001c98 <__printf>
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	01813083          	ld	ra,24(sp)
    800014c4:	00048513          	mv	a0,s1
    800014c8:	00813483          	ld	s1,8(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00000317          	auipc	t1,0x0
    800014d4:	3bc30067          	jr	956(t1) # 8000188c <plic_complete>
    800014d8:	00015517          	auipc	a0,0x15
    800014dc:	08850513          	addi	a0,a0,136 # 80016560 <tickslock>
    800014e0:	00001097          	auipc	ra,0x1
    800014e4:	48c080e7          	jalr	1164(ra) # 8000296c <acquire>
    800014e8:	00014717          	auipc	a4,0x14
    800014ec:	f6470713          	addi	a4,a4,-156 # 8001544c <ticks>
    800014f0:	00072783          	lw	a5,0(a4)
    800014f4:	00015517          	auipc	a0,0x15
    800014f8:	06c50513          	addi	a0,a0,108 # 80016560 <tickslock>
    800014fc:	0017879b          	addiw	a5,a5,1
    80001500:	00f72023          	sw	a5,0(a4)
    80001504:	00001097          	auipc	ra,0x1
    80001508:	534080e7          	jalr	1332(ra) # 80002a38 <release>
    8000150c:	f65ff06f          	j	80001470 <kerneltrap+0x8c>
    80001510:	00001097          	auipc	ra,0x1
    80001514:	090080e7          	jalr	144(ra) # 800025a0 <uartintr>
    80001518:	fa5ff06f          	j	800014bc <kerneltrap+0xd8>
    8000151c:	0000f517          	auipc	a0,0xf
    80001520:	f2450513          	addi	a0,a0,-220 # 80010440 <_ZTV10ForkThread+0x110>
    80001524:	00000097          	auipc	ra,0x0
    80001528:	718080e7          	jalr	1816(ra) # 80001c3c <panic>

000000008000152c <clockintr>:
    8000152c:	fe010113          	addi	sp,sp,-32
    80001530:	00813823          	sd	s0,16(sp)
    80001534:	00913423          	sd	s1,8(sp)
    80001538:	00113c23          	sd	ra,24(sp)
    8000153c:	02010413          	addi	s0,sp,32
    80001540:	00015497          	auipc	s1,0x15
    80001544:	02048493          	addi	s1,s1,32 # 80016560 <tickslock>
    80001548:	00048513          	mv	a0,s1
    8000154c:	00001097          	auipc	ra,0x1
    80001550:	420080e7          	jalr	1056(ra) # 8000296c <acquire>
    80001554:	00014717          	auipc	a4,0x14
    80001558:	ef870713          	addi	a4,a4,-264 # 8001544c <ticks>
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
    80001628:	0000f517          	auipc	a0,0xf
    8000162c:	e3850513          	addi	a0,a0,-456 # 80010460 <_ZTV10ForkThread+0x130>
    80001630:	00000097          	auipc	ra,0x0
    80001634:	668080e7          	jalr	1640(ra) # 80001c98 <__printf>
    80001638:	00048513          	mv	a0,s1
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	250080e7          	jalr	592(ra) # 8000188c <plic_complete>
    80001644:	00100513          	li	a0,1
    80001648:	f7dff06f          	j	800015c4 <devintr+0x40>
    8000164c:	00015517          	auipc	a0,0x15
    80001650:	f1450513          	addi	a0,a0,-236 # 80016560 <tickslock>
    80001654:	00001097          	auipc	ra,0x1
    80001658:	318080e7          	jalr	792(ra) # 8000296c <acquire>
    8000165c:	00014717          	auipc	a4,0x14
    80001660:	df070713          	addi	a4,a4,-528 # 8001544c <ticks>
    80001664:	00072783          	lw	a5,0(a4)
    80001668:	00015517          	auipc	a0,0x15
    8000166c:	ef850513          	addi	a0,a0,-264 # 80016560 <tickslock>
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
    800019b8:	00015497          	auipc	s1,0x15
    800019bc:	bd048493          	addi	s1,s1,-1072 # 80016588 <cons>
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
    80001b1c:	00015917          	auipc	s2,0x15
    80001b20:	a6c90913          	addi	s2,s2,-1428 # 80016588 <cons>
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
    80001b7c:	00015517          	auipc	a0,0x15
    80001b80:	a0c50513          	addi	a0,a0,-1524 # 80016588 <cons>
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
    80001bac:	00015497          	auipc	s1,0x15
    80001bb0:	9dc48493          	addi	s1,s1,-1572 # 80016588 <cons>
    80001bb4:	00048513          	mv	a0,s1
    80001bb8:	0000f597          	auipc	a1,0xf
    80001bbc:	90058593          	addi	a1,a1,-1792 # 800104b8 <_ZTV10ForkThread+0x188>
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
    80001c0c:	00015317          	auipc	t1,0x15
    80001c10:	a3433303          	ld	t1,-1484(t1) # 80016640 <devsw+0x10>
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00030067          	jr	t1

0000000080001c1c <console_write>:
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	00813403          	ld	s0,8(sp)
    80001c2c:	00015317          	auipc	t1,0x15
    80001c30:	a1c33303          	ld	t1,-1508(t1) # 80016648 <devsw+0x18>
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00030067          	jr	t1

0000000080001c3c <panic>:
    80001c3c:	fe010113          	addi	sp,sp,-32
    80001c40:	00113c23          	sd	ra,24(sp)
    80001c44:	00813823          	sd	s0,16(sp)
    80001c48:	00913423          	sd	s1,8(sp)
    80001c4c:	02010413          	addi	s0,sp,32
    80001c50:	00050493          	mv	s1,a0
    80001c54:	0000f517          	auipc	a0,0xf
    80001c58:	86c50513          	addi	a0,a0,-1940 # 800104c0 <_ZTV10ForkThread+0x190>
    80001c5c:	00015797          	auipc	a5,0x15
    80001c60:	a807a623          	sw	zero,-1396(a5) # 800166e8 <pr+0x18>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	034080e7          	jalr	52(ra) # 80001c98 <__printf>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	028080e7          	jalr	40(ra) # 80001c98 <__printf>
    80001c78:	0000d517          	auipc	a0,0xd
    80001c7c:	6e050513          	addi	a0,a0,1760 # 8000f358 <CONSOLE_STATUS+0x348>
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	018080e7          	jalr	24(ra) # 80001c98 <__printf>
    80001c88:	00100793          	li	a5,1
    80001c8c:	00013717          	auipc	a4,0x13
    80001c90:	7cf72223          	sw	a5,1988(a4) # 80015450 <panicked>
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
    80001cd4:	00015317          	auipc	t1,0x15
    80001cd8:	9fc30313          	addi	t1,t1,-1540 # 800166d0 <pr>
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
    80001d94:	0000ed97          	auipc	s11,0xe
    80001d98:	754d8d93          	addi	s11,s11,1876 # 800104e8 <digits>
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
    80001f9c:	0000ed97          	auipc	s11,0xe
    80001fa0:	54cd8d93          	addi	s11,s11,1356 # 800104e8 <digits>
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
    800020e4:	00014517          	auipc	a0,0x14
    800020e8:	5ec50513          	addi	a0,a0,1516 # 800166d0 <pr>
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
    80002124:	0000ed97          	auipc	s11,0xe
    80002128:	3c4d8d93          	addi	s11,s11,964 # 800104e8 <digits>
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
    800021c8:	0000ed97          	auipc	s11,0xe
    800021cc:	320d8d93          	addi	s11,s11,800 # 800104e8 <digits>
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
    80002220:	0000ed97          	auipc	s11,0xe
    80002224:	2c8d8d93          	addi	s11,s11,712 # 800104e8 <digits>
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
    8000226c:	0000ec97          	auipc	s9,0xe
    80002270:	25cc8c93          	addi	s9,s9,604 # 800104c8 <_ZTV10ForkThread+0x198>
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
    8000231c:	0000e517          	auipc	a0,0xe
    80002320:	1b450513          	addi	a0,a0,436 # 800104d0 <_ZTV10ForkThread+0x1a0>
    80002324:	00000097          	auipc	ra,0x0
    80002328:	918080e7          	jalr	-1768(ra) # 80001c3c <panic>

000000008000232c <printfinit>:
    8000232c:	fe010113          	addi	sp,sp,-32
    80002330:	00813823          	sd	s0,16(sp)
    80002334:	00913423          	sd	s1,8(sp)
    80002338:	00113c23          	sd	ra,24(sp)
    8000233c:	02010413          	addi	s0,sp,32
    80002340:	00014497          	auipc	s1,0x14
    80002344:	39048493          	addi	s1,s1,912 # 800166d0 <pr>
    80002348:	00048513          	mv	a0,s1
    8000234c:	0000e597          	auipc	a1,0xe
    80002350:	19458593          	addi	a1,a1,404 # 800104e0 <_ZTV10ForkThread+0x1b0>
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
    800023b8:	00013797          	auipc	a5,0x13
    800023bc:	0987a783          	lw	a5,152(a5) # 80015450 <panicked>
    800023c0:	00078463          	beqz	a5,800023c8 <uartputc+0x10>
    800023c4:	0000006f          	j	800023c4 <uartputc+0xc>
    800023c8:	fd010113          	addi	sp,sp,-48
    800023cc:	02813023          	sd	s0,32(sp)
    800023d0:	00913c23          	sd	s1,24(sp)
    800023d4:	01213823          	sd	s2,16(sp)
    800023d8:	01313423          	sd	s3,8(sp)
    800023dc:	02113423          	sd	ra,40(sp)
    800023e0:	03010413          	addi	s0,sp,48
    800023e4:	00013917          	auipc	s2,0x13
    800023e8:	07490913          	addi	s2,s2,116 # 80015458 <uart_tx_r>
    800023ec:	00093783          	ld	a5,0(s2)
    800023f0:	00013497          	auipc	s1,0x13
    800023f4:	07048493          	addi	s1,s1,112 # 80015460 <uart_tx_w>
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
    80002440:	00014597          	auipc	a1,0x14
    80002444:	2b058593          	addi	a1,a1,688 # 800166f0 <uart_tx_buf>
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
    800024bc:	00013717          	auipc	a4,0x13
    800024c0:	f9472703          	lw	a4,-108(a4) # 80015450 <panicked>
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
    80002500:	00013617          	auipc	a2,0x13
    80002504:	f5860613          	addi	a2,a2,-168 # 80015458 <uart_tx_r>
    80002508:	00013517          	auipc	a0,0x13
    8000250c:	f5850513          	addi	a0,a0,-168 # 80015460 <uart_tx_w>
    80002510:	00063783          	ld	a5,0(a2)
    80002514:	00053703          	ld	a4,0(a0)
    80002518:	04f70263          	beq	a4,a5,8000255c <uartstart+0x68>
    8000251c:	100005b7          	lui	a1,0x10000
    80002520:	00014817          	auipc	a6,0x14
    80002524:	1d080813          	addi	a6,a6,464 # 800166f0 <uart_tx_buf>
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
    800025e4:	00013617          	auipc	a2,0x13
    800025e8:	e7460613          	addi	a2,a2,-396 # 80015458 <uart_tx_r>
    800025ec:	00013517          	auipc	a0,0x13
    800025f0:	e7450513          	addi	a0,a0,-396 # 80015460 <uart_tx_w>
    800025f4:	00063783          	ld	a5,0(a2)
    800025f8:	00053703          	ld	a4,0(a0)
    800025fc:	04f70263          	beq	a4,a5,80002640 <uartintr+0xa0>
    80002600:	100005b7          	lui	a1,0x10000
    80002604:	00014817          	auipc	a6,0x14
    80002608:	0ec80813          	addi	a6,a6,236 # 800166f0 <uart_tx_buf>
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
    80002654:	00013617          	auipc	a2,0x13
    80002658:	e0460613          	addi	a2,a2,-508 # 80015458 <uart_tx_r>
    8000265c:	00013517          	auipc	a0,0x13
    80002660:	e0450513          	addi	a0,a0,-508 # 80015460 <uart_tx_w>
    80002664:	00063783          	ld	a5,0(a2)
    80002668:	00053703          	ld	a4,0(a0)
    8000266c:	04f70263          	beq	a4,a5,800026b0 <uartintr+0x110>
    80002670:	100005b7          	lui	a1,0x10000
    80002674:	00014817          	auipc	a6,0x14
    80002678:	07c80813          	addi	a6,a6,124 # 800166f0 <uart_tx_buf>
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
    800026c4:	00016497          	auipc	s1,0x16
    800026c8:	94b48493          	addi	s1,s1,-1717 # 8001800f <_user_bss_end+0xfff>
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
    80002700:	00015a97          	auipc	s5,0x15
    80002704:	910a8a93          	addi	s5,s5,-1776 # 80017010 <_user_bss_end>
    80002708:	0754ec63          	bltu	s1,s5,80002780 <kinit+0xc8>
    8000270c:	0734fa63          	bgeu	s1,s3,80002780 <kinit+0xc8>
    80002710:	00088a37          	lui	s4,0x88
    80002714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002718:	00013917          	auipc	s2,0x13
    8000271c:	d5090913          	addi	s2,s2,-688 # 80015468 <kmem>
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
    80002780:	0000e517          	auipc	a0,0xe
    80002784:	d8050513          	addi	a0,a0,-640 # 80010500 <digits+0x18>
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
    800027d4:	00015a97          	auipc	s5,0x15
    800027d8:	83ca8a93          	addi	s5,s5,-1988 # 80017010 <_user_bss_end>
    800027dc:	0954e263          	bltu	s1,s5,80002860 <freerange+0xd0>
    800027e0:	01100993          	li	s3,17
    800027e4:	01b99993          	slli	s3,s3,0x1b
    800027e8:	0734fc63          	bgeu	s1,s3,80002860 <freerange+0xd0>
    800027ec:	00058a13          	mv	s4,a1
    800027f0:	00013917          	auipc	s2,0x13
    800027f4:	c7890913          	addi	s2,s2,-904 # 80015468 <kmem>
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
    80002860:	0000e517          	auipc	a0,0xe
    80002864:	ca050513          	addi	a0,a0,-864 # 80010500 <digits+0x18>
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
    8000288c:	00014797          	auipc	a5,0x14
    80002890:	78478793          	addi	a5,a5,1924 # 80017010 <_user_bss_end>
    80002894:	00050493          	mv	s1,a0
    80002898:	04f56463          	bltu	a0,a5,800028e0 <kfree+0x70>
    8000289c:	01100793          	li	a5,17
    800028a0:	01b79793          	slli	a5,a5,0x1b
    800028a4:	02f57e63          	bgeu	a0,a5,800028e0 <kfree+0x70>
    800028a8:	00001637          	lui	a2,0x1
    800028ac:	00100593          	li	a1,1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	478080e7          	jalr	1144(ra) # 80002d28 <__memset>
    800028b8:	00013797          	auipc	a5,0x13
    800028bc:	bb078793          	addi	a5,a5,-1104 # 80015468 <kmem>
    800028c0:	0007b703          	ld	a4,0(a5)
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00e4b023          	sd	a4,0(s1)
    800028d0:	0097b023          	sd	s1,0(a5)
    800028d4:	00813483          	ld	s1,8(sp)
    800028d8:	02010113          	addi	sp,sp,32
    800028dc:	00008067          	ret
    800028e0:	0000e517          	auipc	a0,0xe
    800028e4:	c2050513          	addi	a0,a0,-992 # 80010500 <digits+0x18>
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	354080e7          	jalr	852(ra) # 80001c3c <panic>

00000000800028f0 <kalloc>:
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00813823          	sd	s0,16(sp)
    800028f8:	00913423          	sd	s1,8(sp)
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	02010413          	addi	s0,sp,32
    80002904:	00013797          	auipc	a5,0x13
    80002908:	b6478793          	addi	a5,a5,-1180 # 80015468 <kmem>
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
    80002a10:	0000e517          	auipc	a0,0xe
    80002a14:	af850513          	addi	a0,a0,-1288 # 80010508 <digits+0x20>
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
    80002a58:	0000e517          	auipc	a0,0xe
    80002a5c:	ab850513          	addi	a0,a0,-1352 # 80010510 <digits+0x28>
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
    80002ae0:	0000e517          	auipc	a0,0xe
    80002ae4:	a5050513          	addi	a0,a0,-1456 # 80010530 <digits+0x48>
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	154080e7          	jalr	340(ra) # 80001c3c <panic>
    80002af0:	0000e517          	auipc	a0,0xe
    80002af4:	a2850513          	addi	a0,a0,-1496 # 80010518 <digits+0x30>
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
    80002c1c:	0000e517          	auipc	a0,0xe
    80002c20:	91450513          	addi	a0,a0,-1772 # 80010530 <digits+0x48>
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	018080e7          	jalr	24(ra) # 80001c3c <panic>
    80002c2c:	0000e517          	auipc	a0,0xe
    80002c30:	8ec50513          	addi	a0,a0,-1812 # 80010518 <digits+0x30>
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
    80002d08:	0000e517          	auipc	a0,0xe
    80002d0c:	85050513          	addi	a0,a0,-1968 # 80010558 <digits+0x70>
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	f2c080e7          	jalr	-212(ra) # 80001c3c <panic>
    80002d18:	0000e517          	auipc	a0,0xe
    80002d1c:	82050513          	addi	a0,a0,-2016 # 80010538 <digits+0x50>
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
    8000401c:	c108                	sw	a0,0(a0)
    8000401e:	8000                	0x8000
    80004020:	0000                	unimp
	...

0000000080004024 <USER_TEXT_START>:
    80004024:	d000                	sw	s0,32(s0)
    80004026:	8000                	0x8000
    80004028:	0000                	unimp
	...

000000008000402c <USER_TEXT_END>:
    8000402c:	e194                	sd	a3,0(a1)
    8000402e:	8000                	0x8000
    80004030:	0000                	unimp
	...

0000000080004034 <USER_BSS_START>:
    80004034:	7000                	ld	s0,32(s0)
    80004036:	8001                	c.srli64	s0
    80004038:	0000                	unimp
	...

000000008000403c <USER_BSS_END>:
    8000403c:	7010                	ld	a2,32(s0)
    8000403e:	8001                	c.srli64	s0
    80004040:	0000                	unimp
	...

0000000080004044 <USER_DATA_START>:
    80004044:	4000                	lw	s0,0(s0)
    80004046:	8001                	c.srli64	s0
    80004048:	0000                	unimp
	...

000000008000404c <USER_DATA_END>:
    8000404c:	4011                	c.li	zero,4
    8000404e:	8001                	c.srli64	s0
    80004050:	0000                	unimp
	...

0000000080004054 <USER_RODATA_START>:
    80004054:	f000                	sd	s0,32(s0)
    80004056:	8000                	0x8000
    80004058:	0000                	unimp
	...

000000008000405c <USER_RODATA_END>:
    8000405c:	0560                	addi	s0,sp,652
    8000405e:	8001                	c.srli64	s0
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
    800040f0:	30c020ef          	jal	ra,800063fc <interrupt>

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
    800042a4:	00011497          	auipc	s1,0x11
    800042a8:	10c48493          	addi	s1,s1,268 # 800153b0 <_ZN3TCB7runningE>
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
    800042bc:	b4c080e7          	jalr	-1204(ra) # 80004e04 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    800042c0:	00001097          	auipc	ra,0x1
    800042c4:	950080e7          	jalr	-1712(ra) # 80004c10 <_ZN3TCB5yieldEv>
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
    8000431c:	b2c080e7          	jalr	-1236(ra) # 80004e44 <_ZN8TcbQueue6removeEv>
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
    80004378:	ad0080e7          	jalr	-1328(ra) # 80004e44 <_ZN8TcbQueue6removeEv>
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
    800043b8:	00011797          	auipc	a5,0x11
    800043bc:	fd078793          	addi	a5,a5,-48 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
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
    80004400:	00011797          	auipc	a5,0x11
    80004404:	f8078793          	addi	a5,a5,-128 # 80015380 <_ZN10KSemaphore5cacheE>
    80004408:	0007b503          	ld	a0,0(a5)
    8000440c:	00004097          	auipc	ra,0x4
    80004410:	778080e7          	jalr	1912(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
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
    80004430:	00011717          	auipc	a4,0x11
    80004434:	f4f73c23          	sd	a5,-168(a4) # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
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
    80004450:	00011797          	auipc	a5,0x11
    80004454:	f3878793          	addi	a5,a5,-200 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
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
    800044ec:	00011797          	auipc	a5,0x11
    800044f0:	f8478793          	addi	a5,a5,-124 # 80015470 <_ZN9Scheduler5queueE>
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
    80004520:	00011517          	auipc	a0,0x11
    80004524:	f5050513          	addi	a0,a0,-176 # 80015470 <_ZN9Scheduler5queueE>
    80004528:	00001097          	auipc	ra,0x1
    8000452c:	91c080e7          	jalr	-1764(ra) # 80004e44 <_ZN8TcbQueue6removeEv>
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
    80004554:	00011517          	auipc	a0,0x11
    80004558:	f1c50513          	addi	a0,a0,-228 # 80015470 <_ZN9Scheduler5queueE>
    8000455c:	00001097          	auipc	ra,0x1
    80004560:	8a8080e7          	jalr	-1880(ra) # 80004e04 <_ZN8TcbQueue6insertEP3TCB>
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
    800045b4:	00011517          	auipc	a0,0x11
    800045b8:	ebc50513          	addi	a0,a0,-324 # 80015470 <_ZN9Scheduler5queueE>
    800045bc:	00001097          	auipc	ra,0x1
    800045c0:	8f4080e7          	jalr	-1804(ra) # 80004eb0 <_ZN8TcbQueue10printQueueEv>
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
    800045f4:	00011517          	auipc	a0,0x11
    800045f8:	e9450513          	addi	a0,a0,-364 # 80015488 <_ZN9Scheduler8sleepingE>
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	930080e7          	jalr	-1744(ra) # 80004f2c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
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
    8000462c:	00011517          	auipc	a0,0x11
    80004630:	e5c50513          	addi	a0,a0,-420 # 80015488 <_ZN9Scheduler8sleepingE>
    80004634:	00001097          	auipc	ra,0x1
    80004638:	860080e7          	jalr	-1952(ra) # 80004e94 <_ZN8TcbQueue3topEv>
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
    8000465c:	00011917          	auipc	s2,0x11
    80004660:	e2c90913          	addi	s2,s2,-468 # 80015488 <_ZN9Scheduler8sleepingE>
    80004664:	00090513          	mv	a0,s2
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	7dc080e7          	jalr	2012(ra) # 80004e44 <_ZN8TcbQueue6removeEv>
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
    8000468c:	80c080e7          	jalr	-2036(ra) # 80004e94 <_ZN8TcbQueue3topEv>
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
    8000476c:	00011717          	auipc	a4,0x11
    80004770:	c2c70713          	addi	a4,a4,-980 # 80015398 <_ZN3TCB9threadsUpE>
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
    800047a8:	00011797          	auipc	a5,0x11
    800047ac:	c0878793          	addi	a5,a5,-1016 # 800153b0 <_ZN3TCB7runningE>
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
    80004818:	00011797          	auipc	a5,0x11
    8000481c:	b9878793          	addi	a5,a5,-1128 # 800153b0 <_ZN3TCB7runningE>
    80004820:	0007b783          	ld	a5,0(a5)
    80004824:	0107b703          	ld	a4,16(a5)
    80004828:	0187b503          	ld	a0,24(a5)
    8000482c:	000700e7          	jalr	a4
    thread_exit();
    80004830:	00009097          	auipc	ra,0x9
    80004834:	960080e7          	jalr	-1696(ra) # 8000d190 <thread_exit>
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
    80004854:	00011797          	auipc	a5,0x11
    80004858:	c4c78793          	addi	a5,a5,-948 # 800154a0 <_ZN3TCB12panicContextE>
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
    80004880:	00011797          	auipc	a5,0x11
    80004884:	b3078793          	addi	a5,a5,-1232 # 800153b0 <_ZN3TCB7runningE>
    80004888:	0007b503          	ld	a0,0(a5)
    8000488c:	00011597          	auipc	a1,0x11
    80004890:	c1458593          	addi	a1,a1,-1004 # 800154a0 <_ZN3TCB12panicContextE>
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
    800048c8:	00011797          	auipc	a5,0x11
    800048cc:	ac878793          	addi	a5,a5,-1336 # 80015390 <_ZN3TCB5cacheE>
    800048d0:	0007b783          	ld	a5,0(a5)
    800048d4:	02078863          	beqz	a5,80004904 <_ZN3TCBnwEm+0x54>
        cache = new ObjectCache("tcb_cache", sz, nullptr, nullptr); 
    }
    return cache->alloc_obj();
    800048d8:	00011797          	auipc	a5,0x11
    800048dc:	ab878793          	addi	a5,a5,-1352 # 80015390 <_ZN3TCB5cacheE>
    800048e0:	0007b503          	ld	a0,0(a5)
    800048e4:	00004097          	auipc	ra,0x4
    800048e8:	1c0080e7          	jalr	448(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
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
    80004910:	248080e7          	jalr	584(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80004914:	00050913          	mv	s2,a0
    80004918:	02050263          	beqz	a0,8000493c <_ZN3TCBnwEm+0x8c>
    8000491c:	00000793          	li	a5,0
    80004920:	00000713          	li	a4,0
    80004924:	00000693          	li	a3,0
    80004928:	00048613          	mv	a2,s1
    8000492c:	0000a597          	auipc	a1,0xa
    80004930:	6f458593          	addi	a1,a1,1780 # 8000f020 <CONSOLE_STATUS+0x10>
    80004934:	00003097          	auipc	ra,0x3
    80004938:	6d4080e7          	jalr	1748(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    8000493c:	00011797          	auipc	a5,0x11
    80004940:	a527ba23          	sd	s2,-1452(a5) # 80015390 <_ZN3TCB5cacheE>
    80004944:	f95ff06f          	j	800048d8 <_ZN3TCBnwEm+0x28>
    80004948:	00050493          	mv	s1,a0
    8000494c:	00090513          	mv	a0,s2
    80004950:	00004097          	auipc	ra,0x4
    80004954:	364080e7          	jalr	868(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80004958:	00048513          	mv	a0,s1
    8000495c:	00012097          	auipc	ra,0x12
    80004960:	c1c080e7          	jalr	-996(ra) # 80016578 <_Unwind_Resume>

0000000080004964 <_ZN3TCBnaEm>:
void* TCB::operator new[](size_t sz){ 
    80004964:	fe010113          	addi	sp,sp,-32
    80004968:	00113c23          	sd	ra,24(sp)
    8000496c:	00813823          	sd	s0,16(sp)
    80004970:	00913423          	sd	s1,8(sp)
    80004974:	02010413          	addi	s0,sp,32
    80004978:	00050493          	mv	s1,a0
    return SlabAllocator::getInstance().kmalloc(sz);
    8000497c:	00005097          	auipc	ra,0x5
    80004980:	998080e7          	jalr	-1640(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80004984:	00048593          	mv	a1,s1
    80004988:	00005097          	auipc	ra,0x5
    8000498c:	a90080e7          	jalr	-1392(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
} 
    80004990:	01813083          	ld	ra,24(sp)
    80004994:	01013403          	ld	s0,16(sp)
    80004998:	00813483          	ld	s1,8(sp)
    8000499c:	02010113          	addi	sp,sp,32
    800049a0:	00008067          	ret

00000000800049a4 <_ZN3TCBdlEPv>:
void TCB::operator delete(void* ptr){ 
    800049a4:	ff010113          	addi	sp,sp,-16
    800049a8:	00113423          	sd	ra,8(sp)
    800049ac:	00813023          	sd	s0,0(sp)
    800049b0:	01010413          	addi	s0,sp,16
    // kprintString("TCB dealloc!\n");
    cache->free_obj(ptr);
    800049b4:	00050593          	mv	a1,a0
    800049b8:	00011797          	auipc	a5,0x11
    800049bc:	9d878793          	addi	a5,a5,-1576 # 80015390 <_ZN3TCB5cacheE>
    800049c0:	0007b503          	ld	a0,0(a5)
    800049c4:	00004097          	auipc	ra,0x4
    800049c8:	1c0080e7          	jalr	448(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
} 
    800049cc:	00813083          	ld	ra,8(sp)
    800049d0:	00013403          	ld	s0,0(sp)
    800049d4:	01010113          	addi	sp,sp,16
    800049d8:	00008067          	ret

00000000800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    800049dc:	fd010113          	addi	sp,sp,-48
    800049e0:	02113423          	sd	ra,40(sp)
    800049e4:	02813023          	sd	s0,32(sp)
    800049e8:	00913c23          	sd	s1,24(sp)
    800049ec:	01213823          	sd	s2,16(sp)
    800049f0:	01313423          	sd	s3,8(sp)
    800049f4:	01413023          	sd	s4,0(sp)
    800049f8:	03010413          	addi	s0,sp,48
    800049fc:	00050913          	mv	s2,a0
    80004a00:	00058993          	mv	s3,a1
    80004a04:	00060a13          	mv	s4,a2
    return new TCB(body, args, stack);
    80004a08:	04800513          	li	a0,72
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	ea4080e7          	jalr	-348(ra) # 800048b0 <_ZN3TCBnwEm>
    80004a14:	00050493          	mv	s1,a0
    80004a18:	02050e63          	beqz	a0,80004a54 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>
    80004a1c:	00200713          	li	a4,2
    80004a20:	000a0693          	mv	a3,s4
    80004a24:	00098613          	mv	a2,s3
    80004a28:	00090593          	mv	a1,s2
    80004a2c:	00000097          	auipc	ra,0x0
    80004a30:	cd8080e7          	jalr	-808(ra) # 80004704 <_ZN3TCBC1EPFvPvES0_Pmm>
    80004a34:	0200006f          	j	80004a54 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>
    80004a38:	00050913          	mv	s2,a0
    80004a3c:	00048513          	mv	a0,s1
    80004a40:	00000097          	auipc	ra,0x0
    80004a44:	f64080e7          	jalr	-156(ra) # 800049a4 <_ZN3TCBdlEPv>
    80004a48:	00090513          	mv	a0,s2
    80004a4c:	00012097          	auipc	ra,0x12
    80004a50:	b2c080e7          	jalr	-1236(ra) # 80016578 <_Unwind_Resume>
}
    80004a54:	00048513          	mv	a0,s1
    80004a58:	02813083          	ld	ra,40(sp)
    80004a5c:	02013403          	ld	s0,32(sp)
    80004a60:	01813483          	ld	s1,24(sp)
    80004a64:	01013903          	ld	s2,16(sp)
    80004a68:	00813983          	ld	s3,8(sp)
    80004a6c:	00013a03          	ld	s4,0(sp)
    80004a70:	03010113          	addi	sp,sp,48
    80004a74:	00008067          	ret

0000000080004a78 <_ZN3TCB22createMainKernelThreadEv>:
    if(!kernelThread)
    80004a78:	00011797          	auipc	a5,0x11
    80004a7c:	92878793          	addi	a5,a5,-1752 # 800153a0 <_ZN3TCB12kernelThreadE>
    80004a80:	0007b783          	ld	a5,0(a5)
    80004a84:	00078e63          	beqz	a5,80004aa0 <_ZN3TCB22createMainKernelThreadEv+0x28>
    running = kernelThread;
    80004a88:	00011797          	auipc	a5,0x11
    80004a8c:	91878793          	addi	a5,a5,-1768 # 800153a0 <_ZN3TCB12kernelThreadE>
    80004a90:	0007b503          	ld	a0,0(a5)
    80004a94:	00011797          	auipc	a5,0x11
    80004a98:	90a7be23          	sd	a0,-1764(a5) # 800153b0 <_ZN3TCB7runningE>
}
    80004a9c:	00008067          	ret
{
    80004aa0:	ff010113          	addi	sp,sp,-16
    80004aa4:	00113423          	sd	ra,8(sp)
    80004aa8:	00813023          	sd	s0,0(sp)
    80004aac:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    80004ab0:	00000613          	li	a2,0
    80004ab4:	00000593          	li	a1,0
    80004ab8:	00000513          	li	a0,0
    80004abc:	00000097          	auipc	ra,0x0
    80004ac0:	f20080e7          	jalr	-224(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80004ac4:	00011797          	auipc	a5,0x11
    80004ac8:	8ca7be23          	sd	a0,-1828(a5) # 800153a0 <_ZN3TCB12kernelThreadE>
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80004acc:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80004ad0:	00100793          	li	a5,1
    80004ad4:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    80004ad8:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    80004adc:	00011797          	auipc	a5,0x11
    80004ae0:	8c478793          	addi	a5,a5,-1852 # 800153a0 <_ZN3TCB12kernelThreadE>
    80004ae4:	0007b503          	ld	a0,0(a5)
    80004ae8:	00011797          	auipc	a5,0x11
    80004aec:	8ca7b423          	sd	a0,-1848(a5) # 800153b0 <_ZN3TCB7runningE>
}
    80004af0:	00813083          	ld	ra,8(sp)
    80004af4:	00013403          	ld	s0,0(sp)
    80004af8:	01010113          	addi	sp,sp,16
    80004afc:	00008067          	ret

0000000080004b00 <_ZN3TCB8dispatchEv>:
{
    80004b00:	fe010113          	addi	sp,sp,-32
    80004b04:	00113c23          	sd	ra,24(sp)
    80004b08:	00813823          	sd	s0,16(sp)
    80004b0c:	00913423          	sd	s1,8(sp)
    80004b10:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    80004b14:	00011797          	auipc	a5,0x11
    80004b18:	89c78793          	addi	a5,a5,-1892 # 800153b0 <_ZN3TCB7runningE>
    80004b1c:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80004b20:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80004b24:	00200713          	li	a4,2
    80004b28:	06e78c63          	beq	a5,a4,80004ba0 <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80004b2c:	00078c63          	beqz	a5,80004b44 <_ZN3TCB8dispatchEv+0x44>
    80004b30:	00300713          	li	a4,3
    80004b34:	00e78863          	beq	a5,a4,80004b44 <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    80004b38:	00048513          	mv	a0,s1
    80004b3c:	00000097          	auipc	ra,0x0
    80004b40:	a04080e7          	jalr	-1532(ra) # 80004540 <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80004b44:	00011797          	auipc	a5,0x11
    80004b48:	85478793          	addi	a5,a5,-1964 # 80015398 <_ZN3TCB9threadsUpE>
    80004b4c:	0007a703          	lw	a4,0(a5)
    80004b50:	00200793          	li	a5,2
    80004b54:	00e7cc63          	blt	a5,a4,80004b6c <_ZN3TCB8dispatchEv+0x6c>
    80004b58:	00011797          	auipc	a5,0x11
    80004b5c:	8b078793          	addi	a5,a5,-1872 # 80015408 <_ZN5StdIO7obufferE>
    80004b60:	0007b783          	ld	a5,0(a5)
    80004b64:	4807a783          	lw	a5,1152(a5)
    80004b68:	08078e63          	beqz	a5,80004c04 <_ZN3TCB8dispatchEv+0x104>
    running = Scheduler::get(); 
    80004b6c:	00000097          	auipc	ra,0x0
    80004b70:	9a4080e7          	jalr	-1628(ra) # 80004510 <_ZN9Scheduler3getEv>
    80004b74:	00011797          	auipc	a5,0x11
    80004b78:	82a7be23          	sd	a0,-1988(a5) # 800153b0 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80004b7c:	03850593          	addi	a1,a0,56
    80004b80:	03848513          	addi	a0,s1,56
    80004b84:	fffff097          	auipc	ra,0xfffff
    80004b88:	47c080e7          	jalr	1148(ra) # 80004000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80004b8c:	01813083          	ld	ra,24(sp)
    80004b90:	01013403          	ld	s0,16(sp)
    80004b94:	00813483          	ld	s1,8(sp)
    80004b98:	02010113          	addi	sp,sp,32
    80004b9c:	00008067          	ret
        threadsUp--;
    80004ba0:	00010717          	auipc	a4,0x10
    80004ba4:	7f870713          	addi	a4,a4,2040 # 80015398 <_ZN3TCB9threadsUpE>
    80004ba8:	00072783          	lw	a5,0(a4)
    80004bac:	fff7879b          	addiw	a5,a5,-1
    80004bb0:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    80004bb4:	0344c783          	lbu	a5,52(s1)
    80004bb8:	f80786e3          	beqz	a5,80004b44 <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    80004bbc:	f80484e3          	beqz	s1,80004b44 <_ZN3TCB8dispatchEv+0x44>
    bool isKernelThread() { return !userMode; } 
    80004bc0:	0354c783          	lbu	a5,53(s1)
        if(isKernelThread()){
    80004bc4:	02079463          	bnez	a5,80004bec <_ZN3TCB8dispatchEv+0xec>
            SlabAllocator::getInstance().kfree(this->stack);
    80004bc8:	00004097          	auipc	ra,0x4
    80004bcc:	74c080e7          	jalr	1868(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80004bd0:	0204b583          	ld	a1,32(s1)
    80004bd4:	00005097          	auipc	ra,0x5
    80004bd8:	8c8080e7          	jalr	-1848(ra) # 8000949c <_ZN13SlabAllocator5kfreeEPv>
    80004bdc:	00048513          	mv	a0,s1
    80004be0:	00000097          	auipc	ra,0x0
    80004be4:	dc4080e7          	jalr	-572(ra) # 800049a4 <_ZN3TCBdlEPv>
    80004be8:	f5dff06f          	j	80004b44 <_ZN3TCB8dispatchEv+0x44>
            MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80004bec:	00003097          	auipc	ra,0x3
    80004bf0:	a5c080e7          	jalr	-1444(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
            allocator.mem_free(this->stack);
    80004bf4:	0204b583          	ld	a1,32(s1)
    80004bf8:	00003097          	auipc	ra,0x3
    80004bfc:	eb4080e7          	jalr	-332(ra) # 80007aac <_ZN15MemoryAllocator8mem_freeEPv>
    80004c00:	fddff06f          	j	80004bdc <_ZN3TCB8dispatchEv+0xdc>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80004c04:	00000097          	auipc	ra,0x0
    80004c08:	090080e7          	jalr	144(ra) # 80004c94 <_ZN3TCB9endKernelEv>
    80004c0c:	f61ff06f          	j	80004b6c <_ZN3TCB8dispatchEv+0x6c>

0000000080004c10 <_ZN3TCB5yieldEv>:
{
    80004c10:	ff010113          	addi	sp,sp,-16
    80004c14:	00113423          	sd	ra,8(sp)
    80004c18:	00813023          	sd	s0,0(sp)
    80004c1c:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80004c20:	fffff097          	auipc	ra,0xfffff
    80004c24:	560080e7          	jalr	1376(ra) # 80004180 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80004c28:	00000097          	auipc	ra,0x0
    80004c2c:	ed8080e7          	jalr	-296(ra) # 80004b00 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80004c30:	fffff097          	auipc	ra,0xfffff
    80004c34:	5cc080e7          	jalr	1484(ra) # 800041fc <_ZN5Riscv12popRegistersEv>
}
    80004c38:	00813083          	ld	ra,8(sp)
    80004c3c:	00013403          	ld	s0,0(sp)
    80004c40:	01010113          	addi	sp,sp,16
    80004c44:	00008067          	ret

0000000080004c48 <_ZN3TCB5sleepEm>:
{
    80004c48:	ff010113          	addi	sp,sp,-16
    80004c4c:	00113423          	sd	ra,8(sp)
    80004c50:	00813023          	sd	s0,0(sp)
    80004c54:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80004c58:	00010797          	auipc	a5,0x10
    80004c5c:	75878793          	addi	a5,a5,1880 # 800153b0 <_ZN3TCB7runningE>
    80004c60:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80004c64:	00300713          	li	a4,3
    80004c68:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80004c6c:	00050593          	mv	a1,a0
    80004c70:	00078513          	mv	a0,a5
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	960080e7          	jalr	-1696(ra) # 800045d4 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80004c7c:	00000097          	auipc	ra,0x0
    80004c80:	f94080e7          	jalr	-108(ra) # 80004c10 <_ZN3TCB5yieldEv>
}
    80004c84:	00813083          	ld	ra,8(sp)
    80004c88:	00013403          	ld	s0,0(sp)
    80004c8c:	01010113          	addi	sp,sp,16
    80004c90:	00008067          	ret

0000000080004c94 <_ZN3TCB9endKernelEv>:
    if(kernelThread)
    80004c94:	00010797          	auipc	a5,0x10
    80004c98:	70c78793          	addi	a5,a5,1804 # 800153a0 <_ZN3TCB12kernelThreadE>
    80004c9c:	0007b583          	ld	a1,0(a5)
    80004ca0:	04058463          	beqz	a1,80004ce8 <_ZN3TCB9endKernelEv+0x54>
{
    80004ca4:	ff010113          	addi	sp,sp,-16
    80004ca8:	00113423          	sd	ra,8(sp)
    80004cac:	00813023          	sd	s0,0(sp)
    80004cb0:	01010413          	addi	s0,sp,16
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80004cb4:	00010517          	auipc	a0,0x10
    80004cb8:	7bc50513          	addi	a0,a0,1980 # 80015470 <_ZN9Scheduler5queueE>
    80004cbc:	00000097          	auipc	ra,0x0
    80004cc0:	32c080e7          	jalr	812(ra) # 80004fe8 <_ZN8TcbQueue11insertFrontEP3TCB>
        kernelThread = nullptr;
    80004cc4:	00010797          	auipc	a5,0x10
    80004cc8:	6c07be23          	sd	zero,1756(a5) # 800153a0 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    80004ccc:	00000097          	auipc	ra,0x0
    80004cd0:	e34080e7          	jalr	-460(ra) # 80004b00 <_ZN3TCB8dispatchEv>
}
    80004cd4:	fff00513          	li	a0,-1
    80004cd8:	00813083          	ld	ra,8(sp)
    80004cdc:	00013403          	ld	s0,0(sp)
    80004ce0:	01010113          	addi	sp,sp,16
    80004ce4:	00008067          	ret
    80004ce8:	fff00513          	li	a0,-1
    80004cec:	00008067          	ret

0000000080004cf0 <_ZN3TCB12deleteThreadEPS_>:
    if(t)
    80004cf0:	08050c63          	beqz	a0,80004d88 <_ZN3TCB12deleteThreadEPS_+0x98>
        if(running != t && t->isFinished())
    80004cf4:	00010797          	auipc	a5,0x10
    80004cf8:	6bc78793          	addi	a5,a5,1724 # 800153b0 <_ZN3TCB7runningE>
    80004cfc:	0007b783          	ld	a5,0(a5)
    80004d00:	00a78863          	beq	a5,a0,80004d10 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    80004d04:	03052703          	lw	a4,48(a0)
    80004d08:	00200793          	li	a5,2
    80004d0c:	00f70863          	beq	a4,a5,80004d1c <_ZN3TCB12deleteThreadEPS_+0x2c>
            t->deleteOnEnd = true;
    80004d10:	00100793          	li	a5,1
    80004d14:	02f50a23          	sb	a5,52(a0)
}
    80004d18:	00008067          	ret
{
    80004d1c:	fe010113          	addi	sp,sp,-32
    80004d20:	00113c23          	sd	ra,24(sp)
    80004d24:	00813823          	sd	s0,16(sp)
    80004d28:	00913423          	sd	s1,8(sp)
    80004d2c:	02010413          	addi	s0,sp,32
    80004d30:	00050493          	mv	s1,a0
    bool isKernelThread() { return !userMode; } 
    80004d34:	03554783          	lbu	a5,53(a0)
        if(isKernelThread()){
    80004d38:	02079c63          	bnez	a5,80004d70 <_ZN3TCB12deleteThreadEPS_+0x80>
            SlabAllocator::getInstance().kfree(this->stack);
    80004d3c:	00004097          	auipc	ra,0x4
    80004d40:	5d8080e7          	jalr	1496(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80004d44:	0204b583          	ld	a1,32(s1)
    80004d48:	00004097          	auipc	ra,0x4
    80004d4c:	754080e7          	jalr	1876(ra) # 8000949c <_ZN13SlabAllocator5kfreeEPv>
            delete t;
    80004d50:	00048513          	mv	a0,s1
    80004d54:	00000097          	auipc	ra,0x0
    80004d58:	c50080e7          	jalr	-944(ra) # 800049a4 <_ZN3TCBdlEPv>
}
    80004d5c:	01813083          	ld	ra,24(sp)
    80004d60:	01013403          	ld	s0,16(sp)
    80004d64:	00813483          	ld	s1,8(sp)
    80004d68:	02010113          	addi	sp,sp,32
    80004d6c:	00008067          	ret
            MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80004d70:	00003097          	auipc	ra,0x3
    80004d74:	8d8080e7          	jalr	-1832(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
            allocator.mem_free(this->stack);
    80004d78:	0204b583          	ld	a1,32(s1)
    80004d7c:	00003097          	auipc	ra,0x3
    80004d80:	d30080e7          	jalr	-720(ra) # 80007aac <_ZN15MemoryAllocator8mem_freeEPv>
    80004d84:	fcdff06f          	j	80004d50 <_ZN3TCB12deleteThreadEPS_+0x60>
    80004d88:	00008067          	ret

0000000080004d8c <_ZN3TCBdaEPv>:
void TCB::operator delete[](void* ptr){
    80004d8c:	fe010113          	addi	sp,sp,-32
    80004d90:	00113c23          	sd	ra,24(sp)
    80004d94:	00813823          	sd	s0,16(sp)
    80004d98:	00913423          	sd	s1,8(sp)
    80004d9c:	02010413          	addi	s0,sp,32
    80004da0:	00050493          	mv	s1,a0
    SlabAllocator::getInstance().kfree(ptr);
    80004da4:	00004097          	auipc	ra,0x4
    80004da8:	570080e7          	jalr	1392(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80004dac:	00048593          	mv	a1,s1
    80004db0:	00004097          	auipc	ra,0x4
    80004db4:	6ec080e7          	jalr	1772(ra) # 8000949c <_ZN13SlabAllocator5kfreeEPv>
    80004db8:	01813083          	ld	ra,24(sp)
    80004dbc:	01013403          	ld	s0,16(sp)
    80004dc0:	00813483          	ld	s1,8(sp)
    80004dc4:	02010113          	addi	sp,sp,32
    80004dc8:	00008067          	ret

0000000080004dcc <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../../h/kernel_lib.h"

ObjectCache* TcbQueue::cache = nullptr;

bool TcbQueue::exists(TCB* info) const 
{
    80004dcc:	ff010113          	addi	sp,sp,-16
    80004dd0:	00813423          	sd	s0,8(sp)
    80004dd4:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    80004dd8:	00053783          	ld	a5,0(a0)
    80004ddc:	00078863          	beqz	a5,80004dec <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    80004de0:	00b78e63          	beq	a5,a1,80004dfc <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    80004de4:	0007b783          	ld	a5,0(a5)
    80004de8:	ff5ff06f          	j	80004ddc <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    80004dec:	00000513          	li	a0,0
}
    80004df0:	00813403          	ld	s0,8(sp)
    80004df4:	01010113          	addi	sp,sp,16
    80004df8:	00008067          	ret
            return true;
    80004dfc:	00100513          	li	a0,1
    80004e00:	ff1ff06f          	j	80004df0 <_ZNK8TcbQueue6existsEP3TCB+0x24>

0000000080004e04 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    80004e04:	ff010113          	addi	sp,sp,-16
    80004e08:	00813423          	sd	s0,8(sp)
    80004e0c:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    80004e10:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004e14:	00853783          	ld	a5,8(a0)
    80004e18:	02078263          	beqz	a5,80004e3c <_ZN8TcbQueue6insertEP3TCB+0x38>
    80004e1c:	00b7b023          	sd	a1,0(a5)
    80004e20:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    80004e24:	01052783          	lw	a5,16(a0)
    80004e28:	0017879b          	addiw	a5,a5,1
    80004e2c:	00f52823          	sw	a5,16(a0)
    return *this;
}
    80004e30:	00813403          	ld	s0,8(sp)
    80004e34:	01010113          	addi	sp,sp,16
    80004e38:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004e3c:	00b53023          	sd	a1,0(a0)
    80004e40:	fe1ff06f          	j	80004e20 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080004e44 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80004e44:	ff010113          	addi	sp,sp,-16
    80004e48:	00813423          	sd	s0,8(sp)
    80004e4c:	01010413          	addi	s0,sp,16
    80004e50:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80004e54:	00053503          	ld	a0,0(a0)
    80004e58:	02050263          	beqz	a0,80004e7c <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80004e5c:	0087b703          	ld	a4,8(a5)
    80004e60:	02e50463          	beq	a0,a4,80004e88 <_ZN8TcbQueue6removeEv+0x44>
    80004e64:	00053703          	ld	a4,0(a0)
    80004e68:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    80004e6c:	00053023          	sd	zero,0(a0)
        tmpNum--;
    80004e70:	0107a703          	lw	a4,16(a5)
    80004e74:	fff7071b          	addiw	a4,a4,-1
    80004e78:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    80004e7c:	00813403          	ld	s0,8(sp)
    80004e80:	01010113          	addi	sp,sp,16
    80004e84:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    80004e88:	0007b423          	sd	zero,8(a5)
    80004e8c:	00000713          	li	a4,0
    80004e90:	fd9ff06f          	j	80004e68 <_ZN8TcbQueue6removeEv+0x24>

0000000080004e94 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80004e94:	ff010113          	addi	sp,sp,-16
    80004e98:	00813423          	sd	s0,8(sp)
    80004e9c:	01010413          	addi	s0,sp,16
    return head;
}
    80004ea0:	00053503          	ld	a0,0(a0)
    80004ea4:	00813403          	ld	s0,8(sp)
    80004ea8:	01010113          	addi	sp,sp,16
    80004eac:	00008067          	ret

0000000080004eb0 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    80004eb0:	fe010113          	addi	sp,sp,-32
    80004eb4:	00113c23          	sd	ra,24(sp)
    80004eb8:	00813823          	sd	s0,16(sp)
    80004ebc:	00913423          	sd	s1,8(sp)
    80004ec0:	02010413          	addi	s0,sp,32
    TCB* t = head;
    80004ec4:	00053483          	ld	s1,0(a0)
    while(t){
    80004ec8:	04048063          	beqz	s1,80004f08 <_ZN8TcbQueue10printQueueEv+0x58>
        kprintString("-> ");
    80004ecc:	0000a517          	auipc	a0,0xa
    80004ed0:	16450513          	addi	a0,a0,356 # 8000f030 <CONSOLE_STATUS+0x20>
    80004ed4:	00000097          	auipc	ra,0x0
    80004ed8:	1d0080e7          	jalr	464(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    80004edc:	00000613          	li	a2,0
    80004ee0:	00a00593          	li	a1,10
    80004ee4:	00048513          	mv	a0,s1
    80004ee8:	00000097          	auipc	ra,0x0
    80004eec:	204080e7          	jalr	516(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80004ef0:	0000a517          	auipc	a0,0xa
    80004ef4:	46850513          	addi	a0,a0,1128 # 8000f358 <CONSOLE_STATUS+0x348>
    80004ef8:	00000097          	auipc	ra,0x0
    80004efc:	1ac080e7          	jalr	428(ra) # 800050a4 <_Z12kprintStringPKc>
        t = t->next;            
    80004f00:	0004b483          	ld	s1,0(s1)
    while(t){
    80004f04:	fc5ff06f          	j	80004ec8 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    80004f08:	0000a517          	auipc	a0,0xa
    80004f0c:	45050513          	addi	a0,a0,1104 # 8000f358 <CONSOLE_STATUS+0x348>
    80004f10:	00000097          	auipc	ra,0x0
    80004f14:	194080e7          	jalr	404(ra) # 800050a4 <_Z12kprintStringPKc>
}
    80004f18:	01813083          	ld	ra,24(sp)
    80004f1c:	01013403          	ld	s0,16(sp)
    80004f20:	00813483          	ld	s1,8(sp)
    80004f24:	02010113          	addi	sp,sp,32
    80004f28:	00008067          	ret

0000000080004f2c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    80004f2c:	fc010113          	addi	sp,sp,-64
    80004f30:	02113c23          	sd	ra,56(sp)
    80004f34:	02813823          	sd	s0,48(sp)
    80004f38:	02913423          	sd	s1,40(sp)
    80004f3c:	03213023          	sd	s2,32(sp)
    80004f40:	01313c23          	sd	s3,24(sp)
    80004f44:	01413823          	sd	s4,16(sp)
    80004f48:	01513423          	sd	s5,8(sp)
    80004f4c:	04010413          	addi	s0,sp,64
    80004f50:	00050a93          	mv	s5,a0
    80004f54:	00058913          	mv	s2,a1
    80004f58:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80004f5c:	00053483          	ld	s1,0(a0)
    80004f60:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80004f64:	02048063          	beqz	s1,80004f84 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80004f68:	00048593          	mv	a1,s1
    80004f6c:	00090513          	mv	a0,s2
    80004f70:	000a00e7          	jalr	s4
    80004f74:	00054863          	bltz	a0,80004f84 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80004f78:	00048993          	mv	s3,s1
        cur = cur->next;
    80004f7c:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80004f80:	fe5ff06f          	j	80004f64 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80004f84:	04098063          	beqz	s3,80004fc4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80004f88:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    80004f8c:	04048a63          	beqz	s1,80004fe0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    80004f90:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    80004f94:	010aa783          	lw	a5,16(s5)
    80004f98:	0017879b          	addiw	a5,a5,1
    80004f9c:	00faa823          	sw	a5,16(s5)
}
    80004fa0:	03813083          	ld	ra,56(sp)
    80004fa4:	03013403          	ld	s0,48(sp)
    80004fa8:	02813483          	ld	s1,40(sp)
    80004fac:	02013903          	ld	s2,32(sp)
    80004fb0:	01813983          	ld	s3,24(sp)
    80004fb4:	01013a03          	ld	s4,16(sp)
    80004fb8:	00813a83          	ld	s5,8(sp)
    80004fbc:	04010113          	addi	sp,sp,64
    80004fc0:	00008067          	ret
        info->next = head;
    80004fc4:	000ab783          	ld	a5,0(s5)
    80004fc8:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    80004fcc:	00078663          	beqz	a5,80004fd8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    80004fd0:	012ab023          	sd	s2,0(s5)
    80004fd4:	fc1ff06f          	j	80004f94 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    80004fd8:	012ab423          	sd	s2,8(s5)
    80004fdc:	ff5ff06f          	j	80004fd0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    80004fe0:	012ab423          	sd	s2,8(s5)
    80004fe4:	fadff06f          	j	80004f90 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

0000000080004fe8 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    80004fe8:	ff010113          	addi	sp,sp,-16
    80004fec:	00813423          	sd	s0,8(sp)
    80004ff0:	01010413          	addi	s0,sp,16
    info->next = head;
    80004ff4:	00053783          	ld	a5,0(a0)
    80004ff8:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    80004ffc:	02078063          	beqz	a5,8000501c <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    80005000:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    80005004:	01052783          	lw	a5,16(a0)
    80005008:	0017879b          	addiw	a5,a5,1
    8000500c:	00f52823          	sw	a5,16(a0)
    80005010:	00813403          	ld	s0,8(sp)
    80005014:	01010113          	addi	sp,sp,16
    80005018:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    8000501c:	00b53423          	sd	a1,8(a0)
    80005020:	fe1ff06f          	j	80005000 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

0000000080005024 <_ZN8KSysCall15thread_dispatchEv>:
#include"../../../h/kernel_lib.h"

namespace KSysCall{
    void thread_dispatch(){
    80005024:	ff010113          	addi	sp,sp,-16
    80005028:	00813423          	sd	s0,8(sp)
    8000502c:	01010413          	addi	s0,sp,16
        __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80005030:	01300793          	li	a5,19
    80005034:	00078513          	mv	a0,a5
        __asm__ volatile("ecall");  
    80005038:	00000073          	ecall
    }
    8000503c:	00813403          	ld	s0,8(sp)
    80005040:	01010113          	addi	sp,sp,16
    80005044:	00008067          	ret

0000000080005048 <_Z12idleFunctionPv>:
}

void idleFunction(void*)
{
    80005048:	ff010113          	addi	sp,sp,-16
    8000504c:	00113423          	sd	ra,8(sp)
    80005050:	00813023          	sd	s0,0(sp)
    80005054:	01010413          	addi	s0,sp,16
        *   We could make preemptive kernel thread but that is a little bit harder.
        *   We must make INTERRUPTION LOCK FUNCTION (function that disables interrupts)  
        *   that will lock the thread when executing critical section code! TODO or NOT
        *    
        */
        KSysCall::thread_dispatch();
    80005058:	00000097          	auipc	ra,0x0
    8000505c:	fcc080e7          	jalr	-52(ra) # 80005024 <_ZN8KSysCall15thread_dispatchEv>
    80005060:	ff9ff06f          	j	80005058 <_Z12idleFunctionPv+0x10>

0000000080005064 <_Z5kputcc>:
    }
}

void kputc(char c){
    80005064:	ff010113          	addi	sp,sp,-16
    80005068:	00813423          	sd	s0,8(sp)
    8000506c:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    80005070:	0000a797          	auipc	a5,0xa
    80005074:	f9878793          	addi	a5,a5,-104 # 8000f008 <CONSOLE_TX_DATA>
    80005078:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    8000507c:	0000a797          	auipc	a5,0xa
    80005080:	f9478793          	addi	a5,a5,-108 # 8000f010 <CONSOLE_STATUS>
    80005084:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    80005088:	00074783          	lbu	a5,0(a4)
    8000508c:	0207f793          	andi	a5,a5,32
    80005090:	fe078ce3          	beqz	a5,80005088 <_Z5kputcc+0x24>
    *odata = c;
    80005094:	00a68023          	sb	a0,0(a3)
}
    80005098:	00813403          	ld	s0,8(sp)
    8000509c:	01010113          	addi	sp,sp,16
    800050a0:	00008067          	ret

00000000800050a4 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    800050a4:	fe010113          	addi	sp,sp,-32
    800050a8:	00113c23          	sd	ra,24(sp)
    800050ac:	00813823          	sd	s0,16(sp)
    800050b0:	00913423          	sd	s1,8(sp)
    800050b4:	02010413          	addi	s0,sp,32
    800050b8:	00050493          	mv	s1,a0
    if(!string) return;
    800050bc:	00050e63          	beqz	a0,800050d8 <_Z12kprintStringPKc+0x34>
    while(*string)
    800050c0:	0004c503          	lbu	a0,0(s1)
    800050c4:	00050a63          	beqz	a0,800050d8 <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    800050c8:	00000097          	auipc	ra,0x0
    800050cc:	f9c080e7          	jalr	-100(ra) # 80005064 <_Z5kputcc>
        string++;
    800050d0:	00148493          	addi	s1,s1,1
    while(*string)
    800050d4:	fedff06f          	j	800050c0 <_Z12kprintStringPKc+0x1c>
    }
}
    800050d8:	01813083          	ld	ra,24(sp)
    800050dc:	01013403          	ld	s0,16(sp)
    800050e0:	00813483          	ld	s1,8(sp)
    800050e4:	02010113          	addi	sp,sp,32
    800050e8:	00008067          	ret

00000000800050ec <_Z9kprintIntmib>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base, bool sgn){
    800050ec:	fc010113          	addi	sp,sp,-64
    800050f0:	02113c23          	sd	ra,56(sp)
    800050f4:	02813823          	sd	s0,48(sp)
    800050f8:	02913423          	sd	s1,40(sp)
    800050fc:	03213023          	sd	s2,32(sp)
    80005100:	01313c23          	sd	s3,24(sp)
    80005104:	04010413          	addi	s0,sp,64
    80005108:	00050913          	mv	s2,a0
    8000510c:	00058993          	mv	s3,a1
    char buf[16];
    int i;
    if(sgn && base == 10){ 
    80005110:	00060663          	beqz	a2,8000511c <_Z9kprintIntmib+0x30>
    80005114:	00a00793          	li	a5,10
    80005118:	00f58663          	beq	a1,a5,80005124 <_Z9kprintIntmib+0x38>
void kprintInt(uint64 xx, int base, bool sgn){
    8000511c:	00000793          	li	a5,0
    80005120:	01c0006f          	j	8000513c <_Z9kprintIntmib+0x50>
        kputc('-');
    80005124:	02d00513          	li	a0,45
    80005128:	00000097          	auipc	ra,0x0
    8000512c:	f3c080e7          	jalr	-196(ra) # 80005064 <_Z5kputcc>
        xx = -xx;
    80005130:	41200933          	neg	s2,s2
    80005134:	fe9ff06f          	j	8000511c <_Z9kprintIntmib+0x30>
    }

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    80005138:	00070913          	mv	s2,a4
        buf[i++] = kdigits[xx % base];
    8000513c:	033976b3          	remu	a3,s2,s3
    80005140:	0017849b          	addiw	s1,a5,1
    80005144:	0000f717          	auipc	a4,0xf
    80005148:	acc70713          	addi	a4,a4,-1332 # 80013c10 <kdigits>
    8000514c:	00d70733          	add	a4,a4,a3
    80005150:	00074703          	lbu	a4,0(a4)
    80005154:	fd040693          	addi	a3,s0,-48
    80005158:	00f687b3          	add	a5,a3,a5
    8000515c:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80005160:	03395733          	divu	a4,s2,s3
        buf[i++] = kdigits[xx % base];
    80005164:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80005168:	fd3978e3          	bgeu	s2,s3,80005138 <_Z9kprintIntmib+0x4c>
    
    while(--i >= 0)
    8000516c:	fff4849b          	addiw	s1,s1,-1
    80005170:	0004ce63          	bltz	s1,8000518c <_Z9kprintIntmib+0xa0>
        kputc(buf[i]);
    80005174:	fd040793          	addi	a5,s0,-48
    80005178:	009787b3          	add	a5,a5,s1
    8000517c:	ff07c503          	lbu	a0,-16(a5)
    80005180:	00000097          	auipc	ra,0x0
    80005184:	ee4080e7          	jalr	-284(ra) # 80005064 <_Z5kputcc>
    while(--i >= 0)
    80005188:	fe5ff06f          	j	8000516c <_Z9kprintIntmib+0x80>
}
    8000518c:	03813083          	ld	ra,56(sp)
    80005190:	03013403          	ld	s0,48(sp)
    80005194:	02813483          	ld	s1,40(sp)
    80005198:	02013903          	ld	s2,32(sp)
    8000519c:	01813983          	ld	s3,24(sp)
    800051a0:	04010113          	addi	sp,sp,64
    800051a4:	00008067          	ret

00000000800051a8 <_Z10kernelInitv>:
{
    800051a8:	fd010113          	addi	sp,sp,-48
    800051ac:	02113423          	sd	ra,40(sp)
    800051b0:	02813023          	sd	s0,32(sp)
    800051b4:	00913c23          	sd	s1,24(sp)
    800051b8:	01213823          	sd	s2,16(sp)
    800051bc:	01313423          	sd	s3,8(sp)
    800051c0:	01413023          	sd	s4,0(sp)
    800051c4:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    800051c8:	0000a517          	auipc	a0,0xa
    800051cc:	e7050513          	addi	a0,a0,-400 # 8000f038 <CONSOLE_STATUS+0x28>
    800051d0:	00000097          	auipc	ra,0x0
    800051d4:	ed4080e7          	jalr	-300(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_START_ADDR);
    800051d8:	0000a517          	auipc	a0,0xa
    800051dc:	e9050513          	addi	a0,a0,-368 # 8000f068 <CONSOLE_STATUS+0x58>
    800051e0:	00000097          	auipc	ra,0x0
    800051e4:	ec4080e7          	jalr	-316(ra) # 800050a4 <_Z12kprintStringPKc>
    800051e8:	00000613          	li	a2,0
    800051ec:	01000593          	li	a1,16
    800051f0:	0000f797          	auipc	a5,0xf
    800051f4:	a1878793          	addi	a5,a5,-1512 # 80013c08 <HEAP_START_ADDR>
    800051f8:	0007b503          	ld	a0,0(a5)
    800051fc:	00000097          	auipc	ra,0x0
    80005200:	ef0080e7          	jalr	-272(ra) # 800050ec <_Z9kprintIntmib>
    80005204:	0000a517          	auipc	a0,0xa
    80005208:	15450513          	addi	a0,a0,340 # 8000f358 <CONSOLE_STATUS+0x348>
    8000520c:	00000097          	auipc	ra,0x0
    80005210:	e98080e7          	jalr	-360(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    80005214:	0000a517          	auipc	a0,0xa
    80005218:	e6c50513          	addi	a0,a0,-404 # 8000f080 <CONSOLE_STATUS+0x70>
    8000521c:	00000097          	auipc	ra,0x0
    80005220:	e88080e7          	jalr	-376(ra) # 800050a4 <_Z12kprintStringPKc>
    80005224:	00000613          	li	a2,0
    80005228:	01000593          	li	a1,16
    8000522c:	0000f797          	auipc	a5,0xf
    80005230:	9d478793          	addi	a5,a5,-1580 # 80013c00 <HEAP_END_ADDR>
    80005234:	0007b503          	ld	a0,0(a5)
    80005238:	00000097          	auipc	ra,0x0
    8000523c:	eb4080e7          	jalr	-332(ra) # 800050ec <_Z9kprintIntmib>
    80005240:	0000a517          	auipc	a0,0xa
    80005244:	11850513          	addi	a0,a0,280 # 8000f358 <CONSOLE_STATUS+0x348>
    80005248:	00000097          	auipc	ra,0x0
    8000524c:	e5c080e7          	jalr	-420(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    80005250:	0000a517          	auipc	a0,0xa
    80005254:	e4050513          	addi	a0,a0,-448 # 8000f090 <CONSOLE_STATUS+0x80>
    80005258:	00000097          	auipc	ra,0x0
    8000525c:	e4c080e7          	jalr	-436(ra) # 800050a4 <_Z12kprintStringPKc>
    80005260:	00000613          	li	a2,0
    80005264:	01000593          	li	a1,16
    80005268:	fffff797          	auipc	a5,0xfffff
    8000526c:	dac78793          	addi	a5,a5,-596 # 80004014 <KERNEL_TEXT_START>
    80005270:	0007b503          	ld	a0,0(a5)
    80005274:	00000097          	auipc	ra,0x0
    80005278:	e78080e7          	jalr	-392(ra) # 800050ec <_Z9kprintIntmib>
    8000527c:	0000a517          	auipc	a0,0xa
    80005280:	0dc50513          	addi	a0,a0,220 # 8000f358 <CONSOLE_STATUS+0x348>
    80005284:	00000097          	auipc	ra,0x0
    80005288:	e20080e7          	jalr	-480(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    8000528c:	0000a517          	auipc	a0,0xa
    80005290:	e1c50513          	addi	a0,a0,-484 # 8000f0a8 <CONSOLE_STATUS+0x98>
    80005294:	00000097          	auipc	ra,0x0
    80005298:	e10080e7          	jalr	-496(ra) # 800050a4 <_Z12kprintStringPKc>
    8000529c:	00000613          	li	a2,0
    800052a0:	01000593          	li	a1,16
    800052a4:	fffff797          	auipc	a5,0xfffff
    800052a8:	d7878793          	addi	a5,a5,-648 # 8000401c <KERNEL_TEXT_END>
    800052ac:	0007b503          	ld	a0,0(a5)
    800052b0:	00000097          	auipc	ra,0x0
    800052b4:	e3c080e7          	jalr	-452(ra) # 800050ec <_Z9kprintIntmib>
    800052b8:	0000a517          	auipc	a0,0xa
    800052bc:	0a050513          	addi	a0,a0,160 # 8000f358 <CONSOLE_STATUS+0x348>
    800052c0:	00000097          	auipc	ra,0x0
    800052c4:	de4080e7          	jalr	-540(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    800052c8:	0000a517          	auipc	a0,0xa
    800052cc:	df850513          	addi	a0,a0,-520 # 8000f0c0 <CONSOLE_STATUS+0xb0>
    800052d0:	00000097          	auipc	ra,0x0
    800052d4:	dd4080e7          	jalr	-556(ra) # 800050a4 <_Z12kprintStringPKc>
    800052d8:	00000613          	li	a2,0
    800052dc:	01000593          	li	a1,16
    800052e0:	fffff797          	auipc	a5,0xfffff
    800052e4:	d4478793          	addi	a5,a5,-700 # 80004024 <USER_TEXT_START>
    800052e8:	0007b503          	ld	a0,0(a5)
    800052ec:	00000097          	auipc	ra,0x0
    800052f0:	e00080e7          	jalr	-512(ra) # 800050ec <_Z9kprintIntmib>
    800052f4:	0000a517          	auipc	a0,0xa
    800052f8:	06450513          	addi	a0,a0,100 # 8000f358 <CONSOLE_STATUS+0x348>
    800052fc:	00000097          	auipc	ra,0x0
    80005300:	da8080e7          	jalr	-600(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    80005304:	0000a517          	auipc	a0,0xa
    80005308:	dd450513          	addi	a0,a0,-556 # 8000f0d8 <CONSOLE_STATUS+0xc8>
    8000530c:	00000097          	auipc	ra,0x0
    80005310:	d98080e7          	jalr	-616(ra) # 800050a4 <_Z12kprintStringPKc>
    80005314:	00000613          	li	a2,0
    80005318:	01000593          	li	a1,16
    8000531c:	fffff797          	auipc	a5,0xfffff
    80005320:	d1078793          	addi	a5,a5,-752 # 8000402c <USER_TEXT_END>
    80005324:	0007b503          	ld	a0,0(a5)
    80005328:	00000097          	auipc	ra,0x0
    8000532c:	dc4080e7          	jalr	-572(ra) # 800050ec <_Z9kprintIntmib>
    80005330:	0000a517          	auipc	a0,0xa
    80005334:	02850513          	addi	a0,a0,40 # 8000f358 <CONSOLE_STATUS+0x348>
    80005338:	00000097          	auipc	ra,0x0
    8000533c:	d6c080e7          	jalr	-660(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_BSS_START);
    80005340:	0000a517          	auipc	a0,0xa
    80005344:	da850513          	addi	a0,a0,-600 # 8000f0e8 <CONSOLE_STATUS+0xd8>
    80005348:	00000097          	auipc	ra,0x0
    8000534c:	d5c080e7          	jalr	-676(ra) # 800050a4 <_Z12kprintStringPKc>
    80005350:	00000613          	li	a2,0
    80005354:	01000593          	li	a1,16
    80005358:	fffff797          	auipc	a5,0xfffff
    8000535c:	cdc78793          	addi	a5,a5,-804 # 80004034 <USER_BSS_START>
    80005360:	0007b503          	ld	a0,0(a5)
    80005364:	00000097          	auipc	ra,0x0
    80005368:	d88080e7          	jalr	-632(ra) # 800050ec <_Z9kprintIntmib>
    8000536c:	0000a517          	auipc	a0,0xa
    80005370:	fec50513          	addi	a0,a0,-20 # 8000f358 <CONSOLE_STATUS+0x348>
    80005374:	00000097          	auipc	ra,0x0
    80005378:	d30080e7          	jalr	-720(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_BSS_END);
    8000537c:	0000a517          	auipc	a0,0xa
    80005380:	d8450513          	addi	a0,a0,-636 # 8000f100 <CONSOLE_STATUS+0xf0>
    80005384:	00000097          	auipc	ra,0x0
    80005388:	d20080e7          	jalr	-736(ra) # 800050a4 <_Z12kprintStringPKc>
    8000538c:	00000613          	li	a2,0
    80005390:	01000593          	li	a1,16
    80005394:	fffff797          	auipc	a5,0xfffff
    80005398:	ca878793          	addi	a5,a5,-856 # 8000403c <USER_BSS_END>
    8000539c:	0007b503          	ld	a0,0(a5)
    800053a0:	00000097          	auipc	ra,0x0
    800053a4:	d4c080e7          	jalr	-692(ra) # 800050ec <_Z9kprintIntmib>
    800053a8:	0000a517          	auipc	a0,0xa
    800053ac:	fb050513          	addi	a0,a0,-80 # 8000f358 <CONSOLE_STATUS+0x348>
    800053b0:	00000097          	auipc	ra,0x0
    800053b4:	cf4080e7          	jalr	-780(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_DATA_START);
    800053b8:	0000a517          	auipc	a0,0xa
    800053bc:	d5850513          	addi	a0,a0,-680 # 8000f110 <CONSOLE_STATUS+0x100>
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	ce4080e7          	jalr	-796(ra) # 800050a4 <_Z12kprintStringPKc>
    800053c8:	00000613          	li	a2,0
    800053cc:	01000593          	li	a1,16
    800053d0:	fffff797          	auipc	a5,0xfffff
    800053d4:	c7478793          	addi	a5,a5,-908 # 80004044 <USER_DATA_START>
    800053d8:	0007b503          	ld	a0,0(a5)
    800053dc:	00000097          	auipc	ra,0x0
    800053e0:	d10080e7          	jalr	-752(ra) # 800050ec <_Z9kprintIntmib>
    800053e4:	0000a517          	auipc	a0,0xa
    800053e8:	f7450513          	addi	a0,a0,-140 # 8000f358 <CONSOLE_STATUS+0x348>
    800053ec:	00000097          	auipc	ra,0x0
    800053f0:	cb8080e7          	jalr	-840(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_DATA_END);
    800053f4:	0000a517          	auipc	a0,0xa
    800053f8:	d3450513          	addi	a0,a0,-716 # 8000f128 <CONSOLE_STATUS+0x118>
    800053fc:	00000097          	auipc	ra,0x0
    80005400:	ca8080e7          	jalr	-856(ra) # 800050a4 <_Z12kprintStringPKc>
    80005404:	00000613          	li	a2,0
    80005408:	01000593          	li	a1,16
    8000540c:	fffff797          	auipc	a5,0xfffff
    80005410:	c4078793          	addi	a5,a5,-960 # 8000404c <USER_DATA_END>
    80005414:	0007b503          	ld	a0,0(a5)
    80005418:	00000097          	auipc	ra,0x0
    8000541c:	cd4080e7          	jalr	-812(ra) # 800050ec <_Z9kprintIntmib>
    80005420:	0000a517          	auipc	a0,0xa
    80005424:	f3850513          	addi	a0,a0,-200 # 8000f358 <CONSOLE_STATUS+0x348>
    80005428:	00000097          	auipc	ra,0x0
    8000542c:	c7c080e7          	jalr	-900(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_RODATA_START);
    80005430:	0000a517          	auipc	a0,0xa
    80005434:	d0850513          	addi	a0,a0,-760 # 8000f138 <CONSOLE_STATUS+0x128>
    80005438:	00000097          	auipc	ra,0x0
    8000543c:	c6c080e7          	jalr	-916(ra) # 800050a4 <_Z12kprintStringPKc>
    80005440:	00000613          	li	a2,0
    80005444:	01000593          	li	a1,16
    80005448:	fffff797          	auipc	a5,0xfffff
    8000544c:	c0c78793          	addi	a5,a5,-1012 # 80004054 <USER_RODATA_START>
    80005450:	0007b503          	ld	a0,0(a5)
    80005454:	00000097          	auipc	ra,0x0
    80005458:	c98080e7          	jalr	-872(ra) # 800050ec <_Z9kprintIntmib>
    8000545c:	0000a517          	auipc	a0,0xa
    80005460:	efc50513          	addi	a0,a0,-260 # 8000f358 <CONSOLE_STATUS+0x348>
    80005464:	00000097          	auipc	ra,0x0
    80005468:	c40080e7          	jalr	-960(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_RODATA_END);
    8000546c:	0000a517          	auipc	a0,0xa
    80005470:	ce450513          	addi	a0,a0,-796 # 8000f150 <CONSOLE_STATUS+0x140>
    80005474:	00000097          	auipc	ra,0x0
    80005478:	c30080e7          	jalr	-976(ra) # 800050a4 <_Z12kprintStringPKc>
    8000547c:	00000613          	li	a2,0
    80005480:	01000593          	li	a1,16
    80005484:	fffff797          	auipc	a5,0xfffff
    80005488:	bd878793          	addi	a5,a5,-1064 # 8000405c <USER_RODATA_END>
    8000548c:	0007b503          	ld	a0,0(a5)
    80005490:	00000097          	auipc	ra,0x0
    80005494:	c5c080e7          	jalr	-932(ra) # 800050ec <_Z9kprintIntmib>
    80005498:	0000a517          	auipc	a0,0xa
    8000549c:	ec050513          	addi	a0,a0,-320 # 8000f358 <CONSOLE_STATUS+0x348>
    800054a0:	00000097          	auipc	ra,0x0
    800054a4:	c04080e7          	jalr	-1020(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    800054a8:	0000a517          	auipc	a0,0xa
    800054ac:	cc050513          	addi	a0,a0,-832 # 8000f168 <CONSOLE_STATUS+0x158>
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	bf4080e7          	jalr	-1036(ra) # 800050a4 <_Z12kprintStringPKc>
    800054b8:	00000613          	li	a2,0
    800054bc:	01000593          	li	a1,16
    800054c0:	00001537          	lui	a0,0x1
    800054c4:	00000097          	auipc	ra,0x0
    800054c8:	c28080e7          	jalr	-984(ra) # 800050ec <_Z9kprintIntmib>
    800054cc:	0000a517          	auipc	a0,0xa
    800054d0:	e8c50513          	addi	a0,a0,-372 # 8000f358 <CONSOLE_STATUS+0x348>
    800054d4:	00000097          	auipc	ra,0x0
    800054d8:	bd0080e7          	jalr	-1072(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("\n\n");
    800054dc:	0000b517          	auipc	a0,0xb
    800054e0:	b2c50513          	addi	a0,a0,-1236 # 80010008 <_ZL11CACHE_NAMES+0x448>
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	bc0080e7          	jalr	-1088(ra) # 800050a4 <_Z12kprintStringPKc>
    NoAlloc::init();
    800054ec:	00003097          	auipc	ra,0x3
    800054f0:	9dc080e7          	jalr	-1572(ra) # 80007ec8 <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    800054f4:	0000a517          	auipc	a0,0xa
    800054f8:	c8450513          	addi	a0,a0,-892 # 8000f178 <CONSOLE_STATUS+0x168>
    800054fc:	00000097          	auipc	ra,0x0
    80005500:	ba8080e7          	jalr	-1112(ra) # 800050a4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005504:	0000a517          	auipc	a0,0xa
    80005508:	c8c50513          	addi	a0,a0,-884 # 8000f190 <CONSOLE_STATUS+0x180>
    8000550c:	00000097          	auipc	ra,0x0
    80005510:	b98080e7          	jalr	-1128(ra) # 800050a4 <_Z12kprintStringPKc>
    80005514:	00000613          	li	a2,0
    80005518:	01000593          	li	a1,16
    8000551c:	00010797          	auipc	a5,0x10
    80005520:	ec478793          	addi	a5,a5,-316 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80005524:	0007b503          	ld	a0,0(a5)
    80005528:	00000097          	auipc	ra,0x0
    8000552c:	bc4080e7          	jalr	-1084(ra) # 800050ec <_Z9kprintIntmib>
    80005530:	0000a517          	auipc	a0,0xa
    80005534:	e2850513          	addi	a0,a0,-472 # 8000f358 <CONSOLE_STATUS+0x348>
    80005538:	00000097          	auipc	ra,0x0
    8000553c:	b6c080e7          	jalr	-1172(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("Initalizing kmem!!!\n");
    80005540:	0000a517          	auipc	a0,0xa
    80005544:	c6850513          	addi	a0,a0,-920 # 8000f1a8 <CONSOLE_STATUS+0x198>
    80005548:	00000097          	auipc	ra,0x0
    8000554c:	b5c080e7          	jalr	-1188(ra) # 800050a4 <_Z12kprintStringPKc>
    if(kmi()){
    80005550:	00002097          	auipc	ra,0x2
    80005554:	a54080e7          	jalr	-1452(ra) # 80006fa4 <_Z3kmiv>
    80005558:	18051e63          	bnez	a0,800056f4 <_Z10kernelInitv+0x54c>
    8000555c:	00050493          	mv	s1,a0
    kprintString("kmem initalized!!!\n");
    80005560:	0000a517          	auipc	a0,0xa
    80005564:	c8850513          	addi	a0,a0,-888 # 8000f1e8 <CONSOLE_STATUS+0x1d8>
    80005568:	00000097          	auipc	ra,0x0
    8000556c:	b3c080e7          	jalr	-1220(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("Paging init!\n");
    80005570:	0000a517          	auipc	a0,0xa
    80005574:	c9050513          	addi	a0,a0,-880 # 8000f200 <CONSOLE_STATUS+0x1f0>
    80005578:	00000097          	auipc	ra,0x0
    8000557c:	b2c080e7          	jalr	-1236(ra) # 800050a4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80005580:	000407b7          	lui	a5,0x40
    80005584:	1007a073          	csrs	sstatus,a5
    Pager& pager = Pager::getInstance();
    80005588:	00006097          	auipc	ra,0x6
    8000558c:	158080e7          	jalr	344(ra) # 8000b6e0 <_ZN5Pager11getInstanceEv>
    80005590:	00050913          	mv	s2,a0
    pager.map_kernel();
    80005594:	00006097          	auipc	ra,0x6
    80005598:	364080e7          	jalr	868(ra) # 8000b8f8 <_ZN5Pager10map_kernelEv>
    pager.map_user();
    8000559c:	00090513          	mv	a0,s2
    800055a0:	00006097          	auipc	ra,0x6
    800055a4:	400080e7          	jalr	1024(ra) # 8000b9a0 <_ZN5Pager8map_userEv>
    pager.start_paging();
    800055a8:	00090513          	mv	a0,s2
    800055ac:	00006097          	auipc	ra,0x6
    800055b0:	4c0080e7          	jalr	1216(ra) # 8000ba6c <_ZN5Pager12start_pagingEv>
    kprintString("Paging initalized!\n");
    800055b4:	0000a517          	auipc	a0,0xa
    800055b8:	c5c50513          	addi	a0,a0,-932 # 8000f210 <CONSOLE_STATUS+0x200>
    800055bc:	00000097          	auipc	ra,0x0
    800055c0:	ae8080e7          	jalr	-1304(ra) # 800050a4 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec); 
    800055c4:	fffff797          	auipc	a5,0xfffff
    800055c8:	aac78793          	addi	a5,a5,-1364 # 80004070 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    800055cc:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    800055d0:	0000a517          	auipc	a0,0xa
    800055d4:	c5850513          	addi	a0,a0,-936 # 8000f228 <CONSOLE_STATUS+0x218>
    800055d8:	00000097          	auipc	ra,0x0
    800055dc:	acc080e7          	jalr	-1332(ra) # 800050a4 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance().print_list();
    800055e0:	00002097          	auipc	ra,0x2
    800055e4:	068080e7          	jalr	104(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    800055e8:	00002097          	auipc	ra,0x2
    800055ec:	6a4080e7          	jalr	1700(ra) # 80007c8c <_ZN15MemoryAllocator10print_listEv>
    kprintString("MemoryAllocator initalized!\n");
    800055f0:	0000a517          	auipc	a0,0xa
    800055f4:	c5050513          	addi	a0,a0,-944 # 8000f240 <CONSOLE_STATUS+0x230>
    800055f8:	00000097          	auipc	ra,0x0
    800055fc:	aac080e7          	jalr	-1364(ra) # 800050a4 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80005600:	fffff097          	auipc	ra,0xfffff
    80005604:	f74080e7          	jalr	-140(ra) # 80004574 <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80005608:	0000a517          	auipc	a0,0xa
    8000560c:	c5850513          	addi	a0,a0,-936 # 8000f260 <CONSOLE_STATUS+0x250>
    80005610:	00000097          	auipc	ra,0x0
    80005614:	a94080e7          	jalr	-1388(ra) # 800050a4 <_Z12kprintStringPKc>
    StdIO::initalize();
    80005618:	00004097          	auipc	ra,0x4
    8000561c:	684080e7          	jalr	1668(ra) # 80009c9c <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80005620:	0000a517          	auipc	a0,0xa
    80005624:	c5850513          	addi	a0,a0,-936 # 8000f278 <CONSOLE_STATUS+0x268>
    80005628:	00000097          	auipc	ra,0x0
    8000562c:	a7c080e7          	jalr	-1412(ra) # 800050a4 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80005630:	fffff097          	auipc	ra,0xfffff
    80005634:	448080e7          	jalr	1096(ra) # 80004a78 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80005638:	0000a517          	auipc	a0,0xa
    8000563c:	c5850513          	addi	a0,a0,-936 # 8000f290 <CONSOLE_STATUS+0x280>
    80005640:	00000097          	auipc	ra,0x0
    80005644:	a64080e7          	jalr	-1436(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80005648:	0000a517          	auipc	a0,0xa
    8000564c:	c6850513          	addi	a0,a0,-920 # 8000f2b0 <CONSOLE_STATUS+0x2a0>
    80005650:	00000097          	auipc	ra,0x0
    80005654:	a54080e7          	jalr	-1452(ra) # 800050a4 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80005658:	00002097          	auipc	ra,0x2
    8000565c:	ff0080e7          	jalr	-16(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    80005660:	04000593          	li	a1,64
    80005664:	00002097          	auipc	ra,0x2
    80005668:	17c080e7          	jalr	380(ra) # 800077e0 <_ZN15MemoryAllocator9mem_allocEm>
    8000566c:	00050913          	mv	s2,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80005670:	00050613          	mv	a2,a0
    80005674:	00000593          	li	a1,0
    80005678:	00008517          	auipc	a0,0x8
    8000567c:	62050513          	addi	a0,a0,1568 # 8000dc98 <_Z15userMainWrapperPv>
    80005680:	fffff097          	auipc	ra,0xfffff
    80005684:	35c080e7          	jalr	860(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005688:	00050a13          	mv	s4,a0
    uint64* idleThreadStack = (uint64*)SlabAllocator::getInstance().kmalloc(DEFAULT_STACK_SIZE);
    8000568c:	00004097          	auipc	ra,0x4
    80005690:	c88080e7          	jalr	-888(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80005694:	000015b7          	lui	a1,0x1
    80005698:	00004097          	auipc	ra,0x4
    8000569c:	d80080e7          	jalr	-640(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
    800056a0:	00050993          	mv	s3,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    800056a4:	00050613          	mv	a2,a0
    800056a8:	00000593          	li	a1,0
    800056ac:	00000517          	auipc	a0,0x0
    800056b0:	99c50513          	addi	a0,a0,-1636 # 80005048 <_Z12idleFunctionPv>
    800056b4:	fffff097          	auipc	ra,0xfffff
    800056b8:	328080e7          	jalr	808(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    800056bc:	02050aa3          	sb	zero,53(a0)
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    800056c0:	06090663          	beqz	s2,8000572c <_Z10kernelInitv+0x584>
    800056c4:	06098863          	beqz	s3,80005734 <_Z10kernelInitv+0x58c>
    800056c8:	06050a63          	beqz	a0,8000573c <_Z10kernelInitv+0x594>
    800056cc:	060a0c63          	beqz	s4,80005744 <_Z10kernelInitv+0x59c>
        kprintString("Threads successfully initalized!\n");
    800056d0:	0000a517          	auipc	a0,0xa
    800056d4:	c1050513          	addi	a0,a0,-1008 # 8000f2e0 <CONSOLE_STATUS+0x2d0>
    800056d8:	00000097          	auipc	ra,0x0
    800056dc:	9cc080e7          	jalr	-1588(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    800056e0:	0000a517          	auipc	a0,0xa
    800056e4:	c2850513          	addi	a0,a0,-984 # 8000f308 <CONSOLE_STATUS+0x2f8>
    800056e8:	00000097          	auipc	ra,0x0
    800056ec:	9bc080e7          	jalr	-1604(ra) # 800050a4 <_Z12kprintStringPKc>
    return 0;
    800056f0:	0180006f          	j	80005708 <_Z10kernelInitv+0x560>
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
    800056f4:	0000a517          	auipc	a0,0xa
    800056f8:	acc50513          	addi	a0,a0,-1332 # 8000f1c0 <CONSOLE_STATUS+0x1b0>
    800056fc:	00000097          	auipc	ra,0x0
    80005700:	9a8080e7          	jalr	-1624(ra) # 800050a4 <_Z12kprintStringPKc>
        return 1;
    80005704:	00100493          	li	s1,1
}
    80005708:	00048513          	mv	a0,s1
    8000570c:	02813083          	ld	ra,40(sp)
    80005710:	02013403          	ld	s0,32(sp)
    80005714:	01813483          	ld	s1,24(sp)
    80005718:	01013903          	ld	s2,16(sp)
    8000571c:	00813983          	ld	s3,8(sp)
    80005720:	00013a03          	ld	s4,0(sp)
    80005724:	03010113          	addi	sp,sp,48
    80005728:	00008067          	ret
        return -1; /* EXCEPTION */
    8000572c:	fff00493          	li	s1,-1
    80005730:	fd9ff06f          	j	80005708 <_Z10kernelInitv+0x560>
    80005734:	fff00493          	li	s1,-1
    80005738:	fd1ff06f          	j	80005708 <_Z10kernelInitv+0x560>
    8000573c:	fff00493          	li	s1,-1
    80005740:	fc9ff06f          	j	80005708 <_Z10kernelInitv+0x560>
    80005744:	fff00493          	li	s1,-1
    80005748:	fc1ff06f          	j	80005708 <_Z10kernelInitv+0x560>

000000008000574c <_Z13newKernelInitv>:

int newKernelInit(){
    8000574c:	fe010113          	addi	sp,sp,-32
    80005750:	00113c23          	sd	ra,24(sp)
    80005754:	00813823          	sd	s0,16(sp)
    80005758:	00913423          	sd	s1,8(sp)
    8000575c:	02010413          	addi	s0,sp,32
    kprintString("--------------KERNEL INIT--------------\n");
    80005760:	0000a517          	auipc	a0,0xa
    80005764:	8d850513          	addi	a0,a0,-1832 # 8000f038 <CONSOLE_STATUS+0x28>
    80005768:	00000097          	auipc	ra,0x0
    8000576c:	93c080e7          	jalr	-1732(ra) # 800050a4 <_Z12kprintStringPKc>
    /* CHECKING VALUES OF KERNEL STATIC VARIABLES */
    KCHECKPRINT(HEAP_START_ADDR);
    80005770:	0000a517          	auipc	a0,0xa
    80005774:	8f850513          	addi	a0,a0,-1800 # 8000f068 <CONSOLE_STATUS+0x58>
    80005778:	00000097          	auipc	ra,0x0
    8000577c:	92c080e7          	jalr	-1748(ra) # 800050a4 <_Z12kprintStringPKc>
    80005780:	00000613          	li	a2,0
    80005784:	01000593          	li	a1,16
    80005788:	0000e797          	auipc	a5,0xe
    8000578c:	48078793          	addi	a5,a5,1152 # 80013c08 <HEAP_START_ADDR>
    80005790:	0007b503          	ld	a0,0(a5)
    80005794:	00000097          	auipc	ra,0x0
    80005798:	958080e7          	jalr	-1704(ra) # 800050ec <_Z9kprintIntmib>
    8000579c:	0000a517          	auipc	a0,0xa
    800057a0:	bbc50513          	addi	a0,a0,-1092 # 8000f358 <CONSOLE_STATUS+0x348>
    800057a4:	00000097          	auipc	ra,0x0
    800057a8:	900080e7          	jalr	-1792(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(HEAP_END_ADDR);
    800057ac:	0000a517          	auipc	a0,0xa
    800057b0:	8d450513          	addi	a0,a0,-1836 # 8000f080 <CONSOLE_STATUS+0x70>
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	8f0080e7          	jalr	-1808(ra) # 800050a4 <_Z12kprintStringPKc>
    800057bc:	00000613          	li	a2,0
    800057c0:	01000593          	li	a1,16
    800057c4:	0000e797          	auipc	a5,0xe
    800057c8:	43c78793          	addi	a5,a5,1084 # 80013c00 <HEAP_END_ADDR>
    800057cc:	0007b503          	ld	a0,0(a5)
    800057d0:	00000097          	auipc	ra,0x0
    800057d4:	91c080e7          	jalr	-1764(ra) # 800050ec <_Z9kprintIntmib>
    800057d8:	0000a517          	auipc	a0,0xa
    800057dc:	b8050513          	addi	a0,a0,-1152 # 8000f358 <CONSOLE_STATUS+0x348>
    800057e0:	00000097          	auipc	ra,0x0
    800057e4:	8c4080e7          	jalr	-1852(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_START);
    800057e8:	0000a517          	auipc	a0,0xa
    800057ec:	8a850513          	addi	a0,a0,-1880 # 8000f090 <CONSOLE_STATUS+0x80>
    800057f0:	00000097          	auipc	ra,0x0
    800057f4:	8b4080e7          	jalr	-1868(ra) # 800050a4 <_Z12kprintStringPKc>
    800057f8:	00000613          	li	a2,0
    800057fc:	01000593          	li	a1,16
    80005800:	fffff797          	auipc	a5,0xfffff
    80005804:	81478793          	addi	a5,a5,-2028 # 80004014 <KERNEL_TEXT_START>
    80005808:	0007b503          	ld	a0,0(a5)
    8000580c:	00000097          	auipc	ra,0x0
    80005810:	8e0080e7          	jalr	-1824(ra) # 800050ec <_Z9kprintIntmib>
    80005814:	0000a517          	auipc	a0,0xa
    80005818:	b4450513          	addi	a0,a0,-1212 # 8000f358 <CONSOLE_STATUS+0x348>
    8000581c:	00000097          	auipc	ra,0x0
    80005820:	888080e7          	jalr	-1912(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(KERNEL_TEXT_END);
    80005824:	0000a517          	auipc	a0,0xa
    80005828:	88450513          	addi	a0,a0,-1916 # 8000f0a8 <CONSOLE_STATUS+0x98>
    8000582c:	00000097          	auipc	ra,0x0
    80005830:	878080e7          	jalr	-1928(ra) # 800050a4 <_Z12kprintStringPKc>
    80005834:	00000613          	li	a2,0
    80005838:	01000593          	li	a1,16
    8000583c:	ffffe797          	auipc	a5,0xffffe
    80005840:	7e078793          	addi	a5,a5,2016 # 8000401c <KERNEL_TEXT_END>
    80005844:	0007b503          	ld	a0,0(a5)
    80005848:	00000097          	auipc	ra,0x0
    8000584c:	8a4080e7          	jalr	-1884(ra) # 800050ec <_Z9kprintIntmib>
    80005850:	0000a517          	auipc	a0,0xa
    80005854:	b0850513          	addi	a0,a0,-1272 # 8000f358 <CONSOLE_STATUS+0x348>
    80005858:	00000097          	auipc	ra,0x0
    8000585c:	84c080e7          	jalr	-1972(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_START);
    80005860:	0000a517          	auipc	a0,0xa
    80005864:	86050513          	addi	a0,a0,-1952 # 8000f0c0 <CONSOLE_STATUS+0xb0>
    80005868:	00000097          	auipc	ra,0x0
    8000586c:	83c080e7          	jalr	-1988(ra) # 800050a4 <_Z12kprintStringPKc>
    80005870:	00000613          	li	a2,0
    80005874:	01000593          	li	a1,16
    80005878:	ffffe797          	auipc	a5,0xffffe
    8000587c:	7ac78793          	addi	a5,a5,1964 # 80004024 <USER_TEXT_START>
    80005880:	0007b503          	ld	a0,0(a5)
    80005884:	00000097          	auipc	ra,0x0
    80005888:	868080e7          	jalr	-1944(ra) # 800050ec <_Z9kprintIntmib>
    8000588c:	0000a517          	auipc	a0,0xa
    80005890:	acc50513          	addi	a0,a0,-1332 # 8000f358 <CONSOLE_STATUS+0x348>
    80005894:	00000097          	auipc	ra,0x0
    80005898:	810080e7          	jalr	-2032(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(USER_TEXT_END);
    8000589c:	0000a517          	auipc	a0,0xa
    800058a0:	83c50513          	addi	a0,a0,-1988 # 8000f0d8 <CONSOLE_STATUS+0xc8>
    800058a4:	00000097          	auipc	ra,0x0
    800058a8:	800080e7          	jalr	-2048(ra) # 800050a4 <_Z12kprintStringPKc>
    800058ac:	00000613          	li	a2,0
    800058b0:	01000593          	li	a1,16
    800058b4:	ffffe797          	auipc	a5,0xffffe
    800058b8:	77878793          	addi	a5,a5,1912 # 8000402c <USER_TEXT_END>
    800058bc:	0007b503          	ld	a0,0(a5)
    800058c0:	00000097          	auipc	ra,0x0
    800058c4:	82c080e7          	jalr	-2004(ra) # 800050ec <_Z9kprintIntmib>
    800058c8:	0000a517          	auipc	a0,0xa
    800058cc:	a9050513          	addi	a0,a0,-1392 # 8000f358 <CONSOLE_STATUS+0x348>
    800058d0:	fffff097          	auipc	ra,0xfffff
    800058d4:	7d4080e7          	jalr	2004(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(sizeof(PMT));
    800058d8:	0000a517          	auipc	a0,0xa
    800058dc:	89050513          	addi	a0,a0,-1904 # 8000f168 <CONSOLE_STATUS+0x158>
    800058e0:	fffff097          	auipc	ra,0xfffff
    800058e4:	7c4080e7          	jalr	1988(ra) # 800050a4 <_Z12kprintStringPKc>
    800058e8:	00000613          	li	a2,0
    800058ec:	01000593          	li	a1,16
    800058f0:	00001537          	lui	a0,0x1
    800058f4:	fffff097          	auipc	ra,0xfffff
    800058f8:	7f8080e7          	jalr	2040(ra) # 800050ec <_Z9kprintIntmib>
    800058fc:	0000a517          	auipc	a0,0xa
    80005900:	a5c50513          	addi	a0,a0,-1444 # 8000f358 <CONSOLE_STATUS+0x348>
    80005904:	fffff097          	auipc	ra,0xfffff
    80005908:	7a0080e7          	jalr	1952(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("\n\n");
    8000590c:	0000a517          	auipc	a0,0xa
    80005910:	6fc50513          	addi	a0,a0,1788 # 80010008 <_ZL11CACHE_NAMES+0x448>
    80005914:	fffff097          	auipc	ra,0xfffff
    80005918:	790080e7          	jalr	1936(ra) # 800050a4 <_Z12kprintStringPKc>

    /* INITALIZING MAIN KERNEL OBJECTS */
    NoAlloc::init(); /* No Allocator init */ 
    8000591c:	00002097          	auipc	ra,0x2
    80005920:	5ac080e7          	jalr	1452(ra) # 80007ec8 <_ZN7NoAlloc4initEv>
    kprintString("NoAlloc initalized: ");
    80005924:	0000a517          	auipc	a0,0xa
    80005928:	85450513          	addi	a0,a0,-1964 # 8000f178 <CONSOLE_STATUS+0x168>
    8000592c:	fffff097          	auipc	ra,0xfffff
    80005930:	778080e7          	jalr	1912(ra) # 800050a4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005934:	0000a517          	auipc	a0,0xa
    80005938:	85c50513          	addi	a0,a0,-1956 # 8000f190 <CONSOLE_STATUS+0x180>
    8000593c:	fffff097          	auipc	ra,0xfffff
    80005940:	768080e7          	jalr	1896(ra) # 800050a4 <_Z12kprintStringPKc>
    80005944:	00000613          	li	a2,0
    80005948:	01000593          	li	a1,16
    8000594c:	00010797          	auipc	a5,0x10
    80005950:	a9478793          	addi	a5,a5,-1388 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80005954:	0007b503          	ld	a0,0(a5)
    80005958:	fffff097          	auipc	ra,0xfffff
    8000595c:	794080e7          	jalr	1940(ra) # 800050ec <_Z9kprintIntmib>
    80005960:	0000a517          	auipc	a0,0xa
    80005964:	9f850513          	addi	a0,a0,-1544 # 8000f358 <CONSOLE_STATUS+0x348>
    80005968:	fffff097          	auipc	ra,0xfffff
    8000596c:	73c080e7          	jalr	1852(ra) # 800050a4 <_Z12kprintStringPKc>
    

    kprintString("Initalizing kmem!!!\n");
    80005970:	0000a517          	auipc	a0,0xa
    80005974:	83850513          	addi	a0,a0,-1992 # 8000f1a8 <CONSOLE_STATUS+0x198>
    80005978:	fffff097          	auipc	ra,0xfffff
    8000597c:	72c080e7          	jalr	1836(ra) # 800050a4 <_Z12kprintStringPKc>
    if(kmi()){
    80005980:	00001097          	auipc	ra,0x1
    80005984:	624080e7          	jalr	1572(ra) # 80006fa4 <_Z3kmiv>
    80005988:	06051663          	bnez	a0,800059f4 <_Z13newKernelInitv+0x2a8>
    8000598c:	00050493          	mv	s1,a0
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
        return 1;
    }
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    80005990:	0000a517          	auipc	a0,0xa
    80005994:	80050513          	addi	a0,a0,-2048 # 8000f190 <CONSOLE_STATUS+0x180>
    80005998:	fffff097          	auipc	ra,0xfffff
    8000599c:	70c080e7          	jalr	1804(ra) # 800050a4 <_Z12kprintStringPKc>
    800059a0:	00000613          	li	a2,0
    800059a4:	01000593          	li	a1,16
    800059a8:	00010797          	auipc	a5,0x10
    800059ac:	a3878793          	addi	a5,a5,-1480 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    800059b0:	0007b503          	ld	a0,0(a5)
    800059b4:	fffff097          	auipc	ra,0xfffff
    800059b8:	738080e7          	jalr	1848(ra) # 800050ec <_Z9kprintIntmib>
    800059bc:	0000a517          	auipc	a0,0xa
    800059c0:	99c50513          	addi	a0,a0,-1636 # 8000f358 <CONSOLE_STATUS+0x348>
    800059c4:	fffff097          	auipc	ra,0xfffff
    800059c8:	6e0080e7          	jalr	1760(ra) # 800050a4 <_Z12kprintStringPKc>
    /* Pager Init */
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    800059cc:	0000a517          	auipc	a0,0xa
    800059d0:	93c50513          	addi	a0,a0,-1732 # 8000f308 <CONSOLE_STATUS+0x2f8>
    800059d4:	fffff097          	auipc	ra,0xfffff
    800059d8:	6d0080e7          	jalr	1744(ra) # 800050a4 <_Z12kprintStringPKc>
    return 0;
}
    800059dc:	00048513          	mv	a0,s1
    800059e0:	01813083          	ld	ra,24(sp)
    800059e4:	01013403          	ld	s0,16(sp)
    800059e8:	00813483          	ld	s1,8(sp)
    800059ec:	02010113          	addi	sp,sp,32
    800059f0:	00008067          	ret
        kprintString("KMEM NOT SUCCESSFULLY INITALIZED!!!\n");
    800059f4:	00009517          	auipc	a0,0x9
    800059f8:	7cc50513          	addi	a0,a0,1996 # 8000f1c0 <CONSOLE_STATUS+0x1b0>
    800059fc:	fffff097          	auipc	ra,0xfffff
    80005a00:	6a8080e7          	jalr	1704(ra) # 800050a4 <_Z12kprintStringPKc>
        return 1;
    80005a04:	00100493          	li	s1,1
    80005a08:	fd5ff06f          	j	800059dc <_Z13newKernelInitv+0x290>

0000000080005a0c <_Z8align4kbm>:

uint64 align4kb(uint64 input){
    80005a0c:	ff010113          	addi	sp,sp,-16
    80005a10:	00813423          	sd	s0,8(sp)
    80005a14:	01010413          	addi	s0,sp,16
    return  (input + 4095ULL) & ( (~0ULL) << 12);
    80005a18:	000017b7          	lui	a5,0x1
    80005a1c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80005a20:	00f50533          	add	a0,a0,a5
}
    80005a24:	fffff7b7          	lui	a5,0xfffff
    80005a28:	00f57533          	and	a0,a0,a5
    80005a2c:	00813403          	ld	s0,8(sp)
    80005a30:	01010113          	addi	sp,sp,16
    80005a34:	00008067          	ret

0000000080005a38 <_Z11closest2powm>:


uint64 closest2pow(uint64 input){ 
    80005a38:	ff010113          	addi	sp,sp,-16
    80005a3c:	00813423          	sd	s0,8(sp)
    80005a40:	01010413          	addi	s0,sp,16
    /* set start to 2^0 */
    uint64 i = 1; 
    80005a44:	00100793          	li	a5,1

    /* iterate till i >= input */
    while ( i < input){ i <<= 1; }
    80005a48:	00a7f663          	bgeu	a5,a0,80005a54 <_Z11closest2powm+0x1c>
    80005a4c:	00179793          	slli	a5,a5,0x1
    80005a50:	ff9ff06f          	j	80005a48 <_Z11closest2powm+0x10>
    
    return i;
}
    80005a54:	00078513          	mv	a0,a5
    80005a58:	00813403          	ld	s0,8(sp)
    80005a5c:	01010113          	addi	sp,sp,16
    80005a60:	00008067          	ret

0000000080005a64 <_Z4log2m>:

char log2(uint64 input){
    80005a64:	ff010113          	addi	sp,sp,-16
    80005a68:	00813423          	sd	s0,8(sp)
    80005a6c:	01010413          	addi	s0,sp,16
    int t = 0;
    80005a70:	00000793          	li	a5,0
    while(input > 1) {
    80005a74:	00100713          	li	a4,1
    80005a78:	00a77863          	bgeu	a4,a0,80005a88 <_Z4log2m+0x24>
        input >>= 1;
    80005a7c:	00155513          	srli	a0,a0,0x1
        t++;
    80005a80:	0017879b          	addiw	a5,a5,1
    while(input > 1) {
    80005a84:	ff1ff06f          	j	80005a74 <_Z4log2m+0x10>
    }
    return t;
}
    80005a88:	0ff7f513          	andi	a0,a5,255
    80005a8c:	00813403          	ld	s0,8(sp)
    80005a90:	01010113          	addi	sp,sp,16
    80005a94:	00008067          	ret

0000000080005a98 <_Z3osbm>:

bool osb(uint64 input){
    80005a98:	ff010113          	addi	sp,sp,-16
    80005a9c:	00813423          	sd	s0,8(sp)
    80005aa0:	01010413          	addi	s0,sp,16
    if (!input) return 0;
    80005aa4:	02050063          	beqz	a0,80005ac4 <_Z3osbm+0x2c>
    return (input & (-input)) == input;
    80005aa8:	40a007b3          	neg	a5,a0
    80005aac:	00a7f7b3          	and	a5,a5,a0
    80005ab0:	40a78533          	sub	a0,a5,a0
    80005ab4:	00153513          	seqz	a0,a0
}
    80005ab8:	00813403          	ld	s0,8(sp)
    80005abc:	01010113          	addi	sp,sp,16
    80005ac0:	00008067          	ret
    if (!input) return 0;
    80005ac4:	00000513          	li	a0,0
    80005ac8:	ff1ff06f          	j	80005ab8 <_Z3osbm+0x20>

0000000080005acc <_Z13oldKernelMainv>:
#include"../../../h/kernel_test.h"


extern "C" void kTestMain();

int oldKernelMain(){
    80005acc:	fd010113          	addi	sp,sp,-48
    80005ad0:	02113423          	sd	ra,40(sp)
    80005ad4:	02813023          	sd	s0,32(sp)
    80005ad8:	00913c23          	sd	s1,24(sp)
    80005adc:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    80005ae0:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    80005ae4:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    80005ae8:	fffff097          	auipc	ra,0xfffff
    80005aec:	d60080e7          	jalr	-672(ra) # 80004848 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    80005af0:	fffff097          	auipc	ra,0xfffff
    80005af4:	6b8080e7          	jalr	1720(ra) # 800051a8 <_Z10kernelInitv>
    if(panic < 0){
    80005af8:	04054e63          	bltz	a0,80005b54 <_Z13oldKernelMainv+0x88>
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    kTestMain();
    80005afc:	00005097          	auipc	ra,0x5
    80005b00:	ce4080e7          	jalr	-796(ra) # 8000a7e0 <kTestMain>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005b04:	100027f3          	csrr	a5,sstatus
    80005b08:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005b0c:	fd843483          	ld	s1,-40(s0)

    uint64 sstatus = Riscv::r_sstatus();
    kprintString("Starting User Process\n");
    80005b10:	0000a517          	auipc	a0,0xa
    80005b14:	85050513          	addi	a0,a0,-1968 # 8000f360 <CONSOLE_STATUS+0x350>
    80005b18:	fffff097          	auipc	ra,0xfffff
    80005b1c:	58c080e7          	jalr	1420(ra) # 800050a4 <_Z12kprintStringPKc>
    TCB::yield();
    80005b20:	fffff097          	auipc	ra,0xfffff
    80005b24:	0f0080e7          	jalr	240(ra) # 80004c10 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005b28:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("SRECNA NOVA GODINAAAA!!!!!\n\n");
    80005b2c:	0000a517          	auipc	a0,0xa
    80005b30:	84c50513          	addi	a0,a0,-1972 # 8000f378 <CONSOLE_STATUS+0x368>
    80005b34:	fffff097          	auipc	ra,0xfffff
    80005b38:	570080e7          	jalr	1392(ra) # 800050a4 <_Z12kprintStringPKc>
    //kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    return 0;
    80005b3c:	00000513          	li	a0,0
}
    80005b40:	02813083          	ld	ra,40(sp)
    80005b44:	02013403          	ld	s0,32(sp)
    80005b48:	01813483          	ld	s1,24(sp)
    80005b4c:	03010113          	addi	sp,sp,48
    80005b50:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80005b54:	00009517          	auipc	a0,0x9
    80005b58:	7e450513          	addi	a0,a0,2020 # 8000f338 <CONSOLE_STATUS+0x328>
    80005b5c:	fffff097          	auipc	ra,0xfffff
    80005b60:	548080e7          	jalr	1352(ra) # 800050a4 <_Z12kprintStringPKc>
        return -1;
    80005b64:	fff00513          	li	a0,-1
    80005b68:	fd9ff06f          	j	80005b40 <_Z13oldKernelMainv+0x74>

0000000080005b6c <_Z13newKernelMainv>:

int newKernelMain(){
    80005b6c:	ff010113          	addi	sp,sp,-16
    80005b70:	00113423          	sd	ra,8(sp)
    80005b74:	00813023          	sd	s0,0(sp)
    80005b78:	01010413          	addi	s0,sp,16
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    80005b7c:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    80005b80:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    80005b84:	fffff097          	auipc	ra,0xfffff
    80005b88:	cc4080e7          	jalr	-828(ra) # 80004848 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    80005b8c:	fffff097          	auipc	ra,0xfffff
    80005b90:	61c080e7          	jalr	1564(ra) # 800051a8 <_Z10kernelInitv>
    if(panic < 0){
    80005b94:	02054063          	bltz	a0,80005bb4 <_Z13newKernelMainv+0x48>
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }

    kTestMain();
    80005b98:	00005097          	auipc	ra,0x5
    80005b9c:	c48080e7          	jalr	-952(ra) # 8000a7e0 <kTestMain>

    return 0;
    80005ba0:	00000513          	li	a0,0
}
    80005ba4:	00813083          	ld	ra,8(sp)
    80005ba8:	00013403          	ld	s0,0(sp)
    80005bac:	01010113          	addi	sp,sp,16
    80005bb0:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80005bb4:	00009517          	auipc	a0,0x9
    80005bb8:	78450513          	addi	a0,a0,1924 # 8000f338 <CONSOLE_STATUS+0x328>
    80005bbc:	fffff097          	auipc	ra,0xfffff
    80005bc0:	4e8080e7          	jalr	1256(ra) # 800050a4 <_Z12kprintStringPKc>
        return -1;
    80005bc4:	fff00513          	li	a0,-1
    80005bc8:	fddff06f          	j	80005ba4 <_Z13newKernelMainv+0x38>

0000000080005bcc <main>:


int main(){
    80005bcc:	ff010113          	addi	sp,sp,-16
    80005bd0:	00113423          	sd	ra,8(sp)
    80005bd4:	00813023          	sd	s0,0(sp)
    80005bd8:	01010413          	addi	s0,sp,16
    return oldKernelMain();
    80005bdc:	00000097          	auipc	ra,0x0
    80005be0:	ef0080e7          	jalr	-272(ra) # 80005acc <_Z13oldKernelMainv>
    // return  newKernelMain();
    80005be4:	00813083          	ld	ra,8(sp)
    80005be8:	00013403          	ld	s0,0(sp)
    80005bec:	01010113          	addi	sp,sp,16
    80005bf0:	00008067          	ret

0000000080005bf4 <_Z13timer_handlerv>:
    PFI = 12,
    PFW = 15
};

void timer_handler()
{
    80005bf4:	fd010113          	addi	sp,sp,-48
    80005bf8:	02113423          	sd	ra,40(sp)
    80005bfc:	02813023          	sd	s0,32(sp)
    80005c00:	00913c23          	sd	s1,24(sp)
    80005c04:	01213823          	sd	s2,16(sp)
    80005c08:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80005c0c:	fffff097          	auipc	ra,0xfffff
    80005c10:	a08080e7          	jalr	-1528(ra) # 80004614 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80005c14:	0000f717          	auipc	a4,0xf
    80005c18:	79470713          	addi	a4,a4,1940 # 800153a8 <_ZN3TCB16timeSliceCounterE>
    80005c1c:	00073783          	ld	a5,0(a4)
    80005c20:	00178793          	addi	a5,a5,1 # fffffffffffff001 <_user_bss_end+0xffffffff7ffe7ff1>
    80005c24:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80005c28:	0000f717          	auipc	a4,0xf
    80005c2c:	78870713          	addi	a4,a4,1928 # 800153b0 <_ZN3TCB7runningE>
    80005c30:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80005c34:	02873703          	ld	a4,40(a4)
    80005c38:	02e7f263          	bgeu	a5,a4,80005c5c <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80005c3c:	00200793          	li	a5,2
    80005c40:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80005c44:	02813083          	ld	ra,40(sp)
    80005c48:	02013403          	ld	s0,32(sp)
    80005c4c:	01813483          	ld	s1,24(sp)
    80005c50:	01013903          	ld	s2,16(sp)
    80005c54:	03010113          	addi	sp,sp,48
    80005c58:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005c5c:	100027f3          	csrr	a5,sstatus
    80005c60:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005c64:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005c68:	141027f3          	csrr	a5,sepc
    80005c6c:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80005c70:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    80005c74:	0000f797          	auipc	a5,0xf
    80005c78:	7207ba23          	sd	zero,1844(a5) # 800153a8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005c7c:	fffff097          	auipc	ra,0xfffff
    80005c80:	f94080e7          	jalr	-108(ra) # 80004c10 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005c84:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005c88:	14149073          	csrw	sepc,s1
    80005c8c:	fb1ff06f          	j	80005c3c <_Z13timer_handlerv+0x48>

0000000080005c90 <_Z8usrEcallmmmmm>:

volatile uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80005c90:	fb010113          	addi	sp,sp,-80
    80005c94:	04113423          	sd	ra,72(sp)
    80005c98:	04813023          	sd	s0,64(sp)
    80005c9c:	02913c23          	sd	s1,56(sp)
    80005ca0:	03213823          	sd	s2,48(sp)
    80005ca4:	03313423          	sd	s3,40(sp)
    80005ca8:	03413023          	sd	s4,32(sp)
    80005cac:	01513c23          	sd	s5,24(sp)
    80005cb0:	01613823          	sd	s6,16(sp)
    80005cb4:	05010413          	addi	s0,sp,80
    80005cb8:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80005cbc:	141027f3          	csrr	a5,sepc
    80005cc0:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80005cc4:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80005cc8:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80005ccc:	100027f3          	csrr	a5,sstatus
    80005cd0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80005cd4:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80005cd8:	00100793          	li	a5,1
    80005cdc:	0ef50463          	beq	a0,a5,80005dc4 <_Z8usrEcallmmmmm+0x134>
    80005ce0:	00050493          	mv	s1,a0
    80005ce4:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        //KCHECKPRINT(ret);
    }
    else if(a0 == MF)
    80005ce8:	00200793          	li	a5,2
    80005cec:	12f50263          	beq	a0,a5,80005e10 <_Z8usrEcallmmmmm+0x180>
        //mem_free
        // KCHECKPRINT(a1);
        // MemoryAllocator::getInstance().print_all_list();
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    }
    else if(a0 == TC)
    80005cf0:	01100793          	li	a5,17
    80005cf4:	12f50c63          	beq	a0,a5,80005e2c <_Z8usrEcallmmmmm+0x19c>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80005cf8:	01200793          	li	a5,18
    80005cfc:	14f50e63          	beq	a0,a5,80005e58 <_Z8usrEcallmmmmm+0x1c8>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80005d00:	01300793          	li	a5,19
    80005d04:	16f50a63          	beq	a0,a5,80005e78 <_Z8usrEcallmmmmm+0x1e8>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    80005d08:	06900793          	li	a5,105
    80005d0c:	18f50063          	beq	a0,a5,80005e8c <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        // KCHECKPRINT(a1);
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80005d10:	02100793          	li	a5,33
    80005d14:	18f50463          	beq	a0,a5,80005e9c <_Z8usrEcallmmmmm+0x20c>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    80005d18:	02200793          	li	a5,34
    80005d1c:	24f50063          	beq	a0,a5,80005f5c <_Z8usrEcallmmmmm+0x2cc>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    80005d20:	02300793          	li	a5,35
    80005d24:	24f50663          	beq	a0,a5,80005f70 <_Z8usrEcallmmmmm+0x2e0>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    80005d28:	02400793          	li	a5,36
    80005d2c:	26f50863          	beq	a0,a5,80005f9c <_Z8usrEcallmmmmm+0x30c>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    80005d30:	03100793          	li	a5,49
    80005d34:	28f50a63          	beq	a0,a5,80005fc8 <_Z8usrEcallmmmmm+0x338>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    80005d38:	04100793          	li	a5,65
    80005d3c:	28f50e63          	beq	a0,a5,80005fd8 <_Z8usrEcallmmmmm+0x348>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80005d40:	04200793          	li	a5,66
    80005d44:	08f51c63          	bne	a0,a5,80005ddc <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    80005d48:	0000f797          	auipc	a5,0xf
    80005d4c:	6c078793          	addi	a5,a5,1728 # 80015408 <_ZN5StdIO7obufferE>
    80005d50:	0007ba83          	ld	s5,0(a5)
    80005d54:	0ff5fa13          	andi	s4,a1,255
    
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    80005d58:	450a8513          	addi	a0,s5,1104
    80005d5c:	ffffe097          	auipc	ra,0xffffe
    80005d60:	51c080e7          	jalr	1308(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005d64:	400a8b13          	addi	s6,s5,1024
    80005d68:	000b0513          	mv	a0,s6
    80005d6c:	ffffe097          	auipc	ra,0xffffe
    80005d70:	50c080e7          	jalr	1292(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    80005d74:	480aa783          	lw	a5,1152(s5)
    80005d78:	0017879b          	addiw	a5,a5,1
    80005d7c:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    80005d80:	47caa783          	lw	a5,1148(s5)
    80005d84:	00fa8733          	add	a4,s5,a5
    80005d88:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80005d8c:	0017879b          	addiw	a5,a5,1
    80005d90:	41f7d71b          	sraiw	a4,a5,0x1f
    80005d94:	0167571b          	srliw	a4,a4,0x16
    80005d98:	00e787bb          	addw	a5,a5,a4
    80005d9c:	3ff7f793          	andi	a5,a5,1023
    80005da0:	40e787bb          	subw	a5,a5,a4
    80005da4:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    80005da8:	428a8513          	addi	a0,s5,1064
    80005dac:	ffffe097          	auipc	ra,0xffffe
    80005db0:	550080e7          	jalr	1360(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80005db4:	000b0513          	mv	a0,s6
    80005db8:	ffffe097          	auipc	ra,0xffffe
    80005dbc:	544080e7          	jalr	1348(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80005dc0:	01c0006f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80005dc4:	00002097          	auipc	ra,0x2
    80005dc8:	884080e7          	jalr	-1916(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    80005dcc:	000a0593          	mv	a1,s4
    80005dd0:	00002097          	auipc	ra,0x2
    80005dd4:	a10080e7          	jalr	-1520(ra) # 800077e0 <_ZN15MemoryAllocator9mem_allocEm>
    80005dd8:	00050493          	mv	s1,a0
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80005ddc:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80005de0:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80005de4:	00048513          	mv	a0,s1
    80005de8:	04813083          	ld	ra,72(sp)
    80005dec:	04013403          	ld	s0,64(sp)
    80005df0:	03813483          	ld	s1,56(sp)
    80005df4:	03013903          	ld	s2,48(sp)
    80005df8:	02813983          	ld	s3,40(sp)
    80005dfc:	02013a03          	ld	s4,32(sp)
    80005e00:	01813a83          	ld	s5,24(sp)
    80005e04:	01013b03          	ld	s6,16(sp)
    80005e08:	05010113          	addi	sp,sp,80
    80005e0c:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80005e10:	00002097          	auipc	ra,0x2
    80005e14:	838080e7          	jalr	-1992(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    80005e18:	000a0593          	mv	a1,s4
    80005e1c:	00002097          	auipc	ra,0x2
    80005e20:	c90080e7          	jalr	-880(ra) # 80007aac <_ZN15MemoryAllocator8mem_freeEPv>
    80005e24:	00050493          	mv	s1,a0
    80005e28:	fb5ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80005e2c:	00070613          	mv	a2,a4
    80005e30:	00068593          	mv	a1,a3
    80005e34:	000a8513          	mv	a0,s5
    80005e38:	fffff097          	auipc	ra,0xfffff
    80005e3c:	ba4080e7          	jalr	-1116(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80005e40:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80005e44:	00050663          	beqz	a0,80005e50 <_Z8usrEcallmmmmm+0x1c0>
        else ret = 0;
    80005e48:	00000493          	li	s1,0
    80005e4c:	f91ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    80005e50:	ffc00493          	li	s1,-4
    80005e54:	f89ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    80005e58:	0000f797          	auipc	a5,0xf
    80005e5c:	55878793          	addi	a5,a5,1368 # 800153b0 <_ZN3TCB7runningE>
    80005e60:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80005e64:	00200713          	li	a4,2
    80005e68:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80005e6c:	fffff097          	auipc	ra,0xfffff
    80005e70:	c94080e7          	jalr	-876(ra) # 80004b00 <_ZN3TCB8dispatchEv>
    80005e74:	f69ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    80005e78:	0000f797          	auipc	a5,0xf
    80005e7c:	5207b823          	sd	zero,1328(a5) # 800153a8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80005e80:	fffff097          	auipc	ra,0xfffff
    80005e84:	d90080e7          	jalr	-624(ra) # 80004c10 <_ZN3TCB5yieldEv>
    80005e88:	f55ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    80005e8c:	00058513          	mv	a0,a1
    80005e90:	fffff097          	auipc	ra,0xfffff
    80005e94:	e60080e7          	jalr	-416(ra) # 80004cf0 <_ZN3TCB12deleteThreadEPS_>
    80005e98:	f45ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
{
    static ObjectCache* cache; 
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80005e9c:	0000f797          	auipc	a5,0xf
    80005ea0:	4e478793          	addi	a5,a5,1252 # 80015380 <_ZN10KSemaphore5cacheE>
    80005ea4:	0007b783          	ld	a5,0(a5)
    80005ea8:	04078863          	beqz	a5,80005ef8 <_Z8usrEcallmmmmm+0x268>
    80005eac:	0000f797          	auipc	a5,0xf
    80005eb0:	4d478793          	addi	a5,a5,1236 # 80015380 <_ZN10KSemaphore5cacheE>
    80005eb4:	0007b503          	ld	a0,0(a5)
    80005eb8:	00003097          	auipc	ra,0x3
    80005ebc:	bec080e7          	jalr	-1044(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
        *t = (uint64)(new KSemaphore(a2));
    80005ec0:	02050463          	beqz	a0,80005ee8 <_Z8usrEcallmmmmm+0x258>

    KSemaphore(unsigned val):val(val)
    80005ec4:	01552423          	sw	s5,8(a0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80005ec8:	00053823          	sd	zero,16(a0)
    80005ecc:	00053c23          	sd	zero,24(a0)
    80005ed0:	02052023          	sw	zero,32(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80005ed4:	0000f797          	auipc	a5,0xf
    80005ed8:	4b478793          	addi	a5,a5,1204 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    80005edc:	0007b703          	ld	a4,0(a5)
    80005ee0:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80005ee4:	00a7b023          	sd	a0,0(a5)
    80005ee8:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -2;
    80005eec:	06050463          	beqz	a0,80005f54 <_Z8usrEcallmmmmm+0x2c4>
        else ret = 0;
    80005ef0:	00000493          	li	s1,0
    80005ef4:	ee9ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80005ef8:	05800513          	li	a0,88
    80005efc:	00003097          	auipc	ra,0x3
    80005f00:	c58080e7          	jalr	-936(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80005f04:	00050493          	mv	s1,a0
    80005f08:	02050263          	beqz	a0,80005f2c <_Z8usrEcallmmmmm+0x29c>
    80005f0c:	00000793          	li	a5,0
    80005f10:	00000713          	li	a4,0
    80005f14:	00000693          	li	a3,0
    80005f18:	02800613          	li	a2,40
    80005f1c:	00009597          	auipc	a1,0x9
    80005f20:	47c58593          	addi	a1,a1,1148 # 8000f398 <CONSOLE_STATUS+0x388>
    80005f24:	00002097          	auipc	ra,0x2
    80005f28:	0e4080e7          	jalr	228(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80005f2c:	0000f797          	auipc	a5,0xf
    80005f30:	4497ba23          	sd	s1,1108(a5) # 80015380 <_ZN10KSemaphore5cacheE>
    80005f34:	f79ff06f          	j	80005eac <_Z8usrEcallmmmmm+0x21c>
    80005f38:	00050913          	mv	s2,a0
    80005f3c:	00048513          	mv	a0,s1
    80005f40:	00003097          	auipc	ra,0x3
    80005f44:	d74080e7          	jalr	-652(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80005f48:	00090513          	mv	a0,s2
    80005f4c:	00010097          	auipc	ra,0x10
    80005f50:	62c080e7          	jalr	1580(ra) # 80016578 <_Unwind_Resume>
        if(!(*t)) ret = -2;
    80005f54:	ffe00493          	li	s1,-2
    80005f58:	e85ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        ret = KSemaphore::close(t);
    80005f5c:	00058513          	mv	a0,a1
    80005f60:	ffffe097          	auipc	ra,0xffffe
    80005f64:	444080e7          	jalr	1092(ra) # 800043a4 <_ZN10KSemaphore5closeEPS_>
    80005f68:	00050493          	mv	s1,a0
    80005f6c:	e71ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80005f70:	00058513          	mv	a0,a1
    80005f74:	ffffe097          	auipc	ra,0xffffe
    80005f78:	4d0080e7          	jalr	1232(ra) # 80004444 <_ZN10KSemaphore6existsEPS_>
    80005f7c:	00051663          	bnez	a0,80005f88 <_Z8usrEcallmmmmm+0x2f8>
            ret = -1;
    80005f80:	fff00493          	li	s1,-1
    80005f84:	e59ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    80005f88:	000a0513          	mv	a0,s4
    80005f8c:	ffffe097          	auipc	ra,0xffffe
    80005f90:	2ec080e7          	jalr	748(ra) # 80004278 <_ZN10KSemaphore4waitEv>
    80005f94:	00050493          	mv	s1,a0
    80005f98:	e45ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80005f9c:	00058513          	mv	a0,a1
    80005fa0:	ffffe097          	auipc	ra,0xffffe
    80005fa4:	4a4080e7          	jalr	1188(ra) # 80004444 <_ZN10KSemaphore6existsEPS_>
    80005fa8:	00051663          	bnez	a0,80005fb4 <_Z8usrEcallmmmmm+0x324>
            ret = -1;
    80005fac:	fff00493          	li	s1,-1
    80005fb0:	e2dff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    80005fb4:	000a0513          	mv	a0,s4
    80005fb8:	ffffe097          	auipc	ra,0xffffe
    80005fbc:	344080e7          	jalr	836(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80005fc0:	00050493          	mv	s1,a0
    80005fc4:	e19ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    80005fc8:	00058513          	mv	a0,a1
    80005fcc:	fffff097          	auipc	ra,0xfffff
    80005fd0:	c7c080e7          	jalr	-900(ra) # 80004c48 <_ZN3TCB5sleepEm>
    80005fd4:	e09ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    80005fd8:	0000f797          	auipc	a5,0xf
    80005fdc:	43878793          	addi	a5,a5,1080 # 80015410 <_ZN5StdIO7ibufferE>
    80005fe0:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    80005fe4:	428a0513          	addi	a0,s4,1064
    80005fe8:	ffffe097          	auipc	ra,0xffffe
    80005fec:	290080e7          	jalr	656(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80005ff0:	400a0a93          	addi	s5,s4,1024
    80005ff4:	000a8513          	mv	a0,s5
    80005ff8:	ffffe097          	auipc	ra,0xffffe
    80005ffc:	280080e7          	jalr	640(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80006000:	480a2783          	lw	a5,1152(s4)
    80006004:	fff7879b          	addiw	a5,a5,-1
    80006008:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    8000600c:	478a2783          	lw	a5,1144(s4)
    80006010:	00fa0733          	add	a4,s4,a5
    80006014:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80006018:	0017879b          	addiw	a5,a5,1
    8000601c:	41f7d71b          	sraiw	a4,a5,0x1f
    80006020:	0167571b          	srliw	a4,a4,0x16
    80006024:	00e787bb          	addw	a5,a5,a4
    80006028:	3ff7f793          	andi	a5,a5,1023
    8000602c:	40e787bb          	subw	a5,a5,a4
    80006030:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    80006034:	450a0513          	addi	a0,s4,1104
    80006038:	ffffe097          	auipc	ra,0xffffe
    8000603c:	2c4080e7          	jalr	708(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80006040:	000a8513          	mv	a0,s5
    80006044:	ffffe097          	auipc	ra,0xffffe
    80006048:	2b8080e7          	jalr	696(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    8000604c:	d91ff06f          	j	80005ddc <_Z8usrEcallmmmmm+0x14c>

0000000080006050 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80006050:	fb010113          	addi	sp,sp,-80
    80006054:	04113423          	sd	ra,72(sp)
    80006058:	04813023          	sd	s0,64(sp)
    8000605c:	02913c23          	sd	s1,56(sp)
    80006060:	03213823          	sd	s2,48(sp)
    80006064:	03313423          	sd	s3,40(sp)
    80006068:	03413023          	sd	s4,32(sp)
    8000606c:	01513c23          	sd	s5,24(sp)
    80006070:	05010413          	addi	s0,sp,80
    80006074:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80006078:	141027f3          	csrr	a5,sepc
    8000607c:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80006080:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006084:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80006088:	100027f3          	csrr	a5,sstatus
    8000608c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80006090:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    80006094:	00100793          	li	a5,1
    80006098:	0ef50663          	beq	a0,a5,80006184 <_Z8sysEcallmmmmm+0x134>
    8000609c:	00050493          	mv	s1,a0
    800060a0:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    800060a4:	00200793          	li	a5,2
    800060a8:	10f50c63          	beq	a0,a5,800061c0 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    800060ac:	01100793          	li	a5,17
    800060b0:	12f50463          	beq	a0,a5,800061d8 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    800060b4:	01200793          	li	a5,18
    800060b8:	14f50663          	beq	a0,a5,80006204 <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    800060bc:	01300793          	li	a5,19
    800060c0:	16f50663          	beq	a0,a5,8000622c <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    800060c4:	06900793          	li	a5,105
    800060c8:	18f50063          	beq	a0,a5,80006248 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    800060cc:	02100793          	li	a5,33
    800060d0:	18f50663          	beq	a0,a5,8000625c <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    800060d4:	02200793          	li	a5,34
    800060d8:	22f50c63          	beq	a0,a5,80006310 <_Z8sysEcallmmmmm+0x2c0>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    800060dc:	02300793          	li	a5,35
    800060e0:	26f50063          	beq	a0,a5,80006340 <_Z8sysEcallmmmmm+0x2f0>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    800060e4:	02400793          	li	a5,36
    800060e8:	26f50663          	beq	a0,a5,80006354 <_Z8sysEcallmmmmm+0x304>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    800060ec:	03100793          	li	a5,49
    800060f0:	26f50c63          	beq	a0,a5,80006368 <_Z8sysEcallmmmmm+0x318>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    800060f4:	04100793          	li	a5,65
    800060f8:	28f50463          	beq	a0,a5,80006380 <_Z8sysEcallmmmmm+0x330>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800060fc:	04200793          	li	a5,66
    80006100:	08f51c63          	bne	a0,a5,80006198 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    80006104:	0000f797          	auipc	a5,0xf
    80006108:	30478793          	addi	a5,a5,772 # 80015408 <_ZN5StdIO7obufferE>
    8000610c:	0007ba03          	ld	s4,0(a5)
    80006110:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    80006114:	450a0513          	addi	a0,s4,1104
    80006118:	ffffe097          	auipc	ra,0xffffe
    8000611c:	160080e7          	jalr	352(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80006120:	400a0a93          	addi	s5,s4,1024
    80006124:	000a8513          	mv	a0,s5
    80006128:	ffffe097          	auipc	ra,0xffffe
    8000612c:	150080e7          	jalr	336(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80006130:	480a2783          	lw	a5,1152(s4)
    80006134:	0017879b          	addiw	a5,a5,1
    80006138:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    8000613c:	47ca2783          	lw	a5,1148(s4)
    80006140:	00fa0733          	add	a4,s4,a5
    80006144:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80006148:	0017879b          	addiw	a5,a5,1
    8000614c:	41f7d71b          	sraiw	a4,a5,0x1f
    80006150:	0167571b          	srliw	a4,a4,0x16
    80006154:	00e787bb          	addw	a5,a5,a4
    80006158:	3ff7f793          	andi	a5,a5,1023
    8000615c:	40e787bb          	subw	a5,a5,a4
    80006160:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    80006164:	428a0513          	addi	a0,s4,1064
    80006168:	ffffe097          	auipc	ra,0xffffe
    8000616c:	194080e7          	jalr	404(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80006170:	000a8513          	mv	a0,s5
    80006174:	ffffe097          	auipc	ra,0xffffe
    80006178:	188080e7          	jalr	392(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000617c:	00048513          	mv	a0,s1
    80006180:	0180006f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    80006184:	00001097          	auipc	ra,0x1
    80006188:	4c4080e7          	jalr	1220(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    8000618c:	00098593          	mv	a1,s3
    80006190:	00001097          	auipc	ra,0x1
    80006194:	650080e7          	jalr	1616(ra) # 800077e0 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80006198:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    8000619c:	04813083          	ld	ra,72(sp)
    800061a0:	04013403          	ld	s0,64(sp)
    800061a4:	03813483          	ld	s1,56(sp)
    800061a8:	03013903          	ld	s2,48(sp)
    800061ac:	02813983          	ld	s3,40(sp)
    800061b0:	02013a03          	ld	s4,32(sp)
    800061b4:	01813a83          	ld	s5,24(sp)
    800061b8:	05010113          	addi	sp,sp,80
    800061bc:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    800061c0:	00001097          	auipc	ra,0x1
    800061c4:	488080e7          	jalr	1160(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
    800061c8:	00098593          	mv	a1,s3
    800061cc:	00002097          	auipc	ra,0x2
    800061d0:	8e0080e7          	jalr	-1824(ra) # 80007aac <_ZN15MemoryAllocator8mem_freeEPv>
    800061d4:	fc5ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800061d8:	00070613          	mv	a2,a4
    800061dc:	00068593          	mv	a1,a3
    800061e0:	000a8513          	mv	a0,s5
    800061e4:	ffffe097          	auipc	ra,0xffffe
    800061e8:	7f8080e7          	jalr	2040(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800061ec:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    800061f0:	00050663          	beqz	a0,800061fc <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    800061f4:	00000513          	li	a0,0
    800061f8:	fa1ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    800061fc:	ffc00513          	li	a0,-4
    80006200:	f99ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    80006204:	0000f797          	auipc	a5,0xf
    80006208:	1ac78793          	addi	a5,a5,428 # 800153b0 <_ZN3TCB7runningE>
    8000620c:	0007b783          	ld	a5,0(a5)
    80006210:	00200713          	li	a4,2
    80006214:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    80006218:	fffff097          	auipc	ra,0xfffff
    8000621c:	8e8080e7          	jalr	-1816(ra) # 80004b00 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80006220:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006224:	00048513          	mv	a0,s1
    80006228:	f71ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    8000622c:	0000f797          	auipc	a5,0xf
    80006230:	1607be23          	sd	zero,380(a5) # 800153a8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80006234:	fffff097          	auipc	ra,0xfffff
    80006238:	9dc080e7          	jalr	-1572(ra) # 80004c10 <_ZN3TCB5yieldEv>
    8000623c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006240:	00048513          	mv	a0,s1
    80006244:	f55ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80006248:	00058513          	mv	a0,a1
    8000624c:	fffff097          	auipc	ra,0xfffff
    80006250:	aa4080e7          	jalr	-1372(ra) # 80004cf0 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006254:	00048513          	mv	a0,s1
    80006258:	f41ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
    8000625c:	0000f797          	auipc	a5,0xf
    80006260:	12478793          	addi	a5,a5,292 # 80015380 <_ZN10KSemaphore5cacheE>
    80006264:	0007b783          	ld	a5,0(a5)
    80006268:	04078663          	beqz	a5,800062b4 <_Z8sysEcallmmmmm+0x264>
    8000626c:	0000f797          	auipc	a5,0xf
    80006270:	11478793          	addi	a5,a5,276 # 80015380 <_ZN10KSemaphore5cacheE>
    80006274:	0007b503          	ld	a0,0(a5)
    80006278:	00003097          	auipc	ra,0x3
    8000627c:	82c080e7          	jalr	-2004(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
        *t = (uint64)(new KSemaphore(a2));
    80006280:	02050463          	beqz	a0,800062a8 <_Z8sysEcallmmmmm+0x258>
    KSemaphore(unsigned val):val(val)
    80006284:	01552423          	sw	s5,8(a0)
    80006288:	00053823          	sd	zero,16(a0)
    8000628c:	00053c23          	sd	zero,24(a0)
    80006290:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    80006294:	0000f797          	auipc	a5,0xf
    80006298:	0f478793          	addi	a5,a5,244 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    8000629c:	0007b703          	ld	a4,0(a5)
    800062a0:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    800062a4:	00a7b023          	sd	a0,0(a5)
    800062a8:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800062ac:	00048513          	mv	a0,s1
    800062b0:	ee9ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    800062b4:	05800513          	li	a0,88
    800062b8:	00003097          	auipc	ra,0x3
    800062bc:	89c080e7          	jalr	-1892(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    800062c0:	00050a13          	mv	s4,a0
    800062c4:	02050263          	beqz	a0,800062e8 <_Z8sysEcallmmmmm+0x298>
    800062c8:	00000793          	li	a5,0
    800062cc:	00000713          	li	a4,0
    800062d0:	00000693          	li	a3,0
    800062d4:	02800613          	li	a2,40
    800062d8:	00009597          	auipc	a1,0x9
    800062dc:	0c058593          	addi	a1,a1,192 # 8000f398 <CONSOLE_STATUS+0x388>
    800062e0:	00002097          	auipc	ra,0x2
    800062e4:	d28080e7          	jalr	-728(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    800062e8:	0000f797          	auipc	a5,0xf
    800062ec:	0947bc23          	sd	s4,152(a5) # 80015380 <_ZN10KSemaphore5cacheE>
    800062f0:	f7dff06f          	j	8000626c <_Z8sysEcallmmmmm+0x21c>
    800062f4:	00050493          	mv	s1,a0
    800062f8:	000a0513          	mv	a0,s4
    800062fc:	00003097          	auipc	ra,0x3
    80006300:	9b8080e7          	jalr	-1608(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80006304:	00048513          	mv	a0,s1
    80006308:	00010097          	auipc	ra,0x10
    8000630c:	270080e7          	jalr	624(ra) # 80016578 <_Unwind_Resume>
        delete t;
    80006310:	e80584e3          	beqz	a1,80006198 <_Z8sysEcallmmmmm+0x148>
    80006314:	00058513          	mv	a0,a1
    80006318:	ffffe097          	auipc	ra,0xffffe
    8000631c:	038080e7          	jalr	56(ra) # 80004350 <_ZN10KSemaphoreD1Ev>
    80006320:	00098593          	mv	a1,s3
    80006324:	0000f797          	auipc	a5,0xf
    80006328:	05c78793          	addi	a5,a5,92 # 80015380 <_ZN10KSemaphore5cacheE>
    8000632c:	0007b503          	ld	a0,0(a5)
    80006330:	00003097          	auipc	ra,0x3
    80006334:	854080e7          	jalr	-1964(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006338:	00048513          	mv	a0,s1
    8000633c:	e5dff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    80006340:	00058513          	mv	a0,a1
    80006344:	ffffe097          	auipc	ra,0xffffe
    80006348:	f34080e7          	jalr	-204(ra) # 80004278 <_ZN10KSemaphore4waitEv>
    8000634c:	100a1073          	csrw	sstatus,s4
    80006350:	e49ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    80006354:	00058513          	mv	a0,a1
    80006358:	ffffe097          	auipc	ra,0xffffe
    8000635c:	fa4080e7          	jalr	-92(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006360:	00048513          	mv	a0,s1
    80006364:	e35ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    80006368:	00058513          	mv	a0,a1
    8000636c:	fffff097          	auipc	ra,0xfffff
    80006370:	8dc080e7          	jalr	-1828(ra) # 80004c48 <_ZN3TCB5sleepEm>
    80006374:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80006378:	00048513          	mv	a0,s1
    8000637c:	e1dff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    80006380:	0000f797          	auipc	a5,0xf
    80006384:	09078793          	addi	a5,a5,144 # 80015410 <_ZN5StdIO7ibufferE>
    80006388:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    8000638c:	42898513          	addi	a0,s3,1064
    80006390:	ffffe097          	auipc	ra,0xffffe
    80006394:	ee8080e7          	jalr	-280(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80006398:	40098a13          	addi	s4,s3,1024
    8000639c:	000a0513          	mv	a0,s4
    800063a0:	ffffe097          	auipc	ra,0xffffe
    800063a4:	ed8080e7          	jalr	-296(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    800063a8:	4809a783          	lw	a5,1152(s3)
    800063ac:	fff7879b          	addiw	a5,a5,-1
    800063b0:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    800063b4:	4789a783          	lw	a5,1144(s3)
    800063b8:	00f98733          	add	a4,s3,a5
    800063bc:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    800063c0:	0017879b          	addiw	a5,a5,1
    800063c4:	41f7d71b          	sraiw	a4,a5,0x1f
    800063c8:	0167571b          	srliw	a4,a4,0x16
    800063cc:	00e787bb          	addw	a5,a5,a4
    800063d0:	3ff7f793          	andi	a5,a5,1023
    800063d4:	40e787bb          	subw	a5,a5,a4
    800063d8:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    800063dc:	45098513          	addi	a0,s3,1104
    800063e0:	ffffe097          	auipc	ra,0xffffe
    800063e4:	f1c080e7          	jalr	-228(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800063e8:	000a0513          	mv	a0,s4
    800063ec:	ffffe097          	auipc	ra,0xffffe
    800063f0:	f10080e7          	jalr	-240(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    800063f4:	00048513          	mv	a0,s1
    800063f8:	da1ff06f          	j	80006198 <_Z8sysEcallmmmmm+0x148>

00000000800063fc <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800063fc:	fa010113          	addi	sp,sp,-96
    80006400:	04113c23          	sd	ra,88(sp)
    80006404:	04813823          	sd	s0,80(sp)
    80006408:	04913423          	sd	s1,72(sp)
    8000640c:	05213023          	sd	s2,64(sp)
    80006410:	03313c23          	sd	s3,56(sp)
    80006414:	03413823          	sd	s4,48(sp)
    80006418:	06010413          	addi	s0,sp,96
    asm volatile("csrr %0, scause" : "=r" (scause));
    8000641c:	142027f3          	csrr	a5,scause
    80006420:	faf43423          	sd	a5,-88(s0)
    return scause;
    80006424:	fa843483          	ld	s1,-88(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;
    //KCHECKPRINT(scause);
    if(scause == IS)
    80006428:	00900793          	li	a5,9
    8000642c:	14f48463          	beq	s1,a5,80006574 <interrupt+0x178>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    80006430:	00800793          	li	a5,8
    80006434:	16f48663          	beq	s1,a5,800065a0 <interrupt+0x1a4>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    80006438:	fff00793          	li	a5,-1
    8000643c:	03f79793          	slli	a5,a5,0x3f
    80006440:	00978793          	addi	a5,a5,9
    80006444:	16f48663          	beq	s1,a5,800065b0 <interrupt+0x1b4>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    80006448:	fff00793          	li	a5,-1
    8000644c:	03f79793          	slli	a5,a5,0x3f
    80006450:	00178793          	addi	a5,a5,1
    80006454:	16f48463          	beq	s1,a5,800065bc <interrupt+0x1c0>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == PFI){
    80006458:	00c00793          	li	a5,12
    8000645c:	16f48663          	beq	s1,a5,800065c8 <interrupt+0x1cc>
            KCHECKPRINT(sepc);
            KCHECKPRINT(stval);
            while(true);
        }
    }
    else if(scause == PFL || scause == PFW){
    80006460:	00d00793          	li	a5,13
    80006464:	26f48263          	beq	s1,a5,800066c8 <interrupt+0x2cc>
    80006468:	00f00793          	li	a5,15
    8000646c:	24f48e63          	beq	s1,a5,800066c8 <interrupt+0x2cc>
                
            }
        }
        
    }
    else if(scause == II || scause == IR || scause == IW)
    80006470:	00200793          	li	a5,2
    80006474:	00f48a63          	beq	s1,a5,80006488 <interrupt+0x8c>
    80006478:	00500793          	li	a5,5
    8000647c:	00f48663          	beq	s1,a5,80006488 <interrupt+0x8c>
    80006480:	00700793          	li	a5,7
    80006484:	42f49663          	bne	s1,a5,800068b0 <interrupt+0x4b4>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    80006488:	0000f797          	auipc	a5,0xf
    8000648c:	f2878793          	addi	a5,a5,-216 # 800153b0 <_ZN3TCB7runningE>
    80006490:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    80006494:	0357c783          	lbu	a5,53(a5)
    80006498:	3e078e63          	beqz	a5,80006894 <interrupt+0x498>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    8000649c:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    800064a0:	00009517          	auipc	a0,0x9
    800064a4:	fd850513          	addi	a0,a0,-40 # 8000f478 <CONSOLE_STATUS+0x468>
    800064a8:	fffff097          	auipc	ra,0xfffff
    800064ac:	bfc080e7          	jalr	-1028(ra) # 800050a4 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    800064b0:	00009517          	auipc	a0,0x9
    800064b4:	00050513          	mv	a0,a0
    800064b8:	fffff097          	auipc	ra,0xfffff
    800064bc:	bec080e7          	jalr	-1044(ra) # 800050a4 <_Z12kprintStringPKc>
    800064c0:	00000613          	li	a2,0
    800064c4:	01000593          	li	a1,16
    800064c8:	00048513          	mv	a0,s1
    800064cc:	fffff097          	auipc	ra,0xfffff
    800064d0:	c20080e7          	jalr	-992(ra) # 800050ec <_Z9kprintIntmib>
    800064d4:	00009517          	auipc	a0,0x9
    800064d8:	e8450513          	addi	a0,a0,-380 # 8000f358 <CONSOLE_STATUS+0x348>
    800064dc:	fffff097          	auipc	ra,0xfffff
    800064e0:	bc8080e7          	jalr	-1080(ra) # 800050a4 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    800064e4:	00009517          	auipc	a0,0x9
    800064e8:	fdc50513          	addi	a0,a0,-36 # 8000f4c0 <CONSOLE_STATUS+0x4b0>
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	bb8080e7          	jalr	-1096(ra) # 800050a4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800064f4:	141027f3          	csrr	a5,sepc
    800064f8:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800064fc:	fc843503          	ld	a0,-56(s0)
    80006500:	00000613          	li	a2,0
    80006504:	01000593          	li	a1,16
    80006508:	fffff097          	auipc	ra,0xfffff
    8000650c:	be4080e7          	jalr	-1052(ra) # 800050ec <_Z9kprintIntmib>
    80006510:	00009517          	auipc	a0,0x9
    80006514:	e4850513          	addi	a0,a0,-440 # 8000f358 <CONSOLE_STATUS+0x348>
    80006518:	fffff097          	auipc	ra,0xfffff
    8000651c:	b8c080e7          	jalr	-1140(ra) # 800050a4 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80006520:	00009517          	auipc	a0,0x9
    80006524:	fa850513          	addi	a0,a0,-88 # 8000f4c8 <CONSOLE_STATUS+0x4b8>
    80006528:	fffff097          	auipc	ra,0xfffff
    8000652c:	b7c080e7          	jalr	-1156(ra) # 800050a4 <_Z12kprintStringPKc>
    80006530:	00000613          	li	a2,0
    80006534:	01000593          	li	a1,16
    80006538:	00090513          	mv	a0,s2
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	bb0080e7          	jalr	-1104(ra) # 800050ec <_Z9kprintIntmib>
    80006544:	0000a517          	auipc	a0,0xa
    80006548:	ac450513          	addi	a0,a0,-1340 # 80010008 <_ZL11CACHE_NAMES+0x448>
    8000654c:	fffff097          	auipc	ra,0xfffff
    80006550:	b58080e7          	jalr	-1192(ra) # 800050a4 <_Z12kprintStringPKc>
            TCB::running->finish();
    80006554:	0000f797          	auipc	a5,0xf
    80006558:	e5c78793          	addi	a5,a5,-420 # 800153b0 <_ZN3TCB7runningE>
    8000655c:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80006560:	00200713          	li	a4,2
    80006564:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    80006568:	ffffe097          	auipc	ra,0xffffe
    8000656c:	598080e7          	jalr	1432(ra) # 80004b00 <_ZN3TCB8dispatchEv>
    80006570:	0100006f          	j	80006580 <interrupt+0x184>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80006574:	00000097          	auipc	ra,0x0
    80006578:	adc080e7          	jalr	-1316(ra) # 80006050 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    8000657c:	04a43823          	sd	a0,80(s0)

    }
                    
    
    //print(a4);
    80006580:	05813083          	ld	ra,88(sp)
    80006584:	05013403          	ld	s0,80(sp)
    80006588:	04813483          	ld	s1,72(sp)
    8000658c:	04013903          	ld	s2,64(sp)
    80006590:	03813983          	ld	s3,56(sp)
    80006594:	03013a03          	ld	s4,48(sp)
    80006598:	06010113          	addi	sp,sp,96
    8000659c:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    800065a0:	fffff097          	auipc	ra,0xfffff
    800065a4:	6f0080e7          	jalr	1776(ra) # 80005c90 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800065a8:	04a43823          	sd	a0,80(s0)
    800065ac:	fd5ff06f          	j	80006580 <interrupt+0x184>
       StdIO::console_handler();
    800065b0:	00004097          	auipc	ra,0x4
    800065b4:	a50080e7          	jalr	-1456(ra) # 8000a000 <_ZN5StdIO15console_handlerEv>
    800065b8:	fc9ff06f          	j	80006580 <interrupt+0x184>
        timer_handler();      
    800065bc:	fffff097          	auipc	ra,0xfffff
    800065c0:	638080e7          	jalr	1592(ra) # 80005bf4 <_Z13timer_handlerv>
    800065c4:	fbdff06f          	j	80006580 <interrupt+0x184>
        if(TCB::running->getState() == TCB::TCBState::PREPARING){
    800065c8:	0000f797          	auipc	a5,0xf
    800065cc:	de878793          	addi	a5,a5,-536 # 800153b0 <_ZN3TCB7runningE>
    800065d0:	0007b783          	ld	a5,0(a5)
    TCBState getState() const{ return state; }
    800065d4:	0307a683          	lw	a3,48(a5)
    800065d8:	00400713          	li	a4,4
    800065dc:	02e69263          	bne	a3,a4,80006600 <interrupt+0x204>
    void setState(TCBState s) {state = s;}
    800065e0:	00100713          	li	a4,1
    800065e4:	02e7a823          	sw	a4,48(a5)
            asm volatile("sd %0, 1 * 8(s0)" :: "r" (thread_exit));
    800065e8:	00007797          	auipc	a5,0x7
    800065ec:	ba878793          	addi	a5,a5,-1112 # 8000d190 <thread_exit>
    800065f0:	00f43423          	sd	a5,8(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800065f4:	10000793          	li	a5,256
    800065f8:	1007b073          	csrc	sstatus,a5
    800065fc:	f85ff06f          	j	80006580 <interrupt+0x184>
    asm volatile("csrr %0, stval" : "=r" (stval));
    80006600:	143027f3          	csrr	a5,stval
    80006604:	fcf43423          	sd	a5,-56(s0)
    return stval;
    80006608:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000660c:	141027f3          	csrr	a5,sepc
    80006610:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80006614:	fc043983          	ld	s3,-64(s0)
            kprintString("\n!!!PANIC DUE TO NOT HANDLED INSTRUCTION PAGE FAULT !!!\n");
    80006618:	00009517          	auipc	a0,0x9
    8000661c:	d9850513          	addi	a0,a0,-616 # 8000f3b0 <CONSOLE_STATUS+0x3a0>
    80006620:	fffff097          	auipc	ra,0xfffff
    80006624:	a84080e7          	jalr	-1404(ra) # 800050a4 <_Z12kprintStringPKc>
            KCHECKPRINT(scause);
    80006628:	00009517          	auipc	a0,0x9
    8000662c:	dc850513          	addi	a0,a0,-568 # 8000f3f0 <CONSOLE_STATUS+0x3e0>
    80006630:	fffff097          	auipc	ra,0xfffff
    80006634:	a74080e7          	jalr	-1420(ra) # 800050a4 <_Z12kprintStringPKc>
    80006638:	00000613          	li	a2,0
    8000663c:	01000593          	li	a1,16
    80006640:	00048513          	mv	a0,s1
    80006644:	fffff097          	auipc	ra,0xfffff
    80006648:	aa8080e7          	jalr	-1368(ra) # 800050ec <_Z9kprintIntmib>
    8000664c:	00009517          	auipc	a0,0x9
    80006650:	d0c50513          	addi	a0,a0,-756 # 8000f358 <CONSOLE_STATUS+0x348>
    80006654:	fffff097          	auipc	ra,0xfffff
    80006658:	a50080e7          	jalr	-1456(ra) # 800050a4 <_Z12kprintStringPKc>
            KCHECKPRINT(sepc);
    8000665c:	00009517          	auipc	a0,0x9
    80006660:	da450513          	addi	a0,a0,-604 # 8000f400 <CONSOLE_STATUS+0x3f0>
    80006664:	fffff097          	auipc	ra,0xfffff
    80006668:	a40080e7          	jalr	-1472(ra) # 800050a4 <_Z12kprintStringPKc>
    8000666c:	00000613          	li	a2,0
    80006670:	01000593          	li	a1,16
    80006674:	00098513          	mv	a0,s3
    80006678:	fffff097          	auipc	ra,0xfffff
    8000667c:	a74080e7          	jalr	-1420(ra) # 800050ec <_Z9kprintIntmib>
    80006680:	00009517          	auipc	a0,0x9
    80006684:	cd850513          	addi	a0,a0,-808 # 8000f358 <CONSOLE_STATUS+0x348>
    80006688:	fffff097          	auipc	ra,0xfffff
    8000668c:	a1c080e7          	jalr	-1508(ra) # 800050a4 <_Z12kprintStringPKc>
            KCHECKPRINT(stval);
    80006690:	00009517          	auipc	a0,0x9
    80006694:	d7850513          	addi	a0,a0,-648 # 8000f408 <CONSOLE_STATUS+0x3f8>
    80006698:	fffff097          	auipc	ra,0xfffff
    8000669c:	a0c080e7          	jalr	-1524(ra) # 800050a4 <_Z12kprintStringPKc>
    800066a0:	00000613          	li	a2,0
    800066a4:	01000593          	li	a1,16
    800066a8:	00090513          	mv	a0,s2
    800066ac:	fffff097          	auipc	ra,0xfffff
    800066b0:	a40080e7          	jalr	-1472(ra) # 800050ec <_Z9kprintIntmib>
    800066b4:	00009517          	auipc	a0,0x9
    800066b8:	ca450513          	addi	a0,a0,-860 # 8000f358 <CONSOLE_STATUS+0x348>
    800066bc:	fffff097          	auipc	ra,0xfffff
    800066c0:	9e8080e7          	jalr	-1560(ra) # 800050a4 <_Z12kprintStringPKc>
            while(true);
    800066c4:	0000006f          	j	800066c4 <interrupt+0x2c8>
    asm volatile("csrr %0, stval" : "=r" (stval));
    800066c8:	143027f3          	csrr	a5,stval
    800066cc:	fcf43023          	sd	a5,-64(s0)
    return stval;
    800066d0:	fc043983          	ld	s3,-64(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800066d4:	141027f3          	csrr	a5,sepc
    800066d8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800066dc:	fb843a03          	ld	s4,-72(s0)
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800066e0:	100027f3          	csrr	a5,sstatus
    800066e4:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800066e8:	fb043783          	ld	a5,-80(s0)
        if(sstatus & Riscv::BitMaskSstatus::SSTATUS_SPP){
    800066ec:	1007f793          	andi	a5,a5,256
    800066f0:	0a078a63          	beqz	a5,800067a4 <interrupt+0x3a8>
            KCHECKPRINT(scause);
    800066f4:	00009517          	auipc	a0,0x9
    800066f8:	cfc50513          	addi	a0,a0,-772 # 8000f3f0 <CONSOLE_STATUS+0x3e0>
    800066fc:	fffff097          	auipc	ra,0xfffff
    80006700:	9a8080e7          	jalr	-1624(ra) # 800050a4 <_Z12kprintStringPKc>
    80006704:	00000613          	li	a2,0
    80006708:	01000593          	li	a1,16
    8000670c:	00048513          	mv	a0,s1
    80006710:	fffff097          	auipc	ra,0xfffff
    80006714:	9dc080e7          	jalr	-1572(ra) # 800050ec <_Z9kprintIntmib>
    80006718:	00009517          	auipc	a0,0x9
    8000671c:	c4050513          	addi	a0,a0,-960 # 8000f358 <CONSOLE_STATUS+0x348>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	984080e7          	jalr	-1660(ra) # 800050a4 <_Z12kprintStringPKc>
            KCHECKPRINT(sepc);
    80006728:	00009517          	auipc	a0,0x9
    8000672c:	cd850513          	addi	a0,a0,-808 # 8000f400 <CONSOLE_STATUS+0x3f0>
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	974080e7          	jalr	-1676(ra) # 800050a4 <_Z12kprintStringPKc>
    80006738:	00000613          	li	a2,0
    8000673c:	01000593          	li	a1,16
    80006740:	000a0513          	mv	a0,s4
    80006744:	fffff097          	auipc	ra,0xfffff
    80006748:	9a8080e7          	jalr	-1624(ra) # 800050ec <_Z9kprintIntmib>
    8000674c:	00009517          	auipc	a0,0x9
    80006750:	c0c50513          	addi	a0,a0,-1012 # 8000f358 <CONSOLE_STATUS+0x348>
    80006754:	fffff097          	auipc	ra,0xfffff
    80006758:	950080e7          	jalr	-1712(ra) # 800050a4 <_Z12kprintStringPKc>
            KCHECKPRINT(stval);
    8000675c:	00009517          	auipc	a0,0x9
    80006760:	cac50513          	addi	a0,a0,-852 # 8000f408 <CONSOLE_STATUS+0x3f8>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	940080e7          	jalr	-1728(ra) # 800050a4 <_Z12kprintStringPKc>
    8000676c:	00000613          	li	a2,0
    80006770:	01000593          	li	a1,16
    80006774:	00098513          	mv	a0,s3
    80006778:	fffff097          	auipc	ra,0xfffff
    8000677c:	974080e7          	jalr	-1676(ra) # 800050ec <_Z9kprintIntmib>
    80006780:	00009517          	auipc	a0,0x9
    80006784:	bd850513          	addi	a0,a0,-1064 # 8000f358 <CONSOLE_STATUS+0x348>
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	91c080e7          	jalr	-1764(ra) # 800050a4 <_Z12kprintStringPKc>
            kprintString("\n!!!PANIC DUE TO SUPERVISOR PAGE FAULT!!!\n");
    80006790:	00009517          	auipc	a0,0x9
    80006794:	c8050513          	addi	a0,a0,-896 # 8000f410 <CONSOLE_STATUS+0x400>
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	90c080e7          	jalr	-1780(ra) # 800050a4 <_Z12kprintStringPKc>
            while(true);
    800067a0:	0000006f          	j	800067a0 <interrupt+0x3a4>
            MemoryAllocator& allocator = MemoryAllocator::getInstance();
    800067a4:	00001097          	auipc	ra,0x1
    800067a8:	ea4080e7          	jalr	-348(ra) # 80007648 <_ZN15MemoryAllocator11getInstanceEv>
            FreeSegment* fs = allocator.getFreeSegmentMeta((void*)stval);
    800067ac:	00098593          	mv	a1,s3
    800067b0:	00001097          	auipc	ra,0x1
    800067b4:	45c080e7          	jalr	1116(ra) # 80007c0c <_ZN15MemoryAllocator18getFreeSegmentMetaEPv>
    800067b8:	00050913          	mv	s2,a0
            if(fs){
    800067bc:	02050463          	beqz	a0,800067e4 <interrupt+0x3e8>
                Pager::getInstance().id_map(
    800067c0:	00005097          	auipc	ra,0x5
    800067c4:	f20080e7          	jalr	-224(ra) # 8000b6e0 <_ZN5Pager11getInstanceEv>
    800067c8:	01093583          	ld	a1,16(s2)
                    (char*)fs->addr+fs->size, 
    800067cc:	00893603          	ld	a2,8(s2)
                Pager::getInstance().id_map(
    800067d0:	01600693          	li	a3,22
    800067d4:	00c58633          	add	a2,a1,a2
    800067d8:	00005097          	auipc	ra,0x5
    800067dc:	0a0080e7          	jalr	160(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
        }
    800067e0:	da1ff06f          	j	80006580 <interrupt+0x184>
                kprintString("\n!!!PANIC DUE TO NOT HANDLED USER DATA PAGE FAULT !!!\n");
    800067e4:	00009517          	auipc	a0,0x9
    800067e8:	c5c50513          	addi	a0,a0,-932 # 8000f440 <CONSOLE_STATUS+0x430>
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	8b8080e7          	jalr	-1864(ra) # 800050a4 <_Z12kprintStringPKc>
                KCHECKPRINT(scause);
    800067f4:	00009517          	auipc	a0,0x9
    800067f8:	bfc50513          	addi	a0,a0,-1028 # 8000f3f0 <CONSOLE_STATUS+0x3e0>
    800067fc:	fffff097          	auipc	ra,0xfffff
    80006800:	8a8080e7          	jalr	-1880(ra) # 800050a4 <_Z12kprintStringPKc>
    80006804:	00000613          	li	a2,0
    80006808:	01000593          	li	a1,16
    8000680c:	00048513          	mv	a0,s1
    80006810:	fffff097          	auipc	ra,0xfffff
    80006814:	8dc080e7          	jalr	-1828(ra) # 800050ec <_Z9kprintIntmib>
    80006818:	00009517          	auipc	a0,0x9
    8000681c:	b4050513          	addi	a0,a0,-1216 # 8000f358 <CONSOLE_STATUS+0x348>
    80006820:	fffff097          	auipc	ra,0xfffff
    80006824:	884080e7          	jalr	-1916(ra) # 800050a4 <_Z12kprintStringPKc>
                KCHECKPRINT(sepc);
    80006828:	00009517          	auipc	a0,0x9
    8000682c:	bd850513          	addi	a0,a0,-1064 # 8000f400 <CONSOLE_STATUS+0x3f0>
    80006830:	fffff097          	auipc	ra,0xfffff
    80006834:	874080e7          	jalr	-1932(ra) # 800050a4 <_Z12kprintStringPKc>
    80006838:	00000613          	li	a2,0
    8000683c:	01000593          	li	a1,16
    80006840:	000a0513          	mv	a0,s4
    80006844:	fffff097          	auipc	ra,0xfffff
    80006848:	8a8080e7          	jalr	-1880(ra) # 800050ec <_Z9kprintIntmib>
    8000684c:	00009517          	auipc	a0,0x9
    80006850:	b0c50513          	addi	a0,a0,-1268 # 8000f358 <CONSOLE_STATUS+0x348>
    80006854:	fffff097          	auipc	ra,0xfffff
    80006858:	850080e7          	jalr	-1968(ra) # 800050a4 <_Z12kprintStringPKc>
                KCHECKPRINT(stval);
    8000685c:	00009517          	auipc	a0,0x9
    80006860:	bac50513          	addi	a0,a0,-1108 # 8000f408 <CONSOLE_STATUS+0x3f8>
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	840080e7          	jalr	-1984(ra) # 800050a4 <_Z12kprintStringPKc>
    8000686c:	00000613          	li	a2,0
    80006870:	01000593          	li	a1,16
    80006874:	00098513          	mv	a0,s3
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	874080e7          	jalr	-1932(ra) # 800050ec <_Z9kprintIntmib>
    80006880:	00009517          	auipc	a0,0x9
    80006884:	ad850513          	addi	a0,a0,-1320 # 8000f358 <CONSOLE_STATUS+0x348>
    80006888:	fffff097          	auipc	ra,0xfffff
    8000688c:	81c080e7          	jalr	-2020(ra) # 800050a4 <_Z12kprintStringPKc>
                while(true);
    80006890:	0000006f          	j	80006890 <interrupt+0x494>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    80006894:	00009517          	auipc	a0,0x9
    80006898:	c3c50513          	addi	a0,a0,-964 # 8000f4d0 <CONSOLE_STATUS+0x4c0>
    8000689c:	fffff097          	auipc	ra,0xfffff
    800068a0:	808080e7          	jalr	-2040(ra) # 800050a4 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    800068a4:	ffffe097          	auipc	ra,0xffffe
    800068a8:	fcc080e7          	jalr	-52(ra) # 80004870 <_ZN3TCB13panicDispatchEv>
    800068ac:	cd5ff06f          	j	80006580 <interrupt+0x184>
        KCHECKPRINT(scause);
    800068b0:	00009517          	auipc	a0,0x9
    800068b4:	b4050513          	addi	a0,a0,-1216 # 8000f3f0 <CONSOLE_STATUS+0x3e0>
    800068b8:	ffffe097          	auipc	ra,0xffffe
    800068bc:	7ec080e7          	jalr	2028(ra) # 800050a4 <_Z12kprintStringPKc>
    800068c0:	00000613          	li	a2,0
    800068c4:	01000593          	li	a1,16
    800068c8:	00048513          	mv	a0,s1
    800068cc:	fffff097          	auipc	ra,0xfffff
    800068d0:	820080e7          	jalr	-2016(ra) # 800050ec <_Z9kprintIntmib>
    800068d4:	00009517          	auipc	a0,0x9
    800068d8:	a8450513          	addi	a0,a0,-1404 # 8000f358 <CONSOLE_STATUS+0x348>
    800068dc:	ffffe097          	auipc	ra,0xffffe
    800068e0:	7c8080e7          	jalr	1992(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintString("GRESKA\n");
    800068e4:	00009517          	auipc	a0,0x9
    800068e8:	dac50513          	addi	a0,a0,-596 # 8000f690 <CONSOLE_STATUS+0x680>
    800068ec:	ffffe097          	auipc	ra,0xffffe
    800068f0:	7b8080e7          	jalr	1976(ra) # 800050a4 <_Z12kprintStringPKc>
        while(1);
    800068f4:	0000006f          	j	800068f4 <interrupt+0x4f8>

00000000800068f8 <_ZN5Buddy11getInstanceEv>:
    if(!buddy)  return 1;

    return 0;
}

Buddy& Buddy::getInstance(){
    800068f8:	ff010113          	addi	sp,sp,-16
    800068fc:	00813423          	sd	s0,8(sp)
    80006900:	01010413          	addi	s0,sp,16
    if(!buddy) {  /* panic */ }
    return (*buddy);
}
    80006904:	0000f797          	auipc	a5,0xf
    80006908:	ac478793          	addi	a5,a5,-1340 # 800153c8 <_ZN5Buddy5buddyE>
    8000690c:	0007b503          	ld	a0,0(a5)
    80006910:	00813403          	ld	s0,8(sp)
    80006914:	01010113          	addi	sp,sp,16
    80006918:	00008067          	ret

000000008000691c <_ZN5Buddy13get_from_listEh>:
    lhp[level] = chunk;

    return 0;
}

mmeta_t* Buddy::get_from_list(uchar level){
    8000691c:	ff010113          	addi	sp,sp,-16
    80006920:	00813423          	sd	s0,8(sp)
    80006924:	01010413          	addi	s0,sp,16
    /* chk if level is valid */
    if(level > max_level) return nullptr;
    80006928:	00853783          	ld	a5,8(a0)
    8000692c:	04b7e463          	bltu	a5,a1,80006974 <_ZN5Buddy13get_from_listEh+0x58>
    mmeta_t* ret = lhp[level];
    80006930:	01053783          	ld	a5,16(a0)
    80006934:	00359593          	slli	a1,a1,0x3
    80006938:	00b787b3          	add	a5,a5,a1
    8000693c:	0007b783          	ld	a5,0(a5)
    if(ret){
    80006940:	02078063          	beqz	a5,80006960 <_ZN5Buddy13get_from_listEh+0x44>
        if(ret->next) ret->next->prev = 0;
    80006944:	0007b703          	ld	a4,0(a5)
    80006948:	00070463          	beqz	a4,80006950 <_ZN5Buddy13get_from_listEh+0x34>
    8000694c:	00073423          	sd	zero,8(a4)
        lhp[level] = ret->next;    
    80006950:	01053703          	ld	a4,16(a0)
    80006954:	00b705b3          	add	a1,a4,a1
    80006958:	0007b703          	ld	a4,0(a5)
    8000695c:	00e5b023          	sd	a4,0(a1)
    }
    ret->next = 0;
    80006960:	0007b023          	sd	zero,0(a5)
    return ret;
}
    80006964:	00078513          	mv	a0,a5
    80006968:	00813403          	ld	s0,8(sp)
    8000696c:	01010113          	addi	sp,sp,16
    80006970:	00008067          	ret
    if(level > max_level) return nullptr;
    80006974:	00000793          	li	a5,0
    80006978:	fedff06f          	j	80006964 <_ZN5Buddy13get_from_listEh+0x48>

000000008000697c <_ZN5Buddy5splitEP7mmeta_t>:
    return 0;

}


mmeta_t* Buddy::split(mmeta_t* chunk){
    8000697c:	ff010113          	addi	sp,sp,-16
    80006980:	00813423          	sd	s0,8(sp)
    80006984:	01010413          	addi	s0,sp,16
    /* chk if address is valid */
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    80006988:	000017b7          	lui	a5,0x1
    8000698c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006990:	00f5f7b3          	and	a5,a1,a5
    80006994:	02079663          	bnez	a5,800069c0 <_ZN5Buddy5splitEP7mmeta_t+0x44>
    80006998:	00053783          	ld	a5,0(a0)
    8000699c:	02f5e663          	bltu	a1,a5,800069c8 <_ZN5Buddy5splitEP7mmeta_t+0x4c>
    return (mmeta_t*)( (uint64)chunk + (BLOCK_SIZE << (chunk->level - 1)) ) ;
    800069a0:	0105c503          	lbu	a0,16(a1)
    800069a4:	fff5079b          	addiw	a5,a0,-1
    800069a8:	00001537          	lui	a0,0x1
    800069ac:	00f51533          	sll	a0,a0,a5
    800069b0:	00a58533          	add	a0,a1,a0
}
    800069b4:	00813403          	ld	s0,8(sp)
    800069b8:	01010113          	addi	sp,sp,16
    800069bc:	00008067          	ret
    if( ((uint64)chunk & (BLOCK_SIZE - 1)) || chunk < start_address ) return nullptr;
    800069c0:	00000513          	li	a0,0
    800069c4:	ff1ff06f          	j	800069b4 <_ZN5Buddy5splitEP7mmeta_t+0x38>
    800069c8:	00000513          	li	a0,0
    800069cc:	fe9ff06f          	j	800069b4 <_ZN5Buddy5splitEP7mmeta_t+0x38>

00000000800069d0 <_ZN5Buddy11get_bit_valEm>:
    chunk->level = chunk->level + 1;

    return chunk;
}

bool Buddy::get_bit_val(size_t index){
    800069d0:	ff010113          	addi	sp,sp,-16
    800069d4:	00813423          	sd	s0,8(sp)
    800069d8:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    800069dc:	0035d713          	srli	a4,a1,0x3
    return fmap[entry] & ( 1 << (index & 7) );
    800069e0:	01853783          	ld	a5,24(a0) # 1018 <_entry-0x7fffefe8>
    800069e4:	00e787b3          	add	a5,a5,a4
    800069e8:	0007c503          	lbu	a0,0(a5)
    800069ec:	0075f593          	andi	a1,a1,7
    800069f0:	40b5553b          	sraw	a0,a0,a1
}
    800069f4:	00157513          	andi	a0,a0,1
    800069f8:	00813403          	ld	s0,8(sp)
    800069fc:	01010113          	addi	sp,sp,16
    80006a00:	00008067          	ret

0000000080006a04 <_ZN5Buddy11add_to_listEhP7mmeta_t>:
    if(level > max_level) return -4;
    80006a04:	00853783          	ld	a5,8(a0)
    80006a08:	0ab7ee63          	bltu	a5,a1,80006ac4 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xc0>
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006a0c:	0c060063          	beqz	a2,80006acc <_ZN5Buddy11add_to_listEhP7mmeta_t+0xc8>
    80006a10:	000017b7          	lui	a5,0x1
    80006a14:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006a18:	00f677b3          	and	a5,a2,a5
    80006a1c:	0a079c63          	bnez	a5,80006ad4 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xd0>
int Buddy::add_to_list(uchar level, mmeta_t* chunk){
    80006a20:	fd010113          	addi	sp,sp,-48
    80006a24:	02113423          	sd	ra,40(sp)
    80006a28:	02813023          	sd	s0,32(sp)
    80006a2c:	00913c23          	sd	s1,24(sp)
    80006a30:	01213823          	sd	s2,16(sp)
    80006a34:	01313423          	sd	s3,8(sp)
    80006a38:	03010413          	addi	s0,sp,48
    80006a3c:	00060493          	mv	s1,a2
    80006a40:	00058993          	mv	s3,a1
    80006a44:	00050913          	mv	s2,a0
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006a48:	00053783          	ld	a5,0(a0)
    80006a4c:	40f607b3          	sub	a5,a2,a5
    80006a50:	0000f597          	auipc	a1,0xf
    80006a54:	9705c583          	lbu	a1,-1680(a1) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006a58:	00b7d5b3          	srl	a1,a5,a1
    80006a5c:	00000097          	auipc	ra,0x0
    80006a60:	f74080e7          	jalr	-140(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    80006a64:	06050c63          	beqz	a0,80006adc <_ZN5Buddy11add_to_listEhP7mmeta_t+0xd8>
    chunk -> next = lhp[level];
    80006a68:	01093783          	ld	a5,16(s2)
    80006a6c:	00399713          	slli	a4,s3,0x3
    80006a70:	00e787b3          	add	a5,a5,a4
    80006a74:	0007b783          	ld	a5,0(a5)
    80006a78:	00f4b023          	sd	a5,0(s1)
    chunk -> prev = 0;
    80006a7c:	0004b423          	sd	zero,8(s1)
    chunk -> level = level;
    80006a80:	01348823          	sb	s3,16(s1)
    if(lhp[level]) lhp[level] -> prev = chunk;
    80006a84:	01093783          	ld	a5,16(s2)
    80006a88:	00e787b3          	add	a5,a5,a4
    80006a8c:	0007b783          	ld	a5,0(a5)
    80006a90:	00078463          	beqz	a5,80006a98 <_ZN5Buddy11add_to_listEhP7mmeta_t+0x94>
    80006a94:	0097b423          	sd	s1,8(a5)
    lhp[level] = chunk;
    80006a98:	01093783          	ld	a5,16(s2)
    80006a9c:	00e787b3          	add	a5,a5,a4
    80006aa0:	0097b023          	sd	s1,0(a5)
    return 0;
    80006aa4:	00000513          	li	a0,0
}
    80006aa8:	02813083          	ld	ra,40(sp)
    80006aac:	02013403          	ld	s0,32(sp)
    80006ab0:	01813483          	ld	s1,24(sp)
    80006ab4:	01013903          	ld	s2,16(sp)
    80006ab8:	00813983          	ld	s3,8(sp)
    80006abc:	03010113          	addi	sp,sp,48
    80006ac0:	00008067          	ret
    if(level > max_level) return -4;
    80006ac4:	ffc00513          	li	a0,-4
    80006ac8:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006acc:	fff00513          	li	a0,-1
    80006ad0:	00008067          	ret
    80006ad4:	fff00513          	li	a0,-1
}
    80006ad8:	00008067          	ret
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006adc:	ffe00513          	li	a0,-2
    80006ae0:	fc9ff06f          	j	80006aa8 <_ZN5Buddy11add_to_listEhP7mmeta_t+0xa4>

0000000080006ae4 <_ZN5BuddyC1EPvh>:
Buddy::Buddy(void* saddr, uchar level){
    80006ae4:	fd010113          	addi	sp,sp,-48
    80006ae8:	02113423          	sd	ra,40(sp)
    80006aec:	02813023          	sd	s0,32(sp)
    80006af0:	00913c23          	sd	s1,24(sp)
    80006af4:	01213823          	sd	s2,16(sp)
    80006af8:	01313423          	sd	s3,8(sp)
    80006afc:	03010413          	addi	s0,sp,48
    80006b00:	00050493          	mv	s1,a0
    80006b04:	00060993          	mv	s3,a2
    start_address = saddr;
    80006b08:	00b53023          	sd	a1,0(a0)
    max_level = level;
    80006b0c:	00c4b423          	sd	a2,8(s1)
class NoAlloc{ /* singleton */ 
    static bool working;
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    80006b10:	0000f797          	auipc	a5,0xf
    80006b14:	8d078793          	addi	a5,a5,-1840 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006b18:	0007b503          	ld	a0,0(a5)
    uint64 y = (uint64)saddr + (BLOCK_SIZE << max_level);
    80006b1c:	000017b7          	lui	a5,0x1
    80006b20:	00c797b3          	sll	a5,a5,a2
    80006b24:	00b787b3          	add	a5,a5,a1
    void* ind = NoAlloc::mem_alloc(y - x);
    80006b28:	40a78533          	sub	a0,a5,a0
    80006b2c:	00001097          	auipc	ra,0x1
    80006b30:	338080e7          	jalr	824(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    x = 1 << (BLOCK_SIZE_BIT_LEN - 3);
    80006b34:	0000f917          	auipc	s2,0xf
    80006b38:	88c94903          	lbu	s2,-1908(s2) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006b3c:	ffd9079b          	addiw	a5,s2,-3
    80006b40:	00100913          	li	s2,1
    80006b44:	00f9193b          	sllw	s2,s2,a5
    fmap = (uchar*)NoAlloc::mem_alloc(x);
    80006b48:	00090513          	mv	a0,s2
    80006b4c:	00001097          	auipc	ra,0x1
    80006b50:	318080e7          	jalr	792(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    80006b54:	00a4bc23          	sd	a0,24(s1)
    for(uint64 i = 0; i < x; i++) fmap[i] = 0;
    80006b58:	00000793          	li	a5,0
    80006b5c:	0127fc63          	bgeu	a5,s2,80006b74 <_ZN5BuddyC1EPvh+0x90>
    80006b60:	0184b703          	ld	a4,24(s1)
    80006b64:	00f70733          	add	a4,a4,a5
    80006b68:	00070023          	sb	zero,0(a4)
    80006b6c:	00178793          	addi	a5,a5,1 # 1001 <_entry-0x7fffefff>
    80006b70:	fedff06f          	j	80006b5c <_ZN5BuddyC1EPvh+0x78>
    lhp = (mmeta_t**)NoAlloc::mem_alloc((level+1)*sizeof(mmeta_t*));
    80006b74:	00198513          	addi	a0,s3,1
    80006b78:	00351513          	slli	a0,a0,0x3
    80006b7c:	00001097          	auipc	ra,0x1
    80006b80:	2e8080e7          	jalr	744(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    80006b84:	00a4b823          	sd	a0,16(s1)
    for(uchar i = 0; i < max_level + 1; i++)
    80006b88:	00000793          	li	a5,0
    80006b8c:	0084b703          	ld	a4,8(s1)
    80006b90:	00170713          	addi	a4,a4,1
    80006b94:	02e7f063          	bgeu	a5,a4,80006bb4 <_ZN5BuddyC1EPvh+0xd0>
        lhp[i] = nullptr;
    80006b98:	0104b703          	ld	a4,16(s1)
    80006b9c:	00379693          	slli	a3,a5,0x3
    80006ba0:	00d70733          	add	a4,a4,a3
    80006ba4:	00073023          	sd	zero,0(a4)
    for(uchar i = 0; i < max_level + 1; i++)
    80006ba8:	0017879b          	addiw	a5,a5,1
    80006bac:	0ff7f793          	andi	a5,a5,255
    80006bb0:	fddff06f          	j	80006b8c <_ZN5BuddyC1EPvh+0xa8>
    fmap[0] |= 1;
    80006bb4:	0184b703          	ld	a4,24(s1)
    80006bb8:	00074783          	lbu	a5,0(a4)
    80006bbc:	0017e793          	ori	a5,a5,1
    80006bc0:	00f70023          	sb	a5,0(a4)
    int code = add_to_list(max_level, (mmeta_t*)start_address);
    80006bc4:	0004b603          	ld	a2,0(s1)
    80006bc8:	0084c583          	lbu	a1,8(s1)
    80006bcc:	00048513          	mv	a0,s1
    80006bd0:	00000097          	auipc	ra,0x0
    80006bd4:	e34080e7          	jalr	-460(ra) # 80006a04 <_ZN5Buddy11add_to_listEhP7mmeta_t>
    80006bd8:	00050493          	mv	s1,a0
    if ( code < 0) {
    80006bdc:	02054063          	bltz	a0,80006bfc <_ZN5BuddyC1EPvh+0x118>
}
    80006be0:	02813083          	ld	ra,40(sp)
    80006be4:	02013403          	ld	s0,32(sp)
    80006be8:	01813483          	ld	s1,24(sp)
    80006bec:	01013903          	ld	s2,16(sp)
    80006bf0:	00813983          	ld	s3,8(sp)
    80006bf4:	03010113          	addi	sp,sp,48
    80006bf8:	00008067          	ret
        kprintString("addtolist panic: ");
    80006bfc:	00009517          	auipc	a0,0x9
    80006c00:	90c50513          	addi	a0,a0,-1780 # 8000f508 <CONSOLE_STATUS+0x4f8>
    80006c04:	ffffe097          	auipc	ra,0xffffe
    80006c08:	4a0080e7          	jalr	1184(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt(code, 16);
    80006c0c:	00000613          	li	a2,0
    80006c10:	01000593          	li	a1,16
    80006c14:	00048513          	mv	a0,s1
    80006c18:	ffffe097          	auipc	ra,0xffffe
    80006c1c:	4d4080e7          	jalr	1236(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80006c20:	00008517          	auipc	a0,0x8
    80006c24:	73850513          	addi	a0,a0,1848 # 8000f358 <CONSOLE_STATUS+0x348>
    80006c28:	ffffe097          	auipc	ra,0xffffe
    80006c2c:	47c080e7          	jalr	1148(ra) # 800050a4 <_Z12kprintStringPKc>
}
    80006c30:	fb1ff06f          	j	80006be0 <_ZN5BuddyC1EPvh+0xfc>

0000000080006c34 <_ZN5Buddy9initalizeEPvh>:
int Buddy::initalize(void* saddr, uchar level){
    80006c34:	fd010113          	addi	sp,sp,-48
    80006c38:	02113423          	sd	ra,40(sp)
    80006c3c:	02813023          	sd	s0,32(sp)
    80006c40:	00913c23          	sd	s1,24(sp)
    80006c44:	01213823          	sd	s2,16(sp)
    80006c48:	01313423          	sd	s3,8(sp)
    80006c4c:	03010413          	addi	s0,sp,48
    80006c50:	00050493          	mv	s1,a0
    80006c54:	00058993          	mv	s3,a1
    BLOCK_SIZE_BIT_LEN = log2(BLOCK_SIZE);
    80006c58:	00001537          	lui	a0,0x1
    80006c5c:	fffff097          	auipc	ra,0xfffff
    80006c60:	e08080e7          	jalr	-504(ra) # 80005a64 <_Z4log2m>
    80006c64:	0000e797          	auipc	a5,0xe
    80006c68:	74a78e23          	sb	a0,1884(a5) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006c6c:	0000e797          	auipc	a5,0xe
    80006c70:	77478793          	addi	a5,a5,1908 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006c74:	0007b783          	ld	a5,0(a5)
    if((uint64)saddr < laa + sizeof(Buddy))
    80006c78:	02078793          	addi	a5,a5,32
    80006c7c:	02f4f263          	bgeu	s1,a5,80006ca0 <_ZN5Buddy9initalizeEPvh+0x6c>
        return 1;
    80006c80:	00100513          	li	a0,1
}
    80006c84:	02813083          	ld	ra,40(sp)
    80006c88:	02013403          	ld	s0,32(sp)
    80006c8c:	01813483          	ld	s1,24(sp)
    80006c90:	01013903          	ld	s2,16(sp)
    80006c94:	00813983          	ld	s3,8(sp)
    80006c98:	03010113          	addi	sp,sp,48
    80006c9c:	00008067          	ret
    void clr_bit(size_t index);

    /* utility */
    void* get_buddy_addr(uchar level, void*);
    static uint64 blockAlign(uint64 input){
        return (input + BLOCK_SIZE - 1) & ( (~0ULL) << BLOCK_SIZE_BIT_LEN);
    80006ca0:	000017b7          	lui	a5,0x1
    80006ca4:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006ca8:	00f484b3          	add	s1,s1,a5
    80006cac:	fff00793          	li	a5,-1
    80006cb0:	00a79533          	sll	a0,a5,a0
    80006cb4:	00a4f4b3          	and	s1,s1,a0
    __NOALLOC_OPERATORS__
    80006cb8:	02000513          	li	a0,32
    80006cbc:	00001097          	auipc	ra,0x1
    80006cc0:	1a8080e7          	jalr	424(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    80006cc4:	00050913          	mv	s2,a0
    buddy = new Buddy(saddr, level);
    80006cc8:	00050a63          	beqz	a0,80006cdc <_ZN5Buddy9initalizeEPvh+0xa8>
    80006ccc:	00098613          	mv	a2,s3
    80006cd0:	00048593          	mv	a1,s1
    80006cd4:	00000097          	auipc	ra,0x0
    80006cd8:	e10080e7          	jalr	-496(ra) # 80006ae4 <_ZN5BuddyC1EPvh>
    80006cdc:	0000e797          	auipc	a5,0xe
    80006ce0:	6f27b623          	sd	s2,1772(a5) # 800153c8 <_ZN5Buddy5buddyE>
    if(!buddy)  return 1;
    80006ce4:	00090663          	beqz	s2,80006cf0 <_ZN5Buddy9initalizeEPvh+0xbc>
    return 0;
    80006ce8:	00000513          	li	a0,0
    80006cec:	f99ff06f          	j	80006c84 <_ZN5Buddy9initalizeEPvh+0x50>
    if(!buddy)  return 1;
    80006cf0:	00100513          	li	a0,1
    80006cf4:	f91ff06f          	j	80006c84 <_ZN5Buddy9initalizeEPvh+0x50>

0000000080006cf8 <_ZN5Buddy16remove_from_listEhP7mmeta_t>:
    if(level > max_level) return -4;
    80006cf8:	00853783          	ld	a5,8(a0) # 1008 <_entry-0x7fffeff8>
    80006cfc:	0cb7ea63          	bltu	a5,a1,80006dd0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xd8>
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006d00:	0c060c63          	beqz	a2,80006dd8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xe0>
    80006d04:	000017b7          	lui	a5,0x1
    80006d08:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80006d0c:	00f677b3          	and	a5,a2,a5
    80006d10:	0c079863          	bnez	a5,80006de0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xe8>
int Buddy::remove_from_list(uchar level, mmeta_t* chunk){
    80006d14:	fd010113          	addi	sp,sp,-48
    80006d18:	02113423          	sd	ra,40(sp)
    80006d1c:	02813023          	sd	s0,32(sp)
    80006d20:	00913c23          	sd	s1,24(sp)
    80006d24:	01213823          	sd	s2,16(sp)
    80006d28:	01313423          	sd	s3,8(sp)
    80006d2c:	03010413          	addi	s0,sp,48
    80006d30:	00060493          	mv	s1,a2
    80006d34:	00058993          	mv	s3,a1
    80006d38:	00050913          	mv	s2,a0
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006d3c:	00053783          	ld	a5,0(a0)
    80006d40:	40f607b3          	sub	a5,a2,a5
    80006d44:	0000e597          	auipc	a1,0xe
    80006d48:	67c5c583          	lbu	a1,1660(a1) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006d4c:	00b7d5b3          	srl	a1,a5,a1
    80006d50:	00000097          	auipc	ra,0x0
    80006d54:	c80080e7          	jalr	-896(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    80006d58:	08050863          	beqz	a0,80006de8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xf0>
    if(!(chunk->level == level)) return -3;
    80006d5c:	0104c783          	lbu	a5,16(s1)
    80006d60:	09379863          	bne	a5,s3,80006df0 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xf8>
    if(lhp[level] == chunk){
    80006d64:	01093783          	ld	a5,16(s2)
    80006d68:	00399713          	slli	a4,s3,0x3
    80006d6c:	00e787b3          	add	a5,a5,a4
    80006d70:	0007b783          	ld	a5,0(a5)
    80006d74:	04978263          	beq	a5,s1,80006db8 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xc0>
    chunk->prev->next = chunk->next;
    80006d78:	0084b703          	ld	a4,8(s1)
    80006d7c:	0004b783          	ld	a5,0(s1)
    80006d80:	00f73023          	sd	a5,0(a4)
    if(chunk->next) chunk->next->prev = chunk->prev;
    80006d84:	00078663          	beqz	a5,80006d90 <_ZN5Buddy16remove_from_listEhP7mmeta_t+0x98>
    80006d88:	0084b703          	ld	a4,8(s1)
    80006d8c:	00e7b423          	sd	a4,8(a5)
    chunk->next = chunk->prev = 0;
    80006d90:	0004b423          	sd	zero,8(s1)
    80006d94:	0004b023          	sd	zero,0(s1)
    return 0;
    80006d98:	00000513          	li	a0,0
}
    80006d9c:	02813083          	ld	ra,40(sp)
    80006da0:	02013403          	ld	s0,32(sp)
    80006da4:	01813483          	ld	s1,24(sp)
    80006da8:	01013903          	ld	s2,16(sp)
    80006dac:	00813983          	ld	s3,8(sp)
    80006db0:	03010113          	addi	sp,sp,48
    80006db4:	00008067          	ret
        get_from_list(level);
    80006db8:	00098593          	mv	a1,s3
    80006dbc:	00090513          	mv	a0,s2
    80006dc0:	00000097          	auipc	ra,0x0
    80006dc4:	b5c080e7          	jalr	-1188(ra) # 8000691c <_ZN5Buddy13get_from_listEh>
        return 0;
    80006dc8:	00000513          	li	a0,0
    80006dcc:	fd1ff06f          	j	80006d9c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>
    if(level > max_level) return -4;
    80006dd0:	ffc00513          	li	a0,-4
    80006dd4:	00008067          	ret
    if( !chunk || ((uint64)chunk & (BLOCK_SIZE - 1)) ) return -1;
    80006dd8:	fff00513          	li	a0,-1
    80006ddc:	00008067          	ret
    80006de0:	fff00513          	li	a0,-1
}
    80006de4:	00008067          	ret
    if(!get_bit_val(BLOCK_IND(chunk))) return -2;
    80006de8:	ffe00513          	li	a0,-2
    80006dec:	fb1ff06f          	j	80006d9c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>
    if(!(chunk->level == level)) return -3;
    80006df0:	ffd00513          	li	a0,-3
    80006df4:	fa9ff06f          	j	80006d9c <_ZN5Buddy16remove_from_listEhP7mmeta_t+0xa4>

0000000080006df8 <_ZN5Buddy7set_bitEm>:

void Buddy::set_bit(size_t index){
    80006df8:	ff010113          	addi	sp,sp,-16
    80006dfc:	00813423          	sd	s0,8(sp)
    80006e00:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    80006e04:	0035d713          	srli	a4,a1,0x3
    fmap[entry] |= ( 1 << (index & 7) );
    80006e08:	01853783          	ld	a5,24(a0)
    80006e0c:	00e787b3          	add	a5,a5,a4
    80006e10:	0075f713          	andi	a4,a1,7
    80006e14:	00100593          	li	a1,1
    80006e18:	00e595bb          	sllw	a1,a1,a4
    80006e1c:	0007c703          	lbu	a4,0(a5)
    80006e20:	00e5e5b3          	or	a1,a1,a4
    80006e24:	00b78023          	sb	a1,0(a5)
}
    80006e28:	00813403          	ld	s0,8(sp)
    80006e2c:	01010113          	addi	sp,sp,16
    80006e30:	00008067          	ret

0000000080006e34 <_ZN5Buddy7clr_bitEm>:

void Buddy::clr_bit(size_t index){
    80006e34:	ff010113          	addi	sp,sp,-16
    80006e38:	00813423          	sd	s0,8(sp)
    80006e3c:	01010413          	addi	s0,sp,16
    size_t entry = index >> 3;
    80006e40:	0035d793          	srli	a5,a1,0x3
    fmap[entry] &= ~( 1 << (index & 7) );
    80006e44:	01853703          	ld	a4,24(a0)
    80006e48:	00f70733          	add	a4,a4,a5
    80006e4c:	0075f593          	andi	a1,a1,7
    80006e50:	00100793          	li	a5,1
    80006e54:	00b797bb          	sllw	a5,a5,a1
    80006e58:	fff7c793          	not	a5,a5
    80006e5c:	00074683          	lbu	a3,0(a4)
    80006e60:	00d7f7b3          	and	a5,a5,a3
    80006e64:	00f70023          	sb	a5,0(a4)
}
    80006e68:	00813403          	ld	s0,8(sp)
    80006e6c:	01010113          	addi	sp,sp,16
    80006e70:	00008067          	ret

0000000080006e74 <_ZN5Buddy9mem_allocEh>:
void* Buddy::mem_alloc(uchar level){
    80006e74:	fc010113          	addi	sp,sp,-64
    80006e78:	02113c23          	sd	ra,56(sp)
    80006e7c:	02813823          	sd	s0,48(sp)
    80006e80:	02913423          	sd	s1,40(sp)
    80006e84:	03213023          	sd	s2,32(sp)
    80006e88:	01313c23          	sd	s3,24(sp)
    80006e8c:	01413823          	sd	s4,16(sp)
    80006e90:	01513423          	sd	s5,8(sp)
    80006e94:	04010413          	addi	s0,sp,64
    if(level > max_level) return nullptr;
    80006e98:	00853683          	ld	a3,8(a0)
    80006e9c:	0eb6ec63          	bltu	a3,a1,80006f94 <_ZN5Buddy9mem_allocEh+0x120>
    uchar i = level;
    80006ea0:	00058493          	mv	s1,a1
    for(; i <= max_level; i++)
    80006ea4:	00048613          	mv	a2,s1
    80006ea8:	0296e263          	bltu	a3,s1,80006ecc <_ZN5Buddy9mem_allocEh+0x58>
        if(lhp[i]) break;
    80006eac:	01053783          	ld	a5,16(a0)
    80006eb0:	00349713          	slli	a4,s1,0x3
    80006eb4:	00e787b3          	add	a5,a5,a4
    80006eb8:	0007b783          	ld	a5,0(a5)
    80006ebc:	00079863          	bnez	a5,80006ecc <_ZN5Buddy9mem_allocEh+0x58>
    for(; i <= max_level; i++)
    80006ec0:	0014849b          	addiw	s1,s1,1
    80006ec4:	0ff4f493          	andi	s1,s1,255
    80006ec8:	fddff06f          	j	80006ea4 <_ZN5Buddy9mem_allocEh+0x30>
    if(i > max_level) return nullptr;
    80006ecc:	0cc6e863          	bltu	a3,a2,80006f9c <_ZN5Buddy9mem_allocEh+0x128>
    80006ed0:	00058a93          	mv	s5,a1
    80006ed4:	00050913          	mv	s2,a0
    mmeta_t* chunk = get_from_list(i);
    80006ed8:	00048593          	mv	a1,s1
    80006edc:	00000097          	auipc	ra,0x0
    80006ee0:	a40080e7          	jalr	-1472(ra) # 8000691c <_ZN5Buddy13get_from_listEh>
    80006ee4:	00050993          	mv	s3,a0
    for(;i > level; i--){
    80006ee8:	069af263          	bgeu	s5,s1,80006f4c <_ZN5Buddy9mem_allocEh+0xd8>
        mmeta_t* t = split(chunk);
    80006eec:	00098593          	mv	a1,s3
    80006ef0:	00090513          	mv	a0,s2
    80006ef4:	00000097          	auipc	ra,0x0
    80006ef8:	a88080e7          	jalr	-1400(ra) # 8000697c <_ZN5Buddy5splitEP7mmeta_t>
    80006efc:	00050a13          	mv	s4,a0
        set_bit(BLOCK_IND(t));
    80006f00:	00093783          	ld	a5,0(s2)
    80006f04:	40f507b3          	sub	a5,a0,a5
    80006f08:	0000e597          	auipc	a1,0xe
    80006f0c:	4b85c583          	lbu	a1,1208(a1) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006f10:	00b7d5b3          	srl	a1,a5,a1
    80006f14:	00090513          	mv	a0,s2
    80006f18:	00000097          	auipc	ra,0x0
    80006f1c:	ee0080e7          	jalr	-288(ra) # 80006df8 <_ZN5Buddy7set_bitEm>
        add_to_list(i-1, t);
    80006f20:	fff4849b          	addiw	s1,s1,-1
    80006f24:	0ff4f493          	andi	s1,s1,255
    80006f28:	000a0613          	mv	a2,s4
    80006f2c:	00048593          	mv	a1,s1
    80006f30:	00090513          	mv	a0,s2
    80006f34:	00000097          	auipc	ra,0x0
    80006f38:	ad0080e7          	jalr	-1328(ra) # 80006a04 <_ZN5Buddy11add_to_listEhP7mmeta_t>
        chunk->level--;
    80006f3c:	0109c783          	lbu	a5,16(s3)
    80006f40:	fff7879b          	addiw	a5,a5,-1
    80006f44:	00f98823          	sb	a5,16(s3)
    for(;i > level; i--){
    80006f48:	fa1ff06f          	j	80006ee8 <_ZN5Buddy9mem_allocEh+0x74>
    clr_bit(BLOCK_IND(chunk));
    80006f4c:	00093783          	ld	a5,0(s2)
    80006f50:	40f987b3          	sub	a5,s3,a5
    80006f54:	0000e597          	auipc	a1,0xe
    80006f58:	46c5c583          	lbu	a1,1132(a1) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80006f5c:	00b7d5b3          	srl	a1,a5,a1
    80006f60:	00090513          	mv	a0,s2
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	ed0080e7          	jalr	-304(ra) # 80006e34 <_ZN5Buddy7clr_bitEm>
}
    80006f6c:	00098513          	mv	a0,s3
    80006f70:	03813083          	ld	ra,56(sp)
    80006f74:	03013403          	ld	s0,48(sp)
    80006f78:	02813483          	ld	s1,40(sp)
    80006f7c:	02013903          	ld	s2,32(sp)
    80006f80:	01813983          	ld	s3,24(sp)
    80006f84:	01013a03          	ld	s4,16(sp)
    80006f88:	00813a83          	ld	s5,8(sp)
    80006f8c:	04010113          	addi	sp,sp,64
    80006f90:	00008067          	ret
    if(level > max_level) return nullptr;
    80006f94:	00000993          	li	s3,0
    80006f98:	fd5ff06f          	j	80006f6c <_ZN5Buddy9mem_allocEh+0xf8>
    if(i > max_level) return nullptr;
    80006f9c:	00000993          	li	s3,0
    80006fa0:	fcdff06f          	j	80006f6c <_ZN5Buddy9mem_allocEh+0xf8>

0000000080006fa4 <_Z3kmiv>:

int kmi(){
    80006fa4:	fe010113          	addi	sp,sp,-32
    80006fa8:	00113c23          	sd	ra,24(sp)
    80006fac:	00813823          	sd	s0,16(sp)
    80006fb0:	00913423          	sd	s1,8(sp)
    80006fb4:	01213023          	sd	s2,0(sp)
    80006fb8:	02010413          	addi	s0,sp,32
    80006fbc:	0000e797          	auipc	a5,0xe
    80006fc0:	42478793          	addi	a5,a5,1060 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80006fc4:	0007b903          	ld	s2,0(a5)
    /* start of reserved memory for buddy allocator */
    void* buddy_mem_start = (void*)( 
        (uint64)NoAlloc::getEndAddress() + sizeof(Buddy) ) ;
    80006fc8:	02090913          	addi	s2,s2,32

    size_t buddy_mem_size = ((uint64)HEAP_END_ADDR - (uint64)buddy_mem_start) >> 3;
    80006fcc:	0000d797          	auipc	a5,0xd
    80006fd0:	c3478793          	addi	a5,a5,-972 # 80013c00 <HEAP_END_ADDR>
    80006fd4:	0007b503          	ld	a0,0(a5)
    80006fd8:	41250533          	sub	a0,a0,s2
    80006fdc:	00355513          	srli	a0,a0,0x3
    if(!buddy_mem_size) return 2;
    80006fe0:	06050663          	beqz	a0,8000704c <_Z3kmiv+0xa8>
    buddy_mem_size = ( (buddy_mem_size-1) >> log2(Buddy::BLOCK_SIZE) ) + 1;
    80006fe4:	fff50493          	addi	s1,a0,-1
    80006fe8:	00001537          	lui	a0,0x1
    80006fec:	fffff097          	auipc	ra,0xfffff
    80006ff0:	a78080e7          	jalr	-1416(ra) # 80005a64 <_Z4log2m>
    80006ff4:	00a4d533          	srl	a0,s1,a0
    uchar level = log2(closest2pow(buddy_mem_size));
    80006ff8:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80006ffc:	fffff097          	auipc	ra,0xfffff
    80007000:	a3c080e7          	jalr	-1476(ra) # 80005a38 <_Z11closest2powm>
    80007004:	fffff097          	auipc	ra,0xfffff
    80007008:	a60080e7          	jalr	-1440(ra) # 80005a64 <_Z4log2m>
    
    int ret = Buddy::initalize(buddy_mem_start, level);
    8000700c:	00050593          	mv	a1,a0
    80007010:	00090513          	mv	a0,s2
    80007014:	00000097          	auipc	ra,0x0
    80007018:	c20080e7          	jalr	-992(ra) # 80006c34 <_ZN5Buddy9initalizeEPvh>
    8000701c:	00050493          	mv	s1,a0
    if(!ret) SlabAllocator::getInstance();
    80007020:	02050063          	beqz	a0,80007040 <_Z3kmiv+0x9c>
    return ret;
}
    80007024:	00048513          	mv	a0,s1
    80007028:	01813083          	ld	ra,24(sp)
    8000702c:	01013403          	ld	s0,16(sp)
    80007030:	00813483          	ld	s1,8(sp)
    80007034:	00013903          	ld	s2,0(sp)
    80007038:	02010113          	addi	sp,sp,32
    8000703c:	00008067          	ret
    if(!ret) SlabAllocator::getInstance();
    80007040:	00002097          	auipc	ra,0x2
    80007044:	2d4080e7          	jalr	724(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80007048:	fddff06f          	j	80007024 <_Z3kmiv+0x80>
    if(!buddy_mem_size) return 2;
    8000704c:	00200493          	li	s1,2
    80007050:	fd5ff06f          	j	80007024 <_Z3kmiv+0x80>

0000000080007054 <_ZN5Buddy8print_beEm>:

void Buddy::print_be(size_t index){
    80007054:	fe010113          	addi	sp,sp,-32
    80007058:	00113c23          	sd	ra,24(sp)
    8000705c:	00813823          	sd	s0,16(sp)
    80007060:	00913423          	sd	s1,8(sp)
    80007064:	01213023          	sd	s2,0(sp)
    80007068:	02010413          	addi	s0,sp,32
    8000706c:	00050913          	mv	s2,a0
    80007070:	00058493          	mv	s1,a1
    kprintString("blocks["); kprintInt( index, 10); kprintString("]: ");
    80007074:	00008517          	auipc	a0,0x8
    80007078:	4ac50513          	addi	a0,a0,1196 # 8000f520 <CONSOLE_STATUS+0x510>
    8000707c:	ffffe097          	auipc	ra,0xffffe
    80007080:	028080e7          	jalr	40(ra) # 800050a4 <_Z12kprintStringPKc>
    80007084:	00000613          	li	a2,0
    80007088:	00a00593          	li	a1,10
    8000708c:	00048513          	mv	a0,s1
    80007090:	ffffe097          	auipc	ra,0xffffe
    80007094:	05c080e7          	jalr	92(ra) # 800050ec <_Z9kprintIntmib>
    80007098:	00008517          	auipc	a0,0x8
    8000709c:	49050513          	addi	a0,a0,1168 # 8000f528 <CONSOLE_STATUS+0x518>
    800070a0:	ffffe097          	auipc	ra,0xffffe
    800070a4:	004080e7          	jalr	4(ra) # 800050a4 <_Z12kprintStringPKc>
    bool bit = get_bit_val(index);
    800070a8:	00048593          	mv	a1,s1
    800070ac:	00090513          	mv	a0,s2
    800070b0:	00000097          	auipc	ra,0x0
    800070b4:	920080e7          	jalr	-1760(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    if(bit)
    800070b8:	02050663          	beqz	a0,800070e4 <_ZN5Buddy8print_beEm+0x90>
        kprintString("FREE");
    800070bc:	00008517          	auipc	a0,0x8
    800070c0:	47450513          	addi	a0,a0,1140 # 8000f530 <CONSOLE_STATUS+0x520>
    800070c4:	ffffe097          	auipc	ra,0xffffe
    800070c8:	fe0080e7          	jalr	-32(ra) # 800050a4 <_Z12kprintStringPKc>
    else
        kprintString("ALLOC");
}
    800070cc:	01813083          	ld	ra,24(sp)
    800070d0:	01013403          	ld	s0,16(sp)
    800070d4:	00813483          	ld	s1,8(sp)
    800070d8:	00013903          	ld	s2,0(sp)
    800070dc:	02010113          	addi	sp,sp,32
    800070e0:	00008067          	ret
        kprintString("ALLOC");
    800070e4:	00008517          	auipc	a0,0x8
    800070e8:	45450513          	addi	a0,a0,1108 # 8000f538 <CONSOLE_STATUS+0x528>
    800070ec:	ffffe097          	auipc	ra,0xffffe
    800070f0:	fb8080e7          	jalr	-72(ra) # 800050a4 <_Z12kprintStringPKc>
}
    800070f4:	fd9ff06f          	j	800070cc <_ZN5Buddy8print_beEm+0x78>

00000000800070f8 <_ZN5Buddy12status_printEb>:

void Buddy::status_print(bool f){
    800070f8:	fd010113          	addi	sp,sp,-48
    800070fc:	02113423          	sd	ra,40(sp)
    80007100:	02813023          	sd	s0,32(sp)
    80007104:	00913c23          	sd	s1,24(sp)
    80007108:	01213823          	sd	s2,16(sp)
    8000710c:	01313423          	sd	s3,8(sp)
    80007110:	01413023          	sd	s4,0(sp)
    80007114:	03010413          	addi	s0,sp,48
    if(!buddy){
    80007118:	0000e797          	auipc	a5,0xe
    8000711c:	2b078793          	addi	a5,a5,688 # 800153c8 <_ZN5Buddy5buddyE>
    80007120:	0007b783          	ld	a5,0(a5)
    80007124:	0c078c63          	beqz	a5,800071fc <_ZN5Buddy12status_printEb+0x104>
    80007128:	00050993          	mv	s3,a0
    8000712c:	00058a13          	mv	s4,a1
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    80007130:	00008517          	auipc	a0,0x8
    80007134:	42850513          	addi	a0,a0,1064 # 8000f558 <CONSOLE_STATUS+0x548>
    80007138:	ffffe097          	auipc	ra,0xffffe
    8000713c:	f6c080e7          	jalr	-148(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    80007140:	00008517          	auipc	a0,0x8
    80007144:	43850513          	addi	a0,a0,1080 # 8000f578 <CONSOLE_STATUS+0x568>
    80007148:	ffffe097          	auipc	ra,0xffffe
    8000714c:	f5c080e7          	jalr	-164(ra) # 800050a4 <_Z12kprintStringPKc>
    80007150:	00000613          	li	a2,0
    80007154:	01000593          	li	a1,16
    80007158:	0000e797          	auipc	a5,0xe
    8000715c:	27078793          	addi	a5,a5,624 # 800153c8 <_ZN5Buddy5buddyE>
    80007160:	0007b503          	ld	a0,0(a5)
    80007164:	ffffe097          	auipc	ra,0xffffe
    80007168:	f88080e7          	jalr	-120(ra) # 800050ec <_Z9kprintIntmib>
    8000716c:	00008517          	auipc	a0,0x8
    80007170:	1ec50513          	addi	a0,a0,492 # 8000f358 <CONSOLE_STATUS+0x348>
    80007174:	ffffe097          	auipc	ra,0xffffe
    80007178:	f30080e7          	jalr	-208(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    8000717c:	00008517          	auipc	a0,0x8
    80007180:	40450513          	addi	a0,a0,1028 # 8000f580 <CONSOLE_STATUS+0x570>
    80007184:	ffffe097          	auipc	ra,0xffffe
    80007188:	f20080e7          	jalr	-224(ra) # 800050a4 <_Z12kprintStringPKc>
    8000718c:	00000613          	li	a2,0
    80007190:	01000593          	li	a1,16
    80007194:	0009b503          	ld	a0,0(s3)
    80007198:	ffffe097          	auipc	ra,0xffffe
    8000719c:	f54080e7          	jalr	-172(ra) # 800050ec <_Z9kprintIntmib>
    800071a0:	00008517          	auipc	a0,0x8
    800071a4:	1b850513          	addi	a0,a0,440 # 8000f358 <CONSOLE_STATUS+0x348>
    800071a8:	ffffe097          	auipc	ra,0xffffe
    800071ac:	efc080e7          	jalr	-260(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(max_level);
    800071b0:	00008517          	auipc	a0,0x8
    800071b4:	3e050513          	addi	a0,a0,992 # 8000f590 <CONSOLE_STATUS+0x580>
    800071b8:	ffffe097          	auipc	ra,0xffffe
    800071bc:	eec080e7          	jalr	-276(ra) # 800050a4 <_Z12kprintStringPKc>
    800071c0:	00000613          	li	a2,0
    800071c4:	01000593          	li	a1,16
    800071c8:	0089b503          	ld	a0,8(s3)
    800071cc:	ffffe097          	auipc	ra,0xffffe
    800071d0:	f20080e7          	jalr	-224(ra) # 800050ec <_Z9kprintIntmib>
    800071d4:	00008517          	auipc	a0,0x8
    800071d8:	18450513          	addi	a0,a0,388 # 8000f358 <CONSOLE_STATUS+0x348>
    800071dc:	ffffe097          	auipc	ra,0xffffe
    800071e0:	ec8080e7          	jalr	-312(ra) # 800050a4 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    800071e4:	00008517          	auipc	a0,0x8
    800071e8:	3bc50513          	addi	a0,a0,956 # 8000f5a0 <CONSOLE_STATUS+0x590>
    800071ec:	ffffe097          	auipc	ra,0xffffe
    800071f0:	eb8080e7          	jalr	-328(ra) # 800050a4 <_Z12kprintStringPKc>
    for(uchar i = 0; i <= max_level; i++){
    800071f4:	00000913          	li	s2,0
    800071f8:	0680006f          	j	80007260 <_ZN5Buddy12status_printEb+0x168>
        kprintString("BUDDY NOT INITALIZED!!!");
    800071fc:	00008517          	auipc	a0,0x8
    80007200:	34450513          	addi	a0,a0,836 # 8000f540 <CONSOLE_STATUS+0x530>
    80007204:	ffffe097          	auipc	ra,0xffffe
    80007208:	ea0080e7          	jalr	-352(ra) # 800050a4 <_Z12kprintStringPKc>
        return;
    8000720c:	18c0006f          	j	80007398 <_ZN5Buddy12status_printEb+0x2a0>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
        kprintString("\t");
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
            kprintInt((uint64)curr, 16);
            if(curr->next)
                kprintString(" -> ");
    80007210:	00008517          	auipc	a0,0x8
    80007214:	3c050513          	addi	a0,a0,960 # 8000f5d0 <CONSOLE_STATUS+0x5c0>
    80007218:	ffffe097          	auipc	ra,0xffffe
    8000721c:	e8c080e7          	jalr	-372(ra) # 800050a4 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    80007220:	0004b483          	ld	s1,0(s1)
    80007224:	02048263          	beqz	s1,80007248 <_ZN5Buddy12status_printEb+0x150>
            kprintInt((uint64)curr, 16);
    80007228:	00000613          	li	a2,0
    8000722c:	01000593          	li	a1,16
    80007230:	00048513          	mv	a0,s1
    80007234:	ffffe097          	auipc	ra,0xffffe
    80007238:	eb8080e7          	jalr	-328(ra) # 800050ec <_Z9kprintIntmib>
            if(curr->next)
    8000723c:	0004b783          	ld	a5,0(s1)
    80007240:	fc0798e3          	bnez	a5,80007210 <_ZN5Buddy12status_printEb+0x118>
    80007244:	fddff06f          	j	80007220 <_ZN5Buddy12status_printEb+0x128>
        }
        kprintString("\n");
    80007248:	00008517          	auipc	a0,0x8
    8000724c:	11050513          	addi	a0,a0,272 # 8000f358 <CONSOLE_STATUS+0x348>
    80007250:	ffffe097          	auipc	ra,0xffffe
    80007254:	e54080e7          	jalr	-428(ra) # 800050a4 <_Z12kprintStringPKc>
    for(uchar i = 0; i <= max_level; i++){
    80007258:	0019091b          	addiw	s2,s2,1
    8000725c:	0ff97913          	andi	s2,s2,255
    80007260:	0089b783          	ld	a5,8(s3)
    80007264:	0927ee63          	bltu	a5,s2,80007300 <_ZN5Buddy12status_printEb+0x208>
        kprintString("\t"); KPRINTARR(LEVEL, i, (lhp[i] != 0));
    80007268:	00008517          	auipc	a0,0x8
    8000726c:	35850513          	addi	a0,a0,856 # 8000f5c0 <CONSOLE_STATUS+0x5b0>
    80007270:	ffffe097          	auipc	ra,0xffffe
    80007274:	e34080e7          	jalr	-460(ra) # 800050a4 <_Z12kprintStringPKc>
    80007278:	00008517          	auipc	a0,0x8
    8000727c:	35050513          	addi	a0,a0,848 # 8000f5c8 <CONSOLE_STATUS+0x5b8>
    80007280:	ffffe097          	auipc	ra,0xffffe
    80007284:	e24080e7          	jalr	-476(ra) # 800050a4 <_Z12kprintStringPKc>
    80007288:	00000613          	li	a2,0
    8000728c:	00a00593          	li	a1,10
    80007290:	00090513          	mv	a0,s2
    80007294:	ffffe097          	auipc	ra,0xffffe
    80007298:	e58080e7          	jalr	-424(ra) # 800050ec <_Z9kprintIntmib>
    8000729c:	00008517          	auipc	a0,0x8
    800072a0:	28c50513          	addi	a0,a0,652 # 8000f528 <CONSOLE_STATUS+0x518>
    800072a4:	ffffe097          	auipc	ra,0xffffe
    800072a8:	e00080e7          	jalr	-512(ra) # 800050a4 <_Z12kprintStringPKc>
    800072ac:	0109b783          	ld	a5,16(s3)
    800072b0:	00391493          	slli	s1,s2,0x3
    800072b4:	009787b3          	add	a5,a5,s1
    800072b8:	0007b503          	ld	a0,0(a5)
    800072bc:	00000613          	li	a2,0
    800072c0:	01000593          	li	a1,16
    800072c4:	00a03533          	snez	a0,a0
    800072c8:	ffffe097          	auipc	ra,0xffffe
    800072cc:	e24080e7          	jalr	-476(ra) # 800050ec <_Z9kprintIntmib>
    800072d0:	00008517          	auipc	a0,0x8
    800072d4:	08850513          	addi	a0,a0,136 # 8000f358 <CONSOLE_STATUS+0x348>
    800072d8:	ffffe097          	auipc	ra,0xffffe
    800072dc:	dcc080e7          	jalr	-564(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintString("\t");
    800072e0:	00008517          	auipc	a0,0x8
    800072e4:	2e050513          	addi	a0,a0,736 # 8000f5c0 <CONSOLE_STATUS+0x5b0>
    800072e8:	ffffe097          	auipc	ra,0xffffe
    800072ec:	dbc080e7          	jalr	-580(ra) # 800050a4 <_Z12kprintStringPKc>
        for(mmeta_t* curr = lhp[i]; curr; curr = curr->next){
    800072f0:	0109b783          	ld	a5,16(s3)
    800072f4:	009787b3          	add	a5,a5,s1
    800072f8:	0007b483          	ld	s1,0(a5)
    800072fc:	f29ff06f          	j	80007224 <_ZN5Buddy12status_printEb+0x12c>
    }
    kprintString("\n");
    80007300:	00008517          	auipc	a0,0x8
    80007304:	05850513          	addi	a0,a0,88 # 8000f358 <CONSOLE_STATUS+0x348>
    80007308:	ffffe097          	auipc	ra,0xffffe
    8000730c:	d9c080e7          	jalr	-612(ra) # 800050a4 <_Z12kprintStringPKc>
    if(f){
    80007310:	060a0463          	beqz	s4,80007378 <_ZN5Buddy12status_printEb+0x280>
        for(size_t i = 0; i < (1ULL << max_level); i++){
    80007314:	00000493          	li	s1,0
    80007318:	0080006f          	j	80007320 <_ZN5Buddy12status_printEb+0x228>
    8000731c:	00148493          	addi	s1,s1,1
    80007320:	0089b703          	ld	a4,8(s3)
    80007324:	00100793          	li	a5,1
    80007328:	00e797b3          	sll	a5,a5,a4
    8000732c:	04f4f663          	bgeu	s1,a5,80007378 <_ZN5Buddy12status_printEb+0x280>
            if(get_bit_val(i)){
    80007330:	00048593          	mv	a1,s1
    80007334:	00098513          	mv	a0,s3
    80007338:	fffff097          	auipc	ra,0xfffff
    8000733c:	698080e7          	jalr	1688(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    80007340:	fc050ee3          	beqz	a0,8000731c <_ZN5Buddy12status_printEb+0x224>
                kprintString("\t"); print_be(i); kprintString("\n");
    80007344:	00008517          	auipc	a0,0x8
    80007348:	27c50513          	addi	a0,a0,636 # 8000f5c0 <CONSOLE_STATUS+0x5b0>
    8000734c:	ffffe097          	auipc	ra,0xffffe
    80007350:	d58080e7          	jalr	-680(ra) # 800050a4 <_Z12kprintStringPKc>
    80007354:	00048593          	mv	a1,s1
    80007358:	00098513          	mv	a0,s3
    8000735c:	00000097          	auipc	ra,0x0
    80007360:	cf8080e7          	jalr	-776(ra) # 80007054 <_ZN5Buddy8print_beEm>
    80007364:	00008517          	auipc	a0,0x8
    80007368:	ff450513          	addi	a0,a0,-12 # 8000f358 <CONSOLE_STATUS+0x348>
    8000736c:	ffffe097          	auipc	ra,0xffffe
    80007370:	d38080e7          	jalr	-712(ra) # 800050a4 <_Z12kprintStringPKc>
    80007374:	fa9ff06f          	j	8000731c <_ZN5Buddy12status_printEb+0x224>
            }
        }
    }
    kprintString("\t----END MEMORY META----\n");
    80007378:	00008517          	auipc	a0,0x8
    8000737c:	26050513          	addi	a0,a0,608 # 8000f5d8 <CONSOLE_STATUS+0x5c8>
    80007380:	ffffe097          	auipc	ra,0xffffe
    80007384:	d24080e7          	jalr	-732(ra) # 800050a4 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    80007388:	00008517          	auipc	a0,0x8
    8000738c:	27050513          	addi	a0,a0,624 # 8000f5f8 <CONSOLE_STATUS+0x5e8>
    80007390:	ffffe097          	auipc	ra,0xffffe
    80007394:	d14080e7          	jalr	-748(ra) # 800050a4 <_Z12kprintStringPKc>

    80007398:	02813083          	ld	ra,40(sp)
    8000739c:	02013403          	ld	s0,32(sp)
    800073a0:	01813483          	ld	s1,24(sp)
    800073a4:	01013903          	ld	s2,16(sp)
    800073a8:	00813983          	ld	s3,8(sp)
    800073ac:	00013a03          	ld	s4,0(sp)
    800073b0:	03010113          	addi	sp,sp,48
    800073b4:	00008067          	ret

00000000800073b8 <_ZN5Buddy8merge_ipEP7mmeta_t>:
mmeta_t* Buddy::merge_ip(mmeta_t* chunk){
    800073b8:	fa010113          	addi	sp,sp,-96
    800073bc:	04113c23          	sd	ra,88(sp)
    800073c0:	04813823          	sd	s0,80(sp)
    800073c4:	04913423          	sd	s1,72(sp)
    800073c8:	05213023          	sd	s2,64(sp)
    800073cc:	03313c23          	sd	s3,56(sp)
    800073d0:	03413823          	sd	s4,48(sp)
    800073d4:	06010413          	addi	s0,sp,96
    800073d8:	00050913          	mv	s2,a0
    800073dc:	fab43423          	sd	a1,-88(s0)
    size_t bi = BLOCK_IND(chunk);
    800073e0:	00053783          	ld	a5,0(a0)
    800073e4:	40f587b3          	sub	a5,a1,a5
    800073e8:	0000ea17          	auipc	s4,0xe
    800073ec:	fd8a4a03          	lbu	s4,-40(s4) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    800073f0:	0147d7b3          	srl	a5,a5,s4
    800073f4:	fcf43423          	sd	a5,-56(s0)
    budd_bi = bi ^ (1ULL << chunk->level);
    800073f8:	0105c983          	lbu	s3,16(a1)
    800073fc:	00100493          	li	s1,1
    80007400:	013494b3          	sll	s1,s1,s3
    80007404:	0097c4b3          	xor	s1,a5,s1
    80007408:	fc943023          	sd	s1,-64(s0)
    if(!get_bit_val(bi)) return nullptr;
    8000740c:	00078593          	mv	a1,a5
    80007410:	fffff097          	auipc	ra,0xfffff
    80007414:	5c0080e7          	jalr	1472(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    80007418:	0a050663          	beqz	a0,800074c4 <_ZN5Buddy8merge_ipEP7mmeta_t+0x10c>
    mmeta_t* budd_addr = (mmeta_t*)((budd_bi << BLOCK_SIZE_BIT_LEN) + (size_t)start_address);
    8000741c:	014494b3          	sll	s1,s1,s4
    80007420:	00093603          	ld	a2,0(s2)
    80007424:	00960633          	add	a2,a2,s1
    80007428:	fac43c23          	sd	a2,-72(s0)
    if(budd_addr->level != chunk->level) return nullptr;
    8000742c:	01064583          	lbu	a1,16(a2)
    80007430:	08b99e63          	bne	s3,a1,800074cc <_ZN5Buddy8merge_ipEP7mmeta_t+0x114>
    int code = remove_from_list(budd_addr->level, budd_addr);    
    80007434:	00090513          	mv	a0,s2
    80007438:	00000097          	auipc	ra,0x0
    8000743c:	8c0080e7          	jalr	-1856(ra) # 80006cf8 <_ZN5Buddy16remove_from_listEhP7mmeta_t>
    if(code < 0) return nullptr;
    80007440:	08054a63          	bltz	a0,800074d4 <_ZN5Buddy8merge_ipEP7mmeta_t+0x11c>
    if(budd_bi < bi){
    80007444:	fc043703          	ld	a4,-64(s0)
    80007448:	fc843783          	ld	a5,-56(s0)
    8000744c:	04f76a63          	bltu	a4,a5,800074a0 <_ZN5Buddy8merge_ipEP7mmeta_t+0xe8>
    clr_bit(budd_bi);
    80007450:	fc043583          	ld	a1,-64(s0)
    80007454:	00090513          	mv	a0,s2
    80007458:	00000097          	auipc	ra,0x0
    8000745c:	9dc080e7          	jalr	-1572(ra) # 80006e34 <_ZN5Buddy7clr_bitEm>
    set_bit(bi);
    80007460:	fc843583          	ld	a1,-56(s0)
    80007464:	00090513          	mv	a0,s2
    80007468:	00000097          	auipc	ra,0x0
    8000746c:	990080e7          	jalr	-1648(ra) # 80006df8 <_ZN5Buddy7set_bitEm>
    chunk->level = chunk->level + 1;
    80007470:	fa843503          	ld	a0,-88(s0)
    80007474:	01054783          	lbu	a5,16(a0)
    80007478:	0017879b          	addiw	a5,a5,1
    8000747c:	00f50823          	sb	a5,16(a0)
}
    80007480:	05813083          	ld	ra,88(sp)
    80007484:	05013403          	ld	s0,80(sp)
    80007488:	04813483          	ld	s1,72(sp)
    8000748c:	04013903          	ld	s2,64(sp)
    80007490:	03813983          	ld	s3,56(sp)
    80007494:	03013a03          	ld	s4,48(sp)
    80007498:	06010113          	addi	sp,sp,96
    8000749c:	00008067          	ret
        swap(bi, budd_bi);
    800074a0:	fc040593          	addi	a1,s0,-64
    800074a4:	fc840513          	addi	a0,s0,-56
    800074a8:	00000097          	auipc	ra,0x0
    800074ac:	150080e7          	jalr	336(ra) # 800075f8 <_Z4swapImEvRT_S1_>
        swap(chunk, budd_addr);
    800074b0:	fb840593          	addi	a1,s0,-72
    800074b4:	fa840513          	addi	a0,s0,-88
    800074b8:	00000097          	auipc	ra,0x0
    800074bc:	168080e7          	jalr	360(ra) # 80007620 <_Z4swapIP7mmeta_tEvRT_S3_>
    800074c0:	f91ff06f          	j	80007450 <_ZN5Buddy8merge_ipEP7mmeta_t+0x98>
    if(!get_bit_val(bi)) return nullptr;
    800074c4:	00000513          	li	a0,0
    800074c8:	fb9ff06f          	j	80007480 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>
    if(budd_addr->level != chunk->level) return nullptr;
    800074cc:	00000513          	li	a0,0
    800074d0:	fb1ff06f          	j	80007480 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>
    if(code < 0) return nullptr;
    800074d4:	00000513          	li	a0,0
    800074d8:	fa9ff06f          	j	80007480 <_ZN5Buddy8merge_ipEP7mmeta_t+0xc8>

00000000800074dc <_ZN5Buddy8mem_freeEPvh>:
    if(( (uint64)addr & (BLOCK_SIZE - 1) )
    800074dc:	000017b7          	lui	a5,0x1
    800074e0:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800074e4:	00f5f7b3          	and	a5,a1,a5
    800074e8:	0e079463          	bnez	a5,800075d0 <_ZN5Buddy8mem_freeEPvh+0xf4>
int Buddy::mem_free(void* addr, uchar level){
    800074ec:	fd010113          	addi	sp,sp,-48
    800074f0:	02113423          	sd	ra,40(sp)
    800074f4:	02813023          	sd	s0,32(sp)
    800074f8:	00913c23          	sd	s1,24(sp)
    800074fc:	01213823          	sd	s2,16(sp)
    80007500:	01313423          	sd	s3,8(sp)
    80007504:	01413023          	sd	s4,0(sp)
    80007508:	03010413          	addi	s0,sp,48
    8000750c:	00050913          	mv	s2,a0
    80007510:	00058493          	mv	s1,a1
    80007514:	00060a13          	mv	s4,a2
    || addr < start_address) return -1;
    80007518:	00053703          	ld	a4,0(a0)
    8000751c:	0ae5ee63          	bltu	a1,a4,800075d8 <_ZN5Buddy8mem_freeEPvh+0xfc>
    if(level > max_level) return -4;
    80007520:	00853683          	ld	a3,8(a0)
    80007524:	0ac6ee63          	bltu	a3,a2,800075e0 <_ZN5Buddy8mem_freeEPvh+0x104>
    uint64 bind = BLOCK_IND(addr);
    80007528:	40e589b3          	sub	s3,a1,a4
    8000752c:	0000e797          	auipc	a5,0xe
    80007530:	e947c783          	lbu	a5,-364(a5) # 800153c0 <_ZN5Buddy18BLOCK_SIZE_BIT_LENE>
    80007534:	00f9d9b3          	srl	s3,s3,a5
    if(bind >= (1ULL << max_level)) return -3;
    80007538:	00100793          	li	a5,1
    8000753c:	00d797b3          	sll	a5,a5,a3
    80007540:	0af9f463          	bgeu	s3,a5,800075e8 <_ZN5Buddy8mem_freeEPvh+0x10c>
    if(get_bit_val(bind)) return -2;
    80007544:	00098593          	mv	a1,s3
    80007548:	fffff097          	auipc	ra,0xfffff
    8000754c:	488080e7          	jalr	1160(ra) # 800069d0 <_ZN5Buddy11get_bit_valEm>
    80007550:	0a051063          	bnez	a0,800075f0 <_ZN5Buddy8mem_freeEPvh+0x114>
    chunk->level = level;
    80007554:	01448823          	sb	s4,16(s1)
    chunk->prev = chunk->next = nullptr;
    80007558:	0004b023          	sd	zero,0(s1)
    8000755c:	0004b423          	sd	zero,8(s1)
    set_bit(bind);
    80007560:	00098593          	mv	a1,s3
    80007564:	00090513          	mv	a0,s2
    80007568:	00000097          	auipc	ra,0x0
    8000756c:	890080e7          	jalr	-1904(ra) # 80006df8 <_ZN5Buddy7set_bitEm>
    80007570:	0080006f          	j	80007578 <_ZN5Buddy8mem_freeEPvh+0x9c>
            chunk = maddr;
    80007574:	00050493          	mv	s1,a0
    while(chunk->level < max_level){
    80007578:	0104c703          	lbu	a4,16(s1)
    8000757c:	00893783          	ld	a5,8(s2)
    80007580:	00f77c63          	bgeu	a4,a5,80007598 <_ZN5Buddy8mem_freeEPvh+0xbc>
        mmeta_t* maddr = merge_ip(chunk);
    80007584:	00048593          	mv	a1,s1
    80007588:	00090513          	mv	a0,s2
    8000758c:	00000097          	auipc	ra,0x0
    80007590:	e2c080e7          	jalr	-468(ra) # 800073b8 <_ZN5Buddy8merge_ipEP7mmeta_t>
        if(maddr)
    80007594:	fe0510e3          	bnez	a0,80007574 <_ZN5Buddy8mem_freeEPvh+0x98>
    add_to_list(chunk->level, chunk);
    80007598:	00048613          	mv	a2,s1
    8000759c:	0104c583          	lbu	a1,16(s1)
    800075a0:	00090513          	mv	a0,s2
    800075a4:	fffff097          	auipc	ra,0xfffff
    800075a8:	460080e7          	jalr	1120(ra) # 80006a04 <_ZN5Buddy11add_to_listEhP7mmeta_t>
    return 0;
    800075ac:	00000513          	li	a0,0
}
    800075b0:	02813083          	ld	ra,40(sp)
    800075b4:	02013403          	ld	s0,32(sp)
    800075b8:	01813483          	ld	s1,24(sp)
    800075bc:	01013903          	ld	s2,16(sp)
    800075c0:	00813983          	ld	s3,8(sp)
    800075c4:	00013a03          	ld	s4,0(sp)
    800075c8:	03010113          	addi	sp,sp,48
    800075cc:	00008067          	ret
    || addr < start_address) return -1;
    800075d0:	fff00513          	li	a0,-1
}
    800075d4:	00008067          	ret
    || addr < start_address) return -1;
    800075d8:	fff00513          	li	a0,-1
    800075dc:	fd5ff06f          	j	800075b0 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(level > max_level) return -4;
    800075e0:	ffc00513          	li	a0,-4
    800075e4:	fcdff06f          	j	800075b0 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(bind >= (1ULL << max_level)) return -3;
    800075e8:	ffd00513          	li	a0,-3
    800075ec:	fc5ff06f          	j	800075b0 <_ZN5Buddy8mem_freeEPvh+0xd4>
    if(get_bit_val(bind)) return -2;
    800075f0:	ffe00513          	li	a0,-2
    800075f4:	fbdff06f          	j	800075b0 <_ZN5Buddy8mem_freeEPvh+0xd4>

00000000800075f8 <_Z4swapImEvRT_S1_>:
/* one or less set bits */
bool osb(uint64);

/* classic swap */
template<typename T>
void swap(T& a, T& b){
    800075f8:	ff010113          	addi	sp,sp,-16
    800075fc:	00813423          	sd	s0,8(sp)
    80007600:	01010413          	addi	s0,sp,16
    T x = a;
    80007604:	00053783          	ld	a5,0(a0)
    a = b;
    80007608:	0005b703          	ld	a4,0(a1)
    8000760c:	00e53023          	sd	a4,0(a0)
    b = x;
    80007610:	00f5b023          	sd	a5,0(a1)
}
    80007614:	00813403          	ld	s0,8(sp)
    80007618:	01010113          	addi	sp,sp,16
    8000761c:	00008067          	ret

0000000080007620 <_Z4swapIP7mmeta_tEvRT_S3_>:
void swap(T& a, T& b){
    80007620:	ff010113          	addi	sp,sp,-16
    80007624:	00813423          	sd	s0,8(sp)
    80007628:	01010413          	addi	s0,sp,16
    T x = a;
    8000762c:	00053783          	ld	a5,0(a0)
    a = b;
    80007630:	0005b703          	ld	a4,0(a1)
    80007634:	00e53023          	sd	a4,0(a0)
    b = x;
    80007638:	00f5b023          	sd	a5,0(a1)
}
    8000763c:	00813403          	ld	s0,8(sp)
    80007640:	01010113          	addi	sp,sp,16
    80007644:	00008067          	ret

0000000080007648 <_ZN15MemoryAllocator11getInstanceEv>:
#include"../../../h/kernel_lib.h"

MemoryAllocator* MemoryAllocator::allocator = nullptr;

MemoryAllocator& MemoryAllocator::getInstance(){
    if(!allocator){
    80007648:	0000e797          	auipc	a5,0xe
    8000764c:	d8878793          	addi	a5,a5,-632 # 800153d0 <_ZN15MemoryAllocator9allocatorE>
    80007650:	0007b783          	ld	a5,0(a5)
    80007654:	00078a63          	beqz	a5,80007668 <_ZN15MemoryAllocator11getInstanceEv+0x20>
        KVALCHECKPRINT("MemoryAllocator start address: ", start_addr);
        allocator->fmem_head->addr = (void*) start_addr;
        allocator->fmem_head->size = ((size_t)HEAP_END_ADDR - start_addr);
        allocator->init = true;
    }
    return *allocator;
    80007658:	0000e797          	auipc	a5,0xe
    8000765c:	d7878793          	addi	a5,a5,-648 # 800153d0 <_ZN15MemoryAllocator9allocatorE>
    80007660:	0007b503          	ld	a0,0(a5)
}
    80007664:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance(){
    80007668:	fe010113          	addi	sp,sp,-32
    8000766c:	00113c23          	sd	ra,24(sp)
    80007670:	00813823          	sd	s0,16(sp)
    80007674:	00913423          	sd	s1,8(sp)
    80007678:	01213023          	sd	s2,0(sp)
    8000767c:	02010413          	addi	s0,sp,32
        allocator = (MemoryAllocator*)SlabAllocator::getInstance().kmalloc(sizeof(MemoryAllocator));
    80007680:	00002097          	auipc	ra,0x2
    80007684:	c94080e7          	jalr	-876(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80007688:	02000593          	li	a1,32
    8000768c:	00002097          	auipc	ra,0x2
    80007690:	d8c080e7          	jalr	-628(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
    80007694:	0000e797          	auipc	a5,0xe
    80007698:	d2a7be23          	sd	a0,-708(a5) # 800153d0 <_ZN15MemoryAllocator9allocatorE>
        allocator->node_cache = new ObjectCache("free_seg_meta_cache", sizeof(FreeSegment), 0, 0);
    8000769c:	05800513          	li	a0,88
    800076a0:	00001097          	auipc	ra,0x1
    800076a4:	4b4080e7          	jalr	1204(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    800076a8:	00050493          	mv	s1,a0
    800076ac:	02050263          	beqz	a0,800076d0 <_ZN15MemoryAllocator11getInstanceEv+0x88>
    800076b0:	00000793          	li	a5,0
    800076b4:	00000713          	li	a4,0
    800076b8:	00000693          	li	a3,0
    800076bc:	01800613          	li	a2,24
    800076c0:	00008597          	auipc	a1,0x8
    800076c4:	f5858593          	addi	a1,a1,-168 # 8000f618 <CONSOLE_STATUS+0x608>
    800076c8:	00001097          	auipc	ra,0x1
    800076cc:	940080e7          	jalr	-1728(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    800076d0:	0000e797          	auipc	a5,0xe
    800076d4:	d0078793          	addi	a5,a5,-768 # 800153d0 <_ZN15MemoryAllocator9allocatorE>
    800076d8:	0007b903          	ld	s2,0(a5)
    800076dc:	00993c23          	sd	s1,24(s2)
        if(!allocator->node_cache){ kprintString("MEM ALLOC node cache not allocated\n"); while(1); }
    800076e0:	0c048863          	beqz	s1,800077b0 <_ZN15MemoryAllocator11getInstanceEv+0x168>
        allocator->fall_head = nullptr;
    800076e4:	00093823          	sd	zero,16(s2)
        allocator->fmem_head = (FreeSegment*)allocator->node_cache->alloc_obj();
    800076e8:	00048513          	mv	a0,s1
    800076ec:	00001097          	auipc	ra,0x1
    800076f0:	3b8080e7          	jalr	952(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    800076f4:	00a93423          	sd	a0,8(s2)
        allocator->fmem_head->next = nullptr;
    800076f8:	0000e917          	auipc	s2,0xe
    800076fc:	cd890913          	addi	s2,s2,-808 # 800153d0 <_ZN15MemoryAllocator9allocatorE>
    80007700:	00093783          	ld	a5,0(s2)
    80007704:	0087b783          	ld	a5,8(a5)
    80007708:	0007b023          	sd	zero,0(a5)
    8000770c:	0000e797          	auipc	a5,0xe
    80007710:	cd478793          	addi	a5,a5,-812 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007714:	0007b483          	ld	s1,0(a5)
        size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    80007718:	fff48493          	addi	s1,s1,-1
    8000771c:	fffff7b7          	lui	a5,0xfffff
    80007720:	00f4f4b3          	and	s1,s1,a5
    80007724:	000017b7          	lui	a5,0x1
    80007728:	00f484b3          	add	s1,s1,a5
        KVALCHECKPRINT("MemoryAllocator start address: ", start_addr);
    8000772c:	00008517          	auipc	a0,0x8
    80007730:	f2c50513          	addi	a0,a0,-212 # 8000f658 <CONSOLE_STATUS+0x648>
    80007734:	ffffe097          	auipc	ra,0xffffe
    80007738:	970080e7          	jalr	-1680(ra) # 800050a4 <_Z12kprintStringPKc>
    8000773c:	00000613          	li	a2,0
    80007740:	01000593          	li	a1,16
    80007744:	00048513          	mv	a0,s1
    80007748:	ffffe097          	auipc	ra,0xffffe
    8000774c:	9a4080e7          	jalr	-1628(ra) # 800050ec <_Z9kprintIntmib>
    80007750:	00008517          	auipc	a0,0x8
    80007754:	c0850513          	addi	a0,a0,-1016 # 8000f358 <CONSOLE_STATUS+0x348>
    80007758:	ffffe097          	auipc	ra,0xffffe
    8000775c:	94c080e7          	jalr	-1716(ra) # 800050a4 <_Z12kprintStringPKc>
        allocator->fmem_head->addr = (void*) start_addr;
    80007760:	00093783          	ld	a5,0(s2)
    80007764:	0087b703          	ld	a4,8(a5) # 1008 <_entry-0x7fffeff8>
    80007768:	00973823          	sd	s1,16(a4)
        allocator->fmem_head->size = ((size_t)HEAP_END_ADDR - start_addr);
    8000776c:	0087b683          	ld	a3,8(a5)
    80007770:	0000c717          	auipc	a4,0xc
    80007774:	49070713          	addi	a4,a4,1168 # 80013c00 <HEAP_END_ADDR>
    80007778:	00073703          	ld	a4,0(a4)
    8000777c:	409704b3          	sub	s1,a4,s1
    80007780:	0096b423          	sd	s1,8(a3)
        allocator->init = true;
    80007784:	00100713          	li	a4,1
    80007788:	00e78023          	sb	a4,0(a5)
    return *allocator;
    8000778c:	0000e797          	auipc	a5,0xe
    80007790:	c4478793          	addi	a5,a5,-956 # 800153d0 <_ZN15MemoryAllocator9allocatorE>
    80007794:	0007b503          	ld	a0,0(a5)
}
    80007798:	01813083          	ld	ra,24(sp)
    8000779c:	01013403          	ld	s0,16(sp)
    800077a0:	00813483          	ld	s1,8(sp)
    800077a4:	00013903          	ld	s2,0(sp)
    800077a8:	02010113          	addi	sp,sp,32
    800077ac:	00008067          	ret
        if(!allocator->node_cache){ kprintString("MEM ALLOC node cache not allocated\n"); while(1); }
    800077b0:	00008517          	auipc	a0,0x8
    800077b4:	e8050513          	addi	a0,a0,-384 # 8000f630 <CONSOLE_STATUS+0x620>
    800077b8:	ffffe097          	auipc	ra,0xffffe
    800077bc:	8ec080e7          	jalr	-1812(ra) # 800050a4 <_Z12kprintStringPKc>
    800077c0:	0000006f          	j	800077c0 <_ZN15MemoryAllocator11getInstanceEv+0x178>
    800077c4:	00050913          	mv	s2,a0
        allocator->node_cache = new ObjectCache("free_seg_meta_cache", sizeof(FreeSegment), 0, 0);
    800077c8:	00048513          	mv	a0,s1
    800077cc:	00001097          	auipc	ra,0x1
    800077d0:	4e8080e7          	jalr	1256(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    800077d4:	00090513          	mv	a0,s2
    800077d8:	0000f097          	auipc	ra,0xf
    800077dc:	da0080e7          	jalr	-608(ra) # 80016578 <_Unwind_Resume>

00000000800077e0 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    800077e0:	fd010113          	addi	sp,sp,-48
    800077e4:	02113423          	sd	ra,40(sp)
    800077e8:	02813023          	sd	s0,32(sp)
    800077ec:	00913c23          	sd	s1,24(sp)
    800077f0:	01213823          	sd	s2,16(sp)
    800077f4:	01313423          	sd	s3,8(sp)
    800077f8:	01413023          	sd	s4,0(sp)
    800077fc:	03010413          	addi	s0,sp,48
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80007800:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    80007804:	00659913          	slli	s2,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80007808:	00000693          	li	a3,0
    8000780c:	00000a13          	li	s4,0
    80007810:	00000493          	li	s1,0
    80007814:	0140006f          	j	80007828 <_ZN15MemoryAllocator9mem_allocEm+0x48>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    80007818:	00068a13          	mv	s4,a3
                best = curr;     
    8000781c:	00078493          	mv	s1,a5
            }
        prev = curr;
    80007820:	00078693          	mv	a3,a5
        curr = curr->next;
    80007824:	0007b783          	ld	a5,0(a5)
    while(curr){
    80007828:	02078263          	beqz	a5,8000784c <_ZN15MemoryAllocator9mem_allocEm+0x6c>
        if(curr->size >= size)
    8000782c:	0087b703          	ld	a4,8(a5)
    80007830:	ff2768e3          	bltu	a4,s2,80007820 <_ZN15MemoryAllocator9mem_allocEm+0x40>
            if (!best || (curr->size < best->size)){
    80007834:	fe0482e3          	beqz	s1,80007818 <_ZN15MemoryAllocator9mem_allocEm+0x38>
    80007838:	0084b603          	ld	a2,8(s1)
    8000783c:	fec772e3          	bgeu	a4,a2,80007820 <_ZN15MemoryAllocator9mem_allocEm+0x40>
                best_prev = prev;
    80007840:	00068a13          	mv	s4,a3
                best = curr;     
    80007844:	00078493          	mv	s1,a5
    80007848:	fd9ff06f          	j	80007820 <_ZN15MemoryAllocator9mem_allocEm+0x40>
    } 
    if(!best)
    8000784c:	04048663          	beqz	s1,80007898 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    80007850:	00050993          	mv	s3,a0
    //     curr->size = best->size - size - sizeof(FreeSegment);
    //     best->size = size;
    //     if(best_prev) best_prev->next = curr;
    //     else fmem_head = curr;
    // }
    if(best->size != size){
    80007854:	0084b783          	ld	a5,8(s1)
    80007858:	07279263          	bne	a5,s2,800078bc <_ZN15MemoryAllocator9mem_allocEm+0xdc>
        curr->next = best->next;
        curr->size = best->size - size;
        curr->addr = (char*)best->addr + size;
        best->size = size;
    }
    else { curr = best->next; }
    8000785c:	0004b503          	ld	a0,0(s1)

    if(!best_prev) fmem_head = curr;
    80007860:	080a0a63          	beqz	s4,800078f4 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    else best_prev->next = curr;
    80007864:	00aa3023          	sd	a0,0(s4)
    
    best->next = fall_head;
    80007868:	0109b783          	ld	a5,16(s3)
    8000786c:	00f4b023          	sd	a5,0(s1)
    fall_head = best;
    80007870:	0099b823          	sd	s1,16(s3)
    // return (char*)best+sizeof(FreeSegment);
    // print_all_list();
    // print_list();
    Pager::getInstance().id_map(best->addr, (char*)best->addr+best->size, (PMTEntryBits)
    80007874:	00004097          	auipc	ra,0x4
    80007878:	e6c080e7          	jalr	-404(ra) # 8000b6e0 <_ZN5Pager11getInstanceEv>
    8000787c:	0104b583          	ld	a1,16(s1)
    80007880:	0084b603          	ld	a2,8(s1)
    80007884:	01600693          	li	a3,22
    80007888:	00c58633          	add	a2,a1,a2
    8000788c:	00004097          	auipc	ra,0x4
    80007890:	fec080e7          	jalr	-20(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
        (PMTEntryBits::user | PMTEntryBits::read | PMTEntryBits::write));
    return best->addr;
    80007894:	0104b483          	ld	s1,16(s1)
}
    80007898:	00048513          	mv	a0,s1
    8000789c:	02813083          	ld	ra,40(sp)
    800078a0:	02013403          	ld	s0,32(sp)
    800078a4:	01813483          	ld	s1,24(sp)
    800078a8:	01013903          	ld	s2,16(sp)
    800078ac:	00813983          	ld	s3,8(sp)
    800078b0:	00013a03          	ld	s4,0(sp)
    800078b4:	03010113          	addi	sp,sp,48
    800078b8:	00008067          	ret
        curr = (FreeSegment*)node_cache->alloc_obj();
    800078bc:	01853503          	ld	a0,24(a0)
    800078c0:	00001097          	auipc	ra,0x1
    800078c4:	1e4080e7          	jalr	484(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
        if(!curr) return nullptr;
    800078c8:	02050a63          	beqz	a0,800078fc <_ZN15MemoryAllocator9mem_allocEm+0x11c>
        curr->next = best->next;
    800078cc:	0004b783          	ld	a5,0(s1)
    800078d0:	00f53023          	sd	a5,0(a0)
        curr->size = best->size - size;
    800078d4:	0084b783          	ld	a5,8(s1)
    800078d8:	412787b3          	sub	a5,a5,s2
    800078dc:	00f53423          	sd	a5,8(a0)
        curr->addr = (char*)best->addr + size;
    800078e0:	0104b783          	ld	a5,16(s1)
    800078e4:	012787b3          	add	a5,a5,s2
    800078e8:	00f53823          	sd	a5,16(a0)
        best->size = size;
    800078ec:	0124b423          	sd	s2,8(s1)
    800078f0:	f71ff06f          	j	80007860 <_ZN15MemoryAllocator9mem_allocEm+0x80>
    if(!best_prev) fmem_head = curr;
    800078f4:	00a9b423          	sd	a0,8(s3)
    800078f8:	f71ff06f          	j	80007868 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        if(!curr) return nullptr;
    800078fc:	00050493          	mv	s1,a0
    80007900:	f99ff06f          	j	80007898 <_ZN15MemoryAllocator9mem_allocEm+0xb8>

0000000080007904 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    80007904:	ff010113          	addi	sp,sp,-16
    80007908:	00813423          	sd	s0,8(sp)
    8000790c:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80007910:	0000c797          	auipc	a5,0xc
    80007914:	2f878793          	addi	a5,a5,760 # 80013c08 <HEAP_START_ADDR>
    80007918:	0007b783          	ld	a5,0(a5)
    8000791c:	04f5ee63          	bltu	a1,a5,80007978 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80007920:	0000c797          	auipc	a5,0xc
    80007924:	2e078793          	addi	a5,a5,736 # 80013c00 <HEAP_END_ADDR>
    80007928:	0007b783          	ld	a5,0(a5)
    8000792c:	04f5fe63          	bgeu	a1,a5,80007988 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    80007930:	01053783          	ld	a5,16(a0)
    80007934:	00000693          	li	a3,0
    while(cur)
    80007938:	00078c63          	beqz	a5,80007950 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
    8000793c:	0107b703          	ld	a4,16(a5)
    80007940:	00b70863          	beq	a4,a1,80007950 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;    
        prev = cur;
    80007944:	00078693          	mv	a3,a5
        cur = cur->next;
    80007948:	0007b783          	ld	a5,0(a5)
    while(cur)
    8000794c:	fedff06f          	j	80007938 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    80007950:	04078063          	beqz	a5,80007990 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    80007954:	00068c63          	beqz	a3,8000796c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    80007958:	0007b703          	ld	a4,0(a5)
    8000795c:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    80007960:	0007b023          	sd	zero,0(a5)
        return false;
    80007964:	00000513          	li	a0,0
    80007968:	0140006f          	j	8000797c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    8000796c:	0007b703          	ld	a4,0(a5)
    80007970:	00e53823          	sd	a4,16(a0)
    80007974:	fedff06f          	j	80007960 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    80007978:	00100513          	li	a0,1
    }
    else return true;
}
    8000797c:	00813403          	ld	s0,8(sp)
    80007980:	01010113          	addi	sp,sp,16
    80007984:	00008067          	ret
        return true;
    80007988:	00100513          	li	a0,1
    8000798c:	ff1ff06f          	j	8000797c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    80007990:	00100513          	li	a0,1
    80007994:	fe9ff06f          	j	8000797c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

0000000080007998 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv>:

FreeSegment* MemoryAllocator::getAndRemoveFreeSegmentMeta(void* adr){
    80007998:	ff010113          	addi	sp,sp,-16
    8000799c:	00813423          	sd	s0,8(sp)
    800079a0:	01010413          	addi	s0,sp,16
    800079a4:	0000e797          	auipc	a5,0xe
    800079a8:	a3c78793          	addi	a5,a5,-1476 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    800079ac:	0007b783          	ld	a5,0(a5)
    size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    800079b0:	fff78793          	addi	a5,a5,-1
    800079b4:	fffff737          	lui	a4,0xfffff
    800079b8:	00e7f7b3          	and	a5,a5,a4
    800079bc:	00001737          	lui	a4,0x1
    800079c0:	00e787b3          	add	a5,a5,a4
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
    800079c4:	06f5e263          	bltu	a1,a5,80007a28 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x90>
    800079c8:	0000c797          	auipc	a5,0xc
    800079cc:	23878793          	addi	a5,a5,568 # 80013c00 <HEAP_END_ADDR>
    800079d0:	0007b783          	ld	a5,0(a5)
    800079d4:	04f5fe63          	bgeu	a1,a5,80007a30 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x98>
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    800079d8:	01053783          	ld	a5,16(a0)
    800079dc:	00000693          	li	a3,0
    while(cur)
    800079e0:	00078c63          	beqz	a5,800079f8 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x60>
    {
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t == (size_t)cur->addr)
    800079e4:	0107b703          	ld	a4,16(a5)
    800079e8:	00b70863          	beq	a4,a1,800079f8 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x60>
            break;    
        prev = cur;
    800079ec:	00078693          	mv	a3,a5
        cur = cur->next;
    800079f0:	0007b783          	ld	a5,0(a5)
    while(cur)
    800079f4:	fedff06f          	j	800079e0 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x48>
    }
    if(cur)
    800079f8:	00078a63          	beqz	a5,80007a0c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>
    {
        if(prev)
    800079fc:	02068063          	beqz	a3,80007a1c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x84>
            prev->next = cur->next;
    80007a00:	0007b703          	ld	a4,0(a5)
    80007a04:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    80007a08:	0007b023          	sd	zero,0(a5)
        return cur;
    }
    else return nullptr;
}
    80007a0c:	00078513          	mv	a0,a5
    80007a10:	00813403          	ld	s0,8(sp)
    80007a14:	01010113          	addi	sp,sp,16
    80007a18:	00008067          	ret
            fall_head = cur->next;
    80007a1c:	0007b703          	ld	a4,0(a5)
    80007a20:	00e53823          	sd	a4,16(a0)
    80007a24:	fe5ff06f          	j	80007a08 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x70>
        return nullptr;
    80007a28:	00000793          	li	a5,0
    80007a2c:	fe1ff06f          	j	80007a0c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>
    80007a30:	00000793          	li	a5,0
    80007a34:	fd9ff06f          	j	80007a0c <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv+0x74>

0000000080007a38 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:
    // if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    //     t->size += t->next->size + sizeof(FreeSegment);
    //     t->next = t->next->next;
    //     return t;
    // }
    if((char*)t->addr + t->size == (char*)t->next->addr){
    80007a38:	0105b783          	ld	a5,16(a1)
    80007a3c:	0085b683          	ld	a3,8(a1)
    80007a40:	00d787b3          	add	a5,a5,a3
    80007a44:	0005b703          	ld	a4,0(a1)
    80007a48:	01073603          	ld	a2,16(a4) # 1010 <_entry-0x7fffeff0>
    80007a4c:	00c78663          	beq	a5,a2,80007a58 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>
        t->next = t->next->next;
        node_cache->free_obj(old);
        return t;
    }
    return t->next;
}
    80007a50:	00070513          	mv	a0,a4
    80007a54:	00008067          	ret
FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    80007a58:	fe010113          	addi	sp,sp,-32
    80007a5c:	00113c23          	sd	ra,24(sp)
    80007a60:	00813823          	sd	s0,16(sp)
    80007a64:	00913423          	sd	s1,8(sp)
    80007a68:	02010413          	addi	s0,sp,32
    80007a6c:	00058493          	mv	s1,a1
        t->size += t->next->size;
    80007a70:	00873783          	ld	a5,8(a4)
    80007a74:	00f686b3          	add	a3,a3,a5
    80007a78:	00d5b423          	sd	a3,8(a1)
        t->next = t->next->next;
    80007a7c:	00073783          	ld	a5,0(a4)
    80007a80:	00f5b023          	sd	a5,0(a1)
        node_cache->free_obj(old);
    80007a84:	00070593          	mv	a1,a4
    80007a88:	01853503          	ld	a0,24(a0)
    80007a8c:	00001097          	auipc	ra,0x1
    80007a90:	0f8080e7          	jalr	248(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
}
    80007a94:	00048513          	mv	a0,s1
    80007a98:	01813083          	ld	ra,24(sp)
    80007a9c:	01013403          	ld	s0,16(sp)
    80007aa0:	00813483          	ld	s1,8(sp)
    80007aa4:	02010113          	addi	sp,sp,32
    80007aa8:	00008067          	ret

0000000080007aac <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80007aac:	fc010113          	addi	sp,sp,-64
    80007ab0:	02113c23          	sd	ra,56(sp)
    80007ab4:	02813823          	sd	s0,48(sp)
    80007ab8:	02913423          	sd	s1,40(sp)
    80007abc:	03213023          	sd	s2,32(sp)
    80007ac0:	01313c23          	sd	s3,24(sp)
    80007ac4:	01413823          	sd	s4,16(sp)
    80007ac8:	04010413          	addi	s0,sp,64
    80007acc:	00050a13          	mv	s4,a0
    80007ad0:	00058913          	mv	s2,a1
    // if(wantToFreeAddress(adr)) return -1;
    FreeSegment* newsgm = getAndRemoveFreeSegmentMeta(adr);
    80007ad4:	00000097          	auipc	ra,0x0
    80007ad8:	ec4080e7          	jalr	-316(ra) # 80007998 <_ZN15MemoryAllocator27getAndRemoveFreeSegmentMetaEPv>
    if(!newsgm){
    80007adc:	00050c63          	beqz	a0,80007af4 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
    80007ae0:	00050993          	mv	s3,a0
        KCHECKPRINT(adr);
        KCHECKPRINT(Riscv::r_sepc());
        return -1;
    }
    
    if(!fmem_head)
    80007ae4:	008a3783          	ld	a5,8(s4)
    80007ae8:	08078a63          	beqz	a5,80007b7c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        // fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
        fmem_head = newsgm;
    else{
        FreeSegment/* * newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)),*/ *prev,* cur;
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80007aec:	00000493          	li	s1,0
    80007af0:	0a80006f          	j	80007b98 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
        kprintString("MEM_ALLOC_FREEE GRESKA\n"); 
    80007af4:	00008517          	auipc	a0,0x8
    80007af8:	b8c50513          	addi	a0,a0,-1140 # 8000f680 <CONSOLE_STATUS+0x670>
    80007afc:	ffffd097          	auipc	ra,0xffffd
    80007b00:	5a8080e7          	jalr	1448(ra) # 800050a4 <_Z12kprintStringPKc>
        KCHECKPRINT(adr);
    80007b04:	00008517          	auipc	a0,0x8
    80007b08:	b9450513          	addi	a0,a0,-1132 # 8000f698 <CONSOLE_STATUS+0x688>
    80007b0c:	ffffd097          	auipc	ra,0xffffd
    80007b10:	598080e7          	jalr	1432(ra) # 800050a4 <_Z12kprintStringPKc>
    80007b14:	00000613          	li	a2,0
    80007b18:	01000593          	li	a1,16
    80007b1c:	00090513          	mv	a0,s2
    80007b20:	ffffd097          	auipc	ra,0xffffd
    80007b24:	5cc080e7          	jalr	1484(ra) # 800050ec <_Z9kprintIntmib>
    80007b28:	00008517          	auipc	a0,0x8
    80007b2c:	83050513          	addi	a0,a0,-2000 # 8000f358 <CONSOLE_STATUS+0x348>
    80007b30:	ffffd097          	auipc	ra,0xffffd
    80007b34:	574080e7          	jalr	1396(ra) # 800050a4 <_Z12kprintStringPKc>
        KCHECKPRINT(Riscv::r_sepc());
    80007b38:	00008517          	auipc	a0,0x8
    80007b3c:	b6850513          	addi	a0,a0,-1176 # 8000f6a0 <CONSOLE_STATUS+0x690>
    80007b40:	ffffd097          	auipc	ra,0xffffd
    80007b44:	564080e7          	jalr	1380(ra) # 800050a4 <_Z12kprintStringPKc>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
}

inline uint64 Riscv::r_sepc(){
    uint64 volatile sepc;
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80007b48:	141027f3          	csrr	a5,sepc
    80007b4c:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80007b50:	fc843503          	ld	a0,-56(s0)
    80007b54:	00000613          	li	a2,0
    80007b58:	01000593          	li	a1,16
    80007b5c:	ffffd097          	auipc	ra,0xffffd
    80007b60:	590080e7          	jalr	1424(ra) # 800050ec <_Z9kprintIntmib>
    80007b64:	00007517          	auipc	a0,0x7
    80007b68:	7f450513          	addi	a0,a0,2036 # 8000f358 <CONSOLE_STATUS+0x348>
    80007b6c:	ffffd097          	auipc	ra,0xffffd
    80007b70:	538080e7          	jalr	1336(ra) # 800050a4 <_Z12kprintStringPKc>
        return -1;
    80007b74:	fff00513          	li	a0,-1
    80007b78:	0680006f          	j	80007be0 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
        fmem_head = newsgm;
    80007b7c:	00aa3423          	sd	a0,8(s4)
        else
            fmem_head = newsgm;
    }
    // print_all_list();
    // print_list();
    return 0;
    80007b80:	00000513          	li	a0,0
    80007b84:	05c0006f          	j	80007be0 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
            if((!prev || (size_t)adr > (size_t)prev->addr) && (size_t)adr < (size_t)cur->addr)
    80007b88:	0107b703          	ld	a4,16(a5)
    80007b8c:	02e96063          	bltu	s2,a4,80007bac <_ZN15MemoryAllocator8mem_freeEPv+0x100>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80007b90:	00078493          	mv	s1,a5
    80007b94:	0007b783          	ld	a5,0(a5)
    80007b98:	00078a63          	beqz	a5,80007bac <_ZN15MemoryAllocator8mem_freeEPv+0x100>
            if((!prev || (size_t)adr > (size_t)prev->addr) && (size_t)adr < (size_t)cur->addr)
    80007b9c:	fe0486e3          	beqz	s1,80007b88 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    80007ba0:	0104b703          	ld	a4,16(s1)
    80007ba4:	ff2776e3          	bgeu	a4,s2,80007b90 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
    80007ba8:	fe1ff06f          	j	80007b88 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        newsgm->next = cur;
    80007bac:	00f9b023          	sd	a5,0(s3)
        if(cur)
    80007bb0:	00078a63          	beqz	a5,80007bc4 <_ZN15MemoryAllocator8mem_freeEPv+0x118>
            mergeWithNext(newsgm);
    80007bb4:	00098593          	mv	a1,s3
    80007bb8:	000a0513          	mv	a0,s4
    80007bbc:	00000097          	auipc	ra,0x0
    80007bc0:	e7c080e7          	jalr	-388(ra) # 80007a38 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80007bc4:	02048e63          	beqz	s1,80007c00 <_ZN15MemoryAllocator8mem_freeEPv+0x154>
            prev->next = newsgm;
    80007bc8:	0134b023          	sd	s3,0(s1)
            mergeWithNext(prev);
    80007bcc:	00048593          	mv	a1,s1
    80007bd0:	000a0513          	mv	a0,s4
    80007bd4:	00000097          	auipc	ra,0x0
    80007bd8:	e64080e7          	jalr	-412(ra) # 80007a38 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
    return 0;
    80007bdc:	00000513          	li	a0,0
}
    80007be0:	03813083          	ld	ra,56(sp)
    80007be4:	03013403          	ld	s0,48(sp)
    80007be8:	02813483          	ld	s1,40(sp)
    80007bec:	02013903          	ld	s2,32(sp)
    80007bf0:	01813983          	ld	s3,24(sp)
    80007bf4:	01013a03          	ld	s4,16(sp)
    80007bf8:	04010113          	addi	sp,sp,64
    80007bfc:	00008067          	ret
            fmem_head = newsgm;
    80007c00:	013a3423          	sd	s3,8(s4)
    return 0;
    80007c04:	00000513          	li	a0,0
    80007c08:	fd9ff06f          	j	80007be0 <_ZN15MemoryAllocator8mem_freeEPv+0x134>

0000000080007c0c <_ZN15MemoryAllocator18getFreeSegmentMetaEPv>:

FreeSegment* MemoryAllocator::getFreeSegmentMeta(void* adr){
    80007c0c:	ff010113          	addi	sp,sp,-16
    80007c10:	00813423          	sd	s0,8(sp)
    80007c14:	01010413          	addi	s0,sp,16
    80007c18:	0000d797          	auipc	a5,0xd
    80007c1c:	7c878793          	addi	a5,a5,1992 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007c20:	0007b783          	ld	a5,0(a5)
   size_t start_addr = (((size_t)NoAlloc::getEndAddress() - 1) & (~0xfff)) + 0x1000;
    80007c24:	fff78793          	addi	a5,a5,-1
    80007c28:	fffff737          	lui	a4,0xfffff
    80007c2c:	00e7f7b3          	and	a5,a5,a4
    80007c30:	00001737          	lui	a4,0x1
    80007c34:	00e787b3          	add	a5,a5,a4
    if(adr < (void*)start_addr || adr >= HEAP_END_ADDR)
    80007c38:	04f5e263          	bltu	a1,a5,80007c7c <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x70>
    80007c3c:	0000c797          	auipc	a5,0xc
    80007c40:	fc478793          	addi	a5,a5,-60 # 80013c00 <HEAP_END_ADDR>
    80007c44:	0007b783          	ld	a5,0(a5)
    80007c48:	02f5fe63          	bgeu	a1,a5,80007c84 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x78>
        return nullptr;
    size_t t = (size_t)adr;
    FreeSegment *cur = fall_head;
    80007c4c:	01053503          	ld	a0,16(a0)
    80007c50:	0080006f          	j	80007c58 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x4c>
        // if(t == (size_t)cur+sizeof(FreeSegment))
        //     break;
        if(t >= (size_t)cur->addr && t < (size_t)cur->addr + cur->size)
            break;    
        
        cur = cur->next;
    80007c54:	00053503          	ld	a0,0(a0)
    while(cur)
    80007c58:	00050c63          	beqz	a0,80007c70 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>
        if(t >= (size_t)cur->addr && t < (size_t)cur->addr + cur->size)
    80007c5c:	01053783          	ld	a5,16(a0)
    80007c60:	fef5eae3          	bltu	a1,a5,80007c54 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x48>
    80007c64:	00853703          	ld	a4,8(a0)
    80007c68:	00e787b3          	add	a5,a5,a4
    80007c6c:	fef5f4e3          	bgeu	a1,a5,80007c54 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x48>
    }
    if(cur)
        return cur;
    else return nullptr;
}
    80007c70:	00813403          	ld	s0,8(sp)
    80007c74:	01010113          	addi	sp,sp,16
    80007c78:	00008067          	ret
        return nullptr;
    80007c7c:	00000513          	li	a0,0
    80007c80:	ff1ff06f          	j	80007c70 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>
    80007c84:	00000513          	li	a0,0
    80007c88:	fe9ff06f          	j	80007c70 <_ZN15MemoryAllocator18getFreeSegmentMetaEPv+0x64>

0000000080007c8c <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80007c8c:	fe010113          	addi	sp,sp,-32
    80007c90:	00113c23          	sd	ra,24(sp)
    80007c94:	00813823          	sd	s0,16(sp)
    80007c98:	00913423          	sd	s1,8(sp)
    80007c9c:	02010413          	addi	s0,sp,32
    80007ca0:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    80007ca4:	00008517          	auipc	a0,0x8
    80007ca8:	a1450513          	addi	a0,a0,-1516 # 8000f6b8 <CONSOLE_STATUS+0x6a8>
    80007cac:	ffffd097          	auipc	ra,0xffffd
    80007cb0:	3f8080e7          	jalr	1016(ra) # 800050a4 <_Z12kprintStringPKc>
    if(!fmem_head)
    80007cb4:	0084b783          	ld	a5,8(s1)
    80007cb8:	08078063          	beqz	a5,80007d38 <_ZN15MemoryAllocator10print_listEv+0xac>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80007cbc:	0084b483          	ld	s1,8(s1)
    80007cc0:	08048663          	beqz	s1,80007d4c <_ZN15MemoryAllocator10print_listEv+0xc0>
        kprintInt((uint64)curr, 16);
    80007cc4:	00000613          	li	a2,0
    80007cc8:	01000593          	li	a1,16
    80007ccc:	00048513          	mv	a0,s1
    80007cd0:	ffffd097          	auipc	ra,0xffffd
    80007cd4:	41c080e7          	jalr	1052(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007cd8:	00007517          	auipc	a0,0x7
    80007cdc:	68050513          	addi	a0,a0,1664 # 8000f358 <CONSOLE_STATUS+0x348>
    80007ce0:	ffffd097          	auipc	ra,0xffffd
    80007ce4:	3c4080e7          	jalr	964(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size, 16);
    80007ce8:	00000613          	li	a2,0
    80007cec:	01000593          	li	a1,16
    80007cf0:	0084b503          	ld	a0,8(s1)
    80007cf4:	ffffd097          	auipc	ra,0xffffd
    80007cf8:	3f8080e7          	jalr	1016(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007cfc:	00007517          	auipc	a0,0x7
    80007d00:	65c50513          	addi	a0,a0,1628 # 8000f358 <CONSOLE_STATUS+0x348>
    80007d04:	ffffd097          	auipc	ra,0xffffd
    80007d08:	3a0080e7          	jalr	928(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->addr, 16);
    80007d0c:	00000613          	li	a2,0
    80007d10:	01000593          	li	a1,16
    80007d14:	0104b503          	ld	a0,16(s1)
    80007d18:	ffffd097          	auipc	ra,0xffffd
    80007d1c:	3d4080e7          	jalr	980(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007d20:	00007517          	auipc	a0,0x7
    80007d24:	63850513          	addi	a0,a0,1592 # 8000f358 <CONSOLE_STATUS+0x348>
    80007d28:	ffffd097          	auipc	ra,0xffffd
    80007d2c:	37c080e7          	jalr	892(ra) # 800050a4 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80007d30:	0004b483          	ld	s1,0(s1)
    80007d34:	f8dff06f          	j	80007cc0 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80007d38:	00008517          	auipc	a0,0x8
    80007d3c:	9a050513          	addi	a0,a0,-1632 # 8000f6d8 <CONSOLE_STATUS+0x6c8>
    80007d40:	ffffd097          	auipc	ra,0xffffd
    80007d44:	364080e7          	jalr	868(ra) # 800050a4 <_Z12kprintStringPKc>
    80007d48:	f75ff06f          	j	80007cbc <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80007d4c:	00008517          	auipc	a0,0x8
    80007d50:	9a450513          	addi	a0,a0,-1628 # 8000f6f0 <CONSOLE_STATUS+0x6e0>
    80007d54:	ffffd097          	auipc	ra,0xffffd
    80007d58:	350080e7          	jalr	848(ra) # 800050a4 <_Z12kprintStringPKc>
}
    80007d5c:	01813083          	ld	ra,24(sp)
    80007d60:	01013403          	ld	s0,16(sp)
    80007d64:	00813483          	ld	s1,8(sp)
    80007d68:	02010113          	addi	sp,sp,32
    80007d6c:	00008067          	ret

0000000080007d70 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    80007d70:	fe010113          	addi	sp,sp,-32
    80007d74:	00113c23          	sd	ra,24(sp)
    80007d78:	00813823          	sd	s0,16(sp)
    80007d7c:	00913423          	sd	s1,8(sp)
    80007d80:	02010413          	addi	s0,sp,32
    80007d84:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    80007d88:	00008517          	auipc	a0,0x8
    80007d8c:	98850513          	addi	a0,a0,-1656 # 8000f710 <CONSOLE_STATUS+0x700>
    80007d90:	ffffd097          	auipc	ra,0xffffd
    80007d94:	314080e7          	jalr	788(ra) # 800050a4 <_Z12kprintStringPKc>
    if(!fall_head)
    80007d98:	0104b783          	ld	a5,16(s1)
    80007d9c:	08078863          	beqz	a5,80007e2c <_ZN15MemoryAllocator14print_all_listEv+0xbc>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80007da0:	0104b483          	ld	s1,16(s1)
    80007da4:	08048e63          	beqz	s1,80007e40 <_ZN15MemoryAllocator14print_all_listEv+0xd0>
        kprintInt((uint64)curr, 16);
    80007da8:	00000613          	li	a2,0
    80007dac:	01000593          	li	a1,16
    80007db0:	00048513          	mv	a0,s1
    80007db4:	ffffd097          	auipc	ra,0xffffd
    80007db8:	338080e7          	jalr	824(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007dbc:	00007517          	auipc	a0,0x7
    80007dc0:	59c50513          	addi	a0,a0,1436 # 8000f358 <CONSOLE_STATUS+0x348>
    80007dc4:	ffffd097          	auipc	ra,0xffffd
    80007dc8:	2e0080e7          	jalr	736(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size,16);
    80007dcc:	00000613          	li	a2,0
    80007dd0:	01000593          	li	a1,16
    80007dd4:	0084b503          	ld	a0,8(s1)
    80007dd8:	ffffd097          	auipc	ra,0xffffd
    80007ddc:	314080e7          	jalr	788(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007de0:	00007517          	auipc	a0,0x7
    80007de4:	57850513          	addi	a0,a0,1400 # 8000f358 <CONSOLE_STATUS+0x348>
    80007de8:	ffffd097          	auipc	ra,0xffffd
    80007dec:	2bc080e7          	jalr	700(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->addr, 16);
    80007df0:	00000613          	li	a2,0
    80007df4:	01000593          	li	a1,16
    80007df8:	0104b503          	ld	a0,16(s1)
    80007dfc:	ffffd097          	auipc	ra,0xffffd
    80007e00:	2f0080e7          	jalr	752(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    80007e04:	00007517          	auipc	a0,0x7
    80007e08:	55450513          	addi	a0,a0,1364 # 8000f358 <CONSOLE_STATUS+0x348>
    80007e0c:	ffffd097          	auipc	ra,0xffffd
    80007e10:	298080e7          	jalr	664(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintString("\n");
    80007e14:	00007517          	auipc	a0,0x7
    80007e18:	54450513          	addi	a0,a0,1348 # 8000f358 <CONSOLE_STATUS+0x348>
    80007e1c:	ffffd097          	auipc	ra,0xffffd
    80007e20:	288080e7          	jalr	648(ra) # 800050a4 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80007e24:	0004b483          	ld	s1,0(s1)
    80007e28:	f7dff06f          	j	80007da4 <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80007e2c:	00008517          	auipc	a0,0x8
    80007e30:	8ac50513          	addi	a0,a0,-1876 # 8000f6d8 <CONSOLE_STATUS+0x6c8>
    80007e34:	ffffd097          	auipc	ra,0xffffd
    80007e38:	270080e7          	jalr	624(ra) # 800050a4 <_Z12kprintStringPKc>
    80007e3c:	f65ff06f          	j	80007da0 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80007e40:	00008517          	auipc	a0,0x8
    80007e44:	8b050513          	addi	a0,a0,-1872 # 8000f6f0 <CONSOLE_STATUS+0x6e0>
    80007e48:	ffffd097          	auipc	ra,0xffffd
    80007e4c:	25c080e7          	jalr	604(ra) # 800050a4 <_Z12kprintStringPKc>
    80007e50:	01813083          	ld	ra,24(sp)
    80007e54:	01013403          	ld	s0,16(sp)
    80007e58:	00813483          	ld	s1,8(sp)
    80007e5c:	02010113          	addi	sp,sp,32
    80007e60:	00008067          	ret

0000000080007e64 <_ZN7NoAlloc9mem_allocEm>:
#include"../../../h/kernel_lib.h"

void* NoAlloc::NOALLOC_END_ADDR;
bool NoAlloc::working = false;

void* NoAlloc::mem_alloc(size_t size){
    80007e64:	ff010113          	addi	sp,sp,-16
    80007e68:	00813423          	sd	s0,8(sp)
    80007e6c:	01010413          	addi	s0,sp,16
    /* not initalized */
    if(!working) return nullptr;
    80007e70:	0000d717          	auipc	a4,0xd
    80007e74:	56874703          	lbu	a4,1384(a4) # 800153d8 <_ZN7NoAlloc7workingE>
    80007e78:	04070063          	beqz	a4,80007eb8 <_ZN7NoAlloc9mem_allocEm+0x54>
    80007e7c:	00050793          	mv	a5,a0
    if(!NOALLOC_END_ADDR) return nullptr;
    80007e80:	0000d717          	auipc	a4,0xd
    80007e84:	56070713          	addi	a4,a4,1376 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007e88:	00073503          	ld	a0,0(a4)
    80007e8c:	02050063          	beqz	a0,80007eac <_ZN7NoAlloc9mem_allocEm+0x48>

    /* not enough memory */
    if((size_t) NOALLOC_END_ADDR + size >= (uint64)HEAP_END_ADDR)
    80007e90:	00f507b3          	add	a5,a0,a5
    80007e94:	0000c717          	auipc	a4,0xc
    80007e98:	d6c70713          	addi	a4,a4,-660 # 80013c00 <HEAP_END_ADDR>
    80007e9c:	00073703          	ld	a4,0(a4)
    80007ea0:	02e7f063          	bgeu	a5,a4,80007ec0 <_ZN7NoAlloc9mem_allocEm+0x5c>
        return nullptr;
    
    void* ret = NOALLOC_END_ADDR;
    NOALLOC_END_ADDR = (void*) ((size_t)NOALLOC_END_ADDR + size); /* increase end addr by size of object */
    80007ea4:	0000d717          	auipc	a4,0xd
    80007ea8:	52f73e23          	sd	a5,1340(a4) # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    
    return ret; 
}
    80007eac:	00813403          	ld	s0,8(sp)
    80007eb0:	01010113          	addi	sp,sp,16
    80007eb4:	00008067          	ret
    if(!working) return nullptr;
    80007eb8:	00000513          	li	a0,0
    80007ebc:	ff1ff06f          	j	80007eac <_ZN7NoAlloc9mem_allocEm+0x48>
        return nullptr;
    80007ec0:	00000513          	li	a0,0
    80007ec4:	fe9ff06f          	j	80007eac <_ZN7NoAlloc9mem_allocEm+0x48>

0000000080007ec8 <_ZN7NoAlloc4initEv>:

void NoAlloc::init(){
    80007ec8:	ff010113          	addi	sp,sp,-16
    80007ecc:	00813423          	sd	s0,8(sp)
    80007ed0:	01010413          	addi	s0,sp,16
    if(!NOALLOC_END_ADDR){
    80007ed4:	0000d797          	auipc	a5,0xd
    80007ed8:	50c78793          	addi	a5,a5,1292 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    80007edc:	0007b783          	ld	a5,0(a5)
    80007ee0:	00078863          	beqz	a5,80007ef0 <_ZN7NoAlloc4initEv+0x28>
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
        working = true;
    }
    80007ee4:	00813403          	ld	s0,8(sp)
    80007ee8:	01010113          	addi	sp,sp,16
    80007eec:	00008067          	ret
        NOALLOC_END_ADDR = (void*)HEAP_START_ADDR;
    80007ef0:	0000c797          	auipc	a5,0xc
    80007ef4:	d1878793          	addi	a5,a5,-744 # 80013c08 <HEAP_START_ADDR>
    80007ef8:	0007b783          	ld	a5,0(a5)
    80007efc:	0000d717          	auipc	a4,0xd
    80007f00:	4ef73223          	sd	a5,1252(a4) # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
        working = true;
    80007f04:	00100793          	li	a5,1
    80007f08:	0000d717          	auipc	a4,0xd
    80007f0c:	4cf70823          	sb	a5,1232(a4) # 800153d8 <_ZN7NoAlloc7workingE>
    80007f10:	fd5ff06f          	j	80007ee4 <_ZN7NoAlloc4initEv+0x1c>

0000000080007f14 <_ZN11ObjectCache13get_slab_sizeEPh>:
    return NONE;
}



size_t ObjectCache::get_slab_size(uchar* buddy_level_ptr){
    80007f14:	fe010113          	addi	sp,sp,-32
    80007f18:	00113c23          	sd	ra,24(sp)
    80007f1c:	00813823          	sd	s0,16(sp)
    80007f20:	00913423          	sd	s1,8(sp)
    80007f24:	01213023          	sd	s2,0(sp)
    80007f28:	02010413          	addi	s0,sp,32
    80007f2c:	00058913          	mv	s2,a1
    uchar buddy_level = 
        type == BUFF_SLAB ?
    80007f30:	01852703          	lw	a4,24(a0)
    80007f34:	00400793          	li	a5,4
    80007f38:	04f70863          	beq	a4,a5,80007f88 <_ZN11ObjectCache13get_slab_sizeEPh+0x74>
        BUDDY_LEVEL(objsize) : BUDDY_LEVEL(objsize+sizeof(Slab*));
    80007f3c:	01053483          	ld	s1,16(a0)
    80007f40:	00748493          	addi	s1,s1,7
    80007f44:	00001537          	lui	a0,0x1
    80007f48:	ffffe097          	auipc	ra,0xffffe
    80007f4c:	b1c080e7          	jalr	-1252(ra) # 80005a64 <_Z4log2m>
    80007f50:	00a4d533          	srl	a0,s1,a0
    80007f54:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80007f58:	ffffe097          	auipc	ra,0xffffe
    80007f5c:	b0c080e7          	jalr	-1268(ra) # 80005a64 <_Z4log2m>

    if(buddy_level_ptr) *buddy_level_ptr = buddy_level;
    80007f60:	00090463          	beqz	s2,80007f68 <_ZN11ObjectCache13get_slab_sizeEPh+0x54>
    80007f64:	00a90023          	sb	a0,0(s2)

    return ( 1UL << buddy_level) * Buddy::BLOCK_SIZE;
}
    80007f68:	000017b7          	lui	a5,0x1
    80007f6c:	00a79533          	sll	a0,a5,a0
    80007f70:	01813083          	ld	ra,24(sp)
    80007f74:	01013403          	ld	s0,16(sp)
    80007f78:	00813483          	ld	s1,8(sp)
    80007f7c:	00013903          	ld	s2,0(sp)
    80007f80:	02010113          	addi	sp,sp,32
    80007f84:	00008067          	ret
        BUDDY_LEVEL(objsize) : BUDDY_LEVEL(objsize+sizeof(Slab*));
    80007f88:	01053483          	ld	s1,16(a0)
    80007f8c:	fff48493          	addi	s1,s1,-1
    80007f90:	00001537          	lui	a0,0x1
    80007f94:	ffffe097          	auipc	ra,0xffffe
    80007f98:	ad0080e7          	jalr	-1328(ra) # 80005a64 <_Z4log2m>
    80007f9c:	00a4d533          	srl	a0,s1,a0
    80007fa0:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    80007fa4:	ffffe097          	auipc	ra,0xffffe
    80007fa8:	ac0080e7          	jalr	-1344(ra) # 80005a64 <_Z4log2m>
    80007fac:	fb5ff06f          	j	80007f60 <_ZN11ObjectCache13get_slab_sizeEPh+0x4c>

0000000080007fb0 <_ZN11ObjectCache14calculate_typeEv>:
ObjectCache::SlabMetaType ObjectCache::calculate_type(){
    80007fb0:	fe010113          	addi	sp,sp,-32
    80007fb4:	00113c23          	sd	ra,24(sp)
    80007fb8:	00813823          	sd	s0,16(sp)
    80007fbc:	00913423          	sd	s1,8(sp)
    80007fc0:	02010413          	addi	s0,sp,32
    80007fc4:	00050493          	mv	s1,a0
    size_t slab_size = get_slab_size();
    80007fc8:	00000593          	li	a1,0
    80007fcc:	00000097          	auipc	ra,0x0
    80007fd0:	f48080e7          	jalr	-184(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
    if( (slab_size - sizeof(void*))  % objsize >= sizeof(Slab))
    80007fd4:	ff850513          	addi	a0,a0,-8
    80007fd8:	0104b783          	ld	a5,16(s1)
    80007fdc:	02f57533          	remu	a0,a0,a5
    80007fe0:	0b700793          	li	a5,183
    80007fe4:	00a7ee63          	bltu	a5,a0,80008000 <_ZN11ObjectCache14calculate_typeEv+0x50>
        return OFF_SLAB;
    80007fe8:	00100513          	li	a0,1
}
    80007fec:	01813083          	ld	ra,24(sp)
    80007ff0:	01013403          	ld	s0,16(sp)
    80007ff4:	00813483          	ld	s1,8(sp)
    80007ff8:	02010113          	addi	sp,sp,32
    80007ffc:	00008067          	ret
        return ON_SLAB;
    80008000:	00300513          	li	a0,3
    80008004:	fe9ff06f          	j	80007fec <_ZN11ObjectCache14calculate_typeEv+0x3c>

0000000080008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>:
ObjectCache::ObjectCache(const char* t_name, size_t t_objsize,
    80008008:	fd010113          	addi	sp,sp,-48
    8000800c:	02113423          	sd	ra,40(sp)
    80008010:	02813023          	sd	s0,32(sp)
    80008014:	00913c23          	sd	s1,24(sp)
    80008018:	01213823          	sd	s2,16(sp)
    8000801c:	01313423          	sd	s3,8(sp)
    80008020:	01413023          	sd	s4,0(sp)
    80008024:	03010413          	addi	s0,sp,48
    80008028:	00050493          	mv	s1,a0
    8000802c:	00068a13          	mv	s4,a3
    80008030:	00070993          	mv	s3,a4
    80008034:	00078913          	mv	s2,a5
        , ctor(t_ctor), dtor(t_dtor)
    80008038:	00b53023          	sd	a1,0(a0)
    8000803c:	00c53823          	sd	a2,16(a0)
    80008040:	02053023          	sd	zero,32(a0)
    80008044:	02053423          	sd	zero,40(a0)
    80008048:	02053823          	sd	zero,48(a0)
    8000804c:	00000613          	li	a2,0
    80008050:	00000593          	li	a1,0
    80008054:	03850513          	addi	a0,a0,56
    80008058:	00003097          	auipc	ra,0x3
    8000805c:	5bc080e7          	jalr	1468(ra) # 8000b614 <_ZN6list_tC1EPS_S0_>
    80008060:	0544b423          	sd	s4,72(s1)
    80008064:	0534b823          	sd	s3,80(s1)
    size_t lowest_size = Buddy::BLOCK_SIZE >> log2(Slab::RB_SIZE);
    80008068:	08000513          	li	a0,128
    8000806c:	ffffe097          	auipc	ra,0xffffe
    80008070:	9f8080e7          	jalr	-1544(ra) # 80005a64 <_Z4log2m>
    80008074:	000017b7          	lui	a5,0x1
    80008078:	00a7d533          	srl	a0,a5,a0
    if(objsize < lowest_size) objsize = lowest_size;
    8000807c:	0104b783          	ld	a5,16(s1)
    80008080:	00a7f463          	bgeu	a5,a0,80008088 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0x80>
    80008084:	00a4b823          	sd	a0,16(s1)
    type = t_type;
    80008088:	0124ac23          	sw	s2,24(s1)
    if(t_type == NONE){ type = calculate_type(); }
    8000808c:	02090463          	beqz	s2,800080b4 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0xac>
    error = nullptr;
    80008090:	0004b423          	sd	zero,8(s1)
}
    80008094:	02813083          	ld	ra,40(sp)
    80008098:	02013403          	ld	s0,32(sp)
    8000809c:	01813483          	ld	s1,24(sp)
    800080a0:	01013903          	ld	s2,16(sp)
    800080a4:	00813983          	ld	s3,8(sp)
    800080a8:	00013a03          	ld	s4,0(sp)
    800080ac:	03010113          	addi	sp,sp,48
    800080b0:	00008067          	ret
    if(t_type == NONE){ type = calculate_type(); }
    800080b4:	00048513          	mv	a0,s1
    800080b8:	00000097          	auipc	ra,0x0
    800080bc:	ef8080e7          	jalr	-264(ra) # 80007fb0 <_ZN11ObjectCache14calculate_typeEv>
    800080c0:	00a4ac23          	sw	a0,24(s1)
    800080c4:	fcdff06f          	j	80008090 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE+0x88>

00000000800080c8 <_ZN11ObjectCache17list_update_allocEP4Slabb>:
    return slab_meta;
}



void ObjectCache::list_update_alloc(Slab* slab_meta, bool was_free){
    800080c8:	fe010113          	addi	sp,sp,-32
    800080cc:	00113c23          	sd	ra,24(sp)
    800080d0:	00813823          	sd	s0,16(sp)
    800080d4:	00913423          	sd	s1,8(sp)
    800080d8:	01213023          	sd	s2,0(sp)
    800080dc:	02010413          	addi	s0,sp,32
    800080e0:	00050493          	mv	s1,a0
    800080e4:	00058913          	mv	s2,a1
    Slab() = default;
    Slab& operator=(const Slab&) = default;
    
    void* get_obj();
    int put_obj(void*);
    bool full(){ return front == RB_SIZE; }
    800080e8:	0885c703          	lbu	a4,136(a1)
    if(slab_meta->full()){
    800080ec:	08000793          	li	a5,128
    800080f0:	02f70063          	beq	a4,a5,80008110 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x48>
            free_head = remove(free_head);
        else
            part_head = remove(part_head);
        full_head = insert(&(slab_meta->node), full_head);
    }
    else if(was_free){
    800080f4:	04061e63          	bnez	a2,80008150 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x88>
        free_head = remove(free_head);
        part_head = insert(&(slab_meta->node), part_head);
    }
}
    800080f8:	01813083          	ld	ra,24(sp)
    800080fc:	01013403          	ld	s0,16(sp)
    80008100:	00813483          	ld	s1,8(sp)
    80008104:	00013903          	ld	s2,0(sp)
    80008108:	02010113          	addi	sp,sp,32
    8000810c:	00008067          	ret
        if(was_free)
    80008110:	02060663          	beqz	a2,8000813c <_ZN11ObjectCache17list_update_allocEP4Slabb+0x74>
            free_head = remove(free_head);
    80008114:	02053503          	ld	a0,32(a0)
    80008118:	00003097          	auipc	ra,0x3
    8000811c:	51c080e7          	jalr	1308(ra) # 8000b634 <_Z6removeP6list_t>
    80008120:	02a4b023          	sd	a0,32(s1)
        full_head = insert(&(slab_meta->node), full_head);
    80008124:	0304b583          	ld	a1,48(s1)
    80008128:	0a890513          	addi	a0,s2,168
    8000812c:	00003097          	auipc	ra,0x3
    80008130:	554080e7          	jalr	1364(ra) # 8000b680 <_Z6insertP6list_tS0_>
    80008134:	02a4b823          	sd	a0,48(s1)
    80008138:	fc1ff06f          	j	800080f8 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x30>
            part_head = remove(part_head);
    8000813c:	02853503          	ld	a0,40(a0)
    80008140:	00003097          	auipc	ra,0x3
    80008144:	4f4080e7          	jalr	1268(ra) # 8000b634 <_Z6removeP6list_t>
    80008148:	02a4b423          	sd	a0,40(s1)
    8000814c:	fd9ff06f          	j	80008124 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x5c>
        free_head = remove(free_head);
    80008150:	02053503          	ld	a0,32(a0)
    80008154:	00003097          	auipc	ra,0x3
    80008158:	4e0080e7          	jalr	1248(ra) # 8000b634 <_Z6removeP6list_t>
    8000815c:	02a4b023          	sd	a0,32(s1)
        part_head = insert(&(slab_meta->node), part_head);
    80008160:	0284b583          	ld	a1,40(s1)
    80008164:	0a890513          	addi	a0,s2,168
    80008168:	00003097          	auipc	ra,0x3
    8000816c:	518080e7          	jalr	1304(ra) # 8000b680 <_Z6insertP6list_tS0_>
    80008170:	02a4b423          	sd	a0,40(s1)
}
    80008174:	f85ff06f          	j	800080f8 <_ZN11ObjectCache17list_update_allocEP4Slabb+0x30>

0000000080008178 <_ZN11ObjectCache16list_update_freeEP4Slabb>:
    return obj;
}



void ObjectCache::list_update_free(Slab* slab_meta, bool was_full){
    80008178:	fe010113          	addi	sp,sp,-32
    8000817c:	00113c23          	sd	ra,24(sp)
    80008180:	00813823          	sd	s0,16(sp)
    80008184:	00913423          	sd	s1,8(sp)
    80008188:	01213023          	sd	s2,0(sp)
    8000818c:	02010413          	addi	s0,sp,32
    80008190:	00050913          	mv	s2,a0
    80008194:	00058493          	mv	s1,a1
    bool free(){ return rear == front; }
    80008198:	0895c703          	lbu	a4,137(a1)
    8000819c:	0885c783          	lbu	a5,136(a1)
    
    if(slab_meta->free()){
    800081a0:	02f70c63          	beq	a4,a5,800081d8 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x60>
                part_head = remove(part_head);
            else
                remove(&slab_meta->node);
        }
        free_head = insert(&slab_meta->node, free_head);
    }else if(was_full){
    800081a4:	06060063          	beqz	a2,80008204 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x8c>
        if(&slab_meta->node == full_head)
    800081a8:	0a858493          	addi	s1,a1,168
    800081ac:	03053503          	ld	a0,48(a0)
    800081b0:	0aa48663          	beq	s1,a0,8000825c <_ZN11ObjectCache16list_update_freeEP4Slabb+0xe4>
            full_head = remove(full_head);
        else
            remove(&slab_meta->node);
    800081b4:	00048513          	mv	a0,s1
    800081b8:	00003097          	auipc	ra,0x3
    800081bc:	47c080e7          	jalr	1148(ra) # 8000b634 <_Z6removeP6list_t>
        part_head = insert(&slab_meta->node, part_head);
    800081c0:	02893583          	ld	a1,40(s2)
    800081c4:	00048513          	mv	a0,s1
    800081c8:	00003097          	auipc	ra,0x3
    800081cc:	4b8080e7          	jalr	1208(ra) # 8000b680 <_Z6insertP6list_tS0_>
    800081d0:	02a93423          	sd	a0,40(s2)
    }

}
    800081d4:	0300006f          	j	80008204 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x8c>
        if(was_full){
    800081d8:	04060c63          	beqz	a2,80008230 <_ZN11ObjectCache16list_update_freeEP4Slabb+0xb8>
            if(&slab_meta->node == full_head)
    800081dc:	0a858513          	addi	a0,a1,168
    800081e0:	03093783          	ld	a5,48(s2)
    800081e4:	02f50c63          	beq	a0,a5,8000821c <_ZN11ObjectCache16list_update_freeEP4Slabb+0xa4>
                remove(&slab_meta->node);
    800081e8:	00003097          	auipc	ra,0x3
    800081ec:	44c080e7          	jalr	1100(ra) # 8000b634 <_Z6removeP6list_t>
        free_head = insert(&slab_meta->node, free_head);
    800081f0:	02093583          	ld	a1,32(s2)
    800081f4:	0a848513          	addi	a0,s1,168
    800081f8:	00003097          	auipc	ra,0x3
    800081fc:	488080e7          	jalr	1160(ra) # 8000b680 <_Z6insertP6list_tS0_>
    80008200:	02a93023          	sd	a0,32(s2)
}
    80008204:	01813083          	ld	ra,24(sp)
    80008208:	01013403          	ld	s0,16(sp)
    8000820c:	00813483          	ld	s1,8(sp)
    80008210:	00013903          	ld	s2,0(sp)
    80008214:	02010113          	addi	sp,sp,32
    80008218:	00008067          	ret
                full_head = remove(full_head);
    8000821c:	00078513          	mv	a0,a5
    80008220:	00003097          	auipc	ra,0x3
    80008224:	414080e7          	jalr	1044(ra) # 8000b634 <_Z6removeP6list_t>
    80008228:	02a93823          	sd	a0,48(s2)
    8000822c:	fc5ff06f          	j	800081f0 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
            if(&slab_meta->node == part_head)
    80008230:	0a858513          	addi	a0,a1,168
    80008234:	02893783          	ld	a5,40(s2)
    80008238:	00f50863          	beq	a0,a5,80008248 <_ZN11ObjectCache16list_update_freeEP4Slabb+0xd0>
                remove(&slab_meta->node);
    8000823c:	00003097          	auipc	ra,0x3
    80008240:	3f8080e7          	jalr	1016(ra) # 8000b634 <_Z6removeP6list_t>
    80008244:	fadff06f          	j	800081f0 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
                part_head = remove(part_head);
    80008248:	00078513          	mv	a0,a5
    8000824c:	00003097          	auipc	ra,0x3
    80008250:	3e8080e7          	jalr	1000(ra) # 8000b634 <_Z6removeP6list_t>
    80008254:	02a93423          	sd	a0,40(s2)
    80008258:	f99ff06f          	j	800081f0 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x78>
            full_head = remove(full_head);
    8000825c:	00003097          	auipc	ra,0x3
    80008260:	3d8080e7          	jalr	984(ra) # 8000b634 <_Z6removeP6list_t>
    80008264:	02a93823          	sd	a0,48(s2)
    80008268:	f59ff06f          	j	800081c0 <_ZN11ObjectCache16list_update_freeEP4Slabb+0x48>

000000008000826c <_ZN11ObjectCache9find_slabEPvP6list_t>:



Slab* ObjectCache::find_slab(void* addr, list_t* head){
    8000826c:	fd010113          	addi	sp,sp,-48
    80008270:	02113423          	sd	ra,40(sp)
    80008274:	02813023          	sd	s0,32(sp)
    80008278:	00913c23          	sd	s1,24(sp)
    8000827c:	01213823          	sd	s2,16(sp)
    80008280:	01313423          	sd	s3,8(sp)
    80008284:	03010413          	addi	s0,sp,48
    80008288:	00058993          	mv	s3,a1
    8000828c:	00060493          	mv	s1,a2
    list_t* tmp = head;
    while(tmp){
    80008290:	02048463          	beqz	s1,800082b8 <_ZN11ObjectCache9find_slabEPvP6list_t+0x4c>
        Slab* slab_meta = get_list_parent(tmp, Slab, node);
    80008294:	f5848913          	addi	s2,s1,-168
        if(slab_meta->contains(addr)) return slab_meta;
    80008298:	00098593          	mv	a1,s3
    8000829c:	00090513          	mv	a0,s2
    800082a0:	00001097          	auipc	ra,0x1
    800082a4:	34c080e7          	jalr	844(ra) # 800095ec <_ZN4Slab8containsEPv>
    800082a8:	00051663          	bnez	a0,800082b4 <_ZN11ObjectCache9find_slabEPvP6list_t+0x48>
        tmp = tmp->next;
    800082ac:	0004b483          	ld	s1,0(s1)
    while(tmp){
    800082b0:	fe1ff06f          	j	80008290 <_ZN11ObjectCache9find_slabEPvP6list_t+0x24>
        if(slab_meta->contains(addr)) return slab_meta;
    800082b4:	00090493          	mv	s1,s2
    }
    return 0;
}
    800082b8:	00048513          	mv	a0,s1
    800082bc:	02813083          	ld	ra,40(sp)
    800082c0:	02013403          	ld	s0,32(sp)
    800082c4:	01813483          	ld	s1,24(sp)
    800082c8:	01013903          	ld	s2,16(sp)
    800082cc:	00813983          	ld	s3,8(sp)
    800082d0:	03010113          	addi	sp,sp,48
    800082d4:	00008067          	ret

00000000800082d8 <_ZN11ObjectCache13print_privateEc>:
    }
    return 0;
}


void ObjectCache::print_private(char flags){
    800082d8:	fd010113          	addi	sp,sp,-48
    800082dc:	02113423          	sd	ra,40(sp)
    800082e0:	02813023          	sd	s0,32(sp)
    800082e4:	00913c23          	sd	s1,24(sp)
    800082e8:	01213823          	sd	s2,16(sp)
    800082ec:	01313423          	sd	s3,8(sp)
    800082f0:	03010413          	addi	s0,sp,48
    800082f4:	00050993          	mv	s3,a0
    800082f8:	00058913          	mv	s2,a1
    KCHECKPRINT(objsize);
    800082fc:	00007517          	auipc	a0,0x7
    80008300:	45450513          	addi	a0,a0,1108 # 8000f750 <CONSOLE_STATUS+0x740>
    80008304:	ffffd097          	auipc	ra,0xffffd
    80008308:	da0080e7          	jalr	-608(ra) # 800050a4 <_Z12kprintStringPKc>
    8000830c:	00000613          	li	a2,0
    80008310:	01000593          	li	a1,16
    80008314:	0109b503          	ld	a0,16(s3)
    80008318:	ffffd097          	auipc	ra,0xffffd
    8000831c:	dd4080e7          	jalr	-556(ra) # 800050ec <_Z9kprintIntmib>
    80008320:	00007517          	auipc	a0,0x7
    80008324:	03850513          	addi	a0,a0,56 # 8000f358 <CONSOLE_STATUS+0x348>
    80008328:	ffffd097          	auipc	ra,0xffffd
    8000832c:	d7c080e7          	jalr	-644(ra) # 800050a4 <_Z12kprintStringPKc>
        KVALCHECKPRINT(SLAB SIZE, get_slab_size());
    80008330:	00007517          	auipc	a0,0x7
    80008334:	43050513          	addi	a0,a0,1072 # 8000f760 <CONSOLE_STATUS+0x750>
    80008338:	ffffd097          	auipc	ra,0xffffd
    8000833c:	d6c080e7          	jalr	-660(ra) # 800050a4 <_Z12kprintStringPKc>
    80008340:	00000593          	li	a1,0
    80008344:	00098513          	mv	a0,s3
    80008348:	00000097          	auipc	ra,0x0
    8000834c:	bcc080e7          	jalr	-1076(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
    80008350:	00000613          	li	a2,0
    80008354:	01000593          	li	a1,16
    80008358:	ffffd097          	auipc	ra,0xffffd
    8000835c:	d94080e7          	jalr	-620(ra) # 800050ec <_Z9kprintIntmib>
    80008360:	00007517          	auipc	a0,0x7
    80008364:	ff850513          	addi	a0,a0,-8 # 8000f358 <CONSOLE_STATUS+0x348>
    80008368:	ffffd097          	auipc	ra,0xffffd
    8000836c:	d3c080e7          	jalr	-708(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintString("SLAB TYPE: ");
    80008370:	00007517          	auipc	a0,0x7
    80008374:	40050513          	addi	a0,a0,1024 # 8000f770 <CONSOLE_STATUS+0x760>
    80008378:	ffffd097          	auipc	ra,0xffffd
    8000837c:	d2c080e7          	jalr	-724(ra) # 800050a4 <_Z12kprintStringPKc>
        switch (type) {
    80008380:	0189a783          	lw	a5,24(s3)
    80008384:	00400713          	li	a4,4
    80008388:	02f76863          	bltu	a4,a5,800083b8 <_ZN11ObjectCache13print_privateEc+0xe0>
    8000838c:	00279793          	slli	a5,a5,0x2
    80008390:	00007717          	auipc	a4,0x7
    80008394:	3a870713          	addi	a4,a4,936 # 8000f738 <CONSOLE_STATUS+0x728>
    80008398:	00e787b3          	add	a5,a5,a4
    8000839c:	0007a783          	lw	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800083a0:	00e787b3          	add	a5,a5,a4
    800083a4:	00078067          	jr	a5
            case NONE : kprintString("NONE\n");
    800083a8:	00007517          	auipc	a0,0x7
    800083ac:	3d850513          	addi	a0,a0,984 # 8000f780 <CONSOLE_STATUS+0x770>
    800083b0:	ffffd097          	auipc	ra,0xffffd
    800083b4:	cf4080e7          	jalr	-780(ra) # 800050a4 <_Z12kprintStringPKc>
            case ON_SLAB: kprintString("ON_SLAB\n");
            break;
            case BUFF_SLAB: kprintString("BUFF_SLAB\n");
            break;
        }
        kprintString("!!!!!!FREE SLAB LIST!!!!!! \n");
    800083b8:	00007517          	auipc	a0,0x7
    800083bc:	41050513          	addi	a0,a0,1040 # 8000f7c8 <CONSOLE_STATUS+0x7b8>
    800083c0:	ffffd097          	auipc	ra,0xffffd
    800083c4:	ce4080e7          	jalr	-796(ra) # 800050a4 <_Z12kprintStringPKc>
        list_t* tmp = free_head;
    800083c8:	0209b483          	ld	s1,32(s3)
        while(tmp){
    800083cc:	06048e63          	beqz	s1,80008448 <_ZN11ObjectCache13print_privateEc+0x170>
            Slab* tmp_slab = get_list_parent(tmp, Slab, node);
            tmp_slab->print_info(flags);
    800083d0:	00090593          	mv	a1,s2
    800083d4:	f5848513          	addi	a0,s1,-168
    800083d8:	00001097          	auipc	ra,0x1
    800083dc:	2a0080e7          	jalr	672(ra) # 80009678 <_ZN4Slab10print_infoEc>
            kprintString("\n");
    800083e0:	00007517          	auipc	a0,0x7
    800083e4:	f7850513          	addi	a0,a0,-136 # 8000f358 <CONSOLE_STATUS+0x348>
    800083e8:	ffffd097          	auipc	ra,0xffffd
    800083ec:	cbc080e7          	jalr	-836(ra) # 800050a4 <_Z12kprintStringPKc>
            tmp = tmp->next;
    800083f0:	0004b483          	ld	s1,0(s1)
        while(tmp){
    800083f4:	fd9ff06f          	j	800083cc <_ZN11ObjectCache13print_privateEc+0xf4>
            case OFF_SLAB : kprintString("OFF_SLAB\n");
    800083f8:	00007517          	auipc	a0,0x7
    800083fc:	39050513          	addi	a0,a0,912 # 8000f788 <CONSOLE_STATUS+0x778>
    80008400:	ffffd097          	auipc	ra,0xffffd
    80008404:	ca4080e7          	jalr	-860(ra) # 800050a4 <_Z12kprintStringPKc>
            break;
    80008408:	fb1ff06f          	j	800083b8 <_ZN11ObjectCache13print_privateEc+0xe0>
            case SLAB_SLAB : kprintString("SLAB_SLAB\n");
    8000840c:	00007517          	auipc	a0,0x7
    80008410:	38c50513          	addi	a0,a0,908 # 8000f798 <CONSOLE_STATUS+0x788>
    80008414:	ffffd097          	auipc	ra,0xffffd
    80008418:	c90080e7          	jalr	-880(ra) # 800050a4 <_Z12kprintStringPKc>
            break;
    8000841c:	f9dff06f          	j	800083b8 <_ZN11ObjectCache13print_privateEc+0xe0>
            case ON_SLAB: kprintString("ON_SLAB\n");
    80008420:	00007517          	auipc	a0,0x7
    80008424:	38850513          	addi	a0,a0,904 # 8000f7a8 <CONSOLE_STATUS+0x798>
    80008428:	ffffd097          	auipc	ra,0xffffd
    8000842c:	c7c080e7          	jalr	-900(ra) # 800050a4 <_Z12kprintStringPKc>
            break;
    80008430:	f89ff06f          	j	800083b8 <_ZN11ObjectCache13print_privateEc+0xe0>
            case BUFF_SLAB: kprintString("BUFF_SLAB\n");
    80008434:	00007517          	auipc	a0,0x7
    80008438:	38450513          	addi	a0,a0,900 # 8000f7b8 <CONSOLE_STATUS+0x7a8>
    8000843c:	ffffd097          	auipc	ra,0xffffd
    80008440:	c68080e7          	jalr	-920(ra) # 800050a4 <_Z12kprintStringPKc>
            break;
    80008444:	f75ff06f          	j	800083b8 <_ZN11ObjectCache13print_privateEc+0xe0>
        }
        kprintString("!!!!!!PARTIAL SLAB LIST!!!!!! \n");
    80008448:	00007517          	auipc	a0,0x7
    8000844c:	3a050513          	addi	a0,a0,928 # 8000f7e8 <CONSOLE_STATUS+0x7d8>
    80008450:	ffffd097          	auipc	ra,0xffffd
    80008454:	c54080e7          	jalr	-940(ra) # 800050a4 <_Z12kprintStringPKc>
        tmp = part_head;
    80008458:	0289b483          	ld	s1,40(s3)
        while(tmp){
    8000845c:	02048663          	beqz	s1,80008488 <_ZN11ObjectCache13print_privateEc+0x1b0>
            Slab* tmp_slab = get_list_parent(tmp, Slab, node);
            tmp_slab->print_info(flags);
    80008460:	00090593          	mv	a1,s2
    80008464:	f5848513          	addi	a0,s1,-168
    80008468:	00001097          	auipc	ra,0x1
    8000846c:	210080e7          	jalr	528(ra) # 80009678 <_ZN4Slab10print_infoEc>
            kprintString("\n");
    80008470:	00007517          	auipc	a0,0x7
    80008474:	ee850513          	addi	a0,a0,-280 # 8000f358 <CONSOLE_STATUS+0x348>
    80008478:	ffffd097          	auipc	ra,0xffffd
    8000847c:	c2c080e7          	jalr	-980(ra) # 800050a4 <_Z12kprintStringPKc>
            tmp = tmp->next;
    80008480:	0004b483          	ld	s1,0(s1)
        while(tmp){
    80008484:	fd9ff06f          	j	8000845c <_ZN11ObjectCache13print_privateEc+0x184>
        }
        kprintString("!!!!!!FULL SLAB LIST!!!!!!\n");
    80008488:	00007517          	auipc	a0,0x7
    8000848c:	38050513          	addi	a0,a0,896 # 8000f808 <CONSOLE_STATUS+0x7f8>
    80008490:	ffffd097          	auipc	ra,0xffffd
    80008494:	c14080e7          	jalr	-1004(ra) # 800050a4 <_Z12kprintStringPKc>
        tmp = full_head;
    80008498:	0309b483          	ld	s1,48(s3)
        while(tmp){
    8000849c:	02048663          	beqz	s1,800084c8 <_ZN11ObjectCache13print_privateEc+0x1f0>
            Slab* tmp_slab = get_list_parent(tmp, Slab, node);
            tmp_slab->print_info(flags);
    800084a0:	00090593          	mv	a1,s2
    800084a4:	f5848513          	addi	a0,s1,-168
    800084a8:	00001097          	auipc	ra,0x1
    800084ac:	1d0080e7          	jalr	464(ra) # 80009678 <_ZN4Slab10print_infoEc>
            kprintString("\n");
    800084b0:	00007517          	auipc	a0,0x7
    800084b4:	ea850513          	addi	a0,a0,-344 # 8000f358 <CONSOLE_STATUS+0x348>
    800084b8:	ffffd097          	auipc	ra,0xffffd
    800084bc:	bec080e7          	jalr	-1044(ra) # 800050a4 <_Z12kprintStringPKc>
            tmp = tmp->next;
    800084c0:	0004b483          	ld	s1,0(s1)
        while(tmp){
    800084c4:	fd9ff06f          	j	8000849c <_ZN11ObjectCache13print_privateEc+0x1c4>
        }
}
    800084c8:	02813083          	ld	ra,40(sp)
    800084cc:	02013403          	ld	s0,32(sp)
    800084d0:	01813483          	ld	s1,24(sp)
    800084d4:	01013903          	ld	s2,16(sp)
    800084d8:	00813983          	ld	s3,8(sp)
    800084dc:	03010113          	addi	sp,sp,48
    800084e0:	00008067          	ret

00000000800084e4 <_ZN11ObjectCache9printInfoEc>:

void ObjectCache::printInfo(char flags){
    800084e4:	fb010113          	addi	sp,sp,-80
    800084e8:	04113423          	sd	ra,72(sp)
    800084ec:	04813023          	sd	s0,64(sp)
    800084f0:	02913c23          	sd	s1,56(sp)
    800084f4:	03213823          	sd	s2,48(sp)
    800084f8:	03313423          	sd	s3,40(sp)
    800084fc:	03413023          	sd	s4,32(sp)
    80008500:	01513c23          	sd	s5,24(sp)
    80008504:	01613823          	sd	s6,16(sp)
    80008508:	01713423          	sd	s7,8(sp)
    8000850c:	01813023          	sd	s8,0(sp)
    80008510:	05010413          	addi	s0,sp,80
    80008514:	00050a93          	mv	s5,a0
    80008518:	00058b93          	mv	s7,a1


    kprintString("\n--------OBJCACHE ");kprintString(name); kprintString("--------\n");
    8000851c:	00007517          	auipc	a0,0x7
    80008520:	30c50513          	addi	a0,a0,780 # 8000f828 <CONSOLE_STATUS+0x818>
    80008524:	ffffd097          	auipc	ra,0xffffd
    80008528:	b80080e7          	jalr	-1152(ra) # 800050a4 <_Z12kprintStringPKc>
    8000852c:	000ab503          	ld	a0,0(s5)
    80008530:	ffffd097          	auipc	ra,0xffffd
    80008534:	b74080e7          	jalr	-1164(ra) # 800050a4 <_Z12kprintStringPKc>
    80008538:	00007517          	auipc	a0,0x7
    8000853c:	30850513          	addi	a0,a0,776 # 8000f840 <CONSOLE_STATUS+0x830>
    80008540:	ffffd097          	auipc	ra,0xffffd
    80008544:	b64080e7          	jalr	-1180(ra) # 800050a4 <_Z12kprintStringPKc>
   
    size_t alloc_obj_num = 0, slab_size = get_slab_size(), max_obj_num_in_slab, free_slab_num = 0, partial_slab_num = 0, full_slab_num = 0;
    80008548:	00000593          	li	a1,0
    8000854c:	000a8513          	mv	a0,s5
    80008550:	00000097          	auipc	ra,0x0
    80008554:	9c4080e7          	jalr	-1596(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
    80008558:	00050b13          	mv	s6,a0

    if(type == BUFF_SLAB)
    8000855c:	018aa783          	lw	a5,24(s5)
    80008560:	00400713          	li	a4,4
    80008564:	02e78863          	beq	a5,a4,80008594 <_ZN11ObjectCache9printInfoEc+0xb0>
        max_obj_num_in_slab = slab_size/objsize;
    else if(type == SLAB_SLAB)
    80008568:	00200713          	li	a4,2
    8000856c:	02e78a63          	beq	a5,a4,800085a0 <_ZN11ObjectCache9printInfoEc+0xbc>
        max_obj_num_in_slab = (slab_size - sizeof(void*) - objsize)/objsize;
    else
        max_obj_num_in_slab = (slab_size - sizeof(void*))/objsize;
    80008570:	ff850a13          	addi	s4,a0,-8
    80008574:	010ab783          	ld	a5,16(s5)
    80008578:	02fa5a33          	divu	s4,s4,a5

    list_t* cur;
    for(cur = free_head; cur; cur = cur->next) free_slab_num++;
    8000857c:	020ab783          	ld	a5,32(s5)
    size_t alloc_obj_num = 0, slab_size = get_slab_size(), max_obj_num_in_slab, free_slab_num = 0, partial_slab_num = 0, full_slab_num = 0;
    80008580:	00000993          	li	s3,0
    for(cur = free_head; cur; cur = cur->next) free_slab_num++;
    80008584:	02078863          	beqz	a5,800085b4 <_ZN11ObjectCache9printInfoEc+0xd0>
    80008588:	00198993          	addi	s3,s3,1
    8000858c:	0007b783          	ld	a5,0(a5)
    80008590:	ff5ff06f          	j	80008584 <_ZN11ObjectCache9printInfoEc+0xa0>
        max_obj_num_in_slab = slab_size/objsize;
    80008594:	010aba03          	ld	s4,16(s5)
    80008598:	03455a33          	divu	s4,a0,s4
    8000859c:	fe1ff06f          	j	8000857c <_ZN11ObjectCache9printInfoEc+0x98>
        max_obj_num_in_slab = (slab_size - sizeof(void*) - objsize)/objsize;
    800085a0:	010ab783          	ld	a5,16(s5)
    800085a4:	40f50a33          	sub	s4,a0,a5
    800085a8:	ff8a0a13          	addi	s4,s4,-8
    800085ac:	02fa5a33          	divu	s4,s4,a5
    800085b0:	fcdff06f          	j	8000857c <_ZN11ObjectCache9printInfoEc+0x98>

    for(cur = part_head; cur; cur = cur->next){
    800085b4:	028ab783          	ld	a5,40(s5)
    size_t alloc_obj_num = 0, slab_size = get_slab_size(), max_obj_num_in_slab, free_slab_num = 0, partial_slab_num = 0, full_slab_num = 0;
    800085b8:	00000913          	li	s2,0
    800085bc:	00000493          	li	s1,0
    800085c0:	0100006f          	j	800085d0 <_ZN11ObjectCache9printInfoEc+0xec>
        partial_slab_num++;
        Slab* s = get_list_parent(cur, Slab, node);
        if(s->front < s->rear) 
            alloc_obj_num += s->cap - (s->rear - s->front);
        else
            alloc_obj_num += s->front - s->rear;
    800085c4:	40d7073b          	subw	a4,a4,a3
    800085c8:	00e484b3          	add	s1,s1,a4
    for(cur = part_head; cur; cur = cur->next){
    800085cc:	0007b783          	ld	a5,0(a5)
    800085d0:	02078463          	beqz	a5,800085f8 <_ZN11ObjectCache9printInfoEc+0x114>
        partial_slab_num++;
    800085d4:	00190913          	addi	s2,s2,1
        if(s->front < s->rear) 
    800085d8:	fe07c703          	lbu	a4,-32(a5)
    800085dc:	fe17c683          	lbu	a3,-31(a5)
    800085e0:	fed772e3          	bgeu	a4,a3,800085c4 <_ZN11ObjectCache9printInfoEc+0xe0>
            alloc_obj_num += s->cap - (s->rear - s->front);
    800085e4:	fe27c603          	lbu	a2,-30(a5)
    800085e8:	40e6873b          	subw	a4,a3,a4
    800085ec:	40e6073b          	subw	a4,a2,a4
    800085f0:	00e484b3          	add	s1,s1,a4
    800085f4:	fd9ff06f          	j	800085cc <_ZN11ObjectCache9printInfoEc+0xe8>
    }

    for(cur = full_head; cur; cur = cur->next){
    800085f8:	030ab783          	ld	a5,48(s5)
    size_t alloc_obj_num = 0, slab_size = get_slab_size(), max_obj_num_in_slab, free_slab_num = 0, partial_slab_num = 0, full_slab_num = 0;
    800085fc:	00000c13          	li	s8,0
    for(cur = full_head; cur; cur = cur->next){
    80008600:	00078a63          	beqz	a5,80008614 <_ZN11ObjectCache9printInfoEc+0x130>
        full_slab_num++;
    80008604:	001c0c13          	addi	s8,s8,1
        alloc_obj_num += max_obj_num_in_slab;
    80008608:	014484b3          	add	s1,s1,s4
    for(cur = full_head; cur; cur = cur->next){
    8000860c:	0007b783          	ld	a5,0(a5)
    80008610:	ff1ff06f          	j	80008600 <_ZN11ObjectCache9printInfoEc+0x11c>
    }

    KCHECKPRINT(free_slab_num);
    80008614:	00007517          	auipc	a0,0x7
    80008618:	23c50513          	addi	a0,a0,572 # 8000f850 <CONSOLE_STATUS+0x840>
    8000861c:	ffffd097          	auipc	ra,0xffffd
    80008620:	a88080e7          	jalr	-1400(ra) # 800050a4 <_Z12kprintStringPKc>
    80008624:	00000613          	li	a2,0
    80008628:	01000593          	li	a1,16
    8000862c:	00098513          	mv	a0,s3
    80008630:	ffffd097          	auipc	ra,0xffffd
    80008634:	abc080e7          	jalr	-1348(ra) # 800050ec <_Z9kprintIntmib>
    80008638:	00007517          	auipc	a0,0x7
    8000863c:	d2050513          	addi	a0,a0,-736 # 8000f358 <CONSOLE_STATUS+0x348>
    80008640:	ffffd097          	auipc	ra,0xffffd
    80008644:	a64080e7          	jalr	-1436(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(partial_slab_num);
    80008648:	00007517          	auipc	a0,0x7
    8000864c:	21850513          	addi	a0,a0,536 # 8000f860 <CONSOLE_STATUS+0x850>
    80008650:	ffffd097          	auipc	ra,0xffffd
    80008654:	a54080e7          	jalr	-1452(ra) # 800050a4 <_Z12kprintStringPKc>
    80008658:	00000613          	li	a2,0
    8000865c:	01000593          	li	a1,16
    80008660:	00090513          	mv	a0,s2
    80008664:	ffffd097          	auipc	ra,0xffffd
    80008668:	a88080e7          	jalr	-1400(ra) # 800050ec <_Z9kprintIntmib>
    8000866c:	00007517          	auipc	a0,0x7
    80008670:	cec50513          	addi	a0,a0,-788 # 8000f358 <CONSOLE_STATUS+0x348>
    80008674:	ffffd097          	auipc	ra,0xffffd
    80008678:	a30080e7          	jalr	-1488(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(full_slab_num);
    8000867c:	00007517          	auipc	a0,0x7
    80008680:	1fc50513          	addi	a0,a0,508 # 8000f878 <CONSOLE_STATUS+0x868>
    80008684:	ffffd097          	auipc	ra,0xffffd
    80008688:	a20080e7          	jalr	-1504(ra) # 800050a4 <_Z12kprintStringPKc>
    8000868c:	00000613          	li	a2,0
    80008690:	01000593          	li	a1,16
    80008694:	000c0513          	mv	a0,s8
    80008698:	ffffd097          	auipc	ra,0xffffd
    8000869c:	a54080e7          	jalr	-1452(ra) # 800050ec <_Z9kprintIntmib>
    800086a0:	00007517          	auipc	a0,0x7
    800086a4:	cb850513          	addi	a0,a0,-840 # 8000f358 <CONSOLE_STATUS+0x348>
    800086a8:	ffffd097          	auipc	ra,0xffffd
    800086ac:	9fc080e7          	jalr	-1540(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(slab_size);
    800086b0:	00007517          	auipc	a0,0x7
    800086b4:	1d850513          	addi	a0,a0,472 # 8000f888 <CONSOLE_STATUS+0x878>
    800086b8:	ffffd097          	auipc	ra,0xffffd
    800086bc:	9ec080e7          	jalr	-1556(ra) # 800050a4 <_Z12kprintStringPKc>
    800086c0:	00000613          	li	a2,0
    800086c4:	01000593          	li	a1,16
    800086c8:	000b0513          	mv	a0,s6
    800086cc:	ffffd097          	auipc	ra,0xffffd
    800086d0:	a20080e7          	jalr	-1504(ra) # 800050ec <_Z9kprintIntmib>
    800086d4:	00007517          	auipc	a0,0x7
    800086d8:	c8450513          	addi	a0,a0,-892 # 8000f358 <CONSOLE_STATUS+0x348>
    800086dc:	ffffd097          	auipc	ra,0xffffd
    800086e0:	9c8080e7          	jalr	-1592(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(objsize);
    800086e4:	00007517          	auipc	a0,0x7
    800086e8:	06c50513          	addi	a0,a0,108 # 8000f750 <CONSOLE_STATUS+0x740>
    800086ec:	ffffd097          	auipc	ra,0xffffd
    800086f0:	9b8080e7          	jalr	-1608(ra) # 800050a4 <_Z12kprintStringPKc>
    800086f4:	00000613          	li	a2,0
    800086f8:	01000593          	li	a1,16
    800086fc:	010ab503          	ld	a0,16(s5)
    80008700:	ffffd097          	auipc	ra,0xffffd
    80008704:	9ec080e7          	jalr	-1556(ra) # 800050ec <_Z9kprintIntmib>
    80008708:	00007517          	auipc	a0,0x7
    8000870c:	c5050513          	addi	a0,a0,-944 # 8000f358 <CONSOLE_STATUS+0x348>
    80008710:	ffffd097          	auipc	ra,0xffffd
    80008714:	994080e7          	jalr	-1644(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(max_obj_num_in_slab);
    80008718:	00007517          	auipc	a0,0x7
    8000871c:	18050513          	addi	a0,a0,384 # 8000f898 <CONSOLE_STATUS+0x888>
    80008720:	ffffd097          	auipc	ra,0xffffd
    80008724:	984080e7          	jalr	-1660(ra) # 800050a4 <_Z12kprintStringPKc>
    80008728:	00000613          	li	a2,0
    8000872c:	01000593          	li	a1,16
    80008730:	000a0513          	mv	a0,s4
    80008734:	ffffd097          	auipc	ra,0xffffd
    80008738:	9b8080e7          	jalr	-1608(ra) # 800050ec <_Z9kprintIntmib>
    8000873c:	00007517          	auipc	a0,0x7
    80008740:	c1c50513          	addi	a0,a0,-996 # 8000f358 <CONSOLE_STATUS+0x348>
    80008744:	ffffd097          	auipc	ra,0xffffd
    80008748:	960080e7          	jalr	-1696(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(alloc_obj_num);
    8000874c:	00007517          	auipc	a0,0x7
    80008750:	16450513          	addi	a0,a0,356 # 8000f8b0 <CONSOLE_STATUS+0x8a0>
    80008754:	ffffd097          	auipc	ra,0xffffd
    80008758:	950080e7          	jalr	-1712(ra) # 800050a4 <_Z12kprintStringPKc>
    8000875c:	00000613          	li	a2,0
    80008760:	01000593          	li	a1,16
    80008764:	00048513          	mv	a0,s1
    80008768:	ffffd097          	auipc	ra,0xffffd
    8000876c:	984080e7          	jalr	-1660(ra) # 800050ec <_Z9kprintIntmib>
    80008770:	00007517          	auipc	a0,0x7
    80008774:	be850513          	addi	a0,a0,-1048 # 8000f358 <CONSOLE_STATUS+0x348>
    80008778:	ffffd097          	auipc	ra,0xffffd
    8000877c:	92c080e7          	jalr	-1748(ra) # 800050a4 <_Z12kprintStringPKc>

    
    if(flags){ print_private(flags); }
    80008780:	060b9063          	bnez	s7,800087e0 <_ZN11ObjectCache9printInfoEc+0x2fc>
    kprintString("------OBJCACHE ");kprintString(name); kprintString(" END------\n\n");
    80008784:	00007517          	auipc	a0,0x7
    80008788:	13c50513          	addi	a0,a0,316 # 8000f8c0 <CONSOLE_STATUS+0x8b0>
    8000878c:	ffffd097          	auipc	ra,0xffffd
    80008790:	918080e7          	jalr	-1768(ra) # 800050a4 <_Z12kprintStringPKc>
    80008794:	000ab503          	ld	a0,0(s5)
    80008798:	ffffd097          	auipc	ra,0xffffd
    8000879c:	90c080e7          	jalr	-1780(ra) # 800050a4 <_Z12kprintStringPKc>
    800087a0:	00007517          	auipc	a0,0x7
    800087a4:	13050513          	addi	a0,a0,304 # 8000f8d0 <CONSOLE_STATUS+0x8c0>
    800087a8:	ffffd097          	auipc	ra,0xffffd
    800087ac:	8fc080e7          	jalr	-1796(ra) # 800050a4 <_Z12kprintStringPKc>
    
}
    800087b0:	04813083          	ld	ra,72(sp)
    800087b4:	04013403          	ld	s0,64(sp)
    800087b8:	03813483          	ld	s1,56(sp)
    800087bc:	03013903          	ld	s2,48(sp)
    800087c0:	02813983          	ld	s3,40(sp)
    800087c4:	02013a03          	ld	s4,32(sp)
    800087c8:	01813a83          	ld	s5,24(sp)
    800087cc:	01013b03          	ld	s6,16(sp)
    800087d0:	00813b83          	ld	s7,8(sp)
    800087d4:	00013c03          	ld	s8,0(sp)
    800087d8:	05010113          	addi	sp,sp,80
    800087dc:	00008067          	ret
    if(flags){ print_private(flags); }
    800087e0:	000b8593          	mv	a1,s7
    800087e4:	000a8513          	mv	a0,s5
    800087e8:	00000097          	auipc	ra,0x0
    800087ec:	af0080e7          	jalr	-1296(ra) # 800082d8 <_ZN11ObjectCache13print_privateEc>
    800087f0:	f95ff06f          	j	80008784 <_ZN11ObjectCache9printInfoEc+0x2a0>

00000000800087f4 <_ZN11ObjectCache10printErrorEv>:
    free_slabs(part_head);
    free_slabs(full_head);

}
int ObjectCache::printError(){
    if(!error) return 0;
    800087f4:	00853503          	ld	a0,8(a0)
    800087f8:	02050863          	beqz	a0,80008828 <_ZN11ObjectCache10printErrorEv+0x34>
int ObjectCache::printError(){
    800087fc:	ff010113          	addi	sp,sp,-16
    80008800:	00113423          	sd	ra,8(sp)
    80008804:	00813023          	sd	s0,0(sp)
    80008808:	01010413          	addi	s0,sp,16

    kprintString(error);
    8000880c:	ffffd097          	auipc	ra,0xffffd
    80008810:	898080e7          	jalr	-1896(ra) # 800050a4 <_Z12kprintStringPKc>
    return 1; 
    80008814:	00100513          	li	a0,1
}
    80008818:	00813083          	ld	ra,8(sp)
    8000881c:	00013403          	ld	s0,0(sp)
    80008820:	01010113          	addi	sp,sp,16
    80008824:	00008067          	ret
    if(!error) return 0;
    80008828:	00000513          	li	a0,0
}
    8000882c:	00008067          	ret

0000000080008830 <_ZN11ObjectCache8zero_outEPv>:

void ObjectCache::zero_out(void* t){
    80008830:	ff010113          	addi	sp,sp,-16
    80008834:	00813423          	sd	s0,8(sp)
    80008838:	01010413          	addi	s0,sp,16
    for( char* ptr = (char*)t; ptr < (char*)t + objsize; ptr++ )
    8000883c:	00058713          	mv	a4,a1
    80008840:	01053783          	ld	a5,16(a0)
    80008844:	00f587b3          	add	a5,a1,a5
    80008848:	00f77863          	bgeu	a4,a5,80008858 <_ZN11ObjectCache8zero_outEPv+0x28>
        *ptr = 0;
    8000884c:	00070023          	sb	zero,0(a4)
    for( char* ptr = (char*)t; ptr < (char*)t + objsize; ptr++ )
    80008850:	00170713          	addi	a4,a4,1
    80008854:	fedff06f          	j	80008840 <_ZN11ObjectCache8zero_outEPv+0x10>

    80008858:	00813403          	ld	s0,8(sp)
    8000885c:	01010113          	addi	sp,sp,16
    80008860:	00008067          	ret

0000000080008864 <_ZN11ObjectCache10slab_allocEv>:
Slab* ObjectCache::slab_alloc(){
    80008864:	ef010113          	addi	sp,sp,-272
    80008868:	10113423          	sd	ra,264(sp)
    8000886c:	10813023          	sd	s0,256(sp)
    80008870:	0e913c23          	sd	s1,248(sp)
    80008874:	0f213823          	sd	s2,240(sp)
    80008878:	0f313423          	sd	s3,232(sp)
    8000887c:	0f413023          	sd	s4,224(sp)
    80008880:	0d513c23          	sd	s5,216(sp)
    80008884:	0d613823          	sd	s6,208(sp)
    80008888:	0d713423          	sd	s7,200(sp)
    8000888c:	11010413          	addi	s0,sp,272
    80008890:	00050913          	mv	s2,a0
    size_t slab_size = get_slab_size(&buddy_level);
    80008894:	faf40593          	addi	a1,s0,-81
    80008898:	fffff097          	auipc	ra,0xfffff
    8000889c:	67c080e7          	jalr	1660(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
    800088a0:	00050b13          	mv	s6,a0
    obj_num = slab_size/objsize - 1;
    800088a4:	01093a83          	ld	s5,16(s2)
    800088a8:	03555ab3          	divu	s5,a0,s5
    800088ac:	0ffafa93          	andi	s5,s5,255
    800088b0:	fffa879b          	addiw	a5,s5,-1
    800088b4:	0ff7fb93          	andi	s7,a5,255
    start = (char*)Buddy::getInstance().mem_alloc(buddy_level);
    800088b8:	ffffe097          	auipc	ra,0xffffe
    800088bc:	040080e7          	jalr	64(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    800088c0:	faf44583          	lbu	a1,-81(s0)
    800088c4:	ffffe097          	auipc	ra,0xffffe
    800088c8:	5b0080e7          	jalr	1456(ra) # 80006e74 <_ZN5Buddy9mem_allocEh>
    800088cc:	00050993          	mv	s3,a0
    if(!start){
    800088d0:	0e050463          	beqz	a0,800089b8 <_ZN11ObjectCache10slab_allocEv+0x154>
    tmp_addr = start + sizeof(Slab*);
    800088d4:	00850493          	addi	s1,a0,8
        &SlabAllocator::getInstance().slab_cache;
    800088d8:	00001097          	auipc	ra,0x1
    800088dc:	a3c080e7          	jalr	-1476(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    800088e0:	05850513          	addi	a0,a0,88
    switch(type){
    800088e4:	01892783          	lw	a5,24(s2)
    800088e8:	00200713          	li	a4,2
    800088ec:	14e78663          	beq	a5,a4,80008a38 <_ZN11ObjectCache10slab_allocEv+0x1d4>
    800088f0:	0cf77e63          	bgeu	a4,a5,800089cc <_ZN11ObjectCache10slab_allocEv+0x168>
    800088f4:	00300713          	li	a4,3
    800088f8:	14e78863          	beq	a5,a4,80008a48 <_ZN11ObjectCache10slab_allocEv+0x1e4>
    800088fc:	00400713          	li	a4,4
    80008900:	18e79e63          	bne	a5,a4,80008a9c <_ZN11ObjectCache10slab_allocEv+0x238>
            tmp_addr = start;
    80008904:	00098493          	mv	s1,s3
            slab_meta = (Slab*)slab_cache_ptr->alloc_obj();
    80008908:	00000097          	auipc	ra,0x0
    8000890c:	19c080e7          	jalr	412(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    80008910:	00050a13          	mv	s4,a0
            if(!slab_meta){
    80008914:	0e050e63          	beqz	a0,80008a10 <_ZN11ObjectCache10slab_allocEv+0x1ac>
    if(type == SLAB_SLAB){ obj_num -= 1; }
    80008918:	01892703          	lw	a4,24(s2)
    8000891c:	00200793          	li	a5,2
    80008920:	12f70c63          	beq	a4,a5,80008a58 <_ZN11ObjectCache10slab_allocEv+0x1f4>
    *slab_meta = Slab(obj_num
    80008924:	00090693          	mv	a3,s2
    80008928:	00048613          	mv	a2,s1
    8000892c:	000a8593          	mv	a1,s5
    80008930:	ef040513          	addi	a0,s0,-272
    80008934:	00001097          	auipc	ra,0x1
    80008938:	bf0080e7          	jalr	-1040(ra) # 80009524 <_ZN4SlabC1EhPvP11ObjectCache>
    8000893c:	ef040793          	addi	a5,s0,-272
    80008940:	000a0713          	mv	a4,s4
    80008944:	f9040813          	addi	a6,s0,-112
    80008948:	0007b503          	ld	a0,0(a5)
    8000894c:	0087b583          	ld	a1,8(a5)
    80008950:	0107b603          	ld	a2,16(a5)
    80008954:	0187b683          	ld	a3,24(a5)
    80008958:	00a73023          	sd	a0,0(a4)
    8000895c:	00b73423          	sd	a1,8(a4)
    80008960:	00c73823          	sd	a2,16(a4)
    80008964:	00d73c23          	sd	a3,24(a4)
    80008968:	02078793          	addi	a5,a5,32
    8000896c:	02070713          	addi	a4,a4,32
    80008970:	fd079ce3          	bne	a5,a6,80008948 <_ZN11ObjectCache10slab_allocEv+0xe4>
    80008974:	0007b603          	ld	a2,0(a5)
    80008978:	0087b683          	ld	a3,8(a5)
    8000897c:	0107b783          	ld	a5,16(a5)
    80008980:	00c73023          	sd	a2,0(a4)
    80008984:	00d73423          	sd	a3,8(a4)
    80008988:	00f73823          	sd	a5,16(a4)
    if(type != BUFF_SLAB) { *slab_meta_addr_ptr = slab_meta; }
    8000898c:	01892703          	lw	a4,24(s2)
    80008990:	00400793          	li	a5,4
    80008994:	00f70463          	beq	a4,a5,8000899c <_ZN11ObjectCache10slab_allocEv+0x138>
    80008998:	0149b023          	sd	s4,0(s3)
    free_head = insert(&slab_meta->node, free_head);
    8000899c:	02093583          	ld	a1,32(s2)
    800089a0:	0a8a0513          	addi	a0,s4,168
    800089a4:	00003097          	auipc	ra,0x3
    800089a8:	cdc080e7          	jalr	-804(ra) # 8000b680 <_Z6insertP6list_tS0_>
    800089ac:	02a93023          	sd	a0,32(s2)
    char* end = start + slab_size;
    800089b0:	016989b3          	add	s3,s3,s6
    800089b4:	0c80006f          	j	80008a7c <_ZN11ObjectCache10slab_allocEv+0x218>
        error = "Not enough memory left";
    800089b8:	00007797          	auipc	a5,0x7
    800089bc:	f2878793          	addi	a5,a5,-216 # 8000f8e0 <CONSOLE_STATUS+0x8d0>
    800089c0:	00f93423          	sd	a5,8(s2)
        return nullptr;
    800089c4:	00050a13          	mv	s4,a0
    800089c8:	0180006f          	j	800089e0 <_ZN11ObjectCache10slab_allocEv+0x17c>
    switch(type){
    800089cc:	00100713          	li	a4,1
    800089d0:	00e79663          	bne	a5,a4,800089dc <_ZN11ObjectCache10slab_allocEv+0x178>
    obj_num = slab_size/objsize - 1;
    800089d4:	000b8a93          	mv	s5,s7
    800089d8:	f31ff06f          	j	80008908 <_ZN11ObjectCache10slab_allocEv+0xa4>
        case NONE: default: return nullptr;
    800089dc:	00000a13          	li	s4,0
}
    800089e0:	000a0513          	mv	a0,s4
    800089e4:	10813083          	ld	ra,264(sp)
    800089e8:	10013403          	ld	s0,256(sp)
    800089ec:	0f813483          	ld	s1,248(sp)
    800089f0:	0f013903          	ld	s2,240(sp)
    800089f4:	0e813983          	ld	s3,232(sp)
    800089f8:	0e013a03          	ld	s4,224(sp)
    800089fc:	0d813a83          	ld	s5,216(sp)
    80008a00:	0d013b03          	ld	s6,208(sp)
    80008a04:	0c813b83          	ld	s7,200(sp)
    80008a08:	11010113          	addi	sp,sp,272
    80008a0c:	00008067          	ret
                error = "Not enough memory left";
    80008a10:	00007797          	auipc	a5,0x7
    80008a14:	ed078793          	addi	a5,a5,-304 # 8000f8e0 <CONSOLE_STATUS+0x8d0>
    80008a18:	00f93423          	sd	a5,8(s2)
                Buddy::getInstance().mem_free(start, buddy_level);
    80008a1c:	ffffe097          	auipc	ra,0xffffe
    80008a20:	edc080e7          	jalr	-292(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    80008a24:	faf44603          	lbu	a2,-81(s0)
    80008a28:	00098593          	mv	a1,s3
    80008a2c:	fffff097          	auipc	ra,0xfffff
    80008a30:	ab0080e7          	jalr	-1360(ra) # 800074dc <_ZN5Buddy8mem_freeEPvh>
                return nullptr;
    80008a34:	fadff06f          	j	800089e0 <_ZN11ObjectCache10slab_allocEv+0x17c>
            slab_meta = (Slab*)tmp_addr;
    80008a38:	00048a13          	mv	s4,s1
            tmp_addr += sizeof(Slab);
    80008a3c:	0c098493          	addi	s1,s3,192
    obj_num = slab_size/objsize - 1;
    80008a40:	000b8a93          	mv	s5,s7
            break;
    80008a44:	ed5ff06f          	j	80008918 <_ZN11ObjectCache10slab_allocEv+0xb4>
            slab_meta = (Slab*)(start + slab_size - sizeof(Slab));
    80008a48:	f48b0a13          	addi	s4,s6,-184 # 1f48 <_entry-0x7fffe0b8>
    80008a4c:	01498a33          	add	s4,s3,s4
    obj_num = slab_size/objsize - 1;
    80008a50:	000b8a93          	mv	s5,s7
            break;
    80008a54:	ec5ff06f          	j	80008918 <_ZN11ObjectCache10slab_allocEv+0xb4>
    if(type == SLAB_SLAB){ obj_num -= 1; }
    80008a58:	fffa8a9b          	addiw	s5,s5,-1
    80008a5c:	0ffafa93          	andi	s5,s5,255
    80008a60:	ec5ff06f          	j	80008924 <_ZN11ObjectCache10slab_allocEv+0xc0>
            zero_out(tmp_addr);
    80008a64:	00048593          	mv	a1,s1
    80008a68:	00090513          	mv	a0,s2
    80008a6c:	00000097          	auipc	ra,0x0
    80008a70:	dc4080e7          	jalr	-572(ra) # 80008830 <_ZN11ObjectCache8zero_outEPv>
    for(; tmp_addr + objsize <= end; tmp_addr += objsize){
    80008a74:	01093783          	ld	a5,16(s2)
    80008a78:	00f484b3          	add	s1,s1,a5
    80008a7c:	01093783          	ld	a5,16(s2)
    80008a80:	00f487b3          	add	a5,s1,a5
    80008a84:	f4f9eee3          	bltu	s3,a5,800089e0 <_ZN11ObjectCache10slab_allocEv+0x17c>
        if(ctor)
    80008a88:	04893783          	ld	a5,72(s2)
    80008a8c:	fc078ce3          	beqz	a5,80008a64 <_ZN11ObjectCache10slab_allocEv+0x200>
            ctor(tmp_addr);
    80008a90:	00048513          	mv	a0,s1
    80008a94:	000780e7          	jalr	a5
    80008a98:	fddff06f          	j	80008a74 <_ZN11ObjectCache10slab_allocEv+0x210>
        case NONE: default: return nullptr;
    80008a9c:	00000a13          	li	s4,0
    80008aa0:	f41ff06f          	j	800089e0 <_ZN11ObjectCache10slab_allocEv+0x17c>

0000000080008aa4 <_ZN11ObjectCache9alloc_objEv>:
void* ObjectCache::alloc_obj(){ 
    80008aa4:	fd010113          	addi	sp,sp,-48
    80008aa8:	02113423          	sd	ra,40(sp)
    80008aac:	02813023          	sd	s0,32(sp)
    80008ab0:	00913c23          	sd	s1,24(sp)
    80008ab4:	01213823          	sd	s2,16(sp)
    80008ab8:	01313423          	sd	s3,8(sp)
    80008abc:	01413023          	sd	s4,0(sp)
    80008ac0:	03010413          	addi	s0,sp,48
    80008ac4:	00050913          	mv	s2,a0
    if(part_head){
    80008ac8:	02853483          	ld	s1,40(a0)
    80008acc:	04048a63          	beqz	s1,80008b20 <_ZN11ObjectCache9alloc_objEv+0x7c>
        t = get_list_parent(part_head, Slab, node);
    80008ad0:	f5848493          	addi	s1,s1,-168
    bool was_free = false;
    80008ad4:	00000a13          	li	s4,0
    obj = t->get_obj();
    80008ad8:	00048513          	mv	a0,s1
    80008adc:	00001097          	auipc	ra,0x1
    80008ae0:	e4c080e7          	jalr	-436(ra) # 80009928 <_ZN4Slab7get_objEv>
    80008ae4:	00050993          	mv	s3,a0
    list_update_alloc(t, was_free);
    80008ae8:	000a0613          	mv	a2,s4
    80008aec:	00048593          	mv	a1,s1
    80008af0:	00090513          	mv	a0,s2
    80008af4:	fffff097          	auipc	ra,0xfffff
    80008af8:	5d4080e7          	jalr	1492(ra) # 800080c8 <_ZN11ObjectCache17list_update_allocEP4Slabb>
}
    80008afc:	00098513          	mv	a0,s3
    80008b00:	02813083          	ld	ra,40(sp)
    80008b04:	02013403          	ld	s0,32(sp)
    80008b08:	01813483          	ld	s1,24(sp)
    80008b0c:	01013903          	ld	s2,16(sp)
    80008b10:	00813983          	ld	s3,8(sp)
    80008b14:	00013a03          	ld	s4,0(sp)
    80008b18:	03010113          	addi	sp,sp,48
    80008b1c:	00008067          	ret
        if(free_head){ 
    80008b20:	02053483          	ld	s1,32(a0)
    80008b24:	00048863          	beqz	s1,80008b34 <_ZN11ObjectCache9alloc_objEv+0x90>
            t = get_list_parent(free_head, Slab, node); 
    80008b28:	f5848493          	addi	s1,s1,-168
        was_free = true;
    80008b2c:	00100a13          	li	s4,1
    80008b30:	fa9ff06f          	j	80008ad8 <_ZN11ObjectCache9alloc_objEv+0x34>
            t = slab_alloc(); 
    80008b34:	00000097          	auipc	ra,0x0
    80008b38:	d30080e7          	jalr	-720(ra) # 80008864 <_ZN11ObjectCache10slab_allocEv>
    80008b3c:	00050493          	mv	s1,a0
            if(t == nullptr) { return nullptr; }
    80008b40:	00050663          	beqz	a0,80008b4c <_ZN11ObjectCache9alloc_objEv+0xa8>
        was_free = true;
    80008b44:	00100a13          	li	s4,1
    80008b48:	f91ff06f          	j	80008ad8 <_ZN11ObjectCache9alloc_objEv+0x34>
            if(t == nullptr) { return nullptr; }
    80008b4c:	00050993          	mv	s3,a0
    80008b50:	fadff06f          	j	80008afc <_ZN11ObjectCache9alloc_objEv+0x58>

0000000080008b54 <_ZN11ObjectCachenwEm>:
void* ObjectCache::operator new(size_t size){
    80008b54:	ff010113          	addi	sp,sp,-16
    80008b58:	00113423          	sd	ra,8(sp)
    80008b5c:	00813023          	sd	s0,0(sp)
    80008b60:	01010413          	addi	s0,sp,16
    void* addr = SlabAl::getInstance().objcache_cache.alloc_obj();
    80008b64:	00000097          	auipc	ra,0x0
    80008b68:	7b0080e7          	jalr	1968(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80008b6c:	00000097          	auipc	ra,0x0
    80008b70:	f38080e7          	jalr	-200(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
}
    80008b74:	00813083          	ld	ra,8(sp)
    80008b78:	00013403          	ld	s0,0(sp)
    80008b7c:	01010113          	addi	sp,sp,16
    80008b80:	00008067          	ret

0000000080008b84 <_ZN11ObjectCache8free_objEPv>:
int ObjectCache::free_obj(void* ptr){
    80008b84:	fc010113          	addi	sp,sp,-64
    80008b88:	02113c23          	sd	ra,56(sp)
    80008b8c:	02813823          	sd	s0,48(sp)
    80008b90:	02913423          	sd	s1,40(sp)
    80008b94:	03213023          	sd	s2,32(sp)
    80008b98:	01313c23          	sd	s3,24(sp)
    80008b9c:	01413823          	sd	s4,16(sp)
    80008ba0:	01513423          	sd	s5,8(sp)
    80008ba4:	04010413          	addi	s0,sp,64
    80008ba8:	00050493          	mv	s1,a0
    80008bac:	00058993          	mv	s3,a1
    Slab* slab_meta = *(Slab**)((uint64)ptr & (-Buddy::BLOCK_SIZE));
    80008bb0:	fffff7b7          	lui	a5,0xfffff
    80008bb4:	00f5f7b3          	and	a5,a1,a5
    80008bb8:	0007b903          	ld	s2,0(a5) # fffffffffffff000 <_user_bss_end+0xffffffff7ffe7ff0>
    if(type == BUFF_SLAB){
    80008bbc:	01852703          	lw	a4,24(a0)
    80008bc0:	00400793          	li	a5,4
    80008bc4:	04f70263          	beq	a4,a5,80008c08 <_ZN11ObjectCache8free_objEPv+0x84>
    if(slab_meta->parent != this){
    80008bc8:	00093783          	ld	a5,0(s2)
    80008bcc:	06978c63          	beq	a5,s1,80008c44 <_ZN11ObjectCache8free_objEPv+0xc0>
        error = "Dealocation failed: Object is not from specified cache!!";
    80008bd0:	00007797          	auipc	a5,0x7
    80008bd4:	d2878793          	addi	a5,a5,-728 # 8000f8f8 <CONSOLE_STATUS+0x8e8>
    80008bd8:	00f4b423          	sd	a5,8(s1)
        return 1;
    80008bdc:	00100a13          	li	s4,1
}
    80008be0:	000a0513          	mv	a0,s4
    80008be4:	03813083          	ld	ra,56(sp)
    80008be8:	03013403          	ld	s0,48(sp)
    80008bec:	02813483          	ld	s1,40(sp)
    80008bf0:	02013903          	ld	s2,32(sp)
    80008bf4:	01813983          	ld	s3,24(sp)
    80008bf8:	01013a03          	ld	s4,16(sp)
    80008bfc:	00813a83          	ld	s5,8(sp)
    80008c00:	04010113          	addi	sp,sp,64
    80008c04:	00008067          	ret
        slab_meta = find_slab(ptr, part_head);
    80008c08:	02853603          	ld	a2,40(a0)
    80008c0c:	fffff097          	auipc	ra,0xfffff
    80008c10:	660080e7          	jalr	1632(ra) # 8000826c <_ZN11ObjectCache9find_slabEPvP6list_t>
    80008c14:	00050913          	mv	s2,a0
        if(!slab_meta)
    80008c18:	00050863          	beqz	a0,80008c28 <_ZN11ObjectCache8free_objEPv+0xa4>
        if(!slab_meta){
    80008c1c:	fa0916e3          	bnez	s2,80008bc8 <_ZN11ObjectCache8free_objEPv+0x44>
             return 2;
    80008c20:	00200a13          	li	s4,2
    80008c24:	fbdff06f          	j	80008be0 <_ZN11ObjectCache8free_objEPv+0x5c>
            slab_meta = find_slab(ptr, full_head);
    80008c28:	0304b603          	ld	a2,48(s1)
    80008c2c:	00098593          	mv	a1,s3
    80008c30:	00048513          	mv	a0,s1
    80008c34:	fffff097          	auipc	ra,0xfffff
    80008c38:	638080e7          	jalr	1592(ra) # 8000826c <_ZN11ObjectCache9find_slabEPvP6list_t>
    80008c3c:	00050913          	mv	s2,a0
    80008c40:	fddff06f          	j	80008c1c <_ZN11ObjectCache8free_objEPv+0x98>
    bool full(){ return front == RB_SIZE; }
    80008c44:	08894603          	lbu	a2,136(s2)
    80008c48:	f8060613          	addi	a2,a2,-128
    80008c4c:	00163a93          	seqz	s5,a2
    int ind = slab_meta->put_obj(ptr);
    80008c50:	00098593          	mv	a1,s3
    80008c54:	00090513          	mv	a0,s2
    80008c58:	00001097          	auipc	ra,0x1
    80008c5c:	db0080e7          	jalr	-592(ra) # 80009a08 <_ZN4Slab7put_objEPv>
    80008c60:	00050a13          	mv	s4,a0
    if(ind){
    80008c64:	02051663          	bnez	a0,80008c90 <_ZN11ObjectCache8free_objEPv+0x10c>
    }else if(ctor)
    80008c68:	0484b783          	ld	a5,72(s1)
    80008c6c:	02078a63          	beqz	a5,80008ca0 <_ZN11ObjectCache8free_objEPv+0x11c>
        ctor(ptr);
    80008c70:	00098513          	mv	a0,s3
    80008c74:	000780e7          	jalr	a5
    list_update_free(slab_meta, was_full);
    80008c78:	000a8613          	mv	a2,s5
    80008c7c:	00090593          	mv	a1,s2
    80008c80:	00048513          	mv	a0,s1
    80008c84:	fffff097          	auipc	ra,0xfffff
    80008c88:	4f4080e7          	jalr	1268(ra) # 80008178 <_ZN11ObjectCache16list_update_freeEP4Slabb>
    return 0;
    80008c8c:	f55ff06f          	j	80008be0 <_ZN11ObjectCache8free_objEPv+0x5c>
        error = "Deallocation failed: invalid deallocation address!";
    80008c90:	00007797          	auipc	a5,0x7
    80008c94:	ca878793          	addi	a5,a5,-856 # 8000f938 <CONSOLE_STATUS+0x928>
    80008c98:	00f4b423          	sd	a5,8(s1)
        return ind;
    80008c9c:	f45ff06f          	j	80008be0 <_ZN11ObjectCache8free_objEPv+0x5c>
        zero_out(ptr);
    80008ca0:	00098593          	mv	a1,s3
    80008ca4:	00048513          	mv	a0,s1
    80008ca8:	00000097          	auipc	ra,0x0
    80008cac:	b88080e7          	jalr	-1144(ra) # 80008830 <_ZN11ObjectCache8zero_outEPv>
    80008cb0:	fc9ff06f          	j	80008c78 <_ZN11ObjectCache8free_objEPv+0xf4>

0000000080008cb4 <_ZN11ObjectCachedlEPv>:
void ObjectCache::operator delete(void* addr){
    80008cb4:	fe010113          	addi	sp,sp,-32
    80008cb8:	00113c23          	sd	ra,24(sp)
    80008cbc:	00813823          	sd	s0,16(sp)
    80008cc0:	00913423          	sd	s1,8(sp)
    80008cc4:	02010413          	addi	s0,sp,32
    80008cc8:	00050493          	mv	s1,a0
    SlabAl::getInstance().objcache_cache.free_obj(addr);
    80008ccc:	00000097          	auipc	ra,0x0
    80008cd0:	648080e7          	jalr	1608(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80008cd4:	00048593          	mv	a1,s1
    80008cd8:	00000097          	auipc	ra,0x0
    80008cdc:	eac080e7          	jalr	-340(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
}
    80008ce0:	01813083          	ld	ra,24(sp)
    80008ce4:	01013403          	ld	s0,16(sp)
    80008ce8:	00813483          	ld	s1,8(sp)
    80008cec:	02010113          	addi	sp,sp,32
    80008cf0:	00008067          	ret

0000000080008cf4 <_ZN11ObjectCache6shrinkEv>:
int ObjectCache::shrink(){
    80008cf4:	fd010113          	addi	sp,sp,-48
    80008cf8:	02113423          	sd	ra,40(sp)
    80008cfc:	02813023          	sd	s0,32(sp)
    80008d00:	00913c23          	sd	s1,24(sp)
    80008d04:	01213823          	sd	s2,16(sp)
    80008d08:	03010413          	addi	s0,sp,48
    80008d0c:	00050493          	mv	s1,a0
    if(!free_head){
    80008d10:	02053783          	ld	a5,32(a0)
    80008d14:	02079863          	bnez	a5,80008d44 <_ZN11ObjectCache6shrinkEv+0x50>
        error = "No free slabs!";
    80008d18:	00007797          	auipc	a5,0x7
    80008d1c:	c5878793          	addi	a5,a5,-936 # 8000f970 <CONSOLE_STATUS+0x960>
    80008d20:	00f53423          	sd	a5,8(a0)
        return 1;
    80008d24:	00100513          	li	a0,1
    80008d28:	0780006f          	j	80008da0 <_ZN11ObjectCache6shrinkEv+0xac>
            SlabAllocator::getInstance().slab_cache.free_obj(slab);
    80008d2c:	00000097          	auipc	ra,0x0
    80008d30:	5e8080e7          	jalr	1512(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80008d34:	00090593          	mv	a1,s2
    80008d38:	05850513          	addi	a0,a0,88
    80008d3c:	00000097          	auipc	ra,0x0
    80008d40:	e48080e7          	jalr	-440(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
    while(free_head){
    80008d44:	0204b503          	ld	a0,32(s1)
    80008d48:	04050a63          	beqz	a0,80008d9c <_ZN11ObjectCache6shrinkEv+0xa8>
        Slab* slab = get_list_parent(free_head, Slab, node);
    80008d4c:	f5850913          	addi	s2,a0,-168
        free_head = remove(free_head);
    80008d50:	00003097          	auipc	ra,0x3
    80008d54:	8e4080e7          	jalr	-1820(ra) # 8000b634 <_Z6removeP6list_t>
    80008d58:	02a4b023          	sd	a0,32(s1)
        get_slab_size(&buddy_level);
    80008d5c:	fdf40593          	addi	a1,s0,-33
    80008d60:	00048513          	mv	a0,s1
    80008d64:	fffff097          	auipc	ra,0xfffff
    80008d68:	1b0080e7          	jalr	432(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
        Buddy::getInstance().mem_free(slab->addr_start, buddy_level);
    80008d6c:	ffffe097          	auipc	ra,0xffffe
    80008d70:	b8c080e7          	jalr	-1140(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    80008d74:	fdf44603          	lbu	a2,-33(s0)
    80008d78:	0a093583          	ld	a1,160(s2)
    80008d7c:	ffffe097          	auipc	ra,0xffffe
    80008d80:	760080e7          	jalr	1888(ra) # 800074dc <_ZN5Buddy8mem_freeEPvh>
        if(type == BUFF_SLAB || type == OFF_SLAB)
    80008d84:	0184a783          	lw	a5,24(s1)
    80008d88:	00400713          	li	a4,4
    80008d8c:	fae780e3          	beq	a5,a4,80008d2c <_ZN11ObjectCache6shrinkEv+0x38>
    80008d90:	00100713          	li	a4,1
    80008d94:	fae798e3          	bne	a5,a4,80008d44 <_ZN11ObjectCache6shrinkEv+0x50>
    80008d98:	f95ff06f          	j	80008d2c <_ZN11ObjectCache6shrinkEv+0x38>
    return 0;
    80008d9c:	00000513          	li	a0,0
}
    80008da0:	02813083          	ld	ra,40(sp)
    80008da4:	02013403          	ld	s0,32(sp)
    80008da8:	01813483          	ld	s1,24(sp)
    80008dac:	01013903          	ld	s2,16(sp)
    80008db0:	03010113          	addi	sp,sp,48
    80008db4:	00008067          	ret

0000000080008db8 <_ZN11ObjectCache10free_slabsEP6list_t>:
void ObjectCache::free_slabs(list_t* head){
    80008db8:	fc010113          	addi	sp,sp,-64
    80008dbc:	02113c23          	sd	ra,56(sp)
    80008dc0:	02813823          	sd	s0,48(sp)
    80008dc4:	02913423          	sd	s1,40(sp)
    80008dc8:	03213023          	sd	s2,32(sp)
    80008dcc:	01313c23          	sd	s3,24(sp)
    80008dd0:	04010413          	addi	s0,sp,64
    80008dd4:	00050993          	mv	s3,a0
    80008dd8:	00058493          	mv	s1,a1
    80008ddc:	01c0006f          	j	80008df8 <_ZN11ObjectCache10free_slabsEP6list_t+0x40>
            SlabAllocator::getInstance().slab_cache.free_obj(slab);
    80008de0:	00000097          	auipc	ra,0x0
    80008de4:	534080e7          	jalr	1332(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80008de8:	00090593          	mv	a1,s2
    80008dec:	05850513          	addi	a0,a0,88
    80008df0:	00000097          	auipc	ra,0x0
    80008df4:	d94080e7          	jalr	-620(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
    while(head){
    80008df8:	04048c63          	beqz	s1,80008e50 <_ZN11ObjectCache10free_slabsEP6list_t+0x98>
        Slab* slab = get_list_parent(head, Slab, node);
    80008dfc:	f5848913          	addi	s2,s1,-168
        head = remove(head);
    80008e00:	00048513          	mv	a0,s1
    80008e04:	00003097          	auipc	ra,0x3
    80008e08:	830080e7          	jalr	-2000(ra) # 8000b634 <_Z6removeP6list_t>
    80008e0c:	00050493          	mv	s1,a0
        get_slab_size(&buddy_level);
    80008e10:	fcf40593          	addi	a1,s0,-49
    80008e14:	00098513          	mv	a0,s3
    80008e18:	fffff097          	auipc	ra,0xfffff
    80008e1c:	0fc080e7          	jalr	252(ra) # 80007f14 <_ZN11ObjectCache13get_slab_sizeEPh>
        Buddy::getInstance().mem_free(slab->addr_start, buddy_level);
    80008e20:	ffffe097          	auipc	ra,0xffffe
    80008e24:	ad8080e7          	jalr	-1320(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    80008e28:	fcf44603          	lbu	a2,-49(s0)
    80008e2c:	0a093583          	ld	a1,160(s2)
    80008e30:	ffffe097          	auipc	ra,0xffffe
    80008e34:	6ac080e7          	jalr	1708(ra) # 800074dc <_ZN5Buddy8mem_freeEPvh>
        if(type == BUFF_SLAB || type == OFF_SLAB)
    80008e38:	0189a783          	lw	a5,24(s3)
    80008e3c:	00400713          	li	a4,4
    80008e40:	fae780e3          	beq	a5,a4,80008de0 <_ZN11ObjectCache10free_slabsEP6list_t+0x28>
    80008e44:	00100713          	li	a4,1
    80008e48:	fae798e3          	bne	a5,a4,80008df8 <_ZN11ObjectCache10free_slabsEP6list_t+0x40>
    80008e4c:	f95ff06f          	j	80008de0 <_ZN11ObjectCache10free_slabsEP6list_t+0x28>
}
    80008e50:	03813083          	ld	ra,56(sp)
    80008e54:	03013403          	ld	s0,48(sp)
    80008e58:	02813483          	ld	s1,40(sp)
    80008e5c:	02013903          	ld	s2,32(sp)
    80008e60:	01813983          	ld	s3,24(sp)
    80008e64:	04010113          	addi	sp,sp,64
    80008e68:	00008067          	ret

0000000080008e6c <_ZN11ObjectCacheD1Ev>:
ObjectCache::~ObjectCache(){
    80008e6c:	fe010113          	addi	sp,sp,-32
    80008e70:	00113c23          	sd	ra,24(sp)
    80008e74:	00813823          	sd	s0,16(sp)
    80008e78:	00913423          	sd	s1,8(sp)
    80008e7c:	02010413          	addi	s0,sp,32
    80008e80:	00050493          	mv	s1,a0
    free_slabs(free_head);
    80008e84:	02053583          	ld	a1,32(a0)
    80008e88:	00000097          	auipc	ra,0x0
    80008e8c:	f30080e7          	jalr	-208(ra) # 80008db8 <_ZN11ObjectCache10free_slabsEP6list_t>
    free_slabs(part_head);
    80008e90:	0284b583          	ld	a1,40(s1)
    80008e94:	00048513          	mv	a0,s1
    80008e98:	00000097          	auipc	ra,0x0
    80008e9c:	f20080e7          	jalr	-224(ra) # 80008db8 <_ZN11ObjectCache10free_slabsEP6list_t>
    free_slabs(full_head);
    80008ea0:	0304b583          	ld	a1,48(s1)
    80008ea4:	00048513          	mv	a0,s1
    80008ea8:	00000097          	auipc	ra,0x0
    80008eac:	f10080e7          	jalr	-240(ra) # 80008db8 <_ZN11ObjectCache10free_slabsEP6list_t>
}
    80008eb0:	01813083          	ld	ra,24(sp)
    80008eb4:	01013403          	ld	s0,16(sp)
    80008eb8:	00813483          	ld	s1,8(sp)
    80008ebc:	02010113          	addi	sp,sp,32
    80008ec0:	00008067          	ret

0000000080008ec4 <_Z17kmem_cache_createPKcmPFvPvES3_>:

// void kmem_init(void *space, int block_num);

kmem_cache_t *kmem_cache_create(const char *name, size_t size,
    void (*ctor)(void *),
    void (*dtor)(void *)){ // Allocate cache
    80008ec4:	fc010113          	addi	sp,sp,-64
    80008ec8:	02113c23          	sd	ra,56(sp)
    80008ecc:	02813823          	sd	s0,48(sp)
    80008ed0:	02913423          	sd	s1,40(sp)
    80008ed4:	03213023          	sd	s2,32(sp)
    80008ed8:	01313c23          	sd	s3,24(sp)
    80008edc:	01413823          	sd	s4,16(sp)
    80008ee0:	01513423          	sd	s5,8(sp)
    80008ee4:	04010413          	addi	s0,sp,64
    80008ee8:	00050913          	mv	s2,a0
    80008eec:	00058993          	mv	s3,a1
    80008ef0:	00060a13          	mv	s4,a2
    80008ef4:	00068a93          	mv	s5,a3
    
    return new ObjectCache(name, size, ctor, dtor);
    80008ef8:	05800513          	li	a0,88
    80008efc:	00000097          	auipc	ra,0x0
    80008f00:	c58080e7          	jalr	-936(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80008f04:	00050493          	mv	s1,a0
    80008f08:	04050063          	beqz	a0,80008f48 <_Z17kmem_cache_createPKcmPFvPvES3_+0x84>
    80008f0c:	00000793          	li	a5,0
    80008f10:	000a8713          	mv	a4,s5
    80008f14:	000a0693          	mv	a3,s4
    80008f18:	00098613          	mv	a2,s3
    80008f1c:	00090593          	mv	a1,s2
    80008f20:	fffff097          	auipc	ra,0xfffff
    80008f24:	0e8080e7          	jalr	232(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80008f28:	0200006f          	j	80008f48 <_Z17kmem_cache_createPKcmPFvPvES3_+0x84>
    80008f2c:	00050913          	mv	s2,a0
    80008f30:	00048513          	mv	a0,s1
    80008f34:	00000097          	auipc	ra,0x0
    80008f38:	d80080e7          	jalr	-640(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80008f3c:	00090513          	mv	a0,s2
    80008f40:	0000d097          	auipc	ra,0xd
    80008f44:	638080e7          	jalr	1592(ra) # 80016578 <_Unwind_Resume>

}
    80008f48:	00048513          	mv	a0,s1
    80008f4c:	03813083          	ld	ra,56(sp)
    80008f50:	03013403          	ld	s0,48(sp)
    80008f54:	02813483          	ld	s1,40(sp)
    80008f58:	02013903          	ld	s2,32(sp)
    80008f5c:	01813983          	ld	s3,24(sp)
    80008f60:	01013a03          	ld	s4,16(sp)
    80008f64:	00813a83          	ld	s5,8(sp)
    80008f68:	04010113          	addi	sp,sp,64
    80008f6c:	00008067          	ret

0000000080008f70 <_Z17kmem_cache_shrinkP11ObjectCache>:
int kmem_cache_shrink(kmem_cache_t *cachep){ // Shrink cache
    80008f70:	ff010113          	addi	sp,sp,-16
    80008f74:	00113423          	sd	ra,8(sp)
    80008f78:	00813023          	sd	s0,0(sp)
    80008f7c:	01010413          	addi	s0,sp,16
    return cachep->shrink();
    80008f80:	00000097          	auipc	ra,0x0
    80008f84:	d74080e7          	jalr	-652(ra) # 80008cf4 <_ZN11ObjectCache6shrinkEv>
}
    80008f88:	00813083          	ld	ra,8(sp)
    80008f8c:	00013403          	ld	s0,0(sp)
    80008f90:	01010113          	addi	sp,sp,16
    80008f94:	00008067          	ret

0000000080008f98 <_Z16kmem_cache_allocP11ObjectCache>:
void *kmem_cache_alloc(kmem_cache_t *cachep){// Allocate one object from cache
    80008f98:	ff010113          	addi	sp,sp,-16
    80008f9c:	00113423          	sd	ra,8(sp)
    80008fa0:	00813023          	sd	s0,0(sp)
    80008fa4:	01010413          	addi	s0,sp,16
    return cachep->alloc_obj();
    80008fa8:	00000097          	auipc	ra,0x0
    80008fac:	afc080e7          	jalr	-1284(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
}
    80008fb0:	00813083          	ld	ra,8(sp)
    80008fb4:	00013403          	ld	s0,0(sp)
    80008fb8:	01010113          	addi	sp,sp,16
    80008fbc:	00008067          	ret

0000000080008fc0 <_Z15kmem_cache_freeP11ObjectCachePv>:
void kmem_cache_free(kmem_cache_t *cachep, void *objp){ // Deallocate one object from cache
    80008fc0:	ff010113          	addi	sp,sp,-16
    80008fc4:	00113423          	sd	ra,8(sp)
    80008fc8:	00813023          	sd	s0,0(sp)
    80008fcc:	01010413          	addi	s0,sp,16
    cachep->free_obj(objp);
    80008fd0:	00000097          	auipc	ra,0x0
    80008fd4:	bb4080e7          	jalr	-1100(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
}
    80008fd8:	00813083          	ld	ra,8(sp)
    80008fdc:	00013403          	ld	s0,0(sp)
    80008fe0:	01010113          	addi	sp,sp,16
    80008fe4:	00008067          	ret

0000000080008fe8 <_Z7kmallocm>:
void *kmalloc(size_t size){ // Alloacate one small memry buffer
    80008fe8:	fe010113          	addi	sp,sp,-32
    80008fec:	00113c23          	sd	ra,24(sp)
    80008ff0:	00813823          	sd	s0,16(sp)
    80008ff4:	00913423          	sd	s1,8(sp)
    80008ff8:	02010413          	addi	s0,sp,32
    80008ffc:	00050493          	mv	s1,a0
    return SlabAllocator::getInstance().kmalloc(size);
    80009000:	00000097          	auipc	ra,0x0
    80009004:	314080e7          	jalr	788(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80009008:	00048593          	mv	a1,s1
    8000900c:	00000097          	auipc	ra,0x0
    80009010:	40c080e7          	jalr	1036(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
}
    80009014:	01813083          	ld	ra,24(sp)
    80009018:	01013403          	ld	s0,16(sp)
    8000901c:	00813483          	ld	s1,8(sp)
    80009020:	02010113          	addi	sp,sp,32
    80009024:	00008067          	ret

0000000080009028 <_Z5kfreePv>:
void kfree(void *objp){ // Deallocate one small memory buffer
    80009028:	fe010113          	addi	sp,sp,-32
    8000902c:	00113c23          	sd	ra,24(sp)
    80009030:	00813823          	sd	s0,16(sp)
    80009034:	00913423          	sd	s1,8(sp)
    80009038:	02010413          	addi	s0,sp,32
    8000903c:	00050493          	mv	s1,a0
    SlabAllocator::getInstance().kfree(objp);
    80009040:	00000097          	auipc	ra,0x0
    80009044:	2d4080e7          	jalr	724(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80009048:	00048593          	mv	a1,s1
    8000904c:	00000097          	auipc	ra,0x0
    80009050:	450080e7          	jalr	1104(ra) # 8000949c <_ZN13SlabAllocator5kfreeEPv>
}
    80009054:	01813083          	ld	ra,24(sp)
    80009058:	01013403          	ld	s0,16(sp)
    8000905c:	00813483          	ld	s1,8(sp)
    80009060:	02010113          	addi	sp,sp,32
    80009064:	00008067          	ret

0000000080009068 <_Z18kmem_cache_destroyP11ObjectCache>:
void kmem_cache_destroy(kmem_cache_t *cachep){// Deallocate cache
    delete cachep;
    80009068:	04050263          	beqz	a0,800090ac <_Z18kmem_cache_destroyP11ObjectCache+0x44>
void kmem_cache_destroy(kmem_cache_t *cachep){// Deallocate cache
    8000906c:	fe010113          	addi	sp,sp,-32
    80009070:	00113c23          	sd	ra,24(sp)
    80009074:	00813823          	sd	s0,16(sp)
    80009078:	00913423          	sd	s1,8(sp)
    8000907c:	02010413          	addi	s0,sp,32
    80009080:	00050493          	mv	s1,a0
    delete cachep;
    80009084:	00000097          	auipc	ra,0x0
    80009088:	de8080e7          	jalr	-536(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    8000908c:	00048513          	mv	a0,s1
    80009090:	00000097          	auipc	ra,0x0
    80009094:	c24080e7          	jalr	-988(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
}
    80009098:	01813083          	ld	ra,24(sp)
    8000909c:	01013403          	ld	s0,16(sp)
    800090a0:	00813483          	ld	s1,8(sp)
    800090a4:	02010113          	addi	sp,sp,32
    800090a8:	00008067          	ret
    800090ac:	00008067          	ret

00000000800090b0 <_Z15kmem_cache_infoP11ObjectCache>:
void kmem_cache_info(kmem_cache_t *cachep){ // Print cache info
    800090b0:	ff010113          	addi	sp,sp,-16
    800090b4:	00113423          	sd	ra,8(sp)
    800090b8:	00813023          	sd	s0,0(sp)
    800090bc:	01010413          	addi	s0,sp,16
    cachep->printInfo();
    800090c0:	00000593          	li	a1,0
    800090c4:	fffff097          	auipc	ra,0xfffff
    800090c8:	420080e7          	jalr	1056(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
}
    800090cc:	00813083          	ld	ra,8(sp)
    800090d0:	00013403          	ld	s0,0(sp)
    800090d4:	01010113          	addi	sp,sp,16
    800090d8:	00008067          	ret

00000000800090dc <_Z16kmem_cache_errorP11ObjectCache>:
int kmem_cache_error(kmem_cache_t *cachep){ // Print error message
    800090dc:	ff010113          	addi	sp,sp,-16
    800090e0:	00113423          	sd	ra,8(sp)
    800090e4:	00813023          	sd	s0,0(sp)
    800090e8:	01010413          	addi	s0,sp,16
    return cachep->printError();
    800090ec:	fffff097          	auipc	ra,0xfffff
    800090f0:	708080e7          	jalr	1800(ra) # 800087f4 <_ZN11ObjectCache10printErrorEv>
}
    800090f4:	00813083          	ld	ra,8(sp)
    800090f8:	00013403          	ld	s0,0(sp)
    800090fc:	01010113          	addi	sp,sp,16
    80009100:	00008067          	ret

0000000080009104 <_ZN13SlabAllocatorC1Ev>:
        , "smb_cache_14", "smb_cache_15", "smb_cache_16"
        , "smb_cache_17" };



SlabAllocator::SlabAllocator():objcache_cache("objcache_cache", sizeof(ObjectCache),nullptr,nullptr),
    80009104:	f6010113          	addi	sp,sp,-160
    80009108:	08113c23          	sd	ra,152(sp)
    8000910c:	08813823          	sd	s0,144(sp)
    80009110:	08913423          	sd	s1,136(sp)
    80009114:	09213023          	sd	s2,128(sp)
    80009118:	07313c23          	sd	s3,120(sp)
    8000911c:	07413823          	sd	s4,112(sp)
    80009120:	07513423          	sd	s5,104(sp)
    80009124:	0a010413          	addi	s0,sp,160
    80009128:	00050993          	mv	s3,a0
    slab_cache("slab_meta_cache", sizeof(Slab), nullptr, nullptr, SMT::SLAB_SLAB){
    8000912c:	00000793          	li	a5,0
    80009130:	00000713          	li	a4,0
    80009134:	00000693          	li	a3,0
    80009138:	05800613          	li	a2,88
    8000913c:	00007597          	auipc	a1,0x7
    80009140:	84458593          	addi	a1,a1,-1980 # 8000f980 <CONSOLE_STATUS+0x970>
    80009144:	fffff097          	auipc	ra,0xfffff
    80009148:	ec4080e7          	jalr	-316(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    8000914c:	05898a93          	addi	s5,s3,88
    80009150:	00200793          	li	a5,2
    80009154:	00000713          	li	a4,0
    80009158:	00000693          	li	a3,0
    8000915c:	0b800613          	li	a2,184
    80009160:	00007597          	auipc	a1,0x7
    80009164:	83058593          	addi	a1,a1,-2000 # 8000f990 <CONSOLE_STATUS+0x980>
    80009168:	000a8513          	mv	a0,s5
    8000916c:	fffff097          	auipc	ra,0xfffff
    80009170:	e9c080e7          	jalr	-356(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009174:	0b098a13          	addi	s4,s3,176
    80009178:	000a0913          	mv	s2,s4
    8000917c:	00c00493          	li	s1,12
    80009180:	00c0006f          	j	8000918c <_ZN13SlabAllocatorC1Ev+0x88>
    80009184:	05890913          	addi	s2,s2,88
    80009188:	fff48493          	addi	s1,s1,-1
    8000918c:	0004ce63          	bltz	s1,800091a8 <_ZN13SlabAllocatorC1Ev+0xa4>
        SLAB_SLAB ,
        ON_SLAB,
        BUFF_SLAB
    };

    ObjectCache() = default;
    80009190:	00000613          	li	a2,0
    80009194:	00000593          	li	a1,0
    80009198:	03890513          	addi	a0,s2,56
    8000919c:	00002097          	auipc	ra,0x2
    800091a0:	478080e7          	jalr	1144(ra) # 8000b614 <_ZN6list_tC1EPS_S0_>
    800091a4:	fe1ff06f          	j	80009184 <_ZN13SlabAllocatorC1Ev+0x80>

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    800091a8:	00500913          	li	s2,5
    800091ac:	0780006f          	j	80009224 <_ZN13SlabAllocatorC1Ev+0x120>
        smb_caches[i-MIN_BUFFER_ORDER] = 
    800091b0:	05800793          	li	a5,88
    800091b4:	02f487b3          	mul	a5,s1,a5
    800091b8:	00f987b3          	add	a5,s3,a5
    800091bc:	f6843703          	ld	a4,-152(s0)
    800091c0:	0ae7b823          	sd	a4,176(a5)
    800091c4:	f7043703          	ld	a4,-144(s0)
    800091c8:	0ae7bc23          	sd	a4,184(a5)
    800091cc:	f7843703          	ld	a4,-136(s0)
    800091d0:	0ce7b023          	sd	a4,192(a5)
    800091d4:	f8043703          	ld	a4,-128(s0)
    800091d8:	0ce7b423          	sd	a4,200(a5)
    800091dc:	f8843703          	ld	a4,-120(s0)
    800091e0:	0ce7b823          	sd	a4,208(a5)
    800091e4:	f9043703          	ld	a4,-112(s0)
    800091e8:	0ce7bc23          	sd	a4,216(a5)
    800091ec:	f9843703          	ld	a4,-104(s0)
    800091f0:	0ee7b023          	sd	a4,224(a5)
    800091f4:	fa043703          	ld	a4,-96(s0)
    800091f8:	0ee7b423          	sd	a4,232(a5)
    800091fc:	fa843703          	ld	a4,-88(s0)
    80009200:	0ee7b823          	sd	a4,240(a5)
    80009204:	fb043703          	ld	a4,-80(s0)
    80009208:	0ee7bc23          	sd	a4,248(a5)
    8000920c:	fb843703          	ld	a4,-72(s0)
    80009210:	10e7b023          	sd	a4,256(a5)
            ObjectCache(buff_cache_names[i-MIN_BUFFER_ORDER], 1 << i
    80009214:	f6840513          	addi	a0,s0,-152
    80009218:	00000097          	auipc	ra,0x0
    8000921c:	c54080e7          	jalr	-940(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    80009220:	0019091b          	addiw	s2,s2,1
    80009224:	01100793          	li	a5,17
    80009228:	0d27c463          	blt	a5,s2,800092f0 <_ZN13SlabAllocatorC1Ev+0x1ec>
            ObjectCache(buff_cache_names[i-MIN_BUFFER_ORDER], 1 << i
    8000922c:	ffb9049b          	addiw	s1,s2,-5
    80009230:	00349793          	slli	a5,s1,0x3
    80009234:	0000b597          	auipc	a1,0xb
    80009238:	9f458593          	addi	a1,a1,-1548 # 80013c28 <_ZN13SlabAllocator16buff_cache_namesE>
    8000923c:	00f585b3          	add	a1,a1,a5
    80009240:	00400793          	li	a5,4
    80009244:	00000713          	li	a4,0
    80009248:	00000693          	li	a3,0
    8000924c:	00100613          	li	a2,1
    80009250:	0126163b          	sllw	a2,a2,s2
    80009254:	0005b583          	ld	a1,0(a1)
    80009258:	f6840513          	addi	a0,s0,-152
    8000925c:	fffff097          	auipc	ra,0xfffff
    80009260:	dac080e7          	jalr	-596(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009264:	f4dff06f          	j	800091b0 <_ZN13SlabAllocatorC1Ev+0xac>
    80009268:	00050913          	mv	s2,a0
    8000926c:	020a0863          	beqz	s4,8000929c <_ZN13SlabAllocatorC1Ev+0x198>
    slab_cache("slab_meta_cache", sizeof(Slab), nullptr, nullptr, SMT::SLAB_SLAB){
    80009270:	00c00793          	li	a5,12
    80009274:	409784b3          	sub	s1,a5,s1
    80009278:	05800793          	li	a5,88
    8000927c:	02f484b3          	mul	s1,s1,a5
    80009280:	009a04b3          	add	s1,s4,s1
    80009284:	01448c63          	beq	s1,s4,8000929c <_ZN13SlabAllocatorC1Ev+0x198>
    80009288:	fa848493          	addi	s1,s1,-88
    8000928c:	00048513          	mv	a0,s1
    80009290:	00000097          	auipc	ra,0x0
    80009294:	bdc080e7          	jalr	-1060(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    80009298:	fedff06f          	j	80009284 <_ZN13SlabAllocatorC1Ev+0x180>
    8000929c:	00090493          	mv	s1,s2
    800092a0:	000a8513          	mv	a0,s5
    800092a4:	00000097          	auipc	ra,0x0
    800092a8:	bc8080e7          	jalr	-1080(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    800092ac:	00098513          	mv	a0,s3
    800092b0:	00000097          	auipc	ra,0x0
    800092b4:	bbc080e7          	jalr	-1092(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    800092b8:	00048513          	mv	a0,s1
    800092bc:	0000d097          	auipc	ra,0xd
    800092c0:	2bc080e7          	jalr	700(ra) # 80016578 <_Unwind_Resume>
    800092c4:	00050493          	mv	s1,a0
    800092c8:	fc0a0ce3          	beqz	s4,800092a0 <_ZN13SlabAllocatorC1Ev+0x19c>
    800092cc:	52898913          	addi	s2,s3,1320
    800092d0:	fd4908e3          	beq	s2,s4,800092a0 <_ZN13SlabAllocatorC1Ev+0x19c>
    800092d4:	fa890913          	addi	s2,s2,-88
    800092d8:	00090513          	mv	a0,s2
    800092dc:	00000097          	auipc	ra,0x0
    800092e0:	b90080e7          	jalr	-1136(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    800092e4:	fedff06f          	j	800092d0 <_ZN13SlabAllocatorC1Ev+0x1cc>
    800092e8:	00050493          	mv	s1,a0
    800092ec:	fc1ff06f          	j	800092ac <_ZN13SlabAllocatorC1Ev+0x1a8>
                , nullptr, nullptr, SMT::BUFF_SLAB);

}
    800092f0:	09813083          	ld	ra,152(sp)
    800092f4:	09013403          	ld	s0,144(sp)
    800092f8:	08813483          	ld	s1,136(sp)
    800092fc:	08013903          	ld	s2,128(sp)
    80009300:	07813983          	ld	s3,120(sp)
    80009304:	07013a03          	ld	s4,112(sp)
    80009308:	06813a83          	ld	s5,104(sp)
    8000930c:	0a010113          	addi	sp,sp,160
    80009310:	00008067          	ret

0000000080009314 <_ZN13SlabAllocator11getInstanceEv>:



SlabAllocator& SlabAllocator::getInstance(){
    
    if(!allocator) { allocator = new SlabAllocator; }
    80009314:	0000c797          	auipc	a5,0xc
    80009318:	0d478793          	addi	a5,a5,212 # 800153e8 <_ZN13SlabAllocator9allocatorE>
    8000931c:	0007b783          	ld	a5,0(a5)
    80009320:	00078a63          	beqz	a5,80009334 <_ZN13SlabAllocator11getInstanceEv+0x20>

    return *allocator;
}
    80009324:	0000c797          	auipc	a5,0xc
    80009328:	0c478793          	addi	a5,a5,196 # 800153e8 <_ZN13SlabAllocator9allocatorE>
    8000932c:	0007b503          	ld	a0,0(a5)
    80009330:	00008067          	ret
SlabAllocator& SlabAllocator::getInstance(){
    80009334:	fe010113          	addi	sp,sp,-32
    80009338:	00113c23          	sd	ra,24(sp)
    8000933c:	00813823          	sd	s0,16(sp)
    80009340:	00913423          	sd	s1,8(sp)
    80009344:	02010413          	addi	s0,sp,32
    __NOALLOC_OPERATORS__
    80009348:	53000513          	li	a0,1328
    8000934c:	fffff097          	auipc	ra,0xfffff
    80009350:	b18080e7          	jalr	-1256(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    80009354:	00050493          	mv	s1,a0
    if(!allocator) { allocator = new SlabAllocator; }
    80009358:	00050663          	beqz	a0,80009364 <_ZN13SlabAllocator11getInstanceEv+0x50>
    8000935c:	00000097          	auipc	ra,0x0
    80009360:	da8080e7          	jalr	-600(ra) # 80009104 <_ZN13SlabAllocatorC1Ev>
    80009364:	0000c797          	auipc	a5,0xc
    80009368:	0897b223          	sd	s1,132(a5) # 800153e8 <_ZN13SlabAllocator9allocatorE>
}
    8000936c:	0000c797          	auipc	a5,0xc
    80009370:	07c78793          	addi	a5,a5,124 # 800153e8 <_ZN13SlabAllocator9allocatorE>
    80009374:	0007b503          	ld	a0,0(a5)
    80009378:	01813083          	ld	ra,24(sp)
    8000937c:	01013403          	ld	s0,16(sp)
    80009380:	00813483          	ld	s1,8(sp)
    80009384:	02010113          	addi	sp,sp,32
    80009388:	00008067          	ret

000000008000938c <_ZN13SlabAllocator11print_stateEc>:



void SlabAllocator::print_state(char flags){
    8000938c:	fd010113          	addi	sp,sp,-48
    80009390:	02113423          	sd	ra,40(sp)
    80009394:	02813023          	sd	s0,32(sp)
    80009398:	00913c23          	sd	s1,24(sp)
    8000939c:	01213823          	sd	s2,16(sp)
    800093a0:	01313423          	sd	s3,8(sp)
    800093a4:	03010413          	addi	s0,sp,48
    800093a8:	00050913          	mv	s2,a0
    800093ac:	00058993          	mv	s3,a1

    objcache_cache.printInfo(flags);
    800093b0:	fffff097          	auipc	ra,0xfffff
    800093b4:	134080e7          	jalr	308(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
    slab_cache.printInfo(flags);
    800093b8:	00098593          	mv	a1,s3
    800093bc:	05890513          	addi	a0,s2,88
    800093c0:	fffff097          	auipc	ra,0xfffff
    800093c4:	124080e7          	jalr	292(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>

    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    800093c8:	00500493          	li	s1,5
    800093cc:	0280006f          	j	800093f4 <_ZN13SlabAllocator11print_stateEc+0x68>
        smb_caches[i - MIN_BUFFER_ORDER].printInfo(flags);
    800093d0:	ffb4851b          	addiw	a0,s1,-5
    800093d4:	05800793          	li	a5,88
    800093d8:	02f50533          	mul	a0,a0,a5
    800093dc:	0b050513          	addi	a0,a0,176
    800093e0:	00098593          	mv	a1,s3
    800093e4:	00a90533          	add	a0,s2,a0
    800093e8:	fffff097          	auipc	ra,0xfffff
    800093ec:	0fc080e7          	jalr	252(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
    for(int i = MIN_BUFFER_ORDER; i <= MAX_BUFFER_ORDER; i++)
    800093f0:	0014849b          	addiw	s1,s1,1
    800093f4:	01100793          	li	a5,17
    800093f8:	fc97dce3          	bge	a5,s1,800093d0 <_ZN13SlabAllocator11print_stateEc+0x44>

}
    800093fc:	02813083          	ld	ra,40(sp)
    80009400:	02013403          	ld	s0,32(sp)
    80009404:	01813483          	ld	s1,24(sp)
    80009408:	01013903          	ld	s2,16(sp)
    8000940c:	00813983          	ld	s3,8(sp)
    80009410:	03010113          	addi	sp,sp,48
    80009414:	00008067          	ret

0000000080009418 <_ZN13SlabAllocator7kmallocEm>:



void* SlabAllocator::kmalloc(size_t size){
    if(size == 0)
    80009418:	06058a63          	beqz	a1,8000948c <_ZN13SlabAllocator7kmallocEm+0x74>
void* SlabAllocator::kmalloc(size_t size){
    8000941c:	fe010113          	addi	sp,sp,-32
    80009420:	00113c23          	sd	ra,24(sp)
    80009424:	00813823          	sd	s0,16(sp)
    80009428:	00913423          	sd	s1,8(sp)
    8000942c:	02010413          	addi	s0,sp,32
    80009430:	00050493          	mv	s1,a0
        return nullptr;
    
    uchar size_order = log2(size - 1) + 1;
    80009434:	fff58513          	addi	a0,a1,-1
    80009438:	ffffc097          	auipc	ra,0xffffc
    8000943c:	62c080e7          	jalr	1580(ra) # 80005a64 <_Z4log2m>
    80009440:	0015079b          	addiw	a5,a0,1
    80009444:	0ff7f793          	andi	a5,a5,255
    if(size_order > 17)
    80009448:	01100713          	li	a4,17
    8000944c:	04f76463          	bltu	a4,a5,80009494 <_ZN13SlabAllocator7kmallocEm+0x7c>
        return nullptr;
    
    if(size_order < 5)
    80009450:	00400713          	li	a4,4
    80009454:	00f76463          	bltu	a4,a5,8000945c <_ZN13SlabAllocator7kmallocEm+0x44>
        size_order = 5;
    80009458:	00500793          	li	a5,5

    return smb_caches[size_order-5].alloc_obj();
    8000945c:	ffb7879b          	addiw	a5,a5,-5
    80009460:	05800513          	li	a0,88
    80009464:	02a787b3          	mul	a5,a5,a0
    80009468:	0b078793          	addi	a5,a5,176
    8000946c:	00f48533          	add	a0,s1,a5
    80009470:	fffff097          	auipc	ra,0xfffff
    80009474:	634080e7          	jalr	1588(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
}
    80009478:	01813083          	ld	ra,24(sp)
    8000947c:	01013403          	ld	s0,16(sp)
    80009480:	00813483          	ld	s1,8(sp)
    80009484:	02010113          	addi	sp,sp,32
    80009488:	00008067          	ret
        return nullptr;
    8000948c:	00000513          	li	a0,0
}
    80009490:	00008067          	ret
        return nullptr;
    80009494:	00000513          	li	a0,0
    80009498:	fe1ff06f          	j	80009478 <_ZN13SlabAllocator7kmallocEm+0x60>

000000008000949c <_ZN13SlabAllocator5kfreeEPv>:



int SlabAllocator::kfree(void* p){
    8000949c:	fd010113          	addi	sp,sp,-48
    800094a0:	02113423          	sd	ra,40(sp)
    800094a4:	02813023          	sd	s0,32(sp)
    800094a8:	00913c23          	sd	s1,24(sp)
    800094ac:	01213823          	sd	s2,16(sp)
    800094b0:	01313423          	sd	s3,8(sp)
    800094b4:	01413023          	sd	s4,0(sp)
    800094b8:	03010413          	addi	s0,sp,48
    800094bc:	00058a13          	mv	s4,a1
    for(ObjectCache& smb_cache: smb_caches){
    800094c0:	0b050493          	addi	s1,a0,176
    800094c4:	52850993          	addi	s3,a0,1320
    800094c8:	03348a63          	beq	s1,s3,800094fc <_ZN13SlabAllocator5kfreeEPv+0x60>
        if(!smb_cache.free_obj(p)){
    800094cc:	000a0593          	mv	a1,s4
    800094d0:	00048513          	mv	a0,s1
    800094d4:	fffff097          	auipc	ra,0xfffff
    800094d8:	6b0080e7          	jalr	1712(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
    800094dc:	00050913          	mv	s2,a0
    800094e0:	00050663          	beqz	a0,800094ec <_ZN13SlabAllocator5kfreeEPv+0x50>
    for(ObjectCache& smb_cache: smb_caches){
    800094e4:	05848493          	addi	s1,s1,88
    800094e8:	fe1ff06f          	j	800094c8 <_ZN13SlabAllocator5kfreeEPv+0x2c>
            smb_cache.shrink();
    800094ec:	00048513          	mv	a0,s1
    800094f0:	00000097          	auipc	ra,0x0
    800094f4:	804080e7          	jalr	-2044(ra) # 80008cf4 <_ZN11ObjectCache6shrinkEv>
            return 0;
    800094f8:	0080006f          	j	80009500 <_ZN13SlabAllocator5kfreeEPv+0x64>
        }
    }
    return 1;
    800094fc:	00100913          	li	s2,1
}
    80009500:	00090513          	mv	a0,s2
    80009504:	02813083          	ld	ra,40(sp)
    80009508:	02013403          	ld	s0,32(sp)
    8000950c:	01813483          	ld	s1,24(sp)
    80009510:	01013903          	ld	s2,16(sp)
    80009514:	00813983          	ld	s3,8(sp)
    80009518:	00013a03          	ld	s4,0(sp)
    8000951c:	03010113          	addi	sp,sp,48
    80009520:	00008067          	ret

0000000080009524 <_ZN4SlabC1EhPvP11ObjectCache>:
#include "../../../h/kernel_lib.h"

Slab::Slab(uchar cap, void* addr, ObjectCache* parent){
    80009524:	fd010113          	addi	sp,sp,-48
    80009528:	02113423          	sd	ra,40(sp)
    8000952c:	02813023          	sd	s0,32(sp)
    80009530:	00913c23          	sd	s1,24(sp)
    80009534:	01213823          	sd	s2,16(sp)
    80009538:	01313423          	sd	s3,8(sp)
    8000953c:	01413023          	sd	s4,0(sp)
    80009540:	03010413          	addi	s0,sp,48
    80009544:	00050493          	mv	s1,a0
    80009548:	00058913          	mv	s2,a1
    8000954c:	00060a13          	mv	s4,a2
    80009550:	00068993          	mv	s3,a3
    80009554:	00000613          	li	a2,0
    80009558:	00000593          	li	a1,0
    8000955c:	0a850513          	addi	a0,a0,168
    80009560:	00002097          	auipc	ra,0x2
    80009564:	0b4080e7          	jalr	180(ra) # 8000b614 <_ZN6list_tC1EPS_S0_>
    this->cap = cap;
    80009568:	09248523          	sb	s2,138(s1)
    this->addr_start = (char*)addr;
    8000956c:	0b44b023          	sd	s4,160(s1)
    node.next = node.prev = nullptr;
    80009570:	0a04b823          	sd	zero,176(s1)
    80009574:	0a04b423          	sd	zero,168(s1)
    this->parent = parent;
    80009578:	0134b023          	sd	s3,0(s1)

    for(uint a = 0; a < cap; a++)
    8000957c:	00000793          	li	a5,0
    80009580:	0009071b          	sext.w	a4,s2
    80009584:	00e7fe63          	bgeu	a5,a4,800095a0 <_ZN4SlabC1EhPvP11ObjectCache+0x7c>
        round_buffer[a] = a;
    80009588:	02079713          	slli	a4,a5,0x20
    8000958c:	02075713          	srli	a4,a4,0x20
    80009590:	00e48733          	add	a4,s1,a4
    80009594:	00f70423          	sb	a5,8(a4)
    for(uint a = 0; a < cap; a++)
    80009598:	0017879b          	addiw	a5,a5,1
    8000959c:	fe5ff06f          	j	80009580 <_ZN4SlabC1EhPvP11ObjectCache+0x5c>
    front = rear = 0;
    800095a0:	080484a3          	sb	zero,137(s1)
    800095a4:	08048423          	sb	zero,136(s1)
    
    for(uint a = 0; a < (RB_SIZE >> 3); a++){
    800095a8:	00000793          	li	a5,0
    800095ac:	00f00713          	li	a4,15
    800095b0:	00f76e63          	bltu	a4,a5,800095cc <_ZN4SlabC1EhPvP11ObjectCache+0xa8>
        map[a] = 0;
    800095b4:	02079713          	slli	a4,a5,0x20
    800095b8:	02075713          	srli	a4,a4,0x20
    800095bc:	00e48733          	add	a4,s1,a4
    800095c0:	080705a3          	sb	zero,139(a4)
    for(uint a = 0; a < (RB_SIZE >> 3); a++){
    800095c4:	0017879b          	addiw	a5,a5,1
    800095c8:	fe5ff06f          	j	800095ac <_ZN4SlabC1EhPvP11ObjectCache+0x88>
    }
}
    800095cc:	02813083          	ld	ra,40(sp)
    800095d0:	02013403          	ld	s0,32(sp)
    800095d4:	01813483          	ld	s1,24(sp)
    800095d8:	01013903          	ld	s2,16(sp)
    800095dc:	00813983          	ld	s3,8(sp)
    800095e0:	00013a03          	ld	s4,0(sp)
    800095e4:	03010113          	addi	sp,sp,48
    800095e8:	00008067          	ret

00000000800095ec <_ZN4Slab8containsEPv>:
    return ret;
}



bool Slab::contains(void *ptr){
    800095ec:	ff010113          	addi	sp,sp,-16
    800095f0:	00813423          	sd	s0,8(sp)
    800095f4:	01010413          	addi	s0,sp,16
    if((char*)ptr < addr_start) return 0;
    800095f8:	0a053783          	ld	a5,160(a0)
    800095fc:	02f5e663          	bltu	a1,a5,80009628 <_ZN4Slab8containsEPv+0x3c>

    size_t diff = (char*)ptr - addr_start;
    80009600:	40f585b3          	sub	a1,a1,a5
    if(diff % parent->objsize
    80009604:	00053783          	ld	a5,0(a0)
    80009608:	0107b783          	ld	a5,16(a5)
    8000960c:	02f5f733          	remu	a4,a1,a5
    80009610:	02071463          	bnez	a4,80009638 <_ZN4Slab8containsEPv+0x4c>
        || diff > parent->objsize*cap) return 0;
    80009614:	08a54703          	lbu	a4,138(a0)
    80009618:	02e787b3          	mul	a5,a5,a4
    8000961c:	02b7e263          	bltu	a5,a1,80009640 <_ZN4Slab8containsEPv+0x54>
    
    return 1;
    80009620:	00100513          	li	a0,1
    80009624:	0080006f          	j	8000962c <_ZN4Slab8containsEPv+0x40>
    if((char*)ptr < addr_start) return 0;
    80009628:	00000513          	li	a0,0
}
    8000962c:	00813403          	ld	s0,8(sp)
    80009630:	01010113          	addi	sp,sp,16
    80009634:	00008067          	ret
        || diff > parent->objsize*cap) return 0;
    80009638:	00000513          	li	a0,0
    8000963c:	ff1ff06f          	j	8000962c <_ZN4Slab8containsEPv+0x40>
    80009640:	00000513          	li	a0,0
    80009644:	fe9ff06f          	j	8000962c <_ZN4Slab8containsEPv+0x40>

0000000080009648 <_ZN4Slab7get_bitEh>:
}




bool Slab::get_bit(uchar index){
    80009648:	ff010113          	addi	sp,sp,-16
    8000964c:	00813423          	sd	s0,8(sp)
    80009650:	01010413          	addi	s0,sp,16
    return map[index >> 3] & (1U << (index & 7U));
    80009654:	0035d793          	srli	a5,a1,0x3
    80009658:	00f50533          	add	a0,a0,a5
    8000965c:	08b54503          	lbu	a0,139(a0)
    80009660:	0075f593          	andi	a1,a1,7
    80009664:	00b5553b          	srlw	a0,a0,a1
}
    80009668:	00157513          	andi	a0,a0,1
    8000966c:	00813403          	ld	s0,8(sp)
    80009670:	01010113          	addi	sp,sp,16
    80009674:	00008067          	ret

0000000080009678 <_ZN4Slab10print_infoEc>:
void Slab::print_info(char flag){
    80009678:	fd010113          	addi	sp,sp,-48
    8000967c:	02113423          	sd	ra,40(sp)
    80009680:	02813023          	sd	s0,32(sp)
    80009684:	00913c23          	sd	s1,24(sp)
    80009688:	01213823          	sd	s2,16(sp)
    8000968c:	01313423          	sd	s3,8(sp)
    80009690:	03010413          	addi	s0,sp,48
    80009694:	00050913          	mv	s2,a0
    80009698:	00058993          	mv	s3,a1
    kprintString("Slab info:\n");
    8000969c:	00006517          	auipc	a0,0x6
    800096a0:	3d450513          	addi	a0,a0,980 # 8000fa70 <CONSOLE_STATUS+0xa60>
    800096a4:	ffffc097          	auipc	ra,0xffffc
    800096a8:	a00080e7          	jalr	-1536(ra) # 800050a4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(Slab Meta Address, this);
    800096ac:	00006517          	auipc	a0,0x6
    800096b0:	3d450513          	addi	a0,a0,980 # 8000fa80 <CONSOLE_STATUS+0xa70>
    800096b4:	ffffc097          	auipc	ra,0xffffc
    800096b8:	9f0080e7          	jalr	-1552(ra) # 800050a4 <_Z12kprintStringPKc>
    800096bc:	00000613          	li	a2,0
    800096c0:	01000593          	li	a1,16
    800096c4:	00090513          	mv	a0,s2
    800096c8:	ffffc097          	auipc	ra,0xffffc
    800096cc:	a24080e7          	jalr	-1500(ra) # 800050ec <_Z9kprintIntmib>
    800096d0:	00006517          	auipc	a0,0x6
    800096d4:	c8850513          	addi	a0,a0,-888 # 8000f358 <CONSOLE_STATUS+0x348>
    800096d8:	ffffc097          	auipc	ra,0xffffc
    800096dc:	9cc080e7          	jalr	-1588(ra) # 800050a4 <_Z12kprintStringPKc>
    KVALCHECKPRINT(Slab Address, addr_start);
    800096e0:	00006517          	auipc	a0,0x6
    800096e4:	3b850513          	addi	a0,a0,952 # 8000fa98 <CONSOLE_STATUS+0xa88>
    800096e8:	ffffc097          	auipc	ra,0xffffc
    800096ec:	9bc080e7          	jalr	-1604(ra) # 800050a4 <_Z12kprintStringPKc>
    800096f0:	00000613          	li	a2,0
    800096f4:	01000593          	li	a1,16
    800096f8:	0a093503          	ld	a0,160(s2)
    800096fc:	ffffc097          	auipc	ra,0xffffc
    80009700:	9f0080e7          	jalr	-1552(ra) # 800050ec <_Z9kprintIntmib>
    80009704:	00006517          	auipc	a0,0x6
    80009708:	c5450513          	addi	a0,a0,-940 # 8000f358 <CONSOLE_STATUS+0x348>
    8000970c:	ffffc097          	auipc	ra,0xffffc
    80009710:	998080e7          	jalr	-1640(ra) # 800050a4 <_Z12kprintStringPKc>
    uchar t = front;
    80009714:	08894483          	lbu	s1,136(s2)
    if(flag & pb_mask::FREE){
    80009718:	0019f793          	andi	a5,s3,1
    8000971c:	12078463          	beqz	a5,80009844 <_ZN4Slab10print_infoEc+0x1cc>
        if(front == rear){
    80009720:	08994783          	lbu	a5,137(s2)
    80009724:	08978c63          	beq	a5,s1,800097bc <_ZN4Slab10print_infoEc+0x144>
        if(front != RB_SIZE) 
    80009728:	08894703          	lbu	a4,136(s2)
    8000972c:	08000793          	li	a5,128
    80009730:	10f70263          	beq	a4,a5,80009834 <_ZN4Slab10print_infoEc+0x1bc>
            for(;  t < RB_SIZE && t != rear;  t = (t + 1)%cap){
    80009734:	0184979b          	slliw	a5,s1,0x18
    80009738:	4187d79b          	sraiw	a5,a5,0x18
    8000973c:	0e07cc63          	bltz	a5,80009834 <_ZN4Slab10print_infoEc+0x1bc>
    80009740:	08994783          	lbu	a5,137(s2)
    80009744:	0e978863          	beq	a5,s1,80009834 <_ZN4Slab10print_infoEc+0x1bc>
                KPRINTARR(FreeSlot, round_buffer[t], 1);
    80009748:	00006517          	auipc	a0,0x6
    8000974c:	36050513          	addi	a0,a0,864 # 8000faa8 <CONSOLE_STATUS+0xa98>
    80009750:	ffffc097          	auipc	ra,0xffffc
    80009754:	954080e7          	jalr	-1708(ra) # 800050a4 <_Z12kprintStringPKc>
    80009758:	0004849b          	sext.w	s1,s1
    8000975c:	009907b3          	add	a5,s2,s1
    80009760:	00000613          	li	a2,0
    80009764:	00a00593          	li	a1,10
    80009768:	0087c503          	lbu	a0,8(a5)
    8000976c:	ffffc097          	auipc	ra,0xffffc
    80009770:	980080e7          	jalr	-1664(ra) # 800050ec <_Z9kprintIntmib>
    80009774:	00006517          	auipc	a0,0x6
    80009778:	db450513          	addi	a0,a0,-588 # 8000f528 <CONSOLE_STATUS+0x518>
    8000977c:	ffffc097          	auipc	ra,0xffffc
    80009780:	928080e7          	jalr	-1752(ra) # 800050a4 <_Z12kprintStringPKc>
    80009784:	00000613          	li	a2,0
    80009788:	01000593          	li	a1,16
    8000978c:	00100513          	li	a0,1
    80009790:	ffffc097          	auipc	ra,0xffffc
    80009794:	95c080e7          	jalr	-1700(ra) # 800050ec <_Z9kprintIntmib>
    80009798:	00006517          	auipc	a0,0x6
    8000979c:	bc050513          	addi	a0,a0,-1088 # 8000f358 <CONSOLE_STATUS+0x348>
    800097a0:	ffffc097          	auipc	ra,0xffffc
    800097a4:	904080e7          	jalr	-1788(ra) # 800050a4 <_Z12kprintStringPKc>
            for(;  t < RB_SIZE && t != rear;  t = (t + 1)%cap){
    800097a8:	0014849b          	addiw	s1,s1,1
    800097ac:	08a94783          	lbu	a5,138(s2)
    800097b0:	02f4e4bb          	remw	s1,s1,a5
    800097b4:	0ff4f493          	andi	s1,s1,255
    800097b8:	f7dff06f          	j	80009734 <_ZN4Slab10print_infoEc+0xbc>
            KPRINTARR(FreeSlot, round_buffer[front], 1);
    800097bc:	00006517          	auipc	a0,0x6
    800097c0:	2ec50513          	addi	a0,a0,748 # 8000faa8 <CONSOLE_STATUS+0xa98>
    800097c4:	ffffc097          	auipc	ra,0xffffc
    800097c8:	8e0080e7          	jalr	-1824(ra) # 800050a4 <_Z12kprintStringPKc>
    800097cc:	08894783          	lbu	a5,136(s2)
    800097d0:	00f907b3          	add	a5,s2,a5
    800097d4:	00000613          	li	a2,0
    800097d8:	00a00593          	li	a1,10
    800097dc:	0087c503          	lbu	a0,8(a5)
    800097e0:	ffffc097          	auipc	ra,0xffffc
    800097e4:	90c080e7          	jalr	-1780(ra) # 800050ec <_Z9kprintIntmib>
    800097e8:	00006517          	auipc	a0,0x6
    800097ec:	d4050513          	addi	a0,a0,-704 # 8000f528 <CONSOLE_STATUS+0x518>
    800097f0:	ffffc097          	auipc	ra,0xffffc
    800097f4:	8b4080e7          	jalr	-1868(ra) # 800050a4 <_Z12kprintStringPKc>
    800097f8:	00000613          	li	a2,0
    800097fc:	01000593          	li	a1,16
    80009800:	00100513          	li	a0,1
    80009804:	ffffc097          	auipc	ra,0xffffc
    80009808:	8e8080e7          	jalr	-1816(ra) # 800050ec <_Z9kprintIntmib>
    8000980c:	00006517          	auipc	a0,0x6
    80009810:	b4c50513          	addi	a0,a0,-1204 # 8000f358 <CONSOLE_STATUS+0x348>
    80009814:	ffffc097          	auipc	ra,0xffffc
    80009818:	890080e7          	jalr	-1904(ra) # 800050a4 <_Z12kprintStringPKc>
            if(cap > 1)
    8000981c:	08a94703          	lbu	a4,138(s2)
    80009820:	00100793          	li	a5,1
    80009824:	f0e7f2e3          	bgeu	a5,a4,80009728 <_ZN4Slab10print_infoEc+0xb0>
                t++;
    80009828:	0014849b          	addiw	s1,s1,1
    8000982c:	0ff4f493          	andi	s1,s1,255
    80009830:	ef9ff06f          	j	80009728 <_ZN4Slab10print_infoEc+0xb0>
        kprintString("\n");
    80009834:	00006517          	auipc	a0,0x6
    80009838:	b2450513          	addi	a0,a0,-1244 # 8000f358 <CONSOLE_STATUS+0x348>
    8000983c:	ffffc097          	auipc	ra,0xffffc
    80009840:	868080e7          	jalr	-1944(ra) # 800050a4 <_Z12kprintStringPKc>
    if(flag & pb_mask::ALLOC){
    80009844:	0029f993          	andi	s3,s3,2
    80009848:	08098663          	beqz	s3,800098d4 <_ZN4Slab10print_infoEc+0x25c>
        for(uint i = 0; i < cap; i++){
    8000984c:	00000493          	li	s1,0
    80009850:	0640006f          	j	800098b4 <_ZN4Slab10print_infoEc+0x23c>
                KPRINTARR(UsedSlot, i, 1);
    80009854:	00006517          	auipc	a0,0x6
    80009858:	26450513          	addi	a0,a0,612 # 8000fab8 <CONSOLE_STATUS+0xaa8>
    8000985c:	ffffc097          	auipc	ra,0xffffc
    80009860:	848080e7          	jalr	-1976(ra) # 800050a4 <_Z12kprintStringPKc>
    80009864:	00000613          	li	a2,0
    80009868:	00a00593          	li	a1,10
    8000986c:	02049513          	slli	a0,s1,0x20
    80009870:	02055513          	srli	a0,a0,0x20
    80009874:	ffffc097          	auipc	ra,0xffffc
    80009878:	878080e7          	jalr	-1928(ra) # 800050ec <_Z9kprintIntmib>
    8000987c:	00006517          	auipc	a0,0x6
    80009880:	cac50513          	addi	a0,a0,-852 # 8000f528 <CONSOLE_STATUS+0x518>
    80009884:	ffffc097          	auipc	ra,0xffffc
    80009888:	820080e7          	jalr	-2016(ra) # 800050a4 <_Z12kprintStringPKc>
    8000988c:	00000613          	li	a2,0
    80009890:	01000593          	li	a1,16
    80009894:	00100513          	li	a0,1
    80009898:	ffffc097          	auipc	ra,0xffffc
    8000989c:	854080e7          	jalr	-1964(ra) # 800050ec <_Z9kprintIntmib>
    800098a0:	00006517          	auipc	a0,0x6
    800098a4:	ab850513          	addi	a0,a0,-1352 # 8000f358 <CONSOLE_STATUS+0x348>
    800098a8:	ffffb097          	auipc	ra,0xffffb
    800098ac:	7fc080e7          	jalr	2044(ra) # 800050a4 <_Z12kprintStringPKc>
        for(uint i = 0; i < cap; i++){
    800098b0:	0014849b          	addiw	s1,s1,1
    800098b4:	08a94783          	lbu	a5,138(s2)
    800098b8:	00f4fe63          	bgeu	s1,a5,800098d4 <_ZN4Slab10print_infoEc+0x25c>
            if(get_bit(i)){
    800098bc:	0ff4f593          	andi	a1,s1,255
    800098c0:	00090513          	mv	a0,s2
    800098c4:	00000097          	auipc	ra,0x0
    800098c8:	d84080e7          	jalr	-636(ra) # 80009648 <_ZN4Slab7get_bitEh>
    800098cc:	fe0502e3          	beqz	a0,800098b0 <_ZN4Slab10print_infoEc+0x238>
    800098d0:	f85ff06f          	j	80009854 <_ZN4Slab10print_infoEc+0x1dc>
}
    800098d4:	02813083          	ld	ra,40(sp)
    800098d8:	02013403          	ld	s0,32(sp)
    800098dc:	01813483          	ld	s1,24(sp)
    800098e0:	01013903          	ld	s2,16(sp)
    800098e4:	00813983          	ld	s3,8(sp)
    800098e8:	03010113          	addi	sp,sp,48
    800098ec:	00008067          	ret

00000000800098f0 <_ZN4Slab7set_bitEh>:




void Slab::set_bit(uchar index){
    800098f0:	ff010113          	addi	sp,sp,-16
    800098f4:	00813423          	sd	s0,8(sp)
    800098f8:	01010413          	addi	s0,sp,16
    map[index >> 3] |= (1 << (index & 7));
    800098fc:	0035d793          	srli	a5,a1,0x3
    80009900:	0075f713          	andi	a4,a1,7
    80009904:	00100593          	li	a1,1
    80009908:	00e595bb          	sllw	a1,a1,a4
    8000990c:	00f50533          	add	a0,a0,a5
    80009910:	08b54783          	lbu	a5,139(a0)
    80009914:	00f5e5b3          	or	a1,a1,a5
    80009918:	08b505a3          	sb	a1,139(a0)
}
    8000991c:	00813403          	ld	s0,8(sp)
    80009920:	01010113          	addi	sp,sp,16
    80009924:	00008067          	ret

0000000080009928 <_ZN4Slab7get_objEv>:
void* Slab::get_obj(){
    80009928:	fe010113          	addi	sp,sp,-32
    8000992c:	00113c23          	sd	ra,24(sp)
    80009930:	00813823          	sd	s0,16(sp)
    80009934:	00913423          	sd	s1,8(sp)
    80009938:	01213023          	sd	s2,0(sp)
    8000993c:	02010413          	addi	s0,sp,32
    bool full(){ return front == RB_SIZE; }
    80009940:	08854783          	lbu	a5,136(a0)
    if(full()) return nullptr;
    80009944:	08000713          	li	a4,128
    80009948:	06e78e63          	beq	a5,a4,800099c4 <_ZN4Slab7get_objEv+0x9c>
    8000994c:	00050493          	mv	s1,a0
        (void*) (addr_start + round_buffer[front] * parent->objsize);
    80009950:	0a053903          	ld	s2,160(a0)
    80009954:	00f507b3          	add	a5,a0,a5
    80009958:	0087c583          	lbu	a1,8(a5)
    8000995c:	00053783          	ld	a5,0(a0)
    80009960:	0107b783          	ld	a5,16(a5)
    80009964:	02f587b3          	mul	a5,a1,a5
    void* ret = 
    80009968:	00f90933          	add	s2,s2,a5
    set_bit(round_buffer[front]);
    8000996c:	00000097          	auipc	ra,0x0
    80009970:	f84080e7          	jalr	-124(ra) # 800098f0 <_ZN4Slab7set_bitEh>
    front = front+1;
    80009974:	0884c783          	lbu	a5,136(s1)
    80009978:	0017879b          	addiw	a5,a5,1
    8000997c:	0ff7f793          	andi	a5,a5,255
    80009980:	08f48423          	sb	a5,136(s1)
    if(front >= cap) front = 0;
    80009984:	08a4c703          	lbu	a4,138(s1)
    80009988:	00e7e463          	bltu	a5,a4,80009990 <_ZN4Slab7get_objEv+0x68>
    8000998c:	08048423          	sb	zero,136(s1)
    if(front == rear) front = RB_SIZE;
    80009990:	0884c703          	lbu	a4,136(s1)
    80009994:	0894c783          	lbu	a5,137(s1)
    80009998:	02f70063          	beq	a4,a5,800099b8 <_ZN4Slab7get_objEv+0x90>
}
    8000999c:	00090513          	mv	a0,s2
    800099a0:	01813083          	ld	ra,24(sp)
    800099a4:	01013403          	ld	s0,16(sp)
    800099a8:	00813483          	ld	s1,8(sp)
    800099ac:	00013903          	ld	s2,0(sp)
    800099b0:	02010113          	addi	sp,sp,32
    800099b4:	00008067          	ret
    if(front == rear) front = RB_SIZE;
    800099b8:	f8000793          	li	a5,-128
    800099bc:	08f48423          	sb	a5,136(s1)
    800099c0:	fddff06f          	j	8000999c <_ZN4Slab7get_objEv+0x74>
    if(full()) return nullptr;
    800099c4:	00000913          	li	s2,0
    800099c8:	fd5ff06f          	j	8000999c <_ZN4Slab7get_objEv+0x74>

00000000800099cc <_ZN4Slab9clear_bitEh>:




void Slab::clear_bit(uchar index){
    800099cc:	ff010113          	addi	sp,sp,-16
    800099d0:	00813423          	sd	s0,8(sp)
    800099d4:	01010413          	addi	s0,sp,16
    map[index >> 3] &= ~(1 << (index & 7));
    800099d8:	0035d793          	srli	a5,a1,0x3
    800099dc:	0075f713          	andi	a4,a1,7
    800099e0:	00100593          	li	a1,1
    800099e4:	00e595bb          	sllw	a1,a1,a4
    800099e8:	00f50533          	add	a0,a0,a5
    800099ec:	fff5c593          	not	a1,a1
    800099f0:	08b54783          	lbu	a5,139(a0)
    800099f4:	00f5f5b3          	and	a1,a1,a5
    800099f8:	08b505a3          	sb	a1,139(a0)
}
    800099fc:	00813403          	ld	s0,8(sp)
    80009a00:	01010113          	addi	sp,sp,16
    80009a04:	00008067          	ret

0000000080009a08 <_ZN4Slab7put_objEPv>:
    bool free(){ return rear == front; }
    80009a08:	08954783          	lbu	a5,137(a0)
    80009a0c:	08854703          	lbu	a4,136(a0)
    if(free()) return -4;
    80009a10:	0cf70663          	beq	a4,a5,80009adc <_ZN4Slab7put_objEPv+0xd4>
    if((char*)ptr < addr_start) return -1;
    80009a14:	0a053783          	ld	a5,160(a0)
    80009a18:	0cf5e663          	bltu	a1,a5,80009ae4 <_ZN4Slab7put_objEPv+0xdc>
int Slab::put_obj(void *ptr){
    80009a1c:	fd010113          	addi	sp,sp,-48
    80009a20:	02113423          	sd	ra,40(sp)
    80009a24:	02813023          	sd	s0,32(sp)
    80009a28:	00913c23          	sd	s1,24(sp)
    80009a2c:	01213823          	sd	s2,16(sp)
    80009a30:	01313423          	sd	s3,8(sp)
    80009a34:	01413023          	sd	s4,0(sp)
    80009a38:	03010413          	addi	s0,sp,48
    size_t diff = (char*)ptr - addr_start;
    80009a3c:	40f587b3          	sub	a5,a1,a5
    if(diff % parent->objsize
    80009a40:	00053a03          	ld	s4,0(a0)
    80009a44:	010a3903          	ld	s2,16(s4)
    80009a48:	0327f733          	remu	a4,a5,s2
    80009a4c:	0a071063          	bnez	a4,80009aec <_ZN4Slab7put_objEPv+0xe4>
        || diff > parent->objsize*cap) return -2;
    80009a50:	08a54703          	lbu	a4,138(a0)
    80009a54:	02e90733          	mul	a4,s2,a4
    80009a58:	08f76e63          	bltu	a4,a5,80009af4 <_ZN4Slab7put_objEPv+0xec>
    80009a5c:	00058993          	mv	s3,a1
    80009a60:	00050493          	mv	s1,a0
    size_t num = diff/parent->objsize;
    80009a64:	0327d7b3          	divu	a5,a5,s2
    if(!get_bit(num)) return -5;
    80009a68:	0ff7f913          	andi	s2,a5,255
    80009a6c:	00090593          	mv	a1,s2
    80009a70:	00000097          	auipc	ra,0x0
    80009a74:	bd8080e7          	jalr	-1064(ra) # 80009648 <_ZN4Slab7get_bitEh>
    80009a78:	08050263          	beqz	a0,80009afc <_ZN4Slab7put_objEPv+0xf4>
    if(parent->dtor) parent->dtor(ptr);
    80009a7c:	050a3783          	ld	a5,80(s4)
    80009a80:	00078663          	beqz	a5,80009a8c <_ZN4Slab7put_objEPv+0x84>
    80009a84:	00098513          	mv	a0,s3
    80009a88:	000780e7          	jalr	a5
    clear_bit(num);
    80009a8c:	00090593          	mv	a1,s2
    80009a90:	00048513          	mv	a0,s1
    80009a94:	00000097          	auipc	ra,0x0
    80009a98:	f38080e7          	jalr	-200(ra) # 800099cc <_ZN4Slab9clear_bitEh>
    round_buffer[rear] = num;
    80009a9c:	0894c783          	lbu	a5,137(s1)
    80009aa0:	00f48733          	add	a4,s1,a5
    80009aa4:	01270423          	sb	s2,8(a4)
    if(front == RB_SIZE) front = rear;
    80009aa8:	0884c683          	lbu	a3,136(s1)
    80009aac:	08000713          	li	a4,128
    80009ab0:	02e68263          	beq	a3,a4,80009ad4 <_ZN4Slab7put_objEPv+0xcc>
    rear = rear+1;
    80009ab4:	0017879b          	addiw	a5,a5,1
    80009ab8:	0ff7f793          	andi	a5,a5,255
    80009abc:	08f484a3          	sb	a5,137(s1)
    if(rear >= cap) rear = 0;
    80009ac0:	08a4c703          	lbu	a4,138(s1)
    80009ac4:	04e7e063          	bltu	a5,a4,80009b04 <_ZN4Slab7put_objEPv+0xfc>
    80009ac8:	080484a3          	sb	zero,137(s1)
    return 0;
    80009acc:	00000513          	li	a0,0
    80009ad0:	0380006f          	j	80009b08 <_ZN4Slab7put_objEPv+0x100>
    if(front == RB_SIZE) front = rear;
    80009ad4:	08f48423          	sb	a5,136(s1)
    80009ad8:	fddff06f          	j	80009ab4 <_ZN4Slab7put_objEPv+0xac>
    if(free()) return -4;
    80009adc:	ffc00513          	li	a0,-4
    80009ae0:	00008067          	ret
    if((char*)ptr < addr_start) return -1;
    80009ae4:	fff00513          	li	a0,-1
}
    80009ae8:	00008067          	ret
        || diff > parent->objsize*cap) return -2;
    80009aec:	ffe00513          	li	a0,-2
    80009af0:	0180006f          	j	80009b08 <_ZN4Slab7put_objEPv+0x100>
    80009af4:	ffe00513          	li	a0,-2
    80009af8:	0100006f          	j	80009b08 <_ZN4Slab7put_objEPv+0x100>
    if(!get_bit(num)) return -5;
    80009afc:	ffb00513          	li	a0,-5
    80009b00:	0080006f          	j	80009b08 <_ZN4Slab7put_objEPv+0x100>
    return 0;
    80009b04:	00000513          	li	a0,0
}
    80009b08:	02813083          	ld	ra,40(sp)
    80009b0c:	02013403          	ld	s0,32(sp)
    80009b10:	01813483          	ld	s1,24(sp)
    80009b14:	01013903          	ld	s2,16(sp)
    80009b18:	00813983          	ld	s3,8(sp)
    80009b1c:	00013a03          	ld	s4,0(sp)
    80009b20:	03010113          	addi	sp,sp,48
    80009b24:	00008067          	ret

0000000080009b28 <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80009b28:	ff010113          	addi	sp,sp,-16
    80009b2c:	00813423          	sd	s0,8(sp)
    80009b30:	01010413          	addi	s0,sp,16
    80009b34:	00100793          	li	a5,1
    80009b38:	00f50863          	beq	a0,a5,80009b48 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80009b3c:	00813403          	ld	s0,8(sp)
    80009b40:	01010113          	addi	sp,sp,16
    80009b44:	00008067          	ret
    80009b48:	000107b7          	lui	a5,0x10
    80009b4c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80009b50:	fef596e3          	bne	a1,a5,80009b3c <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80009b54:	00005797          	auipc	a5,0x5
    80009b58:	4bc78793          	addi	a5,a5,1212 # 8000f010 <CONSOLE_STATUS>
    80009b5c:	0007b783          	ld	a5,0(a5)
    80009b60:	0000c717          	auipc	a4,0xc
    80009b64:	8cf73423          	sd	a5,-1848(a4) # 80015428 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80009b68:	00005797          	auipc	a5,0x5
    80009b6c:	49878793          	addi	a5,a5,1176 # 8000f000 <CONSOLE_RX_DATA>
    80009b70:	0007b783          	ld	a5,0(a5)
    80009b74:	0000c717          	auipc	a4,0xc
    80009b78:	8af73623          	sd	a5,-1876(a4) # 80015420 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80009b7c:	00005797          	auipc	a5,0x5
    80009b80:	48c78793          	addi	a5,a5,1164 # 8000f008 <CONSOLE_TX_DATA>
    80009b84:	0007b783          	ld	a5,0(a5)
    80009b88:	0000c717          	auipc	a4,0xc
    80009b8c:	88f73823          	sd	a5,-1904(a4) # 80015418 <_ZN5StdIO5odataE>
    80009b90:	fadff06f          	j	80009b3c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080009b94 <_ZN5StdIO12outputWorkerEPv>:
{
    80009b94:	fc010113          	addi	sp,sp,-64
    80009b98:	02113c23          	sd	ra,56(sp)
    80009b9c:	02813823          	sd	s0,48(sp)
    80009ba0:	02913423          	sd	s1,40(sp)
    80009ba4:	03213023          	sd	s2,32(sp)
    80009ba8:	01313c23          	sd	s3,24(sp)
    80009bac:	01413823          	sd	s4,16(sp)
    80009bb0:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    80009bb4:	0000c797          	auipc	a5,0xc
    80009bb8:	8407b223          	sd	zero,-1980(a5) # 800153f8 <_ZN5StdIO10out_threadE>
    80009bbc:	0400006f          	j	80009bfc <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80009bc0:	100027f3          	csrr	a5,sstatus
    80009bc4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80009bc8:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80009bcc:	141027f3          	csrr	a5,sepc
    80009bd0:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80009bd4:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    80009bd8:	0000b797          	auipc	a5,0xb
    80009bdc:	7d878793          	addi	a5,a5,2008 # 800153b0 <_ZN3TCB7runningE>
    80009be0:	0007b783          	ld	a5,0(a5)
    80009be4:	0000c717          	auipc	a4,0xc
    80009be8:	80f73a23          	sd	a5,-2028(a4) # 800153f8 <_ZN5StdIO10out_threadE>
            TCB::yield();
    80009bec:	ffffb097          	auipc	ra,0xffffb
    80009bf0:	024080e7          	jalr	36(ra) # 80004c10 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80009bf4:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80009bf8:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80009bfc:	0000c797          	auipc	a5,0xc
    80009c00:	82c78793          	addi	a5,a5,-2004 # 80015428 <_ZN5StdIO8iostatusE>
    80009c04:	0007b783          	ld	a5,0(a5)
    80009c08:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80009c0c:	0207f793          	andi	a5,a5,32
    80009c10:	fa0788e3          	beqz	a5,80009bc0 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80009c14:	0000b797          	auipc	a5,0xb
    80009c18:	7f478793          	addi	a5,a5,2036 # 80015408 <_ZN5StdIO7obufferE>
    80009c1c:	0007b483          	ld	s1,0(a5)
    80009c20:	0000b797          	auipc	a5,0xb
    80009c24:	7f878793          	addi	a5,a5,2040 # 80015418 <_ZN5StdIO5odataE>
    80009c28:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80009c2c:	42848513          	addi	a0,s1,1064
    80009c30:	ffffa097          	auipc	ra,0xffffa
    80009c34:	648080e7          	jalr	1608(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80009c38:	40048913          	addi	s2,s1,1024
    80009c3c:	00090513          	mv	a0,s2
    80009c40:	ffffa097          	auipc	ra,0xffffa
    80009c44:	638080e7          	jalr	1592(ra) # 80004278 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80009c48:	4804a783          	lw	a5,1152(s1)
    80009c4c:	fff7879b          	addiw	a5,a5,-1
    80009c50:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80009c54:	4784a783          	lw	a5,1144(s1)
    80009c58:	00f48733          	add	a4,s1,a5
    80009c5c:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80009c60:	0017879b          	addiw	a5,a5,1
    80009c64:	41f7d71b          	sraiw	a4,a5,0x1f
    80009c68:	0167571b          	srliw	a4,a4,0x16
    80009c6c:	00e787bb          	addw	a5,a5,a4
    80009c70:	3ff7f793          	andi	a5,a5,1023
    80009c74:	40e787bb          	subw	a5,a5,a4
    80009c78:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    80009c7c:	45048513          	addi	a0,s1,1104
    80009c80:	ffffa097          	auipc	ra,0xffffa
    80009c84:	67c080e7          	jalr	1660(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80009c88:	00090513          	mv	a0,s2
    80009c8c:	ffffa097          	auipc	ra,0xffffa
    80009c90:	670080e7          	jalr	1648(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    80009c94:	01498023          	sb	s4,0(s3)
    80009c98:	f65ff06f          	j	80009bfc <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080009c9c <_ZN5StdIO9initalizeEv>:
{
    80009c9c:	fe010113          	addi	sp,sp,-32
    80009ca0:	00113c23          	sd	ra,24(sp)
    80009ca4:	00813823          	sd	s0,16(sp)
    80009ca8:	00913423          	sd	s1,8(sp)
    80009cac:	01213023          	sd	s2,0(sp)
    80009cb0:	02010413          	addi	s0,sp,32
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    80009cb4:	0000b797          	auipc	a5,0xb
    80009cb8:	73c78793          	addi	a5,a5,1852 # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009cbc:	0007b783          	ld	a5,0(a5)
    80009cc0:	20078a63          	beqz	a5,80009ed4 <_ZN5StdIO9initalizeEv+0x238>
    80009cc4:	0000b797          	auipc	a5,0xb
    80009cc8:	72c78793          	addi	a5,a5,1836 # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009ccc:	0007b503          	ld	a0,0(a5)
    80009cd0:	fffff097          	auipc	ra,0xfffff
    80009cd4:	dd4080e7          	jalr	-556(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    ibuffer = new SharedBuffer<char>();
    80009cd8:	06050863          	beqz	a0,80009d48 <_ZN5StdIO9initalizeEv+0xac>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80009cdc:	40050713          	addi	a4,a0,1024
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)

    KSemaphore(unsigned val):val(val)
    80009ce0:	00100793          	li	a5,1
    80009ce4:	40f52423          	sw	a5,1032(a0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80009ce8:	40053823          	sd	zero,1040(a0)
    80009cec:	40053c23          	sd	zero,1048(a0)
    80009cf0:	42052023          	sw	zero,1056(a0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    80009cf4:	0000b797          	auipc	a5,0xb
    80009cf8:	69478793          	addi	a5,a5,1684 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    80009cfc:	0007b683          	ld	a3,0(a5)
    80009d00:	40d53023          	sd	a3,1024(a0)
    80009d04:	42850693          	addi	a3,a0,1064
    KSemaphore(unsigned val):val(val)
    80009d08:	42052823          	sw	zero,1072(a0)
    80009d0c:	42053c23          	sd	zero,1080(a0)
    80009d10:	44053023          	sd	zero,1088(a0)
    80009d14:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    80009d18:	42e53423          	sd	a4,1064(a0)
    80009d1c:	45050713          	addi	a4,a0,1104
    KSemaphore(unsigned val):val(val)
    80009d20:	40000613          	li	a2,1024
    80009d24:	44c52c23          	sw	a2,1112(a0)
    80009d28:	46053023          	sd	zero,1120(a0)
    80009d2c:	46053423          	sd	zero,1128(a0)
    80009d30:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    80009d34:	44d53823          	sd	a3,1104(a0)
        activeSemaphores = this;
    80009d38:	00e7b023          	sd	a4,0(a5)
    80009d3c:	46052c23          	sw	zero,1144(a0)
    80009d40:	46052e23          	sw	zero,1148(a0)
    80009d44:	48052023          	sw	zero,1152(a0)
    80009d48:	0000b797          	auipc	a5,0xb
    80009d4c:	6ca7b423          	sd	a0,1736(a5) # 80015410 <_ZN5StdIO7ibufferE>
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    80009d50:	0000b797          	auipc	a5,0xb
    80009d54:	6a078793          	addi	a5,a5,1696 # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009d58:	0007b783          	ld	a5,0(a5)
    80009d5c:	1c078a63          	beqz	a5,80009f30 <_ZN5StdIO9initalizeEv+0x294>
    80009d60:	0000b797          	auipc	a5,0xb
    80009d64:	69078793          	addi	a5,a5,1680 # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009d68:	0007b503          	ld	a0,0(a5)
    80009d6c:	fffff097          	auipc	ra,0xfffff
    80009d70:	d38080e7          	jalr	-712(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    obuffer = new SharedBuffer<char>();
    80009d74:	06050863          	beqz	a0,80009de4 <_ZN5StdIO9initalizeEv+0x148>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80009d78:	40050713          	addi	a4,a0,1024
    KSemaphore(unsigned val):val(val)
    80009d7c:	00100793          	li	a5,1
    80009d80:	40f52423          	sw	a5,1032(a0)
    80009d84:	40053823          	sd	zero,1040(a0)
    80009d88:	40053c23          	sd	zero,1048(a0)
    80009d8c:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores; 
    80009d90:	0000b797          	auipc	a5,0xb
    80009d94:	5f878793          	addi	a5,a5,1528 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    80009d98:	0007b683          	ld	a3,0(a5)
    80009d9c:	40d53023          	sd	a3,1024(a0)
    80009da0:	42850693          	addi	a3,a0,1064
    KSemaphore(unsigned val):val(val)
    80009da4:	42052823          	sw	zero,1072(a0)
    80009da8:	42053c23          	sd	zero,1080(a0)
    80009dac:	44053023          	sd	zero,1088(a0)
    80009db0:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores; 
    80009db4:	42e53423          	sd	a4,1064(a0)
    80009db8:	45050713          	addi	a4,a0,1104
    KSemaphore(unsigned val):val(val)
    80009dbc:	40000613          	li	a2,1024
    80009dc0:	44c52c23          	sw	a2,1112(a0)
    80009dc4:	46053023          	sd	zero,1120(a0)
    80009dc8:	46053423          	sd	zero,1128(a0)
    80009dcc:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores; 
    80009dd0:	44d53823          	sd	a3,1104(a0)
        activeSemaphores = this;
    80009dd4:	00e7b023          	sd	a4,0(a5)
    80009dd8:	46052c23          	sw	zero,1144(a0)
    80009ddc:	46052e23          	sw	zero,1148(a0)
    80009de0:	48052023          	sw	zero,1152(a0)
    80009de4:	0000b797          	auipc	a5,0xb
    80009de8:	62a7b223          	sd	a0,1572(a5) # 80015408 <_ZN5StdIO7obufferE>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80009dec:	0000b797          	auipc	a5,0xb
    80009df0:	59478793          	addi	a5,a5,1428 # 80015380 <_ZN10KSemaphore5cacheE>
    80009df4:	0007b783          	ld	a5,0(a5)
    80009df8:	18078a63          	beqz	a5,80009f8c <_ZN5StdIO9initalizeEv+0x2f0>
    80009dfc:	0000b797          	auipc	a5,0xb
    80009e00:	58478793          	addi	a5,a5,1412 # 80015380 <_ZN10KSemaphore5cacheE>
    80009e04:	0007b503          	ld	a0,0(a5)
    80009e08:	fffff097          	auipc	ra,0xfffff
    80009e0c:	c9c080e7          	jalr	-868(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    blockSem = new KSemaphore(0);
    80009e10:	02050463          	beqz	a0,80009e38 <_ZN5StdIO9initalizeEv+0x19c>
    KSemaphore(unsigned val):val(val)
    80009e14:	00052423          	sw	zero,8(a0)
    80009e18:	00053823          	sd	zero,16(a0)
    80009e1c:	00053c23          	sd	zero,24(a0)
    80009e20:	02052023          	sw	zero,32(a0)
        next = activeSemaphores; 
    80009e24:	0000b797          	auipc	a5,0xb
    80009e28:	56478793          	addi	a5,a5,1380 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    80009e2c:	0007b703          	ld	a4,0(a5)
    80009e30:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80009e34:	00a7b023          	sd	a0,0(a5)
    80009e38:	0000b797          	auipc	a5,0xb
    80009e3c:	5ca7b423          	sd	a0,1480(a5) # 80015400 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80009e40:	00005797          	auipc	a5,0x5
    80009e44:	1d078793          	addi	a5,a5,464 # 8000f010 <CONSOLE_STATUS>
    80009e48:	0007b783          	ld	a5,0(a5)
    80009e4c:	0000b717          	auipc	a4,0xb
    80009e50:	5cf73e23          	sd	a5,1500(a4) # 80015428 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80009e54:	00005797          	auipc	a5,0x5
    80009e58:	1ac78793          	addi	a5,a5,428 # 8000f000 <CONSOLE_RX_DATA>
    80009e5c:	0007b783          	ld	a5,0(a5)
    80009e60:	0000b717          	auipc	a4,0xb
    80009e64:	5cf73023          	sd	a5,1472(a4) # 80015420 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80009e68:	00005797          	auipc	a5,0x5
    80009e6c:	1a078793          	addi	a5,a5,416 # 8000f008 <CONSOLE_TX_DATA>
    80009e70:	0007b783          	ld	a5,0(a5)
    80009e74:	0000b717          	auipc	a4,0xb
    80009e78:	5af73223          	sd	a5,1444(a4) # 80015418 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)SlabAllocator::getInstance().kmalloc(DEFAULT_STACK_SIZE);
    80009e7c:	fffff097          	auipc	ra,0xfffff
    80009e80:	498080e7          	jalr	1176(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    80009e84:	000015b7          	lui	a1,0x1
    80009e88:	fffff097          	auipc	ra,0xfffff
    80009e8c:	590080e7          	jalr	1424(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80009e90:	00050613          	mv	a2,a0
    80009e94:	00000593          	li	a1,0
    80009e98:	00000517          	auipc	a0,0x0
    80009e9c:	cfc50513          	addi	a0,a0,-772 # 80009b94 <_ZN5StdIO12outputWorkerEPv>
    80009ea0:	ffffb097          	auipc	ra,0xffffb
    80009ea4:	b3c080e7          	jalr	-1220(ra) # 800049dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80009ea8:	0000b797          	auipc	a5,0xb
    80009eac:	54a7b823          	sd	a0,1360(a5) # 800153f8 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80009eb0:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80009eb4:	00100793          	li	a5,1
    80009eb8:	02f50b23          	sb	a5,54(a0)
}
    80009ebc:	01813083          	ld	ra,24(sp)
    80009ec0:	01013403          	ld	s0,16(sp)
    80009ec4:	00813483          	ld	s1,8(sp)
    80009ec8:	00013903          	ld	s2,0(sp)
    80009ecc:	02010113          	addi	sp,sp,32
    80009ed0:	00008067          	ret
    __SLAB_ALLOCATION__(SharedBuffer, nullptr, nullptr);
    80009ed4:	05800513          	li	a0,88
    80009ed8:	fffff097          	auipc	ra,0xfffff
    80009edc:	c7c080e7          	jalr	-900(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80009ee0:	00050493          	mv	s1,a0
    80009ee4:	02050263          	beqz	a0,80009f08 <_ZN5StdIO9initalizeEv+0x26c>
    80009ee8:	00000793          	li	a5,0
    80009eec:	00000713          	li	a4,0
    80009ef0:	00000693          	li	a3,0
    80009ef4:	48800613          	li	a2,1160
    80009ef8:	00006597          	auipc	a1,0x6
    80009efc:	bd058593          	addi	a1,a1,-1072 # 8000fac8 <CONSOLE_STATUS+0xab8>
    80009f00:	ffffe097          	auipc	ra,0xffffe
    80009f04:	108080e7          	jalr	264(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009f08:	0000b797          	auipc	a5,0xb
    80009f0c:	4e97b423          	sd	s1,1256(a5) # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009f10:	db5ff06f          	j	80009cc4 <_ZN5StdIO9initalizeEv+0x28>
    80009f14:	00050913          	mv	s2,a0
    80009f18:	00048513          	mv	a0,s1
    80009f1c:	fffff097          	auipc	ra,0xfffff
    80009f20:	d98080e7          	jalr	-616(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80009f24:	00090513          	mv	a0,s2
    80009f28:	0000c097          	auipc	ra,0xc
    80009f2c:	650080e7          	jalr	1616(ra) # 80016578 <_Unwind_Resume>
    80009f30:	05800513          	li	a0,88
    80009f34:	fffff097          	auipc	ra,0xfffff
    80009f38:	c20080e7          	jalr	-992(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80009f3c:	00050493          	mv	s1,a0
    80009f40:	02050263          	beqz	a0,80009f64 <_ZN5StdIO9initalizeEv+0x2c8>
    80009f44:	00000793          	li	a5,0
    80009f48:	00000713          	li	a4,0
    80009f4c:	00000693          	li	a3,0
    80009f50:	48800613          	li	a2,1160
    80009f54:	00006597          	auipc	a1,0x6
    80009f58:	b7458593          	addi	a1,a1,-1164 # 8000fac8 <CONSOLE_STATUS+0xab8>
    80009f5c:	ffffe097          	auipc	ra,0xffffe
    80009f60:	0ac080e7          	jalr	172(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009f64:	0000b797          	auipc	a5,0xb
    80009f68:	4897b623          	sd	s1,1164(a5) # 800153f0 <_ZN12SharedBufferIcE5cacheE>
    80009f6c:	df5ff06f          	j	80009d60 <_ZN5StdIO9initalizeEv+0xc4>
    80009f70:	00050913          	mv	s2,a0
    80009f74:	00048513          	mv	a0,s1
    80009f78:	fffff097          	auipc	ra,0xfffff
    80009f7c:	d3c080e7          	jalr	-708(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80009f80:	00090513          	mv	a0,s2
    80009f84:	0000c097          	auipc	ra,0xc
    80009f88:	5f4080e7          	jalr	1524(ra) # 80016578 <_Unwind_Resume>
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)
    80009f8c:	05800513          	li	a0,88
    80009f90:	fffff097          	auipc	ra,0xfffff
    80009f94:	bc4080e7          	jalr	-1084(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    80009f98:	00050493          	mv	s1,a0
    80009f9c:	02050263          	beqz	a0,80009fc0 <_ZN5StdIO9initalizeEv+0x324>
    80009fa0:	00000793          	li	a5,0
    80009fa4:	00000713          	li	a4,0
    80009fa8:	00000693          	li	a3,0
    80009fac:	02800613          	li	a2,40
    80009fb0:	00005597          	auipc	a1,0x5
    80009fb4:	3e858593          	addi	a1,a1,1000 # 8000f398 <CONSOLE_STATUS+0x388>
    80009fb8:	ffffe097          	auipc	ra,0xffffe
    80009fbc:	050080e7          	jalr	80(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    80009fc0:	0000b797          	auipc	a5,0xb
    80009fc4:	3c97b023          	sd	s1,960(a5) # 80015380 <_ZN10KSemaphore5cacheE>
    80009fc8:	e35ff06f          	j	80009dfc <_ZN5StdIO9initalizeEv+0x160>
    80009fcc:	00050913          	mv	s2,a0
    80009fd0:	00048513          	mv	a0,s1
    80009fd4:	fffff097          	auipc	ra,0xfffff
    80009fd8:	ce0080e7          	jalr	-800(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    80009fdc:	00090513          	mv	a0,s2
    80009fe0:	0000c097          	auipc	ra,0xc
    80009fe4:	598080e7          	jalr	1432(ra) # 80016578 <_Unwind_Resume>

0000000080009fe8 <_ZN5StdIO11inputWorkerEv>:
{
    80009fe8:	ff010113          	addi	sp,sp,-16
    80009fec:	00813423          	sd	s0,8(sp)
    80009ff0:	01010413          	addi	s0,sp,16
}
    80009ff4:	00813403          	ld	s0,8(sp)
    80009ff8:	01010113          	addi	sp,sp,16
    80009ffc:	00008067          	ret

000000008000a000 <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    8000a000:	fc010113          	addi	sp,sp,-64
    8000a004:	02113c23          	sd	ra,56(sp)
    8000a008:	02813823          	sd	s0,48(sp)
    8000a00c:	02913423          	sd	s1,40(sp)
    8000a010:	03213023          	sd	s2,32(sp)
    8000a014:	01313c23          	sd	s3,24(sp)
    8000a018:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    8000a01c:	ffff8097          	auipc	ra,0xffff8
    8000a020:	838080e7          	jalr	-1992(ra) # 80001854 <plic_claim>
    if(t == CONSOLE_IRQ)
    8000a024:	00a00793          	li	a5,10
    8000a028:	12f51063          	bne	a0,a5,8000a148 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    8000a02c:	0000b797          	auipc	a5,0xb
    8000a030:	3fc78793          	addi	a5,a5,1020 # 80015428 <_ZN5StdIO8iostatusE>
    8000a034:	0007b783          	ld	a5,0(a5)
    8000a038:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    8000a03c:	0017f793          	andi	a5,a5,1
    8000a040:	0a078263          	beqz	a5,8000a0e4 <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    8000a044:	0000b797          	auipc	a5,0xb
    8000a048:	3dc78793          	addi	a5,a5,988 # 80015420 <_ZN5StdIO5idataE>
    8000a04c:	0007b783          	ld	a5,0(a5)
    8000a050:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    8000a054:	00a00513          	li	a0,10
    8000a058:	ffff8097          	auipc	ra,0xffff8
    8000a05c:	834080e7          	jalr	-1996(ra) # 8000188c <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    8000a060:	0000b797          	auipc	a5,0xb
    8000a064:	3b078793          	addi	a5,a5,944 # 80015410 <_ZN5StdIO7ibufferE>
    8000a068:	0007b483          	ld	s1,0(a5)
    8000a06c:	4804a703          	lw	a4,1152(s1)
    8000a070:	3ff00793          	li	a5,1023
    8000a074:	0ce7ce63          	blt	a5,a4,8000a150 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    8000a078:	45048513          	addi	a0,s1,1104
    8000a07c:	ffffa097          	auipc	ra,0xffffa
    8000a080:	1fc080e7          	jalr	508(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000a084:	40048993          	addi	s3,s1,1024
    8000a088:	00098513          	mv	a0,s3
    8000a08c:	ffffa097          	auipc	ra,0xffffa
    8000a090:	1ec080e7          	jalr	492(ra) # 80004278 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    8000a094:	4804a783          	lw	a5,1152(s1)
    8000a098:	0017879b          	addiw	a5,a5,1
    8000a09c:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    8000a0a0:	47c4a783          	lw	a5,1148(s1)
    8000a0a4:	00f48733          	add	a4,s1,a5
    8000a0a8:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    8000a0ac:	0017879b          	addiw	a5,a5,1
    8000a0b0:	41f7d71b          	sraiw	a4,a5,0x1f
    8000a0b4:	0167571b          	srliw	a4,a4,0x16
    8000a0b8:	00e787bb          	addw	a5,a5,a4
    8000a0bc:	3ff7f793          	andi	a5,a5,1023
    8000a0c0:	40e787bb          	subw	a5,a5,a4
    8000a0c4:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    8000a0c8:	42848513          	addi	a0,s1,1064
    8000a0cc:	ffffa097          	auipc	ra,0xffffa
    8000a0d0:	230080e7          	jalr	560(ra) # 800042fc <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000a0d4:	00098513          	mv	a0,s3
    8000a0d8:	ffffa097          	auipc	ra,0xffffa
    8000a0dc:	224080e7          	jalr	548(ra) # 800042fc <_ZN10KSemaphore6signalEv>
    8000a0e0:	0700006f          	j	8000a150 <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    8000a0e4:	00a00513          	li	a0,10
    8000a0e8:	ffff7097          	auipc	ra,0xffff7
    8000a0ec:	7a4080e7          	jalr	1956(ra) # 8000188c <plic_complete>
            if(out_thread != nullptr)
    8000a0f0:	0000b797          	auipc	a5,0xb
    8000a0f4:	30878793          	addi	a5,a5,776 # 800153f8 <_ZN5StdIO10out_threadE>
    8000a0f8:	0007b783          	ld	a5,0(a5)
    8000a0fc:	04078a63          	beqz	a5,8000a150 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    8000a100:	100027f3          	csrr	a5,sstatus
    8000a104:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    8000a108:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000a10c:	141027f3          	csrr	a5,sepc
    8000a110:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    8000a114:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    8000a118:	0000b797          	auipc	a5,0xb
    8000a11c:	2e078793          	addi	a5,a5,736 # 800153f8 <_ZN5StdIO10out_threadE>
    8000a120:	0007b583          	ld	a1,0(a5)
    8000a124:	0000b517          	auipc	a0,0xb
    8000a128:	34c50513          	addi	a0,a0,844 # 80015470 <_ZN9Scheduler5queueE>
    8000a12c:	ffffb097          	auipc	ra,0xffffb
    8000a130:	ebc080e7          	jalr	-324(ra) # 80004fe8 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    8000a134:	ffffb097          	auipc	ra,0xffffb
    8000a138:	adc080e7          	jalr	-1316(ra) # 80004c10 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000a13c:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    8000a140:	14149073          	csrw	sepc,s1
    8000a144:	00c0006f          	j	8000a150 <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    8000a148:	ffff7097          	auipc	ra,0xffff7
    8000a14c:	744080e7          	jalr	1860(ra) # 8000188c <plic_complete>
    8000a150:	03813083          	ld	ra,56(sp)
    8000a154:	03013403          	ld	s0,48(sp)
    8000a158:	02813483          	ld	s1,40(sp)
    8000a15c:	02013903          	ld	s2,32(sp)
    8000a160:	01813983          	ld	s3,24(sp)
    8000a164:	04010113          	addi	sp,sp,64
    8000a168:	00008067          	ret

000000008000a16c <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    8000a16c:	ff010113          	addi	sp,sp,-16
    8000a170:	00113423          	sd	ra,8(sp)
    8000a174:	00813023          	sd	s0,0(sp)
    8000a178:	01010413          	addi	s0,sp,16
    8000a17c:	000105b7          	lui	a1,0x10
    8000a180:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8000a184:	00100513          	li	a0,1
    8000a188:	00000097          	auipc	ra,0x0
    8000a18c:	9a0080e7          	jalr	-1632(ra) # 80009b28 <_Z41__static_initialization_and_destruction_0ii>
    8000a190:	00813083          	ld	ra,8(sp)
    8000a194:	00013403          	ld	s0,0(sp)
    8000a198:	01010113          	addi	sp,sp,16
    8000a19c:	00008067          	ret

000000008000a1a0 <_Z19buddy_allocate_testhb>:
#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

void* buddy_allocate_test(uchar level, bool a = false){
    8000a1a0:	fe010113          	addi	sp,sp,-32
    8000a1a4:	00113c23          	sd	ra,24(sp)
    8000a1a8:	00813823          	sd	s0,16(sp)
    8000a1ac:	00913423          	sd	s1,8(sp)
    8000a1b0:	01213023          	sd	s2,0(sp)
    8000a1b4:	02010413          	addi	s0,sp,32
    8000a1b8:	00050493          	mv	s1,a0
    8000a1bc:	00058913          	mv	s2,a1
    kprintString("Buddy allocate: 2^");
    8000a1c0:	00006517          	auipc	a0,0x6
    8000a1c4:	92050513          	addi	a0,a0,-1760 # 8000fae0 <CONSOLE_STATUS+0xad0>
    8000a1c8:	ffffb097          	auipc	ra,0xffffb
    8000a1cc:	edc080e7          	jalr	-292(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintInt(level);
    8000a1d0:	00000613          	li	a2,0
    8000a1d4:	00a00593          	li	a1,10
    8000a1d8:	00048513          	mv	a0,s1
    8000a1dc:	ffffb097          	auipc	ra,0xffffb
    8000a1e0:	f10080e7          	jalr	-240(ra) # 800050ec <_Z9kprintIntmib>
    kprintString(" blocks\n");
    8000a1e4:	00006517          	auipc	a0,0x6
    8000a1e8:	91450513          	addi	a0,a0,-1772 # 8000faf8 <CONSOLE_STATUS+0xae8>
    8000a1ec:	ffffb097          	auipc	ra,0xffffb
    8000a1f0:	eb8080e7          	jalr	-328(ra) # 800050a4 <_Z12kprintStringPKc>
    void* ret = Buddy::getInstance().mem_alloc(level);
    8000a1f4:	ffffc097          	auipc	ra,0xffffc
    8000a1f8:	704080e7          	jalr	1796(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    8000a1fc:	00048593          	mv	a1,s1
    8000a200:	ffffd097          	auipc	ra,0xffffd
    8000a204:	c74080e7          	jalr	-908(ra) # 80006e74 <_ZN5Buddy9mem_allocEh>
    8000a208:	00050493          	mv	s1,a0
    KVALCHECKPRINT(Returned address, ret);
    8000a20c:	00006517          	auipc	a0,0x6
    8000a210:	8fc50513          	addi	a0,a0,-1796 # 8000fb08 <CONSOLE_STATUS+0xaf8>
    8000a214:	ffffb097          	auipc	ra,0xffffb
    8000a218:	e90080e7          	jalr	-368(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a21c:	00000613          	li	a2,0
    8000a220:	01000593          	li	a1,16
    8000a224:	00048513          	mv	a0,s1
    8000a228:	ffffb097          	auipc	ra,0xffffb
    8000a22c:	ec4080e7          	jalr	-316(ra) # 800050ec <_Z9kprintIntmib>
    8000a230:	00005517          	auipc	a0,0x5
    8000a234:	12850513          	addi	a0,a0,296 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a238:	ffffb097          	auipc	ra,0xffffb
    8000a23c:	e6c080e7          	jalr	-404(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("\n");
    8000a240:	00005517          	auipc	a0,0x5
    8000a244:	11850513          	addi	a0,a0,280 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a248:	ffffb097          	auipc	ra,0xffffb
    8000a24c:	e5c080e7          	jalr	-420(ra) # 800050a4 <_Z12kprintStringPKc>
    if(!ret)
    8000a250:	04048263          	beqz	s1,8000a294 <_Z19buddy_allocate_testhb+0xf4>
        kprintString("BUDDY ALLOCATE ERROR\n");
    kprintString("\n");
    8000a254:	00005517          	auipc	a0,0x5
    8000a258:	10450513          	addi	a0,a0,260 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a25c:	ffffb097          	auipc	ra,0xffffb
    8000a260:	e48080e7          	jalr	-440(ra) # 800050a4 <_Z12kprintStringPKc>
    
    if(a) Buddy::getInstance().status_print();
    8000a264:	04091263          	bnez	s2,8000a2a8 <_Z19buddy_allocate_testhb+0x108>
    kprintString("\n");
    8000a268:	00005517          	auipc	a0,0x5
    8000a26c:	0f050513          	addi	a0,a0,240 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a270:	ffffb097          	auipc	ra,0xffffb
    8000a274:	e34080e7          	jalr	-460(ra) # 800050a4 <_Z12kprintStringPKc>
    return ret;
}
    8000a278:	00048513          	mv	a0,s1
    8000a27c:	01813083          	ld	ra,24(sp)
    8000a280:	01013403          	ld	s0,16(sp)
    8000a284:	00813483          	ld	s1,8(sp)
    8000a288:	00013903          	ld	s2,0(sp)
    8000a28c:	02010113          	addi	sp,sp,32
    8000a290:	00008067          	ret
        kprintString("BUDDY ALLOCATE ERROR\n");
    8000a294:	00006517          	auipc	a0,0x6
    8000a298:	88c50513          	addi	a0,a0,-1908 # 8000fb20 <CONSOLE_STATUS+0xb10>
    8000a29c:	ffffb097          	auipc	ra,0xffffb
    8000a2a0:	e08080e7          	jalr	-504(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a2a4:	fb1ff06f          	j	8000a254 <_Z19buddy_allocate_testhb+0xb4>
    if(a) Buddy::getInstance().status_print();
    8000a2a8:	ffffc097          	auipc	ra,0xffffc
    8000a2ac:	650080e7          	jalr	1616(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    8000a2b0:	00100593          	li	a1,1
    8000a2b4:	ffffd097          	auipc	ra,0xffffd
    8000a2b8:	e44080e7          	jalr	-444(ra) # 800070f8 <_ZN5Buddy12status_printEb>
    8000a2bc:	fadff06f          	j	8000a268 <_Z19buddy_allocate_testhb+0xc8>

000000008000a2c0 <_Z21buddy_deallocate_testPvhb>:

int buddy_deallocate_test(void* s, uchar level, bool a = false){
    8000a2c0:	fd010113          	addi	sp,sp,-48
    8000a2c4:	02113423          	sd	ra,40(sp)
    8000a2c8:	02813023          	sd	s0,32(sp)
    8000a2cc:	00913c23          	sd	s1,24(sp)
    8000a2d0:	01213823          	sd	s2,16(sp)
    8000a2d4:	01313423          	sd	s3,8(sp)
    8000a2d8:	03010413          	addi	s0,sp,48
    8000a2dc:	00050493          	mv	s1,a0
    8000a2e0:	00058913          	mv	s2,a1
    8000a2e4:	00060993          	mv	s3,a2
    kprintString("Buddy deallocate 2^"); 
    8000a2e8:	00006517          	auipc	a0,0x6
    8000a2ec:	85050513          	addi	a0,a0,-1968 # 8000fb38 <CONSOLE_STATUS+0xb28>
    8000a2f0:	ffffb097          	auipc	ra,0xffffb
    8000a2f4:	db4080e7          	jalr	-588(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintInt(level);
    8000a2f8:	00000613          	li	a2,0
    8000a2fc:	00a00593          	li	a1,10
    8000a300:	00090513          	mv	a0,s2
    8000a304:	ffffb097          	auipc	ra,0xffffb
    8000a308:	de8080e7          	jalr	-536(ra) # 800050ec <_Z9kprintIntmib>
    kprintString(" blocks on address: ");
    8000a30c:	00006517          	auipc	a0,0x6
    8000a310:	84450513          	addi	a0,a0,-1980 # 8000fb50 <CONSOLE_STATUS+0xb40>
    8000a314:	ffffb097          	auipc	ra,0xffffb
    8000a318:	d90080e7          	jalr	-624(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintInt((uint64)s, 16);
    8000a31c:	00000613          	li	a2,0
    8000a320:	01000593          	li	a1,16
    8000a324:	00048513          	mv	a0,s1
    8000a328:	ffffb097          	auipc	ra,0xffffb
    8000a32c:	dc4080e7          	jalr	-572(ra) # 800050ec <_Z9kprintIntmib>
    kprintString("\n");
    8000a330:	00005517          	auipc	a0,0x5
    8000a334:	02850513          	addi	a0,a0,40 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a338:	ffffb097          	auipc	ra,0xffffb
    8000a33c:	d6c080e7          	jalr	-660(ra) # 800050a4 <_Z12kprintStringPKc>
    int ret = Buddy::getInstance().mem_free(s, level);
    8000a340:	ffffc097          	auipc	ra,0xffffc
    8000a344:	5b8080e7          	jalr	1464(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    8000a348:	00090613          	mv	a2,s2
    8000a34c:	00048593          	mv	a1,s1
    8000a350:	ffffd097          	auipc	ra,0xffffd
    8000a354:	18c080e7          	jalr	396(ra) # 800074dc <_ZN5Buddy8mem_freeEPvh>
    8000a358:	00050493          	mv	s1,a0
    if(ret < 0){
    8000a35c:	04054463          	bltz	a0,8000a3a4 <_Z21buddy_deallocate_testPvhb+0xe4>
        kprintString("BUDDY DEALLOCATE ERROR:");
        kprintInt((uint64)ret, 10, true);
        kprintString("\n");
    }
    kprintString("\n");
    8000a360:	00005517          	auipc	a0,0x5
    8000a364:	ff850513          	addi	a0,a0,-8 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a368:	ffffb097          	auipc	ra,0xffffb
    8000a36c:	d3c080e7          	jalr	-708(ra) # 800050a4 <_Z12kprintStringPKc>
    if(a) Buddy::getInstance().status_print();
    8000a370:	06099663          	bnez	s3,8000a3dc <_Z21buddy_deallocate_testPvhb+0x11c>
    kprintString("\n");
    8000a374:	00005517          	auipc	a0,0x5
    8000a378:	fe450513          	addi	a0,a0,-28 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a37c:	ffffb097          	auipc	ra,0xffffb
    8000a380:	d28080e7          	jalr	-728(ra) # 800050a4 <_Z12kprintStringPKc>
    return ret;
}
    8000a384:	00048513          	mv	a0,s1
    8000a388:	02813083          	ld	ra,40(sp)
    8000a38c:	02013403          	ld	s0,32(sp)
    8000a390:	01813483          	ld	s1,24(sp)
    8000a394:	01013903          	ld	s2,16(sp)
    8000a398:	00813983          	ld	s3,8(sp)
    8000a39c:	03010113          	addi	sp,sp,48
    8000a3a0:	00008067          	ret
        kprintString("BUDDY DEALLOCATE ERROR:");
    8000a3a4:	00005517          	auipc	a0,0x5
    8000a3a8:	7c450513          	addi	a0,a0,1988 # 8000fb68 <CONSOLE_STATUS+0xb58>
    8000a3ac:	ffffb097          	auipc	ra,0xffffb
    8000a3b0:	cf8080e7          	jalr	-776(ra) # 800050a4 <_Z12kprintStringPKc>
        kprintInt((uint64)ret, 10, true);
    8000a3b4:	00100613          	li	a2,1
    8000a3b8:	00a00593          	li	a1,10
    8000a3bc:	00048513          	mv	a0,s1
    8000a3c0:	ffffb097          	auipc	ra,0xffffb
    8000a3c4:	d2c080e7          	jalr	-724(ra) # 800050ec <_Z9kprintIntmib>
        kprintString("\n");
    8000a3c8:	00005517          	auipc	a0,0x5
    8000a3cc:	f9050513          	addi	a0,a0,-112 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a3d0:	ffffb097          	auipc	ra,0xffffb
    8000a3d4:	cd4080e7          	jalr	-812(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a3d8:	f89ff06f          	j	8000a360 <_Z21buddy_deallocate_testPvhb+0xa0>
    if(a) Buddy::getInstance().status_print();
    8000a3dc:	ffffc097          	auipc	ra,0xffffc
    8000a3e0:	51c080e7          	jalr	1308(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    8000a3e4:	00100593          	li	a1,1
    8000a3e8:	ffffd097          	auipc	ra,0xffffd
    8000a3ec:	d10080e7          	jalr	-752(ra) # 800070f8 <_ZN5Buddy12status_printEb>
    8000a3f0:	f85ff06f          	j	8000a374 <_Z21buddy_deallocate_testPvhb+0xb4>

000000008000a3f4 <_Z10buddy_testv>:

void buddy_test(){
    8000a3f4:	fe010113          	addi	sp,sp,-32
    8000a3f8:	00113c23          	sd	ra,24(sp)
    8000a3fc:	00813823          	sd	s0,16(sp)
    8000a400:	00913423          	sd	s1,8(sp)
    8000a404:	02010413          	addi	s0,sp,32
    kprintString("--------BUDDY TEST--------\n");
    8000a408:	00005517          	auipc	a0,0x5
    8000a40c:	77850513          	addi	a0,a0,1912 # 8000fb80 <CONSOLE_STATUS+0xb70>
    8000a410:	ffffb097          	auipc	ra,0xffffb
    8000a414:	c94080e7          	jalr	-876(ra) # 800050a4 <_Z12kprintStringPKc>

    /* allocate deallocate */
    bool x = false;
    void* t = buddy_allocate_test(4, x);
    8000a418:	00000593          	li	a1,0
    8000a41c:	00400513          	li	a0,4
    8000a420:	00000097          	auipc	ra,0x0
    8000a424:	d80080e7          	jalr	-640(ra) # 8000a1a0 <_Z19buddy_allocate_testhb>
    8000a428:	00050493          	mv	s1,a0
    buddy_deallocate_test(t, 4, x);
    8000a42c:	00000613          	li	a2,0
    8000a430:	00400593          	li	a1,4
    8000a434:	00000097          	auipc	ra,0x0
    8000a438:	e8c080e7          	jalr	-372(ra) # 8000a2c0 <_Z21buddy_deallocate_testPvhb>

    /* allocate errors */
    x = true;
    buddy_allocate_test(13);
    8000a43c:	00000593          	li	a1,0
    8000a440:	00d00513          	li	a0,13
    8000a444:	00000097          	auipc	ra,0x0
    8000a448:	d5c080e7          	jalr	-676(ra) # 8000a1a0 <_Z19buddy_allocate_testhb>
    buddy_deallocate_test(t, 13);
    8000a44c:	00000613          	li	a2,0
    8000a450:	00d00593          	li	a1,13
    8000a454:	00048513          	mv	a0,s1
    8000a458:	00000097          	auipc	ra,0x0
    8000a45c:	e68080e7          	jalr	-408(ra) # 8000a2c0 <_Z21buddy_deallocate_testPvhb>
    buddy_deallocate_test(nullptr, 2);
    8000a460:	00000613          	li	a2,0
    8000a464:	00200593          	li	a1,2
    8000a468:	00000513          	li	a0,0
    8000a46c:	00000097          	auipc	ra,0x0
    8000a470:	e54080e7          	jalr	-428(ra) # 8000a2c0 <_Z21buddy_deallocate_testPvhb>

    kprintString("------BUDDY TEST END------\n");
    8000a474:	00005517          	auipc	a0,0x5
    8000a478:	72c50513          	addi	a0,a0,1836 # 8000fba0 <CONSOLE_STATUS+0xb90>
    8000a47c:	ffffb097          	auipc	ra,0xffffb
    8000a480:	c28080e7          	jalr	-984(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a484:	01813083          	ld	ra,24(sp)
    8000a488:	01013403          	ld	s0,16(sp)
    8000a48c:	00813483          	ld	s1,8(sp)
    8000a490:	02010113          	addi	sp,sp,32
    8000a494:	00008067          	ret

000000008000a498 <_Z6memsetPKvii>:
                                    "tc_1",
                                    "tc_2",
                                    "tc_3",
                                    "tc_4"};

void memset(const void *data, int size, int value) {
    8000a498:	ff010113          	addi	sp,sp,-16
    8000a49c:	00813423          	sd	s0,8(sp)
    8000a4a0:	01010413          	addi	s0,sp,16
    for (int j = 0; j < size; j++) {
    8000a4a4:	00000793          	li	a5,0
    8000a4a8:	00b7da63          	bge	a5,a1,8000a4bc <_Z6memsetPKvii+0x24>
        *((char *)data + j) = value;
    8000a4ac:	00f50733          	add	a4,a0,a5
    8000a4b0:	00c70023          	sb	a2,0(a4)
    for (int j = 0; j < size; j++) {
    8000a4b4:	0017879b          	addiw	a5,a5,1
    8000a4b8:	ff1ff06f          	j	8000a4a8 <_Z6memsetPKvii+0x10>
    }
}
    8000a4bc:	00813403          	ld	s0,8(sp)
    8000a4c0:	01010113          	addi	sp,sp,16
    8000a4c4:	00008067          	ret

000000008000a4c8 <_Z9constructPv>:

void construct(void *data) {
    8000a4c8:	fe010113          	addi	sp,sp,-32
    8000a4cc:	00113c23          	sd	ra,24(sp)
    8000a4d0:	00813823          	sd	s0,16(sp)
    8000a4d4:	00913423          	sd	s1,8(sp)
    8000a4d8:	02010413          	addi	s0,sp,32
    8000a4dc:	00050493          	mv	s1,a0
	static int i = 1;
	kprintInt(i++); kprintString(" Shared object constructed\n");
    8000a4e0:	00009797          	auipc	a5,0x9
    8000a4e4:	71878793          	addi	a5,a5,1816 # 80013bf8 <_ZZ9constructPvE1i>
    8000a4e8:	0007a503          	lw	a0,0(a5)
    8000a4ec:	0015071b          	addiw	a4,a0,1
    8000a4f0:	00e7a023          	sw	a4,0(a5)
    8000a4f4:	00000613          	li	a2,0
    8000a4f8:	00a00593          	li	a1,10
    8000a4fc:	ffffb097          	auipc	ra,0xffffb
    8000a500:	bf0080e7          	jalr	-1040(ra) # 800050ec <_Z9kprintIntmib>
    8000a504:	00005517          	auipc	a0,0x5
    8000a508:	6e450513          	addi	a0,a0,1764 # 8000fbe8 <_ZL11CACHE_NAMES+0x28>
    8000a50c:	ffffb097          	auipc	ra,0xffffb
    8000a510:	b98080e7          	jalr	-1128(ra) # 800050a4 <_Z12kprintStringPKc>
	// kprintf("%d Shared object constructed.\n", i++);
    memset(data, shared_size, MASK);
    8000a514:	0a500613          	li	a2,165
    8000a518:	00700593          	li	a1,7
    8000a51c:	00048513          	mv	a0,s1
    8000a520:	00000097          	auipc	ra,0x0
    8000a524:	f78080e7          	jalr	-136(ra) # 8000a498 <_Z6memsetPKvii>
}
    8000a528:	01813083          	ld	ra,24(sp)
    8000a52c:	01013403          	ld	s0,16(sp)
    8000a530:	00813483          	ld	s1,8(sp)
    8000a534:	02010113          	addi	sp,sp,32
    8000a538:	00008067          	ret

000000008000a53c <_Z5checkPvm>:

int check(void *data, size_t size) {
    8000a53c:	ff010113          	addi	sp,sp,-16
    8000a540:	00813423          	sd	s0,8(sp)
    8000a544:	01010413          	addi	s0,sp,16
    8000a548:	00050613          	mv	a2,a0
	int ret = 1;
	for (size_t i = 0; i < size; i++) {
    8000a54c:	00000793          	li	a5,0
	int ret = 1;
    8000a550:	00100513          	li	a0,1
    8000a554:	0080006f          	j	8000a55c <_Z5checkPvm+0x20>
	for (size_t i = 0; i < size; i++) {
    8000a558:	00178793          	addi	a5,a5,1
    8000a55c:	00b7fe63          	bgeu	a5,a1,8000a578 <_Z5checkPvm+0x3c>
		if (((unsigned char *)data)[i] != MASK) {
    8000a560:	00f60733          	add	a4,a2,a5
    8000a564:	00074683          	lbu	a3,0(a4)
    8000a568:	0a500713          	li	a4,165
    8000a56c:	fee686e3          	beq	a3,a4,8000a558 <_Z5checkPvm+0x1c>
			ret = 0;
    8000a570:	00000513          	li	a0,0
    8000a574:	fe5ff06f          	j	8000a558 <_Z5checkPvm+0x1c>
		}
	}

	return ret;
}
    8000a578:	00813403          	ld	s0,8(sp)
    8000a57c:	01010113          	addi	sp,sp,16
    8000a580:	00008067          	ret

000000008000a584 <_Z4workPv>:
struct objects_s {
	kmem_cache_t *cache;
	void *data;
};

void work(void* pdata) {
    8000a584:	f9010113          	addi	sp,sp,-112
    8000a588:	06113423          	sd	ra,104(sp)
    8000a58c:	06813023          	sd	s0,96(sp)
    8000a590:	04913c23          	sd	s1,88(sp)
    8000a594:	05213823          	sd	s2,80(sp)
    8000a598:	05313423          	sd	s3,72(sp)
    8000a59c:	05413023          	sd	s4,64(sp)
    8000a5a0:	03513c23          	sd	s5,56(sp)
    8000a5a4:	03613823          	sd	s6,48(sp)
    8000a5a8:	03713423          	sd	s7,40(sp)
    8000a5ac:	07010413          	addi	s0,sp,112
	struct data_s data = *(struct data_s*) pdata;
    8000a5b0:	00053783          	ld	a5,0(a0)
    8000a5b4:	f8f43c23          	sd	a5,-104(s0)
    8000a5b8:	00853703          	ld	a4,8(a0)
    8000a5bc:	fae43023          	sd	a4,-96(s0)
    8000a5c0:	01053703          	ld	a4,16(a0)
    8000a5c4:	fae43423          	sd	a4,-88(s0)
	int size = 0;
    int object_size = data.id + 1;
    8000a5c8:	0007879b          	sext.w	a5,a5
    8000a5cc:	0017899b          	addiw	s3,a5,1
	kmem_cache_t *cache = kmem_cache_create(CACHE_NAMES[data.id], object_size, 0, 0);
    8000a5d0:	00379793          	slli	a5,a5,0x3
    8000a5d4:	00005717          	auipc	a4,0x5
    8000a5d8:	5ec70713          	addi	a4,a4,1516 # 8000fbc0 <_ZL11CACHE_NAMES>
    8000a5dc:	00f707b3          	add	a5,a4,a5
    8000a5e0:	00098b13          	mv	s6,s3
    8000a5e4:	00000693          	li	a3,0
    8000a5e8:	00000613          	li	a2,0
    8000a5ec:	00098593          	mv	a1,s3
    8000a5f0:	0007b503          	ld	a0,0(a5)
    8000a5f4:	fffff097          	auipc	ra,0xfffff
    8000a5f8:	8d0080e7          	jalr	-1840(ra) # 80008ec4 <_Z17kmem_cache_createPKcmPFvPvES3_>
    8000a5fc:	00050a13          	mv	s4,a0

	struct objects_s *objs = (struct objects_s*)(kmalloc(sizeof(struct objects_s) * data.iterations));
    8000a600:	fa842503          	lw	a0,-88(s0)
    8000a604:	00451513          	slli	a0,a0,0x4
    8000a608:	fffff097          	auipc	ra,0xfffff
    8000a60c:	9e0080e7          	jalr	-1568(ra) # 80008fe8 <_Z7kmallocm>
    8000a610:	00050a93          	mv	s5,a0
	int size = 0;
    8000a614:	00000913          	li	s2,0
    8000a618:	0340006f          	j	8000a64c <_Z4workPv+0xc8>
				kprintString("Value not correct!\n");
                //kprintf("Value not correct!");
            }
		}
		else {
			objs[size].data = kmem_cache_alloc(cache);
    8000a61c:	00491493          	slli	s1,s2,0x4
    8000a620:	009a84b3          	add	s1,s5,s1
    8000a624:	000a0513          	mv	a0,s4
    8000a628:	fffff097          	auipc	ra,0xfffff
    8000a62c:	970080e7          	jalr	-1680(ra) # 80008f98 <_Z16kmem_cache_allocP11ObjectCache>
    8000a630:	00a4b423          	sd	a0,8(s1)
			objs[size].cache = cache;
    8000a634:	0144b023          	sd	s4,0(s1)
			memset(objs[size].data, object_size, MASK);
    8000a638:	0a500613          	li	a2,165
    8000a63c:	00098593          	mv	a1,s3
    8000a640:	00000097          	auipc	ra,0x0
    8000a644:	e58080e7          	jalr	-424(ra) # 8000a498 <_Z6memsetPKvii>
		}
		size++;
    8000a648:	0019091b          	addiw	s2,s2,1
	for (int i = 0; i < data.iterations; i++) {
    8000a64c:	fa842783          	lw	a5,-88(s0)
    8000a650:	04f95a63          	bge	s2,a5,8000a6a4 <_Z4workPv+0x120>
		if (i % 100 == 0) {
    8000a654:	06400793          	li	a5,100
    8000a658:	02f967bb          	remw	a5,s2,a5
    8000a65c:	fc0790e3          	bnez	a5,8000a61c <_Z4workPv+0x98>
			objs[size].data = kmem_cache_alloc(data.shared);
    8000a660:	fa043b83          	ld	s7,-96(s0)
    8000a664:	00491493          	slli	s1,s2,0x4
    8000a668:	009a84b3          	add	s1,s5,s1
    8000a66c:	000b8513          	mv	a0,s7
    8000a670:	fffff097          	auipc	ra,0xfffff
    8000a674:	928080e7          	jalr	-1752(ra) # 80008f98 <_Z16kmem_cache_allocP11ObjectCache>
    8000a678:	00a4b423          	sd	a0,8(s1)
			objs[size].cache = data.shared;
    8000a67c:	0174b023          	sd	s7,0(s1)
			if (!check(objs[size].data, shared_size)) {
    8000a680:	00700593          	li	a1,7
    8000a684:	00000097          	auipc	ra,0x0
    8000a688:	eb8080e7          	jalr	-328(ra) # 8000a53c <_Z5checkPvm>
    8000a68c:	fa051ee3          	bnez	a0,8000a648 <_Z4workPv+0xc4>
				kprintString("Value not correct!\n");
    8000a690:	00005517          	auipc	a0,0x5
    8000a694:	57850513          	addi	a0,a0,1400 # 8000fc08 <_ZL11CACHE_NAMES+0x48>
    8000a698:	ffffb097          	auipc	ra,0xffffb
    8000a69c:	a0c080e7          	jalr	-1524(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a6a0:	fa9ff06f          	j	8000a648 <_Z4workPv+0xc4>
	}

	kmem_cache_info(cache);
    8000a6a4:	000a0513          	mv	a0,s4
    8000a6a8:	fffff097          	auipc	ra,0xfffff
    8000a6ac:	a08080e7          	jalr	-1528(ra) # 800090b0 <_Z15kmem_cache_infoP11ObjectCache>
	kmem_cache_info(data.shared);
    8000a6b0:	fa043503          	ld	a0,-96(s0)
    8000a6b4:	fffff097          	auipc	ra,0xfffff
    8000a6b8:	9fc080e7          	jalr	-1540(ra) # 800090b0 <_Z15kmem_cache_infoP11ObjectCache>

	for (int i = 0; i < size; i++) {
    8000a6bc:	00000993          	li	s3,0
    8000a6c0:	0300006f          	j	8000a6f0 <_Z4workPv+0x16c>
		if (!check(objs[i].data, (cache == objs[i].cache) ? object_size : shared_size)) {
    8000a6c4:	000b0593          	mv	a1,s6
    8000a6c8:	0440006f          	j	8000a70c <_Z4workPv+0x188>
            kprintString("Value not correct!\n");
    8000a6cc:	00005517          	auipc	a0,0x5
    8000a6d0:	53c50513          	addi	a0,a0,1340 # 8000fc08 <_ZL11CACHE_NAMES+0x48>
    8000a6d4:	ffffb097          	auipc	ra,0xffffb
    8000a6d8:	9d0080e7          	jalr	-1584(ra) # 800050a4 <_Z12kprintStringPKc>
			// kprintf("Value not correct!");
        }
		kmem_cache_free(objs[i].cache, objs[i].data);
    8000a6dc:	0084b583          	ld	a1,8(s1)
    8000a6e0:	0004b503          	ld	a0,0(s1)
    8000a6e4:	fffff097          	auipc	ra,0xfffff
    8000a6e8:	8dc080e7          	jalr	-1828(ra) # 80008fc0 <_Z15kmem_cache_freeP11ObjectCachePv>
	for (int i = 0; i < size; i++) {
    8000a6ec:	0019899b          	addiw	s3,s3,1
    8000a6f0:	0329d663          	bge	s3,s2,8000a71c <_Z4workPv+0x198>
		if (!check(objs[i].data, (cache == objs[i].cache) ? object_size : shared_size)) {
    8000a6f4:	00499493          	slli	s1,s3,0x4
    8000a6f8:	009a84b3          	add	s1,s5,s1
    8000a6fc:	0084b503          	ld	a0,8(s1)
    8000a700:	0004b783          	ld	a5,0(s1)
    8000a704:	fd4780e3          	beq	a5,s4,8000a6c4 <_Z4workPv+0x140>
    8000a708:	00700593          	li	a1,7
    8000a70c:	00000097          	auipc	ra,0x0
    8000a710:	e30080e7          	jalr	-464(ra) # 8000a53c <_Z5checkPvm>
    8000a714:	fc0514e3          	bnez	a0,8000a6dc <_Z4workPv+0x158>
    8000a718:	fb5ff06f          	j	8000a6cc <_Z4workPv+0x148>
	}

	kfree(objs);
    8000a71c:	000a8513          	mv	a0,s5
    8000a720:	fffff097          	auipc	ra,0xfffff
    8000a724:	908080e7          	jalr	-1784(ra) # 80009028 <_Z5kfreePv>
	kmem_cache_destroy(cache);
    8000a728:	000a0513          	mv	a0,s4
    8000a72c:	fffff097          	auipc	ra,0xfffff
    8000a730:	93c080e7          	jalr	-1732(ra) # 80009068 <_Z18kmem_cache_destroyP11ObjectCache>
}
    8000a734:	06813083          	ld	ra,104(sp)
    8000a738:	06013403          	ld	s0,96(sp)
    8000a73c:	05813483          	ld	s1,88(sp)
    8000a740:	05013903          	ld	s2,80(sp)
    8000a744:	04813983          	ld	s3,72(sp)
    8000a748:	04013a03          	ld	s4,64(sp)
    8000a74c:	03813a83          	ld	s5,56(sp)
    8000a750:	03013b03          	ld	s6,48(sp)
    8000a754:	02813b83          	ld	s7,40(sp)
    8000a758:	07010113          	addi	sp,sp,112
    8000a75c:	00008067          	ret

000000008000a760 <_Z4runsPFvPvEP6data_si>:



void runs(void(*work)(void*), struct data_s* data, int num) {
    8000a760:	fb010113          	addi	sp,sp,-80
    8000a764:	04113423          	sd	ra,72(sp)
    8000a768:	04813023          	sd	s0,64(sp)
    8000a76c:	02913c23          	sd	s1,56(sp)
    8000a770:	03213823          	sd	s2,48(sp)
    8000a774:	03313423          	sd	s3,40(sp)
    8000a778:	03413023          	sd	s4,32(sp)
    8000a77c:	05010413          	addi	s0,sp,80
    8000a780:	00050a13          	mv	s4,a0
    8000a784:	00058913          	mv	s2,a1
    8000a788:	00060993          	mv	s3,a2
    for (int i = 0; i < num; i++) {
    8000a78c:	00000493          	li	s1,0
    8000a790:	0334d863          	bge	s1,s3,8000a7c0 <_Z4runsPFvPvEP6data_si+0x60>
        struct data_s private_data;
        private_data = *(struct data_s*) data;
    8000a794:	00093783          	ld	a5,0(s2)
    8000a798:	faf43c23          	sd	a5,-72(s0)
    8000a79c:	00893783          	ld	a5,8(s2)
    8000a7a0:	fcf43023          	sd	a5,-64(s0)
    8000a7a4:	01093783          	ld	a5,16(s2)
    8000a7a8:	fcf43423          	sd	a5,-56(s0)
        private_data.id = i;
    8000a7ac:	fa942c23          	sw	s1,-72(s0)
        work(&private_data);
    8000a7b0:	fb840513          	addi	a0,s0,-72
    8000a7b4:	000a00e7          	jalr	s4
    for (int i = 0; i < num; i++) {
    8000a7b8:	0014849b          	addiw	s1,s1,1
    8000a7bc:	fd5ff06f          	j	8000a790 <_Z4runsPFvPvEP6data_si+0x30>
    }
}
    8000a7c0:	04813083          	ld	ra,72(sp)
    8000a7c4:	04013403          	ld	s0,64(sp)
    8000a7c8:	03813483          	ld	s1,56(sp)
    8000a7cc:	03013903          	ld	s2,48(sp)
    8000a7d0:	02813983          	ld	s3,40(sp)
    8000a7d4:	02013a03          	ld	s4,32(sp)
    8000a7d8:	05010113          	addi	sp,sp,80
    8000a7dc:	00008067          	ret

000000008000a7e0 <kTestMain>:

extern "C" void kTestMain() {
    8000a7e0:	fc010113          	addi	sp,sp,-64
    8000a7e4:	02113c23          	sd	ra,56(sp)
    8000a7e8:	02813823          	sd	s0,48(sp)
    8000a7ec:	02913423          	sd	s1,40(sp)
    8000a7f0:	04010413          	addi	s0,sp,64
	kmem_cache_t *shared = kmem_cache_create("shared object", shared_size, construct, NULL);
    8000a7f4:	00000693          	li	a3,0
    8000a7f8:	00000617          	auipc	a2,0x0
    8000a7fc:	cd060613          	addi	a2,a2,-816 # 8000a4c8 <_Z9constructPv>
    8000a800:	00700593          	li	a1,7
    8000a804:	00005517          	auipc	a0,0x5
    8000a808:	41c50513          	addi	a0,a0,1052 # 8000fc20 <_ZL11CACHE_NAMES+0x60>
    8000a80c:	ffffe097          	auipc	ra,0xffffe
    8000a810:	6b8080e7          	jalr	1720(ra) # 80008ec4 <_Z17kmem_cache_createPKcmPFvPvES3_>
    8000a814:	00050493          	mv	s1,a0

	struct data_s data;
	data.shared = shared;
    8000a818:	fca43823          	sd	a0,-48(s0)
	data.iterations = ITERATIONS;
    8000a81c:	3e800793          	li	a5,1000
    8000a820:	fcf42c23          	sw	a5,-40(s0)
	runs(work, &data, RUN_NUM);
    8000a824:	00500613          	li	a2,5
    8000a828:	fc840593          	addi	a1,s0,-56
    8000a82c:	00000517          	auipc	a0,0x0
    8000a830:	d5850513          	addi	a0,a0,-680 # 8000a584 <_Z4workPv>
    8000a834:	00000097          	auipc	ra,0x0
    8000a838:	f2c080e7          	jalr	-212(ra) # 8000a760 <_Z4runsPFvPvEP6data_si>

	kmem_cache_destroy(shared);
    8000a83c:	00048513          	mv	a0,s1
    8000a840:	fffff097          	auipc	ra,0xfffff
    8000a844:	828080e7          	jalr	-2008(ra) # 80009068 <_Z18kmem_cache_destroyP11ObjectCache>
}
    8000a848:	03813083          	ld	ra,56(sp)
    8000a84c:	03013403          	ld	s0,48(sp)
    8000a850:	02813483          	ld	s1,40(sp)
    8000a854:	04010113          	addi	sp,sp,64
    8000a858:	00008067          	ret

000000008000a85c <_Z11paging_testv>:
#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"


void paging_test(){
    8000a85c:	fe010113          	addi	sp,sp,-32
    8000a860:	00113c23          	sd	ra,24(sp)
    8000a864:	00813823          	sd	s0,16(sp)
    8000a868:	00913423          	sd	s1,8(sp)
    8000a86c:	01213023          	sd	s2,0(sp)
    8000a870:	02010413          	addi	s0,sp,32
    kprintString("--------PAGING TEST--------\n");
    8000a874:	00005517          	auipc	a0,0x5
    8000a878:	3e450513          	addi	a0,a0,996 # 8000fc58 <_ZL11CACHE_NAMES+0x98>
    8000a87c:	ffffb097          	auipc	ra,0xffffb
    8000a880:	828080e7          	jalr	-2008(ra) # 800050a4 <_Z12kprintStringPKc>

    kprintString("GETING PAGER iNSTANCE\n");
    8000a884:	00005517          	auipc	a0,0x5
    8000a888:	3f450513          	addi	a0,a0,1012 # 8000fc78 <_ZL11CACHE_NAMES+0xb8>
    8000a88c:	ffffb097          	auipc	ra,0xffffb
    8000a890:	818080e7          	jalr	-2024(ra) # 800050a4 <_Z12kprintStringPKc>
    Pager& pager = Pager::getInstance();
    8000a894:	00001097          	auipc	ra,0x1
    8000a898:	e4c080e7          	jalr	-436(ra) # 8000b6e0 <_ZN5Pager11getInstanceEv>
    8000a89c:	00050913          	mv	s2,a0
    kprintString("MAPPING KERNEL\n");
    8000a8a0:	00005517          	auipc	a0,0x5
    8000a8a4:	3f050513          	addi	a0,a0,1008 # 8000fc90 <_ZL11CACHE_NAMES+0xd0>
    8000a8a8:	ffffa097          	auipc	ra,0xffffa
    8000a8ac:	7fc080e7          	jalr	2044(ra) # 800050a4 <_Z12kprintStringPKc>
    pager.map_kernel();
    8000a8b0:	00090513          	mv	a0,s2
    8000a8b4:	00001097          	auipc	ra,0x1
    8000a8b8:	044080e7          	jalr	68(ra) # 8000b8f8 <_ZN5Pager10map_kernelEv>
    kprintString("PAGING BEGIN\n");
    8000a8bc:	00005517          	auipc	a0,0x5
    8000a8c0:	3e450513          	addi	a0,a0,996 # 8000fca0 <_ZL11CACHE_NAMES+0xe0>
    8000a8c4:	ffffa097          	auipc	ra,0xffffa
    8000a8c8:	7e0080e7          	jalr	2016(ra) # 800050a4 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    8000a8cc:	000407b7          	lui	a5,0x40
    8000a8d0:	1007a073          	csrs	sstatus,a5
    //Riscv::mc_sie(Riscv::BitMaskSip::SIP_STIE);
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SIE);
    Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    kprintString("Moze li\n");
    8000a8d4:	00005517          	auipc	a0,0x5
    8000a8d8:	3dc50513          	addi	a0,a0,988 # 8000fcb0 <_ZL11CACHE_NAMES+0xf0>
    8000a8dc:	ffffa097          	auipc	ra,0xffffa
    8000a8e0:	7c8080e7          	jalr	1992(ra) # 800050a4 <_Z12kprintStringPKc>
    pager.start_paging();
    8000a8e4:	00090513          	mv	a0,s2
    8000a8e8:	00001097          	auipc	ra,0x1
    8000a8ec:	184080e7          	jalr	388(ra) # 8000ba6c <_ZN5Pager12start_pagingEv>
   
    for(int i = 0; i < 5; i++){
    8000a8f0:	00000493          	li	s1,0
    8000a8f4:	00400793          	li	a5,4
    8000a8f8:	0497c063          	blt	a5,s1,8000a938 <_Z11paging_testv+0xdc>
        KCHECKPRINT(i);
    8000a8fc:	00005517          	auipc	a0,0x5
    8000a900:	3c450513          	addi	a0,a0,964 # 8000fcc0 <_ZL11CACHE_NAMES+0x100>
    8000a904:	ffffa097          	auipc	ra,0xffffa
    8000a908:	7a0080e7          	jalr	1952(ra) # 800050a4 <_Z12kprintStringPKc>
    8000a90c:	00000613          	li	a2,0
    8000a910:	01000593          	li	a1,16
    8000a914:	00048513          	mv	a0,s1
    8000a918:	ffffa097          	auipc	ra,0xffffa
    8000a91c:	7d4080e7          	jalr	2004(ra) # 800050ec <_Z9kprintIntmib>
    8000a920:	00005517          	auipc	a0,0x5
    8000a924:	a3850513          	addi	a0,a0,-1480 # 8000f358 <CONSOLE_STATUS+0x348>
    8000a928:	ffffa097          	auipc	ra,0xffffa
    8000a92c:	77c080e7          	jalr	1916(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < 5; i++){
    8000a930:	0014849b          	addiw	s1,s1,1
    8000a934:	fc1ff06f          	j	8000a8f4 <_Z11paging_testv+0x98>
    }
    uint64* ptr = (uint64*) HEAP_END_ADDR - 40;
    8000a938:	00009797          	auipc	a5,0x9
    8000a93c:	2c878793          	addi	a5,a5,712 # 80013c00 <HEAP_END_ADDR>
    8000a940:	0007b483          	ld	s1,0(a5)
    8000a944:	ec048593          	addi	a1,s1,-320
    pager.map(ptr, (void*)((uint64)ptr & ~0xFFF), 
    8000a948:	01600693          	li	a3,22
    8000a94c:	fffff637          	lui	a2,0xfffff
    8000a950:	00c5f633          	and	a2,a1,a2
    8000a954:	00090513          	mv	a0,s2
    8000a958:	00001097          	auipc	ra,0x1
    8000a95c:	e00080e7          	jalr	-512(ra) # 8000b758 <_ZN5Pager3mapEPvS0_12PMTEntryBits>
        (PMTEntryBits) (PMTEntryBits::user | PMTEntryBits::write | PMTEntryBits::read)); 
    pager.print();
    8000a960:	00090513          	mv	a0,s2
    8000a964:	00001097          	auipc	ra,0x1
    8000a968:	150080e7          	jalr	336(ra) # 8000bab4 <_ZN5Pager5printEv>
    //KCHECKPRINT(CONSOLE_RX_DATA);
    //pager.print();
    
    *ptr = 13;
    8000a96c:	00d00793          	li	a5,13
    8000a970:	ecf4b023          	sd	a5,-320(s1)
    //KCHECKPRINT(*ptr);
    //KCHECKPRINT(ptr);
    
    kprintString("------PAGING TEST END------\n");
    8000a974:	00005517          	auipc	a0,0x5
    8000a978:	35450513          	addi	a0,a0,852 # 8000fcc8 <_ZL11CACHE_NAMES+0x108>
    8000a97c:	ffffa097          	auipc	ra,0xffffa
    8000a980:	728080e7          	jalr	1832(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000a984:	01813083          	ld	ra,24(sp)
    8000a988:	01013403          	ld	s0,16(sp)
    8000a98c:	00813483          	ld	s1,8(sp)
    8000a990:	00013903          	ld	s2,0(sp)
    8000a994:	02010113          	addi	sp,sp,32
    8000a998:	00008067          	ret

000000008000a99c <_Z4ctorPv>:
    kprintString("\n\n=============Object Dellocate Test End=============\n\n");
    
}


void ctor(void* ptr){
    8000a99c:	fc010113          	addi	sp,sp,-64
    8000a9a0:	02113c23          	sd	ra,56(sp)
    8000a9a4:	02813823          	sd	s0,48(sp)
    8000a9a8:	04010413          	addi	s0,sp,64
    8000a9ac:	00050793          	mv	a5,a0
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)

    KSemaphore(unsigned val):val(val)
    8000a9b0:	00100713          	li	a4,1
    8000a9b4:	fce42823          	sw	a4,-48(s0)
    static ObjectCache* cache;
public:
    //#include"../h/kernel_operators.hpp"

    __SLAB_ALLOCATION__(TcbQueue, nullptr, nullptr);
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    8000a9b8:	fc043c23          	sd	zero,-40(s0)
    8000a9bc:	fe043023          	sd	zero,-32(s0)
    8000a9c0:	fe042423          	sw	zero,-24(s0)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
    8000a9c4:	0000b697          	auipc	a3,0xb
    8000a9c8:	9c468693          	addi	a3,a3,-1596 # 80015388 <_ZN10KSemaphore16activeSemaphoresE>
    8000a9cc:	0006b703          	ld	a4,0(a3)
    8000a9d0:	fce43423          	sd	a4,-56(s0)
        activeSemaphores = this;
    8000a9d4:	fc840513          	addi	a0,s0,-56
    8000a9d8:	00a6b023          	sd	a0,0(a3)
   
    *(KSemaphore*)ptr = KSemaphore(1);
    8000a9dc:	00e7b023          	sd	a4,0(a5)
    8000a9e0:	fd043703          	ld	a4,-48(s0)
    8000a9e4:	00e7b423          	sd	a4,8(a5)
    8000a9e8:	0007b823          	sd	zero,16(a5)
    8000a9ec:	0007bc23          	sd	zero,24(a5)
    8000a9f0:	fe843703          	ld	a4,-24(s0)
    8000a9f4:	02e7b023          	sd	a4,32(a5)
    8000a9f8:	ffffa097          	auipc	ra,0xffffa
    8000a9fc:	958080e7          	jalr	-1704(ra) # 80004350 <_ZN10KSemaphoreD1Ev>
}
    8000aa00:	03813083          	ld	ra,56(sp)
    8000aa04:	03013403          	ld	s0,48(sp)
    8000aa08:	04010113          	addi	sp,sp,64
    8000aa0c:	00008067          	ret

000000008000aa10 <_Z16cache_alloc_testPP11ObjectCacheimc>:
void cache_alloc_test(ObjectCache** oc_arr,int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    8000aa10:	fb010113          	addi	sp,sp,-80
    8000aa14:	04113423          	sd	ra,72(sp)
    8000aa18:	04813023          	sd	s0,64(sp)
    8000aa1c:	02913c23          	sd	s1,56(sp)
    8000aa20:	03213823          	sd	s2,48(sp)
    8000aa24:	03313423          	sd	s3,40(sp)
    8000aa28:	03413023          	sd	s4,32(sp)
    8000aa2c:	01513c23          	sd	s5,24(sp)
    8000aa30:	01613823          	sd	s6,16(sp)
    8000aa34:	01713423          	sd	s7,8(sp)
    8000aa38:	05010413          	addi	s0,sp,80
    8000aa3c:	00050a13          	mv	s4,a0
    8000aa40:	00058a93          	mv	s5,a1
    8000aa44:	00060b93          	mv	s7,a2
    8000aa48:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Cache Allocating=============\n\n");
    8000aa4c:	00005517          	auipc	a0,0x5
    8000aa50:	29c50513          	addi	a0,a0,668 # 8000fce8 <_ZL11CACHE_NAMES+0x128>
    8000aa54:	ffffa097          	auipc	ra,0xffffa
    8000aa58:	650080e7          	jalr	1616(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("Allocating "); kprintInt(size); kprintString(" caches!!\n");
    8000aa5c:	00005517          	auipc	a0,0x5
    8000aa60:	2c450513          	addi	a0,a0,708 # 8000fd20 <_ZL11CACHE_NAMES+0x160>
    8000aa64:	ffffa097          	auipc	ra,0xffffa
    8000aa68:	640080e7          	jalr	1600(ra) # 800050a4 <_Z12kprintStringPKc>
    8000aa6c:	00000613          	li	a2,0
    8000aa70:	00a00593          	li	a1,10
    8000aa74:	000a8513          	mv	a0,s5
    8000aa78:	ffffa097          	auipc	ra,0xffffa
    8000aa7c:	674080e7          	jalr	1652(ra) # 800050ec <_Z9kprintIntmib>
    8000aa80:	00005517          	auipc	a0,0x5
    8000aa84:	2b050513          	addi	a0,a0,688 # 8000fd30 <_ZL11CACHE_NAMES+0x170>
    8000aa88:	ffffa097          	auipc	ra,0xffffa
    8000aa8c:	61c080e7          	jalr	1564(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000aa90:	00000913          	li	s2,0
    8000aa94:	0900006f          	j	8000ab24 <_Z16cache_alloc_testPP11ObjectCacheimc+0x114>
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    8000aa98:	00391493          	slli	s1,s2,0x3
    8000aa9c:	009a04b3          	add	s1,s4,s1
    8000aaa0:	0134b023          	sd	s3,0(s1)
        KPRINTARR(oc_arr, i, oc_arr[i]);
    8000aaa4:	00005517          	auipc	a0,0x5
    8000aaa8:	2a450513          	addi	a0,a0,676 # 8000fd48 <_ZL11CACHE_NAMES+0x188>
    8000aaac:	ffffa097          	auipc	ra,0xffffa
    8000aab0:	5f8080e7          	jalr	1528(ra) # 800050a4 <_Z12kprintStringPKc>
    8000aab4:	00000613          	li	a2,0
    8000aab8:	00a00593          	li	a1,10
    8000aabc:	00090513          	mv	a0,s2
    8000aac0:	ffffa097          	auipc	ra,0xffffa
    8000aac4:	62c080e7          	jalr	1580(ra) # 800050ec <_Z9kprintIntmib>
    8000aac8:	00005517          	auipc	a0,0x5
    8000aacc:	a6050513          	addi	a0,a0,-1440 # 8000f528 <CONSOLE_STATUS+0x518>
    8000aad0:	ffffa097          	auipc	ra,0xffffa
    8000aad4:	5d4080e7          	jalr	1492(ra) # 800050a4 <_Z12kprintStringPKc>
    8000aad8:	00000613          	li	a2,0
    8000aadc:	01000593          	li	a1,16
    8000aae0:	0004b503          	ld	a0,0(s1)
    8000aae4:	ffffa097          	auipc	ra,0xffffa
    8000aae8:	608080e7          	jalr	1544(ra) # 800050ec <_Z9kprintIntmib>
    8000aaec:	00005517          	auipc	a0,0x5
    8000aaf0:	86c50513          	addi	a0,a0,-1940 # 8000f358 <CONSOLE_STATUS+0x348>
    8000aaf4:	ffffa097          	auipc	ra,0xffffa
    8000aaf8:	5b0080e7          	jalr	1456(ra) # 800050a4 <_Z12kprintStringPKc>
        if(oc_arr == nullptr){
    8000aafc:	060a0263          	beqz	s4,8000ab60 <_Z16cache_alloc_testPP11ObjectCacheimc+0x150>
        oc_arr[i]->printInfo(flags);
    8000ab00:	000b0593          	mv	a1,s6
    8000ab04:	0004b503          	ld	a0,0(s1)
    8000ab08:	ffffe097          	auipc	ra,0xffffe
    8000ab0c:	9dc080e7          	jalr	-1572(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
        kprintString("\n");
    8000ab10:	00005517          	auipc	a0,0x5
    8000ab14:	84850513          	addi	a0,a0,-1976 # 8000f358 <CONSOLE_STATUS+0x348>
    8000ab18:	ffffa097          	auipc	ra,0xffffa
    8000ab1c:	58c080e7          	jalr	1420(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000ab20:	0019091b          	addiw	s2,s2,1
    8000ab24:	05595863          	bge	s2,s5,8000ab74 <_Z16cache_alloc_testPP11ObjectCacheimc+0x164>
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    8000ab28:	05800513          	li	a0,88
    8000ab2c:	ffffe097          	auipc	ra,0xffffe
    8000ab30:	028080e7          	jalr	40(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    8000ab34:	00050993          	mv	s3,a0
    8000ab38:	f60500e3          	beqz	a0,8000aa98 <_Z16cache_alloc_testPP11ObjectCacheimc+0x88>
    8000ab3c:	00000793          	li	a5,0
    8000ab40:	00000713          	li	a4,0
    8000ab44:	00000693          	li	a3,0
    8000ab48:	000b8613          	mv	a2,s7
    8000ab4c:	00005597          	auipc	a1,0x5
    8000ab50:	1f458593          	addi	a1,a1,500 # 8000fd40 <_ZL11CACHE_NAMES+0x180>
    8000ab54:	ffffd097          	auipc	ra,0xffffd
    8000ab58:	4b4080e7          	jalr	1204(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>
    8000ab5c:	f3dff06f          	j	8000aa98 <_Z16cache_alloc_testPP11ObjectCacheimc+0x88>
            kprintString("Not enough memory left!\n");
    8000ab60:	00005517          	auipc	a0,0x5
    8000ab64:	1f050513          	addi	a0,a0,496 # 8000fd50 <_ZL11CACHE_NAMES+0x190>
    8000ab68:	ffffa097          	auipc	ra,0xffffa
    8000ab6c:	53c080e7          	jalr	1340(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000ab70:	0280006f          	j	8000ab98 <_Z16cache_alloc_testPP11ObjectCacheimc+0x188>
    SlabAl::getInstance().print_state(flags);
    8000ab74:	ffffe097          	auipc	ra,0xffffe
    8000ab78:	7a0080e7          	jalr	1952(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000ab7c:	000b0593          	mv	a1,s6
    8000ab80:	fffff097          	auipc	ra,0xfffff
    8000ab84:	80c080e7          	jalr	-2036(ra) # 8000938c <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Object Cache Allocating End===========\n\n");
    8000ab88:	00005517          	auipc	a0,0x5
    8000ab8c:	1e850513          	addi	a0,a0,488 # 8000fd70 <_ZL11CACHE_NAMES+0x1b0>
    8000ab90:	ffffa097          	auipc	ra,0xffffa
    8000ab94:	514080e7          	jalr	1300(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000ab98:	04813083          	ld	ra,72(sp)
    8000ab9c:	04013403          	ld	s0,64(sp)
    8000aba0:	03813483          	ld	s1,56(sp)
    8000aba4:	03013903          	ld	s2,48(sp)
    8000aba8:	02813983          	ld	s3,40(sp)
    8000abac:	02013a03          	ld	s4,32(sp)
    8000abb0:	01813a83          	ld	s5,24(sp)
    8000abb4:	01013b03          	ld	s6,16(sp)
    8000abb8:	00813b83          	ld	s7,8(sp)
    8000abbc:	05010113          	addi	sp,sp,80
    8000abc0:	00008067          	ret
    8000abc4:	00050493          	mv	s1,a0
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
    8000abc8:	00098513          	mv	a0,s3
    8000abcc:	ffffe097          	auipc	ra,0xffffe
    8000abd0:	0e8080e7          	jalr	232(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    8000abd4:	00048513          	mv	a0,s1
    8000abd8:	0000c097          	auipc	ra,0xc
    8000abdc:	9a0080e7          	jalr	-1632(ra) # 80016578 <_Unwind_Resume>

000000008000abe0 <_Z18cache_dealloc_testPP11ObjectCacheic>:
void cache_dealloc_test(ObjectCache** oc_arr, int size, char flags = Slab::pb_mask::FREE){
    8000abe0:	fc010113          	addi	sp,sp,-64
    8000abe4:	02113c23          	sd	ra,56(sp)
    8000abe8:	02813823          	sd	s0,48(sp)
    8000abec:	02913423          	sd	s1,40(sp)
    8000abf0:	03213023          	sd	s2,32(sp)
    8000abf4:	01313c23          	sd	s3,24(sp)
    8000abf8:	01413823          	sd	s4,16(sp)
    8000abfc:	01513423          	sd	s5,8(sp)
    8000ac00:	01613023          	sd	s6,0(sp)
    8000ac04:	04010413          	addi	s0,sp,64
    8000ac08:	00050a93          	mv	s5,a0
    8000ac0c:	00058a13          	mv	s4,a1
    8000ac10:	00060b13          	mv	s6,a2
    kprintString("\n\n=============Object Cache Deallocating=============\n\n");
    8000ac14:	00005517          	auipc	a0,0x5
    8000ac18:	19450513          	addi	a0,a0,404 # 8000fda8 <_ZL11CACHE_NAMES+0x1e8>
    8000ac1c:	ffffa097          	auipc	ra,0xffffa
    8000ac20:	488080e7          	jalr	1160(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000ac24:	00000913          	li	s2,0
    8000ac28:	0b495263          	bge	s2,s4,8000accc <_Z18cache_dealloc_testPP11ObjectCacheic+0xec>
        KPRINTARR(oc_arr, i, oc_arr[i]);
    8000ac2c:	00005517          	auipc	a0,0x5
    8000ac30:	11c50513          	addi	a0,a0,284 # 8000fd48 <_ZL11CACHE_NAMES+0x188>
    8000ac34:	ffffa097          	auipc	ra,0xffffa
    8000ac38:	470080e7          	jalr	1136(ra) # 800050a4 <_Z12kprintStringPKc>
    8000ac3c:	00000613          	li	a2,0
    8000ac40:	00a00593          	li	a1,10
    8000ac44:	00090513          	mv	a0,s2
    8000ac48:	ffffa097          	auipc	ra,0xffffa
    8000ac4c:	4a4080e7          	jalr	1188(ra) # 800050ec <_Z9kprintIntmib>
    8000ac50:	00005517          	auipc	a0,0x5
    8000ac54:	8d850513          	addi	a0,a0,-1832 # 8000f528 <CONSOLE_STATUS+0x518>
    8000ac58:	ffffa097          	auipc	ra,0xffffa
    8000ac5c:	44c080e7          	jalr	1100(ra) # 800050a4 <_Z12kprintStringPKc>
    8000ac60:	00391493          	slli	s1,s2,0x3
    8000ac64:	009a84b3          	add	s1,s5,s1
    8000ac68:	00000613          	li	a2,0
    8000ac6c:	01000593          	li	a1,16
    8000ac70:	0004b503          	ld	a0,0(s1)
    8000ac74:	ffffa097          	auipc	ra,0xffffa
    8000ac78:	478080e7          	jalr	1144(ra) # 800050ec <_Z9kprintIntmib>
    8000ac7c:	00004517          	auipc	a0,0x4
    8000ac80:	6dc50513          	addi	a0,a0,1756 # 8000f358 <CONSOLE_STATUS+0x348>
    8000ac84:	ffffa097          	auipc	ra,0xffffa
    8000ac88:	420080e7          	jalr	1056(ra) # 800050a4 <_Z12kprintStringPKc>
        if(oc_arr[i]){
    8000ac8c:	0004b983          	ld	s3,0(s1)
    8000ac90:	02098463          	beqz	s3,8000acb8 <_Z18cache_dealloc_testPP11ObjectCacheic+0xd8>
            delete oc_arr[i];
    8000ac94:	00098513          	mv	a0,s3
    8000ac98:	ffffe097          	auipc	ra,0xffffe
    8000ac9c:	1d4080e7          	jalr	468(ra) # 80008e6c <_ZN11ObjectCacheD1Ev>
    8000aca0:	00098513          	mv	a0,s3
    8000aca4:	ffffe097          	auipc	ra,0xffffe
    8000aca8:	010080e7          	jalr	16(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
            oc_arr[i] = 0;
    8000acac:	0004b023          	sd	zero,0(s1)
    for(int i = 0; i < size; i++){
    8000acb0:	0019091b          	addiw	s2,s2,1
    8000acb4:	f75ff06f          	j	8000ac28 <_Z18cache_dealloc_testPP11ObjectCacheic+0x48>
            kprintString("Given address not valid!\n");
    8000acb8:	00005517          	auipc	a0,0x5
    8000acbc:	12850513          	addi	a0,a0,296 # 8000fde0 <_ZL11CACHE_NAMES+0x220>
    8000acc0:	ffffa097          	auipc	ra,0xffffa
    8000acc4:	3e4080e7          	jalr	996(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000acc8:	0280006f          	j	8000acf0 <_Z18cache_dealloc_testPP11ObjectCacheic+0x110>
    SlabAl::getInstance().print_state(flags);
    8000accc:	ffffe097          	auipc	ra,0xffffe
    8000acd0:	648080e7          	jalr	1608(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000acd4:	000b0593          	mv	a1,s6
    8000acd8:	ffffe097          	auipc	ra,0xffffe
    8000acdc:	6b4080e7          	jalr	1716(ra) # 8000938c <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Object Cache Dellocating End===========\n\n");
    8000ace0:	00005517          	auipc	a0,0x5
    8000ace4:	12050513          	addi	a0,a0,288 # 8000fe00 <_ZL11CACHE_NAMES+0x240>
    8000ace8:	ffffa097          	auipc	ra,0xffffa
    8000acec:	3bc080e7          	jalr	956(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000acf0:	03813083          	ld	ra,56(sp)
    8000acf4:	03013403          	ld	s0,48(sp)
    8000acf8:	02813483          	ld	s1,40(sp)
    8000acfc:	02013903          	ld	s2,32(sp)
    8000ad00:	01813983          	ld	s3,24(sp)
    8000ad04:	01013a03          	ld	s4,16(sp)
    8000ad08:	00813a83          	ld	s5,8(sp)
    8000ad0c:	00013b03          	ld	s6,0(sp)
    8000ad10:	04010113          	addi	sp,sp,64
    8000ad14:	00008067          	ret

000000008000ad18 <_Z12kmalloc_testPPvimc>:
void kmalloc_test(void** buff_arr, int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    8000ad18:	fc010113          	addi	sp,sp,-64
    8000ad1c:	02113c23          	sd	ra,56(sp)
    8000ad20:	02813823          	sd	s0,48(sp)
    8000ad24:	02913423          	sd	s1,40(sp)
    8000ad28:	03213023          	sd	s2,32(sp)
    8000ad2c:	01313c23          	sd	s3,24(sp)
    8000ad30:	01413823          	sd	s4,16(sp)
    8000ad34:	01513423          	sd	s5,8(sp)
    8000ad38:	01613023          	sd	s6,0(sp)
    8000ad3c:	04010413          	addi	s0,sp,64
    8000ad40:	00050a93          	mv	s5,a0
    8000ad44:	00058993          	mv	s3,a1
    8000ad48:	00060a13          	mv	s4,a2
    8000ad4c:	00068b13          	mv	s6,a3
    kprintString("\n\n=============SMALL MEMORY BUFFER ALLOC=============\n\n");
    8000ad50:	00005517          	auipc	a0,0x5
    8000ad54:	0e850513          	addi	a0,a0,232 # 8000fe38 <_ZL11CACHE_NAMES+0x278>
    8000ad58:	ffffa097          	auipc	ra,0xffffa
    8000ad5c:	34c080e7          	jalr	844(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0 ; i < size; i++){
    8000ad60:	00000913          	li	s2,0
    8000ad64:	0b395063          	bge	s2,s3,8000ae04 <_Z12kmalloc_testPPvimc+0xec>
        buff_arr[i] = SlabAllocator::getInstance().kmalloc(objsize);
    8000ad68:	ffffe097          	auipc	ra,0xffffe
    8000ad6c:	5ac080e7          	jalr	1452(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000ad70:	00391493          	slli	s1,s2,0x3
    8000ad74:	009a84b3          	add	s1,s5,s1
    8000ad78:	000a0593          	mv	a1,s4
    8000ad7c:	ffffe097          	auipc	ra,0xffffe
    8000ad80:	69c080e7          	jalr	1692(ra) # 80009418 <_ZN13SlabAllocator7kmallocEm>
    8000ad84:	00a4b023          	sd	a0,0(s1)
        KPRINTARR(buff_arr, i, buff_arr[i]);
    8000ad88:	00005517          	auipc	a0,0x5
    8000ad8c:	0e850513          	addi	a0,a0,232 # 8000fe70 <_ZL11CACHE_NAMES+0x2b0>
    8000ad90:	ffffa097          	auipc	ra,0xffffa
    8000ad94:	314080e7          	jalr	788(ra) # 800050a4 <_Z12kprintStringPKc>
    8000ad98:	00000613          	li	a2,0
    8000ad9c:	00a00593          	li	a1,10
    8000ada0:	00090513          	mv	a0,s2
    8000ada4:	ffffa097          	auipc	ra,0xffffa
    8000ada8:	348080e7          	jalr	840(ra) # 800050ec <_Z9kprintIntmib>
    8000adac:	00004517          	auipc	a0,0x4
    8000adb0:	77c50513          	addi	a0,a0,1916 # 8000f528 <CONSOLE_STATUS+0x518>
    8000adb4:	ffffa097          	auipc	ra,0xffffa
    8000adb8:	2f0080e7          	jalr	752(ra) # 800050a4 <_Z12kprintStringPKc>
    8000adbc:	00000613          	li	a2,0
    8000adc0:	01000593          	li	a1,16
    8000adc4:	0004b503          	ld	a0,0(s1)
    8000adc8:	ffffa097          	auipc	ra,0xffffa
    8000adcc:	324080e7          	jalr	804(ra) # 800050ec <_Z9kprintIntmib>
    8000add0:	00004517          	auipc	a0,0x4
    8000add4:	58850513          	addi	a0,a0,1416 # 8000f358 <CONSOLE_STATUS+0x348>
    8000add8:	ffffa097          	auipc	ra,0xffffa
    8000addc:	2cc080e7          	jalr	716(ra) # 800050a4 <_Z12kprintStringPKc>
        if(buff_arr[i] == nullptr){
    8000ade0:	0004b783          	ld	a5,0(s1)
    8000ade4:	00078663          	beqz	a5,8000adf0 <_Z12kmalloc_testPPvimc+0xd8>
    for(int i = 0 ; i < size; i++){
    8000ade8:	0019091b          	addiw	s2,s2,1
    8000adec:	f79ff06f          	j	8000ad64 <_Z12kmalloc_testPPvimc+0x4c>
            kprintString("Not enough memory left!\n");
    8000adf0:	00005517          	auipc	a0,0x5
    8000adf4:	f6050513          	addi	a0,a0,-160 # 8000fd50 <_ZL11CACHE_NAMES+0x190>
    8000adf8:	ffffa097          	auipc	ra,0xffffa
    8000adfc:	2ac080e7          	jalr	684(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000ae00:	0280006f          	j	8000ae28 <_Z12kmalloc_testPPvimc+0x110>
    SlabAl::getInstance().print_state(flags);
    8000ae04:	ffffe097          	auipc	ra,0xffffe
    8000ae08:	510080e7          	jalr	1296(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000ae0c:	000b0593          	mv	a1,s6
    8000ae10:	ffffe097          	auipc	ra,0xffffe
    8000ae14:	57c080e7          	jalr	1404(ra) # 8000938c <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========SMALL MEMORY BUFFER ALLOC END===========\n\n");
    8000ae18:	00005517          	auipc	a0,0x5
    8000ae1c:	06850513          	addi	a0,a0,104 # 8000fe80 <_ZL11CACHE_NAMES+0x2c0>
    8000ae20:	ffffa097          	auipc	ra,0xffffa
    8000ae24:	284080e7          	jalr	644(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000ae28:	03813083          	ld	ra,56(sp)
    8000ae2c:	03013403          	ld	s0,48(sp)
    8000ae30:	02813483          	ld	s1,40(sp)
    8000ae34:	02013903          	ld	s2,32(sp)
    8000ae38:	01813983          	ld	s3,24(sp)
    8000ae3c:	01013a03          	ld	s4,16(sp)
    8000ae40:	00813a83          	ld	s5,8(sp)
    8000ae44:	00013b03          	ld	s6,0(sp)
    8000ae48:	04010113          	addi	sp,sp,64
    8000ae4c:	00008067          	ret

000000008000ae50 <_Z10kfree_testPPvic>:
void kfree_test(void** buff_arr, int size, char flags = Slab::pb_mask::FREE){
    8000ae50:	fc010113          	addi	sp,sp,-64
    8000ae54:	02113c23          	sd	ra,56(sp)
    8000ae58:	02813823          	sd	s0,48(sp)
    8000ae5c:	02913423          	sd	s1,40(sp)
    8000ae60:	03213023          	sd	s2,32(sp)
    8000ae64:	01313c23          	sd	s3,24(sp)
    8000ae68:	01413823          	sd	s4,16(sp)
    8000ae6c:	01513423          	sd	s5,8(sp)
    8000ae70:	04010413          	addi	s0,sp,64
    8000ae74:	00050a13          	mv	s4,a0
    8000ae78:	00058993          	mv	s3,a1
    8000ae7c:	00060a93          	mv	s5,a2
    kprintString("\n\n=============SMALL MEMORY BUFFER DEALLOC=============\n\n");
    8000ae80:	00005517          	auipc	a0,0x5
    8000ae84:	03850513          	addi	a0,a0,56 # 8000feb8 <_ZL11CACHE_NAMES+0x2f8>
    8000ae88:	ffffa097          	auipc	ra,0xffffa
    8000ae8c:	21c080e7          	jalr	540(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000ae90:	00000913          	li	s2,0
    8000ae94:	09395e63          	bge	s2,s3,8000af30 <_Z10kfree_testPPvic+0xe0>
        if(!buff_arr[i]){
    8000ae98:	00391493          	slli	s1,s2,0x3
    8000ae9c:	009a04b3          	add	s1,s4,s1
    8000aea0:	0004b783          	ld	a5,0(s1)
    8000aea4:	06078c63          	beqz	a5,8000af1c <_Z10kfree_testPPvic+0xcc>
        KPRINTARR(buff_arr, i, buff_arr[i]);
    8000aea8:	00005517          	auipc	a0,0x5
    8000aeac:	fc850513          	addi	a0,a0,-56 # 8000fe70 <_ZL11CACHE_NAMES+0x2b0>
    8000aeb0:	ffffa097          	auipc	ra,0xffffa
    8000aeb4:	1f4080e7          	jalr	500(ra) # 800050a4 <_Z12kprintStringPKc>
    8000aeb8:	00000613          	li	a2,0
    8000aebc:	00a00593          	li	a1,10
    8000aec0:	00090513          	mv	a0,s2
    8000aec4:	ffffa097          	auipc	ra,0xffffa
    8000aec8:	228080e7          	jalr	552(ra) # 800050ec <_Z9kprintIntmib>
    8000aecc:	00004517          	auipc	a0,0x4
    8000aed0:	65c50513          	addi	a0,a0,1628 # 8000f528 <CONSOLE_STATUS+0x518>
    8000aed4:	ffffa097          	auipc	ra,0xffffa
    8000aed8:	1d0080e7          	jalr	464(ra) # 800050a4 <_Z12kprintStringPKc>
    8000aedc:	00000613          	li	a2,0
    8000aee0:	01000593          	li	a1,16
    8000aee4:	0004b503          	ld	a0,0(s1)
    8000aee8:	ffffa097          	auipc	ra,0xffffa
    8000aeec:	204080e7          	jalr	516(ra) # 800050ec <_Z9kprintIntmib>
    8000aef0:	00004517          	auipc	a0,0x4
    8000aef4:	46850513          	addi	a0,a0,1128 # 8000f358 <CONSOLE_STATUS+0x348>
    8000aef8:	ffffa097          	auipc	ra,0xffffa
    8000aefc:	1ac080e7          	jalr	428(ra) # 800050a4 <_Z12kprintStringPKc>
        SlabAl::getInstance().kfree(buff_arr[i]);
    8000af00:	ffffe097          	auipc	ra,0xffffe
    8000af04:	414080e7          	jalr	1044(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000af08:	0004b583          	ld	a1,0(s1)
    8000af0c:	ffffe097          	auipc	ra,0xffffe
    8000af10:	590080e7          	jalr	1424(ra) # 8000949c <_ZN13SlabAllocator5kfreeEPv>
    for(int i = 0; i < size; i++){
    8000af14:	0019091b          	addiw	s2,s2,1
    8000af18:	f7dff06f          	j	8000ae94 <_Z10kfree_testPPvic+0x44>
            kprintString("Invalid free address given!!");
    8000af1c:	00005517          	auipc	a0,0x5
    8000af20:	fdc50513          	addi	a0,a0,-36 # 8000fef8 <_ZL11CACHE_NAMES+0x338>
    8000af24:	ffffa097          	auipc	ra,0xffffa
    8000af28:	180080e7          	jalr	384(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000af2c:	0280006f          	j	8000af54 <_Z10kfree_testPPvic+0x104>
    SlabAl::getInstance().print_state(flags); 
    8000af30:	ffffe097          	auipc	ra,0xffffe
    8000af34:	3e4080e7          	jalr	996(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000af38:	000a8593          	mv	a1,s5
    8000af3c:	ffffe097          	auipc	ra,0xffffe
    8000af40:	450080e7          	jalr	1104(ra) # 8000938c <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========SMALL MEMORY BUFFER DEALLOC END===========\n\n");
    8000af44:	00005517          	auipc	a0,0x5
    8000af48:	fd450513          	addi	a0,a0,-44 # 8000ff18 <_ZL11CACHE_NAMES+0x358>
    8000af4c:	ffffa097          	auipc	ra,0xffffa
    8000af50:	158080e7          	jalr	344(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000af54:	03813083          	ld	ra,56(sp)
    8000af58:	03013403          	ld	s0,48(sp)
    8000af5c:	02813483          	ld	s1,40(sp)
    8000af60:	02013903          	ld	s2,32(sp)
    8000af64:	01813983          	ld	s3,24(sp)
    8000af68:	01013a03          	ld	s4,16(sp)
    8000af6c:	00813a83          	ld	s5,8(sp)
    8000af70:	04010113          	addi	sp,sp,64
    8000af74:	00008067          	ret

000000008000af78 <_Z25slab_allocator_state_ceckc>:
void slab_allocator_state_ceck(char flags = Slab::pb_mask::FREE){
    8000af78:	fe010113          	addi	sp,sp,-32
    8000af7c:	00113c23          	sd	ra,24(sp)
    8000af80:	00813823          	sd	s0,16(sp)
    8000af84:	00913423          	sd	s1,8(sp)
    8000af88:	02010413          	addi	s0,sp,32
    8000af8c:	00050493          	mv	s1,a0
    kprintString("\n\n=============Slab Allocator State Check=============\n\n");
    8000af90:	00005517          	auipc	a0,0x5
    8000af94:	fc850513          	addi	a0,a0,-56 # 8000ff58 <_ZL11CACHE_NAMES+0x398>
    8000af98:	ffffa097          	auipc	ra,0xffffa
    8000af9c:	10c080e7          	jalr	268(ra) # 800050a4 <_Z12kprintStringPKc>
    SlabAl::getInstance().print_state(flags);
    8000afa0:	ffffe097          	auipc	ra,0xffffe
    8000afa4:	374080e7          	jalr	884(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    8000afa8:	00048593          	mv	a1,s1
    8000afac:	ffffe097          	auipc	ra,0xffffe
    8000afb0:	3e0080e7          	jalr	992(ra) # 8000938c <_ZN13SlabAllocator11print_stateEc>
    kprintString("\n\n===========Slab Allocator State Check End===========\n\n");
    8000afb4:	00005517          	auipc	a0,0x5
    8000afb8:	fe450513          	addi	a0,a0,-28 # 8000ff98 <_ZL11CACHE_NAMES+0x3d8>
    8000afbc:	ffffa097          	auipc	ra,0xffffa
    8000afc0:	0e8080e7          	jalr	232(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000afc4:	01813083          	ld	ra,24(sp)
    8000afc8:	01013403          	ld	s0,16(sp)
    8000afcc:	00813483          	ld	s1,8(sp)
    8000afd0:	02010113          	addi	sp,sp,32
    8000afd4:	00008067          	ret

000000008000afd8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec>:
void cache_obj_alloc_test(void** object, int size, ObjectCache* cache, char flags){
    8000afd8:	fc010113          	addi	sp,sp,-64
    8000afdc:	02113c23          	sd	ra,56(sp)
    8000afe0:	02813823          	sd	s0,48(sp)
    8000afe4:	02913423          	sd	s1,40(sp)
    8000afe8:	03213023          	sd	s2,32(sp)
    8000afec:	01313c23          	sd	s3,24(sp)
    8000aff0:	01413823          	sd	s4,16(sp)
    8000aff4:	01513423          	sd	s5,8(sp)
    8000aff8:	01613023          	sd	s6,0(sp)
    8000affc:	04010413          	addi	s0,sp,64
    8000b000:	00050a93          	mv	s5,a0
    8000b004:	00058a13          	mv	s4,a1
    8000b008:	00060993          	mv	s3,a2
    8000b00c:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Allocate Test=============\n\n");
    8000b010:	00005517          	auipc	a0,0x5
    8000b014:	fc850513          	addi	a0,a0,-56 # 8000ffd8 <_ZL11CACHE_NAMES+0x418>
    8000b018:	ffffa097          	auipc	ra,0xffffa
    8000b01c:	08c080e7          	jalr	140(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000b020:	00000493          	li	s1,0
    8000b024:	0944da63          	bge	s1,s4,8000b0b8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0xe0>
        object[i] = cache->alloc_obj();
    8000b028:	00349913          	slli	s2,s1,0x3
    8000b02c:	012a8933          	add	s2,s5,s2
    8000b030:	00098513          	mv	a0,s3
    8000b034:	ffffe097          	auipc	ra,0xffffe
    8000b038:	a70080e7          	jalr	-1424(ra) # 80008aa4 <_ZN11ObjectCache9alloc_objEv>
    8000b03c:	00a93023          	sd	a0,0(s2)
        if(!object[i]){
    8000b040:	06050263          	beqz	a0,8000b0a4 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0xcc>
        KPRINTARR(object, i, object[i]);
    8000b044:	00005517          	auipc	a0,0x5
    8000b048:	ff450513          	addi	a0,a0,-12 # 80010038 <_ZL11CACHE_NAMES+0x478>
    8000b04c:	ffffa097          	auipc	ra,0xffffa
    8000b050:	058080e7          	jalr	88(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b054:	00000613          	li	a2,0
    8000b058:	00a00593          	li	a1,10
    8000b05c:	00048513          	mv	a0,s1
    8000b060:	ffffa097          	auipc	ra,0xffffa
    8000b064:	08c080e7          	jalr	140(ra) # 800050ec <_Z9kprintIntmib>
    8000b068:	00004517          	auipc	a0,0x4
    8000b06c:	4c050513          	addi	a0,a0,1216 # 8000f528 <CONSOLE_STATUS+0x518>
    8000b070:	ffffa097          	auipc	ra,0xffffa
    8000b074:	034080e7          	jalr	52(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b078:	00000613          	li	a2,0
    8000b07c:	01000593          	li	a1,16
    8000b080:	00093503          	ld	a0,0(s2)
    8000b084:	ffffa097          	auipc	ra,0xffffa
    8000b088:	068080e7          	jalr	104(ra) # 800050ec <_Z9kprintIntmib>
    8000b08c:	00004517          	auipc	a0,0x4
    8000b090:	2cc50513          	addi	a0,a0,716 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b094:	ffffa097          	auipc	ra,0xffffa
    8000b098:	010080e7          	jalr	16(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000b09c:	0014849b          	addiw	s1,s1,1
    8000b0a0:	f85ff06f          	j	8000b024 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0x4c>
            kprintString("Object not corresctly allocated!!\n");   
    8000b0a4:	00005517          	auipc	a0,0x5
    8000b0a8:	f6c50513          	addi	a0,a0,-148 # 80010010 <_ZL11CACHE_NAMES+0x450>
    8000b0ac:	ffffa097          	auipc	ra,0xffffa
    8000b0b0:	ff8080e7          	jalr	-8(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000b0b4:	0300006f          	j	8000b0e4 <_Z20cache_obj_alloc_testPPviP11ObjectCachec+0x10c>
    cache->printInfo(flags);
    8000b0b8:	000b0593          	mv	a1,s6
    8000b0bc:	00098513          	mv	a0,s3
    8000b0c0:	ffffd097          	auipc	ra,0xffffd
    8000b0c4:	424080e7          	jalr	1060(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
    slab_allocator_state_ceck(flags);
    8000b0c8:	000b0513          	mv	a0,s6
    8000b0cc:	00000097          	auipc	ra,0x0
    8000b0d0:	eac080e7          	jalr	-340(ra) # 8000af78 <_Z25slab_allocator_state_ceckc>
    kprintString("\n\n===========Object Allocate Test End===========\n\n");
    8000b0d4:	00005517          	auipc	a0,0x5
    8000b0d8:	f6c50513          	addi	a0,a0,-148 # 80010040 <_ZL11CACHE_NAMES+0x480>
    8000b0dc:	ffffa097          	auipc	ra,0xffffa
    8000b0e0:	fc8080e7          	jalr	-56(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000b0e4:	03813083          	ld	ra,56(sp)
    8000b0e8:	03013403          	ld	s0,48(sp)
    8000b0ec:	02813483          	ld	s1,40(sp)
    8000b0f0:	02013903          	ld	s2,32(sp)
    8000b0f4:	01813983          	ld	s3,24(sp)
    8000b0f8:	01013a03          	ld	s4,16(sp)
    8000b0fc:	00813a83          	ld	s5,8(sp)
    8000b100:	00013b03          	ld	s6,0(sp)
    8000b104:	04010113          	addi	sp,sp,64
    8000b108:	00008067          	ret

000000008000b10c <_Z23cache_obj_dealloca_testPPviP11ObjectCachec>:
void cache_obj_dealloca_test(void** object, int size, ObjectCache* cache, char flags){
    8000b10c:	fc010113          	addi	sp,sp,-64
    8000b110:	02113c23          	sd	ra,56(sp)
    8000b114:	02813823          	sd	s0,48(sp)
    8000b118:	02913423          	sd	s1,40(sp)
    8000b11c:	03213023          	sd	s2,32(sp)
    8000b120:	01313c23          	sd	s3,24(sp)
    8000b124:	01413823          	sd	s4,16(sp)
    8000b128:	01513423          	sd	s5,8(sp)
    8000b12c:	01613023          	sd	s6,0(sp)
    8000b130:	04010413          	addi	s0,sp,64
    8000b134:	00050a93          	mv	s5,a0
    8000b138:	00058993          	mv	s3,a1
    8000b13c:	00060a13          	mv	s4,a2
    8000b140:	00068b13          	mv	s6,a3
    kprintString("\n\n=============Object Deallocate Test=============\n\n");
    8000b144:	00005517          	auipc	a0,0x5
    8000b148:	f3450513          	addi	a0,a0,-204 # 80010078 <_ZL11CACHE_NAMES+0x4b8>
    8000b14c:	ffffa097          	auipc	ra,0xffffa
    8000b150:	f58080e7          	jalr	-168(ra) # 800050a4 <_Z12kprintStringPKc>
    for(int i = 0; i < size; i++){
    8000b154:	00000493          	li	s1,0
    8000b158:	0934da63          	bge	s1,s3,8000b1ec <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0xe0>
        KPRINTARR(object, i, object[i]);
    8000b15c:	00005517          	auipc	a0,0x5
    8000b160:	edc50513          	addi	a0,a0,-292 # 80010038 <_ZL11CACHE_NAMES+0x478>
    8000b164:	ffffa097          	auipc	ra,0xffffa
    8000b168:	f40080e7          	jalr	-192(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b16c:	00000613          	li	a2,0
    8000b170:	00a00593          	li	a1,10
    8000b174:	00048513          	mv	a0,s1
    8000b178:	ffffa097          	auipc	ra,0xffffa
    8000b17c:	f74080e7          	jalr	-140(ra) # 800050ec <_Z9kprintIntmib>
    8000b180:	00004517          	auipc	a0,0x4
    8000b184:	3a850513          	addi	a0,a0,936 # 8000f528 <CONSOLE_STATUS+0x518>
    8000b188:	ffffa097          	auipc	ra,0xffffa
    8000b18c:	f1c080e7          	jalr	-228(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b190:	00349913          	slli	s2,s1,0x3
    8000b194:	012a8933          	add	s2,s5,s2
    8000b198:	00000613          	li	a2,0
    8000b19c:	01000593          	li	a1,16
    8000b1a0:	00093503          	ld	a0,0(s2)
    8000b1a4:	ffffa097          	auipc	ra,0xffffa
    8000b1a8:	f48080e7          	jalr	-184(ra) # 800050ec <_Z9kprintIntmib>
    8000b1ac:	00004517          	auipc	a0,0x4
    8000b1b0:	1ac50513          	addi	a0,a0,428 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b1b4:	ffffa097          	auipc	ra,0xffffa
    8000b1b8:	ef0080e7          	jalr	-272(ra) # 800050a4 <_Z12kprintStringPKc>
        if(!object[i]){
    8000b1bc:	00093583          	ld	a1,0(s2)
    8000b1c0:	00058c63          	beqz	a1,8000b1d8 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0xcc>
        cache->free_obj(object[i]);
    8000b1c4:	000a0513          	mv	a0,s4
    8000b1c8:	ffffe097          	auipc	ra,0xffffe
    8000b1cc:	9bc080e7          	jalr	-1604(ra) # 80008b84 <_ZN11ObjectCache8free_objEPv>
    for(int i = 0; i < size; i++){
    8000b1d0:	0014849b          	addiw	s1,s1,1
    8000b1d4:	f85ff06f          	j	8000b158 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0x4c>
            kprintString("Invalid object address!\n");   
    8000b1d8:	00005517          	auipc	a0,0x5
    8000b1dc:	ed850513          	addi	a0,a0,-296 # 800100b0 <_ZL11CACHE_NAMES+0x4f0>
    8000b1e0:	ffffa097          	auipc	ra,0xffffa
    8000b1e4:	ec4080e7          	jalr	-316(ra) # 800050a4 <_Z12kprintStringPKc>
            return;
    8000b1e8:	0300006f          	j	8000b218 <_Z23cache_obj_dealloca_testPPviP11ObjectCachec+0x10c>
    cache->printInfo(flags);
    8000b1ec:	000b0593          	mv	a1,s6
    8000b1f0:	000a0513          	mv	a0,s4
    8000b1f4:	ffffd097          	auipc	ra,0xffffd
    8000b1f8:	2f0080e7          	jalr	752(ra) # 800084e4 <_ZN11ObjectCache9printInfoEc>
    slab_allocator_state_ceck(flags);
    8000b1fc:	000b0513          	mv	a0,s6
    8000b200:	00000097          	auipc	ra,0x0
    8000b204:	d78080e7          	jalr	-648(ra) # 8000af78 <_Z25slab_allocator_state_ceckc>
    kprintString("\n\n=============Object Dellocate Test End=============\n\n");
    8000b208:	00005517          	auipc	a0,0x5
    8000b20c:	ec850513          	addi	a0,a0,-312 # 800100d0 <_ZL11CACHE_NAMES+0x510>
    8000b210:	ffffa097          	auipc	ra,0xffffa
    8000b214:	e94080e7          	jalr	-364(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000b218:	03813083          	ld	ra,56(sp)
    8000b21c:	03013403          	ld	s0,48(sp)
    8000b220:	02813483          	ld	s1,40(sp)
    8000b224:	02013903          	ld	s2,32(sp)
    8000b228:	01813983          	ld	s3,24(sp)
    8000b22c:	01013a03          	ld	s4,16(sp)
    8000b230:	00813a83          	ld	s5,8(sp)
    8000b234:	00013b03          	ld	s6,0(sp)
    8000b238:	04010113          	addi	sp,sp,64
    8000b23c:	00008067          	ret

000000008000b240 <_Z9slab_testv>:


void slab_test(){
    8000b240:	f4010113          	addi	sp,sp,-192
    8000b244:	0a113c23          	sd	ra,184(sp)
    8000b248:	0a813823          	sd	s0,176(sp)
    8000b24c:	0a913423          	sd	s1,168(sp)
    8000b250:	0b213023          	sd	s2,160(sp)
    8000b254:	0c010413          	addi	s0,sp,192
    kprintString("\n\n--------SLAB TEST--------\n\n");
    8000b258:	00005517          	auipc	a0,0x5
    8000b25c:	eb050513          	addi	a0,a0,-336 # 80010108 <_ZL11CACHE_NAMES+0x548>
    8000b260:	ffffa097          	auipc	ra,0xffffa
    8000b264:	e44080e7          	jalr	-444(ra) # 800050a4 <_Z12kprintStringPKc>
    
    kprintString("Slab Allocator init!\n");
    8000b268:	00005517          	auipc	a0,0x5
    8000b26c:	ec050513          	addi	a0,a0,-320 # 80010128 <_ZL11CACHE_NAMES+0x568>
    8000b270:	ffffa097          	auipc	ra,0xffffa
    8000b274:	e34080e7          	jalr	-460(ra) # 800050a4 <_Z12kprintStringPKc>
    SlabAl::getInstance();
    8000b278:	ffffe097          	auipc	ra,0xffffe
    8000b27c:	09c080e7          	jalr	156(ra) # 80009314 <_ZN13SlabAllocator11getInstanceEv>
    // slab_allocator_state_ceck(Slab::pb_mask::ALLOC);
    
    char flagAllocFree = Slab::pb_mask::ALLOC | Slab::pb_mask::FREE;

     int size = 10;
     ObjectCache** oc = (ObjectCache**)NoAlloc::mem_alloc(size*sizeof(ObjectCache*));
    8000b280:	05000513          	li	a0,80
    8000b284:	ffffd097          	auipc	ra,0xffffd
    8000b288:	be0080e7          	jalr	-1056(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    8000b28c:	00050913          	mv	s2,a0
     cache_alloc_test(oc, size, 32, flagAllocFree);
    8000b290:	00300693          	li	a3,3
    8000b294:	02000613          	li	a2,32
    8000b298:	00a00593          	li	a1,10
    8000b29c:	fffff097          	auipc	ra,0xfffff
    8000b2a0:	774080e7          	jalr	1908(ra) # 8000aa10 <_Z16cache_alloc_testPP11ObjectCacheimc>

    //int obj_num = 20;
    KSemaphore* x[20];
    ObjectCache* semaphore_cache = new ObjectCache("ksemaphore_cache", sizeof(KSemaphore), ctor, nullptr);
    8000b2a4:	05800513          	li	a0,88
    8000b2a8:	ffffe097          	auipc	ra,0xffffe
    8000b2ac:	8ac080e7          	jalr	-1876(ra) # 80008b54 <_ZN11ObjectCachenwEm>
    8000b2b0:	00050493          	mv	s1,a0
    8000b2b4:	02050463          	beqz	a0,8000b2dc <_Z9slab_testv+0x9c>
    8000b2b8:	00000793          	li	a5,0
    8000b2bc:	00000713          	li	a4,0
    8000b2c0:	fffff697          	auipc	a3,0xfffff
    8000b2c4:	6dc68693          	addi	a3,a3,1756 # 8000a99c <_Z4ctorPv>
    8000b2c8:	02800613          	li	a2,40
    8000b2cc:	00005597          	auipc	a1,0x5
    8000b2d0:	e7458593          	addi	a1,a1,-396 # 80010140 <_ZL11CACHE_NAMES+0x580>
    8000b2d4:	ffffd097          	auipc	ra,0xffffd
    8000b2d8:	d34080e7          	jalr	-716(ra) # 80008008 <_ZN11ObjectCacheC1EPKcmPFvPvES4_NS_12SlabMetaTypeE>

    cache_obj_alloc_test((void**)x, 10, semaphore_cache, flagAllocFree);
    8000b2dc:	00300693          	li	a3,3
    8000b2e0:	00048613          	mv	a2,s1
    8000b2e4:	00a00593          	li	a1,10
    8000b2e8:	f4040513          	addi	a0,s0,-192
    8000b2ec:	00000097          	auipc	ra,0x0
    8000b2f0:	cec080e7          	jalr	-788(ra) # 8000afd8 <_Z20cache_obj_alloc_testPPviP11ObjectCachec>

    KCHECKPRINT(x[1]->get_val());
    8000b2f4:	00005517          	auipc	a0,0x5
    8000b2f8:	e6450513          	addi	a0,a0,-412 # 80010158 <_ZL11CACHE_NAMES+0x598>
    8000b2fc:	ffffa097          	auipc	ra,0xffffa
    8000b300:	da8080e7          	jalr	-600(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b304:	00000613          	li	a2,0
    8000b308:	01000593          	li	a1,16
    8000b30c:	f4843783          	ld	a5,-184(s0)
    8000b310:	0087e503          	lwu	a0,8(a5)
    8000b314:	ffffa097          	auipc	ra,0xffffa
    8000b318:	dd8080e7          	jalr	-552(ra) # 800050ec <_Z9kprintIntmib>
    8000b31c:	00004517          	auipc	a0,0x4
    8000b320:	03c50513          	addi	a0,a0,60 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b324:	ffffa097          	auipc	ra,0xffffa
    8000b328:	d80080e7          	jalr	-640(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(x[8]->get_val());
    8000b32c:	00005517          	auipc	a0,0x5
    8000b330:	e4450513          	addi	a0,a0,-444 # 80010170 <_ZL11CACHE_NAMES+0x5b0>
    8000b334:	ffffa097          	auipc	ra,0xffffa
    8000b338:	d70080e7          	jalr	-656(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b33c:	00000613          	li	a2,0
    8000b340:	01000593          	li	a1,16
    8000b344:	f8043783          	ld	a5,-128(s0)
    8000b348:	0087e503          	lwu	a0,8(a5)
    8000b34c:	ffffa097          	auipc	ra,0xffffa
    8000b350:	da0080e7          	jalr	-608(ra) # 800050ec <_Z9kprintIntmib>
    8000b354:	00004517          	auipc	a0,0x4
    8000b358:	00450513          	addi	a0,a0,4 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b35c:	ffffa097          	auipc	ra,0xffffa
    8000b360:	d48080e7          	jalr	-696(ra) # 800050a4 <_Z12kprintStringPKc>

    cache_dealloc_test(oc, size, flagAllocFree);
    8000b364:	00300613          	li	a2,3
    8000b368:	00a00593          	li	a1,10
    8000b36c:	00090513          	mv	a0,s2
    8000b370:	00000097          	auipc	ra,0x0
    8000b374:	870080e7          	jalr	-1936(ra) # 8000abe0 <_Z18cache_dealloc_testPP11ObjectCacheic>

    
    
   
   
    kprintString("\n\n------SLAB TEST END------\n\n");
    8000b378:	00005517          	auipc	a0,0x5
    8000b37c:	e1050513          	addi	a0,a0,-496 # 80010188 <_ZL11CACHE_NAMES+0x5c8>
    8000b380:	ffffa097          	auipc	ra,0xffffa
    8000b384:	d24080e7          	jalr	-732(ra) # 800050a4 <_Z12kprintStringPKc>


    8000b388:	0b813083          	ld	ra,184(sp)
    8000b38c:	0b013403          	ld	s0,176(sp)
    8000b390:	0a813483          	ld	s1,168(sp)
    8000b394:	0a013903          	ld	s2,160(sp)
    8000b398:	0c010113          	addi	sp,sp,192
    8000b39c:	00008067          	ret
    8000b3a0:	00050913          	mv	s2,a0
    ObjectCache* semaphore_cache = new ObjectCache("ksemaphore_cache", sizeof(KSemaphore), ctor, nullptr);
    8000b3a4:	00048513          	mv	a0,s1
    8000b3a8:	ffffe097          	auipc	ra,0xffffe
    8000b3ac:	90c080e7          	jalr	-1780(ra) # 80008cb4 <_ZN11ObjectCachedlEPv>
    8000b3b0:	00090513          	mv	a0,s2
    8000b3b4:	0000b097          	auipc	ra,0xb
    8000b3b8:	1c4080e7          	jalr	452(ra) # 80016578 <_Unwind_Resume>

000000008000b3bc <_ZN13TreeLikeBuddyC1EPvm>:
#include"../../h/kernel_lib.h"
#include"../../h/tree_like_buddy.h"
TreeLikeBuddy* TreeLikeBuddy::buddy = nullptr;
uchar TreeLikeBuddy::BLOCK_SIZE_BIT_LEN = 0;
TreeLikeBuddy::TreeLikeBuddy(void* saddr, size_t sz){
    8000b3bc:	fd010113          	addi	sp,sp,-48
    8000b3c0:	02113423          	sd	ra,40(sp)
    8000b3c4:	02813023          	sd	s0,32(sp)
    8000b3c8:	00913c23          	sd	s1,24(sp)
    8000b3cc:	01213823          	sd	s2,16(sp)
    8000b3d0:	01313423          	sd	s3,8(sp)
    8000b3d4:	01413023          	sd	s4,0(sp)
    8000b3d8:	03010413          	addi	s0,sp,48
    8000b3dc:	00050493          	mv	s1,a0
    /* --------Memory Meta Init-------- */
    mmeta_num = log2(sz) + 1;
    8000b3e0:	00060513          	mv	a0,a2
    8000b3e4:	ffffa097          	auipc	ra,0xffffa
    8000b3e8:	680080e7          	jalr	1664(ra) # 80005a64 <_Z4log2m>
    8000b3ec:	0015051b          	addiw	a0,a0,1
    8000b3f0:	0ff57513          	andi	a0,a0,255
    8000b3f4:	02a48023          	sb	a0,32(s1)
    mmeta_s = (uint64*)NoAlloc::mem_alloc(mmeta_num * sizeof(uint64));
    8000b3f8:	00351513          	slli	a0,a0,0x3
    8000b3fc:	ffffd097          	auipc	ra,0xffffd
    8000b400:	a68080e7          	jalr	-1432(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    8000b404:	00a4bc23          	sd	a0,24(s1)
    if(!mmeta_s) { /* TODO: panic */ }
    mmeta = (alloc_t**) NoAlloc::mem_alloc(mmeta_num * sizeof(alloc_t*));
    8000b408:	0204c503          	lbu	a0,32(s1)
    8000b40c:	00351513          	slli	a0,a0,0x3
    8000b410:	ffffd097          	auipc	ra,0xffffd
    8000b414:	a54080e7          	jalr	-1452(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    8000b418:	00a4b823          	sd	a0,16(s1)
    if(!mmeta) { /* TODO: panic */ }
    for(uchar i = 0; i < mmeta_num; i++){
    8000b41c:	00000993          	li	s3,0
    8000b420:	00c0006f          	j	8000b42c <_ZN13TreeLikeBuddyC1EPvm+0x70>
    8000b424:	0019899b          	addiw	s3,s3,1
    8000b428:	0ff9f993          	andi	s3,s3,255
    8000b42c:	0204c783          	lbu	a5,32(s1)
    8000b430:	06f9fa63          	bgeu	s3,a5,8000b4a4 <_ZN13TreeLikeBuddyC1EPvm+0xe8>
        mmeta_s[i] = 1ULL << (mmeta_num - i - 1);
    8000b434:	413787bb          	subw	a5,a5,s3
    8000b438:	fff7879b          	addiw	a5,a5,-1
    8000b43c:	0184b703          	ld	a4,24(s1)
    8000b440:	00399913          	slli	s2,s3,0x3
    8000b444:	01270733          	add	a4,a4,s2
    8000b448:	00100693          	li	a3,1
    8000b44c:	00f697b3          	sll	a5,a3,a5
    8000b450:	00f73023          	sd	a5,0(a4)
        mmeta[i] = (alloc_t*) NoAlloc::mem_alloc(mmeta_s[i] * sizeof(alloc_t));
    8000b454:	0184b783          	ld	a5,24(s1)
    8000b458:	012787b3          	add	a5,a5,s2
    8000b45c:	0104ba03          	ld	s4,16(s1)
    8000b460:	012a0a33          	add	s4,s4,s2
    8000b464:	0007b503          	ld	a0,0(a5)
    8000b468:	ffffd097          	auipc	ra,0xffffd
    8000b46c:	9fc080e7          	jalr	-1540(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    8000b470:	00aa3023          	sd	a0,0(s4)
        if(!mmeta[i]) { /* TODO: panic */ }
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    8000b474:	00000713          	li	a4,0
    8000b478:	0184b783          	ld	a5,24(s1)
    8000b47c:	012787b3          	add	a5,a5,s2
    8000b480:	0007b783          	ld	a5,0(a5)
    8000b484:	faf770e3          	bgeu	a4,a5,8000b424 <_ZN13TreeLikeBuddyC1EPvm+0x68>
            mmeta[i][j] = alloc_t::ALLOC; 
    8000b488:	0104b783          	ld	a5,16(s1)
    8000b48c:	012787b3          	add	a5,a5,s2
    8000b490:	0007b783          	ld	a5,0(a5)
    8000b494:	00e787b3          	add	a5,a5,a4
    8000b498:	00078023          	sb	zero,0(a5)
        for(uint64 j = 0; j < mmeta_s[i]; j++)
    8000b49c:	00170713          	addi	a4,a4,1
    8000b4a0:	fd9ff06f          	j	8000b478 <_ZN13TreeLikeBuddyC1EPvm+0xbc>
    }
    mmeta[mmeta_num - 1][0] = alloc_t::FREE;
    8000b4a4:	0104b703          	ld	a4,16(s1)
    8000b4a8:	00379793          	slli	a5,a5,0x3
    8000b4ac:	ff878793          	addi	a5,a5,-8
    8000b4b0:	00f707b3          	add	a5,a4,a5
    8000b4b4:	0007b783          	ld	a5,0(a5)
    8000b4b8:	00100713          	li	a4,1
    8000b4bc:	00e78023          	sb	a4,0(a5)
}
    8000b4c0:	02813083          	ld	ra,40(sp)
    8000b4c4:	02013403          	ld	s0,32(sp)
    8000b4c8:	01813483          	ld	s1,24(sp)
    8000b4cc:	01013903          	ld	s2,16(sp)
    8000b4d0:	00813983          	ld	s3,8(sp)
    8000b4d4:	00013a03          	ld	s4,0(sp)
    8000b4d8:	03010113          	addi	sp,sp,48
    8000b4dc:	00008067          	ret

000000008000b4e0 <_ZN13TreeLikeBuddy12status_printEv>:

void TreeLikeBuddy::status_print(){
    8000b4e0:	fe010113          	addi	sp,sp,-32
    8000b4e4:	00113c23          	sd	ra,24(sp)
    8000b4e8:	00813823          	sd	s0,16(sp)
    8000b4ec:	00913423          	sd	s1,8(sp)
    8000b4f0:	02010413          	addi	s0,sp,32
    if(!buddy){
    8000b4f4:	0000a797          	auipc	a5,0xa
    8000b4f8:	f4478793          	addi	a5,a5,-188 # 80015438 <_ZN13TreeLikeBuddy5buddyE>
    8000b4fc:	0007b783          	ld	a5,0(a5)
    8000b500:	10078063          	beqz	a5,8000b600 <_ZN13TreeLikeBuddy12status_printEv+0x120>
    8000b504:	00050493          	mv	s1,a0
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    8000b508:	00004517          	auipc	a0,0x4
    8000b50c:	05050513          	addi	a0,a0,80 # 8000f558 <CONSOLE_STATUS+0x548>
    8000b510:	ffffa097          	auipc	ra,0xffffa
    8000b514:	b94080e7          	jalr	-1132(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(buddy);
    8000b518:	00004517          	auipc	a0,0x4
    8000b51c:	06050513          	addi	a0,a0,96 # 8000f578 <CONSOLE_STATUS+0x568>
    8000b520:	ffffa097          	auipc	ra,0xffffa
    8000b524:	b84080e7          	jalr	-1148(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b528:	00000613          	li	a2,0
    8000b52c:	01000593          	li	a1,16
    8000b530:	0000a797          	auipc	a5,0xa
    8000b534:	f0878793          	addi	a5,a5,-248 # 80015438 <_ZN13TreeLikeBuddy5buddyE>
    8000b538:	0007b503          	ld	a0,0(a5)
    8000b53c:	ffffa097          	auipc	ra,0xffffa
    8000b540:	bb0080e7          	jalr	-1104(ra) # 800050ec <_Z9kprintIntmib>
    8000b544:	00004517          	auipc	a0,0x4
    8000b548:	e1450513          	addi	a0,a0,-492 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b54c:	ffffa097          	auipc	ra,0xffffa
    8000b550:	b58080e7          	jalr	-1192(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(start_address);
    8000b554:	00004517          	auipc	a0,0x4
    8000b558:	02c50513          	addi	a0,a0,44 # 8000f580 <CONSOLE_STATUS+0x570>
    8000b55c:	ffffa097          	auipc	ra,0xffffa
    8000b560:	b48080e7          	jalr	-1208(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b564:	00000613          	li	a2,0
    8000b568:	01000593          	li	a1,16
    8000b56c:	0004b503          	ld	a0,0(s1)
    8000b570:	ffffa097          	auipc	ra,0xffffa
    8000b574:	b7c080e7          	jalr	-1156(ra) # 800050ec <_Z9kprintIntmib>
    8000b578:	00004517          	auipc	a0,0x4
    8000b57c:	de050513          	addi	a0,a0,-544 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b580:	ffffa097          	auipc	ra,0xffffa
    8000b584:	b24080e7          	jalr	-1244(ra) # 800050a4 <_Z12kprintStringPKc>
    KCHECKPRINT(size);
    8000b588:	00005517          	auipc	a0,0x5
    8000b58c:	c2050513          	addi	a0,a0,-992 # 800101a8 <_ZL11CACHE_NAMES+0x5e8>
    8000b590:	ffffa097          	auipc	ra,0xffffa
    8000b594:	b14080e7          	jalr	-1260(ra) # 800050a4 <_Z12kprintStringPKc>
    8000b598:	00000613          	li	a2,0
    8000b59c:	01000593          	li	a1,16
    8000b5a0:	0084b503          	ld	a0,8(s1)
    8000b5a4:	ffffa097          	auipc	ra,0xffffa
    8000b5a8:	b48080e7          	jalr	-1208(ra) # 800050ec <_Z9kprintIntmib>
    8000b5ac:	00004517          	auipc	a0,0x4
    8000b5b0:	dac50513          	addi	a0,a0,-596 # 8000f358 <CONSOLE_STATUS+0x348>
    8000b5b4:	ffffa097          	auipc	ra,0xffffa
    8000b5b8:	af0080e7          	jalr	-1296(ra) # 800050a4 <_Z12kprintStringPKc>

    kprintString("\t------MEMORY META------\n");
    8000b5bc:	00004517          	auipc	a0,0x4
    8000b5c0:	fe450513          	addi	a0,a0,-28 # 8000f5a0 <CONSOLE_STATUS+0x590>
    8000b5c4:	ffffa097          	auipc	ra,0xffffa
    8000b5c8:	ae0080e7          	jalr	-1312(ra) # 800050a4 <_Z12kprintStringPKc>
    /**/
    kprintString("\t----END MEMORY META----\n");
    8000b5cc:	00004517          	auipc	a0,0x4
    8000b5d0:	00c50513          	addi	a0,a0,12 # 8000f5d8 <CONSOLE_STATUS+0x5c8>
    8000b5d4:	ffffa097          	auipc	ra,0xffffa
    8000b5d8:	ad0080e7          	jalr	-1328(ra) # 800050a4 <_Z12kprintStringPKc>

    kprintString("-------END BUDDY STATUS-------\n");
    8000b5dc:	00004517          	auipc	a0,0x4
    8000b5e0:	01c50513          	addi	a0,a0,28 # 8000f5f8 <CONSOLE_STATUS+0x5e8>
    8000b5e4:	ffffa097          	auipc	ra,0xffffa
    8000b5e8:	ac0080e7          	jalr	-1344(ra) # 800050a4 <_Z12kprintStringPKc>

    8000b5ec:	01813083          	ld	ra,24(sp)
    8000b5f0:	01013403          	ld	s0,16(sp)
    8000b5f4:	00813483          	ld	s1,8(sp)
    8000b5f8:	02010113          	addi	sp,sp,32
    8000b5fc:	00008067          	ret
        kprintString("BUDDY NOT INITALIZED!!!");
    8000b600:	00004517          	auipc	a0,0x4
    8000b604:	f4050513          	addi	a0,a0,-192 # 8000f540 <CONSOLE_STATUS+0x530>
    8000b608:	ffffa097          	auipc	ra,0xffffa
    8000b60c:	a9c080e7          	jalr	-1380(ra) # 800050a4 <_Z12kprintStringPKc>
        return;
    8000b610:	fddff06f          	j	8000b5ec <_ZN13TreeLikeBuddy12status_printEv+0x10c>

000000008000b614 <_ZN6list_tC1EPS_S0_>:
#include"../../../h/kernel_lib.h"

list_t::list_t(list_t* t_next, list_t* t_prev):next(t_next),prev(t_prev){}
    8000b614:	ff010113          	addi	sp,sp,-16
    8000b618:	00813423          	sd	s0,8(sp)
    8000b61c:	01010413          	addi	s0,sp,16
    8000b620:	00b53023          	sd	a1,0(a0)
    8000b624:	00c53423          	sd	a2,8(a0)
    8000b628:	00813403          	ld	s0,8(sp)
    8000b62c:	01010113          	addi	sp,sp,16
    8000b630:	00008067          	ret

000000008000b634 <_Z6removeP6list_t>:

list_t* remove(list_t* head){
    8000b634:	ff010113          	addi	sp,sp,-16
    8000b638:	00813423          	sd	s0,8(sp)
    8000b63c:	01010413          	addi	s0,sp,16
    8000b640:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    8000b644:	02050863          	beqz	a0,8000b674 <_Z6removeP6list_t+0x40>

    if(head->next) head -> next -> prev = head -> prev;
    8000b648:	00053703          	ld	a4,0(a0)
    8000b64c:	00070663          	beqz	a4,8000b658 <_Z6removeP6list_t+0x24>
    8000b650:	00853683          	ld	a3,8(a0)
    8000b654:	00d73423          	sd	a3,8(a4)
    if(head->prev) head -> prev -> next = head -> next;
    8000b658:	0087b703          	ld	a4,8(a5)
    8000b65c:	00070663          	beqz	a4,8000b668 <_Z6removeP6list_t+0x34>
    8000b660:	0007b683          	ld	a3,0(a5)
    8000b664:	00d73023          	sd	a3,0(a4)
    list_t* node = head;
    head = head->next;
    8000b668:	0007b503          	ld	a0,0(a5)
    node -> next = nullptr;
    8000b66c:	0007b023          	sd	zero,0(a5)
    node -> prev = nullptr;
    8000b670:	0007b423          	sd	zero,8(a5)

    return head; 
}
    8000b674:	00813403          	ld	s0,8(sp)
    8000b678:	01010113          	addi	sp,sp,16
    8000b67c:	00008067          	ret

000000008000b680 <_Z6insertP6list_tS0_>:
list_t* insert(list_t* node, list_t* head){
    8000b680:	ff010113          	addi	sp,sp,-16
    8000b684:	00813423          	sd	s0,8(sp)
    8000b688:	01010413          	addi	s0,sp,16
    if(!node) return head;
    8000b68c:	02050863          	beqz	a0,8000b6bc <_Z6insertP6list_tS0_+0x3c>
    node->next = nullptr;
    node->prev = nullptr;
    8000b690:	00053423          	sd	zero,8(a0)

    node -> next = head;
    8000b694:	00b53023          	sd	a1,0(a0)
    if(head){
    8000b698:	00058c63          	beqz	a1,8000b6b0 <_Z6insertP6list_tS0_+0x30>
        node -> prev = head->prev;
    8000b69c:	0085b783          	ld	a5,8(a1)
    8000b6a0:	00f53423          	sd	a5,8(a0)
        if(head->prev) head->prev->next = node;
    8000b6a4:	00078463          	beqz	a5,8000b6ac <_Z6insertP6list_tS0_+0x2c>
    8000b6a8:	00a7b023          	sd	a0,0(a5)
        head->prev = node;
    8000b6ac:	00a5b423          	sd	a0,8(a1)
    }
    return node;
}
    8000b6b0:	00813403          	ld	s0,8(sp)
    8000b6b4:	01010113          	addi	sp,sp,16
    8000b6b8:	00008067          	ret
    if(!node) return head;
    8000b6bc:	00058513          	mv	a0,a1
    8000b6c0:	ff1ff06f          	j	8000b6b0 <_Z6insertP6list_tS0_+0x30>

000000008000b6c4 <_ZN5PagerC1Ev>:
#include"../../../h/kernel_lib.h"

Pager* Pager::p = nullptr;

Pager::Pager():pmt(nullptr){}
    8000b6c4:	ff010113          	addi	sp,sp,-16
    8000b6c8:	00813423          	sd	s0,8(sp)
    8000b6cc:	01010413          	addi	s0,sp,16
    8000b6d0:	00053023          	sd	zero,0(a0)
    8000b6d4:	00813403          	ld	s0,8(sp)
    8000b6d8:	01010113          	addi	sp,sp,16
    8000b6dc:	00008067          	ret

000000008000b6e0 <_ZN5Pager11getInstanceEv>:

Pager& Pager::getInstance(){
    if(!p) p = new Pager();
    8000b6e0:	0000a797          	auipc	a5,0xa
    8000b6e4:	d6078793          	addi	a5,a5,-672 # 80015440 <_ZN5Pager1pE>
    8000b6e8:	0007b783          	ld	a5,0(a5)
    8000b6ec:	00078a63          	beqz	a5,8000b700 <_ZN5Pager11getInstanceEv+0x20>
    
    return *p;
}
    8000b6f0:	0000a797          	auipc	a5,0xa
    8000b6f4:	d5078793          	addi	a5,a5,-688 # 80015440 <_ZN5Pager1pE>
    8000b6f8:	0007b503          	ld	a0,0(a5)
    8000b6fc:	00008067          	ret
Pager& Pager::getInstance(){
    8000b700:	fe010113          	addi	sp,sp,-32
    8000b704:	00113c23          	sd	ra,24(sp)
    8000b708:	00813823          	sd	s0,16(sp)
    8000b70c:	00913423          	sd	s1,8(sp)
    8000b710:	02010413          	addi	s0,sp,32
    
    static Pager* p;
    PMT* pmt;
    Pager();

    __NOALLOC_OPERATORS__
    8000b714:	00800513          	li	a0,8
    8000b718:	ffffc097          	auipc	ra,0xffffc
    8000b71c:	74c080e7          	jalr	1868(ra) # 80007e64 <_ZN7NoAlloc9mem_allocEm>
    8000b720:	00050493          	mv	s1,a0
    if(!p) p = new Pager();
    8000b724:	00050663          	beqz	a0,8000b730 <_ZN5Pager11getInstanceEv+0x50>
    8000b728:	00000097          	auipc	ra,0x0
    8000b72c:	f9c080e7          	jalr	-100(ra) # 8000b6c4 <_ZN5PagerC1Ev>
    8000b730:	0000a797          	auipc	a5,0xa
    8000b734:	d097b823          	sd	s1,-752(a5) # 80015440 <_ZN5Pager1pE>
}
    8000b738:	0000a797          	auipc	a5,0xa
    8000b73c:	d0878793          	addi	a5,a5,-760 # 80015440 <_ZN5Pager1pE>
    8000b740:	0007b503          	ld	a0,0(a5)
    8000b744:	01813083          	ld	ra,24(sp)
    8000b748:	01013403          	ld	s0,16(sp)
    8000b74c:	00813483          	ld	s1,8(sp)
    8000b750:	02010113          	addi	sp,sp,32
    8000b754:	00008067          	ret

000000008000b758 <_ZN5Pager3mapEPvS0_12PMTEntryBits>:

int Pager::map(void *va, void *pa, PMTEntryBits flag){
    8000b758:	fc010113          	addi	sp,sp,-64
    8000b75c:	02113c23          	sd	ra,56(sp)
    8000b760:	02813823          	sd	s0,48(sp)
    8000b764:	02913423          	sd	s1,40(sp)
    8000b768:	03213023          	sd	s2,32(sp)
    8000b76c:	01313c23          	sd	s3,24(sp)
    8000b770:	01413823          	sd	s4,16(sp)
    8000b774:	01513423          	sd	s5,8(sp)
    8000b778:	04010413          	addi	s0,sp,64
    8000b77c:	00050493          	mv	s1,a0
    8000b780:	00058993          	mv	s3,a1
    8000b784:	00060a13          	mv	s4,a2
    8000b788:	00068a93          	mv	s5,a3
   
    if(!pmt)
    8000b78c:	00053783          	ld	a5,0(a0)
    8000b790:	02078263          	beqz	a5,8000b7b4 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x5c>
        pmt = PMT::allocate_pmt();
    
    PMT* curr = pmt;
    PMTEntry* pmte = curr->get_entry(2, va);
    8000b794:	00098613          	mv	a2,s3
    8000b798:	00200593          	li	a1,2
    8000b79c:	0004b503          	ld	a0,0(s1)
    8000b7a0:	00000097          	auipc	ra,0x0
    8000b7a4:	724080e7          	jalr	1828(ra) # 8000bec4 <_ZN3PMT9get_entryEhPv>
    8000b7a8:	00050493          	mv	s1,a0
    
    for(int i = 2; i > 0; i--){
    8000b7ac:	00200913          	li	s2,2
    8000b7b0:	0640006f          	j	8000b814 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0xbc>
        pmt = PMT::allocate_pmt();
    8000b7b4:	00000097          	auipc	ra,0x0
    8000b7b8:	7fc080e7          	jalr	2044(ra) # 8000bfb0 <_ZN3PMT12allocate_pmtEv>
    8000b7bc:	00a4b023          	sd	a0,0(s1)
    8000b7c0:	fd5ff06f          	j	8000b794 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x3c>
       
        if(!(pmte->chk_flags(PMTEntryBits::valid))){
            pmte->set_flags(PMTEntryBits::valid);
    8000b7c4:	00100593          	li	a1,1
    8000b7c8:	00048513          	mv	a0,s1
    8000b7cc:	00000097          	auipc	ra,0x0
    8000b7d0:	600080e7          	jalr	1536(ra) # 8000bdcc <_ZN8PMTEntry9set_flagsE12PMTEntryBits>
            pmte->set_pa(PMT::allocate_pmt());
    8000b7d4:	00000097          	auipc	ra,0x0
    8000b7d8:	7dc080e7          	jalr	2012(ra) # 8000bfb0 <_ZN3PMT12allocate_pmtEv>
    8000b7dc:	00050593          	mv	a1,a0
    8000b7e0:	00048513          	mv	a0,s1
    8000b7e4:	00000097          	auipc	ra,0x0
    8000b7e8:	678080e7          	jalr	1656(ra) # 8000be5c <_ZN8PMTEntry6set_paEPv>
        }
       
        curr = (PMT*)pmte->get_pa();
    8000b7ec:	00048513          	mv	a0,s1
    8000b7f0:	00000097          	auipc	ra,0x0
    8000b7f4:	644080e7          	jalr	1604(ra) # 8000be34 <_ZN8PMTEntry6get_paEv>
        
        pmte = curr->get_entry(i-1, va);
    8000b7f8:	fff9059b          	addiw	a1,s2,-1
    8000b7fc:	00098613          	mv	a2,s3
    8000b800:	0ff5f593          	andi	a1,a1,255
    8000b804:	00000097          	auipc	ra,0x0
    8000b808:	6c0080e7          	jalr	1728(ra) # 8000bec4 <_ZN3PMT9get_entryEhPv>
    8000b80c:	00050493          	mv	s1,a0
    for(int i = 2; i > 0; i--){
    8000b810:	fff9091b          	addiw	s2,s2,-1
    8000b814:	01205e63          	blez	s2,8000b830 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0xd8>
        if(!(pmte->chk_flags(PMTEntryBits::valid))){
    8000b818:	00100593          	li	a1,1
    8000b81c:	00048513          	mv	a0,s1
    8000b820:	00000097          	auipc	ra,0x0
    8000b824:	67c080e7          	jalr	1660(ra) # 8000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000b828:	fc0512e3          	bnez	a0,8000b7ec <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x94>
    8000b82c:	f99ff06f          	j	8000b7c4 <_ZN5Pager3mapEPvS0_12PMTEntryBits+0x6c>
    }
    
    pmte->set_flags((PMTEntryBits)(PMTEntryBits::valid | flag));
    8000b830:	001ae593          	ori	a1,s5,1
    8000b834:	00048513          	mv	a0,s1
    8000b838:	00000097          	auipc	ra,0x0
    8000b83c:	594080e7          	jalr	1428(ra) # 8000bdcc <_ZN8PMTEntry9set_flagsE12PMTEntryBits>
    pmte->set_pa(pa);
    8000b840:	000a0593          	mv	a1,s4
    8000b844:	00048513          	mv	a0,s1
    8000b848:	00000097          	auipc	ra,0x0
    8000b84c:	614080e7          	jalr	1556(ra) # 8000be5c <_ZN8PMTEntry6set_paEPv>
    

    return 0;
}
    8000b850:	00000513          	li	a0,0
    8000b854:	03813083          	ld	ra,56(sp)
    8000b858:	03013403          	ld	s0,48(sp)
    8000b85c:	02813483          	ld	s1,40(sp)
    8000b860:	02013903          	ld	s2,32(sp)
    8000b864:	01813983          	ld	s3,24(sp)
    8000b868:	01013a03          	ld	s4,16(sp)
    8000b86c:	00813a83          	ld	s5,8(sp)
    8000b870:	04010113          	addi	sp,sp,64
    8000b874:	00008067          	ret

000000008000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>:

int Pager::id_map(void* start, void* end, PMTEntryBits flag){
    8000b878:	fd010113          	addi	sp,sp,-48
    8000b87c:	02113423          	sd	ra,40(sp)
    8000b880:	02813023          	sd	s0,32(sp)
    8000b884:	00913c23          	sd	s1,24(sp)
    8000b888:	01213823          	sd	s2,16(sp)
    8000b88c:	01313423          	sd	s3,8(sp)
    8000b890:	01413023          	sd	s4,0(sp)
    8000b894:	03010413          	addi	s0,sp,48
    8000b898:	00050a13          	mv	s4,a0
    8000b89c:	00068993          	mv	s3,a3
    uint64 ustart = (uint64) start, uend = (uint64) end;
    8000b8a0:	00060913          	mv	s2,a2
    ustart = ustart & ~(0xfff);
    8000b8a4:	fffff4b7          	lui	s1,0xfffff
    8000b8a8:	0095f4b3          	and	s1,a1,s1
    uint64 tmp = ustart;

    while(tmp < uend){
    8000b8ac:	0324f463          	bgeu	s1,s2,8000b8d4 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits+0x5c>
        map((void*)tmp, (void*)tmp, flag);
    8000b8b0:	00098693          	mv	a3,s3
    8000b8b4:	00048613          	mv	a2,s1
    8000b8b8:	00048593          	mv	a1,s1
    8000b8bc:	000a0513          	mv	a0,s4
    8000b8c0:	00000097          	auipc	ra,0x0
    8000b8c4:	e98080e7          	jalr	-360(ra) # 8000b758 <_ZN5Pager3mapEPvS0_12PMTEntryBits>
        tmp += PMT::PAGE_SIZE;    
    8000b8c8:	000017b7          	lui	a5,0x1
    8000b8cc:	00f484b3          	add	s1,s1,a5
    while(tmp < uend){
    8000b8d0:	fddff06f          	j	8000b8ac <_ZN5Pager6id_mapEPvS0_12PMTEntryBits+0x34>
    }

    return 0;
}
    8000b8d4:	00000513          	li	a0,0
    8000b8d8:	02813083          	ld	ra,40(sp)
    8000b8dc:	02013403          	ld	s0,32(sp)
    8000b8e0:	01813483          	ld	s1,24(sp)
    8000b8e4:	01013903          	ld	s2,16(sp)
    8000b8e8:	00813983          	ld	s3,8(sp)
    8000b8ec:	00013a03          	ld	s4,0(sp)
    8000b8f0:	03010113          	addi	sp,sp,48
    8000b8f4:	00008067          	ret

000000008000b8f8 <_ZN5Pager10map_kernelEv>:

int Pager::map_kernel(){
    8000b8f8:	fe010113          	addi	sp,sp,-32
    8000b8fc:	00113c23          	sd	ra,24(sp)
    8000b900:	00813823          	sd	s0,16(sp)
    8000b904:	00913423          	sd	s1,8(sp)
    8000b908:	02010413          	addi	s0,sp,32
    8000b90c:	00050493          	mv	s1,a0
    uint64 laa = (uint64)NoAlloc::getEndAddress();
    //int64 laa = (uint64)HEAP_END_ADDR;
    uint64 fa = KERNEL_TEXT_START;
    
    //map_ram
    id_map((void*)fa, (void*)laa, (PMTEntryBits)
    8000b910:	00e00693          	li	a3,14
    8000b914:	0000a797          	auipc	a5,0xa
    8000b918:	acc78793          	addi	a5,a5,-1332 # 800153e0 <_ZN7NoAlloc16NOALLOC_END_ADDRE>
    8000b91c:	0007b603          	ld	a2,0(a5)
    8000b920:	ffff8797          	auipc	a5,0xffff8
    8000b924:	6f478793          	addi	a5,a5,1780 # 80004014 <KERNEL_TEXT_START>
    8000b928:	0007b583          	ld	a1,0(a5)
    8000b92c:	00000097          	auipc	ra,0x0
    8000b930:	f4c080e7          	jalr	-180(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
            (PMTEntryBits::write | PMTEntryBits::read | PMTEntryBits::execute ));

    // UART
	id_map((void*)0x10000000,
    8000b934:	00600693          	li	a3,6
    8000b938:	10000637          	lui	a2,0x10000
    8000b93c:	10060613          	addi	a2,a2,256 # 10000100 <_entry-0x6fffff00>
    8000b940:	100005b7          	lui	a1,0x10000
    8000b944:	00048513          	mv	a0,s1
    8000b948:	00000097          	auipc	ra,0x0
    8000b94c:	f30080e7          	jalr	-208(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
	//             (void*)0x0200ffff,
	//             (PMTEntryBits)
    //             (PMTEntryBits::write | PMTEntryBits::read)
	// );
	// PLIC
	id_map(
    8000b950:	00600693          	li	a3,6
    8000b954:	0c002637          	lui	a2,0xc002
    8000b958:	00160613          	addi	a2,a2,1 # c002001 <_entry-0x73ffdfff>
    8000b95c:	0c0005b7          	lui	a1,0xc000
    8000b960:	00048513          	mv	a0,s1
    8000b964:	00000097          	auipc	ra,0x0
    8000b968:	f14080e7          	jalr	-236(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
	            (void*)0x0c000000,
	            (void*)0x0c002001,
	            (PMTEntryBits)
                (PMTEntryBits::write | PMTEntryBits::read )
	);
	id_map(
    8000b96c:	00600693          	li	a3,6
    8000b970:	0c208637          	lui	a2,0xc208
    8000b974:	00160613          	addi	a2,a2,1 # c208001 <_entry-0x73df7fff>
    8000b978:	0c2005b7          	lui	a1,0xc200
    8000b97c:	00048513          	mv	a0,s1
    8000b980:	00000097          	auipc	ra,0x0
    8000b984:	ef8080e7          	jalr	-264(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (PMTEntryBits::write | PMTEntryBits::read )
	);


    return 0;        
}
    8000b988:	00000513          	li	a0,0
    8000b98c:	01813083          	ld	ra,24(sp)
    8000b990:	01013403          	ld	s0,16(sp)
    8000b994:	00813483          	ld	s1,8(sp)
    8000b998:	02010113          	addi	sp,sp,32
    8000b99c:	00008067          	ret

000000008000b9a0 <_ZN5Pager8map_userEv>:

int Pager::map_user(){
    8000b9a0:	fe010113          	addi	sp,sp,-32
    8000b9a4:	00113c23          	sd	ra,24(sp)
    8000b9a8:	00813823          	sd	s0,16(sp)
    8000b9ac:	00913423          	sd	s1,8(sp)
    8000b9b0:	02010413          	addi	s0,sp,32
    8000b9b4:	00050493          	mv	s1,a0
    id_map(
    8000b9b8:	01a00693          	li	a3,26
    8000b9bc:	ffff8797          	auipc	a5,0xffff8
    8000b9c0:	67078793          	addi	a5,a5,1648 # 8000402c <USER_TEXT_END>
    8000b9c4:	0007b603          	ld	a2,0(a5)
    8000b9c8:	ffff8797          	auipc	a5,0xffff8
    8000b9cc:	65c78793          	addi	a5,a5,1628 # 80004024 <USER_TEXT_START>
    8000b9d0:	0007b583          	ld	a1,0(a5)
    8000b9d4:	00000097          	auipc	ra,0x0
    8000b9d8:	ea4080e7          	jalr	-348(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_TEXT_START,
                (void*)USER_TEXT_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::execute | PMTEntryBits::user)
    );

    id_map(
    8000b9dc:	01600693          	li	a3,22
    8000b9e0:	ffff8797          	auipc	a5,0xffff8
    8000b9e4:	65c78793          	addi	a5,a5,1628 # 8000403c <USER_BSS_END>
    8000b9e8:	0007b603          	ld	a2,0(a5)
    8000b9ec:	ffff8797          	auipc	a5,0xffff8
    8000b9f0:	64878793          	addi	a5,a5,1608 # 80004034 <USER_BSS_START>
    8000b9f4:	0007b583          	ld	a1,0(a5)
    8000b9f8:	00048513          	mv	a0,s1
    8000b9fc:	00000097          	auipc	ra,0x0
    8000ba00:	e7c080e7          	jalr	-388(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_BSS_START,
                (void*)USER_BSS_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
    8000ba04:	01600693          	li	a3,22
    8000ba08:	ffff8797          	auipc	a5,0xffff8
    8000ba0c:	64478793          	addi	a5,a5,1604 # 8000404c <USER_DATA_END>
    8000ba10:	0007b603          	ld	a2,0(a5)
    8000ba14:	ffff8797          	auipc	a5,0xffff8
    8000ba18:	63078793          	addi	a5,a5,1584 # 80004044 <USER_DATA_START>
    8000ba1c:	0007b583          	ld	a1,0(a5)
    8000ba20:	00048513          	mv	a0,s1
    8000ba24:	00000097          	auipc	ra,0x0
    8000ba28:	e54080e7          	jalr	-428(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_DATA_START,
                (void*)USER_DATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
    8000ba2c:	01200693          	li	a3,18
    8000ba30:	ffff8797          	auipc	a5,0xffff8
    8000ba34:	62c78793          	addi	a5,a5,1580 # 8000405c <USER_RODATA_END>
    8000ba38:	0007b603          	ld	a2,0(a5)
    8000ba3c:	ffff8797          	auipc	a5,0xffff8
    8000ba40:	61878793          	addi	a5,a5,1560 # 80004054 <USER_RODATA_START>
    8000ba44:	0007b583          	ld	a1,0(a5)
    8000ba48:	00048513          	mv	a0,s1
    8000ba4c:	00000097          	auipc	ra,0x0
    8000ba50:	e2c080e7          	jalr	-468(ra) # 8000b878 <_ZN5Pager6id_mapEPvS0_12PMTEntryBits>
                (void*)USER_RODATA_START,
                (void*)USER_RODATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::user)
    );
    return 0;
}
    8000ba54:	00000513          	li	a0,0
    8000ba58:	01813083          	ld	ra,24(sp)
    8000ba5c:	01013403          	ld	s0,16(sp)
    8000ba60:	00813483          	ld	s1,8(sp)
    8000ba64:	02010113          	addi	sp,sp,32
    8000ba68:	00008067          	ret

000000008000ba6c <_ZN5Pager12start_pagingEv>:

int Pager::start_paging(){
    8000ba6c:	ff010113          	addi	sp,sp,-16
    8000ba70:	00813423          	sd	s0,8(sp)
    8000ba74:	01010413          	addi	s0,sp,16
    if(!pmt)
    8000ba78:	00053783          	ld	a5,0(a0)
    8000ba7c:	02078863          	beqz	a5,8000baac <_ZN5Pager12start_pagingEv+0x40>
        return 1;
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    uint64 satp = (8ULL << 60) | ( (uint64)pmt >> 12);
    8000ba80:	00c7d793          	srli	a5,a5,0xc
    8000ba84:	fff00713          	li	a4,-1
    8000ba88:	03f71713          	slli	a4,a4,0x3f
    8000ba8c:	00e7e7b3          	or	a5,a5,a4
    static void* NOALLOC_END_ADDR; 
public:
    static void init(); /* set NOALLOC END ADDR = HEAP START ADDR */
    static void* getEndAddress(){ return NOALLOC_END_ADDR; } /* get end address of allocated objects by this allocator */
    static void* mem_alloc(size_t); /* allocate */
    static void turn_off() { working = false; }
    8000ba90:	0000a717          	auipc	a4,0xa
    8000ba94:	94070423          	sb	zero,-1720(a4) # 800153d8 <_ZN7NoAlloc7workingE>
    NoAlloc::turn_off();
    asm volatile("csrw satp, %0" : : "r" (satp));
    8000ba98:	18079073          	csrw	satp,a5
    return 0;
    8000ba9c:	00000513          	li	a0,0
}
    8000baa0:	00813403          	ld	s0,8(sp)
    8000baa4:	01010113          	addi	sp,sp,16
    8000baa8:	00008067          	ret
        return 1;
    8000baac:	00100513          	li	a0,1
    8000bab0:	ff1ff06f          	j	8000baa0 <_ZN5Pager12start_pagingEv+0x34>

000000008000bab4 <_ZN5Pager5printEv>:

void Pager::print(){
    8000bab4:	fc010113          	addi	sp,sp,-64
    8000bab8:	02113c23          	sd	ra,56(sp)
    8000babc:	02813823          	sd	s0,48(sp)
    8000bac0:	02913423          	sd	s1,40(sp)
    8000bac4:	03213023          	sd	s2,32(sp)
    8000bac8:	01313c23          	sd	s3,24(sp)
    8000bacc:	01413823          	sd	s4,16(sp)
    8000bad0:	01513423          	sd	s5,8(sp)
    8000bad4:	01613023          	sd	s6,0(sp)
    8000bad8:	04010413          	addi	s0,sp,64
    int t = 0;
    if(pmt){
    8000badc:	00053783          	ld	a5,0(a0)
    8000bae0:	16078263          	beqz	a5,8000bc44 <_ZN5Pager5printEv+0x190>
    8000bae4:	00050b13          	mv	s6,a0
        t++;
        kprintString("--------LEVEL 0--------\n");
    8000bae8:	00004517          	auipc	a0,0x4
    8000baec:	6c850513          	addi	a0,a0,1736 # 800101b0 <_ZL11CACHE_NAMES+0x5f0>
    8000baf0:	ffff9097          	auipc	ra,0xffff9
    8000baf4:	5b4080e7          	jalr	1460(ra) # 800050a4 <_Z12kprintStringPKc>
        pmt->print();
    8000baf8:	000b3503          	ld	a0,0(s6)
    8000bafc:	00000097          	auipc	ra,0x0
    8000bb00:	52c080e7          	jalr	1324(ra) # 8000c028 <_ZN3PMT5printEv>
        for(size_t i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000bb04:	00000a93          	li	s5,0
        t++;
    8000bb08:	00100a13          	li	s4,1
    8000bb0c:	0a00006f          	j	8000bbac <_ZN5Pager5printEv+0xf8>
                pmt1->print();
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
                    PMTEntry* en1 = pmt1->get_entry(i);

                    if(en1->chk_flags(PMTEntryBits::valid)){
                        t++;
    8000bb10:	001a0a1b          	addiw	s4,s4,1
                        PMT* pmt2 = (PMT*)en1->get_pa();
    8000bb14:	00090513          	mv	a0,s2
    8000bb18:	00000097          	auipc	ra,0x0
    8000bb1c:	31c080e7          	jalr	796(ra) # 8000be34 <_ZN8PMTEntry6get_paEv>
    8000bb20:	00050913          	mv	s2,a0
                        kprintString("--------LEVEL 2--------\n");
    8000bb24:	00004517          	auipc	a0,0x4
    8000bb28:	6d450513          	addi	a0,a0,1748 # 800101f8 <_ZL11CACHE_NAMES+0x638>
    8000bb2c:	ffff9097          	auipc	ra,0xffff9
    8000bb30:	578080e7          	jalr	1400(ra) # 800050a4 <_Z12kprintStringPKc>
                        KCHECKPRINT(pmt2);
    8000bb34:	00004517          	auipc	a0,0x4
    8000bb38:	6e450513          	addi	a0,a0,1764 # 80010218 <_ZL11CACHE_NAMES+0x658>
    8000bb3c:	ffff9097          	auipc	ra,0xffff9
    8000bb40:	568080e7          	jalr	1384(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bb44:	00000613          	li	a2,0
    8000bb48:	01000593          	li	a1,16
    8000bb4c:	00090513          	mv	a0,s2
    8000bb50:	ffff9097          	auipc	ra,0xffff9
    8000bb54:	59c080e7          	jalr	1436(ra) # 800050ec <_Z9kprintIntmib>
    8000bb58:	00004517          	auipc	a0,0x4
    8000bb5c:	80050513          	addi	a0,a0,-2048 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bb60:	ffff9097          	auipc	ra,0xffff9
    8000bb64:	544080e7          	jalr	1348(ra) # 800050a4 <_Z12kprintStringPKc>
                        pmt2->print();
    8000bb68:	00090513          	mv	a0,s2
    8000bb6c:	00000097          	auipc	ra,0x0
    8000bb70:	4bc080e7          	jalr	1212(ra) # 8000c028 <_ZN3PMT5printEv>
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000bb74:	00148493          	addi	s1,s1,1 # fffffffffffff001 <_user_bss_end+0xffffffff7ffe7ff1>
    8000bb78:	1ff00793          	li	a5,511
    8000bb7c:	0297e663          	bltu	a5,s1,8000bba8 <_ZN5Pager5printEv+0xf4>
                    PMTEntry* en1 = pmt1->get_entry(i);
    8000bb80:	00048593          	mv	a1,s1
    8000bb84:	00098513          	mv	a0,s3
    8000bb88:	00000097          	auipc	ra,0x0
    8000bb8c:	3b0080e7          	jalr	944(ra) # 8000bf38 <_ZN3PMT9get_entryEm>
    8000bb90:	00050913          	mv	s2,a0
                    if(en1->chk_flags(PMTEntryBits::valid)){
    8000bb94:	00100593          	li	a1,1
    8000bb98:	00000097          	auipc	ra,0x0
    8000bb9c:	304080e7          	jalr	772(ra) # 8000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000bba0:	fc050ae3          	beqz	a0,8000bb74 <_ZN5Pager5printEv+0xc0>
    8000bba4:	f6dff06f          	j	8000bb10 <_ZN5Pager5printEv+0x5c>
        for(size_t i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000bba8:	001a8a93          	addi	s5,s5,1
    8000bbac:	1ff00793          	li	a5,511
    8000bbb0:	0957ec63          	bltu	a5,s5,8000bc48 <_ZN5Pager5printEv+0x194>
            PMTEntry* en = pmt->get_entry(i);
    8000bbb4:	000a8593          	mv	a1,s5
    8000bbb8:	000b3503          	ld	a0,0(s6)
    8000bbbc:	00000097          	auipc	ra,0x0
    8000bbc0:	37c080e7          	jalr	892(ra) # 8000bf38 <_ZN3PMT9get_entryEm>
    8000bbc4:	00050493          	mv	s1,a0
            if(en->chk_flags(PMTEntryBits::valid)){
    8000bbc8:	00100593          	li	a1,1
    8000bbcc:	00000097          	auipc	ra,0x0
    8000bbd0:	2d0080e7          	jalr	720(ra) # 8000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000bbd4:	fc050ae3          	beqz	a0,8000bba8 <_ZN5Pager5printEv+0xf4>
                t++;
    8000bbd8:	001a0a1b          	addiw	s4,s4,1
                PMT* pmt1 = (PMT*)en->get_pa();
    8000bbdc:	00048513          	mv	a0,s1
    8000bbe0:	00000097          	auipc	ra,0x0
    8000bbe4:	254080e7          	jalr	596(ra) # 8000be34 <_ZN8PMTEntry6get_paEv>
    8000bbe8:	00050993          	mv	s3,a0
                kprintString("--------LEVEL 1--------\n");
    8000bbec:	00004517          	auipc	a0,0x4
    8000bbf0:	5e450513          	addi	a0,a0,1508 # 800101d0 <_ZL11CACHE_NAMES+0x610>
    8000bbf4:	ffff9097          	auipc	ra,0xffff9
    8000bbf8:	4b0080e7          	jalr	1200(ra) # 800050a4 <_Z12kprintStringPKc>
                KCHECKPRINT(pmt1);
    8000bbfc:	00004517          	auipc	a0,0x4
    8000bc00:	5f450513          	addi	a0,a0,1524 # 800101f0 <_ZL11CACHE_NAMES+0x630>
    8000bc04:	ffff9097          	auipc	ra,0xffff9
    8000bc08:	4a0080e7          	jalr	1184(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bc0c:	00000613          	li	a2,0
    8000bc10:	01000593          	li	a1,16
    8000bc14:	00098513          	mv	a0,s3
    8000bc18:	ffff9097          	auipc	ra,0xffff9
    8000bc1c:	4d4080e7          	jalr	1236(ra) # 800050ec <_Z9kprintIntmib>
    8000bc20:	00003517          	auipc	a0,0x3
    8000bc24:	73850513          	addi	a0,a0,1848 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bc28:	ffff9097          	auipc	ra,0xffff9
    8000bc2c:	47c080e7          	jalr	1148(ra) # 800050a4 <_Z12kprintStringPKc>
                pmt1->print();
    8000bc30:	00098513          	mv	a0,s3
    8000bc34:	00000097          	auipc	ra,0x0
    8000bc38:	3f4080e7          	jalr	1012(ra) # 8000c028 <_ZN3PMT5printEv>
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
    8000bc3c:	00000493          	li	s1,0
    8000bc40:	f39ff06f          	j	8000bb78 <_ZN5Pager5printEv+0xc4>
    int t = 0;
    8000bc44:	00000a13          	li	s4,0
                }
            }
            
        }
    }
    kprintString("page_table_num: "); kprintInt(t); kprintString("\n");
    8000bc48:	00004517          	auipc	a0,0x4
    8000bc4c:	5d850513          	addi	a0,a0,1496 # 80010220 <_ZL11CACHE_NAMES+0x660>
    8000bc50:	ffff9097          	auipc	ra,0xffff9
    8000bc54:	454080e7          	jalr	1108(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bc58:	00000613          	li	a2,0
    8000bc5c:	00a00593          	li	a1,10
    8000bc60:	000a0513          	mv	a0,s4
    8000bc64:	ffff9097          	auipc	ra,0xffff9
    8000bc68:	488080e7          	jalr	1160(ra) # 800050ec <_Z9kprintIntmib>
    8000bc6c:	00003517          	auipc	a0,0x3
    8000bc70:	6ec50513          	addi	a0,a0,1772 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bc74:	ffff9097          	auipc	ra,0xffff9
    8000bc78:	430080e7          	jalr	1072(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("page_table_size: "); kprintInt(sizeof(PMT)); kprintString("\n");
    8000bc7c:	00004517          	auipc	a0,0x4
    8000bc80:	5bc50513          	addi	a0,a0,1468 # 80010238 <_ZL11CACHE_NAMES+0x678>
    8000bc84:	ffff9097          	auipc	ra,0xffff9
    8000bc88:	420080e7          	jalr	1056(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bc8c:	00000613          	li	a2,0
    8000bc90:	00a00593          	li	a1,10
    8000bc94:	00001537          	lui	a0,0x1
    8000bc98:	ffff9097          	auipc	ra,0xffff9
    8000bc9c:	454080e7          	jalr	1108(ra) # 800050ec <_Z9kprintIntmib>
    8000bca0:	00003517          	auipc	a0,0x3
    8000bca4:	6b850513          	addi	a0,a0,1720 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bca8:	ffff9097          	auipc	ra,0xffff9
    8000bcac:	3fc080e7          	jalr	1020(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("page_table_buddy_level: "); kprintInt(BUDDY_LEVEL(sizeof(PMT))); kprintString("\n"); 
    8000bcb0:	00004517          	auipc	a0,0x4
    8000bcb4:	5a050513          	addi	a0,a0,1440 # 80010250 <_ZL11CACHE_NAMES+0x690>
    8000bcb8:	ffff9097          	auipc	ra,0xffff9
    8000bcbc:	3ec080e7          	jalr	1004(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bcc0:	00001537          	lui	a0,0x1
    8000bcc4:	ffffa097          	auipc	ra,0xffffa
    8000bcc8:	da0080e7          	jalr	-608(ra) # 80005a64 <_Z4log2m>
    8000bccc:	000017b7          	lui	a5,0x1
    8000bcd0:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000bcd4:	00a7d533          	srl	a0,a5,a0
    8000bcd8:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    8000bcdc:	ffffa097          	auipc	ra,0xffffa
    8000bce0:	d88080e7          	jalr	-632(ra) # 80005a64 <_Z4log2m>
    8000bce4:	00000613          	li	a2,0
    8000bce8:	00a00593          	li	a1,10
    8000bcec:	ffff9097          	auipc	ra,0xffff9
    8000bcf0:	400080e7          	jalr	1024(ra) # 800050ec <_Z9kprintIntmib>
    8000bcf4:	00003517          	auipc	a0,0x3
    8000bcf8:	66450513          	addi	a0,a0,1636 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bcfc:	ffff9097          	auipc	ra,0xffff9
    8000bd00:	3a8080e7          	jalr	936(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000bd04:	03813083          	ld	ra,56(sp)
    8000bd08:	03013403          	ld	s0,48(sp)
    8000bd0c:	02813483          	ld	s1,40(sp)
    8000bd10:	02013903          	ld	s2,32(sp)
    8000bd14:	01813983          	ld	s3,24(sp)
    8000bd18:	01013a03          	ld	s4,16(sp)
    8000bd1c:	00813a83          	ld	s5,8(sp)
    8000bd20:	00013b03          	ld	s6,0(sp)
    8000bd24:	04010113          	addi	sp,sp,64
    8000bd28:	00008067          	ret

000000008000bd2c <_ZN8PMTEntry5printEv>:
    PMT* ret = (PMT*)(Buddy::getInstance().mem_alloc(BUDDY_LEVEL(sizeof(PMT))));
    ret->clear();
    return ret;
}

void PMTEntry::print(){
    8000bd2c:	fe010113          	addi	sp,sp,-32
    8000bd30:	00113c23          	sd	ra,24(sp)
    8000bd34:	00813823          	sd	s0,16(sp)
    8000bd38:	00913423          	sd	s1,8(sp)
    8000bd3c:	02010413          	addi	s0,sp,32
    8000bd40:	00050493          	mv	s1,a0
    KVALCHECKPRINT(PA, (val >> 10) << 12);
    8000bd44:	00004517          	auipc	a0,0x4
    8000bd48:	54450513          	addi	a0,a0,1348 # 80010288 <_ZN3PMT10VADDR_MASKE+0x18>
    8000bd4c:	ffff9097          	auipc	ra,0xffff9
    8000bd50:	358080e7          	jalr	856(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bd54:	0004b503          	ld	a0,0(s1)
    8000bd58:	00a55513          	srli	a0,a0,0xa
    8000bd5c:	00000613          	li	a2,0
    8000bd60:	01000593          	li	a1,16
    8000bd64:	00c51513          	slli	a0,a0,0xc
    8000bd68:	ffff9097          	auipc	ra,0xffff9
    8000bd6c:	384080e7          	jalr	900(ra) # 800050ec <_Z9kprintIntmib>
    8000bd70:	00003517          	auipc	a0,0x3
    8000bd74:	5e850513          	addi	a0,a0,1512 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bd78:	ffff9097          	auipc	ra,0xffff9
    8000bd7c:	32c080e7          	jalr	812(ra) # 800050a4 <_Z12kprintStringPKc>
    kprintString("bits: "); kprintInt((val & 511ULL), 2); kprintString("\n");
    8000bd80:	00004517          	auipc	a0,0x4
    8000bd84:	51050513          	addi	a0,a0,1296 # 80010290 <_ZN3PMT10VADDR_MASKE+0x20>
    8000bd88:	ffff9097          	auipc	ra,0xffff9
    8000bd8c:	31c080e7          	jalr	796(ra) # 800050a4 <_Z12kprintStringPKc>
    8000bd90:	0004b503          	ld	a0,0(s1)
    8000bd94:	00000613          	li	a2,0
    8000bd98:	00200593          	li	a1,2
    8000bd9c:	1ff57513          	andi	a0,a0,511
    8000bda0:	ffff9097          	auipc	ra,0xffff9
    8000bda4:	34c080e7          	jalr	844(ra) # 800050ec <_Z9kprintIntmib>
    8000bda8:	00003517          	auipc	a0,0x3
    8000bdac:	5b050513          	addi	a0,a0,1456 # 8000f358 <CONSOLE_STATUS+0x348>
    8000bdb0:	ffff9097          	auipc	ra,0xffff9
    8000bdb4:	2f4080e7          	jalr	756(ra) # 800050a4 <_Z12kprintStringPKc>
}
    8000bdb8:	01813083          	ld	ra,24(sp)
    8000bdbc:	01013403          	ld	s0,16(sp)
    8000bdc0:	00813483          	ld	s1,8(sp)
    8000bdc4:	02010113          	addi	sp,sp,32
    8000bdc8:	00008067          	ret

000000008000bdcc <_ZN8PMTEntry9set_flagsE12PMTEntryBits>:

void PMTEntry::set_flags(PMTEntryBits peb){ val |= (uint64) peb; }
    8000bdcc:	ff010113          	addi	sp,sp,-16
    8000bdd0:	00813423          	sd	s0,8(sp)
    8000bdd4:	01010413          	addi	s0,sp,16
    8000bdd8:	00053783          	ld	a5,0(a0)
    8000bddc:	00b7e5b3          	or	a1,a5,a1
    8000bde0:	00b53023          	sd	a1,0(a0)
    8000bde4:	00813403          	ld	s0,8(sp)
    8000bde8:	01010113          	addi	sp,sp,16
    8000bdec:	00008067          	ret

000000008000bdf0 <_ZN8PMTEntry11clear_flagsE12PMTEntryBits>:

void PMTEntry::clear_flags(PMTEntryBits peb){ val &= ~((uint64) peb); }
    8000bdf0:	ff010113          	addi	sp,sp,-16
    8000bdf4:	00813423          	sd	s0,8(sp)
    8000bdf8:	01010413          	addi	s0,sp,16
    8000bdfc:	fff5c593          	not	a1,a1
    8000be00:	00053783          	ld	a5,0(a0)
    8000be04:	00b7f7b3          	and	a5,a5,a1
    8000be08:	00f53023          	sd	a5,0(a0)
    8000be0c:	00813403          	ld	s0,8(sp)
    8000be10:	01010113          	addi	sp,sp,16
    8000be14:	00008067          	ret

000000008000be18 <_ZN8PMTEntry5clearEv>:

void PMTEntry::clear(){ val = PMTEntryBits::clear; }
    8000be18:	ff010113          	addi	sp,sp,-16
    8000be1c:	00813423          	sd	s0,8(sp)
    8000be20:	01010413          	addi	s0,sp,16
    8000be24:	00053023          	sd	zero,0(a0)
    8000be28:	00813403          	ld	s0,8(sp)
    8000be2c:	01010113          	addi	sp,sp,16
    8000be30:	00008067          	ret

000000008000be34 <_ZN8PMTEntry6get_paEv>:

void* PMTEntry::get_pa(){
    8000be34:	ff010113          	addi	sp,sp,-16
    8000be38:	00813423          	sd	s0,8(sp)
    8000be3c:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 10;
    return (void*)((val & mask) << 2);
    8000be40:	00053783          	ld	a5,0(a0)
    8000be44:	00279793          	slli	a5,a5,0x2
}
    8000be48:	fffff537          	lui	a0,0xfffff
    8000be4c:	00a7f533          	and	a0,a5,a0
    8000be50:	00813403          	ld	s0,8(sp)
    8000be54:	01010113          	addi	sp,sp,16
    8000be58:	00008067          	ret

000000008000be5c <_ZN8PMTEntry6set_paEPv>:

int PMTEntry::set_pa(void* pa){
    8000be5c:	ff010113          	addi	sp,sp,-16
    8000be60:	00813423          	sd	s0,8(sp)
    8000be64:	01010413          	addi	s0,sp,16
    uint64 mask = (~0ULL) << 12, 
    uipa = (uint64) pa; //uint phisical address
    
    if( (mask & uipa) != uipa )
    8000be68:	03459793          	slli	a5,a1,0x34
    8000be6c:	02079463          	bnez	a5,8000be94 <_ZN8PMTEntry6set_paEPv+0x38>
        return -1; //exception
    
    mask = ~((~0ULL) << 10);
    val &= mask;
    8000be70:	00053783          	ld	a5,0(a0) # fffffffffffff000 <_user_bss_end+0xffffffff7ffe7ff0>
    8000be74:	3ff7f793          	andi	a5,a5,1023
    val |= (uipa >> 2); 
    8000be78:	0025d593          	srli	a1,a1,0x2
    8000be7c:	00b7e7b3          	or	a5,a5,a1
    8000be80:	00f53023          	sd	a5,0(a0)
    return 0;
    8000be84:	00000513          	li	a0,0
}
    8000be88:	00813403          	ld	s0,8(sp)
    8000be8c:	01010113          	addi	sp,sp,16
    8000be90:	00008067          	ret
        return -1; //exception
    8000be94:	fff00513          	li	a0,-1
    8000be98:	ff1ff06f          	j	8000be88 <_ZN8PMTEntry6set_paEPv+0x2c>

000000008000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>:

bool PMTEntry::chk_flags(PMTEntryBits peb){
    8000be9c:	ff010113          	addi	sp,sp,-16
    8000bea0:	00813423          	sd	s0,8(sp)
    8000bea4:	01010413          	addi	s0,sp,16
    uint64 t = val & peb;
    8000bea8:	00053503          	ld	a0,0(a0)
    8000beac:	00b57533          	and	a0,a0,a1
    return t == peb;
    8000beb0:	40a58533          	sub	a0,a1,a0
}
    8000beb4:	00153513          	seqz	a0,a0
    8000beb8:	00813403          	ld	s0,8(sp)
    8000bebc:	01010113          	addi	sp,sp,16
    8000bec0:	00008067          	ret

000000008000bec4 <_ZN3PMT9get_entryEhPv>:

PMTEntry* PMT::get_entry(uchar level, void *vaddr){
    8000bec4:	ff010113          	addi	sp,sp,-16
    8000bec8:	00813423          	sd	s0,8(sp)
    8000becc:	01010413          	addi	s0,sp,16
    if(level >= 3) return nullptr;
    8000bed0:	00200793          	li	a5,2
    8000bed4:	04b7ea63          	bltu	a5,a1,8000bf28 <_ZN3PMT9get_entryEhPv+0x64>
    if(INVALID_MASK & (size_t)vaddr) return nullptr;
    8000bed8:	fff00793          	li	a5,-1
    8000bedc:	02779793          	slli	a5,a5,0x27
    8000bee0:	00f677b3          	and	a5,a2,a5
    8000bee4:	04079663          	bnez	a5,8000bf30 <_ZN3PMT9get_entryEhPv+0x6c>
    
    return entry + 
    ( ((uint64)(vaddr) & VADDR_MASK[level]) >> (12 + 9*level) );
    8000bee8:	0005859b          	sext.w	a1,a1
    8000beec:	00359713          	slli	a4,a1,0x3
    8000bef0:	00004797          	auipc	a5,0x4
    8000bef4:	38078793          	addi	a5,a5,896 # 80010270 <_ZN3PMT10VADDR_MASKE>
    8000bef8:	00e787b3          	add	a5,a5,a4
    8000befc:	0007b783          	ld	a5,0(a5)
    8000bf00:	00f67633          	and	a2,a2,a5
    8000bf04:	0035979b          	slliw	a5,a1,0x3
    8000bf08:	00b785bb          	addw	a1,a5,a1
    8000bf0c:	00c58593          	addi	a1,a1,12 # c20000c <_entry-0x73dffff4>
    8000bf10:	00b65633          	srl	a2,a2,a1
    return entry + 
    8000bf14:	00361613          	slli	a2,a2,0x3
    ( ((uint64)(vaddr) & VADDR_MASK[level]) >> (12 + 9*level) );
    8000bf18:	00c50533          	add	a0,a0,a2
}
    8000bf1c:	00813403          	ld	s0,8(sp)
    8000bf20:	01010113          	addi	sp,sp,16
    8000bf24:	00008067          	ret
    if(level >= 3) return nullptr;
    8000bf28:	00000513          	li	a0,0
    8000bf2c:	ff1ff06f          	j	8000bf1c <_ZN3PMT9get_entryEhPv+0x58>
    if(INVALID_MASK & (size_t)vaddr) return nullptr;
    8000bf30:	00000513          	li	a0,0
    8000bf34:	fe9ff06f          	j	8000bf1c <_ZN3PMT9get_entryEhPv+0x58>

000000008000bf38 <_ZN3PMT9get_entryEm>:

PMTEntry* PMT::get_entry(uint64 index){
    8000bf38:	ff010113          	addi	sp,sp,-16
    8000bf3c:	00813423          	sd	s0,8(sp)
    8000bf40:	01010413          	addi	s0,sp,16
    return entry + index;
    8000bf44:	00359593          	slli	a1,a1,0x3

}
    8000bf48:	00b50533          	add	a0,a0,a1
    8000bf4c:	00813403          	ld	s0,8(sp)
    8000bf50:	01010113          	addi	sp,sp,16
    8000bf54:	00008067          	ret

000000008000bf58 <_ZN3PMT5clearEv>:


void PMT::clear(){
    8000bf58:	fe010113          	addi	sp,sp,-32
    8000bf5c:	00113c23          	sd	ra,24(sp)
    8000bf60:	00813823          	sd	s0,16(sp)
    8000bf64:	00913423          	sd	s1,8(sp)
    8000bf68:	01213023          	sd	s2,0(sp)
    8000bf6c:	02010413          	addi	s0,sp,32
    8000bf70:	00050913          	mv	s2,a0
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++)
    8000bf74:	00000493          	li	s1,0
    8000bf78:	1ff00793          	li	a5,511
    8000bf7c:	0097ee63          	bltu	a5,s1,8000bf98 <_ZN3PMT5clearEv+0x40>
        entry[i].clear();
    8000bf80:	00349513          	slli	a0,s1,0x3
    8000bf84:	00a90533          	add	a0,s2,a0
    8000bf88:	00000097          	auipc	ra,0x0
    8000bf8c:	e90080e7          	jalr	-368(ra) # 8000be18 <_ZN8PMTEntry5clearEv>
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++)
    8000bf90:	00148493          	addi	s1,s1,1
    8000bf94:	fe5ff06f          	j	8000bf78 <_ZN3PMT5clearEv+0x20>
}
    8000bf98:	01813083          	ld	ra,24(sp)
    8000bf9c:	01013403          	ld	s0,16(sp)
    8000bfa0:	00813483          	ld	s1,8(sp)
    8000bfa4:	00013903          	ld	s2,0(sp)
    8000bfa8:	02010113          	addi	sp,sp,32
    8000bfac:	00008067          	ret

000000008000bfb0 <_ZN3PMT12allocate_pmtEv>:
PMT* PMT::allocate_pmt(){
    8000bfb0:	fe010113          	addi	sp,sp,-32
    8000bfb4:	00113c23          	sd	ra,24(sp)
    8000bfb8:	00813823          	sd	s0,16(sp)
    8000bfbc:	00913423          	sd	s1,8(sp)
    8000bfc0:	02010413          	addi	s0,sp,32
    PMT* ret = (PMT*)(Buddy::getInstance().mem_alloc(BUDDY_LEVEL(sizeof(PMT))));
    8000bfc4:	ffffb097          	auipc	ra,0xffffb
    8000bfc8:	934080e7          	jalr	-1740(ra) # 800068f8 <_ZN5Buddy11getInstanceEv>
    8000bfcc:	00050493          	mv	s1,a0
    8000bfd0:	00001537          	lui	a0,0x1
    8000bfd4:	ffffa097          	auipc	ra,0xffffa
    8000bfd8:	a90080e7          	jalr	-1392(ra) # 80005a64 <_Z4log2m>
    8000bfdc:	000017b7          	lui	a5,0x1
    8000bfe0:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000bfe4:	00a7d533          	srl	a0,a5,a0
    8000bfe8:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    8000bfec:	ffffa097          	auipc	ra,0xffffa
    8000bff0:	a78080e7          	jalr	-1416(ra) # 80005a64 <_Z4log2m>
    8000bff4:	00050593          	mv	a1,a0
    8000bff8:	00048513          	mv	a0,s1
    8000bffc:	ffffb097          	auipc	ra,0xffffb
    8000c000:	e78080e7          	jalr	-392(ra) # 80006e74 <_ZN5Buddy9mem_allocEh>
    8000c004:	00050493          	mv	s1,a0
    ret->clear();
    8000c008:	00000097          	auipc	ra,0x0
    8000c00c:	f50080e7          	jalr	-176(ra) # 8000bf58 <_ZN3PMT5clearEv>
}
    8000c010:	00048513          	mv	a0,s1
    8000c014:	01813083          	ld	ra,24(sp)
    8000c018:	01013403          	ld	s0,16(sp)
    8000c01c:	00813483          	ld	s1,8(sp)
    8000c020:	02010113          	addi	sp,sp,32
    8000c024:	00008067          	ret

000000008000c028 <_ZN3PMT5printEv>:

void PMT::print(){
    8000c028:	fd010113          	addi	sp,sp,-48
    8000c02c:	02113423          	sd	ra,40(sp)
    8000c030:	02813023          	sd	s0,32(sp)
    8000c034:	00913c23          	sd	s1,24(sp)
    8000c038:	01213823          	sd	s2,16(sp)
    8000c03c:	01313423          	sd	s3,8(sp)
    8000c040:	03010413          	addi	s0,sp,48
    8000c044:	00050993          	mv	s3,a0
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++){
    8000c048:	00000913          	li	s2,0
    8000c04c:	0780006f          	j	8000c0c4 <_ZN3PMT5printEv+0x9c>
        if(entry[i].chk_flags(PMTEntryBits::valid)){
            KPRINTARR(entry, i, entry[i].chk_flags(PMTEntryBits::valid));
    8000c050:	00004517          	auipc	a0,0x4
    8000c054:	24850513          	addi	a0,a0,584 # 80010298 <_ZN3PMT10VADDR_MASKE+0x28>
    8000c058:	ffff9097          	auipc	ra,0xffff9
    8000c05c:	04c080e7          	jalr	76(ra) # 800050a4 <_Z12kprintStringPKc>
    8000c060:	00000613          	li	a2,0
    8000c064:	00a00593          	li	a1,10
    8000c068:	00090513          	mv	a0,s2
    8000c06c:	ffff9097          	auipc	ra,0xffff9
    8000c070:	080080e7          	jalr	128(ra) # 800050ec <_Z9kprintIntmib>
    8000c074:	00003517          	auipc	a0,0x3
    8000c078:	4b450513          	addi	a0,a0,1204 # 8000f528 <CONSOLE_STATUS+0x518>
    8000c07c:	ffff9097          	auipc	ra,0xffff9
    8000c080:	028080e7          	jalr	40(ra) # 800050a4 <_Z12kprintStringPKc>
    8000c084:	00100593          	li	a1,1
    8000c088:	00048513          	mv	a0,s1
    8000c08c:	00000097          	auipc	ra,0x0
    8000c090:	e10080e7          	jalr	-496(ra) # 8000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000c094:	00000613          	li	a2,0
    8000c098:	01000593          	li	a1,16
    8000c09c:	ffff9097          	auipc	ra,0xffff9
    8000c0a0:	050080e7          	jalr	80(ra) # 800050ec <_Z9kprintIntmib>
    8000c0a4:	00003517          	auipc	a0,0x3
    8000c0a8:	2b450513          	addi	a0,a0,692 # 8000f358 <CONSOLE_STATUS+0x348>
    8000c0ac:	ffff9097          	auipc	ra,0xffff9
    8000c0b0:	ff8080e7          	jalr	-8(ra) # 800050a4 <_Z12kprintStringPKc>
            entry[i].print();
    8000c0b4:	00048513          	mv	a0,s1
    8000c0b8:	00000097          	auipc	ra,0x0
    8000c0bc:	c74080e7          	jalr	-908(ra) # 8000bd2c <_ZN8PMTEntry5printEv>
    for(uint64 i = 0; i < PMT_LEVEL_SIZE; i++){
    8000c0c0:	00190913          	addi	s2,s2,1
    8000c0c4:	1ff00793          	li	a5,511
    8000c0c8:	0327e263          	bltu	a5,s2,8000c0ec <_ZN3PMT5printEv+0xc4>
        if(entry[i].chk_flags(PMTEntryBits::valid)){
    8000c0cc:	00391493          	slli	s1,s2,0x3
    8000c0d0:	009984b3          	add	s1,s3,s1
    8000c0d4:	00100593          	li	a1,1
    8000c0d8:	00048513          	mv	a0,s1
    8000c0dc:	00000097          	auipc	ra,0x0
    8000c0e0:	dc0080e7          	jalr	-576(ra) # 8000be9c <_ZN8PMTEntry9chk_flagsE12PMTEntryBits>
    8000c0e4:	fc050ee3          	beqz	a0,8000c0c0 <_ZN3PMT5printEv+0x98>
    8000c0e8:	f69ff06f          	j	8000c050 <_ZN3PMT5printEv+0x28>
        }
    }
    8000c0ec:	02813083          	ld	ra,40(sp)
    8000c0f0:	02013403          	ld	s0,32(sp)
    8000c0f4:	01813483          	ld	s1,24(sp)
    8000c0f8:	01013903          	ld	s2,16(sp)
    8000c0fc:	00813983          	ld	s3,8(sp)
    8000c100:	03010113          	addi	sp,sp,48
    8000c104:	00008067          	ret

000000008000c108 <_kernel_text_end>:
	...

000000008000d000 <_user_text_start>:

.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
    8000d000:	100522af          	lr.w	t0,(a0)
bne t0, a1, fail       # Doesn’t match, so fail.
    8000d004:	00b29a63          	bne	t0,a1,8000d018 <fail>
sc.w t0, a2, (a0)      # Try to update.
    8000d008:	18c522af          	sc.w	t0,a2,(a0)
bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000d00c:	fe029ae3          	bnez	t0,8000d000 <_user_text_start>
li a0, 0               # Set return to success.
    8000d010:	00000513          	li	a0,0
jr ra                  # Return.
    8000d014:	00008067          	ret

000000008000d018 <fail>:
fail:
li a0, 1               # Set return to failure.
    8000d018:	00100513          	li	a0,1

000000008000d01c <thread_delete>:
#include"../../h/_thread.h"
#include"../../h/_semaphore.h"


extern "C" int thread_delete(void* addr)
{
    8000d01c:	ff010113          	addi	sp,sp,-16
    8000d020:	00813423          	sd	s0,8(sp)
    8000d024:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("mv a1, %0" : : "r" (addr));
    8000d028:	00050593          	mv	a1,a0
    asm volatile("mv a0, %0" : : "r" (0x69));
    8000d02c:	06900793          	li	a5,105
    8000d030:	00078513          	mv	a0,a5
    asm volatile("ecall");
    8000d034:	00000073          	ecall

    return ret;
}
    8000d038:	00000513          	li	a0,0
    8000d03c:	00813403          	ld	s0,8(sp)
    8000d040:	01010113          	addi	sp,sp,16
    8000d044:	00008067          	ret

000000008000d048 <_ZN7_threaddlEPv>:


void _thread::operator delete(void* ptr){
    8000d048:	ff010113          	addi	sp,sp,-16
    8000d04c:	00113423          	sd	ra,8(sp)
    8000d050:	00813023          	sd	s0,0(sp)
    8000d054:	01010413          	addi	s0,sp,16
    thread_delete(ptr);
    8000d058:	00000097          	auipc	ra,0x0
    8000d05c:	fc4080e7          	jalr	-60(ra) # 8000d01c <thread_delete>
}
    8000d060:	00813083          	ld	ra,8(sp)
    8000d064:	00013403          	ld	s0,0(sp)
    8000d068:	01010113          	addi	sp,sp,16
    8000d06c:	00008067          	ret

000000008000d070 <mem_alloc>:



extern "C" void* mem_alloc(size_t size)
{
    8000d070:	ff010113          	addi	sp,sp,-16
    8000d074:	00813423          	sd	s0,8(sp)
    8000d078:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    8000d07c:	fff50513          	addi	a0,a0,-1
    8000d080:	00655513          	srli	a0,a0,0x6
    8000d084:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    8000d088:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    8000d08c:	00100793          	li	a5,1
    8000d090:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000d094:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    8000d098:	00050513          	mv	a0,a0
    
    return adr;  
}
    8000d09c:	00813403          	ld	s0,8(sp)
    8000d0a0:	01010113          	addi	sp,sp,16
    8000d0a4:	00008067          	ret

000000008000d0a8 <mem_free>:

extern "C" int mem_free (void* adr)
{
    8000d0a8:	ff010113          	addi	sp,sp,-16
    8000d0ac:	00813423          	sd	s0,8(sp)
    8000d0b0:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    8000d0b4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    8000d0b8:	00200793          	li	a5,2
    8000d0bc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000d0c0:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000d0c4:	00050513          	mv	a0,a0
    
    return ret;
}
    8000d0c8:	0005051b          	sext.w	a0,a0
    8000d0cc:	00813403          	ld	s0,8(sp)
    8000d0d0:	01010113          	addi	sp,sp,16
    8000d0d4:	00008067          	ret

000000008000d0d8 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    8000d0d8:	ff010113          	addi	sp,sp,-16
    8000d0dc:	00813423          	sd	s0,8(sp)
    8000d0e0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    8000d0e4:	01300793          	li	a5,19
    8000d0e8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000d0ec:	00000073          	ecall
}
    8000d0f0:	00813403          	ld	s0,8(sp)
    8000d0f4:	01010113          	addi	sp,sp,16
    8000d0f8:	00008067          	ret

000000008000d0fc <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    8000d0fc:	06050e63          	beqz	a0,8000d178 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    8000d100:	08058063          	beqz	a1,8000d180 <thread_create+0x84>
{
    8000d104:	fd010113          	addi	sp,sp,-48
    8000d108:	02113423          	sd	ra,40(sp)
    8000d10c:	02813023          	sd	s0,32(sp)
    8000d110:	00913c23          	sd	s1,24(sp)
    8000d114:	01213823          	sd	s2,16(sp)
    8000d118:	01313423          	sd	s3,8(sp)
    8000d11c:	03010413          	addi	s0,sp,48
    8000d120:	00060993          	mv	s3,a2
    8000d124:	00058913          	mv	s2,a1
    8000d128:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    8000d12c:	00001537          	lui	a0,0x1
    8000d130:	00000097          	auipc	ra,0x0
    8000d134:	f40080e7          	jalr	-192(ra) # 8000d070 <mem_alloc>
    if(stack_space == nullptr) return -3;
    8000d138:	04050863          	beqz	a0,8000d188 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    8000d13c:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    8000d140:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    8000d144:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    8000d148:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    8000d14c:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    8000d150:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d154:	00050513          	mv	a0,a0
    8000d158:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d15c:	02813083          	ld	ra,40(sp)
    8000d160:	02013403          	ld	s0,32(sp)
    8000d164:	01813483          	ld	s1,24(sp)
    8000d168:	01013903          	ld	s2,16(sp)
    8000d16c:	00813983          	ld	s3,8(sp)
    8000d170:	03010113          	addi	sp,sp,48
    8000d174:	00008067          	ret
    if(handle == nullptr) return -1;
    8000d178:	fff00513          	li	a0,-1
    8000d17c:	00008067          	ret
    if(start_routine == nullptr) return -2;
    8000d180:	ffe00513          	li	a0,-2
}
    8000d184:	00008067          	ret
    if(stack_space == nullptr) return -3;
    8000d188:	ffd00513          	li	a0,-3
    8000d18c:	fd1ff06f          	j	8000d15c <thread_create+0x60>

000000008000d190 <thread_exit>:

extern "C" int thread_exit()
{
    8000d190:	ff010113          	addi	sp,sp,-16
    8000d194:	00813423          	sd	s0,8(sp)
    8000d198:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    8000d19c:	01200513          	li	a0,18
    asm volatile("ecall");
    8000d1a0:	00000073          	ecall

    return ret;
}
    8000d1a4:	00000513          	li	a0,0
    8000d1a8:	00813403          	ld	s0,8(sp)
    8000d1ac:	01010113          	addi	sp,sp,16
    8000d1b0:	00008067          	ret

000000008000d1b4 <sem_open>:



extern "C" int sem_open(sem_t* handle, unsigned val)
{
    8000d1b4:	ff010113          	addi	sp,sp,-16
    8000d1b8:	00813423          	sd	s0,8(sp)
    8000d1bc:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000d1c0:	02050463          	beqz	a0,8000d1e8 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    8000d1c4:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    8000d1c8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    8000d1cc:	02100513          	li	a0,33
    asm volatile("ecall");
    8000d1d0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d1d4:	00050513          	mv	a0,a0
    8000d1d8:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d1dc:	00813403          	ld	s0,8(sp)
    8000d1e0:	01010113          	addi	sp,sp,16
    8000d1e4:	00008067          	ret
    if(handle == nullptr) return -1;
    8000d1e8:	fff00513          	li	a0,-1
    8000d1ec:	ff1ff06f          	j	8000d1dc <sem_open+0x28>

000000008000d1f0 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    8000d1f0:	ff010113          	addi	sp,sp,-16
    8000d1f4:	00813423          	sd	s0,8(sp)
    8000d1f8:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000d1fc:	02050263          	beqz	a0,8000d220 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    8000d200:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    8000d204:	02200513          	li	a0,34
    asm volatile("ecall");
    8000d208:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d20c:	00050513          	mv	a0,a0
    8000d210:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d214:	00813403          	ld	s0,8(sp)
    8000d218:	01010113          	addi	sp,sp,16
    8000d21c:	00008067          	ret
    if(handle == nullptr) return -1;
    8000d220:	fff00513          	li	a0,-1
    8000d224:	ff1ff06f          	j	8000d214 <sem_close+0x24>

000000008000d228 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    8000d228:	ff010113          	addi	sp,sp,-16
    8000d22c:	00813423          	sd	s0,8(sp)
    8000d230:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    8000d234:	02050263          	beqz	a0,8000d258 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    8000d238:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    8000d23c:	02300513          	li	a0,35
    asm volatile("ecall");
    8000d240:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d244:	00050513          	mv	a0,a0
    8000d248:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d24c:	00813403          	ld	s0,8(sp)
    8000d250:	01010113          	addi	sp,sp,16
    8000d254:	00008067          	ret
    if(id == nullptr) return -1;
    8000d258:	fff00513          	li	a0,-1
    8000d25c:	ff1ff06f          	j	8000d24c <sem_wait+0x24>

000000008000d260 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    8000d260:	ff010113          	addi	sp,sp,-16
    8000d264:	00813423          	sd	s0,8(sp)
    8000d268:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    8000d26c:	02050263          	beqz	a0,8000d290 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    8000d270:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    8000d274:	02400513          	li	a0,36
    asm volatile("ecall");
    8000d278:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d27c:	00050513          	mv	a0,a0
    8000d280:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d284:	00813403          	ld	s0,8(sp)
    8000d288:	01010113          	addi	sp,sp,16
    8000d28c:	00008067          	ret
    if(id == nullptr) return -1;
    8000d290:	fff00513          	li	a0,-1
    8000d294:	ff1ff06f          	j	8000d284 <sem_signal+0x24>

000000008000d298 <time_sleep>:

extern "C" int time_sleep(time_t time){
    8000d298:	ff010113          	addi	sp,sp,-16
    8000d29c:	00813423          	sd	s0,8(sp)
    8000d2a0:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    8000d2a4:	02050263          	beqz	a0,8000d2c8 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    8000d2a8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    8000d2ac:	03100513          	li	a0,49
    asm volatile("ecall");
    8000d2b0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d2b4:	00050513          	mv	a0,a0
    8000d2b8:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000d2bc:	00813403          	ld	s0,8(sp)
    8000d2c0:	01010113          	addi	sp,sp,16
    8000d2c4:	00008067          	ret
    if(time == 0) return -1;
    8000d2c8:	fff00513          	li	a0,-1
    8000d2cc:	ff1ff06f          	j	8000d2bc <time_sleep+0x24>

000000008000d2d0 <getc>:

const int EOF = -1;
extern "C" char getc(){
    8000d2d0:	ff010113          	addi	sp,sp,-16
    8000d2d4:	00813423          	sd	s0,8(sp)
    8000d2d8:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    8000d2dc:	04100513          	li	a0,65
    asm volatile("ecall");
    8000d2e0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000d2e4:	00050513          	mv	a0,a0
    8000d2e8:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    8000d2ec:	0ff00793          	li	a5,255
    8000d2f0:	00a7ea63          	bltu	a5,a0,8000d304 <getc+0x34>
    8000d2f4:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    8000d2f8:	00813403          	ld	s0,8(sp)
    8000d2fc:	01010113          	addi	sp,sp,16
    8000d300:	00008067          	ret
    else return EOF;
    8000d304:	0ff00513          	li	a0,255
    8000d308:	ff1ff06f          	j	8000d2f8 <getc+0x28>

000000008000d30c <putc>:

extern "C" void putc(char c){
    8000d30c:	ff010113          	addi	sp,sp,-16
    8000d310:	00813423          	sd	s0,8(sp)
    8000d314:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    8000d318:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    8000d31c:	04200513          	li	a0,66
    asm volatile("ecall");
    8000d320:	00000073          	ecall
    8000d324:	00813403          	ld	s0,8(sp)
    8000d328:	01010113          	addi	sp,sp,16
    8000d32c:	00008067          	ret

000000008000d330 <_ZN6Thread10runWrapperEPv>:
        return thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    8000d330:	ff010113          	addi	sp,sp,-16
    8000d334:	00113423          	sd	ra,8(sp)
    8000d338:	00813023          	sd	s0,0(sp)
    8000d33c:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    8000d340:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    8000d344:	0107b783          	ld	a5,16(a5)
    8000d348:	000780e7          	jalr	a5
}
    8000d34c:	00813083          	ld	ra,8(sp)
    8000d350:	00013403          	ld	s0,0(sp)
    8000d354:	01010113          	addi	sp,sp,16
    8000d358:	00008067          	ret

000000008000d35c <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    8000d35c:	fe010113          	addi	sp,sp,-32
    8000d360:	00113c23          	sd	ra,24(sp)
    8000d364:	00813823          	sd	s0,16(sp)
    8000d368:	00913423          	sd	s1,8(sp)
    8000d36c:	02010413          	addi	s0,sp,32
    8000d370:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    8000d374:	02050263          	beqz	a0,8000d398 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    8000d378:	0004b503          	ld	a0,0(s1)
    8000d37c:	00053783          	ld	a5,0(a0)
    8000d380:	0187b783          	ld	a5,24(a5)
    8000d384:	000780e7          	jalr	a5
        time_sleep(wp->period);
    8000d388:	0084b503          	ld	a0,8(s1)
    8000d38c:	00000097          	auipc	ra,0x0
    8000d390:	f0c080e7          	jalr	-244(ra) # 8000d298 <time_sleep>
    8000d394:	fe5ff06f          	j	8000d378 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    8000d398:	01813083          	ld	ra,24(sp)
    8000d39c:	01013403          	ld	s0,16(sp)
    8000d3a0:	00813483          	ld	s1,8(sp)
    8000d3a4:	02010113          	addi	sp,sp,32
    8000d3a8:	00008067          	ret

000000008000d3ac <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    8000d3ac:	ff010113          	addi	sp,sp,-16
    8000d3b0:	00113423          	sd	ra,8(sp)
    8000d3b4:	00813023          	sd	s0,0(sp)
    8000d3b8:	01010413          	addi	s0,sp,16
    8000d3bc:	00000097          	auipc	ra,0x0
    8000d3c0:	cb4080e7          	jalr	-844(ra) # 8000d070 <mem_alloc>
    8000d3c4:	00813083          	ld	ra,8(sp)
    8000d3c8:	00013403          	ld	s0,0(sp)
    8000d3cc:	01010113          	addi	sp,sp,16
    8000d3d0:	00008067          	ret

000000008000d3d4 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    8000d3d4:	ff010113          	addi	sp,sp,-16
    8000d3d8:	00113423          	sd	ra,8(sp)
    8000d3dc:	00813023          	sd	s0,0(sp)
    8000d3e0:	01010413          	addi	s0,sp,16
    8000d3e4:	00000097          	auipc	ra,0x0
    8000d3e8:	cc4080e7          	jalr	-828(ra) # 8000d0a8 <mem_free>
    8000d3ec:	00813083          	ld	ra,8(sp)
    8000d3f0:	00013403          	ld	s0,0(sp)
    8000d3f4:	01010113          	addi	sp,sp,16
    8000d3f8:	00008067          	ret

000000008000d3fc <_ZN6ThreadD1Ev>:
Thread::~Thread()
    8000d3fc:	fe010113          	addi	sp,sp,-32
    8000d400:	00113c23          	sd	ra,24(sp)
    8000d404:	00813823          	sd	s0,16(sp)
    8000d408:	00913423          	sd	s1,8(sp)
    8000d40c:	02010413          	addi	s0,sp,32
    8000d410:	00003797          	auipc	a5,0x3
    8000d414:	ed078793          	addi	a5,a5,-304 # 800102e0 <_ZTV6Thread+0x10>
    8000d418:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    8000d41c:	00853483          	ld	s1,8(a0)
    if(!w) return;
    8000d420:	02048063          	beqz	s1,8000d440 <_ZN6ThreadD1Ev+0x44>
    if(w->handle){
    8000d424:	0004b503          	ld	a0,0(s1)
    8000d428:	00050663          	beqz	a0,8000d434 <_ZN6ThreadD1Ev+0x38>
        delete w->handle;
    8000d42c:	00000097          	auipc	ra,0x0
    8000d430:	c1c080e7          	jalr	-996(ra) # 8000d048 <_ZN7_threaddlEPv>
    delete w;
    8000d434:	00048513          	mv	a0,s1
    8000d438:	00000097          	auipc	ra,0x0
    8000d43c:	f9c080e7          	jalr	-100(ra) # 8000d3d4 <_ZdlPv>
}
    8000d440:	01813083          	ld	ra,24(sp)
    8000d444:	01013403          	ld	s0,16(sp)
    8000d448:	00813483          	ld	s1,8(sp)
    8000d44c:	02010113          	addi	sp,sp,32
    8000d450:	00008067          	ret

000000008000d454 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    8000d454:	fe010113          	addi	sp,sp,-32
    8000d458:	00113c23          	sd	ra,24(sp)
    8000d45c:	00813823          	sd	s0,16(sp)
    8000d460:	00913423          	sd	s1,8(sp)
    8000d464:	02010413          	addi	s0,sp,32
    8000d468:	00050493          	mv	s1,a0
}
    8000d46c:	00000097          	auipc	ra,0x0
    8000d470:	f90080e7          	jalr	-112(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000d474:	00048513          	mv	a0,s1
    8000d478:	00000097          	auipc	ra,0x0
    8000d47c:	f5c080e7          	jalr	-164(ra) # 8000d3d4 <_ZdlPv>
    8000d480:	01813083          	ld	ra,24(sp)
    8000d484:	01013403          	ld	s0,16(sp)
    8000d488:	00813483          	ld	s1,8(sp)
    8000d48c:	02010113          	addi	sp,sp,32
    8000d490:	00008067          	ret

000000008000d494 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    8000d494:	ff010113          	addi	sp,sp,-16
    8000d498:	00113423          	sd	ra,8(sp)
    8000d49c:	00813023          	sd	s0,0(sp)
    8000d4a0:	01010413          	addi	s0,sp,16
    8000d4a4:	00000097          	auipc	ra,0x0
    8000d4a8:	bcc080e7          	jalr	-1076(ra) # 8000d070 <mem_alloc>
    8000d4ac:	00813083          	ld	ra,8(sp)
    8000d4b0:	00013403          	ld	s0,0(sp)
    8000d4b4:	01010113          	addi	sp,sp,16
    8000d4b8:	00008067          	ret

000000008000d4bc <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    8000d4bc:	ff010113          	addi	sp,sp,-16
    8000d4c0:	00113423          	sd	ra,8(sp)
    8000d4c4:	00813023          	sd	s0,0(sp)
    8000d4c8:	01010413          	addi	s0,sp,16
    8000d4cc:	00000097          	auipc	ra,0x0
    8000d4d0:	bdc080e7          	jalr	-1060(ra) # 8000d0a8 <mem_free>
    8000d4d4:	00813083          	ld	ra,8(sp)
    8000d4d8:	00013403          	ld	s0,0(sp)
    8000d4dc:	01010113          	addi	sp,sp,16
    8000d4e0:	00008067          	ret

000000008000d4e4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    8000d4e4:	fd010113          	addi	sp,sp,-48
    8000d4e8:	02113423          	sd	ra,40(sp)
    8000d4ec:	02813023          	sd	s0,32(sp)
    8000d4f0:	00913c23          	sd	s1,24(sp)
    8000d4f4:	01213823          	sd	s2,16(sp)
    8000d4f8:	01313423          	sd	s3,8(sp)
    8000d4fc:	03010413          	addi	s0,sp,48
    8000d500:	00050493          	mv	s1,a0
    8000d504:	00058993          	mv	s3,a1
    8000d508:	00060913          	mv	s2,a2
    8000d50c:	00003797          	auipc	a5,0x3
    8000d510:	dd478793          	addi	a5,a5,-556 # 800102e0 <_ZTV6Thread+0x10>
    8000d514:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    8000d518:	01800513          	li	a0,24
    8000d51c:	00000097          	auipc	ra,0x0
    8000d520:	e90080e7          	jalr	-368(ra) # 8000d3ac <_Znwm>
    8000d524:	00050863          	beqz	a0,8000d534 <_ZN6ThreadC1EPFvPvES0_+0x50>
    8000d528:	00053023          	sd	zero,0(a0)
    8000d52c:	01353423          	sd	s3,8(a0)
    8000d530:	01253823          	sd	s2,16(a0)
    8000d534:	00a4b423          	sd	a0,8(s1)
}
    8000d538:	02813083          	ld	ra,40(sp)
    8000d53c:	02013403          	ld	s0,32(sp)
    8000d540:	01813483          	ld	s1,24(sp)
    8000d544:	01013903          	ld	s2,16(sp)
    8000d548:	00813983          	ld	s3,8(sp)
    8000d54c:	03010113          	addi	sp,sp,48
    8000d550:	00008067          	ret

000000008000d554 <_ZN6Thread5startEv>:
int Thread::start(){
    8000d554:	fe010113          	addi	sp,sp,-32
    8000d558:	00113c23          	sd	ra,24(sp)
    8000d55c:	00813823          	sd	s0,16(sp)
    8000d560:	00913423          	sd	s1,8(sp)
    8000d564:	02010413          	addi	s0,sp,32
    8000d568:	00050493          	mv	s1,a0
    if(myHandle)
    8000d56c:	00853503          	ld	a0,8(a0)
    8000d570:	02050463          	beqz	a0,8000d598 <_ZN6Thread5startEv+0x44>
        return thread_create(&w->handle, w->body, w->arg);    
    8000d574:	01053603          	ld	a2,16(a0)
    8000d578:	00853583          	ld	a1,8(a0)
    8000d57c:	00000097          	auipc	ra,0x0
    8000d580:	b80080e7          	jalr	-1152(ra) # 8000d0fc <thread_create>
}
    8000d584:	01813083          	ld	ra,24(sp)
    8000d588:	01013403          	ld	s0,16(sp)
    8000d58c:	00813483          	ld	s1,8(sp)
    8000d590:	02010113          	addi	sp,sp,32
    8000d594:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    8000d598:	01800513          	li	a0,24
    8000d59c:	00000097          	auipc	ra,0x0
    8000d5a0:	e10080e7          	jalr	-496(ra) # 8000d3ac <_Znwm>
    8000d5a4:	00050863          	beqz	a0,8000d5b4 <_ZN6Thread5startEv+0x60>
    8000d5a8:	00053023          	sd	zero,0(a0)
    8000d5ac:	00053423          	sd	zero,8(a0)
    8000d5b0:	00053823          	sd	zero,16(a0)
        if(!w) return -7;
    8000d5b4:	02050063          	beqz	a0,8000d5d4 <_ZN6Thread5startEv+0x80>
        myHandle = (thread_t)w;
    8000d5b8:	00a4b423          	sd	a0,8(s1)
        return thread_create(&w->handle, &runWrapper, this);   
    8000d5bc:	00048613          	mv	a2,s1
    8000d5c0:	00000597          	auipc	a1,0x0
    8000d5c4:	d7058593          	addi	a1,a1,-656 # 8000d330 <_ZN6Thread10runWrapperEPv>
    8000d5c8:	00000097          	auipc	ra,0x0
    8000d5cc:	b34080e7          	jalr	-1228(ra) # 8000d0fc <thread_create>
    8000d5d0:	fb5ff06f          	j	8000d584 <_ZN6Thread5startEv+0x30>
        if(!w) return -7;
    8000d5d4:	ff900513          	li	a0,-7
    8000d5d8:	fadff06f          	j	8000d584 <_ZN6Thread5startEv+0x30>

000000008000d5dc <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    8000d5dc:	fe010113          	addi	sp,sp,-32
    8000d5e0:	00113c23          	sd	ra,24(sp)
    8000d5e4:	00813823          	sd	s0,16(sp)
    8000d5e8:	00913423          	sd	s1,8(sp)
    8000d5ec:	01213023          	sd	s2,0(sp)
    8000d5f0:	02010413          	addi	s0,sp,32
    8000d5f4:	00050493          	mv	s1,a0
    8000d5f8:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    8000d5fc:	01000513          	li	a0,16
    8000d600:	00000097          	auipc	ra,0x0
    8000d604:	dac080e7          	jalr	-596(ra) # 8000d3ac <_Znwm>
    8000d608:	00050613          	mv	a2,a0
    8000d60c:	00050663          	beqz	a0,8000d618 <_ZN14PeriodicThreadC1Em+0x3c>
    8000d610:	00953023          	sd	s1,0(a0)
    8000d614:	01253423          	sd	s2,8(a0)
    8000d618:	00000597          	auipc	a1,0x0
    8000d61c:	d4458593          	addi	a1,a1,-700 # 8000d35c <_ZN14PeriodicThread15periodicWrapperEPv>
    8000d620:	00048513          	mv	a0,s1
    8000d624:	00000097          	auipc	ra,0x0
    8000d628:	ec0080e7          	jalr	-320(ra) # 8000d4e4 <_ZN6ThreadC1EPFvPvES0_>
    8000d62c:	00003797          	auipc	a5,0x3
    8000d630:	c8478793          	addi	a5,a5,-892 # 800102b0 <_ZTV14PeriodicThread+0x10>
    8000d634:	00f4b023          	sd	a5,0(s1)
    8000d638:	01813083          	ld	ra,24(sp)
    8000d63c:	01013403          	ld	s0,16(sp)
    8000d640:	00813483          	ld	s1,8(sp)
    8000d644:	00013903          	ld	s2,0(sp)
    8000d648:	02010113          	addi	sp,sp,32
    8000d64c:	00008067          	ret

000000008000d650 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    8000d650:	ff010113          	addi	sp,sp,-16
    8000d654:	00813423          	sd	s0,8(sp)
    8000d658:	01010413          	addi	s0,sp,16
    8000d65c:	00813403          	ld	s0,8(sp)
    8000d660:	01010113          	addi	sp,sp,16
    8000d664:	00008067          	ret

000000008000d668 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    8000d668:	ff010113          	addi	sp,sp,-16
    8000d66c:	00813423          	sd	s0,8(sp)
    8000d670:	01010413          	addi	s0,sp,16
    8000d674:	00813403          	ld	s0,8(sp)
    8000d678:	01010113          	addi	sp,sp,16
    8000d67c:	00008067          	ret

000000008000d680 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000d680:	ff010113          	addi	sp,sp,-16
    8000d684:	00113423          	sd	ra,8(sp)
    8000d688:	00813023          	sd	s0,0(sp)
    8000d68c:	01010413          	addi	s0,sp,16
    8000d690:	00003797          	auipc	a5,0x3
    8000d694:	c2078793          	addi	a5,a5,-992 # 800102b0 <_ZTV14PeriodicThread+0x10>
    8000d698:	00f53023          	sd	a5,0(a0)
    8000d69c:	00000097          	auipc	ra,0x0
    8000d6a0:	d60080e7          	jalr	-672(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000d6a4:	00813083          	ld	ra,8(sp)
    8000d6a8:	00013403          	ld	s0,0(sp)
    8000d6ac:	01010113          	addi	sp,sp,16
    8000d6b0:	00008067          	ret

000000008000d6b4 <_ZN14PeriodicThreadD0Ev>:
    8000d6b4:	fe010113          	addi	sp,sp,-32
    8000d6b8:	00113c23          	sd	ra,24(sp)
    8000d6bc:	00813823          	sd	s0,16(sp)
    8000d6c0:	00913423          	sd	s1,8(sp)
    8000d6c4:	02010413          	addi	s0,sp,32
    8000d6c8:	00050493          	mv	s1,a0
    8000d6cc:	00003797          	auipc	a5,0x3
    8000d6d0:	be478793          	addi	a5,a5,-1052 # 800102b0 <_ZTV14PeriodicThread+0x10>
    8000d6d4:	00f53023          	sd	a5,0(a0)
    8000d6d8:	00000097          	auipc	ra,0x0
    8000d6dc:	d24080e7          	jalr	-732(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000d6e0:	00048513          	mv	a0,s1
    8000d6e4:	00000097          	auipc	ra,0x0
    8000d6e8:	cf0080e7          	jalr	-784(ra) # 8000d3d4 <_ZdlPv>
    8000d6ec:	01813083          	ld	ra,24(sp)
    8000d6f0:	01013403          	ld	s0,16(sp)
    8000d6f4:	00813483          	ld	s1,8(sp)
    8000d6f8:	02010113          	addi	sp,sp,32
    8000d6fc:	00008067          	ret

000000008000d700 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000d700:	fd010113          	addi	sp,sp,-48
    8000d704:	02113423          	sd	ra,40(sp)
    8000d708:	02813023          	sd	s0,32(sp)
    8000d70c:	00913c23          	sd	s1,24(sp)
    8000d710:	01213823          	sd	s2,16(sp)
    8000d714:	01313423          	sd	s3,8(sp)
    8000d718:	03010413          	addi	s0,sp,48
    8000d71c:	00050493          	mv	s1,a0
    8000d720:	00058993          	mv	s3,a1
    8000d724:	0015879b          	addiw	a5,a1,1
    8000d728:	0007851b          	sext.w	a0,a5
    8000d72c:	00f4a023          	sw	a5,0(s1)
    8000d730:	0004a823          	sw	zero,16(s1)
    8000d734:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000d738:	00251513          	slli	a0,a0,0x2
    8000d73c:	00000097          	auipc	ra,0x0
    8000d740:	934080e7          	jalr	-1740(ra) # 8000d070 <mem_alloc>
    8000d744:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000d748:	01000513          	li	a0,16
    8000d74c:	00000097          	auipc	ra,0x0
    8000d750:	c60080e7          	jalr	-928(ra) # 8000d3ac <_Znwm>
    8000d754:	00050913          	mv	s2,a0
    8000d758:	02050063          	beqz	a0,8000d778 <_ZN9BufferCPPC1Ei+0x78>
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000d75c:	00003797          	auipc	a5,0x3
    8000d760:	bac78793          	addi	a5,a5,-1108 # 80010308 <_ZTV9Semaphore+0x10>
    8000d764:	00f53023          	sd	a5,0(a0)
    8000d768:	00000593          	li	a1,0
    8000d76c:	00850513          	addi	a0,a0,8
    8000d770:	00000097          	auipc	ra,0x0
    8000d774:	a44080e7          	jalr	-1468(ra) # 8000d1b4 <sem_open>
    8000d778:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000d77c:	01000513          	li	a0,16
    8000d780:	00000097          	auipc	ra,0x0
    8000d784:	c2c080e7          	jalr	-980(ra) # 8000d3ac <_Znwm>
    8000d788:	00050913          	mv	s2,a0
    8000d78c:	02050063          	beqz	a0,8000d7ac <_ZN9BufferCPPC1Ei+0xac>
    8000d790:	00003797          	auipc	a5,0x3
    8000d794:	b7878793          	addi	a5,a5,-1160 # 80010308 <_ZTV9Semaphore+0x10>
    8000d798:	00f53023          	sd	a5,0(a0)
    8000d79c:	00098593          	mv	a1,s3
    8000d7a0:	00850513          	addi	a0,a0,8
    8000d7a4:	00000097          	auipc	ra,0x0
    8000d7a8:	a10080e7          	jalr	-1520(ra) # 8000d1b4 <sem_open>
    8000d7ac:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    8000d7b0:	01000513          	li	a0,16
    8000d7b4:	00000097          	auipc	ra,0x0
    8000d7b8:	bf8080e7          	jalr	-1032(ra) # 8000d3ac <_Znwm>
    8000d7bc:	00050913          	mv	s2,a0
    8000d7c0:	02050063          	beqz	a0,8000d7e0 <_ZN9BufferCPPC1Ei+0xe0>
    8000d7c4:	00003797          	auipc	a5,0x3
    8000d7c8:	b4478793          	addi	a5,a5,-1212 # 80010308 <_ZTV9Semaphore+0x10>
    8000d7cc:	00f53023          	sd	a5,0(a0)
    8000d7d0:	00100593          	li	a1,1
    8000d7d4:	00850513          	addi	a0,a0,8
    8000d7d8:	00000097          	auipc	ra,0x0
    8000d7dc:	9dc080e7          	jalr	-1572(ra) # 8000d1b4 <sem_open>
    8000d7e0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000d7e4:	01000513          	li	a0,16
    8000d7e8:	00000097          	auipc	ra,0x0
    8000d7ec:	bc4080e7          	jalr	-1084(ra) # 8000d3ac <_Znwm>
    8000d7f0:	00050913          	mv	s2,a0
    8000d7f4:	02050063          	beqz	a0,8000d814 <_ZN9BufferCPPC1Ei+0x114>
    8000d7f8:	00003797          	auipc	a5,0x3
    8000d7fc:	b1078793          	addi	a5,a5,-1264 # 80010308 <_ZTV9Semaphore+0x10>
    8000d800:	00f53023          	sd	a5,0(a0)
    8000d804:	00100593          	li	a1,1
    8000d808:	00850513          	addi	a0,a0,8
    8000d80c:	00000097          	auipc	ra,0x0
    8000d810:	9a8080e7          	jalr	-1624(ra) # 8000d1b4 <sem_open>
    8000d814:	0324b823          	sd	s2,48(s1)
}
    8000d818:	02813083          	ld	ra,40(sp)
    8000d81c:	02013403          	ld	s0,32(sp)
    8000d820:	01813483          	ld	s1,24(sp)
    8000d824:	01013903          	ld	s2,16(sp)
    8000d828:	00813983          	ld	s3,8(sp)
    8000d82c:	03010113          	addi	sp,sp,48
    8000d830:	00008067          	ret
    8000d834:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000d838:	00090513          	mv	a0,s2
    8000d83c:	00000097          	auipc	ra,0x0
    8000d840:	b98080e7          	jalr	-1128(ra) # 8000d3d4 <_ZdlPv>
    8000d844:	00048513          	mv	a0,s1
    8000d848:	00009097          	auipc	ra,0x9
    8000d84c:	d30080e7          	jalr	-720(ra) # 80016578 <_Unwind_Resume>
    8000d850:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000d854:	00090513          	mv	a0,s2
    8000d858:	00000097          	auipc	ra,0x0
    8000d85c:	b7c080e7          	jalr	-1156(ra) # 8000d3d4 <_ZdlPv>
    8000d860:	00048513          	mv	a0,s1
    8000d864:	00009097          	auipc	ra,0x9
    8000d868:	d14080e7          	jalr	-748(ra) # 80016578 <_Unwind_Resume>
    8000d86c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000d870:	00090513          	mv	a0,s2
    8000d874:	00000097          	auipc	ra,0x0
    8000d878:	b60080e7          	jalr	-1184(ra) # 8000d3d4 <_ZdlPv>
    8000d87c:	00048513          	mv	a0,s1
    8000d880:	00009097          	auipc	ra,0x9
    8000d884:	cf8080e7          	jalr	-776(ra) # 80016578 <_Unwind_Resume>
    8000d888:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000d88c:	00090513          	mv	a0,s2
    8000d890:	00000097          	auipc	ra,0x0
    8000d894:	b44080e7          	jalr	-1212(ra) # 8000d3d4 <_ZdlPv>
    8000d898:	00048513          	mv	a0,s1
    8000d89c:	00009097          	auipc	ra,0x9
    8000d8a0:	cdc080e7          	jalr	-804(ra) # 80016578 <_Unwind_Resume>

000000008000d8a4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000d8a4:	fe010113          	addi	sp,sp,-32
    8000d8a8:	00113c23          	sd	ra,24(sp)
    8000d8ac:	00813823          	sd	s0,16(sp)
    8000d8b0:	00913423          	sd	s1,8(sp)
    8000d8b4:	01213023          	sd	s2,0(sp)
    8000d8b8:	02010413          	addi	s0,sp,32
    8000d8bc:	00050493          	mv	s1,a0
    8000d8c0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000d8c4:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    8000d8c8:	0087b503          	ld	a0,8(a5)
    8000d8cc:	00000097          	auipc	ra,0x0
    8000d8d0:	95c080e7          	jalr	-1700(ra) # 8000d228 <sem_wait>

    mutexTail->wait();
    8000d8d4:	0304b783          	ld	a5,48(s1)
    8000d8d8:	0087b503          	ld	a0,8(a5)
    8000d8dc:	00000097          	auipc	ra,0x0
    8000d8e0:	94c080e7          	jalr	-1716(ra) # 8000d228 <sem_wait>
    buffer[tail] = val;
    8000d8e4:	0084b783          	ld	a5,8(s1)
    8000d8e8:	0144a703          	lw	a4,20(s1)
    8000d8ec:	00271713          	slli	a4,a4,0x2
    8000d8f0:	00e787b3          	add	a5,a5,a4
    8000d8f4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000d8f8:	0144a783          	lw	a5,20(s1)
    8000d8fc:	0017879b          	addiw	a5,a5,1
    8000d900:	0004a703          	lw	a4,0(s1)
    8000d904:	02e7e7bb          	remw	a5,a5,a4
    8000d908:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000d90c:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    8000d910:	0087b503          	ld	a0,8(a5)
    8000d914:	00000097          	auipc	ra,0x0
    8000d918:	94c080e7          	jalr	-1716(ra) # 8000d260 <sem_signal>

    itemAvailable->signal();
    8000d91c:	0204b783          	ld	a5,32(s1)
    8000d920:	0087b503          	ld	a0,8(a5)
    8000d924:	00000097          	auipc	ra,0x0
    8000d928:	93c080e7          	jalr	-1732(ra) # 8000d260 <sem_signal>

}
    8000d92c:	01813083          	ld	ra,24(sp)
    8000d930:	01013403          	ld	s0,16(sp)
    8000d934:	00813483          	ld	s1,8(sp)
    8000d938:	00013903          	ld	s2,0(sp)
    8000d93c:	02010113          	addi	sp,sp,32
    8000d940:	00008067          	ret

000000008000d944 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000d944:	fe010113          	addi	sp,sp,-32
    8000d948:	00113c23          	sd	ra,24(sp)
    8000d94c:	00813823          	sd	s0,16(sp)
    8000d950:	00913423          	sd	s1,8(sp)
    8000d954:	01213023          	sd	s2,0(sp)
    8000d958:	02010413          	addi	s0,sp,32
    8000d95c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000d960:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    8000d964:	0087b503          	ld	a0,8(a5)
    8000d968:	00000097          	auipc	ra,0x0
    8000d96c:	8c0080e7          	jalr	-1856(ra) # 8000d228 <sem_wait>

    mutexHead->wait();
    8000d970:	0284b783          	ld	a5,40(s1)
    8000d974:	0087b503          	ld	a0,8(a5)
    8000d978:	00000097          	auipc	ra,0x0
    8000d97c:	8b0080e7          	jalr	-1872(ra) # 8000d228 <sem_wait>

    int ret = buffer[head];
    8000d980:	0084b703          	ld	a4,8(s1)
    8000d984:	0104a783          	lw	a5,16(s1)
    8000d988:	00279693          	slli	a3,a5,0x2
    8000d98c:	00d70733          	add	a4,a4,a3
    8000d990:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000d994:	0017879b          	addiw	a5,a5,1
    8000d998:	0004a703          	lw	a4,0(s1)
    8000d99c:	02e7e7bb          	remw	a5,a5,a4
    8000d9a0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000d9a4:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    8000d9a8:	0087b503          	ld	a0,8(a5)
    8000d9ac:	00000097          	auipc	ra,0x0
    8000d9b0:	8b4080e7          	jalr	-1868(ra) # 8000d260 <sem_signal>

    spaceAvailable->signal();
    8000d9b4:	0184b783          	ld	a5,24(s1)
    8000d9b8:	0087b503          	ld	a0,8(a5)
    8000d9bc:	00000097          	auipc	ra,0x0
    8000d9c0:	8a4080e7          	jalr	-1884(ra) # 8000d260 <sem_signal>

    return ret;
}
    8000d9c4:	00090513          	mv	a0,s2
    8000d9c8:	01813083          	ld	ra,24(sp)
    8000d9cc:	01013403          	ld	s0,16(sp)
    8000d9d0:	00813483          	ld	s1,8(sp)
    8000d9d4:	00013903          	ld	s2,0(sp)
    8000d9d8:	02010113          	addi	sp,sp,32
    8000d9dc:	00008067          	ret

000000008000d9e0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000d9e0:	fe010113          	addi	sp,sp,-32
    8000d9e4:	00113c23          	sd	ra,24(sp)
    8000d9e8:	00813823          	sd	s0,16(sp)
    8000d9ec:	00913423          	sd	s1,8(sp)
    8000d9f0:	01213023          	sd	s2,0(sp)
    8000d9f4:	02010413          	addi	s0,sp,32
    8000d9f8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000d9fc:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    8000da00:	0087b503          	ld	a0,8(a5)
    8000da04:	00000097          	auipc	ra,0x0
    8000da08:	824080e7          	jalr	-2012(ra) # 8000d228 <sem_wait>
    mutexTail->wait();
    8000da0c:	0304b783          	ld	a5,48(s1)
    8000da10:	0087b503          	ld	a0,8(a5)
    8000da14:	00000097          	auipc	ra,0x0
    8000da18:	814080e7          	jalr	-2028(ra) # 8000d228 <sem_wait>

    if (tail >= head) {
    8000da1c:	0144a783          	lw	a5,20(s1)
    8000da20:	0104a903          	lw	s2,16(s1)
    8000da24:	0527c263          	blt	a5,s2,8000da68 <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    8000da28:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000da2c:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    8000da30:	0087b503          	ld	a0,8(a5)
    8000da34:	00000097          	auipc	ra,0x0
    8000da38:	82c080e7          	jalr	-2004(ra) # 8000d260 <sem_signal>
    mutexHead->signal();
    8000da3c:	0284b783          	ld	a5,40(s1)
    8000da40:	0087b503          	ld	a0,8(a5)
    8000da44:	00000097          	auipc	ra,0x0
    8000da48:	81c080e7          	jalr	-2020(ra) # 8000d260 <sem_signal>

    return ret;
}
    8000da4c:	00090513          	mv	a0,s2
    8000da50:	01813083          	ld	ra,24(sp)
    8000da54:	01013403          	ld	s0,16(sp)
    8000da58:	00813483          	ld	s1,8(sp)
    8000da5c:	00013903          	ld	s2,0(sp)
    8000da60:	02010113          	addi	sp,sp,32
    8000da64:	00008067          	ret
        ret = cap - head + tail;
    8000da68:	0004a703          	lw	a4,0(s1)
    8000da6c:	4127093b          	subw	s2,a4,s2
    8000da70:	00f9093b          	addw	s2,s2,a5
    8000da74:	fb9ff06f          	j	8000da2c <_ZN9BufferCPP6getCntEv+0x4c>

000000008000da78 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000da78:	fe010113          	addi	sp,sp,-32
    8000da7c:	00113c23          	sd	ra,24(sp)
    8000da80:	00813823          	sd	s0,16(sp)
    8000da84:	00913423          	sd	s1,8(sp)
    8000da88:	02010413          	addi	s0,sp,32
    8000da8c:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    8000da90:	00a00513          	li	a0,10
    8000da94:	00000097          	auipc	ra,0x0
    8000da98:	878080e7          	jalr	-1928(ra) # 8000d30c <putc>
    printString("Buffer deleted!\n");
    8000da9c:	00003517          	auipc	a0,0x3
    8000daa0:	87c50513          	addi	a0,a0,-1924 # 80010318 <_ZTV9Semaphore+0x20>
    8000daa4:	00000097          	auipc	ra,0x0
    8000daa8:	488080e7          	jalr	1160(ra) # 8000df2c <_Z11printStringPKc>
    while (getCnt()) {
    8000daac:	00048513          	mv	a0,s1
    8000dab0:	00000097          	auipc	ra,0x0
    8000dab4:	f30080e7          	jalr	-208(ra) # 8000d9e0 <_ZN9BufferCPP6getCntEv>
    8000dab8:	02050c63          	beqz	a0,8000daf0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000dabc:	0084b783          	ld	a5,8(s1)
    8000dac0:	0104a703          	lw	a4,16(s1)
    8000dac4:	00271713          	slli	a4,a4,0x2
    8000dac8:	00e787b3          	add	a5,a5,a4
    8000dacc:	0007c503          	lbu	a0,0(a5)
    8000dad0:	00000097          	auipc	ra,0x0
    8000dad4:	83c080e7          	jalr	-1988(ra) # 8000d30c <putc>
        head = (head + 1) % cap;
    8000dad8:	0104a783          	lw	a5,16(s1)
    8000dadc:	0017879b          	addiw	a5,a5,1
    8000dae0:	0004a703          	lw	a4,0(s1)
    8000dae4:	02e7e7bb          	remw	a5,a5,a4
    8000dae8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000daec:	fc1ff06f          	j	8000daac <_ZN9BufferCPPD1Ev+0x34>
    8000daf0:	02100513          	li	a0,33
    8000daf4:	00000097          	auipc	ra,0x0
    8000daf8:	818080e7          	jalr	-2024(ra) # 8000d30c <putc>
    8000dafc:	00a00513          	li	a0,10
    8000db00:	00000097          	auipc	ra,0x0
    8000db04:	80c080e7          	jalr	-2036(ra) # 8000d30c <putc>
    mem_free(buffer);
    8000db08:	0084b503          	ld	a0,8(s1)
    8000db0c:	fffff097          	auipc	ra,0xfffff
    8000db10:	59c080e7          	jalr	1436(ra) # 8000d0a8 <mem_free>
    delete itemAvailable;
    8000db14:	0204b503          	ld	a0,32(s1)
    8000db18:	00050863          	beqz	a0,8000db28 <_ZN9BufferCPPD1Ev+0xb0>
    8000db1c:	00053783          	ld	a5,0(a0)
    8000db20:	0087b783          	ld	a5,8(a5)
    8000db24:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000db28:	0184b503          	ld	a0,24(s1)
    8000db2c:	00050863          	beqz	a0,8000db3c <_ZN9BufferCPPD1Ev+0xc4>
    8000db30:	00053783          	ld	a5,0(a0)
    8000db34:	0087b783          	ld	a5,8(a5)
    8000db38:	000780e7          	jalr	a5
    delete mutexTail;
    8000db3c:	0304b503          	ld	a0,48(s1)
    8000db40:	00050863          	beqz	a0,8000db50 <_ZN9BufferCPPD1Ev+0xd8>
    8000db44:	00053783          	ld	a5,0(a0)
    8000db48:	0087b783          	ld	a5,8(a5)
    8000db4c:	000780e7          	jalr	a5
    delete mutexHead;
    8000db50:	0284b503          	ld	a0,40(s1)
    8000db54:	00050863          	beqz	a0,8000db64 <_ZN9BufferCPPD1Ev+0xec>
    8000db58:	00053783          	ld	a5,0(a0)
    8000db5c:	0087b783          	ld	a5,8(a5)
    8000db60:	000780e7          	jalr	a5
}
    8000db64:	01813083          	ld	ra,24(sp)
    8000db68:	01013403          	ld	s0,16(sp)
    8000db6c:	00813483          	ld	s1,8(sp)
    8000db70:	02010113          	addi	sp,sp,32
    8000db74:	00008067          	ret

000000008000db78 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    8000db78:	ff010113          	addi	sp,sp,-16
    8000db7c:	00113423          	sd	ra,8(sp)
    8000db80:	00813023          	sd	s0,0(sp)
    8000db84:	01010413          	addi	s0,sp,16
    8000db88:	00002797          	auipc	a5,0x2
    8000db8c:	78078793          	addi	a5,a5,1920 # 80010308 <_ZTV9Semaphore+0x10>
    8000db90:	00f53023          	sd	a5,0(a0)
    8000db94:	00853503          	ld	a0,8(a0)
    8000db98:	fffff097          	auipc	ra,0xfffff
    8000db9c:	658080e7          	jalr	1624(ra) # 8000d1f0 <sem_close>
    8000dba0:	00813083          	ld	ra,8(sp)
    8000dba4:	00013403          	ld	s0,0(sp)
    8000dba8:	01010113          	addi	sp,sp,16
    8000dbac:	00008067          	ret

000000008000dbb0 <_ZN9SemaphoreD0Ev>:
    8000dbb0:	fe010113          	addi	sp,sp,-32
    8000dbb4:	00113c23          	sd	ra,24(sp)
    8000dbb8:	00813823          	sd	s0,16(sp)
    8000dbbc:	00913423          	sd	s1,8(sp)
    8000dbc0:	02010413          	addi	s0,sp,32
    8000dbc4:	00050493          	mv	s1,a0
    8000dbc8:	00002797          	auipc	a5,0x2
    8000dbcc:	74078793          	addi	a5,a5,1856 # 80010308 <_ZTV9Semaphore+0x10>
    8000dbd0:	00f53023          	sd	a5,0(a0)
    8000dbd4:	00853503          	ld	a0,8(a0)
    8000dbd8:	fffff097          	auipc	ra,0xfffff
    8000dbdc:	618080e7          	jalr	1560(ra) # 8000d1f0 <sem_close>
    8000dbe0:	00048513          	mv	a0,s1
    8000dbe4:	fffff097          	auipc	ra,0xfffff
    8000dbe8:	7f0080e7          	jalr	2032(ra) # 8000d3d4 <_ZdlPv>
    8000dbec:	01813083          	ld	ra,24(sp)
    8000dbf0:	01013403          	ld	s0,16(sp)
    8000dbf4:	00813483          	ld	s1,8(sp)
    8000dbf8:	02010113          	addi	sp,sp,32
    8000dbfc:	00008067          	ret

000000008000dc00 <_Z8userMainv>:
    bool finished;
};



void userMain() {
    8000dc00:	fc010113          	addi	sp,sp,-64
    8000dc04:	02113c23          	sd	ra,56(sp)
    8000dc08:	02813823          	sd	s0,48(sp)
    8000dc0c:	02913423          	sd	s1,40(sp)
    8000dc10:	04010413          	addi	s0,sp,64
    virtual ~Thread ();
    int start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    8000dc14:	fc043423          	sd	zero,-56(s0)
    ForkThread(long _id) noexcept : Thread(), id(_id), finished(false) {}
    8000dc18:	00002797          	auipc	a5,0x2
    8000dc1c:	72878793          	addi	a5,a5,1832 # 80010340 <_ZTV10ForkThread+0x10>
    8000dc20:	fcf43023          	sd	a5,-64(s0)
    8000dc24:	00100793          	li	a5,1
    8000dc28:	fcf43823          	sd	a5,-48(s0)
    8000dc2c:	fc040c23          	sb	zero,-40(s0)
    ForkThread thread(1);

    thread.start();
    8000dc30:	fc040513          	addi	a0,s0,-64
    8000dc34:	00000097          	auipc	ra,0x0
    8000dc38:	920080e7          	jalr	-1760(ra) # 8000d554 <_ZN6Thread5startEv>
        return finished;
    8000dc3c:	fd844783          	lbu	a5,-40(s0)

    while (!thread.isFinished()) {
    8000dc40:	00079863          	bnez	a5,8000dc50 <_Z8userMainv+0x50>
        thread_dispatch();
    8000dc44:	fffff097          	auipc	ra,0xfffff
    8000dc48:	494080e7          	jalr	1172(ra) # 8000d0d8 <thread_dispatch>
    8000dc4c:	ff1ff06f          	j	8000dc3c <_Z8userMainv+0x3c>
    }

    
    while(1){
        printString("a");
    8000dc50:	00002517          	auipc	a0,0x2
    8000dc54:	73850513          	addi	a0,a0,1848 # 80010388 <_ZTV10ForkThread+0x58>
    8000dc58:	00000097          	auipc	ra,0x0
    8000dc5c:	2d4080e7          	jalr	724(ra) # 8000df2c <_Z11printStringPKc>
        time_sleep(10);
    8000dc60:	00a00513          	li	a0,10
    8000dc64:	fffff097          	auipc	ra,0xfffff
    8000dc68:	634080e7          	jalr	1588(ra) # 8000d298 <time_sleep>
    8000dc6c:	fe5ff06f          	j	8000dc50 <_Z8userMainv+0x50>
    8000dc70:	00050493          	mv	s1,a0
class ForkThread : public Thread {
    8000dc74:	00002797          	auipc	a5,0x2
    8000dc78:	6cc78793          	addi	a5,a5,1740 # 80010340 <_ZTV10ForkThread+0x10>
    8000dc7c:	fcf43023          	sd	a5,-64(s0)
    8000dc80:	fc040513          	addi	a0,s0,-64
    8000dc84:	fffff097          	auipc	ra,0xfffff
    8000dc88:	778080e7          	jalr	1912(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000dc8c:	00048513          	mv	a0,s1
    8000dc90:	00009097          	auipc	ra,0x9
    8000dc94:	8e8080e7          	jalr	-1816(ra) # 80016578 <_Unwind_Resume>

000000008000dc98 <_Z15userMainWrapperPv>:
    }
    printString("User main finished\n");
}

void userMainWrapper(void*)
{
    8000dc98:	ff010113          	addi	sp,sp,-16
    8000dc9c:	00113423          	sd	ra,8(sp)
    8000dca0:	00813023          	sd	s0,0(sp)
    8000dca4:	01010413          	addi	s0,sp,16
    userMain();
    8000dca8:	00000097          	auipc	ra,0x0
    8000dcac:	f58080e7          	jalr	-168(ra) # 8000dc00 <_Z8userMainv>

000000008000dcb0 <_ZN10ForkThread3runEv>:
    virtual void run() {
    8000dcb0:	fc010113          	addi	sp,sp,-64
    8000dcb4:	02113c23          	sd	ra,56(sp)
    8000dcb8:	02813823          	sd	s0,48(sp)
    8000dcbc:	02913423          	sd	s1,40(sp)
    8000dcc0:	03213023          	sd	s2,32(sp)
    8000dcc4:	01313c23          	sd	s3,24(sp)
    8000dcc8:	01413823          	sd	s4,16(sp)
    8000dccc:	01513423          	sd	s5,8(sp)
    8000dcd0:	04010413          	addi	s0,sp,64
    8000dcd4:	00050913          	mv	s2,a0
        printString("Started thread id:"); printInt(id); printString("\n");
    8000dcd8:	00002517          	auipc	a0,0x2
    8000dcdc:	68050513          	addi	a0,a0,1664 # 80010358 <_ZTV10ForkThread+0x28>
    8000dce0:	00000097          	auipc	ra,0x0
    8000dce4:	24c080e7          	jalr	588(ra) # 8000df2c <_Z11printStringPKc>
    8000dce8:	00a00593          	li	a1,10
    8000dcec:	01093503          	ld	a0,16(s2)
    8000dcf0:	00000097          	auipc	ra,0x0
    8000dcf4:	3d0080e7          	jalr	976(ra) # 8000e0c0 <_Z8printIntmi>
    8000dcf8:	00001517          	auipc	a0,0x1
    8000dcfc:	66050513          	addi	a0,a0,1632 # 8000f358 <CONSOLE_STATUS+0x348>
    8000dd00:	00000097          	auipc	ra,0x0
    8000dd04:	22c080e7          	jalr	556(ra) # 8000df2c <_Z11printStringPKc>
        ForkThread* thread = new ForkThread(id + 1);
    8000dd08:	02000513          	li	a0,32
    8000dd0c:	fffff097          	auipc	ra,0xfffff
    8000dd10:	6a0080e7          	jalr	1696(ra) # 8000d3ac <_Znwm>
    8000dd14:	00050a13          	mv	s4,a0
    8000dd18:	02050263          	beqz	a0,8000dd3c <_ZN10ForkThread3runEv+0x8c>
    8000dd1c:	01093783          	ld	a5,16(s2)
    8000dd20:	00178793          	addi	a5,a5,1
    8000dd24:	00053423          	sd	zero,8(a0)
    ForkThread(long _id) noexcept : Thread(), id(_id), finished(false) {}
    8000dd28:	00002717          	auipc	a4,0x2
    8000dd2c:	61870713          	addi	a4,a4,1560 # 80010340 <_ZTV10ForkThread+0x10>
    8000dd30:	00e53023          	sd	a4,0(a0)
    8000dd34:	00f53823          	sd	a5,16(a0)
    8000dd38:	00050c23          	sb	zero,24(a0)
        ForkThread** threads = (ForkThread** ) mem_alloc(sizeof(ForkThread*) * id);
    8000dd3c:	01093503          	ld	a0,16(s2)
    8000dd40:	00351513          	slli	a0,a0,0x3
    8000dd44:	fffff097          	auipc	ra,0xfffff
    8000dd48:	32c080e7          	jalr	812(ra) # 8000d070 <mem_alloc>
    8000dd4c:	00050993          	mv	s3,a0
        if (threads != nullptr) {
    8000dd50:	10050063          	beqz	a0,8000de50 <_ZN10ForkThread3runEv+0x1a0>
            for (long i = 0; i < id; i++) {
    8000dd54:	00000493          	li	s1,0
    8000dd58:	0140006f          	j	8000dd6c <_ZN10ForkThread3runEv+0xbc>
                threads[i] = new ForkThread(id);
    8000dd5c:	00349793          	slli	a5,s1,0x3
    8000dd60:	00f987b3          	add	a5,s3,a5
    8000dd64:	00a7b023          	sd	a0,0(a5)
            for (long i = 0; i < id; i++) {
    8000dd68:	00148493          	addi	s1,s1,1
    8000dd6c:	01093783          	ld	a5,16(s2)
    8000dd70:	02f4da63          	bge	s1,a5,8000dda4 <_ZN10ForkThread3runEv+0xf4>
                threads[i] = new ForkThread(id);
    8000dd74:	02000513          	li	a0,32
    8000dd78:	fffff097          	auipc	ra,0xfffff
    8000dd7c:	634080e7          	jalr	1588(ra) # 8000d3ac <_Znwm>
    8000dd80:	fc050ee3          	beqz	a0,8000dd5c <_ZN10ForkThread3runEv+0xac>
    8000dd84:	01093783          	ld	a5,16(s2)
    8000dd88:	00053423          	sd	zero,8(a0)
    ForkThread(long _id) noexcept : Thread(), id(_id), finished(false) {}
    8000dd8c:	00002717          	auipc	a4,0x2
    8000dd90:	5b470713          	addi	a4,a4,1460 # 80010340 <_ZTV10ForkThread+0x10>
    8000dd94:	00e53023          	sd	a4,0(a0)
    8000dd98:	00f53823          	sd	a5,16(a0)
    8000dd9c:	00050c23          	sb	zero,24(a0)
    8000dda0:	fbdff06f          	j	8000dd5c <_ZN10ForkThread3runEv+0xac>
            if (thread != nullptr) {
    8000dda4:	060a0663          	beqz	s4,8000de10 <_ZN10ForkThread3runEv+0x160>
                if (thread->start() == 0) {
    8000dda8:	000a0513          	mv	a0,s4
    8000ddac:	fffff097          	auipc	ra,0xfffff
    8000ddb0:	7a8080e7          	jalr	1960(ra) # 8000d554 <_ZN6Thread5startEv>
    8000ddb4:	00050a93          	mv	s5,a0
    8000ddb8:	04051463          	bnez	a0,8000de00 <_ZN10ForkThread3runEv+0x150>
                for (int i = 0; i < 50; i++) {
    8000ddbc:	00050493          	mv	s1,a0
    8000ddc0:	0100006f          	j	8000ddd0 <_ZN10ForkThread3runEv+0x120>
                    thread_dispatch();
    8000ddc4:	fffff097          	auipc	ra,0xfffff
    8000ddc8:	314080e7          	jalr	788(ra) # 8000d0d8 <thread_dispatch>
                for (int i = 0; i < 50; i++) {
    8000ddcc:	0014849b          	addiw	s1,s1,1
    8000ddd0:	03100793          	li	a5,49
    8000ddd4:	0097cc63          	blt	a5,s1,8000ddec <_ZN10ForkThread3runEv+0x13c>
                    for (int j = 0; j < 50; j++) {
    8000ddd8:	000a8793          	mv	a5,s5
    8000dddc:	03100713          	li	a4,49
    8000dde0:	fef742e3          	blt	a4,a5,8000ddc4 <_ZN10ForkThread3runEv+0x114>
    8000dde4:	0017879b          	addiw	a5,a5,1
    8000dde8:	ff5ff06f          	j	8000dddc <_ZN10ForkThread3runEv+0x12c>
        return finished;
    8000ddec:	018a4783          	lbu	a5,24(s4)
                    while (!thread->isFinished()) {
    8000ddf0:	00079863          	bnez	a5,8000de00 <_ZN10ForkThread3runEv+0x150>
                        thread_dispatch();
    8000ddf4:	fffff097          	auipc	ra,0xfffff
    8000ddf8:	2e4080e7          	jalr	740(ra) # 8000d0d8 <thread_dispatch>
                    while (!thread->isFinished()) {
    8000ddfc:	ff1ff06f          	j	8000ddec <_ZN10ForkThread3runEv+0x13c>
                delete thread;
    8000de00:	000a3783          	ld	a5,0(s4)
    8000de04:	0087b783          	ld	a5,8(a5)
    8000de08:	000a0513          	mv	a0,s4
    8000de0c:	000780e7          	jalr	a5
                    for (int j = 0; j < 50; j++) {
    8000de10:	00000493          	li	s1,0
    8000de14:	0140006f          	j	8000de28 <_ZN10ForkThread3runEv+0x178>
                delete threads[i];
    8000de18:	00053783          	ld	a5,0(a0)
    8000de1c:	0087b783          	ld	a5,8(a5)
    8000de20:	000780e7          	jalr	a5
            for (long i = 0; i < id; i++) {
    8000de24:	00148493          	addi	s1,s1,1
    8000de28:	01093783          	ld	a5,16(s2)
    8000de2c:	00f4dc63          	bge	s1,a5,8000de44 <_ZN10ForkThread3runEv+0x194>
                delete threads[i];
    8000de30:	00349793          	slli	a5,s1,0x3
    8000de34:	00f987b3          	add	a5,s3,a5
    8000de38:	0007b503          	ld	a0,0(a5)
    8000de3c:	fc051ee3          	bnez	a0,8000de18 <_ZN10ForkThread3runEv+0x168>
    8000de40:	fe5ff06f          	j	8000de24 <_ZN10ForkThread3runEv+0x174>
            mem_free(threads);
    8000de44:	00098513          	mv	a0,s3
    8000de48:	fffff097          	auipc	ra,0xfffff
    8000de4c:	260080e7          	jalr	608(ra) # 8000d0a8 <mem_free>
        printString("Finished thread id:"); printInt(id); printString("\n");
    8000de50:	00002517          	auipc	a0,0x2
    8000de54:	52050513          	addi	a0,a0,1312 # 80010370 <_ZTV10ForkThread+0x40>
    8000de58:	00000097          	auipc	ra,0x0
    8000de5c:	0d4080e7          	jalr	212(ra) # 8000df2c <_Z11printStringPKc>
    8000de60:	00a00593          	li	a1,10
    8000de64:	01093503          	ld	a0,16(s2)
    8000de68:	00000097          	auipc	ra,0x0
    8000de6c:	258080e7          	jalr	600(ra) # 8000e0c0 <_Z8printIntmi>
    8000de70:	00001517          	auipc	a0,0x1
    8000de74:	4e850513          	addi	a0,a0,1256 # 8000f358 <CONSOLE_STATUS+0x348>
    8000de78:	00000097          	auipc	ra,0x0
    8000de7c:	0b4080e7          	jalr	180(ra) # 8000df2c <_Z11printStringPKc>
        finished = true;
    8000de80:	00100793          	li	a5,1
    8000de84:	00f90c23          	sb	a5,24(s2)
    }
    8000de88:	03813083          	ld	ra,56(sp)
    8000de8c:	03013403          	ld	s0,48(sp)
    8000de90:	02813483          	ld	s1,40(sp)
    8000de94:	02013903          	ld	s2,32(sp)
    8000de98:	01813983          	ld	s3,24(sp)
    8000de9c:	01013a03          	ld	s4,16(sp)
    8000dea0:	00813a83          	ld	s5,8(sp)
    8000dea4:	04010113          	addi	sp,sp,64
    8000dea8:	00008067          	ret

000000008000deac <_ZN10ForkThreadD1Ev>:
class ForkThread : public Thread {
    8000deac:	ff010113          	addi	sp,sp,-16
    8000deb0:	00113423          	sd	ra,8(sp)
    8000deb4:	00813023          	sd	s0,0(sp)
    8000deb8:	01010413          	addi	s0,sp,16
    8000debc:	00002797          	auipc	a5,0x2
    8000dec0:	48478793          	addi	a5,a5,1156 # 80010340 <_ZTV10ForkThread+0x10>
    8000dec4:	00f53023          	sd	a5,0(a0)
    8000dec8:	fffff097          	auipc	ra,0xfffff
    8000decc:	534080e7          	jalr	1332(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000ded0:	00813083          	ld	ra,8(sp)
    8000ded4:	00013403          	ld	s0,0(sp)
    8000ded8:	01010113          	addi	sp,sp,16
    8000dedc:	00008067          	ret

000000008000dee0 <_ZN10ForkThreadD0Ev>:
    8000dee0:	fe010113          	addi	sp,sp,-32
    8000dee4:	00113c23          	sd	ra,24(sp)
    8000dee8:	00813823          	sd	s0,16(sp)
    8000deec:	00913423          	sd	s1,8(sp)
    8000def0:	02010413          	addi	s0,sp,32
    8000def4:	00050493          	mv	s1,a0
    8000def8:	00002797          	auipc	a5,0x2
    8000defc:	44878793          	addi	a5,a5,1096 # 80010340 <_ZTV10ForkThread+0x10>
    8000df00:	00f53023          	sd	a5,0(a0)
    8000df04:	fffff097          	auipc	ra,0xfffff
    8000df08:	4f8080e7          	jalr	1272(ra) # 8000d3fc <_ZN6ThreadD1Ev>
    8000df0c:	00048513          	mv	a0,s1
    8000df10:	fffff097          	auipc	ra,0xfffff
    8000df14:	4c4080e7          	jalr	1220(ra) # 8000d3d4 <_ZdlPv>
    8000df18:	01813083          	ld	ra,24(sp)
    8000df1c:	01013403          	ld	s0,16(sp)
    8000df20:	00813483          	ld	s1,8(sp)
    8000df24:	02010113          	addi	sp,sp,32
    8000df28:	00008067          	ret

000000008000df2c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000df2c:	fe010113          	addi	sp,sp,-32
    8000df30:	00113c23          	sd	ra,24(sp)
    8000df34:	00813823          	sd	s0,16(sp)
    8000df38:	00913423          	sd	s1,8(sp)
    8000df3c:	02010413          	addi	s0,sp,32
    8000df40:	00050493          	mv	s1,a0
    LOCK();
    8000df44:	00100613          	li	a2,1
    8000df48:	00000593          	li	a1,0
    8000df4c:	00009517          	auipc	a0,0x9
    8000df50:	0b450513          	addi	a0,a0,180 # 80017000 <lockPrint>
    8000df54:	fffff097          	auipc	ra,0xfffff
    8000df58:	0ac080e7          	jalr	172(ra) # 8000d000 <_user_text_start>
    8000df5c:	fe0514e3          	bnez	a0,8000df44 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000df60:	0004c503          	lbu	a0,0(s1)
    8000df64:	00050a63          	beqz	a0,8000df78 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    8000df68:	fffff097          	auipc	ra,0xfffff
    8000df6c:	3a4080e7          	jalr	932(ra) # 8000d30c <putc>
        string++;
    8000df70:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000df74:	fedff06f          	j	8000df60 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    8000df78:	00000613          	li	a2,0
    8000df7c:	00100593          	li	a1,1
    8000df80:	00009517          	auipc	a0,0x9
    8000df84:	08050513          	addi	a0,a0,128 # 80017000 <lockPrint>
    8000df88:	fffff097          	auipc	ra,0xfffff
    8000df8c:	078080e7          	jalr	120(ra) # 8000d000 <_user_text_start>
    8000df90:	fe0514e3          	bnez	a0,8000df78 <_Z11printStringPKc+0x4c>
}
    8000df94:	01813083          	ld	ra,24(sp)
    8000df98:	01013403          	ld	s0,16(sp)
    8000df9c:	00813483          	ld	s1,8(sp)
    8000dfa0:	02010113          	addi	sp,sp,32
    8000dfa4:	00008067          	ret

000000008000dfa8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000dfa8:	fd010113          	addi	sp,sp,-48
    8000dfac:	02113423          	sd	ra,40(sp)
    8000dfb0:	02813023          	sd	s0,32(sp)
    8000dfb4:	00913c23          	sd	s1,24(sp)
    8000dfb8:	01213823          	sd	s2,16(sp)
    8000dfbc:	01313423          	sd	s3,8(sp)
    8000dfc0:	01413023          	sd	s4,0(sp)
    8000dfc4:	03010413          	addi	s0,sp,48
    8000dfc8:	00050993          	mv	s3,a0
    8000dfcc:	00058a13          	mv	s4,a1
    LOCK();
    8000dfd0:	00100613          	li	a2,1
    8000dfd4:	00000593          	li	a1,0
    8000dfd8:	00009517          	auipc	a0,0x9
    8000dfdc:	02850513          	addi	a0,a0,40 # 80017000 <lockPrint>
    8000dfe0:	fffff097          	auipc	ra,0xfffff
    8000dfe4:	020080e7          	jalr	32(ra) # 8000d000 <_user_text_start>
    8000dfe8:	fe0514e3          	bnez	a0,8000dfd0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000dfec:	00000493          	li	s1,0
    8000dff0:	0014891b          	addiw	s2,s1,1
    8000dff4:	03495a63          	bge	s2,s4,8000e028 <_Z9getStringPci+0x80>
        cc = getc();
    8000dff8:	fffff097          	auipc	ra,0xfffff
    8000dffc:	2d8080e7          	jalr	728(ra) # 8000d2d0 <getc>
        if(cc < 1)
    8000e000:	02050463          	beqz	a0,8000e028 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    8000e004:	009984b3          	add	s1,s3,s1
    8000e008:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000e00c:	00a00793          	li	a5,10
    8000e010:	00f50a63          	beq	a0,a5,8000e024 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    8000e014:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    8000e018:	00d00793          	li	a5,13
    8000e01c:	fcf51ae3          	bne	a0,a5,8000dff0 <_Z9getStringPci+0x48>
    8000e020:	0080006f          	j	8000e028 <_Z9getStringPci+0x80>
        buf[i++] = c;
    8000e024:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000e028:	009984b3          	add	s1,s3,s1
    8000e02c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000e030:	00000613          	li	a2,0
    8000e034:	00100593          	li	a1,1
    8000e038:	00009517          	auipc	a0,0x9
    8000e03c:	fc850513          	addi	a0,a0,-56 # 80017000 <lockPrint>
    8000e040:	fffff097          	auipc	ra,0xfffff
    8000e044:	fc0080e7          	jalr	-64(ra) # 8000d000 <_user_text_start>
    8000e048:	fe0514e3          	bnez	a0,8000e030 <_Z9getStringPci+0x88>
    return buf;
}
    8000e04c:	00098513          	mv	a0,s3
    8000e050:	02813083          	ld	ra,40(sp)
    8000e054:	02013403          	ld	s0,32(sp)
    8000e058:	01813483          	ld	s1,24(sp)
    8000e05c:	01013903          	ld	s2,16(sp)
    8000e060:	00813983          	ld	s3,8(sp)
    8000e064:	00013a03          	ld	s4,0(sp)
    8000e068:	03010113          	addi	sp,sp,48
    8000e06c:	00008067          	ret

000000008000e070 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000e070:	ff010113          	addi	sp,sp,-16
    8000e074:	00813423          	sd	s0,8(sp)
    8000e078:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    8000e07c:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    8000e080:	00054603          	lbu	a2,0(a0)
    8000e084:	fd06069b          	addiw	a3,a2,-48
    8000e088:	0ff6f693          	andi	a3,a3,255
    8000e08c:	00900713          	li	a4,9
    8000e090:	02d76063          	bltu	a4,a3,8000e0b0 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    8000e094:	0027969b          	slliw	a3,a5,0x2
    8000e098:	00f687bb          	addw	a5,a3,a5
    8000e09c:	0017971b          	slliw	a4,a5,0x1
    8000e0a0:	00150513          	addi	a0,a0,1
    8000e0a4:	00c707bb          	addw	a5,a4,a2
    8000e0a8:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    8000e0ac:	fd5ff06f          	j	8000e080 <_Z11stringToIntPKc+0x10>
    return n;
}
    8000e0b0:	00078513          	mv	a0,a5
    8000e0b4:	00813403          	ld	s0,8(sp)
    8000e0b8:	01010113          	addi	sp,sp,16
    8000e0bc:	00008067          	ret

000000008000e0c0 <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    8000e0c0:	fc010113          	addi	sp,sp,-64
    8000e0c4:	02113c23          	sd	ra,56(sp)
    8000e0c8:	02813823          	sd	s0,48(sp)
    8000e0cc:	02913423          	sd	s1,40(sp)
    8000e0d0:	03213023          	sd	s2,32(sp)
    8000e0d4:	01313c23          	sd	s3,24(sp)
    8000e0d8:	04010413          	addi	s0,sp,64
    8000e0dc:	00050913          	mv	s2,a0
    8000e0e0:	00058993          	mv	s3,a1
    LOCK();
    8000e0e4:	00100613          	li	a2,1
    8000e0e8:	00000593          	li	a1,0
    8000e0ec:	00009517          	auipc	a0,0x9
    8000e0f0:	f1450513          	addi	a0,a0,-236 # 80017000 <lockPrint>
    8000e0f4:	fffff097          	auipc	ra,0xfffff
    8000e0f8:	f0c080e7          	jalr	-244(ra) # 8000d000 <_user_text_start>
    8000e0fc:	fe0514e3          	bnez	a0,8000e0e4 <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    8000e100:	00000793          	li	a5,0
    8000e104:	0080006f          	j	8000e10c <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    8000e108:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    8000e10c:	033976b3          	remu	a3,s2,s3
    8000e110:	0017849b          	addiw	s1,a5,1
    8000e114:	00006717          	auipc	a4,0x6
    8000e118:	eec70713          	addi	a4,a4,-276 # 80014000 <digits>
    8000e11c:	00d70733          	add	a4,a4,a3
    8000e120:	00074703          	lbu	a4,0(a4)
    8000e124:	fd040693          	addi	a3,s0,-48
    8000e128:	00f687b3          	add	a5,a3,a5
    8000e12c:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    8000e130:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    8000e134:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    8000e138:	fd3978e3          	bgeu	s2,s3,8000e108 <_Z8printIntmi+0x48>

    while(--i >= 0)
    8000e13c:	fff4849b          	addiw	s1,s1,-1
    8000e140:	0004ce63          	bltz	s1,8000e15c <_Z8printIntmi+0x9c>
        putc(buf[i]);
    8000e144:	fd040793          	addi	a5,s0,-48
    8000e148:	009787b3          	add	a5,a5,s1
    8000e14c:	ff07c503          	lbu	a0,-16(a5)
    8000e150:	fffff097          	auipc	ra,0xfffff
    8000e154:	1bc080e7          	jalr	444(ra) # 8000d30c <putc>
    8000e158:	fe5ff06f          	j	8000e13c <_Z8printIntmi+0x7c>

    UNLOCK();
    8000e15c:	00000613          	li	a2,0
    8000e160:	00100593          	li	a1,1
    8000e164:	00009517          	auipc	a0,0x9
    8000e168:	e9c50513          	addi	a0,a0,-356 # 80017000 <lockPrint>
    8000e16c:	fffff097          	auipc	ra,0xfffff
    8000e170:	e94080e7          	jalr	-364(ra) # 8000d000 <_user_text_start>
    8000e174:	fe0514e3          	bnez	a0,8000e15c <_Z8printIntmi+0x9c>
    8000e178:	03813083          	ld	ra,56(sp)
    8000e17c:	03013403          	ld	s0,48(sp)
    8000e180:	02813483          	ld	s1,40(sp)
    8000e184:	02013903          	ld	s2,32(sp)
    8000e188:	01813983          	ld	s3,24(sp)
    8000e18c:	04010113          	addi	sp,sp,64
    8000e190:	00008067          	ret

000000008000e194 <_user_text_end>:
	...
