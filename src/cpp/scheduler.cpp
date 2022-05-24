#include"../../h/scheduler.hpp"

PtrQueue<TCB>* Scheduler::queue = nullptr;

void Scheduler::initalize(){
    queue = new PtrQueue<TCB>();
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

