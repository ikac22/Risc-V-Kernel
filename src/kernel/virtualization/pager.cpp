#include"../../../h/kernel_lib.h"

Pager* Pager::p = nullptr;

Pager::Pager():pmt(nullptr){}

Pager& Pager::getInstance(){
    if(!p) p = new Pager();
    
    return *p;
}

int Pager::map(void *va, void *pa, PMTEntryBits flag){
   
    if(!pmt)
        pmt = PMT::allocate_pmt();
    
    PMT* curr = pmt;
    PMTEntry* pmte = curr->get_entry(2, va);
    
    for(int i = 2; i > 0; i--){
       
        if(!(pmte->chk_flags(PMTEntryBits::valid))){
            pmte->set_flags(PMTEntryBits::valid);
            pmte->set_pa(PMT::allocate_pmt());
        }
       
        curr = (PMT*)pmte->get_pa();
        
        pmte = curr->get_entry(i-1, va);
    }
    
    pmte->set_flags((PMTEntryBits)(PMTEntryBits::valid | flag));
    pmte->set_pa(pa);
    

    return 0;
}

int Pager::id_map(void* start, void* end, PMTEntryBits flag){
    uint64 ustart = (uint64) start, uend = (uint64) end;
    ustart = ustart & ~(0xfff);
    uint64 tmp = ustart;

    while(tmp < uend){
        map((void*)tmp, (void*)tmp, flag);
        tmp += PMT::PAGE_SIZE;    
    }

    return 0;
}

int Pager::map_kernel(){
    //uint64 laa = (uint64)NoAlloc::getEndAddress();
    uint64 laa = (uint64)HEAP_END_ADDR;
    uint64 fa = KERNEL_TEXT_START;
    
    //map_ram
    id_map((void*)fa, (void*)laa, (PMTEntryBits)
            (PMTEntryBits::write | PMTEntryBits::read | PMTEntryBits::execute ));

    // UART
	id_map((void*)0x10000000,
	        (void*)0x10000100,
	        (PMTEntryBits)
            (PMTEntryBits::write | PMTEntryBits::read )
	);

	// CLINT
	// id_map(
	//             (void*)0x02000000,
	//             (void*)0x0200ffff,
	//             (PMTEntryBits)
    //             (PMTEntryBits::write | PMTEntryBits::read)
	// );
	// PLIC
	id_map(
	            (void*)0x0c000000,
	            (void*)0x0c002001,
	            (PMTEntryBits)
                (PMTEntryBits::write | PMTEntryBits::read )
	);
	id_map(
	            (void*)0x0c200000,
	            (void*)0x0c208001,
	            (PMTEntryBits)
                (PMTEntryBits::write | PMTEntryBits::read )
	);


    return 0;        
}

int Pager::map_user(){
    id_map(
                (void*)USER_TEXT_START,
                (void*)USER_TEXT_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::execute | PMTEntryBits::user)
    );

    id_map(
                (void*)USER_BSS_START,
                (void*)USER_BSS_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
                (void*)USER_DATA_START,
                (void*)USER_DATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::write | PMTEntryBits::user)
    );

    id_map(
                (void*)USER_RODATA_START,
                (void*)USER_RODATA_END,
                (PMTEntryBits) (PMTEntryBits::read | PMTEntryBits::user)
    );
    return 0;
}

int Pager::start_paging(){
    if(!pmt)
        return 1;
    //Riscv::ms_sstatus(Riscv::BitMaskSstatus::SSTATUS_SUM);
    uint64 satp = (8ULL << 60) | ( (uint64)pmt >> 12);
    NoAlloc::turn_off();
    asm volatile("csrw satp, %0" : : "r" (satp));
    return 0;
}

void Pager::print(){
    int t = 0;
    if(pmt){
        t++;
        kprintString("--------LEVEL 0--------\n");
        pmt->print();
        for(size_t i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
            PMTEntry* en = pmt->get_entry(i);
            
            if(en->chk_flags(PMTEntryBits::valid)){
                t++;
                PMT* pmt1 = (PMT*)en->get_pa();
                kprintString("--------LEVEL 1--------\n");
                KCHECKPRINT(pmt1);
                pmt1->print();
                for(size_t  i = 0; i < PMT::PMT_LEVEL_SIZE; i++){
                    PMTEntry* en1 = pmt1->get_entry(i);

                    if(en1->chk_flags(PMTEntryBits::valid)){
                        t++;
                        PMT* pmt2 = (PMT*)en1->get_pa();
                        kprintString("--------LEVEL 2--------\n");
                        KCHECKPRINT(pmt2);
                        pmt2->print();
                    }
            
                }
            }
            
        }
    }
    kprintString("page_table_num: "); kprintInt(t); kprintString("\n");
    kprintString("page_table_size: "); kprintInt(sizeof(PMT)); kprintString("\n");
    kprintString("page_table_buddy_level: "); kprintInt(BUDDY_LEVEL(sizeof(PMT))); kprintString("\n"); 
}
