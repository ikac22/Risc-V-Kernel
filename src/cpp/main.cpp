#include "../../h/testing.hpp"
#include"../../h/riscv.hpp"
#include "../../h/tcb.hpp"
#include "../../h/syscall_c.h"
#include"../../h/scheduler.hpp"
#include"../../test/printing.hpp"
#include "../../h/stdio.hpp"

extern "C" void interruptvec();

extern void userMain();

void userMainWrapper(void*){
    userMain();
}

void idleFunction(void*){
    while(1){
        thread_dispatch();
    }
}

int main(){
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(TCB): ", sizeof(TCB), 0);
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    print("HEAP_START_ADDR", (uint64)HEAP_START_ADDR);
    print("HEAP_END_ADDR", (uint64)HEAP_END_ADDR);
    print("-------------------------------\n\n");
    
    print("kernelInit\n-------------------------------");
    Scheduler::initalize();
    print("Scheduler initalized");
    StdIO::initalize();
    print("StdIO initalized");
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    if(allocator.initalized()) print("Allocator initalized");
    else { 
        print("ERROR: allocator not initalized");
        return 0;
    }
    Riscv::w_stvec((uint64)interruptvec);
    print("stvec initalized");

    TCB* kernelThread, * userMainThread, * idleThread;

    print("Thread making...");
    //mainThread
    kernelThread = TCB::createThread(nullptr);
    TCB::running = kernelThread;
    if(kernelThread) print("KernelThread created");

    uint64* userMainStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    userMainThread = TCB::createThread(userMainWrapper, nullptr, userMainStack);
    if(userMainThread && userMainStack) print("UserMain thread created");

    uint64* idleThreadStack = (uint64*)kmalloc(DEFAULT_STACK_SIZE);
    idleThread = TCB::createThread(idleFunction, nullptr, idleThreadStack);
    if(idleThread && idleThreadStack)  print("Idle thread created");

    print("Scheduler queue", ' ');
    Scheduler::print_queue();
    print("-------------------------------\n\n");
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!userMainThread->isFinished())
    {
        //print("Kernel idle thread");
        uint64 sstatus = Riscv::r_sstatus();
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    print("Kernel kraj");
    return 0;
}   