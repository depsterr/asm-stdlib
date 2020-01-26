#!/bin/sh
cd $(dirname $0)
nasm -f elf64 asmemset.s -o asmemset.o
