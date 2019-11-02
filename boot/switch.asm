[bits 16] ; Tell NASM to generate the following as 16-bit executable code

pm_switch: ; Switch to 32-bit Protected Mode
    cli ; Let CPU ignore future interrupts, because they will be handled differently in 32-bit Protected Mode
    lgdt [gdt_descriptor] ; Tell CPU about the GDT by presenting the GDT descriptor
    mov eax, cr0 ; We can't directly set the value of special control register (CR0), so move values to EAX
    or eax, 1 ; Set value 1 bit in EAX without touching already present values in EAX
    mov cr0, eax ; Give CR0 the meant value so the CPU know we are switching to Protected Mode
    jmp CODE_SEGMENT:pm_init ; Make a far jump (jump to segment) to 32-bit code
                             ; This will also force the CPU to flush any 16-bit Real Mode related instructions

[bits 32] ; Tell NASM to generate the following as 32-bit executable code

pm_init: ; Update segment registers and stack following the switch to Protected Mode
    mov ax, DATA_SEGMENT ; Set AX to the starting address of our data segment (defined in GDT)
    mov ds, ax ; Set data segment register
    mov ss, ax ; Set stack segment register
    mov es, ax ; Set extra segment register
    mov fs, ax ; Set additional segment registers FS and GS
    mov gs, ax

    mov ebp, 0x90000 ; Set base pointer to the top of free-space (To 0x90000 instead of 0x9000)
    mov esp, ebp ; Set stack pointer to the same position

    call after_switch ; Call instructions to be executed after switch
