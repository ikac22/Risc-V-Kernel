#include"../h/kernel_lib.h"

int main(){
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    asm volatile("mv %0, sp" : "=r" (sp));
    TCB::setPanicContext(ra,sp);

    int panic = kernelInit();
    if(panic < 0){
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }
   
    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    Riscv::w_sstatus(sstatus);
    

    kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    return 0;
}   