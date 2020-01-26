#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
# Run the make script to compile the library
sh make.sh
echo Compiling tests
gcc tests/test.c -o tests/test.out -L. -lasm-stdlib
echo Running tests
LD_LIBRARY_PATH=$PWD ./tests/test.out
