// #include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <riscv-pk/encoding.h>
#include "include/platform.h"
#include "kprintf.h"
// #include "kprintf.h"
#define REG32(p, i)	((p)[(i) >> 2])

#define DELAY_TIME 1000000

void delay() {
	for (int i = 0; i < DELAY_TIME; i = i + 1);	
}

int main(int argc, char **arv) {
  
  
  REG32(uart, UART_REG_TXCTRL) = UART_TXEN;

  int i = 0;

  while (1) {
    kprintf("Hello world from core %l!!!\r\n", i++);
    delay();
    if (i >= 100) break;
  }

  return 0;
}
