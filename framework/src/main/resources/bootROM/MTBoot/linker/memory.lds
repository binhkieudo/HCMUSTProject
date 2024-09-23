MEMORY
{
  bootrom_mem (rx) : ORIGIN = 0x40002000, LENGTH = 0x1000
  memory_mem (rwx) : ORIGIN = 0x70000000, LENGTH = 0x1000
}
