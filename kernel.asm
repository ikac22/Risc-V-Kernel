
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	be013103          	ld	sp,-1056(sp) # 80008be0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	551040ef          	jal	ra,80004d6c <start>

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
    80001080:	10c010ef          	jal	ra,8000218c <interrupt>

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
    80001270:	00006517          	auipc	a0,0x6
    80001274:	e7050513          	addi	a0,a0,-400 # 800070e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    80001278:	00004097          	auipc	ra,0x4
    8000127c:	844080e7          	jalr	-1980(ra) # 80004abc <_Z11printStringPKc>
        getString(input, 30);
    80001280:	01e00593          	li	a1,30
    80001284:	f9040513          	addi	a0,s0,-112
    80001288:	00004097          	auipc	ra,0x4
    8000128c:	8b0080e7          	jalr	-1872(ra) # 80004b38 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80001290:	f9040513          	addi	a0,s0,-112
    80001294:	00004097          	auipc	ra,0x4
    80001298:	96c080e7          	jalr	-1684(ra) # 80004c00 <_Z11stringToIntPKc>
    8000129c:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    800012a0:	00006517          	auipc	a0,0x6
    800012a4:	e6050513          	addi	a0,a0,-416 # 80007100 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    800012a8:	00004097          	auipc	ra,0x4
    800012ac:	814080e7          	jalr	-2028(ra) # 80004abc <_Z11printStringPKc>
        getString(input, 30);
    800012b0:	01e00593          	li	a1,30
    800012b4:	f9040513          	addi	a0,s0,-112
    800012b8:	00004097          	auipc	ra,0x4
    800012bc:	880080e7          	jalr	-1920(ra) # 80004b38 <_Z9getStringPci>
        n = stringToInt(input);
    800012c0:	f9040513          	addi	a0,s0,-112
    800012c4:	00004097          	auipc	ra,0x4
    800012c8:	93c080e7          	jalr	-1732(ra) # 80004c00 <_Z11stringToIntPKc>
    800012cc:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    800012d0:	00006517          	auipc	a0,0x6
    800012d4:	e5050513          	addi	a0,a0,-432 # 80007120 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    800012d8:	00003097          	auipc	ra,0x3
    800012dc:	7e4080e7          	jalr	2020(ra) # 80004abc <_Z11printStringPKc>
    800012e0:	00000613          	li	a2,0
    800012e4:	00a00593          	li	a1,10
    800012e8:	00098513          	mv	a0,s3
    800012ec:	00004097          	auipc	ra,0x4
    800012f0:	964080e7          	jalr	-1692(ra) # 80004c50 <_Z8printIntiii>
        printString(" i velicina bafera "); printInt(n);
    800012f4:	00006517          	auipc	a0,0x6
    800012f8:	e4450513          	addi	a0,a0,-444 # 80007138 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    800012fc:	00003097          	auipc	ra,0x3
    80001300:	7c0080e7          	jalr	1984(ra) # 80004abc <_Z11printStringPKc>
    80001304:	00000613          	li	a2,0
    80001308:	00a00593          	li	a1,10
    8000130c:	00048513          	mv	a0,s1
    80001310:	00004097          	auipc	ra,0x4
    80001314:	940080e7          	jalr	-1728(ra) # 80004c50 <_Z8printIntiii>
        printString(".\n");
    80001318:	00006517          	auipc	a0,0x6
    8000131c:	e3850513          	addi	a0,a0,-456 # 80007150 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    80001320:	00003097          	auipc	ra,0x3
    80001324:	79c080e7          	jalr	1948(ra) # 80004abc <_Z11printStringPKc>
        if(threadNum > n) {
    80001328:	0334c463          	blt	s1,s3,80001350 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x114>
        } else if (threadNum < 1) {
    8000132c:	03305c63          	blez	s3,80001364 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x128>
        BufferCPP *buffer = new BufferCPP(n);
    80001330:	03800513          	li	a0,56
    80001334:	00003097          	auipc	ra,0x3
    80001338:	b64080e7          	jalr	-1180(ra) # 80003e98 <_Znwm>
    8000133c:	00050a93          	mv	s5,a0
    80001340:	00048593          	mv	a1,s1
    80001344:	00003097          	auipc	ra,0x3
    80001348:	310080e7          	jalr	784(ra) # 80004654 <_ZN9BufferCPPC1Ei>
    8000134c:	0300006f          	j	8000137c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x140>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80001350:	00006517          	auipc	a0,0x6
    80001354:	e0850513          	addi	a0,a0,-504 # 80007158 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    80001358:	00003097          	auipc	ra,0x3
    8000135c:	764080e7          	jalr	1892(ra) # 80004abc <_Z11printStringPKc>
            return;
    80001360:	0140006f          	j	80001374 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x138>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80001364:	00006517          	auipc	a0,0x6
    80001368:	e3450513          	addi	a0,a0,-460 # 80007198 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    8000136c:	00003097          	auipc	ra,0x3
    80001370:	750080e7          	jalr	1872(ra) # 80004abc <_Z11printStringPKc>
            return;
    80001374:	000b8113          	mv	sp,s7
    80001378:	2200006f          	j	80001598 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x35c>
        waitForAll = new Semaphore(0);
    8000137c:	01000513          	li	a0,16
    80001380:	00003097          	auipc	ra,0x3
    80001384:	b18080e7          	jalr	-1256(ra) # 80003e98 <_Znwm>
    80001388:	00050493          	mv	s1,a0
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000138c:	00006797          	auipc	a5,0x6
    80001390:	ccc78793          	addi	a5,a5,-820 # 80007058 <_ZTV9Semaphore+0x10>
    80001394:	00f53023          	sd	a5,0(a0)
    80001398:	00000593          	li	a1,0
    8000139c:	00850513          	addi	a0,a0,8
    800013a0:	00002097          	auipc	ra,0x2
    800013a4:	3d8080e7          	jalr	984(ra) # 80003778 <sem_open>
    800013a8:	00008917          	auipc	s2,0x8
    800013ac:	9e090913          	addi	s2,s2,-1568 # 80008d88 <_ZN19ConsumerProducerCPP10waitForAllE>
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
    80001410:	a8c080e7          	jalr	-1396(ra) # 80003e98 <_Znwm>
    80001414:	00050b13          	mv	s6,a0
    Thread (){ myHandle = nullptr; this->w = nullptr;}
    80001418:	00053423          	sd	zero,8(a0)
    8000141c:	00053823          	sd	zero,16(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    80001420:	00006797          	auipc	a5,0x6
    80001424:	ca878793          	addi	a5,a5,-856 # 800070c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80001428:	00f53023          	sd	a5,0(a0)
    8000142c:	00953c23          	sd	s1,24(a0)
        consumer->start();
    80001430:	00003097          	auipc	ra,0x3
    80001434:	b74080e7          	jalr	-1164(ra) # 80003fa4 <_ZN6Thread5startEv>
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
    80001450:	a4c080e7          	jalr	-1460(ra) # 80003e98 <_Znwm>
    80001454:	00053423          	sd	zero,8(a0)
    80001458:	00053823          	sd	zero,16(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000145c:	00006717          	auipc	a4,0x6
    80001460:	c1c70713          	addi	a4,a4,-996 # 80007078 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80001464:	00e53023          	sd	a4,0(a0)
    80001468:	01853c23          	sd	s8,24(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    8000146c:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    80001470:	00003097          	auipc	ra,0x3
    80001474:	b34080e7          	jalr	-1228(ra) # 80003fa4 <_ZN6Thread5startEv>
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
    80001498:	00008797          	auipc	a5,0x8
    8000149c:	8f078793          	addi	a5,a5,-1808 # 80008d88 <_ZN19ConsumerProducerCPP10waitForAllE>
    800014a0:	0007b783          	ld	a5,0(a5)
    800014a4:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    800014a8:	02000513          	li	a0,32
    800014ac:	00003097          	auipc	ra,0x3
    800014b0:	9ec080e7          	jalr	-1556(ra) # 80003e98 <_Znwm>
    800014b4:	00053423          	sd	zero,8(a0)
    800014b8:	00053823          	sd	zero,16(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    800014bc:	00006717          	auipc	a4,0x6
    800014c0:	be470713          	addi	a4,a4,-1052 # 800070a0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    800014c4:	00e53023          	sd	a4,0(a0)
    800014c8:	00953c23          	sd	s1,24(a0)
            producers[i] = new Producer(&threadData[i]);
    800014cc:	00391713          	slli	a4,s2,0x3
    800014d0:	00ea0733          	add	a4,s4,a4
    800014d4:	00a73023          	sd	a0,0(a4)
            producers[i]->start();
    800014d8:	00003097          	auipc	ra,0x3
    800014dc:	acc080e7          	jalr	-1332(ra) # 80003fa4 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    800014e0:	0019091b          	addiw	s2,s2,1
    800014e4:	f99ff06f          	j	8000147c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x240>
    static void dispatch () { thread_dispatch(); }
    800014e8:	00002097          	auipc	ra,0x2
    800014ec:	1b4080e7          	jalr	436(ra) # 8000369c <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    800014f0:	00000493          	li	s1,0
    800014f4:	0299c263          	blt	s3,s1,80001518 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2dc>
            waitForAll->wait();
    800014f8:	00008797          	auipc	a5,0x8
    800014fc:	89078793          	addi	a5,a5,-1904 # 80008d88 <_ZN19ConsumerProducerCPP10waitForAllE>
    80001500:	0007b783          	ld	a5,0(a5)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80001504:	0087b503          	ld	a0,8(a5)
    80001508:	00002097          	auipc	ra,0x2
    8000150c:	2e4080e7          	jalr	740(ra) # 800037ec <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    80001510:	0014849b          	addiw	s1,s1,1
    80001514:	fe1ff06f          	j	800014f4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2b8>
        delete waitForAll;
    80001518:	00008797          	auipc	a5,0x8
    8000151c:	87078793          	addi	a5,a5,-1936 # 80008d88 <_ZN19ConsumerProducerCPP10waitForAllE>
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
    80001584:	43c080e7          	jalr	1084(ra) # 800049bc <_ZN9BufferCPPD1Ev>
    80001588:	000a8513          	mv	a0,s5
    8000158c:	00003097          	auipc	ra,0x3
    80001590:	934080e7          	jalr	-1740(ra) # 80003ec0 <_ZdlPv>
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
    800015d8:	8ec080e7          	jalr	-1812(ra) # 80003ec0 <_ZdlPv>
    800015dc:	00048513          	mv	a0,s1
    800015e0:	00009097          	auipc	ra,0x9
    800015e4:	928080e7          	jalr	-1752(ra) # 80009f08 <_Unwind_Resume>
    800015e8:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    800015ec:	00048513          	mv	a0,s1
    800015f0:	00003097          	auipc	ra,0x3
    800015f4:	8d0080e7          	jalr	-1840(ra) # 80003ec0 <_ZdlPv>
    800015f8:	00090513          	mv	a0,s2
    800015fc:	00009097          	auipc	ra,0x9
    80001600:	90c080e7          	jalr	-1780(ra) # 80009f08 <_Unwind_Resume>

0000000080001604 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80001604:	ff010113          	addi	sp,sp,-16
    80001608:	00113423          	sd	ra,8(sp)
    8000160c:	00813023          	sd	s0,0(sp)
    80001610:	01010413          	addi	s0,sp,16

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80001614:	00000097          	auipc	ra,0x0
    80001618:	c28080e7          	jalr	-984(ra) # 8000123c <_ZN19ConsumerProducerCPP20testConsumerProducerEv>

    8000161c:	00813083          	ld	ra,8(sp)
    80001620:	00013403          	ld	s0,0(sp)
    80001624:	01010113          	addi	sp,sp,16
    80001628:	00008067          	ret

000000008000162c <_ZN6ThreadD1Ev>:
    virtual ~Thread (){ delete myHandle; }
    8000162c:	ff010113          	addi	sp,sp,-16
    80001630:	00813423          	sd	s0,8(sp)
    80001634:	01010413          	addi	s0,sp,16
    80001638:	00006797          	auipc	a5,0x6
    8000163c:	9f878793          	addi	a5,a5,-1544 # 80007030 <_ZTV6Thread+0x10>
    80001640:	00f53023          	sd	a5,0(a0)
    80001644:	00853783          	ld	a5,8(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    80001648:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    8000164c:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001650:	00000073          	ecall
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_ZN6Thread3runEv>:
    virtual void run () {}
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00813423          	sd	s0,8(sp)
    80001668:	01010413          	addi	s0,sp,16
    8000166c:	00813403          	ld	s0,8(sp)
    80001670:	01010113          	addi	sp,sp,16
    80001674:	00008067          	ret

0000000080001678 <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    80001678:	ff010113          	addi	sp,sp,-16
    8000167c:	00813423          	sd	s0,8(sp)
    80001680:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    80001684:	00006797          	auipc	a5,0x6
    80001688:	9ac78793          	addi	a5,a5,-1620 # 80007030 <_ZTV6Thread+0x10>
    8000168c:	00f53023          	sd	a5,0(a0)
    80001690:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001694:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001698:	00078593          	mv	a1,a5
        asm volatile("ecall");
    8000169c:	00000073          	ecall
    800016a0:	00813403          	ld	s0,8(sp)
    800016a4:	01010113          	addi	sp,sp,16
    800016a8:	00008067          	ret

00000000800016ac <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    800016ac:	ff010113          	addi	sp,sp,-16
    800016b0:	00813423          	sd	s0,8(sp)
    800016b4:	01010413          	addi	s0,sp,16
    800016b8:	00006797          	auipc	a5,0x6
    800016bc:	97878793          	addi	a5,a5,-1672 # 80007030 <_ZTV6Thread+0x10>
    800016c0:	00f53023          	sd	a5,0(a0)
    800016c4:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800016c8:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800016cc:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800016d0:	00000073          	ecall
    800016d4:	00813403          	ld	s0,8(sp)
    800016d8:	01010113          	addi	sp,sp,16
    800016dc:	00008067          	ret

00000000800016e0 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    800016e0:	ff010113          	addi	sp,sp,-16
    800016e4:	00813423          	sd	s0,8(sp)
    800016e8:	01010413          	addi	s0,sp,16
    800016ec:	00006797          	auipc	a5,0x6
    800016f0:	94478793          	addi	a5,a5,-1724 # 80007030 <_ZTV6Thread+0x10>
    800016f4:	00f53023          	sd	a5,0(a0)
    800016f8:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800016fc:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001700:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001704:	00000073          	ecall
    80001708:	00813403          	ld	s0,8(sp)
    8000170c:	01010113          	addi	sp,sp,16
    80001710:	00008067          	ret

0000000080001714 <_ZN6ThreadD0Ev>:
    80001714:	ff010113          	addi	sp,sp,-16
    80001718:	00113423          	sd	ra,8(sp)
    8000171c:	00813023          	sd	s0,0(sp)
    80001720:	01010413          	addi	s0,sp,16
    80001724:	00006717          	auipc	a4,0x6
    80001728:	90c70713          	addi	a4,a4,-1780 # 80007030 <_ZTV6Thread+0x10>
    8000172c:	00e53023          	sd	a4,0(a0)
    80001730:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001734:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001738:	00078593          	mv	a1,a5
        asm volatile("ecall");
    8000173c:	00000073          	ecall
    80001740:	00002097          	auipc	ra,0x2
    80001744:	780080e7          	jalr	1920(ra) # 80003ec0 <_ZdlPv>
    80001748:	00813083          	ld	ra,8(sp)
    8000174c:	00013403          	ld	s0,0(sp)
    80001750:	01010113          	addi	sp,sp,16
    80001754:	00008067          	ret

0000000080001758 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    class Consumer : public Thread {
    80001758:	ff010113          	addi	sp,sp,-16
    8000175c:	00113423          	sd	ra,8(sp)
    80001760:	00813023          	sd	s0,0(sp)
    80001764:	01010413          	addi	s0,sp,16
    80001768:	00006717          	auipc	a4,0x6
    8000176c:	8c870713          	addi	a4,a4,-1848 # 80007030 <_ZTV6Thread+0x10>
    80001770:	00e53023          	sd	a4,0(a0)
    80001774:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001778:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    8000177c:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001780:	00000073          	ecall
    80001784:	00002097          	auipc	ra,0x2
    80001788:	73c080e7          	jalr	1852(ra) # 80003ec0 <_ZdlPv>
    8000178c:	00813083          	ld	ra,8(sp)
    80001790:	00013403          	ld	s0,0(sp)
    80001794:	01010113          	addi	sp,sp,16
    80001798:	00008067          	ret

000000008000179c <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    class ProducerKeyborad : public Thread {
    8000179c:	ff010113          	addi	sp,sp,-16
    800017a0:	00113423          	sd	ra,8(sp)
    800017a4:	00813023          	sd	s0,0(sp)
    800017a8:	01010413          	addi	s0,sp,16
    800017ac:	00006717          	auipc	a4,0x6
    800017b0:	88470713          	addi	a4,a4,-1916 # 80007030 <_ZTV6Thread+0x10>
    800017b4:	00e53023          	sd	a4,0(a0)
    800017b8:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800017bc:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800017c0:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800017c4:	00000073          	ecall
    800017c8:	00002097          	auipc	ra,0x2
    800017cc:	6f8080e7          	jalr	1784(ra) # 80003ec0 <_ZdlPv>
    800017d0:	00813083          	ld	ra,8(sp)
    800017d4:	00013403          	ld	s0,0(sp)
    800017d8:	01010113          	addi	sp,sp,16
    800017dc:	00008067          	ret

00000000800017e0 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    class Producer : public Thread {
    800017e0:	ff010113          	addi	sp,sp,-16
    800017e4:	00113423          	sd	ra,8(sp)
    800017e8:	00813023          	sd	s0,0(sp)
    800017ec:	01010413          	addi	s0,sp,16
    800017f0:	00006717          	auipc	a4,0x6
    800017f4:	84070713          	addi	a4,a4,-1984 # 80007030 <_ZTV6Thread+0x10>
    800017f8:	00e53023          	sd	a4,0(a0)
    800017fc:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    80001800:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001804:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80001808:	00000073          	ecall
    8000180c:	00002097          	auipc	ra,0x2
    80001810:	6b4080e7          	jalr	1716(ra) # 80003ec0 <_ZdlPv>
    80001814:	00813083          	ld	ra,8(sp)
    80001818:	00013403          	ld	s0,0(sp)
    8000181c:	01010113          	addi	sp,sp,16
    80001820:	00008067          	ret

0000000080001824 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    80001824:	ff010113          	addi	sp,sp,-16
    80001828:	00113423          	sd	ra,8(sp)
    8000182c:	00813023          	sd	s0,0(sp)
    80001830:	01010413          	addi	s0,sp,16
    80001834:	00006797          	auipc	a5,0x6
    80001838:	82478793          	addi	a5,a5,-2012 # 80007058 <_ZTV9Semaphore+0x10>
    8000183c:	00f53023          	sd	a5,0(a0)
    80001840:	00853503          	ld	a0,8(a0)
    80001844:	00002097          	auipc	ra,0x2
    80001848:	f70080e7          	jalr	-144(ra) # 800037b4 <sem_close>
    8000184c:	00813083          	ld	ra,8(sp)
    80001850:	00013403          	ld	s0,0(sp)
    80001854:	01010113          	addi	sp,sp,16
    80001858:	00008067          	ret

000000008000185c <_ZN9SemaphoreD0Ev>:
    8000185c:	fe010113          	addi	sp,sp,-32
    80001860:	00113c23          	sd	ra,24(sp)
    80001864:	00813823          	sd	s0,16(sp)
    80001868:	00913423          	sd	s1,8(sp)
    8000186c:	02010413          	addi	s0,sp,32
    80001870:	00050493          	mv	s1,a0
    80001874:	00005797          	auipc	a5,0x5
    80001878:	7e478793          	addi	a5,a5,2020 # 80007058 <_ZTV9Semaphore+0x10>
    8000187c:	00f53023          	sd	a5,0(a0)
    80001880:	00853503          	ld	a0,8(a0)
    80001884:	00002097          	auipc	ra,0x2
    80001888:	f30080e7          	jalr	-208(ra) # 800037b4 <sem_close>
    8000188c:	00048513          	mv	a0,s1
    80001890:	00002097          	auipc	ra,0x2
    80001894:	630080e7          	jalr	1584(ra) # 80003ec0 <_ZdlPv>
    80001898:	01813083          	ld	ra,24(sp)
    8000189c:	01013403          	ld	s0,16(sp)
    800018a0:	00813483          	ld	s1,8(sp)
    800018a4:	02010113          	addi	sp,sp,32
    800018a8:	00008067          	ret

00000000800018ac <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    800018ac:	fd010113          	addi	sp,sp,-48
    800018b0:	02113423          	sd	ra,40(sp)
    800018b4:	02813023          	sd	s0,32(sp)
    800018b8:	00913c23          	sd	s1,24(sp)
    800018bc:	01213823          	sd	s2,16(sp)
    800018c0:	01313423          	sd	s3,8(sp)
    800018c4:	03010413          	addi	s0,sp,48
    800018c8:	00050913          	mv	s2,a0
            int i = 0;
    800018cc:	00000993          	li	s3,0
    800018d0:	0100006f          	j	800018e0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800018d4:	00a00513          	li	a0,10
    800018d8:	00002097          	auipc	ra,0x2
    800018dc:	ff8080e7          	jalr	-8(ra) # 800038d0 <putc>
            while (!threadEnd) {
    800018e0:	00007797          	auipc	a5,0x7
    800018e4:	4a078793          	addi	a5,a5,1184 # 80008d80 <_ZN19ConsumerProducerCPP9threadEndE>
    800018e8:	0007a783          	lw	a5,0(a5)
    800018ec:	0007879b          	sext.w	a5,a5
    800018f0:	02079c63          	bnez	a5,80001928 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    800018f4:	01893783          	ld	a5,24(s2)
    800018f8:	0087b503          	ld	a0,8(a5)
    800018fc:	00003097          	auipc	ra,0x3
    80001900:	f8c080e7          	jalr	-116(ra) # 80004888 <_ZN9BufferCPP3getEv>
                i++;
    80001904:	0019849b          	addiw	s1,s3,1
    80001908:	0004899b          	sext.w	s3,s1
    8000190c:	0ff57513          	andi	a0,a0,255
    80001910:	00002097          	auipc	ra,0x2
    80001914:	fc0080e7          	jalr	-64(ra) # 800038d0 <putc>
                if (i % 80 == 0) {
    80001918:	05000793          	li	a5,80
    8000191c:	02f4e4bb          	remw	s1,s1,a5
    80001920:	fc0490e3          	bnez	s1,800018e0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80001924:	fb1ff06f          	j	800018d4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    80001928:	01893783          	ld	a5,24(s2)
    8000192c:	0087b503          	ld	a0,8(a5)
    80001930:	00003097          	auipc	ra,0x3
    80001934:	ff4080e7          	jalr	-12(ra) # 80004924 <_ZN9BufferCPP6getCntEv>
    80001938:	02a05263          	blez	a0,8000195c <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    8000193c:	01893783          	ld	a5,24(s2)
    80001940:	0087b503          	ld	a0,8(a5)
    80001944:	00003097          	auipc	ra,0x3
    80001948:	f44080e7          	jalr	-188(ra) # 80004888 <_ZN9BufferCPP3getEv>
    8000194c:	0ff57513          	andi	a0,a0,255
    80001950:	00002097          	auipc	ra,0x2
    80001954:	f80080e7          	jalr	-128(ra) # 800038d0 <putc>
    80001958:	fd1ff06f          	j	80001928 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    8000195c:	01893783          	ld	a5,24(s2)
    80001960:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80001964:	0087b503          	ld	a0,8(a5)
    80001968:	00002097          	auipc	ra,0x2
    8000196c:	ebc080e7          	jalr	-324(ra) # 80003824 <sem_signal>
        }
    80001970:	02813083          	ld	ra,40(sp)
    80001974:	02013403          	ld	s0,32(sp)
    80001978:	01813483          	ld	s1,24(sp)
    8000197c:	01013903          	ld	s2,16(sp)
    80001980:	00813983          	ld	s3,8(sp)
    80001984:	03010113          	addi	sp,sp,48
    80001988:	00008067          	ret

000000008000198c <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    8000198c:	fe010113          	addi	sp,sp,-32
    80001990:	00113c23          	sd	ra,24(sp)
    80001994:	00813823          	sd	s0,16(sp)
    80001998:	00913423          	sd	s1,8(sp)
    8000199c:	02010413          	addi	s0,sp,32
    800019a0:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    800019a4:	00002097          	auipc	ra,0x2
    800019a8:	ef0080e7          	jalr	-272(ra) # 80003894 <getc>
    800019ac:	0005059b          	sext.w	a1,a0
    800019b0:	01b00793          	li	a5,27
    800019b4:	00f58c63          	beq	a1,a5,800019cc <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    800019b8:	0184b783          	ld	a5,24(s1)
    800019bc:	0087b503          	ld	a0,8(a5)
    800019c0:	00003097          	auipc	ra,0x3
    800019c4:	e28080e7          	jalr	-472(ra) # 800047e8 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    800019c8:	fddff06f          	j	800019a4 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    800019cc:	00100793          	li	a5,1
    800019d0:	00007717          	auipc	a4,0x7
    800019d4:	3af72823          	sw	a5,944(a4) # 80008d80 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    800019d8:	0184b783          	ld	a5,24(s1)
    800019dc:	02100593          	li	a1,33
    800019e0:	0087b503          	ld	a0,8(a5)
    800019e4:	00003097          	auipc	ra,0x3
    800019e8:	e04080e7          	jalr	-508(ra) # 800047e8 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    800019ec:	0184b783          	ld	a5,24(s1)
    800019f0:	0107b783          	ld	a5,16(a5)
    800019f4:	0087b503          	ld	a0,8(a5)
    800019f8:	00002097          	auipc	ra,0x2
    800019fc:	e2c080e7          	jalr	-468(ra) # 80003824 <sem_signal>
        }
    80001a00:	01813083          	ld	ra,24(sp)
    80001a04:	01013403          	ld	s0,16(sp)
    80001a08:	00813483          	ld	s1,8(sp)
    80001a0c:	02010113          	addi	sp,sp,32
    80001a10:	00008067          	ret

0000000080001a14 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80001a14:	fe010113          	addi	sp,sp,-32
    80001a18:	00113c23          	sd	ra,24(sp)
    80001a1c:	00813823          	sd	s0,16(sp)
    80001a20:	00913423          	sd	s1,8(sp)
    80001a24:	01213023          	sd	s2,0(sp)
    80001a28:	02010413          	addi	s0,sp,32
    80001a2c:	00050493          	mv	s1,a0
            int i = 0;
    80001a30:	00000913          	li	s2,0
            while (!threadEnd) {
    80001a34:	00007797          	auipc	a5,0x7
    80001a38:	34c78793          	addi	a5,a5,844 # 80008d80 <_ZN19ConsumerProducerCPP9threadEndE>
    80001a3c:	0007a783          	lw	a5,0(a5)
    80001a40:	0007879b          	sext.w	a5,a5
    80001a44:	04079263          	bnez	a5,80001a88 <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    80001a48:	0184b783          	ld	a5,24(s1)
    80001a4c:	0007a583          	lw	a1,0(a5)
    80001a50:	0305859b          	addiw	a1,a1,48
    80001a54:	0087b503          	ld	a0,8(a5)
    80001a58:	00003097          	auipc	ra,0x3
    80001a5c:	d90080e7          	jalr	-624(ra) # 800047e8 <_ZN9BufferCPP3putEi>
                i++;
    80001a60:	0019051b          	addiw	a0,s2,1
    80001a64:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    80001a68:	0184b783          	ld	a5,24(s1)
    80001a6c:	0007a783          	lw	a5,0(a5)
    80001a70:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    80001a74:	00500513          	li	a0,5
    80001a78:	02a7e53b          	remw	a0,a5,a0
    80001a7c:	00002097          	auipc	ra,0x2
    80001a80:	de0080e7          	jalr	-544(ra) # 8000385c <time_sleep>
    80001a84:	fb1ff06f          	j	80001a34 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    80001a88:	0184b783          	ld	a5,24(s1)
    80001a8c:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80001a90:	0087b503          	ld	a0,8(a5)
    80001a94:	00002097          	auipc	ra,0x2
    80001a98:	d90080e7          	jalr	-624(ra) # 80003824 <sem_signal>
        }
    80001a9c:	01813083          	ld	ra,24(sp)
    80001aa0:	01013403          	ld	s0,16(sp)
    80001aa4:	00813483          	ld	s1,8(sp)
    80001aa8:	00013903          	ld	s2,0(sp)
    80001aac:	02010113          	addi	sp,sp,32
    80001ab0:	00008067          	ret

0000000080001ab4 <_Z13timer_handlerv>:
    IS = 9,
    IU = 8,
};

void timer_handler()
{
    80001ab4:	fd010113          	addi	sp,sp,-48
    80001ab8:	02113423          	sd	ra,40(sp)
    80001abc:	02813023          	sd	s0,32(sp)
    80001ac0:	00913c23          	sd	s1,24(sp)
    80001ac4:	01213823          	sd	s2,16(sp)
    80001ac8:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80001acc:	00001097          	auipc	ra,0x1
    80001ad0:	084080e7          	jalr	132(ra) # 80002b50 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80001ad4:	00007717          	auipc	a4,0x7
    80001ad8:	2c470713          	addi	a4,a4,708 # 80008d98 <_ZN3TCB16timeSliceCounterE>
    80001adc:	00073783          	ld	a5,0(a4)
    80001ae0:	00178793          	addi	a5,a5,1
    80001ae4:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80001ae8:	00007717          	auipc	a4,0x7
    80001aec:	2b870713          	addi	a4,a4,696 # 80008da0 <_ZN3TCB7runningE>
    80001af0:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80001af4:	03073703          	ld	a4,48(a4)
    80001af8:	02e7f263          	bgeu	a5,a4,80001b1c <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001afc:	00200793          	li	a5,2
    80001b00:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80001b04:	02813083          	ld	ra,40(sp)
    80001b08:	02013403          	ld	s0,32(sp)
    80001b0c:	01813483          	ld	s1,24(sp)
    80001b10:	01013903          	ld	s2,16(sp)
    80001b14:	03010113          	addi	sp,sp,48
    80001b18:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001b1c:	100027f3          	csrr	a5,sstatus
    80001b20:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001b24:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001b28:	141027f3          	csrr	a5,sepc
    80001b2c:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80001b30:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    80001b34:	00007797          	auipc	a5,0x7
    80001b38:	2607b223          	sd	zero,612(a5) # 80008d98 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80001b3c:	00001097          	auipc	ra,0x1
    80001b40:	3f4080e7          	jalr	1012(ra) # 80002f30 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001b44:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001b48:	14149073          	csrw	sepc,s1
    80001b4c:	fb1ff06f          	j	80001afc <_Z13timer_handlerv+0x48>

0000000080001b50 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80001b50:	fb010113          	addi	sp,sp,-80
    80001b54:	04113423          	sd	ra,72(sp)
    80001b58:	04813023          	sd	s0,64(sp)
    80001b5c:	02913c23          	sd	s1,56(sp)
    80001b60:	03213823          	sd	s2,48(sp)
    80001b64:	03313423          	sd	s3,40(sp)
    80001b68:	03413023          	sd	s4,32(sp)
    80001b6c:	01513c23          	sd	s5,24(sp)
    80001b70:	01613823          	sd	s6,16(sp)
    80001b74:	05010413          	addi	s0,sp,80
    80001b78:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001b7c:	141027f3          	csrr	a5,sepc
    80001b80:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001b84:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001b88:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001b8c:	100027f3          	csrr	a5,sstatus
    80001b90:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001b94:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80001b98:	00100793          	li	a5,1
    80001b9c:	0ef50663          	beq	a0,a5,80001c88 <_Z8usrEcallmmmmm+0x138>
    80001ba0:	00050493          	mv	s1,a0
    80001ba4:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    80001ba8:	00200793          	li	a5,2
    80001bac:	12f50063          	beq	a0,a5,80001ccc <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    80001bb0:	01100793          	li	a5,17
    80001bb4:	12f50863          	beq	a0,a5,80001ce4 <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001bb8:	01200793          	li	a5,18
    80001bbc:	14f50a63          	beq	a0,a5,80001d10 <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80001bc0:	01300793          	li	a5,19
    80001bc4:	16f50863          	beq	a0,a5,80001d34 <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    80001bc8:	06900793          	li	a5,105
    80001bcc:	18f50063          	beq	a0,a5,80001d4c <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001bd0:	02100793          	li	a5,33
    80001bd4:	18f50663          	beq	a0,a5,80001d60 <_Z8usrEcallmmmmm+0x210>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
    }
    else if(a0 == SC)
    80001bd8:	02200793          	li	a5,34
    80001bdc:	1af50863          	beq	a0,a5,80001d8c <_Z8usrEcallmmmmm+0x23c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80001be0:	02300793          	li	a5,35
    80001be4:	1cf50a63          	beq	a0,a5,80001db8 <_Z8usrEcallmmmmm+0x268>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
    }
    else if(a0 == SS)
    80001be8:	02400793          	li	a5,36
    80001bec:	1cf50e63          	beq	a0,a5,80001dc8 <_Z8usrEcallmmmmm+0x278>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80001bf0:	03100793          	li	a5,49
    80001bf4:	1ef50463          	beq	a0,a5,80001ddc <_Z8usrEcallmmmmm+0x28c>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    80001bf8:	04100793          	li	a5,65
    80001bfc:	1ef50a63          	beq	a0,a5,80001df0 <_Z8usrEcallmmmmm+0x2a0>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80001c00:	04200793          	li	a5,66
    80001c04:	08f51c63          	bne	a0,a5,80001c9c <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    80001c08:	00007797          	auipc	a5,0x7
    80001c0c:	1c878793          	addi	a5,a5,456 # 80008dd0 <_ZN5StdIO7obufferE>
    80001c10:	0007ba83          	ld	s5,0(a5)
    80001c14:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    80001c18:	430a8513          	addi	a0,s5,1072
    80001c1c:	00002097          	auipc	ra,0x2
    80001c20:	cd8080e7          	jalr	-808(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001c24:	400a8b13          	addi	s6,s5,1024
    80001c28:	000b0513          	mv	a0,s6
    80001c2c:	00002097          	auipc	ra,0x2
    80001c30:	cc8080e7          	jalr	-824(ra) # 800038f4 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    80001c34:	450aa783          	lw	a5,1104(s5)
    80001c38:	0017879b          	addiw	a5,a5,1
    80001c3c:	44faa823          	sw	a5,1104(s5)
        buffer[tail]=c;
    80001c40:	44caa783          	lw	a5,1100(s5)
    80001c44:	00fa8733          	add	a4,s5,a5
    80001c48:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001c4c:	0017879b          	addiw	a5,a5,1
    80001c50:	41f7d71b          	sraiw	a4,a5,0x1f
    80001c54:	0167571b          	srliw	a4,a4,0x16
    80001c58:	00e787bb          	addw	a5,a5,a4
    80001c5c:	3ff7f793          	andi	a5,a5,1023
    80001c60:	40e787bb          	subw	a5,a5,a4
    80001c64:	44faa623          	sw	a5,1100(s5)
    
        itemAvailable.signal();
    80001c68:	418a8513          	addi	a0,s5,1048
    80001c6c:	00002097          	auipc	ra,0x2
    80001c70:	d0c080e7          	jalr	-756(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001c74:	000b0513          	mv	a0,s6
    80001c78:	00002097          	auipc	ra,0x2
    80001c7c:	d00080e7          	jalr	-768(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001c80:	00048513          	mv	a0,s1
    80001c84:	0180006f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80001c88:	00001097          	auipc	ra,0x1
    80001c8c:	9a8080e7          	jalr	-1624(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001c90:	000a0593          	mv	a1,s4
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	a0c080e7          	jalr	-1524(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001c9c:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001ca0:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80001ca4:	04813083          	ld	ra,72(sp)
    80001ca8:	04013403          	ld	s0,64(sp)
    80001cac:	03813483          	ld	s1,56(sp)
    80001cb0:	03013903          	ld	s2,48(sp)
    80001cb4:	02813983          	ld	s3,40(sp)
    80001cb8:	02013a03          	ld	s4,32(sp)
    80001cbc:	01813a83          	ld	s5,24(sp)
    80001cc0:	01013b03          	ld	s6,16(sp)
    80001cc4:	05010113          	addi	sp,sp,80
    80001cc8:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001ccc:	00001097          	auipc	ra,0x1
    80001cd0:	964080e7          	jalr	-1692(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001cd4:	000a0593          	mv	a1,s4
    80001cd8:	00001097          	auipc	ra,0x1
    80001cdc:	b60080e7          	jalr	-1184(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80001ce0:	fbdff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001ce4:	00070613          	mv	a2,a4
    80001ce8:	00068593          	mv	a1,a3
    80001cec:	000a8513          	mv	a0,s5
    80001cf0:	00001097          	auipc	ra,0x1
    80001cf4:	00c080e7          	jalr	12(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001cf8:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80001cfc:	00050663          	beqz	a0,80001d08 <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    80001d00:	00000513          	li	a0,0
    80001d04:	f99ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    80001d08:	ffc00513          	li	a0,-4
    80001d0c:	f91ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    80001d10:	00007797          	auipc	a5,0x7
    80001d14:	09078793          	addi	a5,a5,144 # 80008da0 <_ZN3TCB7runningE>
    80001d18:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80001d1c:	00200713          	li	a4,2
    80001d20:	02e7ac23          	sw	a4,56(a5)
        TCB::dispatch();
    80001d24:	00001097          	auipc	ra,0x1
    80001d28:	12c080e7          	jalr	300(ra) # 80002e50 <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d2c:	00048513          	mv	a0,s1
    80001d30:	f6dff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    80001d34:	00007797          	auipc	a5,0x7
    80001d38:	0607b223          	sd	zero,100(a5) # 80008d98 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80001d3c:	00001097          	auipc	ra,0x1
    80001d40:	1f4080e7          	jalr	500(ra) # 80002f30 <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d44:	00048513          	mv	a0,s1
    80001d48:	f55ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    80001d4c:	00058513          	mv	a0,a1
    80001d50:	00001097          	auipc	ra,0x1
    80001d54:	218080e7          	jalr	536(ra) # 80002f68 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d58:	00048513          	mv	a0,s1
    80001d5c:	f41ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80001d60:	00001097          	auipc	ra,0x1
    80001d64:	8d0080e7          	jalr	-1840(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001d68:	00100593          	li	a1,1
    80001d6c:	00001097          	auipc	ra,0x1
    80001d70:	934080e7          	jalr	-1740(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80001d74:	01552023          	sw	s5,0(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80001d78:	00053423          	sd	zero,8(a0)
    80001d7c:	00053823          	sd	zero,16(a0)
        *t = (uint64)(new KSemaphore(a2));
    80001d80:	00aa3023          	sd	a0,0(s4)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001d84:	00048513          	mv	a0,s1
    80001d88:	f15ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        delete t;
    80001d8c:	f00588e3          	beqz	a1,80001c9c <_Z8usrEcallmmmmm+0x14c>
    80001d90:	00058513          	mv	a0,a1
    80001d94:	00002097          	auipc	ra,0x2
    80001d98:	c38080e7          	jalr	-968(ra) # 800039cc <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001d9c:	00001097          	auipc	ra,0x1
    80001da0:	894080e7          	jalr	-1900(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001da4:	000a0593          	mv	a1,s4
    80001da8:	00001097          	auipc	ra,0x1
    80001dac:	a90080e7          	jalr	-1392(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001db0:	00048513          	mv	a0,s1
    80001db4:	ee9ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        ret = t->wait();
    80001db8:	00058513          	mv	a0,a1
    80001dbc:	00002097          	auipc	ra,0x2
    80001dc0:	b38080e7          	jalr	-1224(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
    80001dc4:	ed9ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        t->signal();
    80001dc8:	00058513          	mv	a0,a1
    80001dcc:	00002097          	auipc	ra,0x2
    80001dd0:	bac080e7          	jalr	-1108(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001dd4:	00048513          	mv	a0,s1
    80001dd8:	ec5ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    80001ddc:	00058513          	mv	a0,a1
    80001de0:	00001097          	auipc	ra,0x1
    80001de4:	230080e7          	jalr	560(ra) # 80003010 <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001de8:	00048513          	mv	a0,s1
    80001dec:	eb1ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    80001df0:	00007797          	auipc	a5,0x7
    80001df4:	fe878793          	addi	a5,a5,-24 # 80008dd8 <_ZN5StdIO7ibufferE>
    80001df8:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    80001dfc:	418a0513          	addi	a0,s4,1048
    80001e00:	00002097          	auipc	ra,0x2
    80001e04:	af4080e7          	jalr	-1292(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001e08:	400a0a93          	addi	s5,s4,1024
    80001e0c:	000a8513          	mv	a0,s5
    80001e10:	00002097          	auipc	ra,0x2
    80001e14:	ae4080e7          	jalr	-1308(ra) # 800038f4 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80001e18:	450a2783          	lw	a5,1104(s4)
    80001e1c:	fff7879b          	addiw	a5,a5,-1
    80001e20:	44fa2823          	sw	a5,1104(s4)
        T r = buffer[head];
    80001e24:	448a2783          	lw	a5,1096(s4)
    80001e28:	00fa0733          	add	a4,s4,a5
    80001e2c:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80001e30:	0017879b          	addiw	a5,a5,1
    80001e34:	41f7d71b          	sraiw	a4,a5,0x1f
    80001e38:	0167571b          	srliw	a4,a4,0x16
    80001e3c:	00e787bb          	addw	a5,a5,a4
    80001e40:	3ff7f793          	andi	a5,a5,1023
    80001e44:	40e787bb          	subw	a5,a5,a4
    80001e48:	44fa2423          	sw	a5,1096(s4)

        spaceAvailable.signal();
    80001e4c:	430a0513          	addi	a0,s4,1072
    80001e50:	00002097          	auipc	ra,0x2
    80001e54:	b28080e7          	jalr	-1240(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001e58:	000a8513          	mv	a0,s5
    80001e5c:	00002097          	auipc	ra,0x2
    80001e60:	b1c080e7          	jalr	-1252(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    80001e64:	00048513          	mv	a0,s1
    80001e68:	e35ff06f          	j	80001c9c <_Z8usrEcallmmmmm+0x14c>

0000000080001e6c <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80001e6c:	fb010113          	addi	sp,sp,-80
    80001e70:	04113423          	sd	ra,72(sp)
    80001e74:	04813023          	sd	s0,64(sp)
    80001e78:	02913c23          	sd	s1,56(sp)
    80001e7c:	03213823          	sd	s2,48(sp)
    80001e80:	03313423          	sd	s3,40(sp)
    80001e84:	03413023          	sd	s4,32(sp)
    80001e88:	01513c23          	sd	s5,24(sp)
    80001e8c:	05010413          	addi	s0,sp,80
    80001e90:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001e94:	141027f3          	csrr	a5,sepc
    80001e98:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001e9c:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001ea0:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001ea4:	100027f3          	csrr	a5,sstatus
    80001ea8:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001eac:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    80001eb0:	00100793          	li	a5,1
    80001eb4:	0ef50663          	beq	a0,a5,80001fa0 <_Z8sysEcallmmmmm+0x134>
    80001eb8:	00050493          	mv	s1,a0
    80001ebc:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    80001ec0:	00200793          	li	a5,2
    80001ec4:	10f50c63          	beq	a0,a5,80001fdc <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    80001ec8:	01100793          	li	a5,17
    80001ecc:	12f50463          	beq	a0,a5,80001ff4 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001ed0:	01200793          	li	a5,18
    80001ed4:	14f50663          	beq	a0,a5,80002020 <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    80001ed8:	01300793          	li	a5,19
    80001edc:	16f50663          	beq	a0,a5,80002048 <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    80001ee0:	06900793          	li	a5,105
    80001ee4:	18f50063          	beq	a0,a5,80002064 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001ee8:	02100793          	li	a5,33
    80001eec:	18f50663          	beq	a0,a5,80002078 <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    80001ef0:	02200793          	li	a5,34
    80001ef4:	1af50863          	beq	a0,a5,800020a4 <_Z8sysEcallmmmmm+0x238>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    80001ef8:	02300793          	li	a5,35
    80001efc:	1cf50a63          	beq	a0,a5,800020d0 <_Z8sysEcallmmmmm+0x264>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    80001f00:	02400793          	li	a5,36
    80001f04:	1ef50063          	beq	a0,a5,800020e4 <_Z8sysEcallmmmmm+0x278>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    80001f08:	03100793          	li	a5,49
    80001f0c:	1ef50663          	beq	a0,a5,800020f8 <_Z8sysEcallmmmmm+0x28c>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    80001f10:	04100793          	li	a5,65
    80001f14:	1ef50e63          	beq	a0,a5,80002110 <_Z8sysEcallmmmmm+0x2a4>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80001f18:	04200793          	li	a5,66
    80001f1c:	08f51c63          	bne	a0,a5,80001fb4 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    80001f20:	00007797          	auipc	a5,0x7
    80001f24:	eb078793          	addi	a5,a5,-336 # 80008dd0 <_ZN5StdIO7obufferE>
    80001f28:	0007ba03          	ld	s4,0(a5)
    80001f2c:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    80001f30:	430a0513          	addi	a0,s4,1072
    80001f34:	00002097          	auipc	ra,0x2
    80001f38:	9c0080e7          	jalr	-1600(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001f3c:	400a0a93          	addi	s5,s4,1024
    80001f40:	000a8513          	mv	a0,s5
    80001f44:	00002097          	auipc	ra,0x2
    80001f48:	9b0080e7          	jalr	-1616(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80001f4c:	450a2783          	lw	a5,1104(s4)
    80001f50:	0017879b          	addiw	a5,a5,1
    80001f54:	44fa2823          	sw	a5,1104(s4)
        buffer[tail]=c;
    80001f58:	44ca2783          	lw	a5,1100(s4)
    80001f5c:	00fa0733          	add	a4,s4,a5
    80001f60:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001f64:	0017879b          	addiw	a5,a5,1
    80001f68:	41f7d71b          	sraiw	a4,a5,0x1f
    80001f6c:	0167571b          	srliw	a4,a4,0x16
    80001f70:	00e787bb          	addw	a5,a5,a4
    80001f74:	3ff7f793          	andi	a5,a5,1023
    80001f78:	40e787bb          	subw	a5,a5,a4
    80001f7c:	44fa2623          	sw	a5,1100(s4)
        itemAvailable.signal();
    80001f80:	418a0513          	addi	a0,s4,1048
    80001f84:	00002097          	auipc	ra,0x2
    80001f88:	9f4080e7          	jalr	-1548(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001f8c:	000a8513          	mv	a0,s5
    80001f90:	00002097          	auipc	ra,0x2
    80001f94:	9e8080e7          	jalr	-1560(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001f98:	00048513          	mv	a0,s1
    80001f9c:	0180006f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	690080e7          	jalr	1680(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001fa8:	00098593          	mv	a1,s3
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	6f4080e7          	jalr	1780(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001fb4:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80001fb8:	04813083          	ld	ra,72(sp)
    80001fbc:	04013403          	ld	s0,64(sp)
    80001fc0:	03813483          	ld	s1,56(sp)
    80001fc4:	03013903          	ld	s2,48(sp)
    80001fc8:	02813983          	ld	s3,40(sp)
    80001fcc:	02013a03          	ld	s4,32(sp)
    80001fd0:	01813a83          	ld	s5,24(sp)
    80001fd4:	05010113          	addi	sp,sp,80
    80001fd8:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001fdc:	00000097          	auipc	ra,0x0
    80001fe0:	654080e7          	jalr	1620(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80001fe4:	00098593          	mv	a1,s3
    80001fe8:	00001097          	auipc	ra,0x1
    80001fec:	850080e7          	jalr	-1968(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80001ff0:	fc5ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    80001ff4:	00070613          	mv	a2,a4
    80001ff8:	00068593          	mv	a1,a3
    80001ffc:	000a8513          	mv	a0,s5
    80002000:	00001097          	auipc	ra,0x1
    80002004:	cfc080e7          	jalr	-772(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002008:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    8000200c:	00050663          	beqz	a0,80002018 <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    80002010:	00000513          	li	a0,0
    80002014:	fa1ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    80002018:	ffc00513          	li	a0,-4
    8000201c:	f99ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    80002020:	00007797          	auipc	a5,0x7
    80002024:	d8078793          	addi	a5,a5,-640 # 80008da0 <_ZN3TCB7runningE>
    80002028:	0007b783          	ld	a5,0(a5)
    8000202c:	00200713          	li	a4,2
    80002030:	02e7ac23          	sw	a4,56(a5)
        TCB::dispatch();
    80002034:	00001097          	auipc	ra,0x1
    80002038:	e1c080e7          	jalr	-484(ra) # 80002e50 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000203c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002040:	00048513          	mv	a0,s1
    80002044:	f71ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    80002048:	00007797          	auipc	a5,0x7
    8000204c:	d407b823          	sd	zero,-688(a5) # 80008d98 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80002050:	00001097          	auipc	ra,0x1
    80002054:	ee0080e7          	jalr	-288(ra) # 80002f30 <_ZN3TCB5yieldEv>
    80002058:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000205c:	00048513          	mv	a0,s1
    80002060:	f55ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80002064:	00058513          	mv	a0,a1
    80002068:	00001097          	auipc	ra,0x1
    8000206c:	f00080e7          	jalr	-256(ra) # 80002f68 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002070:	00048513          	mv	a0,s1
    80002074:	f41ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	5b8080e7          	jalr	1464(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002080:	00100593          	li	a1,1
    80002084:	00000097          	auipc	ra,0x0
    80002088:	61c080e7          	jalr	1564(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    8000208c:	01552023          	sw	s5,0(a0)
    80002090:	00053423          	sd	zero,8(a0)
    80002094:	00053823          	sd	zero,16(a0)
        *t = (uint64)(new KSemaphore(a2));
    80002098:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000209c:	00048513          	mv	a0,s1
    800020a0:	f15ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        delete t;
    800020a4:	f00588e3          	beqz	a1,80001fb4 <_Z8sysEcallmmmmm+0x148>
    800020a8:	00058513          	mv	a0,a1
    800020ac:	00002097          	auipc	ra,0x2
    800020b0:	920080e7          	jalr	-1760(ra) # 800039cc <_ZN10KSemaphoreD1Ev>
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	57c080e7          	jalr	1404(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    800020bc:	00098593          	mv	a1,s3
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	778080e7          	jalr	1912(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800020c8:	00048513          	mv	a0,s1
    800020cc:	ee9ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800020d0:	00058513          	mv	a0,a1
    800020d4:	00002097          	auipc	ra,0x2
    800020d8:	820080e7          	jalr	-2016(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
    800020dc:	100a1073          	csrw	sstatus,s4
    800020e0:	ed5ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    800020e4:	00058513          	mv	a0,a1
    800020e8:	00002097          	auipc	ra,0x2
    800020ec:	890080e7          	jalr	-1904(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800020f0:	00048513          	mv	a0,s1
    800020f4:	ec1ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    800020f8:	00058513          	mv	a0,a1
    800020fc:	00001097          	auipc	ra,0x1
    80002100:	f14080e7          	jalr	-236(ra) # 80003010 <_ZN3TCB5sleepEm>
    80002104:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80002108:	00048513          	mv	a0,s1
    8000210c:	ea9ff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    80002110:	00007797          	auipc	a5,0x7
    80002114:	cc878793          	addi	a5,a5,-824 # 80008dd8 <_ZN5StdIO7ibufferE>
    80002118:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    8000211c:	41898513          	addi	a0,s3,1048
    80002120:	00001097          	auipc	ra,0x1
    80002124:	7d4080e7          	jalr	2004(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80002128:	40098a13          	addi	s4,s3,1024
    8000212c:	000a0513          	mv	a0,s4
    80002130:	00001097          	auipc	ra,0x1
    80002134:	7c4080e7          	jalr	1988(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    80002138:	4509a783          	lw	a5,1104(s3)
    8000213c:	fff7879b          	addiw	a5,a5,-1
    80002140:	44f9a823          	sw	a5,1104(s3)
        T r = buffer[head];
    80002144:	4489a783          	lw	a5,1096(s3)
    80002148:	00f98733          	add	a4,s3,a5
    8000214c:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80002150:	0017879b          	addiw	a5,a5,1
    80002154:	41f7d71b          	sraiw	a4,a5,0x1f
    80002158:	0167571b          	srliw	a4,a4,0x16
    8000215c:	00e787bb          	addw	a5,a5,a4
    80002160:	3ff7f793          	andi	a5,a5,1023
    80002164:	40e787bb          	subw	a5,a5,a4
    80002168:	44f9a423          	sw	a5,1096(s3)
        spaceAvailable.signal();
    8000216c:	43098513          	addi	a0,s3,1072
    80002170:	00002097          	auipc	ra,0x2
    80002174:	808080e7          	jalr	-2040(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80002178:	000a0513          	mv	a0,s4
    8000217c:	00001097          	auipc	ra,0x1
    80002180:	7fc080e7          	jalr	2044(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    80002184:	00048513          	mv	a0,s1
    80002188:	e2dff06f          	j	80001fb4 <_Z8sysEcallmmmmm+0x148>

000000008000218c <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    8000218c:	fc010113          	addi	sp,sp,-64
    80002190:	02113c23          	sd	ra,56(sp)
    80002194:	02813823          	sd	s0,48(sp)
    80002198:	02913423          	sd	s1,40(sp)
    8000219c:	04010413          	addi	s0,sp,64
    asm volatile("csrr %0, scause" : "=r" (scause));
    800021a0:	142027f3          	csrr	a5,scause
    800021a4:	fcf43423          	sd	a5,-56(s0)
    return scause;
    800021a8:	fc843483          	ld	s1,-56(s0)
    uint64 scause = Riscv::r_scause();
    static int t = 0;

    if(scause == IS)
    800021ac:	00900793          	li	a5,9
    800021b0:	0af48063          	beq	s1,a5,80002250 <interrupt+0xc4>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    800021b4:	00800793          	li	a5,8
    800021b8:	0af48c63          	beq	s1,a5,80002270 <interrupt+0xe4>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    800021bc:	fff00793          	li	a5,-1
    800021c0:	03f79793          	slli	a5,a5,0x3f
    800021c4:	00978793          	addi	a5,a5,9
    800021c8:	0af48c63          	beq	s1,a5,80002280 <interrupt+0xf4>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800021cc:	fff00793          	li	a5,-1
    800021d0:	03f79793          	slli	a5,a5,0x3f
    800021d4:	00178793          	addi	a5,a5,1
    800021d8:	0af48a63          	beq	s1,a5,8000228c <interrupt+0x100>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == 2)
    800021dc:	00200793          	li	a5,2
    800021e0:	0af48c63          	beq	s1,a5,80002298 <interrupt+0x10c>
        {
            print(scause);
            t++;
        }
    }
    else if(scause == 1)
    800021e4:	00100793          	li	a5,1
    800021e8:	0ef48863          	beq	s1,a5,800022d8 <interrupt+0x14c>
            t++;
        }
    }
    else
    {
        if(t<15)
    800021ec:	00007797          	auipc	a5,0x7
    800021f0:	ba478793          	addi	a5,a5,-1116 # 80008d90 <_ZZ9interruptE1t>
    800021f4:	0007a703          	lw	a4,0(a5)
    800021f8:	00e00793          	li	a5,14
    800021fc:	06e7c063          	blt	a5,a4,8000225c <interrupt+0xd0>
        {
            Scheduler::print_queue();
    80002200:	00001097          	auipc	ra,0x1
    80002204:	8e0080e7          	jalr	-1824(ra) # 80002ae0 <_ZN9Scheduler11print_queueEv>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80002208:	141027f3          	csrr	a5,sepc
    8000220c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002210:	fd843503          	ld	a0,-40(s0)
            if(scause == 0x7)
            {
                //print((uint64) TCB::running, '\n', 0);
                
            }
            print((uint64) Riscv::r_sepc());
    80002214:	00100613          	li	a2,1
    80002218:	00a00593          	li	a1,10
    8000221c:	00001097          	auipc	ra,0x1
    80002220:	e40080e7          	jalr	-448(ra) # 8000305c <_Z5printmcb>
            print(scause);
    80002224:	00100613          	li	a2,1
    80002228:	00a00593          	li	a1,10
    8000222c:	00048513          	mv	a0,s1
    80002230:	00001097          	auipc	ra,0x1
    80002234:	e2c080e7          	jalr	-468(ra) # 8000305c <_Z5printmcb>
            t++;
    80002238:	00007717          	auipc	a4,0x7
    8000223c:	b5870713          	addi	a4,a4,-1192 # 80008d90 <_ZZ9interruptE1t>
    80002240:	00072783          	lw	a5,0(a4)
    80002244:	0017879b          	addiw	a5,a5,1
    80002248:	00f72023          	sw	a5,0(a4)
        }
    }
    //print(a4);
    8000224c:	0100006f          	j	8000225c <interrupt+0xd0>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80002250:	00000097          	auipc	ra,0x0
    80002254:	c1c080e7          	jalr	-996(ra) # 80001e6c <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80002258:	04a43823          	sd	a0,80(s0)
    8000225c:	03813083          	ld	ra,56(sp)
    80002260:	03013403          	ld	s0,48(sp)
    80002264:	02813483          	ld	s1,40(sp)
    80002268:	04010113          	addi	sp,sp,64
    8000226c:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80002270:	00000097          	auipc	ra,0x0
    80002274:	8e0080e7          	jalr	-1824(ra) # 80001b50 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80002278:	04a43823          	sd	a0,80(s0)
    8000227c:	fe1ff06f          	j	8000225c <interrupt+0xd0>
       StdIO::console_handler();
    80002280:	00002097          	auipc	ra,0x2
    80002284:	a48080e7          	jalr	-1464(ra) # 80003cc8 <_ZN5StdIO15console_handlerEv>
    80002288:	fd5ff06f          	j	8000225c <interrupt+0xd0>
        timer_handler();      
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	828080e7          	jalr	-2008(ra) # 80001ab4 <_Z13timer_handlerv>
    80002294:	fc9ff06f          	j	8000225c <interrupt+0xd0>
        if(t<5)
    80002298:	00007797          	auipc	a5,0x7
    8000229c:	af878793          	addi	a5,a5,-1288 # 80008d90 <_ZZ9interruptE1t>
    800022a0:	0007a703          	lw	a4,0(a5)
    800022a4:	00400793          	li	a5,4
    800022a8:	fae7cae3          	blt	a5,a4,8000225c <interrupt+0xd0>
            print(scause);
    800022ac:	00100613          	li	a2,1
    800022b0:	00a00593          	li	a1,10
    800022b4:	00048513          	mv	a0,s1
    800022b8:	00001097          	auipc	ra,0x1
    800022bc:	da4080e7          	jalr	-604(ra) # 8000305c <_Z5printmcb>
            t++;
    800022c0:	00007717          	auipc	a4,0x7
    800022c4:	ad070713          	addi	a4,a4,-1328 # 80008d90 <_ZZ9interruptE1t>
    800022c8:	00072783          	lw	a5,0(a4)
    800022cc:	0017879b          	addiw	a5,a5,1
    800022d0:	00f72023          	sw	a5,0(a4)
    800022d4:	f89ff06f          	j	8000225c <interrupt+0xd0>
        if(t<10)
    800022d8:	00007797          	auipc	a5,0x7
    800022dc:	ab878793          	addi	a5,a5,-1352 # 80008d90 <_ZZ9interruptE1t>
    800022e0:	0007a703          	lw	a4,0(a5)
    800022e4:	00900793          	li	a5,9
    800022e8:	f6e7cae3          	blt	a5,a4,8000225c <interrupt+0xd0>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800022ec:	141027f3          	csrr	a5,sepc
    800022f0:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    800022f4:	fd043503          	ld	a0,-48(s0)
            print((uint64) Riscv::r_sepc());
    800022f8:	00100613          	li	a2,1
    800022fc:	00a00593          	li	a1,10
    80002300:	00001097          	auipc	ra,0x1
    80002304:	d5c080e7          	jalr	-676(ra) # 8000305c <_Z5printmcb>
            print(scause);
    80002308:	00100613          	li	a2,1
    8000230c:	00a00593          	li	a1,10
    80002310:	00048513          	mv	a0,s1
    80002314:	00001097          	auipc	ra,0x1
    80002318:	d48080e7          	jalr	-696(ra) # 8000305c <_Z5printmcb>
            t++;
    8000231c:	00007717          	auipc	a4,0x7
    80002320:	a7470713          	addi	a4,a4,-1420 # 80008d90 <_ZZ9interruptE1t>
    80002324:	00072783          	lw	a5,0(a4)
    80002328:	0017879b          	addiw	a5,a5,1
    8000232c:	00f72023          	sw	a5,0(a4)
    80002330:	f2dff06f          	j	8000225c <interrupt+0xd0>

0000000080002334 <_Z15userMainWrapperPv>:

extern "C" void interruptvec();

extern void userMain();

void userMainWrapper(void*){
    80002334:	ff010113          	addi	sp,sp,-16
    80002338:	00113423          	sd	ra,8(sp)
    8000233c:	00813023          	sd	s0,0(sp)
    80002340:	01010413          	addi	s0,sp,16
    userMain();
    80002344:	fffff097          	auipc	ra,0xfffff
    80002348:	2c0080e7          	jalr	704(ra) # 80001604 <_Z8userMainv>
}
    8000234c:	00813083          	ld	ra,8(sp)
    80002350:	00013403          	ld	s0,0(sp)
    80002354:	01010113          	addi	sp,sp,16
    80002358:	00008067          	ret

000000008000235c <_Z12idleFunctionPv>:

void idleFunction(void*){
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00113423          	sd	ra,8(sp)
    80002364:	00813023          	sd	s0,0(sp)
    80002368:	01010413          	addi	s0,sp,16
    while(1){
        thread_dispatch();
    8000236c:	00001097          	auipc	ra,0x1
    80002370:	330080e7          	jalr	816(ra) # 8000369c <thread_dispatch>
    80002374:	ff9ff06f          	j	8000236c <_Z12idleFunctionPv+0x10>

0000000080002378 <main>:
    }
}

int main(){
    80002378:	fd010113          	addi	sp,sp,-48
    8000237c:	02113423          	sd	ra,40(sp)
    80002380:	02813023          	sd	s0,32(sp)
    80002384:	00913c23          	sd	s1,24(sp)
    80002388:	01213823          	sd	s2,16(sp)
    8000238c:	03010413          	addi	s0,sp,48
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(TCB): ", sizeof(TCB), 0);
    80002390:	00000613          	li	a2,0
    80002394:	05000593          	li	a1,80
    80002398:	00005517          	auipc	a0,0x5
    8000239c:	e3050513          	addi	a0,a0,-464 # 800071c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    800023a0:	00001097          	auipc	ra,0x1
    800023a4:	ea0080e7          	jalr	-352(ra) # 80003240 <_Z5printPKcmb>
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    800023a8:	00000613          	li	a2,0
    800023ac:	04000593          	li	a1,64
    800023b0:	00005517          	auipc	a0,0x5
    800023b4:	e2850513          	addi	a0,a0,-472 # 800071d8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x120>
    800023b8:	00001097          	auipc	ra,0x1
    800023bc:	e88080e7          	jalr	-376(ra) # 80003240 <_Z5printPKcmb>
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    800023c0:	00000613          	li	a2,0
    800023c4:	00200593          	li	a1,2
    800023c8:	00005517          	auipc	a0,0x5
    800023cc:	e3050513          	addi	a0,a0,-464 # 800071f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    800023d0:	00001097          	auipc	ra,0x1
    800023d4:	e70080e7          	jalr	-400(ra) # 80003240 <_Z5printPKcmb>
    print("HEAP_START_ADDR", (uint64)HEAP_START_ADDR);
    800023d8:	00100613          	li	a2,1
    800023dc:	00006797          	auipc	a5,0x6
    800023e0:	7d478793          	addi	a5,a5,2004 # 80008bb0 <HEAP_START_ADDR>
    800023e4:	0007b583          	ld	a1,0(a5)
    800023e8:	00005517          	auipc	a0,0x5
    800023ec:	e2850513          	addi	a0,a0,-472 # 80007210 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x158>
    800023f0:	00001097          	auipc	ra,0x1
    800023f4:	e50080e7          	jalr	-432(ra) # 80003240 <_Z5printPKcmb>
    print("HEAP_END_ADDR", (uint64)HEAP_END_ADDR);
    800023f8:	00100613          	li	a2,1
    800023fc:	00006797          	auipc	a5,0x6
    80002400:	7ac78793          	addi	a5,a5,1964 # 80008ba8 <HEAP_END_ADDR>
    80002404:	0007b583          	ld	a1,0(a5)
    80002408:	00005517          	auipc	a0,0x5
    8000240c:	e1850513          	addi	a0,a0,-488 # 80007220 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x168>
    80002410:	00001097          	auipc	ra,0x1
    80002414:	e30080e7          	jalr	-464(ra) # 80003240 <_Z5printPKcmb>
    print("-------------------------------\n\n");
    80002418:	00a00593          	li	a1,10
    8000241c:	00005517          	auipc	a0,0x5
    80002420:	e1450513          	addi	a0,a0,-492 # 80007230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x178>
    80002424:	00001097          	auipc	ra,0x1
    80002428:	d84080e7          	jalr	-636(ra) # 800031a8 <_Z5printPKcc>
    
    print("kernelInit\n-------------------------------");
    8000242c:	00a00593          	li	a1,10
    80002430:	00005517          	auipc	a0,0x5
    80002434:	e2850513          	addi	a0,a0,-472 # 80007258 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1a0>
    80002438:	00001097          	auipc	ra,0x1
    8000243c:	d70080e7          	jalr	-656(ra) # 800031a8 <_Z5printPKcc>
    Scheduler::initalize();
    80002440:	00000097          	auipc	ra,0x0
    80002444:	670080e7          	jalr	1648(ra) # 80002ab0 <_ZN9Scheduler9initalizeEv>
    print("Scheduler initalized");
    80002448:	00a00593          	li	a1,10
    8000244c:	00005517          	auipc	a0,0x5
    80002450:	e3c50513          	addi	a0,a0,-452 # 80007288 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1d0>
    80002454:	00001097          	auipc	ra,0x1
    80002458:	d54080e7          	jalr	-684(ra) # 800031a8 <_Z5printPKcc>
    StdIO::initalize();
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	6cc080e7          	jalr	1740(ra) # 80003b28 <_ZN5StdIO9initalizeEv>
    print("StdIO initalized");
    80002464:	00a00593          	li	a1,10
    80002468:	00005517          	auipc	a0,0x5
    8000246c:	e3850513          	addi	a0,a0,-456 # 800072a0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1e8>
    80002470:	00001097          	auipc	ra,0x1
    80002474:	d38080e7          	jalr	-712(ra) # 800031a8 <_Z5printPKcc>
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    80002478:	00000097          	auipc	ra,0x0
    8000247c:	1b8080e7          	jalr	440(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    bool invalidFreeAddress(void* adr);
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    bool initalized(){ return init;}
    80002480:	00054783          	lbu	a5,0(a0)
    if(allocator.initalized()) print("Allocator initalized");
    80002484:	16078263          	beqz	a5,800025e8 <main+0x270>
    80002488:	00a00593          	li	a1,10
    8000248c:	00005517          	auipc	a0,0x5
    80002490:	e2c50513          	addi	a0,a0,-468 # 800072b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x200>
    80002494:	00001097          	auipc	ra,0x1
    80002498:	d14080e7          	jalr	-748(ra) # 800031a8 <_Z5printPKcc>
    else { 
        print("ERROR: allocator not initalized");
        return 0;
    }
    Riscv::w_stvec((uint64)interruptvec);
    8000249c:	fffff797          	auipc	a5,0xfffff
    800024a0:	b6478793          	addi	a5,a5,-1180 # 80001000 <interruptvec>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    return sepc;
} 

inline void Riscv::w_stvec(uint64 stvec){
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    800024a4:	10579073          	csrw	stvec,a5
    print("stvec initalized");
    800024a8:	00a00593          	li	a1,10
    800024ac:	00005517          	auipc	a0,0x5
    800024b0:	e2450513          	addi	a0,a0,-476 # 800072d0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x218>
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	cf4080e7          	jalr	-780(ra) # 800031a8 <_Z5printPKcc>

    TCB* kernelThread, * userMainThread, * idleThread;

    print("Thread making...");
    800024bc:	00a00593          	li	a1,10
    800024c0:	00005517          	auipc	a0,0x5
    800024c4:	e2850513          	addi	a0,a0,-472 # 800072e8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x230>
    800024c8:	00001097          	auipc	ra,0x1
    800024cc:	ce0080e7          	jalr	-800(ra) # 800031a8 <_Z5printPKcc>
    //mainThread
    kernelThread = TCB::createThread(nullptr);
    800024d0:	00000613          	li	a2,0
    800024d4:	00000593          	li	a1,0
    800024d8:	00000513          	li	a0,0
    800024dc:	00001097          	auipc	ra,0x1
    800024e0:	820080e7          	jalr	-2016(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    TCB::running = kernelThread;
    800024e4:	00007797          	auipc	a5,0x7
    800024e8:	8aa7be23          	sd	a0,-1860(a5) # 80008da0 <_ZN3TCB7runningE>
    if(kernelThread) print("KernelThread created");
    800024ec:	00050c63          	beqz	a0,80002504 <main+0x18c>
    800024f0:	00a00593          	li	a1,10
    800024f4:	00005517          	auipc	a0,0x5
    800024f8:	e2c50513          	addi	a0,a0,-468 # 80007320 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x268>
    800024fc:	00001097          	auipc	ra,0x1
    80002500:	cac080e7          	jalr	-852(ra) # 800031a8 <_Z5printPKcc>

    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80002504:	00001537          	lui	a0,0x1
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	0e4080e7          	jalr	228(ra) # 800035ec <_Z7kmallocm>
    80002510:	00050493          	mv	s1,a0
    userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80002514:	00050613          	mv	a2,a0
    80002518:	00000593          	li	a1,0
    8000251c:	00000517          	auipc	a0,0x0
    80002520:	e1850513          	addi	a0,a0,-488 # 80002334 <_Z15userMainWrapperPv>
    80002524:	00000097          	auipc	ra,0x0
    80002528:	7d8080e7          	jalr	2008(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000252c:	00050913          	mv	s2,a0
    if(userMainThread && userMainStack) print("UserMain thread created");
    80002530:	00050e63          	beqz	a0,8000254c <main+0x1d4>
    80002534:	00048c63          	beqz	s1,8000254c <main+0x1d4>
    80002538:	00a00593          	li	a1,10
    8000253c:	00005517          	auipc	a0,0x5
    80002540:	dfc50513          	addi	a0,a0,-516 # 80007338 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x280>
    80002544:	00001097          	auipc	ra,0x1
    80002548:	c64080e7          	jalr	-924(ra) # 800031a8 <_Z5printPKcc>

    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    8000254c:	00001537          	lui	a0,0x1
    80002550:	00001097          	auipc	ra,0x1
    80002554:	09c080e7          	jalr	156(ra) # 800035ec <_Z7kmallocm>
    80002558:	00050493          	mv	s1,a0
    idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    8000255c:	00050613          	mv	a2,a0
    80002560:	00000593          	li	a1,0
    80002564:	00000517          	auipc	a0,0x0
    80002568:	df850513          	addi	a0,a0,-520 # 8000235c <_Z12idleFunctionPv>
    8000256c:	00000097          	auipc	ra,0x0
    80002570:	790080e7          	jalr	1936(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    if(idleThread && idleThreadStack)  print("Idle thread created");
    80002574:	00050e63          	beqz	a0,80002590 <main+0x218>
    80002578:	00048c63          	beqz	s1,80002590 <main+0x218>
    8000257c:	00a00593          	li	a1,10
    80002580:	00005517          	auipc	a0,0x5
    80002584:	dd050513          	addi	a0,a0,-560 # 80007350 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x298>
    80002588:	00001097          	auipc	ra,0x1
    8000258c:	c20080e7          	jalr	-992(ra) # 800031a8 <_Z5printPKcc>

    print("Scheduler queue", ' ');
    80002590:	02000593          	li	a1,32
    80002594:	00005517          	auipc	a0,0x5
    80002598:	dd450513          	addi	a0,a0,-556 # 80007368 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2b0>
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	c0c080e7          	jalr	-1012(ra) # 800031a8 <_Z5printPKcc>
    Scheduler::print_queue();
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	53c080e7          	jalr	1340(ra) # 80002ae0 <_ZN9Scheduler11print_queueEv>
    print("-------------------------------\n\n");
    800025ac:	00a00593          	li	a1,10
    800025b0:	00005517          	auipc	a0,0x5
    800025b4:	c8050513          	addi	a0,a0,-896 # 80007230 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x178>
    800025b8:	00001097          	auipc	ra,0x1
    800025bc:	bf0080e7          	jalr	-1040(ra) # 800031a8 <_Z5printPKcc>
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    800025c0:	03892703          	lw	a4,56(s2)
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!userMainThread->isFinished())
    800025c4:	00200793          	li	a5,2
    800025c8:	02f70c63          	beq	a4,a5,80002600 <main+0x288>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800025cc:	100027f3          	csrr	a5,sstatus
    800025d0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800025d4:	fd843483          	ld	s1,-40(s0)
    {
        //print("Kernel idle thread");
        uint64 sstatus = Riscv::r_sstatus();
        TCB::yield();
    800025d8:	00001097          	auipc	ra,0x1
    800025dc:	958080e7          	jalr	-1704(ra) # 80002f30 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800025e0:	10049073          	csrw	sstatus,s1
    800025e4:	fddff06f          	j	800025c0 <main+0x248>
        print("ERROR: allocator not initalized");
    800025e8:	00a00593          	li	a1,10
    800025ec:	00005517          	auipc	a0,0x5
    800025f0:	d1450513          	addi	a0,a0,-748 # 80007300 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x248>
    800025f4:	00001097          	auipc	ra,0x1
    800025f8:	bb4080e7          	jalr	-1100(ra) # 800031a8 <_Z5printPKcc>
        return 0;
    800025fc:	0180006f          	j	80002614 <main+0x29c>
        Riscv::w_sstatus(sstatus);
    }
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    print("Kernel kraj");
    80002600:	00a00593          	li	a1,10
    80002604:	00005517          	auipc	a0,0x5
    80002608:	d7450513          	addi	a0,a0,-652 # 80007378 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2c0>
    8000260c:	00001097          	auipc	ra,0x1
    80002610:	b9c080e7          	jalr	-1124(ra) # 800031a8 <_Z5printPKcc>
    return 0;
    80002614:	00000513          	li	a0,0
    80002618:	02813083          	ld	ra,40(sp)
    8000261c:	02013403          	ld	s0,32(sp)
    80002620:	01813483          	ld	s1,24(sp)
    80002624:	01013903          	ld	s2,16(sp)
    80002628:	03010113          	addi	sp,sp,48
    8000262c:	00008067          	ret

0000000080002630 <_ZN15MemoryAllocator11getInstanceEv>:
    fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
}*/

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80002630:	ff010113          	addi	sp,sp,-16
    80002634:	00813423          	sd	s0,8(sp)
    80002638:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    8000263c:	00006797          	auipc	a5,0x6
    80002640:	7d47c783          	lbu	a5,2004(a5) # 80008e10 <_ZN15MemoryAllocator9allocatorE>
    80002644:	04079463          	bnez	a5,8000268c <_ZN15MemoryAllocator11getInstanceEv+0x5c>
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    80002648:	00006697          	auipc	a3,0x6
    8000264c:	56868693          	addi	a3,a3,1384 # 80008bb0 <HEAP_START_ADDR>
    80002650:	0006b783          	ld	a5,0(a3)
    80002654:	00006717          	auipc	a4,0x6
    80002658:	7bc70713          	addi	a4,a4,1980 # 80008e10 <_ZN15MemoryAllocator9allocatorE>
    8000265c:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    80002660:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    80002664:	00006797          	auipc	a5,0x6
    80002668:	54478793          	addi	a5,a5,1348 # 80008ba8 <HEAP_END_ADDR>
    8000266c:	0007b783          	ld	a5,0(a5)
    80002670:	0006b683          	ld	a3,0(a3)
    80002674:	40d787b3          	sub	a5,a5,a3
    80002678:	00873683          	ld	a3,8(a4)
    8000267c:	ff078793          	addi	a5,a5,-16
    80002680:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    80002684:	00100793          	li	a5,1
    80002688:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    8000268c:	00006517          	auipc	a0,0x6
    80002690:	78450513          	addi	a0,a0,1924 # 80008e10 <_ZN15MemoryAllocator9allocatorE>
    80002694:	00813403          	ld	s0,8(sp)
    80002698:	01010113          	addi	sp,sp,16
    8000269c:	00008067          	ret

00000000800026a0 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    800026a0:	ff010113          	addi	sp,sp,-16
    800026a4:	00813423          	sd	s0,8(sp)
    800026a8:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800026ac:	00853783          	ld	a5,8(a0)
    //print("Alocirano blokova: ", size, 0);
    size = size*MEM_BLOCK_SIZE;
    800026b0:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800026b4:	00000613          	li	a2,0
    800026b8:	00000893          	li	a7,0
    800026bc:	00000693          	li	a3,0
    800026c0:	0140006f          	j	800026d4 <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    800026c4:	00060893          	mv	a7,a2
                best = curr;     
    800026c8:	00078693          	mv	a3,a5
            }
        prev = curr;
    800026cc:	00078613          	mv	a2,a5
        curr = curr->next;
    800026d0:	0007b783          	ld	a5,0(a5)
    while(curr){
    800026d4:	02078263          	beqz	a5,800026f8 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    800026d8:	0087b703          	ld	a4,8(a5)
    800026dc:	feb768e3          	bltu	a4,a1,800026cc <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    800026e0:	fe0682e3          	beqz	a3,800026c4 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    800026e4:	0086b803          	ld	a6,8(a3)
    800026e8:	ff0772e3          	bgeu	a4,a6,800026cc <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    800026ec:	00060893          	mv	a7,a2
                best = curr;     
    800026f0:	00078693          	mv	a3,a5
    800026f4:	fd9ff06f          	j	800026cc <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    800026f8:	02068463          	beqz	a3,80002720 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    800026fc:	0086b783          	ld	a5,8(a3)
    80002700:	40b787b3          	sub	a5,a5,a1
    80002704:	04f00713          	li	a4,79
    80002708:	02f76a63          	bltu	a4,a5,8000273c <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        if(!best_prev) fmem_head = best->next;
    8000270c:	02088263          	beqz	a7,80002730 <_ZN15MemoryAllocator9mem_allocEm+0x90>
        else best_prev->next = best->next;
    80002710:	0006b783          	ld	a5,0(a3)
    80002714:	00f8b023          	sd	a5,0(a7)
        else fmem_head = curr;
    }

    //print((uint64)best);
    //print((uint64)best->size);
    best->next = nullptr;
    80002718:	0006b023          	sd	zero,0(a3)
    //print("Na adresi: ", (uint64)best+sizeof(FreeSegment), 0);
    //print_list();
    return (char*)best+sizeof(FreeSegment);
    8000271c:	01068693          	addi	a3,a3,16
}
    80002720:	00068513          	mv	a0,a3
    80002724:	00813403          	ld	s0,8(sp)
    80002728:	01010113          	addi	sp,sp,16
    8000272c:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80002730:	0006b783          	ld	a5,0(a3)
    80002734:	00f53423          	sd	a5,8(a0)
    80002738:	fe1ff06f          	j	80002718 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    8000273c:	01058793          	addi	a5,a1,16
    80002740:	00f687b3          	add	a5,a3,a5
        curr->next = best->next;
    80002744:	0006b703          	ld	a4,0(a3)
    80002748:	00e7b023          	sd	a4,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    8000274c:	0086b703          	ld	a4,8(a3)
    80002750:	40b70733          	sub	a4,a4,a1
    80002754:	ff070713          	addi	a4,a4,-16
    80002758:	00e7b423          	sd	a4,8(a5)
        best->size = size;
    8000275c:	00b6b423          	sd	a1,8(a3)
        if(best_prev) best_prev->next = curr;
    80002760:	00088663          	beqz	a7,8000276c <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    80002764:	00f8b023          	sd	a5,0(a7)
    80002768:	fb1ff06f          	j	80002718 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    8000276c:	00f53423          	sd	a5,8(a0)
    80002770:	fa9ff06f          	j	80002718 <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080002774 <_ZN15MemoryAllocator18invalidFreeAddressEPv>:

bool MemoryAllocator::invalidFreeAddress(void* adr){
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00813423          	sd	s0,8(sp)
    8000277c:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80002780:	00006797          	auipc	a5,0x6
    80002784:	43078793          	addi	a5,a5,1072 # 80008bb0 <HEAP_START_ADDR>
    80002788:	0007b783          	ld	a5,0(a5)
    8000278c:	04f5e063          	bltu	a1,a5,800027cc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x58>
    80002790:	00006797          	auipc	a5,0x6
    80002794:	41878793          	addi	a5,a5,1048 # 80008ba8 <HEAP_END_ADDR>
    80002798:	0007b783          	ld	a5,0(a5)
    8000279c:	04f5f063          	bgeu	a1,a5,800027dc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x68>
        return true;
    size_t t = (size_t)adr;
    for(FreeSegment* cur = fmem_head; cur; cur = cur->next)
    800027a0:	00853783          	ld	a5,8(a0)
    800027a4:	0080006f          	j	800027ac <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x38>
    800027a8:	0007b783          	ld	a5,0(a5)
    800027ac:	02078c63          	beqz	a5,800027e4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x70>
        if(t >= (size_t)cur && t < (size_t)cur+2*sizeof(FreeSegment)+cur->size)
    800027b0:	fef5ece3          	bltu	a1,a5,800027a8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
    800027b4:	0087b703          	ld	a4,8(a5)
    800027b8:	00e78733          	add	a4,a5,a4
    800027bc:	02070713          	addi	a4,a4,32
    800027c0:	fee5f4e3          	bgeu	a1,a4,800027a8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
            return true;
    800027c4:	00100513          	li	a0,1
    800027c8:	0080006f          	j	800027d0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
        return true;
    800027cc:	00100513          	li	a0,1
    return false;
}
    800027d0:	00813403          	ld	s0,8(sp)
    800027d4:	01010113          	addi	sp,sp,16
    800027d8:	00008067          	ret
        return true;
    800027dc:	00100513          	li	a0,1
    800027e0:	ff1ff06f          	j	800027d0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
    return false;
    800027e4:	00000513          	li	a0,0
    800027e8:	fe9ff06f          	j	800027d0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>

00000000800027ec <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    800027ec:	ff010113          	addi	sp,sp,-16
    800027f0:	00813423          	sd	s0,8(sp)
    800027f4:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    800027f8:	0085b703          	ld	a4,8(a1)
    800027fc:	01070793          	addi	a5,a4,16
    80002800:	00f587b3          	add	a5,a1,a5
    80002804:	0005b503          	ld	a0,0(a1)
    80002808:	00a78863          	beq	a5,a0,80002818 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    8000280c:	00813403          	ld	s0,8(sp)
    80002810:	01010113          	addi	sp,sp,16
    80002814:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80002818:	00853783          	ld	a5,8(a0)
    8000281c:	00f70733          	add	a4,a4,a5
    80002820:	01070713          	addi	a4,a4,16
    80002824:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    80002828:	00053783          	ld	a5,0(a0)
    8000282c:	00f5b023          	sd	a5,0(a1)
        return t;
    80002830:	00058513          	mv	a0,a1
    80002834:	fd9ff06f          	j	8000280c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

0000000080002838 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80002838:	fd010113          	addi	sp,sp,-48
    8000283c:	02113423          	sd	ra,40(sp)
    80002840:	02813023          	sd	s0,32(sp)
    80002844:	00913c23          	sd	s1,24(sp)
    80002848:	01213823          	sd	s2,16(sp)
    8000284c:	01313423          	sd	s3,8(sp)
    80002850:	01413023          	sd	s4,0(sp)
    80002854:	03010413          	addi	s0,sp,48
    80002858:	00050993          	mv	s3,a0
    8000285c:	00058913          	mv	s2,a1
    if(invalidFreeAddress(adr)) return -1;
    80002860:	00000097          	auipc	ra,0x0
    80002864:	f14080e7          	jalr	-236(ra) # 80002774 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002868:	0a051063          	bnez	a0,80002908 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    8000286c:	0089b783          	ld	a5,8(s3)
    80002870:	00078863          	beqz	a5,80002880 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80002874:	ff090a13          	addi	s4,s2,-16
        //print((uint64)newsgm);
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80002878:	00000493          	li	s1,0
    8000287c:	01c0006f          	j	80002898 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80002880:	ff090913          	addi	s2,s2,-16
    80002884:	0129b423          	sd	s2,8(s3)
    80002888:	0540006f          	j	800028dc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    8000288c:	00f96e63          	bltu	s2,a5,800028a8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80002890:	00078493          	mv	s1,a5
    80002894:	0007b783          	ld	a5,0(a5)
    80002898:	00078863          	beqz	a5,800028a8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    8000289c:	fe0488e3          	beqz	s1,8000288c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800028a0:	ff24f8e3          	bgeu	s1,s2,80002890 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800028a4:	fe9ff06f          	j	8000288c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        //print((ull)prev);
        newsgm->next = cur;
    800028a8:	fef93823          	sd	a5,-16(s2)
        if(cur)
    800028ac:	00078a63          	beqz	a5,800028c0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    800028b0:	000a0593          	mv	a1,s4
    800028b4:	00098513          	mv	a0,s3
    800028b8:	00000097          	auipc	ra,0x0
    800028bc:	f34080e7          	jalr	-204(ra) # 800027ec <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    800028c0:	02048e63          	beqz	s1,800028fc <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    800028c4:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    800028c8:	00048593          	mv	a1,s1
    800028cc:	00098513          	mv	a0,s3
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	f1c080e7          	jalr	-228(ra) # 800027ec <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    800028d8:	00000513          	li	a0,0
}
    800028dc:	02813083          	ld	ra,40(sp)
    800028e0:	02013403          	ld	s0,32(sp)
    800028e4:	01813483          	ld	s1,24(sp)
    800028e8:	01013903          	ld	s2,16(sp)
    800028ec:	00813983          	ld	s3,8(sp)
    800028f0:	00013a03          	ld	s4,0(sp)
    800028f4:	03010113          	addi	sp,sp,48
    800028f8:	00008067          	ret
            fmem_head = newsgm;
    800028fc:	0149b423          	sd	s4,8(s3)
    return 0;
    80002900:	00000513          	li	a0,0
    80002904:	fd9ff06f          	j	800028dc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(invalidFreeAddress(adr)) return -1;
    80002908:	fff00513          	li	a0,-1
    8000290c:	fd1ff06f          	j	800028dc <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080002910 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80002910:	fe010113          	addi	sp,sp,-32
    80002914:	00113c23          	sd	ra,24(sp)
    80002918:	00813823          	sd	s0,16(sp)
    8000291c:	00913423          	sd	s1,8(sp)
    80002920:	02010413          	addi	s0,sp,32
    80002924:	00050493          	mv	s1,a0
    //print("MEM_BLOCK_SIZE: ", ' ');
    //print(MEM_BLOCK_SIZE, '\n', 0);
    print("------Free Segment Lista------");
    80002928:	00a00593          	li	a1,10
    8000292c:	00005517          	auipc	a0,0x5
    80002930:	a5c50513          	addi	a0,a0,-1444 # 80007388 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2d0>
    80002934:	00001097          	auipc	ra,0x1
    80002938:	874080e7          	jalr	-1932(ra) # 800031a8 <_Z5printPKcc>
    if(!fmem_head)
    8000293c:	0084b783          	ld	a5,8(s1)
    80002940:	04078463          	beqz	a5,80002988 <_ZN15MemoryAllocator10print_listEv+0x78>
        print("LISTA JE PRAZNA!");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002944:	0084b483          	ld	s1,8(s1)
    80002948:	04048c63          	beqz	s1,800029a0 <_ZN15MemoryAllocator10print_listEv+0x90>
        print((uint64)curr, '\n', 0);
    8000294c:	00000613          	li	a2,0
    80002950:	00a00593          	li	a1,10
    80002954:	00048513          	mv	a0,s1
    80002958:	00000097          	auipc	ra,0x0
    8000295c:	704080e7          	jalr	1796(ra) # 8000305c <_Z5printmcb>
        print((uint64)curr->size, '\n', 0);
    80002960:	00000613          	li	a2,0
    80002964:	00a00593          	li	a1,10
    80002968:	0084b503          	ld	a0,8(s1)
    8000296c:	00000097          	auipc	ra,0x0
    80002970:	6f0080e7          	jalr	1776(ra) # 8000305c <_Z5printmcb>
        __putc('\n');
    80002974:	00a00513          	li	a0,10
    80002978:	00004097          	auipc	ra,0x4
    8000297c:	4b4080e7          	jalr	1204(ra) # 80006e2c <__putc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002980:	0004b483          	ld	s1,0(s1)
    80002984:	fc5ff06f          	j	80002948 <_ZN15MemoryAllocator10print_listEv+0x38>
        print("LISTA JE PRAZNA!");
    80002988:	00a00593          	li	a1,10
    8000298c:	00005517          	auipc	a0,0x5
    80002990:	a1c50513          	addi	a0,a0,-1508 # 800073a8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x2f0>
    80002994:	00001097          	auipc	ra,0x1
    80002998:	814080e7          	jalr	-2028(ra) # 800031a8 <_Z5printPKcc>
    8000299c:	fa9ff06f          	j	80002944 <_ZN15MemoryAllocator10print_listEv+0x34>
    }
    print("------------------------------");
    800029a0:	00a00593          	li	a1,10
    800029a4:	00005517          	auipc	a0,0x5
    800029a8:	a1c50513          	addi	a0,a0,-1508 # 800073c0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x308>
    800029ac:	00000097          	auipc	ra,0x0
    800029b0:	7fc080e7          	jalr	2044(ra) # 800031a8 <_Z5printPKcc>
}
    800029b4:	01813083          	ld	ra,24(sp)
    800029b8:	01013403          	ld	s0,16(sp)
    800029bc:	00813483          	ld	s1,8(sp)
    800029c0:	02010113          	addi	sp,sp,32
    800029c4:	00008067          	ret

00000000800029c8 <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    800029c8:	ff010113          	addi	sp,sp,-16
    800029cc:	00813423          	sd	s0,8(sp)
    800029d0:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    800029d4:	00852683          	lw	a3,8(a0)
    800029d8:	0085a703          	lw	a4,8(a1)
    800029dc:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    800029e0:	0007cc63          	bltz	a5,800029f8 <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    800029e4:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    800029e8:	00078513          	mv	a0,a5
    800029ec:	00813403          	ld	s0,8(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret
        x2->sleep_time = -diff;
    800029f8:	40d7073b          	subw	a4,a4,a3
    800029fc:	00e5b423          	sd	a4,8(a1)
    80002a00:	fe9ff06f          	j	800029e8 <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

0000000080002a04 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    80002a04:	ff010113          	addi	sp,sp,-16
    80002a08:	00813423          	sd	s0,8(sp)
    80002a0c:	01010413          	addi	s0,sp,16
    80002a10:	00100793          	li	a5,1
    80002a14:	00f50863          	beq	a0,a5,80002a24 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002a18:	00813403          	ld	s0,8(sp)
    80002a1c:	01010113          	addi	sp,sp,16
    80002a20:	00008067          	ret
    80002a24:	000107b7          	lui	a5,0x10
    80002a28:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002a2c:	fef596e3          	bne	a1,a5,80002a18 <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80002a30:	00006797          	auipc	a5,0x6
    80002a34:	3f078793          	addi	a5,a5,1008 # 80008e20 <_ZN9Scheduler5queueE>
    80002a38:	0007b023          	sd	zero,0(a5)
    80002a3c:	0007b423          	sd	zero,8(a5)
    80002a40:	0007b823          	sd	zero,16(a5)
    80002a44:	0007bc23          	sd	zero,24(a5)
    80002a48:	fd1ff06f          	j	80002a18 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002a4c <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80002a4c:	ff010113          	addi	sp,sp,-16
    80002a50:	00113423          	sd	ra,8(sp)
    80002a54:	00813023          	sd	s0,0(sp)
    80002a58:	01010413          	addi	s0,sp,16
    80002a5c:	00006517          	auipc	a0,0x6
    80002a60:	3c450513          	addi	a0,a0,964 # 80008e20 <_ZN9Scheduler5queueE>
    80002a64:	00001097          	auipc	ra,0x1
    80002a68:	71c080e7          	jalr	1820(ra) # 80004180 <_ZN8TcbQueue6removeEv>
    80002a6c:	00813083          	ld	ra,8(sp)
    80002a70:	00013403          	ld	s0,0(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret

0000000080002a7c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    80002a7c:	ff010113          	addi	sp,sp,-16
    80002a80:	00113423          	sd	ra,8(sp)
    80002a84:	00813023          	sd	s0,0(sp)
    80002a88:	01010413          	addi	s0,sp,16
    80002a8c:	00050593          	mv	a1,a0
    80002a90:	00006517          	auipc	a0,0x6
    80002a94:	39050513          	addi	a0,a0,912 # 80008e20 <_ZN9Scheduler5queueE>
    80002a98:	00001097          	auipc	ra,0x1
    80002a9c:	6b4080e7          	jalr	1716(ra) # 8000414c <_ZN8TcbQueue6insertEP3TCB>
    80002aa0:	00813083          	ld	ra,8(sp)
    80002aa4:	00013403          	ld	s0,0(sp)
    80002aa8:	01010113          	addi	sp,sp,16
    80002aac:	00008067          	ret

0000000080002ab0 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    80002ab0:	ff010113          	addi	sp,sp,-16
    80002ab4:	00813423          	sd	s0,8(sp)
    80002ab8:	01010413          	addi	s0,sp,16
    80002abc:	00813403          	ld	s0,8(sp)
    80002ac0:	01010113          	addi	sp,sp,16
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    80002ac8:	ff010113          	addi	sp,sp,-16
    80002acc:	00813423          	sd	s0,8(sp)
    80002ad0:	01010413          	addi	s0,sp,16
    80002ad4:	00813403          	ld	s0,8(sp)
    80002ad8:	01010113          	addi	sp,sp,16
    80002adc:	00008067          	ret

0000000080002ae0 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    80002ae0:	ff010113          	addi	sp,sp,-16
    80002ae4:	00113423          	sd	ra,8(sp)
    80002ae8:	00813023          	sd	s0,0(sp)
    80002aec:	01010413          	addi	s0,sp,16
    80002af0:	00006517          	auipc	a0,0x6
    80002af4:	33050513          	addi	a0,a0,816 # 80008e20 <_ZN9Scheduler5queueE>
    80002af8:	00001097          	auipc	ra,0x1
    80002afc:	6e8080e7          	jalr	1768(ra) # 800041e0 <_ZN8TcbQueue10printQueueEv>
    80002b00:	00813083          	ld	ra,8(sp)
    80002b04:	00013403          	ld	s0,0(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    80002b10:	ff010113          	addi	sp,sp,-16
    80002b14:	00113423          	sd	ra,8(sp)
    80002b18:	00813023          	sd	s0,0(sp)
    80002b1c:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    80002b20:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80002b24:	00000617          	auipc	a2,0x0
    80002b28:	ea460613          	addi	a2,a2,-348 # 800029c8 <_ZN9Scheduler3cmpEP3TCBS1_>
    80002b2c:	00050593          	mv	a1,a0
    80002b30:	00006517          	auipc	a0,0x6
    80002b34:	30050513          	addi	a0,a0,768 # 80008e30 <_ZN9Scheduler8sleepingE>
    80002b38:	00001097          	auipc	ra,0x1
    80002b3c:	71c080e7          	jalr	1820(ra) # 80004254 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80002b40:	00813083          	ld	ra,8(sp)
    80002b44:	00013403          	ld	s0,0(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <_ZN9Scheduler12update_sleepEv>:
{
    80002b50:	fe010113          	addi	sp,sp,-32
    80002b54:	00113c23          	sd	ra,24(sp)
    80002b58:	00813823          	sd	s0,16(sp)
    80002b5c:	00913423          	sd	s1,8(sp)
    80002b60:	01213023          	sd	s2,0(sp)
    80002b64:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    80002b68:	00006517          	auipc	a0,0x6
    80002b6c:	2c850513          	addi	a0,a0,712 # 80008e30 <_ZN9Scheduler8sleepingE>
    80002b70:	00001097          	auipc	ra,0x1
    80002b74:	654080e7          	jalr	1620(ra) # 800041c4 <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    80002b78:	04050e63          	beqz	a0,80002bd4 <_ZN9Scheduler12update_sleepEv+0x84>
    80002b7c:	00050493          	mv	s1,a0
    t->sleep_time--;
    80002b80:	00853783          	ld	a5,8(a0)
    80002b84:	fff78793          	addi	a5,a5,-1
    80002b88:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    80002b8c:	04048463          	beqz	s1,80002bd4 <_ZN9Scheduler12update_sleepEv+0x84>
    80002b90:	0084b783          	ld	a5,8(s1)
    80002b94:	04079063          	bnez	a5,80002bd4 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    80002b98:	00006917          	auipc	s2,0x6
    80002b9c:	29890913          	addi	s2,s2,664 # 80008e30 <_ZN9Scheduler8sleepingE>
    80002ba0:	00090513          	mv	a0,s2
    80002ba4:	00001097          	auipc	ra,0x1
    80002ba8:	5dc080e7          	jalr	1500(ra) # 80004180 <_ZN8TcbQueue6removeEv>
        if(!allocator.invalidFreeAddress(this))
            allocator.mem_free(stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    80002bac:	00100793          	li	a5,1
    80002bb0:	02f4ac23          	sw	a5,56(s1)
        put(t);
    80002bb4:	00048513          	mv	a0,s1
    80002bb8:	00000097          	auipc	ra,0x0
    80002bbc:	ec4080e7          	jalr	-316(ra) # 80002a7c <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    80002bc0:	00090513          	mv	a0,s2
    80002bc4:	00001097          	auipc	ra,0x1
    80002bc8:	600080e7          	jalr	1536(ra) # 800041c4 <_ZN8TcbQueue3topEv>
    80002bcc:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    80002bd0:	fbdff06f          	j	80002b8c <_ZN9Scheduler12update_sleepEv+0x3c>
    80002bd4:	01813083          	ld	ra,24(sp)
    80002bd8:	01013403          	ld	s0,16(sp)
    80002bdc:	00813483          	ld	s1,8(sp)
    80002be0:	00013903          	ld	s2,0(sp)
    80002be4:	02010113          	addi	sp,sp,32
    80002be8:	00008067          	ret

0000000080002bec <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80002bec:	ff010113          	addi	sp,sp,-16
    80002bf0:	00113423          	sd	ra,8(sp)
    80002bf4:	00813023          	sd	s0,0(sp)
    80002bf8:	01010413          	addi	s0,sp,16
    80002bfc:	000105b7          	lui	a1,0x10
    80002c00:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002c04:	00100513          	li	a0,1
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	dfc080e7          	jalr	-516(ra) # 80002a04 <_Z41__static_initialization_and_destruction_0ii>
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00013403          	ld	s0,0(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN5Riscv10popSppSpieEv>:

TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

void Riscv::popSppSpie() 
{
    80002c20:	ff010113          	addi	sp,sp,-16
    80002c24:	00813423          	sd	s0,8(sp)
    80002c28:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002c2c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002c30:	10200073          	sret
}
    80002c34:	00813403          	ld	s0,8(sp)
    80002c38:	01010113          	addi	sp,sp,16
    80002c3c:	00008067          	ret

0000000080002c40 <_ZN3TCBC1EPFvPvES0_Pmm>:
TCB* TCB::createThread(Body body, void* args, uint64* stack)
{
    return new TCB(body, args, stack);
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80002c40:	fe010113          	addi	sp,sp,-32
    80002c44:	00113c23          	sd	ra,24(sp)
    80002c48:	00813823          	sd	s0,16(sp)
    80002c4c:	00913423          	sd	s1,8(sp)
    80002c50:	02010413          	addi	s0,sp,32
    80002c54:	00050493          	mv	s1,a0
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80002c58:	00053023          	sd	zero,0(a0)
    80002c5c:	00053423          	sd	zero,8(a0)
    80002c60:	00b53c23          	sd	a1,24(a0)
    80002c64:	02c53023          	sd	a2,32(a0)
    80002c68:	02d53423          	sd	a3,40(a0)
    80002c6c:	02e53823          	sd	a4,48(a0)
    80002c70:	00100793          	li	a5,1
    80002c74:	02f52c23          	sw	a5,56(a0)
    80002c78:	02050e23          	sb	zero,60(a0)
    80002c7c:	02f50ea3          	sb	a5,61(a0)
    80002c80:	02050f23          	sb	zero,62(a0)
    80002c84:	00000797          	auipc	a5,0x0
    80002c88:	17c78793          	addi	a5,a5,380 # 80002e00 <_ZN3TCB13threadWrapperEv>
    80002c8c:	04f53023          	sd	a5,64(a0)
    80002c90:	06068263          	beqz	a3,80002cf4 <_ZN3TCBC1EPFvPvES0_Pmm+0xb4>
    80002c94:	000017b7          	lui	a5,0x1
    80002c98:	00f686b3          	add	a3,a3,a5
    80002c9c:	04d4b423          	sd	a3,72(s1)
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	990080e7          	jalr	-1648(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002ca8:	00100593          	li	a1,1
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	9f4080e7          	jalr	-1548(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80002cb4:	00052023          	sw	zero,0(a0)
    80002cb8:	00053423          	sd	zero,8(a0)
    80002cbc:	00053823          	sd	zero,16(a0)
{    
    out_sem = new KSemaphore(0);
    80002cc0:	00a4b823          	sd	a0,16(s1)
    if(body && stack)
    80002cc4:	0184b783          	ld	a5,24(s1)
    80002cc8:	00078c63          	beqz	a5,80002ce0 <_ZN3TCBC1EPFvPvES0_Pmm+0xa0>
    80002ccc:	0284b783          	ld	a5,40(s1)
    80002cd0:	00078863          	beqz	a5,80002ce0 <_ZN3TCBC1EPFvPvES0_Pmm+0xa0>
        Scheduler::put(this);
    80002cd4:	00048513          	mv	a0,s1
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	da4080e7          	jalr	-604(ra) # 80002a7c <_ZN9Scheduler3putEP3TCB>
}   
    80002ce0:	01813083          	ld	ra,24(sp)
    80002ce4:	01013403          	ld	s0,16(sp)
    80002ce8:	00813483          	ld	s1,8(sp)
    80002cec:	02010113          	addi	sp,sp,32
    80002cf0:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80002cf4:	00000693          	li	a3,0
    80002cf8:	fa5ff06f          	j	80002c9c <_ZN3TCBC1EPFvPvES0_Pmm+0x5c>

0000000080002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80002cfc:	fd010113          	addi	sp,sp,-48
    80002d00:	02113423          	sd	ra,40(sp)
    80002d04:	02813023          	sd	s0,32(sp)
    80002d08:	00913c23          	sd	s1,24(sp)
    80002d0c:	01213823          	sd	s2,16(sp)
    80002d10:	01313423          	sd	s3,8(sp)
    80002d14:	01413023          	sd	s4,0(sp)
    80002d18:	03010413          	addi	s0,sp,48
    80002d1c:	00050913          	mv	s2,a0
    80002d20:	00058993          	mv	s3,a1
    80002d24:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002d28:	00000097          	auipc	ra,0x0
    80002d2c:	908080e7          	jalr	-1784(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002d30:	00200593          	li	a1,2
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	96c080e7          	jalr	-1684(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    80002d3c:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    80002d40:	00200713          	li	a4,2
    80002d44:	000a0693          	mv	a3,s4
    80002d48:	00098613          	mv	a2,s3
    80002d4c:	00090593          	mv	a1,s2
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	ef0080e7          	jalr	-272(ra) # 80002c40 <_ZN3TCBC1EPFvPvES0_Pmm>
    80002d58:	0280006f          	j	80002d80 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80002d5c:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	8d0080e7          	jalr	-1840(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002d68:	00048593          	mv	a1,s1
    80002d6c:	00000097          	auipc	ra,0x0
    80002d70:	acc080e7          	jalr	-1332(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80002d74:	00090513          	mv	a0,s2
    80002d78:	00007097          	auipc	ra,0x7
    80002d7c:	190080e7          	jalr	400(ra) # 80009f08 <_Unwind_Resume>
}
    80002d80:	00048513          	mv	a0,s1
    80002d84:	02813083          	ld	ra,40(sp)
    80002d88:	02013403          	ld	s0,32(sp)
    80002d8c:	01813483          	ld	s1,24(sp)
    80002d90:	01013903          	ld	s2,16(sp)
    80002d94:	00813983          	ld	s3,8(sp)
    80002d98:	00013a03          	ld	s4,0(sp)
    80002d9c:	03010113          	addi	sp,sp,48
    80002da0:	00008067          	ret

0000000080002da4 <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    80002da4:	ff010113          	addi	sp,sp,-16
    80002da8:	00813423          	sd	s0,8(sp)
    80002dac:	01010413          	addi	s0,sp,16
    if(running->userMode)
    80002db0:	00006797          	auipc	a5,0x6
    80002db4:	ff078793          	addi	a5,a5,-16 # 80008da0 <_ZN3TCB7runningE>
    80002db8:	0007b783          	ld	a5,0(a5)
    80002dbc:	03d7c703          	lbu	a4,61(a5)
    80002dc0:	00070c63          	beqz	a4,80002dd8 <_ZN3TCB9initalizeEv+0x34>
inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask){
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002dc4:	10000793          	li	a5,256
    80002dc8:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    80002dcc:	00813403          	ld	s0,8(sp)
    80002dd0:	01010113          	addi	sp,sp,16
    80002dd4:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002dd8:	10000713          	li	a4,256
    80002ddc:	10072073          	csrs	sstatus,a4
        if(running->locked)
    80002de0:	03e7c783          	lbu	a5,62(a5)
    80002de4:	00078863          	beqz	a5,80002df4 <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002de8:	02000793          	li	a5,32
    80002dec:	1007b073          	csrc	sstatus,a5
    80002df0:	fddff06f          	j	80002dcc <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002df4:	02000793          	li	a5,32
    80002df8:	1007a073          	csrs	sstatus,a5
}
    80002dfc:	fd1ff06f          	j	80002dcc <_ZN3TCB9initalizeEv+0x28>

0000000080002e00 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    80002e00:	ff010113          	addi	sp,sp,-16
    80002e04:	00113423          	sd	ra,8(sp)
    80002e08:	00813023          	sd	s0,0(sp)
    80002e0c:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    80002e10:	00000097          	auipc	ra,0x0
    80002e14:	f94080e7          	jalr	-108(ra) # 80002da4 <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	e08080e7          	jalr	-504(ra) # 80002c20 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80002e20:	00006797          	auipc	a5,0x6
    80002e24:	f8078793          	addi	a5,a5,-128 # 80008da0 <_ZN3TCB7runningE>
    80002e28:	0007b783          	ld	a5,0(a5)
    80002e2c:	0187b703          	ld	a4,24(a5)
    80002e30:	0207b503          	ld	a0,32(a5)
    80002e34:	000700e7          	jalr	a4
    thread_exit();
    80002e38:	00001097          	auipc	ra,0x1
    80002e3c:	91c080e7          	jalr	-1764(ra) # 80003754 <thread_exit>
}
    80002e40:	00813083          	ld	ra,8(sp)
    80002e44:	00013403          	ld	s0,0(sp)
    80002e48:	01010113          	addi	sp,sp,16
    80002e4c:	00008067          	ret

0000000080002e50 <_ZN3TCB8dispatchEv>:

void TCB::dispatch()
{
    80002e50:	fe010113          	addi	sp,sp,-32
    80002e54:	00113c23          	sd	ra,24(sp)
    80002e58:	00813823          	sd	s0,16(sp)
    80002e5c:	00913423          	sd	s1,8(sp)
    80002e60:	01213023          	sd	s2,0(sp)
    80002e64:	02010413          	addi	s0,sp,32
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    80002e68:	00006797          	auipc	a5,0x6
    80002e6c:	f3878793          	addi	a5,a5,-200 # 80008da0 <_ZN3TCB7runningE>
    80002e70:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80002e74:	0384a783          	lw	a5,56(s1)
    
    if(!oldRunning->isFinished() && !oldRunning->isSuspended())
    80002e78:	00200713          	li	a4,2
    80002e7c:	02e78063          	beq	a5,a4,80002e9c <_ZN3TCB8dispatchEv+0x4c>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80002e80:	00078e63          	beqz	a5,80002e9c <_ZN3TCB8dispatchEv+0x4c>
    80002e84:	00300713          	li	a4,3
    80002e88:	00e78a63          	beq	a5,a4,80002e9c <_ZN3TCB8dispatchEv+0x4c>
    {
        Scheduler::put(oldRunning);
    80002e8c:	00048513          	mv	a0,s1
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	bec080e7          	jalr	-1044(ra) # 80002a7c <_ZN9Scheduler3putEP3TCB>
    80002e98:	00c0006f          	j	80002ea4 <_ZN3TCB8dispatchEv+0x54>
    }
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    80002e9c:	00200713          	li	a4,2
    80002ea0:	02e78e63          	beq	a5,a4,80002edc <_ZN3TCB8dispatchEv+0x8c>
    {
        delete oldRunning;
    }
    running = Scheduler::get(); 
    80002ea4:	00000097          	auipc	ra,0x0
    80002ea8:	ba8080e7          	jalr	-1112(ra) # 80002a4c <_ZN9Scheduler3getEv>
    80002eac:	00006797          	auipc	a5,0x6
    80002eb0:	eea7ba23          	sd	a0,-268(a5) # 80008da0 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80002eb4:	04050593          	addi	a1,a0,64
    80002eb8:	04048513          	addi	a0,s1,64
    80002ebc:	ffffe097          	auipc	ra,0xffffe
    80002ec0:	254080e7          	jalr	596(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ec4:	01813083          	ld	ra,24(sp)
    80002ec8:	01013403          	ld	s0,16(sp)
    80002ecc:	00813483          	ld	s1,8(sp)
    80002ed0:	00013903          	ld	s2,0(sp)
    80002ed4:	02010113          	addi	sp,sp,32
    80002ed8:	00008067          	ret
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    80002edc:	03c4c783          	lbu	a5,60(s1)
    80002ee0:	fc0782e3          	beqz	a5,80002ea4 <_ZN3TCB8dispatchEv+0x54>
        delete oldRunning;
    80002ee4:	fc0480e3          	beqz	s1,80002ea4 <_ZN3TCB8dispatchEv+0x54>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80002ee8:	fffff097          	auipc	ra,0xfffff
    80002eec:	748080e7          	jalr	1864(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002ef0:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    80002ef4:	00048593          	mv	a1,s1
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	87c080e7          	jalr	-1924(ra) # 80002774 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002f00:	00050e63          	beqz	a0,80002f1c <_ZN3TCB8dispatchEv+0xcc>
    80002f04:	fffff097          	auipc	ra,0xfffff
    80002f08:	72c080e7          	jalr	1836(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002f0c:	00048593          	mv	a1,s1
    80002f10:	00000097          	auipc	ra,0x0
    80002f14:	928080e7          	jalr	-1752(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80002f18:	f8dff06f          	j	80002ea4 <_ZN3TCB8dispatchEv+0x54>
            allocator.mem_free(stack);
    80002f1c:	0284b583          	ld	a1,40(s1)
    80002f20:	00090513          	mv	a0,s2
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	914080e7          	jalr	-1772(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80002f2c:	fd9ff06f          	j	80002f04 <_ZN3TCB8dispatchEv+0xb4>

0000000080002f30 <_ZN3TCB5yieldEv>:
{
    80002f30:	ff010113          	addi	sp,sp,-16
    80002f34:	00113423          	sd	ra,8(sp)
    80002f38:	00813023          	sd	s0,0(sp)
    80002f3c:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002f40:	ffffe097          	auipc	ra,0xffffe
    80002f44:	1e4080e7          	jalr	484(ra) # 80001124 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80002f48:	00000097          	auipc	ra,0x0
    80002f4c:	f08080e7          	jalr	-248(ra) # 80002e50 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002f50:	ffffe097          	auipc	ra,0xffffe
    80002f54:	250080e7          	jalr	592(ra) # 800011a0 <_ZN5Riscv12popRegistersEv>
}
    80002f58:	00813083          	ld	ra,8(sp)
    80002f5c:	00013403          	ld	s0,0(sp)
    80002f60:	01010113          	addi	sp,sp,16
    80002f64:	00008067          	ret

0000000080002f68 <_ZN3TCB12deleteThreadEPS_>:

void TCB::deleteThread(TCB* t)
{
    if(t)
    80002f68:	0a050263          	beqz	a0,8000300c <_ZN3TCB12deleteThreadEPS_+0xa4>
    {
        if(running != t && t->isFinished())
    80002f6c:	00006797          	auipc	a5,0x6
    80002f70:	e3478793          	addi	a5,a5,-460 # 80008da0 <_ZN3TCB7runningE>
    80002f74:	0007b783          	ld	a5,0(a5)
    80002f78:	00a78863          	beq	a5,a0,80002f88 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    80002f7c:	03852703          	lw	a4,56(a0)
    80002f80:	00200793          	li	a5,2
    80002f84:	00f70863          	beq	a4,a5,80002f94 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    80002f88:	00100793          	li	a5,1
    80002f8c:	02f50e23          	sb	a5,60(a0)
        }        
    }
}
    80002f90:	00008067          	ret
{
    80002f94:	fe010113          	addi	sp,sp,-32
    80002f98:	00113c23          	sd	ra,24(sp)
    80002f9c:	00813823          	sd	s0,16(sp)
    80002fa0:	00913423          	sd	s1,8(sp)
    80002fa4:	01213023          	sd	s2,0(sp)
    80002fa8:	02010413          	addi	s0,sp,32
    80002fac:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	680080e7          	jalr	1664(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002fb8:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    80002fbc:	00048593          	mv	a1,s1
    80002fc0:	fffff097          	auipc	ra,0xfffff
    80002fc4:	7b4080e7          	jalr	1972(ra) # 80002774 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002fc8:	02050863          	beqz	a0,80002ff8 <_ZN3TCB12deleteThreadEPS_+0x90>
    80002fcc:	fffff097          	auipc	ra,0xfffff
    80002fd0:	664080e7          	jalr	1636(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80002fd4:	00048593          	mv	a1,s1
    80002fd8:	00000097          	auipc	ra,0x0
    80002fdc:	860080e7          	jalr	-1952(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002fe0:	01813083          	ld	ra,24(sp)
    80002fe4:	01013403          	ld	s0,16(sp)
    80002fe8:	00813483          	ld	s1,8(sp)
    80002fec:	00013903          	ld	s2,0(sp)
    80002ff0:	02010113          	addi	sp,sp,32
    80002ff4:	00008067          	ret
            allocator.mem_free(stack);
    80002ff8:	0284b583          	ld	a1,40(s1)
    80002ffc:	00090513          	mv	a0,s2
    80003000:	00000097          	auipc	ra,0x0
    80003004:	838080e7          	jalr	-1992(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    80003008:	fc5ff06f          	j	80002fcc <_ZN3TCB12deleteThreadEPS_+0x64>
    8000300c:	00008067          	ret

0000000080003010 <_ZN3TCB5sleepEm>:

void TCB::sleep(time_t t)
{
    80003010:	ff010113          	addi	sp,sp,-16
    80003014:	00113423          	sd	ra,8(sp)
    80003018:	00813023          	sd	s0,0(sp)
    8000301c:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80003020:	00006797          	auipc	a5,0x6
    80003024:	d8078793          	addi	a5,a5,-640 # 80008da0 <_ZN3TCB7runningE>
    80003028:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    8000302c:	00300713          	li	a4,3
    80003030:	02e7ac23          	sw	a4,56(a5)
    Scheduler::put_sleeper(running, t);
    80003034:	00050593          	mv	a1,a0
    80003038:	00078513          	mv	a0,a5
    8000303c:	00000097          	auipc	ra,0x0
    80003040:	ad4080e7          	jalr	-1324(ra) # 80002b10 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80003044:	00000097          	auipc	ra,0x0
    80003048:	eec080e7          	jalr	-276(ra) # 80002f30 <_ZN3TCB5yieldEv>
    8000304c:	00813083          	ld	ra,8(sp)
    80003050:	00013403          	ld	s0,0(sp)
    80003054:	01010113          	addi	sp,sp,16
    80003058:	00008067          	ret

000000008000305c <_Z5printmcb>:
#include"../../h/testing.hpp"
#include"../../h/tcb.hpp"
void print(uint64 unum, char end, bool hex){
    8000305c:	fa010113          	addi	sp,sp,-96
    80003060:	04113c23          	sd	ra,88(sp)
    80003064:	04813823          	sd	s0,80(sp)
    80003068:	04913423          	sd	s1,72(sp)
    8000306c:	05213023          	sd	s2,64(sp)
    80003070:	03313c23          	sd	s3,56(sp)
    80003074:	03413823          	sd	s4,48(sp)
    80003078:	06010413          	addi	s0,sp,96
    8000307c:	00050913          	mv	s2,a0
    80003080:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003084:	100027f3          	csrr	a5,sstatus
    80003088:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    8000308c:	fa843983          	ld	s3,-88(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003090:	00200793          	li	a5,2
    80003094:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    80003098:	04061e63          	bnez	a2,800030f4 <_Z5printmcb+0x98>
    int i = 0;
    8000309c:	00000493          	li	s1,0
    800030a0:	00c0006f          	j	800030ac <_Z5printmcb+0x50>
    do{
        buffer[i++] = '0' + unum1%10;
    800030a4:	00060493          	mv	s1,a2
        unum1/=10;
    800030a8:	00078913          	mv	s2,a5
        buffer[i++] = '0' + unum1%10;
    800030ac:	00a00793          	li	a5,10
    800030b0:	02f97733          	remu	a4,s2,a5
    800030b4:	0014861b          	addiw	a2,s1,1
    800030b8:	03070713          	addi	a4,a4,48
    800030bc:	fd040693          	addi	a3,s0,-48
    800030c0:	009686b3          	add	a3,a3,s1
    800030c4:	fee68023          	sb	a4,-32(a3)
        unum1/=10;
    800030c8:	02f957b3          	divu	a5,s2,a5
    }while(unum1 > 0);
    800030cc:	00900713          	li	a4,9
    800030d0:	fd276ae3          	bltu	a4,s2,800030a4 <_Z5printmcb+0x48>
    for(int j = i-1; j >= 0; j--)
    800030d4:	0804cc63          	bltz	s1,8000316c <_Z5printmcb+0x110>
        __putc(buffer[j]);
    800030d8:	fd040793          	addi	a5,s0,-48
    800030dc:	009787b3          	add	a5,a5,s1
    800030e0:	fe07c503          	lbu	a0,-32(a5)
    800030e4:	00004097          	auipc	ra,0x4
    800030e8:	d48080e7          	jalr	-696(ra) # 80006e2c <__putc>
    for(int j = i-1; j >= 0; j--)
    800030ec:	fff4849b          	addiw	s1,s1,-1
    800030f0:	fe5ff06f          	j	800030d4 <_Z5printmcb+0x78>
    }else{
    //__putc('\n');
    __putc('0');
    800030f4:	03000513          	li	a0,48
    800030f8:	00004097          	auipc	ra,0x4
    800030fc:	d34080e7          	jalr	-716(ra) # 80006e2c <__putc>
    __putc('x');
    80003100:	07800513          	li	a0,120
    80003104:	00004097          	auipc	ra,0x4
    80003108:	d28080e7          	jalr	-728(ra) # 80006e2c <__putc>
    
    const char* numbers = "0123456789ABCDEF";
    unum1 = unum;
    i = 0;
    8000310c:	00000493          	li	s1,0
    80003110:	00c0006f          	j	8000311c <_Z5printmcb+0xc0>
    do{
        buffer[i++] = numbers[unum1%16];
    80003114:	00068493          	mv	s1,a3
        unum1/=16;
    80003118:	00070913          	mv	s2,a4
        buffer[i++] = numbers[unum1%16];
    8000311c:	00f97793          	andi	a5,s2,15
    80003120:	0014869b          	addiw	a3,s1,1
    80003124:	00004717          	auipc	a4,0x4
    80003128:	2bc70713          	addi	a4,a4,700 # 800073e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x328>
    8000312c:	00e787b3          	add	a5,a5,a4
    80003130:	0007c703          	lbu	a4,0(a5)
    80003134:	fd040793          	addi	a5,s0,-48
    80003138:	009787b3          	add	a5,a5,s1
    8000313c:	fee78023          	sb	a4,-32(a5)
        unum1/=16;
    80003140:	00495713          	srli	a4,s2,0x4
    } while(unum1 > 0);
    80003144:	00f00793          	li	a5,15
    80003148:	fd27e6e3          	bltu	a5,s2,80003114 <_Z5printmcb+0xb8>
    for(int j = i-1; j >= 0; j--)
    8000314c:	0204c063          	bltz	s1,8000316c <_Z5printmcb+0x110>
        __putc(buffer[j]);
    80003150:	fd040793          	addi	a5,s0,-48
    80003154:	009787b3          	add	a5,a5,s1
    80003158:	fe07c503          	lbu	a0,-32(a5)
    8000315c:	00004097          	auipc	ra,0x4
    80003160:	cd0080e7          	jalr	-816(ra) # 80006e2c <__putc>
    for(int j = i-1; j >= 0; j--)
    80003164:	fff4849b          	addiw	s1,s1,-1
    80003168:	fe5ff06f          	j	8000314c <_Z5printmcb+0xf0>
    }
    __putc(end);
    8000316c:	000a0513          	mv	a0,s4
    80003170:	00004097          	auipc	ra,0x4
    80003174:	cbc080e7          	jalr	-836(ra) # 80006e2c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80003178:	0009899b          	sext.w	s3,s3
    8000317c:	0029f993          	andi	s3,s3,2
    80003180:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80003184:	1009a073          	csrs	sstatus,s3
}
    80003188:	05813083          	ld	ra,88(sp)
    8000318c:	05013403          	ld	s0,80(sp)
    80003190:	04813483          	ld	s1,72(sp)
    80003194:	04013903          	ld	s2,64(sp)
    80003198:	03813983          	ld	s3,56(sp)
    8000319c:	03013a03          	ld	s4,48(sp)
    800031a0:	06010113          	addi	sp,sp,96
    800031a4:	00008067          	ret

00000000800031a8 <_Z5printPKcc>:

void print(const char* str, char end){
    800031a8:	fc010113          	addi	sp,sp,-64
    800031ac:	02113c23          	sd	ra,56(sp)
    800031b0:	02813823          	sd	s0,48(sp)
    800031b4:	02913423          	sd	s1,40(sp)
    800031b8:	03213023          	sd	s2,32(sp)
    800031bc:	01313c23          	sd	s3,24(sp)
    800031c0:	01413823          	sd	s4,16(sp)
    800031c4:	04010413          	addi	s0,sp,64
    800031c8:	00050913          	mv	s2,a0
    800031cc:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800031d0:	100027f3          	csrr	a5,sstatus
    800031d4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800031d8:	fc843983          	ld	s3,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800031dc:	00200793          	li	a5,2
    800031e0:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
    800031e4:	00000493          	li	s1,0
    800031e8:	009907b3          	add	a5,s2,s1
    800031ec:	0007c503          	lbu	a0,0(a5)
    800031f0:	00050a63          	beqz	a0,80003204 <_Z5printPKcc+0x5c>
        __putc(str[i]);
    800031f4:	00004097          	auipc	ra,0x4
    800031f8:	c38080e7          	jalr	-968(ra) # 80006e2c <__putc>
    for(int i = 0; str[i]; i++)
    800031fc:	0014849b          	addiw	s1,s1,1
    80003200:	fe9ff06f          	j	800031e8 <_Z5printPKcc+0x40>
    __putc(end);
    80003204:	000a0513          	mv	a0,s4
    80003208:	00004097          	auipc	ra,0x4
    8000320c:	c24080e7          	jalr	-988(ra) # 80006e2c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80003210:	0009899b          	sext.w	s3,s3
    80003214:	0029f993          	andi	s3,s3,2
    80003218:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    8000321c:	1009a073          	csrs	sstatus,s3

}
    80003220:	03813083          	ld	ra,56(sp)
    80003224:	03013403          	ld	s0,48(sp)
    80003228:	02813483          	ld	s1,40(sp)
    8000322c:	02013903          	ld	s2,32(sp)
    80003230:	01813983          	ld	s3,24(sp)
    80003234:	01013a03          	ld	s4,16(sp)
    80003238:	04010113          	addi	sp,sp,64
    8000323c:	00008067          	ret

0000000080003240 <_Z5printPKcmb>:

void print(const char* str, uint64 t, bool hex){
    80003240:	fc010113          	addi	sp,sp,-64
    80003244:	02113c23          	sd	ra,56(sp)
    80003248:	02813823          	sd	s0,48(sp)
    8000324c:	02913423          	sd	s1,40(sp)
    80003250:	03213023          	sd	s2,32(sp)
    80003254:	01313c23          	sd	s3,24(sp)
    80003258:	04010413          	addi	s0,sp,64
    8000325c:	00058913          	mv	s2,a1
    80003260:	00060993          	mv	s3,a2
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003264:	100027f3          	csrr	a5,sstatus
    80003268:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    8000326c:	fc843483          	ld	s1,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003270:	00200793          	li	a5,2
    80003274:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    80003278:	02000593          	li	a1,32
    8000327c:	00000097          	auipc	ra,0x0
    80003280:	f2c080e7          	jalr	-212(ra) # 800031a8 <_Z5printPKcc>
    print(t, '\n', hex);
    80003284:	00098613          	mv	a2,s3
    80003288:	00a00593          	li	a1,10
    8000328c:	00090513          	mv	a0,s2
    80003290:	00000097          	auipc	ra,0x0
    80003294:	dcc080e7          	jalr	-564(ra) # 8000305c <_Z5printmcb>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80003298:	0004849b          	sext.w	s1,s1
    8000329c:	0024f493          	andi	s1,s1,2
    800032a0:	0004849b          	sext.w	s1,s1
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800032a4:	1004a073          	csrs	sstatus,s1
}
    800032a8:	03813083          	ld	ra,56(sp)
    800032ac:	03013403          	ld	s0,48(sp)
    800032b0:	02813483          	ld	s1,40(sp)
    800032b4:	02013903          	ld	s2,32(sp)
    800032b8:	01813983          	ld	s3,24(sp)
    800032bc:	04010113          	addi	sp,sp,64
    800032c0:	00008067          	ret

00000000800032c4 <_Z9allocTestR15MemoryAllocatorm>:

void* allocTest(MemoryAllocator& allocator, size_t size){
    800032c4:	fe010113          	addi	sp,sp,-32
    800032c8:	00113c23          	sd	ra,24(sp)
    800032cc:	00813823          	sd	s0,16(sp)
    800032d0:	00913423          	sd	s1,8(sp)
    800032d4:	01213023          	sd	s2,0(sp)
    800032d8:	02010413          	addi	s0,sp,32
    800032dc:	00050493          	mv	s1,a0
    800032e0:	00058913          	mv	s2,a1
    print("\nAlokacija", ' ');
    800032e4:	02000593          	li	a1,32
    800032e8:	00004517          	auipc	a0,0x4
    800032ec:	11050513          	addi	a0,a0,272 # 800073f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x340>
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	eb8080e7          	jalr	-328(ra) # 800031a8 <_Z5printPKcc>
    print(size, ' ');
    800032f8:	00100613          	li	a2,1
    800032fc:	02000593          	li	a1,32
    80003300:	00090513          	mv	a0,s2
    80003304:	00000097          	auipc	ra,0x0
    80003308:	d58080e7          	jalr	-680(ra) # 8000305c <_Z5printmcb>
    print("blokova");
    8000330c:	00a00593          	li	a1,10
    80003310:	00004517          	auipc	a0,0x4
    80003314:	0f850513          	addi	a0,a0,248 # 80007408 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x350>
    80003318:	00000097          	auipc	ra,0x0
    8000331c:	e90080e7          	jalr	-368(ra) # 800031a8 <_Z5printPKcc>
    char* newblc = (char*)allocator.mem_alloc(size);
    80003320:	00090593          	mv	a1,s2
    80003324:	00048513          	mv	a0,s1
    80003328:	fffff097          	auipc	ra,0xfffff
    8000332c:	378080e7          	jalr	888(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    80003330:	00050913          	mv	s2,a0
    allocator.print_list();  
    80003334:	00048513          	mv	a0,s1
    80003338:	fffff097          	auipc	ra,0xfffff
    8000333c:	5d8080e7          	jalr	1496(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>
    return newblc;
}
    80003340:	00090513          	mv	a0,s2
    80003344:	01813083          	ld	ra,24(sp)
    80003348:	01013403          	ld	s0,16(sp)
    8000334c:	00813483          	ld	s1,8(sp)
    80003350:	00013903          	ld	s2,0(sp)
    80003354:	02010113          	addi	sp,sp,32
    80003358:	00008067          	ret

000000008000335c <_Z8freeTestR15MemoryAllocatorPv>:

void freeTest(MemoryAllocator& allocator, void* adr){
    8000335c:	fe010113          	addi	sp,sp,-32
    80003360:	00113c23          	sd	ra,24(sp)
    80003364:	00813823          	sd	s0,16(sp)
    80003368:	00913423          	sd	s1,8(sp)
    8000336c:	01213023          	sd	s2,0(sp)
    80003370:	02010413          	addi	s0,sp,32
    80003374:	00050493          	mv	s1,a0
    80003378:	00058913          	mv	s2,a1
    print("\nDealogkacija");
    8000337c:	00a00593          	li	a1,10
    80003380:	00004517          	auipc	a0,0x4
    80003384:	09050513          	addi	a0,a0,144 # 80007410 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x358>
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	e20080e7          	jalr	-480(ra) # 800031a8 <_Z5printPKcc>
    if(allocator.mem_free(adr) < 0)
    80003390:	00090593          	mv	a1,s2
    80003394:	00048513          	mv	a0,s1
    80003398:	fffff097          	auipc	ra,0xfffff
    8000339c:	4a0080e7          	jalr	1184(ra) # 80002838 <_ZN15MemoryAllocator8mem_freeEPv>
    800033a0:	02054863          	bltz	a0,800033d0 <_Z8freeTestR15MemoryAllocatorPv+0x74>
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
    800033a4:	00a00593          	li	a1,10
    800033a8:	00004517          	auipc	a0,0x4
    800033ac:	07850513          	addi	a0,a0,120 # 80007420 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x368>
    800033b0:	00000097          	auipc	ra,0x0
    800033b4:	df8080e7          	jalr	-520(ra) # 800031a8 <_Z5printPKcc>
}
    800033b8:	01813083          	ld	ra,24(sp)
    800033bc:	01013403          	ld	s0,16(sp)
    800033c0:	00813483          	ld	s1,8(sp)
    800033c4:	00013903          	ld	s2,0(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret
        allocator.print_list();
    800033d0:	00048513          	mv	a0,s1
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	53c080e7          	jalr	1340(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>
    800033dc:	fddff06f          	j	800033b8 <_Z8freeTestR15MemoryAllocatorPv+0x5c>

00000000800033e0 <_Z7memTestv>:

void memTest(){
    800033e0:	fe010113          	addi	sp,sp,-32
    800033e4:	00113c23          	sd	ra,24(sp)
    800033e8:	00813823          	sd	s0,16(sp)
    800033ec:	00913423          	sd	s1,8(sp)
    800033f0:	01213023          	sd	s2,0(sp)
    800033f4:	02010413          	addi	s0,sp,32
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    800033f8:	fffff097          	auipc	ra,0xfffff
    800033fc:	238080e7          	jalr	568(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003400:	00050493          	mv	s1,a0
    allocator.print_list();
    80003404:	fffff097          	auipc	ra,0xfffff
    80003408:	50c080e7          	jalr	1292(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(50);
    8000340c:	03200513          	li	a0,50
    80003410:	00000097          	auipc	ra,0x0
    80003414:	224080e7          	jalr	548(ra) # 80003634 <mem_alloc>
    
    allocator.print_list();
    80003418:	00048513          	mv	a0,s1
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	4f4080e7          	jalr	1268(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>

    char* t = (char*)mem_alloc(100);
    80003424:	06400513          	li	a0,100
    80003428:	00000097          	auipc	ra,0x0
    8000342c:	20c080e7          	jalr	524(ra) # 80003634 <mem_alloc>
    80003430:	00050913          	mv	s2,a0
    print("t:", (uint64)t, 0);
    80003434:	00000613          	li	a2,0
    80003438:	00050593          	mv	a1,a0
    8000343c:	00004517          	auipc	a0,0x4
    80003440:	ffc50513          	addi	a0,a0,-4 # 80007438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x380>
    80003444:	00000097          	auipc	ra,0x0
    80003448:	dfc080e7          	jalr	-516(ra) # 80003240 <_Z5printPKcmb>

    allocator.print_list();
    8000344c:	00048513          	mv	a0,s1
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	4c0080e7          	jalr	1216(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(300);
    80003458:	12c00513          	li	a0,300
    8000345c:	00000097          	auipc	ra,0x0
    80003460:	1d8080e7          	jalr	472(ra) # 80003634 <mem_alloc>

    allocator.print_list();
    80003464:	00048513          	mv	a0,s1
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	4a8080e7          	jalr	1192(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>
    
    print("free_res:", mem_free(t), 0);
    80003470:	00090513          	mv	a0,s2
    80003474:	00000097          	auipc	ra,0x0
    80003478:	1f8080e7          	jalr	504(ra) # 8000366c <mem_free>
    8000347c:	00000613          	li	a2,0
    80003480:	00050593          	mv	a1,a0
    80003484:	00004517          	auipc	a0,0x4
    80003488:	fbc50513          	addi	a0,a0,-68 # 80007440 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x388>
    8000348c:	00000097          	auipc	ra,0x0
    80003490:	db4080e7          	jalr	-588(ra) # 80003240 <_Z5printPKcmb>
    
    allocator.print_list();
    80003494:	00048513          	mv	a0,s1
    80003498:	fffff097          	auipc	ra,0xfffff
    8000349c:	478080e7          	jalr	1144(ra) # 80002910 <_ZN15MemoryAllocator10print_listEv>
}
    800034a0:	01813083          	ld	ra,24(sp)
    800034a4:	01013403          	ld	s0,16(sp)
    800034a8:	00813483          	ld	s1,8(sp)
    800034ac:	00013903          	ld	s2,0(sp)
    800034b0:	02010113          	addi	sp,sp,32
    800034b4:	00008067          	ret

00000000800034b8 <_Z8print_a0v>:

void print_a0(){
    800034b8:	fe010113          	addi	sp,sp,-32
    800034bc:	00113c23          	sd	ra,24(sp)
    800034c0:	00813823          	sd	s0,16(sp)
    800034c4:	00913423          	sd	s1,8(sp)
    800034c8:	02010413          	addi	s0,sp,32
    asm volatile("mv %0, a0" : "=r" (a0));
    800034cc:	00050493          	mv	s1,a0
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    800034d0:	02000593          	li	a1,32
    800034d4:	00004517          	auipc	a0,0x4
    800034d8:	f7c50513          	addi	a0,a0,-132 # 80007450 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x398>
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	ccc080e7          	jalr	-820(ra) # 800031a8 <_Z5printPKcc>
    print(a0, '\n', 1);
    800034e4:	00100613          	li	a2,1
    800034e8:	00a00593          	li	a1,10
    800034ec:	00048513          	mv	a0,s1
    800034f0:	00000097          	auipc	ra,0x0
    800034f4:	b6c080e7          	jalr	-1172(ra) # 8000305c <_Z5printmcb>
    //asm volatile("mv a0, %0" : : "r" (a0));
}
    800034f8:	01813083          	ld	ra,24(sp)
    800034fc:	01013403          	ld	s0,16(sp)
    80003500:	00813483          	ld	s1,8(sp)
    80003504:	02010113          	addi	sp,sp,32
    80003508:	00008067          	ret

000000008000350c <_Z19print_sup_registersv>:

void print_sup_registers(){ 
    8000350c:	fd010113          	addi	sp,sp,-48
    80003510:	02113423          	sd	ra,40(sp)
    80003514:	02813023          	sd	s0,32(sp)
    80003518:	03010413          	addi	s0,sp,48

    print("sstatus:",' ');
    8000351c:	02000593          	li	a1,32
    80003520:	00004517          	auipc	a0,0x4
    80003524:	f3850513          	addi	a0,a0,-200 # 80007458 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x3a0>
    80003528:	00000097          	auipc	ra,0x0
    8000352c:	c80080e7          	jalr	-896(ra) # 800031a8 <_Z5printPKcc>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003530:	100027f3          	csrr	a5,sstatus
    80003534:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80003538:	fe843503          	ld	a0,-24(s0)
    print(Riscv::r_sstatus(), '\n', 1);
    8000353c:	00100613          	li	a2,1
    80003540:	00a00593          	li	a1,10
    80003544:	00000097          	auipc	ra,0x0
    80003548:	b18080e7          	jalr	-1256(ra) # 8000305c <_Z5printmcb>

    print("sip:",' ');
    8000354c:	02000593          	li	a1,32
    80003550:	00004517          	auipc	a0,0x4
    80003554:	f1850513          	addi	a0,a0,-232 # 80007468 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x3b0>
    80003558:	00000097          	auipc	ra,0x0
    8000355c:	c50080e7          	jalr	-944(ra) # 800031a8 <_Z5printPKcc>
    asm volatile("csrr %0, sip" : "=r" (sip));
    80003560:	144027f3          	csrr	a5,sip
    80003564:	fef43023          	sd	a5,-32(s0)
    return sip;
    80003568:	fe043503          	ld	a0,-32(s0)
    print(Riscv::r_sip(), '\n', 1);
    8000356c:	00100613          	li	a2,1
    80003570:	00a00593          	li	a1,10
    80003574:	00000097          	auipc	ra,0x0
    80003578:	ae8080e7          	jalr	-1304(ra) # 8000305c <_Z5printmcb>

    print("stval:",' ');
    8000357c:	02000593          	li	a1,32
    80003580:	00004517          	auipc	a0,0x4
    80003584:	ef050513          	addi	a0,a0,-272 # 80007470 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x3b8>
    80003588:	00000097          	auipc	ra,0x0
    8000358c:	c20080e7          	jalr	-992(ra) # 800031a8 <_Z5printPKcc>
    asm volatile("csrr %0, stval" : "=r" (stval));
    80003590:	143027f3          	csrr	a5,stval
    80003594:	fcf43c23          	sd	a5,-40(s0)
    return stval;
    80003598:	fd843503          	ld	a0,-40(s0)
    print(Riscv::r_stval(), '\n', 1);
    8000359c:	00100613          	li	a2,1
    800035a0:	00a00593          	li	a1,10
    800035a4:	00000097          	auipc	ra,0x0
    800035a8:	ab8080e7          	jalr	-1352(ra) # 8000305c <_Z5printmcb>

    print("scause:",' ');
    800035ac:	02000593          	li	a1,32
    800035b0:	00004517          	auipc	a0,0x4
    800035b4:	ec850513          	addi	a0,a0,-312 # 80007478 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x3c0>
    800035b8:	00000097          	auipc	ra,0x0
    800035bc:	bf0080e7          	jalr	-1040(ra) # 800031a8 <_Z5printPKcc>
    asm volatile("csrr %0, scause" : "=r" (scause));
    800035c0:	142027f3          	csrr	a5,scause
    800035c4:	fcf43823          	sd	a5,-48(s0)
    return scause;
    800035c8:	fd043503          	ld	a0,-48(s0)
    print(Riscv::r_scause(), '\n', 1);
    800035cc:	00100613          	li	a2,1
    800035d0:	00a00593          	li	a1,10
    800035d4:	00000097          	auipc	ra,0x0
    800035d8:	a88080e7          	jalr	-1400(ra) # 8000305c <_Z5printmcb>
}
    800035dc:	02813083          	ld	ra,40(sp)
    800035e0:	02013403          	ld	s0,32(sp)
    800035e4:	03010113          	addi	sp,sp,48
    800035e8:	00008067          	ret

00000000800035ec <_Z7kmallocm>:

void* kmalloc(size_t size){
    800035ec:	fe010113          	addi	sp,sp,-32
    800035f0:	00113c23          	sd	ra,24(sp)
    800035f4:	00813823          	sd	s0,16(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80003600:	fff50493          	addi	s1,a0,-1
    80003604:	0064d493          	srli	s1,s1,0x6
    80003608:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    8000360c:	fffff097          	auipc	ra,0xfffff
    80003610:	024080e7          	jalr	36(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003614:	00048593          	mv	a1,s1
    80003618:	fffff097          	auipc	ra,0xfffff
    8000361c:	088080e7          	jalr	136(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    80003620:	01813083          	ld	ra,24(sp)
    80003624:	01013403          	ld	s0,16(sp)
    80003628:	00813483          	ld	s1,8(sp)
    8000362c:	02010113          	addi	sp,sp,32
    80003630:	00008067          	ret

0000000080003634 <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.hpp"
#include"../../h/_semaphore.hpp"
#include"../../h/testing.hpp"
extern "C" void* mem_alloc(size_t size)
{
    80003634:	ff010113          	addi	sp,sp,-16
    80003638:	00813423          	sd	s0,8(sp)
    8000363c:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80003640:	fff50513          	addi	a0,a0,-1
    80003644:	00655513          	srli	a0,a0,0x6
    80003648:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    8000364c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80003650:	00100793          	li	a5,1
    80003654:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80003658:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    8000365c:	00050513          	mv	a0,a0
    
    return adr;  
}
    80003660:	00813403          	ld	s0,8(sp)
    80003664:	01010113          	addi	sp,sp,16
    80003668:	00008067          	ret

000000008000366c <mem_free>:

extern "C" int mem_free (void* adr)
{
    8000366c:	ff010113          	addi	sp,sp,-16
    80003670:	00813423          	sd	s0,8(sp)
    80003674:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80003678:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    8000367c:	00200793          	li	a5,2
    80003680:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80003684:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80003688:	00050513          	mv	a0,a0
    
    return ret;
}
    8000368c:	0005051b          	sext.w	a0,a0
    80003690:	00813403          	ld	s0,8(sp)
    80003694:	01010113          	addi	sp,sp,16
    80003698:	00008067          	ret

000000008000369c <thread_dispatch>:

extern "C" void thread_dispatch()
{
    8000369c:	ff010113          	addi	sp,sp,-16
    800036a0:	00813423          	sd	s0,8(sp)
    800036a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    800036a8:	01300793          	li	a5,19
    800036ac:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800036b0:	00000073          	ecall
}
    800036b4:	00813403          	ld	s0,8(sp)
    800036b8:	01010113          	addi	sp,sp,16
    800036bc:	00008067          	ret

00000000800036c0 <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    800036c0:	06050e63          	beqz	a0,8000373c <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    800036c4:	08058063          	beqz	a1,80003744 <thread_create+0x84>
{
    800036c8:	fd010113          	addi	sp,sp,-48
    800036cc:	02113423          	sd	ra,40(sp)
    800036d0:	02813023          	sd	s0,32(sp)
    800036d4:	00913c23          	sd	s1,24(sp)
    800036d8:	01213823          	sd	s2,16(sp)
    800036dc:	01313423          	sd	s3,8(sp)
    800036e0:	03010413          	addi	s0,sp,48
    800036e4:	00060993          	mv	s3,a2
    800036e8:	00058913          	mv	s2,a1
    800036ec:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800036f0:	00001537          	lui	a0,0x1
    800036f4:	00000097          	auipc	ra,0x0
    800036f8:	f40080e7          	jalr	-192(ra) # 80003634 <mem_alloc>
    if(stack_space == nullptr) return -3;
    800036fc:	04050863          	beqz	a0,8000374c <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    80003700:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    80003704:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    80003708:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    8000370c:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    80003710:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    80003714:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003718:	00050513          	mv	a0,a0
    8000371c:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003720:	02813083          	ld	ra,40(sp)
    80003724:	02013403          	ld	s0,32(sp)
    80003728:	01813483          	ld	s1,24(sp)
    8000372c:	01013903          	ld	s2,16(sp)
    80003730:	00813983          	ld	s3,8(sp)
    80003734:	03010113          	addi	sp,sp,48
    80003738:	00008067          	ret
    if(handle == nullptr) return -1;
    8000373c:	fff00513          	li	a0,-1
    80003740:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80003744:	ffe00513          	li	a0,-2
}
    80003748:	00008067          	ret
    if(stack_space == nullptr) return -3;
    8000374c:	ffd00513          	li	a0,-3
    80003750:	fd1ff06f          	j	80003720 <thread_create+0x60>

0000000080003754 <thread_exit>:

extern "C" int thread_exit()
{
    80003754:	ff010113          	addi	sp,sp,-16
    80003758:	00813423          	sd	s0,8(sp)
    8000375c:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    80003760:	01200513          	li	a0,18
    asm volatile("ecall");
    80003764:	00000073          	ecall

    return ret;
}
    80003768:	00000513          	li	a0,0
    8000376c:	00813403          	ld	s0,8(sp)
    80003770:	01010113          	addi	sp,sp,16
    80003774:	00008067          	ret

0000000080003778 <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    80003778:	ff010113          	addi	sp,sp,-16
    8000377c:	00813423          	sd	s0,8(sp)
    80003780:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    80003784:	02050463          	beqz	a0,800037ac <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    80003788:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    8000378c:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    80003790:	02100513          	li	a0,33
    asm volatile("ecall");
    80003794:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003798:	00050513          	mv	a0,a0
    8000379c:	0005051b          	sext.w	a0,a0
    return ret;
}
    800037a0:	00813403          	ld	s0,8(sp)
    800037a4:	01010113          	addi	sp,sp,16
    800037a8:	00008067          	ret
    if(handle == nullptr) return -1;
    800037ac:	fff00513          	li	a0,-1
    800037b0:	ff1ff06f          	j	800037a0 <sem_open+0x28>

00000000800037b4 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    800037b4:	ff010113          	addi	sp,sp,-16
    800037b8:	00813423          	sd	s0,8(sp)
    800037bc:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    800037c0:	02050263          	beqz	a0,800037e4 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    800037c4:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    800037c8:	02200513          	li	a0,34
    asm volatile("ecall");
    800037cc:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800037d0:	00050513          	mv	a0,a0
    800037d4:	0005051b          	sext.w	a0,a0
    return ret;
}
    800037d8:	00813403          	ld	s0,8(sp)
    800037dc:	01010113          	addi	sp,sp,16
    800037e0:	00008067          	ret
    if(handle == nullptr) return -1;
    800037e4:	fff00513          	li	a0,-1
    800037e8:	ff1ff06f          	j	800037d8 <sem_close+0x24>

00000000800037ec <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    800037ec:	ff010113          	addi	sp,sp,-16
    800037f0:	00813423          	sd	s0,8(sp)
    800037f4:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    800037f8:	02050263          	beqz	a0,8000381c <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    800037fc:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    80003800:	02300513          	li	a0,35
    asm volatile("ecall");
    80003804:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003808:	00050513          	mv	a0,a0
    8000380c:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003810:	00813403          	ld	s0,8(sp)
    80003814:	01010113          	addi	sp,sp,16
    80003818:	00008067          	ret
    if(id == nullptr) return -1;
    8000381c:	fff00513          	li	a0,-1
    80003820:	ff1ff06f          	j	80003810 <sem_wait+0x24>

0000000080003824 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    80003824:	ff010113          	addi	sp,sp,-16
    80003828:	00813423          	sd	s0,8(sp)
    8000382c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    80003830:	02050263          	beqz	a0,80003854 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80003834:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    80003838:	02400513          	li	a0,36
    asm volatile("ecall");
    8000383c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003840:	00050513          	mv	a0,a0
    80003844:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003848:	00813403          	ld	s0,8(sp)
    8000384c:	01010113          	addi	sp,sp,16
    80003850:	00008067          	ret
    if(id == nullptr) return -1;
    80003854:	fff00513          	li	a0,-1
    80003858:	ff1ff06f          	j	80003848 <sem_signal+0x24>

000000008000385c <time_sleep>:

extern "C" int time_sleep(time_t time){
    8000385c:	ff010113          	addi	sp,sp,-16
    80003860:	00813423          	sd	s0,8(sp)
    80003864:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    80003868:	02050263          	beqz	a0,8000388c <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    8000386c:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    80003870:	03100513          	li	a0,49
    asm volatile("ecall");
    80003874:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003878:	00050513          	mv	a0,a0
    8000387c:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003880:	00813403          	ld	s0,8(sp)
    80003884:	01010113          	addi	sp,sp,16
    80003888:	00008067          	ret
    if(time == 0) return -1;
    8000388c:	fff00513          	li	a0,-1
    80003890:	ff1ff06f          	j	80003880 <time_sleep+0x24>

0000000080003894 <getc>:

const int EOF = -1;
extern "C" char getc(){
    80003894:	ff010113          	addi	sp,sp,-16
    80003898:	00813423          	sd	s0,8(sp)
    8000389c:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    800038a0:	04100513          	li	a0,65
    asm volatile("ecall");
    800038a4:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800038a8:	00050513          	mv	a0,a0
    800038ac:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    800038b0:	0ff00793          	li	a5,255
    800038b4:	00a7ea63          	bltu	a5,a0,800038c8 <getc+0x34>
    800038b8:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    800038bc:	00813403          	ld	s0,8(sp)
    800038c0:	01010113          	addi	sp,sp,16
    800038c4:	00008067          	ret
    else return EOF;
    800038c8:	0ff00513          	li	a0,255
    800038cc:	ff1ff06f          	j	800038bc <getc+0x28>

00000000800038d0 <putc>:

extern "C" void putc(char c){
    800038d0:	ff010113          	addi	sp,sp,-16
    800038d4:	00813423          	sd	s0,8(sp)
    800038d8:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    800038dc:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    800038e0:	04200513          	li	a0,66
    asm volatile("ecall");
    800038e4:	00000073          	ecall
    800038e8:	00813403          	ld	s0,8(sp)
    800038ec:	01010113          	addi	sp,sp,16
    800038f0:	00008067          	ret

00000000800038f4 <_ZN10KSemaphore4waitEv>:
#include"../../h/KInclude.hpp"

int KSemaphore::wait(){
    if(val > 0)
    800038f4:	00052783          	lw	a5,0(a0) # 1000 <_entry-0x7ffff000>
    800038f8:	00078a63          	beqz	a5,8000390c <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    800038fc:	fff7879b          	addiw	a5,a5,-1
    80003900:	00f52023          	sw	a5,0(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80003904:	00000513          	li	a0,0
}
    80003908:	00008067          	ret
int KSemaphore::wait(){
    8000390c:	fe010113          	addi	sp,sp,-32
    80003910:	00113c23          	sd	ra,24(sp)
    80003914:	00813823          	sd	s0,16(sp)
    80003918:	00913423          	sd	s1,8(sp)
    8000391c:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    80003920:	00005497          	auipc	s1,0x5
    80003924:	48048493          	addi	s1,s1,1152 # 80008da0 <_ZN3TCB7runningE>
    80003928:	0004b583          	ld	a1,0(s1)
    8000392c:	0205ac23          	sw	zero,56(a1)
        blocked.insert(TCB::running);
    80003930:	00850513          	addi	a0,a0,8
    80003934:	00001097          	auipc	ra,0x1
    80003938:	818080e7          	jalr	-2024(ra) # 8000414c <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	5f4080e7          	jalr	1524(ra) # 80002f30 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    80003944:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    80003948:	0387a703          	lw	a4,56(a5)
    8000394c:	02071263          	bnez	a4,80003970 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    80003950:	00100713          	li	a4,1
    80003954:	02e7ac23          	sw	a4,56(a5)
    return 0;
    80003958:	00000513          	li	a0,0
}
    8000395c:	01813083          	ld	ra,24(sp)
    80003960:	01013403          	ld	s0,16(sp)
    80003964:	00813483          	ld	s1,8(sp)
    80003968:	02010113          	addi	sp,sp,32
    8000396c:	00008067          	ret
            return -2;
    80003970:	ffe00513          	li	a0,-2
    80003974:	fe9ff06f          	j	8000395c <_ZN10KSemaphore4waitEv+0x68>

0000000080003978 <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80003978:	00853783          	ld	a5,8(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    8000397c:	02078e63          	beqz	a5,800039b8 <_ZN10KSemaphore6signalEv+0x40>
{
    80003980:	ff010113          	addi	sp,sp,-16
    80003984:	00113423          	sd	ra,8(sp)
    80003988:	00813023          	sd	s0,0(sp)
    8000398c:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80003990:	00850513          	addi	a0,a0,8
    80003994:	00000097          	auipc	ra,0x0
    80003998:	7ec080e7          	jalr	2028(ra) # 80004180 <_ZN8TcbQueue6removeEv>
    8000399c:	fffff097          	auipc	ra,0xfffff
    800039a0:	0e0080e7          	jalr	224(ra) # 80002a7c <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    800039a4:	00000513          	li	a0,0
    800039a8:	00813083          	ld	ra,8(sp)
    800039ac:	00013403          	ld	s0,0(sp)
    800039b0:	01010113          	addi	sp,sp,16
    800039b4:	00008067          	ret
        val++;
    800039b8:	00052783          	lw	a5,0(a0)
    800039bc:	0017879b          	addiw	a5,a5,1
    800039c0:	00f52023          	sw	a5,0(a0)
}
    800039c4:	00000513          	li	a0,0
    800039c8:	00008067          	ret

00000000800039cc <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    800039cc:	fe010113          	addi	sp,sp,-32
    800039d0:	00113c23          	sd	ra,24(sp)
    800039d4:	00813823          	sd	s0,16(sp)
    800039d8:	00913423          	sd	s1,8(sp)
    800039dc:	02010413          	addi	s0,sp,32
    800039e0:	00050493          	mv	s1,a0
    800039e4:	0084b783          	ld	a5,8(s1)
{
    while(!blocked.isEmpty()){
    800039e8:	02078263          	beqz	a5,80003a0c <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    800039ec:	00848513          	addi	a0,s1,8
    800039f0:	00000097          	auipc	ra,0x0
    800039f4:	790080e7          	jalr	1936(ra) # 80004180 <_ZN8TcbQueue6removeEv>
    800039f8:	00100793          	li	a5,1
    800039fc:	02f52c23          	sw	a5,56(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    80003a00:	fffff097          	auipc	ra,0xfffff
    80003a04:	07c080e7          	jalr	124(ra) # 80002a7c <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    80003a08:	fddff06f          	j	800039e4 <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    80003a0c:	01813083          	ld	ra,24(sp)
    80003a10:	01013403          	ld	s0,16(sp)
    80003a14:	00813483          	ld	s1,8(sp)
    80003a18:	02010113          	addi	sp,sp,32
    80003a1c:	00008067          	ret

0000000080003a20 <_ZN5StdIO12outputWorkerEPv>:
    out_thread->setKernelMode();
    out_thread->setKernelLocked();
}

void StdIO::outputWorker(void *)
{
    80003a20:	fc010113          	addi	sp,sp,-64
    80003a24:	02113c23          	sd	ra,56(sp)
    80003a28:	02813823          	sd	s0,48(sp)
    80003a2c:	02913423          	sd	s1,40(sp)
    80003a30:	03213023          	sd	s2,32(sp)
    80003a34:	01313c23          	sd	s3,24(sp)
    80003a38:	01413823          	sd	s4,16(sp)
    80003a3c:	04010413          	addi	s0,sp,64
    
    out_thread = nullptr;
    80003a40:	00005797          	auipc	a5,0x5
    80003a44:	3807b023          	sd	zero,896(a5) # 80008dc0 <_ZN5StdIO10out_threadE>
    80003a48:	0400006f          	j	80003a88 <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003a4c:	100027f3          	csrr	a5,sstatus
    80003a50:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003a54:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80003a58:	141027f3          	csrr	a5,sepc
    80003a5c:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80003a60:	fc043483          	ld	s1,-64(s0)
        }
        else
        {

            uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
            out_thread = TCB::running;
    80003a64:	00005797          	auipc	a5,0x5
    80003a68:	33c78793          	addi	a5,a5,828 # 80008da0 <_ZN3TCB7runningE>
    80003a6c:	0007b783          	ld	a5,0(a5)
    80003a70:	00005717          	auipc	a4,0x5
    80003a74:	34f73823          	sd	a5,848(a4) # 80008dc0 <_ZN5StdIO10out_threadE>

            TCB::yield();
    80003a78:	fffff097          	auipc	ra,0xfffff
    80003a7c:	4b8080e7          	jalr	1208(ra) # 80002f30 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80003a80:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80003a84:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80003a88:	00005797          	auipc	a5,0x5
    80003a8c:	33078793          	addi	a5,a5,816 # 80008db8 <_ZN5StdIO8iostatusE>
    80003a90:	0007b783          	ld	a5,0(a5)
    80003a94:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80003a98:	0207f793          	andi	a5,a5,32
    80003a9c:	fa0788e3          	beqz	a5,80003a4c <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80003aa0:	00005797          	auipc	a5,0x5
    80003aa4:	33078793          	addi	a5,a5,816 # 80008dd0 <_ZN5StdIO7obufferE>
    80003aa8:	0007b483          	ld	s1,0(a5)
    80003aac:	00005797          	auipc	a5,0x5
    80003ab0:	2fc78793          	addi	a5,a5,764 # 80008da8 <_ZN5StdIO5odataE>
    80003ab4:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80003ab8:	41848513          	addi	a0,s1,1048
    80003abc:	00000097          	auipc	ra,0x0
    80003ac0:	e38080e7          	jalr	-456(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80003ac4:	40048913          	addi	s2,s1,1024
    80003ac8:	00090513          	mv	a0,s2
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	e28080e7          	jalr	-472(ra) # 800038f4 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80003ad4:	4504a783          	lw	a5,1104(s1)
    80003ad8:	fff7879b          	addiw	a5,a5,-1
    80003adc:	44f4a823          	sw	a5,1104(s1)
        T r = buffer[head];
    80003ae0:	4484a783          	lw	a5,1096(s1)
    80003ae4:	00f48733          	add	a4,s1,a5
    80003ae8:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80003aec:	0017879b          	addiw	a5,a5,1
    80003af0:	41f7d71b          	sraiw	a4,a5,0x1f
    80003af4:	0167571b          	srliw	a4,a4,0x16
    80003af8:	00e787bb          	addw	a5,a5,a4
    80003afc:	3ff7f793          	andi	a5,a5,1023
    80003b00:	40e787bb          	subw	a5,a5,a4
    80003b04:	44f4a423          	sw	a5,1096(s1)

        spaceAvailable.signal();
    80003b08:	43048513          	addi	a0,s1,1072
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	e6c080e7          	jalr	-404(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80003b14:	00090513          	mv	a0,s2
    80003b18:	00000097          	auipc	ra,0x0
    80003b1c:	e60080e7          	jalr	-416(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    80003b20:	01498023          	sb	s4,0(s3)
    80003b24:	f65ff06f          	j	80003a88 <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080003b28 <_ZN5StdIO9initalizeEv>:
{
    80003b28:	fe010113          	addi	sp,sp,-32
    80003b2c:	00113c23          	sd	ra,24(sp)
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00913423          	sd	s1,8(sp)
    80003b38:	01213023          	sd	s2,0(sp)
    80003b3c:	02010413          	addi	s0,sp,32
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80003b40:	fffff097          	auipc	ra,0xfffff
    80003b44:	af0080e7          	jalr	-1296(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003b48:	01200593          	li	a1,18
    80003b4c:	fffff097          	auipc	ra,0xfffff
    80003b50:	b54080e7          	jalr	-1196(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    80003b54:	00100493          	li	s1,1
    80003b58:	40952023          	sw	s1,1024(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr){}
    80003b5c:	40053423          	sd	zero,1032(a0)
    80003b60:	40053823          	sd	zero,1040(a0)
    80003b64:	40052c23          	sw	zero,1048(a0)
    80003b68:	42053023          	sd	zero,1056(a0)
    80003b6c:	42053423          	sd	zero,1064(a0)
    80003b70:	40000913          	li	s2,1024
    80003b74:	43252823          	sw	s2,1072(a0)
    80003b78:	42053c23          	sd	zero,1080(a0)
    80003b7c:	44053023          	sd	zero,1088(a0)
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80003b80:	44052423          	sw	zero,1096(a0)
    80003b84:	44052623          	sw	zero,1100(a0)
    80003b88:	44052823          	sw	zero,1104(a0)
    ibuffer = new SharedBuffer<char>();
    80003b8c:	00005797          	auipc	a5,0x5
    80003b90:	24a7b623          	sd	a0,588(a5) # 80008dd8 <_ZN5StdIO7ibufferE>
    80003b94:	fffff097          	auipc	ra,0xfffff
    80003b98:	a9c080e7          	jalr	-1380(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003b9c:	01200593          	li	a1,18
    80003ba0:	fffff097          	auipc	ra,0xfffff
    80003ba4:	b00080e7          	jalr	-1280(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    80003ba8:	00050593          	mv	a1,a0
    80003bac:	40952023          	sw	s1,1024(a0)
    80003bb0:	40053423          	sd	zero,1032(a0)
    80003bb4:	40053823          	sd	zero,1040(a0)
    80003bb8:	40052c23          	sw	zero,1048(a0)
    80003bbc:	42053023          	sd	zero,1056(a0)
    80003bc0:	42053423          	sd	zero,1064(a0)
    80003bc4:	43252823          	sw	s2,1072(a0)
    80003bc8:	42053c23          	sd	zero,1080(a0)
    80003bcc:	44053023          	sd	zero,1088(a0)
    80003bd0:	44052423          	sw	zero,1096(a0)
    80003bd4:	44052623          	sw	zero,1100(a0)
    80003bd8:	44052823          	sw	zero,1104(a0)
    obuffer = new SharedBuffer<char>();
    80003bdc:	00005797          	auipc	a5,0x5
    80003be0:	1ea7ba23          	sd	a0,500(a5) # 80008dd0 <_ZN5StdIO7obufferE>
    print("obuffer:", (uint64)obuffer, 0);
    80003be4:	00000613          	li	a2,0
    80003be8:	00004517          	auipc	a0,0x4
    80003bec:	89850513          	addi	a0,a0,-1896 # 80007480 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x3c8>
    80003bf0:	fffff097          	auipc	ra,0xfffff
    80003bf4:	650080e7          	jalr	1616(ra) # 80003240 <_Z5printPKcmb>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80003bf8:	fffff097          	auipc	ra,0xfffff
    80003bfc:	a38080e7          	jalr	-1480(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003c00:	00100593          	li	a1,1
    80003c04:	fffff097          	auipc	ra,0xfffff
    80003c08:	a9c080e7          	jalr	-1380(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    80003c0c:	00052023          	sw	zero,0(a0)
    80003c10:	00053423          	sd	zero,8(a0)
    80003c14:	00053823          	sd	zero,16(a0)
    blockSem = new KSemaphore(0);
    80003c18:	00005797          	auipc	a5,0x5
    80003c1c:	1aa7b823          	sd	a0,432(a5) # 80008dc8 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80003c20:	00003797          	auipc	a5,0x3
    80003c24:	3f078793          	addi	a5,a5,1008 # 80007010 <CONSOLE_STATUS>
    80003c28:	0007b783          	ld	a5,0(a5)
    80003c2c:	00005717          	auipc	a4,0x5
    80003c30:	18f73623          	sd	a5,396(a4) # 80008db8 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80003c34:	00003797          	auipc	a5,0x3
    80003c38:	3cc78793          	addi	a5,a5,972 # 80007000 <CONSOLE_RX_DATA>
    80003c3c:	0007b783          	ld	a5,0(a5)
    80003c40:	00005717          	auipc	a4,0x5
    80003c44:	16f73823          	sd	a5,368(a4) # 80008db0 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80003c48:	00003797          	auipc	a5,0x3
    80003c4c:	3c078793          	addi	a5,a5,960 # 80007008 <CONSOLE_TX_DATA>
    80003c50:	0007b783          	ld	a5,0(a5)
    80003c54:	00005717          	auipc	a4,0x5
    80003c58:	14f73a23          	sd	a5,340(a4) # 80008da8 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80003c5c:	fffff097          	auipc	ra,0xfffff
    80003c60:	9d4080e7          	jalr	-1580(ra) # 80002630 <_ZN15MemoryAllocator11getInstanceEv>
    80003c64:	04000593          	li	a1,64
    80003c68:	fffff097          	auipc	ra,0xfffff
    80003c6c:	a38080e7          	jalr	-1480(ra) # 800026a0 <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80003c70:	00050613          	mv	a2,a0
    80003c74:	00000593          	li	a1,0
    80003c78:	00000517          	auipc	a0,0x0
    80003c7c:	da850513          	addi	a0,a0,-600 # 80003a20 <_ZN5StdIO12outputWorkerEPv>
    80003c80:	fffff097          	auipc	ra,0xfffff
    80003c84:	07c080e7          	jalr	124(ra) # 80002cfc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80003c88:	00005797          	auipc	a5,0x5
    80003c8c:	12a7bc23          	sd	a0,312(a5) # 80008dc0 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80003c90:	02050ea3          	sb	zero,61(a0)
    void setKernelLocked() { locked = true; }
    80003c94:	02950f23          	sb	s1,62(a0)
}
    80003c98:	01813083          	ld	ra,24(sp)
    80003c9c:	01013403          	ld	s0,16(sp)
    80003ca0:	00813483          	ld	s1,8(sp)
    80003ca4:	00013903          	ld	s2,0(sp)
    80003ca8:	02010113          	addi	sp,sp,32
    80003cac:	00008067          	ret

0000000080003cb0 <_ZN5StdIO11inputWorkerEv>:
    }
    
}

void StdIO::inputWorker()
{
    80003cb0:	ff010113          	addi	sp,sp,-16
    80003cb4:	00813423          	sd	s0,8(sp)
    80003cb8:	01010413          	addi	s0,sp,16

}
    80003cbc:	00813403          	ld	s0,8(sp)
    80003cc0:	01010113          	addi	sp,sp,16
    80003cc4:	00008067          	ret

0000000080003cc8 <_ZN5StdIO15console_handlerEv>:

void StdIO::console_handler(){
    80003cc8:	fc010113          	addi	sp,sp,-64
    80003ccc:	02113c23          	sd	ra,56(sp)
    80003cd0:	02813823          	sd	s0,48(sp)
    80003cd4:	02913423          	sd	s1,40(sp)
    80003cd8:	03213023          	sd	s2,32(sp)
    80003cdc:	01313c23          	sd	s3,24(sp)
    80003ce0:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    80003ce4:	00002097          	auipc	ra,0x2
    80003ce8:	8e0080e7          	jalr	-1824(ra) # 800055c4 <plic_claim>
    if(t == CONSOLE_IRQ)
    80003cec:	00a00793          	li	a5,10
    80003cf0:	12f51063          	bne	a0,a5,80003e10 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    80003cf4:	00005797          	auipc	a5,0x5
    80003cf8:	0c478793          	addi	a5,a5,196 # 80008db8 <_ZN5StdIO8iostatusE>
    80003cfc:	0007b783          	ld	a5,0(a5)
    80003d00:	0007c783          	lbu	a5,0(a5)
    {
        
        if(input_ready())
    80003d04:	0017f793          	andi	a5,a5,1
    80003d08:	0a078263          	beqz	a5,80003dac <_ZN5StdIO15console_handlerEv+0xe4>
        {
            char c = *idata;
    80003d0c:	00005797          	auipc	a5,0x5
    80003d10:	0a478793          	addi	a5,a5,164 # 80008db0 <_ZN5StdIO5idataE>
    80003d14:	0007b783          	ld	a5,0(a5)
    80003d18:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    80003d1c:	00a00513          	li	a0,10
    80003d20:	00002097          	auipc	ra,0x2
    80003d24:	8dc080e7          	jalr	-1828(ra) # 800055fc <plic_complete>
            //__putc(c);
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80003d28:	00005797          	auipc	a5,0x5
    80003d2c:	0b078793          	addi	a5,a5,176 # 80008dd8 <_ZN5StdIO7ibufferE>
    80003d30:	0007b483          	ld	s1,0(a5)
    80003d34:	4504a703          	lw	a4,1104(s1)
    80003d38:	3ff00793          	li	a5,1023
    80003d3c:	0ce7ce63          	blt	a5,a4,80003e18 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80003d40:	43048513          	addi	a0,s1,1072
    80003d44:	00000097          	auipc	ra,0x0
    80003d48:	bb0080e7          	jalr	-1104(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80003d4c:	40048993          	addi	s3,s1,1024
    80003d50:	00098513          	mv	a0,s3
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	ba0080e7          	jalr	-1120(ra) # 800038f4 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80003d5c:	4504a783          	lw	a5,1104(s1)
    80003d60:	0017879b          	addiw	a5,a5,1
    80003d64:	44f4a823          	sw	a5,1104(s1)
        buffer[tail]=c;
    80003d68:	44c4a783          	lw	a5,1100(s1)
    80003d6c:	00f48733          	add	a4,s1,a5
    80003d70:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80003d74:	0017879b          	addiw	a5,a5,1
    80003d78:	41f7d71b          	sraiw	a4,a5,0x1f
    80003d7c:	0167571b          	srliw	a4,a4,0x16
    80003d80:	00e787bb          	addw	a5,a5,a4
    80003d84:	3ff7f793          	andi	a5,a5,1023
    80003d88:	40e787bb          	subw	a5,a5,a4
    80003d8c:	44f4a623          	sw	a5,1100(s1)
        itemAvailable.signal();
    80003d90:	41848513          	addi	a0,s1,1048
    80003d94:	00000097          	auipc	ra,0x0
    80003d98:	be4080e7          	jalr	-1052(ra) # 80003978 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80003d9c:	00098513          	mv	a0,s3
    80003da0:	00000097          	auipc	ra,0x0
    80003da4:	bd8080e7          	jalr	-1064(ra) # 80003978 <_ZN10KSemaphore6signalEv>
    80003da8:	0700006f          	j	80003e18 <_ZN5StdIO15console_handlerEv+0x150>
            }

        }
        else
        {
            plic_complete(CONSOLE_IRQ);
    80003dac:	00a00513          	li	a0,10
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	84c080e7          	jalr	-1972(ra) # 800055fc <plic_complete>
            if(out_thread != nullptr)
    80003db8:	00005797          	auipc	a5,0x5
    80003dbc:	00878793          	addi	a5,a5,8 # 80008dc0 <_ZN5StdIO10out_threadE>
    80003dc0:	0007b783          	ld	a5,0(a5)
    80003dc4:	04078a63          	beqz	a5,80003e18 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003dc8:	100027f3          	csrr	a5,sstatus
    80003dcc:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003dd0:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80003dd4:	141027f3          	csrr	a5,sepc
    80003dd8:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80003ddc:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80003de0:	00005797          	auipc	a5,0x5
    80003de4:	fe078793          	addi	a5,a5,-32 # 80008dc0 <_ZN5StdIO10out_threadE>
    80003de8:	0007b583          	ld	a1,0(a5)
    80003dec:	00005517          	auipc	a0,0x5
    80003df0:	03450513          	addi	a0,a0,52 # 80008e20 <_ZN9Scheduler5queueE>
    80003df4:	00000097          	auipc	ra,0x0
    80003df8:	510080e7          	jalr	1296(ra) # 80004304 <_ZN8TcbQueue11insertFrontEP3TCB>
            {
                uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
                Scheduler::put_front(out_thread);

                TCB::yield();
    80003dfc:	fffff097          	auipc	ra,0xfffff
    80003e00:	134080e7          	jalr	308(ra) # 80002f30 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80003e04:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80003e08:	14149073          	csrw	sepc,s1
    80003e0c:	00c0006f          	j	80003e18 <_ZN5StdIO15console_handlerEv+0x150>
            }
                
        }    
    }
    else
        plic_complete(t);
    80003e10:	00001097          	auipc	ra,0x1
    80003e14:	7ec080e7          	jalr	2028(ra) # 800055fc <plic_complete>
        
    80003e18:	03813083          	ld	ra,56(sp)
    80003e1c:	03013403          	ld	s0,48(sp)
    80003e20:	02813483          	ld	s1,40(sp)
    80003e24:	02013903          	ld	s2,32(sp)
    80003e28:	01813983          	ld	s3,24(sp)
    80003e2c:	04010113          	addi	sp,sp,64
    80003e30:	00008067          	ret

0000000080003e34 <_ZN6Thread10runWrapperEPv>:
        thread_create(&myHandle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    80003e34:	ff010113          	addi	sp,sp,-16
    80003e38:	00113423          	sd	ra,8(sp)
    80003e3c:	00813023          	sd	s0,0(sp)
    80003e40:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    80003e44:	00053783          	ld	a5,0(a0)
    80003e48:	0107b783          	ld	a5,16(a5)
    80003e4c:	000780e7          	jalr	a5
}
    80003e50:	00813083          	ld	ra,8(sp)
    80003e54:	00013403          	ld	s0,0(sp)
    80003e58:	01010113          	addi	sp,sp,16
    80003e5c:	00008067          	ret

0000000080003e60 <_ZN14PeriodicThread15periodicWrapperEPv>:
};

PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    80003e60:	fe010113          	addi	sp,sp,-32
    80003e64:	00113c23          	sd	ra,24(sp)
    80003e68:	00813823          	sd	s0,16(sp)
    80003e6c:	00913423          	sd	s1,8(sp)
    80003e70:	02010413          	addi	s0,sp,32
    80003e74:	00050493          	mv	s1,a0
    WrapPeriod* wp = (WrapPeriod*)arg;
    while(true){
        wp->thread->periodicActivation();
    80003e78:	0004b503          	ld	a0,0(s1)
    80003e7c:	00053783          	ld	a5,0(a0)
    80003e80:	0187b783          	ld	a5,24(a5)
    80003e84:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80003e88:	0084b503          	ld	a0,8(s1)
    80003e8c:	00000097          	auipc	ra,0x0
    80003e90:	9d0080e7          	jalr	-1584(ra) # 8000385c <time_sleep>
    80003e94:	fe5ff06f          	j	80003e78 <_ZN14PeriodicThread15periodicWrapperEPv+0x18>

0000000080003e98 <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    80003e98:	ff010113          	addi	sp,sp,-16
    80003e9c:	00113423          	sd	ra,8(sp)
    80003ea0:	00813023          	sd	s0,0(sp)
    80003ea4:	01010413          	addi	s0,sp,16
    80003ea8:	fffff097          	auipc	ra,0xfffff
    80003eac:	78c080e7          	jalr	1932(ra) # 80003634 <mem_alloc>
    80003eb0:	00813083          	ld	ra,8(sp)
    80003eb4:	00013403          	ld	s0,0(sp)
    80003eb8:	01010113          	addi	sp,sp,16
    80003ebc:	00008067          	ret

0000000080003ec0 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    80003ec0:	ff010113          	addi	sp,sp,-16
    80003ec4:	00113423          	sd	ra,8(sp)
    80003ec8:	00813023          	sd	s0,0(sp)
    80003ecc:	01010413          	addi	s0,sp,16
    80003ed0:	fffff097          	auipc	ra,0xfffff
    80003ed4:	79c080e7          	jalr	1948(ra) # 8000366c <mem_free>
    80003ed8:	00813083          	ld	ra,8(sp)
    80003edc:	00013403          	ld	s0,0(sp)
    80003ee0:	01010113          	addi	sp,sp,16
    80003ee4:	00008067          	ret

0000000080003ee8 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    80003ee8:	ff010113          	addi	sp,sp,-16
    80003eec:	00113423          	sd	ra,8(sp)
    80003ef0:	00813023          	sd	s0,0(sp)
    80003ef4:	01010413          	addi	s0,sp,16
    80003ef8:	fffff097          	auipc	ra,0xfffff
    80003efc:	73c080e7          	jalr	1852(ra) # 80003634 <mem_alloc>
    80003f00:	00813083          	ld	ra,8(sp)
    80003f04:	00013403          	ld	s0,0(sp)
    80003f08:	01010113          	addi	sp,sp,16
    80003f0c:	00008067          	ret

0000000080003f10 <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    80003f10:	ff010113          	addi	sp,sp,-16
    80003f14:	00113423          	sd	ra,8(sp)
    80003f18:	00813023          	sd	s0,0(sp)
    80003f1c:	01010413          	addi	s0,sp,16
    80003f20:	fffff097          	auipc	ra,0xfffff
    80003f24:	74c080e7          	jalr	1868(ra) # 8000366c <mem_free>
    80003f28:	00813083          	ld	ra,8(sp)
    80003f2c:	00013403          	ld	s0,0(sp)
    80003f30:	01010113          	addi	sp,sp,16
    80003f34:	00008067          	ret

0000000080003f38 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    80003f38:	fd010113          	addi	sp,sp,-48
    80003f3c:	02113423          	sd	ra,40(sp)
    80003f40:	02813023          	sd	s0,32(sp)
    80003f44:	00913c23          	sd	s1,24(sp)
    80003f48:	01213823          	sd	s2,16(sp)
    80003f4c:	01313423          	sd	s3,8(sp)
    80003f50:	03010413          	addi	s0,sp,48
    80003f54:	00050493          	mv	s1,a0
    80003f58:	00058993          	mv	s3,a1
    80003f5c:	00060913          	mv	s2,a2
    80003f60:	00003797          	auipc	a5,0x3
    80003f64:	0d078793          	addi	a5,a5,208 # 80007030 <_ZTV6Thread+0x10>
    80003f68:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new Wrap{body, (uint64)arg});
    80003f6c:	01000513          	li	a0,16
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	f28080e7          	jalr	-216(ra) # 80003e98 <_Znwm>
    80003f78:	01353023          	sd	s3,0(a0)
    80003f7c:	01253423          	sd	s2,8(a0)
    80003f80:	00a4b423          	sd	a0,8(s1)
    w = (Wrap*) myHandle;
    80003f84:	00a4b823          	sd	a0,16(s1)
}
    80003f88:	02813083          	ld	ra,40(sp)
    80003f8c:	02013403          	ld	s0,32(sp)
    80003f90:	01813483          	ld	s1,24(sp)
    80003f94:	01013903          	ld	s2,16(sp)
    80003f98:	00813983          	ld	s3,8(sp)
    80003f9c:	03010113          	addi	sp,sp,48
    80003fa0:	00008067          	ret

0000000080003fa4 <_ZN6Thread5startEv>:
void Thread::start(){
    80003fa4:	fe010113          	addi	sp,sp,-32
    80003fa8:	00113c23          	sd	ra,24(sp)
    80003fac:	00813823          	sd	s0,16(sp)
    80003fb0:	00913423          	sd	s1,8(sp)
    80003fb4:	02010413          	addi	s0,sp,32
    if(myHandle)
    80003fb8:	00853483          	ld	s1,8(a0)
    80003fbc:	02048e63          	beqz	s1,80003ff8 <_ZN6Thread5startEv+0x54>
        myHandle = nullptr;
    80003fc0:	00053423          	sd	zero,8(a0)
        thread_create(&myHandle, w->body, (void*)(w->arg));    
    80003fc4:	0084b603          	ld	a2,8(s1)
    80003fc8:	0004b583          	ld	a1,0(s1)
    80003fcc:	00850513          	addi	a0,a0,8
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	6f0080e7          	jalr	1776(ra) # 800036c0 <thread_create>
        delete w;
    80003fd8:	00048513          	mv	a0,s1
    80003fdc:	00000097          	auipc	ra,0x0
    80003fe0:	ee4080e7          	jalr	-284(ra) # 80003ec0 <_ZdlPv>
}
    80003fe4:	01813083          	ld	ra,24(sp)
    80003fe8:	01013403          	ld	s0,16(sp)
    80003fec:	00813483          	ld	s1,8(sp)
    80003ff0:	02010113          	addi	sp,sp,32
    80003ff4:	00008067          	ret
        thread_create(&myHandle, &runWrapper, this);   
    80003ff8:	00050613          	mv	a2,a0
    80003ffc:	00000597          	auipc	a1,0x0
    80004000:	e3858593          	addi	a1,a1,-456 # 80003e34 <_ZN6Thread10runWrapperEPv>
    80004004:	00850513          	addi	a0,a0,8
    80004008:	fffff097          	auipc	ra,0xfffff
    8000400c:	6b8080e7          	jalr	1720(ra) # 800036c0 <thread_create>
}
    80004010:	fd5ff06f          	j	80003fe4 <_ZN6Thread5startEv+0x40>

0000000080004014 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    80004014:	fe010113          	addi	sp,sp,-32
    80004018:	00113c23          	sd	ra,24(sp)
    8000401c:	00813823          	sd	s0,16(sp)
    80004020:	00913423          	sd	s1,8(sp)
    80004024:	01213023          	sd	s2,0(sp)
    80004028:	02010413          	addi	s0,sp,32
    8000402c:	00050493          	mv	s1,a0
    80004030:	00058913          	mv	s2,a1
Thread(periodicWrapper, new WrapPeriod{this, period}){}
    80004034:	01000513          	li	a0,16
    80004038:	00000097          	auipc	ra,0x0
    8000403c:	e60080e7          	jalr	-416(ra) # 80003e98 <_Znwm>
    80004040:	00050613          	mv	a2,a0
    80004044:	00953023          	sd	s1,0(a0)
    80004048:	01253423          	sd	s2,8(a0)
    8000404c:	00000597          	auipc	a1,0x0
    80004050:	e1458593          	addi	a1,a1,-492 # 80003e60 <_ZN14PeriodicThread15periodicWrapperEPv>
    80004054:	00048513          	mv	a0,s1
    80004058:	00000097          	auipc	ra,0x0
    8000405c:	ee0080e7          	jalr	-288(ra) # 80003f38 <_ZN6ThreadC1EPFvPvES0_>
    80004060:	00003797          	auipc	a5,0x3
    80004064:	44078793          	addi	a5,a5,1088 # 800074a0 <_ZTV14PeriodicThread+0x10>
    80004068:	00f4b023          	sd	a5,0(s1)
    8000406c:	01813083          	ld	ra,24(sp)
    80004070:	01013403          	ld	s0,16(sp)
    80004074:	00813483          	ld	s1,8(sp)
    80004078:	00013903          	ld	s2,0(sp)
    8000407c:	02010113          	addi	sp,sp,32
    80004080:	00008067          	ret

0000000080004084 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80004084:	ff010113          	addi	sp,sp,-16
    80004088:	00813423          	sd	s0,8(sp)
    8000408c:	01010413          	addi	s0,sp,16
    80004090:	00813403          	ld	s0,8(sp)
    80004094:	01010113          	addi	sp,sp,16
    80004098:	00008067          	ret

000000008000409c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000409c:	ff010113          	addi	sp,sp,-16
    800040a0:	00813423          	sd	s0,8(sp)
    800040a4:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    800040a8:	00003797          	auipc	a5,0x3
    800040ac:	f8878793          	addi	a5,a5,-120 # 80007030 <_ZTV6Thread+0x10>
    800040b0:	00f53023          	sd	a5,0(a0)
    800040b4:	00853783          	ld	a5,8(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    800040b8:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800040bc:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800040c0:	00000073          	ecall
class PeriodicThread : public Thread {
    800040c4:	00813403          	ld	s0,8(sp)
    800040c8:	01010113          	addi	sp,sp,16
    800040cc:	00008067          	ret

00000000800040d0 <_ZN14PeriodicThreadD0Ev>:
    800040d0:	ff010113          	addi	sp,sp,-16
    800040d4:	00113423          	sd	ra,8(sp)
    800040d8:	00813023          	sd	s0,0(sp)
    800040dc:	01010413          	addi	s0,sp,16
    virtual ~Thread (){ delete myHandle; }
    800040e0:	00003717          	auipc	a4,0x3
    800040e4:	f5070713          	addi	a4,a4,-176 # 80007030 <_ZTV6Thread+0x10>
    800040e8:	00e53023          	sd	a4,0(a0)
    800040ec:	00853783          	ld	a5,8(a0)
        asm volatile("li a0, 0x69");
    800040f0:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    800040f4:	00078593          	mv	a1,a5
        asm volatile("ecall");
    800040f8:	00000073          	ecall
class PeriodicThread : public Thread {
    800040fc:	00000097          	auipc	ra,0x0
    80004100:	dc4080e7          	jalr	-572(ra) # 80003ec0 <_ZdlPv>
    80004104:	00813083          	ld	ra,8(sp)
    80004108:	00013403          	ld	s0,0(sp)
    8000410c:	01010113          	addi	sp,sp,16
    80004110:	00008067          	ret

0000000080004114 <_ZNK8TcbQueue6existsEP3TCB>:
#include"../../h/ptr_queue.hpp"
#include"../../h/testing.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    80004114:	ff010113          	addi	sp,sp,-16
    80004118:	00813423          	sd	s0,8(sp)
    8000411c:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    80004120:	00053783          	ld	a5,0(a0)
    80004124:	00078863          	beqz	a5,80004134 <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    80004128:	00b78e63          	beq	a5,a1,80004144 <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    8000412c:	0007b783          	ld	a5,0(a5)
    80004130:	ff5ff06f          	j	80004124 <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    80004134:	00000513          	li	a0,0
}
    80004138:	00813403          	ld	s0,8(sp)
    8000413c:	01010113          	addi	sp,sp,16
    80004140:	00008067          	ret
            return true;
    80004144:	00100513          	li	a0,1
    80004148:	ff1ff06f          	j	80004138 <_ZNK8TcbQueue6existsEP3TCB+0x24>

000000008000414c <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    8000414c:	ff010113          	addi	sp,sp,-16
    80004150:	00813423          	sd	s0,8(sp)
    80004154:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    80004158:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    8000415c:	00853783          	ld	a5,8(a0)
    80004160:	00078c63          	beqz	a5,80004178 <_ZN8TcbQueue6insertEP3TCB+0x2c>
    80004164:	00b7b023          	sd	a1,0(a5)
    80004168:	00b53423          	sd	a1,8(a0)
    return *this;
}
    8000416c:	00813403          	ld	s0,8(sp)
    80004170:	01010113          	addi	sp,sp,16
    80004174:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80004178:	00b53023          	sd	a1,0(a0)
    8000417c:	fedff06f          	j	80004168 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080004180 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80004180:	ff010113          	addi	sp,sp,-16
    80004184:	00813423          	sd	s0,8(sp)
    80004188:	01010413          	addi	s0,sp,16
    if(head!=nullptr){
    8000418c:	00053783          	ld	a5,0(a0)
    80004190:	00078c63          	beqz	a5,800041a8 <_ZN8TcbQueue6removeEv+0x28>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80004194:	00853703          	ld	a4,8(a0)
    80004198:	02e78063          	beq	a5,a4,800041b8 <_ZN8TcbQueue6removeEv+0x38>
    8000419c:	0007b703          	ld	a4,0(a5)
    800041a0:	00e53023          	sd	a4,0(a0)
        ret->next = nullptr;
    800041a4:	0007b023          	sd	zero,0(a5)
        return ret;            
    }
    return nullptr;
}
    800041a8:	00078513          	mv	a0,a5
    800041ac:	00813403          	ld	s0,8(sp)
    800041b0:	01010113          	addi	sp,sp,16
    800041b4:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    800041b8:	00053423          	sd	zero,8(a0)
    800041bc:	00000713          	li	a4,0
    800041c0:	fe1ff06f          	j	800041a0 <_ZN8TcbQueue6removeEv+0x20>

00000000800041c4 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    800041c4:	ff010113          	addi	sp,sp,-16
    800041c8:	00813423          	sd	s0,8(sp)
    800041cc:	01010413          	addi	s0,sp,16
    return head;
}
    800041d0:	00053503          	ld	a0,0(a0)
    800041d4:	00813403          	ld	s0,8(sp)
    800041d8:	01010113          	addi	sp,sp,16
    800041dc:	00008067          	ret

00000000800041e0 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    800041e0:	fe010113          	addi	sp,sp,-32
    800041e4:	00113c23          	sd	ra,24(sp)
    800041e8:	00813823          	sd	s0,16(sp)
    800041ec:	00913423          	sd	s1,8(sp)
    800041f0:	02010413          	addi	s0,sp,32
    TCB* t = head;
    800041f4:	00053483          	ld	s1,0(a0)
    while(t){
    800041f8:	02048a63          	beqz	s1,8000422c <_ZN8TcbQueue10printQueueEv+0x4c>
        print("->",' ');
    800041fc:	02000593          	li	a1,32
    80004200:	00003517          	auipc	a0,0x3
    80004204:	2c050513          	addi	a0,a0,704 # 800074c0 <_ZTV14PeriodicThread+0x30>
    80004208:	fffff097          	auipc	ra,0xfffff
    8000420c:	fa0080e7          	jalr	-96(ra) # 800031a8 <_Z5printPKcc>
        print((uint64)t, ' ', 0);
    80004210:	00000613          	li	a2,0
    80004214:	02000593          	li	a1,32
    80004218:	00048513          	mv	a0,s1
    8000421c:	fffff097          	auipc	ra,0xfffff
    80004220:	e40080e7          	jalr	-448(ra) # 8000305c <_Z5printmcb>
        t = t->next;            
    80004224:	0004b483          	ld	s1,0(s1)
    while(t){
    80004228:	fd1ff06f          	j	800041f8 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    print("");
    8000422c:	00a00593          	li	a1,10
    80004230:	00003517          	auipc	a0,0x3
    80004234:	f6050513          	addi	a0,a0,-160 # 80007190 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xd8>
    80004238:	fffff097          	auipc	ra,0xfffff
    8000423c:	f70080e7          	jalr	-144(ra) # 800031a8 <_Z5printPKcc>
}
    80004240:	01813083          	ld	ra,24(sp)
    80004244:	01013403          	ld	s0,16(sp)
    80004248:	00813483          	ld	s1,8(sp)
    8000424c:	02010113          	addi	sp,sp,32
    80004250:	00008067          	ret

0000000080004254 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    80004254:	fc010113          	addi	sp,sp,-64
    80004258:	02113c23          	sd	ra,56(sp)
    8000425c:	02813823          	sd	s0,48(sp)
    80004260:	02913423          	sd	s1,40(sp)
    80004264:	03213023          	sd	s2,32(sp)
    80004268:	01313c23          	sd	s3,24(sp)
    8000426c:	01413823          	sd	s4,16(sp)
    80004270:	01513423          	sd	s5,8(sp)
    80004274:	04010413          	addi	s0,sp,64
    80004278:	00050a93          	mv	s5,a0
    8000427c:	00058913          	mv	s2,a1
    80004280:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80004284:	00053483          	ld	s1,0(a0)
    80004288:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    8000428c:	02048063          	beqz	s1,800042ac <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80004290:	00048593          	mv	a1,s1
    80004294:	00090513          	mv	a0,s2
    80004298:	000a00e7          	jalr	s4
    8000429c:	00054863          	bltz	a0,800042ac <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    800042a0:	00048993          	mv	s3,s1
        cur = cur->next;
    800042a4:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    800042a8:	fe5ff06f          	j	8000428c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    800042ac:	02098a63          	beqz	s3,800042e0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x8c>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    800042b0:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    800042b4:	04048463          	beqz	s1,800042fc <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa8>
    800042b8:	0129b023          	sd	s2,0(s3)
    }
}
    800042bc:	03813083          	ld	ra,56(sp)
    800042c0:	03013403          	ld	s0,48(sp)
    800042c4:	02813483          	ld	s1,40(sp)
    800042c8:	02013903          	ld	s2,32(sp)
    800042cc:	01813983          	ld	s3,24(sp)
    800042d0:	01013a03          	ld	s4,16(sp)
    800042d4:	00813a83          	ld	s5,8(sp)
    800042d8:	04010113          	addi	sp,sp,64
    800042dc:	00008067          	ret
        info->next = head;
    800042e0:	000ab783          	ld	a5,0(s5)
    800042e4:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    800042e8:	00078663          	beqz	a5,800042f4 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa0>
    800042ec:	012ab023          	sd	s2,0(s5)
    800042f0:	fcdff06f          	j	800042bc <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    800042f4:	012ab423          	sd	s2,8(s5)
    800042f8:	ff5ff06f          	j	800042ec <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        prev->next = cur==nullptr?(tail=info):info;
    800042fc:	012ab423          	sd	s2,8(s5)
    80004300:	fb9ff06f          	j	800042b8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

0000000080004304 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    80004304:	ff010113          	addi	sp,sp,-16
    80004308:	00813423          	sd	s0,8(sp)
    8000430c:	01010413          	addi	s0,sp,16
    info->next = head;
    80004310:	00053783          	ld	a5,0(a0)
    80004314:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    80004318:	00078a63          	beqz	a5,8000432c <_ZN8TcbQueue11insertFrontEP3TCB+0x28>
    8000431c:	00b53023          	sd	a1,0(a0)
    80004320:	00813403          	ld	s0,8(sp)
    80004324:	01010113          	addi	sp,sp,16
    80004328:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    8000432c:	00b53423          	sd	a1,8(a0)
    80004330:	fedff06f          	j	8000431c <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

0000000080004334 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004334:	fe010113          	addi	sp,sp,-32
    80004338:	00113c23          	sd	ra,24(sp)
    8000433c:	00813823          	sd	s0,16(sp)
    80004340:	00913423          	sd	s1,8(sp)
    80004344:	01213023          	sd	s2,0(sp)
    80004348:	02010413          	addi	s0,sp,32
    8000434c:	00050493          	mv	s1,a0
    80004350:	00058913          	mv	s2,a1
    80004354:	0015879b          	addiw	a5,a1,1
    80004358:	0007851b          	sext.w	a0,a5
    8000435c:	00f4a023          	sw	a5,0(s1)
    80004360:	0004a823          	sw	zero,16(s1)
    80004364:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004368:	00251513          	slli	a0,a0,0x2
    8000436c:	fffff097          	auipc	ra,0xfffff
    80004370:	2c8080e7          	jalr	712(ra) # 80003634 <mem_alloc>
    80004374:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004378:	00000593          	li	a1,0
    8000437c:	02048513          	addi	a0,s1,32
    80004380:	fffff097          	auipc	ra,0xfffff
    80004384:	3f8080e7          	jalr	1016(ra) # 80003778 <sem_open>
    sem_open(&spaceAvailable, _cap);
    80004388:	00090593          	mv	a1,s2
    8000438c:	01848513          	addi	a0,s1,24
    80004390:	fffff097          	auipc	ra,0xfffff
    80004394:	3e8080e7          	jalr	1000(ra) # 80003778 <sem_open>
    sem_open(&mutexHead, 1);
    80004398:	00100593          	li	a1,1
    8000439c:	02848513          	addi	a0,s1,40
    800043a0:	fffff097          	auipc	ra,0xfffff
    800043a4:	3d8080e7          	jalr	984(ra) # 80003778 <sem_open>
    sem_open(&mutexTail, 1);
    800043a8:	00100593          	li	a1,1
    800043ac:	03048513          	addi	a0,s1,48
    800043b0:	fffff097          	auipc	ra,0xfffff
    800043b4:	3c8080e7          	jalr	968(ra) # 80003778 <sem_open>
}
    800043b8:	01813083          	ld	ra,24(sp)
    800043bc:	01013403          	ld	s0,16(sp)
    800043c0:	00813483          	ld	s1,8(sp)
    800043c4:	00013903          	ld	s2,0(sp)
    800043c8:	02010113          	addi	sp,sp,32
    800043cc:	00008067          	ret

00000000800043d0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800043d0:	fe010113          	addi	sp,sp,-32
    800043d4:	00113c23          	sd	ra,24(sp)
    800043d8:	00813823          	sd	s0,16(sp)
    800043dc:	00913423          	sd	s1,8(sp)
    800043e0:	01213023          	sd	s2,0(sp)
    800043e4:	02010413          	addi	s0,sp,32
    800043e8:	00050493          	mv	s1,a0
    800043ec:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800043f0:	01853503          	ld	a0,24(a0)
    800043f4:	fffff097          	auipc	ra,0xfffff
    800043f8:	3f8080e7          	jalr	1016(ra) # 800037ec <sem_wait>

    sem_wait(mutexTail);
    800043fc:	0304b503          	ld	a0,48(s1)
    80004400:	fffff097          	auipc	ra,0xfffff
    80004404:	3ec080e7          	jalr	1004(ra) # 800037ec <sem_wait>
    buffer[tail] = val;
    80004408:	0084b783          	ld	a5,8(s1)
    8000440c:	0144a703          	lw	a4,20(s1)
    80004410:	00271713          	slli	a4,a4,0x2
    80004414:	00e787b3          	add	a5,a5,a4
    80004418:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000441c:	0144a783          	lw	a5,20(s1)
    80004420:	0017879b          	addiw	a5,a5,1
    80004424:	0004a703          	lw	a4,0(s1)
    80004428:	02e7e7bb          	remw	a5,a5,a4
    8000442c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004430:	0304b503          	ld	a0,48(s1)
    80004434:	fffff097          	auipc	ra,0xfffff
    80004438:	3f0080e7          	jalr	1008(ra) # 80003824 <sem_signal>

    sem_signal(itemAvailable);
    8000443c:	0204b503          	ld	a0,32(s1)
    80004440:	fffff097          	auipc	ra,0xfffff
    80004444:	3e4080e7          	jalr	996(ra) # 80003824 <sem_signal>

}
    80004448:	01813083          	ld	ra,24(sp)
    8000444c:	01013403          	ld	s0,16(sp)
    80004450:	00813483          	ld	s1,8(sp)
    80004454:	00013903          	ld	s2,0(sp)
    80004458:	02010113          	addi	sp,sp,32
    8000445c:	00008067          	ret

0000000080004460 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004460:	fe010113          	addi	sp,sp,-32
    80004464:	00113c23          	sd	ra,24(sp)
    80004468:	00813823          	sd	s0,16(sp)
    8000446c:	00913423          	sd	s1,8(sp)
    80004470:	01213023          	sd	s2,0(sp)
    80004474:	02010413          	addi	s0,sp,32
    80004478:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000447c:	02053503          	ld	a0,32(a0)
    80004480:	fffff097          	auipc	ra,0xfffff
    80004484:	36c080e7          	jalr	876(ra) # 800037ec <sem_wait>

    sem_wait(mutexHead);
    80004488:	0284b503          	ld	a0,40(s1)
    8000448c:	fffff097          	auipc	ra,0xfffff
    80004490:	360080e7          	jalr	864(ra) # 800037ec <sem_wait>

    int ret = buffer[head];
    80004494:	0084b703          	ld	a4,8(s1)
    80004498:	0104a783          	lw	a5,16(s1)
    8000449c:	00279693          	slli	a3,a5,0x2
    800044a0:	00d70733          	add	a4,a4,a3
    800044a4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800044a8:	0017879b          	addiw	a5,a5,1
    800044ac:	0004a703          	lw	a4,0(s1)
    800044b0:	02e7e7bb          	remw	a5,a5,a4
    800044b4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800044b8:	0284b503          	ld	a0,40(s1)
    800044bc:	fffff097          	auipc	ra,0xfffff
    800044c0:	368080e7          	jalr	872(ra) # 80003824 <sem_signal>

    sem_signal(spaceAvailable);
    800044c4:	0184b503          	ld	a0,24(s1)
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	35c080e7          	jalr	860(ra) # 80003824 <sem_signal>

    return ret;
}
    800044d0:	00090513          	mv	a0,s2
    800044d4:	01813083          	ld	ra,24(sp)
    800044d8:	01013403          	ld	s0,16(sp)
    800044dc:	00813483          	ld	s1,8(sp)
    800044e0:	00013903          	ld	s2,0(sp)
    800044e4:	02010113          	addi	sp,sp,32
    800044e8:	00008067          	ret

00000000800044ec <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800044ec:	fe010113          	addi	sp,sp,-32
    800044f0:	00113c23          	sd	ra,24(sp)
    800044f4:	00813823          	sd	s0,16(sp)
    800044f8:	00913423          	sd	s1,8(sp)
    800044fc:	01213023          	sd	s2,0(sp)
    80004500:	02010413          	addi	s0,sp,32
    80004504:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004508:	02853503          	ld	a0,40(a0)
    8000450c:	fffff097          	auipc	ra,0xfffff
    80004510:	2e0080e7          	jalr	736(ra) # 800037ec <sem_wait>
    sem_wait(mutexTail);
    80004514:	0304b503          	ld	a0,48(s1)
    80004518:	fffff097          	auipc	ra,0xfffff
    8000451c:	2d4080e7          	jalr	724(ra) # 800037ec <sem_wait>

    if (tail >= head) {
    80004520:	0144a783          	lw	a5,20(s1)
    80004524:	0104a903          	lw	s2,16(s1)
    80004528:	0327ce63          	blt	a5,s2,80004564 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000452c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004530:	0304b503          	ld	a0,48(s1)
    80004534:	fffff097          	auipc	ra,0xfffff
    80004538:	2f0080e7          	jalr	752(ra) # 80003824 <sem_signal>
    sem_signal(mutexHead);
    8000453c:	0284b503          	ld	a0,40(s1)
    80004540:	fffff097          	auipc	ra,0xfffff
    80004544:	2e4080e7          	jalr	740(ra) # 80003824 <sem_signal>

    return ret;
}
    80004548:	00090513          	mv	a0,s2
    8000454c:	01813083          	ld	ra,24(sp)
    80004550:	01013403          	ld	s0,16(sp)
    80004554:	00813483          	ld	s1,8(sp)
    80004558:	00013903          	ld	s2,0(sp)
    8000455c:	02010113          	addi	sp,sp,32
    80004560:	00008067          	ret
        ret = cap - head + tail;
    80004564:	0004a703          	lw	a4,0(s1)
    80004568:	4127093b          	subw	s2,a4,s2
    8000456c:	00f9093b          	addw	s2,s2,a5
    80004570:	fc1ff06f          	j	80004530 <_ZN6Buffer6getCntEv+0x44>

0000000080004574 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004574:	fe010113          	addi	sp,sp,-32
    80004578:	00113c23          	sd	ra,24(sp)
    8000457c:	00813823          	sd	s0,16(sp)
    80004580:	00913423          	sd	s1,8(sp)
    80004584:	02010413          	addi	s0,sp,32
    80004588:	00050493          	mv	s1,a0
    putc('\n');
    8000458c:	00a00513          	li	a0,10
    80004590:	fffff097          	auipc	ra,0xfffff
    80004594:	340080e7          	jalr	832(ra) # 800038d0 <putc>
    printString("Buffer deleted!\n");
    80004598:	00003517          	auipc	a0,0x3
    8000459c:	f3050513          	addi	a0,a0,-208 # 800074c8 <_ZTV14PeriodicThread+0x38>
    800045a0:	00000097          	auipc	ra,0x0
    800045a4:	51c080e7          	jalr	1308(ra) # 80004abc <_Z11printStringPKc>
    while (getCnt() > 0) {
    800045a8:	00048513          	mv	a0,s1
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	f40080e7          	jalr	-192(ra) # 800044ec <_ZN6Buffer6getCntEv>
    800045b4:	02a05c63          	blez	a0,800045ec <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800045b8:	0084b783          	ld	a5,8(s1)
    800045bc:	0104a703          	lw	a4,16(s1)
    800045c0:	00271713          	slli	a4,a4,0x2
    800045c4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800045c8:	0007c503          	lbu	a0,0(a5)
    800045cc:	fffff097          	auipc	ra,0xfffff
    800045d0:	304080e7          	jalr	772(ra) # 800038d0 <putc>
        head = (head + 1) % cap;
    800045d4:	0104a783          	lw	a5,16(s1)
    800045d8:	0017879b          	addiw	a5,a5,1
    800045dc:	0004a703          	lw	a4,0(s1)
    800045e0:	02e7e7bb          	remw	a5,a5,a4
    800045e4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800045e8:	fc1ff06f          	j	800045a8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800045ec:	02100513          	li	a0,33
    800045f0:	fffff097          	auipc	ra,0xfffff
    800045f4:	2e0080e7          	jalr	736(ra) # 800038d0 <putc>
    putc('\n');
    800045f8:	00a00513          	li	a0,10
    800045fc:	fffff097          	auipc	ra,0xfffff
    80004600:	2d4080e7          	jalr	724(ra) # 800038d0 <putc>
    mem_free(buffer);
    80004604:	0084b503          	ld	a0,8(s1)
    80004608:	fffff097          	auipc	ra,0xfffff
    8000460c:	064080e7          	jalr	100(ra) # 8000366c <mem_free>
    sem_close(itemAvailable);
    80004610:	0204b503          	ld	a0,32(s1)
    80004614:	fffff097          	auipc	ra,0xfffff
    80004618:	1a0080e7          	jalr	416(ra) # 800037b4 <sem_close>
    sem_close(spaceAvailable);
    8000461c:	0184b503          	ld	a0,24(s1)
    80004620:	fffff097          	auipc	ra,0xfffff
    80004624:	194080e7          	jalr	404(ra) # 800037b4 <sem_close>
    sem_close(mutexTail);
    80004628:	0304b503          	ld	a0,48(s1)
    8000462c:	fffff097          	auipc	ra,0xfffff
    80004630:	188080e7          	jalr	392(ra) # 800037b4 <sem_close>
    sem_close(mutexHead);
    80004634:	0284b503          	ld	a0,40(s1)
    80004638:	fffff097          	auipc	ra,0xfffff
    8000463c:	17c080e7          	jalr	380(ra) # 800037b4 <sem_close>
}
    80004640:	01813083          	ld	ra,24(sp)
    80004644:	01013403          	ld	s0,16(sp)
    80004648:	00813483          	ld	s1,8(sp)
    8000464c:	02010113          	addi	sp,sp,32
    80004650:	00008067          	ret

0000000080004654 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004654:	fd010113          	addi	sp,sp,-48
    80004658:	02113423          	sd	ra,40(sp)
    8000465c:	02813023          	sd	s0,32(sp)
    80004660:	00913c23          	sd	s1,24(sp)
    80004664:	01213823          	sd	s2,16(sp)
    80004668:	01313423          	sd	s3,8(sp)
    8000466c:	03010413          	addi	s0,sp,48
    80004670:	00050493          	mv	s1,a0
    80004674:	00058993          	mv	s3,a1
    80004678:	0015879b          	addiw	a5,a1,1
    8000467c:	0007851b          	sext.w	a0,a5
    80004680:	00f4a023          	sw	a5,0(s1)
    80004684:	0004a823          	sw	zero,16(s1)
    80004688:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000468c:	00251513          	slli	a0,a0,0x2
    80004690:	fffff097          	auipc	ra,0xfffff
    80004694:	fa4080e7          	jalr	-92(ra) # 80003634 <mem_alloc>
    80004698:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000469c:	01000513          	li	a0,16
    800046a0:	fffff097          	auipc	ra,0xfffff
    800046a4:	7f8080e7          	jalr	2040(ra) # 80003e98 <_Znwm>
    800046a8:	00050913          	mv	s2,a0
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    800046ac:	00003797          	auipc	a5,0x3
    800046b0:	9ac78793          	addi	a5,a5,-1620 # 80007058 <_ZTV9Semaphore+0x10>
    800046b4:	00f53023          	sd	a5,0(a0)
    800046b8:	00000593          	li	a1,0
    800046bc:	00850513          	addi	a0,a0,8
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	0b8080e7          	jalr	184(ra) # 80003778 <sem_open>
    800046c8:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800046cc:	01000513          	li	a0,16
    800046d0:	fffff097          	auipc	ra,0xfffff
    800046d4:	7c8080e7          	jalr	1992(ra) # 80003e98 <_Znwm>
    800046d8:	00050913          	mv	s2,a0
    800046dc:	00003797          	auipc	a5,0x3
    800046e0:	97c78793          	addi	a5,a5,-1668 # 80007058 <_ZTV9Semaphore+0x10>
    800046e4:	00f53023          	sd	a5,0(a0)
    800046e8:	00098593          	mv	a1,s3
    800046ec:	00850513          	addi	a0,a0,8
    800046f0:	fffff097          	auipc	ra,0xfffff
    800046f4:	088080e7          	jalr	136(ra) # 80003778 <sem_open>
    800046f8:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    800046fc:	01000513          	li	a0,16
    80004700:	fffff097          	auipc	ra,0xfffff
    80004704:	798080e7          	jalr	1944(ra) # 80003e98 <_Znwm>
    80004708:	00050913          	mv	s2,a0
    8000470c:	00003797          	auipc	a5,0x3
    80004710:	94c78793          	addi	a5,a5,-1716 # 80007058 <_ZTV9Semaphore+0x10>
    80004714:	00f53023          	sd	a5,0(a0)
    80004718:	00100593          	li	a1,1
    8000471c:	00850513          	addi	a0,a0,8
    80004720:	fffff097          	auipc	ra,0xfffff
    80004724:	058080e7          	jalr	88(ra) # 80003778 <sem_open>
    80004728:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000472c:	01000513          	li	a0,16
    80004730:	fffff097          	auipc	ra,0xfffff
    80004734:	768080e7          	jalr	1896(ra) # 80003e98 <_Znwm>
    80004738:	00050913          	mv	s2,a0
    8000473c:	00003797          	auipc	a5,0x3
    80004740:	91c78793          	addi	a5,a5,-1764 # 80007058 <_ZTV9Semaphore+0x10>
    80004744:	00f53023          	sd	a5,0(a0)
    80004748:	00100593          	li	a1,1
    8000474c:	00850513          	addi	a0,a0,8
    80004750:	fffff097          	auipc	ra,0xfffff
    80004754:	028080e7          	jalr	40(ra) # 80003778 <sem_open>
    80004758:	0324b823          	sd	s2,48(s1)
}
    8000475c:	02813083          	ld	ra,40(sp)
    80004760:	02013403          	ld	s0,32(sp)
    80004764:	01813483          	ld	s1,24(sp)
    80004768:	01013903          	ld	s2,16(sp)
    8000476c:	00813983          	ld	s3,8(sp)
    80004770:	03010113          	addi	sp,sp,48
    80004774:	00008067          	ret
    80004778:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000477c:	00090513          	mv	a0,s2
    80004780:	fffff097          	auipc	ra,0xfffff
    80004784:	740080e7          	jalr	1856(ra) # 80003ec0 <_ZdlPv>
    80004788:	00048513          	mv	a0,s1
    8000478c:	00005097          	auipc	ra,0x5
    80004790:	77c080e7          	jalr	1916(ra) # 80009f08 <_Unwind_Resume>
    80004794:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004798:	00090513          	mv	a0,s2
    8000479c:	fffff097          	auipc	ra,0xfffff
    800047a0:	724080e7          	jalr	1828(ra) # 80003ec0 <_ZdlPv>
    800047a4:	00048513          	mv	a0,s1
    800047a8:	00005097          	auipc	ra,0x5
    800047ac:	760080e7          	jalr	1888(ra) # 80009f08 <_Unwind_Resume>
    800047b0:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800047b4:	00090513          	mv	a0,s2
    800047b8:	fffff097          	auipc	ra,0xfffff
    800047bc:	708080e7          	jalr	1800(ra) # 80003ec0 <_ZdlPv>
    800047c0:	00048513          	mv	a0,s1
    800047c4:	00005097          	auipc	ra,0x5
    800047c8:	744080e7          	jalr	1860(ra) # 80009f08 <_Unwind_Resume>
    800047cc:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800047d0:	00090513          	mv	a0,s2
    800047d4:	fffff097          	auipc	ra,0xfffff
    800047d8:	6ec080e7          	jalr	1772(ra) # 80003ec0 <_ZdlPv>
    800047dc:	00048513          	mv	a0,s1
    800047e0:	00005097          	auipc	ra,0x5
    800047e4:	728080e7          	jalr	1832(ra) # 80009f08 <_Unwind_Resume>

00000000800047e8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800047e8:	fe010113          	addi	sp,sp,-32
    800047ec:	00113c23          	sd	ra,24(sp)
    800047f0:	00813823          	sd	s0,16(sp)
    800047f4:	00913423          	sd	s1,8(sp)
    800047f8:	01213023          	sd	s2,0(sp)
    800047fc:	02010413          	addi	s0,sp,32
    80004800:	00050493          	mv	s1,a0
    80004804:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004808:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    8000480c:	0087b503          	ld	a0,8(a5)
    80004810:	fffff097          	auipc	ra,0xfffff
    80004814:	fdc080e7          	jalr	-36(ra) # 800037ec <sem_wait>

    mutexTail->wait();
    80004818:	0304b783          	ld	a5,48(s1)
    8000481c:	0087b503          	ld	a0,8(a5)
    80004820:	fffff097          	auipc	ra,0xfffff
    80004824:	fcc080e7          	jalr	-52(ra) # 800037ec <sem_wait>
    buffer[tail] = val;
    80004828:	0084b783          	ld	a5,8(s1)
    8000482c:	0144a703          	lw	a4,20(s1)
    80004830:	00271713          	slli	a4,a4,0x2
    80004834:	00e787b3          	add	a5,a5,a4
    80004838:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000483c:	0144a783          	lw	a5,20(s1)
    80004840:	0017879b          	addiw	a5,a5,1
    80004844:	0004a703          	lw	a4,0(s1)
    80004848:	02e7e7bb          	remw	a5,a5,a4
    8000484c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004850:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004854:	0087b503          	ld	a0,8(a5)
    80004858:	fffff097          	auipc	ra,0xfffff
    8000485c:	fcc080e7          	jalr	-52(ra) # 80003824 <sem_signal>

    itemAvailable->signal();
    80004860:	0204b783          	ld	a5,32(s1)
    80004864:	0087b503          	ld	a0,8(a5)
    80004868:	fffff097          	auipc	ra,0xfffff
    8000486c:	fbc080e7          	jalr	-68(ra) # 80003824 <sem_signal>

}
    80004870:	01813083          	ld	ra,24(sp)
    80004874:	01013403          	ld	s0,16(sp)
    80004878:	00813483          	ld	s1,8(sp)
    8000487c:	00013903          	ld	s2,0(sp)
    80004880:	02010113          	addi	sp,sp,32
    80004884:	00008067          	ret

0000000080004888 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004888:	fe010113          	addi	sp,sp,-32
    8000488c:	00113c23          	sd	ra,24(sp)
    80004890:	00813823          	sd	s0,16(sp)
    80004894:	00913423          	sd	s1,8(sp)
    80004898:	01213023          	sd	s2,0(sp)
    8000489c:	02010413          	addi	s0,sp,32
    800048a0:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800048a4:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    800048a8:	0087b503          	ld	a0,8(a5)
    800048ac:	fffff097          	auipc	ra,0xfffff
    800048b0:	f40080e7          	jalr	-192(ra) # 800037ec <sem_wait>

    mutexHead->wait();
    800048b4:	0284b783          	ld	a5,40(s1)
    800048b8:	0087b503          	ld	a0,8(a5)
    800048bc:	fffff097          	auipc	ra,0xfffff
    800048c0:	f30080e7          	jalr	-208(ra) # 800037ec <sem_wait>

    int ret = buffer[head];
    800048c4:	0084b703          	ld	a4,8(s1)
    800048c8:	0104a783          	lw	a5,16(s1)
    800048cc:	00279693          	slli	a3,a5,0x2
    800048d0:	00d70733          	add	a4,a4,a3
    800048d4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800048d8:	0017879b          	addiw	a5,a5,1
    800048dc:	0004a703          	lw	a4,0(s1)
    800048e0:	02e7e7bb          	remw	a5,a5,a4
    800048e4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800048e8:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    800048ec:	0087b503          	ld	a0,8(a5)
    800048f0:	fffff097          	auipc	ra,0xfffff
    800048f4:	f34080e7          	jalr	-204(ra) # 80003824 <sem_signal>

    spaceAvailable->signal();
    800048f8:	0184b783          	ld	a5,24(s1)
    800048fc:	0087b503          	ld	a0,8(a5)
    80004900:	fffff097          	auipc	ra,0xfffff
    80004904:	f24080e7          	jalr	-220(ra) # 80003824 <sem_signal>

    return ret;
}
    80004908:	00090513          	mv	a0,s2
    8000490c:	01813083          	ld	ra,24(sp)
    80004910:	01013403          	ld	s0,16(sp)
    80004914:	00813483          	ld	s1,8(sp)
    80004918:	00013903          	ld	s2,0(sp)
    8000491c:	02010113          	addi	sp,sp,32
    80004920:	00008067          	ret

0000000080004924 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004924:	fe010113          	addi	sp,sp,-32
    80004928:	00113c23          	sd	ra,24(sp)
    8000492c:	00813823          	sd	s0,16(sp)
    80004930:	00913423          	sd	s1,8(sp)
    80004934:	01213023          	sd	s2,0(sp)
    80004938:	02010413          	addi	s0,sp,32
    8000493c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004940:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    80004944:	0087b503          	ld	a0,8(a5)
    80004948:	fffff097          	auipc	ra,0xfffff
    8000494c:	ea4080e7          	jalr	-348(ra) # 800037ec <sem_wait>
    mutexTail->wait();
    80004950:	0304b783          	ld	a5,48(s1)
    80004954:	0087b503          	ld	a0,8(a5)
    80004958:	fffff097          	auipc	ra,0xfffff
    8000495c:	e94080e7          	jalr	-364(ra) # 800037ec <sem_wait>

    if (tail >= head) {
    80004960:	0144a783          	lw	a5,20(s1)
    80004964:	0104a903          	lw	s2,16(s1)
    80004968:	0527c263          	blt	a5,s2,800049ac <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    8000496c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004970:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004974:	0087b503          	ld	a0,8(a5)
    80004978:	fffff097          	auipc	ra,0xfffff
    8000497c:	eac080e7          	jalr	-340(ra) # 80003824 <sem_signal>
    mutexHead->signal();
    80004980:	0284b783          	ld	a5,40(s1)
    80004984:	0087b503          	ld	a0,8(a5)
    80004988:	fffff097          	auipc	ra,0xfffff
    8000498c:	e9c080e7          	jalr	-356(ra) # 80003824 <sem_signal>

    return ret;
}
    80004990:	00090513          	mv	a0,s2
    80004994:	01813083          	ld	ra,24(sp)
    80004998:	01013403          	ld	s0,16(sp)
    8000499c:	00813483          	ld	s1,8(sp)
    800049a0:	00013903          	ld	s2,0(sp)
    800049a4:	02010113          	addi	sp,sp,32
    800049a8:	00008067          	ret
        ret = cap - head + tail;
    800049ac:	0004a703          	lw	a4,0(s1)
    800049b0:	4127093b          	subw	s2,a4,s2
    800049b4:	00f9093b          	addw	s2,s2,a5
    800049b8:	fb9ff06f          	j	80004970 <_ZN9BufferCPP6getCntEv+0x4c>

00000000800049bc <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800049bc:	fe010113          	addi	sp,sp,-32
    800049c0:	00113c23          	sd	ra,24(sp)
    800049c4:	00813823          	sd	s0,16(sp)
    800049c8:	00913423          	sd	s1,8(sp)
    800049cc:	02010413          	addi	s0,sp,32
    800049d0:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800049d4:	00a00513          	li	a0,10
    800049d8:	fffff097          	auipc	ra,0xfffff
    800049dc:	ef8080e7          	jalr	-264(ra) # 800038d0 <putc>
    printString("Buffer deleted!\n");
    800049e0:	00003517          	auipc	a0,0x3
    800049e4:	ae850513          	addi	a0,a0,-1304 # 800074c8 <_ZTV14PeriodicThread+0x38>
    800049e8:	00000097          	auipc	ra,0x0
    800049ec:	0d4080e7          	jalr	212(ra) # 80004abc <_Z11printStringPKc>
    while (getCnt()) {
    800049f0:	00048513          	mv	a0,s1
    800049f4:	00000097          	auipc	ra,0x0
    800049f8:	f30080e7          	jalr	-208(ra) # 80004924 <_ZN9BufferCPP6getCntEv>
    800049fc:	02050c63          	beqz	a0,80004a34 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004a00:	0084b783          	ld	a5,8(s1)
    80004a04:	0104a703          	lw	a4,16(s1)
    80004a08:	00271713          	slli	a4,a4,0x2
    80004a0c:	00e787b3          	add	a5,a5,a4
    80004a10:	0007c503          	lbu	a0,0(a5)
    80004a14:	fffff097          	auipc	ra,0xfffff
    80004a18:	ebc080e7          	jalr	-324(ra) # 800038d0 <putc>
        head = (head + 1) % cap;
    80004a1c:	0104a783          	lw	a5,16(s1)
    80004a20:	0017879b          	addiw	a5,a5,1
    80004a24:	0004a703          	lw	a4,0(s1)
    80004a28:	02e7e7bb          	remw	a5,a5,a4
    80004a2c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004a30:	fc1ff06f          	j	800049f0 <_ZN9BufferCPPD1Ev+0x34>
    80004a34:	02100513          	li	a0,33
    80004a38:	fffff097          	auipc	ra,0xfffff
    80004a3c:	e98080e7          	jalr	-360(ra) # 800038d0 <putc>
    80004a40:	00a00513          	li	a0,10
    80004a44:	fffff097          	auipc	ra,0xfffff
    80004a48:	e8c080e7          	jalr	-372(ra) # 800038d0 <putc>
    mem_free(buffer);
    80004a4c:	0084b503          	ld	a0,8(s1)
    80004a50:	fffff097          	auipc	ra,0xfffff
    80004a54:	c1c080e7          	jalr	-996(ra) # 8000366c <mem_free>
    delete itemAvailable;
    80004a58:	0204b503          	ld	a0,32(s1)
    80004a5c:	00050863          	beqz	a0,80004a6c <_ZN9BufferCPPD1Ev+0xb0>
    80004a60:	00053783          	ld	a5,0(a0)
    80004a64:	0087b783          	ld	a5,8(a5)
    80004a68:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004a6c:	0184b503          	ld	a0,24(s1)
    80004a70:	00050863          	beqz	a0,80004a80 <_ZN9BufferCPPD1Ev+0xc4>
    80004a74:	00053783          	ld	a5,0(a0)
    80004a78:	0087b783          	ld	a5,8(a5)
    80004a7c:	000780e7          	jalr	a5
    delete mutexTail;
    80004a80:	0304b503          	ld	a0,48(s1)
    80004a84:	00050863          	beqz	a0,80004a94 <_ZN9BufferCPPD1Ev+0xd8>
    80004a88:	00053783          	ld	a5,0(a0)
    80004a8c:	0087b783          	ld	a5,8(a5)
    80004a90:	000780e7          	jalr	a5
    delete mutexHead;
    80004a94:	0284b503          	ld	a0,40(s1)
    80004a98:	00050863          	beqz	a0,80004aa8 <_ZN9BufferCPPD1Ev+0xec>
    80004a9c:	00053783          	ld	a5,0(a0)
    80004aa0:	0087b783          	ld	a5,8(a5)
    80004aa4:	000780e7          	jalr	a5
}
    80004aa8:	01813083          	ld	ra,24(sp)
    80004aac:	01013403          	ld	s0,16(sp)
    80004ab0:	00813483          	ld	s1,8(sp)
    80004ab4:	02010113          	addi	sp,sp,32
    80004ab8:	00008067          	ret

0000000080004abc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00113c23          	sd	ra,24(sp)
    80004ac4:	00813823          	sd	s0,16(sp)
    80004ac8:	00913423          	sd	s1,8(sp)
    80004acc:	02010413          	addi	s0,sp,32
    80004ad0:	00050493          	mv	s1,a0
    LOCK();
    80004ad4:	00100613          	li	a2,1
    80004ad8:	00000593          	li	a1,0
    80004adc:	00004517          	auipc	a0,0x4
    80004ae0:	30450513          	addi	a0,a0,772 # 80008de0 <lockPrint>
    80004ae4:	ffffc097          	auipc	ra,0xffffc
    80004ae8:	738080e7          	jalr	1848(ra) # 8000121c <copy_and_swap>
    80004aec:	fe0514e3          	bnez	a0,80004ad4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004af0:	0004c503          	lbu	a0,0(s1)
    80004af4:	00050a63          	beqz	a0,80004b08 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	dd8080e7          	jalr	-552(ra) # 800038d0 <putc>
        string++;
    80004b00:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004b04:	fedff06f          	j	80004af0 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80004b08:	00000613          	li	a2,0
    80004b0c:	00100593          	li	a1,1
    80004b10:	00004517          	auipc	a0,0x4
    80004b14:	2d050513          	addi	a0,a0,720 # 80008de0 <lockPrint>
    80004b18:	ffffc097          	auipc	ra,0xffffc
    80004b1c:	704080e7          	jalr	1796(ra) # 8000121c <copy_and_swap>
    80004b20:	fe0514e3          	bnez	a0,80004b08 <_Z11printStringPKc+0x4c>
}
    80004b24:	01813083          	ld	ra,24(sp)
    80004b28:	01013403          	ld	s0,16(sp)
    80004b2c:	00813483          	ld	s1,8(sp)
    80004b30:	02010113          	addi	sp,sp,32
    80004b34:	00008067          	ret

0000000080004b38 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004b38:	fd010113          	addi	sp,sp,-48
    80004b3c:	02113423          	sd	ra,40(sp)
    80004b40:	02813023          	sd	s0,32(sp)
    80004b44:	00913c23          	sd	s1,24(sp)
    80004b48:	01213823          	sd	s2,16(sp)
    80004b4c:	01313423          	sd	s3,8(sp)
    80004b50:	01413023          	sd	s4,0(sp)
    80004b54:	03010413          	addi	s0,sp,48
    80004b58:	00050993          	mv	s3,a0
    80004b5c:	00058a13          	mv	s4,a1
    LOCK();
    80004b60:	00100613          	li	a2,1
    80004b64:	00000593          	li	a1,0
    80004b68:	00004517          	auipc	a0,0x4
    80004b6c:	27850513          	addi	a0,a0,632 # 80008de0 <lockPrint>
    80004b70:	ffffc097          	auipc	ra,0xffffc
    80004b74:	6ac080e7          	jalr	1708(ra) # 8000121c <copy_and_swap>
    80004b78:	fe0514e3          	bnez	a0,80004b60 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004b7c:	00000493          	li	s1,0
    80004b80:	0014891b          	addiw	s2,s1,1
    80004b84:	03495a63          	bge	s2,s4,80004bb8 <_Z9getStringPci+0x80>
        cc = getc();
    80004b88:	fffff097          	auipc	ra,0xfffff
    80004b8c:	d0c080e7          	jalr	-756(ra) # 80003894 <getc>
        if(cc < 1)
    80004b90:	02050463          	beqz	a0,80004bb8 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80004b94:	009984b3          	add	s1,s3,s1
    80004b98:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004b9c:	00a00793          	li	a5,10
    80004ba0:	00f50a63          	beq	a0,a5,80004bb4 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80004ba4:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80004ba8:	00d00793          	li	a5,13
    80004bac:	fcf51ae3          	bne	a0,a5,80004b80 <_Z9getStringPci+0x48>
    80004bb0:	0080006f          	j	80004bb8 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80004bb4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004bb8:	009984b3          	add	s1,s3,s1
    80004bbc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004bc0:	00000613          	li	a2,0
    80004bc4:	00100593          	li	a1,1
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	21850513          	addi	a0,a0,536 # 80008de0 <lockPrint>
    80004bd0:	ffffc097          	auipc	ra,0xffffc
    80004bd4:	64c080e7          	jalr	1612(ra) # 8000121c <copy_and_swap>
    80004bd8:	fe0514e3          	bnez	a0,80004bc0 <_Z9getStringPci+0x88>
    return buf;
}
    80004bdc:	00098513          	mv	a0,s3
    80004be0:	02813083          	ld	ra,40(sp)
    80004be4:	02013403          	ld	s0,32(sp)
    80004be8:	01813483          	ld	s1,24(sp)
    80004bec:	01013903          	ld	s2,16(sp)
    80004bf0:	00813983          	ld	s3,8(sp)
    80004bf4:	00013a03          	ld	s4,0(sp)
    80004bf8:	03010113          	addi	sp,sp,48
    80004bfc:	00008067          	ret

0000000080004c00 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004c00:	ff010113          	addi	sp,sp,-16
    80004c04:	00813423          	sd	s0,8(sp)
    80004c08:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    80004c0c:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    80004c10:	00054603          	lbu	a2,0(a0)
    80004c14:	fd06069b          	addiw	a3,a2,-48
    80004c18:	0ff6f693          	andi	a3,a3,255
    80004c1c:	00900713          	li	a4,9
    80004c20:	02d76063          	bltu	a4,a3,80004c40 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    80004c24:	0027969b          	slliw	a3,a5,0x2
    80004c28:	00f687bb          	addw	a5,a3,a5
    80004c2c:	0017971b          	slliw	a4,a5,0x1
    80004c30:	00150513          	addi	a0,a0,1
    80004c34:	00c707bb          	addw	a5,a4,a2
    80004c38:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    80004c3c:	fd5ff06f          	j	80004c10 <_Z11stringToIntPKc+0x10>
    return n;
}
    80004c40:	00078513          	mv	a0,a5
    80004c44:	00813403          	ld	s0,8(sp)
    80004c48:	01010113          	addi	sp,sp,16
    80004c4c:	00008067          	ret

0000000080004c50 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004c50:	fc010113          	addi	sp,sp,-64
    80004c54:	02113c23          	sd	ra,56(sp)
    80004c58:	02813823          	sd	s0,48(sp)
    80004c5c:	02913423          	sd	s1,40(sp)
    80004c60:	03213023          	sd	s2,32(sp)
    80004c64:	01313c23          	sd	s3,24(sp)
    80004c68:	04010413          	addi	s0,sp,64
    80004c6c:	00050493          	mv	s1,a0
    80004c70:	00058913          	mv	s2,a1
    80004c74:	00060993          	mv	s3,a2
    LOCK();
    80004c78:	00100613          	li	a2,1
    80004c7c:	00000593          	li	a1,0
    80004c80:	00004517          	auipc	a0,0x4
    80004c84:	16050513          	addi	a0,a0,352 # 80008de0 <lockPrint>
    80004c88:	ffffc097          	auipc	ra,0xffffc
    80004c8c:	594080e7          	jalr	1428(ra) # 8000121c <copy_and_swap>
    80004c90:	fe0514e3          	bnez	a0,80004c78 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004c94:	00098463          	beqz	s3,80004c9c <_Z8printIntiii+0x4c>
    80004c98:	0004ca63          	bltz	s1,80004cac <_Z8printIntiii+0x5c>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004c9c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004ca0:	00000593          	li	a1,0
    }

    i = 0;
    80004ca4:	00000613          	li	a2,0
    80004ca8:	0180006f          	j	80004cc0 <_Z8printIntiii+0x70>
        x = -xx;
    80004cac:	4090053b          	negw	a0,s1
        neg = 1;
    80004cb0:	00100593          	li	a1,1
        x = -xx;
    80004cb4:	ff1ff06f          	j	80004ca4 <_Z8printIntiii+0x54>
    do{
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    80004cb8:	00068513          	mv	a0,a3
        buf[i++] = digits[x % base];
    80004cbc:	00048613          	mv	a2,s1
    80004cc0:	0009079b          	sext.w	a5,s2
    80004cc4:	02f5773b          	remuw	a4,a0,a5
    80004cc8:	0016049b          	addiw	s1,a2,1
    80004ccc:	02071693          	slli	a3,a4,0x20
    80004cd0:	0206d693          	srli	a3,a3,0x20
    80004cd4:	00004717          	auipc	a4,0x4
    80004cd8:	eec70713          	addi	a4,a4,-276 # 80008bc0 <digits>
    80004cdc:	00d70733          	add	a4,a4,a3
    80004ce0:	00074683          	lbu	a3,0(a4)
    80004ce4:	fd040713          	addi	a4,s0,-48
    80004ce8:	00c70733          	add	a4,a4,a2
    80004cec:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004cf0:	02f5573b          	divuw	a4,a0,a5
    80004cf4:	0007069b          	sext.w	a3,a4
    80004cf8:	fcf570e3          	bgeu	a0,a5,80004cb8 <_Z8printIntiii+0x68>
    if(neg)
    80004cfc:	00058c63          	beqz	a1,80004d14 <_Z8printIntiii+0xc4>
        buf[i++] = '-';
    80004d00:	fd040793          	addi	a5,s0,-48
    80004d04:	009784b3          	add	s1,a5,s1
    80004d08:	02d00793          	li	a5,45
    80004d0c:	fef48823          	sb	a5,-16(s1)
    80004d10:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004d14:	fff4849b          	addiw	s1,s1,-1
    80004d18:	0004ce63          	bltz	s1,80004d34 <_Z8printIntiii+0xe4>
        putc(buf[i]);
    80004d1c:	fd040793          	addi	a5,s0,-48
    80004d20:	009787b3          	add	a5,a5,s1
    80004d24:	ff07c503          	lbu	a0,-16(a5)
    80004d28:	fffff097          	auipc	ra,0xfffff
    80004d2c:	ba8080e7          	jalr	-1112(ra) # 800038d0 <putc>
    80004d30:	fe5ff06f          	j	80004d14 <_Z8printIntiii+0xc4>

    UNLOCK();
    80004d34:	00000613          	li	a2,0
    80004d38:	00100593          	li	a1,1
    80004d3c:	00004517          	auipc	a0,0x4
    80004d40:	0a450513          	addi	a0,a0,164 # 80008de0 <lockPrint>
    80004d44:	ffffc097          	auipc	ra,0xffffc
    80004d48:	4d8080e7          	jalr	1240(ra) # 8000121c <copy_and_swap>
    80004d4c:	fe0514e3          	bnez	a0,80004d34 <_Z8printIntiii+0xe4>
    80004d50:	03813083          	ld	ra,56(sp)
    80004d54:	03013403          	ld	s0,48(sp)
    80004d58:	02813483          	ld	s1,40(sp)
    80004d5c:	02013903          	ld	s2,32(sp)
    80004d60:	01813983          	ld	s3,24(sp)
    80004d64:	04010113          	addi	sp,sp,64
    80004d68:	00008067          	ret

0000000080004d6c <start>:
    80004d6c:	ff010113          	addi	sp,sp,-16
    80004d70:	00813423          	sd	s0,8(sp)
    80004d74:	01010413          	addi	s0,sp,16
    80004d78:	300027f3          	csrr	a5,mstatus
    80004d7c:	ffffe737          	lui	a4,0xffffe
    80004d80:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff475f>
    80004d84:	00e7f7b3          	and	a5,a5,a4
    80004d88:	00001737          	lui	a4,0x1
    80004d8c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004d90:	00e7e7b3          	or	a5,a5,a4
    80004d94:	30079073          	csrw	mstatus,a5
    80004d98:	00000797          	auipc	a5,0x0
    80004d9c:	16078793          	addi	a5,a5,352 # 80004ef8 <system_main>
    80004da0:	34179073          	csrw	mepc,a5
    80004da4:	00000793          	li	a5,0
    80004da8:	18079073          	csrw	satp,a5
    80004dac:	000107b7          	lui	a5,0x10
    80004db0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004db4:	30279073          	csrw	medeleg,a5
    80004db8:	30379073          	csrw	mideleg,a5
    80004dbc:	104027f3          	csrr	a5,sie
    80004dc0:	2227e793          	ori	a5,a5,546
    80004dc4:	10479073          	csrw	sie,a5
    80004dc8:	fff00793          	li	a5,-1
    80004dcc:	00a7d793          	srli	a5,a5,0xa
    80004dd0:	3b079073          	csrw	pmpaddr0,a5
    80004dd4:	00f00793          	li	a5,15
    80004dd8:	3a079073          	csrw	pmpcfg0,a5
    80004ddc:	f14027f3          	csrr	a5,mhartid
    80004de0:	0200c737          	lui	a4,0x200c
    80004de4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004de8:	0007869b          	sext.w	a3,a5
    80004dec:	00269713          	slli	a4,a3,0x2
    80004df0:	000f4637          	lui	a2,0xf4
    80004df4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004df8:	00d70733          	add	a4,a4,a3
    80004dfc:	0037979b          	slliw	a5,a5,0x3
    80004e00:	020046b7          	lui	a3,0x2004
    80004e04:	00d787b3          	add	a5,a5,a3
    80004e08:	00c585b3          	add	a1,a1,a2
    80004e0c:	00371693          	slli	a3,a4,0x3
    80004e10:	00004717          	auipc	a4,0x4
    80004e14:	03070713          	addi	a4,a4,48 # 80008e40 <timer_scratch>
    80004e18:	00b7b023          	sd	a1,0(a5)
    80004e1c:	00d70733          	add	a4,a4,a3
    80004e20:	00f73c23          	sd	a5,24(a4)
    80004e24:	02c73023          	sd	a2,32(a4)
    80004e28:	34071073          	csrw	mscratch,a4
    80004e2c:	00000797          	auipc	a5,0x0
    80004e30:	6e478793          	addi	a5,a5,1764 # 80005510 <timervec>
    80004e34:	30579073          	csrw	mtvec,a5
    80004e38:	300027f3          	csrr	a5,mstatus
    80004e3c:	0087e793          	ori	a5,a5,8
    80004e40:	30079073          	csrw	mstatus,a5
    80004e44:	304027f3          	csrr	a5,mie
    80004e48:	0807e793          	ori	a5,a5,128
    80004e4c:	30479073          	csrw	mie,a5
    80004e50:	f14027f3          	csrr	a5,mhartid
    80004e54:	0007879b          	sext.w	a5,a5
    80004e58:	00078213          	mv	tp,a5
    80004e5c:	30200073          	mret
    80004e60:	00813403          	ld	s0,8(sp)
    80004e64:	01010113          	addi	sp,sp,16
    80004e68:	00008067          	ret

0000000080004e6c <timerinit>:
    80004e6c:	ff010113          	addi	sp,sp,-16
    80004e70:	00813423          	sd	s0,8(sp)
    80004e74:	01010413          	addi	s0,sp,16
    80004e78:	f14027f3          	csrr	a5,mhartid
    80004e7c:	0200c737          	lui	a4,0x200c
    80004e80:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004e84:	0007869b          	sext.w	a3,a5
    80004e88:	00269713          	slli	a4,a3,0x2
    80004e8c:	000f4637          	lui	a2,0xf4
    80004e90:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004e94:	00d70733          	add	a4,a4,a3
    80004e98:	0037979b          	slliw	a5,a5,0x3
    80004e9c:	020046b7          	lui	a3,0x2004
    80004ea0:	00d787b3          	add	a5,a5,a3
    80004ea4:	00c585b3          	add	a1,a1,a2
    80004ea8:	00371693          	slli	a3,a4,0x3
    80004eac:	00004717          	auipc	a4,0x4
    80004eb0:	f9470713          	addi	a4,a4,-108 # 80008e40 <timer_scratch>
    80004eb4:	00b7b023          	sd	a1,0(a5)
    80004eb8:	00d70733          	add	a4,a4,a3
    80004ebc:	00f73c23          	sd	a5,24(a4)
    80004ec0:	02c73023          	sd	a2,32(a4)
    80004ec4:	34071073          	csrw	mscratch,a4
    80004ec8:	00000797          	auipc	a5,0x0
    80004ecc:	64878793          	addi	a5,a5,1608 # 80005510 <timervec>
    80004ed0:	30579073          	csrw	mtvec,a5
    80004ed4:	300027f3          	csrr	a5,mstatus
    80004ed8:	0087e793          	ori	a5,a5,8
    80004edc:	30079073          	csrw	mstatus,a5
    80004ee0:	304027f3          	csrr	a5,mie
    80004ee4:	0807e793          	ori	a5,a5,128
    80004ee8:	30479073          	csrw	mie,a5
    80004eec:	00813403          	ld	s0,8(sp)
    80004ef0:	01010113          	addi	sp,sp,16
    80004ef4:	00008067          	ret

0000000080004ef8 <system_main>:
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00813823          	sd	s0,16(sp)
    80004f00:	00913423          	sd	s1,8(sp)
    80004f04:	00113c23          	sd	ra,24(sp)
    80004f08:	02010413          	addi	s0,sp,32
    80004f0c:	00000097          	auipc	ra,0x0
    80004f10:	0c4080e7          	jalr	196(ra) # 80004fd0 <cpuid>
    80004f14:	00004497          	auipc	s1,0x4
    80004f18:	ed448493          	addi	s1,s1,-300 # 80008de8 <started>
    80004f1c:	02050263          	beqz	a0,80004f40 <system_main+0x48>
    80004f20:	0004a783          	lw	a5,0(s1)
    80004f24:	0007879b          	sext.w	a5,a5
    80004f28:	fe078ce3          	beqz	a5,80004f20 <system_main+0x28>
    80004f2c:	0ff0000f          	fence
    80004f30:	00002517          	auipc	a0,0x2
    80004f34:	5e050513          	addi	a0,a0,1504 # 80007510 <_ZTV14PeriodicThread+0x80>
    80004f38:	00001097          	auipc	ra,0x1
    80004f3c:	a74080e7          	jalr	-1420(ra) # 800059ac <panic>
    80004f40:	00001097          	auipc	ra,0x1
    80004f44:	9c8080e7          	jalr	-1592(ra) # 80005908 <consoleinit>
    80004f48:	00001097          	auipc	ra,0x1
    80004f4c:	154080e7          	jalr	340(ra) # 8000609c <printfinit>
    80004f50:	00002517          	auipc	a0,0x2
    80004f54:	30050513          	addi	a0,a0,768 # 80007250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    80004f58:	00001097          	auipc	ra,0x1
    80004f5c:	ab0080e7          	jalr	-1360(ra) # 80005a08 <__printf>
    80004f60:	00002517          	auipc	a0,0x2
    80004f64:	58050513          	addi	a0,a0,1408 # 800074e0 <_ZTV14PeriodicThread+0x50>
    80004f68:	00001097          	auipc	ra,0x1
    80004f6c:	aa0080e7          	jalr	-1376(ra) # 80005a08 <__printf>
    80004f70:	00002517          	auipc	a0,0x2
    80004f74:	2e050513          	addi	a0,a0,736 # 80007250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    80004f78:	00001097          	auipc	ra,0x1
    80004f7c:	a90080e7          	jalr	-1392(ra) # 80005a08 <__printf>
    80004f80:	00001097          	auipc	ra,0x1
    80004f84:	4a8080e7          	jalr	1192(ra) # 80006428 <kinit>
    80004f88:	00000097          	auipc	ra,0x0
    80004f8c:	148080e7          	jalr	328(ra) # 800050d0 <trapinit>
    80004f90:	00000097          	auipc	ra,0x0
    80004f94:	16c080e7          	jalr	364(ra) # 800050fc <trapinithart>
    80004f98:	00000097          	auipc	ra,0x0
    80004f9c:	5b8080e7          	jalr	1464(ra) # 80005550 <plicinit>
    80004fa0:	00000097          	auipc	ra,0x0
    80004fa4:	5d8080e7          	jalr	1496(ra) # 80005578 <plicinithart>
    80004fa8:	00000097          	auipc	ra,0x0
    80004fac:	078080e7          	jalr	120(ra) # 80005020 <userinit>
    80004fb0:	0ff0000f          	fence
    80004fb4:	00100793          	li	a5,1
    80004fb8:	00002517          	auipc	a0,0x2
    80004fbc:	54050513          	addi	a0,a0,1344 # 800074f8 <_ZTV14PeriodicThread+0x68>
    80004fc0:	00f4a023          	sw	a5,0(s1)
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	a44080e7          	jalr	-1468(ra) # 80005a08 <__printf>
    80004fcc:	0000006f          	j	80004fcc <system_main+0xd4>

0000000080004fd0 <cpuid>:
    80004fd0:	ff010113          	addi	sp,sp,-16
    80004fd4:	00813423          	sd	s0,8(sp)
    80004fd8:	01010413          	addi	s0,sp,16
    80004fdc:	00020513          	mv	a0,tp
    80004fe0:	00813403          	ld	s0,8(sp)
    80004fe4:	0005051b          	sext.w	a0,a0
    80004fe8:	01010113          	addi	sp,sp,16
    80004fec:	00008067          	ret

0000000080004ff0 <mycpu>:
    80004ff0:	ff010113          	addi	sp,sp,-16
    80004ff4:	00813423          	sd	s0,8(sp)
    80004ff8:	01010413          	addi	s0,sp,16
    80004ffc:	00020793          	mv	a5,tp
    80005000:	00813403          	ld	s0,8(sp)
    80005004:	0007879b          	sext.w	a5,a5
    80005008:	00779793          	slli	a5,a5,0x7
    8000500c:	00005517          	auipc	a0,0x5
    80005010:	e6450513          	addi	a0,a0,-412 # 80009e70 <cpus>
    80005014:	00f50533          	add	a0,a0,a5
    80005018:	01010113          	addi	sp,sp,16
    8000501c:	00008067          	ret

0000000080005020 <userinit>:
    80005020:	ff010113          	addi	sp,sp,-16
    80005024:	00813423          	sd	s0,8(sp)
    80005028:	01010413          	addi	s0,sp,16
    8000502c:	00813403          	ld	s0,8(sp)
    80005030:	01010113          	addi	sp,sp,16
    80005034:	ffffd317          	auipc	t1,0xffffd
    80005038:	34430067          	jr	836(t1) # 80002378 <main>

000000008000503c <either_copyout>:
    8000503c:	ff010113          	addi	sp,sp,-16
    80005040:	00813023          	sd	s0,0(sp)
    80005044:	00113423          	sd	ra,8(sp)
    80005048:	01010413          	addi	s0,sp,16
    8000504c:	02051663          	bnez	a0,80005078 <either_copyout+0x3c>
    80005050:	00058513          	mv	a0,a1
    80005054:	00060593          	mv	a1,a2
    80005058:	0006861b          	sext.w	a2,a3
    8000505c:	00002097          	auipc	ra,0x2
    80005060:	c58080e7          	jalr	-936(ra) # 80006cb4 <__memmove>
    80005064:	00813083          	ld	ra,8(sp)
    80005068:	00013403          	ld	s0,0(sp)
    8000506c:	00000513          	li	a0,0
    80005070:	01010113          	addi	sp,sp,16
    80005074:	00008067          	ret
    80005078:	00002517          	auipc	a0,0x2
    8000507c:	4c050513          	addi	a0,a0,1216 # 80007538 <_ZTV14PeriodicThread+0xa8>
    80005080:	00001097          	auipc	ra,0x1
    80005084:	92c080e7          	jalr	-1748(ra) # 800059ac <panic>

0000000080005088 <either_copyin>:
    80005088:	ff010113          	addi	sp,sp,-16
    8000508c:	00813023          	sd	s0,0(sp)
    80005090:	00113423          	sd	ra,8(sp)
    80005094:	01010413          	addi	s0,sp,16
    80005098:	02059463          	bnez	a1,800050c0 <either_copyin+0x38>
    8000509c:	00060593          	mv	a1,a2
    800050a0:	0006861b          	sext.w	a2,a3
    800050a4:	00002097          	auipc	ra,0x2
    800050a8:	c10080e7          	jalr	-1008(ra) # 80006cb4 <__memmove>
    800050ac:	00813083          	ld	ra,8(sp)
    800050b0:	00013403          	ld	s0,0(sp)
    800050b4:	00000513          	li	a0,0
    800050b8:	01010113          	addi	sp,sp,16
    800050bc:	00008067          	ret
    800050c0:	00002517          	auipc	a0,0x2
    800050c4:	4a050513          	addi	a0,a0,1184 # 80007560 <_ZTV14PeriodicThread+0xd0>
    800050c8:	00001097          	auipc	ra,0x1
    800050cc:	8e4080e7          	jalr	-1820(ra) # 800059ac <panic>

00000000800050d0 <trapinit>:
    800050d0:	ff010113          	addi	sp,sp,-16
    800050d4:	00813423          	sd	s0,8(sp)
    800050d8:	01010413          	addi	s0,sp,16
    800050dc:	00813403          	ld	s0,8(sp)
    800050e0:	00002597          	auipc	a1,0x2
    800050e4:	4a858593          	addi	a1,a1,1192 # 80007588 <_ZTV14PeriodicThread+0xf8>
    800050e8:	00005517          	auipc	a0,0x5
    800050ec:	e0850513          	addi	a0,a0,-504 # 80009ef0 <tickslock>
    800050f0:	01010113          	addi	sp,sp,16
    800050f4:	00001317          	auipc	t1,0x1
    800050f8:	5c430067          	jr	1476(t1) # 800066b8 <initlock>

00000000800050fc <trapinithart>:
    800050fc:	ff010113          	addi	sp,sp,-16
    80005100:	00813423          	sd	s0,8(sp)
    80005104:	01010413          	addi	s0,sp,16
    80005108:	00000797          	auipc	a5,0x0
    8000510c:	2f878793          	addi	a5,a5,760 # 80005400 <kernelvec>
    80005110:	10579073          	csrw	stvec,a5
    80005114:	00813403          	ld	s0,8(sp)
    80005118:	01010113          	addi	sp,sp,16
    8000511c:	00008067          	ret

0000000080005120 <usertrap>:
    80005120:	ff010113          	addi	sp,sp,-16
    80005124:	00813423          	sd	s0,8(sp)
    80005128:	01010413          	addi	s0,sp,16
    8000512c:	00813403          	ld	s0,8(sp)
    80005130:	01010113          	addi	sp,sp,16
    80005134:	00008067          	ret

0000000080005138 <usertrapret>:
    80005138:	ff010113          	addi	sp,sp,-16
    8000513c:	00813423          	sd	s0,8(sp)
    80005140:	01010413          	addi	s0,sp,16
    80005144:	00813403          	ld	s0,8(sp)
    80005148:	01010113          	addi	sp,sp,16
    8000514c:	00008067          	ret

0000000080005150 <kerneltrap>:
    80005150:	fe010113          	addi	sp,sp,-32
    80005154:	00813823          	sd	s0,16(sp)
    80005158:	00113c23          	sd	ra,24(sp)
    8000515c:	00913423          	sd	s1,8(sp)
    80005160:	02010413          	addi	s0,sp,32
    80005164:	142025f3          	csrr	a1,scause
    80005168:	100027f3          	csrr	a5,sstatus
    8000516c:	0027f793          	andi	a5,a5,2
    80005170:	10079c63          	bnez	a5,80005288 <kerneltrap+0x138>
    80005174:	142027f3          	csrr	a5,scause
    80005178:	0207ce63          	bltz	a5,800051b4 <kerneltrap+0x64>
    8000517c:	00002517          	auipc	a0,0x2
    80005180:	45450513          	addi	a0,a0,1108 # 800075d0 <_ZTV14PeriodicThread+0x140>
    80005184:	00001097          	auipc	ra,0x1
    80005188:	884080e7          	jalr	-1916(ra) # 80005a08 <__printf>
    8000518c:	141025f3          	csrr	a1,sepc
    80005190:	14302673          	csrr	a2,stval
    80005194:	00002517          	auipc	a0,0x2
    80005198:	44c50513          	addi	a0,a0,1100 # 800075e0 <_ZTV14PeriodicThread+0x150>
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	86c080e7          	jalr	-1940(ra) # 80005a08 <__printf>
    800051a4:	00002517          	auipc	a0,0x2
    800051a8:	45450513          	addi	a0,a0,1108 # 800075f8 <_ZTV14PeriodicThread+0x168>
    800051ac:	00001097          	auipc	ra,0x1
    800051b0:	800080e7          	jalr	-2048(ra) # 800059ac <panic>
    800051b4:	0ff7f713          	andi	a4,a5,255
    800051b8:	00900693          	li	a3,9
    800051bc:	04d70063          	beq	a4,a3,800051fc <kerneltrap+0xac>
    800051c0:	fff00713          	li	a4,-1
    800051c4:	03f71713          	slli	a4,a4,0x3f
    800051c8:	00170713          	addi	a4,a4,1
    800051cc:	fae798e3          	bne	a5,a4,8000517c <kerneltrap+0x2c>
    800051d0:	00000097          	auipc	ra,0x0
    800051d4:	e00080e7          	jalr	-512(ra) # 80004fd0 <cpuid>
    800051d8:	06050663          	beqz	a0,80005244 <kerneltrap+0xf4>
    800051dc:	144027f3          	csrr	a5,sip
    800051e0:	ffd7f793          	andi	a5,a5,-3
    800051e4:	14479073          	csrw	sip,a5
    800051e8:	01813083          	ld	ra,24(sp)
    800051ec:	01013403          	ld	s0,16(sp)
    800051f0:	00813483          	ld	s1,8(sp)
    800051f4:	02010113          	addi	sp,sp,32
    800051f8:	00008067          	ret
    800051fc:	00000097          	auipc	ra,0x0
    80005200:	3c8080e7          	jalr	968(ra) # 800055c4 <plic_claim>
    80005204:	00a00793          	li	a5,10
    80005208:	00050493          	mv	s1,a0
    8000520c:	06f50863          	beq	a0,a5,8000527c <kerneltrap+0x12c>
    80005210:	fc050ce3          	beqz	a0,800051e8 <kerneltrap+0x98>
    80005214:	00050593          	mv	a1,a0
    80005218:	00002517          	auipc	a0,0x2
    8000521c:	39850513          	addi	a0,a0,920 # 800075b0 <_ZTV14PeriodicThread+0x120>
    80005220:	00000097          	auipc	ra,0x0
    80005224:	7e8080e7          	jalr	2024(ra) # 80005a08 <__printf>
    80005228:	01013403          	ld	s0,16(sp)
    8000522c:	01813083          	ld	ra,24(sp)
    80005230:	00048513          	mv	a0,s1
    80005234:	00813483          	ld	s1,8(sp)
    80005238:	02010113          	addi	sp,sp,32
    8000523c:	00000317          	auipc	t1,0x0
    80005240:	3c030067          	jr	960(t1) # 800055fc <plic_complete>
    80005244:	00005517          	auipc	a0,0x5
    80005248:	cac50513          	addi	a0,a0,-852 # 80009ef0 <tickslock>
    8000524c:	00001097          	auipc	ra,0x1
    80005250:	490080e7          	jalr	1168(ra) # 800066dc <acquire>
    80005254:	00004717          	auipc	a4,0x4
    80005258:	b9870713          	addi	a4,a4,-1128 # 80008dec <ticks>
    8000525c:	00072783          	lw	a5,0(a4)
    80005260:	00005517          	auipc	a0,0x5
    80005264:	c9050513          	addi	a0,a0,-880 # 80009ef0 <tickslock>
    80005268:	0017879b          	addiw	a5,a5,1
    8000526c:	00f72023          	sw	a5,0(a4)
    80005270:	00001097          	auipc	ra,0x1
    80005274:	538080e7          	jalr	1336(ra) # 800067a8 <release>
    80005278:	f65ff06f          	j	800051dc <kerneltrap+0x8c>
    8000527c:	00001097          	auipc	ra,0x1
    80005280:	094080e7          	jalr	148(ra) # 80006310 <uartintr>
    80005284:	fa5ff06f          	j	80005228 <kerneltrap+0xd8>
    80005288:	00002517          	auipc	a0,0x2
    8000528c:	30850513          	addi	a0,a0,776 # 80007590 <_ZTV14PeriodicThread+0x100>
    80005290:	00000097          	auipc	ra,0x0
    80005294:	71c080e7          	jalr	1820(ra) # 800059ac <panic>

0000000080005298 <clockintr>:
    80005298:	fe010113          	addi	sp,sp,-32
    8000529c:	00813823          	sd	s0,16(sp)
    800052a0:	00913423          	sd	s1,8(sp)
    800052a4:	00113c23          	sd	ra,24(sp)
    800052a8:	02010413          	addi	s0,sp,32
    800052ac:	00005497          	auipc	s1,0x5
    800052b0:	c4448493          	addi	s1,s1,-956 # 80009ef0 <tickslock>
    800052b4:	00048513          	mv	a0,s1
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	424080e7          	jalr	1060(ra) # 800066dc <acquire>
    800052c0:	00004717          	auipc	a4,0x4
    800052c4:	b2c70713          	addi	a4,a4,-1236 # 80008dec <ticks>
    800052c8:	00072783          	lw	a5,0(a4)
    800052cc:	01013403          	ld	s0,16(sp)
    800052d0:	01813083          	ld	ra,24(sp)
    800052d4:	00048513          	mv	a0,s1
    800052d8:	0017879b          	addiw	a5,a5,1
    800052dc:	00813483          	ld	s1,8(sp)
    800052e0:	00f72023          	sw	a5,0(a4)
    800052e4:	02010113          	addi	sp,sp,32
    800052e8:	00001317          	auipc	t1,0x1
    800052ec:	4c030067          	jr	1216(t1) # 800067a8 <release>

00000000800052f0 <devintr>:
    800052f0:	142027f3          	csrr	a5,scause
    800052f4:	00000513          	li	a0,0
    800052f8:	0007c463          	bltz	a5,80005300 <devintr+0x10>
    800052fc:	00008067          	ret
    80005300:	fe010113          	addi	sp,sp,-32
    80005304:	00813823          	sd	s0,16(sp)
    80005308:	00113c23          	sd	ra,24(sp)
    8000530c:	00913423          	sd	s1,8(sp)
    80005310:	02010413          	addi	s0,sp,32
    80005314:	0ff7f713          	andi	a4,a5,255
    80005318:	00900693          	li	a3,9
    8000531c:	04d70c63          	beq	a4,a3,80005374 <devintr+0x84>
    80005320:	fff00713          	li	a4,-1
    80005324:	03f71713          	slli	a4,a4,0x3f
    80005328:	00170713          	addi	a4,a4,1
    8000532c:	00e78c63          	beq	a5,a4,80005344 <devintr+0x54>
    80005330:	01813083          	ld	ra,24(sp)
    80005334:	01013403          	ld	s0,16(sp)
    80005338:	00813483          	ld	s1,8(sp)
    8000533c:	02010113          	addi	sp,sp,32
    80005340:	00008067          	ret
    80005344:	00000097          	auipc	ra,0x0
    80005348:	c8c080e7          	jalr	-884(ra) # 80004fd0 <cpuid>
    8000534c:	06050663          	beqz	a0,800053b8 <devintr+0xc8>
    80005350:	144027f3          	csrr	a5,sip
    80005354:	ffd7f793          	andi	a5,a5,-3
    80005358:	14479073          	csrw	sip,a5
    8000535c:	01813083          	ld	ra,24(sp)
    80005360:	01013403          	ld	s0,16(sp)
    80005364:	00813483          	ld	s1,8(sp)
    80005368:	00200513          	li	a0,2
    8000536c:	02010113          	addi	sp,sp,32
    80005370:	00008067          	ret
    80005374:	00000097          	auipc	ra,0x0
    80005378:	250080e7          	jalr	592(ra) # 800055c4 <plic_claim>
    8000537c:	00a00793          	li	a5,10
    80005380:	00050493          	mv	s1,a0
    80005384:	06f50663          	beq	a0,a5,800053f0 <devintr+0x100>
    80005388:	00100513          	li	a0,1
    8000538c:	fa0482e3          	beqz	s1,80005330 <devintr+0x40>
    80005390:	00048593          	mv	a1,s1
    80005394:	00002517          	auipc	a0,0x2
    80005398:	21c50513          	addi	a0,a0,540 # 800075b0 <_ZTV14PeriodicThread+0x120>
    8000539c:	00000097          	auipc	ra,0x0
    800053a0:	66c080e7          	jalr	1644(ra) # 80005a08 <__printf>
    800053a4:	00048513          	mv	a0,s1
    800053a8:	00000097          	auipc	ra,0x0
    800053ac:	254080e7          	jalr	596(ra) # 800055fc <plic_complete>
    800053b0:	00100513          	li	a0,1
    800053b4:	f7dff06f          	j	80005330 <devintr+0x40>
    800053b8:	00005517          	auipc	a0,0x5
    800053bc:	b3850513          	addi	a0,a0,-1224 # 80009ef0 <tickslock>
    800053c0:	00001097          	auipc	ra,0x1
    800053c4:	31c080e7          	jalr	796(ra) # 800066dc <acquire>
    800053c8:	00004717          	auipc	a4,0x4
    800053cc:	a2470713          	addi	a4,a4,-1500 # 80008dec <ticks>
    800053d0:	00072783          	lw	a5,0(a4)
    800053d4:	00005517          	auipc	a0,0x5
    800053d8:	b1c50513          	addi	a0,a0,-1252 # 80009ef0 <tickslock>
    800053dc:	0017879b          	addiw	a5,a5,1
    800053e0:	00f72023          	sw	a5,0(a4)
    800053e4:	00001097          	auipc	ra,0x1
    800053e8:	3c4080e7          	jalr	964(ra) # 800067a8 <release>
    800053ec:	f65ff06f          	j	80005350 <devintr+0x60>
    800053f0:	00001097          	auipc	ra,0x1
    800053f4:	f20080e7          	jalr	-224(ra) # 80006310 <uartintr>
    800053f8:	fadff06f          	j	800053a4 <devintr+0xb4>
    800053fc:	0000                	unimp
	...

0000000080005400 <kernelvec>:
    80005400:	f0010113          	addi	sp,sp,-256
    80005404:	00113023          	sd	ra,0(sp)
    80005408:	00213423          	sd	sp,8(sp)
    8000540c:	00313823          	sd	gp,16(sp)
    80005410:	00413c23          	sd	tp,24(sp)
    80005414:	02513023          	sd	t0,32(sp)
    80005418:	02613423          	sd	t1,40(sp)
    8000541c:	02713823          	sd	t2,48(sp)
    80005420:	02813c23          	sd	s0,56(sp)
    80005424:	04913023          	sd	s1,64(sp)
    80005428:	04a13423          	sd	a0,72(sp)
    8000542c:	04b13823          	sd	a1,80(sp)
    80005430:	04c13c23          	sd	a2,88(sp)
    80005434:	06d13023          	sd	a3,96(sp)
    80005438:	06e13423          	sd	a4,104(sp)
    8000543c:	06f13823          	sd	a5,112(sp)
    80005440:	07013c23          	sd	a6,120(sp)
    80005444:	09113023          	sd	a7,128(sp)
    80005448:	09213423          	sd	s2,136(sp)
    8000544c:	09313823          	sd	s3,144(sp)
    80005450:	09413c23          	sd	s4,152(sp)
    80005454:	0b513023          	sd	s5,160(sp)
    80005458:	0b613423          	sd	s6,168(sp)
    8000545c:	0b713823          	sd	s7,176(sp)
    80005460:	0b813c23          	sd	s8,184(sp)
    80005464:	0d913023          	sd	s9,192(sp)
    80005468:	0da13423          	sd	s10,200(sp)
    8000546c:	0db13823          	sd	s11,208(sp)
    80005470:	0dc13c23          	sd	t3,216(sp)
    80005474:	0fd13023          	sd	t4,224(sp)
    80005478:	0fe13423          	sd	t5,232(sp)
    8000547c:	0ff13823          	sd	t6,240(sp)
    80005480:	cd1ff0ef          	jal	ra,80005150 <kerneltrap>
    80005484:	00013083          	ld	ra,0(sp)
    80005488:	00813103          	ld	sp,8(sp)
    8000548c:	01013183          	ld	gp,16(sp)
    80005490:	02013283          	ld	t0,32(sp)
    80005494:	02813303          	ld	t1,40(sp)
    80005498:	03013383          	ld	t2,48(sp)
    8000549c:	03813403          	ld	s0,56(sp)
    800054a0:	04013483          	ld	s1,64(sp)
    800054a4:	04813503          	ld	a0,72(sp)
    800054a8:	05013583          	ld	a1,80(sp)
    800054ac:	05813603          	ld	a2,88(sp)
    800054b0:	06013683          	ld	a3,96(sp)
    800054b4:	06813703          	ld	a4,104(sp)
    800054b8:	07013783          	ld	a5,112(sp)
    800054bc:	07813803          	ld	a6,120(sp)
    800054c0:	08013883          	ld	a7,128(sp)
    800054c4:	08813903          	ld	s2,136(sp)
    800054c8:	09013983          	ld	s3,144(sp)
    800054cc:	09813a03          	ld	s4,152(sp)
    800054d0:	0a013a83          	ld	s5,160(sp)
    800054d4:	0a813b03          	ld	s6,168(sp)
    800054d8:	0b013b83          	ld	s7,176(sp)
    800054dc:	0b813c03          	ld	s8,184(sp)
    800054e0:	0c013c83          	ld	s9,192(sp)
    800054e4:	0c813d03          	ld	s10,200(sp)
    800054e8:	0d013d83          	ld	s11,208(sp)
    800054ec:	0d813e03          	ld	t3,216(sp)
    800054f0:	0e013e83          	ld	t4,224(sp)
    800054f4:	0e813f03          	ld	t5,232(sp)
    800054f8:	0f013f83          	ld	t6,240(sp)
    800054fc:	10010113          	addi	sp,sp,256
    80005500:	10200073          	sret
    80005504:	00000013          	nop
    80005508:	00000013          	nop
    8000550c:	00000013          	nop

0000000080005510 <timervec>:
    80005510:	34051573          	csrrw	a0,mscratch,a0
    80005514:	00b53023          	sd	a1,0(a0)
    80005518:	00c53423          	sd	a2,8(a0)
    8000551c:	00d53823          	sd	a3,16(a0)
    80005520:	01853583          	ld	a1,24(a0)
    80005524:	02053603          	ld	a2,32(a0)
    80005528:	0005b683          	ld	a3,0(a1)
    8000552c:	00c686b3          	add	a3,a3,a2
    80005530:	00d5b023          	sd	a3,0(a1)
    80005534:	00200593          	li	a1,2
    80005538:	14459073          	csrw	sip,a1
    8000553c:	01053683          	ld	a3,16(a0)
    80005540:	00853603          	ld	a2,8(a0)
    80005544:	00053583          	ld	a1,0(a0)
    80005548:	34051573          	csrrw	a0,mscratch,a0
    8000554c:	30200073          	mret

0000000080005550 <plicinit>:
    80005550:	ff010113          	addi	sp,sp,-16
    80005554:	00813423          	sd	s0,8(sp)
    80005558:	01010413          	addi	s0,sp,16
    8000555c:	00813403          	ld	s0,8(sp)
    80005560:	0c0007b7          	lui	a5,0xc000
    80005564:	00100713          	li	a4,1
    80005568:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000556c:	00e7a223          	sw	a4,4(a5)
    80005570:	01010113          	addi	sp,sp,16
    80005574:	00008067          	ret

0000000080005578 <plicinithart>:
    80005578:	ff010113          	addi	sp,sp,-16
    8000557c:	00813023          	sd	s0,0(sp)
    80005580:	00113423          	sd	ra,8(sp)
    80005584:	01010413          	addi	s0,sp,16
    80005588:	00000097          	auipc	ra,0x0
    8000558c:	a48080e7          	jalr	-1464(ra) # 80004fd0 <cpuid>
    80005590:	0085171b          	slliw	a4,a0,0x8
    80005594:	0c0027b7          	lui	a5,0xc002
    80005598:	00e787b3          	add	a5,a5,a4
    8000559c:	40200713          	li	a4,1026
    800055a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800055a4:	00813083          	ld	ra,8(sp)
    800055a8:	00013403          	ld	s0,0(sp)
    800055ac:	00d5151b          	slliw	a0,a0,0xd
    800055b0:	0c2017b7          	lui	a5,0xc201
    800055b4:	00a78533          	add	a0,a5,a0
    800055b8:	00052023          	sw	zero,0(a0)
    800055bc:	01010113          	addi	sp,sp,16
    800055c0:	00008067          	ret

00000000800055c4 <plic_claim>:
    800055c4:	ff010113          	addi	sp,sp,-16
    800055c8:	00813023          	sd	s0,0(sp)
    800055cc:	00113423          	sd	ra,8(sp)
    800055d0:	01010413          	addi	s0,sp,16
    800055d4:	00000097          	auipc	ra,0x0
    800055d8:	9fc080e7          	jalr	-1540(ra) # 80004fd0 <cpuid>
    800055dc:	00813083          	ld	ra,8(sp)
    800055e0:	00013403          	ld	s0,0(sp)
    800055e4:	00d5151b          	slliw	a0,a0,0xd
    800055e8:	0c2017b7          	lui	a5,0xc201
    800055ec:	00a78533          	add	a0,a5,a0
    800055f0:	00452503          	lw	a0,4(a0)
    800055f4:	01010113          	addi	sp,sp,16
    800055f8:	00008067          	ret

00000000800055fc <plic_complete>:
    800055fc:	fe010113          	addi	sp,sp,-32
    80005600:	00813823          	sd	s0,16(sp)
    80005604:	00913423          	sd	s1,8(sp)
    80005608:	00113c23          	sd	ra,24(sp)
    8000560c:	02010413          	addi	s0,sp,32
    80005610:	00050493          	mv	s1,a0
    80005614:	00000097          	auipc	ra,0x0
    80005618:	9bc080e7          	jalr	-1604(ra) # 80004fd0 <cpuid>
    8000561c:	01813083          	ld	ra,24(sp)
    80005620:	01013403          	ld	s0,16(sp)
    80005624:	00d5179b          	slliw	a5,a0,0xd
    80005628:	0c201737          	lui	a4,0xc201
    8000562c:	00f707b3          	add	a5,a4,a5
    80005630:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005634:	00813483          	ld	s1,8(sp)
    80005638:	02010113          	addi	sp,sp,32
    8000563c:	00008067          	ret

0000000080005640 <consolewrite>:
    80005640:	fb010113          	addi	sp,sp,-80
    80005644:	04813023          	sd	s0,64(sp)
    80005648:	04113423          	sd	ra,72(sp)
    8000564c:	02913c23          	sd	s1,56(sp)
    80005650:	03213823          	sd	s2,48(sp)
    80005654:	03313423          	sd	s3,40(sp)
    80005658:	03413023          	sd	s4,32(sp)
    8000565c:	01513c23          	sd	s5,24(sp)
    80005660:	05010413          	addi	s0,sp,80
    80005664:	06c05c63          	blez	a2,800056dc <consolewrite+0x9c>
    80005668:	00060993          	mv	s3,a2
    8000566c:	00050a13          	mv	s4,a0
    80005670:	00058493          	mv	s1,a1
    80005674:	00000913          	li	s2,0
    80005678:	fff00a93          	li	s5,-1
    8000567c:	01c0006f          	j	80005698 <consolewrite+0x58>
    80005680:	fbf44503          	lbu	a0,-65(s0)
    80005684:	0019091b          	addiw	s2,s2,1
    80005688:	00148493          	addi	s1,s1,1
    8000568c:	00001097          	auipc	ra,0x1
    80005690:	a9c080e7          	jalr	-1380(ra) # 80006128 <uartputc>
    80005694:	03298063          	beq	s3,s2,800056b4 <consolewrite+0x74>
    80005698:	00048613          	mv	a2,s1
    8000569c:	00100693          	li	a3,1
    800056a0:	000a0593          	mv	a1,s4
    800056a4:	fbf40513          	addi	a0,s0,-65
    800056a8:	00000097          	auipc	ra,0x0
    800056ac:	9e0080e7          	jalr	-1568(ra) # 80005088 <either_copyin>
    800056b0:	fd5518e3          	bne	a0,s5,80005680 <consolewrite+0x40>
    800056b4:	04813083          	ld	ra,72(sp)
    800056b8:	04013403          	ld	s0,64(sp)
    800056bc:	03813483          	ld	s1,56(sp)
    800056c0:	02813983          	ld	s3,40(sp)
    800056c4:	02013a03          	ld	s4,32(sp)
    800056c8:	01813a83          	ld	s5,24(sp)
    800056cc:	00090513          	mv	a0,s2
    800056d0:	03013903          	ld	s2,48(sp)
    800056d4:	05010113          	addi	sp,sp,80
    800056d8:	00008067          	ret
    800056dc:	00000913          	li	s2,0
    800056e0:	fd5ff06f          	j	800056b4 <consolewrite+0x74>

00000000800056e4 <consoleread>:
    800056e4:	f9010113          	addi	sp,sp,-112
    800056e8:	06813023          	sd	s0,96(sp)
    800056ec:	04913c23          	sd	s1,88(sp)
    800056f0:	05213823          	sd	s2,80(sp)
    800056f4:	05313423          	sd	s3,72(sp)
    800056f8:	05413023          	sd	s4,64(sp)
    800056fc:	03513c23          	sd	s5,56(sp)
    80005700:	03613823          	sd	s6,48(sp)
    80005704:	03713423          	sd	s7,40(sp)
    80005708:	03813023          	sd	s8,32(sp)
    8000570c:	06113423          	sd	ra,104(sp)
    80005710:	01913c23          	sd	s9,24(sp)
    80005714:	07010413          	addi	s0,sp,112
    80005718:	00060b93          	mv	s7,a2
    8000571c:	00050913          	mv	s2,a0
    80005720:	00058c13          	mv	s8,a1
    80005724:	00060b1b          	sext.w	s6,a2
    80005728:	00004497          	auipc	s1,0x4
    8000572c:	7f048493          	addi	s1,s1,2032 # 80009f18 <cons>
    80005730:	00400993          	li	s3,4
    80005734:	fff00a13          	li	s4,-1
    80005738:	00a00a93          	li	s5,10
    8000573c:	05705e63          	blez	s7,80005798 <consoleread+0xb4>
    80005740:	09c4a703          	lw	a4,156(s1)
    80005744:	0984a783          	lw	a5,152(s1)
    80005748:	0007071b          	sext.w	a4,a4
    8000574c:	08e78463          	beq	a5,a4,800057d4 <consoleread+0xf0>
    80005750:	07f7f713          	andi	a4,a5,127
    80005754:	00e48733          	add	a4,s1,a4
    80005758:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000575c:	0017869b          	addiw	a3,a5,1
    80005760:	08d4ac23          	sw	a3,152(s1)
    80005764:	00070c9b          	sext.w	s9,a4
    80005768:	0b370663          	beq	a4,s3,80005814 <consoleread+0x130>
    8000576c:	00100693          	li	a3,1
    80005770:	f9f40613          	addi	a2,s0,-97
    80005774:	000c0593          	mv	a1,s8
    80005778:	00090513          	mv	a0,s2
    8000577c:	f8e40fa3          	sb	a4,-97(s0)
    80005780:	00000097          	auipc	ra,0x0
    80005784:	8bc080e7          	jalr	-1860(ra) # 8000503c <either_copyout>
    80005788:	01450863          	beq	a0,s4,80005798 <consoleread+0xb4>
    8000578c:	001c0c13          	addi	s8,s8,1
    80005790:	fffb8b9b          	addiw	s7,s7,-1
    80005794:	fb5c94e3          	bne	s9,s5,8000573c <consoleread+0x58>
    80005798:	000b851b          	sext.w	a0,s7
    8000579c:	06813083          	ld	ra,104(sp)
    800057a0:	06013403          	ld	s0,96(sp)
    800057a4:	05813483          	ld	s1,88(sp)
    800057a8:	05013903          	ld	s2,80(sp)
    800057ac:	04813983          	ld	s3,72(sp)
    800057b0:	04013a03          	ld	s4,64(sp)
    800057b4:	03813a83          	ld	s5,56(sp)
    800057b8:	02813b83          	ld	s7,40(sp)
    800057bc:	02013c03          	ld	s8,32(sp)
    800057c0:	01813c83          	ld	s9,24(sp)
    800057c4:	40ab053b          	subw	a0,s6,a0
    800057c8:	03013b03          	ld	s6,48(sp)
    800057cc:	07010113          	addi	sp,sp,112
    800057d0:	00008067          	ret
    800057d4:	00001097          	auipc	ra,0x1
    800057d8:	1d8080e7          	jalr	472(ra) # 800069ac <push_on>
    800057dc:	0984a703          	lw	a4,152(s1)
    800057e0:	09c4a783          	lw	a5,156(s1)
    800057e4:	0007879b          	sext.w	a5,a5
    800057e8:	fef70ce3          	beq	a4,a5,800057e0 <consoleread+0xfc>
    800057ec:	00001097          	auipc	ra,0x1
    800057f0:	234080e7          	jalr	564(ra) # 80006a20 <pop_on>
    800057f4:	0984a783          	lw	a5,152(s1)
    800057f8:	07f7f713          	andi	a4,a5,127
    800057fc:	00e48733          	add	a4,s1,a4
    80005800:	01874703          	lbu	a4,24(a4)
    80005804:	0017869b          	addiw	a3,a5,1
    80005808:	08d4ac23          	sw	a3,152(s1)
    8000580c:	00070c9b          	sext.w	s9,a4
    80005810:	f5371ee3          	bne	a4,s3,8000576c <consoleread+0x88>
    80005814:	000b851b          	sext.w	a0,s7
    80005818:	f96bf2e3          	bgeu	s7,s6,8000579c <consoleread+0xb8>
    8000581c:	08f4ac23          	sw	a5,152(s1)
    80005820:	f7dff06f          	j	8000579c <consoleread+0xb8>

0000000080005824 <consputc>:
    80005824:	10000793          	li	a5,256
    80005828:	00f50663          	beq	a0,a5,80005834 <consputc+0x10>
    8000582c:	00001317          	auipc	t1,0x1
    80005830:	9f430067          	jr	-1548(t1) # 80006220 <uartputc_sync>
    80005834:	ff010113          	addi	sp,sp,-16
    80005838:	00113423          	sd	ra,8(sp)
    8000583c:	00813023          	sd	s0,0(sp)
    80005840:	01010413          	addi	s0,sp,16
    80005844:	00800513          	li	a0,8
    80005848:	00001097          	auipc	ra,0x1
    8000584c:	9d8080e7          	jalr	-1576(ra) # 80006220 <uartputc_sync>
    80005850:	02000513          	li	a0,32
    80005854:	00001097          	auipc	ra,0x1
    80005858:	9cc080e7          	jalr	-1588(ra) # 80006220 <uartputc_sync>
    8000585c:	00013403          	ld	s0,0(sp)
    80005860:	00813083          	ld	ra,8(sp)
    80005864:	00800513          	li	a0,8
    80005868:	01010113          	addi	sp,sp,16
    8000586c:	00001317          	auipc	t1,0x1
    80005870:	9b430067          	jr	-1612(t1) # 80006220 <uartputc_sync>

0000000080005874 <consoleintr>:
    80005874:	fe010113          	addi	sp,sp,-32
    80005878:	00813823          	sd	s0,16(sp)
    8000587c:	00913423          	sd	s1,8(sp)
    80005880:	01213023          	sd	s2,0(sp)
    80005884:	00113c23          	sd	ra,24(sp)
    80005888:	02010413          	addi	s0,sp,32
    8000588c:	00004917          	auipc	s2,0x4
    80005890:	68c90913          	addi	s2,s2,1676 # 80009f18 <cons>
    80005894:	00050493          	mv	s1,a0
    80005898:	00090513          	mv	a0,s2
    8000589c:	00001097          	auipc	ra,0x1
    800058a0:	e40080e7          	jalr	-448(ra) # 800066dc <acquire>
    800058a4:	02048c63          	beqz	s1,800058dc <consoleintr+0x68>
    800058a8:	0a092783          	lw	a5,160(s2)
    800058ac:	09892703          	lw	a4,152(s2)
    800058b0:	07f00693          	li	a3,127
    800058b4:	40e7873b          	subw	a4,a5,a4
    800058b8:	02e6e263          	bltu	a3,a4,800058dc <consoleintr+0x68>
    800058bc:	00d00713          	li	a4,13
    800058c0:	04e48063          	beq	s1,a4,80005900 <consoleintr+0x8c>
    800058c4:	07f7f713          	andi	a4,a5,127
    800058c8:	00e90733          	add	a4,s2,a4
    800058cc:	0017879b          	addiw	a5,a5,1
    800058d0:	0af92023          	sw	a5,160(s2)
    800058d4:	00970c23          	sb	s1,24(a4)
    800058d8:	08f92e23          	sw	a5,156(s2)
    800058dc:	01013403          	ld	s0,16(sp)
    800058e0:	01813083          	ld	ra,24(sp)
    800058e4:	00813483          	ld	s1,8(sp)
    800058e8:	00013903          	ld	s2,0(sp)
    800058ec:	00004517          	auipc	a0,0x4
    800058f0:	62c50513          	addi	a0,a0,1580 # 80009f18 <cons>
    800058f4:	02010113          	addi	sp,sp,32
    800058f8:	00001317          	auipc	t1,0x1
    800058fc:	eb030067          	jr	-336(t1) # 800067a8 <release>
    80005900:	00a00493          	li	s1,10
    80005904:	fc1ff06f          	j	800058c4 <consoleintr+0x50>

0000000080005908 <consoleinit>:
    80005908:	fe010113          	addi	sp,sp,-32
    8000590c:	00113c23          	sd	ra,24(sp)
    80005910:	00813823          	sd	s0,16(sp)
    80005914:	00913423          	sd	s1,8(sp)
    80005918:	02010413          	addi	s0,sp,32
    8000591c:	00004497          	auipc	s1,0x4
    80005920:	5fc48493          	addi	s1,s1,1532 # 80009f18 <cons>
    80005924:	00048513          	mv	a0,s1
    80005928:	00002597          	auipc	a1,0x2
    8000592c:	ce058593          	addi	a1,a1,-800 # 80007608 <_ZTV14PeriodicThread+0x178>
    80005930:	00001097          	auipc	ra,0x1
    80005934:	d88080e7          	jalr	-632(ra) # 800066b8 <initlock>
    80005938:	00000097          	auipc	ra,0x0
    8000593c:	7ac080e7          	jalr	1964(ra) # 800060e4 <uartinit>
    80005940:	01813083          	ld	ra,24(sp)
    80005944:	01013403          	ld	s0,16(sp)
    80005948:	00000797          	auipc	a5,0x0
    8000594c:	d9c78793          	addi	a5,a5,-612 # 800056e4 <consoleread>
    80005950:	0af4bc23          	sd	a5,184(s1)
    80005954:	00000797          	auipc	a5,0x0
    80005958:	cec78793          	addi	a5,a5,-788 # 80005640 <consolewrite>
    8000595c:	0cf4b023          	sd	a5,192(s1)
    80005960:	00813483          	ld	s1,8(sp)
    80005964:	02010113          	addi	sp,sp,32
    80005968:	00008067          	ret

000000008000596c <console_read>:
    8000596c:	ff010113          	addi	sp,sp,-16
    80005970:	00813423          	sd	s0,8(sp)
    80005974:	01010413          	addi	s0,sp,16
    80005978:	00813403          	ld	s0,8(sp)
    8000597c:	00004317          	auipc	t1,0x4
    80005980:	65433303          	ld	t1,1620(t1) # 80009fd0 <devsw+0x10>
    80005984:	01010113          	addi	sp,sp,16
    80005988:	00030067          	jr	t1

000000008000598c <console_write>:
    8000598c:	ff010113          	addi	sp,sp,-16
    80005990:	00813423          	sd	s0,8(sp)
    80005994:	01010413          	addi	s0,sp,16
    80005998:	00813403          	ld	s0,8(sp)
    8000599c:	00004317          	auipc	t1,0x4
    800059a0:	63c33303          	ld	t1,1596(t1) # 80009fd8 <devsw+0x18>
    800059a4:	01010113          	addi	sp,sp,16
    800059a8:	00030067          	jr	t1

00000000800059ac <panic>:
    800059ac:	fe010113          	addi	sp,sp,-32
    800059b0:	00113c23          	sd	ra,24(sp)
    800059b4:	00813823          	sd	s0,16(sp)
    800059b8:	00913423          	sd	s1,8(sp)
    800059bc:	02010413          	addi	s0,sp,32
    800059c0:	00050493          	mv	s1,a0
    800059c4:	00002517          	auipc	a0,0x2
    800059c8:	c4c50513          	addi	a0,a0,-948 # 80007610 <_ZTV14PeriodicThread+0x180>
    800059cc:	00004797          	auipc	a5,0x4
    800059d0:	6a07a623          	sw	zero,1708(a5) # 8000a078 <pr+0x18>
    800059d4:	00000097          	auipc	ra,0x0
    800059d8:	034080e7          	jalr	52(ra) # 80005a08 <__printf>
    800059dc:	00048513          	mv	a0,s1
    800059e0:	00000097          	auipc	ra,0x0
    800059e4:	028080e7          	jalr	40(ra) # 80005a08 <__printf>
    800059e8:	00002517          	auipc	a0,0x2
    800059ec:	86850513          	addi	a0,a0,-1944 # 80007250 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x198>
    800059f0:	00000097          	auipc	ra,0x0
    800059f4:	018080e7          	jalr	24(ra) # 80005a08 <__printf>
    800059f8:	00100793          	li	a5,1
    800059fc:	00003717          	auipc	a4,0x3
    80005a00:	3ef72a23          	sw	a5,1012(a4) # 80008df0 <panicked>
    80005a04:	0000006f          	j	80005a04 <panic+0x58>

0000000080005a08 <__printf>:
    80005a08:	f3010113          	addi	sp,sp,-208
    80005a0c:	08813023          	sd	s0,128(sp)
    80005a10:	07313423          	sd	s3,104(sp)
    80005a14:	09010413          	addi	s0,sp,144
    80005a18:	05813023          	sd	s8,64(sp)
    80005a1c:	08113423          	sd	ra,136(sp)
    80005a20:	06913c23          	sd	s1,120(sp)
    80005a24:	07213823          	sd	s2,112(sp)
    80005a28:	07413023          	sd	s4,96(sp)
    80005a2c:	05513c23          	sd	s5,88(sp)
    80005a30:	05613823          	sd	s6,80(sp)
    80005a34:	05713423          	sd	s7,72(sp)
    80005a38:	03913c23          	sd	s9,56(sp)
    80005a3c:	03a13823          	sd	s10,48(sp)
    80005a40:	03b13423          	sd	s11,40(sp)
    80005a44:	00004317          	auipc	t1,0x4
    80005a48:	61c30313          	addi	t1,t1,1564 # 8000a060 <pr>
    80005a4c:	01832c03          	lw	s8,24(t1)
    80005a50:	00b43423          	sd	a1,8(s0)
    80005a54:	00c43823          	sd	a2,16(s0)
    80005a58:	00d43c23          	sd	a3,24(s0)
    80005a5c:	02e43023          	sd	a4,32(s0)
    80005a60:	02f43423          	sd	a5,40(s0)
    80005a64:	03043823          	sd	a6,48(s0)
    80005a68:	03143c23          	sd	a7,56(s0)
    80005a6c:	00050993          	mv	s3,a0
    80005a70:	4a0c1663          	bnez	s8,80005f1c <__printf+0x514>
    80005a74:	60098c63          	beqz	s3,8000608c <__printf+0x684>
    80005a78:	0009c503          	lbu	a0,0(s3)
    80005a7c:	00840793          	addi	a5,s0,8
    80005a80:	f6f43c23          	sd	a5,-136(s0)
    80005a84:	00000493          	li	s1,0
    80005a88:	22050063          	beqz	a0,80005ca8 <__printf+0x2a0>
    80005a8c:	00002a37          	lui	s4,0x2
    80005a90:	00018ab7          	lui	s5,0x18
    80005a94:	000f4b37          	lui	s6,0xf4
    80005a98:	00989bb7          	lui	s7,0x989
    80005a9c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005aa0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005aa4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005aa8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005aac:	00148c9b          	addiw	s9,s1,1
    80005ab0:	02500793          	li	a5,37
    80005ab4:	01998933          	add	s2,s3,s9
    80005ab8:	38f51263          	bne	a0,a5,80005e3c <__printf+0x434>
    80005abc:	00094783          	lbu	a5,0(s2)
    80005ac0:	00078c9b          	sext.w	s9,a5
    80005ac4:	1e078263          	beqz	a5,80005ca8 <__printf+0x2a0>
    80005ac8:	0024849b          	addiw	s1,s1,2
    80005acc:	07000713          	li	a4,112
    80005ad0:	00998933          	add	s2,s3,s1
    80005ad4:	38e78a63          	beq	a5,a4,80005e68 <__printf+0x460>
    80005ad8:	20f76863          	bltu	a4,a5,80005ce8 <__printf+0x2e0>
    80005adc:	42a78863          	beq	a5,a0,80005f0c <__printf+0x504>
    80005ae0:	06400713          	li	a4,100
    80005ae4:	40e79663          	bne	a5,a4,80005ef0 <__printf+0x4e8>
    80005ae8:	f7843783          	ld	a5,-136(s0)
    80005aec:	0007a603          	lw	a2,0(a5)
    80005af0:	00878793          	addi	a5,a5,8
    80005af4:	f6f43c23          	sd	a5,-136(s0)
    80005af8:	42064a63          	bltz	a2,80005f2c <__printf+0x524>
    80005afc:	00a00713          	li	a4,10
    80005b00:	02e677bb          	remuw	a5,a2,a4
    80005b04:	00002d97          	auipc	s11,0x2
    80005b08:	b34d8d93          	addi	s11,s11,-1228 # 80007638 <digits>
    80005b0c:	00900593          	li	a1,9
    80005b10:	0006051b          	sext.w	a0,a2
    80005b14:	00000c93          	li	s9,0
    80005b18:	02079793          	slli	a5,a5,0x20
    80005b1c:	0207d793          	srli	a5,a5,0x20
    80005b20:	00fd87b3          	add	a5,s11,a5
    80005b24:	0007c783          	lbu	a5,0(a5)
    80005b28:	02e656bb          	divuw	a3,a2,a4
    80005b2c:	f8f40023          	sb	a5,-128(s0)
    80005b30:	14c5d863          	bge	a1,a2,80005c80 <__printf+0x278>
    80005b34:	06300593          	li	a1,99
    80005b38:	00100c93          	li	s9,1
    80005b3c:	02e6f7bb          	remuw	a5,a3,a4
    80005b40:	02079793          	slli	a5,a5,0x20
    80005b44:	0207d793          	srli	a5,a5,0x20
    80005b48:	00fd87b3          	add	a5,s11,a5
    80005b4c:	0007c783          	lbu	a5,0(a5)
    80005b50:	02e6d73b          	divuw	a4,a3,a4
    80005b54:	f8f400a3          	sb	a5,-127(s0)
    80005b58:	12a5f463          	bgeu	a1,a0,80005c80 <__printf+0x278>
    80005b5c:	00a00693          	li	a3,10
    80005b60:	00900593          	li	a1,9
    80005b64:	02d777bb          	remuw	a5,a4,a3
    80005b68:	02079793          	slli	a5,a5,0x20
    80005b6c:	0207d793          	srli	a5,a5,0x20
    80005b70:	00fd87b3          	add	a5,s11,a5
    80005b74:	0007c503          	lbu	a0,0(a5)
    80005b78:	02d757bb          	divuw	a5,a4,a3
    80005b7c:	f8a40123          	sb	a0,-126(s0)
    80005b80:	48e5f263          	bgeu	a1,a4,80006004 <__printf+0x5fc>
    80005b84:	06300513          	li	a0,99
    80005b88:	02d7f5bb          	remuw	a1,a5,a3
    80005b8c:	02059593          	slli	a1,a1,0x20
    80005b90:	0205d593          	srli	a1,a1,0x20
    80005b94:	00bd85b3          	add	a1,s11,a1
    80005b98:	0005c583          	lbu	a1,0(a1)
    80005b9c:	02d7d7bb          	divuw	a5,a5,a3
    80005ba0:	f8b401a3          	sb	a1,-125(s0)
    80005ba4:	48e57263          	bgeu	a0,a4,80006028 <__printf+0x620>
    80005ba8:	3e700513          	li	a0,999
    80005bac:	02d7f5bb          	remuw	a1,a5,a3
    80005bb0:	02059593          	slli	a1,a1,0x20
    80005bb4:	0205d593          	srli	a1,a1,0x20
    80005bb8:	00bd85b3          	add	a1,s11,a1
    80005bbc:	0005c583          	lbu	a1,0(a1)
    80005bc0:	02d7d7bb          	divuw	a5,a5,a3
    80005bc4:	f8b40223          	sb	a1,-124(s0)
    80005bc8:	46e57663          	bgeu	a0,a4,80006034 <__printf+0x62c>
    80005bcc:	02d7f5bb          	remuw	a1,a5,a3
    80005bd0:	02059593          	slli	a1,a1,0x20
    80005bd4:	0205d593          	srli	a1,a1,0x20
    80005bd8:	00bd85b3          	add	a1,s11,a1
    80005bdc:	0005c583          	lbu	a1,0(a1)
    80005be0:	02d7d7bb          	divuw	a5,a5,a3
    80005be4:	f8b402a3          	sb	a1,-123(s0)
    80005be8:	46ea7863          	bgeu	s4,a4,80006058 <__printf+0x650>
    80005bec:	02d7f5bb          	remuw	a1,a5,a3
    80005bf0:	02059593          	slli	a1,a1,0x20
    80005bf4:	0205d593          	srli	a1,a1,0x20
    80005bf8:	00bd85b3          	add	a1,s11,a1
    80005bfc:	0005c583          	lbu	a1,0(a1)
    80005c00:	02d7d7bb          	divuw	a5,a5,a3
    80005c04:	f8b40323          	sb	a1,-122(s0)
    80005c08:	3eeaf863          	bgeu	s5,a4,80005ff8 <__printf+0x5f0>
    80005c0c:	02d7f5bb          	remuw	a1,a5,a3
    80005c10:	02059593          	slli	a1,a1,0x20
    80005c14:	0205d593          	srli	a1,a1,0x20
    80005c18:	00bd85b3          	add	a1,s11,a1
    80005c1c:	0005c583          	lbu	a1,0(a1)
    80005c20:	02d7d7bb          	divuw	a5,a5,a3
    80005c24:	f8b403a3          	sb	a1,-121(s0)
    80005c28:	42eb7e63          	bgeu	s6,a4,80006064 <__printf+0x65c>
    80005c2c:	02d7f5bb          	remuw	a1,a5,a3
    80005c30:	02059593          	slli	a1,a1,0x20
    80005c34:	0205d593          	srli	a1,a1,0x20
    80005c38:	00bd85b3          	add	a1,s11,a1
    80005c3c:	0005c583          	lbu	a1,0(a1)
    80005c40:	02d7d7bb          	divuw	a5,a5,a3
    80005c44:	f8b40423          	sb	a1,-120(s0)
    80005c48:	42ebfc63          	bgeu	s7,a4,80006080 <__printf+0x678>
    80005c4c:	02079793          	slli	a5,a5,0x20
    80005c50:	0207d793          	srli	a5,a5,0x20
    80005c54:	00fd8db3          	add	s11,s11,a5
    80005c58:	000dc703          	lbu	a4,0(s11)
    80005c5c:	00a00793          	li	a5,10
    80005c60:	00900c93          	li	s9,9
    80005c64:	f8e404a3          	sb	a4,-119(s0)
    80005c68:	00065c63          	bgez	a2,80005c80 <__printf+0x278>
    80005c6c:	f9040713          	addi	a4,s0,-112
    80005c70:	00f70733          	add	a4,a4,a5
    80005c74:	02d00693          	li	a3,45
    80005c78:	fed70823          	sb	a3,-16(a4)
    80005c7c:	00078c93          	mv	s9,a5
    80005c80:	f8040793          	addi	a5,s0,-128
    80005c84:	01978cb3          	add	s9,a5,s9
    80005c88:	f7f40d13          	addi	s10,s0,-129
    80005c8c:	000cc503          	lbu	a0,0(s9)
    80005c90:	fffc8c93          	addi	s9,s9,-1
    80005c94:	00000097          	auipc	ra,0x0
    80005c98:	b90080e7          	jalr	-1136(ra) # 80005824 <consputc>
    80005c9c:	ffac98e3          	bne	s9,s10,80005c8c <__printf+0x284>
    80005ca0:	00094503          	lbu	a0,0(s2)
    80005ca4:	e00514e3          	bnez	a0,80005aac <__printf+0xa4>
    80005ca8:	1a0c1663          	bnez	s8,80005e54 <__printf+0x44c>
    80005cac:	08813083          	ld	ra,136(sp)
    80005cb0:	08013403          	ld	s0,128(sp)
    80005cb4:	07813483          	ld	s1,120(sp)
    80005cb8:	07013903          	ld	s2,112(sp)
    80005cbc:	06813983          	ld	s3,104(sp)
    80005cc0:	06013a03          	ld	s4,96(sp)
    80005cc4:	05813a83          	ld	s5,88(sp)
    80005cc8:	05013b03          	ld	s6,80(sp)
    80005ccc:	04813b83          	ld	s7,72(sp)
    80005cd0:	04013c03          	ld	s8,64(sp)
    80005cd4:	03813c83          	ld	s9,56(sp)
    80005cd8:	03013d03          	ld	s10,48(sp)
    80005cdc:	02813d83          	ld	s11,40(sp)
    80005ce0:	0d010113          	addi	sp,sp,208
    80005ce4:	00008067          	ret
    80005ce8:	07300713          	li	a4,115
    80005cec:	1ce78a63          	beq	a5,a4,80005ec0 <__printf+0x4b8>
    80005cf0:	07800713          	li	a4,120
    80005cf4:	1ee79e63          	bne	a5,a4,80005ef0 <__printf+0x4e8>
    80005cf8:	f7843783          	ld	a5,-136(s0)
    80005cfc:	0007a703          	lw	a4,0(a5)
    80005d00:	00878793          	addi	a5,a5,8
    80005d04:	f6f43c23          	sd	a5,-136(s0)
    80005d08:	28074263          	bltz	a4,80005f8c <__printf+0x584>
    80005d0c:	00002d97          	auipc	s11,0x2
    80005d10:	92cd8d93          	addi	s11,s11,-1748 # 80007638 <digits>
    80005d14:	00f77793          	andi	a5,a4,15
    80005d18:	00fd87b3          	add	a5,s11,a5
    80005d1c:	0007c683          	lbu	a3,0(a5)
    80005d20:	00f00613          	li	a2,15
    80005d24:	0007079b          	sext.w	a5,a4
    80005d28:	f8d40023          	sb	a3,-128(s0)
    80005d2c:	0047559b          	srliw	a1,a4,0x4
    80005d30:	0047569b          	srliw	a3,a4,0x4
    80005d34:	00000c93          	li	s9,0
    80005d38:	0ee65063          	bge	a2,a4,80005e18 <__printf+0x410>
    80005d3c:	00f6f693          	andi	a3,a3,15
    80005d40:	00dd86b3          	add	a3,s11,a3
    80005d44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005d48:	0087d79b          	srliw	a5,a5,0x8
    80005d4c:	00100c93          	li	s9,1
    80005d50:	f8d400a3          	sb	a3,-127(s0)
    80005d54:	0cb67263          	bgeu	a2,a1,80005e18 <__printf+0x410>
    80005d58:	00f7f693          	andi	a3,a5,15
    80005d5c:	00dd86b3          	add	a3,s11,a3
    80005d60:	0006c583          	lbu	a1,0(a3)
    80005d64:	00f00613          	li	a2,15
    80005d68:	0047d69b          	srliw	a3,a5,0x4
    80005d6c:	f8b40123          	sb	a1,-126(s0)
    80005d70:	0047d593          	srli	a1,a5,0x4
    80005d74:	28f67e63          	bgeu	a2,a5,80006010 <__printf+0x608>
    80005d78:	00f6f693          	andi	a3,a3,15
    80005d7c:	00dd86b3          	add	a3,s11,a3
    80005d80:	0006c503          	lbu	a0,0(a3)
    80005d84:	0087d813          	srli	a6,a5,0x8
    80005d88:	0087d69b          	srliw	a3,a5,0x8
    80005d8c:	f8a401a3          	sb	a0,-125(s0)
    80005d90:	28b67663          	bgeu	a2,a1,8000601c <__printf+0x614>
    80005d94:	00f6f693          	andi	a3,a3,15
    80005d98:	00dd86b3          	add	a3,s11,a3
    80005d9c:	0006c583          	lbu	a1,0(a3)
    80005da0:	00c7d513          	srli	a0,a5,0xc
    80005da4:	00c7d69b          	srliw	a3,a5,0xc
    80005da8:	f8b40223          	sb	a1,-124(s0)
    80005dac:	29067a63          	bgeu	a2,a6,80006040 <__printf+0x638>
    80005db0:	00f6f693          	andi	a3,a3,15
    80005db4:	00dd86b3          	add	a3,s11,a3
    80005db8:	0006c583          	lbu	a1,0(a3)
    80005dbc:	0107d813          	srli	a6,a5,0x10
    80005dc0:	0107d69b          	srliw	a3,a5,0x10
    80005dc4:	f8b402a3          	sb	a1,-123(s0)
    80005dc8:	28a67263          	bgeu	a2,a0,8000604c <__printf+0x644>
    80005dcc:	00f6f693          	andi	a3,a3,15
    80005dd0:	00dd86b3          	add	a3,s11,a3
    80005dd4:	0006c683          	lbu	a3,0(a3)
    80005dd8:	0147d79b          	srliw	a5,a5,0x14
    80005ddc:	f8d40323          	sb	a3,-122(s0)
    80005de0:	21067663          	bgeu	a2,a6,80005fec <__printf+0x5e4>
    80005de4:	02079793          	slli	a5,a5,0x20
    80005de8:	0207d793          	srli	a5,a5,0x20
    80005dec:	00fd8db3          	add	s11,s11,a5
    80005df0:	000dc683          	lbu	a3,0(s11)
    80005df4:	00800793          	li	a5,8
    80005df8:	00700c93          	li	s9,7
    80005dfc:	f8d403a3          	sb	a3,-121(s0)
    80005e00:	00075c63          	bgez	a4,80005e18 <__printf+0x410>
    80005e04:	f9040713          	addi	a4,s0,-112
    80005e08:	00f70733          	add	a4,a4,a5
    80005e0c:	02d00693          	li	a3,45
    80005e10:	fed70823          	sb	a3,-16(a4)
    80005e14:	00078c93          	mv	s9,a5
    80005e18:	f8040793          	addi	a5,s0,-128
    80005e1c:	01978cb3          	add	s9,a5,s9
    80005e20:	f7f40d13          	addi	s10,s0,-129
    80005e24:	000cc503          	lbu	a0,0(s9)
    80005e28:	fffc8c93          	addi	s9,s9,-1
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	9f8080e7          	jalr	-1544(ra) # 80005824 <consputc>
    80005e34:	ff9d18e3          	bne	s10,s9,80005e24 <__printf+0x41c>
    80005e38:	0100006f          	j	80005e48 <__printf+0x440>
    80005e3c:	00000097          	auipc	ra,0x0
    80005e40:	9e8080e7          	jalr	-1560(ra) # 80005824 <consputc>
    80005e44:	000c8493          	mv	s1,s9
    80005e48:	00094503          	lbu	a0,0(s2)
    80005e4c:	c60510e3          	bnez	a0,80005aac <__printf+0xa4>
    80005e50:	e40c0ee3          	beqz	s8,80005cac <__printf+0x2a4>
    80005e54:	00004517          	auipc	a0,0x4
    80005e58:	20c50513          	addi	a0,a0,524 # 8000a060 <pr>
    80005e5c:	00001097          	auipc	ra,0x1
    80005e60:	94c080e7          	jalr	-1716(ra) # 800067a8 <release>
    80005e64:	e49ff06f          	j	80005cac <__printf+0x2a4>
    80005e68:	f7843783          	ld	a5,-136(s0)
    80005e6c:	03000513          	li	a0,48
    80005e70:	01000d13          	li	s10,16
    80005e74:	00878713          	addi	a4,a5,8
    80005e78:	0007bc83          	ld	s9,0(a5)
    80005e7c:	f6e43c23          	sd	a4,-136(s0)
    80005e80:	00000097          	auipc	ra,0x0
    80005e84:	9a4080e7          	jalr	-1628(ra) # 80005824 <consputc>
    80005e88:	07800513          	li	a0,120
    80005e8c:	00000097          	auipc	ra,0x0
    80005e90:	998080e7          	jalr	-1640(ra) # 80005824 <consputc>
    80005e94:	00001d97          	auipc	s11,0x1
    80005e98:	7a4d8d93          	addi	s11,s11,1956 # 80007638 <digits>
    80005e9c:	03ccd793          	srli	a5,s9,0x3c
    80005ea0:	00fd87b3          	add	a5,s11,a5
    80005ea4:	0007c503          	lbu	a0,0(a5)
    80005ea8:	fffd0d1b          	addiw	s10,s10,-1
    80005eac:	004c9c93          	slli	s9,s9,0x4
    80005eb0:	00000097          	auipc	ra,0x0
    80005eb4:	974080e7          	jalr	-1676(ra) # 80005824 <consputc>
    80005eb8:	fe0d12e3          	bnez	s10,80005e9c <__printf+0x494>
    80005ebc:	f8dff06f          	j	80005e48 <__printf+0x440>
    80005ec0:	f7843783          	ld	a5,-136(s0)
    80005ec4:	0007bc83          	ld	s9,0(a5)
    80005ec8:	00878793          	addi	a5,a5,8
    80005ecc:	f6f43c23          	sd	a5,-136(s0)
    80005ed0:	000c9a63          	bnez	s9,80005ee4 <__printf+0x4dc>
    80005ed4:	1080006f          	j	80005fdc <__printf+0x5d4>
    80005ed8:	001c8c93          	addi	s9,s9,1
    80005edc:	00000097          	auipc	ra,0x0
    80005ee0:	948080e7          	jalr	-1720(ra) # 80005824 <consputc>
    80005ee4:	000cc503          	lbu	a0,0(s9)
    80005ee8:	fe0518e3          	bnez	a0,80005ed8 <__printf+0x4d0>
    80005eec:	f5dff06f          	j	80005e48 <__printf+0x440>
    80005ef0:	02500513          	li	a0,37
    80005ef4:	00000097          	auipc	ra,0x0
    80005ef8:	930080e7          	jalr	-1744(ra) # 80005824 <consputc>
    80005efc:	000c8513          	mv	a0,s9
    80005f00:	00000097          	auipc	ra,0x0
    80005f04:	924080e7          	jalr	-1756(ra) # 80005824 <consputc>
    80005f08:	f41ff06f          	j	80005e48 <__printf+0x440>
    80005f0c:	02500513          	li	a0,37
    80005f10:	00000097          	auipc	ra,0x0
    80005f14:	914080e7          	jalr	-1772(ra) # 80005824 <consputc>
    80005f18:	f31ff06f          	j	80005e48 <__printf+0x440>
    80005f1c:	00030513          	mv	a0,t1
    80005f20:	00000097          	auipc	ra,0x0
    80005f24:	7bc080e7          	jalr	1980(ra) # 800066dc <acquire>
    80005f28:	b4dff06f          	j	80005a74 <__printf+0x6c>
    80005f2c:	40c0053b          	negw	a0,a2
    80005f30:	00a00713          	li	a4,10
    80005f34:	02e576bb          	remuw	a3,a0,a4
    80005f38:	00001d97          	auipc	s11,0x1
    80005f3c:	700d8d93          	addi	s11,s11,1792 # 80007638 <digits>
    80005f40:	ff700593          	li	a1,-9
    80005f44:	02069693          	slli	a3,a3,0x20
    80005f48:	0206d693          	srli	a3,a3,0x20
    80005f4c:	00dd86b3          	add	a3,s11,a3
    80005f50:	0006c683          	lbu	a3,0(a3)
    80005f54:	02e557bb          	divuw	a5,a0,a4
    80005f58:	f8d40023          	sb	a3,-128(s0)
    80005f5c:	10b65e63          	bge	a2,a1,80006078 <__printf+0x670>
    80005f60:	06300593          	li	a1,99
    80005f64:	02e7f6bb          	remuw	a3,a5,a4
    80005f68:	02069693          	slli	a3,a3,0x20
    80005f6c:	0206d693          	srli	a3,a3,0x20
    80005f70:	00dd86b3          	add	a3,s11,a3
    80005f74:	0006c683          	lbu	a3,0(a3)
    80005f78:	02e7d73b          	divuw	a4,a5,a4
    80005f7c:	00200793          	li	a5,2
    80005f80:	f8d400a3          	sb	a3,-127(s0)
    80005f84:	bca5ece3          	bltu	a1,a0,80005b5c <__printf+0x154>
    80005f88:	ce5ff06f          	j	80005c6c <__printf+0x264>
    80005f8c:	40e007bb          	negw	a5,a4
    80005f90:	00001d97          	auipc	s11,0x1
    80005f94:	6a8d8d93          	addi	s11,s11,1704 # 80007638 <digits>
    80005f98:	00f7f693          	andi	a3,a5,15
    80005f9c:	00dd86b3          	add	a3,s11,a3
    80005fa0:	0006c583          	lbu	a1,0(a3)
    80005fa4:	ff100613          	li	a2,-15
    80005fa8:	0047d69b          	srliw	a3,a5,0x4
    80005fac:	f8b40023          	sb	a1,-128(s0)
    80005fb0:	0047d59b          	srliw	a1,a5,0x4
    80005fb4:	0ac75e63          	bge	a4,a2,80006070 <__printf+0x668>
    80005fb8:	00f6f693          	andi	a3,a3,15
    80005fbc:	00dd86b3          	add	a3,s11,a3
    80005fc0:	0006c603          	lbu	a2,0(a3)
    80005fc4:	00f00693          	li	a3,15
    80005fc8:	0087d79b          	srliw	a5,a5,0x8
    80005fcc:	f8c400a3          	sb	a2,-127(s0)
    80005fd0:	d8b6e4e3          	bltu	a3,a1,80005d58 <__printf+0x350>
    80005fd4:	00200793          	li	a5,2
    80005fd8:	e2dff06f          	j	80005e04 <__printf+0x3fc>
    80005fdc:	00001c97          	auipc	s9,0x1
    80005fe0:	63cc8c93          	addi	s9,s9,1596 # 80007618 <_ZTV14PeriodicThread+0x188>
    80005fe4:	02800513          	li	a0,40
    80005fe8:	ef1ff06f          	j	80005ed8 <__printf+0x4d0>
    80005fec:	00700793          	li	a5,7
    80005ff0:	00600c93          	li	s9,6
    80005ff4:	e0dff06f          	j	80005e00 <__printf+0x3f8>
    80005ff8:	00700793          	li	a5,7
    80005ffc:	00600c93          	li	s9,6
    80006000:	c69ff06f          	j	80005c68 <__printf+0x260>
    80006004:	00300793          	li	a5,3
    80006008:	00200c93          	li	s9,2
    8000600c:	c5dff06f          	j	80005c68 <__printf+0x260>
    80006010:	00300793          	li	a5,3
    80006014:	00200c93          	li	s9,2
    80006018:	de9ff06f          	j	80005e00 <__printf+0x3f8>
    8000601c:	00400793          	li	a5,4
    80006020:	00300c93          	li	s9,3
    80006024:	dddff06f          	j	80005e00 <__printf+0x3f8>
    80006028:	00400793          	li	a5,4
    8000602c:	00300c93          	li	s9,3
    80006030:	c39ff06f          	j	80005c68 <__printf+0x260>
    80006034:	00500793          	li	a5,5
    80006038:	00400c93          	li	s9,4
    8000603c:	c2dff06f          	j	80005c68 <__printf+0x260>
    80006040:	00500793          	li	a5,5
    80006044:	00400c93          	li	s9,4
    80006048:	db9ff06f          	j	80005e00 <__printf+0x3f8>
    8000604c:	00600793          	li	a5,6
    80006050:	00500c93          	li	s9,5
    80006054:	dadff06f          	j	80005e00 <__printf+0x3f8>
    80006058:	00600793          	li	a5,6
    8000605c:	00500c93          	li	s9,5
    80006060:	c09ff06f          	j	80005c68 <__printf+0x260>
    80006064:	00800793          	li	a5,8
    80006068:	00700c93          	li	s9,7
    8000606c:	bfdff06f          	j	80005c68 <__printf+0x260>
    80006070:	00100793          	li	a5,1
    80006074:	d91ff06f          	j	80005e04 <__printf+0x3fc>
    80006078:	00100793          	li	a5,1
    8000607c:	bf1ff06f          	j	80005c6c <__printf+0x264>
    80006080:	00900793          	li	a5,9
    80006084:	00800c93          	li	s9,8
    80006088:	be1ff06f          	j	80005c68 <__printf+0x260>
    8000608c:	00001517          	auipc	a0,0x1
    80006090:	59450513          	addi	a0,a0,1428 # 80007620 <_ZTV14PeriodicThread+0x190>
    80006094:	00000097          	auipc	ra,0x0
    80006098:	918080e7          	jalr	-1768(ra) # 800059ac <panic>

000000008000609c <printfinit>:
    8000609c:	fe010113          	addi	sp,sp,-32
    800060a0:	00813823          	sd	s0,16(sp)
    800060a4:	00913423          	sd	s1,8(sp)
    800060a8:	00113c23          	sd	ra,24(sp)
    800060ac:	02010413          	addi	s0,sp,32
    800060b0:	00004497          	auipc	s1,0x4
    800060b4:	fb048493          	addi	s1,s1,-80 # 8000a060 <pr>
    800060b8:	00048513          	mv	a0,s1
    800060bc:	00001597          	auipc	a1,0x1
    800060c0:	57458593          	addi	a1,a1,1396 # 80007630 <_ZTV14PeriodicThread+0x1a0>
    800060c4:	00000097          	auipc	ra,0x0
    800060c8:	5f4080e7          	jalr	1524(ra) # 800066b8 <initlock>
    800060cc:	01813083          	ld	ra,24(sp)
    800060d0:	01013403          	ld	s0,16(sp)
    800060d4:	0004ac23          	sw	zero,24(s1)
    800060d8:	00813483          	ld	s1,8(sp)
    800060dc:	02010113          	addi	sp,sp,32
    800060e0:	00008067          	ret

00000000800060e4 <uartinit>:
    800060e4:	ff010113          	addi	sp,sp,-16
    800060e8:	00813423          	sd	s0,8(sp)
    800060ec:	01010413          	addi	s0,sp,16
    800060f0:	100007b7          	lui	a5,0x10000
    800060f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800060f8:	f8000713          	li	a4,-128
    800060fc:	00e781a3          	sb	a4,3(a5)
    80006100:	00300713          	li	a4,3
    80006104:	00e78023          	sb	a4,0(a5)
    80006108:	000780a3          	sb	zero,1(a5)
    8000610c:	00e781a3          	sb	a4,3(a5)
    80006110:	00700693          	li	a3,7
    80006114:	00d78123          	sb	a3,2(a5)
    80006118:	00e780a3          	sb	a4,1(a5)
    8000611c:	00813403          	ld	s0,8(sp)
    80006120:	01010113          	addi	sp,sp,16
    80006124:	00008067          	ret

0000000080006128 <uartputc>:
    80006128:	00003797          	auipc	a5,0x3
    8000612c:	cc87a783          	lw	a5,-824(a5) # 80008df0 <panicked>
    80006130:	00078463          	beqz	a5,80006138 <uartputc+0x10>
    80006134:	0000006f          	j	80006134 <uartputc+0xc>
    80006138:	fd010113          	addi	sp,sp,-48
    8000613c:	02813023          	sd	s0,32(sp)
    80006140:	00913c23          	sd	s1,24(sp)
    80006144:	01213823          	sd	s2,16(sp)
    80006148:	01313423          	sd	s3,8(sp)
    8000614c:	02113423          	sd	ra,40(sp)
    80006150:	03010413          	addi	s0,sp,48
    80006154:	00003917          	auipc	s2,0x3
    80006158:	ca490913          	addi	s2,s2,-860 # 80008df8 <uart_tx_r>
    8000615c:	00093783          	ld	a5,0(s2)
    80006160:	00003497          	auipc	s1,0x3
    80006164:	ca048493          	addi	s1,s1,-864 # 80008e00 <uart_tx_w>
    80006168:	0004b703          	ld	a4,0(s1)
    8000616c:	02078693          	addi	a3,a5,32
    80006170:	00050993          	mv	s3,a0
    80006174:	02e69c63          	bne	a3,a4,800061ac <uartputc+0x84>
    80006178:	00001097          	auipc	ra,0x1
    8000617c:	834080e7          	jalr	-1996(ra) # 800069ac <push_on>
    80006180:	00093783          	ld	a5,0(s2)
    80006184:	0004b703          	ld	a4,0(s1)
    80006188:	02078793          	addi	a5,a5,32
    8000618c:	00e79463          	bne	a5,a4,80006194 <uartputc+0x6c>
    80006190:	0000006f          	j	80006190 <uartputc+0x68>
    80006194:	00001097          	auipc	ra,0x1
    80006198:	88c080e7          	jalr	-1908(ra) # 80006a20 <pop_on>
    8000619c:	00093783          	ld	a5,0(s2)
    800061a0:	0004b703          	ld	a4,0(s1)
    800061a4:	02078693          	addi	a3,a5,32
    800061a8:	fce688e3          	beq	a3,a4,80006178 <uartputc+0x50>
    800061ac:	01f77693          	andi	a3,a4,31
    800061b0:	00004597          	auipc	a1,0x4
    800061b4:	ed058593          	addi	a1,a1,-304 # 8000a080 <uart_tx_buf>
    800061b8:	00d586b3          	add	a3,a1,a3
    800061bc:	00170713          	addi	a4,a4,1
    800061c0:	01368023          	sb	s3,0(a3)
    800061c4:	00e4b023          	sd	a4,0(s1)
    800061c8:	10000637          	lui	a2,0x10000
    800061cc:	02f71063          	bne	a4,a5,800061ec <uartputc+0xc4>
    800061d0:	0340006f          	j	80006204 <uartputc+0xdc>
    800061d4:	00074703          	lbu	a4,0(a4)
    800061d8:	00f93023          	sd	a5,0(s2)
    800061dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800061e0:	00093783          	ld	a5,0(s2)
    800061e4:	0004b703          	ld	a4,0(s1)
    800061e8:	00f70e63          	beq	a4,a5,80006204 <uartputc+0xdc>
    800061ec:	00564683          	lbu	a3,5(a2)
    800061f0:	01f7f713          	andi	a4,a5,31
    800061f4:	00e58733          	add	a4,a1,a4
    800061f8:	0206f693          	andi	a3,a3,32
    800061fc:	00178793          	addi	a5,a5,1
    80006200:	fc069ae3          	bnez	a3,800061d4 <uartputc+0xac>
    80006204:	02813083          	ld	ra,40(sp)
    80006208:	02013403          	ld	s0,32(sp)
    8000620c:	01813483          	ld	s1,24(sp)
    80006210:	01013903          	ld	s2,16(sp)
    80006214:	00813983          	ld	s3,8(sp)
    80006218:	03010113          	addi	sp,sp,48
    8000621c:	00008067          	ret

0000000080006220 <uartputc_sync>:
    80006220:	ff010113          	addi	sp,sp,-16
    80006224:	00813423          	sd	s0,8(sp)
    80006228:	01010413          	addi	s0,sp,16
    8000622c:	00003717          	auipc	a4,0x3
    80006230:	bc472703          	lw	a4,-1084(a4) # 80008df0 <panicked>
    80006234:	02071663          	bnez	a4,80006260 <uartputc_sync+0x40>
    80006238:	00050793          	mv	a5,a0
    8000623c:	100006b7          	lui	a3,0x10000
    80006240:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006244:	02077713          	andi	a4,a4,32
    80006248:	fe070ce3          	beqz	a4,80006240 <uartputc_sync+0x20>
    8000624c:	0ff7f793          	andi	a5,a5,255
    80006250:	00f68023          	sb	a5,0(a3)
    80006254:	00813403          	ld	s0,8(sp)
    80006258:	01010113          	addi	sp,sp,16
    8000625c:	00008067          	ret
    80006260:	0000006f          	j	80006260 <uartputc_sync+0x40>

0000000080006264 <uartstart>:
    80006264:	ff010113          	addi	sp,sp,-16
    80006268:	00813423          	sd	s0,8(sp)
    8000626c:	01010413          	addi	s0,sp,16
    80006270:	00003617          	auipc	a2,0x3
    80006274:	b8860613          	addi	a2,a2,-1144 # 80008df8 <uart_tx_r>
    80006278:	00003517          	auipc	a0,0x3
    8000627c:	b8850513          	addi	a0,a0,-1144 # 80008e00 <uart_tx_w>
    80006280:	00063783          	ld	a5,0(a2)
    80006284:	00053703          	ld	a4,0(a0)
    80006288:	04f70263          	beq	a4,a5,800062cc <uartstart+0x68>
    8000628c:	100005b7          	lui	a1,0x10000
    80006290:	00004817          	auipc	a6,0x4
    80006294:	df080813          	addi	a6,a6,-528 # 8000a080 <uart_tx_buf>
    80006298:	01c0006f          	j	800062b4 <uartstart+0x50>
    8000629c:	0006c703          	lbu	a4,0(a3)
    800062a0:	00f63023          	sd	a5,0(a2)
    800062a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800062a8:	00063783          	ld	a5,0(a2)
    800062ac:	00053703          	ld	a4,0(a0)
    800062b0:	00f70e63          	beq	a4,a5,800062cc <uartstart+0x68>
    800062b4:	01f7f713          	andi	a4,a5,31
    800062b8:	00e806b3          	add	a3,a6,a4
    800062bc:	0055c703          	lbu	a4,5(a1)
    800062c0:	00178793          	addi	a5,a5,1
    800062c4:	02077713          	andi	a4,a4,32
    800062c8:	fc071ae3          	bnez	a4,8000629c <uartstart+0x38>
    800062cc:	00813403          	ld	s0,8(sp)
    800062d0:	01010113          	addi	sp,sp,16
    800062d4:	00008067          	ret

00000000800062d8 <uartgetc>:
    800062d8:	ff010113          	addi	sp,sp,-16
    800062dc:	00813423          	sd	s0,8(sp)
    800062e0:	01010413          	addi	s0,sp,16
    800062e4:	10000737          	lui	a4,0x10000
    800062e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800062ec:	0017f793          	andi	a5,a5,1
    800062f0:	00078c63          	beqz	a5,80006308 <uartgetc+0x30>
    800062f4:	00074503          	lbu	a0,0(a4)
    800062f8:	0ff57513          	andi	a0,a0,255
    800062fc:	00813403          	ld	s0,8(sp)
    80006300:	01010113          	addi	sp,sp,16
    80006304:	00008067          	ret
    80006308:	fff00513          	li	a0,-1
    8000630c:	ff1ff06f          	j	800062fc <uartgetc+0x24>

0000000080006310 <uartintr>:
    80006310:	100007b7          	lui	a5,0x10000
    80006314:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006318:	0017f793          	andi	a5,a5,1
    8000631c:	0a078463          	beqz	a5,800063c4 <uartintr+0xb4>
    80006320:	fe010113          	addi	sp,sp,-32
    80006324:	00813823          	sd	s0,16(sp)
    80006328:	00913423          	sd	s1,8(sp)
    8000632c:	00113c23          	sd	ra,24(sp)
    80006330:	02010413          	addi	s0,sp,32
    80006334:	100004b7          	lui	s1,0x10000
    80006338:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000633c:	0ff57513          	andi	a0,a0,255
    80006340:	fffff097          	auipc	ra,0xfffff
    80006344:	534080e7          	jalr	1332(ra) # 80005874 <consoleintr>
    80006348:	0054c783          	lbu	a5,5(s1)
    8000634c:	0017f793          	andi	a5,a5,1
    80006350:	fe0794e3          	bnez	a5,80006338 <uartintr+0x28>
    80006354:	00003617          	auipc	a2,0x3
    80006358:	aa460613          	addi	a2,a2,-1372 # 80008df8 <uart_tx_r>
    8000635c:	00003517          	auipc	a0,0x3
    80006360:	aa450513          	addi	a0,a0,-1372 # 80008e00 <uart_tx_w>
    80006364:	00063783          	ld	a5,0(a2)
    80006368:	00053703          	ld	a4,0(a0)
    8000636c:	04f70263          	beq	a4,a5,800063b0 <uartintr+0xa0>
    80006370:	100005b7          	lui	a1,0x10000
    80006374:	00004817          	auipc	a6,0x4
    80006378:	d0c80813          	addi	a6,a6,-756 # 8000a080 <uart_tx_buf>
    8000637c:	01c0006f          	j	80006398 <uartintr+0x88>
    80006380:	0006c703          	lbu	a4,0(a3)
    80006384:	00f63023          	sd	a5,0(a2)
    80006388:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000638c:	00063783          	ld	a5,0(a2)
    80006390:	00053703          	ld	a4,0(a0)
    80006394:	00f70e63          	beq	a4,a5,800063b0 <uartintr+0xa0>
    80006398:	01f7f713          	andi	a4,a5,31
    8000639c:	00e806b3          	add	a3,a6,a4
    800063a0:	0055c703          	lbu	a4,5(a1)
    800063a4:	00178793          	addi	a5,a5,1
    800063a8:	02077713          	andi	a4,a4,32
    800063ac:	fc071ae3          	bnez	a4,80006380 <uartintr+0x70>
    800063b0:	01813083          	ld	ra,24(sp)
    800063b4:	01013403          	ld	s0,16(sp)
    800063b8:	00813483          	ld	s1,8(sp)
    800063bc:	02010113          	addi	sp,sp,32
    800063c0:	00008067          	ret
    800063c4:	00003617          	auipc	a2,0x3
    800063c8:	a3460613          	addi	a2,a2,-1484 # 80008df8 <uart_tx_r>
    800063cc:	00003517          	auipc	a0,0x3
    800063d0:	a3450513          	addi	a0,a0,-1484 # 80008e00 <uart_tx_w>
    800063d4:	00063783          	ld	a5,0(a2)
    800063d8:	00053703          	ld	a4,0(a0)
    800063dc:	04f70263          	beq	a4,a5,80006420 <uartintr+0x110>
    800063e0:	100005b7          	lui	a1,0x10000
    800063e4:	00004817          	auipc	a6,0x4
    800063e8:	c9c80813          	addi	a6,a6,-868 # 8000a080 <uart_tx_buf>
    800063ec:	01c0006f          	j	80006408 <uartintr+0xf8>
    800063f0:	0006c703          	lbu	a4,0(a3)
    800063f4:	00f63023          	sd	a5,0(a2)
    800063f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800063fc:	00063783          	ld	a5,0(a2)
    80006400:	00053703          	ld	a4,0(a0)
    80006404:	02f70063          	beq	a4,a5,80006424 <uartintr+0x114>
    80006408:	01f7f713          	andi	a4,a5,31
    8000640c:	00e806b3          	add	a3,a6,a4
    80006410:	0055c703          	lbu	a4,5(a1)
    80006414:	00178793          	addi	a5,a5,1
    80006418:	02077713          	andi	a4,a4,32
    8000641c:	fc071ae3          	bnez	a4,800063f0 <uartintr+0xe0>
    80006420:	00008067          	ret
    80006424:	00008067          	ret

0000000080006428 <kinit>:
    80006428:	fc010113          	addi	sp,sp,-64
    8000642c:	02913423          	sd	s1,40(sp)
    80006430:	fffff7b7          	lui	a5,0xfffff
    80006434:	00005497          	auipc	s1,0x5
    80006438:	c6b48493          	addi	s1,s1,-917 # 8000b09f <end+0xfff>
    8000643c:	02813823          	sd	s0,48(sp)
    80006440:	01313c23          	sd	s3,24(sp)
    80006444:	00f4f4b3          	and	s1,s1,a5
    80006448:	02113c23          	sd	ra,56(sp)
    8000644c:	03213023          	sd	s2,32(sp)
    80006450:	01413823          	sd	s4,16(sp)
    80006454:	01513423          	sd	s5,8(sp)
    80006458:	04010413          	addi	s0,sp,64
    8000645c:	000017b7          	lui	a5,0x1
    80006460:	01100993          	li	s3,17
    80006464:	00f487b3          	add	a5,s1,a5
    80006468:	01b99993          	slli	s3,s3,0x1b
    8000646c:	06f9e063          	bltu	s3,a5,800064cc <kinit+0xa4>
    80006470:	00004a97          	auipc	s5,0x4
    80006474:	c30a8a93          	addi	s5,s5,-976 # 8000a0a0 <end>
    80006478:	0754ec63          	bltu	s1,s5,800064f0 <kinit+0xc8>
    8000647c:	0734fa63          	bgeu	s1,s3,800064f0 <kinit+0xc8>
    80006480:	00088a37          	lui	s4,0x88
    80006484:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006488:	00003917          	auipc	s2,0x3
    8000648c:	98090913          	addi	s2,s2,-1664 # 80008e08 <kmem>
    80006490:	00ca1a13          	slli	s4,s4,0xc
    80006494:	0140006f          	j	800064a8 <kinit+0x80>
    80006498:	000017b7          	lui	a5,0x1
    8000649c:	00f484b3          	add	s1,s1,a5
    800064a0:	0554e863          	bltu	s1,s5,800064f0 <kinit+0xc8>
    800064a4:	0534f663          	bgeu	s1,s3,800064f0 <kinit+0xc8>
    800064a8:	00001637          	lui	a2,0x1
    800064ac:	00100593          	li	a1,1
    800064b0:	00048513          	mv	a0,s1
    800064b4:	00000097          	auipc	ra,0x0
    800064b8:	5e4080e7          	jalr	1508(ra) # 80006a98 <__memset>
    800064bc:	00093783          	ld	a5,0(s2)
    800064c0:	00f4b023          	sd	a5,0(s1)
    800064c4:	00993023          	sd	s1,0(s2)
    800064c8:	fd4498e3          	bne	s1,s4,80006498 <kinit+0x70>
    800064cc:	03813083          	ld	ra,56(sp)
    800064d0:	03013403          	ld	s0,48(sp)
    800064d4:	02813483          	ld	s1,40(sp)
    800064d8:	02013903          	ld	s2,32(sp)
    800064dc:	01813983          	ld	s3,24(sp)
    800064e0:	01013a03          	ld	s4,16(sp)
    800064e4:	00813a83          	ld	s5,8(sp)
    800064e8:	04010113          	addi	sp,sp,64
    800064ec:	00008067          	ret
    800064f0:	00001517          	auipc	a0,0x1
    800064f4:	16050513          	addi	a0,a0,352 # 80007650 <digits+0x18>
    800064f8:	fffff097          	auipc	ra,0xfffff
    800064fc:	4b4080e7          	jalr	1204(ra) # 800059ac <panic>

0000000080006500 <freerange>:
    80006500:	fc010113          	addi	sp,sp,-64
    80006504:	000017b7          	lui	a5,0x1
    80006508:	02913423          	sd	s1,40(sp)
    8000650c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006510:	009504b3          	add	s1,a0,s1
    80006514:	fffff537          	lui	a0,0xfffff
    80006518:	02813823          	sd	s0,48(sp)
    8000651c:	02113c23          	sd	ra,56(sp)
    80006520:	03213023          	sd	s2,32(sp)
    80006524:	01313c23          	sd	s3,24(sp)
    80006528:	01413823          	sd	s4,16(sp)
    8000652c:	01513423          	sd	s5,8(sp)
    80006530:	01613023          	sd	s6,0(sp)
    80006534:	04010413          	addi	s0,sp,64
    80006538:	00a4f4b3          	and	s1,s1,a0
    8000653c:	00f487b3          	add	a5,s1,a5
    80006540:	06f5e463          	bltu	a1,a5,800065a8 <freerange+0xa8>
    80006544:	00004a97          	auipc	s5,0x4
    80006548:	b5ca8a93          	addi	s5,s5,-1188 # 8000a0a0 <end>
    8000654c:	0954e263          	bltu	s1,s5,800065d0 <freerange+0xd0>
    80006550:	01100993          	li	s3,17
    80006554:	01b99993          	slli	s3,s3,0x1b
    80006558:	0734fc63          	bgeu	s1,s3,800065d0 <freerange+0xd0>
    8000655c:	00058a13          	mv	s4,a1
    80006560:	00003917          	auipc	s2,0x3
    80006564:	8a890913          	addi	s2,s2,-1880 # 80008e08 <kmem>
    80006568:	00002b37          	lui	s6,0x2
    8000656c:	0140006f          	j	80006580 <freerange+0x80>
    80006570:	000017b7          	lui	a5,0x1
    80006574:	00f484b3          	add	s1,s1,a5
    80006578:	0554ec63          	bltu	s1,s5,800065d0 <freerange+0xd0>
    8000657c:	0534fa63          	bgeu	s1,s3,800065d0 <freerange+0xd0>
    80006580:	00001637          	lui	a2,0x1
    80006584:	00100593          	li	a1,1
    80006588:	00048513          	mv	a0,s1
    8000658c:	00000097          	auipc	ra,0x0
    80006590:	50c080e7          	jalr	1292(ra) # 80006a98 <__memset>
    80006594:	00093703          	ld	a4,0(s2)
    80006598:	016487b3          	add	a5,s1,s6
    8000659c:	00e4b023          	sd	a4,0(s1)
    800065a0:	00993023          	sd	s1,0(s2)
    800065a4:	fcfa76e3          	bgeu	s4,a5,80006570 <freerange+0x70>
    800065a8:	03813083          	ld	ra,56(sp)
    800065ac:	03013403          	ld	s0,48(sp)
    800065b0:	02813483          	ld	s1,40(sp)
    800065b4:	02013903          	ld	s2,32(sp)
    800065b8:	01813983          	ld	s3,24(sp)
    800065bc:	01013a03          	ld	s4,16(sp)
    800065c0:	00813a83          	ld	s5,8(sp)
    800065c4:	00013b03          	ld	s6,0(sp)
    800065c8:	04010113          	addi	sp,sp,64
    800065cc:	00008067          	ret
    800065d0:	00001517          	auipc	a0,0x1
    800065d4:	08050513          	addi	a0,a0,128 # 80007650 <digits+0x18>
    800065d8:	fffff097          	auipc	ra,0xfffff
    800065dc:	3d4080e7          	jalr	980(ra) # 800059ac <panic>

00000000800065e0 <kfree>:
    800065e0:	fe010113          	addi	sp,sp,-32
    800065e4:	00813823          	sd	s0,16(sp)
    800065e8:	00113c23          	sd	ra,24(sp)
    800065ec:	00913423          	sd	s1,8(sp)
    800065f0:	02010413          	addi	s0,sp,32
    800065f4:	03451793          	slli	a5,a0,0x34
    800065f8:	04079c63          	bnez	a5,80006650 <kfree+0x70>
    800065fc:	00004797          	auipc	a5,0x4
    80006600:	aa478793          	addi	a5,a5,-1372 # 8000a0a0 <end>
    80006604:	00050493          	mv	s1,a0
    80006608:	04f56463          	bltu	a0,a5,80006650 <kfree+0x70>
    8000660c:	01100793          	li	a5,17
    80006610:	01b79793          	slli	a5,a5,0x1b
    80006614:	02f57e63          	bgeu	a0,a5,80006650 <kfree+0x70>
    80006618:	00001637          	lui	a2,0x1
    8000661c:	00100593          	li	a1,1
    80006620:	00000097          	auipc	ra,0x0
    80006624:	478080e7          	jalr	1144(ra) # 80006a98 <__memset>
    80006628:	00002797          	auipc	a5,0x2
    8000662c:	7e078793          	addi	a5,a5,2016 # 80008e08 <kmem>
    80006630:	0007b703          	ld	a4,0(a5)
    80006634:	01813083          	ld	ra,24(sp)
    80006638:	01013403          	ld	s0,16(sp)
    8000663c:	00e4b023          	sd	a4,0(s1)
    80006640:	0097b023          	sd	s1,0(a5)
    80006644:	00813483          	ld	s1,8(sp)
    80006648:	02010113          	addi	sp,sp,32
    8000664c:	00008067          	ret
    80006650:	00001517          	auipc	a0,0x1
    80006654:	00050513          	mv	a0,a0
    80006658:	fffff097          	auipc	ra,0xfffff
    8000665c:	354080e7          	jalr	852(ra) # 800059ac <panic>

0000000080006660 <kalloc>:
    80006660:	fe010113          	addi	sp,sp,-32
    80006664:	00813823          	sd	s0,16(sp)
    80006668:	00913423          	sd	s1,8(sp)
    8000666c:	00113c23          	sd	ra,24(sp)
    80006670:	02010413          	addi	s0,sp,32
    80006674:	00002797          	auipc	a5,0x2
    80006678:	79478793          	addi	a5,a5,1940 # 80008e08 <kmem>
    8000667c:	0007b483          	ld	s1,0(a5)
    80006680:	02048063          	beqz	s1,800066a0 <kalloc+0x40>
    80006684:	0004b703          	ld	a4,0(s1)
    80006688:	00001637          	lui	a2,0x1
    8000668c:	00500593          	li	a1,5
    80006690:	00048513          	mv	a0,s1
    80006694:	00e7b023          	sd	a4,0(a5)
    80006698:	00000097          	auipc	ra,0x0
    8000669c:	400080e7          	jalr	1024(ra) # 80006a98 <__memset>
    800066a0:	01813083          	ld	ra,24(sp)
    800066a4:	01013403          	ld	s0,16(sp)
    800066a8:	00048513          	mv	a0,s1
    800066ac:	00813483          	ld	s1,8(sp)
    800066b0:	02010113          	addi	sp,sp,32
    800066b4:	00008067          	ret

00000000800066b8 <initlock>:
    800066b8:	ff010113          	addi	sp,sp,-16
    800066bc:	00813423          	sd	s0,8(sp)
    800066c0:	01010413          	addi	s0,sp,16
    800066c4:	00813403          	ld	s0,8(sp)
    800066c8:	00b53423          	sd	a1,8(a0) # 80007658 <digits+0x20>
    800066cc:	00052023          	sw	zero,0(a0)
    800066d0:	00053823          	sd	zero,16(a0)
    800066d4:	01010113          	addi	sp,sp,16
    800066d8:	00008067          	ret

00000000800066dc <acquire>:
    800066dc:	fe010113          	addi	sp,sp,-32
    800066e0:	00813823          	sd	s0,16(sp)
    800066e4:	00913423          	sd	s1,8(sp)
    800066e8:	00113c23          	sd	ra,24(sp)
    800066ec:	01213023          	sd	s2,0(sp)
    800066f0:	02010413          	addi	s0,sp,32
    800066f4:	00050493          	mv	s1,a0
    800066f8:	10002973          	csrr	s2,sstatus
    800066fc:	100027f3          	csrr	a5,sstatus
    80006700:	ffd7f793          	andi	a5,a5,-3
    80006704:	10079073          	csrw	sstatus,a5
    80006708:	fffff097          	auipc	ra,0xfffff
    8000670c:	8e8080e7          	jalr	-1816(ra) # 80004ff0 <mycpu>
    80006710:	07852783          	lw	a5,120(a0)
    80006714:	06078e63          	beqz	a5,80006790 <acquire+0xb4>
    80006718:	fffff097          	auipc	ra,0xfffff
    8000671c:	8d8080e7          	jalr	-1832(ra) # 80004ff0 <mycpu>
    80006720:	07852783          	lw	a5,120(a0)
    80006724:	0004a703          	lw	a4,0(s1)
    80006728:	0017879b          	addiw	a5,a5,1
    8000672c:	06f52c23          	sw	a5,120(a0)
    80006730:	04071063          	bnez	a4,80006770 <acquire+0x94>
    80006734:	00100713          	li	a4,1
    80006738:	00070793          	mv	a5,a4
    8000673c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006740:	0007879b          	sext.w	a5,a5
    80006744:	fe079ae3          	bnez	a5,80006738 <acquire+0x5c>
    80006748:	0ff0000f          	fence
    8000674c:	fffff097          	auipc	ra,0xfffff
    80006750:	8a4080e7          	jalr	-1884(ra) # 80004ff0 <mycpu>
    80006754:	01813083          	ld	ra,24(sp)
    80006758:	01013403          	ld	s0,16(sp)
    8000675c:	00a4b823          	sd	a0,16(s1)
    80006760:	00013903          	ld	s2,0(sp)
    80006764:	00813483          	ld	s1,8(sp)
    80006768:	02010113          	addi	sp,sp,32
    8000676c:	00008067          	ret
    80006770:	0104b903          	ld	s2,16(s1)
    80006774:	fffff097          	auipc	ra,0xfffff
    80006778:	87c080e7          	jalr	-1924(ra) # 80004ff0 <mycpu>
    8000677c:	faa91ce3          	bne	s2,a0,80006734 <acquire+0x58>
    80006780:	00001517          	auipc	a0,0x1
    80006784:	ed850513          	addi	a0,a0,-296 # 80007658 <digits+0x20>
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	224080e7          	jalr	548(ra) # 800059ac <panic>
    80006790:	00195913          	srli	s2,s2,0x1
    80006794:	fffff097          	auipc	ra,0xfffff
    80006798:	85c080e7          	jalr	-1956(ra) # 80004ff0 <mycpu>
    8000679c:	00197913          	andi	s2,s2,1
    800067a0:	07252e23          	sw	s2,124(a0)
    800067a4:	f75ff06f          	j	80006718 <acquire+0x3c>

00000000800067a8 <release>:
    800067a8:	fe010113          	addi	sp,sp,-32
    800067ac:	00813823          	sd	s0,16(sp)
    800067b0:	00113c23          	sd	ra,24(sp)
    800067b4:	00913423          	sd	s1,8(sp)
    800067b8:	01213023          	sd	s2,0(sp)
    800067bc:	02010413          	addi	s0,sp,32
    800067c0:	00052783          	lw	a5,0(a0)
    800067c4:	00079a63          	bnez	a5,800067d8 <release+0x30>
    800067c8:	00001517          	auipc	a0,0x1
    800067cc:	e9850513          	addi	a0,a0,-360 # 80007660 <digits+0x28>
    800067d0:	fffff097          	auipc	ra,0xfffff
    800067d4:	1dc080e7          	jalr	476(ra) # 800059ac <panic>
    800067d8:	01053903          	ld	s2,16(a0)
    800067dc:	00050493          	mv	s1,a0
    800067e0:	fffff097          	auipc	ra,0xfffff
    800067e4:	810080e7          	jalr	-2032(ra) # 80004ff0 <mycpu>
    800067e8:	fea910e3          	bne	s2,a0,800067c8 <release+0x20>
    800067ec:	0004b823          	sd	zero,16(s1)
    800067f0:	0ff0000f          	fence
    800067f4:	0f50000f          	fence	iorw,ow
    800067f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800067fc:	ffffe097          	auipc	ra,0xffffe
    80006800:	7f4080e7          	jalr	2036(ra) # 80004ff0 <mycpu>
    80006804:	100027f3          	csrr	a5,sstatus
    80006808:	0027f793          	andi	a5,a5,2
    8000680c:	04079a63          	bnez	a5,80006860 <release+0xb8>
    80006810:	07852783          	lw	a5,120(a0)
    80006814:	02f05e63          	blez	a5,80006850 <release+0xa8>
    80006818:	fff7871b          	addiw	a4,a5,-1
    8000681c:	06e52c23          	sw	a4,120(a0)
    80006820:	00071c63          	bnez	a4,80006838 <release+0x90>
    80006824:	07c52783          	lw	a5,124(a0)
    80006828:	00078863          	beqz	a5,80006838 <release+0x90>
    8000682c:	100027f3          	csrr	a5,sstatus
    80006830:	0027e793          	ori	a5,a5,2
    80006834:	10079073          	csrw	sstatus,a5
    80006838:	01813083          	ld	ra,24(sp)
    8000683c:	01013403          	ld	s0,16(sp)
    80006840:	00813483          	ld	s1,8(sp)
    80006844:	00013903          	ld	s2,0(sp)
    80006848:	02010113          	addi	sp,sp,32
    8000684c:	00008067          	ret
    80006850:	00001517          	auipc	a0,0x1
    80006854:	e3050513          	addi	a0,a0,-464 # 80007680 <digits+0x48>
    80006858:	fffff097          	auipc	ra,0xfffff
    8000685c:	154080e7          	jalr	340(ra) # 800059ac <panic>
    80006860:	00001517          	auipc	a0,0x1
    80006864:	e0850513          	addi	a0,a0,-504 # 80007668 <digits+0x30>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	144080e7          	jalr	324(ra) # 800059ac <panic>

0000000080006870 <holding>:
    80006870:	00052783          	lw	a5,0(a0)
    80006874:	00079663          	bnez	a5,80006880 <holding+0x10>
    80006878:	00000513          	li	a0,0
    8000687c:	00008067          	ret
    80006880:	fe010113          	addi	sp,sp,-32
    80006884:	00813823          	sd	s0,16(sp)
    80006888:	00913423          	sd	s1,8(sp)
    8000688c:	00113c23          	sd	ra,24(sp)
    80006890:	02010413          	addi	s0,sp,32
    80006894:	01053483          	ld	s1,16(a0)
    80006898:	ffffe097          	auipc	ra,0xffffe
    8000689c:	758080e7          	jalr	1880(ra) # 80004ff0 <mycpu>
    800068a0:	01813083          	ld	ra,24(sp)
    800068a4:	01013403          	ld	s0,16(sp)
    800068a8:	40a48533          	sub	a0,s1,a0
    800068ac:	00153513          	seqz	a0,a0
    800068b0:	00813483          	ld	s1,8(sp)
    800068b4:	02010113          	addi	sp,sp,32
    800068b8:	00008067          	ret

00000000800068bc <push_off>:
    800068bc:	fe010113          	addi	sp,sp,-32
    800068c0:	00813823          	sd	s0,16(sp)
    800068c4:	00113c23          	sd	ra,24(sp)
    800068c8:	00913423          	sd	s1,8(sp)
    800068cc:	02010413          	addi	s0,sp,32
    800068d0:	100024f3          	csrr	s1,sstatus
    800068d4:	100027f3          	csrr	a5,sstatus
    800068d8:	ffd7f793          	andi	a5,a5,-3
    800068dc:	10079073          	csrw	sstatus,a5
    800068e0:	ffffe097          	auipc	ra,0xffffe
    800068e4:	710080e7          	jalr	1808(ra) # 80004ff0 <mycpu>
    800068e8:	07852783          	lw	a5,120(a0)
    800068ec:	02078663          	beqz	a5,80006918 <push_off+0x5c>
    800068f0:	ffffe097          	auipc	ra,0xffffe
    800068f4:	700080e7          	jalr	1792(ra) # 80004ff0 <mycpu>
    800068f8:	07852783          	lw	a5,120(a0)
    800068fc:	01813083          	ld	ra,24(sp)
    80006900:	01013403          	ld	s0,16(sp)
    80006904:	0017879b          	addiw	a5,a5,1
    80006908:	06f52c23          	sw	a5,120(a0)
    8000690c:	00813483          	ld	s1,8(sp)
    80006910:	02010113          	addi	sp,sp,32
    80006914:	00008067          	ret
    80006918:	0014d493          	srli	s1,s1,0x1
    8000691c:	ffffe097          	auipc	ra,0xffffe
    80006920:	6d4080e7          	jalr	1748(ra) # 80004ff0 <mycpu>
    80006924:	0014f493          	andi	s1,s1,1
    80006928:	06952e23          	sw	s1,124(a0)
    8000692c:	fc5ff06f          	j	800068f0 <push_off+0x34>

0000000080006930 <pop_off>:
    80006930:	ff010113          	addi	sp,sp,-16
    80006934:	00813023          	sd	s0,0(sp)
    80006938:	00113423          	sd	ra,8(sp)
    8000693c:	01010413          	addi	s0,sp,16
    80006940:	ffffe097          	auipc	ra,0xffffe
    80006944:	6b0080e7          	jalr	1712(ra) # 80004ff0 <mycpu>
    80006948:	100027f3          	csrr	a5,sstatus
    8000694c:	0027f793          	andi	a5,a5,2
    80006950:	04079663          	bnez	a5,8000699c <pop_off+0x6c>
    80006954:	07852783          	lw	a5,120(a0)
    80006958:	02f05a63          	blez	a5,8000698c <pop_off+0x5c>
    8000695c:	fff7871b          	addiw	a4,a5,-1
    80006960:	06e52c23          	sw	a4,120(a0)
    80006964:	00071c63          	bnez	a4,8000697c <pop_off+0x4c>
    80006968:	07c52783          	lw	a5,124(a0)
    8000696c:	00078863          	beqz	a5,8000697c <pop_off+0x4c>
    80006970:	100027f3          	csrr	a5,sstatus
    80006974:	0027e793          	ori	a5,a5,2
    80006978:	10079073          	csrw	sstatus,a5
    8000697c:	00813083          	ld	ra,8(sp)
    80006980:	00013403          	ld	s0,0(sp)
    80006984:	01010113          	addi	sp,sp,16
    80006988:	00008067          	ret
    8000698c:	00001517          	auipc	a0,0x1
    80006990:	cf450513          	addi	a0,a0,-780 # 80007680 <digits+0x48>
    80006994:	fffff097          	auipc	ra,0xfffff
    80006998:	018080e7          	jalr	24(ra) # 800059ac <panic>
    8000699c:	00001517          	auipc	a0,0x1
    800069a0:	ccc50513          	addi	a0,a0,-820 # 80007668 <digits+0x30>
    800069a4:	fffff097          	auipc	ra,0xfffff
    800069a8:	008080e7          	jalr	8(ra) # 800059ac <panic>

00000000800069ac <push_on>:
    800069ac:	fe010113          	addi	sp,sp,-32
    800069b0:	00813823          	sd	s0,16(sp)
    800069b4:	00113c23          	sd	ra,24(sp)
    800069b8:	00913423          	sd	s1,8(sp)
    800069bc:	02010413          	addi	s0,sp,32
    800069c0:	100024f3          	csrr	s1,sstatus
    800069c4:	100027f3          	csrr	a5,sstatus
    800069c8:	0027e793          	ori	a5,a5,2
    800069cc:	10079073          	csrw	sstatus,a5
    800069d0:	ffffe097          	auipc	ra,0xffffe
    800069d4:	620080e7          	jalr	1568(ra) # 80004ff0 <mycpu>
    800069d8:	07852783          	lw	a5,120(a0)
    800069dc:	02078663          	beqz	a5,80006a08 <push_on+0x5c>
    800069e0:	ffffe097          	auipc	ra,0xffffe
    800069e4:	610080e7          	jalr	1552(ra) # 80004ff0 <mycpu>
    800069e8:	07852783          	lw	a5,120(a0)
    800069ec:	01813083          	ld	ra,24(sp)
    800069f0:	01013403          	ld	s0,16(sp)
    800069f4:	0017879b          	addiw	a5,a5,1
    800069f8:	06f52c23          	sw	a5,120(a0)
    800069fc:	00813483          	ld	s1,8(sp)
    80006a00:	02010113          	addi	sp,sp,32
    80006a04:	00008067          	ret
    80006a08:	0014d493          	srli	s1,s1,0x1
    80006a0c:	ffffe097          	auipc	ra,0xffffe
    80006a10:	5e4080e7          	jalr	1508(ra) # 80004ff0 <mycpu>
    80006a14:	0014f493          	andi	s1,s1,1
    80006a18:	06952e23          	sw	s1,124(a0)
    80006a1c:	fc5ff06f          	j	800069e0 <push_on+0x34>

0000000080006a20 <pop_on>:
    80006a20:	ff010113          	addi	sp,sp,-16
    80006a24:	00813023          	sd	s0,0(sp)
    80006a28:	00113423          	sd	ra,8(sp)
    80006a2c:	01010413          	addi	s0,sp,16
    80006a30:	ffffe097          	auipc	ra,0xffffe
    80006a34:	5c0080e7          	jalr	1472(ra) # 80004ff0 <mycpu>
    80006a38:	100027f3          	csrr	a5,sstatus
    80006a3c:	0027f793          	andi	a5,a5,2
    80006a40:	04078463          	beqz	a5,80006a88 <pop_on+0x68>
    80006a44:	07852783          	lw	a5,120(a0)
    80006a48:	02f05863          	blez	a5,80006a78 <pop_on+0x58>
    80006a4c:	fff7879b          	addiw	a5,a5,-1
    80006a50:	06f52c23          	sw	a5,120(a0)
    80006a54:	07853783          	ld	a5,120(a0)
    80006a58:	00079863          	bnez	a5,80006a68 <pop_on+0x48>
    80006a5c:	100027f3          	csrr	a5,sstatus
    80006a60:	ffd7f793          	andi	a5,a5,-3
    80006a64:	10079073          	csrw	sstatus,a5
    80006a68:	00813083          	ld	ra,8(sp)
    80006a6c:	00013403          	ld	s0,0(sp)
    80006a70:	01010113          	addi	sp,sp,16
    80006a74:	00008067          	ret
    80006a78:	00001517          	auipc	a0,0x1
    80006a7c:	c3050513          	addi	a0,a0,-976 # 800076a8 <digits+0x70>
    80006a80:	fffff097          	auipc	ra,0xfffff
    80006a84:	f2c080e7          	jalr	-212(ra) # 800059ac <panic>
    80006a88:	00001517          	auipc	a0,0x1
    80006a8c:	c0050513          	addi	a0,a0,-1024 # 80007688 <digits+0x50>
    80006a90:	fffff097          	auipc	ra,0xfffff
    80006a94:	f1c080e7          	jalr	-228(ra) # 800059ac <panic>

0000000080006a98 <__memset>:
    80006a98:	ff010113          	addi	sp,sp,-16
    80006a9c:	00813423          	sd	s0,8(sp)
    80006aa0:	01010413          	addi	s0,sp,16
    80006aa4:	1a060e63          	beqz	a2,80006c60 <__memset+0x1c8>
    80006aa8:	40a007b3          	neg	a5,a0
    80006aac:	0077f793          	andi	a5,a5,7
    80006ab0:	00778693          	addi	a3,a5,7
    80006ab4:	00b00813          	li	a6,11
    80006ab8:	0ff5f593          	andi	a1,a1,255
    80006abc:	fff6071b          	addiw	a4,a2,-1
    80006ac0:	1b06e663          	bltu	a3,a6,80006c6c <__memset+0x1d4>
    80006ac4:	1cd76463          	bltu	a4,a3,80006c8c <__memset+0x1f4>
    80006ac8:	1a078e63          	beqz	a5,80006c84 <__memset+0x1ec>
    80006acc:	00b50023          	sb	a1,0(a0)
    80006ad0:	00100713          	li	a4,1
    80006ad4:	1ae78463          	beq	a5,a4,80006c7c <__memset+0x1e4>
    80006ad8:	00b500a3          	sb	a1,1(a0)
    80006adc:	00200713          	li	a4,2
    80006ae0:	1ae78a63          	beq	a5,a4,80006c94 <__memset+0x1fc>
    80006ae4:	00b50123          	sb	a1,2(a0)
    80006ae8:	00300713          	li	a4,3
    80006aec:	18e78463          	beq	a5,a4,80006c74 <__memset+0x1dc>
    80006af0:	00b501a3          	sb	a1,3(a0)
    80006af4:	00400713          	li	a4,4
    80006af8:	1ae78263          	beq	a5,a4,80006c9c <__memset+0x204>
    80006afc:	00b50223          	sb	a1,4(a0)
    80006b00:	00500713          	li	a4,5
    80006b04:	1ae78063          	beq	a5,a4,80006ca4 <__memset+0x20c>
    80006b08:	00b502a3          	sb	a1,5(a0)
    80006b0c:	00700713          	li	a4,7
    80006b10:	18e79e63          	bne	a5,a4,80006cac <__memset+0x214>
    80006b14:	00b50323          	sb	a1,6(a0)
    80006b18:	00700e93          	li	t4,7
    80006b1c:	00859713          	slli	a4,a1,0x8
    80006b20:	00e5e733          	or	a4,a1,a4
    80006b24:	01059e13          	slli	t3,a1,0x10
    80006b28:	01c76e33          	or	t3,a4,t3
    80006b2c:	01859313          	slli	t1,a1,0x18
    80006b30:	006e6333          	or	t1,t3,t1
    80006b34:	02059893          	slli	a7,a1,0x20
    80006b38:	40f60e3b          	subw	t3,a2,a5
    80006b3c:	011368b3          	or	a7,t1,a7
    80006b40:	02859813          	slli	a6,a1,0x28
    80006b44:	0108e833          	or	a6,a7,a6
    80006b48:	03059693          	slli	a3,a1,0x30
    80006b4c:	003e589b          	srliw	a7,t3,0x3
    80006b50:	00d866b3          	or	a3,a6,a3
    80006b54:	03859713          	slli	a4,a1,0x38
    80006b58:	00389813          	slli	a6,a7,0x3
    80006b5c:	00f507b3          	add	a5,a0,a5
    80006b60:	00e6e733          	or	a4,a3,a4
    80006b64:	000e089b          	sext.w	a7,t3
    80006b68:	00f806b3          	add	a3,a6,a5
    80006b6c:	00e7b023          	sd	a4,0(a5)
    80006b70:	00878793          	addi	a5,a5,8
    80006b74:	fed79ce3          	bne	a5,a3,80006b6c <__memset+0xd4>
    80006b78:	ff8e7793          	andi	a5,t3,-8
    80006b7c:	0007871b          	sext.w	a4,a5
    80006b80:	01d787bb          	addw	a5,a5,t4
    80006b84:	0ce88e63          	beq	a7,a4,80006c60 <__memset+0x1c8>
    80006b88:	00f50733          	add	a4,a0,a5
    80006b8c:	00b70023          	sb	a1,0(a4)
    80006b90:	0017871b          	addiw	a4,a5,1
    80006b94:	0cc77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006b98:	00e50733          	add	a4,a0,a4
    80006b9c:	00b70023          	sb	a1,0(a4)
    80006ba0:	0027871b          	addiw	a4,a5,2
    80006ba4:	0ac77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006ba8:	00e50733          	add	a4,a0,a4
    80006bac:	00b70023          	sb	a1,0(a4)
    80006bb0:	0037871b          	addiw	a4,a5,3
    80006bb4:	0ac77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006bb8:	00e50733          	add	a4,a0,a4
    80006bbc:	00b70023          	sb	a1,0(a4)
    80006bc0:	0047871b          	addiw	a4,a5,4
    80006bc4:	08c77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006bc8:	00e50733          	add	a4,a0,a4
    80006bcc:	00b70023          	sb	a1,0(a4)
    80006bd0:	0057871b          	addiw	a4,a5,5
    80006bd4:	08c77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006bd8:	00e50733          	add	a4,a0,a4
    80006bdc:	00b70023          	sb	a1,0(a4)
    80006be0:	0067871b          	addiw	a4,a5,6
    80006be4:	06c77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006be8:	00e50733          	add	a4,a0,a4
    80006bec:	00b70023          	sb	a1,0(a4)
    80006bf0:	0077871b          	addiw	a4,a5,7
    80006bf4:	06c77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006bf8:	00e50733          	add	a4,a0,a4
    80006bfc:	00b70023          	sb	a1,0(a4)
    80006c00:	0087871b          	addiw	a4,a5,8
    80006c04:	04c77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006c08:	00e50733          	add	a4,a0,a4
    80006c0c:	00b70023          	sb	a1,0(a4)
    80006c10:	0097871b          	addiw	a4,a5,9
    80006c14:	04c77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006c18:	00e50733          	add	a4,a0,a4
    80006c1c:	00b70023          	sb	a1,0(a4)
    80006c20:	00a7871b          	addiw	a4,a5,10
    80006c24:	02c77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006c28:	00e50733          	add	a4,a0,a4
    80006c2c:	00b70023          	sb	a1,0(a4)
    80006c30:	00b7871b          	addiw	a4,a5,11
    80006c34:	02c77663          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006c38:	00e50733          	add	a4,a0,a4
    80006c3c:	00b70023          	sb	a1,0(a4)
    80006c40:	00c7871b          	addiw	a4,a5,12
    80006c44:	00c77e63          	bgeu	a4,a2,80006c60 <__memset+0x1c8>
    80006c48:	00e50733          	add	a4,a0,a4
    80006c4c:	00b70023          	sb	a1,0(a4)
    80006c50:	00d7879b          	addiw	a5,a5,13
    80006c54:	00c7f663          	bgeu	a5,a2,80006c60 <__memset+0x1c8>
    80006c58:	00f507b3          	add	a5,a0,a5
    80006c5c:	00b78023          	sb	a1,0(a5)
    80006c60:	00813403          	ld	s0,8(sp)
    80006c64:	01010113          	addi	sp,sp,16
    80006c68:	00008067          	ret
    80006c6c:	00b00693          	li	a3,11
    80006c70:	e55ff06f          	j	80006ac4 <__memset+0x2c>
    80006c74:	00300e93          	li	t4,3
    80006c78:	ea5ff06f          	j	80006b1c <__memset+0x84>
    80006c7c:	00100e93          	li	t4,1
    80006c80:	e9dff06f          	j	80006b1c <__memset+0x84>
    80006c84:	00000e93          	li	t4,0
    80006c88:	e95ff06f          	j	80006b1c <__memset+0x84>
    80006c8c:	00000793          	li	a5,0
    80006c90:	ef9ff06f          	j	80006b88 <__memset+0xf0>
    80006c94:	00200e93          	li	t4,2
    80006c98:	e85ff06f          	j	80006b1c <__memset+0x84>
    80006c9c:	00400e93          	li	t4,4
    80006ca0:	e7dff06f          	j	80006b1c <__memset+0x84>
    80006ca4:	00500e93          	li	t4,5
    80006ca8:	e75ff06f          	j	80006b1c <__memset+0x84>
    80006cac:	00600e93          	li	t4,6
    80006cb0:	e6dff06f          	j	80006b1c <__memset+0x84>

0000000080006cb4 <__memmove>:
    80006cb4:	ff010113          	addi	sp,sp,-16
    80006cb8:	00813423          	sd	s0,8(sp)
    80006cbc:	01010413          	addi	s0,sp,16
    80006cc0:	0e060863          	beqz	a2,80006db0 <__memmove+0xfc>
    80006cc4:	fff6069b          	addiw	a3,a2,-1
    80006cc8:	0006881b          	sext.w	a6,a3
    80006ccc:	0ea5e863          	bltu	a1,a0,80006dbc <__memmove+0x108>
    80006cd0:	00758713          	addi	a4,a1,7
    80006cd4:	00a5e7b3          	or	a5,a1,a0
    80006cd8:	40a70733          	sub	a4,a4,a0
    80006cdc:	0077f793          	andi	a5,a5,7
    80006ce0:	00f73713          	sltiu	a4,a4,15
    80006ce4:	00174713          	xori	a4,a4,1
    80006ce8:	0017b793          	seqz	a5,a5
    80006cec:	00e7f7b3          	and	a5,a5,a4
    80006cf0:	10078863          	beqz	a5,80006e00 <__memmove+0x14c>
    80006cf4:	00900793          	li	a5,9
    80006cf8:	1107f463          	bgeu	a5,a6,80006e00 <__memmove+0x14c>
    80006cfc:	0036581b          	srliw	a6,a2,0x3
    80006d00:	fff8081b          	addiw	a6,a6,-1
    80006d04:	02081813          	slli	a6,a6,0x20
    80006d08:	01d85893          	srli	a7,a6,0x1d
    80006d0c:	00858813          	addi	a6,a1,8
    80006d10:	00058793          	mv	a5,a1
    80006d14:	00050713          	mv	a4,a0
    80006d18:	01088833          	add	a6,a7,a6
    80006d1c:	0007b883          	ld	a7,0(a5)
    80006d20:	00878793          	addi	a5,a5,8
    80006d24:	00870713          	addi	a4,a4,8
    80006d28:	ff173c23          	sd	a7,-8(a4)
    80006d2c:	ff0798e3          	bne	a5,a6,80006d1c <__memmove+0x68>
    80006d30:	ff867713          	andi	a4,a2,-8
    80006d34:	02071793          	slli	a5,a4,0x20
    80006d38:	0207d793          	srli	a5,a5,0x20
    80006d3c:	00f585b3          	add	a1,a1,a5
    80006d40:	40e686bb          	subw	a3,a3,a4
    80006d44:	00f507b3          	add	a5,a0,a5
    80006d48:	06e60463          	beq	a2,a4,80006db0 <__memmove+0xfc>
    80006d4c:	0005c703          	lbu	a4,0(a1)
    80006d50:	00e78023          	sb	a4,0(a5)
    80006d54:	04068e63          	beqz	a3,80006db0 <__memmove+0xfc>
    80006d58:	0015c603          	lbu	a2,1(a1)
    80006d5c:	00100713          	li	a4,1
    80006d60:	00c780a3          	sb	a2,1(a5)
    80006d64:	04e68663          	beq	a3,a4,80006db0 <__memmove+0xfc>
    80006d68:	0025c603          	lbu	a2,2(a1)
    80006d6c:	00200713          	li	a4,2
    80006d70:	00c78123          	sb	a2,2(a5)
    80006d74:	02e68e63          	beq	a3,a4,80006db0 <__memmove+0xfc>
    80006d78:	0035c603          	lbu	a2,3(a1)
    80006d7c:	00300713          	li	a4,3
    80006d80:	00c781a3          	sb	a2,3(a5)
    80006d84:	02e68663          	beq	a3,a4,80006db0 <__memmove+0xfc>
    80006d88:	0045c603          	lbu	a2,4(a1)
    80006d8c:	00400713          	li	a4,4
    80006d90:	00c78223          	sb	a2,4(a5)
    80006d94:	00e68e63          	beq	a3,a4,80006db0 <__memmove+0xfc>
    80006d98:	0055c603          	lbu	a2,5(a1)
    80006d9c:	00500713          	li	a4,5
    80006da0:	00c782a3          	sb	a2,5(a5)
    80006da4:	00e68663          	beq	a3,a4,80006db0 <__memmove+0xfc>
    80006da8:	0065c703          	lbu	a4,6(a1)
    80006dac:	00e78323          	sb	a4,6(a5)
    80006db0:	00813403          	ld	s0,8(sp)
    80006db4:	01010113          	addi	sp,sp,16
    80006db8:	00008067          	ret
    80006dbc:	02061713          	slli	a4,a2,0x20
    80006dc0:	02075713          	srli	a4,a4,0x20
    80006dc4:	00e587b3          	add	a5,a1,a4
    80006dc8:	f0f574e3          	bgeu	a0,a5,80006cd0 <__memmove+0x1c>
    80006dcc:	02069613          	slli	a2,a3,0x20
    80006dd0:	02065613          	srli	a2,a2,0x20
    80006dd4:	fff64613          	not	a2,a2
    80006dd8:	00e50733          	add	a4,a0,a4
    80006ddc:	00c78633          	add	a2,a5,a2
    80006de0:	fff7c683          	lbu	a3,-1(a5)
    80006de4:	fff78793          	addi	a5,a5,-1
    80006de8:	fff70713          	addi	a4,a4,-1
    80006dec:	00d70023          	sb	a3,0(a4)
    80006df0:	fec798e3          	bne	a5,a2,80006de0 <__memmove+0x12c>
    80006df4:	00813403          	ld	s0,8(sp)
    80006df8:	01010113          	addi	sp,sp,16
    80006dfc:	00008067          	ret
    80006e00:	02069713          	slli	a4,a3,0x20
    80006e04:	02075713          	srli	a4,a4,0x20
    80006e08:	00170713          	addi	a4,a4,1
    80006e0c:	00e50733          	add	a4,a0,a4
    80006e10:	00050793          	mv	a5,a0
    80006e14:	0005c683          	lbu	a3,0(a1)
    80006e18:	00178793          	addi	a5,a5,1
    80006e1c:	00158593          	addi	a1,a1,1
    80006e20:	fed78fa3          	sb	a3,-1(a5)
    80006e24:	fee798e3          	bne	a5,a4,80006e14 <__memmove+0x160>
    80006e28:	f89ff06f          	j	80006db0 <__memmove+0xfc>

0000000080006e2c <__putc>:
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00813823          	sd	s0,16(sp)
    80006e34:	00113c23          	sd	ra,24(sp)
    80006e38:	02010413          	addi	s0,sp,32
    80006e3c:	00050793          	mv	a5,a0
    80006e40:	fef40593          	addi	a1,s0,-17
    80006e44:	00100613          	li	a2,1
    80006e48:	00000513          	li	a0,0
    80006e4c:	fef407a3          	sb	a5,-17(s0)
    80006e50:	fffff097          	auipc	ra,0xfffff
    80006e54:	b3c080e7          	jalr	-1220(ra) # 8000598c <console_write>
    80006e58:	01813083          	ld	ra,24(sp)
    80006e5c:	01013403          	ld	s0,16(sp)
    80006e60:	02010113          	addi	sp,sp,32
    80006e64:	00008067          	ret

0000000080006e68 <__getc>:
    80006e68:	fe010113          	addi	sp,sp,-32
    80006e6c:	00813823          	sd	s0,16(sp)
    80006e70:	00113c23          	sd	ra,24(sp)
    80006e74:	02010413          	addi	s0,sp,32
    80006e78:	fe840593          	addi	a1,s0,-24
    80006e7c:	00100613          	li	a2,1
    80006e80:	00000513          	li	a0,0
    80006e84:	fffff097          	auipc	ra,0xfffff
    80006e88:	ae8080e7          	jalr	-1304(ra) # 8000596c <console_read>
    80006e8c:	fe844503          	lbu	a0,-24(s0)
    80006e90:	01813083          	ld	ra,24(sp)
    80006e94:	01013403          	ld	s0,16(sp)
    80006e98:	02010113          	addi	sp,sp,32
    80006e9c:	00008067          	ret

0000000080006ea0 <console_handler>:
    80006ea0:	fe010113          	addi	sp,sp,-32
    80006ea4:	00813823          	sd	s0,16(sp)
    80006ea8:	00113c23          	sd	ra,24(sp)
    80006eac:	00913423          	sd	s1,8(sp)
    80006eb0:	02010413          	addi	s0,sp,32
    80006eb4:	14202773          	csrr	a4,scause
    80006eb8:	100027f3          	csrr	a5,sstatus
    80006ebc:	0027f793          	andi	a5,a5,2
    80006ec0:	06079e63          	bnez	a5,80006f3c <console_handler+0x9c>
    80006ec4:	00074c63          	bltz	a4,80006edc <console_handler+0x3c>
    80006ec8:	01813083          	ld	ra,24(sp)
    80006ecc:	01013403          	ld	s0,16(sp)
    80006ed0:	00813483          	ld	s1,8(sp)
    80006ed4:	02010113          	addi	sp,sp,32
    80006ed8:	00008067          	ret
    80006edc:	0ff77713          	andi	a4,a4,255
    80006ee0:	00900793          	li	a5,9
    80006ee4:	fef712e3          	bne	a4,a5,80006ec8 <console_handler+0x28>
    80006ee8:	ffffe097          	auipc	ra,0xffffe
    80006eec:	6dc080e7          	jalr	1756(ra) # 800055c4 <plic_claim>
    80006ef0:	00a00793          	li	a5,10
    80006ef4:	00050493          	mv	s1,a0
    80006ef8:	02f50c63          	beq	a0,a5,80006f30 <console_handler+0x90>
    80006efc:	fc0506e3          	beqz	a0,80006ec8 <console_handler+0x28>
    80006f00:	00050593          	mv	a1,a0
    80006f04:	00000517          	auipc	a0,0x0
    80006f08:	6ac50513          	addi	a0,a0,1708 # 800075b0 <_ZTV14PeriodicThread+0x120>
    80006f0c:	fffff097          	auipc	ra,0xfffff
    80006f10:	afc080e7          	jalr	-1284(ra) # 80005a08 <__printf>
    80006f14:	01013403          	ld	s0,16(sp)
    80006f18:	01813083          	ld	ra,24(sp)
    80006f1c:	00048513          	mv	a0,s1
    80006f20:	00813483          	ld	s1,8(sp)
    80006f24:	02010113          	addi	sp,sp,32
    80006f28:	ffffe317          	auipc	t1,0xffffe
    80006f2c:	6d430067          	jr	1748(t1) # 800055fc <plic_complete>
    80006f30:	fffff097          	auipc	ra,0xfffff
    80006f34:	3e0080e7          	jalr	992(ra) # 80006310 <uartintr>
    80006f38:	fddff06f          	j	80006f14 <console_handler+0x74>
    80006f3c:	00000517          	auipc	a0,0x0
    80006f40:	77450513          	addi	a0,a0,1908 # 800076b0 <digits+0x78>
    80006f44:	fffff097          	auipc	ra,0xfffff
    80006f48:	a68080e7          	jalr	-1432(ra) # 800059ac <panic>
	...
