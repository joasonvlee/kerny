#!/bin/bash

# Assembly and test boot-sector
cd ./boot
nasm -f bin boot.asm -o boot.bin