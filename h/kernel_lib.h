#ifndef ___kernel_lib___
#define ___kernel_lib___

#include"../h/ptr_queue.hpp"
#include"../h/riscv.hpp"
#include"../h/syscall_cpp.hpp"
#include"../h/tcb.hpp"
#include"../h/ksemaphore.hpp"
#include"../h/stdio.hpp"
#include"../h/scheduler.hpp"
#include"../h/memory_allocator.hpp"
#include"../h/kernel_funs.h"

extern "C" uint64 KERNEL_TEXT_START;
extern "C" uint64 KERNEL_TEXT_END;
extern "C" uint64 USER_TEXT_START;
extern "C" uint64 USER_TEXT_END;

#endif 