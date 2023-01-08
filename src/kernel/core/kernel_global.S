.global KERNEL_TEXT_START
KERNEL_TEXT_START: .dword _kernel_text_start

.global KERNEL_TEXT_END
KERNEL_TEXT_END: .dword _kernel_text_end

.global USER_TEXT_START
USER_TEXT_START: .dword _user_text_start

.global USER_TEXT_END
USER_TEXT_END: .dword _user_text_end

.global USER_BSS_START
USER_BSS_START: .dword _user_bss_start

.global USER_BSS_END
USER_BSS_END: .dword _user_bss_end

.global USER_DATA_START
USER_DATA_START: .dword _user_data_start

.global USER_DATA_END
USER_DATA_END: .dword _user_data_end

.global USER_RODATA_START
USER_RODATA_START: .dword _user_rodata_start

.global USER_RODATA_END
USER_RODATA_END: .dword _user_rodata_end

.global kTestMain

#---Slab Allocator---
