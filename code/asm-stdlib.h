#include <stdint.h>

/* This ensures that cpp calls the functions according to the System V abi */

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN extern
#endif

/* 
 *
 *		string
 *
 */


/* asmemset */
EXTERN void asmemset(void* memstart, uint8_t filler, uint64_t amount);
EXTERN void asmemset2(void* memstart, uint16_t filler, uint64_t amount);
EXTERN void asmemset4(void* memstart, uint32_t filler, uint64_t amount);
EXTERN void asmemset8(void* memstart, uint64_t filler, uint64_t amount);

/* asstrcpy */
EXTERN void asstrcpy(char* destination, char* source);
EXTERN void asstrcpy2(char* destination, char* source);
EXTERN void asstrcpy4(char* destination, char* source);
EXTERN void asstrcpy8(char* destination, char* source);

/* asstrcmp */
EXTERN uint8_t asstrcmp(char* firstaddr, char* secondaddr);
EXTERN uint16_t asstrcmp2(char* firstaddr, char* secondaddr);
EXTERN uint32_t asstrcmp4(char* firstaddr, char* secondaddr);
EXTERN uint64_t asstrcmp8(char* firstaddr, char* secondaddr);

/* asstrcat */
EXTERN void asstrcat(char* destination, char* source);
