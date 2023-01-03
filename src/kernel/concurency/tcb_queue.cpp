#include"../../../h/kernel_lib.h"

ObjectCache* TcbQueue::cache = nullptr;

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
    tmpNum++;
    return *this;
}
   
TCB* TcbQueue::remove(){
    if(head!=nullptr){
        TCB* ret = head;
        head = head==tail?(tail = nullptr):head->next;
        ret->next = nullptr;
        tmpNum--;
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
        kprintString("-> ");
        kprintInt((uint64)t);
        kprintString("\n");
        t = t->next;            
    }
    kprintString("\n");
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
    tmpNum++;
}

void TcbQueue::insertFront(TCB* info){
    info->next = head;
    head = head==nullptr?(tail = info):info;
    tmpNum++;
}