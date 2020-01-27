#!/bin/sh
cd $(dirname $0)
nasm -f elf64 asstrcmp.s -o asstrcmp.o
