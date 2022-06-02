#ifndef _syscall_cpp
#define _syscall_cpp
#include "syscall_c.h"

void* operator new (size_t);
void operator delete (void*);
struct Wrap;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread (){ delete myHandle; }
    void start ();
    static void dispatch () { thread_dispatch(); }
    static void sleep (time_t time){ time_sleep(time); }
protected:
    Thread (){ myHandle = nullptr; this->w = nullptr;}
    virtual void run () {}
private:
    static void runWrapper(void*);
    thread_t myHandle;
    Wrap* w;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1) { sem_open(&myHandle, init); } 
    virtual ~Semaphore (){ sem_close(myHandle); }
    void wait (){ sem_wait(myHandle); }
    void signal (){ sem_signal(myHandle); }
private:
    sem_t myHandle;
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
private:
    static void periodicWrapper(void*);
};

class Console {
public:
    static char getc (){ return ::getc(); }
    static void putc (char c){ ::putc(c); }
};

#endif