#include"../../../h/kernel_lib.h"


ObjectCache::ObjectCache(const char* t_name, size_t t_objsize,
    void (*t_ctor)(void*), void(*t_dtor)(void*), SlabMetaType t_type)
        : name(t_name),objsize(t_objsize), free_head(nullptr)
        , part_head(nullptr), full_head(nullptr), node()
        , ctor(t_ctor), dtor(t_dtor)
{
    size_t lowest_size = Buddy::BLOCK_SIZE >> log2(Slab::RB_SIZE);
    if(objsize < lowest_size) objsize = lowest_size;
    
    type = t_type;
    if(t_type == NONE){ type = calculate_type(); }
}


ObjectCache::SlabMetaType ObjectCache::calculate_type(){
    size_t slab_size = get_slab_size();
    if( (slab_size - sizeof(void*))  % objsize >= sizeof(Slab))
        return ON_SLAB;
    else
        return OFF_SLAB;
    return NONE;
}



size_t ObjectCache::get_slab_size(uchar* buddy_level_ptr){
    uchar buddy_level = 
        type == BUFF_SLAB ?
        BUDDY_LEVEL(objsize) : BUDDY_LEVEL(objsize+sizeof(Slab*));

    if(buddy_level_ptr) *buddy_level_ptr = buddy_level;

    return ( 1UL << buddy_level) * Buddy::BLOCK_SIZE;
}



void* ObjectCache::operator new(size_t size){
    void* addr = SlabAl::getInstance().objcache_cache.alloc_obj();
    // SlabAl::getInstance().slab_cache.printInfo();
    return addr;
    
}



void ObjectCache::operator delete(void* addr){
    SlabAl::getInstance().objcache_cache.free_obj(addr);
}



Slab* ObjectCache::slab_alloc(){
    uchar obj_num, buddy_level; 
    char* tmp_addr,*start;
    size_t slab_size = get_slab_size(&buddy_level);
    
    Slab* slab_meta;
    obj_num = slab_size/objsize - 1;
    
    //allocate from buddy
    start = (char*)Buddy::getInstance().mem_alloc(buddy_level);

    if(!start){
        error = "Not enough memory left";
        return nullptr;
    }

    //allocate poniter to slab_meta_ptr
    Slab** slab_meta_addr_ptr = (Slab**)start;
    tmp_addr = start + sizeof(Slab*);
    
    
    ObjectCache* slab_cache_ptr = 
        &SlabAllocator::getInstance().slab_cache;
    

    switch(type){

        // if this is a small mememory buffer slab
        // then elements must start from the begining of the slab
        // then we allocate just like OFF_SLAB type
        case BUFF_SLAB:
            tmp_addr = start;
            obj_num += 1;


        // get slab_meta object from slab_meta cache
        case OFF_SLAB: 
            slab_meta = (Slab*)slab_cache_ptr->alloc_obj();
            break;

        
        // if it this is cache of slab_metas 
        // then alloc slab_meta on the star
        case SLAB_SLAB:
            slab_meta = (Slab*)tmp_addr;
            tmp_addr += sizeof(Slab);
            break;


        // allocate slab_meta on the slab if can fit
        // on the end of the slab
        case ON_SLAB:
            slab_meta = (Slab*)(start + slab_size - sizeof(Slab));
            break;

        case NONE: default: return nullptr;
    }
    if(type == SLAB_SLAB){ obj_num -= 1; }
    
    *slab_meta = Slab(obj_num
                ,tmp_addr
                ,this);

    if(type != BUFF_SLAB) { *slab_meta_addr_ptr = slab_meta; }
    
    free_head = insert(&slab_meta->node, free_head);
    
    // allocate objects
    char* end = start + slab_size;
    for(; tmp_addr + objsize <= end; tmp_addr += objsize){
        if(ctor)
            ctor(tmp_addr);
        else
            zero_out(tmp_addr);
    }
    
    return slab_meta;
}



void ObjectCache::list_update_alloc(Slab* slab_meta, bool was_free){
    if(slab_meta->full()){
        if(was_free)
            free_head = remove(free_head);
        else
            part_head = remove(part_head);
        full_head = insert(&(slab_meta->node), full_head);
    }
    else if(was_free){
        free_head = remove(free_head);
        part_head = insert(&(slab_meta->node), part_head);
    }
}



void* ObjectCache::alloc_obj(){ 
    bool was_free = false;
    Slab* t = nullptr;
    void* obj = nullptr;

    if(part_head){
        t = get_list_parent(part_head, Slab, node);
    }
    else {
        if(free_head){ 
            t = get_list_parent(free_head, Slab, node); 
        } else {  t = slab_alloc(); }
        was_free = true;
    }
    obj = t->get_obj();
    list_update_alloc(t, was_free);
    return obj;
}



void ObjectCache::list_update_free(Slab* slab_meta, bool was_full){
    
    if(slab_meta->free()){
        if(was_full){
            if(&slab_meta->node == full_head)
                full_head = remove(full_head);
            else
                remove(&slab_meta->node);
        }
        else{
            if(&slab_meta->node == part_head)
                part_head = remove(part_head);
            else
                remove(&slab_meta->node);
        }
        free_head = insert(&slab_meta->node, free_head);
    }else if(was_full){
        if(&slab_meta->node == full_head)
            full_head = remove(full_head);
        else
            remove(&slab_meta->node);
        part_head = insert(&slab_meta->node, part_head);
    }

}



Slab* ObjectCache::find_slab(void* addr, list_t* head){
    list_t* tmp = head;
    while(tmp){
        Slab* slab_meta = get_list_parent(tmp, Slab, node);
        if(slab_meta->contains(addr)) return slab_meta;
        tmp = tmp->next;
    }
    return 0;
}



int ObjectCache::free_obj(void* ptr){
    Slab* slab_meta = *(Slab**)((uint64)ptr & (-Buddy::BLOCK_SIZE));
    
    if(type == BUFF_SLAB){
        slab_meta = find_slab(ptr, part_head);
        
        if(!slab_meta)
            slab_meta = find_slab(ptr, full_head);
        
        if(!slab_meta){
             return 2;
        }
    }
    
    if(slab_meta->parent != this){
        error = "Dealocation failed: Object is not from specified cache!!";
        return 1;
    }
    bool was_full = slab_meta->full();
    int ind = slab_meta->put_obj(ptr);
    
    if(ind){
        error = "Deallocation failed: invalid deallocation address!";
        return ind;
    }else if(ctor)
        ctor(ptr);
    else 
        zero_out(ptr);
    
    list_update_free(slab_meta, was_full);
        
    return 0;
}




int ObjectCache::shrink(){
    if(!free_head){
        error = "No free slabs!";
        return 1;
    }
    while(free_head){
        Slab* slab = get_list_parent(free_head, Slab, node);
        free_head = remove(free_head);
        
        uchar buddy_level;
        get_slab_size(&buddy_level);

        Buddy::getInstance().mem_free(slab->addr_start, buddy_level);
        if(type == BUFF_SLAB || type == OFF_SLAB)
            SlabAllocator::getInstance().slab_cache.free_obj(slab);
    }
    return 0;
}




void ObjectCache::printInfo(char flags){
    kprintString("\n--------OBJCACHE ");kprintString(name); kprintString("--------\n");
   
     
    KCHECKPRINT(objsize);
    KVALCHECKPRINT(SLAB SIZE, get_slab_size());
    kprintString("SLAB TYPE: ");
    switch (type) {
        case NONE : kprintString("NONE\n");
        break;
        case OFF_SLAB : kprintString("OFF_SLAB\n");
        break;
        case SLAB_SLAB : kprintString("SLAB_SLAB\n");
        break;
        case ON_SLAB: kprintString("ON_SLAB\n");
        break;
        case BUFF_SLAB: kprintString("BUFF_SLAB\n");
        break;
    }
    kprintString("!!!!!!FREE SLAB LIST!!!!!! \n");
    list_t* tmp = free_head;
    while(tmp){
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
        kprintString("\n");
        tmp = tmp->next;
    }
    kprintString("!!!!!!PARTIAL SLAB LIST!!!!!! \n");
    tmp = part_head;
    while(tmp){
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
        kprintString("\n");
        tmp = tmp->next;
    }
    kprintString("!!!!!!FULL SLAB LIST!!!!!!\n");
    tmp = full_head;
    while(tmp){
        Slab* tmp_slab = get_list_parent(tmp, Slab, node);
        tmp_slab->print_info(flags);
        kprintString("\n");
        tmp = tmp->next;
    }
    kprintString("------OBJCACHE ");kprintString(name); kprintString(" END------\n\n");
    
}




void ObjectCache::zero_out(void* t){
    for( char* ptr = (char*)t; ptr < (char*)t + objsize; ptr++ )
        *ptr = 0;

}