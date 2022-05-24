#ifndef __riscv__
#define __riscv__

#include"../lib/hw.h"

class Riscv{
public:
    
    static void w_scause(uint64);
    static uint64 r_scause(); 

    static void w_sepc(uint64);
    static uint64 r_sepc();
    static void ni_sepc();

    static void w_stvec(uint64);
    static uint64 r_stvec();
     
    static void w_stval(uint64);
    static uint64 r_stval();
    
    enum BitMaskSip{
        SIP_SSIE = (1<<1),
        SIP_STIE = (1<<5),
        SIP_SEIE = (1<<9),
    };

    static void ms_sip(uint64);
    static void mc_sip(uint64);

    static void w_sip(uint64);
    static uint64 r_sip();

    enum BitMaskSstatus{
        SSTATUS_SIE = (1<<1),
        SSTATUS_SPIE = (1<<5),
        SSTATUS_SPP = (1<<8),
    };

    static void ms_sstatus(uint64);
    static void mc_sstatus(uint64);

    static void w_sstatus(uint64);
    static uint64 r_sstatus();

    static uint64 r_a0();
    static uint64 s_a0(uint64 a0);
    static uint64 r_a1();
    static uint64 r_a2();
    static uint64 r_a3();
    static uint64 r_a4();

    static void popSppSpie();
};

inline uint64 Riscv::r_a0(){
    uint64 a0;
    asm volatile("mv %0, a0" : "=r" (a0));
    return a0;
}

inline uint64 Riscv::r_a1(){
    uint64 a0;
    asm volatile("mv %0, a1" : "=r" (a0));
    return a0;
}

inline uint64 Riscv::r_a2(){
    uint64 a0;
    asm volatile("mv %0, a2" : "=r" (a0));
    return a0;
}

inline uint64 Riscv::r_a3(){
    uint64 a0;
    asm volatile("mv %0, a3" : "=r" (a0));
    return a0;
}

inline uint64 Riscv::r_a4(){
    uint64 a0;
    asm volatile("mv %0, a4" : "=r" (a0));
    return a0;
}


inline uint64 Riscv::s_a0(uint64 a0){
    return a0;
}

inline void Riscv::w_scause(uint64 scause){
    asm volatile("csrw scause, %0" : : "r" (scause));
}

inline uint64 Riscv::r_scause(){
    uint64 volatile scause;
    asm volatile("csrr %0, scause" : "=r" (scause));
    return scause;
} 

inline void Riscv::w_sepc(uint64 sepc){
    asm volatile("csrw sepc, %0" : : "r" (sepc));
}

inline uint64 Riscv::r_sepc(){
    uint64 volatile sepc;
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    return sepc;
} 

inline void Riscv::w_stvec(uint64 stvec){
    asm volatile("csrw stvec, %0" : : "r" (stvec));
}

inline uint64 Riscv::r_stvec(){
    uint64 volatile stvec;
    asm volatile("csrr %0, stvec" : "=r" (stvec));
    return stvec;
} 

inline void Riscv::w_stval(uint64 stval){
    asm volatile("csrw stval, %0" : : "r" (stval));
}

inline uint64 Riscv::r_stval(){
    uint64 volatile stval;
    asm volatile("csrr %0, stval" : "=r" (stval));
    return stval;
} 

inline void Riscv::ms_sip(uint64 mask){
    asm volatile ("csrs sip, %0" : : "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
    asm volatile ("csrc sip, %0" : : "r" (mask));
}

inline void Riscv::w_sip(uint64 sip){
    asm volatile("csrw sip, %0" : : "r" (sip));
}

inline uint64 Riscv::r_sip(){
    uint64 volatile sip;
    asm volatile("csrr %0, sip" : "=r" (sip));
    return sip;
} 

inline void Riscv::ms_sstatus(uint64 mask){
    asm volatile ("csrs sstatus, %0" : : "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask){
    asm volatile ("csrc sstatus, %0" : : "r" (mask));
}

inline void Riscv::w_sstatus(uint64 sstatus){
    asm volatile("csrw sstatus, %0" : : "r" (sstatus));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    return sstatus;
} 

inline void Riscv::ni_sepc(){ //next instruction sepc
    uint64 s1;
    asm volatile("mv %0, s1" : "=r" (s1));

    asm volatile("csrr s1, sepc");
    asm volatile("addi s1, s1, 4");
    asm volatile("csrw sepc, s1");

    asm volatile("mv s1, %0" : : "r" (s1));
}



#endif