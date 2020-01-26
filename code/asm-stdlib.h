#include <stdint.h>

/* Make functions work in cpp */

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN extern
#endif

/* asmemset */
EXTERN void asmemset(void* memstart, uint8_t filler, uint64_t amount);
EXTERN void asmemset1(void* memstart, uint8_t filler, uint64_t amount);
EXTERN void asmemset2(void* memstart, uint16_t filler, uint64_t amount);
EXTERN void asmemset4(void* memstart, uint32_t filler, uint64_t amount);
EXTERN void asmemset8(void* memstart, uint64_t filler, uint64_t amount);

/* asstrcpy */
EXTERN void asstrcpy(void* destination, void* source);
