#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
echo "Compiling shared object"
# Run all the make scripts in code
find code -type f -name make.sh | xargs sh
# Find all the .o binaries and compile them to a library
gcc -shared $(find code | grep "\.o") -o libasm-stdlib.so
# Remove all the .o binaries to save space, pass an argument to prevent this.
[ -z "$1" ] && find code -type f -name "*.o" | xargs rm -f
