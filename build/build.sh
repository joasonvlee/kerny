#!/bin/bash

# Assemble boot code
cd ./boot
nasm -f bin boot.asm -o ../build/boot.bin
nasm kernel_entry.asm -f elf64 -o ../build/entry.o

# Compile kernel code
cd ../kernel
gcc -ffreestanding -c kernel.c -o ../build/kernel.o

# Link kernel with starting address set to 0x1000
ld -o ../build/kernel.bin -Ttext 0x1000 ../build/entry.o ../build/kernel.o --oformat binary

# Merch boot and kernel binary files
cd ../build
cat boot.bin kernel.bin > ../kerny.bin

# Clean up (binary and object) files
find . -type f -name '*.o' -delete
find . -type f -name '*.bin' -delete