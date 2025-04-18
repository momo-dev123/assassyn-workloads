#ifndef __HTIF_H
#define __HTIF_H

#include <stdint.h>
#include <rv.h>
#include "fesvr.h"

#define HTIF_DEV_SHIFT      56
#define HTIF_DEV_MASK       0xff
#define HTIF_CMD_SHIFT      48
#define HTIF_CMD_MASK       0xff
#define HTIF_PAYLOAD_MASK   ((1UL << HTIF_CMD_SHIFT) - 1)

#if RISCV_XLEN == 64
#define HTIF_TOHOST(dev, cmd, payload) ( \
    (((uint64_t)(dev) & HTIF_DEV_MASK) << HTIF_DEV_SHIFT) | \
    (((uint64_t)(cmd) & HTIF_CMD_MASK) << HTIF_CMD_SHIFT) | \
    ((uint64_t)(payload) & HTIF_PAYLOAD_MASK))
#else
/* HTIF devices not supported on RV32 */
#define HTIF_TOHOST(dev, cmd, payload) \
    (((dev) || (cmd)) ? (__builtin_trap(), 0) : (payload))
#endif


typedef struct {
  __IO uint64_t *tohost;
  __IO uint64_t *fromhost;
} HTIF_TypeDef;

#ifndef HTIF
  extern HTIF_TypeDef htif_handler;
  #define HTIF (&htif_handler)
#endif

long HTIF_syscall(uint64_t a0, uint64_t a1, uint64_t a2, unsigned long n);


#endif /* __HTIF_H */
