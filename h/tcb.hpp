#ifndef __tcb__h
#define __tcb__h

#include"../h/memory_allocator.hpp"

class TCB{
    
public:
    //alokacija
    #include"../h/kernel_operators.hpp"
    
    using Body = void (*)(void*);
    
    ~TCB(){  MemoryAllocator::getInstance().mem_free(stack); }
    
    //da li je thread zavrsen
    bool isFinished() const { return finished; }
    void setFinished() {finished = true;}
    
    uint64 getTimeSlice() { return timeSlice; }
    
    static TCB* createThread(Body, void* args = nullptr, uint64* stack = nullptr);

    //static void yield(); ?? da li implementirati
    
    static void dispatch(); //potencijalna promena running niti
    static void deleteThread(TCB*);
    static TCB* running;
    static uint64 timeSliceCounter;
    
    struct Context{
        uint64 ra, sp;
    };
    
    
private:
    Body body;  
    void* args;
    uint64* stack, timeSlice;
    bool finished, destruct;
    
    Context context;
    TCB(Body , void* , uint64* ,  uint64 ts = DEFAULT_TIME_SLICE);
    
    static void threadWrapper();
    static void contextSwitch(Context* oldContext, Context* newContext);
};

#endif