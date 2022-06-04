#ifndef __semaphore__
#define __semaphore__

#include"../h/ptr_queue.hpp"
class KSemaphore
{
public:
    #include"../h/kernel_operators.hpp"
    KSemaphore(unsigned val):val(val)
    {
        next = activeSemaphores;
        activeSemaphores = this;
    }
    int wait();
    int signal();
    static int close(KSemaphore* sem);
    static bool exists(KSemaphore* sem);
    ~KSemaphore();
private:
    static KSemaphore* activeSemaphores;
    KSemaphore* next;
    unsigned val;
    TcbQueue blocked;
};

#endif