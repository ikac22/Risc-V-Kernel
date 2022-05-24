
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	c2813103          	ld	sp,-984(sp) # 80005c28 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	021020ef          	jal	ra,8000283c <start>

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
    80001080:	2a8000ef          	jal	ra,80001328 <interrupt>

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

0000000080001124 <_Z13timer_handlerv>:
    

    //TODO: smanjivanje vremena spavanja threadova
    
    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    80001124:	00005717          	auipc	a4,0x5
    80001128:	b7c70713          	addi	a4,a4,-1156 # 80005ca0 <_ZN3TCB16timeSliceCounterE>
    8000112c:	00073783          	ld	a5,0(a4)
    80001130:	00178793          	addi	a5,a5,1
    80001134:	00f73023          	sd	a5,0(a4)
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
    80001138:	00005717          	auipc	a4,0x5
    8000113c:	b7070713          	addi	a4,a4,-1168 # 80005ca8 <_ZN3TCB7runningE>
    80001140:	00073703          	ld	a4,0(a4)
    
    //da li je thread zavrsen
    bool isFinished() const { return finished; }
    void setFinished() {finished = true;}
    
    uint64 getTimeSlice() { return timeSlice; }
    80001144:	01873703          	ld	a4,24(a4)
    80001148:	00e7f863          	bgeu	a5,a4,80001158 <_Z13timer_handlerv+0x34>
inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
    8000114c:	00200793          	li	a5,2
    80001150:	1447b073          	csrc	sip,a5
    80001154:	00008067          	ret
void timer_handler(){
    80001158:	fd010113          	addi	sp,sp,-48
    8000115c:	02113423          	sd	ra,40(sp)
    80001160:	02813023          	sd	s0,32(sp)
    80001164:	03010413          	addi	s0,sp,48
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001168:	100027f3          	csrr	a5,sstatus
    8000116c:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80001170:	fe843783          	ld	a5,-24(s0)
        //uint64 sip = Riscv::r_sip();
        volatile uint64 sstatus = Riscv::r_sstatus(),
    80001174:	fcf43823          	sd	a5,-48(s0)
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    80001178:	141027f3          	csrr	a5,sepc
    8000117c:	fef43023          	sd	a5,-32(s0)
    return sepc;
    80001180:	fe043783          	ld	a5,-32(s0)
        sepc = Riscv::r_sepc()/*, ra, sp*/;
    80001184:	fcf43c23          	sd	a5,-40(s0)
        
        TCB::timeSliceCounter = 0;
    80001188:	00005797          	auipc	a5,0x5
    8000118c:	b007bc23          	sd	zero,-1256(a5) # 80005ca0 <_ZN3TCB16timeSliceCounterE>
        
        TCB::dispatch();
    80001190:	00001097          	auipc	ra,0x1
    80001194:	f50080e7          	jalr	-176(ra) # 800020e0 <_ZN3TCB8dispatchEv>

        Riscv::w_sstatus(sstatus);
    80001198:	fd043783          	ld	a5,-48(s0)
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    8000119c:	10079073          	csrw	sstatus,a5
        Riscv::w_sepc(sepc);
    800011a0:	fd843783          	ld	a5,-40(s0)
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    800011a4:	14179073          	csrw	sepc,a5
    asm volatile ("csrc sip, %0" : : "r" (mask));
    800011a8:	00200793          	li	a5,2
    800011ac:	1447b073          	csrc	sip,a5
        //Riscv::w_sip(sip);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}
    800011b0:	02813083          	ld	ra,40(sp)
    800011b4:	02013403          	ld	s0,32(sp)
    800011b8:	03010113          	addi	sp,sp,48
    800011bc:	00008067          	ret

00000000800011c0 <_Z8usrEcallmmmmm>:

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    800011c0:	ff010113          	addi	sp,sp,-16
    800011c4:	00813423          	sd	s0,8(sp)
    800011c8:	01010413          	addi	s0,sp,16
    return a0;
}
    800011cc:	00813403          	ld	s0,8(sp)
    800011d0:	01010113          	addi	sp,sp,16
    800011d4:	00008067          	ret

00000000800011d8 <_Z8sysEcallmmmmm>:

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){    
    800011d8:	fb010113          	addi	sp,sp,-80
    800011dc:	04113423          	sd	ra,72(sp)
    800011e0:	04813023          	sd	s0,64(sp)
    800011e4:	02913c23          	sd	s1,56(sp)
    800011e8:	05010413          	addi	s0,sp,80
    800011ec:	00058493          	mv	s1,a1
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    800011f0:	141027f3          	csrr	a5,sepc
    800011f4:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800011f8:	fc043783          	ld	a5,-64(s0)
    volatile uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    800011fc:	00478793          	addi	a5,a5,4
    80001200:	fcf43c23          	sd	a5,-40(s0)
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80001204:	100027f3          	csrr	a5,sstatus
    80001208:	faf43c23          	sd	a5,-72(s0)
    return sstatus;
    8000120c:	fb843783          	ld	a5,-72(s0)
    80001210:	fcf43823          	sd	a5,-48(s0)
    80001214:	fca43423          	sd	a0,-56(s0)
    if(a0 == 0x1){
    80001218:	00100793          	li	a5,1
    8000121c:	04f50863          	beq	a0,a5,8000126c <_Z8sysEcallmmmmm+0x94>
    80001220:	00060813          	mv	a6,a2
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        
    }else if(a0 == 0x2){
    80001224:	00200793          	li	a5,2
    80001228:	06f50063          	beq	a0,a5,80001288 <_Z8sysEcallmmmmm+0xb0>
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }else if(a0 == 0x11){
    8000122c:	01100793          	li	a5,17
    80001230:	06f50a63          	beq	a0,a5,800012a4 <_Z8sysEcallmmmmm+0xcc>
        //thread_create
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(*t) ret = 0;
        else ret = -1;
    }else if(a0 == 0x12){
    80001234:	01200793          	li	a5,18
    80001238:	08f50e63          	beq	a0,a5,800012d4 <_Z8sysEcallmmmmm+0xfc>
        //thread_exit
        TCB::running->setFinished();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == 0x13){
    8000123c:	01300793          	li	a5,19
    80001240:	0af50e63          	beq	a0,a5,800012fc <_Z8sysEcallmmmmm+0x124>
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }else if(a0 == 0x69){
    80001244:	06900793          	li	a5,105
    80001248:	0cf50863          	beq	a0,a5,80001318 <_Z8sysEcallmmmmm+0x140>
        //delete ha ndle
        TCB::deleteThread((TCB*)a1);
    }
    Riscv::w_sepc(sepc);
    8000124c:	fd843783          	ld	a5,-40(s0)
    asm volatile("csrw sepc, %0" : : "r" (sepc));
    80001250:	14179073          	csrw	sepc,a5
    return ret;
    80001254:	fc843503          	ld	a0,-56(s0)
}
    80001258:	04813083          	ld	ra,72(sp)
    8000125c:	04013403          	ld	s0,64(sp)
    80001260:	03813483          	ld	s1,56(sp)
    80001264:	05010113          	addi	sp,sp,80
    80001268:	00008067          	ret
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	6d8080e7          	jalr	1752(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001274:	00048593          	mv	a1,s1
    80001278:	00000097          	auipc	ra,0x0
    8000127c:	73c080e7          	jalr	1852(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    80001280:	fca43423          	sd	a0,-56(s0)
    80001284:	fc9ff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    80001288:	00000097          	auipc	ra,0x0
    8000128c:	6bc080e7          	jalr	1724(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001290:	00048593          	mv	a1,s1
    80001294:	00001097          	auipc	ra,0x1
    80001298:	8b8080e7          	jalr	-1864(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    8000129c:	fca43423          	sd	a0,-56(s0)
    800012a0:	fadff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
    800012a4:	00070613          	mv	a2,a4
    800012a8:	00068593          	mv	a1,a3
    800012ac:	00080513          	mv	a0,a6
    800012b0:	00001097          	auipc	ra,0x1
    800012b4:	d88080e7          	jalr	-632(ra) # 80002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800012b8:	00a4b023          	sd	a0,0(s1)
        if(*t) ret = 0;
    800012bc:	00050663          	beqz	a0,800012c8 <_Z8sysEcallmmmmm+0xf0>
    800012c0:	fc043423          	sd	zero,-56(s0)
    800012c4:	f89ff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        else ret = -1;
    800012c8:	fff00793          	li	a5,-1
    800012cc:	fcf43423          	sd	a5,-56(s0)
    800012d0:	f7dff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        TCB::running->setFinished();
    800012d4:	00005797          	auipc	a5,0x5
    800012d8:	9d478793          	addi	a5,a5,-1580 # 80005ca8 <_ZN3TCB7runningE>
    800012dc:	0007b783          	ld	a5,0(a5)
    void setFinished() {finished = true;}
    800012e0:	00100713          	li	a4,1
    800012e4:	02e78023          	sb	a4,32(a5)
        TCB::dispatch();
    800012e8:	00001097          	auipc	ra,0x1
    800012ec:	df8080e7          	jalr	-520(ra) # 800020e0 <_ZN3TCB8dispatchEv>
        Riscv::w_sstatus(sstatus);
    800012f0:	fd043783          	ld	a5,-48(s0)
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
    800012f4:	10079073          	csrw	sstatus,a5
    800012f8:	f55ff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        TCB::timeSliceCounter = 0; 
    800012fc:	00005797          	auipc	a5,0x5
    80001300:	9a07b223          	sd	zero,-1628(a5) # 80005ca0 <_ZN3TCB16timeSliceCounterE>
        TCB::dispatch();
    80001304:	00001097          	auipc	ra,0x1
    80001308:	ddc080e7          	jalr	-548(ra) # 800020e0 <_ZN3TCB8dispatchEv>
        Riscv::w_sstatus(sstatus);
    8000130c:	fd043783          	ld	a5,-48(s0)
    80001310:	10079073          	csrw	sstatus,a5
    80001314:	f39ff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>
        TCB::deleteThread((TCB*)a1);
    80001318:	00058513          	mv	a0,a1
    8000131c:	00001097          	auipc	ra,0x1
    80001320:	e30080e7          	jalr	-464(ra) # 8000214c <_ZN3TCB12deleteThreadEPS_>
    80001324:	f29ff06f          	j	8000124c <_Z8sysEcallmmmmm+0x74>

0000000080001328 <interrupt>:

extern "C" void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    80001328:	fe010113          	addi	sp,sp,-32
    8000132c:	00113c23          	sd	ra,24(sp)
    80001330:	00813823          	sd	s0,16(sp)
    80001334:	02010413          	addi	s0,sp,32
    asm volatile("csrr %0, scause" : "=r" (scause));
    80001338:	142027f3          	csrr	a5,scause
    8000133c:	fef43423          	sd	a5,-24(s0)
    return scause;
    80001340:	fe843783          	ld	a5,-24(s0)
    /*uint64 a0_s = a0, a1_s = a1, 
        a2_s = a2, a3_s = a3, 
        a4_s = a4;*/  
    uint64 scause = Riscv::r_scause();
    static int t = 0;
    if(scause == 9){
    80001344:	00900813          	li	a6,9
    80001348:	07078e63          	beq	a5,a6,800013c4 <interrupt+0x9c>
        //ecall iz sistemskog rezima
        
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } else if(scause == 8){
    8000134c:	00800813          	li	a6,8
    80001350:	09078263          	beq	a5,a6,800013d4 <interrupt+0xac>
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } else if(scause == 0x8000000000000009){
    80001354:	fff00713          	li	a4,-1
    80001358:	03f71713          	slli	a4,a4,0x3f
    8000135c:	00970713          	addi	a4,a4,9
    80001360:	08e78863          	beq	a5,a4,800013f0 <interrupt+0xc8>
        //hardverski prekid
       console_handler();
    
    } else if(scause == 0x8000000000000001){
    80001364:	fff00713          	li	a4,-1
    80001368:	03f71713          	slli	a4,a4,0x3f
    8000136c:	00170713          	addi	a4,a4,1
    80001370:	08e78663          	beq	a5,a4,800013fc <interrupt+0xd4>
        //prekid od timera
        timer_handler();      
    
    }else if(scause == 2){
    80001374:	00200713          	li	a4,2
    80001378:	08e78863          	beq	a5,a4,80001408 <interrupt+0xe0>
        if(t<5){
            print(scause);
            t++;
        }
    }else if(scause == 1){
    8000137c:	00100713          	li	a4,1
    80001380:	0ce78463          	beq	a5,a4,80001448 <interrupt+0x120>
        if(t<10){
            print(scause);
            t++;
        }
    }else{
        if(t<15){
    80001384:	00005717          	auipc	a4,0x5
    80001388:	90c70713          	addi	a4,a4,-1780 # 80005c90 <_ZZ9interruptE1t>
    8000138c:	00072683          	lw	a3,0(a4)
    80001390:	00e00713          	li	a4,14
    80001394:	04d74663          	blt	a4,a3,800013e0 <interrupt+0xb8>
            print(scause);
    80001398:	00100613          	li	a2,1
    8000139c:	00a00593          	li	a1,10
    800013a0:	00078513          	mv	a0,a5
    800013a4:	00001097          	auipc	ra,0x1
    800013a8:	e24080e7          	jalr	-476(ra) # 800021c8 <_Z5printmcb>
            t++;
    800013ac:	00005717          	auipc	a4,0x5
    800013b0:	8e470713          	addi	a4,a4,-1820 # 80005c90 <_ZZ9interruptE1t>
    800013b4:	00072783          	lw	a5,0(a4)
    800013b8:	0017879b          	addiw	a5,a5,1
    800013bc:	00f72023          	sw	a5,0(a4)
        }
    }
    800013c0:	0200006f          	j	800013e0 <interrupt+0xb8>
        a0 = sysEcall(a0, a1, a2, a3, a4);
    800013c4:	00000097          	auipc	ra,0x0
    800013c8:	e14080e7          	jalr	-492(ra) # 800011d8 <_Z8sysEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800013cc:	04a43823          	sd	a0,80(s0)
    800013d0:	0100006f          	j	800013e0 <interrupt+0xb8>
        a0 = usrEcall(a0, a1, a2, a3, a4);
    800013d4:	00000097          	auipc	ra,0x0
    800013d8:	dec080e7          	jalr	-532(ra) # 800011c0 <_Z8usrEcallmmmmm>
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    800013dc:	04a43823          	sd	a0,80(s0)
    800013e0:	01813083          	ld	ra,24(sp)
    800013e4:	01013403          	ld	s0,16(sp)
    800013e8:	02010113          	addi	sp,sp,32
    800013ec:	00008067          	ret
       console_handler();
    800013f0:	00003097          	auipc	ra,0x3
    800013f4:	580080e7          	jalr	1408(ra) # 80004970 <console_handler>
    800013f8:	fe9ff06f          	j	800013e0 <interrupt+0xb8>
        timer_handler();      
    800013fc:	00000097          	auipc	ra,0x0
    80001400:	d28080e7          	jalr	-728(ra) # 80001124 <_Z13timer_handlerv>
    80001404:	fddff06f          	j	800013e0 <interrupt+0xb8>
        if(t<5){
    80001408:	00005717          	auipc	a4,0x5
    8000140c:	88870713          	addi	a4,a4,-1912 # 80005c90 <_ZZ9interruptE1t>
    80001410:	00072683          	lw	a3,0(a4)
    80001414:	00400713          	li	a4,4
    80001418:	fcd744e3          	blt	a4,a3,800013e0 <interrupt+0xb8>
            print(scause);
    8000141c:	00100613          	li	a2,1
    80001420:	00a00593          	li	a1,10
    80001424:	00078513          	mv	a0,a5
    80001428:	00001097          	auipc	ra,0x1
    8000142c:	da0080e7          	jalr	-608(ra) # 800021c8 <_Z5printmcb>
            t++;
    80001430:	00005717          	auipc	a4,0x5
    80001434:	86070713          	addi	a4,a4,-1952 # 80005c90 <_ZZ9interruptE1t>
    80001438:	00072783          	lw	a5,0(a4)
    8000143c:	0017879b          	addiw	a5,a5,1
    80001440:	00f72023          	sw	a5,0(a4)
    80001444:	f9dff06f          	j	800013e0 <interrupt+0xb8>
        if(t<10){
    80001448:	00005717          	auipc	a4,0x5
    8000144c:	84870713          	addi	a4,a4,-1976 # 80005c90 <_ZZ9interruptE1t>
    80001450:	00072683          	lw	a3,0(a4)
    80001454:	00900713          	li	a4,9
    80001458:	f8d744e3          	blt	a4,a3,800013e0 <interrupt+0xb8>
            print(scause);
    8000145c:	00100613          	li	a2,1
    80001460:	00a00593          	li	a1,10
    80001464:	00078513          	mv	a0,a5
    80001468:	00001097          	auipc	ra,0x1
    8000146c:	d60080e7          	jalr	-672(ra) # 800021c8 <_Z5printmcb>
            t++;
    80001470:	00005717          	auipc	a4,0x5
    80001474:	82070713          	addi	a4,a4,-2016 # 80005c90 <_ZZ9interruptE1t>
    80001478:	00072783          	lw	a5,0(a4)
    8000147c:	0017879b          	addiw	a5,a5,1
    80001480:	00f72023          	sw	a5,0(a4)
    80001484:	f5dff06f          	j	800013e0 <interrupt+0xb8>

0000000080001488 <_Z11workerBodyAPv>:

void userMain(){

}

void workerBodyA(void*) {
    80001488:	fe010113          	addi	sp,sp,-32
    8000148c:	00113c23          	sd	ra,24(sp)
    80001490:	00813823          	sd	s0,16(sp)
    80001494:	00913423          	sd	s1,8(sp)
    80001498:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000149c:	00000493          	li	s1,0
    800014a0:	0300006f          	j	800014d0 <_Z11workerBodyAPv+0x48>
        print("A: i=", i, 0);
        for (uint64 j = 0; j < 10000; j++) {
    800014a4:	00168693          	addi	a3,a3,1
    800014a8:	000027b7          	lui	a5,0x2
    800014ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800014b0:	00d7ee63          	bltu	a5,a3,800014cc <_Z11workerBodyAPv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800014b4:	00000713          	li	a4,0
    800014b8:	000077b7          	lui	a5,0x7
    800014bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800014c0:	fee7e2e3          	bltu	a5,a4,800014a4 <_Z11workerBodyAPv+0x1c>
    800014c4:	00170713          	addi	a4,a4,1
    800014c8:	ff1ff06f          	j	800014b8 <_Z11workerBodyAPv+0x30>
    for (uint64 i = 0; i < 10; i++) {
    800014cc:	00148493          	addi	s1,s1,1
    800014d0:	00900793          	li	a5,9
    800014d4:	0297e263          	bltu	a5,s1,800014f8 <_Z11workerBodyAPv+0x70>
        print("A: i=", i, 0);
    800014d8:	00000613          	li	a2,0
    800014dc:	00048593          	mv	a1,s1
    800014e0:	00004517          	auipc	a0,0x4
    800014e4:	b4050513          	addi	a0,a0,-1216 # 80005020 <CONSOLE_STATUS+0x10>
    800014e8:	00001097          	auipc	ra,0x1
    800014ec:	eb8080e7          	jalr	-328(ra) # 800023a0 <_Z5printPKcmb>
        for (uint64 j = 0; j < 10000; j++) {
    800014f0:	00000693          	li	a3,0
    800014f4:	fb5ff06f          	j	800014a8 <_Z11workerBodyAPv+0x20>
            // TCB::yield();
        }
    }
}
    800014f8:	01813083          	ld	ra,24(sp)
    800014fc:	01013403          	ld	s0,16(sp)
    80001500:	00813483          	ld	s1,8(sp)
    80001504:	02010113          	addi	sp,sp,32
    80001508:	00008067          	ret

000000008000150c <_Z11workerBodyBPv>:

void workerBodyB(void*) {
    8000150c:	fe010113          	addi	sp,sp,-32
    80001510:	00113c23          	sd	ra,24(sp)
    80001514:	00813823          	sd	s0,16(sp)
    80001518:	00913423          	sd	s1,8(sp)
    8000151c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001520:	00000493          	li	s1,0
    80001524:	0300006f          	j	80001554 <_Z11workerBodyBPv+0x48>
        print("B: i=", i, 0);
        for (uint64 j = 0; j < 10000; j++) {
    80001528:	00168693          	addi	a3,a3,1
    8000152c:	000027b7          	lui	a5,0x2
    80001530:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001534:	00d7ee63          	bltu	a5,a3,80001550 <_Z11workerBodyBPv+0x44>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001538:	00000713          	li	a4,0
    8000153c:	000077b7          	lui	a5,0x7
    80001540:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001544:	fee7e2e3          	bltu	a5,a4,80001528 <_Z11workerBodyBPv+0x1c>
    80001548:	00170713          	addi	a4,a4,1
    8000154c:	ff1ff06f          	j	8000153c <_Z11workerBodyBPv+0x30>
    for (uint64 i = 0; i < 16; i++) {
    80001550:	00148493          	addi	s1,s1,1
    80001554:	00f00793          	li	a5,15
    80001558:	0297e263          	bltu	a5,s1,8000157c <_Z11workerBodyBPv+0x70>
        print("B: i=", i, 0);
    8000155c:	00000613          	li	a2,0
    80001560:	00048593          	mv	a1,s1
    80001564:	00004517          	auipc	a0,0x4
    80001568:	ac450513          	addi	a0,a0,-1340 # 80005028 <CONSOLE_STATUS+0x18>
    8000156c:	00001097          	auipc	ra,0x1
    80001570:	e34080e7          	jalr	-460(ra) # 800023a0 <_Z5printPKcmb>
        for (uint64 j = 0; j < 10000; j++) {
    80001574:	00000693          	li	a3,0
    80001578:	fb5ff06f          	j	8000152c <_Z11workerBodyBPv+0x20>
            // TCB::yield();
        }
    }
}
    8000157c:	01813083          	ld	ra,24(sp)
    80001580:	01013403          	ld	s0,16(sp)
    80001584:	00813483          	ld	s1,8(sp)
    80001588:	02010113          	addi	sp,sp,32
    8000158c:	00008067          	ret

0000000080001590 <_Z8userMainv>:
void userMain(){
    80001590:	ff010113          	addi	sp,sp,-16
    80001594:	00813423          	sd	s0,8(sp)
    80001598:	01010413          	addi	s0,sp,16
}
    8000159c:	00813403          	ld	s0,8(sp)
    800015a0:	01010113          	addi	sp,sp,16
    800015a4:	00008067          	ret

00000000800015a8 <_Z9fibonaccim>:

uint64 fibonacci(uint64 n) {
    if (n == 0 || n == 1) { return n; }
    800015a8:	00100793          	li	a5,1
    800015ac:	06a7f863          	bgeu	a5,a0,8000161c <_Z9fibonaccim+0x74>
uint64 fibonacci(uint64 n) {
    800015b0:	fe010113          	addi	sp,sp,-32
    800015b4:	00113c23          	sd	ra,24(sp)
    800015b8:	00813823          	sd	s0,16(sp)
    800015bc:	00913423          	sd	s1,8(sp)
    800015c0:	01213023          	sd	s2,0(sp)
    800015c4:	02010413          	addi	s0,sp,32
    800015c8:	00050493          	mv	s1,a0
    if (n % 10 == 0) { thread_dispatch(); }
    800015cc:	00a00793          	li	a5,10
    800015d0:	02f577b3          	remu	a5,a0,a5
    800015d4:	02078e63          	beqz	a5,80001610 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800015d8:	fff48513          	addi	a0,s1,-1
    800015dc:	00000097          	auipc	ra,0x0
    800015e0:	fcc080e7          	jalr	-52(ra) # 800015a8 <_Z9fibonaccim>
    800015e4:	00050913          	mv	s2,a0
    800015e8:	ffe48513          	addi	a0,s1,-2
    800015ec:	00000097          	auipc	ra,0x0
    800015f0:	fbc080e7          	jalr	-68(ra) # 800015a8 <_Z9fibonaccim>
    800015f4:	00a90533          	add	a0,s2,a0
}
    800015f8:	01813083          	ld	ra,24(sp)
    800015fc:	01013403          	ld	s0,16(sp)
    80001600:	00813483          	ld	s1,8(sp)
    80001604:	00013903          	ld	s2,0(sp)
    80001608:	02010113          	addi	sp,sp,32
    8000160c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001610:	00001097          	auipc	ra,0x1
    80001614:	1a4080e7          	jalr	420(ra) # 800027b4 <thread_dispatch>
    80001618:	fc1ff06f          	j	800015d8 <_Z9fibonaccim+0x30>
}
    8000161c:	00008067          	ret

0000000080001620 <_Z11workerBodyCPv>:

void workerBodyC(void*) {
    80001620:	fe010113          	addi	sp,sp,-32
    80001624:	00113c23          	sd	ra,24(sp)
    80001628:	00813823          	sd	s0,16(sp)
    8000162c:	00913423          	sd	s1,8(sp)
    80001630:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001634:	00000493          	li	s1,0
    for (; i < 3; i++) {
    80001638:	00200793          	li	a5,2
    8000163c:	0297e463          	bltu	a5,s1,80001664 <_Z11workerBodyCPv+0x44>
        print("C: i=", i, 0);
    80001640:	00000613          	li	a2,0
    80001644:	00048593          	mv	a1,s1
    80001648:	00004517          	auipc	a0,0x4
    8000164c:	9e850513          	addi	a0,a0,-1560 # 80005030 <CONSOLE_STATUS+0x20>
    80001650:	00001097          	auipc	ra,0x1
    80001654:	d50080e7          	jalr	-688(ra) # 800023a0 <_Z5printPKcmb>
    for (; i < 3; i++) {
    80001658:	0014849b          	addiw	s1,s1,1
    8000165c:	0ff4f493          	andi	s1,s1,255
    80001660:	fd9ff06f          	j	80001638 <_Z11workerBodyCPv+0x18>
    }

    print("C: yield");
    80001664:	00a00593          	li	a1,10
    80001668:	00004517          	auipc	a0,0x4
    8000166c:	9d050513          	addi	a0,a0,-1584 # 80005038 <CONSOLE_STATUS+0x28>
    80001670:	00001097          	auipc	ra,0x1
    80001674:	c98080e7          	jalr	-872(ra) # 80002308 <_Z5printPKcc>
    __asm__ ("li t1, 7");
    80001678:	00700313          	li	t1,7
    thread_dispatch();
    8000167c:	00001097          	auipc	ra,0x1
    80001680:	138080e7          	jalr	312(ra) # 800027b4 <thread_dispatch>

    uint64 t1 = 0;
    asm ("mv %0, t1" : "=r" (t1));
    80001684:	00030593          	mv	a1,t1

    print("C: t1=", t1, 0);
    80001688:	00000613          	li	a2,0
    8000168c:	00004517          	auipc	a0,0x4
    80001690:	9bc50513          	addi	a0,a0,-1604 # 80005048 <CONSOLE_STATUS+0x38>
    80001694:	00001097          	auipc	ra,0x1
    80001698:	d0c080e7          	jalr	-756(ra) # 800023a0 <_Z5printPKcmb>

    uint64 result = fibonacci(12);
    8000169c:	00c00513          	li	a0,12
    800016a0:	00000097          	auipc	ra,0x0
    800016a4:	f08080e7          	jalr	-248(ra) # 800015a8 <_Z9fibonaccim>
    print("C: fibonaci=", result, 0);
    800016a8:	00000613          	li	a2,0
    800016ac:	00050593          	mv	a1,a0
    800016b0:	00004517          	auipc	a0,0x4
    800016b4:	9a050513          	addi	a0,a0,-1632 # 80005050 <CONSOLE_STATUS+0x40>
    800016b8:	00001097          	auipc	ra,0x1
    800016bc:	ce8080e7          	jalr	-792(ra) # 800023a0 <_Z5printPKcmb>

    for (; i < 6; i++) {
    800016c0:	00500793          	li	a5,5
    800016c4:	0297e463          	bltu	a5,s1,800016ec <_Z11workerBodyCPv+0xcc>
        print("C: i=", i, 0);
    800016c8:	00000613          	li	a2,0
    800016cc:	00048593          	mv	a1,s1
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	96050513          	addi	a0,a0,-1696 # 80005030 <CONSOLE_STATUS+0x20>
    800016d8:	00001097          	auipc	ra,0x1
    800016dc:	cc8080e7          	jalr	-824(ra) # 800023a0 <_Z5printPKcmb>
    for (; i < 6; i++) {
    800016e0:	0014849b          	addiw	s1,s1,1
    800016e4:	0ff4f493          	andi	s1,s1,255
    800016e8:	fd9ff06f          	j	800016c0 <_Z11workerBodyCPv+0xa0>
    }
//    TCB::yield();
}
    800016ec:	01813083          	ld	ra,24(sp)
    800016f0:	01013403          	ld	s0,16(sp)
    800016f4:	00813483          	ld	s1,8(sp)
    800016f8:	02010113          	addi	sp,sp,32
    800016fc:	00008067          	ret

0000000080001700 <_Z11mainWrapperPv>:

void mainWrapper(void*){
    80001700:	ff010113          	addi	sp,sp,-16
    80001704:	00813423          	sd	s0,8(sp)
    80001708:	01010413          	addi	s0,sp,16
    userMain();
}
    8000170c:	00813403          	ld	s0,8(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret

0000000080001718 <main>:

int main(){
    80001718:	fb010113          	addi	sp,sp,-80
    8000171c:	04113423          	sd	ra,72(sp)
    80001720:	04813023          	sd	s0,64(sp)
    80001724:	02913c23          	sd	s1,56(sp)
    80001728:	05010413          	addi	s0,sp,80
    //init
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	218080e7          	jalr	536(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001734:	00050493          	mv	s1,a0
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(PtrQueue): ", sizeof(PtrQueue<TCB>), 0);
    80001738:	00000613          	li	a2,0
    8000173c:	01000593          	li	a1,16
    80001740:	00004517          	auipc	a0,0x4
    80001744:	92050513          	addi	a0,a0,-1760 # 80005060 <CONSOLE_STATUS+0x50>
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	c58080e7          	jalr	-936(ra) # 800023a0 <_Z5printPKcmb>
    print("sizeof(TCB): ", sizeof(TCB), 0);
    80001750:	00000613          	li	a2,0
    80001754:	03800593          	li	a1,56
    80001758:	00004517          	auipc	a0,0x4
    8000175c:	92050513          	addi	a0,a0,-1760 # 80005078 <CONSOLE_STATUS+0x68>
    80001760:	00001097          	auipc	ra,0x1
    80001764:	c40080e7          	jalr	-960(ra) # 800023a0 <_Z5printPKcmb>
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    80001768:	00000613          	li	a2,0
    8000176c:	04000593          	li	a1,64
    80001770:	00004517          	auipc	a0,0x4
    80001774:	91850513          	addi	a0,a0,-1768 # 80005088 <CONSOLE_STATUS+0x78>
    80001778:	00001097          	auipc	ra,0x1
    8000177c:	c28080e7          	jalr	-984(ra) # 800023a0 <_Z5printPKcmb>
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    80001780:	00000613          	li	a2,0
    80001784:	00200593          	li	a1,2
    80001788:	00004517          	auipc	a0,0x4
    8000178c:	92050513          	addi	a0,a0,-1760 # 800050a8 <CONSOLE_STATUS+0x98>
    80001790:	00001097          	auipc	ra,0x1
    80001794:	c10080e7          	jalr	-1008(ra) # 800023a0 <_Z5printPKcmb>

    //allocator.print_list();
    Scheduler::initalize();
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	544080e7          	jalr	1348(ra) # 80001cdc <_ZN9Scheduler9initalizeEv>
    TCB *threads[5];
    //allocator.print_list();

   
    //mainThread
    threads[0] = TCB::createThread(nullptr);
    800017a0:	00000613          	li	a2,0
    800017a4:	00000593          	li	a1,0
    800017a8:	00000513          	li	a0,0
    800017ac:	00001097          	auipc	ra,0x1
    800017b0:	88c080e7          	jalr	-1908(ra) # 80002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800017b4:	00050593          	mv	a1,a0
    800017b8:	faa43c23          	sd	a0,-72(s0)
    TCB::running = threads[0];
    800017bc:	00004797          	auipc	a5,0x4
    800017c0:	4ea7b623          	sd	a0,1260(a5) # 80005ca8 <_ZN3TCB7runningE>
    //allocator.print_list();
    print("Thread0 adr:", (uint64)threads[0], 0);
    800017c4:	00000613          	li	a2,0
    800017c8:	00004517          	auipc	a0,0x4
    800017cc:	8f850513          	addi	a0,a0,-1800 # 800050c0 <CONSOLE_STATUS+0xb0>
    800017d0:	00001097          	auipc	ra,0x1
    800017d4:	bd0080e7          	jalr	-1072(ra) # 800023a0 <_Z5printPKcmb>
    
    //firstThread
    threads[1] = TCB::createThread(workerBodyA, nullptr, (uint64*)allocator.mem_alloc(dssb));
    800017d8:	04000593          	li	a1,64
    800017dc:	00048513          	mv	a0,s1
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	1d4080e7          	jalr	468(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    800017e8:	00050613          	mv	a2,a0
    800017ec:	00000593          	li	a1,0
    800017f0:	00000517          	auipc	a0,0x0
    800017f4:	c9850513          	addi	a0,a0,-872 # 80001488 <_Z11workerBodyAPv>
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	840080e7          	jalr	-1984(ra) # 80002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001800:	00050593          	mv	a1,a0
    80001804:	fca43023          	sd	a0,-64(s0)
    //allocator.print_list();
    print("Thread1 adr:", (uint64)threads[1], 0);
    80001808:	00000613          	li	a2,0
    8000180c:	00004517          	auipc	a0,0x4
    80001810:	8c450513          	addi	a0,a0,-1852 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001814:	00001097          	auipc	ra,0x1
    80001818:	b8c080e7          	jalr	-1140(ra) # 800023a0 <_Z5printPKcmb>
    //if(threads[1] != nullptr) print("ThreadA created\n");
    
    //secondThread
    threads[2] = TCB::createThread(workerBodyB, nullptr, (uint64*)allocator.mem_alloc(dssb));
    8000181c:	04000593          	li	a1,64
    80001820:	00048513          	mv	a0,s1
    80001824:	00000097          	auipc	ra,0x0
    80001828:	190080e7          	jalr	400(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    8000182c:	00050613          	mv	a2,a0
    80001830:	00000593          	li	a1,0
    80001834:	00000517          	auipc	a0,0x0
    80001838:	cd850513          	addi	a0,a0,-808 # 8000150c <_Z11workerBodyBPv>
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	7fc080e7          	jalr	2044(ra) # 80002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001844:	00050593          	mv	a1,a0
    80001848:	fca43423          	sd	a0,-56(s0)
    //allocator.print_list();
    print("Thread2 adr:", (uint64)threads[2], 0);
    8000184c:	00000613          	li	a2,0
    80001850:	00004517          	auipc	a0,0x4
    80001854:	89050513          	addi	a0,a0,-1904 # 800050e0 <CONSOLE_STATUS+0xd0>
    80001858:	00001097          	auipc	ra,0x1
    8000185c:	b48080e7          	jalr	-1208(ra) # 800023a0 <_Z5printPKcmb>
    //if(threads[2] != nullptr) print("ThreadB created\n");
    
    //thirdThread
    threads[3] = TCB::createThread(workerBodyC, nullptr, (uint64*)allocator.mem_alloc(dssb));
    80001860:	04000593          	li	a1,64
    80001864:	00048513          	mv	a0,s1
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	14c080e7          	jalr	332(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    80001870:	00050613          	mv	a2,a0
    80001874:	00000593          	li	a1,0
    80001878:	00000517          	auipc	a0,0x0
    8000187c:	da850513          	addi	a0,a0,-600 # 80001620 <_Z11workerBodyCPv>
    80001880:	00000097          	auipc	ra,0x0
    80001884:	7b8080e7          	jalr	1976(ra) # 80002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001888:	00050593          	mv	a1,a0
    8000188c:	fca43823          	sd	a0,-48(s0)
    //allocator.print_list();
    print("Thread3 adr:", (uint64)threads[3], 0);
    80001890:	00000613          	li	a2,0
    80001894:	00004517          	auipc	a0,0x4
    80001898:	85c50513          	addi	a0,a0,-1956 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000189c:	00001097          	auipc	ra,0x1
    800018a0:	b04080e7          	jalr	-1276(ra) # 800023a0 <_Z5printPKcmb>
    //if(threads[3] != nullptr) print("ThreadC created\n");

    //threads[4] = TCB::createThread(workerBodyD);
    //printString("ThreadD created\n");

    Riscv::w_stvec((uint64)interruptvec);
    800018a4:	fffff797          	auipc	a5,0xfffff
    800018a8:	75c78793          	addi	a5,a5,1884 # 80001000 <interruptvec>
    asm volatile("csrw stvec, %0" : : "r" (stvec));
    800018ac:	10579073          	csrw	stvec,a5
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800018b0:	00200793          	li	a5,2
    800018b4:	1007a073          	csrs	sstatus,a5
    800018b8:	0200006f          	j	800018d8 <main+0x1c0>
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!(threads[1]->isFinished() && threads[2]->isFinished() /*&&
             threads[3]->isFinished()*/)) {
        //print("vrtim se");
        print("deo kernela");
    800018bc:	00a00593          	li	a1,10
    800018c0:	00004517          	auipc	a0,0x4
    800018c4:	84050513          	addi	a0,a0,-1984 # 80005100 <CONSOLE_STATUS+0xf0>
    800018c8:	00001097          	auipc	ra,0x1
    800018cc:	a40080e7          	jalr	-1472(ra) # 80002308 <_Z5printPKcc>
        thread_dispatch();
    800018d0:	00001097          	auipc	ra,0x1
    800018d4:	ee4080e7          	jalr	-284(ra) # 800027b4 <thread_dispatch>
    while (!(threads[1]->isFinished() && threads[2]->isFinished() /*&&
    800018d8:	fc043783          	ld	a5,-64(s0)
    bool isFinished() const { return finished; }
    800018dc:	0207c783          	lbu	a5,32(a5)
    800018e0:	fc078ee3          	beqz	a5,800018bc <main+0x1a4>
    800018e4:	fc843783          	ld	a5,-56(s0)
    800018e8:	0207c783          	lbu	a5,32(a5)
    800018ec:	fc0788e3          	beqz	a5,800018bc <main+0x1a4>
    }

    for(auto &thread: threads){MemoryAllocator::getInstance().mem_free(thread);}
    800018f0:	fb840493          	addi	s1,s0,-72
    800018f4:	fe040793          	addi	a5,s0,-32
    800018f8:	02f48063          	beq	s1,a5,80001918 <main+0x200>
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	048080e7          	jalr	72(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001904:	0004b583          	ld	a1,0(s1)
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	244080e7          	jalr	580(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    80001910:	00848493          	addi	s1,s1,8
    80001914:	fe1ff06f          	j	800018f4 <main+0x1dc>
    print("Kernel kraj");
    80001918:	00a00593          	li	a1,10
    8000191c:	00003517          	auipc	a0,0x3
    80001920:	7f450513          	addi	a0,a0,2036 # 80005110 <CONSOLE_STATUS+0x100>
    80001924:	00001097          	auipc	ra,0x1
    80001928:	9e4080e7          	jalr	-1564(ra) # 80002308 <_Z5printPKcc>
    return 0;
    8000192c:	00000513          	li	a0,0
    80001930:	04813083          	ld	ra,72(sp)
    80001934:	04013403          	ld	s0,64(sp)
    80001938:	03813483          	ld	s1,56(sp)
    8000193c:	05010113          	addi	sp,sp,80
    80001940:	00008067          	ret

0000000080001944 <_ZN15MemoryAllocator11getInstanceEv>:
    fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
}*/

MemoryAllocator MemoryAllocator::allocator;

MemoryAllocator& MemoryAllocator::getInstance(){
    80001944:	ff010113          	addi	sp,sp,-16
    80001948:	00813423          	sd	s0,8(sp)
    8000194c:	01010413          	addi	s0,sp,16
    if(!allocator.init){
    80001950:	00004797          	auipc	a5,0x4
    80001954:	3907c783          	lbu	a5,912(a5) # 80005ce0 <_ZN15MemoryAllocator9allocatorE>
    80001958:	04079463          	bnez	a5,800019a0 <_ZN15MemoryAllocator11getInstanceEv+0x5c>
        allocator.fmem_head = (FreeSegment*)HEAP_START_ADDR;
    8000195c:	00004697          	auipc	a3,0x4
    80001960:	2b468693          	addi	a3,a3,692 # 80005c10 <HEAP_START_ADDR>
    80001964:	0006b783          	ld	a5,0(a3)
    80001968:	00004717          	auipc	a4,0x4
    8000196c:	37870713          	addi	a4,a4,888 # 80005ce0 <_ZN15MemoryAllocator9allocatorE>
    80001970:	00f73423          	sd	a5,8(a4)
        allocator.fmem_head->next = nullptr;
    80001974:	0007b023          	sd	zero,0(a5)
        allocator.fmem_head->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeSegment));
    80001978:	00004797          	auipc	a5,0x4
    8000197c:	29078793          	addi	a5,a5,656 # 80005c08 <HEAP_END_ADDR>
    80001980:	0007b783          	ld	a5,0(a5)
    80001984:	0006b683          	ld	a3,0(a3)
    80001988:	40d787b3          	sub	a5,a5,a3
    8000198c:	00873683          	ld	a3,8(a4)
    80001990:	ff078793          	addi	a5,a5,-16
    80001994:	00f6b423          	sd	a5,8(a3)
        allocator.init = true;
    80001998:	00100793          	li	a5,1
    8000199c:	00f70023          	sb	a5,0(a4)
    }
    return allocator;
}
    800019a0:	00004517          	auipc	a0,0x4
    800019a4:	34050513          	addi	a0,a0,832 # 80005ce0 <_ZN15MemoryAllocator9allocatorE>
    800019a8:	00813403          	ld	s0,8(sp)
    800019ac:	01010113          	addi	sp,sp,16
    800019b0:	00008067          	ret

00000000800019b4 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size){
    800019b4:	ff010113          	addi	sp,sp,-16
    800019b8:	00813423          	sd	s0,8(sp)
    800019bc:	01010413          	addi	s0,sp,16
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800019c0:	00853783          	ld	a5,8(a0)
    size = size*MEM_BLOCK_SIZE;
    800019c4:	00659593          	slli	a1,a1,0x6
    FreeSegment* best = nullptr,*best_prev = nullptr,* curr = fmem_head, *prev = nullptr;
    800019c8:	00000613          	li	a2,0
    800019cc:	00000893          	li	a7,0
    800019d0:	00000693          	li	a3,0
    800019d4:	0140006f          	j	800019e8 <_ZN15MemoryAllocator9mem_allocEm+0x34>
    while(curr){
        if(curr->size >= size)
            if (!best || (curr->size < best->size)){
                best = curr;     
                best_prev = prev;
    800019d8:	00060893          	mv	a7,a2
                best = curr;     
    800019dc:	00078693          	mv	a3,a5
            }
        prev = curr;
    800019e0:	00078613          	mv	a2,a5
        curr = curr->next;
    800019e4:	0007b783          	ld	a5,0(a5)
    while(curr){
    800019e8:	02078263          	beqz	a5,80001a0c <_ZN15MemoryAllocator9mem_allocEm+0x58>
        if(curr->size >= size)
    800019ec:	0087b703          	ld	a4,8(a5)
    800019f0:	feb768e3          	bltu	a4,a1,800019e0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            if (!best || (curr->size < best->size)){
    800019f4:	fe0682e3          	beqz	a3,800019d8 <_ZN15MemoryAllocator9mem_allocEm+0x24>
    800019f8:	0086b803          	ld	a6,8(a3)
    800019fc:	ff0772e3          	bgeu	a4,a6,800019e0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
                best_prev = prev;
    80001a00:	00060893          	mv	a7,a2
                best = curr;     
    80001a04:	00078693          	mv	a3,a5
    80001a08:	fd9ff06f          	j	800019e0 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
    } 
    if(!best)
    80001a0c:	02068463          	beqz	a3,80001a34 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        return nullptr;
    if(best->size - size < sizeof(FreeSegment) + MEM_BLOCK_SIZE){
    80001a10:	0086b783          	ld	a5,8(a3)
    80001a14:	40b787b3          	sub	a5,a5,a1
    80001a18:	04f00713          	li	a4,79
    80001a1c:	02f76a63          	bltu	a4,a5,80001a50 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
        if(!best_prev) fmem_head = best->next;
    80001a20:	02088263          	beqz	a7,80001a44 <_ZN15MemoryAllocator9mem_allocEm+0x90>
        else best_prev->next = best->next;
    80001a24:	0006b783          	ld	a5,0(a3)
    80001a28:	00f8b023          	sd	a5,0(a7)
        if(best_prev) best_prev->next = curr;
        else fmem_head = curr;
    }
    //print((uint64)best);
    //print((uint64)best->size);
    best->next = nullptr;
    80001a2c:	0006b023          	sd	zero,0(a3)
    return (char*)best+sizeof(FreeSegment);
    80001a30:	01068693          	addi	a3,a3,16
}
    80001a34:	00068513          	mv	a0,a3
    80001a38:	00813403          	ld	s0,8(sp)
    80001a3c:	01010113          	addi	sp,sp,16
    80001a40:	00008067          	ret
        if(!best_prev) fmem_head = best->next;
    80001a44:	0006b783          	ld	a5,0(a3)
    80001a48:	00f53423          	sd	a5,8(a0)
    80001a4c:	fe1ff06f          	j	80001a2c <_ZN15MemoryAllocator9mem_allocEm+0x78>
        curr = (FreeSegment*)((char*)best + sizeof(FreeSegment) + size);
    80001a50:	01058793          	addi	a5,a1,16
    80001a54:	00f687b3          	add	a5,a3,a5
        curr->next = best->next;
    80001a58:	0006b703          	ld	a4,0(a3)
    80001a5c:	00e7b023          	sd	a4,0(a5)
        curr->size = best->size - size - sizeof(FreeSegment);
    80001a60:	0086b703          	ld	a4,8(a3)
    80001a64:	40b70733          	sub	a4,a4,a1
    80001a68:	ff070713          	addi	a4,a4,-16
    80001a6c:	00e7b423          	sd	a4,8(a5)
        best->size = size;
    80001a70:	00b6b423          	sd	a1,8(a3)
        if(best_prev) best_prev->next = curr;
    80001a74:	00088663          	beqz	a7,80001a80 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    80001a78:	00f8b023          	sd	a5,0(a7)
    80001a7c:	fb1ff06f          	j	80001a2c <_ZN15MemoryAllocator9mem_allocEm+0x78>
        else fmem_head = curr;
    80001a80:	00f53423          	sd	a5,8(a0)
    80001a84:	fa9ff06f          	j	80001a2c <_ZN15MemoryAllocator9mem_allocEm+0x78>

0000000080001a88 <_ZN15MemoryAllocator18invalidFreeAddressEPv>:

bool MemoryAllocator::invalidFreeAddress(void* adr){
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00813423          	sd	s0,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    if(adr < HEAP_START_ADDR || adr >= HEAP_END_ADDR)
    80001a94:	00004797          	auipc	a5,0x4
    80001a98:	17c78793          	addi	a5,a5,380 # 80005c10 <HEAP_START_ADDR>
    80001a9c:	0007b783          	ld	a5,0(a5)
    80001aa0:	04f5e063          	bltu	a1,a5,80001ae0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x58>
    80001aa4:	00004797          	auipc	a5,0x4
    80001aa8:	16478793          	addi	a5,a5,356 # 80005c08 <HEAP_END_ADDR>
    80001aac:	0007b783          	ld	a5,0(a5)
    80001ab0:	04f5f063          	bgeu	a1,a5,80001af0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x68>
        return true;
    size_t t = (size_t)adr;
    for(FreeSegment* cur = fmem_head; cur; cur = cur->next)
    80001ab4:	00853783          	ld	a5,8(a0)
    80001ab8:	0080006f          	j	80001ac0 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x38>
    80001abc:	0007b783          	ld	a5,0(a5)
    80001ac0:	02078c63          	beqz	a5,80001af8 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x70>
        if(t >= (size_t)cur && t < (size_t)cur+2*sizeof(FreeSegment)+cur->size)
    80001ac4:	fef5ece3          	bltu	a1,a5,80001abc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
    80001ac8:	0087b703          	ld	a4,8(a5)
    80001acc:	00e78733          	add	a4,a5,a4
    80001ad0:	02070713          	addi	a4,a4,32
    80001ad4:	fee5f4e3          	bgeu	a1,a4,80001abc <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x34>
            return true;
    80001ad8:	00100513          	li	a0,1
    80001adc:	0080006f          	j	80001ae4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
        return true;
    80001ae0:	00100513          	li	a0,1
    return false;
}
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret
        return true;
    80001af0:	00100513          	li	a0,1
    80001af4:	ff1ff06f          	j	80001ae4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>
    return false;
    80001af8:	00000513          	li	a0,0
    80001afc:	fe9ff06f          	j	80001ae4 <_ZN15MemoryAllocator18invalidFreeAddressEPv+0x5c>

0000000080001b00 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>:

FreeSegment* MemoryAllocator::mergeWithNext(FreeSegment* t){
    80001b00:	ff010113          	addi	sp,sp,-16
    80001b04:	00813423          	sd	s0,8(sp)
    80001b08:	01010413          	addi	s0,sp,16
    if((char*)t + sizeof(FreeSegment) + t->size == (char*)t->next){
    80001b0c:	0085b703          	ld	a4,8(a1)
    80001b10:	01070793          	addi	a5,a4,16
    80001b14:	00f587b3          	add	a5,a1,a5
    80001b18:	0005b503          	ld	a0,0(a1)
    80001b1c:	00a78863          	beq	a5,a0,80001b2c <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x2c>
        t->size += t->next->size + sizeof(FreeSegment);
        t->next = t->next->next;
        return t;
    }
    return t->next;
}
    80001b20:	00813403          	ld	s0,8(sp)
    80001b24:	01010113          	addi	sp,sp,16
    80001b28:	00008067          	ret
        t->size += t->next->size + sizeof(FreeSegment);
    80001b2c:	00853783          	ld	a5,8(a0)
    80001b30:	00f70733          	add	a4,a4,a5
    80001b34:	01070713          	addi	a4,a4,16
    80001b38:	00e5b423          	sd	a4,8(a1)
        t->next = t->next->next;
    80001b3c:	00053783          	ld	a5,0(a0)
    80001b40:	00f5b023          	sd	a5,0(a1)
        return t;
    80001b44:	00058513          	mv	a0,a1
    80001b48:	fd9ff06f          	j	80001b20 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment+0x20>

0000000080001b4c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* adr){
    80001b4c:	fd010113          	addi	sp,sp,-48
    80001b50:	02113423          	sd	ra,40(sp)
    80001b54:	02813023          	sd	s0,32(sp)
    80001b58:	00913c23          	sd	s1,24(sp)
    80001b5c:	01213823          	sd	s2,16(sp)
    80001b60:	01313423          	sd	s3,8(sp)
    80001b64:	01413023          	sd	s4,0(sp)
    80001b68:	03010413          	addi	s0,sp,48
    80001b6c:	00050993          	mv	s3,a0
    80001b70:	00058913          	mv	s2,a1
    if(invalidFreeAddress(adr)) return -1;
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	f14080e7          	jalr	-236(ra) # 80001a88 <_ZN15MemoryAllocator18invalidFreeAddressEPv>
    80001b7c:	0a051063          	bnez	a0,80001c1c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!fmem_head)
    80001b80:	0089b783          	ld	a5,8(s3)
    80001b84:	00078863          	beqz	a5,80001b94 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    else{
        FreeSegment* newsgm = (FreeSegment*)((char*)adr - sizeof(FreeSegment)), *prev,* cur;
    80001b88:	ff090a13          	addi	s4,s2,-16
        //print((uint64)newsgm);
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80001b8c:	00000493          	li	s1,0
    80001b90:	01c0006f          	j	80001bac <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        fmem_head = (FreeSegment*)((char*)adr - sizeof(FreeSegment));
    80001b94:	ff090913          	addi	s2,s2,-16
    80001b98:	0129b423          	sd	s2,8(s3)
    80001b9c:	0540006f          	j	80001bf0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80001ba0:	00f96e63          	bltu	s2,a5,80001bbc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        for(prev = nullptr, cur = fmem_head; cur; prev = cur, cur = cur->next)
    80001ba4:	00078493          	mv	s1,a5
    80001ba8:	0007b783          	ld	a5,0(a5)
    80001bac:	00078863          	beqz	a5,80001bbc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            if((!prev || (size_t)adr > (size_t)prev) && (size_t)adr < (size_t)cur)
    80001bb0:	fe0488e3          	beqz	s1,80001ba0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    80001bb4:	ff24f8e3          	bgeu	s1,s2,80001ba4 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80001bb8:	fe9ff06f          	j	80001ba0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
                break;
        //print((ull)prev);
        newsgm->next = cur;
    80001bbc:	fef93823          	sd	a5,-16(s2)
        if(cur)
    80001bc0:	00078a63          	beqz	a5,80001bd4 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            mergeWithNext(newsgm);
    80001bc4:	000a0593          	mv	a1,s4
    80001bc8:	00098513          	mv	a0,s3
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	f34080e7          	jalr	-204(ra) # 80001b00 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        if(prev){
    80001bd4:	02048e63          	beqz	s1,80001c10 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
            prev->next = newsgm;
    80001bd8:	0144b023          	sd	s4,0(s1)
            mergeWithNext(prev);
    80001bdc:	00048593          	mv	a1,s1
    80001be0:	00098513          	mv	a0,s3
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	f1c080e7          	jalr	-228(ra) # 80001b00 <_ZN15MemoryAllocator13mergeWithNextEP11FreeSegment>
        }
        else
            fmem_head = newsgm;
    }
    return 0;
    80001bec:	00000513          	li	a0,0
}
    80001bf0:	02813083          	ld	ra,40(sp)
    80001bf4:	02013403          	ld	s0,32(sp)
    80001bf8:	01813483          	ld	s1,24(sp)
    80001bfc:	01013903          	ld	s2,16(sp)
    80001c00:	00813983          	ld	s3,8(sp)
    80001c04:	00013a03          	ld	s4,0(sp)
    80001c08:	03010113          	addi	sp,sp,48
    80001c0c:	00008067          	ret
            fmem_head = newsgm;
    80001c10:	0149b423          	sd	s4,8(s3)
    return 0;
    80001c14:	00000513          	li	a0,0
    80001c18:	fd9ff06f          	j	80001bf0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(invalidFreeAddress(adr)) return -1;
    80001c1c:	fff00513          	li	a0,-1
    80001c20:	fd1ff06f          	j	80001bf0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

0000000080001c24 <_ZN15MemoryAllocator10print_listEv>:

void MemoryAllocator::print_list(){
    80001c24:	fe010113          	addi	sp,sp,-32
    80001c28:	00113c23          	sd	ra,24(sp)
    80001c2c:	00813823          	sd	s0,16(sp)
    80001c30:	00913423          	sd	s1,8(sp)
    80001c34:	02010413          	addi	s0,sp,32
    80001c38:	00050493          	mv	s1,a0
    //print("MEM_BLOCK_SIZE: ", ' ');
    //print(MEM_BLOCK_SIZE, '\n', 0);
    print("------Free Segment Lista------");
    80001c3c:	00a00593          	li	a1,10
    80001c40:	00003517          	auipc	a0,0x3
    80001c44:	4e050513          	addi	a0,a0,1248 # 80005120 <CONSOLE_STATUS+0x110>
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	6c0080e7          	jalr	1728(ra) # 80002308 <_Z5printPKcc>
    if(!fmem_head)
    80001c50:	0084b783          	ld	a5,8(s1)
    80001c54:	04078463          	beqz	a5,80001c9c <_ZN15MemoryAllocator10print_listEv+0x78>
        print("LISTA JE PRAZNA!");
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80001c58:	0084b483          	ld	s1,8(s1)
    80001c5c:	04048c63          	beqz	s1,80001cb4 <_ZN15MemoryAllocator10print_listEv+0x90>
        print((uint64)curr, '\n', 0);
    80001c60:	00000613          	li	a2,0
    80001c64:	00a00593          	li	a1,10
    80001c68:	00048513          	mv	a0,s1
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	55c080e7          	jalr	1372(ra) # 800021c8 <_Z5printmcb>
        print((uint64)curr->size, '\n', 0);
    80001c74:	00000613          	li	a2,0
    80001c78:	00a00593          	li	a1,10
    80001c7c:	0084b503          	ld	a0,8(s1)
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	548080e7          	jalr	1352(ra) # 800021c8 <_Z5printmcb>
        __putc('\n');
    80001c88:	00a00513          	li	a0,10
    80001c8c:	00003097          	auipc	ra,0x3
    80001c90:	c70080e7          	jalr	-912(ra) # 800048fc <__putc>
    for(FreeSegment* curr = fmem_head; curr; curr = curr->next){
    80001c94:	0004b483          	ld	s1,0(s1)
    80001c98:	fc5ff06f          	j	80001c5c <_ZN15MemoryAllocator10print_listEv+0x38>
        print("LISTA JE PRAZNA!");
    80001c9c:	00a00593          	li	a1,10
    80001ca0:	00003517          	auipc	a0,0x3
    80001ca4:	4a050513          	addi	a0,a0,1184 # 80005140 <CONSOLE_STATUS+0x130>
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	660080e7          	jalr	1632(ra) # 80002308 <_Z5printPKcc>
    80001cb0:	fa9ff06f          	j	80001c58 <_ZN15MemoryAllocator10print_listEv+0x34>
    }
    print("------------------------------");
    80001cb4:	00a00593          	li	a1,10
    80001cb8:	00003517          	auipc	a0,0x3
    80001cbc:	4a050513          	addi	a0,a0,1184 # 80005158 <CONSOLE_STATUS+0x148>
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	648080e7          	jalr	1608(ra) # 80002308 <_Z5printPKcc>
}
    80001cc8:	01813083          	ld	ra,24(sp)
    80001ccc:	01013403          	ld	s0,16(sp)
    80001cd0:	00813483          	ld	s1,8(sp)
    80001cd4:	02010113          	addi	sp,sp,32
    80001cd8:	00008067          	ret

0000000080001cdc <_ZN9Scheduler9initalizeEv>:
#include"../../h/scheduler.hpp"

PtrQueue<TCB>* Scheduler::queue = nullptr;

void Scheduler::initalize(){
    80001cdc:	ff010113          	addi	sp,sp,-16
    80001ce0:	00113423          	sd	ra,8(sp)
    80001ce4:	00813023          	sd	s0,0(sp)
    80001ce8:	01010413          	addi	s0,sp,16
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	c58080e7          	jalr	-936(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001cf4:	00100593          	li	a1,1
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	cbc080e7          	jalr	-836(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    80001d00:	00053023          	sd	zero,0(a0)
    80001d04:	00053423          	sd	zero,8(a0)
    queue = new PtrQueue<TCB>();
    80001d08:	00004797          	auipc	a5,0x4
    80001d0c:	f8a7b823          	sd	a0,-112(a5) # 80005c98 <_ZN9Scheduler5queueE>
}
    80001d10:	00813083          	ld	ra,8(sp)
    80001d14:	00013403          	ld	s0,0(sp)
    80001d18:	01010113          	addi	sp,sp,16
    80001d1c:	00008067          	ret

0000000080001d20 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get(){
    80001d20:	fe010113          	addi	sp,sp,-32
    80001d24:	00113c23          	sd	ra,24(sp)
    80001d28:	00813823          	sd	s0,16(sp)
    80001d2c:	00913423          	sd	s1,8(sp)
    80001d30:	01213023          	sd	s2,0(sp)
    80001d34:	02010413          	addi	s0,sp,32
    return queue->remove();
    80001d38:	00004797          	auipc	a5,0x4
    80001d3c:	f6078793          	addi	a5,a5,-160 # 80005c98 <_ZN9Scheduler5queueE>
    80001d40:	0007b783          	ld	a5,0(a5)
        tail = tail==nullptr?(head = node):(tail->next = node);
        return *this;
    }
   
    T* remove(){
        if(head!=nullptr){
    80001d44:	0007b483          	ld	s1,0(a5)
    80001d48:	04048a63          	beqz	s1,80001d9c <_ZN9Scheduler3getEv+0x7c>
            T* ret = head->info;
    80001d4c:	0084b903          	ld	s2,8(s1)
            Node* old = head;
            head = head==tail?(tail = nullptr):head->next;
    80001d50:	0087b703          	ld	a4,8(a5)
    80001d54:	02e48e63          	beq	s1,a4,80001d90 <_ZN9Scheduler3getEv+0x70>
    80001d58:	0004b703          	ld	a4,0(s1)
    80001d5c:	00e7b023          	sd	a4,0(a5)
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	be4080e7          	jalr	-1052(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001d68:	00048593          	mv	a1,s1
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	de0080e7          	jalr	-544(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001d74:	00090513          	mv	a0,s2
    80001d78:	01813083          	ld	ra,24(sp)
    80001d7c:	01013403          	ld	s0,16(sp)
    80001d80:	00813483          	ld	s1,8(sp)
    80001d84:	00013903          	ld	s2,0(sp)
    80001d88:	02010113          	addi	sp,sp,32
    80001d8c:	00008067          	ret
    80001d90:	0007b423          	sd	zero,8(a5)
    80001d94:	00000713          	li	a4,0
    80001d98:	fc5ff06f          	j	80001d5c <_ZN9Scheduler3getEv+0x3c>
            delete old;
            return ret;            
        }
        return nullptr;
    80001d9c:	00048913          	mv	s2,s1
    return queue->remove();
    80001da0:	fd5ff06f          	j	80001d74 <_ZN9Scheduler3getEv+0x54>

0000000080001da4 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB* ptr){
    80001da4:	fe010113          	addi	sp,sp,-32
    80001da8:	00113c23          	sd	ra,24(sp)
    80001dac:	00813823          	sd	s0,16(sp)
    80001db0:	00913423          	sd	s1,8(sp)
    80001db4:	01213023          	sd	s2,0(sp)
    80001db8:	02010413          	addi	s0,sp,32
    80001dbc:	00050913          	mv	s2,a0
    queue->insert(ptr);
    80001dc0:	00004797          	auipc	a5,0x4
    80001dc4:	ed878793          	addi	a5,a5,-296 # 80005c98 <_ZN9Scheduler5queueE>
    80001dc8:	0007b483          	ld	s1,0(a5)
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	b78080e7          	jalr	-1160(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001dd4:	00100593          	li	a1,1
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	bdc080e7          	jalr	-1060(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
        Node(T* info = nullptr, Node* next = nullptr):next(next), info(info){}
    80001de0:	00053023          	sd	zero,0(a0)
    80001de4:	01253423          	sd	s2,8(a0)
        tail = tail==nullptr?(head = node):(tail->next = node);
    80001de8:	0084b783          	ld	a5,8(s1)
    80001dec:	02078263          	beqz	a5,80001e10 <_ZN9Scheduler3putEP3TCB+0x6c>
    80001df0:	00a7b023          	sd	a0,0(a5)
    80001df4:	00a4b423          	sd	a0,8(s1)
}
    80001df8:	01813083          	ld	ra,24(sp)
    80001dfc:	01013403          	ld	s0,16(sp)
    80001e00:	00813483          	ld	s1,8(sp)
    80001e04:	00013903          	ld	s2,0(sp)
    80001e08:	02010113          	addi	sp,sp,32
    80001e0c:	00008067          	ret
    80001e10:	00a4b023          	sd	a0,0(s1)
    80001e14:	fe1ff06f          	j	80001df4 <_ZN9Scheduler3putEP3TCB+0x50>

0000000080001e18 <_ZN9Scheduler8finalizeEv>:

void Scheduler::finalize(){
    80001e18:	fe010113          	addi	sp,sp,-32
    80001e1c:	00113c23          	sd	ra,24(sp)
    80001e20:	00813823          	sd	s0,16(sp)
    80001e24:	00913423          	sd	s1,8(sp)
    80001e28:	01213023          	sd	s2,0(sp)
    80001e2c:	02010413          	addi	s0,sp,32
    if(queue) delete queue;
    80001e30:	00004797          	auipc	a5,0x4
    80001e34:	e6878793          	addi	a5,a5,-408 # 80005c98 <_ZN9Scheduler5queueE>
    80001e38:	0007b483          	ld	s1,0(a5)
    80001e3c:	02049463          	bnez	s1,80001e64 <_ZN9Scheduler8finalizeEv+0x4c>
    80001e40:	0580006f          	j	80001e98 <_ZN9Scheduler8finalizeEv+0x80>
            head = head==tail?(tail = nullptr):head->next;
    80001e44:	0004b423          	sd	zero,8(s1)
    80001e48:	00000793          	li	a5,0
    80001e4c:	00f4b023          	sd	a5,0(s1)
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	af4080e7          	jalr	-1292(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001e58:	00090593          	mv	a1,s2
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	cf0080e7          	jalr	-784(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    }

    bool isEmpty() {return !head;}
    80001e64:	0004b783          	ld	a5,0(s1)
        while(!isEmpty())
    80001e68:	00078e63          	beqz	a5,80001e84 <_ZN9Scheduler8finalizeEv+0x6c>
        if(head!=nullptr){
    80001e6c:	00078913          	mv	s2,a5
    80001e70:	fe078ae3          	beqz	a5,80001e64 <_ZN9Scheduler8finalizeEv+0x4c>
            head = head==tail?(tail = nullptr):head->next;
    80001e74:	0084b783          	ld	a5,8(s1)
    80001e78:	fcf906e3          	beq	s2,a5,80001e44 <_ZN9Scheduler8finalizeEv+0x2c>
    80001e7c:	00093783          	ld	a5,0(s2)
    80001e80:	fcdff06f          	j	80001e4c <_ZN9Scheduler8finalizeEv+0x34>
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	ac0080e7          	jalr	-1344(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80001e8c:	00048593          	mv	a1,s1
    80001e90:	00000097          	auipc	ra,0x0
    80001e94:	cbc080e7          	jalr	-836(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001e98:	01813083          	ld	ra,24(sp)
    80001e9c:	01013403          	ld	s0,16(sp)
    80001ea0:	00813483          	ld	s1,8(sp)
    80001ea4:	00013903          	ld	s2,0(sp)
    80001ea8:	02010113          	addi	sp,sp,32
    80001eac:	00008067          	ret

0000000080001eb0 <_ZN9Scheduler11print_queueEv>:

void Scheduler::print_queue(){
    80001eb0:	fe010113          	addi	sp,sp,-32
    80001eb4:	00113c23          	sd	ra,24(sp)
    80001eb8:	00813823          	sd	s0,16(sp)
    80001ebc:	00913423          	sd	s1,8(sp)
    80001ec0:	02010413          	addi	s0,sp,32
    queue->printQueue();
    80001ec4:	00004797          	auipc	a5,0x4
    80001ec8:	dd478793          	addi	a5,a5,-556 # 80005c98 <_ZN9Scheduler5queueE>
    80001ecc:	0007b783          	ld	a5,0(a5)

    void printQueue(){
        Node* t = head;
    80001ed0:	0007b483          	ld	s1,0(a5)
        while(t){
    80001ed4:	02048a63          	beqz	s1,80001f08 <_ZN9Scheduler11print_queueEv+0x58>
            print("->",' ');
    80001ed8:	02000593          	li	a1,32
    80001edc:	00003517          	auipc	a0,0x3
    80001ee0:	29c50513          	addi	a0,a0,668 # 80005178 <CONSOLE_STATUS+0x168>
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	424080e7          	jalr	1060(ra) # 80002308 <_Z5printPKcc>
            print((uint64)t->info, ' ', 0);
    80001eec:	00000613          	li	a2,0
    80001ef0:	02000593          	li	a1,32
    80001ef4:	0084b503          	ld	a0,8(s1)
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	2d0080e7          	jalr	720(ra) # 800021c8 <_Z5printmcb>
            t = t->next;            
    80001f00:	0004b483          	ld	s1,0(s1)
    80001f04:	fd1ff06f          	j	80001ed4 <_ZN9Scheduler11print_queueEv+0x24>
        }
        print("");
    80001f08:	00a00593          	li	a1,10
    80001f0c:	00003517          	auipc	a0,0x3
    80001f10:	33450513          	addi	a0,a0,820 # 80005240 <CONSOLE_STATUS+0x230>
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	3f4080e7          	jalr	1012(ra) # 80002308 <_Z5printPKcc>
}
    80001f1c:	01813083          	ld	ra,24(sp)
    80001f20:	01013403          	ld	s0,16(sp)
    80001f24:	00813483          	ld	s1,8(sp)
    80001f28:	02010113          	addi	sp,sp,32
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN5Riscv10popSppSpieEv>:
#include"../../h/scheduler.hpp"
#include"../../h/riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
void Riscv::popSppSpie() {
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00813423          	sd	s0,8(sp)
    80001f38:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001f3c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001f40:	10200073          	sret
}
    80001f44:	00813403          	ld	s0,8(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret

0000000080001f50 <_ZN3TCB13threadWrapperEv>:
        Scheduler::put(this);
}   

//void TCB::yield(){}

void TCB::threadWrapper(){
    80001f50:	fe010113          	addi	sp,sp,-32
    80001f54:	00113c23          	sd	ra,24(sp)
    80001f58:	00813823          	sd	s0,16(sp)
    80001f5c:	00913423          	sd	s1,8(sp)
    80001f60:	02010413          	addi	s0,sp,32
    print("start of thread", (uint64)TCB::running, 0);
    80001f64:	00004497          	auipc	s1,0x4
    80001f68:	d4448493          	addi	s1,s1,-700 # 80005ca8 <_ZN3TCB7runningE>
    80001f6c:	00000613          	li	a2,0
    80001f70:	0004b583          	ld	a1,0(s1)
    80001f74:	00003517          	auipc	a0,0x3
    80001f78:	20c50513          	addi	a0,a0,524 # 80005180 <CONSOLE_STATUS+0x170>
    80001f7c:	00000097          	auipc	ra,0x0
    80001f80:	424080e7          	jalr	1060(ra) # 800023a0 <_Z5printPKcmb>
    Riscv::popSppSpie();
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	fac080e7          	jalr	-84(ra) # 80001f30 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80001f8c:	0004b783          	ld	a5,0(s1)
    80001f90:	0007b703          	ld	a4,0(a5)
    80001f94:	0087b503          	ld	a0,8(a5)
    80001f98:	000700e7          	jalr	a4
    running->setFinished();
    80001f9c:	0004b783          	ld	a5,0(s1)
    void setFinished() {finished = true;}
    80001fa0:	00100713          	li	a4,1
    80001fa4:	02e78023          	sb	a4,32(a5)
    asm volatile("mv a0, %0" ::"r" (0x13));
    80001fa8:	01300793          	li	a5,19
    80001fac:	00078513          	mv	a0,a5
    asm volatile("ecall");
    80001fb0:	00000073          	ecall
}
    80001fb4:	01813083          	ld	ra,24(sp)
    80001fb8:	01013403          	ld	s0,16(sp)
    80001fbc:	00813483          	ld	s1,8(sp)
    80001fc0:	02010113          	addi	sp,sp,32
    80001fc4:	00008067          	ret

0000000080001fc8 <_ZN3TCBC1EPFvPvES0_Pmm>:
context({(uint64) &threadWrapper, stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0}){    
    80001fc8:	00b53023          	sd	a1,0(a0)
    80001fcc:	00c53423          	sd	a2,8(a0)
    80001fd0:	00d53823          	sd	a3,16(a0)
    80001fd4:	00e53c23          	sd	a4,24(a0)
    80001fd8:	02050023          	sb	zero,32(a0)
    80001fdc:	020500a3          	sb	zero,33(a0)
    80001fe0:	00000797          	auipc	a5,0x0
    80001fe4:	f7078793          	addi	a5,a5,-144 # 80001f50 <_ZN3TCB13threadWrapperEv>
    80001fe8:	02f53423          	sd	a5,40(a0)
    80001fec:	04068063          	beqz	a3,8000202c <_ZN3TCBC1EPFvPvES0_Pmm+0x64>
    80001ff0:	000087b7          	lui	a5,0x8
    80001ff4:	00f687b3          	add	a5,a3,a5
    80001ff8:	02f53823          	sd	a5,48(a0)
    if(body && stack)
    80001ffc:	02058c63          	beqz	a1,80002034 <_ZN3TCBC1EPFvPvES0_Pmm+0x6c>
    80002000:	02068a63          	beqz	a3,80002034 <_ZN3TCBC1EPFvPvES0_Pmm+0x6c>
TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00113423          	sd	ra,8(sp)
    8000200c:	00813023          	sd	s0,0(sp)
    80002010:	01010413          	addi	s0,sp,16
        Scheduler::put(this);
    80002014:	00000097          	auipc	ra,0x0
    80002018:	d90080e7          	jalr	-624(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
}   
    8000201c:	00813083          	ld	ra,8(sp)
    80002020:	00013403          	ld	s0,0(sp)
    80002024:	01010113          	addi	sp,sp,16
    80002028:	00008067          	ret
context({(uint64) &threadWrapper, stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0}){    
    8000202c:	00000793          	li	a5,0
    80002030:	fc9ff06f          	j	80001ff8 <_ZN3TCBC1EPFvPvES0_Pmm+0x30>
    80002034:	00008067          	ret

0000000080002038 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(Body body, void* args, uint64* stack){
    80002038:	fd010113          	addi	sp,sp,-48
    8000203c:	02113423          	sd	ra,40(sp)
    80002040:	02813023          	sd	s0,32(sp)
    80002044:	00913c23          	sd	s1,24(sp)
    80002048:	01213823          	sd	s2,16(sp)
    8000204c:	01313423          	sd	s3,8(sp)
    80002050:	01413023          	sd	s4,0(sp)
    80002054:	03010413          	addi	s0,sp,48
    80002058:	00050913          	mv	s2,a0
    8000205c:	00058993          	mv	s3,a1
    80002060:	00060a13          	mv	s4,a2
void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
    80002064:	00000097          	auipc	ra,0x0
    80002068:	8e0080e7          	jalr	-1824(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    8000206c:	00100593          	li	a1,1
    80002070:	00000097          	auipc	ra,0x0
    80002074:	944080e7          	jalr	-1724(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    80002078:	00050493          	mv	s1,a0
    return new TCB(body, args, stack);
    8000207c:	00200713          	li	a4,2
    80002080:	000a0693          	mv	a3,s4
    80002084:	00098613          	mv	a2,s3
    80002088:	00090593          	mv	a1,s2
    8000208c:	00000097          	auipc	ra,0x0
    80002090:	f3c080e7          	jalr	-196(ra) # 80001fc8 <_ZN3TCBC1EPFvPvES0_Pmm>
    80002094:	0280006f          	j	800020bc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x84>
    80002098:	00050913          	mv	s2,a0
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	8a8080e7          	jalr	-1880(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    800020a4:	00048593          	mv	a1,s1
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	aa4080e7          	jalr	-1372(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    800020b0:	00090513          	mv	a0,s2
    800020b4:	00005097          	auipc	ra,0x5
    800020b8:	d04080e7          	jalr	-764(ra) # 80006db8 <_Unwind_Resume>
}
    800020bc:	00048513          	mv	a0,s1
    800020c0:	02813083          	ld	ra,40(sp)
    800020c4:	02013403          	ld	s0,32(sp)
    800020c8:	01813483          	ld	s1,24(sp)
    800020cc:	01013903          	ld	s2,16(sp)
    800020d0:	00813983          	ld	s3,8(sp)
    800020d4:	00013a03          	ld	s4,0(sp)
    800020d8:	03010113          	addi	sp,sp,48
    800020dc:	00008067          	ret

00000000800020e0 <_ZN3TCB8dispatchEv>:

void TCB::dispatch(){
    800020e0:	fe010113          	addi	sp,sp,-32
    800020e4:	00113c23          	sd	ra,24(sp)
    800020e8:	00813823          	sd	s0,16(sp)
    800020ec:	00913423          	sd	s1,8(sp)
    800020f0:	02010413          	addi	s0,sp,32
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    800020f4:	00004797          	auipc	a5,0x4
    800020f8:	bb478793          	addi	a5,a5,-1100 # 80005ca8 <_ZN3TCB7runningE>
    800020fc:	0007b483          	ld	s1,0(a5)
    bool isFinished() const { return finished; }
    80002100:	0204c783          	lbu	a5,32(s1)
    if(!oldRunning->isFinished())
    80002104:	02078c63          	beqz	a5,8000213c <_ZN3TCB8dispatchEv+0x5c>
        Scheduler::put(oldRunning);
    running = Scheduler::get(); 
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	c18080e7          	jalr	-1000(ra) # 80001d20 <_ZN9Scheduler3getEv>
    80002110:	00004797          	auipc	a5,0x4
    80002114:	b8a7bc23          	sd	a0,-1128(a5) # 80005ca8 <_ZN3TCB7runningE>
    contextSwitch(&oldRunning->context, &running->context); 
    80002118:	02850593          	addi	a1,a0,40
    8000211c:	02848513          	addi	a0,s1,40
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	ff0080e7          	jalr	-16(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002128:	01813083          	ld	ra,24(sp)
    8000212c:	01013403          	ld	s0,16(sp)
    80002130:	00813483          	ld	s1,8(sp)
    80002134:	02010113          	addi	sp,sp,32
    80002138:	00008067          	ret
        Scheduler::put(oldRunning);
    8000213c:	00048513          	mv	a0,s1
    80002140:	00000097          	auipc	ra,0x0
    80002144:	c64080e7          	jalr	-924(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
    80002148:	fc1ff06f          	j	80002108 <_ZN3TCB8dispatchEv+0x28>

000000008000214c <_ZN3TCB12deleteThreadEPS_>:

void TCB::deleteThread(TCB* t){
    if(t){
    8000214c:	06050c63          	beqz	a0,800021c4 <_ZN3TCB12deleteThreadEPS_+0x78>
        t->destruct = true;
    80002150:	00100793          	li	a5,1
    80002154:	02f500a3          	sb	a5,33(a0)
    80002158:	02054783          	lbu	a5,32(a0)
        if(t->isFinished() && TCB::running != t){
    8000215c:	06078463          	beqz	a5,800021c4 <_ZN3TCB12deleteThreadEPS_+0x78>
    80002160:	00004797          	auipc	a5,0x4
    80002164:	b4878793          	addi	a5,a5,-1208 # 80005ca8 <_ZN3TCB7runningE>
    80002168:	0007b783          	ld	a5,0(a5)
    8000216c:	04a78c63          	beq	a5,a0,800021c4 <_ZN3TCB12deleteThreadEPS_+0x78>
void TCB::deleteThread(TCB* t){
    80002170:	fe010113          	addi	sp,sp,-32
    80002174:	00113c23          	sd	ra,24(sp)
    80002178:	00813823          	sd	s0,16(sp)
    8000217c:	00913423          	sd	s1,8(sp)
    80002180:	02010413          	addi	s0,sp,32
    80002184:	00050493          	mv	s1,a0
    ~TCB(){  MemoryAllocator::getInstance().mem_free(stack); }
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	7bc080e7          	jalr	1980(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80002190:	0104b583          	ld	a1,16(s1)
    80002194:	00000097          	auipc	ra,0x0
    80002198:	9b8080e7          	jalr	-1608(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	7a8080e7          	jalr	1960(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    800021a4:	00048593          	mv	a1,s1
    800021a8:	00000097          	auipc	ra,0x0
    800021ac:	9a4080e7          	jalr	-1628(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
            delete t;
        }
    }
    800021b0:	01813083          	ld	ra,24(sp)
    800021b4:	01013403          	ld	s0,16(sp)
    800021b8:	00813483          	ld	s1,8(sp)
    800021bc:	02010113          	addi	sp,sp,32
    800021c0:	00008067          	ret
    800021c4:	00008067          	ret

00000000800021c8 <_Z5printmcb>:
#include"../../h/testing.hpp"

void print(uint64 unum, char end, bool hex){
    800021c8:	fa010113          	addi	sp,sp,-96
    800021cc:	04113c23          	sd	ra,88(sp)
    800021d0:	04813823          	sd	s0,80(sp)
    800021d4:	04913423          	sd	s1,72(sp)
    800021d8:	05213023          	sd	s2,64(sp)
    800021dc:	03313c23          	sd	s3,56(sp)
    800021e0:	03413823          	sd	s4,48(sp)
    800021e4:	06010413          	addi	s0,sp,96
    800021e8:	00050913          	mv	s2,a0
    800021ec:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800021f0:	100027f3          	csrr	a5,sstatus
    800021f4:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800021f8:	fa843983          	ld	s3,-88(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800021fc:	00200793          	li	a5,2
    80002200:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    80002204:	04061e63          	bnez	a2,80002260 <_Z5printmcb+0x98>
    int i = 0;
    80002208:	00000493          	li	s1,0
    8000220c:	00c0006f          	j	80002218 <_Z5printmcb+0x50>
    do{
        buffer[i++] = '0' + unum1%10;
    80002210:	00060493          	mv	s1,a2
        unum1/=10;
    80002214:	00078913          	mv	s2,a5
        buffer[i++] = '0' + unum1%10;
    80002218:	00a00793          	li	a5,10
    8000221c:	02f97733          	remu	a4,s2,a5
    80002220:	0014861b          	addiw	a2,s1,1
    80002224:	03070713          	addi	a4,a4,48
    80002228:	fd040693          	addi	a3,s0,-48
    8000222c:	009686b3          	add	a3,a3,s1
    80002230:	fee68023          	sb	a4,-32(a3)
        unum1/=10;
    80002234:	02f957b3          	divu	a5,s2,a5
    }while(unum1 > 0);
    80002238:	00900713          	li	a4,9
    8000223c:	fd276ae3          	bltu	a4,s2,80002210 <_Z5printmcb+0x48>
    for(int j = i-1; j >= 0; j--)
    80002240:	0804c663          	bltz	s1,800022cc <_Z5printmcb+0x104>
        __putc(buffer[j]);
    80002244:	fd040793          	addi	a5,s0,-48
    80002248:	009787b3          	add	a5,a5,s1
    8000224c:	fe07c503          	lbu	a0,-32(a5)
    80002250:	00002097          	auipc	ra,0x2
    80002254:	6ac080e7          	jalr	1708(ra) # 800048fc <__putc>
    for(int j = i-1; j >= 0; j--)
    80002258:	fff4849b          	addiw	s1,s1,-1
    8000225c:	fe5ff06f          	j	80002240 <_Z5printmcb+0x78>
    }else{
    //__putc('\n');
    __putc('0');
    80002260:	03000513          	li	a0,48
    80002264:	00002097          	auipc	ra,0x2
    80002268:	698080e7          	jalr	1688(ra) # 800048fc <__putc>
    __putc('x');
    8000226c:	07800513          	li	a0,120
    80002270:	00002097          	auipc	ra,0x2
    80002274:	68c080e7          	jalr	1676(ra) # 800048fc <__putc>
    
    unum1 = unum;
    i = 0;
    80002278:	00000493          	li	s1,0
    8000227c:	00c0006f          	j	80002288 <_Z5printmcb+0xc0>
    do{
        buffer[i++] = '0' + unum1%16;
    80002280:	00068493          	mv	s1,a3
        unum1/=16;
    80002284:	00070913          	mv	s2,a4
        buffer[i++] = '0' + unum1%16;
    80002288:	00f97793          	andi	a5,s2,15
    8000228c:	0014869b          	addiw	a3,s1,1
    80002290:	03078793          	addi	a5,a5,48
    80002294:	fd040713          	addi	a4,s0,-48
    80002298:	00970733          	add	a4,a4,s1
    8000229c:	fef70023          	sb	a5,-32(a4)
        unum1/=16;
    800022a0:	00495713          	srli	a4,s2,0x4
    } while(unum1 > 0);
    800022a4:	00f00793          	li	a5,15
    800022a8:	fd27ece3          	bltu	a5,s2,80002280 <_Z5printmcb+0xb8>
    for(int j = i-1; j >= 0; j--)
    800022ac:	0204c063          	bltz	s1,800022cc <_Z5printmcb+0x104>
        __putc(buffer[j]);
    800022b0:	fd040793          	addi	a5,s0,-48
    800022b4:	009787b3          	add	a5,a5,s1
    800022b8:	fe07c503          	lbu	a0,-32(a5)
    800022bc:	00002097          	auipc	ra,0x2
    800022c0:	640080e7          	jalr	1600(ra) # 800048fc <__putc>
    for(int j = i-1; j >= 0; j--)
    800022c4:	fff4849b          	addiw	s1,s1,-1
    800022c8:	fe5ff06f          	j	800022ac <_Z5printmcb+0xe4>
    }
    __putc(end);
    800022cc:	000a0513          	mv	a0,s4
    800022d0:	00002097          	auipc	ra,0x2
    800022d4:	62c080e7          	jalr	1580(ra) # 800048fc <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800022d8:	0009899b          	sext.w	s3,s3
    800022dc:	0029f993          	andi	s3,s3,2
    800022e0:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    800022e4:	1009a073          	csrs	sstatus,s3
}
    800022e8:	05813083          	ld	ra,88(sp)
    800022ec:	05013403          	ld	s0,80(sp)
    800022f0:	04813483          	ld	s1,72(sp)
    800022f4:	04013903          	ld	s2,64(sp)
    800022f8:	03813983          	ld	s3,56(sp)
    800022fc:	03013a03          	ld	s4,48(sp)
    80002300:	06010113          	addi	sp,sp,96
    80002304:	00008067          	ret

0000000080002308 <_Z5printPKcc>:

void print(const char* str, char end){
    80002308:	fc010113          	addi	sp,sp,-64
    8000230c:	02113c23          	sd	ra,56(sp)
    80002310:	02813823          	sd	s0,48(sp)
    80002314:	02913423          	sd	s1,40(sp)
    80002318:	03213023          	sd	s2,32(sp)
    8000231c:	01313c23          	sd	s3,24(sp)
    80002320:	01413823          	sd	s4,16(sp)
    80002324:	04010413          	addi	s0,sp,64
    80002328:	00050913          	mv	s2,a0
    8000232c:	00058a13          	mv	s4,a1
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002330:	100027f3          	csrr	a5,sstatus
    80002334:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002338:	fc843983          	ld	s3,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    8000233c:	00200793          	li	a5,2
    80002340:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
    80002344:	00000493          	li	s1,0
    80002348:	009907b3          	add	a5,s2,s1
    8000234c:	0007c503          	lbu	a0,0(a5)
    80002350:	00050a63          	beqz	a0,80002364 <_Z5printPKcc+0x5c>
        __putc(str[i]);
    80002354:	00002097          	auipc	ra,0x2
    80002358:	5a8080e7          	jalr	1448(ra) # 800048fc <__putc>
    for(int i = 0; str[i]; i++)
    8000235c:	0014849b          	addiw	s1,s1,1
    80002360:	fe9ff06f          	j	80002348 <_Z5printPKcc+0x40>
    __putc(end);
    80002364:	000a0513          	mv	a0,s4
    80002368:	00002097          	auipc	ra,0x2
    8000236c:	594080e7          	jalr	1428(ra) # 800048fc <__putc>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002370:	0009899b          	sext.w	s3,s3
    80002374:	0029f993          	andi	s3,s3,2
    80002378:	0009899b          	sext.w	s3,s3
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    8000237c:	1009a073          	csrs	sstatus,s3

}
    80002380:	03813083          	ld	ra,56(sp)
    80002384:	03013403          	ld	s0,48(sp)
    80002388:	02813483          	ld	s1,40(sp)
    8000238c:	02013903          	ld	s2,32(sp)
    80002390:	01813983          	ld	s3,24(sp)
    80002394:	01013a03          	ld	s4,16(sp)
    80002398:	04010113          	addi	sp,sp,64
    8000239c:	00008067          	ret

00000000800023a0 <_Z5printPKcmb>:

void print(const char* str, uint64 t, bool hex){
    800023a0:	fc010113          	addi	sp,sp,-64
    800023a4:	02113c23          	sd	ra,56(sp)
    800023a8:	02813823          	sd	s0,48(sp)
    800023ac:	02913423          	sd	s1,40(sp)
    800023b0:	03213023          	sd	s2,32(sp)
    800023b4:	01313c23          	sd	s3,24(sp)
    800023b8:	04010413          	addi	s0,sp,64
    800023bc:	00058913          	mv	s2,a1
    800023c0:	00060993          	mv	s3,a2
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    800023c4:	100027f3          	csrr	a5,sstatus
    800023c8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800023cc:	fc843483          	ld	s1,-56(s0)
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
    800023d0:	00200793          	li	a5,2
    800023d4:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    800023d8:	02000593          	li	a1,32
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	f2c080e7          	jalr	-212(ra) # 80002308 <_Z5printPKcc>
    print(t, '\n', hex);
    800023e4:	00098613          	mv	a2,s3
    800023e8:	00a00593          	li	a1,10
    800023ec:	00090513          	mv	a0,s2
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	dd8080e7          	jalr	-552(ra) # 800021c8 <_Z5printmcb>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800023f8:	0004849b          	sext.w	s1,s1
    800023fc:	0024f493          	andi	s1,s1,2
    80002400:	0004849b          	sext.w	s1,s1
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
    80002404:	1004a073          	csrs	sstatus,s1
}
    80002408:	03813083          	ld	ra,56(sp)
    8000240c:	03013403          	ld	s0,48(sp)
    80002410:	02813483          	ld	s1,40(sp)
    80002414:	02013903          	ld	s2,32(sp)
    80002418:	01813983          	ld	s3,24(sp)
    8000241c:	04010113          	addi	sp,sp,64
    80002420:	00008067          	ret

0000000080002424 <_Z9allocTestR15MemoryAllocatorm>:

void* allocTest(MemoryAllocator& allocator, size_t size){
    80002424:	fe010113          	addi	sp,sp,-32
    80002428:	00113c23          	sd	ra,24(sp)
    8000242c:	00813823          	sd	s0,16(sp)
    80002430:	00913423          	sd	s1,8(sp)
    80002434:	01213023          	sd	s2,0(sp)
    80002438:	02010413          	addi	s0,sp,32
    8000243c:	00050493          	mv	s1,a0
    80002440:	00058913          	mv	s2,a1
    print("\nAlokacija", ' ');
    80002444:	02000593          	li	a1,32
    80002448:	00003517          	auipc	a0,0x3
    8000244c:	d4850513          	addi	a0,a0,-696 # 80005190 <CONSOLE_STATUS+0x180>
    80002450:	00000097          	auipc	ra,0x0
    80002454:	eb8080e7          	jalr	-328(ra) # 80002308 <_Z5printPKcc>
    print(size, ' ');
    80002458:	00100613          	li	a2,1
    8000245c:	02000593          	li	a1,32
    80002460:	00090513          	mv	a0,s2
    80002464:	00000097          	auipc	ra,0x0
    80002468:	d64080e7          	jalr	-668(ra) # 800021c8 <_Z5printmcb>
    print("blokova");
    8000246c:	00a00593          	li	a1,10
    80002470:	00003517          	auipc	a0,0x3
    80002474:	d3050513          	addi	a0,a0,-720 # 800051a0 <CONSOLE_STATUS+0x190>
    80002478:	00000097          	auipc	ra,0x0
    8000247c:	e90080e7          	jalr	-368(ra) # 80002308 <_Z5printPKcc>
    char* newblc = (char*)allocator.mem_alloc(size);
    80002480:	00090593          	mv	a1,s2
    80002484:	00048513          	mv	a0,s1
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	52c080e7          	jalr	1324(ra) # 800019b4 <_ZN15MemoryAllocator9mem_allocEm>
    80002490:	00050913          	mv	s2,a0
    allocator.print_list();  
    80002494:	00048513          	mv	a0,s1
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	78c080e7          	jalr	1932(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>
    return newblc;
}
    800024a0:	00090513          	mv	a0,s2
    800024a4:	01813083          	ld	ra,24(sp)
    800024a8:	01013403          	ld	s0,16(sp)
    800024ac:	00813483          	ld	s1,8(sp)
    800024b0:	00013903          	ld	s2,0(sp)
    800024b4:	02010113          	addi	sp,sp,32
    800024b8:	00008067          	ret

00000000800024bc <_Z8freeTestR15MemoryAllocatorPv>:

void freeTest(MemoryAllocator& allocator, void* adr){
    800024bc:	fe010113          	addi	sp,sp,-32
    800024c0:	00113c23          	sd	ra,24(sp)
    800024c4:	00813823          	sd	s0,16(sp)
    800024c8:	00913423          	sd	s1,8(sp)
    800024cc:	01213023          	sd	s2,0(sp)
    800024d0:	02010413          	addi	s0,sp,32
    800024d4:	00050493          	mv	s1,a0
    800024d8:	00058913          	mv	s2,a1
    print("\nDealogkacija");
    800024dc:	00a00593          	li	a1,10
    800024e0:	00003517          	auipc	a0,0x3
    800024e4:	cc850513          	addi	a0,a0,-824 # 800051a8 <CONSOLE_STATUS+0x198>
    800024e8:	00000097          	auipc	ra,0x0
    800024ec:	e20080e7          	jalr	-480(ra) # 80002308 <_Z5printPKcc>
    if(allocator.mem_free(adr) < 0)
    800024f0:	00090593          	mv	a1,s2
    800024f4:	00048513          	mv	a0,s1
    800024f8:	fffff097          	auipc	ra,0xfffff
    800024fc:	654080e7          	jalr	1620(ra) # 80001b4c <_ZN15MemoryAllocator8mem_freeEPv>
    80002500:	02054863          	bltz	a0,80002530 <_Z8freeTestR15MemoryAllocatorPv+0x74>
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
    80002504:	00a00593          	li	a1,10
    80002508:	00003517          	auipc	a0,0x3
    8000250c:	cb050513          	addi	a0,a0,-848 # 800051b8 <CONSOLE_STATUS+0x1a8>
    80002510:	00000097          	auipc	ra,0x0
    80002514:	df8080e7          	jalr	-520(ra) # 80002308 <_Z5printPKcc>
}
    80002518:	01813083          	ld	ra,24(sp)
    8000251c:	01013403          	ld	s0,16(sp)
    80002520:	00813483          	ld	s1,8(sp)
    80002524:	00013903          	ld	s2,0(sp)
    80002528:	02010113          	addi	sp,sp,32
    8000252c:	00008067          	ret
        allocator.print_list();
    80002530:	00048513          	mv	a0,s1
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	6f0080e7          	jalr	1776(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>
    8000253c:	fddff06f          	j	80002518 <_Z8freeTestR15MemoryAllocatorPv+0x5c>

0000000080002540 <_Z7memTestv>:

void memTest(){
    80002540:	fe010113          	addi	sp,sp,-32
    80002544:	00113c23          	sd	ra,24(sp)
    80002548:	00813823          	sd	s0,16(sp)
    8000254c:	00913423          	sd	s1,8(sp)
    80002550:	01213023          	sd	s2,0(sp)
    80002554:	02010413          	addi	s0,sp,32
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    80002558:	fffff097          	auipc	ra,0xfffff
    8000255c:	3ec080e7          	jalr	1004(ra) # 80001944 <_ZN15MemoryAllocator11getInstanceEv>
    80002560:	00050493          	mv	s1,a0
    allocator.print_list();
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	6c0080e7          	jalr	1728(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(50);
    8000256c:	03200513          	li	a0,50
    80002570:	00000097          	auipc	ra,0x0
    80002574:	1dc080e7          	jalr	476(ra) # 8000274c <mem_alloc>
    
    allocator.print_list();
    80002578:	00048513          	mv	a0,s1
    8000257c:	fffff097          	auipc	ra,0xfffff
    80002580:	6a8080e7          	jalr	1704(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>

    char* t = (char*)mem_alloc(100);
    80002584:	06400513          	li	a0,100
    80002588:	00000097          	auipc	ra,0x0
    8000258c:	1c4080e7          	jalr	452(ra) # 8000274c <mem_alloc>
    80002590:	00050913          	mv	s2,a0
    print("t:", (uint64)t, 0);
    80002594:	00000613          	li	a2,0
    80002598:	00050593          	mv	a1,a0
    8000259c:	00003517          	auipc	a0,0x3
    800025a0:	c3450513          	addi	a0,a0,-972 # 800051d0 <CONSOLE_STATUS+0x1c0>
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	dfc080e7          	jalr	-516(ra) # 800023a0 <_Z5printPKcmb>

    allocator.print_list();
    800025ac:	00048513          	mv	a0,s1
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	674080e7          	jalr	1652(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>

    mem_alloc(300);
    800025b8:	12c00513          	li	a0,300
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	190080e7          	jalr	400(ra) # 8000274c <mem_alloc>

    allocator.print_list();
    800025c4:	00048513          	mv	a0,s1
    800025c8:	fffff097          	auipc	ra,0xfffff
    800025cc:	65c080e7          	jalr	1628(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>
    
    print("free_res:", mem_free(t), 0);
    800025d0:	00090513          	mv	a0,s2
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	1b0080e7          	jalr	432(ra) # 80002784 <mem_free>
    800025dc:	00000613          	li	a2,0
    800025e0:	00050593          	mv	a1,a0
    800025e4:	00003517          	auipc	a0,0x3
    800025e8:	bf450513          	addi	a0,a0,-1036 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	db4080e7          	jalr	-588(ra) # 800023a0 <_Z5printPKcmb>
    
    allocator.print_list();
    800025f4:	00048513          	mv	a0,s1
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	62c080e7          	jalr	1580(ra) # 80001c24 <_ZN15MemoryAllocator10print_listEv>
}
    80002600:	01813083          	ld	ra,24(sp)
    80002604:	01013403          	ld	s0,16(sp)
    80002608:	00813483          	ld	s1,8(sp)
    8000260c:	00013903          	ld	s2,0(sp)
    80002610:	02010113          	addi	sp,sp,32
    80002614:	00008067          	ret

0000000080002618 <_Z8print_a0v>:

void print_a0(){
    80002618:	fe010113          	addi	sp,sp,-32
    8000261c:	00113c23          	sd	ra,24(sp)
    80002620:	00813823          	sd	s0,16(sp)
    80002624:	00913423          	sd	s1,8(sp)
    80002628:	02010413          	addi	s0,sp,32
    asm volatile("mv %0, a0" : "=r" (a0));
    8000262c:	00050493          	mv	s1,a0
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    80002630:	02000593          	li	a1,32
    80002634:	00003517          	auipc	a0,0x3
    80002638:	bb450513          	addi	a0,a0,-1100 # 800051e8 <CONSOLE_STATUS+0x1d8>
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	ccc080e7          	jalr	-820(ra) # 80002308 <_Z5printPKcc>
    print(a0, '\n', 1);
    80002644:	00100613          	li	a2,1
    80002648:	00a00593          	li	a1,10
    8000264c:	00048513          	mv	a0,s1
    80002650:	00000097          	auipc	ra,0x0
    80002654:	b78080e7          	jalr	-1160(ra) # 800021c8 <_Z5printmcb>
    //asm volatile("mv a0, %0" : : "r" (a0));
}
    80002658:	01813083          	ld	ra,24(sp)
    8000265c:	01013403          	ld	s0,16(sp)
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	02010113          	addi	sp,sp,32
    80002668:	00008067          	ret

000000008000266c <_Z19print_sup_registersv>:

void print_sup_registers(){ 
    8000266c:	fd010113          	addi	sp,sp,-48
    80002670:	02113423          	sd	ra,40(sp)
    80002674:	02813023          	sd	s0,32(sp)
    80002678:	03010413          	addi	s0,sp,48

    print("sstatus:",' ');
    8000267c:	02000593          	li	a1,32
    80002680:	00003517          	auipc	a0,0x3
    80002684:	b7050513          	addi	a0,a0,-1168 # 800051f0 <CONSOLE_STATUS+0x1e0>
    80002688:	00000097          	auipc	ra,0x0
    8000268c:	c80080e7          	jalr	-896(ra) # 80002308 <_Z5printPKcc>
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    80002690:	100027f3          	csrr	a5,sstatus
    80002694:	fef43423          	sd	a5,-24(s0)
    return sstatus;
    80002698:	fe843503          	ld	a0,-24(s0)
    print(Riscv::r_sstatus(), '\n', 1);
    8000269c:	00100613          	li	a2,1
    800026a0:	00a00593          	li	a1,10
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	b24080e7          	jalr	-1244(ra) # 800021c8 <_Z5printmcb>

    print("sip:",' ');
    800026ac:	02000593          	li	a1,32
    800026b0:	00003517          	auipc	a0,0x3
    800026b4:	b5050513          	addi	a0,a0,-1200 # 80005200 <CONSOLE_STATUS+0x1f0>
    800026b8:	00000097          	auipc	ra,0x0
    800026bc:	c50080e7          	jalr	-944(ra) # 80002308 <_Z5printPKcc>
    asm volatile("csrr %0, sip" : "=r" (sip));
    800026c0:	144027f3          	csrr	a5,sip
    800026c4:	fef43023          	sd	a5,-32(s0)
    return sip;
    800026c8:	fe043503          	ld	a0,-32(s0)
    print(Riscv::r_sip(), '\n', 1);
    800026cc:	00100613          	li	a2,1
    800026d0:	00a00593          	li	a1,10
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	af4080e7          	jalr	-1292(ra) # 800021c8 <_Z5printmcb>

    print("stval:",' ');
    800026dc:	02000593          	li	a1,32
    800026e0:	00003517          	auipc	a0,0x3
    800026e4:	b2850513          	addi	a0,a0,-1240 # 80005208 <CONSOLE_STATUS+0x1f8>
    800026e8:	00000097          	auipc	ra,0x0
    800026ec:	c20080e7          	jalr	-992(ra) # 80002308 <_Z5printPKcc>
    asm volatile("csrr %0, stval" : "=r" (stval));
    800026f0:	143027f3          	csrr	a5,stval
    800026f4:	fcf43c23          	sd	a5,-40(s0)
    return stval;
    800026f8:	fd843503          	ld	a0,-40(s0)
    print(Riscv::r_stval(), '\n', 1);
    800026fc:	00100613          	li	a2,1
    80002700:	00a00593          	li	a1,10
    80002704:	00000097          	auipc	ra,0x0
    80002708:	ac4080e7          	jalr	-1340(ra) # 800021c8 <_Z5printmcb>

    print("scause:",' ');
    8000270c:	02000593          	li	a1,32
    80002710:	00003517          	auipc	a0,0x3
    80002714:	b0050513          	addi	a0,a0,-1280 # 80005210 <CONSOLE_STATUS+0x200>
    80002718:	00000097          	auipc	ra,0x0
    8000271c:	bf0080e7          	jalr	-1040(ra) # 80002308 <_Z5printPKcc>
    asm volatile("csrr %0, scause" : "=r" (scause));
    80002720:	142027f3          	csrr	a5,scause
    80002724:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80002728:	fd043503          	ld	a0,-48(s0)
    print(Riscv::r_scause(), '\n', 1);
    8000272c:	00100613          	li	a2,1
    80002730:	00a00593          	li	a1,10
    80002734:	00000097          	auipc	ra,0x0
    80002738:	a94080e7          	jalr	-1388(ra) # 800021c8 <_Z5printmcb>
}
    8000273c:	02813083          	ld	ra,40(sp)
    80002740:	02013403          	ld	s0,32(sp)
    80002744:	03010113          	addi	sp,sp,48
    80002748:	00008067          	ret

000000008000274c <mem_alloc>:
#include"../../lib/hw.h"
#include"../../h/_thread.hpp"
extern "C" void* mem_alloc(size_t size){
    8000274c:	ff010113          	addi	sp,sp,-16
    80002750:	00813423          	sd	s0,8(sp)
    80002754:	01010413          	addi	s0,sp,16
    size_t szblcks = (size-1)/MEM_BLOCK_SIZE + 1;
    80002758:	fff50513          	addi	a0,a0,-1
    8000275c:	00655513          	srli	a0,a0,0x6
    80002760:	00150513          	addi	a0,a0,1
    char* adr = 0;

    __asm__ volatile("mv a1, %0" : : "r" (szblcks));
    80002764:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x1));
    80002768:	00100793          	li	a5,1
    8000276c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80002770:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (adr));
    80002774:	00050513          	mv	a0,a0
    
    return adr;  
}
    80002778:	00813403          	ld	s0,8(sp)
    8000277c:	01010113          	addi	sp,sp,16
    80002780:	00008067          	ret

0000000080002784 <mem_free>:

extern "C" int mem_free (void* adr){
    80002784:	ff010113          	addi	sp,sp,-16
    80002788:	00813423          	sd	s0,8(sp)
    8000278c:	01010413          	addi	s0,sp,16
    int ret;

    __asm__ volatile("mv a1, %0" : : "r" ((uint64)adr));
    80002790:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (0x2));
    80002794:	00200793          	li	a5,2
    80002798:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000279c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800027a0:	00050513          	mv	a0,a0
    
    return ret;
}
    800027a4:	0005051b          	sext.w	a0,a0
    800027a8:	00813403          	ld	s0,8(sp)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret

00000000800027b4 <thread_dispatch>:

extern "C" void thread_dispatch(){
    800027b4:	ff010113          	addi	sp,sp,-16
    800027b8:	00813423          	sd	s0,8(sp)
    800027bc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (0x13));
    800027c0:	01300793          	li	a5,19
    800027c4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800027c8:	00000073          	ecall
}
    800027cc:	00813403          	ld	s0,8(sp)
    800027d0:	01010113          	addi	sp,sp,16
    800027d4:	00008067          	ret

00000000800027d8 <thread_create>:



extern "C" void thread_create(thread_t* handle, 
    void(*start_routine)(void*), void* arg){
    800027d8:	fd010113          	addi	sp,sp,-48
    800027dc:	02113423          	sd	ra,40(sp)
    800027e0:	02813023          	sd	s0,32(sp)
    800027e4:	00913c23          	sd	s1,24(sp)
    800027e8:	01213823          	sd	s2,16(sp)
    800027ec:	01313423          	sd	s3,8(sp)
    800027f0:	03010413          	addi	s0,sp,48
    800027f4:	00050993          	mv	s3,a0
    800027f8:	00058913          	mv	s2,a1
    800027fc:	00060493          	mv	s1,a2
   
    void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80002800:	00001537          	lui	a0,0x1
    80002804:	00000097          	auipc	ra,0x0
    80002808:	f48080e7          	jalr	-184(ra) # 8000274c <mem_alloc>
    
    asm volatile("li a0, 0x11");
    8000280c:	01100513          	li	a0,17
    asm volatile("mv a1, %0" : : "r" ((uint64)handle));
    80002810:	00098593          	mv	a1,s3
    asm volatile("mv a2, %0" : : "r" ((uint64)start_routine));
    80002814:	00090613          	mv	a2,s2
    asm volatile("mv a3, %0" : : "r" ((uint64)arg));
    80002818:	00048693          	mv	a3,s1
    asm volatile("mv a4, %0" : : "r" ((uint64)stack_space));
    8000281c:	00050713          	mv	a4,a0
    

    80002820:	02813083          	ld	ra,40(sp)
    80002824:	02013403          	ld	s0,32(sp)
    80002828:	01813483          	ld	s1,24(sp)
    8000282c:	01013903          	ld	s2,16(sp)
    80002830:	00813983          	ld	s3,8(sp)
    80002834:	03010113          	addi	sp,sp,48
    80002838:	00008067          	ret

000000008000283c <start>:
    8000283c:	ff010113          	addi	sp,sp,-16
    80002840:	00813423          	sd	s0,8(sp)
    80002844:	01010413          	addi	s0,sp,16
    80002848:	300027f3          	csrr	a5,mstatus
    8000284c:	ffffe737          	lui	a4,0xffffe
    80002850:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff78af>
    80002854:	00e7f7b3          	and	a5,a5,a4
    80002858:	00001737          	lui	a4,0x1
    8000285c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002860:	00e7e7b3          	or	a5,a5,a4
    80002864:	30079073          	csrw	mstatus,a5
    80002868:	00000797          	auipc	a5,0x0
    8000286c:	16078793          	addi	a5,a5,352 # 800029c8 <system_main>
    80002870:	34179073          	csrw	mepc,a5
    80002874:	00000793          	li	a5,0
    80002878:	18079073          	csrw	satp,a5
    8000287c:	000107b7          	lui	a5,0x10
    80002880:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002884:	30279073          	csrw	medeleg,a5
    80002888:	30379073          	csrw	mideleg,a5
    8000288c:	104027f3          	csrr	a5,sie
    80002890:	2227e793          	ori	a5,a5,546
    80002894:	10479073          	csrw	sie,a5
    80002898:	fff00793          	li	a5,-1
    8000289c:	00a7d793          	srli	a5,a5,0xa
    800028a0:	3b079073          	csrw	pmpaddr0,a5
    800028a4:	00f00793          	li	a5,15
    800028a8:	3a079073          	csrw	pmpcfg0,a5
    800028ac:	f14027f3          	csrr	a5,mhartid
    800028b0:	0200c737          	lui	a4,0x200c
    800028b4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800028b8:	0007869b          	sext.w	a3,a5
    800028bc:	00269713          	slli	a4,a3,0x2
    800028c0:	000f4637          	lui	a2,0xf4
    800028c4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800028c8:	00d70733          	add	a4,a4,a3
    800028cc:	0037979b          	slliw	a5,a5,0x3
    800028d0:	020046b7          	lui	a3,0x2004
    800028d4:	00d787b3          	add	a5,a5,a3
    800028d8:	00c585b3          	add	a1,a1,a2
    800028dc:	00371693          	slli	a3,a4,0x3
    800028e0:	00003717          	auipc	a4,0x3
    800028e4:	41070713          	addi	a4,a4,1040 # 80005cf0 <timer_scratch>
    800028e8:	00b7b023          	sd	a1,0(a5)
    800028ec:	00d70733          	add	a4,a4,a3
    800028f0:	00f73c23          	sd	a5,24(a4)
    800028f4:	02c73023          	sd	a2,32(a4)
    800028f8:	34071073          	csrw	mscratch,a4
    800028fc:	00000797          	auipc	a5,0x0
    80002900:	6e478793          	addi	a5,a5,1764 # 80002fe0 <timervec>
    80002904:	30579073          	csrw	mtvec,a5
    80002908:	300027f3          	csrr	a5,mstatus
    8000290c:	0087e793          	ori	a5,a5,8
    80002910:	30079073          	csrw	mstatus,a5
    80002914:	304027f3          	csrr	a5,mie
    80002918:	0807e793          	ori	a5,a5,128
    8000291c:	30479073          	csrw	mie,a5
    80002920:	f14027f3          	csrr	a5,mhartid
    80002924:	0007879b          	sext.w	a5,a5
    80002928:	00078213          	mv	tp,a5
    8000292c:	30200073          	mret
    80002930:	00813403          	ld	s0,8(sp)
    80002934:	01010113          	addi	sp,sp,16
    80002938:	00008067          	ret

000000008000293c <timerinit>:
    8000293c:	ff010113          	addi	sp,sp,-16
    80002940:	00813423          	sd	s0,8(sp)
    80002944:	01010413          	addi	s0,sp,16
    80002948:	f14027f3          	csrr	a5,mhartid
    8000294c:	0200c737          	lui	a4,0x200c
    80002950:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002954:	0007869b          	sext.w	a3,a5
    80002958:	00269713          	slli	a4,a3,0x2
    8000295c:	000f4637          	lui	a2,0xf4
    80002960:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002964:	00d70733          	add	a4,a4,a3
    80002968:	0037979b          	slliw	a5,a5,0x3
    8000296c:	020046b7          	lui	a3,0x2004
    80002970:	00d787b3          	add	a5,a5,a3
    80002974:	00c585b3          	add	a1,a1,a2
    80002978:	00371693          	slli	a3,a4,0x3
    8000297c:	00003717          	auipc	a4,0x3
    80002980:	37470713          	addi	a4,a4,884 # 80005cf0 <timer_scratch>
    80002984:	00b7b023          	sd	a1,0(a5)
    80002988:	00d70733          	add	a4,a4,a3
    8000298c:	00f73c23          	sd	a5,24(a4)
    80002990:	02c73023          	sd	a2,32(a4)
    80002994:	34071073          	csrw	mscratch,a4
    80002998:	00000797          	auipc	a5,0x0
    8000299c:	64878793          	addi	a5,a5,1608 # 80002fe0 <timervec>
    800029a0:	30579073          	csrw	mtvec,a5
    800029a4:	300027f3          	csrr	a5,mstatus
    800029a8:	0087e793          	ori	a5,a5,8
    800029ac:	30079073          	csrw	mstatus,a5
    800029b0:	304027f3          	csrr	a5,mie
    800029b4:	0807e793          	ori	a5,a5,128
    800029b8:	30479073          	csrw	mie,a5
    800029bc:	00813403          	ld	s0,8(sp)
    800029c0:	01010113          	addi	sp,sp,16
    800029c4:	00008067          	ret

00000000800029c8 <system_main>:
    800029c8:	fe010113          	addi	sp,sp,-32
    800029cc:	00813823          	sd	s0,16(sp)
    800029d0:	00913423          	sd	s1,8(sp)
    800029d4:	00113c23          	sd	ra,24(sp)
    800029d8:	02010413          	addi	s0,sp,32
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	0c4080e7          	jalr	196(ra) # 80002aa0 <cpuid>
    800029e4:	00003497          	auipc	s1,0x3
    800029e8:	2cc48493          	addi	s1,s1,716 # 80005cb0 <started>
    800029ec:	02050263          	beqz	a0,80002a10 <system_main+0x48>
    800029f0:	0004a783          	lw	a5,0(s1)
    800029f4:	0007879b          	sext.w	a5,a5
    800029f8:	fe078ce3          	beqz	a5,800029f0 <system_main+0x28>
    800029fc:	0ff0000f          	fence
    80002a00:	00003517          	auipc	a0,0x3
    80002a04:	84850513          	addi	a0,a0,-1976 # 80005248 <CONSOLE_STATUS+0x238>
    80002a08:	00001097          	auipc	ra,0x1
    80002a0c:	a74080e7          	jalr	-1420(ra) # 8000347c <panic>
    80002a10:	00001097          	auipc	ra,0x1
    80002a14:	9c8080e7          	jalr	-1592(ra) # 800033d8 <consoleinit>
    80002a18:	00001097          	auipc	ra,0x1
    80002a1c:	154080e7          	jalr	340(ra) # 80003b6c <printfinit>
    80002a20:	00003517          	auipc	a0,0x3
    80002a24:	90850513          	addi	a0,a0,-1784 # 80005328 <CONSOLE_STATUS+0x318>
    80002a28:	00001097          	auipc	ra,0x1
    80002a2c:	ab0080e7          	jalr	-1360(ra) # 800034d8 <__printf>
    80002a30:	00002517          	auipc	a0,0x2
    80002a34:	7e850513          	addi	a0,a0,2024 # 80005218 <CONSOLE_STATUS+0x208>
    80002a38:	00001097          	auipc	ra,0x1
    80002a3c:	aa0080e7          	jalr	-1376(ra) # 800034d8 <__printf>
    80002a40:	00003517          	auipc	a0,0x3
    80002a44:	8e850513          	addi	a0,a0,-1816 # 80005328 <CONSOLE_STATUS+0x318>
    80002a48:	00001097          	auipc	ra,0x1
    80002a4c:	a90080e7          	jalr	-1392(ra) # 800034d8 <__printf>
    80002a50:	00001097          	auipc	ra,0x1
    80002a54:	4a8080e7          	jalr	1192(ra) # 80003ef8 <kinit>
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	148080e7          	jalr	328(ra) # 80002ba0 <trapinit>
    80002a60:	00000097          	auipc	ra,0x0
    80002a64:	16c080e7          	jalr	364(ra) # 80002bcc <trapinithart>
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	5b8080e7          	jalr	1464(ra) # 80003020 <plicinit>
    80002a70:	00000097          	auipc	ra,0x0
    80002a74:	5d8080e7          	jalr	1496(ra) # 80003048 <plicinithart>
    80002a78:	00000097          	auipc	ra,0x0
    80002a7c:	078080e7          	jalr	120(ra) # 80002af0 <userinit>
    80002a80:	0ff0000f          	fence
    80002a84:	00100793          	li	a5,1
    80002a88:	00002517          	auipc	a0,0x2
    80002a8c:	7a850513          	addi	a0,a0,1960 # 80005230 <CONSOLE_STATUS+0x220>
    80002a90:	00f4a023          	sw	a5,0(s1)
    80002a94:	00001097          	auipc	ra,0x1
    80002a98:	a44080e7          	jalr	-1468(ra) # 800034d8 <__printf>
    80002a9c:	0000006f          	j	80002a9c <system_main+0xd4>

0000000080002aa0 <cpuid>:
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00813423          	sd	s0,8(sp)
    80002aa8:	01010413          	addi	s0,sp,16
    80002aac:	00020513          	mv	a0,tp
    80002ab0:	00813403          	ld	s0,8(sp)
    80002ab4:	0005051b          	sext.w	a0,a0
    80002ab8:	01010113          	addi	sp,sp,16
    80002abc:	00008067          	ret

0000000080002ac0 <mycpu>:
    80002ac0:	ff010113          	addi	sp,sp,-16
    80002ac4:	00813423          	sd	s0,8(sp)
    80002ac8:	01010413          	addi	s0,sp,16
    80002acc:	00020793          	mv	a5,tp
    80002ad0:	00813403          	ld	s0,8(sp)
    80002ad4:	0007879b          	sext.w	a5,a5
    80002ad8:	00779793          	slli	a5,a5,0x7
    80002adc:	00004517          	auipc	a0,0x4
    80002ae0:	24450513          	addi	a0,a0,580 # 80006d20 <cpus>
    80002ae4:	00f50533          	add	a0,a0,a5
    80002ae8:	01010113          	addi	sp,sp,16
    80002aec:	00008067          	ret

0000000080002af0 <userinit>:
    80002af0:	ff010113          	addi	sp,sp,-16
    80002af4:	00813423          	sd	s0,8(sp)
    80002af8:	01010413          	addi	s0,sp,16
    80002afc:	00813403          	ld	s0,8(sp)
    80002b00:	01010113          	addi	sp,sp,16
    80002b04:	fffff317          	auipc	t1,0xfffff
    80002b08:	c1430067          	jr	-1004(t1) # 80001718 <main>

0000000080002b0c <either_copyout>:
    80002b0c:	ff010113          	addi	sp,sp,-16
    80002b10:	00813023          	sd	s0,0(sp)
    80002b14:	00113423          	sd	ra,8(sp)
    80002b18:	01010413          	addi	s0,sp,16
    80002b1c:	02051663          	bnez	a0,80002b48 <either_copyout+0x3c>
    80002b20:	00058513          	mv	a0,a1
    80002b24:	00060593          	mv	a1,a2
    80002b28:	0006861b          	sext.w	a2,a3
    80002b2c:	00002097          	auipc	ra,0x2
    80002b30:	c58080e7          	jalr	-936(ra) # 80004784 <__memmove>
    80002b34:	00813083          	ld	ra,8(sp)
    80002b38:	00013403          	ld	s0,0(sp)
    80002b3c:	00000513          	li	a0,0
    80002b40:	01010113          	addi	sp,sp,16
    80002b44:	00008067          	ret
    80002b48:	00002517          	auipc	a0,0x2
    80002b4c:	72850513          	addi	a0,a0,1832 # 80005270 <CONSOLE_STATUS+0x260>
    80002b50:	00001097          	auipc	ra,0x1
    80002b54:	92c080e7          	jalr	-1748(ra) # 8000347c <panic>

0000000080002b58 <either_copyin>:
    80002b58:	ff010113          	addi	sp,sp,-16
    80002b5c:	00813023          	sd	s0,0(sp)
    80002b60:	00113423          	sd	ra,8(sp)
    80002b64:	01010413          	addi	s0,sp,16
    80002b68:	02059463          	bnez	a1,80002b90 <either_copyin+0x38>
    80002b6c:	00060593          	mv	a1,a2
    80002b70:	0006861b          	sext.w	a2,a3
    80002b74:	00002097          	auipc	ra,0x2
    80002b78:	c10080e7          	jalr	-1008(ra) # 80004784 <__memmove>
    80002b7c:	00813083          	ld	ra,8(sp)
    80002b80:	00013403          	ld	s0,0(sp)
    80002b84:	00000513          	li	a0,0
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00008067          	ret
    80002b90:	00002517          	auipc	a0,0x2
    80002b94:	70850513          	addi	a0,a0,1800 # 80005298 <CONSOLE_STATUS+0x288>
    80002b98:	00001097          	auipc	ra,0x1
    80002b9c:	8e4080e7          	jalr	-1820(ra) # 8000347c <panic>

0000000080002ba0 <trapinit>:
    80002ba0:	ff010113          	addi	sp,sp,-16
    80002ba4:	00813423          	sd	s0,8(sp)
    80002ba8:	01010413          	addi	s0,sp,16
    80002bac:	00813403          	ld	s0,8(sp)
    80002bb0:	00002597          	auipc	a1,0x2
    80002bb4:	71058593          	addi	a1,a1,1808 # 800052c0 <CONSOLE_STATUS+0x2b0>
    80002bb8:	00004517          	auipc	a0,0x4
    80002bbc:	1e850513          	addi	a0,a0,488 # 80006da0 <tickslock>
    80002bc0:	01010113          	addi	sp,sp,16
    80002bc4:	00001317          	auipc	t1,0x1
    80002bc8:	5c430067          	jr	1476(t1) # 80004188 <initlock>

0000000080002bcc <trapinithart>:
    80002bcc:	ff010113          	addi	sp,sp,-16
    80002bd0:	00813423          	sd	s0,8(sp)
    80002bd4:	01010413          	addi	s0,sp,16
    80002bd8:	00000797          	auipc	a5,0x0
    80002bdc:	2f878793          	addi	a5,a5,760 # 80002ed0 <kernelvec>
    80002be0:	10579073          	csrw	stvec,a5
    80002be4:	00813403          	ld	s0,8(sp)
    80002be8:	01010113          	addi	sp,sp,16
    80002bec:	00008067          	ret

0000000080002bf0 <usertrap>:
    80002bf0:	ff010113          	addi	sp,sp,-16
    80002bf4:	00813423          	sd	s0,8(sp)
    80002bf8:	01010413          	addi	s0,sp,16
    80002bfc:	00813403          	ld	s0,8(sp)
    80002c00:	01010113          	addi	sp,sp,16
    80002c04:	00008067          	ret

0000000080002c08 <usertrapret>:
    80002c08:	ff010113          	addi	sp,sp,-16
    80002c0c:	00813423          	sd	s0,8(sp)
    80002c10:	01010413          	addi	s0,sp,16
    80002c14:	00813403          	ld	s0,8(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <kerneltrap>:
    80002c20:	fe010113          	addi	sp,sp,-32
    80002c24:	00813823          	sd	s0,16(sp)
    80002c28:	00113c23          	sd	ra,24(sp)
    80002c2c:	00913423          	sd	s1,8(sp)
    80002c30:	02010413          	addi	s0,sp,32
    80002c34:	142025f3          	csrr	a1,scause
    80002c38:	100027f3          	csrr	a5,sstatus
    80002c3c:	0027f793          	andi	a5,a5,2
    80002c40:	10079c63          	bnez	a5,80002d58 <kerneltrap+0x138>
    80002c44:	142027f3          	csrr	a5,scause
    80002c48:	0207ce63          	bltz	a5,80002c84 <kerneltrap+0x64>
    80002c4c:	00002517          	auipc	a0,0x2
    80002c50:	6bc50513          	addi	a0,a0,1724 # 80005308 <CONSOLE_STATUS+0x2f8>
    80002c54:	00001097          	auipc	ra,0x1
    80002c58:	884080e7          	jalr	-1916(ra) # 800034d8 <__printf>
    80002c5c:	141025f3          	csrr	a1,sepc
    80002c60:	14302673          	csrr	a2,stval
    80002c64:	00002517          	auipc	a0,0x2
    80002c68:	6b450513          	addi	a0,a0,1716 # 80005318 <CONSOLE_STATUS+0x308>
    80002c6c:	00001097          	auipc	ra,0x1
    80002c70:	86c080e7          	jalr	-1940(ra) # 800034d8 <__printf>
    80002c74:	00002517          	auipc	a0,0x2
    80002c78:	6bc50513          	addi	a0,a0,1724 # 80005330 <CONSOLE_STATUS+0x320>
    80002c7c:	00001097          	auipc	ra,0x1
    80002c80:	800080e7          	jalr	-2048(ra) # 8000347c <panic>
    80002c84:	0ff7f713          	andi	a4,a5,255
    80002c88:	00900693          	li	a3,9
    80002c8c:	04d70063          	beq	a4,a3,80002ccc <kerneltrap+0xac>
    80002c90:	fff00713          	li	a4,-1
    80002c94:	03f71713          	slli	a4,a4,0x3f
    80002c98:	00170713          	addi	a4,a4,1
    80002c9c:	fae798e3          	bne	a5,a4,80002c4c <kerneltrap+0x2c>
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	e00080e7          	jalr	-512(ra) # 80002aa0 <cpuid>
    80002ca8:	06050663          	beqz	a0,80002d14 <kerneltrap+0xf4>
    80002cac:	144027f3          	csrr	a5,sip
    80002cb0:	ffd7f793          	andi	a5,a5,-3
    80002cb4:	14479073          	csrw	sip,a5
    80002cb8:	01813083          	ld	ra,24(sp)
    80002cbc:	01013403          	ld	s0,16(sp)
    80002cc0:	00813483          	ld	s1,8(sp)
    80002cc4:	02010113          	addi	sp,sp,32
    80002cc8:	00008067          	ret
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	3c8080e7          	jalr	968(ra) # 80003094 <plic_claim>
    80002cd4:	00a00793          	li	a5,10
    80002cd8:	00050493          	mv	s1,a0
    80002cdc:	06f50863          	beq	a0,a5,80002d4c <kerneltrap+0x12c>
    80002ce0:	fc050ce3          	beqz	a0,80002cb8 <kerneltrap+0x98>
    80002ce4:	00050593          	mv	a1,a0
    80002ce8:	00002517          	auipc	a0,0x2
    80002cec:	60050513          	addi	a0,a0,1536 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80002cf0:	00000097          	auipc	ra,0x0
    80002cf4:	7e8080e7          	jalr	2024(ra) # 800034d8 <__printf>
    80002cf8:	01013403          	ld	s0,16(sp)
    80002cfc:	01813083          	ld	ra,24(sp)
    80002d00:	00048513          	mv	a0,s1
    80002d04:	00813483          	ld	s1,8(sp)
    80002d08:	02010113          	addi	sp,sp,32
    80002d0c:	00000317          	auipc	t1,0x0
    80002d10:	3c030067          	jr	960(t1) # 800030cc <plic_complete>
    80002d14:	00004517          	auipc	a0,0x4
    80002d18:	08c50513          	addi	a0,a0,140 # 80006da0 <tickslock>
    80002d1c:	00001097          	auipc	ra,0x1
    80002d20:	490080e7          	jalr	1168(ra) # 800041ac <acquire>
    80002d24:	00003717          	auipc	a4,0x3
    80002d28:	f9070713          	addi	a4,a4,-112 # 80005cb4 <ticks>
    80002d2c:	00072783          	lw	a5,0(a4)
    80002d30:	00004517          	auipc	a0,0x4
    80002d34:	07050513          	addi	a0,a0,112 # 80006da0 <tickslock>
    80002d38:	0017879b          	addiw	a5,a5,1
    80002d3c:	00f72023          	sw	a5,0(a4)
    80002d40:	00001097          	auipc	ra,0x1
    80002d44:	538080e7          	jalr	1336(ra) # 80004278 <release>
    80002d48:	f65ff06f          	j	80002cac <kerneltrap+0x8c>
    80002d4c:	00001097          	auipc	ra,0x1
    80002d50:	094080e7          	jalr	148(ra) # 80003de0 <uartintr>
    80002d54:	fa5ff06f          	j	80002cf8 <kerneltrap+0xd8>
    80002d58:	00002517          	auipc	a0,0x2
    80002d5c:	57050513          	addi	a0,a0,1392 # 800052c8 <CONSOLE_STATUS+0x2b8>
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	71c080e7          	jalr	1820(ra) # 8000347c <panic>

0000000080002d68 <clockintr>:
    80002d68:	fe010113          	addi	sp,sp,-32
    80002d6c:	00813823          	sd	s0,16(sp)
    80002d70:	00913423          	sd	s1,8(sp)
    80002d74:	00113c23          	sd	ra,24(sp)
    80002d78:	02010413          	addi	s0,sp,32
    80002d7c:	00004497          	auipc	s1,0x4
    80002d80:	02448493          	addi	s1,s1,36 # 80006da0 <tickslock>
    80002d84:	00048513          	mv	a0,s1
    80002d88:	00001097          	auipc	ra,0x1
    80002d8c:	424080e7          	jalr	1060(ra) # 800041ac <acquire>
    80002d90:	00003717          	auipc	a4,0x3
    80002d94:	f2470713          	addi	a4,a4,-220 # 80005cb4 <ticks>
    80002d98:	00072783          	lw	a5,0(a4)
    80002d9c:	01013403          	ld	s0,16(sp)
    80002da0:	01813083          	ld	ra,24(sp)
    80002da4:	00048513          	mv	a0,s1
    80002da8:	0017879b          	addiw	a5,a5,1
    80002dac:	00813483          	ld	s1,8(sp)
    80002db0:	00f72023          	sw	a5,0(a4)
    80002db4:	02010113          	addi	sp,sp,32
    80002db8:	00001317          	auipc	t1,0x1
    80002dbc:	4c030067          	jr	1216(t1) # 80004278 <release>

0000000080002dc0 <devintr>:
    80002dc0:	142027f3          	csrr	a5,scause
    80002dc4:	00000513          	li	a0,0
    80002dc8:	0007c463          	bltz	a5,80002dd0 <devintr+0x10>
    80002dcc:	00008067          	ret
    80002dd0:	fe010113          	addi	sp,sp,-32
    80002dd4:	00813823          	sd	s0,16(sp)
    80002dd8:	00113c23          	sd	ra,24(sp)
    80002ddc:	00913423          	sd	s1,8(sp)
    80002de0:	02010413          	addi	s0,sp,32
    80002de4:	0ff7f713          	andi	a4,a5,255
    80002de8:	00900693          	li	a3,9
    80002dec:	04d70c63          	beq	a4,a3,80002e44 <devintr+0x84>
    80002df0:	fff00713          	li	a4,-1
    80002df4:	03f71713          	slli	a4,a4,0x3f
    80002df8:	00170713          	addi	a4,a4,1
    80002dfc:	00e78c63          	beq	a5,a4,80002e14 <devintr+0x54>
    80002e00:	01813083          	ld	ra,24(sp)
    80002e04:	01013403          	ld	s0,16(sp)
    80002e08:	00813483          	ld	s1,8(sp)
    80002e0c:	02010113          	addi	sp,sp,32
    80002e10:	00008067          	ret
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	c8c080e7          	jalr	-884(ra) # 80002aa0 <cpuid>
    80002e1c:	06050663          	beqz	a0,80002e88 <devintr+0xc8>
    80002e20:	144027f3          	csrr	a5,sip
    80002e24:	ffd7f793          	andi	a5,a5,-3
    80002e28:	14479073          	csrw	sip,a5
    80002e2c:	01813083          	ld	ra,24(sp)
    80002e30:	01013403          	ld	s0,16(sp)
    80002e34:	00813483          	ld	s1,8(sp)
    80002e38:	00200513          	li	a0,2
    80002e3c:	02010113          	addi	sp,sp,32
    80002e40:	00008067          	ret
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	250080e7          	jalr	592(ra) # 80003094 <plic_claim>
    80002e4c:	00a00793          	li	a5,10
    80002e50:	00050493          	mv	s1,a0
    80002e54:	06f50663          	beq	a0,a5,80002ec0 <devintr+0x100>
    80002e58:	00100513          	li	a0,1
    80002e5c:	fa0482e3          	beqz	s1,80002e00 <devintr+0x40>
    80002e60:	00048593          	mv	a1,s1
    80002e64:	00002517          	auipc	a0,0x2
    80002e68:	48450513          	addi	a0,a0,1156 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80002e6c:	00000097          	auipc	ra,0x0
    80002e70:	66c080e7          	jalr	1644(ra) # 800034d8 <__printf>
    80002e74:	00048513          	mv	a0,s1
    80002e78:	00000097          	auipc	ra,0x0
    80002e7c:	254080e7          	jalr	596(ra) # 800030cc <plic_complete>
    80002e80:	00100513          	li	a0,1
    80002e84:	f7dff06f          	j	80002e00 <devintr+0x40>
    80002e88:	00004517          	auipc	a0,0x4
    80002e8c:	f1850513          	addi	a0,a0,-232 # 80006da0 <tickslock>
    80002e90:	00001097          	auipc	ra,0x1
    80002e94:	31c080e7          	jalr	796(ra) # 800041ac <acquire>
    80002e98:	00003717          	auipc	a4,0x3
    80002e9c:	e1c70713          	addi	a4,a4,-484 # 80005cb4 <ticks>
    80002ea0:	00072783          	lw	a5,0(a4)
    80002ea4:	00004517          	auipc	a0,0x4
    80002ea8:	efc50513          	addi	a0,a0,-260 # 80006da0 <tickslock>
    80002eac:	0017879b          	addiw	a5,a5,1
    80002eb0:	00f72023          	sw	a5,0(a4)
    80002eb4:	00001097          	auipc	ra,0x1
    80002eb8:	3c4080e7          	jalr	964(ra) # 80004278 <release>
    80002ebc:	f65ff06f          	j	80002e20 <devintr+0x60>
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	f20080e7          	jalr	-224(ra) # 80003de0 <uartintr>
    80002ec8:	fadff06f          	j	80002e74 <devintr+0xb4>
    80002ecc:	0000                	unimp
	...

0000000080002ed0 <kernelvec>:
    80002ed0:	f0010113          	addi	sp,sp,-256
    80002ed4:	00113023          	sd	ra,0(sp)
    80002ed8:	00213423          	sd	sp,8(sp)
    80002edc:	00313823          	sd	gp,16(sp)
    80002ee0:	00413c23          	sd	tp,24(sp)
    80002ee4:	02513023          	sd	t0,32(sp)
    80002ee8:	02613423          	sd	t1,40(sp)
    80002eec:	02713823          	sd	t2,48(sp)
    80002ef0:	02813c23          	sd	s0,56(sp)
    80002ef4:	04913023          	sd	s1,64(sp)
    80002ef8:	04a13423          	sd	a0,72(sp)
    80002efc:	04b13823          	sd	a1,80(sp)
    80002f00:	04c13c23          	sd	a2,88(sp)
    80002f04:	06d13023          	sd	a3,96(sp)
    80002f08:	06e13423          	sd	a4,104(sp)
    80002f0c:	06f13823          	sd	a5,112(sp)
    80002f10:	07013c23          	sd	a6,120(sp)
    80002f14:	09113023          	sd	a7,128(sp)
    80002f18:	09213423          	sd	s2,136(sp)
    80002f1c:	09313823          	sd	s3,144(sp)
    80002f20:	09413c23          	sd	s4,152(sp)
    80002f24:	0b513023          	sd	s5,160(sp)
    80002f28:	0b613423          	sd	s6,168(sp)
    80002f2c:	0b713823          	sd	s7,176(sp)
    80002f30:	0b813c23          	sd	s8,184(sp)
    80002f34:	0d913023          	sd	s9,192(sp)
    80002f38:	0da13423          	sd	s10,200(sp)
    80002f3c:	0db13823          	sd	s11,208(sp)
    80002f40:	0dc13c23          	sd	t3,216(sp)
    80002f44:	0fd13023          	sd	t4,224(sp)
    80002f48:	0fe13423          	sd	t5,232(sp)
    80002f4c:	0ff13823          	sd	t6,240(sp)
    80002f50:	cd1ff0ef          	jal	ra,80002c20 <kerneltrap>
    80002f54:	00013083          	ld	ra,0(sp)
    80002f58:	00813103          	ld	sp,8(sp)
    80002f5c:	01013183          	ld	gp,16(sp)
    80002f60:	02013283          	ld	t0,32(sp)
    80002f64:	02813303          	ld	t1,40(sp)
    80002f68:	03013383          	ld	t2,48(sp)
    80002f6c:	03813403          	ld	s0,56(sp)
    80002f70:	04013483          	ld	s1,64(sp)
    80002f74:	04813503          	ld	a0,72(sp)
    80002f78:	05013583          	ld	a1,80(sp)
    80002f7c:	05813603          	ld	a2,88(sp)
    80002f80:	06013683          	ld	a3,96(sp)
    80002f84:	06813703          	ld	a4,104(sp)
    80002f88:	07013783          	ld	a5,112(sp)
    80002f8c:	07813803          	ld	a6,120(sp)
    80002f90:	08013883          	ld	a7,128(sp)
    80002f94:	08813903          	ld	s2,136(sp)
    80002f98:	09013983          	ld	s3,144(sp)
    80002f9c:	09813a03          	ld	s4,152(sp)
    80002fa0:	0a013a83          	ld	s5,160(sp)
    80002fa4:	0a813b03          	ld	s6,168(sp)
    80002fa8:	0b013b83          	ld	s7,176(sp)
    80002fac:	0b813c03          	ld	s8,184(sp)
    80002fb0:	0c013c83          	ld	s9,192(sp)
    80002fb4:	0c813d03          	ld	s10,200(sp)
    80002fb8:	0d013d83          	ld	s11,208(sp)
    80002fbc:	0d813e03          	ld	t3,216(sp)
    80002fc0:	0e013e83          	ld	t4,224(sp)
    80002fc4:	0e813f03          	ld	t5,232(sp)
    80002fc8:	0f013f83          	ld	t6,240(sp)
    80002fcc:	10010113          	addi	sp,sp,256
    80002fd0:	10200073          	sret
    80002fd4:	00000013          	nop
    80002fd8:	00000013          	nop
    80002fdc:	00000013          	nop

0000000080002fe0 <timervec>:
    80002fe0:	34051573          	csrrw	a0,mscratch,a0
    80002fe4:	00b53023          	sd	a1,0(a0)
    80002fe8:	00c53423          	sd	a2,8(a0)
    80002fec:	00d53823          	sd	a3,16(a0)
    80002ff0:	01853583          	ld	a1,24(a0)
    80002ff4:	02053603          	ld	a2,32(a0)
    80002ff8:	0005b683          	ld	a3,0(a1)
    80002ffc:	00c686b3          	add	a3,a3,a2
    80003000:	00d5b023          	sd	a3,0(a1)
    80003004:	00200593          	li	a1,2
    80003008:	14459073          	csrw	sip,a1
    8000300c:	01053683          	ld	a3,16(a0)
    80003010:	00853603          	ld	a2,8(a0)
    80003014:	00053583          	ld	a1,0(a0)
    80003018:	34051573          	csrrw	a0,mscratch,a0
    8000301c:	30200073          	mret

0000000080003020 <plicinit>:
    80003020:	ff010113          	addi	sp,sp,-16
    80003024:	00813423          	sd	s0,8(sp)
    80003028:	01010413          	addi	s0,sp,16
    8000302c:	00813403          	ld	s0,8(sp)
    80003030:	0c0007b7          	lui	a5,0xc000
    80003034:	00100713          	li	a4,1
    80003038:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000303c:	00e7a223          	sw	a4,4(a5)
    80003040:	01010113          	addi	sp,sp,16
    80003044:	00008067          	ret

0000000080003048 <plicinithart>:
    80003048:	ff010113          	addi	sp,sp,-16
    8000304c:	00813023          	sd	s0,0(sp)
    80003050:	00113423          	sd	ra,8(sp)
    80003054:	01010413          	addi	s0,sp,16
    80003058:	00000097          	auipc	ra,0x0
    8000305c:	a48080e7          	jalr	-1464(ra) # 80002aa0 <cpuid>
    80003060:	0085171b          	slliw	a4,a0,0x8
    80003064:	0c0027b7          	lui	a5,0xc002
    80003068:	00e787b3          	add	a5,a5,a4
    8000306c:	40200713          	li	a4,1026
    80003070:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003074:	00813083          	ld	ra,8(sp)
    80003078:	00013403          	ld	s0,0(sp)
    8000307c:	00d5151b          	slliw	a0,a0,0xd
    80003080:	0c2017b7          	lui	a5,0xc201
    80003084:	00a78533          	add	a0,a5,a0
    80003088:	00052023          	sw	zero,0(a0)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret

0000000080003094 <plic_claim>:
    80003094:	ff010113          	addi	sp,sp,-16
    80003098:	00813023          	sd	s0,0(sp)
    8000309c:	00113423          	sd	ra,8(sp)
    800030a0:	01010413          	addi	s0,sp,16
    800030a4:	00000097          	auipc	ra,0x0
    800030a8:	9fc080e7          	jalr	-1540(ra) # 80002aa0 <cpuid>
    800030ac:	00813083          	ld	ra,8(sp)
    800030b0:	00013403          	ld	s0,0(sp)
    800030b4:	00d5151b          	slliw	a0,a0,0xd
    800030b8:	0c2017b7          	lui	a5,0xc201
    800030bc:	00a78533          	add	a0,a5,a0
    800030c0:	00452503          	lw	a0,4(a0)
    800030c4:	01010113          	addi	sp,sp,16
    800030c8:	00008067          	ret

00000000800030cc <plic_complete>:
    800030cc:	fe010113          	addi	sp,sp,-32
    800030d0:	00813823          	sd	s0,16(sp)
    800030d4:	00913423          	sd	s1,8(sp)
    800030d8:	00113c23          	sd	ra,24(sp)
    800030dc:	02010413          	addi	s0,sp,32
    800030e0:	00050493          	mv	s1,a0
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	9bc080e7          	jalr	-1604(ra) # 80002aa0 <cpuid>
    800030ec:	01813083          	ld	ra,24(sp)
    800030f0:	01013403          	ld	s0,16(sp)
    800030f4:	00d5179b          	slliw	a5,a0,0xd
    800030f8:	0c201737          	lui	a4,0xc201
    800030fc:	00f707b3          	add	a5,a4,a5
    80003100:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003104:	00813483          	ld	s1,8(sp)
    80003108:	02010113          	addi	sp,sp,32
    8000310c:	00008067          	ret

0000000080003110 <consolewrite>:
    80003110:	fb010113          	addi	sp,sp,-80
    80003114:	04813023          	sd	s0,64(sp)
    80003118:	04113423          	sd	ra,72(sp)
    8000311c:	02913c23          	sd	s1,56(sp)
    80003120:	03213823          	sd	s2,48(sp)
    80003124:	03313423          	sd	s3,40(sp)
    80003128:	03413023          	sd	s4,32(sp)
    8000312c:	01513c23          	sd	s5,24(sp)
    80003130:	05010413          	addi	s0,sp,80
    80003134:	06c05c63          	blez	a2,800031ac <consolewrite+0x9c>
    80003138:	00060993          	mv	s3,a2
    8000313c:	00050a13          	mv	s4,a0
    80003140:	00058493          	mv	s1,a1
    80003144:	00000913          	li	s2,0
    80003148:	fff00a93          	li	s5,-1
    8000314c:	01c0006f          	j	80003168 <consolewrite+0x58>
    80003150:	fbf44503          	lbu	a0,-65(s0)
    80003154:	0019091b          	addiw	s2,s2,1
    80003158:	00148493          	addi	s1,s1,1
    8000315c:	00001097          	auipc	ra,0x1
    80003160:	a9c080e7          	jalr	-1380(ra) # 80003bf8 <uartputc>
    80003164:	03298063          	beq	s3,s2,80003184 <consolewrite+0x74>
    80003168:	00048613          	mv	a2,s1
    8000316c:	00100693          	li	a3,1
    80003170:	000a0593          	mv	a1,s4
    80003174:	fbf40513          	addi	a0,s0,-65
    80003178:	00000097          	auipc	ra,0x0
    8000317c:	9e0080e7          	jalr	-1568(ra) # 80002b58 <either_copyin>
    80003180:	fd5518e3          	bne	a0,s5,80003150 <consolewrite+0x40>
    80003184:	04813083          	ld	ra,72(sp)
    80003188:	04013403          	ld	s0,64(sp)
    8000318c:	03813483          	ld	s1,56(sp)
    80003190:	02813983          	ld	s3,40(sp)
    80003194:	02013a03          	ld	s4,32(sp)
    80003198:	01813a83          	ld	s5,24(sp)
    8000319c:	00090513          	mv	a0,s2
    800031a0:	03013903          	ld	s2,48(sp)
    800031a4:	05010113          	addi	sp,sp,80
    800031a8:	00008067          	ret
    800031ac:	00000913          	li	s2,0
    800031b0:	fd5ff06f          	j	80003184 <consolewrite+0x74>

00000000800031b4 <consoleread>:
    800031b4:	f9010113          	addi	sp,sp,-112
    800031b8:	06813023          	sd	s0,96(sp)
    800031bc:	04913c23          	sd	s1,88(sp)
    800031c0:	05213823          	sd	s2,80(sp)
    800031c4:	05313423          	sd	s3,72(sp)
    800031c8:	05413023          	sd	s4,64(sp)
    800031cc:	03513c23          	sd	s5,56(sp)
    800031d0:	03613823          	sd	s6,48(sp)
    800031d4:	03713423          	sd	s7,40(sp)
    800031d8:	03813023          	sd	s8,32(sp)
    800031dc:	06113423          	sd	ra,104(sp)
    800031e0:	01913c23          	sd	s9,24(sp)
    800031e4:	07010413          	addi	s0,sp,112
    800031e8:	00060b93          	mv	s7,a2
    800031ec:	00050913          	mv	s2,a0
    800031f0:	00058c13          	mv	s8,a1
    800031f4:	00060b1b          	sext.w	s6,a2
    800031f8:	00004497          	auipc	s1,0x4
    800031fc:	bd048493          	addi	s1,s1,-1072 # 80006dc8 <cons>
    80003200:	00400993          	li	s3,4
    80003204:	fff00a13          	li	s4,-1
    80003208:	00a00a93          	li	s5,10
    8000320c:	05705e63          	blez	s7,80003268 <consoleread+0xb4>
    80003210:	09c4a703          	lw	a4,156(s1)
    80003214:	0984a783          	lw	a5,152(s1)
    80003218:	0007071b          	sext.w	a4,a4
    8000321c:	08e78463          	beq	a5,a4,800032a4 <consoleread+0xf0>
    80003220:	07f7f713          	andi	a4,a5,127
    80003224:	00e48733          	add	a4,s1,a4
    80003228:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000322c:	0017869b          	addiw	a3,a5,1
    80003230:	08d4ac23          	sw	a3,152(s1)
    80003234:	00070c9b          	sext.w	s9,a4
    80003238:	0b370663          	beq	a4,s3,800032e4 <consoleread+0x130>
    8000323c:	00100693          	li	a3,1
    80003240:	f9f40613          	addi	a2,s0,-97
    80003244:	000c0593          	mv	a1,s8
    80003248:	00090513          	mv	a0,s2
    8000324c:	f8e40fa3          	sb	a4,-97(s0)
    80003250:	00000097          	auipc	ra,0x0
    80003254:	8bc080e7          	jalr	-1860(ra) # 80002b0c <either_copyout>
    80003258:	01450863          	beq	a0,s4,80003268 <consoleread+0xb4>
    8000325c:	001c0c13          	addi	s8,s8,1
    80003260:	fffb8b9b          	addiw	s7,s7,-1
    80003264:	fb5c94e3          	bne	s9,s5,8000320c <consoleread+0x58>
    80003268:	000b851b          	sext.w	a0,s7
    8000326c:	06813083          	ld	ra,104(sp)
    80003270:	06013403          	ld	s0,96(sp)
    80003274:	05813483          	ld	s1,88(sp)
    80003278:	05013903          	ld	s2,80(sp)
    8000327c:	04813983          	ld	s3,72(sp)
    80003280:	04013a03          	ld	s4,64(sp)
    80003284:	03813a83          	ld	s5,56(sp)
    80003288:	02813b83          	ld	s7,40(sp)
    8000328c:	02013c03          	ld	s8,32(sp)
    80003290:	01813c83          	ld	s9,24(sp)
    80003294:	40ab053b          	subw	a0,s6,a0
    80003298:	03013b03          	ld	s6,48(sp)
    8000329c:	07010113          	addi	sp,sp,112
    800032a0:	00008067          	ret
    800032a4:	00001097          	auipc	ra,0x1
    800032a8:	1d8080e7          	jalr	472(ra) # 8000447c <push_on>
    800032ac:	0984a703          	lw	a4,152(s1)
    800032b0:	09c4a783          	lw	a5,156(s1)
    800032b4:	0007879b          	sext.w	a5,a5
    800032b8:	fef70ce3          	beq	a4,a5,800032b0 <consoleread+0xfc>
    800032bc:	00001097          	auipc	ra,0x1
    800032c0:	234080e7          	jalr	564(ra) # 800044f0 <pop_on>
    800032c4:	0984a783          	lw	a5,152(s1)
    800032c8:	07f7f713          	andi	a4,a5,127
    800032cc:	00e48733          	add	a4,s1,a4
    800032d0:	01874703          	lbu	a4,24(a4)
    800032d4:	0017869b          	addiw	a3,a5,1
    800032d8:	08d4ac23          	sw	a3,152(s1)
    800032dc:	00070c9b          	sext.w	s9,a4
    800032e0:	f5371ee3          	bne	a4,s3,8000323c <consoleread+0x88>
    800032e4:	000b851b          	sext.w	a0,s7
    800032e8:	f96bf2e3          	bgeu	s7,s6,8000326c <consoleread+0xb8>
    800032ec:	08f4ac23          	sw	a5,152(s1)
    800032f0:	f7dff06f          	j	8000326c <consoleread+0xb8>

00000000800032f4 <consputc>:
    800032f4:	10000793          	li	a5,256
    800032f8:	00f50663          	beq	a0,a5,80003304 <consputc+0x10>
    800032fc:	00001317          	auipc	t1,0x1
    80003300:	9f430067          	jr	-1548(t1) # 80003cf0 <uartputc_sync>
    80003304:	ff010113          	addi	sp,sp,-16
    80003308:	00113423          	sd	ra,8(sp)
    8000330c:	00813023          	sd	s0,0(sp)
    80003310:	01010413          	addi	s0,sp,16
    80003314:	00800513          	li	a0,8
    80003318:	00001097          	auipc	ra,0x1
    8000331c:	9d8080e7          	jalr	-1576(ra) # 80003cf0 <uartputc_sync>
    80003320:	02000513          	li	a0,32
    80003324:	00001097          	auipc	ra,0x1
    80003328:	9cc080e7          	jalr	-1588(ra) # 80003cf0 <uartputc_sync>
    8000332c:	00013403          	ld	s0,0(sp)
    80003330:	00813083          	ld	ra,8(sp)
    80003334:	00800513          	li	a0,8
    80003338:	01010113          	addi	sp,sp,16
    8000333c:	00001317          	auipc	t1,0x1
    80003340:	9b430067          	jr	-1612(t1) # 80003cf0 <uartputc_sync>

0000000080003344 <consoleintr>:
    80003344:	fe010113          	addi	sp,sp,-32
    80003348:	00813823          	sd	s0,16(sp)
    8000334c:	00913423          	sd	s1,8(sp)
    80003350:	01213023          	sd	s2,0(sp)
    80003354:	00113c23          	sd	ra,24(sp)
    80003358:	02010413          	addi	s0,sp,32
    8000335c:	00004917          	auipc	s2,0x4
    80003360:	a6c90913          	addi	s2,s2,-1428 # 80006dc8 <cons>
    80003364:	00050493          	mv	s1,a0
    80003368:	00090513          	mv	a0,s2
    8000336c:	00001097          	auipc	ra,0x1
    80003370:	e40080e7          	jalr	-448(ra) # 800041ac <acquire>
    80003374:	02048c63          	beqz	s1,800033ac <consoleintr+0x68>
    80003378:	0a092783          	lw	a5,160(s2)
    8000337c:	09892703          	lw	a4,152(s2)
    80003380:	07f00693          	li	a3,127
    80003384:	40e7873b          	subw	a4,a5,a4
    80003388:	02e6e263          	bltu	a3,a4,800033ac <consoleintr+0x68>
    8000338c:	00d00713          	li	a4,13
    80003390:	04e48063          	beq	s1,a4,800033d0 <consoleintr+0x8c>
    80003394:	07f7f713          	andi	a4,a5,127
    80003398:	00e90733          	add	a4,s2,a4
    8000339c:	0017879b          	addiw	a5,a5,1
    800033a0:	0af92023          	sw	a5,160(s2)
    800033a4:	00970c23          	sb	s1,24(a4)
    800033a8:	08f92e23          	sw	a5,156(s2)
    800033ac:	01013403          	ld	s0,16(sp)
    800033b0:	01813083          	ld	ra,24(sp)
    800033b4:	00813483          	ld	s1,8(sp)
    800033b8:	00013903          	ld	s2,0(sp)
    800033bc:	00004517          	auipc	a0,0x4
    800033c0:	a0c50513          	addi	a0,a0,-1524 # 80006dc8 <cons>
    800033c4:	02010113          	addi	sp,sp,32
    800033c8:	00001317          	auipc	t1,0x1
    800033cc:	eb030067          	jr	-336(t1) # 80004278 <release>
    800033d0:	00a00493          	li	s1,10
    800033d4:	fc1ff06f          	j	80003394 <consoleintr+0x50>

00000000800033d8 <consoleinit>:
    800033d8:	fe010113          	addi	sp,sp,-32
    800033dc:	00113c23          	sd	ra,24(sp)
    800033e0:	00813823          	sd	s0,16(sp)
    800033e4:	00913423          	sd	s1,8(sp)
    800033e8:	02010413          	addi	s0,sp,32
    800033ec:	00004497          	auipc	s1,0x4
    800033f0:	9dc48493          	addi	s1,s1,-1572 # 80006dc8 <cons>
    800033f4:	00048513          	mv	a0,s1
    800033f8:	00002597          	auipc	a1,0x2
    800033fc:	f4858593          	addi	a1,a1,-184 # 80005340 <CONSOLE_STATUS+0x330>
    80003400:	00001097          	auipc	ra,0x1
    80003404:	d88080e7          	jalr	-632(ra) # 80004188 <initlock>
    80003408:	00000097          	auipc	ra,0x0
    8000340c:	7ac080e7          	jalr	1964(ra) # 80003bb4 <uartinit>
    80003410:	01813083          	ld	ra,24(sp)
    80003414:	01013403          	ld	s0,16(sp)
    80003418:	00000797          	auipc	a5,0x0
    8000341c:	d9c78793          	addi	a5,a5,-612 # 800031b4 <consoleread>
    80003420:	0af4bc23          	sd	a5,184(s1)
    80003424:	00000797          	auipc	a5,0x0
    80003428:	cec78793          	addi	a5,a5,-788 # 80003110 <consolewrite>
    8000342c:	0cf4b023          	sd	a5,192(s1)
    80003430:	00813483          	ld	s1,8(sp)
    80003434:	02010113          	addi	sp,sp,32
    80003438:	00008067          	ret

000000008000343c <console_read>:
    8000343c:	ff010113          	addi	sp,sp,-16
    80003440:	00813423          	sd	s0,8(sp)
    80003444:	01010413          	addi	s0,sp,16
    80003448:	00813403          	ld	s0,8(sp)
    8000344c:	00004317          	auipc	t1,0x4
    80003450:	a3433303          	ld	t1,-1484(t1) # 80006e80 <devsw+0x10>
    80003454:	01010113          	addi	sp,sp,16
    80003458:	00030067          	jr	t1

000000008000345c <console_write>:
    8000345c:	ff010113          	addi	sp,sp,-16
    80003460:	00813423          	sd	s0,8(sp)
    80003464:	01010413          	addi	s0,sp,16
    80003468:	00813403          	ld	s0,8(sp)
    8000346c:	00004317          	auipc	t1,0x4
    80003470:	a1c33303          	ld	t1,-1508(t1) # 80006e88 <devsw+0x18>
    80003474:	01010113          	addi	sp,sp,16
    80003478:	00030067          	jr	t1

000000008000347c <panic>:
    8000347c:	fe010113          	addi	sp,sp,-32
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00913423          	sd	s1,8(sp)
    8000348c:	02010413          	addi	s0,sp,32
    80003490:	00050493          	mv	s1,a0
    80003494:	00002517          	auipc	a0,0x2
    80003498:	eb450513          	addi	a0,a0,-332 # 80005348 <CONSOLE_STATUS+0x338>
    8000349c:	00004797          	auipc	a5,0x4
    800034a0:	a807a623          	sw	zero,-1396(a5) # 80006f28 <pr+0x18>
    800034a4:	00000097          	auipc	ra,0x0
    800034a8:	034080e7          	jalr	52(ra) # 800034d8 <__printf>
    800034ac:	00048513          	mv	a0,s1
    800034b0:	00000097          	auipc	ra,0x0
    800034b4:	028080e7          	jalr	40(ra) # 800034d8 <__printf>
    800034b8:	00002517          	auipc	a0,0x2
    800034bc:	e7050513          	addi	a0,a0,-400 # 80005328 <CONSOLE_STATUS+0x318>
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	018080e7          	jalr	24(ra) # 800034d8 <__printf>
    800034c8:	00100793          	li	a5,1
    800034cc:	00002717          	auipc	a4,0x2
    800034d0:	7ef72623          	sw	a5,2028(a4) # 80005cb8 <panicked>
    800034d4:	0000006f          	j	800034d4 <panic+0x58>

00000000800034d8 <__printf>:
    800034d8:	f3010113          	addi	sp,sp,-208
    800034dc:	08813023          	sd	s0,128(sp)
    800034e0:	07313423          	sd	s3,104(sp)
    800034e4:	09010413          	addi	s0,sp,144
    800034e8:	05813023          	sd	s8,64(sp)
    800034ec:	08113423          	sd	ra,136(sp)
    800034f0:	06913c23          	sd	s1,120(sp)
    800034f4:	07213823          	sd	s2,112(sp)
    800034f8:	07413023          	sd	s4,96(sp)
    800034fc:	05513c23          	sd	s5,88(sp)
    80003500:	05613823          	sd	s6,80(sp)
    80003504:	05713423          	sd	s7,72(sp)
    80003508:	03913c23          	sd	s9,56(sp)
    8000350c:	03a13823          	sd	s10,48(sp)
    80003510:	03b13423          	sd	s11,40(sp)
    80003514:	00004317          	auipc	t1,0x4
    80003518:	9fc30313          	addi	t1,t1,-1540 # 80006f10 <pr>
    8000351c:	01832c03          	lw	s8,24(t1)
    80003520:	00b43423          	sd	a1,8(s0)
    80003524:	00c43823          	sd	a2,16(s0)
    80003528:	00d43c23          	sd	a3,24(s0)
    8000352c:	02e43023          	sd	a4,32(s0)
    80003530:	02f43423          	sd	a5,40(s0)
    80003534:	03043823          	sd	a6,48(s0)
    80003538:	03143c23          	sd	a7,56(s0)
    8000353c:	00050993          	mv	s3,a0
    80003540:	4a0c1663          	bnez	s8,800039ec <__printf+0x514>
    80003544:	60098c63          	beqz	s3,80003b5c <__printf+0x684>
    80003548:	0009c503          	lbu	a0,0(s3)
    8000354c:	00840793          	addi	a5,s0,8
    80003550:	f6f43c23          	sd	a5,-136(s0)
    80003554:	00000493          	li	s1,0
    80003558:	22050063          	beqz	a0,80003778 <__printf+0x2a0>
    8000355c:	00002a37          	lui	s4,0x2
    80003560:	00018ab7          	lui	s5,0x18
    80003564:	000f4b37          	lui	s6,0xf4
    80003568:	00989bb7          	lui	s7,0x989
    8000356c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003570:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003574:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003578:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000357c:	00148c9b          	addiw	s9,s1,1
    80003580:	02500793          	li	a5,37
    80003584:	01998933          	add	s2,s3,s9
    80003588:	38f51263          	bne	a0,a5,8000390c <__printf+0x434>
    8000358c:	00094783          	lbu	a5,0(s2)
    80003590:	00078c9b          	sext.w	s9,a5
    80003594:	1e078263          	beqz	a5,80003778 <__printf+0x2a0>
    80003598:	0024849b          	addiw	s1,s1,2
    8000359c:	07000713          	li	a4,112
    800035a0:	00998933          	add	s2,s3,s1
    800035a4:	38e78a63          	beq	a5,a4,80003938 <__printf+0x460>
    800035a8:	20f76863          	bltu	a4,a5,800037b8 <__printf+0x2e0>
    800035ac:	42a78863          	beq	a5,a0,800039dc <__printf+0x504>
    800035b0:	06400713          	li	a4,100
    800035b4:	40e79663          	bne	a5,a4,800039c0 <__printf+0x4e8>
    800035b8:	f7843783          	ld	a5,-136(s0)
    800035bc:	0007a603          	lw	a2,0(a5)
    800035c0:	00878793          	addi	a5,a5,8
    800035c4:	f6f43c23          	sd	a5,-136(s0)
    800035c8:	42064a63          	bltz	a2,800039fc <__printf+0x524>
    800035cc:	00a00713          	li	a4,10
    800035d0:	02e677bb          	remuw	a5,a2,a4
    800035d4:	00002d97          	auipc	s11,0x2
    800035d8:	d9cd8d93          	addi	s11,s11,-612 # 80005370 <digits>
    800035dc:	00900593          	li	a1,9
    800035e0:	0006051b          	sext.w	a0,a2
    800035e4:	00000c93          	li	s9,0
    800035e8:	02079793          	slli	a5,a5,0x20
    800035ec:	0207d793          	srli	a5,a5,0x20
    800035f0:	00fd87b3          	add	a5,s11,a5
    800035f4:	0007c783          	lbu	a5,0(a5)
    800035f8:	02e656bb          	divuw	a3,a2,a4
    800035fc:	f8f40023          	sb	a5,-128(s0)
    80003600:	14c5d863          	bge	a1,a2,80003750 <__printf+0x278>
    80003604:	06300593          	li	a1,99
    80003608:	00100c93          	li	s9,1
    8000360c:	02e6f7bb          	remuw	a5,a3,a4
    80003610:	02079793          	slli	a5,a5,0x20
    80003614:	0207d793          	srli	a5,a5,0x20
    80003618:	00fd87b3          	add	a5,s11,a5
    8000361c:	0007c783          	lbu	a5,0(a5)
    80003620:	02e6d73b          	divuw	a4,a3,a4
    80003624:	f8f400a3          	sb	a5,-127(s0)
    80003628:	12a5f463          	bgeu	a1,a0,80003750 <__printf+0x278>
    8000362c:	00a00693          	li	a3,10
    80003630:	00900593          	li	a1,9
    80003634:	02d777bb          	remuw	a5,a4,a3
    80003638:	02079793          	slli	a5,a5,0x20
    8000363c:	0207d793          	srli	a5,a5,0x20
    80003640:	00fd87b3          	add	a5,s11,a5
    80003644:	0007c503          	lbu	a0,0(a5)
    80003648:	02d757bb          	divuw	a5,a4,a3
    8000364c:	f8a40123          	sb	a0,-126(s0)
    80003650:	48e5f263          	bgeu	a1,a4,80003ad4 <__printf+0x5fc>
    80003654:	06300513          	li	a0,99
    80003658:	02d7f5bb          	remuw	a1,a5,a3
    8000365c:	02059593          	slli	a1,a1,0x20
    80003660:	0205d593          	srli	a1,a1,0x20
    80003664:	00bd85b3          	add	a1,s11,a1
    80003668:	0005c583          	lbu	a1,0(a1)
    8000366c:	02d7d7bb          	divuw	a5,a5,a3
    80003670:	f8b401a3          	sb	a1,-125(s0)
    80003674:	48e57263          	bgeu	a0,a4,80003af8 <__printf+0x620>
    80003678:	3e700513          	li	a0,999
    8000367c:	02d7f5bb          	remuw	a1,a5,a3
    80003680:	02059593          	slli	a1,a1,0x20
    80003684:	0205d593          	srli	a1,a1,0x20
    80003688:	00bd85b3          	add	a1,s11,a1
    8000368c:	0005c583          	lbu	a1,0(a1)
    80003690:	02d7d7bb          	divuw	a5,a5,a3
    80003694:	f8b40223          	sb	a1,-124(s0)
    80003698:	46e57663          	bgeu	a0,a4,80003b04 <__printf+0x62c>
    8000369c:	02d7f5bb          	remuw	a1,a5,a3
    800036a0:	02059593          	slli	a1,a1,0x20
    800036a4:	0205d593          	srli	a1,a1,0x20
    800036a8:	00bd85b3          	add	a1,s11,a1
    800036ac:	0005c583          	lbu	a1,0(a1)
    800036b0:	02d7d7bb          	divuw	a5,a5,a3
    800036b4:	f8b402a3          	sb	a1,-123(s0)
    800036b8:	46ea7863          	bgeu	s4,a4,80003b28 <__printf+0x650>
    800036bc:	02d7f5bb          	remuw	a1,a5,a3
    800036c0:	02059593          	slli	a1,a1,0x20
    800036c4:	0205d593          	srli	a1,a1,0x20
    800036c8:	00bd85b3          	add	a1,s11,a1
    800036cc:	0005c583          	lbu	a1,0(a1)
    800036d0:	02d7d7bb          	divuw	a5,a5,a3
    800036d4:	f8b40323          	sb	a1,-122(s0)
    800036d8:	3eeaf863          	bgeu	s5,a4,80003ac8 <__printf+0x5f0>
    800036dc:	02d7f5bb          	remuw	a1,a5,a3
    800036e0:	02059593          	slli	a1,a1,0x20
    800036e4:	0205d593          	srli	a1,a1,0x20
    800036e8:	00bd85b3          	add	a1,s11,a1
    800036ec:	0005c583          	lbu	a1,0(a1)
    800036f0:	02d7d7bb          	divuw	a5,a5,a3
    800036f4:	f8b403a3          	sb	a1,-121(s0)
    800036f8:	42eb7e63          	bgeu	s6,a4,80003b34 <__printf+0x65c>
    800036fc:	02d7f5bb          	remuw	a1,a5,a3
    80003700:	02059593          	slli	a1,a1,0x20
    80003704:	0205d593          	srli	a1,a1,0x20
    80003708:	00bd85b3          	add	a1,s11,a1
    8000370c:	0005c583          	lbu	a1,0(a1)
    80003710:	02d7d7bb          	divuw	a5,a5,a3
    80003714:	f8b40423          	sb	a1,-120(s0)
    80003718:	42ebfc63          	bgeu	s7,a4,80003b50 <__printf+0x678>
    8000371c:	02079793          	slli	a5,a5,0x20
    80003720:	0207d793          	srli	a5,a5,0x20
    80003724:	00fd8db3          	add	s11,s11,a5
    80003728:	000dc703          	lbu	a4,0(s11)
    8000372c:	00a00793          	li	a5,10
    80003730:	00900c93          	li	s9,9
    80003734:	f8e404a3          	sb	a4,-119(s0)
    80003738:	00065c63          	bgez	a2,80003750 <__printf+0x278>
    8000373c:	f9040713          	addi	a4,s0,-112
    80003740:	00f70733          	add	a4,a4,a5
    80003744:	02d00693          	li	a3,45
    80003748:	fed70823          	sb	a3,-16(a4)
    8000374c:	00078c93          	mv	s9,a5
    80003750:	f8040793          	addi	a5,s0,-128
    80003754:	01978cb3          	add	s9,a5,s9
    80003758:	f7f40d13          	addi	s10,s0,-129
    8000375c:	000cc503          	lbu	a0,0(s9)
    80003760:	fffc8c93          	addi	s9,s9,-1
    80003764:	00000097          	auipc	ra,0x0
    80003768:	b90080e7          	jalr	-1136(ra) # 800032f4 <consputc>
    8000376c:	ffac98e3          	bne	s9,s10,8000375c <__printf+0x284>
    80003770:	00094503          	lbu	a0,0(s2)
    80003774:	e00514e3          	bnez	a0,8000357c <__printf+0xa4>
    80003778:	1a0c1663          	bnez	s8,80003924 <__printf+0x44c>
    8000377c:	08813083          	ld	ra,136(sp)
    80003780:	08013403          	ld	s0,128(sp)
    80003784:	07813483          	ld	s1,120(sp)
    80003788:	07013903          	ld	s2,112(sp)
    8000378c:	06813983          	ld	s3,104(sp)
    80003790:	06013a03          	ld	s4,96(sp)
    80003794:	05813a83          	ld	s5,88(sp)
    80003798:	05013b03          	ld	s6,80(sp)
    8000379c:	04813b83          	ld	s7,72(sp)
    800037a0:	04013c03          	ld	s8,64(sp)
    800037a4:	03813c83          	ld	s9,56(sp)
    800037a8:	03013d03          	ld	s10,48(sp)
    800037ac:	02813d83          	ld	s11,40(sp)
    800037b0:	0d010113          	addi	sp,sp,208
    800037b4:	00008067          	ret
    800037b8:	07300713          	li	a4,115
    800037bc:	1ce78a63          	beq	a5,a4,80003990 <__printf+0x4b8>
    800037c0:	07800713          	li	a4,120
    800037c4:	1ee79e63          	bne	a5,a4,800039c0 <__printf+0x4e8>
    800037c8:	f7843783          	ld	a5,-136(s0)
    800037cc:	0007a703          	lw	a4,0(a5)
    800037d0:	00878793          	addi	a5,a5,8
    800037d4:	f6f43c23          	sd	a5,-136(s0)
    800037d8:	28074263          	bltz	a4,80003a5c <__printf+0x584>
    800037dc:	00002d97          	auipc	s11,0x2
    800037e0:	b94d8d93          	addi	s11,s11,-1132 # 80005370 <digits>
    800037e4:	00f77793          	andi	a5,a4,15
    800037e8:	00fd87b3          	add	a5,s11,a5
    800037ec:	0007c683          	lbu	a3,0(a5)
    800037f0:	00f00613          	li	a2,15
    800037f4:	0007079b          	sext.w	a5,a4
    800037f8:	f8d40023          	sb	a3,-128(s0)
    800037fc:	0047559b          	srliw	a1,a4,0x4
    80003800:	0047569b          	srliw	a3,a4,0x4
    80003804:	00000c93          	li	s9,0
    80003808:	0ee65063          	bge	a2,a4,800038e8 <__printf+0x410>
    8000380c:	00f6f693          	andi	a3,a3,15
    80003810:	00dd86b3          	add	a3,s11,a3
    80003814:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003818:	0087d79b          	srliw	a5,a5,0x8
    8000381c:	00100c93          	li	s9,1
    80003820:	f8d400a3          	sb	a3,-127(s0)
    80003824:	0cb67263          	bgeu	a2,a1,800038e8 <__printf+0x410>
    80003828:	00f7f693          	andi	a3,a5,15
    8000382c:	00dd86b3          	add	a3,s11,a3
    80003830:	0006c583          	lbu	a1,0(a3)
    80003834:	00f00613          	li	a2,15
    80003838:	0047d69b          	srliw	a3,a5,0x4
    8000383c:	f8b40123          	sb	a1,-126(s0)
    80003840:	0047d593          	srli	a1,a5,0x4
    80003844:	28f67e63          	bgeu	a2,a5,80003ae0 <__printf+0x608>
    80003848:	00f6f693          	andi	a3,a3,15
    8000384c:	00dd86b3          	add	a3,s11,a3
    80003850:	0006c503          	lbu	a0,0(a3)
    80003854:	0087d813          	srli	a6,a5,0x8
    80003858:	0087d69b          	srliw	a3,a5,0x8
    8000385c:	f8a401a3          	sb	a0,-125(s0)
    80003860:	28b67663          	bgeu	a2,a1,80003aec <__printf+0x614>
    80003864:	00f6f693          	andi	a3,a3,15
    80003868:	00dd86b3          	add	a3,s11,a3
    8000386c:	0006c583          	lbu	a1,0(a3)
    80003870:	00c7d513          	srli	a0,a5,0xc
    80003874:	00c7d69b          	srliw	a3,a5,0xc
    80003878:	f8b40223          	sb	a1,-124(s0)
    8000387c:	29067a63          	bgeu	a2,a6,80003b10 <__printf+0x638>
    80003880:	00f6f693          	andi	a3,a3,15
    80003884:	00dd86b3          	add	a3,s11,a3
    80003888:	0006c583          	lbu	a1,0(a3)
    8000388c:	0107d813          	srli	a6,a5,0x10
    80003890:	0107d69b          	srliw	a3,a5,0x10
    80003894:	f8b402a3          	sb	a1,-123(s0)
    80003898:	28a67263          	bgeu	a2,a0,80003b1c <__printf+0x644>
    8000389c:	00f6f693          	andi	a3,a3,15
    800038a0:	00dd86b3          	add	a3,s11,a3
    800038a4:	0006c683          	lbu	a3,0(a3)
    800038a8:	0147d79b          	srliw	a5,a5,0x14
    800038ac:	f8d40323          	sb	a3,-122(s0)
    800038b0:	21067663          	bgeu	a2,a6,80003abc <__printf+0x5e4>
    800038b4:	02079793          	slli	a5,a5,0x20
    800038b8:	0207d793          	srli	a5,a5,0x20
    800038bc:	00fd8db3          	add	s11,s11,a5
    800038c0:	000dc683          	lbu	a3,0(s11)
    800038c4:	00800793          	li	a5,8
    800038c8:	00700c93          	li	s9,7
    800038cc:	f8d403a3          	sb	a3,-121(s0)
    800038d0:	00075c63          	bgez	a4,800038e8 <__printf+0x410>
    800038d4:	f9040713          	addi	a4,s0,-112
    800038d8:	00f70733          	add	a4,a4,a5
    800038dc:	02d00693          	li	a3,45
    800038e0:	fed70823          	sb	a3,-16(a4)
    800038e4:	00078c93          	mv	s9,a5
    800038e8:	f8040793          	addi	a5,s0,-128
    800038ec:	01978cb3          	add	s9,a5,s9
    800038f0:	f7f40d13          	addi	s10,s0,-129
    800038f4:	000cc503          	lbu	a0,0(s9)
    800038f8:	fffc8c93          	addi	s9,s9,-1
    800038fc:	00000097          	auipc	ra,0x0
    80003900:	9f8080e7          	jalr	-1544(ra) # 800032f4 <consputc>
    80003904:	ff9d18e3          	bne	s10,s9,800038f4 <__printf+0x41c>
    80003908:	0100006f          	j	80003918 <__printf+0x440>
    8000390c:	00000097          	auipc	ra,0x0
    80003910:	9e8080e7          	jalr	-1560(ra) # 800032f4 <consputc>
    80003914:	000c8493          	mv	s1,s9
    80003918:	00094503          	lbu	a0,0(s2)
    8000391c:	c60510e3          	bnez	a0,8000357c <__printf+0xa4>
    80003920:	e40c0ee3          	beqz	s8,8000377c <__printf+0x2a4>
    80003924:	00003517          	auipc	a0,0x3
    80003928:	5ec50513          	addi	a0,a0,1516 # 80006f10 <pr>
    8000392c:	00001097          	auipc	ra,0x1
    80003930:	94c080e7          	jalr	-1716(ra) # 80004278 <release>
    80003934:	e49ff06f          	j	8000377c <__printf+0x2a4>
    80003938:	f7843783          	ld	a5,-136(s0)
    8000393c:	03000513          	li	a0,48
    80003940:	01000d13          	li	s10,16
    80003944:	00878713          	addi	a4,a5,8
    80003948:	0007bc83          	ld	s9,0(a5)
    8000394c:	f6e43c23          	sd	a4,-136(s0)
    80003950:	00000097          	auipc	ra,0x0
    80003954:	9a4080e7          	jalr	-1628(ra) # 800032f4 <consputc>
    80003958:	07800513          	li	a0,120
    8000395c:	00000097          	auipc	ra,0x0
    80003960:	998080e7          	jalr	-1640(ra) # 800032f4 <consputc>
    80003964:	00002d97          	auipc	s11,0x2
    80003968:	a0cd8d93          	addi	s11,s11,-1524 # 80005370 <digits>
    8000396c:	03ccd793          	srli	a5,s9,0x3c
    80003970:	00fd87b3          	add	a5,s11,a5
    80003974:	0007c503          	lbu	a0,0(a5)
    80003978:	fffd0d1b          	addiw	s10,s10,-1
    8000397c:	004c9c93          	slli	s9,s9,0x4
    80003980:	00000097          	auipc	ra,0x0
    80003984:	974080e7          	jalr	-1676(ra) # 800032f4 <consputc>
    80003988:	fe0d12e3          	bnez	s10,8000396c <__printf+0x494>
    8000398c:	f8dff06f          	j	80003918 <__printf+0x440>
    80003990:	f7843783          	ld	a5,-136(s0)
    80003994:	0007bc83          	ld	s9,0(a5)
    80003998:	00878793          	addi	a5,a5,8
    8000399c:	f6f43c23          	sd	a5,-136(s0)
    800039a0:	000c9a63          	bnez	s9,800039b4 <__printf+0x4dc>
    800039a4:	1080006f          	j	80003aac <__printf+0x5d4>
    800039a8:	001c8c93          	addi	s9,s9,1
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	948080e7          	jalr	-1720(ra) # 800032f4 <consputc>
    800039b4:	000cc503          	lbu	a0,0(s9)
    800039b8:	fe0518e3          	bnez	a0,800039a8 <__printf+0x4d0>
    800039bc:	f5dff06f          	j	80003918 <__printf+0x440>
    800039c0:	02500513          	li	a0,37
    800039c4:	00000097          	auipc	ra,0x0
    800039c8:	930080e7          	jalr	-1744(ra) # 800032f4 <consputc>
    800039cc:	000c8513          	mv	a0,s9
    800039d0:	00000097          	auipc	ra,0x0
    800039d4:	924080e7          	jalr	-1756(ra) # 800032f4 <consputc>
    800039d8:	f41ff06f          	j	80003918 <__printf+0x440>
    800039dc:	02500513          	li	a0,37
    800039e0:	00000097          	auipc	ra,0x0
    800039e4:	914080e7          	jalr	-1772(ra) # 800032f4 <consputc>
    800039e8:	f31ff06f          	j	80003918 <__printf+0x440>
    800039ec:	00030513          	mv	a0,t1
    800039f0:	00000097          	auipc	ra,0x0
    800039f4:	7bc080e7          	jalr	1980(ra) # 800041ac <acquire>
    800039f8:	b4dff06f          	j	80003544 <__printf+0x6c>
    800039fc:	40c0053b          	negw	a0,a2
    80003a00:	00a00713          	li	a4,10
    80003a04:	02e576bb          	remuw	a3,a0,a4
    80003a08:	00002d97          	auipc	s11,0x2
    80003a0c:	968d8d93          	addi	s11,s11,-1688 # 80005370 <digits>
    80003a10:	ff700593          	li	a1,-9
    80003a14:	02069693          	slli	a3,a3,0x20
    80003a18:	0206d693          	srli	a3,a3,0x20
    80003a1c:	00dd86b3          	add	a3,s11,a3
    80003a20:	0006c683          	lbu	a3,0(a3)
    80003a24:	02e557bb          	divuw	a5,a0,a4
    80003a28:	f8d40023          	sb	a3,-128(s0)
    80003a2c:	10b65e63          	bge	a2,a1,80003b48 <__printf+0x670>
    80003a30:	06300593          	li	a1,99
    80003a34:	02e7f6bb          	remuw	a3,a5,a4
    80003a38:	02069693          	slli	a3,a3,0x20
    80003a3c:	0206d693          	srli	a3,a3,0x20
    80003a40:	00dd86b3          	add	a3,s11,a3
    80003a44:	0006c683          	lbu	a3,0(a3)
    80003a48:	02e7d73b          	divuw	a4,a5,a4
    80003a4c:	00200793          	li	a5,2
    80003a50:	f8d400a3          	sb	a3,-127(s0)
    80003a54:	bca5ece3          	bltu	a1,a0,8000362c <__printf+0x154>
    80003a58:	ce5ff06f          	j	8000373c <__printf+0x264>
    80003a5c:	40e007bb          	negw	a5,a4
    80003a60:	00002d97          	auipc	s11,0x2
    80003a64:	910d8d93          	addi	s11,s11,-1776 # 80005370 <digits>
    80003a68:	00f7f693          	andi	a3,a5,15
    80003a6c:	00dd86b3          	add	a3,s11,a3
    80003a70:	0006c583          	lbu	a1,0(a3)
    80003a74:	ff100613          	li	a2,-15
    80003a78:	0047d69b          	srliw	a3,a5,0x4
    80003a7c:	f8b40023          	sb	a1,-128(s0)
    80003a80:	0047d59b          	srliw	a1,a5,0x4
    80003a84:	0ac75e63          	bge	a4,a2,80003b40 <__printf+0x668>
    80003a88:	00f6f693          	andi	a3,a3,15
    80003a8c:	00dd86b3          	add	a3,s11,a3
    80003a90:	0006c603          	lbu	a2,0(a3)
    80003a94:	00f00693          	li	a3,15
    80003a98:	0087d79b          	srliw	a5,a5,0x8
    80003a9c:	f8c400a3          	sb	a2,-127(s0)
    80003aa0:	d8b6e4e3          	bltu	a3,a1,80003828 <__printf+0x350>
    80003aa4:	00200793          	li	a5,2
    80003aa8:	e2dff06f          	j	800038d4 <__printf+0x3fc>
    80003aac:	00002c97          	auipc	s9,0x2
    80003ab0:	8a4c8c93          	addi	s9,s9,-1884 # 80005350 <CONSOLE_STATUS+0x340>
    80003ab4:	02800513          	li	a0,40
    80003ab8:	ef1ff06f          	j	800039a8 <__printf+0x4d0>
    80003abc:	00700793          	li	a5,7
    80003ac0:	00600c93          	li	s9,6
    80003ac4:	e0dff06f          	j	800038d0 <__printf+0x3f8>
    80003ac8:	00700793          	li	a5,7
    80003acc:	00600c93          	li	s9,6
    80003ad0:	c69ff06f          	j	80003738 <__printf+0x260>
    80003ad4:	00300793          	li	a5,3
    80003ad8:	00200c93          	li	s9,2
    80003adc:	c5dff06f          	j	80003738 <__printf+0x260>
    80003ae0:	00300793          	li	a5,3
    80003ae4:	00200c93          	li	s9,2
    80003ae8:	de9ff06f          	j	800038d0 <__printf+0x3f8>
    80003aec:	00400793          	li	a5,4
    80003af0:	00300c93          	li	s9,3
    80003af4:	dddff06f          	j	800038d0 <__printf+0x3f8>
    80003af8:	00400793          	li	a5,4
    80003afc:	00300c93          	li	s9,3
    80003b00:	c39ff06f          	j	80003738 <__printf+0x260>
    80003b04:	00500793          	li	a5,5
    80003b08:	00400c93          	li	s9,4
    80003b0c:	c2dff06f          	j	80003738 <__printf+0x260>
    80003b10:	00500793          	li	a5,5
    80003b14:	00400c93          	li	s9,4
    80003b18:	db9ff06f          	j	800038d0 <__printf+0x3f8>
    80003b1c:	00600793          	li	a5,6
    80003b20:	00500c93          	li	s9,5
    80003b24:	dadff06f          	j	800038d0 <__printf+0x3f8>
    80003b28:	00600793          	li	a5,6
    80003b2c:	00500c93          	li	s9,5
    80003b30:	c09ff06f          	j	80003738 <__printf+0x260>
    80003b34:	00800793          	li	a5,8
    80003b38:	00700c93          	li	s9,7
    80003b3c:	bfdff06f          	j	80003738 <__printf+0x260>
    80003b40:	00100793          	li	a5,1
    80003b44:	d91ff06f          	j	800038d4 <__printf+0x3fc>
    80003b48:	00100793          	li	a5,1
    80003b4c:	bf1ff06f          	j	8000373c <__printf+0x264>
    80003b50:	00900793          	li	a5,9
    80003b54:	00800c93          	li	s9,8
    80003b58:	be1ff06f          	j	80003738 <__printf+0x260>
    80003b5c:	00001517          	auipc	a0,0x1
    80003b60:	7fc50513          	addi	a0,a0,2044 # 80005358 <CONSOLE_STATUS+0x348>
    80003b64:	00000097          	auipc	ra,0x0
    80003b68:	918080e7          	jalr	-1768(ra) # 8000347c <panic>

0000000080003b6c <printfinit>:
    80003b6c:	fe010113          	addi	sp,sp,-32
    80003b70:	00813823          	sd	s0,16(sp)
    80003b74:	00913423          	sd	s1,8(sp)
    80003b78:	00113c23          	sd	ra,24(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    80003b80:	00003497          	auipc	s1,0x3
    80003b84:	39048493          	addi	s1,s1,912 # 80006f10 <pr>
    80003b88:	00048513          	mv	a0,s1
    80003b8c:	00001597          	auipc	a1,0x1
    80003b90:	7dc58593          	addi	a1,a1,2012 # 80005368 <CONSOLE_STATUS+0x358>
    80003b94:	00000097          	auipc	ra,0x0
    80003b98:	5f4080e7          	jalr	1524(ra) # 80004188 <initlock>
    80003b9c:	01813083          	ld	ra,24(sp)
    80003ba0:	01013403          	ld	s0,16(sp)
    80003ba4:	0004ac23          	sw	zero,24(s1)
    80003ba8:	00813483          	ld	s1,8(sp)
    80003bac:	02010113          	addi	sp,sp,32
    80003bb0:	00008067          	ret

0000000080003bb4 <uartinit>:
    80003bb4:	ff010113          	addi	sp,sp,-16
    80003bb8:	00813423          	sd	s0,8(sp)
    80003bbc:	01010413          	addi	s0,sp,16
    80003bc0:	100007b7          	lui	a5,0x10000
    80003bc4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003bc8:	f8000713          	li	a4,-128
    80003bcc:	00e781a3          	sb	a4,3(a5)
    80003bd0:	00300713          	li	a4,3
    80003bd4:	00e78023          	sb	a4,0(a5)
    80003bd8:	000780a3          	sb	zero,1(a5)
    80003bdc:	00e781a3          	sb	a4,3(a5)
    80003be0:	00700693          	li	a3,7
    80003be4:	00d78123          	sb	a3,2(a5)
    80003be8:	00e780a3          	sb	a4,1(a5)
    80003bec:	00813403          	ld	s0,8(sp)
    80003bf0:	01010113          	addi	sp,sp,16
    80003bf4:	00008067          	ret

0000000080003bf8 <uartputc>:
    80003bf8:	00002797          	auipc	a5,0x2
    80003bfc:	0c07a783          	lw	a5,192(a5) # 80005cb8 <panicked>
    80003c00:	00078463          	beqz	a5,80003c08 <uartputc+0x10>
    80003c04:	0000006f          	j	80003c04 <uartputc+0xc>
    80003c08:	fd010113          	addi	sp,sp,-48
    80003c0c:	02813023          	sd	s0,32(sp)
    80003c10:	00913c23          	sd	s1,24(sp)
    80003c14:	01213823          	sd	s2,16(sp)
    80003c18:	01313423          	sd	s3,8(sp)
    80003c1c:	02113423          	sd	ra,40(sp)
    80003c20:	03010413          	addi	s0,sp,48
    80003c24:	00002917          	auipc	s2,0x2
    80003c28:	09c90913          	addi	s2,s2,156 # 80005cc0 <uart_tx_r>
    80003c2c:	00093783          	ld	a5,0(s2)
    80003c30:	00002497          	auipc	s1,0x2
    80003c34:	09848493          	addi	s1,s1,152 # 80005cc8 <uart_tx_w>
    80003c38:	0004b703          	ld	a4,0(s1)
    80003c3c:	02078693          	addi	a3,a5,32
    80003c40:	00050993          	mv	s3,a0
    80003c44:	02e69c63          	bne	a3,a4,80003c7c <uartputc+0x84>
    80003c48:	00001097          	auipc	ra,0x1
    80003c4c:	834080e7          	jalr	-1996(ra) # 8000447c <push_on>
    80003c50:	00093783          	ld	a5,0(s2)
    80003c54:	0004b703          	ld	a4,0(s1)
    80003c58:	02078793          	addi	a5,a5,32
    80003c5c:	00e79463          	bne	a5,a4,80003c64 <uartputc+0x6c>
    80003c60:	0000006f          	j	80003c60 <uartputc+0x68>
    80003c64:	00001097          	auipc	ra,0x1
    80003c68:	88c080e7          	jalr	-1908(ra) # 800044f0 <pop_on>
    80003c6c:	00093783          	ld	a5,0(s2)
    80003c70:	0004b703          	ld	a4,0(s1)
    80003c74:	02078693          	addi	a3,a5,32
    80003c78:	fce688e3          	beq	a3,a4,80003c48 <uartputc+0x50>
    80003c7c:	01f77693          	andi	a3,a4,31
    80003c80:	00003597          	auipc	a1,0x3
    80003c84:	2b058593          	addi	a1,a1,688 # 80006f30 <uart_tx_buf>
    80003c88:	00d586b3          	add	a3,a1,a3
    80003c8c:	00170713          	addi	a4,a4,1
    80003c90:	01368023          	sb	s3,0(a3)
    80003c94:	00e4b023          	sd	a4,0(s1)
    80003c98:	10000637          	lui	a2,0x10000
    80003c9c:	02f71063          	bne	a4,a5,80003cbc <uartputc+0xc4>
    80003ca0:	0340006f          	j	80003cd4 <uartputc+0xdc>
    80003ca4:	00074703          	lbu	a4,0(a4)
    80003ca8:	00f93023          	sd	a5,0(s2)
    80003cac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003cb0:	00093783          	ld	a5,0(s2)
    80003cb4:	0004b703          	ld	a4,0(s1)
    80003cb8:	00f70e63          	beq	a4,a5,80003cd4 <uartputc+0xdc>
    80003cbc:	00564683          	lbu	a3,5(a2)
    80003cc0:	01f7f713          	andi	a4,a5,31
    80003cc4:	00e58733          	add	a4,a1,a4
    80003cc8:	0206f693          	andi	a3,a3,32
    80003ccc:	00178793          	addi	a5,a5,1
    80003cd0:	fc069ae3          	bnez	a3,80003ca4 <uartputc+0xac>
    80003cd4:	02813083          	ld	ra,40(sp)
    80003cd8:	02013403          	ld	s0,32(sp)
    80003cdc:	01813483          	ld	s1,24(sp)
    80003ce0:	01013903          	ld	s2,16(sp)
    80003ce4:	00813983          	ld	s3,8(sp)
    80003ce8:	03010113          	addi	sp,sp,48
    80003cec:	00008067          	ret

0000000080003cf0 <uartputc_sync>:
    80003cf0:	ff010113          	addi	sp,sp,-16
    80003cf4:	00813423          	sd	s0,8(sp)
    80003cf8:	01010413          	addi	s0,sp,16
    80003cfc:	00002717          	auipc	a4,0x2
    80003d00:	fbc72703          	lw	a4,-68(a4) # 80005cb8 <panicked>
    80003d04:	02071663          	bnez	a4,80003d30 <uartputc_sync+0x40>
    80003d08:	00050793          	mv	a5,a0
    80003d0c:	100006b7          	lui	a3,0x10000
    80003d10:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003d14:	02077713          	andi	a4,a4,32
    80003d18:	fe070ce3          	beqz	a4,80003d10 <uartputc_sync+0x20>
    80003d1c:	0ff7f793          	andi	a5,a5,255
    80003d20:	00f68023          	sb	a5,0(a3)
    80003d24:	00813403          	ld	s0,8(sp)
    80003d28:	01010113          	addi	sp,sp,16
    80003d2c:	00008067          	ret
    80003d30:	0000006f          	j	80003d30 <uartputc_sync+0x40>

0000000080003d34 <uartstart>:
    80003d34:	ff010113          	addi	sp,sp,-16
    80003d38:	00813423          	sd	s0,8(sp)
    80003d3c:	01010413          	addi	s0,sp,16
    80003d40:	00002617          	auipc	a2,0x2
    80003d44:	f8060613          	addi	a2,a2,-128 # 80005cc0 <uart_tx_r>
    80003d48:	00002517          	auipc	a0,0x2
    80003d4c:	f8050513          	addi	a0,a0,-128 # 80005cc8 <uart_tx_w>
    80003d50:	00063783          	ld	a5,0(a2)
    80003d54:	00053703          	ld	a4,0(a0)
    80003d58:	04f70263          	beq	a4,a5,80003d9c <uartstart+0x68>
    80003d5c:	100005b7          	lui	a1,0x10000
    80003d60:	00003817          	auipc	a6,0x3
    80003d64:	1d080813          	addi	a6,a6,464 # 80006f30 <uart_tx_buf>
    80003d68:	01c0006f          	j	80003d84 <uartstart+0x50>
    80003d6c:	0006c703          	lbu	a4,0(a3)
    80003d70:	00f63023          	sd	a5,0(a2)
    80003d74:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003d78:	00063783          	ld	a5,0(a2)
    80003d7c:	00053703          	ld	a4,0(a0)
    80003d80:	00f70e63          	beq	a4,a5,80003d9c <uartstart+0x68>
    80003d84:	01f7f713          	andi	a4,a5,31
    80003d88:	00e806b3          	add	a3,a6,a4
    80003d8c:	0055c703          	lbu	a4,5(a1)
    80003d90:	00178793          	addi	a5,a5,1
    80003d94:	02077713          	andi	a4,a4,32
    80003d98:	fc071ae3          	bnez	a4,80003d6c <uartstart+0x38>
    80003d9c:	00813403          	ld	s0,8(sp)
    80003da0:	01010113          	addi	sp,sp,16
    80003da4:	00008067          	ret

0000000080003da8 <uartgetc>:
    80003da8:	ff010113          	addi	sp,sp,-16
    80003dac:	00813423          	sd	s0,8(sp)
    80003db0:	01010413          	addi	s0,sp,16
    80003db4:	10000737          	lui	a4,0x10000
    80003db8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003dbc:	0017f793          	andi	a5,a5,1
    80003dc0:	00078c63          	beqz	a5,80003dd8 <uartgetc+0x30>
    80003dc4:	00074503          	lbu	a0,0(a4)
    80003dc8:	0ff57513          	andi	a0,a0,255
    80003dcc:	00813403          	ld	s0,8(sp)
    80003dd0:	01010113          	addi	sp,sp,16
    80003dd4:	00008067          	ret
    80003dd8:	fff00513          	li	a0,-1
    80003ddc:	ff1ff06f          	j	80003dcc <uartgetc+0x24>

0000000080003de0 <uartintr>:
    80003de0:	100007b7          	lui	a5,0x10000
    80003de4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003de8:	0017f793          	andi	a5,a5,1
    80003dec:	0a078463          	beqz	a5,80003e94 <uartintr+0xb4>
    80003df0:	fe010113          	addi	sp,sp,-32
    80003df4:	00813823          	sd	s0,16(sp)
    80003df8:	00913423          	sd	s1,8(sp)
    80003dfc:	00113c23          	sd	ra,24(sp)
    80003e00:	02010413          	addi	s0,sp,32
    80003e04:	100004b7          	lui	s1,0x10000
    80003e08:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003e0c:	0ff57513          	andi	a0,a0,255
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	534080e7          	jalr	1332(ra) # 80003344 <consoleintr>
    80003e18:	0054c783          	lbu	a5,5(s1)
    80003e1c:	0017f793          	andi	a5,a5,1
    80003e20:	fe0794e3          	bnez	a5,80003e08 <uartintr+0x28>
    80003e24:	00002617          	auipc	a2,0x2
    80003e28:	e9c60613          	addi	a2,a2,-356 # 80005cc0 <uart_tx_r>
    80003e2c:	00002517          	auipc	a0,0x2
    80003e30:	e9c50513          	addi	a0,a0,-356 # 80005cc8 <uart_tx_w>
    80003e34:	00063783          	ld	a5,0(a2)
    80003e38:	00053703          	ld	a4,0(a0)
    80003e3c:	04f70263          	beq	a4,a5,80003e80 <uartintr+0xa0>
    80003e40:	100005b7          	lui	a1,0x10000
    80003e44:	00003817          	auipc	a6,0x3
    80003e48:	0ec80813          	addi	a6,a6,236 # 80006f30 <uart_tx_buf>
    80003e4c:	01c0006f          	j	80003e68 <uartintr+0x88>
    80003e50:	0006c703          	lbu	a4,0(a3)
    80003e54:	00f63023          	sd	a5,0(a2)
    80003e58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003e5c:	00063783          	ld	a5,0(a2)
    80003e60:	00053703          	ld	a4,0(a0)
    80003e64:	00f70e63          	beq	a4,a5,80003e80 <uartintr+0xa0>
    80003e68:	01f7f713          	andi	a4,a5,31
    80003e6c:	00e806b3          	add	a3,a6,a4
    80003e70:	0055c703          	lbu	a4,5(a1)
    80003e74:	00178793          	addi	a5,a5,1
    80003e78:	02077713          	andi	a4,a4,32
    80003e7c:	fc071ae3          	bnez	a4,80003e50 <uartintr+0x70>
    80003e80:	01813083          	ld	ra,24(sp)
    80003e84:	01013403          	ld	s0,16(sp)
    80003e88:	00813483          	ld	s1,8(sp)
    80003e8c:	02010113          	addi	sp,sp,32
    80003e90:	00008067          	ret
    80003e94:	00002617          	auipc	a2,0x2
    80003e98:	e2c60613          	addi	a2,a2,-468 # 80005cc0 <uart_tx_r>
    80003e9c:	00002517          	auipc	a0,0x2
    80003ea0:	e2c50513          	addi	a0,a0,-468 # 80005cc8 <uart_tx_w>
    80003ea4:	00063783          	ld	a5,0(a2)
    80003ea8:	00053703          	ld	a4,0(a0)
    80003eac:	04f70263          	beq	a4,a5,80003ef0 <uartintr+0x110>
    80003eb0:	100005b7          	lui	a1,0x10000
    80003eb4:	00003817          	auipc	a6,0x3
    80003eb8:	07c80813          	addi	a6,a6,124 # 80006f30 <uart_tx_buf>
    80003ebc:	01c0006f          	j	80003ed8 <uartintr+0xf8>
    80003ec0:	0006c703          	lbu	a4,0(a3)
    80003ec4:	00f63023          	sd	a5,0(a2)
    80003ec8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003ecc:	00063783          	ld	a5,0(a2)
    80003ed0:	00053703          	ld	a4,0(a0)
    80003ed4:	02f70063          	beq	a4,a5,80003ef4 <uartintr+0x114>
    80003ed8:	01f7f713          	andi	a4,a5,31
    80003edc:	00e806b3          	add	a3,a6,a4
    80003ee0:	0055c703          	lbu	a4,5(a1)
    80003ee4:	00178793          	addi	a5,a5,1
    80003ee8:	02077713          	andi	a4,a4,32
    80003eec:	fc071ae3          	bnez	a4,80003ec0 <uartintr+0xe0>
    80003ef0:	00008067          	ret
    80003ef4:	00008067          	ret

0000000080003ef8 <kinit>:
    80003ef8:	fc010113          	addi	sp,sp,-64
    80003efc:	02913423          	sd	s1,40(sp)
    80003f00:	fffff7b7          	lui	a5,0xfffff
    80003f04:	00004497          	auipc	s1,0x4
    80003f08:	04b48493          	addi	s1,s1,75 # 80007f4f <end+0xfff>
    80003f0c:	02813823          	sd	s0,48(sp)
    80003f10:	01313c23          	sd	s3,24(sp)
    80003f14:	00f4f4b3          	and	s1,s1,a5
    80003f18:	02113c23          	sd	ra,56(sp)
    80003f1c:	03213023          	sd	s2,32(sp)
    80003f20:	01413823          	sd	s4,16(sp)
    80003f24:	01513423          	sd	s5,8(sp)
    80003f28:	04010413          	addi	s0,sp,64
    80003f2c:	000017b7          	lui	a5,0x1
    80003f30:	01100993          	li	s3,17
    80003f34:	00f487b3          	add	a5,s1,a5
    80003f38:	01b99993          	slli	s3,s3,0x1b
    80003f3c:	06f9e063          	bltu	s3,a5,80003f9c <kinit+0xa4>
    80003f40:	00003a97          	auipc	s5,0x3
    80003f44:	010a8a93          	addi	s5,s5,16 # 80006f50 <end>
    80003f48:	0754ec63          	bltu	s1,s5,80003fc0 <kinit+0xc8>
    80003f4c:	0734fa63          	bgeu	s1,s3,80003fc0 <kinit+0xc8>
    80003f50:	00088a37          	lui	s4,0x88
    80003f54:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003f58:	00002917          	auipc	s2,0x2
    80003f5c:	d7890913          	addi	s2,s2,-648 # 80005cd0 <kmem>
    80003f60:	00ca1a13          	slli	s4,s4,0xc
    80003f64:	0140006f          	j	80003f78 <kinit+0x80>
    80003f68:	000017b7          	lui	a5,0x1
    80003f6c:	00f484b3          	add	s1,s1,a5
    80003f70:	0554e863          	bltu	s1,s5,80003fc0 <kinit+0xc8>
    80003f74:	0534f663          	bgeu	s1,s3,80003fc0 <kinit+0xc8>
    80003f78:	00001637          	lui	a2,0x1
    80003f7c:	00100593          	li	a1,1
    80003f80:	00048513          	mv	a0,s1
    80003f84:	00000097          	auipc	ra,0x0
    80003f88:	5e4080e7          	jalr	1508(ra) # 80004568 <__memset>
    80003f8c:	00093783          	ld	a5,0(s2)
    80003f90:	00f4b023          	sd	a5,0(s1)
    80003f94:	00993023          	sd	s1,0(s2)
    80003f98:	fd4498e3          	bne	s1,s4,80003f68 <kinit+0x70>
    80003f9c:	03813083          	ld	ra,56(sp)
    80003fa0:	03013403          	ld	s0,48(sp)
    80003fa4:	02813483          	ld	s1,40(sp)
    80003fa8:	02013903          	ld	s2,32(sp)
    80003fac:	01813983          	ld	s3,24(sp)
    80003fb0:	01013a03          	ld	s4,16(sp)
    80003fb4:	00813a83          	ld	s5,8(sp)
    80003fb8:	04010113          	addi	sp,sp,64
    80003fbc:	00008067          	ret
    80003fc0:	00001517          	auipc	a0,0x1
    80003fc4:	3c850513          	addi	a0,a0,968 # 80005388 <digits+0x18>
    80003fc8:	fffff097          	auipc	ra,0xfffff
    80003fcc:	4b4080e7          	jalr	1204(ra) # 8000347c <panic>

0000000080003fd0 <freerange>:
    80003fd0:	fc010113          	addi	sp,sp,-64
    80003fd4:	000017b7          	lui	a5,0x1
    80003fd8:	02913423          	sd	s1,40(sp)
    80003fdc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003fe0:	009504b3          	add	s1,a0,s1
    80003fe4:	fffff537          	lui	a0,0xfffff
    80003fe8:	02813823          	sd	s0,48(sp)
    80003fec:	02113c23          	sd	ra,56(sp)
    80003ff0:	03213023          	sd	s2,32(sp)
    80003ff4:	01313c23          	sd	s3,24(sp)
    80003ff8:	01413823          	sd	s4,16(sp)
    80003ffc:	01513423          	sd	s5,8(sp)
    80004000:	01613023          	sd	s6,0(sp)
    80004004:	04010413          	addi	s0,sp,64
    80004008:	00a4f4b3          	and	s1,s1,a0
    8000400c:	00f487b3          	add	a5,s1,a5
    80004010:	06f5e463          	bltu	a1,a5,80004078 <freerange+0xa8>
    80004014:	00003a97          	auipc	s5,0x3
    80004018:	f3ca8a93          	addi	s5,s5,-196 # 80006f50 <end>
    8000401c:	0954e263          	bltu	s1,s5,800040a0 <freerange+0xd0>
    80004020:	01100993          	li	s3,17
    80004024:	01b99993          	slli	s3,s3,0x1b
    80004028:	0734fc63          	bgeu	s1,s3,800040a0 <freerange+0xd0>
    8000402c:	00058a13          	mv	s4,a1
    80004030:	00002917          	auipc	s2,0x2
    80004034:	ca090913          	addi	s2,s2,-864 # 80005cd0 <kmem>
    80004038:	00002b37          	lui	s6,0x2
    8000403c:	0140006f          	j	80004050 <freerange+0x80>
    80004040:	000017b7          	lui	a5,0x1
    80004044:	00f484b3          	add	s1,s1,a5
    80004048:	0554ec63          	bltu	s1,s5,800040a0 <freerange+0xd0>
    8000404c:	0534fa63          	bgeu	s1,s3,800040a0 <freerange+0xd0>
    80004050:	00001637          	lui	a2,0x1
    80004054:	00100593          	li	a1,1
    80004058:	00048513          	mv	a0,s1
    8000405c:	00000097          	auipc	ra,0x0
    80004060:	50c080e7          	jalr	1292(ra) # 80004568 <__memset>
    80004064:	00093703          	ld	a4,0(s2)
    80004068:	016487b3          	add	a5,s1,s6
    8000406c:	00e4b023          	sd	a4,0(s1)
    80004070:	00993023          	sd	s1,0(s2)
    80004074:	fcfa76e3          	bgeu	s4,a5,80004040 <freerange+0x70>
    80004078:	03813083          	ld	ra,56(sp)
    8000407c:	03013403          	ld	s0,48(sp)
    80004080:	02813483          	ld	s1,40(sp)
    80004084:	02013903          	ld	s2,32(sp)
    80004088:	01813983          	ld	s3,24(sp)
    8000408c:	01013a03          	ld	s4,16(sp)
    80004090:	00813a83          	ld	s5,8(sp)
    80004094:	00013b03          	ld	s6,0(sp)
    80004098:	04010113          	addi	sp,sp,64
    8000409c:	00008067          	ret
    800040a0:	00001517          	auipc	a0,0x1
    800040a4:	2e850513          	addi	a0,a0,744 # 80005388 <digits+0x18>
    800040a8:	fffff097          	auipc	ra,0xfffff
    800040ac:	3d4080e7          	jalr	980(ra) # 8000347c <panic>

00000000800040b0 <kfree>:
    800040b0:	fe010113          	addi	sp,sp,-32
    800040b4:	00813823          	sd	s0,16(sp)
    800040b8:	00113c23          	sd	ra,24(sp)
    800040bc:	00913423          	sd	s1,8(sp)
    800040c0:	02010413          	addi	s0,sp,32
    800040c4:	03451793          	slli	a5,a0,0x34
    800040c8:	04079c63          	bnez	a5,80004120 <kfree+0x70>
    800040cc:	00003797          	auipc	a5,0x3
    800040d0:	e8478793          	addi	a5,a5,-380 # 80006f50 <end>
    800040d4:	00050493          	mv	s1,a0
    800040d8:	04f56463          	bltu	a0,a5,80004120 <kfree+0x70>
    800040dc:	01100793          	li	a5,17
    800040e0:	01b79793          	slli	a5,a5,0x1b
    800040e4:	02f57e63          	bgeu	a0,a5,80004120 <kfree+0x70>
    800040e8:	00001637          	lui	a2,0x1
    800040ec:	00100593          	li	a1,1
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	478080e7          	jalr	1144(ra) # 80004568 <__memset>
    800040f8:	00002797          	auipc	a5,0x2
    800040fc:	bd878793          	addi	a5,a5,-1064 # 80005cd0 <kmem>
    80004100:	0007b703          	ld	a4,0(a5)
    80004104:	01813083          	ld	ra,24(sp)
    80004108:	01013403          	ld	s0,16(sp)
    8000410c:	00e4b023          	sd	a4,0(s1)
    80004110:	0097b023          	sd	s1,0(a5)
    80004114:	00813483          	ld	s1,8(sp)
    80004118:	02010113          	addi	sp,sp,32
    8000411c:	00008067          	ret
    80004120:	00001517          	auipc	a0,0x1
    80004124:	26850513          	addi	a0,a0,616 # 80005388 <digits+0x18>
    80004128:	fffff097          	auipc	ra,0xfffff
    8000412c:	354080e7          	jalr	852(ra) # 8000347c <panic>

0000000080004130 <kalloc>:
    80004130:	fe010113          	addi	sp,sp,-32
    80004134:	00813823          	sd	s0,16(sp)
    80004138:	00913423          	sd	s1,8(sp)
    8000413c:	00113c23          	sd	ra,24(sp)
    80004140:	02010413          	addi	s0,sp,32
    80004144:	00002797          	auipc	a5,0x2
    80004148:	b8c78793          	addi	a5,a5,-1140 # 80005cd0 <kmem>
    8000414c:	0007b483          	ld	s1,0(a5)
    80004150:	02048063          	beqz	s1,80004170 <kalloc+0x40>
    80004154:	0004b703          	ld	a4,0(s1)
    80004158:	00001637          	lui	a2,0x1
    8000415c:	00500593          	li	a1,5
    80004160:	00048513          	mv	a0,s1
    80004164:	00e7b023          	sd	a4,0(a5)
    80004168:	00000097          	auipc	ra,0x0
    8000416c:	400080e7          	jalr	1024(ra) # 80004568 <__memset>
    80004170:	01813083          	ld	ra,24(sp)
    80004174:	01013403          	ld	s0,16(sp)
    80004178:	00048513          	mv	a0,s1
    8000417c:	00813483          	ld	s1,8(sp)
    80004180:	02010113          	addi	sp,sp,32
    80004184:	00008067          	ret

0000000080004188 <initlock>:
    80004188:	ff010113          	addi	sp,sp,-16
    8000418c:	00813423          	sd	s0,8(sp)
    80004190:	01010413          	addi	s0,sp,16
    80004194:	00813403          	ld	s0,8(sp)
    80004198:	00b53423          	sd	a1,8(a0)
    8000419c:	00052023          	sw	zero,0(a0)
    800041a0:	00053823          	sd	zero,16(a0)
    800041a4:	01010113          	addi	sp,sp,16
    800041a8:	00008067          	ret

00000000800041ac <acquire>:
    800041ac:	fe010113          	addi	sp,sp,-32
    800041b0:	00813823          	sd	s0,16(sp)
    800041b4:	00913423          	sd	s1,8(sp)
    800041b8:	00113c23          	sd	ra,24(sp)
    800041bc:	01213023          	sd	s2,0(sp)
    800041c0:	02010413          	addi	s0,sp,32
    800041c4:	00050493          	mv	s1,a0
    800041c8:	10002973          	csrr	s2,sstatus
    800041cc:	100027f3          	csrr	a5,sstatus
    800041d0:	ffd7f793          	andi	a5,a5,-3
    800041d4:	10079073          	csrw	sstatus,a5
    800041d8:	fffff097          	auipc	ra,0xfffff
    800041dc:	8e8080e7          	jalr	-1816(ra) # 80002ac0 <mycpu>
    800041e0:	07852783          	lw	a5,120(a0)
    800041e4:	06078e63          	beqz	a5,80004260 <acquire+0xb4>
    800041e8:	fffff097          	auipc	ra,0xfffff
    800041ec:	8d8080e7          	jalr	-1832(ra) # 80002ac0 <mycpu>
    800041f0:	07852783          	lw	a5,120(a0)
    800041f4:	0004a703          	lw	a4,0(s1)
    800041f8:	0017879b          	addiw	a5,a5,1
    800041fc:	06f52c23          	sw	a5,120(a0)
    80004200:	04071063          	bnez	a4,80004240 <acquire+0x94>
    80004204:	00100713          	li	a4,1
    80004208:	00070793          	mv	a5,a4
    8000420c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004210:	0007879b          	sext.w	a5,a5
    80004214:	fe079ae3          	bnez	a5,80004208 <acquire+0x5c>
    80004218:	0ff0000f          	fence
    8000421c:	fffff097          	auipc	ra,0xfffff
    80004220:	8a4080e7          	jalr	-1884(ra) # 80002ac0 <mycpu>
    80004224:	01813083          	ld	ra,24(sp)
    80004228:	01013403          	ld	s0,16(sp)
    8000422c:	00a4b823          	sd	a0,16(s1)
    80004230:	00013903          	ld	s2,0(sp)
    80004234:	00813483          	ld	s1,8(sp)
    80004238:	02010113          	addi	sp,sp,32
    8000423c:	00008067          	ret
    80004240:	0104b903          	ld	s2,16(s1)
    80004244:	fffff097          	auipc	ra,0xfffff
    80004248:	87c080e7          	jalr	-1924(ra) # 80002ac0 <mycpu>
    8000424c:	faa91ce3          	bne	s2,a0,80004204 <acquire+0x58>
    80004250:	00001517          	auipc	a0,0x1
    80004254:	14050513          	addi	a0,a0,320 # 80005390 <digits+0x20>
    80004258:	fffff097          	auipc	ra,0xfffff
    8000425c:	224080e7          	jalr	548(ra) # 8000347c <panic>
    80004260:	00195913          	srli	s2,s2,0x1
    80004264:	fffff097          	auipc	ra,0xfffff
    80004268:	85c080e7          	jalr	-1956(ra) # 80002ac0 <mycpu>
    8000426c:	00197913          	andi	s2,s2,1
    80004270:	07252e23          	sw	s2,124(a0)
    80004274:	f75ff06f          	j	800041e8 <acquire+0x3c>

0000000080004278 <release>:
    80004278:	fe010113          	addi	sp,sp,-32
    8000427c:	00813823          	sd	s0,16(sp)
    80004280:	00113c23          	sd	ra,24(sp)
    80004284:	00913423          	sd	s1,8(sp)
    80004288:	01213023          	sd	s2,0(sp)
    8000428c:	02010413          	addi	s0,sp,32
    80004290:	00052783          	lw	a5,0(a0)
    80004294:	00079a63          	bnez	a5,800042a8 <release+0x30>
    80004298:	00001517          	auipc	a0,0x1
    8000429c:	10050513          	addi	a0,a0,256 # 80005398 <digits+0x28>
    800042a0:	fffff097          	auipc	ra,0xfffff
    800042a4:	1dc080e7          	jalr	476(ra) # 8000347c <panic>
    800042a8:	01053903          	ld	s2,16(a0)
    800042ac:	00050493          	mv	s1,a0
    800042b0:	fffff097          	auipc	ra,0xfffff
    800042b4:	810080e7          	jalr	-2032(ra) # 80002ac0 <mycpu>
    800042b8:	fea910e3          	bne	s2,a0,80004298 <release+0x20>
    800042bc:	0004b823          	sd	zero,16(s1)
    800042c0:	0ff0000f          	fence
    800042c4:	0f50000f          	fence	iorw,ow
    800042c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800042cc:	ffffe097          	auipc	ra,0xffffe
    800042d0:	7f4080e7          	jalr	2036(ra) # 80002ac0 <mycpu>
    800042d4:	100027f3          	csrr	a5,sstatus
    800042d8:	0027f793          	andi	a5,a5,2
    800042dc:	04079a63          	bnez	a5,80004330 <release+0xb8>
    800042e0:	07852783          	lw	a5,120(a0)
    800042e4:	02f05e63          	blez	a5,80004320 <release+0xa8>
    800042e8:	fff7871b          	addiw	a4,a5,-1
    800042ec:	06e52c23          	sw	a4,120(a0)
    800042f0:	00071c63          	bnez	a4,80004308 <release+0x90>
    800042f4:	07c52783          	lw	a5,124(a0)
    800042f8:	00078863          	beqz	a5,80004308 <release+0x90>
    800042fc:	100027f3          	csrr	a5,sstatus
    80004300:	0027e793          	ori	a5,a5,2
    80004304:	10079073          	csrw	sstatus,a5
    80004308:	01813083          	ld	ra,24(sp)
    8000430c:	01013403          	ld	s0,16(sp)
    80004310:	00813483          	ld	s1,8(sp)
    80004314:	00013903          	ld	s2,0(sp)
    80004318:	02010113          	addi	sp,sp,32
    8000431c:	00008067          	ret
    80004320:	00001517          	auipc	a0,0x1
    80004324:	09850513          	addi	a0,a0,152 # 800053b8 <digits+0x48>
    80004328:	fffff097          	auipc	ra,0xfffff
    8000432c:	154080e7          	jalr	340(ra) # 8000347c <panic>
    80004330:	00001517          	auipc	a0,0x1
    80004334:	07050513          	addi	a0,a0,112 # 800053a0 <digits+0x30>
    80004338:	fffff097          	auipc	ra,0xfffff
    8000433c:	144080e7          	jalr	324(ra) # 8000347c <panic>

0000000080004340 <holding>:
    80004340:	00052783          	lw	a5,0(a0)
    80004344:	00079663          	bnez	a5,80004350 <holding+0x10>
    80004348:	00000513          	li	a0,0
    8000434c:	00008067          	ret
    80004350:	fe010113          	addi	sp,sp,-32
    80004354:	00813823          	sd	s0,16(sp)
    80004358:	00913423          	sd	s1,8(sp)
    8000435c:	00113c23          	sd	ra,24(sp)
    80004360:	02010413          	addi	s0,sp,32
    80004364:	01053483          	ld	s1,16(a0)
    80004368:	ffffe097          	auipc	ra,0xffffe
    8000436c:	758080e7          	jalr	1880(ra) # 80002ac0 <mycpu>
    80004370:	01813083          	ld	ra,24(sp)
    80004374:	01013403          	ld	s0,16(sp)
    80004378:	40a48533          	sub	a0,s1,a0
    8000437c:	00153513          	seqz	a0,a0
    80004380:	00813483          	ld	s1,8(sp)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00008067          	ret

000000008000438c <push_off>:
    8000438c:	fe010113          	addi	sp,sp,-32
    80004390:	00813823          	sd	s0,16(sp)
    80004394:	00113c23          	sd	ra,24(sp)
    80004398:	00913423          	sd	s1,8(sp)
    8000439c:	02010413          	addi	s0,sp,32
    800043a0:	100024f3          	csrr	s1,sstatus
    800043a4:	100027f3          	csrr	a5,sstatus
    800043a8:	ffd7f793          	andi	a5,a5,-3
    800043ac:	10079073          	csrw	sstatus,a5
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	710080e7          	jalr	1808(ra) # 80002ac0 <mycpu>
    800043b8:	07852783          	lw	a5,120(a0)
    800043bc:	02078663          	beqz	a5,800043e8 <push_off+0x5c>
    800043c0:	ffffe097          	auipc	ra,0xffffe
    800043c4:	700080e7          	jalr	1792(ra) # 80002ac0 <mycpu>
    800043c8:	07852783          	lw	a5,120(a0)
    800043cc:	01813083          	ld	ra,24(sp)
    800043d0:	01013403          	ld	s0,16(sp)
    800043d4:	0017879b          	addiw	a5,a5,1
    800043d8:	06f52c23          	sw	a5,120(a0)
    800043dc:	00813483          	ld	s1,8(sp)
    800043e0:	02010113          	addi	sp,sp,32
    800043e4:	00008067          	ret
    800043e8:	0014d493          	srli	s1,s1,0x1
    800043ec:	ffffe097          	auipc	ra,0xffffe
    800043f0:	6d4080e7          	jalr	1748(ra) # 80002ac0 <mycpu>
    800043f4:	0014f493          	andi	s1,s1,1
    800043f8:	06952e23          	sw	s1,124(a0)
    800043fc:	fc5ff06f          	j	800043c0 <push_off+0x34>

0000000080004400 <pop_off>:
    80004400:	ff010113          	addi	sp,sp,-16
    80004404:	00813023          	sd	s0,0(sp)
    80004408:	00113423          	sd	ra,8(sp)
    8000440c:	01010413          	addi	s0,sp,16
    80004410:	ffffe097          	auipc	ra,0xffffe
    80004414:	6b0080e7          	jalr	1712(ra) # 80002ac0 <mycpu>
    80004418:	100027f3          	csrr	a5,sstatus
    8000441c:	0027f793          	andi	a5,a5,2
    80004420:	04079663          	bnez	a5,8000446c <pop_off+0x6c>
    80004424:	07852783          	lw	a5,120(a0)
    80004428:	02f05a63          	blez	a5,8000445c <pop_off+0x5c>
    8000442c:	fff7871b          	addiw	a4,a5,-1
    80004430:	06e52c23          	sw	a4,120(a0)
    80004434:	00071c63          	bnez	a4,8000444c <pop_off+0x4c>
    80004438:	07c52783          	lw	a5,124(a0)
    8000443c:	00078863          	beqz	a5,8000444c <pop_off+0x4c>
    80004440:	100027f3          	csrr	a5,sstatus
    80004444:	0027e793          	ori	a5,a5,2
    80004448:	10079073          	csrw	sstatus,a5
    8000444c:	00813083          	ld	ra,8(sp)
    80004450:	00013403          	ld	s0,0(sp)
    80004454:	01010113          	addi	sp,sp,16
    80004458:	00008067          	ret
    8000445c:	00001517          	auipc	a0,0x1
    80004460:	f5c50513          	addi	a0,a0,-164 # 800053b8 <digits+0x48>
    80004464:	fffff097          	auipc	ra,0xfffff
    80004468:	018080e7          	jalr	24(ra) # 8000347c <panic>
    8000446c:	00001517          	auipc	a0,0x1
    80004470:	f3450513          	addi	a0,a0,-204 # 800053a0 <digits+0x30>
    80004474:	fffff097          	auipc	ra,0xfffff
    80004478:	008080e7          	jalr	8(ra) # 8000347c <panic>

000000008000447c <push_on>:
    8000447c:	fe010113          	addi	sp,sp,-32
    80004480:	00813823          	sd	s0,16(sp)
    80004484:	00113c23          	sd	ra,24(sp)
    80004488:	00913423          	sd	s1,8(sp)
    8000448c:	02010413          	addi	s0,sp,32
    80004490:	100024f3          	csrr	s1,sstatus
    80004494:	100027f3          	csrr	a5,sstatus
    80004498:	0027e793          	ori	a5,a5,2
    8000449c:	10079073          	csrw	sstatus,a5
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	620080e7          	jalr	1568(ra) # 80002ac0 <mycpu>
    800044a8:	07852783          	lw	a5,120(a0)
    800044ac:	02078663          	beqz	a5,800044d8 <push_on+0x5c>
    800044b0:	ffffe097          	auipc	ra,0xffffe
    800044b4:	610080e7          	jalr	1552(ra) # 80002ac0 <mycpu>
    800044b8:	07852783          	lw	a5,120(a0)
    800044bc:	01813083          	ld	ra,24(sp)
    800044c0:	01013403          	ld	s0,16(sp)
    800044c4:	0017879b          	addiw	a5,a5,1
    800044c8:	06f52c23          	sw	a5,120(a0)
    800044cc:	00813483          	ld	s1,8(sp)
    800044d0:	02010113          	addi	sp,sp,32
    800044d4:	00008067          	ret
    800044d8:	0014d493          	srli	s1,s1,0x1
    800044dc:	ffffe097          	auipc	ra,0xffffe
    800044e0:	5e4080e7          	jalr	1508(ra) # 80002ac0 <mycpu>
    800044e4:	0014f493          	andi	s1,s1,1
    800044e8:	06952e23          	sw	s1,124(a0)
    800044ec:	fc5ff06f          	j	800044b0 <push_on+0x34>

00000000800044f0 <pop_on>:
    800044f0:	ff010113          	addi	sp,sp,-16
    800044f4:	00813023          	sd	s0,0(sp)
    800044f8:	00113423          	sd	ra,8(sp)
    800044fc:	01010413          	addi	s0,sp,16
    80004500:	ffffe097          	auipc	ra,0xffffe
    80004504:	5c0080e7          	jalr	1472(ra) # 80002ac0 <mycpu>
    80004508:	100027f3          	csrr	a5,sstatus
    8000450c:	0027f793          	andi	a5,a5,2
    80004510:	04078463          	beqz	a5,80004558 <pop_on+0x68>
    80004514:	07852783          	lw	a5,120(a0)
    80004518:	02f05863          	blez	a5,80004548 <pop_on+0x58>
    8000451c:	fff7879b          	addiw	a5,a5,-1
    80004520:	06f52c23          	sw	a5,120(a0)
    80004524:	07853783          	ld	a5,120(a0)
    80004528:	00079863          	bnez	a5,80004538 <pop_on+0x48>
    8000452c:	100027f3          	csrr	a5,sstatus
    80004530:	ffd7f793          	andi	a5,a5,-3
    80004534:	10079073          	csrw	sstatus,a5
    80004538:	00813083          	ld	ra,8(sp)
    8000453c:	00013403          	ld	s0,0(sp)
    80004540:	01010113          	addi	sp,sp,16
    80004544:	00008067          	ret
    80004548:	00001517          	auipc	a0,0x1
    8000454c:	e9850513          	addi	a0,a0,-360 # 800053e0 <digits+0x70>
    80004550:	fffff097          	auipc	ra,0xfffff
    80004554:	f2c080e7          	jalr	-212(ra) # 8000347c <panic>
    80004558:	00001517          	auipc	a0,0x1
    8000455c:	e6850513          	addi	a0,a0,-408 # 800053c0 <digits+0x50>
    80004560:	fffff097          	auipc	ra,0xfffff
    80004564:	f1c080e7          	jalr	-228(ra) # 8000347c <panic>

0000000080004568 <__memset>:
    80004568:	ff010113          	addi	sp,sp,-16
    8000456c:	00813423          	sd	s0,8(sp)
    80004570:	01010413          	addi	s0,sp,16
    80004574:	1a060e63          	beqz	a2,80004730 <__memset+0x1c8>
    80004578:	40a007b3          	neg	a5,a0
    8000457c:	0077f793          	andi	a5,a5,7
    80004580:	00778693          	addi	a3,a5,7
    80004584:	00b00813          	li	a6,11
    80004588:	0ff5f593          	andi	a1,a1,255
    8000458c:	fff6071b          	addiw	a4,a2,-1
    80004590:	1b06e663          	bltu	a3,a6,8000473c <__memset+0x1d4>
    80004594:	1cd76463          	bltu	a4,a3,8000475c <__memset+0x1f4>
    80004598:	1a078e63          	beqz	a5,80004754 <__memset+0x1ec>
    8000459c:	00b50023          	sb	a1,0(a0)
    800045a0:	00100713          	li	a4,1
    800045a4:	1ae78463          	beq	a5,a4,8000474c <__memset+0x1e4>
    800045a8:	00b500a3          	sb	a1,1(a0)
    800045ac:	00200713          	li	a4,2
    800045b0:	1ae78a63          	beq	a5,a4,80004764 <__memset+0x1fc>
    800045b4:	00b50123          	sb	a1,2(a0)
    800045b8:	00300713          	li	a4,3
    800045bc:	18e78463          	beq	a5,a4,80004744 <__memset+0x1dc>
    800045c0:	00b501a3          	sb	a1,3(a0)
    800045c4:	00400713          	li	a4,4
    800045c8:	1ae78263          	beq	a5,a4,8000476c <__memset+0x204>
    800045cc:	00b50223          	sb	a1,4(a0)
    800045d0:	00500713          	li	a4,5
    800045d4:	1ae78063          	beq	a5,a4,80004774 <__memset+0x20c>
    800045d8:	00b502a3          	sb	a1,5(a0)
    800045dc:	00700713          	li	a4,7
    800045e0:	18e79e63          	bne	a5,a4,8000477c <__memset+0x214>
    800045e4:	00b50323          	sb	a1,6(a0)
    800045e8:	00700e93          	li	t4,7
    800045ec:	00859713          	slli	a4,a1,0x8
    800045f0:	00e5e733          	or	a4,a1,a4
    800045f4:	01059e13          	slli	t3,a1,0x10
    800045f8:	01c76e33          	or	t3,a4,t3
    800045fc:	01859313          	slli	t1,a1,0x18
    80004600:	006e6333          	or	t1,t3,t1
    80004604:	02059893          	slli	a7,a1,0x20
    80004608:	40f60e3b          	subw	t3,a2,a5
    8000460c:	011368b3          	or	a7,t1,a7
    80004610:	02859813          	slli	a6,a1,0x28
    80004614:	0108e833          	or	a6,a7,a6
    80004618:	03059693          	slli	a3,a1,0x30
    8000461c:	003e589b          	srliw	a7,t3,0x3
    80004620:	00d866b3          	or	a3,a6,a3
    80004624:	03859713          	slli	a4,a1,0x38
    80004628:	00389813          	slli	a6,a7,0x3
    8000462c:	00f507b3          	add	a5,a0,a5
    80004630:	00e6e733          	or	a4,a3,a4
    80004634:	000e089b          	sext.w	a7,t3
    80004638:	00f806b3          	add	a3,a6,a5
    8000463c:	00e7b023          	sd	a4,0(a5)
    80004640:	00878793          	addi	a5,a5,8
    80004644:	fed79ce3          	bne	a5,a3,8000463c <__memset+0xd4>
    80004648:	ff8e7793          	andi	a5,t3,-8
    8000464c:	0007871b          	sext.w	a4,a5
    80004650:	01d787bb          	addw	a5,a5,t4
    80004654:	0ce88e63          	beq	a7,a4,80004730 <__memset+0x1c8>
    80004658:	00f50733          	add	a4,a0,a5
    8000465c:	00b70023          	sb	a1,0(a4)
    80004660:	0017871b          	addiw	a4,a5,1
    80004664:	0cc77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004668:	00e50733          	add	a4,a0,a4
    8000466c:	00b70023          	sb	a1,0(a4)
    80004670:	0027871b          	addiw	a4,a5,2
    80004674:	0ac77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004678:	00e50733          	add	a4,a0,a4
    8000467c:	00b70023          	sb	a1,0(a4)
    80004680:	0037871b          	addiw	a4,a5,3
    80004684:	0ac77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004688:	00e50733          	add	a4,a0,a4
    8000468c:	00b70023          	sb	a1,0(a4)
    80004690:	0047871b          	addiw	a4,a5,4
    80004694:	08c77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004698:	00e50733          	add	a4,a0,a4
    8000469c:	00b70023          	sb	a1,0(a4)
    800046a0:	0057871b          	addiw	a4,a5,5
    800046a4:	08c77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046a8:	00e50733          	add	a4,a0,a4
    800046ac:	00b70023          	sb	a1,0(a4)
    800046b0:	0067871b          	addiw	a4,a5,6
    800046b4:	06c77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046b8:	00e50733          	add	a4,a0,a4
    800046bc:	00b70023          	sb	a1,0(a4)
    800046c0:	0077871b          	addiw	a4,a5,7
    800046c4:	06c77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046c8:	00e50733          	add	a4,a0,a4
    800046cc:	00b70023          	sb	a1,0(a4)
    800046d0:	0087871b          	addiw	a4,a5,8
    800046d4:	04c77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046d8:	00e50733          	add	a4,a0,a4
    800046dc:	00b70023          	sb	a1,0(a4)
    800046e0:	0097871b          	addiw	a4,a5,9
    800046e4:	04c77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046e8:	00e50733          	add	a4,a0,a4
    800046ec:	00b70023          	sb	a1,0(a4)
    800046f0:	00a7871b          	addiw	a4,a5,10
    800046f4:	02c77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    800046f8:	00e50733          	add	a4,a0,a4
    800046fc:	00b70023          	sb	a1,0(a4)
    80004700:	00b7871b          	addiw	a4,a5,11
    80004704:	02c77663          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004708:	00e50733          	add	a4,a0,a4
    8000470c:	00b70023          	sb	a1,0(a4)
    80004710:	00c7871b          	addiw	a4,a5,12
    80004714:	00c77e63          	bgeu	a4,a2,80004730 <__memset+0x1c8>
    80004718:	00e50733          	add	a4,a0,a4
    8000471c:	00b70023          	sb	a1,0(a4)
    80004720:	00d7879b          	addiw	a5,a5,13
    80004724:	00c7f663          	bgeu	a5,a2,80004730 <__memset+0x1c8>
    80004728:	00f507b3          	add	a5,a0,a5
    8000472c:	00b78023          	sb	a1,0(a5)
    80004730:	00813403          	ld	s0,8(sp)
    80004734:	01010113          	addi	sp,sp,16
    80004738:	00008067          	ret
    8000473c:	00b00693          	li	a3,11
    80004740:	e55ff06f          	j	80004594 <__memset+0x2c>
    80004744:	00300e93          	li	t4,3
    80004748:	ea5ff06f          	j	800045ec <__memset+0x84>
    8000474c:	00100e93          	li	t4,1
    80004750:	e9dff06f          	j	800045ec <__memset+0x84>
    80004754:	00000e93          	li	t4,0
    80004758:	e95ff06f          	j	800045ec <__memset+0x84>
    8000475c:	00000793          	li	a5,0
    80004760:	ef9ff06f          	j	80004658 <__memset+0xf0>
    80004764:	00200e93          	li	t4,2
    80004768:	e85ff06f          	j	800045ec <__memset+0x84>
    8000476c:	00400e93          	li	t4,4
    80004770:	e7dff06f          	j	800045ec <__memset+0x84>
    80004774:	00500e93          	li	t4,5
    80004778:	e75ff06f          	j	800045ec <__memset+0x84>
    8000477c:	00600e93          	li	t4,6
    80004780:	e6dff06f          	j	800045ec <__memset+0x84>

0000000080004784 <__memmove>:
    80004784:	ff010113          	addi	sp,sp,-16
    80004788:	00813423          	sd	s0,8(sp)
    8000478c:	01010413          	addi	s0,sp,16
    80004790:	0e060863          	beqz	a2,80004880 <__memmove+0xfc>
    80004794:	fff6069b          	addiw	a3,a2,-1
    80004798:	0006881b          	sext.w	a6,a3
    8000479c:	0ea5e863          	bltu	a1,a0,8000488c <__memmove+0x108>
    800047a0:	00758713          	addi	a4,a1,7
    800047a4:	00a5e7b3          	or	a5,a1,a0
    800047a8:	40a70733          	sub	a4,a4,a0
    800047ac:	0077f793          	andi	a5,a5,7
    800047b0:	00f73713          	sltiu	a4,a4,15
    800047b4:	00174713          	xori	a4,a4,1
    800047b8:	0017b793          	seqz	a5,a5
    800047bc:	00e7f7b3          	and	a5,a5,a4
    800047c0:	10078863          	beqz	a5,800048d0 <__memmove+0x14c>
    800047c4:	00900793          	li	a5,9
    800047c8:	1107f463          	bgeu	a5,a6,800048d0 <__memmove+0x14c>
    800047cc:	0036581b          	srliw	a6,a2,0x3
    800047d0:	fff8081b          	addiw	a6,a6,-1
    800047d4:	02081813          	slli	a6,a6,0x20
    800047d8:	01d85893          	srli	a7,a6,0x1d
    800047dc:	00858813          	addi	a6,a1,8
    800047e0:	00058793          	mv	a5,a1
    800047e4:	00050713          	mv	a4,a0
    800047e8:	01088833          	add	a6,a7,a6
    800047ec:	0007b883          	ld	a7,0(a5)
    800047f0:	00878793          	addi	a5,a5,8
    800047f4:	00870713          	addi	a4,a4,8
    800047f8:	ff173c23          	sd	a7,-8(a4)
    800047fc:	ff0798e3          	bne	a5,a6,800047ec <__memmove+0x68>
    80004800:	ff867713          	andi	a4,a2,-8
    80004804:	02071793          	slli	a5,a4,0x20
    80004808:	0207d793          	srli	a5,a5,0x20
    8000480c:	00f585b3          	add	a1,a1,a5
    80004810:	40e686bb          	subw	a3,a3,a4
    80004814:	00f507b3          	add	a5,a0,a5
    80004818:	06e60463          	beq	a2,a4,80004880 <__memmove+0xfc>
    8000481c:	0005c703          	lbu	a4,0(a1)
    80004820:	00e78023          	sb	a4,0(a5)
    80004824:	04068e63          	beqz	a3,80004880 <__memmove+0xfc>
    80004828:	0015c603          	lbu	a2,1(a1)
    8000482c:	00100713          	li	a4,1
    80004830:	00c780a3          	sb	a2,1(a5)
    80004834:	04e68663          	beq	a3,a4,80004880 <__memmove+0xfc>
    80004838:	0025c603          	lbu	a2,2(a1)
    8000483c:	00200713          	li	a4,2
    80004840:	00c78123          	sb	a2,2(a5)
    80004844:	02e68e63          	beq	a3,a4,80004880 <__memmove+0xfc>
    80004848:	0035c603          	lbu	a2,3(a1)
    8000484c:	00300713          	li	a4,3
    80004850:	00c781a3          	sb	a2,3(a5)
    80004854:	02e68663          	beq	a3,a4,80004880 <__memmove+0xfc>
    80004858:	0045c603          	lbu	a2,4(a1)
    8000485c:	00400713          	li	a4,4
    80004860:	00c78223          	sb	a2,4(a5)
    80004864:	00e68e63          	beq	a3,a4,80004880 <__memmove+0xfc>
    80004868:	0055c603          	lbu	a2,5(a1)
    8000486c:	00500713          	li	a4,5
    80004870:	00c782a3          	sb	a2,5(a5)
    80004874:	00e68663          	beq	a3,a4,80004880 <__memmove+0xfc>
    80004878:	0065c703          	lbu	a4,6(a1)
    8000487c:	00e78323          	sb	a4,6(a5)
    80004880:	00813403          	ld	s0,8(sp)
    80004884:	01010113          	addi	sp,sp,16
    80004888:	00008067          	ret
    8000488c:	02061713          	slli	a4,a2,0x20
    80004890:	02075713          	srli	a4,a4,0x20
    80004894:	00e587b3          	add	a5,a1,a4
    80004898:	f0f574e3          	bgeu	a0,a5,800047a0 <__memmove+0x1c>
    8000489c:	02069613          	slli	a2,a3,0x20
    800048a0:	02065613          	srli	a2,a2,0x20
    800048a4:	fff64613          	not	a2,a2
    800048a8:	00e50733          	add	a4,a0,a4
    800048ac:	00c78633          	add	a2,a5,a2
    800048b0:	fff7c683          	lbu	a3,-1(a5)
    800048b4:	fff78793          	addi	a5,a5,-1
    800048b8:	fff70713          	addi	a4,a4,-1
    800048bc:	00d70023          	sb	a3,0(a4)
    800048c0:	fec798e3          	bne	a5,a2,800048b0 <__memmove+0x12c>
    800048c4:	00813403          	ld	s0,8(sp)
    800048c8:	01010113          	addi	sp,sp,16
    800048cc:	00008067          	ret
    800048d0:	02069713          	slli	a4,a3,0x20
    800048d4:	02075713          	srli	a4,a4,0x20
    800048d8:	00170713          	addi	a4,a4,1
    800048dc:	00e50733          	add	a4,a0,a4
    800048e0:	00050793          	mv	a5,a0
    800048e4:	0005c683          	lbu	a3,0(a1)
    800048e8:	00178793          	addi	a5,a5,1
    800048ec:	00158593          	addi	a1,a1,1
    800048f0:	fed78fa3          	sb	a3,-1(a5)
    800048f4:	fee798e3          	bne	a5,a4,800048e4 <__memmove+0x160>
    800048f8:	f89ff06f          	j	80004880 <__memmove+0xfc>

00000000800048fc <__putc>:
    800048fc:	fe010113          	addi	sp,sp,-32
    80004900:	00813823          	sd	s0,16(sp)
    80004904:	00113c23          	sd	ra,24(sp)
    80004908:	02010413          	addi	s0,sp,32
    8000490c:	00050793          	mv	a5,a0
    80004910:	fef40593          	addi	a1,s0,-17
    80004914:	00100613          	li	a2,1
    80004918:	00000513          	li	a0,0
    8000491c:	fef407a3          	sb	a5,-17(s0)
    80004920:	fffff097          	auipc	ra,0xfffff
    80004924:	b3c080e7          	jalr	-1220(ra) # 8000345c <console_write>
    80004928:	01813083          	ld	ra,24(sp)
    8000492c:	01013403          	ld	s0,16(sp)
    80004930:	02010113          	addi	sp,sp,32
    80004934:	00008067          	ret

0000000080004938 <__getc>:
    80004938:	fe010113          	addi	sp,sp,-32
    8000493c:	00813823          	sd	s0,16(sp)
    80004940:	00113c23          	sd	ra,24(sp)
    80004944:	02010413          	addi	s0,sp,32
    80004948:	fe840593          	addi	a1,s0,-24
    8000494c:	00100613          	li	a2,1
    80004950:	00000513          	li	a0,0
    80004954:	fffff097          	auipc	ra,0xfffff
    80004958:	ae8080e7          	jalr	-1304(ra) # 8000343c <console_read>
    8000495c:	fe844503          	lbu	a0,-24(s0)
    80004960:	01813083          	ld	ra,24(sp)
    80004964:	01013403          	ld	s0,16(sp)
    80004968:	02010113          	addi	sp,sp,32
    8000496c:	00008067          	ret

0000000080004970 <console_handler>:
    80004970:	fe010113          	addi	sp,sp,-32
    80004974:	00813823          	sd	s0,16(sp)
    80004978:	00113c23          	sd	ra,24(sp)
    8000497c:	00913423          	sd	s1,8(sp)
    80004980:	02010413          	addi	s0,sp,32
    80004984:	14202773          	csrr	a4,scause
    80004988:	100027f3          	csrr	a5,sstatus
    8000498c:	0027f793          	andi	a5,a5,2
    80004990:	06079e63          	bnez	a5,80004a0c <console_handler+0x9c>
    80004994:	00074c63          	bltz	a4,800049ac <console_handler+0x3c>
    80004998:	01813083          	ld	ra,24(sp)
    8000499c:	01013403          	ld	s0,16(sp)
    800049a0:	00813483          	ld	s1,8(sp)
    800049a4:	02010113          	addi	sp,sp,32
    800049a8:	00008067          	ret
    800049ac:	0ff77713          	andi	a4,a4,255
    800049b0:	00900793          	li	a5,9
    800049b4:	fef712e3          	bne	a4,a5,80004998 <console_handler+0x28>
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	6dc080e7          	jalr	1756(ra) # 80003094 <plic_claim>
    800049c0:	00a00793          	li	a5,10
    800049c4:	00050493          	mv	s1,a0
    800049c8:	02f50c63          	beq	a0,a5,80004a00 <console_handler+0x90>
    800049cc:	fc0506e3          	beqz	a0,80004998 <console_handler+0x28>
    800049d0:	00050593          	mv	a1,a0
    800049d4:	00001517          	auipc	a0,0x1
    800049d8:	91450513          	addi	a0,a0,-1772 # 800052e8 <CONSOLE_STATUS+0x2d8>
    800049dc:	fffff097          	auipc	ra,0xfffff
    800049e0:	afc080e7          	jalr	-1284(ra) # 800034d8 <__printf>
    800049e4:	01013403          	ld	s0,16(sp)
    800049e8:	01813083          	ld	ra,24(sp)
    800049ec:	00048513          	mv	a0,s1
    800049f0:	00813483          	ld	s1,8(sp)
    800049f4:	02010113          	addi	sp,sp,32
    800049f8:	ffffe317          	auipc	t1,0xffffe
    800049fc:	6d430067          	jr	1748(t1) # 800030cc <plic_complete>
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	3e0080e7          	jalr	992(ra) # 80003de0 <uartintr>
    80004a08:	fddff06f          	j	800049e4 <console_handler+0x74>
    80004a0c:	00001517          	auipc	a0,0x1
    80004a10:	9dc50513          	addi	a0,a0,-1572 # 800053e8 <digits+0x78>
    80004a14:	fffff097          	auipc	ra,0xfffff
    80004a18:	a68080e7          	jalr	-1432(ra) # 8000347c <panic>
	...
