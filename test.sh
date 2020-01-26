#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
# Run the make script to compile the library
sh make.sh
echo "\033[1;32m===> \033[1;35mCompiling tests\033[0m"
gcc tests/test.c -o tests/test.out -L. -lasm-stdlib
echo "\033[1;32m===> \033[1;35mRunning tests\033[0m"
LD_LIBRARY_PATH=$PWD ./tests/test.out
