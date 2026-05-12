# OS

This is a small operating system, built alongside reading https://operating-system-in-1000-lines.vercel.app/en/

## Installing dev tools
### macOS
Install homebrew, then run this command to get the necessary tools:
`brew install llvm lld qemu`

### Ubuntu
Install packages with apt:
`sudo apt update && sudo apt install -y clang llvm lld qemu-system-riscv32 curl`

Then, download OpenSBI
`curl -LO https://github.com/qemu/qemu/raw/v8.0.4/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin`

## Running the OS
First, run `ruh_user.sh` then `run.sh` to launch the simple shell program. 
