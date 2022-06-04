
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	58013103          	ld	sp,1408(sp) # 80007580 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	315030ef          	jal	ra,80003b30 <start>

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
    80001080:	0e9000ef          	jal	ra,80001968 <interrupt>

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

0000000080001238 <_Z8userMainv>:
//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
//#include"../test/testing.hpp"
//#include"../h/syscall_c.h"
//#include"../test/printing.hpp"
void userMain() {
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00813423          	sd	s0,8(sp)
    80001240:	01010413          	addi	s0,sp,16
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
    80001244:	00813403          	ld	s0,8(sp)
    80001248:	01010113          	addi	sp,sp,16
    8000124c:	00008067          	ret

0000000080001250 <_Z13timer_handlerv>:
    IW = 7,

};

void timer_handler()
{
    80001250:	fd010113          	addi	sp,sp,-48
    80001254:	02113423          	sd	ra,40(sp)
    80001258:	02813023          	sd	s0,32(sp)
    8000125c:	00913c23          	sd	s1,24(sp)
    80001260:	01213823          	sd	s2,16(sp)
    80001264:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80001268:	00001097          	auipc	ra,0x1
    8000126c:	724080e7          	jalr	1828(ra) # 8000298c <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80001270:	00006717          	auipc	a4,0x6
    80001274:	3f070713          	addi	a4,a4,1008 # 80007660 <_ZN3TCB16timeSliceCounterE>
    80001278:	00073783          	ld	a5,0(a4)
    8000127c:	00178793          	addi	a5,a5,1
    80001280:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80001284:	00006717          	auipc	a4,0x6
    80001288:	3e470713          	addi	a4,a4,996 # 80007668 <_ZN3TCB7runningE>
    8000128c:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80001290:	02873703          	ld	a4,40(a4)
    80001294:	02e7f263          	bgeu	a5,a4,800012b8 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001298:	00200793          	li	a5,2
    8000129c:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    800012a0:	02813083          	ld	ra,40(sp)
    800012a4:	02013403          	ld	s0,32(sp)
    800012a8:	01813483          	ld	s1,24(sp)
    800012ac:	01013903          	ld	s2,16(sp)
    800012b0:	03010113          	addi	sp,sp,48
    800012b4:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800012b8:	100027f3          	csrr	a5,sstatus
    800012bc:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800012c0:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800012c4:	141027f3          	csrr	a5,sepc
    800012c8:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    800012cc:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    800012d0:	00006797          	auipc	a5,0x6
    800012d4:	3807b823          	sd	zero,912(a5) # 80007660 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800012d8:	00002097          	auipc	ra,0x2
    800012dc:	76c080e7          	jalr	1900(ra) # 80003a44 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800012e0:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800012e4:	14149073          	csrw	sepc,s1
    800012e8:	fb1ff06f          	j	80001298 <_Z13timer_handlerv+0x48>

00000000800012ec <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800012ec:	fb010113          	addi	sp,sp,-80
    800012f0:	04113423          	sd	ra,72(sp)
    800012f4:	04813023          	sd	s0,64(sp)
    800012f8:	02913c23          	sd	s1,56(sp)
    800012fc:	03213823          	sd	s2,48(sp)
    80001300:	03313423          	sd	s3,40(sp)
    80001304:	03413023          	sd	s4,32(sp)
    80001308:	01513c23          	sd	s5,24(sp)
    8000130c:	01613823          	sd	s6,16(sp)
    80001310:	05010413          	addi	s0,sp,80
    80001314:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001318:	141027f3          	csrr	a5,sepc
    8000131c:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001320:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001324:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001328:	100027f3          	csrr	a5,sstatus
    8000132c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001330:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    80001334:	00100793          	li	a5,1
    80001338:	0ef50663          	beq	a0,a5,80001424 <_Z8usrEcallmmmmm+0x138>
    8000133c:	00050493          	mv	s1,a0
    80001340:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    80001344:	00200793          	li	a5,2
    80001348:	12f50063          	beq	a0,a5,80001468 <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    8000134c:	01100793          	li	a5,17
    80001350:	12f50863          	beq	a0,a5,80001480 <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001354:	01200793          	li	a5,18
    80001358:	14f50a63          	beq	a0,a5,800014ac <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    8000135c:	01300793          	li	a5,19
    80001360:	16f50863          	beq	a0,a5,800014d0 <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    80001364:	06900793          	li	a5,105
    80001368:	18f50063          	beq	a0,a5,800014e8 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    8000136c:	02100793          	li	a5,33
    80001370:	18f50663          	beq	a0,a5,800014fc <_Z8usrEcallmmmmm+0x210>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    80001374:	02200793          	li	a5,34
    80001378:	1cf50463          	beq	a0,a5,80001540 <_Z8usrEcallmmmmm+0x254>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    8000137c:	02300793          	li	a5,35
    80001380:	1cf50863          	beq	a0,a5,80001550 <_Z8usrEcallmmmmm+0x264>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    80001384:	02400793          	li	a5,36
    80001388:	1ef50863          	beq	a0,a5,80001578 <_Z8usrEcallmmmmm+0x28c>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    8000138c:	03100793          	li	a5,49
    80001390:	20f50863          	beq	a0,a5,800015a0 <_Z8usrEcallmmmmm+0x2b4>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    80001394:	04100793          	li	a5,65
    80001398:	20f50e63          	beq	a0,a5,800015b4 <_Z8usrEcallmmmmm+0x2c8>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    8000139c:	04200793          	li	a5,66
    800013a0:	08f51c63          	bne	a0,a5,80001438 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    800013a4:	00006797          	auipc	a5,0x6
    800013a8:	28478793          	addi	a5,a5,644 # 80007628 <_ZN5StdIO7obufferE>
    800013ac:	0007ba83          	ld	s5,0(a5)
    800013b0:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    800013b4:	450a8513          	addi	a0,s5,1104
    800013b8:	00001097          	auipc	ra,0x1
    800013bc:	ae8080e7          	jalr	-1304(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800013c0:	400a8b13          	addi	s6,s5,1024
    800013c4:	000b0513          	mv	a0,s6
    800013c8:	00001097          	auipc	ra,0x1
    800013cc:	ad8080e7          	jalr	-1320(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    800013d0:	480aa783          	lw	a5,1152(s5)
    800013d4:	0017879b          	addiw	a5,a5,1
    800013d8:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    800013dc:	47caa783          	lw	a5,1148(s5)
    800013e0:	00fa8733          	add	a4,s5,a5
    800013e4:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    800013e8:	0017879b          	addiw	a5,a5,1
    800013ec:	41f7d71b          	sraiw	a4,a5,0x1f
    800013f0:	0167571b          	srliw	a4,a4,0x16
    800013f4:	00e787bb          	addw	a5,a5,a4
    800013f8:	3ff7f793          	andi	a5,a5,1023
    800013fc:	40e787bb          	subw	a5,a5,a4
    80001400:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    80001404:	428a8513          	addi	a0,s5,1064
    80001408:	00001097          	auipc	ra,0x1
    8000140c:	b1c080e7          	jalr	-1252(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001410:	000b0513          	mv	a0,s6
    80001414:	00001097          	auipc	ra,0x1
    80001418:	b10080e7          	jalr	-1264(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000141c:	00048513          	mv	a0,s1
    80001420:	0180006f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80001424:	00001097          	auipc	ra,0x1
    80001428:	c84080e7          	jalr	-892(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    8000142c:	000a0593          	mv	a1,s4
    80001430:	00001097          	auipc	ra,0x1
    80001434:	cec080e7          	jalr	-788(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001438:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    8000143c:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80001440:	04813083          	ld	ra,72(sp)
    80001444:	04013403          	ld	s0,64(sp)
    80001448:	03813483          	ld	s1,56(sp)
    8000144c:	03013903          	ld	s2,48(sp)
    80001450:	02813983          	ld	s3,40(sp)
    80001454:	02013a03          	ld	s4,32(sp)
    80001458:	01813a83          	ld	s5,24(sp)
    8000145c:	01013b03          	ld	s6,16(sp)
    80001460:	05010113          	addi	sp,sp,80
    80001464:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001468:	00001097          	auipc	ra,0x1
    8000146c:	c40080e7          	jalr	-960(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80001470:	000a0593          	mv	a1,s4
    80001474:	00001097          	auipc	ra,0x1
    80001478:	e64080e7          	jalr	-412(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    8000147c:	fbdff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001480:	00070613          	mv	a2,a4
    80001484:	00068593          	mv	a1,a3
    80001488:	000a8513          	mv	a0,s5
    8000148c:	00002097          	auipc	ra,0x2
    80001490:	204080e7          	jalr	516(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001494:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80001498:	00050663          	beqz	a0,800014a4 <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    8000149c:	00000513          	li	a0,0
    800014a0:	f99ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    800014a4:	ffc00513          	li	a0,-4
    800014a8:	f91ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    800014ac:	00006797          	auipc	a5,0x6
    800014b0:	1bc78793          	addi	a5,a5,444 # 80007668 <_ZN3TCB7runningE>
    800014b4:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800014b8:	00200713          	li	a4,2
    800014bc:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    800014c0:	00002097          	auipc	ra,0x2
    800014c4:	48c080e7          	jalr	1164(ra) # 8000394c <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014c8:	00048513          	mv	a0,s1
    800014cc:	f6dff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    800014d0:	00006797          	auipc	a5,0x6
    800014d4:	1807b823          	sd	zero,400(a5) # 80007660 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800014d8:	00002097          	auipc	ra,0x2
    800014dc:	56c080e7          	jalr	1388(ra) # 80003a44 <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014e0:	00048513          	mv	a0,s1
    800014e4:	f55ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    800014e8:	00058513          	mv	a0,a1
    800014ec:	00002097          	auipc	ra,0x2
    800014f0:	2f8080e7          	jalr	760(ra) # 800037e4 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014f4:	00048513          	mv	a0,s1
    800014f8:	f41ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800014fc:	00001097          	auipc	ra,0x1
    80001500:	bac080e7          	jalr	-1108(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80001504:	00100593          	li	a1,1
    80001508:	00001097          	auipc	ra,0x1
    8000150c:	c14080e7          	jalr	-1004(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    80001510:	01552423          	sw	s5,8(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80001514:	00053823          	sd	zero,16(a0)
    80001518:	00053c23          	sd	zero,24(a0)
    8000151c:	02052023          	sw	zero,32(a0)
    {
        next = activeSemaphores;
    80001520:	00006797          	auipc	a5,0x6
    80001524:	0f078793          	addi	a5,a5,240 # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    80001528:	0007b703          	ld	a4,0(a5)
    8000152c:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80001530:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    80001534:	00aa3023          	sd	a0,0(s4)
        else ret = 0;
    80001538:	00000513          	li	a0,0
    8000153c:	efdff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        ret = KSemaphore::close(t);
    80001540:	00058513          	mv	a0,a1
    80001544:	00001097          	auipc	ra,0x1
    80001548:	a88080e7          	jalr	-1400(ra) # 80001fcc <_ZN10KSemaphore5closeEPS_>
    8000154c:	eedff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80001550:	00058513          	mv	a0,a1
    80001554:	00001097          	auipc	ra,0x1
    80001558:	b14080e7          	jalr	-1260(ra) # 80002068 <_ZN10KSemaphore6existsEPS_>
    8000155c:	00051663          	bnez	a0,80001568 <_Z8usrEcallmmmmm+0x27c>
            ret = -1;
    80001560:	fff00513          	li	a0,-1
    80001564:	ed5ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    80001568:	000a0513          	mv	a0,s4
    8000156c:	00001097          	auipc	ra,0x1
    80001570:	934080e7          	jalr	-1740(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
    80001574:	ec5ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80001578:	00058513          	mv	a0,a1
    8000157c:	00001097          	auipc	ra,0x1
    80001580:	aec080e7          	jalr	-1300(ra) # 80002068 <_ZN10KSemaphore6existsEPS_>
    80001584:	00051663          	bnez	a0,80001590 <_Z8usrEcallmmmmm+0x2a4>
            ret = -1;
    80001588:	fff00513          	li	a0,-1
    8000158c:	eadff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    80001590:	000a0513          	mv	a0,s4
    80001594:	00001097          	auipc	ra,0x1
    80001598:	990080e7          	jalr	-1648(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    8000159c:	e9dff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    800015a0:	00058513          	mv	a0,a1
    800015a4:	00002097          	auipc	ra,0x2
    800015a8:	4d8080e7          	jalr	1240(ra) # 80003a7c <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800015ac:	00048513          	mv	a0,s1
    800015b0:	e89ff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    800015b4:	00006797          	auipc	a5,0x6
    800015b8:	07c78793          	addi	a5,a5,124 # 80007630 <_ZN5StdIO7ibufferE>
    800015bc:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    800015c0:	428a0513          	addi	a0,s4,1064
    800015c4:	00001097          	auipc	ra,0x1
    800015c8:	8dc080e7          	jalr	-1828(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800015cc:	400a0a93          	addi	s5,s4,1024
    800015d0:	000a8513          	mv	a0,s5
    800015d4:	00001097          	auipc	ra,0x1
    800015d8:	8cc080e7          	jalr	-1844(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    800015dc:	480a2783          	lw	a5,1152(s4)
    800015e0:	fff7879b          	addiw	a5,a5,-1
    800015e4:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    800015e8:	478a2783          	lw	a5,1144(s4)
    800015ec:	00fa0733          	add	a4,s4,a5
    800015f0:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    800015f4:	0017879b          	addiw	a5,a5,1
    800015f8:	41f7d71b          	sraiw	a4,a5,0x1f
    800015fc:	0167571b          	srliw	a4,a4,0x16
    80001600:	00e787bb          	addw	a5,a5,a4
    80001604:	3ff7f793          	andi	a5,a5,1023
    80001608:	40e787bb          	subw	a5,a5,a4
    8000160c:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    80001610:	450a0513          	addi	a0,s4,1104
    80001614:	00001097          	auipc	ra,0x1
    80001618:	910080e7          	jalr	-1776(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000161c:	000a8513          	mv	a0,s5
    80001620:	00001097          	auipc	ra,0x1
    80001624:	904080e7          	jalr	-1788(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    80001628:	00048513          	mv	a0,s1
    8000162c:	e0dff06f          	j	80001438 <_Z8usrEcallmmmmm+0x14c>

0000000080001630 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80001630:	fb010113          	addi	sp,sp,-80
    80001634:	04113423          	sd	ra,72(sp)
    80001638:	04813023          	sd	s0,64(sp)
    8000163c:	02913c23          	sd	s1,56(sp)
    80001640:	03213823          	sd	s2,48(sp)
    80001644:	03313423          	sd	s3,40(sp)
    80001648:	03413023          	sd	s4,32(sp)
    8000164c:	01513c23          	sd	s5,24(sp)
    80001650:	05010413          	addi	s0,sp,80
    80001654:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001658:	141027f3          	csrr	a5,sepc
    8000165c:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001660:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001664:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001668:	100027f3          	csrr	a5,sstatus
    8000166c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001670:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    80001674:	00100793          	li	a5,1
    80001678:	0ef50663          	beq	a0,a5,80001764 <_Z8sysEcallmmmmm+0x134>
    8000167c:	00050493          	mv	s1,a0
    80001680:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    80001684:	00200793          	li	a5,2
    80001688:	10f50c63          	beq	a0,a5,800017a0 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    8000168c:	01100793          	li	a5,17
    80001690:	12f50463          	beq	a0,a5,800017b8 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    80001694:	01200793          	li	a5,18
    80001698:	14f50663          	beq	a0,a5,800017e4 <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    8000169c:	01300793          	li	a5,19
    800016a0:	16f50663          	beq	a0,a5,8000180c <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    800016a4:	06900793          	li	a5,105
    800016a8:	18f50063          	beq	a0,a5,80001828 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    800016ac:	02100793          	li	a5,33
    800016b0:	18f50663          	beq	a0,a5,8000183c <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    800016b4:	02200793          	li	a5,34
    800016b8:	1cf50463          	beq	a0,a5,80001880 <_Z8sysEcallmmmmm+0x250>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    800016bc:	02300793          	li	a5,35
    800016c0:	1ef50663          	beq	a0,a5,800018ac <_Z8sysEcallmmmmm+0x27c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    800016c4:	02400793          	li	a5,36
    800016c8:	1ef50c63          	beq	a0,a5,800018c0 <_Z8sysEcallmmmmm+0x290>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    800016cc:	03100793          	li	a5,49
    800016d0:	20f50263          	beq	a0,a5,800018d4 <_Z8sysEcallmmmmm+0x2a4>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    800016d4:	04100793          	li	a5,65
    800016d8:	20f50a63          	beq	a0,a5,800018ec <_Z8sysEcallmmmmm+0x2bc>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800016dc:	04200793          	li	a5,66
    800016e0:	08f51c63          	bne	a0,a5,80001778 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    800016e4:	00006797          	auipc	a5,0x6
    800016e8:	f4478793          	addi	a5,a5,-188 # 80007628 <_ZN5StdIO7obufferE>
    800016ec:	0007ba03          	ld	s4,0(a5)
    800016f0:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    800016f4:	450a0513          	addi	a0,s4,1104
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	7a8080e7          	jalr	1960(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001700:	400a0a93          	addi	s5,s4,1024
    80001704:	000a8513          	mv	a0,s5
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	798080e7          	jalr	1944(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80001710:	480a2783          	lw	a5,1152(s4)
    80001714:	0017879b          	addiw	a5,a5,1
    80001718:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    8000171c:	47ca2783          	lw	a5,1148(s4)
    80001720:	00fa0733          	add	a4,s4,a5
    80001724:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001728:	0017879b          	addiw	a5,a5,1
    8000172c:	41f7d71b          	sraiw	a4,a5,0x1f
    80001730:	0167571b          	srliw	a4,a4,0x16
    80001734:	00e787bb          	addw	a5,a5,a4
    80001738:	3ff7f793          	andi	a5,a5,1023
    8000173c:	40e787bb          	subw	a5,a5,a4
    80001740:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    80001744:	428a0513          	addi	a0,s4,1064
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	7dc080e7          	jalr	2012(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001750:	000a8513          	mv	a0,s5
    80001754:	00000097          	auipc	ra,0x0
    80001758:	7d0080e7          	jalr	2000(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000175c:	00048513          	mv	a0,s1
    80001760:	0180006f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    80001764:	00001097          	auipc	ra,0x1
    80001768:	944080e7          	jalr	-1724(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    8000176c:	00098593          	mv	a1,s3
    80001770:	00001097          	auipc	ra,0x1
    80001774:	9ac080e7          	jalr	-1620(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001778:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    8000177c:	04813083          	ld	ra,72(sp)
    80001780:	04013403          	ld	s0,64(sp)
    80001784:	03813483          	ld	s1,56(sp)
    80001788:	03013903          	ld	s2,48(sp)
    8000178c:	02813983          	ld	s3,40(sp)
    80001790:	02013a03          	ld	s4,32(sp)
    80001794:	01813a83          	ld	s5,24(sp)
    80001798:	05010113          	addi	sp,sp,80
    8000179c:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	908080e7          	jalr	-1784(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    800017a8:	00098593          	mv	a1,s3
    800017ac:	00001097          	auipc	ra,0x1
    800017b0:	b2c080e7          	jalr	-1236(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    800017b4:	fc5ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800017b8:	00070613          	mv	a2,a4
    800017bc:	00068593          	mv	a1,a3
    800017c0:	000a8513          	mv	a0,s5
    800017c4:	00002097          	auipc	ra,0x2
    800017c8:	ecc080e7          	jalr	-308(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800017cc:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    800017d0:	00050663          	beqz	a0,800017dc <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    800017d4:	00000513          	li	a0,0
    800017d8:	fa1ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    800017dc:	ffc00513          	li	a0,-4
    800017e0:	f99ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    800017e4:	00006797          	auipc	a5,0x6
    800017e8:	e8478793          	addi	a5,a5,-380 # 80007668 <_ZN3TCB7runningE>
    800017ec:	0007b783          	ld	a5,0(a5)
    800017f0:	00200713          	li	a4,2
    800017f4:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    800017f8:	00002097          	auipc	ra,0x2
    800017fc:	154080e7          	jalr	340(ra) # 8000394c <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001800:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001804:	00048513          	mv	a0,s1
    80001808:	f71ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    8000180c:	00006797          	auipc	a5,0x6
    80001810:	e407ba23          	sd	zero,-428(a5) # 80007660 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    80001814:	00002097          	auipc	ra,0x2
    80001818:	230080e7          	jalr	560(ra) # 80003a44 <_ZN3TCB5yieldEv>
    8000181c:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001820:	00048513          	mv	a0,s1
    80001824:	f55ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80001828:	00058513          	mv	a0,a1
    8000182c:	00002097          	auipc	ra,0x2
    80001830:	fb8080e7          	jalr	-72(ra) # 800037e4 <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001834:	00048513          	mv	a0,s1
    80001838:	f41ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	86c080e7          	jalr	-1940(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80001844:	00100593          	li	a1,1
    80001848:	00001097          	auipc	ra,0x1
    8000184c:	8d4080e7          	jalr	-1836(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80001850:	01552423          	sw	s5,8(a0)
    80001854:	00053823          	sd	zero,16(a0)
    80001858:	00053c23          	sd	zero,24(a0)
    8000185c:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80001860:	00006797          	auipc	a5,0x6
    80001864:	db078793          	addi	a5,a5,-592 # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    80001868:	0007b703          	ld	a4,0(a5)
    8000186c:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80001870:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    80001874:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001878:	00048513          	mv	a0,s1
    8000187c:	efdff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        delete t;
    80001880:	ee058ce3          	beqz	a1,80001778 <_Z8sysEcallmmmmm+0x148>
    80001884:	00058513          	mv	a0,a1
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	6f0080e7          	jalr	1776(ra) # 80001f78 <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001890:	00001097          	auipc	ra,0x1
    80001894:	818080e7          	jalr	-2024(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80001898:	00098593          	mv	a1,s3
    8000189c:	00001097          	auipc	ra,0x1
    800018a0:	a3c080e7          	jalr	-1476(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800018a4:	00048513          	mv	a0,s1
    800018a8:	ed1ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    800018ac:	00058513          	mv	a0,a1
    800018b0:	00000097          	auipc	ra,0x0
    800018b4:	5f0080e7          	jalr	1520(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
    800018b8:	100a1073          	csrw	sstatus,s4
    800018bc:	ebdff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    800018c0:	00058513          	mv	a0,a1
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	660080e7          	jalr	1632(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800018cc:	00048513          	mv	a0,s1
    800018d0:	ea9ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    800018d4:	00058513          	mv	a0,a1
    800018d8:	00002097          	auipc	ra,0x2
    800018dc:	1a4080e7          	jalr	420(ra) # 80003a7c <_ZN3TCB5sleepEm>
    800018e0:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800018e4:	00048513          	mv	a0,s1
    800018e8:	e91ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    800018ec:	00006797          	auipc	a5,0x6
    800018f0:	d4478793          	addi	a5,a5,-700 # 80007630 <_ZN5StdIO7ibufferE>
    800018f4:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    800018f8:	42898513          	addi	a0,s3,1064
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	5a4080e7          	jalr	1444(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80001904:	40098a13          	addi	s4,s3,1024
    80001908:	000a0513          	mv	a0,s4
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	594080e7          	jalr	1428(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    80001914:	4809a783          	lw	a5,1152(s3)
    80001918:	fff7879b          	addiw	a5,a5,-1
    8000191c:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    80001920:	4789a783          	lw	a5,1144(s3)
    80001924:	00f98733          	add	a4,s3,a5
    80001928:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    8000192c:	0017879b          	addiw	a5,a5,1
    80001930:	41f7d71b          	sraiw	a4,a5,0x1f
    80001934:	0167571b          	srliw	a4,a4,0x16
    80001938:	00e787bb          	addw	a5,a5,a4
    8000193c:	3ff7f793          	andi	a5,a5,1023
    80001940:	40e787bb          	subw	a5,a5,a4
    80001944:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    80001948:	45098513          	addi	a0,s3,1104
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	5d8080e7          	jalr	1496(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001954:	000a0513          	mv	a0,s4
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	5cc080e7          	jalr	1484(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    80001960:	00048513          	mv	a0,s1
    80001964:	e15ff06f          	j	80001778 <_Z8sysEcallmmmmm+0x148>

0000000080001968 <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80001968:	fd010113          	addi	sp,sp,-48
    8000196c:	02113423          	sd	ra,40(sp)
    80001970:	02813023          	sd	s0,32(sp)
    80001974:	00913c23          	sd	s1,24(sp)
    80001978:	01213823          	sd	s2,16(sp)
    8000197c:	03010413          	addi	s0,sp,48
    asm volatile("csrr %0, scause" : "=r" (scause));
    80001980:	142027f3          	csrr	a5,scause
    80001984:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80001988:	fd043483          	ld	s1,-48(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;

    if(scause == IS)
    8000198c:	00900793          	li	a5,9
    80001990:	12f48263          	beq	s1,a5,80001ab4 <interrupt+0x14c>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    80001994:	00800793          	li	a5,8
    80001998:	14f48063          	beq	s1,a5,80001ad8 <interrupt+0x170>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    8000199c:	fff00793          	li	a5,-1
    800019a0:	03f79793          	slli	a5,a5,0x3f
    800019a4:	00978793          	addi	a5,a5,9
    800019a8:	14f48063          	beq	s1,a5,80001ae8 <interrupt+0x180>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    800019ac:	fff00793          	li	a5,-1
    800019b0:	03f79793          	slli	a5,a5,0x3f
    800019b4:	00178793          	addi	a5,a5,1
    800019b8:	12f48e63          	beq	s1,a5,80001af4 <interrupt+0x18c>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == II || scause == IR || scause == IW)
    800019bc:	00200793          	li	a5,2
    800019c0:	00f48a63          	beq	s1,a5,800019d4 <interrupt+0x6c>
    800019c4:	00500793          	li	a5,5
    800019c8:	00f48663          	beq	s1,a5,800019d4 <interrupt+0x6c>
    800019cc:	00700793          	li	a5,7
    800019d0:	0ef49863          	bne	s1,a5,80001ac0 <interrupt+0x158>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    800019d4:	00006797          	auipc	a5,0x6
    800019d8:	c9478793          	addi	a5,a5,-876 # 80007668 <_ZN3TCB7runningE>
    800019dc:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    800019e0:	0357c783          	lbu	a5,53(a5)
    800019e4:	10078e63          	beqz	a5,80001b00 <interrupt+0x198>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    800019e8:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    800019ec:	00004517          	auipc	a0,0x4
    800019f0:	63450513          	addi	a0,a0,1588 # 80006020 <CONSOLE_STATUS+0x10>
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	1f4080e7          	jalr	500(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    800019fc:	00004517          	auipc	a0,0x4
    80001a00:	65c50513          	addi	a0,a0,1628 # 80006058 <CONSOLE_STATUS+0x48>
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	1e4080e7          	jalr	484(ra) # 80001be8 <_Z12kprintStringPKc>
    80001a0c:	01000593          	li	a1,16
    80001a10:	00048513          	mv	a0,s1
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	21c080e7          	jalr	540(ra) # 80001c30 <_Z9kprintIntmi>
    80001a1c:	00005517          	auipc	a0,0x5
    80001a20:	8a450513          	addi	a0,a0,-1884 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1c4080e7          	jalr	452(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    80001a2c:	00004517          	auipc	a0,0x4
    80001a30:	63c50513          	addi	a0,a0,1596 # 80006068 <CONSOLE_STATUS+0x58>
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	1b4080e7          	jalr	436(ra) # 80001be8 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001a3c:	141027f3          	csrr	a5,sepc
    80001a40:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001a44:	fd843503          	ld	a0,-40(s0)
    80001a48:	01000593          	li	a1,16
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	1e4080e7          	jalr	484(ra) # 80001c30 <_Z9kprintIntmi>
    80001a54:	00005517          	auipc	a0,0x5
    80001a58:	86c50513          	addi	a0,a0,-1940 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	18c080e7          	jalr	396(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80001a64:	00004517          	auipc	a0,0x4
    80001a68:	60c50513          	addi	a0,a0,1548 # 80006070 <CONSOLE_STATUS+0x60>
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	17c080e7          	jalr	380(ra) # 80001be8 <_Z12kprintStringPKc>
    80001a74:	01000593          	li	a1,16
    80001a78:	00090513          	mv	a0,s2
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	1b4080e7          	jalr	436(ra) # 80001c30 <_Z9kprintIntmi>
    80001a84:	00004517          	auipc	a0,0x4
    80001a88:	5f450513          	addi	a0,a0,1524 # 80006078 <CONSOLE_STATUS+0x68>
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	15c080e7          	jalr	348(ra) # 80001be8 <_Z12kprintStringPKc>
            TCB::running->finish();
    80001a94:	00006797          	auipc	a5,0x6
    80001a98:	bd478793          	addi	a5,a5,-1068 # 80007668 <_ZN3TCB7runningE>
    80001a9c:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80001aa0:	00200713          	li	a4,2
    80001aa4:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    80001aa8:	00002097          	auipc	ra,0x2
    80001aac:	ea4080e7          	jalr	-348(ra) # 8000394c <_ZN3TCB8dispatchEv>
    80001ab0:	0100006f          	j	80001ac0 <interrupt+0x158>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	b7c080e7          	jalr	-1156(ra) # 80001630 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80001abc:	04a43823          	sd	a0,80(s0)
        }
    }
                    
    
    //print(a4);
    80001ac0:	02813083          	ld	ra,40(sp)
    80001ac4:	02013403          	ld	s0,32(sp)
    80001ac8:	01813483          	ld	s1,24(sp)
    80001acc:	01013903          	ld	s2,16(sp)
    80001ad0:	03010113          	addi	sp,sp,48
    80001ad4:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	814080e7          	jalr	-2028(ra) # 800012ec <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80001ae0:	04a43823          	sd	a0,80(s0)
    80001ae4:	fddff06f          	j	80001ac0 <interrupt+0x158>
       StdIO::console_handler();
    80001ae8:	00001097          	auipc	ra,0x1
    80001aec:	5a8080e7          	jalr	1448(ra) # 80003090 <_ZN5StdIO15console_handlerEv>
    80001af0:	fd1ff06f          	j	80001ac0 <interrupt+0x158>
        timer_handler();      
    80001af4:	fffff097          	auipc	ra,0xfffff
    80001af8:	75c080e7          	jalr	1884(ra) # 80001250 <_Z13timer_handlerv>
    80001afc:	fc5ff06f          	j	80001ac0 <interrupt+0x158>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    80001b00:	00004517          	auipc	a0,0x4
    80001b04:	58050513          	addi	a0,a0,1408 # 80006080 <CONSOLE_STATUS+0x70>
    80001b08:	00000097          	auipc	ra,0x0
    80001b0c:	0e0080e7          	jalr	224(ra) # 80001be8 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    80001b10:	00002097          	auipc	ra,0x2
    80001b14:	fe0080e7          	jalr	-32(ra) # 80003af0 <_ZN3TCB13panicDispatchEv>
    80001b18:	fa9ff06f          	j	80001ac0 <interrupt+0x158>

0000000080001b1c <_Z15userMainWrapperPv>:
#include"../h/kernel_lib.h"

void userMainWrapper(void*)
{
    80001b1c:	ff010113          	addi	sp,sp,-16
    80001b20:	00113423          	sd	ra,8(sp)
    80001b24:	00813023          	sd	s0,0(sp)
    80001b28:	01010413          	addi	s0,sp,16
    userMain();
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	70c080e7          	jalr	1804(ra) # 80001238 <_Z8userMainv>
}
    80001b34:	00813083          	ld	ra,8(sp)
    80001b38:	00013403          	ld	s0,0(sp)
    80001b3c:	01010113          	addi	sp,sp,16
    80001b40:	00008067          	ret

0000000080001b44 <_Z12idleFunctionPv>:

void idleFunction(void*)
{
    80001b44:	ff010113          	addi	sp,sp,-16
    80001b48:	00113423          	sd	ra,8(sp)
    80001b4c:	00813023          	sd	s0,0(sp)
    80001b50:	01010413          	addi	s0,sp,16
    while(1){
        thread_dispatch();
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	f70080e7          	jalr	-144(ra) # 80002ac4 <thread_dispatch>
    80001b5c:	ff9ff06f          	j	80001b54 <_Z12idleFunctionPv+0x10>

0000000080001b60 <_Z7kmallocm>:
    }
}

void* kmalloc(size_t size)
{
    80001b60:	fe010113          	addi	sp,sp,-32
    80001b64:	00113c23          	sd	ra,24(sp)
    80001b68:	00813823          	sd	s0,16(sp)
    80001b6c:	00913423          	sd	s1,8(sp)
    80001b70:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80001b74:	fff50493          	addi	s1,a0,-1
    80001b78:	0064d493          	srli	s1,s1,0x6
    80001b7c:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	528080e7          	jalr	1320(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80001b88:	00048593          	mv	a1,s1
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	590080e7          	jalr	1424(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001b94:	01813083          	ld	ra,24(sp)
    80001b98:	01013403          	ld	s0,16(sp)
    80001b9c:	00813483          	ld	s1,8(sp)
    80001ba0:	02010113          	addi	sp,sp,32
    80001ba4:	00008067          	ret

0000000080001ba8 <_Z5kputcc>:

void kputc(char c){
    80001ba8:	ff010113          	addi	sp,sp,-16
    80001bac:	00813423          	sd	s0,8(sp)
    80001bb0:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    80001bb4:	00004797          	auipc	a5,0x4
    80001bb8:	45478793          	addi	a5,a5,1108 # 80006008 <CONSOLE_TX_DATA>
    80001bbc:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    80001bc0:	00004797          	auipc	a5,0x4
    80001bc4:	45078793          	addi	a5,a5,1104 # 80006010 <CONSOLE_STATUS>
    80001bc8:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    80001bcc:	00074783          	lbu	a5,0(a4)
    80001bd0:	0207f793          	andi	a5,a5,32
    80001bd4:	fe078ce3          	beqz	a5,80001bcc <_Z5kputcc+0x24>
    *odata = c;
    80001bd8:	00a68023          	sb	a0,0(a3)
}
    80001bdc:	00813403          	ld	s0,8(sp)
    80001be0:	01010113          	addi	sp,sp,16
    80001be4:	00008067          	ret

0000000080001be8 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    80001be8:	fe010113          	addi	sp,sp,-32
    80001bec:	00113c23          	sd	ra,24(sp)
    80001bf0:	00813823          	sd	s0,16(sp)
    80001bf4:	00913423          	sd	s1,8(sp)
    80001bf8:	02010413          	addi	s0,sp,32
    80001bfc:	00050493          	mv	s1,a0
    if(!string) return;
    80001c00:	00050e63          	beqz	a0,80001c1c <_Z12kprintStringPKc+0x34>
    while(*string)
    80001c04:	0004c503          	lbu	a0,0(s1)
    80001c08:	00050a63          	beqz	a0,80001c1c <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    80001c0c:	00000097          	auipc	ra,0x0
    80001c10:	f9c080e7          	jalr	-100(ra) # 80001ba8 <_Z5kputcc>
        string++;
    80001c14:	00148493          	addi	s1,s1,1
    while(*string)
    80001c18:	fedff06f          	j	80001c04 <_Z12kprintStringPKc+0x1c>
    }
}
    80001c1c:	01813083          	ld	ra,24(sp)
    80001c20:	01013403          	ld	s0,16(sp)
    80001c24:	00813483          	ld	s1,8(sp)
    80001c28:	02010113          	addi	sp,sp,32
    80001c2c:	00008067          	ret

0000000080001c30 <_Z9kprintIntmi>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base){
    80001c30:	fd010113          	addi	sp,sp,-48
    80001c34:	02113423          	sd	ra,40(sp)
    80001c38:	02813023          	sd	s0,32(sp)
    80001c3c:	00913c23          	sd	s1,24(sp)
    80001c40:	03010413          	addi	s0,sp,48
    char buf[16];
    int i;

    i = 0;
    80001c44:	00000793          	li	a5,0
    80001c48:	0080006f          	j	80001c50 <_Z9kprintIntmi+0x20>
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    80001c4c:	00070513          	mv	a0,a4
        buf[i++] = kdigits[xx % base];
    80001c50:	02b576b3          	remu	a3,a0,a1
    80001c54:	0017849b          	addiw	s1,a5,1
    80001c58:	00006717          	auipc	a4,0x6
    80001c5c:	90870713          	addi	a4,a4,-1784 # 80007560 <kdigits>
    80001c60:	00d70733          	add	a4,a4,a3
    80001c64:	00074703          	lbu	a4,0(a4)
    80001c68:	fe040693          	addi	a3,s0,-32
    80001c6c:	00f687b3          	add	a5,a3,a5
    80001c70:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80001c74:	02b55733          	divu	a4,a0,a1
        buf[i++] = kdigits[xx % base];
    80001c78:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80001c7c:	fcb578e3          	bgeu	a0,a1,80001c4c <_Z9kprintIntmi+0x1c>


    while(--i >= 0)
    80001c80:	fff4849b          	addiw	s1,s1,-1
    80001c84:	0004ce63          	bltz	s1,80001ca0 <_Z9kprintIntmi+0x70>
        kputc(buf[i]);
    80001c88:	fe040793          	addi	a5,s0,-32
    80001c8c:	009787b3          	add	a5,a5,s1
    80001c90:	ff07c503          	lbu	a0,-16(a5)
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	f14080e7          	jalr	-236(ra) # 80001ba8 <_Z5kputcc>
    while(--i >= 0)
    80001c9c:	fe5ff06f          	j	80001c80 <_Z9kprintIntmi+0x50>
    80001ca0:	02813083          	ld	ra,40(sp)
    80001ca4:	02013403          	ld	s0,32(sp)
    80001ca8:	01813483          	ld	s1,24(sp)
    80001cac:	03010113          	addi	sp,sp,48
    80001cb0:	00008067          	ret

0000000080001cb4 <_Z10kernelInitv>:
{
    80001cb4:	fd010113          	addi	sp,sp,-48
    80001cb8:	02113423          	sd	ra,40(sp)
    80001cbc:	02813023          	sd	s0,32(sp)
    80001cc0:	00913c23          	sd	s1,24(sp)
    80001cc4:	01213823          	sd	s2,16(sp)
    80001cc8:	01313423          	sd	s3,8(sp)
    80001ccc:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    80001cd0:	00004517          	auipc	a0,0x4
    80001cd4:	3e850513          	addi	a0,a0,1000 # 800060b8 <CONSOLE_STATUS+0xa8>
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	f10080e7          	jalr	-240(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("HEAP_START_ADDR: "); kprintInt((uint64)HEAP_START_ADDR,16); kprintString("\n");
    80001ce0:	00004517          	auipc	a0,0x4
    80001ce4:	40850513          	addi	a0,a0,1032 # 800060e8 <CONSOLE_STATUS+0xd8>
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	f00080e7          	jalr	-256(ra) # 80001be8 <_Z12kprintStringPKc>
    80001cf0:	01000593          	li	a1,16
    80001cf4:	00006797          	auipc	a5,0x6
    80001cf8:	85c78793          	addi	a5,a5,-1956 # 80007550 <HEAP_START_ADDR>
    80001cfc:	0007b503          	ld	a0,0(a5)
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f30080e7          	jalr	-208(ra) # 80001c30 <_Z9kprintIntmi>
    80001d08:	00004517          	auipc	a0,0x4
    80001d0c:	5b850513          	addi	a0,a0,1464 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	ed8080e7          	jalr	-296(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("HEAP_END_ADDR: "); kprintInt((uint64)HEAP_END_ADDR,16); kprintString("\n");
    80001d18:	00004517          	auipc	a0,0x4
    80001d1c:	3e850513          	addi	a0,a0,1000 # 80006100 <CONSOLE_STATUS+0xf0>
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	ec8080e7          	jalr	-312(ra) # 80001be8 <_Z12kprintStringPKc>
    80001d28:	01000593          	li	a1,16
    80001d2c:	00006797          	auipc	a5,0x6
    80001d30:	81c78793          	addi	a5,a5,-2020 # 80007548 <HEAP_END_ADDR>
    80001d34:	0007b503          	ld	a0,0(a5)
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	ef8080e7          	jalr	-264(ra) # 80001c30 <_Z9kprintIntmi>
    80001d40:	00004517          	auipc	a0,0x4
    80001d44:	58050513          	addi	a0,a0,1408 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	ea0080e7          	jalr	-352(ra) # 80001be8 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec);
    80001d50:	fffff797          	auipc	a5,0xfffff
    80001d54:	2b078793          	addi	a5,a5,688 # 80001000 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    80001d58:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80001d5c:	00004517          	auipc	a0,0x4
    80001d60:	3b450513          	addi	a0,a0,948 # 80006110 <CONSOLE_STATUS+0x100>
    80001d64:	00000097          	auipc	ra,0x0
    80001d68:	e84080e7          	jalr	-380(ra) # 80001be8 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance();
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	33c080e7          	jalr	828(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    kprintString("MemoryAllocator initalized!\n");
    80001d74:	00004517          	auipc	a0,0x4
    80001d78:	3b450513          	addi	a0,a0,948 # 80006128 <CONSOLE_STATUS+0x118>
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	e6c080e7          	jalr	-404(ra) # 80001be8 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	b68080e7          	jalr	-1176(ra) # 800028ec <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80001d8c:	00004517          	auipc	a0,0x4
    80001d90:	3bc50513          	addi	a0,a0,956 # 80006148 <CONSOLE_STATUS+0x138>
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	e54080e7          	jalr	-428(ra) # 80001be8 <_Z12kprintStringPKc>
    StdIO::initalize();
    80001d9c:	00001097          	auipc	ra,0x1
    80001da0:	0f4080e7          	jalr	244(ra) # 80002e90 <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80001da4:	00004517          	auipc	a0,0x4
    80001da8:	3bc50513          	addi	a0,a0,956 # 80006160 <CONSOLE_STATUS+0x150>
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	e3c080e7          	jalr	-452(ra) # 80001be8 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80001db4:	00002097          	auipc	ra,0x2
    80001db8:	ab4080e7          	jalr	-1356(ra) # 80003868 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80001dbc:	00004517          	auipc	a0,0x4
    80001dc0:	3bc50513          	addi	a0,a0,956 # 80006178 <CONSOLE_STATUS+0x168>
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	e24080e7          	jalr	-476(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80001dcc:	00004517          	auipc	a0,0x4
    80001dd0:	3cc50513          	addi	a0,a0,972 # 80006198 <CONSOLE_STATUS+0x188>
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	e14080e7          	jalr	-492(ra) # 80001be8 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80001ddc:	00001537          	lui	a0,0x1
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	d80080e7          	jalr	-640(ra) # 80001b60 <_Z7kmallocm>
    80001de8:	00050493          	mv	s1,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80001dec:	00050613          	mv	a2,a0
    80001df0:	00000593          	li	a1,0
    80001df4:	00000517          	auipc	a0,0x0
    80001df8:	d2850513          	addi	a0,a0,-728 # 80001b1c <_Z15userMainWrapperPv>
    80001dfc:	00002097          	auipc	ra,0x2
    80001e00:	894080e7          	jalr	-1900(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001e04:	00050993          	mv	s3,a0
    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80001e08:	00001537          	lui	a0,0x1
    80001e0c:	00000097          	auipc	ra,0x0
    80001e10:	d54080e7          	jalr	-684(ra) # 80001b60 <_Z7kmallocm>
    80001e14:	00050913          	mv	s2,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    80001e18:	00050613          	mv	a2,a0
    80001e1c:	00000593          	li	a1,0
    80001e20:	00000517          	auipc	a0,0x0
    80001e24:	d2450513          	addi	a0,a0,-732 # 80001b44 <_Z12idleFunctionPv>
    80001e28:	00002097          	auipc	ra,0x2
    80001e2c:	868080e7          	jalr	-1944(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    80001e30:	04048863          	beqz	s1,80001e80 <_Z10kernelInitv+0x1cc>
    80001e34:	04090a63          	beqz	s2,80001e88 <_Z10kernelInitv+0x1d4>
    80001e38:	04050c63          	beqz	a0,80001e90 <_Z10kernelInitv+0x1dc>
    80001e3c:	04098e63          	beqz	s3,80001e98 <_Z10kernelInitv+0x1e4>
        kprintString("Threads successfully initalized!\n");
    80001e40:	00004517          	auipc	a0,0x4
    80001e44:	38850513          	addi	a0,a0,904 # 800061c8 <CONSOLE_STATUS+0x1b8>
    80001e48:	00000097          	auipc	ra,0x0
    80001e4c:	da0080e7          	jalr	-608(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80001e50:	00004517          	auipc	a0,0x4
    80001e54:	3a050513          	addi	a0,a0,928 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	d90080e7          	jalr	-624(ra) # 80001be8 <_Z12kprintStringPKc>
    return 0;
    80001e60:	00000513          	li	a0,0
}
    80001e64:	02813083          	ld	ra,40(sp)
    80001e68:	02013403          	ld	s0,32(sp)
    80001e6c:	01813483          	ld	s1,24(sp)
    80001e70:	01013903          	ld	s2,16(sp)
    80001e74:	00813983          	ld	s3,8(sp)
    80001e78:	03010113          	addi	sp,sp,48
    80001e7c:	00008067          	ret
        return -1;
    80001e80:	fff00513          	li	a0,-1
    80001e84:	fe1ff06f          	j	80001e64 <_Z10kernelInitv+0x1b0>
    80001e88:	fff00513          	li	a0,-1
    80001e8c:	fd9ff06f          	j	80001e64 <_Z10kernelInitv+0x1b0>
    80001e90:	fff00513          	li	a0,-1
    80001e94:	fd1ff06f          	j	80001e64 <_Z10kernelInitv+0x1b0>
    80001e98:	fff00513          	li	a0,-1
    80001e9c:	fc9ff06f          	j	80001e64 <_Z10kernelInitv+0x1b0>

0000000080001ea0 <_ZN10KSemaphore4waitEv>:
#include"../h/KInclude.hpp"

KSemaphore* KSemaphore::activeSemaphores = nullptr;

int KSemaphore::wait(){
    if(val > 0)
    80001ea0:	00852783          	lw	a5,8(a0)
    80001ea4:	00078a63          	beqz	a5,80001eb8 <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    80001ea8:	fff7879b          	addiw	a5,a5,-1
    80001eac:	00f52423          	sw	a5,8(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80001eb0:	00000513          	li	a0,0
}
    80001eb4:	00008067          	ret
int KSemaphore::wait(){
    80001eb8:	fe010113          	addi	sp,sp,-32
    80001ebc:	00113c23          	sd	ra,24(sp)
    80001ec0:	00813823          	sd	s0,16(sp)
    80001ec4:	00913423          	sd	s1,8(sp)
    80001ec8:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    80001ecc:	00005497          	auipc	s1,0x5
    80001ed0:	79c48493          	addi	s1,s1,1948 # 80007668 <_ZN3TCB7runningE>
    80001ed4:	0004b583          	ld	a1,0(s1)
    void setState(TCBState s) {state = s;}
    80001ed8:	0205a823          	sw	zero,48(a1)
        blocked.insert(TCB::running);
    80001edc:	01050513          	addi	a0,a0,16
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	700080e7          	jalr	1792(ra) # 800025e0 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    80001ee8:	00002097          	auipc	ra,0x2
    80001eec:	b5c080e7          	jalr	-1188(ra) # 80003a44 <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    80001ef0:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    80001ef4:	0307a703          	lw	a4,48(a5)
    80001ef8:	02071263          	bnez	a4,80001f1c <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    80001efc:	00100713          	li	a4,1
    80001f00:	02e7a823          	sw	a4,48(a5)
    return 0;
    80001f04:	00000513          	li	a0,0
}
    80001f08:	01813083          	ld	ra,24(sp)
    80001f0c:	01013403          	ld	s0,16(sp)
    80001f10:	00813483          	ld	s1,8(sp)
    80001f14:	02010113          	addi	sp,sp,32
    80001f18:	00008067          	ret
            return -2;
    80001f1c:	ffe00513          	li	a0,-2
    80001f20:	fe9ff06f          	j	80001f08 <_ZN10KSemaphore4waitEv+0x68>

0000000080001f24 <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80001f24:	01053783          	ld	a5,16(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    80001f28:	02078e63          	beqz	a5,80001f64 <_ZN10KSemaphore6signalEv+0x40>
{
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80001f3c:	01050513          	addi	a0,a0,16
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	6e0080e7          	jalr	1760(ra) # 80002620 <_ZN8TcbQueue6removeEv>
    80001f48:	00001097          	auipc	ra,0x1
    80001f4c:	970080e7          	jalr	-1680(ra) # 800028b8 <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    80001f50:	00000513          	li	a0,0
    80001f54:	00813083          	ld	ra,8(sp)
    80001f58:	00013403          	ld	s0,0(sp)
    80001f5c:	01010113          	addi	sp,sp,16
    80001f60:	00008067          	ret
        val++;
    80001f64:	00852783          	lw	a5,8(a0)
    80001f68:	0017879b          	addiw	a5,a5,1
    80001f6c:	00f52423          	sw	a5,8(a0)
}
    80001f70:	00000513          	li	a0,0
    80001f74:	00008067          	ret

0000000080001f78 <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    80001f78:	fe010113          	addi	sp,sp,-32
    80001f7c:	00113c23          	sd	ra,24(sp)
    80001f80:	00813823          	sd	s0,16(sp)
    80001f84:	00913423          	sd	s1,8(sp)
    80001f88:	02010413          	addi	s0,sp,32
    80001f8c:	00050493          	mv	s1,a0
    80001f90:	0104b783          	ld	a5,16(s1)
{
    while(!blocked.isEmpty()){
    80001f94:	02078263          	beqz	a5,80001fb8 <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    80001f98:	01048513          	addi	a0,s1,16
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	684080e7          	jalr	1668(ra) # 80002620 <_ZN8TcbQueue6removeEv>
    80001fa4:	00100793          	li	a5,1
    80001fa8:	02f52823          	sw	a5,48(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    80001fac:	00001097          	auipc	ra,0x1
    80001fb0:	90c080e7          	jalr	-1780(ra) # 800028b8 <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    80001fb4:	fddff06f          	j	80001f90 <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    80001fb8:	01813083          	ld	ra,24(sp)
    80001fbc:	01013403          	ld	s0,16(sp)
    80001fc0:	00813483          	ld	s1,8(sp)
    80001fc4:	02010113          	addi	sp,sp,32
    80001fc8:	00008067          	ret

0000000080001fcc <_ZN10KSemaphore5closeEPS_>:

int KSemaphore::close(KSemaphore* sem)
{
    80001fcc:	fe010113          	addi	sp,sp,-32
    80001fd0:	00113c23          	sd	ra,24(sp)
    80001fd4:	00813823          	sd	s0,16(sp)
    80001fd8:	00913423          	sd	s1,8(sp)
    80001fdc:	02010413          	addi	s0,sp,32
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    80001fe0:	00005797          	auipc	a5,0x5
    80001fe4:	63078793          	addi	a5,a5,1584 # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    80001fe8:	0007b483          	ld	s1,0(a5)
    80001fec:	00000793          	li	a5,0
    while(cur)
    80001ff0:	00048a63          	beqz	s1,80002004 <_ZN10KSemaphore5closeEPS_+0x38>
    {
        if(cur == sem)
    80001ff4:	00a48863          	beq	s1,a0,80002004 <_ZN10KSemaphore5closeEPS_+0x38>
            break;
        prev = cur;
    80001ff8:	00048793          	mv	a5,s1
        cur = cur->next;
    80001ffc:	0004b483          	ld	s1,0(s1)
    while(cur)
    80002000:	ff1ff06f          	j	80001ff0 <_ZN10KSemaphore5closeEPS_+0x24>
    }
    if(cur)
    80002004:	04048e63          	beqz	s1,80002060 <_ZN10KSemaphore5closeEPS_+0x94>
    {
        if(prev)
    80002008:	04078463          	beqz	a5,80002050 <_ZN10KSemaphore5closeEPS_+0x84>
            prev->next = cur->next;
    8000200c:	0004b703          	ld	a4,0(s1)
    80002010:	00e7b023          	sd	a4,0(a5)
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
    80002014:	0004b023          	sd	zero,0(s1)
        delete cur;
    80002018:	00048513          	mv	a0,s1
    8000201c:	00000097          	auipc	ra,0x0
    80002020:	f5c080e7          	jalr	-164(ra) # 80001f78 <_ZN10KSemaphoreD1Ev>
    80002024:	00000097          	auipc	ra,0x0
    80002028:	084080e7          	jalr	132(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    8000202c:	00048593          	mv	a1,s1
    80002030:	00000097          	auipc	ra,0x0
    80002034:	2a8080e7          	jalr	680(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
        return 0;
    80002038:	00000513          	li	a0,0
    }
    else return -1;

}
    8000203c:	01813083          	ld	ra,24(sp)
    80002040:	01013403          	ld	s0,16(sp)
    80002044:	00813483          	ld	s1,8(sp)
    80002048:	02010113          	addi	sp,sp,32
    8000204c:	00008067          	ret
            activeSemaphores = cur->next;
    80002050:	0004b783          	ld	a5,0(s1)
    80002054:	00005717          	auipc	a4,0x5
    80002058:	5af73e23          	sd	a5,1468(a4) # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    8000205c:	fb9ff06f          	j	80002014 <_ZN10KSemaphore5closeEPS_+0x48>
    else return -1;
    80002060:	fff00513          	li	a0,-1
    80002064:	fd9ff06f          	j	8000203c <_ZN10KSemaphore5closeEPS_+0x70>

0000000080002068 <_ZN10KSemaphore6existsEPS_>:

bool KSemaphore::exists(KSemaphore* sem)
{
    80002068:	ff010113          	addi	sp,sp,-16
    8000206c:	00813423          	sd	s0,8(sp)
    80002070:	01010413          	addi	s0,sp,16
    KSemaphore* cur = activeSemaphores;
    80002074:	00005797          	auipc	a5,0x5
    80002078:	59c78793          	addi	a5,a5,1436 # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    8000207c:	0007b783          	ld	a5,0(a5)
    while(cur)
    80002080:	00078863          	beqz	a5,80002090 <_ZN10KSemaphore6existsEPS_+0x28>
    {
        if(cur == sem)
    80002084:	00a78e63          	beq	a5,a0,800020a0 <_ZN10KSemaphore6existsEPS_+0x38>
            return true;
        cur = cur->next;
    80002088:	0007b783          	ld	a5,0(a5)
    while(cur)
    8000208c:	ff5ff06f          	j	80002080 <_ZN10KSemaphore6existsEPS_+0x18>
    }
    return false;
    80002090:	00000513          	li	a0,0
}
    80002094:	00813403          	ld	s0,8(sp)
    80002098:	01010113          	addi	sp,sp,16
    8000209c:	00008067          	ret
            return true;
    800020a0:	00100513          	li	a0,1
    800020a4:	ff1ff06f          	j	80002094 <_ZN10KSemaphore6existsEPS_+0x2c>

00000000800020a8 <_ZN15MemoryAllocator11getInstanceEv>:
#include"../h/memory_allocator.hpp"
#include"../h/kernel_funs.h"
MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    800020a8:	ff010113          	addi	sp,sp,-16
    800020ac:	00813423          	sd	s0,8(sp)
    800020b0:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    800020b4:	00005797          	auipc	a5,0x5
    800020b8:	5ec7c783          	lbu	a5,1516(a5) # 800076a0 <_ZN15MemoryAllocator9allocatorE>
    800020bc:	04079663          	bnez	a5,80002108 <_ZN15MemoryAllocator11getInstanceEv+0x60>
        allocator.fall_head = nullptr;
    800020c0:	00005717          	auipc	a4,0x5
    800020c4:	5e070713          	addi	a4,a4,1504 # 800076a0 <_ZN15MemoryAllocator9allocatorE>
    800020c8:	00073823          	sd	zero,16(a4)
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    800020cc:	00005697          	auipc	a3,0x5
    800020d0:	48468693          	addi	a3,a3,1156 # 80007550 <HEAP_START_ADDR>
    800020d4:	0006b783          	ld	a5,0(a3)
    800020d8:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    800020dc:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    800020e0:	00005797          	auipc	a5,0x5
    800020e4:	46878793          	addi	a5,a5,1128 # 80007548 <HEAP_END_ADDR>
    800020e8:	0007b783          	ld	a5,0(a5)
    800020ec:	0006b683          	ld	a3,0(a3)
    800020f0:	40d787b3          	sub	a5,a5,a3
    800020f4:	00873683          	ld	a3,8(a4)
    800020f8:	ff078793          	addi	a5,a5,-16
    800020fc:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    80002100:	00100793          	li	a5,1
    80002104:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    80002108:	00005517          	auipc	a0,0x5
    8000210c:	59850513          	addi	a0,a0,1432 # 800076a0 <_ZN15MemoryAllocator9allocatorE>
    80002110:	00813403          	ld	s0,8(sp)
    80002114:	01010113          	addi	sp,sp,16
    80002118:	00008067          	ret

000000008000211c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    8000211c:	ff010113          	addi	sp,sp,-16
    80002120:	00813423          	sd	s0,8(sp)
    80002124:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80002128:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    8000212c:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80002130:	00000613          	li	a2,0
    80002134:	00000893          	li	a7,0
    80002138:	00000713          	li	a4,0
    8000213c:	0140006f          	j	80002150 <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    80002140:	00060893          	mv	a7,a2
                best = curr;     
    80002144:	00078713          	mv	a4,a5
            }
        prev = curr;
    80002148:	00078613          	mv	a2,a5
        curr = curr->next;
    8000214c:	0007b783          	ld	a5,0(a5)
    while(curr){
    80002150:	02078263          	beqz	a5,80002174 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    80002154:	0087b683          	ld	a3,8(a5)
    80002158:	feb6e8e3          	bltu	a3,a1,80002148 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    8000215c:	fe0702e3          	beqz	a4,80002140 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    80002160:	00873803          	ld	a6,8(a4)
    80002164:	ff06f2e3          	bgeu	a3,a6,80002148 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    80002168:	00060893          	mv	a7,a2
                best = curr;     
    8000216c:	00078713          	mv	a4,a5
    80002170:	fd9ff06f          	j	80002148 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    80002174:	02070863          	beqz	a4,800021a4 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    80002178:	00873783          	ld	a5,8(a4)
    8000217c:	40b787b3          	sub	a5,a5,a1
    80002180:	04f00693          	li	a3,79
    80002184:	02f6ee63          	bltu	a3,a5,800021c0 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(!best_prev) fmem_head = best->next;
    80002188:	02088663          	beqz	a7,800021b4 <_ZN15MemoryAllocator9mem_allocEm+0x98>
        else best_prev->next = best->next;
    8000218c:	00073783          	ld	a5,0(a4)
    80002190:	00f8b023          	sd	a5,0(a7)
        curr->size = best->size - size - sizeof(FreeSegment);
        best->size = size;
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    best->next = fall_head;
    80002194:	01053783          	ld	a5,16(a0)
    80002198:	00f73023          	sd	a5,0(a4)
    fall_head = best;
    8000219c:	00e53823          	sd	a4,16(a0)
    return (char*)best+sizeof(FreeSegment);
    800021a0:	01070713          	addi	a4,a4,16
}
    800021a4:	00070513          	mv	a0,a4
    800021a8:	00813403          	ld	s0,8(sp)
    800021ac:	01010113          	addi	sp,sp,16
    800021b0:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    800021b4:	00073783          	ld	a5,0(a4)
    800021b8:	00f53423          	sd	a5,8(a0)
    800021bc:	fd9ff06f          	j	80002194 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    800021c0:	01058793          	addi	a5,a1,16
    800021c4:	00f707b3          	add	a5,a4,a5
        curr->next = best->next;
    800021c8:	00073683          	ld	a3,0(a4)
    800021cc:	00d7b023          	sd	a3,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    800021d0:	00873683          	ld	a3,8(a4)
    800021d4:	40b686b3          	sub	a3,a3,a1
    800021d8:	ff068693          	addi	a3,a3,-16
    800021dc:	00d7b423          	sd	a3,8(a5)
        best->size = size;
    800021e0:	00b73423          	sd	a1,8(a4)
        if(best_prev) best_prev->next = curr;
    800021e4:	00088663          	beqz	a7,800021f0 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    800021e8:	00f8b023          	sd	a5,0(a7)
    800021ec:	fa9ff06f          	j	80002194 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    800021f0:	00f53423          	sd	a5,8(a0)
    800021f4:	fa1ff06f          	j	80002194 <_ZN15MemoryAllocator9mem_allocEm+0x78>

00000000800021f8 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    800021f8:	ff010113          	addi	sp,sp,-16
    800021fc:	00813423          	sd	s0,8(sp)
    80002200:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80002204:	00005797          	auipc	a5,0x5
    80002208:	34c78793          	addi	a5,a5,844 # 80007550 <HEAP_START_ADDR>
    8000220c:	0007b783          	ld	a5,0(a5)
    80002210:	04f5ee63          	bltu	a1,a5,8000226c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80002214:	00005797          	auipc	a5,0x5
    80002218:	33478793          	addi	a5,a5,820 # 80007548 <HEAP_END_ADDR>
    8000221c:	0007b783          	ld	a5,0(a5)
    80002220:	04f5fe63          	bgeu	a1,a5,8000227c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    80002224:	01053783          	ld	a5,16(a0)
    80002228:	00000693          	li	a3,0
    while(cur)
    8000222c:	00078c63          	beqz	a5,80002244 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        if(t == (size_t)cur+sizeof(FreeSegment))
    80002230:	01078713          	addi	a4,a5,16
    80002234:	00b70863          	beq	a4,a1,80002244 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;
        prev = cur;
    80002238:	00078693          	mv	a3,a5
        cur = cur->next;
    8000223c:	0007b783          	ld	a5,0(a5)
    while(cur)
    80002240:	fedff06f          	j	8000222c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    80002244:	04078063          	beqz	a5,80002284 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    80002248:	00068c63          	beqz	a3,80002260 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    8000224c:	0007b703          	ld	a4,0(a5)
    80002250:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    80002254:	0007b023          	sd	zero,0(a5)
        return false;
    80002258:	00000513          	li	a0,0
    8000225c:	0140006f          	j	80002270 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    80002260:	0007b703          	ld	a4,0(a5)
    80002264:	00e53823          	sd	a4,16(a0)
    80002268:	fedff06f          	j	80002254 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    8000226c:	00100513          	li	a0,1
    }
    else return true;
}
    80002270:	00813403          	ld	s0,8(sp)
    80002274:	01010113          	addi	sp,sp,16
    80002278:	00008067          	ret
        return true;
    8000227c:	00100513          	li	a0,1
    80002280:	ff1ff06f          	j	80002270 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    80002284:	00100513          	li	a0,1
    80002288:	fe9ff06f          	j	80002270 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

000000008000228c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    8000228c:	ff010113          	addi	sp,sp,-16
    80002290:	00813423          	sd	s0,8(sp)
    80002294:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80002298:	0085b703          	ld	a4,8(a1)
    8000229c:	01070793          	addi	a5,a4,16
    800022a0:	00f587b3          	add	a5,a1,a5
    800022a4:	0005b503          	ld	a0,0(a1)
    800022a8:	00a78863          	beq	a5,a0,800022b8 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    800022ac:	00813403          	ld	s0,8(sp)
    800022b0:	01010113          	addi	sp,sp,16
    800022b4:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    800022b8:	00853783          	ld	a5,8(a0)
    800022bc:	00f70733          	add	a4,a4,a5
    800022c0:	01070713          	addi	a4,a4,16
    800022c4:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    800022c8:	00053783          	ld	a5,0(a0)
    800022cc:	00f5b023          	sd	a5,0(a1)
        return t;
    800022d0:	00058513          	mv	a0,a1
    800022d4:	fd9ff06f          	j	800022ac <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

00000000800022d8 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    800022d8:	fd010113          	addi	sp,sp,-48
    800022dc:	02113423          	sd	ra,40(sp)
    800022e0:	02813023          	sd	s0,32(sp)
    800022e4:	00913c23          	sd	s1,24(sp)
    800022e8:	01213823          	sd	s2,16(sp)
    800022ec:	01313423          	sd	s3,8(sp)
    800022f0:	01413023          	sd	s4,0(sp)
    800022f4:	03010413          	addi	s0,sp,48
    800022f8:	00050993          	mv	s3,a0
    800022fc:	00058913          	mv	s2,a1
    if(wantToFreeAddress(adr)) return -1;
    80002300:	00000097          	auipc	ra,0x0
    80002304:	ef8080e7          	jalr	-264(ra) # 800021f8 <_ZN15MemoryAllocator17wantToFreeAddressEPv>
    80002308:	0a051063          	bnez	a0,800023a8 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    8000230c:	0089b783          	ld	a5,8(s3)
    80002310:	00078863          	beqz	a5,80002320 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80002314:	ff090a13          	addi	s4,s2,-16
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80002318:	00000493          	li	s1,0
    8000231c:	01c0006f          	j	80002338 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80002320:	ff090913          	addi	s2,s2,-16
    80002324:	0129b423          	sd	s2,8(s3)
    80002328:	0540006f          	j	8000237c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    8000232c:	00f96e63          	bltu	s2,a5,80002348 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80002330:	00078493          	mv	s1,a5
    80002334:	0007b783          	ld	a5,0(a5)
    80002338:	00078863          	beqz	a5,80002348 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    8000233c:	fe0488e3          	beqz	s1,8000232c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    80002340:	ff24f8e3          	bgeu	s1,s2,80002330 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80002344:	fe9ff06f          	j	8000232c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        newsgm->next = cur;
    80002348:	fef93823          	sd	a5,-16(s2)
        if(cur)
    8000234c:	00078a63          	beqz	a5,80002360 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    80002350:	000a0593          	mv	a1,s4
    80002354:	00098513          	mv	a0,s3
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	f34080e7          	jalr	-204(ra) # 8000228c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80002360:	02048e63          	beqz	s1,8000239c <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    80002364:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    80002368:	00048593          	mv	a1,s1
    8000236c:	00098513          	mv	a0,s3
    80002370:	00000097          	auipc	ra,0x0
    80002374:	f1c080e7          	jalr	-228(ra) # 8000228c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    80002378:	00000513          	li	a0,0
}
    8000237c:	02813083          	ld	ra,40(sp)
    80002380:	02013403          	ld	s0,32(sp)
    80002384:	01813483          	ld	s1,24(sp)
    80002388:	01013903          	ld	s2,16(sp)
    8000238c:	00813983          	ld	s3,8(sp)
    80002390:	00013a03          	ld	s4,0(sp)
    80002394:	03010113          	addi	sp,sp,48
    80002398:	00008067          	ret
            fmem_head = newsgm;
    8000239c:	0149b423          	sd	s4,8(s3)
    return 0;
    800023a0:	00000513          	li	a0,0
    800023a4:	fd9ff06f          	j	8000237c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(wantToFreeAddress(adr)) return -1;
    800023a8:	fff00513          	li	a0,-1
    800023ac:	fd1ff06f          	j	8000237c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

00000000800023b0 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    800023b0:	fe010113          	addi	sp,sp,-32
    800023b4:	00113c23          	sd	ra,24(sp)
    800023b8:	00813823          	sd	s0,16(sp)
    800023bc:	00913423          	sd	s1,8(sp)
    800023c0:	02010413          	addi	s0,sp,32
    800023c4:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    800023c8:	00004517          	auipc	a0,0x4
    800023cc:	e5850513          	addi	a0,a0,-424 # 80006220 <CONSOLE_STATUS+0x210>
    800023d0:	00000097          	auipc	ra,0x0
    800023d4:	818080e7          	jalr	-2024(ra) # 80001be8 <_Z12kprintStringPKc>
    if(!fmem_head)
    800023d8:	0084b783          	ld	a5,8(s1)
    800023dc:	04078a63          	beqz	a5,80002430 <_ZN15MemoryAllocator10print_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    800023e0:	0084b483          	ld	s1,8(s1)
    800023e4:	06048063          	beqz	s1,80002444 <_ZN15MemoryAllocator10print_listEv+0x94>
        kprintInt((uint64)curr);
    800023e8:	00a00593          	li	a1,10
    800023ec:	00048513          	mv	a0,s1
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	840080e7          	jalr	-1984(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800023f8:	00004517          	auipc	a0,0x4
    800023fc:	ec850513          	addi	a0,a0,-312 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	7e8080e7          	jalr	2024(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80002408:	00a00593          	li	a1,10
    8000240c:	0084b503          	ld	a0,8(s1)
    80002410:	00000097          	auipc	ra,0x0
    80002414:	820080e7          	jalr	-2016(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    80002418:	00004517          	auipc	a0,0x4
    8000241c:	ea850513          	addi	a0,a0,-344 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80002420:	fffff097          	auipc	ra,0xfffff
    80002424:	7c8080e7          	jalr	1992(ra) # 80001be8 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002428:	0004b483          	ld	s1,0(s1)
    8000242c:	fb9ff06f          	j	800023e4 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80002430:	00004517          	auipc	a0,0x4
    80002434:	e1050513          	addi	a0,a0,-496 # 80006240 <CONSOLE_STATUS+0x230>
    80002438:	fffff097          	auipc	ra,0xfffff
    8000243c:	7b0080e7          	jalr	1968(ra) # 80001be8 <_Z12kprintStringPKc>
    80002440:	fa1ff06f          	j	800023e0 <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80002444:	00004517          	auipc	a0,0x4
    80002448:	e1450513          	addi	a0,a0,-492 # 80006258 <CONSOLE_STATUS+0x248>
    8000244c:	fffff097          	auipc	ra,0xfffff
    80002450:	79c080e7          	jalr	1948(ra) # 80001be8 <_Z12kprintStringPKc>
}
    80002454:	01813083          	ld	ra,24(sp)
    80002458:	01013403          	ld	s0,16(sp)
    8000245c:	00813483          	ld	s1,8(sp)
    80002460:	02010113          	addi	sp,sp,32
    80002464:	00008067          	ret

0000000080002468 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    80002468:	fe010113          	addi	sp,sp,-32
    8000246c:	00113c23          	sd	ra,24(sp)
    80002470:	00813823          	sd	s0,16(sp)
    80002474:	00913423          	sd	s1,8(sp)
    80002478:	02010413          	addi	s0,sp,32
    8000247c:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    80002480:	00004517          	auipc	a0,0x4
    80002484:	df850513          	addi	a0,a0,-520 # 80006278 <CONSOLE_STATUS+0x268>
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	760080e7          	jalr	1888(ra) # 80001be8 <_Z12kprintStringPKc>
    if(!fall_head)
    80002490:	0104b783          	ld	a5,16(s1)
    80002494:	04078a63          	beqz	a5,800024e8 <_ZN15MemoryAllocator14print_all_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80002498:	0104b483          	ld	s1,16(s1)
    8000249c:	06048063          	beqz	s1,800024fc <_ZN15MemoryAllocator14print_all_listEv+0x94>
        kprintInt((uint64)curr);
    800024a0:	00a00593          	li	a1,10
    800024a4:	00048513          	mv	a0,s1
    800024a8:	fffff097          	auipc	ra,0xfffff
    800024ac:	788080e7          	jalr	1928(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800024b0:	00004517          	auipc	a0,0x4
    800024b4:	e1050513          	addi	a0,a0,-496 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	730080e7          	jalr	1840(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    800024c0:	00a00593          	li	a1,10
    800024c4:	0084b503          	ld	a0,8(s1)
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	768080e7          	jalr	1896(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800024d0:	00004517          	auipc	a0,0x4
    800024d4:	df050513          	addi	a0,a0,-528 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800024d8:	fffff097          	auipc	ra,0xfffff
    800024dc:	710080e7          	jalr	1808(ra) # 80001be8 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    800024e0:	0004b483          	ld	s1,0(s1)
    800024e4:	fb9ff06f          	j	8000249c <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    800024e8:	00004517          	auipc	a0,0x4
    800024ec:	d5850513          	addi	a0,a0,-680 # 80006240 <CONSOLE_STATUS+0x230>
    800024f0:	fffff097          	auipc	ra,0xfffff
    800024f4:	6f8080e7          	jalr	1784(ra) # 80001be8 <_Z12kprintStringPKc>
    800024f8:	fa1ff06f          	j	80002498 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    800024fc:	00004517          	auipc	a0,0x4
    80002500:	d5c50513          	addi	a0,a0,-676 # 80006258 <CONSOLE_STATUS+0x248>
    80002504:	fffff097          	auipc	ra,0xfffff
    80002508:	6e4080e7          	jalr	1764(ra) # 80001be8 <_Z12kprintStringPKc>
    8000250c:	01813083          	ld	ra,24(sp)
    80002510:	01013403          	ld	s0,16(sp)
    80002514:	00813483          	ld	s1,8(sp)
    80002518:	02010113          	addi	sp,sp,32
    8000251c:	00008067          	ret

0000000080002520 <main>:
#include"../h/kernel_lib.h"

int main(){
    80002520:	fd010113          	addi	sp,sp,-48
    80002524:	02113423          	sd	ra,40(sp)
    80002528:	02813023          	sd	s0,32(sp)
    8000252c:	00913c23          	sd	s1,24(sp)
    80002530:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    80002534:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    80002538:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    8000253c:	00001097          	auipc	ra,0x1
    80002540:	58c080e7          	jalr	1420(ra) # 80003ac8 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    80002544:	fffff097          	auipc	ra,0xfffff
    80002548:	770080e7          	jalr	1904(ra) # 80001cb4 <_Z10kernelInitv>
    if(panic < 0){
    8000254c:	04054263          	bltz	a0,80002590 <main+0x70>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002550:	100027f3          	csrr	a5,sstatus
    80002554:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002558:	fd843483          	ld	s1,-40(s0)
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    8000255c:	00001097          	auipc	ra,0x1
    80002560:	4e8080e7          	jalr	1256(ra) # 80003a44 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002564:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    80002568:	00004517          	auipc	a0,0x4
    8000256c:	d6050513          	addi	a0,a0,-672 # 800062c8 <CONSOLE_STATUS+0x2b8>
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	678080e7          	jalr	1656(ra) # 80001be8 <_Z12kprintStringPKc>
    return 0;
    80002578:	00000513          	li	a0,0
    8000257c:	02813083          	ld	ra,40(sp)
    80002580:	02013403          	ld	s0,32(sp)
    80002584:	01813483          	ld	s1,24(sp)
    80002588:	03010113          	addi	sp,sp,48
    8000258c:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80002590:	00004517          	auipc	a0,0x4
    80002594:	d1050513          	addi	a0,a0,-752 # 800062a0 <CONSOLE_STATUS+0x290>
    80002598:	fffff097          	auipc	ra,0xfffff
    8000259c:	650080e7          	jalr	1616(ra) # 80001be8 <_Z12kprintStringPKc>
        return -1;
    800025a0:	fff00513          	li	a0,-1
    800025a4:	fd9ff06f          	j	8000257c <main+0x5c>

00000000800025a8 <_ZNK8TcbQueue6existsEP3TCB>:
#include"../h/ptr_queue.hpp"
#include"../h/kernel_funs.h"
#include"../h/tcb.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00813423          	sd	s0,8(sp)
    800025b0:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    800025b4:	00053783          	ld	a5,0(a0)
    800025b8:	00078863          	beqz	a5,800025c8 <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    800025bc:	00b78e63          	beq	a5,a1,800025d8 <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    800025c0:	0007b783          	ld	a5,0(a5)
    800025c4:	ff5ff06f          	j	800025b8 <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    800025c8:	00000513          	li	a0,0
}
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret
            return true;
    800025d8:	00100513          	li	a0,1
    800025dc:	ff1ff06f          	j	800025cc <_ZNK8TcbQueue6existsEP3TCB+0x24>

00000000800025e0 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    800025e0:	ff010113          	addi	sp,sp,-16
    800025e4:	00813423          	sd	s0,8(sp)
    800025e8:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    800025ec:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    800025f0:	00853783          	ld	a5,8(a0)
    800025f4:	02078263          	beqz	a5,80002618 <_ZN8TcbQueue6insertEP3TCB+0x38>
    800025f8:	00b7b023          	sd	a1,0(a5)
    800025fc:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    80002600:	01052783          	lw	a5,16(a0)
    80002604:	0017879b          	addiw	a5,a5,1
    80002608:	00f52823          	sw	a5,16(a0)
    return *this;
}
    8000260c:	00813403          	ld	s0,8(sp)
    80002610:	01010113          	addi	sp,sp,16
    80002614:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80002618:	00b53023          	sd	a1,0(a0)
    8000261c:	fe1ff06f          	j	800025fc <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080002620 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80002620:	ff010113          	addi	sp,sp,-16
    80002624:	00813423          	sd	s0,8(sp)
    80002628:	01010413          	addi	s0,sp,16
    8000262c:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80002630:	00053503          	ld	a0,0(a0)
    80002634:	02050263          	beqz	a0,80002658 <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80002638:	0087b703          	ld	a4,8(a5)
    8000263c:	02e50463          	beq	a0,a4,80002664 <_ZN8TcbQueue6removeEv+0x44>
    80002640:	00053703          	ld	a4,0(a0)
    80002644:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    80002648:	00053023          	sd	zero,0(a0)
        tmpNum--;
    8000264c:	0107a703          	lw	a4,16(a5)
    80002650:	fff7071b          	addiw	a4,a4,-1
    80002654:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    80002658:	00813403          	ld	s0,8(sp)
    8000265c:	01010113          	addi	sp,sp,16
    80002660:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    80002664:	0007b423          	sd	zero,8(a5)
    80002668:	00000713          	li	a4,0
    8000266c:	fd9ff06f          	j	80002644 <_ZN8TcbQueue6removeEv+0x24>

0000000080002670 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80002670:	ff010113          	addi	sp,sp,-16
    80002674:	00813423          	sd	s0,8(sp)
    80002678:	01010413          	addi	s0,sp,16
    return head;
}
    8000267c:	00053503          	ld	a0,0(a0)
    80002680:	00813403          	ld	s0,8(sp)
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00008067          	ret

000000008000268c <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    8000268c:	fe010113          	addi	sp,sp,-32
    80002690:	00113c23          	sd	ra,24(sp)
    80002694:	00813823          	sd	s0,16(sp)
    80002698:	00913423          	sd	s1,8(sp)
    8000269c:	02010413          	addi	s0,sp,32
    TCB* t = head;
    800026a0:	00053483          	ld	s1,0(a0)
    while(t){
    800026a4:	02048e63          	beqz	s1,800026e0 <_ZN8TcbQueue10printQueueEv+0x54>
        kprintString("-> ");
    800026a8:	00004517          	auipc	a0,0x4
    800026ac:	c4050513          	addi	a0,a0,-960 # 800062e8 <CONSOLE_STATUS+0x2d8>
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	538080e7          	jalr	1336(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    800026b8:	00a00593          	li	a1,10
    800026bc:	00048513          	mv	a0,s1
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	570080e7          	jalr	1392(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800026c8:	00004517          	auipc	a0,0x4
    800026cc:	bf850513          	addi	a0,a0,-1032 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	518080e7          	jalr	1304(ra) # 80001be8 <_Z12kprintStringPKc>
        t = t->next;            
    800026d8:	0004b483          	ld	s1,0(s1)
    while(t){
    800026dc:	fc9ff06f          	j	800026a4 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    800026e0:	00004517          	auipc	a0,0x4
    800026e4:	be050513          	addi	a0,a0,-1056 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	500080e7          	jalr	1280(ra) # 80001be8 <_Z12kprintStringPKc>
}
    800026f0:	01813083          	ld	ra,24(sp)
    800026f4:	01013403          	ld	s0,16(sp)
    800026f8:	00813483          	ld	s1,8(sp)
    800026fc:	02010113          	addi	sp,sp,32
    80002700:	00008067          	ret

0000000080002704 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    80002704:	fc010113          	addi	sp,sp,-64
    80002708:	02113c23          	sd	ra,56(sp)
    8000270c:	02813823          	sd	s0,48(sp)
    80002710:	02913423          	sd	s1,40(sp)
    80002714:	03213023          	sd	s2,32(sp)
    80002718:	01313c23          	sd	s3,24(sp)
    8000271c:	01413823          	sd	s4,16(sp)
    80002720:	01513423          	sd	s5,8(sp)
    80002724:	04010413          	addi	s0,sp,64
    80002728:	00050a93          	mv	s5,a0
    8000272c:	00058913          	mv	s2,a1
    80002730:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    80002734:	00053483          	ld	s1,0(a0)
    80002738:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    8000273c:	02048063          	beqz	s1,8000275c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80002740:	00048593          	mv	a1,s1
    80002744:	00090513          	mv	a0,s2
    80002748:	000a00e7          	jalr	s4
    8000274c:	00054863          	bltz	a0,8000275c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80002750:	00048993          	mv	s3,s1
        cur = cur->next;
    80002754:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80002758:	fe5ff06f          	j	8000273c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    8000275c:	04098063          	beqz	s3,8000279c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80002760:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    80002764:	04048a63          	beqz	s1,800027b8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    80002768:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    8000276c:	010aa783          	lw	a5,16(s5)
    80002770:	0017879b          	addiw	a5,a5,1
    80002774:	00faa823          	sw	a5,16(s5)
}
    80002778:	03813083          	ld	ra,56(sp)
    8000277c:	03013403          	ld	s0,48(sp)
    80002780:	02813483          	ld	s1,40(sp)
    80002784:	02013903          	ld	s2,32(sp)
    80002788:	01813983          	ld	s3,24(sp)
    8000278c:	01013a03          	ld	s4,16(sp)
    80002790:	00813a83          	ld	s5,8(sp)
    80002794:	04010113          	addi	sp,sp,64
    80002798:	00008067          	ret
        info->next = head;
    8000279c:	000ab783          	ld	a5,0(s5)
    800027a0:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    800027a4:	00078663          	beqz	a5,800027b0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    800027a8:	012ab023          	sd	s2,0(s5)
    800027ac:	fc1ff06f          	j	8000276c <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    800027b0:	012ab423          	sd	s2,8(s5)
    800027b4:	ff5ff06f          	j	800027a8 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    800027b8:	012ab423          	sd	s2,8(s5)
    800027bc:	fadff06f          	j	80002768 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

00000000800027c0 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    800027c0:	ff010113          	addi	sp,sp,-16
    800027c4:	00813423          	sd	s0,8(sp)
    800027c8:	01010413          	addi	s0,sp,16
    info->next = head;
    800027cc:	00053783          	ld	a5,0(a0)
    800027d0:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    800027d4:	02078063          	beqz	a5,800027f4 <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    800027d8:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    800027dc:	01052783          	lw	a5,16(a0)
    800027e0:	0017879b          	addiw	a5,a5,1
    800027e4:	00f52823          	sw	a5,16(a0)
    800027e8:	00813403          	ld	s0,8(sp)
    800027ec:	01010113          	addi	sp,sp,16
    800027f0:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    800027f4:	00b53423          	sd	a1,8(a0)
    800027f8:	fe1ff06f          	j	800027d8 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

00000000800027fc <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00813423          	sd	s0,8(sp)
    80002804:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    80002808:	00852683          	lw	a3,8(a0)
    8000280c:	0085a703          	lw	a4,8(a1)
    80002810:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    80002814:	0007cc63          	bltz	a5,8000282c <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    80002818:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    8000281c:	00078513          	mv	a0,a5
    80002820:	00813403          	ld	s0,8(sp)
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00008067          	ret
        x2->sleep_time = -diff;
    8000282c:	40d7073b          	subw	a4,a4,a3
    80002830:	00e5b423          	sd	a4,8(a1)
    80002834:	fe9ff06f          	j	8000281c <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

0000000080002838 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    80002838:	ff010113          	addi	sp,sp,-16
    8000283c:	00813423          	sd	s0,8(sp)
    80002840:	01010413          	addi	s0,sp,16
    80002844:	00100793          	li	a5,1
    80002848:	00f50863          	beq	a0,a5,80002858 <_Z41__static_initialization_and_destruction_0ii+0x20>
    8000284c:	00813403          	ld	s0,8(sp)
    80002850:	01010113          	addi	sp,sp,16
    80002854:	00008067          	ret
    80002858:	000107b7          	lui	a5,0x10
    8000285c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002860:	fef596e3          	bne	a1,a5,8000284c <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80002864:	00005797          	auipc	a5,0x5
    80002868:	e5478793          	addi	a5,a5,-428 # 800076b8 <_ZN9Scheduler5queueE>
    8000286c:	0007b023          	sd	zero,0(a5)
    80002870:	0007b423          	sd	zero,8(a5)
    80002874:	0007a823          	sw	zero,16(a5)
    80002878:	0007bc23          	sd	zero,24(a5)
    8000287c:	0207b023          	sd	zero,32(a5)
    80002880:	0207a423          	sw	zero,40(a5)
    80002884:	fc9ff06f          	j	8000284c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002888 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80002888:	ff010113          	addi	sp,sp,-16
    8000288c:	00113423          	sd	ra,8(sp)
    80002890:	00813023          	sd	s0,0(sp)
    80002894:	01010413          	addi	s0,sp,16
    80002898:	00005517          	auipc	a0,0x5
    8000289c:	e2050513          	addi	a0,a0,-480 # 800076b8 <_ZN9Scheduler5queueE>
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	d80080e7          	jalr	-640(ra) # 80002620 <_ZN8TcbQueue6removeEv>
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    800028b8:	ff010113          	addi	sp,sp,-16
    800028bc:	00113423          	sd	ra,8(sp)
    800028c0:	00813023          	sd	s0,0(sp)
    800028c4:	01010413          	addi	s0,sp,16
    800028c8:	00050593          	mv	a1,a0
    800028cc:	00005517          	auipc	a0,0x5
    800028d0:	dec50513          	addi	a0,a0,-532 # 800076b8 <_ZN9Scheduler5queueE>
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	d0c080e7          	jalr	-756(ra) # 800025e0 <_ZN8TcbQueue6insertEP3TCB>
    800028dc:	00813083          	ld	ra,8(sp)
    800028e0:	00013403          	ld	s0,0(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00813423          	sd	s0,8(sp)
    800028f4:	01010413          	addi	s0,sp,16
    800028f8:	00813403          	ld	s0,8(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret

0000000080002904 <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    80002904:	ff010113          	addi	sp,sp,-16
    80002908:	00813423          	sd	s0,8(sp)
    8000290c:	01010413          	addi	s0,sp,16
    80002910:	00813403          	ld	s0,8(sp)
    80002914:	01010113          	addi	sp,sp,16
    80002918:	00008067          	ret

000000008000291c <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    8000291c:	ff010113          	addi	sp,sp,-16
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	00813023          	sd	s0,0(sp)
    80002928:	01010413          	addi	s0,sp,16
    8000292c:	00005517          	auipc	a0,0x5
    80002930:	d8c50513          	addi	a0,a0,-628 # 800076b8 <_ZN9Scheduler5queueE>
    80002934:	00000097          	auipc	ra,0x0
    80002938:	d58080e7          	jalr	-680(ra) # 8000268c <_ZN8TcbQueue10printQueueEv>
    8000293c:	00813083          	ld	ra,8(sp)
    80002940:	00013403          	ld	s0,0(sp)
    80002944:	01010113          	addi	sp,sp,16
    80002948:	00008067          	ret

000000008000294c <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    8000294c:	ff010113          	addi	sp,sp,-16
    80002950:	00113423          	sd	ra,8(sp)
    80002954:	00813023          	sd	s0,0(sp)
    80002958:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    8000295c:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80002960:	00000617          	auipc	a2,0x0
    80002964:	e9c60613          	addi	a2,a2,-356 # 800027fc <_ZN9Scheduler3cmpEP3TCBS1_>
    80002968:	00050593          	mv	a1,a0
    8000296c:	00005517          	auipc	a0,0x5
    80002970:	d6450513          	addi	a0,a0,-668 # 800076d0 <_ZN9Scheduler8sleepingE>
    80002974:	00000097          	auipc	ra,0x0
    80002978:	d90080e7          	jalr	-624(ra) # 80002704 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret

000000008000298c <_ZN9Scheduler12update_sleepEv>:
{
    8000298c:	fe010113          	addi	sp,sp,-32
    80002990:	00113c23          	sd	ra,24(sp)
    80002994:	00813823          	sd	s0,16(sp)
    80002998:	00913423          	sd	s1,8(sp)
    8000299c:	01213023          	sd	s2,0(sp)
    800029a0:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    800029a4:	00005517          	auipc	a0,0x5
    800029a8:	d2c50513          	addi	a0,a0,-724 # 800076d0 <_ZN9Scheduler8sleepingE>
    800029ac:	00000097          	auipc	ra,0x0
    800029b0:	cc4080e7          	jalr	-828(ra) # 80002670 <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    800029b4:	04050e63          	beqz	a0,80002a10 <_ZN9Scheduler12update_sleepEv+0x84>
    800029b8:	00050493          	mv	s1,a0
    t->sleep_time--;
    800029bc:	00853783          	ld	a5,8(a0)
    800029c0:	fff78793          	addi	a5,a5,-1
    800029c4:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    800029c8:	04048463          	beqz	s1,80002a10 <_ZN9Scheduler12update_sleepEv+0x84>
    800029cc:	0084b783          	ld	a5,8(s1)
    800029d0:	04079063          	bnez	a5,80002a10 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    800029d4:	00005917          	auipc	s2,0x5
    800029d8:	cfc90913          	addi	s2,s2,-772 # 800076d0 <_ZN9Scheduler8sleepingE>
    800029dc:	00090513          	mv	a0,s2
    800029e0:	00000097          	auipc	ra,0x0
    800029e4:	c40080e7          	jalr	-960(ra) # 80002620 <_ZN8TcbQueue6removeEv>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
        allocator.mem_free(this->stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    800029e8:	00100793          	li	a5,1
    800029ec:	02f4a823          	sw	a5,48(s1)
        put(t);
    800029f0:	00048513          	mv	a0,s1
    800029f4:	00000097          	auipc	ra,0x0
    800029f8:	ec4080e7          	jalr	-316(ra) # 800028b8 <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    800029fc:	00090513          	mv	a0,s2
    80002a00:	00000097          	auipc	ra,0x0
    80002a04:	c70080e7          	jalr	-912(ra) # 80002670 <_ZN8TcbQueue3topEv>
    80002a08:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    80002a0c:	fbdff06f          	j	800029c8 <_ZN9Scheduler12update_sleepEv+0x3c>
    80002a10:	01813083          	ld	ra,24(sp)
    80002a14:	01013403          	ld	s0,16(sp)
    80002a18:	00813483          	ld	s1,8(sp)
    80002a1c:	00013903          	ld	s2,0(sp)
    80002a20:	02010113          	addi	sp,sp,32
    80002a24:	00008067          	ret

0000000080002a28 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80002a28:	ff010113          	addi	sp,sp,-16
    80002a2c:	00113423          	sd	ra,8(sp)
    80002a30:	00813023          	sd	s0,0(sp)
    80002a34:	01010413          	addi	s0,sp,16
    80002a38:	000105b7          	lui	a1,0x10
    80002a3c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002a40:	00100513          	li	a0,1
    80002a44:	00000097          	auipc	ra,0x0
    80002a48:	df4080e7          	jalr	-524(ra) # 80002838 <_Z41__static_initialization_and_destruction_0ii>
    80002a4c:	00813083          	ld	ra,8(sp)
    80002a50:	00013403          	ld	s0,0(sp)
    80002a54:	01010113          	addi	sp,sp,16
    80002a58:	00008067          	ret

0000000080002a5c <mem_alloc>:
#include"../lib/hw.h"
#include"../h/_thread.h"
#include"../h/_semaphore.h"

extern "C" void* mem_alloc(size_t size)
{
    80002a5c:	ff010113          	addi	sp,sp,-16
    80002a60:	00813423          	sd	s0,8(sp)
    80002a64:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80002a68:	fff50513          	addi	a0,a0,-1
    80002a6c:	00655513          	srli	a0,a0,0x6
    80002a70:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80002a74:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80002a78:	00100793          	li	a5,1
    80002a7c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002a80:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80002a84:	00050513          	mv	a0,a0
    
    return adr;  
}
    80002a88:	00813403          	ld	s0,8(sp)
    80002a8c:	01010113          	addi	sp,sp,16
    80002a90:	00008067          	ret

0000000080002a94 <mem_free>:

extern "C" int mem_free (void* adr)
{
    80002a94:	ff010113          	addi	sp,sp,-16
    80002a98:	00813423          	sd	s0,8(sp)
    80002a9c:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80002aa0:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80002aa4:	00200793          	li	a5,2
    80002aa8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002aac:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80002ab0:	00050513          	mv	a0,a0
    
    return ret;
}
    80002ab4:	0005051b          	sext.w	a0,a0
    80002ab8:	00813403          	ld	s0,8(sp)
    80002abc:	01010113          	addi	sp,sp,16
    80002ac0:	00008067          	ret

0000000080002ac4 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    80002ac4:	ff010113          	addi	sp,sp,-16
    80002ac8:	00813423          	sd	s0,8(sp)
    80002acc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80002ad0:	01300793          	li	a5,19
    80002ad4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002ad8:	00000073          	ecall
}
    80002adc:	00813403          	ld	s0,8(sp)
    80002ae0:	01010113          	addi	sp,sp,16
    80002ae4:	00008067          	ret

0000000080002ae8 <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    80002ae8:	06050e63          	beqz	a0,80002b64 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    80002aec:	08058063          	beqz	a1,80002b6c <thread_create+0x84>
{
    80002af0:	fd010113          	addi	sp,sp,-48
    80002af4:	02113423          	sd	ra,40(sp)
    80002af8:	02813023          	sd	s0,32(sp)
    80002afc:	00913c23          	sd	s1,24(sp)
    80002b00:	01213823          	sd	s2,16(sp)
    80002b04:	01313423          	sd	s3,8(sp)
    80002b08:	03010413          	addi	s0,sp,48
    80002b0c:	00060993          	mv	s3,a2
    80002b10:	00058913          	mv	s2,a1
    80002b14:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80002b18:	00001537          	lui	a0,0x1
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	f40080e7          	jalr	-192(ra) # 80002a5c <mem_alloc>
    if(stack_space == nullptr) return -3;
    80002b24:	04050863          	beqz	a0,80002b74 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    80002b28:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    80002b2c:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    80002b30:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    80002b34:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    80002b38:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    80002b3c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002b40:	00050513          	mv	a0,a0
    80002b44:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002b48:	02813083          	ld	ra,40(sp)
    80002b4c:	02013403          	ld	s0,32(sp)
    80002b50:	01813483          	ld	s1,24(sp)
    80002b54:	01013903          	ld	s2,16(sp)
    80002b58:	00813983          	ld	s3,8(sp)
    80002b5c:	03010113          	addi	sp,sp,48
    80002b60:	00008067          	ret
    if(handle == nullptr) return -1;
    80002b64:	fff00513          	li	a0,-1
    80002b68:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80002b6c:	ffe00513          	li	a0,-2
}
    80002b70:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80002b74:	ffd00513          	li	a0,-3
    80002b78:	fd1ff06f          	j	80002b48 <thread_create+0x60>

0000000080002b7c <thread_exit>:

extern "C" int thread_exit()
{
    80002b7c:	ff010113          	addi	sp,sp,-16
    80002b80:	00813423          	sd	s0,8(sp)
    80002b84:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    80002b88:	01200513          	li	a0,18
    asm volatile("ecall");
    80002b8c:	00000073          	ecall

    return ret;
}
    80002b90:	00000513          	li	a0,0
    80002b94:	00813403          	ld	s0,8(sp)
    80002b98:	01010113          	addi	sp,sp,16
    80002b9c:	00008067          	ret

0000000080002ba0 <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    80002ba0:	ff010113          	addi	sp,sp,-16
    80002ba4:	00813423          	sd	s0,8(sp)
    80002ba8:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    80002bac:	02050463          	beqz	a0,80002bd4 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    80002bb0:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    80002bb4:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    80002bb8:	02100513          	li	a0,33
    asm volatile("ecall");
    80002bbc:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002bc0:	00050513          	mv	a0,a0
    80002bc4:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002bc8:	00813403          	ld	s0,8(sp)
    80002bcc:	01010113          	addi	sp,sp,16
    80002bd0:	00008067          	ret
    if(handle == nullptr) return -1;
    80002bd4:	fff00513          	li	a0,-1
    80002bd8:	ff1ff06f          	j	80002bc8 <sem_open+0x28>

0000000080002bdc <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    80002bdc:	ff010113          	addi	sp,sp,-16
    80002be0:	00813423          	sd	s0,8(sp)
    80002be4:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    80002be8:	02050263          	beqz	a0,80002c0c <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    80002bec:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    80002bf0:	02200513          	li	a0,34
    asm volatile("ecall");
    80002bf4:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002bf8:	00050513          	mv	a0,a0
    80002bfc:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002c00:	00813403          	ld	s0,8(sp)
    80002c04:	01010113          	addi	sp,sp,16
    80002c08:	00008067          	ret
    if(handle == nullptr) return -1;
    80002c0c:	fff00513          	li	a0,-1
    80002c10:	ff1ff06f          	j	80002c00 <sem_close+0x24>

0000000080002c14 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    80002c14:	ff010113          	addi	sp,sp,-16
    80002c18:	00813423          	sd	s0,8(sp)
    80002c1c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    80002c20:	02050263          	beqz	a0,80002c44 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    80002c24:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    80002c28:	02300513          	li	a0,35
    asm volatile("ecall");
    80002c2c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002c30:	00050513          	mv	a0,a0
    80002c34:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002c38:	00813403          	ld	s0,8(sp)
    80002c3c:	01010113          	addi	sp,sp,16
    80002c40:	00008067          	ret
    if(id == nullptr) return -1;
    80002c44:	fff00513          	li	a0,-1
    80002c48:	ff1ff06f          	j	80002c38 <sem_wait+0x24>

0000000080002c4c <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00813423          	sd	s0,8(sp)
    80002c54:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    80002c58:	02050263          	beqz	a0,80002c7c <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80002c5c:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    80002c60:	02400513          	li	a0,36
    asm volatile("ecall");
    80002c64:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002c68:	00050513          	mv	a0,a0
    80002c6c:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002c70:	00813403          	ld	s0,8(sp)
    80002c74:	01010113          	addi	sp,sp,16
    80002c78:	00008067          	ret
    if(id == nullptr) return -1;
    80002c7c:	fff00513          	li	a0,-1
    80002c80:	ff1ff06f          	j	80002c70 <sem_signal+0x24>

0000000080002c84 <time_sleep>:

extern "C" int time_sleep(time_t time){
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00813423          	sd	s0,8(sp)
    80002c8c:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    80002c90:	02050263          	beqz	a0,80002cb4 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    80002c94:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    80002c98:	03100513          	li	a0,49
    asm volatile("ecall");
    80002c9c:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002ca0:	00050513          	mv	a0,a0
    80002ca4:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002ca8:	00813403          	ld	s0,8(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret
    if(time == 0) return -1;
    80002cb4:	fff00513          	li	a0,-1
    80002cb8:	ff1ff06f          	j	80002ca8 <time_sleep+0x24>

0000000080002cbc <getc>:

const int EOF = -1;
extern "C" char getc(){
    80002cbc:	ff010113          	addi	sp,sp,-16
    80002cc0:	00813423          	sd	s0,8(sp)
    80002cc4:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    80002cc8:	04100513          	li	a0,65
    asm volatile("ecall");
    80002ccc:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002cd0:	00050513          	mv	a0,a0
    80002cd4:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    80002cd8:	0ff00793          	li	a5,255
    80002cdc:	00a7ea63          	bltu	a5,a0,80002cf0 <getc+0x34>
    80002ce0:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    80002ce4:	00813403          	ld	s0,8(sp)
    80002ce8:	01010113          	addi	sp,sp,16
    80002cec:	00008067          	ret
    else return EOF;
    80002cf0:	0ff00513          	li	a0,255
    80002cf4:	ff1ff06f          	j	80002ce4 <getc+0x28>

0000000080002cf8 <putc>:

extern "C" void putc(char c){
    80002cf8:	ff010113          	addi	sp,sp,-16
    80002cfc:	00813423          	sd	s0,8(sp)
    80002d00:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    80002d04:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    80002d08:	04200513          	li	a0,66
    asm volatile("ecall");
    80002d0c:	00000073          	ecall
    80002d10:	00813403          	ld	s0,8(sp)
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00008067          	ret

0000000080002d1c <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813423          	sd	s0,8(sp)
    80002d24:	01010413          	addi	s0,sp,16
    80002d28:	00100793          	li	a5,1
    80002d2c:	00f50863          	beq	a0,a5,80002d3c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002d30:	00813403          	ld	s0,8(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret
    80002d3c:	000107b7          	lui	a5,0x10
    80002d40:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002d44:	fef596e3          	bne	a1,a5,80002d30 <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80002d48:	00003797          	auipc	a5,0x3
    80002d4c:	2c878793          	addi	a5,a5,712 # 80006010 <CONSOLE_STATUS>
    80002d50:	0007b783          	ld	a5,0(a5)
    80002d54:	00005717          	auipc	a4,0x5
    80002d58:	8ef73a23          	sd	a5,-1804(a4) # 80007648 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80002d5c:	00003797          	auipc	a5,0x3
    80002d60:	2a478793          	addi	a5,a5,676 # 80006000 <CONSOLE_RX_DATA>
    80002d64:	0007b783          	ld	a5,0(a5)
    80002d68:	00005717          	auipc	a4,0x5
    80002d6c:	8cf73c23          	sd	a5,-1832(a4) # 80007640 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80002d70:	00003797          	auipc	a5,0x3
    80002d74:	29878793          	addi	a5,a5,664 # 80006008 <CONSOLE_TX_DATA>
    80002d78:	0007b783          	ld	a5,0(a5)
    80002d7c:	00005717          	auipc	a4,0x5
    80002d80:	8af73e23          	sd	a5,-1860(a4) # 80007638 <_ZN5StdIO5odataE>
    80002d84:	fadff06f          	j	80002d30 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002d88 <_ZN5StdIO12outputWorkerEPv>:
{
    80002d88:	fc010113          	addi	sp,sp,-64
    80002d8c:	02113c23          	sd	ra,56(sp)
    80002d90:	02813823          	sd	s0,48(sp)
    80002d94:	02913423          	sd	s1,40(sp)
    80002d98:	03213023          	sd	s2,32(sp)
    80002d9c:	01313c23          	sd	s3,24(sp)
    80002da0:	01413823          	sd	s4,16(sp)
    80002da4:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    80002da8:	00005797          	auipc	a5,0x5
    80002dac:	8607b823          	sd	zero,-1936(a5) # 80007618 <_ZN5StdIO10out_threadE>
    80002db0:	0400006f          	j	80002df0 <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002db4:	100027f3          	csrr	a5,sstatus
    80002db8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002dbc:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80002dc0:	141027f3          	csrr	a5,sepc
    80002dc4:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80002dc8:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    80002dcc:	00005797          	auipc	a5,0x5
    80002dd0:	89c78793          	addi	a5,a5,-1892 # 80007668 <_ZN3TCB7runningE>
    80002dd4:	0007b783          	ld	a5,0(a5)
    80002dd8:	00005717          	auipc	a4,0x5
    80002ddc:	84f73023          	sd	a5,-1984(a4) # 80007618 <_ZN5StdIO10out_threadE>
            TCB::yield();
    80002de0:	00001097          	auipc	ra,0x1
    80002de4:	c64080e7          	jalr	-924(ra) # 80003a44 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002de8:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80002dec:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80002df0:	00005797          	auipc	a5,0x5
    80002df4:	85878793          	addi	a5,a5,-1960 # 80007648 <_ZN5StdIO8iostatusE>
    80002df8:	0007b783          	ld	a5,0(a5)
    80002dfc:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80002e00:	0207f793          	andi	a5,a5,32
    80002e04:	fa0788e3          	beqz	a5,80002db4 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80002e08:	00005797          	auipc	a5,0x5
    80002e0c:	82078793          	addi	a5,a5,-2016 # 80007628 <_ZN5StdIO7obufferE>
    80002e10:	0007b483          	ld	s1,0(a5)
    80002e14:	00005797          	auipc	a5,0x5
    80002e18:	82478793          	addi	a5,a5,-2012 # 80007638 <_ZN5StdIO5odataE>
    80002e1c:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80002e20:	42848513          	addi	a0,s1,1064
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	07c080e7          	jalr	124(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80002e2c:	40048913          	addi	s2,s1,1024
    80002e30:	00090513          	mv	a0,s2
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	06c080e7          	jalr	108(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80002e3c:	4804a783          	lw	a5,1152(s1)
    80002e40:	fff7879b          	addiw	a5,a5,-1
    80002e44:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80002e48:	4784a783          	lw	a5,1144(s1)
    80002e4c:	00f48733          	add	a4,s1,a5
    80002e50:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80002e54:	0017879b          	addiw	a5,a5,1
    80002e58:	41f7d71b          	sraiw	a4,a5,0x1f
    80002e5c:	0167571b          	srliw	a4,a4,0x16
    80002e60:	00e787bb          	addw	a5,a5,a4
    80002e64:	3ff7f793          	andi	a5,a5,1023
    80002e68:	40e787bb          	subw	a5,a5,a4
    80002e6c:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    80002e70:	45048513          	addi	a0,s1,1104
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	0b0080e7          	jalr	176(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80002e7c:	00090513          	mv	a0,s2
    80002e80:	fffff097          	auipc	ra,0xfffff
    80002e84:	0a4080e7          	jalr	164(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    80002e88:	01498023          	sb	s4,0(s3)
    80002e8c:	f65ff06f          	j	80002df0 <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080002e90 <_ZN5StdIO9initalizeEv>:
{
    80002e90:	fd010113          	addi	sp,sp,-48
    80002e94:	02113423          	sd	ra,40(sp)
    80002e98:	02813023          	sd	s0,32(sp)
    80002e9c:	00913c23          	sd	s1,24(sp)
    80002ea0:	01213823          	sd	s2,16(sp)
    80002ea4:	01313423          	sd	s3,8(sp)
    80002ea8:	03010413          	addi	s0,sp,48
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002eac:	fffff097          	auipc	ra,0xfffff
    80002eb0:	1fc080e7          	jalr	508(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80002eb4:	01300593          	li	a1,19
    80002eb8:	fffff097          	auipc	ra,0xfffff
    80002ebc:	264080e7          	jalr	612(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80002ec0:	40050793          	addi	a5,a0,1024 # 1400 <_entry-0x7fffec00>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    80002ec4:	00100913          	li	s2,1
    80002ec8:	41252423          	sw	s2,1032(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80002ecc:	40053823          	sd	zero,1040(a0)
    80002ed0:	40053c23          	sd	zero,1048(a0)
    80002ed4:	42052023          	sw	zero,1056(a0)
    {
        next = activeSemaphores;
    80002ed8:	00004497          	auipc	s1,0x4
    80002edc:	73848493          	addi	s1,s1,1848 # 80007610 <_ZN10KSemaphore16activeSemaphoresE>
    80002ee0:	0004b703          	ld	a4,0(s1)
    80002ee4:	40e53023          	sd	a4,1024(a0)
    80002ee8:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80002eec:	42052823          	sw	zero,1072(a0)
    80002ef0:	42053c23          	sd	zero,1080(a0)
    80002ef4:	44053023          	sd	zero,1088(a0)
    80002ef8:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80002efc:	42f53423          	sd	a5,1064(a0)
    80002f00:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80002f04:	40000993          	li	s3,1024
    80002f08:	45352c23          	sw	s3,1112(a0)
    80002f0c:	46053023          	sd	zero,1120(a0)
    80002f10:	46053423          	sd	zero,1128(a0)
    80002f14:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80002f18:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80002f1c:	00f4b023          	sd	a5,0(s1)
    80002f20:	46052c23          	sw	zero,1144(a0)
    80002f24:	46052e23          	sw	zero,1148(a0)
    80002f28:	48052023          	sw	zero,1152(a0)
    ibuffer = new SharedBuffer<char>();
    80002f2c:	00004797          	auipc	a5,0x4
    80002f30:	70a7b223          	sd	a0,1796(a5) # 80007630 <_ZN5StdIO7ibufferE>
    80002f34:	fffff097          	auipc	ra,0xfffff
    80002f38:	174080e7          	jalr	372(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80002f3c:	01300593          	li	a1,19
    80002f40:	fffff097          	auipc	ra,0xfffff
    80002f44:	1dc080e7          	jalr	476(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    80002f48:	40050793          	addi	a5,a0,1024
    KSemaphore(unsigned val):val(val)
    80002f4c:	41252423          	sw	s2,1032(a0)
    80002f50:	40053823          	sd	zero,1040(a0)
    80002f54:	40053c23          	sd	zero,1048(a0)
    80002f58:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores;
    80002f5c:	0004b703          	ld	a4,0(s1)
    80002f60:	40e53023          	sd	a4,1024(a0)
    80002f64:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80002f68:	42052823          	sw	zero,1072(a0)
    80002f6c:	42053c23          	sd	zero,1080(a0)
    80002f70:	44053023          	sd	zero,1088(a0)
    80002f74:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80002f78:	42f53423          	sd	a5,1064(a0)
    80002f7c:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80002f80:	45352c23          	sw	s3,1112(a0)
    80002f84:	46053023          	sd	zero,1120(a0)
    80002f88:	46053423          	sd	zero,1128(a0)
    80002f8c:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80002f90:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80002f94:	00f4b023          	sd	a5,0(s1)
    80002f98:	46052c23          	sw	zero,1144(a0)
    80002f9c:	46052e23          	sw	zero,1148(a0)
    80002fa0:	48052023          	sw	zero,1152(a0)
    obuffer = new SharedBuffer<char>();
    80002fa4:	00004797          	auipc	a5,0x4
    80002fa8:	68a7b223          	sd	a0,1668(a5) # 80007628 <_ZN5StdIO7obufferE>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002fac:	fffff097          	auipc	ra,0xfffff
    80002fb0:	0fc080e7          	jalr	252(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80002fb4:	00100593          	li	a1,1
    80002fb8:	fffff097          	auipc	ra,0xfffff
    80002fbc:	164080e7          	jalr	356(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80002fc0:	00052423          	sw	zero,8(a0)
    80002fc4:	00053823          	sd	zero,16(a0)
    80002fc8:	00053c23          	sd	zero,24(a0)
    80002fcc:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80002fd0:	0004b783          	ld	a5,0(s1)
    80002fd4:	00f53023          	sd	a5,0(a0)
        activeSemaphores = this;
    80002fd8:	00a4b023          	sd	a0,0(s1)
    blockSem = new KSemaphore(0);
    80002fdc:	00004797          	auipc	a5,0x4
    80002fe0:	64a7b223          	sd	a0,1604(a5) # 80007620 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80002fe4:	00003797          	auipc	a5,0x3
    80002fe8:	02c78793          	addi	a5,a5,44 # 80006010 <CONSOLE_STATUS>
    80002fec:	0007b783          	ld	a5,0(a5)
    80002ff0:	00004717          	auipc	a4,0x4
    80002ff4:	64f73c23          	sd	a5,1624(a4) # 80007648 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80002ff8:	00003797          	auipc	a5,0x3
    80002ffc:	00878793          	addi	a5,a5,8 # 80006000 <CONSOLE_RX_DATA>
    80003000:	0007b783          	ld	a5,0(a5)
    80003004:	00004717          	auipc	a4,0x4
    80003008:	62f73e23          	sd	a5,1596(a4) # 80007640 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    8000300c:	00003797          	auipc	a5,0x3
    80003010:	ffc78793          	addi	a5,a5,-4 # 80006008 <CONSOLE_TX_DATA>
    80003014:	0007b783          	ld	a5,0(a5)
    80003018:	00004717          	auipc	a4,0x4
    8000301c:	62f73023          	sd	a5,1568(a4) # 80007638 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80003020:	fffff097          	auipc	ra,0xfffff
    80003024:	088080e7          	jalr	136(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80003028:	04000593          	li	a1,64
    8000302c:	fffff097          	auipc	ra,0xfffff
    80003030:	0f0080e7          	jalr	240(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80003034:	00050613          	mv	a2,a0
    80003038:	00000593          	li	a1,0
    8000303c:	00000517          	auipc	a0,0x0
    80003040:	d4c50513          	addi	a0,a0,-692 # 80002d88 <_ZN5StdIO12outputWorkerEPv>
    80003044:	00000097          	auipc	ra,0x0
    80003048:	64c080e7          	jalr	1612(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000304c:	00004797          	auipc	a5,0x4
    80003050:	5ca7b623          	sd	a0,1484(a5) # 80007618 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80003054:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80003058:	03250b23          	sb	s2,54(a0)
}
    8000305c:	02813083          	ld	ra,40(sp)
    80003060:	02013403          	ld	s0,32(sp)
    80003064:	01813483          	ld	s1,24(sp)
    80003068:	01013903          	ld	s2,16(sp)
    8000306c:	00813983          	ld	s3,8(sp)
    80003070:	03010113          	addi	sp,sp,48
    80003074:	00008067          	ret

0000000080003078 <_ZN5StdIO11inputWorkerEv>:
{
    80003078:	ff010113          	addi	sp,sp,-16
    8000307c:	00813423          	sd	s0,8(sp)
    80003080:	01010413          	addi	s0,sp,16
}
    80003084:	00813403          	ld	s0,8(sp)
    80003088:	01010113          	addi	sp,sp,16
    8000308c:	00008067          	ret

0000000080003090 <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    80003090:	fc010113          	addi	sp,sp,-64
    80003094:	02113c23          	sd	ra,56(sp)
    80003098:	02813823          	sd	s0,48(sp)
    8000309c:	02913423          	sd	s1,40(sp)
    800030a0:	03213023          	sd	s2,32(sp)
    800030a4:	01313c23          	sd	s3,24(sp)
    800030a8:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    800030ac:	00001097          	auipc	ra,0x1
    800030b0:	2d8080e7          	jalr	728(ra) # 80004384 <plic_claim>
    if(t == CONSOLE_IRQ)
    800030b4:	00a00793          	li	a5,10
    800030b8:	12f51063          	bne	a0,a5,800031d8 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    800030bc:	00004797          	auipc	a5,0x4
    800030c0:	58c78793          	addi	a5,a5,1420 # 80007648 <_ZN5StdIO8iostatusE>
    800030c4:	0007b783          	ld	a5,0(a5)
    800030c8:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    800030cc:	0017f793          	andi	a5,a5,1
    800030d0:	0a078263          	beqz	a5,80003174 <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    800030d4:	00004797          	auipc	a5,0x4
    800030d8:	56c78793          	addi	a5,a5,1388 # 80007640 <_ZN5StdIO5idataE>
    800030dc:	0007b783          	ld	a5,0(a5)
    800030e0:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    800030e4:	00a00513          	li	a0,10
    800030e8:	00001097          	auipc	ra,0x1
    800030ec:	2d4080e7          	jalr	724(ra) # 800043bc <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    800030f0:	00004797          	auipc	a5,0x4
    800030f4:	54078793          	addi	a5,a5,1344 # 80007630 <_ZN5StdIO7ibufferE>
    800030f8:	0007b483          	ld	s1,0(a5)
    800030fc:	4804a703          	lw	a4,1152(s1)
    80003100:	3ff00793          	li	a5,1023
    80003104:	0ce7ce63          	blt	a5,a4,800031e0 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80003108:	45048513          	addi	a0,s1,1104
    8000310c:	fffff097          	auipc	ra,0xfffff
    80003110:	d94080e7          	jalr	-620(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80003114:	40048993          	addi	s3,s1,1024
    80003118:	00098513          	mv	a0,s3
    8000311c:	fffff097          	auipc	ra,0xfffff
    80003120:	d84080e7          	jalr	-636(ra) # 80001ea0 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80003124:	4804a783          	lw	a5,1152(s1)
    80003128:	0017879b          	addiw	a5,a5,1
    8000312c:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    80003130:	47c4a783          	lw	a5,1148(s1)
    80003134:	00f48733          	add	a4,s1,a5
    80003138:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    8000313c:	0017879b          	addiw	a5,a5,1
    80003140:	41f7d71b          	sraiw	a4,a5,0x1f
    80003144:	0167571b          	srliw	a4,a4,0x16
    80003148:	00e787bb          	addw	a5,a5,a4
    8000314c:	3ff7f793          	andi	a5,a5,1023
    80003150:	40e787bb          	subw	a5,a5,a4
    80003154:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    80003158:	42848513          	addi	a0,s1,1064
    8000315c:	fffff097          	auipc	ra,0xfffff
    80003160:	dc8080e7          	jalr	-568(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80003164:	00098513          	mv	a0,s3
    80003168:	fffff097          	auipc	ra,0xfffff
    8000316c:	dbc080e7          	jalr	-580(ra) # 80001f24 <_ZN10KSemaphore6signalEv>
    80003170:	0700006f          	j	800031e0 <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    80003174:	00a00513          	li	a0,10
    80003178:	00001097          	auipc	ra,0x1
    8000317c:	244080e7          	jalr	580(ra) # 800043bc <plic_complete>
            if(out_thread != nullptr)
    80003180:	00004797          	auipc	a5,0x4
    80003184:	49878793          	addi	a5,a5,1176 # 80007618 <_ZN5StdIO10out_threadE>
    80003188:	0007b783          	ld	a5,0(a5)
    8000318c:	04078a63          	beqz	a5,800031e0 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80003190:	100027f3          	csrr	a5,sstatus
    80003194:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80003198:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    8000319c:	141027f3          	csrr	a5,sepc
    800031a0:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800031a4:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    800031a8:	00004797          	auipc	a5,0x4
    800031ac:	47078793          	addi	a5,a5,1136 # 80007618 <_ZN5StdIO10out_threadE>
    800031b0:	0007b583          	ld	a1,0(a5)
    800031b4:	00004517          	auipc	a0,0x4
    800031b8:	50450513          	addi	a0,a0,1284 # 800076b8 <_ZN9Scheduler5queueE>
    800031bc:	fffff097          	auipc	ra,0xfffff
    800031c0:	604080e7          	jalr	1540(ra) # 800027c0 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    800031c4:	00001097          	auipc	ra,0x1
    800031c8:	880080e7          	jalr	-1920(ra) # 80003a44 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800031cc:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800031d0:	14149073          	csrw	sepc,s1
    800031d4:	00c0006f          	j	800031e0 <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    800031d8:	00001097          	auipc	ra,0x1
    800031dc:	1e4080e7          	jalr	484(ra) # 800043bc <plic_complete>
    800031e0:	03813083          	ld	ra,56(sp)
    800031e4:	03013403          	ld	s0,48(sp)
    800031e8:	02813483          	ld	s1,40(sp)
    800031ec:	02013903          	ld	s2,32(sp)
    800031f0:	01813983          	ld	s3,24(sp)
    800031f4:	04010113          	addi	sp,sp,64
    800031f8:	00008067          	ret

00000000800031fc <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00113423          	sd	ra,8(sp)
    80003204:	00813023          	sd	s0,0(sp)
    80003208:	01010413          	addi	s0,sp,16
    8000320c:	000105b7          	lui	a1,0x10
    80003210:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003214:	00100513          	li	a0,1
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	b04080e7          	jalr	-1276(ra) # 80002d1c <_Z41__static_initialization_and_destruction_0ii>
    80003220:	00813083          	ld	ra,8(sp)
    80003224:	00013403          	ld	s0,0(sp)
    80003228:	01010113          	addi	sp,sp,16
    8000322c:	00008067          	ret

0000000080003230 <_ZN6Thread10runWrapperEPv>:
        thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    80003230:	ff010113          	addi	sp,sp,-16
    80003234:	00113423          	sd	ra,8(sp)
    80003238:	00813023          	sd	s0,0(sp)
    8000323c:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    80003240:	00053783          	ld	a5,0(a0)
    80003244:	0107b783          	ld	a5,16(a5)
    80003248:	000780e7          	jalr	a5
}
    8000324c:	00813083          	ld	ra,8(sp)
    80003250:	00013403          	ld	s0,0(sp)
    80003254:	01010113          	addi	sp,sp,16
    80003258:	00008067          	ret

000000008000325c <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    8000325c:	fe010113          	addi	sp,sp,-32
    80003260:	00113c23          	sd	ra,24(sp)
    80003264:	00813823          	sd	s0,16(sp)
    80003268:	00913423          	sd	s1,8(sp)
    8000326c:	02010413          	addi	s0,sp,32
    80003270:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    80003274:	02050263          	beqz	a0,80003298 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    80003278:	0004b503          	ld	a0,0(s1)
    8000327c:	00053783          	ld	a5,0(a0)
    80003280:	0187b783          	ld	a5,24(a5)
    80003284:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80003288:	0084b503          	ld	a0,8(s1)
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	9f8080e7          	jalr	-1544(ra) # 80002c84 <time_sleep>
    80003294:	fe5ff06f          	j	80003278 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    80003298:	01813083          	ld	ra,24(sp)
    8000329c:	01013403          	ld	s0,16(sp)
    800032a0:	00813483          	ld	s1,8(sp)
    800032a4:	02010113          	addi	sp,sp,32
    800032a8:	00008067          	ret

00000000800032ac <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    800032ac:	ff010113          	addi	sp,sp,-16
    800032b0:	00113423          	sd	ra,8(sp)
    800032b4:	00813023          	sd	s0,0(sp)
    800032b8:	01010413          	addi	s0,sp,16
    800032bc:	fffff097          	auipc	ra,0xfffff
    800032c0:	7a0080e7          	jalr	1952(ra) # 80002a5c <mem_alloc>
    800032c4:	00813083          	ld	ra,8(sp)
    800032c8:	00013403          	ld	s0,0(sp)
    800032cc:	01010113          	addi	sp,sp,16
    800032d0:	00008067          	ret

00000000800032d4 <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    800032d4:	ff010113          	addi	sp,sp,-16
    800032d8:	00113423          	sd	ra,8(sp)
    800032dc:	00813023          	sd	s0,0(sp)
    800032e0:	01010413          	addi	s0,sp,16
    800032e4:	fffff097          	auipc	ra,0xfffff
    800032e8:	7b0080e7          	jalr	1968(ra) # 80002a94 <mem_free>
    800032ec:	00813083          	ld	ra,8(sp)
    800032f0:	00013403          	ld	s0,0(sp)
    800032f4:	01010113          	addi	sp,sp,16
    800032f8:	00008067          	ret

00000000800032fc <_ZN6ThreadD1Ev>:
Thread::~Thread()
    800032fc:	ff010113          	addi	sp,sp,-16
    80003300:	00113423          	sd	ra,8(sp)
    80003304:	00813023          	sd	s0,0(sp)
    80003308:	01010413          	addi	s0,sp,16
    8000330c:	00003797          	auipc	a5,0x3
    80003310:	02478793          	addi	a5,a5,36 # 80006330 <_ZTV6Thread+0x10>
    80003314:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    80003318:	00853503          	ld	a0,8(a0)
    delete w->handle;
    8000331c:	00053783          	ld	a5,0(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    80003320:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80003324:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80003328:	00000073          	ecall
    delete w;
    8000332c:	00000097          	auipc	ra,0x0
    80003330:	fa8080e7          	jalr	-88(ra) # 800032d4 <_ZdlPv>
}
    80003334:	00813083          	ld	ra,8(sp)
    80003338:	00013403          	ld	s0,0(sp)
    8000333c:	01010113          	addi	sp,sp,16
    80003340:	00008067          	ret

0000000080003344 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80003344:	fe010113          	addi	sp,sp,-32
    80003348:	00113c23          	sd	ra,24(sp)
    8000334c:	00813823          	sd	s0,16(sp)
    80003350:	00913423          	sd	s1,8(sp)
    80003354:	02010413          	addi	s0,sp,32
    80003358:	00050493          	mv	s1,a0
}
    8000335c:	00000097          	auipc	ra,0x0
    80003360:	fa0080e7          	jalr	-96(ra) # 800032fc <_ZN6ThreadD1Ev>
    80003364:	00048513          	mv	a0,s1
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	f6c080e7          	jalr	-148(ra) # 800032d4 <_ZdlPv>
    80003370:	01813083          	ld	ra,24(sp)
    80003374:	01013403          	ld	s0,16(sp)
    80003378:	00813483          	ld	s1,8(sp)
    8000337c:	02010113          	addi	sp,sp,32
    80003380:	00008067          	ret

0000000080003384 <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    80003384:	ff010113          	addi	sp,sp,-16
    80003388:	00113423          	sd	ra,8(sp)
    8000338c:	00813023          	sd	s0,0(sp)
    80003390:	01010413          	addi	s0,sp,16
    80003394:	fffff097          	auipc	ra,0xfffff
    80003398:	6c8080e7          	jalr	1736(ra) # 80002a5c <mem_alloc>
    8000339c:	00813083          	ld	ra,8(sp)
    800033a0:	00013403          	ld	s0,0(sp)
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00008067          	ret

00000000800033ac <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    800033ac:	ff010113          	addi	sp,sp,-16
    800033b0:	00113423          	sd	ra,8(sp)
    800033b4:	00813023          	sd	s0,0(sp)
    800033b8:	01010413          	addi	s0,sp,16
    800033bc:	fffff097          	auipc	ra,0xfffff
    800033c0:	6d8080e7          	jalr	1752(ra) # 80002a94 <mem_free>
    800033c4:	00813083          	ld	ra,8(sp)
    800033c8:	00013403          	ld	s0,0(sp)
    800033cc:	01010113          	addi	sp,sp,16
    800033d0:	00008067          	ret

00000000800033d4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    800033d4:	fd010113          	addi	sp,sp,-48
    800033d8:	02113423          	sd	ra,40(sp)
    800033dc:	02813023          	sd	s0,32(sp)
    800033e0:	00913c23          	sd	s1,24(sp)
    800033e4:	01213823          	sd	s2,16(sp)
    800033e8:	01313423          	sd	s3,8(sp)
    800033ec:	03010413          	addi	s0,sp,48
    800033f0:	00050493          	mv	s1,a0
    800033f4:	00058993          	mv	s3,a1
    800033f8:	00060913          	mv	s2,a2
    800033fc:	00003797          	auipc	a5,0x3
    80003400:	f3478793          	addi	a5,a5,-204 # 80006330 <_ZTV6Thread+0x10>
    80003404:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    80003408:	01800513          	li	a0,24
    8000340c:	00000097          	auipc	ra,0x0
    80003410:	ea0080e7          	jalr	-352(ra) # 800032ac <_Znwm>
    80003414:	00053023          	sd	zero,0(a0)
    80003418:	01353423          	sd	s3,8(a0)
    8000341c:	01253823          	sd	s2,16(a0)
    80003420:	00a4b423          	sd	a0,8(s1)
}
    80003424:	02813083          	ld	ra,40(sp)
    80003428:	02013403          	ld	s0,32(sp)
    8000342c:	01813483          	ld	s1,24(sp)
    80003430:	01013903          	ld	s2,16(sp)
    80003434:	00813983          	ld	s3,8(sp)
    80003438:	03010113          	addi	sp,sp,48
    8000343c:	00008067          	ret

0000000080003440 <_ZN6Thread5startEv>:
void Thread::start(){
    80003440:	fe010113          	addi	sp,sp,-32
    80003444:	00113c23          	sd	ra,24(sp)
    80003448:	00813823          	sd	s0,16(sp)
    8000344c:	00913423          	sd	s1,8(sp)
    80003450:	02010413          	addi	s0,sp,32
    80003454:	00050493          	mv	s1,a0
    if(myHandle)
    80003458:	00853503          	ld	a0,8(a0)
    8000345c:	02050463          	beqz	a0,80003484 <_ZN6Thread5startEv+0x44>
        thread_create(&w->handle, w->body, w->arg);    
    80003460:	01053603          	ld	a2,16(a0)
    80003464:	00853583          	ld	a1,8(a0)
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	680080e7          	jalr	1664(ra) # 80002ae8 <thread_create>
}
    80003470:	01813083          	ld	ra,24(sp)
    80003474:	01013403          	ld	s0,16(sp)
    80003478:	00813483          	ld	s1,8(sp)
    8000347c:	02010113          	addi	sp,sp,32
    80003480:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    80003484:	01800513          	li	a0,24
    80003488:	00000097          	auipc	ra,0x0
    8000348c:	e24080e7          	jalr	-476(ra) # 800032ac <_Znwm>
    80003490:	00053023          	sd	zero,0(a0)
    80003494:	00053423          	sd	zero,8(a0)
    80003498:	00053823          	sd	zero,16(a0)
        myHandle = (thread_t)w;
    8000349c:	00a4b423          	sd	a0,8(s1)
        thread_create(&w->handle, &runWrapper, this);   
    800034a0:	00048613          	mv	a2,s1
    800034a4:	00000597          	auipc	a1,0x0
    800034a8:	d8c58593          	addi	a1,a1,-628 # 80003230 <_ZN6Thread10runWrapperEPv>
    800034ac:	fffff097          	auipc	ra,0xfffff
    800034b0:	63c080e7          	jalr	1596(ra) # 80002ae8 <thread_create>
}
    800034b4:	fbdff06f          	j	80003470 <_ZN6Thread5startEv+0x30>

00000000800034b8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    800034b8:	fe010113          	addi	sp,sp,-32
    800034bc:	00113c23          	sd	ra,24(sp)
    800034c0:	00813823          	sd	s0,16(sp)
    800034c4:	00913423          	sd	s1,8(sp)
    800034c8:	01213023          	sd	s2,0(sp)
    800034cc:	02010413          	addi	s0,sp,32
    800034d0:	00050493          	mv	s1,a0
    800034d4:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    800034d8:	01000513          	li	a0,16
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	dd0080e7          	jalr	-560(ra) # 800032ac <_Znwm>
    800034e4:	00050613          	mv	a2,a0
    800034e8:	00953023          	sd	s1,0(a0)
    800034ec:	01253423          	sd	s2,8(a0)
    800034f0:	00000597          	auipc	a1,0x0
    800034f4:	d6c58593          	addi	a1,a1,-660 # 8000325c <_ZN14PeriodicThread15periodicWrapperEPv>
    800034f8:	00048513          	mv	a0,s1
    800034fc:	00000097          	auipc	ra,0x0
    80003500:	ed8080e7          	jalr	-296(ra) # 800033d4 <_ZN6ThreadC1EPFvPvES0_>
    80003504:	00003797          	auipc	a5,0x3
    80003508:	dfc78793          	addi	a5,a5,-516 # 80006300 <_ZTV14PeriodicThread+0x10>
    8000350c:	00f4b023          	sd	a5,0(s1)
    80003510:	01813083          	ld	ra,24(sp)
    80003514:	01013403          	ld	s0,16(sp)
    80003518:	00813483          	ld	s1,8(sp)
    8000351c:	00013903          	ld	s2,0(sp)
    80003520:	02010113          	addi	sp,sp,32
    80003524:	00008067          	ret

0000000080003528 <_ZN6Thread3runEv>:
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    80003528:	ff010113          	addi	sp,sp,-16
    8000352c:	00813423          	sd	s0,8(sp)
    80003530:	01010413          	addi	s0,sp,16
    80003534:	00813403          	ld	s0,8(sp)
    80003538:	01010113          	addi	sp,sp,16
    8000353c:	00008067          	ret

0000000080003540 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80003540:	ff010113          	addi	sp,sp,-16
    80003544:	00813423          	sd	s0,8(sp)
    80003548:	01010413          	addi	s0,sp,16
    8000354c:	00813403          	ld	s0,8(sp)
    80003550:	01010113          	addi	sp,sp,16
    80003554:	00008067          	ret

0000000080003558 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003558:	ff010113          	addi	sp,sp,-16
    8000355c:	00113423          	sd	ra,8(sp)
    80003560:	00813023          	sd	s0,0(sp)
    80003564:	01010413          	addi	s0,sp,16
    80003568:	00003797          	auipc	a5,0x3
    8000356c:	d9878793          	addi	a5,a5,-616 # 80006300 <_ZTV14PeriodicThread+0x10>
    80003570:	00f53023          	sd	a5,0(a0)
    80003574:	00000097          	auipc	ra,0x0
    80003578:	d88080e7          	jalr	-632(ra) # 800032fc <_ZN6ThreadD1Ev>
    8000357c:	00813083          	ld	ra,8(sp)
    80003580:	00013403          	ld	s0,0(sp)
    80003584:	01010113          	addi	sp,sp,16
    80003588:	00008067          	ret

000000008000358c <_ZN14PeriodicThreadD0Ev>:
    8000358c:	fe010113          	addi	sp,sp,-32
    80003590:	00113c23          	sd	ra,24(sp)
    80003594:	00813823          	sd	s0,16(sp)
    80003598:	00913423          	sd	s1,8(sp)
    8000359c:	02010413          	addi	s0,sp,32
    800035a0:	00050493          	mv	s1,a0
    800035a4:	00003797          	auipc	a5,0x3
    800035a8:	d5c78793          	addi	a5,a5,-676 # 80006300 <_ZTV14PeriodicThread+0x10>
    800035ac:	00f53023          	sd	a5,0(a0)
    800035b0:	00000097          	auipc	ra,0x0
    800035b4:	d4c080e7          	jalr	-692(ra) # 800032fc <_ZN6ThreadD1Ev>
    800035b8:	00048513          	mv	a0,s1
    800035bc:	00000097          	auipc	ra,0x0
    800035c0:	d18080e7          	jalr	-744(ra) # 800032d4 <_ZdlPv>
    800035c4:	01813083          	ld	ra,24(sp)
    800035c8:	01013403          	ld	s0,16(sp)
    800035cc:	00813483          	ld	s1,8(sp)
    800035d0:	02010113          	addi	sp,sp,32
    800035d4:	00008067          	ret

00000000800035d8 <_ZN5Riscv10popSppSpieEv>:
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;

void Riscv::popSppSpie() 
{
    800035d8:	ff010113          	addi	sp,sp,-16
    800035dc:	00813423          	sd	s0,8(sp)
    800035e0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800035e4:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800035e8:	10200073          	sret
}
    800035ec:	00813403          	ld	s0,8(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <_ZN3TCBC1EPFvPvES0_Pmm>:
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    800035f8:	00053023          	sd	zero,0(a0)
    800035fc:	00053423          	sd	zero,8(a0)
    80003600:	00b53823          	sd	a1,16(a0)
    80003604:	00c53c23          	sd	a2,24(a0)
    80003608:	02d53023          	sd	a3,32(a0)
    8000360c:	02e53423          	sd	a4,40(a0)
    80003610:	00100793          	li	a5,1
    80003614:	02f52823          	sw	a5,48(a0)
    80003618:	02050a23          	sb	zero,52(a0)
    8000361c:	02f50aa3          	sb	a5,53(a0)
    80003620:	02050b23          	sb	zero,54(a0)
    80003624:	00000797          	auipc	a5,0x0
    80003628:	17078793          	addi	a5,a5,368 # 80003794 <_ZN3TCB13threadWrapperEv>
    8000362c:	02f53c23          	sd	a5,56(a0)
    80003630:	04068a63          	beqz	a3,80003684 <_ZN3TCBC1EPFvPvES0_Pmm+0x8c>
    80003634:	000017b7          	lui	a5,0x1
    80003638:	00f687b3          	add	a5,a3,a5
    8000363c:	04f53023          	sd	a5,64(a0)
{    
    if(body && stack){
    80003640:	04058663          	beqz	a1,8000368c <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
    80003644:	04068463          	beqz	a3,8000368c <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80003648:	ff010113          	addi	sp,sp,-16
    8000364c:	00113423          	sd	ra,8(sp)
    80003650:	00813023          	sd	s0,0(sp)
    80003654:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    80003658:	fffff097          	auipc	ra,0xfffff
    8000365c:	260080e7          	jalr	608(ra) # 800028b8 <_ZN9Scheduler3putEP3TCB>
        threadsUp++;
    80003660:	00004717          	auipc	a4,0x4
    80003664:	ff070713          	addi	a4,a4,-16 # 80007650 <_ZN3TCB9threadsUpE>
    80003668:	00072783          	lw	a5,0(a4)
    8000366c:	0017879b          	addiw	a5,a5,1
    80003670:	00f72023          	sw	a5,0(a4)
    }
}   
    80003674:	00813083          	ld	ra,8(sp)
    80003678:	00013403          	ld	s0,0(sp)
    8000367c:	01010113          	addi	sp,sp,16
    80003680:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    80003684:	00000793          	li	a5,0
    80003688:	fb5ff06f          	j	8000363c <_ZN3TCBC1EPFvPvES0_Pmm+0x44>
    8000368c:	00008067          	ret

0000000080003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80003690:	fd010113          	addi	sp,sp,-48
    80003694:	02113423          	sd	ra,40(sp)
    80003698:	02813023          	sd	s0,32(sp)
    8000369c:	00913c23          	sd	s1,24(sp)
    800036a0:	01213823          	sd	s2,16(sp)
    800036a4:	01313423          	sd	s3,8(sp)
    800036a8:	01413023          	sd	s4,0(sp)
    800036ac:	03010413          	addi	s0,sp,48
    800036b0:	00050913          	mv	s2,a0
    800036b4:	00058993          	mv	s3,a1
    800036b8:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800036bc:	fffff097          	auipc	ra,0xfffff
    800036c0:	9ec080e7          	jalr	-1556(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    800036c4:	00200593          	li	a1,2
    800036c8:	fffff097          	auipc	ra,0xfffff
    800036cc:	a54080e7          	jalr	-1452(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    800036d0:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    800036d4:	00200713          	li	a4,2
    800036d8:	000a0693          	mv	a3,s4
    800036dc:	00098613          	mv	a2,s3
    800036e0:	00090593          	mv	a1,s2
    800036e4:	00000097          	auipc	ra,0x0
    800036e8:	f14080e7          	jalr	-236(ra) # 800035f8 <_ZN3TCBC1EPFvPvES0_Pmm>
    800036ec:	0280006f          	j	80003714 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    800036f0:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    800036f4:	fffff097          	auipc	ra,0xfffff
    800036f8:	9b4080e7          	jalr	-1612(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    800036fc:	00048593          	mv	a1,s1
    80003700:	fffff097          	auipc	ra,0xfffff
    80003704:	bd8080e7          	jalr	-1064(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    80003708:	00090513          	mv	a0,s2
    8000370c:	00005097          	auipc	ra,0x5
    80003710:	0bc080e7          	jalr	188(ra) # 800087c8 <_Unwind_Resume>
}
    80003714:	00048513          	mv	a0,s1
    80003718:	02813083          	ld	ra,40(sp)
    8000371c:	02013403          	ld	s0,32(sp)
    80003720:	01813483          	ld	s1,24(sp)
    80003724:	01013903          	ld	s2,16(sp)
    80003728:	00813983          	ld	s3,8(sp)
    8000372c:	00013a03          	ld	s4,0(sp)
    80003730:	03010113          	addi	sp,sp,48
    80003734:	00008067          	ret

0000000080003738 <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    80003738:	ff010113          	addi	sp,sp,-16
    8000373c:	00813423          	sd	s0,8(sp)
    80003740:	01010413          	addi	s0,sp,16
    if(running->userMode)
    80003744:	00004797          	auipc	a5,0x4
    80003748:	f2478793          	addi	a5,a5,-220 # 80007668 <_ZN3TCB7runningE>
    8000374c:	0007b783          	ld	a5,0(a5)
    80003750:	0357c703          	lbu	a4,53(a5)
    80003754:	00070c63          	beqz	a4,8000376c <_ZN3TCB9initalizeEv+0x34>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003758:	10000793          	li	a5,256
    8000375c:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    80003760:	00813403          	ld	s0,8(sp)
    80003764:	01010113          	addi	sp,sp,16
    80003768:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    8000376c:	10000713          	li	a4,256
    80003770:	10072073          	csrs	sstatus,a4
        if(running->locked)
    80003774:	0367c783          	lbu	a5,54(a5)
    80003778:	00078863          	beqz	a5,80003788 <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    8000377c:	02000793          	li	a5,32
    80003780:	1007b073          	csrc	sstatus,a5
    80003784:	fddff06f          	j	80003760 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80003788:	02000793          	li	a5,32
    8000378c:	1007a073          	csrs	sstatus,a5
}
    80003790:	fd1ff06f          	j	80003760 <_ZN3TCB9initalizeEv+0x28>

0000000080003794 <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    80003794:	ff010113          	addi	sp,sp,-16
    80003798:	00113423          	sd	ra,8(sp)
    8000379c:	00813023          	sd	s0,0(sp)
    800037a0:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	f94080e7          	jalr	-108(ra) # 80003738 <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    800037ac:	00000097          	auipc	ra,0x0
    800037b0:	e2c080e7          	jalr	-468(ra) # 800035d8 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    800037b4:	00004797          	auipc	a5,0x4
    800037b8:	eb478793          	addi	a5,a5,-332 # 80007668 <_ZN3TCB7runningE>
    800037bc:	0007b783          	ld	a5,0(a5)
    800037c0:	0107b703          	ld	a4,16(a5)
    800037c4:	0187b503          	ld	a0,24(a5)
    800037c8:	000700e7          	jalr	a4
    thread_exit();
    800037cc:	fffff097          	auipc	ra,0xfffff
    800037d0:	3b0080e7          	jalr	944(ra) # 80002b7c <thread_exit>
}
    800037d4:	00813083          	ld	ra,8(sp)
    800037d8:	00013403          	ld	s0,0(sp)
    800037dc:	01010113          	addi	sp,sp,16
    800037e0:	00008067          	ret

00000000800037e4 <_ZN3TCB12deleteThreadEPS_>:
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t)
{
    if(t)
    800037e4:	08050063          	beqz	a0,80003864 <_ZN3TCB12deleteThreadEPS_+0x80>
    {
        if(running != t && t->isFinished())
    800037e8:	00004797          	auipc	a5,0x4
    800037ec:	e8078793          	addi	a5,a5,-384 # 80007668 <_ZN3TCB7runningE>
    800037f0:	0007b783          	ld	a5,0(a5)
    800037f4:	00a78863          	beq	a5,a0,80003804 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    800037f8:	03052703          	lw	a4,48(a0)
    800037fc:	00200793          	li	a5,2
    80003800:	00f70863          	beq	a4,a5,80003810 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    80003804:	00100793          	li	a5,1
    80003808:	02f50a23          	sb	a5,52(a0)
        }        
    }
}
    8000380c:	00008067          	ret
{
    80003810:	fe010113          	addi	sp,sp,-32
    80003814:	00113c23          	sd	ra,24(sp)
    80003818:	00813823          	sd	s0,16(sp)
    8000381c:	00913423          	sd	s1,8(sp)
    80003820:	02010413          	addi	s0,sp,32
    80003824:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80003828:	fffff097          	auipc	ra,0xfffff
    8000382c:	880080e7          	jalr	-1920(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    80003830:	0204b583          	ld	a1,32(s1)
    80003834:	fffff097          	auipc	ra,0xfffff
    80003838:	aa4080e7          	jalr	-1372(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    8000383c:	fffff097          	auipc	ra,0xfffff
    80003840:	86c080e7          	jalr	-1940(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80003844:	00048593          	mv	a1,s1
    80003848:	fffff097          	auipc	ra,0xfffff
    8000384c:	a90080e7          	jalr	-1392(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003850:	01813083          	ld	ra,24(sp)
    80003854:	01013403          	ld	s0,16(sp)
    80003858:	00813483          	ld	s1,8(sp)
    8000385c:	02010113          	addi	sp,sp,32
    80003860:	00008067          	ret
    80003864:	00008067          	ret

0000000080003868 <_ZN3TCB22createMainKernelThreadEv>:
    TCB::yield(); 
}

TCB* TCB::createMainKernelThread()
{
    if(!kernelThread)
    80003868:	00004797          	auipc	a5,0x4
    8000386c:	df078793          	addi	a5,a5,-528 # 80007658 <_ZN3TCB12kernelThreadE>
    80003870:	0007b783          	ld	a5,0(a5)
    80003874:	00078e63          	beqz	a5,80003890 <_ZN3TCB22createMainKernelThreadEv+0x28>
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    80003878:	00004797          	auipc	a5,0x4
    8000387c:	de078793          	addi	a5,a5,-544 # 80007658 <_ZN3TCB12kernelThreadE>
    80003880:	0007b503          	ld	a0,0(a5)
    80003884:	00004797          	auipc	a5,0x4
    80003888:	dea7b223          	sd	a0,-540(a5) # 80007668 <_ZN3TCB7runningE>
    return kernelThread;
}
    8000388c:	00008067          	ret
{
    80003890:	ff010113          	addi	sp,sp,-16
    80003894:	00113423          	sd	ra,8(sp)
    80003898:	00813023          	sd	s0,0(sp)
    8000389c:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    800038a0:	00000613          	li	a2,0
    800038a4:	00000593          	li	a1,0
    800038a8:	00000513          	li	a0,0
    800038ac:	00000097          	auipc	ra,0x0
    800038b0:	de4080e7          	jalr	-540(ra) # 80003690 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800038b4:	00004797          	auipc	a5,0x4
    800038b8:	daa7b223          	sd	a0,-604(a5) # 80007658 <_ZN3TCB12kernelThreadE>
    void setKernelMode() { userMode = false; }
    800038bc:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    800038c0:	00100793          	li	a5,1
    800038c4:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    800038c8:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    800038cc:	00004797          	auipc	a5,0x4
    800038d0:	d8c78793          	addi	a5,a5,-628 # 80007658 <_ZN3TCB12kernelThreadE>
    800038d4:	0007b503          	ld	a0,0(a5)
    800038d8:	00004797          	auipc	a5,0x4
    800038dc:	d8a7b823          	sd	a0,-624(a5) # 80007668 <_ZN3TCB7runningE>
}
    800038e0:	00813083          	ld	ra,8(sp)
    800038e4:	00013403          	ld	s0,0(sp)
    800038e8:	01010113          	addi	sp,sp,16
    800038ec:	00008067          	ret

00000000800038f0 <_ZN3TCB9endKernelEv>:

int TCB::endKernel()
{
    if(kernelThread)
    800038f0:	00004797          	auipc	a5,0x4
    800038f4:	d6878793          	addi	a5,a5,-664 # 80007658 <_ZN3TCB12kernelThreadE>
    800038f8:	0007b583          	ld	a1,0(a5)
    800038fc:	04058463          	beqz	a1,80003944 <_ZN3TCB9endKernelEv+0x54>
{
    80003900:	ff010113          	addi	sp,sp,-16
    80003904:	00113423          	sd	ra,8(sp)
    80003908:	00813023          	sd	s0,0(sp)
    8000390c:	01010413          	addi	s0,sp,16
    80003910:	00004517          	auipc	a0,0x4
    80003914:	da850513          	addi	a0,a0,-600 # 800076b8 <_ZN9Scheduler5queueE>
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	ea8080e7          	jalr	-344(ra) # 800027c0 <_ZN8TcbQueue11insertFrontEP3TCB>
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
    80003920:	00004797          	auipc	a5,0x4
    80003924:	d207bc23          	sd	zero,-712(a5) # 80007658 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    80003928:	00000097          	auipc	ra,0x0
    8000392c:	024080e7          	jalr	36(ra) # 8000394c <_ZN3TCB8dispatchEv>
    }
    return -1;

    
}
    80003930:	fff00513          	li	a0,-1
    80003934:	00813083          	ld	ra,8(sp)
    80003938:	00013403          	ld	s0,0(sp)
    8000393c:	01010113          	addi	sp,sp,16
    80003940:	00008067          	ret
    80003944:	fff00513          	li	a0,-1
    80003948:	00008067          	ret

000000008000394c <_ZN3TCB8dispatchEv>:
{
    8000394c:	fe010113          	addi	sp,sp,-32
    80003950:	00113c23          	sd	ra,24(sp)
    80003954:	00813823          	sd	s0,16(sp)
    80003958:	00913423          	sd	s1,8(sp)
    8000395c:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    80003960:	00004797          	auipc	a5,0x4
    80003964:	d0878793          	addi	a5,a5,-760 # 80007668 <_ZN3TCB7runningE>
    80003968:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    8000396c:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80003970:	00200713          	li	a4,2
    80003974:	06e78c63          	beq	a5,a4,800039ec <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80003978:	00078c63          	beqz	a5,80003990 <_ZN3TCB8dispatchEv+0x44>
    8000397c:	00300713          	li	a4,3
    80003980:	00e78863          	beq	a5,a4,80003990 <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    80003984:	00048513          	mv	a0,s1
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	f30080e7          	jalr	-208(ra) # 800028b8 <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80003990:	00004797          	auipc	a5,0x4
    80003994:	cc078793          	addi	a5,a5,-832 # 80007650 <_ZN3TCB9threadsUpE>
    80003998:	0007a703          	lw	a4,0(a5)
    8000399c:	00200793          	li	a5,2
    800039a0:	00e7cc63          	blt	a5,a4,800039b8 <_ZN3TCB8dispatchEv+0x6c>
    800039a4:	00004797          	auipc	a5,0x4
    800039a8:	c8478793          	addi	a5,a5,-892 # 80007628 <_ZN5StdIO7obufferE>
    800039ac:	0007b783          	ld	a5,0(a5)
    800039b0:	4807a783          	lw	a5,1152(a5)
    800039b4:	08078263          	beqz	a5,80003a38 <_ZN3TCB8dispatchEv+0xec>
    running = Scheduler::get(); 
    800039b8:	fffff097          	auipc	ra,0xfffff
    800039bc:	ed0080e7          	jalr	-304(ra) # 80002888 <_ZN9Scheduler3getEv>
    800039c0:	00004797          	auipc	a5,0x4
    800039c4:	caa7b423          	sd	a0,-856(a5) # 80007668 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    800039c8:	03850593          	addi	a1,a0,56
    800039cc:	03848513          	addi	a0,s1,56
    800039d0:	ffffd097          	auipc	ra,0xffffd
    800039d4:	740080e7          	jalr	1856(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800039d8:	01813083          	ld	ra,24(sp)
    800039dc:	01013403          	ld	s0,16(sp)
    800039e0:	00813483          	ld	s1,8(sp)
    800039e4:	02010113          	addi	sp,sp,32
    800039e8:	00008067          	ret
        threadsUp--;
    800039ec:	00004717          	auipc	a4,0x4
    800039f0:	c6470713          	addi	a4,a4,-924 # 80007650 <_ZN3TCB9threadsUpE>
    800039f4:	00072783          	lw	a5,0(a4)
    800039f8:	fff7879b          	addiw	a5,a5,-1
    800039fc:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    80003a00:	0344c783          	lbu	a5,52(s1)
    80003a04:	f80786e3          	beqz	a5,80003990 <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    80003a08:	f80484e3          	beqz	s1,80003990 <_ZN3TCB8dispatchEv+0x44>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80003a0c:	ffffe097          	auipc	ra,0xffffe
    80003a10:	69c080e7          	jalr	1692(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    80003a14:	0204b583          	ld	a1,32(s1)
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	8c0080e7          	jalr	-1856(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	688080e7          	jalr	1672(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    80003a28:	00048593          	mv	a1,s1
    80003a2c:	fffff097          	auipc	ra,0xfffff
    80003a30:	8ac080e7          	jalr	-1876(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    80003a34:	f5dff06f          	j	80003990 <_ZN3TCB8dispatchEv+0x44>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80003a38:	00000097          	auipc	ra,0x0
    80003a3c:	eb8080e7          	jalr	-328(ra) # 800038f0 <_ZN3TCB9endKernelEv>
    80003a40:	f79ff06f          	j	800039b8 <_ZN3TCB8dispatchEv+0x6c>

0000000080003a44 <_ZN3TCB5yieldEv>:
{
    80003a44:	ff010113          	addi	sp,sp,-16
    80003a48:	00113423          	sd	ra,8(sp)
    80003a4c:	00813023          	sd	s0,0(sp)
    80003a50:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80003a54:	ffffd097          	auipc	ra,0xffffd
    80003a58:	6d0080e7          	jalr	1744(ra) # 80001124 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80003a5c:	00000097          	auipc	ra,0x0
    80003a60:	ef0080e7          	jalr	-272(ra) # 8000394c <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80003a64:	ffffd097          	auipc	ra,0xffffd
    80003a68:	73c080e7          	jalr	1852(ra) # 800011a0 <_ZN5Riscv12popRegistersEv>
}
    80003a6c:	00813083          	ld	ra,8(sp)
    80003a70:	00013403          	ld	s0,0(sp)
    80003a74:	01010113          	addi	sp,sp,16
    80003a78:	00008067          	ret

0000000080003a7c <_ZN3TCB5sleepEm>:
{
    80003a7c:	ff010113          	addi	sp,sp,-16
    80003a80:	00113423          	sd	ra,8(sp)
    80003a84:	00813023          	sd	s0,0(sp)
    80003a88:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80003a8c:	00004797          	auipc	a5,0x4
    80003a90:	bdc78793          	addi	a5,a5,-1060 # 80007668 <_ZN3TCB7runningE>
    80003a94:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80003a98:	00300713          	li	a4,3
    80003a9c:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80003aa0:	00050593          	mv	a1,a0
    80003aa4:	00078513          	mv	a0,a5
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	ea4080e7          	jalr	-348(ra) # 8000294c <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80003ab0:	00000097          	auipc	ra,0x0
    80003ab4:	f94080e7          	jalr	-108(ra) # 80003a44 <_ZN3TCB5yieldEv>
}
    80003ab8:	00813083          	ld	ra,8(sp)
    80003abc:	00013403          	ld	s0,0(sp)
    80003ac0:	01010113          	addi	sp,sp,16
    80003ac4:	00008067          	ret

0000000080003ac8 <_ZN3TCB15setPanicContextEmm>:

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    80003ac8:	ff010113          	addi	sp,sp,-16
    80003acc:	00813423          	sd	s0,8(sp)
    80003ad0:	01010413          	addi	s0,sp,16
    panicContext.ra = ra;
    80003ad4:	00004797          	auipc	a5,0x4
    80003ad8:	c1478793          	addi	a5,a5,-1004 # 800076e8 <_ZN3TCB12panicContextE>
    80003adc:	00a7b023          	sd	a0,0(a5)
    panicContext.sp = sp;
    80003ae0:	00b7b423          	sd	a1,8(a5)
}
    80003ae4:	00813403          	ld	s0,8(sp)
    80003ae8:	01010113          	addi	sp,sp,16
    80003aec:	00008067          	ret

0000000080003af0 <_ZN3TCB13panicDispatchEv>:

void TCB::panicDispatch()
{
    80003af0:	ff010113          	addi	sp,sp,-16
    80003af4:	00113423          	sd	ra,8(sp)
    80003af8:	00813023          	sd	s0,0(sp)
    80003afc:	01010413          	addi	s0,sp,16
    contextSwitch(&running->context, &panicContext);
    80003b00:	00004797          	auipc	a5,0x4
    80003b04:	b6878793          	addi	a5,a5,-1176 # 80007668 <_ZN3TCB7runningE>
    80003b08:	0007b503          	ld	a0,0(a5)
    80003b0c:	00004597          	auipc	a1,0x4
    80003b10:	bdc58593          	addi	a1,a1,-1060 # 800076e8 <_ZN3TCB12panicContextE>
    80003b14:	03850513          	addi	a0,a0,56
    80003b18:	ffffd097          	auipc	ra,0xffffd
    80003b1c:	5f8080e7          	jalr	1528(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    80003b20:	00813083          	ld	ra,8(sp)
    80003b24:	00013403          	ld	s0,0(sp)
    80003b28:	01010113          	addi	sp,sp,16
    80003b2c:	00008067          	ret

0000000080003b30 <start>:
    80003b30:	ff010113          	addi	sp,sp,-16
    80003b34:	00813423          	sd	s0,8(sp)
    80003b38:	01010413          	addi	s0,sp,16
    80003b3c:	300027f3          	csrr	a5,mstatus
    80003b40:	ffffe737          	lui	a4,0xffffe
    80003b44:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5e9f>
    80003b48:	00e7f7b3          	and	a5,a5,a4
    80003b4c:	00001737          	lui	a4,0x1
    80003b50:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003b54:	00e7e7b3          	or	a5,a5,a4
    80003b58:	30079073          	csrw	mstatus,a5
    80003b5c:	00000797          	auipc	a5,0x0
    80003b60:	16078793          	addi	a5,a5,352 # 80003cbc <system_main>
    80003b64:	34179073          	csrw	mepc,a5
    80003b68:	00000793          	li	a5,0
    80003b6c:	18079073          	csrw	satp,a5
    80003b70:	000107b7          	lui	a5,0x10
    80003b74:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003b78:	30279073          	csrw	medeleg,a5
    80003b7c:	30379073          	csrw	mideleg,a5
    80003b80:	104027f3          	csrr	a5,sie
    80003b84:	2227e793          	ori	a5,a5,546
    80003b88:	10479073          	csrw	sie,a5
    80003b8c:	fff00793          	li	a5,-1
    80003b90:	00a7d793          	srli	a5,a5,0xa
    80003b94:	3b079073          	csrw	pmpaddr0,a5
    80003b98:	00f00793          	li	a5,15
    80003b9c:	3a079073          	csrw	pmpcfg0,a5
    80003ba0:	f14027f3          	csrr	a5,mhartid
    80003ba4:	0200c737          	lui	a4,0x200c
    80003ba8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003bac:	0007869b          	sext.w	a3,a5
    80003bb0:	00269713          	slli	a4,a3,0x2
    80003bb4:	000f4637          	lui	a2,0xf4
    80003bb8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003bbc:	00d70733          	add	a4,a4,a3
    80003bc0:	0037979b          	slliw	a5,a5,0x3
    80003bc4:	020046b7          	lui	a3,0x2004
    80003bc8:	00d787b3          	add	a5,a5,a3
    80003bcc:	00c585b3          	add	a1,a1,a2
    80003bd0:	00371693          	slli	a3,a4,0x3
    80003bd4:	00004717          	auipc	a4,0x4
    80003bd8:	b2c70713          	addi	a4,a4,-1236 # 80007700 <timer_scratch>
    80003bdc:	00b7b023          	sd	a1,0(a5)
    80003be0:	00d70733          	add	a4,a4,a3
    80003be4:	00f73c23          	sd	a5,24(a4)
    80003be8:	02c73023          	sd	a2,32(a4)
    80003bec:	34071073          	csrw	mscratch,a4
    80003bf0:	00000797          	auipc	a5,0x0
    80003bf4:	6e078793          	addi	a5,a5,1760 # 800042d0 <timervec>
    80003bf8:	30579073          	csrw	mtvec,a5
    80003bfc:	300027f3          	csrr	a5,mstatus
    80003c00:	0087e793          	ori	a5,a5,8
    80003c04:	30079073          	csrw	mstatus,a5
    80003c08:	304027f3          	csrr	a5,mie
    80003c0c:	0807e793          	ori	a5,a5,128
    80003c10:	30479073          	csrw	mie,a5
    80003c14:	f14027f3          	csrr	a5,mhartid
    80003c18:	0007879b          	sext.w	a5,a5
    80003c1c:	00078213          	mv	tp,a5
    80003c20:	30200073          	mret
    80003c24:	00813403          	ld	s0,8(sp)
    80003c28:	01010113          	addi	sp,sp,16
    80003c2c:	00008067          	ret

0000000080003c30 <timerinit>:
    80003c30:	ff010113          	addi	sp,sp,-16
    80003c34:	00813423          	sd	s0,8(sp)
    80003c38:	01010413          	addi	s0,sp,16
    80003c3c:	f14027f3          	csrr	a5,mhartid
    80003c40:	0200c737          	lui	a4,0x200c
    80003c44:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003c48:	0007869b          	sext.w	a3,a5
    80003c4c:	00269713          	slli	a4,a3,0x2
    80003c50:	000f4637          	lui	a2,0xf4
    80003c54:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003c58:	00d70733          	add	a4,a4,a3
    80003c5c:	0037979b          	slliw	a5,a5,0x3
    80003c60:	020046b7          	lui	a3,0x2004
    80003c64:	00d787b3          	add	a5,a5,a3
    80003c68:	00c585b3          	add	a1,a1,a2
    80003c6c:	00371693          	slli	a3,a4,0x3
    80003c70:	00004717          	auipc	a4,0x4
    80003c74:	a9070713          	addi	a4,a4,-1392 # 80007700 <timer_scratch>
    80003c78:	00b7b023          	sd	a1,0(a5)
    80003c7c:	00d70733          	add	a4,a4,a3
    80003c80:	00f73c23          	sd	a5,24(a4)
    80003c84:	02c73023          	sd	a2,32(a4)
    80003c88:	34071073          	csrw	mscratch,a4
    80003c8c:	00000797          	auipc	a5,0x0
    80003c90:	64478793          	addi	a5,a5,1604 # 800042d0 <timervec>
    80003c94:	30579073          	csrw	mtvec,a5
    80003c98:	300027f3          	csrr	a5,mstatus
    80003c9c:	0087e793          	ori	a5,a5,8
    80003ca0:	30079073          	csrw	mstatus,a5
    80003ca4:	304027f3          	csrr	a5,mie
    80003ca8:	0807e793          	ori	a5,a5,128
    80003cac:	30479073          	csrw	mie,a5
    80003cb0:	00813403          	ld	s0,8(sp)
    80003cb4:	01010113          	addi	sp,sp,16
    80003cb8:	00008067          	ret

0000000080003cbc <system_main>:
    80003cbc:	fe010113          	addi	sp,sp,-32
    80003cc0:	00813823          	sd	s0,16(sp)
    80003cc4:	00913423          	sd	s1,8(sp)
    80003cc8:	00113c23          	sd	ra,24(sp)
    80003ccc:	02010413          	addi	s0,sp,32
    80003cd0:	00000097          	auipc	ra,0x0
    80003cd4:	0c4080e7          	jalr	196(ra) # 80003d94 <cpuid>
    80003cd8:	00004497          	auipc	s1,0x4
    80003cdc:	99848493          	addi	s1,s1,-1640 # 80007670 <started>
    80003ce0:	02050263          	beqz	a0,80003d04 <system_main+0x48>
    80003ce4:	0004a783          	lw	a5,0(s1)
    80003ce8:	0007879b          	sext.w	a5,a5
    80003cec:	fe078ce3          	beqz	a5,80003ce4 <system_main+0x28>
    80003cf0:	0ff0000f          	fence
    80003cf4:	00002517          	auipc	a0,0x2
    80003cf8:	68450513          	addi	a0,a0,1668 # 80006378 <_ZTV6Thread+0x58>
    80003cfc:	00001097          	auipc	ra,0x1
    80003d00:	a70080e7          	jalr	-1424(ra) # 8000476c <panic>
    80003d04:	00001097          	auipc	ra,0x1
    80003d08:	9c4080e7          	jalr	-1596(ra) # 800046c8 <consoleinit>
    80003d0c:	00001097          	auipc	ra,0x1
    80003d10:	150080e7          	jalr	336(ra) # 80004e5c <printfinit>
    80003d14:	00002517          	auipc	a0,0x2
    80003d18:	5ac50513          	addi	a0,a0,1452 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80003d1c:	00001097          	auipc	ra,0x1
    80003d20:	aac080e7          	jalr	-1364(ra) # 800047c8 <__printf>
    80003d24:	00002517          	auipc	a0,0x2
    80003d28:	62450513          	addi	a0,a0,1572 # 80006348 <_ZTV6Thread+0x28>
    80003d2c:	00001097          	auipc	ra,0x1
    80003d30:	a9c080e7          	jalr	-1380(ra) # 800047c8 <__printf>
    80003d34:	00002517          	auipc	a0,0x2
    80003d38:	58c50513          	addi	a0,a0,1420 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80003d3c:	00001097          	auipc	ra,0x1
    80003d40:	a8c080e7          	jalr	-1396(ra) # 800047c8 <__printf>
    80003d44:	00001097          	auipc	ra,0x1
    80003d48:	4a4080e7          	jalr	1188(ra) # 800051e8 <kinit>
    80003d4c:	00000097          	auipc	ra,0x0
    80003d50:	148080e7          	jalr	328(ra) # 80003e94 <trapinit>
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	16c080e7          	jalr	364(ra) # 80003ec0 <trapinithart>
    80003d5c:	00000097          	auipc	ra,0x0
    80003d60:	5b4080e7          	jalr	1460(ra) # 80004310 <plicinit>
    80003d64:	00000097          	auipc	ra,0x0
    80003d68:	5d4080e7          	jalr	1492(ra) # 80004338 <plicinithart>
    80003d6c:	00000097          	auipc	ra,0x0
    80003d70:	078080e7          	jalr	120(ra) # 80003de4 <userinit>
    80003d74:	0ff0000f          	fence
    80003d78:	00100793          	li	a5,1
    80003d7c:	00002517          	auipc	a0,0x2
    80003d80:	5e450513          	addi	a0,a0,1508 # 80006360 <_ZTV6Thread+0x40>
    80003d84:	00f4a023          	sw	a5,0(s1)
    80003d88:	00001097          	auipc	ra,0x1
    80003d8c:	a40080e7          	jalr	-1472(ra) # 800047c8 <__printf>
    80003d90:	0000006f          	j	80003d90 <system_main+0xd4>

0000000080003d94 <cpuid>:
    80003d94:	ff010113          	addi	sp,sp,-16
    80003d98:	00813423          	sd	s0,8(sp)
    80003d9c:	01010413          	addi	s0,sp,16
    80003da0:	00020513          	mv	a0,tp
    80003da4:	00813403          	ld	s0,8(sp)
    80003da8:	0005051b          	sext.w	a0,a0
    80003dac:	01010113          	addi	sp,sp,16
    80003db0:	00008067          	ret

0000000080003db4 <mycpu>:
    80003db4:	ff010113          	addi	sp,sp,-16
    80003db8:	00813423          	sd	s0,8(sp)
    80003dbc:	01010413          	addi	s0,sp,16
    80003dc0:	00020793          	mv	a5,tp
    80003dc4:	00813403          	ld	s0,8(sp)
    80003dc8:	0007879b          	sext.w	a5,a5
    80003dcc:	00779793          	slli	a5,a5,0x7
    80003dd0:	00005517          	auipc	a0,0x5
    80003dd4:	96050513          	addi	a0,a0,-1696 # 80008730 <cpus>
    80003dd8:	00f50533          	add	a0,a0,a5
    80003ddc:	01010113          	addi	sp,sp,16
    80003de0:	00008067          	ret

0000000080003de4 <userinit>:
    80003de4:	ff010113          	addi	sp,sp,-16
    80003de8:	00813423          	sd	s0,8(sp)
    80003dec:	01010413          	addi	s0,sp,16
    80003df0:	00813403          	ld	s0,8(sp)
    80003df4:	01010113          	addi	sp,sp,16
    80003df8:	ffffe317          	auipc	t1,0xffffe
    80003dfc:	72830067          	jr	1832(t1) # 80002520 <main>

0000000080003e00 <either_copyout>:
    80003e00:	ff010113          	addi	sp,sp,-16
    80003e04:	00813023          	sd	s0,0(sp)
    80003e08:	00113423          	sd	ra,8(sp)
    80003e0c:	01010413          	addi	s0,sp,16
    80003e10:	02051663          	bnez	a0,80003e3c <either_copyout+0x3c>
    80003e14:	00058513          	mv	a0,a1
    80003e18:	00060593          	mv	a1,a2
    80003e1c:	0006861b          	sext.w	a2,a3
    80003e20:	00002097          	auipc	ra,0x2
    80003e24:	c54080e7          	jalr	-940(ra) # 80005a74 <__memmove>
    80003e28:	00813083          	ld	ra,8(sp)
    80003e2c:	00013403          	ld	s0,0(sp)
    80003e30:	00000513          	li	a0,0
    80003e34:	01010113          	addi	sp,sp,16
    80003e38:	00008067          	ret
    80003e3c:	00002517          	auipc	a0,0x2
    80003e40:	56450513          	addi	a0,a0,1380 # 800063a0 <_ZTV6Thread+0x80>
    80003e44:	00001097          	auipc	ra,0x1
    80003e48:	928080e7          	jalr	-1752(ra) # 8000476c <panic>

0000000080003e4c <either_copyin>:
    80003e4c:	ff010113          	addi	sp,sp,-16
    80003e50:	00813023          	sd	s0,0(sp)
    80003e54:	00113423          	sd	ra,8(sp)
    80003e58:	01010413          	addi	s0,sp,16
    80003e5c:	02059463          	bnez	a1,80003e84 <either_copyin+0x38>
    80003e60:	00060593          	mv	a1,a2
    80003e64:	0006861b          	sext.w	a2,a3
    80003e68:	00002097          	auipc	ra,0x2
    80003e6c:	c0c080e7          	jalr	-1012(ra) # 80005a74 <__memmove>
    80003e70:	00813083          	ld	ra,8(sp)
    80003e74:	00013403          	ld	s0,0(sp)
    80003e78:	00000513          	li	a0,0
    80003e7c:	01010113          	addi	sp,sp,16
    80003e80:	00008067          	ret
    80003e84:	00002517          	auipc	a0,0x2
    80003e88:	54450513          	addi	a0,a0,1348 # 800063c8 <_ZTV6Thread+0xa8>
    80003e8c:	00001097          	auipc	ra,0x1
    80003e90:	8e0080e7          	jalr	-1824(ra) # 8000476c <panic>

0000000080003e94 <trapinit>:
    80003e94:	ff010113          	addi	sp,sp,-16
    80003e98:	00813423          	sd	s0,8(sp)
    80003e9c:	01010413          	addi	s0,sp,16
    80003ea0:	00813403          	ld	s0,8(sp)
    80003ea4:	00002597          	auipc	a1,0x2
    80003ea8:	54c58593          	addi	a1,a1,1356 # 800063f0 <_ZTV6Thread+0xd0>
    80003eac:	00005517          	auipc	a0,0x5
    80003eb0:	90450513          	addi	a0,a0,-1788 # 800087b0 <tickslock>
    80003eb4:	01010113          	addi	sp,sp,16
    80003eb8:	00001317          	auipc	t1,0x1
    80003ebc:	5c030067          	jr	1472(t1) # 80005478 <initlock>

0000000080003ec0 <trapinithart>:
    80003ec0:	ff010113          	addi	sp,sp,-16
    80003ec4:	00813423          	sd	s0,8(sp)
    80003ec8:	01010413          	addi	s0,sp,16
    80003ecc:	00000797          	auipc	a5,0x0
    80003ed0:	2f478793          	addi	a5,a5,756 # 800041c0 <kernelvec>
    80003ed4:	10579073          	csrw	stvec,a5
    80003ed8:	00813403          	ld	s0,8(sp)
    80003edc:	01010113          	addi	sp,sp,16
    80003ee0:	00008067          	ret

0000000080003ee4 <usertrap>:
    80003ee4:	ff010113          	addi	sp,sp,-16
    80003ee8:	00813423          	sd	s0,8(sp)
    80003eec:	01010413          	addi	s0,sp,16
    80003ef0:	00813403          	ld	s0,8(sp)
    80003ef4:	01010113          	addi	sp,sp,16
    80003ef8:	00008067          	ret

0000000080003efc <usertrapret>:
    80003efc:	ff010113          	addi	sp,sp,-16
    80003f00:	00813423          	sd	s0,8(sp)
    80003f04:	01010413          	addi	s0,sp,16
    80003f08:	00813403          	ld	s0,8(sp)
    80003f0c:	01010113          	addi	sp,sp,16
    80003f10:	00008067          	ret

0000000080003f14 <kerneltrap>:
    80003f14:	fe010113          	addi	sp,sp,-32
    80003f18:	00813823          	sd	s0,16(sp)
    80003f1c:	00113c23          	sd	ra,24(sp)
    80003f20:	00913423          	sd	s1,8(sp)
    80003f24:	02010413          	addi	s0,sp,32
    80003f28:	142025f3          	csrr	a1,scause
    80003f2c:	100027f3          	csrr	a5,sstatus
    80003f30:	0027f793          	andi	a5,a5,2
    80003f34:	10079c63          	bnez	a5,8000404c <kerneltrap+0x138>
    80003f38:	142027f3          	csrr	a5,scause
    80003f3c:	0207ce63          	bltz	a5,80003f78 <kerneltrap+0x64>
    80003f40:	00002517          	auipc	a0,0x2
    80003f44:	4f850513          	addi	a0,a0,1272 # 80006438 <_ZTV6Thread+0x118>
    80003f48:	00001097          	auipc	ra,0x1
    80003f4c:	880080e7          	jalr	-1920(ra) # 800047c8 <__printf>
    80003f50:	141025f3          	csrr	a1,sepc
    80003f54:	14302673          	csrr	a2,stval
    80003f58:	00002517          	auipc	a0,0x2
    80003f5c:	4f050513          	addi	a0,a0,1264 # 80006448 <_ZTV6Thread+0x128>
    80003f60:	00001097          	auipc	ra,0x1
    80003f64:	868080e7          	jalr	-1944(ra) # 800047c8 <__printf>
    80003f68:	00002517          	auipc	a0,0x2
    80003f6c:	4f850513          	addi	a0,a0,1272 # 80006460 <_ZTV6Thread+0x140>
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	7fc080e7          	jalr	2044(ra) # 8000476c <panic>
    80003f78:	0ff7f713          	andi	a4,a5,255
    80003f7c:	00900693          	li	a3,9
    80003f80:	04d70063          	beq	a4,a3,80003fc0 <kerneltrap+0xac>
    80003f84:	fff00713          	li	a4,-1
    80003f88:	03f71713          	slli	a4,a4,0x3f
    80003f8c:	00170713          	addi	a4,a4,1
    80003f90:	fae798e3          	bne	a5,a4,80003f40 <kerneltrap+0x2c>
    80003f94:	00000097          	auipc	ra,0x0
    80003f98:	e00080e7          	jalr	-512(ra) # 80003d94 <cpuid>
    80003f9c:	06050663          	beqz	a0,80004008 <kerneltrap+0xf4>
    80003fa0:	144027f3          	csrr	a5,sip
    80003fa4:	ffd7f793          	andi	a5,a5,-3
    80003fa8:	14479073          	csrw	sip,a5
    80003fac:	01813083          	ld	ra,24(sp)
    80003fb0:	01013403          	ld	s0,16(sp)
    80003fb4:	00813483          	ld	s1,8(sp)
    80003fb8:	02010113          	addi	sp,sp,32
    80003fbc:	00008067          	ret
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	3c4080e7          	jalr	964(ra) # 80004384 <plic_claim>
    80003fc8:	00a00793          	li	a5,10
    80003fcc:	00050493          	mv	s1,a0
    80003fd0:	06f50863          	beq	a0,a5,80004040 <kerneltrap+0x12c>
    80003fd4:	fc050ce3          	beqz	a0,80003fac <kerneltrap+0x98>
    80003fd8:	00050593          	mv	a1,a0
    80003fdc:	00002517          	auipc	a0,0x2
    80003fe0:	43c50513          	addi	a0,a0,1084 # 80006418 <_ZTV6Thread+0xf8>
    80003fe4:	00000097          	auipc	ra,0x0
    80003fe8:	7e4080e7          	jalr	2020(ra) # 800047c8 <__printf>
    80003fec:	01013403          	ld	s0,16(sp)
    80003ff0:	01813083          	ld	ra,24(sp)
    80003ff4:	00048513          	mv	a0,s1
    80003ff8:	00813483          	ld	s1,8(sp)
    80003ffc:	02010113          	addi	sp,sp,32
    80004000:	00000317          	auipc	t1,0x0
    80004004:	3bc30067          	jr	956(t1) # 800043bc <plic_complete>
    80004008:	00004517          	auipc	a0,0x4
    8000400c:	7a850513          	addi	a0,a0,1960 # 800087b0 <tickslock>
    80004010:	00001097          	auipc	ra,0x1
    80004014:	48c080e7          	jalr	1164(ra) # 8000549c <acquire>
    80004018:	00003717          	auipc	a4,0x3
    8000401c:	65c70713          	addi	a4,a4,1628 # 80007674 <ticks>
    80004020:	00072783          	lw	a5,0(a4)
    80004024:	00004517          	auipc	a0,0x4
    80004028:	78c50513          	addi	a0,a0,1932 # 800087b0 <tickslock>
    8000402c:	0017879b          	addiw	a5,a5,1
    80004030:	00f72023          	sw	a5,0(a4)
    80004034:	00001097          	auipc	ra,0x1
    80004038:	534080e7          	jalr	1332(ra) # 80005568 <release>
    8000403c:	f65ff06f          	j	80003fa0 <kerneltrap+0x8c>
    80004040:	00001097          	auipc	ra,0x1
    80004044:	090080e7          	jalr	144(ra) # 800050d0 <uartintr>
    80004048:	fa5ff06f          	j	80003fec <kerneltrap+0xd8>
    8000404c:	00002517          	auipc	a0,0x2
    80004050:	3ac50513          	addi	a0,a0,940 # 800063f8 <_ZTV6Thread+0xd8>
    80004054:	00000097          	auipc	ra,0x0
    80004058:	718080e7          	jalr	1816(ra) # 8000476c <panic>

000000008000405c <clockintr>:
    8000405c:	fe010113          	addi	sp,sp,-32
    80004060:	00813823          	sd	s0,16(sp)
    80004064:	00913423          	sd	s1,8(sp)
    80004068:	00113c23          	sd	ra,24(sp)
    8000406c:	02010413          	addi	s0,sp,32
    80004070:	00004497          	auipc	s1,0x4
    80004074:	74048493          	addi	s1,s1,1856 # 800087b0 <tickslock>
    80004078:	00048513          	mv	a0,s1
    8000407c:	00001097          	auipc	ra,0x1
    80004080:	420080e7          	jalr	1056(ra) # 8000549c <acquire>
    80004084:	00003717          	auipc	a4,0x3
    80004088:	5f070713          	addi	a4,a4,1520 # 80007674 <ticks>
    8000408c:	00072783          	lw	a5,0(a4)
    80004090:	01013403          	ld	s0,16(sp)
    80004094:	01813083          	ld	ra,24(sp)
    80004098:	00048513          	mv	a0,s1
    8000409c:	0017879b          	addiw	a5,a5,1
    800040a0:	00813483          	ld	s1,8(sp)
    800040a4:	00f72023          	sw	a5,0(a4)
    800040a8:	02010113          	addi	sp,sp,32
    800040ac:	00001317          	auipc	t1,0x1
    800040b0:	4bc30067          	jr	1212(t1) # 80005568 <release>

00000000800040b4 <devintr>:
    800040b4:	142027f3          	csrr	a5,scause
    800040b8:	00000513          	li	a0,0
    800040bc:	0007c463          	bltz	a5,800040c4 <devintr+0x10>
    800040c0:	00008067          	ret
    800040c4:	fe010113          	addi	sp,sp,-32
    800040c8:	00813823          	sd	s0,16(sp)
    800040cc:	00113c23          	sd	ra,24(sp)
    800040d0:	00913423          	sd	s1,8(sp)
    800040d4:	02010413          	addi	s0,sp,32
    800040d8:	0ff7f713          	andi	a4,a5,255
    800040dc:	00900693          	li	a3,9
    800040e0:	04d70c63          	beq	a4,a3,80004138 <devintr+0x84>
    800040e4:	fff00713          	li	a4,-1
    800040e8:	03f71713          	slli	a4,a4,0x3f
    800040ec:	00170713          	addi	a4,a4,1
    800040f0:	00e78c63          	beq	a5,a4,80004108 <devintr+0x54>
    800040f4:	01813083          	ld	ra,24(sp)
    800040f8:	01013403          	ld	s0,16(sp)
    800040fc:	00813483          	ld	s1,8(sp)
    80004100:	02010113          	addi	sp,sp,32
    80004104:	00008067          	ret
    80004108:	00000097          	auipc	ra,0x0
    8000410c:	c8c080e7          	jalr	-884(ra) # 80003d94 <cpuid>
    80004110:	06050663          	beqz	a0,8000417c <devintr+0xc8>
    80004114:	144027f3          	csrr	a5,sip
    80004118:	ffd7f793          	andi	a5,a5,-3
    8000411c:	14479073          	csrw	sip,a5
    80004120:	01813083          	ld	ra,24(sp)
    80004124:	01013403          	ld	s0,16(sp)
    80004128:	00813483          	ld	s1,8(sp)
    8000412c:	00200513          	li	a0,2
    80004130:	02010113          	addi	sp,sp,32
    80004134:	00008067          	ret
    80004138:	00000097          	auipc	ra,0x0
    8000413c:	24c080e7          	jalr	588(ra) # 80004384 <plic_claim>
    80004140:	00a00793          	li	a5,10
    80004144:	00050493          	mv	s1,a0
    80004148:	06f50663          	beq	a0,a5,800041b4 <devintr+0x100>
    8000414c:	00100513          	li	a0,1
    80004150:	fa0482e3          	beqz	s1,800040f4 <devintr+0x40>
    80004154:	00048593          	mv	a1,s1
    80004158:	00002517          	auipc	a0,0x2
    8000415c:	2c050513          	addi	a0,a0,704 # 80006418 <_ZTV6Thread+0xf8>
    80004160:	00000097          	auipc	ra,0x0
    80004164:	668080e7          	jalr	1640(ra) # 800047c8 <__printf>
    80004168:	00048513          	mv	a0,s1
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	250080e7          	jalr	592(ra) # 800043bc <plic_complete>
    80004174:	00100513          	li	a0,1
    80004178:	f7dff06f          	j	800040f4 <devintr+0x40>
    8000417c:	00004517          	auipc	a0,0x4
    80004180:	63450513          	addi	a0,a0,1588 # 800087b0 <tickslock>
    80004184:	00001097          	auipc	ra,0x1
    80004188:	318080e7          	jalr	792(ra) # 8000549c <acquire>
    8000418c:	00003717          	auipc	a4,0x3
    80004190:	4e870713          	addi	a4,a4,1256 # 80007674 <ticks>
    80004194:	00072783          	lw	a5,0(a4)
    80004198:	00004517          	auipc	a0,0x4
    8000419c:	61850513          	addi	a0,a0,1560 # 800087b0 <tickslock>
    800041a0:	0017879b          	addiw	a5,a5,1
    800041a4:	00f72023          	sw	a5,0(a4)
    800041a8:	00001097          	auipc	ra,0x1
    800041ac:	3c0080e7          	jalr	960(ra) # 80005568 <release>
    800041b0:	f65ff06f          	j	80004114 <devintr+0x60>
    800041b4:	00001097          	auipc	ra,0x1
    800041b8:	f1c080e7          	jalr	-228(ra) # 800050d0 <uartintr>
    800041bc:	fadff06f          	j	80004168 <devintr+0xb4>

00000000800041c0 <kernelvec>:
    800041c0:	f0010113          	addi	sp,sp,-256
    800041c4:	00113023          	sd	ra,0(sp)
    800041c8:	00213423          	sd	sp,8(sp)
    800041cc:	00313823          	sd	gp,16(sp)
    800041d0:	00413c23          	sd	tp,24(sp)
    800041d4:	02513023          	sd	t0,32(sp)
    800041d8:	02613423          	sd	t1,40(sp)
    800041dc:	02713823          	sd	t2,48(sp)
    800041e0:	02813c23          	sd	s0,56(sp)
    800041e4:	04913023          	sd	s1,64(sp)
    800041e8:	04a13423          	sd	a0,72(sp)
    800041ec:	04b13823          	sd	a1,80(sp)
    800041f0:	04c13c23          	sd	a2,88(sp)
    800041f4:	06d13023          	sd	a3,96(sp)
    800041f8:	06e13423          	sd	a4,104(sp)
    800041fc:	06f13823          	sd	a5,112(sp)
    80004200:	07013c23          	sd	a6,120(sp)
    80004204:	09113023          	sd	a7,128(sp)
    80004208:	09213423          	sd	s2,136(sp)
    8000420c:	09313823          	sd	s3,144(sp)
    80004210:	09413c23          	sd	s4,152(sp)
    80004214:	0b513023          	sd	s5,160(sp)
    80004218:	0b613423          	sd	s6,168(sp)
    8000421c:	0b713823          	sd	s7,176(sp)
    80004220:	0b813c23          	sd	s8,184(sp)
    80004224:	0d913023          	sd	s9,192(sp)
    80004228:	0da13423          	sd	s10,200(sp)
    8000422c:	0db13823          	sd	s11,208(sp)
    80004230:	0dc13c23          	sd	t3,216(sp)
    80004234:	0fd13023          	sd	t4,224(sp)
    80004238:	0fe13423          	sd	t5,232(sp)
    8000423c:	0ff13823          	sd	t6,240(sp)
    80004240:	cd5ff0ef          	jal	ra,80003f14 <kerneltrap>
    80004244:	00013083          	ld	ra,0(sp)
    80004248:	00813103          	ld	sp,8(sp)
    8000424c:	01013183          	ld	gp,16(sp)
    80004250:	02013283          	ld	t0,32(sp)
    80004254:	02813303          	ld	t1,40(sp)
    80004258:	03013383          	ld	t2,48(sp)
    8000425c:	03813403          	ld	s0,56(sp)
    80004260:	04013483          	ld	s1,64(sp)
    80004264:	04813503          	ld	a0,72(sp)
    80004268:	05013583          	ld	a1,80(sp)
    8000426c:	05813603          	ld	a2,88(sp)
    80004270:	06013683          	ld	a3,96(sp)
    80004274:	06813703          	ld	a4,104(sp)
    80004278:	07013783          	ld	a5,112(sp)
    8000427c:	07813803          	ld	a6,120(sp)
    80004280:	08013883          	ld	a7,128(sp)
    80004284:	08813903          	ld	s2,136(sp)
    80004288:	09013983          	ld	s3,144(sp)
    8000428c:	09813a03          	ld	s4,152(sp)
    80004290:	0a013a83          	ld	s5,160(sp)
    80004294:	0a813b03          	ld	s6,168(sp)
    80004298:	0b013b83          	ld	s7,176(sp)
    8000429c:	0b813c03          	ld	s8,184(sp)
    800042a0:	0c013c83          	ld	s9,192(sp)
    800042a4:	0c813d03          	ld	s10,200(sp)
    800042a8:	0d013d83          	ld	s11,208(sp)
    800042ac:	0d813e03          	ld	t3,216(sp)
    800042b0:	0e013e83          	ld	t4,224(sp)
    800042b4:	0e813f03          	ld	t5,232(sp)
    800042b8:	0f013f83          	ld	t6,240(sp)
    800042bc:	10010113          	addi	sp,sp,256
    800042c0:	10200073          	sret
    800042c4:	00000013          	nop
    800042c8:	00000013          	nop
    800042cc:	00000013          	nop

00000000800042d0 <timervec>:
    800042d0:	34051573          	csrrw	a0,mscratch,a0
    800042d4:	00b53023          	sd	a1,0(a0)
    800042d8:	00c53423          	sd	a2,8(a0)
    800042dc:	00d53823          	sd	a3,16(a0)
    800042e0:	01853583          	ld	a1,24(a0)
    800042e4:	02053603          	ld	a2,32(a0)
    800042e8:	0005b683          	ld	a3,0(a1)
    800042ec:	00c686b3          	add	a3,a3,a2
    800042f0:	00d5b023          	sd	a3,0(a1)
    800042f4:	00200593          	li	a1,2
    800042f8:	14459073          	csrw	sip,a1
    800042fc:	01053683          	ld	a3,16(a0)
    80004300:	00853603          	ld	a2,8(a0)
    80004304:	00053583          	ld	a1,0(a0)
    80004308:	34051573          	csrrw	a0,mscratch,a0
    8000430c:	30200073          	mret

0000000080004310 <plicinit>:
    80004310:	ff010113          	addi	sp,sp,-16
    80004314:	00813423          	sd	s0,8(sp)
    80004318:	01010413          	addi	s0,sp,16
    8000431c:	00813403          	ld	s0,8(sp)
    80004320:	0c0007b7          	lui	a5,0xc000
    80004324:	00100713          	li	a4,1
    80004328:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000432c:	00e7a223          	sw	a4,4(a5)
    80004330:	01010113          	addi	sp,sp,16
    80004334:	00008067          	ret

0000000080004338 <plicinithart>:
    80004338:	ff010113          	addi	sp,sp,-16
    8000433c:	00813023          	sd	s0,0(sp)
    80004340:	00113423          	sd	ra,8(sp)
    80004344:	01010413          	addi	s0,sp,16
    80004348:	00000097          	auipc	ra,0x0
    8000434c:	a4c080e7          	jalr	-1460(ra) # 80003d94 <cpuid>
    80004350:	0085171b          	slliw	a4,a0,0x8
    80004354:	0c0027b7          	lui	a5,0xc002
    80004358:	00e787b3          	add	a5,a5,a4
    8000435c:	40200713          	li	a4,1026
    80004360:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004364:	00813083          	ld	ra,8(sp)
    80004368:	00013403          	ld	s0,0(sp)
    8000436c:	00d5151b          	slliw	a0,a0,0xd
    80004370:	0c2017b7          	lui	a5,0xc201
    80004374:	00a78533          	add	a0,a5,a0
    80004378:	00052023          	sw	zero,0(a0)
    8000437c:	01010113          	addi	sp,sp,16
    80004380:	00008067          	ret

0000000080004384 <plic_claim>:
    80004384:	ff010113          	addi	sp,sp,-16
    80004388:	00813023          	sd	s0,0(sp)
    8000438c:	00113423          	sd	ra,8(sp)
    80004390:	01010413          	addi	s0,sp,16
    80004394:	00000097          	auipc	ra,0x0
    80004398:	a00080e7          	jalr	-1536(ra) # 80003d94 <cpuid>
    8000439c:	00813083          	ld	ra,8(sp)
    800043a0:	00013403          	ld	s0,0(sp)
    800043a4:	00d5151b          	slliw	a0,a0,0xd
    800043a8:	0c2017b7          	lui	a5,0xc201
    800043ac:	00a78533          	add	a0,a5,a0
    800043b0:	00452503          	lw	a0,4(a0)
    800043b4:	01010113          	addi	sp,sp,16
    800043b8:	00008067          	ret

00000000800043bc <plic_complete>:
    800043bc:	fe010113          	addi	sp,sp,-32
    800043c0:	00813823          	sd	s0,16(sp)
    800043c4:	00913423          	sd	s1,8(sp)
    800043c8:	00113c23          	sd	ra,24(sp)
    800043cc:	02010413          	addi	s0,sp,32
    800043d0:	00050493          	mv	s1,a0
    800043d4:	00000097          	auipc	ra,0x0
    800043d8:	9c0080e7          	jalr	-1600(ra) # 80003d94 <cpuid>
    800043dc:	01813083          	ld	ra,24(sp)
    800043e0:	01013403          	ld	s0,16(sp)
    800043e4:	00d5179b          	slliw	a5,a0,0xd
    800043e8:	0c201737          	lui	a4,0xc201
    800043ec:	00f707b3          	add	a5,a4,a5
    800043f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800043f4:	00813483          	ld	s1,8(sp)
    800043f8:	02010113          	addi	sp,sp,32
    800043fc:	00008067          	ret

0000000080004400 <consolewrite>:
    80004400:	fb010113          	addi	sp,sp,-80
    80004404:	04813023          	sd	s0,64(sp)
    80004408:	04113423          	sd	ra,72(sp)
    8000440c:	02913c23          	sd	s1,56(sp)
    80004410:	03213823          	sd	s2,48(sp)
    80004414:	03313423          	sd	s3,40(sp)
    80004418:	03413023          	sd	s4,32(sp)
    8000441c:	01513c23          	sd	s5,24(sp)
    80004420:	05010413          	addi	s0,sp,80
    80004424:	06c05c63          	blez	a2,8000449c <consolewrite+0x9c>
    80004428:	00060993          	mv	s3,a2
    8000442c:	00050a13          	mv	s4,a0
    80004430:	00058493          	mv	s1,a1
    80004434:	00000913          	li	s2,0
    80004438:	fff00a93          	li	s5,-1
    8000443c:	01c0006f          	j	80004458 <consolewrite+0x58>
    80004440:	fbf44503          	lbu	a0,-65(s0)
    80004444:	0019091b          	addiw	s2,s2,1
    80004448:	00148493          	addi	s1,s1,1
    8000444c:	00001097          	auipc	ra,0x1
    80004450:	a9c080e7          	jalr	-1380(ra) # 80004ee8 <uartputc>
    80004454:	03298063          	beq	s3,s2,80004474 <consolewrite+0x74>
    80004458:	00048613          	mv	a2,s1
    8000445c:	00100693          	li	a3,1
    80004460:	000a0593          	mv	a1,s4
    80004464:	fbf40513          	addi	a0,s0,-65
    80004468:	00000097          	auipc	ra,0x0
    8000446c:	9e4080e7          	jalr	-1564(ra) # 80003e4c <either_copyin>
    80004470:	fd5518e3          	bne	a0,s5,80004440 <consolewrite+0x40>
    80004474:	04813083          	ld	ra,72(sp)
    80004478:	04013403          	ld	s0,64(sp)
    8000447c:	03813483          	ld	s1,56(sp)
    80004480:	02813983          	ld	s3,40(sp)
    80004484:	02013a03          	ld	s4,32(sp)
    80004488:	01813a83          	ld	s5,24(sp)
    8000448c:	00090513          	mv	a0,s2
    80004490:	03013903          	ld	s2,48(sp)
    80004494:	05010113          	addi	sp,sp,80
    80004498:	00008067          	ret
    8000449c:	00000913          	li	s2,0
    800044a0:	fd5ff06f          	j	80004474 <consolewrite+0x74>

00000000800044a4 <consoleread>:
    800044a4:	f9010113          	addi	sp,sp,-112
    800044a8:	06813023          	sd	s0,96(sp)
    800044ac:	04913c23          	sd	s1,88(sp)
    800044b0:	05213823          	sd	s2,80(sp)
    800044b4:	05313423          	sd	s3,72(sp)
    800044b8:	05413023          	sd	s4,64(sp)
    800044bc:	03513c23          	sd	s5,56(sp)
    800044c0:	03613823          	sd	s6,48(sp)
    800044c4:	03713423          	sd	s7,40(sp)
    800044c8:	03813023          	sd	s8,32(sp)
    800044cc:	06113423          	sd	ra,104(sp)
    800044d0:	01913c23          	sd	s9,24(sp)
    800044d4:	07010413          	addi	s0,sp,112
    800044d8:	00060b93          	mv	s7,a2
    800044dc:	00050913          	mv	s2,a0
    800044e0:	00058c13          	mv	s8,a1
    800044e4:	00060b1b          	sext.w	s6,a2
    800044e8:	00004497          	auipc	s1,0x4
    800044ec:	2f048493          	addi	s1,s1,752 # 800087d8 <cons>
    800044f0:	00400993          	li	s3,4
    800044f4:	fff00a13          	li	s4,-1
    800044f8:	00a00a93          	li	s5,10
    800044fc:	05705e63          	blez	s7,80004558 <consoleread+0xb4>
    80004500:	09c4a703          	lw	a4,156(s1)
    80004504:	0984a783          	lw	a5,152(s1)
    80004508:	0007071b          	sext.w	a4,a4
    8000450c:	08e78463          	beq	a5,a4,80004594 <consoleread+0xf0>
    80004510:	07f7f713          	andi	a4,a5,127
    80004514:	00e48733          	add	a4,s1,a4
    80004518:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000451c:	0017869b          	addiw	a3,a5,1
    80004520:	08d4ac23          	sw	a3,152(s1)
    80004524:	00070c9b          	sext.w	s9,a4
    80004528:	0b370663          	beq	a4,s3,800045d4 <consoleread+0x130>
    8000452c:	00100693          	li	a3,1
    80004530:	f9f40613          	addi	a2,s0,-97
    80004534:	000c0593          	mv	a1,s8
    80004538:	00090513          	mv	a0,s2
    8000453c:	f8e40fa3          	sb	a4,-97(s0)
    80004540:	00000097          	auipc	ra,0x0
    80004544:	8c0080e7          	jalr	-1856(ra) # 80003e00 <either_copyout>
    80004548:	01450863          	beq	a0,s4,80004558 <consoleread+0xb4>
    8000454c:	001c0c13          	addi	s8,s8,1
    80004550:	fffb8b9b          	addiw	s7,s7,-1
    80004554:	fb5c94e3          	bne	s9,s5,800044fc <consoleread+0x58>
    80004558:	000b851b          	sext.w	a0,s7
    8000455c:	06813083          	ld	ra,104(sp)
    80004560:	06013403          	ld	s0,96(sp)
    80004564:	05813483          	ld	s1,88(sp)
    80004568:	05013903          	ld	s2,80(sp)
    8000456c:	04813983          	ld	s3,72(sp)
    80004570:	04013a03          	ld	s4,64(sp)
    80004574:	03813a83          	ld	s5,56(sp)
    80004578:	02813b83          	ld	s7,40(sp)
    8000457c:	02013c03          	ld	s8,32(sp)
    80004580:	01813c83          	ld	s9,24(sp)
    80004584:	40ab053b          	subw	a0,s6,a0
    80004588:	03013b03          	ld	s6,48(sp)
    8000458c:	07010113          	addi	sp,sp,112
    80004590:	00008067          	ret
    80004594:	00001097          	auipc	ra,0x1
    80004598:	1d8080e7          	jalr	472(ra) # 8000576c <push_on>
    8000459c:	0984a703          	lw	a4,152(s1)
    800045a0:	09c4a783          	lw	a5,156(s1)
    800045a4:	0007879b          	sext.w	a5,a5
    800045a8:	fef70ce3          	beq	a4,a5,800045a0 <consoleread+0xfc>
    800045ac:	00001097          	auipc	ra,0x1
    800045b0:	234080e7          	jalr	564(ra) # 800057e0 <pop_on>
    800045b4:	0984a783          	lw	a5,152(s1)
    800045b8:	07f7f713          	andi	a4,a5,127
    800045bc:	00e48733          	add	a4,s1,a4
    800045c0:	01874703          	lbu	a4,24(a4)
    800045c4:	0017869b          	addiw	a3,a5,1
    800045c8:	08d4ac23          	sw	a3,152(s1)
    800045cc:	00070c9b          	sext.w	s9,a4
    800045d0:	f5371ee3          	bne	a4,s3,8000452c <consoleread+0x88>
    800045d4:	000b851b          	sext.w	a0,s7
    800045d8:	f96bf2e3          	bgeu	s7,s6,8000455c <consoleread+0xb8>
    800045dc:	08f4ac23          	sw	a5,152(s1)
    800045e0:	f7dff06f          	j	8000455c <consoleread+0xb8>

00000000800045e4 <consputc>:
    800045e4:	10000793          	li	a5,256
    800045e8:	00f50663          	beq	a0,a5,800045f4 <consputc+0x10>
    800045ec:	00001317          	auipc	t1,0x1
    800045f0:	9f430067          	jr	-1548(t1) # 80004fe0 <uartputc_sync>
    800045f4:	ff010113          	addi	sp,sp,-16
    800045f8:	00113423          	sd	ra,8(sp)
    800045fc:	00813023          	sd	s0,0(sp)
    80004600:	01010413          	addi	s0,sp,16
    80004604:	00800513          	li	a0,8
    80004608:	00001097          	auipc	ra,0x1
    8000460c:	9d8080e7          	jalr	-1576(ra) # 80004fe0 <uartputc_sync>
    80004610:	02000513          	li	a0,32
    80004614:	00001097          	auipc	ra,0x1
    80004618:	9cc080e7          	jalr	-1588(ra) # 80004fe0 <uartputc_sync>
    8000461c:	00013403          	ld	s0,0(sp)
    80004620:	00813083          	ld	ra,8(sp)
    80004624:	00800513          	li	a0,8
    80004628:	01010113          	addi	sp,sp,16
    8000462c:	00001317          	auipc	t1,0x1
    80004630:	9b430067          	jr	-1612(t1) # 80004fe0 <uartputc_sync>

0000000080004634 <consoleintr>:
    80004634:	fe010113          	addi	sp,sp,-32
    80004638:	00813823          	sd	s0,16(sp)
    8000463c:	00913423          	sd	s1,8(sp)
    80004640:	01213023          	sd	s2,0(sp)
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	02010413          	addi	s0,sp,32
    8000464c:	00004917          	auipc	s2,0x4
    80004650:	18c90913          	addi	s2,s2,396 # 800087d8 <cons>
    80004654:	00050493          	mv	s1,a0
    80004658:	00090513          	mv	a0,s2
    8000465c:	00001097          	auipc	ra,0x1
    80004660:	e40080e7          	jalr	-448(ra) # 8000549c <acquire>
    80004664:	02048c63          	beqz	s1,8000469c <consoleintr+0x68>
    80004668:	0a092783          	lw	a5,160(s2)
    8000466c:	09892703          	lw	a4,152(s2)
    80004670:	07f00693          	li	a3,127
    80004674:	40e7873b          	subw	a4,a5,a4
    80004678:	02e6e263          	bltu	a3,a4,8000469c <consoleintr+0x68>
    8000467c:	00d00713          	li	a4,13
    80004680:	04e48063          	beq	s1,a4,800046c0 <consoleintr+0x8c>
    80004684:	07f7f713          	andi	a4,a5,127
    80004688:	00e90733          	add	a4,s2,a4
    8000468c:	0017879b          	addiw	a5,a5,1
    80004690:	0af92023          	sw	a5,160(s2)
    80004694:	00970c23          	sb	s1,24(a4)
    80004698:	08f92e23          	sw	a5,156(s2)
    8000469c:	01013403          	ld	s0,16(sp)
    800046a0:	01813083          	ld	ra,24(sp)
    800046a4:	00813483          	ld	s1,8(sp)
    800046a8:	00013903          	ld	s2,0(sp)
    800046ac:	00004517          	auipc	a0,0x4
    800046b0:	12c50513          	addi	a0,a0,300 # 800087d8 <cons>
    800046b4:	02010113          	addi	sp,sp,32
    800046b8:	00001317          	auipc	t1,0x1
    800046bc:	eb030067          	jr	-336(t1) # 80005568 <release>
    800046c0:	00a00493          	li	s1,10
    800046c4:	fc1ff06f          	j	80004684 <consoleintr+0x50>

00000000800046c8 <consoleinit>:
    800046c8:	fe010113          	addi	sp,sp,-32
    800046cc:	00113c23          	sd	ra,24(sp)
    800046d0:	00813823          	sd	s0,16(sp)
    800046d4:	00913423          	sd	s1,8(sp)
    800046d8:	02010413          	addi	s0,sp,32
    800046dc:	00004497          	auipc	s1,0x4
    800046e0:	0fc48493          	addi	s1,s1,252 # 800087d8 <cons>
    800046e4:	00048513          	mv	a0,s1
    800046e8:	00002597          	auipc	a1,0x2
    800046ec:	d8858593          	addi	a1,a1,-632 # 80006470 <_ZTV6Thread+0x150>
    800046f0:	00001097          	auipc	ra,0x1
    800046f4:	d88080e7          	jalr	-632(ra) # 80005478 <initlock>
    800046f8:	00000097          	auipc	ra,0x0
    800046fc:	7ac080e7          	jalr	1964(ra) # 80004ea4 <uartinit>
    80004700:	01813083          	ld	ra,24(sp)
    80004704:	01013403          	ld	s0,16(sp)
    80004708:	00000797          	auipc	a5,0x0
    8000470c:	d9c78793          	addi	a5,a5,-612 # 800044a4 <consoleread>
    80004710:	0af4bc23          	sd	a5,184(s1)
    80004714:	00000797          	auipc	a5,0x0
    80004718:	cec78793          	addi	a5,a5,-788 # 80004400 <consolewrite>
    8000471c:	0cf4b023          	sd	a5,192(s1)
    80004720:	00813483          	ld	s1,8(sp)
    80004724:	02010113          	addi	sp,sp,32
    80004728:	00008067          	ret

000000008000472c <console_read>:
    8000472c:	ff010113          	addi	sp,sp,-16
    80004730:	00813423          	sd	s0,8(sp)
    80004734:	01010413          	addi	s0,sp,16
    80004738:	00813403          	ld	s0,8(sp)
    8000473c:	00004317          	auipc	t1,0x4
    80004740:	15433303          	ld	t1,340(t1) # 80008890 <devsw+0x10>
    80004744:	01010113          	addi	sp,sp,16
    80004748:	00030067          	jr	t1

000000008000474c <console_write>:
    8000474c:	ff010113          	addi	sp,sp,-16
    80004750:	00813423          	sd	s0,8(sp)
    80004754:	01010413          	addi	s0,sp,16
    80004758:	00813403          	ld	s0,8(sp)
    8000475c:	00004317          	auipc	t1,0x4
    80004760:	13c33303          	ld	t1,316(t1) # 80008898 <devsw+0x18>
    80004764:	01010113          	addi	sp,sp,16
    80004768:	00030067          	jr	t1

000000008000476c <panic>:
    8000476c:	fe010113          	addi	sp,sp,-32
    80004770:	00113c23          	sd	ra,24(sp)
    80004774:	00813823          	sd	s0,16(sp)
    80004778:	00913423          	sd	s1,8(sp)
    8000477c:	02010413          	addi	s0,sp,32
    80004780:	00050493          	mv	s1,a0
    80004784:	00002517          	auipc	a0,0x2
    80004788:	cf450513          	addi	a0,a0,-780 # 80006478 <_ZTV6Thread+0x158>
    8000478c:	00004797          	auipc	a5,0x4
    80004790:	1a07a623          	sw	zero,428(a5) # 80008938 <pr+0x18>
    80004794:	00000097          	auipc	ra,0x0
    80004798:	034080e7          	jalr	52(ra) # 800047c8 <__printf>
    8000479c:	00048513          	mv	a0,s1
    800047a0:	00000097          	auipc	ra,0x0
    800047a4:	028080e7          	jalr	40(ra) # 800047c8 <__printf>
    800047a8:	00002517          	auipc	a0,0x2
    800047ac:	b1850513          	addi	a0,a0,-1256 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800047b0:	00000097          	auipc	ra,0x0
    800047b4:	018080e7          	jalr	24(ra) # 800047c8 <__printf>
    800047b8:	00100793          	li	a5,1
    800047bc:	00003717          	auipc	a4,0x3
    800047c0:	eaf72e23          	sw	a5,-324(a4) # 80007678 <panicked>
    800047c4:	0000006f          	j	800047c4 <panic+0x58>

00000000800047c8 <__printf>:
    800047c8:	f3010113          	addi	sp,sp,-208
    800047cc:	08813023          	sd	s0,128(sp)
    800047d0:	07313423          	sd	s3,104(sp)
    800047d4:	09010413          	addi	s0,sp,144
    800047d8:	05813023          	sd	s8,64(sp)
    800047dc:	08113423          	sd	ra,136(sp)
    800047e0:	06913c23          	sd	s1,120(sp)
    800047e4:	07213823          	sd	s2,112(sp)
    800047e8:	07413023          	sd	s4,96(sp)
    800047ec:	05513c23          	sd	s5,88(sp)
    800047f0:	05613823          	sd	s6,80(sp)
    800047f4:	05713423          	sd	s7,72(sp)
    800047f8:	03913c23          	sd	s9,56(sp)
    800047fc:	03a13823          	sd	s10,48(sp)
    80004800:	03b13423          	sd	s11,40(sp)
    80004804:	00004317          	auipc	t1,0x4
    80004808:	11c30313          	addi	t1,t1,284 # 80008920 <pr>
    8000480c:	01832c03          	lw	s8,24(t1)
    80004810:	00b43423          	sd	a1,8(s0)
    80004814:	00c43823          	sd	a2,16(s0)
    80004818:	00d43c23          	sd	a3,24(s0)
    8000481c:	02e43023          	sd	a4,32(s0)
    80004820:	02f43423          	sd	a5,40(s0)
    80004824:	03043823          	sd	a6,48(s0)
    80004828:	03143c23          	sd	a7,56(s0)
    8000482c:	00050993          	mv	s3,a0
    80004830:	4a0c1663          	bnez	s8,80004cdc <__printf+0x514>
    80004834:	60098c63          	beqz	s3,80004e4c <__printf+0x684>
    80004838:	0009c503          	lbu	a0,0(s3)
    8000483c:	00840793          	addi	a5,s0,8
    80004840:	f6f43c23          	sd	a5,-136(s0)
    80004844:	00000493          	li	s1,0
    80004848:	22050063          	beqz	a0,80004a68 <__printf+0x2a0>
    8000484c:	00002a37          	lui	s4,0x2
    80004850:	00018ab7          	lui	s5,0x18
    80004854:	000f4b37          	lui	s6,0xf4
    80004858:	00989bb7          	lui	s7,0x989
    8000485c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004860:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004864:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004868:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000486c:	00148c9b          	addiw	s9,s1,1
    80004870:	02500793          	li	a5,37
    80004874:	01998933          	add	s2,s3,s9
    80004878:	38f51263          	bne	a0,a5,80004bfc <__printf+0x434>
    8000487c:	00094783          	lbu	a5,0(s2)
    80004880:	00078c9b          	sext.w	s9,a5
    80004884:	1e078263          	beqz	a5,80004a68 <__printf+0x2a0>
    80004888:	0024849b          	addiw	s1,s1,2
    8000488c:	07000713          	li	a4,112
    80004890:	00998933          	add	s2,s3,s1
    80004894:	38e78a63          	beq	a5,a4,80004c28 <__printf+0x460>
    80004898:	20f76863          	bltu	a4,a5,80004aa8 <__printf+0x2e0>
    8000489c:	42a78863          	beq	a5,a0,80004ccc <__printf+0x504>
    800048a0:	06400713          	li	a4,100
    800048a4:	40e79663          	bne	a5,a4,80004cb0 <__printf+0x4e8>
    800048a8:	f7843783          	ld	a5,-136(s0)
    800048ac:	0007a603          	lw	a2,0(a5)
    800048b0:	00878793          	addi	a5,a5,8
    800048b4:	f6f43c23          	sd	a5,-136(s0)
    800048b8:	42064a63          	bltz	a2,80004cec <__printf+0x524>
    800048bc:	00a00713          	li	a4,10
    800048c0:	02e677bb          	remuw	a5,a2,a4
    800048c4:	00002d97          	auipc	s11,0x2
    800048c8:	bdcd8d93          	addi	s11,s11,-1060 # 800064a0 <digits>
    800048cc:	00900593          	li	a1,9
    800048d0:	0006051b          	sext.w	a0,a2
    800048d4:	00000c93          	li	s9,0
    800048d8:	02079793          	slli	a5,a5,0x20
    800048dc:	0207d793          	srli	a5,a5,0x20
    800048e0:	00fd87b3          	add	a5,s11,a5
    800048e4:	0007c783          	lbu	a5,0(a5)
    800048e8:	02e656bb          	divuw	a3,a2,a4
    800048ec:	f8f40023          	sb	a5,-128(s0)
    800048f0:	14c5d863          	bge	a1,a2,80004a40 <__printf+0x278>
    800048f4:	06300593          	li	a1,99
    800048f8:	00100c93          	li	s9,1
    800048fc:	02e6f7bb          	remuw	a5,a3,a4
    80004900:	02079793          	slli	a5,a5,0x20
    80004904:	0207d793          	srli	a5,a5,0x20
    80004908:	00fd87b3          	add	a5,s11,a5
    8000490c:	0007c783          	lbu	a5,0(a5)
    80004910:	02e6d73b          	divuw	a4,a3,a4
    80004914:	f8f400a3          	sb	a5,-127(s0)
    80004918:	12a5f463          	bgeu	a1,a0,80004a40 <__printf+0x278>
    8000491c:	00a00693          	li	a3,10
    80004920:	00900593          	li	a1,9
    80004924:	02d777bb          	remuw	a5,a4,a3
    80004928:	02079793          	slli	a5,a5,0x20
    8000492c:	0207d793          	srli	a5,a5,0x20
    80004930:	00fd87b3          	add	a5,s11,a5
    80004934:	0007c503          	lbu	a0,0(a5)
    80004938:	02d757bb          	divuw	a5,a4,a3
    8000493c:	f8a40123          	sb	a0,-126(s0)
    80004940:	48e5f263          	bgeu	a1,a4,80004dc4 <__printf+0x5fc>
    80004944:	06300513          	li	a0,99
    80004948:	02d7f5bb          	remuw	a1,a5,a3
    8000494c:	02059593          	slli	a1,a1,0x20
    80004950:	0205d593          	srli	a1,a1,0x20
    80004954:	00bd85b3          	add	a1,s11,a1
    80004958:	0005c583          	lbu	a1,0(a1)
    8000495c:	02d7d7bb          	divuw	a5,a5,a3
    80004960:	f8b401a3          	sb	a1,-125(s0)
    80004964:	48e57263          	bgeu	a0,a4,80004de8 <__printf+0x620>
    80004968:	3e700513          	li	a0,999
    8000496c:	02d7f5bb          	remuw	a1,a5,a3
    80004970:	02059593          	slli	a1,a1,0x20
    80004974:	0205d593          	srli	a1,a1,0x20
    80004978:	00bd85b3          	add	a1,s11,a1
    8000497c:	0005c583          	lbu	a1,0(a1)
    80004980:	02d7d7bb          	divuw	a5,a5,a3
    80004984:	f8b40223          	sb	a1,-124(s0)
    80004988:	46e57663          	bgeu	a0,a4,80004df4 <__printf+0x62c>
    8000498c:	02d7f5bb          	remuw	a1,a5,a3
    80004990:	02059593          	slli	a1,a1,0x20
    80004994:	0205d593          	srli	a1,a1,0x20
    80004998:	00bd85b3          	add	a1,s11,a1
    8000499c:	0005c583          	lbu	a1,0(a1)
    800049a0:	02d7d7bb          	divuw	a5,a5,a3
    800049a4:	f8b402a3          	sb	a1,-123(s0)
    800049a8:	46ea7863          	bgeu	s4,a4,80004e18 <__printf+0x650>
    800049ac:	02d7f5bb          	remuw	a1,a5,a3
    800049b0:	02059593          	slli	a1,a1,0x20
    800049b4:	0205d593          	srli	a1,a1,0x20
    800049b8:	00bd85b3          	add	a1,s11,a1
    800049bc:	0005c583          	lbu	a1,0(a1)
    800049c0:	02d7d7bb          	divuw	a5,a5,a3
    800049c4:	f8b40323          	sb	a1,-122(s0)
    800049c8:	3eeaf863          	bgeu	s5,a4,80004db8 <__printf+0x5f0>
    800049cc:	02d7f5bb          	remuw	a1,a5,a3
    800049d0:	02059593          	slli	a1,a1,0x20
    800049d4:	0205d593          	srli	a1,a1,0x20
    800049d8:	00bd85b3          	add	a1,s11,a1
    800049dc:	0005c583          	lbu	a1,0(a1)
    800049e0:	02d7d7bb          	divuw	a5,a5,a3
    800049e4:	f8b403a3          	sb	a1,-121(s0)
    800049e8:	42eb7e63          	bgeu	s6,a4,80004e24 <__printf+0x65c>
    800049ec:	02d7f5bb          	remuw	a1,a5,a3
    800049f0:	02059593          	slli	a1,a1,0x20
    800049f4:	0205d593          	srli	a1,a1,0x20
    800049f8:	00bd85b3          	add	a1,s11,a1
    800049fc:	0005c583          	lbu	a1,0(a1)
    80004a00:	02d7d7bb          	divuw	a5,a5,a3
    80004a04:	f8b40423          	sb	a1,-120(s0)
    80004a08:	42ebfc63          	bgeu	s7,a4,80004e40 <__printf+0x678>
    80004a0c:	02079793          	slli	a5,a5,0x20
    80004a10:	0207d793          	srli	a5,a5,0x20
    80004a14:	00fd8db3          	add	s11,s11,a5
    80004a18:	000dc703          	lbu	a4,0(s11)
    80004a1c:	00a00793          	li	a5,10
    80004a20:	00900c93          	li	s9,9
    80004a24:	f8e404a3          	sb	a4,-119(s0)
    80004a28:	00065c63          	bgez	a2,80004a40 <__printf+0x278>
    80004a2c:	f9040713          	addi	a4,s0,-112
    80004a30:	00f70733          	add	a4,a4,a5
    80004a34:	02d00693          	li	a3,45
    80004a38:	fed70823          	sb	a3,-16(a4)
    80004a3c:	00078c93          	mv	s9,a5
    80004a40:	f8040793          	addi	a5,s0,-128
    80004a44:	01978cb3          	add	s9,a5,s9
    80004a48:	f7f40d13          	addi	s10,s0,-129
    80004a4c:	000cc503          	lbu	a0,0(s9)
    80004a50:	fffc8c93          	addi	s9,s9,-1
    80004a54:	00000097          	auipc	ra,0x0
    80004a58:	b90080e7          	jalr	-1136(ra) # 800045e4 <consputc>
    80004a5c:	ffac98e3          	bne	s9,s10,80004a4c <__printf+0x284>
    80004a60:	00094503          	lbu	a0,0(s2)
    80004a64:	e00514e3          	bnez	a0,8000486c <__printf+0xa4>
    80004a68:	1a0c1663          	bnez	s8,80004c14 <__printf+0x44c>
    80004a6c:	08813083          	ld	ra,136(sp)
    80004a70:	08013403          	ld	s0,128(sp)
    80004a74:	07813483          	ld	s1,120(sp)
    80004a78:	07013903          	ld	s2,112(sp)
    80004a7c:	06813983          	ld	s3,104(sp)
    80004a80:	06013a03          	ld	s4,96(sp)
    80004a84:	05813a83          	ld	s5,88(sp)
    80004a88:	05013b03          	ld	s6,80(sp)
    80004a8c:	04813b83          	ld	s7,72(sp)
    80004a90:	04013c03          	ld	s8,64(sp)
    80004a94:	03813c83          	ld	s9,56(sp)
    80004a98:	03013d03          	ld	s10,48(sp)
    80004a9c:	02813d83          	ld	s11,40(sp)
    80004aa0:	0d010113          	addi	sp,sp,208
    80004aa4:	00008067          	ret
    80004aa8:	07300713          	li	a4,115
    80004aac:	1ce78a63          	beq	a5,a4,80004c80 <__printf+0x4b8>
    80004ab0:	07800713          	li	a4,120
    80004ab4:	1ee79e63          	bne	a5,a4,80004cb0 <__printf+0x4e8>
    80004ab8:	f7843783          	ld	a5,-136(s0)
    80004abc:	0007a703          	lw	a4,0(a5)
    80004ac0:	00878793          	addi	a5,a5,8
    80004ac4:	f6f43c23          	sd	a5,-136(s0)
    80004ac8:	28074263          	bltz	a4,80004d4c <__printf+0x584>
    80004acc:	00002d97          	auipc	s11,0x2
    80004ad0:	9d4d8d93          	addi	s11,s11,-1580 # 800064a0 <digits>
    80004ad4:	00f77793          	andi	a5,a4,15
    80004ad8:	00fd87b3          	add	a5,s11,a5
    80004adc:	0007c683          	lbu	a3,0(a5)
    80004ae0:	00f00613          	li	a2,15
    80004ae4:	0007079b          	sext.w	a5,a4
    80004ae8:	f8d40023          	sb	a3,-128(s0)
    80004aec:	0047559b          	srliw	a1,a4,0x4
    80004af0:	0047569b          	srliw	a3,a4,0x4
    80004af4:	00000c93          	li	s9,0
    80004af8:	0ee65063          	bge	a2,a4,80004bd8 <__printf+0x410>
    80004afc:	00f6f693          	andi	a3,a3,15
    80004b00:	00dd86b3          	add	a3,s11,a3
    80004b04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004b08:	0087d79b          	srliw	a5,a5,0x8
    80004b0c:	00100c93          	li	s9,1
    80004b10:	f8d400a3          	sb	a3,-127(s0)
    80004b14:	0cb67263          	bgeu	a2,a1,80004bd8 <__printf+0x410>
    80004b18:	00f7f693          	andi	a3,a5,15
    80004b1c:	00dd86b3          	add	a3,s11,a3
    80004b20:	0006c583          	lbu	a1,0(a3)
    80004b24:	00f00613          	li	a2,15
    80004b28:	0047d69b          	srliw	a3,a5,0x4
    80004b2c:	f8b40123          	sb	a1,-126(s0)
    80004b30:	0047d593          	srli	a1,a5,0x4
    80004b34:	28f67e63          	bgeu	a2,a5,80004dd0 <__printf+0x608>
    80004b38:	00f6f693          	andi	a3,a3,15
    80004b3c:	00dd86b3          	add	a3,s11,a3
    80004b40:	0006c503          	lbu	a0,0(a3)
    80004b44:	0087d813          	srli	a6,a5,0x8
    80004b48:	0087d69b          	srliw	a3,a5,0x8
    80004b4c:	f8a401a3          	sb	a0,-125(s0)
    80004b50:	28b67663          	bgeu	a2,a1,80004ddc <__printf+0x614>
    80004b54:	00f6f693          	andi	a3,a3,15
    80004b58:	00dd86b3          	add	a3,s11,a3
    80004b5c:	0006c583          	lbu	a1,0(a3)
    80004b60:	00c7d513          	srli	a0,a5,0xc
    80004b64:	00c7d69b          	srliw	a3,a5,0xc
    80004b68:	f8b40223          	sb	a1,-124(s0)
    80004b6c:	29067a63          	bgeu	a2,a6,80004e00 <__printf+0x638>
    80004b70:	00f6f693          	andi	a3,a3,15
    80004b74:	00dd86b3          	add	a3,s11,a3
    80004b78:	0006c583          	lbu	a1,0(a3)
    80004b7c:	0107d813          	srli	a6,a5,0x10
    80004b80:	0107d69b          	srliw	a3,a5,0x10
    80004b84:	f8b402a3          	sb	a1,-123(s0)
    80004b88:	28a67263          	bgeu	a2,a0,80004e0c <__printf+0x644>
    80004b8c:	00f6f693          	andi	a3,a3,15
    80004b90:	00dd86b3          	add	a3,s11,a3
    80004b94:	0006c683          	lbu	a3,0(a3)
    80004b98:	0147d79b          	srliw	a5,a5,0x14
    80004b9c:	f8d40323          	sb	a3,-122(s0)
    80004ba0:	21067663          	bgeu	a2,a6,80004dac <__printf+0x5e4>
    80004ba4:	02079793          	slli	a5,a5,0x20
    80004ba8:	0207d793          	srli	a5,a5,0x20
    80004bac:	00fd8db3          	add	s11,s11,a5
    80004bb0:	000dc683          	lbu	a3,0(s11)
    80004bb4:	00800793          	li	a5,8
    80004bb8:	00700c93          	li	s9,7
    80004bbc:	f8d403a3          	sb	a3,-121(s0)
    80004bc0:	00075c63          	bgez	a4,80004bd8 <__printf+0x410>
    80004bc4:	f9040713          	addi	a4,s0,-112
    80004bc8:	00f70733          	add	a4,a4,a5
    80004bcc:	02d00693          	li	a3,45
    80004bd0:	fed70823          	sb	a3,-16(a4)
    80004bd4:	00078c93          	mv	s9,a5
    80004bd8:	f8040793          	addi	a5,s0,-128
    80004bdc:	01978cb3          	add	s9,a5,s9
    80004be0:	f7f40d13          	addi	s10,s0,-129
    80004be4:	000cc503          	lbu	a0,0(s9)
    80004be8:	fffc8c93          	addi	s9,s9,-1
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	9f8080e7          	jalr	-1544(ra) # 800045e4 <consputc>
    80004bf4:	ff9d18e3          	bne	s10,s9,80004be4 <__printf+0x41c>
    80004bf8:	0100006f          	j	80004c08 <__printf+0x440>
    80004bfc:	00000097          	auipc	ra,0x0
    80004c00:	9e8080e7          	jalr	-1560(ra) # 800045e4 <consputc>
    80004c04:	000c8493          	mv	s1,s9
    80004c08:	00094503          	lbu	a0,0(s2)
    80004c0c:	c60510e3          	bnez	a0,8000486c <__printf+0xa4>
    80004c10:	e40c0ee3          	beqz	s8,80004a6c <__printf+0x2a4>
    80004c14:	00004517          	auipc	a0,0x4
    80004c18:	d0c50513          	addi	a0,a0,-756 # 80008920 <pr>
    80004c1c:	00001097          	auipc	ra,0x1
    80004c20:	94c080e7          	jalr	-1716(ra) # 80005568 <release>
    80004c24:	e49ff06f          	j	80004a6c <__printf+0x2a4>
    80004c28:	f7843783          	ld	a5,-136(s0)
    80004c2c:	03000513          	li	a0,48
    80004c30:	01000d13          	li	s10,16
    80004c34:	00878713          	addi	a4,a5,8
    80004c38:	0007bc83          	ld	s9,0(a5)
    80004c3c:	f6e43c23          	sd	a4,-136(s0)
    80004c40:	00000097          	auipc	ra,0x0
    80004c44:	9a4080e7          	jalr	-1628(ra) # 800045e4 <consputc>
    80004c48:	07800513          	li	a0,120
    80004c4c:	00000097          	auipc	ra,0x0
    80004c50:	998080e7          	jalr	-1640(ra) # 800045e4 <consputc>
    80004c54:	00002d97          	auipc	s11,0x2
    80004c58:	84cd8d93          	addi	s11,s11,-1972 # 800064a0 <digits>
    80004c5c:	03ccd793          	srli	a5,s9,0x3c
    80004c60:	00fd87b3          	add	a5,s11,a5
    80004c64:	0007c503          	lbu	a0,0(a5)
    80004c68:	fffd0d1b          	addiw	s10,s10,-1
    80004c6c:	004c9c93          	slli	s9,s9,0x4
    80004c70:	00000097          	auipc	ra,0x0
    80004c74:	974080e7          	jalr	-1676(ra) # 800045e4 <consputc>
    80004c78:	fe0d12e3          	bnez	s10,80004c5c <__printf+0x494>
    80004c7c:	f8dff06f          	j	80004c08 <__printf+0x440>
    80004c80:	f7843783          	ld	a5,-136(s0)
    80004c84:	0007bc83          	ld	s9,0(a5)
    80004c88:	00878793          	addi	a5,a5,8
    80004c8c:	f6f43c23          	sd	a5,-136(s0)
    80004c90:	000c9a63          	bnez	s9,80004ca4 <__printf+0x4dc>
    80004c94:	1080006f          	j	80004d9c <__printf+0x5d4>
    80004c98:	001c8c93          	addi	s9,s9,1
    80004c9c:	00000097          	auipc	ra,0x0
    80004ca0:	948080e7          	jalr	-1720(ra) # 800045e4 <consputc>
    80004ca4:	000cc503          	lbu	a0,0(s9)
    80004ca8:	fe0518e3          	bnez	a0,80004c98 <__printf+0x4d0>
    80004cac:	f5dff06f          	j	80004c08 <__printf+0x440>
    80004cb0:	02500513          	li	a0,37
    80004cb4:	00000097          	auipc	ra,0x0
    80004cb8:	930080e7          	jalr	-1744(ra) # 800045e4 <consputc>
    80004cbc:	000c8513          	mv	a0,s9
    80004cc0:	00000097          	auipc	ra,0x0
    80004cc4:	924080e7          	jalr	-1756(ra) # 800045e4 <consputc>
    80004cc8:	f41ff06f          	j	80004c08 <__printf+0x440>
    80004ccc:	02500513          	li	a0,37
    80004cd0:	00000097          	auipc	ra,0x0
    80004cd4:	914080e7          	jalr	-1772(ra) # 800045e4 <consputc>
    80004cd8:	f31ff06f          	j	80004c08 <__printf+0x440>
    80004cdc:	00030513          	mv	a0,t1
    80004ce0:	00000097          	auipc	ra,0x0
    80004ce4:	7bc080e7          	jalr	1980(ra) # 8000549c <acquire>
    80004ce8:	b4dff06f          	j	80004834 <__printf+0x6c>
    80004cec:	40c0053b          	negw	a0,a2
    80004cf0:	00a00713          	li	a4,10
    80004cf4:	02e576bb          	remuw	a3,a0,a4
    80004cf8:	00001d97          	auipc	s11,0x1
    80004cfc:	7a8d8d93          	addi	s11,s11,1960 # 800064a0 <digits>
    80004d00:	ff700593          	li	a1,-9
    80004d04:	02069693          	slli	a3,a3,0x20
    80004d08:	0206d693          	srli	a3,a3,0x20
    80004d0c:	00dd86b3          	add	a3,s11,a3
    80004d10:	0006c683          	lbu	a3,0(a3)
    80004d14:	02e557bb          	divuw	a5,a0,a4
    80004d18:	f8d40023          	sb	a3,-128(s0)
    80004d1c:	10b65e63          	bge	a2,a1,80004e38 <__printf+0x670>
    80004d20:	06300593          	li	a1,99
    80004d24:	02e7f6bb          	remuw	a3,a5,a4
    80004d28:	02069693          	slli	a3,a3,0x20
    80004d2c:	0206d693          	srli	a3,a3,0x20
    80004d30:	00dd86b3          	add	a3,s11,a3
    80004d34:	0006c683          	lbu	a3,0(a3)
    80004d38:	02e7d73b          	divuw	a4,a5,a4
    80004d3c:	00200793          	li	a5,2
    80004d40:	f8d400a3          	sb	a3,-127(s0)
    80004d44:	bca5ece3          	bltu	a1,a0,8000491c <__printf+0x154>
    80004d48:	ce5ff06f          	j	80004a2c <__printf+0x264>
    80004d4c:	40e007bb          	negw	a5,a4
    80004d50:	00001d97          	auipc	s11,0x1
    80004d54:	750d8d93          	addi	s11,s11,1872 # 800064a0 <digits>
    80004d58:	00f7f693          	andi	a3,a5,15
    80004d5c:	00dd86b3          	add	a3,s11,a3
    80004d60:	0006c583          	lbu	a1,0(a3)
    80004d64:	ff100613          	li	a2,-15
    80004d68:	0047d69b          	srliw	a3,a5,0x4
    80004d6c:	f8b40023          	sb	a1,-128(s0)
    80004d70:	0047d59b          	srliw	a1,a5,0x4
    80004d74:	0ac75e63          	bge	a4,a2,80004e30 <__printf+0x668>
    80004d78:	00f6f693          	andi	a3,a3,15
    80004d7c:	00dd86b3          	add	a3,s11,a3
    80004d80:	0006c603          	lbu	a2,0(a3)
    80004d84:	00f00693          	li	a3,15
    80004d88:	0087d79b          	srliw	a5,a5,0x8
    80004d8c:	f8c400a3          	sb	a2,-127(s0)
    80004d90:	d8b6e4e3          	bltu	a3,a1,80004b18 <__printf+0x350>
    80004d94:	00200793          	li	a5,2
    80004d98:	e2dff06f          	j	80004bc4 <__printf+0x3fc>
    80004d9c:	00001c97          	auipc	s9,0x1
    80004da0:	6e4c8c93          	addi	s9,s9,1764 # 80006480 <_ZTV6Thread+0x160>
    80004da4:	02800513          	li	a0,40
    80004da8:	ef1ff06f          	j	80004c98 <__printf+0x4d0>
    80004dac:	00700793          	li	a5,7
    80004db0:	00600c93          	li	s9,6
    80004db4:	e0dff06f          	j	80004bc0 <__printf+0x3f8>
    80004db8:	00700793          	li	a5,7
    80004dbc:	00600c93          	li	s9,6
    80004dc0:	c69ff06f          	j	80004a28 <__printf+0x260>
    80004dc4:	00300793          	li	a5,3
    80004dc8:	00200c93          	li	s9,2
    80004dcc:	c5dff06f          	j	80004a28 <__printf+0x260>
    80004dd0:	00300793          	li	a5,3
    80004dd4:	00200c93          	li	s9,2
    80004dd8:	de9ff06f          	j	80004bc0 <__printf+0x3f8>
    80004ddc:	00400793          	li	a5,4
    80004de0:	00300c93          	li	s9,3
    80004de4:	dddff06f          	j	80004bc0 <__printf+0x3f8>
    80004de8:	00400793          	li	a5,4
    80004dec:	00300c93          	li	s9,3
    80004df0:	c39ff06f          	j	80004a28 <__printf+0x260>
    80004df4:	00500793          	li	a5,5
    80004df8:	00400c93          	li	s9,4
    80004dfc:	c2dff06f          	j	80004a28 <__printf+0x260>
    80004e00:	00500793          	li	a5,5
    80004e04:	00400c93          	li	s9,4
    80004e08:	db9ff06f          	j	80004bc0 <__printf+0x3f8>
    80004e0c:	00600793          	li	a5,6
    80004e10:	00500c93          	li	s9,5
    80004e14:	dadff06f          	j	80004bc0 <__printf+0x3f8>
    80004e18:	00600793          	li	a5,6
    80004e1c:	00500c93          	li	s9,5
    80004e20:	c09ff06f          	j	80004a28 <__printf+0x260>
    80004e24:	00800793          	li	a5,8
    80004e28:	00700c93          	li	s9,7
    80004e2c:	bfdff06f          	j	80004a28 <__printf+0x260>
    80004e30:	00100793          	li	a5,1
    80004e34:	d91ff06f          	j	80004bc4 <__printf+0x3fc>
    80004e38:	00100793          	li	a5,1
    80004e3c:	bf1ff06f          	j	80004a2c <__printf+0x264>
    80004e40:	00900793          	li	a5,9
    80004e44:	00800c93          	li	s9,8
    80004e48:	be1ff06f          	j	80004a28 <__printf+0x260>
    80004e4c:	00001517          	auipc	a0,0x1
    80004e50:	63c50513          	addi	a0,a0,1596 # 80006488 <_ZTV6Thread+0x168>
    80004e54:	00000097          	auipc	ra,0x0
    80004e58:	918080e7          	jalr	-1768(ra) # 8000476c <panic>

0000000080004e5c <printfinit>:
    80004e5c:	fe010113          	addi	sp,sp,-32
    80004e60:	00813823          	sd	s0,16(sp)
    80004e64:	00913423          	sd	s1,8(sp)
    80004e68:	00113c23          	sd	ra,24(sp)
    80004e6c:	02010413          	addi	s0,sp,32
    80004e70:	00004497          	auipc	s1,0x4
    80004e74:	ab048493          	addi	s1,s1,-1360 # 80008920 <pr>
    80004e78:	00048513          	mv	a0,s1
    80004e7c:	00001597          	auipc	a1,0x1
    80004e80:	61c58593          	addi	a1,a1,1564 # 80006498 <_ZTV6Thread+0x178>
    80004e84:	00000097          	auipc	ra,0x0
    80004e88:	5f4080e7          	jalr	1524(ra) # 80005478 <initlock>
    80004e8c:	01813083          	ld	ra,24(sp)
    80004e90:	01013403          	ld	s0,16(sp)
    80004e94:	0004ac23          	sw	zero,24(s1)
    80004e98:	00813483          	ld	s1,8(sp)
    80004e9c:	02010113          	addi	sp,sp,32
    80004ea0:	00008067          	ret

0000000080004ea4 <uartinit>:
    80004ea4:	ff010113          	addi	sp,sp,-16
    80004ea8:	00813423          	sd	s0,8(sp)
    80004eac:	01010413          	addi	s0,sp,16
    80004eb0:	100007b7          	lui	a5,0x10000
    80004eb4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004eb8:	f8000713          	li	a4,-128
    80004ebc:	00e781a3          	sb	a4,3(a5)
    80004ec0:	00300713          	li	a4,3
    80004ec4:	00e78023          	sb	a4,0(a5)
    80004ec8:	000780a3          	sb	zero,1(a5)
    80004ecc:	00e781a3          	sb	a4,3(a5)
    80004ed0:	00700693          	li	a3,7
    80004ed4:	00d78123          	sb	a3,2(a5)
    80004ed8:	00e780a3          	sb	a4,1(a5)
    80004edc:	00813403          	ld	s0,8(sp)
    80004ee0:	01010113          	addi	sp,sp,16
    80004ee4:	00008067          	ret

0000000080004ee8 <uartputc>:
    80004ee8:	00002797          	auipc	a5,0x2
    80004eec:	7907a783          	lw	a5,1936(a5) # 80007678 <panicked>
    80004ef0:	00078463          	beqz	a5,80004ef8 <uartputc+0x10>
    80004ef4:	0000006f          	j	80004ef4 <uartputc+0xc>
    80004ef8:	fd010113          	addi	sp,sp,-48
    80004efc:	02813023          	sd	s0,32(sp)
    80004f00:	00913c23          	sd	s1,24(sp)
    80004f04:	01213823          	sd	s2,16(sp)
    80004f08:	01313423          	sd	s3,8(sp)
    80004f0c:	02113423          	sd	ra,40(sp)
    80004f10:	03010413          	addi	s0,sp,48
    80004f14:	00002917          	auipc	s2,0x2
    80004f18:	76c90913          	addi	s2,s2,1900 # 80007680 <uart_tx_r>
    80004f1c:	00093783          	ld	a5,0(s2)
    80004f20:	00002497          	auipc	s1,0x2
    80004f24:	76848493          	addi	s1,s1,1896 # 80007688 <uart_tx_w>
    80004f28:	0004b703          	ld	a4,0(s1)
    80004f2c:	02078693          	addi	a3,a5,32
    80004f30:	00050993          	mv	s3,a0
    80004f34:	02e69c63          	bne	a3,a4,80004f6c <uartputc+0x84>
    80004f38:	00001097          	auipc	ra,0x1
    80004f3c:	834080e7          	jalr	-1996(ra) # 8000576c <push_on>
    80004f40:	00093783          	ld	a5,0(s2)
    80004f44:	0004b703          	ld	a4,0(s1)
    80004f48:	02078793          	addi	a5,a5,32
    80004f4c:	00e79463          	bne	a5,a4,80004f54 <uartputc+0x6c>
    80004f50:	0000006f          	j	80004f50 <uartputc+0x68>
    80004f54:	00001097          	auipc	ra,0x1
    80004f58:	88c080e7          	jalr	-1908(ra) # 800057e0 <pop_on>
    80004f5c:	00093783          	ld	a5,0(s2)
    80004f60:	0004b703          	ld	a4,0(s1)
    80004f64:	02078693          	addi	a3,a5,32
    80004f68:	fce688e3          	beq	a3,a4,80004f38 <uartputc+0x50>
    80004f6c:	01f77693          	andi	a3,a4,31
    80004f70:	00004597          	auipc	a1,0x4
    80004f74:	9d058593          	addi	a1,a1,-1584 # 80008940 <uart_tx_buf>
    80004f78:	00d586b3          	add	a3,a1,a3
    80004f7c:	00170713          	addi	a4,a4,1
    80004f80:	01368023          	sb	s3,0(a3)
    80004f84:	00e4b023          	sd	a4,0(s1)
    80004f88:	10000637          	lui	a2,0x10000
    80004f8c:	02f71063          	bne	a4,a5,80004fac <uartputc+0xc4>
    80004f90:	0340006f          	j	80004fc4 <uartputc+0xdc>
    80004f94:	00074703          	lbu	a4,0(a4)
    80004f98:	00f93023          	sd	a5,0(s2)
    80004f9c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004fa0:	00093783          	ld	a5,0(s2)
    80004fa4:	0004b703          	ld	a4,0(s1)
    80004fa8:	00f70e63          	beq	a4,a5,80004fc4 <uartputc+0xdc>
    80004fac:	00564683          	lbu	a3,5(a2)
    80004fb0:	01f7f713          	andi	a4,a5,31
    80004fb4:	00e58733          	add	a4,a1,a4
    80004fb8:	0206f693          	andi	a3,a3,32
    80004fbc:	00178793          	addi	a5,a5,1
    80004fc0:	fc069ae3          	bnez	a3,80004f94 <uartputc+0xac>
    80004fc4:	02813083          	ld	ra,40(sp)
    80004fc8:	02013403          	ld	s0,32(sp)
    80004fcc:	01813483          	ld	s1,24(sp)
    80004fd0:	01013903          	ld	s2,16(sp)
    80004fd4:	00813983          	ld	s3,8(sp)
    80004fd8:	03010113          	addi	sp,sp,48
    80004fdc:	00008067          	ret

0000000080004fe0 <uartputc_sync>:
    80004fe0:	ff010113          	addi	sp,sp,-16
    80004fe4:	00813423          	sd	s0,8(sp)
    80004fe8:	01010413          	addi	s0,sp,16
    80004fec:	00002717          	auipc	a4,0x2
    80004ff0:	68c72703          	lw	a4,1676(a4) # 80007678 <panicked>
    80004ff4:	02071663          	bnez	a4,80005020 <uartputc_sync+0x40>
    80004ff8:	00050793          	mv	a5,a0
    80004ffc:	100006b7          	lui	a3,0x10000
    80005000:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005004:	02077713          	andi	a4,a4,32
    80005008:	fe070ce3          	beqz	a4,80005000 <uartputc_sync+0x20>
    8000500c:	0ff7f793          	andi	a5,a5,255
    80005010:	00f68023          	sb	a5,0(a3)
    80005014:	00813403          	ld	s0,8(sp)
    80005018:	01010113          	addi	sp,sp,16
    8000501c:	00008067          	ret
    80005020:	0000006f          	j	80005020 <uartputc_sync+0x40>

0000000080005024 <uartstart>:
    80005024:	ff010113          	addi	sp,sp,-16
    80005028:	00813423          	sd	s0,8(sp)
    8000502c:	01010413          	addi	s0,sp,16
    80005030:	00002617          	auipc	a2,0x2
    80005034:	65060613          	addi	a2,a2,1616 # 80007680 <uart_tx_r>
    80005038:	00002517          	auipc	a0,0x2
    8000503c:	65050513          	addi	a0,a0,1616 # 80007688 <uart_tx_w>
    80005040:	00063783          	ld	a5,0(a2)
    80005044:	00053703          	ld	a4,0(a0)
    80005048:	04f70263          	beq	a4,a5,8000508c <uartstart+0x68>
    8000504c:	100005b7          	lui	a1,0x10000
    80005050:	00004817          	auipc	a6,0x4
    80005054:	8f080813          	addi	a6,a6,-1808 # 80008940 <uart_tx_buf>
    80005058:	01c0006f          	j	80005074 <uartstart+0x50>
    8000505c:	0006c703          	lbu	a4,0(a3)
    80005060:	00f63023          	sd	a5,0(a2)
    80005064:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005068:	00063783          	ld	a5,0(a2)
    8000506c:	00053703          	ld	a4,0(a0)
    80005070:	00f70e63          	beq	a4,a5,8000508c <uartstart+0x68>
    80005074:	01f7f713          	andi	a4,a5,31
    80005078:	00e806b3          	add	a3,a6,a4
    8000507c:	0055c703          	lbu	a4,5(a1)
    80005080:	00178793          	addi	a5,a5,1
    80005084:	02077713          	andi	a4,a4,32
    80005088:	fc071ae3          	bnez	a4,8000505c <uartstart+0x38>
    8000508c:	00813403          	ld	s0,8(sp)
    80005090:	01010113          	addi	sp,sp,16
    80005094:	00008067          	ret

0000000080005098 <uartgetc>:
    80005098:	ff010113          	addi	sp,sp,-16
    8000509c:	00813423          	sd	s0,8(sp)
    800050a0:	01010413          	addi	s0,sp,16
    800050a4:	10000737          	lui	a4,0x10000
    800050a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800050ac:	0017f793          	andi	a5,a5,1
    800050b0:	00078c63          	beqz	a5,800050c8 <uartgetc+0x30>
    800050b4:	00074503          	lbu	a0,0(a4)
    800050b8:	0ff57513          	andi	a0,a0,255
    800050bc:	00813403          	ld	s0,8(sp)
    800050c0:	01010113          	addi	sp,sp,16
    800050c4:	00008067          	ret
    800050c8:	fff00513          	li	a0,-1
    800050cc:	ff1ff06f          	j	800050bc <uartgetc+0x24>

00000000800050d0 <uartintr>:
    800050d0:	100007b7          	lui	a5,0x10000
    800050d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800050d8:	0017f793          	andi	a5,a5,1
    800050dc:	0a078463          	beqz	a5,80005184 <uartintr+0xb4>
    800050e0:	fe010113          	addi	sp,sp,-32
    800050e4:	00813823          	sd	s0,16(sp)
    800050e8:	00913423          	sd	s1,8(sp)
    800050ec:	00113c23          	sd	ra,24(sp)
    800050f0:	02010413          	addi	s0,sp,32
    800050f4:	100004b7          	lui	s1,0x10000
    800050f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800050fc:	0ff57513          	andi	a0,a0,255
    80005100:	fffff097          	auipc	ra,0xfffff
    80005104:	534080e7          	jalr	1332(ra) # 80004634 <consoleintr>
    80005108:	0054c783          	lbu	a5,5(s1)
    8000510c:	0017f793          	andi	a5,a5,1
    80005110:	fe0794e3          	bnez	a5,800050f8 <uartintr+0x28>
    80005114:	00002617          	auipc	a2,0x2
    80005118:	56c60613          	addi	a2,a2,1388 # 80007680 <uart_tx_r>
    8000511c:	00002517          	auipc	a0,0x2
    80005120:	56c50513          	addi	a0,a0,1388 # 80007688 <uart_tx_w>
    80005124:	00063783          	ld	a5,0(a2)
    80005128:	00053703          	ld	a4,0(a0)
    8000512c:	04f70263          	beq	a4,a5,80005170 <uartintr+0xa0>
    80005130:	100005b7          	lui	a1,0x10000
    80005134:	00004817          	auipc	a6,0x4
    80005138:	80c80813          	addi	a6,a6,-2036 # 80008940 <uart_tx_buf>
    8000513c:	01c0006f          	j	80005158 <uartintr+0x88>
    80005140:	0006c703          	lbu	a4,0(a3)
    80005144:	00f63023          	sd	a5,0(a2)
    80005148:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000514c:	00063783          	ld	a5,0(a2)
    80005150:	00053703          	ld	a4,0(a0)
    80005154:	00f70e63          	beq	a4,a5,80005170 <uartintr+0xa0>
    80005158:	01f7f713          	andi	a4,a5,31
    8000515c:	00e806b3          	add	a3,a6,a4
    80005160:	0055c703          	lbu	a4,5(a1)
    80005164:	00178793          	addi	a5,a5,1
    80005168:	02077713          	andi	a4,a4,32
    8000516c:	fc071ae3          	bnez	a4,80005140 <uartintr+0x70>
    80005170:	01813083          	ld	ra,24(sp)
    80005174:	01013403          	ld	s0,16(sp)
    80005178:	00813483          	ld	s1,8(sp)
    8000517c:	02010113          	addi	sp,sp,32
    80005180:	00008067          	ret
    80005184:	00002617          	auipc	a2,0x2
    80005188:	4fc60613          	addi	a2,a2,1276 # 80007680 <uart_tx_r>
    8000518c:	00002517          	auipc	a0,0x2
    80005190:	4fc50513          	addi	a0,a0,1276 # 80007688 <uart_tx_w>
    80005194:	00063783          	ld	a5,0(a2)
    80005198:	00053703          	ld	a4,0(a0)
    8000519c:	04f70263          	beq	a4,a5,800051e0 <uartintr+0x110>
    800051a0:	100005b7          	lui	a1,0x10000
    800051a4:	00003817          	auipc	a6,0x3
    800051a8:	79c80813          	addi	a6,a6,1948 # 80008940 <uart_tx_buf>
    800051ac:	01c0006f          	j	800051c8 <uartintr+0xf8>
    800051b0:	0006c703          	lbu	a4,0(a3)
    800051b4:	00f63023          	sd	a5,0(a2)
    800051b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800051bc:	00063783          	ld	a5,0(a2)
    800051c0:	00053703          	ld	a4,0(a0)
    800051c4:	02f70063          	beq	a4,a5,800051e4 <uartintr+0x114>
    800051c8:	01f7f713          	andi	a4,a5,31
    800051cc:	00e806b3          	add	a3,a6,a4
    800051d0:	0055c703          	lbu	a4,5(a1)
    800051d4:	00178793          	addi	a5,a5,1
    800051d8:	02077713          	andi	a4,a4,32
    800051dc:	fc071ae3          	bnez	a4,800051b0 <uartintr+0xe0>
    800051e0:	00008067          	ret
    800051e4:	00008067          	ret

00000000800051e8 <kinit>:
    800051e8:	fc010113          	addi	sp,sp,-64
    800051ec:	02913423          	sd	s1,40(sp)
    800051f0:	fffff7b7          	lui	a5,0xfffff
    800051f4:	00004497          	auipc	s1,0x4
    800051f8:	76b48493          	addi	s1,s1,1899 # 8000995f <end+0xfff>
    800051fc:	02813823          	sd	s0,48(sp)
    80005200:	01313c23          	sd	s3,24(sp)
    80005204:	00f4f4b3          	and	s1,s1,a5
    80005208:	02113c23          	sd	ra,56(sp)
    8000520c:	03213023          	sd	s2,32(sp)
    80005210:	01413823          	sd	s4,16(sp)
    80005214:	01513423          	sd	s5,8(sp)
    80005218:	04010413          	addi	s0,sp,64
    8000521c:	000017b7          	lui	a5,0x1
    80005220:	01100993          	li	s3,17
    80005224:	00f487b3          	add	a5,s1,a5
    80005228:	01b99993          	slli	s3,s3,0x1b
    8000522c:	06f9e063          	bltu	s3,a5,8000528c <kinit+0xa4>
    80005230:	00003a97          	auipc	s5,0x3
    80005234:	730a8a93          	addi	s5,s5,1840 # 80008960 <end>
    80005238:	0754ec63          	bltu	s1,s5,800052b0 <kinit+0xc8>
    8000523c:	0734fa63          	bgeu	s1,s3,800052b0 <kinit+0xc8>
    80005240:	00088a37          	lui	s4,0x88
    80005244:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005248:	00002917          	auipc	s2,0x2
    8000524c:	44890913          	addi	s2,s2,1096 # 80007690 <kmem>
    80005250:	00ca1a13          	slli	s4,s4,0xc
    80005254:	0140006f          	j	80005268 <kinit+0x80>
    80005258:	000017b7          	lui	a5,0x1
    8000525c:	00f484b3          	add	s1,s1,a5
    80005260:	0554e863          	bltu	s1,s5,800052b0 <kinit+0xc8>
    80005264:	0534f663          	bgeu	s1,s3,800052b0 <kinit+0xc8>
    80005268:	00001637          	lui	a2,0x1
    8000526c:	00100593          	li	a1,1
    80005270:	00048513          	mv	a0,s1
    80005274:	00000097          	auipc	ra,0x0
    80005278:	5e4080e7          	jalr	1508(ra) # 80005858 <__memset>
    8000527c:	00093783          	ld	a5,0(s2)
    80005280:	00f4b023          	sd	a5,0(s1)
    80005284:	00993023          	sd	s1,0(s2)
    80005288:	fd4498e3          	bne	s1,s4,80005258 <kinit+0x70>
    8000528c:	03813083          	ld	ra,56(sp)
    80005290:	03013403          	ld	s0,48(sp)
    80005294:	02813483          	ld	s1,40(sp)
    80005298:	02013903          	ld	s2,32(sp)
    8000529c:	01813983          	ld	s3,24(sp)
    800052a0:	01013a03          	ld	s4,16(sp)
    800052a4:	00813a83          	ld	s5,8(sp)
    800052a8:	04010113          	addi	sp,sp,64
    800052ac:	00008067          	ret
    800052b0:	00001517          	auipc	a0,0x1
    800052b4:	20850513          	addi	a0,a0,520 # 800064b8 <digits+0x18>
    800052b8:	fffff097          	auipc	ra,0xfffff
    800052bc:	4b4080e7          	jalr	1204(ra) # 8000476c <panic>

00000000800052c0 <freerange>:
    800052c0:	fc010113          	addi	sp,sp,-64
    800052c4:	000017b7          	lui	a5,0x1
    800052c8:	02913423          	sd	s1,40(sp)
    800052cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800052d0:	009504b3          	add	s1,a0,s1
    800052d4:	fffff537          	lui	a0,0xfffff
    800052d8:	02813823          	sd	s0,48(sp)
    800052dc:	02113c23          	sd	ra,56(sp)
    800052e0:	03213023          	sd	s2,32(sp)
    800052e4:	01313c23          	sd	s3,24(sp)
    800052e8:	01413823          	sd	s4,16(sp)
    800052ec:	01513423          	sd	s5,8(sp)
    800052f0:	01613023          	sd	s6,0(sp)
    800052f4:	04010413          	addi	s0,sp,64
    800052f8:	00a4f4b3          	and	s1,s1,a0
    800052fc:	00f487b3          	add	a5,s1,a5
    80005300:	06f5e463          	bltu	a1,a5,80005368 <freerange+0xa8>
    80005304:	00003a97          	auipc	s5,0x3
    80005308:	65ca8a93          	addi	s5,s5,1628 # 80008960 <end>
    8000530c:	0954e263          	bltu	s1,s5,80005390 <freerange+0xd0>
    80005310:	01100993          	li	s3,17
    80005314:	01b99993          	slli	s3,s3,0x1b
    80005318:	0734fc63          	bgeu	s1,s3,80005390 <freerange+0xd0>
    8000531c:	00058a13          	mv	s4,a1
    80005320:	00002917          	auipc	s2,0x2
    80005324:	37090913          	addi	s2,s2,880 # 80007690 <kmem>
    80005328:	00002b37          	lui	s6,0x2
    8000532c:	0140006f          	j	80005340 <freerange+0x80>
    80005330:	000017b7          	lui	a5,0x1
    80005334:	00f484b3          	add	s1,s1,a5
    80005338:	0554ec63          	bltu	s1,s5,80005390 <freerange+0xd0>
    8000533c:	0534fa63          	bgeu	s1,s3,80005390 <freerange+0xd0>
    80005340:	00001637          	lui	a2,0x1
    80005344:	00100593          	li	a1,1
    80005348:	00048513          	mv	a0,s1
    8000534c:	00000097          	auipc	ra,0x0
    80005350:	50c080e7          	jalr	1292(ra) # 80005858 <__memset>
    80005354:	00093703          	ld	a4,0(s2)
    80005358:	016487b3          	add	a5,s1,s6
    8000535c:	00e4b023          	sd	a4,0(s1)
    80005360:	00993023          	sd	s1,0(s2)
    80005364:	fcfa76e3          	bgeu	s4,a5,80005330 <freerange+0x70>
    80005368:	03813083          	ld	ra,56(sp)
    8000536c:	03013403          	ld	s0,48(sp)
    80005370:	02813483          	ld	s1,40(sp)
    80005374:	02013903          	ld	s2,32(sp)
    80005378:	01813983          	ld	s3,24(sp)
    8000537c:	01013a03          	ld	s4,16(sp)
    80005380:	00813a83          	ld	s5,8(sp)
    80005384:	00013b03          	ld	s6,0(sp)
    80005388:	04010113          	addi	sp,sp,64
    8000538c:	00008067          	ret
    80005390:	00001517          	auipc	a0,0x1
    80005394:	12850513          	addi	a0,a0,296 # 800064b8 <digits+0x18>
    80005398:	fffff097          	auipc	ra,0xfffff
    8000539c:	3d4080e7          	jalr	980(ra) # 8000476c <panic>

00000000800053a0 <kfree>:
    800053a0:	fe010113          	addi	sp,sp,-32
    800053a4:	00813823          	sd	s0,16(sp)
    800053a8:	00113c23          	sd	ra,24(sp)
    800053ac:	00913423          	sd	s1,8(sp)
    800053b0:	02010413          	addi	s0,sp,32
    800053b4:	03451793          	slli	a5,a0,0x34
    800053b8:	04079c63          	bnez	a5,80005410 <kfree+0x70>
    800053bc:	00003797          	auipc	a5,0x3
    800053c0:	5a478793          	addi	a5,a5,1444 # 80008960 <end>
    800053c4:	00050493          	mv	s1,a0
    800053c8:	04f56463          	bltu	a0,a5,80005410 <kfree+0x70>
    800053cc:	01100793          	li	a5,17
    800053d0:	01b79793          	slli	a5,a5,0x1b
    800053d4:	02f57e63          	bgeu	a0,a5,80005410 <kfree+0x70>
    800053d8:	00001637          	lui	a2,0x1
    800053dc:	00100593          	li	a1,1
    800053e0:	00000097          	auipc	ra,0x0
    800053e4:	478080e7          	jalr	1144(ra) # 80005858 <__memset>
    800053e8:	00002797          	auipc	a5,0x2
    800053ec:	2a878793          	addi	a5,a5,680 # 80007690 <kmem>
    800053f0:	0007b703          	ld	a4,0(a5)
    800053f4:	01813083          	ld	ra,24(sp)
    800053f8:	01013403          	ld	s0,16(sp)
    800053fc:	00e4b023          	sd	a4,0(s1)
    80005400:	0097b023          	sd	s1,0(a5)
    80005404:	00813483          	ld	s1,8(sp)
    80005408:	02010113          	addi	sp,sp,32
    8000540c:	00008067          	ret
    80005410:	00001517          	auipc	a0,0x1
    80005414:	0a850513          	addi	a0,a0,168 # 800064b8 <digits+0x18>
    80005418:	fffff097          	auipc	ra,0xfffff
    8000541c:	354080e7          	jalr	852(ra) # 8000476c <panic>

0000000080005420 <kalloc>:
    80005420:	fe010113          	addi	sp,sp,-32
    80005424:	00813823          	sd	s0,16(sp)
    80005428:	00913423          	sd	s1,8(sp)
    8000542c:	00113c23          	sd	ra,24(sp)
    80005430:	02010413          	addi	s0,sp,32
    80005434:	00002797          	auipc	a5,0x2
    80005438:	25c78793          	addi	a5,a5,604 # 80007690 <kmem>
    8000543c:	0007b483          	ld	s1,0(a5)
    80005440:	02048063          	beqz	s1,80005460 <kalloc+0x40>
    80005444:	0004b703          	ld	a4,0(s1)
    80005448:	00001637          	lui	a2,0x1
    8000544c:	00500593          	li	a1,5
    80005450:	00048513          	mv	a0,s1
    80005454:	00e7b023          	sd	a4,0(a5)
    80005458:	00000097          	auipc	ra,0x0
    8000545c:	400080e7          	jalr	1024(ra) # 80005858 <__memset>
    80005460:	01813083          	ld	ra,24(sp)
    80005464:	01013403          	ld	s0,16(sp)
    80005468:	00048513          	mv	a0,s1
    8000546c:	00813483          	ld	s1,8(sp)
    80005470:	02010113          	addi	sp,sp,32
    80005474:	00008067          	ret

0000000080005478 <initlock>:
    80005478:	ff010113          	addi	sp,sp,-16
    8000547c:	00813423          	sd	s0,8(sp)
    80005480:	01010413          	addi	s0,sp,16
    80005484:	00813403          	ld	s0,8(sp)
    80005488:	00b53423          	sd	a1,8(a0)
    8000548c:	00052023          	sw	zero,0(a0)
    80005490:	00053823          	sd	zero,16(a0)
    80005494:	01010113          	addi	sp,sp,16
    80005498:	00008067          	ret

000000008000549c <acquire>:
    8000549c:	fe010113          	addi	sp,sp,-32
    800054a0:	00813823          	sd	s0,16(sp)
    800054a4:	00913423          	sd	s1,8(sp)
    800054a8:	00113c23          	sd	ra,24(sp)
    800054ac:	01213023          	sd	s2,0(sp)
    800054b0:	02010413          	addi	s0,sp,32
    800054b4:	00050493          	mv	s1,a0
    800054b8:	10002973          	csrr	s2,sstatus
    800054bc:	100027f3          	csrr	a5,sstatus
    800054c0:	ffd7f793          	andi	a5,a5,-3
    800054c4:	10079073          	csrw	sstatus,a5
    800054c8:	fffff097          	auipc	ra,0xfffff
    800054cc:	8ec080e7          	jalr	-1812(ra) # 80003db4 <mycpu>
    800054d0:	07852783          	lw	a5,120(a0)
    800054d4:	06078e63          	beqz	a5,80005550 <acquire+0xb4>
    800054d8:	fffff097          	auipc	ra,0xfffff
    800054dc:	8dc080e7          	jalr	-1828(ra) # 80003db4 <mycpu>
    800054e0:	07852783          	lw	a5,120(a0)
    800054e4:	0004a703          	lw	a4,0(s1)
    800054e8:	0017879b          	addiw	a5,a5,1
    800054ec:	06f52c23          	sw	a5,120(a0)
    800054f0:	04071063          	bnez	a4,80005530 <acquire+0x94>
    800054f4:	00100713          	li	a4,1
    800054f8:	00070793          	mv	a5,a4
    800054fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005500:	0007879b          	sext.w	a5,a5
    80005504:	fe079ae3          	bnez	a5,800054f8 <acquire+0x5c>
    80005508:	0ff0000f          	fence
    8000550c:	fffff097          	auipc	ra,0xfffff
    80005510:	8a8080e7          	jalr	-1880(ra) # 80003db4 <mycpu>
    80005514:	01813083          	ld	ra,24(sp)
    80005518:	01013403          	ld	s0,16(sp)
    8000551c:	00a4b823          	sd	a0,16(s1)
    80005520:	00013903          	ld	s2,0(sp)
    80005524:	00813483          	ld	s1,8(sp)
    80005528:	02010113          	addi	sp,sp,32
    8000552c:	00008067          	ret
    80005530:	0104b903          	ld	s2,16(s1)
    80005534:	fffff097          	auipc	ra,0xfffff
    80005538:	880080e7          	jalr	-1920(ra) # 80003db4 <mycpu>
    8000553c:	faa91ce3          	bne	s2,a0,800054f4 <acquire+0x58>
    80005540:	00001517          	auipc	a0,0x1
    80005544:	f8050513          	addi	a0,a0,-128 # 800064c0 <digits+0x20>
    80005548:	fffff097          	auipc	ra,0xfffff
    8000554c:	224080e7          	jalr	548(ra) # 8000476c <panic>
    80005550:	00195913          	srli	s2,s2,0x1
    80005554:	fffff097          	auipc	ra,0xfffff
    80005558:	860080e7          	jalr	-1952(ra) # 80003db4 <mycpu>
    8000555c:	00197913          	andi	s2,s2,1
    80005560:	07252e23          	sw	s2,124(a0)
    80005564:	f75ff06f          	j	800054d8 <acquire+0x3c>

0000000080005568 <release>:
    80005568:	fe010113          	addi	sp,sp,-32
    8000556c:	00813823          	sd	s0,16(sp)
    80005570:	00113c23          	sd	ra,24(sp)
    80005574:	00913423          	sd	s1,8(sp)
    80005578:	01213023          	sd	s2,0(sp)
    8000557c:	02010413          	addi	s0,sp,32
    80005580:	00052783          	lw	a5,0(a0)
    80005584:	00079a63          	bnez	a5,80005598 <release+0x30>
    80005588:	00001517          	auipc	a0,0x1
    8000558c:	f4050513          	addi	a0,a0,-192 # 800064c8 <digits+0x28>
    80005590:	fffff097          	auipc	ra,0xfffff
    80005594:	1dc080e7          	jalr	476(ra) # 8000476c <panic>
    80005598:	01053903          	ld	s2,16(a0)
    8000559c:	00050493          	mv	s1,a0
    800055a0:	fffff097          	auipc	ra,0xfffff
    800055a4:	814080e7          	jalr	-2028(ra) # 80003db4 <mycpu>
    800055a8:	fea910e3          	bne	s2,a0,80005588 <release+0x20>
    800055ac:	0004b823          	sd	zero,16(s1)
    800055b0:	0ff0000f          	fence
    800055b4:	0f50000f          	fence	iorw,ow
    800055b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800055bc:	ffffe097          	auipc	ra,0xffffe
    800055c0:	7f8080e7          	jalr	2040(ra) # 80003db4 <mycpu>
    800055c4:	100027f3          	csrr	a5,sstatus
    800055c8:	0027f793          	andi	a5,a5,2
    800055cc:	04079a63          	bnez	a5,80005620 <release+0xb8>
    800055d0:	07852783          	lw	a5,120(a0)
    800055d4:	02f05e63          	blez	a5,80005610 <release+0xa8>
    800055d8:	fff7871b          	addiw	a4,a5,-1
    800055dc:	06e52c23          	sw	a4,120(a0)
    800055e0:	00071c63          	bnez	a4,800055f8 <release+0x90>
    800055e4:	07c52783          	lw	a5,124(a0)
    800055e8:	00078863          	beqz	a5,800055f8 <release+0x90>
    800055ec:	100027f3          	csrr	a5,sstatus
    800055f0:	0027e793          	ori	a5,a5,2
    800055f4:	10079073          	csrw	sstatus,a5
    800055f8:	01813083          	ld	ra,24(sp)
    800055fc:	01013403          	ld	s0,16(sp)
    80005600:	00813483          	ld	s1,8(sp)
    80005604:	00013903          	ld	s2,0(sp)
    80005608:	02010113          	addi	sp,sp,32
    8000560c:	00008067          	ret
    80005610:	00001517          	auipc	a0,0x1
    80005614:	ed850513          	addi	a0,a0,-296 # 800064e8 <digits+0x48>
    80005618:	fffff097          	auipc	ra,0xfffff
    8000561c:	154080e7          	jalr	340(ra) # 8000476c <panic>
    80005620:	00001517          	auipc	a0,0x1
    80005624:	eb050513          	addi	a0,a0,-336 # 800064d0 <digits+0x30>
    80005628:	fffff097          	auipc	ra,0xfffff
    8000562c:	144080e7          	jalr	324(ra) # 8000476c <panic>

0000000080005630 <holding>:
    80005630:	00052783          	lw	a5,0(a0)
    80005634:	00079663          	bnez	a5,80005640 <holding+0x10>
    80005638:	00000513          	li	a0,0
    8000563c:	00008067          	ret
    80005640:	fe010113          	addi	sp,sp,-32
    80005644:	00813823          	sd	s0,16(sp)
    80005648:	00913423          	sd	s1,8(sp)
    8000564c:	00113c23          	sd	ra,24(sp)
    80005650:	02010413          	addi	s0,sp,32
    80005654:	01053483          	ld	s1,16(a0)
    80005658:	ffffe097          	auipc	ra,0xffffe
    8000565c:	75c080e7          	jalr	1884(ra) # 80003db4 <mycpu>
    80005660:	01813083          	ld	ra,24(sp)
    80005664:	01013403          	ld	s0,16(sp)
    80005668:	40a48533          	sub	a0,s1,a0
    8000566c:	00153513          	seqz	a0,a0
    80005670:	00813483          	ld	s1,8(sp)
    80005674:	02010113          	addi	sp,sp,32
    80005678:	00008067          	ret

000000008000567c <push_off>:
    8000567c:	fe010113          	addi	sp,sp,-32
    80005680:	00813823          	sd	s0,16(sp)
    80005684:	00113c23          	sd	ra,24(sp)
    80005688:	00913423          	sd	s1,8(sp)
    8000568c:	02010413          	addi	s0,sp,32
    80005690:	100024f3          	csrr	s1,sstatus
    80005694:	100027f3          	csrr	a5,sstatus
    80005698:	ffd7f793          	andi	a5,a5,-3
    8000569c:	10079073          	csrw	sstatus,a5
    800056a0:	ffffe097          	auipc	ra,0xffffe
    800056a4:	714080e7          	jalr	1812(ra) # 80003db4 <mycpu>
    800056a8:	07852783          	lw	a5,120(a0)
    800056ac:	02078663          	beqz	a5,800056d8 <push_off+0x5c>
    800056b0:	ffffe097          	auipc	ra,0xffffe
    800056b4:	704080e7          	jalr	1796(ra) # 80003db4 <mycpu>
    800056b8:	07852783          	lw	a5,120(a0)
    800056bc:	01813083          	ld	ra,24(sp)
    800056c0:	01013403          	ld	s0,16(sp)
    800056c4:	0017879b          	addiw	a5,a5,1
    800056c8:	06f52c23          	sw	a5,120(a0)
    800056cc:	00813483          	ld	s1,8(sp)
    800056d0:	02010113          	addi	sp,sp,32
    800056d4:	00008067          	ret
    800056d8:	0014d493          	srli	s1,s1,0x1
    800056dc:	ffffe097          	auipc	ra,0xffffe
    800056e0:	6d8080e7          	jalr	1752(ra) # 80003db4 <mycpu>
    800056e4:	0014f493          	andi	s1,s1,1
    800056e8:	06952e23          	sw	s1,124(a0)
    800056ec:	fc5ff06f          	j	800056b0 <push_off+0x34>

00000000800056f0 <pop_off>:
    800056f0:	ff010113          	addi	sp,sp,-16
    800056f4:	00813023          	sd	s0,0(sp)
    800056f8:	00113423          	sd	ra,8(sp)
    800056fc:	01010413          	addi	s0,sp,16
    80005700:	ffffe097          	auipc	ra,0xffffe
    80005704:	6b4080e7          	jalr	1716(ra) # 80003db4 <mycpu>
    80005708:	100027f3          	csrr	a5,sstatus
    8000570c:	0027f793          	andi	a5,a5,2
    80005710:	04079663          	bnez	a5,8000575c <pop_off+0x6c>
    80005714:	07852783          	lw	a5,120(a0)
    80005718:	02f05a63          	blez	a5,8000574c <pop_off+0x5c>
    8000571c:	fff7871b          	addiw	a4,a5,-1
    80005720:	06e52c23          	sw	a4,120(a0)
    80005724:	00071c63          	bnez	a4,8000573c <pop_off+0x4c>
    80005728:	07c52783          	lw	a5,124(a0)
    8000572c:	00078863          	beqz	a5,8000573c <pop_off+0x4c>
    80005730:	100027f3          	csrr	a5,sstatus
    80005734:	0027e793          	ori	a5,a5,2
    80005738:	10079073          	csrw	sstatus,a5
    8000573c:	00813083          	ld	ra,8(sp)
    80005740:	00013403          	ld	s0,0(sp)
    80005744:	01010113          	addi	sp,sp,16
    80005748:	00008067          	ret
    8000574c:	00001517          	auipc	a0,0x1
    80005750:	d9c50513          	addi	a0,a0,-612 # 800064e8 <digits+0x48>
    80005754:	fffff097          	auipc	ra,0xfffff
    80005758:	018080e7          	jalr	24(ra) # 8000476c <panic>
    8000575c:	00001517          	auipc	a0,0x1
    80005760:	d7450513          	addi	a0,a0,-652 # 800064d0 <digits+0x30>
    80005764:	fffff097          	auipc	ra,0xfffff
    80005768:	008080e7          	jalr	8(ra) # 8000476c <panic>

000000008000576c <push_on>:
    8000576c:	fe010113          	addi	sp,sp,-32
    80005770:	00813823          	sd	s0,16(sp)
    80005774:	00113c23          	sd	ra,24(sp)
    80005778:	00913423          	sd	s1,8(sp)
    8000577c:	02010413          	addi	s0,sp,32
    80005780:	100024f3          	csrr	s1,sstatus
    80005784:	100027f3          	csrr	a5,sstatus
    80005788:	0027e793          	ori	a5,a5,2
    8000578c:	10079073          	csrw	sstatus,a5
    80005790:	ffffe097          	auipc	ra,0xffffe
    80005794:	624080e7          	jalr	1572(ra) # 80003db4 <mycpu>
    80005798:	07852783          	lw	a5,120(a0)
    8000579c:	02078663          	beqz	a5,800057c8 <push_on+0x5c>
    800057a0:	ffffe097          	auipc	ra,0xffffe
    800057a4:	614080e7          	jalr	1556(ra) # 80003db4 <mycpu>
    800057a8:	07852783          	lw	a5,120(a0)
    800057ac:	01813083          	ld	ra,24(sp)
    800057b0:	01013403          	ld	s0,16(sp)
    800057b4:	0017879b          	addiw	a5,a5,1
    800057b8:	06f52c23          	sw	a5,120(a0)
    800057bc:	00813483          	ld	s1,8(sp)
    800057c0:	02010113          	addi	sp,sp,32
    800057c4:	00008067          	ret
    800057c8:	0014d493          	srli	s1,s1,0x1
    800057cc:	ffffe097          	auipc	ra,0xffffe
    800057d0:	5e8080e7          	jalr	1512(ra) # 80003db4 <mycpu>
    800057d4:	0014f493          	andi	s1,s1,1
    800057d8:	06952e23          	sw	s1,124(a0)
    800057dc:	fc5ff06f          	j	800057a0 <push_on+0x34>

00000000800057e0 <pop_on>:
    800057e0:	ff010113          	addi	sp,sp,-16
    800057e4:	00813023          	sd	s0,0(sp)
    800057e8:	00113423          	sd	ra,8(sp)
    800057ec:	01010413          	addi	s0,sp,16
    800057f0:	ffffe097          	auipc	ra,0xffffe
    800057f4:	5c4080e7          	jalr	1476(ra) # 80003db4 <mycpu>
    800057f8:	100027f3          	csrr	a5,sstatus
    800057fc:	0027f793          	andi	a5,a5,2
    80005800:	04078463          	beqz	a5,80005848 <pop_on+0x68>
    80005804:	07852783          	lw	a5,120(a0)
    80005808:	02f05863          	blez	a5,80005838 <pop_on+0x58>
    8000580c:	fff7879b          	addiw	a5,a5,-1
    80005810:	06f52c23          	sw	a5,120(a0)
    80005814:	07853783          	ld	a5,120(a0)
    80005818:	00079863          	bnez	a5,80005828 <pop_on+0x48>
    8000581c:	100027f3          	csrr	a5,sstatus
    80005820:	ffd7f793          	andi	a5,a5,-3
    80005824:	10079073          	csrw	sstatus,a5
    80005828:	00813083          	ld	ra,8(sp)
    8000582c:	00013403          	ld	s0,0(sp)
    80005830:	01010113          	addi	sp,sp,16
    80005834:	00008067          	ret
    80005838:	00001517          	auipc	a0,0x1
    8000583c:	cd850513          	addi	a0,a0,-808 # 80006510 <digits+0x70>
    80005840:	fffff097          	auipc	ra,0xfffff
    80005844:	f2c080e7          	jalr	-212(ra) # 8000476c <panic>
    80005848:	00001517          	auipc	a0,0x1
    8000584c:	ca850513          	addi	a0,a0,-856 # 800064f0 <digits+0x50>
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	f1c080e7          	jalr	-228(ra) # 8000476c <panic>

0000000080005858 <__memset>:
    80005858:	ff010113          	addi	sp,sp,-16
    8000585c:	00813423          	sd	s0,8(sp)
    80005860:	01010413          	addi	s0,sp,16
    80005864:	1a060e63          	beqz	a2,80005a20 <__memset+0x1c8>
    80005868:	40a007b3          	neg	a5,a0
    8000586c:	0077f793          	andi	a5,a5,7
    80005870:	00778693          	addi	a3,a5,7
    80005874:	00b00813          	li	a6,11
    80005878:	0ff5f593          	andi	a1,a1,255
    8000587c:	fff6071b          	addiw	a4,a2,-1
    80005880:	1b06e663          	bltu	a3,a6,80005a2c <__memset+0x1d4>
    80005884:	1cd76463          	bltu	a4,a3,80005a4c <__memset+0x1f4>
    80005888:	1a078e63          	beqz	a5,80005a44 <__memset+0x1ec>
    8000588c:	00b50023          	sb	a1,0(a0)
    80005890:	00100713          	li	a4,1
    80005894:	1ae78463          	beq	a5,a4,80005a3c <__memset+0x1e4>
    80005898:	00b500a3          	sb	a1,1(a0)
    8000589c:	00200713          	li	a4,2
    800058a0:	1ae78a63          	beq	a5,a4,80005a54 <__memset+0x1fc>
    800058a4:	00b50123          	sb	a1,2(a0)
    800058a8:	00300713          	li	a4,3
    800058ac:	18e78463          	beq	a5,a4,80005a34 <__memset+0x1dc>
    800058b0:	00b501a3          	sb	a1,3(a0)
    800058b4:	00400713          	li	a4,4
    800058b8:	1ae78263          	beq	a5,a4,80005a5c <__memset+0x204>
    800058bc:	00b50223          	sb	a1,4(a0)
    800058c0:	00500713          	li	a4,5
    800058c4:	1ae78063          	beq	a5,a4,80005a64 <__memset+0x20c>
    800058c8:	00b502a3          	sb	a1,5(a0)
    800058cc:	00700713          	li	a4,7
    800058d0:	18e79e63          	bne	a5,a4,80005a6c <__memset+0x214>
    800058d4:	00b50323          	sb	a1,6(a0)
    800058d8:	00700e93          	li	t4,7
    800058dc:	00859713          	slli	a4,a1,0x8
    800058e0:	00e5e733          	or	a4,a1,a4
    800058e4:	01059e13          	slli	t3,a1,0x10
    800058e8:	01c76e33          	or	t3,a4,t3
    800058ec:	01859313          	slli	t1,a1,0x18
    800058f0:	006e6333          	or	t1,t3,t1
    800058f4:	02059893          	slli	a7,a1,0x20
    800058f8:	40f60e3b          	subw	t3,a2,a5
    800058fc:	011368b3          	or	a7,t1,a7
    80005900:	02859813          	slli	a6,a1,0x28
    80005904:	0108e833          	or	a6,a7,a6
    80005908:	03059693          	slli	a3,a1,0x30
    8000590c:	003e589b          	srliw	a7,t3,0x3
    80005910:	00d866b3          	or	a3,a6,a3
    80005914:	03859713          	slli	a4,a1,0x38
    80005918:	00389813          	slli	a6,a7,0x3
    8000591c:	00f507b3          	add	a5,a0,a5
    80005920:	00e6e733          	or	a4,a3,a4
    80005924:	000e089b          	sext.w	a7,t3
    80005928:	00f806b3          	add	a3,a6,a5
    8000592c:	00e7b023          	sd	a4,0(a5)
    80005930:	00878793          	addi	a5,a5,8
    80005934:	fed79ce3          	bne	a5,a3,8000592c <__memset+0xd4>
    80005938:	ff8e7793          	andi	a5,t3,-8
    8000593c:	0007871b          	sext.w	a4,a5
    80005940:	01d787bb          	addw	a5,a5,t4
    80005944:	0ce88e63          	beq	a7,a4,80005a20 <__memset+0x1c8>
    80005948:	00f50733          	add	a4,a0,a5
    8000594c:	00b70023          	sb	a1,0(a4)
    80005950:	0017871b          	addiw	a4,a5,1
    80005954:	0cc77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005958:	00e50733          	add	a4,a0,a4
    8000595c:	00b70023          	sb	a1,0(a4)
    80005960:	0027871b          	addiw	a4,a5,2
    80005964:	0ac77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005968:	00e50733          	add	a4,a0,a4
    8000596c:	00b70023          	sb	a1,0(a4)
    80005970:	0037871b          	addiw	a4,a5,3
    80005974:	0ac77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005978:	00e50733          	add	a4,a0,a4
    8000597c:	00b70023          	sb	a1,0(a4)
    80005980:	0047871b          	addiw	a4,a5,4
    80005984:	08c77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005988:	00e50733          	add	a4,a0,a4
    8000598c:	00b70023          	sb	a1,0(a4)
    80005990:	0057871b          	addiw	a4,a5,5
    80005994:	08c77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005998:	00e50733          	add	a4,a0,a4
    8000599c:	00b70023          	sb	a1,0(a4)
    800059a0:	0067871b          	addiw	a4,a5,6
    800059a4:	06c77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059a8:	00e50733          	add	a4,a0,a4
    800059ac:	00b70023          	sb	a1,0(a4)
    800059b0:	0077871b          	addiw	a4,a5,7
    800059b4:	06c77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059b8:	00e50733          	add	a4,a0,a4
    800059bc:	00b70023          	sb	a1,0(a4)
    800059c0:	0087871b          	addiw	a4,a5,8
    800059c4:	04c77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059c8:	00e50733          	add	a4,a0,a4
    800059cc:	00b70023          	sb	a1,0(a4)
    800059d0:	0097871b          	addiw	a4,a5,9
    800059d4:	04c77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059d8:	00e50733          	add	a4,a0,a4
    800059dc:	00b70023          	sb	a1,0(a4)
    800059e0:	00a7871b          	addiw	a4,a5,10
    800059e4:	02c77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059e8:	00e50733          	add	a4,a0,a4
    800059ec:	00b70023          	sb	a1,0(a4)
    800059f0:	00b7871b          	addiw	a4,a5,11
    800059f4:	02c77663          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    800059f8:	00e50733          	add	a4,a0,a4
    800059fc:	00b70023          	sb	a1,0(a4)
    80005a00:	00c7871b          	addiw	a4,a5,12
    80005a04:	00c77e63          	bgeu	a4,a2,80005a20 <__memset+0x1c8>
    80005a08:	00e50733          	add	a4,a0,a4
    80005a0c:	00b70023          	sb	a1,0(a4)
    80005a10:	00d7879b          	addiw	a5,a5,13
    80005a14:	00c7f663          	bgeu	a5,a2,80005a20 <__memset+0x1c8>
    80005a18:	00f507b3          	add	a5,a0,a5
    80005a1c:	00b78023          	sb	a1,0(a5)
    80005a20:	00813403          	ld	s0,8(sp)
    80005a24:	01010113          	addi	sp,sp,16
    80005a28:	00008067          	ret
    80005a2c:	00b00693          	li	a3,11
    80005a30:	e55ff06f          	j	80005884 <__memset+0x2c>
    80005a34:	00300e93          	li	t4,3
    80005a38:	ea5ff06f          	j	800058dc <__memset+0x84>
    80005a3c:	00100e93          	li	t4,1
    80005a40:	e9dff06f          	j	800058dc <__memset+0x84>
    80005a44:	00000e93          	li	t4,0
    80005a48:	e95ff06f          	j	800058dc <__memset+0x84>
    80005a4c:	00000793          	li	a5,0
    80005a50:	ef9ff06f          	j	80005948 <__memset+0xf0>
    80005a54:	00200e93          	li	t4,2
    80005a58:	e85ff06f          	j	800058dc <__memset+0x84>
    80005a5c:	00400e93          	li	t4,4
    80005a60:	e7dff06f          	j	800058dc <__memset+0x84>
    80005a64:	00500e93          	li	t4,5
    80005a68:	e75ff06f          	j	800058dc <__memset+0x84>
    80005a6c:	00600e93          	li	t4,6
    80005a70:	e6dff06f          	j	800058dc <__memset+0x84>

0000000080005a74 <__memmove>:
    80005a74:	ff010113          	addi	sp,sp,-16
    80005a78:	00813423          	sd	s0,8(sp)
    80005a7c:	01010413          	addi	s0,sp,16
    80005a80:	0e060863          	beqz	a2,80005b70 <__memmove+0xfc>
    80005a84:	fff6069b          	addiw	a3,a2,-1
    80005a88:	0006881b          	sext.w	a6,a3
    80005a8c:	0ea5e863          	bltu	a1,a0,80005b7c <__memmove+0x108>
    80005a90:	00758713          	addi	a4,a1,7
    80005a94:	00a5e7b3          	or	a5,a1,a0
    80005a98:	40a70733          	sub	a4,a4,a0
    80005a9c:	0077f793          	andi	a5,a5,7
    80005aa0:	00f73713          	sltiu	a4,a4,15
    80005aa4:	00174713          	xori	a4,a4,1
    80005aa8:	0017b793          	seqz	a5,a5
    80005aac:	00e7f7b3          	and	a5,a5,a4
    80005ab0:	10078863          	beqz	a5,80005bc0 <__memmove+0x14c>
    80005ab4:	00900793          	li	a5,9
    80005ab8:	1107f463          	bgeu	a5,a6,80005bc0 <__memmove+0x14c>
    80005abc:	0036581b          	srliw	a6,a2,0x3
    80005ac0:	fff8081b          	addiw	a6,a6,-1
    80005ac4:	02081813          	slli	a6,a6,0x20
    80005ac8:	01d85893          	srli	a7,a6,0x1d
    80005acc:	00858813          	addi	a6,a1,8
    80005ad0:	00058793          	mv	a5,a1
    80005ad4:	00050713          	mv	a4,a0
    80005ad8:	01088833          	add	a6,a7,a6
    80005adc:	0007b883          	ld	a7,0(a5)
    80005ae0:	00878793          	addi	a5,a5,8
    80005ae4:	00870713          	addi	a4,a4,8
    80005ae8:	ff173c23          	sd	a7,-8(a4)
    80005aec:	ff0798e3          	bne	a5,a6,80005adc <__memmove+0x68>
    80005af0:	ff867713          	andi	a4,a2,-8
    80005af4:	02071793          	slli	a5,a4,0x20
    80005af8:	0207d793          	srli	a5,a5,0x20
    80005afc:	00f585b3          	add	a1,a1,a5
    80005b00:	40e686bb          	subw	a3,a3,a4
    80005b04:	00f507b3          	add	a5,a0,a5
    80005b08:	06e60463          	beq	a2,a4,80005b70 <__memmove+0xfc>
    80005b0c:	0005c703          	lbu	a4,0(a1)
    80005b10:	00e78023          	sb	a4,0(a5)
    80005b14:	04068e63          	beqz	a3,80005b70 <__memmove+0xfc>
    80005b18:	0015c603          	lbu	a2,1(a1)
    80005b1c:	00100713          	li	a4,1
    80005b20:	00c780a3          	sb	a2,1(a5)
    80005b24:	04e68663          	beq	a3,a4,80005b70 <__memmove+0xfc>
    80005b28:	0025c603          	lbu	a2,2(a1)
    80005b2c:	00200713          	li	a4,2
    80005b30:	00c78123          	sb	a2,2(a5)
    80005b34:	02e68e63          	beq	a3,a4,80005b70 <__memmove+0xfc>
    80005b38:	0035c603          	lbu	a2,3(a1)
    80005b3c:	00300713          	li	a4,3
    80005b40:	00c781a3          	sb	a2,3(a5)
    80005b44:	02e68663          	beq	a3,a4,80005b70 <__memmove+0xfc>
    80005b48:	0045c603          	lbu	a2,4(a1)
    80005b4c:	00400713          	li	a4,4
    80005b50:	00c78223          	sb	a2,4(a5)
    80005b54:	00e68e63          	beq	a3,a4,80005b70 <__memmove+0xfc>
    80005b58:	0055c603          	lbu	a2,5(a1)
    80005b5c:	00500713          	li	a4,5
    80005b60:	00c782a3          	sb	a2,5(a5)
    80005b64:	00e68663          	beq	a3,a4,80005b70 <__memmove+0xfc>
    80005b68:	0065c703          	lbu	a4,6(a1)
    80005b6c:	00e78323          	sb	a4,6(a5)
    80005b70:	00813403          	ld	s0,8(sp)
    80005b74:	01010113          	addi	sp,sp,16
    80005b78:	00008067          	ret
    80005b7c:	02061713          	slli	a4,a2,0x20
    80005b80:	02075713          	srli	a4,a4,0x20
    80005b84:	00e587b3          	add	a5,a1,a4
    80005b88:	f0f574e3          	bgeu	a0,a5,80005a90 <__memmove+0x1c>
    80005b8c:	02069613          	slli	a2,a3,0x20
    80005b90:	02065613          	srli	a2,a2,0x20
    80005b94:	fff64613          	not	a2,a2
    80005b98:	00e50733          	add	a4,a0,a4
    80005b9c:	00c78633          	add	a2,a5,a2
    80005ba0:	fff7c683          	lbu	a3,-1(a5)
    80005ba4:	fff78793          	addi	a5,a5,-1
    80005ba8:	fff70713          	addi	a4,a4,-1
    80005bac:	00d70023          	sb	a3,0(a4)
    80005bb0:	fec798e3          	bne	a5,a2,80005ba0 <__memmove+0x12c>
    80005bb4:	00813403          	ld	s0,8(sp)
    80005bb8:	01010113          	addi	sp,sp,16
    80005bbc:	00008067          	ret
    80005bc0:	02069713          	slli	a4,a3,0x20
    80005bc4:	02075713          	srli	a4,a4,0x20
    80005bc8:	00170713          	addi	a4,a4,1
    80005bcc:	00e50733          	add	a4,a0,a4
    80005bd0:	00050793          	mv	a5,a0
    80005bd4:	0005c683          	lbu	a3,0(a1)
    80005bd8:	00178793          	addi	a5,a5,1
    80005bdc:	00158593          	addi	a1,a1,1
    80005be0:	fed78fa3          	sb	a3,-1(a5)
    80005be4:	fee798e3          	bne	a5,a4,80005bd4 <__memmove+0x160>
    80005be8:	f89ff06f          	j	80005b70 <__memmove+0xfc>
	...
