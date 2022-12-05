#include"../../h/kernel_lib.h"

void userMainWrapper(void*)
{
    userMain();
}

void idleFunction(void*)
{
    while(1){ 
        /* 
        *   Cannot swap thread_dispatch() sys_call for TCB::yield() because
        *   yeild must be atomic so we must call it in kernel locked mode
        *   but if we make this thread kernel locked and it becomes alone in scheduler 
        *   cpu will never get to the other threads because there will be no interruption. 
        *
        *   We could make preemptive kernel thread but that is a little bit harder.
        *   We must make INTERRUPTION LOCK FUNCTION (function that disables interrupts)  
        *   that will lock the thread when executing critical section code! TODO or NOT
        *    
        */
        thread_dispatch();
    }
}

void* kmalloc(size_t size)
{
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::getInstance().mem_alloc(size);
}

void kputc(char c){
    char* odata = (char*)CONSOLE_TX_DATA, 
    *iostatus = (char*)CONSOLE_STATUS;
    while(!(*iostatus & CONSOLE_TX_STATUS_BIT));
    *odata = c;
}

void kprintString(const char* string)
{
    if(!string) return;
    while(*string)
    {
        kputc(*string);
        string++;
    }
}

int kernelInit()
{
    kprintString("--------------KERNEL INIT--------------\n");
    kprintString("HEAP_START_ADDR: "); kprintInt((uint64)HEAP_START_ADDR,16); kprintString("\n");
    kprintString("HEAP_END_ADDR: "); kprintInt((uint64)HEAP_END_ADDR,16); kprintString("\n");
    kprintString("KERNEL_TEXT_START: "); kprintInt(KERNEL_TEXT_START,16); kprintString("\n");
    kprintString("KERNEL_TEXT_END: "); kprintInt(KERNEL_TEXT_END,16); kprintString("\n");
    kprintString("USER_TEXT_START: "); kprintInt(USER_TEXT_START,16); kprintString("\n");
    kprintString("USER_TEXT_END: "); kprintInt(USER_TEXT_END,16); kprintString("\n");

    Riscv::w_stvec((uint64)interruptvec);
    kprintString("stvec initalized!\n");
    MemoryAllocator::getInstance();
    kprintString("MemoryAllocator initalized!\n");
    Scheduler::initalize();
    kprintString("Scheduler initalized!\n");
    StdIO::initalize();
    kprintString("StdIO initalized!\n");
    TCB::createMainKernelThread();
    kprintString("Main kenrel thread initalized!\n");

    kprintString("Initalizing user thread and idle thread...\n");
    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);

    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    idleThread->setKernelMode();
    idleThread->setKernelLocked();
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
        kprintString("Threads successfully initalized!\n");
    else
        return -1;
    kprintString("-----------KERNEL INITALIZED-----------\n\n");

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base){
    switch(base){

    }
    char buf[16];
    int i;

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    
    while(--i >= 0)
        kputc(buf[i]);
}