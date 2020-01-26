#!/bin/sh
cd $(dirname $0)
nasm -f elf64 asstrcpy.s -o asstrcpy.o
