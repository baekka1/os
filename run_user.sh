#!/bin/bash
set -xue

# QEMU file path
QEMU=qemu-system-riscv32

OBJCOPY=/usr/bin/llvm-objcopy

# Path to clang and compiler flags
CC=clang
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -fuse-ld=lld -fno-stack-protector -ffreestanding -nostdlib"

# Build the kernel
#1. 
$CC $CFLAGS -Wl,-Tuser.ld -Wl,-Map=shell.map -o shell.elf shell.c user.c common.c

#2. 
$OBJCOPY --set-section-flags .bss=alloc,contents -O binary shell.elf shell.bin

#3.
$OBJCOPY -Ibinary -Oelf32-littleriscv shell.bin shell.bin.o

#4.# Build the kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
	kernel.c common.c shell.bin.o

# -machine virt: Starts a virt machine.
# -bios default: Uses the default firmware (OpenSBI)
# -nographic: Start QEMU machine without a GUI
# -serial no:stdio: Connect QEMU's standard input/output to the virtual machines serial port. Specifying mon allows switching to the QEMU monitor by pressing Crt+A then C
# --no-reboot: if the virtual machine crashes, stop the emulator without rebooting.


# Start QEMU
#$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot -kernel kernel.elf
