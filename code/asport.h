#include <stdint.h>

/* string.h */

#define NULL (void*)0
#define wchar_t uint32_t

#define memset asmemset

#define strcpy asstrcpy
#define strcmp asstrcmp
#define strcat asstrcat
#define strlen asstrln

/* stdio.h */

#define puts asputs
