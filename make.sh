#!/bin/sh
cd $(dirname $0)
echo "Compiling shared object"
find code -type f -name make.sh | xargs sh
gcc -shared `find code | grep "\.o"` -o libasm-stdlib.so
find code -type f -name "*.o" | xargs rm -f
