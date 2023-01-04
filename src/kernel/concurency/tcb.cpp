#include"../../../h/kernel_lib.h"


TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
TCB* TCB::kernelThread = nullptr;
int TCB::threadsUp = 0;
TCB::Context TCB::panicContext;
ObjectCache* TCB::cache = nullptr;
void Riscv::popSppSpie() 
{
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

TCB* TCB::createThread(Body body, void* args, uint64* stack)
{
    return new TCB(body, args, stack);
}

TCB::TCB(TCB::Body bbody, void* aargs, uint64* sstack, uint64 ttimeSlice):
next(nullptr), sleep_time(0),body(bbody), args(aargs), stack(sstack),
timeSlice(ttimeSlice), state(READY), deleteOnEnd(false),userMode(true), locked(false),
context({(uint64) &threadWrapper, stack ? (uint64)((char*)stack+DEFAULT_STACK_SIZE) : 0})
{    
    if(body && stack){
        Scheduler::put(this);
        threadsUp++;
    }
    // kprintString("TCB initalizing!\n");
    // KCHECKPRINT(this);
    // KCHECKPRINT(stack);
}   

void TCB::yield()
{
    Riscv::pushRegisters();
    dispatch();
    Riscv::popRegisters();
}

void TCB::initalize(){
    if(running->userMode){
        //Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
        running->setState(PREPARING);
    }
    else {
        if(running->locked)
            Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
        else
            Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    }   
    Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
}

void TCB::threadWrapper()
{
    //print("start of thread", (uint64)TCB::running, 0);
    initalize();
    Riscv::popSppSpie();
    //__asm__ volatile ("csrw sepc, %0" : : "r" (running->body) );
    //__asm__ volatile ("sret");
    running->body(running->args);
    thread_exit();
}

void TCB::dispatch()
{
    //Scheduler::print_queue();
    TCB* oldRunning = running;
    
    if(oldRunning->isFinished())
    {
        threadsUp--;
        if(oldRunning->deleteOnEnd)
            delete oldRunning;
    }
    else if(!oldRunning->isSuspended())
    {
        Scheduler::put(oldRunning);
    }
    if(threadsUp <= 2 && StdIO::obuffer->tmpLen == 0) endKernel();
    
    running = Scheduler::get(); 
    contextSwitch(&oldRunning->context, &running->context); 
}

void TCB::deleteThread(TCB* t)
{
    if(t)
    {
        if(running != t && t->isFinished())
        {
            delete t;
        }
        else
        {
            t->deleteOnEnd = true;
        }        
    }
}

void TCB::sleep(time_t t)
{
    running->setState(SLEEPING);
    Scheduler::put_sleeper(running, t);
    TCB::yield(); 
}

TCB* TCB::createMainKernelThread()
{
    if(!kernelThread)
    {    
        kernelThread = createThread(nullptr);
        kernelThread->setKernelMode();
        kernelThread->setKernelLocked();
        kernelThread->setState(BLOCKED);
    }
    running = kernelThread;
    return kernelThread;
}

int TCB::endKernel()
{
    if(kernelThread)
    {
        Scheduler::put_front(kernelThread);
        kernelThread = nullptr;
        TCB::dispatch();
    }
    return -1;

    
}

void TCB::setPanicContext(uint64 ra, uint64 sp)
{
    panicContext.ra = ra;
    panicContext.sp = sp;
}

void TCB::panicDispatch()
{
    contextSwitch(&running->context, &panicContext);
}

void* TCB::operator new(size_t sz){ 
    if(!cache){
        cache = new ObjectCache("tcb_cache", sz, nullptr, nullptr); 
    }
    return cache->alloc_obj();
} 
void* TCB::operator new[](size_t sz){ 
    return SlabAllocator::getInstance().kmalloc(sz);
} 
void TCB::operator delete(void* ptr){ 
    // kprintString("TCB dealloc!\n");
    cache->free_obj(ptr);
} 
void TCB::operator delete[](void* ptr){
    SlabAllocator::getInstance().kfree(ptr);
}