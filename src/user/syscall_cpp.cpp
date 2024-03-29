#include"../../h/syscall_cpp.hpp"
//#include"../test/printing.hpp"

void* operator new(size_t sz){return mem_alloc(sz);}
void operator delete(void* ptr){mem_free(ptr);}

void* operator new[](size_t sz){return mem_alloc(sz);}
void operator delete[](void* ptr){mem_free(ptr);}

typedef void (*Body)(void*);

struct _Wrap
{
    thread_t handle;
    Body body;
    void* arg;
};

Thread::Thread(void (*body)(void*), void* arg)
{
    myHandle = (thread_t)(new _Wrap{nullptr, body, arg});
}

int Thread::start(){
    if(myHandle)
    {
        _Wrap* w = (_Wrap*) myHandle;
        return thread_create(&w->handle, w->body, w->arg);    
    }
    else 
    {
        _Wrap* w = new _Wrap{nullptr, nullptr, nullptr};
        if(!w) return -7;
        myHandle = (thread_t)w;
        return thread_create(&w->handle, &runWrapper, this);   
    }
}

void Thread::runWrapper(void* thread)
{
    Thread* t = (Thread*)thread;
    t->run();
}

Thread::~Thread()
{
    _Wrap* w = (_Wrap*)myHandle;
    if(!w) return;
    if(w->handle){
        delete w->handle;
    }
    
    delete w;
}

struct _WrapPeriod
{
    PeriodicThread* thread;
    time_t period;
};

typedef void (PeriodicThread::*fun)();
PeriodicThread::PeriodicThread(time_t period):
Thread(periodicWrapper, new _WrapPeriod{this, period}){}

void PeriodicThread::periodicWrapper(void* arg){
    _WrapPeriod* wp = (_WrapPeriod*)arg;
    if(!wp) return;
    while(true){
        wp->thread->periodicActivation();
        time_sleep(wp->period);
    }
}

