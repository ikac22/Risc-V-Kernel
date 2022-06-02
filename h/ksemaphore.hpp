#ifndef __semaphore__
#define __semaphore__

#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val){}
    int wait();
    int signal();
    ~KSemaphore();
private:
    unsigned val;
    TcbQueue blocked;
};

#endif