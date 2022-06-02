#include"../../h/testing.hpp"
#include"../../lib/console.h"
#include"../../h/tcb.hpp"
#include"../../h/riscv.hpp"
#include"../../h/syscall_c.h"
#include"../../h/syscall_cpp.hpp"
#include"../../test/printing.hpp"

void print(uint64 unum, char end, bool hex){
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    char buffer[25];
    uint64 unum1 = unum;
    int i = 0;

    if(!hex){
    do{
        buffer[i++] = '0' + unum1%10;
        unum1/=10;
    }while(unum1 > 0);
    for(int j = i-1; j >= 0; j--)
        __putc(buffer[j]);
    }else{
    //__putc('\n');
    __putc('0');
    __putc('x');
    
    const char* numbers = "0123456789ABCDEF";
    unum1 = unum;
    i = 0;
    do{
        buffer[i++] = numbers[unum1%16];
        unum1/=16;
    } while(unum1 > 0);
    for(int j = i-1; j >= 0; j--)
        __putc(buffer[j]);
    }
    __putc(end);
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
}

void print(const char* str, char end){
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    for(int i = 0; str[i]; i++)
        __putc(str[i]);
    __putc(end);
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);

}

void print(const char* str, uint64 t, bool hex){
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    print(str, ' ');
    print(t, '\n', hex);
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
}

void* allocTest(MemoryAllocator& allocator, size_t size){
    print("\nAlokacija", ' ');
    print(size, ' ');
    print("blokova");
    char* newblc = (char*)allocator.mem_alloc(size);
    allocator.print_list();  
    return newblc;
}

void freeTest(MemoryAllocator& allocator, void* adr){
    print("\nDealogkacija");
    if(allocator.mem_free(adr) < 0)
        allocator.print_list();
    else
        print("Greska Pri Dealokaciji");
}

void memTest(){
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    allocator.print_list();

    mem_alloc(50);
    
    allocator.print_list();

    char* t = (char*)mem_alloc(100);
    print("t:", (uint64)t, 0);

    allocator.print_list();

    mem_alloc(300);

    allocator.print_list();
    
    print("free_res:", mem_free(t), 0);
    
    allocator.print_list();
}

void print_a0(){
    uint64 a0 = Riscv::r_a0();
    print("a0:", ' ');
    print(a0, '\n', 1);
    //asm volatile("mv a0, %0" : : "r" (a0));
}

void print_sup_registers(){ 

    print("sstatus:",' ');
    print(Riscv::r_sstatus(), '\n', 1);

    print("sip:",' ');
    print(Riscv::r_sip(), '\n', 1);

    print("stval:",' ');
    print(Riscv::r_stval(), '\n', 1);

    print("scause:",' ');
    print(Riscv::r_scause(), '\n', 1);
}

void* kmalloc(size_t size){
    size = (size-1)/MEM_BLOCK_SIZE + 1;
    return MemoryAllocator::getInstance().mem_alloc(size);
}

class PeriodicWorker:public PeriodicThread{
    int val;
public:
    PeriodicWorker(time_t period, int val):
    PeriodicThread(period){
        this->val = val;
    }
protected:
    void periodicActivation() override{
        printInt(val++);
        printString("\n");
    }
};

void testPeriodicWorker(){
    PeriodicWorker worker(10, 5);
    Semaphore sem(0);
    worker.start();
    sem.wait();
}