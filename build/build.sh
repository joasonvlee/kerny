#!/usr/bin/env bash

QEMU_32=qemu-system-i386
QEMU_64=qemu-system-x86_64

# Assembly and test boot-sector
nasm -f bin boot/boot.asm -o boot/boot.bin
$QEMU_32 boot/boot.bin