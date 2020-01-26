#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
# Run the make script to compile the library
sh make.sh
# Copy the library and headers to the right directory
echo "\033[1;32m===> \033[1;35mCopying files to installed directories\033[0m"
cp code/*.h /usr/include
cp *.so /usr/lib
# Remove the library file after it's done, if you don't want this to happen, then just use make
rm *.so
