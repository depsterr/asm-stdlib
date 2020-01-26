#!/bin/sh
echo "Compiling shared object"
find code -type f -name make.sh -execdir sh make.sh \;
gcc -shared `find . | grep "\.o"` -o libasm-stdlib.so
find code -type f -name "*.o" | xargs rm -f

