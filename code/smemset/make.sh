#!/bin/sh
cd $(dirname $0)
nasm -f elf64 smemset.s -o memset.o
