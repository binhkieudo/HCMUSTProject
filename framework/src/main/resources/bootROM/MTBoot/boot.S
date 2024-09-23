// See LICENSE.Sifive for license details.
#include "platform.h"

  .section .text.init
  .option norvc
  .globl _prog_start
_prog_start:
  li s0, 0x80000000
  jr s0
  .section .dtb
  .align 3
dtb:
