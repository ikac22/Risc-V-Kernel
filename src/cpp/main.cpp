#include "../../h/testing.hpp"
#include"../../h/riscv.hpp"
#include "../../h/tcb.hpp"
#include "../../h/syscall_c.h"
#include"../../h/scheduler.hpp"

extern "C" void interruptvec();

void userMain(){

}

void workerBodyA(void*) {
    for (uint64 i = 0; i < 10; i++) {
        print("A: i=", i, 0);
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            // TCB::yield();
        }
    }
}

void workerBodyB(void*) {
    for (uint64 i = 0; i < 16; i++) {
        print("B: i=", i, 0);
        if(i == 7) thread_exit();
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            // TCB::yield();
        }
    }
}

uint64 fibonacci(uint64 n) {
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyC(void*) {
    uint8 i = 0;
    for (; i < 3; i++) {
        print("C: i=", i, 0);
    }

    print("C: yield");
    __asm__ ("li t1, 7");
    thread_dispatch();

    uint64 t1 = 0;
    asm ("mv %0, t1" : "=r" (t1));

    print("C: t1=", t1, 0);

    uint64 result = fibonacci(12);
    print("C: fibonaci=", result, 0);

    for (; i < 6; i++) {
        print("C: i=", i, 0);
    }
//    TCB::yield();
}

void workerBodyD(void*) {
    uint8 i = 10;
    for (; i < 13; i++) {
        print("D: i=", i, 0);
    }

    print("D: yield");
    __asm__ ("li t1, 5");
    TCB::yield();

    uint64 result = fibonacci(16);
    print("D: fibonaci=", result, 0);

    for (; i < 16; i++) {
        print("D: i=", i, 0);
    }
//    TCB::yield();
}

void mainWrapper(void*){
    userMain();
}

int main(){
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(PtrQueue): ", sizeof(PtrQueue<TCB>), 0);
    print("sizeof(TCB): ", sizeof(TCB), 0);
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);
    print("-------------------------------\n\n");
    
    print("kernelInit\n-------------------------------");
    Scheduler::initalize();
    print("Scheduler initalized");
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    if(allocator.initalized()) print("Allocator initalized");
    else { 
        print("ERROR: allocator not initalized");
        return 0;
    }
    Riscv::w_stvec((uint64)interruptvec);
    print("stvec initalized");

    TCB* kernelThread;
    thread_t threads[5];
    for(int i = 0; i < 5; i++)
        threads[i] = nullptr;

    print("Thread making...");
    //mainThread
    kernelThread = TCB::createThread(nullptr);
    TCB::running = kernelThread;
    if(kernelThread) print("KernelThread created");

    
    int val = thread_create(&threads[1], workerBodyA, nullptr);
    if(!val && threads[1]) print("Thread A created");
    
    val = thread_create(&threads[2], workerBodyB, nullptr);
    if(!val && threads[2]) print("Thread B created");

    val = thread_create(&threads[3], workerBodyC, nullptr);
    if(!val && threads[3]) print("Thread C created");

    val = thread_create(&threads[4], workerBodyD, nullptr);
    if(!val && threads[4]) print("Thread D created");

    print("Scheduler queue", ' ');
    Scheduler::print_queue();
    print("-------------------------------\n\n");
    
    
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!(((TCB*)threads[1])->isFinished() && ((TCB*)threads[2])->isFinished() 
             && ((TCB*)threads[3])->isFinished() && ((TCB*)threads[4])->isFinished())) {
        //print("Kernel idle thread");
        thread_dispatch();
    }

    for(auto &thread: threads){ delete thread;}
    print("Kernel kraj");
    return 0;
}   