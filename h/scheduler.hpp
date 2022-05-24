#ifndef _scheduler_
#define _scheduler_

#include"../h/ptr_queue.hpp"
#include"../h/tcb.hpp"

class Scheduler{
    static PtrQueue<TCB>* queue;

public:
    static void initalize();
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void print_queue();
};

#endif