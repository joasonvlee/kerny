; The Global Descriptor Table (GDT) defines the characteristics of memory areas used during program execution
; This is needed if we want to switch to 32-bit Protected Mode
; The memory areas are also called segments, where segment registers like CS and DS point to
; Memory segments are defined using 8-byte entries that contain a complex characteristic structure (descriptor)
; The GDT starts with the null descriptor entry.
; After the null descriptor, the entries of the code and data segment descriptor are defined
; Every descriptor contains a 32-bit base, a 20-bit limit, an access byte (8 bits) and flags (4 bits)
;
; Segment descriptor structure -> https://wiki.osdev.org/images/f/f3/GDT_Entry.png
; Segment descriptor access bits and flags structure -> https://wiki.osdev.org/images/6/68/Gdt_bits_fixed.png

gdt_start: ; Mark start of the GDT
    .null: ; Null descriptor
        dq 0 ; Fill up with 8 bytes of zero's
    .code: ; Code segment descriptor
        dw 0xffff ; Segment limit (16 bit part)
        dw 0 ; Segment base (16 bit part)
        db 0 ; Segment base (8 bit part)
        db 10011010b ; Segment 1st flags
        db 11001111b ; Segment 2nd flags + segment limit (4 bit part)
        db 0 ; Segment base (8 bit part)
    .data: ; Data segment descriptor
        dw 0xffff ; Segment limit (16 bit part)
        dw 0 ; Segment base (16 bit value)
        db 0 ; Segment base (4 bit value)
        db 10010010b ; Segment 1st flags
        db 11001111b ; Segment 2nd flags + segment limit (4 bit part)
        db 0 ; Segment base (8 bit value)
gdt_end: ; Mark end of GDT

gdt_descriptor: ; GDT descriptor defines GDT size (always 1 less) and the start of the GDT
    dw gdt_end - gdt_start - 1 ; Define the size of the GDT (16-bit value)
    dd gdt_start ; Define the start address of the GDT (32-bit value)

CODE_SEGMENT equ gdt_start.code - gdt_start ; GDT segment constants
DATA_SEGMENT equ gdt_start.data - gdt_start