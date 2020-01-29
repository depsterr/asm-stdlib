# Documentation

## Function definitions

[asmemset](string/asmemset/README.md)

[asstrcpy](string/asstrcpy/README.md)

[asstrcmp](string/asstrcmp/README.md)

[asstrcat](string/asstrcat/README.md)

## For contributors

You're more than welcome to contribute! Here are some things to consider and rules to follow:

Efficieny is important, don't write lazy code. If you see code you think you could improve, then go ahead!

Leave comments, completely uncommented code will not get accepted. You don't have to comment every single line, but explain what the idea of it is. Make sure to comment what parameters are being passed in what register at the top of the function.

All functions should be named `as<name of stdlib function>[additional info]`, for example asmemset and asmemtest 8 for setting 8 bytes at a time.

All function headers must use stdint for parameters that are not pointers.

### Resources

[System V abi calling conventions](https://wiki.osdev.org/Calling_Conventions)
