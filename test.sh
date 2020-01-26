#!/bin/sh
sh make.sh
echo Compiling tests
gcc tests/test.c -o tests/test.out -L. -lasm-stdlib
echo Running tests
LD_LIBRARY_PATH=$PWD ./tests/test.out
