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

module PLICFanIn(
  input  [2:0]  io_prio_0,
                io_prio_1,
                io_prio_2,
                io_prio_3,
                io_prio_4,
                io_prio_5,
                io_prio_6,
                io_prio_7,
                io_prio_8,
                io_prio_9,
                io_prio_10,
                io_prio_11,
  input  [11:0] io_ip,
  output [3:0]  io_dev,
  output [2:0]  io_max
);

  wire [3:0] effectivePriority_1 = {io_ip[0], io_prio_0};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_2 = {io_ip[1], io_prio_1};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_3 = {io_ip[2], io_prio_2};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_4 = {io_ip[3], io_prio_3};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_5 = {io_ip[4], io_prio_4};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_6 = {io_ip[5], io_prio_5};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_7 = {io_ip[6], io_prio_6};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_8 = {io_ip[7], io_prio_7};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_9 = {io_ip[8], io_prio_8};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_10 = {io_ip[9], io_prio_9};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_11 = {io_ip[10], io_prio_10};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire [3:0] effectivePriority_12 = {io_ip[11], io_prio_11};	// @[Cat.scala:33:92, Plic.scala:349:55]
  wire       _T = effectivePriority_1 < 4'h9;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_2 = _T ? 4'h8 : effectivePriority_1;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:{20,57}]
  wire       _T_4 = effectivePriority_2 >= effectivePriority_3;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_6 = _T_4 ? effectivePriority_2 : effectivePriority_3;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_8 = _T_2 >= _T_6;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire [3:0] _T_10 = _T_8 ? _T_2 : _T_6;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_12 = effectivePriority_4 >= effectivePriority_5;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_14 = _T_12 ? effectivePriority_4 : effectivePriority_5;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_16 = effectivePriority_6 >= effectivePriority_7;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_18 = _T_16 ? effectivePriority_6 : effectivePriority_7;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_20 = _T_14 >= _T_18;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire [3:0] _T_22 = _T_20 ? _T_14 : _T_18;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_24 = _T_10 >= _T_22;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire [3:0] _T_26 = _T_24 ? _T_10 : _T_22;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_28 = effectivePriority_8 >= effectivePriority_9;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_30 = _T_28 ? effectivePriority_8 : effectivePriority_9;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_32 = effectivePriority_10 >= effectivePriority_11;	// @[Cat.scala:33:92, Plic.scala:345:20]
  wire [3:0] _T_34 = _T_32 ? effectivePriority_10 : effectivePriority_11;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_36 = _T_30 >= _T_34;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire [3:0] _T_38 = _T_36 ? _T_30 : _T_34;	// @[Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_40 = _T_38 >= effectivePriority_12;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire [3:0] _T_42 = _T_40 ? _T_38 : effectivePriority_12;	// @[Cat.scala:33:92, Misc.scala:34:9, Plic.scala:345:20]
  wire       _T_44 = _T_26 >= _T_42;	// @[Misc.scala:34:9, Plic.scala:345:20]
  assign io_dev = _T_44 ? {1'h0, _T_24 ? {1'h0, _T_8 ? {1'h0, ~_T} : {1'h1, ~_T_4}} : {1'h1, _T_20 ? {1'h0, ~_T_12} : {1'h1, ~_T_16}}} : {1'h1, _T_40 ? {1'h0, _T_36 ? {1'h0, ~_T_28} : {1'h1, ~_T_32}} : 3'h4};	// @[Misc.scala:34:36, Plic.scala:345:{20,57}, :349:32]
  assign io_max = _T_44 ? _T_26[2:0] : _T_42[2:0];	// @[Misc.scala:34:9, Plic.scala:345:20]
endmodule

