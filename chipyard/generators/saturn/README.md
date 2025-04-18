The Saturn Vector Unit (Version 0.9)
====================================

This README is a temporary placeholder,
More in-depth documentation will be released soon with the 1.0 release.

This repository contains the Chisel source RTL for the Saturn Vector Unit, a parameterized RVV 1.0 vector unit.
Saturn supports the entire RVV 1.0 application-profile specification, including

 * `V`-extension (Full application-profile V)
 * `Zved64` - supports FP64, `ELEN`=64
 * `Zvfh` - supports FP16
 * `Zvbb` - support basic vector bit manipulation
 * `Zvl64/128/256/512/1024` - configurable `VLEN`
 * Indexed/strided/segmented loads and stores
 * Virtual memory with precise traps
 * Full chaining with zero dead-time
 * Configurable SIMD datapath width (64/128/256/512+)

Using Saturn
-------------

This repository cannot be used stand-alone.
Saturn is intended to be used to generate vector-enabled RISC-V cores and SoCs through the [Chipyard](https://github.com/ucb-bar/chipyard) SoC design framework.