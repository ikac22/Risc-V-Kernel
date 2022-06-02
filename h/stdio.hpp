#ifndef __stdio_hpp__
#define __stdio_hpp__

#include"../h/shared_buffer.hpp"
#include "tcb.hpp"

struct ORequest{
    char c;
    KSemaphore* s;   
};

class StdIO{

private:
    static unsigned char* iostatus;
    static char* idata, *odata;
    static KSemaphore* blockSem;
public:
    

    static void initalize();
    static void outputWorker(void*);
    static void inputWorker();
    static void console_handler();
    static bool input_ready(){ return *iostatus & CONSOLE_RX_STATUS_BIT; } 
    static bool output_ready() { return *iostatus & CONSOLE_TX_STATUS_BIT; }
    static TCB* out_thread;
    static SharedBuffer<char>* ibuffer;
    static SharedBuffer<char>* obuffer;
    
};

#endif