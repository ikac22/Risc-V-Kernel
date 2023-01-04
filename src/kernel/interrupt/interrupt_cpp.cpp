#include"../../../h/kernel_lib.h"

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
    II = 2,
    IR = 5,
    IW = 7,
    PFL = 13,
    PFI = 12,
    PFW = 15
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

volatile uint64 usrEcall(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4)
{
    uint64 sepc = Riscv::r_sepc()+4, sstatus = Riscv::r_sstatus(), ret = a0;

    if(a0 == MA){
        //mem_alloc
        ret = (uint64)MemoryAllocator::getInstance().mem_alloc(a1);
        //KCHECKPRINT(ret);
    }
    else if(a0 == MF)
    {
        //mem_free
        // KCHECKPRINT(a1);
        // MemoryAllocator::getInstance().print_all_list();
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
        // KCHECKPRINT(a1);
        TCB::deleteThread((TCB*)a1);
    }
    else if(a0 == SO)
    {
        uint64* t = (uint64*)a1;
        *t = (uint64)(new KSemaphore(a2));
        if(!(*t)) ret = -2;
        else ret = 0;
    }
    else if(a0 == SC)
    {
        KSemaphore* t = (KSemaphore*)a1;
        ret = KSemaphore::close(t);
    }
    else if(a0 == SW)
    {
        KSemaphore* t = (KSemaphore*)a1;
        if(KSemaphore::exists(t))
            ret = t->wait();
        else
            ret = -1;
    }
    else if(a0 == SS)
    {
        KSemaphore* t = (KSemaphore*)a1;
        if(KSemaphore::exists(t))
            ret = t->signal();
        else
            ret = -1;
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
    //static bool panic = 0;
    //KCHECKPRINT(scause);
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
    else if(scause == PFI){
        if(TCB::running->getState() == TCB::TCBState::PREPARING){
            TCB::running->setState(TCB::TCBState::READY);
            asm volatile("sd %0, 1 * 8(s0)" :: "r" (thread_exit));
            Riscv::mc_sstatus(Riscv::BitMaskSstatus::SSTATUS_SPP);
        }
    }
    else if(scause == PFL || scause == PFW){
        uint64 stval = Riscv::r_stval(), sepc = Riscv::r_sepc(),
            sstatus = Riscv::r_sstatus();
        if(sstatus & Riscv::BitMaskSstatus::SSTATUS_SPP){
            KCHECKPRINT(scause);
            KCHECKPRINT(sepc);
            KCHECKPRINT(stval);
            kprintString("PAGE FAULT\n");
            while(true);
        }
        else{
            MemoryAllocator& allocator = MemoryAllocator::getInstance();
            FreeSegment* fs = allocator.getFreeSegmentMeta((void*)stval);
            
            if(fs){
                Pager::getInstance().id_map(
                    fs->addr, 
                    (char*)fs->addr+fs->size, 
                    (PMTEntryBits)(PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
                );
            }
            else{
                KCHECKPRINT(scause);
                KCHECKPRINT(sepc);
                KCHECKPRINT(stval);
                while(true);
                
            }
        }
        
    }
    else if(scause == II || scause == IR || scause == IW)
    {
        //ilegalna instrukcija
        if(!TCB::running->isKernelThread())
        {
            uint64 stval;
            asm volatile("csrr %0, stval" : "=r" (stval));
            kprintString("\nERROR: Thread stopped due to unauthorised access!!\n");
            kprintString("SCAUSE: "); kprintInt(scause, 16); kprintString("\n"); 
            kprintString("SEPC: "); kprintInt(Riscv::r_sepc(),16); kprintString("\n");
            kprintString("STVAL: "); kprintInt(stval, 16); kprintString("\n\n");
            TCB::running->finish();
            TCB::dispatch();
        }
        else
        {
            kprintString("\nFATAL KERNEL ERROR: unauthorised access prompted!!\n");
            TCB::panicDispatch();
        }
    }
    else{
        KCHECKPRINT(scause);
        kprintString("GRESKA\n");
        while(1);

    }
                    
    
    //print(a4);
}