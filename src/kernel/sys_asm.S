.global mem_alloc
.global mem_free
.global thread_dispatch
.global thread_create
.global thread_exit

.global KERNEL_TEXT_START
KERNEL_TEXT_START: .dword _kernel_text_start

.global KERNEL_TEXT_END
KERNEL_TEXT_END: .dword _kernel_text_end

.global USER_TEXT_START
USER_TEXT_START: .dword _user_text_start

.global USER_TEXT_END
USER_TEXT_END: .dword _user_text_end

