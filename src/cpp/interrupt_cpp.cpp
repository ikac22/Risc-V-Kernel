#include"../../h/testing.hpp"
#include"../../h/riscv.hpp"
#include"../../h/syscall_c.h"
#include"../../h/tcb.hpp"
void timer_handler(){
    

    //TODO: smanjivanje vremena spavanja threadova
    
    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
        //uint64 sip = Riscv::r_sip();
        volatile uint64 sstatus = Riscv::r_sstatus(),
        sepc = Riscv::r_sepc()/*, ra, sp*/;
        
        TCB::timeSliceCounter = 0;
        
        TCB::dispatch();

        Riscv::w_sstatus(sstatus);
        Riscv::w_sepc(sepc);
        //Riscv::w_sip(sip);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    return a0;
}

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){    
    volatile uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    if(a0 == 0x1){
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        
    }else if(a0 == 0x2){
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }else if(a0 == 0x11){
        //thread_create
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(*t) ret = 0;
        else ret = -1;
    }else if(a0 == 0x12){
        //thread_exit
        TCB::running->setFinished();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == 0x13){
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }else if(a0 == 0x69){
        //delete ha ndle
        TCB::deleteThread((TCB*)a1);
    }
    Riscv::w_sepc(sepc);
    return ret;
}

extern "C" void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4){
    /*uint64 a0_s = a0, a1_s = a1, 
        a2_s = a2, a3_s = a3, 
        a4_s = a4;*/  
    uint64 scause = Riscv::r_scause();
    static int t = 0;
    if(scause == 9){
        //ecall iz sistemskog rezima
        
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } else if(scause == 8){
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } else if(scause == 0x8000000000000009){
        //hardverski prekid
       console_handler();
    
    } else if(scause == 0x8000000000000001){
        //prekid od timera
        timer_handler();      
    
    }else if(scause == 2){
        if(t<5){
            print(scause);
            t++;
        }
    }else if(scause == 1){
        if(t<10){
            print(scause);
            t++;
        }
    }else{
        if(t<15){
            print(scause);
            t++;
        }
    }
}