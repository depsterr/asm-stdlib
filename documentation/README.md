# Documentation

## Function definitions

[asmemset](string/asmemset/README.md)

[asstrcpy](string/asstrcpy/README.md)

[asstrcmp](string/asstrcmp/README.md)

## For contributors

You're more than welcome to contribute! Here are some things to consider and rules to follow:

Efficieny is the number one priority, don't write lazy code. If you see code you think you could improve, then go ahead!

Leave comments, completely uncommented code will not get accepted. You don't have to comment every single line, but explain what the idea of it is. Make sure to comment what parameters are being passed in what register at the top of the function.

All functions should be named `as<name of stdlib function>[additional info]`, for example smemset and smemtest 8 for setting 8 bytes at a time.

All function headers must use stdint for parameters that are not pointers. All pointers should be void\*, regardless of actual type.

Each function should have it's own directory named after the function and containing all the necessary .s files

### Resources

[System V abi calling conventions](https://wiki.osdev.org/Calling_Conventions)
