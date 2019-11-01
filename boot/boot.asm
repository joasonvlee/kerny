; Intel x86 boot process:
; - CPU starts executing BIOS instructions
; - BIOS runs checks and looks for bootable device that contains a boot-sector
; - BIOS starts executing boot-sector instructions in 16-bit Real Mode

[org 0x7c00] ; Tell NASM the boot-sector will be loaded into memory at address 0x7c00
             ; Address 0x7c00 is used to make sure the boot-sector won't be occupied by other memory
[bits 16] ; Tell NASM to generate the following as 16-bit executable code

mov bp, 0x9000 ; Set stack base pointer to free space, away from other memory
               ; The stack is a special region in memory (LIFO structure) for storing variables
mov sp, bp ; Set stack pointer to the same position
call pm_switch ; Call instructions for switching to Protected Mode
jmp $ ; Jump to current instruction (loop)

%include "gdt.asm"
%include "switch.asm"

[bits 32] ; Tell NASM to generate the following as 32-bit executable code

after_switch:
    jmp $ ; Jump to current instruction (loop)

times 510 - ($ - $$) db 0 ; Boot-sector should be 512 bytes in size
                          ; Fill up unused space up to the 510th byte with bytes containing zero's
dw 0xaa55 ; Mark boot-sector with the last two bytes, the magic numbers (0xaa and 0x55)