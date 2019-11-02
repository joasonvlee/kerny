[bits 16] ; Tell NASM to generate the following as 16-bit executable code

print:
  pusha ; Store (push) registers to stack
  mov ah, 0x0e ; Select TTY Mode for BIOS printing interrupt

print_loop:
  mov al, [bx] ; Set AL to character on memory where BX is pointing to
  cmp al, 0 ; Compare AL to 0, to check if string ended (end of the string is set to 0)
  je print_end ; If AL == 0, exit printing loop

  int 0x10 ; Execute BIOS printing interrupt

  add bx, 1 ; Increase offset of the BX register with 1
  jmp print_loop ; Execute printing instructions again (loop) for next character in the string

print_end:
  popa ; Restore (pop) all registers from stack
  ret ; Return from printing function