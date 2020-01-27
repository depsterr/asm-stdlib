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
EXTERN void asstrcpy(void* destination, void* source);
EXTERN void asstrcpy2(void* destination, void* source);
EXTERN void asstrcpy4(void* destination, void* source);
EXTERN void asstrcpy8(void* destination, void* source);

/* asstrcmp */
EXTERN uint8_t asstrcmp(void* firstaddr, void* secondaddr);
EXTERN uint16_t asstrcmp2(void* firstaddr, void* secondaddr);
EXTERN uint32_t asstrcmp4(void* firstaddr, void* secondaddr);
EXTERN uint64_t asstrcmp8(void* firstaddr, void* secondaddr);

/* asstrcat */
EXTERN void asstrcat(void* destination, void* source);
