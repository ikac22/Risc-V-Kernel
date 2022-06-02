#ifndef __tcb__h
#define __tcb__h

#include"../h/memory_allocator.hpp"

class KSemaphore;

class TCB{
    
public:
    //alokacija
    #include"../h/kernel_operators.hpp"
    
    using Body = void (*)(void*);
    enum TCBState{
        BLOCKED,
        READY,
        FINISHED,
        SLEEPING
    };
    
    ~TCB(){ 
        MemoryAllocator& allocator = MemoryAllocator::getInstance(); 
        if(!allocator.invalidFreeAddress(this))
            allocator.mem_free(stack);
    }
    
    //nestaticki metodi
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    void setKernelMode() { userMode = false; }
    void setKernelLocked() { locked = true; }

    //staticki metodi
    static TCB* createThread(Body, void* args = nullptr, uint64* stack = nullptr);
    static void yield(); 
    static void dispatch(); //potencijalna promena running niti
    static void deleteThread(TCB*);
    static void sleep(time_t);
    
    //struktura
    struct Context{
        uint64 ra, sp;
    };
    
    static uint64 timeSliceCounter;
    static TCB* running;

    TCB* next;
    time_t sleep_time;
    KSemaphore* out_sem;

private:
    
    Body body;  
    void* args;
    uint64* stack, timeSlice;
    TCBState state;
    bool deleteOnEnd, userMode, locked;
    Context context;
    
    TCB(Body , void* , uint64* ,  uint64 ts = DEFAULT_TIME_SLICE);
    static void threadWrapper();
    static void contextSwitch(Context* oldContext, Context* newContext);
    static void initalize();
};

#endif