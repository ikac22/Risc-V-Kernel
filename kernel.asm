
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	d5813103          	ld	sp,-680(sp) # 80009d58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	649040ef          	jal	ra,80004e64 <start>

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
    80001270:	00009717          	auipc	a4,0x9
    80001274:	d0070713          	addi	a4,a4,-768 # 80009f70 <_ZN3TCB16timeSliceCounterE>
    80001278:	00073783          	ld	a5,0(a4)
    8000127c:	00178793          	addi	a5,a5,1
    80001280:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80001284:	00009717          	auipc	a4,0x9
    80001288:	cf470713          	addi	a4,a4,-780 # 80009f78 <_ZN3TCB7runningE>
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
    800012d0:	00009797          	auipc	a5,0x9
    800012d4:	ca07b023          	sd	zero,-864(a5) # 80009f70 <_ZN3TCB16timeSliceCounterE>
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
    800013a4:	00009797          	auipc	a5,0x9
    800013a8:	b9478793          	addi	a5,a5,-1132 # 80009f38 <_ZN5StdIO7obufferE>
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
    800014ac:	00009797          	auipc	a5,0x9
    800014b0:	acc78793          	addi	a5,a5,-1332 # 80009f78 <_ZN3TCB7runningE>
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
    800014d0:	00009797          	auipc	a5,0x9
    800014d4:	aa07b023          	sd	zero,-1376(a5) # 80009f70 <_ZN3TCB16timeSliceCounterE>
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
    80001520:	00009797          	auipc	a5,0x9
    80001524:	a0078793          	addi	a5,a5,-1536 # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    800015b4:	00009797          	auipc	a5,0x9
    800015b8:	98c78793          	addi	a5,a5,-1652 # 80009f40 <_ZN5StdIO7ibufferE>
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
    800016e4:	00009797          	auipc	a5,0x9
    800016e8:	85478793          	addi	a5,a5,-1964 # 80009f38 <_ZN5StdIO7obufferE>
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
    800017e4:	00008797          	auipc	a5,0x8
    800017e8:	79478793          	addi	a5,a5,1940 # 80009f78 <_ZN3TCB7runningE>
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
    8000180c:	00008797          	auipc	a5,0x8
    80001810:	7607b223          	sd	zero,1892(a5) # 80009f70 <_ZN3TCB16timeSliceCounterE>
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
    80001860:	00008797          	auipc	a5,0x8
    80001864:	6c078793          	addi	a5,a5,1728 # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    800018ec:	00008797          	auipc	a5,0x8
    800018f0:	65478793          	addi	a5,a5,1620 # 80009f40 <_ZN5StdIO7ibufferE>
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
    800019d4:	00008797          	auipc	a5,0x8
    800019d8:	5a478793          	addi	a5,a5,1444 # 80009f78 <_ZN3TCB7runningE>
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
    800019ec:	00006517          	auipc	a0,0x6
    800019f0:	63450513          	addi	a0,a0,1588 # 80008020 <CONSOLE_STATUS+0x10>
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	1f4080e7          	jalr	500(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    800019fc:	00006517          	auipc	a0,0x6
    80001a00:	65c50513          	addi	a0,a0,1628 # 80008058 <CONSOLE_STATUS+0x48>
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	1e4080e7          	jalr	484(ra) # 80001be8 <_Z12kprintStringPKc>
    80001a0c:	01000593          	li	a1,16
    80001a10:	00048513          	mv	a0,s1
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	21c080e7          	jalr	540(ra) # 80001c30 <_Z9kprintIntmi>
    80001a1c:	00007517          	auipc	a0,0x7
    80001a20:	8a450513          	addi	a0,a0,-1884 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1c4080e7          	jalr	452(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    80001a2c:	00006517          	auipc	a0,0x6
    80001a30:	63c50513          	addi	a0,a0,1596 # 80008068 <CONSOLE_STATUS+0x58>
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
    80001a54:	00007517          	auipc	a0,0x7
    80001a58:	86c50513          	addi	a0,a0,-1940 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	18c080e7          	jalr	396(ra) # 80001be8 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80001a64:	00006517          	auipc	a0,0x6
    80001a68:	60c50513          	addi	a0,a0,1548 # 80008070 <CONSOLE_STATUS+0x60>
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	17c080e7          	jalr	380(ra) # 80001be8 <_Z12kprintStringPKc>
    80001a74:	01000593          	li	a1,16
    80001a78:	00090513          	mv	a0,s2
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	1b4080e7          	jalr	436(ra) # 80001c30 <_Z9kprintIntmi>
    80001a84:	00006517          	auipc	a0,0x6
    80001a88:	5f450513          	addi	a0,a0,1524 # 80008078 <CONSOLE_STATUS+0x68>
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	15c080e7          	jalr	348(ra) # 80001be8 <_Z12kprintStringPKc>
            TCB::running->finish();
    80001a94:	00008797          	auipc	a5,0x8
    80001a98:	4e478793          	addi	a5,a5,1252 # 80009f78 <_ZN3TCB7runningE>
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
    80001b00:	00006517          	auipc	a0,0x6
    80001b04:	58050513          	addi	a0,a0,1408 # 80008080 <CONSOLE_STATUS+0x70>
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
    80001bb4:	00006797          	auipc	a5,0x6
    80001bb8:	45478793          	addi	a5,a5,1108 # 80008008 <CONSOLE_TX_DATA>
    80001bbc:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    80001bc0:	00006797          	auipc	a5,0x6
    80001bc4:	45078793          	addi	a5,a5,1104 # 80008010 <CONSOLE_STATUS>
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
    80001c58:	00008717          	auipc	a4,0x8
    80001c5c:	0c870713          	addi	a4,a4,200 # 80009d20 <kdigits>
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
    80001cd0:	00006517          	auipc	a0,0x6
    80001cd4:	3e850513          	addi	a0,a0,1000 # 800080b8 <CONSOLE_STATUS+0xa8>
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	f10080e7          	jalr	-240(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("HEAP_START_ADDR: "); kprintInt((uint64)HEAP_START_ADDR,16); kprintString("\n");
    80001ce0:	00006517          	auipc	a0,0x6
    80001ce4:	40850513          	addi	a0,a0,1032 # 800080e8 <CONSOLE_STATUS+0xd8>
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	f00080e7          	jalr	-256(ra) # 80001be8 <_Z12kprintStringPKc>
    80001cf0:	01000593          	li	a1,16
    80001cf4:	00008797          	auipc	a5,0x8
    80001cf8:	01c78793          	addi	a5,a5,28 # 80009d10 <HEAP_START_ADDR>
    80001cfc:	0007b503          	ld	a0,0(a5)
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f30080e7          	jalr	-208(ra) # 80001c30 <_Z9kprintIntmi>
    80001d08:	00006517          	auipc	a0,0x6
    80001d0c:	5b850513          	addi	a0,a0,1464 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	ed8080e7          	jalr	-296(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("HEAP_END_ADDR: "); kprintInt((uint64)HEAP_END_ADDR,16); kprintString("\n");
    80001d18:	00006517          	auipc	a0,0x6
    80001d1c:	3e850513          	addi	a0,a0,1000 # 80008100 <CONSOLE_STATUS+0xf0>
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	ec8080e7          	jalr	-312(ra) # 80001be8 <_Z12kprintStringPKc>
    80001d28:	01000593          	li	a1,16
    80001d2c:	00008797          	auipc	a5,0x8
    80001d30:	fdc78793          	addi	a5,a5,-36 # 80009d08 <HEAP_END_ADDR>
    80001d34:	0007b503          	ld	a0,0(a5)
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	ef8080e7          	jalr	-264(ra) # 80001c30 <_Z9kprintIntmi>
    80001d40:	00006517          	auipc	a0,0x6
    80001d44:	58050513          	addi	a0,a0,1408 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	ea0080e7          	jalr	-352(ra) # 80001be8 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec);
    80001d50:	fffff797          	auipc	a5,0xfffff
    80001d54:	2b078793          	addi	a5,a5,688 # 80001000 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    80001d58:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80001d5c:	00006517          	auipc	a0,0x6
    80001d60:	3b450513          	addi	a0,a0,948 # 80008110 <CONSOLE_STATUS+0x100>
    80001d64:	00000097          	auipc	ra,0x0
    80001d68:	e84080e7          	jalr	-380(ra) # 80001be8 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance();
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	33c080e7          	jalr	828(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    kprintString("MemoryAllocator initalized!\n");
    80001d74:	00006517          	auipc	a0,0x6
    80001d78:	3b450513          	addi	a0,a0,948 # 80008128 <CONSOLE_STATUS+0x118>
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	e6c080e7          	jalr	-404(ra) # 80001be8 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	b68080e7          	jalr	-1176(ra) # 800028ec <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80001d8c:	00006517          	auipc	a0,0x6
    80001d90:	3bc50513          	addi	a0,a0,956 # 80008148 <CONSOLE_STATUS+0x138>
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	e54080e7          	jalr	-428(ra) # 80001be8 <_Z12kprintStringPKc>
    StdIO::initalize();
    80001d9c:	00001097          	auipc	ra,0x1
    80001da0:	0f4080e7          	jalr	244(ra) # 80002e90 <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80001da4:	00006517          	auipc	a0,0x6
    80001da8:	3bc50513          	addi	a0,a0,956 # 80008160 <CONSOLE_STATUS+0x150>
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	e3c080e7          	jalr	-452(ra) # 80001be8 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80001db4:	00002097          	auipc	ra,0x2
    80001db8:	ab4080e7          	jalr	-1356(ra) # 80003868 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80001dbc:	00006517          	auipc	a0,0x6
    80001dc0:	3bc50513          	addi	a0,a0,956 # 80008178 <CONSOLE_STATUS+0x168>
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	e24080e7          	jalr	-476(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80001dcc:	00006517          	auipc	a0,0x6
    80001dd0:	3cc50513          	addi	a0,a0,972 # 80008198 <CONSOLE_STATUS+0x188>
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
    80001e40:	00006517          	auipc	a0,0x6
    80001e44:	38850513          	addi	a0,a0,904 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80001e48:	00000097          	auipc	ra,0x0
    80001e4c:	da0080e7          	jalr	-608(ra) # 80001be8 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80001e50:	00006517          	auipc	a0,0x6
    80001e54:	3a050513          	addi	a0,a0,928 # 800081f0 <CONSOLE_STATUS+0x1e0>
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
    80001ecc:	00008497          	auipc	s1,0x8
    80001ed0:	0ac48493          	addi	s1,s1,172 # 80009f78 <_ZN3TCB7runningE>
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
    80001fe0:	00008797          	auipc	a5,0x8
    80001fe4:	f4078793          	addi	a5,a5,-192 # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    80002054:	00008717          	auipc	a4,0x8
    80002058:	ecf73623          	sd	a5,-308(a4) # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    80002074:	00008797          	auipc	a5,0x8
    80002078:	eac78793          	addi	a5,a5,-340 # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    800020b4:	00008797          	auipc	a5,0x8
    800020b8:	efc7c783          	lbu	a5,-260(a5) # 80009fb0 <_ZN15MemoryAllocator9allocatorE>
    800020bc:	04079663          	bnez	a5,80002108 <_ZN15MemoryAllocator11getInstanceEv+0x60>
        allocator.fall_head = nullptr;
    800020c0:	00008717          	auipc	a4,0x8
    800020c4:	ef070713          	addi	a4,a4,-272 # 80009fb0 <_ZN15MemoryAllocator9allocatorE>
    800020c8:	00073823          	sd	zero,16(a4)
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    800020cc:	00008697          	auipc	a3,0x8
    800020d0:	c4468693          	addi	a3,a3,-956 # 80009d10 <HEAP_START_ADDR>
    800020d4:	0006b783          	ld	a5,0(a3)
    800020d8:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    800020dc:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    800020e0:	00008797          	auipc	a5,0x8
    800020e4:	c2878793          	addi	a5,a5,-984 # 80009d08 <HEAP_END_ADDR>
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
    80002108:	00008517          	auipc	a0,0x8
    8000210c:	ea850513          	addi	a0,a0,-344 # 80009fb0 <_ZN15MemoryAllocator9allocatorE>
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
    80002204:	00008797          	auipc	a5,0x8
    80002208:	b0c78793          	addi	a5,a5,-1268 # 80009d10 <HEAP_START_ADDR>
    8000220c:	0007b783          	ld	a5,0(a5)
    80002210:	04f5ee63          	bltu	a1,a5,8000226c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80002214:	00008797          	auipc	a5,0x8
    80002218:	af478793          	addi	a5,a5,-1292 # 80009d08 <HEAP_END_ADDR>
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
    800023c8:	00006517          	auipc	a0,0x6
    800023cc:	e5850513          	addi	a0,a0,-424 # 80008220 <CONSOLE_STATUS+0x210>
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
    800023f8:	00006517          	auipc	a0,0x6
    800023fc:	ec850513          	addi	a0,a0,-312 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	7e8080e7          	jalr	2024(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80002408:	00a00593          	li	a1,10
    8000240c:	0084b503          	ld	a0,8(s1)
    80002410:	00000097          	auipc	ra,0x0
    80002414:	820080e7          	jalr	-2016(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    80002418:	00006517          	auipc	a0,0x6
    8000241c:	ea850513          	addi	a0,a0,-344 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80002420:	fffff097          	auipc	ra,0xfffff
    80002424:	7c8080e7          	jalr	1992(ra) # 80001be8 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002428:	0004b483          	ld	s1,0(s1)
    8000242c:	fb9ff06f          	j	800023e4 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80002430:	00006517          	auipc	a0,0x6
    80002434:	e1050513          	addi	a0,a0,-496 # 80008240 <CONSOLE_STATUS+0x230>
    80002438:	fffff097          	auipc	ra,0xfffff
    8000243c:	7b0080e7          	jalr	1968(ra) # 80001be8 <_Z12kprintStringPKc>
    80002440:	fa1ff06f          	j	800023e0 <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    80002444:	00006517          	auipc	a0,0x6
    80002448:	e1450513          	addi	a0,a0,-492 # 80008258 <CONSOLE_STATUS+0x248>
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
    80002480:	00006517          	auipc	a0,0x6
    80002484:	df850513          	addi	a0,a0,-520 # 80008278 <CONSOLE_STATUS+0x268>
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
    800024b0:	00006517          	auipc	a0,0x6
    800024b4:	e1050513          	addi	a0,a0,-496 # 800082c0 <CONSOLE_STATUS+0x2b0>
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	730080e7          	jalr	1840(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    800024c0:	00a00593          	li	a1,10
    800024c4:	0084b503          	ld	a0,8(s1)
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	768080e7          	jalr	1896(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800024d0:	00006517          	auipc	a0,0x6
    800024d4:	df050513          	addi	a0,a0,-528 # 800082c0 <CONSOLE_STATUS+0x2b0>
    800024d8:	fffff097          	auipc	ra,0xfffff
    800024dc:	710080e7          	jalr	1808(ra) # 80001be8 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    800024e0:	0004b483          	ld	s1,0(s1)
    800024e4:	fb9ff06f          	j	8000249c <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    800024e8:	00006517          	auipc	a0,0x6
    800024ec:	d5850513          	addi	a0,a0,-680 # 80008240 <CONSOLE_STATUS+0x230>
    800024f0:	fffff097          	auipc	ra,0xfffff
    800024f4:	6f8080e7          	jalr	1784(ra) # 80001be8 <_Z12kprintStringPKc>
    800024f8:	fa1ff06f          	j	80002498 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    800024fc:	00006517          	auipc	a0,0x6
    80002500:	d5c50513          	addi	a0,a0,-676 # 80008258 <CONSOLE_STATUS+0x248>
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
    80002568:	00006517          	auipc	a0,0x6
    8000256c:	d6050513          	addi	a0,a0,-672 # 800082c8 <CONSOLE_STATUS+0x2b8>
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
    80002590:	00006517          	auipc	a0,0x6
    80002594:	d1050513          	addi	a0,a0,-752 # 800082a0 <CONSOLE_STATUS+0x290>
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
    800026a8:	00006517          	auipc	a0,0x6
    800026ac:	c4050513          	addi	a0,a0,-960 # 800082e8 <CONSOLE_STATUS+0x2d8>
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	538080e7          	jalr	1336(ra) # 80001be8 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    800026b8:	00a00593          	li	a1,10
    800026bc:	00048513          	mv	a0,s1
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	570080e7          	jalr	1392(ra) # 80001c30 <_Z9kprintIntmi>
        kprintString("\n");
    800026c8:	00006517          	auipc	a0,0x6
    800026cc:	bf850513          	addi	a0,a0,-1032 # 800082c0 <CONSOLE_STATUS+0x2b0>
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	518080e7          	jalr	1304(ra) # 80001be8 <_Z12kprintStringPKc>
        t = t->next;            
    800026d8:	0004b483          	ld	s1,0(s1)
    while(t){
    800026dc:	fc9ff06f          	j	800026a4 <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    800026e0:	00006517          	auipc	a0,0x6
    800026e4:	be050513          	addi	a0,a0,-1056 # 800082c0 <CONSOLE_STATUS+0x2b0>
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
    80002864:	00007797          	auipc	a5,0x7
    80002868:	76478793          	addi	a5,a5,1892 # 80009fc8 <_ZN9Scheduler5queueE>
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
    80002898:	00007517          	auipc	a0,0x7
    8000289c:	73050513          	addi	a0,a0,1840 # 80009fc8 <_ZN9Scheduler5queueE>
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
    800028cc:	00007517          	auipc	a0,0x7
    800028d0:	6fc50513          	addi	a0,a0,1788 # 80009fc8 <_ZN9Scheduler5queueE>
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
    8000292c:	00007517          	auipc	a0,0x7
    80002930:	69c50513          	addi	a0,a0,1692 # 80009fc8 <_ZN9Scheduler5queueE>
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
    8000296c:	00007517          	auipc	a0,0x7
    80002970:	67450513          	addi	a0,a0,1652 # 80009fe0 <_ZN9Scheduler8sleepingE>
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
    800029a4:	00007517          	auipc	a0,0x7
    800029a8:	63c50513          	addi	a0,a0,1596 # 80009fe0 <_ZN9Scheduler8sleepingE>
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
    800029d4:	00007917          	auipc	s2,0x7
    800029d8:	60c90913          	addi	s2,s2,1548 # 80009fe0 <_ZN9Scheduler8sleepingE>
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
    80002d48:	00005797          	auipc	a5,0x5
    80002d4c:	2c878793          	addi	a5,a5,712 # 80008010 <CONSOLE_STATUS>
    80002d50:	0007b783          	ld	a5,0(a5)
    80002d54:	00007717          	auipc	a4,0x7
    80002d58:	20f73223          	sd	a5,516(a4) # 80009f58 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80002d5c:	00005797          	auipc	a5,0x5
    80002d60:	2a478793          	addi	a5,a5,676 # 80008000 <CONSOLE_RX_DATA>
    80002d64:	0007b783          	ld	a5,0(a5)
    80002d68:	00007717          	auipc	a4,0x7
    80002d6c:	1ef73423          	sd	a5,488(a4) # 80009f50 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80002d70:	00005797          	auipc	a5,0x5
    80002d74:	29878793          	addi	a5,a5,664 # 80008008 <CONSOLE_TX_DATA>
    80002d78:	0007b783          	ld	a5,0(a5)
    80002d7c:	00007717          	auipc	a4,0x7
    80002d80:	1cf73623          	sd	a5,460(a4) # 80009f48 <_ZN5StdIO5odataE>
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
    80002da8:	00007797          	auipc	a5,0x7
    80002dac:	1807b023          	sd	zero,384(a5) # 80009f28 <_ZN5StdIO10out_threadE>
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
    80002dcc:	00007797          	auipc	a5,0x7
    80002dd0:	1ac78793          	addi	a5,a5,428 # 80009f78 <_ZN3TCB7runningE>
    80002dd4:	0007b783          	ld	a5,0(a5)
    80002dd8:	00007717          	auipc	a4,0x7
    80002ddc:	14f73823          	sd	a5,336(a4) # 80009f28 <_ZN5StdIO10out_threadE>
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
    80002df0:	00007797          	auipc	a5,0x7
    80002df4:	16878793          	addi	a5,a5,360 # 80009f58 <_ZN5StdIO8iostatusE>
    80002df8:	0007b783          	ld	a5,0(a5)
    80002dfc:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80002e00:	0207f793          	andi	a5,a5,32
    80002e04:	fa0788e3          	beqz	a5,80002db4 <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80002e08:	00007797          	auipc	a5,0x7
    80002e0c:	13078793          	addi	a5,a5,304 # 80009f38 <_ZN5StdIO7obufferE>
    80002e10:	0007b483          	ld	s1,0(a5)
    80002e14:	00007797          	auipc	a5,0x7
    80002e18:	13478793          	addi	a5,a5,308 # 80009f48 <_ZN5StdIO5odataE>
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
    80002ed8:	00007497          	auipc	s1,0x7
    80002edc:	04848493          	addi	s1,s1,72 # 80009f20 <_ZN10KSemaphore16activeSemaphoresE>
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
    80002f2c:	00007797          	auipc	a5,0x7
    80002f30:	00a7ba23          	sd	a0,20(a5) # 80009f40 <_ZN5StdIO7ibufferE>
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
    80002fa4:	00007797          	auipc	a5,0x7
    80002fa8:	f8a7ba23          	sd	a0,-108(a5) # 80009f38 <_ZN5StdIO7obufferE>
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
    80002fdc:	00007797          	auipc	a5,0x7
    80002fe0:	f4a7ba23          	sd	a0,-172(a5) # 80009f30 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80002fe4:	00005797          	auipc	a5,0x5
    80002fe8:	02c78793          	addi	a5,a5,44 # 80008010 <CONSOLE_STATUS>
    80002fec:	0007b783          	ld	a5,0(a5)
    80002ff0:	00007717          	auipc	a4,0x7
    80002ff4:	f6f73423          	sd	a5,-152(a4) # 80009f58 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80002ff8:	00005797          	auipc	a5,0x5
    80002ffc:	00878793          	addi	a5,a5,8 # 80008000 <CONSOLE_RX_DATA>
    80003000:	0007b783          	ld	a5,0(a5)
    80003004:	00007717          	auipc	a4,0x7
    80003008:	f4f73623          	sd	a5,-180(a4) # 80009f50 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    8000300c:	00005797          	auipc	a5,0x5
    80003010:	ffc78793          	addi	a5,a5,-4 # 80008008 <CONSOLE_TX_DATA>
    80003014:	0007b783          	ld	a5,0(a5)
    80003018:	00007717          	auipc	a4,0x7
    8000301c:	f2f73823          	sd	a5,-208(a4) # 80009f48 <_ZN5StdIO5odataE>
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
    8000304c:	00007797          	auipc	a5,0x7
    80003050:	eca7be23          	sd	a0,-292(a5) # 80009f28 <_ZN5StdIO10out_threadE>
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
    800030ac:	00002097          	auipc	ra,0x2
    800030b0:	618080e7          	jalr	1560(ra) # 800056c4 <plic_claim>
    if(t == CONSOLE_IRQ)
    800030b4:	00a00793          	li	a5,10
    800030b8:	12f51063          	bne	a0,a5,800031d8 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    800030bc:	00007797          	auipc	a5,0x7
    800030c0:	e9c78793          	addi	a5,a5,-356 # 80009f58 <_ZN5StdIO8iostatusE>
    800030c4:	0007b783          	ld	a5,0(a5)
    800030c8:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    800030cc:	0017f793          	andi	a5,a5,1
    800030d0:	0a078263          	beqz	a5,80003174 <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    800030d4:	00007797          	auipc	a5,0x7
    800030d8:	e7c78793          	addi	a5,a5,-388 # 80009f50 <_ZN5StdIO5idataE>
    800030dc:	0007b783          	ld	a5,0(a5)
    800030e0:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    800030e4:	00a00513          	li	a0,10
    800030e8:	00002097          	auipc	ra,0x2
    800030ec:	614080e7          	jalr	1556(ra) # 800056fc <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    800030f0:	00007797          	auipc	a5,0x7
    800030f4:	e5078793          	addi	a5,a5,-432 # 80009f40 <_ZN5StdIO7ibufferE>
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
    80003178:	00002097          	auipc	ra,0x2
    8000317c:	584080e7          	jalr	1412(ra) # 800056fc <plic_complete>
            if(out_thread != nullptr)
    80003180:	00007797          	auipc	a5,0x7
    80003184:	da878793          	addi	a5,a5,-600 # 80009f28 <_ZN5StdIO10out_threadE>
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
    800031a8:	00007797          	auipc	a5,0x7
    800031ac:	d8078793          	addi	a5,a5,-640 # 80009f28 <_ZN5StdIO10out_threadE>
    800031b0:	0007b583          	ld	a1,0(a5)
    800031b4:	00007517          	auipc	a0,0x7
    800031b8:	e1450513          	addi	a0,a0,-492 # 80009fc8 <_ZN9Scheduler5queueE>
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
    800031d8:	00002097          	auipc	ra,0x2
    800031dc:	524080e7          	jalr	1316(ra) # 800056fc <plic_complete>
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
    8000330c:	00005797          	auipc	a5,0x5
    80003310:	02478793          	addi	a5,a5,36 # 80008330 <_ZTV6Thread+0x10>
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
    800033fc:	00005797          	auipc	a5,0x5
    80003400:	f3478793          	addi	a5,a5,-204 # 80008330 <_ZTV6Thread+0x10>
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
    80003504:	00005797          	auipc	a5,0x5
    80003508:	dfc78793          	addi	a5,a5,-516 # 80008300 <_ZTV14PeriodicThread+0x10>
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
    80003568:	00005797          	auipc	a5,0x5
    8000356c:	d9878793          	addi	a5,a5,-616 # 80008300 <_ZTV14PeriodicThread+0x10>
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
    800035a4:	00005797          	auipc	a5,0x5
    800035a8:	d5c78793          	addi	a5,a5,-676 # 80008300 <_ZTV14PeriodicThread+0x10>
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
    80003660:	00007717          	auipc	a4,0x7
    80003664:	90070713          	addi	a4,a4,-1792 # 80009f60 <_ZN3TCB9threadsUpE>
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
    8000370c:	00008097          	auipc	ra,0x8
    80003710:	9cc080e7          	jalr	-1588(ra) # 8000b0d8 <_Unwind_Resume>
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
    80003744:	00007797          	auipc	a5,0x7
    80003748:	83478793          	addi	a5,a5,-1996 # 80009f78 <_ZN3TCB7runningE>
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
    800037b4:	00006797          	auipc	a5,0x6
    800037b8:	7c478793          	addi	a5,a5,1988 # 80009f78 <_ZN3TCB7runningE>
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
    800037e8:	00006797          	auipc	a5,0x6
    800037ec:	79078793          	addi	a5,a5,1936 # 80009f78 <_ZN3TCB7runningE>
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
    80003868:	00006797          	auipc	a5,0x6
    8000386c:	70078793          	addi	a5,a5,1792 # 80009f68 <_ZN3TCB12kernelThreadE>
    80003870:	0007b783          	ld	a5,0(a5)
    80003874:	00078e63          	beqz	a5,80003890 <_ZN3TCB22createMainKernelThreadEv+0x28>
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    80003878:	00006797          	auipc	a5,0x6
    8000387c:	6f078793          	addi	a5,a5,1776 # 80009f68 <_ZN3TCB12kernelThreadE>
    80003880:	0007b503          	ld	a0,0(a5)
    80003884:	00006797          	auipc	a5,0x6
    80003888:	6ea7ba23          	sd	a0,1780(a5) # 80009f78 <_ZN3TCB7runningE>
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
    800038b4:	00006797          	auipc	a5,0x6
    800038b8:	6aa7ba23          	sd	a0,1716(a5) # 80009f68 <_ZN3TCB12kernelThreadE>
    void setKernelMode() { userMode = false; }
    800038bc:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    800038c0:	00100793          	li	a5,1
    800038c4:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    800038c8:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    800038cc:	00006797          	auipc	a5,0x6
    800038d0:	69c78793          	addi	a5,a5,1692 # 80009f68 <_ZN3TCB12kernelThreadE>
    800038d4:	0007b503          	ld	a0,0(a5)
    800038d8:	00006797          	auipc	a5,0x6
    800038dc:	6aa7b023          	sd	a0,1696(a5) # 80009f78 <_ZN3TCB7runningE>
}
    800038e0:	00813083          	ld	ra,8(sp)
    800038e4:	00013403          	ld	s0,0(sp)
    800038e8:	01010113          	addi	sp,sp,16
    800038ec:	00008067          	ret

00000000800038f0 <_ZN3TCB9endKernelEv>:

int TCB::endKernel()
{
    if(kernelThread)
    800038f0:	00006797          	auipc	a5,0x6
    800038f4:	67878793          	addi	a5,a5,1656 # 80009f68 <_ZN3TCB12kernelThreadE>
    800038f8:	0007b583          	ld	a1,0(a5)
    800038fc:	04058463          	beqz	a1,80003944 <_ZN3TCB9endKernelEv+0x54>
{
    80003900:	ff010113          	addi	sp,sp,-16
    80003904:	00113423          	sd	ra,8(sp)
    80003908:	00813023          	sd	s0,0(sp)
    8000390c:	01010413          	addi	s0,sp,16
    80003910:	00006517          	auipc	a0,0x6
    80003914:	6b850513          	addi	a0,a0,1720 # 80009fc8 <_ZN9Scheduler5queueE>
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	ea8080e7          	jalr	-344(ra) # 800027c0 <_ZN8TcbQueue11insertFrontEP3TCB>
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
    80003920:	00006797          	auipc	a5,0x6
    80003924:	6407b423          	sd	zero,1608(a5) # 80009f68 <_ZN3TCB12kernelThreadE>
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
    80003960:	00006797          	auipc	a5,0x6
    80003964:	61878793          	addi	a5,a5,1560 # 80009f78 <_ZN3TCB7runningE>
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
    80003990:	00006797          	auipc	a5,0x6
    80003994:	5d078793          	addi	a5,a5,1488 # 80009f60 <_ZN3TCB9threadsUpE>
    80003998:	0007a703          	lw	a4,0(a5)
    8000399c:	00200793          	li	a5,2
    800039a0:	00e7cc63          	blt	a5,a4,800039b8 <_ZN3TCB8dispatchEv+0x6c>
    800039a4:	00006797          	auipc	a5,0x6
    800039a8:	59478793          	addi	a5,a5,1428 # 80009f38 <_ZN5StdIO7obufferE>
    800039ac:	0007b783          	ld	a5,0(a5)
    800039b0:	4807a783          	lw	a5,1152(a5)
    800039b4:	08078263          	beqz	a5,80003a38 <_ZN3TCB8dispatchEv+0xec>
    running = Scheduler::get(); 
    800039b8:	fffff097          	auipc	ra,0xfffff
    800039bc:	ed0080e7          	jalr	-304(ra) # 80002888 <_ZN9Scheduler3getEv>
    800039c0:	00006797          	auipc	a5,0x6
    800039c4:	5aa7bc23          	sd	a0,1464(a5) # 80009f78 <_ZN3TCB7runningE>
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
    800039ec:	00006717          	auipc	a4,0x6
    800039f0:	57470713          	addi	a4,a4,1396 # 80009f60 <_ZN3TCB9threadsUpE>
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
    80003a8c:	00006797          	auipc	a5,0x6
    80003a90:	4ec78793          	addi	a5,a5,1260 # 80009f78 <_ZN3TCB7runningE>
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
    80003ad4:	00006797          	auipc	a5,0x6
    80003ad8:	52478793          	addi	a5,a5,1316 # 80009ff8 <_ZN3TCB12panicContextE>
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
    80003b00:	00006797          	auipc	a5,0x6
    80003b04:	47878793          	addi	a5,a5,1144 # 80009f78 <_ZN3TCB7runningE>
    80003b08:	0007b503          	ld	a0,0(a5)
    80003b0c:	00006597          	auipc	a1,0x6
    80003b10:	4ec58593          	addi	a1,a1,1260 # 80009ff8 <_ZN3TCB12panicContextE>
    80003b14:	03850513          	addi	a0,a0,56
    80003b18:	ffffd097          	auipc	ra,0xffffd
    80003b1c:	5f8080e7          	jalr	1528(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    80003b20:	00813083          	ld	ra,8(sp)
    80003b24:	00013403          	ld	s0,0(sp)
    80003b28:	01010113          	addi	sp,sp,16
    80003b2c:	00008067          	ret

0000000080003b30 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003b30:	fe010113          	addi	sp,sp,-32
    80003b34:	00113c23          	sd	ra,24(sp)
    80003b38:	00813823          	sd	s0,16(sp)
    80003b3c:	00913423          	sd	s1,8(sp)
    80003b40:	01213023          	sd	s2,0(sp)
    80003b44:	02010413          	addi	s0,sp,32
    80003b48:	00050493          	mv	s1,a0
    80003b4c:	00058913          	mv	s2,a1
    80003b50:	0015879b          	addiw	a5,a1,1
    80003b54:	0007851b          	sext.w	a0,a5
    80003b58:	00f4a023          	sw	a5,0(s1)
    80003b5c:	0004a823          	sw	zero,16(s1)
    80003b60:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003b64:	00251513          	slli	a0,a0,0x2
    80003b68:	fffff097          	auipc	ra,0xfffff
    80003b6c:	ef4080e7          	jalr	-268(ra) # 80002a5c <mem_alloc>
    80003b70:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003b74:	00000593          	li	a1,0
    80003b78:	02048513          	addi	a0,s1,32
    80003b7c:	fffff097          	auipc	ra,0xfffff
    80003b80:	024080e7          	jalr	36(ra) # 80002ba0 <sem_open>
    sem_open(&spaceAvailable, _cap);
    80003b84:	00090593          	mv	a1,s2
    80003b88:	01848513          	addi	a0,s1,24
    80003b8c:	fffff097          	auipc	ra,0xfffff
    80003b90:	014080e7          	jalr	20(ra) # 80002ba0 <sem_open>
    sem_open(&mutexHead, 1);
    80003b94:	00100593          	li	a1,1
    80003b98:	02848513          	addi	a0,s1,40
    80003b9c:	fffff097          	auipc	ra,0xfffff
    80003ba0:	004080e7          	jalr	4(ra) # 80002ba0 <sem_open>
    sem_open(&mutexTail, 1);
    80003ba4:	00100593          	li	a1,1
    80003ba8:	03048513          	addi	a0,s1,48
    80003bac:	fffff097          	auipc	ra,0xfffff
    80003bb0:	ff4080e7          	jalr	-12(ra) # 80002ba0 <sem_open>
}
    80003bb4:	01813083          	ld	ra,24(sp)
    80003bb8:	01013403          	ld	s0,16(sp)
    80003bbc:	00813483          	ld	s1,8(sp)
    80003bc0:	00013903          	ld	s2,0(sp)
    80003bc4:	02010113          	addi	sp,sp,32
    80003bc8:	00008067          	ret

0000000080003bcc <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003bcc:	fe010113          	addi	sp,sp,-32
    80003bd0:	00113c23          	sd	ra,24(sp)
    80003bd4:	00813823          	sd	s0,16(sp)
    80003bd8:	00913423          	sd	s1,8(sp)
    80003bdc:	01213023          	sd	s2,0(sp)
    80003be0:	02010413          	addi	s0,sp,32
    80003be4:	00050493          	mv	s1,a0
    80003be8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003bec:	01853503          	ld	a0,24(a0)
    80003bf0:	fffff097          	auipc	ra,0xfffff
    80003bf4:	024080e7          	jalr	36(ra) # 80002c14 <sem_wait>

    sem_wait(mutexTail);
    80003bf8:	0304b503          	ld	a0,48(s1)
    80003bfc:	fffff097          	auipc	ra,0xfffff
    80003c00:	018080e7          	jalr	24(ra) # 80002c14 <sem_wait>
    buffer[tail] = val;
    80003c04:	0084b783          	ld	a5,8(s1)
    80003c08:	0144a703          	lw	a4,20(s1)
    80003c0c:	00271713          	slli	a4,a4,0x2
    80003c10:	00e787b3          	add	a5,a5,a4
    80003c14:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003c18:	0144a783          	lw	a5,20(s1)
    80003c1c:	0017879b          	addiw	a5,a5,1
    80003c20:	0004a703          	lw	a4,0(s1)
    80003c24:	02e7e7bb          	remw	a5,a5,a4
    80003c28:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003c2c:	0304b503          	ld	a0,48(s1)
    80003c30:	fffff097          	auipc	ra,0xfffff
    80003c34:	01c080e7          	jalr	28(ra) # 80002c4c <sem_signal>

    sem_signal(itemAvailable);
    80003c38:	0204b503          	ld	a0,32(s1)
    80003c3c:	fffff097          	auipc	ra,0xfffff
    80003c40:	010080e7          	jalr	16(ra) # 80002c4c <sem_signal>

}
    80003c44:	01813083          	ld	ra,24(sp)
    80003c48:	01013403          	ld	s0,16(sp)
    80003c4c:	00813483          	ld	s1,8(sp)
    80003c50:	00013903          	ld	s2,0(sp)
    80003c54:	02010113          	addi	sp,sp,32
    80003c58:	00008067          	ret

0000000080003c5c <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003c5c:	fe010113          	addi	sp,sp,-32
    80003c60:	00113c23          	sd	ra,24(sp)
    80003c64:	00813823          	sd	s0,16(sp)
    80003c68:	00913423          	sd	s1,8(sp)
    80003c6c:	01213023          	sd	s2,0(sp)
    80003c70:	02010413          	addi	s0,sp,32
    80003c74:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003c78:	02053503          	ld	a0,32(a0)
    80003c7c:	fffff097          	auipc	ra,0xfffff
    80003c80:	f98080e7          	jalr	-104(ra) # 80002c14 <sem_wait>

    sem_wait(mutexHead);
    80003c84:	0284b503          	ld	a0,40(s1)
    80003c88:	fffff097          	auipc	ra,0xfffff
    80003c8c:	f8c080e7          	jalr	-116(ra) # 80002c14 <sem_wait>

    int ret = buffer[head];
    80003c90:	0084b703          	ld	a4,8(s1)
    80003c94:	0104a783          	lw	a5,16(s1)
    80003c98:	00279693          	slli	a3,a5,0x2
    80003c9c:	00d70733          	add	a4,a4,a3
    80003ca0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003ca4:	0017879b          	addiw	a5,a5,1
    80003ca8:	0004a703          	lw	a4,0(s1)
    80003cac:	02e7e7bb          	remw	a5,a5,a4
    80003cb0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003cb4:	0284b503          	ld	a0,40(s1)
    80003cb8:	fffff097          	auipc	ra,0xfffff
    80003cbc:	f94080e7          	jalr	-108(ra) # 80002c4c <sem_signal>

    sem_signal(spaceAvailable);
    80003cc0:	0184b503          	ld	a0,24(s1)
    80003cc4:	fffff097          	auipc	ra,0xfffff
    80003cc8:	f88080e7          	jalr	-120(ra) # 80002c4c <sem_signal>

    return ret;
}
    80003ccc:	00090513          	mv	a0,s2
    80003cd0:	01813083          	ld	ra,24(sp)
    80003cd4:	01013403          	ld	s0,16(sp)
    80003cd8:	00813483          	ld	s1,8(sp)
    80003cdc:	00013903          	ld	s2,0(sp)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00008067          	ret

0000000080003ce8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80003ce8:	fe010113          	addi	sp,sp,-32
    80003cec:	00113c23          	sd	ra,24(sp)
    80003cf0:	00813823          	sd	s0,16(sp)
    80003cf4:	00913423          	sd	s1,8(sp)
    80003cf8:	01213023          	sd	s2,0(sp)
    80003cfc:	02010413          	addi	s0,sp,32
    80003d00:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003d04:	02853503          	ld	a0,40(a0)
    80003d08:	fffff097          	auipc	ra,0xfffff
    80003d0c:	f0c080e7          	jalr	-244(ra) # 80002c14 <sem_wait>
    sem_wait(mutexTail);
    80003d10:	0304b503          	ld	a0,48(s1)
    80003d14:	fffff097          	auipc	ra,0xfffff
    80003d18:	f00080e7          	jalr	-256(ra) # 80002c14 <sem_wait>

    if (tail >= head) {
    80003d1c:	0144a783          	lw	a5,20(s1)
    80003d20:	0104a903          	lw	s2,16(s1)
    80003d24:	0327ce63          	blt	a5,s2,80003d60 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80003d28:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003d2c:	0304b503          	ld	a0,48(s1)
    80003d30:	fffff097          	auipc	ra,0xfffff
    80003d34:	f1c080e7          	jalr	-228(ra) # 80002c4c <sem_signal>
    sem_signal(mutexHead);
    80003d38:	0284b503          	ld	a0,40(s1)
    80003d3c:	fffff097          	auipc	ra,0xfffff
    80003d40:	f10080e7          	jalr	-240(ra) # 80002c4c <sem_signal>

    return ret;
}
    80003d44:	00090513          	mv	a0,s2
    80003d48:	01813083          	ld	ra,24(sp)
    80003d4c:	01013403          	ld	s0,16(sp)
    80003d50:	00813483          	ld	s1,8(sp)
    80003d54:	00013903          	ld	s2,0(sp)
    80003d58:	02010113          	addi	sp,sp,32
    80003d5c:	00008067          	ret
        ret = cap - head + tail;
    80003d60:	0004a703          	lw	a4,0(s1)
    80003d64:	4127093b          	subw	s2,a4,s2
    80003d68:	00f9093b          	addw	s2,s2,a5
    80003d6c:	fc1ff06f          	j	80003d2c <_ZN6Buffer6getCntEv+0x44>

0000000080003d70 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003d70:	fe010113          	addi	sp,sp,-32
    80003d74:	00113c23          	sd	ra,24(sp)
    80003d78:	00813823          	sd	s0,16(sp)
    80003d7c:	00913423          	sd	s1,8(sp)
    80003d80:	02010413          	addi	s0,sp,32
    80003d84:	00050493          	mv	s1,a0
    putc('\n');
    80003d88:	00a00513          	li	a0,10
    80003d8c:	fffff097          	auipc	ra,0xfffff
    80003d90:	f6c080e7          	jalr	-148(ra) # 80002cf8 <putc>
    printString("Buffer deleted!\n");
    80003d94:	00004517          	auipc	a0,0x4
    80003d98:	5b450513          	addi	a0,a0,1460 # 80008348 <_ZTV6Thread+0x28>
    80003d9c:	00001097          	auipc	ra,0x1
    80003da0:	e60080e7          	jalr	-416(ra) # 80004bfc <_Z11printStringPKc>
    while (getCnt() > 0) {
    80003da4:	00048513          	mv	a0,s1
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	f40080e7          	jalr	-192(ra) # 80003ce8 <_ZN6Buffer6getCntEv>
    80003db0:	02a05c63          	blez	a0,80003de8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80003db4:	0084b783          	ld	a5,8(s1)
    80003db8:	0104a703          	lw	a4,16(s1)
    80003dbc:	00271713          	slli	a4,a4,0x2
    80003dc0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80003dc4:	0007c503          	lbu	a0,0(a5)
    80003dc8:	fffff097          	auipc	ra,0xfffff
    80003dcc:	f30080e7          	jalr	-208(ra) # 80002cf8 <putc>
        head = (head + 1) % cap;
    80003dd0:	0104a783          	lw	a5,16(s1)
    80003dd4:	0017879b          	addiw	a5,a5,1
    80003dd8:	0004a703          	lw	a4,0(s1)
    80003ddc:	02e7e7bb          	remw	a5,a5,a4
    80003de0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80003de4:	fc1ff06f          	j	80003da4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80003de8:	02100513          	li	a0,33
    80003dec:	fffff097          	auipc	ra,0xfffff
    80003df0:	f0c080e7          	jalr	-244(ra) # 80002cf8 <putc>
    putc('\n');
    80003df4:	00a00513          	li	a0,10
    80003df8:	fffff097          	auipc	ra,0xfffff
    80003dfc:	f00080e7          	jalr	-256(ra) # 80002cf8 <putc>
    mem_free(buffer);
    80003e00:	0084b503          	ld	a0,8(s1)
    80003e04:	fffff097          	auipc	ra,0xfffff
    80003e08:	c90080e7          	jalr	-880(ra) # 80002a94 <mem_free>
    sem_close(itemAvailable);
    80003e0c:	0204b503          	ld	a0,32(s1)
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	dcc080e7          	jalr	-564(ra) # 80002bdc <sem_close>
    sem_close(spaceAvailable);
    80003e18:	0184b503          	ld	a0,24(s1)
    80003e1c:	fffff097          	auipc	ra,0xfffff
    80003e20:	dc0080e7          	jalr	-576(ra) # 80002bdc <sem_close>
    sem_close(mutexTail);
    80003e24:	0304b503          	ld	a0,48(s1)
    80003e28:	fffff097          	auipc	ra,0xfffff
    80003e2c:	db4080e7          	jalr	-588(ra) # 80002bdc <sem_close>
    sem_close(mutexHead);
    80003e30:	0284b503          	ld	a0,40(s1)
    80003e34:	fffff097          	auipc	ra,0xfffff
    80003e38:	da8080e7          	jalr	-600(ra) # 80002bdc <sem_close>
}
    80003e3c:	01813083          	ld	ra,24(sp)
    80003e40:	01013403          	ld	s0,16(sp)
    80003e44:	00813483          	ld	s1,8(sp)
    80003e48:	02010113          	addi	sp,sp,32
    80003e4c:	00008067          	ret

0000000080003e50 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003e50:	fd010113          	addi	sp,sp,-48
    80003e54:	02113423          	sd	ra,40(sp)
    80003e58:	02813023          	sd	s0,32(sp)
    80003e5c:	00913c23          	sd	s1,24(sp)
    80003e60:	01213823          	sd	s2,16(sp)
    80003e64:	01313423          	sd	s3,8(sp)
    80003e68:	03010413          	addi	s0,sp,48
    80003e6c:	00050493          	mv	s1,a0
    80003e70:	00058993          	mv	s3,a1
    80003e74:	0015879b          	addiw	a5,a1,1
    80003e78:	0007851b          	sext.w	a0,a5
    80003e7c:	00f4a023          	sw	a5,0(s1)
    80003e80:	0004a823          	sw	zero,16(s1)
    80003e84:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003e88:	00251513          	slli	a0,a0,0x2
    80003e8c:	fffff097          	auipc	ra,0xfffff
    80003e90:	bd0080e7          	jalr	-1072(ra) # 80002a5c <mem_alloc>
    80003e94:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80003e98:	01000513          	li	a0,16
    80003e9c:	fffff097          	auipc	ra,0xfffff
    80003ea0:	410080e7          	jalr	1040(ra) # 800032ac <_Znwm>
    80003ea4:	00050913          	mv	s2,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80003ea8:	00004797          	auipc	a5,0x4
    80003eac:	4c878793          	addi	a5,a5,1224 # 80008370 <_ZTV9Semaphore+0x10>
    80003eb0:	00f53023          	sd	a5,0(a0)
    80003eb4:	00000593          	li	a1,0
    80003eb8:	00850513          	addi	a0,a0,8
    80003ebc:	fffff097          	auipc	ra,0xfffff
    80003ec0:	ce4080e7          	jalr	-796(ra) # 80002ba0 <sem_open>
    80003ec4:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80003ec8:	01000513          	li	a0,16
    80003ecc:	fffff097          	auipc	ra,0xfffff
    80003ed0:	3e0080e7          	jalr	992(ra) # 800032ac <_Znwm>
    80003ed4:	00050913          	mv	s2,a0
    80003ed8:	00004797          	auipc	a5,0x4
    80003edc:	49878793          	addi	a5,a5,1176 # 80008370 <_ZTV9Semaphore+0x10>
    80003ee0:	00f53023          	sd	a5,0(a0)
    80003ee4:	00098593          	mv	a1,s3
    80003ee8:	00850513          	addi	a0,a0,8
    80003eec:	fffff097          	auipc	ra,0xfffff
    80003ef0:	cb4080e7          	jalr	-844(ra) # 80002ba0 <sem_open>
    80003ef4:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    80003ef8:	01000513          	li	a0,16
    80003efc:	fffff097          	auipc	ra,0xfffff
    80003f00:	3b0080e7          	jalr	944(ra) # 800032ac <_Znwm>
    80003f04:	00050913          	mv	s2,a0
    80003f08:	00004797          	auipc	a5,0x4
    80003f0c:	46878793          	addi	a5,a5,1128 # 80008370 <_ZTV9Semaphore+0x10>
    80003f10:	00f53023          	sd	a5,0(a0)
    80003f14:	00100593          	li	a1,1
    80003f18:	00850513          	addi	a0,a0,8
    80003f1c:	fffff097          	auipc	ra,0xfffff
    80003f20:	c84080e7          	jalr	-892(ra) # 80002ba0 <sem_open>
    80003f24:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80003f28:	01000513          	li	a0,16
    80003f2c:	fffff097          	auipc	ra,0xfffff
    80003f30:	380080e7          	jalr	896(ra) # 800032ac <_Znwm>
    80003f34:	00050913          	mv	s2,a0
    80003f38:	00004797          	auipc	a5,0x4
    80003f3c:	43878793          	addi	a5,a5,1080 # 80008370 <_ZTV9Semaphore+0x10>
    80003f40:	00f53023          	sd	a5,0(a0)
    80003f44:	00100593          	li	a1,1
    80003f48:	00850513          	addi	a0,a0,8
    80003f4c:	fffff097          	auipc	ra,0xfffff
    80003f50:	c54080e7          	jalr	-940(ra) # 80002ba0 <sem_open>
    80003f54:	0324b823          	sd	s2,48(s1)
}
    80003f58:	02813083          	ld	ra,40(sp)
    80003f5c:	02013403          	ld	s0,32(sp)
    80003f60:	01813483          	ld	s1,24(sp)
    80003f64:	01013903          	ld	s2,16(sp)
    80003f68:	00813983          	ld	s3,8(sp)
    80003f6c:	03010113          	addi	sp,sp,48
    80003f70:	00008067          	ret
    80003f74:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003f78:	00090513          	mv	a0,s2
    80003f7c:	fffff097          	auipc	ra,0xfffff
    80003f80:	358080e7          	jalr	856(ra) # 800032d4 <_ZdlPv>
    80003f84:	00048513          	mv	a0,s1
    80003f88:	00007097          	auipc	ra,0x7
    80003f8c:	150080e7          	jalr	336(ra) # 8000b0d8 <_Unwind_Resume>
    80003f90:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80003f94:	00090513          	mv	a0,s2
    80003f98:	fffff097          	auipc	ra,0xfffff
    80003f9c:	33c080e7          	jalr	828(ra) # 800032d4 <_ZdlPv>
    80003fa0:	00048513          	mv	a0,s1
    80003fa4:	00007097          	auipc	ra,0x7
    80003fa8:	134080e7          	jalr	308(ra) # 8000b0d8 <_Unwind_Resume>
    80003fac:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003fb0:	00090513          	mv	a0,s2
    80003fb4:	fffff097          	auipc	ra,0xfffff
    80003fb8:	320080e7          	jalr	800(ra) # 800032d4 <_ZdlPv>
    80003fbc:	00048513          	mv	a0,s1
    80003fc0:	00007097          	auipc	ra,0x7
    80003fc4:	118080e7          	jalr	280(ra) # 8000b0d8 <_Unwind_Resume>
    80003fc8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80003fcc:	00090513          	mv	a0,s2
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	304080e7          	jalr	772(ra) # 800032d4 <_ZdlPv>
    80003fd8:	00048513          	mv	a0,s1
    80003fdc:	00007097          	auipc	ra,0x7
    80003fe0:	0fc080e7          	jalr	252(ra) # 8000b0d8 <_Unwind_Resume>

0000000080003fe4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80003fe4:	fe010113          	addi	sp,sp,-32
    80003fe8:	00113c23          	sd	ra,24(sp)
    80003fec:	00813823          	sd	s0,16(sp)
    80003ff0:	00913423          	sd	s1,8(sp)
    80003ff4:	01213023          	sd	s2,0(sp)
    80003ff8:	02010413          	addi	s0,sp,32
    80003ffc:	00050493          	mv	s1,a0
    80004000:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004004:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80004008:	0087b503          	ld	a0,8(a5)
    8000400c:	fffff097          	auipc	ra,0xfffff
    80004010:	c08080e7          	jalr	-1016(ra) # 80002c14 <sem_wait>

    mutexTail->wait();
    80004014:	0304b783          	ld	a5,48(s1)
    80004018:	0087b503          	ld	a0,8(a5)
    8000401c:	fffff097          	auipc	ra,0xfffff
    80004020:	bf8080e7          	jalr	-1032(ra) # 80002c14 <sem_wait>
    buffer[tail] = val;
    80004024:	0084b783          	ld	a5,8(s1)
    80004028:	0144a703          	lw	a4,20(s1)
    8000402c:	00271713          	slli	a4,a4,0x2
    80004030:	00e787b3          	add	a5,a5,a4
    80004034:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004038:	0144a783          	lw	a5,20(s1)
    8000403c:	0017879b          	addiw	a5,a5,1
    80004040:	0004a703          	lw	a4,0(s1)
    80004044:	02e7e7bb          	remw	a5,a5,a4
    80004048:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000404c:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004050:	0087b503          	ld	a0,8(a5)
    80004054:	fffff097          	auipc	ra,0xfffff
    80004058:	bf8080e7          	jalr	-1032(ra) # 80002c4c <sem_signal>

    itemAvailable->signal();
    8000405c:	0204b783          	ld	a5,32(s1)
    80004060:	0087b503          	ld	a0,8(a5)
    80004064:	fffff097          	auipc	ra,0xfffff
    80004068:	be8080e7          	jalr	-1048(ra) # 80002c4c <sem_signal>

}
    8000406c:	01813083          	ld	ra,24(sp)
    80004070:	01013403          	ld	s0,16(sp)
    80004074:	00813483          	ld	s1,8(sp)
    80004078:	00013903          	ld	s2,0(sp)
    8000407c:	02010113          	addi	sp,sp,32
    80004080:	00008067          	ret

0000000080004084 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004084:	fe010113          	addi	sp,sp,-32
    80004088:	00113c23          	sd	ra,24(sp)
    8000408c:	00813823          	sd	s0,16(sp)
    80004090:	00913423          	sd	s1,8(sp)
    80004094:	01213023          	sd	s2,0(sp)
    80004098:	02010413          	addi	s0,sp,32
    8000409c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800040a0:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    800040a4:	0087b503          	ld	a0,8(a5)
    800040a8:	fffff097          	auipc	ra,0xfffff
    800040ac:	b6c080e7          	jalr	-1172(ra) # 80002c14 <sem_wait>

    mutexHead->wait();
    800040b0:	0284b783          	ld	a5,40(s1)
    800040b4:	0087b503          	ld	a0,8(a5)
    800040b8:	fffff097          	auipc	ra,0xfffff
    800040bc:	b5c080e7          	jalr	-1188(ra) # 80002c14 <sem_wait>

    int ret = buffer[head];
    800040c0:	0084b703          	ld	a4,8(s1)
    800040c4:	0104a783          	lw	a5,16(s1)
    800040c8:	00279693          	slli	a3,a5,0x2
    800040cc:	00d70733          	add	a4,a4,a3
    800040d0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800040d4:	0017879b          	addiw	a5,a5,1
    800040d8:	0004a703          	lw	a4,0(s1)
    800040dc:	02e7e7bb          	remw	a5,a5,a4
    800040e0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800040e4:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    800040e8:	0087b503          	ld	a0,8(a5)
    800040ec:	fffff097          	auipc	ra,0xfffff
    800040f0:	b60080e7          	jalr	-1184(ra) # 80002c4c <sem_signal>

    spaceAvailable->signal();
    800040f4:	0184b783          	ld	a5,24(s1)
    800040f8:	0087b503          	ld	a0,8(a5)
    800040fc:	fffff097          	auipc	ra,0xfffff
    80004100:	b50080e7          	jalr	-1200(ra) # 80002c4c <sem_signal>

    return ret;
}
    80004104:	00090513          	mv	a0,s2
    80004108:	01813083          	ld	ra,24(sp)
    8000410c:	01013403          	ld	s0,16(sp)
    80004110:	00813483          	ld	s1,8(sp)
    80004114:	00013903          	ld	s2,0(sp)
    80004118:	02010113          	addi	sp,sp,32
    8000411c:	00008067          	ret

0000000080004120 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004120:	fe010113          	addi	sp,sp,-32
    80004124:	00113c23          	sd	ra,24(sp)
    80004128:	00813823          	sd	s0,16(sp)
    8000412c:	00913423          	sd	s1,8(sp)
    80004130:	01213023          	sd	s2,0(sp)
    80004134:	02010413          	addi	s0,sp,32
    80004138:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000413c:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    80004140:	0087b503          	ld	a0,8(a5)
    80004144:	fffff097          	auipc	ra,0xfffff
    80004148:	ad0080e7          	jalr	-1328(ra) # 80002c14 <sem_wait>
    mutexTail->wait();
    8000414c:	0304b783          	ld	a5,48(s1)
    80004150:	0087b503          	ld	a0,8(a5)
    80004154:	fffff097          	auipc	ra,0xfffff
    80004158:	ac0080e7          	jalr	-1344(ra) # 80002c14 <sem_wait>

    if (tail >= head) {
    8000415c:	0144a783          	lw	a5,20(s1)
    80004160:	0104a903          	lw	s2,16(s1)
    80004164:	0527c263          	blt	a5,s2,800041a8 <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    80004168:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000416c:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004170:	0087b503          	ld	a0,8(a5)
    80004174:	fffff097          	auipc	ra,0xfffff
    80004178:	ad8080e7          	jalr	-1320(ra) # 80002c4c <sem_signal>
    mutexHead->signal();
    8000417c:	0284b783          	ld	a5,40(s1)
    80004180:	0087b503          	ld	a0,8(a5)
    80004184:	fffff097          	auipc	ra,0xfffff
    80004188:	ac8080e7          	jalr	-1336(ra) # 80002c4c <sem_signal>

    return ret;
}
    8000418c:	00090513          	mv	a0,s2
    80004190:	01813083          	ld	ra,24(sp)
    80004194:	01013403          	ld	s0,16(sp)
    80004198:	00813483          	ld	s1,8(sp)
    8000419c:	00013903          	ld	s2,0(sp)
    800041a0:	02010113          	addi	sp,sp,32
    800041a4:	00008067          	ret
        ret = cap - head + tail;
    800041a8:	0004a703          	lw	a4,0(s1)
    800041ac:	4127093b          	subw	s2,a4,s2
    800041b0:	00f9093b          	addw	s2,s2,a5
    800041b4:	fb9ff06f          	j	8000416c <_ZN9BufferCPP6getCntEv+0x4c>

00000000800041b8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800041b8:	fe010113          	addi	sp,sp,-32
    800041bc:	00113c23          	sd	ra,24(sp)
    800041c0:	00813823          	sd	s0,16(sp)
    800041c4:	00913423          	sd	s1,8(sp)
    800041c8:	02010413          	addi	s0,sp,32
    800041cc:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    800041d0:	00a00513          	li	a0,10
    800041d4:	fffff097          	auipc	ra,0xfffff
    800041d8:	b24080e7          	jalr	-1244(ra) # 80002cf8 <putc>
    printString("Buffer deleted!\n");
    800041dc:	00004517          	auipc	a0,0x4
    800041e0:	16c50513          	addi	a0,a0,364 # 80008348 <_ZTV6Thread+0x28>
    800041e4:	00001097          	auipc	ra,0x1
    800041e8:	a18080e7          	jalr	-1512(ra) # 80004bfc <_Z11printStringPKc>
    while (getCnt()) {
    800041ec:	00048513          	mv	a0,s1
    800041f0:	00000097          	auipc	ra,0x0
    800041f4:	f30080e7          	jalr	-208(ra) # 80004120 <_ZN9BufferCPP6getCntEv>
    800041f8:	02050c63          	beqz	a0,80004230 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800041fc:	0084b783          	ld	a5,8(s1)
    80004200:	0104a703          	lw	a4,16(s1)
    80004204:	00271713          	slli	a4,a4,0x2
    80004208:	00e787b3          	add	a5,a5,a4
    8000420c:	0007c503          	lbu	a0,0(a5)
    80004210:	fffff097          	auipc	ra,0xfffff
    80004214:	ae8080e7          	jalr	-1304(ra) # 80002cf8 <putc>
        head = (head + 1) % cap;
    80004218:	0104a783          	lw	a5,16(s1)
    8000421c:	0017879b          	addiw	a5,a5,1
    80004220:	0004a703          	lw	a4,0(s1)
    80004224:	02e7e7bb          	remw	a5,a5,a4
    80004228:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000422c:	fc1ff06f          	j	800041ec <_ZN9BufferCPPD1Ev+0x34>
    80004230:	02100513          	li	a0,33
    80004234:	fffff097          	auipc	ra,0xfffff
    80004238:	ac4080e7          	jalr	-1340(ra) # 80002cf8 <putc>
    8000423c:	00a00513          	li	a0,10
    80004240:	fffff097          	auipc	ra,0xfffff
    80004244:	ab8080e7          	jalr	-1352(ra) # 80002cf8 <putc>
    mem_free(buffer);
    80004248:	0084b503          	ld	a0,8(s1)
    8000424c:	fffff097          	auipc	ra,0xfffff
    80004250:	848080e7          	jalr	-1976(ra) # 80002a94 <mem_free>
    delete itemAvailable;
    80004254:	0204b503          	ld	a0,32(s1)
    80004258:	00050863          	beqz	a0,80004268 <_ZN9BufferCPPD1Ev+0xb0>
    8000425c:	00053783          	ld	a5,0(a0)
    80004260:	0087b783          	ld	a5,8(a5)
    80004264:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004268:	0184b503          	ld	a0,24(s1)
    8000426c:	00050863          	beqz	a0,8000427c <_ZN9BufferCPPD1Ev+0xc4>
    80004270:	00053783          	ld	a5,0(a0)
    80004274:	0087b783          	ld	a5,8(a5)
    80004278:	000780e7          	jalr	a5
    delete mutexTail;
    8000427c:	0304b503          	ld	a0,48(s1)
    80004280:	00050863          	beqz	a0,80004290 <_ZN9BufferCPPD1Ev+0xd8>
    80004284:	00053783          	ld	a5,0(a0)
    80004288:	0087b783          	ld	a5,8(a5)
    8000428c:	000780e7          	jalr	a5
    delete mutexHead;
    80004290:	0284b503          	ld	a0,40(s1)
    80004294:	00050863          	beqz	a0,800042a4 <_ZN9BufferCPPD1Ev+0xec>
    80004298:	00053783          	ld	a5,0(a0)
    8000429c:	0087b783          	ld	a5,8(a5)
    800042a0:	000780e7          	jalr	a5
}
    800042a4:	01813083          	ld	ra,24(sp)
    800042a8:	01013403          	ld	s0,16(sp)
    800042ac:	00813483          	ld	s1,8(sp)
    800042b0:	02010113          	addi	sp,sp,32
    800042b4:	00008067          	ret

00000000800042b8 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    800042b8:	ff010113          	addi	sp,sp,-16
    800042bc:	00113423          	sd	ra,8(sp)
    800042c0:	00813023          	sd	s0,0(sp)
    800042c4:	01010413          	addi	s0,sp,16
    800042c8:	00004797          	auipc	a5,0x4
    800042cc:	0a878793          	addi	a5,a5,168 # 80008370 <_ZTV9Semaphore+0x10>
    800042d0:	00f53023          	sd	a5,0(a0)
    800042d4:	00853503          	ld	a0,8(a0)
    800042d8:	fffff097          	auipc	ra,0xfffff
    800042dc:	904080e7          	jalr	-1788(ra) # 80002bdc <sem_close>
    800042e0:	00813083          	ld	ra,8(sp)
    800042e4:	00013403          	ld	s0,0(sp)
    800042e8:	01010113          	addi	sp,sp,16
    800042ec:	00008067          	ret

00000000800042f0 <_ZN9SemaphoreD0Ev>:
    800042f0:	fe010113          	addi	sp,sp,-32
    800042f4:	00113c23          	sd	ra,24(sp)
    800042f8:	00813823          	sd	s0,16(sp)
    800042fc:	00913423          	sd	s1,8(sp)
    80004300:	02010413          	addi	s0,sp,32
    80004304:	00050493          	mv	s1,a0
    80004308:	00004797          	auipc	a5,0x4
    8000430c:	06878793          	addi	a5,a5,104 # 80008370 <_ZTV9Semaphore+0x10>
    80004310:	00f53023          	sd	a5,0(a0)
    80004314:	00853503          	ld	a0,8(a0)
    80004318:	fffff097          	auipc	ra,0xfffff
    8000431c:	8c4080e7          	jalr	-1852(ra) # 80002bdc <sem_close>
    80004320:	00048513          	mv	a0,s1
    80004324:	fffff097          	auipc	ra,0xfffff
    80004328:	fb0080e7          	jalr	-80(ra) # 800032d4 <_ZdlPv>
    8000432c:	01813083          	ld	ra,24(sp)
    80004330:	01013403          	ld	s0,16(sp)
    80004334:	00813483          	ld	s1,8(sp)
    80004338:	02010113          	addi	sp,sp,32
    8000433c:	00008067          	ret

0000000080004340 <_Z5printmcb>:
#include"../h/riscv.hpp"
#include"../h/syscall_c.h"
#include"../h/syscall_cpp.hpp"
#include"../test/printing.hpp"

void print(uint64 unum, char end, bool hex){
    80004340:	fa010113          	addi	sp,sp,-96
    80004344:	04113c23          	sd	ra,88(sp)
    80004348:	04813823          	sd	s0,80(sp)
    8000434c:	04913423          	sd	s1,72(sp)
    80004350:	05213023          	sd	s2,64(sp)
    80004354:	03313c23          	sd	s3,56(sp)
    80004358:	03413823          	sd	s4,48(sp)
    8000435c:	06010413          	addi	s0,sp,96
    80004360:	00050913          	mv	s2,a0
    80004364:	00058a13          	mv	s4,a1
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80004368:	100027f3          	csrr	a5,sstatus
    8000436c:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80004370:	fa843983          	ld	s3,-88(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80004374:	00200793          	li	a5,2
    80004378:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    8000437c:	04061e63          	bnez	a2,800043d8 <_Z5printmcb+0x98>
    int i = 0;
    80004380:	00000493          	li	s1,0
    80004384:	00c0006f          	j	80004390 <_Z5printmcb+0x50>
    do{
        buffer[i++] = '0' + unum1%10;
    80004388:	00060493          	mv	s1,a2
        unum1/=10;
    8000438c:	00078913          	mv	s2,a5
        buffer[i++] = '0' + unum1%10;
    80004390:	00a00793          	li	a5,10
    80004394:	02f97733          	remu	a4,s2,a5
    80004398:	0014861b          	addiw	a2,s1,1
    8000439c:	03070713          	addi	a4,a4,48
    800043a0:	fd040693          	addi	a3,s0,-48
    800043a4:	009686b3          	add	a3,a3,s1
    800043a8:	fee68023          	sb	a4,-32(a3)
        unum1/=10;
    800043ac:	02f957b3          	divu	a5,s2,a5
    }while(unum1 > 0);
    800043b0:	00900713          	li	a4,9
    800043b4:	fd276ae3          	bltu	a4,s2,80004388 <_Z5printmcb+0x48>
    for(int j = i-1; j >= 0; j--)
    800043b8:	0804cc63          	bltz	s1,80004450 <_Z5printmcb+0x110>
        __putc(buffer[j]);
    800043bc:	fd040793          	addi	a5,s0,-48
    800043c0:	009787b3          	add	a5,a5,s1
    800043c4:	fe07c503          	lbu	a0,-32(a5)
    800043c8:	00003097          	auipc	ra,0x3
    800043cc:	b64080e7          	jalr	-1180(ra) # 80006f2c <__putc>
    for(int j = i-1; j >= 0; j--)
    800043d0:	fff4849b          	addiw	s1,s1,-1
    800043d4:	fe5ff06f          	j	800043b8 <_Z5printmcb+0x78>
    }else{
    //__putc('\n');
    __putc('0');
    800043d8:	03000513          	li	a0,48
    800043dc:	00003097          	auipc	ra,0x3
    800043e0:	b50080e7          	jalr	-1200(ra) # 80006f2c <__putc>
    __putc('x');
    800043e4:	07800513          	li	a0,120
    800043e8:	00003097          	auipc	ra,0x3
    800043ec:	b44080e7          	jalr	-1212(ra) # 80006f2c <__putc>
    
    const char* numbers = "0123456789ABCDEF";
    unum1 = unum;
    i = 0;
    800043f0:	00000493          	li	s1,0
    800043f4:	00c0006f          	j	80004400 <_Z5printmcb+0xc0>
    do{
        buffer[i++] = numbers[unum1%16];
    800043f8:	00068493          	mv	s1,a3
        unum1/=16;
    800043fc:	00070913          	mv	s2,a4
        buffer[i++] = numbers[unum1%16];
    80004400:	00f97793          	andi	a5,s2,15
    80004404:	0014869b          	addiw	a3,s1,1
    80004408:	00004717          	auipc	a4,0x4
    8000440c:	fd870713          	addi	a4,a4,-40 # 800083e0 <_ZTV14PeriodicWorker+0x40>
    80004410:	00e787b3          	add	a5,a5,a4
    80004414:	0007c703          	lbu	a4,0(a5)
    80004418:	fd040793          	addi	a5,s0,-48
    8000441c:	009787b3          	add	a5,a5,s1
    80004420:	fee78023          	sb	a4,-32(a5)
        unum1/=16;
    80004424:	00495713          	srli	a4,s2,0x4
    } while(unum1 > 0);
    80004428:	00f00793          	li	a5,15
    8000442c:	fd27e6e3          	bltu	a5,s2,800043f8 <_Z5printmcb+0xb8>
    for(int j = i-1; j >= 0; j--)
    80004430:	0204c063          	bltz	s1,80004450 <_Z5printmcb+0x110>
        __putc(buffer[j]);
    80004434:	fd040793          	addi	a5,s0,-48
    80004438:	009787b3          	add	a5,a5,s1
    8000443c:	fe07c503          	lbu	a0,-32(a5)
    80004440:	00003097          	auipc	ra,0x3
    80004444:	aec080e7          	jalr	-1300(ra) # 80006f2c <__putc>
    for(int j = i-1; j >= 0; j--)
    80004448:	fff4849b          	addiw	s1,s1,-1
    8000444c:	fe5ff06f          	j	80004430 <_Z5printmcb+0xf0>
    }
    __putc(end);
    80004450:	000a0513          	mv	a0,s4
    80004454:	00003097          	auipc	ra,0x3
    80004458:	ad8080e7          	jalr	-1320(ra) # 80006f2c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    8000445c:	0009899b          	sext.w	s3,s3
    80004460:	0029f993          	andi	s3,s3,2
    80004464:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80004468:	1009a073          	csrs	sstatus,s3
}
    8000446c:	05813083          	ld	ra,88(sp)
    80004470:	05013403          	ld	s0,80(sp)
    80004474:	04813483          	ld	s1,72(sp)
    80004478:	04013903          	ld	s2,64(sp)
    8000447c:	03813983          	ld	s3,56(sp)
    80004480:	03013a03          	ld	s4,48(sp)
    80004484:	06010113          	addi	sp,sp,96
    80004488:	00008067          	ret

000000008000448c <_Z5printPKcc>:

void print(const char* str, char end){
    8000448c:	fc010113          	addi	sp,sp,-64
    80004490:	02113c23          	sd	ra,56(sp)
    80004494:	02813823          	sd	s0,48(sp)
    80004498:	02913423          	sd	s1,40(sp)
    8000449c:	03213023          	sd	s2,32(sp)
    800044a0:	01313c23          	sd	s3,24(sp)
    800044a4:	01413823          	sd	s4,16(sp)
    800044a8:	04010413          	addi	s0,sp,64
    800044ac:	00050913          	mv	s2,a0
    800044b0:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800044b4:	100027f3          	csrr	a5,sstatus
    800044b8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800044bc:	fc843983          	ld	s3,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800044c0:	00200793          	li	a5,2
    800044c4:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
    800044c8:	00000493          	li	s1,0
    800044cc:	009907b3          	add	a5,s2,s1
    800044d0:	0007c503          	lbu	a0,0(a5)
    800044d4:	00050a63          	beqz	a0,800044e8 <_Z5printPKcc+0x5c>
        __putc(str[i]);
    800044d8:	00003097          	auipc	ra,0x3
    800044dc:	a54080e7          	jalr	-1452(ra) # 80006f2c <__putc>
    for(int i = 0; str[i]; i++)
    800044e0:	0014849b          	addiw	s1,s1,1
    800044e4:	fe9ff06f          	j	800044cc <_Z5printPKcc+0x40>
    __putc(end);
    800044e8:	000a0513          	mv	a0,s4
    800044ec:	00003097          	auipc	ra,0x3
    800044f0:	a40080e7          	jalr	-1472(ra) # 80006f2c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800044f4:	0009899b          	sext.w	s3,s3
    800044f8:	0029f993          	andi	s3,s3,2
    800044fc:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80004500:	1009a073          	csrs	sstatus,s3

}
    80004504:	03813083          	ld	ra,56(sp)
    80004508:	03013403          	ld	s0,48(sp)
    8000450c:	02813483          	ld	s1,40(sp)
    80004510:	02013903          	ld	s2,32(sp)
    80004514:	01813983          	ld	s3,24(sp)
    80004518:	01013a03          	ld	s4,16(sp)
    8000451c:	04010113          	addi	sp,sp,64
    80004520:	00008067          	ret

0000000080004524 <_Z5printPKcmb>:

void print(const char* str, uint64 t, bool hex){
    80004524:	fc010113          	addi	sp,sp,-64
    80004528:	02113c23          	sd	ra,56(sp)
    8000452c:	02813823          	sd	s0,48(sp)
    80004530:	02913423          	sd	s1,40(sp)
    80004534:	03213023          	sd	s2,32(sp)
    80004538:	01313c23          	sd	s3,24(sp)
    8000453c:	04010413          	addi	s0,sp,64
    80004540:	00058913          	mv	s2,a1
    80004544:	00060993          	mv	s3,a2
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80004548:	100027f3          	csrr	a5,sstatus
    8000454c:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80004550:	fc843483          	ld	s1,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80004554:	00200793          	li	a5,2
    80004558:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    8000455c:	02000593          	li	a1,32
    80004560:	00000097          	auipc	ra,0x0
    80004564:	f2c080e7          	jalr	-212(ra) # 8000448c <_Z5printPKcc>
    print(t, '\n', hex);
    80004568:	00098613          	mv	a2,s3
    8000456c:	00a00593          	li	a1,10
    80004570:	00090513          	mv	a0,s2
    80004574:	00000097          	auipc	ra,0x0
    80004578:	dcc080e7          	jalr	-564(ra) # 80004340 <_Z5printmcb>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    8000457c:	0004849b          	sext.w	s1,s1
    80004580:	0024f493          	andi	s1,s1,2
    80004584:	0004849b          	sext.w	s1,s1
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80004588:	1004a073          	csrs	sstatus,s1
}
    8000458c:	03813083          	ld	ra,56(sp)
    80004590:	03013403          	ld	s0,48(sp)
    80004594:	02813483          	ld	s1,40(sp)
    80004598:	02013903          	ld	s2,32(sp)
    8000459c:	01813983          	ld	s3,24(sp)
    800045a0:	04010113          	addi	sp,sp,64
    800045a4:	00008067          	ret

00000000800045a8 <_Z9allocTestR15MemoryAllocatorm>:

void* allocTest(MemoryAllocator& allocator, size_t size){
    800045a8:	fe010113          	addi	sp,sp,-32
    800045ac:	00113c23          	sd	ra,24(sp)
    800045b0:	00813823          	sd	s0,16(sp)
    800045b4:	00913423          	sd	s1,8(sp)
    800045b8:	01213023          	sd	s2,0(sp)
    800045bc:	02010413          	addi	s0,sp,32
    800045c0:	00050493          	mv	s1,a0
    800045c4:	00058913          	mv	s2,a1
    print("\nAlokacija", ' ');
    800045c8:	02000593          	li	a1,32
    800045cc:	00004517          	auipc	a0,0x4
    800045d0:	e2c50513          	addi	a0,a0,-468 # 800083f8 <_ZTV14PeriodicWorker+0x58>
    800045d4:	00000097          	auipc	ra,0x0
    800045d8:	eb8080e7          	jalr	-328(ra) # 8000448c <_Z5printPKcc>
    print(size, ' ');
    800045dc:	00100613          	li	a2,1
    800045e0:	02000593          	li	a1,32
    800045e4:	00090513          	mv	a0,s2
    800045e8:	00000097          	auipc	ra,0x0
    800045ec:	d58080e7          	jalr	-680(ra) # 80004340 <_Z5printmcb>
    print("blokova");
    800045f0:	00a00593          	li	a1,10
    800045f4:	00004517          	auipc	a0,0x4
    800045f8:	e1450513          	addi	a0,a0,-492 # 80008408 <_ZTV14PeriodicWorker+0x68>
    800045fc:	00000097          	auipc	ra,0x0
    80004600:	e90080e7          	jalr	-368(ra) # 8000448c <_Z5printPKcc>
    char* newblc = (char*)allocator.mem_alloc(size);
    80004604:	00090593          	mv	a1,s2
    80004608:	00048513          	mv	a0,s1
    8000460c:	ffffe097          	auipc	ra,0xffffe
    80004610:	b10080e7          	jalr	-1264(ra) # 8000211c <_ZN15MemoryAllocator9mem_allocEm>
    80004614:	00050913          	mv	s2,a0
    allocator.print_list();  
    80004618:	00048513          	mv	a0,s1
    8000461c:	ffffe097          	auipc	ra,0xffffe
    80004620:	d94080e7          	jalr	-620(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>
    return newblc;
}
    80004624:	00090513          	mv	a0,s2
    80004628:	01813083          	ld	ra,24(sp)
    8000462c:	01013403          	ld	s0,16(sp)
    80004630:	00813483          	ld	s1,8(sp)
    80004634:	00013903          	ld	s2,0(sp)
    80004638:	02010113          	addi	sp,sp,32
    8000463c:	00008067          	ret

0000000080004640 <_Z8freeTestR15MemoryAllocatorPv>:

void freeTest(MemoryAllocator& allocator, void* adr){
    80004640:	fe010113          	addi	sp,sp,-32
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	00813823          	sd	s0,16(sp)
    8000464c:	00913423          	sd	s1,8(sp)
    80004650:	01213023          	sd	s2,0(sp)
    80004654:	02010413          	addi	s0,sp,32
    80004658:	00050493          	mv	s1,a0
    8000465c:	00058913          	mv	s2,a1
    print("\nDealogkacija");
    80004660:	00a00593          	li	a1,10
    80004664:	00004517          	auipc	a0,0x4
    80004668:	dac50513          	addi	a0,a0,-596 # 80008410 <_ZTV14PeriodicWorker+0x70>
    8000466c:	00000097          	auipc	ra,0x0
    80004670:	e20080e7          	jalr	-480(ra) # 8000448c <_Z5printPKcc>
    if(allocator.mem_free(adr) < 0)
    80004674:	00090593          	mv	a1,s2
    80004678:	00048513          	mv	a0,s1
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	c5c080e7          	jalr	-932(ra) # 800022d8 <_ZN15MemoryAllocator8mem_freeEPv>
    80004684:	02054863          	bltz	a0,800046b4 <_Z8freeTestR15MemoryAllocatorPv+0x74>
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
    80004688:	00a00593          	li	a1,10
    8000468c:	00004517          	auipc	a0,0x4
    80004690:	d9450513          	addi	a0,a0,-620 # 80008420 <_ZTV14PeriodicWorker+0x80>
    80004694:	00000097          	auipc	ra,0x0
    80004698:	df8080e7          	jalr	-520(ra) # 8000448c <_Z5printPKcc>
}
    8000469c:	01813083          	ld	ra,24(sp)
    800046a0:	01013403          	ld	s0,16(sp)
    800046a4:	00813483          	ld	s1,8(sp)
    800046a8:	00013903          	ld	s2,0(sp)
    800046ac:	02010113          	addi	sp,sp,32
    800046b0:	00008067          	ret
        allocator.print_list();
    800046b4:	00048513          	mv	a0,s1
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	cf8080e7          	jalr	-776(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>
    800046c0:	fddff06f          	j	8000469c <_Z8freeTestR15MemoryAllocatorPv+0x5c>

00000000800046c4 <_Z7memTestv>:

void memTest(){
    800046c4:	fe010113          	addi	sp,sp,-32
    800046c8:	00113c23          	sd	ra,24(sp)
    800046cc:	00813823          	sd	s0,16(sp)
    800046d0:	00913423          	sd	s1,8(sp)
    800046d4:	01213023          	sd	s2,0(sp)
    800046d8:	02010413          	addi	s0,sp,32
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    800046dc:	ffffe097          	auipc	ra,0xffffe
    800046e0:	9cc080e7          	jalr	-1588(ra) # 800020a8 <_ZN15MemoryAllocator11getInstanceEv>
    800046e4:	00050493          	mv	s1,a0
    allocator.print_list();
    800046e8:	ffffe097          	auipc	ra,0xffffe
    800046ec:	cc8080e7          	jalr	-824(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(50);
    800046f0:	03200513          	li	a0,50
    800046f4:	ffffe097          	auipc	ra,0xffffe
    800046f8:	368080e7          	jalr	872(ra) # 80002a5c <mem_alloc>
    
    allocator.print_list();
    800046fc:	00048513          	mv	a0,s1
    80004700:	ffffe097          	auipc	ra,0xffffe
    80004704:	cb0080e7          	jalr	-848(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>

    char* t = (char*)mem_alloc(100);
    80004708:	06400513          	li	a0,100
    8000470c:	ffffe097          	auipc	ra,0xffffe
    80004710:	350080e7          	jalr	848(ra) # 80002a5c <mem_alloc>
    80004714:	00050913          	mv	s2,a0
    print("t:", (uint64)t, 0);
    80004718:	00000613          	li	a2,0
    8000471c:	00050593          	mv	a1,a0
    80004720:	00004517          	auipc	a0,0x4
    80004724:	d1850513          	addi	a0,a0,-744 # 80008438 <_ZTV14PeriodicWorker+0x98>
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	dfc080e7          	jalr	-516(ra) # 80004524 <_Z5printPKcmb>

    allocator.print_list();
    80004730:	00048513          	mv	a0,s1
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	c7c080e7          	jalr	-900(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(300);
    8000473c:	12c00513          	li	a0,300
    80004740:	ffffe097          	auipc	ra,0xffffe
    80004744:	31c080e7          	jalr	796(ra) # 80002a5c <mem_alloc>

    allocator.print_list();
    80004748:	00048513          	mv	a0,s1
    8000474c:	ffffe097          	auipc	ra,0xffffe
    80004750:	c64080e7          	jalr	-924(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>
    
    print("free_res:", mem_free(t), 0);
    80004754:	00090513          	mv	a0,s2
    80004758:	ffffe097          	auipc	ra,0xffffe
    8000475c:	33c080e7          	jalr	828(ra) # 80002a94 <mem_free>
    80004760:	00000613          	li	a2,0
    80004764:	00050593          	mv	a1,a0
    80004768:	00004517          	auipc	a0,0x4
    8000476c:	cd850513          	addi	a0,a0,-808 # 80008440 <_ZTV14PeriodicWorker+0xa0>
    80004770:	00000097          	auipc	ra,0x0
    80004774:	db4080e7          	jalr	-588(ra) # 80004524 <_Z5printPKcmb>
    
    allocator.print_list();
    80004778:	00048513          	mv	a0,s1
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	c34080e7          	jalr	-972(ra) # 800023b0 <_ZN15MemoryAllocator10print_listEv>
}
    80004784:	01813083          	ld	ra,24(sp)
    80004788:	01013403          	ld	s0,16(sp)
    8000478c:	00813483          	ld	s1,8(sp)
    80004790:	00013903          	ld	s2,0(sp)
    80004794:	02010113          	addi	sp,sp,32
    80004798:	00008067          	ret

000000008000479c <_Z8print_a0v>:

void print_a0(){
    8000479c:	fe010113          	addi	sp,sp,-32
    800047a0:	00113c23          	sd	ra,24(sp)
    800047a4:	00813823          	sd	s0,16(sp)
    800047a8:	00913423          	sd	s1,8(sp)
    800047ac:	02010413          	addi	s0,sp,32
    asm volatile("mv %0, a0" : "=r" (a0));
    800047b0:	00050493          	mv	s1,a0
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    800047b4:	02000593          	li	a1,32
    800047b8:	00004517          	auipc	a0,0x4
    800047bc:	c9850513          	addi	a0,a0,-872 # 80008450 <_ZTV14PeriodicWorker+0xb0>
    800047c0:	00000097          	auipc	ra,0x0
    800047c4:	ccc080e7          	jalr	-820(ra) # 8000448c <_Z5printPKcc>
    print(a0, '\n', 1);
    800047c8:	00100613          	li	a2,1
    800047cc:	00a00593          	li	a1,10
    800047d0:	00048513          	mv	a0,s1
    800047d4:	00000097          	auipc	ra,0x0
    800047d8:	b6c080e7          	jalr	-1172(ra) # 80004340 <_Z5printmcb>
    //asm volatile("mv a0, %0" : : "r" (a0));
}
    800047dc:	01813083          	ld	ra,24(sp)
    800047e0:	01013403          	ld	s0,16(sp)
    800047e4:	00813483          	ld	s1,8(sp)
    800047e8:	02010113          	addi	sp,sp,32
    800047ec:	00008067          	ret

00000000800047f0 <_Z19print_sup_registersv>:

void print_sup_registers(){ 
    800047f0:	fd010113          	addi	sp,sp,-48
    800047f4:	02113423          	sd	ra,40(sp)
    800047f8:	02813023          	sd	s0,32(sp)
    800047fc:	03010413          	addi	s0,sp,48

    print("sstatus:",' ');
    80004800:	02000593          	li	a1,32
    80004804:	00004517          	auipc	a0,0x4
    80004808:	c5450513          	addi	a0,a0,-940 # 80008458 <_ZTV14PeriodicWorker+0xb8>
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	c80080e7          	jalr	-896(ra) # 8000448c <_Z5printPKcc>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80004814:	100027f3          	csrr	a5,sstatus
    80004818:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    8000481c:	fe843503          	ld	a0,-24(s0)
    print(Riscv::r_sstatus(), '\n', 1);
    80004820:	00100613          	li	a2,1
    80004824:	00a00593          	li	a1,10
    80004828:	00000097          	auipc	ra,0x0
    8000482c:	b18080e7          	jalr	-1256(ra) # 80004340 <_Z5printmcb>

    print("sip:",' ');
    80004830:	02000593          	li	a1,32
    80004834:	00004517          	auipc	a0,0x4
    80004838:	c3450513          	addi	a0,a0,-972 # 80008468 <_ZTV14PeriodicWorker+0xc8>
    8000483c:	00000097          	auipc	ra,0x0
    80004840:	c50080e7          	jalr	-944(ra) # 8000448c <_Z5printPKcc>
    asm volatile("csrr %0, sip" : "=r" (sip));
    80004844:	144027f3          	csrr	a5,sip
    80004848:	fef43023          	sd	a5,-32(s0)
    return sip;
    8000484c:	fe043503          	ld	a0,-32(s0)
    print(Riscv::r_sip(), '\n', 1);
    80004850:	00100613          	li	a2,1
    80004854:	00a00593          	li	a1,10
    80004858:	00000097          	auipc	ra,0x0
    8000485c:	ae8080e7          	jalr	-1304(ra) # 80004340 <_Z5printmcb>

    print("stval:",' ');
    80004860:	02000593          	li	a1,32
    80004864:	00004517          	auipc	a0,0x4
    80004868:	c0c50513          	addi	a0,a0,-1012 # 80008470 <_ZTV14PeriodicWorker+0xd0>
    8000486c:	00000097          	auipc	ra,0x0
    80004870:	c20080e7          	jalr	-992(ra) # 8000448c <_Z5printPKcc>
    asm volatile("csrr %0, stval" : "=r" (stval));
    80004874:	143027f3          	csrr	a5,stval
    80004878:	fcf43c23          	sd	a5,-40(s0)
    return stval;
    8000487c:	fd843503          	ld	a0,-40(s0)
    print(Riscv::r_stval(), '\n', 1);
    80004880:	00100613          	li	a2,1
    80004884:	00a00593          	li	a1,10
    80004888:	00000097          	auipc	ra,0x0
    8000488c:	ab8080e7          	jalr	-1352(ra) # 80004340 <_Z5printmcb>

    print("scause:",' ');
    80004890:	02000593          	li	a1,32
    80004894:	00004517          	auipc	a0,0x4
    80004898:	be450513          	addi	a0,a0,-1052 # 80008478 <_ZTV14PeriodicWorker+0xd8>
    8000489c:	00000097          	auipc	ra,0x0
    800048a0:	bf0080e7          	jalr	-1040(ra) # 8000448c <_Z5printPKcc>
    asm volatile("csrr %0, scause" : "=r" (scause));
    800048a4:	142027f3          	csrr	a5,scause
    800048a8:	fcf43823          	sd	a5,-48(s0)
    return scause;
    800048ac:	fd043503          	ld	a0,-48(s0)
    print(Riscv::r_scause(), '\n', 1);
    800048b0:	00100613          	li	a2,1
    800048b4:	00a00593          	li	a1,10
    800048b8:	00000097          	auipc	ra,0x0
    800048bc:	a88080e7          	jalr	-1400(ra) # 80004340 <_Z5printmcb>
}
    800048c0:	02813083          	ld	ra,40(sp)
    800048c4:	02013403          	ld	s0,32(sp)
    800048c8:	03010113          	addi	sp,sp,48
    800048cc:	00008067          	ret

00000000800048d0 <_Z18testPeriodicWorkerv>:
    PeriodicWorker(time_t period, int val, ProtectedBool* p, sem_t sem):
    PeriodicThread(period), val(val), p(p), sem(sem){}

};

void testPeriodicWorker(){
    800048d0:	fc010113          	addi	sp,sp,-64
    800048d4:	02113c23          	sd	ra,56(sp)
    800048d8:	02813823          	sd	s0,48(sp)
    800048dc:	02913423          	sd	s1,40(sp)
    800048e0:	03213023          	sd	s2,32(sp)
    800048e4:	01313c23          	sd	s3,24(sp)
    800048e8:	04010413          	addi	s0,sp,64
    ProtectedBool* p = new ProtectedBool();
    800048ec:	01800513          	li	a0,24
    800048f0:	fffff097          	auipc	ra,0xfffff
    800048f4:	9bc080e7          	jalr	-1604(ra) # 800032ac <_Znwm>
    800048f8:	00050493          	mv	s1,a0
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    800048fc:	00004797          	auipc	a5,0x4
    80004900:	a7478793          	addi	a5,a5,-1420 # 80008370 <_ZTV9Semaphore+0x10>
    80004904:	00f53023          	sd	a5,0(a0)
    80004908:	00100593          	li	a1,1
    8000490c:	00850513          	addi	a0,a0,8
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	290080e7          	jalr	656(ra) # 80002ba0 <sem_open>
    ProtectedBool():Semaphore(1), t(false){}
    80004918:	00004797          	auipc	a5,0x4
    8000491c:	a7878793          	addi	a5,a5,-1416 # 80008390 <_ZTV13ProtectedBool+0x10>
    80004920:	00f4b023          	sd	a5,0(s1)
    80004924:	00048823          	sb	zero,16(s1)
    sem_t sem;
    sem_open(&sem, 1);
    80004928:	00100593          	li	a1,1
    8000492c:	fc840513          	addi	a0,s0,-56
    80004930:	ffffe097          	auipc	ra,0xffffe
    80004934:	270080e7          	jalr	624(ra) # 80002ba0 <sem_open>
    //sem_close(sem);
    PeriodicWorker* worker = new PeriodicWorker(10, 5, p, sem);
    80004938:	02800513          	li	a0,40
    8000493c:	fffff097          	auipc	ra,0xfffff
    80004940:	970080e7          	jalr	-1680(ra) # 800032ac <_Znwm>
    80004944:	00050913          	mv	s2,a0
    80004948:	fc843983          	ld	s3,-56(s0)
    PeriodicThread(period), val(val), p(p), sem(sem){}
    8000494c:	00a00593          	li	a1,10
    80004950:	fffff097          	auipc	ra,0xfffff
    80004954:	b68080e7          	jalr	-1176(ra) # 800034b8 <_ZN14PeriodicThreadC1Em>
    80004958:	00004797          	auipc	a5,0x4
    8000495c:	a5878793          	addi	a5,a5,-1448 # 800083b0 <_ZTV14PeriodicWorker+0x10>
    80004960:	00f93023          	sd	a5,0(s2)
    80004964:	00500793          	li	a5,5
    80004968:	00f92823          	sw	a5,16(s2)
    8000496c:	00993c23          	sd	s1,24(s2)
    80004970:	03393023          	sd	s3,32(s2)
    char c;
    worker->start();
    80004974:	00090513          	mv	a0,s2
    80004978:	fffff097          	auipc	ra,0xfffff
    8000497c:	ac8080e7          	jalr	-1336(ra) # 80003440 <_ZN6Thread5startEv>
    while((c = getc())!=0x1b)
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	33c080e7          	jalr	828(ra) # 80002cbc <getc>
    80004988:	01b00793          	li	a5,27
    8000498c:	02f50863          	beq	a0,a5,800049bc <_Z18testPeriodicWorkerv+0xec>
    {
        if(c == 'a')
    80004990:	06100793          	li	a5,97
    80004994:	fef516e3          	bne	a0,a5,80004980 <_Z18testPeriodicWorkerv+0xb0>
            if(sem_close(sem)) printString("los Sem close\n");
    80004998:	fc843503          	ld	a0,-56(s0)
    8000499c:	ffffe097          	auipc	ra,0xffffe
    800049a0:	240080e7          	jalr	576(ra) # 80002bdc <sem_close>
    800049a4:	fc050ee3          	beqz	a0,80004980 <_Z18testPeriodicWorkerv+0xb0>
    800049a8:	00004517          	auipc	a0,0x4
    800049ac:	ad850513          	addi	a0,a0,-1320 # 80008480 <_ZTV14PeriodicWorker+0xe0>
    800049b0:	00000097          	auipc	ra,0x0
    800049b4:	24c080e7          	jalr	588(ra) # 80004bfc <_Z11printStringPKc>
    800049b8:	fc9ff06f          	j	80004980 <_Z18testPeriodicWorkerv+0xb0>
    void wait (){ sem_wait(myHandle); }
    800049bc:	0084b503          	ld	a0,8(s1)
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	254080e7          	jalr	596(ra) # 80002c14 <sem_wait>
    void setTrue(){ wait(); t=true; signal(); }
    800049c8:	00100793          	li	a5,1
    800049cc:	00f48823          	sb	a5,16(s1)
    void signal (){ sem_signal(myHandle); }
    800049d0:	0084b503          	ld	a0,8(s1)
    800049d4:	ffffe097          	auipc	ra,0xffffe
    800049d8:	278080e7          	jalr	632(ra) # 80002c4c <sem_signal>
    }
    p->setTrue();
    //Semaphore sem(0);
    //sem.wait();
    800049dc:	03813083          	ld	ra,56(sp)
    800049e0:	03013403          	ld	s0,48(sp)
    800049e4:	02813483          	ld	s1,40(sp)
    800049e8:	02013903          	ld	s2,32(sp)
    800049ec:	01813983          	ld	s3,24(sp)
    800049f0:	04010113          	addi	sp,sp,64
    800049f4:	00008067          	ret
    800049f8:	00050913          	mv	s2,a0
    ProtectedBool* p = new ProtectedBool();
    800049fc:	00048513          	mv	a0,s1
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	8d4080e7          	jalr	-1836(ra) # 800032d4 <_ZdlPv>
    80004a08:	00090513          	mv	a0,s2
    80004a0c:	00006097          	auipc	ra,0x6
    80004a10:	6cc080e7          	jalr	1740(ra) # 8000b0d8 <_Unwind_Resume>
    80004a14:	00050493          	mv	s1,a0
    PeriodicWorker* worker = new PeriodicWorker(10, 5, p, sem);
    80004a18:	00090513          	mv	a0,s2
    80004a1c:	fffff097          	auipc	ra,0xfffff
    80004a20:	8b8080e7          	jalr	-1864(ra) # 800032d4 <_ZdlPv>
    80004a24:	00048513          	mv	a0,s1
    80004a28:	00006097          	auipc	ra,0x6
    80004a2c:	6b0080e7          	jalr	1712(ra) # 8000b0d8 <_Unwind_Resume>

0000000080004a30 <_ZN13ProtectedBoolD1Ev>:
class ProtectedBool:public Semaphore
    80004a30:	ff010113          	addi	sp,sp,-16
    80004a34:	00113423          	sd	ra,8(sp)
    80004a38:	00813023          	sd	s0,0(sp)
    80004a3c:	01010413          	addi	s0,sp,16
    virtual ~Semaphore (){ sem_close(myHandle); }
    80004a40:	00004797          	auipc	a5,0x4
    80004a44:	93078793          	addi	a5,a5,-1744 # 80008370 <_ZTV9Semaphore+0x10>
    80004a48:	00f53023          	sd	a5,0(a0)
    80004a4c:	00853503          	ld	a0,8(a0)
    80004a50:	ffffe097          	auipc	ra,0xffffe
    80004a54:	18c080e7          	jalr	396(ra) # 80002bdc <sem_close>
    80004a58:	00813083          	ld	ra,8(sp)
    80004a5c:	00013403          	ld	s0,0(sp)
    80004a60:	01010113          	addi	sp,sp,16
    80004a64:	00008067          	ret

0000000080004a68 <_ZN13ProtectedBoolD0Ev>:
    80004a68:	fe010113          	addi	sp,sp,-32
    80004a6c:	00113c23          	sd	ra,24(sp)
    80004a70:	00813823          	sd	s0,16(sp)
    80004a74:	00913423          	sd	s1,8(sp)
    80004a78:	02010413          	addi	s0,sp,32
    80004a7c:	00050493          	mv	s1,a0
    80004a80:	00004797          	auipc	a5,0x4
    80004a84:	8f078793          	addi	a5,a5,-1808 # 80008370 <_ZTV9Semaphore+0x10>
    80004a88:	00f53023          	sd	a5,0(a0)
    80004a8c:	00853503          	ld	a0,8(a0)
    80004a90:	ffffe097          	auipc	ra,0xffffe
    80004a94:	14c080e7          	jalr	332(ra) # 80002bdc <sem_close>
    80004a98:	00048513          	mv	a0,s1
    80004a9c:	fffff097          	auipc	ra,0xfffff
    80004aa0:	838080e7          	jalr	-1992(ra) # 800032d4 <_ZdlPv>
    80004aa4:	01813083          	ld	ra,24(sp)
    80004aa8:	01013403          	ld	s0,16(sp)
    80004aac:	00813483          	ld	s1,8(sp)
    80004ab0:	02010113          	addi	sp,sp,32
    80004ab4:	00008067          	ret

0000000080004ab8 <_ZN14PeriodicWorker18periodicActivationEv>:
    void periodicActivation() override{
    80004ab8:	fd010113          	addi	sp,sp,-48
    80004abc:	02113423          	sd	ra,40(sp)
    80004ac0:	02813023          	sd	s0,32(sp)
    80004ac4:	00913c23          	sd	s1,24(sp)
    80004ac8:	01213823          	sd	s2,16(sp)
    80004acc:	01313423          	sd	s3,8(sp)
    80004ad0:	03010413          	addi	s0,sp,48
    80004ad4:	00050493          	mv	s1,a0
        if(p->isTrue()) thread_exit();
    80004ad8:	01853903          	ld	s2,24(a0)
    void wait (){ sem_wait(myHandle); }
    80004adc:	00893503          	ld	a0,8(s2)
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	134080e7          	jalr	308(ra) # 80002c14 <sem_wait>
    bool isTrue(){ bool x; wait(); x=t; signal(); return x;}
    80004ae8:	01094983          	lbu	s3,16(s2)
    void signal (){ sem_signal(myHandle); }
    80004aec:	00893503          	ld	a0,8(s2)
    80004af0:	ffffe097          	auipc	ra,0xffffe
    80004af4:	15c080e7          	jalr	348(ra) # 80002c4c <sem_signal>
        if(p->isTrue()) thread_exit();
    80004af8:	06099263          	bnez	s3,80004b5c <_ZN14PeriodicWorker18periodicActivationEv+0xa4>
        if(!sem_wait(sem))
    80004afc:	0204b503          	ld	a0,32(s1)
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	114080e7          	jalr	276(ra) # 80002c14 <sem_wait>
    80004b08:	06051063          	bnez	a0,80004b68 <_ZN14PeriodicWorker18periodicActivationEv+0xb0>
            sem_signal(sem);
    80004b0c:	0204b503          	ld	a0,32(s1)
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	13c080e7          	jalr	316(ra) # 80002c4c <sem_signal>
        printInt(val++);
    80004b18:	0104a503          	lw	a0,16(s1)
    80004b1c:	0015079b          	addiw	a5,a0,1
    80004b20:	00f4a823          	sw	a5,16(s1)
    80004b24:	00a00593          	li	a1,10
    80004b28:	00000097          	auipc	ra,0x0
    80004b2c:	268080e7          	jalr	616(ra) # 80004d90 <_Z8printIntmi>
        printString("\n");
    80004b30:	00003517          	auipc	a0,0x3
    80004b34:	79050513          	addi	a0,a0,1936 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80004b38:	00000097          	auipc	ra,0x0
    80004b3c:	0c4080e7          	jalr	196(ra) # 80004bfc <_Z11printStringPKc>
    }
    80004b40:	02813083          	ld	ra,40(sp)
    80004b44:	02013403          	ld	s0,32(sp)
    80004b48:	01813483          	ld	s1,24(sp)
    80004b4c:	01013903          	ld	s2,16(sp)
    80004b50:	00813983          	ld	s3,8(sp)
    80004b54:	03010113          	addi	sp,sp,48
    80004b58:	00008067          	ret
        if(p->isTrue()) thread_exit();
    80004b5c:	ffffe097          	auipc	ra,0xffffe
    80004b60:	020080e7          	jalr	32(ra) # 80002b7c <thread_exit>
    80004b64:	f99ff06f          	j	80004afc <_ZN14PeriodicWorker18periodicActivationEv+0x44>
            printString("Joooj greskaaa\n");
    80004b68:	00004517          	auipc	a0,0x4
    80004b6c:	86850513          	addi	a0,a0,-1944 # 800083d0 <_ZTV14PeriodicWorker+0x30>
    80004b70:	00000097          	auipc	ra,0x0
    80004b74:	08c080e7          	jalr	140(ra) # 80004bfc <_Z11printStringPKc>
    80004b78:	fa1ff06f          	j	80004b18 <_ZN14PeriodicWorker18periodicActivationEv+0x60>

0000000080004b7c <_ZN14PeriodicWorkerD1Ev>:
class PeriodicWorker:public PeriodicThread{
    80004b7c:	ff010113          	addi	sp,sp,-16
    80004b80:	00113423          	sd	ra,8(sp)
    80004b84:	00813023          	sd	s0,0(sp)
    80004b88:	01010413          	addi	s0,sp,16
class PeriodicThread : public Thread {
    80004b8c:	00003797          	auipc	a5,0x3
    80004b90:	77478793          	addi	a5,a5,1908 # 80008300 <_ZTV14PeriodicThread+0x10>
    80004b94:	00f53023          	sd	a5,0(a0)
    80004b98:	ffffe097          	auipc	ra,0xffffe
    80004b9c:	764080e7          	jalr	1892(ra) # 800032fc <_ZN6ThreadD1Ev>
    80004ba0:	00813083          	ld	ra,8(sp)
    80004ba4:	00013403          	ld	s0,0(sp)
    80004ba8:	01010113          	addi	sp,sp,16
    80004bac:	00008067          	ret

0000000080004bb0 <_ZN14PeriodicWorkerD0Ev>:
    80004bb0:	fe010113          	addi	sp,sp,-32
    80004bb4:	00113c23          	sd	ra,24(sp)
    80004bb8:	00813823          	sd	s0,16(sp)
    80004bbc:	00913423          	sd	s1,8(sp)
    80004bc0:	02010413          	addi	s0,sp,32
    80004bc4:	00050493          	mv	s1,a0
    80004bc8:	00003797          	auipc	a5,0x3
    80004bcc:	73878793          	addi	a5,a5,1848 # 80008300 <_ZTV14PeriodicThread+0x10>
    80004bd0:	00f53023          	sd	a5,0(a0)
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	728080e7          	jalr	1832(ra) # 800032fc <_ZN6ThreadD1Ev>
    80004bdc:	00048513          	mv	a0,s1
    80004be0:	ffffe097          	auipc	ra,0xffffe
    80004be4:	6f4080e7          	jalr	1780(ra) # 800032d4 <_ZdlPv>
    80004be8:	01813083          	ld	ra,24(sp)
    80004bec:	01013403          	ld	s0,16(sp)
    80004bf0:	00813483          	ld	s1,8(sp)
    80004bf4:	02010113          	addi	sp,sp,32
    80004bf8:	00008067          	ret

0000000080004bfc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004bfc:	fe010113          	addi	sp,sp,-32
    80004c00:	00113c23          	sd	ra,24(sp)
    80004c04:	00813823          	sd	s0,16(sp)
    80004c08:	00913423          	sd	s1,8(sp)
    80004c0c:	02010413          	addi	s0,sp,32
    80004c10:	00050493          	mv	s1,a0
    LOCK();
    80004c14:	00100613          	li	a2,1
    80004c18:	00000593          	li	a1,0
    80004c1c:	00005517          	auipc	a0,0x5
    80004c20:	36450513          	addi	a0,a0,868 # 80009f80 <lockPrint>
    80004c24:	ffffc097          	auipc	ra,0xffffc
    80004c28:	5f8080e7          	jalr	1528(ra) # 8000121c <copy_and_swap>
    80004c2c:	fe0514e3          	bnez	a0,80004c14 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004c30:	0004c503          	lbu	a0,0(s1)
    80004c34:	00050a63          	beqz	a0,80004c48 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80004c38:	ffffe097          	auipc	ra,0xffffe
    80004c3c:	0c0080e7          	jalr	192(ra) # 80002cf8 <putc>
        string++;
    80004c40:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004c44:	fedff06f          	j	80004c30 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80004c48:	00000613          	li	a2,0
    80004c4c:	00100593          	li	a1,1
    80004c50:	00005517          	auipc	a0,0x5
    80004c54:	33050513          	addi	a0,a0,816 # 80009f80 <lockPrint>
    80004c58:	ffffc097          	auipc	ra,0xffffc
    80004c5c:	5c4080e7          	jalr	1476(ra) # 8000121c <copy_and_swap>
    80004c60:	fe0514e3          	bnez	a0,80004c48 <_Z11printStringPKc+0x4c>
}
    80004c64:	01813083          	ld	ra,24(sp)
    80004c68:	01013403          	ld	s0,16(sp)
    80004c6c:	00813483          	ld	s1,8(sp)
    80004c70:	02010113          	addi	sp,sp,32
    80004c74:	00008067          	ret

0000000080004c78 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004c78:	fd010113          	addi	sp,sp,-48
    80004c7c:	02113423          	sd	ra,40(sp)
    80004c80:	02813023          	sd	s0,32(sp)
    80004c84:	00913c23          	sd	s1,24(sp)
    80004c88:	01213823          	sd	s2,16(sp)
    80004c8c:	01313423          	sd	s3,8(sp)
    80004c90:	01413023          	sd	s4,0(sp)
    80004c94:	03010413          	addi	s0,sp,48
    80004c98:	00050993          	mv	s3,a0
    80004c9c:	00058a13          	mv	s4,a1
    LOCK();
    80004ca0:	00100613          	li	a2,1
    80004ca4:	00000593          	li	a1,0
    80004ca8:	00005517          	auipc	a0,0x5
    80004cac:	2d850513          	addi	a0,a0,728 # 80009f80 <lockPrint>
    80004cb0:	ffffc097          	auipc	ra,0xffffc
    80004cb4:	56c080e7          	jalr	1388(ra) # 8000121c <copy_and_swap>
    80004cb8:	fe0514e3          	bnez	a0,80004ca0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004cbc:	00000493          	li	s1,0
    80004cc0:	0014891b          	addiw	s2,s1,1
    80004cc4:	03495a63          	bge	s2,s4,80004cf8 <_Z9getStringPci+0x80>
        cc = getc();
    80004cc8:	ffffe097          	auipc	ra,0xffffe
    80004ccc:	ff4080e7          	jalr	-12(ra) # 80002cbc <getc>
        if(cc < 1)
    80004cd0:	02050463          	beqz	a0,80004cf8 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80004cd4:	009984b3          	add	s1,s3,s1
    80004cd8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004cdc:	00a00793          	li	a5,10
    80004ce0:	00f50a63          	beq	a0,a5,80004cf4 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80004ce4:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80004ce8:	00d00793          	li	a5,13
    80004cec:	fcf51ae3          	bne	a0,a5,80004cc0 <_Z9getStringPci+0x48>
    80004cf0:	0080006f          	j	80004cf8 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80004cf4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004cf8:	009984b3          	add	s1,s3,s1
    80004cfc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004d00:	00000613          	li	a2,0
    80004d04:	00100593          	li	a1,1
    80004d08:	00005517          	auipc	a0,0x5
    80004d0c:	27850513          	addi	a0,a0,632 # 80009f80 <lockPrint>
    80004d10:	ffffc097          	auipc	ra,0xffffc
    80004d14:	50c080e7          	jalr	1292(ra) # 8000121c <copy_and_swap>
    80004d18:	fe0514e3          	bnez	a0,80004d00 <_Z9getStringPci+0x88>
    return buf;
}
    80004d1c:	00098513          	mv	a0,s3
    80004d20:	02813083          	ld	ra,40(sp)
    80004d24:	02013403          	ld	s0,32(sp)
    80004d28:	01813483          	ld	s1,24(sp)
    80004d2c:	01013903          	ld	s2,16(sp)
    80004d30:	00813983          	ld	s3,8(sp)
    80004d34:	00013a03          	ld	s4,0(sp)
    80004d38:	03010113          	addi	sp,sp,48
    80004d3c:	00008067          	ret

0000000080004d40 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004d40:	ff010113          	addi	sp,sp,-16
    80004d44:	00813423          	sd	s0,8(sp)
    80004d48:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    80004d4c:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    80004d50:	00054603          	lbu	a2,0(a0)
    80004d54:	fd06069b          	addiw	a3,a2,-48
    80004d58:	0ff6f693          	andi	a3,a3,255
    80004d5c:	00900713          	li	a4,9
    80004d60:	02d76063          	bltu	a4,a3,80004d80 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    80004d64:	0027969b          	slliw	a3,a5,0x2
    80004d68:	00f687bb          	addw	a5,a3,a5
    80004d6c:	0017971b          	slliw	a4,a5,0x1
    80004d70:	00150513          	addi	a0,a0,1
    80004d74:	00c707bb          	addw	a5,a4,a2
    80004d78:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    80004d7c:	fd5ff06f          	j	80004d50 <_Z11stringToIntPKc+0x10>
    return n;
}
    80004d80:	00078513          	mv	a0,a5
    80004d84:	00813403          	ld	s0,8(sp)
    80004d88:	01010113          	addi	sp,sp,16
    80004d8c:	00008067          	ret

0000000080004d90 <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    80004d90:	fc010113          	addi	sp,sp,-64
    80004d94:	02113c23          	sd	ra,56(sp)
    80004d98:	02813823          	sd	s0,48(sp)
    80004d9c:	02913423          	sd	s1,40(sp)
    80004da0:	03213023          	sd	s2,32(sp)
    80004da4:	01313c23          	sd	s3,24(sp)
    80004da8:	04010413          	addi	s0,sp,64
    80004dac:	00050913          	mv	s2,a0
    80004db0:	00058993          	mv	s3,a1
    LOCK();
    80004db4:	00100613          	li	a2,1
    80004db8:	00000593          	li	a1,0
    80004dbc:	00005517          	auipc	a0,0x5
    80004dc0:	1c450513          	addi	a0,a0,452 # 80009f80 <lockPrint>
    80004dc4:	ffffc097          	auipc	ra,0xffffc
    80004dc8:	458080e7          	jalr	1112(ra) # 8000121c <copy_and_swap>
    80004dcc:	fe0514e3          	bnez	a0,80004db4 <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    80004dd0:	00000793          	li	a5,0
    80004dd4:	0080006f          	j	80004ddc <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    80004dd8:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    80004ddc:	033976b3          	remu	a3,s2,s3
    80004de0:	0017849b          	addiw	s1,a5,1
    80004de4:	00005717          	auipc	a4,0x5
    80004de8:	f5470713          	addi	a4,a4,-172 # 80009d38 <digits>
    80004dec:	00d70733          	add	a4,a4,a3
    80004df0:	00074703          	lbu	a4,0(a4)
    80004df4:	fd040693          	addi	a3,s0,-48
    80004df8:	00f687b3          	add	a5,a3,a5
    80004dfc:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80004e00:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    80004e04:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80004e08:	fd3978e3          	bgeu	s2,s3,80004dd8 <_Z8printIntmi+0x48>

    while(--i >= 0)
    80004e0c:	fff4849b          	addiw	s1,s1,-1
    80004e10:	0004ce63          	bltz	s1,80004e2c <_Z8printIntmi+0x9c>
        putc(buf[i]);
    80004e14:	fd040793          	addi	a5,s0,-48
    80004e18:	009787b3          	add	a5,a5,s1
    80004e1c:	ff07c503          	lbu	a0,-16(a5)
    80004e20:	ffffe097          	auipc	ra,0xffffe
    80004e24:	ed8080e7          	jalr	-296(ra) # 80002cf8 <putc>
    80004e28:	fe5ff06f          	j	80004e0c <_Z8printIntmi+0x7c>

    UNLOCK();
    80004e2c:	00000613          	li	a2,0
    80004e30:	00100593          	li	a1,1
    80004e34:	00005517          	auipc	a0,0x5
    80004e38:	14c50513          	addi	a0,a0,332 # 80009f80 <lockPrint>
    80004e3c:	ffffc097          	auipc	ra,0xffffc
    80004e40:	3e0080e7          	jalr	992(ra) # 8000121c <copy_and_swap>
    80004e44:	fe0514e3          	bnez	a0,80004e2c <_Z8printIntmi+0x9c>
    80004e48:	03813083          	ld	ra,56(sp)
    80004e4c:	03013403          	ld	s0,48(sp)
    80004e50:	02813483          	ld	s1,40(sp)
    80004e54:	02013903          	ld	s2,32(sp)
    80004e58:	01813983          	ld	s3,24(sp)
    80004e5c:	04010113          	addi	sp,sp,64
    80004e60:	00008067          	ret

0000000080004e64 <start>:
    80004e64:	ff010113          	addi	sp,sp,-16
    80004e68:	00813423          	sd	s0,8(sp)
    80004e6c:	01010413          	addi	s0,sp,16
    80004e70:	300027f3          	csrr	a5,mstatus
    80004e74:	ffffe737          	lui	a4,0xffffe
    80004e78:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff358f>
    80004e7c:	00e7f7b3          	and	a5,a5,a4
    80004e80:	00001737          	lui	a4,0x1
    80004e84:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004e88:	00e7e7b3          	or	a5,a5,a4
    80004e8c:	30079073          	csrw	mstatus,a5
    80004e90:	00000797          	auipc	a5,0x0
    80004e94:	16078793          	addi	a5,a5,352 # 80004ff0 <system_main>
    80004e98:	34179073          	csrw	mepc,a5
    80004e9c:	00000793          	li	a5,0
    80004ea0:	18079073          	csrw	satp,a5
    80004ea4:	000107b7          	lui	a5,0x10
    80004ea8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004eac:	30279073          	csrw	medeleg,a5
    80004eb0:	30379073          	csrw	mideleg,a5
    80004eb4:	104027f3          	csrr	a5,sie
    80004eb8:	2227e793          	ori	a5,a5,546
    80004ebc:	10479073          	csrw	sie,a5
    80004ec0:	fff00793          	li	a5,-1
    80004ec4:	00a7d793          	srli	a5,a5,0xa
    80004ec8:	3b079073          	csrw	pmpaddr0,a5
    80004ecc:	00f00793          	li	a5,15
    80004ed0:	3a079073          	csrw	pmpcfg0,a5
    80004ed4:	f14027f3          	csrr	a5,mhartid
    80004ed8:	0200c737          	lui	a4,0x200c
    80004edc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004ee0:	0007869b          	sext.w	a3,a5
    80004ee4:	00269713          	slli	a4,a3,0x2
    80004ee8:	000f4637          	lui	a2,0xf4
    80004eec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004ef0:	00d70733          	add	a4,a4,a3
    80004ef4:	0037979b          	slliw	a5,a5,0x3
    80004ef8:	020046b7          	lui	a3,0x2004
    80004efc:	00d787b3          	add	a5,a5,a3
    80004f00:	00c585b3          	add	a1,a1,a2
    80004f04:	00371693          	slli	a3,a4,0x3
    80004f08:	00005717          	auipc	a4,0x5
    80004f0c:	10870713          	addi	a4,a4,264 # 8000a010 <timer_scratch>
    80004f10:	00b7b023          	sd	a1,0(a5)
    80004f14:	00d70733          	add	a4,a4,a3
    80004f18:	00f73c23          	sd	a5,24(a4)
    80004f1c:	02c73023          	sd	a2,32(a4)
    80004f20:	34071073          	csrw	mscratch,a4
    80004f24:	00000797          	auipc	a5,0x0
    80004f28:	6ec78793          	addi	a5,a5,1772 # 80005610 <timervec>
    80004f2c:	30579073          	csrw	mtvec,a5
    80004f30:	300027f3          	csrr	a5,mstatus
    80004f34:	0087e793          	ori	a5,a5,8
    80004f38:	30079073          	csrw	mstatus,a5
    80004f3c:	304027f3          	csrr	a5,mie
    80004f40:	0807e793          	ori	a5,a5,128
    80004f44:	30479073          	csrw	mie,a5
    80004f48:	f14027f3          	csrr	a5,mhartid
    80004f4c:	0007879b          	sext.w	a5,a5
    80004f50:	00078213          	mv	tp,a5
    80004f54:	30200073          	mret
    80004f58:	00813403          	ld	s0,8(sp)
    80004f5c:	01010113          	addi	sp,sp,16
    80004f60:	00008067          	ret

0000000080004f64 <timerinit>:
    80004f64:	ff010113          	addi	sp,sp,-16
    80004f68:	00813423          	sd	s0,8(sp)
    80004f6c:	01010413          	addi	s0,sp,16
    80004f70:	f14027f3          	csrr	a5,mhartid
    80004f74:	0200c737          	lui	a4,0x200c
    80004f78:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004f7c:	0007869b          	sext.w	a3,a5
    80004f80:	00269713          	slli	a4,a3,0x2
    80004f84:	000f4637          	lui	a2,0xf4
    80004f88:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004f8c:	00d70733          	add	a4,a4,a3
    80004f90:	0037979b          	slliw	a5,a5,0x3
    80004f94:	020046b7          	lui	a3,0x2004
    80004f98:	00d787b3          	add	a5,a5,a3
    80004f9c:	00c585b3          	add	a1,a1,a2
    80004fa0:	00371693          	slli	a3,a4,0x3
    80004fa4:	00005717          	auipc	a4,0x5
    80004fa8:	06c70713          	addi	a4,a4,108 # 8000a010 <timer_scratch>
    80004fac:	00b7b023          	sd	a1,0(a5)
    80004fb0:	00d70733          	add	a4,a4,a3
    80004fb4:	00f73c23          	sd	a5,24(a4)
    80004fb8:	02c73023          	sd	a2,32(a4)
    80004fbc:	34071073          	csrw	mscratch,a4
    80004fc0:	00000797          	auipc	a5,0x0
    80004fc4:	65078793          	addi	a5,a5,1616 # 80005610 <timervec>
    80004fc8:	30579073          	csrw	mtvec,a5
    80004fcc:	300027f3          	csrr	a5,mstatus
    80004fd0:	0087e793          	ori	a5,a5,8
    80004fd4:	30079073          	csrw	mstatus,a5
    80004fd8:	304027f3          	csrr	a5,mie
    80004fdc:	0807e793          	ori	a5,a5,128
    80004fe0:	30479073          	csrw	mie,a5
    80004fe4:	00813403          	ld	s0,8(sp)
    80004fe8:	01010113          	addi	sp,sp,16
    80004fec:	00008067          	ret

0000000080004ff0 <system_main>:
    80004ff0:	fe010113          	addi	sp,sp,-32
    80004ff4:	00813823          	sd	s0,16(sp)
    80004ff8:	00913423          	sd	s1,8(sp)
    80004ffc:	00113c23          	sd	ra,24(sp)
    80005000:	02010413          	addi	s0,sp,32
    80005004:	00000097          	auipc	ra,0x0
    80005008:	0c4080e7          	jalr	196(ra) # 800050c8 <cpuid>
    8000500c:	00005497          	auipc	s1,0x5
    80005010:	f7c48493          	addi	s1,s1,-132 # 80009f88 <started>
    80005014:	02050263          	beqz	a0,80005038 <system_main+0x48>
    80005018:	0004a783          	lw	a5,0(s1)
    8000501c:	0007879b          	sext.w	a5,a5
    80005020:	fe078ce3          	beqz	a5,80005018 <system_main+0x28>
    80005024:	0ff0000f          	fence
    80005028:	00003517          	auipc	a0,0x3
    8000502c:	49850513          	addi	a0,a0,1176 # 800084c0 <_ZTV14PeriodicWorker+0x120>
    80005030:	00001097          	auipc	ra,0x1
    80005034:	a7c080e7          	jalr	-1412(ra) # 80005aac <panic>
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	9d0080e7          	jalr	-1584(ra) # 80005a08 <consoleinit>
    80005040:	00001097          	auipc	ra,0x1
    80005044:	15c080e7          	jalr	348(ra) # 8000619c <printfinit>
    80005048:	00003517          	auipc	a0,0x3
    8000504c:	27850513          	addi	a0,a0,632 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80005050:	00001097          	auipc	ra,0x1
    80005054:	ab8080e7          	jalr	-1352(ra) # 80005b08 <__printf>
    80005058:	00003517          	auipc	a0,0x3
    8000505c:	43850513          	addi	a0,a0,1080 # 80008490 <_ZTV14PeriodicWorker+0xf0>
    80005060:	00001097          	auipc	ra,0x1
    80005064:	aa8080e7          	jalr	-1368(ra) # 80005b08 <__printf>
    80005068:	00003517          	auipc	a0,0x3
    8000506c:	25850513          	addi	a0,a0,600 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80005070:	00001097          	auipc	ra,0x1
    80005074:	a98080e7          	jalr	-1384(ra) # 80005b08 <__printf>
    80005078:	00001097          	auipc	ra,0x1
    8000507c:	4b0080e7          	jalr	1200(ra) # 80006528 <kinit>
    80005080:	00000097          	auipc	ra,0x0
    80005084:	148080e7          	jalr	328(ra) # 800051c8 <trapinit>
    80005088:	00000097          	auipc	ra,0x0
    8000508c:	16c080e7          	jalr	364(ra) # 800051f4 <trapinithart>
    80005090:	00000097          	auipc	ra,0x0
    80005094:	5c0080e7          	jalr	1472(ra) # 80005650 <plicinit>
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	5e0080e7          	jalr	1504(ra) # 80005678 <plicinithart>
    800050a0:	00000097          	auipc	ra,0x0
    800050a4:	078080e7          	jalr	120(ra) # 80005118 <userinit>
    800050a8:	0ff0000f          	fence
    800050ac:	00100793          	li	a5,1
    800050b0:	00003517          	auipc	a0,0x3
    800050b4:	3f850513          	addi	a0,a0,1016 # 800084a8 <_ZTV14PeriodicWorker+0x108>
    800050b8:	00f4a023          	sw	a5,0(s1)
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	a4c080e7          	jalr	-1460(ra) # 80005b08 <__printf>
    800050c4:	0000006f          	j	800050c4 <system_main+0xd4>

00000000800050c8 <cpuid>:
    800050c8:	ff010113          	addi	sp,sp,-16
    800050cc:	00813423          	sd	s0,8(sp)
    800050d0:	01010413          	addi	s0,sp,16
    800050d4:	00020513          	mv	a0,tp
    800050d8:	00813403          	ld	s0,8(sp)
    800050dc:	0005051b          	sext.w	a0,a0
    800050e0:	01010113          	addi	sp,sp,16
    800050e4:	00008067          	ret

00000000800050e8 <mycpu>:
    800050e8:	ff010113          	addi	sp,sp,-16
    800050ec:	00813423          	sd	s0,8(sp)
    800050f0:	01010413          	addi	s0,sp,16
    800050f4:	00020793          	mv	a5,tp
    800050f8:	00813403          	ld	s0,8(sp)
    800050fc:	0007879b          	sext.w	a5,a5
    80005100:	00779793          	slli	a5,a5,0x7
    80005104:	00006517          	auipc	a0,0x6
    80005108:	f3c50513          	addi	a0,a0,-196 # 8000b040 <cpus>
    8000510c:	00f50533          	add	a0,a0,a5
    80005110:	01010113          	addi	sp,sp,16
    80005114:	00008067          	ret

0000000080005118 <userinit>:
    80005118:	ff010113          	addi	sp,sp,-16
    8000511c:	00813423          	sd	s0,8(sp)
    80005120:	01010413          	addi	s0,sp,16
    80005124:	00813403          	ld	s0,8(sp)
    80005128:	01010113          	addi	sp,sp,16
    8000512c:	ffffd317          	auipc	t1,0xffffd
    80005130:	3f430067          	jr	1012(t1) # 80002520 <main>

0000000080005134 <either_copyout>:
    80005134:	ff010113          	addi	sp,sp,-16
    80005138:	00813023          	sd	s0,0(sp)
    8000513c:	00113423          	sd	ra,8(sp)
    80005140:	01010413          	addi	s0,sp,16
    80005144:	02051663          	bnez	a0,80005170 <either_copyout+0x3c>
    80005148:	00058513          	mv	a0,a1
    8000514c:	00060593          	mv	a1,a2
    80005150:	0006861b          	sext.w	a2,a3
    80005154:	00002097          	auipc	ra,0x2
    80005158:	c60080e7          	jalr	-928(ra) # 80006db4 <__memmove>
    8000515c:	00813083          	ld	ra,8(sp)
    80005160:	00013403          	ld	s0,0(sp)
    80005164:	00000513          	li	a0,0
    80005168:	01010113          	addi	sp,sp,16
    8000516c:	00008067          	ret
    80005170:	00003517          	auipc	a0,0x3
    80005174:	37850513          	addi	a0,a0,888 # 800084e8 <_ZTV14PeriodicWorker+0x148>
    80005178:	00001097          	auipc	ra,0x1
    8000517c:	934080e7          	jalr	-1740(ra) # 80005aac <panic>

0000000080005180 <either_copyin>:
    80005180:	ff010113          	addi	sp,sp,-16
    80005184:	00813023          	sd	s0,0(sp)
    80005188:	00113423          	sd	ra,8(sp)
    8000518c:	01010413          	addi	s0,sp,16
    80005190:	02059463          	bnez	a1,800051b8 <either_copyin+0x38>
    80005194:	00060593          	mv	a1,a2
    80005198:	0006861b          	sext.w	a2,a3
    8000519c:	00002097          	auipc	ra,0x2
    800051a0:	c18080e7          	jalr	-1000(ra) # 80006db4 <__memmove>
    800051a4:	00813083          	ld	ra,8(sp)
    800051a8:	00013403          	ld	s0,0(sp)
    800051ac:	00000513          	li	a0,0
    800051b0:	01010113          	addi	sp,sp,16
    800051b4:	00008067          	ret
    800051b8:	00003517          	auipc	a0,0x3
    800051bc:	35850513          	addi	a0,a0,856 # 80008510 <_ZTV14PeriodicWorker+0x170>
    800051c0:	00001097          	auipc	ra,0x1
    800051c4:	8ec080e7          	jalr	-1812(ra) # 80005aac <panic>

00000000800051c8 <trapinit>:
    800051c8:	ff010113          	addi	sp,sp,-16
    800051cc:	00813423          	sd	s0,8(sp)
    800051d0:	01010413          	addi	s0,sp,16
    800051d4:	00813403          	ld	s0,8(sp)
    800051d8:	00003597          	auipc	a1,0x3
    800051dc:	36058593          	addi	a1,a1,864 # 80008538 <_ZTV14PeriodicWorker+0x198>
    800051e0:	00006517          	auipc	a0,0x6
    800051e4:	ee050513          	addi	a0,a0,-288 # 8000b0c0 <tickslock>
    800051e8:	01010113          	addi	sp,sp,16
    800051ec:	00001317          	auipc	t1,0x1
    800051f0:	5cc30067          	jr	1484(t1) # 800067b8 <initlock>

00000000800051f4 <trapinithart>:
    800051f4:	ff010113          	addi	sp,sp,-16
    800051f8:	00813423          	sd	s0,8(sp)
    800051fc:	01010413          	addi	s0,sp,16
    80005200:	00000797          	auipc	a5,0x0
    80005204:	30078793          	addi	a5,a5,768 # 80005500 <kernelvec>
    80005208:	10579073          	csrw	stvec,a5
    8000520c:	00813403          	ld	s0,8(sp)
    80005210:	01010113          	addi	sp,sp,16
    80005214:	00008067          	ret

0000000080005218 <usertrap>:
    80005218:	ff010113          	addi	sp,sp,-16
    8000521c:	00813423          	sd	s0,8(sp)
    80005220:	01010413          	addi	s0,sp,16
    80005224:	00813403          	ld	s0,8(sp)
    80005228:	01010113          	addi	sp,sp,16
    8000522c:	00008067          	ret

0000000080005230 <usertrapret>:
    80005230:	ff010113          	addi	sp,sp,-16
    80005234:	00813423          	sd	s0,8(sp)
    80005238:	01010413          	addi	s0,sp,16
    8000523c:	00813403          	ld	s0,8(sp)
    80005240:	01010113          	addi	sp,sp,16
    80005244:	00008067          	ret

0000000080005248 <kerneltrap>:
    80005248:	fe010113          	addi	sp,sp,-32
    8000524c:	00813823          	sd	s0,16(sp)
    80005250:	00113c23          	sd	ra,24(sp)
    80005254:	00913423          	sd	s1,8(sp)
    80005258:	02010413          	addi	s0,sp,32
    8000525c:	142025f3          	csrr	a1,scause
    80005260:	100027f3          	csrr	a5,sstatus
    80005264:	0027f793          	andi	a5,a5,2
    80005268:	10079c63          	bnez	a5,80005380 <kerneltrap+0x138>
    8000526c:	142027f3          	csrr	a5,scause
    80005270:	0207ce63          	bltz	a5,800052ac <kerneltrap+0x64>
    80005274:	00003517          	auipc	a0,0x3
    80005278:	30c50513          	addi	a0,a0,780 # 80008580 <_ZTV14PeriodicWorker+0x1e0>
    8000527c:	00001097          	auipc	ra,0x1
    80005280:	88c080e7          	jalr	-1908(ra) # 80005b08 <__printf>
    80005284:	141025f3          	csrr	a1,sepc
    80005288:	14302673          	csrr	a2,stval
    8000528c:	00003517          	auipc	a0,0x3
    80005290:	30450513          	addi	a0,a0,772 # 80008590 <_ZTV14PeriodicWorker+0x1f0>
    80005294:	00001097          	auipc	ra,0x1
    80005298:	874080e7          	jalr	-1932(ra) # 80005b08 <__printf>
    8000529c:	00003517          	auipc	a0,0x3
    800052a0:	30c50513          	addi	a0,a0,780 # 800085a8 <_ZTV14PeriodicWorker+0x208>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	808080e7          	jalr	-2040(ra) # 80005aac <panic>
    800052ac:	0ff7f713          	andi	a4,a5,255
    800052b0:	00900693          	li	a3,9
    800052b4:	04d70063          	beq	a4,a3,800052f4 <kerneltrap+0xac>
    800052b8:	fff00713          	li	a4,-1
    800052bc:	03f71713          	slli	a4,a4,0x3f
    800052c0:	00170713          	addi	a4,a4,1
    800052c4:	fae798e3          	bne	a5,a4,80005274 <kerneltrap+0x2c>
    800052c8:	00000097          	auipc	ra,0x0
    800052cc:	e00080e7          	jalr	-512(ra) # 800050c8 <cpuid>
    800052d0:	06050663          	beqz	a0,8000533c <kerneltrap+0xf4>
    800052d4:	144027f3          	csrr	a5,sip
    800052d8:	ffd7f793          	andi	a5,a5,-3
    800052dc:	14479073          	csrw	sip,a5
    800052e0:	01813083          	ld	ra,24(sp)
    800052e4:	01013403          	ld	s0,16(sp)
    800052e8:	00813483          	ld	s1,8(sp)
    800052ec:	02010113          	addi	sp,sp,32
    800052f0:	00008067          	ret
    800052f4:	00000097          	auipc	ra,0x0
    800052f8:	3d0080e7          	jalr	976(ra) # 800056c4 <plic_claim>
    800052fc:	00a00793          	li	a5,10
    80005300:	00050493          	mv	s1,a0
    80005304:	06f50863          	beq	a0,a5,80005374 <kerneltrap+0x12c>
    80005308:	fc050ce3          	beqz	a0,800052e0 <kerneltrap+0x98>
    8000530c:	00050593          	mv	a1,a0
    80005310:	00003517          	auipc	a0,0x3
    80005314:	25050513          	addi	a0,a0,592 # 80008560 <_ZTV14PeriodicWorker+0x1c0>
    80005318:	00000097          	auipc	ra,0x0
    8000531c:	7f0080e7          	jalr	2032(ra) # 80005b08 <__printf>
    80005320:	01013403          	ld	s0,16(sp)
    80005324:	01813083          	ld	ra,24(sp)
    80005328:	00048513          	mv	a0,s1
    8000532c:	00813483          	ld	s1,8(sp)
    80005330:	02010113          	addi	sp,sp,32
    80005334:	00000317          	auipc	t1,0x0
    80005338:	3c830067          	jr	968(t1) # 800056fc <plic_complete>
    8000533c:	00006517          	auipc	a0,0x6
    80005340:	d8450513          	addi	a0,a0,-636 # 8000b0c0 <tickslock>
    80005344:	00001097          	auipc	ra,0x1
    80005348:	498080e7          	jalr	1176(ra) # 800067dc <acquire>
    8000534c:	00005717          	auipc	a4,0x5
    80005350:	c4070713          	addi	a4,a4,-960 # 80009f8c <ticks>
    80005354:	00072783          	lw	a5,0(a4)
    80005358:	00006517          	auipc	a0,0x6
    8000535c:	d6850513          	addi	a0,a0,-664 # 8000b0c0 <tickslock>
    80005360:	0017879b          	addiw	a5,a5,1
    80005364:	00f72023          	sw	a5,0(a4)
    80005368:	00001097          	auipc	ra,0x1
    8000536c:	540080e7          	jalr	1344(ra) # 800068a8 <release>
    80005370:	f65ff06f          	j	800052d4 <kerneltrap+0x8c>
    80005374:	00001097          	auipc	ra,0x1
    80005378:	09c080e7          	jalr	156(ra) # 80006410 <uartintr>
    8000537c:	fa5ff06f          	j	80005320 <kerneltrap+0xd8>
    80005380:	00003517          	auipc	a0,0x3
    80005384:	1c050513          	addi	a0,a0,448 # 80008540 <_ZTV14PeriodicWorker+0x1a0>
    80005388:	00000097          	auipc	ra,0x0
    8000538c:	724080e7          	jalr	1828(ra) # 80005aac <panic>

0000000080005390 <clockintr>:
    80005390:	fe010113          	addi	sp,sp,-32
    80005394:	00813823          	sd	s0,16(sp)
    80005398:	00913423          	sd	s1,8(sp)
    8000539c:	00113c23          	sd	ra,24(sp)
    800053a0:	02010413          	addi	s0,sp,32
    800053a4:	00006497          	auipc	s1,0x6
    800053a8:	d1c48493          	addi	s1,s1,-740 # 8000b0c0 <tickslock>
    800053ac:	00048513          	mv	a0,s1
    800053b0:	00001097          	auipc	ra,0x1
    800053b4:	42c080e7          	jalr	1068(ra) # 800067dc <acquire>
    800053b8:	00005717          	auipc	a4,0x5
    800053bc:	bd470713          	addi	a4,a4,-1068 # 80009f8c <ticks>
    800053c0:	00072783          	lw	a5,0(a4)
    800053c4:	01013403          	ld	s0,16(sp)
    800053c8:	01813083          	ld	ra,24(sp)
    800053cc:	00048513          	mv	a0,s1
    800053d0:	0017879b          	addiw	a5,a5,1
    800053d4:	00813483          	ld	s1,8(sp)
    800053d8:	00f72023          	sw	a5,0(a4)
    800053dc:	02010113          	addi	sp,sp,32
    800053e0:	00001317          	auipc	t1,0x1
    800053e4:	4c830067          	jr	1224(t1) # 800068a8 <release>

00000000800053e8 <devintr>:
    800053e8:	142027f3          	csrr	a5,scause
    800053ec:	00000513          	li	a0,0
    800053f0:	0007c463          	bltz	a5,800053f8 <devintr+0x10>
    800053f4:	00008067          	ret
    800053f8:	fe010113          	addi	sp,sp,-32
    800053fc:	00813823          	sd	s0,16(sp)
    80005400:	00113c23          	sd	ra,24(sp)
    80005404:	00913423          	sd	s1,8(sp)
    80005408:	02010413          	addi	s0,sp,32
    8000540c:	0ff7f713          	andi	a4,a5,255
    80005410:	00900693          	li	a3,9
    80005414:	04d70c63          	beq	a4,a3,8000546c <devintr+0x84>
    80005418:	fff00713          	li	a4,-1
    8000541c:	03f71713          	slli	a4,a4,0x3f
    80005420:	00170713          	addi	a4,a4,1
    80005424:	00e78c63          	beq	a5,a4,8000543c <devintr+0x54>
    80005428:	01813083          	ld	ra,24(sp)
    8000542c:	01013403          	ld	s0,16(sp)
    80005430:	00813483          	ld	s1,8(sp)
    80005434:	02010113          	addi	sp,sp,32
    80005438:	00008067          	ret
    8000543c:	00000097          	auipc	ra,0x0
    80005440:	c8c080e7          	jalr	-884(ra) # 800050c8 <cpuid>
    80005444:	06050663          	beqz	a0,800054b0 <devintr+0xc8>
    80005448:	144027f3          	csrr	a5,sip
    8000544c:	ffd7f793          	andi	a5,a5,-3
    80005450:	14479073          	csrw	sip,a5
    80005454:	01813083          	ld	ra,24(sp)
    80005458:	01013403          	ld	s0,16(sp)
    8000545c:	00813483          	ld	s1,8(sp)
    80005460:	00200513          	li	a0,2
    80005464:	02010113          	addi	sp,sp,32
    80005468:	00008067          	ret
    8000546c:	00000097          	auipc	ra,0x0
    80005470:	258080e7          	jalr	600(ra) # 800056c4 <plic_claim>
    80005474:	00a00793          	li	a5,10
    80005478:	00050493          	mv	s1,a0
    8000547c:	06f50663          	beq	a0,a5,800054e8 <devintr+0x100>
    80005480:	00100513          	li	a0,1
    80005484:	fa0482e3          	beqz	s1,80005428 <devintr+0x40>
    80005488:	00048593          	mv	a1,s1
    8000548c:	00003517          	auipc	a0,0x3
    80005490:	0d450513          	addi	a0,a0,212 # 80008560 <_ZTV14PeriodicWorker+0x1c0>
    80005494:	00000097          	auipc	ra,0x0
    80005498:	674080e7          	jalr	1652(ra) # 80005b08 <__printf>
    8000549c:	00048513          	mv	a0,s1
    800054a0:	00000097          	auipc	ra,0x0
    800054a4:	25c080e7          	jalr	604(ra) # 800056fc <plic_complete>
    800054a8:	00100513          	li	a0,1
    800054ac:	f7dff06f          	j	80005428 <devintr+0x40>
    800054b0:	00006517          	auipc	a0,0x6
    800054b4:	c1050513          	addi	a0,a0,-1008 # 8000b0c0 <tickslock>
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	324080e7          	jalr	804(ra) # 800067dc <acquire>
    800054c0:	00005717          	auipc	a4,0x5
    800054c4:	acc70713          	addi	a4,a4,-1332 # 80009f8c <ticks>
    800054c8:	00072783          	lw	a5,0(a4)
    800054cc:	00006517          	auipc	a0,0x6
    800054d0:	bf450513          	addi	a0,a0,-1036 # 8000b0c0 <tickslock>
    800054d4:	0017879b          	addiw	a5,a5,1
    800054d8:	00f72023          	sw	a5,0(a4)
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	3cc080e7          	jalr	972(ra) # 800068a8 <release>
    800054e4:	f65ff06f          	j	80005448 <devintr+0x60>
    800054e8:	00001097          	auipc	ra,0x1
    800054ec:	f28080e7          	jalr	-216(ra) # 80006410 <uartintr>
    800054f0:	fadff06f          	j	8000549c <devintr+0xb4>
	...

0000000080005500 <kernelvec>:
    80005500:	f0010113          	addi	sp,sp,-256
    80005504:	00113023          	sd	ra,0(sp)
    80005508:	00213423          	sd	sp,8(sp)
    8000550c:	00313823          	sd	gp,16(sp)
    80005510:	00413c23          	sd	tp,24(sp)
    80005514:	02513023          	sd	t0,32(sp)
    80005518:	02613423          	sd	t1,40(sp)
    8000551c:	02713823          	sd	t2,48(sp)
    80005520:	02813c23          	sd	s0,56(sp)
    80005524:	04913023          	sd	s1,64(sp)
    80005528:	04a13423          	sd	a0,72(sp)
    8000552c:	04b13823          	sd	a1,80(sp)
    80005530:	04c13c23          	sd	a2,88(sp)
    80005534:	06d13023          	sd	a3,96(sp)
    80005538:	06e13423          	sd	a4,104(sp)
    8000553c:	06f13823          	sd	a5,112(sp)
    80005540:	07013c23          	sd	a6,120(sp)
    80005544:	09113023          	sd	a7,128(sp)
    80005548:	09213423          	sd	s2,136(sp)
    8000554c:	09313823          	sd	s3,144(sp)
    80005550:	09413c23          	sd	s4,152(sp)
    80005554:	0b513023          	sd	s5,160(sp)
    80005558:	0b613423          	sd	s6,168(sp)
    8000555c:	0b713823          	sd	s7,176(sp)
    80005560:	0b813c23          	sd	s8,184(sp)
    80005564:	0d913023          	sd	s9,192(sp)
    80005568:	0da13423          	sd	s10,200(sp)
    8000556c:	0db13823          	sd	s11,208(sp)
    80005570:	0dc13c23          	sd	t3,216(sp)
    80005574:	0fd13023          	sd	t4,224(sp)
    80005578:	0fe13423          	sd	t5,232(sp)
    8000557c:	0ff13823          	sd	t6,240(sp)
    80005580:	cc9ff0ef          	jal	ra,80005248 <kerneltrap>
    80005584:	00013083          	ld	ra,0(sp)
    80005588:	00813103          	ld	sp,8(sp)
    8000558c:	01013183          	ld	gp,16(sp)
    80005590:	02013283          	ld	t0,32(sp)
    80005594:	02813303          	ld	t1,40(sp)
    80005598:	03013383          	ld	t2,48(sp)
    8000559c:	03813403          	ld	s0,56(sp)
    800055a0:	04013483          	ld	s1,64(sp)
    800055a4:	04813503          	ld	a0,72(sp)
    800055a8:	05013583          	ld	a1,80(sp)
    800055ac:	05813603          	ld	a2,88(sp)
    800055b0:	06013683          	ld	a3,96(sp)
    800055b4:	06813703          	ld	a4,104(sp)
    800055b8:	07013783          	ld	a5,112(sp)
    800055bc:	07813803          	ld	a6,120(sp)
    800055c0:	08013883          	ld	a7,128(sp)
    800055c4:	08813903          	ld	s2,136(sp)
    800055c8:	09013983          	ld	s3,144(sp)
    800055cc:	09813a03          	ld	s4,152(sp)
    800055d0:	0a013a83          	ld	s5,160(sp)
    800055d4:	0a813b03          	ld	s6,168(sp)
    800055d8:	0b013b83          	ld	s7,176(sp)
    800055dc:	0b813c03          	ld	s8,184(sp)
    800055e0:	0c013c83          	ld	s9,192(sp)
    800055e4:	0c813d03          	ld	s10,200(sp)
    800055e8:	0d013d83          	ld	s11,208(sp)
    800055ec:	0d813e03          	ld	t3,216(sp)
    800055f0:	0e013e83          	ld	t4,224(sp)
    800055f4:	0e813f03          	ld	t5,232(sp)
    800055f8:	0f013f83          	ld	t6,240(sp)
    800055fc:	10010113          	addi	sp,sp,256
    80005600:	10200073          	sret
    80005604:	00000013          	nop
    80005608:	00000013          	nop
    8000560c:	00000013          	nop

0000000080005610 <timervec>:
    80005610:	34051573          	csrrw	a0,mscratch,a0
    80005614:	00b53023          	sd	a1,0(a0)
    80005618:	00c53423          	sd	a2,8(a0)
    8000561c:	00d53823          	sd	a3,16(a0)
    80005620:	01853583          	ld	a1,24(a0)
    80005624:	02053603          	ld	a2,32(a0)
    80005628:	0005b683          	ld	a3,0(a1)
    8000562c:	00c686b3          	add	a3,a3,a2
    80005630:	00d5b023          	sd	a3,0(a1)
    80005634:	00200593          	li	a1,2
    80005638:	14459073          	csrw	sip,a1
    8000563c:	01053683          	ld	a3,16(a0)
    80005640:	00853603          	ld	a2,8(a0)
    80005644:	00053583          	ld	a1,0(a0)
    80005648:	34051573          	csrrw	a0,mscratch,a0
    8000564c:	30200073          	mret

0000000080005650 <plicinit>:
    80005650:	ff010113          	addi	sp,sp,-16
    80005654:	00813423          	sd	s0,8(sp)
    80005658:	01010413          	addi	s0,sp,16
    8000565c:	00813403          	ld	s0,8(sp)
    80005660:	0c0007b7          	lui	a5,0xc000
    80005664:	00100713          	li	a4,1
    80005668:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000566c:	00e7a223          	sw	a4,4(a5)
    80005670:	01010113          	addi	sp,sp,16
    80005674:	00008067          	ret

0000000080005678 <plicinithart>:
    80005678:	ff010113          	addi	sp,sp,-16
    8000567c:	00813023          	sd	s0,0(sp)
    80005680:	00113423          	sd	ra,8(sp)
    80005684:	01010413          	addi	s0,sp,16
    80005688:	00000097          	auipc	ra,0x0
    8000568c:	a40080e7          	jalr	-1472(ra) # 800050c8 <cpuid>
    80005690:	0085171b          	slliw	a4,a0,0x8
    80005694:	0c0027b7          	lui	a5,0xc002
    80005698:	00e787b3          	add	a5,a5,a4
    8000569c:	40200713          	li	a4,1026
    800056a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800056a4:	00813083          	ld	ra,8(sp)
    800056a8:	00013403          	ld	s0,0(sp)
    800056ac:	00d5151b          	slliw	a0,a0,0xd
    800056b0:	0c2017b7          	lui	a5,0xc201
    800056b4:	00a78533          	add	a0,a5,a0
    800056b8:	00052023          	sw	zero,0(a0)
    800056bc:	01010113          	addi	sp,sp,16
    800056c0:	00008067          	ret

00000000800056c4 <plic_claim>:
    800056c4:	ff010113          	addi	sp,sp,-16
    800056c8:	00813023          	sd	s0,0(sp)
    800056cc:	00113423          	sd	ra,8(sp)
    800056d0:	01010413          	addi	s0,sp,16
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	9f4080e7          	jalr	-1548(ra) # 800050c8 <cpuid>
    800056dc:	00813083          	ld	ra,8(sp)
    800056e0:	00013403          	ld	s0,0(sp)
    800056e4:	00d5151b          	slliw	a0,a0,0xd
    800056e8:	0c2017b7          	lui	a5,0xc201
    800056ec:	00a78533          	add	a0,a5,a0
    800056f0:	00452503          	lw	a0,4(a0)
    800056f4:	01010113          	addi	sp,sp,16
    800056f8:	00008067          	ret

00000000800056fc <plic_complete>:
    800056fc:	fe010113          	addi	sp,sp,-32
    80005700:	00813823          	sd	s0,16(sp)
    80005704:	00913423          	sd	s1,8(sp)
    80005708:	00113c23          	sd	ra,24(sp)
    8000570c:	02010413          	addi	s0,sp,32
    80005710:	00050493          	mv	s1,a0
    80005714:	00000097          	auipc	ra,0x0
    80005718:	9b4080e7          	jalr	-1612(ra) # 800050c8 <cpuid>
    8000571c:	01813083          	ld	ra,24(sp)
    80005720:	01013403          	ld	s0,16(sp)
    80005724:	00d5179b          	slliw	a5,a0,0xd
    80005728:	0c201737          	lui	a4,0xc201
    8000572c:	00f707b3          	add	a5,a4,a5
    80005730:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005734:	00813483          	ld	s1,8(sp)
    80005738:	02010113          	addi	sp,sp,32
    8000573c:	00008067          	ret

0000000080005740 <consolewrite>:
    80005740:	fb010113          	addi	sp,sp,-80
    80005744:	04813023          	sd	s0,64(sp)
    80005748:	04113423          	sd	ra,72(sp)
    8000574c:	02913c23          	sd	s1,56(sp)
    80005750:	03213823          	sd	s2,48(sp)
    80005754:	03313423          	sd	s3,40(sp)
    80005758:	03413023          	sd	s4,32(sp)
    8000575c:	01513c23          	sd	s5,24(sp)
    80005760:	05010413          	addi	s0,sp,80
    80005764:	06c05c63          	blez	a2,800057dc <consolewrite+0x9c>
    80005768:	00060993          	mv	s3,a2
    8000576c:	00050a13          	mv	s4,a0
    80005770:	00058493          	mv	s1,a1
    80005774:	00000913          	li	s2,0
    80005778:	fff00a93          	li	s5,-1
    8000577c:	01c0006f          	j	80005798 <consolewrite+0x58>
    80005780:	fbf44503          	lbu	a0,-65(s0)
    80005784:	0019091b          	addiw	s2,s2,1
    80005788:	00148493          	addi	s1,s1,1
    8000578c:	00001097          	auipc	ra,0x1
    80005790:	a9c080e7          	jalr	-1380(ra) # 80006228 <uartputc>
    80005794:	03298063          	beq	s3,s2,800057b4 <consolewrite+0x74>
    80005798:	00048613          	mv	a2,s1
    8000579c:	00100693          	li	a3,1
    800057a0:	000a0593          	mv	a1,s4
    800057a4:	fbf40513          	addi	a0,s0,-65
    800057a8:	00000097          	auipc	ra,0x0
    800057ac:	9d8080e7          	jalr	-1576(ra) # 80005180 <either_copyin>
    800057b0:	fd5518e3          	bne	a0,s5,80005780 <consolewrite+0x40>
    800057b4:	04813083          	ld	ra,72(sp)
    800057b8:	04013403          	ld	s0,64(sp)
    800057bc:	03813483          	ld	s1,56(sp)
    800057c0:	02813983          	ld	s3,40(sp)
    800057c4:	02013a03          	ld	s4,32(sp)
    800057c8:	01813a83          	ld	s5,24(sp)
    800057cc:	00090513          	mv	a0,s2
    800057d0:	03013903          	ld	s2,48(sp)
    800057d4:	05010113          	addi	sp,sp,80
    800057d8:	00008067          	ret
    800057dc:	00000913          	li	s2,0
    800057e0:	fd5ff06f          	j	800057b4 <consolewrite+0x74>

00000000800057e4 <consoleread>:
    800057e4:	f9010113          	addi	sp,sp,-112
    800057e8:	06813023          	sd	s0,96(sp)
    800057ec:	04913c23          	sd	s1,88(sp)
    800057f0:	05213823          	sd	s2,80(sp)
    800057f4:	05313423          	sd	s3,72(sp)
    800057f8:	05413023          	sd	s4,64(sp)
    800057fc:	03513c23          	sd	s5,56(sp)
    80005800:	03613823          	sd	s6,48(sp)
    80005804:	03713423          	sd	s7,40(sp)
    80005808:	03813023          	sd	s8,32(sp)
    8000580c:	06113423          	sd	ra,104(sp)
    80005810:	01913c23          	sd	s9,24(sp)
    80005814:	07010413          	addi	s0,sp,112
    80005818:	00060b93          	mv	s7,a2
    8000581c:	00050913          	mv	s2,a0
    80005820:	00058c13          	mv	s8,a1
    80005824:	00060b1b          	sext.w	s6,a2
    80005828:	00006497          	auipc	s1,0x6
    8000582c:	8c048493          	addi	s1,s1,-1856 # 8000b0e8 <cons>
    80005830:	00400993          	li	s3,4
    80005834:	fff00a13          	li	s4,-1
    80005838:	00a00a93          	li	s5,10
    8000583c:	05705e63          	blez	s7,80005898 <consoleread+0xb4>
    80005840:	09c4a703          	lw	a4,156(s1)
    80005844:	0984a783          	lw	a5,152(s1)
    80005848:	0007071b          	sext.w	a4,a4
    8000584c:	08e78463          	beq	a5,a4,800058d4 <consoleread+0xf0>
    80005850:	07f7f713          	andi	a4,a5,127
    80005854:	00e48733          	add	a4,s1,a4
    80005858:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000585c:	0017869b          	addiw	a3,a5,1
    80005860:	08d4ac23          	sw	a3,152(s1)
    80005864:	00070c9b          	sext.w	s9,a4
    80005868:	0b370663          	beq	a4,s3,80005914 <consoleread+0x130>
    8000586c:	00100693          	li	a3,1
    80005870:	f9f40613          	addi	a2,s0,-97
    80005874:	000c0593          	mv	a1,s8
    80005878:	00090513          	mv	a0,s2
    8000587c:	f8e40fa3          	sb	a4,-97(s0)
    80005880:	00000097          	auipc	ra,0x0
    80005884:	8b4080e7          	jalr	-1868(ra) # 80005134 <either_copyout>
    80005888:	01450863          	beq	a0,s4,80005898 <consoleread+0xb4>
    8000588c:	001c0c13          	addi	s8,s8,1
    80005890:	fffb8b9b          	addiw	s7,s7,-1
    80005894:	fb5c94e3          	bne	s9,s5,8000583c <consoleread+0x58>
    80005898:	000b851b          	sext.w	a0,s7
    8000589c:	06813083          	ld	ra,104(sp)
    800058a0:	06013403          	ld	s0,96(sp)
    800058a4:	05813483          	ld	s1,88(sp)
    800058a8:	05013903          	ld	s2,80(sp)
    800058ac:	04813983          	ld	s3,72(sp)
    800058b0:	04013a03          	ld	s4,64(sp)
    800058b4:	03813a83          	ld	s5,56(sp)
    800058b8:	02813b83          	ld	s7,40(sp)
    800058bc:	02013c03          	ld	s8,32(sp)
    800058c0:	01813c83          	ld	s9,24(sp)
    800058c4:	40ab053b          	subw	a0,s6,a0
    800058c8:	03013b03          	ld	s6,48(sp)
    800058cc:	07010113          	addi	sp,sp,112
    800058d0:	00008067          	ret
    800058d4:	00001097          	auipc	ra,0x1
    800058d8:	1d8080e7          	jalr	472(ra) # 80006aac <push_on>
    800058dc:	0984a703          	lw	a4,152(s1)
    800058e0:	09c4a783          	lw	a5,156(s1)
    800058e4:	0007879b          	sext.w	a5,a5
    800058e8:	fef70ce3          	beq	a4,a5,800058e0 <consoleread+0xfc>
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	234080e7          	jalr	564(ra) # 80006b20 <pop_on>
    800058f4:	0984a783          	lw	a5,152(s1)
    800058f8:	07f7f713          	andi	a4,a5,127
    800058fc:	00e48733          	add	a4,s1,a4
    80005900:	01874703          	lbu	a4,24(a4)
    80005904:	0017869b          	addiw	a3,a5,1
    80005908:	08d4ac23          	sw	a3,152(s1)
    8000590c:	00070c9b          	sext.w	s9,a4
    80005910:	f5371ee3          	bne	a4,s3,8000586c <consoleread+0x88>
    80005914:	000b851b          	sext.w	a0,s7
    80005918:	f96bf2e3          	bgeu	s7,s6,8000589c <consoleread+0xb8>
    8000591c:	08f4ac23          	sw	a5,152(s1)
    80005920:	f7dff06f          	j	8000589c <consoleread+0xb8>

0000000080005924 <consputc>:
    80005924:	10000793          	li	a5,256
    80005928:	00f50663          	beq	a0,a5,80005934 <consputc+0x10>
    8000592c:	00001317          	auipc	t1,0x1
    80005930:	9f430067          	jr	-1548(t1) # 80006320 <uartputc_sync>
    80005934:	ff010113          	addi	sp,sp,-16
    80005938:	00113423          	sd	ra,8(sp)
    8000593c:	00813023          	sd	s0,0(sp)
    80005940:	01010413          	addi	s0,sp,16
    80005944:	00800513          	li	a0,8
    80005948:	00001097          	auipc	ra,0x1
    8000594c:	9d8080e7          	jalr	-1576(ra) # 80006320 <uartputc_sync>
    80005950:	02000513          	li	a0,32
    80005954:	00001097          	auipc	ra,0x1
    80005958:	9cc080e7          	jalr	-1588(ra) # 80006320 <uartputc_sync>
    8000595c:	00013403          	ld	s0,0(sp)
    80005960:	00813083          	ld	ra,8(sp)
    80005964:	00800513          	li	a0,8
    80005968:	01010113          	addi	sp,sp,16
    8000596c:	00001317          	auipc	t1,0x1
    80005970:	9b430067          	jr	-1612(t1) # 80006320 <uartputc_sync>

0000000080005974 <consoleintr>:
    80005974:	fe010113          	addi	sp,sp,-32
    80005978:	00813823          	sd	s0,16(sp)
    8000597c:	00913423          	sd	s1,8(sp)
    80005980:	01213023          	sd	s2,0(sp)
    80005984:	00113c23          	sd	ra,24(sp)
    80005988:	02010413          	addi	s0,sp,32
    8000598c:	00005917          	auipc	s2,0x5
    80005990:	75c90913          	addi	s2,s2,1884 # 8000b0e8 <cons>
    80005994:	00050493          	mv	s1,a0
    80005998:	00090513          	mv	a0,s2
    8000599c:	00001097          	auipc	ra,0x1
    800059a0:	e40080e7          	jalr	-448(ra) # 800067dc <acquire>
    800059a4:	02048c63          	beqz	s1,800059dc <consoleintr+0x68>
    800059a8:	0a092783          	lw	a5,160(s2)
    800059ac:	09892703          	lw	a4,152(s2)
    800059b0:	07f00693          	li	a3,127
    800059b4:	40e7873b          	subw	a4,a5,a4
    800059b8:	02e6e263          	bltu	a3,a4,800059dc <consoleintr+0x68>
    800059bc:	00d00713          	li	a4,13
    800059c0:	04e48063          	beq	s1,a4,80005a00 <consoleintr+0x8c>
    800059c4:	07f7f713          	andi	a4,a5,127
    800059c8:	00e90733          	add	a4,s2,a4
    800059cc:	0017879b          	addiw	a5,a5,1
    800059d0:	0af92023          	sw	a5,160(s2)
    800059d4:	00970c23          	sb	s1,24(a4)
    800059d8:	08f92e23          	sw	a5,156(s2)
    800059dc:	01013403          	ld	s0,16(sp)
    800059e0:	01813083          	ld	ra,24(sp)
    800059e4:	00813483          	ld	s1,8(sp)
    800059e8:	00013903          	ld	s2,0(sp)
    800059ec:	00005517          	auipc	a0,0x5
    800059f0:	6fc50513          	addi	a0,a0,1788 # 8000b0e8 <cons>
    800059f4:	02010113          	addi	sp,sp,32
    800059f8:	00001317          	auipc	t1,0x1
    800059fc:	eb030067          	jr	-336(t1) # 800068a8 <release>
    80005a00:	00a00493          	li	s1,10
    80005a04:	fc1ff06f          	j	800059c4 <consoleintr+0x50>

0000000080005a08 <consoleinit>:
    80005a08:	fe010113          	addi	sp,sp,-32
    80005a0c:	00113c23          	sd	ra,24(sp)
    80005a10:	00813823          	sd	s0,16(sp)
    80005a14:	00913423          	sd	s1,8(sp)
    80005a18:	02010413          	addi	s0,sp,32
    80005a1c:	00005497          	auipc	s1,0x5
    80005a20:	6cc48493          	addi	s1,s1,1740 # 8000b0e8 <cons>
    80005a24:	00048513          	mv	a0,s1
    80005a28:	00003597          	auipc	a1,0x3
    80005a2c:	b9058593          	addi	a1,a1,-1136 # 800085b8 <_ZTV14PeriodicWorker+0x218>
    80005a30:	00001097          	auipc	ra,0x1
    80005a34:	d88080e7          	jalr	-632(ra) # 800067b8 <initlock>
    80005a38:	00000097          	auipc	ra,0x0
    80005a3c:	7ac080e7          	jalr	1964(ra) # 800061e4 <uartinit>
    80005a40:	01813083          	ld	ra,24(sp)
    80005a44:	01013403          	ld	s0,16(sp)
    80005a48:	00000797          	auipc	a5,0x0
    80005a4c:	d9c78793          	addi	a5,a5,-612 # 800057e4 <consoleread>
    80005a50:	0af4bc23          	sd	a5,184(s1)
    80005a54:	00000797          	auipc	a5,0x0
    80005a58:	cec78793          	addi	a5,a5,-788 # 80005740 <consolewrite>
    80005a5c:	0cf4b023          	sd	a5,192(s1)
    80005a60:	00813483          	ld	s1,8(sp)
    80005a64:	02010113          	addi	sp,sp,32
    80005a68:	00008067          	ret

0000000080005a6c <console_read>:
    80005a6c:	ff010113          	addi	sp,sp,-16
    80005a70:	00813423          	sd	s0,8(sp)
    80005a74:	01010413          	addi	s0,sp,16
    80005a78:	00813403          	ld	s0,8(sp)
    80005a7c:	00005317          	auipc	t1,0x5
    80005a80:	72433303          	ld	t1,1828(t1) # 8000b1a0 <devsw+0x10>
    80005a84:	01010113          	addi	sp,sp,16
    80005a88:	00030067          	jr	t1

0000000080005a8c <console_write>:
    80005a8c:	ff010113          	addi	sp,sp,-16
    80005a90:	00813423          	sd	s0,8(sp)
    80005a94:	01010413          	addi	s0,sp,16
    80005a98:	00813403          	ld	s0,8(sp)
    80005a9c:	00005317          	auipc	t1,0x5
    80005aa0:	70c33303          	ld	t1,1804(t1) # 8000b1a8 <devsw+0x18>
    80005aa4:	01010113          	addi	sp,sp,16
    80005aa8:	00030067          	jr	t1

0000000080005aac <panic>:
    80005aac:	fe010113          	addi	sp,sp,-32
    80005ab0:	00113c23          	sd	ra,24(sp)
    80005ab4:	00813823          	sd	s0,16(sp)
    80005ab8:	00913423          	sd	s1,8(sp)
    80005abc:	02010413          	addi	s0,sp,32
    80005ac0:	00050493          	mv	s1,a0
    80005ac4:	00003517          	auipc	a0,0x3
    80005ac8:	afc50513          	addi	a0,a0,-1284 # 800085c0 <_ZTV14PeriodicWorker+0x220>
    80005acc:	00005797          	auipc	a5,0x5
    80005ad0:	7607ae23          	sw	zero,1916(a5) # 8000b248 <pr+0x18>
    80005ad4:	00000097          	auipc	ra,0x0
    80005ad8:	034080e7          	jalr	52(ra) # 80005b08 <__printf>
    80005adc:	00048513          	mv	a0,s1
    80005ae0:	00000097          	auipc	ra,0x0
    80005ae4:	028080e7          	jalr	40(ra) # 80005b08 <__printf>
    80005ae8:	00002517          	auipc	a0,0x2
    80005aec:	7d850513          	addi	a0,a0,2008 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	018080e7          	jalr	24(ra) # 80005b08 <__printf>
    80005af8:	00100793          	li	a5,1
    80005afc:	00004717          	auipc	a4,0x4
    80005b00:	48f72a23          	sw	a5,1172(a4) # 80009f90 <panicked>
    80005b04:	0000006f          	j	80005b04 <panic+0x58>

0000000080005b08 <__printf>:
    80005b08:	f3010113          	addi	sp,sp,-208
    80005b0c:	08813023          	sd	s0,128(sp)
    80005b10:	07313423          	sd	s3,104(sp)
    80005b14:	09010413          	addi	s0,sp,144
    80005b18:	05813023          	sd	s8,64(sp)
    80005b1c:	08113423          	sd	ra,136(sp)
    80005b20:	06913c23          	sd	s1,120(sp)
    80005b24:	07213823          	sd	s2,112(sp)
    80005b28:	07413023          	sd	s4,96(sp)
    80005b2c:	05513c23          	sd	s5,88(sp)
    80005b30:	05613823          	sd	s6,80(sp)
    80005b34:	05713423          	sd	s7,72(sp)
    80005b38:	03913c23          	sd	s9,56(sp)
    80005b3c:	03a13823          	sd	s10,48(sp)
    80005b40:	03b13423          	sd	s11,40(sp)
    80005b44:	00005317          	auipc	t1,0x5
    80005b48:	6ec30313          	addi	t1,t1,1772 # 8000b230 <pr>
    80005b4c:	01832c03          	lw	s8,24(t1)
    80005b50:	00b43423          	sd	a1,8(s0)
    80005b54:	00c43823          	sd	a2,16(s0)
    80005b58:	00d43c23          	sd	a3,24(s0)
    80005b5c:	02e43023          	sd	a4,32(s0)
    80005b60:	02f43423          	sd	a5,40(s0)
    80005b64:	03043823          	sd	a6,48(s0)
    80005b68:	03143c23          	sd	a7,56(s0)
    80005b6c:	00050993          	mv	s3,a0
    80005b70:	4a0c1663          	bnez	s8,8000601c <__printf+0x514>
    80005b74:	60098c63          	beqz	s3,8000618c <__printf+0x684>
    80005b78:	0009c503          	lbu	a0,0(s3)
    80005b7c:	00840793          	addi	a5,s0,8
    80005b80:	f6f43c23          	sd	a5,-136(s0)
    80005b84:	00000493          	li	s1,0
    80005b88:	22050063          	beqz	a0,80005da8 <__printf+0x2a0>
    80005b8c:	00002a37          	lui	s4,0x2
    80005b90:	00018ab7          	lui	s5,0x18
    80005b94:	000f4b37          	lui	s6,0xf4
    80005b98:	00989bb7          	lui	s7,0x989
    80005b9c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005ba0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005ba4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005ba8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005bac:	00148c9b          	addiw	s9,s1,1
    80005bb0:	02500793          	li	a5,37
    80005bb4:	01998933          	add	s2,s3,s9
    80005bb8:	38f51263          	bne	a0,a5,80005f3c <__printf+0x434>
    80005bbc:	00094783          	lbu	a5,0(s2)
    80005bc0:	00078c9b          	sext.w	s9,a5
    80005bc4:	1e078263          	beqz	a5,80005da8 <__printf+0x2a0>
    80005bc8:	0024849b          	addiw	s1,s1,2
    80005bcc:	07000713          	li	a4,112
    80005bd0:	00998933          	add	s2,s3,s1
    80005bd4:	38e78a63          	beq	a5,a4,80005f68 <__printf+0x460>
    80005bd8:	20f76863          	bltu	a4,a5,80005de8 <__printf+0x2e0>
    80005bdc:	42a78863          	beq	a5,a0,8000600c <__printf+0x504>
    80005be0:	06400713          	li	a4,100
    80005be4:	40e79663          	bne	a5,a4,80005ff0 <__printf+0x4e8>
    80005be8:	f7843783          	ld	a5,-136(s0)
    80005bec:	0007a603          	lw	a2,0(a5)
    80005bf0:	00878793          	addi	a5,a5,8
    80005bf4:	f6f43c23          	sd	a5,-136(s0)
    80005bf8:	42064a63          	bltz	a2,8000602c <__printf+0x524>
    80005bfc:	00a00713          	li	a4,10
    80005c00:	02e677bb          	remuw	a5,a2,a4
    80005c04:	00003d97          	auipc	s11,0x3
    80005c08:	9e4d8d93          	addi	s11,s11,-1564 # 800085e8 <digits>
    80005c0c:	00900593          	li	a1,9
    80005c10:	0006051b          	sext.w	a0,a2
    80005c14:	00000c93          	li	s9,0
    80005c18:	02079793          	slli	a5,a5,0x20
    80005c1c:	0207d793          	srli	a5,a5,0x20
    80005c20:	00fd87b3          	add	a5,s11,a5
    80005c24:	0007c783          	lbu	a5,0(a5)
    80005c28:	02e656bb          	divuw	a3,a2,a4
    80005c2c:	f8f40023          	sb	a5,-128(s0)
    80005c30:	14c5d863          	bge	a1,a2,80005d80 <__printf+0x278>
    80005c34:	06300593          	li	a1,99
    80005c38:	00100c93          	li	s9,1
    80005c3c:	02e6f7bb          	remuw	a5,a3,a4
    80005c40:	02079793          	slli	a5,a5,0x20
    80005c44:	0207d793          	srli	a5,a5,0x20
    80005c48:	00fd87b3          	add	a5,s11,a5
    80005c4c:	0007c783          	lbu	a5,0(a5)
    80005c50:	02e6d73b          	divuw	a4,a3,a4
    80005c54:	f8f400a3          	sb	a5,-127(s0)
    80005c58:	12a5f463          	bgeu	a1,a0,80005d80 <__printf+0x278>
    80005c5c:	00a00693          	li	a3,10
    80005c60:	00900593          	li	a1,9
    80005c64:	02d777bb          	remuw	a5,a4,a3
    80005c68:	02079793          	slli	a5,a5,0x20
    80005c6c:	0207d793          	srli	a5,a5,0x20
    80005c70:	00fd87b3          	add	a5,s11,a5
    80005c74:	0007c503          	lbu	a0,0(a5)
    80005c78:	02d757bb          	divuw	a5,a4,a3
    80005c7c:	f8a40123          	sb	a0,-126(s0)
    80005c80:	48e5f263          	bgeu	a1,a4,80006104 <__printf+0x5fc>
    80005c84:	06300513          	li	a0,99
    80005c88:	02d7f5bb          	remuw	a1,a5,a3
    80005c8c:	02059593          	slli	a1,a1,0x20
    80005c90:	0205d593          	srli	a1,a1,0x20
    80005c94:	00bd85b3          	add	a1,s11,a1
    80005c98:	0005c583          	lbu	a1,0(a1)
    80005c9c:	02d7d7bb          	divuw	a5,a5,a3
    80005ca0:	f8b401a3          	sb	a1,-125(s0)
    80005ca4:	48e57263          	bgeu	a0,a4,80006128 <__printf+0x620>
    80005ca8:	3e700513          	li	a0,999
    80005cac:	02d7f5bb          	remuw	a1,a5,a3
    80005cb0:	02059593          	slli	a1,a1,0x20
    80005cb4:	0205d593          	srli	a1,a1,0x20
    80005cb8:	00bd85b3          	add	a1,s11,a1
    80005cbc:	0005c583          	lbu	a1,0(a1)
    80005cc0:	02d7d7bb          	divuw	a5,a5,a3
    80005cc4:	f8b40223          	sb	a1,-124(s0)
    80005cc8:	46e57663          	bgeu	a0,a4,80006134 <__printf+0x62c>
    80005ccc:	02d7f5bb          	remuw	a1,a5,a3
    80005cd0:	02059593          	slli	a1,a1,0x20
    80005cd4:	0205d593          	srli	a1,a1,0x20
    80005cd8:	00bd85b3          	add	a1,s11,a1
    80005cdc:	0005c583          	lbu	a1,0(a1)
    80005ce0:	02d7d7bb          	divuw	a5,a5,a3
    80005ce4:	f8b402a3          	sb	a1,-123(s0)
    80005ce8:	46ea7863          	bgeu	s4,a4,80006158 <__printf+0x650>
    80005cec:	02d7f5bb          	remuw	a1,a5,a3
    80005cf0:	02059593          	slli	a1,a1,0x20
    80005cf4:	0205d593          	srli	a1,a1,0x20
    80005cf8:	00bd85b3          	add	a1,s11,a1
    80005cfc:	0005c583          	lbu	a1,0(a1)
    80005d00:	02d7d7bb          	divuw	a5,a5,a3
    80005d04:	f8b40323          	sb	a1,-122(s0)
    80005d08:	3eeaf863          	bgeu	s5,a4,800060f8 <__printf+0x5f0>
    80005d0c:	02d7f5bb          	remuw	a1,a5,a3
    80005d10:	02059593          	slli	a1,a1,0x20
    80005d14:	0205d593          	srli	a1,a1,0x20
    80005d18:	00bd85b3          	add	a1,s11,a1
    80005d1c:	0005c583          	lbu	a1,0(a1)
    80005d20:	02d7d7bb          	divuw	a5,a5,a3
    80005d24:	f8b403a3          	sb	a1,-121(s0)
    80005d28:	42eb7e63          	bgeu	s6,a4,80006164 <__printf+0x65c>
    80005d2c:	02d7f5bb          	remuw	a1,a5,a3
    80005d30:	02059593          	slli	a1,a1,0x20
    80005d34:	0205d593          	srli	a1,a1,0x20
    80005d38:	00bd85b3          	add	a1,s11,a1
    80005d3c:	0005c583          	lbu	a1,0(a1)
    80005d40:	02d7d7bb          	divuw	a5,a5,a3
    80005d44:	f8b40423          	sb	a1,-120(s0)
    80005d48:	42ebfc63          	bgeu	s7,a4,80006180 <__printf+0x678>
    80005d4c:	02079793          	slli	a5,a5,0x20
    80005d50:	0207d793          	srli	a5,a5,0x20
    80005d54:	00fd8db3          	add	s11,s11,a5
    80005d58:	000dc703          	lbu	a4,0(s11)
    80005d5c:	00a00793          	li	a5,10
    80005d60:	00900c93          	li	s9,9
    80005d64:	f8e404a3          	sb	a4,-119(s0)
    80005d68:	00065c63          	bgez	a2,80005d80 <__printf+0x278>
    80005d6c:	f9040713          	addi	a4,s0,-112
    80005d70:	00f70733          	add	a4,a4,a5
    80005d74:	02d00693          	li	a3,45
    80005d78:	fed70823          	sb	a3,-16(a4)
    80005d7c:	00078c93          	mv	s9,a5
    80005d80:	f8040793          	addi	a5,s0,-128
    80005d84:	01978cb3          	add	s9,a5,s9
    80005d88:	f7f40d13          	addi	s10,s0,-129
    80005d8c:	000cc503          	lbu	a0,0(s9)
    80005d90:	fffc8c93          	addi	s9,s9,-1
    80005d94:	00000097          	auipc	ra,0x0
    80005d98:	b90080e7          	jalr	-1136(ra) # 80005924 <consputc>
    80005d9c:	ffac98e3          	bne	s9,s10,80005d8c <__printf+0x284>
    80005da0:	00094503          	lbu	a0,0(s2)
    80005da4:	e00514e3          	bnez	a0,80005bac <__printf+0xa4>
    80005da8:	1a0c1663          	bnez	s8,80005f54 <__printf+0x44c>
    80005dac:	08813083          	ld	ra,136(sp)
    80005db0:	08013403          	ld	s0,128(sp)
    80005db4:	07813483          	ld	s1,120(sp)
    80005db8:	07013903          	ld	s2,112(sp)
    80005dbc:	06813983          	ld	s3,104(sp)
    80005dc0:	06013a03          	ld	s4,96(sp)
    80005dc4:	05813a83          	ld	s5,88(sp)
    80005dc8:	05013b03          	ld	s6,80(sp)
    80005dcc:	04813b83          	ld	s7,72(sp)
    80005dd0:	04013c03          	ld	s8,64(sp)
    80005dd4:	03813c83          	ld	s9,56(sp)
    80005dd8:	03013d03          	ld	s10,48(sp)
    80005ddc:	02813d83          	ld	s11,40(sp)
    80005de0:	0d010113          	addi	sp,sp,208
    80005de4:	00008067          	ret
    80005de8:	07300713          	li	a4,115
    80005dec:	1ce78a63          	beq	a5,a4,80005fc0 <__printf+0x4b8>
    80005df0:	07800713          	li	a4,120
    80005df4:	1ee79e63          	bne	a5,a4,80005ff0 <__printf+0x4e8>
    80005df8:	f7843783          	ld	a5,-136(s0)
    80005dfc:	0007a703          	lw	a4,0(a5)
    80005e00:	00878793          	addi	a5,a5,8
    80005e04:	f6f43c23          	sd	a5,-136(s0)
    80005e08:	28074263          	bltz	a4,8000608c <__printf+0x584>
    80005e0c:	00002d97          	auipc	s11,0x2
    80005e10:	7dcd8d93          	addi	s11,s11,2012 # 800085e8 <digits>
    80005e14:	00f77793          	andi	a5,a4,15
    80005e18:	00fd87b3          	add	a5,s11,a5
    80005e1c:	0007c683          	lbu	a3,0(a5)
    80005e20:	00f00613          	li	a2,15
    80005e24:	0007079b          	sext.w	a5,a4
    80005e28:	f8d40023          	sb	a3,-128(s0)
    80005e2c:	0047559b          	srliw	a1,a4,0x4
    80005e30:	0047569b          	srliw	a3,a4,0x4
    80005e34:	00000c93          	li	s9,0
    80005e38:	0ee65063          	bge	a2,a4,80005f18 <__printf+0x410>
    80005e3c:	00f6f693          	andi	a3,a3,15
    80005e40:	00dd86b3          	add	a3,s11,a3
    80005e44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005e48:	0087d79b          	srliw	a5,a5,0x8
    80005e4c:	00100c93          	li	s9,1
    80005e50:	f8d400a3          	sb	a3,-127(s0)
    80005e54:	0cb67263          	bgeu	a2,a1,80005f18 <__printf+0x410>
    80005e58:	00f7f693          	andi	a3,a5,15
    80005e5c:	00dd86b3          	add	a3,s11,a3
    80005e60:	0006c583          	lbu	a1,0(a3)
    80005e64:	00f00613          	li	a2,15
    80005e68:	0047d69b          	srliw	a3,a5,0x4
    80005e6c:	f8b40123          	sb	a1,-126(s0)
    80005e70:	0047d593          	srli	a1,a5,0x4
    80005e74:	28f67e63          	bgeu	a2,a5,80006110 <__printf+0x608>
    80005e78:	00f6f693          	andi	a3,a3,15
    80005e7c:	00dd86b3          	add	a3,s11,a3
    80005e80:	0006c503          	lbu	a0,0(a3)
    80005e84:	0087d813          	srli	a6,a5,0x8
    80005e88:	0087d69b          	srliw	a3,a5,0x8
    80005e8c:	f8a401a3          	sb	a0,-125(s0)
    80005e90:	28b67663          	bgeu	a2,a1,8000611c <__printf+0x614>
    80005e94:	00f6f693          	andi	a3,a3,15
    80005e98:	00dd86b3          	add	a3,s11,a3
    80005e9c:	0006c583          	lbu	a1,0(a3)
    80005ea0:	00c7d513          	srli	a0,a5,0xc
    80005ea4:	00c7d69b          	srliw	a3,a5,0xc
    80005ea8:	f8b40223          	sb	a1,-124(s0)
    80005eac:	29067a63          	bgeu	a2,a6,80006140 <__printf+0x638>
    80005eb0:	00f6f693          	andi	a3,a3,15
    80005eb4:	00dd86b3          	add	a3,s11,a3
    80005eb8:	0006c583          	lbu	a1,0(a3)
    80005ebc:	0107d813          	srli	a6,a5,0x10
    80005ec0:	0107d69b          	srliw	a3,a5,0x10
    80005ec4:	f8b402a3          	sb	a1,-123(s0)
    80005ec8:	28a67263          	bgeu	a2,a0,8000614c <__printf+0x644>
    80005ecc:	00f6f693          	andi	a3,a3,15
    80005ed0:	00dd86b3          	add	a3,s11,a3
    80005ed4:	0006c683          	lbu	a3,0(a3)
    80005ed8:	0147d79b          	srliw	a5,a5,0x14
    80005edc:	f8d40323          	sb	a3,-122(s0)
    80005ee0:	21067663          	bgeu	a2,a6,800060ec <__printf+0x5e4>
    80005ee4:	02079793          	slli	a5,a5,0x20
    80005ee8:	0207d793          	srli	a5,a5,0x20
    80005eec:	00fd8db3          	add	s11,s11,a5
    80005ef0:	000dc683          	lbu	a3,0(s11)
    80005ef4:	00800793          	li	a5,8
    80005ef8:	00700c93          	li	s9,7
    80005efc:	f8d403a3          	sb	a3,-121(s0)
    80005f00:	00075c63          	bgez	a4,80005f18 <__printf+0x410>
    80005f04:	f9040713          	addi	a4,s0,-112
    80005f08:	00f70733          	add	a4,a4,a5
    80005f0c:	02d00693          	li	a3,45
    80005f10:	fed70823          	sb	a3,-16(a4)
    80005f14:	00078c93          	mv	s9,a5
    80005f18:	f8040793          	addi	a5,s0,-128
    80005f1c:	01978cb3          	add	s9,a5,s9
    80005f20:	f7f40d13          	addi	s10,s0,-129
    80005f24:	000cc503          	lbu	a0,0(s9)
    80005f28:	fffc8c93          	addi	s9,s9,-1
    80005f2c:	00000097          	auipc	ra,0x0
    80005f30:	9f8080e7          	jalr	-1544(ra) # 80005924 <consputc>
    80005f34:	ff9d18e3          	bne	s10,s9,80005f24 <__printf+0x41c>
    80005f38:	0100006f          	j	80005f48 <__printf+0x440>
    80005f3c:	00000097          	auipc	ra,0x0
    80005f40:	9e8080e7          	jalr	-1560(ra) # 80005924 <consputc>
    80005f44:	000c8493          	mv	s1,s9
    80005f48:	00094503          	lbu	a0,0(s2)
    80005f4c:	c60510e3          	bnez	a0,80005bac <__printf+0xa4>
    80005f50:	e40c0ee3          	beqz	s8,80005dac <__printf+0x2a4>
    80005f54:	00005517          	auipc	a0,0x5
    80005f58:	2dc50513          	addi	a0,a0,732 # 8000b230 <pr>
    80005f5c:	00001097          	auipc	ra,0x1
    80005f60:	94c080e7          	jalr	-1716(ra) # 800068a8 <release>
    80005f64:	e49ff06f          	j	80005dac <__printf+0x2a4>
    80005f68:	f7843783          	ld	a5,-136(s0)
    80005f6c:	03000513          	li	a0,48
    80005f70:	01000d13          	li	s10,16
    80005f74:	00878713          	addi	a4,a5,8
    80005f78:	0007bc83          	ld	s9,0(a5)
    80005f7c:	f6e43c23          	sd	a4,-136(s0)
    80005f80:	00000097          	auipc	ra,0x0
    80005f84:	9a4080e7          	jalr	-1628(ra) # 80005924 <consputc>
    80005f88:	07800513          	li	a0,120
    80005f8c:	00000097          	auipc	ra,0x0
    80005f90:	998080e7          	jalr	-1640(ra) # 80005924 <consputc>
    80005f94:	00002d97          	auipc	s11,0x2
    80005f98:	654d8d93          	addi	s11,s11,1620 # 800085e8 <digits>
    80005f9c:	03ccd793          	srli	a5,s9,0x3c
    80005fa0:	00fd87b3          	add	a5,s11,a5
    80005fa4:	0007c503          	lbu	a0,0(a5)
    80005fa8:	fffd0d1b          	addiw	s10,s10,-1
    80005fac:	004c9c93          	slli	s9,s9,0x4
    80005fb0:	00000097          	auipc	ra,0x0
    80005fb4:	974080e7          	jalr	-1676(ra) # 80005924 <consputc>
    80005fb8:	fe0d12e3          	bnez	s10,80005f9c <__printf+0x494>
    80005fbc:	f8dff06f          	j	80005f48 <__printf+0x440>
    80005fc0:	f7843783          	ld	a5,-136(s0)
    80005fc4:	0007bc83          	ld	s9,0(a5)
    80005fc8:	00878793          	addi	a5,a5,8
    80005fcc:	f6f43c23          	sd	a5,-136(s0)
    80005fd0:	000c9a63          	bnez	s9,80005fe4 <__printf+0x4dc>
    80005fd4:	1080006f          	j	800060dc <__printf+0x5d4>
    80005fd8:	001c8c93          	addi	s9,s9,1
    80005fdc:	00000097          	auipc	ra,0x0
    80005fe0:	948080e7          	jalr	-1720(ra) # 80005924 <consputc>
    80005fe4:	000cc503          	lbu	a0,0(s9)
    80005fe8:	fe0518e3          	bnez	a0,80005fd8 <__printf+0x4d0>
    80005fec:	f5dff06f          	j	80005f48 <__printf+0x440>
    80005ff0:	02500513          	li	a0,37
    80005ff4:	00000097          	auipc	ra,0x0
    80005ff8:	930080e7          	jalr	-1744(ra) # 80005924 <consputc>
    80005ffc:	000c8513          	mv	a0,s9
    80006000:	00000097          	auipc	ra,0x0
    80006004:	924080e7          	jalr	-1756(ra) # 80005924 <consputc>
    80006008:	f41ff06f          	j	80005f48 <__printf+0x440>
    8000600c:	02500513          	li	a0,37
    80006010:	00000097          	auipc	ra,0x0
    80006014:	914080e7          	jalr	-1772(ra) # 80005924 <consputc>
    80006018:	f31ff06f          	j	80005f48 <__printf+0x440>
    8000601c:	00030513          	mv	a0,t1
    80006020:	00000097          	auipc	ra,0x0
    80006024:	7bc080e7          	jalr	1980(ra) # 800067dc <acquire>
    80006028:	b4dff06f          	j	80005b74 <__printf+0x6c>
    8000602c:	40c0053b          	negw	a0,a2
    80006030:	00a00713          	li	a4,10
    80006034:	02e576bb          	remuw	a3,a0,a4
    80006038:	00002d97          	auipc	s11,0x2
    8000603c:	5b0d8d93          	addi	s11,s11,1456 # 800085e8 <digits>
    80006040:	ff700593          	li	a1,-9
    80006044:	02069693          	slli	a3,a3,0x20
    80006048:	0206d693          	srli	a3,a3,0x20
    8000604c:	00dd86b3          	add	a3,s11,a3
    80006050:	0006c683          	lbu	a3,0(a3)
    80006054:	02e557bb          	divuw	a5,a0,a4
    80006058:	f8d40023          	sb	a3,-128(s0)
    8000605c:	10b65e63          	bge	a2,a1,80006178 <__printf+0x670>
    80006060:	06300593          	li	a1,99
    80006064:	02e7f6bb          	remuw	a3,a5,a4
    80006068:	02069693          	slli	a3,a3,0x20
    8000606c:	0206d693          	srli	a3,a3,0x20
    80006070:	00dd86b3          	add	a3,s11,a3
    80006074:	0006c683          	lbu	a3,0(a3)
    80006078:	02e7d73b          	divuw	a4,a5,a4
    8000607c:	00200793          	li	a5,2
    80006080:	f8d400a3          	sb	a3,-127(s0)
    80006084:	bca5ece3          	bltu	a1,a0,80005c5c <__printf+0x154>
    80006088:	ce5ff06f          	j	80005d6c <__printf+0x264>
    8000608c:	40e007bb          	negw	a5,a4
    80006090:	00002d97          	auipc	s11,0x2
    80006094:	558d8d93          	addi	s11,s11,1368 # 800085e8 <digits>
    80006098:	00f7f693          	andi	a3,a5,15
    8000609c:	00dd86b3          	add	a3,s11,a3
    800060a0:	0006c583          	lbu	a1,0(a3)
    800060a4:	ff100613          	li	a2,-15
    800060a8:	0047d69b          	srliw	a3,a5,0x4
    800060ac:	f8b40023          	sb	a1,-128(s0)
    800060b0:	0047d59b          	srliw	a1,a5,0x4
    800060b4:	0ac75e63          	bge	a4,a2,80006170 <__printf+0x668>
    800060b8:	00f6f693          	andi	a3,a3,15
    800060bc:	00dd86b3          	add	a3,s11,a3
    800060c0:	0006c603          	lbu	a2,0(a3)
    800060c4:	00f00693          	li	a3,15
    800060c8:	0087d79b          	srliw	a5,a5,0x8
    800060cc:	f8c400a3          	sb	a2,-127(s0)
    800060d0:	d8b6e4e3          	bltu	a3,a1,80005e58 <__printf+0x350>
    800060d4:	00200793          	li	a5,2
    800060d8:	e2dff06f          	j	80005f04 <__printf+0x3fc>
    800060dc:	00002c97          	auipc	s9,0x2
    800060e0:	4ecc8c93          	addi	s9,s9,1260 # 800085c8 <_ZTV14PeriodicWorker+0x228>
    800060e4:	02800513          	li	a0,40
    800060e8:	ef1ff06f          	j	80005fd8 <__printf+0x4d0>
    800060ec:	00700793          	li	a5,7
    800060f0:	00600c93          	li	s9,6
    800060f4:	e0dff06f          	j	80005f00 <__printf+0x3f8>
    800060f8:	00700793          	li	a5,7
    800060fc:	00600c93          	li	s9,6
    80006100:	c69ff06f          	j	80005d68 <__printf+0x260>
    80006104:	00300793          	li	a5,3
    80006108:	00200c93          	li	s9,2
    8000610c:	c5dff06f          	j	80005d68 <__printf+0x260>
    80006110:	00300793          	li	a5,3
    80006114:	00200c93          	li	s9,2
    80006118:	de9ff06f          	j	80005f00 <__printf+0x3f8>
    8000611c:	00400793          	li	a5,4
    80006120:	00300c93          	li	s9,3
    80006124:	dddff06f          	j	80005f00 <__printf+0x3f8>
    80006128:	00400793          	li	a5,4
    8000612c:	00300c93          	li	s9,3
    80006130:	c39ff06f          	j	80005d68 <__printf+0x260>
    80006134:	00500793          	li	a5,5
    80006138:	00400c93          	li	s9,4
    8000613c:	c2dff06f          	j	80005d68 <__printf+0x260>
    80006140:	00500793          	li	a5,5
    80006144:	00400c93          	li	s9,4
    80006148:	db9ff06f          	j	80005f00 <__printf+0x3f8>
    8000614c:	00600793          	li	a5,6
    80006150:	00500c93          	li	s9,5
    80006154:	dadff06f          	j	80005f00 <__printf+0x3f8>
    80006158:	00600793          	li	a5,6
    8000615c:	00500c93          	li	s9,5
    80006160:	c09ff06f          	j	80005d68 <__printf+0x260>
    80006164:	00800793          	li	a5,8
    80006168:	00700c93          	li	s9,7
    8000616c:	bfdff06f          	j	80005d68 <__printf+0x260>
    80006170:	00100793          	li	a5,1
    80006174:	d91ff06f          	j	80005f04 <__printf+0x3fc>
    80006178:	00100793          	li	a5,1
    8000617c:	bf1ff06f          	j	80005d6c <__printf+0x264>
    80006180:	00900793          	li	a5,9
    80006184:	00800c93          	li	s9,8
    80006188:	be1ff06f          	j	80005d68 <__printf+0x260>
    8000618c:	00002517          	auipc	a0,0x2
    80006190:	44450513          	addi	a0,a0,1092 # 800085d0 <_ZTV14PeriodicWorker+0x230>
    80006194:	00000097          	auipc	ra,0x0
    80006198:	918080e7          	jalr	-1768(ra) # 80005aac <panic>

000000008000619c <printfinit>:
    8000619c:	fe010113          	addi	sp,sp,-32
    800061a0:	00813823          	sd	s0,16(sp)
    800061a4:	00913423          	sd	s1,8(sp)
    800061a8:	00113c23          	sd	ra,24(sp)
    800061ac:	02010413          	addi	s0,sp,32
    800061b0:	00005497          	auipc	s1,0x5
    800061b4:	08048493          	addi	s1,s1,128 # 8000b230 <pr>
    800061b8:	00048513          	mv	a0,s1
    800061bc:	00002597          	auipc	a1,0x2
    800061c0:	42458593          	addi	a1,a1,1060 # 800085e0 <_ZTV14PeriodicWorker+0x240>
    800061c4:	00000097          	auipc	ra,0x0
    800061c8:	5f4080e7          	jalr	1524(ra) # 800067b8 <initlock>
    800061cc:	01813083          	ld	ra,24(sp)
    800061d0:	01013403          	ld	s0,16(sp)
    800061d4:	0004ac23          	sw	zero,24(s1)
    800061d8:	00813483          	ld	s1,8(sp)
    800061dc:	02010113          	addi	sp,sp,32
    800061e0:	00008067          	ret

00000000800061e4 <uartinit>:
    800061e4:	ff010113          	addi	sp,sp,-16
    800061e8:	00813423          	sd	s0,8(sp)
    800061ec:	01010413          	addi	s0,sp,16
    800061f0:	100007b7          	lui	a5,0x10000
    800061f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800061f8:	f8000713          	li	a4,-128
    800061fc:	00e781a3          	sb	a4,3(a5)
    80006200:	00300713          	li	a4,3
    80006204:	00e78023          	sb	a4,0(a5)
    80006208:	000780a3          	sb	zero,1(a5)
    8000620c:	00e781a3          	sb	a4,3(a5)
    80006210:	00700693          	li	a3,7
    80006214:	00d78123          	sb	a3,2(a5)
    80006218:	00e780a3          	sb	a4,1(a5)
    8000621c:	00813403          	ld	s0,8(sp)
    80006220:	01010113          	addi	sp,sp,16
    80006224:	00008067          	ret

0000000080006228 <uartputc>:
    80006228:	00004797          	auipc	a5,0x4
    8000622c:	d687a783          	lw	a5,-664(a5) # 80009f90 <panicked>
    80006230:	00078463          	beqz	a5,80006238 <uartputc+0x10>
    80006234:	0000006f          	j	80006234 <uartputc+0xc>
    80006238:	fd010113          	addi	sp,sp,-48
    8000623c:	02813023          	sd	s0,32(sp)
    80006240:	00913c23          	sd	s1,24(sp)
    80006244:	01213823          	sd	s2,16(sp)
    80006248:	01313423          	sd	s3,8(sp)
    8000624c:	02113423          	sd	ra,40(sp)
    80006250:	03010413          	addi	s0,sp,48
    80006254:	00004917          	auipc	s2,0x4
    80006258:	d4490913          	addi	s2,s2,-700 # 80009f98 <uart_tx_r>
    8000625c:	00093783          	ld	a5,0(s2)
    80006260:	00004497          	auipc	s1,0x4
    80006264:	d4048493          	addi	s1,s1,-704 # 80009fa0 <uart_tx_w>
    80006268:	0004b703          	ld	a4,0(s1)
    8000626c:	02078693          	addi	a3,a5,32
    80006270:	00050993          	mv	s3,a0
    80006274:	02e69c63          	bne	a3,a4,800062ac <uartputc+0x84>
    80006278:	00001097          	auipc	ra,0x1
    8000627c:	834080e7          	jalr	-1996(ra) # 80006aac <push_on>
    80006280:	00093783          	ld	a5,0(s2)
    80006284:	0004b703          	ld	a4,0(s1)
    80006288:	02078793          	addi	a5,a5,32
    8000628c:	00e79463          	bne	a5,a4,80006294 <uartputc+0x6c>
    80006290:	0000006f          	j	80006290 <uartputc+0x68>
    80006294:	00001097          	auipc	ra,0x1
    80006298:	88c080e7          	jalr	-1908(ra) # 80006b20 <pop_on>
    8000629c:	00093783          	ld	a5,0(s2)
    800062a0:	0004b703          	ld	a4,0(s1)
    800062a4:	02078693          	addi	a3,a5,32
    800062a8:	fce688e3          	beq	a3,a4,80006278 <uartputc+0x50>
    800062ac:	01f77693          	andi	a3,a4,31
    800062b0:	00005597          	auipc	a1,0x5
    800062b4:	fa058593          	addi	a1,a1,-96 # 8000b250 <uart_tx_buf>
    800062b8:	00d586b3          	add	a3,a1,a3
    800062bc:	00170713          	addi	a4,a4,1
    800062c0:	01368023          	sb	s3,0(a3)
    800062c4:	00e4b023          	sd	a4,0(s1)
    800062c8:	10000637          	lui	a2,0x10000
    800062cc:	02f71063          	bne	a4,a5,800062ec <uartputc+0xc4>
    800062d0:	0340006f          	j	80006304 <uartputc+0xdc>
    800062d4:	00074703          	lbu	a4,0(a4)
    800062d8:	00f93023          	sd	a5,0(s2)
    800062dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800062e0:	00093783          	ld	a5,0(s2)
    800062e4:	0004b703          	ld	a4,0(s1)
    800062e8:	00f70e63          	beq	a4,a5,80006304 <uartputc+0xdc>
    800062ec:	00564683          	lbu	a3,5(a2)
    800062f0:	01f7f713          	andi	a4,a5,31
    800062f4:	00e58733          	add	a4,a1,a4
    800062f8:	0206f693          	andi	a3,a3,32
    800062fc:	00178793          	addi	a5,a5,1
    80006300:	fc069ae3          	bnez	a3,800062d4 <uartputc+0xac>
    80006304:	02813083          	ld	ra,40(sp)
    80006308:	02013403          	ld	s0,32(sp)
    8000630c:	01813483          	ld	s1,24(sp)
    80006310:	01013903          	ld	s2,16(sp)
    80006314:	00813983          	ld	s3,8(sp)
    80006318:	03010113          	addi	sp,sp,48
    8000631c:	00008067          	ret

0000000080006320 <uartputc_sync>:
    80006320:	ff010113          	addi	sp,sp,-16
    80006324:	00813423          	sd	s0,8(sp)
    80006328:	01010413          	addi	s0,sp,16
    8000632c:	00004717          	auipc	a4,0x4
    80006330:	c6472703          	lw	a4,-924(a4) # 80009f90 <panicked>
    80006334:	02071663          	bnez	a4,80006360 <uartputc_sync+0x40>
    80006338:	00050793          	mv	a5,a0
    8000633c:	100006b7          	lui	a3,0x10000
    80006340:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006344:	02077713          	andi	a4,a4,32
    80006348:	fe070ce3          	beqz	a4,80006340 <uartputc_sync+0x20>
    8000634c:	0ff7f793          	andi	a5,a5,255
    80006350:	00f68023          	sb	a5,0(a3)
    80006354:	00813403          	ld	s0,8(sp)
    80006358:	01010113          	addi	sp,sp,16
    8000635c:	00008067          	ret
    80006360:	0000006f          	j	80006360 <uartputc_sync+0x40>

0000000080006364 <uartstart>:
    80006364:	ff010113          	addi	sp,sp,-16
    80006368:	00813423          	sd	s0,8(sp)
    8000636c:	01010413          	addi	s0,sp,16
    80006370:	00004617          	auipc	a2,0x4
    80006374:	c2860613          	addi	a2,a2,-984 # 80009f98 <uart_tx_r>
    80006378:	00004517          	auipc	a0,0x4
    8000637c:	c2850513          	addi	a0,a0,-984 # 80009fa0 <uart_tx_w>
    80006380:	00063783          	ld	a5,0(a2)
    80006384:	00053703          	ld	a4,0(a0)
    80006388:	04f70263          	beq	a4,a5,800063cc <uartstart+0x68>
    8000638c:	100005b7          	lui	a1,0x10000
    80006390:	00005817          	auipc	a6,0x5
    80006394:	ec080813          	addi	a6,a6,-320 # 8000b250 <uart_tx_buf>
    80006398:	01c0006f          	j	800063b4 <uartstart+0x50>
    8000639c:	0006c703          	lbu	a4,0(a3)
    800063a0:	00f63023          	sd	a5,0(a2)
    800063a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800063a8:	00063783          	ld	a5,0(a2)
    800063ac:	00053703          	ld	a4,0(a0)
    800063b0:	00f70e63          	beq	a4,a5,800063cc <uartstart+0x68>
    800063b4:	01f7f713          	andi	a4,a5,31
    800063b8:	00e806b3          	add	a3,a6,a4
    800063bc:	0055c703          	lbu	a4,5(a1)
    800063c0:	00178793          	addi	a5,a5,1
    800063c4:	02077713          	andi	a4,a4,32
    800063c8:	fc071ae3          	bnez	a4,8000639c <uartstart+0x38>
    800063cc:	00813403          	ld	s0,8(sp)
    800063d0:	01010113          	addi	sp,sp,16
    800063d4:	00008067          	ret

00000000800063d8 <uartgetc>:
    800063d8:	ff010113          	addi	sp,sp,-16
    800063dc:	00813423          	sd	s0,8(sp)
    800063e0:	01010413          	addi	s0,sp,16
    800063e4:	10000737          	lui	a4,0x10000
    800063e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800063ec:	0017f793          	andi	a5,a5,1
    800063f0:	00078c63          	beqz	a5,80006408 <uartgetc+0x30>
    800063f4:	00074503          	lbu	a0,0(a4)
    800063f8:	0ff57513          	andi	a0,a0,255
    800063fc:	00813403          	ld	s0,8(sp)
    80006400:	01010113          	addi	sp,sp,16
    80006404:	00008067          	ret
    80006408:	fff00513          	li	a0,-1
    8000640c:	ff1ff06f          	j	800063fc <uartgetc+0x24>

0000000080006410 <uartintr>:
    80006410:	100007b7          	lui	a5,0x10000
    80006414:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006418:	0017f793          	andi	a5,a5,1
    8000641c:	0a078463          	beqz	a5,800064c4 <uartintr+0xb4>
    80006420:	fe010113          	addi	sp,sp,-32
    80006424:	00813823          	sd	s0,16(sp)
    80006428:	00913423          	sd	s1,8(sp)
    8000642c:	00113c23          	sd	ra,24(sp)
    80006430:	02010413          	addi	s0,sp,32
    80006434:	100004b7          	lui	s1,0x10000
    80006438:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000643c:	0ff57513          	andi	a0,a0,255
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	534080e7          	jalr	1332(ra) # 80005974 <consoleintr>
    80006448:	0054c783          	lbu	a5,5(s1)
    8000644c:	0017f793          	andi	a5,a5,1
    80006450:	fe0794e3          	bnez	a5,80006438 <uartintr+0x28>
    80006454:	00004617          	auipc	a2,0x4
    80006458:	b4460613          	addi	a2,a2,-1212 # 80009f98 <uart_tx_r>
    8000645c:	00004517          	auipc	a0,0x4
    80006460:	b4450513          	addi	a0,a0,-1212 # 80009fa0 <uart_tx_w>
    80006464:	00063783          	ld	a5,0(a2)
    80006468:	00053703          	ld	a4,0(a0)
    8000646c:	04f70263          	beq	a4,a5,800064b0 <uartintr+0xa0>
    80006470:	100005b7          	lui	a1,0x10000
    80006474:	00005817          	auipc	a6,0x5
    80006478:	ddc80813          	addi	a6,a6,-548 # 8000b250 <uart_tx_buf>
    8000647c:	01c0006f          	j	80006498 <uartintr+0x88>
    80006480:	0006c703          	lbu	a4,0(a3)
    80006484:	00f63023          	sd	a5,0(a2)
    80006488:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000648c:	00063783          	ld	a5,0(a2)
    80006490:	00053703          	ld	a4,0(a0)
    80006494:	00f70e63          	beq	a4,a5,800064b0 <uartintr+0xa0>
    80006498:	01f7f713          	andi	a4,a5,31
    8000649c:	00e806b3          	add	a3,a6,a4
    800064a0:	0055c703          	lbu	a4,5(a1)
    800064a4:	00178793          	addi	a5,a5,1
    800064a8:	02077713          	andi	a4,a4,32
    800064ac:	fc071ae3          	bnez	a4,80006480 <uartintr+0x70>
    800064b0:	01813083          	ld	ra,24(sp)
    800064b4:	01013403          	ld	s0,16(sp)
    800064b8:	00813483          	ld	s1,8(sp)
    800064bc:	02010113          	addi	sp,sp,32
    800064c0:	00008067          	ret
    800064c4:	00004617          	auipc	a2,0x4
    800064c8:	ad460613          	addi	a2,a2,-1324 # 80009f98 <uart_tx_r>
    800064cc:	00004517          	auipc	a0,0x4
    800064d0:	ad450513          	addi	a0,a0,-1324 # 80009fa0 <uart_tx_w>
    800064d4:	00063783          	ld	a5,0(a2)
    800064d8:	00053703          	ld	a4,0(a0)
    800064dc:	04f70263          	beq	a4,a5,80006520 <uartintr+0x110>
    800064e0:	100005b7          	lui	a1,0x10000
    800064e4:	00005817          	auipc	a6,0x5
    800064e8:	d6c80813          	addi	a6,a6,-660 # 8000b250 <uart_tx_buf>
    800064ec:	01c0006f          	j	80006508 <uartintr+0xf8>
    800064f0:	0006c703          	lbu	a4,0(a3)
    800064f4:	00f63023          	sd	a5,0(a2)
    800064f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800064fc:	00063783          	ld	a5,0(a2)
    80006500:	00053703          	ld	a4,0(a0)
    80006504:	02f70063          	beq	a4,a5,80006524 <uartintr+0x114>
    80006508:	01f7f713          	andi	a4,a5,31
    8000650c:	00e806b3          	add	a3,a6,a4
    80006510:	0055c703          	lbu	a4,5(a1)
    80006514:	00178793          	addi	a5,a5,1
    80006518:	02077713          	andi	a4,a4,32
    8000651c:	fc071ae3          	bnez	a4,800064f0 <uartintr+0xe0>
    80006520:	00008067          	ret
    80006524:	00008067          	ret

0000000080006528 <kinit>:
    80006528:	fc010113          	addi	sp,sp,-64
    8000652c:	02913423          	sd	s1,40(sp)
    80006530:	fffff7b7          	lui	a5,0xfffff
    80006534:	00006497          	auipc	s1,0x6
    80006538:	d3b48493          	addi	s1,s1,-709 # 8000c26f <end+0xfff>
    8000653c:	02813823          	sd	s0,48(sp)
    80006540:	01313c23          	sd	s3,24(sp)
    80006544:	00f4f4b3          	and	s1,s1,a5
    80006548:	02113c23          	sd	ra,56(sp)
    8000654c:	03213023          	sd	s2,32(sp)
    80006550:	01413823          	sd	s4,16(sp)
    80006554:	01513423          	sd	s5,8(sp)
    80006558:	04010413          	addi	s0,sp,64
    8000655c:	000017b7          	lui	a5,0x1
    80006560:	01100993          	li	s3,17
    80006564:	00f487b3          	add	a5,s1,a5
    80006568:	01b99993          	slli	s3,s3,0x1b
    8000656c:	06f9e063          	bltu	s3,a5,800065cc <kinit+0xa4>
    80006570:	00005a97          	auipc	s5,0x5
    80006574:	d00a8a93          	addi	s5,s5,-768 # 8000b270 <end>
    80006578:	0754ec63          	bltu	s1,s5,800065f0 <kinit+0xc8>
    8000657c:	0734fa63          	bgeu	s1,s3,800065f0 <kinit+0xc8>
    80006580:	00088a37          	lui	s4,0x88
    80006584:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006588:	00004917          	auipc	s2,0x4
    8000658c:	a2090913          	addi	s2,s2,-1504 # 80009fa8 <kmem>
    80006590:	00ca1a13          	slli	s4,s4,0xc
    80006594:	0140006f          	j	800065a8 <kinit+0x80>
    80006598:	000017b7          	lui	a5,0x1
    8000659c:	00f484b3          	add	s1,s1,a5
    800065a0:	0554e863          	bltu	s1,s5,800065f0 <kinit+0xc8>
    800065a4:	0534f663          	bgeu	s1,s3,800065f0 <kinit+0xc8>
    800065a8:	00001637          	lui	a2,0x1
    800065ac:	00100593          	li	a1,1
    800065b0:	00048513          	mv	a0,s1
    800065b4:	00000097          	auipc	ra,0x0
    800065b8:	5e4080e7          	jalr	1508(ra) # 80006b98 <__memset>
    800065bc:	00093783          	ld	a5,0(s2)
    800065c0:	00f4b023          	sd	a5,0(s1)
    800065c4:	00993023          	sd	s1,0(s2)
    800065c8:	fd4498e3          	bne	s1,s4,80006598 <kinit+0x70>
    800065cc:	03813083          	ld	ra,56(sp)
    800065d0:	03013403          	ld	s0,48(sp)
    800065d4:	02813483          	ld	s1,40(sp)
    800065d8:	02013903          	ld	s2,32(sp)
    800065dc:	01813983          	ld	s3,24(sp)
    800065e0:	01013a03          	ld	s4,16(sp)
    800065e4:	00813a83          	ld	s5,8(sp)
    800065e8:	04010113          	addi	sp,sp,64
    800065ec:	00008067          	ret
    800065f0:	00002517          	auipc	a0,0x2
    800065f4:	01050513          	addi	a0,a0,16 # 80008600 <digits+0x18>
    800065f8:	fffff097          	auipc	ra,0xfffff
    800065fc:	4b4080e7          	jalr	1204(ra) # 80005aac <panic>

0000000080006600 <freerange>:
    80006600:	fc010113          	addi	sp,sp,-64
    80006604:	000017b7          	lui	a5,0x1
    80006608:	02913423          	sd	s1,40(sp)
    8000660c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006610:	009504b3          	add	s1,a0,s1
    80006614:	fffff537          	lui	a0,0xfffff
    80006618:	02813823          	sd	s0,48(sp)
    8000661c:	02113c23          	sd	ra,56(sp)
    80006620:	03213023          	sd	s2,32(sp)
    80006624:	01313c23          	sd	s3,24(sp)
    80006628:	01413823          	sd	s4,16(sp)
    8000662c:	01513423          	sd	s5,8(sp)
    80006630:	01613023          	sd	s6,0(sp)
    80006634:	04010413          	addi	s0,sp,64
    80006638:	00a4f4b3          	and	s1,s1,a0
    8000663c:	00f487b3          	add	a5,s1,a5
    80006640:	06f5e463          	bltu	a1,a5,800066a8 <freerange+0xa8>
    80006644:	00005a97          	auipc	s5,0x5
    80006648:	c2ca8a93          	addi	s5,s5,-980 # 8000b270 <end>
    8000664c:	0954e263          	bltu	s1,s5,800066d0 <freerange+0xd0>
    80006650:	01100993          	li	s3,17
    80006654:	01b99993          	slli	s3,s3,0x1b
    80006658:	0734fc63          	bgeu	s1,s3,800066d0 <freerange+0xd0>
    8000665c:	00058a13          	mv	s4,a1
    80006660:	00004917          	auipc	s2,0x4
    80006664:	94890913          	addi	s2,s2,-1720 # 80009fa8 <kmem>
    80006668:	00002b37          	lui	s6,0x2
    8000666c:	0140006f          	j	80006680 <freerange+0x80>
    80006670:	000017b7          	lui	a5,0x1
    80006674:	00f484b3          	add	s1,s1,a5
    80006678:	0554ec63          	bltu	s1,s5,800066d0 <freerange+0xd0>
    8000667c:	0534fa63          	bgeu	s1,s3,800066d0 <freerange+0xd0>
    80006680:	00001637          	lui	a2,0x1
    80006684:	00100593          	li	a1,1
    80006688:	00048513          	mv	a0,s1
    8000668c:	00000097          	auipc	ra,0x0
    80006690:	50c080e7          	jalr	1292(ra) # 80006b98 <__memset>
    80006694:	00093703          	ld	a4,0(s2)
    80006698:	016487b3          	add	a5,s1,s6
    8000669c:	00e4b023          	sd	a4,0(s1)
    800066a0:	00993023          	sd	s1,0(s2)
    800066a4:	fcfa76e3          	bgeu	s4,a5,80006670 <freerange+0x70>
    800066a8:	03813083          	ld	ra,56(sp)
    800066ac:	03013403          	ld	s0,48(sp)
    800066b0:	02813483          	ld	s1,40(sp)
    800066b4:	02013903          	ld	s2,32(sp)
    800066b8:	01813983          	ld	s3,24(sp)
    800066bc:	01013a03          	ld	s4,16(sp)
    800066c0:	00813a83          	ld	s5,8(sp)
    800066c4:	00013b03          	ld	s6,0(sp)
    800066c8:	04010113          	addi	sp,sp,64
    800066cc:	00008067          	ret
    800066d0:	00002517          	auipc	a0,0x2
    800066d4:	f3050513          	addi	a0,a0,-208 # 80008600 <digits+0x18>
    800066d8:	fffff097          	auipc	ra,0xfffff
    800066dc:	3d4080e7          	jalr	980(ra) # 80005aac <panic>

00000000800066e0 <kfree>:
    800066e0:	fe010113          	addi	sp,sp,-32
    800066e4:	00813823          	sd	s0,16(sp)
    800066e8:	00113c23          	sd	ra,24(sp)
    800066ec:	00913423          	sd	s1,8(sp)
    800066f0:	02010413          	addi	s0,sp,32
    800066f4:	03451793          	slli	a5,a0,0x34
    800066f8:	04079c63          	bnez	a5,80006750 <kfree+0x70>
    800066fc:	00005797          	auipc	a5,0x5
    80006700:	b7478793          	addi	a5,a5,-1164 # 8000b270 <end>
    80006704:	00050493          	mv	s1,a0
    80006708:	04f56463          	bltu	a0,a5,80006750 <kfree+0x70>
    8000670c:	01100793          	li	a5,17
    80006710:	01b79793          	slli	a5,a5,0x1b
    80006714:	02f57e63          	bgeu	a0,a5,80006750 <kfree+0x70>
    80006718:	00001637          	lui	a2,0x1
    8000671c:	00100593          	li	a1,1
    80006720:	00000097          	auipc	ra,0x0
    80006724:	478080e7          	jalr	1144(ra) # 80006b98 <__memset>
    80006728:	00004797          	auipc	a5,0x4
    8000672c:	88078793          	addi	a5,a5,-1920 # 80009fa8 <kmem>
    80006730:	0007b703          	ld	a4,0(a5)
    80006734:	01813083          	ld	ra,24(sp)
    80006738:	01013403          	ld	s0,16(sp)
    8000673c:	00e4b023          	sd	a4,0(s1)
    80006740:	0097b023          	sd	s1,0(a5)
    80006744:	00813483          	ld	s1,8(sp)
    80006748:	02010113          	addi	sp,sp,32
    8000674c:	00008067          	ret
    80006750:	00002517          	auipc	a0,0x2
    80006754:	eb050513          	addi	a0,a0,-336 # 80008600 <digits+0x18>
    80006758:	fffff097          	auipc	ra,0xfffff
    8000675c:	354080e7          	jalr	852(ra) # 80005aac <panic>

0000000080006760 <kalloc>:
    80006760:	fe010113          	addi	sp,sp,-32
    80006764:	00813823          	sd	s0,16(sp)
    80006768:	00913423          	sd	s1,8(sp)
    8000676c:	00113c23          	sd	ra,24(sp)
    80006770:	02010413          	addi	s0,sp,32
    80006774:	00004797          	auipc	a5,0x4
    80006778:	83478793          	addi	a5,a5,-1996 # 80009fa8 <kmem>
    8000677c:	0007b483          	ld	s1,0(a5)
    80006780:	02048063          	beqz	s1,800067a0 <kalloc+0x40>
    80006784:	0004b703          	ld	a4,0(s1)
    80006788:	00001637          	lui	a2,0x1
    8000678c:	00500593          	li	a1,5
    80006790:	00048513          	mv	a0,s1
    80006794:	00e7b023          	sd	a4,0(a5)
    80006798:	00000097          	auipc	ra,0x0
    8000679c:	400080e7          	jalr	1024(ra) # 80006b98 <__memset>
    800067a0:	01813083          	ld	ra,24(sp)
    800067a4:	01013403          	ld	s0,16(sp)
    800067a8:	00048513          	mv	a0,s1
    800067ac:	00813483          	ld	s1,8(sp)
    800067b0:	02010113          	addi	sp,sp,32
    800067b4:	00008067          	ret

00000000800067b8 <initlock>:
    800067b8:	ff010113          	addi	sp,sp,-16
    800067bc:	00813423          	sd	s0,8(sp)
    800067c0:	01010413          	addi	s0,sp,16
    800067c4:	00813403          	ld	s0,8(sp)
    800067c8:	00b53423          	sd	a1,8(a0)
    800067cc:	00052023          	sw	zero,0(a0)
    800067d0:	00053823          	sd	zero,16(a0)
    800067d4:	01010113          	addi	sp,sp,16
    800067d8:	00008067          	ret

00000000800067dc <acquire>:
    800067dc:	fe010113          	addi	sp,sp,-32
    800067e0:	00813823          	sd	s0,16(sp)
    800067e4:	00913423          	sd	s1,8(sp)
    800067e8:	00113c23          	sd	ra,24(sp)
    800067ec:	01213023          	sd	s2,0(sp)
    800067f0:	02010413          	addi	s0,sp,32
    800067f4:	00050493          	mv	s1,a0
    800067f8:	10002973          	csrr	s2,sstatus
    800067fc:	100027f3          	csrr	a5,sstatus
    80006800:	ffd7f793          	andi	a5,a5,-3
    80006804:	10079073          	csrw	sstatus,a5
    80006808:	fffff097          	auipc	ra,0xfffff
    8000680c:	8e0080e7          	jalr	-1824(ra) # 800050e8 <mycpu>
    80006810:	07852783          	lw	a5,120(a0)
    80006814:	06078e63          	beqz	a5,80006890 <acquire+0xb4>
    80006818:	fffff097          	auipc	ra,0xfffff
    8000681c:	8d0080e7          	jalr	-1840(ra) # 800050e8 <mycpu>
    80006820:	07852783          	lw	a5,120(a0)
    80006824:	0004a703          	lw	a4,0(s1)
    80006828:	0017879b          	addiw	a5,a5,1
    8000682c:	06f52c23          	sw	a5,120(a0)
    80006830:	04071063          	bnez	a4,80006870 <acquire+0x94>
    80006834:	00100713          	li	a4,1
    80006838:	00070793          	mv	a5,a4
    8000683c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006840:	0007879b          	sext.w	a5,a5
    80006844:	fe079ae3          	bnez	a5,80006838 <acquire+0x5c>
    80006848:	0ff0000f          	fence
    8000684c:	fffff097          	auipc	ra,0xfffff
    80006850:	89c080e7          	jalr	-1892(ra) # 800050e8 <mycpu>
    80006854:	01813083          	ld	ra,24(sp)
    80006858:	01013403          	ld	s0,16(sp)
    8000685c:	00a4b823          	sd	a0,16(s1)
    80006860:	00013903          	ld	s2,0(sp)
    80006864:	00813483          	ld	s1,8(sp)
    80006868:	02010113          	addi	sp,sp,32
    8000686c:	00008067          	ret
    80006870:	0104b903          	ld	s2,16(s1)
    80006874:	fffff097          	auipc	ra,0xfffff
    80006878:	874080e7          	jalr	-1932(ra) # 800050e8 <mycpu>
    8000687c:	faa91ce3          	bne	s2,a0,80006834 <acquire+0x58>
    80006880:	00002517          	auipc	a0,0x2
    80006884:	d8850513          	addi	a0,a0,-632 # 80008608 <digits+0x20>
    80006888:	fffff097          	auipc	ra,0xfffff
    8000688c:	224080e7          	jalr	548(ra) # 80005aac <panic>
    80006890:	00195913          	srli	s2,s2,0x1
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	854080e7          	jalr	-1964(ra) # 800050e8 <mycpu>
    8000689c:	00197913          	andi	s2,s2,1
    800068a0:	07252e23          	sw	s2,124(a0)
    800068a4:	f75ff06f          	j	80006818 <acquire+0x3c>

00000000800068a8 <release>:
    800068a8:	fe010113          	addi	sp,sp,-32
    800068ac:	00813823          	sd	s0,16(sp)
    800068b0:	00113c23          	sd	ra,24(sp)
    800068b4:	00913423          	sd	s1,8(sp)
    800068b8:	01213023          	sd	s2,0(sp)
    800068bc:	02010413          	addi	s0,sp,32
    800068c0:	00052783          	lw	a5,0(a0)
    800068c4:	00079a63          	bnez	a5,800068d8 <release+0x30>
    800068c8:	00002517          	auipc	a0,0x2
    800068cc:	d4850513          	addi	a0,a0,-696 # 80008610 <digits+0x28>
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	1dc080e7          	jalr	476(ra) # 80005aac <panic>
    800068d8:	01053903          	ld	s2,16(a0)
    800068dc:	00050493          	mv	s1,a0
    800068e0:	fffff097          	auipc	ra,0xfffff
    800068e4:	808080e7          	jalr	-2040(ra) # 800050e8 <mycpu>
    800068e8:	fea910e3          	bne	s2,a0,800068c8 <release+0x20>
    800068ec:	0004b823          	sd	zero,16(s1)
    800068f0:	0ff0000f          	fence
    800068f4:	0f50000f          	fence	iorw,ow
    800068f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800068fc:	ffffe097          	auipc	ra,0xffffe
    80006900:	7ec080e7          	jalr	2028(ra) # 800050e8 <mycpu>
    80006904:	100027f3          	csrr	a5,sstatus
    80006908:	0027f793          	andi	a5,a5,2
    8000690c:	04079a63          	bnez	a5,80006960 <release+0xb8>
    80006910:	07852783          	lw	a5,120(a0)
    80006914:	02f05e63          	blez	a5,80006950 <release+0xa8>
    80006918:	fff7871b          	addiw	a4,a5,-1
    8000691c:	06e52c23          	sw	a4,120(a0)
    80006920:	00071c63          	bnez	a4,80006938 <release+0x90>
    80006924:	07c52783          	lw	a5,124(a0)
    80006928:	00078863          	beqz	a5,80006938 <release+0x90>
    8000692c:	100027f3          	csrr	a5,sstatus
    80006930:	0027e793          	ori	a5,a5,2
    80006934:	10079073          	csrw	sstatus,a5
    80006938:	01813083          	ld	ra,24(sp)
    8000693c:	01013403          	ld	s0,16(sp)
    80006940:	00813483          	ld	s1,8(sp)
    80006944:	00013903          	ld	s2,0(sp)
    80006948:	02010113          	addi	sp,sp,32
    8000694c:	00008067          	ret
    80006950:	00002517          	auipc	a0,0x2
    80006954:	ce050513          	addi	a0,a0,-800 # 80008630 <digits+0x48>
    80006958:	fffff097          	auipc	ra,0xfffff
    8000695c:	154080e7          	jalr	340(ra) # 80005aac <panic>
    80006960:	00002517          	auipc	a0,0x2
    80006964:	cb850513          	addi	a0,a0,-840 # 80008618 <digits+0x30>
    80006968:	fffff097          	auipc	ra,0xfffff
    8000696c:	144080e7          	jalr	324(ra) # 80005aac <panic>

0000000080006970 <holding>:
    80006970:	00052783          	lw	a5,0(a0)
    80006974:	00079663          	bnez	a5,80006980 <holding+0x10>
    80006978:	00000513          	li	a0,0
    8000697c:	00008067          	ret
    80006980:	fe010113          	addi	sp,sp,-32
    80006984:	00813823          	sd	s0,16(sp)
    80006988:	00913423          	sd	s1,8(sp)
    8000698c:	00113c23          	sd	ra,24(sp)
    80006990:	02010413          	addi	s0,sp,32
    80006994:	01053483          	ld	s1,16(a0)
    80006998:	ffffe097          	auipc	ra,0xffffe
    8000699c:	750080e7          	jalr	1872(ra) # 800050e8 <mycpu>
    800069a0:	01813083          	ld	ra,24(sp)
    800069a4:	01013403          	ld	s0,16(sp)
    800069a8:	40a48533          	sub	a0,s1,a0
    800069ac:	00153513          	seqz	a0,a0
    800069b0:	00813483          	ld	s1,8(sp)
    800069b4:	02010113          	addi	sp,sp,32
    800069b8:	00008067          	ret

00000000800069bc <push_off>:
    800069bc:	fe010113          	addi	sp,sp,-32
    800069c0:	00813823          	sd	s0,16(sp)
    800069c4:	00113c23          	sd	ra,24(sp)
    800069c8:	00913423          	sd	s1,8(sp)
    800069cc:	02010413          	addi	s0,sp,32
    800069d0:	100024f3          	csrr	s1,sstatus
    800069d4:	100027f3          	csrr	a5,sstatus
    800069d8:	ffd7f793          	andi	a5,a5,-3
    800069dc:	10079073          	csrw	sstatus,a5
    800069e0:	ffffe097          	auipc	ra,0xffffe
    800069e4:	708080e7          	jalr	1800(ra) # 800050e8 <mycpu>
    800069e8:	07852783          	lw	a5,120(a0)
    800069ec:	02078663          	beqz	a5,80006a18 <push_off+0x5c>
    800069f0:	ffffe097          	auipc	ra,0xffffe
    800069f4:	6f8080e7          	jalr	1784(ra) # 800050e8 <mycpu>
    800069f8:	07852783          	lw	a5,120(a0)
    800069fc:	01813083          	ld	ra,24(sp)
    80006a00:	01013403          	ld	s0,16(sp)
    80006a04:	0017879b          	addiw	a5,a5,1
    80006a08:	06f52c23          	sw	a5,120(a0)
    80006a0c:	00813483          	ld	s1,8(sp)
    80006a10:	02010113          	addi	sp,sp,32
    80006a14:	00008067          	ret
    80006a18:	0014d493          	srli	s1,s1,0x1
    80006a1c:	ffffe097          	auipc	ra,0xffffe
    80006a20:	6cc080e7          	jalr	1740(ra) # 800050e8 <mycpu>
    80006a24:	0014f493          	andi	s1,s1,1
    80006a28:	06952e23          	sw	s1,124(a0)
    80006a2c:	fc5ff06f          	j	800069f0 <push_off+0x34>

0000000080006a30 <pop_off>:
    80006a30:	ff010113          	addi	sp,sp,-16
    80006a34:	00813023          	sd	s0,0(sp)
    80006a38:	00113423          	sd	ra,8(sp)
    80006a3c:	01010413          	addi	s0,sp,16
    80006a40:	ffffe097          	auipc	ra,0xffffe
    80006a44:	6a8080e7          	jalr	1704(ra) # 800050e8 <mycpu>
    80006a48:	100027f3          	csrr	a5,sstatus
    80006a4c:	0027f793          	andi	a5,a5,2
    80006a50:	04079663          	bnez	a5,80006a9c <pop_off+0x6c>
    80006a54:	07852783          	lw	a5,120(a0)
    80006a58:	02f05a63          	blez	a5,80006a8c <pop_off+0x5c>
    80006a5c:	fff7871b          	addiw	a4,a5,-1
    80006a60:	06e52c23          	sw	a4,120(a0)
    80006a64:	00071c63          	bnez	a4,80006a7c <pop_off+0x4c>
    80006a68:	07c52783          	lw	a5,124(a0)
    80006a6c:	00078863          	beqz	a5,80006a7c <pop_off+0x4c>
    80006a70:	100027f3          	csrr	a5,sstatus
    80006a74:	0027e793          	ori	a5,a5,2
    80006a78:	10079073          	csrw	sstatus,a5
    80006a7c:	00813083          	ld	ra,8(sp)
    80006a80:	00013403          	ld	s0,0(sp)
    80006a84:	01010113          	addi	sp,sp,16
    80006a88:	00008067          	ret
    80006a8c:	00002517          	auipc	a0,0x2
    80006a90:	ba450513          	addi	a0,a0,-1116 # 80008630 <digits+0x48>
    80006a94:	fffff097          	auipc	ra,0xfffff
    80006a98:	018080e7          	jalr	24(ra) # 80005aac <panic>
    80006a9c:	00002517          	auipc	a0,0x2
    80006aa0:	b7c50513          	addi	a0,a0,-1156 # 80008618 <digits+0x30>
    80006aa4:	fffff097          	auipc	ra,0xfffff
    80006aa8:	008080e7          	jalr	8(ra) # 80005aac <panic>

0000000080006aac <push_on>:
    80006aac:	fe010113          	addi	sp,sp,-32
    80006ab0:	00813823          	sd	s0,16(sp)
    80006ab4:	00113c23          	sd	ra,24(sp)
    80006ab8:	00913423          	sd	s1,8(sp)
    80006abc:	02010413          	addi	s0,sp,32
    80006ac0:	100024f3          	csrr	s1,sstatus
    80006ac4:	100027f3          	csrr	a5,sstatus
    80006ac8:	0027e793          	ori	a5,a5,2
    80006acc:	10079073          	csrw	sstatus,a5
    80006ad0:	ffffe097          	auipc	ra,0xffffe
    80006ad4:	618080e7          	jalr	1560(ra) # 800050e8 <mycpu>
    80006ad8:	07852783          	lw	a5,120(a0)
    80006adc:	02078663          	beqz	a5,80006b08 <push_on+0x5c>
    80006ae0:	ffffe097          	auipc	ra,0xffffe
    80006ae4:	608080e7          	jalr	1544(ra) # 800050e8 <mycpu>
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
    80006b10:	5dc080e7          	jalr	1500(ra) # 800050e8 <mycpu>
    80006b14:	0014f493          	andi	s1,s1,1
    80006b18:	06952e23          	sw	s1,124(a0)
    80006b1c:	fc5ff06f          	j	80006ae0 <push_on+0x34>

0000000080006b20 <pop_on>:
    80006b20:	ff010113          	addi	sp,sp,-16
    80006b24:	00813023          	sd	s0,0(sp)
    80006b28:	00113423          	sd	ra,8(sp)
    80006b2c:	01010413          	addi	s0,sp,16
    80006b30:	ffffe097          	auipc	ra,0xffffe
    80006b34:	5b8080e7          	jalr	1464(ra) # 800050e8 <mycpu>
    80006b38:	100027f3          	csrr	a5,sstatus
    80006b3c:	0027f793          	andi	a5,a5,2
    80006b40:	04078463          	beqz	a5,80006b88 <pop_on+0x68>
    80006b44:	07852783          	lw	a5,120(a0)
    80006b48:	02f05863          	blez	a5,80006b78 <pop_on+0x58>
    80006b4c:	fff7879b          	addiw	a5,a5,-1
    80006b50:	06f52c23          	sw	a5,120(a0)
    80006b54:	07853783          	ld	a5,120(a0)
    80006b58:	00079863          	bnez	a5,80006b68 <pop_on+0x48>
    80006b5c:	100027f3          	csrr	a5,sstatus
    80006b60:	ffd7f793          	andi	a5,a5,-3
    80006b64:	10079073          	csrw	sstatus,a5
    80006b68:	00813083          	ld	ra,8(sp)
    80006b6c:	00013403          	ld	s0,0(sp)
    80006b70:	01010113          	addi	sp,sp,16
    80006b74:	00008067          	ret
    80006b78:	00002517          	auipc	a0,0x2
    80006b7c:	ae050513          	addi	a0,a0,-1312 # 80008658 <digits+0x70>
    80006b80:	fffff097          	auipc	ra,0xfffff
    80006b84:	f2c080e7          	jalr	-212(ra) # 80005aac <panic>
    80006b88:	00002517          	auipc	a0,0x2
    80006b8c:	ab050513          	addi	a0,a0,-1360 # 80008638 <digits+0x50>
    80006b90:	fffff097          	auipc	ra,0xfffff
    80006b94:	f1c080e7          	jalr	-228(ra) # 80005aac <panic>

0000000080006b98 <__memset>:
    80006b98:	ff010113          	addi	sp,sp,-16
    80006b9c:	00813423          	sd	s0,8(sp)
    80006ba0:	01010413          	addi	s0,sp,16
    80006ba4:	1a060e63          	beqz	a2,80006d60 <__memset+0x1c8>
    80006ba8:	40a007b3          	neg	a5,a0
    80006bac:	0077f793          	andi	a5,a5,7
    80006bb0:	00778693          	addi	a3,a5,7
    80006bb4:	00b00813          	li	a6,11
    80006bb8:	0ff5f593          	andi	a1,a1,255
    80006bbc:	fff6071b          	addiw	a4,a2,-1
    80006bc0:	1b06e663          	bltu	a3,a6,80006d6c <__memset+0x1d4>
    80006bc4:	1cd76463          	bltu	a4,a3,80006d8c <__memset+0x1f4>
    80006bc8:	1a078e63          	beqz	a5,80006d84 <__memset+0x1ec>
    80006bcc:	00b50023          	sb	a1,0(a0)
    80006bd0:	00100713          	li	a4,1
    80006bd4:	1ae78463          	beq	a5,a4,80006d7c <__memset+0x1e4>
    80006bd8:	00b500a3          	sb	a1,1(a0)
    80006bdc:	00200713          	li	a4,2
    80006be0:	1ae78a63          	beq	a5,a4,80006d94 <__memset+0x1fc>
    80006be4:	00b50123          	sb	a1,2(a0)
    80006be8:	00300713          	li	a4,3
    80006bec:	18e78463          	beq	a5,a4,80006d74 <__memset+0x1dc>
    80006bf0:	00b501a3          	sb	a1,3(a0)
    80006bf4:	00400713          	li	a4,4
    80006bf8:	1ae78263          	beq	a5,a4,80006d9c <__memset+0x204>
    80006bfc:	00b50223          	sb	a1,4(a0)
    80006c00:	00500713          	li	a4,5
    80006c04:	1ae78063          	beq	a5,a4,80006da4 <__memset+0x20c>
    80006c08:	00b502a3          	sb	a1,5(a0)
    80006c0c:	00700713          	li	a4,7
    80006c10:	18e79e63          	bne	a5,a4,80006dac <__memset+0x214>
    80006c14:	00b50323          	sb	a1,6(a0)
    80006c18:	00700e93          	li	t4,7
    80006c1c:	00859713          	slli	a4,a1,0x8
    80006c20:	00e5e733          	or	a4,a1,a4
    80006c24:	01059e13          	slli	t3,a1,0x10
    80006c28:	01c76e33          	or	t3,a4,t3
    80006c2c:	01859313          	slli	t1,a1,0x18
    80006c30:	006e6333          	or	t1,t3,t1
    80006c34:	02059893          	slli	a7,a1,0x20
    80006c38:	40f60e3b          	subw	t3,a2,a5
    80006c3c:	011368b3          	or	a7,t1,a7
    80006c40:	02859813          	slli	a6,a1,0x28
    80006c44:	0108e833          	or	a6,a7,a6
    80006c48:	03059693          	slli	a3,a1,0x30
    80006c4c:	003e589b          	srliw	a7,t3,0x3
    80006c50:	00d866b3          	or	a3,a6,a3
    80006c54:	03859713          	slli	a4,a1,0x38
    80006c58:	00389813          	slli	a6,a7,0x3
    80006c5c:	00f507b3          	add	a5,a0,a5
    80006c60:	00e6e733          	or	a4,a3,a4
    80006c64:	000e089b          	sext.w	a7,t3
    80006c68:	00f806b3          	add	a3,a6,a5
    80006c6c:	00e7b023          	sd	a4,0(a5)
    80006c70:	00878793          	addi	a5,a5,8
    80006c74:	fed79ce3          	bne	a5,a3,80006c6c <__memset+0xd4>
    80006c78:	ff8e7793          	andi	a5,t3,-8
    80006c7c:	0007871b          	sext.w	a4,a5
    80006c80:	01d787bb          	addw	a5,a5,t4
    80006c84:	0ce88e63          	beq	a7,a4,80006d60 <__memset+0x1c8>
    80006c88:	00f50733          	add	a4,a0,a5
    80006c8c:	00b70023          	sb	a1,0(a4)
    80006c90:	0017871b          	addiw	a4,a5,1
    80006c94:	0cc77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006c98:	00e50733          	add	a4,a0,a4
    80006c9c:	00b70023          	sb	a1,0(a4)
    80006ca0:	0027871b          	addiw	a4,a5,2
    80006ca4:	0ac77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006ca8:	00e50733          	add	a4,a0,a4
    80006cac:	00b70023          	sb	a1,0(a4)
    80006cb0:	0037871b          	addiw	a4,a5,3
    80006cb4:	0ac77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006cb8:	00e50733          	add	a4,a0,a4
    80006cbc:	00b70023          	sb	a1,0(a4)
    80006cc0:	0047871b          	addiw	a4,a5,4
    80006cc4:	08c77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006cc8:	00e50733          	add	a4,a0,a4
    80006ccc:	00b70023          	sb	a1,0(a4)
    80006cd0:	0057871b          	addiw	a4,a5,5
    80006cd4:	08c77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006cd8:	00e50733          	add	a4,a0,a4
    80006cdc:	00b70023          	sb	a1,0(a4)
    80006ce0:	0067871b          	addiw	a4,a5,6
    80006ce4:	06c77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006ce8:	00e50733          	add	a4,a0,a4
    80006cec:	00b70023          	sb	a1,0(a4)
    80006cf0:	0077871b          	addiw	a4,a5,7
    80006cf4:	06c77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006cf8:	00e50733          	add	a4,a0,a4
    80006cfc:	00b70023          	sb	a1,0(a4)
    80006d00:	0087871b          	addiw	a4,a5,8
    80006d04:	04c77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006d08:	00e50733          	add	a4,a0,a4
    80006d0c:	00b70023          	sb	a1,0(a4)
    80006d10:	0097871b          	addiw	a4,a5,9
    80006d14:	04c77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006d18:	00e50733          	add	a4,a0,a4
    80006d1c:	00b70023          	sb	a1,0(a4)
    80006d20:	00a7871b          	addiw	a4,a5,10
    80006d24:	02c77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006d28:	00e50733          	add	a4,a0,a4
    80006d2c:	00b70023          	sb	a1,0(a4)
    80006d30:	00b7871b          	addiw	a4,a5,11
    80006d34:	02c77663          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006d38:	00e50733          	add	a4,a0,a4
    80006d3c:	00b70023          	sb	a1,0(a4)
    80006d40:	00c7871b          	addiw	a4,a5,12
    80006d44:	00c77e63          	bgeu	a4,a2,80006d60 <__memset+0x1c8>
    80006d48:	00e50733          	add	a4,a0,a4
    80006d4c:	00b70023          	sb	a1,0(a4)
    80006d50:	00d7879b          	addiw	a5,a5,13
    80006d54:	00c7f663          	bgeu	a5,a2,80006d60 <__memset+0x1c8>
    80006d58:	00f507b3          	add	a5,a0,a5
    80006d5c:	00b78023          	sb	a1,0(a5)
    80006d60:	00813403          	ld	s0,8(sp)
    80006d64:	01010113          	addi	sp,sp,16
    80006d68:	00008067          	ret
    80006d6c:	00b00693          	li	a3,11
    80006d70:	e55ff06f          	j	80006bc4 <__memset+0x2c>
    80006d74:	00300e93          	li	t4,3
    80006d78:	ea5ff06f          	j	80006c1c <__memset+0x84>
    80006d7c:	00100e93          	li	t4,1
    80006d80:	e9dff06f          	j	80006c1c <__memset+0x84>
    80006d84:	00000e93          	li	t4,0
    80006d88:	e95ff06f          	j	80006c1c <__memset+0x84>
    80006d8c:	00000793          	li	a5,0
    80006d90:	ef9ff06f          	j	80006c88 <__memset+0xf0>
    80006d94:	00200e93          	li	t4,2
    80006d98:	e85ff06f          	j	80006c1c <__memset+0x84>
    80006d9c:	00400e93          	li	t4,4
    80006da0:	e7dff06f          	j	80006c1c <__memset+0x84>
    80006da4:	00500e93          	li	t4,5
    80006da8:	e75ff06f          	j	80006c1c <__memset+0x84>
    80006dac:	00600e93          	li	t4,6
    80006db0:	e6dff06f          	j	80006c1c <__memset+0x84>

0000000080006db4 <__memmove>:
    80006db4:	ff010113          	addi	sp,sp,-16
    80006db8:	00813423          	sd	s0,8(sp)
    80006dbc:	01010413          	addi	s0,sp,16
    80006dc0:	0e060863          	beqz	a2,80006eb0 <__memmove+0xfc>
    80006dc4:	fff6069b          	addiw	a3,a2,-1
    80006dc8:	0006881b          	sext.w	a6,a3
    80006dcc:	0ea5e863          	bltu	a1,a0,80006ebc <__memmove+0x108>
    80006dd0:	00758713          	addi	a4,a1,7
    80006dd4:	00a5e7b3          	or	a5,a1,a0
    80006dd8:	40a70733          	sub	a4,a4,a0
    80006ddc:	0077f793          	andi	a5,a5,7
    80006de0:	00f73713          	sltiu	a4,a4,15
    80006de4:	00174713          	xori	a4,a4,1
    80006de8:	0017b793          	seqz	a5,a5
    80006dec:	00e7f7b3          	and	a5,a5,a4
    80006df0:	10078863          	beqz	a5,80006f00 <__memmove+0x14c>
    80006df4:	00900793          	li	a5,9
    80006df8:	1107f463          	bgeu	a5,a6,80006f00 <__memmove+0x14c>
    80006dfc:	0036581b          	srliw	a6,a2,0x3
    80006e00:	fff8081b          	addiw	a6,a6,-1
    80006e04:	02081813          	slli	a6,a6,0x20
    80006e08:	01d85893          	srli	a7,a6,0x1d
    80006e0c:	00858813          	addi	a6,a1,8
    80006e10:	00058793          	mv	a5,a1
    80006e14:	00050713          	mv	a4,a0
    80006e18:	01088833          	add	a6,a7,a6
    80006e1c:	0007b883          	ld	a7,0(a5)
    80006e20:	00878793          	addi	a5,a5,8
    80006e24:	00870713          	addi	a4,a4,8
    80006e28:	ff173c23          	sd	a7,-8(a4)
    80006e2c:	ff0798e3          	bne	a5,a6,80006e1c <__memmove+0x68>
    80006e30:	ff867713          	andi	a4,a2,-8
    80006e34:	02071793          	slli	a5,a4,0x20
    80006e38:	0207d793          	srli	a5,a5,0x20
    80006e3c:	00f585b3          	add	a1,a1,a5
    80006e40:	40e686bb          	subw	a3,a3,a4
    80006e44:	00f507b3          	add	a5,a0,a5
    80006e48:	06e60463          	beq	a2,a4,80006eb0 <__memmove+0xfc>
    80006e4c:	0005c703          	lbu	a4,0(a1)
    80006e50:	00e78023          	sb	a4,0(a5)
    80006e54:	04068e63          	beqz	a3,80006eb0 <__memmove+0xfc>
    80006e58:	0015c603          	lbu	a2,1(a1)
    80006e5c:	00100713          	li	a4,1
    80006e60:	00c780a3          	sb	a2,1(a5)
    80006e64:	04e68663          	beq	a3,a4,80006eb0 <__memmove+0xfc>
    80006e68:	0025c603          	lbu	a2,2(a1)
    80006e6c:	00200713          	li	a4,2
    80006e70:	00c78123          	sb	a2,2(a5)
    80006e74:	02e68e63          	beq	a3,a4,80006eb0 <__memmove+0xfc>
    80006e78:	0035c603          	lbu	a2,3(a1)
    80006e7c:	00300713          	li	a4,3
    80006e80:	00c781a3          	sb	a2,3(a5)
    80006e84:	02e68663          	beq	a3,a4,80006eb0 <__memmove+0xfc>
    80006e88:	0045c603          	lbu	a2,4(a1)
    80006e8c:	00400713          	li	a4,4
    80006e90:	00c78223          	sb	a2,4(a5)
    80006e94:	00e68e63          	beq	a3,a4,80006eb0 <__memmove+0xfc>
    80006e98:	0055c603          	lbu	a2,5(a1)
    80006e9c:	00500713          	li	a4,5
    80006ea0:	00c782a3          	sb	a2,5(a5)
    80006ea4:	00e68663          	beq	a3,a4,80006eb0 <__memmove+0xfc>
    80006ea8:	0065c703          	lbu	a4,6(a1)
    80006eac:	00e78323          	sb	a4,6(a5)
    80006eb0:	00813403          	ld	s0,8(sp)
    80006eb4:	01010113          	addi	sp,sp,16
    80006eb8:	00008067          	ret
    80006ebc:	02061713          	slli	a4,a2,0x20
    80006ec0:	02075713          	srli	a4,a4,0x20
    80006ec4:	00e587b3          	add	a5,a1,a4
    80006ec8:	f0f574e3          	bgeu	a0,a5,80006dd0 <__memmove+0x1c>
    80006ecc:	02069613          	slli	a2,a3,0x20
    80006ed0:	02065613          	srli	a2,a2,0x20
    80006ed4:	fff64613          	not	a2,a2
    80006ed8:	00e50733          	add	a4,a0,a4
    80006edc:	00c78633          	add	a2,a5,a2
    80006ee0:	fff7c683          	lbu	a3,-1(a5)
    80006ee4:	fff78793          	addi	a5,a5,-1
    80006ee8:	fff70713          	addi	a4,a4,-1
    80006eec:	00d70023          	sb	a3,0(a4)
    80006ef0:	fec798e3          	bne	a5,a2,80006ee0 <__memmove+0x12c>
    80006ef4:	00813403          	ld	s0,8(sp)
    80006ef8:	01010113          	addi	sp,sp,16
    80006efc:	00008067          	ret
    80006f00:	02069713          	slli	a4,a3,0x20
    80006f04:	02075713          	srli	a4,a4,0x20
    80006f08:	00170713          	addi	a4,a4,1
    80006f0c:	00e50733          	add	a4,a0,a4
    80006f10:	00050793          	mv	a5,a0
    80006f14:	0005c683          	lbu	a3,0(a1)
    80006f18:	00178793          	addi	a5,a5,1
    80006f1c:	00158593          	addi	a1,a1,1
    80006f20:	fed78fa3          	sb	a3,-1(a5)
    80006f24:	fee798e3          	bne	a5,a4,80006f14 <__memmove+0x160>
    80006f28:	f89ff06f          	j	80006eb0 <__memmove+0xfc>

0000000080006f2c <__putc>:
    80006f2c:	fe010113          	addi	sp,sp,-32
    80006f30:	00813823          	sd	s0,16(sp)
    80006f34:	00113c23          	sd	ra,24(sp)
    80006f38:	02010413          	addi	s0,sp,32
    80006f3c:	00050793          	mv	a5,a0
    80006f40:	fef40593          	addi	a1,s0,-17
    80006f44:	00100613          	li	a2,1
    80006f48:	00000513          	li	a0,0
    80006f4c:	fef407a3          	sb	a5,-17(s0)
    80006f50:	fffff097          	auipc	ra,0xfffff
    80006f54:	b3c080e7          	jalr	-1220(ra) # 80005a8c <console_write>
    80006f58:	01813083          	ld	ra,24(sp)
    80006f5c:	01013403          	ld	s0,16(sp)
    80006f60:	02010113          	addi	sp,sp,32
    80006f64:	00008067          	ret

0000000080006f68 <__getc>:
    80006f68:	fe010113          	addi	sp,sp,-32
    80006f6c:	00813823          	sd	s0,16(sp)
    80006f70:	00113c23          	sd	ra,24(sp)
    80006f74:	02010413          	addi	s0,sp,32
    80006f78:	fe840593          	addi	a1,s0,-24
    80006f7c:	00100613          	li	a2,1
    80006f80:	00000513          	li	a0,0
    80006f84:	fffff097          	auipc	ra,0xfffff
    80006f88:	ae8080e7          	jalr	-1304(ra) # 80005a6c <console_read>
    80006f8c:	fe844503          	lbu	a0,-24(s0)
    80006f90:	01813083          	ld	ra,24(sp)
    80006f94:	01013403          	ld	s0,16(sp)
    80006f98:	02010113          	addi	sp,sp,32
    80006f9c:	00008067          	ret

0000000080006fa0 <console_handler>:
    80006fa0:	fe010113          	addi	sp,sp,-32
    80006fa4:	00813823          	sd	s0,16(sp)
    80006fa8:	00113c23          	sd	ra,24(sp)
    80006fac:	00913423          	sd	s1,8(sp)
    80006fb0:	02010413          	addi	s0,sp,32
    80006fb4:	14202773          	csrr	a4,scause
    80006fb8:	100027f3          	csrr	a5,sstatus
    80006fbc:	0027f793          	andi	a5,a5,2
    80006fc0:	06079e63          	bnez	a5,8000703c <console_handler+0x9c>
    80006fc4:	00074c63          	bltz	a4,80006fdc <console_handler+0x3c>
    80006fc8:	01813083          	ld	ra,24(sp)
    80006fcc:	01013403          	ld	s0,16(sp)
    80006fd0:	00813483          	ld	s1,8(sp)
    80006fd4:	02010113          	addi	sp,sp,32
    80006fd8:	00008067          	ret
    80006fdc:	0ff77713          	andi	a4,a4,255
    80006fe0:	00900793          	li	a5,9
    80006fe4:	fef712e3          	bne	a4,a5,80006fc8 <console_handler+0x28>
    80006fe8:	ffffe097          	auipc	ra,0xffffe
    80006fec:	6dc080e7          	jalr	1756(ra) # 800056c4 <plic_claim>
    80006ff0:	00a00793          	li	a5,10
    80006ff4:	00050493          	mv	s1,a0
    80006ff8:	02f50c63          	beq	a0,a5,80007030 <console_handler+0x90>
    80006ffc:	fc0506e3          	beqz	a0,80006fc8 <console_handler+0x28>
    80007000:	00050593          	mv	a1,a0
    80007004:	00001517          	auipc	a0,0x1
    80007008:	55c50513          	addi	a0,a0,1372 # 80008560 <_ZTV14PeriodicWorker+0x1c0>
    8000700c:	fffff097          	auipc	ra,0xfffff
    80007010:	afc080e7          	jalr	-1284(ra) # 80005b08 <__printf>
    80007014:	01013403          	ld	s0,16(sp)
    80007018:	01813083          	ld	ra,24(sp)
    8000701c:	00048513          	mv	a0,s1
    80007020:	00813483          	ld	s1,8(sp)
    80007024:	02010113          	addi	sp,sp,32
    80007028:	ffffe317          	auipc	t1,0xffffe
    8000702c:	6d430067          	jr	1748(t1) # 800056fc <plic_complete>
    80007030:	fffff097          	auipc	ra,0xfffff
    80007034:	3e0080e7          	jalr	992(ra) # 80006410 <uartintr>
    80007038:	fddff06f          	j	80007014 <console_handler+0x74>
    8000703c:	00001517          	auipc	a0,0x1
    80007040:	62450513          	addi	a0,a0,1572 # 80008660 <digits+0x78>
    80007044:	fffff097          	auipc	ra,0xfffff
    80007048:	a68080e7          	jalr	-1432(ra) # 80005aac <panic>
	...
