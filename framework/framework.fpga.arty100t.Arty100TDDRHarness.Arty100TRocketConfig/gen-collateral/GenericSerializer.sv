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

module GenericSerializer(
  input         clock,
                reset,
                io_in_valid,
  input  [2:0]  io_in_bits_chanId,
                io_in_bits_opcode,
                io_in_bits_param,
  input  [7:0]  io_in_bits_size,
                io_in_bits_source,
  input  [63:0] io_in_bits_address,
                io_in_bits_data,
  input         io_in_bits_corrupt,
  input  [8:0]  io_in_bits_union,
  input         io_in_bits_last,
                io_out_ready,
  output        io_in_ready,
                io_out_valid,
  output [3:0]  io_out_bits
);

  reg  [163:0] data;	// @[Serdes.scala:173:17]
  reg          sending;	// @[Serdes.scala:175:24]
  reg  [5:0]   sendCount;	// @[Counter.scala:61:40]
  wire         wrap_wrap = sendCount == 6'h28;	// @[Counter.scala:61:40, :73:24]
  wire         _T_2 = io_out_ready & sending;	// @[Decoupled.scala:51:35, Serdes.scala:175:24]
  wire         _T_1 = ~sending & io_in_valid;	// @[Decoupled.scala:51:35, Serdes.scala:175:24, :178:18]
  always @(posedge clock) begin
    if (_T_2)	// @[Decoupled.scala:51:35]
      data <= {4'h0, data[163:4]};	// @[Serdes.scala:173:17, :187:37]
    else if (_T_1)	// @[Decoupled.scala:51:35]
      data <= {io_in_bits_chanId, io_in_bits_opcode, io_in_bits_param, io_in_bits_size, io_in_bits_source, io_in_bits_address, io_in_bits_data, io_in_bits_corrupt, io_in_bits_union, io_in_bits_last};	// @[Serdes.scala:173:17, :183:24]
    if (reset) begin
      sending <= 1'h0;	// @[Serdes.scala:173:17, :175:24]
      sendCount <= 6'h0;	// @[Counter.scala:61:40]
    end
    else begin
      sending <= ~(_T_2 & wrap_wrap) & (_T_1 | sending);	// @[Counter.scala:73:24, :117:24, :118:{16,23}, Decoupled.scala:51:35, Serdes.scala:175:24, :182:21, :184:13, :189:{19,29}]
      if (_T_2) begin	// @[Decoupled.scala:51:35]
        if (wrap_wrap)	// @[Counter.scala:73:24]
          sendCount <= 6'h0;	// @[Counter.scala:61:40]
        else	// @[Counter.scala:73:24]
          sendCount <= sendCount + 6'h1;	// @[Counter.scala:61:40, :77:24]
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
        data = {_RANDOM_0, _RANDOM_1, _RANDOM_2, _RANDOM_3, _RANDOM_4, _RANDOM_5[3:0]};	// @[Serdes.scala:173:17]
        sending = _RANDOM_5[4];	// @[Serdes.scala:173:17, :175:24]
        sendCount = _RANDOM_5[10:5];	// @[Counter.scala:61:40, Serdes.scala:173:17]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_in_ready = ~sending;	// @[Serdes.scala:175:24, :178:18]
  assign io_out_valid = sending;	// @[Serdes.scala:175:24]
  assign io_out_bits = data[3:0];	// @[Serdes.scala:173:17, :180:22]
endmodule

