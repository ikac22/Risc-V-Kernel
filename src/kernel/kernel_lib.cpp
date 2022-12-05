#include"../../h/kernel_lib.h"

void userMainWrapper(void*)
{
    userMain();
}

void idleFunction(void*)
{
    while(1){
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
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
        kprintString("Threads successfully initalized!\n");
    else
        return -1;
    kprintString("-----------KERNEL INITALIZED-----------\n\n");

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base){
    char buf[16];
    int i;

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);


    while(--i >= 0)
        kputc(buf[i]);
}