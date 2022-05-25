#ifndef __semaphore__
#define __semaphore__

#include"../h/memory_allocator.hpp"
#include"../h/tcb.hpp"
#include "ptr_queue.hpp"

class KSemaphore{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    int wait();
    void signal();
    ~KSemaphore();
private:
    unsigned val;
    PtrQueue<TCB> blocked;
};

#endif