#ifndef __riscv__
#define __riscv__

#include"../lib/hw.h"

class Riscv{
public:
/* 
--------------------SUPERVISOR REGISTERS--------------------    
*/
    static void w_scause(uint64);
    static uint64 r_scause(); 

    static void w_sepc(uint64);
    static uint64 r_sepc();
    static void ni_sepc();

    static void w_stvec(uint64);
    static uint64 r_stvec();
     
    static void w_stval(uint64);
    static uint64 r_stval();

    static void w_satp(uint64);
    static uint64 r_satp();
    
    enum BitMaskSip{
        SIP_SSIE = (1<<1),
        SIP_STIE = (1<<5),
        SIP_SEIE = (1<<9),
    };

    static void ms_sip(uint64);
    static void mc_sip(uint64);

    static void w_sip(uint64);
    static uint64 r_sip();

    static void ms_sie(uint64);
    static void mc_sie(uint64);

    static void w_sie(uint64);
    static uint64 r_sie();

    enum BitMaskSstatus{
        SSTATUS_SIE = (1<<1),
        SSTATUS_SPIE = (1<<5),
        SSTATUS_SPP = (1<<8),
        SSTATUS_SUM = (1<<18),
    };

    static void ms_sstatus(uint64);
    static void mc_sstatus(uint64);

    static void w_sstatus(uint64);
    static uint64 r_sstatus();

/* 
--------------------CLASSIC REGISTERS--------------------    
*/
    static uint64 r_sp();
    static uint64 r_a0(); /* parameter registers */
    static uint64 s_a0(uint64 a0);
    static uint64 r_a1();
    static uint64 r_a2();
    static uint64 r_a3();
    static uint64 r_a4();

    static void popRegisters(); /* pop all context registers */
    static void pushRegisters(); /* push all context registers */
 
    static void popSppSpie(); /* jump from kernel to start of thread */

/* 
--------------------CONSOLE REGISTERS--------------------    
*/
    static void mc_cstatus(uint64 mask); 
    static bool cstatus_ready(uint64 mask);
};

/* 
--------------------CLASSIC REGISTERS--------------------    
*/

inline uint64 Riscv::r_sp(){
    uint64 a0;
    asm volatile("mv %0, sp" : "=r" (a0));
    return a0;
}

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

/* 
--------------------SUPERVISOR REGISTERS--------------------    
*/

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

inline void Riscv::ms_sie(uint64 mask){
    asm volatile ("csrs sie, %0" : : "r" (mask));
}

inline void Riscv::mc_sie(uint64 mask){
    asm volatile ("csrc sie, %0" : : "r" (mask));
}

inline void Riscv::w_sie(uint64 sie){
    asm volatile("csrw sie, %0" : : "r" (sie));
}

inline uint64 Riscv::r_sie(){
    uint64 volatile sie;
    asm volatile("csrr %0, sie" : "=r" (sie));
    return sie;
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

inline void Riscv::w_satp(uint64 satp){
    asm volatile("csrw satp, %0" : : "r" (satp));
}
inline uint64 r_satp(){
    uint64 volatile satp;
    asm volatile("csrr %0, satp" : "=r" (satp));
    return satp;
}

/* 
--------------------CONSOLE REGISTERS--------------------    
*/

inline void Riscv::mc_cstatus(uint64 mask){ 
    uint64 iostatus;
    asm volatile("lb %[reg], (%[adr])" : [reg] "=r" (iostatus) : [adr] "r" (CONSOLE_STATUS) );
    if(iostatus & mask)
        iostatus ^= mask;
    asm volatile("wb %[reg], (%[adr])" :  : [reg] "r" (iostatus), [adr] "r" (CONSOLE_STATUS) );
}

inline bool Riscv::cstatus_ready(uint64 mask)
{
    uint64 iostatus;
    asm volatile("lb %[reg], (%[adr])" : [reg] "=r" (iostatus) : [adr] "r" (CONSOLE_STATUS) );
    return iostatus & mask;
}



#endif