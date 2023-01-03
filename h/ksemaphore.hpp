#ifndef __semaphore__
#define __semaphore__

#include"../h/ptr_queue.hpp"
#include "slab_allocator.h"

/* Class used to describe semaphore in kernel code */

class KSemaphore
{
    static ObjectCache* cache; 
public:
    //#include"../h/kernel_operators.hpp" /* allocation and deallocation */
    
    __SLAB_ALLOCATION__(KSemaphore, nullptr, nullptr)

    KSemaphore(unsigned val):val(val)
    {
        /* 
        *  Put semaphore on front 
        *  of the list of active semaphores
        */
        next = activeSemaphores; 
        activeSemaphores = this;
        
    }
    
    int wait(); /* classic wait method */
    
    int signal(); /* classic signal method */

    unsigned get_val() { return val; } 

    static int close(KSemaphore* sem); 
    
    static bool exists(KSemaphore* sem); /* test if semaphore exists in list of active */
    
    ~KSemaphore();

private:
    static KSemaphore* activeSemaphores; /* linked list of active semaphored */
    
    KSemaphore* next; /* next semaphore in list */

    unsigned val; /* value that represents how much threads can pass this semaphore */
    
    TcbQueue blocked; /* queue of threads that are blocked on this semaphore */
};

#endif