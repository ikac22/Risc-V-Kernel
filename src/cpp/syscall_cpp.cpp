#include"../../h/syscall_cpp.hpp"

void* operator new(size_t sz){return mem_alloc(sz);}
void operator delete(void* ptr){mem_free(ptr);}

void* operator new[](size_t sz){return mem_alloc(sz);}
void operator delete[](void* ptr){mem_free(ptr);}

typedef void (*Body)(void*);

struct Wrap
{
    Body body;
    uint64 arg;
};

Thread::Thread(void (*body)(void*), void* arg)
{
    myHandle = (thread_t)(new Wrap{body, (uint64)arg});
    w = (Wrap*) myHandle;
}

void Thread::start(){
    if(myHandle)
    {
        Wrap* w = (Wrap*) myHandle;
        myHandle = nullptr;
        thread_create(&myHandle, w->body, (void*)(w->arg));    
        delete w;
    }
    else 
    {
        thread_create(&myHandle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    Thread* t = (Thread*)thread;
    t->run();
}

struct WrapPeriod
{
    PeriodicThread* thread;
    time_t period;
};

PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    WrapPeriod* wp = (WrapPeriod*)arg;
    while(true){
        wp->thread->periodicActivation();
        time_sleep(wp->period);
    }
}

