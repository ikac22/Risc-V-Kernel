
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	e3813103          	ld	sp,-456(sp) # 80005e38 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	441020ef          	jal	ra,80002c5c <start>

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
    80001080:	3a0000ef          	jal	ra,80001420 <interrupt>

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
    80001218:	00008067          	ret

000000008000121c <_Z13timer_handlerv>:
    

    //TODO: smanjivanje vremena spavanja threadova
    
    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    8000121c:	00005717          	auipc	a4,0x5
    80001220:	cb470713          	addi	a4,a4,-844 # 80005ed0 <_ZN3TCB16timeSliceCounterE>
    80001224:	00073783          	ld	a5,0(a4)
    80001228:	00178793          	addi	a5,a5,1
    8000122c:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
    80001230:	00005717          	auipc	a4,0x5
    80001234:	ca870713          	addi	a4,a4,-856 # 80005ed8 <_ZN3TCB7runningE>
    80001238:	00073703          	ld	a4,0(a4)
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    
    uint64 getTimeSlice() const { return timeSlice; }
    8000123c:	01873703          	ld	a4,24(a4)
    80001240:	00e7f863          	bgeu	a5,a4,80001250 <_Z13timer_handlerv+0x34>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001244:	00200793          	li	a5,2
    80001248:	1447b073          	csrc	sip,a5
    8000124c:	00008067          	ret
void timer_handler(){
    80001250:	fd010113          	addi	sp,sp,-48
    80001254:	02113423          	sd	ra,40(sp)
    80001258:	02813023          	sd	s0,32(sp)
    8000125c:	00913c23          	sd	s1,24(sp)
    80001260:	01213823          	sd	s2,16(sp)
    80001264:	03010413          	addi	s0,sp,48
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001268:	100027f3          	csrr	a5,sstatus
    8000126c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001270:	fd843903          	ld	s2,-40(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001274:	141027f3          	csrr	a5,sepc
    80001278:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    8000127c:	fd043483          	ld	s1,-48(s0)
        //uint64 sip = Riscv::r_sip();
        /*volatile*/ uint64 sstatus = Riscv::r_sstatus(),
        sepc = Riscv::r_sepc()/*, ra, sp*/;
        
        TCB::timeSliceCounter = 0;
    80001280:	00005797          	auipc	a5,0x5
    80001284:	c407b823          	sd	zero,-944(a5) # 80005ed0 <_ZN3TCB16timeSliceCounterE>
        
        TCB::yield();
    80001288:	00001097          	auipc	ra,0x1
    8000128c:	1d8080e7          	jalr	472(ra) # 80002460 <_ZN3TCB5yieldEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    80001290:	10091073          	csrw	sstatus,s2
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001294:	14149073          	csrw	sepc,s1
    asm volatile ("csrc sip, %0" : : "r" (mask));
    80001298:	00200793          	li	a5,2
    8000129c:	1447b073          	csrc	sip,a5
        //Riscv::w_sip(sip);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    800012a0:	02813083          	ld	ra,40(sp)
    800012a4:	02013403          	ld	s0,32(sp)
    800012a8:	01813483          	ld	s1,24(sp)
    800012ac:	01013903          	ld	s2,16(sp)
    800012b0:	03010113          	addi	sp,sp,48
    800012b4:	00008067          	ret

00000000800012b8 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    800012b8:	ff010113          	addi	sp,sp,-16
    800012bc:	00813423          	sd	s0,8(sp)
    800012c0:	01010413          	addi	s0,sp,16
    return a0;
}
    800012c4:	00813403          	ld	s0,8(sp)
    800012c8:	01010113          	addi	sp,sp,16
    800012cc:	00008067          	ret

00000000800012d0 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){    
    800012d0:	fc010113          	addi	sp,sp,-64
    800012d4:	02113c23          	sd	ra,56(sp)
    800012d8:	02813823          	sd	s0,48(sp)
    800012dc:	02913423          	sd	s1,40(sp)
    800012e0:	03213023          	sd	s2,32(sp)
    800012e4:	01313c23          	sd	s3,24(sp)
    800012e8:	01413823          	sd	s4,16(sp)
    800012ec:	04010413          	addi	s0,sp,64
    800012f0:	00050493          	mv	s1,a0
    800012f4:	00058993          	mv	s3,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800012f8:	141027f3          	csrr	a5,sepc
    800012fc:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001300:	fc843903          	ld	s2,-56(s0)
    /*volatile*/ uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001304:	00490913          	addi	s2,s2,4
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001308:	100027f3          	csrr	a5,sstatus
    8000130c:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001310:	fc043a03          	ld	s4,-64(s0)
    if(a0 == 0x1){
    80001314:	00100793          	li	a5,1
    80001318:	04f50c63          	beq	a0,a5,80001370 <_Z8sysEcallmmmmm+0xa0>
    8000131c:	00060513          	mv	a0,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        
    }else if(a0 == 0x2){
    80001320:	00200793          	li	a5,2
    80001324:	06f48263          	beq	s1,a5,80001388 <_Z8sysEcallmmmmm+0xb8>
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }else if(a0 == 0x11){
    80001328:	01100793          	li	a5,17
    8000132c:	06f48a63          	beq	s1,a5,800013a0 <_Z8sysEcallmmmmm+0xd0>
        //thread_create
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }else if(a0 == 0x12){
    80001330:	01200793          	li	a5,18
    80001334:	08f48a63          	beq	s1,a5,800013c8 <_Z8sysEcallmmmmm+0xf8>
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == 0x13){
    80001338:	01300793          	li	a5,19
    8000133c:	0af48a63          	beq	s1,a5,800013f0 <_Z8sysEcallmmmmm+0x120>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }else if(a0 == 0x69){
    80001340:	06900793          	li	a5,105
    80001344:	0cf48463          	beq	s1,a5,8000140c <_Z8sysEcallmmmmm+0x13c>
    /*volatile*/ uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001348:	00048513          	mv	a0,s1
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    8000134c:	14191073          	csrw	sepc,s2
        //delete handle
        TCB::deleteThread((TCB*)a1);
    }
    Riscv::w_sepc(sepc);
    return ret;
}
    80001350:	03813083          	ld	ra,56(sp)
    80001354:	03013403          	ld	s0,48(sp)
    80001358:	02813483          	ld	s1,40(sp)
    8000135c:	02013903          	ld	s2,32(sp)
    80001360:	01813983          	ld	s3,24(sp)
    80001364:	01013a03          	ld	s4,16(sp)
    80001368:	04010113          	addi	sp,sp,64
    8000136c:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    80001370:	00001097          	auipc	ra,0x1
    80001374:	8a8080e7          	jalr	-1880(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80001378:	00098593          	mv	a1,s3
    8000137c:	00001097          	auipc	ra,0x1
    80001380:	90c080e7          	jalr	-1780(ra) # 80001c88 <_ZN15MemoryAllocator9mem_allocEm>
    80001384:	fc9ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001388:	00001097          	auipc	ra,0x1
    8000138c:	890080e7          	jalr	-1904(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80001390:	00098593          	mv	a1,s3
    80001394:	00001097          	auipc	ra,0x1
    80001398:	a8c080e7          	jalr	-1396(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    8000139c:	fb1ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800013a0:	00070613          	mv	a2,a4
    800013a4:	00068593          	mv	a1,a3
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	f38080e7          	jalr	-200(ra) # 800022e0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800013b0:	00a9b023          	sd	a0,0(s3)
        if(!(*t)) ret = -4;
    800013b4:	00050663          	beqz	a0,800013c0 <_Z8sysEcallmmmmm+0xf0>
        else ret = 0;
    800013b8:	00000513          	li	a0,0
    800013bc:	f91ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        if(!(*t)) ret = -4;
    800013c0:	ffc00513          	li	a0,-4
    800013c4:	f89ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        TCB::running->finish();
    800013c8:	00005797          	auipc	a5,0x5
    800013cc:	b1078793          	addi	a5,a5,-1264 # 80005ed8 <_ZN3TCB7runningE>
    800013d0:	0007b783          	ld	a5,0(a5)
    void finish() { state = FINISHED; }
    800013d4:	00300713          	li	a4,3
    800013d8:	02e7a023          	sw	a4,32(a5)
        TCB::dispatch();
    800013dc:	00001097          	auipc	ra,0x1
    800013e0:	fac080e7          	jalr	-84(ra) # 80002388 <_ZN3TCB8dispatchEv>
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800013e4:	100a1073          	csrw	sstatus,s4
    /*volatile*/ uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800013e8:	00048513          	mv	a0,s1
    800013ec:	f61ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        TCB::timeSliceCounter = 0; 
    800013f0:	00005797          	auipc	a5,0x5
    800013f4:	ae07b023          	sd	zero,-1312(a5) # 80005ed0 <_ZN3TCB16timeSliceCounterE>
        TCB::yield();
    800013f8:	00001097          	auipc	ra,0x1
    800013fc:	068080e7          	jalr	104(ra) # 80002460 <_ZN3TCB5yieldEv>
    80001400:	100a1073          	csrw	sstatus,s4
    /*volatile*/ uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001404:	00048513          	mv	a0,s1
    80001408:	f45ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>
        TCB::deleteThread((TCB*)a1);
    8000140c:	00058513          	mv	a0,a1
    80001410:	00001097          	auipc	ra,0x1
    80001414:	088080e7          	jalr	136(ra) # 80002498 <_ZN3TCB12deleteThreadEPS_>
    /*volatile*/ uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    80001418:	00048513          	mv	a0,s1
    8000141c:	f31ff06f          	j	8000134c <_Z8sysEcallmmmmm+0x7c>

0000000080001420 <interrupt>:

extern "C" volatile void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    80001420:	fe010113          	addi	sp,sp,-32
    80001424:	00113c23          	sd	ra,24(sp)
    80001428:	00813823          	sd	s0,16(sp)
    8000142c:	02010413          	addi	s0,sp,32
    asm volatile("csrr %0, scause" : "=r" (scause));
    80001430:	142027f3          	csrr	a5,scause
    80001434:	fef43423          	sd	a5,-24(s0)
    return scause;
    80001438:	fe843783          	ld	a5,-24(s0)
    /*uint64 a0_s = a0, a1_s = a1, 
        a2_s = a2, a3_s = a3, 
        a4_s = a4;*/  
    uint64 scause = Riscv::r_scause();
    static int t = 0;
    if(scause == 9){
    8000143c:	00900813          	li	a6,9
    80001440:	07078e63          	beq	a5,a6,800014bc <interrupt+0x9c>
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } else if(scause == 8){
    80001444:	00800813          	li	a6,8
    80001448:	09078263          	beq	a5,a6,800014cc <interrupt+0xac>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } else if(scause == 0x8000000000000009){
    8000144c:	fff00713          	li	a4,-1
    80001450:	03f71713          	slli	a4,a4,0x3f
    80001454:	00970713          	addi	a4,a4,9
    80001458:	08e78863          	beq	a5,a4,800014e8 <interrupt+0xc8>
        //hardverski prekid
       console_handler();
    
    } else if(scause == 0x8000000000000001){
    8000145c:	fff00713          	li	a4,-1
    80001460:	03f71713          	slli	a4,a4,0x3f
    80001464:	00170713          	addi	a4,a4,1
    80001468:	08e78663          	beq	a5,a4,800014f4 <interrupt+0xd4>
        //prekid od timera
        timer_handler();      
    
    }else if(scause == 2){
    8000146c:	00200713          	li	a4,2
    80001470:	08e78863          	beq	a5,a4,80001500 <interrupt+0xe0>
        if(t<5){
            print(scause);
            t++;
        }
    }else if(scause == 1){
    80001474:	00100713          	li	a4,1
    80001478:	0ce78463          	beq	a5,a4,80001540 <interrupt+0x120>
        if(t<10){
            print(scause);
            t++;
        }
    }else{
        if(t<15){
    8000147c:	00005717          	auipc	a4,0x5
    80001480:	a4470713          	addi	a4,a4,-1468 # 80005ec0 <_ZZ9interruptE1t>
    80001484:	00072683          	lw	a3,0(a4)
    80001488:	00e00713          	li	a4,14
    8000148c:	04d74663          	blt	a4,a3,800014d8 <interrupt+0xb8>
            print(scause);
    80001490:	00100613          	li	a2,1
    80001494:	00a00593          	li	a1,10
    80001498:	00078513          	mv	a0,a5
    8000149c:	00001097          	auipc	ra,0x1
    800014a0:	0ac080e7          	jalr	172(ra) # 80002548 <_Z5printmcb>
            t++;
    800014a4:	00005717          	auipc	a4,0x5
    800014a8:	a1c70713          	addi	a4,a4,-1508 # 80005ec0 <_ZZ9interruptE1t>
    800014ac:	00072783          	lw	a5,0(a4)
    800014b0:	0017879b          	addiw	a5,a5,1
    800014b4:	00f72023          	sw	a5,0(a4)
        }
    }
    //print(a4);
    800014b8:	0200006f          	j	800014d8 <interrupt+0xb8>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    800014bc:	00000097          	auipc	ra,0x0
    800014c0:	e14080e7          	jalr	-492(ra) # 800012d0 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800014c4:	04a43823          	sd	a0,80(s0)
    800014c8:	0100006f          	j	800014d8 <interrupt+0xb8>
        a0 = usrEcall(a0, a1, a2, a3, a4);
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	dec080e7          	jalr	-532(ra) # 800012b8 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800014d4:	04a43823          	sd	a0,80(s0)
    800014d8:	01813083          	ld	ra,24(sp)
    800014dc:	01013403          	ld	s0,16(sp)
    800014e0:	02010113          	addi	sp,sp,32
    800014e4:	00008067          	ret
       console_handler();
    800014e8:	00004097          	auipc	ra,0x4
    800014ec:	8a8080e7          	jalr	-1880(ra) # 80004d90 <console_handler>
    800014f0:	fe9ff06f          	j	800014d8 <interrupt+0xb8>
        timer_handler();      
    800014f4:	00000097          	auipc	ra,0x0
    800014f8:	d28080e7          	jalr	-728(ra) # 8000121c <_Z13timer_handlerv>
    800014fc:	fddff06f          	j	800014d8 <interrupt+0xb8>
        if(t<5){
    80001500:	00005717          	auipc	a4,0x5
    80001504:	9c070713          	addi	a4,a4,-1600 # 80005ec0 <_ZZ9interruptE1t>
    80001508:	00072683          	lw	a3,0(a4)
    8000150c:	00400713          	li	a4,4
    80001510:	fcd744e3          	blt	a4,a3,800014d8 <interrupt+0xb8>
            print(scause);
    80001514:	00100613          	li	a2,1
    80001518:	00a00593          	li	a1,10
    8000151c:	00078513          	mv	a0,a5
    80001520:	00001097          	auipc	ra,0x1
    80001524:	028080e7          	jalr	40(ra) # 80002548 <_Z5printmcb>
            t++;
    80001528:	00005717          	auipc	a4,0x5
    8000152c:	99870713          	addi	a4,a4,-1640 # 80005ec0 <_ZZ9interruptE1t>
    80001530:	00072783          	lw	a5,0(a4)
    80001534:	0017879b          	addiw	a5,a5,1
    80001538:	00f72023          	sw	a5,0(a4)
    8000153c:	f9dff06f          	j	800014d8 <interrupt+0xb8>
        if(t<10){
    80001540:	00005717          	auipc	a4,0x5
    80001544:	98070713          	addi	a4,a4,-1664 # 80005ec0 <_ZZ9interruptE1t>
    80001548:	00072683          	lw	a3,0(a4)
    8000154c:	00900713          	li	a4,9
    80001550:	f8d744e3          	blt	a4,a3,800014d8 <interrupt+0xb8>
            print(scause);
    80001554:	00100613          	li	a2,1
    80001558:	00a00593          	li	a1,10
    8000155c:	00078513          	mv	a0,a5
    80001560:	00001097          	auipc	ra,0x1
    80001564:	fe8080e7          	jalr	-24(ra) # 80002548 <_Z5printmcb>
            t++;
    80001568:	00005717          	auipc	a4,0x5
    8000156c:	95870713          	addi	a4,a4,-1704 # 80005ec0 <_ZZ9interruptE1t>
    80001570:	00072783          	lw	a5,0(a4)
    80001574:	0017879b          	addiw	a5,a5,1
    80001578:	00f72023          	sw	a5,0(a4)
    8000157c:	f5dff06f          	j	800014d8 <interrupt+0xb8>

0000000080001580 <_Z11workerBodyAPv>:

void userMain(){

}

void workerBodyA(void*) {
    80001580:	fe010113          	addi	sp,sp,-32
    80001584:	00113c23          	sd	ra,24(sp)
    80001588:	00813823          	sd	s0,16(sp)
    8000158c:	00913423          	sd	s1,8(sp)
    80001590:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001594:	00000493          	li	s1,0
    80001598:	0300006f          	j	800015c8 <_Z11workerBodyAPv+0x48>
        print("A: i=", i, 0);
        for (uint64 j = 0; j < 10000; j++) {
    8000159c:	00168693          	addi	a3,a3,1
    800015a0:	000027b7          	lui	a5,0x2
    800015a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800015a8:	00d7ee63          	bltu	a5,a3,800015c4 <_Z11workerBodyAPv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800015ac:	00000713          	li	a4,0
    800015b0:	000077b7          	lui	a5,0x7
    800015b4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800015b8:	fee7e2e3          	bltu	a5,a4,8000159c <_Z11workerBodyAPv+0x1c>
    800015bc:	00170713          	addi	a4,a4,1
    800015c0:	ff1ff06f          	j	800015b0 <_Z11workerBodyAPv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    800015c4:	00148493          	addi	s1,s1,1
    800015c8:	00900793          	li	a5,9
    800015cc:	0297e263          	bltu	a5,s1,800015f0 <_Z11workerBodyAPv+0x70>
        print("A: i=", i, 0);
    800015d0:	00000613          	li	a2,0
    800015d4:	00048593          	mv	a1,s1
    800015d8:	00004517          	auipc	a0,0x4
    800015dc:	a4850513          	addi	a0,a0,-1464 # 80005020 <CONSOLE_STATUS+0x10>
    800015e0:	00001097          	auipc	ra,0x1
    800015e4:	140080e7          	jalr	320(ra) # 80002720 <_Z5printPKcmb>
        for (uint64 j = 0; j < 10000; j++) {
    800015e8:	00000693          	li	a3,0
    800015ec:	fb5ff06f          	j	800015a0 <_Z11workerBodyAPv+0x20>
            // TCB::yield();
        }
    }
}
    800015f0:	01813083          	ld	ra,24(sp)
    800015f4:	01013403          	ld	s0,16(sp)
    800015f8:	00813483          	ld	s1,8(sp)
    800015fc:	02010113          	addi	sp,sp,32
    80001600:	00008067          	ret

0000000080001604 <_Z11workerBodyBPv>:

void workerBodyB(void*) {
    80001604:	fe010113          	addi	sp,sp,-32
    80001608:	00113c23          	sd	ra,24(sp)
    8000160c:	00813823          	sd	s0,16(sp)
    80001610:	00913423          	sd	s1,8(sp)
    80001614:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001618:	00000493          	li	s1,0
    8000161c:	03c0006f          	j	80001658 <_Z11workerBodyBPv+0x54>
        print("B: i=", i, 0);
        if(i == 7) thread_exit();
    80001620:	00001097          	auipc	ra,0x1
    80001624:	5cc080e7          	jalr	1484(ra) # 80002bec <thread_exit>
    80001628:	0580006f          	j	80001680 <_Z11workerBodyBPv+0x7c>
        for (uint64 j = 0; j < 10000; j++) {
    8000162c:	00168693          	addi	a3,a3,1
    80001630:	000027b7          	lui	a5,0x2
    80001634:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001638:	00d7ee63          	bltu	a5,a3,80001654 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000163c:	00000713          	li	a4,0
    80001640:	000077b7          	lui	a5,0x7
    80001644:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001648:	fee7e2e3          	bltu	a5,a4,8000162c <_Z11workerBodyBPv+0x28>
    8000164c:	00170713          	addi	a4,a4,1
    80001650:	ff1ff06f          	j	80001640 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001654:	00148493          	addi	s1,s1,1
    80001658:	00f00793          	li	a5,15
    8000165c:	0297e663          	bltu	a5,s1,80001688 <_Z11workerBodyBPv+0x84>
        print("B: i=", i, 0);
    80001660:	00000613          	li	a2,0
    80001664:	00048593          	mv	a1,s1
    80001668:	00004517          	auipc	a0,0x4
    8000166c:	9c050513          	addi	a0,a0,-1600 # 80005028 <CONSOLE_STATUS+0x18>
    80001670:	00001097          	auipc	ra,0x1
    80001674:	0b0080e7          	jalr	176(ra) # 80002720 <_Z5printPKcmb>
        if(i == 7) thread_exit();
    80001678:	00700793          	li	a5,7
    8000167c:	faf482e3          	beq	s1,a5,80001620 <_Z11workerBodyBPv+0x1c>
        for (uint64 j = 0; j < 10000; j++) {
    80001680:	00000693          	li	a3,0
    80001684:	fadff06f          	j	80001630 <_Z11workerBodyBPv+0x2c>
            // TCB::yield();
        }
    }
}
    80001688:	01813083          	ld	ra,24(sp)
    8000168c:	01013403          	ld	s0,16(sp)
    80001690:	00813483          	ld	s1,8(sp)
    80001694:	02010113          	addi	sp,sp,32
    80001698:	00008067          	ret

000000008000169c <_Z8userMainv>:
void userMain(){
    8000169c:	ff010113          	addi	sp,sp,-16
    800016a0:	00813423          	sd	s0,8(sp)
    800016a4:	01010413          	addi	s0,sp,16
}
    800016a8:	00813403          	ld	s0,8(sp)
    800016ac:	01010113          	addi	sp,sp,16
    800016b0:	00008067          	ret

00000000800016b4 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    if (n == 0 || n == 1) { return n; }
    800016b4:	00100793          	li	a5,1
    800016b8:	06a7f863          	bgeu	a5,a0,80001728 <_Z9fibonaccim+0x74>
uint64 fibonacci(uint64 n) {
    800016bc:	fe010113          	addi	sp,sp,-32
    800016c0:	00113c23          	sd	ra,24(sp)
    800016c4:	00813823          	sd	s0,16(sp)
    800016c8:	00913423          	sd	s1,8(sp)
    800016cc:	01213023          	sd	s2,0(sp)
    800016d0:	02010413          	addi	s0,sp,32
    800016d4:	00050493          	mv	s1,a0
    if (n % 10 == 0) { thread_dispatch(); }
    800016d8:	00a00793          	li	a5,10
    800016dc:	02f577b3          	remu	a5,a0,a5
    800016e0:	02078e63          	beqz	a5,8000171c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800016e4:	fff48513          	addi	a0,s1,-1
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	fcc080e7          	jalr	-52(ra) # 800016b4 <_Z9fibonaccim>
    800016f0:	00050913          	mv	s2,a0
    800016f4:	ffe48513          	addi	a0,s1,-2
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	fbc080e7          	jalr	-68(ra) # 800016b4 <_Z9fibonaccim>
    80001700:	00a90533          	add	a0,s2,a0
}
    80001704:	01813083          	ld	ra,24(sp)
    80001708:	01013403          	ld	s0,16(sp)
    8000170c:	00813483          	ld	s1,8(sp)
    80001710:	00013903          	ld	s2,0(sp)
    80001714:	02010113          	addi	sp,sp,32
    80001718:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000171c:	00001097          	auipc	ra,0x1
    80001720:	418080e7          	jalr	1048(ra) # 80002b34 <thread_dispatch>
    80001724:	fc1ff06f          	j	800016e4 <_Z9fibonaccim+0x30>
}
    80001728:	00008067          	ret

000000008000172c <_Z11workerBodyCPv>:

void workerBodyC(void*) {
    8000172c:	fe010113          	addi	sp,sp,-32
    80001730:	00113c23          	sd	ra,24(sp)
    80001734:	00813823          	sd	s0,16(sp)
    80001738:	00913423          	sd	s1,8(sp)
    8000173c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001740:	00000493          	li	s1,0
    for (; i < 3; i++) {
    80001744:	00200793          	li	a5,2
    80001748:	0297e463          	bltu	a5,s1,80001770 <_Z11workerBodyCPv+0x44>
        print("C: i=", i, 0);
    8000174c:	00000613          	li	a2,0
    80001750:	00048593          	mv	a1,s1
    80001754:	00004517          	auipc	a0,0x4
    80001758:	8dc50513          	addi	a0,a0,-1828 # 80005030 <CONSOLE_STATUS+0x20>
    8000175c:	00001097          	auipc	ra,0x1
    80001760:	fc4080e7          	jalr	-60(ra) # 80002720 <_Z5printPKcmb>
    for (; i < 3; i++) {
    80001764:	0014849b          	addiw	s1,s1,1
    80001768:	0ff4f493          	andi	s1,s1,255
    8000176c:	fd9ff06f          	j	80001744 <_Z11workerBodyCPv+0x18>
    }

    print("C: yield");
    80001770:	00a00593          	li	a1,10
    80001774:	00004517          	auipc	a0,0x4
    80001778:	8c450513          	addi	a0,a0,-1852 # 80005038 <CONSOLE_STATUS+0x28>
    8000177c:	00001097          	auipc	ra,0x1
    80001780:	f0c080e7          	jalr	-244(ra) # 80002688 <_Z5printPKcc>
    __asm__ ("li t1, 7");
    80001784:	00700313          	li	t1,7
    thread_dispatch();
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	3ac080e7          	jalr	940(ra) # 80002b34 <thread_dispatch>

    uint64 t1 = 0;
    asm ("mv %0, t1" : "=r" (t1));
    80001790:	00030593          	mv	a1,t1

    print("C: t1=", t1, 0);
    80001794:	00000613          	li	a2,0
    80001798:	00004517          	auipc	a0,0x4
    8000179c:	8b050513          	addi	a0,a0,-1872 # 80005048 <CONSOLE_STATUS+0x38>
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	f80080e7          	jalr	-128(ra) # 80002720 <_Z5printPKcmb>

    uint64 result = fibonacci(12);
    800017a8:	00c00513          	li	a0,12
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	f08080e7          	jalr	-248(ra) # 800016b4 <_Z9fibonaccim>
    print("C: fibonaci=", result, 0);
    800017b4:	00000613          	li	a2,0
    800017b8:	00050593          	mv	a1,a0
    800017bc:	00004517          	auipc	a0,0x4
    800017c0:	89450513          	addi	a0,a0,-1900 # 80005050 <CONSOLE_STATUS+0x40>
    800017c4:	00001097          	auipc	ra,0x1
    800017c8:	f5c080e7          	jalr	-164(ra) # 80002720 <_Z5printPKcmb>

    for (; i < 6; i++) {
    800017cc:	00500793          	li	a5,5
    800017d0:	0297e463          	bltu	a5,s1,800017f8 <_Z11workerBodyCPv+0xcc>
        print("C: i=", i, 0);
    800017d4:	00000613          	li	a2,0
    800017d8:	00048593          	mv	a1,s1
    800017dc:	00004517          	auipc	a0,0x4
    800017e0:	85450513          	addi	a0,a0,-1964 # 80005030 <CONSOLE_STATUS+0x20>
    800017e4:	00001097          	auipc	ra,0x1
    800017e8:	f3c080e7          	jalr	-196(ra) # 80002720 <_Z5printPKcmb>
    for (; i < 6; i++) {
    800017ec:	0014849b          	addiw	s1,s1,1
    800017f0:	0ff4f493          	andi	s1,s1,255
    800017f4:	fd9ff06f          	j	800017cc <_Z11workerBodyCPv+0xa0>
    }
//    TCB::yield();
}
    800017f8:	01813083          	ld	ra,24(sp)
    800017fc:	01013403          	ld	s0,16(sp)
    80001800:	00813483          	ld	s1,8(sp)
    80001804:	02010113          	addi	sp,sp,32
    80001808:	00008067          	ret

000000008000180c <_Z11workerBodyDPv>:

void workerBodyD(void*) {
    8000180c:	fe010113          	addi	sp,sp,-32
    80001810:	00113c23          	sd	ra,24(sp)
    80001814:	00813823          	sd	s0,16(sp)
    80001818:	00913423          	sd	s1,8(sp)
    8000181c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001820:	00a00493          	li	s1,10
    for (; i < 13; i++) {
    80001824:	00c00793          	li	a5,12
    80001828:	0297e463          	bltu	a5,s1,80001850 <_Z11workerBodyDPv+0x44>
        print("D: i=", i, 0);
    8000182c:	00000613          	li	a2,0
    80001830:	00048593          	mv	a1,s1
    80001834:	00004517          	auipc	a0,0x4
    80001838:	82c50513          	addi	a0,a0,-2004 # 80005060 <CONSOLE_STATUS+0x50>
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	ee4080e7          	jalr	-284(ra) # 80002720 <_Z5printPKcmb>
    for (; i < 13; i++) {
    80001844:	0014849b          	addiw	s1,s1,1
    80001848:	0ff4f493          	andi	s1,s1,255
    8000184c:	fd9ff06f          	j	80001824 <_Z11workerBodyDPv+0x18>
    }

    print("D: yield");
    80001850:	00a00593          	li	a1,10
    80001854:	00004517          	auipc	a0,0x4
    80001858:	81450513          	addi	a0,a0,-2028 # 80005068 <CONSOLE_STATUS+0x58>
    8000185c:	00001097          	auipc	ra,0x1
    80001860:	e2c080e7          	jalr	-468(ra) # 80002688 <_Z5printPKcc>
    __asm__ ("li t1, 5");
    80001864:	00500313          	li	t1,5
    TCB::yield();
    80001868:	00001097          	auipc	ra,0x1
    8000186c:	bf8080e7          	jalr	-1032(ra) # 80002460 <_ZN3TCB5yieldEv>

    uint64 result = fibonacci(16);
    80001870:	01000513          	li	a0,16
    80001874:	00000097          	auipc	ra,0x0
    80001878:	e40080e7          	jalr	-448(ra) # 800016b4 <_Z9fibonaccim>
    print("D: fibonaci=", result, 0);
    8000187c:	00000613          	li	a2,0
    80001880:	00050593          	mv	a1,a0
    80001884:	00003517          	auipc	a0,0x3
    80001888:	7f450513          	addi	a0,a0,2036 # 80005078 <CONSOLE_STATUS+0x68>
    8000188c:	00001097          	auipc	ra,0x1
    80001890:	e94080e7          	jalr	-364(ra) # 80002720 <_Z5printPKcmb>

    for (; i < 16; i++) {
    80001894:	00f00793          	li	a5,15
    80001898:	0297e463          	bltu	a5,s1,800018c0 <_Z11workerBodyDPv+0xb4>
        print("D: i=", i, 0);
    8000189c:	00000613          	li	a2,0
    800018a0:	00048593          	mv	a1,s1
    800018a4:	00003517          	auipc	a0,0x3
    800018a8:	7bc50513          	addi	a0,a0,1980 # 80005060 <CONSOLE_STATUS+0x50>
    800018ac:	00001097          	auipc	ra,0x1
    800018b0:	e74080e7          	jalr	-396(ra) # 80002720 <_Z5printPKcmb>
    for (; i < 16; i++) {
    800018b4:	0014849b          	addiw	s1,s1,1
    800018b8:	0ff4f493          	andi	s1,s1,255
    800018bc:	fd9ff06f          	j	80001894 <_Z11workerBodyDPv+0x88>
    }
//    TCB::yield();
}
    800018c0:	01813083          	ld	ra,24(sp)
    800018c4:	01013403          	ld	s0,16(sp)
    800018c8:	00813483          	ld	s1,8(sp)
    800018cc:	02010113          	addi	sp,sp,32
    800018d0:	00008067          	ret

00000000800018d4 <_Z11mainWrapperPv>:

void mainWrapper(void*){
    800018d4:	ff010113          	addi	sp,sp,-16
    800018d8:	00813423          	sd	s0,8(sp)
    800018dc:	01010413          	addi	s0,sp,16
    userMain();
}
    800018e0:	00813403          	ld	s0,8(sp)
    800018e4:	01010113          	addi	sp,sp,16
    800018e8:	00008067          	ret

00000000800018ec <main>:

int main(){
    800018ec:	fc010113          	addi	sp,sp,-64
    800018f0:	02113c23          	sd	ra,56(sp)
    800018f4:	02813823          	sd	s0,48(sp)
    800018f8:	04010413          	addi	s0,sp,64
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(PtrQueue): ", sizeof(PtrQueue<TCB>), 0);
    800018fc:	00000613          	li	a2,0
    80001900:	01000593          	li	a1,16
    80001904:	00003517          	auipc	a0,0x3
    80001908:	78450513          	addi	a0,a0,1924 # 80005088 <CONSOLE_STATUS+0x78>
    8000190c:	00001097          	auipc	ra,0x1
    80001910:	e14080e7          	jalr	-492(ra) # 80002720 <_Z5printPKcmb>
    print("sizeof(TCB): ", sizeof(TCB), 0);
    80001914:	00000613          	li	a2,0
    80001918:	03800593          	li	a1,56
    8000191c:	00003517          	auipc	a0,0x3
    80001920:	78450513          	addi	a0,a0,1924 # 800050a0 <CONSOLE_STATUS+0x90>
    80001924:	00001097          	auipc	ra,0x1
    80001928:	dfc080e7          	jalr	-516(ra) # 80002720 <_Z5printPKcmb>
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    8000192c:	00000613          	li	a2,0
    80001930:	04000593          	li	a1,64
    80001934:	00003517          	auipc	a0,0x3
    80001938:	77c50513          	addi	a0,a0,1916 # 800050b0 <CONSOLE_STATUS+0xa0>
    8000193c:	00001097          	auipc	ra,0x1
    80001940:	de4080e7          	jalr	-540(ra) # 80002720 <_Z5printPKcmb>
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    80001944:	00000613          	li	a2,0
    80001948:	00200593          	li	a1,2
    8000194c:	00003517          	auipc	a0,0x3
    80001950:	78450513          	addi	a0,a0,1924 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001954:	00001097          	auipc	ra,0x1
    80001958:	dcc080e7          	jalr	-564(ra) # 80002720 <_Z5printPKcmb>
    print("-------------------------------\n\n");
    8000195c:	00a00593          	li	a1,10
    80001960:	00003517          	auipc	a0,0x3
    80001964:	78850513          	addi	a0,a0,1928 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001968:	00001097          	auipc	ra,0x1
    8000196c:	d20080e7          	jalr	-736(ra) # 80002688 <_Z5printPKcc>
    
    print("kernelInit\n-------------------------------");
    80001970:	00a00593          	li	a1,10
    80001974:	00003517          	auipc	a0,0x3
    80001978:	79c50513          	addi	a0,a0,1948 # 80005110 <CONSOLE_STATUS+0x100>
    8000197c:	00001097          	auipc	ra,0x1
    80001980:	d0c080e7          	jalr	-756(ra) # 80002688 <_Z5printPKcc>
    Scheduler::initalize();
    80001984:	00000097          	auipc	ra,0x0
    80001988:	62c080e7          	jalr	1580(ra) # 80001fb0 <_ZN9Scheduler9initalizeEv>
    print("Scheduler initalized");
    8000198c:	00a00593          	li	a1,10
    80001990:	00003517          	auipc	a0,0x3
    80001994:	7b050513          	addi	a0,a0,1968 # 80005140 <CONSOLE_STATUS+0x130>
    80001998:	00001097          	auipc	ra,0x1
    8000199c:	cf0080e7          	jalr	-784(ra) # 80002688 <_Z5printPKcc>
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	278080e7          	jalr	632(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    bool invalidFreeAddress(void* adr);
    MemoryAllocator(const MemoryAllocator&) = delete;
    bool operator==(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    
    bool initalized(){ return init;}
    800019a8:	00054783          	lbu	a5,0(a0)
    if(allocator.initalized()) print("Allocator initalized");
    800019ac:	04078e63          	beqz	a5,80001a08 <main+0x11c>
    800019b0:	00a00593          	li	a1,10
    800019b4:	00003517          	auipc	a0,0x3
    800019b8:	7a450513          	addi	a0,a0,1956 # 80005158 <CONSOLE_STATUS+0x148>
    800019bc:	00001097          	auipc	ra,0x1
    800019c0:	ccc080e7          	jalr	-820(ra) # 80002688 <_Z5printPKcc>
    else { 
        print("ERROR: allocator not initalized");
        return 0;
    }
    Riscv::w_stvec((uint64)interruptvec);
    800019c4:	fffff797          	auipc	a5,0xfffff
    800019c8:	63c78793          	addi	a5,a5,1596 # 80001000 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    800019cc:	10579073          	csrw	stvec,a5
    print("stvec initalized");
    800019d0:	00a00593          	li	a1,10
    800019d4:	00003517          	auipc	a0,0x3
    800019d8:	79c50513          	addi	a0,a0,1948 # 80005170 <CONSOLE_STATUS+0x160>
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	cac080e7          	jalr	-852(ra) # 80002688 <_Z5printPKcc>

    TCB* kernelThread;
    thread_t threads[5];
    for(int i = 0; i < 5; i++)
    800019e4:	00000793          	li	a5,0
    800019e8:	00400713          	li	a4,4
    800019ec:	02f74a63          	blt	a4,a5,80001a20 <main+0x134>
        threads[i] = nullptr;
    800019f0:	00379713          	slli	a4,a5,0x3
    800019f4:	ff040693          	addi	a3,s0,-16
    800019f8:	00e68733          	add	a4,a3,a4
    800019fc:	fc073c23          	sd	zero,-40(a4)
    for(int i = 0; i < 5; i++)
    80001a00:	0017879b          	addiw	a5,a5,1
    80001a04:	fe5ff06f          	j	800019e8 <main+0xfc>
        print("ERROR: allocator not initalized");
    80001a08:	00a00593          	li	a1,10
    80001a0c:	00003517          	auipc	a0,0x3
    80001a10:	77c50513          	addi	a0,a0,1916 # 80005188 <CONSOLE_STATUS+0x178>
    80001a14:	00001097          	auipc	ra,0x1
    80001a18:	c74080e7          	jalr	-908(ra) # 80002688 <_Z5printPKcc>
        return 0;
    80001a1c:	1e80006f          	j	80001c04 <main+0x318>

    print("Thread making...");
    80001a20:	00a00593          	li	a1,10
    80001a24:	00003517          	auipc	a0,0x3
    80001a28:	78450513          	addi	a0,a0,1924 # 800051a8 <CONSOLE_STATUS+0x198>
    80001a2c:	00001097          	auipc	ra,0x1
    80001a30:	c5c080e7          	jalr	-932(ra) # 80002688 <_Z5printPKcc>
    //mainThread
    kernelThread = TCB::createThread(nullptr);
    80001a34:	00000613          	li	a2,0
    80001a38:	00000593          	li	a1,0
    80001a3c:	00000513          	li	a0,0
    80001a40:	00001097          	auipc	ra,0x1
    80001a44:	8a0080e7          	jalr	-1888(ra) # 800022e0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    TCB::running = kernelThread;
    80001a48:	00004797          	auipc	a5,0x4
    80001a4c:	48a7b823          	sd	a0,1168(a5) # 80005ed8 <_ZN3TCB7runningE>
    if(kernelThread) print("KernelThread created");
    80001a50:	00050c63          	beqz	a0,80001a68 <main+0x17c>
    80001a54:	00a00593          	li	a1,10
    80001a58:	00003517          	auipc	a0,0x3
    80001a5c:	76850513          	addi	a0,a0,1896 # 800051c0 <CONSOLE_STATUS+0x1b0>
    80001a60:	00001097          	auipc	ra,0x1
    80001a64:	c28080e7          	jalr	-984(ra) # 80002688 <_Z5printPKcc>

    
    int val = thread_create(&threads[1], workerBodyA, nullptr);
    80001a68:	00000613          	li	a2,0
    80001a6c:	00000597          	auipc	a1,0x0
    80001a70:	b1458593          	addi	a1,a1,-1260 # 80001580 <_Z11workerBodyAPv>
    80001a74:	fd040513          	addi	a0,s0,-48
    80001a78:	00001097          	auipc	ra,0x1
    80001a7c:	0e0080e7          	jalr	224(ra) # 80002b58 <thread_create>
    if(!val && threads[1]) print("Thread A created");
    80001a80:	02051063          	bnez	a0,80001aa0 <main+0x1b4>
    80001a84:	fd043783          	ld	a5,-48(s0)
    80001a88:	00078c63          	beqz	a5,80001aa0 <main+0x1b4>
    80001a8c:	00a00593          	li	a1,10
    80001a90:	00003517          	auipc	a0,0x3
    80001a94:	74850513          	addi	a0,a0,1864 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80001a98:	00001097          	auipc	ra,0x1
    80001a9c:	bf0080e7          	jalr	-1040(ra) # 80002688 <_Z5printPKcc>
    
    val = thread_create(&threads[2], workerBodyB, nullptr);
    80001aa0:	00000613          	li	a2,0
    80001aa4:	00000597          	auipc	a1,0x0
    80001aa8:	b6058593          	addi	a1,a1,-1184 # 80001604 <_Z11workerBodyBPv>
    80001aac:	fd840513          	addi	a0,s0,-40
    80001ab0:	00001097          	auipc	ra,0x1
    80001ab4:	0a8080e7          	jalr	168(ra) # 80002b58 <thread_create>
    if(!val && threads[2]) print("Thread B created");
    80001ab8:	02051063          	bnez	a0,80001ad8 <main+0x1ec>
    80001abc:	fd843783          	ld	a5,-40(s0)
    80001ac0:	00078c63          	beqz	a5,80001ad8 <main+0x1ec>
    80001ac4:	00a00593          	li	a1,10
    80001ac8:	00003517          	auipc	a0,0x3
    80001acc:	72850513          	addi	a0,a0,1832 # 800051f0 <CONSOLE_STATUS+0x1e0>
    80001ad0:	00001097          	auipc	ra,0x1
    80001ad4:	bb8080e7          	jalr	-1096(ra) # 80002688 <_Z5printPKcc>

    val = thread_create(&threads[3], workerBodyC, nullptr);
    80001ad8:	00000613          	li	a2,0
    80001adc:	00000597          	auipc	a1,0x0
    80001ae0:	c5058593          	addi	a1,a1,-944 # 8000172c <_Z11workerBodyCPv>
    80001ae4:	fe040513          	addi	a0,s0,-32
    80001ae8:	00001097          	auipc	ra,0x1
    80001aec:	070080e7          	jalr	112(ra) # 80002b58 <thread_create>
    if(!val && threads[3]) print("Thread C created");
    80001af0:	02051063          	bnez	a0,80001b10 <main+0x224>
    80001af4:	fe043783          	ld	a5,-32(s0)
    80001af8:	00078c63          	beqz	a5,80001b10 <main+0x224>
    80001afc:	00a00593          	li	a1,10
    80001b00:	00003517          	auipc	a0,0x3
    80001b04:	70850513          	addi	a0,a0,1800 # 80005208 <CONSOLE_STATUS+0x1f8>
    80001b08:	00001097          	auipc	ra,0x1
    80001b0c:	b80080e7          	jalr	-1152(ra) # 80002688 <_Z5printPKcc>

    val = thread_create(&threads[4], workerBodyD, nullptr);
    80001b10:	00000613          	li	a2,0
    80001b14:	00000597          	auipc	a1,0x0
    80001b18:	cf858593          	addi	a1,a1,-776 # 8000180c <_Z11workerBodyDPv>
    80001b1c:	fe840513          	addi	a0,s0,-24
    80001b20:	00001097          	auipc	ra,0x1
    80001b24:	038080e7          	jalr	56(ra) # 80002b58 <thread_create>
    if(!val && threads[4]) print("Thread D created");
    80001b28:	02051063          	bnez	a0,80001b48 <main+0x25c>
    80001b2c:	fe843783          	ld	a5,-24(s0)
    80001b30:	00078c63          	beqz	a5,80001b48 <main+0x25c>
    80001b34:	00a00593          	li	a1,10
    80001b38:	00003517          	auipc	a0,0x3
    80001b3c:	6e850513          	addi	a0,a0,1768 # 80005220 <CONSOLE_STATUS+0x210>
    80001b40:	00001097          	auipc	ra,0x1
    80001b44:	b48080e7          	jalr	-1208(ra) # 80002688 <_Z5printPKcc>

    print("Scheduler queue", ' ');
    80001b48:	02000593          	li	a1,32
    80001b4c:	00003517          	auipc	a0,0x3
    80001b50:	6ec50513          	addi	a0,a0,1772 # 80005238 <CONSOLE_STATUS+0x228>
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	b34080e7          	jalr	-1228(ra) # 80002688 <_Z5printPKcc>
    Scheduler::print_queue();
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	628080e7          	jalr	1576(ra) # 80002184 <_ZN9Scheduler11print_queueEv>
    print("-------------------------------\n\n");
    80001b64:	00a00593          	li	a1,10
    80001b68:	00003517          	auipc	a0,0x3
    80001b6c:	58050513          	addi	a0,a0,1408 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001b70:	00001097          	auipc	ra,0x1
    80001b74:	b18080e7          	jalr	-1256(ra) # 80002688 <_Z5printPKcc>
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80001b78:	00200793          	li	a5,2
    80001b7c:	1007a073          	csrs	sstatus,a5
    80001b80:	00c0006f          	j	80001b8c <main+0x2a0>
    
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!(((TCB*)threads[1])->isFinished() && ((TCB*)threads[2])->isFinished() 
             && ((TCB*)threads[3])->isFinished() && ((TCB*)threads[4])->isFinished())) {
        //print("Kernel idle thread");
        thread_dispatch();
    80001b84:	00001097          	auipc	ra,0x1
    80001b88:	fb0080e7          	jalr	-80(ra) # 80002b34 <thread_dispatch>
    while (!(((TCB*)threads[1])->isFinished() && ((TCB*)threads[2])->isFinished() 
    80001b8c:	fd043783          	ld	a5,-48(s0)
    bool isFinished(){ return state == FINISHED; }
    80001b90:	0207a703          	lw	a4,32(a5)
    80001b94:	00300793          	li	a5,3
    80001b98:	fef716e3          	bne	a4,a5,80001b84 <main+0x298>
    80001b9c:	fd843783          	ld	a5,-40(s0)
    80001ba0:	0207a703          	lw	a4,32(a5)
    80001ba4:	00300793          	li	a5,3
    80001ba8:	fcf71ee3          	bne	a4,a5,80001b84 <main+0x298>
             && ((TCB*)threads[3])->isFinished() && ((TCB*)threads[4])->isFinished())) {
    80001bac:	fe043783          	ld	a5,-32(s0)
    80001bb0:	0207a703          	lw	a4,32(a5)
    80001bb4:	00300793          	li	a5,3
    80001bb8:	fcf716e3          	bne	a4,a5,80001b84 <main+0x298>
    80001bbc:	fe843783          	ld	a5,-24(s0)
    80001bc0:	0207a703          	lw	a4,32(a5)
    while (!(((TCB*)threads[1])->isFinished() && ((TCB*)threads[2])->isFinished() 
    80001bc4:	00300793          	li	a5,3
    80001bc8:	faf71ee3          	bne	a4,a5,80001b84 <main+0x298>
    }

    for(auto &thread: threads){ delete thread;}
    80001bcc:	fc840793          	addi	a5,s0,-56
    80001bd0:	ff040713          	addi	a4,s0,-16
    80001bd4:	00e78e63          	beq	a5,a4,80001bf0 <main+0x304>
    80001bd8:	0007b703          	ld	a4,0(a5)
#include"../lib/hw.h"

class _thread{
public:
    void operator delete(void* ptr){
        asm volatile("li a0, 0x69");
    80001bdc:	06900513          	li	a0,105
        asm volatile("mv a1, %0" ::"r" ((uint64)ptr));
    80001be0:	00070593          	mv	a1,a4
        asm volatile("ecall");
    80001be4:	00000073          	ecall
    80001be8:	00878793          	addi	a5,a5,8
    80001bec:	fe5ff06f          	j	80001bd0 <main+0x2e4>
    print("Kernel kraj");
    80001bf0:	00a00593          	li	a1,10
    80001bf4:	00003517          	auipc	a0,0x3
    80001bf8:	65450513          	addi	a0,a0,1620 # 80005248 <CONSOLE_STATUS+0x238>
    80001bfc:	00001097          	auipc	ra,0x1
    80001c00:	a8c080e7          	jalr	-1396(ra) # 80002688 <_Z5printPKcc>
    return 0;
    80001c04:	00000513          	li	a0,0
    80001c08:	03813083          	ld	ra,56(sp)
    80001c0c:	03013403          	ld	s0,48(sp)
    80001c10:	04010113          	addi	sp,sp,64
    80001c14:	00008067          	ret

0000000080001c18 <_ZN15MemoryAllocator11getInstanceEv>:
    fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
}*/

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80001c18:	ff010113          	addi	sp,sp,-16
    80001c1c:	00813423          	sd	s0,8(sp)
    80001c20:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80001c24:	00004797          	auipc	a5,0x4
    80001c28:	2ec7c783          	lbu	a5,748(a5) # 80005f10 <_ZN15MemoryAllocator9allocatorE>
    80001c2c:	04079463          	bnez	a5,80001c74 <_ZN15MemoryAllocator11getInstanceEv+0x5c>
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    80001c30:	00004697          	auipc	a3,0x4
    80001c34:	1f068693          	addi	a3,a3,496 # 80005e20 <HEAP_START_ADDR>
    80001c38:	0006b783          	ld	a5,0(a3)
    80001c3c:	00004717          	auipc	a4,0x4
    80001c40:	2d470713          	addi	a4,a4,724 # 80005f10 <_ZN15MemoryAllocator9allocatorE>
    80001c44:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    80001c48:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    80001c4c:	00004797          	auipc	a5,0x4
    80001c50:	1cc78793          	addi	a5,a5,460 # 80005e18 <HEAP_END_ADDR>
    80001c54:	0007b783          	ld	a5,0(a5)
    80001c58:	0006b683          	ld	a3,0(a3)
    80001c5c:	40d787b3          	sub	a5,a5,a3
    80001c60:	00873683          	ld	a3,8(a4)
    80001c64:	ff078793          	addi	a5,a5,-16
    80001c68:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    80001c6c:	00100793          	li	a5,1
    80001c70:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    80001c74:	00004517          	auipc	a0,0x4
    80001c78:	29c50513          	addi	a0,a0,668 # 80005f10 <_ZN15MemoryAllocator9allocatorE>
    80001c7c:	00813403          	ld	s0,8(sp)
    80001c80:	01010113          	addi	sp,sp,16
    80001c84:	00008067          	ret

0000000080001c88 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    80001c88:	ff010113          	addi	sp,sp,-16
    80001c8c:	00813423          	sd	s0,8(sp)
    80001c90:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80001c94:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    80001c98:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    80001c9c:	00000613          	li	a2,0
    80001ca0:	00000893          	li	a7,0
    80001ca4:	00000693          	li	a3,0
    80001ca8:	0140006f          	j	80001cbc <_ZN15MemoryAllocator9mem_allocEm+0x34>
    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    80001cac:	00060893          	mv	a7,a2
                best = curr;     
    80001cb0:	00078693          	mv	a3,a5
            }
        prev = curr;
    80001cb4:	00078613          	mv	a2,a5
        curr = curr->next;
    80001cb8:	0007b783          	ld	a5,0(a5)
    while(curr){
    80001cbc:	02078263          	beqz	a5,80001ce0 <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    80001cc0:	0087b703          	ld	a4,8(a5)
    80001cc4:	feb768e3          	bltu	a4,a1,80001cb4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    80001cc8:	fe0682e3          	beqz	a3,80001cac <_ZN15MemoryAllocator9mem_allocEm+0x24>
    80001ccc:	0086b803          	ld	a6,8(a3)
    80001cd0:	ff0772e3          	bgeu	a4,a6,80001cb4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    80001cd4:	00060893          	mv	a7,a2
                best = curr;     
    80001cd8:	00078693          	mv	a3,a5
    80001cdc:	fd9ff06f          	j	80001cb4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    80001ce0:	02068463          	beqz	a3,80001d08 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    80001ce4:	0086b783          	ld	a5,8(a3)
    80001ce8:	40b787b3          	sub	a5,a5,a1
    80001cec:	04f00713          	li	a4,79
    80001cf0:	02f76a63          	bltu	a4,a5,80001d24 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        if(!best_prev) fmem_head = best->next;
    80001cf4:	02088263          	beqz	a7,80001d18 <_ZN15MemoryAllocator9mem_allocEm+0x90>
        else best_prev->next = best->next;
    80001cf8:	0006b783          	ld	a5,0(a3)
    80001cfc:	00f8b023          	sd	a5,0(a7)
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    //print((uint64)best);
    //print((uint64)best->size);
    best->next = nullptr;
    80001d00:	0006b023          	sd	zero,0(a3)
    return (char*)best+sizeof(FreeSegment);
    80001d04:	01068693          	addi	a3,a3,16
}
    80001d08:	00068513          	mv	a0,a3
    80001d0c:	00813403          	ld	s0,8(sp)
    80001d10:	01010113          	addi	sp,sp,16
    80001d14:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80001d18:	0006b783          	ld	a5,0(a3)
    80001d1c:	00f53423          	sd	a5,8(a0)
    80001d20:	fe1ff06f          	j	80001d00 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    80001d24:	01058793          	addi	a5,a1,16
    80001d28:	00f687b3          	add	a5,a3,a5
        curr->next = best->next;
    80001d2c:	0006b703          	ld	a4,0(a3)
    80001d30:	00e7b023          	sd	a4,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    80001d34:	0086b703          	ld	a4,8(a3)
    80001d38:	40b70733          	sub	a4,a4,a1
    80001d3c:	ff070713          	addi	a4,a4,-16
    80001d40:	00e7b423          	sd	a4,8(a5)
        best->size = size;
    80001d44:	00b6b423          	sd	a1,8(a3)
        if(best_prev) best_prev->next = curr;
    80001d48:	00088663          	beqz	a7,80001d54 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    80001d4c:	00f8b023          	sd	a5,0(a7)
    80001d50:	fb1ff06f          	j	80001d00 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    80001d54:	00f53423          	sd	a5,8(a0)
    80001d58:	fa9ff06f          	j	80001d00 <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080001d5c <_ZN15MemoryAllocator18invalidFreeAddressEPv>:

bool MemoryAllocator::invalidFreeAddress(void* adr){
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00813423          	sd	s0,8(sp)
    80001d64:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80001d68:	00004797          	auipc	a5,0x4
    80001d6c:	0b878793          	addi	a5,a5,184 # 80005e20 <HEAP_START_ADDR>
    80001d70:	0007b783          	ld	a5,0(a5)
    80001d74:	04f5e063          	bltu	a1,a5,80001db4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x58>
    80001d78:	00004797          	auipc	a5,0x4
    80001d7c:	0a078793          	addi	a5,a5,160 # 80005e18 <HEAP_END_ADDR>
    80001d80:	0007b783          	ld	a5,0(a5)
    80001d84:	04f5f063          	bgeu	a1,a5,80001dc4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x68>
        return true;
    size_t t = (size_t)adr;
    for(FreeSegment* cur = fmem_head; cur; cur = cur->next)
    80001d88:	00853783          	ld	a5,8(a0)
    80001d8c:	0080006f          	j	80001d94 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x38>
    80001d90:	0007b783          	ld	a5,0(a5)
    80001d94:	02078c63          	beqz	a5,80001dcc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x70>
        if(t >= (size_t)cur && t < (size_t)cur+2*sizeof(FreeSegment)+cur->size)
    80001d98:	fef5ece3          	bltu	a1,a5,80001d90 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
    80001d9c:	0087b703          	ld	a4,8(a5)
    80001da0:	00e78733          	add	a4,a5,a4
    80001da4:	02070713          	addi	a4,a4,32
    80001da8:	fee5f4e3          	bgeu	a1,a4,80001d90 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
            return true;
    80001dac:	00100513          	li	a0,1
    80001db0:	0080006f          	j	80001db8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
        return true;
    80001db4:	00100513          	li	a0,1
    return false;
}
    80001db8:	00813403          	ld	s0,8(sp)
    80001dbc:	01010113          	addi	sp,sp,16
    80001dc0:	00008067          	ret
        return true;
    80001dc4:	00100513          	li	a0,1
    80001dc8:	ff1ff06f          	j	80001db8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
    return false;
    80001dcc:	00000513          	li	a0,0
    80001dd0:	fe9ff06f          	j	80001db8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>

0000000080001dd4 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00813423          	sd	s0,8(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80001de0:	0085b703          	ld	a4,8(a1)
    80001de4:	01070793          	addi	a5,a4,16
    80001de8:	00f587b3          	add	a5,a1,a5
    80001dec:	0005b503          	ld	a0,0(a1)
    80001df0:	00a78863          	beq	a5,a0,80001e00 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    80001df4:	00813403          	ld	s0,8(sp)
    80001df8:	01010113          	addi	sp,sp,16
    80001dfc:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80001e00:	00853783          	ld	a5,8(a0)
    80001e04:	00f70733          	add	a4,a4,a5
    80001e08:	01070713          	addi	a4,a4,16
    80001e0c:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    80001e10:	00053783          	ld	a5,0(a0)
    80001e14:	00f5b023          	sd	a5,0(a1)
        return t;
    80001e18:	00058513          	mv	a0,a1
    80001e1c:	fd9ff06f          	j	80001df4 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

0000000080001e20 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80001e20:	fd010113          	addi	sp,sp,-48
    80001e24:	02113423          	sd	ra,40(sp)
    80001e28:	02813023          	sd	s0,32(sp)
    80001e2c:	00913c23          	sd	s1,24(sp)
    80001e30:	01213823          	sd	s2,16(sp)
    80001e34:	01313423          	sd	s3,8(sp)
    80001e38:	01413023          	sd	s4,0(sp)
    80001e3c:	03010413          	addi	s0,sp,48
    80001e40:	00050993          	mv	s3,a0
    80001e44:	00058913          	mv	s2,a1
    if(invalidFreeAddress(adr)) return -1;
    80001e48:	00000097          	auipc	ra,0x0
    80001e4c:	f14080e7          	jalr	-236(ra) # 80001d5c <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80001e50:	0a051063          	bnez	a0,80001ef0 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    80001e54:	0089b783          	ld	a5,8(s3)
    80001e58:	00078863          	beqz	a5,80001e68 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80001e5c:	ff090a13          	addi	s4,s2,-16
        //print((uint64)newsgm);
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80001e60:	00000493          	li	s1,0
    80001e64:	01c0006f          	j	80001e80 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80001e68:	ff090913          	addi	s2,s2,-16
    80001e6c:	0129b423          	sd	s2,8(s3)
    80001e70:	0540006f          	j	80001ec4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80001e74:	00f96e63          	bltu	s2,a5,80001e90 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80001e78:	00078493          	mv	s1,a5
    80001e7c:	0007b783          	ld	a5,0(a5)
    80001e80:	00078863          	beqz	a5,80001e90 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80001e84:	fe0488e3          	beqz	s1,80001e74 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    80001e88:	ff24f8e3          	bgeu	s1,s2,80001e78 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80001e8c:	fe9ff06f          	j	80001e74 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        //print((ull)prev);
        newsgm->next = cur;
    80001e90:	fef93823          	sd	a5,-16(s2)
        if(cur)
    80001e94:	00078a63          	beqz	a5,80001ea8 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    80001e98:	000a0593          	mv	a1,s4
    80001e9c:	00098513          	mv	a0,s3
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	f34080e7          	jalr	-204(ra) # 80001dd4 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80001ea8:	02048e63          	beqz	s1,80001ee4 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    80001eac:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    80001eb0:	00048593          	mv	a1,s1
    80001eb4:	00098513          	mv	a0,s3
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	f1c080e7          	jalr	-228(ra) # 80001dd4 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    80001ec0:	00000513          	li	a0,0
}
    80001ec4:	02813083          	ld	ra,40(sp)
    80001ec8:	02013403          	ld	s0,32(sp)
    80001ecc:	01813483          	ld	s1,24(sp)
    80001ed0:	01013903          	ld	s2,16(sp)
    80001ed4:	00813983          	ld	s3,8(sp)
    80001ed8:	00013a03          	ld	s4,0(sp)
    80001edc:	03010113          	addi	sp,sp,48
    80001ee0:	00008067          	ret
            fmem_head = newsgm;
    80001ee4:	0149b423          	sd	s4,8(s3)
    return 0;
    80001ee8:	00000513          	li	a0,0
    80001eec:	fd9ff06f          	j	80001ec4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(invalidFreeAddress(adr)) return -1;
    80001ef0:	fff00513          	li	a0,-1
    80001ef4:	fd1ff06f          	j	80001ec4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080001ef8 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80001ef8:	fe010113          	addi	sp,sp,-32
    80001efc:	00113c23          	sd	ra,24(sp)
    80001f00:	00813823          	sd	s0,16(sp)
    80001f04:	00913423          	sd	s1,8(sp)
    80001f08:	02010413          	addi	s0,sp,32
    80001f0c:	00050493          	mv	s1,a0
    //print("MEM_BLOCK_SIZE: ", ' ');
    //print(MEM_BLOCK_SIZE, '\n', 0);
    print("------Free Segment Lista------");
    80001f10:	00a00593          	li	a1,10
    80001f14:	00003517          	auipc	a0,0x3
    80001f18:	34450513          	addi	a0,a0,836 # 80005258 <CONSOLE_STATUS+0x248>
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	76c080e7          	jalr	1900(ra) # 80002688 <_Z5printPKcc>
    if(!fmem_head)
    80001f24:	0084b783          	ld	a5,8(s1)
    80001f28:	04078463          	beqz	a5,80001f70 <_ZN15MemoryAllocator10print_listEv+0x78>
        print("LISTA JE PRAZNA!");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80001f2c:	0084b483          	ld	s1,8(s1)
    80001f30:	04048c63          	beqz	s1,80001f88 <_ZN15MemoryAllocator10print_listEv+0x90>
        print((uint64)curr, '\n', 0);
    80001f34:	00000613          	li	a2,0
    80001f38:	00a00593          	li	a1,10
    80001f3c:	00048513          	mv	a0,s1
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	608080e7          	jalr	1544(ra) # 80002548 <_Z5printmcb>
        print((uint64)curr->size, '\n', 0);
    80001f48:	00000613          	li	a2,0
    80001f4c:	00a00593          	li	a1,10
    80001f50:	0084b503          	ld	a0,8(s1)
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	5f4080e7          	jalr	1524(ra) # 80002548 <_Z5printmcb>
        __putc('\n');
    80001f5c:	00a00513          	li	a0,10
    80001f60:	00003097          	auipc	ra,0x3
    80001f64:	dbc080e7          	jalr	-580(ra) # 80004d1c <__putc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80001f68:	0004b483          	ld	s1,0(s1)
    80001f6c:	fc5ff06f          	j	80001f30 <_ZN15MemoryAllocator10print_listEv+0x38>
        print("LISTA JE PRAZNA!");
    80001f70:	00a00593          	li	a1,10
    80001f74:	00003517          	auipc	a0,0x3
    80001f78:	30450513          	addi	a0,a0,772 # 80005278 <CONSOLE_STATUS+0x268>
    80001f7c:	00000097          	auipc	ra,0x0
    80001f80:	70c080e7          	jalr	1804(ra) # 80002688 <_Z5printPKcc>
    80001f84:	fa9ff06f          	j	80001f2c <_ZN15MemoryAllocator10print_listEv+0x34>
    }
    print("------------------------------");
    80001f88:	00a00593          	li	a1,10
    80001f8c:	00003517          	auipc	a0,0x3
    80001f90:	30450513          	addi	a0,a0,772 # 80005290 <CONSOLE_STATUS+0x280>
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	6f4080e7          	jalr	1780(ra) # 80002688 <_Z5printPKcc>
}
    80001f9c:	01813083          	ld	ra,24(sp)
    80001fa0:	01013403          	ld	s0,16(sp)
    80001fa4:	00813483          	ld	s1,8(sp)
    80001fa8:	02010113          	addi	sp,sp,32
    80001fac:	00008067          	ret

0000000080001fb0 <_ZN9Scheduler9initalizeEv>:
#include"../../h/scheduler.hpp"

PtrQueue<TCB>* Scheduler::queue = nullptr;

void Scheduler::initalize(){
    80001fb0:	ff010113          	addi	sp,sp,-16
    80001fb4:	00113423          	sd	ra,8(sp)
    80001fb8:	00813023          	sd	s0,0(sp)
    80001fbc:	01010413          	addi	s0,sp,16
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80001fc0:	00000097          	auipc	ra,0x0
    80001fc4:	c58080e7          	jalr	-936(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80001fc8:	00100593          	li	a1,1
    80001fcc:	00000097          	auipc	ra,0x0
    80001fd0:	cbc080e7          	jalr	-836(ra) # 80001c88 <_ZN15MemoryAllocator9mem_allocEm>
    80001fd4:	00053023          	sd	zero,0(a0)
    80001fd8:	00053423          	sd	zero,8(a0)
    queue = new PtrQueue<TCB>();
    80001fdc:	00004797          	auipc	a5,0x4
    80001fe0:	eea7b623          	sd	a0,-276(a5) # 80005ec8 <_ZN9Scheduler5queueE>
}
    80001fe4:	00813083          	ld	ra,8(sp)
    80001fe8:	00013403          	ld	s0,0(sp)
    80001fec:	01010113          	addi	sp,sp,16
    80001ff0:	00008067          	ret

0000000080001ff4 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get(){
    80001ff4:	fe010113          	addi	sp,sp,-32
    80001ff8:	00113c23          	sd	ra,24(sp)
    80001ffc:	00813823          	sd	s0,16(sp)
    80002000:	00913423          	sd	s1,8(sp)
    80002004:	01213023          	sd	s2,0(sp)
    80002008:	02010413          	addi	s0,sp,32
    return queue->remove();
    8000200c:	00004797          	auipc	a5,0x4
    80002010:	ebc78793          	addi	a5,a5,-324 # 80005ec8 <_ZN9Scheduler5queueE>
    80002014:	0007b783          	ld	a5,0(a5)
        tail = tail==nullptr?(head = node):(tail->next = node);
        return *this;
    }
   
    T* remove(){
        if(head!=nullptr){
    80002018:	0007b483          	ld	s1,0(a5)
    8000201c:	04048a63          	beqz	s1,80002070 <_ZN9Scheduler3getEv+0x7c>
            T* ret = head->info;
    80002020:	0084b903          	ld	s2,8(s1)
            Node* old = head;
            head = head==tail?(tail = nullptr):head->next;
    80002024:	0087b703          	ld	a4,8(a5)
    80002028:	02e48e63          	beq	s1,a4,80002064 <_ZN9Scheduler3getEv+0x70>
    8000202c:	0004b703          	ld	a4,0(s1)
    80002030:	00e7b023          	sd	a4,0(a5)
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80002034:	00000097          	auipc	ra,0x0
    80002038:	be4080e7          	jalr	-1052(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    8000203c:	00048593          	mv	a1,s1
    80002040:	00000097          	auipc	ra,0x0
    80002044:	de0080e7          	jalr	-544(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002048:	00090513          	mv	a0,s2
    8000204c:	01813083          	ld	ra,24(sp)
    80002050:	01013403          	ld	s0,16(sp)
    80002054:	00813483          	ld	s1,8(sp)
    80002058:	00013903          	ld	s2,0(sp)
    8000205c:	02010113          	addi	sp,sp,32
    80002060:	00008067          	ret
    80002064:	0007b423          	sd	zero,8(a5)
    80002068:	00000713          	li	a4,0
    8000206c:	fc5ff06f          	j	80002030 <_ZN9Scheduler3getEv+0x3c>
            delete old;
            return ret;            
        }
        return nullptr;
    80002070:	00048913          	mv	s2,s1
    return queue->remove();
    80002074:	fd5ff06f          	j	80002048 <_ZN9Scheduler3getEv+0x54>

0000000080002078 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB* ptr){
    80002078:	fe010113          	addi	sp,sp,-32
    8000207c:	00113c23          	sd	ra,24(sp)
    80002080:	00813823          	sd	s0,16(sp)
    80002084:	00913423          	sd	s1,8(sp)
    80002088:	01213023          	sd	s2,0(sp)
    8000208c:	02010413          	addi	s0,sp,32
    80002090:	00050913          	mv	s2,a0
    queue->insert(ptr);
    80002094:	00004797          	auipc	a5,0x4
    80002098:	e3478793          	addi	a5,a5,-460 # 80005ec8 <_ZN9Scheduler5queueE>
    8000209c:	0007b483          	ld	s1,0(a5)
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	b78080e7          	jalr	-1160(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    800020a8:	00100593          	li	a1,1
    800020ac:	00000097          	auipc	ra,0x0
    800020b0:	bdc080e7          	jalr	-1060(ra) # 80001c88 <_ZN15MemoryAllocator9mem_allocEm>
        Node(T* info = nullptr, Node* next = nullptr):next(next), info(info){}
    800020b4:	00053023          	sd	zero,0(a0)
    800020b8:	01253423          	sd	s2,8(a0)
        tail = tail==nullptr?(head = node):(tail->next = node);
    800020bc:	0084b783          	ld	a5,8(s1)
    800020c0:	02078263          	beqz	a5,800020e4 <_ZN9Scheduler3putEP3TCB+0x6c>
    800020c4:	00a7b023          	sd	a0,0(a5)
    800020c8:	00a4b423          	sd	a0,8(s1)
}
    800020cc:	01813083          	ld	ra,24(sp)
    800020d0:	01013403          	ld	s0,16(sp)
    800020d4:	00813483          	ld	s1,8(sp)
    800020d8:	00013903          	ld	s2,0(sp)
    800020dc:	02010113          	addi	sp,sp,32
    800020e0:	00008067          	ret
    800020e4:	00a4b023          	sd	a0,0(s1)
    800020e8:	fe1ff06f          	j	800020c8 <_ZN9Scheduler3putEP3TCB+0x50>

00000000800020ec <_ZN9Scheduler8finalizeEv>:

void Scheduler::finalize(){
    800020ec:	fe010113          	addi	sp,sp,-32
    800020f0:	00113c23          	sd	ra,24(sp)
    800020f4:	00813823          	sd	s0,16(sp)
    800020f8:	00913423          	sd	s1,8(sp)
    800020fc:	01213023          	sd	s2,0(sp)
    80002100:	02010413          	addi	s0,sp,32
    if(queue) delete queue;
    80002104:	00004797          	auipc	a5,0x4
    80002108:	dc478793          	addi	a5,a5,-572 # 80005ec8 <_ZN9Scheduler5queueE>
    8000210c:	0007b483          	ld	s1,0(a5)
    80002110:	02049463          	bnez	s1,80002138 <_ZN9Scheduler8finalizeEv+0x4c>
    80002114:	0580006f          	j	8000216c <_ZN9Scheduler8finalizeEv+0x80>
            head = head==tail?(tail = nullptr):head->next;
    80002118:	0004b423          	sd	zero,8(s1)
    8000211c:	00000793          	li	a5,0
    80002120:	00f4b023          	sd	a5,0(s1)
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80002124:	00000097          	auipc	ra,0x0
    80002128:	af4080e7          	jalr	-1292(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    8000212c:	00090593          	mv	a1,s2
    80002130:	00000097          	auipc	ra,0x0
    80002134:	cf0080e7          	jalr	-784(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    }

    bool isEmpty() {return !head;}
    80002138:	0004b783          	ld	a5,0(s1)
        while(!isEmpty())
    8000213c:	00078e63          	beqz	a5,80002158 <_ZN9Scheduler8finalizeEv+0x6c>
        if(head!=nullptr){
    80002140:	00078913          	mv	s2,a5
    80002144:	fe078ae3          	beqz	a5,80002138 <_ZN9Scheduler8finalizeEv+0x4c>
            head = head==tail?(tail = nullptr):head->next;
    80002148:	0084b783          	ld	a5,8(s1)
    8000214c:	fcf906e3          	beq	s2,a5,80002118 <_ZN9Scheduler8finalizeEv+0x2c>
    80002150:	00093783          	ld	a5,0(s2)
    80002154:	fcdff06f          	j	80002120 <_ZN9Scheduler8finalizeEv+0x34>
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	ac0080e7          	jalr	-1344(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80002160:	00048593          	mv	a1,s1
    80002164:	00000097          	auipc	ra,0x0
    80002168:	cbc080e7          	jalr	-836(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000216c:	01813083          	ld	ra,24(sp)
    80002170:	01013403          	ld	s0,16(sp)
    80002174:	00813483          	ld	s1,8(sp)
    80002178:	00013903          	ld	s2,0(sp)
    8000217c:	02010113          	addi	sp,sp,32
    80002180:	00008067          	ret

0000000080002184 <_ZN9Scheduler11print_queueEv>:

void Scheduler::print_queue(){
    80002184:	fe010113          	addi	sp,sp,-32
    80002188:	00113c23          	sd	ra,24(sp)
    8000218c:	00813823          	sd	s0,16(sp)
    80002190:	00913423          	sd	s1,8(sp)
    80002194:	02010413          	addi	s0,sp,32
    queue->printQueue();
    80002198:	00004797          	auipc	a5,0x4
    8000219c:	d3078793          	addi	a5,a5,-720 # 80005ec8 <_ZN9Scheduler5queueE>
    800021a0:	0007b783          	ld	a5,0(a5)

    void printQueue(){
        Node* t = head;
    800021a4:	0007b483          	ld	s1,0(a5)
        while(t){
    800021a8:	02048a63          	beqz	s1,800021dc <_ZN9Scheduler11print_queueEv+0x58>
            print("->",' ');
    800021ac:	02000593          	li	a1,32
    800021b0:	00003517          	auipc	a0,0x3
    800021b4:	10050513          	addi	a0,a0,256 # 800052b0 <CONSOLE_STATUS+0x2a0>
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	4d0080e7          	jalr	1232(ra) # 80002688 <_Z5printPKcc>
            print((uint64)t->info, ' ', 0);
    800021c0:	00000613          	li	a2,0
    800021c4:	02000593          	li	a1,32
    800021c8:	0084b503          	ld	a0,8(s1)
    800021cc:	00000097          	auipc	ra,0x0
    800021d0:	37c080e7          	jalr	892(ra) # 80002548 <_Z5printmcb>
            t = t->next;            
    800021d4:	0004b483          	ld	s1,0(s1)
    800021d8:	fd1ff06f          	j	800021a8 <_ZN9Scheduler11print_queueEv+0x24>
        }
        print("");
    800021dc:	00a00593          	li	a1,10
    800021e0:	00003517          	auipc	a0,0x3
    800021e4:	18850513          	addi	a0,a0,392 # 80005368 <CONSOLE_STATUS+0x358>
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	4a0080e7          	jalr	1184(ra) # 80002688 <_Z5printPKcc>
}
    800021f0:	01813083          	ld	ra,24(sp)
    800021f4:	01013403          	ld	s0,16(sp)
    800021f8:	00813483          	ld	s1,8(sp)
    800021fc:	02010113          	addi	sp,sp,32
    80002200:	00008067          	ret

0000000080002204 <_ZN5Riscv10popSppSpieEv>:
#include"../../h/scheduler.hpp"
#include"../../h/riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
void Riscv::popSppSpie() {
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00813423          	sd	s0,8(sp)
    8000220c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002210:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002214:	10200073          	sret
}
    80002218:	00813403          	ld	s0,8(sp)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	00008067          	ret

0000000080002224 <_ZN3TCB13threadWrapperEv>:
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::threadWrapper(){
    80002224:	ff010113          	addi	sp,sp,-16
    80002228:	00113423          	sd	ra,8(sp)
    8000222c:	00813023          	sd	s0,0(sp)
    80002230:	01010413          	addi	s0,sp,16
    //print("start of thread", (uint64)TCB::running, 0);
    Riscv::popSppSpie();
    80002234:	00000097          	auipc	ra,0x0
    80002238:	fd0080e7          	jalr	-48(ra) # 80002204 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    8000223c:	00004797          	auipc	a5,0x4
    80002240:	c9c78793          	addi	a5,a5,-868 # 80005ed8 <_ZN3TCB7runningE>
    80002244:	0007b783          	ld	a5,0(a5)
    80002248:	0007b703          	ld	a4,0(a5)
    8000224c:	0087b503          	ld	a0,8(a5)
    80002250:	000700e7          	jalr	a4
    thread_exit();
    80002254:	00001097          	auipc	ra,0x1
    80002258:	998080e7          	jalr	-1640(ra) # 80002bec <thread_exit>
}
    8000225c:	00813083          	ld	ra,8(sp)
    80002260:	00013403          	ld	s0,0(sp)
    80002264:	01010113          	addi	sp,sp,16
    80002268:	00008067          	ret

000000008000226c <_ZN3TCBC1EPFvPvES0_Pmm>:
context({(uint64) &threadWrapper, stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0}){    
    8000226c:	00b53023          	sd	a1,0(a0)
    80002270:	00c53423          	sd	a2,8(a0)
    80002274:	00d53823          	sd	a3,16(a0)
    80002278:	00e53c23          	sd	a4,24(a0)
    8000227c:	00100793          	li	a5,1
    80002280:	02f52023          	sw	a5,32(a0)
    80002284:	02050223          	sb	zero,36(a0)
    80002288:	00000797          	auipc	a5,0x0
    8000228c:	f9c78793          	addi	a5,a5,-100 # 80002224 <_ZN3TCB13threadWrapperEv>
    80002290:	02f53423          	sd	a5,40(a0)
    80002294:	04068063          	beqz	a3,800022d4 <_ZN3TCBC1EPFvPvES0_Pmm+0x68>
    80002298:	000087b7          	lui	a5,0x8
    8000229c:	00f687b3          	add	a5,a3,a5
    800022a0:	02f53823          	sd	a5,48(a0)
    if(body && stack)
    800022a4:	02058c63          	beqz	a1,800022dc <_ZN3TCBC1EPFvPvES0_Pmm+0x70>
    800022a8:	02068a63          	beqz	a3,800022dc <_ZN3TCBC1EPFvPvES0_Pmm+0x70>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    800022ac:	ff010113          	addi	sp,sp,-16
    800022b0:	00113423          	sd	ra,8(sp)
    800022b4:	00813023          	sd	s0,0(sp)
    800022b8:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    800022bc:	00000097          	auipc	ra,0x0
    800022c0:	dbc080e7          	jalr	-580(ra) # 80002078 <_ZN9Scheduler3putEP3TCB>
}   
    800022c4:	00813083          	ld	ra,8(sp)
    800022c8:	00013403          	ld	s0,0(sp)
    800022cc:	01010113          	addi	sp,sp,16
    800022d0:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0}){    
    800022d4:	00000793          	li	a5,0
    800022d8:	fc9ff06f          	j	800022a0 <_ZN3TCBC1EPFvPvES0_Pmm+0x34>
    800022dc:	00008067          	ret

00000000800022e0 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(Body body, void* args, uint64* stack){
    800022e0:	fd010113          	addi	sp,sp,-48
    800022e4:	02113423          	sd	ra,40(sp)
    800022e8:	02813023          	sd	s0,32(sp)
    800022ec:	00913c23          	sd	s1,24(sp)
    800022f0:	01213823          	sd	s2,16(sp)
    800022f4:	01313423          	sd	s3,8(sp)
    800022f8:	01413023          	sd	s4,0(sp)
    800022fc:	03010413          	addi	s0,sp,48
    80002300:	00050913          	mv	s2,a0
    80002304:	00058993          	mv	s3,a1
    80002308:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	90c080e7          	jalr	-1780(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80002314:	00100593          	li	a1,1
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	970080e7          	jalr	-1680(ra) # 80001c88 <_ZN15MemoryAllocator9mem_allocEm>
    80002320:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    80002324:	00200713          	li	a4,2
    80002328:	000a0693          	mv	a3,s4
    8000232c:	00098613          	mv	a2,s3
    80002330:	00090593          	mv	a1,s2
    80002334:	00000097          	auipc	ra,0x0
    80002338:	f38080e7          	jalr	-200(ra) # 8000226c <_ZN3TCBC1EPFvPvES0_Pmm>
    8000233c:	0280006f          	j	80002364 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80002340:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80002344:	00000097          	auipc	ra,0x0
    80002348:	8d4080e7          	jalr	-1836(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    8000234c:	00048593          	mv	a1,s1
    80002350:	00000097          	auipc	ra,0x0
    80002354:	ad0080e7          	jalr	-1328(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    80002358:	00090513          	mv	a0,s2
    8000235c:	00005097          	auipc	ra,0x5
    80002360:	c8c080e7          	jalr	-884(ra) # 80006fe8 <_Unwind_Resume>
}
    80002364:	00048513          	mv	a0,s1
    80002368:	02813083          	ld	ra,40(sp)
    8000236c:	02013403          	ld	s0,32(sp)
    80002370:	01813483          	ld	s1,24(sp)
    80002374:	01013903          	ld	s2,16(sp)
    80002378:	00813983          	ld	s3,8(sp)
    8000237c:	00013a03          	ld	s4,0(sp)
    80002380:	03010113          	addi	sp,sp,48
    80002384:	00008067          	ret

0000000080002388 <_ZN3TCB8dispatchEv>:

void TCB::dispatch(){
    80002388:	fe010113          	addi	sp,sp,-32
    8000238c:	00113c23          	sd	ra,24(sp)
    80002390:	00813823          	sd	s0,16(sp)
    80002394:	00913423          	sd	s1,8(sp)
    80002398:	01213023          	sd	s2,0(sp)
    8000239c:	02010413          	addi	s0,sp,32
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    800023a0:	00004797          	auipc	a5,0x4
    800023a4:	b3878793          	addi	a5,a5,-1224 # 80005ed8 <_ZN3TCB7runningE>
    800023a8:	0007b483          	ld	s1,0(a5)
    800023ac:	0204a783          	lw	a5,32(s1)
    if(!oldRunning->isFinished() && oldRunning->getState() != BLOCKED)
    800023b0:	00300713          	li	a4,3
    800023b4:	00e78463          	beq	a5,a4,800023bc <_ZN3TCB8dispatchEv+0x34>
    800023b8:	04079263          	bnez	a5,800023fc <_ZN3TCB8dispatchEv+0x74>
        Scheduler::put(oldRunning);
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    800023bc:	00300713          	li	a4,3
    800023c0:	04e78663          	beq	a5,a4,8000240c <_ZN3TCB8dispatchEv+0x84>
        delete oldRunning;
    running = Scheduler::get(); 
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	c30080e7          	jalr	-976(ra) # 80001ff4 <_ZN9Scheduler3getEv>
    800023cc:	00004797          	auipc	a5,0x4
    800023d0:	b0a7b623          	sd	a0,-1268(a5) # 80005ed8 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    800023d4:	02850593          	addi	a1,a0,40
    800023d8:	02848513          	addi	a0,s1,40
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	d34080e7          	jalr	-716(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800023e4:	01813083          	ld	ra,24(sp)
    800023e8:	01013403          	ld	s0,16(sp)
    800023ec:	00813483          	ld	s1,8(sp)
    800023f0:	00013903          	ld	s2,0(sp)
    800023f4:	02010113          	addi	sp,sp,32
    800023f8:	00008067          	ret
        Scheduler::put(oldRunning);
    800023fc:	00048513          	mv	a0,s1
    80002400:	00000097          	auipc	ra,0x0
    80002404:	c78080e7          	jalr	-904(ra) # 80002078 <_ZN9Scheduler3putEP3TCB>
    80002408:	fbdff06f          	j	800023c4 <_ZN3TCB8dispatchEv+0x3c>
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
    8000240c:	0244c783          	lbu	a5,36(s1)
    80002410:	fa078ae3          	beqz	a5,800023c4 <_ZN3TCB8dispatchEv+0x3c>
        delete oldRunning;
    80002414:	fa0488e3          	beqz	s1,800023c4 <_ZN3TCB8dispatchEv+0x3c>
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	800080e7          	jalr	-2048(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    80002420:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    80002424:	00048593          	mv	a1,s1
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	934080e7          	jalr	-1740(ra) # 80001d5c <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002430:	00050e63          	beqz	a0,8000244c <_ZN3TCB8dispatchEv+0xc4>
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	7e4080e7          	jalr	2020(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    8000243c:	00048593          	mv	a1,s1
    80002440:	00000097          	auipc	ra,0x0
    80002444:	9e0080e7          	jalr	-1568(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    80002448:	f7dff06f          	j	800023c4 <_ZN3TCB8dispatchEv+0x3c>
            allocator.mem_free(stack);
    8000244c:	0104b583          	ld	a1,16(s1)
    80002450:	00090513          	mv	a0,s2
    80002454:	00000097          	auipc	ra,0x0
    80002458:	9cc080e7          	jalr	-1588(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    8000245c:	fd9ff06f          	j	80002434 <_ZN3TCB8dispatchEv+0xac>

0000000080002460 <_ZN3TCB5yieldEv>:
void TCB::yield(){
    80002460:	ff010113          	addi	sp,sp,-16
    80002464:	00113423          	sd	ra,8(sp)
    80002468:	00813023          	sd	s0,0(sp)
    8000246c:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002470:	fffff097          	auipc	ra,0xfffff
    80002474:	cb4080e7          	jalr	-844(ra) # 80001124 <_ZN5Riscv13pushRegistersEv>
    dispatch();
    80002478:	00000097          	auipc	ra,0x0
    8000247c:	f10080e7          	jalr	-240(ra) # 80002388 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002480:	fffff097          	auipc	ra,0xfffff
    80002484:	d20080e7          	jalr	-736(ra) # 800011a0 <_ZN5Riscv12popRegistersEv>
}
    80002488:	00813083          	ld	ra,8(sp)
    8000248c:	00013403          	ld	s0,0(sp)
    80002490:	01010113          	addi	sp,sp,16
    80002494:	00008067          	ret

0000000080002498 <_ZN3TCB12deleteThreadEPS_>:

void TCB::deleteThread(TCB* t){
    if(t){
    80002498:	0a050663          	beqz	a0,80002544 <_ZN3TCB12deleteThreadEPS_+0xac>
        if(running != t && t->isFinished())
    8000249c:	00004797          	auipc	a5,0x4
    800024a0:	a3c78793          	addi	a5,a5,-1476 # 80005ed8 <_ZN3TCB7runningE>
    800024a4:	0007b783          	ld	a5,0(a5)
    800024a8:	00a78863          	beq	a5,a0,800024b8 <_ZN3TCB12deleteThreadEPS_+0x20>
    bool isFinished(){ return state == FINISHED; }
    800024ac:	02052703          	lw	a4,32(a0)
    800024b0:	00300793          	li	a5,3
    800024b4:	00f70c63          	beq	a4,a5,800024cc <_ZN3TCB12deleteThreadEPS_+0x34>
            delete t;
        else{
            t->deleteOnEnd = true;
    800024b8:	00100793          	li	a5,1
    800024bc:	02f50223          	sb	a5,36(a0)
    void finish() { state = FINISHED; }
    800024c0:	00300793          	li	a5,3
    800024c4:	02f52023          	sw	a5,32(a0)
            t->finish();
        }        
    }
}
    800024c8:	00008067          	ret
void TCB::deleteThread(TCB* t){
    800024cc:	fe010113          	addi	sp,sp,-32
    800024d0:	00113c23          	sd	ra,24(sp)
    800024d4:	00813823          	sd	s0,16(sp)
    800024d8:	00913423          	sd	s1,8(sp)
    800024dc:	01213023          	sd	s2,0(sp)
    800024e0:	02010413          	addi	s0,sp,32
    800024e4:	00050493          	mv	s1,a0
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
    800024e8:	fffff097          	auipc	ra,0xfffff
    800024ec:	730080e7          	jalr	1840(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    800024f0:	00050913          	mv	s2,a0
        if(!allocator.invalidFreeAddress(this))
    800024f4:	00048593          	mv	a1,s1
    800024f8:	00000097          	auipc	ra,0x0
    800024fc:	864080e7          	jalr	-1948(ra) # 80001d5c <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80002500:	02050863          	beqz	a0,80002530 <_ZN3TCB12deleteThreadEPS_+0x98>
    80002504:	fffff097          	auipc	ra,0xfffff
    80002508:	714080e7          	jalr	1812(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    8000250c:	00048593          	mv	a1,s1
    80002510:	00000097          	auipc	ra,0x0
    80002514:	910080e7          	jalr	-1776(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002518:	01813083          	ld	ra,24(sp)
    8000251c:	01013403          	ld	s0,16(sp)
    80002520:	00813483          	ld	s1,8(sp)
    80002524:	00013903          	ld	s2,0(sp)
    80002528:	02010113          	addi	sp,sp,32
    8000252c:	00008067          	ret
            allocator.mem_free(stack);
    80002530:	0104b583          	ld	a1,16(s1)
    80002534:	00090513          	mv	a0,s2
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	8e8080e7          	jalr	-1816(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    80002540:	fc5ff06f          	j	80002504 <_ZN3TCB12deleteThreadEPS_+0x6c>
    80002544:	00008067          	ret

0000000080002548 <_Z5printmcb>:
#include"../../h/testing.hpp"

void print(uint64 unum, char end, bool hex){
    80002548:	fa010113          	addi	sp,sp,-96
    8000254c:	04113c23          	sd	ra,88(sp)
    80002550:	04813823          	sd	s0,80(sp)
    80002554:	04913423          	sd	s1,72(sp)
    80002558:	05213023          	sd	s2,64(sp)
    8000255c:	03313c23          	sd	s3,56(sp)
    80002560:	03413823          	sd	s4,48(sp)
    80002564:	06010413          	addi	s0,sp,96
    80002568:	00050913          	mv	s2,a0
    8000256c:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002570:	100027f3          	csrr	a5,sstatus
    80002574:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80002578:	fa843983          	ld	s3,-88(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    8000257c:	00200793          	li	a5,2
    80002580:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    80002584:	04061e63          	bnez	a2,800025e0 <_Z5printmcb+0x98>
    int i = 0;
    80002588:	00000493          	li	s1,0
    8000258c:	00c0006f          	j	80002598 <_Z5printmcb+0x50>
    do{
        buffer[i++] = '0' + unum1%10;
    80002590:	00060493          	mv	s1,a2
        unum1/=10;
    80002594:	00078913          	mv	s2,a5
        buffer[i++] = '0' + unum1%10;
    80002598:	00a00793          	li	a5,10
    8000259c:	02f97733          	remu	a4,s2,a5
    800025a0:	0014861b          	addiw	a2,s1,1
    800025a4:	03070713          	addi	a4,a4,48
    800025a8:	fd040693          	addi	a3,s0,-48
    800025ac:	009686b3          	add	a3,a3,s1
    800025b0:	fee68023          	sb	a4,-32(a3)
        unum1/=10;
    800025b4:	02f957b3          	divu	a5,s2,a5
    }while(unum1 > 0);
    800025b8:	00900713          	li	a4,9
    800025bc:	fd276ae3          	bltu	a4,s2,80002590 <_Z5printmcb+0x48>
    for(int j = i-1; j >= 0; j--)
    800025c0:	0804c663          	bltz	s1,8000264c <_Z5printmcb+0x104>
        __putc(buffer[j]);
    800025c4:	fd040793          	addi	a5,s0,-48
    800025c8:	009787b3          	add	a5,a5,s1
    800025cc:	fe07c503          	lbu	a0,-32(a5)
    800025d0:	00002097          	auipc	ra,0x2
    800025d4:	74c080e7          	jalr	1868(ra) # 80004d1c <__putc>
    for(int j = i-1; j >= 0; j--)
    800025d8:	fff4849b          	addiw	s1,s1,-1
    800025dc:	fe5ff06f          	j	800025c0 <_Z5printmcb+0x78>
    }else{
    //__putc('\n');
    __putc('0');
    800025e0:	03000513          	li	a0,48
    800025e4:	00002097          	auipc	ra,0x2
    800025e8:	738080e7          	jalr	1848(ra) # 80004d1c <__putc>
    __putc('x');
    800025ec:	07800513          	li	a0,120
    800025f0:	00002097          	auipc	ra,0x2
    800025f4:	72c080e7          	jalr	1836(ra) # 80004d1c <__putc>
    
    unum1 = unum;
    i = 0;
    800025f8:	00000493          	li	s1,0
    800025fc:	00c0006f          	j	80002608 <_Z5printmcb+0xc0>
    do{
        buffer[i++] = '0' + unum1%16;
    80002600:	00068493          	mv	s1,a3
        unum1/=16;
    80002604:	00070913          	mv	s2,a4
        buffer[i++] = '0' + unum1%16;
    80002608:	00f97793          	andi	a5,s2,15
    8000260c:	0014869b          	addiw	a3,s1,1
    80002610:	03078793          	addi	a5,a5,48
    80002614:	fd040713          	addi	a4,s0,-48
    80002618:	00970733          	add	a4,a4,s1
    8000261c:	fef70023          	sb	a5,-32(a4)
        unum1/=16;
    80002620:	00495713          	srli	a4,s2,0x4
    } while(unum1 > 0);
    80002624:	00f00793          	li	a5,15
    80002628:	fd27ece3          	bltu	a5,s2,80002600 <_Z5printmcb+0xb8>
    for(int j = i-1; j >= 0; j--)
    8000262c:	0204c063          	bltz	s1,8000264c <_Z5printmcb+0x104>
        __putc(buffer[j]);
    80002630:	fd040793          	addi	a5,s0,-48
    80002634:	009787b3          	add	a5,a5,s1
    80002638:	fe07c503          	lbu	a0,-32(a5)
    8000263c:	00002097          	auipc	ra,0x2
    80002640:	6e0080e7          	jalr	1760(ra) # 80004d1c <__putc>
    for(int j = i-1; j >= 0; j--)
    80002644:	fff4849b          	addiw	s1,s1,-1
    80002648:	fe5ff06f          	j	8000262c <_Z5printmcb+0xe4>
    }
    __putc(end);
    8000264c:	000a0513          	mv	a0,s4
    80002650:	00002097          	auipc	ra,0x2
    80002654:	6cc080e7          	jalr	1740(ra) # 80004d1c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002658:	0009899b          	sext.w	s3,s3
    8000265c:	0029f993          	andi	s3,s3,2
    80002660:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002664:	1009a073          	csrs	sstatus,s3
}
    80002668:	05813083          	ld	ra,88(sp)
    8000266c:	05013403          	ld	s0,80(sp)
    80002670:	04813483          	ld	s1,72(sp)
    80002674:	04013903          	ld	s2,64(sp)
    80002678:	03813983          	ld	s3,56(sp)
    8000267c:	03013a03          	ld	s4,48(sp)
    80002680:	06010113          	addi	sp,sp,96
    80002684:	00008067          	ret

0000000080002688 <_Z5printPKcc>:

void print(const char* str, char end){
    80002688:	fc010113          	addi	sp,sp,-64
    8000268c:	02113c23          	sd	ra,56(sp)
    80002690:	02813823          	sd	s0,48(sp)
    80002694:	02913423          	sd	s1,40(sp)
    80002698:	03213023          	sd	s2,32(sp)
    8000269c:	01313c23          	sd	s3,24(sp)
    800026a0:	01413823          	sd	s4,16(sp)
    800026a4:	04010413          	addi	s0,sp,64
    800026a8:	00050913          	mv	s2,a0
    800026ac:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800026b0:	100027f3          	csrr	a5,sstatus
    800026b4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800026b8:	fc843983          	ld	s3,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800026bc:	00200793          	li	a5,2
    800026c0:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
    800026c4:	00000493          	li	s1,0
    800026c8:	009907b3          	add	a5,s2,s1
    800026cc:	0007c503          	lbu	a0,0(a5)
    800026d0:	00050a63          	beqz	a0,800026e4 <_Z5printPKcc+0x5c>
        __putc(str[i]);
    800026d4:	00002097          	auipc	ra,0x2
    800026d8:	648080e7          	jalr	1608(ra) # 80004d1c <__putc>
    for(int i = 0; str[i]; i++)
    800026dc:	0014849b          	addiw	s1,s1,1
    800026e0:	fe9ff06f          	j	800026c8 <_Z5printPKcc+0x40>
    __putc(end);
    800026e4:	000a0513          	mv	a0,s4
    800026e8:	00002097          	auipc	ra,0x2
    800026ec:	634080e7          	jalr	1588(ra) # 80004d1c <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800026f0:	0009899b          	sext.w	s3,s3
    800026f4:	0029f993          	andi	s3,s3,2
    800026f8:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800026fc:	1009a073          	csrs	sstatus,s3

}
    80002700:	03813083          	ld	ra,56(sp)
    80002704:	03013403          	ld	s0,48(sp)
    80002708:	02813483          	ld	s1,40(sp)
    8000270c:	02013903          	ld	s2,32(sp)
    80002710:	01813983          	ld	s3,24(sp)
    80002714:	01013a03          	ld	s4,16(sp)
    80002718:	04010113          	addi	sp,sp,64
    8000271c:	00008067          	ret

0000000080002720 <_Z5printPKcmb>:

void print(const char* str, uint64 t, bool hex){
    80002720:	fc010113          	addi	sp,sp,-64
    80002724:	02113c23          	sd	ra,56(sp)
    80002728:	02813823          	sd	s0,48(sp)
    8000272c:	02913423          	sd	s1,40(sp)
    80002730:	03213023          	sd	s2,32(sp)
    80002734:	01313c23          	sd	s3,24(sp)
    80002738:	04010413          	addi	s0,sp,64
    8000273c:	00058913          	mv	s2,a1
    80002740:	00060993          	mv	s3,a2
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002744:	100027f3          	csrr	a5,sstatus
    80002748:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    8000274c:	fc843483          	ld	s1,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    80002750:	00200793          	li	a5,2
    80002754:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    80002758:	02000593          	li	a1,32
    8000275c:	00000097          	auipc	ra,0x0
    80002760:	f2c080e7          	jalr	-212(ra) # 80002688 <_Z5printPKcc>
    print(t, '\n', hex);
    80002764:	00098613          	mv	a2,s3
    80002768:	00a00593          	li	a1,10
    8000276c:	00090513          	mv	a0,s2
    80002770:	00000097          	auipc	ra,0x0
    80002774:	dd8080e7          	jalr	-552(ra) # 80002548 <_Z5printmcb>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002778:	0004849b          	sext.w	s1,s1
    8000277c:	0024f493          	andi	s1,s1,2
    80002780:	0004849b          	sext.w	s1,s1
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002784:	1004a073          	csrs	sstatus,s1
}
    80002788:	03813083          	ld	ra,56(sp)
    8000278c:	03013403          	ld	s0,48(sp)
    80002790:	02813483          	ld	s1,40(sp)
    80002794:	02013903          	ld	s2,32(sp)
    80002798:	01813983          	ld	s3,24(sp)
    8000279c:	04010113          	addi	sp,sp,64
    800027a0:	00008067          	ret

00000000800027a4 <_Z9allocTestR15MemoryAllocatorm>:

void* allocTest(MemoryAllocator& allocator, size_t size){
    800027a4:	fe010113          	addi	sp,sp,-32
    800027a8:	00113c23          	sd	ra,24(sp)
    800027ac:	00813823          	sd	s0,16(sp)
    800027b0:	00913423          	sd	s1,8(sp)
    800027b4:	01213023          	sd	s2,0(sp)
    800027b8:	02010413          	addi	s0,sp,32
    800027bc:	00050493          	mv	s1,a0
    800027c0:	00058913          	mv	s2,a1
    print("\nAlokacija", ' ');
    800027c4:	02000593          	li	a1,32
    800027c8:	00003517          	auipc	a0,0x3
    800027cc:	af050513          	addi	a0,a0,-1296 # 800052b8 <CONSOLE_STATUS+0x2a8>
    800027d0:	00000097          	auipc	ra,0x0
    800027d4:	eb8080e7          	jalr	-328(ra) # 80002688 <_Z5printPKcc>
    print(size, ' ');
    800027d8:	00100613          	li	a2,1
    800027dc:	02000593          	li	a1,32
    800027e0:	00090513          	mv	a0,s2
    800027e4:	00000097          	auipc	ra,0x0
    800027e8:	d64080e7          	jalr	-668(ra) # 80002548 <_Z5printmcb>
    print("blokova");
    800027ec:	00a00593          	li	a1,10
    800027f0:	00003517          	auipc	a0,0x3
    800027f4:	ad850513          	addi	a0,a0,-1320 # 800052c8 <CONSOLE_STATUS+0x2b8>
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	e90080e7          	jalr	-368(ra) # 80002688 <_Z5printPKcc>
    char* newblc = (char*)allocator.mem_alloc(size);
    80002800:	00090593          	mv	a1,s2
    80002804:	00048513          	mv	a0,s1
    80002808:	fffff097          	auipc	ra,0xfffff
    8000280c:	480080e7          	jalr	1152(ra) # 80001c88 <_ZN15MemoryAllocator9mem_allocEm>
    80002810:	00050913          	mv	s2,a0
    allocator.print_list();  
    80002814:	00048513          	mv	a0,s1
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	6e0080e7          	jalr	1760(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>
    return newblc;
}
    80002820:	00090513          	mv	a0,s2
    80002824:	01813083          	ld	ra,24(sp)
    80002828:	01013403          	ld	s0,16(sp)
    8000282c:	00813483          	ld	s1,8(sp)
    80002830:	00013903          	ld	s2,0(sp)
    80002834:	02010113          	addi	sp,sp,32
    80002838:	00008067          	ret

000000008000283c <_Z8freeTestR15MemoryAllocatorPv>:

void freeTest(MemoryAllocator& allocator, void* adr){
    8000283c:	fe010113          	addi	sp,sp,-32
    80002840:	00113c23          	sd	ra,24(sp)
    80002844:	00813823          	sd	s0,16(sp)
    80002848:	00913423          	sd	s1,8(sp)
    8000284c:	01213023          	sd	s2,0(sp)
    80002850:	02010413          	addi	s0,sp,32
    80002854:	00050493          	mv	s1,a0
    80002858:	00058913          	mv	s2,a1
    print("\nDealogkacija");
    8000285c:	00a00593          	li	a1,10
    80002860:	00003517          	auipc	a0,0x3
    80002864:	a7050513          	addi	a0,a0,-1424 # 800052d0 <CONSOLE_STATUS+0x2c0>
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	e20080e7          	jalr	-480(ra) # 80002688 <_Z5printPKcc>
    if(allocator.mem_free(adr) < 0)
    80002870:	00090593          	mv	a1,s2
    80002874:	00048513          	mv	a0,s1
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	5a8080e7          	jalr	1448(ra) # 80001e20 <_ZN15MemoryAllocator8mem_freeEPv>
    80002880:	02054863          	bltz	a0,800028b0 <_Z8freeTestR15MemoryAllocatorPv+0x74>
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
    80002884:	00a00593          	li	a1,10
    80002888:	00003517          	auipc	a0,0x3
    8000288c:	a5850513          	addi	a0,a0,-1448 # 800052e0 <CONSOLE_STATUS+0x2d0>
    80002890:	00000097          	auipc	ra,0x0
    80002894:	df8080e7          	jalr	-520(ra) # 80002688 <_Z5printPKcc>
}
    80002898:	01813083          	ld	ra,24(sp)
    8000289c:	01013403          	ld	s0,16(sp)
    800028a0:	00813483          	ld	s1,8(sp)
    800028a4:	00013903          	ld	s2,0(sp)
    800028a8:	02010113          	addi	sp,sp,32
    800028ac:	00008067          	ret
        allocator.print_list();
    800028b0:	00048513          	mv	a0,s1
    800028b4:	fffff097          	auipc	ra,0xfffff
    800028b8:	644080e7          	jalr	1604(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>
    800028bc:	fddff06f          	j	80002898 <_Z8freeTestR15MemoryAllocatorPv+0x5c>

00000000800028c0 <_Z7memTestv>:

void memTest(){
    800028c0:	fe010113          	addi	sp,sp,-32
    800028c4:	00113c23          	sd	ra,24(sp)
    800028c8:	00813823          	sd	s0,16(sp)
    800028cc:	00913423          	sd	s1,8(sp)
    800028d0:	01213023          	sd	s2,0(sp)
    800028d4:	02010413          	addi	s0,sp,32
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	340080e7          	jalr	832(ra) # 80001c18 <_ZN15MemoryAllocator11getInstanceEv>
    800028e0:	00050493          	mv	s1,a0
    allocator.print_list();
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	614080e7          	jalr	1556(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(50);
    800028ec:	03200513          	li	a0,50
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	1dc080e7          	jalr	476(ra) # 80002acc <mem_alloc>
    
    allocator.print_list();
    800028f8:	00048513          	mv	a0,s1
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	5fc080e7          	jalr	1532(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>

    char* t = (char*)mem_alloc(100);
    80002904:	06400513          	li	a0,100
    80002908:	00000097          	auipc	ra,0x0
    8000290c:	1c4080e7          	jalr	452(ra) # 80002acc <mem_alloc>
    80002910:	00050913          	mv	s2,a0
    print("t:", (uint64)t, 0);
    80002914:	00000613          	li	a2,0
    80002918:	00050593          	mv	a1,a0
    8000291c:	00003517          	auipc	a0,0x3
    80002920:	9dc50513          	addi	a0,a0,-1572 # 800052f8 <CONSOLE_STATUS+0x2e8>
    80002924:	00000097          	auipc	ra,0x0
    80002928:	dfc080e7          	jalr	-516(ra) # 80002720 <_Z5printPKcmb>

    allocator.print_list();
    8000292c:	00048513          	mv	a0,s1
    80002930:	fffff097          	auipc	ra,0xfffff
    80002934:	5c8080e7          	jalr	1480(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(300);
    80002938:	12c00513          	li	a0,300
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	190080e7          	jalr	400(ra) # 80002acc <mem_alloc>

    allocator.print_list();
    80002944:	00048513          	mv	a0,s1
    80002948:	fffff097          	auipc	ra,0xfffff
    8000294c:	5b0080e7          	jalr	1456(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>
    
    print("free_res:", mem_free(t), 0);
    80002950:	00090513          	mv	a0,s2
    80002954:	00000097          	auipc	ra,0x0
    80002958:	1b0080e7          	jalr	432(ra) # 80002b04 <mem_free>
    8000295c:	00000613          	li	a2,0
    80002960:	00050593          	mv	a1,a0
    80002964:	00003517          	auipc	a0,0x3
    80002968:	99c50513          	addi	a0,a0,-1636 # 80005300 <CONSOLE_STATUS+0x2f0>
    8000296c:	00000097          	auipc	ra,0x0
    80002970:	db4080e7          	jalr	-588(ra) # 80002720 <_Z5printPKcmb>
    
    allocator.print_list();
    80002974:	00048513          	mv	a0,s1
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	580080e7          	jalr	1408(ra) # 80001ef8 <_ZN15MemoryAllocator10print_listEv>
}
    80002980:	01813083          	ld	ra,24(sp)
    80002984:	01013403          	ld	s0,16(sp)
    80002988:	00813483          	ld	s1,8(sp)
    8000298c:	00013903          	ld	s2,0(sp)
    80002990:	02010113          	addi	sp,sp,32
    80002994:	00008067          	ret

0000000080002998 <_Z8print_a0v>:

void print_a0(){
    80002998:	fe010113          	addi	sp,sp,-32
    8000299c:	00113c23          	sd	ra,24(sp)
    800029a0:	00813823          	sd	s0,16(sp)
    800029a4:	00913423          	sd	s1,8(sp)
    800029a8:	02010413          	addi	s0,sp,32
    asm volatile("mv %0, a0" : "=r" (a0));
    800029ac:	00050493          	mv	s1,a0
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    800029b0:	02000593          	li	a1,32
    800029b4:	00003517          	auipc	a0,0x3
    800029b8:	95c50513          	addi	a0,a0,-1700 # 80005310 <CONSOLE_STATUS+0x300>
    800029bc:	00000097          	auipc	ra,0x0
    800029c0:	ccc080e7          	jalr	-820(ra) # 80002688 <_Z5printPKcc>
    print(a0, '\n', 1);
    800029c4:	00100613          	li	a2,1
    800029c8:	00a00593          	li	a1,10
    800029cc:	00048513          	mv	a0,s1
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	b78080e7          	jalr	-1160(ra) # 80002548 <_Z5printmcb>
    //asm volatile("mv a0, %0" : : "r" (a0));
}
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	02010113          	addi	sp,sp,32
    800029e8:	00008067          	ret

00000000800029ec <_Z19print_sup_registersv>:

void print_sup_registers(){ 
    800029ec:	fd010113          	addi	sp,sp,-48
    800029f0:	02113423          	sd	ra,40(sp)
    800029f4:	02813023          	sd	s0,32(sp)
    800029f8:	03010413          	addi	s0,sp,48

    print("sstatus:",' ');
    800029fc:	02000593          	li	a1,32
    80002a00:	00003517          	auipc	a0,0x3
    80002a04:	91850513          	addi	a0,a0,-1768 # 80005318 <CONSOLE_STATUS+0x308>
    80002a08:	00000097          	auipc	ra,0x0
    80002a0c:	c80080e7          	jalr	-896(ra) # 80002688 <_Z5printPKcc>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002a10:	100027f3          	csrr	a5,sstatus
    80002a14:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80002a18:	fe843503          	ld	a0,-24(s0)
    print(Riscv::r_sstatus(), '\n', 1);
    80002a1c:	00100613          	li	a2,1
    80002a20:	00a00593          	li	a1,10
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	b24080e7          	jalr	-1244(ra) # 80002548 <_Z5printmcb>

    print("sip:",' ');
    80002a2c:	02000593          	li	a1,32
    80002a30:	00003517          	auipc	a0,0x3
    80002a34:	8f850513          	addi	a0,a0,-1800 # 80005328 <CONSOLE_STATUS+0x318>
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	c50080e7          	jalr	-944(ra) # 80002688 <_Z5printPKcc>
    asm volatile("csrr %0, sip" : "=r" (sip));
    80002a40:	144027f3          	csrr	a5,sip
    80002a44:	fef43023          	sd	a5,-32(s0)
    return sip;
    80002a48:	fe043503          	ld	a0,-32(s0)
    print(Riscv::r_sip(), '\n', 1);
    80002a4c:	00100613          	li	a2,1
    80002a50:	00a00593          	li	a1,10
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	af4080e7          	jalr	-1292(ra) # 80002548 <_Z5printmcb>

    print("stval:",' ');
    80002a5c:	02000593          	li	a1,32
    80002a60:	00003517          	auipc	a0,0x3
    80002a64:	8d050513          	addi	a0,a0,-1840 # 80005330 <CONSOLE_STATUS+0x320>
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	c20080e7          	jalr	-992(ra) # 80002688 <_Z5printPKcc>
    asm volatile("csrr %0, stval" : "=r" (stval));
    80002a70:	143027f3          	csrr	a5,stval
    80002a74:	fcf43c23          	sd	a5,-40(s0)
    return stval;
    80002a78:	fd843503          	ld	a0,-40(s0)
    print(Riscv::r_stval(), '\n', 1);
    80002a7c:	00100613          	li	a2,1
    80002a80:	00a00593          	li	a1,10
    80002a84:	00000097          	auipc	ra,0x0
    80002a88:	ac4080e7          	jalr	-1340(ra) # 80002548 <_Z5printmcb>

    print("scause:",' ');
    80002a8c:	02000593          	li	a1,32
    80002a90:	00003517          	auipc	a0,0x3
    80002a94:	8a850513          	addi	a0,a0,-1880 # 80005338 <CONSOLE_STATUS+0x328>
    80002a98:	00000097          	auipc	ra,0x0
    80002a9c:	bf0080e7          	jalr	-1040(ra) # 80002688 <_Z5printPKcc>
    asm volatile("csrr %0, scause" : "=r" (scause));
    80002aa0:	142027f3          	csrr	a5,scause
    80002aa4:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80002aa8:	fd043503          	ld	a0,-48(s0)
    print(Riscv::r_scause(), '\n', 1);
    80002aac:	00100613          	li	a2,1
    80002ab0:	00a00593          	li	a1,10
    80002ab4:	00000097          	auipc	ra,0x0
    80002ab8:	a94080e7          	jalr	-1388(ra) # 80002548 <_Z5printmcb>
}
    80002abc:	02813083          	ld	ra,40(sp)
    80002ac0:	02013403          	ld	s0,32(sp)
    80002ac4:	03010113          	addi	sp,sp,48
    80002ac8:	00008067          	ret

0000000080002acc <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.hpp"
#include"../../h/testing.hpp"
extern "C" void* mem_alloc(size_t size){
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00813423          	sd	s0,8(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80002ad8:	fff50513          	addi	a0,a0,-1
    80002adc:	00655513          	srli	a0,a0,0x6
    80002ae0:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80002ae4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80002ae8:	00100793          	li	a5,1
    80002aec:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002af0:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80002af4:	00050513          	mv	a0,a0
    
    return adr;  
}
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <mem_free>:

extern "C" int mem_free (void* adr){
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00813423          	sd	s0,8(sp)
    80002b0c:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80002b10:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80002b14:	00200793          	li	a5,2
    80002b18:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002b1c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80002b20:	00050513          	mv	a0,a0
    
    return ret;
}
    80002b24:	0005051b          	sext.w	a0,a0
    80002b28:	00813403          	ld	s0,8(sp)
    80002b2c:	01010113          	addi	sp,sp,16
    80002b30:	00008067          	ret

0000000080002b34 <thread_dispatch>:

extern "C" void thread_dispatch(){
    80002b34:	ff010113          	addi	sp,sp,-16
    80002b38:	00813423          	sd	s0,8(sp)
    80002b3c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    80002b40:	01300793          	li	a5,19
    80002b44:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002b48:	00000073          	ecall
}
    80002b4c:	00813403          	ld	s0,8(sp)
    80002b50:	01010113          	addi	sp,sp,16
    80002b54:	00008067          	ret

0000000080002b58 <thread_create>:


extern "C" int thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg){
   
    if(handle == nullptr) return -1;
    80002b58:	06050e63          	beqz	a0,80002bd4 <thread_create+0x7c>
    if(start_routine == nullptr) return -2;
    80002b5c:	08058063          	beqz	a1,80002bdc <thread_create+0x84>
    void(*start_routine)(void*), void* arg){
    80002b60:	fd010113          	addi	sp,sp,-48
    80002b64:	02113423          	sd	ra,40(sp)
    80002b68:	02813023          	sd	s0,32(sp)
    80002b6c:	00913c23          	sd	s1,24(sp)
    80002b70:	01213823          	sd	s2,16(sp)
    80002b74:	01313423          	sd	s3,8(sp)
    80002b78:	03010413          	addi	s0,sp,48
    80002b7c:	00060993          	mv	s3,a2
    80002b80:	00058913          	mv	s2,a1
    80002b84:	00050493          	mv	s1,a0

    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80002b88:	00001537          	lui	a0,0x1
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	f40080e7          	jalr	-192(ra) # 80002acc <mem_alloc>
    if(stack_space == nullptr) return -3;
    80002b94:	04050863          	beqz	a0,80002be4 <thread_create+0x8c>
    //print("stack_space:", (uint64)stack_space, 0);

    int ret = 0;

    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    80002b98:	00050713          	mv	a4,a0
    asm volatile("li a0, 0x11");
    80002b9c:	01100513          	li	a0,17
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    80002ba0:	00048593          	mv	a1,s1
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    80002ba4:	00090613          	mv	a2,s2
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    80002ba8:	00098693          	mv	a3,s3
    
    asm volatile("ecall");   
    80002bac:	00000073          	ecall

    asm volatile("mv %0, a0" : "=r" (ret));
    80002bb0:	00050513          	mv	a0,a0
    80002bb4:	0005051b          	sext.w	a0,a0
    return ret;
}
    80002bb8:	02813083          	ld	ra,40(sp)
    80002bbc:	02013403          	ld	s0,32(sp)
    80002bc0:	01813483          	ld	s1,24(sp)
    80002bc4:	01013903          	ld	s2,16(sp)
    80002bc8:	00813983          	ld	s3,8(sp)
    80002bcc:	03010113          	addi	sp,sp,48
    80002bd0:	00008067          	ret
    if(handle == nullptr) return -1;
    80002bd4:	fff00513          	li	a0,-1
    80002bd8:	00008067          	ret
    if(start_routine == nullptr) return -2;
    80002bdc:	ffe00513          	li	a0,-2
}
    80002be0:	00008067          	ret
    if(stack_space == nullptr) return -3;
    80002be4:	ffd00513          	li	a0,-3
    80002be8:	fd1ff06f          	j	80002bb8 <thread_create+0x60>

0000000080002bec <thread_exit>:

extern "C" int thread_exit(){
    80002bec:	ff010113          	addi	sp,sp,-16
    80002bf0:	00813423          	sd	s0,8(sp)
    80002bf4:	01010413          	addi	s0,sp,16
    int ret = 0;

    asm volatile("li a0, 0x12");
    80002bf8:	01200513          	li	a0,18
    asm volatile("ecall");
    80002bfc:	00000073          	ecall

    return ret;
    80002c00:	00000513          	li	a0,0
    80002c04:	00813403          	ld	s0,8(sp)
    80002c08:	01010113          	addi	sp,sp,16
    80002c0c:	00008067          	ret

0000000080002c10 <_ZN10KSemaphore4waitEv>:
#include"../../h/ksemaphore.hpp"

void KSemaphore::wait(){
    if(val > 0)
    80002c10:	00052783          	lw	a5,0(a0) # 1000 <_entry-0x7ffff000>
    80002c14:	00078863          	beqz	a5,80002c24 <_ZN10KSemaphore4waitEv+0x14>
        val--;
    80002c18:	fff7879b          	addiw	a5,a5,-1
    80002c1c:	00f52023          	sw	a5,0(a0)
    80002c20:	00008067          	ret
void KSemaphore::wait(){
    80002c24:	ff010113          	addi	sp,sp,-16
    80002c28:	00113423          	sd	ra,8(sp)
    80002c2c:	00813023          	sd	s0,0(sp)
    80002c30:	01010413          	addi	s0,sp,16
    else{
        TCB::running->setState(TCB::BLOCKED);
    80002c34:	00003797          	auipc	a5,0x3
    80002c38:	2a478793          	addi	a5,a5,676 # 80005ed8 <_ZN3TCB7runningE>
    80002c3c:	0007b783          	ld	a5,0(a5)
        if(!allocator.invalidFreeAddress(this))
            allocator.mem_free(stack);
    }
    
    //da li je thread zavrsen
    void setState(TCBState s) {state = s;}
    80002c40:	0207a023          	sw	zero,32(a5)
        TCB::dispatch();
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	744080e7          	jalr	1860(ra) # 80002388 <_ZN3TCB8dispatchEv>
        
    }
    80002c4c:	00813083          	ld	ra,8(sp)
    80002c50:	00013403          	ld	s0,0(sp)
    80002c54:	01010113          	addi	sp,sp,16
    80002c58:	00008067          	ret

0000000080002c5c <start>:
    80002c5c:	ff010113          	addi	sp,sp,-16
    80002c60:	00813423          	sd	s0,8(sp)
    80002c64:	01010413          	addi	s0,sp,16
    80002c68:	300027f3          	csrr	a5,mstatus
    80002c6c:	ffffe737          	lui	a4,0xffffe
    80002c70:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff767f>
    80002c74:	00e7f7b3          	and	a5,a5,a4
    80002c78:	00001737          	lui	a4,0x1
    80002c7c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002c80:	00e7e7b3          	or	a5,a5,a4
    80002c84:	30079073          	csrw	mstatus,a5
    80002c88:	00000797          	auipc	a5,0x0
    80002c8c:	16078793          	addi	a5,a5,352 # 80002de8 <system_main>
    80002c90:	34179073          	csrw	mepc,a5
    80002c94:	00000793          	li	a5,0
    80002c98:	18079073          	csrw	satp,a5
    80002c9c:	000107b7          	lui	a5,0x10
    80002ca0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002ca4:	30279073          	csrw	medeleg,a5
    80002ca8:	30379073          	csrw	mideleg,a5
    80002cac:	104027f3          	csrr	a5,sie
    80002cb0:	2227e793          	ori	a5,a5,546
    80002cb4:	10479073          	csrw	sie,a5
    80002cb8:	fff00793          	li	a5,-1
    80002cbc:	00a7d793          	srli	a5,a5,0xa
    80002cc0:	3b079073          	csrw	pmpaddr0,a5
    80002cc4:	00f00793          	li	a5,15
    80002cc8:	3a079073          	csrw	pmpcfg0,a5
    80002ccc:	f14027f3          	csrr	a5,mhartid
    80002cd0:	0200c737          	lui	a4,0x200c
    80002cd4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002cd8:	0007869b          	sext.w	a3,a5
    80002cdc:	00269713          	slli	a4,a3,0x2
    80002ce0:	000f4637          	lui	a2,0xf4
    80002ce4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002ce8:	00d70733          	add	a4,a4,a3
    80002cec:	0037979b          	slliw	a5,a5,0x3
    80002cf0:	020046b7          	lui	a3,0x2004
    80002cf4:	00d787b3          	add	a5,a5,a3
    80002cf8:	00c585b3          	add	a1,a1,a2
    80002cfc:	00371693          	slli	a3,a4,0x3
    80002d00:	00003717          	auipc	a4,0x3
    80002d04:	22070713          	addi	a4,a4,544 # 80005f20 <timer_scratch>
    80002d08:	00b7b023          	sd	a1,0(a5)
    80002d0c:	00d70733          	add	a4,a4,a3
    80002d10:	00f73c23          	sd	a5,24(a4)
    80002d14:	02c73023          	sd	a2,32(a4)
    80002d18:	34071073          	csrw	mscratch,a4
    80002d1c:	00000797          	auipc	a5,0x0
    80002d20:	6e478793          	addi	a5,a5,1764 # 80003400 <timervec>
    80002d24:	30579073          	csrw	mtvec,a5
    80002d28:	300027f3          	csrr	a5,mstatus
    80002d2c:	0087e793          	ori	a5,a5,8
    80002d30:	30079073          	csrw	mstatus,a5
    80002d34:	304027f3          	csrr	a5,mie
    80002d38:	0807e793          	ori	a5,a5,128
    80002d3c:	30479073          	csrw	mie,a5
    80002d40:	f14027f3          	csrr	a5,mhartid
    80002d44:	0007879b          	sext.w	a5,a5
    80002d48:	00078213          	mv	tp,a5
    80002d4c:	30200073          	mret
    80002d50:	00813403          	ld	s0,8(sp)
    80002d54:	01010113          	addi	sp,sp,16
    80002d58:	00008067          	ret

0000000080002d5c <timerinit>:
    80002d5c:	ff010113          	addi	sp,sp,-16
    80002d60:	00813423          	sd	s0,8(sp)
    80002d64:	01010413          	addi	s0,sp,16
    80002d68:	f14027f3          	csrr	a5,mhartid
    80002d6c:	0200c737          	lui	a4,0x200c
    80002d70:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002d74:	0007869b          	sext.w	a3,a5
    80002d78:	00269713          	slli	a4,a3,0x2
    80002d7c:	000f4637          	lui	a2,0xf4
    80002d80:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002d84:	00d70733          	add	a4,a4,a3
    80002d88:	0037979b          	slliw	a5,a5,0x3
    80002d8c:	020046b7          	lui	a3,0x2004
    80002d90:	00d787b3          	add	a5,a5,a3
    80002d94:	00c585b3          	add	a1,a1,a2
    80002d98:	00371693          	slli	a3,a4,0x3
    80002d9c:	00003717          	auipc	a4,0x3
    80002da0:	18470713          	addi	a4,a4,388 # 80005f20 <timer_scratch>
    80002da4:	00b7b023          	sd	a1,0(a5)
    80002da8:	00d70733          	add	a4,a4,a3
    80002dac:	00f73c23          	sd	a5,24(a4)
    80002db0:	02c73023          	sd	a2,32(a4)
    80002db4:	34071073          	csrw	mscratch,a4
    80002db8:	00000797          	auipc	a5,0x0
    80002dbc:	64878793          	addi	a5,a5,1608 # 80003400 <timervec>
    80002dc0:	30579073          	csrw	mtvec,a5
    80002dc4:	300027f3          	csrr	a5,mstatus
    80002dc8:	0087e793          	ori	a5,a5,8
    80002dcc:	30079073          	csrw	mstatus,a5
    80002dd0:	304027f3          	csrr	a5,mie
    80002dd4:	0807e793          	ori	a5,a5,128
    80002dd8:	30479073          	csrw	mie,a5
    80002ddc:	00813403          	ld	s0,8(sp)
    80002de0:	01010113          	addi	sp,sp,16
    80002de4:	00008067          	ret

0000000080002de8 <system_main>:
    80002de8:	fe010113          	addi	sp,sp,-32
    80002dec:	00813823          	sd	s0,16(sp)
    80002df0:	00913423          	sd	s1,8(sp)
    80002df4:	00113c23          	sd	ra,24(sp)
    80002df8:	02010413          	addi	s0,sp,32
    80002dfc:	00000097          	auipc	ra,0x0
    80002e00:	0c4080e7          	jalr	196(ra) # 80002ec0 <cpuid>
    80002e04:	00003497          	auipc	s1,0x3
    80002e08:	0dc48493          	addi	s1,s1,220 # 80005ee0 <started>
    80002e0c:	02050263          	beqz	a0,80002e30 <system_main+0x48>
    80002e10:	0004a783          	lw	a5,0(s1)
    80002e14:	0007879b          	sext.w	a5,a5
    80002e18:	fe078ce3          	beqz	a5,80002e10 <system_main+0x28>
    80002e1c:	0ff0000f          	fence
    80002e20:	00002517          	auipc	a0,0x2
    80002e24:	55050513          	addi	a0,a0,1360 # 80005370 <CONSOLE_STATUS+0x360>
    80002e28:	00001097          	auipc	ra,0x1
    80002e2c:	a74080e7          	jalr	-1420(ra) # 8000389c <panic>
    80002e30:	00001097          	auipc	ra,0x1
    80002e34:	9c8080e7          	jalr	-1592(ra) # 800037f8 <consoleinit>
    80002e38:	00001097          	auipc	ra,0x1
    80002e3c:	154080e7          	jalr	340(ra) # 80003f8c <printfinit>
    80002e40:	00002517          	auipc	a0,0x2
    80002e44:	2c850513          	addi	a0,a0,712 # 80005108 <CONSOLE_STATUS+0xf8>
    80002e48:	00001097          	auipc	ra,0x1
    80002e4c:	ab0080e7          	jalr	-1360(ra) # 800038f8 <__printf>
    80002e50:	00002517          	auipc	a0,0x2
    80002e54:	4f050513          	addi	a0,a0,1264 # 80005340 <CONSOLE_STATUS+0x330>
    80002e58:	00001097          	auipc	ra,0x1
    80002e5c:	aa0080e7          	jalr	-1376(ra) # 800038f8 <__printf>
    80002e60:	00002517          	auipc	a0,0x2
    80002e64:	2a850513          	addi	a0,a0,680 # 80005108 <CONSOLE_STATUS+0xf8>
    80002e68:	00001097          	auipc	ra,0x1
    80002e6c:	a90080e7          	jalr	-1392(ra) # 800038f8 <__printf>
    80002e70:	00001097          	auipc	ra,0x1
    80002e74:	4a8080e7          	jalr	1192(ra) # 80004318 <kinit>
    80002e78:	00000097          	auipc	ra,0x0
    80002e7c:	148080e7          	jalr	328(ra) # 80002fc0 <trapinit>
    80002e80:	00000097          	auipc	ra,0x0
    80002e84:	16c080e7          	jalr	364(ra) # 80002fec <trapinithart>
    80002e88:	00000097          	auipc	ra,0x0
    80002e8c:	5b8080e7          	jalr	1464(ra) # 80003440 <plicinit>
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	5d8080e7          	jalr	1496(ra) # 80003468 <plicinithart>
    80002e98:	00000097          	auipc	ra,0x0
    80002e9c:	078080e7          	jalr	120(ra) # 80002f10 <userinit>
    80002ea0:	0ff0000f          	fence
    80002ea4:	00100793          	li	a5,1
    80002ea8:	00002517          	auipc	a0,0x2
    80002eac:	4b050513          	addi	a0,a0,1200 # 80005358 <CONSOLE_STATUS+0x348>
    80002eb0:	00f4a023          	sw	a5,0(s1)
    80002eb4:	00001097          	auipc	ra,0x1
    80002eb8:	a44080e7          	jalr	-1468(ra) # 800038f8 <__printf>
    80002ebc:	0000006f          	j	80002ebc <system_main+0xd4>

0000000080002ec0 <cpuid>:
    80002ec0:	ff010113          	addi	sp,sp,-16
    80002ec4:	00813423          	sd	s0,8(sp)
    80002ec8:	01010413          	addi	s0,sp,16
    80002ecc:	00020513          	mv	a0,tp
    80002ed0:	00813403          	ld	s0,8(sp)
    80002ed4:	0005051b          	sext.w	a0,a0
    80002ed8:	01010113          	addi	sp,sp,16
    80002edc:	00008067          	ret

0000000080002ee0 <mycpu>:
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00813423          	sd	s0,8(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    80002eec:	00020793          	mv	a5,tp
    80002ef0:	00813403          	ld	s0,8(sp)
    80002ef4:	0007879b          	sext.w	a5,a5
    80002ef8:	00779793          	slli	a5,a5,0x7
    80002efc:	00004517          	auipc	a0,0x4
    80002f00:	05450513          	addi	a0,a0,84 # 80006f50 <cpus>
    80002f04:	00f50533          	add	a0,a0,a5
    80002f08:	01010113          	addi	sp,sp,16
    80002f0c:	00008067          	ret

0000000080002f10 <userinit>:
    80002f10:	ff010113          	addi	sp,sp,-16
    80002f14:	00813423          	sd	s0,8(sp)
    80002f18:	01010413          	addi	s0,sp,16
    80002f1c:	00813403          	ld	s0,8(sp)
    80002f20:	01010113          	addi	sp,sp,16
    80002f24:	fffff317          	auipc	t1,0xfffff
    80002f28:	9c830067          	jr	-1592(t1) # 800018ec <main>

0000000080002f2c <either_copyout>:
    80002f2c:	ff010113          	addi	sp,sp,-16
    80002f30:	00813023          	sd	s0,0(sp)
    80002f34:	00113423          	sd	ra,8(sp)
    80002f38:	01010413          	addi	s0,sp,16
    80002f3c:	02051663          	bnez	a0,80002f68 <either_copyout+0x3c>
    80002f40:	00058513          	mv	a0,a1
    80002f44:	00060593          	mv	a1,a2
    80002f48:	0006861b          	sext.w	a2,a3
    80002f4c:	00002097          	auipc	ra,0x2
    80002f50:	c58080e7          	jalr	-936(ra) # 80004ba4 <__memmove>
    80002f54:	00813083          	ld	ra,8(sp)
    80002f58:	00013403          	ld	s0,0(sp)
    80002f5c:	00000513          	li	a0,0
    80002f60:	01010113          	addi	sp,sp,16
    80002f64:	00008067          	ret
    80002f68:	00002517          	auipc	a0,0x2
    80002f6c:	43050513          	addi	a0,a0,1072 # 80005398 <CONSOLE_STATUS+0x388>
    80002f70:	00001097          	auipc	ra,0x1
    80002f74:	92c080e7          	jalr	-1748(ra) # 8000389c <panic>

0000000080002f78 <either_copyin>:
    80002f78:	ff010113          	addi	sp,sp,-16
    80002f7c:	00813023          	sd	s0,0(sp)
    80002f80:	00113423          	sd	ra,8(sp)
    80002f84:	01010413          	addi	s0,sp,16
    80002f88:	02059463          	bnez	a1,80002fb0 <either_copyin+0x38>
    80002f8c:	00060593          	mv	a1,a2
    80002f90:	0006861b          	sext.w	a2,a3
    80002f94:	00002097          	auipc	ra,0x2
    80002f98:	c10080e7          	jalr	-1008(ra) # 80004ba4 <__memmove>
    80002f9c:	00813083          	ld	ra,8(sp)
    80002fa0:	00013403          	ld	s0,0(sp)
    80002fa4:	00000513          	li	a0,0
    80002fa8:	01010113          	addi	sp,sp,16
    80002fac:	00008067          	ret
    80002fb0:	00002517          	auipc	a0,0x2
    80002fb4:	41050513          	addi	a0,a0,1040 # 800053c0 <CONSOLE_STATUS+0x3b0>
    80002fb8:	00001097          	auipc	ra,0x1
    80002fbc:	8e4080e7          	jalr	-1820(ra) # 8000389c <panic>

0000000080002fc0 <trapinit>:
    80002fc0:	ff010113          	addi	sp,sp,-16
    80002fc4:	00813423          	sd	s0,8(sp)
    80002fc8:	01010413          	addi	s0,sp,16
    80002fcc:	00813403          	ld	s0,8(sp)
    80002fd0:	00002597          	auipc	a1,0x2
    80002fd4:	41858593          	addi	a1,a1,1048 # 800053e8 <CONSOLE_STATUS+0x3d8>
    80002fd8:	00004517          	auipc	a0,0x4
    80002fdc:	ff850513          	addi	a0,a0,-8 # 80006fd0 <tickslock>
    80002fe0:	01010113          	addi	sp,sp,16
    80002fe4:	00001317          	auipc	t1,0x1
    80002fe8:	5c430067          	jr	1476(t1) # 800045a8 <initlock>

0000000080002fec <trapinithart>:
    80002fec:	ff010113          	addi	sp,sp,-16
    80002ff0:	00813423          	sd	s0,8(sp)
    80002ff4:	01010413          	addi	s0,sp,16
    80002ff8:	00000797          	auipc	a5,0x0
    80002ffc:	2f878793          	addi	a5,a5,760 # 800032f0 <kernelvec>
    80003000:	10579073          	csrw	stvec,a5
    80003004:	00813403          	ld	s0,8(sp)
    80003008:	01010113          	addi	sp,sp,16
    8000300c:	00008067          	ret

0000000080003010 <usertrap>:
    80003010:	ff010113          	addi	sp,sp,-16
    80003014:	00813423          	sd	s0,8(sp)
    80003018:	01010413          	addi	s0,sp,16
    8000301c:	00813403          	ld	s0,8(sp)
    80003020:	01010113          	addi	sp,sp,16
    80003024:	00008067          	ret

0000000080003028 <usertrapret>:
    80003028:	ff010113          	addi	sp,sp,-16
    8000302c:	00813423          	sd	s0,8(sp)
    80003030:	01010413          	addi	s0,sp,16
    80003034:	00813403          	ld	s0,8(sp)
    80003038:	01010113          	addi	sp,sp,16
    8000303c:	00008067          	ret

0000000080003040 <kerneltrap>:
    80003040:	fe010113          	addi	sp,sp,-32
    80003044:	00813823          	sd	s0,16(sp)
    80003048:	00113c23          	sd	ra,24(sp)
    8000304c:	00913423          	sd	s1,8(sp)
    80003050:	02010413          	addi	s0,sp,32
    80003054:	142025f3          	csrr	a1,scause
    80003058:	100027f3          	csrr	a5,sstatus
    8000305c:	0027f793          	andi	a5,a5,2
    80003060:	10079c63          	bnez	a5,80003178 <kerneltrap+0x138>
    80003064:	142027f3          	csrr	a5,scause
    80003068:	0207ce63          	bltz	a5,800030a4 <kerneltrap+0x64>
    8000306c:	00002517          	auipc	a0,0x2
    80003070:	3c450513          	addi	a0,a0,964 # 80005430 <CONSOLE_STATUS+0x420>
    80003074:	00001097          	auipc	ra,0x1
    80003078:	884080e7          	jalr	-1916(ra) # 800038f8 <__printf>
    8000307c:	141025f3          	csrr	a1,sepc
    80003080:	14302673          	csrr	a2,stval
    80003084:	00002517          	auipc	a0,0x2
    80003088:	3bc50513          	addi	a0,a0,956 # 80005440 <CONSOLE_STATUS+0x430>
    8000308c:	00001097          	auipc	ra,0x1
    80003090:	86c080e7          	jalr	-1940(ra) # 800038f8 <__printf>
    80003094:	00002517          	auipc	a0,0x2
    80003098:	3c450513          	addi	a0,a0,964 # 80005458 <CONSOLE_STATUS+0x448>
    8000309c:	00001097          	auipc	ra,0x1
    800030a0:	800080e7          	jalr	-2048(ra) # 8000389c <panic>
    800030a4:	0ff7f713          	andi	a4,a5,255
    800030a8:	00900693          	li	a3,9
    800030ac:	04d70063          	beq	a4,a3,800030ec <kerneltrap+0xac>
    800030b0:	fff00713          	li	a4,-1
    800030b4:	03f71713          	slli	a4,a4,0x3f
    800030b8:	00170713          	addi	a4,a4,1
    800030bc:	fae798e3          	bne	a5,a4,8000306c <kerneltrap+0x2c>
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	e00080e7          	jalr	-512(ra) # 80002ec0 <cpuid>
    800030c8:	06050663          	beqz	a0,80003134 <kerneltrap+0xf4>
    800030cc:	144027f3          	csrr	a5,sip
    800030d0:	ffd7f793          	andi	a5,a5,-3
    800030d4:	14479073          	csrw	sip,a5
    800030d8:	01813083          	ld	ra,24(sp)
    800030dc:	01013403          	ld	s0,16(sp)
    800030e0:	00813483          	ld	s1,8(sp)
    800030e4:	02010113          	addi	sp,sp,32
    800030e8:	00008067          	ret
    800030ec:	00000097          	auipc	ra,0x0
    800030f0:	3c8080e7          	jalr	968(ra) # 800034b4 <plic_claim>
    800030f4:	00a00793          	li	a5,10
    800030f8:	00050493          	mv	s1,a0
    800030fc:	06f50863          	beq	a0,a5,8000316c <kerneltrap+0x12c>
    80003100:	fc050ce3          	beqz	a0,800030d8 <kerneltrap+0x98>
    80003104:	00050593          	mv	a1,a0
    80003108:	00002517          	auipc	a0,0x2
    8000310c:	30850513          	addi	a0,a0,776 # 80005410 <CONSOLE_STATUS+0x400>
    80003110:	00000097          	auipc	ra,0x0
    80003114:	7e8080e7          	jalr	2024(ra) # 800038f8 <__printf>
    80003118:	01013403          	ld	s0,16(sp)
    8000311c:	01813083          	ld	ra,24(sp)
    80003120:	00048513          	mv	a0,s1
    80003124:	00813483          	ld	s1,8(sp)
    80003128:	02010113          	addi	sp,sp,32
    8000312c:	00000317          	auipc	t1,0x0
    80003130:	3c030067          	jr	960(t1) # 800034ec <plic_complete>
    80003134:	00004517          	auipc	a0,0x4
    80003138:	e9c50513          	addi	a0,a0,-356 # 80006fd0 <tickslock>
    8000313c:	00001097          	auipc	ra,0x1
    80003140:	490080e7          	jalr	1168(ra) # 800045cc <acquire>
    80003144:	00003717          	auipc	a4,0x3
    80003148:	da070713          	addi	a4,a4,-608 # 80005ee4 <ticks>
    8000314c:	00072783          	lw	a5,0(a4)
    80003150:	00004517          	auipc	a0,0x4
    80003154:	e8050513          	addi	a0,a0,-384 # 80006fd0 <tickslock>
    80003158:	0017879b          	addiw	a5,a5,1
    8000315c:	00f72023          	sw	a5,0(a4)
    80003160:	00001097          	auipc	ra,0x1
    80003164:	538080e7          	jalr	1336(ra) # 80004698 <release>
    80003168:	f65ff06f          	j	800030cc <kerneltrap+0x8c>
    8000316c:	00001097          	auipc	ra,0x1
    80003170:	094080e7          	jalr	148(ra) # 80004200 <uartintr>
    80003174:	fa5ff06f          	j	80003118 <kerneltrap+0xd8>
    80003178:	00002517          	auipc	a0,0x2
    8000317c:	27850513          	addi	a0,a0,632 # 800053f0 <CONSOLE_STATUS+0x3e0>
    80003180:	00000097          	auipc	ra,0x0
    80003184:	71c080e7          	jalr	1820(ra) # 8000389c <panic>

0000000080003188 <clockintr>:
    80003188:	fe010113          	addi	sp,sp,-32
    8000318c:	00813823          	sd	s0,16(sp)
    80003190:	00913423          	sd	s1,8(sp)
    80003194:	00113c23          	sd	ra,24(sp)
    80003198:	02010413          	addi	s0,sp,32
    8000319c:	00004497          	auipc	s1,0x4
    800031a0:	e3448493          	addi	s1,s1,-460 # 80006fd0 <tickslock>
    800031a4:	00048513          	mv	a0,s1
    800031a8:	00001097          	auipc	ra,0x1
    800031ac:	424080e7          	jalr	1060(ra) # 800045cc <acquire>
    800031b0:	00003717          	auipc	a4,0x3
    800031b4:	d3470713          	addi	a4,a4,-716 # 80005ee4 <ticks>
    800031b8:	00072783          	lw	a5,0(a4)
    800031bc:	01013403          	ld	s0,16(sp)
    800031c0:	01813083          	ld	ra,24(sp)
    800031c4:	00048513          	mv	a0,s1
    800031c8:	0017879b          	addiw	a5,a5,1
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	00f72023          	sw	a5,0(a4)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00001317          	auipc	t1,0x1
    800031dc:	4c030067          	jr	1216(t1) # 80004698 <release>

00000000800031e0 <devintr>:
    800031e0:	142027f3          	csrr	a5,scause
    800031e4:	00000513          	li	a0,0
    800031e8:	0007c463          	bltz	a5,800031f0 <devintr+0x10>
    800031ec:	00008067          	ret
    800031f0:	fe010113          	addi	sp,sp,-32
    800031f4:	00813823          	sd	s0,16(sp)
    800031f8:	00113c23          	sd	ra,24(sp)
    800031fc:	00913423          	sd	s1,8(sp)
    80003200:	02010413          	addi	s0,sp,32
    80003204:	0ff7f713          	andi	a4,a5,255
    80003208:	00900693          	li	a3,9
    8000320c:	04d70c63          	beq	a4,a3,80003264 <devintr+0x84>
    80003210:	fff00713          	li	a4,-1
    80003214:	03f71713          	slli	a4,a4,0x3f
    80003218:	00170713          	addi	a4,a4,1
    8000321c:	00e78c63          	beq	a5,a4,80003234 <devintr+0x54>
    80003220:	01813083          	ld	ra,24(sp)
    80003224:	01013403          	ld	s0,16(sp)
    80003228:	00813483          	ld	s1,8(sp)
    8000322c:	02010113          	addi	sp,sp,32
    80003230:	00008067          	ret
    80003234:	00000097          	auipc	ra,0x0
    80003238:	c8c080e7          	jalr	-884(ra) # 80002ec0 <cpuid>
    8000323c:	06050663          	beqz	a0,800032a8 <devintr+0xc8>
    80003240:	144027f3          	csrr	a5,sip
    80003244:	ffd7f793          	andi	a5,a5,-3
    80003248:	14479073          	csrw	sip,a5
    8000324c:	01813083          	ld	ra,24(sp)
    80003250:	01013403          	ld	s0,16(sp)
    80003254:	00813483          	ld	s1,8(sp)
    80003258:	00200513          	li	a0,2
    8000325c:	02010113          	addi	sp,sp,32
    80003260:	00008067          	ret
    80003264:	00000097          	auipc	ra,0x0
    80003268:	250080e7          	jalr	592(ra) # 800034b4 <plic_claim>
    8000326c:	00a00793          	li	a5,10
    80003270:	00050493          	mv	s1,a0
    80003274:	06f50663          	beq	a0,a5,800032e0 <devintr+0x100>
    80003278:	00100513          	li	a0,1
    8000327c:	fa0482e3          	beqz	s1,80003220 <devintr+0x40>
    80003280:	00048593          	mv	a1,s1
    80003284:	00002517          	auipc	a0,0x2
    80003288:	18c50513          	addi	a0,a0,396 # 80005410 <CONSOLE_STATUS+0x400>
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	66c080e7          	jalr	1644(ra) # 800038f8 <__printf>
    80003294:	00048513          	mv	a0,s1
    80003298:	00000097          	auipc	ra,0x0
    8000329c:	254080e7          	jalr	596(ra) # 800034ec <plic_complete>
    800032a0:	00100513          	li	a0,1
    800032a4:	f7dff06f          	j	80003220 <devintr+0x40>
    800032a8:	00004517          	auipc	a0,0x4
    800032ac:	d2850513          	addi	a0,a0,-728 # 80006fd0 <tickslock>
    800032b0:	00001097          	auipc	ra,0x1
    800032b4:	31c080e7          	jalr	796(ra) # 800045cc <acquire>
    800032b8:	00003717          	auipc	a4,0x3
    800032bc:	c2c70713          	addi	a4,a4,-980 # 80005ee4 <ticks>
    800032c0:	00072783          	lw	a5,0(a4)
    800032c4:	00004517          	auipc	a0,0x4
    800032c8:	d0c50513          	addi	a0,a0,-756 # 80006fd0 <tickslock>
    800032cc:	0017879b          	addiw	a5,a5,1
    800032d0:	00f72023          	sw	a5,0(a4)
    800032d4:	00001097          	auipc	ra,0x1
    800032d8:	3c4080e7          	jalr	964(ra) # 80004698 <release>
    800032dc:	f65ff06f          	j	80003240 <devintr+0x60>
    800032e0:	00001097          	auipc	ra,0x1
    800032e4:	f20080e7          	jalr	-224(ra) # 80004200 <uartintr>
    800032e8:	fadff06f          	j	80003294 <devintr+0xb4>
    800032ec:	0000                	unimp
	...

00000000800032f0 <kernelvec>:
    800032f0:	f0010113          	addi	sp,sp,-256
    800032f4:	00113023          	sd	ra,0(sp)
    800032f8:	00213423          	sd	sp,8(sp)
    800032fc:	00313823          	sd	gp,16(sp)
    80003300:	00413c23          	sd	tp,24(sp)
    80003304:	02513023          	sd	t0,32(sp)
    80003308:	02613423          	sd	t1,40(sp)
    8000330c:	02713823          	sd	t2,48(sp)
    80003310:	02813c23          	sd	s0,56(sp)
    80003314:	04913023          	sd	s1,64(sp)
    80003318:	04a13423          	sd	a0,72(sp)
    8000331c:	04b13823          	sd	a1,80(sp)
    80003320:	04c13c23          	sd	a2,88(sp)
    80003324:	06d13023          	sd	a3,96(sp)
    80003328:	06e13423          	sd	a4,104(sp)
    8000332c:	06f13823          	sd	a5,112(sp)
    80003330:	07013c23          	sd	a6,120(sp)
    80003334:	09113023          	sd	a7,128(sp)
    80003338:	09213423          	sd	s2,136(sp)
    8000333c:	09313823          	sd	s3,144(sp)
    80003340:	09413c23          	sd	s4,152(sp)
    80003344:	0b513023          	sd	s5,160(sp)
    80003348:	0b613423          	sd	s6,168(sp)
    8000334c:	0b713823          	sd	s7,176(sp)
    80003350:	0b813c23          	sd	s8,184(sp)
    80003354:	0d913023          	sd	s9,192(sp)
    80003358:	0da13423          	sd	s10,200(sp)
    8000335c:	0db13823          	sd	s11,208(sp)
    80003360:	0dc13c23          	sd	t3,216(sp)
    80003364:	0fd13023          	sd	t4,224(sp)
    80003368:	0fe13423          	sd	t5,232(sp)
    8000336c:	0ff13823          	sd	t6,240(sp)
    80003370:	cd1ff0ef          	jal	ra,80003040 <kerneltrap>
    80003374:	00013083          	ld	ra,0(sp)
    80003378:	00813103          	ld	sp,8(sp)
    8000337c:	01013183          	ld	gp,16(sp)
    80003380:	02013283          	ld	t0,32(sp)
    80003384:	02813303          	ld	t1,40(sp)
    80003388:	03013383          	ld	t2,48(sp)
    8000338c:	03813403          	ld	s0,56(sp)
    80003390:	04013483          	ld	s1,64(sp)
    80003394:	04813503          	ld	a0,72(sp)
    80003398:	05013583          	ld	a1,80(sp)
    8000339c:	05813603          	ld	a2,88(sp)
    800033a0:	06013683          	ld	a3,96(sp)
    800033a4:	06813703          	ld	a4,104(sp)
    800033a8:	07013783          	ld	a5,112(sp)
    800033ac:	07813803          	ld	a6,120(sp)
    800033b0:	08013883          	ld	a7,128(sp)
    800033b4:	08813903          	ld	s2,136(sp)
    800033b8:	09013983          	ld	s3,144(sp)
    800033bc:	09813a03          	ld	s4,152(sp)
    800033c0:	0a013a83          	ld	s5,160(sp)
    800033c4:	0a813b03          	ld	s6,168(sp)
    800033c8:	0b013b83          	ld	s7,176(sp)
    800033cc:	0b813c03          	ld	s8,184(sp)
    800033d0:	0c013c83          	ld	s9,192(sp)
    800033d4:	0c813d03          	ld	s10,200(sp)
    800033d8:	0d013d83          	ld	s11,208(sp)
    800033dc:	0d813e03          	ld	t3,216(sp)
    800033e0:	0e013e83          	ld	t4,224(sp)
    800033e4:	0e813f03          	ld	t5,232(sp)
    800033e8:	0f013f83          	ld	t6,240(sp)
    800033ec:	10010113          	addi	sp,sp,256
    800033f0:	10200073          	sret
    800033f4:	00000013          	nop
    800033f8:	00000013          	nop
    800033fc:	00000013          	nop

0000000080003400 <timervec>:
    80003400:	34051573          	csrrw	a0,mscratch,a0
    80003404:	00b53023          	sd	a1,0(a0)
    80003408:	00c53423          	sd	a2,8(a0)
    8000340c:	00d53823          	sd	a3,16(a0)
    80003410:	01853583          	ld	a1,24(a0)
    80003414:	02053603          	ld	a2,32(a0)
    80003418:	0005b683          	ld	a3,0(a1)
    8000341c:	00c686b3          	add	a3,a3,a2
    80003420:	00d5b023          	sd	a3,0(a1)
    80003424:	00200593          	li	a1,2
    80003428:	14459073          	csrw	sip,a1
    8000342c:	01053683          	ld	a3,16(a0)
    80003430:	00853603          	ld	a2,8(a0)
    80003434:	00053583          	ld	a1,0(a0)
    80003438:	34051573          	csrrw	a0,mscratch,a0
    8000343c:	30200073          	mret

0000000080003440 <plicinit>:
    80003440:	ff010113          	addi	sp,sp,-16
    80003444:	00813423          	sd	s0,8(sp)
    80003448:	01010413          	addi	s0,sp,16
    8000344c:	00813403          	ld	s0,8(sp)
    80003450:	0c0007b7          	lui	a5,0xc000
    80003454:	00100713          	li	a4,1
    80003458:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000345c:	00e7a223          	sw	a4,4(a5)
    80003460:	01010113          	addi	sp,sp,16
    80003464:	00008067          	ret

0000000080003468 <plicinithart>:
    80003468:	ff010113          	addi	sp,sp,-16
    8000346c:	00813023          	sd	s0,0(sp)
    80003470:	00113423          	sd	ra,8(sp)
    80003474:	01010413          	addi	s0,sp,16
    80003478:	00000097          	auipc	ra,0x0
    8000347c:	a48080e7          	jalr	-1464(ra) # 80002ec0 <cpuid>
    80003480:	0085171b          	slliw	a4,a0,0x8
    80003484:	0c0027b7          	lui	a5,0xc002
    80003488:	00e787b3          	add	a5,a5,a4
    8000348c:	40200713          	li	a4,1026
    80003490:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003494:	00813083          	ld	ra,8(sp)
    80003498:	00013403          	ld	s0,0(sp)
    8000349c:	00d5151b          	slliw	a0,a0,0xd
    800034a0:	0c2017b7          	lui	a5,0xc201
    800034a4:	00a78533          	add	a0,a5,a0
    800034a8:	00052023          	sw	zero,0(a0)
    800034ac:	01010113          	addi	sp,sp,16
    800034b0:	00008067          	ret

00000000800034b4 <plic_claim>:
    800034b4:	ff010113          	addi	sp,sp,-16
    800034b8:	00813023          	sd	s0,0(sp)
    800034bc:	00113423          	sd	ra,8(sp)
    800034c0:	01010413          	addi	s0,sp,16
    800034c4:	00000097          	auipc	ra,0x0
    800034c8:	9fc080e7          	jalr	-1540(ra) # 80002ec0 <cpuid>
    800034cc:	00813083          	ld	ra,8(sp)
    800034d0:	00013403          	ld	s0,0(sp)
    800034d4:	00d5151b          	slliw	a0,a0,0xd
    800034d8:	0c2017b7          	lui	a5,0xc201
    800034dc:	00a78533          	add	a0,a5,a0
    800034e0:	00452503          	lw	a0,4(a0)
    800034e4:	01010113          	addi	sp,sp,16
    800034e8:	00008067          	ret

00000000800034ec <plic_complete>:
    800034ec:	fe010113          	addi	sp,sp,-32
    800034f0:	00813823          	sd	s0,16(sp)
    800034f4:	00913423          	sd	s1,8(sp)
    800034f8:	00113c23          	sd	ra,24(sp)
    800034fc:	02010413          	addi	s0,sp,32
    80003500:	00050493          	mv	s1,a0
    80003504:	00000097          	auipc	ra,0x0
    80003508:	9bc080e7          	jalr	-1604(ra) # 80002ec0 <cpuid>
    8000350c:	01813083          	ld	ra,24(sp)
    80003510:	01013403          	ld	s0,16(sp)
    80003514:	00d5179b          	slliw	a5,a0,0xd
    80003518:	0c201737          	lui	a4,0xc201
    8000351c:	00f707b3          	add	a5,a4,a5
    80003520:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003524:	00813483          	ld	s1,8(sp)
    80003528:	02010113          	addi	sp,sp,32
    8000352c:	00008067          	ret

0000000080003530 <consolewrite>:
    80003530:	fb010113          	addi	sp,sp,-80
    80003534:	04813023          	sd	s0,64(sp)
    80003538:	04113423          	sd	ra,72(sp)
    8000353c:	02913c23          	sd	s1,56(sp)
    80003540:	03213823          	sd	s2,48(sp)
    80003544:	03313423          	sd	s3,40(sp)
    80003548:	03413023          	sd	s4,32(sp)
    8000354c:	01513c23          	sd	s5,24(sp)
    80003550:	05010413          	addi	s0,sp,80
    80003554:	06c05c63          	blez	a2,800035cc <consolewrite+0x9c>
    80003558:	00060993          	mv	s3,a2
    8000355c:	00050a13          	mv	s4,a0
    80003560:	00058493          	mv	s1,a1
    80003564:	00000913          	li	s2,0
    80003568:	fff00a93          	li	s5,-1
    8000356c:	01c0006f          	j	80003588 <consolewrite+0x58>
    80003570:	fbf44503          	lbu	a0,-65(s0)
    80003574:	0019091b          	addiw	s2,s2,1
    80003578:	00148493          	addi	s1,s1,1
    8000357c:	00001097          	auipc	ra,0x1
    80003580:	a9c080e7          	jalr	-1380(ra) # 80004018 <uartputc>
    80003584:	03298063          	beq	s3,s2,800035a4 <consolewrite+0x74>
    80003588:	00048613          	mv	a2,s1
    8000358c:	00100693          	li	a3,1
    80003590:	000a0593          	mv	a1,s4
    80003594:	fbf40513          	addi	a0,s0,-65
    80003598:	00000097          	auipc	ra,0x0
    8000359c:	9e0080e7          	jalr	-1568(ra) # 80002f78 <either_copyin>
    800035a0:	fd5518e3          	bne	a0,s5,80003570 <consolewrite+0x40>
    800035a4:	04813083          	ld	ra,72(sp)
    800035a8:	04013403          	ld	s0,64(sp)
    800035ac:	03813483          	ld	s1,56(sp)
    800035b0:	02813983          	ld	s3,40(sp)
    800035b4:	02013a03          	ld	s4,32(sp)
    800035b8:	01813a83          	ld	s5,24(sp)
    800035bc:	00090513          	mv	a0,s2
    800035c0:	03013903          	ld	s2,48(sp)
    800035c4:	05010113          	addi	sp,sp,80
    800035c8:	00008067          	ret
    800035cc:	00000913          	li	s2,0
    800035d0:	fd5ff06f          	j	800035a4 <consolewrite+0x74>

00000000800035d4 <consoleread>:
    800035d4:	f9010113          	addi	sp,sp,-112
    800035d8:	06813023          	sd	s0,96(sp)
    800035dc:	04913c23          	sd	s1,88(sp)
    800035e0:	05213823          	sd	s2,80(sp)
    800035e4:	05313423          	sd	s3,72(sp)
    800035e8:	05413023          	sd	s4,64(sp)
    800035ec:	03513c23          	sd	s5,56(sp)
    800035f0:	03613823          	sd	s6,48(sp)
    800035f4:	03713423          	sd	s7,40(sp)
    800035f8:	03813023          	sd	s8,32(sp)
    800035fc:	06113423          	sd	ra,104(sp)
    80003600:	01913c23          	sd	s9,24(sp)
    80003604:	07010413          	addi	s0,sp,112
    80003608:	00060b93          	mv	s7,a2
    8000360c:	00050913          	mv	s2,a0
    80003610:	00058c13          	mv	s8,a1
    80003614:	00060b1b          	sext.w	s6,a2
    80003618:	00004497          	auipc	s1,0x4
    8000361c:	9e048493          	addi	s1,s1,-1568 # 80006ff8 <cons>
    80003620:	00400993          	li	s3,4
    80003624:	fff00a13          	li	s4,-1
    80003628:	00a00a93          	li	s5,10
    8000362c:	05705e63          	blez	s7,80003688 <consoleread+0xb4>
    80003630:	09c4a703          	lw	a4,156(s1)
    80003634:	0984a783          	lw	a5,152(s1)
    80003638:	0007071b          	sext.w	a4,a4
    8000363c:	08e78463          	beq	a5,a4,800036c4 <consoleread+0xf0>
    80003640:	07f7f713          	andi	a4,a5,127
    80003644:	00e48733          	add	a4,s1,a4
    80003648:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000364c:	0017869b          	addiw	a3,a5,1
    80003650:	08d4ac23          	sw	a3,152(s1)
    80003654:	00070c9b          	sext.w	s9,a4
    80003658:	0b370663          	beq	a4,s3,80003704 <consoleread+0x130>
    8000365c:	00100693          	li	a3,1
    80003660:	f9f40613          	addi	a2,s0,-97
    80003664:	000c0593          	mv	a1,s8
    80003668:	00090513          	mv	a0,s2
    8000366c:	f8e40fa3          	sb	a4,-97(s0)
    80003670:	00000097          	auipc	ra,0x0
    80003674:	8bc080e7          	jalr	-1860(ra) # 80002f2c <either_copyout>
    80003678:	01450863          	beq	a0,s4,80003688 <consoleread+0xb4>
    8000367c:	001c0c13          	addi	s8,s8,1
    80003680:	fffb8b9b          	addiw	s7,s7,-1
    80003684:	fb5c94e3          	bne	s9,s5,8000362c <consoleread+0x58>
    80003688:	000b851b          	sext.w	a0,s7
    8000368c:	06813083          	ld	ra,104(sp)
    80003690:	06013403          	ld	s0,96(sp)
    80003694:	05813483          	ld	s1,88(sp)
    80003698:	05013903          	ld	s2,80(sp)
    8000369c:	04813983          	ld	s3,72(sp)
    800036a0:	04013a03          	ld	s4,64(sp)
    800036a4:	03813a83          	ld	s5,56(sp)
    800036a8:	02813b83          	ld	s7,40(sp)
    800036ac:	02013c03          	ld	s8,32(sp)
    800036b0:	01813c83          	ld	s9,24(sp)
    800036b4:	40ab053b          	subw	a0,s6,a0
    800036b8:	03013b03          	ld	s6,48(sp)
    800036bc:	07010113          	addi	sp,sp,112
    800036c0:	00008067          	ret
    800036c4:	00001097          	auipc	ra,0x1
    800036c8:	1d8080e7          	jalr	472(ra) # 8000489c <push_on>
    800036cc:	0984a703          	lw	a4,152(s1)
    800036d0:	09c4a783          	lw	a5,156(s1)
    800036d4:	0007879b          	sext.w	a5,a5
    800036d8:	fef70ce3          	beq	a4,a5,800036d0 <consoleread+0xfc>
    800036dc:	00001097          	auipc	ra,0x1
    800036e0:	234080e7          	jalr	564(ra) # 80004910 <pop_on>
    800036e4:	0984a783          	lw	a5,152(s1)
    800036e8:	07f7f713          	andi	a4,a5,127
    800036ec:	00e48733          	add	a4,s1,a4
    800036f0:	01874703          	lbu	a4,24(a4)
    800036f4:	0017869b          	addiw	a3,a5,1
    800036f8:	08d4ac23          	sw	a3,152(s1)
    800036fc:	00070c9b          	sext.w	s9,a4
    80003700:	f5371ee3          	bne	a4,s3,8000365c <consoleread+0x88>
    80003704:	000b851b          	sext.w	a0,s7
    80003708:	f96bf2e3          	bgeu	s7,s6,8000368c <consoleread+0xb8>
    8000370c:	08f4ac23          	sw	a5,152(s1)
    80003710:	f7dff06f          	j	8000368c <consoleread+0xb8>

0000000080003714 <consputc>:
    80003714:	10000793          	li	a5,256
    80003718:	00f50663          	beq	a0,a5,80003724 <consputc+0x10>
    8000371c:	00001317          	auipc	t1,0x1
    80003720:	9f430067          	jr	-1548(t1) # 80004110 <uartputc_sync>
    80003724:	ff010113          	addi	sp,sp,-16
    80003728:	00113423          	sd	ra,8(sp)
    8000372c:	00813023          	sd	s0,0(sp)
    80003730:	01010413          	addi	s0,sp,16
    80003734:	00800513          	li	a0,8
    80003738:	00001097          	auipc	ra,0x1
    8000373c:	9d8080e7          	jalr	-1576(ra) # 80004110 <uartputc_sync>
    80003740:	02000513          	li	a0,32
    80003744:	00001097          	auipc	ra,0x1
    80003748:	9cc080e7          	jalr	-1588(ra) # 80004110 <uartputc_sync>
    8000374c:	00013403          	ld	s0,0(sp)
    80003750:	00813083          	ld	ra,8(sp)
    80003754:	00800513          	li	a0,8
    80003758:	01010113          	addi	sp,sp,16
    8000375c:	00001317          	auipc	t1,0x1
    80003760:	9b430067          	jr	-1612(t1) # 80004110 <uartputc_sync>

0000000080003764 <consoleintr>:
    80003764:	fe010113          	addi	sp,sp,-32
    80003768:	00813823          	sd	s0,16(sp)
    8000376c:	00913423          	sd	s1,8(sp)
    80003770:	01213023          	sd	s2,0(sp)
    80003774:	00113c23          	sd	ra,24(sp)
    80003778:	02010413          	addi	s0,sp,32
    8000377c:	00004917          	auipc	s2,0x4
    80003780:	87c90913          	addi	s2,s2,-1924 # 80006ff8 <cons>
    80003784:	00050493          	mv	s1,a0
    80003788:	00090513          	mv	a0,s2
    8000378c:	00001097          	auipc	ra,0x1
    80003790:	e40080e7          	jalr	-448(ra) # 800045cc <acquire>
    80003794:	02048c63          	beqz	s1,800037cc <consoleintr+0x68>
    80003798:	0a092783          	lw	a5,160(s2)
    8000379c:	09892703          	lw	a4,152(s2)
    800037a0:	07f00693          	li	a3,127
    800037a4:	40e7873b          	subw	a4,a5,a4
    800037a8:	02e6e263          	bltu	a3,a4,800037cc <consoleintr+0x68>
    800037ac:	00d00713          	li	a4,13
    800037b0:	04e48063          	beq	s1,a4,800037f0 <consoleintr+0x8c>
    800037b4:	07f7f713          	andi	a4,a5,127
    800037b8:	00e90733          	add	a4,s2,a4
    800037bc:	0017879b          	addiw	a5,a5,1
    800037c0:	0af92023          	sw	a5,160(s2)
    800037c4:	00970c23          	sb	s1,24(a4)
    800037c8:	08f92e23          	sw	a5,156(s2)
    800037cc:	01013403          	ld	s0,16(sp)
    800037d0:	01813083          	ld	ra,24(sp)
    800037d4:	00813483          	ld	s1,8(sp)
    800037d8:	00013903          	ld	s2,0(sp)
    800037dc:	00004517          	auipc	a0,0x4
    800037e0:	81c50513          	addi	a0,a0,-2020 # 80006ff8 <cons>
    800037e4:	02010113          	addi	sp,sp,32
    800037e8:	00001317          	auipc	t1,0x1
    800037ec:	eb030067          	jr	-336(t1) # 80004698 <release>
    800037f0:	00a00493          	li	s1,10
    800037f4:	fc1ff06f          	j	800037b4 <consoleintr+0x50>

00000000800037f8 <consoleinit>:
    800037f8:	fe010113          	addi	sp,sp,-32
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	00813823          	sd	s0,16(sp)
    80003804:	00913423          	sd	s1,8(sp)
    80003808:	02010413          	addi	s0,sp,32
    8000380c:	00003497          	auipc	s1,0x3
    80003810:	7ec48493          	addi	s1,s1,2028 # 80006ff8 <cons>
    80003814:	00048513          	mv	a0,s1
    80003818:	00002597          	auipc	a1,0x2
    8000381c:	c5058593          	addi	a1,a1,-944 # 80005468 <CONSOLE_STATUS+0x458>
    80003820:	00001097          	auipc	ra,0x1
    80003824:	d88080e7          	jalr	-632(ra) # 800045a8 <initlock>
    80003828:	00000097          	auipc	ra,0x0
    8000382c:	7ac080e7          	jalr	1964(ra) # 80003fd4 <uartinit>
    80003830:	01813083          	ld	ra,24(sp)
    80003834:	01013403          	ld	s0,16(sp)
    80003838:	00000797          	auipc	a5,0x0
    8000383c:	d9c78793          	addi	a5,a5,-612 # 800035d4 <consoleread>
    80003840:	0af4bc23          	sd	a5,184(s1)
    80003844:	00000797          	auipc	a5,0x0
    80003848:	cec78793          	addi	a5,a5,-788 # 80003530 <consolewrite>
    8000384c:	0cf4b023          	sd	a5,192(s1)
    80003850:	00813483          	ld	s1,8(sp)
    80003854:	02010113          	addi	sp,sp,32
    80003858:	00008067          	ret

000000008000385c <console_read>:
    8000385c:	ff010113          	addi	sp,sp,-16
    80003860:	00813423          	sd	s0,8(sp)
    80003864:	01010413          	addi	s0,sp,16
    80003868:	00813403          	ld	s0,8(sp)
    8000386c:	00004317          	auipc	t1,0x4
    80003870:	84433303          	ld	t1,-1980(t1) # 800070b0 <devsw+0x10>
    80003874:	01010113          	addi	sp,sp,16
    80003878:	00030067          	jr	t1

000000008000387c <console_write>:
    8000387c:	ff010113          	addi	sp,sp,-16
    80003880:	00813423          	sd	s0,8(sp)
    80003884:	01010413          	addi	s0,sp,16
    80003888:	00813403          	ld	s0,8(sp)
    8000388c:	00004317          	auipc	t1,0x4
    80003890:	82c33303          	ld	t1,-2004(t1) # 800070b8 <devsw+0x18>
    80003894:	01010113          	addi	sp,sp,16
    80003898:	00030067          	jr	t1

000000008000389c <panic>:
    8000389c:	fe010113          	addi	sp,sp,-32
    800038a0:	00113c23          	sd	ra,24(sp)
    800038a4:	00813823          	sd	s0,16(sp)
    800038a8:	00913423          	sd	s1,8(sp)
    800038ac:	02010413          	addi	s0,sp,32
    800038b0:	00050493          	mv	s1,a0
    800038b4:	00002517          	auipc	a0,0x2
    800038b8:	bbc50513          	addi	a0,a0,-1092 # 80005470 <CONSOLE_STATUS+0x460>
    800038bc:	00004797          	auipc	a5,0x4
    800038c0:	8807ae23          	sw	zero,-1892(a5) # 80007158 <pr+0x18>
    800038c4:	00000097          	auipc	ra,0x0
    800038c8:	034080e7          	jalr	52(ra) # 800038f8 <__printf>
    800038cc:	00048513          	mv	a0,s1
    800038d0:	00000097          	auipc	ra,0x0
    800038d4:	028080e7          	jalr	40(ra) # 800038f8 <__printf>
    800038d8:	00002517          	auipc	a0,0x2
    800038dc:	83050513          	addi	a0,a0,-2000 # 80005108 <CONSOLE_STATUS+0xf8>
    800038e0:	00000097          	auipc	ra,0x0
    800038e4:	018080e7          	jalr	24(ra) # 800038f8 <__printf>
    800038e8:	00100793          	li	a5,1
    800038ec:	00002717          	auipc	a4,0x2
    800038f0:	5ef72e23          	sw	a5,1532(a4) # 80005ee8 <panicked>
    800038f4:	0000006f          	j	800038f4 <panic+0x58>

00000000800038f8 <__printf>:
    800038f8:	f3010113          	addi	sp,sp,-208
    800038fc:	08813023          	sd	s0,128(sp)
    80003900:	07313423          	sd	s3,104(sp)
    80003904:	09010413          	addi	s0,sp,144
    80003908:	05813023          	sd	s8,64(sp)
    8000390c:	08113423          	sd	ra,136(sp)
    80003910:	06913c23          	sd	s1,120(sp)
    80003914:	07213823          	sd	s2,112(sp)
    80003918:	07413023          	sd	s4,96(sp)
    8000391c:	05513c23          	sd	s5,88(sp)
    80003920:	05613823          	sd	s6,80(sp)
    80003924:	05713423          	sd	s7,72(sp)
    80003928:	03913c23          	sd	s9,56(sp)
    8000392c:	03a13823          	sd	s10,48(sp)
    80003930:	03b13423          	sd	s11,40(sp)
    80003934:	00004317          	auipc	t1,0x4
    80003938:	80c30313          	addi	t1,t1,-2036 # 80007140 <pr>
    8000393c:	01832c03          	lw	s8,24(t1)
    80003940:	00b43423          	sd	a1,8(s0)
    80003944:	00c43823          	sd	a2,16(s0)
    80003948:	00d43c23          	sd	a3,24(s0)
    8000394c:	02e43023          	sd	a4,32(s0)
    80003950:	02f43423          	sd	a5,40(s0)
    80003954:	03043823          	sd	a6,48(s0)
    80003958:	03143c23          	sd	a7,56(s0)
    8000395c:	00050993          	mv	s3,a0
    80003960:	4a0c1663          	bnez	s8,80003e0c <__printf+0x514>
    80003964:	60098c63          	beqz	s3,80003f7c <__printf+0x684>
    80003968:	0009c503          	lbu	a0,0(s3)
    8000396c:	00840793          	addi	a5,s0,8
    80003970:	f6f43c23          	sd	a5,-136(s0)
    80003974:	00000493          	li	s1,0
    80003978:	22050063          	beqz	a0,80003b98 <__printf+0x2a0>
    8000397c:	00002a37          	lui	s4,0x2
    80003980:	00018ab7          	lui	s5,0x18
    80003984:	000f4b37          	lui	s6,0xf4
    80003988:	00989bb7          	lui	s7,0x989
    8000398c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003990:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003994:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003998:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000399c:	00148c9b          	addiw	s9,s1,1
    800039a0:	02500793          	li	a5,37
    800039a4:	01998933          	add	s2,s3,s9
    800039a8:	38f51263          	bne	a0,a5,80003d2c <__printf+0x434>
    800039ac:	00094783          	lbu	a5,0(s2)
    800039b0:	00078c9b          	sext.w	s9,a5
    800039b4:	1e078263          	beqz	a5,80003b98 <__printf+0x2a0>
    800039b8:	0024849b          	addiw	s1,s1,2
    800039bc:	07000713          	li	a4,112
    800039c0:	00998933          	add	s2,s3,s1
    800039c4:	38e78a63          	beq	a5,a4,80003d58 <__printf+0x460>
    800039c8:	20f76863          	bltu	a4,a5,80003bd8 <__printf+0x2e0>
    800039cc:	42a78863          	beq	a5,a0,80003dfc <__printf+0x504>
    800039d0:	06400713          	li	a4,100
    800039d4:	40e79663          	bne	a5,a4,80003de0 <__printf+0x4e8>
    800039d8:	f7843783          	ld	a5,-136(s0)
    800039dc:	0007a603          	lw	a2,0(a5)
    800039e0:	00878793          	addi	a5,a5,8
    800039e4:	f6f43c23          	sd	a5,-136(s0)
    800039e8:	42064a63          	bltz	a2,80003e1c <__printf+0x524>
    800039ec:	00a00713          	li	a4,10
    800039f0:	02e677bb          	remuw	a5,a2,a4
    800039f4:	00002d97          	auipc	s11,0x2
    800039f8:	aa4d8d93          	addi	s11,s11,-1372 # 80005498 <digits>
    800039fc:	00900593          	li	a1,9
    80003a00:	0006051b          	sext.w	a0,a2
    80003a04:	00000c93          	li	s9,0
    80003a08:	02079793          	slli	a5,a5,0x20
    80003a0c:	0207d793          	srli	a5,a5,0x20
    80003a10:	00fd87b3          	add	a5,s11,a5
    80003a14:	0007c783          	lbu	a5,0(a5)
    80003a18:	02e656bb          	divuw	a3,a2,a4
    80003a1c:	f8f40023          	sb	a5,-128(s0)
    80003a20:	14c5d863          	bge	a1,a2,80003b70 <__printf+0x278>
    80003a24:	06300593          	li	a1,99
    80003a28:	00100c93          	li	s9,1
    80003a2c:	02e6f7bb          	remuw	a5,a3,a4
    80003a30:	02079793          	slli	a5,a5,0x20
    80003a34:	0207d793          	srli	a5,a5,0x20
    80003a38:	00fd87b3          	add	a5,s11,a5
    80003a3c:	0007c783          	lbu	a5,0(a5)
    80003a40:	02e6d73b          	divuw	a4,a3,a4
    80003a44:	f8f400a3          	sb	a5,-127(s0)
    80003a48:	12a5f463          	bgeu	a1,a0,80003b70 <__printf+0x278>
    80003a4c:	00a00693          	li	a3,10
    80003a50:	00900593          	li	a1,9
    80003a54:	02d777bb          	remuw	a5,a4,a3
    80003a58:	02079793          	slli	a5,a5,0x20
    80003a5c:	0207d793          	srli	a5,a5,0x20
    80003a60:	00fd87b3          	add	a5,s11,a5
    80003a64:	0007c503          	lbu	a0,0(a5)
    80003a68:	02d757bb          	divuw	a5,a4,a3
    80003a6c:	f8a40123          	sb	a0,-126(s0)
    80003a70:	48e5f263          	bgeu	a1,a4,80003ef4 <__printf+0x5fc>
    80003a74:	06300513          	li	a0,99
    80003a78:	02d7f5bb          	remuw	a1,a5,a3
    80003a7c:	02059593          	slli	a1,a1,0x20
    80003a80:	0205d593          	srli	a1,a1,0x20
    80003a84:	00bd85b3          	add	a1,s11,a1
    80003a88:	0005c583          	lbu	a1,0(a1)
    80003a8c:	02d7d7bb          	divuw	a5,a5,a3
    80003a90:	f8b401a3          	sb	a1,-125(s0)
    80003a94:	48e57263          	bgeu	a0,a4,80003f18 <__printf+0x620>
    80003a98:	3e700513          	li	a0,999
    80003a9c:	02d7f5bb          	remuw	a1,a5,a3
    80003aa0:	02059593          	slli	a1,a1,0x20
    80003aa4:	0205d593          	srli	a1,a1,0x20
    80003aa8:	00bd85b3          	add	a1,s11,a1
    80003aac:	0005c583          	lbu	a1,0(a1)
    80003ab0:	02d7d7bb          	divuw	a5,a5,a3
    80003ab4:	f8b40223          	sb	a1,-124(s0)
    80003ab8:	46e57663          	bgeu	a0,a4,80003f24 <__printf+0x62c>
    80003abc:	02d7f5bb          	remuw	a1,a5,a3
    80003ac0:	02059593          	slli	a1,a1,0x20
    80003ac4:	0205d593          	srli	a1,a1,0x20
    80003ac8:	00bd85b3          	add	a1,s11,a1
    80003acc:	0005c583          	lbu	a1,0(a1)
    80003ad0:	02d7d7bb          	divuw	a5,a5,a3
    80003ad4:	f8b402a3          	sb	a1,-123(s0)
    80003ad8:	46ea7863          	bgeu	s4,a4,80003f48 <__printf+0x650>
    80003adc:	02d7f5bb          	remuw	a1,a5,a3
    80003ae0:	02059593          	slli	a1,a1,0x20
    80003ae4:	0205d593          	srli	a1,a1,0x20
    80003ae8:	00bd85b3          	add	a1,s11,a1
    80003aec:	0005c583          	lbu	a1,0(a1)
    80003af0:	02d7d7bb          	divuw	a5,a5,a3
    80003af4:	f8b40323          	sb	a1,-122(s0)
    80003af8:	3eeaf863          	bgeu	s5,a4,80003ee8 <__printf+0x5f0>
    80003afc:	02d7f5bb          	remuw	a1,a5,a3
    80003b00:	02059593          	slli	a1,a1,0x20
    80003b04:	0205d593          	srli	a1,a1,0x20
    80003b08:	00bd85b3          	add	a1,s11,a1
    80003b0c:	0005c583          	lbu	a1,0(a1)
    80003b10:	02d7d7bb          	divuw	a5,a5,a3
    80003b14:	f8b403a3          	sb	a1,-121(s0)
    80003b18:	42eb7e63          	bgeu	s6,a4,80003f54 <__printf+0x65c>
    80003b1c:	02d7f5bb          	remuw	a1,a5,a3
    80003b20:	02059593          	slli	a1,a1,0x20
    80003b24:	0205d593          	srli	a1,a1,0x20
    80003b28:	00bd85b3          	add	a1,s11,a1
    80003b2c:	0005c583          	lbu	a1,0(a1)
    80003b30:	02d7d7bb          	divuw	a5,a5,a3
    80003b34:	f8b40423          	sb	a1,-120(s0)
    80003b38:	42ebfc63          	bgeu	s7,a4,80003f70 <__printf+0x678>
    80003b3c:	02079793          	slli	a5,a5,0x20
    80003b40:	0207d793          	srli	a5,a5,0x20
    80003b44:	00fd8db3          	add	s11,s11,a5
    80003b48:	000dc703          	lbu	a4,0(s11)
    80003b4c:	00a00793          	li	a5,10
    80003b50:	00900c93          	li	s9,9
    80003b54:	f8e404a3          	sb	a4,-119(s0)
    80003b58:	00065c63          	bgez	a2,80003b70 <__printf+0x278>
    80003b5c:	f9040713          	addi	a4,s0,-112
    80003b60:	00f70733          	add	a4,a4,a5
    80003b64:	02d00693          	li	a3,45
    80003b68:	fed70823          	sb	a3,-16(a4)
    80003b6c:	00078c93          	mv	s9,a5
    80003b70:	f8040793          	addi	a5,s0,-128
    80003b74:	01978cb3          	add	s9,a5,s9
    80003b78:	f7f40d13          	addi	s10,s0,-129
    80003b7c:	000cc503          	lbu	a0,0(s9)
    80003b80:	fffc8c93          	addi	s9,s9,-1
    80003b84:	00000097          	auipc	ra,0x0
    80003b88:	b90080e7          	jalr	-1136(ra) # 80003714 <consputc>
    80003b8c:	ffac98e3          	bne	s9,s10,80003b7c <__printf+0x284>
    80003b90:	00094503          	lbu	a0,0(s2)
    80003b94:	e00514e3          	bnez	a0,8000399c <__printf+0xa4>
    80003b98:	1a0c1663          	bnez	s8,80003d44 <__printf+0x44c>
    80003b9c:	08813083          	ld	ra,136(sp)
    80003ba0:	08013403          	ld	s0,128(sp)
    80003ba4:	07813483          	ld	s1,120(sp)
    80003ba8:	07013903          	ld	s2,112(sp)
    80003bac:	06813983          	ld	s3,104(sp)
    80003bb0:	06013a03          	ld	s4,96(sp)
    80003bb4:	05813a83          	ld	s5,88(sp)
    80003bb8:	05013b03          	ld	s6,80(sp)
    80003bbc:	04813b83          	ld	s7,72(sp)
    80003bc0:	04013c03          	ld	s8,64(sp)
    80003bc4:	03813c83          	ld	s9,56(sp)
    80003bc8:	03013d03          	ld	s10,48(sp)
    80003bcc:	02813d83          	ld	s11,40(sp)
    80003bd0:	0d010113          	addi	sp,sp,208
    80003bd4:	00008067          	ret
    80003bd8:	07300713          	li	a4,115
    80003bdc:	1ce78a63          	beq	a5,a4,80003db0 <__printf+0x4b8>
    80003be0:	07800713          	li	a4,120
    80003be4:	1ee79e63          	bne	a5,a4,80003de0 <__printf+0x4e8>
    80003be8:	f7843783          	ld	a5,-136(s0)
    80003bec:	0007a703          	lw	a4,0(a5)
    80003bf0:	00878793          	addi	a5,a5,8
    80003bf4:	f6f43c23          	sd	a5,-136(s0)
    80003bf8:	28074263          	bltz	a4,80003e7c <__printf+0x584>
    80003bfc:	00002d97          	auipc	s11,0x2
    80003c00:	89cd8d93          	addi	s11,s11,-1892 # 80005498 <digits>
    80003c04:	00f77793          	andi	a5,a4,15
    80003c08:	00fd87b3          	add	a5,s11,a5
    80003c0c:	0007c683          	lbu	a3,0(a5)
    80003c10:	00f00613          	li	a2,15
    80003c14:	0007079b          	sext.w	a5,a4
    80003c18:	f8d40023          	sb	a3,-128(s0)
    80003c1c:	0047559b          	srliw	a1,a4,0x4
    80003c20:	0047569b          	srliw	a3,a4,0x4
    80003c24:	00000c93          	li	s9,0
    80003c28:	0ee65063          	bge	a2,a4,80003d08 <__printf+0x410>
    80003c2c:	00f6f693          	andi	a3,a3,15
    80003c30:	00dd86b3          	add	a3,s11,a3
    80003c34:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003c38:	0087d79b          	srliw	a5,a5,0x8
    80003c3c:	00100c93          	li	s9,1
    80003c40:	f8d400a3          	sb	a3,-127(s0)
    80003c44:	0cb67263          	bgeu	a2,a1,80003d08 <__printf+0x410>
    80003c48:	00f7f693          	andi	a3,a5,15
    80003c4c:	00dd86b3          	add	a3,s11,a3
    80003c50:	0006c583          	lbu	a1,0(a3)
    80003c54:	00f00613          	li	a2,15
    80003c58:	0047d69b          	srliw	a3,a5,0x4
    80003c5c:	f8b40123          	sb	a1,-126(s0)
    80003c60:	0047d593          	srli	a1,a5,0x4
    80003c64:	28f67e63          	bgeu	a2,a5,80003f00 <__printf+0x608>
    80003c68:	00f6f693          	andi	a3,a3,15
    80003c6c:	00dd86b3          	add	a3,s11,a3
    80003c70:	0006c503          	lbu	a0,0(a3)
    80003c74:	0087d813          	srli	a6,a5,0x8
    80003c78:	0087d69b          	srliw	a3,a5,0x8
    80003c7c:	f8a401a3          	sb	a0,-125(s0)
    80003c80:	28b67663          	bgeu	a2,a1,80003f0c <__printf+0x614>
    80003c84:	00f6f693          	andi	a3,a3,15
    80003c88:	00dd86b3          	add	a3,s11,a3
    80003c8c:	0006c583          	lbu	a1,0(a3)
    80003c90:	00c7d513          	srli	a0,a5,0xc
    80003c94:	00c7d69b          	srliw	a3,a5,0xc
    80003c98:	f8b40223          	sb	a1,-124(s0)
    80003c9c:	29067a63          	bgeu	a2,a6,80003f30 <__printf+0x638>
    80003ca0:	00f6f693          	andi	a3,a3,15
    80003ca4:	00dd86b3          	add	a3,s11,a3
    80003ca8:	0006c583          	lbu	a1,0(a3)
    80003cac:	0107d813          	srli	a6,a5,0x10
    80003cb0:	0107d69b          	srliw	a3,a5,0x10
    80003cb4:	f8b402a3          	sb	a1,-123(s0)
    80003cb8:	28a67263          	bgeu	a2,a0,80003f3c <__printf+0x644>
    80003cbc:	00f6f693          	andi	a3,a3,15
    80003cc0:	00dd86b3          	add	a3,s11,a3
    80003cc4:	0006c683          	lbu	a3,0(a3)
    80003cc8:	0147d79b          	srliw	a5,a5,0x14
    80003ccc:	f8d40323          	sb	a3,-122(s0)
    80003cd0:	21067663          	bgeu	a2,a6,80003edc <__printf+0x5e4>
    80003cd4:	02079793          	slli	a5,a5,0x20
    80003cd8:	0207d793          	srli	a5,a5,0x20
    80003cdc:	00fd8db3          	add	s11,s11,a5
    80003ce0:	000dc683          	lbu	a3,0(s11)
    80003ce4:	00800793          	li	a5,8
    80003ce8:	00700c93          	li	s9,7
    80003cec:	f8d403a3          	sb	a3,-121(s0)
    80003cf0:	00075c63          	bgez	a4,80003d08 <__printf+0x410>
    80003cf4:	f9040713          	addi	a4,s0,-112
    80003cf8:	00f70733          	add	a4,a4,a5
    80003cfc:	02d00693          	li	a3,45
    80003d00:	fed70823          	sb	a3,-16(a4)
    80003d04:	00078c93          	mv	s9,a5
    80003d08:	f8040793          	addi	a5,s0,-128
    80003d0c:	01978cb3          	add	s9,a5,s9
    80003d10:	f7f40d13          	addi	s10,s0,-129
    80003d14:	000cc503          	lbu	a0,0(s9)
    80003d18:	fffc8c93          	addi	s9,s9,-1
    80003d1c:	00000097          	auipc	ra,0x0
    80003d20:	9f8080e7          	jalr	-1544(ra) # 80003714 <consputc>
    80003d24:	ff9d18e3          	bne	s10,s9,80003d14 <__printf+0x41c>
    80003d28:	0100006f          	j	80003d38 <__printf+0x440>
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	9e8080e7          	jalr	-1560(ra) # 80003714 <consputc>
    80003d34:	000c8493          	mv	s1,s9
    80003d38:	00094503          	lbu	a0,0(s2)
    80003d3c:	c60510e3          	bnez	a0,8000399c <__printf+0xa4>
    80003d40:	e40c0ee3          	beqz	s8,80003b9c <__printf+0x2a4>
    80003d44:	00003517          	auipc	a0,0x3
    80003d48:	3fc50513          	addi	a0,a0,1020 # 80007140 <pr>
    80003d4c:	00001097          	auipc	ra,0x1
    80003d50:	94c080e7          	jalr	-1716(ra) # 80004698 <release>
    80003d54:	e49ff06f          	j	80003b9c <__printf+0x2a4>
    80003d58:	f7843783          	ld	a5,-136(s0)
    80003d5c:	03000513          	li	a0,48
    80003d60:	01000d13          	li	s10,16
    80003d64:	00878713          	addi	a4,a5,8
    80003d68:	0007bc83          	ld	s9,0(a5)
    80003d6c:	f6e43c23          	sd	a4,-136(s0)
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	9a4080e7          	jalr	-1628(ra) # 80003714 <consputc>
    80003d78:	07800513          	li	a0,120
    80003d7c:	00000097          	auipc	ra,0x0
    80003d80:	998080e7          	jalr	-1640(ra) # 80003714 <consputc>
    80003d84:	00001d97          	auipc	s11,0x1
    80003d88:	714d8d93          	addi	s11,s11,1812 # 80005498 <digits>
    80003d8c:	03ccd793          	srli	a5,s9,0x3c
    80003d90:	00fd87b3          	add	a5,s11,a5
    80003d94:	0007c503          	lbu	a0,0(a5)
    80003d98:	fffd0d1b          	addiw	s10,s10,-1
    80003d9c:	004c9c93          	slli	s9,s9,0x4
    80003da0:	00000097          	auipc	ra,0x0
    80003da4:	974080e7          	jalr	-1676(ra) # 80003714 <consputc>
    80003da8:	fe0d12e3          	bnez	s10,80003d8c <__printf+0x494>
    80003dac:	f8dff06f          	j	80003d38 <__printf+0x440>
    80003db0:	f7843783          	ld	a5,-136(s0)
    80003db4:	0007bc83          	ld	s9,0(a5)
    80003db8:	00878793          	addi	a5,a5,8
    80003dbc:	f6f43c23          	sd	a5,-136(s0)
    80003dc0:	000c9a63          	bnez	s9,80003dd4 <__printf+0x4dc>
    80003dc4:	1080006f          	j	80003ecc <__printf+0x5d4>
    80003dc8:	001c8c93          	addi	s9,s9,1
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	948080e7          	jalr	-1720(ra) # 80003714 <consputc>
    80003dd4:	000cc503          	lbu	a0,0(s9)
    80003dd8:	fe0518e3          	bnez	a0,80003dc8 <__printf+0x4d0>
    80003ddc:	f5dff06f          	j	80003d38 <__printf+0x440>
    80003de0:	02500513          	li	a0,37
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	930080e7          	jalr	-1744(ra) # 80003714 <consputc>
    80003dec:	000c8513          	mv	a0,s9
    80003df0:	00000097          	auipc	ra,0x0
    80003df4:	924080e7          	jalr	-1756(ra) # 80003714 <consputc>
    80003df8:	f41ff06f          	j	80003d38 <__printf+0x440>
    80003dfc:	02500513          	li	a0,37
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	914080e7          	jalr	-1772(ra) # 80003714 <consputc>
    80003e08:	f31ff06f          	j	80003d38 <__printf+0x440>
    80003e0c:	00030513          	mv	a0,t1
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	7bc080e7          	jalr	1980(ra) # 800045cc <acquire>
    80003e18:	b4dff06f          	j	80003964 <__printf+0x6c>
    80003e1c:	40c0053b          	negw	a0,a2
    80003e20:	00a00713          	li	a4,10
    80003e24:	02e576bb          	remuw	a3,a0,a4
    80003e28:	00001d97          	auipc	s11,0x1
    80003e2c:	670d8d93          	addi	s11,s11,1648 # 80005498 <digits>
    80003e30:	ff700593          	li	a1,-9
    80003e34:	02069693          	slli	a3,a3,0x20
    80003e38:	0206d693          	srli	a3,a3,0x20
    80003e3c:	00dd86b3          	add	a3,s11,a3
    80003e40:	0006c683          	lbu	a3,0(a3)
    80003e44:	02e557bb          	divuw	a5,a0,a4
    80003e48:	f8d40023          	sb	a3,-128(s0)
    80003e4c:	10b65e63          	bge	a2,a1,80003f68 <__printf+0x670>
    80003e50:	06300593          	li	a1,99
    80003e54:	02e7f6bb          	remuw	a3,a5,a4
    80003e58:	02069693          	slli	a3,a3,0x20
    80003e5c:	0206d693          	srli	a3,a3,0x20
    80003e60:	00dd86b3          	add	a3,s11,a3
    80003e64:	0006c683          	lbu	a3,0(a3)
    80003e68:	02e7d73b          	divuw	a4,a5,a4
    80003e6c:	00200793          	li	a5,2
    80003e70:	f8d400a3          	sb	a3,-127(s0)
    80003e74:	bca5ece3          	bltu	a1,a0,80003a4c <__printf+0x154>
    80003e78:	ce5ff06f          	j	80003b5c <__printf+0x264>
    80003e7c:	40e007bb          	negw	a5,a4
    80003e80:	00001d97          	auipc	s11,0x1
    80003e84:	618d8d93          	addi	s11,s11,1560 # 80005498 <digits>
    80003e88:	00f7f693          	andi	a3,a5,15
    80003e8c:	00dd86b3          	add	a3,s11,a3
    80003e90:	0006c583          	lbu	a1,0(a3)
    80003e94:	ff100613          	li	a2,-15
    80003e98:	0047d69b          	srliw	a3,a5,0x4
    80003e9c:	f8b40023          	sb	a1,-128(s0)
    80003ea0:	0047d59b          	srliw	a1,a5,0x4
    80003ea4:	0ac75e63          	bge	a4,a2,80003f60 <__printf+0x668>
    80003ea8:	00f6f693          	andi	a3,a3,15
    80003eac:	00dd86b3          	add	a3,s11,a3
    80003eb0:	0006c603          	lbu	a2,0(a3)
    80003eb4:	00f00693          	li	a3,15
    80003eb8:	0087d79b          	srliw	a5,a5,0x8
    80003ebc:	f8c400a3          	sb	a2,-127(s0)
    80003ec0:	d8b6e4e3          	bltu	a3,a1,80003c48 <__printf+0x350>
    80003ec4:	00200793          	li	a5,2
    80003ec8:	e2dff06f          	j	80003cf4 <__printf+0x3fc>
    80003ecc:	00001c97          	auipc	s9,0x1
    80003ed0:	5acc8c93          	addi	s9,s9,1452 # 80005478 <CONSOLE_STATUS+0x468>
    80003ed4:	02800513          	li	a0,40
    80003ed8:	ef1ff06f          	j	80003dc8 <__printf+0x4d0>
    80003edc:	00700793          	li	a5,7
    80003ee0:	00600c93          	li	s9,6
    80003ee4:	e0dff06f          	j	80003cf0 <__printf+0x3f8>
    80003ee8:	00700793          	li	a5,7
    80003eec:	00600c93          	li	s9,6
    80003ef0:	c69ff06f          	j	80003b58 <__printf+0x260>
    80003ef4:	00300793          	li	a5,3
    80003ef8:	00200c93          	li	s9,2
    80003efc:	c5dff06f          	j	80003b58 <__printf+0x260>
    80003f00:	00300793          	li	a5,3
    80003f04:	00200c93          	li	s9,2
    80003f08:	de9ff06f          	j	80003cf0 <__printf+0x3f8>
    80003f0c:	00400793          	li	a5,4
    80003f10:	00300c93          	li	s9,3
    80003f14:	dddff06f          	j	80003cf0 <__printf+0x3f8>
    80003f18:	00400793          	li	a5,4
    80003f1c:	00300c93          	li	s9,3
    80003f20:	c39ff06f          	j	80003b58 <__printf+0x260>
    80003f24:	00500793          	li	a5,5
    80003f28:	00400c93          	li	s9,4
    80003f2c:	c2dff06f          	j	80003b58 <__printf+0x260>
    80003f30:	00500793          	li	a5,5
    80003f34:	00400c93          	li	s9,4
    80003f38:	db9ff06f          	j	80003cf0 <__printf+0x3f8>
    80003f3c:	00600793          	li	a5,6
    80003f40:	00500c93          	li	s9,5
    80003f44:	dadff06f          	j	80003cf0 <__printf+0x3f8>
    80003f48:	00600793          	li	a5,6
    80003f4c:	00500c93          	li	s9,5
    80003f50:	c09ff06f          	j	80003b58 <__printf+0x260>
    80003f54:	00800793          	li	a5,8
    80003f58:	00700c93          	li	s9,7
    80003f5c:	bfdff06f          	j	80003b58 <__printf+0x260>
    80003f60:	00100793          	li	a5,1
    80003f64:	d91ff06f          	j	80003cf4 <__printf+0x3fc>
    80003f68:	00100793          	li	a5,1
    80003f6c:	bf1ff06f          	j	80003b5c <__printf+0x264>
    80003f70:	00900793          	li	a5,9
    80003f74:	00800c93          	li	s9,8
    80003f78:	be1ff06f          	j	80003b58 <__printf+0x260>
    80003f7c:	00001517          	auipc	a0,0x1
    80003f80:	50450513          	addi	a0,a0,1284 # 80005480 <CONSOLE_STATUS+0x470>
    80003f84:	00000097          	auipc	ra,0x0
    80003f88:	918080e7          	jalr	-1768(ra) # 8000389c <panic>

0000000080003f8c <printfinit>:
    80003f8c:	fe010113          	addi	sp,sp,-32
    80003f90:	00813823          	sd	s0,16(sp)
    80003f94:	00913423          	sd	s1,8(sp)
    80003f98:	00113c23          	sd	ra,24(sp)
    80003f9c:	02010413          	addi	s0,sp,32
    80003fa0:	00003497          	auipc	s1,0x3
    80003fa4:	1a048493          	addi	s1,s1,416 # 80007140 <pr>
    80003fa8:	00048513          	mv	a0,s1
    80003fac:	00001597          	auipc	a1,0x1
    80003fb0:	4e458593          	addi	a1,a1,1252 # 80005490 <CONSOLE_STATUS+0x480>
    80003fb4:	00000097          	auipc	ra,0x0
    80003fb8:	5f4080e7          	jalr	1524(ra) # 800045a8 <initlock>
    80003fbc:	01813083          	ld	ra,24(sp)
    80003fc0:	01013403          	ld	s0,16(sp)
    80003fc4:	0004ac23          	sw	zero,24(s1)
    80003fc8:	00813483          	ld	s1,8(sp)
    80003fcc:	02010113          	addi	sp,sp,32
    80003fd0:	00008067          	ret

0000000080003fd4 <uartinit>:
    80003fd4:	ff010113          	addi	sp,sp,-16
    80003fd8:	00813423          	sd	s0,8(sp)
    80003fdc:	01010413          	addi	s0,sp,16
    80003fe0:	100007b7          	lui	a5,0x10000
    80003fe4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003fe8:	f8000713          	li	a4,-128
    80003fec:	00e781a3          	sb	a4,3(a5)
    80003ff0:	00300713          	li	a4,3
    80003ff4:	00e78023          	sb	a4,0(a5)
    80003ff8:	000780a3          	sb	zero,1(a5)
    80003ffc:	00e781a3          	sb	a4,3(a5)
    80004000:	00700693          	li	a3,7
    80004004:	00d78123          	sb	a3,2(a5)
    80004008:	00e780a3          	sb	a4,1(a5)
    8000400c:	00813403          	ld	s0,8(sp)
    80004010:	01010113          	addi	sp,sp,16
    80004014:	00008067          	ret

0000000080004018 <uartputc>:
    80004018:	00002797          	auipc	a5,0x2
    8000401c:	ed07a783          	lw	a5,-304(a5) # 80005ee8 <panicked>
    80004020:	00078463          	beqz	a5,80004028 <uartputc+0x10>
    80004024:	0000006f          	j	80004024 <uartputc+0xc>
    80004028:	fd010113          	addi	sp,sp,-48
    8000402c:	02813023          	sd	s0,32(sp)
    80004030:	00913c23          	sd	s1,24(sp)
    80004034:	01213823          	sd	s2,16(sp)
    80004038:	01313423          	sd	s3,8(sp)
    8000403c:	02113423          	sd	ra,40(sp)
    80004040:	03010413          	addi	s0,sp,48
    80004044:	00002917          	auipc	s2,0x2
    80004048:	eac90913          	addi	s2,s2,-340 # 80005ef0 <uart_tx_r>
    8000404c:	00093783          	ld	a5,0(s2)
    80004050:	00002497          	auipc	s1,0x2
    80004054:	ea848493          	addi	s1,s1,-344 # 80005ef8 <uart_tx_w>
    80004058:	0004b703          	ld	a4,0(s1)
    8000405c:	02078693          	addi	a3,a5,32
    80004060:	00050993          	mv	s3,a0
    80004064:	02e69c63          	bne	a3,a4,8000409c <uartputc+0x84>
    80004068:	00001097          	auipc	ra,0x1
    8000406c:	834080e7          	jalr	-1996(ra) # 8000489c <push_on>
    80004070:	00093783          	ld	a5,0(s2)
    80004074:	0004b703          	ld	a4,0(s1)
    80004078:	02078793          	addi	a5,a5,32
    8000407c:	00e79463          	bne	a5,a4,80004084 <uartputc+0x6c>
    80004080:	0000006f          	j	80004080 <uartputc+0x68>
    80004084:	00001097          	auipc	ra,0x1
    80004088:	88c080e7          	jalr	-1908(ra) # 80004910 <pop_on>
    8000408c:	00093783          	ld	a5,0(s2)
    80004090:	0004b703          	ld	a4,0(s1)
    80004094:	02078693          	addi	a3,a5,32
    80004098:	fce688e3          	beq	a3,a4,80004068 <uartputc+0x50>
    8000409c:	01f77693          	andi	a3,a4,31
    800040a0:	00003597          	auipc	a1,0x3
    800040a4:	0c058593          	addi	a1,a1,192 # 80007160 <uart_tx_buf>
    800040a8:	00d586b3          	add	a3,a1,a3
    800040ac:	00170713          	addi	a4,a4,1
    800040b0:	01368023          	sb	s3,0(a3)
    800040b4:	00e4b023          	sd	a4,0(s1)
    800040b8:	10000637          	lui	a2,0x10000
    800040bc:	02f71063          	bne	a4,a5,800040dc <uartputc+0xc4>
    800040c0:	0340006f          	j	800040f4 <uartputc+0xdc>
    800040c4:	00074703          	lbu	a4,0(a4)
    800040c8:	00f93023          	sd	a5,0(s2)
    800040cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800040d0:	00093783          	ld	a5,0(s2)
    800040d4:	0004b703          	ld	a4,0(s1)
    800040d8:	00f70e63          	beq	a4,a5,800040f4 <uartputc+0xdc>
    800040dc:	00564683          	lbu	a3,5(a2)
    800040e0:	01f7f713          	andi	a4,a5,31
    800040e4:	00e58733          	add	a4,a1,a4
    800040e8:	0206f693          	andi	a3,a3,32
    800040ec:	00178793          	addi	a5,a5,1
    800040f0:	fc069ae3          	bnez	a3,800040c4 <uartputc+0xac>
    800040f4:	02813083          	ld	ra,40(sp)
    800040f8:	02013403          	ld	s0,32(sp)
    800040fc:	01813483          	ld	s1,24(sp)
    80004100:	01013903          	ld	s2,16(sp)
    80004104:	00813983          	ld	s3,8(sp)
    80004108:	03010113          	addi	sp,sp,48
    8000410c:	00008067          	ret

0000000080004110 <uartputc_sync>:
    80004110:	ff010113          	addi	sp,sp,-16
    80004114:	00813423          	sd	s0,8(sp)
    80004118:	01010413          	addi	s0,sp,16
    8000411c:	00002717          	auipc	a4,0x2
    80004120:	dcc72703          	lw	a4,-564(a4) # 80005ee8 <panicked>
    80004124:	02071663          	bnez	a4,80004150 <uartputc_sync+0x40>
    80004128:	00050793          	mv	a5,a0
    8000412c:	100006b7          	lui	a3,0x10000
    80004130:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004134:	02077713          	andi	a4,a4,32
    80004138:	fe070ce3          	beqz	a4,80004130 <uartputc_sync+0x20>
    8000413c:	0ff7f793          	andi	a5,a5,255
    80004140:	00f68023          	sb	a5,0(a3)
    80004144:	00813403          	ld	s0,8(sp)
    80004148:	01010113          	addi	sp,sp,16
    8000414c:	00008067          	ret
    80004150:	0000006f          	j	80004150 <uartputc_sync+0x40>

0000000080004154 <uartstart>:
    80004154:	ff010113          	addi	sp,sp,-16
    80004158:	00813423          	sd	s0,8(sp)
    8000415c:	01010413          	addi	s0,sp,16
    80004160:	00002617          	auipc	a2,0x2
    80004164:	d9060613          	addi	a2,a2,-624 # 80005ef0 <uart_tx_r>
    80004168:	00002517          	auipc	a0,0x2
    8000416c:	d9050513          	addi	a0,a0,-624 # 80005ef8 <uart_tx_w>
    80004170:	00063783          	ld	a5,0(a2)
    80004174:	00053703          	ld	a4,0(a0)
    80004178:	04f70263          	beq	a4,a5,800041bc <uartstart+0x68>
    8000417c:	100005b7          	lui	a1,0x10000
    80004180:	00003817          	auipc	a6,0x3
    80004184:	fe080813          	addi	a6,a6,-32 # 80007160 <uart_tx_buf>
    80004188:	01c0006f          	j	800041a4 <uartstart+0x50>
    8000418c:	0006c703          	lbu	a4,0(a3)
    80004190:	00f63023          	sd	a5,0(a2)
    80004194:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004198:	00063783          	ld	a5,0(a2)
    8000419c:	00053703          	ld	a4,0(a0)
    800041a0:	00f70e63          	beq	a4,a5,800041bc <uartstart+0x68>
    800041a4:	01f7f713          	andi	a4,a5,31
    800041a8:	00e806b3          	add	a3,a6,a4
    800041ac:	0055c703          	lbu	a4,5(a1)
    800041b0:	00178793          	addi	a5,a5,1
    800041b4:	02077713          	andi	a4,a4,32
    800041b8:	fc071ae3          	bnez	a4,8000418c <uartstart+0x38>
    800041bc:	00813403          	ld	s0,8(sp)
    800041c0:	01010113          	addi	sp,sp,16
    800041c4:	00008067          	ret

00000000800041c8 <uartgetc>:
    800041c8:	ff010113          	addi	sp,sp,-16
    800041cc:	00813423          	sd	s0,8(sp)
    800041d0:	01010413          	addi	s0,sp,16
    800041d4:	10000737          	lui	a4,0x10000
    800041d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800041dc:	0017f793          	andi	a5,a5,1
    800041e0:	00078c63          	beqz	a5,800041f8 <uartgetc+0x30>
    800041e4:	00074503          	lbu	a0,0(a4)
    800041e8:	0ff57513          	andi	a0,a0,255
    800041ec:	00813403          	ld	s0,8(sp)
    800041f0:	01010113          	addi	sp,sp,16
    800041f4:	00008067          	ret
    800041f8:	fff00513          	li	a0,-1
    800041fc:	ff1ff06f          	j	800041ec <uartgetc+0x24>

0000000080004200 <uartintr>:
    80004200:	100007b7          	lui	a5,0x10000
    80004204:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004208:	0017f793          	andi	a5,a5,1
    8000420c:	0a078463          	beqz	a5,800042b4 <uartintr+0xb4>
    80004210:	fe010113          	addi	sp,sp,-32
    80004214:	00813823          	sd	s0,16(sp)
    80004218:	00913423          	sd	s1,8(sp)
    8000421c:	00113c23          	sd	ra,24(sp)
    80004220:	02010413          	addi	s0,sp,32
    80004224:	100004b7          	lui	s1,0x10000
    80004228:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000422c:	0ff57513          	andi	a0,a0,255
    80004230:	fffff097          	auipc	ra,0xfffff
    80004234:	534080e7          	jalr	1332(ra) # 80003764 <consoleintr>
    80004238:	0054c783          	lbu	a5,5(s1)
    8000423c:	0017f793          	andi	a5,a5,1
    80004240:	fe0794e3          	bnez	a5,80004228 <uartintr+0x28>
    80004244:	00002617          	auipc	a2,0x2
    80004248:	cac60613          	addi	a2,a2,-852 # 80005ef0 <uart_tx_r>
    8000424c:	00002517          	auipc	a0,0x2
    80004250:	cac50513          	addi	a0,a0,-852 # 80005ef8 <uart_tx_w>
    80004254:	00063783          	ld	a5,0(a2)
    80004258:	00053703          	ld	a4,0(a0)
    8000425c:	04f70263          	beq	a4,a5,800042a0 <uartintr+0xa0>
    80004260:	100005b7          	lui	a1,0x10000
    80004264:	00003817          	auipc	a6,0x3
    80004268:	efc80813          	addi	a6,a6,-260 # 80007160 <uart_tx_buf>
    8000426c:	01c0006f          	j	80004288 <uartintr+0x88>
    80004270:	0006c703          	lbu	a4,0(a3)
    80004274:	00f63023          	sd	a5,0(a2)
    80004278:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000427c:	00063783          	ld	a5,0(a2)
    80004280:	00053703          	ld	a4,0(a0)
    80004284:	00f70e63          	beq	a4,a5,800042a0 <uartintr+0xa0>
    80004288:	01f7f713          	andi	a4,a5,31
    8000428c:	00e806b3          	add	a3,a6,a4
    80004290:	0055c703          	lbu	a4,5(a1)
    80004294:	00178793          	addi	a5,a5,1
    80004298:	02077713          	andi	a4,a4,32
    8000429c:	fc071ae3          	bnez	a4,80004270 <uartintr+0x70>
    800042a0:	01813083          	ld	ra,24(sp)
    800042a4:	01013403          	ld	s0,16(sp)
    800042a8:	00813483          	ld	s1,8(sp)
    800042ac:	02010113          	addi	sp,sp,32
    800042b0:	00008067          	ret
    800042b4:	00002617          	auipc	a2,0x2
    800042b8:	c3c60613          	addi	a2,a2,-964 # 80005ef0 <uart_tx_r>
    800042bc:	00002517          	auipc	a0,0x2
    800042c0:	c3c50513          	addi	a0,a0,-964 # 80005ef8 <uart_tx_w>
    800042c4:	00063783          	ld	a5,0(a2)
    800042c8:	00053703          	ld	a4,0(a0)
    800042cc:	04f70263          	beq	a4,a5,80004310 <uartintr+0x110>
    800042d0:	100005b7          	lui	a1,0x10000
    800042d4:	00003817          	auipc	a6,0x3
    800042d8:	e8c80813          	addi	a6,a6,-372 # 80007160 <uart_tx_buf>
    800042dc:	01c0006f          	j	800042f8 <uartintr+0xf8>
    800042e0:	0006c703          	lbu	a4,0(a3)
    800042e4:	00f63023          	sd	a5,0(a2)
    800042e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800042ec:	00063783          	ld	a5,0(a2)
    800042f0:	00053703          	ld	a4,0(a0)
    800042f4:	02f70063          	beq	a4,a5,80004314 <uartintr+0x114>
    800042f8:	01f7f713          	andi	a4,a5,31
    800042fc:	00e806b3          	add	a3,a6,a4
    80004300:	0055c703          	lbu	a4,5(a1)
    80004304:	00178793          	addi	a5,a5,1
    80004308:	02077713          	andi	a4,a4,32
    8000430c:	fc071ae3          	bnez	a4,800042e0 <uartintr+0xe0>
    80004310:	00008067          	ret
    80004314:	00008067          	ret

0000000080004318 <kinit>:
    80004318:	fc010113          	addi	sp,sp,-64
    8000431c:	02913423          	sd	s1,40(sp)
    80004320:	fffff7b7          	lui	a5,0xfffff
    80004324:	00004497          	auipc	s1,0x4
    80004328:	e5b48493          	addi	s1,s1,-421 # 8000817f <end+0xfff>
    8000432c:	02813823          	sd	s0,48(sp)
    80004330:	01313c23          	sd	s3,24(sp)
    80004334:	00f4f4b3          	and	s1,s1,a5
    80004338:	02113c23          	sd	ra,56(sp)
    8000433c:	03213023          	sd	s2,32(sp)
    80004340:	01413823          	sd	s4,16(sp)
    80004344:	01513423          	sd	s5,8(sp)
    80004348:	04010413          	addi	s0,sp,64
    8000434c:	000017b7          	lui	a5,0x1
    80004350:	01100993          	li	s3,17
    80004354:	00f487b3          	add	a5,s1,a5
    80004358:	01b99993          	slli	s3,s3,0x1b
    8000435c:	06f9e063          	bltu	s3,a5,800043bc <kinit+0xa4>
    80004360:	00003a97          	auipc	s5,0x3
    80004364:	e20a8a93          	addi	s5,s5,-480 # 80007180 <end>
    80004368:	0754ec63          	bltu	s1,s5,800043e0 <kinit+0xc8>
    8000436c:	0734fa63          	bgeu	s1,s3,800043e0 <kinit+0xc8>
    80004370:	00088a37          	lui	s4,0x88
    80004374:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004378:	00002917          	auipc	s2,0x2
    8000437c:	b8890913          	addi	s2,s2,-1144 # 80005f00 <kmem>
    80004380:	00ca1a13          	slli	s4,s4,0xc
    80004384:	0140006f          	j	80004398 <kinit+0x80>
    80004388:	000017b7          	lui	a5,0x1
    8000438c:	00f484b3          	add	s1,s1,a5
    80004390:	0554e863          	bltu	s1,s5,800043e0 <kinit+0xc8>
    80004394:	0534f663          	bgeu	s1,s3,800043e0 <kinit+0xc8>
    80004398:	00001637          	lui	a2,0x1
    8000439c:	00100593          	li	a1,1
    800043a0:	00048513          	mv	a0,s1
    800043a4:	00000097          	auipc	ra,0x0
    800043a8:	5e4080e7          	jalr	1508(ra) # 80004988 <__memset>
    800043ac:	00093783          	ld	a5,0(s2)
    800043b0:	00f4b023          	sd	a5,0(s1)
    800043b4:	00993023          	sd	s1,0(s2)
    800043b8:	fd4498e3          	bne	s1,s4,80004388 <kinit+0x70>
    800043bc:	03813083          	ld	ra,56(sp)
    800043c0:	03013403          	ld	s0,48(sp)
    800043c4:	02813483          	ld	s1,40(sp)
    800043c8:	02013903          	ld	s2,32(sp)
    800043cc:	01813983          	ld	s3,24(sp)
    800043d0:	01013a03          	ld	s4,16(sp)
    800043d4:	00813a83          	ld	s5,8(sp)
    800043d8:	04010113          	addi	sp,sp,64
    800043dc:	00008067          	ret
    800043e0:	00001517          	auipc	a0,0x1
    800043e4:	0d050513          	addi	a0,a0,208 # 800054b0 <digits+0x18>
    800043e8:	fffff097          	auipc	ra,0xfffff
    800043ec:	4b4080e7          	jalr	1204(ra) # 8000389c <panic>

00000000800043f0 <freerange>:
    800043f0:	fc010113          	addi	sp,sp,-64
    800043f4:	000017b7          	lui	a5,0x1
    800043f8:	02913423          	sd	s1,40(sp)
    800043fc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004400:	009504b3          	add	s1,a0,s1
    80004404:	fffff537          	lui	a0,0xfffff
    80004408:	02813823          	sd	s0,48(sp)
    8000440c:	02113c23          	sd	ra,56(sp)
    80004410:	03213023          	sd	s2,32(sp)
    80004414:	01313c23          	sd	s3,24(sp)
    80004418:	01413823          	sd	s4,16(sp)
    8000441c:	01513423          	sd	s5,8(sp)
    80004420:	01613023          	sd	s6,0(sp)
    80004424:	04010413          	addi	s0,sp,64
    80004428:	00a4f4b3          	and	s1,s1,a0
    8000442c:	00f487b3          	add	a5,s1,a5
    80004430:	06f5e463          	bltu	a1,a5,80004498 <freerange+0xa8>
    80004434:	00003a97          	auipc	s5,0x3
    80004438:	d4ca8a93          	addi	s5,s5,-692 # 80007180 <end>
    8000443c:	0954e263          	bltu	s1,s5,800044c0 <freerange+0xd0>
    80004440:	01100993          	li	s3,17
    80004444:	01b99993          	slli	s3,s3,0x1b
    80004448:	0734fc63          	bgeu	s1,s3,800044c0 <freerange+0xd0>
    8000444c:	00058a13          	mv	s4,a1
    80004450:	00002917          	auipc	s2,0x2
    80004454:	ab090913          	addi	s2,s2,-1360 # 80005f00 <kmem>
    80004458:	00002b37          	lui	s6,0x2
    8000445c:	0140006f          	j	80004470 <freerange+0x80>
    80004460:	000017b7          	lui	a5,0x1
    80004464:	00f484b3          	add	s1,s1,a5
    80004468:	0554ec63          	bltu	s1,s5,800044c0 <freerange+0xd0>
    8000446c:	0534fa63          	bgeu	s1,s3,800044c0 <freerange+0xd0>
    80004470:	00001637          	lui	a2,0x1
    80004474:	00100593          	li	a1,1
    80004478:	00048513          	mv	a0,s1
    8000447c:	00000097          	auipc	ra,0x0
    80004480:	50c080e7          	jalr	1292(ra) # 80004988 <__memset>
    80004484:	00093703          	ld	a4,0(s2)
    80004488:	016487b3          	add	a5,s1,s6
    8000448c:	00e4b023          	sd	a4,0(s1)
    80004490:	00993023          	sd	s1,0(s2)
    80004494:	fcfa76e3          	bgeu	s4,a5,80004460 <freerange+0x70>
    80004498:	03813083          	ld	ra,56(sp)
    8000449c:	03013403          	ld	s0,48(sp)
    800044a0:	02813483          	ld	s1,40(sp)
    800044a4:	02013903          	ld	s2,32(sp)
    800044a8:	01813983          	ld	s3,24(sp)
    800044ac:	01013a03          	ld	s4,16(sp)
    800044b0:	00813a83          	ld	s5,8(sp)
    800044b4:	00013b03          	ld	s6,0(sp)
    800044b8:	04010113          	addi	sp,sp,64
    800044bc:	00008067          	ret
    800044c0:	00001517          	auipc	a0,0x1
    800044c4:	ff050513          	addi	a0,a0,-16 # 800054b0 <digits+0x18>
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	3d4080e7          	jalr	980(ra) # 8000389c <panic>

00000000800044d0 <kfree>:
    800044d0:	fe010113          	addi	sp,sp,-32
    800044d4:	00813823          	sd	s0,16(sp)
    800044d8:	00113c23          	sd	ra,24(sp)
    800044dc:	00913423          	sd	s1,8(sp)
    800044e0:	02010413          	addi	s0,sp,32
    800044e4:	03451793          	slli	a5,a0,0x34
    800044e8:	04079c63          	bnez	a5,80004540 <kfree+0x70>
    800044ec:	00003797          	auipc	a5,0x3
    800044f0:	c9478793          	addi	a5,a5,-876 # 80007180 <end>
    800044f4:	00050493          	mv	s1,a0
    800044f8:	04f56463          	bltu	a0,a5,80004540 <kfree+0x70>
    800044fc:	01100793          	li	a5,17
    80004500:	01b79793          	slli	a5,a5,0x1b
    80004504:	02f57e63          	bgeu	a0,a5,80004540 <kfree+0x70>
    80004508:	00001637          	lui	a2,0x1
    8000450c:	00100593          	li	a1,1
    80004510:	00000097          	auipc	ra,0x0
    80004514:	478080e7          	jalr	1144(ra) # 80004988 <__memset>
    80004518:	00002797          	auipc	a5,0x2
    8000451c:	9e878793          	addi	a5,a5,-1560 # 80005f00 <kmem>
    80004520:	0007b703          	ld	a4,0(a5)
    80004524:	01813083          	ld	ra,24(sp)
    80004528:	01013403          	ld	s0,16(sp)
    8000452c:	00e4b023          	sd	a4,0(s1)
    80004530:	0097b023          	sd	s1,0(a5)
    80004534:	00813483          	ld	s1,8(sp)
    80004538:	02010113          	addi	sp,sp,32
    8000453c:	00008067          	ret
    80004540:	00001517          	auipc	a0,0x1
    80004544:	f7050513          	addi	a0,a0,-144 # 800054b0 <digits+0x18>
    80004548:	fffff097          	auipc	ra,0xfffff
    8000454c:	354080e7          	jalr	852(ra) # 8000389c <panic>

0000000080004550 <kalloc>:
    80004550:	fe010113          	addi	sp,sp,-32
    80004554:	00813823          	sd	s0,16(sp)
    80004558:	00913423          	sd	s1,8(sp)
    8000455c:	00113c23          	sd	ra,24(sp)
    80004560:	02010413          	addi	s0,sp,32
    80004564:	00002797          	auipc	a5,0x2
    80004568:	99c78793          	addi	a5,a5,-1636 # 80005f00 <kmem>
    8000456c:	0007b483          	ld	s1,0(a5)
    80004570:	02048063          	beqz	s1,80004590 <kalloc+0x40>
    80004574:	0004b703          	ld	a4,0(s1)
    80004578:	00001637          	lui	a2,0x1
    8000457c:	00500593          	li	a1,5
    80004580:	00048513          	mv	a0,s1
    80004584:	00e7b023          	sd	a4,0(a5)
    80004588:	00000097          	auipc	ra,0x0
    8000458c:	400080e7          	jalr	1024(ra) # 80004988 <__memset>
    80004590:	01813083          	ld	ra,24(sp)
    80004594:	01013403          	ld	s0,16(sp)
    80004598:	00048513          	mv	a0,s1
    8000459c:	00813483          	ld	s1,8(sp)
    800045a0:	02010113          	addi	sp,sp,32
    800045a4:	00008067          	ret

00000000800045a8 <initlock>:
    800045a8:	ff010113          	addi	sp,sp,-16
    800045ac:	00813423          	sd	s0,8(sp)
    800045b0:	01010413          	addi	s0,sp,16
    800045b4:	00813403          	ld	s0,8(sp)
    800045b8:	00b53423          	sd	a1,8(a0)
    800045bc:	00052023          	sw	zero,0(a0)
    800045c0:	00053823          	sd	zero,16(a0)
    800045c4:	01010113          	addi	sp,sp,16
    800045c8:	00008067          	ret

00000000800045cc <acquire>:
    800045cc:	fe010113          	addi	sp,sp,-32
    800045d0:	00813823          	sd	s0,16(sp)
    800045d4:	00913423          	sd	s1,8(sp)
    800045d8:	00113c23          	sd	ra,24(sp)
    800045dc:	01213023          	sd	s2,0(sp)
    800045e0:	02010413          	addi	s0,sp,32
    800045e4:	00050493          	mv	s1,a0
    800045e8:	10002973          	csrr	s2,sstatus
    800045ec:	100027f3          	csrr	a5,sstatus
    800045f0:	ffd7f793          	andi	a5,a5,-3
    800045f4:	10079073          	csrw	sstatus,a5
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	8e8080e7          	jalr	-1816(ra) # 80002ee0 <mycpu>
    80004600:	07852783          	lw	a5,120(a0)
    80004604:	06078e63          	beqz	a5,80004680 <acquire+0xb4>
    80004608:	fffff097          	auipc	ra,0xfffff
    8000460c:	8d8080e7          	jalr	-1832(ra) # 80002ee0 <mycpu>
    80004610:	07852783          	lw	a5,120(a0)
    80004614:	0004a703          	lw	a4,0(s1)
    80004618:	0017879b          	addiw	a5,a5,1
    8000461c:	06f52c23          	sw	a5,120(a0)
    80004620:	04071063          	bnez	a4,80004660 <acquire+0x94>
    80004624:	00100713          	li	a4,1
    80004628:	00070793          	mv	a5,a4
    8000462c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004630:	0007879b          	sext.w	a5,a5
    80004634:	fe079ae3          	bnez	a5,80004628 <acquire+0x5c>
    80004638:	0ff0000f          	fence
    8000463c:	fffff097          	auipc	ra,0xfffff
    80004640:	8a4080e7          	jalr	-1884(ra) # 80002ee0 <mycpu>
    80004644:	01813083          	ld	ra,24(sp)
    80004648:	01013403          	ld	s0,16(sp)
    8000464c:	00a4b823          	sd	a0,16(s1)
    80004650:	00013903          	ld	s2,0(sp)
    80004654:	00813483          	ld	s1,8(sp)
    80004658:	02010113          	addi	sp,sp,32
    8000465c:	00008067          	ret
    80004660:	0104b903          	ld	s2,16(s1)
    80004664:	fffff097          	auipc	ra,0xfffff
    80004668:	87c080e7          	jalr	-1924(ra) # 80002ee0 <mycpu>
    8000466c:	faa91ce3          	bne	s2,a0,80004624 <acquire+0x58>
    80004670:	00001517          	auipc	a0,0x1
    80004674:	e4850513          	addi	a0,a0,-440 # 800054b8 <digits+0x20>
    80004678:	fffff097          	auipc	ra,0xfffff
    8000467c:	224080e7          	jalr	548(ra) # 8000389c <panic>
    80004680:	00195913          	srli	s2,s2,0x1
    80004684:	fffff097          	auipc	ra,0xfffff
    80004688:	85c080e7          	jalr	-1956(ra) # 80002ee0 <mycpu>
    8000468c:	00197913          	andi	s2,s2,1
    80004690:	07252e23          	sw	s2,124(a0)
    80004694:	f75ff06f          	j	80004608 <acquire+0x3c>

0000000080004698 <release>:
    80004698:	fe010113          	addi	sp,sp,-32
    8000469c:	00813823          	sd	s0,16(sp)
    800046a0:	00113c23          	sd	ra,24(sp)
    800046a4:	00913423          	sd	s1,8(sp)
    800046a8:	01213023          	sd	s2,0(sp)
    800046ac:	02010413          	addi	s0,sp,32
    800046b0:	00052783          	lw	a5,0(a0)
    800046b4:	00079a63          	bnez	a5,800046c8 <release+0x30>
    800046b8:	00001517          	auipc	a0,0x1
    800046bc:	e0850513          	addi	a0,a0,-504 # 800054c0 <digits+0x28>
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	1dc080e7          	jalr	476(ra) # 8000389c <panic>
    800046c8:	01053903          	ld	s2,16(a0)
    800046cc:	00050493          	mv	s1,a0
    800046d0:	fffff097          	auipc	ra,0xfffff
    800046d4:	810080e7          	jalr	-2032(ra) # 80002ee0 <mycpu>
    800046d8:	fea910e3          	bne	s2,a0,800046b8 <release+0x20>
    800046dc:	0004b823          	sd	zero,16(s1)
    800046e0:	0ff0000f          	fence
    800046e4:	0f50000f          	fence	iorw,ow
    800046e8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	7f4080e7          	jalr	2036(ra) # 80002ee0 <mycpu>
    800046f4:	100027f3          	csrr	a5,sstatus
    800046f8:	0027f793          	andi	a5,a5,2
    800046fc:	04079a63          	bnez	a5,80004750 <release+0xb8>
    80004700:	07852783          	lw	a5,120(a0)
    80004704:	02f05e63          	blez	a5,80004740 <release+0xa8>
    80004708:	fff7871b          	addiw	a4,a5,-1
    8000470c:	06e52c23          	sw	a4,120(a0)
    80004710:	00071c63          	bnez	a4,80004728 <release+0x90>
    80004714:	07c52783          	lw	a5,124(a0)
    80004718:	00078863          	beqz	a5,80004728 <release+0x90>
    8000471c:	100027f3          	csrr	a5,sstatus
    80004720:	0027e793          	ori	a5,a5,2
    80004724:	10079073          	csrw	sstatus,a5
    80004728:	01813083          	ld	ra,24(sp)
    8000472c:	01013403          	ld	s0,16(sp)
    80004730:	00813483          	ld	s1,8(sp)
    80004734:	00013903          	ld	s2,0(sp)
    80004738:	02010113          	addi	sp,sp,32
    8000473c:	00008067          	ret
    80004740:	00001517          	auipc	a0,0x1
    80004744:	da050513          	addi	a0,a0,-608 # 800054e0 <digits+0x48>
    80004748:	fffff097          	auipc	ra,0xfffff
    8000474c:	154080e7          	jalr	340(ra) # 8000389c <panic>
    80004750:	00001517          	auipc	a0,0x1
    80004754:	d7850513          	addi	a0,a0,-648 # 800054c8 <digits+0x30>
    80004758:	fffff097          	auipc	ra,0xfffff
    8000475c:	144080e7          	jalr	324(ra) # 8000389c <panic>

0000000080004760 <holding>:
    80004760:	00052783          	lw	a5,0(a0)
    80004764:	00079663          	bnez	a5,80004770 <holding+0x10>
    80004768:	00000513          	li	a0,0
    8000476c:	00008067          	ret
    80004770:	fe010113          	addi	sp,sp,-32
    80004774:	00813823          	sd	s0,16(sp)
    80004778:	00913423          	sd	s1,8(sp)
    8000477c:	00113c23          	sd	ra,24(sp)
    80004780:	02010413          	addi	s0,sp,32
    80004784:	01053483          	ld	s1,16(a0)
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	758080e7          	jalr	1880(ra) # 80002ee0 <mycpu>
    80004790:	01813083          	ld	ra,24(sp)
    80004794:	01013403          	ld	s0,16(sp)
    80004798:	40a48533          	sub	a0,s1,a0
    8000479c:	00153513          	seqz	a0,a0
    800047a0:	00813483          	ld	s1,8(sp)
    800047a4:	02010113          	addi	sp,sp,32
    800047a8:	00008067          	ret

00000000800047ac <push_off>:
    800047ac:	fe010113          	addi	sp,sp,-32
    800047b0:	00813823          	sd	s0,16(sp)
    800047b4:	00113c23          	sd	ra,24(sp)
    800047b8:	00913423          	sd	s1,8(sp)
    800047bc:	02010413          	addi	s0,sp,32
    800047c0:	100024f3          	csrr	s1,sstatus
    800047c4:	100027f3          	csrr	a5,sstatus
    800047c8:	ffd7f793          	andi	a5,a5,-3
    800047cc:	10079073          	csrw	sstatus,a5
    800047d0:	ffffe097          	auipc	ra,0xffffe
    800047d4:	710080e7          	jalr	1808(ra) # 80002ee0 <mycpu>
    800047d8:	07852783          	lw	a5,120(a0)
    800047dc:	02078663          	beqz	a5,80004808 <push_off+0x5c>
    800047e0:	ffffe097          	auipc	ra,0xffffe
    800047e4:	700080e7          	jalr	1792(ra) # 80002ee0 <mycpu>
    800047e8:	07852783          	lw	a5,120(a0)
    800047ec:	01813083          	ld	ra,24(sp)
    800047f0:	01013403          	ld	s0,16(sp)
    800047f4:	0017879b          	addiw	a5,a5,1
    800047f8:	06f52c23          	sw	a5,120(a0)
    800047fc:	00813483          	ld	s1,8(sp)
    80004800:	02010113          	addi	sp,sp,32
    80004804:	00008067          	ret
    80004808:	0014d493          	srli	s1,s1,0x1
    8000480c:	ffffe097          	auipc	ra,0xffffe
    80004810:	6d4080e7          	jalr	1748(ra) # 80002ee0 <mycpu>
    80004814:	0014f493          	andi	s1,s1,1
    80004818:	06952e23          	sw	s1,124(a0)
    8000481c:	fc5ff06f          	j	800047e0 <push_off+0x34>

0000000080004820 <pop_off>:
    80004820:	ff010113          	addi	sp,sp,-16
    80004824:	00813023          	sd	s0,0(sp)
    80004828:	00113423          	sd	ra,8(sp)
    8000482c:	01010413          	addi	s0,sp,16
    80004830:	ffffe097          	auipc	ra,0xffffe
    80004834:	6b0080e7          	jalr	1712(ra) # 80002ee0 <mycpu>
    80004838:	100027f3          	csrr	a5,sstatus
    8000483c:	0027f793          	andi	a5,a5,2
    80004840:	04079663          	bnez	a5,8000488c <pop_off+0x6c>
    80004844:	07852783          	lw	a5,120(a0)
    80004848:	02f05a63          	blez	a5,8000487c <pop_off+0x5c>
    8000484c:	fff7871b          	addiw	a4,a5,-1
    80004850:	06e52c23          	sw	a4,120(a0)
    80004854:	00071c63          	bnez	a4,8000486c <pop_off+0x4c>
    80004858:	07c52783          	lw	a5,124(a0)
    8000485c:	00078863          	beqz	a5,8000486c <pop_off+0x4c>
    80004860:	100027f3          	csrr	a5,sstatus
    80004864:	0027e793          	ori	a5,a5,2
    80004868:	10079073          	csrw	sstatus,a5
    8000486c:	00813083          	ld	ra,8(sp)
    80004870:	00013403          	ld	s0,0(sp)
    80004874:	01010113          	addi	sp,sp,16
    80004878:	00008067          	ret
    8000487c:	00001517          	auipc	a0,0x1
    80004880:	c6450513          	addi	a0,a0,-924 # 800054e0 <digits+0x48>
    80004884:	fffff097          	auipc	ra,0xfffff
    80004888:	018080e7          	jalr	24(ra) # 8000389c <panic>
    8000488c:	00001517          	auipc	a0,0x1
    80004890:	c3c50513          	addi	a0,a0,-964 # 800054c8 <digits+0x30>
    80004894:	fffff097          	auipc	ra,0xfffff
    80004898:	008080e7          	jalr	8(ra) # 8000389c <panic>

000000008000489c <push_on>:
    8000489c:	fe010113          	addi	sp,sp,-32
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00113c23          	sd	ra,24(sp)
    800048a8:	00913423          	sd	s1,8(sp)
    800048ac:	02010413          	addi	s0,sp,32
    800048b0:	100024f3          	csrr	s1,sstatus
    800048b4:	100027f3          	csrr	a5,sstatus
    800048b8:	0027e793          	ori	a5,a5,2
    800048bc:	10079073          	csrw	sstatus,a5
    800048c0:	ffffe097          	auipc	ra,0xffffe
    800048c4:	620080e7          	jalr	1568(ra) # 80002ee0 <mycpu>
    800048c8:	07852783          	lw	a5,120(a0)
    800048cc:	02078663          	beqz	a5,800048f8 <push_on+0x5c>
    800048d0:	ffffe097          	auipc	ra,0xffffe
    800048d4:	610080e7          	jalr	1552(ra) # 80002ee0 <mycpu>
    800048d8:	07852783          	lw	a5,120(a0)
    800048dc:	01813083          	ld	ra,24(sp)
    800048e0:	01013403          	ld	s0,16(sp)
    800048e4:	0017879b          	addiw	a5,a5,1
    800048e8:	06f52c23          	sw	a5,120(a0)
    800048ec:	00813483          	ld	s1,8(sp)
    800048f0:	02010113          	addi	sp,sp,32
    800048f4:	00008067          	ret
    800048f8:	0014d493          	srli	s1,s1,0x1
    800048fc:	ffffe097          	auipc	ra,0xffffe
    80004900:	5e4080e7          	jalr	1508(ra) # 80002ee0 <mycpu>
    80004904:	0014f493          	andi	s1,s1,1
    80004908:	06952e23          	sw	s1,124(a0)
    8000490c:	fc5ff06f          	j	800048d0 <push_on+0x34>

0000000080004910 <pop_on>:
    80004910:	ff010113          	addi	sp,sp,-16
    80004914:	00813023          	sd	s0,0(sp)
    80004918:	00113423          	sd	ra,8(sp)
    8000491c:	01010413          	addi	s0,sp,16
    80004920:	ffffe097          	auipc	ra,0xffffe
    80004924:	5c0080e7          	jalr	1472(ra) # 80002ee0 <mycpu>
    80004928:	100027f3          	csrr	a5,sstatus
    8000492c:	0027f793          	andi	a5,a5,2
    80004930:	04078463          	beqz	a5,80004978 <pop_on+0x68>
    80004934:	07852783          	lw	a5,120(a0)
    80004938:	02f05863          	blez	a5,80004968 <pop_on+0x58>
    8000493c:	fff7879b          	addiw	a5,a5,-1
    80004940:	06f52c23          	sw	a5,120(a0)
    80004944:	07853783          	ld	a5,120(a0)
    80004948:	00079863          	bnez	a5,80004958 <pop_on+0x48>
    8000494c:	100027f3          	csrr	a5,sstatus
    80004950:	ffd7f793          	andi	a5,a5,-3
    80004954:	10079073          	csrw	sstatus,a5
    80004958:	00813083          	ld	ra,8(sp)
    8000495c:	00013403          	ld	s0,0(sp)
    80004960:	01010113          	addi	sp,sp,16
    80004964:	00008067          	ret
    80004968:	00001517          	auipc	a0,0x1
    8000496c:	ba050513          	addi	a0,a0,-1120 # 80005508 <digits+0x70>
    80004970:	fffff097          	auipc	ra,0xfffff
    80004974:	f2c080e7          	jalr	-212(ra) # 8000389c <panic>
    80004978:	00001517          	auipc	a0,0x1
    8000497c:	b7050513          	addi	a0,a0,-1168 # 800054e8 <digits+0x50>
    80004980:	fffff097          	auipc	ra,0xfffff
    80004984:	f1c080e7          	jalr	-228(ra) # 8000389c <panic>

0000000080004988 <__memset>:
    80004988:	ff010113          	addi	sp,sp,-16
    8000498c:	00813423          	sd	s0,8(sp)
    80004990:	01010413          	addi	s0,sp,16
    80004994:	1a060e63          	beqz	a2,80004b50 <__memset+0x1c8>
    80004998:	40a007b3          	neg	a5,a0
    8000499c:	0077f793          	andi	a5,a5,7
    800049a0:	00778693          	addi	a3,a5,7
    800049a4:	00b00813          	li	a6,11
    800049a8:	0ff5f593          	andi	a1,a1,255
    800049ac:	fff6071b          	addiw	a4,a2,-1
    800049b0:	1b06e663          	bltu	a3,a6,80004b5c <__memset+0x1d4>
    800049b4:	1cd76463          	bltu	a4,a3,80004b7c <__memset+0x1f4>
    800049b8:	1a078e63          	beqz	a5,80004b74 <__memset+0x1ec>
    800049bc:	00b50023          	sb	a1,0(a0)
    800049c0:	00100713          	li	a4,1
    800049c4:	1ae78463          	beq	a5,a4,80004b6c <__memset+0x1e4>
    800049c8:	00b500a3          	sb	a1,1(a0)
    800049cc:	00200713          	li	a4,2
    800049d0:	1ae78a63          	beq	a5,a4,80004b84 <__memset+0x1fc>
    800049d4:	00b50123          	sb	a1,2(a0)
    800049d8:	00300713          	li	a4,3
    800049dc:	18e78463          	beq	a5,a4,80004b64 <__memset+0x1dc>
    800049e0:	00b501a3          	sb	a1,3(a0)
    800049e4:	00400713          	li	a4,4
    800049e8:	1ae78263          	beq	a5,a4,80004b8c <__memset+0x204>
    800049ec:	00b50223          	sb	a1,4(a0)
    800049f0:	00500713          	li	a4,5
    800049f4:	1ae78063          	beq	a5,a4,80004b94 <__memset+0x20c>
    800049f8:	00b502a3          	sb	a1,5(a0)
    800049fc:	00700713          	li	a4,7
    80004a00:	18e79e63          	bne	a5,a4,80004b9c <__memset+0x214>
    80004a04:	00b50323          	sb	a1,6(a0)
    80004a08:	00700e93          	li	t4,7
    80004a0c:	00859713          	slli	a4,a1,0x8
    80004a10:	00e5e733          	or	a4,a1,a4
    80004a14:	01059e13          	slli	t3,a1,0x10
    80004a18:	01c76e33          	or	t3,a4,t3
    80004a1c:	01859313          	slli	t1,a1,0x18
    80004a20:	006e6333          	or	t1,t3,t1
    80004a24:	02059893          	slli	a7,a1,0x20
    80004a28:	40f60e3b          	subw	t3,a2,a5
    80004a2c:	011368b3          	or	a7,t1,a7
    80004a30:	02859813          	slli	a6,a1,0x28
    80004a34:	0108e833          	or	a6,a7,a6
    80004a38:	03059693          	slli	a3,a1,0x30
    80004a3c:	003e589b          	srliw	a7,t3,0x3
    80004a40:	00d866b3          	or	a3,a6,a3
    80004a44:	03859713          	slli	a4,a1,0x38
    80004a48:	00389813          	slli	a6,a7,0x3
    80004a4c:	00f507b3          	add	a5,a0,a5
    80004a50:	00e6e733          	or	a4,a3,a4
    80004a54:	000e089b          	sext.w	a7,t3
    80004a58:	00f806b3          	add	a3,a6,a5
    80004a5c:	00e7b023          	sd	a4,0(a5)
    80004a60:	00878793          	addi	a5,a5,8
    80004a64:	fed79ce3          	bne	a5,a3,80004a5c <__memset+0xd4>
    80004a68:	ff8e7793          	andi	a5,t3,-8
    80004a6c:	0007871b          	sext.w	a4,a5
    80004a70:	01d787bb          	addw	a5,a5,t4
    80004a74:	0ce88e63          	beq	a7,a4,80004b50 <__memset+0x1c8>
    80004a78:	00f50733          	add	a4,a0,a5
    80004a7c:	00b70023          	sb	a1,0(a4)
    80004a80:	0017871b          	addiw	a4,a5,1
    80004a84:	0cc77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004a88:	00e50733          	add	a4,a0,a4
    80004a8c:	00b70023          	sb	a1,0(a4)
    80004a90:	0027871b          	addiw	a4,a5,2
    80004a94:	0ac77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004a98:	00e50733          	add	a4,a0,a4
    80004a9c:	00b70023          	sb	a1,0(a4)
    80004aa0:	0037871b          	addiw	a4,a5,3
    80004aa4:	0ac77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004aa8:	00e50733          	add	a4,a0,a4
    80004aac:	00b70023          	sb	a1,0(a4)
    80004ab0:	0047871b          	addiw	a4,a5,4
    80004ab4:	08c77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004ab8:	00e50733          	add	a4,a0,a4
    80004abc:	00b70023          	sb	a1,0(a4)
    80004ac0:	0057871b          	addiw	a4,a5,5
    80004ac4:	08c77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004ac8:	00e50733          	add	a4,a0,a4
    80004acc:	00b70023          	sb	a1,0(a4)
    80004ad0:	0067871b          	addiw	a4,a5,6
    80004ad4:	06c77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004ad8:	00e50733          	add	a4,a0,a4
    80004adc:	00b70023          	sb	a1,0(a4)
    80004ae0:	0077871b          	addiw	a4,a5,7
    80004ae4:	06c77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004ae8:	00e50733          	add	a4,a0,a4
    80004aec:	00b70023          	sb	a1,0(a4)
    80004af0:	0087871b          	addiw	a4,a5,8
    80004af4:	04c77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004af8:	00e50733          	add	a4,a0,a4
    80004afc:	00b70023          	sb	a1,0(a4)
    80004b00:	0097871b          	addiw	a4,a5,9
    80004b04:	04c77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004b08:	00e50733          	add	a4,a0,a4
    80004b0c:	00b70023          	sb	a1,0(a4)
    80004b10:	00a7871b          	addiw	a4,a5,10
    80004b14:	02c77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004b18:	00e50733          	add	a4,a0,a4
    80004b1c:	00b70023          	sb	a1,0(a4)
    80004b20:	00b7871b          	addiw	a4,a5,11
    80004b24:	02c77663          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004b28:	00e50733          	add	a4,a0,a4
    80004b2c:	00b70023          	sb	a1,0(a4)
    80004b30:	00c7871b          	addiw	a4,a5,12
    80004b34:	00c77e63          	bgeu	a4,a2,80004b50 <__memset+0x1c8>
    80004b38:	00e50733          	add	a4,a0,a4
    80004b3c:	00b70023          	sb	a1,0(a4)
    80004b40:	00d7879b          	addiw	a5,a5,13
    80004b44:	00c7f663          	bgeu	a5,a2,80004b50 <__memset+0x1c8>
    80004b48:	00f507b3          	add	a5,a0,a5
    80004b4c:	00b78023          	sb	a1,0(a5)
    80004b50:	00813403          	ld	s0,8(sp)
    80004b54:	01010113          	addi	sp,sp,16
    80004b58:	00008067          	ret
    80004b5c:	00b00693          	li	a3,11
    80004b60:	e55ff06f          	j	800049b4 <__memset+0x2c>
    80004b64:	00300e93          	li	t4,3
    80004b68:	ea5ff06f          	j	80004a0c <__memset+0x84>
    80004b6c:	00100e93          	li	t4,1
    80004b70:	e9dff06f          	j	80004a0c <__memset+0x84>
    80004b74:	00000e93          	li	t4,0
    80004b78:	e95ff06f          	j	80004a0c <__memset+0x84>
    80004b7c:	00000793          	li	a5,0
    80004b80:	ef9ff06f          	j	80004a78 <__memset+0xf0>
    80004b84:	00200e93          	li	t4,2
    80004b88:	e85ff06f          	j	80004a0c <__memset+0x84>
    80004b8c:	00400e93          	li	t4,4
    80004b90:	e7dff06f          	j	80004a0c <__memset+0x84>
    80004b94:	00500e93          	li	t4,5
    80004b98:	e75ff06f          	j	80004a0c <__memset+0x84>
    80004b9c:	00600e93          	li	t4,6
    80004ba0:	e6dff06f          	j	80004a0c <__memset+0x84>

0000000080004ba4 <__memmove>:
    80004ba4:	ff010113          	addi	sp,sp,-16
    80004ba8:	00813423          	sd	s0,8(sp)
    80004bac:	01010413          	addi	s0,sp,16
    80004bb0:	0e060863          	beqz	a2,80004ca0 <__memmove+0xfc>
    80004bb4:	fff6069b          	addiw	a3,a2,-1
    80004bb8:	0006881b          	sext.w	a6,a3
    80004bbc:	0ea5e863          	bltu	a1,a0,80004cac <__memmove+0x108>
    80004bc0:	00758713          	addi	a4,a1,7
    80004bc4:	00a5e7b3          	or	a5,a1,a0
    80004bc8:	40a70733          	sub	a4,a4,a0
    80004bcc:	0077f793          	andi	a5,a5,7
    80004bd0:	00f73713          	sltiu	a4,a4,15
    80004bd4:	00174713          	xori	a4,a4,1
    80004bd8:	0017b793          	seqz	a5,a5
    80004bdc:	00e7f7b3          	and	a5,a5,a4
    80004be0:	10078863          	beqz	a5,80004cf0 <__memmove+0x14c>
    80004be4:	00900793          	li	a5,9
    80004be8:	1107f463          	bgeu	a5,a6,80004cf0 <__memmove+0x14c>
    80004bec:	0036581b          	srliw	a6,a2,0x3
    80004bf0:	fff8081b          	addiw	a6,a6,-1
    80004bf4:	02081813          	slli	a6,a6,0x20
    80004bf8:	01d85893          	srli	a7,a6,0x1d
    80004bfc:	00858813          	addi	a6,a1,8
    80004c00:	00058793          	mv	a5,a1
    80004c04:	00050713          	mv	a4,a0
    80004c08:	01088833          	add	a6,a7,a6
    80004c0c:	0007b883          	ld	a7,0(a5)
    80004c10:	00878793          	addi	a5,a5,8
    80004c14:	00870713          	addi	a4,a4,8
    80004c18:	ff173c23          	sd	a7,-8(a4)
    80004c1c:	ff0798e3          	bne	a5,a6,80004c0c <__memmove+0x68>
    80004c20:	ff867713          	andi	a4,a2,-8
    80004c24:	02071793          	slli	a5,a4,0x20
    80004c28:	0207d793          	srli	a5,a5,0x20
    80004c2c:	00f585b3          	add	a1,a1,a5
    80004c30:	40e686bb          	subw	a3,a3,a4
    80004c34:	00f507b3          	add	a5,a0,a5
    80004c38:	06e60463          	beq	a2,a4,80004ca0 <__memmove+0xfc>
    80004c3c:	0005c703          	lbu	a4,0(a1)
    80004c40:	00e78023          	sb	a4,0(a5)
    80004c44:	04068e63          	beqz	a3,80004ca0 <__memmove+0xfc>
    80004c48:	0015c603          	lbu	a2,1(a1)
    80004c4c:	00100713          	li	a4,1
    80004c50:	00c780a3          	sb	a2,1(a5)
    80004c54:	04e68663          	beq	a3,a4,80004ca0 <__memmove+0xfc>
    80004c58:	0025c603          	lbu	a2,2(a1)
    80004c5c:	00200713          	li	a4,2
    80004c60:	00c78123          	sb	a2,2(a5)
    80004c64:	02e68e63          	beq	a3,a4,80004ca0 <__memmove+0xfc>
    80004c68:	0035c603          	lbu	a2,3(a1)
    80004c6c:	00300713          	li	a4,3
    80004c70:	00c781a3          	sb	a2,3(a5)
    80004c74:	02e68663          	beq	a3,a4,80004ca0 <__memmove+0xfc>
    80004c78:	0045c603          	lbu	a2,4(a1)
    80004c7c:	00400713          	li	a4,4
    80004c80:	00c78223          	sb	a2,4(a5)
    80004c84:	00e68e63          	beq	a3,a4,80004ca0 <__memmove+0xfc>
    80004c88:	0055c603          	lbu	a2,5(a1)
    80004c8c:	00500713          	li	a4,5
    80004c90:	00c782a3          	sb	a2,5(a5)
    80004c94:	00e68663          	beq	a3,a4,80004ca0 <__memmove+0xfc>
    80004c98:	0065c703          	lbu	a4,6(a1)
    80004c9c:	00e78323          	sb	a4,6(a5)
    80004ca0:	00813403          	ld	s0,8(sp)
    80004ca4:	01010113          	addi	sp,sp,16
    80004ca8:	00008067          	ret
    80004cac:	02061713          	slli	a4,a2,0x20
    80004cb0:	02075713          	srli	a4,a4,0x20
    80004cb4:	00e587b3          	add	a5,a1,a4
    80004cb8:	f0f574e3          	bgeu	a0,a5,80004bc0 <__memmove+0x1c>
    80004cbc:	02069613          	slli	a2,a3,0x20
    80004cc0:	02065613          	srli	a2,a2,0x20
    80004cc4:	fff64613          	not	a2,a2
    80004cc8:	00e50733          	add	a4,a0,a4
    80004ccc:	00c78633          	add	a2,a5,a2
    80004cd0:	fff7c683          	lbu	a3,-1(a5)
    80004cd4:	fff78793          	addi	a5,a5,-1
    80004cd8:	fff70713          	addi	a4,a4,-1
    80004cdc:	00d70023          	sb	a3,0(a4)
    80004ce0:	fec798e3          	bne	a5,a2,80004cd0 <__memmove+0x12c>
    80004ce4:	00813403          	ld	s0,8(sp)
    80004ce8:	01010113          	addi	sp,sp,16
    80004cec:	00008067          	ret
    80004cf0:	02069713          	slli	a4,a3,0x20
    80004cf4:	02075713          	srli	a4,a4,0x20
    80004cf8:	00170713          	addi	a4,a4,1
    80004cfc:	00e50733          	add	a4,a0,a4
    80004d00:	00050793          	mv	a5,a0
    80004d04:	0005c683          	lbu	a3,0(a1)
    80004d08:	00178793          	addi	a5,a5,1
    80004d0c:	00158593          	addi	a1,a1,1
    80004d10:	fed78fa3          	sb	a3,-1(a5)
    80004d14:	fee798e3          	bne	a5,a4,80004d04 <__memmove+0x160>
    80004d18:	f89ff06f          	j	80004ca0 <__memmove+0xfc>

0000000080004d1c <__putc>:
    80004d1c:	fe010113          	addi	sp,sp,-32
    80004d20:	00813823          	sd	s0,16(sp)
    80004d24:	00113c23          	sd	ra,24(sp)
    80004d28:	02010413          	addi	s0,sp,32
    80004d2c:	00050793          	mv	a5,a0
    80004d30:	fef40593          	addi	a1,s0,-17
    80004d34:	00100613          	li	a2,1
    80004d38:	00000513          	li	a0,0
    80004d3c:	fef407a3          	sb	a5,-17(s0)
    80004d40:	fffff097          	auipc	ra,0xfffff
    80004d44:	b3c080e7          	jalr	-1220(ra) # 8000387c <console_write>
    80004d48:	01813083          	ld	ra,24(sp)
    80004d4c:	01013403          	ld	s0,16(sp)
    80004d50:	02010113          	addi	sp,sp,32
    80004d54:	00008067          	ret

0000000080004d58 <__getc>:
    80004d58:	fe010113          	addi	sp,sp,-32
    80004d5c:	00813823          	sd	s0,16(sp)
    80004d60:	00113c23          	sd	ra,24(sp)
    80004d64:	02010413          	addi	s0,sp,32
    80004d68:	fe840593          	addi	a1,s0,-24
    80004d6c:	00100613          	li	a2,1
    80004d70:	00000513          	li	a0,0
    80004d74:	fffff097          	auipc	ra,0xfffff
    80004d78:	ae8080e7          	jalr	-1304(ra) # 8000385c <console_read>
    80004d7c:	fe844503          	lbu	a0,-24(s0)
    80004d80:	01813083          	ld	ra,24(sp)
    80004d84:	01013403          	ld	s0,16(sp)
    80004d88:	02010113          	addi	sp,sp,32
    80004d8c:	00008067          	ret

0000000080004d90 <console_handler>:
    80004d90:	fe010113          	addi	sp,sp,-32
    80004d94:	00813823          	sd	s0,16(sp)
    80004d98:	00113c23          	sd	ra,24(sp)
    80004d9c:	00913423          	sd	s1,8(sp)
    80004da0:	02010413          	addi	s0,sp,32
    80004da4:	14202773          	csrr	a4,scause
    80004da8:	100027f3          	csrr	a5,sstatus
    80004dac:	0027f793          	andi	a5,a5,2
    80004db0:	06079e63          	bnez	a5,80004e2c <console_handler+0x9c>
    80004db4:	00074c63          	bltz	a4,80004dcc <console_handler+0x3c>
    80004db8:	01813083          	ld	ra,24(sp)
    80004dbc:	01013403          	ld	s0,16(sp)
    80004dc0:	00813483          	ld	s1,8(sp)
    80004dc4:	02010113          	addi	sp,sp,32
    80004dc8:	00008067          	ret
    80004dcc:	0ff77713          	andi	a4,a4,255
    80004dd0:	00900793          	li	a5,9
    80004dd4:	fef712e3          	bne	a4,a5,80004db8 <console_handler+0x28>
    80004dd8:	ffffe097          	auipc	ra,0xffffe
    80004ddc:	6dc080e7          	jalr	1756(ra) # 800034b4 <plic_claim>
    80004de0:	00a00793          	li	a5,10
    80004de4:	00050493          	mv	s1,a0
    80004de8:	02f50c63          	beq	a0,a5,80004e20 <console_handler+0x90>
    80004dec:	fc0506e3          	beqz	a0,80004db8 <console_handler+0x28>
    80004df0:	00050593          	mv	a1,a0
    80004df4:	00000517          	auipc	a0,0x0
    80004df8:	61c50513          	addi	a0,a0,1564 # 80005410 <CONSOLE_STATUS+0x400>
    80004dfc:	fffff097          	auipc	ra,0xfffff
    80004e00:	afc080e7          	jalr	-1284(ra) # 800038f8 <__printf>
    80004e04:	01013403          	ld	s0,16(sp)
    80004e08:	01813083          	ld	ra,24(sp)
    80004e0c:	00048513          	mv	a0,s1
    80004e10:	00813483          	ld	s1,8(sp)
    80004e14:	02010113          	addi	sp,sp,32
    80004e18:	ffffe317          	auipc	t1,0xffffe
    80004e1c:	6d430067          	jr	1748(t1) # 800034ec <plic_complete>
    80004e20:	fffff097          	auipc	ra,0xfffff
    80004e24:	3e0080e7          	jalr	992(ra) # 80004200 <uartintr>
    80004e28:	fddff06f          	j	80004e04 <console_handler+0x74>
    80004e2c:	00000517          	auipc	a0,0x0
    80004e30:	6e450513          	addi	a0,a0,1764 # 80005510 <digits+0x78>
    80004e34:	fffff097          	auipc	ra,0xfffff
    80004e38:	a68080e7          	jalr	-1432(ra) # 8000389c <panic>
	...
