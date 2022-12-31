#include"../../../h/kernel_lib.h"

list_t::list_t(list_t* t_next, list_t* t_prev):next(t_next),prev(t_prev){}

list_t* remove(list_t* head){
    if(!head) return nullptr;

    if(head->next) head -> next -> prev = head -> prev;
    if(head->prev) head -> prev -> next = head -> next;
    list_t* node = head;
    head = head->next;
    node -> next = nullptr;
    node -> prev = nullptr;

    return head; 
}
list_t* insert(list_t* node, list_t* head){
    if(!node) return head;
    node->next = nullptr;
    node->prev = nullptr;

    node -> next = head;
    if(head){
        node -> prev = head->prev;
        if(head->prev) head->prev->next = node;
        head->prev = node;
    }
    return node;
}

