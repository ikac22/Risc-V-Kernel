#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"


void paging_test(){
    kprintString("--------PAGING TEST--------\n");

    kprintString("GETING PAGER iNSTANCE\n");
    Pager& pager = Pager::getInstance();
    kprintString("MAPPING KERNEL\n");
    pager.map_kernel();
    kprintString("PAGING BEGIN\n");
    //Riscv::mc_sie(Riscv::BitMaskSip::SIP_STIE);
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SIE);
    Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    kprintString("Moze li\n");
    pager.start_paging();
   
    for(int i = 0; i < 5; i++){
        KCHECKPRINT(i);
    }
    uint64* ptr = (uint64*) HEAP_END_ADDR - 40;
    pager.map(ptr, (void*)((uint64)ptr & ~0xFFF), 
        (PMTEntryBits) (PMTEntryBits::user | PMTEntryBits::write | PMTEntryBits::read)); 
    pager.print();
    //KCHECKPRINT(CONSOLE_RX_DATA);
    //pager.print();
    
    *ptr = 13;
    //KCHECKPRINT(*ptr);
    //KCHECKPRINT(ptr);
    
    kprintString("------PAGING TEST END------\n");
}
