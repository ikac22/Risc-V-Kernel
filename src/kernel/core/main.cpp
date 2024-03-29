#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"


extern "C" void kTestMain();

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
   
    // kTestMain(); // This function is for testing the kernel itself (Slab and Buddy Allocator KERNEL API)

    uint64 sstatus = Riscv::r_sstatus();
    kprintString("Starting User Process\n");
    TCB::yield();
    Riscv::w_sstatus(sstatus);
    

    kprintString("SRECNA NOVA GODINAAAA!!!!!\n\n");
    //kprintString("\n\nKERNEL ENDED SUCCESSFULLY!\n\n");
    return 0;
}

int newKernelMain(){
    uint64 ra, sp;
    asm volatile("mv %0, ra" : "=r" (ra));
    asm volatile("mv %0, sp" : "=r" (sp));
    TCB::setPanicContext(ra,sp);

    int panic = kernelInit();
    if(panic < 0){
        kprintString("\nKERNEL FAILED TO INITALIZE!!!!\n\n");
        return -1;
    }

    kTestMain();

    return 0;
}


int main(){
    return oldKernelMain();
    // return  newKernelMain();
}   