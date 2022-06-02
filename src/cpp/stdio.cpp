#include"../../h/stdio.hpp"
#include"../../h/scheduler.hpp"
#include"../../h/testing.hpp"
#define KLOCK() Riscv::mc_sstatus(Riscv::SSTATUS_SIE)
#define KUNLOCK() Riscv::ms_sstatus(Riscv::SSTATUS_SIE)



SharedBuffer<char>* StdIO::ibuffer = nullptr;
SharedBuffer<char>* StdIO::obuffer = nullptr;
KSemaphore* StdIO::blockSem = nullptr;
TCB* StdIO::out_thread = nullptr;
unsigned char* StdIO::iostatus = nullptr;
char* StdIO::idata = nullptr;
char* StdIO::odata = nullptr;

void StdIO::initalize()
{
    ibuffer = new SharedBuffer<char>();
    obuffer = new SharedBuffer<char>();
    print("obuffer:", (uint64)obuffer, 0);
    blockSem = new KSemaphore(0);
    iostatus = (unsigned char*)CONSOLE_STATUS;
    idata = (char*)CONSOLE_RX_DATA;
    odata = (char*)CONSOLE_TX_DATA;
    uint64* stack = (uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE-1)/MEM_BLOCK_SIZE + 1);
    out_thread = TCB::createThread(outputWorker, nullptr, stack);
    out_thread->setKernelMode();
    out_thread->setKernelLocked();
}

void StdIO::outputWorker(void *)
{
    
    out_thread = nullptr;

    while(true)
    {
        if(output_ready())
        {
            *odata = obuffer->get();
        }
        else
        {

            uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
            out_thread = TCB::running;

            TCB::yield();

            Riscv::w_sstatus(sstatus);
            Riscv::w_sepc(sepc);
        }

    }
    
}

void StdIO::inputWorker()
{

}

void StdIO::console_handler(){
    uint64 t = plic_claim();
    if(t == CONSOLE_IRQ)
    {
        
        if(input_ready())
        {
            char c = *idata;
            plic_complete(CONSOLE_IRQ);
            //__putc(c);
            if(ibuffer->tmpLen < SharedBuffer<char>::BUFFER_SIZE){
                ibuffer->put(c); 
            }

        }
        else
        {
            plic_complete(CONSOLE_IRQ);
            if(out_thread != nullptr)
            {
                uint64 sstatus = Riscv::r_sstatus(), sepc = Riscv::r_sepc();
                Scheduler::put_front(out_thread);

                TCB::yield();

                Riscv::w_sstatus(sstatus);
                Riscv::w_sepc(sepc);
            }
                
        }    
    }
    else
        plic_complete(t);
        
}