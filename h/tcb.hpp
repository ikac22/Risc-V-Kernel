#ifndef __tcb__h
#define __tcb__h

#include"../h/memory_allocator.hpp"
#include"../h/testing.hpp"
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
    
    //da li je thread zavrsen
    void setState(TCBState s) {state = s;}
    TCBState getState() const{ return state; }
    void finish() { state = FINISHED; }
    bool isFinished(){ return state == FINISHED; }
    uint64 getTimeSlice() const { return timeSlice; }
    bool isSuspended(){return state == BLOCKED || state == SLEEPING;}
    //staticki metodi
    static TCB* createThread(Body, void* args = nullptr, uint64* stack = nullptr);
    static void yield(); 
    static void dispatch(); //potencijalna promena running niti
    static void deleteThread(TCB*);
    static TCB* running;
    static uint64 timeSliceCounter;
    static void sleep(time_t);
    struct Context{
        uint64 ra, sp;
    };
    
private:
    Body body;  
    void* args;
    uint64* stack, timeSlice;
    TCBState state;
    bool deleteOnEnd;
    
    Context context;
    TCB(Body , void* , uint64* ,  uint64 ts = DEFAULT_TIME_SLICE);
    
    static void threadWrapper();
    static void contextSwitch(Context* oldContext, Context* newContext);
};

#endif