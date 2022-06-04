#ifndef _scheduler_
#define _scheduler_

#include"../lib/hw.h"
#include"../h/ptr_queue.hpp"

class Scheduler
{
public:  
    static void initalize();
    static TCB* get();
    static void put(TCB*);
    static void finalize();
    static void put_sleeper(TCB*, time_t);
    static void update_sleep();
    static void put_front(TCB* t) { queue.insertFront(t); }
    static void print_queue();
    static bool tcbQueueEmpty(){ return queue.isEmpty(); }
    static int getQueueSize() { return queue.length(); }
private:
    static int cmp(TCB*, TCB*);
    static TcbQueue queue;
    static TcbQueue sleeping;
    
};


#endif