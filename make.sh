#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
echo "\033[1;32m===> \033[1;35mCompiling shared object\033[0m"
# Run all the make scripts in code
find code -type f -name make.sh | 
	while IFS= read -r line
	do
		sh $line
	done
# Find all the .o binaries and compile them to a library
gcc -shared $(find code | grep "\.o") -o libasm-stdlib.so && echo "\033[1;32m===> \033[1;35mDone\033[0m"
# Remove all the .o binaries to save space, pass an argument to prevent this.
[ -z "$1" ] && find code -type f -name "*.o" | xargs rm -f
