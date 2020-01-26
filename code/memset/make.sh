#!/bin/sh
cd $(dirname $0)
nasm -f elf64 memset.s -o memset.o
