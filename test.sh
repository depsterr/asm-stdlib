#!/bin/sh
ls libasm-stdlib.so >> /dev/null || sh make.sh
gcc -L. -lasm-stdlib code/test/test.c -o code/test/test.out
./code/test/test.out
