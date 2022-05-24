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

void mainWrapper(void*){
    userMain();
}

int main(){
    //init
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    size_t dssb = (DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1;

    print("sizeof(PtrQueue): ", sizeof(PtrQueue<TCB>), 0);
    print("sizeof(TCB): ", sizeof(TCB), 0);
    print("DEFAULT_STACK_SIZE_BLOCKS: ", dssb, 0);
    print("DEFAULT_TIME_SLICE: ", DEFAULT_TIME_SLICE, 0);

    //allocator.print_list();
    Scheduler::initalize();
    TCB *threads[5];
    //allocator.print_list();

   
    //mainThread
    threads[0] = TCB::createThread(nullptr);
    TCB::running = threads[0];
    //allocator.print_list();
    print("Thread0 adr:", (uint64)threads[0], 0);
    
    //firstThread
    threads[1] = TCB::createThread(workerBodyA, nullptr, (uint64*)allocator.mem_alloc(dssb));
    //allocator.print_list();
    print("Thread1 adr:", (uint64)threads[1], 0);
    //if(threads[1] != nullptr) print("ThreadA created\n");
    
    //secondThread
    threads[2] = TCB::createThread(workerBodyB, nullptr, (uint64*)allocator.mem_alloc(dssb));
    //allocator.print_list();
    print("Thread2 adr:", (uint64)threads[2], 0);
    //if(threads[2] != nullptr) print("ThreadB created\n");
    
    //thirdThread
    threads[3] = TCB::createThread(workerBodyC, nullptr, (uint64*)allocator.mem_alloc(dssb));
    //allocator.print_list();
    print("Thread3 adr:", (uint64)threads[3], 0);
    //if(threads[3] != nullptr) print("ThreadC created\n");

    //threads[4] = TCB::createThread(workerBodyD);
    //printString("ThreadD created\n");

    Riscv::w_stvec((uint64)interruptvec);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    while (!(threads[1]->isFinished() && threads[2]->isFinished() /*&&
             threads[3]->isFinished()*/)) {
        //print("vrtim se");
        print("deo kernela");
        thread_dispatch();
    }

    for(auto &thread: threads){MemoryAllocator::getInstance().mem_free(thread);}
    print("Kernel kraj");
    return 0;
}   