
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	b8813103          	ld	sp,-1144(sp) # 80008b88 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1b9040ef          	jal	ra,800049d4 <start>

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
    80001080:	0d1000ef          	jal	ra,80001950 <interrupt>

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

0000000080001110 <copy_and_swap>:

.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
    80001110:	100522af          	lr.w	t0,(a0)
bne t0, a1, fail       # Doesn’t match, so fail.
    80001114:	00b29a63          	bne	t0,a1,80001128 <fail>
sc.w t0, a2, (a0)      # Try to update.
    80001118:	18c522af          	sc.w	t0,a2,(a0)
bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000111c:	fe029ae3          	bnez	t0,80001110 <copy_and_swap>
li a0, 0               # Set return to success.
    80001120:	00000513          	li	a0,0
jr ra                  # Return.
    80001124:	00008067          	ret

0000000080001128 <fail>:
fail:
li a0, 1               # Set return to failure.
    80001128:	00100513          	li	a0,1

000000008000112c <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
addi sp, sp, -256
    8000112c:	f0010113          	addi	sp,sp,-256
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index * 8(sp)
.endr
    80001130:	00313c23          	sd	gp,24(sp)
    80001134:	02413023          	sd	tp,32(sp)
    80001138:	02513423          	sd	t0,40(sp)
    8000113c:	02613823          	sd	t1,48(sp)
    80001140:	02713c23          	sd	t2,56(sp)
    80001144:	04813023          	sd	s0,64(sp)
    80001148:	04913423          	sd	s1,72(sp)
    8000114c:	04a13823          	sd	a0,80(sp)
    80001150:	04b13c23          	sd	a1,88(sp)
    80001154:	06c13023          	sd	a2,96(sp)
    80001158:	06d13423          	sd	a3,104(sp)
    8000115c:	06e13823          	sd	a4,112(sp)
    80001160:	06f13c23          	sd	a5,120(sp)
    80001164:	09013023          	sd	a6,128(sp)
    80001168:	09113423          	sd	a7,136(sp)
    8000116c:	09213823          	sd	s2,144(sp)
    80001170:	09313c23          	sd	s3,152(sp)
    80001174:	0b413023          	sd	s4,160(sp)
    80001178:	0b513423          	sd	s5,168(sp)
    8000117c:	0b613823          	sd	s6,176(sp)
    80001180:	0b713c23          	sd	s7,184(sp)
    80001184:	0d813023          	sd	s8,192(sp)
    80001188:	0d913423          	sd	s9,200(sp)
    8000118c:	0da13823          	sd	s10,208(sp)
    80001190:	0db13c23          	sd	s11,216(sp)
    80001194:	0fc13023          	sd	t3,224(sp)
    80001198:	0fd13423          	sd	t4,232(sp)
    8000119c:	0fe13823          	sd	t5,240(sp)
    800011a0:	0ff13c23          	sd	t6,248(sp)
ret
    800011a4:	00008067          	ret

00000000800011a8 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
.irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index * 8(sp)
.endr
    800011a8:	01813183          	ld	gp,24(sp)
    800011ac:	02013203          	ld	tp,32(sp)
    800011b0:	02813283          	ld	t0,40(sp)
    800011b4:	03013303          	ld	t1,48(sp)
    800011b8:	03813383          	ld	t2,56(sp)
    800011bc:	04013403          	ld	s0,64(sp)
    800011c0:	04813483          	ld	s1,72(sp)
    800011c4:	05013503          	ld	a0,80(sp)
    800011c8:	05813583          	ld	a1,88(sp)
    800011cc:	06013603          	ld	a2,96(sp)
    800011d0:	06813683          	ld	a3,104(sp)
    800011d4:	07013703          	ld	a4,112(sp)
    800011d8:	07813783          	ld	a5,120(sp)
    800011dc:	08013803          	ld	a6,128(sp)
    800011e0:	08813883          	ld	a7,136(sp)
    800011e4:	09013903          	ld	s2,144(sp)
    800011e8:	09813983          	ld	s3,152(sp)
    800011ec:	0a013a03          	ld	s4,160(sp)
    800011f0:	0a813a83          	ld	s5,168(sp)
    800011f4:	0b013b03          	ld	s6,176(sp)
    800011f8:	0b813b83          	ld	s7,184(sp)
    800011fc:	0c013c03          	ld	s8,192(sp)
    80001200:	0c813c83          	ld	s9,200(sp)
    80001204:	0d013d03          	ld	s10,208(sp)
    80001208:	0d813d83          	ld	s11,216(sp)
    8000120c:	0e013e03          	ld	t3,224(sp)
    80001210:	0e813e83          	ld	t4,232(sp)
    80001214:	0f013f03          	ld	t5,240(sp)
    80001218:	0f813f83          	ld	t6,248(sp)
addi sp, sp, 256
    8000121c:	10010113          	addi	sp,sp,256
ret
    80001220:	00008067          	ret

0000000080001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:

.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
sd ra, 0 * 8(a0)
    80001224:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
sd sp, 1 * 8(a0)
    80001228:	00253423          	sd	sp,8(a0)

ld ra, 0 * 8(a1)
    8000122c:	0005b083          	ld	ra,0(a1)
ld sp, 1 * 8(a1)
    80001230:	0085b103          	ld	sp,8(a1)

ret
    80001234:	00008067          	ret

0000000080001238 <_Z13timer_handlerv>:
    IW = 7,

};

void timer_handler()
{
    80001238:	fd010113          	addi	sp,sp,-48
    8000123c:	02113423          	sd	ra,40(sp)
    80001240:	02813023          	sd	s0,32(sp)
    80001244:	00913c23          	sd	s1,24(sp)
    80001248:	01213823          	sd	s2,16(sp)
    8000124c:	03010413          	addi	s0,sp,48
    Scheduler::update_sleep();
    80001250:	00001097          	auipc	ra,0x1
    80001254:	724080e7          	jalr	1828(ra) # 80002974 <_ZN9Scheduler12update_sleepEv>

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80001258:	00008717          	auipc	a4,0x8
    8000125c:	b2870713          	addi	a4,a4,-1240 # 80008d80 <_ZN3TCB16timeSliceCounterE>
    80001260:	00073783          	ld	a5,0(a4)
    80001264:	00178793          	addi	a5,a5,1
    80001268:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    8000126c:	00008717          	auipc	a4,0x8
    80001270:	b1c70713          	addi	a4,a4,-1252 # 80008d88 <_ZN3TCB7runningE>
    80001274:	00073703          	ld	a4,0(a4)
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    80001278:	02873703          	ld	a4,40(a4)
    8000127c:	02e7f263          	bgeu	a5,a4,800012a0 <_Z13timer_handlerv+0x68>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001280:	00200793          	li	a5,2
    80001284:	1447b073          	csrc	sip,a5
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    80001288:	02813083          	ld	ra,40(sp)
    8000128c:	02013403          	ld	s0,32(sp)
    80001290:	01813483          	ld	s1,24(sp)
    80001294:	01013903          	ld	s2,16(sp)
    80001298:	03010113          	addi	sp,sp,48
    8000129c:	00008067          	ret
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800012a0:	100027f3          	csrr	a5,sstatus
    800012a4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800012a8:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800012ac:	141027f3          	csrr	a5,sepc
    800012b0:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    800012b4:	fd043483          	ld	s1,-48(s0)
        TCB::timeSliceCounter = 0;
    800012b8:	00008797          	auipc	a5,0x8
    800012bc:	ac07b423          	sd	zero,-1336(a5) # 80008d80 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800012c0:	00002097          	auipc	ra,0x2
    800012c4:	76c080e7          	jalr	1900(ra) # 80003a2c <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800012c8:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800012cc:	14149073          	csrw	sepc,s1
    800012d0:	fb1ff06f          	j	80001280 <_Z13timer_handlerv+0x48>

00000000800012d4 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    800012d4:	fb010113          	addi	sp,sp,-80
    800012d8:	04113423          	sd	ra,72(sp)
    800012dc:	04813023          	sd	s0,64(sp)
    800012e0:	02913c23          	sd	s1,56(sp)
    800012e4:	03213823          	sd	s2,48(sp)
    800012e8:	03313423          	sd	s3,40(sp)
    800012ec:	03413023          	sd	s4,32(sp)
    800012f0:	01513c23          	sd	s5,24(sp)
    800012f4:	01613823          	sd	s6,16(sp)
    800012f8:	05010413          	addi	s0,sp,80
    800012fc:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001300:	141027f3          	csrr	a5,sepc
    80001304:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001308:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000130c:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001310:	100027f3          	csrr	a5,sstatus
    80001314:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001318:	fb043983          	ld	s3,-80(s0)

    if(a0 == MA){
    8000131c:	00100793          	li	a5,1
    80001320:	0ef50663          	beq	a0,a5,8000140c <_Z8usrEcallmmmmm+0x138>
    80001324:	00050493          	mv	s1,a0
    80001328:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    8000132c:	00200793          	li	a5,2
    80001330:	12f50063          	beq	a0,a5,80001450 <_Z8usrEcallmmmmm+0x17c>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    80001334:	01100793          	li	a5,17
    80001338:	12f50863          	beq	a0,a5,80001468 <_Z8usrEcallmmmmm+0x194>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    8000133c:	01200793          	li	a5,18
    80001340:	14f50a63          	beq	a0,a5,80001494 <_Z8usrEcallmmmmm+0x1c0>
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    80001344:	01300793          	li	a5,19
    80001348:	16f50863          	beq	a0,a5,800014b8 <_Z8usrEcallmmmmm+0x1e4>
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    8000134c:	06900793          	li	a5,105
    80001350:	18f50063          	beq	a0,a5,800014d0 <_Z8usrEcallmmmmm+0x1fc>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001354:	02100793          	li	a5,33
    80001358:	18f50663          	beq	a0,a5,800014e4 <_Z8usrEcallmmmmm+0x210>
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    8000135c:	02200793          	li	a5,34
    80001360:	1cf50463          	beq	a0,a5,80001528 <_Z8usrEcallmmmmm+0x254>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    80001364:	02300793          	li	a5,35
    80001368:	1cf50863          	beq	a0,a5,80001538 <_Z8usrEcallmmmmm+0x264>
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    8000136c:	02400793          	li	a5,36
    80001370:	1ef50863          	beq	a0,a5,80001560 <_Z8usrEcallmmmmm+0x28c>
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
    }
    else if(a0 == TS)
    80001374:	03100793          	li	a5,49
    80001378:	20f50863          	beq	a0,a5,80001588 <_Z8usrEcallmmmmm+0x2b4>
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    8000137c:	04100793          	li	a5,65
    80001380:	20f50e63          	beq	a0,a5,8000159c <_Z8usrEcallmmmmm+0x2c8>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    80001384:	04200793          	li	a5,66
    80001388:	08f51c63          	bne	a0,a5,80001420 <_Z8usrEcallmmmmm+0x14c>
    {
        StdIO::obuffer->put((char)a1); 
    8000138c:	00008797          	auipc	a5,0x8
    80001390:	9bc78793          	addi	a5,a5,-1604 # 80008d48 <_ZN5StdIO7obufferE>
    80001394:	0007ba83          	ld	s5,0(a5)
    80001398:	0ff5fa13          	andi	s4,a1,255
    #include"../h/kernel_operators.hpp"
    SharedBuffer():mutex(1), itemAvailable(0), 
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}

    void put(T c){
        spaceAvailable.wait();
    8000139c:	450a8513          	addi	a0,s5,1104
    800013a0:	00001097          	auipc	ra,0x1
    800013a4:	ae8080e7          	jalr	-1304(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800013a8:	400a8b13          	addi	s6,s5,1024
    800013ac:	000b0513          	mv	a0,s6
    800013b0:	00001097          	auipc	ra,0x1
    800013b4:	ad8080e7          	jalr	-1320(ra) # 80001e88 <_ZN10KSemaphore4waitEv>

        tmpLen++;
    800013b8:	480aa783          	lw	a5,1152(s5)
    800013bc:	0017879b          	addiw	a5,a5,1
    800013c0:	48faa023          	sw	a5,1152(s5)
        buffer[tail]=c;
    800013c4:	47caa783          	lw	a5,1148(s5)
    800013c8:	00fa8733          	add	a4,s5,a5
    800013cc:	01470023          	sb	s4,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    800013d0:	0017879b          	addiw	a5,a5,1
    800013d4:	41f7d71b          	sraiw	a4,a5,0x1f
    800013d8:	0167571b          	srliw	a4,a4,0x16
    800013dc:	00e787bb          	addw	a5,a5,a4
    800013e0:	3ff7f793          	andi	a5,a5,1023
    800013e4:	40e787bb          	subw	a5,a5,a4
    800013e8:	46faae23          	sw	a5,1148(s5)
    
        itemAvailable.signal();
    800013ec:	428a8513          	addi	a0,s5,1064
    800013f0:	00001097          	auipc	ra,0x1
    800013f4:	b1c080e7          	jalr	-1252(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    800013f8:	000b0513          	mv	a0,s6
    800013fc:	00001097          	auipc	ra,0x1
    80001400:	b10080e7          	jalr	-1264(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001404:	00048513          	mv	a0,s1
    80001408:	0180006f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    8000140c:	00001097          	auipc	ra,0x1
    80001410:	d0c080e7          	jalr	-756(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001414:	000a0593          	mv	a1,s4
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	d74080e7          	jalr	-652(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001420:	10099073          	csrw	sstatus,s3
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001424:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}
    80001428:	04813083          	ld	ra,72(sp)
    8000142c:	04013403          	ld	s0,64(sp)
    80001430:	03813483          	ld	s1,56(sp)
    80001434:	03013903          	ld	s2,48(sp)
    80001438:	02813983          	ld	s3,40(sp)
    8000143c:	02013a03          	ld	s4,32(sp)
    80001440:	01813a83          	ld	s5,24(sp)
    80001444:	01013b03          	ld	s6,16(sp)
    80001448:	05010113          	addi	sp,sp,80
    8000144c:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001450:	00001097          	auipc	ra,0x1
    80001454:	cc8080e7          	jalr	-824(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001458:	000a0593          	mv	a1,s4
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	eec080e7          	jalr	-276(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    80001464:	fbdff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001468:	00070613          	mv	a2,a4
    8000146c:	00068593          	mv	a1,a3
    80001470:	000a8513          	mv	a0,s5
    80001474:	00002097          	auipc	ra,0x2
    80001478:	204080e7          	jalr	516(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000147c:	00aa3023          	sd	a0,0(s4)
        if(!(*t)) ret = -4;
    80001480:	00050663          	beqz	a0,8000148c <_Z8usrEcallmmmmm+0x1b8>
        else ret = 0;
    80001484:	00000513          	li	a0,0
    80001488:	f99ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        if(!(*t)) ret = -4;
    8000148c:	ffc00513          	li	a0,-4
    80001490:	f91ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        TCB::running->finish();
    80001494:	00008797          	auipc	a5,0x8
    80001498:	8f478793          	addi	a5,a5,-1804 # 80008d88 <_ZN3TCB7runningE>
    8000149c:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800014a0:	00200713          	li	a4,2
    800014a4:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    800014a8:	00002097          	auipc	ra,0x2
    800014ac:	48c080e7          	jalr	1164(ra) # 80003934 <_ZN3TCB8dispatchEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014b0:	00048513          	mv	a0,s1
    800014b4:	f6dff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        TCB::timeSliceCounter = 0;
    800014b8:	00008797          	auipc	a5,0x8
    800014bc:	8c07b423          	sd	zero,-1848(a5) # 80008d80 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800014c0:	00002097          	auipc	ra,0x2
    800014c4:	56c080e7          	jalr	1388(ra) # 80003a2c <_ZN3TCB5yieldEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014c8:	00048513          	mv	a0,s1
    800014cc:	f55ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        TCB::deleteThread((TCB*)a1);
    800014d0:	00058513          	mv	a0,a1
    800014d4:	00002097          	auipc	ra,0x2
    800014d8:	2f8080e7          	jalr	760(ra) # 800037cc <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800014dc:	00048513          	mv	a0,s1
    800014e0:	f41ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800014e4:	00001097          	auipc	ra,0x1
    800014e8:	c34080e7          	jalr	-972(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    800014ec:	00100593          	li	a1,1
    800014f0:	00001097          	auipc	ra,0x1
    800014f4:	c9c080e7          	jalr	-868(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    800014f8:	01552423          	sw	s5,8(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    800014fc:	00053823          	sd	zero,16(a0)
    80001500:	00053c23          	sd	zero,24(a0)
    80001504:	02052023          	sw	zero,32(a0)
    {
        next = activeSemaphores;
    80001508:	00008797          	auipc	a5,0x8
    8000150c:	82878793          	addi	a5,a5,-2008 # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80001510:	0007b703          	ld	a4,0(a5)
    80001514:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80001518:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    8000151c:	00aa3023          	sd	a0,0(s4)
        else ret = 0;
    80001520:	00000513          	li	a0,0
    80001524:	efdff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        ret = KSemaphore::close(t);
    80001528:	00058513          	mv	a0,a1
    8000152c:	00001097          	auipc	ra,0x1
    80001530:	a88080e7          	jalr	-1400(ra) # 80001fb4 <_ZN10KSemaphore5closeEPS_>
    80001534:	eedff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80001538:	00058513          	mv	a0,a1
    8000153c:	00001097          	auipc	ra,0x1
    80001540:	b14080e7          	jalr	-1260(ra) # 80002050 <_ZN10KSemaphore6existsEPS_>
    80001544:	00051663          	bnez	a0,80001550 <_Z8usrEcallmmmmm+0x27c>
            ret = -1;
    80001548:	fff00513          	li	a0,-1
    8000154c:	ed5ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
            ret = t->wait();
    80001550:	000a0513          	mv	a0,s4
    80001554:	00001097          	auipc	ra,0x1
    80001558:	934080e7          	jalr	-1740(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
    8000155c:	ec5ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        if(KSemaphore::exists(t))
    80001560:	00058513          	mv	a0,a1
    80001564:	00001097          	auipc	ra,0x1
    80001568:	aec080e7          	jalr	-1300(ra) # 80002050 <_ZN10KSemaphore6existsEPS_>
    8000156c:	00051663          	bnez	a0,80001578 <_Z8usrEcallmmmmm+0x2a4>
            ret = -1;
    80001570:	fff00513          	li	a0,-1
    80001574:	eadff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
            ret = t->signal();
    80001578:	000a0513          	mv	a0,s4
    8000157c:	00001097          	auipc	ra,0x1
    80001580:	990080e7          	jalr	-1648(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    80001584:	e9dff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        TCB::sleep(a1);
    80001588:	00058513          	mv	a0,a1
    8000158c:	00002097          	auipc	ra,0x2
    80001590:	4d8080e7          	jalr	1240(ra) # 80003a64 <_ZN3TCB5sleepEm>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001594:	00048513          	mv	a0,s1
    80001598:	e89ff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>
        ret = StdIO::ibuffer->get();
    8000159c:	00007797          	auipc	a5,0x7
    800015a0:	7b478793          	addi	a5,a5,1972 # 80008d50 <_ZN5StdIO7ibufferE>
    800015a4:	0007ba03          	ld	s4,0(a5)
    }

    T get(){
        itemAvailable.wait();
    800015a8:	428a0513          	addi	a0,s4,1064
    800015ac:	00001097          	auipc	ra,0x1
    800015b0:	8dc080e7          	jalr	-1828(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800015b4:	400a0a93          	addi	s5,s4,1024
    800015b8:	000a8513          	mv	a0,s5
    800015bc:	00001097          	auipc	ra,0x1
    800015c0:	8cc080e7          	jalr	-1844(ra) # 80001e88 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    800015c4:	480a2783          	lw	a5,1152(s4)
    800015c8:	fff7879b          	addiw	a5,a5,-1
    800015cc:	48fa2023          	sw	a5,1152(s4)
        T r = buffer[head];
    800015d0:	478a2783          	lw	a5,1144(s4)
    800015d4:	00fa0733          	add	a4,s4,a5
    800015d8:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    800015dc:	0017879b          	addiw	a5,a5,1
    800015e0:	41f7d71b          	sraiw	a4,a5,0x1f
    800015e4:	0167571b          	srliw	a4,a4,0x16
    800015e8:	00e787bb          	addw	a5,a5,a4
    800015ec:	3ff7f793          	andi	a5,a5,1023
    800015f0:	40e787bb          	subw	a5,a5,a4
    800015f4:	46fa2c23          	sw	a5,1144(s4)

        spaceAvailable.signal();
    800015f8:	450a0513          	addi	a0,s4,1104
    800015fc:	00001097          	auipc	ra,0x1
    80001600:	910080e7          	jalr	-1776(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001604:	000a8513          	mv	a0,s5
    80001608:	00001097          	auipc	ra,0x1
    8000160c:	904080e7          	jalr	-1788(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    80001610:	00048513          	mv	a0,s1
    80001614:	e0dff06f          	j	80001420 <_Z8usrEcallmmmmm+0x14c>

0000000080001618 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    80001618:	fb010113          	addi	sp,sp,-80
    8000161c:	04113423          	sd	ra,72(sp)
    80001620:	04813023          	sd	s0,64(sp)
    80001624:	02913c23          	sd	s1,56(sp)
    80001628:	03213823          	sd	s2,48(sp)
    8000162c:	03313423          	sd	s3,40(sp)
    80001630:	03413023          	sd	s4,32(sp)
    80001634:	01513c23          	sd	s5,24(sp)
    80001638:	05010413          	addi	s0,sp,80
    8000163c:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001640:	141027f3          	csrr	a5,sepc
    80001644:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001648:	fb843903          	ld	s2,-72(s0)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000164c:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001650:	100027f3          	csrr	a5,sstatus
    80001654:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001658:	fb043a03          	ld	s4,-80(s0)
    
    if(a0 == MA){
    8000165c:	00100793          	li	a5,1
    80001660:	0ef50663          	beq	a0,a5,8000174c <_Z8sysEcallmmmmm+0x134>
    80001664:	00050493          	mv	s1,a0
    80001668:	00060a93          	mv	s5,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    8000166c:	00200793          	li	a5,2
    80001670:	10f50c63          	beq	a0,a5,80001788 <_Z8sysEcallmmmmm+0x170>
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    80001674:	01100793          	li	a5,17
    80001678:	12f50463          	beq	a0,a5,800017a0 <_Z8sysEcallmmmmm+0x188>
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    8000167c:	01200793          	li	a5,18
    80001680:	14f50663          	beq	a0,a5,800017cc <_Z8sysEcallmmmmm+0x1b4>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    80001684:	01300793          	li	a5,19
    80001688:	16f50663          	beq	a0,a5,800017f4 <_Z8sysEcallmmmmm+0x1dc>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    8000168c:	06900793          	li	a5,105
    80001690:	18f50063          	beq	a0,a5,80001810 <_Z8sysEcallmmmmm+0x1f8>
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    80001694:	02100793          	li	a5,33
    80001698:	18f50663          	beq	a0,a5,80001824 <_Z8sysEcallmmmmm+0x20c>
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    8000169c:	02200793          	li	a5,34
    800016a0:	1cf50463          	beq	a0,a5,80001868 <_Z8sysEcallmmmmm+0x250>
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    800016a4:	02300793          	li	a5,35
    800016a8:	1ef50663          	beq	a0,a5,80001894 <_Z8sysEcallmmmmm+0x27c>
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    800016ac:	02400793          	li	a5,36
    800016b0:	1ef50c63          	beq	a0,a5,800018a8 <_Z8sysEcallmmmmm+0x290>
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    800016b4:	03100793          	li	a5,49
    800016b8:	20f50263          	beq	a0,a5,800018bc <_Z8sysEcallmmmmm+0x2a4>
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    800016bc:	04100793          	li	a5,65
    800016c0:	20f50a63          	beq	a0,a5,800018d4 <_Z8sysEcallmmmmm+0x2bc>
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    800016c4:	04200793          	li	a5,66
    800016c8:	08f51c63          	bne	a0,a5,80001760 <_Z8sysEcallmmmmm+0x148>
    {
        StdIO::obuffer->put((char)a1);
    800016cc:	00007797          	auipc	a5,0x7
    800016d0:	67c78793          	addi	a5,a5,1660 # 80008d48 <_ZN5StdIO7obufferE>
    800016d4:	0007ba03          	ld	s4,0(a5)
    800016d8:	0ff5f993          	andi	s3,a1,255
        spaceAvailable.wait();
    800016dc:	450a0513          	addi	a0,s4,1104
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	7a8080e7          	jalr	1960(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800016e8:	400a0a93          	addi	s5,s4,1024
    800016ec:	000a8513          	mv	a0,s5
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	798080e7          	jalr	1944(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    800016f8:	480a2783          	lw	a5,1152(s4)
    800016fc:	0017879b          	addiw	a5,a5,1
    80001700:	48fa2023          	sw	a5,1152(s4)
        buffer[tail]=c;
    80001704:	47ca2783          	lw	a5,1148(s4)
    80001708:	00fa0733          	add	a4,s4,a5
    8000170c:	01370023          	sb	s3,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80001710:	0017879b          	addiw	a5,a5,1
    80001714:	41f7d71b          	sraiw	a4,a5,0x1f
    80001718:	0167571b          	srliw	a4,a4,0x16
    8000171c:	00e787bb          	addw	a5,a5,a4
    80001720:	3ff7f793          	andi	a5,a5,1023
    80001724:	40e787bb          	subw	a5,a5,a4
    80001728:	46fa2e23          	sw	a5,1148(s4)
        itemAvailable.signal();
    8000172c:	428a0513          	addi	a0,s4,1064
    80001730:	00000097          	auipc	ra,0x0
    80001734:	7dc080e7          	jalr	2012(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80001738:	000a8513          	mv	a0,s5
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	7d0080e7          	jalr	2000(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001744:	00048513          	mv	a0,s1
    80001748:	0180006f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    8000174c:	00001097          	auipc	ra,0x1
    80001750:	9cc080e7          	jalr	-1588(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001754:	00098593          	mv	a1,s3
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	a34080e7          	jalr	-1484(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001760:	14191073          	csrw	sepc,s2
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80001764:	04813083          	ld	ra,72(sp)
    80001768:	04013403          	ld	s0,64(sp)
    8000176c:	03813483          	ld	s1,56(sp)
    80001770:	03013903          	ld	s2,48(sp)
    80001774:	02813983          	ld	s3,40(sp)
    80001778:	02013a03          	ld	s4,32(sp)
    8000177c:	01813a83          	ld	s5,24(sp)
    80001780:	05010113          	addi	sp,sp,80
    80001784:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	990080e7          	jalr	-1648(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001790:	00098593          	mv	a1,s3
    80001794:	00001097          	auipc	ra,0x1
    80001798:	bb4080e7          	jalr	-1100(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    8000179c:	fc5ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800017a0:	00070613          	mv	a2,a4
    800017a4:	00068593          	mv	a1,a3
    800017a8:	000a8513          	mv	a0,s5
    800017ac:	00002097          	auipc	ra,0x2
    800017b0:	ecc080e7          	jalr	-308(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800017b4:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    800017b8:	00050663          	beqz	a0,800017c4 <_Z8sysEcallmmmmm+0x1ac>
        else ret = 0;
    800017bc:	00000513          	li	a0,0
    800017c0:	fa1ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        if(!(*t)) ret = -4;
    800017c4:	ffc00513          	li	a0,-4
    800017c8:	f99ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        TCB::running->finish();
    800017cc:	00007797          	auipc	a5,0x7
    800017d0:	5bc78793          	addi	a5,a5,1468 # 80008d88 <_ZN3TCB7runningE>
    800017d4:	0007b783          	ld	a5,0(a5)
    800017d8:	00200713          	li	a4,2
    800017dc:	02e7a823          	sw	a4,48(a5)
        TCB::dispatch();
    800017e0:	00002097          	auipc	ra,0x2
    800017e4:	154080e7          	jalr	340(ra) # 80003934 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800017e8:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800017ec:	00048513          	mv	a0,s1
    800017f0:	f71ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        TCB::timeSliceCounter = 0; 
    800017f4:	00007797          	auipc	a5,0x7
    800017f8:	5807b623          	sd	zero,1420(a5) # 80008d80 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800017fc:	00002097          	auipc	ra,0x2
    80001800:	230080e7          	jalr	560(ra) # 80003a2c <_ZN3TCB5yieldEv>
    80001804:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001808:	00048513          	mv	a0,s1
    8000180c:	f55ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        TCB::deleteThread((TCB*)a1);
    80001810:	00058513          	mv	a0,a1
    80001814:	00002097          	auipc	ra,0x2
    80001818:	fb8080e7          	jalr	-72(ra) # 800037cc <_ZN3TCB12deleteThreadEPS_>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000181c:	00048513          	mv	a0,s1
    80001820:	f41ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
    80001824:	00001097          	auipc	ra,0x1
    80001828:	8f4080e7          	jalr	-1804(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    8000182c:	00100593          	li	a1,1
    80001830:	00001097          	auipc	ra,0x1
    80001834:	95c080e7          	jalr	-1700(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80001838:	01552423          	sw	s5,8(a0)
    8000183c:	00053823          	sd	zero,16(a0)
    80001840:	00053c23          	sd	zero,24(a0)
    80001844:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80001848:	00007797          	auipc	a5,0x7
    8000184c:	4e878793          	addi	a5,a5,1256 # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80001850:	0007b703          	ld	a4,0(a5)
    80001854:	00e53023          	sd	a4,0(a0)
        activeSemaphores = this;
    80001858:	00a7b023          	sd	a0,0(a5)
        *t = (uint64)(new KSemaphore(a2));
    8000185c:	00a9b023          	sd	a0,0(s3)
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001860:	00048513          	mv	a0,s1
    80001864:	efdff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        delete t;
    80001868:	ee058ce3          	beqz	a1,80001760 <_Z8sysEcallmmmmm+0x148>
    8000186c:	00058513          	mv	a0,a1
    80001870:	00000097          	auipc	ra,0x0
    80001874:	6f0080e7          	jalr	1776(ra) # 80001f60 <_ZN10KSemaphoreD1Ev>
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001878:	00001097          	auipc	ra,0x1
    8000187c:	8a0080e7          	jalr	-1888(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001880:	00098593          	mv	a1,s3
    80001884:	00001097          	auipc	ra,0x1
    80001888:	ac4080e7          	jalr	-1340(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    8000188c:	00048513          	mv	a0,s1
    80001890:	ed1ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        ret = t->wait();
    80001894:	00058513          	mv	a0,a1
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	5f0080e7          	jalr	1520(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
    800018a0:	100a1073          	csrw	sstatus,s4
    800018a4:	ebdff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        t->signal();
    800018a8:	00058513          	mv	a0,a1
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	660080e7          	jalr	1632(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800018b4:	00048513          	mv	a0,s1
    800018b8:	ea9ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        TCB::sleep(a1);
    800018bc:	00058513          	mv	a0,a1
    800018c0:	00002097          	auipc	ra,0x2
    800018c4:	1a4080e7          	jalr	420(ra) # 80003a64 <_ZN3TCB5sleepEm>
    800018c8:	100a1073          	csrw	sstatus,s4
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800018cc:	00048513          	mv	a0,s1
    800018d0:	e91ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>
        ret = StdIO::ibuffer->get();
    800018d4:	00007797          	auipc	a5,0x7
    800018d8:	47c78793          	addi	a5,a5,1148 # 80008d50 <_ZN5StdIO7ibufferE>
    800018dc:	0007b983          	ld	s3,0(a5)
        itemAvailable.wait();
    800018e0:	42898513          	addi	a0,s3,1064
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	5a4080e7          	jalr	1444(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    800018ec:	40098a13          	addi	s4,s3,1024
    800018f0:	000a0513          	mv	a0,s4
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	594080e7          	jalr	1428(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        tmpLen--;
    800018fc:	4809a783          	lw	a5,1152(s3)
    80001900:	fff7879b          	addiw	a5,a5,-1
    80001904:	48f9a023          	sw	a5,1152(s3)
        T r = buffer[head];
    80001908:	4789a783          	lw	a5,1144(s3)
    8000190c:	00f98733          	add	a4,s3,a5
    80001910:	00074483          	lbu	s1,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80001914:	0017879b          	addiw	a5,a5,1
    80001918:	41f7d71b          	sraiw	a4,a5,0x1f
    8000191c:	0167571b          	srliw	a4,a4,0x16
    80001920:	00e787bb          	addw	a5,a5,a4
    80001924:	3ff7f793          	andi	a5,a5,1023
    80001928:	40e787bb          	subw	a5,a5,a4
    8000192c:	46f9ac23          	sw	a5,1144(s3)
        spaceAvailable.signal();
    80001930:	45098513          	addi	a0,s3,1104
    80001934:	00000097          	auipc	ra,0x0
    80001938:	5d8080e7          	jalr	1496(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    8000193c:	000a0513          	mv	a0,s4
    80001940:	00000097          	auipc	ra,0x0
    80001944:	5cc080e7          	jalr	1484(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    80001948:	00048513          	mv	a0,s1
    8000194c:	e15ff06f          	j	80001760 <_Z8sysEcallmmmmm+0x148>

0000000080001950 <interrupt>:

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    80001950:	fd010113          	addi	sp,sp,-48
    80001954:	02113423          	sd	ra,40(sp)
    80001958:	02813023          	sd	s0,32(sp)
    8000195c:	00913c23          	sd	s1,24(sp)
    80001960:	01213823          	sd	s2,16(sp)
    80001964:	03010413          	addi	s0,sp,48
    asm volatile("csrr %0, scause" : "=r" (scause));
    80001968:	142027f3          	csrr	a5,scause
    8000196c:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80001970:	fd043483          	ld	s1,-48(s0)
    uint64 scause = Riscv::r_scause();
    //static bool panic = 0;

    if(scause == IS)
    80001974:	00900793          	li	a5,9
    80001978:	12f48263          	beq	s1,a5,80001a9c <interrupt+0x14c>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    8000197c:	00800793          	li	a5,8
    80001980:	14f48063          	beq	s1,a5,80001ac0 <interrupt+0x170>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    80001984:	fff00793          	li	a5,-1
    80001988:	03f79793          	slli	a5,a5,0x3f
    8000198c:	00978793          	addi	a5,a5,9
    80001990:	14f48063          	beq	s1,a5,80001ad0 <interrupt+0x180>
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    80001994:	fff00793          	li	a5,-1
    80001998:	03f79793          	slli	a5,a5,0x3f
    8000199c:	00178793          	addi	a5,a5,1
    800019a0:	12f48e63          	beq	s1,a5,80001adc <interrupt+0x18c>
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == II || scause == IR || scause == IW)
    800019a4:	00200793          	li	a5,2
    800019a8:	00f48a63          	beq	s1,a5,800019bc <interrupt+0x6c>
    800019ac:	00500793          	li	a5,5
    800019b0:	00f48663          	beq	s1,a5,800019bc <interrupt+0x6c>
    800019b4:	00700793          	li	a5,7
    800019b8:	0ef49863          	bne	s1,a5,80001aa8 <interrupt+0x158>
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
    800019bc:	00007797          	auipc	a5,0x7
    800019c0:	3cc78793          	addi	a5,a5,972 # 80008d88 <_ZN3TCB7runningE>
    800019c4:	0007b783          	ld	a5,0(a5)
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }
    bool isKernelThread() { return !userMode; } 
    800019c8:	0357c783          	lbu	a5,53(a5)
    800019cc:	10078e63          	beqz	a5,80001ae8 <interrupt+0x198>
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
    800019d0:	14302973          	csrr	s2,stval
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
    800019d4:	00005517          	auipc	a0,0x5
    800019d8:	64c50513          	addi	a0,a0,1612 # 80007020 <CONSOLE_STATUS+0x10>
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	1f4080e7          	jalr	500(ra) # 80001bd0 <_Z12kprintStringPKc>
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
    800019e4:	00005517          	auipc	a0,0x5
    800019e8:	67450513          	addi	a0,a0,1652 # 80007058 <CONSOLE_STATUS+0x48>
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	1e4080e7          	jalr	484(ra) # 80001bd0 <_Z12kprintStringPKc>
    800019f4:	01000593          	li	a1,16
    800019f8:	00048513          	mv	a0,s1
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	21c080e7          	jalr	540(ra) # 80001c18 <_Z9kprintIntmi>
    80001a04:	00006517          	auipc	a0,0x6
    80001a08:	83c50513          	addi	a0,a0,-1988 # 80007240 <CONSOLE_STATUS+0x230>
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	1c4080e7          	jalr	452(ra) # 80001bd0 <_Z12kprintStringPKc>
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
    80001a14:	00005517          	auipc	a0,0x5
    80001a18:	65450513          	addi	a0,a0,1620 # 80007068 <CONSOLE_STATUS+0x58>
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	1b4080e7          	jalr	436(ra) # 80001bd0 <_Z12kprintStringPKc>
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001a24:	141027f3          	csrr	a5,sepc
    80001a28:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001a2c:	fd843503          	ld	a0,-40(s0)
    80001a30:	01000593          	li	a1,16
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	1e4080e7          	jalr	484(ra) # 80001c18 <_Z9kprintIntmi>
    80001a3c:	00006517          	auipc	a0,0x6
    80001a40:	80450513          	addi	a0,a0,-2044 # 80007240 <CONSOLE_STATUS+0x230>
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	18c080e7          	jalr	396(ra) # 80001bd0 <_Z12kprintStringPKc>
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
    80001a4c:	00005517          	auipc	a0,0x5
    80001a50:	62450513          	addi	a0,a0,1572 # 80007070 <CONSOLE_STATUS+0x60>
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	17c080e7          	jalr	380(ra) # 80001bd0 <_Z12kprintStringPKc>
    80001a5c:	01000593          	li	a1,16
    80001a60:	00090513          	mv	a0,s2
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	1b4080e7          	jalr	436(ra) # 80001c18 <_Z9kprintIntmi>
    80001a6c:	00005517          	auipc	a0,0x5
    80001a70:	60c50513          	addi	a0,a0,1548 # 80007078 <CONSOLE_STATUS+0x68>
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	15c080e7          	jalr	348(ra) # 80001bd0 <_Z12kprintStringPKc>
            TCB::running->finish();
    80001a7c:	00007797          	auipc	a5,0x7
    80001a80:	30c78793          	addi	a5,a5,780 # 80008d88 <_ZN3TCB7runningE>
    80001a84:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    80001a88:	00200713          	li	a4,2
    80001a8c:	02e7a823          	sw	a4,48(a5)
            TCB::dispatch();
    80001a90:	00002097          	auipc	ra,0x2
    80001a94:	ea4080e7          	jalr	-348(ra) # 80003934 <_ZN3TCB8dispatchEv>
    80001a98:	0100006f          	j	80001aa8 <interrupt+0x158>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	b7c080e7          	jalr	-1156(ra) # 80001618 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80001aa4:	04a43823          	sd	a0,80(s0)
        }
    }
                    
    
    //print(a4);
    80001aa8:	02813083          	ld	ra,40(sp)
    80001aac:	02013403          	ld	s0,32(sp)
    80001ab0:	01813483          	ld	s1,24(sp)
    80001ab4:	01013903          	ld	s2,16(sp)
    80001ab8:	03010113          	addi	sp,sp,48
    80001abc:	00008067          	ret
        a0 = usrEcall(a0, a1, a2, a3, a4);
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	814080e7          	jalr	-2028(ra) # 800012d4 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    80001ac8:	04a43823          	sd	a0,80(s0)
    80001acc:	fddff06f          	j	80001aa8 <interrupt+0x158>
       StdIO::console_handler();
    80001ad0:	00001097          	auipc	ra,0x1
    80001ad4:	2e8080e7          	jalr	744(ra) # 80002db8 <_ZN5StdIO15console_handlerEv>
    80001ad8:	fd1ff06f          	j	80001aa8 <interrupt+0x158>
        timer_handler();      
    80001adc:	fffff097          	auipc	ra,0xfffff
    80001ae0:	75c080e7          	jalr	1884(ra) # 80001238 <_Z13timer_handlerv>
    80001ae4:	fc5ff06f          	j	80001aa8 <interrupt+0x158>
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
    80001ae8:	00005517          	auipc	a0,0x5
    80001aec:	59850513          	addi	a0,a0,1432 # 80007080 <CONSOLE_STATUS+0x70>
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	0e0080e7          	jalr	224(ra) # 80001bd0 <_Z12kprintStringPKc>
            TCB::panicDispatch();
    80001af8:	00002097          	auipc	ra,0x2
    80001afc:	fe0080e7          	jalr	-32(ra) # 80003ad8 <_ZN3TCB13panicDispatchEv>
    80001b00:	fa9ff06f          	j	80001aa8 <interrupt+0x158>

0000000080001b04 <_Z15userMainWrapperPv>:
#include"../h/kernel_lib.h"

void userMainWrapper(void*)
{
    80001b04:	ff010113          	addi	sp,sp,-16
    80001b08:	00113423          	sd	ra,8(sp)
    80001b0c:	00813023          	sd	s0,0(sp)
    80001b10:	01010413          	addi	s0,sp,16
    userMain();
    80001b14:	00002097          	auipc	ra,0x2
    80001b18:	3b8080e7          	jalr	952(ra) # 80003ecc <_Z8userMainv>
}
    80001b1c:	00813083          	ld	ra,8(sp)
    80001b20:	00013403          	ld	s0,0(sp)
    80001b24:	01010113          	addi	sp,sp,16
    80001b28:	00008067          	ret

0000000080001b2c <_Z12idleFunctionPv>:

void idleFunction(void*)
{
    80001b2c:	ff010113          	addi	sp,sp,-16
    80001b30:	00113423          	sd	ra,8(sp)
    80001b34:	00813023          	sd	s0,0(sp)
    80001b38:	01010413          	addi	s0,sp,16
    while(1){
        thread_dispatch();
    80001b3c:	00001097          	auipc	ra,0x1
    80001b40:	484080e7          	jalr	1156(ra) # 80002fc0 <thread_dispatch>
    80001b44:	ff9ff06f          	j	80001b3c <_Z12idleFunctionPv+0x10>

0000000080001b48 <_Z7kmallocm>:
    }
}

void* kmalloc(size_t size)
{
    80001b48:	fe010113          	addi	sp,sp,-32
    80001b4c:	00113c23          	sd	ra,24(sp)
    80001b50:	00813823          	sd	s0,16(sp)
    80001b54:	00913423          	sd	s1,8(sp)
    80001b58:	02010413          	addi	s0,sp,32
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    80001b5c:	fff50493          	addi	s1,a0,-1
    80001b60:	0064d493          	srli	s1,s1,0x6
    80001b64:	00148493          	addi	s1,s1,1
    return MemoryAllocator::getInstance().mem_alloc(size);
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	5b0080e7          	jalr	1456(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80001b70:	00048593          	mv	a1,s1
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	618080e7          	jalr	1560(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001b7c:	01813083          	ld	ra,24(sp)
    80001b80:	01013403          	ld	s0,16(sp)
    80001b84:	00813483          	ld	s1,8(sp)
    80001b88:	02010113          	addi	sp,sp,32
    80001b8c:	00008067          	ret

0000000080001b90 <_Z5kputcc>:

void kputc(char c){
    80001b90:	ff010113          	addi	sp,sp,-16
    80001b94:	00813423          	sd	s0,8(sp)
    80001b98:	01010413          	addi	s0,sp,16
    char* odata = (char*)CONSOLE_TX_DATA, 
    80001b9c:	00005797          	auipc	a5,0x5
    80001ba0:	46c78793          	addi	a5,a5,1132 # 80007008 <CONSOLE_TX_DATA>
    80001ba4:	0007b683          	ld	a3,0(a5)
    *iostatus = (char*)CONSOLE_STATUS;
    80001ba8:	00005797          	auipc	a5,0x5
    80001bac:	46878793          	addi	a5,a5,1128 # 80007010 <CONSOLE_STATUS>
    80001bb0:	0007b703          	ld	a4,0(a5)
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    80001bb4:	00074783          	lbu	a5,0(a4)
    80001bb8:	0207f793          	andi	a5,a5,32
    80001bbc:	fe078ce3          	beqz	a5,80001bb4 <_Z5kputcc+0x24>
    *odata = c;
    80001bc0:	00a68023          	sb	a0,0(a3)
}
    80001bc4:	00813403          	ld	s0,8(sp)
    80001bc8:	01010113          	addi	sp,sp,16
    80001bcc:	00008067          	ret

0000000080001bd0 <_Z12kprintStringPKc>:

void kprintString(const char* string)
{
    80001bd0:	fe010113          	addi	sp,sp,-32
    80001bd4:	00113c23          	sd	ra,24(sp)
    80001bd8:	00813823          	sd	s0,16(sp)
    80001bdc:	00913423          	sd	s1,8(sp)
    80001be0:	02010413          	addi	s0,sp,32
    80001be4:	00050493          	mv	s1,a0
    if(!string) return;
    80001be8:	00050e63          	beqz	a0,80001c04 <_Z12kprintStringPKc+0x34>
    while(*string)
    80001bec:	0004c503          	lbu	a0,0(s1)
    80001bf0:	00050a63          	beqz	a0,80001c04 <_Z12kprintStringPKc+0x34>
    {
        kputc(*string);
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	f9c080e7          	jalr	-100(ra) # 80001b90 <_Z5kputcc>
        string++;
    80001bfc:	00148493          	addi	s1,s1,1
    while(*string)
    80001c00:	fedff06f          	j	80001bec <_Z12kprintStringPKc+0x1c>
    }
}
    80001c04:	01813083          	ld	ra,24(sp)
    80001c08:	01013403          	ld	s0,16(sp)
    80001c0c:	00813483          	ld	s1,8(sp)
    80001c10:	02010113          	addi	sp,sp,32
    80001c14:	00008067          	ret

0000000080001c18 <_Z9kprintIntmi>:

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base){
    80001c18:	fd010113          	addi	sp,sp,-48
    80001c1c:	02113423          	sd	ra,40(sp)
    80001c20:	02813023          	sd	s0,32(sp)
    80001c24:	00913c23          	sd	s1,24(sp)
    80001c28:	03010413          	addi	s0,sp,48
    char buf[16];
    int i;

    i = 0;
    80001c2c:	00000793          	li	a5,0
    80001c30:	0080006f          	j	80001c38 <_Z9kprintIntmi+0x20>
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    80001c34:	00070513          	mv	a0,a4
        buf[i++] = kdigits[xx % base];
    80001c38:	02b576b3          	remu	a3,a0,a1
    80001c3c:	0017849b          	addiw	s1,a5,1
    80001c40:	00007717          	auipc	a4,0x7
    80001c44:	f1070713          	addi	a4,a4,-240 # 80008b50 <kdigits>
    80001c48:	00d70733          	add	a4,a4,a3
    80001c4c:	00074703          	lbu	a4,0(a4)
    80001c50:	fe040693          	addi	a3,s0,-32
    80001c54:	00f687b3          	add	a5,a3,a5
    80001c58:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80001c5c:	02b55733          	divu	a4,a0,a1
        buf[i++] = kdigits[xx % base];
    80001c60:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80001c64:	fcb578e3          	bgeu	a0,a1,80001c34 <_Z9kprintIntmi+0x1c>


    while(--i >= 0)
    80001c68:	fff4849b          	addiw	s1,s1,-1
    80001c6c:	0004ce63          	bltz	s1,80001c88 <_Z9kprintIntmi+0x70>
        kputc(buf[i]);
    80001c70:	fe040793          	addi	a5,s0,-32
    80001c74:	009787b3          	add	a5,a5,s1
    80001c78:	ff07c503          	lbu	a0,-16(a5)
    80001c7c:	00000097          	auipc	ra,0x0
    80001c80:	f14080e7          	jalr	-236(ra) # 80001b90 <_Z5kputcc>
    while(--i >= 0)
    80001c84:	fe5ff06f          	j	80001c68 <_Z9kprintIntmi+0x50>
    80001c88:	02813083          	ld	ra,40(sp)
    80001c8c:	02013403          	ld	s0,32(sp)
    80001c90:	01813483          	ld	s1,24(sp)
    80001c94:	03010113          	addi	sp,sp,48
    80001c98:	00008067          	ret

0000000080001c9c <_Z10kernelInitv>:
{
    80001c9c:	fd010113          	addi	sp,sp,-48
    80001ca0:	02113423          	sd	ra,40(sp)
    80001ca4:	02813023          	sd	s0,32(sp)
    80001ca8:	00913c23          	sd	s1,24(sp)
    80001cac:	01213823          	sd	s2,16(sp)
    80001cb0:	01313423          	sd	s3,8(sp)
    80001cb4:	03010413          	addi	s0,sp,48
    kprintString("--------------KERNEL INIT--------------\n");
    80001cb8:	00005517          	auipc	a0,0x5
    80001cbc:	40050513          	addi	a0,a0,1024 # 800070b8 <CONSOLE_STATUS+0xa8>
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	f10080e7          	jalr	-240(ra) # 80001bd0 <_Z12kprintStringPKc>
    kprintString("HEAP_START_ADDR: "); kprintInt((uint64)HEAP_START_ADDR,16); kprintString("\n");
    80001cc8:	00005517          	auipc	a0,0x5
    80001ccc:	42050513          	addi	a0,a0,1056 # 800070e8 <CONSOLE_STATUS+0xd8>
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	f00080e7          	jalr	-256(ra) # 80001bd0 <_Z12kprintStringPKc>
    80001cd8:	01000593          	li	a1,16
    80001cdc:	00007797          	auipc	a5,0x7
    80001ce0:	e6478793          	addi	a5,a5,-412 # 80008b40 <HEAP_START_ADDR>
    80001ce4:	0007b503          	ld	a0,0(a5)
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	f30080e7          	jalr	-208(ra) # 80001c18 <_Z9kprintIntmi>
    80001cf0:	00005517          	auipc	a0,0x5
    80001cf4:	55050513          	addi	a0,a0,1360 # 80007240 <CONSOLE_STATUS+0x230>
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	ed8080e7          	jalr	-296(ra) # 80001bd0 <_Z12kprintStringPKc>
    kprintString("HEAP_END_ADDR: "); kprintInt((uint64)HEAP_END_ADDR,16); kprintString("\n");
    80001d00:	00005517          	auipc	a0,0x5
    80001d04:	40050513          	addi	a0,a0,1024 # 80007100 <CONSOLE_STATUS+0xf0>
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	ec8080e7          	jalr	-312(ra) # 80001bd0 <_Z12kprintStringPKc>
    80001d10:	01000593          	li	a1,16
    80001d14:	00007797          	auipc	a5,0x7
    80001d18:	e2478793          	addi	a5,a5,-476 # 80008b38 <HEAP_END_ADDR>
    80001d1c:	0007b503          	ld	a0,0(a5)
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	ef8080e7          	jalr	-264(ra) # 80001c18 <_Z9kprintIntmi>
    80001d28:	00005517          	auipc	a0,0x5
    80001d2c:	51850513          	addi	a0,a0,1304 # 80007240 <CONSOLE_STATUS+0x230>
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	ea0080e7          	jalr	-352(ra) # 80001bd0 <_Z12kprintStringPKc>
    Riscv::w_stvec((uint64)interruptvec);
    80001d38:	fffff797          	auipc	a5,0xfffff
    80001d3c:	2c878793          	addi	a5,a5,712 # 80001000 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    80001d40:	10579073          	csrw	stvec,a5
    kprintString("stvec initalized!\n");
    80001d44:	00005517          	auipc	a0,0x5
    80001d48:	3cc50513          	addi	a0,a0,972 # 80007110 <CONSOLE_STATUS+0x100>
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	e84080e7          	jalr	-380(ra) # 80001bd0 <_Z12kprintStringPKc>
    MemoryAllocator::getInstance();
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	3c4080e7          	jalr	964(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    kprintString("MemoryAllocator initalized!\n");
    80001d5c:	00005517          	auipc	a0,0x5
    80001d60:	3cc50513          	addi	a0,a0,972 # 80007128 <CONSOLE_STATUS+0x118>
    80001d64:	00000097          	auipc	ra,0x0
    80001d68:	e6c080e7          	jalr	-404(ra) # 80001bd0 <_Z12kprintStringPKc>
    Scheduler::initalize();
    80001d6c:	00001097          	auipc	ra,0x1
    80001d70:	b68080e7          	jalr	-1176(ra) # 800028d4 <_ZN9Scheduler9initalizeEv>
    kprintString("Scheduler initalized!\n");
    80001d74:	00005517          	auipc	a0,0x5
    80001d78:	3d450513          	addi	a0,a0,980 # 80007148 <CONSOLE_STATUS+0x138>
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	e54080e7          	jalr	-428(ra) # 80001bd0 <_Z12kprintStringPKc>
    StdIO::initalize();
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	e34080e7          	jalr	-460(ra) # 80002bb8 <_ZN5StdIO9initalizeEv>
    kprintString("StdIO initalized!\n");
    80001d8c:	00005517          	auipc	a0,0x5
    80001d90:	3d450513          	addi	a0,a0,980 # 80007160 <CONSOLE_STATUS+0x150>
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	e3c080e7          	jalr	-452(ra) # 80001bd0 <_Z12kprintStringPKc>
    TCB::createMainKernelThread();
    80001d9c:	00002097          	auipc	ra,0x2
    80001da0:	ab4080e7          	jalr	-1356(ra) # 80003850 <_ZN3TCB22createMainKernelThreadEv>
    kprintString("Main kenrel thread initalized!\n");
    80001da4:	00005517          	auipc	a0,0x5
    80001da8:	3d450513          	addi	a0,a0,980 # 80007178 <CONSOLE_STATUS+0x168>
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	e24080e7          	jalr	-476(ra) # 80001bd0 <_Z12kprintStringPKc>
    kprintString("Initalizing user thread and idle thread...\n");
    80001db4:	00005517          	auipc	a0,0x5
    80001db8:	3e450513          	addi	a0,a0,996 # 80007198 <CONSOLE_STATUS+0x188>
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	e14080e7          	jalr	-492(ra) # 80001bd0 <_Z12kprintStringPKc>
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80001dc4:	00001537          	lui	a0,0x1
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	d80080e7          	jalr	-640(ra) # 80001b48 <_Z7kmallocm>
    80001dd0:	00050493          	mv	s1,a0
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    80001dd4:	00050613          	mv	a2,a0
    80001dd8:	00000593          	li	a1,0
    80001ddc:	00000517          	auipc	a0,0x0
    80001de0:	d2850513          	addi	a0,a0,-728 # 80001b04 <_Z15userMainWrapperPv>
    80001de4:	00002097          	auipc	ra,0x2
    80001de8:	894080e7          	jalr	-1900(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001dec:	00050993          	mv	s3,a0
    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    80001df0:	00001537          	lui	a0,0x1
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	d54080e7          	jalr	-684(ra) # 80001b48 <_Z7kmallocm>
    80001dfc:	00050913          	mv	s2,a0
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    80001e00:	00050613          	mv	a2,a0
    80001e04:	00000593          	li	a1,0
    80001e08:	00000517          	auipc	a0,0x0
    80001e0c:	d2450513          	addi	a0,a0,-732 # 80001b2c <_Z12idleFunctionPv>
    80001e10:	00002097          	auipc	ra,0x2
    80001e14:	868080e7          	jalr	-1944(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
    80001e18:	04048863          	beqz	s1,80001e68 <_Z10kernelInitv+0x1cc>
    80001e1c:	04090a63          	beqz	s2,80001e70 <_Z10kernelInitv+0x1d4>
    80001e20:	04050c63          	beqz	a0,80001e78 <_Z10kernelInitv+0x1dc>
    80001e24:	04098e63          	beqz	s3,80001e80 <_Z10kernelInitv+0x1e4>
        kprintString("Threads successfully initalized!\n");
    80001e28:	00005517          	auipc	a0,0x5
    80001e2c:	3a050513          	addi	a0,a0,928 # 800071c8 <CONSOLE_STATUS+0x1b8>
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	da0080e7          	jalr	-608(ra) # 80001bd0 <_Z12kprintStringPKc>
    kprintString("-----------KERNEL INITALIZED-----------\n\n");
    80001e38:	00005517          	auipc	a0,0x5
    80001e3c:	3b850513          	addi	a0,a0,952 # 800071f0 <CONSOLE_STATUS+0x1e0>
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	d90080e7          	jalr	-624(ra) # 80001bd0 <_Z12kprintStringPKc>
    return 0;
    80001e48:	00000513          	li	a0,0
}
    80001e4c:	02813083          	ld	ra,40(sp)
    80001e50:	02013403          	ld	s0,32(sp)
    80001e54:	01813483          	ld	s1,24(sp)
    80001e58:	01013903          	ld	s2,16(sp)
    80001e5c:	00813983          	ld	s3,8(sp)
    80001e60:	03010113          	addi	sp,sp,48
    80001e64:	00008067          	ret
        return -1;
    80001e68:	fff00513          	li	a0,-1
    80001e6c:	fe1ff06f          	j	80001e4c <_Z10kernelInitv+0x1b0>
    80001e70:	fff00513          	li	a0,-1
    80001e74:	fd9ff06f          	j	80001e4c <_Z10kernelInitv+0x1b0>
    80001e78:	fff00513          	li	a0,-1
    80001e7c:	fd1ff06f          	j	80001e4c <_Z10kernelInitv+0x1b0>
    80001e80:	fff00513          	li	a0,-1
    80001e84:	fc9ff06f          	j	80001e4c <_Z10kernelInitv+0x1b0>

0000000080001e88 <_ZN10KSemaphore4waitEv>:
#include"../h/KInclude.hpp"

KSemaphore* KSemaphore::activeSemaphores = nullptr;

int KSemaphore::wait(){
    if(val > 0)
    80001e88:	00852783          	lw	a5,8(a0)
    80001e8c:	00078a63          	beqz	a5,80001ea0 <_ZN10KSemaphore4waitEv+0x18>
    {
        val--;
    80001e90:	fff7879b          	addiw	a5,a5,-1
    80001e94:	00f52423          	sw	a5,8(a0)
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
    80001e98:	00000513          	li	a0,0
}
    80001e9c:	00008067          	ret
int KSemaphore::wait(){
    80001ea0:	fe010113          	addi	sp,sp,-32
    80001ea4:	00113c23          	sd	ra,24(sp)
    80001ea8:	00813823          	sd	s0,16(sp)
    80001eac:	00913423          	sd	s1,8(sp)
    80001eb0:	02010413          	addi	s0,sp,32
        TCB::running->setState(TCB::BLOCKED);
    80001eb4:	00007497          	auipc	s1,0x7
    80001eb8:	ed448493          	addi	s1,s1,-300 # 80008d88 <_ZN3TCB7runningE>
    80001ebc:	0004b583          	ld	a1,0(s1)
    void setState(TCBState s) {state = s;}
    80001ec0:	0205a823          	sw	zero,48(a1)
        blocked.insert(TCB::running);
    80001ec4:	01050513          	addi	a0,a0,16
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	700080e7          	jalr	1792(ra) # 800025c8 <_ZN8TcbQueue6insertEP3TCB>
        TCB::yield();
    80001ed0:	00002097          	auipc	ra,0x2
    80001ed4:	b5c080e7          	jalr	-1188(ra) # 80003a2c <_ZN3TCB5yieldEv>
        if(TCB::running->getState() != TCB::BLOCKED)
    80001ed8:	0004b783          	ld	a5,0(s1)
    TCBState getState() const{ return state; }
    80001edc:	0307a703          	lw	a4,48(a5)
    80001ee0:	02071263          	bnez	a4,80001f04 <_ZN10KSemaphore4waitEv+0x7c>
    void setState(TCBState s) {state = s;}
    80001ee4:	00100713          	li	a4,1
    80001ee8:	02e7a823          	sw	a4,48(a5)
    return 0;
    80001eec:	00000513          	li	a0,0
}
    80001ef0:	01813083          	ld	ra,24(sp)
    80001ef4:	01013403          	ld	s0,16(sp)
    80001ef8:	00813483          	ld	s1,8(sp)
    80001efc:	02010113          	addi	sp,sp,32
    80001f00:	00008067          	ret
            return -2;
    80001f04:	ffe00513          	li	a0,-2
    80001f08:	fe9ff06f          	j	80001ef0 <_ZN10KSemaphore4waitEv+0x68>

0000000080001f0c <_ZN10KSemaphore6signalEv>:
   
    TCB* remove();

    TCB* top();

    bool isEmpty() { return !head; }
    80001f0c:	01053783          	ld	a5,16(a0)

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
    80001f10:	02078e63          	beqz	a5,80001f4c <_ZN10KSemaphore6signalEv+0x40>
{
    80001f14:	ff010113          	addi	sp,sp,-16
    80001f18:	00113423          	sd	ra,8(sp)
    80001f1c:	00813023          	sd	s0,0(sp)
    80001f20:	01010413          	addi	s0,sp,16
        Scheduler::put(blocked.remove());
    80001f24:	01050513          	addi	a0,a0,16
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	6e0080e7          	jalr	1760(ra) # 80002608 <_ZN8TcbQueue6removeEv>
    80001f30:	00001097          	auipc	ra,0x1
    80001f34:	970080e7          	jalr	-1680(ra) # 800028a0 <_ZN9Scheduler3putEP3TCB>
    else
        val++;
    return 0;
}
    80001f38:	00000513          	li	a0,0
    80001f3c:	00813083          	ld	ra,8(sp)
    80001f40:	00013403          	ld	s0,0(sp)
    80001f44:	01010113          	addi	sp,sp,16
    80001f48:	00008067          	ret
        val++;
    80001f4c:	00852783          	lw	a5,8(a0)
    80001f50:	0017879b          	addiw	a5,a5,1
    80001f54:	00f52423          	sw	a5,8(a0)
}
    80001f58:	00000513          	li	a0,0
    80001f5c:	00008067          	ret

0000000080001f60 <_ZN10KSemaphoreD1Ev>:

KSemaphore::~KSemaphore()
    80001f60:	fe010113          	addi	sp,sp,-32
    80001f64:	00113c23          	sd	ra,24(sp)
    80001f68:	00813823          	sd	s0,16(sp)
    80001f6c:	00913423          	sd	s1,8(sp)
    80001f70:	02010413          	addi	s0,sp,32
    80001f74:	00050493          	mv	s1,a0
    80001f78:	0104b783          	ld	a5,16(s1)
{
    while(!blocked.isEmpty()){
    80001f7c:	02078263          	beqz	a5,80001fa0 <_ZN10KSemaphoreD1Ev+0x40>
        TCB* t = blocked.remove();
    80001f80:	01048513          	addi	a0,s1,16
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	684080e7          	jalr	1668(ra) # 80002608 <_ZN8TcbQueue6removeEv>
    80001f8c:	00100793          	li	a5,1
    80001f90:	02f52823          	sw	a5,48(a0)
        t->setState(TCB::READY);
        Scheduler::put(t);
    80001f94:	00001097          	auipc	ra,0x1
    80001f98:	90c080e7          	jalr	-1780(ra) # 800028a0 <_ZN9Scheduler3putEP3TCB>
    while(!blocked.isEmpty()){
    80001f9c:	fddff06f          	j	80001f78 <_ZN10KSemaphoreD1Ev+0x18>
    }
}
    80001fa0:	01813083          	ld	ra,24(sp)
    80001fa4:	01013403          	ld	s0,16(sp)
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	02010113          	addi	sp,sp,32
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZN10KSemaphore5closeEPS_>:

int KSemaphore::close(KSemaphore* sem)
{
    80001fb4:	fe010113          	addi	sp,sp,-32
    80001fb8:	00113c23          	sd	ra,24(sp)
    80001fbc:	00813823          	sd	s0,16(sp)
    80001fc0:	00913423          	sd	s1,8(sp)
    80001fc4:	02010413          	addi	s0,sp,32
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    80001fc8:	00007797          	auipc	a5,0x7
    80001fcc:	d6878793          	addi	a5,a5,-664 # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80001fd0:	0007b483          	ld	s1,0(a5)
    80001fd4:	00000793          	li	a5,0
    while(cur)
    80001fd8:	00048a63          	beqz	s1,80001fec <_ZN10KSemaphore5closeEPS_+0x38>
    {
        if(cur == sem)
    80001fdc:	00a48863          	beq	s1,a0,80001fec <_ZN10KSemaphore5closeEPS_+0x38>
            break;
        prev = cur;
    80001fe0:	00048793          	mv	a5,s1
        cur = cur->next;
    80001fe4:	0004b483          	ld	s1,0(s1)
    while(cur)
    80001fe8:	ff1ff06f          	j	80001fd8 <_ZN10KSemaphore5closeEPS_+0x24>
    }
    if(cur)
    80001fec:	04048e63          	beqz	s1,80002048 <_ZN10KSemaphore5closeEPS_+0x94>
    {
        if(prev)
    80001ff0:	04078463          	beqz	a5,80002038 <_ZN10KSemaphore5closeEPS_+0x84>
            prev->next = cur->next;
    80001ff4:	0004b703          	ld	a4,0(s1)
    80001ff8:	00e7b023          	sd	a4,0(a5)
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
    80001ffc:	0004b023          	sd	zero,0(s1)
        delete cur;
    80002000:	00048513          	mv	a0,s1
    80002004:	00000097          	auipc	ra,0x0
    80002008:	f5c080e7          	jalr	-164(ra) # 80001f60 <_ZN10KSemaphoreD1Ev>
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	10c080e7          	jalr	268(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80002014:	00048593          	mv	a1,s1
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	330080e7          	jalr	816(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
        return 0;
    80002020:	00000513          	li	a0,0
    }
    else return -1;

}
    80002024:	01813083          	ld	ra,24(sp)
    80002028:	01013403          	ld	s0,16(sp)
    8000202c:	00813483          	ld	s1,8(sp)
    80002030:	02010113          	addi	sp,sp,32
    80002034:	00008067          	ret
            activeSemaphores = cur->next;
    80002038:	0004b783          	ld	a5,0(s1)
    8000203c:	00007717          	auipc	a4,0x7
    80002040:	cef73a23          	sd	a5,-780(a4) # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80002044:	fb9ff06f          	j	80001ffc <_ZN10KSemaphore5closeEPS_+0x48>
    else return -1;
    80002048:	fff00513          	li	a0,-1
    8000204c:	fd9ff06f          	j	80002024 <_ZN10KSemaphore5closeEPS_+0x70>

0000000080002050 <_ZN10KSemaphore6existsEPS_>:

bool KSemaphore::exists(KSemaphore* sem)
{
    80002050:	ff010113          	addi	sp,sp,-16
    80002054:	00813423          	sd	s0,8(sp)
    80002058:	01010413          	addi	s0,sp,16
    KSemaphore* cur = activeSemaphores;
    8000205c:	00007797          	auipc	a5,0x7
    80002060:	cd478793          	addi	a5,a5,-812 # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80002064:	0007b783          	ld	a5,0(a5)
    while(cur)
    80002068:	00078863          	beqz	a5,80002078 <_ZN10KSemaphore6existsEPS_+0x28>
    {
        if(cur == sem)
    8000206c:	00a78e63          	beq	a5,a0,80002088 <_ZN10KSemaphore6existsEPS_+0x38>
            return true;
        cur = cur->next;
    80002070:	0007b783          	ld	a5,0(a5)
    while(cur)
    80002074:	ff5ff06f          	j	80002068 <_ZN10KSemaphore6existsEPS_+0x18>
    }
    return false;
    80002078:	00000513          	li	a0,0
}
    8000207c:	00813403          	ld	s0,8(sp)
    80002080:	01010113          	addi	sp,sp,16
    80002084:	00008067          	ret
            return true;
    80002088:	00100513          	li	a0,1
    8000208c:	ff1ff06f          	j	8000207c <_ZN10KSemaphore6existsEPS_+0x2c>

0000000080002090 <main>:
#include"../h/kernel_lib.h"

int main(){
    80002090:	fd010113          	addi	sp,sp,-48
    80002094:	02113423          	sd	ra,40(sp)
    80002098:	02813023          	sd	s0,32(sp)
    8000209c:	00913c23          	sd	s1,24(sp)
    800020a0:	03010413          	addi	s0,sp,48
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    800020a4:	00008513          	mv	a0,ra
    asm volatile("mv %0, sp" : "=r" (sp));
    800020a8:	00010593          	mv	a1,sp
    TCB::setPanicContext(ra,sp);
    800020ac:	00002097          	auipc	ra,0x2
    800020b0:	a04080e7          	jalr	-1532(ra) # 80003ab0 <_ZN3TCB15setPanicContextEmm>

    int panic = kernelInit();
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	be8080e7          	jalr	-1048(ra) # 80001c9c <_Z10kernelInitv>
    if(panic < 0){
    800020bc:	04054263          	bltz	a0,80002100 <main+0x70>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800020c0:	100027f3          	csrr	a5,sstatus
    800020c4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800020c8:	fd843483          	ld	s1,-40(s0)
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    800020cc:	00002097          	auipc	ra,0x2
    800020d0:	960080e7          	jalr	-1696(ra) # 80003a2c <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800020d4:	10049073          	csrw	sstatus,s1
    Riscv::w_sstatus(sstatus);
    

    kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    800020d8:	00005517          	auipc	a0,0x5
    800020dc:	17050513          	addi	a0,a0,368 # 80007248 <CONSOLE_STATUS+0x238>
    800020e0:	00000097          	auipc	ra,0x0
    800020e4:	af0080e7          	jalr	-1296(ra) # 80001bd0 <_Z12kprintStringPKc>
    return 0;
    800020e8:	00000513          	li	a0,0
    800020ec:	02813083          	ld	ra,40(sp)
    800020f0:	02013403          	ld	s0,32(sp)
    800020f4:	01813483          	ld	s1,24(sp)
    800020f8:	03010113          	addi	sp,sp,48
    800020fc:	00008067          	ret
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
    80002100:	00005517          	auipc	a0,0x5
    80002104:	12050513          	addi	a0,a0,288 # 80007220 <CONSOLE_STATUS+0x210>
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	ac8080e7          	jalr	-1336(ra) # 80001bd0 <_Z12kprintStringPKc>
        return -1;
    80002110:	fff00513          	li	a0,-1
    80002114:	fd9ff06f          	j	800020ec <main+0x5c>

0000000080002118 <_ZN15MemoryAllocator11getInstanceEv>:
#include"../h/memory_allocator.hpp"
#include"../h/kernel_funs.h"
MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80002118:	ff010113          	addi	sp,sp,-16
    8000211c:	00813423          	sd	s0,8(sp)
    80002120:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80002124:	00007797          	auipc	a5,0x7
    80002128:	cac7c783          	lbu	a5,-852(a5) # 80008dd0 <_ZN15MemoryAllocator9allocatorE>
    8000212c:	04079663          	bnez	a5,80002178 <_ZN15MemoryAllocator11getInstanceEv+0x60>
        allocator.fall_head = nullptr;
    80002130:	00007717          	auipc	a4,0x7
    80002134:	ca070713          	addi	a4,a4,-864 # 80008dd0 <_ZN15MemoryAllocator9allocatorE>
    80002138:	00073823          	sd	zero,16(a4)
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    8000213c:	00007697          	auipc	a3,0x7
    80002140:	a0468693          	addi	a3,a3,-1532 # 80008b40 <HEAP_START_ADDR>
    80002144:	0006b783          	ld	a5,0(a3)
    80002148:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    8000214c:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    80002150:	00007797          	auipc	a5,0x7
    80002154:	9e878793          	addi	a5,a5,-1560 # 80008b38 <HEAP_END_ADDR>
    80002158:	0007b783          	ld	a5,0(a5)
    8000215c:	0006b683          	ld	a3,0(a3)
    80002160:	40d787b3          	sub	a5,a5,a3
    80002164:	00873683          	ld	a3,8(a4)
    80002168:	ff078793          	addi	a5,a5,-16
    8000216c:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    80002170:	00100793          	li	a5,1
    80002174:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    80002178:	00007517          	auipc	a0,0x7
    8000217c:	c5850513          	addi	a0,a0,-936 # 80008dd0 <_ZN15MemoryAllocator9allocatorE>
    80002180:	00813403          	ld	s0,8(sp)
    80002184:	01010113          	addi	sp,sp,16
    80002188:	00008067          	ret

000000008000218c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    8000218c:	ff010113          	addi	sp,sp,-16
    80002190:	00813423          	sd	s0,8(sp)
    80002194:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80002198:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    8000219c:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800021a0:	00000613          	li	a2,0
    800021a4:	00000893          	li	a7,0
    800021a8:	00000713          	li	a4,0
    800021ac:	0140006f          	j	800021c0 <_ZN15MemoryAllocator9mem_allocEm+0x34>

    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    800021b0:	00060893          	mv	a7,a2
                best = curr;     
    800021b4:	00078713          	mv	a4,a5
            }
        prev = curr;
    800021b8:	00078613          	mv	a2,a5
        curr = curr->next;
    800021bc:	0007b783          	ld	a5,0(a5)
    while(curr){
    800021c0:	02078263          	beqz	a5,800021e4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    800021c4:	0087b683          	ld	a3,8(a5)
    800021c8:	feb6e8e3          	bltu	a3,a1,800021b8 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    800021cc:	fe0702e3          	beqz	a4,800021b0 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    800021d0:	00873803          	ld	a6,8(a4)
    800021d4:	ff06f2e3          	bgeu	a3,a6,800021b8 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    800021d8:	00060893          	mv	a7,a2
                best = curr;     
    800021dc:	00078713          	mv	a4,a5
    800021e0:	fd9ff06f          	j	800021b8 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    800021e4:	02070863          	beqz	a4,80002214 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    800021e8:	00873783          	ld	a5,8(a4)
    800021ec:	40b787b3          	sub	a5,a5,a1
    800021f0:	04f00693          	li	a3,79
    800021f4:	02f6ee63          	bltu	a3,a5,80002230 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(!best_prev) fmem_head = best->next;
    800021f8:	02088663          	beqz	a7,80002224 <_ZN15MemoryAllocator9mem_allocEm+0x98>
        else best_prev->next = best->next;
    800021fc:	00073783          	ld	a5,0(a4)
    80002200:	00f8b023          	sd	a5,0(a7)
        curr->size = best->size - size - sizeof(FreeSegment);
        best->size = size;
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    best->next = fall_head;
    80002204:	01053783          	ld	a5,16(a0)
    80002208:	00f73023          	sd	a5,0(a4)
    fall_head = best;
    8000220c:	00e53823          	sd	a4,16(a0)
    return (char*)best+sizeof(FreeSegment);
    80002210:	01070713          	addi	a4,a4,16
}
    80002214:	00070513          	mv	a0,a4
    80002218:	00813403          	ld	s0,8(sp)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80002224:	00073783          	ld	a5,0(a4)
    80002228:	00f53423          	sd	a5,8(a0)
    8000222c:	fd9ff06f          	j	80002204 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    80002230:	01058793          	addi	a5,a1,16
    80002234:	00f707b3          	add	a5,a4,a5
        curr->next = best->next;
    80002238:	00073683          	ld	a3,0(a4)
    8000223c:	00d7b023          	sd	a3,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    80002240:	00873683          	ld	a3,8(a4)
    80002244:	40b686b3          	sub	a3,a3,a1
    80002248:	ff068693          	addi	a3,a3,-16
    8000224c:	00d7b423          	sd	a3,8(a5)
        best->size = size;
    80002250:	00b73423          	sd	a1,8(a4)
        if(best_prev) best_prev->next = curr;
    80002254:	00088663          	beqz	a7,80002260 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80002258:	00f8b023          	sd	a5,0(a7)
    8000225c:	fa9ff06f          	j	80002204 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    80002260:	00f53423          	sd	a5,8(a0)
    80002264:	fa1ff06f          	j	80002204 <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080002268 <_ZN15MemoryAllocator17wantToFreeAddressEPv>:

bool MemoryAllocator::wantToFreeAddress(void* adr){
    80002268:	ff010113          	addi	sp,sp,-16
    8000226c:	00813423          	sd	s0,8(sp)
    80002270:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80002274:	00007797          	auipc	a5,0x7
    80002278:	8cc78793          	addi	a5,a5,-1844 # 80008b40 <HEAP_START_ADDR>
    8000227c:	0007b783          	ld	a5,0(a5)
    80002280:	04f5ee63          	bltu	a1,a5,800022dc <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x74>
    80002284:	00007797          	auipc	a5,0x7
    80002288:	8b478793          	addi	a5,a5,-1868 # 80008b38 <HEAP_END_ADDR>
    8000228c:	0007b783          	ld	a5,0(a5)
    80002290:	04f5fe63          	bgeu	a1,a5,800022ec <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x84>
        return true;
    size_t t = (size_t)adr;
    FreeSegment* prev = nullptr, *cur = fall_head;
    80002294:	01053783          	ld	a5,16(a0)
    80002298:	00000693          	li	a3,0
    while(cur)
    8000229c:	00078c63          	beqz	a5,800022b4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
    {
        if(t == (size_t)cur+sizeof(FreeSegment))
    800022a0:	01078713          	addi	a4,a5,16
    800022a4:	00b70863          	beq	a4,a1,800022b4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x4c>
            break;
        prev = cur;
    800022a8:	00078693          	mv	a3,a5
        cur = cur->next;
    800022ac:	0007b783          	ld	a5,0(a5)
    while(cur)
    800022b0:	fedff06f          	j	8000229c <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x34>
    }
    if(cur)
    800022b4:	04078063          	beqz	a5,800022f4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x8c>
    {
        if(prev)
    800022b8:	00068c63          	beqz	a3,800022d0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x68>
            prev->next = cur->next;
    800022bc:	0007b703          	ld	a4,0(a5)
    800022c0:	00e6b023          	sd	a4,0(a3)
        else
            fall_head = cur->next;
        cur->next = nullptr;
    800022c4:	0007b023          	sd	zero,0(a5)
        return false;
    800022c8:	00000513          	li	a0,0
    800022cc:	0140006f          	j	800022e0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
            fall_head = cur->next;
    800022d0:	0007b703          	ld	a4,0(a5)
    800022d4:	00e53823          	sd	a4,16(a0)
    800022d8:	fedff06f          	j	800022c4 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x5c>
        return true;
    800022dc:	00100513          	li	a0,1
    }
    else return true;
}
    800022e0:	00813403          	ld	s0,8(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret
        return true;
    800022ec:	00100513          	li	a0,1
    800022f0:	ff1ff06f          	j	800022e0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>
    else return true;
    800022f4:	00100513          	li	a0,1
    800022f8:	fe9ff06f          	j	800022e0 <_ZN15MemoryAllocator17wantToFreeAddressEPv+0x78>

00000000800022fc <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    800022fc:	ff010113          	addi	sp,sp,-16
    80002300:	00813423          	sd	s0,8(sp)
    80002304:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80002308:	0085b703          	ld	a4,8(a1)
    8000230c:	01070793          	addi	a5,a4,16
    80002310:	00f587b3          	add	a5,a1,a5
    80002314:	0005b503          	ld	a0,0(a1)
    80002318:	00a78863          	beq	a5,a0,80002328 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    8000231c:	00813403          	ld	s0,8(sp)
    80002320:	01010113          	addi	sp,sp,16
    80002324:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80002328:	00853783          	ld	a5,8(a0)
    8000232c:	00f70733          	add	a4,a4,a5
    80002330:	01070713          	addi	a4,a4,16
    80002334:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    80002338:	00053783          	ld	a5,0(a0)
    8000233c:	00f5b023          	sd	a5,0(a1)
        return t;
    80002340:	00058513          	mv	a0,a1
    80002344:	fd9ff06f          	j	8000231c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

0000000080002348 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80002348:	fd010113          	addi	sp,sp,-48
    8000234c:	02113423          	sd	ra,40(sp)
    80002350:	02813023          	sd	s0,32(sp)
    80002354:	00913c23          	sd	s1,24(sp)
    80002358:	01213823          	sd	s2,16(sp)
    8000235c:	01313423          	sd	s3,8(sp)
    80002360:	01413023          	sd	s4,0(sp)
    80002364:	03010413          	addi	s0,sp,48
    80002368:	00050993          	mv	s3,a0
    8000236c:	00058913          	mv	s2,a1
    if(wantToFreeAddress(adr)) return -1;
    80002370:	00000097          	auipc	ra,0x0
    80002374:	ef8080e7          	jalr	-264(ra) # 80002268 <_ZN15MemoryAllocator17wantToFreeAddressEPv>
    80002378:	0a051063          	bnez	a0,80002418 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    8000237c:	0089b783          	ld	a5,8(s3)
    80002380:	00078863          	beqz	a5,80002390 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80002384:	ff090a13          	addi	s4,s2,-16
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80002388:	00000493          	li	s1,0
    8000238c:	01c0006f          	j	800023a8 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80002390:	ff090913          	addi	s2,s2,-16
    80002394:	0129b423          	sd	s2,8(s3)
    80002398:	0540006f          	j	800023ec <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    8000239c:	00f96e63          	bltu	s2,a5,800023b8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    800023a0:	00078493          	mv	s1,a5
    800023a4:	0007b783          	ld	a5,0(a5)
    800023a8:	00078863          	beqz	a5,800023b8 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    800023ac:	fe0488e3          	beqz	s1,8000239c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800023b0:	ff24f8e3          	bgeu	s1,s2,800023a0 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800023b4:	fe9ff06f          	j	8000239c <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        newsgm->next = cur;
    800023b8:	fef93823          	sd	a5,-16(s2)
        if(cur)
    800023bc:	00078a63          	beqz	a5,800023d0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    800023c0:	000a0593          	mv	a1,s4
    800023c4:	00098513          	mv	a0,s3
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	f34080e7          	jalr	-204(ra) # 800022fc <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    800023d0:	02048e63          	beqz	s1,8000240c <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    800023d4:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    800023d8:	00048593          	mv	a1,s1
    800023dc:	00098513          	mv	a0,s3
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	f1c080e7          	jalr	-228(ra) # 800022fc <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    800023e8:	00000513          	li	a0,0
}
    800023ec:	02813083          	ld	ra,40(sp)
    800023f0:	02013403          	ld	s0,32(sp)
    800023f4:	01813483          	ld	s1,24(sp)
    800023f8:	01013903          	ld	s2,16(sp)
    800023fc:	00813983          	ld	s3,8(sp)
    80002400:	00013a03          	ld	s4,0(sp)
    80002404:	03010113          	addi	sp,sp,48
    80002408:	00008067          	ret
            fmem_head = newsgm;
    8000240c:	0149b423          	sd	s4,8(s3)
    return 0;
    80002410:	00000513          	li	a0,0
    80002414:	fd9ff06f          	j	800023ec <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(wantToFreeAddress(adr)) return -1;
    80002418:	fff00513          	li	a0,-1
    8000241c:	fd1ff06f          	j	800023ec <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080002420 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80002420:	fe010113          	addi	sp,sp,-32
    80002424:	00113c23          	sd	ra,24(sp)
    80002428:	00813823          	sd	s0,16(sp)
    8000242c:	00913423          	sd	s1,8(sp)
    80002430:	02010413          	addi	s0,sp,32
    80002434:	00050493          	mv	s1,a0

    kprintString("------Free Segment Lista------\n");
    80002438:	00005517          	auipc	a0,0x5
    8000243c:	e3050513          	addi	a0,a0,-464 # 80007268 <CONSOLE_STATUS+0x258>
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	790080e7          	jalr	1936(ra) # 80001bd0 <_Z12kprintStringPKc>
    if(!fmem_head)
    80002448:	0084b783          	ld	a5,8(s1)
    8000244c:	04078a63          	beqz	a5,800024a0 <_ZN15MemoryAllocator10print_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002450:	0084b483          	ld	s1,8(s1)
    80002454:	06048063          	beqz	s1,800024b4 <_ZN15MemoryAllocator10print_listEv+0x94>
        kprintInt((uint64)curr);
    80002458:	00a00593          	li	a1,10
    8000245c:	00048513          	mv	a0,s1
    80002460:	fffff097          	auipc	ra,0xfffff
    80002464:	7b8080e7          	jalr	1976(ra) # 80001c18 <_Z9kprintIntmi>
        kprintString("\n");
    80002468:	00005517          	auipc	a0,0x5
    8000246c:	dd850513          	addi	a0,a0,-552 # 80007240 <CONSOLE_STATUS+0x230>
    80002470:	fffff097          	auipc	ra,0xfffff
    80002474:	760080e7          	jalr	1888(ra) # 80001bd0 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80002478:	00a00593          	li	a1,10
    8000247c:	0084b503          	ld	a0,8(s1)
    80002480:	fffff097          	auipc	ra,0xfffff
    80002484:	798080e7          	jalr	1944(ra) # 80001c18 <_Z9kprintIntmi>
        kprintString("\n");
    80002488:	00005517          	auipc	a0,0x5
    8000248c:	db850513          	addi	a0,a0,-584 # 80007240 <CONSOLE_STATUS+0x230>
    80002490:	fffff097          	auipc	ra,0xfffff
    80002494:	740080e7          	jalr	1856(ra) # 80001bd0 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80002498:	0004b483          	ld	s1,0(s1)
    8000249c:	fb9ff06f          	j	80002454 <_ZN15MemoryAllocator10print_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    800024a0:	00005517          	auipc	a0,0x5
    800024a4:	de850513          	addi	a0,a0,-536 # 80007288 <CONSOLE_STATUS+0x278>
    800024a8:	fffff097          	auipc	ra,0xfffff
    800024ac:	728080e7          	jalr	1832(ra) # 80001bd0 <_Z12kprintStringPKc>
    800024b0:	fa1ff06f          	j	80002450 <_ZN15MemoryAllocator10print_listEv+0x30>
    }
    kprintString("------------------------------\n");
    800024b4:	00005517          	auipc	a0,0x5
    800024b8:	dec50513          	addi	a0,a0,-532 # 800072a0 <CONSOLE_STATUS+0x290>
    800024bc:	fffff097          	auipc	ra,0xfffff
    800024c0:	714080e7          	jalr	1812(ra) # 80001bd0 <_Z12kprintStringPKc>
}
    800024c4:	01813083          	ld	ra,24(sp)
    800024c8:	01013403          	ld	s0,16(sp)
    800024cc:	00813483          	ld	s1,8(sp)
    800024d0:	02010113          	addi	sp,sp,32
    800024d4:	00008067          	ret

00000000800024d8 <_ZN15MemoryAllocator14print_all_listEv>:

void MemoryAllocator::print_all_list(){
    800024d8:	fe010113          	addi	sp,sp,-32
    800024dc:	00113c23          	sd	ra,24(sp)
    800024e0:	00813823          	sd	s0,16(sp)
    800024e4:	00913423          	sd	s1,8(sp)
    800024e8:	02010413          	addi	s0,sp,32
    800024ec:	00050493          	mv	s1,a0

    kprintString("------Allocated Segment Lista------\n");
    800024f0:	00005517          	auipc	a0,0x5
    800024f4:	dd050513          	addi	a0,a0,-560 # 800072c0 <CONSOLE_STATUS+0x2b0>
    800024f8:	fffff097          	auipc	ra,0xfffff
    800024fc:	6d8080e7          	jalr	1752(ra) # 80001bd0 <_Z12kprintStringPKc>
    if(!fall_head)
    80002500:	0104b783          	ld	a5,16(s1)
    80002504:	04078a63          	beqz	a5,80002558 <_ZN15MemoryAllocator14print_all_listEv+0x80>
        kprintString("LISTA JE PRAZNA!\n");
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80002508:	0104b483          	ld	s1,16(s1)
    8000250c:	06048063          	beqz	s1,8000256c <_ZN15MemoryAllocator14print_all_listEv+0x94>
        kprintInt((uint64)curr);
    80002510:	00a00593          	li	a1,10
    80002514:	00048513          	mv	a0,s1
    80002518:	fffff097          	auipc	ra,0xfffff
    8000251c:	700080e7          	jalr	1792(ra) # 80001c18 <_Z9kprintIntmi>
        kprintString("\n");
    80002520:	00005517          	auipc	a0,0x5
    80002524:	d2050513          	addi	a0,a0,-736 # 80007240 <CONSOLE_STATUS+0x230>
    80002528:	fffff097          	auipc	ra,0xfffff
    8000252c:	6a8080e7          	jalr	1704(ra) # 80001bd0 <_Z12kprintStringPKc>
        kprintInt((uint64)curr->size);
    80002530:	00a00593          	li	a1,10
    80002534:	0084b503          	ld	a0,8(s1)
    80002538:	fffff097          	auipc	ra,0xfffff
    8000253c:	6e0080e7          	jalr	1760(ra) # 80001c18 <_Z9kprintIntmi>
        kprintString("\n");
    80002540:	00005517          	auipc	a0,0x5
    80002544:	d0050513          	addi	a0,a0,-768 # 80007240 <CONSOLE_STATUS+0x230>
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	688080e7          	jalr	1672(ra) # 80001bd0 <_Z12kprintStringPKc>
    for(FreeSegment* curr = fall_head; curr; curr = curr->next){
    80002550:	0004b483          	ld	s1,0(s1)
    80002554:	fb9ff06f          	j	8000250c <_ZN15MemoryAllocator14print_all_listEv+0x34>
        kprintString("LISTA JE PRAZNA!\n");
    80002558:	00005517          	auipc	a0,0x5
    8000255c:	d3050513          	addi	a0,a0,-720 # 80007288 <CONSOLE_STATUS+0x278>
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	670080e7          	jalr	1648(ra) # 80001bd0 <_Z12kprintStringPKc>
    80002568:	fa1ff06f          	j	80002508 <_ZN15MemoryAllocator14print_all_listEv+0x30>
    }
    kprintString("------------------------------\n");
    8000256c:	00005517          	auipc	a0,0x5
    80002570:	d3450513          	addi	a0,a0,-716 # 800072a0 <CONSOLE_STATUS+0x290>
    80002574:	fffff097          	auipc	ra,0xfffff
    80002578:	65c080e7          	jalr	1628(ra) # 80001bd0 <_Z12kprintStringPKc>
    8000257c:	01813083          	ld	ra,24(sp)
    80002580:	01013403          	ld	s0,16(sp)
    80002584:	00813483          	ld	s1,8(sp)
    80002588:	02010113          	addi	sp,sp,32
    8000258c:	00008067          	ret

0000000080002590 <_ZNK8TcbQueue6existsEP3TCB>:
#include"../h/ptr_queue.hpp"
#include"../h/kernel_funs.h"
#include"../h/tcb.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    80002590:	ff010113          	addi	sp,sp,-16
    80002594:	00813423          	sd	s0,8(sp)
    80002598:	01010413          	addi	s0,sp,16
    for(TCB* node = head; node; node = node->next)
    8000259c:	00053783          	ld	a5,0(a0)
    800025a0:	00078863          	beqz	a5,800025b0 <_ZNK8TcbQueue6existsEP3TCB+0x20>
    {
        if(node == info)
    800025a4:	00b78e63          	beq	a5,a1,800025c0 <_ZNK8TcbQueue6existsEP3TCB+0x30>
    for(TCB* node = head; node; node = node->next)
    800025a8:	0007b783          	ld	a5,0(a5)
    800025ac:	ff5ff06f          	j	800025a0 <_ZNK8TcbQueue6existsEP3TCB+0x10>
            return true;
    }
    return false;
    800025b0:	00000513          	li	a0,0
}
    800025b4:	00813403          	ld	s0,8(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret
            return true;
    800025c0:	00100513          	li	a0,1
    800025c4:	ff1ff06f          	j	800025b4 <_ZNK8TcbQueue6existsEP3TCB+0x24>

00000000800025c8 <_ZN8TcbQueue6insertEP3TCB>:

TcbQueue& TcbQueue::insert(TCB* info)
{
    800025c8:	ff010113          	addi	sp,sp,-16
    800025cc:	00813423          	sd	s0,8(sp)
    800025d0:	01010413          	addi	s0,sp,16
    info->next = nullptr;
    800025d4:	0005b023          	sd	zero,0(a1)
    tail = tail==nullptr?(head = info):(tail->next = info);
    800025d8:	00853783          	ld	a5,8(a0)
    800025dc:	02078263          	beqz	a5,80002600 <_ZN8TcbQueue6insertEP3TCB+0x38>
    800025e0:	00b7b023          	sd	a1,0(a5)
    800025e4:	00b53423          	sd	a1,8(a0)
    tmpNum++;
    800025e8:	01052783          	lw	a5,16(a0)
    800025ec:	0017879b          	addiw	a5,a5,1
    800025f0:	00f52823          	sw	a5,16(a0)
    return *this;
}
    800025f4:	00813403          	ld	s0,8(sp)
    800025f8:	01010113          	addi	sp,sp,16
    800025fc:	00008067          	ret
    tail = tail==nullptr?(head = info):(tail->next = info);
    80002600:	00b53023          	sd	a1,0(a0)
    80002604:	fe1ff06f          	j	800025e4 <_ZN8TcbQueue6insertEP3TCB+0x1c>

0000000080002608 <_ZN8TcbQueue6removeEv>:
   
TCB* TcbQueue::remove(){
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00813423          	sd	s0,8(sp)
    80002610:	01010413          	addi	s0,sp,16
    80002614:	00050793          	mv	a5,a0
    if(head!=nullptr){
    80002618:	00053503          	ld	a0,0(a0)
    8000261c:	02050263          	beqz	a0,80002640 <_ZN8TcbQueue6removeEv+0x38>
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
    80002620:	0087b703          	ld	a4,8(a5)
    80002624:	02e50463          	beq	a0,a4,8000264c <_ZN8TcbQueue6removeEv+0x44>
    80002628:	00053703          	ld	a4,0(a0)
    8000262c:	00e7b023          	sd	a4,0(a5)
        ret->next = nullptr;
    80002630:	00053023          	sd	zero,0(a0)
        tmpNum--;
    80002634:	0107a703          	lw	a4,16(a5)
    80002638:	fff7071b          	addiw	a4,a4,-1
    8000263c:	00e7a823          	sw	a4,16(a5)
        return ret;            
    }
    return nullptr;
}
    80002640:	00813403          	ld	s0,8(sp)
    80002644:	01010113          	addi	sp,sp,16
    80002648:	00008067          	ret
        head = head==tail?(tail = nullptr):head->next;
    8000264c:	0007b423          	sd	zero,8(a5)
    80002650:	00000713          	li	a4,0
    80002654:	fd9ff06f          	j	8000262c <_ZN8TcbQueue6removeEv+0x24>

0000000080002658 <_ZN8TcbQueue3topEv>:

TCB* TcbQueue::top(){
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    return head;
}
    80002664:	00053503          	ld	a0,0(a0)
    80002668:	00813403          	ld	s0,8(sp)
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00008067          	ret

0000000080002674 <_ZN8TcbQueue10printQueueEv>:

void TcbQueue::printQueue(){
    80002674:	fe010113          	addi	sp,sp,-32
    80002678:	00113c23          	sd	ra,24(sp)
    8000267c:	00813823          	sd	s0,16(sp)
    80002680:	00913423          	sd	s1,8(sp)
    80002684:	02010413          	addi	s0,sp,32
    TCB* t = head;
    80002688:	00053483          	ld	s1,0(a0)
    while(t){
    8000268c:	02048e63          	beqz	s1,800026c8 <_ZN8TcbQueue10printQueueEv+0x54>
        kprintString("-> ");
    80002690:	00005517          	auipc	a0,0x5
    80002694:	c5850513          	addi	a0,a0,-936 # 800072e8 <CONSOLE_STATUS+0x2d8>
    80002698:	fffff097          	auipc	ra,0xfffff
    8000269c:	538080e7          	jalr	1336(ra) # 80001bd0 <_Z12kprintStringPKc>
        kprintInt((uint64)t);
    800026a0:	00a00593          	li	a1,10
    800026a4:	00048513          	mv	a0,s1
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	570080e7          	jalr	1392(ra) # 80001c18 <_Z9kprintIntmi>
        kprintString("\n");
    800026b0:	00005517          	auipc	a0,0x5
    800026b4:	b9050513          	addi	a0,a0,-1136 # 80007240 <CONSOLE_STATUS+0x230>
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	518080e7          	jalr	1304(ra) # 80001bd0 <_Z12kprintStringPKc>
        t = t->next;            
    800026c0:	0004b483          	ld	s1,0(s1)
    while(t){
    800026c4:	fc9ff06f          	j	8000268c <_ZN8TcbQueue10printQueueEv+0x18>
    }
    kprintString("\n");
    800026c8:	00005517          	auipc	a0,0x5
    800026cc:	b7850513          	addi	a0,a0,-1160 # 80007240 <CONSOLE_STATUS+0x230>
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	500080e7          	jalr	1280(ra) # 80001bd0 <_Z12kprintStringPKc>
}
    800026d8:	01813083          	ld	ra,24(sp)
    800026dc:	01013403          	ld	s0,16(sp)
    800026e0:	00813483          	ld	s1,8(sp)
    800026e4:	02010113          	addi	sp,sp,32
    800026e8:	00008067          	ret

00000000800026ec <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>:
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    800026ec:	fc010113          	addi	sp,sp,-64
    800026f0:	02113c23          	sd	ra,56(sp)
    800026f4:	02813823          	sd	s0,48(sp)
    800026f8:	02913423          	sd	s1,40(sp)
    800026fc:	03213023          	sd	s2,32(sp)
    80002700:	01313c23          	sd	s3,24(sp)
    80002704:	01413823          	sd	s4,16(sp)
    80002708:	01513423          	sd	s5,8(sp)
    8000270c:	04010413          	addi	s0,sp,64
    80002710:	00050a93          	mv	s5,a0
    80002714:	00058913          	mv	s2,a1
    80002718:	00060a13          	mv	s4,a2
    TCB* prev = nullptr,* cur = head;
    8000271c:	00053483          	ld	s1,0(a0)
    80002720:	00000993          	li	s3,0
    while(cur && cmp(info, cur) >= 0){
    80002724:	02048063          	beqz	s1,80002744 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
    80002728:	00048593          	mv	a1,s1
    8000272c:	00090513          	mv	a0,s2
    80002730:	000a00e7          	jalr	s4
    80002734:	00054863          	bltz	a0,80002744 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x58>
        prev = cur;
    80002738:	00048993          	mv	s3,s1
        cur = cur->next;
    8000273c:	0004b483          	ld	s1,0(s1)
    while(cur && cmp(info, cur) >= 0){
    80002740:	fe5ff06f          	j	80002724 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x38>
    }
    if(!prev){
    80002744:	04098063          	beqz	s3,80002784 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x98>
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
    80002748:	00993023          	sd	s1,0(s2)
        prev->next = cur==nullptr?(tail=info):info;
    8000274c:	04048a63          	beqz	s1,800027a0 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xb4>
    80002750:	0129b023          	sd	s2,0(s3)
    }
    tmpNum++;
    80002754:	010aa783          	lw	a5,16(s5)
    80002758:	0017879b          	addiw	a5,a5,1
    8000275c:	00faa823          	sw	a5,16(s5)
}
    80002760:	03813083          	ld	ra,56(sp)
    80002764:	03013403          	ld	s0,48(sp)
    80002768:	02813483          	ld	s1,40(sp)
    8000276c:	02013903          	ld	s2,32(sp)
    80002770:	01813983          	ld	s3,24(sp)
    80002774:	01013a03          	ld	s4,16(sp)
    80002778:	00813a83          	ld	s5,8(sp)
    8000277c:	04010113          	addi	sp,sp,64
    80002780:	00008067          	ret
        info->next = head;
    80002784:	000ab783          	ld	a5,0(s5)
    80002788:	00f93023          	sd	a5,0(s2)
        head = head==nullptr?(tail = info):info; 
    8000278c:	00078663          	beqz	a5,80002798 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xac>
    80002790:	012ab023          	sd	s2,0(s5)
    80002794:	fc1ff06f          	j	80002754 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x68>
    80002798:	012ab423          	sd	s2,8(s5)
    8000279c:	ff5ff06f          	j	80002790 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0xa4>
        prev->next = cur==nullptr?(tail=info):info;
    800027a0:	012ab423          	sd	s2,8(s5)
    800027a4:	fadff06f          	j	80002750 <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E+0x64>

00000000800027a8 <_ZN8TcbQueue11insertFrontEP3TCB>:

void TcbQueue::insertFront(TCB* info){
    800027a8:	ff010113          	addi	sp,sp,-16
    800027ac:	00813423          	sd	s0,8(sp)
    800027b0:	01010413          	addi	s0,sp,16
    info->next = head;
    800027b4:	00053783          	ld	a5,0(a0)
    800027b8:	00f5b023          	sd	a5,0(a1)
    head = head==nullptr?(tail = info):info;
    800027bc:	02078063          	beqz	a5,800027dc <_ZN8TcbQueue11insertFrontEP3TCB+0x34>
    800027c0:	00b53023          	sd	a1,0(a0)
    tmpNum++;
    800027c4:	01052783          	lw	a5,16(a0)
    800027c8:	0017879b          	addiw	a5,a5,1
    800027cc:	00f52823          	sw	a5,16(a0)
    800027d0:	00813403          	ld	s0,8(sp)
    800027d4:	01010113          	addi	sp,sp,16
    800027d8:	00008067          	ret
    head = head==nullptr?(tail = info):info;
    800027dc:	00b53423          	sd	a1,8(a0)
    800027e0:	fe1ff06f          	j	800027c0 <_ZN8TcbQueue11insertFrontEP3TCB+0x18>

00000000800027e4 <_ZN9Scheduler3cmpEP3TCBS1_>:
void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00813423          	sd	s0,8(sp)
    800027ec:	01010413          	addi	s0,sp,16
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    800027f0:	00852683          	lw	a3,8(a0)
    800027f4:	0085a703          	lw	a4,8(a1)
    800027f8:	40e687bb          	subw	a5,a3,a4
    if(diff>=0)
    800027fc:	0007cc63          	bltz	a5,80002814 <_ZN9Scheduler3cmpEP3TCBS1_+0x30>
        x1->sleep_time = diff;
    80002800:	00f53423          	sd	a5,8(a0)
    else
        x2->sleep_time = -diff;
    return diff;
}
    80002804:	00078513          	mv	a0,a5
    80002808:	00813403          	ld	s0,8(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret
        x2->sleep_time = -diff;
    80002814:	40d7073b          	subw	a4,a4,a3
    80002818:	00e5b423          	sd	a4,8(a1)
    8000281c:	fe9ff06f          	j	80002804 <_ZN9Scheduler3cmpEP3TCBS1_+0x20>

0000000080002820 <_Z41__static_initialization_and_destruction_0ii>:
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
    80002820:	ff010113          	addi	sp,sp,-16
    80002824:	00813423          	sd	s0,8(sp)
    80002828:	01010413          	addi	s0,sp,16
    8000282c:	00100793          	li	a5,1
    80002830:	00f50863          	beq	a0,a5,80002840 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002834:	00813403          	ld	s0,8(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret
    80002840:	000107b7          	lui	a5,0x10
    80002844:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002848:	fef596e3          	bne	a1,a5,80002834 <_Z41__static_initialization_and_destruction_0ii+0x14>
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    8000284c:	00006797          	auipc	a5,0x6
    80002850:	59c78793          	addi	a5,a5,1436 # 80008de8 <_ZN9Scheduler5queueE>
    80002854:	0007b023          	sd	zero,0(a5)
    80002858:	0007b423          	sd	zero,8(a5)
    8000285c:	0007a823          	sw	zero,16(a5)
    80002860:	0007bc23          	sd	zero,24(a5)
    80002864:	0207b023          	sd	zero,32(a5)
    80002868:	0207a423          	sw	zero,40(a5)
    8000286c:	fc9ff06f          	j	80002834 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002870 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() { return queue.remove(); }
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00113423          	sd	ra,8(sp)
    80002878:	00813023          	sd	s0,0(sp)
    8000287c:	01010413          	addi	s0,sp,16
    80002880:	00006517          	auipc	a0,0x6
    80002884:	56850513          	addi	a0,a0,1384 # 80008de8 <_ZN9Scheduler5queueE>
    80002888:	00000097          	auipc	ra,0x0
    8000288c:	d80080e7          	jalr	-640(ra) # 80002608 <_ZN8TcbQueue6removeEv>
    80002890:	00813083          	ld	ra,8(sp)
    80002894:	00013403          	ld	s0,0(sp)
    80002898:	01010113          	addi	sp,sp,16
    8000289c:	00008067          	ret

00000000800028a0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* ptr) { queue.insert(ptr); }
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00113423          	sd	ra,8(sp)
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	01010413          	addi	s0,sp,16
    800028b0:	00050593          	mv	a1,a0
    800028b4:	00006517          	auipc	a0,0x6
    800028b8:	53450513          	addi	a0,a0,1332 # 80008de8 <_ZN9Scheduler5queueE>
    800028bc:	00000097          	auipc	ra,0x0
    800028c0:	d0c080e7          	jalr	-756(ra) # 800025c8 <_ZN8TcbQueue6insertEP3TCB>
    800028c4:	00813083          	ld	ra,8(sp)
    800028c8:	00013403          	ld	s0,0(sp)
    800028cc:	01010113          	addi	sp,sp,16
    800028d0:	00008067          	ret

00000000800028d4 <_ZN9Scheduler9initalizeEv>:
void Scheduler::initalize(){}
    800028d4:	ff010113          	addi	sp,sp,-16
    800028d8:	00813423          	sd	s0,8(sp)
    800028dc:	01010413          	addi	s0,sp,16
    800028e0:	00813403          	ld	s0,8(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_ZN9Scheduler8finalizeEv>:
void Scheduler::finalize(){}
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00813423          	sd	s0,8(sp)
    800028f4:	01010413          	addi	s0,sp,16
    800028f8:	00813403          	ld	s0,8(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret

0000000080002904 <_ZN9Scheduler11print_queueEv>:
void Scheduler::print_queue() { queue.printQueue(); }
    80002904:	ff010113          	addi	sp,sp,-16
    80002908:	00113423          	sd	ra,8(sp)
    8000290c:	00813023          	sd	s0,0(sp)
    80002910:	01010413          	addi	s0,sp,16
    80002914:	00006517          	auipc	a0,0x6
    80002918:	4d450513          	addi	a0,a0,1236 # 80008de8 <_ZN9Scheduler5queueE>
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	d58080e7          	jalr	-680(ra) # 80002674 <_ZN8TcbQueue10printQueueEv>
    80002924:	00813083          	ld	ra,8(sp)
    80002928:	00013403          	ld	s0,0(sp)
    8000292c:	01010113          	addi	sp,sp,16
    80002930:	00008067          	ret

0000000080002934 <_ZN9Scheduler11put_sleeperEP3TCBm>:
{
    80002934:	ff010113          	addi	sp,sp,-16
    80002938:	00113423          	sd	ra,8(sp)
    8000293c:	00813023          	sd	s0,0(sp)
    80002940:	01010413          	addi	s0,sp,16
    t->sleep_time = time;
    80002944:	00b53423          	sd	a1,8(a0)
    sleeping.insertSorted(t, cmp);  
    80002948:	00000617          	auipc	a2,0x0
    8000294c:	e9c60613          	addi	a2,a2,-356 # 800027e4 <_ZN9Scheduler3cmpEP3TCBS1_>
    80002950:	00050593          	mv	a1,a0
    80002954:	00006517          	auipc	a0,0x6
    80002958:	4ac50513          	addi	a0,a0,1196 # 80008e00 <_ZN9Scheduler8sleepingE>
    8000295c:	00000097          	auipc	ra,0x0
    80002960:	d90080e7          	jalr	-624(ra) # 800026ec <_ZN8TcbQueue12insertSortedEP3TCBPFiS1_S1_E>
}
    80002964:	00813083          	ld	ra,8(sp)
    80002968:	00013403          	ld	s0,0(sp)
    8000296c:	01010113          	addi	sp,sp,16
    80002970:	00008067          	ret

0000000080002974 <_ZN9Scheduler12update_sleepEv>:
{
    80002974:	fe010113          	addi	sp,sp,-32
    80002978:	00113c23          	sd	ra,24(sp)
    8000297c:	00813823          	sd	s0,16(sp)
    80002980:	00913423          	sd	s1,8(sp)
    80002984:	01213023          	sd	s2,0(sp)
    80002988:	02010413          	addi	s0,sp,32
    TCB* t = sleeping.top();
    8000298c:	00006517          	auipc	a0,0x6
    80002990:	47450513          	addi	a0,a0,1140 # 80008e00 <_ZN9Scheduler8sleepingE>
    80002994:	00000097          	auipc	ra,0x0
    80002998:	cc4080e7          	jalr	-828(ra) # 80002658 <_ZN8TcbQueue3topEv>
    if(t == nullptr) return;
    8000299c:	04050e63          	beqz	a0,800029f8 <_ZN9Scheduler12update_sleepEv+0x84>
    800029a0:	00050493          	mv	s1,a0
    t->sleep_time--;
    800029a4:	00853783          	ld	a5,8(a0)
    800029a8:	fff78793          	addi	a5,a5,-1
    800029ac:	00f53423          	sd	a5,8(a0)
    while(t && t->sleep_time == 0){
    800029b0:	04048463          	beqz	s1,800029f8 <_ZN9Scheduler12update_sleepEv+0x84>
    800029b4:	0084b783          	ld	a5,8(s1)
    800029b8:	04079063          	bnez	a5,800029f8 <_ZN9Scheduler12update_sleepEv+0x84>
        sleeping.remove();
    800029bc:	00006917          	auipc	s2,0x6
    800029c0:	44490913          	addi	s2,s2,1092 # 80008e00 <_ZN9Scheduler8sleepingE>
    800029c4:	00090513          	mv	a0,s2
    800029c8:	00000097          	auipc	ra,0x0
    800029cc:	c40080e7          	jalr	-960(ra) # 80002608 <_ZN8TcbQueue6removeEv>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
        allocator.mem_free(this->stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    800029d0:	00100793          	li	a5,1
    800029d4:	02f4a823          	sw	a5,48(s1)
        put(t);
    800029d8:	00048513          	mv	a0,s1
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	ec4080e7          	jalr	-316(ra) # 800028a0 <_ZN9Scheduler3putEP3TCB>
        t = sleeping.top();
    800029e4:	00090513          	mv	a0,s2
    800029e8:	00000097          	auipc	ra,0x0
    800029ec:	c70080e7          	jalr	-912(ra) # 80002658 <_ZN8TcbQueue3topEv>
    800029f0:	00050493          	mv	s1,a0
    while(t && t->sleep_time == 0){
    800029f4:	fbdff06f          	j	800029b0 <_ZN9Scheduler12update_sleepEv+0x3c>
    800029f8:	01813083          	ld	ra,24(sp)
    800029fc:	01013403          	ld	s0,16(sp)
    80002a00:	00813483          	ld	s1,8(sp)
    80002a04:	00013903          	ld	s2,0(sp)
    80002a08:	02010113          	addi	sp,sp,32
    80002a0c:	00008067          	ret

0000000080002a10 <_GLOBAL__sub_I__ZN9Scheduler5queueE>:
    80002a10:	ff010113          	addi	sp,sp,-16
    80002a14:	00113423          	sd	ra,8(sp)
    80002a18:	00813023          	sd	s0,0(sp)
    80002a1c:	01010413          	addi	s0,sp,16
    80002a20:	000105b7          	lui	a1,0x10
    80002a24:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002a28:	00100513          	li	a0,1
    80002a2c:	00000097          	auipc	ra,0x0
    80002a30:	df4080e7          	jalr	-524(ra) # 80002820 <_Z41__static_initialization_and_destruction_0ii>
    80002a34:	00813083          	ld	ra,8(sp)
    80002a38:	00013403          	ld	s0,0(sp)
    80002a3c:	01010113          	addi	sp,sp,16
    80002a40:	00008067          	ret

0000000080002a44 <_Z41__static_initialization_and_destruction_0ii>:
        }    
    }
    else
        plic_complete(t);
        
    80002a44:	ff010113          	addi	sp,sp,-16
    80002a48:	00813423          	sd	s0,8(sp)
    80002a4c:	01010413          	addi	s0,sp,16
    80002a50:	00100793          	li	a5,1
    80002a54:	00f50863          	beq	a0,a5,80002a64 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002a58:	00813403          	ld	s0,8(sp)
    80002a5c:	01010113          	addi	sp,sp,16
    80002a60:	00008067          	ret
    80002a64:	000107b7          	lui	a5,0x10
    80002a68:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002a6c:	fef596e3          	bne	a1,a5,80002a58 <_Z41__static_initialization_and_destruction_0ii+0x14>
unsigned char* StdIO::iostatus = (unsigned char*)CONSOLE_STATUS;
    80002a70:	00004797          	auipc	a5,0x4
    80002a74:	5a078793          	addi	a5,a5,1440 # 80007010 <CONSOLE_STATUS>
    80002a78:	0007b783          	ld	a5,0(a5)
    80002a7c:	00006717          	auipc	a4,0x6
    80002a80:	2ef73623          	sd	a5,748(a4) # 80008d68 <_ZN5StdIO8iostatusE>
char* StdIO::idata = (char*)CONSOLE_RX_DATA;
    80002a84:	00004797          	auipc	a5,0x4
    80002a88:	57c78793          	addi	a5,a5,1404 # 80007000 <CONSOLE_RX_DATA>
    80002a8c:	0007b783          	ld	a5,0(a5)
    80002a90:	00006717          	auipc	a4,0x6
    80002a94:	2cf73823          	sd	a5,720(a4) # 80008d60 <_ZN5StdIO5idataE>
char* StdIO::odata = (char*)CONSOLE_TX_DATA;
    80002a98:	00004797          	auipc	a5,0x4
    80002a9c:	57078793          	addi	a5,a5,1392 # 80007008 <CONSOLE_TX_DATA>
    80002aa0:	0007b783          	ld	a5,0(a5)
    80002aa4:	00006717          	auipc	a4,0x6
    80002aa8:	2af73a23          	sd	a5,692(a4) # 80008d58 <_ZN5StdIO5odataE>
    80002aac:	fadff06f          	j	80002a58 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002ab0 <_ZN5StdIO12outputWorkerEPv>:
{
    80002ab0:	fc010113          	addi	sp,sp,-64
    80002ab4:	02113c23          	sd	ra,56(sp)
    80002ab8:	02813823          	sd	s0,48(sp)
    80002abc:	02913423          	sd	s1,40(sp)
    80002ac0:	03213023          	sd	s2,32(sp)
    80002ac4:	01313c23          	sd	s3,24(sp)
    80002ac8:	01413823          	sd	s4,16(sp)
    80002acc:	04010413          	addi	s0,sp,64
    out_thread = nullptr;
    80002ad0:	00006797          	auipc	a5,0x6
    80002ad4:	2607b423          	sd	zero,616(a5) # 80008d38 <_ZN5StdIO10out_threadE>
    80002ad8:	0400006f          	j	80002b18 <_ZN5StdIO12outputWorkerEPv+0x68>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002adc:	100027f3          	csrr	a5,sstatus
    80002ae0:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002ae4:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80002ae8:	141027f3          	csrr	a5,sepc
    80002aec:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80002af0:	fc043483          	ld	s1,-64(s0)
            out_thread = TCB::running;
    80002af4:	00006797          	auipc	a5,0x6
    80002af8:	29478793          	addi	a5,a5,660 # 80008d88 <_ZN3TCB7runningE>
    80002afc:	0007b783          	ld	a5,0(a5)
    80002b00:	00006717          	auipc	a4,0x6
    80002b04:	22f73c23          	sd	a5,568(a4) # 80008d38 <_ZN5StdIO10out_threadE>
            TCB::yield();
    80002b08:	00001097          	auipc	ra,0x1
    80002b0c:	f24080e7          	jalr	-220(ra) # 80003a2c <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002b10:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80002b14:	14149073          	csrw	sepc,s1
    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    80002b18:	00006797          	auipc	a5,0x6
    80002b1c:	25078793          	addi	a5,a5,592 # 80008d68 <_ZN5StdIO8iostatusE>
    80002b20:	0007b783          	ld	a5,0(a5)
    80002b24:	0007c783          	lbu	a5,0(a5)
        if(output_ready())
    80002b28:	0207f793          	andi	a5,a5,32
    80002b2c:	fa0788e3          	beqz	a5,80002adc <_ZN5StdIO12outputWorkerEPv+0x2c>
            *odata = obuffer->get();
    80002b30:	00006797          	auipc	a5,0x6
    80002b34:	21878793          	addi	a5,a5,536 # 80008d48 <_ZN5StdIO7obufferE>
    80002b38:	0007b483          	ld	s1,0(a5)
    80002b3c:	00006797          	auipc	a5,0x6
    80002b40:	21c78793          	addi	a5,a5,540 # 80008d58 <_ZN5StdIO5odataE>
    80002b44:	0007b983          	ld	s3,0(a5)
        itemAvailable.signal();
        mutex.signal();
    }

    T get(){
        itemAvailable.wait();
    80002b48:	42848513          	addi	a0,s1,1064
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	33c080e7          	jalr	828(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80002b54:	40048913          	addi	s2,s1,1024
    80002b58:	00090513          	mv	a0,s2
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	32c080e7          	jalr	812(ra) # 80001e88 <_ZN10KSemaphore4waitEv>

        tmpLen--;
    80002b64:	4804a783          	lw	a5,1152(s1)
    80002b68:	fff7879b          	addiw	a5,a5,-1
    80002b6c:	48f4a023          	sw	a5,1152(s1)
        T r = buffer[head];
    80002b70:	4784a783          	lw	a5,1144(s1)
    80002b74:	00f48733          	add	a4,s1,a5
    80002b78:	00074a03          	lbu	s4,0(a4)
        head = (head+1)%BUFFER_SIZE;
    80002b7c:	0017879b          	addiw	a5,a5,1
    80002b80:	41f7d71b          	sraiw	a4,a5,0x1f
    80002b84:	0167571b          	srliw	a4,a4,0x16
    80002b88:	00e787bb          	addw	a5,a5,a4
    80002b8c:	3ff7f793          	andi	a5,a5,1023
    80002b90:	40e787bb          	subw	a5,a5,a4
    80002b94:	46f4ac23          	sw	a5,1144(s1)

        spaceAvailable.signal();
    80002b98:	45048513          	addi	a0,s1,1104
    80002b9c:	fffff097          	auipc	ra,0xfffff
    80002ba0:	370080e7          	jalr	880(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80002ba4:	00090513          	mv	a0,s2
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	364080e7          	jalr	868(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    80002bb0:	01498023          	sb	s4,0(s3)
    80002bb4:	f65ff06f          	j	80002b18 <_ZN5StdIO12outputWorkerEPv+0x68>

0000000080002bb8 <_ZN5StdIO9initalizeEv>:
{
    80002bb8:	fd010113          	addi	sp,sp,-48
    80002bbc:	02113423          	sd	ra,40(sp)
    80002bc0:	02813023          	sd	s0,32(sp)
    80002bc4:	00913c23          	sd	s1,24(sp)
    80002bc8:	01213823          	sd	s2,16(sp)
    80002bcc:	01313423          	sd	s3,8(sp)
    80002bd0:	03010413          	addi	s0,sp,48
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002bd4:	fffff097          	auipc	ra,0xfffff
    80002bd8:	544080e7          	jalr	1348(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80002bdc:	01300593          	li	a1,19
    80002be0:	fffff097          	auipc	ra,0xfffff
    80002be4:	5ac080e7          	jalr	1452(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    spaceAvailable(BUFFER_SIZE), head(0), tail(0), tmpLen(0){}
    80002be8:	40050793          	addi	a5,a0,1024
#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    80002bec:	00100913          	li	s2,1
    80002bf0:	41252423          	sw	s2,1032(a0)
            remove();
    }

public:
    #include"../h/kernel_operators.hpp"
    TcbQueue():head(nullptr), tail(nullptr), tmpNum(0){}
    80002bf4:	40053823          	sd	zero,1040(a0)
    80002bf8:	40053c23          	sd	zero,1048(a0)
    80002bfc:	42052023          	sw	zero,1056(a0)
    {
        next = activeSemaphores;
    80002c00:	00006497          	auipc	s1,0x6
    80002c04:	13048493          	addi	s1,s1,304 # 80008d30 <_ZN10KSemaphore16activeSemaphoresE>
    80002c08:	0004b703          	ld	a4,0(s1)
    80002c0c:	40e53023          	sd	a4,1024(a0)
    80002c10:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80002c14:	42052823          	sw	zero,1072(a0)
    80002c18:	42053c23          	sd	zero,1080(a0)
    80002c1c:	44053023          	sd	zero,1088(a0)
    80002c20:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80002c24:	42f53423          	sd	a5,1064(a0)
    80002c28:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80002c2c:	40000993          	li	s3,1024
    80002c30:	45352c23          	sw	s3,1112(a0)
    80002c34:	46053023          	sd	zero,1120(a0)
    80002c38:	46053423          	sd	zero,1128(a0)
    80002c3c:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80002c40:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80002c44:	00f4b023          	sd	a5,0(s1)
    80002c48:	46052c23          	sw	zero,1144(a0)
    80002c4c:	46052e23          	sw	zero,1148(a0)
    80002c50:	48052023          	sw	zero,1152(a0)
    ibuffer = new SharedBuffer<char>();
    80002c54:	00006797          	auipc	a5,0x6
    80002c58:	0ea7be23          	sd	a0,252(a5) # 80008d50 <_ZN5StdIO7ibufferE>
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	4bc080e7          	jalr	1212(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80002c64:	01300593          	li	a1,19
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	524080e7          	jalr	1316(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    80002c70:	40050793          	addi	a5,a0,1024
    KSemaphore(unsigned val):val(val)
    80002c74:	41252423          	sw	s2,1032(a0)
    80002c78:	40053823          	sd	zero,1040(a0)
    80002c7c:	40053c23          	sd	zero,1048(a0)
    80002c80:	42052023          	sw	zero,1056(a0)
        next = activeSemaphores;
    80002c84:	0004b703          	ld	a4,0(s1)
    80002c88:	40e53023          	sd	a4,1024(a0)
    80002c8c:	42850713          	addi	a4,a0,1064
    KSemaphore(unsigned val):val(val)
    80002c90:	42052823          	sw	zero,1072(a0)
    80002c94:	42053c23          	sd	zero,1080(a0)
    80002c98:	44053023          	sd	zero,1088(a0)
    80002c9c:	44052423          	sw	zero,1096(a0)
        next = activeSemaphores;
    80002ca0:	42f53423          	sd	a5,1064(a0)
    80002ca4:	45050793          	addi	a5,a0,1104
    KSemaphore(unsigned val):val(val)
    80002ca8:	45352c23          	sw	s3,1112(a0)
    80002cac:	46053023          	sd	zero,1120(a0)
    80002cb0:	46053423          	sd	zero,1128(a0)
    80002cb4:	46052823          	sw	zero,1136(a0)
        next = activeSemaphores;
    80002cb8:	44e53823          	sd	a4,1104(a0)
        activeSemaphores = this;
    80002cbc:	00f4b023          	sd	a5,0(s1)
    80002cc0:	46052c23          	sw	zero,1144(a0)
    80002cc4:	46052e23          	sw	zero,1148(a0)
    80002cc8:	48052023          	sw	zero,1152(a0)
    obuffer = new SharedBuffer<char>();
    80002ccc:	00006797          	auipc	a5,0x6
    80002cd0:	06a7be23          	sd	a0,124(a5) # 80008d48 <_ZN5StdIO7obufferE>
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002cd4:	fffff097          	auipc	ra,0xfffff
    80002cd8:	444080e7          	jalr	1092(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80002cdc:	00100593          	li	a1,1
    80002ce0:	fffff097          	auipc	ra,0xfffff
    80002ce4:	4ac080e7          	jalr	1196(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    KSemaphore(unsigned val):val(val)
    80002ce8:	00052423          	sw	zero,8(a0)
    80002cec:	00053823          	sd	zero,16(a0)
    80002cf0:	00053c23          	sd	zero,24(a0)
    80002cf4:	02052023          	sw	zero,32(a0)
        next = activeSemaphores;
    80002cf8:	0004b783          	ld	a5,0(s1)
    80002cfc:	00f53023          	sd	a5,0(a0)
        activeSemaphores = this;
    80002d00:	00a4b023          	sd	a0,0(s1)
    blockSem = new KSemaphore(0);
    80002d04:	00006797          	auipc	a5,0x6
    80002d08:	02a7be23          	sd	a0,60(a5) # 80008d40 <_ZN5StdIO8blockSemE>
    iostatus = (unsigned char*)CONSOLE_STATUS;
    80002d0c:	00004797          	auipc	a5,0x4
    80002d10:	30478793          	addi	a5,a5,772 # 80007010 <CONSOLE_STATUS>
    80002d14:	0007b783          	ld	a5,0(a5)
    80002d18:	00006717          	auipc	a4,0x6
    80002d1c:	04f73823          	sd	a5,80(a4) # 80008d68 <_ZN5StdIO8iostatusE>
    idata = (char*)CONSOLE_RX_DATA;
    80002d20:	00004797          	auipc	a5,0x4
    80002d24:	2e078793          	addi	a5,a5,736 # 80007000 <CONSOLE_RX_DATA>
    80002d28:	0007b783          	ld	a5,0(a5)
    80002d2c:	00006717          	auipc	a4,0x6
    80002d30:	02f73a23          	sd	a5,52(a4) # 80008d60 <_ZN5StdIO5idataE>
    odata = (char*)CONSOLE_TX_DATA;
    80002d34:	00004797          	auipc	a5,0x4
    80002d38:	2d478793          	addi	a5,a5,724 # 80007008 <CONSOLE_TX_DATA>
    80002d3c:	0007b783          	ld	a5,0(a5)
    80002d40:	00006717          	auipc	a4,0x6
    80002d44:	00f73c23          	sd	a5,24(a4) # 80008d58 <_ZN5StdIO5odataE>
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    80002d48:	fffff097          	auipc	ra,0xfffff
    80002d4c:	3d0080e7          	jalr	976(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80002d50:	04000593          	li	a1,64
    80002d54:	fffff097          	auipc	ra,0xfffff
    80002d58:	438080e7          	jalr	1080(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    80002d5c:	00050613          	mv	a2,a0
    80002d60:	00000593          	li	a1,0
    80002d64:	00000517          	auipc	a0,0x0
    80002d68:	d4c50513          	addi	a0,a0,-692 # 80002ab0 <_ZN5StdIO12outputWorkerEPv>
    80002d6c:	00001097          	auipc	ra,0x1
    80002d70:	90c080e7          	jalr	-1780(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002d74:	00006797          	auipc	a5,0x6
    80002d78:	fca7b223          	sd	a0,-60(a5) # 80008d38 <_ZN5StdIO10out_threadE>
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    80002d7c:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    80002d80:	03250b23          	sb	s2,54(a0)
}
    80002d84:	02813083          	ld	ra,40(sp)
    80002d88:	02013403          	ld	s0,32(sp)
    80002d8c:	01813483          	ld	s1,24(sp)
    80002d90:	01013903          	ld	s2,16(sp)
    80002d94:	00813983          	ld	s3,8(sp)
    80002d98:	03010113          	addi	sp,sp,48
    80002d9c:	00008067          	ret

0000000080002da0 <_ZN5StdIO11inputWorkerEv>:
{
    80002da0:	ff010113          	addi	sp,sp,-16
    80002da4:	00813423          	sd	s0,8(sp)
    80002da8:	01010413          	addi	s0,sp,16
}
    80002dac:	00813403          	ld	s0,8(sp)
    80002db0:	01010113          	addi	sp,sp,16
    80002db4:	00008067          	ret

0000000080002db8 <_ZN5StdIO15console_handlerEv>:
void StdIO::console_handler(){
    80002db8:	fc010113          	addi	sp,sp,-64
    80002dbc:	02113c23          	sd	ra,56(sp)
    80002dc0:	02813823          	sd	s0,48(sp)
    80002dc4:	02913423          	sd	s1,40(sp)
    80002dc8:	03213023          	sd	s2,32(sp)
    80002dcc:	01313c23          	sd	s3,24(sp)
    80002dd0:	04010413          	addi	s0,sp,64
    uint64 t = plic_claim();
    80002dd4:	00002097          	auipc	ra,0x2
    80002dd8:	460080e7          	jalr	1120(ra) # 80005234 <plic_claim>
    if(t == CONSOLE_IRQ)
    80002ddc:	00a00793          	li	a5,10
    80002de0:	12f51063          	bne	a0,a5,80002f00 <_ZN5StdIO15console_handlerEv+0x148>
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    80002de4:	00006797          	auipc	a5,0x6
    80002de8:	f8478793          	addi	a5,a5,-124 # 80008d68 <_ZN5StdIO8iostatusE>
    80002dec:	0007b783          	ld	a5,0(a5)
    80002df0:	0007c783          	lbu	a5,0(a5)
        if(input_ready())
    80002df4:	0017f793          	andi	a5,a5,1
    80002df8:	0a078263          	beqz	a5,80002e9c <_ZN5StdIO15console_handlerEv+0xe4>
            char c = *idata;
    80002dfc:	00006797          	auipc	a5,0x6
    80002e00:	f6478793          	addi	a5,a5,-156 # 80008d60 <_ZN5StdIO5idataE>
    80002e04:	0007b783          	ld	a5,0(a5)
    80002e08:	0007c903          	lbu	s2,0(a5)
            plic_complete(CONSOLE_IRQ);
    80002e0c:	00a00513          	li	a0,10
    80002e10:	00002097          	auipc	ra,0x2
    80002e14:	45c080e7          	jalr	1116(ra) # 8000526c <plic_complete>
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
    80002e18:	00006797          	auipc	a5,0x6
    80002e1c:	f3878793          	addi	a5,a5,-200 # 80008d50 <_ZN5StdIO7ibufferE>
    80002e20:	0007b483          	ld	s1,0(a5)
    80002e24:	4804a703          	lw	a4,1152(s1)
    80002e28:	3ff00793          	li	a5,1023
    80002e2c:	0ce7ce63          	blt	a5,a4,80002f08 <_ZN5StdIO15console_handlerEv+0x150>
        spaceAvailable.wait();
    80002e30:	45048513          	addi	a0,s1,1104
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	054080e7          	jalr	84(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        mutex.wait();
    80002e3c:	40048993          	addi	s3,s1,1024
    80002e40:	00098513          	mv	a0,s3
    80002e44:	fffff097          	auipc	ra,0xfffff
    80002e48:	044080e7          	jalr	68(ra) # 80001e88 <_ZN10KSemaphore4waitEv>
        tmpLen++;
    80002e4c:	4804a783          	lw	a5,1152(s1)
    80002e50:	0017879b          	addiw	a5,a5,1
    80002e54:	48f4a023          	sw	a5,1152(s1)
        buffer[tail]=c;
    80002e58:	47c4a783          	lw	a5,1148(s1)
    80002e5c:	00f48733          	add	a4,s1,a5
    80002e60:	01270023          	sb	s2,0(a4)
        tail=(tail+1)%BUFFER_SIZE;
    80002e64:	0017879b          	addiw	a5,a5,1
    80002e68:	41f7d71b          	sraiw	a4,a5,0x1f
    80002e6c:	0167571b          	srliw	a4,a4,0x16
    80002e70:	00e787bb          	addw	a5,a5,a4
    80002e74:	3ff7f793          	andi	a5,a5,1023
    80002e78:	40e787bb          	subw	a5,a5,a4
    80002e7c:	46f4ae23          	sw	a5,1148(s1)
        itemAvailable.signal();
    80002e80:	42848513          	addi	a0,s1,1064
    80002e84:	fffff097          	auipc	ra,0xfffff
    80002e88:	088080e7          	jalr	136(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
        mutex.signal();
    80002e8c:	00098513          	mv	a0,s3
    80002e90:	fffff097          	auipc	ra,0xfffff
    80002e94:	07c080e7          	jalr	124(ra) # 80001f0c <_ZN10KSemaphore6signalEv>
    80002e98:	0700006f          	j	80002f08 <_ZN5StdIO15console_handlerEv+0x150>
            plic_complete(CONSOLE_IRQ);
    80002e9c:	00a00513          	li	a0,10
    80002ea0:	00002097          	auipc	ra,0x2
    80002ea4:	3cc080e7          	jalr	972(ra) # 8000526c <plic_complete>
            if(out_thread != nullptr)
    80002ea8:	00006797          	auipc	a5,0x6
    80002eac:	e9078793          	addi	a5,a5,-368 # 80008d38 <_ZN5StdIO10out_threadE>
    80002eb0:	0007b783          	ld	a5,0(a5)
    80002eb4:	04078a63          	beqz	a5,80002f08 <_ZN5StdIO15console_handlerEv+0x150>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002eb8:	100027f3          	csrr	a5,sstatus
    80002ebc:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002ec0:	fc843903          	ld	s2,-56(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80002ec4:	141027f3          	csrr	a5,sepc
    80002ec8:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80002ecc:	fc043483          	ld	s1,-64(s0)
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    80002ed0:	00006797          	auipc	a5,0x6
    80002ed4:	e6878793          	addi	a5,a5,-408 # 80008d38 <_ZN5StdIO10out_threadE>
    80002ed8:	0007b583          	ld	a1,0(a5)
    80002edc:	00006517          	auipc	a0,0x6
    80002ee0:	f0c50513          	addi	a0,a0,-244 # 80008de8 <_ZN9Scheduler5queueE>
    80002ee4:	00000097          	auipc	ra,0x0
    80002ee8:	8c4080e7          	jalr	-1852(ra) # 800027a8 <_ZN8TcbQueue11insertFrontEP3TCB>
                TCB::yield();
    80002eec:	00001097          	auipc	ra,0x1
    80002ef0:	b40080e7          	jalr	-1216(ra) # 80003a2c <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80002ef4:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80002ef8:	14149073          	csrw	sepc,s1
    80002efc:	00c0006f          	j	80002f08 <_ZN5StdIO15console_handlerEv+0x150>
        plic_complete(t);
    80002f00:	00002097          	auipc	ra,0x2
    80002f04:	36c080e7          	jalr	876(ra) # 8000526c <plic_complete>
    80002f08:	03813083          	ld	ra,56(sp)
    80002f0c:	03013403          	ld	s0,48(sp)
    80002f10:	02813483          	ld	s1,40(sp)
    80002f14:	02013903          	ld	s2,32(sp)
    80002f18:	01813983          	ld	s3,24(sp)
    80002f1c:	04010113          	addi	sp,sp,64
    80002f20:	00008067          	ret

0000000080002f24 <_GLOBAL__sub_I__ZN5StdIO8iostatusE>:
    80002f24:	ff010113          	addi	sp,sp,-16
    80002f28:	00113423          	sd	ra,8(sp)
    80002f2c:	00813023          	sd	s0,0(sp)
    80002f30:	01010413          	addi	s0,sp,16
    80002f34:	000105b7          	lui	a1,0x10
    80002f38:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002f3c:	00100513          	li	a0,1
    80002f40:	00000097          	auipc	ra,0x0
    80002f44:	b04080e7          	jalr	-1276(ra) # 80002a44 <_Z41__static_initialization_and_destruction_0ii>
    80002f48:	00813083          	ld	ra,8(sp)
    80002f4c:	00013403          	ld	s0,0(sp)
    80002f50:	01010113          	addi	sp,sp,16
    80002f54:	00008067          	ret

0000000080002f58 <mem_alloc>:
#include"../lib/hw.h"
#include"../h/_thread.h"
#include"../h/_semaphore.h"

extern "C" void* mem_alloc(size_t size)
{
    80002f58:	ff010113          	addi	sp,sp,-16
    80002f5c:	00813423          	sd	s0,8(sp)
    80002f60:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80002f64:	fff50513          	addi	a0,a0,-1
    80002f68:	00655513          	srli	a0,a0,0x6
    80002f6c:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80002f70:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80002f74:	00100793          	li	a5,1
    80002f78:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002f7c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80002f80:	00050513          	mv	a0,a0
    
    return adr;  
}
    80002f84:	00813403          	ld	s0,8(sp)
    80002f88:	01010113          	addi	sp,sp,16
    80002f8c:	00008067          	ret

0000000080002f90 <mem_free>:

extern "C" int mem_free (void* adr)
{
    80002f90:	ff010113          	addi	sp,sp,-16
    80002f94:	00813423          	sd	s0,8(sp)
    80002f98:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80002f9c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80002fa0:	00200793          	li	a5,2
    80002fa4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002fa8:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80002fac:	00050513          	mv	a0,a0
    
    return ret;
}
    80002fb0:	0005051b          	sext.w	a0,a0
    80002fb4:	00813403          	ld	s0,8(sp)
    80002fb8:	01010113          	addi	sp,sp,16
    80002fbc:	00008067          	ret

0000000080002fc0 <thread_dispatch>:

extern "C" void thread_dispatch()
{
    80002fc0:	ff010113          	addi	sp,sp,-16
    80002fc4:	00813423          	sd	s0,8(sp)
    80002fc8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80002fcc:	01300793          	li	a5,19
    80002fd0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002fd4:	00000073          	ecall
}
    80002fd8:	00813403          	ld	s0,8(sp)
    80002fdc:	01010113          	addi	sp,sp,16
    80002fe0:	00008067          	ret

0000000080002fe4 <thread_create>:

extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg)
{
   
    if(handle == nullptr) return -1;
    80002fe4:	06050e63          	beqz	a0,80003060 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    80002fe8:	08058063          	beqz	a1,80003068 <thread_create+0x84>
{
    80002fec:	fd010113          	addi	sp,sp,-48
    80002ff0:	02113423          	sd	ra,40(sp)
    80002ff4:	02813023          	sd	s0,32(sp)
    80002ff8:	00913c23          	sd	s1,24(sp)
    80002ffc:	01213823          	sd	s2,16(sp)
    80003000:	01313423          	sd	s3,8(sp)
    80003004:	03010413          	addi	s0,sp,48
    80003008:	00060993          	mv	s3,a2
    8000300c:	00058913          	mv	s2,a1
    80003010:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80003014:	00001537          	lui	a0,0x1
    80003018:	00000097          	auipc	ra,0x0
    8000301c:	f40080e7          	jalr	-192(ra) # 80002f58 <mem_alloc>
    if(stack_space == nullptr) return -3;
    80003020:	04050863          	beqz	a0,80003070 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    80003024:	00050713          	mv	a4,a0
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    80003028:	00098693          	mv	a3,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    8000302c:	00090613          	mv	a2,s2
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    80003030:	00048593          	mv	a1,s1
    asm volatile("li a0, 0x11");
    80003034:	01100513          	li	a0,17
    
    asm volatile("ecall");   
    80003038:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000303c:	00050513          	mv	a0,a0
    80003040:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003044:	02813083          	ld	ra,40(sp)
    80003048:	02013403          	ld	s0,32(sp)
    8000304c:	01813483          	ld	s1,24(sp)
    80003050:	01013903          	ld	s2,16(sp)
    80003054:	00813983          	ld	s3,8(sp)
    80003058:	03010113          	addi	sp,sp,48
    8000305c:	00008067          	ret
    if(handle == nullptr) return -1;
    80003060:	fff00513          	li	a0,-1
    80003064:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80003068:	ffe00513          	li	a0,-2
}
    8000306c:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80003070:	ffd00513          	li	a0,-3
    80003074:	fd1ff06f          	j	80003044 <thread_create+0x60>

0000000080003078 <thread_exit>:

extern "C" int thread_exit()
{
    80003078:	ff010113          	addi	sp,sp,-16
    8000307c:	00813423          	sd	s0,8(sp)
    80003080:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    80003084:	01200513          	li	a0,18
    asm volatile("ecall");
    80003088:	00000073          	ecall

    return ret;
}
    8000308c:	00000513          	li	a0,0
    80003090:	00813403          	ld	s0,8(sp)
    80003094:	01010113          	addi	sp,sp,16
    80003098:	00008067          	ret

000000008000309c <sem_open>:

extern "C" int sem_open(sem_t* handle, unsigned val)
{
    8000309c:	ff010113          	addi	sp,sp,-16
    800030a0:	00813423          	sd	s0,8(sp)
    800030a4:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    800030a8:	02050463          	beqz	a0,800030d0 <sem_open+0x34>

    asm volatile("mv a2, %0" : : "r" (val));
    800030ac:	00058613          	mv	a2,a1
    asm volatile("mv a1, %0" : : "r" (handle));
    800030b0:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x21");
    800030b4:	02100513          	li	a0,33
    asm volatile("ecall");
    800030b8:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800030bc:	00050513          	mv	a0,a0
    800030c0:	0005051b          	sext.w	a0,a0
    return ret;
}
    800030c4:	00813403          	ld	s0,8(sp)
    800030c8:	01010113          	addi	sp,sp,16
    800030cc:	00008067          	ret
    if(handle == nullptr) return -1;
    800030d0:	fff00513          	li	a0,-1
    800030d4:	ff1ff06f          	j	800030c4 <sem_open+0x28>

00000000800030d8 <sem_close>:

extern "C" int sem_close(sem_t handle)
{
    800030d8:	ff010113          	addi	sp,sp,-16
    800030dc:	00813423          	sd	s0,8(sp)
    800030e0:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(handle == nullptr) return -1;
    800030e4:	02050263          	beqz	a0,80003108 <sem_close+0x30>

    asm volatile("mv a1, %0" : : "r" (handle));
    800030e8:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x22");
    800030ec:	02200513          	li	a0,34
    asm volatile("ecall");
    800030f0:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800030f4:	00050513          	mv	a0,a0
    800030f8:	0005051b          	sext.w	a0,a0
    return ret;
}
    800030fc:	00813403          	ld	s0,8(sp)
    80003100:	01010113          	addi	sp,sp,16
    80003104:	00008067          	ret
    if(handle == nullptr) return -1;
    80003108:	fff00513          	li	a0,-1
    8000310c:	ff1ff06f          	j	800030fc <sem_close+0x24>

0000000080003110 <sem_wait>:

extern "C" int sem_wait(sem_t id)
{
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00813423          	sd	s0,8(sp)
    80003118:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    8000311c:	02050263          	beqz	a0,80003140 <sem_wait+0x30>
    
    asm volatile("mv a1, %0" : : "r" (id));
    80003120:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x23");
    80003124:	02300513          	li	a0,35
    asm volatile("ecall");
    80003128:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000312c:	00050513          	mv	a0,a0
    80003130:	0005051b          	sext.w	a0,a0
    return ret;
}
    80003134:	00813403          	ld	s0,8(sp)
    80003138:	01010113          	addi	sp,sp,16
    8000313c:	00008067          	ret
    if(id == nullptr) return -1;
    80003140:	fff00513          	li	a0,-1
    80003144:	ff1ff06f          	j	80003134 <sem_wait+0x24>

0000000080003148 <sem_signal>:

extern "C" int sem_signal(sem_t id)
{
    80003148:	ff010113          	addi	sp,sp,-16
    8000314c:	00813423          	sd	s0,8(sp)
    80003150:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(id == nullptr) return -1;
    80003154:	02050263          	beqz	a0,80003178 <sem_signal+0x30>

    asm volatile("mv a1, %0" : :"r"(id));
    80003158:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x24");
    8000315c:	02400513          	li	a0,36
    asm volatile("ecall");
    80003160:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80003164:	00050513          	mv	a0,a0
    80003168:	0005051b          	sext.w	a0,a0
    return ret;
}
    8000316c:	00813403          	ld	s0,8(sp)
    80003170:	01010113          	addi	sp,sp,16
    80003174:	00008067          	ret
    if(id == nullptr) return -1;
    80003178:	fff00513          	li	a0,-1
    8000317c:	ff1ff06f          	j	8000316c <sem_signal+0x24>

0000000080003180 <time_sleep>:

extern "C" int time_sleep(time_t time){
    80003180:	ff010113          	addi	sp,sp,-16
    80003184:	00813423          	sd	s0,8(sp)
    80003188:	01010413          	addi	s0,sp,16
    int ret = 0;
    if(time == 0) return -1;
    8000318c:	02050263          	beqz	a0,800031b0 <time_sleep+0x30>

    asm volatile("mv a1, %0" : :"r"(time));
    80003190:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x31");
    80003194:	03100513          	li	a0,49
    asm volatile("ecall");
    80003198:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    8000319c:	00050513          	mv	a0,a0
    800031a0:	0005051b          	sext.w	a0,a0
    return ret;
}
    800031a4:	00813403          	ld	s0,8(sp)
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret
    if(time == 0) return -1;
    800031b0:	fff00513          	li	a0,-1
    800031b4:	ff1ff06f          	j	800031a4 <time_sleep+0x24>

00000000800031b8 <getc>:

const int EOF = -1;
extern "C" char getc(){
    800031b8:	ff010113          	addi	sp,sp,-16
    800031bc:	00813423          	sd	s0,8(sp)
    800031c0:	01010413          	addi	s0,sp,16
    unsigned ret;

    asm volatile("li a0, 0x41");
    800031c4:	04100513          	li	a0,65
    asm volatile("ecall");
    800031c8:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    800031cc:	00050513          	mv	a0,a0
    800031d0:	0005051b          	sext.w	a0,a0
    if(ret < 256) return ret;
    800031d4:	0ff00793          	li	a5,255
    800031d8:	00a7ea63          	bltu	a5,a0,800031ec <getc+0x34>
    800031dc:	0ff57513          	andi	a0,a0,255
    else return EOF;
}
    800031e0:	00813403          	ld	s0,8(sp)
    800031e4:	01010113          	addi	sp,sp,16
    800031e8:	00008067          	ret
    else return EOF;
    800031ec:	0ff00513          	li	a0,255
    800031f0:	ff1ff06f          	j	800031e0 <getc+0x28>

00000000800031f4 <putc>:

extern "C" void putc(char c){
    800031f4:	ff010113          	addi	sp,sp,-16
    800031f8:	00813423          	sd	s0,8(sp)
    800031fc:	01010413          	addi	s0,sp,16
    asm volatile("mv a1, a0");
    80003200:	00050593          	mv	a1,a0
    asm volatile("li a0, 0x42");
    80003204:	04200513          	li	a0,66
    asm volatile("ecall");
    80003208:	00000073          	ecall
    8000320c:	00813403          	ld	s0,8(sp)
    80003210:	01010113          	addi	sp,sp,16
    80003214:	00008067          	ret

0000000080003218 <_ZN6Thread10runWrapperEPv>:
        thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00113423          	sd	ra,8(sp)
    80003220:	00813023          	sd	s0,0(sp)
    80003224:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*)thread;
    t->run();
    80003228:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    8000322c:	0107b783          	ld	a5,16(a5)
    80003230:	000780e7          	jalr	a5
}
    80003234:	00813083          	ld	ra,8(sp)
    80003238:	00013403          	ld	s0,0(sp)
    8000323c:	01010113          	addi	sp,sp,16
    80003240:	00008067          	ret

0000000080003244 <_ZN14PeriodicThread15periodicWrapperEPv>:

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    80003244:	fe010113          	addi	sp,sp,-32
    80003248:	00113c23          	sd	ra,24(sp)
    8000324c:	00813823          	sd	s0,16(sp)
    80003250:	00913423          	sd	s1,8(sp)
    80003254:	02010413          	addi	s0,sp,32
    80003258:	00050493          	mv	s1,a0
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    8000325c:	02050263          	beqz	a0,80003280 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
    while(true){
        wp->thread->periodicActivation();
    80003260:	0004b503          	ld	a0,0(s1)
    80003264:	00053783          	ld	a5,0(a0)
    80003268:	0187b783          	ld	a5,24(a5)
    8000326c:	000780e7          	jalr	a5
        time_sleep(wp->period);
    80003270:	0084b503          	ld	a0,8(s1)
    80003274:	00000097          	auipc	ra,0x0
    80003278:	f0c080e7          	jalr	-244(ra) # 80003180 <time_sleep>
    8000327c:	fe5ff06f          	j	80003260 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
    }
}
    80003280:	01813083          	ld	ra,24(sp)
    80003284:	01013403          	ld	s0,16(sp)
    80003288:	00813483          	ld	s1,8(sp)
    8000328c:	02010113          	addi	sp,sp,32
    80003290:	00008067          	ret

0000000080003294 <_Znwm>:
void* operator new(size_t sz){return mem_alloc(sz);}
    80003294:	ff010113          	addi	sp,sp,-16
    80003298:	00113423          	sd	ra,8(sp)
    8000329c:	00813023          	sd	s0,0(sp)
    800032a0:	01010413          	addi	s0,sp,16
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	cb4080e7          	jalr	-844(ra) # 80002f58 <mem_alloc>
    800032ac:	00813083          	ld	ra,8(sp)
    800032b0:	00013403          	ld	s0,0(sp)
    800032b4:	01010113          	addi	sp,sp,16
    800032b8:	00008067          	ret

00000000800032bc <_ZdlPv>:
void operator delete(void* ptr){mem_free(ptr);}
    800032bc:	ff010113          	addi	sp,sp,-16
    800032c0:	00113423          	sd	ra,8(sp)
    800032c4:	00813023          	sd	s0,0(sp)
    800032c8:	01010413          	addi	s0,sp,16
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	cc4080e7          	jalr	-828(ra) # 80002f90 <mem_free>
    800032d4:	00813083          	ld	ra,8(sp)
    800032d8:	00013403          	ld	s0,0(sp)
    800032dc:	01010113          	addi	sp,sp,16
    800032e0:	00008067          	ret

00000000800032e4 <_ZN6ThreadD1Ev>:
Thread::~Thread()
    800032e4:	ff010113          	addi	sp,sp,-16
    800032e8:	00113423          	sd	ra,8(sp)
    800032ec:	00813023          	sd	s0,0(sp)
    800032f0:	01010413          	addi	s0,sp,16
    800032f4:	00004797          	auipc	a5,0x4
    800032f8:	03c78793          	addi	a5,a5,60 # 80007330 <_ZTV6Thread+0x10>
    800032fc:	00f53023          	sd	a5,0(a0)
    _Wrap* w = (_Wrap*)myHandle;
    80003300:	00853503          	ld	a0,8(a0)
    delete w->handle;
    80003304:	00053783          	ld	a5,0(a0)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    80003308:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    8000330c:	00078593          	mv	a1,a5
        asm volatile("ecall");
    80003310:	00000073          	ecall
    delete w;
    80003314:	00000097          	auipc	ra,0x0
    80003318:	fa8080e7          	jalr	-88(ra) # 800032bc <_ZdlPv>
}
    8000331c:	00813083          	ld	ra,8(sp)
    80003320:	00013403          	ld	s0,0(sp)
    80003324:	01010113          	addi	sp,sp,16
    80003328:	00008067          	ret

000000008000332c <_ZN6ThreadD0Ev>:
Thread::~Thread()
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00113c23          	sd	ra,24(sp)
    80003334:	00813823          	sd	s0,16(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	00050493          	mv	s1,a0
}
    80003344:	00000097          	auipc	ra,0x0
    80003348:	fa0080e7          	jalr	-96(ra) # 800032e4 <_ZN6ThreadD1Ev>
    8000334c:	00048513          	mv	a0,s1
    80003350:	00000097          	auipc	ra,0x0
    80003354:	f6c080e7          	jalr	-148(ra) # 800032bc <_ZdlPv>
    80003358:	01813083          	ld	ra,24(sp)
    8000335c:	01013403          	ld	s0,16(sp)
    80003360:	00813483          	ld	s1,8(sp)
    80003364:	02010113          	addi	sp,sp,32
    80003368:	00008067          	ret

000000008000336c <_Znam>:
void* operator new[](size_t sz){return mem_alloc(sz);}
    8000336c:	ff010113          	addi	sp,sp,-16
    80003370:	00113423          	sd	ra,8(sp)
    80003374:	00813023          	sd	s0,0(sp)
    80003378:	01010413          	addi	s0,sp,16
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	bdc080e7          	jalr	-1060(ra) # 80002f58 <mem_alloc>
    80003384:	00813083          	ld	ra,8(sp)
    80003388:	00013403          	ld	s0,0(sp)
    8000338c:	01010113          	addi	sp,sp,16
    80003390:	00008067          	ret

0000000080003394 <_ZdaPv>:
void operator delete[](void* ptr){mem_free(ptr);}
    80003394:	ff010113          	addi	sp,sp,-16
    80003398:	00113423          	sd	ra,8(sp)
    8000339c:	00813023          	sd	s0,0(sp)
    800033a0:	01010413          	addi	s0,sp,16
    800033a4:	00000097          	auipc	ra,0x0
    800033a8:	bec080e7          	jalr	-1044(ra) # 80002f90 <mem_free>
    800033ac:	00813083          	ld	ra,8(sp)
    800033b0:	00013403          	ld	s0,0(sp)
    800033b4:	01010113          	addi	sp,sp,16
    800033b8:	00008067          	ret

00000000800033bc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void*), void* arg)
    800033bc:	fd010113          	addi	sp,sp,-48
    800033c0:	02113423          	sd	ra,40(sp)
    800033c4:	02813023          	sd	s0,32(sp)
    800033c8:	00913c23          	sd	s1,24(sp)
    800033cc:	01213823          	sd	s2,16(sp)
    800033d0:	01313423          	sd	s3,8(sp)
    800033d4:	03010413          	addi	s0,sp,48
    800033d8:	00050493          	mv	s1,a0
    800033dc:	00058993          	mv	s3,a1
    800033e0:	00060913          	mv	s2,a2
    800033e4:	00004797          	auipc	a5,0x4
    800033e8:	f4c78793          	addi	a5,a5,-180 # 80007330 <_ZTV6Thread+0x10>
    800033ec:	00f53023          	sd	a5,0(a0)
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
    800033f0:	01800513          	li	a0,24
    800033f4:	00000097          	auipc	ra,0x0
    800033f8:	ea0080e7          	jalr	-352(ra) # 80003294 <_Znwm>
    800033fc:	00053023          	sd	zero,0(a0)
    80003400:	01353423          	sd	s3,8(a0)
    80003404:	01253823          	sd	s2,16(a0)
    80003408:	00a4b423          	sd	a0,8(s1)
}
    8000340c:	02813083          	ld	ra,40(sp)
    80003410:	02013403          	ld	s0,32(sp)
    80003414:	01813483          	ld	s1,24(sp)
    80003418:	01013903          	ld	s2,16(sp)
    8000341c:	00813983          	ld	s3,8(sp)
    80003420:	03010113          	addi	sp,sp,48
    80003424:	00008067          	ret

0000000080003428 <_ZN6Thread5startEv>:
void Thread::start(){
    80003428:	fe010113          	addi	sp,sp,-32
    8000342c:	00113c23          	sd	ra,24(sp)
    80003430:	00813823          	sd	s0,16(sp)
    80003434:	00913423          	sd	s1,8(sp)
    80003438:	02010413          	addi	s0,sp,32
    8000343c:	00050493          	mv	s1,a0
    if(myHandle)
    80003440:	00853503          	ld	a0,8(a0)
    80003444:	02050463          	beqz	a0,8000346c <_ZN6Thread5startEv+0x44>
        thread_create(&w->handle, w->body, w->arg);    
    80003448:	01053603          	ld	a2,16(a0)
    8000344c:	00853583          	ld	a1,8(a0)
    80003450:	00000097          	auipc	ra,0x0
    80003454:	b94080e7          	jalr	-1132(ra) # 80002fe4 <thread_create>
}
    80003458:	01813083          	ld	ra,24(sp)
    8000345c:	01013403          	ld	s0,16(sp)
    80003460:	00813483          	ld	s1,8(sp)
    80003464:	02010113          	addi	sp,sp,32
    80003468:	00008067          	ret
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
    8000346c:	01800513          	li	a0,24
    80003470:	00000097          	auipc	ra,0x0
    80003474:	e24080e7          	jalr	-476(ra) # 80003294 <_Znwm>
    80003478:	00053023          	sd	zero,0(a0)
    8000347c:	00053423          	sd	zero,8(a0)
    80003480:	00053823          	sd	zero,16(a0)
        myHandle = (thread_t)w;
    80003484:	00a4b423          	sd	a0,8(s1)
        thread_create(&w->handle, &runWrapper, this);   
    80003488:	00048613          	mv	a2,s1
    8000348c:	00000597          	auipc	a1,0x0
    80003490:	d8c58593          	addi	a1,a1,-628 # 80003218 <_ZN6Thread10runWrapperEPv>
    80003494:	00000097          	auipc	ra,0x0
    80003498:	b50080e7          	jalr	-1200(ra) # 80002fe4 <thread_create>
}
    8000349c:	fbdff06f          	j	80003458 <_ZN6Thread5startEv+0x30>

00000000800034a0 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):
    800034a0:	fe010113          	addi	sp,sp,-32
    800034a4:	00113c23          	sd	ra,24(sp)
    800034a8:	00813823          	sd	s0,16(sp)
    800034ac:	00913423          	sd	s1,8(sp)
    800034b0:	01213023          	sd	s2,0(sp)
    800034b4:	02010413          	addi	s0,sp,32
    800034b8:	00050493          	mv	s1,a0
    800034bc:	00058913          	mv	s2,a1
Thread(periodicWrapper, new _WrapPeriod{this, period}){}
    800034c0:	01000513          	li	a0,16
    800034c4:	00000097          	auipc	ra,0x0
    800034c8:	dd0080e7          	jalr	-560(ra) # 80003294 <_Znwm>
    800034cc:	00050613          	mv	a2,a0
    800034d0:	00953023          	sd	s1,0(a0)
    800034d4:	01253423          	sd	s2,8(a0)
    800034d8:	00000597          	auipc	a1,0x0
    800034dc:	d6c58593          	addi	a1,a1,-660 # 80003244 <_ZN14PeriodicThread15periodicWrapperEPv>
    800034e0:	00048513          	mv	a0,s1
    800034e4:	00000097          	auipc	ra,0x0
    800034e8:	ed8080e7          	jalr	-296(ra) # 800033bc <_ZN6ThreadC1EPFvPvES0_>
    800034ec:	00004797          	auipc	a5,0x4
    800034f0:	e1478793          	addi	a5,a5,-492 # 80007300 <_ZTV14PeriodicThread+0x10>
    800034f4:	00f4b023          	sd	a5,0(s1)
    800034f8:	01813083          	ld	ra,24(sp)
    800034fc:	01013403          	ld	s0,16(sp)
    80003500:	00813483          	ld	s1,8(sp)
    80003504:	00013903          	ld	s2,0(sp)
    80003508:	02010113          	addi	sp,sp,32
    8000350c:	00008067          	ret

0000000080003510 <_ZN6Thread3runEv>:
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr;}
    virtual void run () {}
    80003510:	ff010113          	addi	sp,sp,-16
    80003514:	00813423          	sd	s0,8(sp)
    80003518:	01010413          	addi	s0,sp,16
    8000351c:	00813403          	ld	s0,8(sp)
    80003520:	01010113          	addi	sp,sp,16
    80003524:	00008067          	ret

0000000080003528 <_ZN14PeriodicThread18periodicActivationEv>:
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80003528:	ff010113          	addi	sp,sp,-16
    8000352c:	00813423          	sd	s0,8(sp)
    80003530:	01010413          	addi	s0,sp,16
    80003534:	00813403          	ld	s0,8(sp)
    80003538:	01010113          	addi	sp,sp,16
    8000353c:	00008067          	ret

0000000080003540 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003540:	ff010113          	addi	sp,sp,-16
    80003544:	00113423          	sd	ra,8(sp)
    80003548:	00813023          	sd	s0,0(sp)
    8000354c:	01010413          	addi	s0,sp,16
    80003550:	00004797          	auipc	a5,0x4
    80003554:	db078793          	addi	a5,a5,-592 # 80007300 <_ZTV14PeriodicThread+0x10>
    80003558:	00f53023          	sd	a5,0(a0)
    8000355c:	00000097          	auipc	ra,0x0
    80003560:	d88080e7          	jalr	-632(ra) # 800032e4 <_ZN6ThreadD1Ev>
    80003564:	00813083          	ld	ra,8(sp)
    80003568:	00013403          	ld	s0,0(sp)
    8000356c:	01010113          	addi	sp,sp,16
    80003570:	00008067          	ret

0000000080003574 <_ZN14PeriodicThreadD0Ev>:
    80003574:	fe010113          	addi	sp,sp,-32
    80003578:	00113c23          	sd	ra,24(sp)
    8000357c:	00813823          	sd	s0,16(sp)
    80003580:	00913423          	sd	s1,8(sp)
    80003584:	02010413          	addi	s0,sp,32
    80003588:	00050493          	mv	s1,a0
    8000358c:	00004797          	auipc	a5,0x4
    80003590:	d7478793          	addi	a5,a5,-652 # 80007300 <_ZTV14PeriodicThread+0x10>
    80003594:	00f53023          	sd	a5,0(a0)
    80003598:	00000097          	auipc	ra,0x0
    8000359c:	d4c080e7          	jalr	-692(ra) # 800032e4 <_ZN6ThreadD1Ev>
    800035a0:	00048513          	mv	a0,s1
    800035a4:	00000097          	auipc	ra,0x0
    800035a8:	d18080e7          	jalr	-744(ra) # 800032bc <_ZdlPv>
    800035ac:	01813083          	ld	ra,24(sp)
    800035b0:	01013403          	ld	s0,16(sp)
    800035b4:	00813483          	ld	s1,8(sp)
    800035b8:	02010113          	addi	sp,sp,32
    800035bc:	00008067          	ret

00000000800035c0 <_ZN5Riscv10popSppSpieEv>:
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;

void Riscv::popSppSpie() 
{
    800035c0:	ff010113          	addi	sp,sp,-16
    800035c4:	00813423          	sd	s0,8(sp)
    800035c8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800035cc:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800035d0:	10200073          	sret
}
    800035d4:	00813403          	ld	s0,8(sp)
    800035d8:	01010113          	addi	sp,sp,16
    800035dc:	00008067          	ret

00000000800035e0 <_ZN3TCBC1EPFvPvES0_Pmm>:
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    800035e0:	00053023          	sd	zero,0(a0)
    800035e4:	00053423          	sd	zero,8(a0)
    800035e8:	00b53823          	sd	a1,16(a0)
    800035ec:	00c53c23          	sd	a2,24(a0)
    800035f0:	02d53023          	sd	a3,32(a0)
    800035f4:	02e53423          	sd	a4,40(a0)
    800035f8:	00100793          	li	a5,1
    800035fc:	02f52823          	sw	a5,48(a0)
    80003600:	02050a23          	sb	zero,52(a0)
    80003604:	02f50aa3          	sb	a5,53(a0)
    80003608:	02050b23          	sb	zero,54(a0)
    8000360c:	00000797          	auipc	a5,0x0
    80003610:	17078793          	addi	a5,a5,368 # 8000377c <_ZN3TCB13threadWrapperEv>
    80003614:	02f53c23          	sd	a5,56(a0)
    80003618:	04068a63          	beqz	a3,8000366c <_ZN3TCBC1EPFvPvES0_Pmm+0x8c>
    8000361c:	000017b7          	lui	a5,0x1
    80003620:	00f687b3          	add	a5,a3,a5
    80003624:	04f53023          	sd	a5,64(a0)
{    
    if(body && stack){
    80003628:	04058663          	beqz	a1,80003674 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
    8000362c:	04068463          	beqz	a3,80003674 <_ZN3TCBC1EPFvPvES0_Pmm+0x94>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80003630:	ff010113          	addi	sp,sp,-16
    80003634:	00113423          	sd	ra,8(sp)
    80003638:	00813023          	sd	s0,0(sp)
    8000363c:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    80003640:	fffff097          	auipc	ra,0xfffff
    80003644:	260080e7          	jalr	608(ra) # 800028a0 <_ZN9Scheduler3putEP3TCB>
        threadsUp++;
    80003648:	00005717          	auipc	a4,0x5
    8000364c:	72870713          	addi	a4,a4,1832 # 80008d70 <_ZN3TCB9threadsUpE>
    80003650:	00072783          	lw	a5,0(a4)
    80003654:	0017879b          	addiw	a5,a5,1
    80003658:	00f72023          	sw	a5,0(a4)
    }
}   
    8000365c:	00813083          	ld	ra,8(sp)
    80003660:	00013403          	ld	s0,0(sp)
    80003664:	01010113          	addi	sp,sp,16
    80003668:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
    8000366c:	00000793          	li	a5,0
    80003670:	fb5ff06f          	j	80003624 <_ZN3TCBC1EPFvPvES0_Pmm+0x44>
    80003674:	00008067          	ret

0000000080003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
{
    80003678:	fd010113          	addi	sp,sp,-48
    8000367c:	02113423          	sd	ra,40(sp)
    80003680:	02813023          	sd	s0,32(sp)
    80003684:	00913c23          	sd	s1,24(sp)
    80003688:	01213823          	sd	s2,16(sp)
    8000368c:	01313423          	sd	s3,8(sp)
    80003690:	01413023          	sd	s4,0(sp)
    80003694:	03010413          	addi	s0,sp,48
    80003698:	00050913          	mv	s2,a0
    8000369c:	00058993          	mv	s3,a1
    800036a0:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800036a4:	fffff097          	auipc	ra,0xfffff
    800036a8:	a74080e7          	jalr	-1420(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    800036ac:	00200593          	li	a1,2
    800036b0:	fffff097          	auipc	ra,0xfffff
    800036b4:	adc080e7          	jalr	-1316(ra) # 8000218c <_ZN15MemoryAllocator9mem_allocEm>
    800036b8:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    800036bc:	00200713          	li	a4,2
    800036c0:	000a0693          	mv	a3,s4
    800036c4:	00098613          	mv	a2,s3
    800036c8:	00090593          	mv	a1,s2
    800036cc:	00000097          	auipc	ra,0x0
    800036d0:	f14080e7          	jalr	-236(ra) # 800035e0 <_ZN3TCBC1EPFvPvES0_Pmm>
    800036d4:	0280006f          	j	800036fc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    800036d8:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    800036dc:	fffff097          	auipc	ra,0xfffff
    800036e0:	a3c080e7          	jalr	-1476(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    800036e4:	00048593          	mv	a1,s1
    800036e8:	fffff097          	auipc	ra,0xfffff
    800036ec:	c60080e7          	jalr	-928(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    800036f0:	00090513          	mv	a0,s2
    800036f4:	00007097          	auipc	ra,0x7
    800036f8:	804080e7          	jalr	-2044(ra) # 80009ef8 <_Unwind_Resume>
}
    800036fc:	00048513          	mv	a0,s1
    80003700:	02813083          	ld	ra,40(sp)
    80003704:	02013403          	ld	s0,32(sp)
    80003708:	01813483          	ld	s1,24(sp)
    8000370c:	01013903          	ld	s2,16(sp)
    80003710:	00813983          	ld	s3,8(sp)
    80003714:	00013a03          	ld	s4,0(sp)
    80003718:	03010113          	addi	sp,sp,48
    8000371c:	00008067          	ret

0000000080003720 <_ZN3TCB9initalizeEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    80003720:	ff010113          	addi	sp,sp,-16
    80003724:	00813423          	sd	s0,8(sp)
    80003728:	01010413          	addi	s0,sp,16
    if(running->userMode)
    8000372c:	00005797          	auipc	a5,0x5
    80003730:	65c78793          	addi	a5,a5,1628 # 80008d88 <_ZN3TCB7runningE>
    80003734:	0007b783          	ld	a5,0(a5)
    80003738:	0357c703          	lbu	a4,53(a5)
    8000373c:	00070c63          	beqz	a4,80003754 <_ZN3TCB9initalizeEv+0x34>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003740:	10000793          	li	a5,256
    80003744:	1007b073          	csrc	sstatus,a5
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
}
    80003748:	00813403          	ld	s0,8(sp)
    8000374c:	01010113          	addi	sp,sp,16
    80003750:	00008067          	ret
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80003754:	10000713          	li	a4,256
    80003758:	10072073          	csrs	sstatus,a4
        if(running->locked)
    8000375c:	0367c783          	lbu	a5,54(a5)
    80003760:	00078863          	beqz	a5,80003770 <_ZN3TCB9initalizeEv+0x50>
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80003764:	02000793          	li	a5,32
    80003768:	1007b073          	csrc	sstatus,a5
    8000376c:	fddff06f          	j	80003748 <_ZN3TCB9initalizeEv+0x28>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80003770:	02000793          	li	a5,32
    80003774:	1007a073          	csrs	sstatus,a5
}
    80003778:	fd1ff06f          	j	80003748 <_ZN3TCB9initalizeEv+0x28>

000000008000377c <_ZN3TCB13threadWrapperEv>:

void TCB::threadWrapper()
{
    8000377c:	ff010113          	addi	sp,sp,-16
    80003780:	00113423          	sd	ra,8(sp)
    80003784:	00813023          	sd	s0,0(sp)
    80003788:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    8000378c:	00000097          	auipc	ra,0x0
    80003790:	f94080e7          	jalr	-108(ra) # 80003720 <_ZN3TCB9initalizeEv>
    Riscv::popSppSpie();
    80003794:	00000097          	auipc	ra,0x0
    80003798:	e2c080e7          	jalr	-468(ra) # 800035c0 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    8000379c:	00005797          	auipc	a5,0x5
    800037a0:	5ec78793          	addi	a5,a5,1516 # 80008d88 <_ZN3TCB7runningE>
    800037a4:	0007b783          	ld	a5,0(a5)
    800037a8:	0107b703          	ld	a4,16(a5)
    800037ac:	0187b503          	ld	a0,24(a5)
    800037b0:	000700e7          	jalr	a4
    thread_exit();
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	8c4080e7          	jalr	-1852(ra) # 80003078 <thread_exit>
}
    800037bc:	00813083          	ld	ra,8(sp)
    800037c0:	00013403          	ld	s0,0(sp)
    800037c4:	01010113          	addi	sp,sp,16
    800037c8:	00008067          	ret

00000000800037cc <_ZN3TCB12deleteThreadEPS_>:
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t)
{
    if(t)
    800037cc:	08050063          	beqz	a0,8000384c <_ZN3TCB12deleteThreadEPS_+0x80>
    {
        if(running != t && t->isFinished())
    800037d0:	00005797          	auipc	a5,0x5
    800037d4:	5b878793          	addi	a5,a5,1464 # 80008d88 <_ZN3TCB7runningE>
    800037d8:	0007b783          	ld	a5,0(a5)
    800037dc:	00a78863          	beq	a5,a0,800037ec <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    800037e0:	03052703          	lw	a4,48(a0)
    800037e4:	00200793          	li	a5,2
    800037e8:	00f70863          	beq	a4,a5,800037f8 <_ZN3TCB12deleteThreadEPS_+0x2c>
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
    800037ec:	00100793          	li	a5,1
    800037f0:	02f50a23          	sb	a5,52(a0)
        }        
    }
}
    800037f4:	00008067          	ret
{
    800037f8:	fe010113          	addi	sp,sp,-32
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	00813823          	sd	s0,16(sp)
    80003804:	00913423          	sd	s1,8(sp)
    80003808:	02010413          	addi	s0,sp,32
    8000380c:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80003810:	fffff097          	auipc	ra,0xfffff
    80003814:	908080e7          	jalr	-1784(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    80003818:	0204b583          	ld	a1,32(s1)
    8000381c:	fffff097          	auipc	ra,0xfffff
    80003820:	b2c080e7          	jalr	-1236(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    80003824:	fffff097          	auipc	ra,0xfffff
    80003828:	8f4080e7          	jalr	-1804(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    8000382c:	00048593          	mv	a1,s1
    80003830:	fffff097          	auipc	ra,0xfffff
    80003834:	b18080e7          	jalr	-1256(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003838:	01813083          	ld	ra,24(sp)
    8000383c:	01013403          	ld	s0,16(sp)
    80003840:	00813483          	ld	s1,8(sp)
    80003844:	02010113          	addi	sp,sp,32
    80003848:	00008067          	ret
    8000384c:	00008067          	ret

0000000080003850 <_ZN3TCB22createMainKernelThreadEv>:
    TCB::yield(); 
}

TCB* TCB::createMainKernelThread()
{
    if(!kernelThread)
    80003850:	00005797          	auipc	a5,0x5
    80003854:	52878793          	addi	a5,a5,1320 # 80008d78 <_ZN3TCB12kernelThreadE>
    80003858:	0007b783          	ld	a5,0(a5)
    8000385c:	00078e63          	beqz	a5,80003878 <_ZN3TCB22createMainKernelThreadEv+0x28>
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    80003860:	00005797          	auipc	a5,0x5
    80003864:	51878793          	addi	a5,a5,1304 # 80008d78 <_ZN3TCB12kernelThreadE>
    80003868:	0007b503          	ld	a0,0(a5)
    8000386c:	00005797          	auipc	a5,0x5
    80003870:	50a7be23          	sd	a0,1308(a5) # 80008d88 <_ZN3TCB7runningE>
    return kernelThread;
}
    80003874:	00008067          	ret
{
    80003878:	ff010113          	addi	sp,sp,-16
    8000387c:	00113423          	sd	ra,8(sp)
    80003880:	00813023          	sd	s0,0(sp)
    80003884:	01010413          	addi	s0,sp,16
        kernelThread = createThread(nullptr);
    80003888:	00000613          	li	a2,0
    8000388c:	00000593          	li	a1,0
    80003890:	00000513          	li	a0,0
    80003894:	00000097          	auipc	ra,0x0
    80003898:	de4080e7          	jalr	-540(ra) # 80003678 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000389c:	00005797          	auipc	a5,0x5
    800038a0:	4ca7be23          	sd	a0,1244(a5) # 80008d78 <_ZN3TCB12kernelThreadE>
    void setKernelMode() { userMode = false; }
    800038a4:	02050aa3          	sb	zero,53(a0)
    void setKernelLocked() { locked = true; }
    800038a8:	00100793          	li	a5,1
    800038ac:	02f50b23          	sb	a5,54(a0)
    void setState(TCBState s) {state = s;}
    800038b0:	02052823          	sw	zero,48(a0)
    running = kernelThread;
    800038b4:	00005797          	auipc	a5,0x5
    800038b8:	4c478793          	addi	a5,a5,1220 # 80008d78 <_ZN3TCB12kernelThreadE>
    800038bc:	0007b503          	ld	a0,0(a5)
    800038c0:	00005797          	auipc	a5,0x5
    800038c4:	4ca7b423          	sd	a0,1224(a5) # 80008d88 <_ZN3TCB7runningE>
}
    800038c8:	00813083          	ld	ra,8(sp)
    800038cc:	00013403          	ld	s0,0(sp)
    800038d0:	01010113          	addi	sp,sp,16
    800038d4:	00008067          	ret

00000000800038d8 <_ZN3TCB9endKernelEv>:

int TCB::endKernel()
{
    if(kernelThread)
    800038d8:	00005797          	auipc	a5,0x5
    800038dc:	4a078793          	addi	a5,a5,1184 # 80008d78 <_ZN3TCB12kernelThreadE>
    800038e0:	0007b583          	ld	a1,0(a5)
    800038e4:	04058463          	beqz	a1,8000392c <_ZN3TCB9endKernelEv+0x54>
{
    800038e8:	ff010113          	addi	sp,sp,-16
    800038ec:	00113423          	sd	ra,8(sp)
    800038f0:	00813023          	sd	s0,0(sp)
    800038f4:	01010413          	addi	s0,sp,16
    800038f8:	00005517          	auipc	a0,0x5
    800038fc:	4f050513          	addi	a0,a0,1264 # 80008de8 <_ZN9Scheduler5queueE>
    80003900:	fffff097          	auipc	ra,0xfffff
    80003904:	ea8080e7          	jalr	-344(ra) # 800027a8 <_ZN8TcbQueue11insertFrontEP3TCB>
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
    80003908:	00005797          	auipc	a5,0x5
    8000390c:	4607b823          	sd	zero,1136(a5) # 80008d78 <_ZN3TCB12kernelThreadE>
        TCB::dispatch();
    80003910:	00000097          	auipc	ra,0x0
    80003914:	024080e7          	jalr	36(ra) # 80003934 <_ZN3TCB8dispatchEv>
    }
    return -1;

    
}
    80003918:	fff00513          	li	a0,-1
    8000391c:	00813083          	ld	ra,8(sp)
    80003920:	00013403          	ld	s0,0(sp)
    80003924:	01010113          	addi	sp,sp,16
    80003928:	00008067          	ret
    8000392c:	fff00513          	li	a0,-1
    80003930:	00008067          	ret

0000000080003934 <_ZN3TCB8dispatchEv>:
{
    80003934:	fe010113          	addi	sp,sp,-32
    80003938:	00113c23          	sd	ra,24(sp)
    8000393c:	00813823          	sd	s0,16(sp)
    80003940:	00913423          	sd	s1,8(sp)
    80003944:	02010413          	addi	s0,sp,32
    TCB* oldRunning = running;
    80003948:	00005797          	auipc	a5,0x5
    8000394c:	44078793          	addi	a5,a5,1088 # 80008d88 <_ZN3TCB7runningE>
    80003950:	0007b483          	ld	s1,0(a5)
    bool isFinished(){ return state == FINISHED; }
    80003954:	0304a783          	lw	a5,48(s1)
    if(oldRunning->isFinished())
    80003958:	00200713          	li	a4,2
    8000395c:	06e78c63          	beq	a5,a4,800039d4 <_ZN3TCB8dispatchEv+0xa0>
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    80003960:	00078c63          	beqz	a5,80003978 <_ZN3TCB8dispatchEv+0x44>
    80003964:	00300713          	li	a4,3
    80003968:	00e78863          	beq	a5,a4,80003978 <_ZN3TCB8dispatchEv+0x44>
        Scheduler::put(oldRunning);
    8000396c:	00048513          	mv	a0,s1
    80003970:	fffff097          	auipc	ra,0xfffff
    80003974:	f30080e7          	jalr	-208(ra) # 800028a0 <_ZN9Scheduler3putEP3TCB>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80003978:	00005797          	auipc	a5,0x5
    8000397c:	3f878793          	addi	a5,a5,1016 # 80008d70 <_ZN3TCB9threadsUpE>
    80003980:	0007a703          	lw	a4,0(a5)
    80003984:	00200793          	li	a5,2
    80003988:	00e7cc63          	blt	a5,a4,800039a0 <_ZN3TCB8dispatchEv+0x6c>
    8000398c:	00005797          	auipc	a5,0x5
    80003990:	3bc78793          	addi	a5,a5,956 # 80008d48 <_ZN5StdIO7obufferE>
    80003994:	0007b783          	ld	a5,0(a5)
    80003998:	4807a783          	lw	a5,1152(a5)
    8000399c:	08078263          	beqz	a5,80003a20 <_ZN3TCB8dispatchEv+0xec>
    running = Scheduler::get(); 
    800039a0:	fffff097          	auipc	ra,0xfffff
    800039a4:	ed0080e7          	jalr	-304(ra) # 80002870 <_ZN9Scheduler3getEv>
    800039a8:	00005797          	auipc	a5,0x5
    800039ac:	3ea7b023          	sd	a0,992(a5) # 80008d88 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    800039b0:	03850593          	addi	a1,a0,56
    800039b4:	03848513          	addi	a0,s1,56
    800039b8:	ffffe097          	auipc	ra,0xffffe
    800039bc:	86c080e7          	jalr	-1940(ra) # 80001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800039c0:	01813083          	ld	ra,24(sp)
    800039c4:	01013403          	ld	s0,16(sp)
    800039c8:	00813483          	ld	s1,8(sp)
    800039cc:	02010113          	addi	sp,sp,32
    800039d0:	00008067          	ret
        threadsUp--;
    800039d4:	00005717          	auipc	a4,0x5
    800039d8:	39c70713          	addi	a4,a4,924 # 80008d70 <_ZN3TCB9threadsUpE>
    800039dc:	00072783          	lw	a5,0(a4)
    800039e0:	fff7879b          	addiw	a5,a5,-1
    800039e4:	00f72023          	sw	a5,0(a4)
        if(oldRunning->deleteOnEnd)
    800039e8:	0344c783          	lbu	a5,52(s1)
    800039ec:	f80786e3          	beqz	a5,80003978 <_ZN3TCB8dispatchEv+0x44>
            delete oldRunning;
    800039f0:	f80484e3          	beqz	s1,80003978 <_ZN3TCB8dispatchEv+0x44>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    800039f4:	ffffe097          	auipc	ra,0xffffe
    800039f8:	724080e7          	jalr	1828(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
        allocator.mem_free(this->stack);
    800039fc:	0204b583          	ld	a1,32(s1)
    80003a00:	fffff097          	auipc	ra,0xfffff
    80003a04:	948080e7          	jalr	-1720(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    80003a08:	ffffe097          	auipc	ra,0xffffe
    80003a0c:	710080e7          	jalr	1808(ra) # 80002118 <_ZN15MemoryAllocator11getInstanceEv>
    80003a10:	00048593          	mv	a1,s1
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	934080e7          	jalr	-1740(ra) # 80002348 <_ZN15MemoryAllocator8mem_freeEPv>
    80003a1c:	f5dff06f          	j	80003978 <_ZN3TCB8dispatchEv+0x44>
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    80003a20:	00000097          	auipc	ra,0x0
    80003a24:	eb8080e7          	jalr	-328(ra) # 800038d8 <_ZN3TCB9endKernelEv>
    80003a28:	f79ff06f          	j	800039a0 <_ZN3TCB8dispatchEv+0x6c>

0000000080003a2c <_ZN3TCB5yieldEv>:
{
    80003a2c:	ff010113          	addi	sp,sp,-16
    80003a30:	00113423          	sd	ra,8(sp)
    80003a34:	00813023          	sd	s0,0(sp)
    80003a38:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80003a3c:	ffffd097          	auipc	ra,0xffffd
    80003a40:	6f0080e7          	jalr	1776(ra) # 8000112c <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80003a44:	00000097          	auipc	ra,0x0
    80003a48:	ef0080e7          	jalr	-272(ra) # 80003934 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80003a4c:	ffffd097          	auipc	ra,0xffffd
    80003a50:	75c080e7          	jalr	1884(ra) # 800011a8 <_ZN5Riscv12popRegistersEv>
}
    80003a54:	00813083          	ld	ra,8(sp)
    80003a58:	00013403          	ld	s0,0(sp)
    80003a5c:	01010113          	addi	sp,sp,16
    80003a60:	00008067          	ret

0000000080003a64 <_ZN3TCB5sleepEm>:
{
    80003a64:	ff010113          	addi	sp,sp,-16
    80003a68:	00113423          	sd	ra,8(sp)
    80003a6c:	00813023          	sd	s0,0(sp)
    80003a70:	01010413          	addi	s0,sp,16
    running->setState(SLEEPING);
    80003a74:	00005797          	auipc	a5,0x5
    80003a78:	31478793          	addi	a5,a5,788 # 80008d88 <_ZN3TCB7runningE>
    80003a7c:	0007b783          	ld	a5,0(a5)
    void setState(TCBState s) {state = s;}
    80003a80:	00300713          	li	a4,3
    80003a84:	02e7a823          	sw	a4,48(a5)
    Scheduler::put_sleeper(running, t);
    80003a88:	00050593          	mv	a1,a0
    80003a8c:	00078513          	mv	a0,a5
    80003a90:	fffff097          	auipc	ra,0xfffff
    80003a94:	ea4080e7          	jalr	-348(ra) # 80002934 <_ZN9Scheduler11put_sleeperEP3TCBm>
    TCB::yield(); 
    80003a98:	00000097          	auipc	ra,0x0
    80003a9c:	f94080e7          	jalr	-108(ra) # 80003a2c <_ZN3TCB5yieldEv>
}
    80003aa0:	00813083          	ld	ra,8(sp)
    80003aa4:	00013403          	ld	s0,0(sp)
    80003aa8:	01010113          	addi	sp,sp,16
    80003aac:	00008067          	ret

0000000080003ab0 <_ZN3TCB15setPanicContextEmm>:

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    80003ab0:	ff010113          	addi	sp,sp,-16
    80003ab4:	00813423          	sd	s0,8(sp)
    80003ab8:	01010413          	addi	s0,sp,16
    panicContext.ra = ra;
    80003abc:	00005797          	auipc	a5,0x5
    80003ac0:	35c78793          	addi	a5,a5,860 # 80008e18 <_ZN3TCB12panicContextE>
    80003ac4:	00a7b023          	sd	a0,0(a5)
    panicContext.sp = sp;
    80003ac8:	00b7b423          	sd	a1,8(a5)
}
    80003acc:	00813403          	ld	s0,8(sp)
    80003ad0:	01010113          	addi	sp,sp,16
    80003ad4:	00008067          	ret

0000000080003ad8 <_ZN3TCB13panicDispatchEv>:

void TCB::panicDispatch()
{
    80003ad8:	ff010113          	addi	sp,sp,-16
    80003adc:	00113423          	sd	ra,8(sp)
    80003ae0:	00813023          	sd	s0,0(sp)
    80003ae4:	01010413          	addi	s0,sp,16
    contextSwitch(&running->context, &panicContext);
    80003ae8:	00005797          	auipc	a5,0x5
    80003aec:	2a078793          	addi	a5,a5,672 # 80008d88 <_ZN3TCB7runningE>
    80003af0:	0007b503          	ld	a0,0(a5)
    80003af4:	00005597          	auipc	a1,0x5
    80003af8:	32458593          	addi	a1,a1,804 # 80008e18 <_ZN3TCB12panicContextE>
    80003afc:	03850513          	addi	a0,a0,56
    80003b00:	ffffd097          	auipc	ra,0xffffd
    80003b04:	724080e7          	jalr	1828(ra) # 80001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    80003b08:	00813083          	ld	ra,8(sp)
    80003b0c:	00013403          	ld	s0,0(sp)
    80003b10:	01010113          	addi	sp,sp,16
    80003b14:	00008067          	ret

0000000080003b18 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    80003b18:	f9010113          	addi	sp,sp,-112
    80003b1c:	06113423          	sd	ra,104(sp)
    80003b20:	06813023          	sd	s0,96(sp)
    80003b24:	04913c23          	sd	s1,88(sp)
    80003b28:	05213823          	sd	s2,80(sp)
    80003b2c:	05313423          	sd	s3,72(sp)
    80003b30:	05413023          	sd	s4,64(sp)
    80003b34:	03513c23          	sd	s5,56(sp)
    80003b38:	03613823          	sd	s6,48(sp)
    80003b3c:	03713423          	sd	s7,40(sp)
    80003b40:	03813023          	sd	s8,32(sp)
    80003b44:	07010413          	addi	s0,sp,112
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80003b48:	00010b93          	mv	s7,sp
        printString("Unesite broj proizvodjaca?\n");
    80003b4c:	00004517          	auipc	a0,0x4
    80003b50:	89450513          	addi	a0,a0,-1900 # 800073e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x28>
    80003b54:	00001097          	auipc	ra,0x1
    80003b58:	c18080e7          	jalr	-1000(ra) # 8000476c <_Z11printStringPKc>
        getString(input, 30);
    80003b5c:	01e00593          	li	a1,30
    80003b60:	f9040513          	addi	a0,s0,-112
    80003b64:	00001097          	auipc	ra,0x1
    80003b68:	c84080e7          	jalr	-892(ra) # 800047e8 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80003b6c:	f9040513          	addi	a0,s0,-112
    80003b70:	00001097          	auipc	ra,0x1
    80003b74:	d40080e7          	jalr	-704(ra) # 800048b0 <_Z11stringToIntPKc>
    80003b78:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    80003b7c:	00004517          	auipc	a0,0x4
    80003b80:	88450513          	addi	a0,a0,-1916 # 80007400 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x48>
    80003b84:	00001097          	auipc	ra,0x1
    80003b88:	be8080e7          	jalr	-1048(ra) # 8000476c <_Z11printStringPKc>
        getString(input, 30);
    80003b8c:	01e00593          	li	a1,30
    80003b90:	f9040513          	addi	a0,s0,-112
    80003b94:	00001097          	auipc	ra,0x1
    80003b98:	c54080e7          	jalr	-940(ra) # 800047e8 <_Z9getStringPci>
        n = stringToInt(input);
    80003b9c:	f9040513          	addi	a0,s0,-112
    80003ba0:	00001097          	auipc	ra,0x1
    80003ba4:	d10080e7          	jalr	-752(ra) # 800048b0 <_Z11stringToIntPKc>
    80003ba8:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    80003bac:	00004517          	auipc	a0,0x4
    80003bb0:	87450513          	addi	a0,a0,-1932 # 80007420 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x68>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	bb8080e7          	jalr	-1096(ra) # 8000476c <_Z11printStringPKc>
    80003bbc:	00a00593          	li	a1,10
    80003bc0:	00098513          	mv	a0,s3
    80003bc4:	00001097          	auipc	ra,0x1
    80003bc8:	d3c080e7          	jalr	-708(ra) # 80004900 <_Z8printIntmi>
        printString(" i velicina bafera "); printInt(n);
    80003bcc:	00004517          	auipc	a0,0x4
    80003bd0:	86c50513          	addi	a0,a0,-1940 # 80007438 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x80>
    80003bd4:	00001097          	auipc	ra,0x1
    80003bd8:	b98080e7          	jalr	-1128(ra) # 8000476c <_Z11printStringPKc>
    80003bdc:	00a00593          	li	a1,10
    80003be0:	00048513          	mv	a0,s1
    80003be4:	00001097          	auipc	ra,0x1
    80003be8:	d1c080e7          	jalr	-740(ra) # 80004900 <_Z8printIntmi>
        printString(".\n");
    80003bec:	00004517          	auipc	a0,0x4
    80003bf0:	86450513          	addi	a0,a0,-1948 # 80007450 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x98>
    80003bf4:	00001097          	auipc	ra,0x1
    80003bf8:	b78080e7          	jalr	-1160(ra) # 8000476c <_Z11printStringPKc>
        if(threadNum > n) {
    80003bfc:	0334c463          	blt	s1,s3,80003c24 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x10c>
        } else if (threadNum < 1) {
    80003c00:	03305c63          	blez	s3,80003c38 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x120>
        BufferCPP *buffer = new BufferCPP(n);
    80003c04:	03800513          	li	a0,56
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	68c080e7          	jalr	1676(ra) # 80003294 <_Znwm>
    80003c10:	00050a93          	mv	s5,a0
    80003c14:	00048593          	mv	a1,s1
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	6ec080e7          	jalr	1772(ra) # 80004304 <_ZN9BufferCPPC1Ei>
    80003c20:	0300006f          	j	80003c50 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x138>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c24:	00004517          	auipc	a0,0x4
    80003c28:	83450513          	addi	a0,a0,-1996 # 80007458 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xa0>
    80003c2c:	00001097          	auipc	ra,0x1
    80003c30:	b40080e7          	jalr	-1216(ra) # 8000476c <_Z11printStringPKc>
            return;
    80003c34:	0140006f          	j	80003c48 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c38:	00004517          	auipc	a0,0x4
    80003c3c:	86050513          	addi	a0,a0,-1952 # 80007498 <_ZTVN19ConsumerProducerCPP8ConsumerE+0xe0>
    80003c40:	00001097          	auipc	ra,0x1
    80003c44:	b2c080e7          	jalr	-1236(ra) # 8000476c <_Z11printStringPKc>
            return;
    80003c48:	000b8113          	mv	sp,s7
    80003c4c:	2140006f          	j	80003e60 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x348>
        waitForAll = new Semaphore(0);
    80003c50:	01000513          	li	a0,16
    80003c54:	fffff097          	auipc	ra,0xfffff
    80003c58:	640080e7          	jalr	1600(ra) # 80003294 <_Znwm>
    80003c5c:	00050493          	mv	s1,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    80003c60:	00003797          	auipc	a5,0x3
    80003c64:	6f878793          	addi	a5,a5,1784 # 80007358 <_ZTV9Semaphore+0x10>
    80003c68:	00f53023          	sd	a5,0(a0)
    80003c6c:	00000593          	li	a1,0
    80003c70:	00850513          	addi	a0,a0,8
    80003c74:	fffff097          	auipc	ra,0xfffff
    80003c78:	428080e7          	jalr	1064(ra) # 8000309c <sem_open>
    80003c7c:	00005917          	auipc	s2,0x5
    80003c80:	11c90913          	addi	s2,s2,284 # 80008d98 <_ZN19ConsumerProducerCPP10waitForAllE>
    80003c84:	00993023          	sd	s1,0(s2)
        Thread *producers[threadNum];
    80003c88:	00399793          	slli	a5,s3,0x3
    80003c8c:	00f78793          	addi	a5,a5,15
    80003c90:	ff07f793          	andi	a5,a5,-16
    80003c94:	40f10133          	sub	sp,sp,a5
    80003c98:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    80003c9c:	0019879b          	addiw	a5,s3,1
    80003ca0:	00179713          	slli	a4,a5,0x1
    80003ca4:	00f70733          	add	a4,a4,a5
    80003ca8:	00371793          	slli	a5,a4,0x3
    80003cac:	00f78793          	addi	a5,a5,15
    80003cb0:	ff07f793          	andi	a5,a5,-16
    80003cb4:	40f10133          	sub	sp,sp,a5
    80003cb8:	00010c13          	mv	s8,sp
        threadData[threadNum].id = threadNum;
    80003cbc:	00199793          	slli	a5,s3,0x1
    80003cc0:	013787b3          	add	a5,a5,s3
    80003cc4:	00379493          	slli	s1,a5,0x3
    80003cc8:	009c04b3          	add	s1,s8,s1
    80003ccc:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    80003cd0:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    80003cd4:	00093783          	ld	a5,0(s2)
    80003cd8:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80003cdc:	01800513          	li	a0,24
    80003ce0:	fffff097          	auipc	ra,0xfffff
    80003ce4:	5b4080e7          	jalr	1460(ra) # 80003294 <_Znwm>
    80003ce8:	00050b13          	mv	s6,a0
    Thread (){ myHandle = nullptr;}
    80003cec:	00053423          	sd	zero,8(a0)
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003cf0:	00003797          	auipc	a5,0x3
    80003cf4:	6d878793          	addi	a5,a5,1752 # 800073c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80003cf8:	00f53023          	sd	a5,0(a0)
    80003cfc:	00953823          	sd	s1,16(a0)
        consumer->start();
    80003d00:	fffff097          	auipc	ra,0xfffff
    80003d04:	728080e7          	jalr	1832(ra) # 80003428 <_ZN6Thread5startEv>
        threadData[0].id = 0;
    80003d08:	000c2023          	sw	zero,0(s8)
        threadData[0].buffer = buffer;
    80003d0c:	015c3423          	sd	s5,8(s8)
        threadData[0].sem = waitForAll;
    80003d10:	00093783          	ld	a5,0(s2)
    80003d14:	00fc3823          	sd	a5,16(s8)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80003d18:	01800513          	li	a0,24
    80003d1c:	fffff097          	auipc	ra,0xfffff
    80003d20:	578080e7          	jalr	1400(ra) # 80003294 <_Znwm>
    80003d24:	00053423          	sd	zero,8(a0)
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80003d28:	00003717          	auipc	a4,0x3
    80003d2c:	65070713          	addi	a4,a4,1616 # 80007378 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80003d30:	00e53023          	sd	a4,0(a0)
    80003d34:	01853823          	sd	s8,16(a0)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80003d38:	00aa3023          	sd	a0,0(s4)
        producers[0]->start();
    80003d3c:	fffff097          	auipc	ra,0xfffff
    80003d40:	6ec080e7          	jalr	1772(ra) # 80003428 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80003d44:	00100913          	li	s2,1
    80003d48:	07395463          	bge	s2,s3,80003db0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x298>
            threadData[i].id = i;
    80003d4c:	00191793          	slli	a5,s2,0x1
    80003d50:	012787b3          	add	a5,a5,s2
    80003d54:	00379493          	slli	s1,a5,0x3
    80003d58:	009c04b3          	add	s1,s8,s1
    80003d5c:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    80003d60:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    80003d64:	00005797          	auipc	a5,0x5
    80003d68:	03478793          	addi	a5,a5,52 # 80008d98 <_ZN19ConsumerProducerCPP10waitForAllE>
    80003d6c:	0007b783          	ld	a5,0(a5)
    80003d70:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    80003d74:	01800513          	li	a0,24
    80003d78:	fffff097          	auipc	ra,0xfffff
    80003d7c:	51c080e7          	jalr	1308(ra) # 80003294 <_Znwm>
    80003d80:	00053423          	sd	zero,8(a0)
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80003d84:	00003717          	auipc	a4,0x3
    80003d88:	61c70713          	addi	a4,a4,1564 # 800073a0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80003d8c:	00e53023          	sd	a4,0(a0)
    80003d90:	00953823          	sd	s1,16(a0)
            producers[i] = new Producer(&threadData[i]);
    80003d94:	00391713          	slli	a4,s2,0x3
    80003d98:	00ea0733          	add	a4,s4,a4
    80003d9c:	00a73023          	sd	a0,0(a4)
            producers[i]->start();
    80003da0:	fffff097          	auipc	ra,0xfffff
    80003da4:	688080e7          	jalr	1672(ra) # 80003428 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80003da8:	0019091b          	addiw	s2,s2,1
    80003dac:	f9dff06f          	j	80003d48 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x230>
    static void dispatch () { thread_dispatch(); }
    80003db0:	fffff097          	auipc	ra,0xfffff
    80003db4:	210080e7          	jalr	528(ra) # 80002fc0 <thread_dispatch>
        for (int i = 0; i <= threadNum; i++) {
    80003db8:	00000493          	li	s1,0
    80003dbc:	0299c263          	blt	s3,s1,80003de0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2c8>
            waitForAll->wait();
    80003dc0:	00005797          	auipc	a5,0x5
    80003dc4:	fd878793          	addi	a5,a5,-40 # 80008d98 <_ZN19ConsumerProducerCPP10waitForAllE>
    80003dc8:	0007b783          	ld	a5,0(a5)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    80003dcc:	0087b503          	ld	a0,8(a5)
    80003dd0:	fffff097          	auipc	ra,0xfffff
    80003dd4:	340080e7          	jalr	832(ra) # 80003110 <sem_wait>
        for (int i = 0; i <= threadNum; i++) {
    80003dd8:	0014849b          	addiw	s1,s1,1
    80003ddc:	fe1ff06f          	j	80003dbc <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2a4>
        delete waitForAll;
    80003de0:	00005797          	auipc	a5,0x5
    80003de4:	fb878793          	addi	a5,a5,-72 # 80008d98 <_ZN19ConsumerProducerCPP10waitForAllE>
    80003de8:	0007b503          	ld	a0,0(a5)
    80003dec:	00050863          	beqz	a0,80003dfc <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2e4>
    80003df0:	00053783          	ld	a5,0(a0)
    80003df4:	0087b783          	ld	a5,8(a5)
    80003df8:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    80003dfc:	00000493          	li	s1,0
    80003e00:	0080006f          	j	80003e08 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f0>
        for (int i = 0; i < threadNum; i++) {
    80003e04:	0014849b          	addiw	s1,s1,1
    80003e08:	0334d263          	bge	s1,s3,80003e2c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x314>
            delete producers[i];
    80003e0c:	00349793          	slli	a5,s1,0x3
    80003e10:	00fa07b3          	add	a5,s4,a5
    80003e14:	0007b503          	ld	a0,0(a5)
    80003e18:	fe0506e3          	beqz	a0,80003e04 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
    80003e1c:	00053783          	ld	a5,0(a0)
    80003e20:	0087b783          	ld	a5,8(a5)
    80003e24:	000780e7          	jalr	a5
    80003e28:	fddff06f          	j	80003e04 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2ec>
        delete consumer;
    80003e2c:	000b0a63          	beqz	s6,80003e40 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x328>
    80003e30:	000b3783          	ld	a5,0(s6)
    80003e34:	0087b783          	ld	a5,8(a5)
    80003e38:	000b0513          	mv	a0,s6
    80003e3c:	000780e7          	jalr	a5
        delete buffer;
    80003e40:	000a8e63          	beqz	s5,80003e5c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x344>
    80003e44:	000a8513          	mv	a0,s5
    80003e48:	00001097          	auipc	ra,0x1
    80003e4c:	824080e7          	jalr	-2012(ra) # 8000466c <_ZN9BufferCPPD1Ev>
    80003e50:	000a8513          	mv	a0,s5
    80003e54:	fffff097          	auipc	ra,0xfffff
    80003e58:	468080e7          	jalr	1128(ra) # 800032bc <_ZdlPv>
    80003e5c:	000b8113          	mv	sp,s7
    }
    80003e60:	f9040113          	addi	sp,s0,-112
    80003e64:	06813083          	ld	ra,104(sp)
    80003e68:	06013403          	ld	s0,96(sp)
    80003e6c:	05813483          	ld	s1,88(sp)
    80003e70:	05013903          	ld	s2,80(sp)
    80003e74:	04813983          	ld	s3,72(sp)
    80003e78:	04013a03          	ld	s4,64(sp)
    80003e7c:	03813a83          	ld	s5,56(sp)
    80003e80:	03013b03          	ld	s6,48(sp)
    80003e84:	02813b83          	ld	s7,40(sp)
    80003e88:	02013c03          	ld	s8,32(sp)
    80003e8c:	07010113          	addi	sp,sp,112
    80003e90:	00008067          	ret
    80003e94:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80003e98:	000a8513          	mv	a0,s5
    80003e9c:	fffff097          	auipc	ra,0xfffff
    80003ea0:	420080e7          	jalr	1056(ra) # 800032bc <_ZdlPv>
    80003ea4:	00048513          	mv	a0,s1
    80003ea8:	00006097          	auipc	ra,0x6
    80003eac:	050080e7          	jalr	80(ra) # 80009ef8 <_Unwind_Resume>
    80003eb0:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    80003eb4:	00048513          	mv	a0,s1
    80003eb8:	fffff097          	auipc	ra,0xfffff
    80003ebc:	404080e7          	jalr	1028(ra) # 800032bc <_ZdlPv>
    80003ec0:	00090513          	mv	a0,s2
    80003ec4:	00006097          	auipc	ra,0x6
    80003ec8:	034080e7          	jalr	52(ra) # 80009ef8 <_Unwind_Resume>

0000000080003ecc <_Z8userMainv>:
//RADI: #include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
//#include"../test/testing.hpp"
//#include"../h/syscall_c.h"
//#include"../test/printing.hpp"
void userMain() {
    80003ecc:	ff010113          	addi	sp,sp,-16
    80003ed0:	00113423          	sd	ra,8(sp)
    80003ed4:	00813023          	sd	s0,0(sp)
    80003ed8:	01010413          	addi	s0,sp,16

    //NZM? producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //NZM? producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //RADI: testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80003edc:	00000097          	auipc	ra,0x0
    80003ee0:	c3c080e7          	jalr	-964(ra) # 80003b18 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
    80003ee4:	00813083          	ld	ra,8(sp)
    80003ee8:	00013403          	ld	s0,0(sp)
    80003eec:	01010113          	addi	sp,sp,16
    80003ef0:	00008067          	ret

0000000080003ef4 <_ZN9SemaphoreD1Ev>:
    virtual ~Semaphore (){ sem_close(myHandle); }
    80003ef4:	ff010113          	addi	sp,sp,-16
    80003ef8:	00113423          	sd	ra,8(sp)
    80003efc:	00813023          	sd	s0,0(sp)
    80003f00:	01010413          	addi	s0,sp,16
    80003f04:	00003797          	auipc	a5,0x3
    80003f08:	45478793          	addi	a5,a5,1108 # 80007358 <_ZTV9Semaphore+0x10>
    80003f0c:	00f53023          	sd	a5,0(a0)
    80003f10:	00853503          	ld	a0,8(a0)
    80003f14:	fffff097          	auipc	ra,0xfffff
    80003f18:	1c4080e7          	jalr	452(ra) # 800030d8 <sem_close>
    80003f1c:	00813083          	ld	ra,8(sp)
    80003f20:	00013403          	ld	s0,0(sp)
    80003f24:	01010113          	addi	sp,sp,16
    80003f28:	00008067          	ret

0000000080003f2c <_ZN9SemaphoreD0Ev>:
    80003f2c:	fe010113          	addi	sp,sp,-32
    80003f30:	00113c23          	sd	ra,24(sp)
    80003f34:	00813823          	sd	s0,16(sp)
    80003f38:	00913423          	sd	s1,8(sp)
    80003f3c:	02010413          	addi	s0,sp,32
    80003f40:	00050493          	mv	s1,a0
    80003f44:	00003797          	auipc	a5,0x3
    80003f48:	41478793          	addi	a5,a5,1044 # 80007358 <_ZTV9Semaphore+0x10>
    80003f4c:	00f53023          	sd	a5,0(a0)
    80003f50:	00853503          	ld	a0,8(a0)
    80003f54:	fffff097          	auipc	ra,0xfffff
    80003f58:	184080e7          	jalr	388(ra) # 800030d8 <sem_close>
    80003f5c:	00048513          	mv	a0,s1
    80003f60:	fffff097          	auipc	ra,0xfffff
    80003f64:	35c080e7          	jalr	860(ra) # 800032bc <_ZdlPv>
    80003f68:	01813083          	ld	ra,24(sp)
    80003f6c:	01013403          	ld	s0,16(sp)
    80003f70:	00813483          	ld	s1,8(sp)
    80003f74:	02010113          	addi	sp,sp,32
    80003f78:	00008067          	ret

0000000080003f7c <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    80003f7c:	fd010113          	addi	sp,sp,-48
    80003f80:	02113423          	sd	ra,40(sp)
    80003f84:	02813023          	sd	s0,32(sp)
    80003f88:	00913c23          	sd	s1,24(sp)
    80003f8c:	01213823          	sd	s2,16(sp)
    80003f90:	01313423          	sd	s3,8(sp)
    80003f94:	03010413          	addi	s0,sp,48
    80003f98:	00050913          	mv	s2,a0
            int i = 0;
    80003f9c:	00000993          	li	s3,0
    80003fa0:	0100006f          	j	80003fb0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    80003fa4:	00a00513          	li	a0,10
    80003fa8:	fffff097          	auipc	ra,0xfffff
    80003fac:	24c080e7          	jalr	588(ra) # 800031f4 <putc>
            while (!threadEnd) {
    80003fb0:	00005797          	auipc	a5,0x5
    80003fb4:	de078793          	addi	a5,a5,-544 # 80008d90 <_ZN19ConsumerProducerCPP9threadEndE>
    80003fb8:	0007a783          	lw	a5,0(a5)
    80003fbc:	0007879b          	sext.w	a5,a5
    80003fc0:	02079c63          	bnez	a5,80003ff8 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
                int key = td->buffer->get();
    80003fc4:	01093783          	ld	a5,16(s2)
    80003fc8:	0087b503          	ld	a0,8(a5)
    80003fcc:	00000097          	auipc	ra,0x0
    80003fd0:	56c080e7          	jalr	1388(ra) # 80004538 <_ZN9BufferCPP3getEv>
                i++;
    80003fd4:	0019849b          	addiw	s1,s3,1
    80003fd8:	0004899b          	sext.w	s3,s1
    80003fdc:	0ff57513          	andi	a0,a0,255
    80003fe0:	fffff097          	auipc	ra,0xfffff
    80003fe4:	214080e7          	jalr	532(ra) # 800031f4 <putc>
                if (i % 80 == 0) {
    80003fe8:	05000793          	li	a5,80
    80003fec:	02f4e4bb          	remw	s1,s1,a5
    80003ff0:	fc0490e3          	bnez	s1,80003fb0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80003ff4:	fb1ff06f          	j	80003fa4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
            while (td->buffer->getCnt() > 0) {
    80003ff8:	01093783          	ld	a5,16(s2)
    80003ffc:	0087b503          	ld	a0,8(a5)
    80004000:	00000097          	auipc	ra,0x0
    80004004:	5d4080e7          	jalr	1492(ra) # 800045d4 <_ZN9BufferCPP6getCntEv>
    80004008:	02a05263          	blez	a0,8000402c <_ZN19ConsumerProducerCPP8Consumer3runEv+0xb0>
                int key = td->buffer->get();
    8000400c:	01093783          	ld	a5,16(s2)
    80004010:	0087b503          	ld	a0,8(a5)
    80004014:	00000097          	auipc	ra,0x0
    80004018:	524080e7          	jalr	1316(ra) # 80004538 <_ZN9BufferCPP3getEv>
    8000401c:	0ff57513          	andi	a0,a0,255
    80004020:	fffff097          	auipc	ra,0xfffff
    80004024:	1d4080e7          	jalr	468(ra) # 800031f4 <putc>
    80004028:	fd1ff06f          	j	80003ff8 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x7c>
            td->sem->signal();
    8000402c:	01093783          	ld	a5,16(s2)
    80004030:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    80004034:	0087b503          	ld	a0,8(a5)
    80004038:	fffff097          	auipc	ra,0xfffff
    8000403c:	110080e7          	jalr	272(ra) # 80003148 <sem_signal>
        }
    80004040:	02813083          	ld	ra,40(sp)
    80004044:	02013403          	ld	s0,32(sp)
    80004048:	01813483          	ld	s1,24(sp)
    8000404c:	01013903          	ld	s2,16(sp)
    80004050:	00813983          	ld	s3,8(sp)
    80004054:	03010113          	addi	sp,sp,48
    80004058:	00008067          	ret

000000008000405c <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    8000405c:	ff010113          	addi	sp,sp,-16
    80004060:	00113423          	sd	ra,8(sp)
    80004064:	00813023          	sd	s0,0(sp)
    80004068:	01010413          	addi	s0,sp,16
    8000406c:	00003797          	auipc	a5,0x3
    80004070:	35c78793          	addi	a5,a5,860 # 800073c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80004074:	00f53023          	sd	a5,0(a0)
    80004078:	fffff097          	auipc	ra,0xfffff
    8000407c:	26c080e7          	jalr	620(ra) # 800032e4 <_ZN6ThreadD1Ev>
    80004080:	00813083          	ld	ra,8(sp)
    80004084:	00013403          	ld	s0,0(sp)
    80004088:	01010113          	addi	sp,sp,16
    8000408c:	00008067          	ret

0000000080004090 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    80004090:	fe010113          	addi	sp,sp,-32
    80004094:	00113c23          	sd	ra,24(sp)
    80004098:	00813823          	sd	s0,16(sp)
    8000409c:	00913423          	sd	s1,8(sp)
    800040a0:	02010413          	addi	s0,sp,32
    800040a4:	00050493          	mv	s1,a0
    800040a8:	00003797          	auipc	a5,0x3
    800040ac:	32078793          	addi	a5,a5,800 # 800073c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800040b0:	00f53023          	sd	a5,0(a0)
    800040b4:	fffff097          	auipc	ra,0xfffff
    800040b8:	230080e7          	jalr	560(ra) # 800032e4 <_ZN6ThreadD1Ev>
    800040bc:	00048513          	mv	a0,s1
    800040c0:	fffff097          	auipc	ra,0xfffff
    800040c4:	1fc080e7          	jalr	508(ra) # 800032bc <_ZdlPv>
    800040c8:	01813083          	ld	ra,24(sp)
    800040cc:	01013403          	ld	s0,16(sp)
    800040d0:	00813483          	ld	s1,8(sp)
    800040d4:	02010113          	addi	sp,sp,32
    800040d8:	00008067          	ret

00000000800040dc <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    800040dc:	ff010113          	addi	sp,sp,-16
    800040e0:	00113423          	sd	ra,8(sp)
    800040e4:	00813023          	sd	s0,0(sp)
    800040e8:	01010413          	addi	s0,sp,16
    800040ec:	00003797          	auipc	a5,0x3
    800040f0:	28c78793          	addi	a5,a5,652 # 80007378 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    800040f4:	00f53023          	sd	a5,0(a0)
    800040f8:	fffff097          	auipc	ra,0xfffff
    800040fc:	1ec080e7          	jalr	492(ra) # 800032e4 <_ZN6ThreadD1Ev>
    80004100:	00813083          	ld	ra,8(sp)
    80004104:	00013403          	ld	s0,0(sp)
    80004108:	01010113          	addi	sp,sp,16
    8000410c:	00008067          	ret

0000000080004110 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    80004110:	fe010113          	addi	sp,sp,-32
    80004114:	00113c23          	sd	ra,24(sp)
    80004118:	00813823          	sd	s0,16(sp)
    8000411c:	00913423          	sd	s1,8(sp)
    80004120:	02010413          	addi	s0,sp,32
    80004124:	00050493          	mv	s1,a0
    80004128:	00003797          	auipc	a5,0x3
    8000412c:	25078793          	addi	a5,a5,592 # 80007378 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80004130:	00f53023          	sd	a5,0(a0)
    80004134:	fffff097          	auipc	ra,0xfffff
    80004138:	1b0080e7          	jalr	432(ra) # 800032e4 <_ZN6ThreadD1Ev>
    8000413c:	00048513          	mv	a0,s1
    80004140:	fffff097          	auipc	ra,0xfffff
    80004144:	17c080e7          	jalr	380(ra) # 800032bc <_ZdlPv>
    80004148:	01813083          	ld	ra,24(sp)
    8000414c:	01013403          	ld	s0,16(sp)
    80004150:	00813483          	ld	s1,8(sp)
    80004154:	02010113          	addi	sp,sp,32
    80004158:	00008067          	ret

000000008000415c <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    8000415c:	ff010113          	addi	sp,sp,-16
    80004160:	00113423          	sd	ra,8(sp)
    80004164:	00813023          	sd	s0,0(sp)
    80004168:	01010413          	addi	s0,sp,16
    8000416c:	00003797          	auipc	a5,0x3
    80004170:	23478793          	addi	a5,a5,564 # 800073a0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80004174:	00f53023          	sd	a5,0(a0)
    80004178:	fffff097          	auipc	ra,0xfffff
    8000417c:	16c080e7          	jalr	364(ra) # 800032e4 <_ZN6ThreadD1Ev>
    80004180:	00813083          	ld	ra,8(sp)
    80004184:	00013403          	ld	s0,0(sp)
    80004188:	01010113          	addi	sp,sp,16
    8000418c:	00008067          	ret

0000000080004190 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    80004190:	fe010113          	addi	sp,sp,-32
    80004194:	00113c23          	sd	ra,24(sp)
    80004198:	00813823          	sd	s0,16(sp)
    8000419c:	00913423          	sd	s1,8(sp)
    800041a0:	02010413          	addi	s0,sp,32
    800041a4:	00050493          	mv	s1,a0
    800041a8:	00003797          	auipc	a5,0x3
    800041ac:	1f878793          	addi	a5,a5,504 # 800073a0 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    800041b0:	00f53023          	sd	a5,0(a0)
    800041b4:	fffff097          	auipc	ra,0xfffff
    800041b8:	130080e7          	jalr	304(ra) # 800032e4 <_ZN6ThreadD1Ev>
    800041bc:	00048513          	mv	a0,s1
    800041c0:	fffff097          	auipc	ra,0xfffff
    800041c4:	0fc080e7          	jalr	252(ra) # 800032bc <_ZdlPv>
    800041c8:	01813083          	ld	ra,24(sp)
    800041cc:	01013403          	ld	s0,16(sp)
    800041d0:	00813483          	ld	s1,8(sp)
    800041d4:	02010113          	addi	sp,sp,32
    800041d8:	00008067          	ret

00000000800041dc <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    800041dc:	fe010113          	addi	sp,sp,-32
    800041e0:	00113c23          	sd	ra,24(sp)
    800041e4:	00813823          	sd	s0,16(sp)
    800041e8:	00913423          	sd	s1,8(sp)
    800041ec:	02010413          	addi	s0,sp,32
    800041f0:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    800041f4:	fffff097          	auipc	ra,0xfffff
    800041f8:	fc4080e7          	jalr	-60(ra) # 800031b8 <getc>
    800041fc:	0005059b          	sext.w	a1,a0
    80004200:	01b00793          	li	a5,27
    80004204:	00f58c63          	beq	a1,a5,8000421c <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    80004208:	0104b783          	ld	a5,16(s1)
    8000420c:	0087b503          	ld	a0,8(a5)
    80004210:	00000097          	auipc	ra,0x0
    80004214:	288080e7          	jalr	648(ra) # 80004498 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    80004218:	fddff06f          	j	800041f4 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    8000421c:	00100793          	li	a5,1
    80004220:	00005717          	auipc	a4,0x5
    80004224:	b6f72823          	sw	a5,-1168(a4) # 80008d90 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    80004228:	0104b783          	ld	a5,16(s1)
    8000422c:	02100593          	li	a1,33
    80004230:	0087b503          	ld	a0,8(a5)
    80004234:	00000097          	auipc	ra,0x0
    80004238:	264080e7          	jalr	612(ra) # 80004498 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    8000423c:	0104b783          	ld	a5,16(s1)
    80004240:	0107b783          	ld	a5,16(a5)
    80004244:	0087b503          	ld	a0,8(a5)
    80004248:	fffff097          	auipc	ra,0xfffff
    8000424c:	f00080e7          	jalr	-256(ra) # 80003148 <sem_signal>
        }
    80004250:	01813083          	ld	ra,24(sp)
    80004254:	01013403          	ld	s0,16(sp)
    80004258:	00813483          	ld	s1,8(sp)
    8000425c:	02010113          	addi	sp,sp,32
    80004260:	00008067          	ret

0000000080004264 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80004264:	fe010113          	addi	sp,sp,-32
    80004268:	00113c23          	sd	ra,24(sp)
    8000426c:	00813823          	sd	s0,16(sp)
    80004270:	00913423          	sd	s1,8(sp)
    80004274:	01213023          	sd	s2,0(sp)
    80004278:	02010413          	addi	s0,sp,32
    8000427c:	00050493          	mv	s1,a0
            int i = 0;
    80004280:	00000913          	li	s2,0
            while (!threadEnd) {
    80004284:	00005797          	auipc	a5,0x5
    80004288:	b0c78793          	addi	a5,a5,-1268 # 80008d90 <_ZN19ConsumerProducerCPP9threadEndE>
    8000428c:	0007a783          	lw	a5,0(a5)
    80004290:	0007879b          	sext.w	a5,a5
    80004294:	04079263          	bnez	a5,800042d8 <_ZN19ConsumerProducerCPP8Producer3runEv+0x74>
                td->buffer->put(td->id + '0');
    80004298:	0104b783          	ld	a5,16(s1)
    8000429c:	0007a583          	lw	a1,0(a5)
    800042a0:	0305859b          	addiw	a1,a1,48
    800042a4:	0087b503          	ld	a0,8(a5)
    800042a8:	00000097          	auipc	ra,0x0
    800042ac:	1f0080e7          	jalr	496(ra) # 80004498 <_ZN9BufferCPP3putEi>
                i++;
    800042b0:	0019051b          	addiw	a0,s2,1
    800042b4:	0005091b          	sext.w	s2,a0
                Thread::sleep((i+td->id)%5);
    800042b8:	0104b783          	ld	a5,16(s1)
    800042bc:	0007a783          	lw	a5,0(a5)
    800042c0:	00a787bb          	addw	a5,a5,a0
    static void sleep (time_t time){ time_sleep(time); }
    800042c4:	00500513          	li	a0,5
    800042c8:	02a7e53b          	remw	a0,a5,a0
    800042cc:	fffff097          	auipc	ra,0xfffff
    800042d0:	eb4080e7          	jalr	-332(ra) # 80003180 <time_sleep>
    800042d4:	fb1ff06f          	j	80004284 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    800042d8:	0104b783          	ld	a5,16(s1)
    800042dc:	0107b783          	ld	a5,16(a5)
    void signal (){ sem_signal(myHandle); }
    800042e0:	0087b503          	ld	a0,8(a5)
    800042e4:	fffff097          	auipc	ra,0xfffff
    800042e8:	e64080e7          	jalr	-412(ra) # 80003148 <sem_signal>
        }
    800042ec:	01813083          	ld	ra,24(sp)
    800042f0:	01013403          	ld	s0,16(sp)
    800042f4:	00813483          	ld	s1,8(sp)
    800042f8:	00013903          	ld	s2,0(sp)
    800042fc:	02010113          	addi	sp,sp,32
    80004300:	00008067          	ret

0000000080004304 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004304:	fd010113          	addi	sp,sp,-48
    80004308:	02113423          	sd	ra,40(sp)
    8000430c:	02813023          	sd	s0,32(sp)
    80004310:	00913c23          	sd	s1,24(sp)
    80004314:	01213823          	sd	s2,16(sp)
    80004318:	01313423          	sd	s3,8(sp)
    8000431c:	03010413          	addi	s0,sp,48
    80004320:	00050493          	mv	s1,a0
    80004324:	00058993          	mv	s3,a1
    80004328:	0015879b          	addiw	a5,a1,1
    8000432c:	0007851b          	sext.w	a0,a5
    80004330:	00f4a023          	sw	a5,0(s1)
    80004334:	0004a823          	sw	zero,16(s1)
    80004338:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000433c:	00251513          	slli	a0,a0,0x2
    80004340:	fffff097          	auipc	ra,0xfffff
    80004344:	c18080e7          	jalr	-1000(ra) # 80002f58 <mem_alloc>
    80004348:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000434c:	01000513          	li	a0,16
    80004350:	fffff097          	auipc	ra,0xfffff
    80004354:	f44080e7          	jalr	-188(ra) # 80003294 <_Znwm>
    80004358:	00050913          	mv	s2,a0
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    8000435c:	00003797          	auipc	a5,0x3
    80004360:	ffc78793          	addi	a5,a5,-4 # 80007358 <_ZTV9Semaphore+0x10>
    80004364:	00f53023          	sd	a5,0(a0)
    80004368:	00000593          	li	a1,0
    8000436c:	00850513          	addi	a0,a0,8
    80004370:	fffff097          	auipc	ra,0xfffff
    80004374:	d2c080e7          	jalr	-724(ra) # 8000309c <sem_open>
    80004378:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000437c:	01000513          	li	a0,16
    80004380:	fffff097          	auipc	ra,0xfffff
    80004384:	f14080e7          	jalr	-236(ra) # 80003294 <_Znwm>
    80004388:	00050913          	mv	s2,a0
    8000438c:	00003797          	auipc	a5,0x3
    80004390:	fcc78793          	addi	a5,a5,-52 # 80007358 <_ZTV9Semaphore+0x10>
    80004394:	00f53023          	sd	a5,0(a0)
    80004398:	00098593          	mv	a1,s3
    8000439c:	00850513          	addi	a0,a0,8
    800043a0:	fffff097          	auipc	ra,0xfffff
    800043a4:	cfc080e7          	jalr	-772(ra) # 8000309c <sem_open>
    800043a8:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    800043ac:	01000513          	li	a0,16
    800043b0:	fffff097          	auipc	ra,0xfffff
    800043b4:	ee4080e7          	jalr	-284(ra) # 80003294 <_Znwm>
    800043b8:	00050913          	mv	s2,a0
    800043bc:	00003797          	auipc	a5,0x3
    800043c0:	f9c78793          	addi	a5,a5,-100 # 80007358 <_ZTV9Semaphore+0x10>
    800043c4:	00f53023          	sd	a5,0(a0)
    800043c8:	00100593          	li	a1,1
    800043cc:	00850513          	addi	a0,a0,8
    800043d0:	fffff097          	auipc	ra,0xfffff
    800043d4:	ccc080e7          	jalr	-820(ra) # 8000309c <sem_open>
    800043d8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800043dc:	01000513          	li	a0,16
    800043e0:	fffff097          	auipc	ra,0xfffff
    800043e4:	eb4080e7          	jalr	-332(ra) # 80003294 <_Znwm>
    800043e8:	00050913          	mv	s2,a0
    800043ec:	00003797          	auipc	a5,0x3
    800043f0:	f6c78793          	addi	a5,a5,-148 # 80007358 <_ZTV9Semaphore+0x10>
    800043f4:	00f53023          	sd	a5,0(a0)
    800043f8:	00100593          	li	a1,1
    800043fc:	00850513          	addi	a0,a0,8
    80004400:	fffff097          	auipc	ra,0xfffff
    80004404:	c9c080e7          	jalr	-868(ra) # 8000309c <sem_open>
    80004408:	0324b823          	sd	s2,48(s1)
}
    8000440c:	02813083          	ld	ra,40(sp)
    80004410:	02013403          	ld	s0,32(sp)
    80004414:	01813483          	ld	s1,24(sp)
    80004418:	01013903          	ld	s2,16(sp)
    8000441c:	00813983          	ld	s3,8(sp)
    80004420:	03010113          	addi	sp,sp,48
    80004424:	00008067          	ret
    80004428:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000442c:	00090513          	mv	a0,s2
    80004430:	fffff097          	auipc	ra,0xfffff
    80004434:	e8c080e7          	jalr	-372(ra) # 800032bc <_ZdlPv>
    80004438:	00048513          	mv	a0,s1
    8000443c:	00006097          	auipc	ra,0x6
    80004440:	abc080e7          	jalr	-1348(ra) # 80009ef8 <_Unwind_Resume>
    80004444:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004448:	00090513          	mv	a0,s2
    8000444c:	fffff097          	auipc	ra,0xfffff
    80004450:	e70080e7          	jalr	-400(ra) # 800032bc <_ZdlPv>
    80004454:	00048513          	mv	a0,s1
    80004458:	00006097          	auipc	ra,0x6
    8000445c:	aa0080e7          	jalr	-1376(ra) # 80009ef8 <_Unwind_Resume>
    80004460:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004464:	00090513          	mv	a0,s2
    80004468:	fffff097          	auipc	ra,0xfffff
    8000446c:	e54080e7          	jalr	-428(ra) # 800032bc <_ZdlPv>
    80004470:	00048513          	mv	a0,s1
    80004474:	00006097          	auipc	ra,0x6
    80004478:	a84080e7          	jalr	-1404(ra) # 80009ef8 <_Unwind_Resume>
    8000447c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004480:	00090513          	mv	a0,s2
    80004484:	fffff097          	auipc	ra,0xfffff
    80004488:	e38080e7          	jalr	-456(ra) # 800032bc <_ZdlPv>
    8000448c:	00048513          	mv	a0,s1
    80004490:	00006097          	auipc	ra,0x6
    80004494:	a68080e7          	jalr	-1432(ra) # 80009ef8 <_Unwind_Resume>

0000000080004498 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004498:	fe010113          	addi	sp,sp,-32
    8000449c:	00113c23          	sd	ra,24(sp)
    800044a0:	00813823          	sd	s0,16(sp)
    800044a4:	00913423          	sd	s1,8(sp)
    800044a8:	01213023          	sd	s2,0(sp)
    800044ac:	02010413          	addi	s0,sp,32
    800044b0:	00050493          	mv	s1,a0
    800044b4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800044b8:	01853783          	ld	a5,24(a0)
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    800044bc:	0087b503          	ld	a0,8(a5)
    800044c0:	fffff097          	auipc	ra,0xfffff
    800044c4:	c50080e7          	jalr	-944(ra) # 80003110 <sem_wait>

    mutexTail->wait();
    800044c8:	0304b783          	ld	a5,48(s1)
    800044cc:	0087b503          	ld	a0,8(a5)
    800044d0:	fffff097          	auipc	ra,0xfffff
    800044d4:	c40080e7          	jalr	-960(ra) # 80003110 <sem_wait>
    buffer[tail] = val;
    800044d8:	0084b783          	ld	a5,8(s1)
    800044dc:	0144a703          	lw	a4,20(s1)
    800044e0:	00271713          	slli	a4,a4,0x2
    800044e4:	00e787b3          	add	a5,a5,a4
    800044e8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800044ec:	0144a783          	lw	a5,20(s1)
    800044f0:	0017879b          	addiw	a5,a5,1
    800044f4:	0004a703          	lw	a4,0(s1)
    800044f8:	02e7e7bb          	remw	a5,a5,a4
    800044fc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004500:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004504:	0087b503          	ld	a0,8(a5)
    80004508:	fffff097          	auipc	ra,0xfffff
    8000450c:	c40080e7          	jalr	-960(ra) # 80003148 <sem_signal>

    itemAvailable->signal();
    80004510:	0204b783          	ld	a5,32(s1)
    80004514:	0087b503          	ld	a0,8(a5)
    80004518:	fffff097          	auipc	ra,0xfffff
    8000451c:	c30080e7          	jalr	-976(ra) # 80003148 <sem_signal>

}
    80004520:	01813083          	ld	ra,24(sp)
    80004524:	01013403          	ld	s0,16(sp)
    80004528:	00813483          	ld	s1,8(sp)
    8000452c:	00013903          	ld	s2,0(sp)
    80004530:	02010113          	addi	sp,sp,32
    80004534:	00008067          	ret

0000000080004538 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004538:	fe010113          	addi	sp,sp,-32
    8000453c:	00113c23          	sd	ra,24(sp)
    80004540:	00813823          	sd	s0,16(sp)
    80004544:	00913423          	sd	s1,8(sp)
    80004548:	01213023          	sd	s2,0(sp)
    8000454c:	02010413          	addi	s0,sp,32
    80004550:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004554:	02053783          	ld	a5,32(a0)
    void wait (){ sem_wait(myHandle); }
    80004558:	0087b503          	ld	a0,8(a5)
    8000455c:	fffff097          	auipc	ra,0xfffff
    80004560:	bb4080e7          	jalr	-1100(ra) # 80003110 <sem_wait>

    mutexHead->wait();
    80004564:	0284b783          	ld	a5,40(s1)
    80004568:	0087b503          	ld	a0,8(a5)
    8000456c:	fffff097          	auipc	ra,0xfffff
    80004570:	ba4080e7          	jalr	-1116(ra) # 80003110 <sem_wait>

    int ret = buffer[head];
    80004574:	0084b703          	ld	a4,8(s1)
    80004578:	0104a783          	lw	a5,16(s1)
    8000457c:	00279693          	slli	a3,a5,0x2
    80004580:	00d70733          	add	a4,a4,a3
    80004584:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004588:	0017879b          	addiw	a5,a5,1
    8000458c:	0004a703          	lw	a4,0(s1)
    80004590:	02e7e7bb          	remw	a5,a5,a4
    80004594:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004598:	0284b783          	ld	a5,40(s1)
    void signal (){ sem_signal(myHandle); }
    8000459c:	0087b503          	ld	a0,8(a5)
    800045a0:	fffff097          	auipc	ra,0xfffff
    800045a4:	ba8080e7          	jalr	-1112(ra) # 80003148 <sem_signal>

    spaceAvailable->signal();
    800045a8:	0184b783          	ld	a5,24(s1)
    800045ac:	0087b503          	ld	a0,8(a5)
    800045b0:	fffff097          	auipc	ra,0xfffff
    800045b4:	b98080e7          	jalr	-1128(ra) # 80003148 <sem_signal>

    return ret;
}
    800045b8:	00090513          	mv	a0,s2
    800045bc:	01813083          	ld	ra,24(sp)
    800045c0:	01013403          	ld	s0,16(sp)
    800045c4:	00813483          	ld	s1,8(sp)
    800045c8:	00013903          	ld	s2,0(sp)
    800045cc:	02010113          	addi	sp,sp,32
    800045d0:	00008067          	ret

00000000800045d4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800045d4:	fe010113          	addi	sp,sp,-32
    800045d8:	00113c23          	sd	ra,24(sp)
    800045dc:	00813823          	sd	s0,16(sp)
    800045e0:	00913423          	sd	s1,8(sp)
    800045e4:	01213023          	sd	s2,0(sp)
    800045e8:	02010413          	addi	s0,sp,32
    800045ec:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800045f0:	02853783          	ld	a5,40(a0)
    void wait (){ sem_wait(myHandle); }
    800045f4:	0087b503          	ld	a0,8(a5)
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	b18080e7          	jalr	-1256(ra) # 80003110 <sem_wait>
    mutexTail->wait();
    80004600:	0304b783          	ld	a5,48(s1)
    80004604:	0087b503          	ld	a0,8(a5)
    80004608:	fffff097          	auipc	ra,0xfffff
    8000460c:	b08080e7          	jalr	-1272(ra) # 80003110 <sem_wait>

    if (tail >= head) {
    80004610:	0144a783          	lw	a5,20(s1)
    80004614:	0104a903          	lw	s2,16(s1)
    80004618:	0527c263          	blt	a5,s2,8000465c <_ZN9BufferCPP6getCntEv+0x88>
        ret = tail - head;
    8000461c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004620:	0304b783          	ld	a5,48(s1)
    void signal (){ sem_signal(myHandle); }
    80004624:	0087b503          	ld	a0,8(a5)
    80004628:	fffff097          	auipc	ra,0xfffff
    8000462c:	b20080e7          	jalr	-1248(ra) # 80003148 <sem_signal>
    mutexHead->signal();
    80004630:	0284b783          	ld	a5,40(s1)
    80004634:	0087b503          	ld	a0,8(a5)
    80004638:	fffff097          	auipc	ra,0xfffff
    8000463c:	b10080e7          	jalr	-1264(ra) # 80003148 <sem_signal>

    return ret;
}
    80004640:	00090513          	mv	a0,s2
    80004644:	01813083          	ld	ra,24(sp)
    80004648:	01013403          	ld	s0,16(sp)
    8000464c:	00813483          	ld	s1,8(sp)
    80004650:	00013903          	ld	s2,0(sp)
    80004654:	02010113          	addi	sp,sp,32
    80004658:	00008067          	ret
        ret = cap - head + tail;
    8000465c:	0004a703          	lw	a4,0(s1)
    80004660:	4127093b          	subw	s2,a4,s2
    80004664:	00f9093b          	addw	s2,s2,a5
    80004668:	fb9ff06f          	j	80004620 <_ZN9BufferCPP6getCntEv+0x4c>

000000008000466c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000466c:	fe010113          	addi	sp,sp,-32
    80004670:	00113c23          	sd	ra,24(sp)
    80004674:	00813823          	sd	s0,16(sp)
    80004678:	00913423          	sd	s1,8(sp)
    8000467c:	02010413          	addi	s0,sp,32
    80004680:	00050493          	mv	s1,a0
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
    80004684:	00a00513          	li	a0,10
    80004688:	fffff097          	auipc	ra,0xfffff
    8000468c:	b6c080e7          	jalr	-1172(ra) # 800031f4 <putc>
    printString("Buffer deleted!\n");
    80004690:	00003517          	auipc	a0,0x3
    80004694:	e3850513          	addi	a0,a0,-456 # 800074c8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x110>
    80004698:	00000097          	auipc	ra,0x0
    8000469c:	0d4080e7          	jalr	212(ra) # 8000476c <_Z11printStringPKc>
    while (getCnt()) {
    800046a0:	00048513          	mv	a0,s1
    800046a4:	00000097          	auipc	ra,0x0
    800046a8:	f30080e7          	jalr	-208(ra) # 800045d4 <_ZN9BufferCPP6getCntEv>
    800046ac:	02050c63          	beqz	a0,800046e4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800046b0:	0084b783          	ld	a5,8(s1)
    800046b4:	0104a703          	lw	a4,16(s1)
    800046b8:	00271713          	slli	a4,a4,0x2
    800046bc:	00e787b3          	add	a5,a5,a4
    800046c0:	0007c503          	lbu	a0,0(a5)
    800046c4:	fffff097          	auipc	ra,0xfffff
    800046c8:	b30080e7          	jalr	-1232(ra) # 800031f4 <putc>
        head = (head + 1) % cap;
    800046cc:	0104a783          	lw	a5,16(s1)
    800046d0:	0017879b          	addiw	a5,a5,1
    800046d4:	0004a703          	lw	a4,0(s1)
    800046d8:	02e7e7bb          	remw	a5,a5,a4
    800046dc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800046e0:	fc1ff06f          	j	800046a0 <_ZN9BufferCPPD1Ev+0x34>
    800046e4:	02100513          	li	a0,33
    800046e8:	fffff097          	auipc	ra,0xfffff
    800046ec:	b0c080e7          	jalr	-1268(ra) # 800031f4 <putc>
    800046f0:	00a00513          	li	a0,10
    800046f4:	fffff097          	auipc	ra,0xfffff
    800046f8:	b00080e7          	jalr	-1280(ra) # 800031f4 <putc>
    mem_free(buffer);
    800046fc:	0084b503          	ld	a0,8(s1)
    80004700:	fffff097          	auipc	ra,0xfffff
    80004704:	890080e7          	jalr	-1904(ra) # 80002f90 <mem_free>
    delete itemAvailable;
    80004708:	0204b503          	ld	a0,32(s1)
    8000470c:	00050863          	beqz	a0,8000471c <_ZN9BufferCPPD1Ev+0xb0>
    80004710:	00053783          	ld	a5,0(a0)
    80004714:	0087b783          	ld	a5,8(a5)
    80004718:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000471c:	0184b503          	ld	a0,24(s1)
    80004720:	00050863          	beqz	a0,80004730 <_ZN9BufferCPPD1Ev+0xc4>
    80004724:	00053783          	ld	a5,0(a0)
    80004728:	0087b783          	ld	a5,8(a5)
    8000472c:	000780e7          	jalr	a5
    delete mutexTail;
    80004730:	0304b503          	ld	a0,48(s1)
    80004734:	00050863          	beqz	a0,80004744 <_ZN9BufferCPPD1Ev+0xd8>
    80004738:	00053783          	ld	a5,0(a0)
    8000473c:	0087b783          	ld	a5,8(a5)
    80004740:	000780e7          	jalr	a5
    delete mutexHead;
    80004744:	0284b503          	ld	a0,40(s1)
    80004748:	00050863          	beqz	a0,80004758 <_ZN9BufferCPPD1Ev+0xec>
    8000474c:	00053783          	ld	a5,0(a0)
    80004750:	0087b783          	ld	a5,8(a5)
    80004754:	000780e7          	jalr	a5
}
    80004758:	01813083          	ld	ra,24(sp)
    8000475c:	01013403          	ld	s0,16(sp)
    80004760:	00813483          	ld	s1,8(sp)
    80004764:	02010113          	addi	sp,sp,32
    80004768:	00008067          	ret

000000008000476c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000476c:	fe010113          	addi	sp,sp,-32
    80004770:	00113c23          	sd	ra,24(sp)
    80004774:	00813823          	sd	s0,16(sp)
    80004778:	00913423          	sd	s1,8(sp)
    8000477c:	02010413          	addi	s0,sp,32
    80004780:	00050493          	mv	s1,a0
    LOCK();
    80004784:	00100613          	li	a2,1
    80004788:	00000593          	li	a1,0
    8000478c:	00004517          	auipc	a0,0x4
    80004790:	61450513          	addi	a0,a0,1556 # 80008da0 <lockPrint>
    80004794:	ffffd097          	auipc	ra,0xffffd
    80004798:	97c080e7          	jalr	-1668(ra) # 80001110 <copy_and_swap>
    8000479c:	fe0514e3          	bnez	a0,80004784 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800047a0:	0004c503          	lbu	a0,0(s1)
    800047a4:	00050a63          	beqz	a0,800047b8 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    800047a8:	fffff097          	auipc	ra,0xfffff
    800047ac:	a4c080e7          	jalr	-1460(ra) # 800031f4 <putc>
        string++;
    800047b0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800047b4:	fedff06f          	j	800047a0 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    800047b8:	00000613          	li	a2,0
    800047bc:	00100593          	li	a1,1
    800047c0:	00004517          	auipc	a0,0x4
    800047c4:	5e050513          	addi	a0,a0,1504 # 80008da0 <lockPrint>
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	948080e7          	jalr	-1720(ra) # 80001110 <copy_and_swap>
    800047d0:	fe0514e3          	bnez	a0,800047b8 <_Z11printStringPKc+0x4c>
}
    800047d4:	01813083          	ld	ra,24(sp)
    800047d8:	01013403          	ld	s0,16(sp)
    800047dc:	00813483          	ld	s1,8(sp)
    800047e0:	02010113          	addi	sp,sp,32
    800047e4:	00008067          	ret

00000000800047e8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800047e8:	fd010113          	addi	sp,sp,-48
    800047ec:	02113423          	sd	ra,40(sp)
    800047f0:	02813023          	sd	s0,32(sp)
    800047f4:	00913c23          	sd	s1,24(sp)
    800047f8:	01213823          	sd	s2,16(sp)
    800047fc:	01313423          	sd	s3,8(sp)
    80004800:	01413023          	sd	s4,0(sp)
    80004804:	03010413          	addi	s0,sp,48
    80004808:	00050993          	mv	s3,a0
    8000480c:	00058a13          	mv	s4,a1
    LOCK();
    80004810:	00100613          	li	a2,1
    80004814:	00000593          	li	a1,0
    80004818:	00004517          	auipc	a0,0x4
    8000481c:	58850513          	addi	a0,a0,1416 # 80008da0 <lockPrint>
    80004820:	ffffd097          	auipc	ra,0xffffd
    80004824:	8f0080e7          	jalr	-1808(ra) # 80001110 <copy_and_swap>
    80004828:	fe0514e3          	bnez	a0,80004810 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000482c:	00000493          	li	s1,0
    80004830:	0014891b          	addiw	s2,s1,1
    80004834:	03495a63          	bge	s2,s4,80004868 <_Z9getStringPci+0x80>
        cc = getc();
    80004838:	fffff097          	auipc	ra,0xfffff
    8000483c:	980080e7          	jalr	-1664(ra) # 800031b8 <getc>
        if(cc < 1)
    80004840:	02050463          	beqz	a0,80004868 <_Z9getStringPci+0x80>
            break;
        c = cc;
        buf[i++] = c;
    80004844:	009984b3          	add	s1,s3,s1
    80004848:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000484c:	00a00793          	li	a5,10
    80004850:	00f50a63          	beq	a0,a5,80004864 <_Z9getStringPci+0x7c>
        buf[i++] = c;
    80004854:	00090493          	mv	s1,s2
        if(c == '\n' || c == '\r')
    80004858:	00d00793          	li	a5,13
    8000485c:	fcf51ae3          	bne	a0,a5,80004830 <_Z9getStringPci+0x48>
    80004860:	0080006f          	j	80004868 <_Z9getStringPci+0x80>
        buf[i++] = c;
    80004864:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004868:	009984b3          	add	s1,s3,s1
    8000486c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004870:	00000613          	li	a2,0
    80004874:	00100593          	li	a1,1
    80004878:	00004517          	auipc	a0,0x4
    8000487c:	52850513          	addi	a0,a0,1320 # 80008da0 <lockPrint>
    80004880:	ffffd097          	auipc	ra,0xffffd
    80004884:	890080e7          	jalr	-1904(ra) # 80001110 <copy_and_swap>
    80004888:	fe0514e3          	bnez	a0,80004870 <_Z9getStringPci+0x88>
    return buf;
}
    8000488c:	00098513          	mv	a0,s3
    80004890:	02813083          	ld	ra,40(sp)
    80004894:	02013403          	ld	s0,32(sp)
    80004898:	01813483          	ld	s1,24(sp)
    8000489c:	01013903          	ld	s2,16(sp)
    800048a0:	00813983          	ld	s3,8(sp)
    800048a4:	00013a03          	ld	s4,0(sp)
    800048a8:	03010113          	addi	sp,sp,48
    800048ac:	00008067          	ret

00000000800048b0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800048b0:	ff010113          	addi	sp,sp,-16
    800048b4:	00813423          	sd	s0,8(sp)
    800048b8:	01010413          	addi	s0,sp,16
    int n;

    n = 0;
    800048bc:	00000793          	li	a5,0
    while ('0' <= *s && *s <= '9')
    800048c0:	00054603          	lbu	a2,0(a0)
    800048c4:	fd06069b          	addiw	a3,a2,-48
    800048c8:	0ff6f693          	andi	a3,a3,255
    800048cc:	00900713          	li	a4,9
    800048d0:	02d76063          	bltu	a4,a3,800048f0 <_Z11stringToIntPKc+0x40>
        n = n * 10 + *s++ - '0';
    800048d4:	0027969b          	slliw	a3,a5,0x2
    800048d8:	00f687bb          	addw	a5,a3,a5
    800048dc:	0017971b          	slliw	a4,a5,0x1
    800048e0:	00150513          	addi	a0,a0,1
    800048e4:	00c707bb          	addw	a5,a4,a2
    800048e8:	fd07879b          	addiw	a5,a5,-48
    while ('0' <= *s && *s <= '9')
    800048ec:	fd5ff06f          	j	800048c0 <_Z11stringToIntPKc+0x10>
    return n;
}
    800048f0:	00078513          	mv	a0,a5
    800048f4:	00813403          	ld	s0,8(sp)
    800048f8:	01010113          	addi	sp,sp,16
    800048fc:	00008067          	ret

0000000080004900 <_Z8printIntmi>:

char digits[] = "0123456789ABCDEF";

void printInt(uint64 xx, int base)
{
    80004900:	fc010113          	addi	sp,sp,-64
    80004904:	02113c23          	sd	ra,56(sp)
    80004908:	02813823          	sd	s0,48(sp)
    8000490c:	02913423          	sd	s1,40(sp)
    80004910:	03213023          	sd	s2,32(sp)
    80004914:	01313c23          	sd	s3,24(sp)
    80004918:	04010413          	addi	s0,sp,64
    8000491c:	00050913          	mv	s2,a0
    80004920:	00058993          	mv	s3,a1
    LOCK();
    80004924:	00100613          	li	a2,1
    80004928:	00000593          	li	a1,0
    8000492c:	00004517          	auipc	a0,0x4
    80004930:	47450513          	addi	a0,a0,1140 # 80008da0 <lockPrint>
    80004934:	ffffc097          	auipc	ra,0xffffc
    80004938:	7dc080e7          	jalr	2012(ra) # 80001110 <copy_and_swap>
    8000493c:	fe0514e3          	bnez	a0,80004924 <_Z8printIntmi+0x24>
    char buf[16];
    int i;

    i = 0;
    80004940:	00000793          	li	a5,0
    80004944:	0080006f          	j	8000494c <_Z8printIntmi+0x4c>
    do{
        buf[i++] = digits[xx % base];
    }while((xx /= base) != 0);
    80004948:	00070913          	mv	s2,a4
        buf[i++] = digits[xx % base];
    8000494c:	033976b3          	remu	a3,s2,s3
    80004950:	0017849b          	addiw	s1,a5,1
    80004954:	00004717          	auipc	a4,0x4
    80004958:	21470713          	addi	a4,a4,532 # 80008b68 <digits>
    8000495c:	00d70733          	add	a4,a4,a3
    80004960:	00074703          	lbu	a4,0(a4)
    80004964:	fd040693          	addi	a3,s0,-48
    80004968:	00f687b3          	add	a5,a3,a5
    8000496c:	fee78823          	sb	a4,-16(a5)
    }while((xx /= base) != 0);
    80004970:	03395733          	divu	a4,s2,s3
        buf[i++] = digits[xx % base];
    80004974:	00048793          	mv	a5,s1
    }while((xx /= base) != 0);
    80004978:	fd3978e3          	bgeu	s2,s3,80004948 <_Z8printIntmi+0x48>

    while(--i >= 0)
    8000497c:	fff4849b          	addiw	s1,s1,-1
    80004980:	0004ce63          	bltz	s1,8000499c <_Z8printIntmi+0x9c>
        putc(buf[i]);
    80004984:	fd040793          	addi	a5,s0,-48
    80004988:	009787b3          	add	a5,a5,s1
    8000498c:	ff07c503          	lbu	a0,-16(a5)
    80004990:	fffff097          	auipc	ra,0xfffff
    80004994:	864080e7          	jalr	-1948(ra) # 800031f4 <putc>
    80004998:	fe5ff06f          	j	8000497c <_Z8printIntmi+0x7c>

    UNLOCK();
    8000499c:	00000613          	li	a2,0
    800049a0:	00100593          	li	a1,1
    800049a4:	00004517          	auipc	a0,0x4
    800049a8:	3fc50513          	addi	a0,a0,1020 # 80008da0 <lockPrint>
    800049ac:	ffffc097          	auipc	ra,0xffffc
    800049b0:	764080e7          	jalr	1892(ra) # 80001110 <copy_and_swap>
    800049b4:	fe0514e3          	bnez	a0,8000499c <_Z8printIntmi+0x9c>
    800049b8:	03813083          	ld	ra,56(sp)
    800049bc:	03013403          	ld	s0,48(sp)
    800049c0:	02813483          	ld	s1,40(sp)
    800049c4:	02013903          	ld	s2,32(sp)
    800049c8:	01813983          	ld	s3,24(sp)
    800049cc:	04010113          	addi	sp,sp,64
    800049d0:	00008067          	ret

00000000800049d4 <start>:
    800049d4:	ff010113          	addi	sp,sp,-16
    800049d8:	00813423          	sd	s0,8(sp)
    800049dc:	01010413          	addi	s0,sp,16
    800049e0:	300027f3          	csrr	a5,mstatus
    800049e4:	ffffe737          	lui	a4,0xffffe
    800049e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff476f>
    800049ec:	00e7f7b3          	and	a5,a5,a4
    800049f0:	00001737          	lui	a4,0x1
    800049f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800049f8:	00e7e7b3          	or	a5,a5,a4
    800049fc:	30079073          	csrw	mstatus,a5
    80004a00:	00000797          	auipc	a5,0x0
    80004a04:	16078793          	addi	a5,a5,352 # 80004b60 <system_main>
    80004a08:	34179073          	csrw	mepc,a5
    80004a0c:	00000793          	li	a5,0
    80004a10:	18079073          	csrw	satp,a5
    80004a14:	000107b7          	lui	a5,0x10
    80004a18:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004a1c:	30279073          	csrw	medeleg,a5
    80004a20:	30379073          	csrw	mideleg,a5
    80004a24:	104027f3          	csrr	a5,sie
    80004a28:	2227e793          	ori	a5,a5,546
    80004a2c:	10479073          	csrw	sie,a5
    80004a30:	fff00793          	li	a5,-1
    80004a34:	00a7d793          	srli	a5,a5,0xa
    80004a38:	3b079073          	csrw	pmpaddr0,a5
    80004a3c:	00f00793          	li	a5,15
    80004a40:	3a079073          	csrw	pmpcfg0,a5
    80004a44:	f14027f3          	csrr	a5,mhartid
    80004a48:	0200c737          	lui	a4,0x200c
    80004a4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004a50:	0007869b          	sext.w	a3,a5
    80004a54:	00269713          	slli	a4,a3,0x2
    80004a58:	000f4637          	lui	a2,0xf4
    80004a5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004a60:	00d70733          	add	a4,a4,a3
    80004a64:	0037979b          	slliw	a5,a5,0x3
    80004a68:	020046b7          	lui	a3,0x2004
    80004a6c:	00d787b3          	add	a5,a5,a3
    80004a70:	00c585b3          	add	a1,a1,a2
    80004a74:	00371693          	slli	a3,a4,0x3
    80004a78:	00004717          	auipc	a4,0x4
    80004a7c:	3b870713          	addi	a4,a4,952 # 80008e30 <timer_scratch>
    80004a80:	00b7b023          	sd	a1,0(a5)
    80004a84:	00d70733          	add	a4,a4,a3
    80004a88:	00f73c23          	sd	a5,24(a4)
    80004a8c:	02c73023          	sd	a2,32(a4)
    80004a90:	34071073          	csrw	mscratch,a4
    80004a94:	00000797          	auipc	a5,0x0
    80004a98:	6ec78793          	addi	a5,a5,1772 # 80005180 <timervec>
    80004a9c:	30579073          	csrw	mtvec,a5
    80004aa0:	300027f3          	csrr	a5,mstatus
    80004aa4:	0087e793          	ori	a5,a5,8
    80004aa8:	30079073          	csrw	mstatus,a5
    80004aac:	304027f3          	csrr	a5,mie
    80004ab0:	0807e793          	ori	a5,a5,128
    80004ab4:	30479073          	csrw	mie,a5
    80004ab8:	f14027f3          	csrr	a5,mhartid
    80004abc:	0007879b          	sext.w	a5,a5
    80004ac0:	00078213          	mv	tp,a5
    80004ac4:	30200073          	mret
    80004ac8:	00813403          	ld	s0,8(sp)
    80004acc:	01010113          	addi	sp,sp,16
    80004ad0:	00008067          	ret

0000000080004ad4 <timerinit>:
    80004ad4:	ff010113          	addi	sp,sp,-16
    80004ad8:	00813423          	sd	s0,8(sp)
    80004adc:	01010413          	addi	s0,sp,16
    80004ae0:	f14027f3          	csrr	a5,mhartid
    80004ae4:	0200c737          	lui	a4,0x200c
    80004ae8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004aec:	0007869b          	sext.w	a3,a5
    80004af0:	00269713          	slli	a4,a3,0x2
    80004af4:	000f4637          	lui	a2,0xf4
    80004af8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004afc:	00d70733          	add	a4,a4,a3
    80004b00:	0037979b          	slliw	a5,a5,0x3
    80004b04:	020046b7          	lui	a3,0x2004
    80004b08:	00d787b3          	add	a5,a5,a3
    80004b0c:	00c585b3          	add	a1,a1,a2
    80004b10:	00371693          	slli	a3,a4,0x3
    80004b14:	00004717          	auipc	a4,0x4
    80004b18:	31c70713          	addi	a4,a4,796 # 80008e30 <timer_scratch>
    80004b1c:	00b7b023          	sd	a1,0(a5)
    80004b20:	00d70733          	add	a4,a4,a3
    80004b24:	00f73c23          	sd	a5,24(a4)
    80004b28:	02c73023          	sd	a2,32(a4)
    80004b2c:	34071073          	csrw	mscratch,a4
    80004b30:	00000797          	auipc	a5,0x0
    80004b34:	65078793          	addi	a5,a5,1616 # 80005180 <timervec>
    80004b38:	30579073          	csrw	mtvec,a5
    80004b3c:	300027f3          	csrr	a5,mstatus
    80004b40:	0087e793          	ori	a5,a5,8
    80004b44:	30079073          	csrw	mstatus,a5
    80004b48:	304027f3          	csrr	a5,mie
    80004b4c:	0807e793          	ori	a5,a5,128
    80004b50:	30479073          	csrw	mie,a5
    80004b54:	00813403          	ld	s0,8(sp)
    80004b58:	01010113          	addi	sp,sp,16
    80004b5c:	00008067          	ret

0000000080004b60 <system_main>:
    80004b60:	fe010113          	addi	sp,sp,-32
    80004b64:	00813823          	sd	s0,16(sp)
    80004b68:	00913423          	sd	s1,8(sp)
    80004b6c:	00113c23          	sd	ra,24(sp)
    80004b70:	02010413          	addi	s0,sp,32
    80004b74:	00000097          	auipc	ra,0x0
    80004b78:	0c4080e7          	jalr	196(ra) # 80004c38 <cpuid>
    80004b7c:	00004497          	auipc	s1,0x4
    80004b80:	22c48493          	addi	s1,s1,556 # 80008da8 <started>
    80004b84:	02050263          	beqz	a0,80004ba8 <system_main+0x48>
    80004b88:	0004a783          	lw	a5,0(s1)
    80004b8c:	0007879b          	sext.w	a5,a5
    80004b90:	fe078ce3          	beqz	a5,80004b88 <system_main+0x28>
    80004b94:	0ff0000f          	fence
    80004b98:	00003517          	auipc	a0,0x3
    80004b9c:	97850513          	addi	a0,a0,-1672 # 80007510 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x158>
    80004ba0:	00001097          	auipc	ra,0x1
    80004ba4:	a7c080e7          	jalr	-1412(ra) # 8000561c <panic>
    80004ba8:	00001097          	auipc	ra,0x1
    80004bac:	9d0080e7          	jalr	-1584(ra) # 80005578 <consoleinit>
    80004bb0:	00001097          	auipc	ra,0x1
    80004bb4:	15c080e7          	jalr	348(ra) # 80005d0c <printfinit>
    80004bb8:	00002517          	auipc	a0,0x2
    80004bbc:	68850513          	addi	a0,a0,1672 # 80007240 <CONSOLE_STATUS+0x230>
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	ab8080e7          	jalr	-1352(ra) # 80005678 <__printf>
    80004bc8:	00003517          	auipc	a0,0x3
    80004bcc:	91850513          	addi	a0,a0,-1768 # 800074e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x128>
    80004bd0:	00001097          	auipc	ra,0x1
    80004bd4:	aa8080e7          	jalr	-1368(ra) # 80005678 <__printf>
    80004bd8:	00002517          	auipc	a0,0x2
    80004bdc:	66850513          	addi	a0,a0,1640 # 80007240 <CONSOLE_STATUS+0x230>
    80004be0:	00001097          	auipc	ra,0x1
    80004be4:	a98080e7          	jalr	-1384(ra) # 80005678 <__printf>
    80004be8:	00001097          	auipc	ra,0x1
    80004bec:	4b0080e7          	jalr	1200(ra) # 80006098 <kinit>
    80004bf0:	00000097          	auipc	ra,0x0
    80004bf4:	148080e7          	jalr	328(ra) # 80004d38 <trapinit>
    80004bf8:	00000097          	auipc	ra,0x0
    80004bfc:	16c080e7          	jalr	364(ra) # 80004d64 <trapinithart>
    80004c00:	00000097          	auipc	ra,0x0
    80004c04:	5c0080e7          	jalr	1472(ra) # 800051c0 <plicinit>
    80004c08:	00000097          	auipc	ra,0x0
    80004c0c:	5e0080e7          	jalr	1504(ra) # 800051e8 <plicinithart>
    80004c10:	00000097          	auipc	ra,0x0
    80004c14:	078080e7          	jalr	120(ra) # 80004c88 <userinit>
    80004c18:	0ff0000f          	fence
    80004c1c:	00100793          	li	a5,1
    80004c20:	00003517          	auipc	a0,0x3
    80004c24:	8d850513          	addi	a0,a0,-1832 # 800074f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x140>
    80004c28:	00f4a023          	sw	a5,0(s1)
    80004c2c:	00001097          	auipc	ra,0x1
    80004c30:	a4c080e7          	jalr	-1460(ra) # 80005678 <__printf>
    80004c34:	0000006f          	j	80004c34 <system_main+0xd4>

0000000080004c38 <cpuid>:
    80004c38:	ff010113          	addi	sp,sp,-16
    80004c3c:	00813423          	sd	s0,8(sp)
    80004c40:	01010413          	addi	s0,sp,16
    80004c44:	00020513          	mv	a0,tp
    80004c48:	00813403          	ld	s0,8(sp)
    80004c4c:	0005051b          	sext.w	a0,a0
    80004c50:	01010113          	addi	sp,sp,16
    80004c54:	00008067          	ret

0000000080004c58 <mycpu>:
    80004c58:	ff010113          	addi	sp,sp,-16
    80004c5c:	00813423          	sd	s0,8(sp)
    80004c60:	01010413          	addi	s0,sp,16
    80004c64:	00020793          	mv	a5,tp
    80004c68:	00813403          	ld	s0,8(sp)
    80004c6c:	0007879b          	sext.w	a5,a5
    80004c70:	00779793          	slli	a5,a5,0x7
    80004c74:	00005517          	auipc	a0,0x5
    80004c78:	1ec50513          	addi	a0,a0,492 # 80009e60 <cpus>
    80004c7c:	00f50533          	add	a0,a0,a5
    80004c80:	01010113          	addi	sp,sp,16
    80004c84:	00008067          	ret

0000000080004c88 <userinit>:
    80004c88:	ff010113          	addi	sp,sp,-16
    80004c8c:	00813423          	sd	s0,8(sp)
    80004c90:	01010413          	addi	s0,sp,16
    80004c94:	00813403          	ld	s0,8(sp)
    80004c98:	01010113          	addi	sp,sp,16
    80004c9c:	ffffd317          	auipc	t1,0xffffd
    80004ca0:	3f430067          	jr	1012(t1) # 80002090 <main>

0000000080004ca4 <either_copyout>:
    80004ca4:	ff010113          	addi	sp,sp,-16
    80004ca8:	00813023          	sd	s0,0(sp)
    80004cac:	00113423          	sd	ra,8(sp)
    80004cb0:	01010413          	addi	s0,sp,16
    80004cb4:	02051663          	bnez	a0,80004ce0 <either_copyout+0x3c>
    80004cb8:	00058513          	mv	a0,a1
    80004cbc:	00060593          	mv	a1,a2
    80004cc0:	0006861b          	sext.w	a2,a3
    80004cc4:	00002097          	auipc	ra,0x2
    80004cc8:	c60080e7          	jalr	-928(ra) # 80006924 <__memmove>
    80004ccc:	00813083          	ld	ra,8(sp)
    80004cd0:	00013403          	ld	s0,0(sp)
    80004cd4:	00000513          	li	a0,0
    80004cd8:	01010113          	addi	sp,sp,16
    80004cdc:	00008067          	ret
    80004ce0:	00003517          	auipc	a0,0x3
    80004ce4:	85850513          	addi	a0,a0,-1960 # 80007538 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x180>
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	934080e7          	jalr	-1740(ra) # 8000561c <panic>

0000000080004cf0 <either_copyin>:
    80004cf0:	ff010113          	addi	sp,sp,-16
    80004cf4:	00813023          	sd	s0,0(sp)
    80004cf8:	00113423          	sd	ra,8(sp)
    80004cfc:	01010413          	addi	s0,sp,16
    80004d00:	02059463          	bnez	a1,80004d28 <either_copyin+0x38>
    80004d04:	00060593          	mv	a1,a2
    80004d08:	0006861b          	sext.w	a2,a3
    80004d0c:	00002097          	auipc	ra,0x2
    80004d10:	c18080e7          	jalr	-1000(ra) # 80006924 <__memmove>
    80004d14:	00813083          	ld	ra,8(sp)
    80004d18:	00013403          	ld	s0,0(sp)
    80004d1c:	00000513          	li	a0,0
    80004d20:	01010113          	addi	sp,sp,16
    80004d24:	00008067          	ret
    80004d28:	00003517          	auipc	a0,0x3
    80004d2c:	83850513          	addi	a0,a0,-1992 # 80007560 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1a8>
    80004d30:	00001097          	auipc	ra,0x1
    80004d34:	8ec080e7          	jalr	-1812(ra) # 8000561c <panic>

0000000080004d38 <trapinit>:
    80004d38:	ff010113          	addi	sp,sp,-16
    80004d3c:	00813423          	sd	s0,8(sp)
    80004d40:	01010413          	addi	s0,sp,16
    80004d44:	00813403          	ld	s0,8(sp)
    80004d48:	00003597          	auipc	a1,0x3
    80004d4c:	84058593          	addi	a1,a1,-1984 # 80007588 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1d0>
    80004d50:	00005517          	auipc	a0,0x5
    80004d54:	19050513          	addi	a0,a0,400 # 80009ee0 <tickslock>
    80004d58:	01010113          	addi	sp,sp,16
    80004d5c:	00001317          	auipc	t1,0x1
    80004d60:	5cc30067          	jr	1484(t1) # 80006328 <initlock>

0000000080004d64 <trapinithart>:
    80004d64:	ff010113          	addi	sp,sp,-16
    80004d68:	00813423          	sd	s0,8(sp)
    80004d6c:	01010413          	addi	s0,sp,16
    80004d70:	00000797          	auipc	a5,0x0
    80004d74:	30078793          	addi	a5,a5,768 # 80005070 <kernelvec>
    80004d78:	10579073          	csrw	stvec,a5
    80004d7c:	00813403          	ld	s0,8(sp)
    80004d80:	01010113          	addi	sp,sp,16
    80004d84:	00008067          	ret

0000000080004d88 <usertrap>:
    80004d88:	ff010113          	addi	sp,sp,-16
    80004d8c:	00813423          	sd	s0,8(sp)
    80004d90:	01010413          	addi	s0,sp,16
    80004d94:	00813403          	ld	s0,8(sp)
    80004d98:	01010113          	addi	sp,sp,16
    80004d9c:	00008067          	ret

0000000080004da0 <usertrapret>:
    80004da0:	ff010113          	addi	sp,sp,-16
    80004da4:	00813423          	sd	s0,8(sp)
    80004da8:	01010413          	addi	s0,sp,16
    80004dac:	00813403          	ld	s0,8(sp)
    80004db0:	01010113          	addi	sp,sp,16
    80004db4:	00008067          	ret

0000000080004db8 <kerneltrap>:
    80004db8:	fe010113          	addi	sp,sp,-32
    80004dbc:	00813823          	sd	s0,16(sp)
    80004dc0:	00113c23          	sd	ra,24(sp)
    80004dc4:	00913423          	sd	s1,8(sp)
    80004dc8:	02010413          	addi	s0,sp,32
    80004dcc:	142025f3          	csrr	a1,scause
    80004dd0:	100027f3          	csrr	a5,sstatus
    80004dd4:	0027f793          	andi	a5,a5,2
    80004dd8:	10079c63          	bnez	a5,80004ef0 <kerneltrap+0x138>
    80004ddc:	142027f3          	csrr	a5,scause
    80004de0:	0207ce63          	bltz	a5,80004e1c <kerneltrap+0x64>
    80004de4:	00002517          	auipc	a0,0x2
    80004de8:	7ec50513          	addi	a0,a0,2028 # 800075d0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x218>
    80004dec:	00001097          	auipc	ra,0x1
    80004df0:	88c080e7          	jalr	-1908(ra) # 80005678 <__printf>
    80004df4:	141025f3          	csrr	a1,sepc
    80004df8:	14302673          	csrr	a2,stval
    80004dfc:	00002517          	auipc	a0,0x2
    80004e00:	7e450513          	addi	a0,a0,2020 # 800075e0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x228>
    80004e04:	00001097          	auipc	ra,0x1
    80004e08:	874080e7          	jalr	-1932(ra) # 80005678 <__printf>
    80004e0c:	00002517          	auipc	a0,0x2
    80004e10:	7ec50513          	addi	a0,a0,2028 # 800075f8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x240>
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	808080e7          	jalr	-2040(ra) # 8000561c <panic>
    80004e1c:	0ff7f713          	andi	a4,a5,255
    80004e20:	00900693          	li	a3,9
    80004e24:	04d70063          	beq	a4,a3,80004e64 <kerneltrap+0xac>
    80004e28:	fff00713          	li	a4,-1
    80004e2c:	03f71713          	slli	a4,a4,0x3f
    80004e30:	00170713          	addi	a4,a4,1
    80004e34:	fae798e3          	bne	a5,a4,80004de4 <kerneltrap+0x2c>
    80004e38:	00000097          	auipc	ra,0x0
    80004e3c:	e00080e7          	jalr	-512(ra) # 80004c38 <cpuid>
    80004e40:	06050663          	beqz	a0,80004eac <kerneltrap+0xf4>
    80004e44:	144027f3          	csrr	a5,sip
    80004e48:	ffd7f793          	andi	a5,a5,-3
    80004e4c:	14479073          	csrw	sip,a5
    80004e50:	01813083          	ld	ra,24(sp)
    80004e54:	01013403          	ld	s0,16(sp)
    80004e58:	00813483          	ld	s1,8(sp)
    80004e5c:	02010113          	addi	sp,sp,32
    80004e60:	00008067          	ret
    80004e64:	00000097          	auipc	ra,0x0
    80004e68:	3d0080e7          	jalr	976(ra) # 80005234 <plic_claim>
    80004e6c:	00a00793          	li	a5,10
    80004e70:	00050493          	mv	s1,a0
    80004e74:	06f50863          	beq	a0,a5,80004ee4 <kerneltrap+0x12c>
    80004e78:	fc050ce3          	beqz	a0,80004e50 <kerneltrap+0x98>
    80004e7c:	00050593          	mv	a1,a0
    80004e80:	00002517          	auipc	a0,0x2
    80004e84:	73050513          	addi	a0,a0,1840 # 800075b0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1f8>
    80004e88:	00000097          	auipc	ra,0x0
    80004e8c:	7f0080e7          	jalr	2032(ra) # 80005678 <__printf>
    80004e90:	01013403          	ld	s0,16(sp)
    80004e94:	01813083          	ld	ra,24(sp)
    80004e98:	00048513          	mv	a0,s1
    80004e9c:	00813483          	ld	s1,8(sp)
    80004ea0:	02010113          	addi	sp,sp,32
    80004ea4:	00000317          	auipc	t1,0x0
    80004ea8:	3c830067          	jr	968(t1) # 8000526c <plic_complete>
    80004eac:	00005517          	auipc	a0,0x5
    80004eb0:	03450513          	addi	a0,a0,52 # 80009ee0 <tickslock>
    80004eb4:	00001097          	auipc	ra,0x1
    80004eb8:	498080e7          	jalr	1176(ra) # 8000634c <acquire>
    80004ebc:	00004717          	auipc	a4,0x4
    80004ec0:	ef070713          	addi	a4,a4,-272 # 80008dac <ticks>
    80004ec4:	00072783          	lw	a5,0(a4)
    80004ec8:	00005517          	auipc	a0,0x5
    80004ecc:	01850513          	addi	a0,a0,24 # 80009ee0 <tickslock>
    80004ed0:	0017879b          	addiw	a5,a5,1
    80004ed4:	00f72023          	sw	a5,0(a4)
    80004ed8:	00001097          	auipc	ra,0x1
    80004edc:	540080e7          	jalr	1344(ra) # 80006418 <release>
    80004ee0:	f65ff06f          	j	80004e44 <kerneltrap+0x8c>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	09c080e7          	jalr	156(ra) # 80005f80 <uartintr>
    80004eec:	fa5ff06f          	j	80004e90 <kerneltrap+0xd8>
    80004ef0:	00002517          	auipc	a0,0x2
    80004ef4:	6a050513          	addi	a0,a0,1696 # 80007590 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1d8>
    80004ef8:	00000097          	auipc	ra,0x0
    80004efc:	724080e7          	jalr	1828(ra) # 8000561c <panic>

0000000080004f00 <clockintr>:
    80004f00:	fe010113          	addi	sp,sp,-32
    80004f04:	00813823          	sd	s0,16(sp)
    80004f08:	00913423          	sd	s1,8(sp)
    80004f0c:	00113c23          	sd	ra,24(sp)
    80004f10:	02010413          	addi	s0,sp,32
    80004f14:	00005497          	auipc	s1,0x5
    80004f18:	fcc48493          	addi	s1,s1,-52 # 80009ee0 <tickslock>
    80004f1c:	00048513          	mv	a0,s1
    80004f20:	00001097          	auipc	ra,0x1
    80004f24:	42c080e7          	jalr	1068(ra) # 8000634c <acquire>
    80004f28:	00004717          	auipc	a4,0x4
    80004f2c:	e8470713          	addi	a4,a4,-380 # 80008dac <ticks>
    80004f30:	00072783          	lw	a5,0(a4)
    80004f34:	01013403          	ld	s0,16(sp)
    80004f38:	01813083          	ld	ra,24(sp)
    80004f3c:	00048513          	mv	a0,s1
    80004f40:	0017879b          	addiw	a5,a5,1
    80004f44:	00813483          	ld	s1,8(sp)
    80004f48:	00f72023          	sw	a5,0(a4)
    80004f4c:	02010113          	addi	sp,sp,32
    80004f50:	00001317          	auipc	t1,0x1
    80004f54:	4c830067          	jr	1224(t1) # 80006418 <release>

0000000080004f58 <devintr>:
    80004f58:	142027f3          	csrr	a5,scause
    80004f5c:	00000513          	li	a0,0
    80004f60:	0007c463          	bltz	a5,80004f68 <devintr+0x10>
    80004f64:	00008067          	ret
    80004f68:	fe010113          	addi	sp,sp,-32
    80004f6c:	00813823          	sd	s0,16(sp)
    80004f70:	00113c23          	sd	ra,24(sp)
    80004f74:	00913423          	sd	s1,8(sp)
    80004f78:	02010413          	addi	s0,sp,32
    80004f7c:	0ff7f713          	andi	a4,a5,255
    80004f80:	00900693          	li	a3,9
    80004f84:	04d70c63          	beq	a4,a3,80004fdc <devintr+0x84>
    80004f88:	fff00713          	li	a4,-1
    80004f8c:	03f71713          	slli	a4,a4,0x3f
    80004f90:	00170713          	addi	a4,a4,1
    80004f94:	00e78c63          	beq	a5,a4,80004fac <devintr+0x54>
    80004f98:	01813083          	ld	ra,24(sp)
    80004f9c:	01013403          	ld	s0,16(sp)
    80004fa0:	00813483          	ld	s1,8(sp)
    80004fa4:	02010113          	addi	sp,sp,32
    80004fa8:	00008067          	ret
    80004fac:	00000097          	auipc	ra,0x0
    80004fb0:	c8c080e7          	jalr	-884(ra) # 80004c38 <cpuid>
    80004fb4:	06050663          	beqz	a0,80005020 <devintr+0xc8>
    80004fb8:	144027f3          	csrr	a5,sip
    80004fbc:	ffd7f793          	andi	a5,a5,-3
    80004fc0:	14479073          	csrw	sip,a5
    80004fc4:	01813083          	ld	ra,24(sp)
    80004fc8:	01013403          	ld	s0,16(sp)
    80004fcc:	00813483          	ld	s1,8(sp)
    80004fd0:	00200513          	li	a0,2
    80004fd4:	02010113          	addi	sp,sp,32
    80004fd8:	00008067          	ret
    80004fdc:	00000097          	auipc	ra,0x0
    80004fe0:	258080e7          	jalr	600(ra) # 80005234 <plic_claim>
    80004fe4:	00a00793          	li	a5,10
    80004fe8:	00050493          	mv	s1,a0
    80004fec:	06f50663          	beq	a0,a5,80005058 <devintr+0x100>
    80004ff0:	00100513          	li	a0,1
    80004ff4:	fa0482e3          	beqz	s1,80004f98 <devintr+0x40>
    80004ff8:	00048593          	mv	a1,s1
    80004ffc:	00002517          	auipc	a0,0x2
    80005000:	5b450513          	addi	a0,a0,1460 # 800075b0 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x1f8>
    80005004:	00000097          	auipc	ra,0x0
    80005008:	674080e7          	jalr	1652(ra) # 80005678 <__printf>
    8000500c:	00048513          	mv	a0,s1
    80005010:	00000097          	auipc	ra,0x0
    80005014:	25c080e7          	jalr	604(ra) # 8000526c <plic_complete>
    80005018:	00100513          	li	a0,1
    8000501c:	f7dff06f          	j	80004f98 <devintr+0x40>
    80005020:	00005517          	auipc	a0,0x5
    80005024:	ec050513          	addi	a0,a0,-320 # 80009ee0 <tickslock>
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	324080e7          	jalr	804(ra) # 8000634c <acquire>
    80005030:	00004717          	auipc	a4,0x4
    80005034:	d7c70713          	addi	a4,a4,-644 # 80008dac <ticks>
    80005038:	00072783          	lw	a5,0(a4)
    8000503c:	00005517          	auipc	a0,0x5
    80005040:	ea450513          	addi	a0,a0,-348 # 80009ee0 <tickslock>
    80005044:	0017879b          	addiw	a5,a5,1
    80005048:	00f72023          	sw	a5,0(a4)
    8000504c:	00001097          	auipc	ra,0x1
    80005050:	3cc080e7          	jalr	972(ra) # 80006418 <release>
    80005054:	f65ff06f          	j	80004fb8 <devintr+0x60>
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	f28080e7          	jalr	-216(ra) # 80005f80 <uartintr>
    80005060:	fadff06f          	j	8000500c <devintr+0xb4>
	...

0000000080005070 <kernelvec>:
    80005070:	f0010113          	addi	sp,sp,-256
    80005074:	00113023          	sd	ra,0(sp)
    80005078:	00213423          	sd	sp,8(sp)
    8000507c:	00313823          	sd	gp,16(sp)
    80005080:	00413c23          	sd	tp,24(sp)
    80005084:	02513023          	sd	t0,32(sp)
    80005088:	02613423          	sd	t1,40(sp)
    8000508c:	02713823          	sd	t2,48(sp)
    80005090:	02813c23          	sd	s0,56(sp)
    80005094:	04913023          	sd	s1,64(sp)
    80005098:	04a13423          	sd	a0,72(sp)
    8000509c:	04b13823          	sd	a1,80(sp)
    800050a0:	04c13c23          	sd	a2,88(sp)
    800050a4:	06d13023          	sd	a3,96(sp)
    800050a8:	06e13423          	sd	a4,104(sp)
    800050ac:	06f13823          	sd	a5,112(sp)
    800050b0:	07013c23          	sd	a6,120(sp)
    800050b4:	09113023          	sd	a7,128(sp)
    800050b8:	09213423          	sd	s2,136(sp)
    800050bc:	09313823          	sd	s3,144(sp)
    800050c0:	09413c23          	sd	s4,152(sp)
    800050c4:	0b513023          	sd	s5,160(sp)
    800050c8:	0b613423          	sd	s6,168(sp)
    800050cc:	0b713823          	sd	s7,176(sp)
    800050d0:	0b813c23          	sd	s8,184(sp)
    800050d4:	0d913023          	sd	s9,192(sp)
    800050d8:	0da13423          	sd	s10,200(sp)
    800050dc:	0db13823          	sd	s11,208(sp)
    800050e0:	0dc13c23          	sd	t3,216(sp)
    800050e4:	0fd13023          	sd	t4,224(sp)
    800050e8:	0fe13423          	sd	t5,232(sp)
    800050ec:	0ff13823          	sd	t6,240(sp)
    800050f0:	cc9ff0ef          	jal	ra,80004db8 <kerneltrap>
    800050f4:	00013083          	ld	ra,0(sp)
    800050f8:	00813103          	ld	sp,8(sp)
    800050fc:	01013183          	ld	gp,16(sp)
    80005100:	02013283          	ld	t0,32(sp)
    80005104:	02813303          	ld	t1,40(sp)
    80005108:	03013383          	ld	t2,48(sp)
    8000510c:	03813403          	ld	s0,56(sp)
    80005110:	04013483          	ld	s1,64(sp)
    80005114:	04813503          	ld	a0,72(sp)
    80005118:	05013583          	ld	a1,80(sp)
    8000511c:	05813603          	ld	a2,88(sp)
    80005120:	06013683          	ld	a3,96(sp)
    80005124:	06813703          	ld	a4,104(sp)
    80005128:	07013783          	ld	a5,112(sp)
    8000512c:	07813803          	ld	a6,120(sp)
    80005130:	08013883          	ld	a7,128(sp)
    80005134:	08813903          	ld	s2,136(sp)
    80005138:	09013983          	ld	s3,144(sp)
    8000513c:	09813a03          	ld	s4,152(sp)
    80005140:	0a013a83          	ld	s5,160(sp)
    80005144:	0a813b03          	ld	s6,168(sp)
    80005148:	0b013b83          	ld	s7,176(sp)
    8000514c:	0b813c03          	ld	s8,184(sp)
    80005150:	0c013c83          	ld	s9,192(sp)
    80005154:	0c813d03          	ld	s10,200(sp)
    80005158:	0d013d83          	ld	s11,208(sp)
    8000515c:	0d813e03          	ld	t3,216(sp)
    80005160:	0e013e83          	ld	t4,224(sp)
    80005164:	0e813f03          	ld	t5,232(sp)
    80005168:	0f013f83          	ld	t6,240(sp)
    8000516c:	10010113          	addi	sp,sp,256
    80005170:	10200073          	sret
    80005174:	00000013          	nop
    80005178:	00000013          	nop
    8000517c:	00000013          	nop

0000000080005180 <timervec>:
    80005180:	34051573          	csrrw	a0,mscratch,a0
    80005184:	00b53023          	sd	a1,0(a0)
    80005188:	00c53423          	sd	a2,8(a0)
    8000518c:	00d53823          	sd	a3,16(a0)
    80005190:	01853583          	ld	a1,24(a0)
    80005194:	02053603          	ld	a2,32(a0)
    80005198:	0005b683          	ld	a3,0(a1)
    8000519c:	00c686b3          	add	a3,a3,a2
    800051a0:	00d5b023          	sd	a3,0(a1)
    800051a4:	00200593          	li	a1,2
    800051a8:	14459073          	csrw	sip,a1
    800051ac:	01053683          	ld	a3,16(a0)
    800051b0:	00853603          	ld	a2,8(a0)
    800051b4:	00053583          	ld	a1,0(a0)
    800051b8:	34051573          	csrrw	a0,mscratch,a0
    800051bc:	30200073          	mret

00000000800051c0 <plicinit>:
    800051c0:	ff010113          	addi	sp,sp,-16
    800051c4:	00813423          	sd	s0,8(sp)
    800051c8:	01010413          	addi	s0,sp,16
    800051cc:	00813403          	ld	s0,8(sp)
    800051d0:	0c0007b7          	lui	a5,0xc000
    800051d4:	00100713          	li	a4,1
    800051d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800051dc:	00e7a223          	sw	a4,4(a5)
    800051e0:	01010113          	addi	sp,sp,16
    800051e4:	00008067          	ret

00000000800051e8 <plicinithart>:
    800051e8:	ff010113          	addi	sp,sp,-16
    800051ec:	00813023          	sd	s0,0(sp)
    800051f0:	00113423          	sd	ra,8(sp)
    800051f4:	01010413          	addi	s0,sp,16
    800051f8:	00000097          	auipc	ra,0x0
    800051fc:	a40080e7          	jalr	-1472(ra) # 80004c38 <cpuid>
    80005200:	0085171b          	slliw	a4,a0,0x8
    80005204:	0c0027b7          	lui	a5,0xc002
    80005208:	00e787b3          	add	a5,a5,a4
    8000520c:	40200713          	li	a4,1026
    80005210:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005214:	00813083          	ld	ra,8(sp)
    80005218:	00013403          	ld	s0,0(sp)
    8000521c:	00d5151b          	slliw	a0,a0,0xd
    80005220:	0c2017b7          	lui	a5,0xc201
    80005224:	00a78533          	add	a0,a5,a0
    80005228:	00052023          	sw	zero,0(a0)
    8000522c:	01010113          	addi	sp,sp,16
    80005230:	00008067          	ret

0000000080005234 <plic_claim>:
    80005234:	ff010113          	addi	sp,sp,-16
    80005238:	00813023          	sd	s0,0(sp)
    8000523c:	00113423          	sd	ra,8(sp)
    80005240:	01010413          	addi	s0,sp,16
    80005244:	00000097          	auipc	ra,0x0
    80005248:	9f4080e7          	jalr	-1548(ra) # 80004c38 <cpuid>
    8000524c:	00813083          	ld	ra,8(sp)
    80005250:	00013403          	ld	s0,0(sp)
    80005254:	00d5151b          	slliw	a0,a0,0xd
    80005258:	0c2017b7          	lui	a5,0xc201
    8000525c:	00a78533          	add	a0,a5,a0
    80005260:	00452503          	lw	a0,4(a0)
    80005264:	01010113          	addi	sp,sp,16
    80005268:	00008067          	ret

000000008000526c <plic_complete>:
    8000526c:	fe010113          	addi	sp,sp,-32
    80005270:	00813823          	sd	s0,16(sp)
    80005274:	00913423          	sd	s1,8(sp)
    80005278:	00113c23          	sd	ra,24(sp)
    8000527c:	02010413          	addi	s0,sp,32
    80005280:	00050493          	mv	s1,a0
    80005284:	00000097          	auipc	ra,0x0
    80005288:	9b4080e7          	jalr	-1612(ra) # 80004c38 <cpuid>
    8000528c:	01813083          	ld	ra,24(sp)
    80005290:	01013403          	ld	s0,16(sp)
    80005294:	00d5179b          	slliw	a5,a0,0xd
    80005298:	0c201737          	lui	a4,0xc201
    8000529c:	00f707b3          	add	a5,a4,a5
    800052a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800052a4:	00813483          	ld	s1,8(sp)
    800052a8:	02010113          	addi	sp,sp,32
    800052ac:	00008067          	ret

00000000800052b0 <consolewrite>:
    800052b0:	fb010113          	addi	sp,sp,-80
    800052b4:	04813023          	sd	s0,64(sp)
    800052b8:	04113423          	sd	ra,72(sp)
    800052bc:	02913c23          	sd	s1,56(sp)
    800052c0:	03213823          	sd	s2,48(sp)
    800052c4:	03313423          	sd	s3,40(sp)
    800052c8:	03413023          	sd	s4,32(sp)
    800052cc:	01513c23          	sd	s5,24(sp)
    800052d0:	05010413          	addi	s0,sp,80
    800052d4:	06c05c63          	blez	a2,8000534c <consolewrite+0x9c>
    800052d8:	00060993          	mv	s3,a2
    800052dc:	00050a13          	mv	s4,a0
    800052e0:	00058493          	mv	s1,a1
    800052e4:	00000913          	li	s2,0
    800052e8:	fff00a93          	li	s5,-1
    800052ec:	01c0006f          	j	80005308 <consolewrite+0x58>
    800052f0:	fbf44503          	lbu	a0,-65(s0)
    800052f4:	0019091b          	addiw	s2,s2,1
    800052f8:	00148493          	addi	s1,s1,1
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	a9c080e7          	jalr	-1380(ra) # 80005d98 <uartputc>
    80005304:	03298063          	beq	s3,s2,80005324 <consolewrite+0x74>
    80005308:	00048613          	mv	a2,s1
    8000530c:	00100693          	li	a3,1
    80005310:	000a0593          	mv	a1,s4
    80005314:	fbf40513          	addi	a0,s0,-65
    80005318:	00000097          	auipc	ra,0x0
    8000531c:	9d8080e7          	jalr	-1576(ra) # 80004cf0 <either_copyin>
    80005320:	fd5518e3          	bne	a0,s5,800052f0 <consolewrite+0x40>
    80005324:	04813083          	ld	ra,72(sp)
    80005328:	04013403          	ld	s0,64(sp)
    8000532c:	03813483          	ld	s1,56(sp)
    80005330:	02813983          	ld	s3,40(sp)
    80005334:	02013a03          	ld	s4,32(sp)
    80005338:	01813a83          	ld	s5,24(sp)
    8000533c:	00090513          	mv	a0,s2
    80005340:	03013903          	ld	s2,48(sp)
    80005344:	05010113          	addi	sp,sp,80
    80005348:	00008067          	ret
    8000534c:	00000913          	li	s2,0
    80005350:	fd5ff06f          	j	80005324 <consolewrite+0x74>

0000000080005354 <consoleread>:
    80005354:	f9010113          	addi	sp,sp,-112
    80005358:	06813023          	sd	s0,96(sp)
    8000535c:	04913c23          	sd	s1,88(sp)
    80005360:	05213823          	sd	s2,80(sp)
    80005364:	05313423          	sd	s3,72(sp)
    80005368:	05413023          	sd	s4,64(sp)
    8000536c:	03513c23          	sd	s5,56(sp)
    80005370:	03613823          	sd	s6,48(sp)
    80005374:	03713423          	sd	s7,40(sp)
    80005378:	03813023          	sd	s8,32(sp)
    8000537c:	06113423          	sd	ra,104(sp)
    80005380:	01913c23          	sd	s9,24(sp)
    80005384:	07010413          	addi	s0,sp,112
    80005388:	00060b93          	mv	s7,a2
    8000538c:	00050913          	mv	s2,a0
    80005390:	00058c13          	mv	s8,a1
    80005394:	00060b1b          	sext.w	s6,a2
    80005398:	00005497          	auipc	s1,0x5
    8000539c:	b7048493          	addi	s1,s1,-1168 # 80009f08 <cons>
    800053a0:	00400993          	li	s3,4
    800053a4:	fff00a13          	li	s4,-1
    800053a8:	00a00a93          	li	s5,10
    800053ac:	05705e63          	blez	s7,80005408 <consoleread+0xb4>
    800053b0:	09c4a703          	lw	a4,156(s1)
    800053b4:	0984a783          	lw	a5,152(s1)
    800053b8:	0007071b          	sext.w	a4,a4
    800053bc:	08e78463          	beq	a5,a4,80005444 <consoleread+0xf0>
    800053c0:	07f7f713          	andi	a4,a5,127
    800053c4:	00e48733          	add	a4,s1,a4
    800053c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800053cc:	0017869b          	addiw	a3,a5,1
    800053d0:	08d4ac23          	sw	a3,152(s1)
    800053d4:	00070c9b          	sext.w	s9,a4
    800053d8:	0b370663          	beq	a4,s3,80005484 <consoleread+0x130>
    800053dc:	00100693          	li	a3,1
    800053e0:	f9f40613          	addi	a2,s0,-97
    800053e4:	000c0593          	mv	a1,s8
    800053e8:	00090513          	mv	a0,s2
    800053ec:	f8e40fa3          	sb	a4,-97(s0)
    800053f0:	00000097          	auipc	ra,0x0
    800053f4:	8b4080e7          	jalr	-1868(ra) # 80004ca4 <either_copyout>
    800053f8:	01450863          	beq	a0,s4,80005408 <consoleread+0xb4>
    800053fc:	001c0c13          	addi	s8,s8,1
    80005400:	fffb8b9b          	addiw	s7,s7,-1
    80005404:	fb5c94e3          	bne	s9,s5,800053ac <consoleread+0x58>
    80005408:	000b851b          	sext.w	a0,s7
    8000540c:	06813083          	ld	ra,104(sp)
    80005410:	06013403          	ld	s0,96(sp)
    80005414:	05813483          	ld	s1,88(sp)
    80005418:	05013903          	ld	s2,80(sp)
    8000541c:	04813983          	ld	s3,72(sp)
    80005420:	04013a03          	ld	s4,64(sp)
    80005424:	03813a83          	ld	s5,56(sp)
    80005428:	02813b83          	ld	s7,40(sp)
    8000542c:	02013c03          	ld	s8,32(sp)
    80005430:	01813c83          	ld	s9,24(sp)
    80005434:	40ab053b          	subw	a0,s6,a0
    80005438:	03013b03          	ld	s6,48(sp)
    8000543c:	07010113          	addi	sp,sp,112
    80005440:	00008067          	ret
    80005444:	00001097          	auipc	ra,0x1
    80005448:	1d8080e7          	jalr	472(ra) # 8000661c <push_on>
    8000544c:	0984a703          	lw	a4,152(s1)
    80005450:	09c4a783          	lw	a5,156(s1)
    80005454:	0007879b          	sext.w	a5,a5
    80005458:	fef70ce3          	beq	a4,a5,80005450 <consoleread+0xfc>
    8000545c:	00001097          	auipc	ra,0x1
    80005460:	234080e7          	jalr	564(ra) # 80006690 <pop_on>
    80005464:	0984a783          	lw	a5,152(s1)
    80005468:	07f7f713          	andi	a4,a5,127
    8000546c:	00e48733          	add	a4,s1,a4
    80005470:	01874703          	lbu	a4,24(a4)
    80005474:	0017869b          	addiw	a3,a5,1
    80005478:	08d4ac23          	sw	a3,152(s1)
    8000547c:	00070c9b          	sext.w	s9,a4
    80005480:	f5371ee3          	bne	a4,s3,800053dc <consoleread+0x88>
    80005484:	000b851b          	sext.w	a0,s7
    80005488:	f96bf2e3          	bgeu	s7,s6,8000540c <consoleread+0xb8>
    8000548c:	08f4ac23          	sw	a5,152(s1)
    80005490:	f7dff06f          	j	8000540c <consoleread+0xb8>

0000000080005494 <consputc>:
    80005494:	10000793          	li	a5,256
    80005498:	00f50663          	beq	a0,a5,800054a4 <consputc+0x10>
    8000549c:	00001317          	auipc	t1,0x1
    800054a0:	9f430067          	jr	-1548(t1) # 80005e90 <uartputc_sync>
    800054a4:	ff010113          	addi	sp,sp,-16
    800054a8:	00113423          	sd	ra,8(sp)
    800054ac:	00813023          	sd	s0,0(sp)
    800054b0:	01010413          	addi	s0,sp,16
    800054b4:	00800513          	li	a0,8
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	9d8080e7          	jalr	-1576(ra) # 80005e90 <uartputc_sync>
    800054c0:	02000513          	li	a0,32
    800054c4:	00001097          	auipc	ra,0x1
    800054c8:	9cc080e7          	jalr	-1588(ra) # 80005e90 <uartputc_sync>
    800054cc:	00013403          	ld	s0,0(sp)
    800054d0:	00813083          	ld	ra,8(sp)
    800054d4:	00800513          	li	a0,8
    800054d8:	01010113          	addi	sp,sp,16
    800054dc:	00001317          	auipc	t1,0x1
    800054e0:	9b430067          	jr	-1612(t1) # 80005e90 <uartputc_sync>

00000000800054e4 <consoleintr>:
    800054e4:	fe010113          	addi	sp,sp,-32
    800054e8:	00813823          	sd	s0,16(sp)
    800054ec:	00913423          	sd	s1,8(sp)
    800054f0:	01213023          	sd	s2,0(sp)
    800054f4:	00113c23          	sd	ra,24(sp)
    800054f8:	02010413          	addi	s0,sp,32
    800054fc:	00005917          	auipc	s2,0x5
    80005500:	a0c90913          	addi	s2,s2,-1524 # 80009f08 <cons>
    80005504:	00050493          	mv	s1,a0
    80005508:	00090513          	mv	a0,s2
    8000550c:	00001097          	auipc	ra,0x1
    80005510:	e40080e7          	jalr	-448(ra) # 8000634c <acquire>
    80005514:	02048c63          	beqz	s1,8000554c <consoleintr+0x68>
    80005518:	0a092783          	lw	a5,160(s2)
    8000551c:	09892703          	lw	a4,152(s2)
    80005520:	07f00693          	li	a3,127
    80005524:	40e7873b          	subw	a4,a5,a4
    80005528:	02e6e263          	bltu	a3,a4,8000554c <consoleintr+0x68>
    8000552c:	00d00713          	li	a4,13
    80005530:	04e48063          	beq	s1,a4,80005570 <consoleintr+0x8c>
    80005534:	07f7f713          	andi	a4,a5,127
    80005538:	00e90733          	add	a4,s2,a4
    8000553c:	0017879b          	addiw	a5,a5,1
    80005540:	0af92023          	sw	a5,160(s2)
    80005544:	00970c23          	sb	s1,24(a4)
    80005548:	08f92e23          	sw	a5,156(s2)
    8000554c:	01013403          	ld	s0,16(sp)
    80005550:	01813083          	ld	ra,24(sp)
    80005554:	00813483          	ld	s1,8(sp)
    80005558:	00013903          	ld	s2,0(sp)
    8000555c:	00005517          	auipc	a0,0x5
    80005560:	9ac50513          	addi	a0,a0,-1620 # 80009f08 <cons>
    80005564:	02010113          	addi	sp,sp,32
    80005568:	00001317          	auipc	t1,0x1
    8000556c:	eb030067          	jr	-336(t1) # 80006418 <release>
    80005570:	00a00493          	li	s1,10
    80005574:	fc1ff06f          	j	80005534 <consoleintr+0x50>

0000000080005578 <consoleinit>:
    80005578:	fe010113          	addi	sp,sp,-32
    8000557c:	00113c23          	sd	ra,24(sp)
    80005580:	00813823          	sd	s0,16(sp)
    80005584:	00913423          	sd	s1,8(sp)
    80005588:	02010413          	addi	s0,sp,32
    8000558c:	00005497          	auipc	s1,0x5
    80005590:	97c48493          	addi	s1,s1,-1668 # 80009f08 <cons>
    80005594:	00048513          	mv	a0,s1
    80005598:	00002597          	auipc	a1,0x2
    8000559c:	07058593          	addi	a1,a1,112 # 80007608 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x250>
    800055a0:	00001097          	auipc	ra,0x1
    800055a4:	d88080e7          	jalr	-632(ra) # 80006328 <initlock>
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	7ac080e7          	jalr	1964(ra) # 80005d54 <uartinit>
    800055b0:	01813083          	ld	ra,24(sp)
    800055b4:	01013403          	ld	s0,16(sp)
    800055b8:	00000797          	auipc	a5,0x0
    800055bc:	d9c78793          	addi	a5,a5,-612 # 80005354 <consoleread>
    800055c0:	0af4bc23          	sd	a5,184(s1)
    800055c4:	00000797          	auipc	a5,0x0
    800055c8:	cec78793          	addi	a5,a5,-788 # 800052b0 <consolewrite>
    800055cc:	0cf4b023          	sd	a5,192(s1)
    800055d0:	00813483          	ld	s1,8(sp)
    800055d4:	02010113          	addi	sp,sp,32
    800055d8:	00008067          	ret

00000000800055dc <console_read>:
    800055dc:	ff010113          	addi	sp,sp,-16
    800055e0:	00813423          	sd	s0,8(sp)
    800055e4:	01010413          	addi	s0,sp,16
    800055e8:	00813403          	ld	s0,8(sp)
    800055ec:	00005317          	auipc	t1,0x5
    800055f0:	9d433303          	ld	t1,-1580(t1) # 80009fc0 <devsw+0x10>
    800055f4:	01010113          	addi	sp,sp,16
    800055f8:	00030067          	jr	t1

00000000800055fc <console_write>:
    800055fc:	ff010113          	addi	sp,sp,-16
    80005600:	00813423          	sd	s0,8(sp)
    80005604:	01010413          	addi	s0,sp,16
    80005608:	00813403          	ld	s0,8(sp)
    8000560c:	00005317          	auipc	t1,0x5
    80005610:	9bc33303          	ld	t1,-1604(t1) # 80009fc8 <devsw+0x18>
    80005614:	01010113          	addi	sp,sp,16
    80005618:	00030067          	jr	t1

000000008000561c <panic>:
    8000561c:	fe010113          	addi	sp,sp,-32
    80005620:	00113c23          	sd	ra,24(sp)
    80005624:	00813823          	sd	s0,16(sp)
    80005628:	00913423          	sd	s1,8(sp)
    8000562c:	02010413          	addi	s0,sp,32
    80005630:	00050493          	mv	s1,a0
    80005634:	00002517          	auipc	a0,0x2
    80005638:	fdc50513          	addi	a0,a0,-36 # 80007610 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x258>
    8000563c:	00005797          	auipc	a5,0x5
    80005640:	a207a623          	sw	zero,-1492(a5) # 8000a068 <pr+0x18>
    80005644:	00000097          	auipc	ra,0x0
    80005648:	034080e7          	jalr	52(ra) # 80005678 <__printf>
    8000564c:	00048513          	mv	a0,s1
    80005650:	00000097          	auipc	ra,0x0
    80005654:	028080e7          	jalr	40(ra) # 80005678 <__printf>
    80005658:	00002517          	auipc	a0,0x2
    8000565c:	be850513          	addi	a0,a0,-1048 # 80007240 <CONSOLE_STATUS+0x230>
    80005660:	00000097          	auipc	ra,0x0
    80005664:	018080e7          	jalr	24(ra) # 80005678 <__printf>
    80005668:	00100793          	li	a5,1
    8000566c:	00003717          	auipc	a4,0x3
    80005670:	74f72223          	sw	a5,1860(a4) # 80008db0 <panicked>
    80005674:	0000006f          	j	80005674 <panic+0x58>

0000000080005678 <__printf>:
    80005678:	f3010113          	addi	sp,sp,-208
    8000567c:	08813023          	sd	s0,128(sp)
    80005680:	07313423          	sd	s3,104(sp)
    80005684:	09010413          	addi	s0,sp,144
    80005688:	05813023          	sd	s8,64(sp)
    8000568c:	08113423          	sd	ra,136(sp)
    80005690:	06913c23          	sd	s1,120(sp)
    80005694:	07213823          	sd	s2,112(sp)
    80005698:	07413023          	sd	s4,96(sp)
    8000569c:	05513c23          	sd	s5,88(sp)
    800056a0:	05613823          	sd	s6,80(sp)
    800056a4:	05713423          	sd	s7,72(sp)
    800056a8:	03913c23          	sd	s9,56(sp)
    800056ac:	03a13823          	sd	s10,48(sp)
    800056b0:	03b13423          	sd	s11,40(sp)
    800056b4:	00005317          	auipc	t1,0x5
    800056b8:	99c30313          	addi	t1,t1,-1636 # 8000a050 <pr>
    800056bc:	01832c03          	lw	s8,24(t1)
    800056c0:	00b43423          	sd	a1,8(s0)
    800056c4:	00c43823          	sd	a2,16(s0)
    800056c8:	00d43c23          	sd	a3,24(s0)
    800056cc:	02e43023          	sd	a4,32(s0)
    800056d0:	02f43423          	sd	a5,40(s0)
    800056d4:	03043823          	sd	a6,48(s0)
    800056d8:	03143c23          	sd	a7,56(s0)
    800056dc:	00050993          	mv	s3,a0
    800056e0:	4a0c1663          	bnez	s8,80005b8c <__printf+0x514>
    800056e4:	60098c63          	beqz	s3,80005cfc <__printf+0x684>
    800056e8:	0009c503          	lbu	a0,0(s3)
    800056ec:	00840793          	addi	a5,s0,8
    800056f0:	f6f43c23          	sd	a5,-136(s0)
    800056f4:	00000493          	li	s1,0
    800056f8:	22050063          	beqz	a0,80005918 <__printf+0x2a0>
    800056fc:	00002a37          	lui	s4,0x2
    80005700:	00018ab7          	lui	s5,0x18
    80005704:	000f4b37          	lui	s6,0xf4
    80005708:	00989bb7          	lui	s7,0x989
    8000570c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005710:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005714:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005718:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000571c:	00148c9b          	addiw	s9,s1,1
    80005720:	02500793          	li	a5,37
    80005724:	01998933          	add	s2,s3,s9
    80005728:	38f51263          	bne	a0,a5,80005aac <__printf+0x434>
    8000572c:	00094783          	lbu	a5,0(s2)
    80005730:	00078c9b          	sext.w	s9,a5
    80005734:	1e078263          	beqz	a5,80005918 <__printf+0x2a0>
    80005738:	0024849b          	addiw	s1,s1,2
    8000573c:	07000713          	li	a4,112
    80005740:	00998933          	add	s2,s3,s1
    80005744:	38e78a63          	beq	a5,a4,80005ad8 <__printf+0x460>
    80005748:	20f76863          	bltu	a4,a5,80005958 <__printf+0x2e0>
    8000574c:	42a78863          	beq	a5,a0,80005b7c <__printf+0x504>
    80005750:	06400713          	li	a4,100
    80005754:	40e79663          	bne	a5,a4,80005b60 <__printf+0x4e8>
    80005758:	f7843783          	ld	a5,-136(s0)
    8000575c:	0007a603          	lw	a2,0(a5)
    80005760:	00878793          	addi	a5,a5,8
    80005764:	f6f43c23          	sd	a5,-136(s0)
    80005768:	42064a63          	bltz	a2,80005b9c <__printf+0x524>
    8000576c:	00a00713          	li	a4,10
    80005770:	02e677bb          	remuw	a5,a2,a4
    80005774:	00002d97          	auipc	s11,0x2
    80005778:	ec4d8d93          	addi	s11,s11,-316 # 80007638 <digits>
    8000577c:	00900593          	li	a1,9
    80005780:	0006051b          	sext.w	a0,a2
    80005784:	00000c93          	li	s9,0
    80005788:	02079793          	slli	a5,a5,0x20
    8000578c:	0207d793          	srli	a5,a5,0x20
    80005790:	00fd87b3          	add	a5,s11,a5
    80005794:	0007c783          	lbu	a5,0(a5)
    80005798:	02e656bb          	divuw	a3,a2,a4
    8000579c:	f8f40023          	sb	a5,-128(s0)
    800057a0:	14c5d863          	bge	a1,a2,800058f0 <__printf+0x278>
    800057a4:	06300593          	li	a1,99
    800057a8:	00100c93          	li	s9,1
    800057ac:	02e6f7bb          	remuw	a5,a3,a4
    800057b0:	02079793          	slli	a5,a5,0x20
    800057b4:	0207d793          	srli	a5,a5,0x20
    800057b8:	00fd87b3          	add	a5,s11,a5
    800057bc:	0007c783          	lbu	a5,0(a5)
    800057c0:	02e6d73b          	divuw	a4,a3,a4
    800057c4:	f8f400a3          	sb	a5,-127(s0)
    800057c8:	12a5f463          	bgeu	a1,a0,800058f0 <__printf+0x278>
    800057cc:	00a00693          	li	a3,10
    800057d0:	00900593          	li	a1,9
    800057d4:	02d777bb          	remuw	a5,a4,a3
    800057d8:	02079793          	slli	a5,a5,0x20
    800057dc:	0207d793          	srli	a5,a5,0x20
    800057e0:	00fd87b3          	add	a5,s11,a5
    800057e4:	0007c503          	lbu	a0,0(a5)
    800057e8:	02d757bb          	divuw	a5,a4,a3
    800057ec:	f8a40123          	sb	a0,-126(s0)
    800057f0:	48e5f263          	bgeu	a1,a4,80005c74 <__printf+0x5fc>
    800057f4:	06300513          	li	a0,99
    800057f8:	02d7f5bb          	remuw	a1,a5,a3
    800057fc:	02059593          	slli	a1,a1,0x20
    80005800:	0205d593          	srli	a1,a1,0x20
    80005804:	00bd85b3          	add	a1,s11,a1
    80005808:	0005c583          	lbu	a1,0(a1)
    8000580c:	02d7d7bb          	divuw	a5,a5,a3
    80005810:	f8b401a3          	sb	a1,-125(s0)
    80005814:	48e57263          	bgeu	a0,a4,80005c98 <__printf+0x620>
    80005818:	3e700513          	li	a0,999
    8000581c:	02d7f5bb          	remuw	a1,a5,a3
    80005820:	02059593          	slli	a1,a1,0x20
    80005824:	0205d593          	srli	a1,a1,0x20
    80005828:	00bd85b3          	add	a1,s11,a1
    8000582c:	0005c583          	lbu	a1,0(a1)
    80005830:	02d7d7bb          	divuw	a5,a5,a3
    80005834:	f8b40223          	sb	a1,-124(s0)
    80005838:	46e57663          	bgeu	a0,a4,80005ca4 <__printf+0x62c>
    8000583c:	02d7f5bb          	remuw	a1,a5,a3
    80005840:	02059593          	slli	a1,a1,0x20
    80005844:	0205d593          	srli	a1,a1,0x20
    80005848:	00bd85b3          	add	a1,s11,a1
    8000584c:	0005c583          	lbu	a1,0(a1)
    80005850:	02d7d7bb          	divuw	a5,a5,a3
    80005854:	f8b402a3          	sb	a1,-123(s0)
    80005858:	46ea7863          	bgeu	s4,a4,80005cc8 <__printf+0x650>
    8000585c:	02d7f5bb          	remuw	a1,a5,a3
    80005860:	02059593          	slli	a1,a1,0x20
    80005864:	0205d593          	srli	a1,a1,0x20
    80005868:	00bd85b3          	add	a1,s11,a1
    8000586c:	0005c583          	lbu	a1,0(a1)
    80005870:	02d7d7bb          	divuw	a5,a5,a3
    80005874:	f8b40323          	sb	a1,-122(s0)
    80005878:	3eeaf863          	bgeu	s5,a4,80005c68 <__printf+0x5f0>
    8000587c:	02d7f5bb          	remuw	a1,a5,a3
    80005880:	02059593          	slli	a1,a1,0x20
    80005884:	0205d593          	srli	a1,a1,0x20
    80005888:	00bd85b3          	add	a1,s11,a1
    8000588c:	0005c583          	lbu	a1,0(a1)
    80005890:	02d7d7bb          	divuw	a5,a5,a3
    80005894:	f8b403a3          	sb	a1,-121(s0)
    80005898:	42eb7e63          	bgeu	s6,a4,80005cd4 <__printf+0x65c>
    8000589c:	02d7f5bb          	remuw	a1,a5,a3
    800058a0:	02059593          	slli	a1,a1,0x20
    800058a4:	0205d593          	srli	a1,a1,0x20
    800058a8:	00bd85b3          	add	a1,s11,a1
    800058ac:	0005c583          	lbu	a1,0(a1)
    800058b0:	02d7d7bb          	divuw	a5,a5,a3
    800058b4:	f8b40423          	sb	a1,-120(s0)
    800058b8:	42ebfc63          	bgeu	s7,a4,80005cf0 <__printf+0x678>
    800058bc:	02079793          	slli	a5,a5,0x20
    800058c0:	0207d793          	srli	a5,a5,0x20
    800058c4:	00fd8db3          	add	s11,s11,a5
    800058c8:	000dc703          	lbu	a4,0(s11)
    800058cc:	00a00793          	li	a5,10
    800058d0:	00900c93          	li	s9,9
    800058d4:	f8e404a3          	sb	a4,-119(s0)
    800058d8:	00065c63          	bgez	a2,800058f0 <__printf+0x278>
    800058dc:	f9040713          	addi	a4,s0,-112
    800058e0:	00f70733          	add	a4,a4,a5
    800058e4:	02d00693          	li	a3,45
    800058e8:	fed70823          	sb	a3,-16(a4)
    800058ec:	00078c93          	mv	s9,a5
    800058f0:	f8040793          	addi	a5,s0,-128
    800058f4:	01978cb3          	add	s9,a5,s9
    800058f8:	f7f40d13          	addi	s10,s0,-129
    800058fc:	000cc503          	lbu	a0,0(s9)
    80005900:	fffc8c93          	addi	s9,s9,-1
    80005904:	00000097          	auipc	ra,0x0
    80005908:	b90080e7          	jalr	-1136(ra) # 80005494 <consputc>
    8000590c:	ffac98e3          	bne	s9,s10,800058fc <__printf+0x284>
    80005910:	00094503          	lbu	a0,0(s2)
    80005914:	e00514e3          	bnez	a0,8000571c <__printf+0xa4>
    80005918:	1a0c1663          	bnez	s8,80005ac4 <__printf+0x44c>
    8000591c:	08813083          	ld	ra,136(sp)
    80005920:	08013403          	ld	s0,128(sp)
    80005924:	07813483          	ld	s1,120(sp)
    80005928:	07013903          	ld	s2,112(sp)
    8000592c:	06813983          	ld	s3,104(sp)
    80005930:	06013a03          	ld	s4,96(sp)
    80005934:	05813a83          	ld	s5,88(sp)
    80005938:	05013b03          	ld	s6,80(sp)
    8000593c:	04813b83          	ld	s7,72(sp)
    80005940:	04013c03          	ld	s8,64(sp)
    80005944:	03813c83          	ld	s9,56(sp)
    80005948:	03013d03          	ld	s10,48(sp)
    8000594c:	02813d83          	ld	s11,40(sp)
    80005950:	0d010113          	addi	sp,sp,208
    80005954:	00008067          	ret
    80005958:	07300713          	li	a4,115
    8000595c:	1ce78a63          	beq	a5,a4,80005b30 <__printf+0x4b8>
    80005960:	07800713          	li	a4,120
    80005964:	1ee79e63          	bne	a5,a4,80005b60 <__printf+0x4e8>
    80005968:	f7843783          	ld	a5,-136(s0)
    8000596c:	0007a703          	lw	a4,0(a5)
    80005970:	00878793          	addi	a5,a5,8
    80005974:	f6f43c23          	sd	a5,-136(s0)
    80005978:	28074263          	bltz	a4,80005bfc <__printf+0x584>
    8000597c:	00002d97          	auipc	s11,0x2
    80005980:	cbcd8d93          	addi	s11,s11,-836 # 80007638 <digits>
    80005984:	00f77793          	andi	a5,a4,15
    80005988:	00fd87b3          	add	a5,s11,a5
    8000598c:	0007c683          	lbu	a3,0(a5)
    80005990:	00f00613          	li	a2,15
    80005994:	0007079b          	sext.w	a5,a4
    80005998:	f8d40023          	sb	a3,-128(s0)
    8000599c:	0047559b          	srliw	a1,a4,0x4
    800059a0:	0047569b          	srliw	a3,a4,0x4
    800059a4:	00000c93          	li	s9,0
    800059a8:	0ee65063          	bge	a2,a4,80005a88 <__printf+0x410>
    800059ac:	00f6f693          	andi	a3,a3,15
    800059b0:	00dd86b3          	add	a3,s11,a3
    800059b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800059b8:	0087d79b          	srliw	a5,a5,0x8
    800059bc:	00100c93          	li	s9,1
    800059c0:	f8d400a3          	sb	a3,-127(s0)
    800059c4:	0cb67263          	bgeu	a2,a1,80005a88 <__printf+0x410>
    800059c8:	00f7f693          	andi	a3,a5,15
    800059cc:	00dd86b3          	add	a3,s11,a3
    800059d0:	0006c583          	lbu	a1,0(a3)
    800059d4:	00f00613          	li	a2,15
    800059d8:	0047d69b          	srliw	a3,a5,0x4
    800059dc:	f8b40123          	sb	a1,-126(s0)
    800059e0:	0047d593          	srli	a1,a5,0x4
    800059e4:	28f67e63          	bgeu	a2,a5,80005c80 <__printf+0x608>
    800059e8:	00f6f693          	andi	a3,a3,15
    800059ec:	00dd86b3          	add	a3,s11,a3
    800059f0:	0006c503          	lbu	a0,0(a3)
    800059f4:	0087d813          	srli	a6,a5,0x8
    800059f8:	0087d69b          	srliw	a3,a5,0x8
    800059fc:	f8a401a3          	sb	a0,-125(s0)
    80005a00:	28b67663          	bgeu	a2,a1,80005c8c <__printf+0x614>
    80005a04:	00f6f693          	andi	a3,a3,15
    80005a08:	00dd86b3          	add	a3,s11,a3
    80005a0c:	0006c583          	lbu	a1,0(a3)
    80005a10:	00c7d513          	srli	a0,a5,0xc
    80005a14:	00c7d69b          	srliw	a3,a5,0xc
    80005a18:	f8b40223          	sb	a1,-124(s0)
    80005a1c:	29067a63          	bgeu	a2,a6,80005cb0 <__printf+0x638>
    80005a20:	00f6f693          	andi	a3,a3,15
    80005a24:	00dd86b3          	add	a3,s11,a3
    80005a28:	0006c583          	lbu	a1,0(a3)
    80005a2c:	0107d813          	srli	a6,a5,0x10
    80005a30:	0107d69b          	srliw	a3,a5,0x10
    80005a34:	f8b402a3          	sb	a1,-123(s0)
    80005a38:	28a67263          	bgeu	a2,a0,80005cbc <__printf+0x644>
    80005a3c:	00f6f693          	andi	a3,a3,15
    80005a40:	00dd86b3          	add	a3,s11,a3
    80005a44:	0006c683          	lbu	a3,0(a3)
    80005a48:	0147d79b          	srliw	a5,a5,0x14
    80005a4c:	f8d40323          	sb	a3,-122(s0)
    80005a50:	21067663          	bgeu	a2,a6,80005c5c <__printf+0x5e4>
    80005a54:	02079793          	slli	a5,a5,0x20
    80005a58:	0207d793          	srli	a5,a5,0x20
    80005a5c:	00fd8db3          	add	s11,s11,a5
    80005a60:	000dc683          	lbu	a3,0(s11)
    80005a64:	00800793          	li	a5,8
    80005a68:	00700c93          	li	s9,7
    80005a6c:	f8d403a3          	sb	a3,-121(s0)
    80005a70:	00075c63          	bgez	a4,80005a88 <__printf+0x410>
    80005a74:	f9040713          	addi	a4,s0,-112
    80005a78:	00f70733          	add	a4,a4,a5
    80005a7c:	02d00693          	li	a3,45
    80005a80:	fed70823          	sb	a3,-16(a4)
    80005a84:	00078c93          	mv	s9,a5
    80005a88:	f8040793          	addi	a5,s0,-128
    80005a8c:	01978cb3          	add	s9,a5,s9
    80005a90:	f7f40d13          	addi	s10,s0,-129
    80005a94:	000cc503          	lbu	a0,0(s9)
    80005a98:	fffc8c93          	addi	s9,s9,-1
    80005a9c:	00000097          	auipc	ra,0x0
    80005aa0:	9f8080e7          	jalr	-1544(ra) # 80005494 <consputc>
    80005aa4:	ff9d18e3          	bne	s10,s9,80005a94 <__printf+0x41c>
    80005aa8:	0100006f          	j	80005ab8 <__printf+0x440>
    80005aac:	00000097          	auipc	ra,0x0
    80005ab0:	9e8080e7          	jalr	-1560(ra) # 80005494 <consputc>
    80005ab4:	000c8493          	mv	s1,s9
    80005ab8:	00094503          	lbu	a0,0(s2)
    80005abc:	c60510e3          	bnez	a0,8000571c <__printf+0xa4>
    80005ac0:	e40c0ee3          	beqz	s8,8000591c <__printf+0x2a4>
    80005ac4:	00004517          	auipc	a0,0x4
    80005ac8:	58c50513          	addi	a0,a0,1420 # 8000a050 <pr>
    80005acc:	00001097          	auipc	ra,0x1
    80005ad0:	94c080e7          	jalr	-1716(ra) # 80006418 <release>
    80005ad4:	e49ff06f          	j	8000591c <__printf+0x2a4>
    80005ad8:	f7843783          	ld	a5,-136(s0)
    80005adc:	03000513          	li	a0,48
    80005ae0:	01000d13          	li	s10,16
    80005ae4:	00878713          	addi	a4,a5,8
    80005ae8:	0007bc83          	ld	s9,0(a5)
    80005aec:	f6e43c23          	sd	a4,-136(s0)
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	9a4080e7          	jalr	-1628(ra) # 80005494 <consputc>
    80005af8:	07800513          	li	a0,120
    80005afc:	00000097          	auipc	ra,0x0
    80005b00:	998080e7          	jalr	-1640(ra) # 80005494 <consputc>
    80005b04:	00002d97          	auipc	s11,0x2
    80005b08:	b34d8d93          	addi	s11,s11,-1228 # 80007638 <digits>
    80005b0c:	03ccd793          	srli	a5,s9,0x3c
    80005b10:	00fd87b3          	add	a5,s11,a5
    80005b14:	0007c503          	lbu	a0,0(a5)
    80005b18:	fffd0d1b          	addiw	s10,s10,-1
    80005b1c:	004c9c93          	slli	s9,s9,0x4
    80005b20:	00000097          	auipc	ra,0x0
    80005b24:	974080e7          	jalr	-1676(ra) # 80005494 <consputc>
    80005b28:	fe0d12e3          	bnez	s10,80005b0c <__printf+0x494>
    80005b2c:	f8dff06f          	j	80005ab8 <__printf+0x440>
    80005b30:	f7843783          	ld	a5,-136(s0)
    80005b34:	0007bc83          	ld	s9,0(a5)
    80005b38:	00878793          	addi	a5,a5,8
    80005b3c:	f6f43c23          	sd	a5,-136(s0)
    80005b40:	000c9a63          	bnez	s9,80005b54 <__printf+0x4dc>
    80005b44:	1080006f          	j	80005c4c <__printf+0x5d4>
    80005b48:	001c8c93          	addi	s9,s9,1
    80005b4c:	00000097          	auipc	ra,0x0
    80005b50:	948080e7          	jalr	-1720(ra) # 80005494 <consputc>
    80005b54:	000cc503          	lbu	a0,0(s9)
    80005b58:	fe0518e3          	bnez	a0,80005b48 <__printf+0x4d0>
    80005b5c:	f5dff06f          	j	80005ab8 <__printf+0x440>
    80005b60:	02500513          	li	a0,37
    80005b64:	00000097          	auipc	ra,0x0
    80005b68:	930080e7          	jalr	-1744(ra) # 80005494 <consputc>
    80005b6c:	000c8513          	mv	a0,s9
    80005b70:	00000097          	auipc	ra,0x0
    80005b74:	924080e7          	jalr	-1756(ra) # 80005494 <consputc>
    80005b78:	f41ff06f          	j	80005ab8 <__printf+0x440>
    80005b7c:	02500513          	li	a0,37
    80005b80:	00000097          	auipc	ra,0x0
    80005b84:	914080e7          	jalr	-1772(ra) # 80005494 <consputc>
    80005b88:	f31ff06f          	j	80005ab8 <__printf+0x440>
    80005b8c:	00030513          	mv	a0,t1
    80005b90:	00000097          	auipc	ra,0x0
    80005b94:	7bc080e7          	jalr	1980(ra) # 8000634c <acquire>
    80005b98:	b4dff06f          	j	800056e4 <__printf+0x6c>
    80005b9c:	40c0053b          	negw	a0,a2
    80005ba0:	00a00713          	li	a4,10
    80005ba4:	02e576bb          	remuw	a3,a0,a4
    80005ba8:	00002d97          	auipc	s11,0x2
    80005bac:	a90d8d93          	addi	s11,s11,-1392 # 80007638 <digits>
    80005bb0:	ff700593          	li	a1,-9
    80005bb4:	02069693          	slli	a3,a3,0x20
    80005bb8:	0206d693          	srli	a3,a3,0x20
    80005bbc:	00dd86b3          	add	a3,s11,a3
    80005bc0:	0006c683          	lbu	a3,0(a3)
    80005bc4:	02e557bb          	divuw	a5,a0,a4
    80005bc8:	f8d40023          	sb	a3,-128(s0)
    80005bcc:	10b65e63          	bge	a2,a1,80005ce8 <__printf+0x670>
    80005bd0:	06300593          	li	a1,99
    80005bd4:	02e7f6bb          	remuw	a3,a5,a4
    80005bd8:	02069693          	slli	a3,a3,0x20
    80005bdc:	0206d693          	srli	a3,a3,0x20
    80005be0:	00dd86b3          	add	a3,s11,a3
    80005be4:	0006c683          	lbu	a3,0(a3)
    80005be8:	02e7d73b          	divuw	a4,a5,a4
    80005bec:	00200793          	li	a5,2
    80005bf0:	f8d400a3          	sb	a3,-127(s0)
    80005bf4:	bca5ece3          	bltu	a1,a0,800057cc <__printf+0x154>
    80005bf8:	ce5ff06f          	j	800058dc <__printf+0x264>
    80005bfc:	40e007bb          	negw	a5,a4
    80005c00:	00002d97          	auipc	s11,0x2
    80005c04:	a38d8d93          	addi	s11,s11,-1480 # 80007638 <digits>
    80005c08:	00f7f693          	andi	a3,a5,15
    80005c0c:	00dd86b3          	add	a3,s11,a3
    80005c10:	0006c583          	lbu	a1,0(a3)
    80005c14:	ff100613          	li	a2,-15
    80005c18:	0047d69b          	srliw	a3,a5,0x4
    80005c1c:	f8b40023          	sb	a1,-128(s0)
    80005c20:	0047d59b          	srliw	a1,a5,0x4
    80005c24:	0ac75e63          	bge	a4,a2,80005ce0 <__printf+0x668>
    80005c28:	00f6f693          	andi	a3,a3,15
    80005c2c:	00dd86b3          	add	a3,s11,a3
    80005c30:	0006c603          	lbu	a2,0(a3)
    80005c34:	00f00693          	li	a3,15
    80005c38:	0087d79b          	srliw	a5,a5,0x8
    80005c3c:	f8c400a3          	sb	a2,-127(s0)
    80005c40:	d8b6e4e3          	bltu	a3,a1,800059c8 <__printf+0x350>
    80005c44:	00200793          	li	a5,2
    80005c48:	e2dff06f          	j	80005a74 <__printf+0x3fc>
    80005c4c:	00002c97          	auipc	s9,0x2
    80005c50:	9ccc8c93          	addi	s9,s9,-1588 # 80007618 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x260>
    80005c54:	02800513          	li	a0,40
    80005c58:	ef1ff06f          	j	80005b48 <__printf+0x4d0>
    80005c5c:	00700793          	li	a5,7
    80005c60:	00600c93          	li	s9,6
    80005c64:	e0dff06f          	j	80005a70 <__printf+0x3f8>
    80005c68:	00700793          	li	a5,7
    80005c6c:	00600c93          	li	s9,6
    80005c70:	c69ff06f          	j	800058d8 <__printf+0x260>
    80005c74:	00300793          	li	a5,3
    80005c78:	00200c93          	li	s9,2
    80005c7c:	c5dff06f          	j	800058d8 <__printf+0x260>
    80005c80:	00300793          	li	a5,3
    80005c84:	00200c93          	li	s9,2
    80005c88:	de9ff06f          	j	80005a70 <__printf+0x3f8>
    80005c8c:	00400793          	li	a5,4
    80005c90:	00300c93          	li	s9,3
    80005c94:	dddff06f          	j	80005a70 <__printf+0x3f8>
    80005c98:	00400793          	li	a5,4
    80005c9c:	00300c93          	li	s9,3
    80005ca0:	c39ff06f          	j	800058d8 <__printf+0x260>
    80005ca4:	00500793          	li	a5,5
    80005ca8:	00400c93          	li	s9,4
    80005cac:	c2dff06f          	j	800058d8 <__printf+0x260>
    80005cb0:	00500793          	li	a5,5
    80005cb4:	00400c93          	li	s9,4
    80005cb8:	db9ff06f          	j	80005a70 <__printf+0x3f8>
    80005cbc:	00600793          	li	a5,6
    80005cc0:	00500c93          	li	s9,5
    80005cc4:	dadff06f          	j	80005a70 <__printf+0x3f8>
    80005cc8:	00600793          	li	a5,6
    80005ccc:	00500c93          	li	s9,5
    80005cd0:	c09ff06f          	j	800058d8 <__printf+0x260>
    80005cd4:	00800793          	li	a5,8
    80005cd8:	00700c93          	li	s9,7
    80005cdc:	bfdff06f          	j	800058d8 <__printf+0x260>
    80005ce0:	00100793          	li	a5,1
    80005ce4:	d91ff06f          	j	80005a74 <__printf+0x3fc>
    80005ce8:	00100793          	li	a5,1
    80005cec:	bf1ff06f          	j	800058dc <__printf+0x264>
    80005cf0:	00900793          	li	a5,9
    80005cf4:	00800c93          	li	s9,8
    80005cf8:	be1ff06f          	j	800058d8 <__printf+0x260>
    80005cfc:	00002517          	auipc	a0,0x2
    80005d00:	92450513          	addi	a0,a0,-1756 # 80007620 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x268>
    80005d04:	00000097          	auipc	ra,0x0
    80005d08:	918080e7          	jalr	-1768(ra) # 8000561c <panic>

0000000080005d0c <printfinit>:
    80005d0c:	fe010113          	addi	sp,sp,-32
    80005d10:	00813823          	sd	s0,16(sp)
    80005d14:	00913423          	sd	s1,8(sp)
    80005d18:	00113c23          	sd	ra,24(sp)
    80005d1c:	02010413          	addi	s0,sp,32
    80005d20:	00004497          	auipc	s1,0x4
    80005d24:	33048493          	addi	s1,s1,816 # 8000a050 <pr>
    80005d28:	00048513          	mv	a0,s1
    80005d2c:	00002597          	auipc	a1,0x2
    80005d30:	90458593          	addi	a1,a1,-1788 # 80007630 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x278>
    80005d34:	00000097          	auipc	ra,0x0
    80005d38:	5f4080e7          	jalr	1524(ra) # 80006328 <initlock>
    80005d3c:	01813083          	ld	ra,24(sp)
    80005d40:	01013403          	ld	s0,16(sp)
    80005d44:	0004ac23          	sw	zero,24(s1)
    80005d48:	00813483          	ld	s1,8(sp)
    80005d4c:	02010113          	addi	sp,sp,32
    80005d50:	00008067          	ret

0000000080005d54 <uartinit>:
    80005d54:	ff010113          	addi	sp,sp,-16
    80005d58:	00813423          	sd	s0,8(sp)
    80005d5c:	01010413          	addi	s0,sp,16
    80005d60:	100007b7          	lui	a5,0x10000
    80005d64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005d68:	f8000713          	li	a4,-128
    80005d6c:	00e781a3          	sb	a4,3(a5)
    80005d70:	00300713          	li	a4,3
    80005d74:	00e78023          	sb	a4,0(a5)
    80005d78:	000780a3          	sb	zero,1(a5)
    80005d7c:	00e781a3          	sb	a4,3(a5)
    80005d80:	00700693          	li	a3,7
    80005d84:	00d78123          	sb	a3,2(a5)
    80005d88:	00e780a3          	sb	a4,1(a5)
    80005d8c:	00813403          	ld	s0,8(sp)
    80005d90:	01010113          	addi	sp,sp,16
    80005d94:	00008067          	ret

0000000080005d98 <uartputc>:
    80005d98:	00003797          	auipc	a5,0x3
    80005d9c:	0187a783          	lw	a5,24(a5) # 80008db0 <panicked>
    80005da0:	00078463          	beqz	a5,80005da8 <uartputc+0x10>
    80005da4:	0000006f          	j	80005da4 <uartputc+0xc>
    80005da8:	fd010113          	addi	sp,sp,-48
    80005dac:	02813023          	sd	s0,32(sp)
    80005db0:	00913c23          	sd	s1,24(sp)
    80005db4:	01213823          	sd	s2,16(sp)
    80005db8:	01313423          	sd	s3,8(sp)
    80005dbc:	02113423          	sd	ra,40(sp)
    80005dc0:	03010413          	addi	s0,sp,48
    80005dc4:	00003917          	auipc	s2,0x3
    80005dc8:	ff490913          	addi	s2,s2,-12 # 80008db8 <uart_tx_r>
    80005dcc:	00093783          	ld	a5,0(s2)
    80005dd0:	00003497          	auipc	s1,0x3
    80005dd4:	ff048493          	addi	s1,s1,-16 # 80008dc0 <uart_tx_w>
    80005dd8:	0004b703          	ld	a4,0(s1)
    80005ddc:	02078693          	addi	a3,a5,32
    80005de0:	00050993          	mv	s3,a0
    80005de4:	02e69c63          	bne	a3,a4,80005e1c <uartputc+0x84>
    80005de8:	00001097          	auipc	ra,0x1
    80005dec:	834080e7          	jalr	-1996(ra) # 8000661c <push_on>
    80005df0:	00093783          	ld	a5,0(s2)
    80005df4:	0004b703          	ld	a4,0(s1)
    80005df8:	02078793          	addi	a5,a5,32
    80005dfc:	00e79463          	bne	a5,a4,80005e04 <uartputc+0x6c>
    80005e00:	0000006f          	j	80005e00 <uartputc+0x68>
    80005e04:	00001097          	auipc	ra,0x1
    80005e08:	88c080e7          	jalr	-1908(ra) # 80006690 <pop_on>
    80005e0c:	00093783          	ld	a5,0(s2)
    80005e10:	0004b703          	ld	a4,0(s1)
    80005e14:	02078693          	addi	a3,a5,32
    80005e18:	fce688e3          	beq	a3,a4,80005de8 <uartputc+0x50>
    80005e1c:	01f77693          	andi	a3,a4,31
    80005e20:	00004597          	auipc	a1,0x4
    80005e24:	25058593          	addi	a1,a1,592 # 8000a070 <uart_tx_buf>
    80005e28:	00d586b3          	add	a3,a1,a3
    80005e2c:	00170713          	addi	a4,a4,1
    80005e30:	01368023          	sb	s3,0(a3)
    80005e34:	00e4b023          	sd	a4,0(s1)
    80005e38:	10000637          	lui	a2,0x10000
    80005e3c:	02f71063          	bne	a4,a5,80005e5c <uartputc+0xc4>
    80005e40:	0340006f          	j	80005e74 <uartputc+0xdc>
    80005e44:	00074703          	lbu	a4,0(a4)
    80005e48:	00f93023          	sd	a5,0(s2)
    80005e4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005e50:	00093783          	ld	a5,0(s2)
    80005e54:	0004b703          	ld	a4,0(s1)
    80005e58:	00f70e63          	beq	a4,a5,80005e74 <uartputc+0xdc>
    80005e5c:	00564683          	lbu	a3,5(a2)
    80005e60:	01f7f713          	andi	a4,a5,31
    80005e64:	00e58733          	add	a4,a1,a4
    80005e68:	0206f693          	andi	a3,a3,32
    80005e6c:	00178793          	addi	a5,a5,1
    80005e70:	fc069ae3          	bnez	a3,80005e44 <uartputc+0xac>
    80005e74:	02813083          	ld	ra,40(sp)
    80005e78:	02013403          	ld	s0,32(sp)
    80005e7c:	01813483          	ld	s1,24(sp)
    80005e80:	01013903          	ld	s2,16(sp)
    80005e84:	00813983          	ld	s3,8(sp)
    80005e88:	03010113          	addi	sp,sp,48
    80005e8c:	00008067          	ret

0000000080005e90 <uartputc_sync>:
    80005e90:	ff010113          	addi	sp,sp,-16
    80005e94:	00813423          	sd	s0,8(sp)
    80005e98:	01010413          	addi	s0,sp,16
    80005e9c:	00003717          	auipc	a4,0x3
    80005ea0:	f1472703          	lw	a4,-236(a4) # 80008db0 <panicked>
    80005ea4:	02071663          	bnez	a4,80005ed0 <uartputc_sync+0x40>
    80005ea8:	00050793          	mv	a5,a0
    80005eac:	100006b7          	lui	a3,0x10000
    80005eb0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005eb4:	02077713          	andi	a4,a4,32
    80005eb8:	fe070ce3          	beqz	a4,80005eb0 <uartputc_sync+0x20>
    80005ebc:	0ff7f793          	andi	a5,a5,255
    80005ec0:	00f68023          	sb	a5,0(a3)
    80005ec4:	00813403          	ld	s0,8(sp)
    80005ec8:	01010113          	addi	sp,sp,16
    80005ecc:	00008067          	ret
    80005ed0:	0000006f          	j	80005ed0 <uartputc_sync+0x40>

0000000080005ed4 <uartstart>:
    80005ed4:	ff010113          	addi	sp,sp,-16
    80005ed8:	00813423          	sd	s0,8(sp)
    80005edc:	01010413          	addi	s0,sp,16
    80005ee0:	00003617          	auipc	a2,0x3
    80005ee4:	ed860613          	addi	a2,a2,-296 # 80008db8 <uart_tx_r>
    80005ee8:	00003517          	auipc	a0,0x3
    80005eec:	ed850513          	addi	a0,a0,-296 # 80008dc0 <uart_tx_w>
    80005ef0:	00063783          	ld	a5,0(a2)
    80005ef4:	00053703          	ld	a4,0(a0)
    80005ef8:	04f70263          	beq	a4,a5,80005f3c <uartstart+0x68>
    80005efc:	100005b7          	lui	a1,0x10000
    80005f00:	00004817          	auipc	a6,0x4
    80005f04:	17080813          	addi	a6,a6,368 # 8000a070 <uart_tx_buf>
    80005f08:	01c0006f          	j	80005f24 <uartstart+0x50>
    80005f0c:	0006c703          	lbu	a4,0(a3)
    80005f10:	00f63023          	sd	a5,0(a2)
    80005f14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005f18:	00063783          	ld	a5,0(a2)
    80005f1c:	00053703          	ld	a4,0(a0)
    80005f20:	00f70e63          	beq	a4,a5,80005f3c <uartstart+0x68>
    80005f24:	01f7f713          	andi	a4,a5,31
    80005f28:	00e806b3          	add	a3,a6,a4
    80005f2c:	0055c703          	lbu	a4,5(a1)
    80005f30:	00178793          	addi	a5,a5,1
    80005f34:	02077713          	andi	a4,a4,32
    80005f38:	fc071ae3          	bnez	a4,80005f0c <uartstart+0x38>
    80005f3c:	00813403          	ld	s0,8(sp)
    80005f40:	01010113          	addi	sp,sp,16
    80005f44:	00008067          	ret

0000000080005f48 <uartgetc>:
    80005f48:	ff010113          	addi	sp,sp,-16
    80005f4c:	00813423          	sd	s0,8(sp)
    80005f50:	01010413          	addi	s0,sp,16
    80005f54:	10000737          	lui	a4,0x10000
    80005f58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80005f5c:	0017f793          	andi	a5,a5,1
    80005f60:	00078c63          	beqz	a5,80005f78 <uartgetc+0x30>
    80005f64:	00074503          	lbu	a0,0(a4)
    80005f68:	0ff57513          	andi	a0,a0,255
    80005f6c:	00813403          	ld	s0,8(sp)
    80005f70:	01010113          	addi	sp,sp,16
    80005f74:	00008067          	ret
    80005f78:	fff00513          	li	a0,-1
    80005f7c:	ff1ff06f          	j	80005f6c <uartgetc+0x24>

0000000080005f80 <uartintr>:
    80005f80:	100007b7          	lui	a5,0x10000
    80005f84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005f88:	0017f793          	andi	a5,a5,1
    80005f8c:	0a078463          	beqz	a5,80006034 <uartintr+0xb4>
    80005f90:	fe010113          	addi	sp,sp,-32
    80005f94:	00813823          	sd	s0,16(sp)
    80005f98:	00913423          	sd	s1,8(sp)
    80005f9c:	00113c23          	sd	ra,24(sp)
    80005fa0:	02010413          	addi	s0,sp,32
    80005fa4:	100004b7          	lui	s1,0x10000
    80005fa8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80005fac:	0ff57513          	andi	a0,a0,255
    80005fb0:	fffff097          	auipc	ra,0xfffff
    80005fb4:	534080e7          	jalr	1332(ra) # 800054e4 <consoleintr>
    80005fb8:	0054c783          	lbu	a5,5(s1)
    80005fbc:	0017f793          	andi	a5,a5,1
    80005fc0:	fe0794e3          	bnez	a5,80005fa8 <uartintr+0x28>
    80005fc4:	00003617          	auipc	a2,0x3
    80005fc8:	df460613          	addi	a2,a2,-524 # 80008db8 <uart_tx_r>
    80005fcc:	00003517          	auipc	a0,0x3
    80005fd0:	df450513          	addi	a0,a0,-524 # 80008dc0 <uart_tx_w>
    80005fd4:	00063783          	ld	a5,0(a2)
    80005fd8:	00053703          	ld	a4,0(a0)
    80005fdc:	04f70263          	beq	a4,a5,80006020 <uartintr+0xa0>
    80005fe0:	100005b7          	lui	a1,0x10000
    80005fe4:	00004817          	auipc	a6,0x4
    80005fe8:	08c80813          	addi	a6,a6,140 # 8000a070 <uart_tx_buf>
    80005fec:	01c0006f          	j	80006008 <uartintr+0x88>
    80005ff0:	0006c703          	lbu	a4,0(a3)
    80005ff4:	00f63023          	sd	a5,0(a2)
    80005ff8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005ffc:	00063783          	ld	a5,0(a2)
    80006000:	00053703          	ld	a4,0(a0)
    80006004:	00f70e63          	beq	a4,a5,80006020 <uartintr+0xa0>
    80006008:	01f7f713          	andi	a4,a5,31
    8000600c:	00e806b3          	add	a3,a6,a4
    80006010:	0055c703          	lbu	a4,5(a1)
    80006014:	00178793          	addi	a5,a5,1
    80006018:	02077713          	andi	a4,a4,32
    8000601c:	fc071ae3          	bnez	a4,80005ff0 <uartintr+0x70>
    80006020:	01813083          	ld	ra,24(sp)
    80006024:	01013403          	ld	s0,16(sp)
    80006028:	00813483          	ld	s1,8(sp)
    8000602c:	02010113          	addi	sp,sp,32
    80006030:	00008067          	ret
    80006034:	00003617          	auipc	a2,0x3
    80006038:	d8460613          	addi	a2,a2,-636 # 80008db8 <uart_tx_r>
    8000603c:	00003517          	auipc	a0,0x3
    80006040:	d8450513          	addi	a0,a0,-636 # 80008dc0 <uart_tx_w>
    80006044:	00063783          	ld	a5,0(a2)
    80006048:	00053703          	ld	a4,0(a0)
    8000604c:	04f70263          	beq	a4,a5,80006090 <uartintr+0x110>
    80006050:	100005b7          	lui	a1,0x10000
    80006054:	00004817          	auipc	a6,0x4
    80006058:	01c80813          	addi	a6,a6,28 # 8000a070 <uart_tx_buf>
    8000605c:	01c0006f          	j	80006078 <uartintr+0xf8>
    80006060:	0006c703          	lbu	a4,0(a3)
    80006064:	00f63023          	sd	a5,0(a2)
    80006068:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000606c:	00063783          	ld	a5,0(a2)
    80006070:	00053703          	ld	a4,0(a0)
    80006074:	02f70063          	beq	a4,a5,80006094 <uartintr+0x114>
    80006078:	01f7f713          	andi	a4,a5,31
    8000607c:	00e806b3          	add	a3,a6,a4
    80006080:	0055c703          	lbu	a4,5(a1)
    80006084:	00178793          	addi	a5,a5,1
    80006088:	02077713          	andi	a4,a4,32
    8000608c:	fc071ae3          	bnez	a4,80006060 <uartintr+0xe0>
    80006090:	00008067          	ret
    80006094:	00008067          	ret

0000000080006098 <kinit>:
    80006098:	fc010113          	addi	sp,sp,-64
    8000609c:	02913423          	sd	s1,40(sp)
    800060a0:	fffff7b7          	lui	a5,0xfffff
    800060a4:	00005497          	auipc	s1,0x5
    800060a8:	feb48493          	addi	s1,s1,-21 # 8000b08f <end+0xfff>
    800060ac:	02813823          	sd	s0,48(sp)
    800060b0:	01313c23          	sd	s3,24(sp)
    800060b4:	00f4f4b3          	and	s1,s1,a5
    800060b8:	02113c23          	sd	ra,56(sp)
    800060bc:	03213023          	sd	s2,32(sp)
    800060c0:	01413823          	sd	s4,16(sp)
    800060c4:	01513423          	sd	s5,8(sp)
    800060c8:	04010413          	addi	s0,sp,64
    800060cc:	000017b7          	lui	a5,0x1
    800060d0:	01100993          	li	s3,17
    800060d4:	00f487b3          	add	a5,s1,a5
    800060d8:	01b99993          	slli	s3,s3,0x1b
    800060dc:	06f9e063          	bltu	s3,a5,8000613c <kinit+0xa4>
    800060e0:	00004a97          	auipc	s5,0x4
    800060e4:	fb0a8a93          	addi	s5,s5,-80 # 8000a090 <end>
    800060e8:	0754ec63          	bltu	s1,s5,80006160 <kinit+0xc8>
    800060ec:	0734fa63          	bgeu	s1,s3,80006160 <kinit+0xc8>
    800060f0:	00088a37          	lui	s4,0x88
    800060f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800060f8:	00003917          	auipc	s2,0x3
    800060fc:	cd090913          	addi	s2,s2,-816 # 80008dc8 <kmem>
    80006100:	00ca1a13          	slli	s4,s4,0xc
    80006104:	0140006f          	j	80006118 <kinit+0x80>
    80006108:	000017b7          	lui	a5,0x1
    8000610c:	00f484b3          	add	s1,s1,a5
    80006110:	0554e863          	bltu	s1,s5,80006160 <kinit+0xc8>
    80006114:	0534f663          	bgeu	s1,s3,80006160 <kinit+0xc8>
    80006118:	00001637          	lui	a2,0x1
    8000611c:	00100593          	li	a1,1
    80006120:	00048513          	mv	a0,s1
    80006124:	00000097          	auipc	ra,0x0
    80006128:	5e4080e7          	jalr	1508(ra) # 80006708 <__memset>
    8000612c:	00093783          	ld	a5,0(s2)
    80006130:	00f4b023          	sd	a5,0(s1)
    80006134:	00993023          	sd	s1,0(s2)
    80006138:	fd4498e3          	bne	s1,s4,80006108 <kinit+0x70>
    8000613c:	03813083          	ld	ra,56(sp)
    80006140:	03013403          	ld	s0,48(sp)
    80006144:	02813483          	ld	s1,40(sp)
    80006148:	02013903          	ld	s2,32(sp)
    8000614c:	01813983          	ld	s3,24(sp)
    80006150:	01013a03          	ld	s4,16(sp)
    80006154:	00813a83          	ld	s5,8(sp)
    80006158:	04010113          	addi	sp,sp,64
    8000615c:	00008067          	ret
    80006160:	00001517          	auipc	a0,0x1
    80006164:	4f050513          	addi	a0,a0,1264 # 80007650 <digits+0x18>
    80006168:	fffff097          	auipc	ra,0xfffff
    8000616c:	4b4080e7          	jalr	1204(ra) # 8000561c <panic>

0000000080006170 <freerange>:
    80006170:	fc010113          	addi	sp,sp,-64
    80006174:	000017b7          	lui	a5,0x1
    80006178:	02913423          	sd	s1,40(sp)
    8000617c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006180:	009504b3          	add	s1,a0,s1
    80006184:	fffff537          	lui	a0,0xfffff
    80006188:	02813823          	sd	s0,48(sp)
    8000618c:	02113c23          	sd	ra,56(sp)
    80006190:	03213023          	sd	s2,32(sp)
    80006194:	01313c23          	sd	s3,24(sp)
    80006198:	01413823          	sd	s4,16(sp)
    8000619c:	01513423          	sd	s5,8(sp)
    800061a0:	01613023          	sd	s6,0(sp)
    800061a4:	04010413          	addi	s0,sp,64
    800061a8:	00a4f4b3          	and	s1,s1,a0
    800061ac:	00f487b3          	add	a5,s1,a5
    800061b0:	06f5e463          	bltu	a1,a5,80006218 <freerange+0xa8>
    800061b4:	00004a97          	auipc	s5,0x4
    800061b8:	edca8a93          	addi	s5,s5,-292 # 8000a090 <end>
    800061bc:	0954e263          	bltu	s1,s5,80006240 <freerange+0xd0>
    800061c0:	01100993          	li	s3,17
    800061c4:	01b99993          	slli	s3,s3,0x1b
    800061c8:	0734fc63          	bgeu	s1,s3,80006240 <freerange+0xd0>
    800061cc:	00058a13          	mv	s4,a1
    800061d0:	00003917          	auipc	s2,0x3
    800061d4:	bf890913          	addi	s2,s2,-1032 # 80008dc8 <kmem>
    800061d8:	00002b37          	lui	s6,0x2
    800061dc:	0140006f          	j	800061f0 <freerange+0x80>
    800061e0:	000017b7          	lui	a5,0x1
    800061e4:	00f484b3          	add	s1,s1,a5
    800061e8:	0554ec63          	bltu	s1,s5,80006240 <freerange+0xd0>
    800061ec:	0534fa63          	bgeu	s1,s3,80006240 <freerange+0xd0>
    800061f0:	00001637          	lui	a2,0x1
    800061f4:	00100593          	li	a1,1
    800061f8:	00048513          	mv	a0,s1
    800061fc:	00000097          	auipc	ra,0x0
    80006200:	50c080e7          	jalr	1292(ra) # 80006708 <__memset>
    80006204:	00093703          	ld	a4,0(s2)
    80006208:	016487b3          	add	a5,s1,s6
    8000620c:	00e4b023          	sd	a4,0(s1)
    80006210:	00993023          	sd	s1,0(s2)
    80006214:	fcfa76e3          	bgeu	s4,a5,800061e0 <freerange+0x70>
    80006218:	03813083          	ld	ra,56(sp)
    8000621c:	03013403          	ld	s0,48(sp)
    80006220:	02813483          	ld	s1,40(sp)
    80006224:	02013903          	ld	s2,32(sp)
    80006228:	01813983          	ld	s3,24(sp)
    8000622c:	01013a03          	ld	s4,16(sp)
    80006230:	00813a83          	ld	s5,8(sp)
    80006234:	00013b03          	ld	s6,0(sp)
    80006238:	04010113          	addi	sp,sp,64
    8000623c:	00008067          	ret
    80006240:	00001517          	auipc	a0,0x1
    80006244:	41050513          	addi	a0,a0,1040 # 80007650 <digits+0x18>
    80006248:	fffff097          	auipc	ra,0xfffff
    8000624c:	3d4080e7          	jalr	980(ra) # 8000561c <panic>

0000000080006250 <kfree>:
    80006250:	fe010113          	addi	sp,sp,-32
    80006254:	00813823          	sd	s0,16(sp)
    80006258:	00113c23          	sd	ra,24(sp)
    8000625c:	00913423          	sd	s1,8(sp)
    80006260:	02010413          	addi	s0,sp,32
    80006264:	03451793          	slli	a5,a0,0x34
    80006268:	04079c63          	bnez	a5,800062c0 <kfree+0x70>
    8000626c:	00004797          	auipc	a5,0x4
    80006270:	e2478793          	addi	a5,a5,-476 # 8000a090 <end>
    80006274:	00050493          	mv	s1,a0
    80006278:	04f56463          	bltu	a0,a5,800062c0 <kfree+0x70>
    8000627c:	01100793          	li	a5,17
    80006280:	01b79793          	slli	a5,a5,0x1b
    80006284:	02f57e63          	bgeu	a0,a5,800062c0 <kfree+0x70>
    80006288:	00001637          	lui	a2,0x1
    8000628c:	00100593          	li	a1,1
    80006290:	00000097          	auipc	ra,0x0
    80006294:	478080e7          	jalr	1144(ra) # 80006708 <__memset>
    80006298:	00003797          	auipc	a5,0x3
    8000629c:	b3078793          	addi	a5,a5,-1232 # 80008dc8 <kmem>
    800062a0:	0007b703          	ld	a4,0(a5)
    800062a4:	01813083          	ld	ra,24(sp)
    800062a8:	01013403          	ld	s0,16(sp)
    800062ac:	00e4b023          	sd	a4,0(s1)
    800062b0:	0097b023          	sd	s1,0(a5)
    800062b4:	00813483          	ld	s1,8(sp)
    800062b8:	02010113          	addi	sp,sp,32
    800062bc:	00008067          	ret
    800062c0:	00001517          	auipc	a0,0x1
    800062c4:	39050513          	addi	a0,a0,912 # 80007650 <digits+0x18>
    800062c8:	fffff097          	auipc	ra,0xfffff
    800062cc:	354080e7          	jalr	852(ra) # 8000561c <panic>

00000000800062d0 <kalloc>:
    800062d0:	fe010113          	addi	sp,sp,-32
    800062d4:	00813823          	sd	s0,16(sp)
    800062d8:	00913423          	sd	s1,8(sp)
    800062dc:	00113c23          	sd	ra,24(sp)
    800062e0:	02010413          	addi	s0,sp,32
    800062e4:	00003797          	auipc	a5,0x3
    800062e8:	ae478793          	addi	a5,a5,-1308 # 80008dc8 <kmem>
    800062ec:	0007b483          	ld	s1,0(a5)
    800062f0:	02048063          	beqz	s1,80006310 <kalloc+0x40>
    800062f4:	0004b703          	ld	a4,0(s1)
    800062f8:	00001637          	lui	a2,0x1
    800062fc:	00500593          	li	a1,5
    80006300:	00048513          	mv	a0,s1
    80006304:	00e7b023          	sd	a4,0(a5)
    80006308:	00000097          	auipc	ra,0x0
    8000630c:	400080e7          	jalr	1024(ra) # 80006708 <__memset>
    80006310:	01813083          	ld	ra,24(sp)
    80006314:	01013403          	ld	s0,16(sp)
    80006318:	00048513          	mv	a0,s1
    8000631c:	00813483          	ld	s1,8(sp)
    80006320:	02010113          	addi	sp,sp,32
    80006324:	00008067          	ret

0000000080006328 <initlock>:
    80006328:	ff010113          	addi	sp,sp,-16
    8000632c:	00813423          	sd	s0,8(sp)
    80006330:	01010413          	addi	s0,sp,16
    80006334:	00813403          	ld	s0,8(sp)
    80006338:	00b53423          	sd	a1,8(a0)
    8000633c:	00052023          	sw	zero,0(a0)
    80006340:	00053823          	sd	zero,16(a0)
    80006344:	01010113          	addi	sp,sp,16
    80006348:	00008067          	ret

000000008000634c <acquire>:
    8000634c:	fe010113          	addi	sp,sp,-32
    80006350:	00813823          	sd	s0,16(sp)
    80006354:	00913423          	sd	s1,8(sp)
    80006358:	00113c23          	sd	ra,24(sp)
    8000635c:	01213023          	sd	s2,0(sp)
    80006360:	02010413          	addi	s0,sp,32
    80006364:	00050493          	mv	s1,a0
    80006368:	10002973          	csrr	s2,sstatus
    8000636c:	100027f3          	csrr	a5,sstatus
    80006370:	ffd7f793          	andi	a5,a5,-3
    80006374:	10079073          	csrw	sstatus,a5
    80006378:	fffff097          	auipc	ra,0xfffff
    8000637c:	8e0080e7          	jalr	-1824(ra) # 80004c58 <mycpu>
    80006380:	07852783          	lw	a5,120(a0)
    80006384:	06078e63          	beqz	a5,80006400 <acquire+0xb4>
    80006388:	fffff097          	auipc	ra,0xfffff
    8000638c:	8d0080e7          	jalr	-1840(ra) # 80004c58 <mycpu>
    80006390:	07852783          	lw	a5,120(a0)
    80006394:	0004a703          	lw	a4,0(s1)
    80006398:	0017879b          	addiw	a5,a5,1
    8000639c:	06f52c23          	sw	a5,120(a0)
    800063a0:	04071063          	bnez	a4,800063e0 <acquire+0x94>
    800063a4:	00100713          	li	a4,1
    800063a8:	00070793          	mv	a5,a4
    800063ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800063b0:	0007879b          	sext.w	a5,a5
    800063b4:	fe079ae3          	bnez	a5,800063a8 <acquire+0x5c>
    800063b8:	0ff0000f          	fence
    800063bc:	fffff097          	auipc	ra,0xfffff
    800063c0:	89c080e7          	jalr	-1892(ra) # 80004c58 <mycpu>
    800063c4:	01813083          	ld	ra,24(sp)
    800063c8:	01013403          	ld	s0,16(sp)
    800063cc:	00a4b823          	sd	a0,16(s1)
    800063d0:	00013903          	ld	s2,0(sp)
    800063d4:	00813483          	ld	s1,8(sp)
    800063d8:	02010113          	addi	sp,sp,32
    800063dc:	00008067          	ret
    800063e0:	0104b903          	ld	s2,16(s1)
    800063e4:	fffff097          	auipc	ra,0xfffff
    800063e8:	874080e7          	jalr	-1932(ra) # 80004c58 <mycpu>
    800063ec:	faa91ce3          	bne	s2,a0,800063a4 <acquire+0x58>
    800063f0:	00001517          	auipc	a0,0x1
    800063f4:	26850513          	addi	a0,a0,616 # 80007658 <digits+0x20>
    800063f8:	fffff097          	auipc	ra,0xfffff
    800063fc:	224080e7          	jalr	548(ra) # 8000561c <panic>
    80006400:	00195913          	srli	s2,s2,0x1
    80006404:	fffff097          	auipc	ra,0xfffff
    80006408:	854080e7          	jalr	-1964(ra) # 80004c58 <mycpu>
    8000640c:	00197913          	andi	s2,s2,1
    80006410:	07252e23          	sw	s2,124(a0)
    80006414:	f75ff06f          	j	80006388 <acquire+0x3c>

0000000080006418 <release>:
    80006418:	fe010113          	addi	sp,sp,-32
    8000641c:	00813823          	sd	s0,16(sp)
    80006420:	00113c23          	sd	ra,24(sp)
    80006424:	00913423          	sd	s1,8(sp)
    80006428:	01213023          	sd	s2,0(sp)
    8000642c:	02010413          	addi	s0,sp,32
    80006430:	00052783          	lw	a5,0(a0)
    80006434:	00079a63          	bnez	a5,80006448 <release+0x30>
    80006438:	00001517          	auipc	a0,0x1
    8000643c:	22850513          	addi	a0,a0,552 # 80007660 <digits+0x28>
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	1dc080e7          	jalr	476(ra) # 8000561c <panic>
    80006448:	01053903          	ld	s2,16(a0)
    8000644c:	00050493          	mv	s1,a0
    80006450:	fffff097          	auipc	ra,0xfffff
    80006454:	808080e7          	jalr	-2040(ra) # 80004c58 <mycpu>
    80006458:	fea910e3          	bne	s2,a0,80006438 <release+0x20>
    8000645c:	0004b823          	sd	zero,16(s1)
    80006460:	0ff0000f          	fence
    80006464:	0f50000f          	fence	iorw,ow
    80006468:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000646c:	ffffe097          	auipc	ra,0xffffe
    80006470:	7ec080e7          	jalr	2028(ra) # 80004c58 <mycpu>
    80006474:	100027f3          	csrr	a5,sstatus
    80006478:	0027f793          	andi	a5,a5,2
    8000647c:	04079a63          	bnez	a5,800064d0 <release+0xb8>
    80006480:	07852783          	lw	a5,120(a0)
    80006484:	02f05e63          	blez	a5,800064c0 <release+0xa8>
    80006488:	fff7871b          	addiw	a4,a5,-1
    8000648c:	06e52c23          	sw	a4,120(a0)
    80006490:	00071c63          	bnez	a4,800064a8 <release+0x90>
    80006494:	07c52783          	lw	a5,124(a0)
    80006498:	00078863          	beqz	a5,800064a8 <release+0x90>
    8000649c:	100027f3          	csrr	a5,sstatus
    800064a0:	0027e793          	ori	a5,a5,2
    800064a4:	10079073          	csrw	sstatus,a5
    800064a8:	01813083          	ld	ra,24(sp)
    800064ac:	01013403          	ld	s0,16(sp)
    800064b0:	00813483          	ld	s1,8(sp)
    800064b4:	00013903          	ld	s2,0(sp)
    800064b8:	02010113          	addi	sp,sp,32
    800064bc:	00008067          	ret
    800064c0:	00001517          	auipc	a0,0x1
    800064c4:	1c050513          	addi	a0,a0,448 # 80007680 <digits+0x48>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	154080e7          	jalr	340(ra) # 8000561c <panic>
    800064d0:	00001517          	auipc	a0,0x1
    800064d4:	19850513          	addi	a0,a0,408 # 80007668 <digits+0x30>
    800064d8:	fffff097          	auipc	ra,0xfffff
    800064dc:	144080e7          	jalr	324(ra) # 8000561c <panic>

00000000800064e0 <holding>:
    800064e0:	00052783          	lw	a5,0(a0)
    800064e4:	00079663          	bnez	a5,800064f0 <holding+0x10>
    800064e8:	00000513          	li	a0,0
    800064ec:	00008067          	ret
    800064f0:	fe010113          	addi	sp,sp,-32
    800064f4:	00813823          	sd	s0,16(sp)
    800064f8:	00913423          	sd	s1,8(sp)
    800064fc:	00113c23          	sd	ra,24(sp)
    80006500:	02010413          	addi	s0,sp,32
    80006504:	01053483          	ld	s1,16(a0)
    80006508:	ffffe097          	auipc	ra,0xffffe
    8000650c:	750080e7          	jalr	1872(ra) # 80004c58 <mycpu>
    80006510:	01813083          	ld	ra,24(sp)
    80006514:	01013403          	ld	s0,16(sp)
    80006518:	40a48533          	sub	a0,s1,a0
    8000651c:	00153513          	seqz	a0,a0
    80006520:	00813483          	ld	s1,8(sp)
    80006524:	02010113          	addi	sp,sp,32
    80006528:	00008067          	ret

000000008000652c <push_off>:
    8000652c:	fe010113          	addi	sp,sp,-32
    80006530:	00813823          	sd	s0,16(sp)
    80006534:	00113c23          	sd	ra,24(sp)
    80006538:	00913423          	sd	s1,8(sp)
    8000653c:	02010413          	addi	s0,sp,32
    80006540:	100024f3          	csrr	s1,sstatus
    80006544:	100027f3          	csrr	a5,sstatus
    80006548:	ffd7f793          	andi	a5,a5,-3
    8000654c:	10079073          	csrw	sstatus,a5
    80006550:	ffffe097          	auipc	ra,0xffffe
    80006554:	708080e7          	jalr	1800(ra) # 80004c58 <mycpu>
    80006558:	07852783          	lw	a5,120(a0)
    8000655c:	02078663          	beqz	a5,80006588 <push_off+0x5c>
    80006560:	ffffe097          	auipc	ra,0xffffe
    80006564:	6f8080e7          	jalr	1784(ra) # 80004c58 <mycpu>
    80006568:	07852783          	lw	a5,120(a0)
    8000656c:	01813083          	ld	ra,24(sp)
    80006570:	01013403          	ld	s0,16(sp)
    80006574:	0017879b          	addiw	a5,a5,1
    80006578:	06f52c23          	sw	a5,120(a0)
    8000657c:	00813483          	ld	s1,8(sp)
    80006580:	02010113          	addi	sp,sp,32
    80006584:	00008067          	ret
    80006588:	0014d493          	srli	s1,s1,0x1
    8000658c:	ffffe097          	auipc	ra,0xffffe
    80006590:	6cc080e7          	jalr	1740(ra) # 80004c58 <mycpu>
    80006594:	0014f493          	andi	s1,s1,1
    80006598:	06952e23          	sw	s1,124(a0)
    8000659c:	fc5ff06f          	j	80006560 <push_off+0x34>

00000000800065a0 <pop_off>:
    800065a0:	ff010113          	addi	sp,sp,-16
    800065a4:	00813023          	sd	s0,0(sp)
    800065a8:	00113423          	sd	ra,8(sp)
    800065ac:	01010413          	addi	s0,sp,16
    800065b0:	ffffe097          	auipc	ra,0xffffe
    800065b4:	6a8080e7          	jalr	1704(ra) # 80004c58 <mycpu>
    800065b8:	100027f3          	csrr	a5,sstatus
    800065bc:	0027f793          	andi	a5,a5,2
    800065c0:	04079663          	bnez	a5,8000660c <pop_off+0x6c>
    800065c4:	07852783          	lw	a5,120(a0)
    800065c8:	02f05a63          	blez	a5,800065fc <pop_off+0x5c>
    800065cc:	fff7871b          	addiw	a4,a5,-1
    800065d0:	06e52c23          	sw	a4,120(a0)
    800065d4:	00071c63          	bnez	a4,800065ec <pop_off+0x4c>
    800065d8:	07c52783          	lw	a5,124(a0)
    800065dc:	00078863          	beqz	a5,800065ec <pop_off+0x4c>
    800065e0:	100027f3          	csrr	a5,sstatus
    800065e4:	0027e793          	ori	a5,a5,2
    800065e8:	10079073          	csrw	sstatus,a5
    800065ec:	00813083          	ld	ra,8(sp)
    800065f0:	00013403          	ld	s0,0(sp)
    800065f4:	01010113          	addi	sp,sp,16
    800065f8:	00008067          	ret
    800065fc:	00001517          	auipc	a0,0x1
    80006600:	08450513          	addi	a0,a0,132 # 80007680 <digits+0x48>
    80006604:	fffff097          	auipc	ra,0xfffff
    80006608:	018080e7          	jalr	24(ra) # 8000561c <panic>
    8000660c:	00001517          	auipc	a0,0x1
    80006610:	05c50513          	addi	a0,a0,92 # 80007668 <digits+0x30>
    80006614:	fffff097          	auipc	ra,0xfffff
    80006618:	008080e7          	jalr	8(ra) # 8000561c <panic>

000000008000661c <push_on>:
    8000661c:	fe010113          	addi	sp,sp,-32
    80006620:	00813823          	sd	s0,16(sp)
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	00913423          	sd	s1,8(sp)
    8000662c:	02010413          	addi	s0,sp,32
    80006630:	100024f3          	csrr	s1,sstatus
    80006634:	100027f3          	csrr	a5,sstatus
    80006638:	0027e793          	ori	a5,a5,2
    8000663c:	10079073          	csrw	sstatus,a5
    80006640:	ffffe097          	auipc	ra,0xffffe
    80006644:	618080e7          	jalr	1560(ra) # 80004c58 <mycpu>
    80006648:	07852783          	lw	a5,120(a0)
    8000664c:	02078663          	beqz	a5,80006678 <push_on+0x5c>
    80006650:	ffffe097          	auipc	ra,0xffffe
    80006654:	608080e7          	jalr	1544(ra) # 80004c58 <mycpu>
    80006658:	07852783          	lw	a5,120(a0)
    8000665c:	01813083          	ld	ra,24(sp)
    80006660:	01013403          	ld	s0,16(sp)
    80006664:	0017879b          	addiw	a5,a5,1
    80006668:	06f52c23          	sw	a5,120(a0)
    8000666c:	00813483          	ld	s1,8(sp)
    80006670:	02010113          	addi	sp,sp,32
    80006674:	00008067          	ret
    80006678:	0014d493          	srli	s1,s1,0x1
    8000667c:	ffffe097          	auipc	ra,0xffffe
    80006680:	5dc080e7          	jalr	1500(ra) # 80004c58 <mycpu>
    80006684:	0014f493          	andi	s1,s1,1
    80006688:	06952e23          	sw	s1,124(a0)
    8000668c:	fc5ff06f          	j	80006650 <push_on+0x34>

0000000080006690 <pop_on>:
    80006690:	ff010113          	addi	sp,sp,-16
    80006694:	00813023          	sd	s0,0(sp)
    80006698:	00113423          	sd	ra,8(sp)
    8000669c:	01010413          	addi	s0,sp,16
    800066a0:	ffffe097          	auipc	ra,0xffffe
    800066a4:	5b8080e7          	jalr	1464(ra) # 80004c58 <mycpu>
    800066a8:	100027f3          	csrr	a5,sstatus
    800066ac:	0027f793          	andi	a5,a5,2
    800066b0:	04078463          	beqz	a5,800066f8 <pop_on+0x68>
    800066b4:	07852783          	lw	a5,120(a0)
    800066b8:	02f05863          	blez	a5,800066e8 <pop_on+0x58>
    800066bc:	fff7879b          	addiw	a5,a5,-1
    800066c0:	06f52c23          	sw	a5,120(a0)
    800066c4:	07853783          	ld	a5,120(a0)
    800066c8:	00079863          	bnez	a5,800066d8 <pop_on+0x48>
    800066cc:	100027f3          	csrr	a5,sstatus
    800066d0:	ffd7f793          	andi	a5,a5,-3
    800066d4:	10079073          	csrw	sstatus,a5
    800066d8:	00813083          	ld	ra,8(sp)
    800066dc:	00013403          	ld	s0,0(sp)
    800066e0:	01010113          	addi	sp,sp,16
    800066e4:	00008067          	ret
    800066e8:	00001517          	auipc	a0,0x1
    800066ec:	fc050513          	addi	a0,a0,-64 # 800076a8 <digits+0x70>
    800066f0:	fffff097          	auipc	ra,0xfffff
    800066f4:	f2c080e7          	jalr	-212(ra) # 8000561c <panic>
    800066f8:	00001517          	auipc	a0,0x1
    800066fc:	f9050513          	addi	a0,a0,-112 # 80007688 <digits+0x50>
    80006700:	fffff097          	auipc	ra,0xfffff
    80006704:	f1c080e7          	jalr	-228(ra) # 8000561c <panic>

0000000080006708 <__memset>:
    80006708:	ff010113          	addi	sp,sp,-16
    8000670c:	00813423          	sd	s0,8(sp)
    80006710:	01010413          	addi	s0,sp,16
    80006714:	1a060e63          	beqz	a2,800068d0 <__memset+0x1c8>
    80006718:	40a007b3          	neg	a5,a0
    8000671c:	0077f793          	andi	a5,a5,7
    80006720:	00778693          	addi	a3,a5,7
    80006724:	00b00813          	li	a6,11
    80006728:	0ff5f593          	andi	a1,a1,255
    8000672c:	fff6071b          	addiw	a4,a2,-1
    80006730:	1b06e663          	bltu	a3,a6,800068dc <__memset+0x1d4>
    80006734:	1cd76463          	bltu	a4,a3,800068fc <__memset+0x1f4>
    80006738:	1a078e63          	beqz	a5,800068f4 <__memset+0x1ec>
    8000673c:	00b50023          	sb	a1,0(a0)
    80006740:	00100713          	li	a4,1
    80006744:	1ae78463          	beq	a5,a4,800068ec <__memset+0x1e4>
    80006748:	00b500a3          	sb	a1,1(a0)
    8000674c:	00200713          	li	a4,2
    80006750:	1ae78a63          	beq	a5,a4,80006904 <__memset+0x1fc>
    80006754:	00b50123          	sb	a1,2(a0)
    80006758:	00300713          	li	a4,3
    8000675c:	18e78463          	beq	a5,a4,800068e4 <__memset+0x1dc>
    80006760:	00b501a3          	sb	a1,3(a0)
    80006764:	00400713          	li	a4,4
    80006768:	1ae78263          	beq	a5,a4,8000690c <__memset+0x204>
    8000676c:	00b50223          	sb	a1,4(a0)
    80006770:	00500713          	li	a4,5
    80006774:	1ae78063          	beq	a5,a4,80006914 <__memset+0x20c>
    80006778:	00b502a3          	sb	a1,5(a0)
    8000677c:	00700713          	li	a4,7
    80006780:	18e79e63          	bne	a5,a4,8000691c <__memset+0x214>
    80006784:	00b50323          	sb	a1,6(a0)
    80006788:	00700e93          	li	t4,7
    8000678c:	00859713          	slli	a4,a1,0x8
    80006790:	00e5e733          	or	a4,a1,a4
    80006794:	01059e13          	slli	t3,a1,0x10
    80006798:	01c76e33          	or	t3,a4,t3
    8000679c:	01859313          	slli	t1,a1,0x18
    800067a0:	006e6333          	or	t1,t3,t1
    800067a4:	02059893          	slli	a7,a1,0x20
    800067a8:	40f60e3b          	subw	t3,a2,a5
    800067ac:	011368b3          	or	a7,t1,a7
    800067b0:	02859813          	slli	a6,a1,0x28
    800067b4:	0108e833          	or	a6,a7,a6
    800067b8:	03059693          	slli	a3,a1,0x30
    800067bc:	003e589b          	srliw	a7,t3,0x3
    800067c0:	00d866b3          	or	a3,a6,a3
    800067c4:	03859713          	slli	a4,a1,0x38
    800067c8:	00389813          	slli	a6,a7,0x3
    800067cc:	00f507b3          	add	a5,a0,a5
    800067d0:	00e6e733          	or	a4,a3,a4
    800067d4:	000e089b          	sext.w	a7,t3
    800067d8:	00f806b3          	add	a3,a6,a5
    800067dc:	00e7b023          	sd	a4,0(a5)
    800067e0:	00878793          	addi	a5,a5,8
    800067e4:	fed79ce3          	bne	a5,a3,800067dc <__memset+0xd4>
    800067e8:	ff8e7793          	andi	a5,t3,-8
    800067ec:	0007871b          	sext.w	a4,a5
    800067f0:	01d787bb          	addw	a5,a5,t4
    800067f4:	0ce88e63          	beq	a7,a4,800068d0 <__memset+0x1c8>
    800067f8:	00f50733          	add	a4,a0,a5
    800067fc:	00b70023          	sb	a1,0(a4)
    80006800:	0017871b          	addiw	a4,a5,1
    80006804:	0cc77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006808:	00e50733          	add	a4,a0,a4
    8000680c:	00b70023          	sb	a1,0(a4)
    80006810:	0027871b          	addiw	a4,a5,2
    80006814:	0ac77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006818:	00e50733          	add	a4,a0,a4
    8000681c:	00b70023          	sb	a1,0(a4)
    80006820:	0037871b          	addiw	a4,a5,3
    80006824:	0ac77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006828:	00e50733          	add	a4,a0,a4
    8000682c:	00b70023          	sb	a1,0(a4)
    80006830:	0047871b          	addiw	a4,a5,4
    80006834:	08c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006838:	00e50733          	add	a4,a0,a4
    8000683c:	00b70023          	sb	a1,0(a4)
    80006840:	0057871b          	addiw	a4,a5,5
    80006844:	08c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006848:	00e50733          	add	a4,a0,a4
    8000684c:	00b70023          	sb	a1,0(a4)
    80006850:	0067871b          	addiw	a4,a5,6
    80006854:	06c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006858:	00e50733          	add	a4,a0,a4
    8000685c:	00b70023          	sb	a1,0(a4)
    80006860:	0077871b          	addiw	a4,a5,7
    80006864:	06c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006868:	00e50733          	add	a4,a0,a4
    8000686c:	00b70023          	sb	a1,0(a4)
    80006870:	0087871b          	addiw	a4,a5,8
    80006874:	04c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006878:	00e50733          	add	a4,a0,a4
    8000687c:	00b70023          	sb	a1,0(a4)
    80006880:	0097871b          	addiw	a4,a5,9
    80006884:	04c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006888:	00e50733          	add	a4,a0,a4
    8000688c:	00b70023          	sb	a1,0(a4)
    80006890:	00a7871b          	addiw	a4,a5,10
    80006894:	02c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006898:	00e50733          	add	a4,a0,a4
    8000689c:	00b70023          	sb	a1,0(a4)
    800068a0:	00b7871b          	addiw	a4,a5,11
    800068a4:	02c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    800068a8:	00e50733          	add	a4,a0,a4
    800068ac:	00b70023          	sb	a1,0(a4)
    800068b0:	00c7871b          	addiw	a4,a5,12
    800068b4:	00c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    800068b8:	00e50733          	add	a4,a0,a4
    800068bc:	00b70023          	sb	a1,0(a4)
    800068c0:	00d7879b          	addiw	a5,a5,13
    800068c4:	00c7f663          	bgeu	a5,a2,800068d0 <__memset+0x1c8>
    800068c8:	00f507b3          	add	a5,a0,a5
    800068cc:	00b78023          	sb	a1,0(a5)
    800068d0:	00813403          	ld	s0,8(sp)
    800068d4:	01010113          	addi	sp,sp,16
    800068d8:	00008067          	ret
    800068dc:	00b00693          	li	a3,11
    800068e0:	e55ff06f          	j	80006734 <__memset+0x2c>
    800068e4:	00300e93          	li	t4,3
    800068e8:	ea5ff06f          	j	8000678c <__memset+0x84>
    800068ec:	00100e93          	li	t4,1
    800068f0:	e9dff06f          	j	8000678c <__memset+0x84>
    800068f4:	00000e93          	li	t4,0
    800068f8:	e95ff06f          	j	8000678c <__memset+0x84>
    800068fc:	00000793          	li	a5,0
    80006900:	ef9ff06f          	j	800067f8 <__memset+0xf0>
    80006904:	00200e93          	li	t4,2
    80006908:	e85ff06f          	j	8000678c <__memset+0x84>
    8000690c:	00400e93          	li	t4,4
    80006910:	e7dff06f          	j	8000678c <__memset+0x84>
    80006914:	00500e93          	li	t4,5
    80006918:	e75ff06f          	j	8000678c <__memset+0x84>
    8000691c:	00600e93          	li	t4,6
    80006920:	e6dff06f          	j	8000678c <__memset+0x84>

0000000080006924 <__memmove>:
    80006924:	ff010113          	addi	sp,sp,-16
    80006928:	00813423          	sd	s0,8(sp)
    8000692c:	01010413          	addi	s0,sp,16
    80006930:	0e060863          	beqz	a2,80006a20 <__memmove+0xfc>
    80006934:	fff6069b          	addiw	a3,a2,-1
    80006938:	0006881b          	sext.w	a6,a3
    8000693c:	0ea5e863          	bltu	a1,a0,80006a2c <__memmove+0x108>
    80006940:	00758713          	addi	a4,a1,7
    80006944:	00a5e7b3          	or	a5,a1,a0
    80006948:	40a70733          	sub	a4,a4,a0
    8000694c:	0077f793          	andi	a5,a5,7
    80006950:	00f73713          	sltiu	a4,a4,15
    80006954:	00174713          	xori	a4,a4,1
    80006958:	0017b793          	seqz	a5,a5
    8000695c:	00e7f7b3          	and	a5,a5,a4
    80006960:	10078863          	beqz	a5,80006a70 <__memmove+0x14c>
    80006964:	00900793          	li	a5,9
    80006968:	1107f463          	bgeu	a5,a6,80006a70 <__memmove+0x14c>
    8000696c:	0036581b          	srliw	a6,a2,0x3
    80006970:	fff8081b          	addiw	a6,a6,-1
    80006974:	02081813          	slli	a6,a6,0x20
    80006978:	01d85893          	srli	a7,a6,0x1d
    8000697c:	00858813          	addi	a6,a1,8
    80006980:	00058793          	mv	a5,a1
    80006984:	00050713          	mv	a4,a0
    80006988:	01088833          	add	a6,a7,a6
    8000698c:	0007b883          	ld	a7,0(a5)
    80006990:	00878793          	addi	a5,a5,8
    80006994:	00870713          	addi	a4,a4,8
    80006998:	ff173c23          	sd	a7,-8(a4)
    8000699c:	ff0798e3          	bne	a5,a6,8000698c <__memmove+0x68>
    800069a0:	ff867713          	andi	a4,a2,-8
    800069a4:	02071793          	slli	a5,a4,0x20
    800069a8:	0207d793          	srli	a5,a5,0x20
    800069ac:	00f585b3          	add	a1,a1,a5
    800069b0:	40e686bb          	subw	a3,a3,a4
    800069b4:	00f507b3          	add	a5,a0,a5
    800069b8:	06e60463          	beq	a2,a4,80006a20 <__memmove+0xfc>
    800069bc:	0005c703          	lbu	a4,0(a1)
    800069c0:	00e78023          	sb	a4,0(a5)
    800069c4:	04068e63          	beqz	a3,80006a20 <__memmove+0xfc>
    800069c8:	0015c603          	lbu	a2,1(a1)
    800069cc:	00100713          	li	a4,1
    800069d0:	00c780a3          	sb	a2,1(a5)
    800069d4:	04e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069d8:	0025c603          	lbu	a2,2(a1)
    800069dc:	00200713          	li	a4,2
    800069e0:	00c78123          	sb	a2,2(a5)
    800069e4:	02e68e63          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069e8:	0035c603          	lbu	a2,3(a1)
    800069ec:	00300713          	li	a4,3
    800069f0:	00c781a3          	sb	a2,3(a5)
    800069f4:	02e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069f8:	0045c603          	lbu	a2,4(a1)
    800069fc:	00400713          	li	a4,4
    80006a00:	00c78223          	sb	a2,4(a5)
    80006a04:	00e68e63          	beq	a3,a4,80006a20 <__memmove+0xfc>
    80006a08:	0055c603          	lbu	a2,5(a1)
    80006a0c:	00500713          	li	a4,5
    80006a10:	00c782a3          	sb	a2,5(a5)
    80006a14:	00e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    80006a18:	0065c703          	lbu	a4,6(a1)
    80006a1c:	00e78323          	sb	a4,6(a5)
    80006a20:	00813403          	ld	s0,8(sp)
    80006a24:	01010113          	addi	sp,sp,16
    80006a28:	00008067          	ret
    80006a2c:	02061713          	slli	a4,a2,0x20
    80006a30:	02075713          	srli	a4,a4,0x20
    80006a34:	00e587b3          	add	a5,a1,a4
    80006a38:	f0f574e3          	bgeu	a0,a5,80006940 <__memmove+0x1c>
    80006a3c:	02069613          	slli	a2,a3,0x20
    80006a40:	02065613          	srli	a2,a2,0x20
    80006a44:	fff64613          	not	a2,a2
    80006a48:	00e50733          	add	a4,a0,a4
    80006a4c:	00c78633          	add	a2,a5,a2
    80006a50:	fff7c683          	lbu	a3,-1(a5)
    80006a54:	fff78793          	addi	a5,a5,-1
    80006a58:	fff70713          	addi	a4,a4,-1
    80006a5c:	00d70023          	sb	a3,0(a4)
    80006a60:	fec798e3          	bne	a5,a2,80006a50 <__memmove+0x12c>
    80006a64:	00813403          	ld	s0,8(sp)
    80006a68:	01010113          	addi	sp,sp,16
    80006a6c:	00008067          	ret
    80006a70:	02069713          	slli	a4,a3,0x20
    80006a74:	02075713          	srli	a4,a4,0x20
    80006a78:	00170713          	addi	a4,a4,1
    80006a7c:	00e50733          	add	a4,a0,a4
    80006a80:	00050793          	mv	a5,a0
    80006a84:	0005c683          	lbu	a3,0(a1)
    80006a88:	00178793          	addi	a5,a5,1
    80006a8c:	00158593          	addi	a1,a1,1
    80006a90:	fed78fa3          	sb	a3,-1(a5)
    80006a94:	fee798e3          	bne	a5,a4,80006a84 <__memmove+0x160>
    80006a98:	f89ff06f          	j	80006a20 <__memmove+0xfc>
	...
