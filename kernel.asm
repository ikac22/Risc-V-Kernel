
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	cd013103          	ld	sp,-816(sp) # 80009cd0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	739040ef          	jal	ra,80004f54 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <interruptvec>:
.globl interrupt
.globl interruptvec
.align 4
interruptvec:

addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00213823          	sd	sp,16(sp)
    8000100c:	00313c23          	sd	gp,24(sp)
    80001010:	02413023          	sd	tp,32(sp)
    80001014:	02513423          	sd	t0,40(sp)
    80001018:	02613823          	sd	t1,48(sp)
    8000101c:	02713c23          	sd	t2,56(sp)
    80001020:	04813023          	sd	s0,64(sp)
    80001024:	04913423          	sd	s1,72(sp)
    80001028:	04a13823          	sd	a0,80(sp)
    8000102c:	04b13c23          	sd	a1,88(sp)
    80001030:	06c13023          	sd	a2,96(sp)
    80001034:	06d13423          	sd	a3,104(sp)
    80001038:	06e13823          	sd	a4,112(sp)
    8000103c:	06f13c23          	sd	a5,120(sp)
    80001040:	09013023          	sd	a6,128(sp)
    80001044:	09113423          	sd	a7,136(sp)
    80001048:	09213823          	sd	s2,144(sp)
    8000104c:	09313c23          	sd	s3,152(sp)
    80001050:	0b413023          	sd	s4,160(sp)
    80001054:	0b513423          	sd	s5,168(sp)
    80001058:	0b613823          	sd	s6,176(sp)
    8000105c:	0b713c23          	sd	s7,184(sp)
    80001060:	0d813023          	sd	s8,192(sp)
    80001064:	0d913423          	sd	s9,200(sp)
    80001068:	0da13823          	sd	s10,208(sp)
    8000106c:	0db13c23          	sd	s11,216(sp)
    80001070:	0fc13023          	sd	t3,224(sp)
    80001074:	0fd13423          	sd	t4,232(sp)
    80001078:	0fe13823          	sd	t5,240(sp)
    8000107c:	0ff13c23          	sd	t6,248(sp)

call interrupt
    80001080:	130010ef          	jal	ra,800021b0 <interrupt>

.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    80001084:	00813083          	ld	ra,8(sp)
    80001088:	01013103          	ld	sp,16(sp)
    8000108c:	01813183          	ld	gp,24(sp)
    80001090:	02013203          	ld	tp,32(sp)
    80001094:	02813283          	ld	t0,40(sp)
    80001098:	03013303          	ld	t1,48(sp)
    8000109c:	03813383          	ld	t2,56(sp)
    800010a0:	04013403          	ld	s0,64(sp)
    800010a4:	04813483          	ld	s1,72(sp)
    800010a8:	05013503          	ld	a0,80(sp)
    800010ac:	05813583          	ld	a1,88(sp)
    800010b0:	06013603          	ld	a2,96(sp)
    800010b4:	06813683          	ld	a3,104(sp)
    800010b8:	07013703          	ld	a4,112(sp)
    800010bc:	07813783          	ld	a5,120(sp)
    800010c0:	08013803          	ld	a6,128(sp)
    800010c4:	08813883          	ld	a7,136(sp)
    800010c8:	09013903          	ld	s2,144(sp)
    800010cc:	09813983          	ld	s3,152(sp)
    800010d0:	0a013a03          	ld	s4,160(sp)
    800010d4:	0a813a83          	ld	s5,168(sp)
    800010d8:	0b013b03          	ld	s6,176(sp)
    800010dc:	0b813b83          	ld	s7,184(sp)
    800010e0:	0c013c03          	ld	s8,192(sp)
    800010e4:	0c813c83          	ld	s9,200(sp)
    800010e8:	0d013d03          	ld	s10,208(sp)
    800010ec:	0d813d83          	ld	s11,216(sp)
    800010f0:	0e013e03          	ld	t3,224(sp)
    800010f4:	0e813e83          	ld	t4,232(sp)
    800010f8:	0f013f03          	ld	t5,240(sp)
    800010fc:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    80001100:	10010113          	addi	sp,sp,256



sret
    80001104:	10200073          	sret
	...

0000000080001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:

.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
sd ra, 0 * 8(a0)
    80001110:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
sd sp, 1 * 8(a0)
    80001114:	00253423          	sd	sp,8(a0)

ld ra, 0 * 8(a1)
    80001118:	0005b083          	ld	ra,0(a1)
ld sp, 1 * 8(a1)
    8000111c:	0085b103          	ld	sp,8(a1)

ret
    80001120:	00008067          	ret

0000000080001124 <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
addi sp, sp, -256
    80001124:	f0010113          	addi	sp,sp,-256
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80001128:	00313c23          	sd	gp,24(sp)
    8000112c:	02413023          	sd	tp,32(sp)
    80001130:	02513423          	sd	t0,40(sp)
    80001134:	02613823          	sd	t1,48(sp)
    80001138:	02713c23          	sd	t2,56(sp)
    8000113c:	04813023          	sd	s0,64(sp)
    80001140:	04913423          	sd	s1,72(sp)
    80001144:	04a13823          	sd	a0,80(sp)
    80001148:	04b13c23          	sd	a1,88(sp)
    8000114c:	06c13023          	sd	a2,96(sp)
    80001150:	06d13423          	sd	a3,104(sp)
    80001154:	06e13823          	sd	a4,112(sp)
    80001158:	06f13c23          	sd	a5,120(sp)
    8000115c:	09013023          	sd	a6,128(sp)
    80001160:	09113423          	sd	a7,136(sp)
    80001164:	09213823          	sd	s2,144(sp)
    80001168:	09313c23          	sd	s3,152(sp)
    8000116c:	0b413023          	sd	s4,160(sp)
    80001170:	0b513423          	sd	s5,168(sp)
    80001174:	0b613823          	sd	s6,176(sp)
    80001178:	0b713c23          	sd	s7,184(sp)
    8000117c:	0d813023          	sd	s8,192(sp)
    80001180:	0d913423          	sd	s9,200(sp)
    80001184:	0da13823          	sd	s10,208(sp)
    80001188:	0db13c23          	sd	s11,216(sp)
    8000118c:	0fc13023          	sd	t3,224(sp)
    80001190:	0fd13423          	sd	t4,232(sp)
    80001194:	0fe13823          	sd	t5,240(sp)
    80001198:	0ff13c23          	sd	t6,248(sp)
ret
    8000119c:	00008067          	ret

00000000800011a0 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800011a0:	01813183          	ld	gp,24(sp)
    800011a4:	02013203          	ld	tp,32(sp)
    800011a8:	02813283          	ld	t0,40(sp)
    800011ac:	03013303          	ld	t1,48(sp)
    800011b0:	03813383          	ld	t2,56(sp)
    800011b4:	04013403          	ld	s0,64(sp)
    800011b8:	04813483          	ld	s1,72(sp)
    800011bc:	05013503          	ld	a0,80(sp)
    800011c0:	05813583          	ld	a1,88(sp)
    800011c4:	06013603          	ld	a2,96(sp)
    800011c8:	06813683          	ld	a3,104(sp)
    800011cc:	07013703          	ld	a4,112(sp)
    800011d0:	07813783          	ld	a5,120(sp)
    800011d4:	08013803          	ld	a6,128(sp)
    800011d8:	08813883          	ld	a7,136(sp)
    800011dc:	09013903          	ld	s2,144(sp)
    800011e0:	09813983          	ld	s3,152(sp)
    800011e4:	0a013a03          	ld	s4,160(sp)
    800011e8:	0a813a83          	ld	s5,168(sp)
    800011ec:	0b013b03          	ld	s6,176(sp)
    800011f0:	0b813b83          	ld	s7,184(sp)
    800011f4:	0c013c03          	ld	s8,192(sp)
    800011f8:	0c813c83          	ld	s9,200(sp)
    800011fc:	0d013d03          	ld	s10,208(sp)
    80001200:	0d813d83          	ld	s11,216(sp)
    80001204:	0e013e03          	ld	t3,224(sp)
    80001208:	0e813e83          	ld	t4,232(sp)
    8000120c:	0f013f03          	ld	t5,240(sp)
    80001210:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    80001214:	10010113          	addi	sp,sp,256
ret
    80001218:	00008067          	ret

000000008000121c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000121c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001220:	00b29a63          	bne	t0,a1,80001234 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001224:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001228:	fe029ae3          	bnez	t0,8000121c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000122c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001230:	00008067          	ret

0000000080001234 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001234:	00100513          	li	a0,1
    80001238:	00008067          	ret

000000008000123c <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    8000123c:	f9010113          	addi	sp,sp,-112
    80001240:	06113423          	sd	ra,104(sp)
    80001244:	06813023          	sd	s0,96(sp)
    80001248:	04913c23          	sd	s1,88(sp)
    8000124c:	05213823          	sd	s2,80(sp)
    80001250:	05313423          	sd	s3,72(sp)
    80001254:	05413023          	sd	s4,64(sp)
    80001258:	03513c23          	sd	s5,56(sp)
    8000125c:	03613823          	sd	s6,48(sp)
    80001260:	03713423          	sd	s7,40(sp)
    80001264:	03813023          	sd	s8,32(sp)
    80001268:	07010413          	addi	s0,sp,112
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    8000126c:	00010b93          	mv	s7,sp
        printString("Unesite broj proizvodjaca?\n");
    80001270:	00007517          	auipc	a0,0x7
    80001274:	e7050513          	addi	a0,a0,-400 # 800080e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    80001278:	00004097          	auipc	ra,0x4
    8000127c:	a2c080e7          	jalr	-1492(ra) # 80004ca4 <_Z11printStringPKc>
        getString(input, 30);
    80001280:	01e00593          	li	a1,30
    80001284:	f9040513          	addi	a0,s0,-112
    80001288:	00004097          	auipc	ra,0x4
    8000128c:	a98080e7          	jalr	-1384(ra) # 80004d20 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80001290:	f9040513          	addi	a0,s0,-112
    80001294:	00004097          	auipc	ra,0x4
    80001298:	b54080e7          	jalr	-1196(ra) # 80004de8 <_Z11stringToIntPKc>
    8000129c:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    800012a0:	00007517          	auipc	a0,0x7
    800012a4:	e6050513          	addi	a0,a0,-416 # 80008100 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    800012a8:	00004097          	auipc	ra,0x4
    800012ac:	9fc080e7          	jalr	-1540(ra) # 80004ca4 <_Z11printStringPKc>
        getString(input, 30);
    800012b0:	01e00593          	li	a1,30
    800012b4:	f9040513          	addi	a0,s0,-112
    800012b8:	00004097          	auipc	ra,0x4
    800012bc:	a68080e7          	jalr	-1432(ra) # 80004d20 <_Z9getStringPci>
        n = stringToInt(input);
    800012c0:	f9040513          	addi	a0,s0,-112
    800012c4:	00004097          	auipc	ra,0x4
    800012c8:	b24080e7          	jalr	-1244(ra) # 80004de8 <_Z11stringToIntPKc>
    800012cc:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    800012d0:	00007517          	auipc	a0,0x7
    800012d4:	e5050513          	addi	a0,a0,-432 # 80008120 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    800012d8:	00004097          	auipc	ra,0x4
    800012dc:	9cc080e7          	jalr	-1588(ra) # 80004ca4 <_Z11printStringPKc>
    800012e0:	00000613          	li	a2,0
    800012e4:	00a00593          	li	a1,10
    800012e8:	00098513          	mv	a0,s3
    800012ec:	00004097          	auipc	ra,0x4
    800012f0:	b4c080e7          	jalr	-1204(ra) # 80004e38 <_Z8printIntiii>
        printString(" i velicina bafera "); printInt(n);
    800012f4:	00007517          	auipc	a0,0x7
    800012f8:	e4450513          	addi	a0,a0,-444 # 80008138 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    800012fc:	00004097          	auipc	ra,0x4
    80001300:	9a8080e7          	jalr	-1624(ra) # 80004ca4 <_Z11printStringPKc>
    80001304:	00000613          	li	a2,0
    80001308:	00a00593          	li	a1,10
    8000130c:	00048513          	mv	a0,s1
    80001310:	00004097          	auipc	ra,0x4
    80001314:	b28080e7          	jalr	-1240(ra) # 80004e38 <_Z8printIntiii>
        printString(".\n");
    80001318:	00007517          	auipc	a0,0x7
    8000131c:	e3850513          	addi	a0,a0,-456 # 80008150 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    80001320:	00004097          	auipc	ra,0x4
    80001324:	984080e7          	jalr	-1660(ra) # 80004ca4 <_Z11printStringPKc>
        if(threadNum > n) {
    80001328:	0334c463          	blt	s1,s3,80001350 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x114>
        } else if (threadNum < 1) {
    8000132c:	03305c63          	blez	s3,80001364 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x128>
        BufferCPP *buffer = new BufferCPP(n);
    80001330:	03800513          	li	a0,56
    80001334:	00003097          	auipc	ra,0x3
    80001338:	d4c080e7          	jalr	-692(ra) # 80004080 <_Znwm>
    8000133c:	00050a93          	mv	s5,a0
    80001340:	00048593          	mv	a1,s1
    80001344:	00003097          	auipc	ra,0x3
    80001348:	4f8080e7          	jalr	1272(ra) # 8000483c <_ZN9BufferCPPC1Ei>
    8000134c:	0300006f          	j	8000137c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x140>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80001350:	00007517          	auipc	a0,0x7
    80001354:	e0850513          	addi	a0,a0,-504 # 80008158 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    80001358:	00004097          	auipc	ra,0x4
    8000135c:	94c080e7          	jalr	-1716(ra) # 80004ca4 <_Z11printStringPKc>
            return;
    80001360:	0140006f          	j	80001374 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x138>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80001364:	00007517          	auipc	a0,0x7
    80001368:	e3450513          	addi	a0,a0,-460 # 80008198 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    8000136c:	00004097          	auipc	ra,0x4
    80001370:	938080e7          	jalr	-1736(ra) # 80004ca4 <_Z11printStringPKc>
            return;
    80001374:	000b8113          	mv	sp,s7
    80001378:	2200006f          	j	80001598 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x35c>
        waitForAll = new Semaphore(0);
    8000137c:	01000513          	li	a0,16
    80001380:	00003097          	auipc	ra,0x3
    80001384:	d00080e7          	jalr	-768(ra) # 80004080 <_Znwm>
    80001388:	00050493          	mv	s1,a0
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000138c:	00007797          	auipc	a5,0x7
    80001390:	ccc78793          	addi	a5,a5,-820 # 80008058 <_ZTV9Semaphore+0x10>
    80001394:	00f53023          	sd	a5,0(a0)
    80001398:	00000593          	li	a1,0
    8000139c:	00850513          	addi	a0,a0,8
    800013a0:	00002097          	auipc	ra,0x2
    800013a4:	5c0080e7          	jalr	1472(ra) # 80003960 <sem_open>
    800013a8:	00009917          	auipc	s2,0x9
    800013ac:	b1090913          	addi	s2,s2,-1264 # 80009eb8 <_ZN19ConsumerProducerCPP10waitForAllE>
    800013b0:	00993023          	sd	s1,0(s2)
        Thread *producers[threadNum];
    800013b4:	00399793          	slli	a5,s3,0x3
    800013b8:	00f78793          	addi	a5,a5,15
    800013bc:	ff07f793          	andi	a5,a5,-16
    800013c0:	40f10133          	sub	sp,sp,a5
    800013c4:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    800013c8:	0019879b          	addiw	a5,s3,1
    800013cc:	00179713          	slli	a4,a5,0x1
    800013d0:	00f70733          	add	a4,a4,a5
    800013d4:	00371793          	slli	a5,a4,0x3
    800013d8:	00f78793          	addi	a5,a5,15
    800013dc:	ff07f793          	andi	a5,a5,-16
    800013e0:	40f10133          	sub	sp,sp,a5
    800013e4:	00010c13          	mv	s8,sp
        threadData[threadNum].id = threadNum;
    800013e8:	00199793          	slli	a5,s3,0x1
    800013ec:	013787b3          	add	a5,a5,s3
    800013f0:	00379493          	slli	s1,a5,0x3
    800013f4:	009c04b3          	add	s1,s8,s1
    800013f8:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    800013fc:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    80001400:	00093783          	ld	a5,0(s2)
    80001404:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80001408:	02000513          	li	a0,32
    8000140c:	00003097          	auipc	ra,0x3
    80001410:	c74080e7          	jalr	-908(ra) # 80004080 <_Znwm>
    80001414:	00050b13          	mv	s6,a0
    Thread (){ myHandle = nullptr; this->w = nullptr;}
    80001418:	00053423          	sd	zero,8(a0)
    8000141c:	00053823          	sd	zero,16(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    80001420:	00007797          	auipc	a5,0x7
    80001424:	ca878793          	addi	a5,a5,-856 # 800080c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80001428:	00f53023          	sd	a5,0(a0)
    8000142c:	00953c23          	sd	s1,24(a0)
        consumer->start();
    80001430:	00003097          	auipc	ra,0x3
    80001434:	d5c080e7          	jalr	-676(ra) # 8000418c <_ZN6Thread5startEv>
        threadData[0].id = 0;
    80001438:	000c2023          	sw	zero,0(s8)
        threadData[0].buffer = buffer;
    8000143c:	015c3423          	sd	s5,8(s8)
        threadData[0].sem = waitForAll;
    80001440:	00093783          	ld	a5,0(s2)
    80001444:	00fc3823          	sd	a5,16(s8)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80001448:	02000513          	li	a0,32
    8000144c:	00003097          	auipc	ra,0x3
    80001450:	c34080e7          	jalr	-972(ra) # 80004080 <_Znwm>
    80001454:	00053423          	sd	zero,8(a0)
    80001458:	00053823          	sd	zero,16(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000145c:	00007717          	auipc	a4,0x7
    80001460:	c1c70713          	addi	a4,a4,-996 # 80008078 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80001464:	00e53023          	sd	a4,0(a0)
    80001468:	01853c23          	sd	s8,24(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    8000146c:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    80001470:	00003097          	auipc	ra,0x3
    80001474:	d1c080e7          	jalr	-740(ra) # 8000418c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80001478:	00100913          	li	s2,1
    8000147c:	07395663          	bge	s2,s3,800014e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ac>
            threadData[i].id = i;
    80001480:	00191793          	slli	a5,s2,0x1
    80001484:	012787b3          	add	a5,a5,s2
    80001488:	00379493          	slli	s1,a5,0x3
    8000148c:	009c04b3          	add	s1,s8,s1
    80001490:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    80001494:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    80001498:	00009797          	auipc	a5,0x9
    8000149c:	a2078793          	addi	a5,a5,-1504 # 80009eb8 <_ZN19ConsumerProducerCPP10waitForAllE>
    800014a0:	0007b783          	ld	a5,0(a5)
    800014a4:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    800014a8:	02000513          	li	a0,32
    800014ac:	00003097          	auipc	ra,0x3
    800014b0:	bd4080e7          	jalr	-1068(ra) # 80004080 <_Znwm>
    800014b4:	00053423          	sd	zero,8(a0)
    800014b8:	00053823          	sd	zero,16(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    800014bc:	00007717          	auipc	a4,0x7
    800014c0:	be470713          	addi	a4,a4,-1052 # 800080a0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    800014c4:	00e53023          	sd	a4,0(a0)
    800014c8:	00953c23          	sd	s1,24(a0)
            producers[i] = new Producer(&threadData[i]);
    800014cc:	00391713          	slli	a4,s2,0x3
    800014d0:	00ea0733          	add	a4,s4,a4
    800014d4:	00a73023          	sd	a0,0(a4)
            producers[i]->start();
    800014d8:	00003097          	auipc	ra,0x3
    800014dc:	cb4080e7          	jalr	-844(ra) # 8000418c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    800014e0:	0019091b          	addiw	s2,s2,1
    800014e4:	f99ff06f          	j	8000147c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x240>
    static void dispatch () { thread_dispatch(); }
    800014e8:	00002097          	auipc	ra,0x2
    800014ec:	39c080e7          	jalr	924(ra) # 80003884 <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    800014f0:	00000493          	li	s1,0
    800014f4:	0299c263          	blt	s3,s1,80001518 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2dc>
            waitForAll->wait();
    800014f8:	00009797          	auipc	a5,0x9
    800014fc:	9c078793          	addi	a5,a5,-1600 # 80009eb8 <_ZN19ConsumerProducerCPP10waitForAllE>
    80001500:	0007b783          	ld	a5,0(a5)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80001504:	0087b503          	ld	a0,8(a5)
    80001508:	00002097          	auipc	ra,0x2
    8000150c:	4cc080e7          	jalr	1228(ra) # 800039d4 <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    80001510:	0014849b          	addiw	s1,s1,1
    80001514:	fe1ff06f          	j	800014f4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2b8>
        delete waitForAll;
    80001518:	00009797          	auipc	a5,0x9
    8000151c:	9a078793          	addi	a5,a5,-1632 # 80009eb8 <_ZN19ConsumerProducerCPP10waitForAllE>
    80001520:	0007b503          	ld	a0,0(a5)
    80001524:	00050863          	beqz	a0,80001534 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f8>
    80001528:	00053783          	ld	a5,0(a0)
    8000152c:	0087b783          	ld	a5,8(a5)
    80001530:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    80001534:	00000493          	li	s1,0
    80001538:	0080006f          	j	80001540 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x304>
        for (int i = 0; i < threadNum; i++) {
    8000153c:	0014849b          	addiw	s1,s1,1
    80001540:	0334d263          	bge	s1,s3,80001564 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x328>
            delete producers[i];
    80001544:	00349793          	slli	a5,s1,0x3
    80001548:	00fa07b3          	add	a5,s4,a5
    8000154c:	0007b503          	ld	a0,0(a5)
    80001550:	fe0506e3          	beqz	a0,8000153c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x300>
    80001554:	00053783          	ld	a5,0(a0)
    80001558:	0087b783          	ld	a5,8(a5)
    8000155c:	000780e7          	jalr	a5
    80001560:	fddff06f          	j	8000153c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x300>
        delete consumer;
    80001564:	000b0a63          	beqz	s6,80001578 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x33c>
    80001568:	000b3783          	ld	a5,0(s6)
    8000156c:	0087b783          	ld	a5,8(a5)
    80001570:	000b0513          	mv	a0,s6
    80001574:	000780e7          	jalr	a5
        delete buffer;
    80001578:	000a8e63          	beqz	s5,80001594 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x358>
    8000157c:	000a8513          	mv	a0,s5
    80001580:	00003097          	auipc	ra,0x3
    80001584:	624080e7          	jalr	1572(ra) # 80004ba4 <_ZN9BufferCPPD1Ev>
    80001588:	000a8513          	mv	a0,s5
    8000158c:	00003097          	auipc	ra,0x3
    80001590:	b1c080e7          	jalr	-1252(ra) # 800040a8 <_ZdlPv>
    80001594:	000b8113          	mv	sp,s7
    }
    80001598:	f9040113          	addi	sp,s0,-112
    8000159c:	06813083          	ld	ra,104(sp)
    800015a0:	06013403          	ld	s0,96(sp)
    800015a4:	05813483          	ld	s1,88(sp)
    800015a8:	05013903          	ld	s2,80(sp)
    800015ac:	04813983          	ld	s3,72(sp)
    800015b0:	04013a03          	ld	s4,64(sp)
    800015b4:	03813a83          	ld	s5,56(sp)
    800015b8:	03013b03          	ld	s6,48(sp)
    800015bc:	02813b83          	ld	s7,40(sp)
    800015c0:	02013c03          	ld	s8,32(sp)
    800015c4:	07010113          	addi	sp,sp,112
    800015c8:	00008067          	ret
    800015cc:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    800015d0:	000a8513          	mv	a0,s5
    800015d4:	00003097          	auipc	ra,0x3
    800015d8:	ad4080e7          	jalr	-1324(ra) # 800040a8 <_ZdlPv>
    800015dc:	00048513          	mv	a0,s1
    800015e0:	0000a097          	auipc	ra,0xa
    800015e4:	a58080e7          	jalr	-1448(ra) # 8000b038 <_Unwind_Resume>
    800015e8:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    800015ec:	00048513          	mv	a0,s1
    800015f0:	00003097          	auipc	ra,0x3
    800015f4:	ab8080e7          	jalr	-1352(ra) # 800040a8 <_ZdlPv>
    800015f8:	00090513          	mv	a0,s2
    800015fc:	0000a097          	auipc	ra,0xa
    80001600:	a3c080e7          	jalr	-1476(ra) # 8000b038 <_Unwind_Resume>

0000000080001604 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
//#include"../h/testing.hpp"
void userMain() {
    80001604:	fe010113          	addi	sp,sp,-32
    80001608:	00113c23          	sd	ra,24(sp)
    8000160c:	00813823          	sd	s0,16(sp)
    80001610:	00913423          	sd	s1,8(sp)
    80001614:	02010413          	addi	s0,sp,32
    //NZM? producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    //NZM? ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    //testPeriodicWorker();
    for(int i = 0; i < 200000; i++)
    80001618:	00000493          	li	s1,0
    8000161c:	000317b7          	lui	a5,0x31
    80001620:	d3f78793          	addi	a5,a5,-705 # 30d3f <_entry-0x7ffcf2c1>
    80001624:	0097cc63          	blt	a5,s1,8000163c <_Z8userMainv+0x38>
        mem_alloc(64);
    80001628:	04000513          	li	a0,64
    8000162c:	00002097          	auipc	ra,0x2
    80001630:	1f0080e7          	jalr	496(ra) # 8000381c <mem_alloc>
    for(int i = 0; i < 200000; i++)
    80001634:	0014849b          	addiw	s1,s1,1
    80001638:	fe5ff06f          	j	8000161c <_Z8userMainv+0x18>
    8000163c:	01813083          	ld	ra,24(sp)
    80001640:	01013403          	ld	s0,16(sp)
    80001644:	00813483          	ld	s1,8(sp)
    80001648:	02010113          	addi	sp,sp,32
    8000164c:	00008067          	ret

0000000080001650 <_ZN6ThreadD1Ev>:
    virtual ~Thread (){ delete myHandle; }
    80001650:	ff010113          	addi	sp,sp,-16
    80001654:	00813423          	sd	s0,8(sp)
    80001658:	01010413          	addi	s0,sp,16
    8000165c:	00007797          	auipc	a5,0x7
    80001660:	9d478793          	addi	a5,a5,-1580 # 80008030 <_ZTV6Thread+0x10>
    80001664:	00f53023          	sd	a5,0(a0)
    80001668:	00853783          	ld	a5,8(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    8000166c:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001670:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001674:	00000073          	ecall
    80001678:	00813403          	ld	s0,8(sp)
    8000167c:	01010113          	addi	sp,sp,16
    80001680:	00008067          	ret

0000000080001684 <_ZN6Thread3runEv>:
    virtual void run () {}
    80001684:	ff010113          	addi	sp,sp,-16
    80001688:	00813423          	sd	s0,8(sp)
    8000168c:	01010413          	addi	s0,sp,16
    80001690:	00813403          	ld	s0,8(sp)
    80001694:	01010113          	addi	sp,sp,16
    80001698:	00008067          	ret

000000008000169c <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    8000169c:	ff010113          	addi	sp,sp,-16
    800016a0:	00813423          	sd	s0,8(sp)
    800016a4:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    800016a8:	00007797          	auipc	a5,0x7
    800016ac:	98878793          	addi	a5,a5,-1656 # 80008030 <_ZTV6Thread+0x10>
    800016b0:	00f53023          	sd	a5,0(a0)
    800016b4:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800016b8:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800016bc:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800016c0:	00000073          	ecall
    800016c4:	00813403          	ld	s0,8(sp)
    800016c8:	01010113          	addi	sp,sp,16
    800016cc:	00008067          	ret

00000000800016d0 <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    800016d0:	ff010113          	addi	sp,sp,-16
    800016d4:	00813423          	sd	s0,8(sp)
    800016d8:	01010413          	addi	s0,sp,16
    800016dc:	00007797          	auipc	a5,0x7
    800016e0:	95478793          	addi	a5,a5,-1708 # 80008030 <_ZTV6Thread+0x10>
    800016e4:	00f53023          	sd	a5,0(a0)
    800016e8:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800016ec:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800016f0:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800016f4:	00000073          	ecall
    800016f8:	00813403          	ld	s0,8(sp)
    800016fc:	01010113          	addi	sp,sp,16
    80001700:	00008067          	ret

0000000080001704 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    80001704:	ff010113          	addi	sp,sp,-16
    80001708:	00813423          	sd	s0,8(sp)
    8000170c:	01010413          	addi	s0,sp,16
    80001710:	00007797          	auipc	a5,0x7
    80001714:	92078793          	addi	a5,a5,-1760 # 80008030 <_ZTV6Thread+0x10>
    80001718:	00f53023          	sd	a5,0(a0)
    8000171c:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001720:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001724:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001728:	00000073          	ecall
    8000172c:	00813403          	ld	s0,8(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret

0000000080001738 <_ZN6ThreadD0Ev>:
    80001738:	ff010113          	addi	sp,sp,-16
    8000173c:	00113423          	sd	ra,8(sp)
    80001740:	00813023          	sd	s0,0(sp)
    80001744:	01010413          	addi	s0,sp,16
    80001748:	00007717          	auipc	a4,0x7
    8000174c:	8e870713          	addi	a4,a4,-1816 # 80008030 <_ZTV6Thread+0x10>
    80001750:	00e53023          	sd	a4,0(a0)
    80001754:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001758:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    8000175c:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001760:	00000073          	ecall
    80001764:	00003097          	auipc	ra,0x3
    80001768:	944080e7          	jalr	-1724(ra) # 800040a8 <_ZdlPv>
    8000176c:	00813083          	ld	ra,8(sp)
    80001770:	00013403          	ld	s0,0(sp)
    80001774:	01010113          	addi	sp,sp,16
    80001778:	00008067          	ret

000000008000177c <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    class Consumer : public Thread {
    8000177c:	ff010113          	addi	sp,sp,-16
    80001780:	00113423          	sd	ra,8(sp)
    80001784:	00813023          	sd	s0,0(sp)
    80001788:	01010413          	addi	s0,sp,16
    8000178c:	00007717          	auipc	a4,0x7
    80001790:	8a470713          	addi	a4,a4,-1884 # 80008030 <_ZTV6Thread+0x10>
    80001794:	00e53023          	sd	a4,0(a0)
    80001798:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    8000179c:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800017a0:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800017a4:	00000073          	ecall
    800017a8:	00003097          	auipc	ra,0x3
    800017ac:	900080e7          	jalr	-1792(ra) # 800040a8 <_ZdlPv>
    800017b0:	00813083          	ld	ra,8(sp)
    800017b4:	00013403          	ld	s0,0(sp)
    800017b8:	01010113          	addi	sp,sp,16
    800017bc:	00008067          	ret

00000000800017c0 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    class ProducerKeyborad : public Thread {
    800017c0:	ff010113          	addi	sp,sp,-16
    800017c4:	00113423          	sd	ra,8(sp)
    800017c8:	00813023          	sd	s0,0(sp)
    800017cc:	01010413          	addi	s0,sp,16
    800017d0:	00007717          	auipc	a4,0x7
    800017d4:	86070713          	addi	a4,a4,-1952 # 80008030 <_ZTV6Thread+0x10>
    800017d8:	00e53023          	sd	a4,0(a0)
    800017dc:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800017e0:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800017e4:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800017e8:	00000073          	ecall
    800017ec:	00003097          	auipc	ra,0x3
    800017f0:	8bc080e7          	jalr	-1860(ra) # 800040a8 <_ZdlPv>
    800017f4:	00813083          	ld	ra,8(sp)
    800017f8:	00013403          	ld	s0,0(sp)
    800017fc:	01010113          	addi	sp,sp,16
    80001800:	00008067          	ret

0000000080001804 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    class Producer : public Thread {
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00113423          	sd	ra,8(sp)
    8000180c:	00813023          	sd	s0,0(sp)
    80001810:	01010413          	addi	s0,sp,16
    80001814:	00007717          	auipc	a4,0x7
    80001818:	81c70713          	addi	a4,a4,-2020 # 80008030 <_ZTV6Thread+0x10>
    8000181c:	00e53023          	sd	a4,0(a0)
    80001820:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001824:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001828:	00078593          	mv	a1,a5
        asm volatile("ecall");
    8000182c:	00000073          	ecall
    80001830:	00003097          	auipc	ra,0x3
    80001834:	878080e7          	jalr	-1928(ra) # 800040a8 <_ZdlPv>
    80001838:	00813083          	ld	ra,8(sp)
    8000183c:	00013403          	ld	s0,0(sp)
    80001840:	01010113          	addi	sp,sp,16
    80001844:	00008067          	ret

0000000080001848 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    80001848:	ff010113          	addi	sp,sp,-16
    8000184c:	00113423          	sd	ra,8(sp)
    80001850:	00813023          	sd	s0,0(sp)
    80001854:	01010413          	addi	s0,sp,16
    80001858:	00007797          	auipc	a5,0x7
    8000185c:	80078793          	addi	a5,a5,-2048 # 80008058 <_ZTV9Semaphore+0x10>
    80001860:	00f53023          	sd	a5,0(a0)
    80001864:	00853503          	ld	a0,8(a0)
    80001868:	00002097          	auipc	ra,0x2
    8000186c:	134080e7          	jalr	308(ra) # 8000399c <sem_close>
    80001870:	00813083          	ld	ra,8(sp)
    80001874:	00013403          	ld	s0,0(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_ZN9SemaphoreD0Ev>:
    80001880:	fe010113          	addi	sp,sp,-32
    80001884:	00113c23          	sd	ra,24(sp)
    80001888:	00813823          	sd	s0,16(sp)
    8000188c:	00913423          	sd	s1,8(sp)
    80001890:	02010413          	addi	s0,sp,32
    80001894:	00050493          	mv	s1,a0
    80001898:	00006797          	auipc	a5,0x6
    8000189c:	7c078793          	addi	a5,a5,1984 # 80008058 <_ZTV9Semaphore+0x10>
    800018a0:	00f53023          	sd	a5,0(a0)
    800018a4:	00853503          	ld	a0,8(a0)
    800018a8:	00002097          	auipc	ra,0x2
    800018ac:	0f4080e7          	jalr	244(ra) # 8000399c <sem_close>
    800018b0:	00048513          	mv	a0,s1
    800018b4:	00002097          	auipc	ra,0x2
    800018b8:	7f4080e7          	jalr	2036(ra) # 800040a8 <_ZdlPv>
    800018bc:	01813083          	ld	ra,24(sp)
    800018c0:	01013403          	ld	s0,16(sp)
    800018c4:	00813483          	ld	s1,8(sp)
    800018c8:	02010113          	addi	sp,sp,32
    800018cc:	00008067          	ret

00000000800018d0 <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    800018d0:	fd010113          	addi	sp,sp,-48
    800018d4:	02113423          	sd	ra,40(sp)
    800018d8:	02813023          	sd	s0,32(sp)
    800018dc:	00913c23          	sd	s1,24(sp)
    800018e0:	01213823          	sd	s2,16(sp)
    800018e4:	01313423          	sd	s3,8(sp)
    800018e8:	03010413          	addi	s0,sp,48
    800018ec:	00050913          	mv	s2,a0
            int i = 0;
    800018f0:	00000993          	li	s3,0
    800018f4:	0100006f          	j	80001904 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800018f8:	00a00513          	li	a0,10
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	1bc080e7          	jalr	444(ra) # 80003ab8 <putc>
            while (!threadEnd) {
    80001904:	00008797          	auipc	a5,0x8
    80001908:	5ac78793          	addi	a5,a5,1452 # 80009eb0 <_ZN19ConsumerProducerCPP9threadEndE>
    8000190c:	0007a783          	lw	a5,0(a5)
    80001910:	0007879b          	sext.w	a5,a5
    80001914:	02079c63          	bnez	a5,8000194c <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    80001918:	01893783          	ld	a5,24(s2)
    8000191c:	0087b503          	ld	a0,8(a5)
    80001920:	00003097          	auipc	ra,0x3
    80001924:	150080e7          	jalr	336(ra) # 80004a70 <_ZN9BufferCPP3getEv>
                i++;
    80001928:	0019849b          	addiw	s1,s3,1
    8000192c:	0004899b          	sext.w	s3,s1
    80001930:	0ff57513          	andi	a0,a0,255
    80001934:	00002097          	auipc	ra,0x2
    80001938:	184080e7          	jalr	388(ra) # 80003ab8 <putc>
                if (i % 80 == 0) {
    8000193c:	05000793          	li	a5,80
    80001940:	02f4e4bb          	remw	s1,s1,a5
    80001944:	fc0490e3          	bnez	s1,80001904 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80001948:	fb1ff06f          	j	800018f8 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    8000194c:	01893783          	ld	a5,24(s2)
    80001950:	0087b503          	ld	a0,8(a5)
    80001954:	00003097          	auipc	ra,0x3
    80001958:	1b8080e7          	jalr	440(ra) # 80004b0c <_ZN9BufferCPP6getCntEv>
    8000195c:	02a05263          	blez	a0,80001980 <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    80001960:	01893783          	ld	a5,24(s2)
    80001964:	0087b503          	ld	a0,8(a5)
    80001968:	00003097          	auipc	ra,0x3
    8000196c:	108080e7          	jalr	264(ra) # 80004a70 <_ZN9BufferCPP3getEv>
    80001970:	0ff57513          	andi	a0,a0,255
    80001974:	00002097          	auipc	ra,0x2
    80001978:	144080e7          	jalr	324(ra) # 80003ab8 <putc>
    8000197c:	fd1ff06f          	j	8000194c <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    80001980:	01893783          	ld	a5,24(s2)
    80001984:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80001988:	0087b503          	ld	a0,8(a5)
    8000198c:	00002097          	auipc	ra,0x2
    80001990:	080080e7          	jalr	128(ra) # 80003a0c <sem_signal>
        }
    80001994:	02813083          	ld	ra,40(sp)
    80001998:	02013403          	ld	s0,32(sp)
    8000199c:	01813483          	ld	s1,24(sp)
    800019a0:	01013903          	ld	s2,16(sp)
    800019a4:	00813983          	ld	s3,8(sp)
    800019a8:	03010113          	addi	sp,sp,48
    800019ac:	00008067          	ret

00000000800019b0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    800019b0:	fe010113          	addi	sp,sp,-32
    800019b4:	00113c23          	sd	ra,24(sp)
    800019b8:	00813823          	sd	s0,16(sp)
    800019bc:	00913423          	sd	s1,8(sp)
    800019c0:	02010413          	addi	s0,sp,32
    800019c4:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    800019c8:	00002097          	auipc	ra,0x2
    800019cc:	0b4080e7          	jalr	180(ra) # 80003a7c <getc>
    800019d0:	0005059b          	sext.w	a1,a0
    800019d4:	01b00793          	li	a5,27
    800019d8:	00f58c63          	beq	a1,a5,800019f0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    800019dc:	0184b783          	ld	a5,24(s1)
    800019e0:	0087b503          	ld	a0,8(a5)
    800019e4:	00003097          	auipc	ra,0x3
    800019e8:	fec080e7          	jalr	-20(ra) # 800049d0 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    800019ec:	fddff06f          	j	800019c8 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    800019f0:	00100793          	li	a5,1
    800019f4:	00008717          	auipc	a4,0x8
    800019f8:	4af72e23          	sw	a5,1212(a4) # 80009eb0 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    800019fc:	0184b783          	ld	a5,24(s1)
    80001a00:	02100593          	li	a1,33
    80001a04:	0087b503          	ld	a0,8(a5)
    80001a08:	00003097          	auipc	ra,0x3
    80001a0c:	fc8080e7          	jalr	-56(ra) # 800049d0 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    80001a10:	0184b783          	ld	a5,24(s1)
    80001a14:	0107b783          	ld	a5,16(a5)
    80001a18:	0087b503          	ld	a0,8(a5)
    80001a1c:	00002097          	auipc	ra,0x2
    80001a20:	ff0080e7          	jalr	-16(ra) # 80003a0c <sem_signal>
        }
    80001a24:	01813083          	ld	ra,24(sp)
    80001a28:	01013403          	ld	s0,16(sp)
    80001a2c:	00813483          	ld	s1,8(sp)
    80001a30:	02010113          	addi	sp,sp,32
    80001a34:	00008067          	ret

0000000080001a38 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80001a38:	fe010113          	addi	sp,sp,-32
    80001a3c:	00113c23          	sd	ra,24(sp)
    80001a40:	00813823          	sd	s0,16(sp)
    80001a44:	00913423          	sd	s1,8(sp)
    80001a48:	01213023          	sd	s2,0(sp)
    80001a4c:	02010413          	addi	s0,sp,32
    80001a50:	00050493          	mv	s1,a0
            int i = 0;
    80001a54:	00000913          	li	s2,0
            while (!threadEnd) {
    80001a58:	00008797          	auipc	a5,0x8
    80001a5c:	45878793          	addi	a5,a5,1112 # 80009eb0 <_ZN19ConsumerProducerCPP9threadEndE>
    80001a60:	0007a783          	lw	a5,0(a5)
    80001a64:	0007879b          	sext.w	a5,a5
    80001a68:	04079263          	bnez	a5,80001aac <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    80001a6c:	0184b783          	ld	a5,24(s1)
    80001a70:	0007a583          	lw	a1,0(a5)
    80001a74:	0305859b          	addiw	a1,a1,48
    80001a78:	0087b503          	ld	a0,8(a5)
    80001a7c:	00003097          	auipc	ra,0x3
    80001a80:	f54080e7          	jalr	-172(ra) # 800049d0 <_ZN9BufferCPP3putEi>
                i++;
    80001a84:	0019051b          	addiw	a0,s2,1
    80001a88:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    80001a8c:	0184b783          	ld	a5,24(s1)
    80001a90:	0007a783          	lw	a5,0(a5)
    80001a94:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    80001a98:	00500513          	li	a0,5
    80001a9c:	02a7e53b          	remw	a0,a5,a0
    80001aa0:	00002097          	auipc	ra,0x2
    80001aa4:	fa4080e7          	jalr	-92(ra) # 80003a44 <time_sleep>
    80001aa8:	fb1ff06f          	j	80001a58 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    80001aac:	0184b783          	ld	a5,24(s1)
    80001ab0:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80001ab4:	0087b503          	ld	a0,8(a5)
    80001ab8:	00002097          	auipc	ra,0x2
    80001abc:	f54080e7          	jalr	-172(ra) # 80003a0c <sem_signal>
        }
    80001ac0:	01813083          	ld	ra,24(sp)
    80001ac4:	01013403          	ld	s0,16(sp)
    80001ac8:	00813483          	ld	s1,8(sp)
    80001acc:	00013903          	ld	s2,0(sp)
    80001ad0:	02010113          	addi	sp,sp,32
    80001ad4:	00008067          	ret

0000000080001ad8 <_Z13timer_handlerv>:
    IS = 9,
    IU = 8,
};

void timer_handler()
{
    80001ad8:	fd010113          	addi	sp,sp,-48
    80001adc:	02113423          	sd	ra,40(sp)
    80001ae0:	02813023          	sd	s0,32(sp)
    80001ae4:	00913c23          	sd	s1,24(sp)
    80001ae8:	01213823          	sd	s2,16(sp)
    80001aec:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80001af0:	00001097          	auipc	ra,0x1
    80001af4:	084080e7          	jalr	132(ra) # 80002b74 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80001af8:	00008717          	auipc	a4,0x8
    80001afc:	3d070713          	addi	a4,a4,976 # 80009ec8 <_ZN3TCB16timeSliceCounterE>
    80001b00:	00073783          	ld	a5,0(a4)
    80001b04:	00178793          	addi	a5,a5,1
    80001b08:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80001b0c:	00008717          	auipc	a4,0x8
    80001b10:	3c470713          	addi	a4,a4,964 # 80009ed0 <_ZN3TCB7runningE>
    80001b14:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80001b18:	03073703          	ld	a4,48(a4)
    80001b1c:	02e7f263          	bgeu	a5,a4,80001b40 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001b20:	00200793          	li	a5,2
    80001b24:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80001b28:	02813083          	ld	ra,40(sp)
    80001b2c:	02013403          	ld	s0,32(sp)
    80001b30:	01813483          	ld	s1,24(sp)
    80001b34:	01013903          	ld	s2,16(sp)
    80001b38:	03010113          	addi	sp,sp,48
    80001b3c:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001b40:	100027f3          	csrr	a5,sstatus
    80001b44:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001b48:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001b4c:	141027f3          	csrr	a5,sepc
    80001b50:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80001b54:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    80001b58:	00008797          	auipc	a5,0x8
    80001b5c:	3607b823          	sd	zero,880(a5) # 80009ec8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80001b60:	00001097          	auipc	ra,0x1
    80001b64:	3f4080e7          	jalr	1012(ra) # 80002f54 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001b68:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001b6c:	14149073          	csrw	sepc,s1
    80001b70:	fb1ff06f          	j	80001b20 <_Z13timer_handlerv+0x48>

0000000080001b74 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80001b74:	fb010113          	addi	sp,sp,-80
    80001b78:	04113423          	sd	ra,72(sp)
    80001b7c:	04813023          	sd	s0,64(sp)
    80001b80:	02913c23          	sd	s1,56(sp)
    80001b84:	03213823          	sd	s2,48(sp)
    80001b88:	03313423          	sd	s3,40(sp)
    80001b8c:	03413023          	sd	s4,32(sp)
    80001b90:	01513c23          	sd	s5,24(sp)
    80001b94:	01613823          	sd	s6,16(sp)
    80001b98:	05010413          	addi	s0,sp,80
    80001b9c:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001ba0:	141027f3          	csrr	a5,sepc
    80001ba4:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001ba8:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001bac:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001bb0:	100027f3          	csrr	a5,sstatus
    80001bb4:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001bb8:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80001bbc:	00100793          	li	a5,1
    80001bc0:	0ef50663          	beq	a0,a5,80001cac <_Z8usrEcallmmmmm+0x138>
    80001bc4:	00050493          	mv	s1,a0
    80001bc8:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    80001bcc:	00200793          	li	a5,2
    80001bd0:	12f50063          	beq	a0,a5,80001cf0 <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    80001bd4:	01100793          	li	a5,17
    80001bd8:	12f50863          	beq	a0,a5,80001d08 <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001bdc:	01200793          	li	a5,18
    80001be0:	14f50a63          	beq	a0,a5,80001d34 <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80001be4:	01300793          	li	a5,19
    80001be8:	16f50863          	beq	a0,a5,80001d58 <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    80001bec:	06900793          	li	a5,105
    80001bf0:	18f50063          	beq	a0,a5,80001d70 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001bf4:	02100793          	li	a5,33
    80001bf8:	18f50663          	beq	a0,a5,80001d84 <_Z8usrEcallmmmmm+0x210>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
    }
    else if(a0 == SC)
    80001bfc:	02200793          	li	a5,34
    80001c00:	1af50863          	beq	a0,a5,80001db0 <_Z8usrEcallmmmmm+0x23c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80001c04:	02300793          	li	a5,35
    80001c08:	1cf50a63          	beq	a0,a5,80001ddc <_Z8usrEcallmmmmm+0x268>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
    }
    else if(a0 == SS)
    80001c0c:	02400793          	li	a5,36
    80001c10:	1cf50e63          	beq	a0,a5,80001dec <_Z8usrEcallmmmmm+0x278>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80001c14:	03100793          	li	a5,49
    80001c18:	1ef50463          	beq	a0,a5,80001e00 <_Z8usrEcallmmmmm+0x28c>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    80001c1c:	04100793          	li	a5,65
    80001c20:	1ef50a63          	beq	a0,a5,80001e14 <_Z8usrEcallmmmmm+0x2a0>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80001c24:	04200793          	li	a5,66
    80001c28:	08f51c63          	bne	a0,a5,80001cc0 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    80001c2c:	00008797          	auipc	a5,0x8
    80001c30:	2d478793          	addi	a5,a5,724 # 80009f00 <_ZN5StdIO7obufferE>
    80001c34:	0007ba83          	ld	s5,0(a5)
    80001c38:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    80001c3c:	430a8513          	addi	a0,s5,1072
    80001c40:	00002097          	auipc	ra,0x2
    80001c44:	e9c080e7          	jalr	-356(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001c48:	400a8b13          	addi	s6,s5,1024
    80001c4c:	000b0513          	mv	a0,s6
    80001c50:	00002097          	auipc	ra,0x2
    80001c54:	e8c080e7          	jalr	-372(ra) # 80003adc <_ZN10KSemaphore4waitEv>

        tmpLen++;
    80001c58:	450aa783          	lw	a5,1104(s5)
    80001c5c:	0017879b          	addiw	a5,a5,1
    80001c60:	44faa823          	sw	a5,1104(s5)
        buffer[tail]=c;
    80001c64:	44caa783          	lw	a5,1100(s5)
    80001c68:	00fa8733          	add	a4,s5,a5
    80001c6c:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001c70:	0017879b          	addiw	a5,a5,1
    80001c74:	41f7d71b          	sraiw	a4,a5,0x1f
    80001c78:	0167571b          	srliw	a4,a4,0x16
    80001c7c:	00e787bb          	addw	a5,a5,a4
    80001c80:	3ff7f793          	andi	a5,a5,1023
    80001c84:	40e787bb          	subw	a5,a5,a4
    80001c88:	44faa623          	sw	a5,1100(s5)
    
        itemAvailable.signal();
    80001c8c:	418a8513          	addi	a0,s5,1048
    80001c90:	00002097          	auipc	ra,0x2
    80001c94:	ed0080e7          	jalr	-304(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001c98:	000b0513          	mv	a0,s6
    80001c9c:	00002097          	auipc	ra,0x2
    80001ca0:	ec4080e7          	jalr	-316(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001ca4:	00048513          	mv	a0,s1
    80001ca8:	0180006f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80001cac:	00001097          	auipc	ra,0x1
    80001cb0:	9a8080e7          	jalr	-1624(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80001cb4:	000a0593          	mv	a1,s4
    80001cb8:	00001097          	auipc	ra,0x1
    80001cbc:	a0c080e7          	jalr	-1524(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001cc0:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001cc4:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80001cc8:	04813083          	ld	ra,72(sp)
    80001ccc:	04013403          	ld	s0,64(sp)
    80001cd0:	03813483          	ld	s1,56(sp)
    80001cd4:	03013903          	ld	s2,48(sp)
    80001cd8:	02813983          	ld	s3,40(sp)
    80001cdc:	02013a03          	ld	s4,32(sp)
    80001ce0:	01813a83          	ld	s5,24(sp)
    80001ce4:	01013b03          	ld	s6,16(sp)
    80001ce8:	05010113          	addi	sp,sp,80
    80001cec:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001cf0:	00001097          	auipc	ra,0x1
    80001cf4:	964080e7          	jalr	-1692(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80001cf8:	000a0593          	mv	a1,s4
    80001cfc:	00001097          	auipc	ra,0x1
    80001d00:	b60080e7          	jalr	-1184(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    80001d04:	fbdff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001d08:	00070613          	mv	a2,a4
    80001d0c:	00068593          	mv	a1,a3
    80001d10:	000a8513          	mv	a0,s5
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	00c080e7          	jalr	12(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001d1c:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80001d20:	00050663          	beqz	a0,80001d2c <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    80001d24:	00000513          	li	a0,0
    80001d28:	f99ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    80001d2c:	ffc00513          	li	a0,-4
    80001d30:	f91ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    80001d34:	00008797          	auipc	a5,0x8
    80001d38:	19c78793          	addi	a5,a5,412 # 80009ed0 <_ZN3TCB7runningE>
    80001d3c:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80001d40:	00200713          	li	a4,2
    80001d44:	02e7ac23          	sw	a4,56(a5)
        TCB::dispatch();
    80001d48:	00001097          	auipc	ra,0x1
    80001d4c:	12c080e7          	jalr	300(ra) # 80002e74 <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d50:	00048513          	mv	a0,s1
    80001d54:	f6dff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    80001d58:	00008797          	auipc	a5,0x8
    80001d5c:	1607b823          	sd	zero,368(a5) # 80009ec8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80001d60:	00001097          	auipc	ra,0x1
    80001d64:	1f4080e7          	jalr	500(ra) # 80002f54 <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d68:	00048513          	mv	a0,s1
    80001d6c:	f55ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    80001d70:	00058513          	mv	a0,a1
    80001d74:	00001097          	auipc	ra,0x1
    80001d78:	218080e7          	jalr	536(ra) # 80002f8c <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d7c:	00048513          	mv	a0,s1
    80001d80:	f41ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	8d0080e7          	jalr	-1840(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80001d8c:	00100593          	li	a1,1
    80001d90:	00001097          	auipc	ra,0x1
    80001d94:	934080e7          	jalr	-1740(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80001d98:	01552023          	sw	s5,0(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80001d9c:	00053423          	sd	zero,8(a0)
    80001da0:	00053823          	sd	zero,16(a0)
        *t = (uint64)(new KSemaphore(a2));
    80001da4:	00aa3023          	sd	a0,0(s4)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001da8:	00048513          	mv	a0,s1
    80001dac:	f15ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        delete t;
    80001db0:	f00588e3          	beqz	a1,80001cc0 <_Z8usrEcallmmmmm+0x14c>
    80001db4:	00058513          	mv	a0,a1
    80001db8:	00002097          	auipc	ra,0x2
    80001dbc:	dfc080e7          	jalr	-516(ra) # 80003bb4 <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001dc0:	00001097          	auipc	ra,0x1
    80001dc4:	894080e7          	jalr	-1900(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80001dc8:	000a0593          	mv	a1,s4
    80001dcc:	00001097          	auipc	ra,0x1
    80001dd0:	a90080e7          	jalr	-1392(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001dd4:	00048513          	mv	a0,s1
    80001dd8:	ee9ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        ret = t->wait();
    80001ddc:	00058513          	mv	a0,a1
    80001de0:	00002097          	auipc	ra,0x2
    80001de4:	cfc080e7          	jalr	-772(ra) # 80003adc <_ZN10KSemaphore4waitEv>
    80001de8:	ed9ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        t->signal();
    80001dec:	00058513          	mv	a0,a1
    80001df0:	00002097          	auipc	ra,0x2
    80001df4:	d70080e7          	jalr	-656(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001df8:	00048513          	mv	a0,s1
    80001dfc:	ec5ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    80001e00:	00058513          	mv	a0,a1
    80001e04:	00001097          	auipc	ra,0x1
    80001e08:	230080e7          	jalr	560(ra) # 80003034 <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001e0c:	00048513          	mv	a0,s1
    80001e10:	eb1ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    80001e14:	00008797          	auipc	a5,0x8
    80001e18:	0f478793          	addi	a5,a5,244 # 80009f08 <_ZN5StdIO7ibufferE>
    80001e1c:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    80001e20:	418a0513          	addi	a0,s4,1048
    80001e24:	00002097          	auipc	ra,0x2
    80001e28:	cb8080e7          	jalr	-840(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001e2c:	400a0a93          	addi	s5,s4,1024
    80001e30:	000a8513          	mv	a0,s5
    80001e34:	00002097          	auipc	ra,0x2
    80001e38:	ca8080e7          	jalr	-856(ra) # 80003adc <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80001e3c:	450a2783          	lw	a5,1104(s4)
    80001e40:	fff7879b          	addiw	a5,a5,-1
    80001e44:	44fa2823          	sw	a5,1104(s4)
        T r = buffer[head];
    80001e48:	448a2783          	lw	a5,1096(s4)
    80001e4c:	00fa0733          	add	a4,s4,a5
    80001e50:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80001e54:	0017879b          	addiw	a5,a5,1
    80001e58:	41f7d71b          	sraiw	a4,a5,0x1f
    80001e5c:	0167571b          	srliw	a4,a4,0x16
    80001e60:	00e787bb          	addw	a5,a5,a4
    80001e64:	3ff7f793          	andi	a5,a5,1023
    80001e68:	40e787bb          	subw	a5,a5,a4
    80001e6c:	44fa2423          	sw	a5,1096(s4)

        spaceAvailable.signal();
    80001e70:	430a0513          	addi	a0,s4,1072
    80001e74:	00002097          	auipc	ra,0x2
    80001e78:	cec080e7          	jalr	-788(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001e7c:	000a8513          	mv	a0,s5
    80001e80:	00002097          	auipc	ra,0x2
    80001e84:	ce0080e7          	jalr	-800(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    80001e88:	00048513          	mv	a0,s1
    80001e8c:	e35ff06f          	j	80001cc0 <_Z8usrEcallmmmmm+0x14c>

0000000080001e90 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80001e90:	fb010113          	addi	sp,sp,-80
    80001e94:	04113423          	sd	ra,72(sp)
    80001e98:	04813023          	sd	s0,64(sp)
    80001e9c:	02913c23          	sd	s1,56(sp)
    80001ea0:	03213823          	sd	s2,48(sp)
    80001ea4:	03313423          	sd	s3,40(sp)
    80001ea8:	03413023          	sd	s4,32(sp)
    80001eac:	01513c23          	sd	s5,24(sp)
    80001eb0:	05010413          	addi	s0,sp,80
    80001eb4:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001eb8:	141027f3          	csrr	a5,sepc
    80001ebc:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001ec0:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001ec4:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001ec8:	100027f3          	csrr	a5,sstatus
    80001ecc:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001ed0:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    80001ed4:	00100793          	li	a5,1
    80001ed8:	0ef50663          	beq	a0,a5,80001fc4 <_Z8sysEcallmmmmm+0x134>
    80001edc:	00050493          	mv	s1,a0
    80001ee0:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    80001ee4:	00200793          	li	a5,2
    80001ee8:	10f50c63          	beq	a0,a5,80002000 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    80001eec:	01100793          	li	a5,17
    80001ef0:	12f50463          	beq	a0,a5,80002018 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001ef4:	01200793          	li	a5,18
    80001ef8:	14f50663          	beq	a0,a5,80002044 <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    80001efc:	01300793          	li	a5,19
    80001f00:	16f50663          	beq	a0,a5,8000206c <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    80001f04:	06900793          	li	a5,105
    80001f08:	18f50063          	beq	a0,a5,80002088 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001f0c:	02100793          	li	a5,33
    80001f10:	18f50663          	beq	a0,a5,8000209c <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    80001f14:	02200793          	li	a5,34
    80001f18:	1af50863          	beq	a0,a5,800020c8 <_Z8sysEcallmmmmm+0x238>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80001f1c:	02300793          	li	a5,35
    80001f20:	1cf50a63          	beq	a0,a5,800020f4 <_Z8sysEcallmmmmm+0x264>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    80001f24:	02400793          	li	a5,36
    80001f28:	1ef50063          	beq	a0,a5,80002108 <_Z8sysEcallmmmmm+0x278>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80001f2c:	03100793          	li	a5,49
    80001f30:	1ef50663          	beq	a0,a5,8000211c <_Z8sysEcallmmmmm+0x28c>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    80001f34:	04100793          	li	a5,65
    80001f38:	1ef50e63          	beq	a0,a5,80002134 <_Z8sysEcallmmmmm+0x2a4>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80001f3c:	04200793          	li	a5,66
    80001f40:	08f51c63          	bne	a0,a5,80001fd8 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    80001f44:	00008797          	auipc	a5,0x8
    80001f48:	fbc78793          	addi	a5,a5,-68 # 80009f00 <_ZN5StdIO7obufferE>
    80001f4c:	0007ba03          	ld	s4,0(a5)
    80001f50:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    80001f54:	430a0513          	addi	a0,s4,1072
    80001f58:	00002097          	auipc	ra,0x2
    80001f5c:	b84080e7          	jalr	-1148(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001f60:	400a0a93          	addi	s5,s4,1024
    80001f64:	000a8513          	mv	a0,s5
    80001f68:	00002097          	auipc	ra,0x2
    80001f6c:	b74080e7          	jalr	-1164(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80001f70:	450a2783          	lw	a5,1104(s4)
    80001f74:	0017879b          	addiw	a5,a5,1
    80001f78:	44fa2823          	sw	a5,1104(s4)
        buffer[tail]=c;
    80001f7c:	44ca2783          	lw	a5,1100(s4)
    80001f80:	00fa0733          	add	a4,s4,a5
    80001f84:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001f88:	0017879b          	addiw	a5,a5,1
    80001f8c:	41f7d71b          	sraiw	a4,a5,0x1f
    80001f90:	0167571b          	srliw	a4,a4,0x16
    80001f94:	00e787bb          	addw	a5,a5,a4
    80001f98:	3ff7f793          	andi	a5,a5,1023
    80001f9c:	40e787bb          	subw	a5,a5,a4
    80001fa0:	44fa2623          	sw	a5,1100(s4)
        itemAvailable.signal();
    80001fa4:	418a0513          	addi	a0,s4,1048
    80001fa8:	00002097          	auipc	ra,0x2
    80001fac:	bb8080e7          	jalr	-1096(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001fb0:	000a8513          	mv	a0,s5
    80001fb4:	00002097          	auipc	ra,0x2
    80001fb8:	bac080e7          	jalr	-1108(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001fbc:	00048513          	mv	a0,s1
    80001fc0:	0180006f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    80001fc4:	00000097          	auipc	ra,0x0
    80001fc8:	690080e7          	jalr	1680(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80001fcc:	00098593          	mv	a1,s3
    80001fd0:	00000097          	auipc	ra,0x0
    80001fd4:	6f4080e7          	jalr	1780(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001fd8:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80001fdc:	04813083          	ld	ra,72(sp)
    80001fe0:	04013403          	ld	s0,64(sp)
    80001fe4:	03813483          	ld	s1,56(sp)
    80001fe8:	03013903          	ld	s2,48(sp)
    80001fec:	02813983          	ld	s3,40(sp)
    80001ff0:	02013a03          	ld	s4,32(sp)
    80001ff4:	01813a83          	ld	s5,24(sp)
    80001ff8:	05010113          	addi	sp,sp,80
    80001ffc:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80002000:	00000097          	auipc	ra,0x0
    80002004:	654080e7          	jalr	1620(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002008:	00098593          	mv	a1,s3
    8000200c:	00001097          	auipc	ra,0x1
    80002010:	850080e7          	jalr	-1968(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    80002014:	fc5ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    80002018:	00070613          	mv	a2,a4
    8000201c:	00068593          	mv	a1,a3
    80002020:	000a8513          	mv	a0,s5
    80002024:	00001097          	auipc	ra,0x1
    80002028:	cfc080e7          	jalr	-772(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000202c:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    80002030:	00050663          	beqz	a0,8000203c <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    80002034:	00000513          	li	a0,0
    80002038:	fa1ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    8000203c:	ffc00513          	li	a0,-4
    80002040:	f99ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    80002044:	00008797          	auipc	a5,0x8
    80002048:	e8c78793          	addi	a5,a5,-372 # 80009ed0 <_ZN3TCB7runningE>
    8000204c:	0007b783          	ld	a5,0(a5)
    80002050:	00200713          	li	a4,2
    80002054:	02e7ac23          	sw	a4,56(a5)
        TCB::dispatch();
    80002058:	00001097          	auipc	ra,0x1
    8000205c:	e1c080e7          	jalr	-484(ra) # 80002e74 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002060:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002064:	00048513          	mv	a0,s1
    80002068:	f71ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    8000206c:	00008797          	auipc	a5,0x8
    80002070:	e407be23          	sd	zero,-420(a5) # 80009ec8 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80002074:	00001097          	auipc	ra,0x1
    80002078:	ee0080e7          	jalr	-288(ra) # 80002f54 <_ZN3TCB5yieldEv>
    8000207c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002080:	00048513          	mv	a0,s1
    80002084:	f55ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80002088:	00058513          	mv	a0,a1
    8000208c:	00001097          	auipc	ra,0x1
    80002090:	f00080e7          	jalr	-256(ra) # 80002f8c <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002094:	00048513          	mv	a0,s1
    80002098:	f41ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	5b8080e7          	jalr	1464(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    800020a4:	00100593          	li	a1,1
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	61c080e7          	jalr	1564(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    800020b0:	01552023          	sw	s5,0(a0)
    800020b4:	00053423          	sd	zero,8(a0)
    800020b8:	00053823          	sd	zero,16(a0)
        *t = (uint64)(new KSemaphore(a2));
    800020bc:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800020c0:	00048513          	mv	a0,s1
    800020c4:	f15ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        delete t;
    800020c8:	f00588e3          	beqz	a1,80001fd8 <_Z8sysEcallmmmmm+0x148>
    800020cc:	00058513          	mv	a0,a1
    800020d0:	00002097          	auipc	ra,0x2
    800020d4:	ae4080e7          	jalr	-1308(ra) # 80003bb4 <_ZN10KSemaphoreD1Ev>
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	57c080e7          	jalr	1404(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    800020e0:	00098593          	mv	a1,s3
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	778080e7          	jalr	1912(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800020ec:	00048513          	mv	a0,s1
    800020f0:	ee9ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800020f4:	00058513          	mv	a0,a1
    800020f8:	00002097          	auipc	ra,0x2
    800020fc:	9e4080e7          	jalr	-1564(ra) # 80003adc <_ZN10KSemaphore4waitEv>
    80002100:	100a1073          	csrw	sstatus,s4
    80002104:	ed5ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    80002108:	00058513          	mv	a0,a1
    8000210c:	00002097          	auipc	ra,0x2
    80002110:	a54080e7          	jalr	-1452(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002114:	00048513          	mv	a0,s1
    80002118:	ec1ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    8000211c:	00058513          	mv	a0,a1
    80002120:	00001097          	auipc	ra,0x1
    80002124:	f14080e7          	jalr	-236(ra) # 80003034 <_ZN3TCB5sleepEm>
    80002128:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000212c:	00048513          	mv	a0,s1
    80002130:	ea9ff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    80002134:	00008797          	auipc	a5,0x8
    80002138:	dd478793          	addi	a5,a5,-556 # 80009f08 <_ZN5StdIO7ibufferE>
    8000213c:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    80002140:	41898513          	addi	a0,s3,1048
    80002144:	00002097          	auipc	ra,0x2
    80002148:	998080e7          	jalr	-1640(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    8000214c:	40098a13          	addi	s4,s3,1024
    80002150:	000a0513          	mv	a0,s4
    80002154:	00002097          	auipc	ra,0x2
    80002158:	988080e7          	jalr	-1656(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        tmpLen--;
    8000215c:	4509a783          	lw	a5,1104(s3)
    80002160:	fff7879b          	addiw	a5,a5,-1
    80002164:	44f9a823          	sw	a5,1104(s3)
        T r = buffer[head];
    80002168:	4489a783          	lw	a5,1096(s3)
    8000216c:	00f98733          	add	a4,s3,a5
    80002170:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80002174:	0017879b          	addiw	a5,a5,1
    80002178:	41f7d71b          	sraiw	a4,a5,0x1f
    8000217c:	0167571b          	srliw	a4,a4,0x16
    80002180:	00e787bb          	addw	a5,a5,a4
    80002184:	3ff7f793          	andi	a5,a5,1023
    80002188:	40e787bb          	subw	a5,a5,a4
    8000218c:	44f9a423          	sw	a5,1096(s3)
        spaceAvailable.signal();
    80002190:	43098513          	addi	a0,s3,1072
    80002194:	00002097          	auipc	ra,0x2
    80002198:	9cc080e7          	jalr	-1588(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000219c:	000a0513          	mv	a0,s4
    800021a0:	00002097          	auipc	ra,0x2
    800021a4:	9c0080e7          	jalr	-1600(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    800021a8:	00048513          	mv	a0,s1
    800021ac:	e2dff06f          	j	80001fd8 <_Z8sysEcallmmmmm+0x148>

00000000800021b0 <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800021b0:	fc010113          	addi	sp,sp,-64
    800021b4:	02113c23          	sd	ra,56(sp)
    800021b8:	02813823          	sd	s0,48(sp)
    800021bc:	02913423          	sd	s1,40(sp)
    800021c0:	04010413          	addi	s0,sp,64
    asm volatile("csrr %0, scause" : "=r" (scause));
    800021c4:	142027f3          	csrr	a5,scause
    800021c8:	fcf43423          	sd	a5,-56(s0)
    return scause;
    800021cc:	fc843483          	ld	s1,-56(s0)
    uint64 scause = Riscv::r_scause();
    static int t = 0;

    if(scause == IS)
    800021d0:	00900793          	li	a5,9
    800021d4:	0af48063          	beq	s1,a5,80002274 <interrupt+0xc4>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    800021d8:	00800793          	li	a5,8
    800021dc:	0af48c63          	beq	s1,a5,80002294 <interrupt+0xe4>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    800021e0:	fff00793          	li	a5,-1
    800021e4:	03f79793          	slli	a5,a5,0x3f
    800021e8:	00978793          	addi	a5,a5,9
    800021ec:	0af48c63          	beq	s1,a5,800022a4 <interrupt+0xf4>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800021f0:	fff00793          	li	a5,-1
    800021f4:	03f79793          	slli	a5,a5,0x3f
    800021f8:	00178793          	addi	a5,a5,1
    800021fc:	0af48a63          	beq	s1,a5,800022b0 <interrupt+0x100>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == 2)
    80002200:	00200793          	li	a5,2
    80002204:	0af48c63          	beq	s1,a5,800022bc <interrupt+0x10c>
        {
            print(scause);
            t++;
        }
    }
    else if(scause == 1)
    80002208:	00100793          	li	a5,1
    8000220c:	0ef48863          	beq	s1,a5,800022fc <interrupt+0x14c>
            t++;
        }
    }
    else
    {
        if(t<15)
    80002210:	00008797          	auipc	a5,0x8
    80002214:	cb078793          	addi	a5,a5,-848 # 80009ec0 <_ZZ9interruptE1t>
    80002218:	0007a703          	lw	a4,0(a5)
    8000221c:	00e00793          	li	a5,14
    80002220:	06e7c063          	blt	a5,a4,80002280 <interrupt+0xd0>
        {
            Scheduler::print_queue();
    80002224:	00001097          	auipc	ra,0x1
    80002228:	8e0080e7          	jalr	-1824(ra) # 80002b04 <_ZN9Scheduler11print_queueEv>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000222c:	141027f3          	csrr	a5,sepc
    80002230:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002234:	fd843503          	ld	a0,-40(s0)
            if(scause == 0x7)
            {
                //print((uint64) TCB::running, '\n', 0);
                
            }
            print((uint64) Riscv::r_sepc());
    80002238:	00100613          	li	a2,1
    8000223c:	00a00593          	li	a1,10
    80002240:	00001097          	auipc	ra,0x1
    80002244:	e40080e7          	jalr	-448(ra) # 80003080 <_Z5printmcb>
            print(scause);
    80002248:	00100613          	li	a2,1
    8000224c:	00a00593          	li	a1,10
    80002250:	00048513          	mv	a0,s1
    80002254:	00001097          	auipc	ra,0x1
    80002258:	e2c080e7          	jalr	-468(ra) # 80003080 <_Z5printmcb>
            t++;
    8000225c:	00008717          	auipc	a4,0x8
    80002260:	c6470713          	addi	a4,a4,-924 # 80009ec0 <_ZZ9interruptE1t>
    80002264:	00072783          	lw	a5,0(a4)
    80002268:	0017879b          	addiw	a5,a5,1
    8000226c:	00f72023          	sw	a5,0(a4)
        }
    }
    //print(a4);
    80002270:	0100006f          	j	80002280 <interrupt+0xd0>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80002274:	00000097          	auipc	ra,0x0
    80002278:	c1c080e7          	jalr	-996(ra) # 80001e90 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    8000227c:	04a43823          	sd	a0,80(s0)
    80002280:	03813083          	ld	ra,56(sp)
    80002284:	03013403          	ld	s0,48(sp)
    80002288:	02813483          	ld	s1,40(sp)
    8000228c:	04010113          	addi	sp,sp,64
    80002290:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80002294:	00000097          	auipc	ra,0x0
    80002298:	8e0080e7          	jalr	-1824(ra) # 80001b74 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    8000229c:	04a43823          	sd	a0,80(s0)
    800022a0:	fe1ff06f          	j	80002280 <interrupt+0xd0>
       StdIO::console_handler();
    800022a4:	00002097          	auipc	ra,0x2
    800022a8:	c0c080e7          	jalr	-1012(ra) # 80003eb0 <_ZN5StdIO15console_handlerEv>
    800022ac:	fd5ff06f          	j	80002280 <interrupt+0xd0>
        timer_handler();      
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	828080e7          	jalr	-2008(ra) # 80001ad8 <_Z13timer_handlerv>
    800022b8:	fc9ff06f          	j	80002280 <interrupt+0xd0>
        if(t<5)
    800022bc:	00008797          	auipc	a5,0x8
    800022c0:	c0478793          	addi	a5,a5,-1020 # 80009ec0 <_ZZ9interruptE1t>
    800022c4:	0007a703          	lw	a4,0(a5)
    800022c8:	00400793          	li	a5,4
    800022cc:	fae7cae3          	blt	a5,a4,80002280 <interrupt+0xd0>
            print(scause);
    800022d0:	00100613          	li	a2,1
    800022d4:	00a00593          	li	a1,10
    800022d8:	00048513          	mv	a0,s1
    800022dc:	00001097          	auipc	ra,0x1
    800022e0:	da4080e7          	jalr	-604(ra) # 80003080 <_Z5printmcb>
            t++;
    800022e4:	00008717          	auipc	a4,0x8
    800022e8:	bdc70713          	addi	a4,a4,-1060 # 80009ec0 <_ZZ9interruptE1t>
    800022ec:	00072783          	lw	a5,0(a4)
    800022f0:	0017879b          	addiw	a5,a5,1
    800022f4:	00f72023          	sw	a5,0(a4)
    800022f8:	f89ff06f          	j	80002280 <interrupt+0xd0>
        if(t<10)
    800022fc:	00008797          	auipc	a5,0x8
    80002300:	bc478793          	addi	a5,a5,-1084 # 80009ec0 <_ZZ9interruptE1t>
    80002304:	0007a703          	lw	a4,0(a5)
    80002308:	00900793          	li	a5,9
    8000230c:	f6e7cae3          	blt	a5,a4,80002280 <interrupt+0xd0>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80002310:	141027f3          	csrr	a5,sepc
    80002314:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80002318:	fd043503          	ld	a0,-48(s0)
            print((uint64) Riscv::r_sepc());
    8000231c:	00100613          	li	a2,1
    80002320:	00a00593          	li	a1,10
    80002324:	00001097          	auipc	ra,0x1
    80002328:	d5c080e7          	jalr	-676(ra) # 80003080 <_Z5printmcb>
            print(scause);
    8000232c:	00100613          	li	a2,1
    80002330:	00a00593          	li	a1,10
    80002334:	00048513          	mv	a0,s1
    80002338:	00001097          	auipc	ra,0x1
    8000233c:	d48080e7          	jalr	-696(ra) # 80003080 <_Z5printmcb>
            t++;
    80002340:	00008717          	auipc	a4,0x8
    80002344:	b8070713          	addi	a4,a4,-1152 # 80009ec0 <_ZZ9interruptE1t>
    80002348:	00072783          	lw	a5,0(a4)
    8000234c:	0017879b          	addiw	a5,a5,1
    80002350:	00f72023          	sw	a5,0(a4)
    80002354:	f2dff06f          	j	80002280 <interrupt+0xd0>

0000000080002358 <_Z15userMainWrapperPv>:

extern "C" void interruptvec();

extern void userMain();

void userMainWrapper(void*){
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00113423          	sd	ra,8(sp)
    80002360:	00813023          	sd	s0,0(sp)
    80002364:	01010413          	addi	s0,sp,16
    userMain();
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	29c080e7          	jalr	668(ra) # 80001604 <_Z8userMainv>
}
    80002370:	00813083          	ld	ra,8(sp)
    80002374:	00013403          	ld	s0,0(sp)
    80002378:	01010113          	addi	sp,sp,16
    8000237c:	00008067          	ret

0000000080002380 <_Z12idleFunctionPv>:

void idleFunction(void*){
    80002380:	ff010113          	addi	sp,sp,-16
    80002384:	00113423          	sd	ra,8(sp)
    80002388:	00813023          	sd	s0,0(sp)
    8000238c:	01010413          	addi	s0,sp,16
    while(1){
        thread_dispatch();
    80002390:	00001097          	auipc	ra,0x1
    80002394:	4f4080e7          	jalr	1268(ra) # 80003884 <thread_dispatch>
    80002398:	ff9ff06f          	j	80002390 <_Z12idleFunctionPv+0x10>

000000008000239c <main>:
    }
}

int main(){
    8000239c:	fd010113          	addi	sp,sp,-48
    800023a0:	02113423          	sd	ra,40(sp)
    800023a4:	02813023          	sd	s0,32(sp)
    800023a8:	00913c23          	sd	s1,24(sp)
    800023ac:	01213823          	sd	s2,16(sp)
    800023b0:	03010413          	addi	s0,sp,48
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(TCB): ", sizeof(TCB), 0);
    800023b4:	00000613          	li	a2,0
    800023b8:	05000593          	li	a1,80
    800023bc:	00006517          	auipc	a0,0x6
    800023c0:	e0c50513          	addi	a0,a0,-500 # 800081c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    800023c4:	00001097          	auipc	ra,0x1
    800023c8:	ea0080e7          	jalr	-352(ra) # 80003264 <_Z5printPKcmb>
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    800023cc:	00000613          	li	a2,0
    800023d0:	04000593          	li	a1,64
    800023d4:	00006517          	auipc	a0,0x6
    800023d8:	e0450513          	addi	a0,a0,-508 # 800081d8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x120>
    800023dc:	00001097          	auipc	ra,0x1
    800023e0:	e88080e7          	jalr	-376(ra) # 80003264 <_Z5printPKcmb>
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    800023e4:	00000613          	li	a2,0
    800023e8:	00200593          	li	a1,2
    800023ec:	00006517          	auipc	a0,0x6
    800023f0:	e0c50513          	addi	a0,a0,-500 # 800081f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    800023f4:	00001097          	auipc	ra,0x1
    800023f8:	e70080e7          	jalr	-400(ra) # 80003264 <_Z5printPKcmb>
    print("HEAP_START_ADDR", (uint64)HEAP_START_ADDR);
    800023fc:	00100613          	li	a2,1
    80002400:	00008797          	auipc	a5,0x8
    80002404:	8a078793          	addi	a5,a5,-1888 # 80009ca0 <HEAP_START_ADDR>
    80002408:	0007b583          	ld	a1,0(a5)
    8000240c:	00006517          	auipc	a0,0x6
    80002410:	e0450513          	addi	a0,a0,-508 # 80008210 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x158>
    80002414:	00001097          	auipc	ra,0x1
    80002418:	e50080e7          	jalr	-432(ra) # 80003264 <_Z5printPKcmb>
    print("HEAP_END_ADDR", (uint64)HEAP_END_ADDR);
    8000241c:	00100613          	li	a2,1
    80002420:	00008797          	auipc	a5,0x8
    80002424:	87878793          	addi	a5,a5,-1928 # 80009c98 <HEAP_END_ADDR>
    80002428:	0007b583          	ld	a1,0(a5)
    8000242c:	00006517          	auipc	a0,0x6
    80002430:	df450513          	addi	a0,a0,-524 # 80008220 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x168>
    80002434:	00001097          	auipc	ra,0x1
    80002438:	e30080e7          	jalr	-464(ra) # 80003264 <_Z5printPKcmb>
    print("-------------------------------\n\n");
    8000243c:	00a00593          	li	a1,10
    80002440:	00006517          	auipc	a0,0x6
    80002444:	df050513          	addi	a0,a0,-528 # 80008230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x178>
    80002448:	00001097          	auipc	ra,0x1
    8000244c:	d84080e7          	jalr	-636(ra) # 800031cc <_Z5printPKcc>
    
    print("kernelInit\n-------------------------------");
    80002450:	00a00593          	li	a1,10
    80002454:	00006517          	auipc	a0,0x6
    80002458:	e0450513          	addi	a0,a0,-508 # 80008258 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1a0>
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	d70080e7          	jalr	-656(ra) # 800031cc <_Z5printPKcc>
    Scheduler::initalize();
    80002464:	00000097          	auipc	ra,0x0
    80002468:	670080e7          	jalr	1648(ra) # 80002ad4 <_ZN9Scheduler9initalizeEv>
    print("Scheduler initalized");
    8000246c:	00a00593          	li	a1,10
    80002470:	00006517          	auipc	a0,0x6
    80002474:	e1850513          	addi	a0,a0,-488 # 80008288 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1d0>
    80002478:	00001097          	auipc	ra,0x1
    8000247c:	d54080e7          	jalr	-684(ra) # 800031cc <_Z5printPKcc>
    StdIO::initalize();
    80002480:	00002097          	auipc	ra,0x2
    80002484:	890080e7          	jalr	-1904(ra) # 80003d10 <_ZN5StdIO9initalizeEv>
    print("StdIO initalized");
    80002488:	00a00593          	li	a1,10
    8000248c:	00006517          	auipc	a0,0x6
    80002490:	e1450513          	addi	a0,a0,-492 # 800082a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e8>
    80002494:	00001097          	auipc	ra,0x1
    80002498:	d38080e7          	jalr	-712(ra) # 800031cc <_Z5printPKcc>
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    8000249c:	00000097          	auipc	ra,0x0
    800024a0:	1b8080e7          	jalr	440(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    bool invalidFreeAddress(void* adr);
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    bool initalized(){ return init;}
    800024a4:	00054783          	lbu	a5,0(a0)
    if(allocator.initalized()) print("Allocator initalized");
    800024a8:	16078263          	beqz	a5,8000260c <main+0x270>
    800024ac:	00a00593          	li	a1,10
    800024b0:	00006517          	auipc	a0,0x6
    800024b4:	e0850513          	addi	a0,a0,-504 # 800082b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x200>
    800024b8:	00001097          	auipc	ra,0x1
    800024bc:	d14080e7          	jalr	-748(ra) # 800031cc <_Z5printPKcc>
    else { 
        print("ERROR: allocator not initalized");
        return 0;
    }
    Riscv::w_stvec((uint64)interruptvec);
    800024c0:	fffff797          	auipc	a5,0xfffff
    800024c4:	b4078793          	addi	a5,a5,-1216 # 80001000 <interruptvec>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    return sepc;
} 

inline void Riscv::w_stvec(uint64 stvec){
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    800024c8:	10579073          	csrw	stvec,a5
    print("stvec initalized");
    800024cc:	00a00593          	li	a1,10
    800024d0:	00006517          	auipc	a0,0x6
    800024d4:	e0050513          	addi	a0,a0,-512 # 800082d0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x218>
    800024d8:	00001097          	auipc	ra,0x1
    800024dc:	cf4080e7          	jalr	-780(ra) # 800031cc <_Z5printPKcc>

    TCB* kernelThread, * userMainThread, * idleThread;

    print("Thread making...");
    800024e0:	00a00593          	li	a1,10
    800024e4:	00006517          	auipc	a0,0x6
    800024e8:	e0450513          	addi	a0,a0,-508 # 800082e8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x230>
    800024ec:	00001097          	auipc	ra,0x1
    800024f0:	ce0080e7          	jalr	-800(ra) # 800031cc <_Z5printPKcc>
    //mainThread
    kernelThread = TCB::createThread(nullptr);
    800024f4:	00000613          	li	a2,0
    800024f8:	00000593          	li	a1,0
    800024fc:	00000513          	li	a0,0
    80002500:	00001097          	auipc	ra,0x1
    80002504:	820080e7          	jalr	-2016(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    TCB::running = kernelThread;
    80002508:	00008797          	auipc	a5,0x8
    8000250c:	9ca7b423          	sd	a0,-1592(a5) # 80009ed0 <_ZN3TCB7runningE>
    if(kernelThread) print("KernelThread created");
    80002510:	00050c63          	beqz	a0,80002528 <main+0x18c>
    80002514:	00a00593          	li	a1,10
    80002518:	00006517          	auipc	a0,0x6
    8000251c:	e0850513          	addi	a0,a0,-504 # 80008320 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x268>
    80002520:	00001097          	auipc	ra,0x1
    80002524:	cac080e7          	jalr	-852(ra) # 800031cc <_Z5printPKcc>

    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80002528:	00001537          	lui	a0,0x1
    8000252c:	00001097          	auipc	ra,0x1
    80002530:	0e4080e7          	jalr	228(ra) # 80003610 <_Z7kmallocm>
    80002534:	00050493          	mv	s1,a0
    userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80002538:	00050613          	mv	a2,a0
    8000253c:	00000593          	li	a1,0
    80002540:	00000517          	auipc	a0,0x0
    80002544:	e1850513          	addi	a0,a0,-488 # 80002358 <_Z15userMainWrapperPv>
    80002548:	00000097          	auipc	ra,0x0
    8000254c:	7d8080e7          	jalr	2008(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002550:	00050913          	mv	s2,a0
    if(userMainThread && userMainStack) print("UserMain thread created");
    80002554:	00050e63          	beqz	a0,80002570 <main+0x1d4>
    80002558:	00048c63          	beqz	s1,80002570 <main+0x1d4>
    8000255c:	00a00593          	li	a1,10
    80002560:	00006517          	auipc	a0,0x6
    80002564:	dd850513          	addi	a0,a0,-552 # 80008338 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x280>
    80002568:	00001097          	auipc	ra,0x1
    8000256c:	c64080e7          	jalr	-924(ra) # 800031cc <_Z5printPKcc>

    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80002570:	00001537          	lui	a0,0x1
    80002574:	00001097          	auipc	ra,0x1
    80002578:	09c080e7          	jalr	156(ra) # 80003610 <_Z7kmallocm>
    8000257c:	00050493          	mv	s1,a0
    idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    80002580:	00050613          	mv	a2,a0
    80002584:	00000593          	li	a1,0
    80002588:	00000517          	auipc	a0,0x0
    8000258c:	df850513          	addi	a0,a0,-520 # 80002380 <_Z12idleFunctionPv>
    80002590:	00000097          	auipc	ra,0x0
    80002594:	790080e7          	jalr	1936(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    if(idleThread && idleThreadStack)  print("Idle thread created");
    80002598:	00050e63          	beqz	a0,800025b4 <main+0x218>
    8000259c:	00048c63          	beqz	s1,800025b4 <main+0x218>
    800025a0:	00a00593          	li	a1,10
    800025a4:	00006517          	auipc	a0,0x6
    800025a8:	dac50513          	addi	a0,a0,-596 # 80008350 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x298>
    800025ac:	00001097          	auipc	ra,0x1
    800025b0:	c20080e7          	jalr	-992(ra) # 800031cc <_Z5printPKcc>

    print("Scheduler queue", ' ');
    800025b4:	02000593          	li	a1,32
    800025b8:	00006517          	auipc	a0,0x6
    800025bc:	db050513          	addi	a0,a0,-592 # 80008368 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2b0>
    800025c0:	00001097          	auipc	ra,0x1
    800025c4:	c0c080e7          	jalr	-1012(ra) # 800031cc <_Z5printPKcc>
    Scheduler::print_queue();
    800025c8:	00000097          	auipc	ra,0x0
    800025cc:	53c080e7          	jalr	1340(ra) # 80002b04 <_ZN9Scheduler11print_queueEv>
    print("-------------------------------\n\n");
    800025d0:	00a00593          	li	a1,10
    800025d4:	00006517          	auipc	a0,0x6
    800025d8:	c5c50513          	addi	a0,a0,-932 # 80008230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x178>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	bf0080e7          	jalr	-1040(ra) # 800031cc <_Z5printPKcc>
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    800025e4:	03892703          	lw	a4,56(s2)
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!userMainThread->isFinished())
    800025e8:	00200793          	li	a5,2
    800025ec:	02f70c63          	beq	a4,a5,80002624 <main+0x288>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800025f0:	100027f3          	csrr	a5,sstatus
    800025f4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800025f8:	fd843483          	ld	s1,-40(s0)
    {
        //print("Kernel idle thread");
        uint64 sstatus = Riscv::r_sstatus();
        TCB::yield();
    800025fc:	00001097          	auipc	ra,0x1
    80002600:	958080e7          	jalr	-1704(ra) # 80002f54 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002604:	10049073          	csrw	sstatus,s1
    80002608:	fddff06f          	j	800025e4 <main+0x248>
        print("ERROR: allocator not initalized");
    8000260c:	00a00593          	li	a1,10
    80002610:	00006517          	auipc	a0,0x6
    80002614:	cf050513          	addi	a0,a0,-784 # 80008300 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x248>
    80002618:	00001097          	auipc	ra,0x1
    8000261c:	bb4080e7          	jalr	-1100(ra) # 800031cc <_Z5printPKcc>
        return 0;
    80002620:	0180006f          	j	80002638 <main+0x29c>
        Riscv::w_sstatus(sstatus);
    }
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    print("Kernel kraj");
    80002624:	00a00593          	li	a1,10
    80002628:	00006517          	auipc	a0,0x6
    8000262c:	d5050513          	addi	a0,a0,-688 # 80008378 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2c0>
    80002630:	00001097          	auipc	ra,0x1
    80002634:	b9c080e7          	jalr	-1124(ra) # 800031cc <_Z5printPKcc>
    return 0;
    80002638:	00000513          	li	a0,0
    8000263c:	02813083          	ld	ra,40(sp)
    80002640:	02013403          	ld	s0,32(sp)
    80002644:	01813483          	ld	s1,24(sp)
    80002648:	01013903          	ld	s2,16(sp)
    8000264c:	03010113          	addi	sp,sp,48
    80002650:	00008067          	ret

0000000080002654 <_ZN15MemoryAllocator11getInstanceEv>:
    fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
}*/

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80002654:	ff010113          	addi	sp,sp,-16
    80002658:	00813423          	sd	s0,8(sp)
    8000265c:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80002660:	00008797          	auipc	a5,0x8
    80002664:	8e07c783          	lbu	a5,-1824(a5) # 80009f40 <_ZN15MemoryAllocator9allocatorE>
    80002668:	04079463          	bnez	a5,800026b0 <_ZN15MemoryAllocator11getInstanceEv+0x5c>
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    8000266c:	00007697          	auipc	a3,0x7
    80002670:	63468693          	addi	a3,a3,1588 # 80009ca0 <HEAP_START_ADDR>
    80002674:	0006b783          	ld	a5,0(a3)
    80002678:	00008717          	auipc	a4,0x8
    8000267c:	8c870713          	addi	a4,a4,-1848 # 80009f40 <_ZN15MemoryAllocator9allocatorE>
    80002680:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    80002684:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    80002688:	00007797          	auipc	a5,0x7
    8000268c:	61078793          	addi	a5,a5,1552 # 80009c98 <HEAP_END_ADDR>
    80002690:	0007b783          	ld	a5,0(a5)
    80002694:	0006b683          	ld	a3,0(a3)
    80002698:	40d787b3          	sub	a5,a5,a3
    8000269c:	00873683          	ld	a3,8(a4)
    800026a0:	ff078793          	addi	a5,a5,-16
    800026a4:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    800026a8:	00100793          	li	a5,1
    800026ac:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    800026b0:	00008517          	auipc	a0,0x8
    800026b4:	89050513          	addi	a0,a0,-1904 # 80009f40 <_ZN15MemoryAllocator9allocatorE>
    800026b8:	00813403          	ld	s0,8(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret

00000000800026c4 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    800026c4:	ff010113          	addi	sp,sp,-16
    800026c8:	00813423          	sd	s0,8(sp)
    800026cc:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800026d0:	00853783          	ld	a5,8(a0)
    //print("Alocirano blokova: ", size, 0);
    size = size*MEM_BLOCK_SIZE;
    800026d4:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800026d8:	00000613          	li	a2,0
    800026dc:	00000893          	li	a7,0
    800026e0:	00000693          	li	a3,0
    800026e4:	0140006f          	j	800026f8 <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    800026e8:	00060893          	mv	a7,a2
                best = curr;     
    800026ec:	00078693          	mv	a3,a5
            }
        prev = curr;
    800026f0:	00078613          	mv	a2,a5
        curr = curr->next;
    800026f4:	0007b783          	ld	a5,0(a5)
    while(curr){
    800026f8:	02078263          	beqz	a5,8000271c <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    800026fc:	0087b703          	ld	a4,8(a5)
    80002700:	feb768e3          	bltu	a4,a1,800026f0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    80002704:	fe0682e3          	beqz	a3,800026e8 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    80002708:	0086b803          	ld	a6,8(a3)
    8000270c:	ff0772e3          	bgeu	a4,a6,800026f0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    80002710:	00060893          	mv	a7,a2
                best = curr;     
    80002714:	00078693          	mv	a3,a5
    80002718:	fd9ff06f          	j	800026f0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    8000271c:	02068463          	beqz	a3,80002744 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    80002720:	0086b783          	ld	a5,8(a3)
    80002724:	40b787b3          	sub	a5,a5,a1
    80002728:	04f00713          	li	a4,79
    8000272c:	02f76a63          	bltu	a4,a5,80002760 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        if(!best_prev) fmem_head = best->next;
    80002730:	02088263          	beqz	a7,80002754 <_ZN15MemoryAllocator9mem_allocEm+0x90>
        else best_prev->next = best->next;
    80002734:	0006b783          	ld	a5,0(a3)
    80002738:	00f8b023          	sd	a5,0(a7)
        else fmem_head = curr;
    }

    //print((uint64)best);
    //print((uint64)best->size);
    best->next = nullptr;
    8000273c:	0006b023          	sd	zero,0(a3)
    //print("Na adresi: ", (uint64)best+sizeof(FreeSegment), 0);
    //print_list();
    return (char*)best+sizeof(FreeSegment);
    80002740:	01068693          	addi	a3,a3,16
}
    80002744:	00068513          	mv	a0,a3
    80002748:	00813403          	ld	s0,8(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80002754:	0006b783          	ld	a5,0(a3)
    80002758:	00f53423          	sd	a5,8(a0)
    8000275c:	fe1ff06f          	j	8000273c <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    80002760:	01058793          	addi	a5,a1,16
    80002764:	00f687b3          	add	a5,a3,a5
        curr->next = best->next;
    80002768:	0006b703          	ld	a4,0(a3)
    8000276c:	00e7b023          	sd	a4,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    80002770:	0086b703          	ld	a4,8(a3)
    80002774:	40b70733          	sub	a4,a4,a1
    80002778:	ff070713          	addi	a4,a4,-16
    8000277c:	00e7b423          	sd	a4,8(a5)
        best->size = size;
    80002780:	00b6b423          	sd	a1,8(a3)
        if(best_prev) best_prev->next = curr;
    80002784:	00088663          	beqz	a7,80002790 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    80002788:	00f8b023          	sd	a5,0(a7)
    8000278c:	fb1ff06f          	j	8000273c <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    80002790:	00f53423          	sd	a5,8(a0)
    80002794:	fa9ff06f          	j	8000273c <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080002798 <_ZN15MemoryAllocator18invalidFreeAddressEPv>:

bool MemoryAllocator::invalidFreeAddress(void* adr){
    80002798:	ff010113          	addi	sp,sp,-16
    8000279c:	00813423          	sd	s0,8(sp)
    800027a0:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    800027a4:	00007797          	auipc	a5,0x7
    800027a8:	4fc78793          	addi	a5,a5,1276 # 80009ca0 <HEAP_START_ADDR>
    800027ac:	0007b783          	ld	a5,0(a5)
    800027b0:	04f5e063          	bltu	a1,a5,800027f0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x58>
    800027b4:	00007797          	auipc	a5,0x7
    800027b8:	4e478793          	addi	a5,a5,1252 # 80009c98 <HEAP_END_ADDR>
    800027bc:	0007b783          	ld	a5,0(a5)
    800027c0:	04f5f063          	bgeu	a1,a5,80002800 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x68>
        return true;
    size_t t = (size_t)adr;
    for(FreeSegment* cur = fmem_head; cur; cur = cur->next)
    800027c4:	00853783          	ld	a5,8(a0)
    800027c8:	0080006f          	j	800027d0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x38>
    800027cc:	0007b783          	ld	a5,0(a5)
    800027d0:	02078c63          	beqz	a5,80002808 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x70>
        if(t >= (size_t)cur && t < (size_t)cur+2*sizeof(FreeSegment)+cur->size)
    800027d4:	fef5ece3          	bltu	a1,a5,800027cc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
    800027d8:	0087b703          	ld	a4,8(a5)
    800027dc:	00e78733          	add	a4,a5,a4
    800027e0:	02070713          	addi	a4,a4,32
    800027e4:	fee5f4e3          	bgeu	a1,a4,800027cc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
            return true;
    800027e8:	00100513          	li	a0,1
    800027ec:	0080006f          	j	800027f4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
        return true;
    800027f0:	00100513          	li	a0,1
    return false;
}
    800027f4:	00813403          	ld	s0,8(sp)
    800027f8:	01010113          	addi	sp,sp,16
    800027fc:	00008067          	ret
        return true;
    80002800:	00100513          	li	a0,1
    80002804:	ff1ff06f          	j	800027f4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
    return false;
    80002808:	00000513          	li	a0,0
    8000280c:	fe9ff06f          	j	800027f4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>

0000000080002810 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    80002810:	ff010113          	addi	sp,sp,-16
    80002814:	00813423          	sd	s0,8(sp)
    80002818:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    8000281c:	0085b703          	ld	a4,8(a1)
    80002820:	01070793          	addi	a5,a4,16
    80002824:	00f587b3          	add	a5,a1,a5
    80002828:	0005b503          	ld	a0,0(a1)
    8000282c:	00a78863          	beq	a5,a0,8000283c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    80002830:	00813403          	ld	s0,8(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    8000283c:	00853783          	ld	a5,8(a0)
    80002840:	00f70733          	add	a4,a4,a5
    80002844:	01070713          	addi	a4,a4,16
    80002848:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    8000284c:	00053783          	ld	a5,0(a0)
    80002850:	00f5b023          	sd	a5,0(a1)
        return t;
    80002854:	00058513          	mv	a0,a1
    80002858:	fd9ff06f          	j	80002830 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

000000008000285c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    8000285c:	fd010113          	addi	sp,sp,-48
    80002860:	02113423          	sd	ra,40(sp)
    80002864:	02813023          	sd	s0,32(sp)
    80002868:	00913c23          	sd	s1,24(sp)
    8000286c:	01213823          	sd	s2,16(sp)
    80002870:	01313423          	sd	s3,8(sp)
    80002874:	01413023          	sd	s4,0(sp)
    80002878:	03010413          	addi	s0,sp,48
    8000287c:	00050993          	mv	s3,a0
    80002880:	00058913          	mv	s2,a1
    if(invalidFreeAddress(adr)) return -1;
    80002884:	00000097          	auipc	ra,0x0
    80002888:	f14080e7          	jalr	-236(ra) # 80002798 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    8000288c:	0a051063          	bnez	a0,8000292c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    80002890:	0089b783          	ld	a5,8(s3)
    80002894:	00078863          	beqz	a5,800028a4 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80002898:	ff090a13          	addi	s4,s2,-16
        //print((uint64)newsgm);
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    8000289c:	00000493          	li	s1,0
    800028a0:	01c0006f          	j	800028bc <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    800028a4:	ff090913          	addi	s2,s2,-16
    800028a8:	0129b423          	sd	s2,8(s3)
    800028ac:	0540006f          	j	80002900 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    800028b0:	00f96e63          	bltu	s2,a5,800028cc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    800028b4:	00078493          	mv	s1,a5
    800028b8:	0007b783          	ld	a5,0(a5)
    800028bc:	00078863          	beqz	a5,800028cc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    800028c0:	fe0488e3          	beqz	s1,800028b0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800028c4:	ff24f8e3          	bgeu	s1,s2,800028b4 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800028c8:	fe9ff06f          	j	800028b0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        //print((ull)prev);
        newsgm->next = cur;
    800028cc:	fef93823          	sd	a5,-16(s2)
        if(cur)
    800028d0:	00078a63          	beqz	a5,800028e4 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    800028d4:	000a0593          	mv	a1,s4
    800028d8:	00098513          	mv	a0,s3
    800028dc:	00000097          	auipc	ra,0x0
    800028e0:	f34080e7          	jalr	-204(ra) # 80002810 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    800028e4:	02048e63          	beqz	s1,80002920 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    800028e8:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    800028ec:	00048593          	mv	a1,s1
    800028f0:	00098513          	mv	a0,s3
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	f1c080e7          	jalr	-228(ra) # 80002810 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    800028fc:	00000513          	li	a0,0
}
    80002900:	02813083          	ld	ra,40(sp)
    80002904:	02013403          	ld	s0,32(sp)
    80002908:	01813483          	ld	s1,24(sp)
    8000290c:	01013903          	ld	s2,16(sp)
    80002910:	00813983          	ld	s3,8(sp)
    80002914:	00013a03          	ld	s4,0(sp)
    80002918:	03010113          	addi	sp,sp,48
    8000291c:	00008067          	ret
            fmem_head = newsgm;
    80002920:	0149b423          	sd	s4,8(s3)
    return 0;
    80002924:	00000513          	li	a0,0
    80002928:	fd9ff06f          	j	80002900 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(invalidFreeAddress(adr)) return -1;
    8000292c:	fff00513          	li	a0,-1
    80002930:	fd1ff06f          	j	80002900 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080002934 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80002934:	fe010113          	addi	sp,sp,-32
    80002938:	00113c23          	sd	ra,24(sp)
    8000293c:	00813823          	sd	s0,16(sp)
    80002940:	00913423          	sd	s1,8(sp)
    80002944:	02010413          	addi	s0,sp,32
    80002948:	00050493          	mv	s1,a0
    //print("MEM_BLOCK_SIZE: ", ' ');
    //print(MEM_BLOCK_SIZE, '\n', 0);
    print("------Free Segment Lista------");
    8000294c:	00a00593          	li	a1,10
    80002950:	00006517          	auipc	a0,0x6
    80002954:	a3850513          	addi	a0,a0,-1480 # 80008388 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2d0>
    80002958:	00001097          	auipc	ra,0x1
    8000295c:	874080e7          	jalr	-1932(ra) # 800031cc <_Z5printPKcc>
    if(!fmem_head)
    80002960:	0084b783          	ld	a5,8(s1)
    80002964:	04078463          	beqz	a5,800029ac <_ZN15MemoryAllocator10print_listEv+0x78>
        print("LISTA JE PRAZNA!");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002968:	0084b483          	ld	s1,8(s1)
    8000296c:	04048c63          	beqz	s1,800029c4 <_ZN15MemoryAllocator10print_listEv+0x90>
        print((uint64)curr, '\n', 0);
    80002970:	00000613          	li	a2,0
    80002974:	00a00593          	li	a1,10
    80002978:	00048513          	mv	a0,s1
    8000297c:	00000097          	auipc	ra,0x0
    80002980:	704080e7          	jalr	1796(ra) # 80003080 <_Z5printmcb>
        print((uint64)curr->size, '\n', 0);
    80002984:	00000613          	li	a2,0
    80002988:	00a00593          	li	a1,10
    8000298c:	0084b503          	ld	a0,8(s1)
    80002990:	00000097          	auipc	ra,0x0
    80002994:	6f0080e7          	jalr	1776(ra) # 80003080 <_Z5printmcb>
        __putc('\n');
    80002998:	00a00513          	li	a0,10
    8000299c:	00004097          	auipc	ra,0x4
    800029a0:	680080e7          	jalr	1664(ra) # 8000701c <__putc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    800029a4:	0004b483          	ld	s1,0(s1)
    800029a8:	fc5ff06f          	j	8000296c <_ZN15MemoryAllocator10print_listEv+0x38>
        print("LISTA JE PRAZNA!");
    800029ac:	00a00593          	li	a1,10
    800029b0:	00006517          	auipc	a0,0x6
    800029b4:	9f850513          	addi	a0,a0,-1544 # 800083a8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2f0>
    800029b8:	00001097          	auipc	ra,0x1
    800029bc:	814080e7          	jalr	-2028(ra) # 800031cc <_Z5printPKcc>
    800029c0:	fa9ff06f          	j	80002968 <_ZN15MemoryAllocator10print_listEv+0x34>
    }
    print("------------------------------");
    800029c4:	00a00593          	li	a1,10
    800029c8:	00006517          	auipc	a0,0x6
    800029cc:	9f850513          	addi	a0,a0,-1544 # 800083c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x308>
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	7fc080e7          	jalr	2044(ra) # 800031cc <_Z5printPKcc>
}
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	02010113          	addi	sp,sp,32
    800029e8:	00008067          	ret

00000000800029ec <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    800029ec:	ff010113          	addi	sp,sp,-16
    800029f0:	00813423          	sd	s0,8(sp)
    800029f4:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    800029f8:	00852683          	lw	a3,8(a0)
    800029fc:	0085a703          	lw	a4,8(a1)
    80002a00:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    80002a04:	0007cc63          	bltz	a5,80002a1c <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    80002a08:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    80002a0c:	00078513          	mv	a0,a5
    80002a10:	00813403          	ld	s0,8(sp)
    80002a14:	01010113          	addi	sp,sp,16
    80002a18:	00008067          	ret
        x2->sleep_time = -diff;
    80002a1c:	40d7073b          	subw	a4,a4,a3
    80002a20:	00e5b423          	sd	a4,8(a1)
    80002a24:	fe9ff06f          	j	80002a0c <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

0000000080002a28 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    80002a28:	ff010113          	addi	sp,sp,-16
    80002a2c:	00813423          	sd	s0,8(sp)
    80002a30:	01010413          	addi	s0,sp,16
    80002a34:	00100793          	li	a5,1
    80002a38:	00f50863          	beq	a0,a5,80002a48 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002a3c:	00813403          	ld	s0,8(sp)
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00008067          	ret
    80002a48:	000107b7          	lui	a5,0x10
    80002a4c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002a50:	fef596e3          	bne	a1,a5,80002a3c <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80002a54:	00007797          	auipc	a5,0x7
    80002a58:	4fc78793          	addi	a5,a5,1276 # 80009f50 <_ZN9Scheduler5queueE>
    80002a5c:	0007b023          	sd	zero,0(a5)
    80002a60:	0007b423          	sd	zero,8(a5)
    80002a64:	0007b823          	sd	zero,16(a5)
    80002a68:	0007bc23          	sd	zero,24(a5)
    80002a6c:	fd1ff06f          	j	80002a3c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002a70 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80002a70:	ff010113          	addi	sp,sp,-16
    80002a74:	00113423          	sd	ra,8(sp)
    80002a78:	00813023          	sd	s0,0(sp)
    80002a7c:	01010413          	addi	s0,sp,16
    80002a80:	00007517          	auipc	a0,0x7
    80002a84:	4d050513          	addi	a0,a0,1232 # 80009f50 <_ZN9Scheduler5queueE>
    80002a88:	00002097          	auipc	ra,0x2
    80002a8c:	8e0080e7          	jalr	-1824(ra) # 80004368 <_ZN8TcbQueue6removeEv>
    80002a90:	00813083          	ld	ra,8(sp)
    80002a94:	00013403          	ld	s0,0(sp)
    80002a98:	01010113          	addi	sp,sp,16
    80002a9c:	00008067          	ret

0000000080002aa0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00113423          	sd	ra,8(sp)
    80002aa8:	00813023          	sd	s0,0(sp)
    80002aac:	01010413          	addi	s0,sp,16
    80002ab0:	00050593          	mv	a1,a0
    80002ab4:	00007517          	auipc	a0,0x7
    80002ab8:	49c50513          	addi	a0,a0,1180 # 80009f50 <_ZN9Scheduler5queueE>
    80002abc:	00002097          	auipc	ra,0x2
    80002ac0:	878080e7          	jalr	-1928(ra) # 80004334 <_ZN8TcbQueue6insertEP3TCB>
    80002ac4:	00813083          	ld	ra,8(sp)
    80002ac8:	00013403          	ld	s0,0(sp)
    80002acc:	01010113          	addi	sp,sp,16
    80002ad0:	00008067          	ret

0000000080002ad4 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    80002ad4:	ff010113          	addi	sp,sp,-16
    80002ad8:	00813423          	sd	s0,8(sp)
    80002adc:	01010413          	addi	s0,sp,16
    80002ae0:	00813403          	ld	s0,8(sp)
    80002ae4:	01010113          	addi	sp,sp,16
    80002ae8:	00008067          	ret

0000000080002aec <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    80002aec:	ff010113          	addi	sp,sp,-16
    80002af0:	00813423          	sd	s0,8(sp)
    80002af4:	01010413          	addi	s0,sp,16
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16
    80002b14:	00007517          	auipc	a0,0x7
    80002b18:	43c50513          	addi	a0,a0,1084 # 80009f50 <_ZN9Scheduler5queueE>
    80002b1c:	00002097          	auipc	ra,0x2
    80002b20:	8ac080e7          	jalr	-1876(ra) # 800043c8 <_ZN8TcbQueue10printQueueEv>
    80002b24:	00813083          	ld	ra,8(sp)
    80002b28:	00013403          	ld	s0,0(sp)
    80002b2c:	01010113          	addi	sp,sp,16
    80002b30:	00008067          	ret

0000000080002b34 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    80002b34:	ff010113          	addi	sp,sp,-16
    80002b38:	00113423          	sd	ra,8(sp)
    80002b3c:	00813023          	sd	s0,0(sp)
    80002b40:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    80002b44:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80002b48:	00000617          	auipc	a2,0x0
    80002b4c:	ea460613          	addi	a2,a2,-348 # 800029ec <_ZN9Scheduler3cmpEP3TCBS1_>
    80002b50:	00050593          	mv	a1,a0
    80002b54:	00007517          	auipc	a0,0x7
    80002b58:	40c50513          	addi	a0,a0,1036 # 80009f60 <_ZN9Scheduler8sleepingE>
    80002b5c:	00002097          	auipc	ra,0x2
    80002b60:	8e0080e7          	jalr	-1824(ra) # 8000443c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80002b64:	00813083          	ld	ra,8(sp)
    80002b68:	00013403          	ld	s0,0(sp)
    80002b6c:	01010113          	addi	sp,sp,16
    80002b70:	00008067          	ret

0000000080002b74 <_ZN9Scheduler12update_sleepEv>:
{
    80002b74:	fe010113          	addi	sp,sp,-32
    80002b78:	00113c23          	sd	ra,24(sp)
    80002b7c:	00813823          	sd	s0,16(sp)
    80002b80:	00913423          	sd	s1,8(sp)
    80002b84:	01213023          	sd	s2,0(sp)
    80002b88:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    80002b8c:	00007517          	auipc	a0,0x7
    80002b90:	3d450513          	addi	a0,a0,980 # 80009f60 <_ZN9Scheduler8sleepingE>
    80002b94:	00002097          	auipc	ra,0x2
    80002b98:	818080e7          	jalr	-2024(ra) # 800043ac <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    80002b9c:	04050e63          	beqz	a0,80002bf8 <_ZN9Scheduler12update_sleepEv+0x84>
    80002ba0:	00050493          	mv	s1,a0
    t->sleep_time--;
    80002ba4:	00853783          	ld	a5,8(a0)
    80002ba8:	fff78793          	addi	a5,a5,-1
    80002bac:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    80002bb0:	04048463          	beqz	s1,80002bf8 <_ZN9Scheduler12update_sleepEv+0x84>
    80002bb4:	0084b783          	ld	a5,8(s1)
    80002bb8:	04079063          	bnez	a5,80002bf8 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    80002bbc:	00007917          	auipc	s2,0x7
    80002bc0:	3a490913          	addi	s2,s2,932 # 80009f60 <_ZN9Scheduler8sleepingE>
    80002bc4:	00090513          	mv	a0,s2
    80002bc8:	00001097          	auipc	ra,0x1
    80002bcc:	7a0080e7          	jalr	1952(ra) # 80004368 <_ZN8TcbQueue6removeEv>
        if(!allocator.invalidFreeAddress(this))
            allocator.mem_free(stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    80002bd0:	00100793          	li	a5,1
    80002bd4:	02f4ac23          	sw	a5,56(s1)
        put(t);
    80002bd8:	00048513          	mv	a0,s1
    80002bdc:	00000097          	auipc	ra,0x0
    80002be0:	ec4080e7          	jalr	-316(ra) # 80002aa0 <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    80002be4:	00090513          	mv	a0,s2
    80002be8:	00001097          	auipc	ra,0x1
    80002bec:	7c4080e7          	jalr	1988(ra) # 800043ac <_ZN8TcbQueue3topEv>
    80002bf0:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    80002bf4:	fbdff06f          	j	80002bb0 <_ZN9Scheduler12update_sleepEv+0x3c>
    80002bf8:	01813083          	ld	ra,24(sp)
    80002bfc:	01013403          	ld	s0,16(sp)
    80002c00:	00813483          	ld	s1,8(sp)
    80002c04:	00013903          	ld	s2,0(sp)
    80002c08:	02010113          	addi	sp,sp,32
    80002c0c:	00008067          	ret

0000000080002c10 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80002c10:	ff010113          	addi	sp,sp,-16
    80002c14:	00113423          	sd	ra,8(sp)
    80002c18:	00813023          	sd	s0,0(sp)
    80002c1c:	01010413          	addi	s0,sp,16
    80002c20:	000105b7          	lui	a1,0x10
    80002c24:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002c28:	00100513          	li	a0,1
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	dfc080e7          	jalr	-516(ra) # 80002a28 <_Z41__static_initialization_and_destruction_0ii>
    80002c34:	00813083          	ld	ra,8(sp)
    80002c38:	00013403          	ld	s0,0(sp)
    80002c3c:	01010113          	addi	sp,sp,16
    80002c40:	00008067          	ret

0000000080002c44 <_ZN5Riscv10popSppSpieEv>:
#include"../../h/syscall_c.h"
TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

void Riscv::popSppSpie() 
{
    80002c44:	ff010113          	addi	sp,sp,-16
    80002c48:	00813423          	sd	s0,8(sp)
    80002c4c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002c50:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002c54:	10200073          	sret
}
    80002c58:	00813403          	ld	s0,8(sp)
    80002c5c:	01010113          	addi	sp,sp,16
    80002c60:	00008067          	ret

0000000080002c64 <_ZN3TCBC1EPFvPvES0_Pmm>:
TCB* TCB::createThread(Body body, void* args, uint64* stack)
{
    return new TCB(body, args, stack);
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80002c64:	fe010113          	addi	sp,sp,-32
    80002c68:	00113c23          	sd	ra,24(sp)
    80002c6c:	00813823          	sd	s0,16(sp)
    80002c70:	00913423          	sd	s1,8(sp)
    80002c74:	02010413          	addi	s0,sp,32
    80002c78:	00050493          	mv	s1,a0
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80002c7c:	00053023          	sd	zero,0(a0)
    80002c80:	00053423          	sd	zero,8(a0)
    80002c84:	00b53c23          	sd	a1,24(a0)
    80002c88:	02c53023          	sd	a2,32(a0)
    80002c8c:	02d53423          	sd	a3,40(a0)
    80002c90:	02e53823          	sd	a4,48(a0)
    80002c94:	00100793          	li	a5,1
    80002c98:	02f52c23          	sw	a5,56(a0)
    80002c9c:	02050e23          	sb	zero,60(a0)
    80002ca0:	02f50ea3          	sb	a5,61(a0)
    80002ca4:	02050f23          	sb	zero,62(a0)
    80002ca8:	00000797          	auipc	a5,0x0
    80002cac:	17c78793          	addi	a5,a5,380 # 80002e24 <_ZN3TCB13threadWrapperEv>
    80002cb0:	04f53023          	sd	a5,64(a0)
    80002cb4:	06068263          	beqz	a3,80002d18 <_ZN3TCBC1EPFvPvES0_Pmm+0xb4>
    80002cb8:	000017b7          	lui	a5,0x1
    80002cbc:	00f686b3          	add	a3,a3,a5
    80002cc0:	04d4b423          	sd	a3,72(s1)
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002cc4:	00000097          	auipc	ra,0x0
    80002cc8:	990080e7          	jalr	-1648(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002ccc:	00100593          	li	a1,1
    80002cd0:	00000097          	auipc	ra,0x0
    80002cd4:	9f4080e7          	jalr	-1548(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80002cd8:	00052023          	sw	zero,0(a0)
    80002cdc:	00053423          	sd	zero,8(a0)
    80002ce0:	00053823          	sd	zero,16(a0)
{    
    out_sem = new KSemaphore(0);
    80002ce4:	00a4b823          	sd	a0,16(s1)
    if(body && stack)
    80002ce8:	0184b783          	ld	a5,24(s1)
    80002cec:	00078c63          	beqz	a5,80002d04 <_ZN3TCBC1EPFvPvES0_Pmm+0xa0>
    80002cf0:	0284b783          	ld	a5,40(s1)
    80002cf4:	00078863          	beqz	a5,80002d04 <_ZN3TCBC1EPFvPvES0_Pmm+0xa0>
        Scheduler::put(this);
    80002cf8:	00048513          	mv	a0,s1
    80002cfc:	00000097          	auipc	ra,0x0
    80002d00:	da4080e7          	jalr	-604(ra) # 80002aa0 <_ZN9Scheduler3putEP3TCB>
}   
    80002d04:	01813083          	ld	ra,24(sp)
    80002d08:	01013403          	ld	s0,16(sp)
    80002d0c:	00813483          	ld	s1,8(sp)
    80002d10:	02010113          	addi	sp,sp,32
    80002d14:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80002d18:	00000693          	li	a3,0
    80002d1c:	fa5ff06f          	j	80002cc0 <_ZN3TCBC1EPFvPvES0_Pmm+0x5c>

0000000080002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80002d20:	fd010113          	addi	sp,sp,-48
    80002d24:	02113423          	sd	ra,40(sp)
    80002d28:	02813023          	sd	s0,32(sp)
    80002d2c:	00913c23          	sd	s1,24(sp)
    80002d30:	01213823          	sd	s2,16(sp)
    80002d34:	01313423          	sd	s3,8(sp)
    80002d38:	01413023          	sd	s4,0(sp)
    80002d3c:	03010413          	addi	s0,sp,48
    80002d40:	00050913          	mv	s2,a0
    80002d44:	00058993          	mv	s3,a1
    80002d48:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002d4c:	00000097          	auipc	ra,0x0
    80002d50:	908080e7          	jalr	-1784(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002d54:	00200593          	li	a1,2
    80002d58:	00000097          	auipc	ra,0x0
    80002d5c:	96c080e7          	jalr	-1684(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    80002d60:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    80002d64:	00200713          	li	a4,2
    80002d68:	000a0693          	mv	a3,s4
    80002d6c:	00098613          	mv	a2,s3
    80002d70:	00090593          	mv	a1,s2
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	ef0080e7          	jalr	-272(ra) # 80002c64 <_ZN3TCBC1EPFvPvES0_Pmm>
    80002d7c:	0280006f          	j	80002da4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80002d80:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	8d0080e7          	jalr	-1840(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002d8c:	00048593          	mv	a1,s1
    80002d90:	00000097          	auipc	ra,0x0
    80002d94:	acc080e7          	jalr	-1332(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    80002d98:	00090513          	mv	a0,s2
    80002d9c:	00008097          	auipc	ra,0x8
    80002da0:	29c080e7          	jalr	668(ra) # 8000b038 <_Unwind_Resume>
}
    80002da4:	00048513          	mv	a0,s1
    80002da8:	02813083          	ld	ra,40(sp)
    80002dac:	02013403          	ld	s0,32(sp)
    80002db0:	01813483          	ld	s1,24(sp)
    80002db4:	01013903          	ld	s2,16(sp)
    80002db8:	00813983          	ld	s3,8(sp)
    80002dbc:	00013a03          	ld	s4,0(sp)
    80002dc0:	03010113          	addi	sp,sp,48
    80002dc4:	00008067          	ret

0000000080002dc8 <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    80002dc8:	ff010113          	addi	sp,sp,-16
    80002dcc:	00813423          	sd	s0,8(sp)
    80002dd0:	01010413          	addi	s0,sp,16
    if(running->userMode)
    80002dd4:	00007797          	auipc	a5,0x7
    80002dd8:	0fc78793          	addi	a5,a5,252 # 80009ed0 <_ZN3TCB7runningE>
    80002ddc:	0007b783          	ld	a5,0(a5)
    80002de0:	03d7c703          	lbu	a4,61(a5)
    80002de4:	00070c63          	beqz	a4,80002dfc <_ZN3TCB9initalizeEv+0x34>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002de8:	10000793          	li	a5,256
    80002dec:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    80002df0:	00813403          	ld	s0,8(sp)
    80002df4:	01010113          	addi	sp,sp,16
    80002df8:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002dfc:	10000713          	li	a4,256
    80002e00:	10072073          	csrs	sstatus,a4
        if(running->locked)
    80002e04:	03e7c783          	lbu	a5,62(a5)
    80002e08:	00078863          	beqz	a5,80002e18 <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002e0c:	02000793          	li	a5,32
    80002e10:	1007b073          	csrc	sstatus,a5
    80002e14:	fddff06f          	j	80002df0 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002e18:	02000793          	li	a5,32
    80002e1c:	1007a073          	csrs	sstatus,a5
}
    80002e20:	fd1ff06f          	j	80002df0 <_ZN3TCB9initalizeEv+0x28>

0000000080002e24 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    80002e24:	ff010113          	addi	sp,sp,-16
    80002e28:	00113423          	sd	ra,8(sp)
    80002e2c:	00813023          	sd	s0,0(sp)
    80002e30:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    80002e34:	00000097          	auipc	ra,0x0
    80002e38:	f94080e7          	jalr	-108(ra) # 80002dc8 <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    80002e3c:	00000097          	auipc	ra,0x0
    80002e40:	e08080e7          	jalr	-504(ra) # 80002c44 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80002e44:	00007797          	auipc	a5,0x7
    80002e48:	08c78793          	addi	a5,a5,140 # 80009ed0 <_ZN3TCB7runningE>
    80002e4c:	0007b783          	ld	a5,0(a5)
    80002e50:	0187b703          	ld	a4,24(a5)
    80002e54:	0207b503          	ld	a0,32(a5)
    80002e58:	000700e7          	jalr	a4
    thread_exit();
    80002e5c:	00001097          	auipc	ra,0x1
    80002e60:	ae0080e7          	jalr	-1312(ra) # 8000393c <thread_exit>
}
    80002e64:	00813083          	ld	ra,8(sp)
    80002e68:	00013403          	ld	s0,0(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret

0000000080002e74 <_ZN3TCB8dispatchEv>:

void TCB::dispatch()
{
    80002e74:	fe010113          	addi	sp,sp,-32
    80002e78:	00113c23          	sd	ra,24(sp)
    80002e7c:	00813823          	sd	s0,16(sp)
    80002e80:	00913423          	sd	s1,8(sp)
    80002e84:	01213023          	sd	s2,0(sp)
    80002e88:	02010413          	addi	s0,sp,32
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    80002e8c:	00007797          	auipc	a5,0x7
    80002e90:	04478793          	addi	a5,a5,68 # 80009ed0 <_ZN3TCB7runningE>
    80002e94:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80002e98:	0384a783          	lw	a5,56(s1)
    
    if(!oldRunning->isFinished() && !oldRunning->isSuspended())
    80002e9c:	00200713          	li	a4,2
    80002ea0:	02e78063          	beq	a5,a4,80002ec0 <_ZN3TCB8dispatchEv+0x4c>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80002ea4:	00078e63          	beqz	a5,80002ec0 <_ZN3TCB8dispatchEv+0x4c>
    80002ea8:	00300713          	li	a4,3
    80002eac:	00e78a63          	beq	a5,a4,80002ec0 <_ZN3TCB8dispatchEv+0x4c>
    {
        Scheduler::put(oldRunning);
    80002eb0:	00048513          	mv	a0,s1
    80002eb4:	00000097          	auipc	ra,0x0
    80002eb8:	bec080e7          	jalr	-1044(ra) # 80002aa0 <_ZN9Scheduler3putEP3TCB>
    80002ebc:	00c0006f          	j	80002ec8 <_ZN3TCB8dispatchEv+0x54>
    }
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    80002ec0:	00200713          	li	a4,2
    80002ec4:	02e78e63          	beq	a5,a4,80002f00 <_ZN3TCB8dispatchEv+0x8c>
    {
        delete oldRunning;
    }
    running = Scheduler::get(); 
    80002ec8:	00000097          	auipc	ra,0x0
    80002ecc:	ba8080e7          	jalr	-1112(ra) # 80002a70 <_ZN9Scheduler3getEv>
    80002ed0:	00007797          	auipc	a5,0x7
    80002ed4:	00a7b023          	sd	a0,0(a5) # 80009ed0 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80002ed8:	04050593          	addi	a1,a0,64
    80002edc:	04048513          	addi	a0,s1,64
    80002ee0:	ffffe097          	auipc	ra,0xffffe
    80002ee4:	230080e7          	jalr	560(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ee8:	01813083          	ld	ra,24(sp)
    80002eec:	01013403          	ld	s0,16(sp)
    80002ef0:	00813483          	ld	s1,8(sp)
    80002ef4:	00013903          	ld	s2,0(sp)
    80002ef8:	02010113          	addi	sp,sp,32
    80002efc:	00008067          	ret
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    80002f00:	03c4c783          	lbu	a5,60(s1)
    80002f04:	fc0782e3          	beqz	a5,80002ec8 <_ZN3TCB8dispatchEv+0x54>
        delete oldRunning;
    80002f08:	fc0480e3          	beqz	s1,80002ec8 <_ZN3TCB8dispatchEv+0x54>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80002f0c:	fffff097          	auipc	ra,0xfffff
    80002f10:	748080e7          	jalr	1864(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002f14:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    80002f18:	00048593          	mv	a1,s1
    80002f1c:	00000097          	auipc	ra,0x0
    80002f20:	87c080e7          	jalr	-1924(ra) # 80002798 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002f24:	00050e63          	beqz	a0,80002f40 <_ZN3TCB8dispatchEv+0xcc>
    80002f28:	fffff097          	auipc	ra,0xfffff
    80002f2c:	72c080e7          	jalr	1836(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002f30:	00048593          	mv	a1,s1
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	928080e7          	jalr	-1752(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    80002f3c:	f8dff06f          	j	80002ec8 <_ZN3TCB8dispatchEv+0x54>
            allocator.mem_free(stack);
    80002f40:	0284b583          	ld	a1,40(s1)
    80002f44:	00090513          	mv	a0,s2
    80002f48:	00000097          	auipc	ra,0x0
    80002f4c:	914080e7          	jalr	-1772(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    80002f50:	fd9ff06f          	j	80002f28 <_ZN3TCB8dispatchEv+0xb4>

0000000080002f54 <_ZN3TCB5yieldEv>:
{
    80002f54:	ff010113          	addi	sp,sp,-16
    80002f58:	00113423          	sd	ra,8(sp)
    80002f5c:	00813023          	sd	s0,0(sp)
    80002f60:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002f64:	ffffe097          	auipc	ra,0xffffe
    80002f68:	1c0080e7          	jalr	448(ra) # 80001124 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80002f6c:	00000097          	auipc	ra,0x0
    80002f70:	f08080e7          	jalr	-248(ra) # 80002e74 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002f74:	ffffe097          	auipc	ra,0xffffe
    80002f78:	22c080e7          	jalr	556(ra) # 800011a0 <_ZN5Riscv12popRegistersEv>
}
    80002f7c:	00813083          	ld	ra,8(sp)
    80002f80:	00013403          	ld	s0,0(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret

0000000080002f8c <_ZN3TCB12deleteThreadEPS_>:

void TCB::deleteThread(TCB* t)
{
    if(t)
    80002f8c:	0a050263          	beqz	a0,80003030 <_ZN3TCB12deleteThreadEPS_+0xa4>
    {
        if(running != t && t->isFinished())
    80002f90:	00007797          	auipc	a5,0x7
    80002f94:	f4078793          	addi	a5,a5,-192 # 80009ed0 <_ZN3TCB7runningE>
    80002f98:	0007b783          	ld	a5,0(a5)
    80002f9c:	00a78863          	beq	a5,a0,80002fac <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    80002fa0:	03852703          	lw	a4,56(a0)
    80002fa4:	00200793          	li	a5,2
    80002fa8:	00f70863          	beq	a4,a5,80002fb8 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    80002fac:	00100793          	li	a5,1
    80002fb0:	02f50e23          	sb	a5,60(a0)
        }        
    }
}
    80002fb4:	00008067          	ret
{
    80002fb8:	fe010113          	addi	sp,sp,-32
    80002fbc:	00113c23          	sd	ra,24(sp)
    80002fc0:	00813823          	sd	s0,16(sp)
    80002fc4:	00913423          	sd	s1,8(sp)
    80002fc8:	01213023          	sd	s2,0(sp)
    80002fcc:	02010413          	addi	s0,sp,32
    80002fd0:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80002fd4:	fffff097          	auipc	ra,0xfffff
    80002fd8:	680080e7          	jalr	1664(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002fdc:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    80002fe0:	00048593          	mv	a1,s1
    80002fe4:	fffff097          	auipc	ra,0xfffff
    80002fe8:	7b4080e7          	jalr	1972(ra) # 80002798 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002fec:	02050863          	beqz	a0,8000301c <_ZN3TCB12deleteThreadEPS_+0x90>
    80002ff0:	fffff097          	auipc	ra,0xfffff
    80002ff4:	664080e7          	jalr	1636(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80002ff8:	00048593          	mv	a1,s1
    80002ffc:	00000097          	auipc	ra,0x0
    80003000:	860080e7          	jalr	-1952(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003004:	01813083          	ld	ra,24(sp)
    80003008:	01013403          	ld	s0,16(sp)
    8000300c:	00813483          	ld	s1,8(sp)
    80003010:	00013903          	ld	s2,0(sp)
    80003014:	02010113          	addi	sp,sp,32
    80003018:	00008067          	ret
            allocator.mem_free(stack);
    8000301c:	0284b583          	ld	a1,40(s1)
    80003020:	00090513          	mv	a0,s2
    80003024:	00000097          	auipc	ra,0x0
    80003028:	838080e7          	jalr	-1992(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    8000302c:	fc5ff06f          	j	80002ff0 <_ZN3TCB12deleteThreadEPS_+0x64>
    80003030:	00008067          	ret

0000000080003034 <_ZN3TCB5sleepEm>:

void TCB::sleep(time_t t)
{
    80003034:	ff010113          	addi	sp,sp,-16
    80003038:	00113423          	sd	ra,8(sp)
    8000303c:	00813023          	sd	s0,0(sp)
    80003040:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80003044:	00007797          	auipc	a5,0x7
    80003048:	e8c78793          	addi	a5,a5,-372 # 80009ed0 <_ZN3TCB7runningE>
    8000304c:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80003050:	00300713          	li	a4,3
    80003054:	02e7ac23          	sw	a4,56(a5)
    Scheduler::put_sleeper(running, t);
    80003058:	00050593          	mv	a1,a0
    8000305c:	00078513          	mv	a0,a5
    80003060:	00000097          	auipc	ra,0x0
    80003064:	ad4080e7          	jalr	-1324(ra) # 80002b34 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80003068:	00000097          	auipc	ra,0x0
    8000306c:	eec080e7          	jalr	-276(ra) # 80002f54 <_ZN3TCB5yieldEv>
    80003070:	00813083          	ld	ra,8(sp)
    80003074:	00013403          	ld	s0,0(sp)
    80003078:	01010113          	addi	sp,sp,16
    8000307c:	00008067          	ret

0000000080003080 <_Z5printmcb>:
#include"../../h/riscv.hpp"
#include"../../h/syscall_c.h"
#include"../../h/syscall_cpp.hpp"
#include"../../test/printing.hpp"

void print(uint64 unum, char end, bool hex){
    80003080:	fa010113          	addi	sp,sp,-96
    80003084:	04113c23          	sd	ra,88(sp)
    80003088:	04813823          	sd	s0,80(sp)
    8000308c:	04913423          	sd	s1,72(sp)
    80003090:	05213023          	sd	s2,64(sp)
    80003094:	03313c23          	sd	s3,56(sp)
    80003098:	03413823          	sd	s4,48(sp)
    8000309c:	06010413          	addi	s0,sp,96
    800030a0:	00050913          	mv	s2,a0
    800030a4:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800030a8:	100027f3          	csrr	a5,sstatus
    800030ac:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800030b0:	fa843983          	ld	s3,-88(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800030b4:	00200793          	li	a5,2
    800030b8:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    800030bc:	04061e63          	bnez	a2,80003118 <_Z5printmcb+0x98>
    int i = 0;
    800030c0:	00000493          	li	s1,0
    800030c4:	00c0006f          	j	800030d0 <_Z5printmcb+0x50>
    do{
        buffer[i++] = '0' + unum1%10;
    800030c8:	00060493          	mv	s1,a2
        unum1/=10;
    800030cc:	00078913          	mv	s2,a5
        buffer[i++] = '0' + unum1%10;
    800030d0:	00a00793          	li	a5,10
    800030d4:	02f97733          	remu	a4,s2,a5
    800030d8:	0014861b          	addiw	a2,s1,1
    800030dc:	03070713          	addi	a4,a4,48
    800030e0:	fd040693          	addi	a3,s0,-48
    800030e4:	009686b3          	add	a3,a3,s1
    800030e8:	fee68023          	sb	a4,-32(a3)
        unum1/=10;
    800030ec:	02f957b3          	divu	a5,s2,a5
    }while(unum1 > 0);
    800030f0:	00900713          	li	a4,9
    800030f4:	fd276ae3          	bltu	a4,s2,800030c8 <_Z5printmcb+0x48>
    for(int j = i-1; j >= 0; j--)
    800030f8:	0804cc63          	bltz	s1,80003190 <_Z5printmcb+0x110>
        __putc(buffer[j]);
    800030fc:	fd040793          	addi	a5,s0,-48
    80003100:	009787b3          	add	a5,a5,s1
    80003104:	fe07c503          	lbu	a0,-32(a5)
    80003108:	00004097          	auipc	ra,0x4
    8000310c:	f14080e7          	jalr	-236(ra) # 8000701c <__putc>
    for(int j = i-1; j >= 0; j--)
    80003110:	fff4849b          	addiw	s1,s1,-1
    80003114:	fe5ff06f          	j	800030f8 <_Z5printmcb+0x78>
    }else{
    //__putc('\n');
    __putc('0');
    80003118:	03000513          	li	a0,48
    8000311c:	00004097          	auipc	ra,0x4
    80003120:	f00080e7          	jalr	-256(ra) # 8000701c <__putc>
    __putc('x');
    80003124:	07800513          	li	a0,120
    80003128:	00004097          	auipc	ra,0x4
    8000312c:	ef4080e7          	jalr	-268(ra) # 8000701c <__putc>
    
    const char* numbers = "0123456789ABCDEF";
    unum1 = unum;
    i = 0;
    80003130:	00000493          	li	s1,0
    80003134:	00c0006f          	j	80003140 <_Z5printmcb+0xc0>
    do{
        buffer[i++] = numbers[unum1%16];
    80003138:	00068493          	mv	s1,a3
        unum1/=16;
    8000313c:	00070913          	mv	s2,a4
        buffer[i++] = numbers[unum1%16];
    80003140:	00f97793          	andi	a5,s2,15
    80003144:	0014869b          	addiw	a3,s1,1
    80003148:	00005717          	auipc	a4,0x5
    8000314c:	2c870713          	addi	a4,a4,712 # 80008410 <_ZTV14PeriodicWorker+0x30>
    80003150:	00e787b3          	add	a5,a5,a4
    80003154:	0007c703          	lbu	a4,0(a5)
    80003158:	fd040793          	addi	a5,s0,-48
    8000315c:	009787b3          	add	a5,a5,s1
    80003160:	fee78023          	sb	a4,-32(a5)
        unum1/=16;
    80003164:	00495713          	srli	a4,s2,0x4
    } while(unum1 > 0);
    80003168:	00f00793          	li	a5,15
    8000316c:	fd27e6e3          	bltu	a5,s2,80003138 <_Z5printmcb+0xb8>
    for(int j = i-1; j >= 0; j--)
    80003170:	0204c063          	bltz	s1,80003190 <_Z5printmcb+0x110>
        __putc(buffer[j]);
    80003174:	fd040793          	addi	a5,s0,-48
    80003178:	009787b3          	add	a5,a5,s1
    8000317c:	fe07c503          	lbu	a0,-32(a5)
    80003180:	00004097          	auipc	ra,0x4
    80003184:	e9c080e7          	jalr	-356(ra) # 8000701c <__putc>
    for(int j = i-1; j >= 0; j--)
    80003188:	fff4849b          	addiw	s1,s1,-1
    8000318c:	fe5ff06f          	j	80003170 <_Z5printmcb+0xf0>
    }
    __putc(end);
    80003190:	000a0513          	mv	a0,s4
    80003194:	00004097          	auipc	ra,0x4
    80003198:	e88080e7          	jalr	-376(ra) # 8000701c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    8000319c:	0009899b          	sext.w	s3,s3
    800031a0:	0029f993          	andi	s3,s3,2
    800031a4:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800031a8:	1009a073          	csrs	sstatus,s3
}
    800031ac:	05813083          	ld	ra,88(sp)
    800031b0:	05013403          	ld	s0,80(sp)
    800031b4:	04813483          	ld	s1,72(sp)
    800031b8:	04013903          	ld	s2,64(sp)
    800031bc:	03813983          	ld	s3,56(sp)
    800031c0:	03013a03          	ld	s4,48(sp)
    800031c4:	06010113          	addi	sp,sp,96
    800031c8:	00008067          	ret

00000000800031cc <_Z5printPKcc>:

void print(const char* str, char end){
    800031cc:	fc010113          	addi	sp,sp,-64
    800031d0:	02113c23          	sd	ra,56(sp)
    800031d4:	02813823          	sd	s0,48(sp)
    800031d8:	02913423          	sd	s1,40(sp)
    800031dc:	03213023          	sd	s2,32(sp)
    800031e0:	01313c23          	sd	s3,24(sp)
    800031e4:	01413823          	sd	s4,16(sp)
    800031e8:	04010413          	addi	s0,sp,64
    800031ec:	00050913          	mv	s2,a0
    800031f0:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800031f4:	100027f3          	csrr	a5,sstatus
    800031f8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800031fc:	fc843983          	ld	s3,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003200:	00200793          	li	a5,2
    80003204:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
    80003208:	00000493          	li	s1,0
    8000320c:	009907b3          	add	a5,s2,s1
    80003210:	0007c503          	lbu	a0,0(a5)
    80003214:	00050a63          	beqz	a0,80003228 <_Z5printPKcc+0x5c>
        __putc(str[i]);
    80003218:	00004097          	auipc	ra,0x4
    8000321c:	e04080e7          	jalr	-508(ra) # 8000701c <__putc>
    for(int i = 0; str[i]; i++)
    80003220:	0014849b          	addiw	s1,s1,1
    80003224:	fe9ff06f          	j	8000320c <_Z5printPKcc+0x40>
    __putc(end);
    80003228:	000a0513          	mv	a0,s4
    8000322c:	00004097          	auipc	ra,0x4
    80003230:	df0080e7          	jalr	-528(ra) # 8000701c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80003234:	0009899b          	sext.w	s3,s3
    80003238:	0029f993          	andi	s3,s3,2
    8000323c:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80003240:	1009a073          	csrs	sstatus,s3

}
    80003244:	03813083          	ld	ra,56(sp)
    80003248:	03013403          	ld	s0,48(sp)
    8000324c:	02813483          	ld	s1,40(sp)
    80003250:	02013903          	ld	s2,32(sp)
    80003254:	01813983          	ld	s3,24(sp)
    80003258:	01013a03          	ld	s4,16(sp)
    8000325c:	04010113          	addi	sp,sp,64
    80003260:	00008067          	ret

0000000080003264 <_Z5printPKcmb>:

void print(const char* str, uint64 t, bool hex){
    80003264:	fc010113          	addi	sp,sp,-64
    80003268:	02113c23          	sd	ra,56(sp)
    8000326c:	02813823          	sd	s0,48(sp)
    80003270:	02913423          	sd	s1,40(sp)
    80003274:	03213023          	sd	s2,32(sp)
    80003278:	01313c23          	sd	s3,24(sp)
    8000327c:	04010413          	addi	s0,sp,64
    80003280:	00058913          	mv	s2,a1
    80003284:	00060993          	mv	s3,a2
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003288:	100027f3          	csrr	a5,sstatus
    8000328c:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003290:	fc843483          	ld	s1,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003294:	00200793          	li	a5,2
    80003298:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    8000329c:	02000593          	li	a1,32
    800032a0:	00000097          	auipc	ra,0x0
    800032a4:	f2c080e7          	jalr	-212(ra) # 800031cc <_Z5printPKcc>
    print(t, '\n', hex);
    800032a8:	00098613          	mv	a2,s3
    800032ac:	00a00593          	li	a1,10
    800032b0:	00090513          	mv	a0,s2
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	dcc080e7          	jalr	-564(ra) # 80003080 <_Z5printmcb>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800032bc:	0004849b          	sext.w	s1,s1
    800032c0:	0024f493          	andi	s1,s1,2
    800032c4:	0004849b          	sext.w	s1,s1
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800032c8:	1004a073          	csrs	sstatus,s1
}
    800032cc:	03813083          	ld	ra,56(sp)
    800032d0:	03013403          	ld	s0,48(sp)
    800032d4:	02813483          	ld	s1,40(sp)
    800032d8:	02013903          	ld	s2,32(sp)
    800032dc:	01813983          	ld	s3,24(sp)
    800032e0:	04010113          	addi	sp,sp,64
    800032e4:	00008067          	ret

00000000800032e8 <_Z9allocTestR15MemoryAllocatorm>:

void* allocTest(MemoryAllocator& allocator, size_t size){
    800032e8:	fe010113          	addi	sp,sp,-32
    800032ec:	00113c23          	sd	ra,24(sp)
    800032f0:	00813823          	sd	s0,16(sp)
    800032f4:	00913423          	sd	s1,8(sp)
    800032f8:	01213023          	sd	s2,0(sp)
    800032fc:	02010413          	addi	s0,sp,32
    80003300:	00050493          	mv	s1,a0
    80003304:	00058913          	mv	s2,a1
    print("\nAlokacija", ' ');
    80003308:	02000593          	li	a1,32
    8000330c:	00005517          	auipc	a0,0x5
    80003310:	11c50513          	addi	a0,a0,284 # 80008428 <_ZTV14PeriodicWorker+0x48>
    80003314:	00000097          	auipc	ra,0x0
    80003318:	eb8080e7          	jalr	-328(ra) # 800031cc <_Z5printPKcc>
    print(size, ' ');
    8000331c:	00100613          	li	a2,1
    80003320:	02000593          	li	a1,32
    80003324:	00090513          	mv	a0,s2
    80003328:	00000097          	auipc	ra,0x0
    8000332c:	d58080e7          	jalr	-680(ra) # 80003080 <_Z5printmcb>
    print("blokova");
    80003330:	00a00593          	li	a1,10
    80003334:	00005517          	auipc	a0,0x5
    80003338:	10450513          	addi	a0,a0,260 # 80008438 <_ZTV14PeriodicWorker+0x58>
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	e90080e7          	jalr	-368(ra) # 800031cc <_Z5printPKcc>
    char* newblc = (char*)allocator.mem_alloc(size);
    80003344:	00090593          	mv	a1,s2
    80003348:	00048513          	mv	a0,s1
    8000334c:	fffff097          	auipc	ra,0xfffff
    80003350:	378080e7          	jalr	888(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    80003354:	00050913          	mv	s2,a0
    allocator.print_list();  
    80003358:	00048513          	mv	a0,s1
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	5d8080e7          	jalr	1496(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>
    return newblc;
}
    80003364:	00090513          	mv	a0,s2
    80003368:	01813083          	ld	ra,24(sp)
    8000336c:	01013403          	ld	s0,16(sp)
    80003370:	00813483          	ld	s1,8(sp)
    80003374:	00013903          	ld	s2,0(sp)
    80003378:	02010113          	addi	sp,sp,32
    8000337c:	00008067          	ret

0000000080003380 <_Z8freeTestR15MemoryAllocatorPv>:

void freeTest(MemoryAllocator& allocator, void* adr){
    80003380:	fe010113          	addi	sp,sp,-32
    80003384:	00113c23          	sd	ra,24(sp)
    80003388:	00813823          	sd	s0,16(sp)
    8000338c:	00913423          	sd	s1,8(sp)
    80003390:	01213023          	sd	s2,0(sp)
    80003394:	02010413          	addi	s0,sp,32
    80003398:	00050493          	mv	s1,a0
    8000339c:	00058913          	mv	s2,a1
    print("\nDealogkacija");
    800033a0:	00a00593          	li	a1,10
    800033a4:	00005517          	auipc	a0,0x5
    800033a8:	09c50513          	addi	a0,a0,156 # 80008440 <_ZTV14PeriodicWorker+0x60>
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	e20080e7          	jalr	-480(ra) # 800031cc <_Z5printPKcc>
    if(allocator.mem_free(adr) < 0)
    800033b4:	00090593          	mv	a1,s2
    800033b8:	00048513          	mv	a0,s1
    800033bc:	fffff097          	auipc	ra,0xfffff
    800033c0:	4a0080e7          	jalr	1184(ra) # 8000285c <_ZN15MemoryAllocator8mem_freeEPv>
    800033c4:	02054863          	bltz	a0,800033f4 <_Z8freeTestR15MemoryAllocatorPv+0x74>
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
    800033c8:	00a00593          	li	a1,10
    800033cc:	00005517          	auipc	a0,0x5
    800033d0:	08450513          	addi	a0,a0,132 # 80008450 <_ZTV14PeriodicWorker+0x70>
    800033d4:	00000097          	auipc	ra,0x0
    800033d8:	df8080e7          	jalr	-520(ra) # 800031cc <_Z5printPKcc>
}
    800033dc:	01813083          	ld	ra,24(sp)
    800033e0:	01013403          	ld	s0,16(sp)
    800033e4:	00813483          	ld	s1,8(sp)
    800033e8:	00013903          	ld	s2,0(sp)
    800033ec:	02010113          	addi	sp,sp,32
    800033f0:	00008067          	ret
        allocator.print_list();
    800033f4:	00048513          	mv	a0,s1
    800033f8:	fffff097          	auipc	ra,0xfffff
    800033fc:	53c080e7          	jalr	1340(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>
    80003400:	fddff06f          	j	800033dc <_Z8freeTestR15MemoryAllocatorPv+0x5c>

0000000080003404 <_Z7memTestv>:

void memTest(){
    80003404:	fe010113          	addi	sp,sp,-32
    80003408:	00113c23          	sd	ra,24(sp)
    8000340c:	00813823          	sd	s0,16(sp)
    80003410:	00913423          	sd	s1,8(sp)
    80003414:	01213023          	sd	s2,0(sp)
    80003418:	02010413          	addi	s0,sp,32
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	238080e7          	jalr	568(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003424:	00050493          	mv	s1,a0
    allocator.print_list();
    80003428:	fffff097          	auipc	ra,0xfffff
    8000342c:	50c080e7          	jalr	1292(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(50);
    80003430:	03200513          	li	a0,50
    80003434:	00000097          	auipc	ra,0x0
    80003438:	3e8080e7          	jalr	1000(ra) # 8000381c <mem_alloc>
    
    allocator.print_list();
    8000343c:	00048513          	mv	a0,s1
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	4f4080e7          	jalr	1268(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>

    char* t = (char*)mem_alloc(100);
    80003448:	06400513          	li	a0,100
    8000344c:	00000097          	auipc	ra,0x0
    80003450:	3d0080e7          	jalr	976(ra) # 8000381c <mem_alloc>
    80003454:	00050913          	mv	s2,a0
    print("t:", (uint64)t, 0);
    80003458:	00000613          	li	a2,0
    8000345c:	00050593          	mv	a1,a0
    80003460:	00005517          	auipc	a0,0x5
    80003464:	00850513          	addi	a0,a0,8 # 80008468 <_ZTV14PeriodicWorker+0x88>
    80003468:	00000097          	auipc	ra,0x0
    8000346c:	dfc080e7          	jalr	-516(ra) # 80003264 <_Z5printPKcmb>

    allocator.print_list();
    80003470:	00048513          	mv	a0,s1
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	4c0080e7          	jalr	1216(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(300);
    8000347c:	12c00513          	li	a0,300
    80003480:	00000097          	auipc	ra,0x0
    80003484:	39c080e7          	jalr	924(ra) # 8000381c <mem_alloc>

    allocator.print_list();
    80003488:	00048513          	mv	a0,s1
    8000348c:	fffff097          	auipc	ra,0xfffff
    80003490:	4a8080e7          	jalr	1192(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>
    
    print("free_res:", mem_free(t), 0);
    80003494:	00090513          	mv	a0,s2
    80003498:	00000097          	auipc	ra,0x0
    8000349c:	3bc080e7          	jalr	956(ra) # 80003854 <mem_free>
    800034a0:	00000613          	li	a2,0
    800034a4:	00050593          	mv	a1,a0
    800034a8:	00005517          	auipc	a0,0x5
    800034ac:	fc850513          	addi	a0,a0,-56 # 80008470 <_ZTV14PeriodicWorker+0x90>
    800034b0:	00000097          	auipc	ra,0x0
    800034b4:	db4080e7          	jalr	-588(ra) # 80003264 <_Z5printPKcmb>
    
    allocator.print_list();
    800034b8:	00048513          	mv	a0,s1
    800034bc:	fffff097          	auipc	ra,0xfffff
    800034c0:	478080e7          	jalr	1144(ra) # 80002934 <_ZN15MemoryAllocator10print_listEv>
}
    800034c4:	01813083          	ld	ra,24(sp)
    800034c8:	01013403          	ld	s0,16(sp)
    800034cc:	00813483          	ld	s1,8(sp)
    800034d0:	00013903          	ld	s2,0(sp)
    800034d4:	02010113          	addi	sp,sp,32
    800034d8:	00008067          	ret

00000000800034dc <_Z8print_a0v>:

void print_a0(){
    800034dc:	fe010113          	addi	sp,sp,-32
    800034e0:	00113c23          	sd	ra,24(sp)
    800034e4:	00813823          	sd	s0,16(sp)
    800034e8:	00913423          	sd	s1,8(sp)
    800034ec:	02010413          	addi	s0,sp,32
    asm volatile("mv %0, a0" : "=r" (a0));
    800034f0:	00050493          	mv	s1,a0
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    800034f4:	02000593          	li	a1,32
    800034f8:	00005517          	auipc	a0,0x5
    800034fc:	f8850513          	addi	a0,a0,-120 # 80008480 <_ZTV14PeriodicWorker+0xa0>
    80003500:	00000097          	auipc	ra,0x0
    80003504:	ccc080e7          	jalr	-820(ra) # 800031cc <_Z5printPKcc>
    print(a0, '\n', 1);
    80003508:	00100613          	li	a2,1
    8000350c:	00a00593          	li	a1,10
    80003510:	00048513          	mv	a0,s1
    80003514:	00000097          	auipc	ra,0x0
    80003518:	b6c080e7          	jalr	-1172(ra) # 80003080 <_Z5printmcb>
    //asm volatile("mv a0, %0" : : "r" (a0));
}
    8000351c:	01813083          	ld	ra,24(sp)
    80003520:	01013403          	ld	s0,16(sp)
    80003524:	00813483          	ld	s1,8(sp)
    80003528:	02010113          	addi	sp,sp,32
    8000352c:	00008067          	ret

0000000080003530 <_Z19print_sup_registersv>:

void print_sup_registers(){ 
    80003530:	fd010113          	addi	sp,sp,-48
    80003534:	02113423          	sd	ra,40(sp)
    80003538:	02813023          	sd	s0,32(sp)
    8000353c:	03010413          	addi	s0,sp,48

    print("sstatus:",' ');
    80003540:	02000593          	li	a1,32
    80003544:	00005517          	auipc	a0,0x5
    80003548:	f4450513          	addi	a0,a0,-188 # 80008488 <_ZTV14PeriodicWorker+0xa8>
    8000354c:	00000097          	auipc	ra,0x0
    80003550:	c80080e7          	jalr	-896(ra) # 800031cc <_Z5printPKcc>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003554:	100027f3          	csrr	a5,sstatus
    80003558:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    8000355c:	fe843503          	ld	a0,-24(s0)
    print(Riscv::r_sstatus(), '\n', 1);
    80003560:	00100613          	li	a2,1
    80003564:	00a00593          	li	a1,10
    80003568:	00000097          	auipc	ra,0x0
    8000356c:	b18080e7          	jalr	-1256(ra) # 80003080 <_Z5printmcb>

    print("sip:",' ');
    80003570:	02000593          	li	a1,32
    80003574:	00005517          	auipc	a0,0x5
    80003578:	f2450513          	addi	a0,a0,-220 # 80008498 <_ZTV14PeriodicWorker+0xb8>
    8000357c:	00000097          	auipc	ra,0x0
    80003580:	c50080e7          	jalr	-944(ra) # 800031cc <_Z5printPKcc>
    asm volatile("csrr %0, sip" : "=r" (sip));
    80003584:	144027f3          	csrr	a5,sip
    80003588:	fef43023          	sd	a5,-32(s0)
    return sip;
    8000358c:	fe043503          	ld	a0,-32(s0)
    print(Riscv::r_sip(), '\n', 1);
    80003590:	00100613          	li	a2,1
    80003594:	00a00593          	li	a1,10
    80003598:	00000097          	auipc	ra,0x0
    8000359c:	ae8080e7          	jalr	-1304(ra) # 80003080 <_Z5printmcb>

    print("stval:",' ');
    800035a0:	02000593          	li	a1,32
    800035a4:	00005517          	auipc	a0,0x5
    800035a8:	efc50513          	addi	a0,a0,-260 # 800084a0 <_ZTV14PeriodicWorker+0xc0>
    800035ac:	00000097          	auipc	ra,0x0
    800035b0:	c20080e7          	jalr	-992(ra) # 800031cc <_Z5printPKcc>
    asm volatile("csrr %0, stval" : "=r" (stval));
    800035b4:	143027f3          	csrr	a5,stval
    800035b8:	fcf43c23          	sd	a5,-40(s0)
    return stval;
    800035bc:	fd843503          	ld	a0,-40(s0)
    print(Riscv::r_stval(), '\n', 1);
    800035c0:	00100613          	li	a2,1
    800035c4:	00a00593          	li	a1,10
    800035c8:	00000097          	auipc	ra,0x0
    800035cc:	ab8080e7          	jalr	-1352(ra) # 80003080 <_Z5printmcb>

    print("scause:",' ');
    800035d0:	02000593          	li	a1,32
    800035d4:	00005517          	auipc	a0,0x5
    800035d8:	ed450513          	addi	a0,a0,-300 # 800084a8 <_ZTV14PeriodicWorker+0xc8>
    800035dc:	00000097          	auipc	ra,0x0
    800035e0:	bf0080e7          	jalr	-1040(ra) # 800031cc <_Z5printPKcc>
    asm volatile("csrr %0, scause" : "=r" (scause));
    800035e4:	142027f3          	csrr	a5,scause
    800035e8:	fcf43823          	sd	a5,-48(s0)
    return scause;
    800035ec:	fd043503          	ld	a0,-48(s0)
    print(Riscv::r_scause(), '\n', 1);
    800035f0:	00100613          	li	a2,1
    800035f4:	00a00593          	li	a1,10
    800035f8:	00000097          	auipc	ra,0x0
    800035fc:	a88080e7          	jalr	-1400(ra) # 80003080 <_Z5printmcb>
}
    80003600:	02813083          	ld	ra,40(sp)
    80003604:	02013403          	ld	s0,32(sp)
    80003608:	03010113          	addi	sp,sp,48
    8000360c:	00008067          	ret

0000000080003610 <_Z7kmallocm>:

void* kmalloc(size_t size){
    80003610:	fe010113          	addi	sp,sp,-32
    80003614:	00113c23          	sd	ra,24(sp)
    80003618:	00813823          	sd	s0,16(sp)
    8000361c:	00913423          	sd	s1,8(sp)
    80003620:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80003624:	fff50493          	addi	s1,a0,-1
    80003628:	0064d493          	srli	s1,s1,0x6
    8000362c:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    80003630:	fffff097          	auipc	ra,0xfffff
    80003634:	024080e7          	jalr	36(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003638:	00048593          	mv	a1,s1
    8000363c:	fffff097          	auipc	ra,0xfffff
    80003640:	088080e7          	jalr	136(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
}
    80003644:	01813083          	ld	ra,24(sp)
    80003648:	01013403          	ld	s0,16(sp)
    8000364c:	00813483          	ld	s1,8(sp)
    80003650:	02010113          	addi	sp,sp,32
    80003654:	00008067          	ret

0000000080003658 <_Z18testPeriodicWorkerv>:
        printInt(val++);
        printString("\n");
    }
};

void testPeriodicWorker(){
    80003658:	fb010113          	addi	sp,sp,-80
    8000365c:	04113423          	sd	ra,72(sp)
    80003660:	04813023          	sd	s0,64(sp)
    80003664:	02913c23          	sd	s1,56(sp)
    80003668:	05010413          	addi	s0,sp,80
    PeriodicThread(period){
    8000366c:	00a00593          	li	a1,10
    80003670:	fc040513          	addi	a0,s0,-64
    80003674:	00001097          	auipc	ra,0x1
    80003678:	b88080e7          	jalr	-1144(ra) # 800041fc <_ZN14PeriodicThreadC1Em>
    8000367c:	00005797          	auipc	a5,0x5
    80003680:	d7478793          	addi	a5,a5,-652 # 800083f0 <_ZTV14PeriodicWorker+0x10>
    80003684:	fcf43023          	sd	a5,-64(s0)
        this->val = val;
    80003688:	00500793          	li	a5,5
    8000368c:	fcf42c23          	sw	a5,-40(s0)
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80003690:	00005797          	auipc	a5,0x5
    80003694:	9c878793          	addi	a5,a5,-1592 # 80008058 <_ZTV9Semaphore+0x10>
    80003698:	faf43823          	sd	a5,-80(s0)
    8000369c:	00000593          	li	a1,0
    800036a0:	fb840513          	addi	a0,s0,-72
    800036a4:	00000097          	auipc	ra,0x0
    800036a8:	2bc080e7          	jalr	700(ra) # 80003960 <sem_open>
    PeriodicWorker worker(10, 5);
    Semaphore sem(0);
    worker.start();
    800036ac:	fc040513          	addi	a0,s0,-64
    800036b0:	00001097          	auipc	ra,0x1
    800036b4:	adc080e7          	jalr	-1316(ra) # 8000418c <_ZN6Thread5startEv>
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    800036b8:	fb843503          	ld	a0,-72(s0)
    800036bc:	00000097          	auipc	ra,0x0
    800036c0:	318080e7          	jalr	792(ra) # 800039d4 <sem_wait>
    virtual ~Semaphore (){ sem_close(myHandle); }
    800036c4:	00005797          	auipc	a5,0x5
    800036c8:	99478793          	addi	a5,a5,-1644 # 80008058 <_ZTV9Semaphore+0x10>
    800036cc:	faf43823          	sd	a5,-80(s0)
    800036d0:	fb843503          	ld	a0,-72(s0)
    800036d4:	00000097          	auipc	ra,0x0
    800036d8:	2c8080e7          	jalr	712(ra) # 8000399c <sem_close>
    virtual ~Thread (){ delete myHandle; }
    800036dc:	00005797          	auipc	a5,0x5
    800036e0:	95478793          	addi	a5,a5,-1708 # 80008030 <_ZTV6Thread+0x10>
    800036e4:	fcf43023          	sd	a5,-64(s0)
    800036e8:	fc843783          	ld	a5,-56(s0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    800036ec:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800036f0:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800036f4:	00000073          	ecall
    sem.wait();
    800036f8:	04813083          	ld	ra,72(sp)
    800036fc:	04013403          	ld	s0,64(sp)
    80003700:	03813483          	ld	s1,56(sp)
    80003704:	05010113          	addi	sp,sp,80
    80003708:	00008067          	ret
    8000370c:	00050493          	mv	s1,a0
    virtual ~Semaphore (){ sem_close(myHandle); }
    80003710:	00005797          	auipc	a5,0x5
    80003714:	94878793          	addi	a5,a5,-1720 # 80008058 <_ZTV9Semaphore+0x10>
    80003718:	faf43823          	sd	a5,-80(s0)
    8000371c:	fb843503          	ld	a0,-72(s0)
    80003720:	00000097          	auipc	ra,0x0
    80003724:	27c080e7          	jalr	636(ra) # 8000399c <sem_close>
    80003728:	00048513          	mv	a0,s1
    virtual ~Thread (){ delete myHandle; }
    8000372c:	00005797          	auipc	a5,0x5
    80003730:	90478793          	addi	a5,a5,-1788 # 80008030 <_ZTV6Thread+0x10>
    80003734:	fcf43023          	sd	a5,-64(s0)
    80003738:	fc843783          	ld	a5,-56(s0)
        asm volatile("li a0, 0x69");
    8000373c:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80003740:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80003744:	00000073          	ecall
    80003748:	00008097          	auipc	ra,0x8
    8000374c:	8f0080e7          	jalr	-1808(ra) # 8000b038 <_Unwind_Resume>
    80003750:	fddff06f          	j	8000372c <_Z18testPeriodicWorkerv+0xd4>

0000000080003754 <_ZN14PeriodicWorkerD1Ev>:
class PeriodicWorker:public PeriodicThread{
    80003754:	ff010113          	addi	sp,sp,-16
    80003758:	00813423          	sd	s0,8(sp)
    8000375c:	01010413          	addi	s0,sp,16
    80003760:	00005797          	auipc	a5,0x5
    80003764:	8d078793          	addi	a5,a5,-1840 # 80008030 <_ZTV6Thread+0x10>
    80003768:	00f53023          	sd	a5,0(a0)
    8000376c:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80003770:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80003774:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80003778:	00000073          	ecall
    8000377c:	00813403          	ld	s0,8(sp)
    80003780:	01010113          	addi	sp,sp,16
    80003784:	00008067          	ret

0000000080003788 <_ZN14PeriodicWorker18periodicActivationEv>:
    void periodicActivation() override{
    80003788:	ff010113          	addi	sp,sp,-16
    8000378c:	00113423          	sd	ra,8(sp)
    80003790:	00813023          	sd	s0,0(sp)
    80003794:	01010413          	addi	s0,sp,16
        printInt(val++);
    80003798:	01852783          	lw	a5,24(a0)
    8000379c:	0017871b          	addiw	a4,a5,1
    800037a0:	00e52c23          	sw	a4,24(a0)
    800037a4:	00000613          	li	a2,0
    800037a8:	00a00593          	li	a1,10
    800037ac:	00078513          	mv	a0,a5
    800037b0:	00001097          	auipc	ra,0x1
    800037b4:	688080e7          	jalr	1672(ra) # 80004e38 <_Z8printIntiii>
        printString("\n");
    800037b8:	00005517          	auipc	a0,0x5
    800037bc:	a9850513          	addi	a0,a0,-1384 # 80008250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    800037c0:	00001097          	auipc	ra,0x1
    800037c4:	4e4080e7          	jalr	1252(ra) # 80004ca4 <_Z11printStringPKc>
    }
    800037c8:	00813083          	ld	ra,8(sp)
    800037cc:	00013403          	ld	s0,0(sp)
    800037d0:	01010113          	addi	sp,sp,16
    800037d4:	00008067          	ret

00000000800037d8 <_ZN14PeriodicWorkerD0Ev>:
class PeriodicWorker:public PeriodicThread{
    800037d8:	ff010113          	addi	sp,sp,-16
    800037dc:	00113423          	sd	ra,8(sp)
    800037e0:	00813023          	sd	s0,0(sp)
    800037e4:	01010413          	addi	s0,sp,16
    800037e8:	00005717          	auipc	a4,0x5
    800037ec:	84870713          	addi	a4,a4,-1976 # 80008030 <_ZTV6Thread+0x10>
    800037f0:	00e53023          	sd	a4,0(a0)
    800037f4:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800037f8:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800037fc:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80003800:	00000073          	ecall
    80003804:	00001097          	auipc	ra,0x1
    80003808:	8a4080e7          	jalr	-1884(ra) # 800040a8 <_ZdlPv>
    8000380c:	00813083          	ld	ra,8(sp)
    80003810:	00013403          	ld	s0,0(sp)
    80003814:	01010113          	addi	sp,sp,16
    80003818:	00008067          	ret

000000008000381c <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.hpp"
#include"../../h/_semaphore.hpp"
#include"../../h/testing.hpp"
extern "C" void* mem_alloc(size_t size)
{
    8000381c:	ff010113          	addi	sp,sp,-16
    80003820:	00813423          	sd	s0,8(sp)
    80003824:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80003828:	fff50513          	addi	a0,a0,-1
    8000382c:	00655513          	srli	a0,a0,0x6
    80003830:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80003834:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80003838:	00100793          	li	a5,1
    8000383c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80003840:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80003844:	00050513          	mv	a0,a0
    
    return adr;  
}
    80003848:	00813403          	ld	s0,8(sp)
    8000384c:	01010113          	addi	sp,sp,16
    80003850:	00008067          	ret

0000000080003854 <mem_free>:

extern "C" int mem_free (void* adr)
{
    80003854:	ff010113          	addi	sp,sp,-16
    80003858:	00813423          	sd	s0,8(sp)
    8000385c:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80003860:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80003864:	00200793          	li	a5,2
    80003868:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000386c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80003870:	00050513          	mv	a0,a0
    
    return ret;
}
    80003874:	0005051b          	sext.w	a0,a0
    80003878:	00813403          	ld	s0,8(sp)
    8000387c:	01010113          	addi	sp,sp,16
    80003880:	00008067          	ret

0000000080003884 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    80003884:	ff010113          	addi	sp,sp,-16
    80003888:	00813423          	sd	s0,8(sp)
    8000388c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80003890:	01300793          	li	a5,19
    80003894:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80003898:	00000073          	ecall
}
    8000389c:	00813403          	ld	s0,8(sp)
    800038a0:	01010113          	addi	sp,sp,16
    800038a4:	00008067          	ret

00000000800038a8 <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    800038a8:	06050e63          	beqz	a0,80003924 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    800038ac:	08058063          	beqz	a1,8000392c <thread_create+0x84>
{
    800038b0:	fd010113          	addi	sp,sp,-48
    800038b4:	02113423          	sd	ra,40(sp)
    800038b8:	02813023          	sd	s0,32(sp)
    800038bc:	00913c23          	sd	s1,24(sp)
    800038c0:	01213823          	sd	s2,16(sp)
    800038c4:	01313423          	sd	s3,8(sp)
    800038c8:	03010413          	addi	s0,sp,48
    800038cc:	00060993          	mv	s3,a2
    800038d0:	00058913          	mv	s2,a1
    800038d4:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800038d8:	00001537          	lui	a0,0x1
    800038dc:	00000097          	auipc	ra,0x0
    800038e0:	f40080e7          	jalr	-192(ra) # 8000381c <mem_alloc>
    if(stack_space == nullptr) return -3;
    800038e4:	04050863          	beqz	a0,80003934 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    800038e8:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    800038ec:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    800038f0:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    800038f4:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    800038f8:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    800038fc:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003900:	00050513          	mv	a0,a0
    80003904:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003908:	02813083          	ld	ra,40(sp)
    8000390c:	02013403          	ld	s0,32(sp)
    80003910:	01813483          	ld	s1,24(sp)
    80003914:	01013903          	ld	s2,16(sp)
    80003918:	00813983          	ld	s3,8(sp)
    8000391c:	03010113          	addi	sp,sp,48
    80003920:	00008067          	ret
    if(handle == nullptr) return -1;
    80003924:	fff00513          	li	a0,-1
    80003928:	00008067          	ret
    if(start_routine == nullptr) return -2;
    8000392c:	ffe00513          	li	a0,-2
}
    80003930:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80003934:	ffd00513          	li	a0,-3
    80003938:	fd1ff06f          	j	80003908 <thread_create+0x60>

000000008000393c <thread_exit>:

extern "C" int thread_exit()
{
    8000393c:	ff010113          	addi	sp,sp,-16
    80003940:	00813423          	sd	s0,8(sp)
    80003944:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    80003948:	01200513          	li	a0,18
    asm volatile("ecall");
    8000394c:	00000073          	ecall

    return ret;
}
    80003950:	00000513          	li	a0,0
    80003954:	00813403          	ld	s0,8(sp)
    80003958:	01010113          	addi	sp,sp,16
    8000395c:	00008067          	ret

0000000080003960 <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    80003960:	ff010113          	addi	sp,sp,-16
    80003964:	00813423          	sd	s0,8(sp)
    80003968:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    8000396c:	02050463          	beqz	a0,80003994 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    80003970:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    80003974:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    80003978:	02100513          	li	a0,33
    asm volatile("ecall");
    8000397c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003980:	00050513          	mv	a0,a0
    80003984:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003988:	00813403          	ld	s0,8(sp)
    8000398c:	01010113          	addi	sp,sp,16
    80003990:	00008067          	ret
    if(handle == nullptr) return -1;
    80003994:	fff00513          	li	a0,-1
    80003998:	ff1ff06f          	j	80003988 <sem_open+0x28>

000000008000399c <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    8000399c:	ff010113          	addi	sp,sp,-16
    800039a0:	00813423          	sd	s0,8(sp)
    800039a4:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    800039a8:	02050263          	beqz	a0,800039cc <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    800039ac:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    800039b0:	02200513          	li	a0,34
    asm volatile("ecall");
    800039b4:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800039b8:	00050513          	mv	a0,a0
    800039bc:	0005051b          	sext.w	a0,a0
    return ret;
}
    800039c0:	00813403          	ld	s0,8(sp)
    800039c4:	01010113          	addi	sp,sp,16
    800039c8:	00008067          	ret
    if(handle == nullptr) return -1;
    800039cc:	fff00513          	li	a0,-1
    800039d0:	ff1ff06f          	j	800039c0 <sem_close+0x24>

00000000800039d4 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    800039d4:	ff010113          	addi	sp,sp,-16
    800039d8:	00813423          	sd	s0,8(sp)
    800039dc:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800039e0:	02050263          	beqz	a0,80003a04 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    800039e4:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    800039e8:	02300513          	li	a0,35
    asm volatile("ecall");
    800039ec:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800039f0:	00050513          	mv	a0,a0
    800039f4:	0005051b          	sext.w	a0,a0
    return ret;
}
    800039f8:	00813403          	ld	s0,8(sp)
    800039fc:	01010113          	addi	sp,sp,16
    80003a00:	00008067          	ret
    if(id == nullptr) return -1;
    80003a04:	fff00513          	li	a0,-1
    80003a08:	ff1ff06f          	j	800039f8 <sem_wait+0x24>

0000000080003a0c <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    80003a0c:	ff010113          	addi	sp,sp,-16
    80003a10:	00813423          	sd	s0,8(sp)
    80003a14:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    80003a18:	02050263          	beqz	a0,80003a3c <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80003a1c:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    80003a20:	02400513          	li	a0,36
    asm volatile("ecall");
    80003a24:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003a28:	00050513          	mv	a0,a0
    80003a2c:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003a30:	00813403          	ld	s0,8(sp)
    80003a34:	01010113          	addi	sp,sp,16
    80003a38:	00008067          	ret
    if(id == nullptr) return -1;
    80003a3c:	fff00513          	li	a0,-1
    80003a40:	ff1ff06f          	j	80003a30 <sem_signal+0x24>

0000000080003a44 <time_sleep>:

extern "C" int time_sleep(time_t time){
    80003a44:	ff010113          	addi	sp,sp,-16
    80003a48:	00813423          	sd	s0,8(sp)
    80003a4c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    80003a50:	02050263          	beqz	a0,80003a74 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    80003a54:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    80003a58:	03100513          	li	a0,49
    asm volatile("ecall");
    80003a5c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003a60:	00050513          	mv	a0,a0
    80003a64:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003a68:	00813403          	ld	s0,8(sp)
    80003a6c:	01010113          	addi	sp,sp,16
    80003a70:	00008067          	ret
    if(time == 0) return -1;
    80003a74:	fff00513          	li	a0,-1
    80003a78:	ff1ff06f          	j	80003a68 <time_sleep+0x24>

0000000080003a7c <getc>:

const int EOF = -1;
extern "C" char getc(){
    80003a7c:	ff010113          	addi	sp,sp,-16
    80003a80:	00813423          	sd	s0,8(sp)
    80003a84:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    80003a88:	04100513          	li	a0,65
    asm volatile("ecall");
    80003a8c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003a90:	00050513          	mv	a0,a0
    80003a94:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    80003a98:	0ff00793          	li	a5,255
    80003a9c:	00a7ea63          	bltu	a5,a0,80003ab0 <getc+0x34>
    80003aa0:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    80003aa4:	00813403          	ld	s0,8(sp)
    80003aa8:	01010113          	addi	sp,sp,16
    80003aac:	00008067          	ret
    else return EOF;
    80003ab0:	0ff00513          	li	a0,255
    80003ab4:	ff1ff06f          	j	80003aa4 <getc+0x28>

0000000080003ab8 <putc>:

extern "C" void putc(char c){
    80003ab8:	ff010113          	addi	sp,sp,-16
    80003abc:	00813423          	sd	s0,8(sp)
    80003ac0:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    80003ac4:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    80003ac8:	04200513          	li	a0,66
    asm volatile("ecall");
    80003acc:	00000073          	ecall
    80003ad0:	00813403          	ld	s0,8(sp)
    80003ad4:	01010113          	addi	sp,sp,16
    80003ad8:	00008067          	ret

0000000080003adc <_ZN10KSemaphore4waitEv>:
#include"../../h/KInclude.hpp"

int KSemaphore::wait(){
    if(val > 0)
    80003adc:	00052783          	lw	a5,0(a0) # 1000 <_entry-0x7ffff000>
    80003ae0:	00078a63          	beqz	a5,80003af4 <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    80003ae4:	fff7879b          	addiw	a5,a5,-1
    80003ae8:	00f52023          	sw	a5,0(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80003aec:	00000513          	li	a0,0
}
    80003af0:	00008067          	ret
int KSemaphore::wait(){
    80003af4:	fe010113          	addi	sp,sp,-32
    80003af8:	00113c23          	sd	ra,24(sp)
    80003afc:	00813823          	sd	s0,16(sp)
    80003b00:	00913423          	sd	s1,8(sp)
    80003b04:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    80003b08:	00006497          	auipc	s1,0x6
    80003b0c:	3c848493          	addi	s1,s1,968 # 80009ed0 <_ZN3TCB7runningE>
    80003b10:	0004b583          	ld	a1,0(s1)
    80003b14:	0205ac23          	sw	zero,56(a1)
        blocked.insert(TCB::running);
    80003b18:	00850513          	addi	a0,a0,8
    80003b1c:	00001097          	auipc	ra,0x1
    80003b20:	818080e7          	jalr	-2024(ra) # 80004334 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    80003b24:	fffff097          	auipc	ra,0xfffff
    80003b28:	430080e7          	jalr	1072(ra) # 80002f54 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    80003b2c:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    80003b30:	0387a703          	lw	a4,56(a5)
    80003b34:	02071263          	bnez	a4,80003b58 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    80003b38:	00100713          	li	a4,1
    80003b3c:	02e7ac23          	sw	a4,56(a5)
    return 0;
    80003b40:	00000513          	li	a0,0
}
    80003b44:	01813083          	ld	ra,24(sp)
    80003b48:	01013403          	ld	s0,16(sp)
    80003b4c:	00813483          	ld	s1,8(sp)
    80003b50:	02010113          	addi	sp,sp,32
    80003b54:	00008067          	ret
            return -2;
    80003b58:	ffe00513          	li	a0,-2
    80003b5c:	fe9ff06f          	j	80003b44 <_ZN10KSemaphore4waitEv+0x68>

0000000080003b60 <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80003b60:	00853783          	ld	a5,8(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    80003b64:	02078e63          	beqz	a5,80003ba0 <_ZN10KSemaphore6signalEv+0x40>
{
    80003b68:	ff010113          	addi	sp,sp,-16
    80003b6c:	00113423          	sd	ra,8(sp)
    80003b70:	00813023          	sd	s0,0(sp)
    80003b74:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80003b78:	00850513          	addi	a0,a0,8
    80003b7c:	00000097          	auipc	ra,0x0
    80003b80:	7ec080e7          	jalr	2028(ra) # 80004368 <_ZN8TcbQueue6removeEv>
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	f1c080e7          	jalr	-228(ra) # 80002aa0 <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    80003b8c:	00000513          	li	a0,0
    80003b90:	00813083          	ld	ra,8(sp)
    80003b94:	00013403          	ld	s0,0(sp)
    80003b98:	01010113          	addi	sp,sp,16
    80003b9c:	00008067          	ret
        val++;
    80003ba0:	00052783          	lw	a5,0(a0)
    80003ba4:	0017879b          	addiw	a5,a5,1
    80003ba8:	00f52023          	sw	a5,0(a0)
}
    80003bac:	00000513          	li	a0,0
    80003bb0:	00008067          	ret

0000000080003bb4 <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    80003bb4:	fe010113          	addi	sp,sp,-32
    80003bb8:	00113c23          	sd	ra,24(sp)
    80003bbc:	00813823          	sd	s0,16(sp)
    80003bc0:	00913423          	sd	s1,8(sp)
    80003bc4:	02010413          	addi	s0,sp,32
    80003bc8:	00050493          	mv	s1,a0
    80003bcc:	0084b783          	ld	a5,8(s1)
{
    while(!blocked.isEmpty()){
    80003bd0:	02078263          	beqz	a5,80003bf4 <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    80003bd4:	00848513          	addi	a0,s1,8
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	790080e7          	jalr	1936(ra) # 80004368 <_ZN8TcbQueue6removeEv>
    80003be0:	00100793          	li	a5,1
    80003be4:	02f52c23          	sw	a5,56(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    80003be8:	fffff097          	auipc	ra,0xfffff
    80003bec:	eb8080e7          	jalr	-328(ra) # 80002aa0 <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    80003bf0:	fddff06f          	j	80003bcc <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    80003bf4:	01813083          	ld	ra,24(sp)
    80003bf8:	01013403          	ld	s0,16(sp)
    80003bfc:	00813483          	ld	s1,8(sp)
    80003c00:	02010113          	addi	sp,sp,32
    80003c04:	00008067          	ret

0000000080003c08 <_ZN5StdIO12outputWorkerEPv>:
    out_thread->setKernelMode();
    out_thread->setKernelLocked();
}

void StdIO::outputWorker(void *)
{
    80003c08:	fc010113          	addi	sp,sp,-64
    80003c0c:	02113c23          	sd	ra,56(sp)
    80003c10:	02813823          	sd	s0,48(sp)
    80003c14:	02913423          	sd	s1,40(sp)
    80003c18:	03213023          	sd	s2,32(sp)
    80003c1c:	01313c23          	sd	s3,24(sp)
    80003c20:	01413823          	sd	s4,16(sp)
    80003c24:	04010413          	addi	s0,sp,64
    
    out_thread = nullptr;
    80003c28:	00006797          	auipc	a5,0x6
    80003c2c:	2c07b423          	sd	zero,712(a5) # 80009ef0 <_ZN5StdIO10out_threadE>
    80003c30:	0400006f          	j	80003c70 <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003c34:	100027f3          	csrr	a5,sstatus
    80003c38:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003c3c:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80003c40:	141027f3          	csrr	a5,sepc
    80003c44:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80003c48:	fc043483          	ld	s1,-64(s0)
        }
        else
        {

            uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
            out_thread = TCB::running;
    80003c4c:	00006797          	auipc	a5,0x6
    80003c50:	28478793          	addi	a5,a5,644 # 80009ed0 <_ZN3TCB7runningE>
    80003c54:	0007b783          	ld	a5,0(a5)
    80003c58:	00006717          	auipc	a4,0x6
    80003c5c:	28f73c23          	sd	a5,664(a4) # 80009ef0 <_ZN5StdIO10out_threadE>

            TCB::yield();
    80003c60:	fffff097          	auipc	ra,0xfffff
    80003c64:	2f4080e7          	jalr	756(ra) # 80002f54 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80003c68:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80003c6c:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80003c70:	00006797          	auipc	a5,0x6
    80003c74:	27878793          	addi	a5,a5,632 # 80009ee8 <_ZN5StdIO8iostatusE>
    80003c78:	0007b783          	ld	a5,0(a5)
    80003c7c:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80003c80:	0207f793          	andi	a5,a5,32
    80003c84:	fa0788e3          	beqz	a5,80003c34 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80003c88:	00006797          	auipc	a5,0x6
    80003c8c:	27878793          	addi	a5,a5,632 # 80009f00 <_ZN5StdIO7obufferE>
    80003c90:	0007b483          	ld	s1,0(a5)
    80003c94:	00006797          	auipc	a5,0x6
    80003c98:	24478793          	addi	a5,a5,580 # 80009ed8 <_ZN5StdIO5odataE>
    80003c9c:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80003ca0:	41848513          	addi	a0,s1,1048
    80003ca4:	00000097          	auipc	ra,0x0
    80003ca8:	e38080e7          	jalr	-456(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80003cac:	40048913          	addi	s2,s1,1024
    80003cb0:	00090513          	mv	a0,s2
    80003cb4:	00000097          	auipc	ra,0x0
    80003cb8:	e28080e7          	jalr	-472(ra) # 80003adc <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80003cbc:	4504a783          	lw	a5,1104(s1)
    80003cc0:	fff7879b          	addiw	a5,a5,-1
    80003cc4:	44f4a823          	sw	a5,1104(s1)
        T r = buffer[head];
    80003cc8:	4484a783          	lw	a5,1096(s1)
    80003ccc:	00f48733          	add	a4,s1,a5
    80003cd0:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80003cd4:	0017879b          	addiw	a5,a5,1
    80003cd8:	41f7d71b          	sraiw	a4,a5,0x1f
    80003cdc:	0167571b          	srliw	a4,a4,0x16
    80003ce0:	00e787bb          	addw	a5,a5,a4
    80003ce4:	3ff7f793          	andi	a5,a5,1023
    80003ce8:	40e787bb          	subw	a5,a5,a4
    80003cec:	44f4a423          	sw	a5,1096(s1)

        spaceAvailable.signal();
    80003cf0:	43048513          	addi	a0,s1,1072
    80003cf4:	00000097          	auipc	ra,0x0
    80003cf8:	e6c080e7          	jalr	-404(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80003cfc:	00090513          	mv	a0,s2
    80003d00:	00000097          	auipc	ra,0x0
    80003d04:	e60080e7          	jalr	-416(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    80003d08:	01498023          	sb	s4,0(s3)
    80003d0c:	f65ff06f          	j	80003c70 <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080003d10 <_ZN5StdIO9initalizeEv>:
{
    80003d10:	fe010113          	addi	sp,sp,-32
    80003d14:	00113c23          	sd	ra,24(sp)
    80003d18:	00813823          	sd	s0,16(sp)
    80003d1c:	00913423          	sd	s1,8(sp)
    80003d20:	01213023          	sd	s2,0(sp)
    80003d24:	02010413          	addi	s0,sp,32
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80003d28:	fffff097          	auipc	ra,0xfffff
    80003d2c:	92c080e7          	jalr	-1748(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003d30:	01200593          	li	a1,18
    80003d34:	fffff097          	auipc	ra,0xfffff
    80003d38:	990080e7          	jalr	-1648(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80003d3c:	00100493          	li	s1,1
    80003d40:	40952023          	sw	s1,1024(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80003d44:	40053423          	sd	zero,1032(a0)
    80003d48:	40053823          	sd	zero,1040(a0)
    80003d4c:	40052c23          	sw	zero,1048(a0)
    80003d50:	42053023          	sd	zero,1056(a0)
    80003d54:	42053423          	sd	zero,1064(a0)
    80003d58:	40000913          	li	s2,1024
    80003d5c:	43252823          	sw	s2,1072(a0)
    80003d60:	42053c23          	sd	zero,1080(a0)
    80003d64:	44053023          	sd	zero,1088(a0)
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80003d68:	44052423          	sw	zero,1096(a0)
    80003d6c:	44052623          	sw	zero,1100(a0)
    80003d70:	44052823          	sw	zero,1104(a0)
    ibuffer = new SharedBuffer<char>();
    80003d74:	00006797          	auipc	a5,0x6
    80003d78:	18a7ba23          	sd	a0,404(a5) # 80009f08 <_ZN5StdIO7ibufferE>
    80003d7c:	fffff097          	auipc	ra,0xfffff
    80003d80:	8d8080e7          	jalr	-1832(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003d84:	01200593          	li	a1,18
    80003d88:	fffff097          	auipc	ra,0xfffff
    80003d8c:	93c080e7          	jalr	-1732(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    80003d90:	00050593          	mv	a1,a0
    80003d94:	40952023          	sw	s1,1024(a0)
    80003d98:	40053423          	sd	zero,1032(a0)
    80003d9c:	40053823          	sd	zero,1040(a0)
    80003da0:	40052c23          	sw	zero,1048(a0)
    80003da4:	42053023          	sd	zero,1056(a0)
    80003da8:	42053423          	sd	zero,1064(a0)
    80003dac:	43252823          	sw	s2,1072(a0)
    80003db0:	42053c23          	sd	zero,1080(a0)
    80003db4:	44053023          	sd	zero,1088(a0)
    80003db8:	44052423          	sw	zero,1096(a0)
    80003dbc:	44052623          	sw	zero,1100(a0)
    80003dc0:	44052823          	sw	zero,1104(a0)
    obuffer = new SharedBuffer<char>();
    80003dc4:	00006797          	auipc	a5,0x6
    80003dc8:	12a7be23          	sd	a0,316(a5) # 80009f00 <_ZN5StdIO7obufferE>
    print("obuffer:", (uint64)obuffer, 0);
    80003dcc:	00000613          	li	a2,0
    80003dd0:	00004517          	auipc	a0,0x4
    80003dd4:	6e050513          	addi	a0,a0,1760 # 800084b0 <_ZTV14PeriodicWorker+0xd0>
    80003dd8:	fffff097          	auipc	ra,0xfffff
    80003ddc:	48c080e7          	jalr	1164(ra) # 80003264 <_Z5printPKcmb>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80003de0:	fffff097          	auipc	ra,0xfffff
    80003de4:	874080e7          	jalr	-1932(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003de8:	00100593          	li	a1,1
    80003dec:	fffff097          	auipc	ra,0xfffff
    80003df0:	8d8080e7          	jalr	-1832(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    80003df4:	00052023          	sw	zero,0(a0)
    80003df8:	00053423          	sd	zero,8(a0)
    80003dfc:	00053823          	sd	zero,16(a0)
    blockSem = new KSemaphore(0);
    80003e00:	00006797          	auipc	a5,0x6
    80003e04:	0ea7bc23          	sd	a0,248(a5) # 80009ef8 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80003e08:	00004797          	auipc	a5,0x4
    80003e0c:	20878793          	addi	a5,a5,520 # 80008010 <CONSOLE_STATUS>
    80003e10:	0007b783          	ld	a5,0(a5)
    80003e14:	00006717          	auipc	a4,0x6
    80003e18:	0cf73a23          	sd	a5,212(a4) # 80009ee8 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80003e1c:	00004797          	auipc	a5,0x4
    80003e20:	1e478793          	addi	a5,a5,484 # 80008000 <CONSOLE_RX_DATA>
    80003e24:	0007b783          	ld	a5,0(a5)
    80003e28:	00006717          	auipc	a4,0x6
    80003e2c:	0af73c23          	sd	a5,184(a4) # 80009ee0 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80003e30:	00004797          	auipc	a5,0x4
    80003e34:	1d878793          	addi	a5,a5,472 # 80008008 <CONSOLE_TX_DATA>
    80003e38:	0007b783          	ld	a5,0(a5)
    80003e3c:	00006717          	auipc	a4,0x6
    80003e40:	08f73e23          	sd	a5,156(a4) # 80009ed8 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	810080e7          	jalr	-2032(ra) # 80002654 <_ZN15MemoryAllocator11getInstanceEv>
    80003e4c:	04000593          	li	a1,64
    80003e50:	fffff097          	auipc	ra,0xfffff
    80003e54:	874080e7          	jalr	-1932(ra) # 800026c4 <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80003e58:	00050613          	mv	a2,a0
    80003e5c:	00000593          	li	a1,0
    80003e60:	00000517          	auipc	a0,0x0
    80003e64:	da850513          	addi	a0,a0,-600 # 80003c08 <_ZN5StdIO12outputWorkerEPv>
    80003e68:	fffff097          	auipc	ra,0xfffff
    80003e6c:	eb8080e7          	jalr	-328(ra) # 80002d20 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80003e70:	00006797          	auipc	a5,0x6
    80003e74:	08a7b023          	sd	a0,128(a5) # 80009ef0 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80003e78:	02050ea3          	sb	zero,61(a0)
    void setKernelLocked() { locked = true; }
    80003e7c:	02950f23          	sb	s1,62(a0)
}
    80003e80:	01813083          	ld	ra,24(sp)
    80003e84:	01013403          	ld	s0,16(sp)
    80003e88:	00813483          	ld	s1,8(sp)
    80003e8c:	00013903          	ld	s2,0(sp)
    80003e90:	02010113          	addi	sp,sp,32
    80003e94:	00008067          	ret

0000000080003e98 <_ZN5StdIO11inputWorkerEv>:
    }
    
}

void StdIO::inputWorker()
{
    80003e98:	ff010113          	addi	sp,sp,-16
    80003e9c:	00813423          	sd	s0,8(sp)
    80003ea0:	01010413          	addi	s0,sp,16

}
    80003ea4:	00813403          	ld	s0,8(sp)
    80003ea8:	01010113          	addi	sp,sp,16
    80003eac:	00008067          	ret

0000000080003eb0 <_ZN5StdIO15console_handlerEv>:

void StdIO::console_handler(){
    80003eb0:	fc010113          	addi	sp,sp,-64
    80003eb4:	02113c23          	sd	ra,56(sp)
    80003eb8:	02813823          	sd	s0,48(sp)
    80003ebc:	02913423          	sd	s1,40(sp)
    80003ec0:	03213023          	sd	s2,32(sp)
    80003ec4:	01313c23          	sd	s3,24(sp)
    80003ec8:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    80003ecc:	00002097          	auipc	ra,0x2
    80003ed0:	8e8080e7          	jalr	-1816(ra) # 800057b4 <plic_claim>
    if(t == CONSOLE_IRQ)
    80003ed4:	00a00793          	li	a5,10
    80003ed8:	12f51063          	bne	a0,a5,80003ff8 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    80003edc:	00006797          	auipc	a5,0x6
    80003ee0:	00c78793          	addi	a5,a5,12 # 80009ee8 <_ZN5StdIO8iostatusE>
    80003ee4:	0007b783          	ld	a5,0(a5)
    80003ee8:	0007c783          	lbu	a5,0(a5)
    {
        
        if(input_ready())
    80003eec:	0017f793          	andi	a5,a5,1
    80003ef0:	0a078263          	beqz	a5,80003f94 <_ZN5StdIO15console_handlerEv+0xe4>
        {
            char c = *idata;
    80003ef4:	00006797          	auipc	a5,0x6
    80003ef8:	fec78793          	addi	a5,a5,-20 # 80009ee0 <_ZN5StdIO5idataE>
    80003efc:	0007b783          	ld	a5,0(a5)
    80003f00:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    80003f04:	00a00513          	li	a0,10
    80003f08:	00002097          	auipc	ra,0x2
    80003f0c:	8e4080e7          	jalr	-1820(ra) # 800057ec <plic_complete>
            //__putc(c);
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80003f10:	00006797          	auipc	a5,0x6
    80003f14:	ff878793          	addi	a5,a5,-8 # 80009f08 <_ZN5StdIO7ibufferE>
    80003f18:	0007b483          	ld	s1,0(a5)
    80003f1c:	4504a703          	lw	a4,1104(s1)
    80003f20:	3ff00793          	li	a5,1023
    80003f24:	0ce7ce63          	blt	a5,a4,80004000 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80003f28:	43048513          	addi	a0,s1,1072
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	bb0080e7          	jalr	-1104(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80003f34:	40048993          	addi	s3,s1,1024
    80003f38:	00098513          	mv	a0,s3
    80003f3c:	00000097          	auipc	ra,0x0
    80003f40:	ba0080e7          	jalr	-1120(ra) # 80003adc <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80003f44:	4504a783          	lw	a5,1104(s1)
    80003f48:	0017879b          	addiw	a5,a5,1
    80003f4c:	44f4a823          	sw	a5,1104(s1)
        buffer[tail]=c;
    80003f50:	44c4a783          	lw	a5,1100(s1)
    80003f54:	00f48733          	add	a4,s1,a5
    80003f58:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80003f5c:	0017879b          	addiw	a5,a5,1
    80003f60:	41f7d71b          	sraiw	a4,a5,0x1f
    80003f64:	0167571b          	srliw	a4,a4,0x16
    80003f68:	00e787bb          	addw	a5,a5,a4
    80003f6c:	3ff7f793          	andi	a5,a5,1023
    80003f70:	40e787bb          	subw	a5,a5,a4
    80003f74:	44f4a623          	sw	a5,1100(s1)
        itemAvailable.signal();
    80003f78:	41848513          	addi	a0,s1,1048
    80003f7c:	00000097          	auipc	ra,0x0
    80003f80:	be4080e7          	jalr	-1052(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80003f84:	00098513          	mv	a0,s3
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	bd8080e7          	jalr	-1064(ra) # 80003b60 <_ZN10KSemaphore6signalEv>
    80003f90:	0700006f          	j	80004000 <_ZN5StdIO15console_handlerEv+0x150>
            }

        }
        else
        {
            plic_complete(CONSOLE_IRQ);
    80003f94:	00a00513          	li	a0,10
    80003f98:	00002097          	auipc	ra,0x2
    80003f9c:	854080e7          	jalr	-1964(ra) # 800057ec <plic_complete>
            if(out_thread != nullptr)
    80003fa0:	00006797          	auipc	a5,0x6
    80003fa4:	f5078793          	addi	a5,a5,-176 # 80009ef0 <_ZN5StdIO10out_threadE>
    80003fa8:	0007b783          	ld	a5,0(a5)
    80003fac:	04078a63          	beqz	a5,80004000 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003fb0:	100027f3          	csrr	a5,sstatus
    80003fb4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003fb8:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80003fbc:	141027f3          	csrr	a5,sepc
    80003fc0:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80003fc4:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80003fc8:	00006797          	auipc	a5,0x6
    80003fcc:	f2878793          	addi	a5,a5,-216 # 80009ef0 <_ZN5StdIO10out_threadE>
    80003fd0:	0007b583          	ld	a1,0(a5)
    80003fd4:	00006517          	auipc	a0,0x6
    80003fd8:	f7c50513          	addi	a0,a0,-132 # 80009f50 <_ZN9Scheduler5queueE>
    80003fdc:	00000097          	auipc	ra,0x0
    80003fe0:	510080e7          	jalr	1296(ra) # 800044ec <_ZN8TcbQueue11insertFrontEP3TCB>
            {
                uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
                Scheduler::put_front(out_thread);

                TCB::yield();
    80003fe4:	fffff097          	auipc	ra,0xfffff
    80003fe8:	f70080e7          	jalr	-144(ra) # 80002f54 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80003fec:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80003ff0:	14149073          	csrw	sepc,s1
    80003ff4:	00c0006f          	j	80004000 <_ZN5StdIO15console_handlerEv+0x150>
            }
                
        }    
    }
    else
        plic_complete(t);
    80003ff8:	00001097          	auipc	ra,0x1
    80003ffc:	7f4080e7          	jalr	2036(ra) # 800057ec <plic_complete>
        
    80004000:	03813083          	ld	ra,56(sp)
    80004004:	03013403          	ld	s0,48(sp)
    80004008:	02813483          	ld	s1,40(sp)
    8000400c:	02013903          	ld	s2,32(sp)
    80004010:	01813983          	ld	s3,24(sp)
    80004014:	04010113          	addi	sp,sp,64
    80004018:	00008067          	ret

000000008000401c <_ZN6Thread10runWrapperEPv>:
        thread_create(&myHandle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    8000401c:	ff010113          	addi	sp,sp,-16
    80004020:	00113423          	sd	ra,8(sp)
    80004024:	00813023          	sd	s0,0(sp)
    80004028:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    8000402c:	00053783          	ld	a5,0(a0)
    80004030:	0107b783          	ld	a5,16(a5)
    80004034:	000780e7          	jalr	a5
}
    80004038:	00813083          	ld	ra,8(sp)
    8000403c:	00013403          	ld	s0,0(sp)
    80004040:	01010113          	addi	sp,sp,16
    80004044:	00008067          	ret

0000000080004048 <_ZN14PeriodicThread15periodicWrapperEPv>:
};

PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    80004048:	fe010113          	addi	sp,sp,-32
    8000404c:	00113c23          	sd	ra,24(sp)
    80004050:	00813823          	sd	s0,16(sp)
    80004054:	00913423          	sd	s1,8(sp)
    80004058:	02010413          	addi	s0,sp,32
    8000405c:	00050493          	mv	s1,a0
    WrapPeriod* wp = (WrapPeriod*)arg;
    while(true){
        wp->thread->periodicActivation();
    80004060:	0004b503          	ld	a0,0(s1)
    80004064:	00053783          	ld	a5,0(a0)
    80004068:	0187b783          	ld	a5,24(a5)
    8000406c:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80004070:	0084b503          	ld	a0,8(s1)
    80004074:	00000097          	auipc	ra,0x0
    80004078:	9d0080e7          	jalr	-1584(ra) # 80003a44 <time_sleep>
    8000407c:	fe5ff06f          	j	80004060 <_ZN14PeriodicThread15periodicWrapperEPv+0x18>

0000000080004080 <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    80004080:	ff010113          	addi	sp,sp,-16
    80004084:	00113423          	sd	ra,8(sp)
    80004088:	00813023          	sd	s0,0(sp)
    8000408c:	01010413          	addi	s0,sp,16
    80004090:	fffff097          	auipc	ra,0xfffff
    80004094:	78c080e7          	jalr	1932(ra) # 8000381c <mem_alloc>
    80004098:	00813083          	ld	ra,8(sp)
    8000409c:	00013403          	ld	s0,0(sp)
    800040a0:	01010113          	addi	sp,sp,16
    800040a4:	00008067          	ret

00000000800040a8 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    800040a8:	ff010113          	addi	sp,sp,-16
    800040ac:	00113423          	sd	ra,8(sp)
    800040b0:	00813023          	sd	s0,0(sp)
    800040b4:	01010413          	addi	s0,sp,16
    800040b8:	fffff097          	auipc	ra,0xfffff
    800040bc:	79c080e7          	jalr	1948(ra) # 80003854 <mem_free>
    800040c0:	00813083          	ld	ra,8(sp)
    800040c4:	00013403          	ld	s0,0(sp)
    800040c8:	01010113          	addi	sp,sp,16
    800040cc:	00008067          	ret

00000000800040d0 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    800040d0:	ff010113          	addi	sp,sp,-16
    800040d4:	00113423          	sd	ra,8(sp)
    800040d8:	00813023          	sd	s0,0(sp)
    800040dc:	01010413          	addi	s0,sp,16
    800040e0:	fffff097          	auipc	ra,0xfffff
    800040e4:	73c080e7          	jalr	1852(ra) # 8000381c <mem_alloc>
    800040e8:	00813083          	ld	ra,8(sp)
    800040ec:	00013403          	ld	s0,0(sp)
    800040f0:	01010113          	addi	sp,sp,16
    800040f4:	00008067          	ret

00000000800040f8 <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    800040f8:	ff010113          	addi	sp,sp,-16
    800040fc:	00113423          	sd	ra,8(sp)
    80004100:	00813023          	sd	s0,0(sp)
    80004104:	01010413          	addi	s0,sp,16
    80004108:	fffff097          	auipc	ra,0xfffff
    8000410c:	74c080e7          	jalr	1868(ra) # 80003854 <mem_free>
    80004110:	00813083          	ld	ra,8(sp)
    80004114:	00013403          	ld	s0,0(sp)
    80004118:	01010113          	addi	sp,sp,16
    8000411c:	00008067          	ret

0000000080004120 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    80004120:	fd010113          	addi	sp,sp,-48
    80004124:	02113423          	sd	ra,40(sp)
    80004128:	02813023          	sd	s0,32(sp)
    8000412c:	00913c23          	sd	s1,24(sp)
    80004130:	01213823          	sd	s2,16(sp)
    80004134:	01313423          	sd	s3,8(sp)
    80004138:	03010413          	addi	s0,sp,48
    8000413c:	00050493          	mv	s1,a0
    80004140:	00058993          	mv	s3,a1
    80004144:	00060913          	mv	s2,a2
    80004148:	00004797          	auipc	a5,0x4
    8000414c:	ee878793          	addi	a5,a5,-280 # 80008030 <_ZTV6Thread+0x10>
    80004150:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new Wrap{body, (uint64)arg});
    80004154:	01000513          	li	a0,16
    80004158:	00000097          	auipc	ra,0x0
    8000415c:	f28080e7          	jalr	-216(ra) # 80004080 <_Znwm>
    80004160:	01353023          	sd	s3,0(a0)
    80004164:	01253423          	sd	s2,8(a0)
    80004168:	00a4b423          	sd	a0,8(s1)
    w = (Wrap*) myHandle;
    8000416c:	00a4b823          	sd	a0,16(s1)
}
    80004170:	02813083          	ld	ra,40(sp)
    80004174:	02013403          	ld	s0,32(sp)
    80004178:	01813483          	ld	s1,24(sp)
    8000417c:	01013903          	ld	s2,16(sp)
    80004180:	00813983          	ld	s3,8(sp)
    80004184:	03010113          	addi	sp,sp,48
    80004188:	00008067          	ret

000000008000418c <_ZN6Thread5startEv>:
void Thread::start(){
    8000418c:	fe010113          	addi	sp,sp,-32
    80004190:	00113c23          	sd	ra,24(sp)
    80004194:	00813823          	sd	s0,16(sp)
    80004198:	00913423          	sd	s1,8(sp)
    8000419c:	02010413          	addi	s0,sp,32
    if(myHandle)
    800041a0:	00853483          	ld	s1,8(a0)
    800041a4:	02048e63          	beqz	s1,800041e0 <_ZN6Thread5startEv+0x54>
        myHandle = nullptr;
    800041a8:	00053423          	sd	zero,8(a0)
        thread_create(&myHandle, w->body, (void*)(w->arg));    
    800041ac:	0084b603          	ld	a2,8(s1)
    800041b0:	0004b583          	ld	a1,0(s1)
    800041b4:	00850513          	addi	a0,a0,8
    800041b8:	fffff097          	auipc	ra,0xfffff
    800041bc:	6f0080e7          	jalr	1776(ra) # 800038a8 <thread_create>
        delete w;
    800041c0:	00048513          	mv	a0,s1
    800041c4:	00000097          	auipc	ra,0x0
    800041c8:	ee4080e7          	jalr	-284(ra) # 800040a8 <_ZdlPv>
}
    800041cc:	01813083          	ld	ra,24(sp)
    800041d0:	01013403          	ld	s0,16(sp)
    800041d4:	00813483          	ld	s1,8(sp)
    800041d8:	02010113          	addi	sp,sp,32
    800041dc:	00008067          	ret
        thread_create(&myHandle, &runWrapper, this);   
    800041e0:	00050613          	mv	a2,a0
    800041e4:	00000597          	auipc	a1,0x0
    800041e8:	e3858593          	addi	a1,a1,-456 # 8000401c <_ZN6Thread10runWrapperEPv>
    800041ec:	00850513          	addi	a0,a0,8
    800041f0:	fffff097          	auipc	ra,0xfffff
    800041f4:	6b8080e7          	jalr	1720(ra) # 800038a8 <thread_create>
}
    800041f8:	fd5ff06f          	j	800041cc <_ZN6Thread5startEv+0x40>

00000000800041fc <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    800041fc:	fe010113          	addi	sp,sp,-32
    80004200:	00113c23          	sd	ra,24(sp)
    80004204:	00813823          	sd	s0,16(sp)
    80004208:	00913423          	sd	s1,8(sp)
    8000420c:	01213023          	sd	s2,0(sp)
    80004210:	02010413          	addi	s0,sp,32
    80004214:	00050493          	mv	s1,a0
    80004218:	00058913          	mv	s2,a1
Thread(periodicWrapper, new WrapPeriod{this, period}){}
    8000421c:	01000513          	li	a0,16
    80004220:	00000097          	auipc	ra,0x0
    80004224:	e60080e7          	jalr	-416(ra) # 80004080 <_Znwm>
    80004228:	00050613          	mv	a2,a0
    8000422c:	00953023          	sd	s1,0(a0)
    80004230:	01253423          	sd	s2,8(a0)
    80004234:	00000597          	auipc	a1,0x0
    80004238:	e1458593          	addi	a1,a1,-492 # 80004048 <_ZN14PeriodicThread15periodicWrapperEPv>
    8000423c:	00048513          	mv	a0,s1
    80004240:	00000097          	auipc	ra,0x0
    80004244:	ee0080e7          	jalr	-288(ra) # 80004120 <_ZN6ThreadC1EPFvPvES0_>
    80004248:	00004797          	auipc	a5,0x4
    8000424c:	28878793          	addi	a5,a5,648 # 800084d0 <_ZTV14PeriodicThread+0x10>
    80004250:	00f4b023          	sd	a5,0(s1)
    80004254:	01813083          	ld	ra,24(sp)
    80004258:	01013403          	ld	s0,16(sp)
    8000425c:	00813483          	ld	s1,8(sp)
    80004260:	00013903          	ld	s2,0(sp)
    80004264:	02010113          	addi	sp,sp,32
    80004268:	00008067          	ret

000000008000426c <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    8000426c:	ff010113          	addi	sp,sp,-16
    80004270:	00813423          	sd	s0,8(sp)
    80004274:	01010413          	addi	s0,sp,16
    80004278:	00813403          	ld	s0,8(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80004284:	ff010113          	addi	sp,sp,-16
    80004288:	00813423          	sd	s0,8(sp)
    8000428c:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    80004290:	00004797          	auipc	a5,0x4
    80004294:	da078793          	addi	a5,a5,-608 # 80008030 <_ZTV6Thread+0x10>
    80004298:	00f53023          	sd	a5,0(a0)
    8000429c:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800042a0:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800042a4:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800042a8:	00000073          	ecall
class PeriodicThread : public Thread {
    800042ac:	00813403          	ld	s0,8(sp)
    800042b0:	01010113          	addi	sp,sp,16
    800042b4:	00008067          	ret

00000000800042b8 <_ZN14PeriodicThreadD0Ev>:
    800042b8:	ff010113          	addi	sp,sp,-16
    800042bc:	00113423          	sd	ra,8(sp)
    800042c0:	00813023          	sd	s0,0(sp)
    800042c4:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    800042c8:	00004717          	auipc	a4,0x4
    800042cc:	d6870713          	addi	a4,a4,-664 # 80008030 <_ZTV6Thread+0x10>
    800042d0:	00e53023          	sd	a4,0(a0)
    800042d4:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800042d8:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800042dc:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800042e0:	00000073          	ecall
class PeriodicThread : public Thread {
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	dc4080e7          	jalr	-572(ra) # 800040a8 <_ZdlPv>
    800042ec:	00813083          	ld	ra,8(sp)
    800042f0:	00013403          	ld	s0,0(sp)
    800042f4:	01010113          	addi	sp,sp,16
    800042f8:	00008067          	ret

00000000800042fc <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../h/ptr_queue.hpp"
#include"../../h/testing.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    800042fc:	ff010113          	addi	sp,sp,-16
    80004300:	00813423          	sd	s0,8(sp)
    80004304:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    80004308:	00053783          	ld	a5,0(a0)
    8000430c:	00078863          	beqz	a5,8000431c <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    80004310:	00b78e63          	beq	a5,a1,8000432c <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    80004314:	0007b783          	ld	a5,0(a5)
    80004318:	ff5ff06f          	j	8000430c <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    8000431c:	00000513          	li	a0,0
}
    80004320:	00813403          	ld	s0,8(sp)
    80004324:	01010113          	addi	sp,sp,16
    80004328:	00008067          	ret
            return true;
    8000432c:	00100513          	li	a0,1
    80004330:	ff1ff06f          	j	80004320 <_ZNK8TcbQueue6existsEP3TCB+0x24>

0000000080004334 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    80004334:	ff010113          	addi	sp,sp,-16
    80004338:	00813423          	sd	s0,8(sp)
    8000433c:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    80004340:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004344:	00853783          	ld	a5,8(a0)
    80004348:	00078c63          	beqz	a5,80004360 <_ZN8TcbQueue6insertEP3TCB+0x2c>
    8000434c:	00b7b023          	sd	a1,0(a5)
    80004350:	00b53423          	sd	a1,8(a0)
    return *this;
}
    80004354:	00813403          	ld	s0,8(sp)
    80004358:	01010113          	addi	sp,sp,16
    8000435c:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004360:	00b53023          	sd	a1,0(a0)
    80004364:	fedff06f          	j	80004350 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080004368 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80004368:	ff010113          	addi	sp,sp,-16
    8000436c:	00813423          	sd	s0,8(sp)
    80004370:	01010413          	addi	s0,sp,16
    if(head!=nullptr){
    80004374:	00053783          	ld	a5,0(a0)
    80004378:	00078c63          	beqz	a5,80004390 <_ZN8TcbQueue6removeEv+0x28>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    8000437c:	00853703          	ld	a4,8(a0)
    80004380:	02e78063          	beq	a5,a4,800043a0 <_ZN8TcbQueue6removeEv+0x38>
    80004384:	0007b703          	ld	a4,0(a5)
    80004388:	00e53023          	sd	a4,0(a0)
        ret->next = nullptr;
    8000438c:	0007b023          	sd	zero,0(a5)
        return ret;            
    }
    return nullptr;
}
    80004390:	00078513          	mv	a0,a5
    80004394:	00813403          	ld	s0,8(sp)
    80004398:	01010113          	addi	sp,sp,16
    8000439c:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    800043a0:	00053423          	sd	zero,8(a0)
    800043a4:	00000713          	li	a4,0
    800043a8:	fe1ff06f          	j	80004388 <_ZN8TcbQueue6removeEv+0x20>

00000000800043ac <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    800043ac:	ff010113          	addi	sp,sp,-16
    800043b0:	00813423          	sd	s0,8(sp)
    800043b4:	01010413          	addi	s0,sp,16
    return head;
}
    800043b8:	00053503          	ld	a0,0(a0)
    800043bc:	00813403          	ld	s0,8(sp)
    800043c0:	01010113          	addi	sp,sp,16
    800043c4:	00008067          	ret

00000000800043c8 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    800043c8:	fe010113          	addi	sp,sp,-32
    800043cc:	00113c23          	sd	ra,24(sp)
    800043d0:	00813823          	sd	s0,16(sp)
    800043d4:	00913423          	sd	s1,8(sp)
    800043d8:	02010413          	addi	s0,sp,32
    TCB* t = head;
    800043dc:	00053483          	ld	s1,0(a0)
    while(t){
    800043e0:	02048a63          	beqz	s1,80004414 <_ZN8TcbQueue10printQueueEv+0x4c>
        print("->",' ');
    800043e4:	02000593          	li	a1,32
    800043e8:	00004517          	auipc	a0,0x4
    800043ec:	10850513          	addi	a0,a0,264 # 800084f0 <_ZTV14PeriodicThread+0x30>
    800043f0:	fffff097          	auipc	ra,0xfffff
    800043f4:	ddc080e7          	jalr	-548(ra) # 800031cc <_Z5printPKcc>
        print((uint64)t, ' ', 0);
    800043f8:	00000613          	li	a2,0
    800043fc:	02000593          	li	a1,32
    80004400:	00048513          	mv	a0,s1
    80004404:	fffff097          	auipc	ra,0xfffff
    80004408:	c7c080e7          	jalr	-900(ra) # 80003080 <_Z5printmcb>
        t = t->next;            
    8000440c:	0004b483          	ld	s1,0(s1)
    while(t){
    80004410:	fd1ff06f          	j	800043e0 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    print("");
    80004414:	00a00593          	li	a1,10
    80004418:	00004517          	auipc	a0,0x4
    8000441c:	d7850513          	addi	a0,a0,-648 # 80008190 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xd8>
    80004420:	fffff097          	auipc	ra,0xfffff
    80004424:	dac080e7          	jalr	-596(ra) # 800031cc <_Z5printPKcc>
}
    80004428:	01813083          	ld	ra,24(sp)
    8000442c:	01013403          	ld	s0,16(sp)
    80004430:	00813483          	ld	s1,8(sp)
    80004434:	02010113          	addi	sp,sp,32
    80004438:	00008067          	ret

000000008000443c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    8000443c:	fc010113          	addi	sp,sp,-64
    80004440:	02113c23          	sd	ra,56(sp)
    80004444:	02813823          	sd	s0,48(sp)
    80004448:	02913423          	sd	s1,40(sp)
    8000444c:	03213023          	sd	s2,32(sp)
    80004450:	01313c23          	sd	s3,24(sp)
    80004454:	01413823          	sd	s4,16(sp)
    80004458:	01513423          	sd	s5,8(sp)
    8000445c:	04010413          	addi	s0,sp,64
    80004460:	00050a93          	mv	s5,a0
    80004464:	00058913          	mv	s2,a1
    80004468:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    8000446c:	00053483          	ld	s1,0(a0)
    80004470:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80004474:	02048063          	beqz	s1,80004494 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80004478:	00048593          	mv	a1,s1
    8000447c:	00090513          	mv	a0,s2
    80004480:	000a00e7          	jalr	s4
    80004484:	00054863          	bltz	a0,80004494 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80004488:	00048993          	mv	s3,s1
        cur = cur->next;
    8000448c:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80004490:	fe5ff06f          	j	80004474 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80004494:	02098a63          	beqz	s3,800044c8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x8c>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80004498:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    8000449c:	04048463          	beqz	s1,800044e4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa8>
    800044a0:	0129b023          	sd	s2,0(s3)
    }
}
    800044a4:	03813083          	ld	ra,56(sp)
    800044a8:	03013403          	ld	s0,48(sp)
    800044ac:	02813483          	ld	s1,40(sp)
    800044b0:	02013903          	ld	s2,32(sp)
    800044b4:	01813983          	ld	s3,24(sp)
    800044b8:	01013a03          	ld	s4,16(sp)
    800044bc:	00813a83          	ld	s5,8(sp)
    800044c0:	04010113          	addi	sp,sp,64
    800044c4:	00008067          	ret
        info->next = head;
    800044c8:	000ab783          	ld	a5,0(s5)
    800044cc:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    800044d0:	00078663          	beqz	a5,800044dc <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa0>
    800044d4:	012ab023          	sd	s2,0(s5)
    800044d8:	fcdff06f          	j	800044a4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    800044dc:	012ab423          	sd	s2,8(s5)
    800044e0:	ff5ff06f          	j	800044d4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        prev->next = cur==nullptr?(tail=info):info;
    800044e4:	012ab423          	sd	s2,8(s5)
    800044e8:	fb9ff06f          	j	800044a0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

00000000800044ec <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    800044ec:	ff010113          	addi	sp,sp,-16
    800044f0:	00813423          	sd	s0,8(sp)
    800044f4:	01010413          	addi	s0,sp,16
    info->next = head;
    800044f8:	00053783          	ld	a5,0(a0)
    800044fc:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    80004500:	00078a63          	beqz	a5,80004514 <_ZN8TcbQueue11insertFrontEP3TCB+0x28>
    80004504:	00b53023          	sd	a1,0(a0)
    80004508:	00813403          	ld	s0,8(sp)
    8000450c:	01010113          	addi	sp,sp,16
    80004510:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    80004514:	00b53423          	sd	a1,8(a0)
    80004518:	fedff06f          	j	80004504 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

000000008000451c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000451c:	fe010113          	addi	sp,sp,-32
    80004520:	00113c23          	sd	ra,24(sp)
    80004524:	00813823          	sd	s0,16(sp)
    80004528:	00913423          	sd	s1,8(sp)
    8000452c:	01213023          	sd	s2,0(sp)
    80004530:	02010413          	addi	s0,sp,32
    80004534:	00050493          	mv	s1,a0
    80004538:	00058913          	mv	s2,a1
    8000453c:	0015879b          	addiw	a5,a1,1
    80004540:	0007851b          	sext.w	a0,a5
    80004544:	00f4a023          	sw	a5,0(s1)
    80004548:	0004a823          	sw	zero,16(s1)
    8000454c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004550:	00251513          	slli	a0,a0,0x2
    80004554:	fffff097          	auipc	ra,0xfffff
    80004558:	2c8080e7          	jalr	712(ra) # 8000381c <mem_alloc>
    8000455c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004560:	00000593          	li	a1,0
    80004564:	02048513          	addi	a0,s1,32
    80004568:	fffff097          	auipc	ra,0xfffff
    8000456c:	3f8080e7          	jalr	1016(ra) # 80003960 <sem_open>
    sem_open(&spaceAvailable, _cap);
    80004570:	00090593          	mv	a1,s2
    80004574:	01848513          	addi	a0,s1,24
    80004578:	fffff097          	auipc	ra,0xfffff
    8000457c:	3e8080e7          	jalr	1000(ra) # 80003960 <sem_open>
    sem_open(&mutexHead, 1);
    80004580:	00100593          	li	a1,1
    80004584:	02848513          	addi	a0,s1,40
    80004588:	fffff097          	auipc	ra,0xfffff
    8000458c:	3d8080e7          	jalr	984(ra) # 80003960 <sem_open>
    sem_open(&mutexTail, 1);
    80004590:	00100593          	li	a1,1
    80004594:	03048513          	addi	a0,s1,48
    80004598:	fffff097          	auipc	ra,0xfffff
    8000459c:	3c8080e7          	jalr	968(ra) # 80003960 <sem_open>
}
    800045a0:	01813083          	ld	ra,24(sp)
    800045a4:	01013403          	ld	s0,16(sp)
    800045a8:	00813483          	ld	s1,8(sp)
    800045ac:	00013903          	ld	s2,0(sp)
    800045b0:	02010113          	addi	sp,sp,32
    800045b4:	00008067          	ret

00000000800045b8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800045b8:	fe010113          	addi	sp,sp,-32
    800045bc:	00113c23          	sd	ra,24(sp)
    800045c0:	00813823          	sd	s0,16(sp)
    800045c4:	00913423          	sd	s1,8(sp)
    800045c8:	01213023          	sd	s2,0(sp)
    800045cc:	02010413          	addi	s0,sp,32
    800045d0:	00050493          	mv	s1,a0
    800045d4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800045d8:	01853503          	ld	a0,24(a0)
    800045dc:	fffff097          	auipc	ra,0xfffff
    800045e0:	3f8080e7          	jalr	1016(ra) # 800039d4 <sem_wait>

    sem_wait(mutexTail);
    800045e4:	0304b503          	ld	a0,48(s1)
    800045e8:	fffff097          	auipc	ra,0xfffff
    800045ec:	3ec080e7          	jalr	1004(ra) # 800039d4 <sem_wait>
    buffer[tail] = val;
    800045f0:	0084b783          	ld	a5,8(s1)
    800045f4:	0144a703          	lw	a4,20(s1)
    800045f8:	00271713          	slli	a4,a4,0x2
    800045fc:	00e787b3          	add	a5,a5,a4
    80004600:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004604:	0144a783          	lw	a5,20(s1)
    80004608:	0017879b          	addiw	a5,a5,1
    8000460c:	0004a703          	lw	a4,0(s1)
    80004610:	02e7e7bb          	remw	a5,a5,a4
    80004614:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004618:	0304b503          	ld	a0,48(s1)
    8000461c:	fffff097          	auipc	ra,0xfffff
    80004620:	3f0080e7          	jalr	1008(ra) # 80003a0c <sem_signal>

    sem_signal(itemAvailable);
    80004624:	0204b503          	ld	a0,32(s1)
    80004628:	fffff097          	auipc	ra,0xfffff
    8000462c:	3e4080e7          	jalr	996(ra) # 80003a0c <sem_signal>

}
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	00813483          	ld	s1,8(sp)
    8000463c:	00013903          	ld	s2,0(sp)
    80004640:	02010113          	addi	sp,sp,32
    80004644:	00008067          	ret

0000000080004648 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004648:	fe010113          	addi	sp,sp,-32
    8000464c:	00113c23          	sd	ra,24(sp)
    80004650:	00813823          	sd	s0,16(sp)
    80004654:	00913423          	sd	s1,8(sp)
    80004658:	01213023          	sd	s2,0(sp)
    8000465c:	02010413          	addi	s0,sp,32
    80004660:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004664:	02053503          	ld	a0,32(a0)
    80004668:	fffff097          	auipc	ra,0xfffff
    8000466c:	36c080e7          	jalr	876(ra) # 800039d4 <sem_wait>

    sem_wait(mutexHead);
    80004670:	0284b503          	ld	a0,40(s1)
    80004674:	fffff097          	auipc	ra,0xfffff
    80004678:	360080e7          	jalr	864(ra) # 800039d4 <sem_wait>

    int ret = buffer[head];
    8000467c:	0084b703          	ld	a4,8(s1)
    80004680:	0104a783          	lw	a5,16(s1)
    80004684:	00279693          	slli	a3,a5,0x2
    80004688:	00d70733          	add	a4,a4,a3
    8000468c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004690:	0017879b          	addiw	a5,a5,1
    80004694:	0004a703          	lw	a4,0(s1)
    80004698:	02e7e7bb          	remw	a5,a5,a4
    8000469c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800046a0:	0284b503          	ld	a0,40(s1)
    800046a4:	fffff097          	auipc	ra,0xfffff
    800046a8:	368080e7          	jalr	872(ra) # 80003a0c <sem_signal>

    sem_signal(spaceAvailable);
    800046ac:	0184b503          	ld	a0,24(s1)
    800046b0:	fffff097          	auipc	ra,0xfffff
    800046b4:	35c080e7          	jalr	860(ra) # 80003a0c <sem_signal>

    return ret;
}
    800046b8:	00090513          	mv	a0,s2
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	00813483          	ld	s1,8(sp)
    800046c8:	00013903          	ld	s2,0(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800046d4:	fe010113          	addi	sp,sp,-32
    800046d8:	00113c23          	sd	ra,24(sp)
    800046dc:	00813823          	sd	s0,16(sp)
    800046e0:	00913423          	sd	s1,8(sp)
    800046e4:	01213023          	sd	s2,0(sp)
    800046e8:	02010413          	addi	s0,sp,32
    800046ec:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800046f0:	02853503          	ld	a0,40(a0)
    800046f4:	fffff097          	auipc	ra,0xfffff
    800046f8:	2e0080e7          	jalr	736(ra) # 800039d4 <sem_wait>
    sem_wait(mutexTail);
    800046fc:	0304b503          	ld	a0,48(s1)
    80004700:	fffff097          	auipc	ra,0xfffff
    80004704:	2d4080e7          	jalr	724(ra) # 800039d4 <sem_wait>

    if (tail >= head) {
    80004708:	0144a783          	lw	a5,20(s1)
    8000470c:	0104a903          	lw	s2,16(s1)
    80004710:	0327ce63          	blt	a5,s2,8000474c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004714:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004718:	0304b503          	ld	a0,48(s1)
    8000471c:	fffff097          	auipc	ra,0xfffff
    80004720:	2f0080e7          	jalr	752(ra) # 80003a0c <sem_signal>
    sem_signal(mutexHead);
    80004724:	0284b503          	ld	a0,40(s1)
    80004728:	fffff097          	auipc	ra,0xfffff
    8000472c:	2e4080e7          	jalr	740(ra) # 80003a0c <sem_signal>

    return ret;
}
    80004730:	00090513          	mv	a0,s2
    80004734:	01813083          	ld	ra,24(sp)
    80004738:	01013403          	ld	s0,16(sp)
    8000473c:	00813483          	ld	s1,8(sp)
    80004740:	00013903          	ld	s2,0(sp)
    80004744:	02010113          	addi	sp,sp,32
    80004748:	00008067          	ret
        ret = cap - head + tail;
    8000474c:	0004a703          	lw	a4,0(s1)
    80004750:	4127093b          	subw	s2,a4,s2
    80004754:	00f9093b          	addw	s2,s2,a5
    80004758:	fc1ff06f          	j	80004718 <_ZN6Buffer6getCntEv+0x44>

000000008000475c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000475c:	fe010113          	addi	sp,sp,-32
    80004760:	00113c23          	sd	ra,24(sp)
    80004764:	00813823          	sd	s0,16(sp)
    80004768:	00913423          	sd	s1,8(sp)
    8000476c:	02010413          	addi	s0,sp,32
    80004770:	00050493          	mv	s1,a0
    putc('\n');
    80004774:	00a00513          	li	a0,10
    80004778:	fffff097          	auipc	ra,0xfffff
    8000477c:	340080e7          	jalr	832(ra) # 80003ab8 <putc>
    printString("Buffer deleted!\n");
    80004780:	00004517          	auipc	a0,0x4
    80004784:	d7850513          	addi	a0,a0,-648 # 800084f8 <_ZTV14PeriodicThread+0x38>
    80004788:	00000097          	auipc	ra,0x0
    8000478c:	51c080e7          	jalr	1308(ra) # 80004ca4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004790:	00048513          	mv	a0,s1
    80004794:	00000097          	auipc	ra,0x0
    80004798:	f40080e7          	jalr	-192(ra) # 800046d4 <_ZN6Buffer6getCntEv>
    8000479c:	02a05c63          	blez	a0,800047d4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800047a0:	0084b783          	ld	a5,8(s1)
    800047a4:	0104a703          	lw	a4,16(s1)
    800047a8:	00271713          	slli	a4,a4,0x2
    800047ac:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800047b0:	0007c503          	lbu	a0,0(a5)
    800047b4:	fffff097          	auipc	ra,0xfffff
    800047b8:	304080e7          	jalr	772(ra) # 80003ab8 <putc>
        head = (head + 1) % cap;
    800047bc:	0104a783          	lw	a5,16(s1)
    800047c0:	0017879b          	addiw	a5,a5,1
    800047c4:	0004a703          	lw	a4,0(s1)
    800047c8:	02e7e7bb          	remw	a5,a5,a4
    800047cc:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800047d0:	fc1ff06f          	j	80004790 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800047d4:	02100513          	li	a0,33
    800047d8:	fffff097          	auipc	ra,0xfffff
    800047dc:	2e0080e7          	jalr	736(ra) # 80003ab8 <putc>
    putc('\n');
    800047e0:	00a00513          	li	a0,10
    800047e4:	fffff097          	auipc	ra,0xfffff
    800047e8:	2d4080e7          	jalr	724(ra) # 80003ab8 <putc>
    mem_free(buffer);
    800047ec:	0084b503          	ld	a0,8(s1)
    800047f0:	fffff097          	auipc	ra,0xfffff
    800047f4:	064080e7          	jalr	100(ra) # 80003854 <mem_free>
    sem_close(itemAvailable);
    800047f8:	0204b503          	ld	a0,32(s1)
    800047fc:	fffff097          	auipc	ra,0xfffff
    80004800:	1a0080e7          	jalr	416(ra) # 8000399c <sem_close>
    sem_close(spaceAvailable);
    80004804:	0184b503          	ld	a0,24(s1)
    80004808:	fffff097          	auipc	ra,0xfffff
    8000480c:	194080e7          	jalr	404(ra) # 8000399c <sem_close>
    sem_close(mutexTail);
    80004810:	0304b503          	ld	a0,48(s1)
    80004814:	fffff097          	auipc	ra,0xfffff
    80004818:	188080e7          	jalr	392(ra) # 8000399c <sem_close>
    sem_close(mutexHead);
    8000481c:	0284b503          	ld	a0,40(s1)
    80004820:	fffff097          	auipc	ra,0xfffff
    80004824:	17c080e7          	jalr	380(ra) # 8000399c <sem_close>
}
    80004828:	01813083          	ld	ra,24(sp)
    8000482c:	01013403          	ld	s0,16(sp)
    80004830:	00813483          	ld	s1,8(sp)
    80004834:	02010113          	addi	sp,sp,32
    80004838:	00008067          	ret

000000008000483c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000483c:	fd010113          	addi	sp,sp,-48
    80004840:	02113423          	sd	ra,40(sp)
    80004844:	02813023          	sd	s0,32(sp)
    80004848:	00913c23          	sd	s1,24(sp)
    8000484c:	01213823          	sd	s2,16(sp)
    80004850:	01313423          	sd	s3,8(sp)
    80004854:	03010413          	addi	s0,sp,48
    80004858:	00050493          	mv	s1,a0
    8000485c:	00058993          	mv	s3,a1
    80004860:	0015879b          	addiw	a5,a1,1
    80004864:	0007851b          	sext.w	a0,a5
    80004868:	00f4a023          	sw	a5,0(s1)
    8000486c:	0004a823          	sw	zero,16(s1)
    80004870:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004874:	00251513          	slli	a0,a0,0x2
    80004878:	fffff097          	auipc	ra,0xfffff
    8000487c:	fa4080e7          	jalr	-92(ra) # 8000381c <mem_alloc>
    80004880:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004884:	01000513          	li	a0,16
    80004888:	fffff097          	auipc	ra,0xfffff
    8000488c:	7f8080e7          	jalr	2040(ra) # 80004080 <_Znwm>
    80004890:	00050913          	mv	s2,a0
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80004894:	00003797          	auipc	a5,0x3
    80004898:	7c478793          	addi	a5,a5,1988 # 80008058 <_ZTV9Semaphore+0x10>
    8000489c:	00f53023          	sd	a5,0(a0)
    800048a0:	00000593          	li	a1,0
    800048a4:	00850513          	addi	a0,a0,8
    800048a8:	fffff097          	auipc	ra,0xfffff
    800048ac:	0b8080e7          	jalr	184(ra) # 80003960 <sem_open>
    800048b0:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800048b4:	01000513          	li	a0,16
    800048b8:	fffff097          	auipc	ra,0xfffff
    800048bc:	7c8080e7          	jalr	1992(ra) # 80004080 <_Znwm>
    800048c0:	00050913          	mv	s2,a0
    800048c4:	00003797          	auipc	a5,0x3
    800048c8:	79478793          	addi	a5,a5,1940 # 80008058 <_ZTV9Semaphore+0x10>
    800048cc:	00f53023          	sd	a5,0(a0)
    800048d0:	00098593          	mv	a1,s3
    800048d4:	00850513          	addi	a0,a0,8
    800048d8:	fffff097          	auipc	ra,0xfffff
    800048dc:	088080e7          	jalr	136(ra) # 80003960 <sem_open>
    800048e0:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    800048e4:	01000513          	li	a0,16
    800048e8:	fffff097          	auipc	ra,0xfffff
    800048ec:	798080e7          	jalr	1944(ra) # 80004080 <_Znwm>
    800048f0:	00050913          	mv	s2,a0
    800048f4:	00003797          	auipc	a5,0x3
    800048f8:	76478793          	addi	a5,a5,1892 # 80008058 <_ZTV9Semaphore+0x10>
    800048fc:	00f53023          	sd	a5,0(a0)
    80004900:	00100593          	li	a1,1
    80004904:	00850513          	addi	a0,a0,8
    80004908:	fffff097          	auipc	ra,0xfffff
    8000490c:	058080e7          	jalr	88(ra) # 80003960 <sem_open>
    80004910:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004914:	01000513          	li	a0,16
    80004918:	fffff097          	auipc	ra,0xfffff
    8000491c:	768080e7          	jalr	1896(ra) # 80004080 <_Znwm>
    80004920:	00050913          	mv	s2,a0
    80004924:	00003797          	auipc	a5,0x3
    80004928:	73478793          	addi	a5,a5,1844 # 80008058 <_ZTV9Semaphore+0x10>
    8000492c:	00f53023          	sd	a5,0(a0)
    80004930:	00100593          	li	a1,1
    80004934:	00850513          	addi	a0,a0,8
    80004938:	fffff097          	auipc	ra,0xfffff
    8000493c:	028080e7          	jalr	40(ra) # 80003960 <sem_open>
    80004940:	0324b823          	sd	s2,48(s1)
}
    80004944:	02813083          	ld	ra,40(sp)
    80004948:	02013403          	ld	s0,32(sp)
    8000494c:	01813483          	ld	s1,24(sp)
    80004950:	01013903          	ld	s2,16(sp)
    80004954:	00813983          	ld	s3,8(sp)
    80004958:	03010113          	addi	sp,sp,48
    8000495c:	00008067          	ret
    80004960:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004964:	00090513          	mv	a0,s2
    80004968:	fffff097          	auipc	ra,0xfffff
    8000496c:	740080e7          	jalr	1856(ra) # 800040a8 <_ZdlPv>
    80004970:	00048513          	mv	a0,s1
    80004974:	00006097          	auipc	ra,0x6
    80004978:	6c4080e7          	jalr	1732(ra) # 8000b038 <_Unwind_Resume>
    8000497c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004980:	00090513          	mv	a0,s2
    80004984:	fffff097          	auipc	ra,0xfffff
    80004988:	724080e7          	jalr	1828(ra) # 800040a8 <_ZdlPv>
    8000498c:	00048513          	mv	a0,s1
    80004990:	00006097          	auipc	ra,0x6
    80004994:	6a8080e7          	jalr	1704(ra) # 8000b038 <_Unwind_Resume>
    80004998:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000499c:	00090513          	mv	a0,s2
    800049a0:	fffff097          	auipc	ra,0xfffff
    800049a4:	708080e7          	jalr	1800(ra) # 800040a8 <_ZdlPv>
    800049a8:	00048513          	mv	a0,s1
    800049ac:	00006097          	auipc	ra,0x6
    800049b0:	68c080e7          	jalr	1676(ra) # 8000b038 <_Unwind_Resume>
    800049b4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800049b8:	00090513          	mv	a0,s2
    800049bc:	fffff097          	auipc	ra,0xfffff
    800049c0:	6ec080e7          	jalr	1772(ra) # 800040a8 <_ZdlPv>
    800049c4:	00048513          	mv	a0,s1
    800049c8:	00006097          	auipc	ra,0x6
    800049cc:	670080e7          	jalr	1648(ra) # 8000b038 <_Unwind_Resume>

00000000800049d0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800049d0:	fe010113          	addi	sp,sp,-32
    800049d4:	00113c23          	sd	ra,24(sp)
    800049d8:	00813823          	sd	s0,16(sp)
    800049dc:	00913423          	sd	s1,8(sp)
    800049e0:	01213023          	sd	s2,0(sp)
    800049e4:	02010413          	addi	s0,sp,32
    800049e8:	00050493          	mv	s1,a0
    800049ec:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800049f0:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    800049f4:	0087b503          	ld	a0,8(a5)
    800049f8:	fffff097          	auipc	ra,0xfffff
    800049fc:	fdc080e7          	jalr	-36(ra) # 800039d4 <sem_wait>

    mutexTail->wait();
    80004a00:	0304b783          	ld	a5,48(s1)
    80004a04:	0087b503          	ld	a0,8(a5)
    80004a08:	fffff097          	auipc	ra,0xfffff
    80004a0c:	fcc080e7          	jalr	-52(ra) # 800039d4 <sem_wait>
    buffer[tail] = val;
    80004a10:	0084b783          	ld	a5,8(s1)
    80004a14:	0144a703          	lw	a4,20(s1)
    80004a18:	00271713          	slli	a4,a4,0x2
    80004a1c:	00e787b3          	add	a5,a5,a4
    80004a20:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004a24:	0144a783          	lw	a5,20(s1)
    80004a28:	0017879b          	addiw	a5,a5,1
    80004a2c:	0004a703          	lw	a4,0(s1)
    80004a30:	02e7e7bb          	remw	a5,a5,a4
    80004a34:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004a38:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004a3c:	0087b503          	ld	a0,8(a5)
    80004a40:	fffff097          	auipc	ra,0xfffff
    80004a44:	fcc080e7          	jalr	-52(ra) # 80003a0c <sem_signal>

    itemAvailable->signal();
    80004a48:	0204b783          	ld	a5,32(s1)
    80004a4c:	0087b503          	ld	a0,8(a5)
    80004a50:	fffff097          	auipc	ra,0xfffff
    80004a54:	fbc080e7          	jalr	-68(ra) # 80003a0c <sem_signal>

}
    80004a58:	01813083          	ld	ra,24(sp)
    80004a5c:	01013403          	ld	s0,16(sp)
    80004a60:	00813483          	ld	s1,8(sp)
    80004a64:	00013903          	ld	s2,0(sp)
    80004a68:	02010113          	addi	sp,sp,32
    80004a6c:	00008067          	ret

0000000080004a70 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004a70:	fe010113          	addi	sp,sp,-32
    80004a74:	00113c23          	sd	ra,24(sp)
    80004a78:	00813823          	sd	s0,16(sp)
    80004a7c:	00913423          	sd	s1,8(sp)
    80004a80:	01213023          	sd	s2,0(sp)
    80004a84:	02010413          	addi	s0,sp,32
    80004a88:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004a8c:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    80004a90:	0087b503          	ld	a0,8(a5)
    80004a94:	fffff097          	auipc	ra,0xfffff
    80004a98:	f40080e7          	jalr	-192(ra) # 800039d4 <sem_wait>

    mutexHead->wait();
    80004a9c:	0284b783          	ld	a5,40(s1)
    80004aa0:	0087b503          	ld	a0,8(a5)
    80004aa4:	fffff097          	auipc	ra,0xfffff
    80004aa8:	f30080e7          	jalr	-208(ra) # 800039d4 <sem_wait>

    int ret = buffer[head];
    80004aac:	0084b703          	ld	a4,8(s1)
    80004ab0:	0104a783          	lw	a5,16(s1)
    80004ab4:	00279693          	slli	a3,a5,0x2
    80004ab8:	00d70733          	add	a4,a4,a3
    80004abc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004ac0:	0017879b          	addiw	a5,a5,1
    80004ac4:	0004a703          	lw	a4,0(s1)
    80004ac8:	02e7e7bb          	remw	a5,a5,a4
    80004acc:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004ad0:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    80004ad4:	0087b503          	ld	a0,8(a5)
    80004ad8:	fffff097          	auipc	ra,0xfffff
    80004adc:	f34080e7          	jalr	-204(ra) # 80003a0c <sem_signal>

    spaceAvailable->signal();
    80004ae0:	0184b783          	ld	a5,24(s1)
    80004ae4:	0087b503          	ld	a0,8(a5)
    80004ae8:	fffff097          	auipc	ra,0xfffff
    80004aec:	f24080e7          	jalr	-220(ra) # 80003a0c <sem_signal>

    return ret;
}
    80004af0:	00090513          	mv	a0,s2
    80004af4:	01813083          	ld	ra,24(sp)
    80004af8:	01013403          	ld	s0,16(sp)
    80004afc:	00813483          	ld	s1,8(sp)
    80004b00:	00013903          	ld	s2,0(sp)
    80004b04:	02010113          	addi	sp,sp,32
    80004b08:	00008067          	ret

0000000080004b0c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004b0c:	fe010113          	addi	sp,sp,-32
    80004b10:	00113c23          	sd	ra,24(sp)
    80004b14:	00813823          	sd	s0,16(sp)
    80004b18:	00913423          	sd	s1,8(sp)
    80004b1c:	01213023          	sd	s2,0(sp)
    80004b20:	02010413          	addi	s0,sp,32
    80004b24:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004b28:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    80004b2c:	0087b503          	ld	a0,8(a5)
    80004b30:	fffff097          	auipc	ra,0xfffff
    80004b34:	ea4080e7          	jalr	-348(ra) # 800039d4 <sem_wait>
    mutexTail->wait();
    80004b38:	0304b783          	ld	a5,48(s1)
    80004b3c:	0087b503          	ld	a0,8(a5)
    80004b40:	fffff097          	auipc	ra,0xfffff
    80004b44:	e94080e7          	jalr	-364(ra) # 800039d4 <sem_wait>

    if (tail >= head) {
    80004b48:	0144a783          	lw	a5,20(s1)
    80004b4c:	0104a903          	lw	s2,16(s1)
    80004b50:	0527c263          	blt	a5,s2,80004b94 <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    80004b54:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004b58:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004b5c:	0087b503          	ld	a0,8(a5)
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	eac080e7          	jalr	-340(ra) # 80003a0c <sem_signal>
    mutexHead->signal();
    80004b68:	0284b783          	ld	a5,40(s1)
    80004b6c:	0087b503          	ld	a0,8(a5)
    80004b70:	fffff097          	auipc	ra,0xfffff
    80004b74:	e9c080e7          	jalr	-356(ra) # 80003a0c <sem_signal>

    return ret;
}
    80004b78:	00090513          	mv	a0,s2
    80004b7c:	01813083          	ld	ra,24(sp)
    80004b80:	01013403          	ld	s0,16(sp)
    80004b84:	00813483          	ld	s1,8(sp)
    80004b88:	00013903          	ld	s2,0(sp)
    80004b8c:	02010113          	addi	sp,sp,32
    80004b90:	00008067          	ret
        ret = cap - head + tail;
    80004b94:	0004a703          	lw	a4,0(s1)
    80004b98:	4127093b          	subw	s2,a4,s2
    80004b9c:	00f9093b          	addw	s2,s2,a5
    80004ba0:	fb9ff06f          	j	80004b58 <_ZN9BufferCPP6getCntEv+0x4c>

0000000080004ba4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004ba4:	fe010113          	addi	sp,sp,-32
    80004ba8:	00113c23          	sd	ra,24(sp)
    80004bac:	00813823          	sd	s0,16(sp)
    80004bb0:	00913423          	sd	s1,8(sp)
    80004bb4:	02010413          	addi	s0,sp,32
    80004bb8:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    80004bbc:	00a00513          	li	a0,10
    80004bc0:	fffff097          	auipc	ra,0xfffff
    80004bc4:	ef8080e7          	jalr	-264(ra) # 80003ab8 <putc>
    printString("Buffer deleted!\n");
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	93050513          	addi	a0,a0,-1744 # 800084f8 <_ZTV14PeriodicThread+0x38>
    80004bd0:	00000097          	auipc	ra,0x0
    80004bd4:	0d4080e7          	jalr	212(ra) # 80004ca4 <_Z11printStringPKc>
    while (getCnt()) {
    80004bd8:	00048513          	mv	a0,s1
    80004bdc:	00000097          	auipc	ra,0x0
    80004be0:	f30080e7          	jalr	-208(ra) # 80004b0c <_ZN9BufferCPP6getCntEv>
    80004be4:	02050c63          	beqz	a0,80004c1c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004be8:	0084b783          	ld	a5,8(s1)
    80004bec:	0104a703          	lw	a4,16(s1)
    80004bf0:	00271713          	slli	a4,a4,0x2
    80004bf4:	00e787b3          	add	a5,a5,a4
    80004bf8:	0007c503          	lbu	a0,0(a5)
    80004bfc:	fffff097          	auipc	ra,0xfffff
    80004c00:	ebc080e7          	jalr	-324(ra) # 80003ab8 <putc>
        head = (head + 1) % cap;
    80004c04:	0104a783          	lw	a5,16(s1)
    80004c08:	0017879b          	addiw	a5,a5,1
    80004c0c:	0004a703          	lw	a4,0(s1)
    80004c10:	02e7e7bb          	remw	a5,a5,a4
    80004c14:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004c18:	fc1ff06f          	j	80004bd8 <_ZN9BufferCPPD1Ev+0x34>
    80004c1c:	02100513          	li	a0,33
    80004c20:	fffff097          	auipc	ra,0xfffff
    80004c24:	e98080e7          	jalr	-360(ra) # 80003ab8 <putc>
    80004c28:	00a00513          	li	a0,10
    80004c2c:	fffff097          	auipc	ra,0xfffff
    80004c30:	e8c080e7          	jalr	-372(ra) # 80003ab8 <putc>
    mem_free(buffer);
    80004c34:	0084b503          	ld	a0,8(s1)
    80004c38:	fffff097          	auipc	ra,0xfffff
    80004c3c:	c1c080e7          	jalr	-996(ra) # 80003854 <mem_free>
    delete itemAvailable;
    80004c40:	0204b503          	ld	a0,32(s1)
    80004c44:	00050863          	beqz	a0,80004c54 <_ZN9BufferCPPD1Ev+0xb0>
    80004c48:	00053783          	ld	a5,0(a0)
    80004c4c:	0087b783          	ld	a5,8(a5)
    80004c50:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004c54:	0184b503          	ld	a0,24(s1)
    80004c58:	00050863          	beqz	a0,80004c68 <_ZN9BufferCPPD1Ev+0xc4>
    80004c5c:	00053783          	ld	a5,0(a0)
    80004c60:	0087b783          	ld	a5,8(a5)
    80004c64:	000780e7          	jalr	a5
    delete mutexTail;
    80004c68:	0304b503          	ld	a0,48(s1)
    80004c6c:	00050863          	beqz	a0,80004c7c <_ZN9BufferCPPD1Ev+0xd8>
    80004c70:	00053783          	ld	a5,0(a0)
    80004c74:	0087b783          	ld	a5,8(a5)
    80004c78:	000780e7          	jalr	a5
    delete mutexHead;
    80004c7c:	0284b503          	ld	a0,40(s1)
    80004c80:	00050863          	beqz	a0,80004c90 <_ZN9BufferCPPD1Ev+0xec>
    80004c84:	00053783          	ld	a5,0(a0)
    80004c88:	0087b783          	ld	a5,8(a5)
    80004c8c:	000780e7          	jalr	a5
}
    80004c90:	01813083          	ld	ra,24(sp)
    80004c94:	01013403          	ld	s0,16(sp)
    80004c98:	00813483          	ld	s1,8(sp)
    80004c9c:	02010113          	addi	sp,sp,32
    80004ca0:	00008067          	ret

0000000080004ca4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004ca4:	fe010113          	addi	sp,sp,-32
    80004ca8:	00113c23          	sd	ra,24(sp)
    80004cac:	00813823          	sd	s0,16(sp)
    80004cb0:	00913423          	sd	s1,8(sp)
    80004cb4:	02010413          	addi	s0,sp,32
    80004cb8:	00050493          	mv	s1,a0
    LOCK();
    80004cbc:	00100613          	li	a2,1
    80004cc0:	00000593          	li	a1,0
    80004cc4:	00005517          	auipc	a0,0x5
    80004cc8:	24c50513          	addi	a0,a0,588 # 80009f10 <lockPrint>
    80004ccc:	ffffc097          	auipc	ra,0xffffc
    80004cd0:	550080e7          	jalr	1360(ra) # 8000121c <copy_and_swap>
    80004cd4:	fe0514e3          	bnez	a0,80004cbc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004cd8:	0004c503          	lbu	a0,0(s1)
    80004cdc:	00050a63          	beqz	a0,80004cf0 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80004ce0:	fffff097          	auipc	ra,0xfffff
    80004ce4:	dd8080e7          	jalr	-552(ra) # 80003ab8 <putc>
        string++;
    80004ce8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004cec:	fedff06f          	j	80004cd8 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80004cf0:	00000613          	li	a2,0
    80004cf4:	00100593          	li	a1,1
    80004cf8:	00005517          	auipc	a0,0x5
    80004cfc:	21850513          	addi	a0,a0,536 # 80009f10 <lockPrint>
    80004d00:	ffffc097          	auipc	ra,0xffffc
    80004d04:	51c080e7          	jalr	1308(ra) # 8000121c <copy_and_swap>
    80004d08:	fe0514e3          	bnez	a0,80004cf0 <_Z11printStringPKc+0x4c>
}
    80004d0c:	01813083          	ld	ra,24(sp)
    80004d10:	01013403          	ld	s0,16(sp)
    80004d14:	00813483          	ld	s1,8(sp)
    80004d18:	02010113          	addi	sp,sp,32
    80004d1c:	00008067          	ret

0000000080004d20 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004d20:	fd010113          	addi	sp,sp,-48
    80004d24:	02113423          	sd	ra,40(sp)
    80004d28:	02813023          	sd	s0,32(sp)
    80004d2c:	00913c23          	sd	s1,24(sp)
    80004d30:	01213823          	sd	s2,16(sp)
    80004d34:	01313423          	sd	s3,8(sp)
    80004d38:	01413023          	sd	s4,0(sp)
    80004d3c:	03010413          	addi	s0,sp,48
    80004d40:	00050993          	mv	s3,a0
    80004d44:	00058a13          	mv	s4,a1
    LOCK();
    80004d48:	00100613          	li	a2,1
    80004d4c:	00000593          	li	a1,0
    80004d50:	00005517          	auipc	a0,0x5
    80004d54:	1c050513          	addi	a0,a0,448 # 80009f10 <lockPrint>
    80004d58:	ffffc097          	auipc	ra,0xffffc
    80004d5c:	4c4080e7          	jalr	1220(ra) # 8000121c <copy_and_swap>
    80004d60:	fe0514e3          	bnez	a0,80004d48 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004d64:	00000493          	li	s1,0
    80004d68:	0014891b          	addiw	s2,s1,1
    80004d6c:	03495a63          	bge	s2,s4,80004da0 <_Z9getStringPci+0x80>
        cc = getc();
    80004d70:	fffff097          	auipc	ra,0xfffff
    80004d74:	d0c080e7          	jalr	-756(ra) # 80003a7c <getc>
        if(cc < 1)
    80004d78:	02050463          	beqz	a0,80004da0 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80004d7c:	009984b3          	add	s1,s3,s1
    80004d80:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004d84:	00a00793          	li	a5,10
    80004d88:	00f50a63          	beq	a0,a5,80004d9c <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80004d8c:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80004d90:	00d00793          	li	a5,13
    80004d94:	fcf51ae3          	bne	a0,a5,80004d68 <_Z9getStringPci+0x48>
    80004d98:	0080006f          	j	80004da0 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80004d9c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004da0:	009984b3          	add	s1,s3,s1
    80004da4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004da8:	00000613          	li	a2,0
    80004dac:	00100593          	li	a1,1
    80004db0:	00005517          	auipc	a0,0x5
    80004db4:	16050513          	addi	a0,a0,352 # 80009f10 <lockPrint>
    80004db8:	ffffc097          	auipc	ra,0xffffc
    80004dbc:	464080e7          	jalr	1124(ra) # 8000121c <copy_and_swap>
    80004dc0:	fe0514e3          	bnez	a0,80004da8 <_Z9getStringPci+0x88>
    return buf;
}
    80004dc4:	00098513          	mv	a0,s3
    80004dc8:	02813083          	ld	ra,40(sp)
    80004dcc:	02013403          	ld	s0,32(sp)
    80004dd0:	01813483          	ld	s1,24(sp)
    80004dd4:	01013903          	ld	s2,16(sp)
    80004dd8:	00813983          	ld	s3,8(sp)
    80004ddc:	00013a03          	ld	s4,0(sp)
    80004de0:	03010113          	addi	sp,sp,48
    80004de4:	00008067          	ret

0000000080004de8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004de8:	ff010113          	addi	sp,sp,-16
    80004dec:	00813423          	sd	s0,8(sp)
    80004df0:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    80004df4:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    80004df8:	00054603          	lbu	a2,0(a0)
    80004dfc:	fd06069b          	addiw	a3,a2,-48
    80004e00:	0ff6f693          	andi	a3,a3,255
    80004e04:	00900713          	li	a4,9
    80004e08:	02d76063          	bltu	a4,a3,80004e28 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    80004e0c:	0027969b          	slliw	a3,a5,0x2
    80004e10:	00f687bb          	addw	a5,a3,a5
    80004e14:	0017971b          	slliw	a4,a5,0x1
    80004e18:	00150513          	addi	a0,a0,1
    80004e1c:	00c707bb          	addw	a5,a4,a2
    80004e20:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    80004e24:	fd5ff06f          	j	80004df8 <_Z11stringToIntPKc+0x10>
    return n;
}
    80004e28:	00078513          	mv	a0,a5
    80004e2c:	00813403          	ld	s0,8(sp)
    80004e30:	01010113          	addi	sp,sp,16
    80004e34:	00008067          	ret

0000000080004e38 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004e38:	fc010113          	addi	sp,sp,-64
    80004e3c:	02113c23          	sd	ra,56(sp)
    80004e40:	02813823          	sd	s0,48(sp)
    80004e44:	02913423          	sd	s1,40(sp)
    80004e48:	03213023          	sd	s2,32(sp)
    80004e4c:	01313c23          	sd	s3,24(sp)
    80004e50:	04010413          	addi	s0,sp,64
    80004e54:	00050493          	mv	s1,a0
    80004e58:	00058913          	mv	s2,a1
    80004e5c:	00060993          	mv	s3,a2
    LOCK();
    80004e60:	00100613          	li	a2,1
    80004e64:	00000593          	li	a1,0
    80004e68:	00005517          	auipc	a0,0x5
    80004e6c:	0a850513          	addi	a0,a0,168 # 80009f10 <lockPrint>
    80004e70:	ffffc097          	auipc	ra,0xffffc
    80004e74:	3ac080e7          	jalr	940(ra) # 8000121c <copy_and_swap>
    80004e78:	fe0514e3          	bnez	a0,80004e60 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004e7c:	00098463          	beqz	s3,80004e84 <_Z8printIntiii+0x4c>
    80004e80:	0004ca63          	bltz	s1,80004e94 <_Z8printIntiii+0x5c>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004e84:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004e88:	00000593          	li	a1,0
    }

    i = 0;
    80004e8c:	00000613          	li	a2,0
    80004e90:	0180006f          	j	80004ea8 <_Z8printIntiii+0x70>
        x = -xx;
    80004e94:	4090053b          	negw	a0,s1
        neg = 1;
    80004e98:	00100593          	li	a1,1
        x = -xx;
    80004e9c:	ff1ff06f          	j	80004e8c <_Z8printIntiii+0x54>
    do{
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    80004ea0:	00068513          	mv	a0,a3
        buf[i++] = digits[x % base];
    80004ea4:	00048613          	mv	a2,s1
    80004ea8:	0009079b          	sext.w	a5,s2
    80004eac:	02f5773b          	remuw	a4,a0,a5
    80004eb0:	0016049b          	addiw	s1,a2,1
    80004eb4:	02071693          	slli	a3,a4,0x20
    80004eb8:	0206d693          	srli	a3,a3,0x20
    80004ebc:	00005717          	auipc	a4,0x5
    80004ec0:	df470713          	addi	a4,a4,-524 # 80009cb0 <digits>
    80004ec4:	00d70733          	add	a4,a4,a3
    80004ec8:	00074683          	lbu	a3,0(a4)
    80004ecc:	fd040713          	addi	a4,s0,-48
    80004ed0:	00c70733          	add	a4,a4,a2
    80004ed4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004ed8:	02f5573b          	divuw	a4,a0,a5
    80004edc:	0007069b          	sext.w	a3,a4
    80004ee0:	fcf570e3          	bgeu	a0,a5,80004ea0 <_Z8printIntiii+0x68>
    if(neg)
    80004ee4:	00058c63          	beqz	a1,80004efc <_Z8printIntiii+0xc4>
        buf[i++] = '-';
    80004ee8:	fd040793          	addi	a5,s0,-48
    80004eec:	009784b3          	add	s1,a5,s1
    80004ef0:	02d00793          	li	a5,45
    80004ef4:	fef48823          	sb	a5,-16(s1)
    80004ef8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004efc:	fff4849b          	addiw	s1,s1,-1
    80004f00:	0004ce63          	bltz	s1,80004f1c <_Z8printIntiii+0xe4>
        putc(buf[i]);
    80004f04:	fd040793          	addi	a5,s0,-48
    80004f08:	009787b3          	add	a5,a5,s1
    80004f0c:	ff07c503          	lbu	a0,-16(a5)
    80004f10:	fffff097          	auipc	ra,0xfffff
    80004f14:	ba8080e7          	jalr	-1112(ra) # 80003ab8 <putc>
    80004f18:	fe5ff06f          	j	80004efc <_Z8printIntiii+0xc4>

    UNLOCK();
    80004f1c:	00000613          	li	a2,0
    80004f20:	00100593          	li	a1,1
    80004f24:	00005517          	auipc	a0,0x5
    80004f28:	fec50513          	addi	a0,a0,-20 # 80009f10 <lockPrint>
    80004f2c:	ffffc097          	auipc	ra,0xffffc
    80004f30:	2f0080e7          	jalr	752(ra) # 8000121c <copy_and_swap>
    80004f34:	fe0514e3          	bnez	a0,80004f1c <_Z8printIntiii+0xe4>
    80004f38:	03813083          	ld	ra,56(sp)
    80004f3c:	03013403          	ld	s0,48(sp)
    80004f40:	02813483          	ld	s1,40(sp)
    80004f44:	02013903          	ld	s2,32(sp)
    80004f48:	01813983          	ld	s3,24(sp)
    80004f4c:	04010113          	addi	sp,sp,64
    80004f50:	00008067          	ret

0000000080004f54 <start>:
    80004f54:	ff010113          	addi	sp,sp,-16
    80004f58:	00813423          	sd	s0,8(sp)
    80004f5c:	01010413          	addi	s0,sp,16
    80004f60:	300027f3          	csrr	a5,mstatus
    80004f64:	ffffe737          	lui	a4,0xffffe
    80004f68:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff362f>
    80004f6c:	00e7f7b3          	and	a5,a5,a4
    80004f70:	00001737          	lui	a4,0x1
    80004f74:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004f78:	00e7e7b3          	or	a5,a5,a4
    80004f7c:	30079073          	csrw	mstatus,a5
    80004f80:	00000797          	auipc	a5,0x0
    80004f84:	16078793          	addi	a5,a5,352 # 800050e0 <system_main>
    80004f88:	34179073          	csrw	mepc,a5
    80004f8c:	00000793          	li	a5,0
    80004f90:	18079073          	csrw	satp,a5
    80004f94:	000107b7          	lui	a5,0x10
    80004f98:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004f9c:	30279073          	csrw	medeleg,a5
    80004fa0:	30379073          	csrw	mideleg,a5
    80004fa4:	104027f3          	csrr	a5,sie
    80004fa8:	2227e793          	ori	a5,a5,546
    80004fac:	10479073          	csrw	sie,a5
    80004fb0:	fff00793          	li	a5,-1
    80004fb4:	00a7d793          	srli	a5,a5,0xa
    80004fb8:	3b079073          	csrw	pmpaddr0,a5
    80004fbc:	00f00793          	li	a5,15
    80004fc0:	3a079073          	csrw	pmpcfg0,a5
    80004fc4:	f14027f3          	csrr	a5,mhartid
    80004fc8:	0200c737          	lui	a4,0x200c
    80004fcc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004fd0:	0007869b          	sext.w	a3,a5
    80004fd4:	00269713          	slli	a4,a3,0x2
    80004fd8:	000f4637          	lui	a2,0xf4
    80004fdc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004fe0:	00d70733          	add	a4,a4,a3
    80004fe4:	0037979b          	slliw	a5,a5,0x3
    80004fe8:	020046b7          	lui	a3,0x2004
    80004fec:	00d787b3          	add	a5,a5,a3
    80004ff0:	00c585b3          	add	a1,a1,a2
    80004ff4:	00371693          	slli	a3,a4,0x3
    80004ff8:	00005717          	auipc	a4,0x5
    80004ffc:	f7870713          	addi	a4,a4,-136 # 80009f70 <timer_scratch>
    80005000:	00b7b023          	sd	a1,0(a5)
    80005004:	00d70733          	add	a4,a4,a3
    80005008:	00f73c23          	sd	a5,24(a4)
    8000500c:	02c73023          	sd	a2,32(a4)
    80005010:	34071073          	csrw	mscratch,a4
    80005014:	00000797          	auipc	a5,0x0
    80005018:	6ec78793          	addi	a5,a5,1772 # 80005700 <timervec>
    8000501c:	30579073          	csrw	mtvec,a5
    80005020:	300027f3          	csrr	a5,mstatus
    80005024:	0087e793          	ori	a5,a5,8
    80005028:	30079073          	csrw	mstatus,a5
    8000502c:	304027f3          	csrr	a5,mie
    80005030:	0807e793          	ori	a5,a5,128
    80005034:	30479073          	csrw	mie,a5
    80005038:	f14027f3          	csrr	a5,mhartid
    8000503c:	0007879b          	sext.w	a5,a5
    80005040:	00078213          	mv	tp,a5
    80005044:	30200073          	mret
    80005048:	00813403          	ld	s0,8(sp)
    8000504c:	01010113          	addi	sp,sp,16
    80005050:	00008067          	ret

0000000080005054 <timerinit>:
    80005054:	ff010113          	addi	sp,sp,-16
    80005058:	00813423          	sd	s0,8(sp)
    8000505c:	01010413          	addi	s0,sp,16
    80005060:	f14027f3          	csrr	a5,mhartid
    80005064:	0200c737          	lui	a4,0x200c
    80005068:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000506c:	0007869b          	sext.w	a3,a5
    80005070:	00269713          	slli	a4,a3,0x2
    80005074:	000f4637          	lui	a2,0xf4
    80005078:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000507c:	00d70733          	add	a4,a4,a3
    80005080:	0037979b          	slliw	a5,a5,0x3
    80005084:	020046b7          	lui	a3,0x2004
    80005088:	00d787b3          	add	a5,a5,a3
    8000508c:	00c585b3          	add	a1,a1,a2
    80005090:	00371693          	slli	a3,a4,0x3
    80005094:	00005717          	auipc	a4,0x5
    80005098:	edc70713          	addi	a4,a4,-292 # 80009f70 <timer_scratch>
    8000509c:	00b7b023          	sd	a1,0(a5)
    800050a0:	00d70733          	add	a4,a4,a3
    800050a4:	00f73c23          	sd	a5,24(a4)
    800050a8:	02c73023          	sd	a2,32(a4)
    800050ac:	34071073          	csrw	mscratch,a4
    800050b0:	00000797          	auipc	a5,0x0
    800050b4:	65078793          	addi	a5,a5,1616 # 80005700 <timervec>
    800050b8:	30579073          	csrw	mtvec,a5
    800050bc:	300027f3          	csrr	a5,mstatus
    800050c0:	0087e793          	ori	a5,a5,8
    800050c4:	30079073          	csrw	mstatus,a5
    800050c8:	304027f3          	csrr	a5,mie
    800050cc:	0807e793          	ori	a5,a5,128
    800050d0:	30479073          	csrw	mie,a5
    800050d4:	00813403          	ld	s0,8(sp)
    800050d8:	01010113          	addi	sp,sp,16
    800050dc:	00008067          	ret

00000000800050e0 <system_main>:
    800050e0:	fe010113          	addi	sp,sp,-32
    800050e4:	00813823          	sd	s0,16(sp)
    800050e8:	00913423          	sd	s1,8(sp)
    800050ec:	00113c23          	sd	ra,24(sp)
    800050f0:	02010413          	addi	s0,sp,32
    800050f4:	00000097          	auipc	ra,0x0
    800050f8:	0c4080e7          	jalr	196(ra) # 800051b8 <cpuid>
    800050fc:	00005497          	auipc	s1,0x5
    80005100:	e1c48493          	addi	s1,s1,-484 # 80009f18 <started>
    80005104:	02050263          	beqz	a0,80005128 <system_main+0x48>
    80005108:	0004a783          	lw	a5,0(s1)
    8000510c:	0007879b          	sext.w	a5,a5
    80005110:	fe078ce3          	beqz	a5,80005108 <system_main+0x28>
    80005114:	0ff0000f          	fence
    80005118:	00003517          	auipc	a0,0x3
    8000511c:	42850513          	addi	a0,a0,1064 # 80008540 <_ZTV14PeriodicThread+0x80>
    80005120:	00001097          	auipc	ra,0x1
    80005124:	a7c080e7          	jalr	-1412(ra) # 80005b9c <panic>
    80005128:	00001097          	auipc	ra,0x1
    8000512c:	9d0080e7          	jalr	-1584(ra) # 80005af8 <consoleinit>
    80005130:	00001097          	auipc	ra,0x1
    80005134:	15c080e7          	jalr	348(ra) # 8000628c <printfinit>
    80005138:	00003517          	auipc	a0,0x3
    8000513c:	11850513          	addi	a0,a0,280 # 80008250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    80005140:	00001097          	auipc	ra,0x1
    80005144:	ab8080e7          	jalr	-1352(ra) # 80005bf8 <__printf>
    80005148:	00003517          	auipc	a0,0x3
    8000514c:	3c850513          	addi	a0,a0,968 # 80008510 <_ZTV14PeriodicThread+0x50>
    80005150:	00001097          	auipc	ra,0x1
    80005154:	aa8080e7          	jalr	-1368(ra) # 80005bf8 <__printf>
    80005158:	00003517          	auipc	a0,0x3
    8000515c:	0f850513          	addi	a0,a0,248 # 80008250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    80005160:	00001097          	auipc	ra,0x1
    80005164:	a98080e7          	jalr	-1384(ra) # 80005bf8 <__printf>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	4b0080e7          	jalr	1200(ra) # 80006618 <kinit>
    80005170:	00000097          	auipc	ra,0x0
    80005174:	148080e7          	jalr	328(ra) # 800052b8 <trapinit>
    80005178:	00000097          	auipc	ra,0x0
    8000517c:	16c080e7          	jalr	364(ra) # 800052e4 <trapinithart>
    80005180:	00000097          	auipc	ra,0x0
    80005184:	5c0080e7          	jalr	1472(ra) # 80005740 <plicinit>
    80005188:	00000097          	auipc	ra,0x0
    8000518c:	5e0080e7          	jalr	1504(ra) # 80005768 <plicinithart>
    80005190:	00000097          	auipc	ra,0x0
    80005194:	078080e7          	jalr	120(ra) # 80005208 <userinit>
    80005198:	0ff0000f          	fence
    8000519c:	00100793          	li	a5,1
    800051a0:	00003517          	auipc	a0,0x3
    800051a4:	38850513          	addi	a0,a0,904 # 80008528 <_ZTV14PeriodicThread+0x68>
    800051a8:	00f4a023          	sw	a5,0(s1)
    800051ac:	00001097          	auipc	ra,0x1
    800051b0:	a4c080e7          	jalr	-1460(ra) # 80005bf8 <__printf>
    800051b4:	0000006f          	j	800051b4 <system_main+0xd4>

00000000800051b8 <cpuid>:
    800051b8:	ff010113          	addi	sp,sp,-16
    800051bc:	00813423          	sd	s0,8(sp)
    800051c0:	01010413          	addi	s0,sp,16
    800051c4:	00020513          	mv	a0,tp
    800051c8:	00813403          	ld	s0,8(sp)
    800051cc:	0005051b          	sext.w	a0,a0
    800051d0:	01010113          	addi	sp,sp,16
    800051d4:	00008067          	ret

00000000800051d8 <mycpu>:
    800051d8:	ff010113          	addi	sp,sp,-16
    800051dc:	00813423          	sd	s0,8(sp)
    800051e0:	01010413          	addi	s0,sp,16
    800051e4:	00020793          	mv	a5,tp
    800051e8:	00813403          	ld	s0,8(sp)
    800051ec:	0007879b          	sext.w	a5,a5
    800051f0:	00779793          	slli	a5,a5,0x7
    800051f4:	00006517          	auipc	a0,0x6
    800051f8:	dac50513          	addi	a0,a0,-596 # 8000afa0 <cpus>
    800051fc:	00f50533          	add	a0,a0,a5
    80005200:	01010113          	addi	sp,sp,16
    80005204:	00008067          	ret

0000000080005208 <userinit>:
    80005208:	ff010113          	addi	sp,sp,-16
    8000520c:	00813423          	sd	s0,8(sp)
    80005210:	01010413          	addi	s0,sp,16
    80005214:	00813403          	ld	s0,8(sp)
    80005218:	01010113          	addi	sp,sp,16
    8000521c:	ffffd317          	auipc	t1,0xffffd
    80005220:	18030067          	jr	384(t1) # 8000239c <main>

0000000080005224 <either_copyout>:
    80005224:	ff010113          	addi	sp,sp,-16
    80005228:	00813023          	sd	s0,0(sp)
    8000522c:	00113423          	sd	ra,8(sp)
    80005230:	01010413          	addi	s0,sp,16
    80005234:	02051663          	bnez	a0,80005260 <either_copyout+0x3c>
    80005238:	00058513          	mv	a0,a1
    8000523c:	00060593          	mv	a1,a2
    80005240:	0006861b          	sext.w	a2,a3
    80005244:	00002097          	auipc	ra,0x2
    80005248:	c60080e7          	jalr	-928(ra) # 80006ea4 <__memmove>
    8000524c:	00813083          	ld	ra,8(sp)
    80005250:	00013403          	ld	s0,0(sp)
    80005254:	00000513          	li	a0,0
    80005258:	01010113          	addi	sp,sp,16
    8000525c:	00008067          	ret
    80005260:	00003517          	auipc	a0,0x3
    80005264:	30850513          	addi	a0,a0,776 # 80008568 <_ZTV14PeriodicThread+0xa8>
    80005268:	00001097          	auipc	ra,0x1
    8000526c:	934080e7          	jalr	-1740(ra) # 80005b9c <panic>

0000000080005270 <either_copyin>:
    80005270:	ff010113          	addi	sp,sp,-16
    80005274:	00813023          	sd	s0,0(sp)
    80005278:	00113423          	sd	ra,8(sp)
    8000527c:	01010413          	addi	s0,sp,16
    80005280:	02059463          	bnez	a1,800052a8 <either_copyin+0x38>
    80005284:	00060593          	mv	a1,a2
    80005288:	0006861b          	sext.w	a2,a3
    8000528c:	00002097          	auipc	ra,0x2
    80005290:	c18080e7          	jalr	-1000(ra) # 80006ea4 <__memmove>
    80005294:	00813083          	ld	ra,8(sp)
    80005298:	00013403          	ld	s0,0(sp)
    8000529c:	00000513          	li	a0,0
    800052a0:	01010113          	addi	sp,sp,16
    800052a4:	00008067          	ret
    800052a8:	00003517          	auipc	a0,0x3
    800052ac:	2e850513          	addi	a0,a0,744 # 80008590 <_ZTV14PeriodicThread+0xd0>
    800052b0:	00001097          	auipc	ra,0x1
    800052b4:	8ec080e7          	jalr	-1812(ra) # 80005b9c <panic>

00000000800052b8 <trapinit>:
    800052b8:	ff010113          	addi	sp,sp,-16
    800052bc:	00813423          	sd	s0,8(sp)
    800052c0:	01010413          	addi	s0,sp,16
    800052c4:	00813403          	ld	s0,8(sp)
    800052c8:	00003597          	auipc	a1,0x3
    800052cc:	2f058593          	addi	a1,a1,752 # 800085b8 <_ZTV14PeriodicThread+0xf8>
    800052d0:	00006517          	auipc	a0,0x6
    800052d4:	d5050513          	addi	a0,a0,-688 # 8000b020 <tickslock>
    800052d8:	01010113          	addi	sp,sp,16
    800052dc:	00001317          	auipc	t1,0x1
    800052e0:	5cc30067          	jr	1484(t1) # 800068a8 <initlock>

00000000800052e4 <trapinithart>:
    800052e4:	ff010113          	addi	sp,sp,-16
    800052e8:	00813423          	sd	s0,8(sp)
    800052ec:	01010413          	addi	s0,sp,16
    800052f0:	00000797          	auipc	a5,0x0
    800052f4:	30078793          	addi	a5,a5,768 # 800055f0 <kernelvec>
    800052f8:	10579073          	csrw	stvec,a5
    800052fc:	00813403          	ld	s0,8(sp)
    80005300:	01010113          	addi	sp,sp,16
    80005304:	00008067          	ret

0000000080005308 <usertrap>:
    80005308:	ff010113          	addi	sp,sp,-16
    8000530c:	00813423          	sd	s0,8(sp)
    80005310:	01010413          	addi	s0,sp,16
    80005314:	00813403          	ld	s0,8(sp)
    80005318:	01010113          	addi	sp,sp,16
    8000531c:	00008067          	ret

0000000080005320 <usertrapret>:
    80005320:	ff010113          	addi	sp,sp,-16
    80005324:	00813423          	sd	s0,8(sp)
    80005328:	01010413          	addi	s0,sp,16
    8000532c:	00813403          	ld	s0,8(sp)
    80005330:	01010113          	addi	sp,sp,16
    80005334:	00008067          	ret

0000000080005338 <kerneltrap>:
    80005338:	fe010113          	addi	sp,sp,-32
    8000533c:	00813823          	sd	s0,16(sp)
    80005340:	00113c23          	sd	ra,24(sp)
    80005344:	00913423          	sd	s1,8(sp)
    80005348:	02010413          	addi	s0,sp,32
    8000534c:	142025f3          	csrr	a1,scause
    80005350:	100027f3          	csrr	a5,sstatus
    80005354:	0027f793          	andi	a5,a5,2
    80005358:	10079c63          	bnez	a5,80005470 <kerneltrap+0x138>
    8000535c:	142027f3          	csrr	a5,scause
    80005360:	0207ce63          	bltz	a5,8000539c <kerneltrap+0x64>
    80005364:	00003517          	auipc	a0,0x3
    80005368:	29c50513          	addi	a0,a0,668 # 80008600 <_ZTV14PeriodicThread+0x140>
    8000536c:	00001097          	auipc	ra,0x1
    80005370:	88c080e7          	jalr	-1908(ra) # 80005bf8 <__printf>
    80005374:	141025f3          	csrr	a1,sepc
    80005378:	14302673          	csrr	a2,stval
    8000537c:	00003517          	auipc	a0,0x3
    80005380:	29450513          	addi	a0,a0,660 # 80008610 <_ZTV14PeriodicThread+0x150>
    80005384:	00001097          	auipc	ra,0x1
    80005388:	874080e7          	jalr	-1932(ra) # 80005bf8 <__printf>
    8000538c:	00003517          	auipc	a0,0x3
    80005390:	29c50513          	addi	a0,a0,668 # 80008628 <_ZTV14PeriodicThread+0x168>
    80005394:	00001097          	auipc	ra,0x1
    80005398:	808080e7          	jalr	-2040(ra) # 80005b9c <panic>
    8000539c:	0ff7f713          	andi	a4,a5,255
    800053a0:	00900693          	li	a3,9
    800053a4:	04d70063          	beq	a4,a3,800053e4 <kerneltrap+0xac>
    800053a8:	fff00713          	li	a4,-1
    800053ac:	03f71713          	slli	a4,a4,0x3f
    800053b0:	00170713          	addi	a4,a4,1
    800053b4:	fae798e3          	bne	a5,a4,80005364 <kerneltrap+0x2c>
    800053b8:	00000097          	auipc	ra,0x0
    800053bc:	e00080e7          	jalr	-512(ra) # 800051b8 <cpuid>
    800053c0:	06050663          	beqz	a0,8000542c <kerneltrap+0xf4>
    800053c4:	144027f3          	csrr	a5,sip
    800053c8:	ffd7f793          	andi	a5,a5,-3
    800053cc:	14479073          	csrw	sip,a5
    800053d0:	01813083          	ld	ra,24(sp)
    800053d4:	01013403          	ld	s0,16(sp)
    800053d8:	00813483          	ld	s1,8(sp)
    800053dc:	02010113          	addi	sp,sp,32
    800053e0:	00008067          	ret
    800053e4:	00000097          	auipc	ra,0x0
    800053e8:	3d0080e7          	jalr	976(ra) # 800057b4 <plic_claim>
    800053ec:	00a00793          	li	a5,10
    800053f0:	00050493          	mv	s1,a0
    800053f4:	06f50863          	beq	a0,a5,80005464 <kerneltrap+0x12c>
    800053f8:	fc050ce3          	beqz	a0,800053d0 <kerneltrap+0x98>
    800053fc:	00050593          	mv	a1,a0
    80005400:	00003517          	auipc	a0,0x3
    80005404:	1e050513          	addi	a0,a0,480 # 800085e0 <_ZTV14PeriodicThread+0x120>
    80005408:	00000097          	auipc	ra,0x0
    8000540c:	7f0080e7          	jalr	2032(ra) # 80005bf8 <__printf>
    80005410:	01013403          	ld	s0,16(sp)
    80005414:	01813083          	ld	ra,24(sp)
    80005418:	00048513          	mv	a0,s1
    8000541c:	00813483          	ld	s1,8(sp)
    80005420:	02010113          	addi	sp,sp,32
    80005424:	00000317          	auipc	t1,0x0
    80005428:	3c830067          	jr	968(t1) # 800057ec <plic_complete>
    8000542c:	00006517          	auipc	a0,0x6
    80005430:	bf450513          	addi	a0,a0,-1036 # 8000b020 <tickslock>
    80005434:	00001097          	auipc	ra,0x1
    80005438:	498080e7          	jalr	1176(ra) # 800068cc <acquire>
    8000543c:	00005717          	auipc	a4,0x5
    80005440:	ae070713          	addi	a4,a4,-1312 # 80009f1c <ticks>
    80005444:	00072783          	lw	a5,0(a4)
    80005448:	00006517          	auipc	a0,0x6
    8000544c:	bd850513          	addi	a0,a0,-1064 # 8000b020 <tickslock>
    80005450:	0017879b          	addiw	a5,a5,1
    80005454:	00f72023          	sw	a5,0(a4)
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	540080e7          	jalr	1344(ra) # 80006998 <release>
    80005460:	f65ff06f          	j	800053c4 <kerneltrap+0x8c>
    80005464:	00001097          	auipc	ra,0x1
    80005468:	09c080e7          	jalr	156(ra) # 80006500 <uartintr>
    8000546c:	fa5ff06f          	j	80005410 <kerneltrap+0xd8>
    80005470:	00003517          	auipc	a0,0x3
    80005474:	15050513          	addi	a0,a0,336 # 800085c0 <_ZTV14PeriodicThread+0x100>
    80005478:	00000097          	auipc	ra,0x0
    8000547c:	724080e7          	jalr	1828(ra) # 80005b9c <panic>

0000000080005480 <clockintr>:
    80005480:	fe010113          	addi	sp,sp,-32
    80005484:	00813823          	sd	s0,16(sp)
    80005488:	00913423          	sd	s1,8(sp)
    8000548c:	00113c23          	sd	ra,24(sp)
    80005490:	02010413          	addi	s0,sp,32
    80005494:	00006497          	auipc	s1,0x6
    80005498:	b8c48493          	addi	s1,s1,-1140 # 8000b020 <tickslock>
    8000549c:	00048513          	mv	a0,s1
    800054a0:	00001097          	auipc	ra,0x1
    800054a4:	42c080e7          	jalr	1068(ra) # 800068cc <acquire>
    800054a8:	00005717          	auipc	a4,0x5
    800054ac:	a7470713          	addi	a4,a4,-1420 # 80009f1c <ticks>
    800054b0:	00072783          	lw	a5,0(a4)
    800054b4:	01013403          	ld	s0,16(sp)
    800054b8:	01813083          	ld	ra,24(sp)
    800054bc:	00048513          	mv	a0,s1
    800054c0:	0017879b          	addiw	a5,a5,1
    800054c4:	00813483          	ld	s1,8(sp)
    800054c8:	00f72023          	sw	a5,0(a4)
    800054cc:	02010113          	addi	sp,sp,32
    800054d0:	00001317          	auipc	t1,0x1
    800054d4:	4c830067          	jr	1224(t1) # 80006998 <release>

00000000800054d8 <devintr>:
    800054d8:	142027f3          	csrr	a5,scause
    800054dc:	00000513          	li	a0,0
    800054e0:	0007c463          	bltz	a5,800054e8 <devintr+0x10>
    800054e4:	00008067          	ret
    800054e8:	fe010113          	addi	sp,sp,-32
    800054ec:	00813823          	sd	s0,16(sp)
    800054f0:	00113c23          	sd	ra,24(sp)
    800054f4:	00913423          	sd	s1,8(sp)
    800054f8:	02010413          	addi	s0,sp,32
    800054fc:	0ff7f713          	andi	a4,a5,255
    80005500:	00900693          	li	a3,9
    80005504:	04d70c63          	beq	a4,a3,8000555c <devintr+0x84>
    80005508:	fff00713          	li	a4,-1
    8000550c:	03f71713          	slli	a4,a4,0x3f
    80005510:	00170713          	addi	a4,a4,1
    80005514:	00e78c63          	beq	a5,a4,8000552c <devintr+0x54>
    80005518:	01813083          	ld	ra,24(sp)
    8000551c:	01013403          	ld	s0,16(sp)
    80005520:	00813483          	ld	s1,8(sp)
    80005524:	02010113          	addi	sp,sp,32
    80005528:	00008067          	ret
    8000552c:	00000097          	auipc	ra,0x0
    80005530:	c8c080e7          	jalr	-884(ra) # 800051b8 <cpuid>
    80005534:	06050663          	beqz	a0,800055a0 <devintr+0xc8>
    80005538:	144027f3          	csrr	a5,sip
    8000553c:	ffd7f793          	andi	a5,a5,-3
    80005540:	14479073          	csrw	sip,a5
    80005544:	01813083          	ld	ra,24(sp)
    80005548:	01013403          	ld	s0,16(sp)
    8000554c:	00813483          	ld	s1,8(sp)
    80005550:	00200513          	li	a0,2
    80005554:	02010113          	addi	sp,sp,32
    80005558:	00008067          	ret
    8000555c:	00000097          	auipc	ra,0x0
    80005560:	258080e7          	jalr	600(ra) # 800057b4 <plic_claim>
    80005564:	00a00793          	li	a5,10
    80005568:	00050493          	mv	s1,a0
    8000556c:	06f50663          	beq	a0,a5,800055d8 <devintr+0x100>
    80005570:	00100513          	li	a0,1
    80005574:	fa0482e3          	beqz	s1,80005518 <devintr+0x40>
    80005578:	00048593          	mv	a1,s1
    8000557c:	00003517          	auipc	a0,0x3
    80005580:	06450513          	addi	a0,a0,100 # 800085e0 <_ZTV14PeriodicThread+0x120>
    80005584:	00000097          	auipc	ra,0x0
    80005588:	674080e7          	jalr	1652(ra) # 80005bf8 <__printf>
    8000558c:	00048513          	mv	a0,s1
    80005590:	00000097          	auipc	ra,0x0
    80005594:	25c080e7          	jalr	604(ra) # 800057ec <plic_complete>
    80005598:	00100513          	li	a0,1
    8000559c:	f7dff06f          	j	80005518 <devintr+0x40>
    800055a0:	00006517          	auipc	a0,0x6
    800055a4:	a8050513          	addi	a0,a0,-1408 # 8000b020 <tickslock>
    800055a8:	00001097          	auipc	ra,0x1
    800055ac:	324080e7          	jalr	804(ra) # 800068cc <acquire>
    800055b0:	00005717          	auipc	a4,0x5
    800055b4:	96c70713          	addi	a4,a4,-1684 # 80009f1c <ticks>
    800055b8:	00072783          	lw	a5,0(a4)
    800055bc:	00006517          	auipc	a0,0x6
    800055c0:	a6450513          	addi	a0,a0,-1436 # 8000b020 <tickslock>
    800055c4:	0017879b          	addiw	a5,a5,1
    800055c8:	00f72023          	sw	a5,0(a4)
    800055cc:	00001097          	auipc	ra,0x1
    800055d0:	3cc080e7          	jalr	972(ra) # 80006998 <release>
    800055d4:	f65ff06f          	j	80005538 <devintr+0x60>
    800055d8:	00001097          	auipc	ra,0x1
    800055dc:	f28080e7          	jalr	-216(ra) # 80006500 <uartintr>
    800055e0:	fadff06f          	j	8000558c <devintr+0xb4>
	...

00000000800055f0 <kernelvec>:
    800055f0:	f0010113          	addi	sp,sp,-256
    800055f4:	00113023          	sd	ra,0(sp)
    800055f8:	00213423          	sd	sp,8(sp)
    800055fc:	00313823          	sd	gp,16(sp)
    80005600:	00413c23          	sd	tp,24(sp)
    80005604:	02513023          	sd	t0,32(sp)
    80005608:	02613423          	sd	t1,40(sp)
    8000560c:	02713823          	sd	t2,48(sp)
    80005610:	02813c23          	sd	s0,56(sp)
    80005614:	04913023          	sd	s1,64(sp)
    80005618:	04a13423          	sd	a0,72(sp)
    8000561c:	04b13823          	sd	a1,80(sp)
    80005620:	04c13c23          	sd	a2,88(sp)
    80005624:	06d13023          	sd	a3,96(sp)
    80005628:	06e13423          	sd	a4,104(sp)
    8000562c:	06f13823          	sd	a5,112(sp)
    80005630:	07013c23          	sd	a6,120(sp)
    80005634:	09113023          	sd	a7,128(sp)
    80005638:	09213423          	sd	s2,136(sp)
    8000563c:	09313823          	sd	s3,144(sp)
    80005640:	09413c23          	sd	s4,152(sp)
    80005644:	0b513023          	sd	s5,160(sp)
    80005648:	0b613423          	sd	s6,168(sp)
    8000564c:	0b713823          	sd	s7,176(sp)
    80005650:	0b813c23          	sd	s8,184(sp)
    80005654:	0d913023          	sd	s9,192(sp)
    80005658:	0da13423          	sd	s10,200(sp)
    8000565c:	0db13823          	sd	s11,208(sp)
    80005660:	0dc13c23          	sd	t3,216(sp)
    80005664:	0fd13023          	sd	t4,224(sp)
    80005668:	0fe13423          	sd	t5,232(sp)
    8000566c:	0ff13823          	sd	t6,240(sp)
    80005670:	cc9ff0ef          	jal	ra,80005338 <kerneltrap>
    80005674:	00013083          	ld	ra,0(sp)
    80005678:	00813103          	ld	sp,8(sp)
    8000567c:	01013183          	ld	gp,16(sp)
    80005680:	02013283          	ld	t0,32(sp)
    80005684:	02813303          	ld	t1,40(sp)
    80005688:	03013383          	ld	t2,48(sp)
    8000568c:	03813403          	ld	s0,56(sp)
    80005690:	04013483          	ld	s1,64(sp)
    80005694:	04813503          	ld	a0,72(sp)
    80005698:	05013583          	ld	a1,80(sp)
    8000569c:	05813603          	ld	a2,88(sp)
    800056a0:	06013683          	ld	a3,96(sp)
    800056a4:	06813703          	ld	a4,104(sp)
    800056a8:	07013783          	ld	a5,112(sp)
    800056ac:	07813803          	ld	a6,120(sp)
    800056b0:	08013883          	ld	a7,128(sp)
    800056b4:	08813903          	ld	s2,136(sp)
    800056b8:	09013983          	ld	s3,144(sp)
    800056bc:	09813a03          	ld	s4,152(sp)
    800056c0:	0a013a83          	ld	s5,160(sp)
    800056c4:	0a813b03          	ld	s6,168(sp)
    800056c8:	0b013b83          	ld	s7,176(sp)
    800056cc:	0b813c03          	ld	s8,184(sp)
    800056d0:	0c013c83          	ld	s9,192(sp)
    800056d4:	0c813d03          	ld	s10,200(sp)
    800056d8:	0d013d83          	ld	s11,208(sp)
    800056dc:	0d813e03          	ld	t3,216(sp)
    800056e0:	0e013e83          	ld	t4,224(sp)
    800056e4:	0e813f03          	ld	t5,232(sp)
    800056e8:	0f013f83          	ld	t6,240(sp)
    800056ec:	10010113          	addi	sp,sp,256
    800056f0:	10200073          	sret
    800056f4:	00000013          	nop
    800056f8:	00000013          	nop
    800056fc:	00000013          	nop

0000000080005700 <timervec>:
    80005700:	34051573          	csrrw	a0,mscratch,a0
    80005704:	00b53023          	sd	a1,0(a0)
    80005708:	00c53423          	sd	a2,8(a0)
    8000570c:	00d53823          	sd	a3,16(a0)
    80005710:	01853583          	ld	a1,24(a0)
    80005714:	02053603          	ld	a2,32(a0)
    80005718:	0005b683          	ld	a3,0(a1)
    8000571c:	00c686b3          	add	a3,a3,a2
    80005720:	00d5b023          	sd	a3,0(a1)
    80005724:	00200593          	li	a1,2
    80005728:	14459073          	csrw	sip,a1
    8000572c:	01053683          	ld	a3,16(a0)
    80005730:	00853603          	ld	a2,8(a0)
    80005734:	00053583          	ld	a1,0(a0)
    80005738:	34051573          	csrrw	a0,mscratch,a0
    8000573c:	30200073          	mret

0000000080005740 <plicinit>:
    80005740:	ff010113          	addi	sp,sp,-16
    80005744:	00813423          	sd	s0,8(sp)
    80005748:	01010413          	addi	s0,sp,16
    8000574c:	00813403          	ld	s0,8(sp)
    80005750:	0c0007b7          	lui	a5,0xc000
    80005754:	00100713          	li	a4,1
    80005758:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000575c:	00e7a223          	sw	a4,4(a5)
    80005760:	01010113          	addi	sp,sp,16
    80005764:	00008067          	ret

0000000080005768 <plicinithart>:
    80005768:	ff010113          	addi	sp,sp,-16
    8000576c:	00813023          	sd	s0,0(sp)
    80005770:	00113423          	sd	ra,8(sp)
    80005774:	01010413          	addi	s0,sp,16
    80005778:	00000097          	auipc	ra,0x0
    8000577c:	a40080e7          	jalr	-1472(ra) # 800051b8 <cpuid>
    80005780:	0085171b          	slliw	a4,a0,0x8
    80005784:	0c0027b7          	lui	a5,0xc002
    80005788:	00e787b3          	add	a5,a5,a4
    8000578c:	40200713          	li	a4,1026
    80005790:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005794:	00813083          	ld	ra,8(sp)
    80005798:	00013403          	ld	s0,0(sp)
    8000579c:	00d5151b          	slliw	a0,a0,0xd
    800057a0:	0c2017b7          	lui	a5,0xc201
    800057a4:	00a78533          	add	a0,a5,a0
    800057a8:	00052023          	sw	zero,0(a0)
    800057ac:	01010113          	addi	sp,sp,16
    800057b0:	00008067          	ret

00000000800057b4 <plic_claim>:
    800057b4:	ff010113          	addi	sp,sp,-16
    800057b8:	00813023          	sd	s0,0(sp)
    800057bc:	00113423          	sd	ra,8(sp)
    800057c0:	01010413          	addi	s0,sp,16
    800057c4:	00000097          	auipc	ra,0x0
    800057c8:	9f4080e7          	jalr	-1548(ra) # 800051b8 <cpuid>
    800057cc:	00813083          	ld	ra,8(sp)
    800057d0:	00013403          	ld	s0,0(sp)
    800057d4:	00d5151b          	slliw	a0,a0,0xd
    800057d8:	0c2017b7          	lui	a5,0xc201
    800057dc:	00a78533          	add	a0,a5,a0
    800057e0:	00452503          	lw	a0,4(a0)
    800057e4:	01010113          	addi	sp,sp,16
    800057e8:	00008067          	ret

00000000800057ec <plic_complete>:
    800057ec:	fe010113          	addi	sp,sp,-32
    800057f0:	00813823          	sd	s0,16(sp)
    800057f4:	00913423          	sd	s1,8(sp)
    800057f8:	00113c23          	sd	ra,24(sp)
    800057fc:	02010413          	addi	s0,sp,32
    80005800:	00050493          	mv	s1,a0
    80005804:	00000097          	auipc	ra,0x0
    80005808:	9b4080e7          	jalr	-1612(ra) # 800051b8 <cpuid>
    8000580c:	01813083          	ld	ra,24(sp)
    80005810:	01013403          	ld	s0,16(sp)
    80005814:	00d5179b          	slliw	a5,a0,0xd
    80005818:	0c201737          	lui	a4,0xc201
    8000581c:	00f707b3          	add	a5,a4,a5
    80005820:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005824:	00813483          	ld	s1,8(sp)
    80005828:	02010113          	addi	sp,sp,32
    8000582c:	00008067          	ret

0000000080005830 <consolewrite>:
    80005830:	fb010113          	addi	sp,sp,-80
    80005834:	04813023          	sd	s0,64(sp)
    80005838:	04113423          	sd	ra,72(sp)
    8000583c:	02913c23          	sd	s1,56(sp)
    80005840:	03213823          	sd	s2,48(sp)
    80005844:	03313423          	sd	s3,40(sp)
    80005848:	03413023          	sd	s4,32(sp)
    8000584c:	01513c23          	sd	s5,24(sp)
    80005850:	05010413          	addi	s0,sp,80
    80005854:	06c05c63          	blez	a2,800058cc <consolewrite+0x9c>
    80005858:	00060993          	mv	s3,a2
    8000585c:	00050a13          	mv	s4,a0
    80005860:	00058493          	mv	s1,a1
    80005864:	00000913          	li	s2,0
    80005868:	fff00a93          	li	s5,-1
    8000586c:	01c0006f          	j	80005888 <consolewrite+0x58>
    80005870:	fbf44503          	lbu	a0,-65(s0)
    80005874:	0019091b          	addiw	s2,s2,1
    80005878:	00148493          	addi	s1,s1,1
    8000587c:	00001097          	auipc	ra,0x1
    80005880:	a9c080e7          	jalr	-1380(ra) # 80006318 <uartputc>
    80005884:	03298063          	beq	s3,s2,800058a4 <consolewrite+0x74>
    80005888:	00048613          	mv	a2,s1
    8000588c:	00100693          	li	a3,1
    80005890:	000a0593          	mv	a1,s4
    80005894:	fbf40513          	addi	a0,s0,-65
    80005898:	00000097          	auipc	ra,0x0
    8000589c:	9d8080e7          	jalr	-1576(ra) # 80005270 <either_copyin>
    800058a0:	fd5518e3          	bne	a0,s5,80005870 <consolewrite+0x40>
    800058a4:	04813083          	ld	ra,72(sp)
    800058a8:	04013403          	ld	s0,64(sp)
    800058ac:	03813483          	ld	s1,56(sp)
    800058b0:	02813983          	ld	s3,40(sp)
    800058b4:	02013a03          	ld	s4,32(sp)
    800058b8:	01813a83          	ld	s5,24(sp)
    800058bc:	00090513          	mv	a0,s2
    800058c0:	03013903          	ld	s2,48(sp)
    800058c4:	05010113          	addi	sp,sp,80
    800058c8:	00008067          	ret
    800058cc:	00000913          	li	s2,0
    800058d0:	fd5ff06f          	j	800058a4 <consolewrite+0x74>

00000000800058d4 <consoleread>:
    800058d4:	f9010113          	addi	sp,sp,-112
    800058d8:	06813023          	sd	s0,96(sp)
    800058dc:	04913c23          	sd	s1,88(sp)
    800058e0:	05213823          	sd	s2,80(sp)
    800058e4:	05313423          	sd	s3,72(sp)
    800058e8:	05413023          	sd	s4,64(sp)
    800058ec:	03513c23          	sd	s5,56(sp)
    800058f0:	03613823          	sd	s6,48(sp)
    800058f4:	03713423          	sd	s7,40(sp)
    800058f8:	03813023          	sd	s8,32(sp)
    800058fc:	06113423          	sd	ra,104(sp)
    80005900:	01913c23          	sd	s9,24(sp)
    80005904:	07010413          	addi	s0,sp,112
    80005908:	00060b93          	mv	s7,a2
    8000590c:	00050913          	mv	s2,a0
    80005910:	00058c13          	mv	s8,a1
    80005914:	00060b1b          	sext.w	s6,a2
    80005918:	00005497          	auipc	s1,0x5
    8000591c:	73048493          	addi	s1,s1,1840 # 8000b048 <cons>
    80005920:	00400993          	li	s3,4
    80005924:	fff00a13          	li	s4,-1
    80005928:	00a00a93          	li	s5,10
    8000592c:	05705e63          	blez	s7,80005988 <consoleread+0xb4>
    80005930:	09c4a703          	lw	a4,156(s1)
    80005934:	0984a783          	lw	a5,152(s1)
    80005938:	0007071b          	sext.w	a4,a4
    8000593c:	08e78463          	beq	a5,a4,800059c4 <consoleread+0xf0>
    80005940:	07f7f713          	andi	a4,a5,127
    80005944:	00e48733          	add	a4,s1,a4
    80005948:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000594c:	0017869b          	addiw	a3,a5,1
    80005950:	08d4ac23          	sw	a3,152(s1)
    80005954:	00070c9b          	sext.w	s9,a4
    80005958:	0b370663          	beq	a4,s3,80005a04 <consoleread+0x130>
    8000595c:	00100693          	li	a3,1
    80005960:	f9f40613          	addi	a2,s0,-97
    80005964:	000c0593          	mv	a1,s8
    80005968:	00090513          	mv	a0,s2
    8000596c:	f8e40fa3          	sb	a4,-97(s0)
    80005970:	00000097          	auipc	ra,0x0
    80005974:	8b4080e7          	jalr	-1868(ra) # 80005224 <either_copyout>
    80005978:	01450863          	beq	a0,s4,80005988 <consoleread+0xb4>
    8000597c:	001c0c13          	addi	s8,s8,1
    80005980:	fffb8b9b          	addiw	s7,s7,-1
    80005984:	fb5c94e3          	bne	s9,s5,8000592c <consoleread+0x58>
    80005988:	000b851b          	sext.w	a0,s7
    8000598c:	06813083          	ld	ra,104(sp)
    80005990:	06013403          	ld	s0,96(sp)
    80005994:	05813483          	ld	s1,88(sp)
    80005998:	05013903          	ld	s2,80(sp)
    8000599c:	04813983          	ld	s3,72(sp)
    800059a0:	04013a03          	ld	s4,64(sp)
    800059a4:	03813a83          	ld	s5,56(sp)
    800059a8:	02813b83          	ld	s7,40(sp)
    800059ac:	02013c03          	ld	s8,32(sp)
    800059b0:	01813c83          	ld	s9,24(sp)
    800059b4:	40ab053b          	subw	a0,s6,a0
    800059b8:	03013b03          	ld	s6,48(sp)
    800059bc:	07010113          	addi	sp,sp,112
    800059c0:	00008067          	ret
    800059c4:	00001097          	auipc	ra,0x1
    800059c8:	1d8080e7          	jalr	472(ra) # 80006b9c <push_on>
    800059cc:	0984a703          	lw	a4,152(s1)
    800059d0:	09c4a783          	lw	a5,156(s1)
    800059d4:	0007879b          	sext.w	a5,a5
    800059d8:	fef70ce3          	beq	a4,a5,800059d0 <consoleread+0xfc>
    800059dc:	00001097          	auipc	ra,0x1
    800059e0:	234080e7          	jalr	564(ra) # 80006c10 <pop_on>
    800059e4:	0984a783          	lw	a5,152(s1)
    800059e8:	07f7f713          	andi	a4,a5,127
    800059ec:	00e48733          	add	a4,s1,a4
    800059f0:	01874703          	lbu	a4,24(a4)
    800059f4:	0017869b          	addiw	a3,a5,1
    800059f8:	08d4ac23          	sw	a3,152(s1)
    800059fc:	00070c9b          	sext.w	s9,a4
    80005a00:	f5371ee3          	bne	a4,s3,8000595c <consoleread+0x88>
    80005a04:	000b851b          	sext.w	a0,s7
    80005a08:	f96bf2e3          	bgeu	s7,s6,8000598c <consoleread+0xb8>
    80005a0c:	08f4ac23          	sw	a5,152(s1)
    80005a10:	f7dff06f          	j	8000598c <consoleread+0xb8>

0000000080005a14 <consputc>:
    80005a14:	10000793          	li	a5,256
    80005a18:	00f50663          	beq	a0,a5,80005a24 <consputc+0x10>
    80005a1c:	00001317          	auipc	t1,0x1
    80005a20:	9f430067          	jr	-1548(t1) # 80006410 <uartputc_sync>
    80005a24:	ff010113          	addi	sp,sp,-16
    80005a28:	00113423          	sd	ra,8(sp)
    80005a2c:	00813023          	sd	s0,0(sp)
    80005a30:	01010413          	addi	s0,sp,16
    80005a34:	00800513          	li	a0,8
    80005a38:	00001097          	auipc	ra,0x1
    80005a3c:	9d8080e7          	jalr	-1576(ra) # 80006410 <uartputc_sync>
    80005a40:	02000513          	li	a0,32
    80005a44:	00001097          	auipc	ra,0x1
    80005a48:	9cc080e7          	jalr	-1588(ra) # 80006410 <uartputc_sync>
    80005a4c:	00013403          	ld	s0,0(sp)
    80005a50:	00813083          	ld	ra,8(sp)
    80005a54:	00800513          	li	a0,8
    80005a58:	01010113          	addi	sp,sp,16
    80005a5c:	00001317          	auipc	t1,0x1
    80005a60:	9b430067          	jr	-1612(t1) # 80006410 <uartputc_sync>

0000000080005a64 <consoleintr>:
    80005a64:	fe010113          	addi	sp,sp,-32
    80005a68:	00813823          	sd	s0,16(sp)
    80005a6c:	00913423          	sd	s1,8(sp)
    80005a70:	01213023          	sd	s2,0(sp)
    80005a74:	00113c23          	sd	ra,24(sp)
    80005a78:	02010413          	addi	s0,sp,32
    80005a7c:	00005917          	auipc	s2,0x5
    80005a80:	5cc90913          	addi	s2,s2,1484 # 8000b048 <cons>
    80005a84:	00050493          	mv	s1,a0
    80005a88:	00090513          	mv	a0,s2
    80005a8c:	00001097          	auipc	ra,0x1
    80005a90:	e40080e7          	jalr	-448(ra) # 800068cc <acquire>
    80005a94:	02048c63          	beqz	s1,80005acc <consoleintr+0x68>
    80005a98:	0a092783          	lw	a5,160(s2)
    80005a9c:	09892703          	lw	a4,152(s2)
    80005aa0:	07f00693          	li	a3,127
    80005aa4:	40e7873b          	subw	a4,a5,a4
    80005aa8:	02e6e263          	bltu	a3,a4,80005acc <consoleintr+0x68>
    80005aac:	00d00713          	li	a4,13
    80005ab0:	04e48063          	beq	s1,a4,80005af0 <consoleintr+0x8c>
    80005ab4:	07f7f713          	andi	a4,a5,127
    80005ab8:	00e90733          	add	a4,s2,a4
    80005abc:	0017879b          	addiw	a5,a5,1
    80005ac0:	0af92023          	sw	a5,160(s2)
    80005ac4:	00970c23          	sb	s1,24(a4)
    80005ac8:	08f92e23          	sw	a5,156(s2)
    80005acc:	01013403          	ld	s0,16(sp)
    80005ad0:	01813083          	ld	ra,24(sp)
    80005ad4:	00813483          	ld	s1,8(sp)
    80005ad8:	00013903          	ld	s2,0(sp)
    80005adc:	00005517          	auipc	a0,0x5
    80005ae0:	56c50513          	addi	a0,a0,1388 # 8000b048 <cons>
    80005ae4:	02010113          	addi	sp,sp,32
    80005ae8:	00001317          	auipc	t1,0x1
    80005aec:	eb030067          	jr	-336(t1) # 80006998 <release>
    80005af0:	00a00493          	li	s1,10
    80005af4:	fc1ff06f          	j	80005ab4 <consoleintr+0x50>

0000000080005af8 <consoleinit>:
    80005af8:	fe010113          	addi	sp,sp,-32
    80005afc:	00113c23          	sd	ra,24(sp)
    80005b00:	00813823          	sd	s0,16(sp)
    80005b04:	00913423          	sd	s1,8(sp)
    80005b08:	02010413          	addi	s0,sp,32
    80005b0c:	00005497          	auipc	s1,0x5
    80005b10:	53c48493          	addi	s1,s1,1340 # 8000b048 <cons>
    80005b14:	00048513          	mv	a0,s1
    80005b18:	00003597          	auipc	a1,0x3
    80005b1c:	b2058593          	addi	a1,a1,-1248 # 80008638 <_ZTV14PeriodicThread+0x178>
    80005b20:	00001097          	auipc	ra,0x1
    80005b24:	d88080e7          	jalr	-632(ra) # 800068a8 <initlock>
    80005b28:	00000097          	auipc	ra,0x0
    80005b2c:	7ac080e7          	jalr	1964(ra) # 800062d4 <uartinit>
    80005b30:	01813083          	ld	ra,24(sp)
    80005b34:	01013403          	ld	s0,16(sp)
    80005b38:	00000797          	auipc	a5,0x0
    80005b3c:	d9c78793          	addi	a5,a5,-612 # 800058d4 <consoleread>
    80005b40:	0af4bc23          	sd	a5,184(s1)
    80005b44:	00000797          	auipc	a5,0x0
    80005b48:	cec78793          	addi	a5,a5,-788 # 80005830 <consolewrite>
    80005b4c:	0cf4b023          	sd	a5,192(s1)
    80005b50:	00813483          	ld	s1,8(sp)
    80005b54:	02010113          	addi	sp,sp,32
    80005b58:	00008067          	ret

0000000080005b5c <console_read>:
    80005b5c:	ff010113          	addi	sp,sp,-16
    80005b60:	00813423          	sd	s0,8(sp)
    80005b64:	01010413          	addi	s0,sp,16
    80005b68:	00813403          	ld	s0,8(sp)
    80005b6c:	00005317          	auipc	t1,0x5
    80005b70:	59433303          	ld	t1,1428(t1) # 8000b100 <devsw+0x10>
    80005b74:	01010113          	addi	sp,sp,16
    80005b78:	00030067          	jr	t1

0000000080005b7c <console_write>:
    80005b7c:	ff010113          	addi	sp,sp,-16
    80005b80:	00813423          	sd	s0,8(sp)
    80005b84:	01010413          	addi	s0,sp,16
    80005b88:	00813403          	ld	s0,8(sp)
    80005b8c:	00005317          	auipc	t1,0x5
    80005b90:	57c33303          	ld	t1,1404(t1) # 8000b108 <devsw+0x18>
    80005b94:	01010113          	addi	sp,sp,16
    80005b98:	00030067          	jr	t1

0000000080005b9c <panic>:
    80005b9c:	fe010113          	addi	sp,sp,-32
    80005ba0:	00113c23          	sd	ra,24(sp)
    80005ba4:	00813823          	sd	s0,16(sp)
    80005ba8:	00913423          	sd	s1,8(sp)
    80005bac:	02010413          	addi	s0,sp,32
    80005bb0:	00050493          	mv	s1,a0
    80005bb4:	00003517          	auipc	a0,0x3
    80005bb8:	a8c50513          	addi	a0,a0,-1396 # 80008640 <_ZTV14PeriodicThread+0x180>
    80005bbc:	00005797          	auipc	a5,0x5
    80005bc0:	5e07a623          	sw	zero,1516(a5) # 8000b1a8 <pr+0x18>
    80005bc4:	00000097          	auipc	ra,0x0
    80005bc8:	034080e7          	jalr	52(ra) # 80005bf8 <__printf>
    80005bcc:	00048513          	mv	a0,s1
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	028080e7          	jalr	40(ra) # 80005bf8 <__printf>
    80005bd8:	00002517          	auipc	a0,0x2
    80005bdc:	67850513          	addi	a0,a0,1656 # 80008250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    80005be0:	00000097          	auipc	ra,0x0
    80005be4:	018080e7          	jalr	24(ra) # 80005bf8 <__printf>
    80005be8:	00100793          	li	a5,1
    80005bec:	00004717          	auipc	a4,0x4
    80005bf0:	32f72a23          	sw	a5,820(a4) # 80009f20 <panicked>
    80005bf4:	0000006f          	j	80005bf4 <panic+0x58>

0000000080005bf8 <__printf>:
    80005bf8:	f3010113          	addi	sp,sp,-208
    80005bfc:	08813023          	sd	s0,128(sp)
    80005c00:	07313423          	sd	s3,104(sp)
    80005c04:	09010413          	addi	s0,sp,144
    80005c08:	05813023          	sd	s8,64(sp)
    80005c0c:	08113423          	sd	ra,136(sp)
    80005c10:	06913c23          	sd	s1,120(sp)
    80005c14:	07213823          	sd	s2,112(sp)
    80005c18:	07413023          	sd	s4,96(sp)
    80005c1c:	05513c23          	sd	s5,88(sp)
    80005c20:	05613823          	sd	s6,80(sp)
    80005c24:	05713423          	sd	s7,72(sp)
    80005c28:	03913c23          	sd	s9,56(sp)
    80005c2c:	03a13823          	sd	s10,48(sp)
    80005c30:	03b13423          	sd	s11,40(sp)
    80005c34:	00005317          	auipc	t1,0x5
    80005c38:	55c30313          	addi	t1,t1,1372 # 8000b190 <pr>
    80005c3c:	01832c03          	lw	s8,24(t1)
    80005c40:	00b43423          	sd	a1,8(s0)
    80005c44:	00c43823          	sd	a2,16(s0)
    80005c48:	00d43c23          	sd	a3,24(s0)
    80005c4c:	02e43023          	sd	a4,32(s0)
    80005c50:	02f43423          	sd	a5,40(s0)
    80005c54:	03043823          	sd	a6,48(s0)
    80005c58:	03143c23          	sd	a7,56(s0)
    80005c5c:	00050993          	mv	s3,a0
    80005c60:	4a0c1663          	bnez	s8,8000610c <__printf+0x514>
    80005c64:	60098c63          	beqz	s3,8000627c <__printf+0x684>
    80005c68:	0009c503          	lbu	a0,0(s3)
    80005c6c:	00840793          	addi	a5,s0,8
    80005c70:	f6f43c23          	sd	a5,-136(s0)
    80005c74:	00000493          	li	s1,0
    80005c78:	22050063          	beqz	a0,80005e98 <__printf+0x2a0>
    80005c7c:	00002a37          	lui	s4,0x2
    80005c80:	00018ab7          	lui	s5,0x18
    80005c84:	000f4b37          	lui	s6,0xf4
    80005c88:	00989bb7          	lui	s7,0x989
    80005c8c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005c90:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005c94:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005c98:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005c9c:	00148c9b          	addiw	s9,s1,1
    80005ca0:	02500793          	li	a5,37
    80005ca4:	01998933          	add	s2,s3,s9
    80005ca8:	38f51263          	bne	a0,a5,8000602c <__printf+0x434>
    80005cac:	00094783          	lbu	a5,0(s2)
    80005cb0:	00078c9b          	sext.w	s9,a5
    80005cb4:	1e078263          	beqz	a5,80005e98 <__printf+0x2a0>
    80005cb8:	0024849b          	addiw	s1,s1,2
    80005cbc:	07000713          	li	a4,112
    80005cc0:	00998933          	add	s2,s3,s1
    80005cc4:	38e78a63          	beq	a5,a4,80006058 <__printf+0x460>
    80005cc8:	20f76863          	bltu	a4,a5,80005ed8 <__printf+0x2e0>
    80005ccc:	42a78863          	beq	a5,a0,800060fc <__printf+0x504>
    80005cd0:	06400713          	li	a4,100
    80005cd4:	40e79663          	bne	a5,a4,800060e0 <__printf+0x4e8>
    80005cd8:	f7843783          	ld	a5,-136(s0)
    80005cdc:	0007a603          	lw	a2,0(a5)
    80005ce0:	00878793          	addi	a5,a5,8
    80005ce4:	f6f43c23          	sd	a5,-136(s0)
    80005ce8:	42064a63          	bltz	a2,8000611c <__printf+0x524>
    80005cec:	00a00713          	li	a4,10
    80005cf0:	02e677bb          	remuw	a5,a2,a4
    80005cf4:	00003d97          	auipc	s11,0x3
    80005cf8:	974d8d93          	addi	s11,s11,-1676 # 80008668 <digits>
    80005cfc:	00900593          	li	a1,9
    80005d00:	0006051b          	sext.w	a0,a2
    80005d04:	00000c93          	li	s9,0
    80005d08:	02079793          	slli	a5,a5,0x20
    80005d0c:	0207d793          	srli	a5,a5,0x20
    80005d10:	00fd87b3          	add	a5,s11,a5
    80005d14:	0007c783          	lbu	a5,0(a5)
    80005d18:	02e656bb          	divuw	a3,a2,a4
    80005d1c:	f8f40023          	sb	a5,-128(s0)
    80005d20:	14c5d863          	bge	a1,a2,80005e70 <__printf+0x278>
    80005d24:	06300593          	li	a1,99
    80005d28:	00100c93          	li	s9,1
    80005d2c:	02e6f7bb          	remuw	a5,a3,a4
    80005d30:	02079793          	slli	a5,a5,0x20
    80005d34:	0207d793          	srli	a5,a5,0x20
    80005d38:	00fd87b3          	add	a5,s11,a5
    80005d3c:	0007c783          	lbu	a5,0(a5)
    80005d40:	02e6d73b          	divuw	a4,a3,a4
    80005d44:	f8f400a3          	sb	a5,-127(s0)
    80005d48:	12a5f463          	bgeu	a1,a0,80005e70 <__printf+0x278>
    80005d4c:	00a00693          	li	a3,10
    80005d50:	00900593          	li	a1,9
    80005d54:	02d777bb          	remuw	a5,a4,a3
    80005d58:	02079793          	slli	a5,a5,0x20
    80005d5c:	0207d793          	srli	a5,a5,0x20
    80005d60:	00fd87b3          	add	a5,s11,a5
    80005d64:	0007c503          	lbu	a0,0(a5)
    80005d68:	02d757bb          	divuw	a5,a4,a3
    80005d6c:	f8a40123          	sb	a0,-126(s0)
    80005d70:	48e5f263          	bgeu	a1,a4,800061f4 <__printf+0x5fc>
    80005d74:	06300513          	li	a0,99
    80005d78:	02d7f5bb          	remuw	a1,a5,a3
    80005d7c:	02059593          	slli	a1,a1,0x20
    80005d80:	0205d593          	srli	a1,a1,0x20
    80005d84:	00bd85b3          	add	a1,s11,a1
    80005d88:	0005c583          	lbu	a1,0(a1)
    80005d8c:	02d7d7bb          	divuw	a5,a5,a3
    80005d90:	f8b401a3          	sb	a1,-125(s0)
    80005d94:	48e57263          	bgeu	a0,a4,80006218 <__printf+0x620>
    80005d98:	3e700513          	li	a0,999
    80005d9c:	02d7f5bb          	remuw	a1,a5,a3
    80005da0:	02059593          	slli	a1,a1,0x20
    80005da4:	0205d593          	srli	a1,a1,0x20
    80005da8:	00bd85b3          	add	a1,s11,a1
    80005dac:	0005c583          	lbu	a1,0(a1)
    80005db0:	02d7d7bb          	divuw	a5,a5,a3
    80005db4:	f8b40223          	sb	a1,-124(s0)
    80005db8:	46e57663          	bgeu	a0,a4,80006224 <__printf+0x62c>
    80005dbc:	02d7f5bb          	remuw	a1,a5,a3
    80005dc0:	02059593          	slli	a1,a1,0x20
    80005dc4:	0205d593          	srli	a1,a1,0x20
    80005dc8:	00bd85b3          	add	a1,s11,a1
    80005dcc:	0005c583          	lbu	a1,0(a1)
    80005dd0:	02d7d7bb          	divuw	a5,a5,a3
    80005dd4:	f8b402a3          	sb	a1,-123(s0)
    80005dd8:	46ea7863          	bgeu	s4,a4,80006248 <__printf+0x650>
    80005ddc:	02d7f5bb          	remuw	a1,a5,a3
    80005de0:	02059593          	slli	a1,a1,0x20
    80005de4:	0205d593          	srli	a1,a1,0x20
    80005de8:	00bd85b3          	add	a1,s11,a1
    80005dec:	0005c583          	lbu	a1,0(a1)
    80005df0:	02d7d7bb          	divuw	a5,a5,a3
    80005df4:	f8b40323          	sb	a1,-122(s0)
    80005df8:	3eeaf863          	bgeu	s5,a4,800061e8 <__printf+0x5f0>
    80005dfc:	02d7f5bb          	remuw	a1,a5,a3
    80005e00:	02059593          	slli	a1,a1,0x20
    80005e04:	0205d593          	srli	a1,a1,0x20
    80005e08:	00bd85b3          	add	a1,s11,a1
    80005e0c:	0005c583          	lbu	a1,0(a1)
    80005e10:	02d7d7bb          	divuw	a5,a5,a3
    80005e14:	f8b403a3          	sb	a1,-121(s0)
    80005e18:	42eb7e63          	bgeu	s6,a4,80006254 <__printf+0x65c>
    80005e1c:	02d7f5bb          	remuw	a1,a5,a3
    80005e20:	02059593          	slli	a1,a1,0x20
    80005e24:	0205d593          	srli	a1,a1,0x20
    80005e28:	00bd85b3          	add	a1,s11,a1
    80005e2c:	0005c583          	lbu	a1,0(a1)
    80005e30:	02d7d7bb          	divuw	a5,a5,a3
    80005e34:	f8b40423          	sb	a1,-120(s0)
    80005e38:	42ebfc63          	bgeu	s7,a4,80006270 <__printf+0x678>
    80005e3c:	02079793          	slli	a5,a5,0x20
    80005e40:	0207d793          	srli	a5,a5,0x20
    80005e44:	00fd8db3          	add	s11,s11,a5
    80005e48:	000dc703          	lbu	a4,0(s11)
    80005e4c:	00a00793          	li	a5,10
    80005e50:	00900c93          	li	s9,9
    80005e54:	f8e404a3          	sb	a4,-119(s0)
    80005e58:	00065c63          	bgez	a2,80005e70 <__printf+0x278>
    80005e5c:	f9040713          	addi	a4,s0,-112
    80005e60:	00f70733          	add	a4,a4,a5
    80005e64:	02d00693          	li	a3,45
    80005e68:	fed70823          	sb	a3,-16(a4)
    80005e6c:	00078c93          	mv	s9,a5
    80005e70:	f8040793          	addi	a5,s0,-128
    80005e74:	01978cb3          	add	s9,a5,s9
    80005e78:	f7f40d13          	addi	s10,s0,-129
    80005e7c:	000cc503          	lbu	a0,0(s9)
    80005e80:	fffc8c93          	addi	s9,s9,-1
    80005e84:	00000097          	auipc	ra,0x0
    80005e88:	b90080e7          	jalr	-1136(ra) # 80005a14 <consputc>
    80005e8c:	ffac98e3          	bne	s9,s10,80005e7c <__printf+0x284>
    80005e90:	00094503          	lbu	a0,0(s2)
    80005e94:	e00514e3          	bnez	a0,80005c9c <__printf+0xa4>
    80005e98:	1a0c1663          	bnez	s8,80006044 <__printf+0x44c>
    80005e9c:	08813083          	ld	ra,136(sp)
    80005ea0:	08013403          	ld	s0,128(sp)
    80005ea4:	07813483          	ld	s1,120(sp)
    80005ea8:	07013903          	ld	s2,112(sp)
    80005eac:	06813983          	ld	s3,104(sp)
    80005eb0:	06013a03          	ld	s4,96(sp)
    80005eb4:	05813a83          	ld	s5,88(sp)
    80005eb8:	05013b03          	ld	s6,80(sp)
    80005ebc:	04813b83          	ld	s7,72(sp)
    80005ec0:	04013c03          	ld	s8,64(sp)
    80005ec4:	03813c83          	ld	s9,56(sp)
    80005ec8:	03013d03          	ld	s10,48(sp)
    80005ecc:	02813d83          	ld	s11,40(sp)
    80005ed0:	0d010113          	addi	sp,sp,208
    80005ed4:	00008067          	ret
    80005ed8:	07300713          	li	a4,115
    80005edc:	1ce78a63          	beq	a5,a4,800060b0 <__printf+0x4b8>
    80005ee0:	07800713          	li	a4,120
    80005ee4:	1ee79e63          	bne	a5,a4,800060e0 <__printf+0x4e8>
    80005ee8:	f7843783          	ld	a5,-136(s0)
    80005eec:	0007a703          	lw	a4,0(a5)
    80005ef0:	00878793          	addi	a5,a5,8
    80005ef4:	f6f43c23          	sd	a5,-136(s0)
    80005ef8:	28074263          	bltz	a4,8000617c <__printf+0x584>
    80005efc:	00002d97          	auipc	s11,0x2
    80005f00:	76cd8d93          	addi	s11,s11,1900 # 80008668 <digits>
    80005f04:	00f77793          	andi	a5,a4,15
    80005f08:	00fd87b3          	add	a5,s11,a5
    80005f0c:	0007c683          	lbu	a3,0(a5)
    80005f10:	00f00613          	li	a2,15
    80005f14:	0007079b          	sext.w	a5,a4
    80005f18:	f8d40023          	sb	a3,-128(s0)
    80005f1c:	0047559b          	srliw	a1,a4,0x4
    80005f20:	0047569b          	srliw	a3,a4,0x4
    80005f24:	00000c93          	li	s9,0
    80005f28:	0ee65063          	bge	a2,a4,80006008 <__printf+0x410>
    80005f2c:	00f6f693          	andi	a3,a3,15
    80005f30:	00dd86b3          	add	a3,s11,a3
    80005f34:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005f38:	0087d79b          	srliw	a5,a5,0x8
    80005f3c:	00100c93          	li	s9,1
    80005f40:	f8d400a3          	sb	a3,-127(s0)
    80005f44:	0cb67263          	bgeu	a2,a1,80006008 <__printf+0x410>
    80005f48:	00f7f693          	andi	a3,a5,15
    80005f4c:	00dd86b3          	add	a3,s11,a3
    80005f50:	0006c583          	lbu	a1,0(a3)
    80005f54:	00f00613          	li	a2,15
    80005f58:	0047d69b          	srliw	a3,a5,0x4
    80005f5c:	f8b40123          	sb	a1,-126(s0)
    80005f60:	0047d593          	srli	a1,a5,0x4
    80005f64:	28f67e63          	bgeu	a2,a5,80006200 <__printf+0x608>
    80005f68:	00f6f693          	andi	a3,a3,15
    80005f6c:	00dd86b3          	add	a3,s11,a3
    80005f70:	0006c503          	lbu	a0,0(a3)
    80005f74:	0087d813          	srli	a6,a5,0x8
    80005f78:	0087d69b          	srliw	a3,a5,0x8
    80005f7c:	f8a401a3          	sb	a0,-125(s0)
    80005f80:	28b67663          	bgeu	a2,a1,8000620c <__printf+0x614>
    80005f84:	00f6f693          	andi	a3,a3,15
    80005f88:	00dd86b3          	add	a3,s11,a3
    80005f8c:	0006c583          	lbu	a1,0(a3)
    80005f90:	00c7d513          	srli	a0,a5,0xc
    80005f94:	00c7d69b          	srliw	a3,a5,0xc
    80005f98:	f8b40223          	sb	a1,-124(s0)
    80005f9c:	29067a63          	bgeu	a2,a6,80006230 <__printf+0x638>
    80005fa0:	00f6f693          	andi	a3,a3,15
    80005fa4:	00dd86b3          	add	a3,s11,a3
    80005fa8:	0006c583          	lbu	a1,0(a3)
    80005fac:	0107d813          	srli	a6,a5,0x10
    80005fb0:	0107d69b          	srliw	a3,a5,0x10
    80005fb4:	f8b402a3          	sb	a1,-123(s0)
    80005fb8:	28a67263          	bgeu	a2,a0,8000623c <__printf+0x644>
    80005fbc:	00f6f693          	andi	a3,a3,15
    80005fc0:	00dd86b3          	add	a3,s11,a3
    80005fc4:	0006c683          	lbu	a3,0(a3)
    80005fc8:	0147d79b          	srliw	a5,a5,0x14
    80005fcc:	f8d40323          	sb	a3,-122(s0)
    80005fd0:	21067663          	bgeu	a2,a6,800061dc <__printf+0x5e4>
    80005fd4:	02079793          	slli	a5,a5,0x20
    80005fd8:	0207d793          	srli	a5,a5,0x20
    80005fdc:	00fd8db3          	add	s11,s11,a5
    80005fe0:	000dc683          	lbu	a3,0(s11)
    80005fe4:	00800793          	li	a5,8
    80005fe8:	00700c93          	li	s9,7
    80005fec:	f8d403a3          	sb	a3,-121(s0)
    80005ff0:	00075c63          	bgez	a4,80006008 <__printf+0x410>
    80005ff4:	f9040713          	addi	a4,s0,-112
    80005ff8:	00f70733          	add	a4,a4,a5
    80005ffc:	02d00693          	li	a3,45
    80006000:	fed70823          	sb	a3,-16(a4)
    80006004:	00078c93          	mv	s9,a5
    80006008:	f8040793          	addi	a5,s0,-128
    8000600c:	01978cb3          	add	s9,a5,s9
    80006010:	f7f40d13          	addi	s10,s0,-129
    80006014:	000cc503          	lbu	a0,0(s9)
    80006018:	fffc8c93          	addi	s9,s9,-1
    8000601c:	00000097          	auipc	ra,0x0
    80006020:	9f8080e7          	jalr	-1544(ra) # 80005a14 <consputc>
    80006024:	ff9d18e3          	bne	s10,s9,80006014 <__printf+0x41c>
    80006028:	0100006f          	j	80006038 <__printf+0x440>
    8000602c:	00000097          	auipc	ra,0x0
    80006030:	9e8080e7          	jalr	-1560(ra) # 80005a14 <consputc>
    80006034:	000c8493          	mv	s1,s9
    80006038:	00094503          	lbu	a0,0(s2)
    8000603c:	c60510e3          	bnez	a0,80005c9c <__printf+0xa4>
    80006040:	e40c0ee3          	beqz	s8,80005e9c <__printf+0x2a4>
    80006044:	00005517          	auipc	a0,0x5
    80006048:	14c50513          	addi	a0,a0,332 # 8000b190 <pr>
    8000604c:	00001097          	auipc	ra,0x1
    80006050:	94c080e7          	jalr	-1716(ra) # 80006998 <release>
    80006054:	e49ff06f          	j	80005e9c <__printf+0x2a4>
    80006058:	f7843783          	ld	a5,-136(s0)
    8000605c:	03000513          	li	a0,48
    80006060:	01000d13          	li	s10,16
    80006064:	00878713          	addi	a4,a5,8
    80006068:	0007bc83          	ld	s9,0(a5)
    8000606c:	f6e43c23          	sd	a4,-136(s0)
    80006070:	00000097          	auipc	ra,0x0
    80006074:	9a4080e7          	jalr	-1628(ra) # 80005a14 <consputc>
    80006078:	07800513          	li	a0,120
    8000607c:	00000097          	auipc	ra,0x0
    80006080:	998080e7          	jalr	-1640(ra) # 80005a14 <consputc>
    80006084:	00002d97          	auipc	s11,0x2
    80006088:	5e4d8d93          	addi	s11,s11,1508 # 80008668 <digits>
    8000608c:	03ccd793          	srli	a5,s9,0x3c
    80006090:	00fd87b3          	add	a5,s11,a5
    80006094:	0007c503          	lbu	a0,0(a5)
    80006098:	fffd0d1b          	addiw	s10,s10,-1
    8000609c:	004c9c93          	slli	s9,s9,0x4
    800060a0:	00000097          	auipc	ra,0x0
    800060a4:	974080e7          	jalr	-1676(ra) # 80005a14 <consputc>
    800060a8:	fe0d12e3          	bnez	s10,8000608c <__printf+0x494>
    800060ac:	f8dff06f          	j	80006038 <__printf+0x440>
    800060b0:	f7843783          	ld	a5,-136(s0)
    800060b4:	0007bc83          	ld	s9,0(a5)
    800060b8:	00878793          	addi	a5,a5,8
    800060bc:	f6f43c23          	sd	a5,-136(s0)
    800060c0:	000c9a63          	bnez	s9,800060d4 <__printf+0x4dc>
    800060c4:	1080006f          	j	800061cc <__printf+0x5d4>
    800060c8:	001c8c93          	addi	s9,s9,1
    800060cc:	00000097          	auipc	ra,0x0
    800060d0:	948080e7          	jalr	-1720(ra) # 80005a14 <consputc>
    800060d4:	000cc503          	lbu	a0,0(s9)
    800060d8:	fe0518e3          	bnez	a0,800060c8 <__printf+0x4d0>
    800060dc:	f5dff06f          	j	80006038 <__printf+0x440>
    800060e0:	02500513          	li	a0,37
    800060e4:	00000097          	auipc	ra,0x0
    800060e8:	930080e7          	jalr	-1744(ra) # 80005a14 <consputc>
    800060ec:	000c8513          	mv	a0,s9
    800060f0:	00000097          	auipc	ra,0x0
    800060f4:	924080e7          	jalr	-1756(ra) # 80005a14 <consputc>
    800060f8:	f41ff06f          	j	80006038 <__printf+0x440>
    800060fc:	02500513          	li	a0,37
    80006100:	00000097          	auipc	ra,0x0
    80006104:	914080e7          	jalr	-1772(ra) # 80005a14 <consputc>
    80006108:	f31ff06f          	j	80006038 <__printf+0x440>
    8000610c:	00030513          	mv	a0,t1
    80006110:	00000097          	auipc	ra,0x0
    80006114:	7bc080e7          	jalr	1980(ra) # 800068cc <acquire>
    80006118:	b4dff06f          	j	80005c64 <__printf+0x6c>
    8000611c:	40c0053b          	negw	a0,a2
    80006120:	00a00713          	li	a4,10
    80006124:	02e576bb          	remuw	a3,a0,a4
    80006128:	00002d97          	auipc	s11,0x2
    8000612c:	540d8d93          	addi	s11,s11,1344 # 80008668 <digits>
    80006130:	ff700593          	li	a1,-9
    80006134:	02069693          	slli	a3,a3,0x20
    80006138:	0206d693          	srli	a3,a3,0x20
    8000613c:	00dd86b3          	add	a3,s11,a3
    80006140:	0006c683          	lbu	a3,0(a3)
    80006144:	02e557bb          	divuw	a5,a0,a4
    80006148:	f8d40023          	sb	a3,-128(s0)
    8000614c:	10b65e63          	bge	a2,a1,80006268 <__printf+0x670>
    80006150:	06300593          	li	a1,99
    80006154:	02e7f6bb          	remuw	a3,a5,a4
    80006158:	02069693          	slli	a3,a3,0x20
    8000615c:	0206d693          	srli	a3,a3,0x20
    80006160:	00dd86b3          	add	a3,s11,a3
    80006164:	0006c683          	lbu	a3,0(a3)
    80006168:	02e7d73b          	divuw	a4,a5,a4
    8000616c:	00200793          	li	a5,2
    80006170:	f8d400a3          	sb	a3,-127(s0)
    80006174:	bca5ece3          	bltu	a1,a0,80005d4c <__printf+0x154>
    80006178:	ce5ff06f          	j	80005e5c <__printf+0x264>
    8000617c:	40e007bb          	negw	a5,a4
    80006180:	00002d97          	auipc	s11,0x2
    80006184:	4e8d8d93          	addi	s11,s11,1256 # 80008668 <digits>
    80006188:	00f7f693          	andi	a3,a5,15
    8000618c:	00dd86b3          	add	a3,s11,a3
    80006190:	0006c583          	lbu	a1,0(a3)
    80006194:	ff100613          	li	a2,-15
    80006198:	0047d69b          	srliw	a3,a5,0x4
    8000619c:	f8b40023          	sb	a1,-128(s0)
    800061a0:	0047d59b          	srliw	a1,a5,0x4
    800061a4:	0ac75e63          	bge	a4,a2,80006260 <__printf+0x668>
    800061a8:	00f6f693          	andi	a3,a3,15
    800061ac:	00dd86b3          	add	a3,s11,a3
    800061b0:	0006c603          	lbu	a2,0(a3)
    800061b4:	00f00693          	li	a3,15
    800061b8:	0087d79b          	srliw	a5,a5,0x8
    800061bc:	f8c400a3          	sb	a2,-127(s0)
    800061c0:	d8b6e4e3          	bltu	a3,a1,80005f48 <__printf+0x350>
    800061c4:	00200793          	li	a5,2
    800061c8:	e2dff06f          	j	80005ff4 <__printf+0x3fc>
    800061cc:	00002c97          	auipc	s9,0x2
    800061d0:	47cc8c93          	addi	s9,s9,1148 # 80008648 <_ZTV14PeriodicThread+0x188>
    800061d4:	02800513          	li	a0,40
    800061d8:	ef1ff06f          	j	800060c8 <__printf+0x4d0>
    800061dc:	00700793          	li	a5,7
    800061e0:	00600c93          	li	s9,6
    800061e4:	e0dff06f          	j	80005ff0 <__printf+0x3f8>
    800061e8:	00700793          	li	a5,7
    800061ec:	00600c93          	li	s9,6
    800061f0:	c69ff06f          	j	80005e58 <__printf+0x260>
    800061f4:	00300793          	li	a5,3
    800061f8:	00200c93          	li	s9,2
    800061fc:	c5dff06f          	j	80005e58 <__printf+0x260>
    80006200:	00300793          	li	a5,3
    80006204:	00200c93          	li	s9,2
    80006208:	de9ff06f          	j	80005ff0 <__printf+0x3f8>
    8000620c:	00400793          	li	a5,4
    80006210:	00300c93          	li	s9,3
    80006214:	dddff06f          	j	80005ff0 <__printf+0x3f8>
    80006218:	00400793          	li	a5,4
    8000621c:	00300c93          	li	s9,3
    80006220:	c39ff06f          	j	80005e58 <__printf+0x260>
    80006224:	00500793          	li	a5,5
    80006228:	00400c93          	li	s9,4
    8000622c:	c2dff06f          	j	80005e58 <__printf+0x260>
    80006230:	00500793          	li	a5,5
    80006234:	00400c93          	li	s9,4
    80006238:	db9ff06f          	j	80005ff0 <__printf+0x3f8>
    8000623c:	00600793          	li	a5,6
    80006240:	00500c93          	li	s9,5
    80006244:	dadff06f          	j	80005ff0 <__printf+0x3f8>
    80006248:	00600793          	li	a5,6
    8000624c:	00500c93          	li	s9,5
    80006250:	c09ff06f          	j	80005e58 <__printf+0x260>
    80006254:	00800793          	li	a5,8
    80006258:	00700c93          	li	s9,7
    8000625c:	bfdff06f          	j	80005e58 <__printf+0x260>
    80006260:	00100793          	li	a5,1
    80006264:	d91ff06f          	j	80005ff4 <__printf+0x3fc>
    80006268:	00100793          	li	a5,1
    8000626c:	bf1ff06f          	j	80005e5c <__printf+0x264>
    80006270:	00900793          	li	a5,9
    80006274:	00800c93          	li	s9,8
    80006278:	be1ff06f          	j	80005e58 <__printf+0x260>
    8000627c:	00002517          	auipc	a0,0x2
    80006280:	3d450513          	addi	a0,a0,980 # 80008650 <_ZTV14PeriodicThread+0x190>
    80006284:	00000097          	auipc	ra,0x0
    80006288:	918080e7          	jalr	-1768(ra) # 80005b9c <panic>

000000008000628c <printfinit>:
    8000628c:	fe010113          	addi	sp,sp,-32
    80006290:	00813823          	sd	s0,16(sp)
    80006294:	00913423          	sd	s1,8(sp)
    80006298:	00113c23          	sd	ra,24(sp)
    8000629c:	02010413          	addi	s0,sp,32
    800062a0:	00005497          	auipc	s1,0x5
    800062a4:	ef048493          	addi	s1,s1,-272 # 8000b190 <pr>
    800062a8:	00048513          	mv	a0,s1
    800062ac:	00002597          	auipc	a1,0x2
    800062b0:	3b458593          	addi	a1,a1,948 # 80008660 <_ZTV14PeriodicThread+0x1a0>
    800062b4:	00000097          	auipc	ra,0x0
    800062b8:	5f4080e7          	jalr	1524(ra) # 800068a8 <initlock>
    800062bc:	01813083          	ld	ra,24(sp)
    800062c0:	01013403          	ld	s0,16(sp)
    800062c4:	0004ac23          	sw	zero,24(s1)
    800062c8:	00813483          	ld	s1,8(sp)
    800062cc:	02010113          	addi	sp,sp,32
    800062d0:	00008067          	ret

00000000800062d4 <uartinit>:
    800062d4:	ff010113          	addi	sp,sp,-16
    800062d8:	00813423          	sd	s0,8(sp)
    800062dc:	01010413          	addi	s0,sp,16
    800062e0:	100007b7          	lui	a5,0x10000
    800062e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800062e8:	f8000713          	li	a4,-128
    800062ec:	00e781a3          	sb	a4,3(a5)
    800062f0:	00300713          	li	a4,3
    800062f4:	00e78023          	sb	a4,0(a5)
    800062f8:	000780a3          	sb	zero,1(a5)
    800062fc:	00e781a3          	sb	a4,3(a5)
    80006300:	00700693          	li	a3,7
    80006304:	00d78123          	sb	a3,2(a5)
    80006308:	00e780a3          	sb	a4,1(a5)
    8000630c:	00813403          	ld	s0,8(sp)
    80006310:	01010113          	addi	sp,sp,16
    80006314:	00008067          	ret

0000000080006318 <uartputc>:
    80006318:	00004797          	auipc	a5,0x4
    8000631c:	c087a783          	lw	a5,-1016(a5) # 80009f20 <panicked>
    80006320:	00078463          	beqz	a5,80006328 <uartputc+0x10>
    80006324:	0000006f          	j	80006324 <uartputc+0xc>
    80006328:	fd010113          	addi	sp,sp,-48
    8000632c:	02813023          	sd	s0,32(sp)
    80006330:	00913c23          	sd	s1,24(sp)
    80006334:	01213823          	sd	s2,16(sp)
    80006338:	01313423          	sd	s3,8(sp)
    8000633c:	02113423          	sd	ra,40(sp)
    80006340:	03010413          	addi	s0,sp,48
    80006344:	00004917          	auipc	s2,0x4
    80006348:	be490913          	addi	s2,s2,-1052 # 80009f28 <uart_tx_r>
    8000634c:	00093783          	ld	a5,0(s2)
    80006350:	00004497          	auipc	s1,0x4
    80006354:	be048493          	addi	s1,s1,-1056 # 80009f30 <uart_tx_w>
    80006358:	0004b703          	ld	a4,0(s1)
    8000635c:	02078693          	addi	a3,a5,32
    80006360:	00050993          	mv	s3,a0
    80006364:	02e69c63          	bne	a3,a4,8000639c <uartputc+0x84>
    80006368:	00001097          	auipc	ra,0x1
    8000636c:	834080e7          	jalr	-1996(ra) # 80006b9c <push_on>
    80006370:	00093783          	ld	a5,0(s2)
    80006374:	0004b703          	ld	a4,0(s1)
    80006378:	02078793          	addi	a5,a5,32
    8000637c:	00e79463          	bne	a5,a4,80006384 <uartputc+0x6c>
    80006380:	0000006f          	j	80006380 <uartputc+0x68>
    80006384:	00001097          	auipc	ra,0x1
    80006388:	88c080e7          	jalr	-1908(ra) # 80006c10 <pop_on>
    8000638c:	00093783          	ld	a5,0(s2)
    80006390:	0004b703          	ld	a4,0(s1)
    80006394:	02078693          	addi	a3,a5,32
    80006398:	fce688e3          	beq	a3,a4,80006368 <uartputc+0x50>
    8000639c:	01f77693          	andi	a3,a4,31
    800063a0:	00005597          	auipc	a1,0x5
    800063a4:	e1058593          	addi	a1,a1,-496 # 8000b1b0 <uart_tx_buf>
    800063a8:	00d586b3          	add	a3,a1,a3
    800063ac:	00170713          	addi	a4,a4,1
    800063b0:	01368023          	sb	s3,0(a3)
    800063b4:	00e4b023          	sd	a4,0(s1)
    800063b8:	10000637          	lui	a2,0x10000
    800063bc:	02f71063          	bne	a4,a5,800063dc <uartputc+0xc4>
    800063c0:	0340006f          	j	800063f4 <uartputc+0xdc>
    800063c4:	00074703          	lbu	a4,0(a4)
    800063c8:	00f93023          	sd	a5,0(s2)
    800063cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800063d0:	00093783          	ld	a5,0(s2)
    800063d4:	0004b703          	ld	a4,0(s1)
    800063d8:	00f70e63          	beq	a4,a5,800063f4 <uartputc+0xdc>
    800063dc:	00564683          	lbu	a3,5(a2)
    800063e0:	01f7f713          	andi	a4,a5,31
    800063e4:	00e58733          	add	a4,a1,a4
    800063e8:	0206f693          	andi	a3,a3,32
    800063ec:	00178793          	addi	a5,a5,1
    800063f0:	fc069ae3          	bnez	a3,800063c4 <uartputc+0xac>
    800063f4:	02813083          	ld	ra,40(sp)
    800063f8:	02013403          	ld	s0,32(sp)
    800063fc:	01813483          	ld	s1,24(sp)
    80006400:	01013903          	ld	s2,16(sp)
    80006404:	00813983          	ld	s3,8(sp)
    80006408:	03010113          	addi	sp,sp,48
    8000640c:	00008067          	ret

0000000080006410 <uartputc_sync>:
    80006410:	ff010113          	addi	sp,sp,-16
    80006414:	00813423          	sd	s0,8(sp)
    80006418:	01010413          	addi	s0,sp,16
    8000641c:	00004717          	auipc	a4,0x4
    80006420:	b0472703          	lw	a4,-1276(a4) # 80009f20 <panicked>
    80006424:	02071663          	bnez	a4,80006450 <uartputc_sync+0x40>
    80006428:	00050793          	mv	a5,a0
    8000642c:	100006b7          	lui	a3,0x10000
    80006430:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006434:	02077713          	andi	a4,a4,32
    80006438:	fe070ce3          	beqz	a4,80006430 <uartputc_sync+0x20>
    8000643c:	0ff7f793          	andi	a5,a5,255
    80006440:	00f68023          	sb	a5,0(a3)
    80006444:	00813403          	ld	s0,8(sp)
    80006448:	01010113          	addi	sp,sp,16
    8000644c:	00008067          	ret
    80006450:	0000006f          	j	80006450 <uartputc_sync+0x40>

0000000080006454 <uartstart>:
    80006454:	ff010113          	addi	sp,sp,-16
    80006458:	00813423          	sd	s0,8(sp)
    8000645c:	01010413          	addi	s0,sp,16
    80006460:	00004617          	auipc	a2,0x4
    80006464:	ac860613          	addi	a2,a2,-1336 # 80009f28 <uart_tx_r>
    80006468:	00004517          	auipc	a0,0x4
    8000646c:	ac850513          	addi	a0,a0,-1336 # 80009f30 <uart_tx_w>
    80006470:	00063783          	ld	a5,0(a2)
    80006474:	00053703          	ld	a4,0(a0)
    80006478:	04f70263          	beq	a4,a5,800064bc <uartstart+0x68>
    8000647c:	100005b7          	lui	a1,0x10000
    80006480:	00005817          	auipc	a6,0x5
    80006484:	d3080813          	addi	a6,a6,-720 # 8000b1b0 <uart_tx_buf>
    80006488:	01c0006f          	j	800064a4 <uartstart+0x50>
    8000648c:	0006c703          	lbu	a4,0(a3)
    80006490:	00f63023          	sd	a5,0(a2)
    80006494:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006498:	00063783          	ld	a5,0(a2)
    8000649c:	00053703          	ld	a4,0(a0)
    800064a0:	00f70e63          	beq	a4,a5,800064bc <uartstart+0x68>
    800064a4:	01f7f713          	andi	a4,a5,31
    800064a8:	00e806b3          	add	a3,a6,a4
    800064ac:	0055c703          	lbu	a4,5(a1)
    800064b0:	00178793          	addi	a5,a5,1
    800064b4:	02077713          	andi	a4,a4,32
    800064b8:	fc071ae3          	bnez	a4,8000648c <uartstart+0x38>
    800064bc:	00813403          	ld	s0,8(sp)
    800064c0:	01010113          	addi	sp,sp,16
    800064c4:	00008067          	ret

00000000800064c8 <uartgetc>:
    800064c8:	ff010113          	addi	sp,sp,-16
    800064cc:	00813423          	sd	s0,8(sp)
    800064d0:	01010413          	addi	s0,sp,16
    800064d4:	10000737          	lui	a4,0x10000
    800064d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800064dc:	0017f793          	andi	a5,a5,1
    800064e0:	00078c63          	beqz	a5,800064f8 <uartgetc+0x30>
    800064e4:	00074503          	lbu	a0,0(a4)
    800064e8:	0ff57513          	andi	a0,a0,255
    800064ec:	00813403          	ld	s0,8(sp)
    800064f0:	01010113          	addi	sp,sp,16
    800064f4:	00008067          	ret
    800064f8:	fff00513          	li	a0,-1
    800064fc:	ff1ff06f          	j	800064ec <uartgetc+0x24>

0000000080006500 <uartintr>:
    80006500:	100007b7          	lui	a5,0x10000
    80006504:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006508:	0017f793          	andi	a5,a5,1
    8000650c:	0a078463          	beqz	a5,800065b4 <uartintr+0xb4>
    80006510:	fe010113          	addi	sp,sp,-32
    80006514:	00813823          	sd	s0,16(sp)
    80006518:	00913423          	sd	s1,8(sp)
    8000651c:	00113c23          	sd	ra,24(sp)
    80006520:	02010413          	addi	s0,sp,32
    80006524:	100004b7          	lui	s1,0x10000
    80006528:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000652c:	0ff57513          	andi	a0,a0,255
    80006530:	fffff097          	auipc	ra,0xfffff
    80006534:	534080e7          	jalr	1332(ra) # 80005a64 <consoleintr>
    80006538:	0054c783          	lbu	a5,5(s1)
    8000653c:	0017f793          	andi	a5,a5,1
    80006540:	fe0794e3          	bnez	a5,80006528 <uartintr+0x28>
    80006544:	00004617          	auipc	a2,0x4
    80006548:	9e460613          	addi	a2,a2,-1564 # 80009f28 <uart_tx_r>
    8000654c:	00004517          	auipc	a0,0x4
    80006550:	9e450513          	addi	a0,a0,-1564 # 80009f30 <uart_tx_w>
    80006554:	00063783          	ld	a5,0(a2)
    80006558:	00053703          	ld	a4,0(a0)
    8000655c:	04f70263          	beq	a4,a5,800065a0 <uartintr+0xa0>
    80006560:	100005b7          	lui	a1,0x10000
    80006564:	00005817          	auipc	a6,0x5
    80006568:	c4c80813          	addi	a6,a6,-948 # 8000b1b0 <uart_tx_buf>
    8000656c:	01c0006f          	j	80006588 <uartintr+0x88>
    80006570:	0006c703          	lbu	a4,0(a3)
    80006574:	00f63023          	sd	a5,0(a2)
    80006578:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000657c:	00063783          	ld	a5,0(a2)
    80006580:	00053703          	ld	a4,0(a0)
    80006584:	00f70e63          	beq	a4,a5,800065a0 <uartintr+0xa0>
    80006588:	01f7f713          	andi	a4,a5,31
    8000658c:	00e806b3          	add	a3,a6,a4
    80006590:	0055c703          	lbu	a4,5(a1)
    80006594:	00178793          	addi	a5,a5,1
    80006598:	02077713          	andi	a4,a4,32
    8000659c:	fc071ae3          	bnez	a4,80006570 <uartintr+0x70>
    800065a0:	01813083          	ld	ra,24(sp)
    800065a4:	01013403          	ld	s0,16(sp)
    800065a8:	00813483          	ld	s1,8(sp)
    800065ac:	02010113          	addi	sp,sp,32
    800065b0:	00008067          	ret
    800065b4:	00004617          	auipc	a2,0x4
    800065b8:	97460613          	addi	a2,a2,-1676 # 80009f28 <uart_tx_r>
    800065bc:	00004517          	auipc	a0,0x4
    800065c0:	97450513          	addi	a0,a0,-1676 # 80009f30 <uart_tx_w>
    800065c4:	00063783          	ld	a5,0(a2)
    800065c8:	00053703          	ld	a4,0(a0)
    800065cc:	04f70263          	beq	a4,a5,80006610 <uartintr+0x110>
    800065d0:	100005b7          	lui	a1,0x10000
    800065d4:	00005817          	auipc	a6,0x5
    800065d8:	bdc80813          	addi	a6,a6,-1060 # 8000b1b0 <uart_tx_buf>
    800065dc:	01c0006f          	j	800065f8 <uartintr+0xf8>
    800065e0:	0006c703          	lbu	a4,0(a3)
    800065e4:	00f63023          	sd	a5,0(a2)
    800065e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800065ec:	00063783          	ld	a5,0(a2)
    800065f0:	00053703          	ld	a4,0(a0)
    800065f4:	02f70063          	beq	a4,a5,80006614 <uartintr+0x114>
    800065f8:	01f7f713          	andi	a4,a5,31
    800065fc:	00e806b3          	add	a3,a6,a4
    80006600:	0055c703          	lbu	a4,5(a1)
    80006604:	00178793          	addi	a5,a5,1
    80006608:	02077713          	andi	a4,a4,32
    8000660c:	fc071ae3          	bnez	a4,800065e0 <uartintr+0xe0>
    80006610:	00008067          	ret
    80006614:	00008067          	ret

0000000080006618 <kinit>:
    80006618:	fc010113          	addi	sp,sp,-64
    8000661c:	02913423          	sd	s1,40(sp)
    80006620:	fffff7b7          	lui	a5,0xfffff
    80006624:	00006497          	auipc	s1,0x6
    80006628:	bab48493          	addi	s1,s1,-1109 # 8000c1cf <end+0xfff>
    8000662c:	02813823          	sd	s0,48(sp)
    80006630:	01313c23          	sd	s3,24(sp)
    80006634:	00f4f4b3          	and	s1,s1,a5
    80006638:	02113c23          	sd	ra,56(sp)
    8000663c:	03213023          	sd	s2,32(sp)
    80006640:	01413823          	sd	s4,16(sp)
    80006644:	01513423          	sd	s5,8(sp)
    80006648:	04010413          	addi	s0,sp,64
    8000664c:	000017b7          	lui	a5,0x1
    80006650:	01100993          	li	s3,17
    80006654:	00f487b3          	add	a5,s1,a5
    80006658:	01b99993          	slli	s3,s3,0x1b
    8000665c:	06f9e063          	bltu	s3,a5,800066bc <kinit+0xa4>
    80006660:	00005a97          	auipc	s5,0x5
    80006664:	b70a8a93          	addi	s5,s5,-1168 # 8000b1d0 <end>
    80006668:	0754ec63          	bltu	s1,s5,800066e0 <kinit+0xc8>
    8000666c:	0734fa63          	bgeu	s1,s3,800066e0 <kinit+0xc8>
    80006670:	00088a37          	lui	s4,0x88
    80006674:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006678:	00004917          	auipc	s2,0x4
    8000667c:	8c090913          	addi	s2,s2,-1856 # 80009f38 <kmem>
    80006680:	00ca1a13          	slli	s4,s4,0xc
    80006684:	0140006f          	j	80006698 <kinit+0x80>
    80006688:	000017b7          	lui	a5,0x1
    8000668c:	00f484b3          	add	s1,s1,a5
    80006690:	0554e863          	bltu	s1,s5,800066e0 <kinit+0xc8>
    80006694:	0534f663          	bgeu	s1,s3,800066e0 <kinit+0xc8>
    80006698:	00001637          	lui	a2,0x1
    8000669c:	00100593          	li	a1,1
    800066a0:	00048513          	mv	a0,s1
    800066a4:	00000097          	auipc	ra,0x0
    800066a8:	5e4080e7          	jalr	1508(ra) # 80006c88 <__memset>
    800066ac:	00093783          	ld	a5,0(s2)
    800066b0:	00f4b023          	sd	a5,0(s1)
    800066b4:	00993023          	sd	s1,0(s2)
    800066b8:	fd4498e3          	bne	s1,s4,80006688 <kinit+0x70>
    800066bc:	03813083          	ld	ra,56(sp)
    800066c0:	03013403          	ld	s0,48(sp)
    800066c4:	02813483          	ld	s1,40(sp)
    800066c8:	02013903          	ld	s2,32(sp)
    800066cc:	01813983          	ld	s3,24(sp)
    800066d0:	01013a03          	ld	s4,16(sp)
    800066d4:	00813a83          	ld	s5,8(sp)
    800066d8:	04010113          	addi	sp,sp,64
    800066dc:	00008067          	ret
    800066e0:	00002517          	auipc	a0,0x2
    800066e4:	fa050513          	addi	a0,a0,-96 # 80008680 <digits+0x18>
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	4b4080e7          	jalr	1204(ra) # 80005b9c <panic>

00000000800066f0 <freerange>:
    800066f0:	fc010113          	addi	sp,sp,-64
    800066f4:	000017b7          	lui	a5,0x1
    800066f8:	02913423          	sd	s1,40(sp)
    800066fc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006700:	009504b3          	add	s1,a0,s1
    80006704:	fffff537          	lui	a0,0xfffff
    80006708:	02813823          	sd	s0,48(sp)
    8000670c:	02113c23          	sd	ra,56(sp)
    80006710:	03213023          	sd	s2,32(sp)
    80006714:	01313c23          	sd	s3,24(sp)
    80006718:	01413823          	sd	s4,16(sp)
    8000671c:	01513423          	sd	s5,8(sp)
    80006720:	01613023          	sd	s6,0(sp)
    80006724:	04010413          	addi	s0,sp,64
    80006728:	00a4f4b3          	and	s1,s1,a0
    8000672c:	00f487b3          	add	a5,s1,a5
    80006730:	06f5e463          	bltu	a1,a5,80006798 <freerange+0xa8>
    80006734:	00005a97          	auipc	s5,0x5
    80006738:	a9ca8a93          	addi	s5,s5,-1380 # 8000b1d0 <end>
    8000673c:	0954e263          	bltu	s1,s5,800067c0 <freerange+0xd0>
    80006740:	01100993          	li	s3,17
    80006744:	01b99993          	slli	s3,s3,0x1b
    80006748:	0734fc63          	bgeu	s1,s3,800067c0 <freerange+0xd0>
    8000674c:	00058a13          	mv	s4,a1
    80006750:	00003917          	auipc	s2,0x3
    80006754:	7e890913          	addi	s2,s2,2024 # 80009f38 <kmem>
    80006758:	00002b37          	lui	s6,0x2
    8000675c:	0140006f          	j	80006770 <freerange+0x80>
    80006760:	000017b7          	lui	a5,0x1
    80006764:	00f484b3          	add	s1,s1,a5
    80006768:	0554ec63          	bltu	s1,s5,800067c0 <freerange+0xd0>
    8000676c:	0534fa63          	bgeu	s1,s3,800067c0 <freerange+0xd0>
    80006770:	00001637          	lui	a2,0x1
    80006774:	00100593          	li	a1,1
    80006778:	00048513          	mv	a0,s1
    8000677c:	00000097          	auipc	ra,0x0
    80006780:	50c080e7          	jalr	1292(ra) # 80006c88 <__memset>
    80006784:	00093703          	ld	a4,0(s2)
    80006788:	016487b3          	add	a5,s1,s6
    8000678c:	00e4b023          	sd	a4,0(s1)
    80006790:	00993023          	sd	s1,0(s2)
    80006794:	fcfa76e3          	bgeu	s4,a5,80006760 <freerange+0x70>
    80006798:	03813083          	ld	ra,56(sp)
    8000679c:	03013403          	ld	s0,48(sp)
    800067a0:	02813483          	ld	s1,40(sp)
    800067a4:	02013903          	ld	s2,32(sp)
    800067a8:	01813983          	ld	s3,24(sp)
    800067ac:	01013a03          	ld	s4,16(sp)
    800067b0:	00813a83          	ld	s5,8(sp)
    800067b4:	00013b03          	ld	s6,0(sp)
    800067b8:	04010113          	addi	sp,sp,64
    800067bc:	00008067          	ret
    800067c0:	00002517          	auipc	a0,0x2
    800067c4:	ec050513          	addi	a0,a0,-320 # 80008680 <digits+0x18>
    800067c8:	fffff097          	auipc	ra,0xfffff
    800067cc:	3d4080e7          	jalr	980(ra) # 80005b9c <panic>

00000000800067d0 <kfree>:
    800067d0:	fe010113          	addi	sp,sp,-32
    800067d4:	00813823          	sd	s0,16(sp)
    800067d8:	00113c23          	sd	ra,24(sp)
    800067dc:	00913423          	sd	s1,8(sp)
    800067e0:	02010413          	addi	s0,sp,32
    800067e4:	03451793          	slli	a5,a0,0x34
    800067e8:	04079c63          	bnez	a5,80006840 <kfree+0x70>
    800067ec:	00005797          	auipc	a5,0x5
    800067f0:	9e478793          	addi	a5,a5,-1564 # 8000b1d0 <end>
    800067f4:	00050493          	mv	s1,a0
    800067f8:	04f56463          	bltu	a0,a5,80006840 <kfree+0x70>
    800067fc:	01100793          	li	a5,17
    80006800:	01b79793          	slli	a5,a5,0x1b
    80006804:	02f57e63          	bgeu	a0,a5,80006840 <kfree+0x70>
    80006808:	00001637          	lui	a2,0x1
    8000680c:	00100593          	li	a1,1
    80006810:	00000097          	auipc	ra,0x0
    80006814:	478080e7          	jalr	1144(ra) # 80006c88 <__memset>
    80006818:	00003797          	auipc	a5,0x3
    8000681c:	72078793          	addi	a5,a5,1824 # 80009f38 <kmem>
    80006820:	0007b703          	ld	a4,0(a5)
    80006824:	01813083          	ld	ra,24(sp)
    80006828:	01013403          	ld	s0,16(sp)
    8000682c:	00e4b023          	sd	a4,0(s1)
    80006830:	0097b023          	sd	s1,0(a5)
    80006834:	00813483          	ld	s1,8(sp)
    80006838:	02010113          	addi	sp,sp,32
    8000683c:	00008067          	ret
    80006840:	00002517          	auipc	a0,0x2
    80006844:	e4050513          	addi	a0,a0,-448 # 80008680 <digits+0x18>
    80006848:	fffff097          	auipc	ra,0xfffff
    8000684c:	354080e7          	jalr	852(ra) # 80005b9c <panic>

0000000080006850 <kalloc>:
    80006850:	fe010113          	addi	sp,sp,-32
    80006854:	00813823          	sd	s0,16(sp)
    80006858:	00913423          	sd	s1,8(sp)
    8000685c:	00113c23          	sd	ra,24(sp)
    80006860:	02010413          	addi	s0,sp,32
    80006864:	00003797          	auipc	a5,0x3
    80006868:	6d478793          	addi	a5,a5,1748 # 80009f38 <kmem>
    8000686c:	0007b483          	ld	s1,0(a5)
    80006870:	02048063          	beqz	s1,80006890 <kalloc+0x40>
    80006874:	0004b703          	ld	a4,0(s1)
    80006878:	00001637          	lui	a2,0x1
    8000687c:	00500593          	li	a1,5
    80006880:	00048513          	mv	a0,s1
    80006884:	00e7b023          	sd	a4,0(a5)
    80006888:	00000097          	auipc	ra,0x0
    8000688c:	400080e7          	jalr	1024(ra) # 80006c88 <__memset>
    80006890:	01813083          	ld	ra,24(sp)
    80006894:	01013403          	ld	s0,16(sp)
    80006898:	00048513          	mv	a0,s1
    8000689c:	00813483          	ld	s1,8(sp)
    800068a0:	02010113          	addi	sp,sp,32
    800068a4:	00008067          	ret

00000000800068a8 <initlock>:
    800068a8:	ff010113          	addi	sp,sp,-16
    800068ac:	00813423          	sd	s0,8(sp)
    800068b0:	01010413          	addi	s0,sp,16
    800068b4:	00813403          	ld	s0,8(sp)
    800068b8:	00b53423          	sd	a1,8(a0)
    800068bc:	00052023          	sw	zero,0(a0)
    800068c0:	00053823          	sd	zero,16(a0)
    800068c4:	01010113          	addi	sp,sp,16
    800068c8:	00008067          	ret

00000000800068cc <acquire>:
    800068cc:	fe010113          	addi	sp,sp,-32
    800068d0:	00813823          	sd	s0,16(sp)
    800068d4:	00913423          	sd	s1,8(sp)
    800068d8:	00113c23          	sd	ra,24(sp)
    800068dc:	01213023          	sd	s2,0(sp)
    800068e0:	02010413          	addi	s0,sp,32
    800068e4:	00050493          	mv	s1,a0
    800068e8:	10002973          	csrr	s2,sstatus
    800068ec:	100027f3          	csrr	a5,sstatus
    800068f0:	ffd7f793          	andi	a5,a5,-3
    800068f4:	10079073          	csrw	sstatus,a5
    800068f8:	fffff097          	auipc	ra,0xfffff
    800068fc:	8e0080e7          	jalr	-1824(ra) # 800051d8 <mycpu>
    80006900:	07852783          	lw	a5,120(a0)
    80006904:	06078e63          	beqz	a5,80006980 <acquire+0xb4>
    80006908:	fffff097          	auipc	ra,0xfffff
    8000690c:	8d0080e7          	jalr	-1840(ra) # 800051d8 <mycpu>
    80006910:	07852783          	lw	a5,120(a0)
    80006914:	0004a703          	lw	a4,0(s1)
    80006918:	0017879b          	addiw	a5,a5,1
    8000691c:	06f52c23          	sw	a5,120(a0)
    80006920:	04071063          	bnez	a4,80006960 <acquire+0x94>
    80006924:	00100713          	li	a4,1
    80006928:	00070793          	mv	a5,a4
    8000692c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006930:	0007879b          	sext.w	a5,a5
    80006934:	fe079ae3          	bnez	a5,80006928 <acquire+0x5c>
    80006938:	0ff0000f          	fence
    8000693c:	fffff097          	auipc	ra,0xfffff
    80006940:	89c080e7          	jalr	-1892(ra) # 800051d8 <mycpu>
    80006944:	01813083          	ld	ra,24(sp)
    80006948:	01013403          	ld	s0,16(sp)
    8000694c:	00a4b823          	sd	a0,16(s1)
    80006950:	00013903          	ld	s2,0(sp)
    80006954:	00813483          	ld	s1,8(sp)
    80006958:	02010113          	addi	sp,sp,32
    8000695c:	00008067          	ret
    80006960:	0104b903          	ld	s2,16(s1)
    80006964:	fffff097          	auipc	ra,0xfffff
    80006968:	874080e7          	jalr	-1932(ra) # 800051d8 <mycpu>
    8000696c:	faa91ce3          	bne	s2,a0,80006924 <acquire+0x58>
    80006970:	00002517          	auipc	a0,0x2
    80006974:	d1850513          	addi	a0,a0,-744 # 80008688 <digits+0x20>
    80006978:	fffff097          	auipc	ra,0xfffff
    8000697c:	224080e7          	jalr	548(ra) # 80005b9c <panic>
    80006980:	00195913          	srli	s2,s2,0x1
    80006984:	fffff097          	auipc	ra,0xfffff
    80006988:	854080e7          	jalr	-1964(ra) # 800051d8 <mycpu>
    8000698c:	00197913          	andi	s2,s2,1
    80006990:	07252e23          	sw	s2,124(a0)
    80006994:	f75ff06f          	j	80006908 <acquire+0x3c>

0000000080006998 <release>:
    80006998:	fe010113          	addi	sp,sp,-32
    8000699c:	00813823          	sd	s0,16(sp)
    800069a0:	00113c23          	sd	ra,24(sp)
    800069a4:	00913423          	sd	s1,8(sp)
    800069a8:	01213023          	sd	s2,0(sp)
    800069ac:	02010413          	addi	s0,sp,32
    800069b0:	00052783          	lw	a5,0(a0)
    800069b4:	00079a63          	bnez	a5,800069c8 <release+0x30>
    800069b8:	00002517          	auipc	a0,0x2
    800069bc:	cd850513          	addi	a0,a0,-808 # 80008690 <digits+0x28>
    800069c0:	fffff097          	auipc	ra,0xfffff
    800069c4:	1dc080e7          	jalr	476(ra) # 80005b9c <panic>
    800069c8:	01053903          	ld	s2,16(a0)
    800069cc:	00050493          	mv	s1,a0
    800069d0:	fffff097          	auipc	ra,0xfffff
    800069d4:	808080e7          	jalr	-2040(ra) # 800051d8 <mycpu>
    800069d8:	fea910e3          	bne	s2,a0,800069b8 <release+0x20>
    800069dc:	0004b823          	sd	zero,16(s1)
    800069e0:	0ff0000f          	fence
    800069e4:	0f50000f          	fence	iorw,ow
    800069e8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800069ec:	ffffe097          	auipc	ra,0xffffe
    800069f0:	7ec080e7          	jalr	2028(ra) # 800051d8 <mycpu>
    800069f4:	100027f3          	csrr	a5,sstatus
    800069f8:	0027f793          	andi	a5,a5,2
    800069fc:	04079a63          	bnez	a5,80006a50 <release+0xb8>
    80006a00:	07852783          	lw	a5,120(a0)
    80006a04:	02f05e63          	blez	a5,80006a40 <release+0xa8>
    80006a08:	fff7871b          	addiw	a4,a5,-1
    80006a0c:	06e52c23          	sw	a4,120(a0)
    80006a10:	00071c63          	bnez	a4,80006a28 <release+0x90>
    80006a14:	07c52783          	lw	a5,124(a0)
    80006a18:	00078863          	beqz	a5,80006a28 <release+0x90>
    80006a1c:	100027f3          	csrr	a5,sstatus
    80006a20:	0027e793          	ori	a5,a5,2
    80006a24:	10079073          	csrw	sstatus,a5
    80006a28:	01813083          	ld	ra,24(sp)
    80006a2c:	01013403          	ld	s0,16(sp)
    80006a30:	00813483          	ld	s1,8(sp)
    80006a34:	00013903          	ld	s2,0(sp)
    80006a38:	02010113          	addi	sp,sp,32
    80006a3c:	00008067          	ret
    80006a40:	00002517          	auipc	a0,0x2
    80006a44:	c7050513          	addi	a0,a0,-912 # 800086b0 <digits+0x48>
    80006a48:	fffff097          	auipc	ra,0xfffff
    80006a4c:	154080e7          	jalr	340(ra) # 80005b9c <panic>
    80006a50:	00002517          	auipc	a0,0x2
    80006a54:	c4850513          	addi	a0,a0,-952 # 80008698 <digits+0x30>
    80006a58:	fffff097          	auipc	ra,0xfffff
    80006a5c:	144080e7          	jalr	324(ra) # 80005b9c <panic>

0000000080006a60 <holding>:
    80006a60:	00052783          	lw	a5,0(a0)
    80006a64:	00079663          	bnez	a5,80006a70 <holding+0x10>
    80006a68:	00000513          	li	a0,0
    80006a6c:	00008067          	ret
    80006a70:	fe010113          	addi	sp,sp,-32
    80006a74:	00813823          	sd	s0,16(sp)
    80006a78:	00913423          	sd	s1,8(sp)
    80006a7c:	00113c23          	sd	ra,24(sp)
    80006a80:	02010413          	addi	s0,sp,32
    80006a84:	01053483          	ld	s1,16(a0)
    80006a88:	ffffe097          	auipc	ra,0xffffe
    80006a8c:	750080e7          	jalr	1872(ra) # 800051d8 <mycpu>
    80006a90:	01813083          	ld	ra,24(sp)
    80006a94:	01013403          	ld	s0,16(sp)
    80006a98:	40a48533          	sub	a0,s1,a0
    80006a9c:	00153513          	seqz	a0,a0
    80006aa0:	00813483          	ld	s1,8(sp)
    80006aa4:	02010113          	addi	sp,sp,32
    80006aa8:	00008067          	ret

0000000080006aac <push_off>:
    80006aac:	fe010113          	addi	sp,sp,-32
    80006ab0:	00813823          	sd	s0,16(sp)
    80006ab4:	00113c23          	sd	ra,24(sp)
    80006ab8:	00913423          	sd	s1,8(sp)
    80006abc:	02010413          	addi	s0,sp,32
    80006ac0:	100024f3          	csrr	s1,sstatus
    80006ac4:	100027f3          	csrr	a5,sstatus
    80006ac8:	ffd7f793          	andi	a5,a5,-3
    80006acc:	10079073          	csrw	sstatus,a5
    80006ad0:	ffffe097          	auipc	ra,0xffffe
    80006ad4:	708080e7          	jalr	1800(ra) # 800051d8 <mycpu>
    80006ad8:	07852783          	lw	a5,120(a0)
    80006adc:	02078663          	beqz	a5,80006b08 <push_off+0x5c>
    80006ae0:	ffffe097          	auipc	ra,0xffffe
    80006ae4:	6f8080e7          	jalr	1784(ra) # 800051d8 <mycpu>
    80006ae8:	07852783          	lw	a5,120(a0)
    80006aec:	01813083          	ld	ra,24(sp)
    80006af0:	01013403          	ld	s0,16(sp)
    80006af4:	0017879b          	addiw	a5,a5,1
    80006af8:	06f52c23          	sw	a5,120(a0)
    80006afc:	00813483          	ld	s1,8(sp)
    80006b00:	02010113          	addi	sp,sp,32
    80006b04:	00008067          	ret
    80006b08:	0014d493          	srli	s1,s1,0x1
    80006b0c:	ffffe097          	auipc	ra,0xffffe
    80006b10:	6cc080e7          	jalr	1740(ra) # 800051d8 <mycpu>
    80006b14:	0014f493          	andi	s1,s1,1
    80006b18:	06952e23          	sw	s1,124(a0)
    80006b1c:	fc5ff06f          	j	80006ae0 <push_off+0x34>

0000000080006b20 <pop_off>:
    80006b20:	ff010113          	addi	sp,sp,-16
    80006b24:	00813023          	sd	s0,0(sp)
    80006b28:	00113423          	sd	ra,8(sp)
    80006b2c:	01010413          	addi	s0,sp,16
    80006b30:	ffffe097          	auipc	ra,0xffffe
    80006b34:	6a8080e7          	jalr	1704(ra) # 800051d8 <mycpu>
    80006b38:	100027f3          	csrr	a5,sstatus
    80006b3c:	0027f793          	andi	a5,a5,2
    80006b40:	04079663          	bnez	a5,80006b8c <pop_off+0x6c>
    80006b44:	07852783          	lw	a5,120(a0)
    80006b48:	02f05a63          	blez	a5,80006b7c <pop_off+0x5c>
    80006b4c:	fff7871b          	addiw	a4,a5,-1
    80006b50:	06e52c23          	sw	a4,120(a0)
    80006b54:	00071c63          	bnez	a4,80006b6c <pop_off+0x4c>
    80006b58:	07c52783          	lw	a5,124(a0)
    80006b5c:	00078863          	beqz	a5,80006b6c <pop_off+0x4c>
    80006b60:	100027f3          	csrr	a5,sstatus
    80006b64:	0027e793          	ori	a5,a5,2
    80006b68:	10079073          	csrw	sstatus,a5
    80006b6c:	00813083          	ld	ra,8(sp)
    80006b70:	00013403          	ld	s0,0(sp)
    80006b74:	01010113          	addi	sp,sp,16
    80006b78:	00008067          	ret
    80006b7c:	00002517          	auipc	a0,0x2
    80006b80:	b3450513          	addi	a0,a0,-1228 # 800086b0 <digits+0x48>
    80006b84:	fffff097          	auipc	ra,0xfffff
    80006b88:	018080e7          	jalr	24(ra) # 80005b9c <panic>
    80006b8c:	00002517          	auipc	a0,0x2
    80006b90:	b0c50513          	addi	a0,a0,-1268 # 80008698 <digits+0x30>
    80006b94:	fffff097          	auipc	ra,0xfffff
    80006b98:	008080e7          	jalr	8(ra) # 80005b9c <panic>

0000000080006b9c <push_on>:
    80006b9c:	fe010113          	addi	sp,sp,-32
    80006ba0:	00813823          	sd	s0,16(sp)
    80006ba4:	00113c23          	sd	ra,24(sp)
    80006ba8:	00913423          	sd	s1,8(sp)
    80006bac:	02010413          	addi	s0,sp,32
    80006bb0:	100024f3          	csrr	s1,sstatus
    80006bb4:	100027f3          	csrr	a5,sstatus
    80006bb8:	0027e793          	ori	a5,a5,2
    80006bbc:	10079073          	csrw	sstatus,a5
    80006bc0:	ffffe097          	auipc	ra,0xffffe
    80006bc4:	618080e7          	jalr	1560(ra) # 800051d8 <mycpu>
    80006bc8:	07852783          	lw	a5,120(a0)
    80006bcc:	02078663          	beqz	a5,80006bf8 <push_on+0x5c>
    80006bd0:	ffffe097          	auipc	ra,0xffffe
    80006bd4:	608080e7          	jalr	1544(ra) # 800051d8 <mycpu>
    80006bd8:	07852783          	lw	a5,120(a0)
    80006bdc:	01813083          	ld	ra,24(sp)
    80006be0:	01013403          	ld	s0,16(sp)
    80006be4:	0017879b          	addiw	a5,a5,1
    80006be8:	06f52c23          	sw	a5,120(a0)
    80006bec:	00813483          	ld	s1,8(sp)
    80006bf0:	02010113          	addi	sp,sp,32
    80006bf4:	00008067          	ret
    80006bf8:	0014d493          	srli	s1,s1,0x1
    80006bfc:	ffffe097          	auipc	ra,0xffffe
    80006c00:	5dc080e7          	jalr	1500(ra) # 800051d8 <mycpu>
    80006c04:	0014f493          	andi	s1,s1,1
    80006c08:	06952e23          	sw	s1,124(a0)
    80006c0c:	fc5ff06f          	j	80006bd0 <push_on+0x34>

0000000080006c10 <pop_on>:
    80006c10:	ff010113          	addi	sp,sp,-16
    80006c14:	00813023          	sd	s0,0(sp)
    80006c18:	00113423          	sd	ra,8(sp)
    80006c1c:	01010413          	addi	s0,sp,16
    80006c20:	ffffe097          	auipc	ra,0xffffe
    80006c24:	5b8080e7          	jalr	1464(ra) # 800051d8 <mycpu>
    80006c28:	100027f3          	csrr	a5,sstatus
    80006c2c:	0027f793          	andi	a5,a5,2
    80006c30:	04078463          	beqz	a5,80006c78 <pop_on+0x68>
    80006c34:	07852783          	lw	a5,120(a0)
    80006c38:	02f05863          	blez	a5,80006c68 <pop_on+0x58>
    80006c3c:	fff7879b          	addiw	a5,a5,-1
    80006c40:	06f52c23          	sw	a5,120(a0)
    80006c44:	07853783          	ld	a5,120(a0)
    80006c48:	00079863          	bnez	a5,80006c58 <pop_on+0x48>
    80006c4c:	100027f3          	csrr	a5,sstatus
    80006c50:	ffd7f793          	andi	a5,a5,-3
    80006c54:	10079073          	csrw	sstatus,a5
    80006c58:	00813083          	ld	ra,8(sp)
    80006c5c:	00013403          	ld	s0,0(sp)
    80006c60:	01010113          	addi	sp,sp,16
    80006c64:	00008067          	ret
    80006c68:	00002517          	auipc	a0,0x2
    80006c6c:	a7050513          	addi	a0,a0,-1424 # 800086d8 <digits+0x70>
    80006c70:	fffff097          	auipc	ra,0xfffff
    80006c74:	f2c080e7          	jalr	-212(ra) # 80005b9c <panic>
    80006c78:	00002517          	auipc	a0,0x2
    80006c7c:	a4050513          	addi	a0,a0,-1472 # 800086b8 <digits+0x50>
    80006c80:	fffff097          	auipc	ra,0xfffff
    80006c84:	f1c080e7          	jalr	-228(ra) # 80005b9c <panic>

0000000080006c88 <__memset>:
    80006c88:	ff010113          	addi	sp,sp,-16
    80006c8c:	00813423          	sd	s0,8(sp)
    80006c90:	01010413          	addi	s0,sp,16
    80006c94:	1a060e63          	beqz	a2,80006e50 <__memset+0x1c8>
    80006c98:	40a007b3          	neg	a5,a0
    80006c9c:	0077f793          	andi	a5,a5,7
    80006ca0:	00778693          	addi	a3,a5,7
    80006ca4:	00b00813          	li	a6,11
    80006ca8:	0ff5f593          	andi	a1,a1,255
    80006cac:	fff6071b          	addiw	a4,a2,-1
    80006cb0:	1b06e663          	bltu	a3,a6,80006e5c <__memset+0x1d4>
    80006cb4:	1cd76463          	bltu	a4,a3,80006e7c <__memset+0x1f4>
    80006cb8:	1a078e63          	beqz	a5,80006e74 <__memset+0x1ec>
    80006cbc:	00b50023          	sb	a1,0(a0)
    80006cc0:	00100713          	li	a4,1
    80006cc4:	1ae78463          	beq	a5,a4,80006e6c <__memset+0x1e4>
    80006cc8:	00b500a3          	sb	a1,1(a0)
    80006ccc:	00200713          	li	a4,2
    80006cd0:	1ae78a63          	beq	a5,a4,80006e84 <__memset+0x1fc>
    80006cd4:	00b50123          	sb	a1,2(a0)
    80006cd8:	00300713          	li	a4,3
    80006cdc:	18e78463          	beq	a5,a4,80006e64 <__memset+0x1dc>
    80006ce0:	00b501a3          	sb	a1,3(a0)
    80006ce4:	00400713          	li	a4,4
    80006ce8:	1ae78263          	beq	a5,a4,80006e8c <__memset+0x204>
    80006cec:	00b50223          	sb	a1,4(a0)
    80006cf0:	00500713          	li	a4,5
    80006cf4:	1ae78063          	beq	a5,a4,80006e94 <__memset+0x20c>
    80006cf8:	00b502a3          	sb	a1,5(a0)
    80006cfc:	00700713          	li	a4,7
    80006d00:	18e79e63          	bne	a5,a4,80006e9c <__memset+0x214>
    80006d04:	00b50323          	sb	a1,6(a0)
    80006d08:	00700e93          	li	t4,7
    80006d0c:	00859713          	slli	a4,a1,0x8
    80006d10:	00e5e733          	or	a4,a1,a4
    80006d14:	01059e13          	slli	t3,a1,0x10
    80006d18:	01c76e33          	or	t3,a4,t3
    80006d1c:	01859313          	slli	t1,a1,0x18
    80006d20:	006e6333          	or	t1,t3,t1
    80006d24:	02059893          	slli	a7,a1,0x20
    80006d28:	40f60e3b          	subw	t3,a2,a5
    80006d2c:	011368b3          	or	a7,t1,a7
    80006d30:	02859813          	slli	a6,a1,0x28
    80006d34:	0108e833          	or	a6,a7,a6
    80006d38:	03059693          	slli	a3,a1,0x30
    80006d3c:	003e589b          	srliw	a7,t3,0x3
    80006d40:	00d866b3          	or	a3,a6,a3
    80006d44:	03859713          	slli	a4,a1,0x38
    80006d48:	00389813          	slli	a6,a7,0x3
    80006d4c:	00f507b3          	add	a5,a0,a5
    80006d50:	00e6e733          	or	a4,a3,a4
    80006d54:	000e089b          	sext.w	a7,t3
    80006d58:	00f806b3          	add	a3,a6,a5
    80006d5c:	00e7b023          	sd	a4,0(a5)
    80006d60:	00878793          	addi	a5,a5,8
    80006d64:	fed79ce3          	bne	a5,a3,80006d5c <__memset+0xd4>
    80006d68:	ff8e7793          	andi	a5,t3,-8
    80006d6c:	0007871b          	sext.w	a4,a5
    80006d70:	01d787bb          	addw	a5,a5,t4
    80006d74:	0ce88e63          	beq	a7,a4,80006e50 <__memset+0x1c8>
    80006d78:	00f50733          	add	a4,a0,a5
    80006d7c:	00b70023          	sb	a1,0(a4)
    80006d80:	0017871b          	addiw	a4,a5,1
    80006d84:	0cc77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006d88:	00e50733          	add	a4,a0,a4
    80006d8c:	00b70023          	sb	a1,0(a4)
    80006d90:	0027871b          	addiw	a4,a5,2
    80006d94:	0ac77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006d98:	00e50733          	add	a4,a0,a4
    80006d9c:	00b70023          	sb	a1,0(a4)
    80006da0:	0037871b          	addiw	a4,a5,3
    80006da4:	0ac77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006da8:	00e50733          	add	a4,a0,a4
    80006dac:	00b70023          	sb	a1,0(a4)
    80006db0:	0047871b          	addiw	a4,a5,4
    80006db4:	08c77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006db8:	00e50733          	add	a4,a0,a4
    80006dbc:	00b70023          	sb	a1,0(a4)
    80006dc0:	0057871b          	addiw	a4,a5,5
    80006dc4:	08c77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006dc8:	00e50733          	add	a4,a0,a4
    80006dcc:	00b70023          	sb	a1,0(a4)
    80006dd0:	0067871b          	addiw	a4,a5,6
    80006dd4:	06c77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006dd8:	00e50733          	add	a4,a0,a4
    80006ddc:	00b70023          	sb	a1,0(a4)
    80006de0:	0077871b          	addiw	a4,a5,7
    80006de4:	06c77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006de8:	00e50733          	add	a4,a0,a4
    80006dec:	00b70023          	sb	a1,0(a4)
    80006df0:	0087871b          	addiw	a4,a5,8
    80006df4:	04c77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006df8:	00e50733          	add	a4,a0,a4
    80006dfc:	00b70023          	sb	a1,0(a4)
    80006e00:	0097871b          	addiw	a4,a5,9
    80006e04:	04c77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006e08:	00e50733          	add	a4,a0,a4
    80006e0c:	00b70023          	sb	a1,0(a4)
    80006e10:	00a7871b          	addiw	a4,a5,10
    80006e14:	02c77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006e18:	00e50733          	add	a4,a0,a4
    80006e1c:	00b70023          	sb	a1,0(a4)
    80006e20:	00b7871b          	addiw	a4,a5,11
    80006e24:	02c77663          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006e28:	00e50733          	add	a4,a0,a4
    80006e2c:	00b70023          	sb	a1,0(a4)
    80006e30:	00c7871b          	addiw	a4,a5,12
    80006e34:	00c77e63          	bgeu	a4,a2,80006e50 <__memset+0x1c8>
    80006e38:	00e50733          	add	a4,a0,a4
    80006e3c:	00b70023          	sb	a1,0(a4)
    80006e40:	00d7879b          	addiw	a5,a5,13
    80006e44:	00c7f663          	bgeu	a5,a2,80006e50 <__memset+0x1c8>
    80006e48:	00f507b3          	add	a5,a0,a5
    80006e4c:	00b78023          	sb	a1,0(a5)
    80006e50:	00813403          	ld	s0,8(sp)
    80006e54:	01010113          	addi	sp,sp,16
    80006e58:	00008067          	ret
    80006e5c:	00b00693          	li	a3,11
    80006e60:	e55ff06f          	j	80006cb4 <__memset+0x2c>
    80006e64:	00300e93          	li	t4,3
    80006e68:	ea5ff06f          	j	80006d0c <__memset+0x84>
    80006e6c:	00100e93          	li	t4,1
    80006e70:	e9dff06f          	j	80006d0c <__memset+0x84>
    80006e74:	00000e93          	li	t4,0
    80006e78:	e95ff06f          	j	80006d0c <__memset+0x84>
    80006e7c:	00000793          	li	a5,0
    80006e80:	ef9ff06f          	j	80006d78 <__memset+0xf0>
    80006e84:	00200e93          	li	t4,2
    80006e88:	e85ff06f          	j	80006d0c <__memset+0x84>
    80006e8c:	00400e93          	li	t4,4
    80006e90:	e7dff06f          	j	80006d0c <__memset+0x84>
    80006e94:	00500e93          	li	t4,5
    80006e98:	e75ff06f          	j	80006d0c <__memset+0x84>
    80006e9c:	00600e93          	li	t4,6
    80006ea0:	e6dff06f          	j	80006d0c <__memset+0x84>

0000000080006ea4 <__memmove>:
    80006ea4:	ff010113          	addi	sp,sp,-16
    80006ea8:	00813423          	sd	s0,8(sp)
    80006eac:	01010413          	addi	s0,sp,16
    80006eb0:	0e060863          	beqz	a2,80006fa0 <__memmove+0xfc>
    80006eb4:	fff6069b          	addiw	a3,a2,-1
    80006eb8:	0006881b          	sext.w	a6,a3
    80006ebc:	0ea5e863          	bltu	a1,a0,80006fac <__memmove+0x108>
    80006ec0:	00758713          	addi	a4,a1,7
    80006ec4:	00a5e7b3          	or	a5,a1,a0
    80006ec8:	40a70733          	sub	a4,a4,a0
    80006ecc:	0077f793          	andi	a5,a5,7
    80006ed0:	00f73713          	sltiu	a4,a4,15
    80006ed4:	00174713          	xori	a4,a4,1
    80006ed8:	0017b793          	seqz	a5,a5
    80006edc:	00e7f7b3          	and	a5,a5,a4
    80006ee0:	10078863          	beqz	a5,80006ff0 <__memmove+0x14c>
    80006ee4:	00900793          	li	a5,9
    80006ee8:	1107f463          	bgeu	a5,a6,80006ff0 <__memmove+0x14c>
    80006eec:	0036581b          	srliw	a6,a2,0x3
    80006ef0:	fff8081b          	addiw	a6,a6,-1
    80006ef4:	02081813          	slli	a6,a6,0x20
    80006ef8:	01d85893          	srli	a7,a6,0x1d
    80006efc:	00858813          	addi	a6,a1,8
    80006f00:	00058793          	mv	a5,a1
    80006f04:	00050713          	mv	a4,a0
    80006f08:	01088833          	add	a6,a7,a6
    80006f0c:	0007b883          	ld	a7,0(a5)
    80006f10:	00878793          	addi	a5,a5,8
    80006f14:	00870713          	addi	a4,a4,8
    80006f18:	ff173c23          	sd	a7,-8(a4)
    80006f1c:	ff0798e3          	bne	a5,a6,80006f0c <__memmove+0x68>
    80006f20:	ff867713          	andi	a4,a2,-8
    80006f24:	02071793          	slli	a5,a4,0x20
    80006f28:	0207d793          	srli	a5,a5,0x20
    80006f2c:	00f585b3          	add	a1,a1,a5
    80006f30:	40e686bb          	subw	a3,a3,a4
    80006f34:	00f507b3          	add	a5,a0,a5
    80006f38:	06e60463          	beq	a2,a4,80006fa0 <__memmove+0xfc>
    80006f3c:	0005c703          	lbu	a4,0(a1)
    80006f40:	00e78023          	sb	a4,0(a5)
    80006f44:	04068e63          	beqz	a3,80006fa0 <__memmove+0xfc>
    80006f48:	0015c603          	lbu	a2,1(a1)
    80006f4c:	00100713          	li	a4,1
    80006f50:	00c780a3          	sb	a2,1(a5)
    80006f54:	04e68663          	beq	a3,a4,80006fa0 <__memmove+0xfc>
    80006f58:	0025c603          	lbu	a2,2(a1)
    80006f5c:	00200713          	li	a4,2
    80006f60:	00c78123          	sb	a2,2(a5)
    80006f64:	02e68e63          	beq	a3,a4,80006fa0 <__memmove+0xfc>
    80006f68:	0035c603          	lbu	a2,3(a1)
    80006f6c:	00300713          	li	a4,3
    80006f70:	00c781a3          	sb	a2,3(a5)
    80006f74:	02e68663          	beq	a3,a4,80006fa0 <__memmove+0xfc>
    80006f78:	0045c603          	lbu	a2,4(a1)
    80006f7c:	00400713          	li	a4,4
    80006f80:	00c78223          	sb	a2,4(a5)
    80006f84:	00e68e63          	beq	a3,a4,80006fa0 <__memmove+0xfc>
    80006f88:	0055c603          	lbu	a2,5(a1)
    80006f8c:	00500713          	li	a4,5
    80006f90:	00c782a3          	sb	a2,5(a5)
    80006f94:	00e68663          	beq	a3,a4,80006fa0 <__memmove+0xfc>
    80006f98:	0065c703          	lbu	a4,6(a1)
    80006f9c:	00e78323          	sb	a4,6(a5)
    80006fa0:	00813403          	ld	s0,8(sp)
    80006fa4:	01010113          	addi	sp,sp,16
    80006fa8:	00008067          	ret
    80006fac:	02061713          	slli	a4,a2,0x20
    80006fb0:	02075713          	srli	a4,a4,0x20
    80006fb4:	00e587b3          	add	a5,a1,a4
    80006fb8:	f0f574e3          	bgeu	a0,a5,80006ec0 <__memmove+0x1c>
    80006fbc:	02069613          	slli	a2,a3,0x20
    80006fc0:	02065613          	srli	a2,a2,0x20
    80006fc4:	fff64613          	not	a2,a2
    80006fc8:	00e50733          	add	a4,a0,a4
    80006fcc:	00c78633          	add	a2,a5,a2
    80006fd0:	fff7c683          	lbu	a3,-1(a5)
    80006fd4:	fff78793          	addi	a5,a5,-1
    80006fd8:	fff70713          	addi	a4,a4,-1
    80006fdc:	00d70023          	sb	a3,0(a4)
    80006fe0:	fec798e3          	bne	a5,a2,80006fd0 <__memmove+0x12c>
    80006fe4:	00813403          	ld	s0,8(sp)
    80006fe8:	01010113          	addi	sp,sp,16
    80006fec:	00008067          	ret
    80006ff0:	02069713          	slli	a4,a3,0x20
    80006ff4:	02075713          	srli	a4,a4,0x20
    80006ff8:	00170713          	addi	a4,a4,1
    80006ffc:	00e50733          	add	a4,a0,a4
    80007000:	00050793          	mv	a5,a0
    80007004:	0005c683          	lbu	a3,0(a1)
    80007008:	00178793          	addi	a5,a5,1
    8000700c:	00158593          	addi	a1,a1,1
    80007010:	fed78fa3          	sb	a3,-1(a5)
    80007014:	fee798e3          	bne	a5,a4,80007004 <__memmove+0x160>
    80007018:	f89ff06f          	j	80006fa0 <__memmove+0xfc>

000000008000701c <__putc>:
    8000701c:	fe010113          	addi	sp,sp,-32
    80007020:	00813823          	sd	s0,16(sp)
    80007024:	00113c23          	sd	ra,24(sp)
    80007028:	02010413          	addi	s0,sp,32
    8000702c:	00050793          	mv	a5,a0
    80007030:	fef40593          	addi	a1,s0,-17
    80007034:	00100613          	li	a2,1
    80007038:	00000513          	li	a0,0
    8000703c:	fef407a3          	sb	a5,-17(s0)
    80007040:	fffff097          	auipc	ra,0xfffff
    80007044:	b3c080e7          	jalr	-1220(ra) # 80005b7c <console_write>
    80007048:	01813083          	ld	ra,24(sp)
    8000704c:	01013403          	ld	s0,16(sp)
    80007050:	02010113          	addi	sp,sp,32
    80007054:	00008067          	ret

0000000080007058 <__getc>:
    80007058:	fe010113          	addi	sp,sp,-32
    8000705c:	00813823          	sd	s0,16(sp)
    80007060:	00113c23          	sd	ra,24(sp)
    80007064:	02010413          	addi	s0,sp,32
    80007068:	fe840593          	addi	a1,s0,-24
    8000706c:	00100613          	li	a2,1
    80007070:	00000513          	li	a0,0
    80007074:	fffff097          	auipc	ra,0xfffff
    80007078:	ae8080e7          	jalr	-1304(ra) # 80005b5c <console_read>
    8000707c:	fe844503          	lbu	a0,-24(s0)
    80007080:	01813083          	ld	ra,24(sp)
    80007084:	01013403          	ld	s0,16(sp)
    80007088:	02010113          	addi	sp,sp,32
    8000708c:	00008067          	ret

0000000080007090 <console_handler>:
    80007090:	fe010113          	addi	sp,sp,-32
    80007094:	00813823          	sd	s0,16(sp)
    80007098:	00113c23          	sd	ra,24(sp)
    8000709c:	00913423          	sd	s1,8(sp)
    800070a0:	02010413          	addi	s0,sp,32
    800070a4:	14202773          	csrr	a4,scause
    800070a8:	100027f3          	csrr	a5,sstatus
    800070ac:	0027f793          	andi	a5,a5,2
    800070b0:	06079e63          	bnez	a5,8000712c <console_handler+0x9c>
    800070b4:	00074c63          	bltz	a4,800070cc <console_handler+0x3c>
    800070b8:	01813083          	ld	ra,24(sp)
    800070bc:	01013403          	ld	s0,16(sp)
    800070c0:	00813483          	ld	s1,8(sp)
    800070c4:	02010113          	addi	sp,sp,32
    800070c8:	00008067          	ret
    800070cc:	0ff77713          	andi	a4,a4,255
    800070d0:	00900793          	li	a5,9
    800070d4:	fef712e3          	bne	a4,a5,800070b8 <console_handler+0x28>
    800070d8:	ffffe097          	auipc	ra,0xffffe
    800070dc:	6dc080e7          	jalr	1756(ra) # 800057b4 <plic_claim>
    800070e0:	00a00793          	li	a5,10
    800070e4:	00050493          	mv	s1,a0
    800070e8:	02f50c63          	beq	a0,a5,80007120 <console_handler+0x90>
    800070ec:	fc0506e3          	beqz	a0,800070b8 <console_handler+0x28>
    800070f0:	00050593          	mv	a1,a0
    800070f4:	00001517          	auipc	a0,0x1
    800070f8:	4ec50513          	addi	a0,a0,1260 # 800085e0 <_ZTV14PeriodicThread+0x120>
    800070fc:	fffff097          	auipc	ra,0xfffff
    80007100:	afc080e7          	jalr	-1284(ra) # 80005bf8 <__printf>
    80007104:	01013403          	ld	s0,16(sp)
    80007108:	01813083          	ld	ra,24(sp)
    8000710c:	00048513          	mv	a0,s1
    80007110:	00813483          	ld	s1,8(sp)
    80007114:	02010113          	addi	sp,sp,32
    80007118:	ffffe317          	auipc	t1,0xffffe
    8000711c:	6d430067          	jr	1748(t1) # 800057ec <plic_complete>
    80007120:	fffff097          	auipc	ra,0xfffff
    80007124:	3e0080e7          	jalr	992(ra) # 80006500 <uartintr>
    80007128:	fddff06f          	j	80007104 <console_handler+0x74>
    8000712c:	00001517          	auipc	a0,0x1
    80007130:	5b450513          	addi	a0,a0,1460 # 800086e0 <digits+0x78>
    80007134:	fffff097          	auipc	ra,0xfffff
    80007138:	a68080e7          	jalr	-1432(ra) # 80005b9c <panic>
	...
