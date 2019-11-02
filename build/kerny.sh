#!/bin/bash

# Execute build script and emulate with Qemu
sh ./build/build.sh
qemu-system-i386 ./kerny.bin