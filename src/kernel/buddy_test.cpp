#include"../../h/kernel_lib.h"
#include"../../h/kernel_test.h"

void* buddy_allocate_test(size_t s, bool a = false){
    kprintString("Buddy allocate: ");
    kprintInt(s);
    kprintString(" blocks\n");
    void* ret = Buddy::getInstance().mem_alloc(s);
    KVALCHECKPRINT(Returned address, ret);
    kprintString("\n");
    if(!ret)
        kprintString("BUDDY ALLOCATE ERROR\n");
    kprintString("\n");
    
    if(a) Buddy::getInstance().status_print();
    kprintString("\n");
    return ret;
}

int buddy_deallocate_test(void* s, bool a = false){
    kprintString("Buddy deallocate block on address: ");
    kprintInt((uint64)s, 16);
    kprintString("\n");
    int ret = Buddy::getInstance().mem_free(s);
    if(ret < 0){
        kprintString("BUDDY DEALLOCATE ERROR:");
        kprintInt((uint64)ret, 10, true);
        kprintString("\n");
    }
    kprintString("\n");
    if(a) Buddy::getInstance().status_print();
    kprintString("\n");
    return ret;
}

void buddy_test(){
    void* t = buddy_allocate_test(128);
    buddy_allocate_test(25);
    void* t1 = buddy_allocate_test(64);
    void* t2 = buddy_allocate_test(1);
    void* t2_bud = buddy_allocate_test(1);
    void* t3 = buddy_allocate_test(1);
    void* t3_bud = buddy_allocate_test(1, true);
    /* deallocate dont have buddy */
    buddy_deallocate_test(t);
    buddy_deallocate_test(nullptr);
    /* merge not-all */
    buddy_deallocate_test(t2,true);
    buddy_deallocate_test(t3,true);
    buddy_deallocate_test(t3_bud,true);
    buddy_deallocate_test(t2_bud,true);
    /* merge all (deallocate has buddy) */
    buddy_deallocate_test(t1, true);
    /* allocate all memory */
    t = buddy_allocate_test(4096);
    /* deallocate sub-block */
    buddy_deallocate_test(t1);
    /* try allocation if all memory is allocated */
    buddy_allocate_test(128);
    /* deallocate all memory */
    buddy_deallocate_test(t);
    /* deallocate memory not in range */
    buddy_deallocate_test((void*)((uint64)t + (Buddy::BLOCK_SIZE<<13)));
    /* allocate memory not in range */
    buddy_allocate_test(8192, true);


}