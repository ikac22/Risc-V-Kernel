#ifndef _LIST_H_
#define _LIST_H_
#define get_list_parent(list_ptr, parent_type, field_name) \
((parent_type *)( (char*)(list_ptr) - (char*)&( ((parent_type*)0) -> field_name ) ))

struct list_t{
    list_t* next, *prev;
    list_t(list_t* t_next=nullptr, list_t* t_prev=nullptr);
};

list_t* remove(list_t* head);
list_t* insert(list_t* node, list_t* head);

#endif