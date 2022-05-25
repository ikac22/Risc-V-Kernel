#include"../../h/ksemaphore.hpp"
#include"../../h/scheduler.hpp"
int KSemaphore::wait(){
    if(val > 0)
        val--;
    else{
        uint64 sstatus = Riscv::r_sstatus();
        TCB::running->setState(TCB::BLOCKED);
        blocked.insert(TCB::running);
        
        TCB::yield();
        
        Riscv::w_sstatus(sstatus);
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
    }
    return 0;
}

void KSemaphore::signal(){
    if(!blocked.isEmpty())
        Scheduler::put(blocked.remove());
    else
        val++;
}

KSemaphore::~KSemaphore(){
    while(!blocked.isEmpty()){
        TCB* t = blocked.remove();
        t->setState(TCB::READY);
        Scheduler::put(t);
    }
}


