#include"../../h/KInclude.hpp"

enum sysCallNum
{
    MA = 0x1, 
    MF = 0x2,
    TC = 0x11,
    TE = 0x12,
    TD = 0x13,
    SO = 0x21,
    SC = 0x22,
    SW = 0x23,
    SS = 0x24,
    DTH = 0x69,
    TS = 0x31,
    GC = 0x41,
    PC = 0x42,     
};

enum intNum
{
    IH = 0x8000000000000009,
    IT = 0x8000000000000001,
    IS = 9,
    IU = 8,
};

void timer_handler()
{
    Scheduler::update_sleep();

    //uvecavanje vremena koriscenja procesora tekuceg thread
    TCB::timeSliceCounter++;
    
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    {
        uint64 sstatus = Riscv::r_sstatus(),
        sepc = Riscv::r_sepc();
        
        TCB::timeSliceCounter = 0;
        
        TCB::yield();

        Riscv::w_sstatus(sstatus);
        Riscv::w_sepc(sepc);
    } 

    
    Riscv::mc_sip(Riscv::SIP_SSIE);
}

uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;

    if(a0 == MA){
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
    }
    else if(a0 == MF)
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);

    }
    else if(a0 == TC)
    {
        //thread_create
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
    }
    else if(a0 == TD)
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0;
        TCB::yield();
    }
    else if(a0 == DTH)
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
    }
    else if(a0 == SC)
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
    }
    else if(a0 == SS)
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    {
        TCB::sleep(a1);
    }
    else if(a0 == GC)
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    {
        StdIO::obuffer->put((char)a1); 
    }
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    return ret;
}

uint64 sysEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{    
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;
    
    if(a0 == MA){
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);    
    }
    else if(a0 == MF)
    {
        //mem_free
        ret = (uint64)MemoryAllocator::getInstance().mem_free((void*)a1);
    
    }
    else if(a0 == TC)
    {
        //thread_create
        uint64* t = (uint64*)a1;
        *t = (uint64)TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4); 
        if(!(*t)) ret = -4;
        else ret = 0;
    }
    else if(a0 == TE)
    {
        //thread_exit
        TCB::running->finish();
        TCB::dispatch();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == TD)
    {
        //thread_dispatch
        TCB::timeSliceCounter = 0; 
        TCB::yield();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == DTH)
    {
        //delete thread handle
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
    }
    else if(a0 == SC)
    {
        KSemaphore* t = (KSemaphore*)a1;
        delete t;
    }
    else if(a0 == SW)
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = t->wait();
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == SS)
    {
        KSemaphore* t = (KSemaphore*)a1;
        t->signal();
    }
    else if(a0 == TS)
    {      
        TCB::sleep(a1);
        Riscv::w_sstatus(sstatus);
    }
    else if(a0 == GC)
    {
        ret = StdIO::ibuffer->get();
    }
    else if(a0 == PC)
    {
        StdIO::obuffer->put((char)a1);
    }
    Riscv::w_sepc(sepc);
    return ret;
}

extern "C" volatile  void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    uint64 scause = Riscv::r_scause();
    static int t = 0;

    if(scause == IS)
    {
        //ecall iz sistemskog rezima
        a0 = sysEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
    
    } 
    else if(scause == IU)
    {
        //ecall iz korisnickog rezima
        a0 = usrEcall(a0, a1, a2, a3, a4);
        asm volatile("sd %0, 10 * 8(s0)" :: "r" (a0));
        
    } 
    else if(scause == IH)
    {
        //hardverski prekid
       StdIO::console_handler();
    
    } 
    else if(scause == IT)
    {
        //prekid od timera
        timer_handler();      
    
    }
    else if(scause == 2)
    {
        if(t<5)
        {
            print(scause);
            t++;
        }
    }
    else if(scause == 1)
    {
        if(t<10)
        {
            print((uint64) Riscv::r_sepc());
            print(scause);
            t++;
        }
    }
    else
    {
        if(t<15)
        {
            Scheduler::print_queue();
            if(scause == 0x7)
            {
                //print((uint64) TCB::running, '\n', 0);
                
            }
            print((uint64) Riscv::r_sepc());
            print(scause);
            t++;
        }
    }
    //print(a4);
}