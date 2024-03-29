#include"../../../h/kernel_lib.h"

namespace KSysCall{
    void thread_dispatch(){
        __asm__ volatile("mv a0, %0" : : "r" (0x13));
        __asm__ volatile("ecall");  
    }
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
        KSysCall::thread_dispatch();
    }
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
    /* CHECKING VALUES OF KERNEL STATIC VARIABLES */
    KCHECKPRINT(HEAP_START_ADDR);
    KCHECKPRINT(HEAP_END_ADDR);
    KCHECKPRINT(KERNEL_TEXT_START);
    KCHECKPRINT(KERNEL_TEXT_END);
    KCHECKPRINT(USER_TEXT_START);
    KCHECKPRINT(USER_TEXT_END);
    KCHECKPRINT(USER_BSS_START);
    KCHECKPRINT(USER_BSS_END);
    KCHECKPRINT(USER_DATA_START);
    KCHECKPRINT(USER_DATA_END);
    KCHECKPRINT(USER_RODATA_START);
    KCHECKPRINT(USER_RODATA_END);
    KCHECKPRINT(sizeof(PMT));
    kprintString("\n\n");

    /* INITALIZING MAIN KERNEL OBJECTS */
    NoAlloc::init();
    kprintString("NoAlloc initialized: ");
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());

    kprintString("Initializing kmem!!!\n");
    if(kmi()){
        kprintString("KMEM NOT SUCCESSFULLY INITIALIZED!!!\n");
        return 1;
    }
    kprintString("kmem initialized!!!\n");


    kprintString("Paging initialized!\n");
    Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    Pager& pager = Pager::getInstance();
    pager.map_kernel();
    pager.map_user();
    pager.start_paging();
    kprintString("Paging initialized!\n");

    Riscv::w_stvec((uint64)interruptvec); 
    kprintString("stvec initialized!\n");
    
    MemoryAllocator::getInstance().print_list();
    kprintString("MemoryAllocator initialized!\n");
    
    Scheduler::initalize();
    kprintString("Scheduler initialized!\n");
    
    StdIO::initalize();
    kprintString("StdIO initialized!\n");
    
    TCB::createMainKernelThread();
    kprintString("Main kenrel thread initialized!\n");

    kprintString("Initalizing user thread and idle thread...\n");
    uint64* userMainStack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    TCB* userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);

    uint64* idleThreadStack = (uint64*)SlabAllocator::getInstance().kmalloc(DEFAULT_STACK_SIZE);
    TCB* idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    idleThread->setKernelMode();
    if(userMainStack && idleThreadStack && idleThread && userMainThread)
        kprintString("Threads successfully initialized!\n");
    else
        return -1; /* EXCEPTION */
    kprintString("-----------KERNEL INITIALIZED-----------\n\n");

    return 0;
}

char kdigits[] = "0123456789ABCDEF";
void kprintInt(uint64 xx, int base, bool sgn){
    char buf[16];
    int i;
    if(sgn && base == 10){ 
        kputc('-');
        xx = -xx;
    }

    i = 0;
    do{
        buf[i++] = kdigits[xx % base];
    }while((xx /= base) != 0);
    
    while(--i >= 0)
        kputc(buf[i]);
}

int newKernelInit(){
    kprintString("--------------KERNEL INIT--------------\n");
    /* CHECKING VALUES OF KERNEL STATIC VARIABLES */
    KCHECKPRINT(HEAP_START_ADDR);
    KCHECKPRINT(HEAP_END_ADDR);
    KCHECKPRINT(KERNEL_TEXT_START);
    KCHECKPRINT(KERNEL_TEXT_END);
    KCHECKPRINT(USER_TEXT_START);
    KCHECKPRINT(USER_TEXT_END);
    KCHECKPRINT(sizeof(PMT));
    kprintString("\n\n");

    /* INITALIZING MAIN KERNEL OBJECTS */
    NoAlloc::init(); /* No Allocator init */ 
    kprintString("NoAlloc initialized: ");
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    

    kprintString("Initalizing kmem!!!\n");
    if(kmi()){
        kprintString("KMEM NOT SUCCESSFULLY INITIALIZED!!!\n");
        return 1;
    }
    KVALCHECKPRINT(NOALLOC_END_ADDR, NoAlloc::getEndAddress());
    /* Pager Init */
    kprintString("-----------KERNEL INITIALIZED-----------\n\n");
    return 0;
}

uint64 align4kb(uint64 input){
    return  (input + 4095ULL) & ( (~0ULL) << 12);
}


uint64 closest2pow(uint64 input){ 
    /* set start to 2^0 */
    uint64 i = 1; 

    /* iterate till i >= input */
    while ( i < input){ i <<= 1; }
    
    return i;
}

char log2(uint64 input){
    int t = 0;
    while(input > 1) {
        input >>= 1;
        t++;
    }
    return t;
}

bool osb(uint64 input){
    if (!input) return 0;
    return (input & (-input)) == input;
}

