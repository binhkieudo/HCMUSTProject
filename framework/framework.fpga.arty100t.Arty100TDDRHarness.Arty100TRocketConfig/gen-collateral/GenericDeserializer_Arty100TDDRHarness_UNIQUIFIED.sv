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

module GenericDeserializer_Arty100TDDRHarness_UNIQUIFIED(
  input         clock,
                reset,
                io_in_valid,
  input  [3:0]  io_in_bits,
  input         io_out_ready,
  output        io_in_ready,
                io_out_valid,
  output [2:0]  io_out_bits_chanId,
                io_out_bits_opcode,
                io_out_bits_param,
  output [7:0]  io_out_bits_size,
                io_out_bits_source,
  output [63:0] io_out_bits_address,
                io_out_bits_data,
  output        io_out_bits_corrupt,
  output [8:0]  io_out_bits_union
);

  reg  [3:0] data_0;	// @[Serdes.scala:200:17]
  reg  [3:0] data_1;	// @[Serdes.scala:200:17]
  reg  [3:0] data_2;	// @[Serdes.scala:200:17]
  reg  [3:0] data_3;	// @[Serdes.scala:200:17]
  reg  [3:0] data_4;	// @[Serdes.scala:200:17]
  reg  [3:0] data_5;	// @[Serdes.scala:200:17]
  reg  [3:0] data_6;	// @[Serdes.scala:200:17]
  reg  [3:0] data_7;	// @[Serdes.scala:200:17]
  reg  [3:0] data_8;	// @[Serdes.scala:200:17]
  reg  [3:0] data_9;	// @[Serdes.scala:200:17]
  reg  [3:0] data_10;	// @[Serdes.scala:200:17]
  reg  [3:0] data_11;	// @[Serdes.scala:200:17]
  reg  [3:0] data_12;	// @[Serdes.scala:200:17]
  reg  [3:0] data_13;	// @[Serdes.scala:200:17]
  reg  [3:0] data_14;	// @[Serdes.scala:200:17]
  reg  [3:0] data_15;	// @[Serdes.scala:200:17]
  reg  [3:0] data_16;	// @[Serdes.scala:200:17]
  reg  [3:0] data_17;	// @[Serdes.scala:200:17]
  reg  [3:0] data_18;	// @[Serdes.scala:200:17]
  reg  [3:0] data_19;	// @[Serdes.scala:200:17]
  reg  [3:0] data_20;	// @[Serdes.scala:200:17]
  reg  [3:0] data_21;	// @[Serdes.scala:200:17]
  reg  [3:0] data_22;	// @[Serdes.scala:200:17]
  reg  [3:0] data_23;	// @[Serdes.scala:200:17]
  reg  [3:0] data_24;	// @[Serdes.scala:200:17]
  reg  [3:0] data_25;	// @[Serdes.scala:200:17]
  reg  [3:0] data_26;	// @[Serdes.scala:200:17]
  reg  [3:0] data_27;	// @[Serdes.scala:200:17]
  reg  [3:0] data_28;	// @[Serdes.scala:200:17]
  reg  [3:0] data_29;	// @[Serdes.scala:200:17]
  reg  [3:0] data_30;	// @[Serdes.scala:200:17]
  reg  [3:0] data_31;	// @[Serdes.scala:200:17]
  reg  [3:0] data_32;	// @[Serdes.scala:200:17]
  reg  [3:0] data_33;	// @[Serdes.scala:200:17]
  reg  [3:0] data_34;	// @[Serdes.scala:200:17]
  reg  [3:0] data_35;	// @[Serdes.scala:200:17]
  reg  [3:0] data_36;	// @[Serdes.scala:200:17]
  reg  [3:0] data_37;	// @[Serdes.scala:200:17]
  reg  [3:0] data_38;	// @[Serdes.scala:200:17]
  reg  [3:0] data_39;	// @[Serdes.scala:200:17]
  reg  [3:0] data_40;	// @[Serdes.scala:200:17]
  reg        receiving;	// @[Serdes.scala:202:26]
  reg  [5:0] recvCount;	// @[Counter.scala:61:40]
  wire       wrap_wrap = recvCount == 6'h28;	// @[Counter.scala:61:40, :73:24]
  wire       _T_1 = receiving & io_in_valid;	// @[Decoupled.scala:51:35, Serdes.scala:202:26]
  always @(posedge clock) begin
    if (_T_1 & recvCount == 6'h0)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_0 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_1 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h2)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_2 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h3)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_3 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h4)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_4 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h5)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_5 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h6)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_6 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h7)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_7 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h8)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_8 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h9)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_9 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hA)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_10 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hB)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_11 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hC)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_12 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hD)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_13 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hE)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_14 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'hF)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_15 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h10)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_16 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h11)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_17 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h12)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_18 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h13)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_19 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h14)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_20 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h15)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_21 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h16)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_22 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h17)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_23 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h18)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_24 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h19)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_25 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1A)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_26 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1B)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_27 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1C)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_28 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1D)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_29 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1E)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_30 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h1F)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_31 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h20)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_32 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h21)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_33 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h22)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_34 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h23)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_35 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h24)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_36 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h25)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_37 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h26)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_38 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h27)	// @[Counter.scala:61:40, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_39 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (_T_1 & recvCount == 6'h28)	// @[Counter.scala:61:40, :73:24, Decoupled.scala:51:35, Serdes.scala:200:17, :209:21, :210:21]
      data_40 <= io_in_bits;	// @[Serdes.scala:200:17]
    if (reset) begin
      receiving <= 1'h1;	// @[Serdes.scala:202:26]
      recvCount <= 6'h0;	// @[Counter.scala:61:40]
    end
    else begin
      receiving <= io_out_ready & ~receiving | ~(_T_1 & wrap_wrap) & receiving;	// @[Counter.scala:73:24, :117:24, :118:{16,23}, Decoupled.scala:51:35, Serdes.scala:202:26, :206:19, :213:{19,31}, :215:{22,34}]
      if (_T_1) begin	// @[Decoupled.scala:51:35]
        if (wrap_wrap)	// @[Counter.scala:73:24]
          recvCount <= 6'h0;	// @[Counter.scala:61:40]
        else	// @[Counter.scala:73:24]
          recvCount <= recvCount + 6'h1;	// @[Counter.scala:61:40, :77:24, Serdes.scala:210:21]
      end
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        data_0 = _RANDOM_0[3:0];	// @[Serdes.scala:200:17]
        data_1 = _RANDOM_0[7:4];	// @[Serdes.scala:200:17]
        data_2 = _RANDOM_0[11:8];	// @[Serdes.scala:200:17]
        data_3 = _RANDOM_0[15:12];	// @[Serdes.scala:200:17]
        data_4 = _RANDOM_0[19:16];	// @[Serdes.scala:200:17]
        data_5 = _RANDOM_0[23:20];	// @[Serdes.scala:200:17]
        data_6 = _RANDOM_0[27:24];	// @[Serdes.scala:200:17]
        data_7 = _RANDOM_0[31:28];	// @[Serdes.scala:200:17]
        data_8 = _RANDOM_1[3:0];	// @[Serdes.scala:200:17]
        data_9 = _RANDOM_1[7:4];	// @[Serdes.scala:200:17]
        data_10 = _RANDOM_1[11:8];	// @[Serdes.scala:200:17]
        data_11 = _RANDOM_1[15:12];	// @[Serdes.scala:200:17]
        data_12 = _RANDOM_1[19:16];	// @[Serdes.scala:200:17]
        data_13 = _RANDOM_1[23:20];	// @[Serdes.scala:200:17]
        data_14 = _RANDOM_1[27:24];	// @[Serdes.scala:200:17]
        data_15 = _RANDOM_1[31:28];	// @[Serdes.scala:200:17]
        data_16 = _RANDOM_2[3:0];	// @[Serdes.scala:200:17]
        data_17 = _RANDOM_2[7:4];	// @[Serdes.scala:200:17]
        data_18 = _RANDOM_2[11:8];	// @[Serdes.scala:200:17]
        data_19 = _RANDOM_2[15:12];	// @[Serdes.scala:200:17]
        data_20 = _RANDOM_2[19:16];	// @[Serdes.scala:200:17]
        data_21 = _RANDOM_2[23:20];	// @[Serdes.scala:200:17]
        data_22 = _RANDOM_2[27:24];	// @[Serdes.scala:200:17]
        data_23 = _RANDOM_2[31:28];	// @[Serdes.scala:200:17]
        data_24 = _RANDOM_3[3:0];	// @[Serdes.scala:200:17]
        data_25 = _RANDOM_3[7:4];	// @[Serdes.scala:200:17]
        data_26 = _RANDOM_3[11:8];	// @[Serdes.scala:200:17]
        data_27 = _RANDOM_3[15:12];	// @[Serdes.scala:200:17]
        data_28 = _RANDOM_3[19:16];	// @[Serdes.scala:200:17]
        data_29 = _RANDOM_3[23:20];	// @[Serdes.scala:200:17]
        data_30 = _RANDOM_3[27:24];	// @[Serdes.scala:200:17]
        data_31 = _RANDOM_3[31:28];	// @[Serdes.scala:200:17]
        data_32 = _RANDOM_4[3:0];	// @[Serdes.scala:200:17]
        data_33 = _RANDOM_4[7:4];	// @[Serdes.scala:200:17]
        data_34 = _RANDOM_4[11:8];	// @[Serdes.scala:200:17]
        data_35 = _RANDOM_4[15:12];	// @[Serdes.scala:200:17]
        data_36 = _RANDOM_4[19:16];	// @[Serdes.scala:200:17]
        data_37 = _RANDOM_4[23:20];	// @[Serdes.scala:200:17]
        data_38 = _RANDOM_4[27:24];	// @[Serdes.scala:200:17]
        data_39 = _RANDOM_4[31:28];	// @[Serdes.scala:200:17]
        data_40 = _RANDOM_5[3:0];	// @[Serdes.scala:200:17]
        receiving = _RANDOM_5[4];	// @[Serdes.scala:200:17, :202:26]
        recvCount = _RANDOM_5[10:5];	// @[Counter.scala:61:40, Serdes.scala:200:17]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_in_ready = receiving;	// @[Serdes.scala:202:26]
  assign io_out_valid = ~receiving;	// @[Serdes.scala:202:26, :206:19]
  assign io_out_bits_chanId = data_40[3:1];	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_opcode = {data_40[0], data_39[3:2]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_param = {data_39[1:0], data_38[3]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_size = {data_38[2:0], data_37, data_36[3]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_source = {data_36[2:0], data_35, data_34[3]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_address = {data_34[2:0], data_33, data_32, data_31, data_30, data_29, data_28, data_27, data_26, data_25, data_24, data_23, data_22, data_21, data_20, data_19, data_18[3]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_data = {data_18[2:0], data_17, data_16, data_15, data_14, data_13, data_12, data_11, data_10, data_9, data_8, data_7, data_6, data_5, data_4, data_3, data_2[3]};	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_corrupt = data_2[2];	// @[Serdes.scala:200:17, :207:38]
  assign io_out_bits_union = {data_2[1:0], data_1, data_0[3:1]};	// @[Serdes.scala:200:17, :207:38]
endmodule
