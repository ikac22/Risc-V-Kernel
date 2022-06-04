void* operator new(size_t sz){return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1);}
void* operator new[](size_t sz){ return MemoryAllocator::getInstance().mem_alloc((sz-1)/MEM_BLOCK_SIZE + 1); }
void operator delete(void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}
void operator delete[](void* ptr){MemoryAllocator::getInstance().mem_free(ptr);}

/*
#interrupt.S-------------------------------------------------------------------------------------------

.globl interrupt
.globl interruptvec
.align 4
interruptvec:

    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\\index, \\index * 8(sp) 
    .endr

    call interrupt

    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\\index, \\index * 8(sp)
    .endr
    addi sp, sp, 256
    


    sret

#sys_asm.S-------------------------------------------------------------------------------------------
.global mem_alloc
.global mem_free
.global thread_dispatch
.global thread_create
.global thread_exit

#tcb_asm.S-------------------------------------------------------------------------------------------

.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)

    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)

    ret

#riscv_asm.S-------------------------------------------------------------------------------------------

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\\index, \\index * 8(sp)
    .endr
    ret

.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\\index, \\index * 8(sp)
    .endr
    addi sp, sp, 256
    ret

#lock.S-------------------------------------------------------------------------------------------

.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    bne t0, a1, fail       # Doesn’t match, so fail.
    sc.w t0, a2, (a0)      # Try to update.
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    li a0, 0               # Set return to success.
    jr ra                  # Return.
    fail:
    li a0, 1               # Set return to failure.
    jr ra                  # Return.
*/

/*
#!/bin/bash

PTH="/home/ikac/mnt/Fax/DrugaGodina/os1/projekat/zadatak/project/src/"
FILE="asmcode.asm"

rm $(find $PTH*.S)

while read p; do
    firstChar=${p:0:1}
    if [ "$firstChar" == "#" ] 
    then
        newFIle="${p%%-*}"
    else
        echo "$p" >> "$PTH${newFIle:1:50}"
    fi 
    
done < "$PTH$FILE"
*/