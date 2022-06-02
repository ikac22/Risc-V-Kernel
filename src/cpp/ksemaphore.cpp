#include"../../h/KInclude.hpp"

int KSemaphore::wait(){
    if(val > 0)
    {
        val--;
    }
    else
    {
        TCB::running->setState(TCB::BLOCKED);
        blocked.insert(TCB::running);
        
        TCB::yield();
        
        if(TCB::running->getState() != TCB::BLOCKED)
            return -2;
        TCB::running->setState(TCB::READY);
    }
    return 0;
}

int KSemaphore::signal()
{
    if(!blocked.isEmpty())
        Scheduler::put(blocked.remove());
    else
        val++;
    return 0;
}

KSemaphore::~KSemaphore()
{
    while(!blocked.isEmpty()){
        TCB* t = blocked.remove();
        t->setState(TCB::READY);
        Scheduler::put(t);
    }
}


