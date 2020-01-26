#include <stdint.h>

/* Make functions work in cpp */

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN extern
#endif

/* smemset */
EXTERN void smemset(void* memstart, uint8_t filler, uint64_t amount);
EXTERN void smemset2(void* memstart, uint16_t filler, uint64_t amount);
EXTERN void smemset4(void* memstart, uint32_t filler, uint64_t amount);
EXTERN void smemset8(void* memstart, uint64_t filler, uint64_t amount);
