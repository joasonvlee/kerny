[bits 16] ; Tell NASM to generate the following as 16-bit executable code

read:
    mov ah, 0x02 ; BIOS reading interrupt sector parameter
    mov al, dh ; Read sector amount set in DH in boot-sector
    mov ch, 0 ; Read disk cylinder 0
    mov dh, 0 ; Select head 0 (1st side of disk)
    mov cl, 2 ; Start reading from second sector, after our boot-sector

    int 0x13 ; BIOS interrupt for reading disk

    ret ; Return to label executor