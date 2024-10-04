set_property SRC_FILE_INFO {cfile:/home/binhkieudo/Workspace/tmp/HCMUSTProject/fpga/fpga-shells/xilinx/arty_a7_100/constraints/arty-master.xdc rfile:../../../../../../fpga/fpga-shells/xilinx/arty_a7_100/constraints/arty-master.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.sdc rfile:../../../framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.sdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:/home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.xdc rfile:../../../framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.xdc id:3} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name JTCK        -period 100   -waveform {0 50} [get_ports {jd_2}];
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { sw_0 }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { sw_1 }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { sw_2 }]; #IO_L13N_T2_MRCC_16 Sch=sw[2]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { sw_3 }]; #IO_L14P_T2_SRCC_16 Sch=sw[3]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led0_b }]; #IO_L18N_T2_35 Sch=led0_b
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { led0_g }]; #IO_L19N_T3_VREF_35 Sch=led0_g
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { led0_r }]; #IO_L19P_T3_35 Sch=led0_r
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { led1_b }]; #IO_L20P_T3_35 Sch=led1_b
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { led1_g }]; #IO_L21P_T3_DQS_35 Sch=led1_g
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { led1_r }]; #IO_L20N_T3_35 Sch=led1_r
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { led2_b }]; #IO_L21N_T3_DQS_35 Sch=led2_b
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { led2_g }]; #IO_L22N_T3_35 Sch=led2_g
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { led2_r }]; #IO_L22P_T3_35 Sch=led2_r
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led_0 }]; #IO_L24N_T3_35 Sch=led[4]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led_1 }]; #IO_25_35 Sch=led[5]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led_2 }]; #IO_L24P_T3_A01_D17_14 Sch=led[6]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led_3 }]; #IO_L24N_T3_A00_D16_14 Sch=led[7]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { btn_0 }]; #IO_L6N_T0_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { btn_1 }]; #IO_L11P_T1_SRCC_16 Sch=btn[1]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { btn_2 }]; #IO_L11N_T1_SRCC_16 Sch=btn[2]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { btn_3 }]; #IO_L12P_T1_MRCC_16 Sch=btn[3]
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { ja_0 }]; #IO_0_15 Sch=ja[1]
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { ja_1 }]; #IO_L4P_T0_15 Sch=ja[2]
set_property src_info {type:XDC file:1 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { ja_2 }]; #IO_L4N_T0_15 Sch=ja[3]
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { ja_3 }]; #IO_L6P_T0_15 Sch=ja[4]
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { ja_4 }]; #IO_L6N_T0_VREF_15 Sch=ja[7]
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { ja_5 }]; #IO_L10P_T1_AD11P_15 Sch=ja[8]
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { ja_6 }]; #IO_L10N_T1_AD11N_15 Sch=ja[9]
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { ja_7 }]; #IO_25_15 Sch=ja[10]
set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { jc_0 }]; #IO_L20P_T3_A08_D24_14 Sch=jc_p[1]
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { jc_1 }]; #IO_L20N_T3_A07_D23_14 Sch=jc_n[1]
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { jc_2 }]; #IO_L21P_T3_DQS_14 Sch=jc_p[2]
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { jc_3 }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=jc_n[2]
set_property src_info {type:XDC file:1 line:76 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { jc_4 }]; #IO_L22P_T3_A05_D21_14 Sch=jc_p[3]
set_property src_info {type:XDC file:1 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { jc_5 }]; #IO_L22N_T3_A04_D20_14 Sch=jc_n[3]
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { jc_6 }]; #IO_L23P_T3_A03_D19_14 Sch=jc_p[4]
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { jc_7 }]; #IO_L23N_T3_A02_D18_14 Sch=jc_n[4]
set_property src_info {type:XDC file:1 line:83 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { jd_0 }]; #IO_L11N_T1_SRCC_35 Sch=jd[1]
set_property src_info {type:XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { jd_1 }]; #IO_L12N_T1_MRCC_35 Sch=jd[2]
set_property src_info {type:XDC file:1 line:85 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { jd_2 }]; #IO_L13P_T2_MRCC_35 Sch=jd[3]
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { jd_4 }]; #IO_L14P_T2_SRCC_35 Sch=jd[7]
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { jd_5 }]; #IO_L14N_T2_SRCC_35 Sch=jd[8]
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { jd_6 }]; #IO_L15P_T2_DQS_35 Sch=jd[9]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33  } [get_ports { uart_rxd_out }]; #IO_L19N_T3_VREF_16 Sch=uart_rxd_out
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33  } [get_ports { uart_txd_in }]; #IO_L14N_T2_SRCC_16 Sch=uart_txd_in
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { ck_io_0 }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0]
set_property src_info {type:XDC file:1 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { ck_io_1 }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1]
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { ck_io_2 }]; #IO_L8N_T1_D12_14 Sch=ck_io[2]
set_property src_info {type:XDC file:1 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { ck_io_3 }]; #IO_L19P_T3_A10_D26_14 Sch=ck_io[3]
set_property src_info {type:XDC file:1 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { ck_io_4 }]; #IO_L5P_T0_D06_14 Sch=ck_io[4]
set_property src_info {type:XDC file:1 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { ck_io_5 }]; #IO_L14P_T2_SRCC_14 Sch=ck_io[5]
set_property src_info {type:XDC file:1 line:123 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { ck_io_6 }]; #IO_L14N_T2_SRCC_14 Sch=ck_io[6]
set_property src_info {type:XDC file:1 line:124 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { ck_io_7 }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=ck_io[7]
set_property src_info {type:XDC file:1 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { ck_io_8 }]; #IO_L11P_T1_SRCC_14 Sch=ck_io[8]
set_property src_info {type:XDC file:1 line:126 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { ck_io_9 }]; #IO_L10P_T1_D14_14 Sch=ck_io[9]
set_property src_info {type:XDC file:1 line:127 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { ck_io_10 }]; #IO_L18N_T2_A11_D27_14 Sch=ck_io[10]
set_property src_info {type:XDC file:1 line:128 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { ck_io_11 }]; #IO_L17N_T2_A13_D29_14 Sch=ck_io[11]
set_property src_info {type:XDC file:1 line:129 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { ck_io_12 }]; #IO_L12N_T1_MRCC_14 Sch=ck_io[12]
set_property src_info {type:XDC file:1 line:130 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { ck_io_13 }]; #IO_L12P_T1_MRCC_14 Sch=ck_io[13]
set_property src_info {type:XDC file:1 line:135 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { ck_io_14 }]; #IO_0_35 Sch=ck_a[0]
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { ck_io_15 }]; #IO_L4P_T0_35 Sch=ck_a[1]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { ck_io_16 }]; #IO_L4N_T0_35 Sch=ck_a[2]
set_property src_info {type:XDC file:1 line:138 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { ck_io_17 }]; #IO_L6P_T0_35 Sch=ck_a[3]
set_property src_info {type:XDC file:1 line:139 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { ck_io_18 }]; #IO_L6N_T0_VREF_35 Sch=ck_a[4]
set_property src_info {type:XDC file:1 line:140 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ck_io_19 }]; #IO_L11P_T1_SRCC_35 Sch=ck_a[5]
set_property src_info {type:XDC file:1 line:173 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { ck_miso }]; #IO_L17N_T2_35 Sch=ck_miso
set_property src_info {type:XDC file:1 line:174 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { ck_mosi }]; #IO_L17P_T2_35 Sch=ck_mosi
set_property src_info {type:XDC file:1 line:175 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { ck_sck }]; #IO_L18P_T2_35 Sch=ck_sck
set_property src_info {type:XDC file:1 line:176 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { ck_ss }]; #IO_L16N_T2_35 Sch=ck_ss
set_property src_info {type:XDC file:1 line:188 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { ck_rst }]; #IO_L16P_T2_35 Sch=ck_rst
set_property src_info {type:XDC file:1 line:214 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33  IOB TRUE } [get_ports { qspi_sck }];
set_property src_info {type:XDC file:1 line:215 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name qspi_sck_pin -period 20.00 -waveform {0 10}    [get_ports { qspi_sck }];
set_property src_info {type:XDC file:1 line:216 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33  IOB TRUE } [get_ports { qspi_cs }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_cs
set_property src_info {type:XDC file:1 line:217 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33  IOB TRUE  PULLUP TRUE } [get_ports { qspi_dq_0 }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
set_property src_info {type:XDC file:1 line:218 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33  IOB TRUE  PULLUP TRUE } [get_ports { qspi_dq_1 }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
set_property src_info {type:XDC file:1 line:219 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33  IOB TRUE  PULLUP TRUE } [get_ports { qspi_dq_2 }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
set_property src_info {type:XDC file:1 line:220 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33  IOB TRUE  PULLUP TRUE } [get_ports { qspi_dq_3 }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]
set_property src_info {type:XDC file:1 line:233 export:INPUT save:INPUT read:READ} [current_design]
set_clock_groups -asynchronous -group [list [get_clocks -include_generated_clocks -of_objects [get_ports jd_2]]] -group [list [get_clocks -of_objects [get_pins ip_mmcm/inst/mmcm_adv_inst/CLKOUT0]]] -group [list [get_clocks -of_objects [get_pins ip_mmcm/inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins ip_mmcm/inst/mmcm_adv_inst/CLKOUT2]]]
set_property src_info {type:XDC file:2 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter sys_clock 0.5
set_property src_info {type:XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter JTCK 0.5
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_clock_groups -asynchronous -group [list [get_clocks -of_objects [get_pins { harnessSysPLL/clk_out1 }]]] -group [list [get_clocks { JTCK }]]
set_property src_info {type:XDC file:3 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {E3} [get_ports {sys_clock}]
set_property src_info {type:XDC file:3 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D4} [get_ports {jtag_jtag_TDI}]
set_property src_info {type:XDC file:3 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D3} [get_ports {jtag_jtag_TMS}]
set_property src_info {type:XDC file:3 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {F4} [get_ports {jtag_jtag_TCK}]
set_property src_info {type:XDC file:3 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {F3} [get_ports {jtag_jtag_TDO}]
set_property src_info {type:XDC file:3 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {E2} [get_ports {jtag_srst_n}]
set_property src_info {type:XDC file:3 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD {LVCMOS33} [get_ports {jtag_srst_n}]
set_property src_info {type:XDC file:3 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property PULLUP {TRUE} [get_ports {jtag_srst_n}]
set_property src_info {type:XDC file:3 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {A9} [get_ports {uart_rxd}]
set_property src_info {type:XDC file:3 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {uart_rxd}]]]
set_property src_info {type:XDC file:3 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D10} [get_ports {uart_txd}]
set_property src_info {type:XDC file:3 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D2} [get_ports {uart2_rxd}]
set_property src_info {type:XDC file:3 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {uart2_rxd}]]]
set_property src_info {type:XDC file:3 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {H2} [get_ports {uart2_txd}]
set_property src_info {type:XDC file:3 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {A8} [get_ports {gpio_gpio_0}]
set_property src_info {type:XDC file:3 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {C11} [get_ports {gpio_gpio_1}]
set_property src_info {type:XDC file:3 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {C10} [get_ports {gpio_gpio_2}]
set_property src_info {type:XDC file:3 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {A10} [get_ports {gpio_gpio_3}]
set_property src_info {type:XDC file:3 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {E1} [get_ports {gpio_gpio_4}]
set_property src_info {type:XDC file:3 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {F6} [get_ports {gpio_gpio_5}]
set_property src_info {type:XDC file:3 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {G6} [get_ports {gpio_gpio_6}]
set_property src_info {type:XDC file:3 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {G4} [get_ports {gpio_gpio_7}]
set_property src_info {type:XDC file:3 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D12} [get_ports {sdio_spi_clk}]
set_property src_info {type:XDC file:3 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {B11} [get_ports {sdio_spi_cs}]
set_property src_info {type:XDC file:3 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {A11} [get_ports {sdio_spi_dat_0}]
set_property src_info {type:XDC file:3 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sdio_spi_dat_0}]]]
set_property src_info {type:XDC file:3 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D13} [get_ports {sdio_spi_dat_1}]
set_property src_info {type:XDC file:3 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sdio_spi_dat_1}]]]
set_property src_info {type:XDC file:3 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {B18} [get_ports {sdio_spi_dat_2}]
set_property src_info {type:XDC file:3 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sdio_spi_dat_2}]]]
set_property src_info {type:XDC file:3 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {G13} [get_ports {sdio_spi_dat_3}]
set_property src_info {type:XDC file:3 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {E15} [get_ports {flash_qspi_cs}]
set_property src_info {type:XDC file:3 line:80 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {E16} [get_ports {flash_qspi_dq_0}]
set_property src_info {type:XDC file:3 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {D15} [get_ports {flash_qspi_dq_1}]
set_property src_info {type:XDC file:3 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {C15} [get_ports {flash_qspi_sck}]
set_property src_info {type:XDC file:3 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {K15} [get_ports {flash_qspi_dq_2}]
set_property src_info {type:XDC file:3 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN {J15} [get_ports {flash_qspi_dq_3}]
