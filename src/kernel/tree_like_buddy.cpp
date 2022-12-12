#include"../../h/kernel_lib.h"
#include"../../h/tree_like_buddy.h"
TreeLikeBuddy* TreeLikeBuddy::buddy = nullptr;
uchar TreeLikeBuddy::BLOCK_SIZE_BIT_LEN = 0;
TreeLikeBuddy::TreeLikeBuddy(void* saddr, size_t sz){
    /* --------Memory Meta Init-------- */
    mmeta_num = log2(sz) + 1;
    mmeta_s = (uint64*)NoAlloc::mem_alloc(mmeta_num * sizeof(uint64));
    if(!mmeta_s) { /* TODO: panic */ }
    mmeta = (alloc_t**) NoAlloc::mem_alloc(mmeta_num * sizeof(alloc_t*));
    if(!mmeta) { /* TODO: panic */ }
    for(uchar i = 0; i < mmeta_num; i++){
        mmeta_s[i] = 1ULL << (mmeta_num - i - 1);
        mmeta[i] = (alloc_t*) NoAlloc::mem_alloc(mmeta_s[i] * sizeof(alloc_t));
        if(!mmeta[i]) { /* TODO: panic */ }
        for(uint64 j = 0; j < mmeta_s[i]; j++)
            mmeta[i][j] = alloc_t::ALLOC; 
    }
    mmeta[mmeta_num - 1][0] = alloc_t::FREE;
}

void TreeLikeBuddy::status_print(){
    if(!buddy){
        kprintString("BUDDY NOT INITALIZED!!!");
        return;
    }
    kprintString("------BUDDY STATUS PRINT------\n");
    KCHECKPRINT(buddy);
    KCHECKPRINT(start_address);
    KCHECKPRINT(size);

    kprintString("\t------MEMORY META------\n");
    /**/
    kprintString("\t----END MEMORY META----\n");

    kprintString("-------END BUDDY STATUS-------\n");

}