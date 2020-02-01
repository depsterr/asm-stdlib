#include <stdint.h>

/* This ensures that cpp calls the functions according to the System V abi */

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN extern
#endif

/* 
 *
 *		stdio
 *
 */

/* asputs */
EXTERN void asputs(const char* inputstr);
