#include"../h/KInclude.hpp"

KSemaphore* KSemaphore::activeSemaphores = nullptr;

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

int KSemaphore::close(KSemaphore* sem)
{
    KSemaphore* prev = nullptr,* cur = activeSemaphores;
    while(cur)
    {
        if(cur == sem)
            break;
        prev = cur;
        cur = cur->next;
    }
    if(cur)
    {
        if(prev)
            prev->next = cur->next;
        else
            activeSemaphores = cur->next;
        cur->next = nullptr;
        delete cur;
        return 0;
    }
    else return -1;

}

bool KSemaphore::exists(KSemaphore* sem)
{
    KSemaphore* cur = activeSemaphores;
    while(cur)
    {
        if(cur == sem)
            return true;
        cur = cur->next;
    }
    return false;
}

