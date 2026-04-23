#!/bin/bash
set -xue

# QEMU file path
QEMU=qemu-system-riscv32


# -machine virt: Starts a virt machine.
# -bios default: Uses the default firmware (OpenSBI)
# -nographic: Start QEMU machine without a GUI
# -serial no:stdio: Connect QEMU's standard input/output to the virtual machines serial port. Specifying mon allows switching to the QEMU monitor by pressing Crt+A then C
# --no-reboot: if the virtual machine crashes, stop the emulator without rebooting.


# Start QEMU
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot
