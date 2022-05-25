#include"../../h/tcb.hpp"
#include"../../h/scheduler.hpp"
#include"../../h/riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
void Riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

TCB* TCB::createThread(Body body, void* args, uint64* stack){
    return new TCB(body, args, stack);
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
body(bbody), args(aargs), stack(sstack), timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),
context({(uint64) &threadWrapper, stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0}){    
    if(body && stack)
        Scheduler::put(this);
}   

void TCB::yield(){
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::threadWrapper(){
    //print("start of thread", (uint64)TCB::running, 0);
    Riscv::popSppSpie();
    running->body(running->args);
    thread_exit();
}

void TCB::dispatch(){
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    if(!oldRunning->isFinished() && !oldRunning->isSuspended())
        Scheduler::put(oldRunning);
    else if(oldRunning->isFinished() && oldRunning->deleteOnEnd)
        delete oldRunning;
    running = Scheduler::get(); 
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t){
    if(t){
        if(running != t && t->isFinished())
            delete t;
        else{
            t->deleteOnEnd = true;
            t->finish();
        }        
    }
}

void TCB::sleep(time_t t){
    running->setState(SLEEPING);
    Scheduler::put_sleeper(running, t);
    TCB::yield(); 
}