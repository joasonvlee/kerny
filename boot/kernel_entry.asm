[bits 32] ; Tell NASM to generate the following as 32-bit executable code (we are in Protected Mode now)
[extern main] ; Tell NASM we will be using an outside label called 'main'
              ; The label 'main' is inside the kernel code, that the linker will give us

call main ; Call 'main' function in kernel code, so this will be executed first
jmp $ ; Jump to current instruction (loop), while the kernel is being executed