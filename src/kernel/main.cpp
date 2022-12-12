#include"../../h/kernel_lib.h"
#include"../../h/kernel_test.h"

int oldKernelMain(){
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

int newKernelMain(){
    newKernelInit();
    buddy_test();
    return 0;
}

int main(){
    return newKernelMain();
}   