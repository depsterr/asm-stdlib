#!/bin/sh
# Make sure scripts directory is the current one
cd $(dirname $0)
# Run the make script to compile the library
sh make.sh
# Copy the library and headers to the right directory
echo "\033[1;32m===> \033[1;35mCopying files to installed directories\033[0m"
cp code/*.h /usr/include && cp *.so /usr/lib && echo "\033[1;32m===> \033[1;35mDone\033[0m" || echo "\033[0;31m===> \033[1;35mUnable to copy files, did you run as root?\033[0m" 
