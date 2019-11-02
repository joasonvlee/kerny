[bits 32] ; Tell NASM to generate the following as 32-bit executable code

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_pm:
    pusha ; Store (push) registers to stack
    mov edx, VIDEO_MEMORY ; Set EDX to the start of video memory

print_pm_loop:
    mov al, [ebx] ;  Set AL to character on memory where EBX is pointing to
    mov ah, WHITE_ON_BLACK ; Store character attributes in AH
    cmp al, 0 ; Compare AL to 0, to check if string ended (end of the string is set to 0)
    je print_pm_end ; If AL == 0, exit printing loop

    mov [edx], ax ; Store character and attributes at character memory location

    add ebx, 1 ; Increase offset of the EBX register with 1
    add edx, 2 ; Increase offset of the EDX register with 2
    jmp print_pm_loop ; Execute printing instructions again (loop) for next character in the string

print_pm_end:
    popa ; Restore (pop) all registers from stack
    ret ; Return from Protected Mode printing function