#include"../../../h/kernel_lib.h"
#include"../../../h/kernel_test.h"

void cache_alloc_test(ObjectCache** oc_arr,int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    kprintString("\n\n=============Object Cache Allocating=============\n\n");
    
    kprintString("Allocating "); kprintInt(size); kprintString(" caches!!\n");
    for(int i = 0; i < size; i++){
        oc_arr[i] = new ObjectCache("oc", objsize, nullptr, nullptr);
        KPRINTARR(oc_arr, i, oc_arr[i]);
        if(oc_arr == nullptr){
            kprintString("Not enough memory left!\n");
            return;
        }
        oc_arr[i]->printInfo(flags);
        kprintString("\n");
    
    }
    SlabAl::getInstance().print_state(flags);

    kprintString("\n\n===========Object Cache Allocating End===========\n\n");
    
}




void cache_dealloc_test(ObjectCache** oc_arr, int size, char flags = Slab::pb_mask::FREE){
    kprintString("\n\n=============Object Cache Deallocating=============\n\n");
    
    for(int i = 0; i < size; i++){
        KPRINTARR(oc_arr, i, oc_arr[i]);
        if(oc_arr[i]){
            delete oc_arr[i];
            oc_arr[i] = 0;
        }
        else{
            kprintString("Given address not valid!\n");
            return;
        }
    }
    SlabAl::getInstance().print_state(flags);

    kprintString("\n\n===========Object Cache Dellocating End===========\n\n");
    
}




void kmalloc_test(void** buff_arr, int size, size_t objsize = 32, char flags = Slab::pb_mask::FREE){
    kprintString("\n\n=============SMALL MEMORY BUFFER ALLOC=============\n\n");
    
    for(int i = 0 ; i < size; i++){
        buff_arr[i] = SlabAllocator::getInstance().kmalloc(objsize);
        KPRINTARR(buff_arr, i, buff_arr[i]);
        if(buff_arr[i] == nullptr){
            kprintString("Not enough memory left!\n");
            return;
        }
    }
    SlabAl::getInstance().print_state(flags);
    kprintString("\n\n===========SMALL MEMORY BUFFER ALLOC END===========\n\n");
    
}



void kfree_test(void** buff_arr, int size, char flags = Slab::pb_mask::FREE){
    kprintString("\n\n=============SMALL MEMORY BUFFER DEALLOC=============\n\n");
    
    for(int i = 0; i < size; i++){
        if(!buff_arr[i]){
            kprintString("Invalid free address given!!");
            return;
        }
        KPRINTARR(buff_arr, i, buff_arr[i]);
        SlabAl::getInstance().kfree(buff_arr[i]);
    }
    SlabAl::getInstance().print_state(flags); 

    kprintString("\n\n===========SMALL MEMORY BUFFER DEALLOC END===========\n\n");
    
}



void slab_allocator_state_ceck(char flags = Slab::pb_mask::FREE){
    kprintString("\n\n=============Slab Allocator State Check=============\n\n");
    
    SlabAl::getInstance().print_state(flags);
    
    kprintString("\n\n===========Slab Allocator State Check End===========\n\n");
}



void cache_obj_alloc_test(void** object, int size, ObjectCache* cache, char flags){
    kprintString("\n\n=============Object Allocate Test=============\n\n");
    
    for(int i = 0; i < size; i++){
        object[i] = cache->alloc_obj();
        if(!object[i]){
            kprintString("Object not corresctly allocated!!\n");   
            return;
        }
        KPRINTARR(object, i, object[i]);
    }
    cache->printInfo(flags);
    slab_allocator_state_ceck(flags);

    kprintString("\n\n===========Object Allocate Test End===========\n\n");
    
}



void cache_obj_dealloca_test(void** object, int size, ObjectCache* cache, char flags){

    kprintString("\n\n=============Object Deallocate Test=============\n\n");
    
    for(int i = 0; i < size; i++){
        KPRINTARR(object, i, object[i]);
        
        if(!object[i]){
            kprintString("Invalid object address!\n");   
            return;
        }
        
        cache->free_obj(object[i]);
        
    }
    cache->printInfo(flags);
    slab_allocator_state_ceck(flags);

    kprintString("\n\n=============Object Dellocate Test End=============\n\n");
    
}


void ctor(void* ptr){
   
    *(KSemaphore*)ptr = KSemaphore(1);
}


void slab_test(){
    kprintString("\n\n--------SLAB TEST--------\n\n");
    
    kprintString("Slab Allocator init!\n");
    SlabAl::getInstance();
    
    // slab_allocator_state_ceck(Slab::pb_mask::ALLOC);
    
    char flagAllocFree = Slab::pb_mask::ALLOC | Slab::pb_mask::FREE;

     int size = 10;
     ObjectCache** oc = (ObjectCache**)NoAlloc::mem_alloc(size*sizeof(ObjectCache*));
     cache_alloc_test(oc, size, 32, flagAllocFree);

    //int obj_num = 20;
    KSemaphore* x[20];
    ObjectCache* semaphore_cache = new ObjectCache("ksemaphore_cache", sizeof(KSemaphore), ctor, nullptr);

    cache_obj_alloc_test((void**)x, 10, semaphore_cache, flagAllocFree);

    KCHECKPRINT(x[1]->get_val());
    KCHECKPRINT(x[8]->get_val());

    cache_dealloc_test(oc, size, flagAllocFree);

    // void* buff_arr[18];
    // kmalloc_test(buff_arr, 18, 256, flagAllocFree);
    // kfree_test(buff_arr, 17, flagAllocFree);

    
    
   
   
    kprintString("\n\n------SLAB TEST END------\n\n");


}