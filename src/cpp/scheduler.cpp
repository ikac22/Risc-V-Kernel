#include"../../h/scheduler.hpp"

PtrQueue<TCB>* Scheduler::queue = nullptr;
PtrQueue<Scheduler::slpTCB>* Scheduler::sleeping = nullptr;
void Scheduler::initalize(){
    if(!queue){
        queue = new PtrQueue<TCB>();}
    if(!sleeping){
        sleeping = new PtrQueue<slpTCB>();}
}

TCB* Scheduler::get(){
    return queue->remove();
}

void Scheduler::put(TCB* ptr){
    queue->insert(ptr);
}

void Scheduler::finalize(){
    if(queue) delete queue;
}

void Scheduler::print_queue(){
    queue->printQueue();
}

int Scheduler::cmp(slpTCB* x1, slpTCB* x2){
    time_t diff = x1->time-x2->time;
    if(diff>=0)
        x1->time = diff;
    return diff;
}

void Scheduler::put_sleeper(TCB* t, time_t time){

    sleeping->insertSorted(new slpTCB(time, t), cmp);
     
}