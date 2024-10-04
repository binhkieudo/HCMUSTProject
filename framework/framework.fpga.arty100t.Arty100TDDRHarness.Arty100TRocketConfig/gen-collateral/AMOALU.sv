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

module AMOALU(
  input  [7:0]  io_mask,
  input  [4:0]  io_cmd,
  input  [63:0] io_lhs,
                io_rhs,
  output [63:0] io_out_unmasked
);

  wire        _logic_xor_T_1 = io_cmd == 5'hA;	// @[AMOALU.scala:68:26]
  wire        logic_and = _logic_xor_T_1 | io_cmd == 5'hB;	// @[AMOALU.scala:68:{26,38,48}]
  wire        logic_xor = io_cmd == 5'h9 | _logic_xor_T_1;	// @[AMOALU.scala:68:26, :69:{26,39}]
  wire [63:0] adder_out_mask = {32'hFFFFFFFF, io_mask[3], 31'h7FFFFFFF};	// @[AMOALU.scala:73:{16,69,96}]
  assign io_out_unmasked = io_cmd == 5'h8 ? (io_lhs & adder_out_mask) + (io_rhs & adder_out_mask) : logic_and | logic_xor ? (logic_and ? io_lhs & io_rhs : 64'h0) | (logic_xor ? io_lhs ^ io_rhs : 64'h0) : ((io_mask[4] ? (io_lhs[63] == io_rhs[63] ? io_lhs[63:32] < io_rhs[63:32] | io_lhs[63:32] == io_rhs[63:32] & io_lhs[31:0] < io_rhs[31:0] : io_cmd[1] ? io_rhs[63] : io_lhs[63]) : io_lhs[31] == io_rhs[31] ? io_lhs[31:0] < io_rhs[31:0] : io_cmd[1] ? io_rhs[31] : io_lhs[31]) ? io_cmd == 5'hC | io_cmd == 5'hE : io_cmd == 5'hD | io_cmd == 5'hF) ? io_lhs : io_rhs;	// @[AMOALU.scala:65:{20,33,43}, :66:{20,33,43}, :67:20, :68:38, :69:39, :73:96, :74:{13,21,31}, :80:{26,35,38}, :81:{13,24,27,38,53,69}, :87:17, :89:{10,12,18,23,58}, :92:49, :95:{19,23}, :97:{8,27,42}, :98:{8,27}, :100:8, :101:{8,19}, Mux.scala:47:70]
endmodule

