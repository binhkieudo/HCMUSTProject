// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module SPIArbiter(
  input        clock,
               reset,
               io_inner_0_tx_valid,
  input  [7:0] io_inner_0_tx_bits,
               io_inner_0_cnt,
  input  [1:0] io_inner_0_fmt_proto,
  input        io_inner_0_fmt_endian,
               io_inner_0_fmt_iodir,
               io_inner_0_cs_clear,
               io_inner_0_lock,
               io_inner_1_tx_valid,
  input  [7:0] io_inner_1_tx_bits,
               io_inner_1_cnt,
  input  [1:0] io_inner_1_fmt_proto,
  input        io_inner_1_fmt_endian,
               io_inner_1_fmt_iodir,
               io_inner_1_cs_set,
               io_inner_1_cs_clear,
               io_inner_1_lock,
               io_outer_tx_ready,
               io_outer_rx_valid,
  input  [7:0] io_outer_rx_bits,
  input        io_outer_active,
               io_sel,
  output       io_inner_0_tx_ready,
               io_inner_0_rx_valid,
  output [7:0] io_inner_0_rx_bits,
  output       io_inner_0_active,
               io_inner_1_tx_ready,
               io_inner_1_rx_valid,
  output [7:0] io_inner_1_rx_bits,
  output       io_outer_tx_valid,
  output [7:0] io_outer_tx_bits,
               io_outer_cnt,
  output [1:0] io_outer_fmt_proto,
  output       io_outer_fmt_endian,
               io_outer_fmt_iodir,
               io_outer_cs_set,
               io_outer_cs_clear,
               io_outer_cs_hold
);

  reg  sel_0;	// @[SPIArbiter.scala:17:16]
  reg  sel_1;	// @[SPIArbiter.scala:17:16]
  wire lock = sel_0 & io_inner_0_lock | sel_1 & io_inner_1_lock;	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  always @(posedge clock) begin
    if (reset) begin
      sel_0 <= 1'h1;	// @[SPIArbiter.scala:17:16]
      sel_1 <= 1'h0;	// @[SPIArbiter.scala:17:16]
    end
    else if (~lock) begin	// @[Mux.scala:27:73]
      sel_0 <= ~io_sel;	// @[SPIArbiter.scala:17:16, :35:37]
      sel_1 <= io_sel;	// @[SPIArbiter.scala:17:16]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        sel_0 = _RANDOM_0[0];	// @[SPIArbiter.scala:17:16]
        sel_1 = _RANDOM_0[1];	// @[SPIArbiter.scala:17:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_inner_0_tx_ready = io_outer_tx_ready & sel_0;	// @[SPIArbiter.scala:17:16, :29:41]
  assign io_inner_0_rx_valid = io_outer_rx_valid & sel_0;	// @[SPIArbiter.scala:17:16, :30:41]
  assign io_inner_0_rx_bits = io_outer_rx_bits;
  assign io_inner_0_active = io_outer_active & sel_0;	// @[SPIArbiter.scala:17:16, :32:37]
  assign io_inner_1_tx_ready = io_outer_tx_ready & sel_1;	// @[SPIArbiter.scala:17:16, :29:41]
  assign io_inner_1_rx_valid = io_outer_rx_valid & sel_1;	// @[SPIArbiter.scala:17:16, :30:41]
  assign io_inner_1_rx_bits = io_outer_rx_bits;
  assign io_outer_tx_valid = sel_0 & io_inner_0_tx_valid | sel_1 & io_inner_1_tx_valid;	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_tx_bits = (sel_0 ? io_inner_0_tx_bits : 8'h0) | (sel_1 ? io_inner_1_tx_bits : 8'h0);	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_cnt = (sel_0 ? io_inner_0_cnt : 8'h0) | (sel_1 ? io_inner_1_cnt : 8'h0);	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_fmt_proto = (sel_0 ? io_inner_0_fmt_proto : 2'h0) | (sel_1 ? io_inner_1_fmt_proto : 2'h0);	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_fmt_endian = sel_0 & io_inner_0_fmt_endian | sel_1 & io_inner_1_fmt_endian;	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_fmt_iodir = sel_0 & io_inner_0_fmt_iodir | sel_1 & io_inner_1_fmt_iodir;	// @[Mux.scala:27:73, SPIArbiter.scala:17:16]
  assign io_outer_cs_set = sel_0 | io_inner_1_cs_set;	// @[SPIArbiter.scala:17:16, :24:21]
  assign io_outer_cs_clear = ~lock & {sel_1, sel_0} != {io_sel, ~io_sel} | (sel_0 ? io_inner_0_cs_clear : io_inner_1_cs_clear);	// @[Mux.scala:27:73, SPIArbiter.scala:17:16, :24:{15,21}, :35:37, :37:{9,16}, :39:{15,22,31,39}, :40:25]
  assign io_outer_cs_hold = sel_0;	// @[SPIArbiter.scala:17:16]
endmodule
