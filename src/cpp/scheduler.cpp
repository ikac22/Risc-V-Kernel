#include"../../h/ptr_queue.hpp"
#include"../../h/tcb.hpp"
#include"../../h/scheduler.hpp"

TcbQueue Scheduler::queue;
TcbQueue Scheduler::sleeping;


TCB* Scheduler::get() { return queue.remove(); }

void Scheduler::put(TCB* ptr) { queue.insert(ptr); }

void Scheduler::initalize(){}

void Scheduler::finalize(){}

void Scheduler::print_queue() { queue.printQueue(); }

int Scheduler::cmp(TCB* x1, TCB* x2)
{
    int diff = (int)x1->sleep_time-(int)x2->sleep_time;
    if(diff>=0)
        x1->sleep_time = diff;
    else
        x2->sleep_time = -diff;
    return diff;
}

void Scheduler::put_sleeper(TCB* t, time_t time)
{
    t->sleep_time = time;
    sleeping.insertSorted(t, cmp);  
}

void Scheduler::update_sleep()
{
    TCB* t = sleeping.top();
    if(t == nullptr) return;
    t->sleep_time--;
    while(t && t->sleep_time == 0){
        sleeping.remove();
        
        t->setState(TCB::READY);
        put(t);
        
        t = sleeping.top();
    }
}