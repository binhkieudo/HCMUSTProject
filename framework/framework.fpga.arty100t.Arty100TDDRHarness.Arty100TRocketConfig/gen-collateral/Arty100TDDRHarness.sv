module Arty100TDDRHarness(
  input  sys_clock,
  input  reset,
  // JTAG
  input  jtag_TCK,
  input  jtag_TMS,
  input  jtag_TDI,
  output jtag_TDO,
  // UART_0
  output uart_txd,
  input  uart_rxd,
  // UART_1
  output uart2_txd,
  input  uart2_rxd,
  // GPIO
  output gpio_o0,
  output gpio_o1,
  output gpio_o2,
  output gpio_o3,
  output gpio_o4,
  output gpio_o5,
  output gpio_o6,
  output gpio_o7,
  input  gpio_i0,
  input  gpio_i1,
  input  gpio_i2,
  input  gpio_i3,
  input  gpio_i4,
  input  gpio_i5,
  input  gpio_i6,
  input  gpio_i7,
  // SPI-SDCard
  output sdio_spi_clk,
  output sdio_spi_cs,
  input  sdio_spi_dat_0,
  output sdio_spi_dat_3,
  // SPI-Flash
  output flash_qspi_sck,
  output flash_qspi_cs,
  output flash_qspi_dq_o0,
  output flash_qspi_dq_o1,
  output flash_qspi_dq_o2,
  output flash_qspi_dq_o3,
  input  flash_qspi_dq_i0,
  input  flash_qspi_dq_i1,
  input  flash_qspi_dq_i2,
  input  flash_qspi_dq_i3,
  // TSI
  input  serin_valid,
  input  serin_data0,
  input  serin_data1,
  input  serin_data2,
  input  serin_data3,
  input  serout_ready,
  output serin_ready,
  output serout_valid,
  output serout_data0,
  output serout_data1,
  output serout_data2,
  output serout_data3  
);

  wire _harnessBinderReset_catcher_io_sync_reset;	// @[ResetCatchAndSync.scala:39:28]
  wire _plusarg_reader_out;	// @[PlusArg.scala:80:11]
  wire _chiptop0_jtag_TDO;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_sck;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_0_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_0_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_0_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_1_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_1_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_1_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_2_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_2_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_2_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_3_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_3_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_dq_3_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_spi_0_cs_0;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_uart_0_txd;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_uart_1_txd;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_0_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_1_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_2_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_3_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_4_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_5_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_6_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_oval;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_pue;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_ds;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_ps;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_ds1;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_gpio_0_pins_7_o_poe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_sck;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_0_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_0_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_0_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_1_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_1_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_1_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_2_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_2_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_2_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_3_o;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_3_ie;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_dq_3_oe;	// @[HasHarnessInstantiators.scala:82:40]
  wire _chiptop0_qspi_0_cs_0;	// @[HasHarnessInstantiators.scala:82:40]
  wire _reset_ibuf_O;	// @[Harness.scala:81:26]
  wire _bundleIn_0_dq_3_i_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_dq_2_i_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_dq_1_i_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_dq_0_i_a2b_b;	// @[Util.scala:30:21]
  wire _a2b_14_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_7_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_6_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_5_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_4_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_3_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_2_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_1_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_pins_0_i_ival_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_rxd_a2b_1_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_rxd_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_srst_n_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_TDI_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_TMS_a2b_b;	// @[Util.scala:30:21]
  wire _bundleIn_0_TCK_a2b_b;	// @[Util.scala:30:21]
  wire _sys_clock_ibufg_O;	// @[ClockOverlay.scala:32:22]
  wire _harnessSysPLL_clk_out1;	// @[XilinxShell.scala:76:55]
  wire _harnessSysPLL_locked;	// @[XilinxShell.scala:76:55]
  wire _dutGroup_auto_out_clock;	// @[ClockGroup.scala:31:15]
  wire _dutGroup_auto_out_reset;	// @[ClockGroup.scala:31:15]
  wire _dutWrangler_auto_out_clock;	// @[Harness.scala:31:31]
  wire _dutWrangler_auto_out_reset;	// @[Harness.scala:31:31]
  reg  bundleIn_0_dq_1_i_REG;	// @[SDIOOverlay.scala:19:39]
  reg  bundleIn_0_dq_1_i_REG_1;	// @[SDIOOverlay.scala:19:31]
  
  wire [3:0] serin_bits;
  wire [3:0] serout_bits;
  

  
  always @(posedge _dutWrangler_auto_out_clock) begin	// @[Harness.scala:31:31]
    bundleIn_0_dq_1_i_REG <= _a2b_14_b;	// @[SDIOOverlay.scala:19:39, Util.scala:30:21]
    bundleIn_0_dq_1_i_REG_1 <= bundleIn_0_dq_1_i_REG;	// @[SDIOOverlay.scala:19:{31,39}]
  end // always @(posedge)
  
  ResetWrangler dutWrangler (	// @[Harness.scala:31:31]
    .auto_in_clock  (_dutGroup_auto_out_clock),	// @[ClockGroup.scala:31:15]
    .auto_in_reset  (_dutGroup_auto_out_reset),	// @[ClockGroup.scala:31:15]
    .auto_out_clock (_dutWrangler_auto_out_clock),
    .auto_out_reset (_dutWrangler_auto_out_reset)
  );
 
  ResetCatchAndSync_d3_Arty100TDDRHarness_UNIQUIFIED harnessBinderReset_catcher (	// @[ResetCatchAndSync.scala:39:28]
    .clock         (_dutWrangler_auto_out_clock),	// @[Harness.scala:31:31]
    .reset         (_dutWrangler_auto_out_reset),	// @[Harness.scala:31:31]
    .io_sync_reset (_harnessBinderReset_catcher_io_sync_reset)
  );
  
  ChipTop chiptop0 (	// @[HasHarnessInstantiators.scala:82:40]
    .reset_io             (_harnessBinderReset_catcher_io_sync_reset),	// @[ResetCatchAndSync.scala:39:28]
    .clock_uncore_clock   (_dutWrangler_auto_out_clock),	// @[Harness.scala:31:31]
    .jtag_TCK             (_bundleIn_0_TCK_a2b_b),	// @[Util.scala:30:21]
    .jtag_TMS             (_bundleIn_0_TMS_a2b_b),	// @[Util.scala:30:21]
    .jtag_TDI             (_bundleIn_0_TDI_a2b_b),	// @[Util.scala:30:21]
    .spi_0_dq_0_i         (1'h0),	// @[LazyModule.scala:411:29]
    .spi_0_dq_1_i         (bundleIn_0_dq_1_i_REG_1),	// @[SDIOOverlay.scala:19:31]
    .spi_0_dq_2_i         (1'h0),	// @[LazyModule.scala:411:29]
    .spi_0_dq_3_i         (1'h0),	// @[LazyModule.scala:411:29]
    .uart_0_rxd           (_bundleIn_0_rxd_a2b_b),	// @[Util.scala:30:21]
    .uart_1_rxd           (_bundleIn_0_rxd_a2b_1_b),	// @[Util.scala:30:21]
    .gpio_0_pins_0_i_ival (_bundleIn_0_pins_0_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_0_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_1_i_ival (_bundleIn_0_pins_1_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_1_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_2_i_ival (_bundleIn_0_pins_2_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_2_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_3_i_ival (_bundleIn_0_pins_3_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_3_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_4_i_ival (_bundleIn_0_pins_4_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_4_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_5_i_ival (_bundleIn_0_pins_5_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_5_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_6_i_ival (_bundleIn_0_pins_6_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_6_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .gpio_0_pins_7_i_ival (_bundleIn_0_pins_7_i_ival_a2b_b),	// @[Util.scala:30:21]
    .gpio_0_pins_7_i_po   (1'h0),	// @[LazyModule.scala:411:29]
    .qspi_0_dq_0_i        (_bundleIn_0_dq_0_i_a2b_b),	// @[Util.scala:30:21]
    .qspi_0_dq_1_i        (_bundleIn_0_dq_1_i_a2b_b),	// @[Util.scala:30:21]
    .qspi_0_dq_2_i        (_bundleIn_0_dq_2_i_a2b_b),	// @[Util.scala:30:21]
    .qspi_0_dq_3_i        (_bundleIn_0_dq_3_i_a2b_b),	// @[Util.scala:30:21]
    .jtag_TDO             (_chiptop0_jtag_TDO),
    .spi_0_sck            (_chiptop0_spi_0_sck),
    .spi_0_dq_0_o         (_chiptop0_spi_0_dq_0_o),
    .spi_0_dq_0_ie        (_chiptop0_spi_0_dq_0_ie),
    .spi_0_dq_0_oe        (_chiptop0_spi_0_dq_0_oe),
    .spi_0_dq_1_o         (_chiptop0_spi_0_dq_1_o),
    .spi_0_dq_1_ie        (_chiptop0_spi_0_dq_1_ie),
    .spi_0_dq_1_oe        (_chiptop0_spi_0_dq_1_oe),
    .spi_0_dq_2_o         (_chiptop0_spi_0_dq_2_o),
    .spi_0_dq_2_ie        (_chiptop0_spi_0_dq_2_ie),
    .spi_0_dq_2_oe        (_chiptop0_spi_0_dq_2_oe),
    .spi_0_dq_3_o         (_chiptop0_spi_0_dq_3_o),
    .spi_0_dq_3_ie        (_chiptop0_spi_0_dq_3_ie),
    .spi_0_dq_3_oe        (_chiptop0_spi_0_dq_3_oe),
    .spi_0_cs_0           (_chiptop0_spi_0_cs_0),
    .uart_0_txd           (_chiptop0_uart_0_txd),
    .uart_1_txd           (_chiptop0_uart_1_txd),
    .gpio_0_pins_0_o_oval (_chiptop0_gpio_0_pins_0_o_oval),
    .gpio_0_pins_0_o_oe   (_chiptop0_gpio_0_pins_0_o_oe),
    .gpio_0_pins_0_o_ie   (_chiptop0_gpio_0_pins_0_o_ie),
    .gpio_0_pins_0_o_pue  (_chiptop0_gpio_0_pins_0_o_pue),
    .gpio_0_pins_0_o_ds   (_chiptop0_gpio_0_pins_0_o_ds),
    .gpio_0_pins_0_o_ps   (_chiptop0_gpio_0_pins_0_o_ps),
    .gpio_0_pins_0_o_ds1  (_chiptop0_gpio_0_pins_0_o_ds1),
    .gpio_0_pins_0_o_poe  (_chiptop0_gpio_0_pins_0_o_poe),
    .gpio_0_pins_1_o_oval (_chiptop0_gpio_0_pins_1_o_oval),
    .gpio_0_pins_1_o_oe   (_chiptop0_gpio_0_pins_1_o_oe),
    .gpio_0_pins_1_o_ie   (_chiptop0_gpio_0_pins_1_o_ie),
    .gpio_0_pins_1_o_pue  (_chiptop0_gpio_0_pins_1_o_pue),
    .gpio_0_pins_1_o_ds   (_chiptop0_gpio_0_pins_1_o_ds),
    .gpio_0_pins_1_o_ps   (_chiptop0_gpio_0_pins_1_o_ps),
    .gpio_0_pins_1_o_ds1  (_chiptop0_gpio_0_pins_1_o_ds1),
    .gpio_0_pins_1_o_poe  (_chiptop0_gpio_0_pins_1_o_poe),
    .gpio_0_pins_2_o_oval (_chiptop0_gpio_0_pins_2_o_oval),
    .gpio_0_pins_2_o_oe   (_chiptop0_gpio_0_pins_2_o_oe),
    .gpio_0_pins_2_o_ie   (_chiptop0_gpio_0_pins_2_o_ie),
    .gpio_0_pins_2_o_pue  (_chiptop0_gpio_0_pins_2_o_pue),
    .gpio_0_pins_2_o_ds   (_chiptop0_gpio_0_pins_2_o_ds),
    .gpio_0_pins_2_o_ps   (_chiptop0_gpio_0_pins_2_o_ps),
    .gpio_0_pins_2_o_ds1  (_chiptop0_gpio_0_pins_2_o_ds1),
    .gpio_0_pins_2_o_poe  (_chiptop0_gpio_0_pins_2_o_poe),
    .gpio_0_pins_3_o_oval (_chiptop0_gpio_0_pins_3_o_oval),
    .gpio_0_pins_3_o_oe   (_chiptop0_gpio_0_pins_3_o_oe),
    .gpio_0_pins_3_o_ie   (_chiptop0_gpio_0_pins_3_o_ie),
    .gpio_0_pins_3_o_pue  (_chiptop0_gpio_0_pins_3_o_pue),
    .gpio_0_pins_3_o_ds   (_chiptop0_gpio_0_pins_3_o_ds),
    .gpio_0_pins_3_o_ps   (_chiptop0_gpio_0_pins_3_o_ps),
    .gpio_0_pins_3_o_ds1  (_chiptop0_gpio_0_pins_3_o_ds1),
    .gpio_0_pins_3_o_poe  (_chiptop0_gpio_0_pins_3_o_poe),
    .gpio_0_pins_4_o_oval (_chiptop0_gpio_0_pins_4_o_oval),
    .gpio_0_pins_4_o_oe   (_chiptop0_gpio_0_pins_4_o_oe),
    .gpio_0_pins_4_o_ie   (_chiptop0_gpio_0_pins_4_o_ie),
    .gpio_0_pins_4_o_pue  (_chiptop0_gpio_0_pins_4_o_pue),
    .gpio_0_pins_4_o_ds   (_chiptop0_gpio_0_pins_4_o_ds),
    .gpio_0_pins_4_o_ps   (_chiptop0_gpio_0_pins_4_o_ps),
    .gpio_0_pins_4_o_ds1  (_chiptop0_gpio_0_pins_4_o_ds1),
    .gpio_0_pins_4_o_poe  (_chiptop0_gpio_0_pins_4_o_poe),
    .gpio_0_pins_5_o_oval (_chiptop0_gpio_0_pins_5_o_oval),
    .gpio_0_pins_5_o_oe   (_chiptop0_gpio_0_pins_5_o_oe),
    .gpio_0_pins_5_o_ie   (_chiptop0_gpio_0_pins_5_o_ie),
    .gpio_0_pins_5_o_pue  (_chiptop0_gpio_0_pins_5_o_pue),
    .gpio_0_pins_5_o_ds   (_chiptop0_gpio_0_pins_5_o_ds),
    .gpio_0_pins_5_o_ps   (_chiptop0_gpio_0_pins_5_o_ps),
    .gpio_0_pins_5_o_ds1  (_chiptop0_gpio_0_pins_5_o_ds1),
    .gpio_0_pins_5_o_poe  (_chiptop0_gpio_0_pins_5_o_poe),
    .gpio_0_pins_6_o_oval (_chiptop0_gpio_0_pins_6_o_oval),
    .gpio_0_pins_6_o_oe   (_chiptop0_gpio_0_pins_6_o_oe),
    .gpio_0_pins_6_o_ie   (_chiptop0_gpio_0_pins_6_o_ie),
    .gpio_0_pins_6_o_pue  (_chiptop0_gpio_0_pins_6_o_pue),
    .gpio_0_pins_6_o_ds   (_chiptop0_gpio_0_pins_6_o_ds),
    .gpio_0_pins_6_o_ps   (_chiptop0_gpio_0_pins_6_o_ps),
    .gpio_0_pins_6_o_ds1  (_chiptop0_gpio_0_pins_6_o_ds1),
    .gpio_0_pins_6_o_poe  (_chiptop0_gpio_0_pins_6_o_poe),
    .gpio_0_pins_7_o_oval (_chiptop0_gpio_0_pins_7_o_oval),
    .gpio_0_pins_7_o_oe   (_chiptop0_gpio_0_pins_7_o_oe),
    .gpio_0_pins_7_o_ie   (_chiptop0_gpio_0_pins_7_o_ie),
    .gpio_0_pins_7_o_pue  (_chiptop0_gpio_0_pins_7_o_pue),
    .gpio_0_pins_7_o_ds   (_chiptop0_gpio_0_pins_7_o_ds),
    .gpio_0_pins_7_o_ps   (_chiptop0_gpio_0_pins_7_o_ps),
    .gpio_0_pins_7_o_ds1  (_chiptop0_gpio_0_pins_7_o_ds1),
    .gpio_0_pins_7_o_poe  (_chiptop0_gpio_0_pins_7_o_poe),
    .qspi_0_sck           (_chiptop0_qspi_0_sck),
    .qspi_0_dq_0_o        (_chiptop0_qspi_0_dq_0_o),
    .qspi_0_dq_0_ie       (_chiptop0_qspi_0_dq_0_ie),
    .qspi_0_dq_0_oe       (_chiptop0_qspi_0_dq_0_oe),
    .qspi_0_dq_1_o        (_chiptop0_qspi_0_dq_1_o),
    .qspi_0_dq_1_ie       (_chiptop0_qspi_0_dq_1_ie),
    .qspi_0_dq_1_oe       (_chiptop0_qspi_0_dq_1_oe),
    .qspi_0_dq_2_o        (_chiptop0_qspi_0_dq_2_o),
    .qspi_0_dq_2_ie       (_chiptop0_qspi_0_dq_2_ie),
    .qspi_0_dq_2_oe       (_chiptop0_qspi_0_dq_2_oe),
    .qspi_0_dq_3_o        (_chiptop0_qspi_0_dq_3_o),
    .qspi_0_dq_3_ie       (_chiptop0_qspi_0_dq_3_ie),
    .qspi_0_dq_3_oe       (_chiptop0_qspi_0_dq_3_oe),
    .qspi_0_cs_0          (_chiptop0_qspi_0_cs_0),
    .serial_tl_clock            (_dutWrangler_auto_out_clock),
    .serial_tl_bits_in_valid    (serin_valid ),
    .serial_tl_bits_in_bits     (serin_bits ),
    .serial_tl_bits_out_ready   (serout_ready ),
    .serial_tl_bits_in_ready    (serin_ready ),
    .serial_tl_bits_out_valid   (serout_valid ),
    .serial_tl_bits_out_bits    (serout_bits )
  );
  
  assign serin_bits[0] = serin_data0;
  assign serin_bits[1] = serin_data1;
  assign serin_bits[2] = serin_data2;
  assign serin_bits[3] = serin_data3;
  
  assign serout_data0 = serout_bits[0];
  assign serout_data1 = serout_bits[1];
  assign serout_data2 = serout_bits[2];
  assign serout_data3 = serout_bits[3];  
 
 
  harnessSysPLL harnessSysPLL (
      // Clock out ports
      .clk_out1 (_harnessSysPLL_clk_out1 ),
      // Status and control signals
      .reset    (_reset_ibuf_O ),
      .locked   ( ),
     // Clock in ports
      .clk_in1  (_sys_clock_ibufg_O)
  );
  
  // System
  assign _sys_clock_ibufg_O = sys_clock;
//  assign _harnessSysPLL_clk_out1 = _sys_clock_ibufg_O;
//  assign _reset_ibuf_O = reset;
  assign _dutGroup_auto_out_clock = _harnessSysPLL_clk_out1;
  assign _dutGroup_auto_out_reset = ~_reset_ibuf_O;
  
  // JTAG
  assign _bundleIn_0_TCK_a2b_b = jtag_TCK;
  assign _bundleIn_0_TMS_a2b_b = jtag_TMS;
  assign _bundleIn_0_TDI_a2b_b = jtag_TDI;
  assign jtag_TDO = _chiptop0_jtag_TDO;
  
  // UART
  assign uart_txd = _chiptop0_uart_0_txd;
  assign _bundleIn_0_rxd_a2b_b = uart_rxd;
  assign uart2_txd = _chiptop0_uart_1_txd;
  assign _bundleIn_0_rxd_a2b_1_b = uart2_rxd;

  // GPIO
  assign gpio_o0 = _chiptop0_gpio_0_pins_0_o_oval;
  assign gpio_o1 = _chiptop0_gpio_0_pins_1_o_oval;
  assign gpio_o2 = _chiptop0_gpio_0_pins_2_o_oval;
  assign gpio_o3 = _chiptop0_gpio_0_pins_3_o_oval;
  assign gpio_o4 = _chiptop0_gpio_0_pins_4_o_oval;
  assign gpio_o5 = _chiptop0_gpio_0_pins_5_o_oval;
  assign gpio_o6 = _chiptop0_gpio_0_pins_6_o_oval;
  assign gpio_o7 = _chiptop0_gpio_0_pins_7_o_oval;
  assign _bundleIn_0_pins_0_i_ival_a2b_b = gpio_i0;
  assign _bundleIn_0_pins_1_i_ival_a2b_b = gpio_i1;
  assign _bundleIn_0_pins_2_i_ival_a2b_b = gpio_i2;
  assign _bundleIn_0_pins_3_i_ival_a2b_b = gpio_i3;
  assign _bundleIn_0_pins_4_i_ival_a2b_b = gpio_i4;
  assign _bundleIn_0_pins_5_i_ival_a2b_b = gpio_i5;
  assign _bundleIn_0_pins_6_i_ival_a2b_b = gpio_i6;
  assign _bundleIn_0_pins_7_i_ival_a2b_b = gpio_i7;
  
  // SPI - SDCard
  assign sdio_spi_clk   = _chiptop0_spi_0_sck;
  assign sdio_spi_cs    = _chiptop0_spi_0_dq_0_o;
  assign sdio_spi_dat_3 = _chiptop0_spi_0_cs_0;
  assign _a2b_14_b = sdio_spi_dat_0;
  
  // SPI - Flash
  assign flash_qspi_sck = _chiptop0_qspi_0_sck;
  assign flash_qspi_cs  = _chiptop0_qspi_0_cs_0;
  assign flash_qspi_dq_o0 = _chiptop0_qspi_0_dq_0_o;
  assign flash_qspi_dq_o1 = _chiptop0_qspi_0_dq_1_o;
  assign flash_qspi_dq_o2 = _chiptop0_qspi_0_dq_2_o;
  assign flash_qspi_dq_o3 = _chiptop0_qspi_0_dq_3_o;
  assign _bundleIn_0_dq_0_i_a2b_b = flash_qspi_dq_i0;
  assign _bundleIn_0_dq_1_i_a2b_b = flash_qspi_dq_i1;
  assign _bundleIn_0_dq_2_i_a2b_b = flash_qspi_dq_i2;
  assign _bundleIn_0_dq_3_i_a2b_b = flash_qspi_dq_i3;
  
endmodule
