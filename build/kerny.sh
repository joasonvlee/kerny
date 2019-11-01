#!/bin/bash

sh ./build/build.sh
qemu-system-i386 ./boot/boot.bin