#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

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
    kprintString("Starting User Process\n");
    TCB::yield();
    Riscv::w_sstatus(sstatus);
    

    kprintString("SRECNA NOVA GODINAAAA!!!!!");
    //kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    return 0;
}

int newKernelMain(){
    uint64 sp = Riscv::r_sp();
    KCHECKPRINT(sp);
    if(newKernelInit()){
        kprintString("KERNEL PANIC: KERNEL NOT SUCCESFULLY INITALIZED!!!\n");
        return 1;
    }   

    uint64 sstatus = Riscv::r_sstatus();
    TCB::yield();
    Riscv::w_sstatus(sstatus);

    // buddy_test();
    // slab_test();
    // paging_test();
    
    return 0;
}

int main(){
    return oldKernelMain();
}   