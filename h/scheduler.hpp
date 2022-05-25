#ifndef _scheduler_
#define _scheduler_

#include"../h/ptr_queue.hpp"
#include"../h/tcb.hpp"

class Scheduler{
public:  
    struct slpTCB{
        #include"../h/kernel_operators.hpp"
        time_t time;
        TCB* tcb;
        slpTCB(time_t time, TCB* tcb):time(time), tcb(tcb){}
    };
    static void initalize();
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();

    static void print_queue();
private:
    static int cmp(slpTCB*, slpTCB*);
    static PtrQueue<TCB>* queue;
    static PtrQueue<slpTCB>* sleeping;
};

#endif