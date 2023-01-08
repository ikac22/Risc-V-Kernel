#ifndef ___kernel_lib___
#define ___kernel_lib___
#define KCHECKPRINT(name) \
kprintString(#name ": "); kprintInt((uint64) name,16); kprintString("\n")
#define KVALCHECKPRINT(name, val) \
kprintString(#name ": "); kprintInt((uint64) val,16); kprintString("\n")
#define KPRINTARR(name, i, val) \
kprintString(#name"["); kprintInt( i, 10); kprintString("]: "); \
kprintInt((uint64)val, 16); kprintString("\n")
/* this is the kernel header file that includes all kernel needed header files */

#include"../h/ptr_queue.hpp"
#include"../h/riscv.hpp"
#include"../h/syscall_cpp.hpp"
#include"../h/tcb.hpp"
#include"../h/ksemaphore.hpp"
#include"../h/stdio.hpp"
#include"../h/scheduler.hpp"
#include"../h/memory_allocator.hpp"
#include"../h/kernel_funs.h"
#include"../h/noalloc_allocator.hpp"
#include"../h/pmt.h"
#include"../h/pager.h"
#include"../h/buddy.h"
#include"../h/object_cache.h"
#include"../h/slab_allocator.h" 
#include"../h/list.h"
#include"../h/slab.h"

/* start address of Kernel */
static const size_t KERNEL_START_ADDR = 0x80000000; 

/* size of the frame in physical memory */
static const size_t FRAME_SIZE = 4096; 

/* kernel .text section start address*/
extern "C" uint64 KERNEL_TEXT_START; 

/* kernel .text section end address */
extern "C" uint64 KERNEL_TEXT_END; 

/* user .text section start address */
extern "C" uint64 USER_TEXT_START;

/* user .text section end address */
extern "C" uint64 USER_TEXT_END; 

extern "C" uint64 USER_BSS_START;

extern "C" uint64 USER_BSS_END;

extern "C" uint64 USER_DATA_START;

extern "C" uint64 USER_DATA_END;

extern "C" uint64 USER_RODATA_START;

extern "C" uint64 USER_RODATA_END;
#endif 