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

module AsyncQueue(
  input        io_enq_clock,
               io_enq_reset,
               io_enq_valid,
  input  [3:0] io_enq_bits,
  input        io_deq_clock,
               io_deq_reset,
               io_deq_ready,
  output       io_enq_ready,
               io_deq_valid,
  output [3:0] io_deq_bits
);

  wire [3:0] _sink_io_async_ridx;	// @[AsyncQueue.scala:225:70]
  wire       _sink_io_async_safe_ridx_valid;	// @[AsyncQueue.scala:225:70]
  wire       _sink_io_async_safe_sink_reset_n;	// @[AsyncQueue.scala:225:70]
  wire [3:0] _source_io_async_mem_0;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_1;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_2;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_3;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_4;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_5;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_6;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_mem_7;	// @[AsyncQueue.scala:224:70]
  wire [3:0] _source_io_async_widx;	// @[AsyncQueue.scala:224:70]
  wire       _source_io_async_safe_widx_valid;	// @[AsyncQueue.scala:224:70]
  wire       _source_io_async_safe_source_reset_n;	// @[AsyncQueue.scala:224:70]
  AsyncQueueSource source (	// @[AsyncQueue.scala:224:70]
    .clock                        (io_enq_clock),
    .reset                        (io_enq_reset),
    .io_enq_valid                 (io_enq_valid),
    .io_enq_bits                  (io_enq_bits),
    .io_async_ridx                (_sink_io_async_ridx),	// @[AsyncQueue.scala:225:70]
    .io_async_safe_ridx_valid     (_sink_io_async_safe_ridx_valid),	// @[AsyncQueue.scala:225:70]
    .io_async_safe_sink_reset_n   (_sink_io_async_safe_sink_reset_n),	// @[AsyncQueue.scala:225:70]
    .io_enq_ready                 (io_enq_ready),
    .io_async_mem_0               (_source_io_async_mem_0),
    .io_async_mem_1               (_source_io_async_mem_1),
    .io_async_mem_2               (_source_io_async_mem_2),
    .io_async_mem_3               (_source_io_async_mem_3),
    .io_async_mem_4               (_source_io_async_mem_4),
    .io_async_mem_5               (_source_io_async_mem_5),
    .io_async_mem_6               (_source_io_async_mem_6),
    .io_async_mem_7               (_source_io_async_mem_7),
    .io_async_widx                (_source_io_async_widx),
    .io_async_safe_widx_valid     (_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n (_source_io_async_safe_source_reset_n)
  );
  AsyncQueueSink sink (	// @[AsyncQueue.scala:225:70]
    .clock                        (io_deq_clock),
    .reset                        (io_deq_reset),
    .io_deq_ready                 (io_deq_ready),
    .io_async_mem_0               (_source_io_async_mem_0),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_1               (_source_io_async_mem_1),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_2               (_source_io_async_mem_2),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_3               (_source_io_async_mem_3),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_4               (_source_io_async_mem_4),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_5               (_source_io_async_mem_5),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_6               (_source_io_async_mem_6),	// @[AsyncQueue.scala:224:70]
    .io_async_mem_7               (_source_io_async_mem_7),	// @[AsyncQueue.scala:224:70]
    .io_async_widx                (_source_io_async_widx),	// @[AsyncQueue.scala:224:70]
    .io_async_safe_widx_valid     (_source_io_async_safe_widx_valid),	// @[AsyncQueue.scala:224:70]
    .io_async_safe_source_reset_n (_source_io_async_safe_source_reset_n),	// @[AsyncQueue.scala:224:70]
    .io_deq_valid                 (io_deq_valid),
    .io_deq_bits                  (io_deq_bits),
    .io_async_ridx                (_sink_io_async_ridx),
    .io_async_safe_ridx_valid     (_sink_io_async_safe_ridx_valid),
    .io_async_safe_sink_reset_n   (_sink_io_async_safe_sink_reset_n)
  );
endmodule

