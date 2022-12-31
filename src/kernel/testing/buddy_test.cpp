#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

void* buddy_allocate_test(uchar level, bool a = false){
    kprintString("Buddy allocate: 2^");
    kprintInt(level);
    kprintString(" blocks\n");
    void* ret = Buddy::getInstance().mem_alloc(level);
    KVALCHECKPRINT(Returned address, ret);
    kprintString("\n");
    if(!ret)
        kprintString("BUDDY ALLOCATE ERROR\n");
    kprintString("\n");
    
    if(a) Buddy::getInstance().status_print();
    kprintString("\n");
    return ret;
}

int buddy_deallocate_test(void* s, uchar level, bool a = false){
    kprintString("Buddy deallocate 2^"); 
    kprintInt(level);
    kprintString(" blocks on address: ");
    kprintInt((uint64)s, 16);
    kprintString("\n");
    int ret = Buddy::getInstance().mem_free(s, level);
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
    kprintString("--------BUDDY TEST--------\n");

    /* allocate deallocate */
    bool x = false;
    void* t = buddy_allocate_test(4, x);
    buddy_deallocate_test(t, 4, x);

    /* allocate errors */
    x = true;
    buddy_allocate_test(13);
    buddy_deallocate_test(t, 13);
    buddy_deallocate_test(nullptr, 2);

    kprintString("------BUDDY TEST END------\n");
}