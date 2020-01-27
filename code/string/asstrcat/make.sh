#!/bin/sh
cd $(dirname $0)
nasm -f elf64 asstrcat.s -o asstrcat.o
