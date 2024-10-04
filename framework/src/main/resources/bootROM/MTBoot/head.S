// See LICENSE.Sifive for license details.
#include "platform.h"

  .section .text.init
  .option norvc
  .globl _prog_start
_prog_start:
  li s2, 0x8
  csrw mie, s2
  csrr a0, mhartid
  li sp, (MEMORY_MEM_ADDR + 0xFF0)
  call main
  la a1, dtb // dtb address for next level bootloader
  li s1, MEMORY_MEM_ADDR
  jr s1
  j _prog_start

  .section .dtb
  .align 3
dtb:
