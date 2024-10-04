set_property PACKAGE_PIN {E3} [get_ports {sys_clock}]
set_property IOSTANDARD {LVCMOS33} [get_ports {sys_clock}]

set_property BOARD_PIN {reset} [get_ports {reset}]

# JTAG
set_property CLOCK_DEDICATED_ROUTE {FALSE} [get_nets [get_ports {jtag_jtag_TCK}]]

set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 PULLUP TRUE}  [get_ports { jtag_TDI }];
set_property -dict { PACKAGE_PIN D3 IOSTANDARD LVCMOS33 PULLUP TRUE}  [get_ports { jtag_TMS }];
set_property -dict { PACKAGE_PIN F4 IOSTANDARD LVCMOS33 PULLUP TRUE}  [get_ports { jtag_TCK }];
set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS33 PULLUP TRUE}  [get_ports { jtag_TDO }];

# UARTT
set_property -dict { PACKAGE_PIN A9 IOSTANDARD LVCMOS33 }  [get_ports { uart_rxd }];
set_property -dict { PACKAGE_PIN D10 IOSTANDARD LVCMOS33 } [get_ports { uart_txd }];

set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { serin_valid  }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0]
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { serin_data0  }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { serin_data1  }]; #IO_L8N_T1_D12_14 Sch=ck_io[2]
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports { serin_data2  }]; #IO_L19P_T3_A10_D26_14 Sch=ck_io[3]
set_property -dict { PACKAGE_PIN R12 IOSTANDARD LVCMOS33 } [get_ports { serin_data3  }]; #IO_L5P_T0_D06_14 Sch=ck_io[4]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { serout_ready }]; #IO_L14P_T2_SRCC_14 Sch=ck_io[5]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { serin_ready  }]; #IO_L14N_T2_SRCC_14 Sch=ck_io[6]
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { serout_valid }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=ck_io[7]
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports { serout_data0 }]; #IO_L11P_T1_SRCC_14 Sch=ck_io[8]
set_property -dict { PACKAGE_PIN M16 IOSTANDARD LVCMOS33 } [get_ports { serout_data1 }]; #IO_L10P_T1_D14_14 Sch=ck_io[9]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { serout_data2 }]; #IO_L18N_T2_A11_D27_14 Sch=ck_io[10]
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { serout_data3 }]; #IO_L17N_T2_A13_D29_14 Sch=ck_io[11]

set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { uart2_txd }]; #IO_L12N_T1_MRCC_14 Sch=ck_io[12]
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { uart2_rxd }]; #IO_L12P_T1_MRCC_14 Sch=ck_io[13]
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { gpio_o0 }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=ck_io[26]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { gpio_o1 }]; #IO_L16N_T2_A15_D31_14 Sch=ck_io[27]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { gpio_o2 }]; #IO_L6N_T0_D08_VREF_14 Sch=ck_io[28]
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { gpio_o3 }]; #IO_25_14 Sch=ck_io[29]
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { gpio_o4 }]; #IO_0_14 Sch=ck_io[30]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { gpio_o5 }]; #IO_L5N_T0_D07_14 Sch=ck_io[31]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { gpio_o6 }]; #IO_L13N_T2_MRCC_14 Sch=ck_io[32]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { gpio_o7 }]; #IO_L13P_T2_MRCC_14 Sch=ck_io[33]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { gpio_i0 }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=ck_io[34]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { gpio_i1 }]; #IO_L11N_T1_SRCC_14 Sch=ck_io[35]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { gpio_i2 }]; #IO_L8P_T1_D11_14 Sch=ck_io[36]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { gpio_i3 }]; #IO_L17P_T2_A14_D30_14 Sch=ck_io[37]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { gpio_i4 }]; #IO_L7N_T1_D10_14 Sch=ck_io[38]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { gpio_i5 }]; #IO_L7P_T1_D09_14 Sch=ck_io[39]
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { gpio_i6 }]; #IO_L9N_T1_DQS_D13_14 Sch=ck_io[40]
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { gpio_i7 }]; #IO_L9P_T1_DQS_14 Sch=ck_io[41]

set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { sdio_spi_clk }]; #IO_L18N_T2_35 Sch=led0_b
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { sdio_spi_cs }]; #IO_L19N_T3_VREF_35 Sch=led0_g
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { sdio_spi_dat_0 }]; #IO_L19P_T3_35 Sch=led0_r
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { sdio_spi_dat_3 }]; #IO_L20P_T3_35 Sch=led1_b
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_sck }]; #IO_L21P_T3_DQS_35 Sch=led1_g
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_cs }]; #IO_L20N_T3_35 Sch=led1_r
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_o0 }]; #IO_L21N_T3_DQS_35 Sch=led2_b
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_o1 }]; #IO_L22N_T3_35 Sch=led2_g
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_o2 }]; #IO_L22P_T3_35 Sch=led2_r
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_o3 }]; #IO_L23P_T3_35 Sch=led3_b
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_i0 }]; #IO_L24P_T3_35 Sch=led3_g
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_i1 }]; #IO_L23N_T3_35 Sch=led3_r
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_i2 }]; #IO_L24N_T3_35 Sch=led[4]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { flash_qspi_dq_i3 }]; #IO_25_35 Sch=led[5]
