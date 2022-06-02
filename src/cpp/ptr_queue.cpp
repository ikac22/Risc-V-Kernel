#include"../../h/ptr_queue.hpp"
#include"../../h/testing.hpp"
bool TcbQueue::exists(TCB* info) const 
{
    for(TCB* node = head; node; node = node->next)
    {
        if(node == info)
            return true;
    }
    return false;
}

TcbQueue& TcbQueue::insert(TCB* info)
{
    info->next = nullptr;
    tail = tail==nullptr?(head = info):(tail->next = info);
    return *this;
}
   
TCB* TcbQueue::remove(){
    if(head!=nullptr){
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
        ret->next = nullptr;
        return ret;            
    }
    return nullptr;
}

TCB* TcbQueue::top(){
    return head;
}

void TcbQueue::printQueue(){
    TCB* t = head;
    while(t){
        print("->",' ');
        print((uint64)t, ' ', 0);
        t = t->next;            
    }
    print("");
}
    
void TcbQueue::insertSorted(TCB* info, int(*cmp)(TCB*, TCB*)){
    TCB* prev = nullptr,* cur = head;
    while(cur && cmp(info, cur) >= 0){
        prev = cur;
        cur = cur->next;
    }
    if(!prev){
        info->next = head;
        head = head==nullptr?(tail = info):info; 
    }else{
        info->next = cur;
        prev->next = cur==nullptr?(tail=info):info;
    }
}

void TcbQueue::insertFront(TCB* info){
    info->next = head;
    head = head==nullptr?(tail = info):info;
}